Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB992FEBE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758230.1167624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJOI-00016w-9C; Fri, 12 Jul 2024 16:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758230.1167624; Fri, 12 Jul 2024 16:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJOI-00015Q-6P; Fri, 12 Jul 2024 16:45:02 +0000
Received: by outflank-mailman (input) for mailman id 758230;
 Fri, 12 Jul 2024 16:45:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jAYY=OM=bounce.vates.tech=bounce-md_30504962.66915d87.v1-19af8b80095d43d2ad2ae124ff8bf00a@srs-se1.protection.inumbo.net>)
 id 1sSJOG-00015K-3s
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:45:00 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1298843f-406e-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:44:58 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WLHWX0cwszB5p4mk
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 16:44:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 19af8b80095d43d2ad2ae124ff8bf00a; Fri, 12 Jul 2024 16:44:55 +0000
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
X-Inumbo-ID: 1298843f-406e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720802696; x=1721063196;
	bh=ws97YZDffOECT0G6U5lbKs5xwgFzyoilSfbfkO8W+g8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=k3YxlRvX1ekHlW9rXVHudlbW5SkUCeoS82UjYlc/8xibgLOQxKyLnb2UxbyMSpRyO
	 jtfymaMIPZocXtHwQoSfSrHh1Ld1TnqkAtApvlXnKpca4N8QREa3Do+2tEeyYpoIuM
	 E3UqQBuk8uY6Yd3hgpYBJbWghee2rczm+70JohIgNz2tMemRfYn6Jr4Nl/F1X82p56
	 MQvB0RZsJ4T4Ase6lAlk6lC5Xy2c7G7DrxweH3YtNX1kU9dKiuoggTC6Gsp9qaLR1C
	 sW48oz/dhNruophewIdw2TYTOuFAtFv3wr9htF6dNZcDJHKfAcY7Legne37MaOWt33
	 T0RzlsS/qg3vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720802696; x=1721063196; i=anthony.perard@vates.tech;
	bh=ws97YZDffOECT0G6U5lbKs5xwgFzyoilSfbfkO8W+g8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UH+tgTPW7bUEUz9TqeBrSVaXC4k0Vxym0qpNZAxG3x7Gn+JqgpHjfNwLxjmKjUleO
	 CSb2M0NUjmNhYLV1CZX56w7W0SGVIlAu8UC8oz34KHYncxEgiFnMfjlQJ5j8vwr4mC
	 gmkqG6rISd9qsFCoe5uT9sXzbksSSf4aZ2e+LZFFggJS1jk7ezfVIaOLZ1r7g1p/g4
	 8Mcn1RqSH5ZpN2CMywmulcXWk8dIceRylBDXNQapiCO9AUbbu3JSgg+FOUvdwJWKOF
	 4BQ5+Gycj0da+2PdDgsRKQ8Z5rEZmRbcVyN9uS9OWe53P3sYIo8mqaFeDAhbEwKD6v
	 0WwuPPDBoh69w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2018/12]=20CI:=20Add=20Ubuntu=2022.04=20(Jammy)=20and=2024.04=20(Noble)=20testing?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720802694693
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpFdhgyybAAOEsE8@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104907.3238026-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104907.3238026-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.19af8b80095d43d2ad2ae124ff8bf00a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 16:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:49:07AM +0100, Andrew Cooper wrote:
> The containers are exactly as per 20.04 (Focal).  However, this now brings us
> to 5 releases * 4 build jobs worth of Ubuntu testing, which is overkill.
> 
> The oldest and newest toolchains are the most likely to find problems with new
> code, so reduce the middle 3 releases (18/20/22) to just a single smoke test
> each.

That would mean a bit less `clang` build-test, but I guess that would be
mostly covered by FreeBSD testing on GitHub.

I tried to find out which version of clang were been used with this
patch applied:
    Alpine clang version 16.0.6
    Debian clang version 14.0.6
    clang version 17.0.6
    clang version 18.1.8
    clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)
    Ubuntu clang version 18.1.3 (1ubuntu1)
and the versions that won't be tested anymore:
    clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
    clang version 10.0.0-4ubuntu1
    Ubuntu clang version 14.0.0-1ubuntu1.1

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Anyway:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

