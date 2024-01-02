Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0AC821FD4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 18:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660796.1030407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKi9F-0001G4-9F; Tue, 02 Jan 2024 17:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660796.1030407; Tue, 02 Jan 2024 17:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKi9F-0001Cu-5f; Tue, 02 Jan 2024 17:01:49 +0000
Received: by outflank-mailman (input) for mailman id 660796;
 Tue, 02 Jan 2024 17:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMnO=IM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rKi9D-0001Co-ON
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 17:01:47 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4be82f-a990-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 18:01:45 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cca5e7b390so96061661fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 09:01:45 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a2e300e000000b002ccd1b79639sm3278959ljw.43.2024.01.02.09.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:01:44 -0800 (PST)
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
X-Inumbo-ID: 9c4be82f-a990-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704214905; x=1704819705; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GHB74tuse0d4xjbuj4Hx6CiYW1Afi3meGCt1zNvd1j8=;
        b=FhkiQCWmS3uQj32HSujAK9/Ocdfk2bWS7x3D1zMBTeUE+0isXiDGp5AWnJ5INVRMMr
         p3UpuJ2EP3k6pQDQ08KfWCQg7wR8flBpgg6VLM8C/gihYbTYuaZtRIrPAZoD1jI2i4wR
         klXfIZlIp09pFP8VEPKfok5TTk8o/rzBoEmVf34S11ZN54jXX8CHmlQF9Q/1dDvThYuV
         qkssStMfzHV2fXsQ14qvESlPtWMxQwp2mYIADGfiX892h7wOsg3bcQF50pQx3ZMAKmL9
         3bTBFcY9/GPAOYEUBhMYe7fX9W32GVaNbd4lIKw5mVmTRkY2mz+H1qazpql49RqgZtHQ
         cl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214905; x=1704819705;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHB74tuse0d4xjbuj4Hx6CiYW1Afi3meGCt1zNvd1j8=;
        b=eINueCiDhcomynZdVD5geQRJxbIr2iR6SdgfVvOTOmuC8EgFV1hD5RVouBA2tuFGZJ
         7R0gduHRmUm7dze8R/MiFL2/Txpea0cwCSzaAsQPBUDzi8WX6sp/7QJrXxzOpfd7/5Hl
         1ozHkiqv9sLkGlKK8elI5SCH+tAkxhq93z95M6lRKj6J6dTdexBebdIlFExIAW4hAwF8
         gAYaZzHX/BwS6QfL+6vpzAaR5+hDJ3imLOa3oz+csWqkXOXt73qPRLaPlK/yyyrjEDz3
         uagyVq91lPj4I+sfZwh4LeNyckAxgG/FjVmkxnLADOMvoUGy5ziau3qNfdqvw9Et9fCh
         496w==
X-Gm-Message-State: AOJu0YywgKuoNJXlF3tR8SnzUIVJWsvoCnW74kHyadDYIwxfTvYuzeiT
	7U63pYH/28qmY8JTq5kc5EVTXYtWHEw=
X-Google-Smtp-Source: AGHT+IEEfp4cXhiPVZ/PnQtZMUkJfkKcU683fDdoNNvg5b7IOWEhNMeSpNrYkDesFnHNl/QvV5F8pw==
X-Received: by 2002:a2e:8556:0:b0:2cd:1038:3fa8 with SMTP id u22-20020a2e8556000000b002cd10383fa8mr546353ljj.104.1704214905012;
        Tue, 02 Jan 2024 09:01:45 -0800 (PST)
Message-ID: <5b323738a57fb3f7b41de00903e993360a5712eb.camel@gmail.com>
Subject: Xen 4.19 release schedule proposal
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org,
 sstabellini@kernel.org,  Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com,  roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com,  jgross@suse.com,
 Wei.Chen@arm.com
Date: Tue, 02 Jan 2024 19:01:42 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Dear community,

Wishing you a Happy New Year!

I'd like to propose the release schedule for Xen 4.19.

Based on the previous release schedules [1] and [2], it seems the next
release date should be on Wednesday, July 10, 2024:

** Proposed option: Wed Jul 10, 2024 **
(+9 months from Xen 4.18 release)

- Last posting date          Fri Apr 26, 2024

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri May 17, 2024 (+3 weeks from Last
posting date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri May 31, 2024 (+2 weeks from Feature
freeze)

Bugfixes only.

- Hard code freeze           Fri Jun 21, 2024 (+3 weeks from Code
freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes
only.

- Final commits              Fri Jul 05, 2024 (+2 weeks from Hard code
freeze)

Branch off staging-4.19.

- Release                    Wed Jul 10, 2024

If there are no objections, we will stick to the proposed schedule.

One more thing I'd like to discuss is whether to add a file
(RELEASE.md) with the release schedule to the source code or update an
existing one (xen-release-management.pandoc). I think it will help to
find the final release schedule for the nearest release. For example,
for the previous release, there are a lot of emails with proposed
schedules, polls of Xen release schedules, and I found the final
release schedule in just one of the replies (but probably I missed
something).

I'll be happy to hear any comments from you. Thanks in advance.

Best regards,
 Oleksii

[1]
https://lore.kernel.org/xen-devel/AS8PR08MB7991424A3167C70A9B29530C92929@AS=
8PR08MB7991.eurprd08.prod.outlook.com/
[2] https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

