Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0FD24A286
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 17:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8PhK-0001Ap-F9; Wed, 19 Aug 2020 15:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHFf=B5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8PhI-0001Ak-Ve
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 15:08:17 +0000
X-Inumbo-ID: c2343424-0905-4836-bbbb-7a003046b93a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2343424-0905-4836-bbbb-7a003046b93a;
 Wed, 19 Aug 2020 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597849696;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Cqf7x8J8sVgXj15KcpvexnLpJ/tkV2EDlEHEFJL9Cfo=;
 b=f36reL635/0iPAUAPNT/9uSl7y+Pg+ooYGTX+oP8eNGenIRSuMwm3jGs
 yy01NG/teV4l41mCvnpX85qsP7PZxgo2bf5q6biqcacJgF9KOedfo/7wg
 1UrvtWsHpbUjc8GvbmQjZXRIk+gbBtjgybqBPuvhBvb0klbqheSy6hBc3 c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: a2IlXx1zgO/GZAE6s00NMOBUdhjuh31/JCkxYsDum1FLvwAh6bk8yTd/c/DSyLXi4T9xEZo29F
 yw3iC2W3ntWHEdiGLC9m04fsujyxEGCS51/CQzinCQDNBLYThZ1/GUzIzRd52DSnencgKgURhj
 GGlFGS37IdTLNY3HX3rZmxzJDYf+Lsnkro2zVmn2J2z9y/23mDLnHKx30Se44CqLvrge4hcLKF
 xnxFBHkjijSjJt5VA/N3mYJhb/sIbc0qlOwO2SIonRjyYYMFCkl2oK5p8FM/3+OMUH7zdAdFS2
 7Jo=
X-SBRS: 2.7
X-MesageID: 25204771
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25204771"
Date: Wed, 19 Aug 2020 17:07:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/svm: silently drop writes to SYSCFG and related
 MSRs
Message-ID: <20200819150759.GS828@Air-de-Roger>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-3-roger.pau@citrix.com>
 <667ecceb-e111-5da5-74f9-9b1cc8628a6a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <667ecceb-e111-5da5-74f9-9b1cc8628a6a@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Tue, Aug 18, 2020 at 03:53:16PM +0100, Andrew Cooper wrote:
> On 17/08/2020 16:57, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> > index ca3bbfcbb3..671cdcb724 100644
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -1917,6 +1917,13 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >              goto gpf;
> >          break;
> >  
> > +    case MSR_K8_TOP_MEM1:
> > +    case MSR_K8_TOP_MEM2:
> > +    case MSR_K8_SYSCFG:
> > +        /* Return all 0s. */
> > +        *msr_content = 0;
> 
> On a Rome box, these are the normal values:
> 
> 0xc0010010 (SYSCFG) 0x740000
> 0xc001001a (MEM1) 0xb0000000
> 0xc001001d (MEM2) 0x3c50000000
> 
> The SYSCFG bits are MtrrFixDramEn[18], MtrrVarDramEn[20], MtrrTom2En[21]
> and Tom2ForceMemTypeWB[22].  In particular, bits 18 and 20 are expected
> to be set by the system firmware.
> 
> Clearly we shouldn't be leaking TOP_MEM{1,2} into guests, but Xen also
> doesn't have enough information to set these correctly yet either.
> 
> At a minimum, I think SYSCFG wants to report 0x40000 which means "the
> fixed MTRRs behave as expected", and the other bits being clear should
> mean that TOP_MEM{1,2} aren't enabled.

I didn't enable MtrrFixDramEn because AFAICT the emulated MTRR
implementation doesn't support the usage of the Extended type-field
format, and hence those bits will be 0. I'm fine with returning having
it set, as long as we don't allow setting MtrrFixDramModEn[19].

Thanks, Roger.

