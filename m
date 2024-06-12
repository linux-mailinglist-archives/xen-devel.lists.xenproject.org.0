Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA69050F0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739206.1146182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLfB-0001XU-M8; Wed, 12 Jun 2024 10:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739206.1146182; Wed, 12 Jun 2024 10:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLfB-0001Vs-HN; Wed, 12 Jun 2024 10:57:09 +0000
Received: by outflank-mailman (input) for mailman id 739206;
 Wed, 12 Jun 2024 10:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mOs=NO=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sHLf9-0001Vk-EY
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:57:07 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819e8e76-28aa-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:57:06 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-24c9f297524so3726133fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:57:06 -0700 (PDT)
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
X-Inumbo-ID: 819e8e76-28aa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718189825; x=1718794625; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d4CF5jyC63XCq0u9FoYR5aOs8m8c0dHKwp4gOWXkpMU=;
        b=beizp3e6myFwFZX2xeLZi0hY7on814W3eC0iWOyEhDVy5tSxyuS1ZxKbosWr5v/xs9
         hVyUWoeE+MHoOecECKmp7dk42ZZZIHU8xib/NcLhrfkCvbEsxpe69QdzcFi2Km6o95uT
         lrEgS0VKCGIC1x37f0x1pZWQc5rrvkA1rYZNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189825; x=1718794625;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4CF5jyC63XCq0u9FoYR5aOs8m8c0dHKwp4gOWXkpMU=;
        b=NesQ6oppsdTJX7BacHK9DhTtivtfZVvx7sFh+JpHwRwSo0+pSiTjFZGQN/fDCKfdp+
         ro9AD1HnoSC2Z4bCgdGWj48AKe7GYBmlwak7SOUQikMMuEacZlb+tslRWGlMfvAEp4QW
         W2NHaSKVKJ3K5EnNIYKyTZdOBAP+EL0ZFEat3mf287/Ur77Gf5xAioPrDAph0gZoNORK
         bYUnFc4eKuFw35NpA59YG43wfjsuq+2xVxWC5q9QbzJxuX3LVHIU44F7PqVT1HCHLOzD
         /DFGqy36Bz1MKy4tL55fBWYJpbdlcaZE9UjpBnHDM9cVNYb0kU5yRASevk1I8KoUWyQI
         bpfA==
X-Gm-Message-State: AOJu0YyIoeDHkUOLLZGwA58JM9CfwcA3CKdqOjpU4L7IEbBdadwCoOtu
	kY6GzFZR31KYCKJmuHoQ7AEfqEDyrDlR08ZccLO2XxFmW8V2NEtO0ZI8uw85pPAeEAanblQNCmk
	Pv873BkijRZvuB57eSVoLfORKdL7OGknrHUuVMOMHt7zJ0VkM
X-Google-Smtp-Source: AGHT+IFbDcjPpG2OU1TFBI/aIA+TS88MX2CtsAsaHGFvJYgcDVKI1LNz+yvy1BukC64Qps54l+ejNxkE0kB0g6+CoqI=
X-Received: by 2002:a05:6871:726:b0:250:7f7e:fa6a with SMTP id
 586e51a60fabf-25514c5acb1mr1549416fac.23.1718189824841; Wed, 12 Jun 2024
 03:57:04 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 12 Jun 2024 11:56:54 +0100
Message-ID: <CA+zSX=YoUCL40_GtQy0j9_8=3zT-QsuBOmBwRsAUJiBmji1bZA@mail.gmail.com>
Subject: Design Session: Matrix Channel
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Nobody volunteered *up front* to take notes for the Matrix design
session [1], but I did end up taking a few notes, so agreed to do some
follow-up.

The general issue seemed to be how difficult it was to pull out
"signal" from "noise" (where "noise" is individual; i.e., something
completely ARM-specific would be "signal" to the ARM maintainers, but
might be "noise" to someone else).  We also talked about a few other
things that could potentially be improved.

The decision was to make a guidelines page we could point people to
quickly, with points like the following:

---

- Please when possible, reply in thread, even for short things.  If
you realize you haven't replied in thread, please start as soon as
possible, and before replying, look for threads.

- If there's been a technical discussion that has reached an agreement
or conclusion, try to remember to @ relevant people saying something
like "any thoughts"? Just to make sure they have an opportunity to
weigh in.

- Also consider whether it would be good for posterity to paste the
entire thread onto xen-devel, for wider discussion.  (We used to do
this a lot more for IRC conversations.)

- Don't be shy about asking people to move the discussion to a more
appropriate channel.

- We may at some point consider having more specific sub-channels.  In
most cases the core maintianers would need to be part of all the
channels anyway, but having multiple channels still helps, by 1)
breaking down the stuff to catch up on into smaller chunks 2) sorting
it into bits which should be easier to skim.  e.g., x86 maintainers
would skim through the backlog on an ARM channel fairly quickly, while
spending a lot more time going through the backlog on an x86 channel.

- For patches, console logs, etc longer than a few lines, please use a
pastebin.  We recommend either paste.debian.net, gitlab 'gist', or
termbin (instructions for termbin below).

---

Any thoughts?

[1] https://design-sessions.xenproject.org/uid/discussion/disc_Dp9L1y1poJPV69rgUjYO/view

