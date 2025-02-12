Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924AA32B26
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886569.1296210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFHP-000055-4B; Wed, 12 Feb 2025 16:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886569.1296210; Wed, 12 Feb 2025 16:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFHP-0008Uq-0t; Wed, 12 Feb 2025 16:08:03 +0000
Received: by outflank-mailman (input) for mailman id 886569;
 Wed, 12 Feb 2025 16:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFHN-0008Uk-N9
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:08:01 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87620151-e95b-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 17:07:59 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5450cc1669eso3143894e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:07:59 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54502a4efa2sm1498367e87.195.2025.02.12.08.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:07:57 -0800 (PST)
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
X-Inumbo-ID: 87620151-e95b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376479; x=1739981279; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SafShQb/+Zot3C1SV9vTHm2HPGULg8fweX5eQhSvIYI=;
        b=NC5B7wJL7HjFPFrbsyhr7q+Q388lIq+U4dHLHSyhTyr8PqxmAreeBmgiAPhzcK8lxm
         q4/P1oEj5324tTzL/5htB8mIYrl+AAfP7sEfCJLSyLucSJybfHewlwR7g3IxF49gr/eo
         /Ox37XUp49DUXJcTM6SYGJWpNOR8FSIOIeFtYrq2IzHHTBWgz2jQdtsHsLYGWZUNbZTY
         MstHl9O3PUxyOca76duK9jT0EoK7aLfqph9hvVvijzion+vij7EPgXZsFIyvsEukBoO9
         OdCH05EdlcnGOiMaFisqZ8+JDJ2CS7o4jmr7+59HvYTHmP2PG99aRpSRZsSAm+WAb9FO
         mKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376479; x=1739981279;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SafShQb/+Zot3C1SV9vTHm2HPGULg8fweX5eQhSvIYI=;
        b=iDT1Or20bk51NlbV9jDIAhyGnIWqJORtvlVUTLA+AOQbnz0R2oaL5ZYdOGtG8RjOGN
         hFlkmiOCPE8EMyToXhRvqJJYbUquyzH9xzIrmETEaMC1FmTO8pss2g1Lxxsc+coGFVCk
         Qd5InJ5J43Q0okYFCk1huZTRfCXtAqd69b2ml+cEscq/JVGoMtkUe5F3fAO6jL5PK4sW
         KztEiWx60osJ33mt68p8tvPrn4B4JKDKuBJrvk7/a9EISFBzuI1oj81tzY1FQX2M9rD3
         GgUZqC1weWy/xXGpaoDVI71vSEK5GmHzbOMVESu8qB3x8w36OKCFnuPNuN4u3iF+UxGh
         wErQ==
X-Gm-Message-State: AOJu0YzOtNEzrp+RmYveolVYKJlXh1wB1gIxshRo8YD3z1P37YHBdl3b
	3lHyDtd5XbSx0PkP99ZLj0pTEqaNQIjnC4fJsJUh/RYLR1EqqBAP7FB/yA==
X-Gm-Gg: ASbGncv7HFIWuhQ/kKgdBGpPp4L5CSkm7xZjJUyD5a6wQGzu3ys6NH1O2+2KQejdp9E
	BEEhTUFMirSP/7CYewYvNV87qLRFsKAl2ivf1cvYtx6WCH/RJ5BwPizlVl28HpPCpRhetttwz30
	x4bckxJ37Po0zBtptT7vN8iMYUNWVbTG8vCbPY7QYUJ2oFGYjzHMZJ6/9L8EKeImYqcYmizI8KI
	xmZ9R6FuIJEI71CB6bmrNGI6fX0njSgBeDoeFvhZvxq6tDPofqFpKN5zlv1qu5HHmM4sd9r3rVL
	8pAqKKmBjl90hLNOoY3df2n5lgw=
X-Google-Smtp-Source: AGHT+IF9XSP7mq3qhZazJnBFSLV9T+m+eLpj+oKmpap4UjgBpQ/pzsiZxkedhSW9hC6daaQfnWjRaQ==
X-Received: by 2002:a05:6512:3b97:b0:545:102f:87a4 with SMTP id 2adb3069b0e04-5451810d0admr1380536e87.17.1739376478198;
        Wed, 12 Feb 2025 08:07:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------NPc0QU0lnmeR6UpaoKHEGLL3"
Message-ID: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
Date: Wed, 12 Feb 2025 17:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [BUG?] Wrong RC reported during 'make install'

This is a multi-part message in MIME format.
--------------NPc0QU0lnmeR6UpaoKHEGLL3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

During the installation of Xen on an ARM server machine from the source code,
I found that the wrong release candidate (rc) is being used:
   $ make install
     install -m0644 -p xen //boot/xen-4.20-rc
     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied
     make[1]: *** [Makefile:507: _install] Error 1
My expectation is that it should be xen-4.20-rc4.

I'm not sure if this behavior is intentional or if users are expected to set
the|XEN_VENDORVERSION| variable manually to ensure the correct release
candidate number.

In my opinion, we should set the proper release candidate number after
"xen-4.20-rc" automatically.

Does anyone have any thoughts or suggestions on how to resolve this issue?

Thanks in advance.

Best regards,
  Oleksii




--------------NPc0QU0lnmeR6UpaoKHEGLL3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="0" data-end="17">Hello everyone,

During the installation of Xen on an ARM server machine from the source code,
I found that the wrong release candidate (rc) is being used:
  $ make install  
    install -m0644 -p xen //boot/xen-4.20-rc  
    install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
    make[1]: *** [Makefile:507: _install] Error 1
My expectation is that it should be xen-4.20-rc4.

I'm not sure if this behavior is intentional or if users are expected to set
the <code data-start="426" data-end="445">XEN_VENDORVERSION</code> variable manually to ensure the correct release
candidate number.</pre>
    <pre data-start="515" data-end="616">In my opinion, we should set the proper release candidate number after
"xen-4.20-rc" automatically.</pre>
    <pre data-start="618" data-end="694">Does anyone have any thoughts or suggestions on how to resolve this issue?
</pre>
    <pre data-start="696" data-end="716">Thanks in advance.
</pre>
    <pre data-start="718" data-end="741" data-is-last-node="">Best regards,
 Oleksii</pre>
    <pre>

</pre>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------NPc0QU0lnmeR6UpaoKHEGLL3--

