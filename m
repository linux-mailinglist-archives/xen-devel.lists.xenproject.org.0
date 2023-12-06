Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9158072F1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 15:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649327.1013716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAtAn-000640-DU; Wed, 06 Dec 2023 14:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649327.1013716; Wed, 06 Dec 2023 14:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAtAn-00061v-Ak; Wed, 06 Dec 2023 14:46:49 +0000
Received: by outflank-mailman (input) for mailman id 649327;
 Wed, 06 Dec 2023 14:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OP1m=HR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rAtAm-00061p-6n
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 14:46:48 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d7eaa7-9446-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 15:46:47 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c0f3a7717so30038555e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 06:46:47 -0800 (PST)
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
X-Inumbo-ID: 47d7eaa7-9446-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701874006; x=1702478806; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rthd2mvd+O3Ss6Abxt7nn4UQmcRGMNZLTtFOesTF8yc=;
        b=Vip/xKnGRSQOUv4GBw9CQnC6pYFf+s+RgPBQs9Lcco2DF/NGA65SlE2WXKKTSm539r
         kpCJ951KKjV8WP+21kfhLo/lkHH0gVXJx5r7HtKhVlx0dflqzpu2Ut0tljvRX2q6ZD62
         1R12GyUfCc1IMlomI61O1QrVbZZvVssIkPVP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874006; x=1702478806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rthd2mvd+O3Ss6Abxt7nn4UQmcRGMNZLTtFOesTF8yc=;
        b=nAw8PePrFuHGlU3HSZy3Olwq7/aWOY49U4tYZAD2JfT8v0wyDW7kflln72FFHdgJJb
         SHHA+GVp46xOlt/2zDgO2dfd1yT/49S4l98svJJ2BoPsXoK4JbCWGI1WsThEqQ8goAQ+
         3s2uN5pjRFDVT0uJjWmMlEvp9RFKIpXmNx92AZ+QH/ceGOm0a9YhZy7SJgD24qfKmvu4
         cRzF0lIAWqmI1nNhS8Z+rxLzJ6NmhBk1bIVT1Mlym6GBaIgPEeiRTBWil3jEArXCIQ/D
         /V46bUJtPW1XgzjW8oKsrhJAPR7mB+sMU+IXTUljJwyPIXd2A2wsCKFQt+DJWTuKMg+U
         8znw==
X-Gm-Message-State: AOJu0YwEV/TeIfN+wuy0m0HHIeL5YNqvf4C/2z9ZhQ+aC+aJDqQ99IWQ
	FszuY6J2CkXGynp6Gzbl9e/0DhTbVzuKsnVkwJ2Y
X-Google-Smtp-Source: AGHT+IEIqSvEhlkBNPVzAhRsl9mW1+0dqTQRWZa3p9cQD7FwNoGGJI39/6Fi9GfN6FItDjA1MEhLBE/ZCNZmRplMETE=
X-Received: by 2002:a7b:cb91:0:b0:40b:5e59:f715 with SMTP id
 m17-20020a7bcb91000000b0040b5e59f715mr284836wmi.135.1701874006561; Wed, 06
 Dec 2023 06:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20231128092152.35039-1-roger.pau@citrix.com>
In-Reply-To: <20231128092152.35039-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 6 Dec 2023 14:46:34 +0000
Message-ID: <CAG7k0EqmuRV5iQ-uefQi2fCdMzF1UaNdiiT7gKitgH5Ed+TrWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] livepatch-build-tools: fixes for non GNU tools and alignment
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 9:22=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Hello,
>
> The series contains two fixes for using the tools on non GNU
> environments, plus one extra fix to account for section alignment when
> calculating old function size.
>
> Thanks, Roger.
>
> Roger Pau Monne (3):
>   livepatch-build-tools: do not use readlink -m option
>   livepatch-build-tools: remove usage of gawk
>   livepatch-build-tools: account for section alignment when calculating
>     function size
>
>  common.h             |  2 ++
>  create-diff-object.c |  5 +++++
>  livepatch-build      | 38 +++++++++++++++++++++-----------------
>  3 files changed, 28 insertions(+), 17 deletions(-)
>
>
> base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
> --
> 2.43.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

... and applied, thanks.

