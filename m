Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6A81B4E1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 12:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658849.1028262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGHCh-0004za-6f; Thu, 21 Dec 2023 11:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658849.1028262; Thu, 21 Dec 2023 11:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGHCh-0004xs-3b; Thu, 21 Dec 2023 11:27:03 +0000
Received: by outflank-mailman (input) for mailman id 658849;
 Thu, 21 Dec 2023 11:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGHCg-0004xj-58
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 11:27:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db21d872-9ff3-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 12:26:59 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so85202f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 03:26:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfcc89000000b003368100ff71sm1823915wrj.10.2023.12.21.03.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 03:26:58 -0800 (PST)
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
X-Inumbo-ID: db21d872-9ff3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703158019; x=1703762819; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dAPwweKkh9LpRcC4wacWc47+s/V8mlNtmaAm1cBign8=;
        b=qbFeIQzkpkYvAbUnzPXTYUUOro9KG3Z01jIJuPVRiKHvhnWrdZdMyvOBboohZVsAN4
         luI8mEC30fQdhLRHnwGq6MqpvUg3bdfh0+htAeMKg40zlfVzePjDt+otvu9cHKqF3kZA
         RV9N+TQYn8G6CAnGnwLI2UaaEItX64I3OUl/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703158019; x=1703762819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAPwweKkh9LpRcC4wacWc47+s/V8mlNtmaAm1cBign8=;
        b=EfgngmqUF55ojYkIOrouYojKwDbYQaOqwoLoMJ3mFzs4ohBNLshUsjNtu4fYlCxeNX
         zlqa6KgRnM2EaiDBzAYPThzSdl09Mw+sanKmIfVvfR172HwtGWoihD4l9cB6H3rbdeGi
         U9ie8rsXN0c1XEdsxbS/f1z0UzoRZsvb51WQ8eBSAnunZW7MBHeUJfVEOaxIGH5Oa1TS
         h/rjKbIF1ul6H1w6jwzKB3+XdAZRk2GN+9cP1fZx4E1oeDuJmuSHRabUSwDOHDJYXk3V
         cD48czyIjcRDZRtz7TFgdyL8wcJ5m1kC7ODoX35zJIbd/P9DV0WfDAGME/4vVPxRlXHs
         xoQg==
X-Gm-Message-State: AOJu0Yxyu9/PZCT026/0y7EK7JOwLR4fejXuQUnjaGce2eiy4dj+JF6R
	gz1uZfBH4Owq2LpVSu7asPz33w==
X-Google-Smtp-Source: AGHT+IFWWsN+80ZpEupI44zeOoT79Wqk2FPtjSuERPWfpPycWPDrYYRunmc7TSIegJC5NLovJFiPdg==
X-Received: by 2002:a05:6000:11cc:b0:336:607f:5c9d with SMTP id i12-20020a05600011cc00b00336607f5c9dmr673748wrx.16.1703158019361;
        Thu, 21 Dec 2023 03:26:59 -0800 (PST)
Date: Thu, 21 Dec 2023 12:26:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/amd: extend CPU errata #1474 affected models
Message-ID: <ZYQhAhjl4LqyLMSH@macbook>
References: <20231221100831.25570-1-roger.pau@citrix.com>
 <213dc008-f8eb-4313-8b3e-17fc435416e1@citrix.com>
 <978e4603-f20b-481f-97bd-2a84de0800c8@suse.com>
 <6d8eb59c-5824-47b3-b2d0-24f1db96b367@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d8eb59c-5824-47b3-b2d0-24f1db96b367@citrix.com>

On Thu, Dec 21, 2023 at 10:24:55AM +0000, Andrew Cooper wrote:
> On 21/12/2023 10:20 am, Jan Beulich wrote:
> > On 21.12.2023 11:17, Andrew Cooper wrote:
> >> On 21/12/2023 10:08 am, Roger Pau Monne wrote:
> >>> Errata #1474has now been extended to cover models from family 17h ranges
> >> Extra space needed.  Can be fixed on commit.
> > Also (not just here) - isn't it "erratum" when we talk of just one?
> 
> Good point, yes.
> 
> I'll fix both.  (I'm just collecting some patches for a Gitlab CI run on
> Juergen's patches, and I'll include this one.)

Thanks, didn't know errata was plural and erratum was singular.  Will
try to remember.

Roger.

