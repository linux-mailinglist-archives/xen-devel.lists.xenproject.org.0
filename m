Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3FA7BEC4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 16:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938290.1339199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hlz-000737-59; Fri, 04 Apr 2025 14:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938290.1339199; Fri, 04 Apr 2025 14:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hlz-000710-1E; Fri, 04 Apr 2025 14:11:55 +0000
Received: by outflank-mailman (input) for mailman id 938290;
 Fri, 04 Apr 2025 14:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8meU=WW=bounce.vates.tech=bounce-md_30504962.67efe8a4.v1-34a91a02e608459584e5ac23d20d43c5@srs-se1.protection.inumbo.net>)
 id 1u0hlw-00070u-Pb
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 14:11:52 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c027a8c9-115e-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 16:11:50 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZTgX471g5z705lqq
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 14:11:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 34a91a02e608459584e5ac23d20d43c5; Fri, 04 Apr 2025 14:11:48 +0000
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
X-Inumbo-ID: c027a8c9-115e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743775909; x=1744045909;
	bh=P1j4xBL224hXh5pontaZYz6uUzT7pbV2mzDH/T0v5mk=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yCuH2DsE/Fk9OWoTRARJ+ach/UX3wPMxsd1mKQPsL9thpPDyZ1AurOIBslnRXKpwb
	 49tFjRIsMaTViSZhZz6LxzhGQ+xkHx3AvWYFc0tpjo65tMuOYzES6iWe6Rt8VBrrtM
	 nFt5E/T6ZreGw+gtTN8F5UfGenkt7QLw0K10e56niepRYkl/JeeiH+GVvfVuGaLfbl
	 j95I3CaChKInuwvdLuJBAKclOXLIu4Ffq6mqvJwaPUcSr2ocFIFAVm3/2HPSxjwuip
	 TBhXdJJRWWv70NXCIOcgpBZyYvue7VoGEy3Qzp6yUvkt+3k7/E6FdqA/7FGBNAWBpK
	 Z2cWYtoXfBN/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743775909; x=1744036409; i=teddy.astie@vates.tech;
	bh=P1j4xBL224hXh5pontaZYz6uUzT7pbV2mzDH/T0v5mk=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C4/IqyRq9F6dCmOCFK1OXq8ciA2lzxbS2OmYIH9A5G6c+nL3YI4kkc6bD/LipL67r
	 jbfRWzLaFAHDTYMwAR1MA3tsm5erp9Zz1gZ0isuPoaiJBVdtzgOEHQ/Zynpg3xMFV0
	 fNqQd9Cieq+aJbcXvx7jYphNkcFZCbO4Z4m41T+/hzIhEPdNEIDttwPrgdAZ9kzSuq
	 RikBWpuc1fu0Ag3KVSvdrNHKxJc7R1y4dr2NA5KmN/5uy8FLGSJtwZ68Z+AL8UXSAL
	 Ac1cgrNt1zxcf6R5k4m5w1eGVIL7J7MuTKDqxCQgWCZdKyPi0JpdO7ykUW/8nkyhx4
	 QJINponaPEQWg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=201/2]=20x86/amd:=20Add=20guest=20support=20for=20AMD=20TCE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743775907693
Message-Id: <789f71af-11fb-4d02-9edc-8128569c5979@vates.tech>
To: xen-devel@lists.xenproject.org
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
In-Reply-To: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.34a91a02e608459584e5ac23d20d43c5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 14:11:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Sorry I forgot to run add_maintainers on this patch series, so this 
serie got only sent to xen-devel@lists.xenproject.org without the proper CC.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


