Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B85EC6C2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412729.656147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBpr-0001nb-K7; Tue, 27 Sep 2022 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412729.656147; Tue, 27 Sep 2022 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBpr-0001lo-HQ; Tue, 27 Sep 2022 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 412729;
 Tue, 27 Sep 2022 14:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0xq=Z6=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1odBpq-0001li-1J
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:45:22 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029da2a1-3e73-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:45:20 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id l8so6693185wmi.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 07:45:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c41cb00b003b31fc77407sm13973030wmh.30.2022.09.27.07.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:45:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCAFD1FFB7;
 Tue, 27 Sep 2022 15:45:18 +0100 (BST)
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
X-Inumbo-ID: 029da2a1-3e73-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
        bh=YqMlZu51UI6h+Dt93wjUN/BRhvTP/YAJelxxJOS2OUs=;
        b=h2qcHCtOiMQvrC+w0Mszb+DskJWVj+QHMJ5Ejmk+rtWu2Z0XTbkA4+VOB4WSV8ecZ1
         NHEMwvJsSz44pLUlrRcmC6qhoU8OPeYsjymE7BXtDNdtSF9Pnh6oHWjxyfTVOtqaTNl7
         1GRmB7Zl0iOOa/5q8X/U1yQ++hJxn5Wx8OLg3hUl9sDQQzDb1nE7R70h/pYzh0G1nqM4
         v+plJElglQUNlZkThh9qtYNdYG4lRDFI7qFk+gHzge8OvjfaORZhUSq3/zd0gE4EZWDJ
         65I/HELy4Lj2+62z9XDcpW3Xsw61MFICUWabnihWbNapkSzSiVi3gQn3VuUfKtwlfE/0
         Otdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date;
        bh=YqMlZu51UI6h+Dt93wjUN/BRhvTP/YAJelxxJOS2OUs=;
        b=z+3nyQtKwus+bJiR5mEEVU5ni4sv1RW4Y0Q8G68nVD9DSyRzglaZc89RdNu4OThZZB
         tWhQsKJzYiN0kLNwZpFPVvrzb6ss2io9mCr6tnEIjrkHUQ64l0YBpYQ0T5bC4q2M6YyM
         07UULDxilEoGVL8XanQ3eGzfG/HcyBHXAX6wbXAL1XpAYCdrLwkoDaTX/34J3AOD1iUZ
         Dcec3/3RJIUnMxi13KWJl94q5yRS9tsXsahD25n7iCZ8s9eALPeTTobOR7De2KzyHjdV
         36mXubRl9z2No+2tpZF6poXUDaKJ5o0wayOGLu2dSH6lPEiRMYL8ffJj8uokwoHyAQ+C
         1mDg==
X-Gm-Message-State: ACrzQf1HscxaGNwF8n7EGbG63j7reyShxSXsNNwYMwexse72d9mCXSNo
	u/fbmoH04Ah/jQwLSMbVU8y6cg==
X-Google-Smtp-Source: AMsMyM5perp2J56yByk5VI6gtec0IZRw3Rv15MXQdiRREvzy81Pt4XXwWFKigkZFzFxgEJSIoaSEeg==
X-Received: by 2002:a05:600c:4e11:b0:3b4:91fd:d0c with SMTP id b17-20020a05600c4e1100b003b491fd0d0cmr3019229wmq.71.1664289920068;
        Tue, 27 Sep 2022 07:45:20 -0700 (PDT)
References: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/NUMA: correct memnode_shift calculation for single
 node system
Date: Tue, 27 Sep 2022 15:44:11 +0100
In-reply-to: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
Message-ID: <87mtak3mgx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Jan Beulich <jbeulich@suse.com> writes:

> SRAT may describe even a single node system (including such with
> multiple nodes, but only one having any memory) using multiple ranges.
> Hence simply counting the number of ranges (note that function
> parameters are mis-named) is not an indication of the number of nodes in
> use. Since we only care about knowing whether we're on a single node
> system, accounting for this is easy: Increment the local variable only
> when adjacent ranges are for different nodes. That way the count may
> still end up larger than the number of nodes in use, but it won't be
> larger than 1 when only a single node has any memory.
>
> To compensate populate_memnodemap() now needs to be prepared to find
> the correct node ID already in place for a range. (This could of course
> also happen when there's more than one node with memory, while at least
> one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
> would also know to recognize this case.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> On my Skylake system this changes memnodemapsize from 17 to 1 (and the
> shift from 20 to 63).
>
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -78,7 +78,8 @@ static int __init populate_memnodemap(co
>          if ( (epdx >> shift) >=3D memnodemapsize )
>              return 0;
>          do {
> -            if ( memnodemap[spdx >> shift] !=3D NUMA_NO_NODE )
> +            if ( memnodemap[spdx >> shift] !=3D NUMA_NO_NODE &&
> +                 (!nodeids || memnodemap[spdx >> shift] !=3D nodeids[i])=
 )
>                  return -1;
>=20=20
>              if ( !nodeids )
> @@ -114,7 +115,7 @@ static int __init allocate_cachealigned_
>   * maximum possible shift.
>   */
>  static int __init extract_lsb_from_nodes(const struct node *nodes,
> -                                         int numnodes)
> +                                         int numnodes, const nodeid_t *n=
odeids)
>  {
>      int i, nodes_used =3D 0;
>      unsigned long spdx, epdx;
> @@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
>          if ( spdx >=3D epdx )
>              continue;
>          bitfield |=3D spdx;
> -        nodes_used++;
> +        nodes_used +=3D i =3D=3D 0 || !nodeids || nodeids[i - 1] !=3D
>              nodeids[i];

Is that boolean short cutting worth it instead of a more easily
readable:

        if (i =3D=3D 0 || !nodeids || nodeids[i - 1] !=3D nodeids[i])
           nodes_used++;

?

>          if ( epdx > memtop )
>              memtop =3D epdx;
>      }
> @@ -144,7 +145,7 @@ int __init compute_hash_shift(struct nod
>  {
>      int shift;
>=20=20
> -    shift =3D extract_lsb_from_nodes(nodes, numnodes);
> +    shift =3D extract_lsb_from_nodes(nodes, numnodes, nodeids);
>      if ( memnodemapsize <=3D ARRAY_SIZE(_memnodemap) )
>          memnodemap =3D _memnodemap;
>      else if ( allocate_cachealigned_memnodemap() )


--=20
Alex Benn=C3=A9e

