Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1D5AE16A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399577.640812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTEn-0003r3-Uu; Tue, 06 Sep 2022 07:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399577.640812; Tue, 06 Sep 2022 07:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTEn-0003ol-Rt; Tue, 06 Sep 2022 07:43:13 +0000
Received: by outflank-mailman (input) for mailman id 399577;
 Tue, 06 Sep 2022 07:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVTEm-0003o0-2A
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:43:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d21f3dd-2db7-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:43:09 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id qh18so21226397ejb.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 00:43:11 -0700 (PDT)
Received: from leoy-huanghe.lan ([104.245.99.30])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a17090676c300b007030c97ae62sm6150708ejn.191.2022.09.06.00.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:43:09 -0700 (PDT)
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
X-Inumbo-ID: 8d21f3dd-2db7-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=eh9PbLozRnOPRRmksXqXS+0hoLk4T4gMMpNPc3VabkE=;
        b=p6zSmfxguCCnxrxCAbKkmDokuG7aiSWsL8cAQvxLYyLr/j8V9so6DrUxCVYQnSS7ou
         cROwDMfQTehuDQEUKQqQ4Rq1lSfcsE+6VHddjAgGpzeng/garJpkCNRZmr3SlruskVYw
         tKZvGSosIi0oMSi8eyVBxtialyIkGokHsr/VKOJKEjPxQ1fqnLGMteB0vQ7vOfRnyqUu
         GNplksvDZMP58ovUO160AM0P5vJSS0CPyn7yWrb2OND88m87s6XiBKtQkPBhuS3LLAHh
         gztlHP+nDf4cLCvFmI9VIY80H44NKkwGDjHErjaHGPy9q6ttmP0XL4IUoicd9cNiXVqj
         ojZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eh9PbLozRnOPRRmksXqXS+0hoLk4T4gMMpNPc3VabkE=;
        b=36zoTO9c/nsr2altRjFLhBv0aNeeeVSiM7PdC/vw8JmPkIl0dPlLBoyKsn8AvEHqnd
         mORJtkqAstnA/QoXsVjlOUYXVRsbKwDLZexZ5Y/hrV5KiMa1mOcAaZe2uubJZYRmLpWw
         Kx9oMq7dOE5zpgr8lJGqY5pVaFxAsHJUHUltv0gjud3jAglM5oL/nJlKTFMAfpZWS36+
         Eky6kI6MGYCOkyJV5OhHvCa3v8rjWmwZSl9YSRC2T1YOwZpcIchYsYk445uMm24TCfC6
         d8CrSWEtHqnimZLbXjsKJ1HQ3/4rlqu/epFZ+HK4MqhgpLzba6NrJ+YQ8gWrK1c0U2jT
         aAwQ==
X-Gm-Message-State: ACgBeo2Yws7SsFRjBZhColK3h70W1sAPzNHfajvtl0HgA9l60GFD3vrK
	ll9A22ieaQc4qKyW8roPtlDKbQ==
X-Google-Smtp-Source: AA6agR7JcMHkHh8ZUZn6sBc9XLLw2UwJ67ykot+SgRWzq1/xgyoWWEGY6GA1e1ONf1nwKOdT8fXtxg==
X-Received: by 2002:a17:907:272a:b0:741:8105:49e2 with SMTP id d10-20020a170907272a00b00741810549e2mr28479988ejl.171.1662450190557;
        Tue, 06 Sep 2022 00:43:10 -0700 (PDT)
Date: Tue, 6 Sep 2022 15:43:05 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yxb6CdYHaymu130v@leoy-huanghe.lan>
References: <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
 <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
 <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
 <87r10puiey.wl-maz@kernel.org>
 <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
 <CAMj1kXFv2AhngPrrE2GWE3fxsL3pd0x8DSzUn-VQL-RrQhXjtw@mail.gmail.com>
 <Yxb2c6aLrcf8e16q@leoy-huanghe.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxb2c6aLrcf8e16q@leoy-huanghe.lan>

On Tue, Sep 06, 2022 at 03:27:47PM +0800, Leo Yan wrote:
> On Tue, Sep 06, 2022 at 09:22:00AM +0200, Ard Biesheuvel wrote:
> 
> [...]
> 
> > > IIUC, you consider the general flow from architecture view, so you prefer
> > > to ask Xen to implement EFI stub to comply the general flow for EFI
> > > booting sequence, right?
> > >
> > > If the conclusion is to change Xen for support EFI stub, then this
> > > would be fine for me and I will hold on and leave Xen developers to work
> > > on it.
> > >
> > 
> > As I mentioned before, proper EFI boot support in Xen would be nice.
> > *However*, I don't think it makes sense to go through all the trouble
> > of implementing that just to shut up a warning that doesn't affect Xen
> > to begin with.
> 
> Another option is we can set a bit for xen feature, so Linux kernel
> can read out the xen feature and make decision if need to reserve
> memory for RD tables based on the new feature bit.  This is somehow
> a solution is to create a general protocol between Xen and Linux kernel.
> 
> How about you think for this?

Just supplement info.  I tried to set flag EFI_PARAVIRT in Linux
kernel, but kernel cannot boot up successfully on Arm64.  Seems
the Linux kernel will not map memory correctly after settting
this flag.

This is why I didn't move forward with this flag.

Thanks,
Leo

