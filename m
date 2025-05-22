Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A6AC0E22
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994100.1377145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6xq-0004wc-Pi; Thu, 22 May 2025 14:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994100.1377145; Thu, 22 May 2025 14:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6xq-0004uM-MQ; Thu, 22 May 2025 14:32:06 +0000
Received: by outflank-mailman (input) for mailman id 994100;
 Thu, 22 May 2025 14:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI6xo-0004uG-Uv
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:32:04 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879d568f-3719-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:32:04 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so55434895e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:32:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca4d305sm23770512f8f.16.2025.05.22.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 07:32:02 -0700 (PDT)
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
X-Inumbo-ID: 879d568f-3719-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747924323; x=1748529123; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r3ZXUsm2FdR51NJZ2VeI2WqISLgifbIejrHURXc0RAo=;
        b=C0fPbcL5Pua94uzAoIh9uuhTvvJrwA4VtIpxVpYt5iCHkSiqwQKxvEgsHIbORmqP1o
         yPACPhm6xWsk5ZgmdmpLa7Gs4uQUI00ru0tkfTa+rhLY1hEbkRpo0K+JPwzRlc18JfKj
         dTmCYnErQ5dtKvjrF5B4Q53G1DUqwQ1uwRO8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924323; x=1748529123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3ZXUsm2FdR51NJZ2VeI2WqISLgifbIejrHURXc0RAo=;
        b=bCRTuM9fDP74Om/tD4gMq8j51S2/BHqt3+KVUDw9vlDjk8NZb/x6QdhvXNqt+rfXG/
         AB32r6gAHUyhB7bFXQ9pDTMFOe5xSAXpaekCh6fmF2r3mc/V1QBZs0a2NFMbSY6D9OL9
         as0UspuoDlitLjxtE9oFJibxSwOF9odGS8BLIitKEt0GdWCg0ihOFy4T2ZvhrWmoN35q
         sdOPJMbFEQV74a1ChFwef/ATz8VVJ2BdFXN0Be3NpVHNJtpJB4GqXjqvndKijX97nqld
         W4LELIsR90PUZx8rUsS7TXRBoezSAfc1oF2olQRVqTR6hXep6fKCWCx5yDdO40S1hB6M
         6kmQ==
X-Gm-Message-State: AOJu0YxPMuKMZFr/XyeyeWb70miCueT+y4nuitBSlgKBWnf1kxwtcoU+
	aaLcHeBGEt4x42hzHeNAlKbQFUtv2pEqms+oE13dKdrYF4pvDrBUEBuxzvVOp6q5lJyxsEOox0Z
	5FPw6
X-Gm-Gg: ASbGncusiF4VmJjgskb5S/xbVo8rq0ZJMjCfGY1McA6GNauKySRYAYYdQWm8NDsqKDM
	jJ4CTnpMgX3E32q43UZeDiw0O8YFS2krjHypgL3ghoZyM+/i8LisW9ILK7GhcEghkcXaWF4/O8s
	3fqtQZKyFAEZXQ0HyyKuwH9Xb62RiLf3zAss53/GAN3OcTdxP2k15sMUE2Ck3KZfw7fUTwdjT+E
	M9i+ntV45MHamEvjyZsopNc+wwng9rjrly4mt30DYFYvw6UWb2O+mNBkZAet4EaAy74/34gDo7s
	DNLxBcQn6nqH2YVkR4th9zc+g8L9jcE9xDO+1ZOnvDX53L/rq9DkiFnQYd99WlZZR0owDyY3vG0
	cH09MP7R+9WzJxpJyO630n36w
X-Google-Smtp-Source: AGHT+IGMY5dr0m5V9aUT9SX1concwJPlyu83+cW/UJSm2XeB3BDlhOMW9GN1HiD1Ztqfybn5webd7A==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a37ba59a94mr8890561f8f.18.1747924323182;
        Thu, 22 May 2025 07:32:03 -0700 (PDT)
Date: Thu, 22 May 2025 16:32:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
Message-ID: <aC81YstqsQ8laEze@macbook.local>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
 <ee13677a-e4ea-4d11-92d0-196b86a7df48@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee13677a-e4ea-4d11-92d0-196b86a7df48@citrix.com>

On Thu, May 22, 2025 at 03:22:53PM +0100, Andrew Cooper wrote:
> On 22/05/2025 3:03 pm, Roger Pau Monne wrote:
> > A BAR at position 0 is not initialized (not positioned).  While Xen could
> > attempt to map it into the p2m, marking it as mapped will prevent dom0 to
> > change the position of the BAR, as the vPCI code has a shortcomming of not
> 
> Minor grammar point.  "prevent dom0 from changing".
> 
> > allowing to write to BAR registers while the BAR is mapped on the p2m.
> >
> > Workaround this limitation by returning false from pci_check_bar() if the
> > BAR address is 0, thus causing the bar->enabled field to also be set to
> > false and allowing bar_write() to change the BAR position.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/pci.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> > index 26bb7f6a3c3a..39fd5a16a4aa 100644
> > --- a/xen/arch/x86/pci.c
> > +++ b/xen/arch/x86/pci.c
> > @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
> >  
> >  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> >  {
> > +    /*
> > +     * Refuse to map BARs at position 0, those are not initialized.  This might
> 
> "0, as they are not"
> 
> > +     * be required by Linux, that can reposition BARs with memory decoding
> 
> "Linux, which may reposition".
> 
> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, since this is not blocking the CI right now I will probably
wait a bit to gather more feedback.

Roger.

