Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B428A825652
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662199.1032162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLloM-00024Y-98; Fri, 05 Jan 2024 15:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662199.1032162; Fri, 05 Jan 2024 15:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLloM-00021v-5K; Fri, 05 Jan 2024 15:08:38 +0000
Received: by outflank-mailman (input) for mailman id 662199;
 Fri, 05 Jan 2024 15:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw3+=IP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rLloK-00021l-Gg
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:08:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c362e67-abdc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 16:08:35 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5572ffdba53so729915a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 07:08:35 -0800 (PST)
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
X-Inumbo-ID: 4c362e67-abdc-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704467315; x=1705072115; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJoUSU45VczFCaNl1ConIbPerIl2uDTgCHev27F2Jlk=;
        b=b09NzTZrE+ZuU9VZRqentzyvHmxYNDNBtrJSAjOL8abh6odvQ3p8aa1n2rbxQOs73y
         oHMNONEb3i6PUQcaTZZEKrq9jjJeSWYVmjFMYsKvQnw4qKsVvbkyPa5gCmHQhsSOuW+e
         63wTR7IX2EGOYHEeTO9lT7CTJw3goGp2LbRHHADBtPhXV0D3ZPKmhhnrxyruptfKWNbw
         VCCbNdsscXb1qESefZmjH/e18pxfj00sxazz950AypPDl03JSSRASmeYY98aOpJZA+2g
         W39uyUbvr4eyVQxHMsoIBYExMOnVRxsHWCCEWz7dcK+DutcgGkexkhxCjjaC418epbaD
         0szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704467315; x=1705072115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJoUSU45VczFCaNl1ConIbPerIl2uDTgCHev27F2Jlk=;
        b=FJHgHTc007pAPo/FPR+PEkq+5YpTMDpRvp6jnCS753/5jbZqNpUY6cvHfX3RHqBhyn
         x8dMer+6gag3BKFHUZkK7JoLN5ZGi1oAIshKk0JmLF6Nevsr4hk4/4kjsH/XdYq+ayl1
         +JSd48Zp4/oKcYGNsqOOVdw+hUzrkPdq9hd4fWmsrmNXwQs8CdUyBL+bKE3ed0kd1QC0
         kxwqppALSlJ3Tsun8pLGitaeYuvs7rOsJkmFQlb/p7YtbbHGll96KUS66RsFrmq3sgk0
         n4PLFIxoMNwF4zanO8YU9G2PIw6MI9u7lA8KdWVIQ2YGHLUMLVrhwpiY1NDQYt81qtBR
         8T4g==
X-Gm-Message-State: AOJu0YwaN7bFFoMrF5hyxuFgm9/54heAfqRosQI0xHTzRllJ7hLp+l0p
	xfm83LFmPmlCu2nwoPeQy0eCimMQX27M3QVr0y4=
X-Google-Smtp-Source: AGHT+IGSkLuNJL0XoG2TRoF71Va+FkvVLt4sZXYanemN1ZKuiuHdkRCWEe6423GVx6LIaRf5hDSw9dMKx7aiHOjFa/I=
X-Received: by 2002:a05:6402:329:b0:557:4ea:bca1 with SMTP id
 q9-20020a056402032900b0055704eabca1mr1223761edw.21.1704467314974; Fri, 05 Jan
 2024 07:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-7-jgross@suse.com>
In-Reply-To: <20240104090055.27323-7-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 Jan 2024 10:08:23 -0500
Message-ID: <CAKf6xpvMhNLJtZEjRCPxSrwm0juRz+QS5LcM-SPr0RU0WRhbPA@mail.gmail.com>
Subject: Re: [PATCH v3 06/33] tools/xenlogd: add 9pfs response generation support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:01=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for generation a 9pfs protocol response via a format based
> approach.
>
> Strings are stored in a per device string buffer and they are
> referenced via their offset in this buffer. This allows to avoid
> having to dynamically allocate memory for each single string.
>
> As a first user of the response handling add a generic p9_error()
> function which will be used to return any error to the client.
>
> Add all format parsing variants in order to avoid additional code churn
> later when adding the users of those variants. Prepare a special case
> for the "read" case already (format character 'D'): in order to avoid
> adding another buffer for read data support doing the read I/O directly
> into the response buffer.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

