Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C12AD8996
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 12:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014213.1392455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1mW-0001EX-6E; Fri, 13 Jun 2025 10:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014213.1392455; Fri, 13 Jun 2025 10:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1mW-0001DA-3c; Fri, 13 Jun 2025 10:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1014213;
 Fri, 13 Jun 2025 10:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IsI9=Y4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uQ1mU-0001Cy-LZ
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 10:37:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58ef8d08-4842-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 12:37:04 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1993032f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 03:37:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568a5546asm1932027f8f.3.2025.06.13.03.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 03:37:03 -0700 (PDT)
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
X-Inumbo-ID: 58ef8d08-4842-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749811024; x=1750415824; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NZJcwfaB1xOTTE0hWQBI36KfPHx3equ3xZcmu8RTB98=;
        b=APwHETj1KR+MFZJv0Bs8WHsW7dkvmKCw4l6XN8Oaq+R0bMwk0oEJTP14SexPi8kVlD
         QnXxVUUcX0RDOwN0jwc50As1zjdXqMhpBMy1QEOvlqveRATj89zgF5vodMTKTkEjzeAO
         PWgh+zN/SAoh2tEmKoo+651wyxu4H6nxDrkuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749811024; x=1750415824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZJcwfaB1xOTTE0hWQBI36KfPHx3equ3xZcmu8RTB98=;
        b=h/ucfNc/2lOu5CtcugvyCS8WS3EP65+QNkTvDxZBQLSH74SN/H9klDSmHgdJa47Vlc
         rKf9k+uHuUCy4t1YukrtEPNSlMlEDHKNF4p8+1WOplkFYeo04Y4Pp/F/LIWIn5LZkvjM
         YKfsd6SzCg5IQx4eOPzaDrMwwcNXzz2ufT50mw2tEyMF2ckcm6L1oUnchXO8UlxcWH0W
         q7QVYI8Awb9ZbN+tW8IEaPjk2BOGz9+xnf3uAphR9AW9GM9aBFb+SNVXh0VmvQRpZlOD
         QnhicpLBgURLmQQNMlg0/XsoQkIb+mtwMBYfjT5wUbQ6fzRRYRueTbayWks2uLhCqjHH
         e2iA==
X-Gm-Message-State: AOJu0YxiedjA6aQsn1dDRBsGRT2jLV5aCfpIY2Okvxxyapo1nIPI8oDn
	aIpdF6wllk++lbV4nNOMVBE/57AvB9FD8ZE2m3QVPkvsKtTkP0hePIP6yLumBX46JL4=
X-Gm-Gg: ASbGncv6Lrx3vENQLcEqj+2KLz+EOmGj1b75tnnN/sYB9i6LQznYo9TvvwafxEvfb7N
	tP3cxztd8PP+x0N26BM/R/KgyyE5atyzJQGCNM+tT1Q0IQ5oKAwfFpV44/DNYCfms2AcyIyRpS+
	UhVNfsh02A8RAau1MgDgpd9QoPc9/eeuoKPxzmNkV41vyu5nz9P5jaGZgtsgNWjMo6I6qUdoCb7
	JJ6gXcW0I5yld5gwju4WJHJ+03jGYTAklLkRc4D2vuLYHmLzttj0C/e3k+SqSrAuEAsijIWcPDq
	TNS6wwxrNzhwpTPbY+6qVeapsamZCHWVbM1Lxw7uFJsOgdfBBNN8yL7oelwz0Wq75D5CyGBI7AW
	6b67N4bF/P0DEsABit3hLQnmpI+kXXA==
X-Google-Smtp-Source: AGHT+IF/UidgxPgXo0fy9Hq0e0DgKLdDQyuLAF4ikHMpkf933wMnnCchHR0ydMv1ApzQxJHqBQEu6g==
X-Received: by 2002:a05:6000:40de:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3a56877ab0dmr2115115f8f.47.1749811024142;
        Fri, 13 Jun 2025 03:37:04 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:37:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/pci: Use C99 style types for fixed integrals
Message-ID: <aEv_TkiqGYJFKS5N@macbook.local>
References: <20250613101249.164199-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613101249.164199-1-frediano.ziglio@cloud.com>

On Fri, Jun 13, 2025 at 11:12:47AM +0100, Frediano Ziglio wrote:
> Just code style change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/include/xen/pci.h | 26 +++++++++++++-------------

I think if you change the types of the declarations in pci.h you
should also change the types of the definitions in pci.c.

Thanks, Roger.

