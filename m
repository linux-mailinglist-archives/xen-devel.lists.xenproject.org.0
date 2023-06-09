Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D072A00F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 18:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546207.852899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eqx-0004DK-90; Fri, 09 Jun 2023 16:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546207.852899; Fri, 09 Jun 2023 16:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7eqx-0004A9-5n; Fri, 09 Jun 2023 16:20:43 +0000
Received: by outflank-mailman (input) for mailman id 546207;
 Fri, 09 Jun 2023 16:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPzv=B5=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7eqw-0004A3-1t
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 16:20:42 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9222f28e-06e1-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 18:20:39 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 6B8FB3F002;
 Fri,  9 Jun 2023 09:20:36 -0700 (PDT)
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
X-Inumbo-ID: 9222f28e-06e1-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686327637; bh=yaFMAYkqSoKsm1KWqKXUroh2xCHu6zaJDCOtiS+azvs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bFqE/idVhz+9BZhncwlMf6DNtxNZiupng8aSCoL/5XnbqtaSSU2Y+k06uXwrbuEf4
	 9584wnIrOjPWs6a+jgrgPdYr7jIzvtXP3OMyePBd/8cBn8uhxsDfNP6i6ON0QbWh3o
	 PYbMbnM9dENNg9AM9HLIYooBHVelA80/znGuli8VrhqQd2cGpWaYTRRlNpWtOgDq1f
	 hS6z04jLWMtoEMmjHpZKIA66ZLesMPloID7YgJodFsAYqAtzlS2NldcnW54O/8tv3g
	 JQN7JapVa5QeDWDYLeQBSqv8vh6MSF82MfDY1zL7VuSJtTjckewep8AuK8NZJdhgCP
	 P9gBBRR0t6DgQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 11:20:35 -0500
Cc: <tpearson@raptorengineering.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Wei Liu" <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Julien Grall" <julien@xen.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <CT891GNQMJSW.20ZXURMBOTL24@Shawns-Mac-mini.lan>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
 <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>
 <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
 <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
In-Reply-To: <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>

On Fri Jun 9, 2023 at 11:07 AM CDT, Julien Grall wrote:
> Thanks for the explanations. To clarify, are you saying that all the=20
> files will be GPLv2+ or just some?

My idea was to license any file where I expect there to derivations
from existing code as GPLv2+, and fall back to GPLv2-only for
newly-written files for which I expect there to be no reuse of existing
GPLv2+ code.

> If the latter, then my concern would be that if you need to import=20
> GPLv2-only code, then you may need to write your code in a different=20
> file. This may become messy to handle and some developer may end up to=20
> be confused.

Agreed, and I definitely want to minimize confusion. Ultimately I think
situations like this will be unavoidable, though, since derivations will
likely need to be made from both GPLv2-only and GPLv2+ code.

> Cheers,

Thanks,
Shawn


