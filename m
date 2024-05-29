Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95CE8D3B13
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732205.1138093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLKC-0007kq-DK; Wed, 29 May 2024 15:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732205.1138093; Wed, 29 May 2024 15:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLKC-0007iG-A5; Wed, 29 May 2024 15:34:48 +0000
Received: by outflank-mailman (input) for mailman id 732205;
 Wed, 29 May 2024 15:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCLKB-0007cn-17
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:34:47 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9370afa-1dd0-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 17:34:45 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-354dfe54738so1427846f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:34:45 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3579354abd1sm11795489f8f.59.2024.05.29.08.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:34:43 -0700 (PDT)
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
X-Inumbo-ID: f9370afa-1dd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716996884; x=1717601684; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pCCA05Bk3lERzojsDOglqz/kiT65TlZvr8I1ZvB6rL8=;
        b=SKtTevj5bEBe/+oa0tqzu7hKyCC3w1gK2jg4XfmP7UHfmVEIW97Y/BNQkw6PFoe7YH
         3Pst1lAdK5rnYWOxFeEcUXisviwcviPmZRCwpJvwGEPwLiG9j5Mcze5vca2IkNrOQvhT
         9er5XwxUqtC7WWlRDNNDGwHBMUtq8tgEbshAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996884; x=1717601684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCCA05Bk3lERzojsDOglqz/kiT65TlZvr8I1ZvB6rL8=;
        b=WLIAnoWE8Jkb+XoGv0rj3jj0g0lFeypuuB7VtZi9xvdELewHL4bQ9Ef/8FlOULRBEL
         q0/DqO+/iz9ZtVn8KJOcMvoE1iHgmScFsx3lg4FygIixOfxHwjXBwz0NcXM0g0vDjPTw
         jK9GSQwqw+TCDylopm7XmcuCQor9tXRYlzdVnateKIPlP7rrOu/mGr2Rt2YKpO1d7+Io
         wDQsd7Y6WW5Y6CTQtGCtJgkn/tR6UulM1UJgDU1ZLeZaRFnFLXA6qMLIJRFR/dIlvfJ2
         Y1BFphe/aGDJGwP3vzUfJu7KFdGcHGvCdmYH+P8Uvo4a+r7fOMYj5LKHKDuLSaJPFhOE
         72PA==
X-Forwarded-Encrypted: i=1; AJvYcCVm56P6aajOSZnkTt5nwZeoCM8stNXAE6JhlPO/7DEXnotj0BZ5kMzq6mW/BQ1JePSEE7XPYAmInInStDqBVCb84T04geLEmGc/OVDxXwk=
X-Gm-Message-State: AOJu0YyTZN3kGA4LjwlI20uulEbSvOYXR2b+HXXxQ+QVtMIWzrGFAGSO
	679uUZpGP5M/vnni20WanCXu4lIq/+Y5Y3piu2jo5JNwcgpqhwumIFnRAFDnPbCETj8amqqDYlT
	x
X-Google-Smtp-Source: AGHT+IHlnj+ZlxIbrLBaWfVr90N1X8dzZ2rSo1XF0EhFYRGUIOsRr7xWrsu3gmVQ7gipje0ubacDjA==
X-Received: by 2002:adf:f883:0:b0:354:f7b9:75c1 with SMTP id ffacd0b85a97d-355221819ddmr10648025f8f.25.1716996883847;
        Wed, 29 May 2024 08:34:43 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 1/9] x86/irq: remove offline CPUs from old CPU
 mask when adjusting move_cleanup_count
Message-ID: <ZldLEp0xBQo90uZD@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-2-roger.pau@citrix.com>
 <0a2f1f9a-fab1-409c-96f8-399b19077f12@suse.com>
 <ZldGe6z70R0CD32Z@macbook>
 <b9a667ea-45a6-45d1-8dda-0ec3aa00b9cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a667ea-45a6-45d1-8dda-0ec3aa00b9cf@suse.com>

On Wed, May 29, 2024 at 05:27:06PM +0200, Jan Beulich wrote:
> On 29.05.2024 17:15, Roger Pau Monné wrote:
> > On Wed, May 29, 2024 at 02:40:51PM +0200, Jan Beulich wrote:
> >> On 29.05.2024 11:01, Roger Pau Monne wrote:
> >>> When adjusting move_cleanup_count to account for CPUs that are offline also
> >>> adjust old_cpu_mask, otherwise further calls to fixup_irqs() could subtract
> >>> those again creating and create an imbalance in move_cleanup_count.
> >>
> >> I'm in trouble with "creating"; I can't seem to be able to guess what you may
> >> have meant.
> > 
> > Oh, sorry, that's a typo.
> > 
> > I was meaning to point out that not removing the already subtracted
> > CPUs from the mask can lead to further calls to fixup_irqs()
> > subtracting them again and move_cleanup_count possibly underflowing.
> > 
> > Would you prefer to write it as:
> > 
> > "... could subtract those again and possibly underflow move_cleanup_count."
> 
> Fine with me. Looks like simply deleting "creating" and keeping the rest
> as it was would be okay too? Whatever you prefer in the end.

Yes, whatever you think it's clearer TBH, I don't really have a
preference.

Thanks, Roger.

