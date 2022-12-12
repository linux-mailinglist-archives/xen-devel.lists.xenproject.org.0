Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EAB649E74
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459552.717308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4heM-0003uw-La; Mon, 12 Dec 2022 12:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459552.717308; Mon, 12 Dec 2022 12:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4heM-0003sp-Ij; Mon, 12 Dec 2022 12:11:14 +0000
Received: by outflank-mailman (input) for mailman id 459552;
 Mon, 12 Dec 2022 12:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4heK-0003sj-Ul
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:11:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 103e2e3b-7a16-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 13:11:10 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id t17so27445480eju.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 04:11:10 -0800 (PST)
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
X-Inumbo-ID: 103e2e3b-7a16-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=we0UjjtDg7zgG01XqhdzcZf5aBOw27842uHu3GDOfws=;
        b=OpmDsDT4MP0ixZYaRQzV/+JCyuCQ4/I3YwDXjdcJ2BLk7mhRXcw++LeGK4Em2kNLcw
         L1NMEUrUCL0WQcIDtlpazKgAnDclncS7EnFI9Fdb7V/M8kTZP/TWGUxc7FHApNx2XgIU
         MmxW2DFHonpxWOLYLFHIS4vSeYY3LWthVp0XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=we0UjjtDg7zgG01XqhdzcZf5aBOw27842uHu3GDOfws=;
        b=WPGYHhE5Mpu5eKE08h81Gna26o/F8TeVtv9WJTK+Cp9DCLif8XVNYl5ffz/W58YtB4
         wEGxIPrWgsw8diHUEfrMGMNxo0Kwqz5VAqHaxJQ1UVi2UK7MJOB+wkdjgnp+A+Ucrot6
         AO+04QSL60x+wFssJrpNWkhR2qzojzhK+7LGdHgYbE/mIeVlvGiti0/3uQhW7DyiF2Pi
         hPbquF1dmN82Op6EtFkazC7iw2ZEwbkMUTgz27u6QdyVHiVYCYRDiYmxvx6UgqaWmKkT
         fKUWcpL+i4kk2q85kIhJaqtwfw0e0jyghO+lTWO4qc0pulY1e/xmctPRfaXoU2WoUT99
         3Vew==
X-Gm-Message-State: ANoB5pldL5s4/TPHNDf8X4FprM8GWR2zYRneqQptFJCT22GNdBphfxX5
	LN0MwFUSVDNLTSN9uN4iKcnn21mwm3z6HdHOFwV/cA==
X-Google-Smtp-Source: AA0mqf48Ro35xQ3SGcr6ANWr3gkp4vOItDhS4IjCVIG+69ok0qV5yzfdVwhOvPqzyhUIZdb/3AB0xh7B2VjTVQwnHfU=
X-Received: by 2002:a17:906:4bcc:b0:7be:6ab8:4ccc with SMTP id
 x12-20020a1709064bcc00b007be6ab84cccmr44944916ejv.713.1670847069605; Mon, 12
 Dec 2022 04:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-3-julien@xen.org>
In-Reply-To: <20221212093410.36289-3-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 12:10:58 +0000
Message-ID: <CA+zSX=b7GgmvLdDb3UFWry7ZY7YSzUz1taegwgoQUQo8_EMAYw@mail.gmail.com>
Subject: Re: [PATCH 2/8] docs/process: branching-checklist: Remove reference
 to qemu-ijw.git
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, ijackson@chiark.greenend.org.uk
Content-Type: multipart/alternative; boundary="0000000000000ee59605efa0668f"

--0000000000000ee59605efa0668f
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> Per [1], qemu-iwj.git was a clone of QEMU traditional on Ian's computer
> for tagging QEMU trad.
>
> The next section will provide tag for the official tree. So remove
> the section about qemu-ijw.git.
>
> [1] 25482.10006.140155.984629@chiark.greenend.org.uk
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>

Acked-by: George Dunlap <george.dunlap@cloud.com>

--0000000000000ee59605efa0668f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 9:34 AM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Julien Gr=
all &lt;<a href=3D"mailto:jgrall@amazon.com" target=3D"_blank">jgrall@amazo=
n.com</a>&gt;<br>
<br>
Per [1], qemu-iwj.git was a clone of QEMU traditional on Ian&#39;s computer=
<br>
for tagging QEMU trad.<br>
<br>
The next section will provide tag for the official tree. So remove<br>
the section about qemu-ijw.git.<br>
<br>
[1] <a href=3D"mailto:25482.10006.140155.984629@chiark.greenend.org.uk" tar=
get=3D"_blank">25482.10006.140155.984629@chiark.greenend.org.uk</a><br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>A=
cked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">georg=
e.dunlap@cloud.com</a>&gt;</div></div></div>

--0000000000000ee59605efa0668f--

