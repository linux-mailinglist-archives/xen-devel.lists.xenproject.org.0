Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB305679DD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 00:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361643.591267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qd4-0002Qf-JW; Tue, 05 Jul 2022 22:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361643.591267; Tue, 05 Jul 2022 22:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qd4-0002OW-GR; Tue, 05 Jul 2022 22:02:46 +0000
Received: by outflank-mailman (input) for mailman id 361643;
 Tue, 05 Jul 2022 22:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8qd2-0002OG-Dk
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 22:02:44 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d3173a-fcae-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 00:02:43 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id r14so13620483wrg.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 15:02:43 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a5d510e000000b0021d60994b0asm10151482wrt.100.2022.07.05.15.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 15:02:42 -0700 (PDT)
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
X-Inumbo-ID: 31d3173a-fcae-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Mcg72TBG1jxYz7iVjnqxrxdaFWvNUE9pET8iQOek4xA=;
        b=jhxkmdkB7haX9DAJ8QwVckaFsM9+56VTqdkyHC8d0QEDvK/O5ksR9mwCaYYj+DXG/x
         +gHTHAXco+KNQgwpTSpP7dO3UR/psmfeGg4tPd25UzNyD0X9FTWXEf1TJSzbxZESBYgI
         w9ZhwDU+FlSQ9NIEAPQTinidVM6LEQHolC4NhDvwHLFg6wn4vgH/Wt4qO2IBNkfoXvVP
         62IJFJCATnpkzpkDWo36YM7YM5Mqcvw7fdh3Pvk6hSkMLWsI6kPNbwnBcL0gVXkpWQ80
         Gutqk5Ih1/ZpyGv5H4f5rafpPzuMI48h9zjBPR04roDWPdiHMCoKlu5HnyP6WTHBpD4n
         dAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mcg72TBG1jxYz7iVjnqxrxdaFWvNUE9pET8iQOek4xA=;
        b=f83NkHcOV2gwoYISUIz+gi/HwPAbxnVrLYZJ8sMdVZhmv/JngvpWg/AB20f5P1JaPY
         q+0jxwlyDCfA3Du/jFElOJdgnaEEec3USinRkrKWtKa2aOJ6G1I69zu5P+4WQ/NT1Han
         33V6p01PQjiPx0Hco8RM64Mv/AcZ+3/aU4u1U0mGRoQpSkK365kJEuBjKEpkJ1UzGHpT
         fFRMvE49TGIsJ7ISuHhZ3ecpj1F1N3L6jK652ckKKAlBhRP3PkRy8iB3COTbJ0gOuPJq
         o8HGOXMQsmf7Q+tgff2IyvQ0GuiVfn/4o5h0vxp4GhhuL7r01vijJJuhForszt55mse0
         6z1Q==
X-Gm-Message-State: AJIora83xdZRWyRRivJi2PxxbQ+ang9DJT9UAyr4Uqap9h6062E/JDDI
	wanwS0oZ+K8pHdoqWqtRC9M=
X-Google-Smtp-Source: AGRyM1tnznu0hYs4Vnv79iV0LdGWQNC52y9NyDUoLmMR+4lTxWtjMGa38EGKJ1WDzEBz6M0+1YkB2A==
X-Received: by 2002:a5d:55cd:0:b0:21d:6d9d:2c4e with SMTP id i13-20020a5d55cd000000b0021d6d9d2c4emr9283156wrw.544.1657058562994;
        Tue, 05 Jul 2022 15:02:42 -0700 (PDT)
Message-ID: <fc36b54b-5bc9-d30b-3524-79711abbbdc8@gmail.com>
Date: Wed, 6 Jul 2022 01:02:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] xen/char: pv_console: Fix MISRA C 2012 Rule 8.4
 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-5-burzalodowa@gmail.com>
 <47ed7737-5422-e4be-c99d-0e448616f5b5@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <47ed7737-5422-e4be-c99d-0e448616f5b5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 7/6/22 00:38, Julien Grall wrote:
> Hi Xenia,
> 
> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>> The function pv_console_evtchn() is defined in the header 
>> <xen/pv_console.h>.
>> If the header happens to be included by multiple files, this can 
>> result in
>> linker errors due to multiple definitions,
>> So, it is more appropriate to resolve this MISRA C 2012 Rule 8.4 
>> violation
>> warning by making pv_console_evtchn() inline with internal linkage.
> 
> There are multiple version of pv_console_evtchn(). The version below is 
> only used when !CONFIG_XEN_GUEST.
> 
> The header is also included multiple time within Xen. So I am a bit 
> puzzled why we haven't seen this error before. Maybe this is unused when 
> !CONFIG_XEN_GUEST?
> 
> If yes, I would remove the call. If no, then I think the commit message 
> should be clarified.

You are right. I had to clarify that this holds when !CONFIG_XEN_GUEST.
So when !CONFIG_XEN_GUEST, the function pv_console_evtchn() is defined 
inside the header file and the header is included only by a single file. 
This is why the error has not been triggered.

> 
> Cheers,
> 

-- 
Xenia

