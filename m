Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D9B1D6199
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 16:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZy1b-0005t1-Lc; Sat, 16 May 2020 14:42:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3AUN=66=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jZy1a-0005sw-7q
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 14:42:50 +0000
X-Inumbo-ID: 82f2d2c4-9783-11ea-9887-bc764e2007e4
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82f2d2c4-9783-11ea-9887-bc764e2007e4;
 Sat, 16 May 2020 14:42:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id se13so4799191ejb.9
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=74KTbtZzpez+dpiBE5+rnwJMvKyB20ZRlwXvxpPfhCg=;
 b=TG3R+CBMNWw3ZQEGKXfClHSJEgAnPzJJPGShhpnXOtjI6G2+KG1kf1/WUy1gEikvgH
 2w27UJ4oRsT8qxNlTFi3kXS/5SW/YIesq+/dNuBzWYNtEJCDHI6DGcXEJYVvBFdX5Lzi
 kq0XQxq+OP+mz3o/ijOO58FdGh7dBbZUr8cTZuP5iPXY7WnVELJVbvh2bu3FWNNIwBvv
 3tHl/myeHlC9QguqjpFbyQHUbLdbXX3vRMac/rODF9IFIA1bDFXgNJX21QC7O1DPyNAv
 v0AlH+1DavDBx+U/hGA5x115Jdt/0NqJyjI6LqfUvR8iDDqoqk4/bxenB3BTIbAO9h98
 95sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=74KTbtZzpez+dpiBE5+rnwJMvKyB20ZRlwXvxpPfhCg=;
 b=HeH47AHhRmT86D8EmyBBJcnUz4FC4EXRqXaphoX7Airx2XECVMtGbuug/4jfvFM5fl
 fqkXUkcBmz6ZGlNqYXfL7vWSMH5QyIDy3pVgXjP+Ltmaa8T7314EOu1gLa0iqWjEo+aZ
 +lp3mAs9cnZ07aQRrrRefyIL5wd1eOjksnOfYSpna1A0FQxaGtxrtMzAhVVpPlL4AuzB
 4PIRpZIQFc4UKrxM7d6SGLBVvQWzGENWsvcj32JcCrtqaGw6StBZoBM54sXKXX1yvw/+
 77QZafHBd9yDBwe0NrPUJZc7zE9Eqj/LgKIDOEmb/D4haVHP+LtgRUKtTypkReUTcrBU
 AQcA==
X-Gm-Message-State: AOAM5309B6i8Y9lbXt8nOO9kBa7HhnS03/7FM931Zd9vefWQ+msikoXv
 Ui6SHlxhF6srz4S0uNid5jPrgoDWnsY=
X-Google-Smtp-Source: ABdhPJx73Nm5GC76zpyBqI5DfdWrbwiIE0EuwNzEj7GMceadc+cfSQj1wvp2SSdhWEIHagXt0SUSPg==
X-Received: by 2002:a17:906:f98f:: with SMTP id
 li15mr7435186ejb.259.1589640167786; 
 Sat, 16 May 2020 07:42:47 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id c15sm707212ejx.62.2020.05.16.07.42.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 May 2020 07:42:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
 "'Xen Development List'" <xen-devel@lists.xenproject.org>
References: <20200516115438.1740-1-wl@xen.org>
In-Reply-To: <20200516115438.1740-1-wl@xen.org>
Subject: RE: [PATCH] CHANGELOG: add hypervisor framework and Hyper-V support
Date: Sat, 16 May 2020 15:42:44 +0100
Message-ID: <000001d62b90$4416fad0$cc44f070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIQi6qGIn4T8KibJ+ZyHrDtic922Kg2CP9g
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Community Manager' <community.manager@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 16 May 2020 12:55
> To: Xen Development List <xen-devel@lists.xenproject.org>
> Cc: Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>; Community Manager
> <community.manager@xenproject.org>
> Subject: [PATCH] CHANGELOG: add hypervisor framework and Hyper-V support
> 
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 554eeb6a1216..ccb5055c87b7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     the Xen hypercall interface or the viridian one.
>   - Assorted pvshim performance and scalability improvements plus some bug
>     fixes.
> + - Hypervisor framework to ease porting Xen to run on hypervisors.
> + - Initial support to run on Hyper-V.
> 
>  ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> 
> --
> 2.20.1



