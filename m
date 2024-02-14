Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638A854437
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 09:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680262.1058272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAu0-0003Dz-JI; Wed, 14 Feb 2024 08:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680262.1058272; Wed, 14 Feb 2024 08:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAu0-0003Cd-GM; Wed, 14 Feb 2024 08:46:00 +0000
Received: by outflank-mailman (input) for mailman id 680262;
 Wed, 14 Feb 2024 08:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raAtz-0003CX-DW
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 08:45:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 792ba0bb-cb15-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 09:45:58 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3394b892691so328748f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 00:45:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 63-20020a250b42000000b00dc6f4c19d93sm434175ybl.7.2024.02.14.00.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 00:45:57 -0800 (PST)
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
X-Inumbo-ID: 792ba0bb-cb15-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707900358; x=1708505158; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfAI7cQQVOxHv9jurTTv0zzrNIKmWJ0ubUC7DbbAu64=;
        b=SCX6ShSqDq7eHbiQ0OYF65rjsmo7rL8RyE392PPpt0nSgMMTOC2R/aIx/sWvaS1xCF
         YG3hsSVNEPxWQEwJP6pgeuaLlU95uarDq8qvRyEHHmieML4OD/exEhpJqNLUiWybCYQu
         wFOQFHpyPGXCpRd/cx1AqbuUQygRHeFxRIy+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900358; x=1708505158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfAI7cQQVOxHv9jurTTv0zzrNIKmWJ0ubUC7DbbAu64=;
        b=o+RAlSvINeC65C6uFWFc+QrilYcvgySY60jhSw3Z3+8StZLvvXyyfyrsofgXfK4Kb1
         lKR+c/XPhImCcSEn6/Me3jpaUb0tNcr8yhOAdV0aPe7o/C6Fuh8gwH+D8IsZ65X61wT1
         FkWY7CtyeGiKh2SeIH6ntTrdpGZ/3gELvLSEy91dBXraoGHu0YYHSqs6nXCGkCvPR32x
         lU6u8bFavLkiiIBalax4YBKTlN3U++p9OZEAUwYie+c0u1VdKEdANdfXeD2NIR8L08V5
         kydC8zMuNw3PwQD8mYjY5Hh3AU5JVOwAt6YZJrgsaDwo65FdMJu3UFnWW6ubKpduUi7n
         O9XA==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ8vbYliviTk0PwGgO8FGBfWwPBlBded3/JtFtm8k/xPRsAMIXTjjx3jaL9jdeJ9bqpVvIkpcE9Z7zyN3qzQ84Jiryj+BMympZqTUaoo=
X-Gm-Message-State: AOJu0Yx9x5ihoXE8C6Go1FZsttyMG/R87PdI2pAzAjUrasf11M6Qd5ol
	LTracUSL79YaHXd56tqVtYnsfAI9vT1Tso+cYcFZ5hMo3FeIUR9DEUxOxxcviFo=
X-Google-Smtp-Source: AGHT+IHby6RD/J6D0zkIY7ePysX4BDBO1uavDgUwY4RnR4fbOWJEBOS/OgbdKnR/+jioIU9IbfbPpg==
X-Received: by 2002:a5d:44cd:0:b0:33c:e395:bd8c with SMTP id z13-20020a5d44cd000000b0033ce395bd8cmr1194547wrr.7.1707900357810;
        Wed, 14 Feb 2024 00:45:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7aKGKIH1ppKlzjvGI4dLNho4ZRO1XHBF7632bexTgtKFLvT1Jiroi8o2zAYFGxPNDw78xB8zp2/XE7Amz8Wo4eK/c4CEXdPxWjsB1uDaH2+rVR7FArKusz6+XA6zoaFp2Jmf+
Date: Wed, 14 Feb 2024 09:45:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common
 RMRR checker
Message-ID: <Zcx9w5eZkXiN9s66@macbook>
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com>

On Wed, Feb 14, 2024 at 08:45:28AM +0100, Jan Beulich wrote:
> On 13.02.2024 23:37, Andrew Cooper wrote:
> > On 12/02/2024 2:38 pm, Jan Beulich wrote:
> >> On 07.02.2024 16:34, Roger Pau Monne wrote:
> >>> Use the newly introduced generic unity map checker.
> >>>
> >>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
> >>> ranges would end up being mapped anyway even if some of the checks above
> >>> failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
> >>> is not supported for PVH, and it's deprecated.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > XenRT says no.
> > 
> > It's not clear exactly what's going on here, but the latest resync with
> > staging (covering only today's pushed changes) suffered 4 failures to
> > boot, on a mix of Intel hardware (SNB, SKL, SKX and CLX).
> > 
> > All 4 triple-fault-like things where following a log message about an RMRR:
> > 
> > (XEN) RMRR: [0x0e8 ,0x0e8] is not (entirely) in reserved memory
> > 
> > not being in reserved memory.
> > 
> > 
> > First of all - fix this printk() to print full addresses, not frame
> > numbers.  It's obnoxious to cross reference with the E820.
> 
> Perhaps better indeed. The stray blank before the comma also wants dropping.
> And while looking over the patch again, "mfn_t addr;" also isn't very
> helpful - the variable would better be named mfn.

I can adjust those in the fix, see below.

> > It's very likely something in this series, but the link to Intel might
> > just be chance of which hardware got selected, and I've got no clue why
> > there's a reset with no further logging out of Xen...
> 
> I second this - even after looking closely at the patches again, I can't
> make a connection between them and the observed behavior. Didn't yet look
> at what, if anything, osstest may have to say. Do I understand correctly
> that the cited log messages are the last sign of life prior to the
> systems rebooting?

I've found it:

    for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )

Should be:

    for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )

mfn_add() doesn't modify the parameter.  Will see about making those
helpers __must_check in order to avoid this happening in the future.

