Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28808A4A37E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899101.1307536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6dr-0005Qf-Q1; Fri, 28 Feb 2025 20:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899101.1307536; Fri, 28 Feb 2025 20:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6dr-0005Oe-NI; Fri, 28 Feb 2025 20:07:27 +0000
Received: by outflank-mailman (input) for mailman id 899101;
 Fri, 28 Feb 2025 20:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6dq-0005OT-Cy
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:07:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eeac0c4-f60f-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:07:23 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abee54ae370so356871666b.3; 
 Fri, 28 Feb 2025 12:07:22 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c74fb00sm340489366b.130.2025.02.28.12.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 12:07:20 -0800 (PST)
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
X-Inumbo-ID: 9eeac0c4-f60f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773241; x=1741378041; darn=lists.xenproject.org;
        h=content-language:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XzoBo7zFvPX7LsjdBVgN9UTbsEt4oLn2Yrv7Ob+0qys=;
        b=JSIAwnVzduM2Ff1Nl1hgUzfT21LlYE2MbqcU9lt8Ds+BUcQOT1vFqRfiRFiO1SxBvr
         ZmaSxmvc11IkKGK/FOa7SffmRhm0X5VAJ/t0vuWxVrHOJziDmthheHOKXonZg622BUdd
         WTjVWRwhb4ReBCKH+LsuzgBVILvNhUSQBZWg/6pBDaNq2kdNEZS4TWWGTRLlNZ5oEETx
         /o34IEcAP0BR7Tf/FEb+qDIIvDso8s/Kaz6SyBTDeTCSyZkAepvBMPRD6mjXYoOKCxs0
         46gxaZCb8U29E/kxip1PzNpOV8SwZv4gONI62mKwY7SGATGqLt1qAk5ATYcwhOBdPkCx
         FZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773241; x=1741378041;
        h=content-language:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzoBo7zFvPX7LsjdBVgN9UTbsEt4oLn2Yrv7Ob+0qys=;
        b=moyTbwnB5mkNNUjj45k8+W5YM99I7M0keDvz1746T54BTtB+hdf1bXAGq6lF+XyXvA
         yIaP3+RsLnkmU1XGqBvY8edvaz2k75kBvF1iSusj/sy4hlUS9joQqtrytDviUM4ITSqU
         HawQTotRqqh7Nbf8nvUnRALxNeFvgxjLduwrOsKD1tVZccm49llxJDqyfjsWvcQGIqvm
         +6pglKiR2lLQnmMEbNNUtPl9caox5YNL4DyDoG1O/A9XY6UUScrrmp2tA6CqB8uLjjp5
         HWviLFIA9FvHsTeXIyu4ApQBOqUFk414dVvMLTR0XM5BcbxcWaaBzb2iT6mN4NBBG0dp
         Mkkg==
X-Forwarded-Encrypted: i=1; AJvYcCV/MKXbqqA2GzrKOm7Y8EedKuxQWgMwLUqi1peR1pOjHMneYbg42QolKWUNypM/FVhgFTvIcF7CibNIbaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh+/NVFV6Nuf4BEj1eYR8zDi3pa3zFM9DCbdBu70gNkywqmS68
	3ZXkD4OYf89YGinBWu4ZHieoic2WKaKdwUDId+9n2MBiHN+Mk21BKPEXlA==
X-Gm-Gg: ASbGncsKn+7X+6g1UOB7KoybMFkpvynUR160yG4LYVpUB8Fa5vfRiyGyg7qZFLJepn+
	L/LdQtM0oiYzSIb4JqZkoBaXiwcUPmLNc12iP1lVTefZAPTkVCbJqU/Q7XB/ADFHT5OtBruK5wX
	mEGsIA7umEhJmsJXx6w9lQSdW1Y0642SXYQ6A1o1YBrvzx93ZHK19ozk0nRLDVISVg00xgK2iQ7
	1Uo+RsPhxNfdGSJJjVigTpmyplFQgcI+i0imy+jaUdMLNBIO2462xNsdW3GBqCCmDJSZWTN0YI/
	si7OIqbrl4SSQf3Y/hi0C+EQODaowPmmp7s=
X-Google-Smtp-Source: AGHT+IEV+p7DY7lOcH9rg0p3yFQnuLWLT56NyH8d90zplbNaASz4Z+Y+gx2HcyHQwfpbYjEGutvFVw==
X-Received: by 2002:a17:907:728d:b0:ab7:e567:5006 with SMTP id a640c23a62f3a-abf264238eamr547136766b.13.1740773241192;
        Fri, 28 Feb 2025 12:07:21 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0rGgqlWznWugifkB7DF43YLm"
Message-ID: <cb8beb32-0ec9-40ff-94d8-dce39a0dd63b@gmail.com>
Date: Fri, 28 Feb 2025 21:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.21 release date is Wednesday, 5 March.
To: Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0rGgqlWznWugifkB7DF43YLm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I would like to announce that Xen 4.21 is expected to be released
on Wednesday, March 5, (not on original date due to final preparation
details).

Thanks in advance, and have a great weekend!

Best regards,
   Oleksii

--------------0rGgqlWznWugifkB7DF43YLm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="0" data-end="17">Hello everyone,</pre>
    <pre data-start="19" data-end="143">I would like to announce that Xen 4.21 is expected to be released
on Wednesday, March 5, (not on original date due to final preparation
details).</pre>
    <pre data-start="145" data-end="191">Thanks in advance, and have a great weekend!</pre>
    <pre data-start="193" data-end="216" data-is-last-node=""
    data-is-only-node="">Best regards,
  Oleksii</pre>
  </body>
</html>

--------------0rGgqlWznWugifkB7DF43YLm--

