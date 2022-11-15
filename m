Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C882A629E7B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444007.698760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyTb-0004mz-4W; Tue, 15 Nov 2022 16:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444007.698760; Tue, 15 Nov 2022 16:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyTb-0004kL-1f; Tue, 15 Nov 2022 16:07:55 +0000
Received: by outflank-mailman (input) for mailman id 444007;
 Tue, 15 Nov 2022 16:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5L=3P=linaro.org=grant.likely@srs-se1.protection.inumbo.net>)
 id 1ouyTa-0004kF-5l
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:07:54 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8bcdd04-64ff-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 17:07:53 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id y16so25076512wrt.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Nov 2022 08:07:53 -0800 (PST)
Received: from smtpclient.apple ([84.64.97.234])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b00236545edc91sm12904953wra.76.2022.11.15.08.07.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Nov 2022 08:07:51 -0800 (PST)
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
X-Inumbo-ID: a8bcdd04-64ff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=evqU5NxwEOKZXOOFVQccO+bZ5pmK9VYGjD7XGWQB68Y=;
        b=rIDv+FE6ErLNWmJfRUvwgpkqsnCMeAfi6QnN2gTrLw0ZY80H90CzVcW8AFllt9aKxJ
         gM3Mq2XsIlv/XrLFfXuOcNVnXrcPl7cNn26XCtz42DvbBBFLb4oPjOADmWTitxFaIwyT
         o2fy9gEAExmfeAJbrc4t9NuFbxnXf8gaLU6IANn0ViTch4BMTtxoN9H9nkpFYjyz1Kqu
         IwaGbP4E2ys3SGiJHnaZgmpUrZrm1ji3KluoEwVSUK2lsMWIkWhjjIuRhroJi96t0d3m
         ID/Hyx2R1yYcsRRprUG2YXCc/Qpor5x5miCt8CDBnuV9eH5NeuFHIgAnCZO5ZdhYaGDm
         40/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evqU5NxwEOKZXOOFVQccO+bZ5pmK9VYGjD7XGWQB68Y=;
        b=NRpAD9XkGVjgsqSVIlM2vDLIAFFsUvkKWM3+X1FZB1WE9ZPbqpa29bftzrl4P2QeKE
         Pg/UxbjmBD+QbaAghALjsBABIwaDngQJzInezmEH//xWbDwk4mDediSRa5zgJhEs+Jhb
         6ithaUER+UTq30y6PN4PtQe+D1GWz0JqVGwbkh2E/w2H1kfdrEt4B+E8L23GMAETH7B7
         8Uy5JPaiA+IiqvgrcgPu2kJRxVJWi+D+N3mN4He5Pq6tsXdt6Wp31i2GMkwqGB7Vpd7X
         sduet/0ExGfbe3Z3xgjVQBfHwNEtO75wTGjBUIWEeTPsGPAypmO+/wEH9x4+b5zfaWsn
         a28w==
X-Gm-Message-State: ANoB5plk9C2mZEQ11ApKmnisPga87AricOeXI+ldE0g9iPwXbemyzZdl
	Lc/rlW2kK5//3PN5vfw1/D6ugA==
X-Google-Smtp-Source: AA0mqf4o+Opd6iZHcIE3wpQuVYIag2P9ZEaQkNzJlDYHX3AmOp+vAgdalh05FTemyjJ/ijxekkwsug==
X-Received: by 2002:adf:f209:0:b0:241:792e:237a with SMTP id p9-20020adff209000000b00241792e237amr9389879wro.511.1668528472439;
        Tue, 15 Nov 2022 08:07:52 -0800 (PST)
From: Grant Likely <grant.likely@linaro.org>
Message-Id: <D04DC85F-A139-4A5A-A8DB-298F80E0C6E7@linaro.org>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C69F1D2A-0C88-475B-AD2F-384D65B68652"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Date: Tue, 15 Nov 2022 16:07:40 +0000
In-Reply-To: <D374491A-0C9B-4A99-9276-44831EB4BCB2@arm.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Andrew Wafaa <Andrew.Wafaa@arm.com>,
 Robert Booth <rob.booth@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
 <D374491A-0C9B-4A99-9276-44831EB4BCB2@arm.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)


--Apple-Mail=_C69F1D2A-0C88-475B-AD2F-384D65B68652
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Linaro approves the license change

Acked-by: Grant Likely <grant.likely@linaro.org =
<mailto:grant.likely@linaro.org>>

> On 11 Nov 2022, at 13:51, Bertrand Marquis <Bertrand.Marquis@arm.com> =
wrote:
>=20
> Hi,
>=20
> +Grant Likely from Linaro.
>=20
> In the following change, we need to change the license to MIT (from =
GPL) of one of Xen public headers which has a Linaro copyright.
>=20
> @Grant Likely: could you confirm that Linaro is agreeing for Xen =
Project to do such a change ?
>=20
> Kind regards
> Bertrand Marquis
>=20
>> On 2 Nov 2022, at 11:28, Anthony PERARD <anthony.perard@citrix.com> =
wrote:
>>=20
>> This header have been created by moving code from other part of the
>> project and miss a licence header. The original source code was some
>> version of GPL or LGPL but we intend to have the public header to be
>> MIT so they can be included easily in other projects.
>>=20
>> Part of device_tree_defs.h were moved from libxl_arm.c which is
>> LGPL-2.1-only. And part were moved from device_tree.h that is
>> GPL-2.0-only.
>>=20
>> Part of the original code were added by Julien Grall @ Citrix with a
>> Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
>> 886f34045bf0. The other part were added by Ian Campbell @ Citrix, =
with
>> commit 0c64527e7fc9.
>>=20
>> Resolves: xen-project/xen#35
>> Fixes: 1c898a9fec7e ("xen/arm: move a few DT related defines to =
public/device_tree_defs.h")
>> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>=20
>> Notes:
>>   Julian was working @citrix until 2015.
>>=20
>> xen/include/public/device_tree_defs.h | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/xen/include/public/device_tree_defs.h =
b/xen/include/public/device_tree_defs.h
>> index 228daafe81..9e80d0499d 100644
>> --- a/xen/include/public/device_tree_defs.h
>> +++ b/xen/include/public/device_tree_defs.h
>> @@ -1,3 +1,9 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2013 Linaro Limited
>> + * Copyright (c) 2015 Citrix Systems, Inc
>> + */
>> +
>> #ifndef __XEN_DEVICE_TREE_DEFS_H__
>> #define __XEN_DEVICE_TREE_DEFS_H__
>>=20
>> --=20
>> Anthony PERARD
>>=20
>>=20
>=20


--Apple-Mail=_C69F1D2A-0C88-475B-AD2F-384D65B68652
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div>Linaro =
approves the license change</div><div><br></div><div>Acked-by: Grant =
Likely &lt;<a =
href=3D"mailto:grant.likely@linaro.org">grant.likely@linaro.org</a>&gt;</d=
iv><div><br></div><div><div><div><blockquote type=3D"cite"><div>On 11 =
Nov 2022, at 13:51, Bertrand Marquis &lt;Bertrand.Marquis@arm.com&gt; =
wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>Hi,<br><br>+Grant Likely =
from Linaro.<br><br>In the following change, we need to change the =
license to MIT (from GPL) of one of Xen public headers which has a =
Linaro copyright.<br><br>@Grant Likely: could you confirm that Linaro is =
agreeing for Xen Project to do such a change ?<br><br>Kind =
regards<br>Bertrand Marquis<br><br><blockquote type=3D"cite">On 2 Nov =
2022, at 11:28, Anthony PERARD &lt;anthony.perard@citrix.com&gt; =
wrote:<br><br>This header have been created by moving code from other =
part of the<br>project and miss a licence header. The original source =
code was some<br>version of GPL or LGPL but we intend to have the public =
header to be<br>MIT so they can be included easily in other =
projects.<br><br>Part of device_tree_defs.h were moved from libxl_arm.c =
which is<br>LGPL-2.1-only. And part were moved from device_tree.h that =
is<br>GPL-2.0-only.<br><br>Part of the original code were added by =
Julien Grall @ Citrix with a<br>Linaro "hat" in commits c3ba52a84dd8 and =
405c167f0ec9 and<br>886f34045bf0. The other part were added by Ian =
Campbell @ Citrix, with<br>commit 0c64527e7fc9.<br><br>Resolves: =
xen-project/xen#35<br>Fixes: 1c898a9fec7e ("xen/arm: move a few DT =
related defines to public/device_tree_defs.h")<br>Reported-by: Andrew =
Cooper &lt;Andrew.Cooper3@citrix.com&gt;<br>Signed-off-by: Anthony =
PERARD &lt;anthony.perard@citrix.com&gt;<br>---<br><br>Notes:<br> =
&nbsp;&nbsp;Julian was working @citrix until =
2015.<br><br>xen/include/public/device_tree_defs.h | 6 ++++++<br>1 file =
changed, 6 insertions(+)<br><br>diff --git =
a/xen/include/public/device_tree_defs.h =
b/xen/include/public/device_tree_defs.h<br>index 228daafe81..9e80d0499d =
100644<br>--- a/xen/include/public/device_tree_defs.h<br>+++ =
b/xen/include/public/device_tree_defs.h<br>@@ -1,3 +1,9 @@<br>+/* =
SPDX-License-Identifier: MIT */<br>+/*<br>+ * Copyright (c) 2013 Linaro =
Limited<br>+ * Copyright (c) 2015 Citrix Systems, Inc<br>+ =
*/<br>+<br>#ifndef __XEN_DEVICE_TREE_DEFS_H__<br>#define =
__XEN_DEVICE_TREE_DEFS_H__<br><br>-- <br>Anthony =
PERARD<br><br><br></blockquote><br></div></div></blockquote></div><br></di=
v></div></body></html>=

--Apple-Mail=_C69F1D2A-0C88-475B-AD2F-384D65B68652--

