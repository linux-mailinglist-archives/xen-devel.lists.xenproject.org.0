Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFVlDhC5BmpAnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:11:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BCE549DE4
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309562.1580602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNllK-0007Bs-FI; Fri, 15 May 2026 06:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309562.1580602; Fri, 15 May 2026 06:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNllK-00079X-CN; Fri, 15 May 2026 06:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1309562;
 Fri, 15 May 2026 06:11:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNllJ-00079R-Jo
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNllI-007PYK-Hi
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:11:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06b8ee-5cb7-0a2a0a5109dd-0a2a4501aa48-36
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:11:04 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06b8f8-c1f2-0a2a45010019-d1558034b090-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:11:04 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so85677845e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:11:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab52a6sm35537855e9.10.2026.05.14.23.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:11:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778825464; x=1779430264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVL10f+o4MmNin1nn3KWDZDVZl0inQKW5lNVeEjhFHA=;
        b=Ry3tWJl5gPWHXrmPqsf71QMgn6n+YiH0yguBuckIZt+bFlVZVIkYweJazZmuyI/V80
         h9BK63n1Wyq996BvGY8+CVPJS9WZvj7XZsnSeYMzv2w7zl3KH5NBRAP3WkKACJySRGtk
         S5JSDphud+GzocltwGOZBzP8xPLpDWxKShQI2KrJy8eiOcxXIc0ZKVIVbmUmGmec7IYU
         mgr7xazs5ElsDI6Hj2jl2T+9M+1oRAzIMnq4ygZAp9mbk5i4IFwK8cmqsZkVapTJ1x5O
         QzWEjo78ryDcnEyLB79KzOww1vWYwRywnmcZVQ6+5FCDlcs1qoImhnmY4dNy0kWWmT0R
         ipBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778825464; x=1779430264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVL10f+o4MmNin1nn3KWDZDVZl0inQKW5lNVeEjhFHA=;
        b=LxSaCkIpvtYDlRrkhcOGNQJbG3FZyinsGw6Sk+atY9VskSnQ7hJz2pQ2Eo6ACznYym
         2qXvKRG8EjUe0QPjBJv3KIrYHBrOVvAQ8bretE6oqLgWmpPDhsfYvTzAwWF+bv/vDf+d
         B0zl9NZhDBTetf8lSdmZd2YvmjXcqaeOEhZkmRR21snCD3KlADankNpKhfoy+nncrjE6
         QC3pMbtgMXui4hE0D/yVdF3w0553sJrHbPca4XUZ5ajth60detUH/5Dn63+o204qqiKt
         eSdAP4aAXe/bmttLqzP6g8soEGjBHR8VeoHQqQ2THHbdFB2Ar7l/vczz2RaFtnsJgLF4
         Xmcw==
X-Forwarded-Encrypted: i=1; AFNElJ8m60kqYPl8gFy29XmkQgONlQ7T71/rxDxt8hbIhSFDCrUZSngg3QN1rPIUMM46ThELZoEgpwAcBkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBkytK1KLJZkMBU4ZoIoDnEIHQxy5pJ1ejF3nwx39q34kgbfqJ
	FKsKXGW5As6cTM/csvXWxDH8sFtOizrYBJgBUT7+R5NiCw1jGPb8C5U/T9RnPnaZhQ==
X-Gm-Gg: Acq92OF1VtlxQfP8xY28+YggPfm3d3RA5gSuns1WuPq3YvXv3vQUHhE56oMeNAC64Mb
	zr0RtH2LhN8UjrxvvocJaBVHCl9fqPj7NG2DqX/fn4qZPwz9jAd18RdDiV8X0lDpL4HM8xp9awB
	pcgjwAkHWf2Ucz1zYVYsXhZKgj0JZLYUYR7RHIExldtKuOJl1+QBfiNUa5fGnMRMiUkO2u27HM0
	ujjVNNLQU8Hgj9nOwYaDbAqnvBC63anOniZmmzYOaZUdgA8b4+cRYpoq+HxlfrwbcxZa5z/9Peh
	R14/5IjVT+ZVyPtuNoyuVbzTYhsQqzrg27EW0gjsJhNVgqtZokIGXwipnjwrc/9zpmbBuP+tgNy
	glkHYmRG/wAX8C5S81Jf6lu1037BSAwbQEzYNdqC+UOQRCLHZ0UE92NEpJ1A9/xXvDvw9p8b+0x
	82Jad7VIYRMb2RsT+mdVRXHvYDwZHr4n888e5rIhz4j2Si2JZKk7Znv5GahUk7Hyx67HU4Htwln
	JH/rzBnrCl88Ys=
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a2 with SMTP id 5b1f17b1804b1-48fe65148e1mr25475715e9.32.1778825463794;
        Thu, 14 May 2026 23:11:03 -0700 (PDT)
Message-ID: <39b78725-1d4c-44f3-a64a-1d243a61f8cf@suse.com>
Date: Fri, 15 May 2026 08:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] crypto/rijndael: adjust for Misra C:2012 rule 8.3
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
 <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
 <1f8c7aef-1432-4026-b97a-acf9a3d06330@citrix.com>
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
In-Reply-To: <1f8c7aef-1432-4026-b97a-acf9a3d06330@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778825464-B715BFF4-CCFF9FD9/0/0
X-purgate-type: clean
X-purgate-size: 1975
X-Rspamd-Queue-Id: 99BCE549DE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 20:11, Andrew Cooper wrote:
> On 13/05/2026 3:01 pm, Jan Beulich wrote:
>> ... ("All declarations of an object or function shall use the same names
>> and type qualifiers"). Bring declarations in line with the corresponding
>> definitions, accepting the use of the being-phased-out u<N> types. While
>> we don't define NEED_RIJNDAEL_DECRYPT, cover rijndaelKeySetupDec() as
>> well for completeness.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/include/crypto/rijndael.h
>> +++ b/xen/include/crypto/rijndael.h
>> @@ -50,9 +50,8 @@ int	rijndael_set_key_enc_only(rijndael_c
>>  void	rijndael_decrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>>  void	rijndael_encrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>>  
>> -int	rijndaelKeySetupEnc(unsigned int rk[], const unsigned char cipherKey[], int keyBits);
>> -int	rijndaelKeySetupDec(unsigned int rk[], const unsigned char cipkerKey[], int keyBits);
>> -void	rijndaelEncrypt(const unsigned int rk[], int Nr, const unsigned char pt[16],
>> -			unsigned char ct[16]);
>> +int	rijndaelKeySetupEnc(u32 rk[], const u8 cipherKey[], int keyBits);
>> +int	rijndaelKeySetupDec(u32 rk[], const u8 cipkerKey[], int keyBits);
>> +void	rijndaelEncrypt(const u32 rk[], int Nr, const u8 pt[16], u8 ct[16]);
>>  
>>  #endif /* __RIJNDAEL_H */
>>
> 
> Hmm.
> 
> The rijndael_encrypt() in context is a trivial wrapper of
> rijndaelEncrypt() using rijndael_ctx.  The only user is VMAC which
> defines aes_encryption() in terms of rijndaelEncrypt(), making
> rijndael_encrypt() dead code.  The decrypt side is even deader code.
> 
> It might be worth taking this patch in the short term, but I think we
> could get away with a lot of deletion.

Well, really this whole piece of code would likely better be replaced by
something structured, assuming it's going to be needed at all anymore
after TBOOT deletion.

Jan

