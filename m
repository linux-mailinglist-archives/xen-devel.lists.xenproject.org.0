Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9C2F5C7B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 09:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66869.118951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzy4p-0007Ov-D9; Thu, 14 Jan 2021 08:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66869.118951; Thu, 14 Jan 2021 08:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzy4p-0007OW-9z; Thu, 14 Jan 2021 08:33:55 +0000
Received: by outflank-mailman (input) for mailman id 66869;
 Thu, 14 Jan 2021 08:33:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUs3=GR=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1kzy4n-0007OR-VV
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 08:33:54 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f86d6daa-a8f7-463a-b79c-1175719d2009;
 Thu, 14 Jan 2021 08:33:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c124so3750574wma.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 00:33:53 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id b14sm8094410wrx.77.2021.01.14.00.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 00:33:51 -0800 (PST)
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
X-Inumbo-ID: f86d6daa-a8f7-463a-b79c-1175719d2009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GjeLGr4dGUje6MMvo6pIfAne61VxoEvoHdwrClfl8/s=;
        b=ZIGADg3BlaqD32ynUhvAKUHK36WggmBH+HgCus+Lt0OiuAae5RFKTAAdAUBLBkfKrY
         g9mCLwos3GLeOzEZCwhYZwr8T5fiAWm2JBAxzVNiTStafjzlYckMK2ml72RUD1geMllQ
         TC4hDVHt/O8I3ZmVeHGXt1O5WQbtt/JbiFBmQso//vGSagy4KDFQiNpFLKIWEZL1gEtU
         rgvHU8MtqxV21EHUgiCzhfSYfGoPkgsH0esb0o3x3F9ayqx2pdlhR+Ode/A4/hYpSf0j
         AnO7uTlxvNucWcVxTJhpnRX7DXNGWSrX8lPRCWwv6I8P7aSS+LVkhBxZp6+rLxq35MjL
         qO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GjeLGr4dGUje6MMvo6pIfAne61VxoEvoHdwrClfl8/s=;
        b=Y8NiG6YlL0ZLpzKLrvvPmYMA+kfEIHMQebMZLxVi4FENlbU81aCq7n2c19sRDkkYkN
         MDVUwvjgwfcpWqpOmGuWOJ0OIlVfoqO4R0xiRuCjpviqnsqMxViVt5guIxuojqV9uno8
         dzX9BL+Z/bFzdRyJ+RnbAOYQ+6WWERgjCZqmMJdNdKhIc4NL71kl0E4f38qS5YitwhK5
         XDg0WKkAh18Wuohrun2CDhOpxhpytbgvDdU8yMncKYUgILvhapIDtUmPi0149uiAJOBs
         3aBV3oEIocoAarfY1ui+75hCM9XjSJHjQNfGEEfRCt1fAuMmPa+B7cjXUZ/ZBn2tr9QS
         tWWQ==
X-Gm-Message-State: AOAM533zD/h4UgWJftvH4bD4i3Wt1lDrcB0lqRD1Nf6SzE9fxynpN1s/
	2iLB6NiZ8p54eB4F0slxRBreHA==
X-Google-Smtp-Source: ABdhPJw3p4X/u/75/T9prjNVjPSDyTRHFC+ksLZ/wQbHtHizclaVB59YVOGqKuRlDUU9mMmbgYlTNw==
X-Received: by 2002:a1c:2d6:: with SMTP id 205mr2866556wmc.60.1610613232251;
        Thu, 14 Jan 2021 00:33:52 -0800 (PST)
Date: Thu, 14 Jan 2021 08:33:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
	Dany Madden <drt@linux.ibm.com>, Daris A Nevil <dnevil@snmc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Erik Stahlman <erik@vt.edu>, Geoff Levand <geoff@infradead.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
	Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
	Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Allen <jallen@linux.vnet.ibm.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Lijun Pan <ljp@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, Paul Durrant <paul@xen.org>,
	Paul Mackerras <paulus@samba.org>, Peter Cammaert <pc@denkart.be>,
	Russell King <rmk@arm.linux.org.uk>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Santiago Leon <santi_leon@yahoo.com>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
	Utz Bacher <utz.bacher@de.ibm.com>, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210114083349.GI3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>

On Wed, 13 Jan 2021, Jakub Kicinski wrote:

> On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:
> > Resending the stragglers again.                                                                                  
> > 
> > This set is part of a larger effort attempting to clean-up W=1                                                   
> > kernel builds, which are currently overwhelmingly riddled with                                                   
> > niggly little warnings.                                                                                          
> >                                                                                                                  
> > v2:                                                                                                              
> >  - Squashed IBM patches                                                                                      
> >  - Fixed real issue in SMSC
> >  - Added Andrew's Reviewed-by tags on remainder
> 
> Does not apply, please rebase on net-next/master.

These are based on Tuesday's next/master.

I just rebased them now with no issue.

What conflict are you seeing?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

