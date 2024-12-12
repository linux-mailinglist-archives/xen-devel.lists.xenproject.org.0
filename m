Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41AD9EE66E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855966.1268739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi6P-0000Bn-7v; Thu, 12 Dec 2024 12:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855966.1268739; Thu, 12 Dec 2024 12:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLi6P-00009G-3o; Thu, 12 Dec 2024 12:15:33 +0000
Received: by outflank-mailman (input) for mailman id 855966;
 Thu, 12 Dec 2024 12:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLi6N-00009A-V6
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:15:31 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c618f9a6-b882-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 13:15:28 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso84585766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:15:28 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa678f0ff87sm674894566b.131.2024.12.12.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:15:27 -0800 (PST)
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
X-Inumbo-ID: c618f9a6-b882-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734005728; x=1734610528; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zgp90Rnf5B5SQbyo5cDlBJU6psBYT5wWQKaHJSUi3VY=;
        b=s430O67fSa3zW1FkwriZqRqrDrjBRsKtn3OHCjIsD4bjdOr1ZW3dEnlLDeqjbhTI3j
         DQytgJuhGu452SwYcZShpMo1clHZHuBEBnUgqdbly0hYOByUjDOSArWE5bcPVzJThXoW
         czbhcU6KYkkpnQ1BHg6Vg6p0389Wk1+1P054A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005728; x=1734610528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgp90Rnf5B5SQbyo5cDlBJU6psBYT5wWQKaHJSUi3VY=;
        b=QhjmxTZ45vNIR1Jo3PD5HJIFPdW8SSpkvCzeYd7tMEtWSWTasghBbZTuzBuPg3WJ5D
         lqQtzL/E/mGNftz1YJspE9YEvOQ6nyqx1mVrMm6/L4zwy3wbT+OTvz32HKHdB3MSi9Dx
         2PJ8CgzzNMCClBAXC47/t3hN6v8HViAxe4c9Cby7fiQxydCWQJpNwa5pjsC3KDjznve7
         MsBQFRhZKQhrEb+nlnLQ8HcXHT9oLGpX0RQgL55aflBqPsZqFPE9hbeBxp/bOcfJxaPc
         O01cWVo8d8ryhbsi/U9fTNvZ/AgqPCojBTMPZRKZRDnboQZ1I58y4bl6D3HeON4oWr9Z
         tW9g==
X-Forwarded-Encrypted: i=1; AJvYcCWtB147T+ZHsoJY1nD4/9qyaENLdtpiJPHD01byRzlbQxeyPi3isyvY8a2Ube4SuKMnFfzaNOM/ydw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzw+3A0wLGotNzSkX46xLLbwGy6GQgSm4SKtEEzH39iOW85Cfjh
	Q/zAVJ6Q1zVWqaI/6b2n2mKYFv0UT2lSPnz3eT52xI1evVWhjEIa4RpT35SJMtTxOTH68nPCNgA
	F
X-Gm-Gg: ASbGncvvacDBjFkXfs7+572+LGMbsnGS4VUXMOh59YEcTUbH3Q7ALxtkuAwFA0G+J6Q
	LJCwdgJrlkho1EmDXchYwa4vKLZR4Gi3dY5Cu/W7Kr4YXUhLnziBpVNk05Jge0vWZTKPWILhlYz
	iGWyv0bPGgqNmXjVKIL1XIrtGSdvX/OLh2mjgcqxQPQuZZraYHY74tBILqUouENPNdl1qP8Z9Nv
	leDElmtJbR7dWDGXhEbBW4nZyKPeNtRDuYPjSDVmdSU/71hC9o4Df3k5c3/2I0qPg==
X-Google-Smtp-Source: AGHT+IG82leLf/1H0HoDZxeRc0Zf/Q7vIpaTjnAAe6SRoJdveanQ9oasCS9bY1OI1PIJD4zonnSEEg==
X-Received: by 2002:a17:906:3287:b0:aa6:ac9b:681f with SMTP id a640c23a62f3a-aa6b1398119mr629487366b.43.1734005727568;
        Thu, 12 Dec 2024 04:15:27 -0800 (PST)
Date: Thu, 12 Dec 2024 13:15:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
Message-ID: <Z1rT3lsr9B0dy-Jr@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
 <Z1qpk55qKBywx26R@macbook.local>
 <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com>

On Thu, Dec 12, 2024 at 12:57:25PM +0100, Jan Beulich wrote:
> On 12.12.2024 10:14, Roger Pau Monné wrote:
> > On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Introduce new printk() variant for convenient printouts which skip '(XEN)'
> >> prefix on xen console. This is needed for the case when physical console is
> >> owned by a domain w/ in-hypervisor UART emulation enabled.
> > 
> > IIRC the ns8250 can only send or receive one byte (character) at a
> > time, so you should likely put that on the console as soon as it's
> > received?
> > 
> > For the hardware domain we explicitly don't buffer writes to the
> > console (see guest_console_write() hardware domain special handling).
> > 
> > I wonder however how you deal with domains that don't have the console
> > focus (ie: != console_rx), as for those I think you still want to use
> > the (d<domid>) prefix?
> 
> Imo no matter what domain has the focus, the (d<domid>) prefix should
> always be logged. Just to avoid possible confusion.

WE don't do that currently for the hardware domain, because we avoid
doing any kind of line processing, as characters from the hardware
domain are send straight to the console without waiting for the
newline terminator (like we do for other domains).

Are you suggesting that in case of the console input being shared
between multiple domains they should all be treated as plain domUs and
thus lines should be buffered?

Thanks, Roger.

