Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C48C7FDB
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 04:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723771.1128837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nF6-0003Qi-1Y; Fri, 17 May 2024 02:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723771.1128837; Fri, 17 May 2024 02:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nF5-0003Ol-US; Fri, 17 May 2024 02:22:43 +0000
Received: by outflank-mailman (input) for mailman id 723771;
 Fri, 17 May 2024 02:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ95=MU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s7nF4-0003Of-TL
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 02:22:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5619a371-13f4-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 04:22:41 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so4142329a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 19:22:41 -0700 (PDT)
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
X-Inumbo-ID: 5619a371-13f4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715912560; x=1716517360; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgeOXt05rT1J/mgAopx8fctx0EFrgq63XJy/wg1V9uo=;
        b=ZlesoXka+kCr6PDFAHGG3kDPlGLbPzodyRA+ASBO6pRp+mDMqj6bb6xjn0O/AEAftb
         xy6VraaIJ8zOu1O0AXFA7avypAIpwua7PWds2WZD4Dg79Oczo+EMrVpP9tBIHH1SmE9q
         4uJfP7ANbpaBADgczoFswW+MViaEDmR8NlFpKvMBCu/vHngXg5x2+mTgUI2QUofI9tWR
         7djhbkj3AQlAdRbeAPqo9DF+Ti2T/z6KY+bTlk9596NyxaAwn9Aa82tBjSzWwSUYWJau
         Sy6fiKyoC3T2GitpRaO6nALI43GGGmY1saEbK+pDR9NM/qmIZHkgOkJRTr69VXuKKhUX
         MqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715912560; x=1716517360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgeOXt05rT1J/mgAopx8fctx0EFrgq63XJy/wg1V9uo=;
        b=wHjG1uPAfbq3XVB+mrFmjbbNPOKCoE/qYFnoL78eRxp5G2IxG/pEZcQNiFY/I213l3
         7AdEzF+WVEHnWCFauKmP+NM2uOXX8YyUmQvXe90A6HCet6fWKSqVJBH9mFQdveXwLED8
         ISx4HcHmRWvu4Y5agk/9bb+rZjtbee/SqnZdbkzsNM5a9kDa5ZysmgQ8VAdllS2Rb2jk
         ZEN1N07H8LcuW+oNqTG/ZK36i0f/yIkFT11+jMVKvlX+f98B0IJ/HfZPmflhzre7Drpy
         mmGjKbOaHeznRPgKWMv+mEcPrwaMkNcfSwd2NqVrwfxjdWQgGHEdqoSUQQ8E4olAr4DQ
         d3Vw==
X-Gm-Message-State: AOJu0Yx7IgTls7voqt+xIu1o19YI+KCAiVjNy+eZy3DkRg3Bpmp6fLGk
	PTrlYwcElFdR8ESykI1FDNT31MnyvDMfXeX8O5c2bwbDFaZGItJS+kmWIAbsXY6rYF7JRN76iAx
	Z0V0t0vi6zzwvjlxC+vBwiDXakQ8irQ==
X-Google-Smtp-Source: AGHT+IGOJfDYsfvpUKHT6NnvrIkRD6jwpPzibmMgocBERSPbFSqcMh8pWWSQmF/7DJgjN/kMj/8wbg9qSXtXLRfNA6s=
X-Received: by 2002:a50:9e6d:0:b0:572:8aab:441c with SMTP id
 4fb4d7f45d1cf-5734d6ed908mr13252761a12.26.1715912559739; Thu, 16 May 2024
 19:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240516021010.3783-1-jandryuk@gmail.com>
In-Reply-To: <20240516021010.3783-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 16 May 2024 22:22:27 -0400
Message-ID: <CAKf6xps6KaP7BoJdiOvESX4CBk3Q25-khh0OZTkMH_j6J1MwJQ@mail.gmail.com>
Subject: Re: [PATCH v3] libxl: Enable stubdom cdrom changing
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 10:11=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com>=
 wrote:
>
> From: Jason Andryuk <jason.andryuk@amd.com>

Sorry, I mess this up.  This From is incorrect.

> From: Jason Andryuk <jandryuk@gmail.com>

This is correct.

> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

These are correct.

Regards,
Jason

