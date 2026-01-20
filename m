Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHqxJDC0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060F4824E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208945.1521078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBoJ-0000Jd-TP; Tue, 20 Jan 2026 13:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208945.1521078; Tue, 20 Jan 2026 13:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBoJ-0000Gf-QU; Tue, 20 Jan 2026 13:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1208945;
 Tue, 20 Jan 2026 13:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viBoH-00009h-Tl
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:30:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28059d8c-f604-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:30:16 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so30746255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 05:30:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2755absm379579935e9.15.2026.01.20.05.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 05:30:15 -0800 (PST)
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
X-Inumbo-ID: 28059d8c-f604-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768915815; x=1769520615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0w9bDEgrBJjkQxZF/X5ijftacxNzcsqnhAvj6yqc/1E=;
        b=T3aOxtU/zl4EqicKNw8uVKiB6kvG1SZ57uBL0TMBzwzG70e4TSOq112WEUh39ZHdPH
         qeHjzGIfkUNBv5HzufP7VVaQLSsD8LHwUrHznBLNbXmFsNrUmgr8nNmXJQ363qxg3Rye
         Ip2PSXF4Jb0bey8l04bbxY83nI9fVJhKKSxPnHxL/+/P7VeyAZ1fO/l+Rv6u3ABt0IWt
         vGN34wvJ5RlnWWo2fzZc7S3brCiPZYXOVivuO6bY9Ng+1CAitKWf47/x+Ua2cneBm+FQ
         ztYzAaCvXc0dKLe5rzTJ1UZ3KSg4uYzoLKbPGTi21EGjeg4l5mo/EJjo4wccTH5RDIgj
         LrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915815; x=1769520615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0w9bDEgrBJjkQxZF/X5ijftacxNzcsqnhAvj6yqc/1E=;
        b=Wc6RuOdrP1Zn1k9BrxALq0sTtgYlcnaAdZOOnVy+KoAQzC6khxMRnON+vWpVPZfyWQ
         K0VmrknGLzBwfF7prYwEXKRr+cyjNVMBzP0AaxdnD26JOuC56+n+iBI2dJmiJMu80fyS
         hU+aMbh7T7Eb6FwHH28ZW4nXyk1NYf3QIkZH8B6LS1nbcHelH5VpiTv0V2AfO4Tgtqn6
         QPymP/v+tsUjhLmi0ZkLEnsMUfO0zU+arMIosROujhA/rqm8clGUa7Boy8ddKwxfzVhC
         SgeK4+663NkGWybyWLSDGNPYEZr2VArqjU8k2PODSHmW08Q0PngOUToy9h776Ya/Jqit
         R1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVOSQzfN5zS1PmgVG/ITEUGothUkPuNhUokomM+p89DJ3gSyjtK+DwOTS7pbltDM1KQ/4MyxeeR+yY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo+l1LURGT4+sd0XY2YxjDnZXivPLQ3HXPK6ZFav2agJe9Nmi7
	sEGhWFbfnG5gCZ0yzyNRJysidJvveFRqvb7DbDzWbP5Dcu6hymEDNt1/LwSeVmhM+g==
X-Gm-Gg: AY/fxX6tTR5BTWxeH41CRJRGFkSKXBuOBGrlkqAPBZFLEMKawp01LfplMDbwHFwfhLY
	M05EUIzYWIY6h0Dnu0Zydei6hOLYeH0Da7itdUg7O7gm6c9ZZRN1dVB1JNGr7VwR9NytYrr8eR0
	UYxKY7rZDcPiWdopDFqLO2YSNRhsJrD6R/rTBokfI89OjOdYNQD7gCtP33BkfqFrIgfWZwOy4Ec
	44ipSBj+kOtD02qPTdzgLqEqsHmTgd/8S8Wu3rxS0BM6BEPND5OLWrkUQ0MnwgCJrFyLYCv+o8G
	UomuVnoVfaED+mkXEb0aZPUBmEjWNGjtrbqWtTacC7H/pBTP2XVkd96AU7mxyiMu4ChHFii+spb
	CMHSCwA+1nOleyty3T//Ypy+PsVl8RHb8rwWNdHnTkQ8NBjwHU2K5PgDmr+xj9M/+MgAyWM/Qcj
	ODwkcLqAIlzGFkytAUUXP+qkAcnd5YEtrc+hWylNqy+qhISni7q1RckHGA69dBme0CDlPT939qA
	aM=
X-Received: by 2002:a05:600c:4e43:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-4803e7f1887mr24181565e9.30.1768915815568;
        Tue, 20 Jan 2026 05:30:15 -0800 (PST)
Message-ID: <dd7404b4-7f31-4189-937a-0278eb54bb2a@suse.com>
Date: Tue, 20 Jan 2026 14:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
To: Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
 <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
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
In-Reply-To: <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7060F4824E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 14:19, Teddy Astie wrote:
> Le 20/01/2026 à 10:56, Alejandro Vallejo a écrit :
>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>>       GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
>>   };
>>   
>> +/* general 2 intercepts */
> 
> nit, you want to says general 3 intercepts

And then, further nit, also get comment style right.

Jan

