Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF975A8B8C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 04:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396172.636215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTaCS-0005T6-OK; Thu, 01 Sep 2022 02:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396172.636215; Thu, 01 Sep 2022 02:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTaCS-0005Ql-KR; Thu, 01 Sep 2022 02:45:00 +0000
Received: by outflank-mailman (input) for mailman id 396172;
 Thu, 01 Sep 2022 02:45:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5LR=ZE=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1oTaCR-0005Qf-VH
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 02:45:00 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1031cd7e-29a0-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 04:44:58 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id y15so9210513qvn.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 19:44:57 -0700 (PDT)
Received: from smtpclient.apple ([87.249.134.31])
 by smtp.gmail.com with ESMTPSA id
 r19-20020ac87953000000b003438a8e842fsm9147695qtt.44.2022.08.31.19.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 19:44:55 -0700 (PDT)
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
X-Inumbo-ID: 1031cd7e-29a0-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc;
        bh=foeN+XUZn/u/JnPvfBjtGYGQ36AAShh/VZnPRVJHm1Q=;
        b=J/XftMDXDEkhrZqRELDF4KEZYH81x3bZ/TEUCc/BJe8XHcsaqMNVs4Nkea5er3gUGw
         SJr2iluNDzRvGXFdu5u6hbFooqIJO/I/xz5HPlKEwchxumwpnOiuHW2ZoJYLiykFDzSR
         tD1zE+yTirNgyrP+83R+PlnbNHHJzHtoCtaRuXUR4Wfa9cBm4VQJF+bzWhakf7oXWUtT
         9n7CwCFSj2qyKKP5b6cijnMYo4uAu0UM8mG37A45ne3gWruITr6zqo44P9nM0amfWvo7
         c/l1vGLkE2VKHkNYdNvvTQlYrxAQhqbacHZxNAGyT5kOMt2MC/f/uq2dAg2OMBDh40pB
         FVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc;
        bh=foeN+XUZn/u/JnPvfBjtGYGQ36AAShh/VZnPRVJHm1Q=;
        b=tF8SPQQ3SlWX1AjTQS5JJbw7e/jGaaixgamhd09loxT/Y2vHdRUKMf26Sal6kUySBW
         Zvq8iAPJe0HMbe9OkZM5ildRoiXUUzQqqI3ZG3r4PLzfA6mEtRo076MKKxgN+rUZ3SwK
         U5PFYnv2Rrw4dO1NpQ1fZ48vLS0M2Et+mVCz1KH/I4SOZQdR9pmj38BGcNiO1CoVNynq
         Yda/Dumj19f+vXMyHvWb/eV3QzBURO5WGcdam0OexTKciekm6LTaJ9PBnHZDURaNpSOJ
         Ukk+bCR419gaD4zbqjaDTiwi52+rSjkXE1xS0NNf4U6yBQirAVCZ+ZAf94TvUYHGEC6H
         dPKA==
X-Gm-Message-State: ACgBeo1nFfV19KfKXaTIX0zJ0r0nkYF7amdwzF5dtv15qWmcavFNZ5UG
	QwXngXTJOlh66I7x7NnYNSaQJ6DIkIQ=
X-Google-Smtp-Source: AA6agR4bUiWVYXX0Js9zMCXLvCzHB2ccFk177vlMRrzqAtO7zEfs8emQ/eHL1RC7qnv7mDYARED6oQ==
X-Received: by 2002:a0c:e082:0:b0:498:f8ed:9a94 with SMTP id l2-20020a0ce082000000b00498f8ed9a94mr19922158qvk.0.1662000295577;
        Wed, 31 Aug 2022 19:44:55 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: How to isolate vital part of a host with the Xen Hypervisor?
Date: Wed, 31 Aug 2022 22:44:54 -0400
Message-Id: <E046114C-14DB-424A-9C2C-A914F075B6DB@gmail.com>
References: <1677353127.432967.1661060142000@mail.yahoo.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <1677353127.432967.1661060142000@mail.yahoo.com>
To: Jason Long <hack3rcon@yahoo.com>
X-Mailer: iPad Mail (19G82)

On Aug 21, 2022, at 1:36 AM, Jason Long <hack3rcon@yahoo.com> wrote:
>=20
> =EF=BB=BFHello,
> Is it possible to install the Xen Hypervisor for just isolate my host OS a=
nd disable its Virtualization features (Install guest OS)?

You can often disable hardware virtualization via a UEFI/BIOS setting.  Even=
 if hardware virtualization support was disabled in UEFI/BIOS or already cla=
imed by a bare-metal hypervisor like Xen or ESXi, it would still be possible=
 to create a guest VM using software-only virtualization, e.g. VMware Workst=
ation.

Rich=

