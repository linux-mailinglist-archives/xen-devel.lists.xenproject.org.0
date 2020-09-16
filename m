Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9626C315
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:05:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIX7F-00038n-Pl; Wed, 16 Sep 2020 13:04:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIX7D-00038b-St
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:04:51 +0000
X-Inumbo-ID: f085a86c-ca94-44fa-9c10-6da531a57f9e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f085a86c-ca94-44fa-9c10-6da531a57f9e;
 Wed, 16 Sep 2020 13:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600261491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gI9q2EWHsWTPpW3cuWHC9c47nFlwPISO5HnUnKwNBuc=;
 b=g3UKd8YGyu4mgwdzMoUIbAzvbioV82rIpLF2kWQWsYPgMjr6IDnyxMqx
 mEYLbh8oXVopdxmZQkjnu9VZAHWZiJPwnGEJbvmdwgMHYfXcKy9+znuFn
 4pu78MVNZweGnKD+sHq8GAHUb2VP+ddOEduzHrrXJqO8+iqc9Qd02gB6v o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H4zyf3dZ4GY4fvLrpZDu5Tn5yu9CULnCvCeWIUvoWwWWsY73SfhGpTblv1uCAK4p2Q05l7mdKC
 96t8VOoBB15fJojCcCmz66tbLBw5UBITtDe4+yZZ+gM8t/wf667VcaNBvCGellE3tbTiW3ZJKi
 AzBAu3tZ/8GYubhz4aMGlsMoeSXPNTR+pNflJpqz1B5rUGJij7H3kTKNYE21xINEPVGiHLSuLQ
 n8WQWLuHwzoJFdtRpgujOVuCFdMghKsWOb6HPfPxci4mFDdb+3AVO+sj+gMM4m87OV00VPzY4U
 W1Q=
X-SBRS: 2.7
X-MesageID: 26827281
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,432,1592884800"; d="scan'208";a="26827281"
Date: Wed, 16 Sep 2020 15:04:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
Message-ID: <20200916130439.GV753@Air-de-Roger>
References: <20200916105426.6663-1-roger.pau@citrix.com>
 <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 16, 2020 at 02:55:52PM +0200, Jan Beulich wrote:
> On 16.09.2020 12:54, Roger Pau Monne wrote:
> > Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
> > and injecting a #GP fault will result in a panic:
> > 
> > svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
> > d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
> > 
> > Return 0 when trying to read the MSR and drop writes.
> 
> So I've gone through a bunch of BKDGs and PPRs, without finding
> this MSR mentioned in any of them. Could you point out on which
> model(s) it actually exists? You must have found it somewhere,
> or else you wouldn't know a name for it...

Yes, sorry it took me a while to find it also, and I should have added
a reference here. It's in "BIOS and Kernel Developer’s Guide (BKDG)
for AMD Family 15h Models 00h-0Fh Processors", albeit Windows will try
to access it on Family 17h also.

> > @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >      case MSR_K8_TOP_MEM2:
> >      case MSR_K8_SYSCFG:
> >      case MSR_K8_VM_CR:
> > +    case MSR_AMD64_EX_CFG:
> >          /* ignore write. handle all bits as read-only. */
> >          break;
> 
> Is this necessary, rather than having writes fault?

Hm, I'm not sure about that. This is the same that KVM did to handle
the MSR, see Linux commit 0e1b869fff60c81b510c2d00602d778f8f59dd9a.

I can try to return #GP for writes, but I don't see much issue in just
ignoring writes.

> > --- a/xen/include/asm-x86/msr-index.h
> > +++ b/xen/include/asm-x86/msr-index.h
> > @@ -330,6 +330,7 @@
> >  #define MSR_AMD64_DC_CFG		0xc0011022
> >  #define MSR_AMD64_DE_CFG		0xc0011029
> >  #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
> > +#define MSR_AMD64_EX_CFG                0xc001102c
> 
> Indentation here wants to match the siblings, i.e. use hard tabs
> (for now). Easily addressed while committing, of course.

Oh, sure, sorry for not realizing.

Thanks, Roger.

