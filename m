Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDA8C7D1A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 21:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723595.1128576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gfI-0005FZ-IA; Thu, 16 May 2024 19:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723595.1128576; Thu, 16 May 2024 19:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gfI-0005Ct-EX; Thu, 16 May 2024 19:21:20 +0000
Received: by outflank-mailman (input) for mailman id 723595;
 Thu, 16 May 2024 19:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7gfG-00059F-VK
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 19:21:18 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7793b6ac-13b9-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 21:21:18 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52232d0e5ceso1536959e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 12:21:16 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523940af3f2sm767433e87.266.2024.05.16.12.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 12:21:15 -0700 (PDT)
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
X-Inumbo-ID: 7793b6ac-13b9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715887276; x=1716492076; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mmaUfRjshwvwnk3PFzLF0Gg+hca6VCpx7x9A7NqF9v4=;
        b=Q8LB5HjqkMEXsDLlmckhgVASQYfQHG95SQn8jwPprlVmPehz6ti2gOqTJ/LKQ+6U5P
         ruQvsW4Sp5kAJ8C1qKJirws1Pg28TfaH1296gu63UzDJW+HSbD5H+LizSbwaVeQ8o11x
         YI3mBFXGujK4O6vRAmUoYxbN/w1kzGNRoHLKn6JCMYeIFzeVk19Lpl5XNzjsiikWYIyY
         pmFXFJNx4pcRQQNdO+n1UF1ks6p8oEmZ0mu0dJq+ukI8nbnqz4IQ04kOO34CNrd9Jufr
         pBvWmGNGTaYGKJtt83u7JlvAXBgFPIsRUJZR2EsH+CyYb0bXVs9+urnDKjbIBjmk17Pr
         ki6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715887276; x=1716492076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmaUfRjshwvwnk3PFzLF0Gg+hca6VCpx7x9A7NqF9v4=;
        b=WlLC7UAYYdci4RE1ffZHhW6pM5GNkHkVjt8mjQkpiKTg2085YfuayjCBHiR0nEzRbG
         5EtXtDHCUvS63NPsESC1+7do4kYdfPX9Fr2TDOv/xfbLfw/LTk0KRjiSakYTcfVauEcL
         utYnaxa7xWAl/R6TuYuBSMIvoZc09EukYVqzN89JrZ5+jIu04fk+AlkPsfNnzX88jbFQ
         qZsHk8RfU7lRIc2QpHXRJzx9FQpNBjjk04r81VWiqaXNnM+3SL12qZBsR3Mu5yhfEU+U
         OtxozgJPTXCv+OoHWYnTz+Zl7XKDRP6Nx/TpdhQlE8yLYC3r+YRHWSfjWgMY+ZFo+S6F
         O4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvJfcdAnFqrYzVY4qgMUUUKujL6IFxjwCdn/6X6OT9PBky3wD3192UEt9PljvV43u6zPcSZv/vMwXquaXpyqxJJng9ktHNVDblFjVLIEY=
X-Gm-Message-State: AOJu0YxUQ7xchmaA5sy542M6LL9ShmVJ82k1ls09LCpFeKLtoRK0NEzs
	YeEustibMEQFsEPcTZabAGzy2QfhGzk151LG0qCfJCBG5gbfS/u1YCFSJILq
X-Google-Smtp-Source: AGHT+IFm/OBu+XSX0FEsDFbIWw2Dh0xa4cjHCpTjBovW0f73PbQUCdqdt2SYTpoQCTm4tgTFQPmyog==
X-Received: by 2002:a05:6512:3293:b0:51d:9818:33fa with SMTP id 2adb3069b0e04-5221027603cmr11898394e87.68.1715887276201;
        Thu, 16 May 2024 12:21:16 -0700 (PDT)
Message-ID: <0bdb1e3952e3527083cb63295dc16c3403f0ed7e.camel@gmail.com>
Subject: Re: [XEN PATCH 0/4] address violations of MISRA C Rule 20.7
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com, 
	ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 16 May 2024 21:21:14 +0200
In-Reply-To: <6d19ef9b-ccd8-4ae0-9e9e-ff7f3d92b333@suse.com>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
	 <c67c1b8b-e14b-4c30-a381-1b89aedcddb9@suse.com>
	 <7f8ef88d0a8bd3e40b213d19dfc80cd3fd2db298.camel@gmail.com>
	 <6d19ef9b-ccd8-4ae0-9e9e-ff7f3d92b333@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-16 at 18:08 +0200, Jan Beulich wrote:
> > > for 4.18 we took a relaxed approach towards (simple) changes for
> > > Misra purposes.
> > > I wonder whether you mean to permit the same for 4.19, or whether
> > > series like
> > > this one rather want/need delaying until after branching.
> > Lets follow the same approach for 4.19.
>=20
> Well, okay. But if you don't say now until when this is okay, you'll
> need to announce the "stop" very prominently later on, so no-one
> misses it.
For me it is okay until we don't have Hard Code Release deadline.

~ Oleksii


