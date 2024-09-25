Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1B986837
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 23:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804610.1215649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZMN-0001t6-Pa; Wed, 25 Sep 2024 21:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804610.1215649; Wed, 25 Sep 2024 21:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZMN-0001rb-Mo; Wed, 25 Sep 2024 21:15:43 +0000
Received: by outflank-mailman (input) for mailman id 804610;
 Wed, 25 Sep 2024 21:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stZMM-0001rV-SJ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 21:15:42 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51d5dabf-7b83-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 23:15:41 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-536748c7e9aso393301e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 14:15:41 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5157sm2354665a12.60.2024.09.25.14.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 14:15:40 -0700 (PDT)
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
X-Inumbo-ID: 51d5dabf-7b83-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727298941; x=1727903741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WbKBa1Ko9k5g/X6RAPJbwcWYFeaiuRnwhWN1R44SHnc=;
        b=o3HoWugfzUmjdMsxOjeF5/lOb6nELpDxtVdjmgJ4IhHQzCM0Fa1wtxjhGUebUkWqmF
         bQDntLW1aVh4JYMNTzd2NvCprmYTEwt6vGBwumU+9+j02qRDkafkfNNXsbVgjAbGUnBx
         2ZA+Ggt4t6t8iJPzX/68b3szsqnl4ZzVPpids=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727298941; x=1727903741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbKBa1Ko9k5g/X6RAPJbwcWYFeaiuRnwhWN1R44SHnc=;
        b=lsuiOCU3E46lVVkzOMd92FSZFdaa8Yx4e/VYYm8EmZ+r2ST2DgG7cvcWUYiVfS/Qr7
         yT/DliqI1odQZpY/kGk2wsk2J36IXclRWScMJzcuQWxOS3wa2oft7tq0bfYAHuRvqz1M
         2HVpwc9Sf2iPL5NISfwblf4ri9uCIwaEc1Jw2DLT65gZCVv0uwNgHnl3cDU4BjxWTz9G
         SwD7iWkEBxC8XOILfw2tiN7RzpFytgN2VQcXS8D6oREluj9dlGJCJFelDRcFw6iaGPfx
         ZKK0OcIZcA8XEXp4958Ork8ImKHnsTOME/At0paSoj9R6VpnOdFAMeXnWjG1wNnUMTYp
         V4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ts523XqZWeVsN9U4e02LZh+pZZNHi8g9lN9N7WFJgN+9YnJOjtBcdhIDOpP04SMDjzg3mkiccsw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkCW5py7Kbyh/hV4P5SJ+a3Tc+kErkID2V9buKQ5BHeKOMbXf1
	3AfGn+1hQ5KnwcS1F2c2cbBdWQYBq8UzuNzPpzqBgImeB7pmkSPdTzDAa9dKiMk=
X-Google-Smtp-Source: AGHT+IGdFFQecUttNGxmEx5yntLYsdH1ojKC/LXkDWEFQOUoglYGX5o34voz+y9eftSZdxPGijsChg==
X-Received: by 2002:a05:6512:b9b:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-5387754d42fmr2609813e87.27.1727298941050;
        Wed, 25 Sep 2024 14:15:41 -0700 (PDT)
Message-ID: <3e439093-a9bb-4213-b28f-25fa09b5eecd@citrix.com>
Date: Wed, 25 Sep 2024 22:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/alternative: Walk all replacements in debug
 builds
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-3-andrew.cooper3@citrix.com>
 <b1333d62-b738-4a61-9c68-ba7903f2e92d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b1333d62-b738-4a61-9c68-ba7903f2e92d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2024 3:44 pm, Jan Beulich wrote:
> On 22.04.2024 20:14, Andrew Cooper wrote:
>> In debug builds, walk all alternative replacements with x86_decode_lite().
>>
>> This checks that we can decode all instructions, and also lets us check that
>> disp8's don't leave the replacement block.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> With pointed-to types consistently constified, technically:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.
>> @@ -464,6 +465,54 @@ static void __init _alternative_instructions(bool force)
>>  void __init alternative_instructions(void)
>>  {
>>      arch_init_ideal_nops();
>> +
>> +    /*
>> +     * Walk all replacement instructions with x86_decode_lite().  This checks
>> +     * both that we can decode all instructions within the replacement, and
>> +     * that any near branch with a disp8 stays within the alternative itself.
>> +     */
>> +    if ( IS_ENABLED(CONFIG_DEBUG) )

I've swapped this for SELF_TESTS now it exists.

>> +                }
>> +
>> +                if ( res.rel_type == REL_TYPE_d8 )
>> +                {
>> +                    int8_t *d8 = res.rel;
>> +                    void *target = ip + res.len + *d8;
>> +
>> +                    if ( target < repl || target > end )
>> +                    {
>> +                        printk("Alternative for %ps [%*ph]\n",
>> +                               ALT_ORIG_PTR(a), a->repl_len, repl);
>> +                        panic("'JMP/Jcc disp8' at +%u leaves alternative block\n",
>> +                              (unsigned int)(unsigned long)(ip - repl));
>> +                    }
>> +                }
> Why's Disp8 more important to check than Disp32? A bad CALL in a
> replacement can't possibly be encoded with Disp8, and both JMP and Jcc
> are also more likely to be encoded with Disp32 when their target isn't
> in the same blob (but e.g. in a different section).

Whatever the likelihood of them existing, Disp8's cannot possibly be
correct if they cross the boundary of the replacement.  Checking for
them has the side effect of running decode_lite() over all replacements.

Disp32's do exist in both external and internal forms (retpoline), and
the point of this series is to make all external cases usable. 
Therefore, there are no invalid cases.

~Andrew

