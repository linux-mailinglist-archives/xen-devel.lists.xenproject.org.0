Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E35AE112
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399520.640713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVT00-0004nY-TI; Tue, 06 Sep 2022 07:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399520.640713; Tue, 06 Sep 2022 07:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVT00-0004lB-QY; Tue, 06 Sep 2022 07:27:56 +0000
Received: by outflank-mailman (input) for mailman id 399520;
 Tue, 06 Sep 2022 07:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVSzy-0004l5-Kq
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:27:54 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1573a9-2db5-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:27:51 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id q21so6296364edc.9
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 00:27:53 -0700 (PDT)
Received: from leoy-huanghe.lan ([104.245.99.30])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a056402206d00b0044e66ee9b62sm4352880edb.42.2022.09.06.00.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:27:52 -0700 (PDT)
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
X-Inumbo-ID: 6a1573a9-2db5-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=r97Hr2tIjhJhFdhmIL0iyamjWyuw56fyzIW/bYy/ves=;
        b=nj37FT9i8EAIVCZna21mXMP+De91OIM3128LkxFzo9+3RJu4WhovL6P/uhLXEDYS0+
         GoWnF82Y93/qRsY4r1WnCYaTMB1R1vWKhaV9C7ceC0aYApcj46OI5Zzsu+fb1JFSM708
         g0R+oECRFy64aOrlIURD4S3exqjvK4J9EMH+9veWtHO5ByPsv3+Bgcw3tEzwsoVu69Z3
         tn3agyPiBp6A6IOXueVToB8ZHlCy3It6C/kJpJw35UYVALktZlEeFNbHhZwv5D38Opd3
         F35CdCeFLFA4e9Nrrqnn5kXlGFNer1wiqT5sJTj4kwmlcOE/jAkRT38Q3C7x2mW0Ec5u
         d88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=r97Hr2tIjhJhFdhmIL0iyamjWyuw56fyzIW/bYy/ves=;
        b=QiC1Hfglhx4xnxKXxkM5vBUZGaQ5h2AQ7LpNDg1E/zleH8ckEUpUAPH3CMqTeKOjgA
         VFb1NcGg234NANFt+ebqt9gHIrAbbFjfktfVv1XPFTdro1MzDjaYsABRgS3iny9zsW72
         4MzDJmtozL8h09BSmgGiuVfhTh3j5+ZLofJd545jxP7p3KN2y8u/u0PlDlWMZp0ZmCIc
         wAkaoNd4UisOVqc3MnSyp0F//oVrmU+LYwoYsdI5n60PPw1tqM4EKJtBAmUfGu2CwRdc
         rBItLUDCSmlnQ3WgLCXX/ITcLyzDwkZNm+Co0Q9fnTGZln1C1tn+RfiRu+eecsp33sr4
         5hhA==
X-Gm-Message-State: ACgBeo1vmCtkwgZ7kfYey75e039h6sTyByLJvGiuUSsCEPYBXUVPLs8v
	aYQ7qf1UHpIG1904OBE1cDLLIA==
X-Google-Smtp-Source: AA6agR4m9A61zk+lILhAE2bAfwnJhWShz293gbKx4fxg9D6A03n23xPygakWw1BdFf+yz/ig9/qZcA==
X-Received: by 2002:aa7:d98c:0:b0:44e:affc:7000 with SMTP id u12-20020aa7d98c000000b0044eaffc7000mr4439480eds.269.1662449272818;
        Tue, 06 Sep 2022 00:27:52 -0700 (PDT)
Date: Tue, 6 Sep 2022 15:27:47 +0800
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
Message-ID: <Yxb2c6aLrcf8e16q@leoy-huanghe.lan>
References: <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
 <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
 <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
 <87r10puiey.wl-maz@kernel.org>
 <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
 <CAMj1kXFv2AhngPrrE2GWE3fxsL3pd0x8DSzUn-VQL-RrQhXjtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFv2AhngPrrE2GWE3fxsL3pd0x8DSzUn-VQL-RrQhXjtw@mail.gmail.com>

On Tue, Sep 06, 2022 at 09:22:00AM +0200, Ard Biesheuvel wrote:

[...]

> > IIUC, you consider the general flow from architecture view, so you prefer
> > to ask Xen to implement EFI stub to comply the general flow for EFI
> > booting sequence, right?
> >
> > If the conclusion is to change Xen for support EFI stub, then this
> > would be fine for me and I will hold on and leave Xen developers to work
> > on it.
> >
> 
> As I mentioned before, proper EFI boot support in Xen would be nice.
> *However*, I don't think it makes sense to go through all the trouble
> of implementing that just to shut up a warning that doesn't affect Xen
> to begin with.

Another option is we can set a bit for xen feature, so Linux kernel
can read out the xen feature and make decision if need to reserve
memory for RD tables based on the new feature bit.  This is somehow
a solution is to create a general protocol between Xen and Linux kernel.

How about you think for this?

Thanks,
Leo

