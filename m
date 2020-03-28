Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E47196500
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 11:20:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI8YG-0001yp-Vo; Sat, 28 Mar 2020 10:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xfs8=5N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jI8YF-0001yk-6d
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:18:51 +0000
X-Inumbo-ID: 84601076-70dd-11ea-8b2a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84601076-70dd-11ea-8b2a-12813bfff9fa;
 Sat, 28 Mar 2020 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585390730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eXsApnOF7kqaL7HXtYit0y+LvDW3YGwCsApVdTaBx7s=;
 b=bQtDPa3Vm13D1wfsD92RkNkem+KsjkmfnChrMWoocqMtene7BgUPxsdI
 HMtBLgawsp5NOVblPjyaETDAhQjHy0AtNJ7/8k5TJ9NWWGlqDjONuOTf8
 hyRT/muUkm4WK4aahUT0tGA2rb7uPC0KwLmIC7pDPbgIEIsT+UmtmCsMb Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zB/zRXMlDeCIgmioKB17D0JcqV3pYaSJqfwowxPfJ4W/vHfiaMWbDTzChkkzY8RYRVNULzjDnr
 F6BXsQNwgKaxOThao1gFWMEsa9fHHA/cZy1euGJ6/N/OlEnU/SG4HzpvmP9gbqV1Fo0b+3Hw1u
 UET5m0J1k5vJT3lw6L4hw0W3vjA8n5zbP1YXxi5R28KKLiP8yWI7vRvVUDZ6FNRBtkGLJ7zHk4
 Qw3czMU+EcmKqxjezgOUTStXCYyg7DGQ5edmX17BREHRcnBKOSAADCocUJzOR+3Tiv8knxg5rs
 Pb4=
X-SBRS: 2.7
X-MesageID: 15453714
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,316,1580792400"; d="scan'208";a="15453714"
Date: Sat, 28 Mar 2020 11:18:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200328101840.GN28601@Air-de-Roger>
References: <20200328053834.GA12753@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200328053834.GA12753@simran-Inspiron-5558>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Thanks!

On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index f049920196..a53d3ca2a4 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
>  u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
>  {
>      union vmcs_encoding enc;
> -    u64 *content = (u64 *) vvmcs;
> +    u64 *content = vvmcs;
>      int offset;
>      u64 res;
>  
> @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
>  void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
>  {
>      union vmcs_encoding enc;
> -    u64 *content = (u64 *) vvmcs;
> +    u64 *content = vvmcs;

While there, would you mind changing u64 to uint64_t? (here and
above)

>      int offset;
>      u64 res;
>  
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index eb66077496..058b9b8adf 100644
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -127,7 +127,7 @@ p2m_find_entry(void *table, unsigned long *gfn_remainder,
>          return NULL;
>      }
>      *gfn_remainder &= (1 << shift) - 1;
> -    return (l1_pgentry_t *)table + index;
> +    return table + index;

I don't think removing this cast is correct, as you would be doing a
plain addition to a pointer instead of fetching the next entry in the
array of l1_pgentry_t entries.

If you want to get rid of the cast here you need to change the type of
the table parameter to l1_pgentry_t * instead of void *.

Thanks, Roger.

