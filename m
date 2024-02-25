Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B0862D58
	for <lists+xen-devel@lfdr.de>; Sun, 25 Feb 2024 23:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685217.1065615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reMcm-0007Ay-F5; Sun, 25 Feb 2024 22:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685217.1065615; Sun, 25 Feb 2024 22:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reMcm-00077m-CV; Sun, 25 Feb 2024 22:05:32 +0000
Received: by outflank-mailman (input) for mailman id 685217;
 Sun, 25 Feb 2024 22:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNuJ=KC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1reMck-00077g-4o
 for xen-devel@lists.xenproject.org; Sun, 25 Feb 2024 22:05:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8aa509-d429-11ee-98f5-efadbce2ee36;
 Sun, 25 Feb 2024 23:05:28 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so3124997a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 25 Feb 2024 14:05:27 -0800 (PST)
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
X-Inumbo-ID: fb8aa509-d429-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708898727; x=1709503527; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkKvfyrMBWj0+DlETuXifPbtp+G+CbFdvNnXMM5MeUs=;
        b=cWXYEHM4vV0ILOgSo0IjiUGm22SkLcOAiC3cB7sFNCRmMcDv4Fd8OFJgWQyQK6V/hH
         zy+kDx7BpRWBM8nfxrEBAzz40JdCROcq22/h3L6UF3o/Dt+zrXs6X0kHZqL4IrJ8dcYp
         gbh1FHPZYmM1if/1wulAzE8GW8dEf66M2xnsmpE+RIRfK5BWNU+hnh2a7wgZG7gJwBnu
         uFZDs/VWWAygdY2y5bzySsMl275hFsQzkB/qDPlmrlMeqe23fLyMqBQlsDrJKAnE0ro9
         idu+VBVAIEUbmtS0jdis9Gb4ow91TBEF+fUZdty8IkviN0PNCELmhgPzre1+auIx/sFk
         rO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898727; x=1709503527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkKvfyrMBWj0+DlETuXifPbtp+G+CbFdvNnXMM5MeUs=;
        b=tuyfIoDRsCFi3BwC44ftsNYtKOyDaz7OcDr+AfEXiIn/5YW1KJqHxFFibgVmEYcB2K
         Ys7vFOl3ZWmqxmYYj4lMhBpqCjODTn2gK4DFbjCYFNTkiOWkdFIWaEzqxmnJ/sOq+MnK
         HsBUfdnQTrgitUJo65z3Uv+6mXWeuKlBeV/0izPY13ORt8AIFx6Pa+X0QDqSDlCXzdeQ
         woivWAdjSZtcjoo41Rp42tTBU+n3Y2UDsrlAFuKOg5n1x95i3nkK1erBgFxyGTnfXTzH
         vZAlRPhTCjC+br8hSif4U78+D2VOIALuQrgSAayWYnaC4+lDrg0M3hFQtH74TATrjVCw
         inkw==
X-Forwarded-Encrypted: i=1; AJvYcCUmqBwbDWkQJtCrAZVJcGDQutH4UCYmgZsPKHRSiBHuG981BPNHafZaORhbvoFa6zflBRPlK5yai31259KUkQlMRisOYp1g2CA9cr/CiJA=
X-Gm-Message-State: AOJu0Yw9rmPlDNLzootJBGsQC3CxPTXS1cHcdut+I12qiSP/A5qJa0/R
	960zQoUNnfTE6/shfatICJ0AfJqgzlqr92sx1fHfnQei7wjzjuV9YoFb0aabCFLlrQ+W3rD+snj
	lcENuymWtesWb5mk7oltZ7VzjRwg=
X-Google-Smtp-Source: AGHT+IHPh56IyeB2dNiGOUUfRg2lexOS+IfInlHodGvxOzUuY8w69pmiHjOZgl3KhqRNlKV7KBSPMR5uatl6c+8GdWo=
X-Received: by 2002:aa7:df83:0:b0:564:ded0:6072 with SMTP id
 b3-20020aa7df83000000b00564ded06072mr3954699edy.1.1708898726812; Sun, 25 Feb
 2024 14:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 25 Feb 2024 17:05:15 -0500
Message-ID: <CAKf6xps-wWgFiwwdAF26-HxXPdaLism5viD=NY=g5EWJGLTCVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/xen: detect when running inside stubdomain
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 1:17=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> Introduce global xen_is_stubdomain variable when qemu is running inside
> a stubdomain instead of dom0. This will be relevant for subsequent
> patches, as few things like accessing PCI config space need to be done
> differently.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

