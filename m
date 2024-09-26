Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677F98749D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805538.1216664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stolF-0006k2-Mk; Thu, 26 Sep 2024 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805538.1216664; Thu, 26 Sep 2024 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stolF-0006iC-JH; Thu, 26 Sep 2024 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 805538;
 Thu, 26 Sep 2024 13:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stolD-0006i6-Pe
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:42:23 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2682107d-7c0d-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 15:42:20 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-27cdb92376aso499321fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 06:42:20 -0700 (PDT)
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
X-Inumbo-ID: 2682107d-7c0d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727358139; x=1727962939; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWgYKitVthOSBfBGPXFsradRs2oBBJ9CLQHtIrnY2aI=;
        b=FGLgUKp2QJpK1MHiJwlYETaETc2VMSFXaexsDQHUGzNOXvOWhgsshE1vJkFyGKnIGO
         R35t8rXLnoK25kq0fWViAjKxOYO9LrZei5eUQSqGWC44A4SxYcHBYNGL+u1UOUf3euEg
         PA38XOtXfv+TXiIlFdrMs0OhaXc97YTSQbH70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727358139; x=1727962939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWgYKitVthOSBfBGPXFsradRs2oBBJ9CLQHtIrnY2aI=;
        b=ElUnf5MfQaoRwXU2Kdy6GRRfSlN6qiB9QyOfC1Am7/cn2PZ/phvMKKZg3sVfpsV7fa
         1w5l2ddNAKEQWwlkKI6QO3ACQ8ZP8ICkSTsmdoKFWOs1nvvr2EFpgoBKYQxXhtuUIWoC
         3DcLftplp/+/pOLPKsoqd5Zc6ySC1GT/wEsqzFkW2PXVAZqWWe/W9Rn+NHCjiRUuT4q2
         2Ykh9rbEP+L6i5YqI6paB1X64fUZzeyEaqloD6RKbMRP28juI96qKuNhwuJHDtLWQelG
         LkLhU13FFSeECtzNGydKK/FbLcbtHBzlcDSPQT5/0Flql1GqNYOzlXCP3FVprNsnpqHp
         C24Q==
X-Gm-Message-State: AOJu0YwF5ZeudiCHAnQ83uNu6LMRr7LxCtoSCTc0i257GFgedpElbYjL
	fmjUQGv3b2+mxBwtKnMHj8Bbv1B6e1OM5W0KxqamSiWqUmvQadjRuqoTFswzGq16tZwsG6xsUEL
	MB3vnOFWbUd/NyDY6Konczlx539oCGbO48gDlDnOLgoKKmbq2
X-Google-Smtp-Source: AGHT+IEGAYXZr5Mf0PxtlSHrkeXZyxvplGUI/eww8stLk+f35gJlm4VA0Rv8AA/90OSxjg34eqqC2fwGg6q+r1HmAyI=
X-Received: by 2002:a05:6871:58d:b0:277:e08a:23a0 with SMTP id
 586e51a60fabf-286e17799f3mr4633557fac.41.1727358138772; Thu, 26 Sep 2024
 06:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240926132741.685791-1-frediano.ziglio@cloud.com>
In-Reply-To: <20240926132741.685791-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 14:42:07 +0100
Message-ID: <CACHz=Zh1-3Bvta7357arYkR-_bOyWkNOGorx6FQhjPnRqaK1_Q@mail.gmail.com>
Subject: Re: [PATCH] drivers/video: Convert source files to UTF-8
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:27=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Most of the tools nowadays assume this encoding.
> These files do not specify any encoding so convert them to the default.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Please ignore, the tools did a pretty bad job formatting and sending the em=
ail


Frediano

