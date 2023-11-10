Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3F7E7B1A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630072.982756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OBu-0005kp-NK; Fri, 10 Nov 2023 09:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630072.982756; Fri, 10 Nov 2023 09:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OBu-0005i2-K6; Fri, 10 Nov 2023 09:52:42 +0000
Received: by outflank-mailman (input) for mailman id 630072;
 Fri, 10 Nov 2023 09:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T7pk=GX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r1OBs-0005hv-K0
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:52:40 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0bb0b8e-7fae-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:52:36 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so24472511fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 01:52:36 -0800 (PST)
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
X-Inumbo-ID: e0bb0b8e-7fae-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699609948; x=1700214748; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iQjD2x6xVMULmyju5HprC3Zm3wsmH/H0sc2Chc4n7U=;
        b=cH4GLLN3lYPg+4GRseJn2IgedzJkG12kMOUyt1VRKlFprPK9Il1uw2aCanTn2Q1yex
         OST+f+V4Mld18Jrj6be59BOt2e6tLkssdKlKCGajTIJmyHFN61n0v+SdXfOo0lgBiqBt
         2pqJ5rCEZ//PZV19jicvzspKq5KIV2Ox0A8dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699609948; x=1700214748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iQjD2x6xVMULmyju5HprC3Zm3wsmH/H0sc2Chc4n7U=;
        b=RuKrq3FkXCZakToiouCqeFe+4pdDdlbNPFYnFKJaWaSn34Y9mioaxdAS1MOYOt+/lR
         Q4BF91OVjFP1fQEwZ3LkTvVzCveBVbDDwLYeTIgiQ5ZEobLb4+c8/wFaAixlYQGtlDMd
         80oF3hD3L+xUM6mnWJuWXaMUq4Hw3TmR8HhXircpCm//gm7fbDe5rocw5w5IG8vn8uA4
         +l6w6uj5z8JY27daplaEqUYG3/3vqC9rXRfds39En/hanzjCPH2hyLDGdIRB4BZj8/N6
         gXKv4Y+HlGkfmbD6LHW3VJs+g7bPQH0ATj2FgB9k2rw6MJhR4Dxtr44kDRHvLgZlr2Tn
         HXzA==
X-Gm-Message-State: AOJu0YyZ5HxUCFtDm5dsHaqqXTEq7TZUae4IPiRX0ceJrHb4sYowxPap
	y0BCYrS9mfVg2UjjZql/Ph2hOpRfQf8iF1SnycdYTDSgjAUGgZBn
X-Google-Smtp-Source: AGHT+IFC0suFsfEhobuOBC++MhOREz1sBR0YWeq/lrz3SUfld6bXnQs2zvyyIOmBHC5JCgs9TXX6ZKgI3BNVsVVRmy8=
X-Received: by 2002:a2e:1407:0:b0:2c7:8911:76da with SMTP id
 u7-20020a2e1407000000b002c7891176damr1904151ljd.39.1699609948092; Fri, 10 Nov
 2023 01:52:28 -0800 (PST)
MIME-Version: 1.0
References: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
In-Reply-To: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 10 Nov 2023 09:52:17 +0000
Message-ID: <CA+zSX=Zonu0uTaMQruWSsfGgmQHVAs9un=hkNkbvNrU6EjmaMQ@mail.gmail.com>
Subject: Re: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012 Rule 8.2
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Henry Wang <henry.wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 3:23=E2=80=AFPM Federico Serafini
<federico.serafini@bugseng.com> wrote:
>
> Add missing parameter names. No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

Sorry for the delay.

