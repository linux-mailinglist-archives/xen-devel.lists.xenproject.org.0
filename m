Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFF520D9F
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325196.547706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJ25-0003Wb-Ve; Tue, 10 May 2022 06:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325196.547706; Tue, 10 May 2022 06:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJ25-0003TM-SW; Tue, 10 May 2022 06:07:41 +0000
Received: by outflank-mailman (input) for mailman id 325196;
 Tue, 10 May 2022 06:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noJ24-0003TA-3o
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:07:40 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e557d2b-d027-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:07:39 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so1181120pjb.3
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:07:39 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 v68-20020a626147000000b0050dc762814asm9701843pfb.36.2022.05.09.23.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:07:37 -0700 (PDT)
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
X-Inumbo-ID: 7e557d2b-d027-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Diw5Bh3G0TJTjkhyoZQxR6xkH7Og/Lu6z99GDbmvy04=;
        b=MpNjXlUgWOtNvz6qvoE0hxclMe0DKfuZiD/e487Jbwo4RGtZPASb/jIp+oihmB6/xR
         NPfyQGw7LjlFy5hr+N3GN9EbU0ppVNTE5X5ITEA0PGGr7j0mlpnsfq4SvQ+hbp7EJeYQ
         lal9PBdpkPfrgaWroQSH6+yHNmJtmFV6P1OnAKaN5CSGlf/9Ay5CaOPOnm+sRgdmRupe
         Ad526SwQg8dLz9TLy6luRocMPV3Gu/flx2z3v0yw8bPfb11DOY7qG9Vyj4JPJuG1vM3T
         alxWIEXH4qdDR1Den4ytNIfAnqc96MFk7uk3W7dJH07AI2SUnKHqrM/+Z8XG+ES4xgrr
         +HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Diw5Bh3G0TJTjkhyoZQxR6xkH7Og/Lu6z99GDbmvy04=;
        b=VblUlYe4UwoSl1QsP5bOLuyisffAIeLbtsgFJvg5LeFFFTqLyzaYsDJgxqOKG5D4qr
         UE3iqVBP14doO4bKfD2SKPmXbxjtotZmOV6SdbCthdGmMZsejMVrcgPmrH+h9kfC2JSQ
         r2hFNeCB2Sg7x+gVk2L0gr//iZq8AK8sEKLMHPWLWd21+kENIC6LnzCiCUNbkSZVNWiD
         BuztO1n5D06qCDippYPZTpn3UV270e04PVprigWQX9fA9wm3/7CYHxYojKCeT3+g22iM
         1HUvdzlpm1b2x7An3CKzXWiC6oHKx/6aPZoEzTUO6/RZuBPzT6KAZLhdC6kpsXcEw/Xq
         QVag==
X-Gm-Message-State: AOAM5315gLvHgallWVrPe9LosPhLIO+x2kfDc5SXGzEwoX8ei7PSuPLo
	sfzxXljS28DW00Nxmmv7EZcVnegRg11XSg==
X-Google-Smtp-Source: ABdhPJwrIZZzL3t2mvNWJBPDziqpnvOys/Ln2P3htx1jXNbh07hDxY3rInmqmzJqTg8ZpXFrJ2Nkow==
X-Received: by 2002:a17:902:da90:b0:15e:adc2:191d with SMTP id j16-20020a170902da9000b0015eadc2191dmr19157565plx.134.1652162857909;
        Mon, 09 May 2022 23:07:37 -0700 (PDT)
Date: Tue, 10 May 2022 11:37:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 0/6] Virtio toolstack support for I2C and GPIO on Arm
Message-ID: <20220510060735.aw5rzzj24su7cc7i@vireshk-i7>
References: <cover.1652162646.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1652162646.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52

On 10-05-22, 11:34, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds toolstack support for I2C and GPIO virtio devices. This is
> inspired from the work done by Oleksandr for the Disk device [1].
> 
> The first two patches can be applied right away, while the last four need
> Oleksandr's series [1] to be applied first.
> 
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backend [2].
> 
> I must accept that I am a beginner to Xen and developed this patchset based on
> support for existing devices like Disk or Keyboard. There may be bits which I
> missed or the one I added which aren't really required.

Missed adding version history:

V1->V2:
- Patches 3/6 and 4/6 are new.
- Patches 5/6 and 6/6 updated based on the above two patches.
- Added link to the bindings for I2C and GPIO.
- Rebased over latest master branch.

-- 
viresh

