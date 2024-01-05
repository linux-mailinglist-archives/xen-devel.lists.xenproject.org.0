Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F538825287
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 12:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662130.1032047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLhwX-0006Je-DA; Fri, 05 Jan 2024 11:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662130.1032047; Fri, 05 Jan 2024 11:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLhwX-0006Gv-AB; Fri, 05 Jan 2024 11:00:49 +0000
Received: by outflank-mailman (input) for mailman id 662130;
 Fri, 05 Jan 2024 11:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DC4=IP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rLhwV-0006Gp-QI
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 11:00:47 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad0d4686-abb9-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 12:00:45 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e72e3d435so1513169e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 03:00:45 -0800 (PST)
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
X-Inumbo-ID: ad0d4686-abb9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704452445; x=1705057245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvETyhMXNpgufszU7B8WEonmZkTWwWXALuVC/A9t5JE=;
        b=J3nDWF9HqckwdHTGCqpjkQnPmI+0lDw+nsWhOSlh0K5Ss5hDJC6BkiCDzQSMxoLSZh
         g9eTZ9cAfcsHNa8e35TeFoKQmt+kkkdUHuKc+AsZU6SQIf4AcFLcW9RJ4gupJghy7yrP
         2Cnk4XpTFyMYsy0iZJlDTnDeCWFNANaG+mxRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704452445; x=1705057245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvETyhMXNpgufszU7B8WEonmZkTWwWXALuVC/A9t5JE=;
        b=mGj3Qn/5Ys0LzbJQLsqLzCwrNAxC6xjTkI5mGd1I4xvnEONoMPpD8N1AC2U4yI3wXh
         uFmqz8/baI8h8HyaPtaf6LOGXpVRgo19qpjaymmgwWXY/ezZxL/vpaUvZEqh1hwWb21S
         EXQVXOlTse2UY8CA3Q7N4w+fNnu1JzUHeF9pSzvcZPJHMf7IyHa/S9qCY1GJ9IwNziVJ
         Q5HL7JBhnAyciZWv9wHwRcZI6hcJRykfMkpTqS1G9qpqUi8v7NhnfzCasSHcJuo0J40Y
         0kBdV+e2iW/Ncy3RhIl4/zLU8lWW/x6myEqbtBTwxYyhFtO6eIFEb0geoJDQU0+pAp1M
         jtdw==
X-Gm-Message-State: AOJu0YzbaAZBqgQFhVLhcpPUOgaKThjxKFiEkOl1l3wXV/lIHM+IULJ/
	OyrrYGDvjoy4K+B6rBjiYm9Jo9SQFbPkajC46bvH4+TCjpUJsA==
X-Google-Smtp-Source: AGHT+IFBO8bquWvete2LZqNkUAbyyY0hKdL5zTAEnub/omtOY2zrtEZT3OERsXDA8jQ+Osr16vVi9lsnGtK5yPf6HdU=
X-Received: by 2002:a05:6512:304b:b0:50e:ab4d:abc5 with SMTP id
 b11-20020a056512304b00b0050eab4dabc5mr850339lfb.116.1704452444756; Fri, 05
 Jan 2024 03:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-17-jgross@suse.com>
In-Reply-To: <20240104090055.27323-17-jgross@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 5 Jan 2024 11:00:34 +0000
Message-ID: <CA+zSX=bkDeH8GYDrcKxo7Ph9y5rHB7s64z2c-RnZgHYN8tSbzg@mail.gmail.com>
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV devices
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <rosbrookn@gmail.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 9:02=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Make the backend type of 9pfs PV devices configurable. The default is
> "qemu" with the related Xenstore backend-side directory being "9pfs".
>
> Add another type "xen-9pfsd" with the related Xenstore backend-side
> directory "xen_9pfs".
>
> As additional security features it is possible to specify:
> - "max-space" for limiting the maximum space consumed on the filesystem
>   in MBs
> - "max-files" for limiting the maximum number of files in the
>   filesystem
> - "max-open-files" for limiting the maximum number of concurrent open
>   files
>
> For convenience "auto-delete" is available to let the backend delete the
> oldest file of the guest in case otherwise "max-space" or "max-files"
> would be violated.
>
> The xen-9pfsd daemon will be started by libxenlight automatically when
> the first "xen_9pfs" device is being created.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Golang bits:
Acked-by: George Dunlap <george.dunlap@cloud.com>

