Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FC89602E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 01:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700247.1093083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrnbb-00071f-TE; Tue, 02 Apr 2024 23:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700247.1093083; Tue, 02 Apr 2024 23:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrnbb-0006zU-QO; Tue, 02 Apr 2024 23:31:51 +0000
Received: by outflank-mailman (input) for mailman id 700247;
 Tue, 02 Apr 2024 23:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04u5=LH=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rrnba-0006zO-Eo
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 23:31:50 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b4f70e1-f149-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 01:31:47 +0200 (CEST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173]) by mx.zohomail.com
 with SMTPS id 1712100701439131.51364823275435;
 Tue, 2 Apr 2024 16:31:41 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcc84ae94c1so5427910276.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 16:31:41 -0700 (PDT)
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
X-Inumbo-ID: 2b4f70e1-f149-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; t=1712100703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kpAlG4aHUz1tJ+ouBK+2znL5bFS/px2v/6EXZuN7HST0vU+ycGf32/IGFfYbjQIvlQ+rFl0ogZMehvocNKQQjRBLPG6l1RZAA7VLEyIIj2uWGeXbSmclbBt2Iax0lkb0GMaD2kq/GpKekzuz3MYvWh0X+APvjOh0OZ1JphFSh4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712100703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EYP8PWl+bK+SJNmCjUrcXX7Vqb5dR3fFTMsCwEA/OaI=; 
	b=HZAewB5MHxN72CK/ojIA462EUD1CIsthTBWh90VgVa8nnbBSyVBScjBdESdieGbt/2pqj+C+VSbz3xT1Fx5i3XVX0OtN3giY7YMXCA+DE2dYh27TgTjV0gyPa6vwGX9MiaRi98iffaaSMZFarI57RMX16sgfEjKIQW5ApUoXHik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712100703;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EYP8PWl+bK+SJNmCjUrcXX7Vqb5dR3fFTMsCwEA/OaI=;
	b=b7R5xdzBWUomqYCQ7U77pPdsHvStqoEXBQDAiZf3XYzKeYQo3YSqeg0GuHNOwECQ
	hyeKX4sv+MHsXMNp5aIwFf4k50G00r+4eFTJExLBubbtRLQSxg15vxBH1mCSnzt3lKs
	oRNiImGKCC84CGJT5zTR2i4XXnFjBdDhVev7JWz8=
X-Gm-Message-State: AOJu0YwH8yFkh24oxH1v/FTDKbNIddzrhcW17QM5qlp2akrpDlsTloE1
	GKzzSJGYWfv+JJ2Y9BMjHgfuGgCVMIirOMJSYh4OTMoEGJADAW3aPpahqLLjkLigqie20vG9YsT
	Sktmn1c4GRrggHX8mqbujgU4IT/c=
X-Google-Smtp-Source: AGHT+IGtZ3uuwztVzjIZDtYOR4TYAnkni6ePM0Wwl2Doh26QMV67sf7TgkvusyQxNLLsuLi7vCyQPTYDlyM8d51hvlM=
X-Received: by 2002:a25:9e0b:0:b0:dcd:40fa:7bd0 with SMTP id
 m11-20020a259e0b000000b00dcd40fa7bd0mr11766124ybq.3.1712100700413; Tue, 02
 Apr 2024 16:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712042178.git.federico.serafini@bugseng.com> <fcf24478d1f56c6159489fe65f8b8be2c07beab3.1712042178.git.federico.serafini@bugseng.com>
In-Reply-To: <fcf24478d1f56c6159489fe65f8b8be2c07beab3.1712042178.git.federico.serafini@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 2 Apr 2024 19:31:04 -0400
X-Gmail-Original-Message-ID: <CABfawh=HW14N8-A9MBrF+R5RtLkhvK8PYX9V-+xMCXHOQkjcng@mail.gmail.com>
Message-ID: <CABfawh=HW14N8-A9MBrF+R5RtLkhvK8PYX9V-+xMCXHOQkjcng@mail.gmail.com>
Subject: Re: [XEN PATCH 6/7] xen/vm-event: address a violation of MISRA C:2012
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 3:24=E2=80=AFAM Federico Serafini
<federico.serafini@bugseng.com> wrote:
>
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause ").
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

