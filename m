Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF54B96387
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 16:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128427.1468785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13xI-000328-Q5; Tue, 23 Sep 2025 14:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128427.1468785; Tue, 23 Sep 2025 14:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13xI-0002zX-NO; Tue, 23 Sep 2025 14:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1128427;
 Tue, 23 Sep 2025 14:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v13xH-0002zR-Rf
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 14:25:19 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d44ec0-9889-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 16:25:17 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso2167182f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 07:25:17 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306085c115sm16197926a91.27.2025.09.23.07.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 07:25:16 -0700 (PDT)
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
X-Inumbo-ID: 20d44ec0-9889-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758637517; x=1759242317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wqXA97QWrt85ZwfIGodKN2bsMkqO7Vow3883nPXPGA=;
        b=R+KEXnJZxRW+TvPWNNXI+5QHYQTPvNwZgOY83gpMURiwnJiQKP3CGK0N/0fuhbIVN6
         VkwDkrz9WoorfGgVlkjbNkH8uvTN3WWe6jfDc/rDO8b4CZOCc4ctr+Hu0W2flEGSeITL
         76gJe0m4NiGtNSq9qZgIeLYWp1wkmYyFqm+nVK5mCdazgGp+o0K/Me4oDV0jUWvQwirj
         RANCxziWnbRLmr5mKrcTxMrbG1xgd+Y8UQp2CQPiGBUAfa9kZpT24Yxp3oJjfQRsyv+2
         6kK4ESkgkj4msCdCBXs5nFlP/3cE41+RIN8tsHcK36E8PDoEG29Vhh8M091e6p+hHN5M
         uGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637517; x=1759242317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wqXA97QWrt85ZwfIGodKN2bsMkqO7Vow3883nPXPGA=;
        b=fYHo2vcA0o9JVyWGZUp5wPMSqrzf2FFb023xglCWIQFi0NuA1r5Uz3s5VUZoOXGJd1
         l7E+9wolbtSRCOgFb6pgJOz/pdA67vhH18ustVkfOu8G5I9/S+RDp/OanZ/va4485jSi
         JK1VZ6wyNbE7MfZ/Kv1f38RmI6hOK5Xxud/89qvdNUnQQDgro7qWE7TJ5jAuhoIMOmeU
         2dXjp/DWLfp8k1AEL/15C+vG7IrO26VvWZjTnNtBzOuyleZvcF4utevMx1s+ZEjxCtCY
         6WTjWogAfvf2D2yxzfhGB6jWQYKoBA0WVLR3NRWHQZoUx6e7qQa2h/k+jZCnvRS2/350
         4h2g==
X-Forwarded-Encrypted: i=1; AJvYcCXlebh5X2HTPv/ibkqKyrBfdnOO8t+dEysomTANoC2rNPPiqnBT3oj77kMaU4OpKwkWhfrfiFOG/Gw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQwJRCOjSLp6+XdZU9vzRPFDquTjdzC8AN8CTZKTqZBg1kS1j9
	x1tvt0hOs9E78PHmSDGHtSjX8gpGaWD8SHj1Aqe0vfHV5hzx0fu1qpsbmV3w7BRWkA==
X-Gm-Gg: ASbGncv6BYqEKBfu5+Laf5ISf45SbB8+ujUussvzcICa0WUTZGuFiYZZw0oceCjwyPU
	91DeNwPXcJL1X2Uv/le9MW6aRpJy/vrZknVNct2Sq7q10TGeA7jiZJoHfW/GJ6TEFqQ+SWqIKXk
	RXUoNGN48Hevng89Oy0meleGfvjvjj1UPLN3eE1pLMyOBHBmgVlXYda4WDdsxslX7uLZhr67VWy
	HcGMv3j4gnWQOhdzAGGNjZHKoiaMRycrM7mQhjsALPX3eLio3+LrvwpXeoymGuecWMA0JKPOpZ+
	m4lxE6yiJZzWWq/NUWRJMahlYA7+cCehhfos1CcJ9+T58qm/5jWDsjdUNRsoaZC4XnawlrqLpl7
	pmylvVUBZJWiq5jaC3WRXcoemTczMF5ZW
X-Google-Smtp-Source: AGHT+IEA/HDBnhTjV90lTzA4OcI7ytEovfHngSizJTXJDCLz5cUHZ058RD2a9cFGZwKnC72QLm9ygA==
X-Received: by 2002:a5d:5f49:0:b0:400:ac58:b35f with SMTP id ffacd0b85a97d-405c523c254mr2261409f8f.21.1758637517209;
        Tue, 23 Sep 2025 07:25:17 -0700 (PDT)
Message-ID: <0e2b9162-1a4e-4a95-afcb-0d9e1e54e3a0@suse.com>
Date: Tue, 23 Sep 2025 16:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <7d10f4d063a55920acbb8d477b885552379a6116.1758197507.git.mykyta_poturai@epam.com>
 <337596e3-e522-4770-a64b-6c8137134739@suse.com>
 <e6c66b05-d6b7-4e26-8755-5aaaa872953f@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6c66b05-d6b7-4e26-8755-5aaaa872953f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 15:19, Mykyta Poturai wrote:
> On 18.09.25 17:59, Jan Beulich wrote:
>> On 18.09.2025 14:16, Mykyta Poturai wrote:
>>> --- a/config/arm64.mk
>>> +++ b/config/arm64.mk
>>> @@ -1,5 +1,6 @@
>>>   CONFIG_ARM := y
>>>   CONFIG_ARM_64 := y
>>> +CONFIG_HOTPLUG := y
>>>   
>>>   CONFIG_XEN_INSTALL_SUFFIX :=
>>>   
>>> --- a/config/x86_32.mk
>>> +++ b/config/x86_32.mk
>>> @@ -3,6 +3,7 @@ CONFIG_X86_32 := y
>>>   
>>>   CONFIG_MIGRATE := y
>>>   CONFIG_XCUTILS := y
>>> +CONFIG_HOTPLUG := y
>>>   
>>>   CFLAGS += -m32 -march=i686
>>>   
>>> --- a/config/x86_64.mk
>>> +++ b/config/x86_64.mk
>>> @@ -3,6 +3,7 @@ CONFIG_X86_64 := y
>>>   
>>>   CONFIG_MIGRATE := y
>>>   CONFIG_XCUTILS := y
>>> +CONFIG_HOTPLUG := y
>>>   
>>>   CONFIG_XEN_INSTALL_SUFFIX := .gz
>>
>> I realize you only do what is already being done, but I question this
>> way of doing things when the scope is tools-only. Any CONFIG_* put here
>> cannot have an identically named, but potentially set differently
>> Kconfig setting in xen/: Any use of such in a Makefile could end up being
>> wrong, and would pretty surely end up being confusing.
> 
> I have checked the whole codebase and didn't find any other 
> CONFIG_HOTPLUG, the only similar thing is CONFIG_HOTPLUG_CPU. Anyway, I 
> can change it to something more specific like CONFIG_HPTOOL for example.

Iff no other way (configure?) can be found, then yes, please use this more
specific name. But not extending this legacy way of "configuring" things
would be much preferred.

Jan

