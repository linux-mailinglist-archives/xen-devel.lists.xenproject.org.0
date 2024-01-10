Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACF82A2E1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665764.1036084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfYw-0006bx-L9; Wed, 10 Jan 2024 20:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665764.1036084; Wed, 10 Jan 2024 20:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNfYw-0006ZN-Hv; Wed, 10 Jan 2024 20:52:34 +0000
Received: by outflank-mailman (input) for mailman id 665764;
 Wed, 10 Jan 2024 20:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNfYv-0006ZH-E6
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:52:33 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cd3c46a-affa-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:52:32 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd5b467209so39532611fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:52:32 -0800 (PST)
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
X-Inumbo-ID: 2cd3c46a-affa-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704919952; x=1705524752; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqpCOna79VvlrVPbo8TUgyMKtTSQzN/GhE6hbSw+5Bw=;
        b=EtqUKZTH9cDSpywu5ZhoQSvDlOCeTXTIXCwND2GhyYUxHISP6rLB/WazNx9mixA6u3
         SUZJwFP+uzq1v9S6MHJE2q18Lq/EU6OYkGcF3d+jb4BeC1elFfFtntfsGY3mVhrRzPni
         CgjJDV/SMssfp/ZyX3CWX1g1MJ38GRyTIn0RnAWkBjl4kEGxzt//bbmKLkuWszW81Z1/
         qARpA96yGXFBlhqN8RnapIQOUJ8/pNIiVU7uEkE6X5C4s1Xi6/qC4eYXzR7C1ambqMel
         9weMpJGflTZ3Q77ccvZK20fYQHi8nj4/pKFsUI92E/fByNP4gmc44x5sFqM/n6xlxHoM
         R3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704919952; x=1705524752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqpCOna79VvlrVPbo8TUgyMKtTSQzN/GhE6hbSw+5Bw=;
        b=XZ/INuF2FPPksfkehdt3xJBWq13XF0TUkh9iwqv+4fFm8EbUIAVWqF04ZCFcGjIhZS
         NbUTiwyOPNwAot+xxVEw1F9/3aQJAM9bKZNQ3+qNBzP/Axfh8r52fHFCYwtsw41NR4aE
         5W9sYnHdmHsZt2WfaMwlzk8vifejzqi29IQevKy21r87eorj62x9gpe0pKzSL6yD7J6N
         ns8mfOYzvAJa8d3I0MVmS3TKbagU/AismqoOjNGtgl1Y8Z9E0Fbkl6IJJtNvFE64Pd9c
         vVB9qodf39qLjjq2BkCMThN9hLJv6XeqxHQceyVNbyW2W8CiGh8A3kS1JOeQLuZfZY6b
         R8/g==
X-Gm-Message-State: AOJu0YyYqfNTby6A2kMiw7E3P1BtV07UZ9ug1QNhhiv+wnJTAwJpgcJ7
	zAzQxQzYc2lWAeaE+U/PbSPHY781Hz8SESMHyGU=
X-Google-Smtp-Source: AGHT+IH82X6546XyUlDep0v31GPwb8insUC3HHHR/q3QJt5xfPNe9lKaKby6cj2+zqfZsvXCHygM6UZdNGoNTCtmQkA=
X-Received: by 2002:ac2:5df3:0:b0:50e:2bfe:ef43 with SMTP id
 z19-20020ac25df3000000b0050e2bfeef43mr8226lfq.115.1704919951662; Wed, 10 Jan
 2024 12:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-30-jgross@suse.com>
In-Reply-To: <20240104090055.27323-30-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:52:19 -0500
Message-ID: <CAKf6xpsB4QPGeUWDYq=JDH0_OVRz3D5fFMD_9Bqp2NMkinfJfw@mail.gmail.com>
Subject: Re: [PATCH v3 29/33] tools/xenstored: map stubdom interface
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:03=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> When running as stubdom, map the stubdom's Xenstore ring page in order
> to support using the 9pfs frontend.
>
> Use the same pattern as in dom0_init() when running as daemon in dom0
> (introduce the own domain, then send an event to the client side to
> signal Xenstore is ready to communicate).
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

