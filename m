Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88811821FD3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 18:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660792.1030397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKi70-0007u5-Su; Tue, 02 Jan 2024 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660792.1030397; Tue, 02 Jan 2024 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKi70-0007rj-PO; Tue, 02 Jan 2024 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 660792;
 Tue, 02 Jan 2024 16:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMnO=IM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rKi6z-0007p3-5v
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 16:59:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491ea738-a990-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 17:59:26 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so76447621fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 08:59:26 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05651c01ce00b002ccc5f01c49sm2455308ljn.83.2024.01.02.08.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 08:59:24 -0800 (PST)
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
X-Inumbo-ID: 491ea738-a990-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704214765; x=1704819565; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GHB74tuse0d4xjbuj4Hx6CiYW1Afi3meGCt1zNvd1j8=;
        b=mBKwHnsJ9ySEPDP5DWLLaQJGgSD9M4BmoGeXX8ENtlK3maVnj8vh3c0O1bVgiQjnYD
         Sl/NmrdP33BW8/ejU1bDDLHpH1gFQxQG2hLvM30E0BqetB5EPY3WTKyXrAiZJUi2aA1P
         9mDVfgrE3nyQlTououexnjg/12k+c8wUutkOM6D3iXRteegteaoiMxbLVAuVWkpFgrUG
         5/NodtX0Em0H3rWHbrGkQyuD7CqHJTXAhPBw1Wn8cFKlUlzj5lXAjCdflZ8W+z7tGBN/
         Sz/DlNvJDz1jAZ4VSxkJyBz4CL5tB+cLINJZU9iSaIHwAb3xmiAHdl3HmwZYvK1hmVdB
         F9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214765; x=1704819565;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHB74tuse0d4xjbuj4Hx6CiYW1Afi3meGCt1zNvd1j8=;
        b=vPSwBZr5DoVaGSA9l/Rv1e3y1KSA39lwJ2ZXgJhwrgLs8JyPPQKYLxomG869GyAuEs
         Q29PqI2pLJhL5vlw4VmQV1E1nasfuibtDPpJ+bgK8te11L0C6sK9mcGl378mlNAajwrw
         RbEsn7UitIxrDbSwNScgFcx8uXzAtK8NsU6WjToO2NM7Nm80R8RZUkXhbxUiseqLW41V
         O1RWVAeNQJ5Ixvp2ZhJmkynfBxRHAatm8WQlpNqSWpj7QKay8zIQlz3Bq2s4a4ECZWB9
         vfA9HfDjhFVP/oydc/KSeZ+kGGLneoI3w4sRGuLSHNioyZXqZ6D12UjodnlbysjfInq7
         9pUA==
X-Gm-Message-State: AOJu0YzD/Oq+RzT/5MY+4t+WO8JwaoN7jogQxqUsjJ/h9X8rYe6T5RrC
	sK9d8wPDdn2VyQGCF5PdRkuCSl5rYkk=
X-Google-Smtp-Source: AGHT+IFAhdh1p0ip7Gc3Fhr8IGJYJIJwd343RPr+ux8b7xnmzUQ7OJG436GK5zpXLs1QUzJDyGIHaA==
X-Received: by 2002:a05:651c:388:b0:2c8:39fc:acf5 with SMTP id e8-20020a05651c038800b002c839fcacf5mr6052412ljp.2.1704214764835;
        Tue, 02 Jan 2024 08:59:24 -0800 (PST)
Message-ID: <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
Subject: Xen 4.19 release schedule proposal
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org,
 sstabellini@kernel.org,  Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com,  roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com,  jgross@suse.com,
 Wei.Chen@arm.com
Date: Tue, 02 Jan 2024 18:59:22 +0200
In-Reply-To: <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
	 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
	 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
	 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
	 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
	 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
	 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
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

