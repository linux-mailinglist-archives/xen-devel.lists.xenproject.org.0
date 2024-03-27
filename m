Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACD88E6C2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698587.1090451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUU5-0006cI-TU; Wed, 27 Mar 2024 14:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698587.1090451; Wed, 27 Mar 2024 14:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUU5-0006al-Qg; Wed, 27 Mar 2024 14:42:33 +0000
Received: by outflank-mailman (input) for mailman id 698587;
 Wed, 27 Mar 2024 14:42:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df3K=LB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpUU4-0006ae-K3
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:42:32 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d70661c-ec48-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 15:42:31 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78a5580324eso194903885a.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 07:42:31 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h26-20020a05620a13fa00b0078a292780c6sm3906124qkl.75.2024.03.27.07.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 07:42:29 -0700 (PDT)
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
X-Inumbo-ID: 3d70661c-ec48-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711550550; x=1712155350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5EGsdBBBqo4WIBvqqR+snh+BhEcGGZ2YwYZ8VsJQZnQ=;
        b=jXKlnVrhvfVqRjCrW1y6bpLObpkxFzmWg4EyJIMnU1m2TWmWqksnVbJFkN8mU4FzbN
         vR1uBjuRXnr2BkeKzxtWJqXa4F/5iDYHQY4Tj2y3sPkLetAoSvU8OJq4HwwRDglle8Rq
         rTOzEqiMvBtnRmVkVdqLCh/EjIT+AoGWlsMm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550550; x=1712155350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EGsdBBBqo4WIBvqqR+snh+BhEcGGZ2YwYZ8VsJQZnQ=;
        b=CLaecu6nv8cjYctwtjlOHCSj0lyHeLjrDlQGMM+VC2sZ0cmQVXF5ULtt0vEy0N3trv
         13WEYPjGojwlrs4/sXdCc9zpQGET74qll93MqCkhIn0UhaJTvoi6bv5GPYVysu0uaDDx
         AqrBX0PabzM616pt54jG+pQPH13kfqwMmycuT6l4KJtVlgJ4z6HvvKvkphtNCvSX/Ho0
         rVPOh4Xi2Up8cHFiiOZcqYppWP8l8lU8RLG/Pv4rOqY3HkIKJ/fHbTtrfmFFfZDRBApK
         POuG9eZ/rVjy3SFOfibgg0bWD+sHPthwLswqj6S6H5V2UJfGbOEYxzlNQ75ifOilCnrA
         R8jA==
X-Forwarded-Encrypted: i=1; AJvYcCXi9h3qiskuVgKZHLhj1EntujogGlUSavO2ise0HXllzW4flLjJzUOu08DEWdwiokxKGDNmNr6vzrmvgss7r5GtMxtHeQ1kdGth0ov4t6A=
X-Gm-Message-State: AOJu0YzXaQjVvbKHkvZ968XGDno5cdYrfG+WwFEDQiLf00gQ6rv8BIOU
	AB+t3YD4atl74kaIQ8aCOVXoI+91dX//CGeVOc8IFOTqec0S4bIZdr4aLS4QSh0=
X-Google-Smtp-Source: AGHT+IGtaXuoShfCIDYmL1J5mp4xw2LHubzR8vqOBE/a1j6DcfdiF8yQ/Kyw8I+8nzxEZ4cOZhCQdA==
X-Received: by 2002:a37:e10e:0:b0:78a:5fd1:f4e7 with SMTP id c14-20020a37e10e000000b0078a5fd1f4e7mr6091322qkm.53.1711550550306;
        Wed, 27 Mar 2024 07:42:30 -0700 (PDT)
Message-ID: <8fbb0ac1-e72b-4532-8d46-d79b751d8c96@citrix.com>
Date: Wed, 27 Mar 2024 14:42:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
 <93172b11-c737-400e-9d2e-daafee8f1cbc@citrix.com>
 <c08666ad-2baa-407f-943a-a47d1aba345f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c08666ad-2baa-407f-943a-a47d1aba345f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2024 2:06 pm, Jan Beulich wrote:
> On 27.03.2024 15:01, Andrew Cooper wrote:
>> It occurs to me that these want considering:
>>
>> b6cf604207fd - tools/oxenstored: Use Map instead of Hashtbl for quotas
>> 098d868e52ac - tools/oxenstored: Make Quota.t pure
>>
>> while 4.17 is still in general support.  These came from a performance
>> regression we investigated.
>>
>> I've done the backport to 4.17 and they're not entirely trivial (owing
>> to the major source reformat in 4.18) so can commit them if you'd prefer.
> Didn't you bring these up for 4.18.1 already, and I said that I'd leave
> this for the maintainers to decide? Same here, in any event. Cc-ing them
> both, just in case.

I could have sworn that I remembered requested this before, but couldn't
remember where.

I'll see about poking people for an answer.

~Andrew

