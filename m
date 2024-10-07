Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82999303F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812151.1224864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpC3-0007Oo-OK; Mon, 07 Oct 2024 14:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812151.1224864; Mon, 07 Oct 2024 14:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpC3-0007MQ-LT; Mon, 07 Oct 2024 14:58:39 +0000
Received: by outflank-mailman (input) for mailman id 812151;
 Mon, 07 Oct 2024 14:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eb/=RD=bounce.vates.tech=bounce-md_30504962.6703f71b.v1-7602c395d26546e39c5f9dc8eef4f58c@srs-se1.protection.inumbo.net>)
 id 1sxpC2-0007G0-3G
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:58:38 +0000
Received: from mail136-19.atl41.mandrillapp.com
 (mail136-19.atl41.mandrillapp.com [198.2.136.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1208466-84bc-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:58:37 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-19.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XMj2g0GzszRKLmR5
 for <xen-devel@lists.xenproject.org>; Mon,  7 Oct 2024 14:58:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7602c395d26546e39c5f9dc8eef4f58c; Mon, 07 Oct 2024 14:58:35 +0000
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
X-Inumbo-ID: a1208466-84bc-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728313115; x=1728573615;
	bh=Tu49QG85yQ27QrS1s7PP1qXcOb4aQI1T1GQD/voDLUg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eP4cjJYWoNDAGLkK0m+/4lZLiRAYoB8p4p8otxAYzDP/BNsR4wl/AA2bWyQsPKKK5
	 pZf6aubu1akV97O+OlW3rcQLG2TsagNYzJVRMhRZxPlaD539XtHnGkQflxi8uWp1RL
	 IY/XkA5DC1YdFzgXURE8bzlDoDPv5WhjJvTCXCFrKX8NvXEzGX8OaeQJkHdv/jwm4a
	 DlnaSamcRCl+n1GhbsQlJUzBlHS0VGqeiHr+89/41cYWmJe5F1Re3jrXUryD2P+RZk
	 aUC7OWjDahlksongj0ndDqf3Z4VP0ob4fEVA/OGWANyGfsv77Gwf82ApoPQDMTXyU1
	 jhUxPqDvTShBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728313115; x=1728573615; i=anthony.perard@vates.tech;
	bh=Tu49QG85yQ27QrS1s7PP1qXcOb4aQI1T1GQD/voDLUg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=baaDN7A1l4Uw8Ykr/uoEjZdKXrW5kxwZ959yC1vB04XMRcjpAX+epl286XiFKX7gQ
	 kb6D3FuRQQcmTa30ndTsOKXsC4eVVyKSL70XMd0gNmj2kMc10lkwAbP1a/LNKlEVuM
	 a4t6e2eTQuKs++2F0geIV2+wjT3ReJ2pgIxXygUjasYdoi5aDhyZNBvuro66BHWVOx
	 Nlz6tsZKonB+gx/m0/+gTJy7BsWijDm9CQxXeqIUGo+O0tlmfLO3b9p18uSeoGiTWT
	 LazX/bRW7EJMROk6jbfQdaHDqxEQ62HbO8pILGjur80GeaXLtoUSGzTqv6WzzlW6bM
	 mCaKDAL4NtRcg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20CI:=20Drop=20bin86/dev86=20from=20archlinux=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728313111091
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Message-Id: <ZwP3FiXXCmlyxeHF@l14>
References: <20241007095637.2450599-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241007095637.2450599-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7602c395d26546e39c5f9dc8eef4f58c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241007:md
Date: Mon, 07 Oct 2024 14:58:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 10:56:37AM +0100, Andrew Cooper wrote:
> These packages have moved out of main to AUR, and are not easily accessib=
le
> any more.  Drop them, because they're only needed for RomBIOS which is ve=
ry
> legacy these days.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


