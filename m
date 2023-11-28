Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7177FBDC2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 16:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643275.1003295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zjk-0002cD-Nt; Tue, 28 Nov 2023 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643275.1003295; Tue, 28 Nov 2023 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zjk-0002Zd-LD; Tue, 28 Nov 2023 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 643275;
 Tue, 28 Nov 2023 15:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7zji-0002ZX-Gd
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 15:10:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 520969e0-8e00-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 16:10:52 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b4746ae51so16383405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 07:10:52 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0040b461550c4sm7768321wmq.42.2023.11.28.07.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 07:10:51 -0800 (PST)
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
X-Inumbo-ID: 520969e0-8e00-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701184252; x=1701789052; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLNibJvrjMO3uRFvCgjt9Ev3cYVuLCIh5E9o8xGyToQ=;
        b=ibR/a2ghaBpE4Iimiyq5BeesPd+fM3Dc4WsJSlxsTFdo3WsfwUuLPiqhn5tkkLx6Le
         +/tXXgaxb2Fadj69X6BQXjYkK/SMe5m5h5aWkDNH+GYqkWuZ0Ycrsylw5zh6fTeYv4ih
         pB9W0wSwNKPwT5w0NPzakhnYw7j0d3zsj+4JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701184252; x=1701789052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLNibJvrjMO3uRFvCgjt9Ev3cYVuLCIh5E9o8xGyToQ=;
        b=KHXChUOVc4M+WrXe7514mS+NC2L/eyBAJM9Yz/9mynyAyK1oAc4E/DzSLhwXsMgM/W
         nMAr2yW86UDJ0GaqGa6K4YkU0fYXFTXZCHl5RvSrdN8sjINcpIEJc6n90CrnaNW+WUsv
         I3MguqBc2pZOs9QZDb1PsRwdFyK3dlxVYHkkQU6QbAPsrb6qU5GxMe6Wdkn7PCr1TFv0
         lSBbVIGSM/qfzaJPQn9Zxx7emRTXmqqR+nDY0/7YYIHr7YgdIjljIJgRMJEOf3HLz2Ar
         8ljpT5FIOmgKdswik1wCoWjrTxOWkQSluGz/1YFWcomNObQTsI0DwBPjLZ9CNr+kA64H
         kg8g==
X-Gm-Message-State: AOJu0YwkIAfROiM82o4QcbM1fMekOpokoSXKB5kQuJIs5Yh1XjepwnwW
	DljmbnmJlGCiZKsPHtA5R0W1Lg==
X-Google-Smtp-Source: AGHT+IFElYnUcRrY/li6jlpQCWrfWUuE1j7AQcUyaS+ZdZL22Nr7fyD+5N8YXwsus14Dd+AvhUjicA==
X-Received: by 2002:a05:600c:41d1:b0:408:575e:f24f with SMTP id t17-20020a05600c41d100b00408575ef24fmr10796659wmh.28.1701184251711;
        Tue, 28 Nov 2023 07:10:51 -0800 (PST)
Date: Tue, 28 Nov 2023 16:10:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mario Marietto <marietto2008@gmail.com>
Cc: Elliott Mitchell <ehem+freebsd@m5p.com>,
	Chuck Zmudzinski <brchuckz@netscape.net>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Message-ID: <ZWYC-omtTOxIHNwF@macbook>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
 <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
 <ZWXvBMaRJ5Lbb5S9@macbook>
 <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>

On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:
> For booting a FreeBSD kernel as a guest OS on XEN,should we install xen
> 4.18 from source ?

Please avoid top-posting.

I don't think so, I'm not aware of the FreeBSD port requiring a
specific version of Xen.  I do think the work is limited to aarch64
however, so there's no support in sight for arm32 FreeBSD guests as
far as I'm aware.

Regards, Roger.

