Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8A929EEC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755236.1163543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkWm-0002sc-BZ; Mon, 08 Jul 2024 09:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755236.1163543; Mon, 08 Jul 2024 09:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkWm-0002pS-8C; Mon, 08 Jul 2024 09:19:20 +0000
Received: by outflank-mailman (input) for mailman id 755236;
 Mon, 08 Jul 2024 09:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkWk-0002pM-J2
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:19:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 265f625e-3d0b-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:19:17 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so2366572f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:19:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679224d11dsm13187822f8f.12.2024.07.08.02.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:19:16 -0700 (PDT)
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
X-Inumbo-ID: 265f625e-3d0b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720430356; x=1721035156; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=907Z54S6UmXau4ii5jNisVYSLnOO4pEEBgrS4WQYryg=;
        b=VXax0YWVXWOKppS/PwdtaPztPQCjsq5YyHvO4ZSVZgTAM6l6MM3uxT0su9coUm0xJp
         r41hSxHbCiMs9BMZUGoIAruCViLHq9nWRFVHE8HITMZJ7pqzOtd4h+2os6//hqX504Uh
         W7z53AbFKx0CYRE07lxxibd+xGTzuhhO5uOag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430356; x=1721035156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=907Z54S6UmXau4ii5jNisVYSLnOO4pEEBgrS4WQYryg=;
        b=u74cnTUXDNgXsU4K9d7iEQakisHnL2NilMJn4iXUulC7TihvX218iMMGCYz3tvp/YG
         zs80oB8ausnLoSSL5bas11iJXQ8f0QcwsSp3lD2GYIty2uAsZqmS3BP1HwP0bXWz1BqS
         Ebo1I7jKmPMctQ0orSfdb90TeoBxJXQXgoYdAMp5LrInSmMdagnB+P5zSY96T9QU776b
         ibxykHGdkLeaIpxdLDSRoj6HYJHGPqYz8CjFdBSVoW8PeZv/yoN0PeFWxDtnp++F8UIy
         r8jpl3LNpa/6QY3d2d4GaOivM12XcZGUwoRQvQkVD1MuCrzGCvsgenWkB31/ee1z51el
         UqVQ==
X-Gm-Message-State: AOJu0YzpjxKNIb6WH1pJxvDj74HxoTyB4AicUcnxv3u30uX3krJLT4Px
	rtqULo67yktSKTHdMFZLuuiwEuI4bxqNvAgG/1ywq/VCS0uak0OLYkO9HI5a1qo=
X-Google-Smtp-Source: AGHT+IGkYFRkMCvl6ax5KT/7nsH+F/d/0agvfZ2Y+bv+VMbrXvdDB7jO2EyfMuAHQ07wT/0KLbKSwA==
X-Received: by 2002:a05:6000:1a47:b0:367:4d9d:56a1 with SMTP id ffacd0b85a97d-3679dd656aemr7813724f8f.45.1720430356425;
        Mon, 08 Jul 2024 02:19:16 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:19:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 5/6] build: Drop libiconv as a build dependecy
Message-ID: <ZouvE-sjmSv54aRc@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705152037.1920276-6-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:36PM +0100, Andrew Cooper wrote:
> The final user was blktap2, removed in Xen 4.13.
> 
> Strip out the ./configure check for it, and stop explicitly installing it in
> the FreeBSD testing.
> 
> Fixes: 2a556b63a22d ("Drop blktap2")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

