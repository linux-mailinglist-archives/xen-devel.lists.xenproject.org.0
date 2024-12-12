Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D569EEB8A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 16:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856164.1268885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLl4L-0006LR-Eg; Thu, 12 Dec 2024 15:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856164.1268885; Thu, 12 Dec 2024 15:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLl4L-0006JF-BN; Thu, 12 Dec 2024 15:25:37 +0000
Received: by outflank-mailman (input) for mailman id 856164;
 Thu, 12 Dec 2024 15:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLl4K-0005qI-16
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 15:25:36 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54dab4c8-b89d-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 16:25:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa6a618981eso113043466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 07:25:34 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6801060e4sm648619266b.158.2024.12.12.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 07:25:33 -0800 (PST)
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
X-Inumbo-ID: 54dab4c8-b89d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734017134; x=1734621934; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yI7P/J1NvDahaqdb81p62ViU/ufpXHsb/RMe1IM+oSw=;
        b=ePO9Kyjv2ayZ2TdVBns75G5JQCqL5Mg2UOaq4gU2TUcpyca8L/wRRJamOyUEmsd6E4
         4MCzOp/ZHwl62lv8hvVQwDCV3OtMvBvE0662BOXDHjEXnhbaqnB4wFuhmU6unbXaHWgF
         EuyQvFmjyr/NVfYKYu8+6rReOoia3Q1xT266A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017134; x=1734621934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI7P/J1NvDahaqdb81p62ViU/ufpXHsb/RMe1IM+oSw=;
        b=hJCwXgwyOkB4BXowxuONaEvJRAbItSmWWTgZ+D3srLeeiwSmXUYmeG3GRVAHOQAlRo
         VhXlc0LpD2GbOoUw3X/rT5LKNCxop3NGRlVwfnrCWw789Ecjx6A0HWtCIFt7Bc26Cwkv
         fA2AbKNXZr4NsEXLARrH48wp+hQd8sQ877qEmwp9VUUXZBKHCq/na3zOKXHV1arOA105
         lVzE8c3GWkAzNjnvdLvFQNRo9NzUfDEZFJC1ZRJGr7qiWr5KzLwPS6r/SN4J14NSXD5d
         51gt/LCIkLTrDb0/GD5gmll1QuA8YBGPerfKJ8XtRTefZVMHlEVs4WuOSYB6sEbH4pqc
         ganQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrKKESVEioAuWobkbReSmOXSH0rLL9tc4YqWYP2q2mTdSYtTckJl7Wl1hqHgKmU3rz212IuM4lr2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGsxK6250s6M6O4LWfM7B5wQRLS+3+cHwJM9FABQJMQJly4Ufb
	4StsYTg7E+vIihjhQWV0j11k+EanmWJfC9NdwdBhEIMZWDqkeanvNhoy3kvGTrs=
X-Gm-Gg: ASbGncs4/Qf2WkGTaeCaODcxR3S4fLeZrJu8/WrfnkDsKbxaRBEkKiVwzO7h7NnnMNt
	oi8MwA7gjMQCQdrCH8kurMBVkty05LSnj3cuL3fhYPerf5LP9ZBbCpjekrAFVvlIpOYjphqxsfs
	RnpQz89LDfKfBlam6AWYZEzk+PuLmSwnaXrAkeYE2upRahDgglpQa19mVJCMjgxLkyKB9i+Urcf
	TFsMAtKnNdSJ9/SupjDH553msJRo1U2/4niAUeSmhxfW1j9u/upl6qWZIiC/jtbQw==
X-Google-Smtp-Source: AGHT+IEBWaF8RzjhT02eBsfbqPPWHnzrjPfhQ85d+0PxTJga/5CkNMBEf+TCZBdVTS2USMJ3/KYfWg==
X-Received: by 2002:a17:907:7747:b0:aa6:8935:ae71 with SMTP id a640c23a62f3a-aa6b10f5d3amr778536466b.12.1734017133916;
        Thu, 12 Dec 2024 07:25:33 -0800 (PST)
Date: Thu, 12 Dec 2024 16:25:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
Message-ID: <Z1sAbJPWv9v3jfdS@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
 <Z1qpk55qKBywx26R@macbook.local>
 <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com>
 <Z1rT3lsr9B0dy-Jr@macbook.local>
 <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com>

On Thu, Dec 12, 2024 at 01:52:49PM +0100, Jan Beulich wrote:
> On 12.12.2024 13:15, Roger Pau Monné wrote:
> > On Thu, Dec 12, 2024 at 12:57:25PM +0100, Jan Beulich wrote:
> >> On 12.12.2024 10:14, Roger Pau Monné wrote:
> >>> On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
> >>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> Introduce new printk() variant for convenient printouts which skip '(XEN)'
> >>>> prefix on xen console. This is needed for the case when physical console is
> >>>> owned by a domain w/ in-hypervisor UART emulation enabled.
> >>>
> >>> IIRC the ns8250 can only send or receive one byte (character) at a
> >>> time, so you should likely put that on the console as soon as it's
> >>> received?
> >>>
> >>> For the hardware domain we explicitly don't buffer writes to the
> >>> console (see guest_console_write() hardware domain special handling).
> >>>
> >>> I wonder however how you deal with domains that don't have the console
> >>> focus (ie: != console_rx), as for those I think you still want to use
> >>> the (d<domid>) prefix?
> >>
> >> Imo no matter what domain has the focus, the (d<domid>) prefix should
> >> always be logged. Just to avoid possible confusion.
> > 
> > WE don't do that currently for the hardware domain, because we avoid
> > doing any kind of line processing, as characters from the hardware
> > domain are send straight to the console without waiting for the
> > newline terminator (like we do for other domains).
> 
> Right, and that's kind of special, and aiui intentionally so. These are
> the only un-prefixed lines logged.
> 
> > Are you suggesting that in case of the console input being shared
> > between multiple domains they should all be treated as plain domUs and
> > thus lines should be buffered?
> 
> No, I'm actually not suggesting anything here beyond perhaps reducing
> the scope of this series to just what the equivalent of vpl011 would be
> for the 8250 / 16550 case.

Indeed, reducing the scope would make it easier to get the actual
feature reviewed.  There's a huge amount of pre-patching that will
possibly take some time to get agreement on (if suitable).

Thanks, Roger.

