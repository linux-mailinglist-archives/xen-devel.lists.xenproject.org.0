Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8D431797
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212097.369851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQyP-0007IZ-UO; Mon, 18 Oct 2021 11:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212097.369851; Mon, 18 Oct 2021 11:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQyP-0007Fq-RF; Mon, 18 Oct 2021 11:38:33 +0000
Received: by outflank-mailman (input) for mailman id 212097;
 Mon, 18 Oct 2021 11:38:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7EWR=PG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mcQyN-0007Fk-JO
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:38:31 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f494cf52-3be0-4b99-b1a6-78482fd382be;
 Mon, 18 Oct 2021 11:38:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r18so40792913wrg.6
 for <xen-devel@lists.xenproject.org>; Mon, 18 Oct 2021 04:38:30 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-165-42-146.range86-165.btcentralplus.com. [86.165.42.146])
 by smtp.gmail.com with ESMTPSA id o6sm15570535wri.49.2021.10.18.04.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:38:29 -0700 (PDT)
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
X-Inumbo-ID: f494cf52-3be0-4b99-b1a6-78482fd382be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BH8Y0dm5cM2PeXjuRhSDN9eE48XKEYhtXBA8igrCSb4=;
        b=guRwS9hKrjE1uqFRZXayIrWo4uZveFgY2NnQhPAfTXDikMVhJqXl+9E1IhgKASAnUR
         0y0OjmCM0MzfIZpaqPWibbsB5/GWkXk46HKcJ6lCZWizVzL6wZVAQxB74WqmoTPtbFPb
         IWkB+kaw0ZZjUfT2l7+At/Cmxazsqf07N0CuSGZjVOi0sGFFzaU1PXn97hwPLNgFICNy
         FvYdyaJvj20k1oqyFCS5MaBhdlR97fUdDwvBKZKW28YDlz5xnhrDCe8ezDg8IIlLml/V
         wwIRz4rHRnZgKXGlmdFCODUwuJIiXm96CWGXT4W7418NLnpCzPSdlLX4pr9xjGItlqGU
         58iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BH8Y0dm5cM2PeXjuRhSDN9eE48XKEYhtXBA8igrCSb4=;
        b=R332i15zCletv/6h4KFr3vKli2sVAB2qvBYTr2XRI588ldcQQBuV0S7oYE4RBl+lbL
         2/oCnN8FWhL2R+YkJFGoelJKAZJ+0WyIHkZdp7NxKWkNxp568w3sSNRcq9YmsvaUOFjf
         xYLkZ4THiyKgjCPHKNetEM9fUPJ4Wzn1D6d5LL5rIilgztU+2F8xJZIetZCC5exIrkgF
         LODpOfYuEFDXZcnPvegLTWwNxcW8VOlBklCTTfl0Mh5qhfDm0hJZcpdM7TgTx8l6kij7
         LbyHNjbRM9w5QrAjwzbvZEu0q7Yb1R39ASo1GZwQN1C7fNKtp+EfB5y8nARgKNSBQObO
         3cZA==
X-Gm-Message-State: AOAM533Wze/8XIVnpBGlRnxauTfl19wMbdWWOa5jO96PRr48uoIjrMaf
	eQ7fdjqmCzvh1nkUwQhEt8c=
X-Google-Smtp-Source: ABdhPJx6FeHF4uV+hXQ9PhKI1oscAqy1pJtGhECpUPhewimvx9VhysZe+GIvN/tYCpVP4WZLDvZK7w==
X-Received: by 2002:adf:ca10:: with SMTP id o16mr33931603wrh.212.1634557109814;
        Mon, 18 Oct 2021 04:38:29 -0700 (PDT)
Message-ID: <7e4ba3ef-0c39-eb90-bd94-8320f6c06104@gmail.com>
Date: Mon, 18 Oct 2021 12:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed
 viridian_vcpu_init()
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
 <24941.20394.574634.548545@mariner.uk.xensource.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <24941.20394.574634.548545@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2021 11:42, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] x86/HVM: correct cleanup after failed viridian_vcpu_init()"):
>> This happens after nestedhvm_vcpu_initialise(), so its effects also need
>> to be undone.
>>
>> Fixes: 40a4a9d72d16 ("viridian: add init hooks")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -1583,7 +1583,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>   
>>       rc = viridian_vcpu_init(v);
>>       if ( rc )
>> -        goto fail5;
>> +        goto fail6;
> 
> Not acomment about the patch; rather about the code in general.
> 
> I have not looked at the context.
> 
> But OMG, this is horrific.  How can anyone write code in such an idiom
> without writing endless bugs ?
> 

Fairly easily. I think this is the first one due to an incorrect exit label.
Using such an idiom in the Windows PV drivers had meant many issues 
could be easily debugged without further code modification because you 
get an fairly instant audit trail of the route out of any failure condition.

   Paul


