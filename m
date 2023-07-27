Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34299766312
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 06:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571279.894875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPEzR-00058U-1h; Fri, 28 Jul 2023 04:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571279.894875; Fri, 28 Jul 2023 04:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPEzQ-00055s-Uj; Fri, 28 Jul 2023 04:22:08 +0000
Received: by outflank-mailman (input) for mailman id 571279;
 Thu, 27 Jul 2023 21:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw2A=DN=flex--justinstitt.bounces.google.com=3XefCZAsKCWQLWUVKPUVKVVIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@srs-se1.protection.inumbo.net>)
 id 1qP8vQ-0003bb-Dm
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:53:36 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087fff66-2cc8-11ee-b24b-6b7b168915f2;
 Thu, 27 Jul 2023 23:53:35 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-c5fc972760eso1248006276.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 14:53:35 -0700 (PDT)
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
X-Inumbo-ID: 087fff66-2cc8-11ee-b24b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690494814; x=1691099614;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+IrV9GMRSdZPt30c7KcILm3qep9zKx/623+6CGNnSZI=;
        b=YRH0RandNbmWOsNbix1juf2j32ITK9Uvj67kgr3R72979X637zKHH8KZguOPLopzPy
         fjkQbcWwTfMo1Hqb4p+zc/kFemN21RJ6rTyJtcMQ/oEKwjHKIFtmzqeJZgnBmRq/79FF
         Q1T9puk7xzNEdjIV/igXmV4UFIlev2+Onajgaupn8iFIWwD+LDMaU7Rqh6Y/qZ8WNZcQ
         EbYgsmXlOOtwiPgFmIy/5TsvUTsSImKFRVPRiBPAtXKPd4wWKkCURJYYWadAtcEjnXsQ
         ZCgI9IcqtCntKz8lcvSlVTtTRikw2cRxyKs3v6SBQpDYBNM+kCas8jJKyEbxblWbQEXw
         lu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690494814; x=1691099614;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IrV9GMRSdZPt30c7KcILm3qep9zKx/623+6CGNnSZI=;
        b=FFcSujkn3H7nGkY48J+jHwvb9wOcV7uYmCHd2RFKA8C747JONnns6Nd50K2wMiwrQS
         OVP1WP0Ob+Rbh/abO8ekwDyIfjYxVhHbkv42BDiEaQHK3eUj1lP7riNjZFzaT5/ZCcyn
         0papD8EFAYDpik3ChmsAl80fYgkFSx45FoaXToj3alxNPkCbK7DcIggI4zL0ZGuX0Eqi
         A5xNPHKSLeKR576Ofbc+sLuBgPz+YpzTNK0GaitDG0LaT9e/jjE9ys0GQyEcbfDS7ILg
         5VGuZeEuRViaQ4ddj8kRxUz+HoWO4AFtW1hZLmzRJpttDPeQYa5pnMePSg13iXi0HvhT
         3+Gw==
X-Gm-Message-State: ABy/qLZFcL4WoYaPw+lL73kWxghaWLlSCFa5KiN5QfWiv3WD3tYkjnV/
	RKGdsA+1uL4YprOPyJQYWfZZ/orJPiXpX7O8UA==
X-Google-Smtp-Source: APBJJlHXF3DAQ7oQ2+0tdvzkYP1VoY7GsOUMjOE+/Vdzmdw/tfkvYZ+dZ1a3XDRmAV0OnKJAbEafFAFp/DwKM5StMA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:ab13:0:b0:cfe:74cf:e61a with SMTP
 id u19-20020a25ab13000000b00cfe74cfe61amr4397ybi.6.1690494813865; Thu, 27 Jul
 2023 14:53:33 -0700 (PDT)
Date: Thu, 27 Jul 2023 21:53:24 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFPnwmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDcyNz3eL80rwU3YrUPF1jS4tkS0sj8yTjFAsloPqCotS0zAqwWdGxtbU AfC3LdVsAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690494812; l=3106;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=2DV18A5LAIbHOz8+4mF5Dz/H6ijYF+f0DqJHiw+O6Z8=; b=vopO06Wm0zYSnDpTC9r5I+EsMsCZYRVtZWxLb5Dfivdpz4dFnQc4/MROOoOi/9uBOTysUrbZO
 B8mJVXUSQDcCy59jXa+eGsPlPBt2oonSrkqDfkKPfBHRnmLmfyW1zgm
X-Mailer: b4 0.12.3
Message-ID: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
Subject: [PATCH] ALSA: xen-front: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, 
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ always the case for `strncpy`!

It should be noted that, in this case, the destination buffer has a
length strictly greater than the source string. Moreover, the source
string is NUL-terminated (and so is the destination) which means there
was no real bug happening here. Nonetheless, this patch would get us one
step closer to eliminating the `strncpy` API in the kernel, as its use
is too ambiguous. We need to favor less ambiguous replacements such as:
strscpy, strscpy_pad, strtomem and strtomem_pad (amongst others).

Technically, my patch yields subtly different behavior. The original
implementation with `strncpy` would fill the entire destination buffer
with null bytes [3] while `strscpy` will leave the junk, uninitialized
bytes trailing after the _mandatory_ NUL-termination. So, if somehow
`pcm->name` or `card->driver/shortname/longname` require this
NUL-padding behavior then `strscpy_pad` should be used. My
interpretation, though, is that the aforementioned fields are just fine
as NUL-terminated strings. Please correct my assumptions if needed and
I'll send in a v2.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
[3]: https://linux.die.net/man/3/strncpy

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/xen/xen_snd_front_alsa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index db917453a473..7a3dfce97c15 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -783,7 +783,7 @@ static int new_pcm_instance(struct xen_snd_front_card_info *card_info,
 	pcm->info_flags = 0;
 	/* we want to handle all PCM operations in non-atomic context */
 	pcm->nonatomic = true;
-	strncpy(pcm->name, "Virtual card PCM", sizeof(pcm->name));
+	strscpy(pcm->name, "Virtual card PCM", sizeof(pcm->name));
 
 	if (instance_cfg->num_streams_pb)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -835,9 +835,9 @@ int xen_snd_front_alsa_init(struct xen_snd_front_info *front_info)
 			goto fail;
 	}
 
-	strncpy(card->driver, XENSND_DRIVER_NAME, sizeof(card->driver));
-	strncpy(card->shortname, cfg->name_short, sizeof(card->shortname));
-	strncpy(card->longname, cfg->name_long, sizeof(card->longname));
+	strscpy(card->driver, XENSND_DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->shortname, cfg->name_short, sizeof(card->shortname));
+	strscpy(card->longname, cfg->name_long, sizeof(card->longname));
 
 	ret = snd_card_register(card);
 	if (ret < 0)

---
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
change-id: 20230727-sound-xen-398c9927b3d8

Best regards,
--
Justin Stitt <justinstitt@google.com>


