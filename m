Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACA741055
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556458.869009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETdd-0005jB-Lk; Wed, 28 Jun 2023 11:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556458.869009; Wed, 28 Jun 2023 11:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETdd-0005hA-J1; Wed, 28 Jun 2023 11:47:09 +0000
Received: by outflank-mailman (input) for mailman id 556458;
 Wed, 28 Jun 2023 11:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x1O/=CQ=tibco.com=msyms@srs-se1.protection.inumbo.net>)
 id 1qETdc-0005h4-5g
 for Xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:47:08 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819fa3e5-15a9-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 13:47:06 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-313f3cd6bb4so3008465f8f.3
 for <Xen-devel@lists.xenproject.org>; Wed, 28 Jun 2023 04:47:06 -0700 (PDT)
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
X-Inumbo-ID: 819fa3e5-15a9-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687952825; x=1690544825;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXKvCSRn4IGfPiX72SJZB7Wvzl+FXtJmx6qtdvnVfTw=;
        b=cIGRIuPrBlL2mxMNXQF8QuOIFSJJF9p9J0z2v9mrJGZIoIA2iLf171OllyRB7pjren
         i2tWKDzKibcYruX2uMfXepKA4TKZ/H7AOb9xOq9Tm5WtxiyZEIQBizEwuddkmVcdPIw1
         q8Sre+36OZu0Ha3QkrwSc7oxH1oh+YV7KvsXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687952825; x=1690544825;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXKvCSRn4IGfPiX72SJZB7Wvzl+FXtJmx6qtdvnVfTw=;
        b=SzCRhgxNQh9iVZanV9zBiIjATdYtCmt0EbQb9V/P2JRhwZKEVCZwBMBosqq7UAddjy
         IFg0ax/dv7oTQ7eUg7cphUpaDZ9a4XQ6dm68iipy3eifc9a8zHInw2bgLCpVnETbXm33
         DlXd3BRbcDvpdE/LnhiluBQ5owueAeP4ubkCkE6ArmCMGaUuO8SQYeqmZgv697VGAn8g
         PZIDlnNBCCs2y/JbpcgWhwLN9DznQfezcrdGtEV5URMqih/oKkDlJyPufQ3hbnCMRs1I
         +dvr9hPBr0J8u0s3ZdjTTR7YTHNe9A/TE/m3d4m4IAq/5tZoYcr4OgDp4tIm59X1a5+S
         1x0w==
X-Gm-Message-State: ABy/qLZjdOjFFyGm9HyOPwHkqH8qnfBmR92XJmuC7HxaY4TBtFJP9N5/
	ZI5VQWtzruQmGG1VmmC/tsHfWBesO+6pbJdEG58pldRmCJEJRHQmr04=
X-Google-Smtp-Source: APBJJlEFPxY2G6KaVf9f3vJyuVOcz2rELDiwmgbPOUcg/Xmnrrx3U/k785GvptxDkcbdvs4tkqLvvGU7M8Vifxb3w80=
X-Received: by 2002:adf:dece:0:b0:314:11ea:480d with SMTP id
 i14-20020adfdece000000b0031411ea480dmr22367wrn.9.1687952825600; Wed, 28 Jun
 2023 04:47:05 -0700 (PDT)
MIME-Version: 1.0
From: Mark Syms <mark.syms@cloud.com>
Date: Wed, 28 Jun 2023 12:46:54 +0100
Message-ID: <CAPYKksV4irKUiSnazFGA2bwhx=DYUORr-=h3OpcG7jS_n-Wr6w@mail.gmail.com>
Subject: Xen Summit 2023: Design Session Notes: SMAPIv3
To: Xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Slides used for scene setting -
https://github.com/xapi-project/xen-api/discussions/5080.

Example code in Github -
https://github.com/xapi-project/xen-api/tree/master/ocaml/xapi-storage/python/examples

Notes taken in the session
------------------------------------

Since scene setting slides were written SMAPIv3 has actually been
converted to python3 (pending merges etc)

How would you like SMAPIv3 evolve in future?

 - Gaps compared to other SR types:

     - Storage Migration (no implementation on either side, XenServer
keen on implementing this)

     - Change block tracking (start of an API definition exists for this)

Potential future thoughts to move the traditional LVM and FC SMAPIv1
SRs to SMAPIv3 SRs to resolve technical debt, would need storage
migration support.

Could other toolstacks (e.g. xl, libvirt) use SMAPIv3?

 - They're just python scripts, so nothing to prevent it, but the
current XenServer team has no particular experience with other
toolstacks - happy to assist, but would need someone else to lead.

Documentation - does it need improvement / is it clear, feedback invited.

Code for a plugin is very simple (e.g. example is 130 lines, a lot of
which is boilerplate)

Cycle for a disk attached to a VM is:

  open

  attach

  activate

  deactivate

  detach

  close

open/close are start and end of use of volume overall (VM activation lifecycle)

During live migration you may do e.g. migrating from H1 to H2:

H2: attach

H1: deactivate

H2: activate

H1: detach

The idea being activate/deactivate is in the critical region where the
VM is paused so should be as quick as possible, longer tasks can go in
attach/detach.

Multiple volume URIs can be returned to give multiple ways for a
consumer to access the volume

Q: Is there a way to expose SMAPIv3 SRs in a way for backup, e.g. for
incremental backup etc?

The change block tracking (CBT) functionality is relevant here, to
allow for a way of identifying what needs backing up etc.

- Could we use nbd as a universal way of exposing things?

Endpoints are implementation specific, so would need the SRs to
implement it, or something else to access another method and re-expose
it.

Storage motion support may also give more possibilities here as it'll
be a general API update, would be good to include other required
capabilities as part of this work, e.g. any new `implementation`s
required.

(Hoping to avoid breaking changes in API)

Vates have done an implementation of a zfs SR using SMAPIv3
(https://github.com/xcp-ng/xcp-ng-xapi-storage/pull/11), would be good
to review and see if it identifies any required API improvements etc.

Existing implementations don't implement `copy`, which would ideally
support an offloaded copy operation where the backend storage device /
mechanism can do the work. Needs toolstack work to plumb through and
handle cases where different SRs are in use that can't offload copy
between them etc.

Thanks to everyone who attended and contributed.

Mark.

