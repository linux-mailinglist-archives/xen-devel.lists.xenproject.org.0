Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DF82D8E6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 13:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667355.1038522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPM8X-0003L4-IC; Mon, 15 Jan 2024 12:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667355.1038522; Mon, 15 Jan 2024 12:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPM8X-0003J9-FS; Mon, 15 Jan 2024 12:32:17 +0000
Received: by outflank-mailman (input) for mailman id 667355;
 Mon, 15 Jan 2024 12:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPM8V-0003Hl-VL
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 12:32:16 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b7bdccc-b3a2-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 13:32:12 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3377d45c178so3821215f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 04:32:12 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 d11-20020adfa34b000000b00336e15fbc85sm11828133wrb.82.2024.01.15.04.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 04:32:11 -0800 (PST)
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
X-Inumbo-ID: 1b7bdccc-b3a2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705321932; x=1705926732; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbBearF0qnTRZ5J4XNGAPv8J8R9/JbmwgJcHEWKAkB4=;
        b=wVLzBnpkrngbrp3h6ie1+hm+b/i3BYr2hYV82Vbdy8+Z+UATebZ72FgQom5xMgAKct
         D7A30viOUOO4G1gmy/9BHkNtTAdcPYxEGokfxHEDDdadHlAIpb6N/3OJUudwaqDOvyDj
         LQ0Fv9/eQxLSouMzV59Smyaxhq+xOfQ8QVyRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705321932; x=1705926732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbBearF0qnTRZ5J4XNGAPv8J8R9/JbmwgJcHEWKAkB4=;
        b=e88/lAr59v1eBhLm/RiIAuCLK12jujlFBwjgLoumW3lS7BYXrWmf1ez/csUAXAtdO+
         wdI7Wxaus9/lVBxC/T8tzZow3D8MeSnKeBa8gNIHwXziSn+uyvSbNh6rQPImc24gTWJE
         is1Uq72YDQsy54/eccdQ0rLk+oo4zKSJ3Kwg5sLIUh25pLSLc61sm1r0l37L+GcTXDvE
         vwCITVV6RS1wfH0zcfdX9YuhgDbYSu1ILUE4jWSnYgZXgY/PqzIuZxPcTJZ+vORfvDUV
         eb/cud8A1qJklOOeCTFdNXYr3qI/PJ2gfGmwCBc1wjPtc6zIHvnEuV8r/Loky8At6Dj7
         hJcw==
X-Gm-Message-State: AOJu0YxwlmS09nGeVepyOUmhF18+lt3YEtj8Wh+h8pxFhzilJsrZSr0I
	zi3oD/ViD6joSi5Kv/NrQmG1qE4RdyeQZw==
X-Google-Smtp-Source: AGHT+IGqC54mAZUreT/EJ0sv6dB5ZdtIvHnkb9T3rBbolFfa3up5yDAoYN/A3Q8zd/5ANY4QrBFyLA==
X-Received: by 2002:adf:e549:0:b0:337:53bf:9f20 with SMTP id z9-20020adfe549000000b0033753bf9f20mr3164960wrm.76.1705321931882;
        Mon, 15 Jan 2024 04:32:11 -0800 (PST)
Date: Mon, 15 Jan 2024 13:32:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] CirrusCI: drop FreeBSD 12
Message-ID: <ZaUlynk34sJATApl@macbook>
References: <20240115102718.81294-1-roger.pau@citrix.com>
 <854db64e-a3c1-4c2f-8a68-8557f7f5a5d1@citrix.com>
 <ZaUU_qqqOs_F4qe0@macbook>
 <6528658a-5cb7-4f9b-a92d-a4ca43f6352b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6528658a-5cb7-4f9b-a92d-a4ca43f6352b@suse.com>

On Mon, Jan 15, 2024 at 12:37:39PM +0100, Jan Beulich wrote:
> On 15.01.2024 12:20, Roger Pau Monné wrote:
> > On Mon, Jan 15, 2024 at 11:01:54AM +0000, Andrew Cooper wrote:
> >> On 15/01/2024 10:27 am, Roger Pau Monne wrote:
> >>> Went EOL by the end of December 2023, and the pkg repos have been shut down.
> >>>
> >>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> We'll need to backport this, I guess ?
> > 
> > Yup, but it might not apply cleanly without the rest of the changes to
> > the file backported also.
> 
> Looks to apply fine to .18 and .17, which it what I'll queue it for.
> If and when we need it on .16 and/or .15 as well, adjusting the patch
> rather then taking further (not really) prereqs may be preferable.

We would likely need to take backports, because the versions in 15 and
16 CirrusCI file are also EOL, so I think it won't work anyway.

Thanks, Roger.

