Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1757EA1B8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631856.985584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aW2-0001PK-4k; Mon, 13 Nov 2023 17:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631856.985584; Mon, 13 Nov 2023 17:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2aW2-0001NY-1u; Mon, 13 Nov 2023 17:14:26 +0000
Received: by outflank-mailman (input) for mailman id 631856;
 Mon, 13 Nov 2023 17:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9tbd=G2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r2aW0-0001NS-Ly
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:14:24 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d63916-8248-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 18:14:22 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507975d34e8so6679645e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 09:14:22 -0800 (PST)
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
X-Inumbo-ID: 16d63916-8248-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699895662; x=1700500462; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JeQu7YjtiRvPcpRya4kTXKpnZXyxqFzSBFkNg0O7oQ=;
        b=D+7E5QhvVjr/Q9OMMQ+UtcFwW76PoX3g0Y5sYSZ7QL4nKyCnS05W2n1Q3sXacDq3QC
         GCArXaObWmxmizAXVQWVyF8yE5f6PlCCnwnQdygD7uM6H+FAlmk9YIejL/d2onWknr88
         UI4pjPE3XqYwE4K15zkKsy+sNuUNRF6/qPtWO8WmFLwdjQu0r9N1lfDhpiWT+QoHAU8r
         BdfRxj41nN6P6qeA6Uf8I/Qb+ZdYkv5stLYoO6iTlSW0g27h52yPKbM6BGUpo+lNYuQ+
         Ir3oLiCswYvQoebF32nx+5wz+PKFw79mf5xK66f0jD6s51d4uSh4R/KyZOMW18iOaJGQ
         rXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699895662; x=1700500462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JeQu7YjtiRvPcpRya4kTXKpnZXyxqFzSBFkNg0O7oQ=;
        b=FZITD044Qgv35FsRVl4ah3CZd4/AqpLWKmfLpo+xLw0HLv7VYCE1mtvXMKHsYVtOm1
         bmrG9xM3tjoxn1Wxwuqo3XLA36NbjVBGSsL7ItOr5pfgx+VT0Xq/pbRq2NHYADoxwS1R
         SpjSpzGyRWHaZRuiXM7kdVzDFc7nouI9vjT/D03KI4sGmUHJGVks6rE9jcDRPKSC4m68
         HabHBAxlFbaWjId2aw9CYs0WafId/Crv/rnQNepkZ/ljPFmXXE/IgSA1tOu1lmWHAvXy
         HpRXA5E+Ax6TbSua7z84ZYlpD+g1wkb4g86SMTXOzxOD2USaB6MKOqtdYDjlUuao2G45
         Xy4A==
X-Gm-Message-State: AOJu0YwLREobxKJdxDmMJzk8f/oliHGilaUsR5zJVTWzcORC1gATgN6M
	RjRj4oBG7Sw/hmr799M2Pg7YycmNGJhF3H5DaJQ=
X-Google-Smtp-Source: AGHT+IGMuNRJte5/vD+GA3/OAqVS1hl+vcmEORXfmoO5V07SzuFbtNlLVMPwyvSdn2zKNnShxChVZr4Y9JCEcaJ628c=
X-Received: by 2002:a19:7616:0:b0:509:4980:7bf0 with SMTP id
 c22-20020a197616000000b0050949807bf0mr4533298lff.38.1699895662149; Mon, 13
 Nov 2023 09:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-2-jgross@suse.com>
In-Reply-To: <20231110160804.29021-2-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Nov 2023 12:14:10 -0500
Message-ID: <CAKf6xpsQC_7Rb9Ed2+RC7JhaLURpt0BQVyvBc1mdJ=p_N8Rqbg@mail.gmail.com>
Subject: Re: [PATCH v2 01/29] xen/public: add some more 9pfs xenstore paths
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:18=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add some optional additional backend paths for 9pfs PV devices. Those
> paths will be supported by the new xenlogd 9pfs backend.

xen-9pfsd

>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

