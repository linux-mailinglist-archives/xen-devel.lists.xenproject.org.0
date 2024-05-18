Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517D8C8F07
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 03:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724554.1129819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88cD-0006bh-Tc; Sat, 18 May 2024 01:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724554.1129819; Sat, 18 May 2024 01:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88cD-0006Zt-R2; Sat, 18 May 2024 01:12:01 +0000
Received: by outflank-mailman (input) for mailman id 724554;
 Sat, 18 May 2024 01:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clH7=MV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s88cC-0006Zn-RQ
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 01:12:00 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ebfffa7-14b3-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 03:11:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715994712030331.834854596682;
 Fri, 17 May 2024 18:11:52 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcc71031680so734173276.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 18:11:51 -0700 (PDT)
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
X-Inumbo-ID: 9ebfffa7-14b3-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1715994714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MafmZQ56iE2vTtS830ntl9aALvlbyjGDbi4HNBICasSZaH0WgQcNFC2ngEhjEqWGl7Hjox0JROFufOegFfSZ7xYayXKXdLPxgjHG7YRcnvLuRYebc7GkOXz9nROfF+Hx0zap2n45lbNDDsbB/9m1HZo9UNb6QRD17zks76ywuvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715994714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H9DuXgbTdtu+6poQIgNvq5HDYC+0Cz6HDnPJImUWZ8I=; 
	b=V0/leUf9hSWpBmHct6reFaEs8K5kjemNtCzodt4YLDZCh9prmEOsBrtfU/CtpRg+ANOh2T+dhwgwe9MahYM4HDI3dzkpD0MQe/M0Qufz9MhxjzOD4eKtVCj3GuEpxY64bQ0jQGz2lHCtjSkCC8cm6x7/YI/W33RAL/RR6jf/I1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715994714;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H9DuXgbTdtu+6poQIgNvq5HDYC+0Cz6HDnPJImUWZ8I=;
	b=DSk69ltxdgIEmMtAXiygoH8qpViZYWLC8Hr3jOmDQGNq0jM0tM278IGZARm9IpHz
	7b8QxZ1W/uzNClmkhrN+Ygr1Lef3yI5MQ/lEwuuXy6F+hRZQHGLVFaip+jKZYKMbG1S
	dH1bBpmiqR5Wdpfl8T30Cs4HbIQS1MaAyficzeWY=
X-Gm-Message-State: AOJu0YwZvClSc/n7esfStQcxEE682CantLeIG6jyrQRxUYmra8YeD9tT
	sZdJ4B5klsmjZ+KWFc9ahjqO26+D/qopemduVFY2iWxpM+ZAsWHVWcKFmFytRiAYpeaLHR78PFe
	rW+h+YLQsHYT8LbQGtNWC8kLpUiE=
X-Google-Smtp-Source: AGHT+IG/y2hcDgj03cc4X2SwUPHqTOI+D137mCQ6cxzcZmGEocA0YVsrmCugh6EJpcDU09T03pBa2l+O/6RtBY7OQTw=
X-Received: by 2002:a5b:5cc:0:b0:dbd:be40:2191 with SMTP id
 3f1490d57ef6-dee4f3a9dc0mr20842037276.42.1715994711241; Fri, 17 May 2024
 18:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715952103.git.oleksii.kurochko@gmail.com> <bb75ebc8bd75318759b450d398294eee8ed3ca55.1715952103.git.oleksii.kurochko@gmail.com>
In-Reply-To: <bb75ebc8bd75318759b450d398294eee8ed3ca55.1715952103.git.oleksii.kurochko@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 May 2024 21:11:14 -0400
X-Gmail-Original-Message-ID: <CABfawh=o0pUSYACUzH4-De2mDm5_vm7Hbf5bEt6Vo8+zyU2L0A@mail.gmail.com>
Message-ID: <CABfawh=o0pUSYACUzH4-De2mDm5_vm7Hbf5bEt6Vo8+zyU2L0A@mail.gmail.com>
Subject: Re: [PATCH v10 07/14] xen/riscv: introduce monitor.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 9:55=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

