Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B77904E16
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738942.1145809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJH8-0004Uk-EF; Wed, 12 Jun 2024 08:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738942.1145809; Wed, 12 Jun 2024 08:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJH8-0004SR-B0; Wed, 12 Jun 2024 08:24:10 +0000
Received: by outflank-mailman (input) for mailman id 738942;
 Wed, 12 Jun 2024 08:24:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BDc=NO=bounce.vates.tech=bounce-md_30504962.66695b25.v1-b9d18e805cb34b3aad09cf3d27c46ab2@srs-se1.protection.inumbo.net>)
 id 1sHJH7-0004SL-3c
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:24:09 +0000
Received: from mail180-20.suw31.mandrillapp.com
 (mail180-20.suw31.mandrillapp.com [198.2.180.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2245e87a-2895-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:24:06 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-20.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4VzdqT48JFzFCWhBK
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:24:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9d18e805cb34b3aad09cf3d27c46ab2; Wed, 12 Jun 2024 08:24:05 +0000
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
X-Inumbo-ID: 2245e87a-2895-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718180645; x=1718441145;
	bh=WR+ob45H4wrg2breZLSlO1RKjvBeRuzC/58xjyoZb1U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sRpw1IfVJHkyZlucuGSdgEQlRx1E+WC+8C/dVMrYGvcUvAJAOtqF3nqX0HOud0UGK
	 5mB+vx8gRUfNq1Js0ysgGRT8HQ4fXLDC+cbTJJFA4MeZtnHO4KVzoBDttgwYYeDdXd
	 FN4BcfB3BDD1AGTkc9fajFn1Z5FnnzonoMSNWxOwJX73+ZuaDE8ev2lbfmWLY00klP
	 G90uYtc3UtSf9yEch4nZ6yISDNBRkYn1ylruGCuRpqcS8vHp3H4D4vYtGHQRJj2zD5
	 gg+q+bCKRUV/HnQZ9xs53mJ6DU7bBsv31tQioy4HjoP2xV2CnuB9kiUn0pdkMHo0QD
	 Bp7eWzoPhmvpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718180645; x=1718441145; i=anthony.perard@vates.tech;
	bh=WR+ob45H4wrg2breZLSlO1RKjvBeRuzC/58xjyoZb1U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ELcFGMOnx+09icFWl6C3eFu7S3kgU5K58zlDwF8hv42SprsJ9YtE3OAmHjOyBSlsf
	 4msc8dwk9b55TiGvt8A+nNgYMwqysrv2h6+RKIuSpL2MUy2Hbfqq6Pg+sBij0hnXwm
	 BbNNG4Bau1ObON5UzFuk3+LGCA/LCOzw76SxNBxWCnEGasgFkEHlpq7clTsQM5pA36
	 41aUs6bJ5seUGStvXF+WzWWRs2XMwobJiuV4QD2D6EyNffou+yXRRGv7Hg0gbS7go2
	 Osav0FvJ+0MPiuRULHcgJeJQFxHcA0/70qFqh6mqcmCA5q8lWkeApw0vzNxTNtRc5d
	 eOPk1cjOJnrlQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=3F=20v6=204/9]=20tools/xl:=20Add=20altp2m=5Fcount=20parameter?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718180642893
To: =?utf-8?Q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Message-Id: <ZmlbInvgw6iu7s8b@l14>
References: <cover.1718038855.git.w1benny@gmail.com> <02e0eefe1bed87cb55490f6ea13fa28c94af2a0d.1718038855.git.w1benny@gmail.com>
In-Reply-To: <02e0eefe1bed87cb55490f6ea13fa28c94af2a0d.1718038855.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9d18e805cb34b3aad09cf3d27c46ab2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240612:md
Date: Wed, 12 Jun 2024 08:24:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:42PM +0000, Petr Bene=C5=A1 wrote:
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> 
> Introduce a new altp2m_count parameter to control the maximum number of a=
ltp2m
> views a domain can use. By default, if altp2m_count is unspecified and al=
tp2m
> is enabled, the value is set to 10, reflecting the legacy behavior.
> 
> This change is preparatory; it establishes the groundwork for the feature=
 but
> does not activate it.
> 
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> ---
>  tools/golang/xenlight/helpers.gen.go | 2 ++
>  tools/golang/xenlight/types.gen.go   | 1 +
>  tools/include/libxl.h                | 8 ++++++++
>  tools/libs/light/libxl_create.c      | 9 +++++++++
>  tools/libs/light/libxl_types.idl     | 1 +
>  tools/xl/xl_parse.c                  | 9 +++++++++
>  6 files changed, 30 insertions(+)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index f5c7167742..bfa06caad2 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1250,6 +1250,14 @@ typedef struct libxl__ctx libxl_ctx;
>   */
>  #define LIBXL_HAVE_ALTP2M 1
> 
> +/*
> + * LIBXL_HAVE_ALTP2M_COUNT
> + * If this is defined, then libxl supports setting the maximum number of
> + * alternate p2m tables.
> + */
> +#define LIBXL_HAVE_ALTP2M_COUNT 1
> +#define LIBXL_ALTP2M_COUNT_DEFAULT (~(uint32_t)0)

Can you move this define (LIBXL_ALTP2M_COUNT_DEFAULT) out of the public
header? I don't think this needs to be known to application using libxl
(like xl). You can move it to "libxl_internal.h", I don't think there's
a better place and there's already a few "default" (more like initial
value) define there.

Beside that, the patch looks fine,
so with that change: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech=
>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


