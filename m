Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10141B16C4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 22:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQcqD-0004Ph-KE; Mon, 20 Apr 2020 20:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQcqB-0004Pc-PW
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 20:16:27 +0000
X-Inumbo-ID: cf9b0366-8343-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf9b0366-8343-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587413786;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rJtPC9jEQ7HMhkdwEUNWy89ojiD+bLtbYIASQqupK0k=;
 b=Y91Zxz52guWIhUzzPwklz3aym1iMW7hSA9FPIr3bx5yM6u0qHsVVG2v8
 YHzYqauFoyNkVZnLCyedsBFP83l0v9uYema7E9DIWJHMsPEFCzbw/z0Gk
 DEY6ih4oao3Vh2OO1l+hTw7M1MjJM2gF5AuLTan1FFkgiRzMWZFMEtohp s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /dOe95GmuvgxQQ4GhwR5PsLp95YmUUW9vYZ/EyeR438RJe+7wjQX2Axj8x41b+wmJNNBTPfR6n
 95mjKbV49J+IxTZUUh1xiODfVxWztr7jZZr090wDIi3rKNeCaTr7KlQ64N2q6Z389+rSfpC0DG
 w+mD0aFVQ19LgyX4HP1SN4FfmG8i8CufUEpvIWFEtq7Ajttzn1uX8jzqZpFhZfL+nYYMgR+ID+
 oRwbJok5fW5yImjg1c/WFXs7meQYKCusM4EGYiTYDVHT8qCySj2va4rUwc9o2UjBc5GeEV6VLa
 Ttw=
X-SBRS: 2.7
X-MesageID: 16212393
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16212393"
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <92aedd0d-fcb0-2c6b-6586-5d859333575d@citrix.com>
Date: Mon, 20 Apr 2020 21:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 12:34, Jan Beulich wrote:
> In preparation for the addition of VMASST_TYPE_runstate_update_flag
> commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
> the hypercall for Arm. I consider it not logical that it then isn't also
> exposed to x86 HVM guests (with the same single feature permitted to be
> enabled as Arm has); Linux actually tries to use it afaict.
>
> Rather than introducing yet another thin wrapper around vm_assist(),
> make that function the main handler, requiring a per-arch
> arch_vm_assist_valid() definition instead.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-work vm_assist() handling/layering at the same time. Also adjust
>     arch_set_info_guest().

Much nicer.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
>      return rc;
>  }
>  
> -#ifdef VM_ASSIST_VALID
> -long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
> -               unsigned long valid)
> +#ifdef arch_vm_assist_valid
> +long do_vm_assist(unsigned int cmd, unsigned int type)
>  {
> +    struct domain *currd = current->domain;
> +    const unsigned long valid = arch_vm_assist_valid(currd);
> +
>      if ( type >= BITS_PER_LONG || !test_bit(type, &valid) )
>          return -EINVAL;

As a thought, would it be better to have a guest_bits_per_long()
helper?  This type >= BITS_PER_LONG isn't terribly correct for 32bit
guests, and it would avoid needing the truncation in the arch helper,
which is asymmetric on the ARM side.

~Andrew

