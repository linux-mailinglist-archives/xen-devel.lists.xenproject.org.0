Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC47CF424
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619053.963590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPRp-0003OF-T9; Thu, 19 Oct 2023 09:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619053.963590; Thu, 19 Oct 2023 09:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPRp-0003MY-QW; Thu, 19 Oct 2023 09:36:09 +0000
Received: by outflank-mailman (input) for mailman id 619053;
 Thu, 19 Oct 2023 09:36:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jD1O=GB=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qtPRo-0001qs-NZ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:36:08 +0000
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5cbd91-6e62-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:36:05 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35769ea3194so24529065ab.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 02:36:05 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.49.160])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a630e1e000000b0057ab7d42a4dsm1600327pgl.86.2023.10.19.02.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 02:36:03 -0700 (PDT)
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
X-Inumbo-ID: ec5cbd91-6e62-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697708164; x=1698312964; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdqJgLBhx/4PHuQvVCG22nsM5xfJw530V7pfQcH1O88=;
        b=ZUBSR1b37Xe3f2EragOqPou0m1zF2b4vkcql3cJhQvP/byBUjvju7bLmo18s4C4F+T
         LyLye5r5HEI4L07gukXdxnQI5XnOWoHcZBe++aK5JM94Ik0CitgGtTrXVS3mtChWrboq
         Dx7oD8zKzhnQRE6jMBdwSIKiM91XOomwk+OwSFi0bxj1dzfLi1CQa+VVesB5c2ZSLRx5
         4uiOULOBQKLG2ZCo4BIHqqhPCSYsRhVK/utTzseT38Xtp3AL9Q75yL12wfBPglMvaUlb
         Ynd6m6rP6G4YDkqYTZ/PbIw7YCg7vUUBKPRBJIW9WFH+44txIuaa0DmxbEygseDYyFZK
         GMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708164; x=1698312964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdqJgLBhx/4PHuQvVCG22nsM5xfJw530V7pfQcH1O88=;
        b=LzX/BWxzhF5lyesrUCsv+RmNJFPmn0UTPY/cW5EMX2ps15QthuK8EYDjFKfU9HCoa4
         eCUfr3axk9iEqKX44/ZWVn5gojDsK/qRxXcKqBLEa6Sw4mQ/q7EtBWhwighBTtXoM9kI
         +8h1entj8cEpE1lLExWm5mxmdhZQpBTxawdrWBtv4kzczEEweyD3Im8Jhglm1XxoEfQV
         5EQAtKN80JKZxOz6rjO+xz4ZAR42A9Lw9zZVr+TYiUt2i/ATpj76HIBZjA5uafYHXG4z
         QuFOcYO++C/KxewpDraqmQR7DUnVlJ0GvUpsNvOljT3Kw2ehjU2l8UznUiyv5s8kDp2o
         FREQ==
X-Gm-Message-State: AOJu0YxEM9zE9bIVzKPAAYrye6QjJEW0Q15x7U1909//UiK6YyjSxAsO
	asdZRTHUAe0fLjxk7UfO6KDQ9g==
X-Google-Smtp-Source: AGHT+IHCfV8gdk+EVjSvMvvFuFSmGng2zl5QGiH+9+7VosuVvz7YHfQqxfApgXuM+3y2Of9DxC0jqw==
X-Received: by 2002:a05:6e02:1be2:b0:357:5db1:9170 with SMTP id y2-20020a056e021be200b003575db19170mr2222585ilv.28.1697708164073;
        Thu, 19 Oct 2023 02:36:04 -0700 (PDT)
Date: Thu, 19 Oct 2023 17:35:59 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Message-ID: <20231019093559.GA105208@leoy-huanghe.lan>
References: <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
 <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>

Hi Julien,

On Wed, Oct 18, 2023 at 07:11:11PM +0100, Julien Grall wrote:
> On 18/10/2023 11:59, Julien Grall wrote:
> > On 17/10/2023 20:58, Stefano Stabellini wrote:

[...]

> > I don't really see the problem for someone to mistakenly backport this
> > patch. In fact, this could potentially save them a lot of debugging if
> > it happens that Xen is loaded above 2TB.
> > 
> > Anyway, both Bertrand and you seems to be against the Fixes tag here. So
> > I can compromise with the "This commit fixes...". However, can Bertrand
> > or you update process/send-patches.pandoc so it is clear for a
> > contributor when they should add Fixes tag (which BTW I still disagree
> > with but if the majority agrees, then I will not nack)?
> 
> We had a chat about this during the Arm maintainer calls. The disagreement
> boiled down to the fact that SUPPORT.md (or the documentation) doesn't say
> anything about whether loading Xen above 2TB was supported or not. Depending
> on the view, one could consider a bug or not.
> 
> Looking through the documentation, the best place to document might actually
> be misc/arm/booting.txt where we already have some requirements to boot Xen
> (such the binary must be entered in NS EL2 mode).
> 
> I will prepare a patch and send one.


I would like to check if here is anything specific I should follow up
on. Based on the discussion in this thread, I've come to the following
conclusions:

- Remove the fixes tags;
- Add a description in commit log, something like:
  "Since commit 1c78d76b67e1 ('xen/arm64: mm: Introduce helpers to
   prepare/enable/disable the identity mapping'), Xen will fail to boot
   up if it's loaded in memory above 2TB. This commit fixes the
   regression introduced by that commit."
- Add tages:
  A review tag from Michal Orzel
  A review tag from Bertrand Marquis
  A test tag from Henry Wang

Should I repin a new patch set to address the items mentioned above?

Another question is for the 'Release-acked-by' tag.  Henry gave this
tag, but I don't know how to handle it if I need to respin this patch.
Seems to me this is a special tag only for release process, so I don't
need to include it in the new patch, right?

Thanks all of you for the efforts on this patch set!

Leo

