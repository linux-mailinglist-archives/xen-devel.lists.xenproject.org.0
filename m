Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787639C3675
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 03:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833293.1248415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAJzd-0000xY-2r; Mon, 11 Nov 2024 02:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833293.1248415; Mon, 11 Nov 2024 02:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAJzc-0000vE-Vn; Mon, 11 Nov 2024 02:17:28 +0000
Received: by outflank-mailman (input) for mailman id 833293;
 Mon, 11 Nov 2024 02:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAJzb-0000v6-Jm
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 02:17:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14d8c5c0-9fd3-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 03:17:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBF215C57DA;
 Mon, 11 Nov 2024 02:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD8AC4CECD;
 Mon, 11 Nov 2024 02:17:18 +0000 (UTC)
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
X-Inumbo-ID: 14d8c5c0-9fd3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjE0ZDhjNWMwLTlmZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMjkxNDQyLjE2MjcyMywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731291439;
	bh=uBnOdpg0LjCPqGmPn5WzrEMm3iE89j9hAVl41CbS4Pk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AkTzKdHzuS+fTuKY5B5N/tYU5fpY4xHCUQpE2VeTMCbZbtkghFql5/NCbW0YIle4T
	 pXpDXI47MadoZS78ndBz6A4VCDJoB3hG5Nj9HD2utbA1uiDhDsLVi/42hQafz6nekw
	 8PU/cPZhksMTGxHEF2vF8NrmbbySFijxv0/Hd/4IqL0li/hjzqoqX33VNHcaEEIHkB
	 V6zBDNNxvwUJOjfHHqw6pjJygOybxhCi1IDZESi5+OAbljpLSRDRQQNKtbr0qAaZmQ
	 ZWKkhI8zkB34JYMva7sMey8TVzJpk5jDYFi0xnrI6gjWfIEA4tBI0xTfi9rVy/ijz7
	 kDSFRg0sWkhyg==
Date: Sun, 10 Nov 2024 18:17:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/3] x86/emul: use pseudo keyword fallthrough
In-Reply-To: <9be1812e391ce893afa028c05614b74cddb197b7.1730880832.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2411101817030.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730880832.git.federico.serafini@bugseng.com> <9be1812e391ce893afa028c05614b74cddb197b7.1730880832.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Nov 2024, Federico Serafini wrote:
> Make explicit the fallthrough intetion by adding the pseudo keyword
> where missing and refactor comments not following the agreed syntax.
> 
> This satisfies the requirements to deviate violations of
> MISRA C:2012 Rule 16.3 "An unconditional break statement shall
> terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/x86_emulate/decode.c      | 6 ++++--
>  xen/arch/x86/x86_emulate/x86_emulate.c | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
> index 32b9276dc5..0a0751f2ed 100644
> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -1356,7 +1356,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>                          --disp8scale;
>                      break;
>                  }
> -                /* vcvt{,t}s{s,d}2usi need special casing: fall through */
> +                /* vcvt{,t}s{s,d}2usi need special casing. */
> +                fallthrough;
>              case 0x2c: /* vcvtts{s,d}2si need special casing */
>              case 0x2d: /* vcvts{s,d}2si need special casing */
>                  if ( evex_encoded() )
> @@ -1530,7 +1531,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>                          disp8scale -= 1 + (s->evex.pfx == vex_66);
>                      break;
>                  }
> -                /* vcvt{,t}sh2usi needs special casing: fall through */
> +                /* vcvt{,t}sh2usi needs special casing. */
> +                fallthrough;
>              case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
>                  disp8scale = 1;
>                  break;
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 30674ec301..c38984b201 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1460,6 +1460,7 @@ x86_emulate(
>  
>          d = (d & ~DstMask) | DstMem;
>          /* Becomes a normal DstMem operation from here on. */
> +        fallthrough;
>      case DstMem:
>          generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
>          if ( state->simd_size != simd_none )
> @@ -1942,6 +1943,7 @@ x86_emulate(
>              break;
>          }
>          generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
> +        fallthrough;
>      case 0x88 ... 0x8b: /* mov */
>      case 0xa0 ... 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
>      case 0xa2 ... 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
> -- 
> 2.43.0
> 

