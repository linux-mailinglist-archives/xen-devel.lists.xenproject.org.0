Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6418FAA82
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735137.1141290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENLL-0006FN-1C; Tue, 04 Jun 2024 06:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735137.1141290; Tue, 04 Jun 2024 06:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENLK-0006Dq-Td; Tue, 04 Jun 2024 06:08:22 +0000
Received: by outflank-mailman (input) for mailman id 735137;
 Tue, 04 Jun 2024 06:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENLJ-0006Dk-8h
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:08:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d775fb64-2238-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 08:08:20 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35a264cb831so4711444f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:08:20 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0667366sm10454887f8f.111.2024.06.03.23.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:08:19 -0700 (PDT)
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
X-Inumbo-ID: d775fb64-2238-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717481299; x=1718086099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BqYI80v6FfEZxjPMgqKjjNEHa67mKdhCDPCzBtylZ0=;
        b=Dk/Wsa0y2vSnWgMvxFwXxm/UC1dl+R9SjI8HCVMZbt1zpmBbbTfybTTuqqRtGufsRm
         OTOGpUHxnWZA0Evy2MpILwvfQPEkkNMv4hw83gaF0tR5MfdkL/Ns3GicC3N9Htb+wzHR
         pP04vUjRAT+d0FPbRuUgO3PDYmrO0ltcLtw9xfnNkMKnaPnThl5VoCVlwKtGFgNWtxBE
         FzwkZz5/9X4ZcQRQ8+a4h8CSg20O4UNuf9OPf/8M+48RvPLSU6v1BaDz7Q8WDB5Eyrln
         CQBslhM2u4EQ6ppac+eJA3i9ACxfaJgKfh02JsK80cUdR4KeOabBhn05UQu2OOo/RWQ1
         PZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717481299; x=1718086099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BqYI80v6FfEZxjPMgqKjjNEHa67mKdhCDPCzBtylZ0=;
        b=uj/4V8YPZPM5Akf+9tpgD6Tctwm4gxJBvHa9n00Xhjy9cIkcPrZSeBKwpfcJsyaPAy
         O9Hrd1gfwtjfREUntsEENz2mJSZ7xtJUqCmvM2ZRiEDWG2yl95Sfrc7ESMrJkyj4vV3b
         V8IQSNyblH+kXN44k42ttHXAyxg5uEv24f8SjdfpcdpK5vR6PoNZZdeC9M/P4QViPRwD
         tKUbI8v4gBEFf8kfqNJ4pA45nys8aYbl3vgbI843+kGzOKxUIUvK7mOTkK4vB+CF/wu6
         GpShDM6t8P2qhx6nRG0JA/Tj5tnY5TO+pZc1SCuBJDpfGfzw2BeQEGo4s5MpfbNFOToh
         nhXw==
X-Forwarded-Encrypted: i=1; AJvYcCV0jYt4ZXKRj4ZUmB9+cjfHzQWEgF9OI2sPdElwQ/zp8kHdJK6KJlDbIV7U1LyNu4ZeBgUHxxGbDIDc56Kyhewh+KmXJTkJVudMAUnAhUE=
X-Gm-Message-State: AOJu0YxXKOzEuJvlVqN8Rh1ww3wazydQuJ2z9HyYS+wneOD3r4EPglEk
	JZW9rOatBtbBzBcj0QnDxxlLNbOson9yXJxKVFx9XwT+WVKy90ow7vvBPnNLNw==
X-Google-Smtp-Source: AGHT+IEEiR49CbbboKVfYlW0/iIfY7EqBK9fjkYBdVzxHRykLjUZ7Gj15z4Udn1Z2iD8ePD2YNt2dw==
X-Received: by 2002:a05:6000:b82:b0:35e:7d1d:24b5 with SMTP id ffacd0b85a97d-35e7d1d2542mr831056f8f.64.1717481299505;
        Mon, 03 Jun 2024 23:08:19 -0700 (PDT)
Message-ID: <02262bd1-4d2f-413f-bc03-58c7181be216@suse.com>
Date: Tue, 4 Jun 2024 08:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] x86: deviate violation of MISRA C Rule 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <475daa82f5be77644b1f32ecd3f6e66ccd9ac904.1717236930.git.nicola.vetrini@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <475daa82f5be77644b1f32ecd3f6e66ccd9ac904.1717236930.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.2024 12:16, Nicola Vetrini wrote:
> --- a/xen/arch/x86/include/asm/shared.h
> +++ b/xen/arch/x86/include/asm/shared.h
> @@ -76,6 +76,7 @@ static inline void arch_set_##field(struct vcpu *v,         \
>  
>  GET_SET_SHARED(unsigned long, max_pfn)
>  GET_SET_SHARED(xen_pfn_t, pfn_to_mfn_frame_list_list)
> +/* SAF-6-safe Rule 20.12: expansion of macro nmi_reason */
>  GET_SET_SHARED(unsigned long, nmi_reason)

Before we go this route, were alternatives at least considered? Plus
didn't we special-case function-like macros already, when used in
situations where only object-like macros would be expanded anyway?

As to alternatives: nmi_reason() is used in exactly one place.
Dropping the #define and expanding the one use instead would be an
option. I further wonder whether moving the #define-s past the
piece of code you actually modify would also be an option (i.e. the
tool then no longer complaining).

Jan

