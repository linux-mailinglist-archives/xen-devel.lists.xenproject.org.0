Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF021929EBF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755203.1163503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkQk-0007xW-3X; Mon, 08 Jul 2024 09:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755203.1163503; Mon, 08 Jul 2024 09:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkQj-0007ub-VI; Mon, 08 Jul 2024 09:13:05 +0000
Received: by outflank-mailman (input) for mailman id 755203;
 Mon, 08 Jul 2024 09:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkQj-0007fh-3L
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:13:05 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a31b00-3d0a-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 11:13:03 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367818349a0so2023045f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:13:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678c379cc6sm14813789f8f.49.2024.07.08.02.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:13:02 -0700 (PDT)
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
X-Inumbo-ID: 47a31b00-3d0a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720429983; x=1721034783; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hde0+z5cy+SNFYD8C6F9LlHiW0ptjbdU4v7lfWTOk80=;
        b=UekagZ1kcXVxwzbYq5m3fJSHYa33Z7Hq7G0hF3gFCNvAKcxp2T82VoH9oAcKdrTqmG
         X+GbNlbFtqxE+MnBdZluC6xSAsJh9QlRLrHar57ULjHfW+s3AI947S7mquH8bn9ibWLA
         lpROJ/EGv5FY43l+dNshjNCxx4dZNm7lmCXDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429983; x=1721034783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hde0+z5cy+SNFYD8C6F9LlHiW0ptjbdU4v7lfWTOk80=;
        b=No4nsacDoPhUfZnwKS/zkGX2YoIboLqK/wczOyfwoI/WAddNHiRCvcGC3RvjrBf2TI
         MF4cJ2kO8VaRnRHyUwamWFYE+z2S8TbvVTPN43ZmSx3hAuFC86pJiwr/D+HRUVaDHEBK
         n4x0yWlIcqdAIvGi5po7wEqIaMuzmFH+GbYeZl4SmLnnruJ0mnSVV41CEW26kZCItu02
         5SmsBnRcTyHVYGFLbSEv3Ibd7Y/zpn9nbGOye0/mo2cu4Ql5gUuV9GHIOF0PT2l5EZGn
         iiaJP0WRCV4v2tlT3P/sKIuAWn+rJpq253sOLqKkdiLhkarJOqKEe8SvPRu3YZ2eU/dH
         h6RQ==
X-Gm-Message-State: AOJu0YzZjChcxl2+BHP6Y8BYPG1N5U+JOsfVxKDKhFaN83aS8QOjcGu8
	kocZ4+r8GokfSTm5mDhdmd0Jk1owwfZHYaXbgeHUSydwwoM3LX6jix+78ZjzLeA=
X-Google-Smtp-Source: AGHT+IEsrb/HMbR2mX6HtSca8odlFpaz+Z0gIt71FaBvHJ7LUTgvtQjjNyuG8iLftqHT99gVQD4JCQ==
X-Received: by 2002:adf:ea46:0:b0:367:947a:8e2b with SMTP id ffacd0b85a97d-3679dd336damr6101094f8f.36.1720429982769;
        Mon, 08 Jul 2024 02:13:02 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:13:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 2/6] build: Fix the version of python checked
 for by ./configure
Message-ID: <Zoutna1CuBMkpIrZ@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705152037.1920276-3-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:33PM +0100, Andrew Cooper wrote:
> We previously upped the minimum python version to 2.6, but neglected to
> reflect this in ./configure
> 
> Fixes: 2a353c048c68 ("tools: Don't use distutils in configure or Makefile")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the version in the commit log changed to 2.7 as noticed by Jan:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

