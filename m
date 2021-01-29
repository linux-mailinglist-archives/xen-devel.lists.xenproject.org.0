Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADB3087C6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77908.141445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qxc-0005Zj-1q; Fri, 29 Jan 2021 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77908.141445; Fri, 29 Jan 2021 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qxb-0005ZK-Ui; Fri, 29 Jan 2021 10:25:03 +0000
Received: by outflank-mailman (input) for mailman id 77908;
 Fri, 29 Jan 2021 10:25:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFjR=HA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l5Qxa-0005ZF-0y
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:25:02 +0000
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a7d7f86-41a7-47ba-857b-5c7afe87085c;
 Fri, 29 Jan 2021 10:25:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m1so3455704wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 02:25:01 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id u6sm12073978wro.75.2021.01.29.02.24.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:24:59 -0800 (PST)
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
X-Inumbo-ID: 9a7d7f86-41a7-47ba-857b-5c7afe87085c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=c7WR+3RccdjadefWiM4c1ValuO588F2mXx4BZYmjl9Y=;
        b=G+t5BddZbQg2tJYGRFFcGlPVOaYbsxdNOEor4AGM/bZ0CYZzW9aPgVpO6p3R9lFYM5
         /hxG2dzlqHnRwVxsEfC39LdbH2Gyv0pVvjSV/caBpN+EKZ7t1NsQx5yCNv0yotdJrgrx
         BS5HLoCqRIznwn9JD4HoO6fCfRTlrm8cF50+5G/bjj6ztYNy2myYZ8BqCzWuq6xYd8Fw
         N+wjcdIyAf0dHpuf4llfzwFAOJKFQgNfmQO6vf8jrjw7DcWddMyBQvAIfbNmi0U/PPNb
         cqguazi9gFPz9P5x538wybuwlIZ8DZ4U5utu07JwFxXcoNQPAhgNgi2quEu6D0huVtIb
         y6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=c7WR+3RccdjadefWiM4c1ValuO588F2mXx4BZYmjl9Y=;
        b=Ga+kQ5brutXboWteS3UIznNJwZ+DMupCvXwrt+HFuOCFS+e2eha0s9Y4W0ZXdkesuP
         IxG79SFaVJ5F4d7wht3J+Q0EMZH5tkTbHpOsTCzzjmW0uqJtd2ETAYtnhQPgDhWGk4nN
         sJKgnKfB26w425ajOLeoObyLEwSYgDiKFMVd4yonE2iRHQsFBVu6VCRcclCDFy7QRPN5
         MzdhLml4LUfzST2nRdBIeSFKq3yCm5M85UPq5yPlPCAD8J84AnaqTAeaKW7+YppLvXeR
         Q7AywfmSx//IEI2S+qCZXPSfPwdxwPqvBPCmTQraVhBWri8rDbI7uN6A0+CIa6B8Qr26
         4Dtw==
X-Gm-Message-State: AOAM5305EUYDJlxGEuo9XRWkilBkK7pHusthG9VyPzomC7u64AC2Ewuc
	wOezYc6zgOI+bDAh0rFILtc=
X-Google-Smtp-Source: ABdhPJya4iwVrI42kq9BHXxhNwGgils3uj+/IRBvJ1bdVDwqp8sib59LwlirH6ah9QZ8OziuyI2JnQ==
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr3236631wme.115.1611915900272;
        Fri, 29 Jan 2021 02:25:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com> <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1611884932-1851-24-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V6 23/24] xen/ioreq: Do not let bufioreq to be used on other than x86 arches
Date: Fri, 29 Jan 2021 10:24:58 -0000
Message-ID: <02ff01d6f628$ff5e1950$fe1a4bf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHcosR1Pl6co9bNaZKkGsPjYTbuUAGOhGsAqiaYJuA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 29 January 2021 01:49
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant <paul@xen.org>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>
> Subject: [PATCH V6 23/24] xen/ioreq: Do not let bufioreq to be used on other than x86 arches
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch prevents the device model running on other than x86
> systems to use buffered I/O feature for now.
> 
> Please note, there is no caller which requires to send buffered
> I/O request on Arm currently and the purpose of this check is
> to catch any future user of bufioreq.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 

Acked-by: Paul Durrant <paul@xen.org>

> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V5 -> V6:
>    - new patch
> ---
> ---
>  xen/common/ioreq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 67ef1f7..a36137d 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -629,6 +629,9 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
>      unsigned int i;
>      int rc;
> 
> +    if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )
> +        return -EINVAL;
> +
>      if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
>          return -EINVAL;
> 
> --
> 2.7.4



