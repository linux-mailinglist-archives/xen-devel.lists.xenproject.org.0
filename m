Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B3CAE5411
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 23:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022815.1398666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpB5-0002Px-5d; Mon, 23 Jun 2025 21:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022815.1398666; Mon, 23 Jun 2025 21:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpB5-0002OJ-2x; Mon, 23 Jun 2025 21:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1022815;
 Mon, 23 Jun 2025 21:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTpB3-0002OD-Nf
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 21:58:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTpB2-00GQL9-2O;
 Mon, 23 Jun 2025 21:58:08 +0000
Received: from [2a02:8012:3a1:0:fd5d:2703:c772:3074]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTpB2-00FSDb-18;
 Mon, 23 Jun 2025 21:58:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Qr2jrepojhY/uQjzxUaSl6uv1zmR++D21c/ZvinaiK0=; b=66bMVuwkbZG1v8s3MUEOgUg68t
	U9cl6TkghAdmzFhn4ALZk8kvRR3veUxeY8pQE1amABj4hCf3ULADXEW48QAPeaL6SAcIqw7AA0rxU
	0ZUDPR3bV5uRfYJ/nAq88FCZxOqEjS89XXw491Q5C/nW05uooRtxKWoQ5jud/oJhn6wQ=;
Message-ID: <f9943ca6-6c21-4be6-b2ee-7f53ec02056c@xen.org>
Date: Mon, 23 Jun 2025 22:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
 <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
 <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
 <bd09db53-2a99-420a-8a78-8bd9dee8c6b2@xen.org>
 <alpine.DEB.2.22.394.2506231225050.8066@ubuntu-linux-20-04-desktop>
 <562748f1-13f5-4e84-a761-f251c6e0296a@xen.org>
 <alpine.DEB.2.22.394.2506231341480.8066@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506231341480.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/06/2025 21:42, Stefano Stabellini wrote:
> I was trying to avoid introducing two functions that seemed unnecessary.
> If we go with Oleksii's approach, where do you think memcpy_toio()
> should be added? Oleksii added them to the scmi file, maybe we want to
> add them in a more generic location?

As this is a generic implementation, I would consider to impkement it in 
xen/lib/.

Cheers,

-- 
Julien Grall


