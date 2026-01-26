Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECHtLAbHdml7WAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 02:44:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA0835C0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 02:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213253.1523786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkBdQ-0007gC-Q4; Mon, 26 Jan 2026 01:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213253.1523786; Mon, 26 Jan 2026 01:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkBdQ-0007dy-Jc; Mon, 26 Jan 2026 01:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1213253;
 Mon, 26 Jan 2026 01:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qy5c=77=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vkBdP-0007dq-2y
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 01:43:19 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617a3e15-fa58-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 02:43:16 +0100 (CET)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-88a26ce6619so55249876d6.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jan 2026 17:43:15 -0800 (PST)
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
X-Inumbo-ID: 617a3e15-fa58-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769391794; cv=none;
        d=google.com; s=arc-20240605;
        b=lef6yUPyJp/RAGlSuUwSU8yHQfoYaappC8ZjrfIHhs6mcB+THer6+xGkmqDdWuPhpq
         1oivQqUhqm3inmQCVWEryWnYOs0XV5B7lHv7dEGbwO6ISFhp/To5wfQuvgWM5I2MwOXT
         4oY/S6NzJxKpl8ihgGzo9pERFSU8rRO9az8CX86kpiLBQPv+X7bNrO1ObiHwhXt2qLbg
         wLHXqokYZFkrqUEsiEJiSajShmG5vNlQxzVqcRoZ6Qqm5KfVfW1F+DOXyjDrwB5mcp/c
         SDVGeJbJYTaoOamlrOwNfzIUC06tNpQBKRzbacDMocEt/qWr0s7fZ1w9Km+8gGkXG7+S
         V8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        fh=yO1yMD14bAceKbkyokr5DzCgIxCl0W9L3blG0KrUmA0=;
        b=NWJSo4t3X95lJLZbghy9rJRAdsnWlrCHbf0v5b40flJTOJVgVRirmUWoN+1pM0+UFE
         08IGIqv5U+E7yCKHZB58rPuJ17iWQ2X4KZZq2dJbdJqsjmvlNod8jgGttBu0WfvesPk2
         U7D/afqKYRphzHpXNwXF/YUjvxpLezzii9xmT3KWiLEIxpWZ18cB+kR4dAh1WzywXBrY
         M080mqQQiwQyfnY3g5QXJQ0I2kcP9r8PapoJydG/JZcvIwMKdiVdw+MB4sz5Y5zZm18v
         GFIeTBJFBqhIZQbN+hLrMHS9ASlV9V78DvCeFSbG2o0yeCsYjmpXOxfzC7bac9SuTi3i
         jRIw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769391794; x=1769996594; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        b=Vds0J8qG6V17NrD7x6XVcnal6BXqopvyIxpoVEpeYW8Rg4blqPo8HqiWCO7F6ol/FH
         UGnBjanZ1DD/yu7Ml4yWCP/oWy78k/Tu2Ih/WxompBnULN5PnDnld2mG4j+xe8kHpCiZ
         sVnlKwvk87RAD+55YCbN3sgKR2PPZEQ+k3wooYQuR3TVphrq4ys47qoSDR3DaRysJBK7
         7jE54JC73IUBgCCIO9vEsMkMTKRM/eYjbhQUyP3pU/EEZhbpAAtHcptfLAjNAcXSueyv
         ppp+5SpqAnFULp0ZAd6L4GXeTObZwnFzuU/VzLfric2BXdljPklZoeiDjkVyrMbMF7el
         ajdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769391794; x=1769996594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td4QUCSFnNiGlIQcniNA/rp8ZfKnX5RqAxkcu4MfCJE=;
        b=uujxiWzpHfcMeRcyHiZ1ndl5S0Pi9RTblu7kW5oqGwzGW3Frv7lDJ4ZsyGFOCmQXiL
         bTqL+08mZ7R7n80Xlf+d1FjfQdDHeqOFw+5FchaLXk2A6xt+uh4jhfBe5j1uJv2pt0Ih
         ehc5fSrvLmia/Y2OZbT+j5lGiKTlgqRml9gLU2OhoccpB5BU3rz7402/sqN2jIgaj6/g
         gk1P3y9rB9mcL93Tz9yLfSJl8qOiNubh29uXtvgRM34a/1zXG78QrWiU9SrLYj/tKeCj
         3TIj5Gvc7GgpGyV0kvxK1Vge9DVrpKy3sTRnXdLJ9KuwnG4bW5RA7RYOYFlEOTmsbZrZ
         SuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIAroCdLLqbNHNwBsQt2/vZqQU4TdUK0F5027LCcW0M0jUu3nbY8o7fVTpd7p7xbspxdEqMX6bvOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzezgRogv4keMRncHN5Uvu9+iPlC9DqPtwbjOFxDxBEsNxOmaAG
	KnTsm2ICXYW5Dw8dAzBel+VmxQE9HrJ4+A8BeHnzNhnc7kTohuT9l6Cxl3qgZ8W2kvR3zOLCbZ3
	fJWmm/cbQYh51QE/ATjaIUSNS78T4pesQUSe9
X-Gm-Gg: AZuq6aLnXgsquweLT4lXoA6CuDqj8s5Dxv16Vwwhy4uxkEs+43HEJgNgCjiSQYncqqv
	exjFghUFifHv3iupXB/eBoaEmxCNnXVSA9Oy6dAMKnHMTy7y6ePdqlmvxJoU3fAyGwhhWkWOkTa
	qWvy4JfCujMPF9NhYhtz5/uXtEdTvVbAOqsPTEg4aRJzZYgea+q25EDaMrLusnFI2KpkSnQF7JQ
	DlL/gutts2/T43oTlKNh7nDbehgKiGmGKEfmRAgiFTxaRJl3Gi9Zf6gkwP9FJAcA3zUT0o/7A==
X-Received: by 2002:a05:6214:d85:b0:88a:4452:750b with SMTP id
 6a1803df08f44-894b0792ademr38139946d6.60.1769391793952; Sun, 25 Jan 2026
 17:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-2-21cnbao@gmail.com>
 <aW90tXGtLVC0mKWP@willie-the-truck>
In-Reply-To: <aW90tXGtLVC0mKWP@willie-the-truck>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 26 Jan 2026 09:43:02 +0800
X-Gm-Features: AZwV_QjeDywrcz2eWqXN9SXa7QL5VefpgErEyUZbE549AGDu67lQKOvE9Fh-udU
Message-ID: <CAGsJ_4wDYTbuuzzfGNWqp1+ca1cAkg0XMgbgkspRGdKKAx_Ymg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Leon Romanovsky <leon@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:catalin.marinas@arm.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:leon@kernel.org,m:ada.coupriediaz@arm.com,m:ardb@kernel.org,m:maz@kernel.org,m:anshuman.khandual@arm.com,m:ryan.roberts@arm.com,m:surenb@google.com,m:zhengtangquan@oppo.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[21cnbao@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[21cnbao@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16EA0835C0
X-Rspamd-Action: no action

[...]

> >   */
> > -     .macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
> > +     .macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
> >       sub     \tmp, \linesz, #1
> >       bic     \start, \start, \tmp
> >  .Ldcache_op\@:
> > @@ -402,14 +401,13 @@ alternative_endif
> >       add     \start, \start, \linesz
> >       cmp     \start, \end
> >       b.lo    .Ldcache_op\@
> > -     dsb     \domain
>
> Naming nit, but I'd prefer this to be dcache_by_myline_op_nosync() for
> consistency with the other macros that you're adding. The 'raw' prefix
> is used by raw_dcache_line_size() to indicate that we're getting the
> value from the underlying hardware register.

Ok. thanks!

>
> >
> >       _cond_uaccess_extable .Ldcache_op\@, \fixup
> >       .endm
> >
> >  /*
> >   * Macro to perform a data cache maintenance for the interval
> > - * [start, end)
> > + * [start, end) and wait for completion
> >   *
> >   *   op:             operation passed to dc instruction
> >   *   domain:         domain used in dsb instruction
> > @@ -420,7 +418,23 @@ alternative_endif
> >   */
> >       .macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
> >       dcache_line_size \tmp1, \tmp2
> > -     dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
> > +     raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
> > +     dsb \domain
> > +     .endm
>
> This could just be dcache_by_line_op_nosync() + dsb.

Ok. thanks!

Best Regards
Barry

