Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLAsJixPhGkE2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:05:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719AEFB63
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221562.1529758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuM5-0005uU-51; Thu, 05 Feb 2026 08:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221562.1529758; Thu, 05 Feb 2026 08:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuM5-0005sZ-2T; Thu, 05 Feb 2026 08:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1221562;
 Thu, 05 Feb 2026 08:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnuM3-0005sO-4y
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:04:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54fb87c3-0269-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:04:44 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43626796202so41522f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:04:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a3a9sm11746332f8f.18.2026.02.05.00.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:04:43 -0800 (PST)
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
X-Inumbo-ID: 54fb87c3-0269-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770278684; x=1770883484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWf/SWAsQrEcqXBCdyJQO3DGlSCpL1Xj54p2jYcZXb0=;
        b=MUwvGUJW9bX2IKyklJZXJIKs+vYG7AI1sH6QZeBqwffXcyXr1iShkvYsBSK6iWmAT+
         hYxhH7txG+8jhdiTAbeIhUWjx0bxIPOjf2Gx767RI8dpswy0rVdmqhj3yYkC6OJ8+2Ez
         TsqNfZB9Xt1bSsk7iRkcOnbQiK5Vk0yu/46V/YwZ4mDKbtH+gpRgBL7KUL+m1gO5r1um
         9VzsN4fv544LEl/P1+gt05HggSPohoynW56mBbeAcmPaqbLU0J0WtePuD0VshtauApU/
         byfRrlhmCYeiHJUp1sgiK0vgYZW8QbJRR7aZOwhb9rxxvdYwWpg571pUC5kpRyIzKnbP
         JwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770278684; x=1770883484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWf/SWAsQrEcqXBCdyJQO3DGlSCpL1Xj54p2jYcZXb0=;
        b=jJMfixc23ZJX+A1PqzO5Tm9lpMK9vbuOV+nNdVYnLvWBFZhoK4SRU/RlJLDuUHL/dZ
         IlmIsuSe+/K+s99mB0D83kKTQg7aIc1XzFCtdJDcn0C7mstxKx7tQEwFl1IX9rxlK3Cl
         d/3zU/mLJBFqNhnqiQqWIxGCeLpFL4f0nlG5lAS9Q65bOSNHcFxHTT4kkBjNkgAUpYwG
         wSUchtMAtsf4YDa9aVDUN1L52blgTOIF6+08MTV6YkMeFkMSf56vBesqAOx8JVyPoL7Y
         sxctdp02kRiETfpk/ugfktC+WfEkY3sKCvYcrEyo3JBCnKcRWY608/6JzCsiH7rawZjc
         hP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUYxmvKSqpSB5YYvUTcVZfgp+Wyo8pjzyk3KE3XsQ/ZpiOPosqGDKbwxpVsf0bLQ8vGK/SGDpVz1AY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8CgJ4dy/OuxbJSRVErWgcJiBPWiAMTms/9+ciXxLuSWAbwJj8
	IDR0ahOcI8bm8iCNRLZokBUOMPO6x4yVhE/b43RSxy4X0ogh2kTpO5LQ+kJsDtKGOA==
X-Gm-Gg: AZuq6aIMrrGDKsBEg9QpCvGntD1H9cBzlP3U1f7M7yXbjiYmuAJrHrSHNf3PAGoWM1l
	k2CjfO+fi7YeBEV1KFrwOqqt6VT4DimdAsxCgtXviKkurtiO58Ha47+QFHOnedmdt9HlndXk3oi
	7/6tIGomXVVrwLIHu2AFbAxddhCZJEbLFVVl2WPywKRJi8124BTo5Au0ggk2sxC6rFOSwIvryr/
	i7jjGiKeBh756FzJvyhbqPjZucaVMLNs6ZLm/ZYY+W3Ipk9j4HGudvJt4J8mY/F7gc4w3Z2UhYp
	986DFoy2tv//6RaXiWT82fGwvyBHzRlXC657PdR3+g7gH5M/CEAPR08P/zUaDABYreMcjRiCEwj
	zi0c7FqV8PuKvT5pPNiumVL6OD4xYxV8cNxFM7TpDRNyfAqJKg6U2yD0XhV4VFTx9bi8FhFiy0f
	U0CU/rp/7Wi3L9S9oKX9gP/ofxhD//wr2rWJfMWBTfuCsV0tVnkAwu9tR9Ss3JynXmRT4rcphkR
	1q4uQOSw7kbIw==
X-Received: by 2002:a5d:5f51:0:b0:435:db6e:e3b2 with SMTP id ffacd0b85a97d-4361802ffe9mr8357061f8f.27.1770278683936;
        Thu, 05 Feb 2026 00:04:43 -0800 (PST)
Message-ID: <d7cf4b5c-ffb4-4168-b0e5-3a035e4929de@suse.com>
Date: Thu, 5 Feb 2026 09:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
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
In-Reply-To: <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0719AEFB63
X-Rspamd-Action: no action

On 04.02.2026 16:45, Bertrand Marquis wrote:
>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -116,7 +116,7 @@ endif
>>> # If the user is running make -s (silent mode), suppress echoing of
>>> # commands
>>>
>>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>>> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>>
>> While probably this would do, assuming make isn't going to make drastic
>> changes to how $(MAKEFLAGS) is set up, how about
>>
>> -ifneq ($(findstring s,$(filter-out -%,$(MAKEFLAGS))),)
>>
>> instead?
> 
> Yes this is a solution that should work to, making the assumption that short
> arguments are kept at the beginning like they are now is possibly to strong.

As you indicated on Matrix, this wouldn't cover variable definitions, e.g. O=.
Sticking to just $(firstword ...) also doesn't work, though: If there are no
options needing handing on and having a short form representation, the "first
word" may be empty, with $(MAKEFLAGS) then starting with a blank. Perhaps

ifneq ($(findstring s,$(firstword .$(MAKEFLAGS))),)

would be a way to overcome this.

However, wording in the documentation [1], [2] is ambiguous as to whether we
may rely on there being that leading blank (it seems likely that [1] is more
reliable than [2], but still). However, [2] effectively suggests another
alternative:

ifneq ($(findstring s,$(filter-out --%,$(MFLAGS))),)

While you meanwhile clarified (again on Matrix) that use of -I isn't the
culprit, even with O= I still cannot observe the behavior you're describing.
I.e. I still need to pass -s in order to silence the build, even if I use
O=.../staging (i.e. an 's' clearly being present in the path).

Jan

[1] "If there are no single-letter options on the command line, then the value
     of MAKEFLAGS starts with a space."

[2] "A similar variable MFLAGS exists also, for historical compatibility. It
     has the same value as MAKEFLAGS except that it does not contain the
     command line variable definitions, and it always begins with a hyphen
     unless it is empty (MAKEFLAGS begins with a hyphen only when it begins
     with an option that has no single-letter version, such as
     ‘--warn-undefined-variables’)."


