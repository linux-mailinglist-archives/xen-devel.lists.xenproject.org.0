Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08974B92384
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 18:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127839.1468395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jPC-0001GJ-H7; Mon, 22 Sep 2025 16:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127839.1468395; Mon, 22 Sep 2025 16:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0jPC-0001E0-ET; Mon, 22 Sep 2025 16:28:46 +0000
Received: by outflank-mailman (input) for mailman id 1127839;
 Mon, 22 Sep 2025 16:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0jPB-0001Du-PM
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 16:28:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3451007a-97d1-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 18:28:43 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso34184745e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 09:28:43 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e8e756721sm9890087b3a.71.2025.09.22.09.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 09:28:41 -0700 (PDT)
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
X-Inumbo-ID: 3451007a-97d1-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758558522; x=1759163322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2E7XnAKQsYmiy+PpiYdnLnz2lCA3Ze9v+aTiY5r6ns=;
        b=JanMKKV1k2ju9Nc6Y2aUT/mKbgu+rhuUpo+dstwS0q0djeYXB8QCg17K+jvzMvMg42
         pca8FIxdwPm56DfR7yOi2wUwo7WLvfYYRR6u8J9RCPPBwP06w1s4/clvVoYHtu37VEA3
         6Zm9IogowcZ+a/r4fEQ76YyY8UzT1Hwhh8h+2wPST1G+iJOrZWfBTAKETSwV98MXgr5W
         Un9mx2JCuClqIvC9mt4oGSYjaXuybaHIhqTEVXN2OyGoF+CzbLEJ/LSFZBiFMhBVXWfa
         SjJ93uzbhFxMxS16JxZVehtXsD/SBPZB7vRF54FDxorHd9l/99fH/J4fzKjTqk+ph33g
         9CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758558522; x=1759163322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2E7XnAKQsYmiy+PpiYdnLnz2lCA3Ze9v+aTiY5r6ns=;
        b=tQ7eTeXbqc215QRiPuksHLLRgnkv/GApW6gDUwQPGlfaERR0cBUeKSoZ1THmprWH8R
         GybehXCv3naCKWmZzwheuVoP2zg37txqTGIVjyzsXfPiEKnHg+qJi7wt0EPcoVgSGiN0
         2IxC6vmfoJiJUun3zYAYR1fGAv0Iy4ElykTIG80tPYkzuMTgyYOxO53lAPaDTujQKMaX
         4805TmHzl1NAbfmaQLCWyvt2+zEk3cRXex8m1T34+FmgJVXIvlzapFw/CJCPJQC8L71l
         OktZvr7QRrgpYHVCpF8vtSzLifLeYGj4fpDNs1xLbBgwoXNoUamtXTo8RqAQHMfLyJri
         OIhg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+8DUnw1Khy+A+9hlDPo5wplnyDgmPGLlWBoc+uhiNErgehpqKqodPTYuXvDi5YynbrfL24glBrs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxo1wkLGmoHR/p0vdFDcMQ1MLnIeExSnCmptiKN66x1Sj9vrnQa
	CdK/5+GuSRvQHqcqA0kQawhwKf29ZYqtLl2VQiIK3oz86NOPU5QClbDilQQKdIMHGQ==
X-Gm-Gg: ASbGncs5oXRbujWQFnQvCN57p2vQuxSRwF5jr36ziZN1sRW397bYkGXPue54RZpJKNQ
	lLdD79Zsx5yFcsPYYYfE0eDx8prLzYg5BKfrzJ6+G6CIQ6Jz6tp7IZHLwGLPoa5C5qVBmSfi/Vl
	sqMaJsCNWxKfCBPr6r7a6QNTTLyR8GbM4mg3iLrIpE8p0DcO4zhOEjER/zYXvar/ospg+WXtN5e
	pTbj7hY7X7mUDtm44WHrQgwwfQuLLeTJEqIufyEH9habpvVYVbBnb2RXYK29QjOxUehx2UadT5s
	bdsP5WsGffqWSqoCNqQXACphToNBI5JmA2FxIf4iPPiMLMhGhO5hUsK3um0NnhPWKf71zRLEIMu
	XO6rYAzwk6iBZ7lL/hMa/zdsc3EmxMMUY+Y5q10nSg3o=
X-Google-Smtp-Source: AGHT+IH3AAfGlFF3EAvO0Jxe5BSurtG2ey0NoLs3UGGAGKnP29neCtVU74C/wJhuDm53zZpb6hFyDQ==
X-Received: by 2002:a5d:5f87:0:b0:3e4:5717:368e with SMTP id ffacd0b85a97d-3ee7c552b21mr13199665f8f.2.1758558522521;
        Mon, 22 Sep 2025 09:28:42 -0700 (PDT)
Message-ID: <7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com>
Date: Mon, 22 Sep 2025 18:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>      p2m_write_pte(p, pte, clean_pte);
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    e->pte &= ~PTE_ACCESS_MASK;
> +
> +    e->pte |= PTE_USER;
> +
> +    /*
> +     * Two schemes to manage the A and D bits are defined:
> +     *   • The Svade extension: when a virtual page is accessed and the A bit
> +     *     is clear, or is written and the D bit is clear, a page-fault
> +     *     exception is raised.
> +     *   • When the Svade extension is not implemented, the following scheme
> +     *     applies.
> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
> +     *     updated to set the A bit. When the virtual page is written and the
> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> +     *     address translation is in use and is not Bare, the G-stage virtual
> +     *     pages may be accessed or written by implicit accesses to VS-level
> +     *     memory management data structures, such as page tables.
> +     * Thereby to avoid a page-fault in case of Svade is available, it is
> +     * necesssary to set A and D bits.
> +     */
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;

All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
machine mode software responsible for dealing with this kind of page faults
(just like the hypervisor is reponsible for dealing with ones resulting
from henvcfg.ADUE being clear)?

> +    switch ( t )
> +    {
> +    case p2m_map_foreign_rw:
> +    case p2m_mmio_direct_io:
> +        e->pte |= PTE_READABLE | PTE_WRITABLE;
> +        break;
> +
> +    case p2m_ram_rw:
> +        e->pte |= PTE_ACCESS_MASK;
> +        break;
> +
> +    case p2m_invalid:
> +        e->pte &= ~PTE_VALID;
> +        break;
> +
> +    case p2m_map_foreign_ro:
> +        e->pte |= PTE_READABLE;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +}
> +
> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +{
> +    pte_t e = (pte_t) { PTE_VALID };
> +
> +    switch ( t )
> +    {
> +    case p2m_mmio_direct_io:
> +        e.pte |= PTE_PBMT_IO;
> +        break;

Shouldn't this be limited to the !is_table case (just like you have it ...

> +    default:
> +        break;
> +    }
> +
> +    pte_set_mfn(&e, mfn);
> +
> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
> +
> +    if ( !is_table )
> +    {
> +        p2m_set_permission(&e, t);

... here? Or else at least ASSERT(!is_table) up there? Personally I think
all of this !is_table stuff would best be done here.

Jan

