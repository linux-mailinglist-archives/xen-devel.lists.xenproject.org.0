Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E160786FCE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 15:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590071.922167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9wW-0001Lf-4b; Thu, 24 Aug 2023 13:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590071.922167; Thu, 24 Aug 2023 13:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9wW-0001J2-1z; Thu, 24 Aug 2023 13:00:08 +0000
Received: by outflank-mailman (input) for mailman id 590071;
 Thu, 24 Aug 2023 13:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jvz=EJ=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1qZ9wU-00019V-4m
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 13:00:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23da82d2-427e-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 15:00:03 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4013454fa93so6776655e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 06:00:04 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i12-20020adffdcc000000b0031ae8d86af4sm19874328wrs.103.2023.08.24.06.00.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Aug 2023 06:00:03 -0700 (PDT)
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
X-Inumbo-ID: 23da82d2-427e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692882003; x=1693486803;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDPak5yt8Nzl4Pm+Drg/e/4B55PA4fyHt5ck5SHf+2Q=;
        b=gFHbxLQzabYnZh1YXuZjqv1Yv0xmWoxrd5c9b3IP7cJzDOlUU1Bfzz9PnfWB3YJqH6
         8yhXmexPZ0CyK43fMUuosBz0Jjl+Ht5gopnxQ9hdkYa35TnGCt6LaFWlQcXVAoW+1H1a
         BM0P+0t0YnsFlh4YZHmCYmeaH6/dWmcP08dsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692882003; x=1693486803;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDPak5yt8Nzl4Pm+Drg/e/4B55PA4fyHt5ck5SHf+2Q=;
        b=eVvYEzXfvky/ga9UE6igLgu8b5N5fUwg0OEiigcCS4DlQdRh6nfNIgsaKzF5FOG9gs
         FSdDER4+YDUHqamEfpXZn7Y4O4dnjNVcMzMkUpQVQtgbKjlkLSwaQZWYq4tDbmExkLCa
         ROdO1k05bpn83B5EsNqfAjaYPnKQN7ujAmEK2B/4NGb3FFPSTHwWbnXgwZ2Nwqc13J8s
         uG1kAhQKt4fzG7DL+LcDPl6E+fHAtRZw5DwPL5lMzvZeOKiytVkhK04xT9JX1SeMVceb
         jcZ94aScEAFqDRUr0otVPttq8n+Q9ekXw+puB7KdpkfhwWG9UZmLaaMaTUgOQF17C64P
         do1w==
X-Gm-Message-State: AOJu0Yyo28FegSdJxWVjaleueG9fyvaZxLmQfslod+mxb35tXsPTFQLx
	5NW2VC0KAUtMKFxNz1K/utPgNg==
X-Google-Smtp-Source: AGHT+IEUn9CT+p/yK1TzQRbamb+Bo+IrpjFqRubP7AAyA6O3jIAii7aQhkzIRChYGkq51nfAGWjJlw==
X-Received: by 2002:adf:f6c9:0:b0:319:6956:725f with SMTP id y9-20020adff6c9000000b003196956725fmr12099529wrp.41.1692882003421;
        Thu, 24 Aug 2023 06:00:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] tools/oxenstored: Additional debugging commands
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230824123939.1297171-1-andrew.cooper3@citrix.com>
Date: Thu, 24 Aug 2023 14:00:01 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E36B681-1E60-47F2-8B71-D3649F4B21A1@cloud.com>
References: <20230824123939.1297171-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)

Acked-by: Christian Lindig <christian.lindig@cloud.com>


> On 24 Aug 2023, at 13:39, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>=20
> These were added to aid security development, and are useful generally =
for
> debugging.
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20
> I found this hiding down the back of the patchqueue.
> ---
> tools/ocaml/xenstored/process.ml | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>=20
> diff --git a/tools/ocaml/xenstored/process.ml =
b/tools/ocaml/xenstored/process.ml
> index 2e62c7a10e7a..432d66321cbb 100644
> --- a/tools/ocaml/xenstored/process.ml
> +++ b/tools/ocaml/xenstored/process.ml
> @@ -235,6 +235,23 @@ let do_debug con t _domains cons data =3D
>     | "watches" :: _ ->
>       let watches =3D Connections.debug cons in
>       Some (watches ^ "\000")
> +    | "compact" :: _ ->
> +      Gc.compact ();
> +      Some "Compacted"
> +    | "trim" :: _ ->
> +      History.trim ();
> +      Some "trimmed"
> +    | "txn" :: domid :: _ ->
> +      let domid =3D int_of_string domid in
> +      let con =3D Connections.find_domain cons domid in
> +      let b =3D Buffer.create 128 in
> +      let () =3D con.transactions |> Hashtbl.iter @@ fun id tx ->
> +        Printf.bprintf b "paths: %d, operations: %d, quota_reached: =
%b\n"
> +          (List.length tx.Transaction.paths)
> +          (List.length tx.Transaction.operations)
> +          tx.Transaction.quota_reached
> +      in
> +      Some (Buffer.contents b)
>     | "xenbus" :: domid :: _ ->
>       let domid =3D int_of_string domid in
>       let con =3D Connections.find_domain cons domid in
>=20
> base-commit: b0cd7499ddd281033548a702c6d61ab13fdd1f67
> --=20
> 2.30.2
>=20


