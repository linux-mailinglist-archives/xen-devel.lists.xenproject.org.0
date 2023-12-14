Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E454812AAB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654330.1021131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhPI-0005Cy-7w; Thu, 14 Dec 2023 08:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654330.1021131; Thu, 14 Dec 2023 08:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhPI-0005An-4J; Thu, 14 Dec 2023 08:49:24 +0000
Received: by outflank-mailman (input) for mailman id 654330;
 Thu, 14 Dec 2023 08:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDhPG-00057s-UE
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:49:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acfc5e21-9a5d-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 09:49:22 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so1848605e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:49:22 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b0040c41846923sm17598276wmq.26.2023.12.14.00.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 00:49:21 -0800 (PST)
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
X-Inumbo-ID: acfc5e21-9a5d-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702543761; x=1703148561; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYuEGmqJ6YpOUBz/hMbORR4TaUC2bG8G25XQIxun79c=;
        b=fCrydjwwGc+k+aVxMuQcnTWKRPqUHcwzee+vjyPE+BtpbLQOmnZHwW9LePlD7L05N+
         hdxvig/uV6zeS2KV4Le3ru6EG0aGSjAtdmLOH/6DJoGQByYRb3xwtPHBkZgcvHrzL5KL
         xQl+AcFyyJRR8eeGSdbicdyWsS26Pu9u4mXSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543761; x=1703148561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYuEGmqJ6YpOUBz/hMbORR4TaUC2bG8G25XQIxun79c=;
        b=Ve5YqsZdp5InJfX1PpnZMFXVvVblEjd3Q+8uK+wSTINapJQpRWoQN+5g19ggaJyFwC
         Ah0tQ9e12eeTS83YygsdQjYb+gOGjz9shGnphMTgRKwm1C7GN3RtNjj4McvCz92wB4E8
         0fnthcoYK5yDXmrz3QXJswRD7PQ7X+0qlVF6ot9PpliepV84EomXuYqazsmpMNUDdnwa
         6QtplaU47UJCV/XGeOspd2Wn7/UEF7xXDGCvA3QShplqRxmKB5uXhelQh41KW9LIVSID
         YxGdl61M0yYWWBTknqFYKAOMtZEy2DP07mc2OyaXTfuymRGDQ2/At37iqbN6SlnuNPQg
         I5oA==
X-Gm-Message-State: AOJu0YxobtDxyZipQbpoK5xCrnGsVcv6IPViec5AE+mcjJHVy/ZyvC8c
	/ud2PzzSMGUen195LVULuH32xg==
X-Google-Smtp-Source: AGHT+IGw75Wux1guGc4p3VlwWQXOe0h0UtSytiy4soAbYZ0HvFJL1gj2aOGIUDnrLDfhopbsHPXWLA==
X-Received: by 2002:a05:600c:4f11:b0:40b:5e1f:c384 with SMTP id l17-20020a05600c4f1100b0040b5e1fc384mr5229593wmq.26.1702543761612;
        Thu, 14 Dec 2023 00:49:21 -0800 (PST)
Date: Thu, 14 Dec 2023 09:49:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] livepatch-build-tools: fix misuse of script directory as
 work directory
Message-ID: <ZXrBkJoFcgeLL2zL@macbook>
References: <20231213135147.6749-1-roger.pau@citrix.com>
 <794b304e-d11c-420b-91e9-4d226f492d93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <794b304e-d11c-420b-91e9-4d226f492d93@suse.com>

On Thu, Dec 14, 2023 at 09:19:35AM +0100, Jan Beulich wrote:
> On 13.12.2023 14:51, Roger Pau Monne wrote:
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -25,6 +25,7 @@
> >  # script.
> >  
> >  SCRIPTDIR="$(readlink -f $(dirname $(type -p $0)))"
> > +WORKDIR="$(readlink -f -- .)"
> 
> More for my own education than anything else: Isn't the (standard) pwd
> utility intended to be the "canonical" way of getting at the current
> directory? Its -P option (apparently what would be needed to match the
> -f used above) is also a standard one afaict.

Hm, yes, having looked at it `pwd -P` would also be fine.  I've used
readlink because that's what is used thorough the script.

Thanks, Roger.

