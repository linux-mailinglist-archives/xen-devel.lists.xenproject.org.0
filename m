Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EDCB406B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 22:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183351.1506080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRM3-0005BD-9U; Wed, 10 Dec 2025 21:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183351.1506080; Wed, 10 Dec 2025 21:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRM3-00058u-6v; Wed, 10 Dec 2025 21:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1183351;
 Wed, 10 Dec 2025 21:04:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTRM1-00058o-AN
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 21:04:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3a99718-d60b-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 22:04:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 868724EEBC5F;
 Wed, 10 Dec 2025 22:04:05 +0100 (CET)
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
X-Inumbo-ID: c3a99718-d60b-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765400645;
	b=UVWQKr7i3CEPZbe9jcgNIAApjOf9xxsp9ncE23f+5PapjejdqOknjp7GnQGtRdQoONNA
	 rSRTtz+FYa+k2yLgt47tfP4odngiyc43fijlSOfD26sT+iFl+jgruwqS5azjAQdBgeQ1c
	 eGGJNDpDB6FrPfnEVD6Qnpd38Yg+/xHt3NCJmmStgqaCebr4zjSJwZh8bYQPzC0ECGY35
	 DB10Zk+VBNSwdqq3oUqpb3iYz9zV5py6qr1Eim4ZIG1L+Cu/KtCadSEuMzcvrSsB0Rq3G
	 nNdfRx51obBl7JOPEUK1g+bIXzmpdZtpowIAA7AV1pPQvzGokyBcQNJEsfRXtNz979LZq
	 JNk85VLuRDEBrUeFPQ9URiu/1nAIGfRFHhl9KHt8GnaG5TohZR8W5LsIDaD3aTEKVAr6o
	 mIc1GeKp5AINT/mN2QT8EUeVD6UqDU/QlKRcKp64ZmusUtpnlKfby7zF+JqQi7qLUODhN
	 Pa2d5XC4fjzfxSDyc0IK8dUGbBznwmoE60bkGCv8Po8FbiEwiAMVZQK+r68xbf72aKrp8
	 yslgvlfWMnbPmc3LX+bfUCPuhdSdcPJZg5yRoib14ahSHBa+AlcNsegTMhDTZADx2R0z0
	 ugmBaJHhi+oDzdXLyEeh6TvDI5pP72CFl2Je7/JHgOdgqzmUojJuEG0ULKRUxHk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765400645;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=gpQNHSCoovOcTqunSkPw0fNbA6p+CFqBvbrVIGEp3y8=;
	b=aUPrncKMjKkM5JYWALznHgn7r3d8FgwCsysbe9vnzlpzFR5A5R4o1uo6wxtDJ9MALIbS
	 OFSXdTJorNCJJo01hvRsfzVq9OkxnlR/hO/iJE1PSX2+GVNoaXFZrHjxhysMq1zXRhnw0
	 Q3XN9DpcyLlHMeGKpFKA+ZOIGJXQrH8h0qG/BboHcQzJB1sfu1v6e0zHwSwsFpC+YCoFl
	 Gf5fapfDsUVDO/VQpgztQAoHzA4Y5dcfm5VaLREX2Eb+nl+QdB9oHhR70Voa/gHKrrSV2
	 mRm9yexd7RHVFA7RMwOm9Nzk/Vu4kWKBhRFLPTe7O0WBt8hzuDuFQXLHS9kgdEiocLzVk
	 oEB98BDqZwilDgBcnEmlUdOUd4BBz90tdEcscIjkWPs9LN79zHU9i5dn/kf4bIpuYwu1q
	 h6t5tRa/ewvzmSrN4q7tRyxMvmA0yitwqc6qlHRfgX4A3RGwVXxBFTkQB8BwnxAyFVd/T
	 QtFAqaT8I2dwAQ/fWSm8j8L1wdiIuYODlqDttkUDTt7+Fxy3H87SpIqNTYnjzO5AuzbpE
	 ZuagHyKduQxyBtmXHuVrqN+v2Se3KHK+YbOaPWLksUIF+a4huHeAb3oKXcJ7DbnJPps40
	 JyoNiYB5hbwb918Lx+zGdRAfa0L1FOGJF/GkZkkRSviGR/zG0siO4mmHD1mK+BI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765400645; bh=WHZFWu8nSKbFzZ9HJhJFOwjiWKcn2bf8J+Aly1L6I/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dlciX0m1RarpBtNl00QHcDFBlapziiClbRqSTwX6VV+mzdAh7vShr6MB+ZokztHkR
	 x4LLPu1yh7yIwDFk3Pk/OHU4eEAOU20PuSRf4J6bxN4WSaPLuxeNxmdnrmFTP0i4oG
	 xmBekcRqXX0ENTJPClb8E4SEy8OgDpjPsOVfqeOVssU97Ko1ACs1A6/3wGdBfPAKqZ
	 pzolcwVEA7Sn+YKBIEW0Nk2zYg7AiEMixiGcHTDXoSaFbEgMiGSc4Aw9S4PrWdQlG/
	 GE3j9bqlL+3oe9gq1GX7jb0ZN3SrDPAGbXzNlk809QtaLg8XUBk1+q9ggfNlI0tfoJ
	 FE9iBBIaBiq7g==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 22:04:05 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 4/5] x86: Fix missing breaks
In-Reply-To: <20251210183019.2241560-5-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-5-andrew.cooper3@citrix.com>
Message-ID: <5272a5198db51a40318b844a629900db@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-10 19:30, Andrew Cooper wrote:
> With the wider testing, some more violations have been spotted.  This
> addresses violations of Rule 16.3 which requires all case statements to 
> be
> terminated with a break or other unconditional control flow change.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

with one nit below

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/domain.c          | 1 +
>  xen/arch/x86/mm/shadow/hvm.c   | 1 +
>  xen/arch/x86/pv/emul-priv-op.c | 1 +
>  xen/arch/x86/pv/emulate.c      | 1 +
>  xen/common/livepatch.c         | 1 -
>  xen/common/livepatch_elf.c     | 1 +
>  6 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 5e37bfbd17d6..b15120180993 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1517,6 +1517,7 @@ int arch_set_info_guest(
>          {
>          case -EINTR:
>              rc = -ERESTART;
> +            fallthrough;
>          case -ERESTART:
>              break;
>          case 0:
> diff --git a/xen/arch/x86/mm/shadow/hvm.c 
> b/xen/arch/x86/mm/shadow/hvm.c
> index 114957a3e1ec..69334c095608 100644
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -268,6 +268,7 @@ hvm_emulate_cmpxchg(enum x86_segment seg,
>      default:
>          SHADOW_PRINTK("cmpxchg size %u is not supported\n", bytes);
>          prev = ~old;
> +        break;
>      }
> 
>      if ( prev != old )
> diff --git a/xen/arch/x86/pv/emul-priv-op.c 
> b/xen/arch/x86/pv/emul-priv-op.c
> index 08dec9990e39..fb6d57d6fbd3 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -407,6 +407,7 @@ static void _guest_io_write(unsigned int port, 
> unsigned int bytes,
> 
>      default:
>          ASSERT_UNREACHABLE();
> +        break;
>      }
>  }
> 
> diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
> index 8c44dea12330..b201ea1c6a97 100644
> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -120,6 +120,7 @@ void pv_set_reg(struct vcpu *v, unsigned int reg, 
> uint64_t val)
>          printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad 
> register\n",
>                 __func__, v, reg, val);
>          domain_crash(d);
> +        break;
>      }
>  }
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 9285f88644f4..b39f8d7bfe20 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1924,7 +1924,6 @@ static void noinline do_livepatch_work(void)
>                              p->name);
>                      ASSERT_UNREACHABLE();
>                  }
> -            default:
>                  break;

could I talk you into changing to

   fallthrough;
default:
   break;

while it's clear that the meaning is the same, the LIVEPATCH_ACTION_* 
constants being switched on are not in an enum, which is made more 
obvious by the presence of a default clause.

>              }
>          }
> diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
> index 25ce1bd5a0ad..2e82f2cb8c46 100644
> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -347,6 +347,7 @@ int livepatch_elf_resolve_symbols(struct 
> livepatch_elf *elf)
>                  dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: 
> %s => %#"PRIxElfAddr" (%s)\n",
>                         elf->name, elf->sym[i].name,
>                         st_value, elf->sec[idx].name);
> +            break;
>          }
> 
>          if ( rc )

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

