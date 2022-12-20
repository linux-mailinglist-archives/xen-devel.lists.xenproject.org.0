Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F866059E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 18:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472830.733213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqS6-0007Bu-9D; Fri, 06 Jan 2023 17:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472830.733213; Fri, 06 Jan 2023 17:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDqS6-00079r-6O; Fri, 06 Jan 2023 17:24:22 +0000
Received: by outflank-mailman (input) for mailman id 472830;
 Fri, 06 Jan 2023 17:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnAh=5D=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pDqS4-00079l-Bp
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 17:24:20 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f38434da-8de6-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 18:24:19 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id d15so2305571pls.6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 09:24:19 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a170902784100b0017f74cab9eesm1198776pln.128.2023.01.06.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:24:17 -0800 (PST)
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
X-Inumbo-ID: f38434da-8de6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S2NFXzGo9zbhDvyYpgSdnlq0/2Qb+GtlNnT0u3EMLTM=;
        b=DiSL6l2MsSAryJG7j0Z37LD17gArmltOyGPinT3NjqJv7lftzxLhm9IZXzrJkYHUDI
         BtipZeoVabBIAJAejC1MghunCM6HY4RIpjybcgIjhhZk0hEyQGcxke5XgPvKgpN50WOW
         QwjHYG3CU7gNCevU8jDJS3w7o5diAj8UP8u54p6Y5sP2Cpx+mVfLBgqk+yRdWWRb/5ty
         7NhWBQspkLacfubNTcOhegRsW2dpua7UpmDhM95Jqp1AF61AdjI06e9Sr/RTKf0mW2Gy
         bim3LBTTEsTWLMFQwf0M5I98KGza1Zq62zg9CQ4nkCs+vLs56M++PXc6NJb5cKN4lZxg
         5sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2NFXzGo9zbhDvyYpgSdnlq0/2Qb+GtlNnT0u3EMLTM=;
        b=U8PjYgyICUeEjwoB598hlf4Q9JbWeBLAFpooXKPMJ/6TA7FvimBSqYmyMdck1wZxzm
         /oTiiPr2QQjnaOGMJFVKYj63tR5dlUE5n8NTF0xy4K/oZU2xBR2jMpNO4stQIMlLFTA8
         U5Vx0FW7PIDV+JyFFM8X4h7cTtCHmL9Uudkbd9Bo1vsJc/ML8xufgPzK1kNAnZxi4cBg
         9us/npu4v7HlvzLxyPRZrO1cR4CAttvRZstVktwXI6KscO4caSO4mbwppc9wgR2u7qHr
         p/uz87jVd+vHnz2C3m9NuI0Lgmi71T4wTwVI7nCjfmChJ72V7TEj7c0dg/0OcYnsyN+G
         DL2Q==
X-Gm-Message-State: AFqh2koqQPrJnukFeBZJL88bcPi8CKXaMhrUTSdHVH2VdvLjJzv90ipw
	w1nrvbPhYor8WquGKBEmvLk=
X-Google-Smtp-Source: AMrXdXsj7xV3yYdlyIF55ed/UL9hxZ2u0HQTV+FoImGHqTzFNiUJDr/MsyFpLaVnRy4S08wcgY0y8g==
X-Received: by 2002:a17:902:c643:b0:192:b6ca:200 with SMTP id s3-20020a170902c64300b00192b6ca0200mr22606994pls.3.1673025858004;
        Fri, 06 Jan 2023 09:24:18 -0800 (PST)
Date: Tue, 20 Dec 2022 06:50:04 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Message-ID: <Y6FbHB74Y6D3kvjH@bullseye>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
 <Y6FUy/F0mbrvRP3e@bullseye>
 <320cc1b3-f03f-ad87-205f-d3c5db446f7d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <320cc1b3-f03f-ad87-205f-d3c5db446f7d@citrix.com>

On Fri, Jan 06, 2023 at 05:16:31PM +0000, Andrew Cooper wrote:
> On 20/12/2022 6:23 am, Bobby Eshleman wrote:
> > On Fri, Jan 06, 2023 at 03:14:25PM +0200, Oleksii Kurochko wrote:
> >> The patch introduce sbi_putchar() SBI call which is necessary
> >> to implement initial early_printk
> >>
> > I think that it might be wise to start off with an alternative to
> > sbi_putchar() since it is already planned for deprecation. I realize
> > that this will require rework, but it is almost guaranteed that
> > early_printk() will break on future SBI implementations if using this
> > SBI call. IIRC, Xen/ARM's early printk looked like a reasonable analogy
> > for how it could work on RISC-V, IMHO.
> 
> Hmm, we're using it as a stopgap right now in CI so we can break
> "upstream RISC-V support" into manageable chunks.
> 
> So perhaps we want to forgo plumbing sbi_putchar() into early_printk() 
> (to avoid giving the impression that this will stay around in the
> future) and use sbi_putchar() directly for the hello world print.
> 
> Next, we focus on getting the real uart driver working along with real
> printk (rather than focusing on exceptions which was going to be the
> next task), and we can drop sbi_putchar() entirely.
> 
> Thoughts?
> 
> ~Andrew

That sounds like a reasonable approach to me.

Best,
Bobby

