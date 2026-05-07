Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HU/HFJI/Gk0NwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:07:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D483B4E47DF
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302270.1576243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtlg-0001XZ-Iw; Thu, 07 May 2026 08:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302270.1576243; Thu, 07 May 2026 08:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtlg-0001V4-G1; Thu, 07 May 2026 08:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1302270;
 Thu, 07 May 2026 08:07:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKtle-0001Uy-LP
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:07:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtle-00G9p0-28
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:07:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4843-bab6-0a2a0a5309dd-0a2a450ada76-8
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:07:34 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4845-56b3-0a2a450a0019-d155dd29b97c-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:07:33 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso61762f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:07:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055d381c8sm17336290f8f.33.2026.05.07.01.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 01:07:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778141253; x=1778746053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xfr62DcIIUWWm4hPcOs3XwXa0IckLZIW+oW7CImqmB0=;
        b=W/tydAbch+Kk+WxZPBlScD3m1VUnr8dVStsuC3i5h/an8Rn87QaWni30NHp8azs4Nn
         +SgFdNbjeXqZ127QZKjewL1h+OAI6tapydEdgvr5eidRp8Xx3OexOk23+yzTQhrSdo/b
         7fSFD4/RST7A369DekH9i9NQH3hqf6wLIhqKQYSV+UZjrz7CxhPpjQvj7M+jR3FM4TO8
         tFLRzulmxJtniMvuOHn3VhkAKFAGRogTPvWP8mHk80Px+XaDbRyUBP7P0Thn/QU0J5kP
         SRv3SSTQpawYP2SF8vTkUQy6qCSehFQGK86gYNZNu1JZaK5P1tAcDwZFwxqsvY1x1Y6h
         7T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141253; x=1778746053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfr62DcIIUWWm4hPcOs3XwXa0IckLZIW+oW7CImqmB0=;
        b=G6G8ggpTPKwtnSI72NUc8Q+QNZFNAtooZGSpPOPtsaZPxeyGUfEwftKsMlDCKx5PSN
         LqMpDDq52fs4VOJywqXK086fuI7L0UBrCzeXDgns0T/RrsCLGh6P9qzv9N7sB3g90NTi
         /pd7xdFsje523yplD/AkPmuYOgW/wk2sueZaWkkyxx3HkDEfWEQnesGHjp2Q0qNLR+M+
         H1zNFnC+A/S9rWOyJR1hJ04kqfE3x6XzBtActefWCZDrVn6Hw6iyvGk4Q3JwuUq7FZRM
         j+Uiy6sO7f7sWh2eIgzPJMPbwwX6qZLf/rS1MDm1XKda5TnIBY/lE/k494Z3yzIRVKYq
         qEVg==
X-Gm-Message-State: AOJu0YwZUyoYJVPfR7I/zf6o3xmxhxVzVa63i7hP7bls83H2czmyVkNa
	c6imSlwO9WNn3YLS7RQ7Bsjr8pTrPi0NfeTkib/Dm+4SbPayJcpOWR3avtPfLUGshA==
X-Gm-Gg: AeBDieuAjiwWafWwjt9iJpGtPSnixuIKVtDWkOatixaacGnqUWbH6gc28hZQ+Tgw+zU
	Wf8As595jSW4+Vy7fN6EgoH070ADq9IVU0baT2kezIbOl5lS4dHjnWbH6FMHZUIxGONtefGe7m6
	bDlNyXTj8RVI7hPvAotENUQYVcggnyX+jpyzW+8yr6IFyn7/LuN+Oj62MQS6+Dw0zb2pUMcAZzK
	r04TOrM+bzShTBkeE6bmJweuoFmmxsSTYjd+6yfrWjNl2XkpUwCaPYT0n5cliiLTd7QPV+NIkm3
	sIqqSGDSPj3R1IKBk3S7TgypkhEIdAm3/LrgjQJSp32rDCMhIsK6iIqNZV/+WLb6wDCFkkIYwAp
	rnF9Q5+nAf35tUqNibx5cP0YFTkpvUGtTMxrJoud3hKegjYiyW8iCX6q9LZlstCgmiB53huhKUw
	627soVBqKYI6bxPvYCI3lLKTr78H3umDSmOqh+UYZBMOmOTYtJXYaEIX1AZjHgpDh0ds/KsKwvF
	jkk8G69T6YM3ktQa4hXAdlHAw==
X-Received: by 2002:a05:6000:1868:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-4515ce1c7b6mr11950984f8f.21.1778141253217;
        Thu, 07 May 2026 01:07:33 -0700 (PDT)
Message-ID: <579169d1-8903-4056-b997-b8681f1452a6@suse.com>
Date: Thu, 7 May 2026 10:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] - Call for agenda items for May 7 Xen Community Call @
 15:00 UTC
To: Cody Zuschlag <cody.zuschlag@xenproject.org>
References: <CAJbE=KyTEfk_rrJgOfYBkLMQEUuheC+J9j_Aq+nFBRKbmFwmPg@mail.gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CAJbE=KyTEfk_rrJgOfYBkLMQEUuheC+J9j_Aq+nFBRKbmFwmPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778141253-7D1848B7-645D0950/0/0
X-purgate-type: clean
X-purgate-size: 765
X-Rspamd-Queue-Id: D483B4E47DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 05.05.2026 22:02, Cody Zuschlag wrote:
> It’s time for the May Xen Project Community Call, happening this Thursday
> at 4 pm UK time.
> 
> We’d love to have you join. You’re welcome to participate or just listen
> in. It’s a great way to stay aligned, hear what others are working on, and
> help move a few ongoing topics forward.
> 
> *Preparation*:
> Please take a moment to review and update the agenda ahead of the call:
> 👉 Agenda <https://cryptpad.fr/pad/#/2/pad/edit/eJsr2xpwDAzk5xVxOmq+iB+G/>

Back to cryptpad?

> Feel free to:
> - Add topics or updates
> - Suggest anything we can drop or defer
> - Include links to patches, threads, or docs where helpful

Mind me asking what the difference is between D) and E)?

Jan

