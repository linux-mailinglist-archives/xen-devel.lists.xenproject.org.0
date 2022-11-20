Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFC640E65
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 20:25:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452235.710051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Be5-0000qJ-BR; Fri, 02 Dec 2022 19:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452235.710051; Fri, 02 Dec 2022 19:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Be5-0000nl-8i; Fri, 02 Dec 2022 19:24:25 +0000
Received: by outflank-mailman (input) for mailman id 452235;
 Fri, 02 Dec 2022 19:24:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvrK=4A=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1p1Be4-0000nf-1Q
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 19:24:24 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8cd654-7276-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 20:24:21 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id 124so5830324pfy.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 11:24:21 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 n1-20020aa79841000000b00574ffc5976fsm1691296pfq.159.2022.12.02.11.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 11:24:18 -0800 (PST)
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
X-Inumbo-ID: eb8cd654-7276-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7zMQXLseO3+37CIy2MREKFVbfkVUmeJO5uifvTx69I=;
        b=k/oPhJVtEo1Z58kfrlfXxETwgKRQfAU+Lbjxk3xo+3NJrNnuslFfteDU0EE47TWEZs
         kX5fiFqbp52KgN10nxQ/VfIwDw/u83qhpimRfEvHZxdQPD2ffJxsytOrKZzV2KaWlPuC
         4aj9kqHrL5eYfOz7ED1p81HIHYvGDFZSmWbicqkrTRHmccqh93UVNB3rV+wPtlbJyV6s
         bVBdCnSMPYocbxKhqLwT7YN/p2MXmnaAns9YgaKALqPsgjltHsjDdttmRWjYZLiQvJOf
         x+/OBZbHdD01aYYQwTQk6rFlCyTpYAQFcVN4cgQnP5GwSntHsB+ZOi8mUGk+O7gd5DD7
         NKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7zMQXLseO3+37CIy2MREKFVbfkVUmeJO5uifvTx69I=;
        b=eMyBZj33yDWa2+6I1CvLIgByWqhv1Hpv7fkzrtcao3p2lipJmgSnhmcw/pQ7qhQBLR
         B3UQrZNAqx4QXzJ8wJ5I56jtN77ORdKcREfJd0Y85ommqR2gMB8eybE4TDxMOS6tZPbF
         FjllqeByl2MBiYtHjiJICg7LMbyRe507g27hQkJcq8Wit2DW/QNwcop6pcSPnrqspx6K
         qTQVxsGmSAWCrFKqtiURbiG20R+FCIppRYd9SF7IQahPLa+E6sDio/tuJ2AkKxbtfu3V
         4Mu6W4v2aWJyBOG++AufXdkqn/Gu82B/8Gc0JyG64/OyZ0L06y0x7YHwpGqD6Otb/QxM
         1O7g==
X-Gm-Message-State: ANoB5pno7tdjoTQME8opCyebrzXYbC4xbvdSLkIe00BA+SVDrWBMK9py
	7MQOFkOIXACAfZkm4YlHaKw=
X-Google-Smtp-Source: AA0mqf5fvoLb6vF3zNrUYRsPhNJtPYQn72WrC90pJndlxDQWaDiMJdnTP1uglqQ7KFcP4AtekwTdJA==
X-Received: by 2002:a63:ce10:0:b0:478:5e53:4742 with SMTP id y16-20020a63ce10000000b004785e534742mr12426956pgf.471.1670009059452;
        Fri, 02 Dec 2022 11:24:19 -0800 (PST)
Date: Sun, 20 Nov 2022 17:01:34 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"connojdavis@gmail.com" <connojdavis@gmail.com>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as
 a rhs operand of shift operator
Message-ID: <Y3pdbqojLiyQKUlz@bullseye>
References: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
 <1a42f92a-81e3-eba8-6831-900414e0e809@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a42f92a-81e3-eba8-6831-900414e0e809@citrix.com>

On Fri, Dec 02, 2022 at 12:56:06PM +0000, Andrew Cooper wrote:
> On 02/12/2022 12:35, Ayan Kumar Halder wrote:
> > Currently this change will not have any impact on the existing architectures.
> > The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs
> >
> > ------------------------------------------------
> > | Arch      |   PADDR_BITS    |   BITS_PER_LONG |
> > ------------------------------------------------
> > | Arm_64    |   48            |   64            |
> > | Arm_32    |   40            |   32            |
> > | RISCV_64  |   Don't know    |   64            |
> 
> Just FYI, I think the answer here is 56 for RISC-V.
> 
> ~Andrew
> 

Andrew got it: 56.

