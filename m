Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C98A9440
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708038.1106637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMN3-0001hY-RQ; Thu, 18 Apr 2024 07:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708038.1106637; Thu, 18 Apr 2024 07:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMN3-0001f4-OP; Thu, 18 Apr 2024 07:39:49 +0000
Received: by outflank-mailman (input) for mailman id 708038;
 Thu, 18 Apr 2024 07:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMN2-0001ew-Sd
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:39:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f3b3c5-fd56-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:39:47 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4155819f710so4769075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:39:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm5473756wmq.34.2024.04.18.00.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:39:47 -0700 (PDT)
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
X-Inumbo-ID: d4f3b3c5-fd56-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713425987; x=1714030787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9y1EKandT9WhygCglGxdWa3TL08KKuc2zQZTBYEseU=;
        b=SE0MZW/rj+EN+yvIdYtKNlOsTDt3/MpyheANsA0VQpd7Rn7LiRyFtHa2rZulQY+3cZ
         lJIUBUvw6IlKQauRtNQ53KsI9ciDXFk4m8qgBsUZzLKvCgfNkbnceTie08xVgSbAXz++
         CRjf8Zz32syQ31aicu3qkK7ASCpsxXKh06HR26kY1HOIOsKOxQ6d6REk2Ok8Hv+JKQPK
         O7xHV57gK1pOMm6ananTzpoPYulHeM35J9CpvravOMiKWUwZbNgXaGeGzNa2ghFUqJyV
         QJWN1DjgQRmMLMKVp89h6tsF+hrhDWyRpHAGytKxDAkXDNUk8aNZInEVxnBOMh3esUBO
         RSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713425987; x=1714030787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9y1EKandT9WhygCglGxdWa3TL08KKuc2zQZTBYEseU=;
        b=qxYDdj7+ycE6Gtmp7PrOg+diS1Cnf9ACbpxVWLft2uQ2f5WWAKBQqvMNn6TJZOFT1X
         G99/LNwwuyhaUOWFp6iFPAZ9PoBH7RtriYocfehfxfARX4yGgzsHY3X4ner3Da9c36pS
         BlVatdat45fGuQjm9faWbjyOxaGAAMroOyY/Eh7VDP/yZrVwUSw3geICVtILxQde584b
         eg1jZ963srm/F8roeJHDGZ/JIYKmsm6R+a/47UtPLlOUtNh9i1yPHaFZPUW6o0LwxFbc
         zkh3TDs5t9ouobrPMwM4lQbn+nyzYfNSSbxZzu/Vlo3RNXlasmljctqJlLNEH/+kBFtT
         d9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVLpmH4uAoGUF25h/2tOloOf3KS4Yy95inJnZzmns7JUzDo4zZyvf8mK78NGL5vVofWSGlu3X22s4iZZP1jUPdYD6QEXJ9m3mCB4H2+Eu4=
X-Gm-Message-State: AOJu0YyuzQZR0TkwrJI2h+WhkUL5dgxl33kPzQPOqzlLWPqqkgrMONs+
	1oxJyblGXETMdRCGdHCuTV7aKxlPIbdueP9oTxMETQQszdJ3QhFlZT/rUuqaUuKJW1EimOr12+8
	=
X-Google-Smtp-Source: AGHT+IGHwLbmyp+4Lto8CB3x9N0Xboc5BghGDTyEn4zUImVlt/vKoWvCwcHK2cFXNgr7eu5kTkl7vA==
X-Received: by 2002:a05:600c:c08:b0:418:819b:26ca with SMTP id fm8-20020a05600c0c0800b00418819b26camr1457305wmb.2.1713425987298;
        Thu, 18 Apr 2024 00:39:47 -0700 (PDT)
Message-ID: <eb82270c-52f2-49f9-9aaa-72906e5b9b97@suse.com>
Date: Thu, 18 Apr 2024 09:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: mark the gzip folder as adopted code
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <2970c1010e227ca1460c5656d13fb87a05d87f29.1713174475.git.federico.serafini@bugseng.com>
 <d62f622b-65b4-4e37-87db-3cc88c89da67@citrix.com>
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
In-Reply-To: <d62f622b-65b4-4e37-87db-3cc88c89da67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2024 17:44, Andrew Cooper wrote:
> On 15/04/2024 10:56 am, Federico Serafini wrote:
>> Mark the whole gzip folder as adopted code and remove the redundant
>> deviation of file inflate.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I hadn't realised that we had a special case like this.  Definitely
> better to get rid of it.
> 
> I've pulled this into my `for-next` branch, and will get it committed
> properly when OSSTest (our non-gitlab CI) is in a happier state.

Hmm. Considering Daniel's work (which I'll comment on separately), is this
really going to remain "adopted"? We're about to diverge to a degree where
simply taking patches from the original source isn't going to work anymore.
IOW I think we want either Daniel's work (and perhaps follow-on adjustments)
or marking of that code as adopted.

Jan

