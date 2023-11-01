Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6517DE604
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 19:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626599.976974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG0M-0001BH-ME; Wed, 01 Nov 2023 18:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626599.976974; Wed, 01 Nov 2023 18:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG0M-00019V-Je; Wed, 01 Nov 2023 18:31:50 +0000
Received: by outflank-mailman (input) for mailman id 626599;
 Wed, 01 Nov 2023 18:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyG0L-00019P-EE
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 18:31:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2da68e-78e4-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 19:31:47 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso129124a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 11:31:47 -0700 (PDT)
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
X-Inumbo-ID: ea2da68e-78e4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698863507; x=1699468307; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r35kq6aNpBPoiRm92FKmop6KGmCD9BwrUQdIpaY8jZw=;
        b=F9iIo0CGTn97/vI9GVCbpVsJm0uEKjvHK9tQlRk/0pSdi3pZKxJDowegt/NLqMF0cZ
         7OoWWWh37fAJpwADSOQJDf8hi39EK3jEFuUVpQdZ0ud52NcV3Yx2fB4AgRBsf3Z6ccnv
         ImAZ1KA7UG8sjYNoT9u6rfdO+5IS96Yo5YAGhgmqk2piIF9y7s/fkfcsiP7zfZ2VNPE1
         zosuNA9SAzwW/yFFip6678k/8nvOmknvKrYx+9zdmBEZSC+MR8aWgzziLsFcDwZB03md
         fg7TM7LFKzMHJsRe2QEfyvVf/vkx/yG9Cx4cqjOmB1yg+rQJ5mmzqGvbNLJe3cqYcjAV
         y6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698863507; x=1699468307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r35kq6aNpBPoiRm92FKmop6KGmCD9BwrUQdIpaY8jZw=;
        b=YTDw5Akrd9tY38WkeEH7azfPWi3gJE2M5S+wOYnEkPIyFOFDWvhoPpb0aWtfRrmMnI
         fek4v1YEj11Qarh8wyiDr9s0ds73RGKj18+zEfUlXzGqc1jiSfuWiA+kWHjo3/D2j6oS
         DSb4Mj/E106aY8BGaNfMiCPXlqktAO2BKmKpRM+jz/vpH1kpj7RPljM+Wu32YxxhxDth
         BC4P8Zct5HCPg0giMGboTy5Y0Rlh6/84O9or8UlR3SUR3exi+4S88xGU/LxEQ05SmFWm
         MLhArNX69MFwg2QCPFyLZoEsMQyceozDYdqUoub/loo3F1S6b24R1IyZWxcm3C9LYS51
         amKA==
X-Gm-Message-State: AOJu0YzlXqP7tZVYLd2E9Zg+ds5/EXv4B+uhCX/zCbW/DFgfU4Ge3F06
	IYGqt13uX0ILG/h2tmXJijGJmYwHHQ87L8B8dva01AU+
X-Google-Smtp-Source: AGHT+IH3ONEnch0NVpVjsgxvkQKgrBOX0QE/dgh7uhUY1AMpbY3KbxI7cQjWJdfNsAN9s6paaZRMPII88EVcvhTp/fE=
X-Received: by 2002:a05:6402:54f:b0:53f:a4f7:7bfb with SMTP id
 i15-20020a056402054f00b0053fa4f77bfbmr12397312edx.17.1698863506524; Wed, 01
 Nov 2023 11:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-2-jgross@suse.com>
In-Reply-To: <20231101093325.30302-2-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 14:31:33 -0400
Message-ID: <CAKf6xpurEpafOr=UkDhK=5yQs+j3Og0ar6ixGNoRcz6KZt+9LA@mail.gmail.com>
Subject: Re: [PATCH 01/29] xen/public: add some more 9pfs xenstore paths
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 7:24=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add some optional additional backend paths for 9pfs PV devices. Those
> paths will be supported by the new xenlogd 9pfs backend.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/include/public/io/9pfs.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
> index 9ad2773082..ac4bf0434b 100644
> --- a/xen/include/public/io/9pfs.h
> +++ b/xen/include/public/io/9pfs.h
> @@ -71,6 +71,40 @@
>   *                 created on the guest (no user ownership squash or rem=
ap)
>   *         Only "none" is supported in this version of the protocol.
>   *
> + *    max-files
> + *         Values:        <uint32_t>
> + *
> + *         The maximum number of files (including directories) allowed f=
or
> + *         this device. Backend support of this node is optional. If the=
 node
> + *         is not present or the value is zero the number of files is no=
t
> + *         limited.
> + *
> + *    max-open-files
> + *         Values:        <uint32_t>
> + *
> + *         The maximum number of files the guest is allowed to have open=
ed
> + *         concurrently. Multiple concurrent opens of the same file are =
counted
> + *         individually. Backend support of this node is optional. If th=
e node
> + *         is not present or the value is zero a backend specific defaul=
t is
> + *         applied.
> + *
> + *    max-space
> + *         Values:        <uint32_t>
> + *
> + *         The maximum file space in MiBs the guest is allowed to use fo=
r this
> + *         device. Backend support of this node is optional. If the node=
 is
> + *         not present or the value is zero the space is not limited.
> + *
> + *    auto-delete
> + *         Values:        <bool>
> + *
> + *         When set to "1" the backend will delete the file with the old=
est
> + *         modification date below <path> in case the allowed maximum fi=
le
> + *         space (see <max-space>) or file number (see <max-files>) is b=
eing
> + *         exceeded due to guest activity (creation or extension of file=
s).
> + *         Files currently opened by the guest won't be deleted. Backend
> + *         support of this node is optional.
> + *

These seem reasonable, but it looks like xenlogd only implements
max-open-files.  They are all marked optional, so I guess it's okay to
include them.  Is there a plan to implement them?  Maybe hold off
until an implementation comes along?

Regards,
Jason

