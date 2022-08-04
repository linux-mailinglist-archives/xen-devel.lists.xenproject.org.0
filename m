Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7A589C51
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380347.614464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJacw-0004NL-QU; Thu, 04 Aug 2022 13:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380347.614464; Thu, 04 Aug 2022 13:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJacw-0004KZ-N5; Thu, 04 Aug 2022 13:11:02 +0000
Received: by outflank-mailman (input) for mailman id 380347;
 Thu, 04 Aug 2022 13:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x682=YI=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJacv-0004KT-En
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:11:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e289f2b1-13f6-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:11:00 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id p10so21011802wru.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 06:11:00 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1?
 ([2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a0560001b0200b0021e47fb24a2sm1188932wrz.19.2022.08.04.06.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 06:10:59 -0700 (PDT)
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
X-Inumbo-ID: e289f2b1-13f6-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=U+avP7mZsXCqtuCoIldOW665gNqGP5EdVo+N5jTMvfU=;
        b=RME22khxM6bQxcVxHFR9Wbc7p1NPAQlC1Sw3bxeY8SsSKKSbHWMiDOH0rjzeY2nzCo
         bZFw6eh8w7S0SYE5gr7dRlLmMvSR5bqtRtLneA4l81KI80+TsASYW5k2uSk2QE28VvcM
         pV8XYBEDIlqYGtB1lfsDUPt+9IpXK/4S70Zc7PJD9kIDbdUrq99QQjtAjttFMLgBZhTa
         94+FmmlPrWO7TDia/MSqGZnG0hRcW1lDOZ0bZXYokZpYCnUzqGMK3bph3sFlQ39plzx9
         WWZro4ptbRg1yJo/1+iMbJIBGkVTCeNW8Sd5QhbXoG1JVxXpkqEHBUuSMA52H/nXaWCs
         V8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=U+avP7mZsXCqtuCoIldOW665gNqGP5EdVo+N5jTMvfU=;
        b=qlo0w3T5wD4pGXxLIB/EE55yj1Cv9buDbtDuPQwxcHYFubBdpjuD/ZULg6BGTF4ZSB
         Oe+OtiP3slX1jhGHwAuMUByFwDBtPXoJQKITAXjKWQfIbHoFDHG5YYO51riGI1WuUjil
         dEhJupmWhzffmQBVWvY3ppZv5VZz2gaR0ZMTtl5ZdIxXf9adzXfjdQlbuXS58F/YloYQ
         OWm8umnY4e7zcvCt1JvpsF86SJ+TWMPg5uyvDM8tRcS7jj2+qkR8DsoythzKRRcws2pt
         9XmP76ut2AS8wc785MZTL2iI3gEPmsk2csTPH8z5m9VHV5nZQwx2IyQ8SxYvbNSGfAYc
         wbPw==
X-Gm-Message-State: ACgBeo0IX1jv0npbN7YwIITXqMYeGHIWgi2Gj8rL1WSmJYAzbMrMx4/w
	4A7nsunVh01MoP6FhBjFp22+K44RL+Y=
X-Google-Smtp-Source: AA6agR4pjjwPH5tKl76Si/r0ETpE2Ky2LN8QKIplQfsmBPEmEtdffllkUhzypkECNFhKexSrGkAAGw==
X-Received: by 2002:adf:fe45:0:b0:220:625e:f4e8 with SMTP id m5-20020adffe45000000b00220625ef4e8mr1361692wrs.182.1659618659811;
        Thu, 04 Aug 2022 06:10:59 -0700 (PDT)
Message-ID: <d7e0a598-d642-6227-09e3-51d3994ae359@gmail.com>
Date: Thu, 4 Aug 2022 16:10:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220804124736.1827246-1-burzalodowa@gmail.com>
 <be627b72-9f68-2deb-5639-2e7731f3e8a6@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <be627b72-9f68-2deb-5639-2e7731f3e8a6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 8/4/22 16:01, Jan Beulich wrote:
> On 04.08.2022 14:47, Xenia Ragiadakou wrote:
>> Changes in v2:
>> - add ASSERT_UNREACHABLE()
> 
> Hmm, this ...
> 
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -377,8 +377,10 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>>       unsigned int e_namelen, e_len;
>>   
>>       e_namelen = snprintf(name, sizeof(name), template->e.name, id);
>> -    if ( e_namelen >= sizeof(name) )
>> +    if ( e_namelen >= sizeof(name) ) {
>> +        ASSERT_UNREACHABLE();
>>           return -ENOBUFS;
>> +    }
> 
> ... looks to be an incremental patch on top of v1, not v2 of that
> patch?

So, here, IIUC, I have to create a patch series and add the assert in 
the second (2/2) patch? What should be the version number of the series?

> Also please correct the placement of the opening brace.

Ah, ok. Sorry.

-- 
Xenia

