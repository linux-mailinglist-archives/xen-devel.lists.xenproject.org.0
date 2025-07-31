Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A48B17547
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066128.1431465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhWVe-000439-Iw; Thu, 31 Jul 2025 16:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066128.1431465; Thu, 31 Jul 2025 16:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhWVe-00040o-Ex; Thu, 31 Jul 2025 16:52:02 +0000
Received: by outflank-mailman (input) for mailman id 1066128;
 Thu, 31 Jul 2025 16:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhWVd-00040S-4A
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:52:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9e5a4e-6e2e-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 18:51:56 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1021878f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 09:51:56 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ca1sm2993148f8f.48.2025.07.31.09.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 09:51:54 -0700 (PDT)
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
X-Inumbo-ID: aa9e5a4e-6e2e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753980715; x=1754585515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5lamVB80KOj25+BpSNqHbcZzbifEhEwbibdFhCKRcLM=;
        b=Z4+yFFGM/bpgYYTayFTnX2n1E25ix8TwZVsk9BwxUJUMo2IcI65pQheisMsfy9KrIU
         N+uoXKn+iynI6rKpootquZgeoxEHWy3M+LLEDMvduczNyyzkuW9Wzs4WkIxoDyU2sHD7
         3gutjbb4y64yDJh4o+8l3JVkPaEqbFLzZT6Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753980715; x=1754585515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lamVB80KOj25+BpSNqHbcZzbifEhEwbibdFhCKRcLM=;
        b=iZ+dIblCoWxWWqiaJ5pOFTWoeTMzpu0b9efA0Qh7z0Dwy1UkzYwxmZEP+iKfE27Ifn
         NN/HcD/G8kH055pVIrDbbQ1VsuybkVm2RrWZurw9IQZI0Vb+JmK3aATPSre1rlhUuE45
         Rh/LKvAEfnF0SQdrAv0QDE387EQwmDlaFPHBmE782s5JLnzlG5cCEaeyg0JJ6PLYaVOg
         o88uulQMcPx5mq0+Ow9CrzofXo94mAxdmQsC1a9Vw3keaMotHvjcYcRBaDMsavMwI/EG
         P3yi0D2dU4hKoH7oceNLs+SFGaSvdgUBQvrv26fpVW5YxSTCD7fYhaiacyXDnjxO9U7D
         KRYw==
X-Forwarded-Encrypted: i=1; AJvYcCVp/nwo7mDJTODW9MC1XnCAhQwWt2wubqTaFhC9PtYzQVZn0kKlRttKAS0r1boP6V+RJjTtM4Ar++M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf/qhGf/1hw3VSC5u6J06pWS4Pf+tx/UILjJdnvLVvVqxZ/CoP
	9jNAYLtrO45pvlHueQt5F0xRUPTILYq+FN8ajAKYXU7PmDpCbxU3T5EHCFoEAfJdIh0=
X-Gm-Gg: ASbGnctZ9+p7yw/23g+K2NZB2oKKriHLvStRuPDU7/nDGWWe8j16jo406SA1o+XjeId
	gljD1W0EGgDm99vRbGbG5eBg37kdioIAMygfxJX/lI4CsBKSA+4xka3fz8xQSNJkEnmvSm+Et4H
	D1RcvR4W8WzituRVAC8PU94nsg7PnFrEjxSOgg7/q3kAuf8tTO0NPwXvU8R3jjxyPJQaul4JSm2
	pEumgt59rViNJZNQ+RPiMldmHb7lxB7J13+ugabVHm9BlWQMpbTHZ4//ldRFw23OnhIcwTdBgjv
	iU7liPLPJc0F9i5UP1JjqZX6LpRYtCICHFQkwrgKRJ8BRW64tfs2fiUpX3kcqwxZkFbkrYyiM0/
	Kkoq09X2/BnEYc45+zjQnRUDW1/bKDuwz0dRPznDmpbbLGGfXAgQ6txrVE9+mkY6HFDD7
X-Google-Smtp-Source: AGHT+IFhW5FDzxG/DrIFeUUNeUlzbj3BhNh/l1zQe6tmHrs6fvwayVAJZQZgWyQGZJc4tpkBCtcb2A==
X-Received: by 2002:adf:f749:0:b0:3b7:8146:463c with SMTP id ffacd0b85a97d-3b79503d1c2mr5387186f8f.59.1753980715236;
        Thu, 31 Jul 2025 09:51:55 -0700 (PDT)
Message-ID: <d12c4f2b-c051-43bd-a36a-b07432a40223@citrix.com>
Date: Thu, 31 Jul 2025 17:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: deviate intentionally unreachable code
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <fcde5a987aba5f7a350128aff645631baeec6778.1753976981.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fcde5a987aba5f7a350128aff645631baeec6778.1753976981.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2025 4:58 pm, Dmytro Prokopchuk1 wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> Functions that are non-returning and are not explicitly annotated with
> the `noreturn' attribute are considered a violation of this rule.
>
> In certain cases, some functions might be non-returning in specific build
> configurations (when assertions are enabled, i.e., when `NDEBUG' is not
> defined). This is due to calls to `__builtin_unreachable()' in the
> expansion of the macro `ASSERT_UNREACHABLE()'.
>
> Conversely, in builds where `NDEBUG' is defined (assertions are disabled),
> the macro `ASSERT_UNREACHABLE()' expands to an empty construct
> (`do { } while (0)'), which does not affect the execution flow. This allows
> such functions to return normally in such builds, avoiding unreachable code.
>
> To account for that in specific builds, the `noreturn` property of
> `__builtin_unreachable()` is overridden in the ECLAIR configuration to
> deviate these violations.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Thanks.  I think that wording is much better.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

