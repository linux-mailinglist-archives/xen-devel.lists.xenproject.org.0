Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADOhA0FLnWmhOQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 07:54:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177E18294D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 07:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239432.1540839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumJX-00062T-UH; Tue, 24 Feb 2026 06:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239432.1540839; Tue, 24 Feb 2026 06:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumJX-00060S-RL; Tue, 24 Feb 2026 06:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1239432;
 Tue, 24 Feb 2026 06:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vumJW-000606-7n
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 06:54:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abfb35b7-114d-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 07:54:32 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so3830482f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 22:54:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b8791a0esm34612375e9.0.2026.02.23.22.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 22:54:30 -0800 (PST)
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
X-Inumbo-ID: abfb35b7-114d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771916071; x=1772520871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y75Icv5dwgtdzwQ3i04DyRU2j4QoigItK8pWr55UK70=;
        b=e8isjFeikwOrvP218XcgS1ln4bQyYvVvZ87PepUu/Sd6FAyA3vzt2afoXhii7kGdo0
         v2cmIc2t89G/gpy5MSOuZkLsmD7aHUYeRpGVXZy57su6HGmmOkepNYnd5NwngB5XZo+P
         ERLlwb/s8WPozBPLJa6lJ6wC7spVNm8d5kxwUT0SpAcSLyVj0YsceL0MLlAGXC/9mTpn
         2N/c35Kk4ex2vEA+o89R/eAXie/h6tABFNdL+zdzfFBepXYUEbDZdQyrNYHswDNISnXP
         kKMXDoAHHiS9A14MNL70Xegvfew6NtcpMknlh6qamRnU7C3+8lSoBzaOA4U4rk0LAVB8
         icmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916071; x=1772520871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y75Icv5dwgtdzwQ3i04DyRU2j4QoigItK8pWr55UK70=;
        b=ITsR+cjFZNZYnh0APvgI+RB9AxHevwf6widRgey8qZHmeKnqpaeW/fl3CsSDxQU+hy
         sSDmU9q2pU6A7o6oBFuJhBmbJbIgr8uqy3PxNx3hOQk4M1TgoXmrEgX78fhom7d+H3DU
         gCKICIN+/S7J9wTLppEun1lH+s3051Jw8OwvHQDDmebdRKpEXeEMj7AI3es4dZ2CmAal
         9F1cEeGc2ACK9q3hP96B6sVb/XW/mnzql0CisM1j2fzNEoNAMjIwpomN3zY4zajZfvA+
         kS5vSqZqO+tBXv0VxfM5+0s0bvJ6cvcDoZAjNUCSAlshLavv+U429KiFRDwfN254ZRnU
         iF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGWp9W/+yH9R+dNc0Zb0SMGOA7PXNx01LENRs2d3BB8I8hyahqBECxOeoiuROAkQfE1W6d882g5co=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyR5cGrA1130eX+3vdXyQbi6rqSYBIRUtQWBClOHTE8UmmaF0K1
	8XPNpMvZRADfEkCMjBu/rPheYF/BF2pQnuaotTf+OOjrFuv/qEwBvXecXYbGLrKHNA==
X-Gm-Gg: AZuq6aJ6jDVSmraBPZs35PhHaJ1LgTlADqjvNi6VZ4GrqsibQ0oTm4UDey280sN8uhX
	zOoXUXSoELIU2pSUWxe3JqivmQgcYzZbedpJ6kUcjoxMyu09BWvFedLpVPA4hj2ae/kta9A8KvB
	k5yCWfhmwIw5pKefybAX/nFgc7j/VTZShzUq+I7oqXBsN2iVqqfnOqn0k/rsI24JXq91f2o/xNB
	7AyLBt7tKkIBt//AteXpk26Z/1HC//v8hccF3e6Cwesd6FiSeJVCPjekwyuuith+UCZhdEHVeaq
	q1wcq+8k3fOcEEIjbFeMKY0eNyW2SXnMGqRFxu3YD+LYQKounlmwrtrTcVzuigiPs5M5HlckL+x
	sw49hZ7h34LDColB4mPmxrm+NTxjcDt8RwqoWGrFlFFwVnRLrLdNMOLEHdXJSWcnLInP9ybi/Ek
	5GmGsT0ZoK3TUJRbW8CvESJ4411j0+9i9Pel7WNZGaluRCzmNtsl5khDrhP4VJTFMcWZ4UviG/J
	iWVQ3V+KUVXX692AKavpPMmew==
X-Received: by 2002:a05:600c:4454:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483a95f89c2mr201439505e9.9.1771916071452;
        Mon, 23 Feb 2026 22:54:31 -0800 (PST)
Message-ID: <11c2f97e-efa8-46ea-8605-4ce6cffb9683@suse.com>
Date: Tue, 24 Feb 2026 07:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
 <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
 <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
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
In-Reply-To: <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6177E18294D
X-Rspamd-Action: no action

On 23.02.2026 20:00, Andrew Cooper wrote:
> On 02/02/2026 4:26 pm, Jan Beulich wrote:
>> On 02.02.2026 16:47, Andrew Cooper wrote:
>>> On 07/01/2026 2:17 pm, Jan Beulich wrote:
>>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>>> index 0203138a819a..be6c76d2934b 100644
>>>> --- a/xen/arch/x86/arch.mk
>>>> +++ b/xen/arch/x86/arch.mk
>>>> @@ -4,6 +4,7 @@
>>>>  export XEN_IMG_OFFSET := 0x200000
>>>>  
>>>>  ARCH_LIBS-y += arch/x86/lib/lib.a
>>>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
>>> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?
>> No, this was deliberate. The functions here are different from those in
>> arch/x86/lib/lib.a. We don't need to fear collision with "common code"
>> ones. Hence I preferred to use the more "normal" placement into what's
>> passed to the linker.
> 
> I agree that we don't have the explicit ordering requirement that we
> have with arch/x86/lib/lib.a.
> 
> But, it still reads as bogus to be putting arch/x86/lib/cpu-policy/lib.a
> in the non-ARCH list.
> 
> What difference is there having this a little earlier in the linker
> arguments?  Nothing AFAICT.

Indeed. The sole reason why I'd prefer things as presented is that putting
stuff in ARCH_LIBS should imo be the special case (i.e. requiring a special
reason), while putting things in ALL_LIBS should be the default.

Jan

