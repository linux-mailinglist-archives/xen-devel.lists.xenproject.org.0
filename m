Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5637F5D27
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639603.997123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67SX-0000fu-9X; Thu, 23 Nov 2023 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639603.997123; Thu, 23 Nov 2023 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67SX-0000cu-6z; Thu, 23 Nov 2023 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 639603;
 Thu, 23 Nov 2023 11:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67SV-0000co-RK
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:01:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c3d28d-89ef-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:01:21 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b2a8c7ca9so5453525e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:01:21 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d4143000000b0032da49e18fasm1345773wrq.23.2023.11.23.03.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 03:01:20 -0800 (PST)
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
X-Inumbo-ID: a2c3d28d-89ef-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700737281; x=1701342081; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6yOGpr9VNzvCQ7TNZKN7MLKqYhKwCJDutMIuuxXPAs=;
        b=IYaYXdDtCanyDfiPBnj0M29f8PfQNmYE/UczFdC+IZjf3YL3bIPj22HDxnbiMKF8Jn
         3eoYbQ4bI2LWJ+PS7RcbaWDyWn9eCr8KuDrxV2+uvpUC6I1ATm/uwlpF65JCbHnvACOJ
         rUIgplrd8dsn1dhaqKFOjseK+Od4r167c7rzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700737281; x=1701342081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6yOGpr9VNzvCQ7TNZKN7MLKqYhKwCJDutMIuuxXPAs=;
        b=NPjQ5VyCwnowBFBNzjhwP/iSg4vpHfZGfs6R8h0x6G+zhyKdEwncMJIQnumI8bgmHn
         G3KqCJ+YcNcxQpanNPRV8RmBsPB8dard2k/AkO9pwv4OrjkWxpDASshkLaF/xabivYO8
         GT41Z72dWtNIRMHpOGCvEZECFGHTPkSO63SQArgkzuAjXb9WCTGsvsjzI6s8hKHdEgKg
         7uaG6QnuwMZsH0pEsx/xEWzrzbsT7otxQmP6jK54WWDFzEOoVwADWhsBLZ9B7xFyaYui
         paArmRIaYsYStL2UE58dEZZrn7tokQHMrVQ9qAsrv47EY+OeV6SFyf+uNj97Nzggyw8G
         uyyQ==
X-Gm-Message-State: AOJu0YxA75O3caniWGby/L/+pziK66lQW7gbBvpn4vepRTdIunkqDf+U
	HSlBhpiuDI6R3PXKQlmInn0DKw==
X-Google-Smtp-Source: AGHT+IFl3GlJa5Yiz5u9iEEHD6NNyV39g92zNr6aYCydmB/787BSgCXn8I5umQpn6/pMz1UQNXZqHg==
X-Received: by 2002:a05:600c:3516:b0:409:79df:7f9c with SMTP id h22-20020a05600c351600b0040979df7f9cmr2146439wmq.36.1700737281160;
        Thu, 23 Nov 2023 03:01:21 -0800 (PST)
Date: Thu, 23 Nov 2023 12:01:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/HVM: limit upcall vector related verbosity
Message-ID: <ZV8xAJjVH5hxz9VV@macbook>
References: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
 <ZV8tueH53FROk86e@macbook>
 <f52395ef-5995-46fa-8dc2-6b49b3d79ccc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f52395ef-5995-46fa-8dc2-6b49b3d79ccc@suse.com>

On Thu, Nov 23, 2023 at 11:50:41AM +0100, Jan Beulich wrote:
> On 23.11.2023 11:47, Roger Pau Monné wrote:
> > On Thu, Nov 23, 2023 at 11:25:34AM +0100, Jan Beulich wrote:
> >> Avoid logging all-identical messages for every vCPU, but make sure to
> >> log unusual events like the vector differing from vCPU 0's (note that
> >> the respective condition also makes sure vCPU 0 itself will have the
> >> vector setting logged), or it changing after it was once set. (Arguably
> >> a downside is that some vCPU not having its vector set would no longer
> >> be recognizable from the logs. But I think that's tolerable as
> >> sufficiently unlikely outside of people actively fiddling with related
> >> code.)
> > 
> > Maybe we could consider printing unconditionally for debug builds?
> 
> Indeed I was considering that, but it's primarily debug builds where the
> unnecessary redundancy is annoying me. (After all I work with debug builds
> much more than with release ones.)

I did find the message useful when doing guest bringup in the past, in
order to know the guest was correctly setting up the vector callbacks.

I guess there are other ways to figure that out, or the message could
be added when people is doing bringup themselves.

I find the save/restore messages during domain create much more
unhelpful and annoying that this.

Thanks, Roger.

