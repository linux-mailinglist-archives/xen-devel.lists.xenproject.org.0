Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181AAC0EDD
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994139.1377188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7IR-0001m9-Ej; Thu, 22 May 2025 14:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994139.1377188; Thu, 22 May 2025 14:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7IR-0001kI-Az; Thu, 22 May 2025 14:53:23 +0000
Received: by outflank-mailman (input) for mailman id 994139;
 Thu, 22 May 2025 14:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI7IP-0001kC-Uv
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:53:21 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b1cec3-371c-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:53:20 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso1194249566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:53:20 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4c516dsm1082632766b.154.2025.05.22.07.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:53:19 -0700 (PDT)
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
X-Inumbo-ID: 80b1cec3-371c-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747925600; x=1748530400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEg1fqgSn+yG5ljEwaLpHIjQFbYXD7XUpvkK1Lj8BDg=;
        b=HCszTBy6ihRUwdQXAh29ewJK5M5mIO5+VN8pbK24IyM2jIVu66HdeiQbcwEGt1gZC4
         rumDH42SoP3v6yNZGxXpSC0Q7sQPCo+zd3ZmQoVsNiC/0NKu7dyRPv5clpNEKjUZyPmD
         +Zy77pGWn2YBf66UJsSNIuYMXMj8W5uAUOPUdMSYNY4XJAlaeLSEXbYPhrCD47GrIbeY
         Pv+QvcsftCBWauMf8iXuhR11ZlBQ8OSDT8ak31JdzxUDv3eb9cgpffwV6TdSTqjA//wU
         b8+ckSBl8JU9PC3Jca1oHkvydspWalC3x7qnEQwIYCRw/a0brAawpnHrCHDMIfb6cbGM
         K/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925600; x=1748530400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEg1fqgSn+yG5ljEwaLpHIjQFbYXD7XUpvkK1Lj8BDg=;
        b=Nzlzz/84VX3rTFJEvGltty/aP9OHjnMjdEzs2uqrDbgXqXEtodgLTEwmKoBmz3Uqy/
         bxfoNqT71znJhO+A+ShdYAsVQXQZ/qWD+LrvthP8tfZH+G68lckgi0q+vYYZkNmlz/uH
         IT7d6p34nMKHhSAAnOyhGYaj2EjPpnFPgmPs70GcEhRQE49NvqHJS/eWBNm2CuAjST3z
         jgiZZy4OSkYS1jo0umIL/wQNEPl6+0vsKYbrOBD5Ig9G9DXvgfKS35ab02vbjEwXXact
         6EENqqbNOl6CUcQfEOK/8O6l+jiPLVYEqtbIlAFnuSTNCPTXgZJJv/BQIwLw4ql0PbCk
         358g==
X-Forwarded-Encrypted: i=1; AJvYcCXPo950hTTqyx1ZVV4Z2D+oGdDuBF/Ajpsa3Zu9IHlxDsTcyThc6GjWTqxquC6uf05S/IX4Mw4IopQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlRxuO5P8374XR0pmazwiO9NDLbVKpI5id1Lo3EcB59/DjanLK
	eppekKRmygVXrLi57I6UyC1KVljgbG8yc6LEmBvj0rYkut7FrGJPV/Tsx1P6OOk5KQ==
X-Gm-Gg: ASbGncsTes0DFlHd4/iobriWzI5hU+qBpHQ8ZCbMJEAA3ImUjwIZmQm5+rkERsJAkXd
	bP/VNB/xeUwzJs8DLBCKC/JrVXXyBrcjkV/UUAxBRKvXsWKBz7QpcN7oNXPR3gUTTt3eCq2oWNH
	v6q2EoGJyXJXI+F3BJk+uKE6ysXnz6/ON1LH21zkRp74/UGSxs7IcmRLO21GHTH/GUX8fTOe4oF
	fiCSMvLT8+eTd3wSUtcN/oD59InaRTKYrlw4EmxzvHl2bv1wiBvQrj+bXPXp98spKm7q7QUy3rf
	i7fDsWFBD3h7dI/4RYk=
X-Google-Smtp-Source: AGHT+IETXLzJwAvXix9Cn5rUU9e236fbuJXs54DfCmNruV7irP9jNvFdcdcudDHLaIDQNQjx65TWJA==
X-Received: by 2002:a17:906:ef09:b0:ad2:42f3:86e0 with SMTP id a640c23a62f3a-ad52d548672mr2461316766b.27.1747925600163;
        Thu, 22 May 2025 07:53:20 -0700 (PDT)
Message-ID: <9b1555cf-507e-4b05-ab3d-91f994e334dc@suse.com>
Date: Thu, 22 May 2025 16:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP
 bring up stall
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-3-roger.pau@citrix.com>
 <8a39ec76-f050-488e-bf4c-ba378fae7275@suse.com>
 <aC8wn_C2xf3OW94y@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aC8wn_C2xf3OW94y@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 16:11, Roger Pau Monné wrote:
> On Thu, May 22, 2025 at 09:18:57AM +0200, Jan Beulich wrote:
>> On 21.05.2025 18:55, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -714,13 +714,15 @@ static cpumask_t show_state_mask;
>>>  static bool opt_show_all;
>>>  boolean_param("async-show-all", opt_show_all);
>>>  
>>> +static bool force_show_all;
>>> +
>>>  static int cf_check nmi_show_execution_state(
>>>      const struct cpu_user_regs *regs, int cpu)
>>>  {
>>>      if ( !cpumask_test_cpu(cpu, &show_state_mask) )
>>>          return 0;
>>>  
>>> -    if ( opt_show_all )
>>> +    if ( opt_show_all || force_show_all )
>>>          show_execution_state(regs);
>>>      else if ( guest_mode(regs) )
>>>          printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
>>> @@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
>>>      return 1;
>>>  }
>>>  
>>> +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
>>> +{
>>> +    unsigned int msecs, pending;
>>> +
>>> +    force_show_all = show_all;
> 
> Sorry, I did send v2 before seeing your comments.
> 
>> Both forms of the call can, aiui, in principle race with one another.
>> I think you want to avoid setting the static to false once it was set
>> to true.
>>
>> Furthermore, as long as all calls here with the 2nd argument being
>> true are followed by panic() or alike, I see no reason why you couldn't
>> simply re-use opt_show_all, setting that one to true. (Or else there
>> would then also be some resetting of the new static.)
> 
> So basically do something like:
> 
> if ( show_all )
>     opt_show_all = true;
> 
> And only overwrite opt_show_all when the caller requests full traces?

Yes, that's what I think it boils down to.

Jan

