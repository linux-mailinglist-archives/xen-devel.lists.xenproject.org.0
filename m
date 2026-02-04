Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCYJGV8bg2l/hwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:11:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C86E44D8
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220348.1529059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZr8-0005g0-Hg; Wed, 04 Feb 2026 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220348.1529059; Wed, 04 Feb 2026 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZr8-0005df-Er; Wed, 04 Feb 2026 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1220348;
 Wed, 04 Feb 2026 10:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnZr7-0005dZ-1h
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:11:29 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de215bec-01b1-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:11:27 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43591b55727so5783682f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:11:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e250bdsm5088737f8f.2.2026.02.04.02.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:11:26 -0800 (PST)
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
X-Inumbo-ID: de215bec-01b1-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770199887; x=1770804687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D8fdo/jC0fVXmZul/wndVT07+KnjQo1bkiPNOYU8vrM=;
        b=CHG/ar85DTE8wwK+/fZetE99rO/1NCbzABafPXc4RYHE2+VEgVbOLNDi14wW8RBOuJ
         KcDW2ZE2B/KAZNT/IMiQr/aKCfv/P6N3mFyhH+k/+PVheKEAshdiJ8sUGHhH7VmzwL+j
         4yq/qFO6IUxWCZig+I+tTJf6W9hcS6iwswRKn6P+iwXYNdP5X6HUf3ecSOknJnmxycMw
         YURwil6ZfmDqWcXKNs8w28eCxEblz2KJMN9GUEam+Z1R5OTHAxVGsV0jNzATZ/8FD/ns
         z1CRjKRtxyhOupmc1f91zmTNp7/rN0buRSykuBgLXd3nsMBB409n904XXPB04nRRv58c
         gXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199887; x=1770804687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8fdo/jC0fVXmZul/wndVT07+KnjQo1bkiPNOYU8vrM=;
        b=tGsKkY2DoWMxHVYaBhphHgGSqq//WY0plNNU7KUsuSGnUNKcvboT59f26LlDPMEHDH
         mngkpxoxAWC3kGEyZsdCd6S6GZ7PU/aG/5oIsEn4GyG4PxWVaNuKcuJoHmlG2069ZO25
         V29Fe1ZIaiqfJ+l1o8OK1QbPAUHfuFN82aaSoEmk5m+DRKLSIwOR12EgtDZ1lR1jrwZZ
         rUZxsOoLf7xqVNQ0os6/5jOzpiIc+bfd0ifZTXLd2pQtjq9MvxVtF9ZJ0xMgFnlafhUC
         Groh+NrP5f5+ujRbJBB8/ZIZbNk31FtSw5aUqH9Qc9dLaCyEeuBHpUQGoGhB/lEW33WC
         tRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl5ugsBZmGnIFA+Z74PfSkDR1QrDjGd6RQnJw/HVdQTHKKSd+37h4xMPed9gGv+Kp/dzvoTu5UL6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs3qFyJBxGjF2eP15j1JfTLXpbVh7+Pa4lGZDXuiW6QlyXAF/V
	UIZBDevkVCQb264CjIxn1jD4zQDimojkJWmVMqOXGm7SiENSxteBgCYiTOC3eP2peQ==
X-Gm-Gg: AZuq6aLTFKZaoM7GR7PcZk8zYT+0fuNQkrjn19x9/Xft38gN5pidA6GAWMSiZcukxe1
	HT3Zg+7XDFSvPP6nTjnQmejVNMyrNDyeSr75vcGCAmZFL9/BW98jnok1XQgEOwr0Q2gl9xg4jY/
	6tmK4vkiED/3UPsXYMGlXqAafgFOwleccPCknQf9ExPyLKjWnN7PAoDpiRFykRZUgaaNDT6cJHf
	U5rUTeBpvItmbcRfh87xyQKnlDwKE9clbF27FoGFIY/COpuJWRy4ZD0wTFLNZSBBWU4XiHESgJn
	K7FwWXTI5S/S7xnG21pAKuTLtn8b25g6jM9dIZYtt2QAAln9kMuaK2qKJz6iBXBRnWTQBlmBIwi
	xChxuy/XaEKbSMadCTSvQtDGxTX0NGy6IcjsQsURrK1NnyYl4Y97eAK0hnpRjIfbunsfHvzQ8mX
	7srl239h2AEnaTkZvXb98QDzU81Uhd1HK6Fw4Mv2qXgTGu1Pq/aqze3UwbBqYjZp/Q3EZW7t3/a
	7I=
X-Received: by 2002:a05:6000:2210:b0:434:32cc:6c86 with SMTP id ffacd0b85a97d-43617e41bbfmr2990075f8f.14.1770199886739;
        Wed, 04 Feb 2026 02:11:26 -0800 (PST)
Message-ID: <51e6e0d6-4d94-4035-9e32-37dacf612da3@suse.com>
Date: Wed, 4 Feb 2026 11:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
 <9f2b3559-0658-4343-abec-1a35e7d6da44@suse.com>
 <061f894b-fbe0-4565-a9e2-502c97b1dada@gmail.com>
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
In-Reply-To: <061f894b-fbe0-4565-a9e2-502c97b1dada@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3C86E44D8
X-Rspamd-Action: no action

On 04.02.2026 10:29, Oleksii Kurochko wrote:
> On 2/3/26 6:02 PM, Jan Beulich wrote:
>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/sbi.c
>>> +++ b/xen/arch/riscv/sbi.c
>>> @@ -249,6 +249,38 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
>>>                                             unsigned long arg4,
>>>                                             unsigned long arg5);
>>>   
>>> +static int cf_check sbi_set_timer_v02(uint64_t stime_value)
>>> +{
>>> +    struct sbiret ret;
>>> +
>>> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
>>> +#ifdef CONFIG_RISCV_32
>>> +                    stime_value >> 32,
>>> +#else
>>> +                    0,
>>> +#endif
>>> +                    0, 0, 0, 0);
>>> +
>>> +    return sbi_err_map_xen_errno(ret.error);
>>> +}
>>> +
>>> +static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>>> +{
>>> +    struct sbiret ret;
>>> +
>>> +    ret = sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,
>>  From this name I'm judging version 0.1 is meant. How does this fit with ...
>>
>>> @@ -326,6 +358,14 @@ int __init sbi_init(void)
>>>               sbi_rfence = sbi_rfence_v02;
>>>               printk("SBI v0.2 RFENCE extension detected\n");
>>>           }
>>> +
>>> +        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>>> +        {
>>> +            sbi_set_timer = sbi_set_timer_v02;
>>> +            printk("SBI v0.2 TIME extension detected\n");
>>> +        }
>>> +        else
>>> +            sbi_set_timer = sbi_set_timer_v01;
>>>       }
>>>       else
>>>           panic("Ooops. SBI spec version 0.1 detected. Need to add support");
>> ... the panic() here?
> 
> panic() is still here as then we will want to add support for rfence v01 SBI call
> too what hasn't been done yet.
> 
> Could it be an option to change panic to:
>     sbi_set_timer = sbi_set_timer_v01;
>     dprintk("SBI v0.1 isn't fully supported\n");
> and then add sbi_rfence = sbi_rfence_v01 when i will be first used?

I don't mind keeping the panic(), but what you add here wants to be structured
such that things won't need moving around once the panic() goes away. I.e. you
want to avoid dealing with v0.1 in both the if() and the else. To accommodate
that, perhaps sbi_set_timer_v01 could simply be the initializer of the new
function pointer variable?

Beyond that, once again you want to clarify things in the commit message.
Adding support for a case which elsewhere you panic() on is, well, confusing
without some explanation.

Jan

