Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE51ACB7D6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003607.1383186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM78h-0003yO-Db; Mon, 02 Jun 2025 15:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003607.1383186; Mon, 02 Jun 2025 15:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM78h-0003vh-An; Mon, 02 Jun 2025 15:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1003607;
 Mon, 02 Jun 2025 15:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jabw=YR=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uM78g-0003va-L9
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:31:50 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2fbf66c-3fc6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:31:49 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3114c943367so5019886a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:31:49 -0700 (PDT)
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
X-Inumbo-ID: b2fbf66c-3fc6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748878308; x=1749483108; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BR50Vk7OBqfOang4vAqA5ASJPHaW0l0ECfLkMRTLdQ=;
        b=PP814vTzA6oZ462nobd2yK2vaRaOsOzrb1P82ulEHqIBEW/7E8An8fAG+9BeFEchJl
         gKfS7IYQGT1AQ2K8KwQU/tojV+885W/ixIF4JJA/0u1eIYSTVYtT1prQF1Hwvi8iCS3z
         bshwKb2dKPpH7XXhA66+6Hfguv18tF5PLO/lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878308; x=1749483108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BR50Vk7OBqfOang4vAqA5ASJPHaW0l0ECfLkMRTLdQ=;
        b=gJfJjO0cFNCQsB9PKMowFZFzrX8+UBNMn0LUWh6MNcF58kl5XTBrZ1K3UbNOqGu0Eh
         bQ3TxbXBVVZAMh0jkjcoJ2MN2Oj4esZ+XZ6NA8rswP3aseuicHcAZSKSnx9AsTv06Z4Z
         curPY6Y+exokeRkuzXb5rPVTuS1huD1NQ1xJmHkE42D9J7/9U9FT54xF1BPB/rQf8V+g
         PIJGskz8uj5vpOx7O4nB/k20ihccCqqAuWaLx+f7TE6sUJYtETSAFFpgw+nc+7GvBl7+
         hQf5Q+pOy1PjKFrMjzd44cE//Ulw348+ESofu2qRi/+R1i3IwgAHMepWgpZE+z9DK8mx
         sMTg==
X-Gm-Message-State: AOJu0YwwCHAOVKDfj0eZkkHF5HBU8Box4ZEovKUgTl/uPlJ9PzOrHdgE
	ZaQwDmKaUHFYgpI4JOlC51gb+ZrJhzhzGMIw05OpRF6uiI60eJHApX8fHM8dgL7FmuOUCAqufSm
	Mid79qdG+qjJQm2XUtqXIx+A6ldjl95mME6wWVWgu8Q==
X-Gm-Gg: ASbGnct+f0/RgqyH5uS5kmz2pPjXhqQAoisEtjQsz4Worxcn0TdF8tIT5C1Yi6IyyDV
	WOXHIGmiOGV4c9U5qjYnaqv8O6ypzatyf5k7qYElIuevFvEBw9HdRXFRFdEiIheb8TLvWAQ250Y
	7/0cTtCbrVdpAG7OHe0XC1oJsh7NNqy7rjHxi1MNeKVw==
X-Google-Smtp-Source: AGHT+IHjyZxS49KclLfVu+pnSK4pBZMtAWZh4p2HnOgaZy0loFpLddenjBWZrepvKJ4oUxq6JQH5WUyUP6V189+pqhg=
X-Received: by 2002:a17:90a:da87:b0:311:9e59:7aba with SMTP id
 98e67ed59e1d1-31250344814mr20495985a91.2.1748878307404; Mon, 02 Jun 2025
 08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-3-kevin.lampis@cloud.com> <aD2zKsIcsQt-LQlt@mail-itl>
In-Reply-To: <aD2zKsIcsQt-LQlt@mail-itl>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Mon, 2 Jun 2025 16:31:35 +0100
X-Gm-Features: AX0GCFtTFYl7D4Qu4yVJMghy2z5WJHSdtv7us-Sahj7v6AzEkVnnGPUsWSFXYY8
Message-ID: <CAHaoHxabfb8ehi=J8V3b9y1kqSQXD=dn9=WQT_c=b4OUMH+8DA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Add lockdown mode
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> This is rather inconsistent with other bool options. I think you want to
> use parse_bool() here.

Thank you. I will use that instead.

