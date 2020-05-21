Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DBD1DCFC6
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 16:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbmFo-0007Nq-54; Thu, 21 May 2020 14:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFaT=7D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbmFm-0007Nl-Qa
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 14:32:58 +0000
X-Inumbo-ID: f7238086-9b6f-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7238086-9b6f-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 14:32:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e1so6871925wrt.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=zKSOPYOLfBtebqtUZ9nUuJvjZj6P1Uk4p6vE8GifzlQ=;
 b=qW7qhMIfVIwQOWESBC9LoZ+K6qYnNqkXC4fYjS/F6lM4GkvSTuqjbXIAOlgJj6GEkp
 wqjfj+WOCS5zw3kbyP9hNLTbuFjnhsADkDxIKCyeluPq09nkMqlAwCEJNEU+bzS5oYFL
 hJqaYDxjK392v1PwT5U+pOBvxCTUSA7opzbClI3Rp7QqPQv52aDnXwLeVYlUor/nagiw
 3kdDyiBfxMq6gG1W7PhN0WZqsxqGBKZa5Ioub8nuEnwkVUk/e0adnY43zQi2zLO15EvD
 r7685nh1YtjOAzoH1lFx4fN3ynHnNUEcz6iSOTZSeoYlZqtUpZPIPiPqZmCfoXZv4PpA
 Xkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=zKSOPYOLfBtebqtUZ9nUuJvjZj6P1Uk4p6vE8GifzlQ=;
 b=ngAWE9dTyJPgcMThc+Qq5odfIlSO9giqhs9KZ8rWMXy7tpXU4nWWrCrmMnCXOAtNoF
 lXRmP/i8H276RI/Pt1+uKm0Rmz5ZfSazYIcsgzMtTl1eCPxB8jbNBQ3MtJwEyhy5O+NR
 NeL+KFWW/7sFqsbaO+vP54fzRxgW4c+rbzrrelgcv/0/BDRcLhl6c2KYkNd4K5Qf9572
 maorRQ/hQkaiiS+//RUiGvWDFuJgkG3PjPgTFjmM0lit+cs/0BLGoxEs7mqVszBv8Fd8
 SCOtACt83LHOP/k0nGHzuKYTf8BNNPi173aIq/yXFqp7eO6cJD42rTKRGeqCVZk/bekA
 nBYQ==
X-Gm-Message-State: AOAM532hteFeGttP348TcBcBqef/5ZGrvkEXnAhZNOuBecmwy2Yh7rv9
 6MU6zG9I77oqC7n81I7X0PU=
X-Google-Smtp-Source: ABdhPJx6K5IKcwYwxqWXDuiuH1dQNuOJBw4oyiNFCEUV9HGKNRqkn/fPLWBUIJ4WfEnmwi02x8jteA==
X-Received: by 2002:adf:f304:: with SMTP id i4mr8605450wro.169.1590071577450; 
 Thu, 21 May 2020 07:32:57 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id n7sm6629538wro.94.2020.05.21.07.32.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 07:32:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <george.dunlap@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200521142138.3528654-1-george.dunlap@citrix.com>
In-Reply-To: <20200521142138.3528654-1-george.dunlap@citrix.com>
Subject: RE: [PATCH] CHANGELOG: Add an entry for golang binding updates
Date: Thu, 21 May 2020 15:32:55 +0100
Message-ID: <004201d62f7c$b846b4a0$28d41de0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGYdPJLPKTHHfC2jORfcIiXGcpiN6kuDtzQ
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
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: George Dunlap <george.dunlap@citrix.com>
> Sent: 21 May 2020 15:22
> To: xen-devel@lists.xenproject.org
> Cc: George Dunlap <george.dunlap@citrix.com>; Paul Durrant <paul@xen.org>; Nick Rosbrook
> <rosbrookn@ainfosec.com>
> Subject: [PATCH] CHANGELOG: Add an entry for golang binding updates
> 
> Wasn't sure whether this sort of thing was what was wanted, but
> thought it was worth trying.
> 

Seems worthy of comment so...

Reviewed-by: Paul Durrant <paul@xen.org>

> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Paul Durrant <paul@xen.org>
> CC: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ccb5055c87..5aa6af612f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     fixes.
>   - Hypervisor framework to ease porting Xen to run on hypervisors.
>   - Initial support to run on Hyper-V.
> + - Golang bindings: IDL generation of structs, more functions covered,
> +  more module-friendly (still Experimental)
> 
>  ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> 
> --
> 2.25.1



