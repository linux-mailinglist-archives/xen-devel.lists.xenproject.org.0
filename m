Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEy9IXoNnGly/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:19:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE194172FA8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238489.1540095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuR9c-0003kc-Cv; Mon, 23 Feb 2026 08:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238489.1540095; Mon, 23 Feb 2026 08:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuR9c-0003iP-AC; Mon, 23 Feb 2026 08:18:56 +0000
Received: by outflank-mailman (input) for mailman id 1238489;
 Mon, 23 Feb 2026 08:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuR9b-0003iJ-Or
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:18:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4769945c-1090-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:18:48 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso3421253f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 00:18:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c60bsm17236678f8f.27.2026.02.23.00.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 00:18:47 -0800 (PST)
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
X-Inumbo-ID: 4769945c-1090-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771834728; x=1772439528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NkuGBPWOD+jk9Nsbl85+s0iCjZ+xBx3Al+FPtpL/4pI=;
        b=ADD+6X/1oUsN/KHOBup2SIK05SsoNQ2bt/pJXH7Tr0TlhYAySuonf3Q7V+brwZ9lw+
         ujaWI9jyKTNQ0Mofv3IM1Fce/cb8SXknImGHvcbkHL30P3Am4Jtlz2tL85w7N/K+d0YO
         ThGLa7jMGDLBfixuQEpZjOLTQZwlK3X13CUg958V82yXMc1ahssr0RCH3g/4xyumsRJH
         YcT+7+MxaPiZoPMyNiXXk9pl4PxlrgginiRMg8EgJYq8XqG4Hd+/HfvTFjAqUk6sp20B
         2gpZgDKgUpp/HOq8mN24ddOYpo7vdPCoFD0OkZENDZE8t/YwPptwUWSEoWvW5xNgetGG
         nMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771834728; x=1772439528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkuGBPWOD+jk9Nsbl85+s0iCjZ+xBx3Al+FPtpL/4pI=;
        b=lNK2Hai5rAUk/3k2Sb+Vj7F5h+JO3S3z4p9xWZT6olRAe2AIfSryQAyq9m+G6kEJ2y
         QZiIsOwz8A6NPtrLwUHWpMR88pRp1GAKuEOlkFNS7ZZFfU8PqKUdJ293Em0dCEIWaqBb
         RQwQMWM3C2U1Iwt+IKCYF+w6JyR9CmLTuNy0dmfdUWOP/ICoi6JakWfVTzlGIS2G8CBw
         s8ukuSFReLqli7lhN+8ctrz22PrwaQU6YgFjnpjCPa8+MO7cSan+Fw64hMSYvW6rJN09
         ec2MzttPf0T8WSpqYCzUHuSakG0pg62Fq0BpiPr3Zz32Relm+qcdGxa2LrlJcx3irJmX
         Kgjw==
X-Forwarded-Encrypted: i=1; AJvYcCWF9XX8rLoLPADi/E3nZhiWck0R7dwLnxQ9Lh5gaQ2EbeE7vJCMIKzIv6srHpBH+VzIeCvO/RUvgiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOWRjZhaoLAVNPgFaWPJyF6+oXvQFVFtnWORzk0jYBmQrot40J
	TGTUlthLfGrdT3lKfCXR2LMJ3Xec3/WpiOEoIBOd8f9+/vVWWoyv6QgQCrUcNuEBkQ==
X-Gm-Gg: ATEYQzwJUh8pQjtg87Daei4aIJx3Ww42it4Z8IT7WyV+Uv0WN7Fxh9iCxicWqvS6VBg
	m0NZJZ50TxhnamKmBOnNBz9cN+1kbeYs7soa0/IQjghSG6E1FjXTOP+jqqw/82MOKI/6pwAHIzD
	kZwHEZHXo785PepuWa8PG1ptmBpTBmVIvj1Jl3UvvyyG6+QuF337pfvpwnDkWg6bNc6F2XKtdF1
	EZPfS3ixiFdQwJEiwi1JR33e+Nu2W91WO+yEDkbWXLxPp9870qWkbd47qce1mlcBZfqCxy9My+7
	a6jTxrYIRZQcPzmg4q+AjE1U/FPGGq10iyVa1jYyjlvlBCd0CVncsAQ/9/Li33l+aqvyGthsCVE
	lY2VKwQ6fwQpZkYcjcGCbYaCxBIbUMUOa/8iFNS/0D28NMKUnfNTfxXG49ucWgyvnwy5r9g6S8x
	LzQss/Myzvpc9PcISj2g0whSAyJ3wqErVz9py2+eYiCVUAEv1YhiFKQsJYV1vfn+DR5AvPLxkdT
	t7RkDIUA82Zm8s=
X-Received: by 2002:a05:6000:1845:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-4396f17f847mr13729334f8f.48.1771834728004;
        Mon, 23 Feb 2026 00:18:48 -0800 (PST)
Message-ID: <24f8bf44-0c86-42a1-8bb0-61ddbe430cf8@suse.com>
Date: Mon, 23 Feb 2026 09:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] x86/shadow: drop is_hvm_...() where easily
 possible
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <ebf7a96c-8529-b238-f9bf-750cf42312f9@suse.com>
 <82877022-7d25-431c-838a-2ff5b2c0a008@citrix.com>
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
In-Reply-To: <82877022-7d25-431c-838a-2ff5b2c0a008@citrix.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EE194172FA8
X-Rspamd-Action: no action

On 20.02.2026 16:14, Andrew Cooper wrote:
> On 16/05/2023 8:41 am, Jan Beulich wrote:
>> Emulation related functions are involved in HVM handling only
> 
> I think this wants clarifying a little.  *These* emulation functions are
> only used by HVM.
> 
> pv/ro-page-fault.c does have emulation for PV guests, but uses
> paging_{write,cmpxchg}_guest_entry() to enter into the shadow code.

I don't mind; I would have thought that x86/shadow: already narrows scope
enough.

>> , and in
>> some cases they even invoke such checks after having already done things
>> which are valid for HVM domains only. OOS active also implies HVM. In
>> sh_remove_all_mappings() one of the two checks is redundant with an
>> earlier paging_mode_external() one (the other, however, needs to stay).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Preferably with the commit message tweaked, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

Jan

