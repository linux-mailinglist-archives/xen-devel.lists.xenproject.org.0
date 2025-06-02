Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025AACB9C2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003695.1383297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8DN-0002q9-Mu; Mon, 02 Jun 2025 16:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003695.1383297; Mon, 02 Jun 2025 16:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8DN-0002nO-I4; Mon, 02 Jun 2025 16:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1003695;
 Mon, 02 Jun 2025 16:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Suyw=YR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uM8DL-0000r5-SD
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:40:43 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52beb384-3fd0-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 18:40:42 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-604f5691bceso8331506a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 09:40:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7ff25dsm820184266b.23.2025.06.02.09.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 09:40:40 -0700 (PDT)
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
X-Inumbo-ID: 52beb384-3fd0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748882441; x=1749487241; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XOkZmKx8zTwCq0REpLaY9J/as7EWIHf65KSPJyIY2l8=;
        b=mIX/B2CldssnnbpIHaWCUkAqfLBhM4yPoAvIVnPvS9eVk5KnRaz2JY53++7K4SefLV
         DEG3APThfkSxzRVJpXjO8uq3gZCIGmTxIff2GxvWtBlHbBybN8N6PhJ4TYL6VYBcyYTi
         r1avMy7QA37aDN3eUWW9ZaK+d9Ho6/lE7evh5/6wuR5IncmxWIsHMjDHgXHu3f07CewP
         FbYCwwu4T50HHwe2gmolX6xKTrlm0A3GyKbv+hbTys0O4kwuXDY6RG38M6d8jZTtYmM7
         4gHxGUarkYj9QP7OBMRQiw6fseCY0ts3NQDFe+Z542Vx3DQfHdXlBGszD3e1Scf3Q7Yk
         z39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882441; x=1749487241;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOkZmKx8zTwCq0REpLaY9J/as7EWIHf65KSPJyIY2l8=;
        b=cYF7tKoFwoM9CaX80opSDqS+l8mReZ2wU1XnJ1b8d9SG3t/beeZhYWoiCkvnorkT0j
         3HQJVwKN3GkvQQZ5YBtsB3rvvguFfd/R9jdlzO4UMP5alohKt6CczJsAkeBpAQ9VjMbM
         EL3qUzatc+62PPcyqD8WYXrkeLmmmHYgdKHwC01bwZhGdV1hF8bgIUbwirMhjXltRl87
         jhplZIu9PVJpqmhzk1hH0yNAN3zj3SM6ra8zIHC3Hk8L94Vnf42QmZ0gVFwPs87JGnYP
         Z6HWhZHCfcO2GItwe08Xt9NoqiiWDvx4d6v6+j5atMZuLqhysyXpV6Lq1qcl0TEY6fTZ
         +UHQ==
X-Gm-Message-State: AOJu0Yyv3pSP5a4v2AiGf+NRnNvTAj8DH00Fe8szSfJyKtKMox4pYqo1
	oTcYyRFtEUOlF5X9i0hkS/SkirS4LapX1w2WNPe7cWjWZ2QtrpQZZc82UUxKvg==
X-Gm-Gg: ASbGncvH1KCFX9++Z45sWiG5eQPceVpqJRgUrXElYHMvNkCnZFr4oXIeFVYpcH252Qm
	UT21jslIofkF1eL5IwnhKAVGnQFOWPAh9jbZX+jyRZQn5w1vrhYFZJrY1iBZrRhSk5UShBMH4md
	tjxMA/0ISaqXJOiix5q3Yf7UsnROxMglxr2i89aPBnROd0yt45PI9A1C7WH0gYteAI3NNPztLLe
	0RJZdCYmcWAovkkReMvvFFi0dMIuAbwowkw2gUu+5CPN9B1IzsLXLoCntlZJotRwtInZPv/D7RL
	ZUctrAAkftveaDI9EmgUGhSgmFGmAZ4epOW+ZnEQygbw05io2LG7dF+jCvUve714kfISmYBlS5X
	zg75x1jLOfHsEHh3X0tYC6kjlDZmMM2DfnNs=
X-Google-Smtp-Source: AGHT+IHLBUGYE718BADnLJ9/Ho8abkTMJ7ZogAQnrdOAxssdVBBCfo1ip8zw6lsStAohAqZNcnp8/w==
X-Received: by 2002:a17:907:7e96:b0:ad8:85df:865b with SMTP id a640c23a62f3a-adb322fcebbmr1346065066b.33.1748882441154;
        Mon, 02 Jun 2025 09:40:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------TCdXds4BUlSw8kCFfoXdRFBM"
Message-ID: <08d11677-8a2f-4777-b84a-7c909f3a87ce@gmail.com>
Date: Mon, 2 Jun 2025 18:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.21 release schedule

This is a multi-part message in MIME format.
--------------TCdXds4BUlSw8kCFfoXdRFBM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

As there hasn't been any feedback on the proposed timeline shared here:
  https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u

We can proceed with the suggested timeline as the release schedule for
Xen 4.21.

I've updated the Xen 4.21 Release Notes with this schedule, which can now be
accessed via the RN link:
    https://xenbits.xen.org/docs/unstable/support-matrix.html

Best regards,
  Oleksii

--------------TCdXds4BUlSw8kCFfoXdRFBM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hello everyone,

As there hasn't been any feedback on the proposed timeline shared here:
 <a
href="https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u</a>

We can proceed with the suggested timeline as the release schedule for 
Xen 4.21.

I've updated the Xen 4.21 Release Notes with this schedule, which can now be
accessed via the RN link:
   <a href="https://xenbits.xen.org/docs/unstable/support-matrix.html"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/support-matrix.html</a>

Best regards,
 Oleksii
</pre>
    <p></p>
  </body>
</html>

--------------TCdXds4BUlSw8kCFfoXdRFBM--

