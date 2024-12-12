Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729C9EE26E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 10:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855584.1268444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLfHk-0002i2-1Y; Thu, 12 Dec 2024 09:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855584.1268444; Thu, 12 Dec 2024 09:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLfHj-0002fR-VD; Thu, 12 Dec 2024 09:15:03 +0000
Received: by outflank-mailman (input) for mailman id 855584;
 Thu, 12 Dec 2024 09:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLfHi-0002fJ-HT
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 09:15:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b4dd63-b869-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 10:15:01 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso440609a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 01:15:01 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3c1f99b84sm8840402a12.11.2024.12.12.01.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 01:15:00 -0800 (PST)
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
X-Inumbo-ID: 90b4dd63-b869-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733994900; x=1734599700; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7igillvt6e+KKJzLmDEmwnXw1c3sNqc3sgGDnKwaTM=;
        b=UHWfGOSQ4aTe78RG7qBWAsTvFCUAKUeoG9aa5JfSKgrlHMumyujP3xVqy6l9ntcEQj
         jBNKD0WJt8cl+cBk9y74XsQVUcfm1Hblbr0j7KkAM2UxFNkDtWrdWkKsG23MePV7Ymu4
         Y+chU4/x9IRD3tFcvDFEHL8lKLoAmsADpWLDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733994900; x=1734599700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7igillvt6e+KKJzLmDEmwnXw1c3sNqc3sgGDnKwaTM=;
        b=Jwzqg96IeCmfilhg1tn7UvJGTrcU/YAfmX8v0NfKmzlwZpsBA5vy46zQ88c8H7Al9r
         kMk60Elu/iEPDyr6K7lvnYjLHSO93YW1jZVV/EDdNCkE7hD1hNVNL2Smks7RhQoVbNqs
         P8Zt+6Iuwv2zG11yyvL1M/HgzHp8HmhXeMpkzXAj0QlD9iOAyyqJTTbWdHaRBjtYmIqm
         neqmpDHxmlKOda51n4/pdNZF6dNCKYfUYfh1kXljuA0WD3lOJB4ZKAL3Lq9y5yGNELTV
         aPsK/dLKPHpbqQxhsVsAiG8jVoARj35OnCLQnR0SIZefaig9TpZ6sWa2+AS3bZU6DGxl
         A+7w==
X-Gm-Message-State: AOJu0YyVrb7jDSKgibxORLqhPKnnbGVKmuxPlgBuVu7Bj92ntqVB1eOT
	zfsL9jWOvlx3wE73F83cIgT1HVeWYqNP4AmVTwMoRHUVbertZkDXE99DmX8IuLUBxVgw61BT0NH
	Z
X-Gm-Gg: ASbGnctEuvgWbeXlKINwK3RK0MTpc73aIY5k0VSYKp+56PrdGsCe1ijZijXGzgPlj9H
	n6ZTLmFBWS1Kd2cSIuYIka9/KQvZEeZgeE8CfXiJBKZRLbESHx3ADs+4PTOVQvyH2/D1NEmAbN5
	3vszcC8UROq0RgxL9Yl677nDFarw/M4SWERcbF4N2NCyRHSYCccuAPwgqPfvNfLfszMGR4h22dX
	mOZYQJIOXCi7eNGGmRyd1w769MoQKMc1fBSnU62VlzmdyVAn/+aPvkjmB/xwHuBCQ==
X-Google-Smtp-Source: AGHT+IHpxfmtLt3O2pXYipKFquDT2QjuDKum3ecVVWyZFkR7oDl4PitWBC+DHqWN2iaBQMUtul5F1g==
X-Received: by 2002:a05:6402:3227:b0:5d0:d492:970b with SMTP id 4fb4d7f45d1cf-5d4e6a6e7demr422195a12.0.1733994900562;
        Thu, 12 Dec 2024 01:15:00 -0800 (PST)
Date: Thu, 12 Dec 2024 10:14:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
Message-ID: <Z1qpk55qKBywx26R@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce new printk() variant for convenient printouts which skip '(XEN)'
> prefix on xen console. This is needed for the case when physical console is
> owned by a domain w/ in-hypervisor UART emulation enabled.

IIRC the ns8250 can only send or receive one byte (character) at a
time, so you should likely put that on the console as soon as it's
received?

For the hardware domain we explicitly don't buffer writes to the
console (see guest_console_write() hardware domain special handling).

I wonder however how you deal with domains that don't have the console
focus (ie: != console_rx), as for those I think you still want to use
the (d<domid>) prefix?

Thanks, Roger.

