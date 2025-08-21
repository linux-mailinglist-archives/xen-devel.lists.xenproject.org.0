Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F9AB2F7DC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088626.1446360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4Ls-000199-7n; Thu, 21 Aug 2025 12:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088626.1446360; Thu, 21 Aug 2025 12:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4Ls-000160-4q; Thu, 21 Aug 2025 12:25:08 +0000
Received: by outflank-mailman (input) for mailman id 1088626;
 Thu, 21 Aug 2025 12:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up4Lr-00014a-0v
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:25:07 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de6ff5fd-7e89-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 14:25:05 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9e41669d6so751759f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 05:25:05 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c07778939bsm10994365f8f.46.2025.08.21.05.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 05:25:04 -0700 (PDT)
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
X-Inumbo-ID: de6ff5fd-7e89-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755779105; x=1756383905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iHpgV8l84GfDrObZ+854z4EHYYT49r7YRN/XIy5sKU8=;
        b=KW8rRES1baeV/FrIDwSpy0OL8dqe5pQrx5Hv6bvJ2Wv9sJBFIfVdbKduHuFTBUAtbc
         3X2kKceS24/shc8qFwsMNT4cbbr/a3fOsPLrr0Q3Pk1lb5nUvA1pYbKavGPI8kjrWjcy
         6hetygXt9CXWuq6cb00d+g/R3WNZLm5xtfDy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779105; x=1756383905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHpgV8l84GfDrObZ+854z4EHYYT49r7YRN/XIy5sKU8=;
        b=he+wAKadNptvixjxgNEDatSBuht+/QJn/ODdCb9mjKhlYbz3DWCzys/yKl5yLbod5f
         mTzRh8o94xyGvJxQyzkQbPZ0pNr/7pZaNg+bSV45ldBPBTjon3oqFxgTMCdjcXoB39fh
         KLv9w+DOAZy9D19Evcqk18ZEZFmdnKgfeCQpc+V2HwJz0dsqRDUywIas8fcDF7d1nBTn
         OPsquqja6x/q7k6O5hk17qmg7FD6SJYhktJTh3EJPzYauL0mCnlLUoZYYPtuGpoRjC+J
         XCj8mYhXSHl+PkUhe5pigEBISK7mRJ4s2Xc6Ukva1qnOZfB7PxOEpyyyCwO0ufJMgsYf
         vm/g==
X-Gm-Message-State: AOJu0YxUIBCwwtfx1kSDaG9zy2uuJihLn7OcBSCg/UVkwJJbo/DXsQIt
	bHmn+qJ1lWuVywQVX7OdAY6+InqeHfOamzcwU2B+m3KI/ByHYTzB79aUHUoOeHbxlkY=
X-Gm-Gg: ASbGncufmItfC2ZSUHbZXYCpRvrwwsUL4IG5tXQuq9N3WSqykM+/2+EPRuXA6gTfiZm
	4Lpv8x6CK6AQAgk68l6oXMTavEHv+oysAikXFinXQYpPMpEY6hjCbDfAn6tgDLSY1KQfj9ubnvu
	+Ny8DWT7kQ/niRzBQuzr2B/kRUSgPllhUoeeUjnruednfDdPBkBOnuwO1m1cJv2fjuyJsToXlQI
	/O7JJEyog3vB6+wy0MpKhN01V+8kuYHgW35XAoCjonBbM6fXl5eLAHf9Ib7U+f7OXWxQ9iHB4Zw
	mCWgRmXjT+vNQoRayy61S5KW6maO6XIdOJm9Q3RqotEgjtK0WesHrNwHZU9IaIU93Pl29W4XER+
	x2Umq7kCQMz+TFjRR0ijnP9VhT/wcTvs6FCY7YgAgDPl8jIfWcNltmIJJs+MZux8fQ9KMezPAp4
	oQdPk=
X-Google-Smtp-Source: AGHT+IGx6uaqqKqbWdlecin79VLbug4GmWVn0YcaPPrsIb6bmLfhbipirpbzZaOtr0uiMgWS/AJd1g==
X-Received: by 2002:a05:6000:40df:b0:3b7:6828:5f71 with SMTP id ffacd0b85a97d-3c494ed18eemr1582072f8f.9.1755779104742;
        Thu, 21 Aug 2025 05:25:04 -0700 (PDT)
Message-ID: <f7a0800e-b494-4b58-8f6c-80efd721d0b5@citrix.com>
Date: Thu, 21 Aug 2025 13:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Use 'watchdog' for x86 hardware
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <JBeulich@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250821120652.3910926-1-andrew.cooper3@citrix.com>
 <aKcPVSFVxKJJFHrF@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aKcPVSFVxKJJFHrF@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/08/2025 1:21 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 21, 2025 at 01:06:52PM +0100, Andrew Cooper wrote:
>> This detects various hangs and turns them into a crash with backtrace.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Should it also apply to in-QEMU tests?

I doubt QEMU can emulate performance counters.  I certainly wouldn't
trust an emulation which claims to be able to.

>
> Anyway:
>
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks.

~Andrew

