Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4926C36A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 15:54:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIXsf-0000Bx-T1; Wed, 16 Sep 2020 13:53:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIXsf-0000Bs-D4
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:53:53 +0000
X-Inumbo-ID: 132a2284-daa9-4559-91a7-33fe1b2bc86e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 132a2284-daa9-4559-91a7-33fe1b2bc86e;
 Wed, 16 Sep 2020 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600264432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BtqqpaBXtZevxLIhqNHjCv5dM0Jj/cQnPYuKJyJyelM=;
 b=UIrG6oockJ+JliGoO3KtIQ7gF6h++75uJqL96apgmiPSbSi/cno54Brg
 Z8mdsSQbtE9rSIC26F5N7c5BEiFcSU5PBvWjSHMp6nspB+lCAYHcMtS86
 y11cMafRlEC5ctgYxsgIooZ40yDXPRLkYT9ZxzFk8zsP/SlphwoF6/KsS 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OQQ5Bj61Joo2u0n1y9MxhU9w3ctQJfTi3aY0gwV5gFj3B01MwcjnWauRlM3SbsoSaWQLxYdZio
 U/54aKywxcMFbwrxIZ2/VLX3RZGkz31GlbyjlYYpjWp1UtPxUWeyUyLOiVDKVgxR8OnUdZDfAM
 oDlGdbAtLyE3PWzDxrwSO1682n/J9B9mg+5TMoSAqVbEB+PfN+mUJtlQRhZRY1eQmo0k3qbnyC
 iJ7uLj4K2o+oOhsWcC+yS/kF01DaGpFfu1q4gdvrzJf3kqGIg19DZk7vwDLol1juseOCDi8KFy
 PwM=
X-SBRS: 2.7
X-MesageID: 26806110
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,433,1592884800"; d="scan'208";a="26806110"
Date: Wed, 16 Sep 2020 15:53:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
Message-ID: <20200916135343.GW753@Air-de-Roger>
References: <20200916105426.6663-1-roger.pau@citrix.com>
 <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
 <20200916130439.GV753@Air-de-Roger>
 <33778785-830b-af08-ec64-4a08db92e693@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33778785-830b-af08-ec64-4a08db92e693@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Wed, Sep 16, 2020 at 03:28:28PM +0200, Jan Beulich wrote:
> On 16.09.2020 15:04, Roger Pau Monné wrote:
> > On Wed, Sep 16, 2020 at 02:55:52PM +0200, Jan Beulich wrote:
> >> On 16.09.2020 12:54, Roger Pau Monne wrote:
> >>> Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
> >>> and injecting a #GP fault will result in a panic:
> >>>
> >>> svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
> >>> d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
> >>>
> >>> Return 0 when trying to read the MSR and drop writes.
> >>
> >> So I've gone through a bunch of BKDGs and PPRs, without finding
> >> this MSR mentioned in any of them. Could you point out on which
> >> model(s) it actually exists? You must have found it somewhere,
> >> or else you wouldn't know a name for it...
> > 
> > Yes, sorry it took me a while to find it also, and I should have added
> > a reference here. It's in "BIOS and Kernel Developer’s Guide (BKDG)
> > for AMD Family 15h Models 00h-0Fh Processors", albeit Windows will try
> > to access it on Family 17h also.
> 
> Ah, and it's exclusively this one as it seems. The models 1xh one
> again doesn't have it.
> 
> >>> @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >>>      case MSR_K8_TOP_MEM2:
> >>>      case MSR_K8_SYSCFG:
> >>>      case MSR_K8_VM_CR:
> >>> +    case MSR_AMD64_EX_CFG:
> >>>          /* ignore write. handle all bits as read-only. */
> >>>          break;
> >>
> >> Is this necessary, rather than having writes fault?
> > 
> > Hm, I'm not sure about that. This is the same that KVM did to handle
> > the MSR, see Linux commit 0e1b869fff60c81b510c2d00602d778f8f59dd9a.
> 
> Looking at the sole bit that's defined there, I agree the main reason
> for Win10 to read it would look to be to potentially also write it if
> it finds certain bits unset. If so, perhaps we want to consider to
> report a value with this/these bit(s) set?

So the manual only reports the meaning of bit 54, yet my EPYC system
reports 0x0168000000000000.

> > I can try to return #GP for writes, but I don't see much issue in just
> > ignoring writes.
> 
> The reason for me asking is that I'd prefer if we didn't grow an
> endless list of exceptions for no reason. In fact I wonder whether
> some MSRs that we currently ignore writes for couldn't be dropped.

Let me see if I can make Windows happy by returning either bit 54 as 0
or 1, but given the value on bare metal I'm worried that Windows has
more insight on this value than just bit 54.

Thanks, Roger.

