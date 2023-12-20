Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D8581954D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 01:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657283.1026059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkTV-0004rO-VT; Wed, 20 Dec 2023 00:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657283.1026059; Wed, 20 Dec 2023 00:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkTV-0004pJ-SN; Wed, 20 Dec 2023 00:30:13 +0000
Received: by outflank-mailman (input) for mailman id 657283;
 Wed, 20 Dec 2023 00:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFkTU-0004pA-A2
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 00:30:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1b8c42-9ece-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 01:30:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1ED70CE018A;
 Wed, 20 Dec 2023 00:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AB0C433CA;
 Wed, 20 Dec 2023 00:30:04 +0000 (UTC)
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
X-Inumbo-ID: ee1b8c42-9ece-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703032205;
	bh=U6G+TyOuRTgq+x+mpDFA04GwlwYt/r+iNQONpaGNCP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t6FBzF4emoCB3FOwFnji/B2OmoRZlacFAc8pbbwPrfrA5LLZ/c1rCZm1JBue6Asy7
	 7T36sI8E0NaLfmHkDQQzDcnivBnwdgTJ7TCYolNU/z7N4Z+sHiGpiSngOJsNlgkpxn
	 RGqwiaNaMU9Tq+UoiRDWsAJtcbqjoiUvmowzhX2Iy+ZJOSwkxklYvsmeMAiCW5DJRI
	 4TT2v6yC5Hx8H3QRWNLebOPJCjLLEh8wqTPyurC/phP+DcOmyZM20BMECFWUOM6imC
	 o9XkeDUqfafo5G6zaEXLs6/MH2fGw4i0lImzoMj4GVg/cO2B77koQVqK/1CuYVV3ur
	 nvh5xC92edd/A==
Date: Tue, 19 Dec 2023 16:30:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/platform: tidy do_platform_op() a little
In-Reply-To: <c12f20a3-407c-4914-b6a0-1690962fd72c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312191626530.3175268@ubuntu-linux-20-04-desktop>
References: <c12f20a3-407c-4914-b6a0-1690962fd72c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Jan Beulich wrote:
> The function has a few stray scopes and inconsistent use (indentation)
> of break statements. Drop the stray braces and bring all the break-s in
> line with one another. This in particular means dropping a redundant
> break from XENPF_cpu_offline handling, pleasing Misra C:2012 rule 2.1.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01540.html.
> 
> A few more scopes could be eliminated if the various "cpu" variables
> were consolidated to switch() of function scope.
> 
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -258,7 +258,6 @@ ret_t do_platform_op(
>          break;
>  
>      case XENPF_add_memtype:
> -    {
>          ret = mtrr_add_page(
>              op->u.add_memtype.mfn,
>              op->u.add_memtype.nr_mfns,
> @@ -273,11 +272,9 @@ ret_t do_platform_op(
>              if ( ret != 0 )
>                  mtrr_del_page(ret, 0, 0);
>          }
> -    }
> -    break;
> +        break;
>  
>      case XENPF_del_memtype:
> -    {
>          if (op->u.del_memtype.handle == 0
>              /* mtrr/main.c otherwise does a lookup */
>              && (int)op->u.del_memtype.reg >= 0)
> @@ -288,8 +285,7 @@ ret_t do_platform_op(
>          }
>          else
>              ret = -EINVAL;
> -    }
> -    break;
> +        break;
>  
>      case XENPF_read_memtype:
>      {
> @@ -306,8 +302,8 @@ ret_t do_platform_op(
>              ret = __copy_field_to_guest(u_xenpf_op, op, u.read_memtype)
>                    ? -EFAULT : 0;
>          }
> +        break;
>      }
> -    break;
>  
>      case XENPF_microcode_update:
>      {
> @@ -316,8 +312,8 @@ ret_t do_platform_op(
>          guest_from_compat_handle(data, op->u.microcode.data);
>  
>          ret = microcode_update(data, op->u.microcode.length);
> +        break;
>      }
> -    break;
>  
>      case XENPF_platform_quirk:
>      {
> @@ -340,8 +336,8 @@ ret_t do_platform_op(
>              ret = -EINVAL;
>              break;
>          }
> +        break;
>      }
> -    break;

I think you should be able to remove this break completely?
And also in XENPF_set_processor_pminfo. That's because the is a switch
with a default label and a break.

Everything else checks out. Given that this is already a good
improvement as it is:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


