Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E1878469A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 18:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588614.920163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYTyu-0006A4-1r; Tue, 22 Aug 2023 16:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588614.920163; Tue, 22 Aug 2023 16:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYTyt-000682-VQ; Tue, 22 Aug 2023 16:11:47 +0000
Received: by outflank-mailman (input) for mailman id 588614;
 Tue, 22 Aug 2023 16:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ibS=EH=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qYTyt-00067w-1r
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 16:11:47 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 964b5386-4106-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 18:11:45 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso36450405ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 09:11:45 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b001bbd8cf6b57sm9410571plb.230.2023.08.22.09.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 09:11:41 -0700 (PDT)
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
X-Inumbo-ID: 964b5386-4106-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692720703; x=1693325503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyHTv8g9eIWz9KF5f4m6MN4EcZmXIrcB+421PcK/03Q=;
        b=lqprgTEzEW00dqyjOHsnEF+ZyI95AuLFD7zXhVQ8wrRdoAO9QmAEheOrfZ2lf+/8X4
         qAu5A6ppA9TSjV/AZ9Ybtxi2VKSi2al4635Q33UMtNcBX+W8m47ucHwOOuMuDbVY8oCy
         H99UdR47Iom+fzwqE4LyEEtS7zjLVkOaQPXWagoa7PpiElpoSNB4UK/MMoEiVW9eE0Bd
         On74ufR5yNHcl1YVAXq3te6BKFcEIEsz57LnJ8mVlNBtaV54OZnk24UMO/cMmqR+MO4p
         lgecna8pVYhrJmapqTAjoBf8IN6pCT20N1hXEV08K1ttNpjuJYIl9OOK1CztzN/Exvaf
         4p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720703; x=1693325503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyHTv8g9eIWz9KF5f4m6MN4EcZmXIrcB+421PcK/03Q=;
        b=B/RC+BQuL/ChtWxSxzME3W8PaaiOwweUOeRKDtKPiFSlqiFMxkQYf0hQCa+lBTzzYZ
         Xzia8btX7atJR98SSXSz/zPLRdivvZPharo6jPOXcmkCDMIj5TaA5fIYh4MEkTyq/eRV
         Qby/NKGtpz9kcn3Nlkjpe2Xc9yH86bLZjS1nGo0c5PTgvYBB9UgMiNOBOSQqOKEzNUFJ
         IykfpE7tlYd09aBvuvko58aU2ODzYxJ5X9Bf3HoI8bUh0gpsdeYRgAWP7WT0NMH+Ctet
         xrqML82sHxar0Ypl/t8MZrMVrPfNaHGFfjvkqXXZcgd72icWBon1o/Zmye2i7R4qgm0V
         1x9w==
X-Gm-Message-State: AOJu0YxPNZc7BK/tDwYWaR1JL5NEa/vn+BYypuTyvJFndOZPnSrUrxDF
	NQWw8wYDhKUJGvskS287NplZZetyPsJVTg==
X-Google-Smtp-Source: AGHT+IFFG+j8BTBOP2dtFi7MJPx0Uve5wC4SDdMtWJ2M3L1ydc/9JAI9lklTZ4EAWiisjIPD+cuKIw==
X-Received: by 2002:a17:902:e802:b0:1bd:b073:a55e with SMTP id u2-20020a170902e80200b001bdb073a55emr11522813plg.5.1692720703613;
        Tue, 22 Aug 2023 09:11:43 -0700 (PDT)
Message-ID: <4548ce1a-8dbe-46a9-e963-00da447396d7@gmail.com>
Date: Wed, 23 Aug 2023 01:11:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] x86: Fix calculation of %dr6/7 reserved bits
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
 <dcd6a5db-239a-9ade-0236-be91744e3b98@gmail.com>
 <a99eb8b6-2e3b-d216-f85b-272161e79185@suse.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
In-Reply-To: <a99eb8b6-2e3b-d216-f85b-272161e79185@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/23 23:54, Jan Beulich wrote:
> But that's not the only change that was requested back then. There was
> one aspect Andrew didn't like, so leaving that part as is would be
> fine. But for the items he didn't further respond to, I'd expect a
> re-submission to take care of them.

Somehow I assumed that Andrew's branch had already contained the relevant
updates, which was clearly wrong and was a sloppy thinking on my part.
Also, rushing to submission didn't _really_ help.

Again, apologies for wasting your time.

-- 
Sincerely,
Jinoh Kang


