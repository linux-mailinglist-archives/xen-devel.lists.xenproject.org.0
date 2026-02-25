Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM9xGU9Qn2n+ZwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B9719CCB7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241035.1542269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKk0-0004Dg-7A; Wed, 25 Feb 2026 19:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241035.1542269; Wed, 25 Feb 2026 19:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKk0-0004CF-4S; Wed, 25 Feb 2026 19:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1241035;
 Wed, 25 Feb 2026 19:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gY1=A5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vvKjz-0004C4-5B
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 19:40:11 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cadb8b89-1281-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 20:40:09 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-354c825dc77so3273892a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 11:40:09 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359135ef1d7sm1966201a91.5.2026.02.25.11.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 11:40:07 -0800 (PST)
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
X-Inumbo-ID: cadb8b89-1281-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772048408; x=1772653208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6eg/6/iWGN6yvIdu8IOwUGupRbhzHe3YYFy7xHBxCo=;
        b=c6b0T6ljcR2Q1kS/mM2/3nO5w9qVXehAIfNI9nsR1c6Mr2FChg6am6sr61mZ81C0lx
         +QTlkjo98cRFlfU8dZVJDD8bGFNom0AU+xYItSXv9vMQdR6PRz1qNsyfhbzhI1TJU+ss
         1T4onffnlBizibthd+Tw1459t0HR0C7WzZe8q7N127zS6LlsuhWJatdAZRKtBXpwtcYT
         908kYEpyFOR9wya2SdA7IHKj6470lYnV7InZsxA5xkQaxJJNB22I1JFjdlnkERx68daj
         XpafgSdGveGxf62DS5iE3UJ+ps31sKVNN7wgGDS6+bhC+29fr9TSeUEaquxNyGBi6YWn
         UQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048408; x=1772653208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6eg/6/iWGN6yvIdu8IOwUGupRbhzHe3YYFy7xHBxCo=;
        b=hDCpAcHNP0vKWCLsMrC0NOR2M3hewMueTuLpuo1MMUVBiV+W22n1k79PTr3HALOx9o
         qI7yEKGhVRRV7WYOeGEdYf/ttWD6VyOJYQfRT6IJHLxCZDKh3RZ81/VxdmPKNSzT4hCs
         18EyTDSvUhN4KSOabyQV/LzfiAk5ytKkZ+DQRwcHfpRwGE3A9LKNPuuD7KPEEPT+nKTC
         2jBO63I75lDNUKKH4CesXjRW4qfQs822aBzHMUOFjiZNc8w6fFFTFoNx0wxZbrkPqJc9
         P1NSmMM2YhF7eD3I/TOx3CiX0c5JfHLRn9WXno+VkMEDKRNfgmoxG8zVUmPe5INgqgdj
         arfA==
X-Forwarded-Encrypted: i=1; AJvYcCVXEa1zJLUNEgtGJL2usCTrH+tM9+/qDTVgJ4QzOgEuwGtjy/wut7U6UQL3gGkSmWwCJWZ72iAsZy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2UdA6R+zmYGbYCrS7idwdZJyXBOwKRRm9/O0W+ldvdKxUP0ee
	zyk9GmI591L2HZ+9MRl2j+3TRkD8+2ag5Jnavyu8c8Nx6Ey78d4xm7Wo34u9at19qNYU/LHT36t
	COKTs
X-Gm-Gg: ATEYQzw2qObP5fGKQUmnYzyet/s2iL4vQ7RvRP+2DUdBdA+dfRnPyuvm4eioFK7vH8Y
	XK0zsQh5oyL1cWhig/3XOoSWAOW6CtIGuUK5rwtgUhgO1JLl2PFSzNaRJs8R9aEkCSt7RPiFWoT
	SNSLaGHy6VKJOfpv5Nr2Nn4rJfTHlf3iuHpUgAF6wawhoImvvxqOyQXdLe3OPKm7reWeRSrFx+I
	IkWvjoLUIbnhMtFw7Nv9ew4zlyxg8sJTWx69WiQP9B2jEfAUnxggny4tYn8xIKCJVZkQTkGtzLL
	2V0PyjshdbzU+7jllOYTsrCwUFX+KTqSBZIT05Yb5iccgVzL2kO8nhHYBNjXoQMQN+BYv3XRSz3
	RfZPQisQIu/8lSbXZdNBmM0JBa40vyIg3WTCqOzzWviEWtpbmyTBQfgjsr9itT+VrG9xyW2B2Fn
	U60ZQ1Prmqk9/vd7oXr9Vyz+0/S6FaIm9YhkLR7xhDDxUZ7kEptuI77mvLFNH6OK+bcoB1
X-Received: by 2002:a17:90a:c887:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-358ae808fb4mr13664176a91.12.1772048408149;
        Wed, 25 Feb 2026 11:40:08 -0800 (PST)
Message-ID: <805deb11-cba0-4567-b296-7ee35febe18a@linaro.org>
Date: Wed, 25 Feb 2026 11:40:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] accel/kvm: Include missing 'exec/cpu-common.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260225051303.91614-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 18B9719CCB7
X-Rspamd-Action: no action

On 2/24/26 9:12 PM, Philippe Mathieu-Daudé wrote:
> kvm-accel-ops.c uses EXCP_DEBUG, itself defined in
> "exec/cpu-common.h". Include it explicitly, otherwise
> we get when modifying unrelated headers:
> 
>    ../accel/kvm/kvm-accel-ops.c: In function ‘kvm_vcpu_thread_fn’:
>    ../accel/kvm/kvm-accel-ops.c:54:22: error: ‘EXCP_DEBUG’ undeclared (first use in this function)
>       54 |             if (r == EXCP_DEBUG) {
>          |                      ^~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/kvm/kvm-accel-ops.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

