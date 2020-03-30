Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02407197C42
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 14:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jItpa-0004TF-Pi; Mon, 30 Mar 2020 12:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vI0s=5P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jItpZ-0004T8-QL
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 12:47:53 +0000
X-Inumbo-ID: ab8d721c-7284-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab8d721c-7284-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585572473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pBcZ8xciQ0CpoZTi3CLSDDrdcAp7nAxm3yDTGKRSrn0=;
 b=KBBX0xTRJuzPAH/XW+s8Wml8QxgNxin9ARq0M8Zl/FQP9ra9lByB4xUe
 PzsZiWpJL9ovdKtfD99FATbqbuEolSIzQnRUPxexW2QZRf5JRd6mmnGNT
 UX7LqNNozE7qbAgWYKzAE1zP0h7z4+jKk0/ZXE9HOeTMQe1KEphHv8lxc o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uQG7Z0mf5yd1yj6Xlbph/NIsraZ6PwD+bFmBjQ3AdaBMQdUHM2lnIGrQ7lgAx8mP/h1tIlZgHA
 tApzHFcx5AFASR1t81h5xznaQl2dOPz57G2/1w1vAM6nGzD8HN7w11zkqXILgQilILCyws0lMH
 bYd61wSvYDVpH9WESUi3XK/rmUDB6spxonMQK8UH4VVzD+/Yw34q3igp+242LnYAbgEOUXCOn0
 UUxkhCAt3635attMv5rgdHzBJnwigwXCtyWeFmqJrBpSfG63LanpLGJk3zZdKWpPhKqRsWViyM
 FRU=
X-SBRS: 2.7
X-MesageID: 15183355
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="15183355"
Date: Mon, 30 Mar 2020 14:47:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200330124742.GS28601@Air-de-Roger>
References: <20200329045512.GA28203@simran-Inspiron-5558>
 <20200330101113.GP28601@Air-de-Roger>
 <74649c0b-90b3-a6fb-4781-026202b92527@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74649c0b-90b3-a6fb-4781-026202b92527@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Simran Singhal <singhalsimran0@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 30, 2020 at 01:09:20PM +0200, Jan Beulich wrote:
> On 30.03.2020 12:11, Roger Pau Monné wrote:
> > On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
> >> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> >> index f049920196..2edb103205 100644
> >> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> >> @@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
> >>      return offset;
> >>  }
> >>  
> >> -u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> >> +uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
> >>  {
> >>      union vmcs_encoding enc;
> >> -    u64 *content = (u64 *) vvmcs;
> >> +    uint64_t *content = vvmcs;
> >>      int offset;
> >> -    u64 res;
> >> +    uint64_t res;
> >>  
> >>      enc.word = vmcs_encoding;
> >>      offset = vvmcs_offset(enc.width, enc.type, enc.index);
> >> @@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
> >>      return virtual_vmcs_vmread_safe(v, encoding, val);
> >>  }
> >>  
> >> -void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> >> +void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
> >>  {
> >>      union vmcs_encoding enc;
> >> -    u64 *content = (u64 *) vvmcs;
> >> +    uint64_t *content = vvmcs;
> >>      int offset;
> >> -    u64 res;
> >> +    uint64_t res;
> > 
> > Thanks for doing the switch of content to type uint64_t. You should
> > however not change the type of res to uint64_t also IMO, as you are
> > not touching that line anyway.
> 
> I actually wouldn't mind the patch being left as is?
> 
> > With that fixed:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Roger - please clarify if your R-b is also fine without the requested
> adjustment.

Yes, TBH I was borderline on requesting the change, as the type change
is correct.

Roger.

