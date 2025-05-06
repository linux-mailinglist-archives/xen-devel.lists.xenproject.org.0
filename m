Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E52AACC0E
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977867.1364796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLu6-000498-Mn; Tue, 06 May 2025 17:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977867.1364796; Tue, 06 May 2025 17:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLu6-00046n-Gz; Tue, 06 May 2025 17:16:26 +0000
Received: by outflank-mailman (input) for mailman id 977867;
 Tue, 06 May 2025 17:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLjP-00068s-Ar
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 17:05:23 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf75eba-2a9c-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 19:05:22 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so9356575a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 10:05:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1895087d1sm734784366b.128.2025.05.06.10.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 10:05:08 -0700 (PDT)
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
X-Inumbo-ID: 4bf75eba-2a9c-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551122; x=1747155922; darn=lists.xenproject.org;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pDa0D1+aR8Ko4O2Nqip7CmD95+rrrCXpgxd1DZMq3A4=;
        b=Q7aLYrezoz9adBIuNsYbO4fBLZ/QLqQtDcrefKOTr/tTWUTrcIbmw/2G53GP23eoZu
         0gxrUY3uSFXSzjjC+3Te2kaPSrE2fiknmdZohPPKxX0IpSTnjsoeyLOu2D/hq659S09P
         uPD1iA3PmNOV1D++Db9ts41hKKmu/SnrHhcLa2aRmMGdRX9XF9zqKNBxE233gw/VZNnK
         uo3Bwd2pKW48xkX7JZGOMBvhej+Frbbdzh4vIX6PLDBsj1V/79PY2/4ILblJK0pQkEEt
         zVFtZ6FEuoPxIn5qPRJZaoOi4eObEHx/N/I3npCLRqoG1nGgUdYbvukND34J8cAWlUQW
         XzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551122; x=1747155922;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDa0D1+aR8Ko4O2Nqip7CmD95+rrrCXpgxd1DZMq3A4=;
        b=xDYwfplDD8lnRF+/49mLTibNFw9j58Z4qp3vbPj/tNFSnWaKjGqxX8UlfwzuB6IaER
         Ulhz0hTziOPbhuWXWZwbauGv3mhVzYc5/jD/HFY1Ir5u1Eh2EhK91GhBAqfek/Ui3hP1
         7cQ0E15izusJOLjPDuqbXQgZdqY9NEI5+GpvRB8PPe0Fjdh672Z4XOYC18H6RkEKqyCE
         jGdSj5FbjM5g42HngQSKo2JbWqkWQtIVg1Y4RO01cLxVSR4CeqwSX9E9gk2E7fCklfvn
         F1w8XSavoDXPHUeChcp+PKqMyp6pJBhGiWa7EHclH8d5JmuwN4dG6P+IvAybxgtRI0dL
         Um4w==
X-Gm-Message-State: AOJu0YxhsMB+oIvpZIkocFygBjJnPjajPmCfWDAbssfFHmYWOk7nigPy
	K5MJ+Mtx/NM6NlIxWJcPFAWNP1bfZX5yVXrF8XYohGEglCRIcj38cRWMMQ==
X-Gm-Gg: ASbGncuwKWn+ttsq840usHD0HaLUc7bSoTkFjgdvktWgoVR5K/J+02SQqn/apwekSB5
	klyYglHVYQuLTK2rIiCZgVhNBYKmBtBQtFs5NaucP/ZznUoQ4PavaWK7FHF85eXDd/cb/9iH0Jq
	9DdpSlS/r/NliKQOqoxj03emwZxyCASE+d2UwQN+w5XCrqwduxhzEoqpStbiqoWlTckH0769sOb
	19SwFpnDnkeVy7YvYkzcyd5oEvf9YLVd0vIgZclU1SKx2zfpR5ji1v33Ylyi4kmZz+SyxUGAp3/
	WsLe04cKPqz79mjTgUhleDLJSs/4xGP94APgON2nlJMPVqAMbCZrmzH3biKkaNXfiQ6DpsLIiJ+
	yf1O9GOjj56tND/NO
X-Google-Smtp-Source: AGHT+IEVjhy5HF3PwgOBcWMoWA8WYUsi+JV7gB6U0aftrO7QSii4fQf5ik3/xNjNQHIxhLop4oXvXg==
X-Received: by 2002:a17:906:794f:b0:ace:388e:d84a with SMTP id a640c23a62f3a-ad1e8e66735mr18410966b.47.1746551109058;
        Tue, 06 May 2025 10:05:09 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------eFso15EVoD0XLSWwdndnFzyY"
Message-ID: <666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com>
Date: Tue, 6 May 2025 19:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.21 release schedule proposal
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>

This is a multi-part message in MIME format.
--------------eFso15EVoD0XLSWwdndnFzyY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Following the 8-month release cycle, also taking into account that 4.20
has been released 5 March 2025 and the next "good" month for release should
be November according to:
https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

Here is suggested schedule:

** Proposed option: Wed Nov 12, 2025 **
  (~ +8 months from Xen 4.20 release)

- Last posting date          Fri Aug 08, 2025 (+15 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Aug 29, 2025 (+3 weeks from Last posting date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Sep 26, 2025 (+4 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Oct 24, 2025 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Nov 07, 2025 (+2 weeks from Hard code freeze)

Branch off staging-4.20.

- Release                    Wed Nov 12, 2025


Please don't hesitate to provide your feedback.

If there are no objections, I plan to update the Wiki page
Xen_Project_X.YY_Release_Notes to make it easier to find our final schedule
( especially for the people who aren't following xen-devel mailing list ).
As an additional benefit, it will also be accessible via SUPPORT.md (in the
wiki athttps://xenbits.xen.org/docs/unstable-staging/support-matrix.html).

Thanks and have a good week.

Best regards,
  Oleksii

--------------eFso15EVoD0XLSWwdndnFzyY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hello everyone,

Following the 8-month release cycle, also taking into account that 4.20
has been released 5 March 2025 and the next "good" month for release should
be November according to:
<a
href="https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html</a>

Here is suggested schedule:

** Proposed option: Wed Nov 12, 2025 **
 (~ +8 months from Xen 4.20 release)

- Last posting date          Fri Aug 08, 2025 (+15 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Aug 29, 2025 (+3 weeks from Last posting date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Sep 26, 2025 (+4 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Oct 24, 2025 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Nov 07, 2025 (+2 weeks from Hard code freeze)

Branch off staging-4.20.

- Release                    Wed Nov 12, 2025


Please don't hesitate to provide your feedback.

If there are no objections, I plan to update the Wiki page
Xen_Project_X.YY_Release_Notes to make it easier to find our final schedule
( especially for the people who aren't following xen-devel mailing list ).
As an additional benefit, it will also be accessible via SUPPORT.md (in the
wiki at <a
href="https://xenbits.xen.org/docs/unstable-staging/support-matrix.html"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;"
    class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable-staging/support-matrix.html</a>).

Thanks and have a good week.

Best regards,
 Oleksii
</pre>
    <p></p>
  </body>
</html>

--------------eFso15EVoD0XLSWwdndnFzyY--

