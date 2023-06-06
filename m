Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF672455C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 16:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544087.849608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6XOf-0003Fx-L7; Tue, 06 Jun 2023 14:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544087.849608; Tue, 06 Jun 2023 14:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6XOf-0003EH-IT; Tue, 06 Jun 2023 14:10:53 +0000
Received: by outflank-mailman (input) for mailman id 544087;
 Tue, 06 Jun 2023 14:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ibso=B2=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q6XOe-0003EB-Tu
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 14:10:52 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f13cfad7-0473-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 16:10:51 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-558b70c715cso885458eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 07:10:51 -0700 (PDT)
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
X-Inumbo-ID: f13cfad7-0473-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686060650; x=1688652650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TViX6xHrhcipZ2N/daIpqjUHG9frSaIxXBNYbl7z694=;
        b=l61eo7UrDoqW+squDjZ3SmRRl/dT2Kg31PMtoroXDAxOUYq/rje5oJf4G8AAUL5LCj
         smy90xkJZ6qiTG+fB2K6pk+yrmnEKJGBalDnwFnkywvxYAIxSTTmR4kQ1qhuhKMuSXAH
         6EJIVUTLnmbjsQHL7tHgJzIYMu5H6FyW7mHQrGATblln4g3QqU1bG7h49QBgxbmg3PAE
         cpqoa3yWD3O3SJJpGTYEkGZUhd34Q75IjTxL+I1nzfngMWnZ/wINZsBYZ7tYE+YYC2CW
         T2+uyWR0odYbfLDXSImeX0A67z+crRz/FRmF2gGN2dp88H2XFvn5FdtfnTcJIqMRSm3x
         tb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686060650; x=1688652650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TViX6xHrhcipZ2N/daIpqjUHG9frSaIxXBNYbl7z694=;
        b=ZNTxiAjra5MtPdKAK/eMvRVO7FBqufg0VWPJpm+VI3BoJlWw/gJOfhjfzoTkOZQjAO
         hl5WswhT7mV6CWu2lveqpL+8S9aMCqw0BwpUluTkJwXbuPzicAO/zuBV71nndw5cmMkI
         7vu0Cfjjppq4xOtzGU0NPF80+xtG0ZdHi7OUHH7YutsCihrTjwDBKVNy3tGnGu5ucKWa
         0SN6Q1YyRrYYwYFo1ZaARLQDkL7MkXbl8PsVWvyNN3M62PizBdYL2N+G1qC/fbrbg5M7
         AzFUq4h8SJXrseZo/oI6xhdmmviD/KnMIDCdArJW5UOAQJ/jIAcZD9NJTFNJskVz+GKH
         HKVQ==
X-Gm-Message-State: AC+VfDzJHrIZmQDeycU17ftXdofdiN/lFgdS4wHItLibMGf8cNpm00zx
	11F6JXSPwrObPlH8lJ2ckSvbcsbnkcwnJpSi/Kc=
X-Google-Smtp-Source: ACHHUZ47m9LBAa9sLajZqWGXzSxIslOwuf6WvHTE6pCZjKYgsSLzasUOUYd5Le4RuySA9edAZquZH/d+VatjdDXUL60=
X-Received: by 2002:a05:6808:248:b0:39a:9e83:e712 with SMTP id
 m8-20020a056808024800b0039a9e83e712mr867232oie.44.1686060650397; Tue, 06 Jun
 2023 07:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230606131605.55596-1-anthony.perard@citrix.com>
In-Reply-To: <20230606131605.55596-1-anthony.perard@citrix.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 6 Jun 2023 10:10:38 -0400
Message-ID: <CAJSP0QX4XEPK53PM616yPrCfMXRxMRpOab--wo7GO=F5qJ5nYQ@mail.gmail.com>
Subject: Re: [PATCH] xen-block: fix segv on unrealize
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Sorry!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

