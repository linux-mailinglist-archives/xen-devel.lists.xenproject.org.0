Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C697E2220
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 13:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627959.978908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyyg-0000WH-Cj; Mon, 06 Nov 2023 12:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627959.978908; Mon, 06 Nov 2023 12:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyyg-0000Ty-A0; Mon, 06 Nov 2023 12:45:14 +0000
Received: by outflank-mailman (input) for mailman id 627959;
 Mon, 06 Nov 2023 12:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruOg=GT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qzyye-0000Ts-Uo
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 12:45:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c8343c-7ca2-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 13:45:11 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507bd64814fso5902863e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 04:45:11 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b003143867d2ebsm9424024wru.63.2023.11.06.04.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 04:45:10 -0800 (PST)
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
X-Inumbo-ID: 52c8343c-7ca2-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699274710; x=1699879510; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=usx5Hsk7mWMh4lWkYDs9TXFOgLGcxxcuxLNu4P9874k=;
        b=ug6cjbUt7DfUeO9+9kFInkIQYDSso9ZibbW0gVXE2JpxLjvi3QBsoXrqm4ynWNymm3
         6b92M9Zug5l7GBXKIug98lqKF7z2cDCX4JmEQR4tVzCIcfdE5S2x6eSz3PB33iDww33F
         5YJdDrtZvVcAIsECoHHK6rR9M2HGYoRgmij0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699274710; x=1699879510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usx5Hsk7mWMh4lWkYDs9TXFOgLGcxxcuxLNu4P9874k=;
        b=KkbZ26JagDK4CQqcziyTfu7cYMzr6blZXEWHWBpFduwawlTJM1MCBsHq95Xw3qe7IQ
         3mFPCJSXa9cqZW9ZufkxTl28MxyKHnqPf7MdXtKP37E/00N/IzoD6u6FDd1UO6Y0JqWs
         Tt5JxWevmRBimLdVzMUb3RjaqdsT11ClKidT9Y56XgLlv12eyuxWEDdapVZJSjQc/54G
         kOpP0QxlPtF8PEeGtCEGIxhawrWYGHK8TybnH2EWwxXq7Ym1FXUH3KF0941622guZtm6
         kg99S1Z5c/zF0DIwlLV0yVFPv4y2LjWhqM0lifz6BqSZkS2oo0uQT68uc5MGwWfyfvvH
         diew==
X-Gm-Message-State: AOJu0Yxo6LyGL6hWYkAQkOVFvTCJ2n8SFLZQb8E/dOwNoFrq1ODtPzNb
	MoYDTf6uAQm8y8mwBUWn1GulHQ==
X-Google-Smtp-Source: AGHT+IFryMJGAzVzqUtTYudtZjs8rh+qRp3ZQpK7ndi/LeeUre/QDrmAOe0roUv2yendfJRQoD+h3Q==
X-Received: by 2002:a05:6512:39c6:b0:507:ab58:7f7a with SMTP id k6-20020a05651239c600b00507ab587f7amr27700426lfu.10.1699274710595;
        Mon, 06 Nov 2023 04:45:10 -0800 (PST)
Date: Mon, 6 Nov 2023 13:45:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
Message-ID: <ZUjf1bZrlH8nsX-j@macbook>
References: <20231103194551.64448-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231103194551.64448-1-jandryuk@gmail.com>

On Fri, Nov 03, 2023 at 03:45:49PM -0400, Jason Andryuk wrote:
> These two patches refresh the bindings which have gone a little stale.
> I used two separate patches since the XSA-443 one may want backporting.

The XSA-443 one is only relevant for unstable and 4.18.  Stable
branches at the time of the XSA didn't get those fields added as it
would break the API.

Regards, Roger.

