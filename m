Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682669D8A85
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842966.1258627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFc7T-0005va-1O; Mon, 25 Nov 2024 16:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842966.1258627; Mon, 25 Nov 2024 16:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFc7S-0005sw-V2; Mon, 25 Nov 2024 16:39:26 +0000
Received: by outflank-mailman (input) for mailman id 842966;
 Mon, 25 Nov 2024 16:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNn4=SU=bounce.vates.tech=bounce-md_30504962.6744a834.v1-a4d5ed2962b94439b4fd949b86b0f42a@srs-se1.protection.inumbo.net>)
 id 1tFc7R-0005sq-En
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:39:25 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0461ce7-ab4b-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:39:18 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XxryD71TQzG0CRCX
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 16:39:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a4d5ed2962b94439b4fd949b86b0f42a; Mon, 25 Nov 2024 16:39:16 +0000
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
X-Inumbo-ID: d0461ce7-ab4b-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQwNDYxY2U3LWFiNGItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUyNzU4LjY2NjYxLCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjc0NGE4MzQudjEtYTRkNWVkMjk2MmI5NDQzOWI0ZmQ5NDliODZiMGY0MmFAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732552757; x=1732813257;
	bh=o0akXVytT6ksnrZVyuLyVe3FmuKaCupmX1SmgZHztv0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CCTXDwbgr8W74Nqw4xzZl8arFpXiovfnkmATOVuPcc4Hm2Vo+ahfyuoe1BFs2+cNt
	 ElWRtnZciiEgK/9J29BagSFSvOW3JxDYe/J/31WEbjQQYEGSc3DD+j9ROZuy2pQWz2
	 9xTLCsSwW453sVSlSr23JzHTUonnoSu1P80WYjaB5MDlcx1V0sAtLTGJnnc5HPOv/2
	 kPjbFnHH/zYC41kFnrn4jGCBUL8pqyTSaaU/ltS03BqzZwzwPC5FFrlaf1Z/5mqwtq
	 JDV3dUXNJcH95ovLa4atgk6rEMlgskvib/xYXh6Z9xUp7t2cFz+70rTSTVR09hsUZK
	 B3+NKBDdBRgcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732552757; x=1732813257; i=teddy.astie@vates.tech;
	bh=o0akXVytT6ksnrZVyuLyVe3FmuKaCupmX1SmgZHztv0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=edEM8gaxojTgBfCNc10x+GETC3qASjAK6i3rSYs/ES1vOFdGm8rFtXRfGOILlzT5d
	 Vu1i1R8+uHFsdep0pamc9vMtBN1IOq0bdzmBVJhHQwNAm+uJCNhaK7L4HK/iOI3LUr
	 T0qGI9++gFmLknAnonWWxqpXqDi4Fw3n2BO+VLsiK3BRqNBqx8U22YwmrpjtqlK6mH
	 9XewPo+X+4Vdkdfy2/xgxEZRaz4OKAjp0UMZWYIjkKZzTSj7UecRQJCHsAF4SnFlFo
	 fM54XB7m+HCHCAAPe2ixBOd9HTpJ7LYRNg9wK6qbHfNGvtdpmD8fZx5Pjlj109pvCn
	 GVjpwGcFgSjhA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2008/25]=20tools/xenbindgen:=20Add=20support=20for=20enums=20in=20TOML=20specs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732552756104
Message-Id: <b4776dd0-9b4e-457c-9108-88fa2e575e7d@vates.tech>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <20241115115200.2824-9-alejandro.vallejo@cloud.com>
In-Reply-To: <20241115115200.2824-9-alejandro.vallejo@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a4d5ed2962b94439b4fd949b86b0f42a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 16:39:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

> +
>   /// A language-agnostic specification.
>   #[derive(Debug, serde::Deserialize)]
>   struct InFileDef {
>       /// List of structs described in this input specification.
>       structs: Option<Vec<StructDef>>,
> +    /// List of lang-agnostic enumerated descriptions.
> +    enums: Option<Vec<EnumDef>>,
>   }
>   

Alike for struct/..., I think we can merge that with OutFileDef using 
the default attribute in serde :
#[serde(default)]
https://serde.rs/field-attrs.html#default

That way, when there is no structs/... entry in the file, it is parsed 
as a empty vec![] instead of failing which allows us to remove this 
wrapper struct.

Cheers

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

