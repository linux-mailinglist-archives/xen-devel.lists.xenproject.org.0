Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL91HdPvlWlTWwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:58:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9E157F99
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235870.1538709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsksY-0004nU-P3; Wed, 18 Feb 2026 16:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235870.1538709; Wed, 18 Feb 2026 16:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsksY-0004l0-M3; Wed, 18 Feb 2026 16:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1235870;
 Wed, 18 Feb 2026 16:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUrD=AW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsksX-0004ku-Mu
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 16:58:21 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a45d4c-0ceb-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 17:58:19 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43591b55727so39223f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 08:58:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc21dsm44993573f8f.20.2026.02.18.08.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 08:58:18 -0800 (PST)
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
X-Inumbo-ID: 06a45d4c-0ceb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771433899; x=1772038699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4ghpJt8L4tYtQ8jgPxDRYC5owoM/VBQVg2xRJnO5eU=;
        b=QZHKbRkUMk6MngZBxeSnQ1GRDJjggJaSqLe8dhTYCM+EvYL+bLCYojQ+3+XWV7pUPq
         N5iE7gyFNkomckE3UcbfDfUw2np2CPelVoAN0Bg0V8Mxxwhb5bIkOWy0U/8bV/vn51vc
         wyqL+bJ17H64R2WfVC7ECfq13hpQ/bUvfTPcDhR8xDyB40mPrfhIzYxxtuomKZFO19P3
         peo3hxQf3jZUhJQcL+Qwd68/YKgJEOp4hip0PhghiCskkKDKsE62JyErvTHCeU7VjkF3
         9qf2UC3ORNdffSI2+Q2BTE+6nPx8/kNI8oNUL8z7Z9FaWqMiM2+55rPCnW841J+mgZyA
         BPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433899; x=1772038699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4ghpJt8L4tYtQ8jgPxDRYC5owoM/VBQVg2xRJnO5eU=;
        b=i+XZZpkpkOL03xhP7a9PlfbJ1m1q83ZpIVJo2xz7tfZUvO130ypPCLvjDrX0Md36X+
         NkrjDFiTFdBRRg/iyqP/O3ca0/PBg/H0WkGoFakGSvjipaScjx6BTPP+PA767xECX9SR
         PcYMibOHJ8Ciyn6YTaDL7DBW5ZGfJscHBlQHxMbgyTFqtIq5DlJYPzTlXHdqWXYNpOU4
         C5c2oVAUCogMJs2dc94BAlfTmKoTAKRK/u2BX2pOPVWW61Xty3ERQy8+Ix8prRuEUII5
         +Qu5yKbuynsO8+2NaYan3gVcTm3fS9R/j3kwrQ+yw2tk8Sq6SU3Sh/RF6CwJugo3sGyH
         hXPg==
X-Forwarded-Encrypted: i=1; AJvYcCVkeuDyf1vEdo9ddFKboxkSDJEKJeP/45F+AaOdJTSKCathjMwBozwbhWnmhJaqJlj6u3ayw0p7Bi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxA2f8kR/GMeEocdRa12Crc8gjc8VYJ3YCh8ftBpJIyz0RAkht
	jtuUx4W04VRGTzeIv//cV4KQ3/BfDhPT3xa58SYkmYCsiqsIFaYUt9jZ
X-Gm-Gg: AZuq6aIaxqNsbAqlnvy8kyKQU3CkqZpBuinIXSGlXQu/GXcg4x7l1QcP0TxPzb6yvRn
	68RUhjnY7OfE3nUfhOKrGukm0Ulki7E96P90rhZ/LPYVddWfle0eNrwJh7B3u1+BXGYAdbxB0Of
	Jk0JIoX6VIu7O1RS7AeYG0rZBwYCSStXY3VdZetSCjLG7vF508EyB5puHrZmSqrAYhXBqXs9nZA
	opCAenLhuP/x5M/aKq4lj5CqglvTEJpTDX7VXHYW0xrkWmBP1B+KfFtY6bRH2y4v1rDv+JjNUkr
	txUgMgB4Q1x5YjPZMdO0uBSy+ejL48aF9OeA/2z92CfiW8hjYb/OsTMy4BA+iQfpgUlzLAs5R7h
	Liwepy5GifgFQPDoBI5Ms6/HwVH+S645gKJBKMzU1SZ2mZNkCFIlKG/MK4JxdBwgVlxxuLoJhTG
	YeeuDMK/nyZcnt/5Nfl3uQ2A+C68fRh2wUtObA0w8gRXi85i4S1J0v+H6EgcyEOZpGJwDl7hHdd
	RQ=
X-Received: by 2002:a5d:584e:0:b0:435:a136:b891 with SMTP id ffacd0b85a97d-4379db31b74mr28307886f8f.13.1771433898593;
        Wed, 18 Feb 2026 08:58:18 -0800 (PST)
Message-ID: <a71b3cc7-9ac1-4cec-8898-bda5e8ee644e@gmail.com>
Date: Wed, 18 Feb 2026 17:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,lists.xenproject.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CCE9E157F99
X-Rspamd-Action: no action


On 2/13/26 5:29 PM, Oleksii Kurochko wrote:
> Introduce helpers to manage VS-stage and G-stage translation state during
> vCPU context switches.
>
> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
> switch-out to prevent speculative VS-stage translations from being associated
> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
> required order.
>
> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
> only when required (e.g. on VMID reuse or generation change).
>
> This provides the necessary infrastructure for correct p2m context switching
> on RISC-V.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>   - Add comment above p2m_ctxt_switch_{to, from}().
>   - Code style fixes.
>   - Refactor p2m_ctxt_switch_to().
>   - Update the comment at the end of p2m_ctxt_switch_from().
>   - Refactor the code of p2m_handle_vmenter().
> ---
> Changes in v2:
>   - Add vsatp field declaration to arch_vcpu.
>   - s/p2m_ctx_switch_{from,to}/p2m_ctxt_switch_{from,to}.
>   - Introduce p2m_handle_vmenter() for proper handling of VMID,
>     hgatp and vsatp updates.
>   - Introduce is_p2m_switch_finished and init it inisde
>     p2m_ctx_switch_to() for furhter handling in p2m_handle_vmenter().
>   - Code style fixes.
>   - Add is_idle_vcpu() check in p2m_ctxt_switch_from().
>   - use csr_swap() in p2m_ctxt_switch_from().
>   - move flush_tlb_guest_local() to the end if p2m_handle_vmenter() and
>     drop unnessary anymore comments.
>   - Correct printk()'s arguments in p2m_handle_vmenter().
> ---
>   xen/arch/riscv/include/asm/domain.h |  1 +
>   xen/arch/riscv/include/asm/p2m.h    |  4 ++
>   xen/arch/riscv/p2m.c                | 79 +++++++++++++++++++++++++++++
>   xen/arch/riscv/traps.c              |  2 +
>   4 files changed, 86 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
> index 3da2387cb197..42bb678fcbf9 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -59,6 +59,7 @@ struct arch_vcpu {
>       register_t hstateen0;
>       register_t hvip;
>   
> +    register_t vsatp;
>       register_t vsie;
>   
>       /*
> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
> index f63b5dec99b1..60f27f9b347e 100644
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -255,6 +255,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
>   struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>                                           p2m_type_t *t);
>   
> +void p2m_ctxt_switch_from(struct vcpu *p);
> +void p2m_ctxt_switch_to(struct vcpu *n);
> +void p2m_handle_vmenter(void);
> +
>   #endif /* ASM__RISCV__P2M_H */
>   
>   /*
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 0abeb374c110..7ae854707174 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>   
>       return get_page(page, p2m->domain) ? page : NULL;
>   }
> +
> +/* Should be called before other CSRs are stored to avoid speculation */
> +void p2m_ctxt_switch_from(struct vcpu *p)
> +{
> +    if ( is_idle_vcpu(p) )
> +        return;
> +
> +    /*
> +     * No mechanism is provided to atomically change vsatp and hgatp
> +     * together. Hence, to prevent speculative execution causing one
> +     * guest’s VS-stage translations to be cached under another guest’s
> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
> +     * finally write the new vsatp value what will be done in
> +     * p2m_handle_vmenter().
> +     */
> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
> +
> +    /*
> +     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
> +     * or/and in p2m_handle_vmenter().
> +     */
> +}
> +
> +/* Should be called after other CSRs are restored to avoid speculation */
> +void p2m_ctxt_switch_to(struct vcpu *n)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
> +
> +    if ( is_idle_vcpu(n) )
> +        return;
> +
> +    csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
> +    /*
> +     * As VMID is unique per vCPU and just re-used here thereby there is no
> +     * need for G-stage TLB flush here.
> +     */
> +
> +    csr_write(CSR_VSATP, n->arch.vsatp);
> +    /*
> +     * As at the start of context switch VSATP were set to 0, so no speculation
> +     * could happen thereby there is no need for VS TLB flush here.
> +     */
> +}

I think we need to flush the VS-stage TLB unconditionally here. It is possible
that `p->arch.vsatp.ASID == n->arch.vsatp.ASID`, in which case the new vCPU
could reuse stale VS-stage TLB entries that do not belong to it.

I considered performing the flush conditionally, but that would require checking
not only the ASID, but also whether the PPN differs. In addition, we would need
to verify that the old and new vCPUs do not belong to different domains, since
the same VSATP PPN value could appear in different domains.

This starts to look like overcomplication for a marginal optimization, so an
unconditional VS-stage TLB flush seems simpler and safer.

Do you think this optimization is worth pursuing at this stage?

~ Oleksii


