Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D064EC48
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 14:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464728.723210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6B6I-00033S-1w; Fri, 16 Dec 2022 13:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464728.723210; Fri, 16 Dec 2022 13:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6B6H-00030t-VV; Fri, 16 Dec 2022 13:50:09 +0000
Received: by outflank-mailman (input) for mailman id 464728;
 Fri, 16 Dec 2022 13:50:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hlz3=4O=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p6B6G-00030n-EK
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 13:50:08 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cdf045a-7d48-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 14:50:07 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id m19so3685823edj.8
 for <xen-devel@lists.xenproject.org>; Fri, 16 Dec 2022 05:50:07 -0800 (PST)
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
X-Inumbo-ID: 8cdf045a-7d48-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qp2x/sN/dY5wGzbmiMYs5tvErc/hFbrPTNBPlORKzsI=;
        b=HoqP15cEdNCXy+vMry4im6bm+VEVNssCruVHaaQKFfq3Sju8r/K7w5OEDjvnAuccbo
         qi2r0tYY+8NXRwdELPFYxDjxLbGjRC7gHIRPBwAaubFeDEiJBKuVQANIr8b3hmBYsNP6
         cfDJbq00Aklb0TxXte7a/Q2ZLOMygYJnF1J3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qp2x/sN/dY5wGzbmiMYs5tvErc/hFbrPTNBPlORKzsI=;
        b=NZ1Fc/G18E2i1mlt1eZRZKytm3Aucp+9Pocag5HO7rO6PDUdD5UL8coQliKDxtKaV5
         ltqAZ8XtTYHfxQqqCJ9TBrZOJbwq2IIN8r4CNH6jQEqwJdZWMbLYXk93KY30W0k0HyQu
         65iRBTGTVhuR0Tn55ryLo+Dr0S2L6aB2TLzRx6Nxu1L5PdeBHVl5m1F4sEXOgM1DsrK7
         gdmOuZecuExDqWgyDbfpDzT6Uwb5SQdsWWAfQYfwTW/rlu12gI4nGXQS2K7982BKLdA+
         3gGoI2ehx+WLlXs3pmPvTYi+J6JFpw3nQgraXTUB5rrNQ+jklFH8T6Yb2+ts2hviWPW7
         achQ==
X-Gm-Message-State: ANoB5plyh2/HnpGLXKkBYRVM2tpYeNBztRviZWLknlLFEDIwK2Vd1wJl
	LEBBumMuR2tXP3wwOazZlIJB7LociCw494krcnmrCg==
X-Google-Smtp-Source: AA0mqf6OLi/SKtCL54cTjjF64Bvbm1E7fyBfqtmHuEwGiG4Esz56y7Agf1z05rlMzxPwvvVPMl37+vDesDJCeW4Ebfk=
X-Received: by 2002:aa7:dd4b:0:b0:467:65a2:f635 with SMTP id
 o11-20020aa7dd4b000000b0046765a2f635mr75649703edw.106.1671198606957; Fri, 16
 Dec 2022 05:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20221216104904.3348-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221216104904.3348-1-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 16 Dec 2022 13:49:56 +0000
Message-ID: <CA+zSX=aTmgvX8YVS=4utHJ=5YQ_x=B_xdSSwykwG=v7soeb_+w@mail.gmail.com>
Subject: Re: [PATCH] tools/golang: Refresh bindings following virtio changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000005131af05eff23fe5"

--0000000000005131af05eff23fe5
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 16, 2022 at 10:49 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>

Assuming this is just re-running the generators, and that the result
compiled cleanly:

Acked-by: George Dunlap <george.dunlap@cloud.com>

>
>

--0000000000005131af05eff23fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 16, 2022 at 10:49 AM Andr=
ew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@c=
itrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Fixes: 43ba5202e2ee (&quot;libxl: add support for generic virtio=
 device&quot;)<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br></blockquote><div=
><br></div><div>Assuming this is just re-running the generators, and that t=
he result compiled cleanly:</div><div><br></div><div>Acked-by: George Dunla=
p &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</a=
>&gt;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--0000000000005131af05eff23fe5--

