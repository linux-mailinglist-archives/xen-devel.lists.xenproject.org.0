Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E58079E0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 21:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649433.1013970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAyy5-0003bM-IE; Wed, 06 Dec 2023 20:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649433.1013970; Wed, 06 Dec 2023 20:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAyy5-0003Y4-FR; Wed, 06 Dec 2023 20:58:05 +0000
Received: by outflank-mailman (input) for mailman id 649433;
 Wed, 06 Dec 2023 20:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAyy3-0003Xy-Vb
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 20:58:03 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a5b872-947a-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 21:58:01 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c0a03eb87so2702425e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 12:58:01 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b004076f522058sm869141wms.0.2023.12.06.12.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 12:58:00 -0800 (PST)
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
X-Inumbo-ID: 24a5b872-947a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701896280; x=1702501080; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZsQo4oRgU4G71a2z55TWsdq0DgDPmszDOONZilrHyM=;
        b=vAhPAvg2F29LWU5WEDgaWkxLrhme4uoDT5IyUY+VrnJHpc3tt+KgsR9gISYszF1CnZ
         4YrS+Eixbm904uFxXW1B4odo35TeZpZc/liijsWSmP7f/b1wXC4Y/hi5x9IDsZ+5JnKh
         1CePvSoXQEc2Ft2EuQJkZqBO/s/dkGIFPCFbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701896280; x=1702501080;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZsQo4oRgU4G71a2z55TWsdq0DgDPmszDOONZilrHyM=;
        b=GK7Jf6QbhpfResEsNYxEgDGe+jYAVawPTaaJYMkwt0NiKzws7dnBB9bm3jlPCk1EFm
         PP0bFPm+HwDv2zVf5XSq4iyJFCB1F4csUpznoqPgvdo+FwS9b+nUdqUN5AuCwRvK704x
         dGw5+8PRBRxHl/G2QmCrqTJhLp4xQ9mCFlhl229/ibTCap27X4kNp6dWyrCnw+14fIpv
         U4NwFyEa9kJf7yacp7LWRoyM3ZtvWLlLi4CwHkUu30T6v00h9GmBPSPx4n/hJuV0qx+U
         z9cBk5EY9R2L0gANAmnn+phh7eLgL+THbAUvSFWSn63nrNoqhNms3eVc6ZQGF8rdIOC0
         F9pw==
X-Gm-Message-State: AOJu0YxT/V3WNLtTcautoITcLGoSmYVo2lEkePwRECP6jp8M+BcNG3gn
	mS55mxjDjSDs3iBG9JteNj2gA+ucOMrQK53a+/c=
X-Google-Smtp-Source: AGHT+IGLeJE44mjSwKmLbk3fC/yWlJz4iiLspBBP+66+R8Qrl9uQcw4bFChEsiDx6fUBL9w3QC3Naw==
X-Received: by 2002:a05:600c:4752:b0:40c:2734:13a6 with SMTP id w18-20020a05600c475200b0040c273413a6mr81858wmo.3.1701896280745;
        Wed, 06 Dec 2023 12:58:00 -0800 (PST)
Message-ID: <0836857a-e9f7-41e9-9094-2833913e6485@citrix.com>
Date: Wed, 6 Dec 2023 20:58:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: MiniOS build regressions
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Following the chaos this morning and a scattering of fixes, I finally
got back to a working Gitlab with:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1097843454

This contains a full revert of the DMI patch, and removal of the Xilinx
hardware runner, both handled in other threads but noted here for anyone
looking at the test results.

It also contains 3 MiniOS fixes, mixed between repos:

"tools/libs/evtchn: drop assert()s in stubdom" in xen [1]
"Mini-OS: don't use objcopy --dump-section" in minios [2]
"Mini-OS: export main_thread" [3]

and the result with all of these passes.

However, it is my understanding that we don't actually want to take
patch 3, instead preferring patch 1 as an alternative.

But there is a concern which has been raised over patch 1.


So what are we going to do?

If there isn't an answer promptly, I will revert the most recent bump to
MINIOS_UPSTREAM_REVISION to unbreak Gitlab CI testing for everyone else.


~Andrew

[1]
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=682062f530dc8985bc6b4b747c79fc2ab7b51e18
[2]
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/mini-os.git;a=commitdiff;h=fd13e4b1914a31c7735a8d22642626ce32073305
[3]
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/mini-os.git;a=commitdiff;h=84a251d7ea41f95d048c78717a3086887201a990

