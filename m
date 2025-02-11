Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B29A30898
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885327.1295124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thncK-0007vI-6G; Tue, 11 Feb 2025 10:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885327.1295124; Tue, 11 Feb 2025 10:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thncK-0007t4-2p; Tue, 11 Feb 2025 10:35:48 +0000
Received: by outflank-mailman (input) for mailman id 885327;
 Tue, 11 Feb 2025 10:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thncI-0007st-M3
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:35:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3b85a0c-e863-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:35:46 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29ebaeso6439815a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:35:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78aab804csm879835266b.3.2025.02.11.02.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:35:45 -0800 (PST)
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
X-Inumbo-ID: f3b85a0c-e863-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739270145; x=1739874945; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/SFCQScKIQTIzaiHXoERoQcjfy+188d5BAs/Dsu5H4w=;
        b=bCUHg7WyHPFFzTOJFjVgCAyXNJ/QgVXNpXYdDJkMTTP7UvDg8Bea/KlXr2CcLC7XbM
         wVA0VeLpJT7l8BV7gQNw0LeeVWa91/NemGah1ZQubBAesl2GHfDfJW7yYdjBcDSCjaaI
         KIQhTNnaI3k9ajriuvaUNTSk96wtrEUaMLcas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270145; x=1739874945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SFCQScKIQTIzaiHXoERoQcjfy+188d5BAs/Dsu5H4w=;
        b=M4ux8KIxEja09wyQuryA/62a+HYo3V2yVLepQKcJYPwSQ8MjFQPXd5zk60chvBszXH
         9QXqD5k1QSyOhTUrl0Mouh7AQ0W81n5vmyQ0ya5KddlVDOpmavUH0/w34M7XnhINHkKA
         9OMwx1kjiprcDyAtnftS3gQD+tDEGHP/EW7IzQPlWSlg0/yPLPndB3Stjhfw/hQPnE72
         hMUvtd0yZERhPTxwJPbbMYD2WiRGqSbPBtWaBrd97DKejM0/+73tC2ASH+UVSw9O0U3e
         3G6aksLiK0GWOospb1XrEGxqEI8zFdqO4nVLJZJ53bxuLvdO8PgpyZ6XDVIeMxiiAtHy
         XQYQ==
X-Gm-Message-State: AOJu0YytZ9DNWW6DhbaiNewzI9nDwP71TCsmCMSaoUbmwB+scFlyxc7z
	NATd7KgrDDTpNzxOaD5f5wMEpBF72oKuzXf07OKOHqQMzKgTShrOGpUOF2BgWvw=
X-Gm-Gg: ASbGncvp64B9BQ/H/dnPb1SfdZqN+qBjGIIPbc0h6TQyb/gnHh8204wvUVwPnsGYOXz
	DJivsG8eSzsMRw4Rc1x4uqXfZCIHGLQSAtFWAFjXwG3ybw0RQwQuyKO2JBPhbQ+F91HvyQrGRSr
	LrMIOHntgJQZ5B4OU6fNtkj9HPVP99PlCoCTR0uEj4Ju4DIWgXT/ntVB3jhmbC2sLH1ehc44oII
	L1Infb/9DgNEmg8fEyV6oRCMPkiOJbbHZyknUa9Ca+I7OPsmaK2TI0jcPyp5Mwzf4ac4P39RYtM
	V+pYKBtg2Jfq5mPUbRHA1RYYOg==
X-Google-Smtp-Source: AGHT+IEa3XYnlEzC28UeKVzOFbjrNfogyG7dHQUswp2QGX7DZSiSnQwOMaxmCvUdP2V6Cyt1r/B5hA==
X-Received: by 2002:a17:907:869f:b0:ab7:e811:de86 with SMTP id a640c23a62f3a-ab7e811f341mr79906866b.13.1739270145467;
        Tue, 11 Feb 2025 02:35:45 -0800 (PST)
Date: Tue, 11 Feb 2025 11:35:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6soAEIPFbB23S3S@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <e70af3df-d581-4f6e-bfc1-55484eff5d40@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e70af3df-d581-4f6e-bfc1-55484eff5d40@suse.com>

On Tue, Feb 11, 2025 at 11:14:55AM +0100, Jan Beulich wrote:
> On 11.02.2025 10:01, Roger Pau Monné wrote:
> > Is it possible for clang-format to be applied exclusively to newly
> > added chunks of code, while keeping the surroundings untouched?
> 
> I, too, was wondering about this, at least as a data point. However,
> especially for files that aren't in a single style (e.g. where we're
> slowly transitioning from Linux to Xen style) this would then mean
> (at least) three styles in a single file.

My expectation is that the proposed clang-format based style will be
very close to the current Xen style.  Maybe that's unrealistic, that's
why I requested a list of differences between our current coding style
and what clang-format can do.

Thanks, Roger.

