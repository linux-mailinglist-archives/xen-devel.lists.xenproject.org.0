Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2435839B39
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 22:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670611.1043512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSONu-0006QF-VX; Tue, 23 Jan 2024 21:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670611.1043512; Tue, 23 Jan 2024 21:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSONu-0006OH-Si; Tue, 23 Jan 2024 21:32:42 +0000
Received: by outflank-mailman (input) for mailman id 670611;
 Tue, 23 Jan 2024 21:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1h7C=JB=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1rSONt-0006OB-2W
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 21:32:41 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed67a1a5-ba36-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 22:32:37 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d74045c463so18846825ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 13:32:37 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a170902740800b001d714ccf7b3sm8100220pll.180.2024.01.23.13.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 13:32:35 -0800 (PST)
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
X-Inumbo-ID: ed67a1a5-ba36-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706045556; x=1706650356; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swQh+tXC7wjzygjmlvxoa7jnM24RYNaNqlf/2tnlFpM=;
        b=YyTLJJi+lkIfGK++NhomAsr86JNL7Kemr2LURxY93gmh/UbbPqD+NI1nIrt7mFb/aX
         E6VPZOiQiMcr/mDRU9UGrAKqLvK8Dmvjor3IJzUJkiBDH8hRh/0WEgFcLkWmfDgeoEpe
         NLij+hHRoU8afZZ63222CMEyhTtCkXaKVxvp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706045556; x=1706650356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swQh+tXC7wjzygjmlvxoa7jnM24RYNaNqlf/2tnlFpM=;
        b=jIiYdZ8cUXPDZAx31Vc/2+1932REC2o3bc8SVRca1YDHKmo7VJXROb0K/YQFsyaC7q
         q4YHi5HbcUIJKaZ3oBfB+5weip9CoTn8zF7yPO7iwcY6G51hTqQkJc7CV5QqQIHtATYY
         0S8sH2w+JH+oZwHHh2vJGppmE3sVRjw1xJ3A8glxxHUHi7F4CjVwoJESftAn19papibG
         v6rX82kqdoY67EFSGpksuShpaynbx96VEx4wjv6P34g5bREDnLGI8OV3wgO/ezSGlzjl
         i59aGAAg2Lw1PON4Cyryunj96mlgTW/e8NSl1Z19HTD0yP/Z2clUJoAC247FKg7UPFXT
         VLWg==
X-Gm-Message-State: AOJu0YyYsCrzefudQKxWh0Zh1vC8onLiVAbhGhlE5U1dlreYMaczLZz3
	AxwRcFoEQwIvsiz82gd+4O5ibV9vXHyC29UO7v5V4V73nCwGMumWwLsxhf2Ywg==
X-Google-Smtp-Source: AGHT+IEQgobK3CRi+ljenTCG6shvI0FXYyD3FQGn2ZQQGUseg7yif9UwvyOavRLNcvr02zSwCtZc7A==
X-Received: by 2002:a17:903:120d:b0:1d5:7316:c9fb with SMTP id l13-20020a170903120d00b001d57316c9fbmr3866864plh.37.1706045556284;
        Tue, 23 Jan 2024 13:32:36 -0800 (PST)
Date: Tue, 23 Jan 2024 13:32:35 -0800
From: Kees Cook <keescook@chromium.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 80/82] xen-netback: Refactor intentional wrap-around test
Message-ID: <202401231331.0BD2925D4E@keescook>
References: <20240122235208.work.748-kees@kernel.org>
 <20240123002814.1396804-80-keescook@chromium.org>
 <35ff4947-7863-40da-b0e7-3b84e17c6163@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35ff4947-7863-40da-b0e7-3b84e17c6163@suse.com>

On Tue, Jan 23, 2024 at 08:55:44AM +0100, Jan Beulich wrote:
> On 23.01.2024 01:27, Kees Cook wrote:
> > --- a/drivers/net/xen-netback/hash.c
> > +++ b/drivers/net/xen-netback/hash.c
> > @@ -345,7 +345,7 @@ u32 xenvif_set_hash_mapping(struct xenvif *vif, u32 gref, u32 len,
> >  		.flags = GNTCOPY_source_gref
> >  	}};
> >  
> > -	if ((off + len < off) || (off + len > vif->hash.size) ||
> > +	if ((add_would_overflow(off, len)) || (off + len > vif->hash.size) ||
> 
> I'm not maintainer of this code, but if I was I would ask that the
> excess parentheses be removed, to improve readability.

Good call. I will adjust that. Thanks!

-Kees

-- 
Kees Cook

