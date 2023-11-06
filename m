Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185997E2CFD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 20:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628273.979527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05OR-00056p-DV; Mon, 06 Nov 2023 19:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628273.979527; Mon, 06 Nov 2023 19:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05OR-00054a-At; Mon, 06 Nov 2023 19:36:15 +0000
Received: by outflank-mailman (input) for mailman id 628273;
 Mon, 06 Nov 2023 19:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3DI=GT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r05OP-00054U-JO
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:36:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda619b1-7cdb-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:36:11 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso8232461a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 11:36:11 -0800 (PST)
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
X-Inumbo-ID: bda619b1-7cdb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699299371; x=1699904171; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wf/XTjzBC/pMVYJ/UzNvpO+cbOr+u1lKMFDp/0CyKds=;
        b=dL3JavqKRXBqLTjgHq55Rn3rFaEZWaciyjOl9GLxhQl90TJefTXYpNDfurtVH8Q9Aj
         kZSO2IJYZVy0AbZg6GgkfMQXC+dTKi4IGagUcv5SstkxW6ObHsDf7zevqB7SnVIybPsM
         xtzGmBnqugpIMod0qAuxxLDKE1j2oZNmTB/Xbj2P/QXU/m7CH0siL3I1a9oVm6qPQlOU
         T25RUWTNn/LR2yPqK+f5KLyV8SSOwYj/9zCHcsf4aM60CBTFBKdR/8Dyd4NdRn+I4cyw
         8Ipz6NMz00Nkv7MPZnW7Is2VSMrjECFMzpqfz0VmhneG4TnsIup3/LzjAybW3Cb3aIxz
         laQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699299371; x=1699904171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wf/XTjzBC/pMVYJ/UzNvpO+cbOr+u1lKMFDp/0CyKds=;
        b=thsY4L9Z60Bn1nz5s1pDCzB7z5x6WEstAMxmgcW9td1WrkSqGPRrlkz1oduszepRk6
         hD6aeZ1d9X1SMSVXrltx29DhtA0g/21vd1g05g2+DFVc5h7T/CeZ0fk56DYSvIO8MIQC
         nhhJlbPErp8Y61FEen4LS31LHeJkRIld65TF1Z71wd/cO69qsiu+LZzt8C60VZE6rzBR
         gRBWzAeBclWfKZMZ7kU8KCIu+45o0JvE+bW3fvCqTwE3ZDX2jtgsGJTOpEtUD6JlOZ9r
         q1V9IKlt4nxR0XqisRXapU82umBzd5WlVnMYrfVn7I04nl3m2D8jixzx4cbJeg/JcvzZ
         FThw==
X-Gm-Message-State: AOJu0Yy+sf3hRDM7+l14uNc2xsn1yJHQUeYOCAVEdLX5pAs1BF1eo+iX
	53gwMjRyPX5gaPdh50LjwXUPqgSIfV2ThBilXKA=
X-Google-Smtp-Source: AGHT+IHVSx7tlQFhnmo58+OAxzf/JjENYICF6qV9h8S863wDtx7fn3V4fkqeZN0jJM9wQk8x2675mRW42c3kT4oFanE=
X-Received: by 2002:a50:d483:0:b0:544:55c3:ccf9 with SMTP id
 s3-20020a50d483000000b0054455c3ccf9mr5891481edi.22.1699299371101; Mon, 06 Nov
 2023 11:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-11-jgross@suse.com>
In-Reply-To: <20231101093325.30302-11-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 6 Nov 2023 14:35:59 -0500
Message-ID: <CAKf6xpvKvJiKh1qSfPRHVeuy5V_7E=_-owvd5mbSy0NSDJwioA@mail.gmail.com>
Subject: Re: [PATCH 10/29] tools/xenlogd: add 9pfs clunk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 8:26=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the clunk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

