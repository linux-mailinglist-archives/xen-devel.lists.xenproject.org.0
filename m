Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5E7EB66E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 19:33:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633200.987844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2yDv-0000Lm-SZ; Tue, 14 Nov 2023 18:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633200.987844; Tue, 14 Nov 2023 18:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2yDv-0000GT-Pc; Tue, 14 Nov 2023 18:33:19 +0000
Received: by outflank-mailman (input) for mailman id 633200;
 Tue, 14 Nov 2023 18:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2yDu-0000F6-Hc
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 18:33:18 +0000
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46bc3c18-831c-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 19:33:16 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.146.20])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 0EC4E28B30
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 18:33:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-v88qt (unknown [10.110.171.120])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 930651FE05;
 Tue, 14 Nov 2023 18:33:15 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-6684bf9d7b-v88qt with ESMTPSA
 id GRazGmu9U2XKUgEAwO9vKQ
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 18:33:15 +0000
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
X-Inumbo-ID: 46bc3c18-831c-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-110S00498ef7124-85d0-44d9-b2fd-6468bedf7841,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
Message-ID: <e7a7f25e-3b38-f683-334d-519db7b32f3f@3mdeb.com>
Date: Tue, 14 Nov 2023 19:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/10] x86/spec-ctrl: Remove conditional IRQs-on-ness for
 INT $0x80/0x82 paths
Content-Language: en-US
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
 <a48bb129f1b9ff55c22cf6d2b589247c8ba3b10e.1699981248.git.krystian.hebel@3mdeb.com>
In-Reply-To: <a48bb129f1b9ff55c22cf6d2b589247c8ba3b10e.1699981248.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13649284571042654576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfevfhgjtgfgsehtjeertddtfeejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeeigeevleeuudffjeevvdevieevhfdvfeevheffjeduhfeljeejffeijeeuffffnecuffhomhgrihhnpeefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

Please ignore this series and review/reply to the other one
([XEN PATCH 0/9] x86: parallelize AP bring-up during boot) instead.
`git send-email` did what I asked it to do instead of what I wanted,
so I accidentally sent WIP version of patches.

Sorry for the noise.

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


