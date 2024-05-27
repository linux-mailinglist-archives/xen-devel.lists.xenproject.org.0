Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4E8D0261
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730789.1135993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBas8-0002LK-Jd; Mon, 27 May 2024 13:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730789.1135993; Mon, 27 May 2024 13:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBas8-0002J8-H4; Mon, 27 May 2024 13:58:44 +0000
Received: by outflank-mailman (input) for mailman id 730789;
 Mon, 27 May 2024 13:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBas8-0002J2-3S
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:58:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a4b2887-1c31-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 15:58:43 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a61b70394c0so929036366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:58:43 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cd83a1csm490519766b.182.2024.05.27.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 06:58:41 -0700 (PDT)
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
X-Inumbo-ID: 3a4b2887-1c31-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716818322; x=1717423122; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HjNPVFcP/yRzwM+RW4KiStmJdpjIWyn2MZUIplWjrN0=;
        b=NkWpAyF81ZZwVMsh9hAUtk/mVsR9euRf+cfZpTIsjZxTirZG5OFmWOjNLl9/Ex7nlm
         AGEN5WWYCN4BfPYF8KzLEgqK2zOwT8qo2RNjPtaU4OjI3vvpw4keB/rBMSdTd7U4+/Pe
         ep/zXvFgUgF3l6eCiqvVKf5XfLY76AbEvnRzEiJDVD0nrz0pQTl0AOCUHfUJl0xxOHbS
         tSTH4cpkLyH05Fgg1nhjniv2DhxOlLScOVXVhFESi2sqU1bPsIyiasMBfINWM8zODscM
         iytzQ+d8YvdI7O/Q25zoPVNpUh/n5VZSxCHlIPWPElLodh0piGCMiFJRxjTZDChMms+x
         rsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716818322; x=1717423122;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjNPVFcP/yRzwM+RW4KiStmJdpjIWyn2MZUIplWjrN0=;
        b=cCdzWUE0u1zYknoO5aSapx/PqYh6gr/wyVbrE9Cj50+T6gFx1JQrMHcYhUIPrwY1G6
         2jVQYvCfA1gnS+xHNlG3wH80/tYSwcXApFzrU4/EujnFFxuZvlSpNuQxgdZJzPRQN/uU
         kAd/vOSuJ3h/fXeoc00rqZT2ecQyA6qnPOB7c9ziMgRfL7M5hpwl1NvewW7i/tZpUn5O
         CtYe1hOAzgBn5QUa8OO71m/YwArM/D8b2eJq4paWXVaLeEkv3Mv6BXYOvJNkNYP8BCFB
         dcRXmkm+bMS6T+GWzK2QrCVV4SmIX5VLhBjGVe3EiYtk6//sPjOL5J75yZn5W4OQX0+h
         fYxQ==
X-Gm-Message-State: AOJu0YwlOJyebwZr4cKZ6ulBZQCWJj4EK1YQDHnF07JyOD2nmwracHID
	DQ2RZdj4LbSMUo4EBg6L/KwkSaZ6GR9mHcpwfGGy/a5vfyJ9MRHxCf9ZPcYi
X-Google-Smtp-Source: AGHT+IH8djn/ZBi6vk/x6rhEleERvQbHR2nTiwFYN6Km/iqZi40BYad/dDanDVcSFL2Z15zUmx7uIw==
X-Received: by 2002:a17:906:174f:b0:a59:cb67:ceb9 with SMTP id a640c23a62f3a-a62643eb960mr552513266b.35.1716818321975;
        Mon, 27 May 2024 06:58:41 -0700 (PDT)
Message-ID: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
Subject: Code freeze date for Xen 4.19 is 31.05.2024
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Mon, 27 May 2024 15:58:41 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hi all,

I would like to remind you that the code freeze date for Xen 4.19 is
May 31, 2024.

I'm okay with bug fixes being committed without my release ack (just CC
me), except in cases where a one of maintainers gives a strong NACK.

Have a nice week!

Best regards,
Oleksii

