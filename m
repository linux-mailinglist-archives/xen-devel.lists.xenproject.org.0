Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E9649ECA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459594.717362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i0x-0000aE-DC; Mon, 12 Dec 2022 12:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459594.717362; Mon, 12 Dec 2022 12:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i0x-0000Xt-9Y; Mon, 12 Dec 2022 12:34:35 +0000
Received: by outflank-mailman (input) for mailman id 459594;
 Mon, 12 Dec 2022 12:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4i0v-0000WF-R9
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:34:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549becf3-7a19-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 13:34:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id kw15so27540165ejc.10
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 04:34:33 -0800 (PST)
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
X-Inumbo-ID: 549becf3-7a19-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0WaRvma689prLQIUm+1mBKnqJrWz+zGeBkSIxcD+nm4=;
        b=R7/6BEAG6oWWNN/ncZGj+G4eEvlHYP0m1nWOYusTjo8CpGeTcB9xy67doJ2giK58Hp
         OtZANVCwi5UaLgn/XlD0eC7r7hJCTIpiCNjVCA3ntvtm8rMkaXrLJtrpVnTofrt9xlKD
         ZeCtPGDOD6RQjsdocveXcx3gq7xhfhgKFtjho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WaRvma689prLQIUm+1mBKnqJrWz+zGeBkSIxcD+nm4=;
        b=5+EK1yuy1brdGXZh4x12NS5MNTfBv4+ZUGpF4w5NlSQ/JFlH3hOH6SwKD1gVDHt0VG
         36l8EAUVjt99qtDoY3HLB6Opzmv8Q9TzYWTC6tGRT51NiMfZOD0c1PYRX+KO4RKO2WFh
         TQTbK5+tVfASoSUjg1P15SQme23Bfth3WKESf40CKg/qJ3SZ1HLFImE/M64NX/di5lKu
         TnuprN4ytq8vLDdxB9L9v3BAGrR0xhpjT60aHrlJvqDw8VQBbnGCzCEp0zJ6Rw3yHieT
         UqjWooG0HZGl7QjFKpWIiFbJz1psgfHAOEfdu7guNbAfo3Rxb+p+cipPNBjQ538LlvUV
         w+4Q==
X-Gm-Message-State: ANoB5pky7CkJJ7QmbuNvrsIYalJi1tOsTTjGwiVVYhmQFj+9Bhulzxq2
	n0ekiA43a6FY5dDZLyfpK5Z4Jhfoy51ug9oFXNv/Bw==
X-Google-Smtp-Source: AA0mqf78V85c3mOGydGI2hP/dz+c27jSE2Yz5I5QKGUZ4ncroTMW48FrOeIbXTVPY9I/hKneJYMdZ98rsdElwCkwidE=
X-Received: by 2002:a17:906:970a:b0:7c1:266a:73e with SMTP id
 k10-20020a170906970a00b007c1266a073emr4139709ejx.179.1670848472821; Mon, 12
 Dec 2022 04:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-7-julien@xen.org>
In-Reply-To: <20221212093410.36289-7-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 12:34:22 +0000
Message-ID: <CA+zSX=aozbVbW0H_YhCvT_7JVmAR5yhK1qNb6ZH_p5gxhxBedQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] docs/process: branching-checklist: Remove section
 about the cambridge colo
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="000000000000b244fa05efa0b910"

--000000000000b244fa05efa0b910
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> The cambridge colo was internal to Citrix (now Cloud) and hasn't been used
> by the community for a while.
>
> So remove the section.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>

Acked-by: George Dunlap <george.dunlap@cloud.com>

--000000000000b244fa05efa0b910
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
The cambridge colo was internal to Citrix (now Cloud) and hasn&#39;t been u=
sed<br>
by the community for a while.<br>
<br>
So remove the section.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>A=
cked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">georg=
e.dunlap@cloud.com</a>&gt;</div><div><br></div></div></div>

--000000000000b244fa05efa0b910--

