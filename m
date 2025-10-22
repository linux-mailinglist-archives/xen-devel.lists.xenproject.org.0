Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42741BFCA58
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148284.1480409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBa8s-00053g-0S; Wed, 22 Oct 2025 14:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148284.1480409; Wed, 22 Oct 2025 14:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBa8r-000525-Tw; Wed, 22 Oct 2025 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1148284;
 Wed, 22 Oct 2025 14:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZjTz=47=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vBa8q-00051Z-KX
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:48:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 329c126e-af56-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 16:48:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso1332082966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:48:40 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d36b0eba4sm152096566b.47.2025.10.22.07.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:48:38 -0700 (PDT)
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
X-Inumbo-ID: 329c126e-af56-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144519; x=1761749319; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RysLH4Z6/v7Zc7nVBXq2y7fwG9r6bT2HCxe4AkVI1YI=;
        b=X/q4x4EOQiJqv05Xzxi+Ve8NH4lVQgLMBt8nlfiRccHVS7IcoV7OdRylrQkTchGCIg
         WDxVO/HrrzBuTjb7zhXLs9xOVTgECvV1QG77w4vEbfq45andauO0r1wmFKSvOtgzSnjQ
         dEl4KllrsVC316ShchF0s1TXjvbzbrXXkmYIo+RonjD4K4iNGchIA/RjTF4cMYmeynvd
         c+yN0YDvulc2VTeFuhohxQxk4yf9LdFu/dO426oINysUEiOgRKQ3fCBTkYfxc9mDBZtb
         wwuEmwYGtvfQf2aEhRi3CJfqC4ELlPADbVHzMEZbgI7/HB77Uu+v99EYa7kUPOyMYErE
         s35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144519; x=1761749319;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RysLH4Z6/v7Zc7nVBXq2y7fwG9r6bT2HCxe4AkVI1YI=;
        b=fQBk6QvyHNThxyNttoWCuzIUsnlPBLcrk3OAeM/WCjuKitrkViUd6Q9Gt1sL1oIwSZ
         5cW+GwZyuuM9ww58k/YTBHBmbflyf00jI4VwgDm/LPMu6WfuqwMpbUNwfqmp44seMP08
         RHOLG40SUY9B1TfJoSgRMJwIoSxA+1J9s7b2s2ANr8Vff+9SMkoEpQ9+004W/oiigcri
         ZBB7GoChmzhGdpKDIJhye+eRcg1mHkeHP+yz5+OOZFFKrMJpc1tqWRnLWqO8VRpUei1b
         eSIW0TbUC5Ga12jWALsIBZmKfpNipxrlbifqeAzJ5yK5MMH+llMQ9jbO3OwQx2aZOM00
         b9YQ==
X-Gm-Message-State: AOJu0Yxh4rNolnRuRzFih9rxrFbBKdeP7VdbPxKcf1sxJ6jvPTof5ZWK
	ynQFK9sU4xHoLjHezidzgbnBG6m9/KnzUaTeX5El3UWS8jf7YPQzb8r+4Ij/Ag==
X-Gm-Gg: ASbGnct4mRjn3qhEcgzPCh8+/JoOhTCkktyzRfcifN598rkF+vE6wP1LVbGX/Nn7CLQ
	E8xXll83oj7BYl1HnY8YuI9yx5DWEJzT+9zK8TZ5QDXHbL8UnErZKjys3RmYP5H0FdJet0lZbiK
	gjAQ3/M2oU8yfYZAeVzwcGhFEAanrptUpwAjRwNNzZBVXjyRjmAscOKhtdboEPOP1Fis3YYQJw0
	Fy32BX0tGOLMKYzPjHTgAfVor5eJTqUJeehJ17goAF33a4khXmOi5dU72+0DBUvOrCBXjCjGraC
	HoxeWaCxf27adNB8KF68DndFrBhmWyrUTYbzS8WESlgD9OoU+5XVPRfGm/Pjtkit/Xe9PcveLH/
	ZbqtmGBJrHBRvZU+Zf2I5wBAylEXKnjV/tdY1YmwUTAN/H3ujrscEZuBTfGaGBN2hP27gS/nm4/
	oPiyW+tSQRmVIyZCpdEnv6DOJjd7ywXZb7+6HLILUOSnGYD7Hrsy1rnQMS
X-Google-Smtp-Source: AGHT+IHeFtW+4R8CQlGr5XX/R95uUw1wMnDxOuiAiKXvRtGrjMENC96vZsZBfQ7k+xUZZCBV7IIpVw==
X-Received: by 2002:a17:906:fd87:b0:b07:c5b1:b129 with SMTP id a640c23a62f3a-b647195b8c3mr2686811266b.1.1761144519101;
        Wed, 22 Oct 2025 07:48:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QYI6grCkYridlXYS03aYmntk"
Message-ID: <e8788d97-70c4-4f95-ad1d-05d5e27df3f9@gmail.com>
Date: Wed, 22 Oct 2025 16:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.21.0-rc2 is tagged

This is a multi-part message in MIME format.
--------------QYI6grCkYridlXYS03aYmntk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Xen 4.21 rc2 is tagged. You can check that out from xen.git: 
git://xenbits.xen.org/xen.git 4.21.0-rc2

For your convenience there is also a tarball and the signature at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz

And the signature is at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig

Have a nice week!

~ Oleksii



--------------QYI6grCkYridlXYS03aYmntk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-text-html" lang="x-unicode">
      <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hello everyone,

<span class="q"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">Xen 4.21 rc2 is tagged. You can check that out from xen.git:
</span><span class="q"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">  git://xenbits.xen.org/xen.git 4.21.0-rc2</span>

For your convenience there is also a tarball and the signature at:
  <a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz">https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz</a>

And the signature is at:
  <a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig">https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig</a>

Have a nice week!

~ Oleksii</pre>
      <p><br>
      </p>
    </div>
    <p><br>
    </p>
  </body>
</html>

--------------QYI6grCkYridlXYS03aYmntk--

