Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F2AD6E34
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012823.1391326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfTv-0005L0-0F; Thu, 12 Jun 2025 10:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012823.1391326; Thu, 12 Jun 2025 10:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfTu-0005J9-Tl; Thu, 12 Jun 2025 10:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1012823;
 Thu, 12 Jun 2025 10:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPfTs-0005Iy-Qp
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:48:24 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2eba838-477a-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 12:48:23 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso710998f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:48:23 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a561b65cbfsm1608565f8f.97.2025.06.12.03.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:48:21 -0700 (PDT)
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
X-Inumbo-ID: c2eba838-477a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749725302; x=1750330102; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hpv4aUJj4Q2E90rTp3mzKxtHiHmPWX/m8DncdVkjZo4=;
        b=cuRIsS8YtqZE2tEXOOz3fBGGmGDjOGYt6q+LYar+2c4ieYm7qPKPQ2aOXkD1q6maWq
         +WQznVx6/GVaRtFaJZ9DaNaeU1MpCRQsv1bhH7bdn4nhAokGaZWR89340enuNPRqwMsb
         1OJDr82jgu5vdlkuLGatWrly+Ci5C1HA8foEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725302; x=1750330102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hpv4aUJj4Q2E90rTp3mzKxtHiHmPWX/m8DncdVkjZo4=;
        b=pHYGJa9RlNybhqaQruaiqiACbewlo3ApAk8RuPnE2HgKbgjkkAEEuTow7yhaMD1WdY
         ddBwWSOnPvjmYfuEDJ1pift1uqX/8OEQGyV0g17NG13MEtssMGyHqHcwOzN2i753LauY
         7f+zGooGi/9K/qJ5Pq+0VSPJPJYD0HLKXlon6F52W/OCJ3EE8Fwz4RPjZNsOWonQ06Or
         s7gELouBrDuw+e0JbClK9v7CDiA2TZcY62fs2EjVGN6dEP3ORuyPBL8b11byyKVCLMtj
         fPBooubv1bY3pAM8nttNphLyk6XKrmPQH9RNDPGO6fx6J7bMbUaVH4VQFfiSM8L+SWu0
         0H9A==
X-Forwarded-Encrypted: i=1; AJvYcCXV0pFnOBcuhiitUUOj0gtvOAD9SOVU/mVoHuoSqfGuxhQJzNO9YzaJudt2rjXzKiXRfkk9+061PiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRcVgyjHPQvvdjyuKSVmPSN5BdfcHFaTMX93kmLZF7U2UtEqGh
	6OlfeTL7Mx+rb61OYBwguSSHPHSEY3x0t5S3uXOdoSTap6usmz8p7yfd09jc2SoC5C8=
X-Gm-Gg: ASbGncv8B1HtsdMGUibvTIDJ1qHO+jN/h2InYwaKS3LeW0UmUvfpOgmreN6V2WwWf1d
	R3jqK/6xbTJx82VuwrGltrMD+809BHNvYl1tjgss1L3twxx/pSGl3AZBkkFkyUt1pLfqLK8ik2l
	gdba++USIMYENLgQ3m2JMG6PIhyjJmoABTyWQCT1Zikd/uqzFeVK/YnG4hswwiMBRzsfsK8NiYS
	8YSiTarYCiaLWkHXEmsvp8vI84nSHxvFb/v5L1f0PO6DeaIZs+/0ejbTf60j6T7f/W6F1hamjBa
	Eo8mDPfpNCaOQLybwZLv29S6SdnPRw6QwIstEKheC15XctnorZKHurYzli97AHTmeLsAT/x8uyz
	wUem6FSS1Tcy7NFlC016n/hTx7DNegg==
X-Google-Smtp-Source: AGHT+IE9aJisEAyERP6M5GBY8SaASbcQDPSGYQnG/ch9mTGl6LCaeSva/uj//Cofzw4hJAQhgQxokQ==
X-Received: by 2002:a05:6000:25c3:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5614c2053mr2060199f8f.42.1749725302494;
        Thu, 12 Jun 2025 03:48:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:48:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/8] pdx: introduce function to calculate max PFN based
 on PDX compression
Message-ID: <aEqwdKXaugedfAm4@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-3-roger.pau@citrix.com>
 <9e7925c4-3695-4320-8552-4ee0e39350e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e7925c4-3695-4320-8552-4ee0e39350e4@suse.com>

On Thu, Jun 12, 2025 at 11:11:14AM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > This is the code already present and used by x86 in setup_max_pdx(), which
> > takes into account the current PDX compression, plus the limitation of the
> > virtual memory layout to return the maximum usable PFN in the system,
> > possibly truncating the input PFN provided by the caller.
> > 
> > This helper will be used by upcoming PDX related changes that introduce a
> > new compression algorithm.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/setup.c  | 19 ++-----------------
> >  xen/common/pdx.c      | 25 +++++++++++++++++++++++++
> >  xen/include/xen/pdx.h |  8 ++++++++
> >  3 files changed, 35 insertions(+), 17 deletions(-)
> 
> This is all fine for x86, but on Arm you introduce unreachable code, which
> Misra dislikes. Yet then it feels like it's wrong anyway that the function
> isn't used there.

I was also concerned regarding why ARM doesn't have an equivalent
function.  Is the frametable there supposed to cover up to the maximum
physical address?  In which case there's likely no need for any PDX
compression in the first place?

Thanks, Roger.

