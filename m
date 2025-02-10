Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47553A2EA61
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884715.1294455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRYg-0003fS-Tc; Mon, 10 Feb 2025 11:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884715.1294455; Mon, 10 Feb 2025 11:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRYg-0003dC-R4; Mon, 10 Feb 2025 11:02:34 +0000
Received: by outflank-mailman (input) for mailman id 884715;
 Mon, 10 Feb 2025 11:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uJm=VB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thRYe-0003bn-Ts
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:02:32 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f0a1ca-e79e-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:02:31 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso103133345ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 03:02:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f368b27f9sm75402035ad.228.2025.02.10.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 03:02:29 -0800 (PST)
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
X-Inumbo-ID: 85f0a1ca-e79e-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739185350; x=1739790150; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0E2911qQtzLcW/iVaNqeHmqi7FTvFgYaHq2Jd03vCtM=;
        b=nXl3SMg9oOGfLKXd04M2YPscWctfn471DJJiOQDcGnseRTPkQVDPktmArJCiV+EdQ2
         cTcUX8iNclhfwoOjw2jmMCd3PvuyUBMlW6wiyOPtH1JcOMo/v8IKymuwiHRCJjLfcNkQ
         c3SbKntlO0QOESiNbRwKbOb3qFwKcMCSsnYko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185350; x=1739790150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0E2911qQtzLcW/iVaNqeHmqi7FTvFgYaHq2Jd03vCtM=;
        b=dWEoKUH/GY2cVYLLQnV6HHlRqiMhPm5lZ4CN4acm6I4vtuT7AbLJZ16DOgu+JeL7OA
         SqXilfQKJgB3q/aEOCrWm1FqgECPRG1XexArRUMpDD+CBk05qoZQUWtMAF8rXNFDnKWR
         f2tjlL95tFzDC+vTBV5ab9FAkh48+8OAhBJMMNCza5+h7l7/kDlM834/SEvOzbPJ8/qZ
         HMCue4cHnhuV0l1MNrVbqXS7HX21dooI2daoBSbHbE2XeqGaBU+g0qq1Zk2PVe7gQu/F
         3fYxaXLkOttNax3HU0MgFCWmB/FWWTPIL4MIf7DC9mDr8IF9BUCy80ybi3p6uMp/sAD1
         2+9Q==
X-Gm-Message-State: AOJu0Yzt79hDhx5GlfH6k7K74mpVyTc/FyzLyrZLKHCRtvNDRAN5ykEC
	C+tuE2QkSjtWlKPqECVG3+Zx9JLvM/a8iXBkX+2WNaE+Od0hHAWbUWh/lL4qgJ0=
X-Gm-Gg: ASbGncv5U3qdyztnCvcFhS1htbR++g9HyFSSGk3Hvv5/11oAl/53p2LBL/2Tt6QJVTs
	MNC3CifyP0RnpXNc+46LKRGafY4Wkqq3xyhtU6LKtRUVFID2g2mMz07vYGaXS0oCen6tCmeF1Ix
	2Dz6dHL+s8vg9P6essBbb6FMnBsY5gdNEubiacg/h4RAKQh2GI8aaZh472EVtA79q6i5duhYa2x
	DOQqJ7vgoqOxFkbZ9CI3gwB+jxEQbDejgs3gcPC1FNf/3MmxpMePTm5QEF20BWFqtZUwTT2lIVl
	lyNW3yJ2Emp7skza6w0L
X-Google-Smtp-Source: AGHT+IGBUavdE3sg+CKMw06whBYufkMtfXq6rvbLDfNyp8nG43TP413p9SfeoYUUn7EKAxqz/7ReFw==
X-Received: by 2002:a17:902:ce03:b0:216:55a1:35a with SMTP id d9443c01a7336-21f4e727a5dmr239605525ad.30.1739185350281;
        Mon, 10 Feb 2025 03:02:30 -0800 (PST)
Date: Mon, 10 Feb 2025 12:02:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 for-4.21 4/4] PCI: drop pci_segments_init()
Message-ID: <Z6ncwQeSoyAFh5wc@macbook.local>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <b7b148fc-ee74-4f02-9dab-f80b1707e44e@suse.com>
 <Z6TQiP7142UON90W@macbook.local>
 <6fb62cba-0f02-4692-b9b1-5b6d3bc00dc1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fb62cba-0f02-4692-b9b1-5b6d3bc00dc1@suse.com>

On Mon, Feb 10, 2025 at 11:01:04AM +0100, Jan Beulich wrote:
> On 06.02.2025 16:08, Roger Pau Monné wrote:
> > On Tue, Feb 04, 2025 at 02:04:35PM +0100, Jan Beulich wrote:
> >> Have callers invoke pci_add_segment() directly instead: With radix tree
> >> initialization moved out of the function, its name isn't quite
> >> describing anymore what it actually does.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > IMO I would rather not add the segment here, and just make sure that
> > all callers that add segments have proper error reporting when it
> > fails.
> 
> Maybe. Yet then things may (on x86) work fine with secondary segments not
> properly working. A log from one of the few multi-segment systems that I
> had seen data from suggested that none of the devices on the secondary
> segment were actually used by anything. This was, if I'm not mistaken,
> the underlying reason why (on x86) we demand segment 0 to have proper
> representation, but do things best effort only for other segments. Which
> isn't to say that we can't change things and do better.
> 
> >  Maybe alloc_pseg() should gain a printk on failure?
> 
> Not sure that would buy us much, especially if (on x86) it's seg 0 which
> is affected.
> 
> For the patch at hand - do you then suggest to simply drop it? The plan
> here wasn't to re-work what we do, just tidy slightly how we do things.

I feel like acpi_mmcfg_init() is an obscure place to do this.  It
won't be strange to shuffle that call around and forgot it's also
adding segment 0.

I would prefer if such allocation of segment 0 was done in
__start_xen(), as that makes it much easier to identify dependencies
and prevent such kind of re-ordering mistakes.

Thanks, Roger.

