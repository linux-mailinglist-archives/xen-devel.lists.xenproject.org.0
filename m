Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB277E1893
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 03:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627725.978543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzpHy-00073b-3W; Mon, 06 Nov 2023 02:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627725.978543; Mon, 06 Nov 2023 02:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzpHy-00071v-0S; Mon, 06 Nov 2023 02:24:30 +0000
Received: by outflank-mailman (input) for mailman id 627725;
 Mon, 06 Nov 2023 02:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FDE=GT=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qzpHx-00071U-62
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 02:24:29 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5ce600-7c4b-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 03:24:26 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so3766658b3a.0
 for <xen-devel@lists.xenproject.org>; Sun, 05 Nov 2023 18:24:25 -0800 (PST)
Received: from leoy-huanghe.lan ([98.98.115.250])
 by smtp.gmail.com with ESMTPSA id
 iw9-20020a170903044900b001c465bedaccsm4763179plb.83.2023.11.05.18.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 18:24:23 -0800 (PST)
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
X-Inumbo-ID: 9a5ce600-7c4b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699237464; x=1699842264; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwH//0tqxHHApavRRGpIf4b9WQrVS9xDl1w7EkYp1gY=;
        b=SvSRKWH+2oIHp0z33gy3FUjLtvSBLy/V62MJLycLjA9ukV+0ckvJEZGebHHjddzeaP
         KDHbiVQ/WzoPJtxGXbnAer+rKT9edwU87i7k+QqsLQcacguowZfhE1uNVjvO8mzpz0oS
         vRxtKqmpxyHJmTN5U4nWITakX4xxR+fZMdTf0eUmt1yLyclbM2zjbbtYBnZrnrtEDbWl
         Dt+R5dYhUd/mBNxdJgjrV91yff92ZSTnD4I8uRjddtNtVqKsjgGzvZMlCOgOeqyjfw1b
         OrDkts0yA8GN7uSlm1lt+uwpocDLJZKNZK4mFKafKjo5e23jhDH82pfbcWpFeha8eylG
         ux8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699237464; x=1699842264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwH//0tqxHHApavRRGpIf4b9WQrVS9xDl1w7EkYp1gY=;
        b=gxkrwtDU7xQq/nx9/cI4imux/pUbXrugHDrGYExLPhDKw7J9iokMUAB4SHD9DSWrfW
         ezD/g4u7B0PbWl+iUtIH7uovIWiJJkxA2cax39gI912j2bCYRzoCa/B6dLzr08OqkFqQ
         CuHpGo9CI41AjtGrORwAyyQIWCsE3ShkJ4Qn/QoZu9WTNYIwWxTvWXvTnbs3jHqyaRhR
         ynWfk4sJL9bKmDzh8erVHySPgd7oHHymKup/1F1FpRJNdiGiwl31+V3TKV1TfOQFeiVn
         E8Jl4QL8w3Di9erd2Vh0u5qwLwrOy8N708AyBLwaNiEXV95NEB/8hsyVfmtMd0B2RDw1
         PPJw==
X-Gm-Message-State: AOJu0Yy6gF+tR+7Sh74dJmIFbi05d403X+TXZPS7xii3fSLXauYYSz80
	evaw5F/p46uEh69lZeMEKbnQcSlJIR/Bnfsk4sk4bCa+
X-Google-Smtp-Source: AGHT+IHSePs2SWQZsbdsNkbRZudcL6u7bqkO4cpOPp1iYzZO2TS19ZS8Ug7yn+pvGtHihYJeyHnSGQ==
X-Received: by 2002:a05:6a21:189:b0:181:6bde:72aa with SMTP id le9-20020a056a21018900b001816bde72aamr13917470pzb.42.1699237464123;
        Sun, 05 Nov 2023 18:24:24 -0800 (PST)
Date: Mon, 6 Nov 2023 10:24:19 +0800
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
Message-ID: <20231106022419.GB90848@leoy-huanghe.lan>
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

Hi all,

On Wed, Oct 18, 2023 at 07:11:11PM +0100, Julien Grall wrote:

[...]

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

I saw Julien's patch "docs/arm: Document where Xen should be loaded in
memory" has landed on the staging branch [1].

Should I respin this patch set and update the document to 10TB
limitation?  I need maintainer's sugguestion, otherwise I don't know
how to proceed for this patch set.

Thanks,
Leo

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=5415b2b2118bd78d8a04f276a8312f7f0cb1a466

