Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHvoJcx9nWk1QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:30:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067301855DB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239763.1541177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupgJ-0000Y8-KP; Tue, 24 Feb 2026 10:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239763.1541177; Tue, 24 Feb 2026 10:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupgJ-0000VZ-H4; Tue, 24 Feb 2026 10:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1239763;
 Tue, 24 Feb 2026 10:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vupgI-0000VT-GH
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:30:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf3cc440-116b-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 11:30:16 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48374014a77so55442125e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 02:30:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c0779sm528577945e9.6.2026.02.24.02.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:30:15 -0800 (PST)
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
X-Inumbo-ID: cf3cc440-116b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771929016; x=1772533816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eCER6MBJ8RKAYB6z4oMX8U8404Cs3b6ijHepJLHXkwU=;
        b=eDOSpH7ZBOnuUr/Rm7ddc5xZm6fMqtp4y8B5zxB5eQwkq2OElrGfQAsjJXTjlmuHxr
         x3MH1tXfP+mrVgaeP3hW/bzcQhnDkjiI43vcaqqNXwutomc3r+kVZNdaOhzgromJXQhJ
         XFd578Hj1giCLGW3WwsOY+8zCGs7ohXakCEkj0gX4YLLYHmwoPhiIDrA0astT48PAY/s
         uQ0LiTqcW96jyZ6V0SfX2kqFtgOFP418YZ28yCWkhUjGfQPaL0I2RxzVciaLtTy6Cu66
         tM3G2p5QWHkBGPnjjaUfCyQhaGvE3f5STizNE8/oQ6KuKVNqyfFiyV5oHn1RT0AflIsa
         5w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929016; x=1772533816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCER6MBJ8RKAYB6z4oMX8U8404Cs3b6ijHepJLHXkwU=;
        b=DUENkCoDfKtoipWGG9KVOB0f9Z0PK38yu8UHA9adLoFMQT9g4yhhT7PTiX4ku15Jo6
         VExUTtSJpotPyfhHpn27z3jIJj677SCj1ShG8wO4WNO23sQcdfnYvb/FclaWOoHZ63e5
         wzviwRsy7wMhASwIRQLJaBh6hhLT00tJLVOsukPicQbLmgCtFvBd4Oy7l3REfioOjMlR
         nWDakfJl+StscyFqhqeX56a5j34C9x/hwXfsjL0HEoU6pyVO9PV1mzD/U65Cnm+CRQrR
         yZjvwmuA+86KzeoRUuoSJ1+KP0SB1jLH4B2qDYplvslP0mZuJQIFeHhxJ+NupHn9WcGB
         ljMg==
X-Forwarded-Encrypted: i=1; AJvYcCU4a58k1lfoG5L5XmWqk7VsXPuq4RdiFKVu0jT6kiZHKRqAtvWb2y14iPrB7G+6NHqxV//ax6LT9jg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykYigiytyceQTdobeCOt+RA6grTwce4J23XtCo8JDhkzLlTIm+
	bCCGfE0xi1Er60yyjHXxn9+Ku/Bdrj+/DBVuxsmNBjxAnCAj6tz31UYNv6tjhbStEg==
X-Gm-Gg: AZuq6aJ/yGwDDaDOfKi8z/0e7lO7Incdhru3J/s/rDBHnwCORKzyyXQGXSbGRNIjSR3
	ha9MWqSm2yr67XTCI76IblDKZxU9nF4zTLcAMuncUOnIUztWUtRCau/6uC5zKi9gXuyVGdGGkWA
	s5GMOjVDv4G3ObDkIgce6F/TQYiZDZcypgNURE7esJ/xGFaVpTTwPzB6qr5QMjKgNGlajBnd3CU
	OHtMj3E2fpld4ZO/pwPhfdrtIU13mgn3NfPCgepQtfnG476KU1JlJFyqyfhh5sPhqjGf9zFCd0n
	AliMUeZPVEaL0KuSkEpC5auNNluSo5KDi5XqiH+KfIcSDhvU8pz7xfCMd6R4CDGEIMTSWTYHubJ
	QfC/ZIM+KSMRX7kd7TU0DKxAbLhuKz6qmIfIkZRfnj+hso2NiWB0el71PDyd+RUxjn4q24Rn8zv
	9lEXahU5r1GyVTtp112bAn+r3feLy5OlPvZvSzGWaPAM9OMOUL5A+gbbBi9aD1SIzpzHwQXRq2d
	8NBfmQnQ/NUB48=
X-Received: by 2002:a05:600c:1e28:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-483a95fe96bmr169097335e9.32.1771929015624;
        Tue, 24 Feb 2026 02:30:15 -0800 (PST)
Message-ID: <c0ba57bb-0d86-4209-b019-daf8328b5205@suse.com>
Date: Tue, 24 Feb 2026 11:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules
 into Rules.mk
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
 <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
 <6616BFC6-2ABC-4DEF-A799-BC660BBE31BC@citrix.com>
 <e866d080-2c6f-412f-8ac4-f97eb7e874c5@suse.com>
 <7B23282E-4CA9-4B8D-A521-C8483F7E2541@citrix.com>
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
In-Reply-To: <7B23282E-4CA9-4B8D-A521-C8483F7E2541@citrix.com>
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
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 067301855DB
X-Rspamd-Action: no action

On 24.02.2026 11:01, Edwin Torok wrote:
> 
> 
>> On 24 Feb 2026, at 09:42, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> First, since this looks to be recurring: Please don't send HTML mails.
> 
> Thanks, didn’t notice my mail client was doing that, changed the settings now.
> 
>>
>> On 24.02.2026 10:38, Edwin Torok wrote:
>>> On 23 Feb 2026, at 16:37, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 23.02.2026 11:14, Edwin Török wrote:
>>> Introduce a new tools/tests/Rules.mk that must be included *last* in a
>>> Makefile, after TARGETS is defined.
>>>
>>> Requiring inclusion after TARGETS is defined is certainly okay. Requiring it to
>>> be included absolutely last is imo going too far. There surely are going to be
>>> cases where something wants overriding or adding to.
>>>
>>>
>>> I’ll change this so that the Makefile defines XEN_ROOT, CFLAGS, LDFLAGS, TARGETS, and then includes the file.
>>>
>>>
>>> --- /dev/null
>>> +++ b/tools/tests/Rules.mk
>>> @@ -0,0 +1,48 @@
>>> +# Usage: include this last in your Makefile.
>>> +#
>>> +# For example:
>>> +#
>>> +# XEN_ROOT = $(CURDIR)/../../..
>>> +# include $(XEN_ROOT)/tools/Rules.mk
>>> +#
>>> +# TARGETS := ...
>>> +# ...
>>> +# include $(XEN_ROOT)/tools/tests/Rules.mk
>>> +
>>> +ifndef XEN_ROOT
>>> +$(error XEN_ROOT is not defined)
>>> +endif
>>> +
>>> +.PHONY: all
>>> +all: $(TARGETS)
>>> +.DEFAULT_GOAL: all
>>>
>>> Make 3.80, which ./README still says we support, doesn't look to know this.
>>>
>>> Do you know which (Linux) distribution and version would have Make 3.80 so I can test my changes there?
>>
>> Not without a lot of digging. Perhaps we simply want to bump the minimum version,
>> to "sync up" with what we did for binutils, gcc, and clang?
> 
> Minimum binutils is 2.25, which excludes CentOS6. CentOS7 has 2.27 and make 3.82.
> The only other OS that I see that’d have make 3.81 and binutils >= 2.25 would be Ubuntu 14.04, which is EoL.
> 
> So we could update to Make 3.82?
> 
> If we exclude CentOS7 (which is EoL), then the next minimum make that I see would be 4.2.1. Would that be too big of a jump?

I would take gcc and binutils (both dating back to 2015) as reference, which would
make it either 4.0 or 4.1 which we may want to pick. (Which doesn't exclude 3.82
as an option, of course.)

Jan

