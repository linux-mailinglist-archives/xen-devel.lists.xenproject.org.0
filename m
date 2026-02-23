Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ4PIiZ8nGm6IQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:11:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02F1796FC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239202.1540646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYWW-0003JY-IQ; Mon, 23 Feb 2026 16:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239202.1540646; Mon, 23 Feb 2026 16:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYWW-0003Hv-FH; Mon, 23 Feb 2026 16:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1239202;
 Mon, 23 Feb 2026 16:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYWU-0003Hp-Rk
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:11:03 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d46425b-10d2-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:10:58 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-483a2338616so28526975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:10:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b3d88sm296766105e9.3.2026.02.23.08.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:10:57 -0800 (PST)
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
X-Inumbo-ID: 3d46425b-10d2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771863058; x=1772467858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0xqY2GZz/KcJBf0gcXpjehno7SgpGoG2AEqkcKgBM=;
        b=WOSCn/40IJqJicYgJDzhwzMQmUq1uTciqTwHAPV50lJnYm3kfOly4K+oKzBvFzhyer
         Q0NkriZ8T0uMakwkusLkLfDjxQOANrn6WgKJvyzjIgneHgqYQ7yDM/YOF80YDcYIcvNv
         5ex3pXaupJAl6b3kvaG+dWcH08sfMV0ig6irMlRdkfe238sYPK67fSuksdOZlcnZLarH
         Qkl1NXfFeuQeBEJjcsJgG8V2RZ819tABZeIqM/aJPBQpRYdWTuqHQmpncFHXvwD4gkuf
         jhkvRTl7GAP2cOJs/Hqj/J+4ZCBbdcQqPp67bIu3TkI1T5xBKsQitKK6nDbOkMwkwkz1
         dypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863058; x=1772467858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx0xqY2GZz/KcJBf0gcXpjehno7SgpGoG2AEqkcKgBM=;
        b=k7pa7aD79++SjmudWoEZNwERr0lHq6HkR8bhMY2MoS6AG3LS28XbpfyCANw+nCIRS+
         dzp9G0b08sb8Yw21WzFnn/ftUUfGMP1/fczrTVqW2g9dw5Z+VXx+hQTB2gR7u4NqQR9y
         D1SO214xWu08X9QVB1OfdJh/XpoqvXZ3+YiqzYGcA0vQY+O15j0iZzPtH531xMdgCAU+
         CQLqDgoPn2t0vqIPPY/12OZEj9h5EpsN99pfDTn5yNGOOMX8QX58bAAo1kK0+7gTUlPb
         H3NqI9GKoDYzhcDNZF4WwlNLnVqXWRgiN54MikzBEGNMMBsUFCvQ37ebtoNL2DvNqcIB
         oO0A==
X-Forwarded-Encrypted: i=1; AJvYcCURA+8faFrnXVjpLDT2i6lbeN090YjQESR6wXENfQUxUX+gMuQu6jxd6QWGsB/HU5WAkoO9wUZwskU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXLBx/cBAGcSXnHL5Fon684/mJeaPAE0WU7gzQLaasNsIYxCHq
	hj/WTOWwCre+JdVCrg8IMscPAVEOyQ2ItezI/quo1ChoUrZxsEZoSiG5ISUvSZI0ww==
X-Gm-Gg: AZuq6aK7IqTDvWAYZZLdFanBOf1671eFACGkfuA/v1nrqQMT47qN+neO5ltL18C3aCU
	hROrIb2sySC0NnoCnFFree1jAU2C0EpqXaG53/VllcKGzr4jggUpZtQx4np//aGJ8+c5TIQIYCS
	Fx5AI8/stSqcT4gDogxTJk2rOmS4IJLju0h9yXQmX++FHlcxNwwawbCSKk765LIc1Ov1VrxNTRv
	w7oRh17690FiE+W6vi4+zMzsqrqVUmyJmn0JELz3sZZjpBud76B2Eotdb2UxnLS93o/7qq3f00+
	jevOzoHlRcNvVbhyUCRKjildOuZFvGgyxbhg+XyFN7mKiymQpFbTqP9CecNoyree1U8ETaWz9WH
	MrprgrjAOR8c4cCjdRnc+0gljngQTkBNHuwsy9hIhOLqNU0V3RHR2HZo9OeRbmL/dl8JE0RVGlY
	vtDXWEpvoO7QiZ11rBuL5LwIsmT03urLg/Hu1hUeNqIg2lkQfS7WnALXBzgtY0G7YuOLlLrVnb5
	9aei+44xbwSomA=
X-Received: by 2002:a05:600c:a11:b0:483:361b:deff with SMTP id 5b1f17b1804b1-483a95c9e16mr161709705e9.14.1771863057758;
        Mon, 23 Feb 2026 08:10:57 -0800 (PST)
Message-ID: <7f6cca68-f681-41ce-8d2c-2f4854510759@suse.com>
Date: Mon, 23 Feb 2026 17:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on clang
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
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
In-Reply-To: <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EE02F1796FC
X-Rspamd-Action: no action

On 23.02.2026 11:04, Edwin Török wrote:
> clang-21 doesn't support `-ffixed-xmm0`, so `%xmm0` won't have the
> expected value.
> Disable these tests on clang.

I don't think that's what we want, and not only because of the clutter the
various #ifdef cause. We want to be able to run as many of the tests as
possible, so the first goal should be to find some alternative mechanism to
achieve the same effect. A global register variable comes to mind as a
possible option.

Further, how did you arrive at which tests need suppressing? I don't think
we rely on an "expected value" anywhere. I don't even recall us passing
-ffixed-xmm0 when compiling test_x86_emulate.c. We use that option when
building various of the test blobs, iirc. And the comment ahead of the
first use explains why we use the option there. (Later we also use
-ffixed-ymm<N> and -ffixed-zmm<N>, btw.)

Jan

