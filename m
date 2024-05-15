Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601538C5E7C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 02:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721845.1125529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72y7-0004mM-6d; Wed, 15 May 2024 00:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721845.1125529; Wed, 15 May 2024 00:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72y7-0004kq-32; Wed, 15 May 2024 00:58:07 +0000
Received: by outflank-mailman (input) for mailman id 721845;
 Wed, 15 May 2024 00:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DUSJ=MS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s72y6-0004kf-8T
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 00:58:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 302a0872-1256-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 02:58:05 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so867765a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 17:58:05 -0700 (PDT)
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
X-Inumbo-ID: 302a0872-1256-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715734685; x=1716339485; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HHbrBkoepckM0AmPsXzpj3xxagqOFnXkdOz/Dig7TI=;
        b=b2Z6AiNolZOYUmjDfmJ/3pPTkuN445RIeH+WeNUZRpaMWPOoB5JhXDXjSOJe5cqanL
         9fQt9kPlxG8d4vLDXOGabwFg/D2xiutlUHaOyQWYE0/tHq1LqnjxaA+T/eHAdeaEfBOv
         Im09Jpix4JDm+nECy2bsr/uA3oHnpxxnH+V6BRPqZt4B9xa3fKJuwVG9OqH2elurxwZ9
         oUxcc2d/3ik+FS68rtDezMXz1TiEAgxjHNNy18NDFfFhMhWweB19qgpjkDz/f/wGt62o
         92YRkfhiu/hAAITqZWfdo573H9HBX65DdoPjTn/mnPulUDbADl8wQTgp0n4pTg/qtFU8
         SrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715734685; x=1716339485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HHbrBkoepckM0AmPsXzpj3xxagqOFnXkdOz/Dig7TI=;
        b=X9JuQ2EznctG4ybjSbytaMttriRLj+dqdFcd94C+JF8VrasJkVOVr8Gg8SK/BOf9AO
         ITg1vodI4dNaTmViHc28XtVA2TEqjCYKvAs66J+vybuQLXxNZ7WMtUhP4M0DtQQDOrPq
         pRKPP10CgoJgF1BIU4C5dh13ix8d4+DoF5+QnnylHcgtTjW4voYGrvODZnMJnRoZ2jjO
         pCxPV/0ltbHn91MEZWfguG4t6Detae4CPL3VZQiYYui12tr4HVDCEgwzrmf3OUmEhlhM
         O1mj5FEXt83IBFmbkuLOPRs8e9UybCbW3oZbF1UavXRahntKAUJcU/c6rQs00a184+of
         yswA==
X-Gm-Message-State: AOJu0Yykk6RupUbiGA0IZDg02Nn/477ajcYSqWsSeDEvUVzSoZAp1ci0
	hhDR1zCRFvJUEIz8IyR+Hhsx3iQ8I4kwX6273EuRZn0dee1o99qTYS4plUPaN1pXSGoDE1UzCxb
	8cDshA47OKJ4/VCaIh33GCWCDuNg=
X-Google-Smtp-Source: AGHT+IHxi/S6V/m6R9xB1lBBLBBnHYJxi7+hBywOZsrbpaCAjeb837qjWoDnmRl/zY87RHObwJTseyGyxkCduq02euQ=
X-Received: by 2002:a50:d496:0:b0:572:93fa:d6fa with SMTP id
 4fb4d7f45d1cf-5734d43e905mr9234200a12.0.1715734685161; Tue, 14 May 2024
 17:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <20240508213824.55824-5-leigh@solinno.co.uk>
In-Reply-To: <20240508213824.55824-5-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 May 2024 20:57:53 -0400
Message-ID: <CAKf6xpviWyFxt4JMq23K0LxjDcP2zJF1Sqye=1jS2UAtwcaRww@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] docs/man: document VIF vlan keyword
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 5:39=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> wr=
ote:
>
> Document the new `vlan' keyword in xl-network-configuration(5).
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

One nit below

> ---
>  docs/man/xl-network-configuration.5.pod.in | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-net=
work-configuration.5.pod.in
> index f3e379bcf8..c35c0922b3 100644
> --- a/docs/man/xl-network-configuration.5.pod.in
> +++ b/docs/man/xl-network-configuration.5.pod.in
> @@ -259,6 +259,44 @@ Specifies the MTU (i.e. the maximum size of an IP pa=
yload, exclusing headers). T

> +Note, one VLAN ID must be marked as the PVID. In the case of a vlan
> +specification consisting of a single VLAN ID (e.g. C<vlan=3D10>), the B<=
p> suffix
> +may be omitted. Specifying more than one untagged VLAN ID is an advanced
> +configuration - use with caution.
> +
> +For example:
> +
> +        'vlan=3D10' -- meaning a single VLAN that is the PVID.
> +       'vlan=3D10p/20' -- VLAN 10 is the PVID and VLAN 20 is tagged.
> +       'vlan=3D10p/100+10x4' -- VLANs 10, 100, 110, 120, 130, 140, 150.

Indent mismatch between 7 and 8 spaces.

> +
>  =3Dhead2 trusted / untrusted
>
>  An advisory setting for the frontend driver on whether the backend shoul=
d be
> --
> 2.39.2
>
>

