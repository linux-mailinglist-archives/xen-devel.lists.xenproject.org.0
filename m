Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E246F7847DD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 18:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588630.920183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYUPm-00012l-DJ; Tue, 22 Aug 2023 16:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588630.920183; Tue, 22 Aug 2023 16:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYUPm-000116-AV; Tue, 22 Aug 2023 16:39:34 +0000
Received: by outflank-mailman (input) for mailman id 588630;
 Tue, 22 Aug 2023 16:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THXG=EH=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1qYUPl-000110-4D
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 16:39:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e9b007-410a-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 18:39:31 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fef56f7223so15254125e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 09:39:31 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 b19-20020a05600c06d300b003fe24df4182sm862813wmn.1.2023.08.22.09.39.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 09:39:30 -0700 (PDT)
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
X-Inumbo-ID: 77e9b007-410a-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1692722371; x=1693327171;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eLWOQSsrvP+WahVtJLlPd0HyX+o2lHO9vBjYk2y7kQ=;
        b=CaVbX7m5jTSsK9CA4YoZ6zQfCVlVm56WfrcYVXomyZgo/L0mSdTYXa8bW6QWeu7KqK
         LXq5cVwwZXtyBWKF5kuubA0bwKA8c/SM8LcfUX7sVin1CTg5S+8tI8NlhUu/jfNz6jRM
         CdUDy2EKz1FwO8o88tHT8ZSj8d1O1XrY1wYJBh1sXWRDxRPhr3acMRchR0UkkeLRoDjS
         N/cU2+GxtCiGQ5MUcxzM9QGOoeyT1b3ygbszkMB4LHcCG//1iqMP7z+Z3WJqYZwbThZx
         mjh4yJISSFdtSN3PtXsuQvsb9ac+yYiSVSbKzws5SQ6ACdbN+BGPwqzE+uFcSDtcyOyP
         Bgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692722371; x=1693327171;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/eLWOQSsrvP+WahVtJLlPd0HyX+o2lHO9vBjYk2y7kQ=;
        b=iUieqvsk3eXNjqeKdak8lljOL7IfnTZWtVI13An12QnBkV4qVJIHOA+qYEwP473VY3
         Eu7yiGHW39gfTjp3NRaH181rCGiX0CIHDm3FI+6YPI+jk/IcE2Hqlnigt4GayISJ2Myd
         5PmmOcL4H1LL8XXosD4TkXxHxI4hL/HitZ5UjNKQs+B6zmwORM6vmr0r5RbVPLL/1rM8
         XgFTiD0u+kFmY1HwEmLsojPGq4P6+xiUlLIht6a3IX2TRLf3D/fQTQhffxt6BgKHlyo/
         z69q2ihctQZ5dtJ8RcY6n3LNn6/s5+Cd1UQfeWa+SDI06zzIMzShVCKGz9w5DAgD8Cgi
         HnfQ==
X-Gm-Message-State: AOJu0YxdoDOrAVUY408Fvm2JaHt2PLamDAyClkdYIoAvU6fHsLaBbSE9
	0EW6/EcpbFX+k4ULO5SlnPeDcGcTA4p1vcAWnevcug==
X-Google-Smtp-Source: AGHT+IFPYwidEJt5spFUnLWIFziv5NXZRefT0pLZH3PCgW+bi8ZRaJh+1TFsyZLgBuBF3tlgca9cNA==
X-Received: by 2002:a7b:c7c3:0:b0:3f9:b748:ff37 with SMTP id z3-20020a7bc7c3000000b003f9b748ff37mr7983545wmk.20.1692722370681;
        Tue, 22 Aug 2023 09:39:30 -0700 (PDT)
Message-ID: <ad821a92-04d7-b744-c491-9c8fd71ff349@rabbit.lu>
Date: Tue, 22 Aug 2023 18:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: zithro <slack@rabbit.lu>
Subject: [RFC] network hotplug scripts - set qlen 1000 by default
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

would it be useful and/or right to add ...
   ip link set dev ${dev} qlen 1000
... to one of the hotplug scripts ?

For now, all vifs are created with "qlen 32", but (most?) domUs use 1000 
by default.

I can propose the patch.

I tested locally by putting :
   ip link set dev ${dev} qlen 1000
in "xen-network-common.sh" on line 140 (right after "ip link set dev 
${dev} up").

What do you think ?

Thanks,

-- 
++
zithro / Cyril

