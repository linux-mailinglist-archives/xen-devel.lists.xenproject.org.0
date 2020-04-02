Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C719CA81
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 21:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK5q6-00008B-Ad; Thu, 02 Apr 2020 19:49:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK5q4-000084-HB
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 19:49:20 +0000
X-Inumbo-ID: 0aaf6e2e-751b-11ea-bc44-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aaf6e2e-751b-11ea-bc44-12813bfff9fa;
 Thu, 02 Apr 2020 19:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585856959;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tJwoL6aTNYaILi/LbqxbNGMoSAw9V8aOHaftap4s9bM=;
 b=FCFaWbIbo9X09kOf9oCKquGduQ0fHPXDzU2RQ/oWeH9eiU5WuMrOpgvh
 XT3vHHeDQazCo3dNxUC3ENe4vINFKwAls8p6Hcss67OHWFQhhdNPeQynt
 osIds0byMs5lXBPq5jQjEIC0eApfO4eMCOdOHwQraMrzPUu7KCyCG2hly k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sdY2LuPCHrQmywvJLp0ILQqrHF4lI+0tzB21uVV4oBpfM+EGOvIauixN8Uc0eicqLbGTVTobtO
 ZU2TP6th5i75N3o0W+ikk2UurO6dqsV9O0jDtbgf9+Jv1GLSEXualGyGV3CxshMulCdla2MKef
 2PYRiZqmu5ZK/W/domGY3idJhGar00xRu5a2JVKlVg7xLpggsSHOyR86jgZy8TGUIT/SwlkPCM
 UksnUAjd4rxRiK80Hje+15FrHBkpcKIaQjnybFDn807gBuOlfttItk7i/mGnWTOusia//tMu2F
 JhU=
X-SBRS: 2.7
X-MesageID: 15418425
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15418425"
Subject: Re: [PATCH] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cb4a6f8f-eda8-f17c-54e5-af1353d6358c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <18adfe82-4882-c835-cd1d-b3069416e0ab@citrix.com>
Date: Thu, 2 Apr 2020 20:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cb4a6f8f-eda8-f17c-54e5-af1353d6358c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 08:46, Jan Beulich wrote:
> In preparation for the addition of VMASST_TYPE_runstate_update_flag
> commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
> the hypercall for Arm. I consider it not logical that it then isn't also
> exposed to x86 HVM guests (with the same single feature permitted to be
> enabled as Arm has); Linux actually tries to use it afaict.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd declare this a bug in 2529c850ea4.  It was clearly intended as a
common feature, and wasn't tested for HVM guests.

However, ...

>
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -78,6 +78,11 @@ static long hvm_grant_table_op(
>  }
>  #endif
>  
> +static long hvm_vm_assist(unsigned int cmd, unsigned int type)
> +{
> +    return vm_assist(current->domain, cmd, type, HVM_VM_ASSIST_VALID);
> +}
> +
>  static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      const struct vcpu *curr = current;
> @@ -128,6 +133,7 @@ static const hypercall_table_t hvm_hyper
>  #ifdef CONFIG_GRANT_TABLE
>      HVM_CALL(grant_table_op),
>  #endif
> +    HVM_CALL(vm_assist),

... this means we've now got 3 stub functions making no-op ABI changes
for the general vm_assist() function.

Renaming it to do_vm_assist(), latch current->domain internally, and an
arch_vm_assist_valid(d) helper can cover the final parameter.

~Andrew

>      COMPAT_CALL(vcpu_op),
>      HVM_CALL(physdev_op),
>      COMPAT_CALL(xen_version),
> --- a/xen/include/asm-x86/config.h
> +++ b/xen/include/asm-x86/config.h
> @@ -319,6 +319,7 @@ extern unsigned long xen_phys_start;
>  #define VM_ASSIST_VALID          NATIVE_VM_ASSIST_VALID
>  #define COMPAT_VM_ASSIST_VALID   (NATIVE_VM_ASSIST_VALID & \
>                                    ((1UL << COMPAT_BITS_PER_LONG) - 1))
> +#define HVM_VM_ASSIST_VALID      (1UL << VMASST_TYPE_runstate_update_flag)
>  
>  #define ELFSIZE 64
>  


