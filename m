Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937772D5DED
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49366.87302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knN23-0005Aj-VG; Thu, 10 Dec 2020 14:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49366.87302; Thu, 10 Dec 2020 14:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knN23-0005AK-Ri; Thu, 10 Dec 2020 14:34:59 +0000
Received: by outflank-mailman (input) for mailman id 49366;
 Thu, 10 Dec 2020 14:34:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knN23-0005AF-3y
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:34:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0a65c9e7-ae9b-4458-b61f-5b29f4cce0d7;
 Thu, 10 Dec 2020 14:34:58 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471--nFxMmSzN_aW3oiKZ3bKuw-1; Thu, 10 Dec 2020 09:34:54 -0500
Received: by mail-wm1-f69.google.com with SMTP id o203so1178186wmo.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:34:54 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9513717wmd.32.2020.12.10.06.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:34:52 -0800 (PST)
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
X-Inumbo-ID: 0a65c9e7-ae9b-4458-b61f-5b29f4cce0d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
	b=ASM9zcx9CytjojQ/FsWJzLgPyYQqaqiKiDg72Z99XluyOMtIhksIlxoLEQfp+ERenk2uxS
	h5AEMlCJSs6LGGkun1H81xastJZJTRgYF/k0seqYJqMFYuxafCr5WWxwIzjc1UUkYk3sZ7
	OlL2kG4+i0H3a120F7ZR/eBhXMZrTNg=
X-MC-Unique: -nFxMmSzN_aW3oiKZ3bKuw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
        b=IEdtZ2/bx8+k3qBSlo39He0BpM35UyqpoKKohNOAedUV201nhpVVnfJ2Mm3JW1SuTG
         eiz/Oz+3ft6gLtgszaFajPr00baKPLVGebjpkysa/SPcLe/NAmAAomzcSTbL45c23EeO
         iyRpLEEJEJecJtgatPGHdkjjSWXc186KX89abxy5uRkMHDfO5npFsympacQP5BzDxGCe
         WWm6Z/lknIEeWjM2ceDxjX0S6e7itDHiOVnMmr8MMCkylLYgLND2KzHvwxM1UF+vtrCT
         rsPs0Za8KGm0aDVyPsyU38hrp+n0otNcoAlBXK0GS3dXcjMOiTwqmaklRa43N+/O2Oo0
         2iAg==
X-Gm-Message-State: AOAM533HwHKRjlHWH7Ta+lX5xv7L3Q8V26WKwh5YYlknb6RkKgCmphLz
	f6iqAgyfSIjd2QDIxT+f+2Cybg4fRJiRTSryLAJEq7Se1x71G9QMLlTq92osFzXgTMOeCeqnYlo
	u9HuDCQEIZIynmR0qUi0BRp5Pk6Y=
X-Received: by 2002:adf:c648:: with SMTP id u8mr8613007wrg.215.1607610893491;
        Thu, 10 Dec 2020 06:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJM5ihYY53/XlfDii2nCk1B/kZHEpNNLEOjXCv2BcF6TABt0f8DkOpZAu5B1naY2xoeGxkTg==
X-Received: by 2002:adf:c648:: with SMTP id u8mr8612994wrg.215.1607610893357;
        Thu, 10 Dec 2020 06:34:53 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
 <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
Date: Thu, 10 Dec 2020 15:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/10/20 3:27 PM, Peter Maydell wrote:
> On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> QEMU requires either GCC or Clang, which both advertize __GNUC__.
>>> Drop MSVC fallback path.
>>>
>>> Note: I intentionally left further cleanups for a later work.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  audio/audio.c | 8 +-------
>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 46578e4a58..d7a00294de 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>>>
>>>  #if defined AUDIO_BREAKPOINT_ON_BUG
>>>  #  if defined HOST_I386
>>> -#    if defined __GNUC__
>>> -        __asm__ ("int3");
>>> -#    elif defined _MSC_VER
>>> -        _asm _emit 0xcc;
>>> -#    else
>>> -        abort ();
>>> -#    endif
>>> +      __asm__ ("int3");
>>
>> This was 15 years ago... Why not simply use abort() today?
> 
> That's what I suggested when I looked at this patch in
> the previous version of the patchset, yes...

Ah, I went back to read v2 thread. Actually I even prefer
Gerd's suggestion to remove this dead code.

Regards,

Phil.


