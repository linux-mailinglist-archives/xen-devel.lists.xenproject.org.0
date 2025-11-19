Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C91C70723
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 18:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166209.1492806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlvJ-0005RG-Tc; Wed, 19 Nov 2025 17:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166209.1492806; Wed, 19 Nov 2025 17:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLlvJ-0005P6-QJ; Wed, 19 Nov 2025 17:24:53 +0000
Received: by outflank-mailman (input) for mailman id 1166209;
 Wed, 19 Nov 2025 17:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vLlvI-0005Ov-IM
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 17:24:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1b7a5c2-c56c-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 18:24:41 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6417313bddaso11205469a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 09:24:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363b5fe9sm62398a12.11.2025.11.19.09.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 09:24:39 -0800 (PST)
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
X-Inumbo-ID: a1b7a5c2-c56c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763573080; x=1764177880; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55SGmtXQ9o5EY141c7ab3dNmMOpFvCMTG3q4suOEbf8=;
        b=SFJ+16+jswr5lTANd0DMycHdFUDewk2uaZZKC4vneu0Q2ASjBxahj8/cB3WDlwXr0X
         J4Tu+w1EDUr2PwF3rEyT5OsT34LMJLal5TgARnwQF8o6UR3EodyQiJhWVyYrYL1lxH4W
         AK8iP/PnbOrNwCMEzlryWHeSBOHyptmc7NHR4DIwUJ28JcDxcAVOVPqzb23Tr5GIp/GL
         STaoLjXNVpW6EhYdYpjfwXbeSty+Tg0nbTs6z61ZL8D52JGiIXh5Cj9HThqDAItABwxy
         YCXyxp6+FOeGbR+aNayQV/PhnBugyF1kRa1GTh+NIyr4v4IJ6U2Jgsvx4Gwk25huEVTQ
         hX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573080; x=1764177880;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55SGmtXQ9o5EY141c7ab3dNmMOpFvCMTG3q4suOEbf8=;
        b=YR07+DnyRwreevoEbBoNVxHFnKjPisz4ju01iSCOATqZXIgjPH3Nzd1e599lucWWRC
         YE+eW7A4+sQd4Lg/UphiyskF1cqzQv3o4IyuWi69VCliE4gpMletwVvENzhlMOKy0cyT
         p4ilVaCkoliUIaig6ocIEIjUxicejc6rJnjnrZWaIqLNfz3YtfS+pSYO/p2JAu2gK+LJ
         fgybcxP6v7twoYmQ9tx1SCQIOrMl+jB7cVdFqUbzCDQJhZML3k5QIQq/YXVeiTqFYhxR
         kFZzJR5LHKJX2odRS7Q0fRP2sKotsPir4YWM3D5CDUPy0u79iPrTriZ4p3fRQcRxgKbL
         1GeQ==
X-Gm-Message-State: AOJu0YwP/w2Do16dlwmJ2rjdM+mu9An58VwMCnIM73qRcuntZtEUD/kr
	IPnBLA4oq9OzN+qNvgr9tI/ey7AnxvkTsfmDePfGZifCsn1OSiQOO0N2QsrXxN+V
X-Gm-Gg: ASbGncvqD7p/c/7thKXIxL2lMxZewgC4uXstKc5ONSe77y5lK815TZ5a7ftjNkfywBs
	Hwfa+h8NM1+Kq9d441RO6w1iGbxe8MHL/e7CSKVkRSSu48F/i9+m8MV8aFU3C1lq0PvbDK90Q1b
	vsO8coaVkBixU9SIOSJda9Ui2qlRcH7nonoYa6cWsZkn46MXUQwWA+tiNwmWlPQGtmBl/RxRgS6
	FqzSp79VJ0lgIsjUjgHaWJsZo5dz0o3mMgmTUEHPiShAXvxbhKR65lGS16hEwGO6MGA1sMxqxVQ
	qjdArbXJFf6/E5tT1qjTe/+Qj/yzuTlNPUZ8sARYTpSWWP7NYvB5SXTQc/oXd8W6sVwhFZz4OdI
	FOIiDTFRLo8r0lxM/0JM1e+76NpSEsIxnACWCm45YQZYXlheJdKkq/7paelRyNpq5rp/PO38fHE
	4NCyIjs4Yle6NLH4dvQiYunrBzIdgDl/Klxr09gKjsymT/mdEcCGlFSBTFgzeo1z+nriA2zx8=
X-Google-Smtp-Source: AGHT+IH5KIeZCB6DZnSNPNYa4dQBpSCWpG0vNamTZW4xzcXQ/FJRcmxv5dgwxTU5Ifc4pVC8M+mOyw==
X-Received: by 2002:a05:6402:26d2:b0:638:74dc:cf78 with SMTP id 4fb4d7f45d1cf-64536486defmr92788a12.34.1763573079963;
        Wed, 19 Nov 2025 09:24:39 -0800 (PST)
Message-ID: <7b03be85-e41e-4912-bc14-9316658ddbd1@gmail.com>
Date: Wed, 19 Nov 2025 18:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org, advisory-board@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen Project Releases Version 4.21
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

It's with great pleasure that I announce our 4.21 PR release.

I want to thank the whole community for their efforts in getting this
release published!

*Please find the PR article attached here
<https://www.linuxfoundation.org/press/xen-project-delivers-xen-4.21-a-modernized-hypervisor-with-broader-architecture-support-and-improved-performance
  >*

Please find the tarball and its signature at:
     https://downloads.xenproject.org/release/xen/4.21.0/

You can also check out the tag in xen.git:
     git://xenbits.xen.org/xen.git RELEASE-4.21.0

Git checkout and build instructions can be found at:
https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes#Build_Requirements

Release notes can be found at:
     https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes

A summary for 4.21 release documents can be found at:
     https://wiki.xenproject.org/wiki/Category:Xen_4.21

Please find the released features below:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=CHANGELOG.md;h=adaad5ee8923d3a1811fbcd1a99429958fec2fb8;hb=HEAD#l15

Best regards,
   Oleksii

Come join the conversation on Matrix:

XenProject:https://matrix.to/#/#XenProject:matrix.org

XenDevel:https://matrix.to/#/#XenDevel:matrix.org





