Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMAiH1jUS2oVbAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:14:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD63171315D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:14:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Xs65dBqT;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355744.1610519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglxD-00084w-VN; Mon, 06 Jul 2026 16:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355744.1610519; Mon, 06 Jul 2026 16:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglxD-00082y-SI; Mon, 06 Jul 2026 16:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1355744;
 Mon, 06 Jul 2026 16:13:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglxC-00082s-BN
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 16:13:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglxB-008kn7-0l
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 18:13:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4bd423-2eae-0a2a0a5409dd-0a2a450c9e9e-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:13:52 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4bd440-f399-0a2a450c0019-d155dd2bf075-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:13:52 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47afb758487so331555f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:13:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e785sm25648330f8f.8.2026.07.06.09.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 09:13:51 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783354432; x=1783959232; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvhIt4HkRvTTrATsgiM41Ykrj0CRDTy0KgnvEsu6nIk=;
        b=Xs65dBqTTTNtqXjSqPogCfj4ZMPzwZPrSfT4wcHn2+4+oZODxQBsCeQDn3Ti9G3I28
         s2klrUi9ijoZxZMYO5ojy/WQHgWRD8nz8CwzdjlhWBnvDFd2C7YKPae/dsiu4vAw2wJs
         Ll+u+dmhFwGVND+R9unXoQXfa4NDE42EMhoP9v+92VEgwES5nkxn5YCC8NgydrVlzDVI
         28GOc+IocK2/hXetKnZzUx8ZOKe4wqJEIwaayfEUMIiMKm4IcsLPMaVvy8mLdR9uD4Sx
         +5iGnNNXcjgowLEDyfpqaY+ZQMIdxf4hTZJMdeo4GFSpyGCF8VANXFqwl936LYCNMq25
         LoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354432; x=1783959232;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvhIt4HkRvTTrATsgiM41Ykrj0CRDTy0KgnvEsu6nIk=;
        b=EdlKDbcu/3xU68l8mI99d4jnweoEPu5WQTP6QesTN/lleSmLquESdxgw4yyimmUael
         MY/aFAel0ZhOnc0ZDBIX4qTbw+CL40wEpt5mGJTrVXe1N9tx2b7brUgLSpNFfW3PrU4i
         69HfUya+uoDVNYL4jPeR1atVLTGX5evNsR/9HrDEnnDcUTmyX6y1g+DWWbf0Odf6RJ8g
         VoP9DYCJKzmqIn1YG2IVTvcXCQIlksCXoj4o+t10mVgxJBfJpIFGXTavsxBLTVMfZnBn
         oZAiRxY+nN1/YGyTuOfycYfnBeofjyupr3XbmL1dzMvJ5YNtAmokXCKllHr3VZRq6r5x
         IxpA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9zBTnDigs9HbrB5XFszKBaV/3tU/WzHV8ORZTl1loS9qk5VsuttzOa/vtwlYvqy9Y7IX1y8xx7cE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCLlld5yVrOyBho7R40uvZkJQ7aL48PyjthQGAsyxWne9VDCOs
	3768xETBN4ojOMu1/cICl6qjWOnUybb8yzzkuXwVzsTb1M0DRjkYiFE5RIbem389kA==
X-Gm-Gg: AfdE7ckg4KOufnM7WoilRM7ydOOoDkYPyW+PYjWCO/WAuh4WQizGO5md6vUo45gQohD
	No91W4XP2uDQYgAvZF6i84p+SiB7c7kTfJIrHc5W+pFBTaJo3LlUsFfFiA0Zh+jj5JnqAOSuEJo
	UIckMFvBbqFyslA7m3sI+3+nQx+VZvkBCcp8XRStR6USmMYcyaIoaefBF/6QuzBKBmnh1aodv1m
	kvL+VU4rON1OsJ/+PbPW3BPeo43a8TrRCaSM8GY+HOXyg4uSnsKoaTogmB9f5C9f9PE/EjFMSEa
	4DZnJtypqXUAaviGyLIr+/+ZgsPYPj1Ak7N4XIWfVZ6sRPVLYRnYbOYN5XggMz0Nl4w83eYrN3W
	zTYKX6b3Hxx3TOvMG4NhgMfi6sZU7BMzhyNZg5LotRqz4AFK98LBK+M3GQkkuvC0N7ml8vebJKE
	mizgPkOZYWkLGlt7e/JsBPZp0sl2u+1ON3AFYK0wXwwf2RJRS1OVj+Wr+C+/5vqcqnFhnQ3eXU4
	a/v
X-Received: by 2002:adf:f48f:0:b0:478:65a8:2635 with SMTP id ffacd0b85a97d-47de6697c10mr868259f8f.11.1783354432279;
        Mon, 06 Jul 2026 09:13:52 -0700 (PDT)
Message-ID: <3835ed9c-4c9a-49e4-90fd-37644262a942@suse.com>
Date: Mon, 6 Jul 2026 18:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/26] xen/riscv: do a 4th linking pass if necessary
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <ba3b7e3197ae90c9f0e5190ba34de174b86090ac.1783331040.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ba3b7e3197ae90c9f0e5190ba34de174b86090ac.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783354432-92321D51-1645887D/10/73395122804
X-purgate-type: spam
X-purgate-size: 4819
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD63171315D

On 06.07.2026 17:58, Oleksii Kurochko wrote:
> Embedding the symbol table can shift sections and flip relaxation
> decisions, changing code size and thus the set of emitted symbols
> (e.g. gap end markers).

What difference in symbols is there? (And: Do you mean the ELF symbol
table or what tools/symbols emits?) On ...

>  Re-link with a regenerated table when its
> size differs from the previous pass.
> 
> This mirrors commit 35de7285d508 ("Arm: do a 4th linking pass if
> necessary"), which riscv didn't receive when the underlying
> pass-2-vs-pass-3 check was extended to it in commit aa786d6e3467
> ("non-x86/symbols: check table sizes don't change between linking
> passes 2 and 3").

... Arm the problem was with a symbol (dis)appearing from/in the ELF
symbol table. The situation looks to be different here. Sadly ...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> I faced this issue again in downstream:
>   https://gitlab.com/xen-project/people/olkur/xen/-/jobs/15171254706
> 
> It was found that the difference between .xen-syms.0 and .xen-syms.1 is in
> alignment(?) gap between turn_on_mmu() and the end of simple_strtoull.
> Specifically 0xffffffffc00c05b0 is present in pass 1 but not present in
> pass 2 (where end of simple_strtoull() is just equal to ffffffffc00c05c0)
> because code was shifted:
> 
> ```
> .xen-syms.0:     file format elf64-littleriscv
> 
> ...
> 
> ffffffffc00c0534:       f2e794e3                bne     a5,a4,ffffffffc00c045c <simple_strtoull+0x18>
> ffffffffc00c0538:       00280813                addi    a6,a6,2
> ffffffffc00c053c:       f21ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
> ffffffffc00c0540:       00068813                mv      a6,a3
> ffffffffc00c0544:       00800613                li      a2,8
> ffffffffc00c0548:       f15ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
> ffffffffc00c054c:       00277713                andi    a4,a4,2
> ffffffffc00c0550:       04070463                beqz    a4,ffffffffc00c0598 <simple_strtoull+0x154>
> ffffffffc00c0554:       fe06869b                addiw   a3,a3,-32
> ffffffffc00c0558:       0ff6f693                zext.b  a3,a3
> ffffffffc00c055c:       fc96879b                addiw   a5,a3,-55
> ffffffffc00c0560:       04c7f263                bgeu    a5,a2,ffffffffc00c05a4 <simple_strtoull+0x160>
> ffffffffc00c0564:       02a60533                mul     a0,a2,a0
> ffffffffc00c0568:       00f50533                add     a0,a0,a5
> ffffffffc00c056c:       00180813                addi    a6,a6,1
> ffffffffc00c0570:       00084683                lbu     a3,0(a6)
> ffffffffc00c0574:       0006879b                sext.w  a5,a3
> ffffffffc00c0578:       00d30733                add     a4,t1,a3
> ffffffffc00c057c:       00074703                lbu     a4,0(a4)
> ffffffffc00c0580:       04477893                andi    a7,a4,68
> ffffffffc00c0584:       02088063                beqz    a7,ffffffffc00c05a4 <simple_strtoull+0x160>
> ffffffffc00c0588:       00477893                andi    a7,a4,4
> ffffffffc00c058c:       fc0880e3                beqz    a7,ffffffffc00c054c <simple_strtoull+0x108>
> ffffffffc00c0590:       fd07879b                addiw   a5,a5,-48
> ffffffffc00c0594:       fcdff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
> ffffffffc00c0598:       fc97879b                addiw   a5,a5,-55
> ffffffffc00c059c:       fc5ff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
> ffffffffc00c05a0:       00000513                li      a0,0
> ffffffffc00c05a4:       00058463                beqz    a1,ffffffffc00c05ac <simple_strtoull+0x168>
> ffffffffc00c05a8:       0105b023                sd      a6,0(a1)
> ffffffffc00c05ac:       00008067                ret
>         ...
> 
> ffffffffc00c05c0 <turn_on_mmu>:
> ffffffffc00c05c0:       12000073                sfence.vma
> ffffffffc00c05c4:       00800293                li      t0,8
> ffffffffc00c05c8:       03c29293                slli    t0,t0,0x3c
> ffffffffc00c05cc:       000fc317                auipc   t1,0xfc
> ffffffffc00c05d0:       a3430313                addi    t1,t1,-1484 # ffffffffc01bc000 <stage1_pgtbl_root>
> ffffffffc00c05d4:       00c35313                srli    t1,t1,0xc
> ffffffffc00c05d8:       00536333                or      t1,t1,t0
> ffffffffc00c05dc:       18031073                csrw    satp,t1
> ffffffffc00c05e0:       00050067                jr      a0
> 
> ffffffffc00c05e4 <_ident_end>:
> ffffffffc00c05e4:       0000                    .insn   2, 0x0000
>         ...
> ```

... with all of this disassembly provided it still doesn't become clear what
changed from .xen-syms.0 to .xen-syms.1.

Jan

