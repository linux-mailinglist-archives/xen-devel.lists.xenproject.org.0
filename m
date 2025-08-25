Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD3B3464D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093565.1449033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZSR-0007lD-RN; Mon, 25 Aug 2025 15:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093565.1449033; Mon, 25 Aug 2025 15:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZSR-0007gH-Ol; Mon, 25 Aug 2025 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1093565;
 Mon, 25 Aug 2025 15:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vK8y=3F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uqZSP-0007ZX-KC
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:50:05 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa8d012-81cb-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:50:04 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7a3a085so716640966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:50:04 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe6cdbd545sm369145566b.54.2025.08.25.08.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:50:03 -0700 (PDT)
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
X-Inumbo-ID: 2aa8d012-81cb-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756137004; x=1756741804; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SskRZUZgLM/d2rrCHGTz+gwLdTtrayDukCxpAGwFy4A=;
        b=I6SbGqHbOzZBvParLifmJrUCPmPjp07wDgGVfkHlBzNF4DU0bzmofW/3tdpSjViu9j
         a8WlTUcpVCg7Yww+qliEnyvk7pPeFBLsutMgqozwkiEN1KNJCWJxS2bxGM6ZBvYzLrjR
         nf1iummcGs2C5EoT+oQDymNKtc7Pejxo7At8MQ2otQqfK/jNpstgN7zRfBqCrfZTii4p
         UvNnN7RAUhYly1XTwituOtnKQlhBKE4ktKNDaau1ZWfeJcbt3bXvqlxejwNt6cx3k2R2
         uGmiUwb5dOJDjTrY6Ld8llZiO2qXKkLeoUS5LonH7XFEEP+Zz25l84H8K9uCZmzGEyD1
         Z/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756137004; x=1756741804;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SskRZUZgLM/d2rrCHGTz+gwLdTtrayDukCxpAGwFy4A=;
        b=pDXfLQ4yrYp4FEsqArQPad11mHFZlHYH+lmkg46qIQTEcULytBOtW/8LyAdUF3p7bs
         123wyb9/2np/YoTnNDkJht9YqW+lZVNx1Mari5ycfSqqe14lYlG0bv/EALMY02SF+Moc
         a/oJIyUNppp1jqDzTr74DtFjjx9cfpL6z4A5zko8KmCprvDtYLsHz6AJb+Vuv7UooPuE
         Fxsi1+vB8Vc3LMymnq1msbUJJw7sZEuERPciFgalsQ8Q4eAY9bUvCLM/IioxaMmaDiM4
         pZQpB/j7oz6GyPDAWPr52HAWjPWvXIIN/YUobO5p0GJ8tpNtUj3/1jNmtiH/QKrlmrKO
         CYlQ==
X-Gm-Message-State: AOJu0Yx1fBhvfwwRBVd0GezrZ7L82Ac5eN+ODQjpIMQb0HvnWpgzO1tF
	9gpdH+8nvGibgLK86QilhMecJy0qTNg5oLtMF0hQDXAw6XO5m7jyhsvQxx2gvw==
X-Gm-Gg: ASbGncsyjR0bxnMuesiyCKKhV+mywQ0hoXfr936Hs03qXwGQTb8VABaOFEuJeEZdEXF
	SjO8SUm05mf4LrmhwIYJDWPLkUDzpL2MoffnmUxX7ru+ccGRaY3lNaN3EZNr8x1TVOAEeO43KYW
	mLMQGzknyCoyQXMXnb2jn5E9IoJXBcdcwZxyj8MYl9SjEuE5lnKDiEk6BR2z42o5Kkx4efp5Vtz
	s8ZXGpnYSNyDxfeJqb7R3mORWzNDLTK6yU3tntDHmjDKVjQlc9DjChQs4w+MeS6cd4U4KZkdex5
	BnBeNtuY/6CY+RayBsbRoDpggkNyvzY3eyHvKkRv39EFNv4HPvlw/jDbGTtJRwwG8yvmjPhZy3X
	NzYACFoafdI/mAn9MbV7yhtO+JIu38uEjWc9rR2Z7pAbbAerxQilxVh3dYgD8GhcI1EctJ+k=
X-Google-Smtp-Source: AGHT+IGexMniwdkNY5LlokcHzFOJCefEk0K4YXVScGKBP3iRlfECuEj3CxG1EUTUfdVQTtxN4ahk+g==
X-Received: by 2002:a17:907:6d12:b0:af2:42e8:ad92 with SMTP id a640c23a62f3a-afe2963df7dmr1204098666b.61.1756137003376;
        Mon, 25 Aug 2025 08:50:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rqeomJbHqoerFSMl0BcNalTV"
Message-ID: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Date: Mon, 25 Aug 2025 17:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [Reminder] Feature Freeze is Fri Aug 29, 2025

This is a multi-part message in MIME format.
--------------rqeomJbHqoerFSMl0BcNalTV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello community,

I’d like to remind everyone that the Feature Freeze deadline is approaching,
and we still have some outstanding requests from the community for patch series
to be merged into 4.21:

1. Enable guest suspend/resume support on ARM via vPSCI [1]
2. Introduce SCI SCMI SMC multi-agent support [2]
3. Introduce eSPI support [3]
4. FRED work: [4], [5], possibly others (?)
5. Introduce CONFIG_DOMCTL [6]
6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
7. Some other patch series I missed.

It looks like some of these patch series still require additional work,
and I’m not sure there is enough time left before the end of this week.

Could I kindly ask for an estimation of whether these tasks can be completed in time?

[1]https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/
[2]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
[3]https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/

[4]https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/
[5]https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/

[6]https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/
[7]https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/

Thanks in advance.

Best regards,
   Oleksii

--------------rqeomJbHqoerFSMl0BcNalTV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello community,

I’d like to remind everyone that the Feature Freeze deadline is approaching,
and we still have some outstanding requests from the community for patch series
to be merged into 4.21:

1. Enable guest suspend/resume support on ARM via vPSCI [1]
2. Introduce SCI SCMI SMC multi-agent support [2]
3. Introduce eSPI support [3]
4. FRED work: [4], [5], possibly others (?)
5. Introduce CONFIG_DOMCTL [6]
6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
7. Some other patch series I missed.

It looks like some of these patch series still require additional work,
and I’m not sure there is enough time left before the end of this week.

Could I kindly ask for an estimation of whether these tasks can be completed in time?

[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/">https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/</a>
[2] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/">https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/</a>
[3] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/">https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/</a>

[4] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/</a>
[5] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/</a>

[6] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/">https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/</a>
[7] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/">https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/</a>

Thanks in advance.

Best regards,
  Oleksii
</pre>
  </body>
</html>

--------------rqeomJbHqoerFSMl0BcNalTV--

