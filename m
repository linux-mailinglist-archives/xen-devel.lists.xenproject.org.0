Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81230AB566D
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982870.1369232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpy8-0004Sy-NN; Tue, 13 May 2025 13:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982870.1369232; Tue, 13 May 2025 13:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpy8-0004QZ-K5; Tue, 13 May 2025 13:46:52 +0000
Received: by outflank-mailman (input) for mailman id 982870;
 Tue, 13 May 2025 13:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0QL=X5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEpy7-0004L0-5s
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:46:51 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b81819f0-3000-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 15:46:49 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5fbf007ea38so9327485a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:46:49 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21933f4e6sm787374266b.54.2025.05.13.06.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 06:46:48 -0700 (PDT)
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
X-Inumbo-ID: b81819f0-3000-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747144009; x=1747748809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AS3DnpownWeR82CqRsAbYVA6LFIoGSSjqX5AJvW/hmI=;
        b=KYdeFhfW/7NEMpsxu/3Bb1KIu2fq1yuLoqIEJmjx4ChHsqCiO+AWtftba4/cKzUE9n
         S+xnmP2lz+qTIx8h8fcfPKpaNs5njX1+lIRUlKd3w+A8zB6RRM1wbSdb7Ofr2P/iESKy
         DDB9L4C5L412h9V+l87iqIMjRynuENWdngDz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144009; x=1747748809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS3DnpownWeR82CqRsAbYVA6LFIoGSSjqX5AJvW/hmI=;
        b=CuiD2ia5ENcTdX7Konu7cJ1AmIg90e0U8L6qxcpQKA3pS/J84Xb0PZ5bkxjPS62uCN
         CTYReu7jFGoEOM6KKvo/4OVuDUbyxdsZmIUN4Mfd2MgePyJbfLQKYH3MaEt6tlVMGJ3J
         cLs4qsHtrdoG6ah+8t9SFgxCmZD41k35cvvRKKu/OFKsiHsOjX2gsWG9Sxnq7vghTyh3
         P3uc6E8UyWOzXs22X5g5T5MephIpbUKehfOspifdALJ1bowMw2JjHU6s4EJyWz2yGUzo
         ochv5BsirwHXKjR49t0XF2J8d9ubsbwCJPpyrfKMRf5/x6DIm3WI7QiJ7yU+Z4UNB33P
         s8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyY6QIyVUw54VO51ytNQmiWiFUcSgLNPheZ9OFzfM10z42QxwzShlYHcbdBtjnzDaGJnTepCCzYqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMukSwgIuwgGtWwbCZ2S1541fE9PCmLb7D5k6Jvwguh70ouL6G
	PjDo+ndkznFM1f3fgRcHrdf/lXsaN7Ot+WQUFbmxEH7gkYS+hBcudtDNuBX3AKw=
X-Gm-Gg: ASbGncv22D6a09p7SYUwdKGzBGBY48rbsjhlmpCaFAOBpAmd5M29nDo/1uBRrB4F5r7
	/I8YXaQuKlWgu8Ng1RSB6HvVKhM+1MHqGIt/xgJfy/j3ADkzTPC4tBRzrDm/0Vcl6uq/velSsje
	zRxASDEphabukKnkuSGQITjhqgEVytIP43LLY0em50vvpFBQZH/RqkK+R2nMnEq4UjIUCZclo/V
	d4LLjRpGPiZr4FmBbEqq5Aml6wfOZTX3OPxp5uKpGP9cpNIsJFMqlursY3Xo3dUQWaYWiSavq9W
	t0cJRO+R5OzUXSXbD2Ig39ZAbOi3sx58tBnGbciS48T3wXtFD3tYZbpEeEqKjfZLY70chqkJxMo
	ro/fEALW5HcsqTApn
X-Google-Smtp-Source: AGHT+IHdp+jEzdSRUP9XljIwWFKtEjWShJ2MqPEq+EFHYL7IgiY9WDoOGF0iZIF5MFDudQ1fsuYn+w==
X-Received: by 2002:a17:907:c50e:b0:ad2:23a8:c71e with SMTP id a640c23a62f3a-ad223a8ceb2mr1380964666b.27.1747144009005;
        Tue, 13 May 2025 06:46:49 -0700 (PDT)
Message-ID: <8b34653d-d83e-41f0-b4e7-58f7d5ca2b1f@citrix.com>
Date: Tue, 13 May 2025 14:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec-ctrl: Support Intel's new PB-OPT
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250513124814.3500710-1-andrew.cooper3@citrix.com>
 <39eb1f57-fb2f-4c55-ac79-a6e81a1c5b40@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <39eb1f57-fb2f-4c55-ac79-a6e81a1c5b40@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2025 2:42 pm, Jan Beulich wrote:
> On 13.05.2025 14:48, Andrew Cooper wrote:
>> In IPU 2025.2 (May 2025), Intel have released an alternative mitigation for a
>> prior security issue (SA-00982) on Sappire and Emerald Rapids CPUs.
>>
>> Intel suggest that certain workloads will benefit from using the alternative
>> mode.  This can be selected by booting with `spec-ctrl=ibpb-alt`.
>>
>> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/cpuid-enumeration-and-architectural-msrs.html
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with two nits: For one, s/Sappire/Sapphire/ throughout. And  then ...
>
>> --- a/xen/arch/x86/spec_ctrl.c
>> +++ b/xen/arch/x86/spec_ctrl.c
>> @@ -85,6 +85,8 @@ static int8_t __initdata opt_gds_mit = -1;
>>  static int8_t __initdata opt_div_scrub = -1;
>>  bool __ro_after_init opt_bp_spec_reduce = true;
>>  
>> +static __initdata bool opt_ibpb_alt;
> ... type and attribute would preferably be swapped here, just like it's
> in context above as well as for the statics you add to cpu/intel.c.

Oops, both fixed.  (The public probably aren't aware, but this patch got
lost in a bit of a mad rush of the late breaking changes to XSA-469
yesterday.)

~Andrew

