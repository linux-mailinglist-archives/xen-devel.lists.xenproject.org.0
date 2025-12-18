Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0DCCC54D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 15:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189755.1510474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFIF-0005gG-CC; Thu, 18 Dec 2025 14:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189755.1510474; Thu, 18 Dec 2025 14:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFIF-0005dA-9W; Thu, 18 Dec 2025 14:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1189755;
 Thu, 18 Dec 2025 14:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sWj=6Y=bounce.vates.tech=bounce-md_30504962.6944140e.v1-8714dd6c4f2045cda88ee93a1981ca80@srs-se1.protection.inumbo.net>)
 id 1vWFIE-0005d2-Hl
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 14:47:50 +0000
Received: from mail137-31.atl71.mandrillapp.com
 (mail137-31.atl71.mandrillapp.com [198.2.137.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 828ef504-dc20-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 15:47:44 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-31.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dXD6Q337jz7lmRj8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 14:47:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8714dd6c4f2045cda88ee93a1981ca80; Thu, 18 Dec 2025 14:47:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 828ef504-dc20-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766069262; x=1766339262;
	bh=ERqb2O7Mon4Rnq2ikf7KB+qMfBBBYPzBn/QbCL2RHpY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=apXgbyHBl7bZtRwpfr1HxKHS3eq7y+3X0BQVe1CIJD2rJTvdZrCgMC8I+HBtoGdmd
	 k5lJq6uERZg8yfeG+OSGKza5CsHmDbMbGKZM1y48+QlCmzybvVfZmGTlQw/AMkSfwm
	 DUuaR5MDBrVpBdf3QeHZp8sHNFi7BtSjJ3YMEx4WFq0PVXBsIPj9bkBRXVjQe2Oo17
	 7ZChjwxotxMMv3igdWalhipipnaih0pEnJq1ZcbO0QJeTuFvXPcrsNhNI3wLEfkiEQ
	 BfPftETWc/vefJuVMPYvEs23PE4SijOK9gvsObxWDvoajFP7tFhi35Hn7KdQ2e1Nfe
	 c1VI0CkA/Y/JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766069262; x=1766329762; i=teddy.astie@vates.tech;
	bh=ERqb2O7Mon4Rnq2ikf7KB+qMfBBBYPzBn/QbCL2RHpY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hfZDNDghqzU39BTW+Xyi5TQHF+KNDLShKD907AM7k/PCKEoxkxDAzBfiHZ0evew10
	 pp8fG0eFijEskeJ4rLCCO6DFE+8hIU90x8KRQaEfeQm9eHz0g7JwPPVKYi2C+7hpIh
	 beFc0I00lMv3mnpl4LWwxisuv68CiuKfTdeIy6oqUahFJCUKwhbf5rvCHTHdBos8UF
	 tzrP+qgUGRRELeBU3WaftGzP3fOTW4Z4kNmDRuHk0mihUafQNx10fcmTdmBizKT9Wb
	 1ME8A6f0P85uUtVnp+P2wdmZ5JaB5CTrsqXZNYNrPWe7s4Ck7KDYoHp/I6mZiC65Pn
	 1OnCzq7p79Zwg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH=20v5]=20xen/x86:=20guest=5Faccess:=20optimize=20raw=5Fx=5Fguest()=20for=20PV=20and=20HVM=20combinations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766069260671
Message-Id: <a220ce20-9f1f-4310-b5f3-680c1dad6d2d@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
References: <20251218135926.188059-1-grygorii_strashko@epam.com>
In-Reply-To: <20251218135926.188059-1-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8714dd6c4f2045cda88ee93a1981ca80?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251218:md
Date: Thu, 18 Dec 2025 14:47:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 18/12/2025 =C3=A0 15:01, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>      (is_hvm_vcpu(current) ?                     \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=3Dy and HVM=3Dy
>    Proper guest access function is selected depending on domain type.
> - PV=3Dy and HVM=3Dn
>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "f=
alse"
>    and compiler will optimize code and skip HVM specific part.

> - PV=3Dn and HVM=3Dy
>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be consti=
fied.
>    No PV specific code will be optimized by compiler.
> - PV=3Dn and HVM=3Dn
>    No guests should possible. The code will still follow PV path.
> 

^ regarding this

> For the case (PV=3Dn and HVM=3Dn) return "len" value indicating a failure=
 (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).
> 

^ and this

AFAIU it is the same for PV=3Dn and HVM=3Dy for non-HVM domains (the few 
that "exists"), so we should rather say that these functions fails on 
"non-HVM" domains in PV=3Dn configurations (since no actual PV domain 
exists in these cases).

IOW, there is no PV path in PV=3Dn configurations and in !HVM domains, the 
function fails instead (as we would expect).

Once the commit message is adjusted on this
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

> The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is=
 about -11K.
> 
> [teddy.astie@vates.tech: Suggested to use static inline functions vs
> macro combinations]
> Suggested-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v5:
> - rebase
> - drop moving usercopy.c as it is not needed since commit 7370966d1cb7
>    ("x86: move / split usercopy.c to / into arch-specific library")
> 
> changes in v4:
> - move usercopy.c into arch/x86/pv/
> - rework to always dynamically check for HVM vcpu(domain) by using is_hvm=
_vcpu()
>    as requested by Jan Beulich
> 
> changes in v3:
> - add raw_use_hvm_access() wrapper
> 
> changes in v2:
> - use static inline functions instead of macro combinations
> 
>   xen/arch/x86/include/asm/guest_access.h | 78 ++++++++++++++++++-------
>   1 file changed, 58 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/inclu=
de/asm/guest_access.h
> index 69716c8b41bb..f0e56b112e14 100644
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,26 +13,64 @@
>   #include <asm/hvm/guest_access.h>
>   
>   /* Raw access functions: no type checking. */
> -#define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     copy_to_guest_pv(dst, src, len))
> -#define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     copy_from_guest_pv(dst, src, len))
> -#define raw_clear_guest(dst,  len)              \
> -    (is_hvm_vcpu(current) ?                     \
> -     clear_user_hvm((dst), (len)) :             \
> -     clear_guest_pv(dst, len))
> -#define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     __copy_to_guest_pv(dst, src, len))
> -#define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     __copy_from_guest_pv(dst, src, len))
> +static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
> +                                             unsigned int len)
> +{
> +    if ( is_hvm_vcpu(current) )
> +        return copy_to_user_hvm(dst, src, len);
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return len;
> +
> +    return copy_to_guest_pv(dst, src, len);
> +}
> +
> +static inline unsigned int raw_copy_from_guest(void *dst, const void *sr=
c,
> +                                               unsigned int len)
> +{
> +    if ( is_hvm_vcpu(current) )
> +        return copy_from_user_hvm(dst, src, len);
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return len;
> +
> +    return copy_from_guest_pv(dst, src, len);
> +}
> +
> +static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
> +{
> +    if ( is_hvm_vcpu(current) )
> +        return clear_user_hvm(dst, len);
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return len;
> +
> +    return clear_guest_pv(dst, len);
> +}
> +
> +static inline unsigned int __raw_copy_to_guest(void *dst, const void *sr=
c,
> +                                               unsigned int len)
> +{
> +    if ( is_hvm_vcpu(current) )
> +        return copy_to_user_hvm(dst, src, len);
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return len;
> +
> +    return __copy_to_guest_pv(dst, src, len);
> +}
> +
> +static inline unsigned int __raw_copy_from_guest(void *dst, const void *=
src,
> +                                                 unsigned int len)
> +{
> +    if ( is_hvm_vcpu(current) )
> +        return copy_from_user_hvm(dst, src, len);
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return len;
> +
> +    return __copy_from_guest_pv(dst, src, len);
> +}
>   
>   /*
>    * Pre-validate a guest handle.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



