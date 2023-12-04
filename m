Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60614803727
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647043.1009744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA9I-0004Sw-QT; Mon, 04 Dec 2023 14:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647043.1009744; Mon, 04 Dec 2023 14:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA9I-0004QQ-Nc; Mon, 04 Dec 2023 14:42:16 +0000
Received: by outflank-mailman (input) for mailman id 647043;
 Mon, 04 Dec 2023 14:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lk/=HP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rAA9H-0004QI-Q1
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:42:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff058d9-92b3-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:42:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c0f3a7717so2667615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:42:13 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b0040b3e79bad3sm15222486wmq.40.2023.12.04.06.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:42:12 -0800 (PST)
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
X-Inumbo-ID: 4ff058d9-92b3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701700933; x=1702305733; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJlNr3OkKwgMfdXnSpyltT2DWzPEGhXETLbh84JRuew=;
        b=jzszGPe42V9JgAOY+81Qjy/oZTNc8oKGCXmvtY+JsfO5TVXtl5KSXowsZUek6gYVzg
         c96//tCWp9kXz2kBR1KktCxVoPDSk9hCrPt5lU+0SxdjUFcTO2laqFJQA64cvzgpkT3O
         hTHzltLZWxYbYqDnQtG2hG46u8rkJttoO1dQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700933; x=1702305733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJlNr3OkKwgMfdXnSpyltT2DWzPEGhXETLbh84JRuew=;
        b=bnHr3RMvDNRJQKMr+iNIgSEUnLXYQ05rKiQICB4Qyyt1VTgbhteXzecTg7rRrCRKN6
         FxQE1k4CYFuHGCzMidUVvdGW71ExhcfF0uuLWh4zj4sFMir3WGLbPlHyaTRgRIOtbSAz
         vrhTpzEr9DxAlDv1Y6O92D2Sw1tqvFpmm1cuXTpfwl/AHedL6OmmgKM2Qs6QZC+o/s3+
         XT5JTxFBl1PIaXmAeU5pUWCpuDPG3oYYcHZPa1o3ajDgVSjyIjoOpeofq/lrGPbeF3PO
         ea9k9D3xldVML/fw8nkJ5C0NgrAvxOTzZEOH2lF/iP2YfL38T5YtV3MFnEXePYZLlHsD
         tw/w==
X-Gm-Message-State: AOJu0YwGKRyuPWC/ZP+EBCxIHuIa9ub+owYVMJ2qrXAlAAa6Xz4sBhmC
	HpJ1QIpCcyrLGk9qDmQOcDZJlg==
X-Google-Smtp-Source: AGHT+IENQ2rUsGiV/eS3db5Pr1Dw/vxx9UEllyOIHQBhxXK38j4LEkhnwo2k1YVB7jTw9m5svHCqDA==
X-Received: by 2002:a05:600c:4f06:b0:40b:5401:f02 with SMTP id l6-20020a05600c4f0600b0040b54010f02mr1400920wmq.32.1701700932920;
        Mon, 04 Dec 2023 06:42:12 -0800 (PST)
Date: Mon, 4 Dec 2023 14:42:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [linux-linus test] 183981: regressions - FAIL
Message-ID: <b80a2f3c-0cba-402b-b59b-4c386cbe1a59@perard>
References: <osstest-183981-mainreport@xen.org>
 <f4e9a8ee-fae6-4d44-b99b-61b2aa6054bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e9a8ee-fae6-4d44-b99b-61b2aa6054bf@suse.com>

On Mon, Dec 04, 2023 at 06:56:50AM +0100, Juergen Gross wrote:
> On 04.12.23 00:51, osstest service owner wrote:
> > flight 183981 linux-linus real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/183981/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   build-i386-pvops              6 kernel-build             fail REGR. vs. 183973
> 
> This test is nonsense. We don't support running on a Pentium-Pro, which is the
> configured processor for the kernel.
> 
> We should do a 32-bit build using a more recent processor model.

That's Linux doing, that's the default model. osstest doesn't change it
or select anything in particular.

Cheers,

-- 
Anthony PERARD

