Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02232137D6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:42:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrICY-0000Gh-8T; Fri, 03 Jul 2020 09:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bw0N=AO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jrICW-0000Fy-HZ
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:41:44 +0000
X-Inumbo-ID: 673d4cf4-bd11-11ea-8496-bc764e2007e4
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 673d4cf4-bd11-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 09:41:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p20so33481400ejd.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=RNt2cEIZBE61z29DbiD6gBhjcmDmLxOEByV7tgW2TTo=;
 b=TmIdnnMyaI6pFf86S7Dwrh2DA0pTIAwm0Cbtg+lj/sEabkGbDP+SMlPutplrvOo9df
 C3HMoau5QJO26ldZbj3tBdP/AxGK0UdweiDdMuQ4BrLKQw8+UCNdIGzMadYpZZmEO2Qk
 NNdLYwRPSfBV7mdfHsafPmiR+RqyvysCrTkpsOuTSCwOq0xkIzMEtI+GJ8yyi7A8QeYC
 s543UJ/nLaawEPwSzN7bqvty25udJLxobqiYEj8c9Z+bd2b1pOd80DQNuccK8zrAEU2h
 XhRWos3a9gvnqpMRwhTclycFeaWwSIvnnIoGvfUQR36lF++8vaDfiwD10TZ8FyUfjnGM
 vqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=RNt2cEIZBE61z29DbiD6gBhjcmDmLxOEByV7tgW2TTo=;
 b=p38L6MCslosnLW6/mSczqOJ8uJEmH4iC6VFmiE1/eXISzduw0gl8l+syAV42NGHMVj
 ovVx7Yux1/C/kVbNLqA74Zfv4chE0lspDoFSv+/fEUDHB4BZAC1iCl9etuyVDv9tfpLt
 SFkr+bB3laJWBUV2VPSnk64zlF61sbA1zWGykyD16PAEuvXGpSKxIN0jWbCAK6rznui/
 4ye1JEzSmaebAV1oqWXrWz1gf0RzjieyREjaEGduemOVp/7+1DrhwjlSSA6e+NlUzfLx
 eVLWktvNpPGMOYWKYZRXYDdTexhfiOen0AWA10l17bmvFcveZutP2K07wf4cbfuvzMk9
 s0jQ==
X-Gm-Message-State: AOAM532ExuytCwHXTKDiYUAPVySc4bwvmBXkShGltW0XxCt9c5OhVGXc
 ipz55u+LmUgWLhUc0zdDqow/oi8NNq8=
X-Google-Smtp-Source: ABdhPJzmeWZ6UCbMItNclRAj1PpClddxgIG2zJa6m3mumrbPwRXOH3YcQ4GkKKyelOJPa6aXG3Wdsw==
X-Received: by 2002:a17:906:7a46:: with SMTP id
 i6mr30218342ejo.475.1593769302913; 
 Fri, 03 Jul 2020 02:41:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id s23sm9316419ejz.53.2020.07.03.02.41.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 02:41:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Michael Young'" <m.a.young@durham.ac.uk>,
 <xen-devel@lists.xenproject.org>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
In-Reply-To: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
Subject: RE: Build problems in kdd.c with xen-4.14.0-rc4 
Date: Fri, 3 Jul 2020 10:41:41 +0100
Message-ID: <004601d6511e$28673710$7935a530$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJDTGpxOkTL6sslt6TCRsF6oIyh1qgbo0Cg
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Michael Young
> Sent: 30 June 2020 23:22
> To: xen-devel@lists.xenproject.org
> Cc: Tim Deegan <tim@xen.org>
> Subject: Build problems in kdd.c with xen-4.14.0-rc4
> 
> I get the following errors when trying to build xen-4.14.0-rc4
> 
> kdd.c: In function 'kdd_tx':
> kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
> char[16]'} [-Werror=array-bounds]
>    754 |         s->txb[len++] = 0xaa;
>        |         ~~~~~~^~~~~~~
> kdd.c:82:17: note: while referencing 'txb'
>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
>        |                 ^~~
> kdd.c: In function 'kdd_break':
> kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
> char[16]'} [-Werror=array-bounds]
>    819 |             s->txb[sizeof (kdd_hdr) + i] = i;
>        |             ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
> kdd.c:82:17: note: while referencing 'txb'
>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
>        |                 ^~~
> In file included from /usr/include/stdio.h:867,
>                   from kdd.c:36:
> In function 'vsnprintf',
>      inlined from 'kdd_send_string' at kdd.c:791:11:
> /usr/include/bits/stdio2.h:80:10: error: '__builtin___vsnprintf_chk' specified bound 65519 exceeds
> destination size 0 [-Werror=stringop-overflow=]
>     80 |   return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     81 |         __bos (__s), __fmt, __ap);
>        |         ~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[4]: *** [/builddir/build/BUILD/xen-4.14.0-rc4/tools/debugger/kdd/../../../tools/Rules.mk:216:
> kdd.o] Error 1
> 
> The first two array-bounds errors seem to be a result of the
> 
> kdd: stop using [0] arrays to access packet contents
> 
> patch at
> http://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=3471cafbdda35eacf04670881dd2aee2558b4f08
> 
> which reduced the size of txb from
> sizeof (kdd_hdr) + 65536
> to
> sizeof (kdd_hdr)
> which means the code now tries to write beyond the end of txb in both
> cases.
> 

Sorry not to get back to you sooner. Which compiler are you using?

  Paul

>  	Michael Young



