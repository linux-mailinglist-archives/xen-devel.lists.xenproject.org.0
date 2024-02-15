Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B517855FB7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681582.1060426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZCt-0007A1-GS; Thu, 15 Feb 2024 10:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681582.1060426; Thu, 15 Feb 2024 10:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZCt-00077Q-DO; Thu, 15 Feb 2024 10:43:07 +0000
Received: by outflank-mailman (input) for mailman id 681582;
 Thu, 15 Feb 2024 10:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raZCr-00077J-JF
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:43:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff5c4980-cbee-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:43:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41222a56492so1566665e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:43:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b00411c3c2fc55sm1564963wmp.45.2024.02.15.02.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:43:03 -0800 (PST)
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
X-Inumbo-ID: ff5c4980-cbee-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707993784; x=1708598584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MzW1gi9zcwFfvFC1flaKIROTG44GtICm/Pfy/T7M0o=;
        b=RvGoWnpqkcGjmaLoOe3cjZ+RrwwZbR37IGS8FM6wjxkmgFQoftqu/SyyPghzZ+bTQv
         qTDZoSiR0hww6/7YIPJ37+6y4fw+SiOfloAQXI/d7Mj2UGr+/vyTAaoAs9b6zZ1HT0vw
         pSeiedyCcqNfhakI5aGdXf7eUXVV8B4GiG2BTABDG4SR0AD5eAk4chZdFrumoIOnmYvJ
         Ca4LxLhElis4Mpl/MBk2uWKCoO10C1AhLIbmp/GxZYUrZmLeP/QxUrI45yi8WG453Q4M
         DZH3YXXEZy4wyWmmPKI1yWmY2CyXDpLmoYekPLL2veLJLuyhUY+xSBSPp8ai4teJBdF5
         YtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993784; x=1708598584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MzW1gi9zcwFfvFC1flaKIROTG44GtICm/Pfy/T7M0o=;
        b=mAB0wai7zYRVIruFTj6y0BzBVhivvw8aq2fiOwy33WiFU64WfBapVHhsIP6difWYE9
         BOeArvbgyrpfvGcXzwak+oeHpwNQmrTlgqvISisUvKHBQMLmmPRGkKMaRICLh80uAvQp
         2bpsoBQgd9hARFT8wQ9sad/xKga4jdhuICGKGm5X+Mq5AOr6OzjXfVciLAudwJ+/0KXm
         ejfIYkij7ZiVgAayuN61dW4P6mX3VO0igkVpgJzvjwkqhOV1cVh545pI24NC1O4K97II
         qwFBLf1AbONa9c6nP13kKPaA0QZ6Pm/EiL1tzXsCMaarwt2vYUzADYc9m4ookqskHdwh
         Rcwg==
X-Forwarded-Encrypted: i=1; AJvYcCV+6CwHHkuoBl9vR9cvTyeYSLXdcE68wBVDSNHxnW9UyHJlZmT7tJcR77BXT/Gcb6JxyJS79gs2XGAlOJIEwi2IELq0AjLyusTTnMBdI70=
X-Gm-Message-State: AOJu0Ywm8ryWQIAfj12r+f3yLDu3kr5jkjxcwV5jale+fnUUnKn9UAXi
	O8DiqAF1C1l8cH8sSlptwaQez9tW9xJKcUlFjnwBke8ttmxXh+sdzXLj2p4ydQ==
X-Google-Smtp-Source: AGHT+IG5pbETU+SOyPcEkl3ByzeKCTyFBlRScRBABHtLws9FewwdWCQiNfEC2clOnIuuCpJLge+q/A==
X-Received: by 2002:a05:600c:1c18:b0:411:e5c1:9b24 with SMTP id j24-20020a05600c1c1800b00411e5c19b24mr1054702wms.26.1707993783803;
        Thu, 15 Feb 2024 02:43:03 -0800 (PST)
Message-ID: <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>
Date: Thu, 15 Feb 2024 11:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com> <Zc3nXpUOlnIHEfsl@macbook>
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
In-Reply-To: <Zc3nXpUOlnIHEfsl@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 11:28, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 10:49:31AM +0100, Jan Beulich wrote:
>> On 15.02.2024 10:30, Roger Pau Monne wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
>>>  else # !config-build
>>>  
>>>  ifeq ($(need-config),y)
>>> --include include/config/auto.conf
>>>  # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
>>>  # changes are detected.
>>>  -include include/config/auto.conf.cmd
>>> +include include/config/auto.conf
>>
>> With the - dropped, ...
>>
>>> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>>>  # This exploits the 'multi-target pattern rule' trick.
>>>  # The syncconfig should be executed only once to make all the targets.
>>>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
>>> +	rm -rf include/config/$*.conf
>>>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
>>
>> ... is this really necessary? The error status from the sub-make is ignored
>> only because of the -, isn't it?
> 
> Without the `rm` the include/config/auto.conf is not removed by
> Kconfig on error, so the include will still succeed but use the stale
> auto.conf file.
> 
> Keep in mind on rebuilds include/config/auto.conf is already present,
> so the rule is only executed for the include/config/auto.conf.cmd
> target.

But the sub-make ought to return failure, which ought to then stop the
build process?

>> I also don't really follow the need to re-order the include-s above. Their
>> ordering ought to be benign, as per make's doc stating "If an included
>> makefile cannot be found in any of these directories it is not an
>> immediately fatal error; processing of the makefile containing the include
>> continues." While the description talks about this, I'm afraid I don't
>> really understand "... the .cmd target is executed before including ...":
>> What .cmd target are you talking about there?
> 
> Without the reordering the include of include/config/auto.conf will
> always succeed on rebuilds, because the include is done before
> executing the include/config/%.conf.cmd target that does the `rm`.

That's a dual target: It also handles include/config/%.conf. I.e.
because of this ...

> With the current order the include of include/config/%.conf.cmd that
> triggers the re-build of auto.conf happens after having included the
> file already.

... either include would trigger this same rule. IOW I'm afraid I'm still
not seeing what is gained by the re-ordering. I'm also unconvinced that
"triggers" in the sense you use it is actually applicable. Quoting make
doc again: "Once it has finished reading makefiles, make will try to
remake any that are out of date or don’t exist." To me this means that
first all makefile reading will finish, and then whichever included files
need re-making will be re-made.

Jan

