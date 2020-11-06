Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224512A9522
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 12:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20646.46674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazmq-0003Qu-Vo; Fri, 06 Nov 2020 11:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20646.46674; Fri, 06 Nov 2020 11:20:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazmq-0003QU-Qt; Fri, 06 Nov 2020 11:20:08 +0000
Received: by outflank-mailman (input) for mailman id 20646;
 Fri, 06 Nov 2020 11:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kazmp-0003QP-06
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:20:07 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fcba73e-1205-48d9-ab96-8cd29fb35ccb;
 Fri, 06 Nov 2020 11:20:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so123097wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 03:20:05 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id g66sm1846381wmg.37.2020.11.06.03.20.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 03:20:04 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kazmp-0003QP-06
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:20:07 +0000
X-Inumbo-ID: 8fcba73e-1205-48d9-ab96-8cd29fb35ccb
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fcba73e-1205-48d9-ab96-8cd29fb35ccb;
	Fri, 06 Nov 2020 11:20:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so123097wrx.5
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 03:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0e+HHUGLIriVxrXE4S3yIBNTph4M1aFCuoUD1LC7hwg=;
        b=GFsjnWaBn4pEr7u1fdrDBR9sCQRpscB9ukDIMr4NkXrzG4pUhh2rE865oY0R5WdPIn
         qlBl/FH2pLSbU6kQasig8af4aTexef9UVNUrfaelCVA/ybb0S5cUhOnU9AFI2m2xXs9Z
         E6Ypn16c20UiH8+cFaQmSSS0WCZBsyowVoFaL8AJrFXrcBSIGAstseLgOBR2OPhTiVTA
         FVd3Rd5+eKn9LTQegcAK3SMbJDP5si4lxvtBhoBqF7tiJcTvlIzqfHPvGqdvunk7Fwh2
         atfCa41e350+bONWfNR2XTqyn/F3FDkRobcLDc7lAbAgy/L3EYofpy7cKjfOyPMylLMw
         mwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0e+HHUGLIriVxrXE4S3yIBNTph4M1aFCuoUD1LC7hwg=;
        b=TSRHwRad3sKsXvchrfhMJTu5LGmx127omNuNektd42Waa9EHpSJlTQRUSd5DHX/nzI
         3CJ4VebLm3VrlDFIanPnO01MSwuoo7kFePUhYxrZyxszdr64AdgEL8TTMr77DMe0hxTg
         00E+3QrWnzrmvRwj4UaU4o6TyIiFyZ697qxDh/m4J41uYlgUJR84HIaFR4GToBUqYNmG
         XZa2dr0dNgpb/M+uYlA3ANtJfiYkwpT465r2+aNuFc9AAqagvic7y2Eujz7zwjJfO5yI
         /UcJdC/w02Ns66VbjNSH06FzszszH+0jUrNXSwH9VInmKEnWTb2upNleTq7cTSi+eYOW
         QqJA==
X-Gm-Message-State: AOAM532az0cUAvnK+5XlLh+UnnGPmp0x/e112bTJ7ScvprApwA1DOvcY
	8J+WaTDsEUqHpBidW/crJZI=
X-Google-Smtp-Source: ABdhPJyZOGoA5H9byxnrlEE7pI2yEtfVzW6QCq2Joy2jbe/AUMDl6kaW65/Av2m+ud+JDLuoTFEKLA==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr1991047wrn.281.1604661605141;
        Fri, 06 Nov 2020 03:20:05 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id g66sm1846381wmg.37.2020.11.06.03.20.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 03:20:04 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: julien@xen.org
Cc: ash.j.wilding@gmail.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 4/6] xen/arm64: Port Linux LL/SC and LSE atomics helpers to Xen
Date: Fri,  6 Nov 2020 11:20:03 +0000
Message-Id: <20201106112003.55831-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <d6ea3f34-cef5-4a2d-499d-6adb572d6d4a@xen.org>
References: <d6ea3f34-cef5-4a2d-499d-6adb572d6d4a@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Julien,

>
> First of all, thank you for taking a stab at adding LSE support in
> Xen!

No problem!


>>
>> In retrospect I should have put an intermediate patch between #3 and
>> #4, deleting the existing headers. This would have made the patch
>> diff for #4 and #5 much easier to read seeing as they are copying the
>> Linux versions wholesale into Xen.
>
> While I agree it would help the review, it would break Xen
> bisectability. Although, it should be feasible to fold all the patches
> in one on committing.
> 
> If you are going to split the patches then I would suggest the
> following split:
>    1) Remove Xen atomic headers
>    2) Add a verbatim copy of the Linux headers
>    3) Modify them for Xen
> 
> With this approach, we can focus on just Xen changes rather than
> having to review the Linux code as well.

Ah-ha, yes, that would be better, I'll do that.


>
> We usually keep Linux coding style when a file mainly contains Linux
> code. This is making easier to port future fixes from Linux to Xen.

Understood, I'll drop those updates,


>
> Regarding the review, I have quite a bit of backlog for Xen at the
> moment. I will try to review the series in the next couple of weeks.
> I hope that's fine with you.

No problem at all, and actually that gives me a chance to find some
spare time to post an updated series with the approach you outlined
above (I'm probably not going to get a chance to work on this for at
least a week now).


Many thanks for the feedback :-)

Cheers,
Ash.

