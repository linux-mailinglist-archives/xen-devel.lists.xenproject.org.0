Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF90C7HrpmnjZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:09:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496E1F118F
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244815.1544184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQRO-0008J1-LX; Tue, 03 Mar 2026 14:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244815.1544184; Tue, 03 Mar 2026 14:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQRO-0008H8-Ir; Tue, 03 Mar 2026 14:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1244815;
 Tue, 03 Mar 2026 14:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxQRM-0008H0-Ni
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:09:36 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b13f9eb-170a-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 15:09:34 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480706554beso63433095e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 06:09:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm24477539f8f.5.2026.03.03.06.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:09:33 -0800 (PST)
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
X-Inumbo-ID: 9b13f9eb-170a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772546974; x=1773151774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PcPUAgrZWGvWRnkTHeShUzedQXW2PkdQLjlKa7JzF0s=;
        b=MrZto8OGBEkYEKQuulYj7i0e/kWv8bi7rVG/ipxF2+ujoXpBe5IS6/xlsq8jMetuFl
         L3i3keEFJIQ28/hG3GA5PPyGqoVs88eU6FxKcEkKVQxt0SgJyogLoayKTlqcC/yAyLYV
         brx4lJU039w1ta6BDn9N8CB0tXMmkjxo8r0RmDc7UI0wVwo2su8ZeD+V6o3kzlEfJ+lD
         DL+H2+Bn4HtOpRZQ4Af6M++GULOZtfuUZ2hAraW20q3xpQGgm43oW4fPeOCUd6gpB2HB
         QhPjSuYNlC9kjsPJATStOjW6FtOa5VCJB9tufNf1zICwVicGyrVLMWEyvw8mng1m26S7
         VPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546974; x=1773151774;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcPUAgrZWGvWRnkTHeShUzedQXW2PkdQLjlKa7JzF0s=;
        b=LX+w9Us5eJfd/iN8U14sVoD1PzboDnRyu+dcpAwPSmW7HUd2DXJuOGhRnRxqZyyLP8
         tUurJeri5D1bsPWYLfrhe6YkYCYntltaY1TvFwq0haj+ZzZjTDmh/EedJdHPe4J2tzl0
         A5NHkpsznKkkxZQHf/9SkBUSi9mSzBxPUFWuXaicXvvvs5yeOpWf4oLxkUksGfr4a+tV
         DwpJxupbk5+2fRJ2dncWNSa2U6PYlnrvmsFCSUzixbqzEl88p60Fn6Vff3BtNTwLEVKS
         t4E9H8IJenaI2iopdV9m2N0a+qd4LIV3Mwd8QJexqchFURXzpmVZgysIRQWF+Q2/kQVX
         0MIg==
X-Forwarded-Encrypted: i=1; AJvYcCXKZqLH7RLo1dqcgJ1oVl3yU0414VEyf/enulEG1A0FVo3uaty+BEY3dk8a7r4jwD5RKEIUk1A2ah8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjXGRfV9+zOCgzMdtX8/CWUINKThYQYnJ98cXDsC0DKe08Y7tw
	f1Xam1teIMnZFltJogiT8ajx1hN9RxLTac3MpCuH5oy+cBmY2e2R0Pb9SktArbYsZnUwIslt451
	5Y/w=
X-Gm-Gg: ATEYQzxRe4gvk5efVP2bEU+vn4jVDR4aaWJ8sTQaAvOy0OQ9hyZnLoAdmy8Lh3CjwGV
	EZaZJpb/g/1ChL6BfjBX/X+zHaXNfDIoGKg/uy15tKDVhJIv7EHMO7lVMVBp3NUDiHpcTIf/aow
	5sjAtGHvvd3ER3bGV7jiCR/8xiZGNH9zcYmx2BBzonRZa570TCFCF6IrRB0gue/vrvqMuUhLmjg
	YgkO5zb0DUbw/Reh4Q45g8BFedD+fQQhWZmxCJCFDu4t8ZzhPdsJTaZLlrTUXzfzoCcM305KAVS
	2NVk9GCBubxs8YR4CRkFFmqPHsruSs2nepGUzGITATuRrnKNqFUNQC/VVlwwzqBJFgbCtLGskY3
	NkFK32CNAmx5VPvEJh6DTuJcow1vAuRL/OSFTKd71Ic2ibtpKXB5qcDiFWmDhB4W97HKiKVECcY
	JPBVfgAh0EfKKafISuF2GEyAunJXpx0AmHXGH7AIGDraWfsHYOdGyrCCSJyhquEZL5/QmDxGH3V
	V1BrxRTvRpaBGs=
X-Received: by 2002:a05:600c:548a:b0:483:aa2:6bce with SMTP id 5b1f17b1804b1-483c9bdb0c2mr262897845e9.30.1772546973894;
        Tue, 03 Mar 2026 06:09:33 -0800 (PST)
Message-ID: <803004bf-ab0b-412e-9892-e22db70e918d@suse.com>
Date: Tue, 3 Mar 2026 15:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
 <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
Content-Language: en-US
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
In-Reply-To: <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9496E1F118F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 15:07, Jan Beulich wrote:
> On 27.02.2026 11:58, Edwin Török wrote:
>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -1100,7 +1100,7 @@ int main(int argc, char **argv)
>>      regs.edi    = (unsigned long)res;
>>      rc = x86_emulate(&ctxt, &emulops);
>>      if ( (rc != X86EMUL_OKAY) ||
>> -         (*res != ((0x2233445F << 2) | 2)) ||
>> +         (*res != ((0x2233445FUL << 2) | 2)) ||
> 
> Why the L when res is an array of unsigned int? With it dropped (happy
> to do so while committing):
> Acked-by: Jan Beulich <jbeulich@suse.com>

I should probably add that nevertheless it's not quite clear to me what use it
is to compile the harness source itself with sanitizer options. I can see that
to be useful for the core emulator files compiled into the harness binary.

Jan

