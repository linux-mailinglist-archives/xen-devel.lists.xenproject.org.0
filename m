Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C62A87F1D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949899.1346356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4I62-0000Pj-85; Mon, 14 Apr 2025 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949899.1346356; Mon, 14 Apr 2025 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4I62-0000N0-4d; Mon, 14 Apr 2025 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 949899;
 Mon, 14 Apr 2025 11:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4I61-0000Mu-5C
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:35:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd5dfb8-1924-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:35:24 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso2518285f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:35:24 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445515sm10518953f8f.89.2025.04.14.04.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:35:22 -0700 (PDT)
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
X-Inumbo-ID: 8dd5dfb8-1924-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744630523; x=1745235323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S4SqS9nQ4FqsgFnLIzFWParOl7LFNGdBrqQwijjIBbU=;
        b=oJlkJCLUn3ujEZ1ZWGL2hGT+K9+MTnPVP7jAdlbxbSiJ44BWnLPr/GyBUPDLo0B33T
         /6IGg7MA7ZUv0o/wux7A3TMJoQIKmrteIoEB09TVt3e7SKTZVAo6ACBwYSyStg7ao7LX
         vH3g42Raq+x5ZUQZWkh1WJ7ap8jxO51qtCasY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630523; x=1745235323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4SqS9nQ4FqsgFnLIzFWParOl7LFNGdBrqQwijjIBbU=;
        b=WaC4YB9Eu3suQCLxWrJTw6ppwyQVPXXbYODumhXUWZAVxhqPASRSyJNO7FXvqwngGQ
         OjuX7uezpwJEm8s7M+kGrDCw2SrGHCrSwkfcpUgH+0enmAnHIy17wPBP9Dduj4DOzJFY
         jdg2t8w2JQpfSh3KovnCqSqpbirXyZ94iEfOvHJ1zKwZID6NXJ2CQmT+Rly86geoCKEx
         u3W+JIaXHZeeTAI4eNb3tEYJ/Sx2MspD5eOy8ybdt5kHkqf9THKNNkuTEobh4N16nEMD
         9KgLVu5/kL9DKTMoAslNcjyBG4jTkSJGsCAhgvq0LqB3jF8VGnHyKANZU5lD/7NmkhaO
         87WA==
X-Gm-Message-State: AOJu0Yw14cFv5HzE1WX2B8pxqzYs6VT2PriVj5S6m8HUYo6OowIU79+p
	HqQTx5GEnMIPdGZsEAB61abFvHGc0wRERs5e3L4CYg0dstPS4oZjCwDrqJ3wBUI=
X-Gm-Gg: ASbGncvkIVWHWIctkZApYJFIKutxXUH1kh+h/j4+8awjzP1x++ITTJvBxkIgv7HXkxx
	iAkD9y+3hfdjkR8PMAImTqJDDujrZa2kXUOCxvLCg/d2W5n2vS6SMSExTnX8tcLh1FdfCKIIOWS
	3XXOUTNj0DH0pvp3T1rcidS/Hyw54CwNnMjLDBRkPaAmfFrN0QphQg9Z8mI/FZWewThEr2+slF7
	vBpCiFE43K5X4jCVHS06l/Pdlz4NlNgYq3QTAJRXcz11PTYeRzqMnWZ4Wy0bQkUhhSJZk0JBq41
	2HcxsKmQLZvZ8Sr9yvSv7qHSB5KnrjrIeNuRBvqZpznXeh2D2jXJbGuKCrDTbNue9HDzO+sfx6v
	dm/hsiQ==
X-Google-Smtp-Source: AGHT+IGGkuUxWnEoYVj0GSv651HpNCsSicy5MOntbO86Xo7S0HylEQmWkwHj9dNvddGO0dSsMl1fyw==
X-Received: by 2002:a05:6000:40c9:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39eaaec9f18mr8701015f8f.56.1744630523245;
        Mon, 14 Apr 2025 04:35:23 -0700 (PDT)
Message-ID: <d68aacb7-b192-4baf-8d03-042ca5236838@citrix.com>
Date: Mon, 14 Apr 2025 12:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Shrink the rootfs substantially
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-5-andrew.cooper3@citrix.com>
 <Z_zwnpmO_6VLwoMM@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_zwnpmO_6VLwoMM@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 12:25 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Apr 14, 2025 at 11:18:40AM +0100, Andrew Cooper wrote:
>> bash, busybox, musl and zlib are all in the base container.
>>
>> python3 and ncurses are in principle used by bits of Xen, but not in anything
>> we test in CI.  argp-standlone, curl, dbus, libfdt, libgcc and sudo aren't
>> used at all (for x86 at least).
>>
>> libbz2 and libuuid were pulled in transitively before, and need to be included
>> explicitly now.
>>
>> Use apk --no-cache to avoid keeping a ~2M package index on disk.
>>
>> Remove the modules scan on boot.  We don't have or build any.  This removes a
>> chunk of warnings on boot.
> Strictly speaking there is xen-argo.ko, but that's handled manually
> anyway, so probably not worth mentioning.

Hmm, it's an awkward way around in the series, but yes.  The lack of
doing any of the normal module work in the kernel build is what causes
xen-argo.ko to be more special than I'd like.

>
>> This shrinks the rootfs from ~30M down to ~8M.
>>
>> No practical change.
> This also adds some preparation (the case on `uname -m`) for ARM64
> rootfs, would be nice to mention it too. Especially since libfdt removed
> here will be re-added for ARM.

"Factor out some x86-isms in preparation for ARM64 support."

>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>  scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
>>  1 file changed, 34 insertions(+), 26 deletions(-)
>>
>> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
>> index 75e2f8648ce5..72c29e0a0a13 100755
>> --- a/scripts/alpine-rootfs.sh
>> +++ b/scripts/alpine-rootfs.sh
>> @@ -4,33 +4,42 @@ set -eu
>>  
>>  WORKDIR="${PWD}"
>>  COPYDIR="${WORKDIR}/binaries"
>> +UNAME=$(uname -m)
>>  
>> -apk update
>> +apk --no-cache update
> This is no-op, no? IIUC the only thing `apk update` does is updating the
> cache, which you disabled...

Lovely.  This ought to be upgrade, so we pull in updates to the packages
in the base image.

~Andrew

