Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOIfGaJtnWkkQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:21:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EA1847A0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239589.1540996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuobh-000809-DH; Tue, 24 Feb 2026 09:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239589.1540996; Tue, 24 Feb 2026 09:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuobh-0007ye-AT; Tue, 24 Feb 2026 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1239589;
 Tue, 24 Feb 2026 09:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuobf-0007xv-VB
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:21:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31a21657-1162-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:21:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837907f535so46820115e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:21:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b8195f50sm22777295e9.0.2026.02.24.01.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:21:25 -0800 (PST)
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
X-Inumbo-ID: 31a21657-1162-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771924886; x=1772529686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38Okx8vRRandsJJtqeebMqZpts+3JOrgQSEOj+ehCaw=;
        b=DD8362hKm9+JW9ZHbGANUWCmjf8Ui/M84+KCvJ2yL7X65ePd91Z8f6tFdamskADrF/
         7x9H//Wb0zENb+Q5mvztiap0Ao3U8aBIer+d5cUQb66E19poG1NnminwOFnSLE2/K8XD
         AklvpRcy+bLxQZd5sgMQpP+5hlbqqHc5MFjzYckqz6UhfoJ5WVGr8bRtCgJN1OEULLk6
         AyukzkV/g/+JwSZZegAamoXweqWWAdYZkgwXBIvcuQz9ELpY7E9dLURy0ASYABusQvpA
         PD/hApE9hIKM5NkOq7K0dPacDwJozbT/YYliRbO/OO1HREUbcMZMTnoNwiK2+RifMmLl
         r1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771924886; x=1772529686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38Okx8vRRandsJJtqeebMqZpts+3JOrgQSEOj+ehCaw=;
        b=DwRSDzX3xbHi8EFLy3PAsL1TvxIkGzi3XT8W/WrRQwlz3Su3hwOu9JNiOuejgVihUD
         h6RGixJggbrfB63GeaeaNo9k7WRGcRb+aBmdHR6zYGKlboV4lMhwHxRiq8P48IMxRCKf
         dOU2h0nd3Z8CG1+RYVnjt2aB6CtVx/qKxRDZ476ey3tKxgpRKWl9RL2CgUISOq2sbMW4
         iiDEHJ62h8d/zHothCCELYO9KbxbyF9fq1CR/P/O3KcB7q9VS6nu60UKZzQGsF8X/GxA
         2EB+l9ttyy261s1v45Gok9TaVCaQN7EC5IE6dVWB5m8iOcOWL1D9AIAQdqsxsU2+VZ7T
         MClg==
X-Forwarded-Encrypted: i=1; AJvYcCUhzYClHAIB4hMkwRs0/A/tIK9BU9KWCfAJ59w3bGaUFN3LZlIVd4HRf93y4ggWGfSMPOUrs+p0ir4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfoSUMlz8bM85RKNcIsSMsDbLX3i4Guhl1Wb3AuGmOWVsbesy9
	gS0bwUFGG7HTVUD1E8bNr6M0lD80mWteAZhHx+RKaRe05t0XT1saU3GcC9lYKEYvow==
X-Gm-Gg: AZuq6aKlvmHvvtimCPVZN197ItLKfYA+bcCxgmoANpn++34n6kDImKgRIjKLR28zHov
	0DsZBQ6D6Zz0OpnvpNpgUcbVG6Ck2VsH6aDt5d2eRS5dSKh2x9Ce82MtvW56K8tcnL9ARBkaghj
	41FiMENrftRFDQbZscnavIVH1yk5eSzWULtDGSC2QDi5NwewvOkVtNA7AQYegu634c0qmgLKTy3
	hf/8/WMFcjKopdxrL8oiouLSUAdVjO1/B5Bhbmg7/fzt/9EDqCFhHE9wjxaYPztag35Vh4ZUhDT
	KScUcl+3UME0Y0KR2sSEV3tC+JyhsZ9N4IDEY5h6VmQJCc1WYN5H+h9GDwPkacdxf61g4kMdDKY
	+HMxxfnZRdxVJXNwdq0WcMjNMCF/qkZy1NUuQLzDreTHFALpKuq4TgImBXaymKvJMeWQ5KwdEfI
	3moc3aZX40nXRfzqe5h9iubmaGVYDYp7uAWYXKZ/FwtWMoc8lTFPAjZeRveKgtJZh5gsWV2JI8D
	CWjCwtIpHtnHcVDfLN37URGnA==
X-Received: by 2002:a05:600c:628d:b0:483:5a29:9678 with SMTP id 5b1f17b1804b1-483a95bd8a7mr203823555e9.2.1771924885711;
        Tue, 24 Feb 2026 01:21:25 -0800 (PST)
Message-ID: <a24723d2-0c7b-4e04-b47d-fd0e188d72dd@suse.com>
Date: Tue, 24 Feb 2026 10:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi-processor: fix _CST detection using undersized
 evaluation buffer
To: "David Thomson (dt@linux.com)" <dt@linux-mail.net>
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
References: <20260223195602.17122-1-dt@linux-mail.net>
 <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
 <FvW05oEjY785ua6lBtiEat0hzzY8RM9BeRC-RTwpIQ8QYO7lMvYmJ78U8C0S0vT_TRg4YX4-TzoGEsDvqwUVeX9w89FR47MYWR1oxpFJCBo=@linux-mail.net>
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
In-Reply-To: <FvW05oEjY785ua6lBtiEat0hzzY8RM9BeRC-RTwpIQ8QYO7lMvYmJ78U8C0S0vT_TRg4YX4-TzoGEsDvqwUVeX9w89FR47MYWR1oxpFJCBo=@linux-mail.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dt@linux-mail.net,m:boris.ostrovsky@oracle.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF9EA1847A0
X-Rspamd-Action: no action

On 24.02.2026 10:10, David Thomson (dt@linux.com) wrote:
>> I understand you reflect original behavior in this regard, but why involve any
>> ACPI function here at all when pblk is non-zero? I.e. why not swap the operands
>> of && ? Object evaluation could have wanted side effects (in which case,
>> however, some different change would be needed here), but checking for method
>> presence surely hasn't.
>>
> You're right on both counts. The original evaluate_object() call at least had the appearance of wanting the result (even though buf was undersized and the result was never used). A pure presence check has no such pretense. Swapping the operands is the obvious improvement. I think dropping the _CST check entirely is also defensible since C-state support is confirmed when pblk is set. But I'm not certain there's no edge case where pblk is non-zero and _CST is also not present, so I'd defer to your judgement.
> 
> Would you prefer:
> a) if (pblk && acpi_has_method(handle, "_CST"))
> b) just if (pblk)

I don't think b) is correct, so a) please (albeit suitably adjusted to really only
flip the operands from what your original patch had).

Jan

