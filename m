Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FAA9B6BE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 20:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966839.1356922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81fS-000505-Q9; Thu, 24 Apr 2025 18:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966839.1356922; Thu, 24 Apr 2025 18:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u81fS-0004yb-MO; Thu, 24 Apr 2025 18:51:26 +0000
Received: by outflank-mailman (input) for mailman id 966839;
 Thu, 24 Apr 2025 18:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u81fQ-0004yV-IQ
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 18:51:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e269c21-213d-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 20:51:23 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so1474404f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 11:51:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbedf4sm110267f8f.45.2025.04.24.11.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 11:51:22 -0700 (PDT)
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
X-Inumbo-ID: 1e269c21-213d-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745520683; x=1746125483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kiZhF9VOYBl77ZWu0EdxEQfJfSR+cAOs0BJKXG22QIk=;
        b=uyoSh+ADfnhTveKkvTqGOKc3fLPBun8qUO4ejHyAZxTOLUy/qYxMUD81YedMD/uOJq
         dyTIjO6RgpvDqi197MNdGBQDppPHuF+BJo9JBIObQOmfjijJUHRwaexxeG06Oz3xUfh8
         1x+hSe5B2l7fQulqEaeHF5u+MkYpAsTOmdBqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520683; x=1746125483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiZhF9VOYBl77ZWu0EdxEQfJfSR+cAOs0BJKXG22QIk=;
        b=CVe4YW8hR4XejxDBJYG4Fg1rFRROqxKLbVyS+iKpP4mDEnxt82ucHBU5FHj8zhf+nf
         wQFOu1CEM4otnAKGdSAlfCFJzaxr/kX2JEGjozTZG/oOE/HSyuTu+pCAgx2sdwOYspUa
         x7nzt1BZDJag119a6u6FoJIJiWLvXgZUW8fpHkNaocmwbNvcUWNqLrmF/MInxdDc4YbF
         jqE5ijsaZAqJTJzZplQ7bm5XdwRIG1E00DNNSbm0/R47K/wMReCB7jRPiqDyqR7Tqlas
         wV5A5FjdJ+R7jYlIHeHZa3+FiKAfATF/wj8SWVbC8tm5iPjVuxDX3nC5Uz6h29gg+59Q
         rGHw==
X-Gm-Message-State: AOJu0YwTo3tjvWHd04ZVZSpcEEp+wDcXyYboQoepZte4rztrTwfch2oe
	05petFb7ojc524ECe4vELA7Vjo3pgnGPWWwyZIUJ9XvDL/XhNNrHwVBUv91gZYQ=
X-Gm-Gg: ASbGncsboJfUS0o2OnOWUitSv2dPnDvrhQHohf3SYlAczVFRWeIDIzb6l5poVTss4YB
	tfP7Z6bpk82iK6juqiQr92+tLXR0g3dlpfzCISY5gfgyFBqwXpz5i/FeGBBJmk9GdNAr8wXru7v
	fWG9FjOTaonxSYdWMZ4BpCddyXtRc6JpxZMKXVSXnEFLrKDg5KUeeyCRr0d2OFor+lRPFZx30YW
	Gf7bFby/AFTZcps5xTbAcsSMbji7b9ynGpxfNOyP0W+iLhjNLVrvV1Lg/uZ+5LrUR10Sn39BJ4W
	JM9AHfMXCsc/8N/HPuB0hPne9veLMsehQ2iFJBcyLTnUEePdr5cGU/mjjiVBsAGONYUci75C03O
	baFQIKQ==
X-Google-Smtp-Source: AGHT+IG1pjRRTV9+sQ0Hbt/wmB0mYpTvHbyBCtQye77xEnQSUintBb/6G0PeSTLKIksO9hi+5hL4oQ==
X-Received: by 2002:a5d:47ae:0:b0:39c:1257:ccb0 with SMTP id ffacd0b85a97d-3a072bfa76emr348702f8f.59.1745520682522;
        Thu, 24 Apr 2025 11:51:22 -0700 (PDT)
Message-ID: <99e2fd35-4241-4be5-a81b-c7ea6cd54597@citrix.com>
Date: Thu, 24 Apr 2025 19:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com> <aAk1ZBw8GtoVYoL8@MjU3Nj>
 <6ae5f0a2-8055-45e1-933c-199d6c6d8626@citrix.com> <aAqHQ98cePJxuf6v@MjU3Nj>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aAqHQ98cePJxuf6v@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 7:47 pm, Sergii Dmytruk wrote:
>> Alignment that large is unexpected, and I suspect we want to fix it.  Is
>> it pre-existing, or something introduced by your series?
>>
>> ~Andrew
> Pre-existing one.  I can see `-N` is already passed to `ld`:
>
> -N, --omagic     Do not page align data, do not make text readonly
>
> Specifying `--section-alignment 512 --file-alignment 512 --nmagic`
> didn't reduce the alignment.  Statistics so far:
>
>   Give 0x1000 offset:
>   GNU ld (GNU Binutils for Debian) 2.31.1
>   GNU ld version 2.38-27.fc37
>
>   Give 0x440 offset:
>   GNU ld (GNU Binutils for Debian) 2.40
>   GNU ld (GNU Binutils for Debian) 2.41
>
> Maybe that's not something configurable and just needs a newer version.

Ah - that's something that was changed literally yesterday:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=d444763f8ca556d0a67a4b933be303d346baef02

in order to fix some problems we've had trying to get xen.efi happy to
be NX_COMPAT.

We couldn't identify any good reason why -N was in use.

~Andrew

