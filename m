Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FC5AD37C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 15:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398862.639835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBtA-0007mh-D7; Mon, 05 Sep 2022 13:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398862.639835; Mon, 05 Sep 2022 13:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVBtA-0007k7-AD; Mon, 05 Sep 2022 13:11:44 +0000
Received: by outflank-mailman (input) for mailman id 398862;
 Mon, 05 Sep 2022 13:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zWL=ZI=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1oVBt8-0007k1-R6
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 13:11:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4860c0e0-2d1c-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 15:11:41 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id d5so5229061wms.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 06:11:41 -0700 (PDT)
Received: from horizon ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a7bcd96000000b003a54f1d007csm10514094wmj.10.2022.09.05.06.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 06:11:40 -0700 (PDT)
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
X-Inumbo-ID: 4860c0e0-2d1c-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=9wIR0YoTNedOMl2ijqWHncarAIsVvB/0F5GTrmKNCmg=;
        b=efMSKwjHaMW293Xz8oK8ILEWfIx/Bd9uOMVmu0pxXAE2yxHFYCxuZw30FVkBl4pBvD
         yPYDXFmB85JSp6yWeZ511rtxWeDscaKkIT1Wmq1k2LPlr1HBfUQuinMK7ybfHDr6keye
         Mhye+skdlmPJ5Red9ZO4f7R0O8XT65wRIFmimHeZidvoDX3Ib/LKvQ4l4t/tEbEHl2fx
         7NYmTqxE2T39TVx1kGi0H3QnEWQEBP+JiXFDzODydKa52yN004yrUZOSSrmpYhQKSnL8
         gsEouLIZFUTpiXdpX04mln/4n7RLBbc1BiWWU1PKWtEScoyl2k2EqWa+5qaw4r/IN96J
         mEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9wIR0YoTNedOMl2ijqWHncarAIsVvB/0F5GTrmKNCmg=;
        b=Bkbd/u/fHT4shmmN1MUtUo4oREGNhJ775ZR0a/0zsjNu/E1L4Znf932luz9LyeFip+
         DQoBFxPxK6GAE+zDvRGLniPqk3eU1wKfJE2ZRL4gqmcKKQOuKFFuG6ihhxJEsfgxMBAY
         z3CiqMayXAI2t02GEozxb+rA+/Re2VBWW3MjoHu96fG1UgVDX6yOwtWYg22xO5yTaUZI
         hhkIfB0UlWBwiXsdNEBdH/c+f5Zbt028XRKai5UtZ4cCQ0ifHihgcUiYy5t8wUi2rh81
         XRt++WAwNj42/goo6B39x9wpIzdp+3FHVvVfcQLBOpikt25AN3fhyENLnTKhB4JNzGwE
         cZww==
X-Gm-Message-State: ACgBeo1RlQkemjJZrc7oxF08jEicITdiFUIJgDPiZ88rSzsTg/dnOg9f
	f6TloOGK5AwKt6H4A/gAeZ18+lAvfPQ=
X-Google-Smtp-Source: AA6agR4NRI201GxBKAPm2w9HkK3lkGfpNHncVBPr1MD+D4nGXC4SIuv2+HeHZ7oHf2vFUhEjtmjTVw==
X-Received: by 2002:a05:600c:19d1:b0:3a6:14e5:4725 with SMTP id u17-20020a05600c19d100b003a614e54725mr10370937wmq.141.1662383500886;
        Mon, 05 Sep 2022 06:11:40 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:11:38 +0200
From: Matias Vara <matiasevara@gmail.com>
To: Paul Durrant <xadimgnik@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1] xen/docs: Document acquire resource interface
Message-ID: <CA+dKekBjSPNL658bhPgWyS4L229XUPHLPuZfZYgC7hJ6PivhrQ@mail.gmail.com>
References: <d28893ed5c617f6e350f755508f10ba5a12e7098.1661763622.git.matias.vara@vates.fr>
 <89a56dfe-7bc7-472c-3c0c-644ed36a0c44@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89a56dfe-7bc7-472c-3c0c-644ed36a0c44@xen.org>

On Tue, Aug 30, 2022 at 01:06:11PM +0100, Paul Durrant wrote:
> On 29/08/2022 10:03, Matias Ezequiel Vara Larsen wrote:
> > This commit creates a new doc to document the acquire resource interface. This
> > is a reference document.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> > ---
> > Changes in v1:
> > - correct documentation about how mfns are allocated
> > - correct documentation about how mfns are released
> > - use the wording tool instead of pv tool
> > - fix typos
> > ---
> >   .../acquire_resource_reference.rst            | 338 ++++++++++++++++++
> >   docs/hypervisor-guide/index.rst               |   2 +
> >   2 files changed, 340 insertions(+)
> >   create mode 100644 docs/hypervisor-guide/acquire_resource_reference.rst
> >
> > diff --git a/docs/hypervisor-guide/acquire_resource_reference.rst b/docs/hypervisor-guide/acquire_resource_reference.rst
> > new file mode 100644
> > index 0000000000..d1989d2fd4
> > --- /dev/null
> > +++ b/docs/hypervisor-guide/acquire_resource_reference.rst
> > @@ -0,0 +1,338 @@
> > +.. SPDX-License-Identifier: CC-BY-4.0
> > +
> > +Acquire resource reference
> > +==========================
> > +
> > +Acquire resource allows you to share a resource between Xen and dom0.
>
> That doesn't sound right. The resources 'belong' to Xen, and are specific to
> a particular domain (A). Another domain (B) with enough privilege over
> domain A can then map and hence access those resources.
>
>   Paul

Thanks Paul, It would sound better something like:

"The acquire resource interface enables sharing resources that are specific to
a particular domain and belongs to Xen with a domain with enough privileges,
e.g., dom0. This domain can map and hence access those resources.”

Matias

>
>

