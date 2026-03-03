Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ2pJmn+pmk7bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:29:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C41F2A1F
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244898.1544255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRgk-0004kJ-HY; Tue, 03 Mar 2026 15:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244898.1544255; Tue, 03 Mar 2026 15:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRgk-0004i8-EP; Tue, 03 Mar 2026 15:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1244898;
 Tue, 03 Mar 2026 15:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxRgj-0004i2-80
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 15:29:33 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6481837-1715-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 16:29:31 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b611274bso1591876f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 07:29:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm19777387f8f.30.2026.03.03.07.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 07:29:30 -0800 (PST)
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
X-Inumbo-ID: c6481837-1715-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772551771; x=1773156571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zS3enskoQSQUDWPgiI10AS3enCKqjk/TCB98Gqua3pc=;
        b=S7m4xWR7HkBE4U88uW0r6z0K62mPdLIA9P8q/q3YbJWdVnNM/bV/QeAC2SqJJOI6sY
         nhCSHwulaRrPEAZayDEn8S8sgvtoR09KIaLpx3GKJ4E9JFMtvB8DsAPs6G5ZlkxrraDE
         QRjNXmImCglJevCZTkIchioGPhPvN/NTwLdIeGb+wd4vvqw7eFKlN8vYiLnh8H4rC5W5
         tp2vUxiHraDR4AXGZC4NzNI2Tz8YikAqOsvBCW9fI587iYuUChDvFzNfWaDxC3KOFUu1
         pH4jxRAmMsmhaZSl88IWGgiCYNl+1ccBIHPBM0ieTY/kXiXT4LPxsEUL8Q6jxH0QL0st
         ewUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772551771; x=1773156571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS3enskoQSQUDWPgiI10AS3enCKqjk/TCB98Gqua3pc=;
        b=A9Yrf+xABGxx2yEY7b7EKt0Mde7en2caVL+wg3rdsDhRl6TF1jUEXqedVoaX8J5Umm
         IKKhBA/ij3mvXn91fGrYVszmFl9H4Ld799GfxwDsntWV2FibB3uDQcXVmOTwGLkA+amj
         YeHQYmFc5Rm+T7c0yN4aPMKYYh8xW4waKFM/nwCDjFcYbzxzYb3UdabUu1+QgniI0RfR
         GyCfe14f2nkL7APxbzU1+XFUxR3gfxCUh8vXOtXzE8p2EmHso36mOqRb3MO8O9C8blHw
         h3hHmO+YW6ak2+1t/Dn+Q/fbpRy1iBHfdra6R9x/1MsLtfiVHZy2H+G+Sp5tHvVoQsK/
         12cA==
X-Gm-Message-State: AOJu0YytnaoprUQvEiKkuwRUyzazyTxp0tDUyDLAqKc526FHjDn7IPQO
	7u9BRdNSOGrrEoq7f00qm/pi8/Ro70FDY1DAD1OePOGWJtkUayPq50+qVXmFgoIQPg==
X-Gm-Gg: ATEYQzzCNNd3UgTYyfcSCvJmcQmKr3i+LxD/FM+jv3XlOeI3uth2BG23nVMG8RUoPnQ
	rmexY6X2kijB+zfrDKp3J+GkzyUo9sy9BPA471+m1/kM2FwJ0xuvJe2+OAi9qFhFhB3uuv9tLXd
	GQlHzv8XAjFr5fLkdZPEeWUaqzIH9/St6EOysa9bUPUySmizf6GgXcpbsctVxqpWYbiPiK/DPIh
	h1vF4Bj/cBPJhnmG4e7hXb2NDvXEvZ5jUpVukS4nUWujihPBgTZ4UEGziPEEdMTDcgXGcBfo6Bc
	8pXHhMvIj5AiCiE6utww6XB1k0VtMgTJAPYKcCYHkPmVd07XZIO3euNZt2bWCuOnxL/VXgLGDUl
	QGu8IjhybZtUp3hqZ3tiybxJntityJtHl6oQLNHsx2H/SEZvBi41fKxne7zdQ+iS8/FA17ApGxV
	MzINx0+TrZbWBFl2Qk+mR0gYB27kDc7xVIy1juMRC+gmfJHTBeBMTM3V3eGhIlek3tg4rN+KCYG
	LyJjVPTqne4KRM=
X-Received: by 2002:adf:f211:0:b0:439:abcd:b312 with SMTP id ffacd0b85a97d-439abcdb6ccmr17028997f8f.7.1772551770777;
        Tue, 03 Mar 2026 07:29:30 -0800 (PST)
Message-ID: <8098518d-80c3-4e0f-9ce3-299494aa4f14@suse.com>
Date: Tue, 3 Mar 2026 16:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/14] xen/time: move ticks<->ns helpers to common code
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <545c2af877d519b1186c79fd6108d33e7e52cd3b.1772016457.git.oleksii.kurochko@gmail.com>
 <2AE980D3-571A-4AB9-A01B-EAA90D3EA0B9@arm.com>
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
In-Reply-To: <2AE980D3-571A-4AB9-A01B-EAA90D3EA0B9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 017C41F2A1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 15:56, Bertrand Marquis wrote:
>> On 26 Feb 2026, at 12:51, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>>
>> ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide a
>> common implementation that is more resilient to overflow than the historical
>> Arm version. This is not a practical issue for Arm, as the latest ARM ARM
>> that timer frequency should be fixed at 1 GHz and older platforms used much
>> lower rates, which is shy of 32-bit overflow. As the helpers are declared
>> as static inline, they should not affect x86, which does not use them.
>>
>> On Arm, these helpers were historically implemented as out-of-line functions
>> because the counter frequency was originally defined as static and unavailable
>> to headers [1]. Later changes [2] removed this restriction, but the helpers
>> remained unchanged. Now they can be implemented as static inline without any
>> issues.
>>
>> Centralising the helpers avoids duplication and removes subtle differences
>> between architectures while keeping the implementation simple.
>>
>> Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it in.
>>
>> No functional change is intended.
>>
>> [1] ddee56dc2994 arm: driver for the generic timer for ARMv7
>> [2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
>>                      XEN_SYSCTL_topologyinfo to common code
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Computation is changing a bit from MS to S removing the 1000 factor on arm
> but i do not think this would have an impact so:

Well, as the description says, this removal eliminates a theoretical risk of
overflow. So there is some "impact".

Jan

> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Cheers
> Bertrand

