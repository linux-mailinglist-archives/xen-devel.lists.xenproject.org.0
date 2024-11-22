Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00B9D5D85
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 11:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841846.1257336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tERH1-0007R9-1t; Fri, 22 Nov 2024 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841846.1257336; Fri, 22 Nov 2024 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tERH0-0007PT-VO; Fri, 22 Nov 2024 10:52:26 +0000
Received: by outflank-mailman (input) for mailman id 841846;
 Fri, 22 Nov 2024 10:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4B48=SR=bounce.vates.tech=bounce-md_30504962.67406263.v1-07f9e00b588f4df99a2fd6f276c1fd97@srs-se1.protection.inumbo.net>)
 id 1tERGz-0007PN-3z
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 10:52:25 +0000
Received: from mail179-37.suw41.mandrillapp.com
 (mail179-37.suw41.mandrillapp.com [198.2.179.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8934881-a8bf-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 11:52:20 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4XvsPH120HzG0CPcc
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 10:52:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 07f9e00b588f4df99a2fd6f276c1fd97; Fri, 22 Nov 2024 10:52:19 +0000
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
X-Inumbo-ID: d8934881-a8bf-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE3OS4zNyIsImhlbG8iOiJtYWlsMTc5LTM3LnN1dzQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQ4OTM0ODgxLWE4YmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjcyNzQwLjgzNDUxOSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDA2MjYzLnYxLTA3ZjllMDBiNTg4ZjRkZjk5YTJmZDZmMjc2YzFmZDk3QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732272739; x=1732533239;
	bh=smmuDVP83Q/T5yQyCOpmokMl4WpHxoRVO6RI1XA0pXo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ubnKIMK9v+pv/lW6JqRmtMxtuBc2k0yz+PKVJiGT8cS30vipmtwyrXAMY+KziSjpx
	 zRKlgMe3UZt/KO7J492ohASN5LwR2yxGAygVgNxXqIPUFuJtnsxqMuADeTHHjkclzN
	 qD4dQDFIfjKzv+1+bw5YO3wwlfGbZ7MTzdS4pgX607JsH9oKtvsA9rbs514KTiZ5UZ
	 CQdK/9N4B+Jqoc1hlltenlH68hrlafP71njB7oAJ3Kh9H+32vqfsytlKo4AkIwsWYl
	 +b4oTTY/oy3i0sfAgylGErZeo4qLo04CVgumArjzL0si1ljWvcEniQTBQCm7kyF/LA
	 DkYCSOV7Ou8Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732272739; x=1732533239; i=teddy.astie@vates.tech;
	bh=smmuDVP83Q/T5yQyCOpmokMl4WpHxoRVO6RI1XA0pXo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v3tIvwCvUyJvY7Cph/278tSo1IKvC0gxTJKwz9PsFLnbrkITJq2UWnkp+mLDj4Wd7
	 27diPoHjtUc7R+rsEmJ0eF06S9GyNTSY3oJeqcyPX12BWUzQOt3LST4aQTUfS0LVoY
	 qA7eKFOzOD/d1nFsj9V9T+5/4pnfdzfJ24di+oLYOCU+FIj0IUj/1t1L9j3GAdskii
	 ByfBT7NvbdNC8YHV2ev/eLpblqhTXiN9KzkpEsCMRvm+nCrMT/oEgSg8+WP3koq0V3
	 I2VUEl6rY+Me5Sj6wYvevG7TPQgNgJBb/2C5HlrQlny1F7sC358DNJgpfpo576a4NP
	 icxKPgo3h3x5g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2000/25]=20Introduce=20xenbindgen=20to=20autogen=20hypercall=20structs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732272738337
Message-Id: <5a3c8a6e-fee7-4dba-8d86-506aa7b3c2de@vates.tech>
To: "Anthony PERARD" <anthony.perard@vates.tech>, "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <Zz9yEUj1_t1SSKE_@l14>
In-Reply-To: <Zz9yEUj1_t1SSKE_@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.07f9e00b588f4df99a2fd6f276c1fd97?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241122:md
Date: Fri, 22 Nov 2024 10:52:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21/11/2024 =C3=A0 18:46, Anthony PERARD a =C3=A9crit=C2=A0:
> Instead of creating your own IDL specification, did you look for
> existing project that would do just that? That is been able to describe
> the existing ABI in IDL and use an existing project to generate C and
> Rust headers.
> 
> I kind of look into this, but there's quite a few project to explore and
> I didn't really spend enough time. Also, there's probably quite a lot
> that are for client-server interfaces rather than syscall/hypercalls, or
> they impose a data format.
> 

I think a such IDL would be C headers, but it's easy to make C headers 
that are hard to deal with in other languages. I checked briefly, and 
there is Fuchsia IDL that could be interesting in that matter but is 
much more complex than what we may be looking for.

> 
> Next, on the file format choice, is TOML the best for describing an ABI,
> or would other existing file format make it a bit easier to read, like
> JSON or YAML? (I quite like using YAML so I have a bias toward it =F0=9F=
=99=82,
> and that's the format used for the CI). I don't think it mater much for
> Serde which file format is used.

It can be decided by making examples of IDL files in various formats and 
deciding on which one would be the most readable/easy to deal with.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


