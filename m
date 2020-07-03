Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC92138AD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 12:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrJ1d-0004yE-1q; Fri, 03 Jul 2020 10:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bw0N=AO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jrJ1b-0004y9-71
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 10:34:31 +0000
X-Inumbo-ID: c6bb7dd4-bd18-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6bb7dd4-bd18-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 10:34:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f7so29109378wrw.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rIYyG9fTWCUmdeGoBgnk41cUwWAC9W1MLe1N4MjMJwU=;
 b=q07rg2AJH0YG1jBUsr4iBewNGX9yewxALXbz6vAAkaN7g2+ntVrLc9y6N+tiRcY1lR
 TbbW5aAY6jTbU0vWoJ/9OVZHD0laZZs1exioKIEHHLvAPlnP7zRoyG2mi4pYzUvWHUpp
 G0cEUwEoE4ybJbKBD7o7Dgi0z4vQoOeHifU+N72BgA8w7KR2djqw+GB74dJC8sWUbEvL
 eP188/hDKQc8gx+0d/M1ZOKraE5CW8FfUE6fzeOGwQcH/LcpOWZTo0JIaKn09+yZvNN1
 CGUnVXrI7aAnovTpC48sBKzPg5bhU33wWj8oydX3MPBVcEdoDEwtrOClQs1gD5+Zwy2e
 g0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=rIYyG9fTWCUmdeGoBgnk41cUwWAC9W1MLe1N4MjMJwU=;
 b=k+d2YfrUFDSauDdzafucrj7TXrJ1KYxGFTySoQZYr50Cv5oyB8IE5+ThKugrfvWhss
 LUDHBmhoYHrPZfcolCwvRzcOt5pw6VcYjPv5z2niYS/Mrzi7vK24PDQTDHQLTP+XptPt
 KFWuyeINWhi+SBMZgOaGyZHAGkWC9dc7e3FoOn1HeXvPbiSQofI5HlKNU1p6wL3pVqx7
 B6eVJpMcMhAYnbBPoR9SoplQbbeaRkZWIc22dr4ID/RgV6YDFTf+BL8ZDRAIS+ms1ZBe
 HIPMqa5oIc6VJ1ftXK6TTRcT1cgyJl4kNHjVkxMDBkWlFC/1DmaEWBItD6pkPgk9NOsK
 fGCA==
X-Gm-Message-State: AOAM530vExctEn+wuzeSnJSHg1YdZUgBa08BNQIUurfu7o+oBFZ39cYA
 9p54HjPPoK7q/iJBFPy6JPo=
X-Google-Smtp-Source: ABdhPJy7b4aYqgAYm0HnXDsTLnGxF/Vf1bbX98WZU8rAoyIR5RKYEskmROzKKrjI3ZiHLIL+kGfWLQ==
X-Received: by 2002:adf:db09:: with SMTP id s9mr35197367wri.256.1593772469554; 
 Fri, 03 Jul 2020 03:34:29 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y7sm13427934wrt.11.2020.07.03.03.34.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 03:34:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Michael Young'" <m.a.young@durham.ac.uk>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
 <004601d6511e$28673710$7935a530$@xen.org>
 <alpine.LFD.2.22.394.2007031044330.1956@austen3.home>
In-Reply-To: <alpine.LFD.2.22.394.2007031044330.1956@austen3.home>
Subject: RE: Build problems in kdd.c with xen-4.14.0-rc4 
Date: Fri, 3 Jul 2020 11:34:28 +0100
Message-ID: <004701d65125$87f4de60$97de9b20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJDTGpxOkTL6sslt6TCRsF6oIyh1gHgYS1gAmIf6man+Z3lQA==
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
Cc: xen-devel@lists.xenproject.org, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Michael Young <m.a.young@durham.ac.uk>
> Sent: 03 July 2020 10:49
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Tim Deegan' <tim@xen.org>
> Subject: RE: Build problems in kdd.c with xen-4.14.0-rc4
> 
> On Fri, 3 Jul 2020, Paul Durrant wrote:
> 
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Michael Young
> >> Sent: 30 June 2020 23:22
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Tim Deegan <tim@xen.org>
> >> Subject: Build problems in kdd.c with xen-4.14.0-rc4
> >>
> >> I get the following errors when trying to build xen-4.14.0-rc4
> >>
> >> kdd.c: In function 'kdd_tx':
> >> kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
> >> char[16]'} [-Werror=array-bounds]
> >>    754 |         s->txb[len++] = 0xaa;
> >>        |         ~~~~~~^~~~~~~
> >> kdd.c:82:17: note: while referencing 'txb'
> >>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> >>        |                 ^~~
> >> kdd.c: In function 'kdd_break':
> >> kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned
> >> char[16]'} [-Werror=array-bounds]
> >>    819 |             s->txb[sizeof (kdd_hdr) + i] = i;
> >>        |             ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
> >> kdd.c:82:17: note: while referencing 'txb'
> >>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
> >>        |                 ^~~
> >> In file included from /usr/include/stdio.h:867,
> >>                   from kdd.c:36:
> >> In function 'vsnprintf',
> >>      inlined from 'kdd_send_string' at kdd.c:791:11:
> >> /usr/include/bits/stdio2.h:80:10: error: '__builtin___vsnprintf_chk' specified bound 65519 exceeds
> >> destination size 0 [-Werror=stringop-overflow=]
> >>     80 |   return __builtin___vsnprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
> >>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>     81 |         __bos (__s), __fmt, __ap);
> >>        |         ~~~~~~~~~~~~~~~~~~~~~~~~~
> >> cc1: all warnings being treated as errors
> >> make[4]: *** [/builddir/build/BUILD/xen-4.14.0-rc4/tools/debugger/kdd/../../../tools/Rules.mk:216:
> >> kdd.o] Error 1
> >>
> >> The first two array-bounds errors seem to be a result of the
> >>
> >> kdd: stop using [0] arrays to access packet contents
> >>
> >> patch at
> >> http://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=3471cafbdda35eacf04670881dd2aee2558b4f08
> >>
> >> which reduced the size of txb from
> >> sizeof (kdd_hdr) + 65536
> >> to
> >> sizeof (kdd_hdr)
> >> which means the code now tries to write beyond the end of txb in both
> >> cases.
> >>
> >
> > Sorry not to get back to you sooner. Which compiler are you using?
> >
> >  Paul
> 
> This was with gcc-10.1.1-1.fc32.x86_64
> Full build logs are (at the moment) at
> https://download.copr.fedorainfracloud.org/results/myoung/xentest/fedora-32-x86_64/01515056-xen/
> 

Ok, I have an older compiler. Does this patch fix it for you?

---8<---
diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index 866532f0c7..a7d0976ea4 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -79,11 +79,11 @@ typedef struct {
 /* State of the debugger stub */
 typedef struct {
     union {
-        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
         kdd_pkt txp;                 /* Also readable as a packet structure */
     };
     union {
-        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
+        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
         kdd_pkt rxp;                 /* Also readable as a packet structure */
     };
     unsigned int cur;       /* Offset into rx where we'll put the next byte */
---8<---

  Paul

>  	Michael Young


