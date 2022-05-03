Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D9C5196BE
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319923.540570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7L4-0003xF-KB; Wed, 04 May 2022 05:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319923.540570; Wed, 04 May 2022 05:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7L4-0003vE-H8; Wed, 04 May 2022 05:14:14 +0000
Received: by outflank-mailman (input) for mailman id 319923;
 Tue, 03 May 2022 19:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DlQT=VL=gmail.com=colton.reeder@srs-se1.protection.inumbo.net>)
 id 1nlyJX-0003oK-9a
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 19:36:03 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43846196-cb18-11ec-a406-831a346695d4;
 Tue, 03 May 2022 21:36:02 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f863469afbso167288887b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 12:36:02 -0700 (PDT)
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
X-Inumbo-ID: 43846196-cb18-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=n3Zc0sMo50Lmd548uHQmkNDpex8oEWoswi229+miYCw=;
        b=PiC6x02SrBwxBsIwisXmQAgrus9YNtZzZXEAYPYV65jYEtvzanbYLmXBI6CsZB8u61
         B95O5wI9MwgtwNWN1Qh/qis1doJMxsYYNMJ8oyj6mQpgK7QDHeA2TpQPdZ+d12/U2BMT
         /ho0fmvw0vgSkBDynpK5O2jOhn2ZvecV6Q8ZEi4mkPHeuHZRvL08Gfbqo1ZP49E3wBMG
         k9Cq4AjZhkSnrsuFhOGNbDc0PAFdDYL+TA7gCjxhDkbJ0nbj8ezfkzjX31kWRgv1qWoa
         e5U/VrVYBUU5T724jhHjPaOzeCiBgZVScbNeaXgHwUXCpGVD9nZSYoFLCV4IRRZzt47b
         vyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=n3Zc0sMo50Lmd548uHQmkNDpex8oEWoswi229+miYCw=;
        b=ssL2f+F/q25zHav9Gp8GBczl7cVsQS4IiXzaFg29TSYSb28A30Sg8ODgzuRSYuiOHp
         uDBcDcFzLSSlWuo6kdscwYcUsZdtkNcXsTFpbMA3kTrzdpKaUxZwPxzxFfvvUdX9fELn
         CV/WqFckzFv5bCwpIVGDxq4ZggTOcXWe1nNr21LqG7YHkXZiqIYvyTMnoY9Qq4DA2LSC
         XwYoePfYOgpM2ogeV1Y+eBWftKx9zUGMAvZNfLy8HMp7N9qTo4vXe6hBwv35sKl4wbTa
         zpUDukTHIO2eHm140/voBw1JLR+M2fLbDJtU8Q9Y+nGx9yfrwzs2poO3Duq3/Un3h025
         IFZw==
X-Gm-Message-State: AOAM533Hrdw23/kfr+uYBQ8ZJNq0mFkGNAHR+sLUXkSU7vbSmFLCheSk
	vBB2K257Nch4UUIg9fGO2YdhQz42Te6MChXpAYNKWghQ9lg=
X-Google-Smtp-Source: ABdhPJys2WpISuQNmNm+sBglpHUjCpmzyin+y4uQIl7/ID63li/2beL7qcHok94+GNaoU6E2D4tkuJvRDDuqevhidR0=
X-Received: by 2002:a0d:d98c:0:b0:2f8:e554:3541 with SMTP id
 b134-20020a0dd98c000000b002f8e5543541mr14112102ywe.446.1651606560664; Tue, 03
 May 2022 12:36:00 -0700 (PDT)
MIME-Version: 1.0
From: Colton Reeder <colton.reeder@gmail.com>
Date: Tue, 3 May 2022 12:36:43 -0700
Message-ID: <CAHq+1YiXwgOwPzUoRc37pA4t8Ef-AriROA1XYr2fpfMXOjdwhQ@mail.gmail.com>
Subject: OPNSense running in domU has no network connectivity on 5.15.29+
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am running the FreeBSD-based router OS OPNSense in a domU. I
recently upgraded my dom0 kernel from 5.15.26 to 5.15.32 and with the
new kernel, OPNSense had no connectivity. I downloaded from kernel.org
5.15.26-32, built and installed each version and booted them
consecutively until I found the version that no longer worked. It
turned out to be 5.15.29.

I looked through the change log of 5.15.29 and found two commits for xen-netback

commit 2708ceb4e5cc84ef179bad25a2d7890573ef78be commit
fe39ab30dcc204e321c2670cc1cf55904af35d01

I reverted these changes (a revert of a revert, yes)  in 5.15.32,
built and installed. Now the network works. Now I dont know enough to
know thats for sure the right fix. Maybe I have a config issue, I dont
know, but reverting that change fixes the problem. What should I do?
I was asked to provide xenstore -ls https://pastebin.com/hHPWgrEy

