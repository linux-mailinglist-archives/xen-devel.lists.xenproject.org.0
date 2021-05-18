Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B633871ED
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128732.241622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litGT-0000Xn-71; Tue, 18 May 2021 06:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128732.241622; Tue, 18 May 2021 06:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litGT-0000Up-3V; Tue, 18 May 2021 06:31:37 +0000
Received: by outflank-mailman (input) for mailman id 128732;
 Tue, 18 May 2021 06:31:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1litGR-0000Uj-0s
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:31:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e373942d-b41f-420c-af38-ca3c02330dfb;
 Tue, 18 May 2021 06:31:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47F5FAF0B;
 Tue, 18 May 2021 06:31:33 +0000 (UTC)
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
X-Inumbo-ID: e373942d-b41f-420c-af38-ca3c02330dfb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621319493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HnESSdBCvYuGGZZyXbf4rxoatfqwLtUxoeI8jOpi424=;
	b=E5fhe/bpF/MtCa0BP1hMCmDXonZdvixJXNIAecPhPhZaNv9mpFY66eXS9z+GlRBrnQ264t
	gvUARtLz0ir4RoQu7zqXiLwWZqRxVg/rvMlJPHrOJ10K3siQsRHyIesCZ0jvZ4bh2oSsf7
	zZj7RfY18iAmcEklKM4Dx1KK1uJZ1Kk=
Subject: Re: [PATCH v3 3/5] xen: Fix build when !CONFIG_GRANT_TABLE
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <834f7995ae80a3b37b6d508d1c989b4ee391f61b.1621017334.git.connojdavis@gmail.com>
 <b56a1cfd-46ab-c601-883c-73537dfaac92@suse.com>
 <9b231486-bdf8-d6a7-c9c6-126d5bc207f8@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31d96abe-ca60-e621-3b6c-e70663b8199d@suse.com>
Date: Tue, 18 May 2021 08:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9b231486-bdf8-d6a7-c9c6-126d5bc207f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 05:58, Connor Davis wrote:
> 
> On 5/17/21 5:22 AM, Jan Beulich wrote:
>> On 14.05.2021 20:53, Connor Davis wrote:
>>> Move struct grant_table; in grant_table.h above
>>> ifdef CONFIG_GRANT_TABLE. This fixes the following:
>>>
>>> /build/xen/include/xen/grant_table.h:84:50: error: 'struct grant_table'
>>> declared inside parameter list will not be visible outside of this
>>> definition or declaration [-Werror]
>>>     84 | static inline int mem_sharing_gref_to_gfn(struct grant_table *gt,
>>>        |
>> There must be more to this, as e.g. the PV shim does get built with
>> !GRANT_TABLE. Nevertheless, ...
>>
> Can you elaborate? I tested all defconfigs with and without grant tables
> 
> enabled on x86 and ARM and they all build fine.

I'm confused: Everything building fine supports my statement, so if
more elaboration was needed, it would be you to make more precise
the conditions upon which a build failure would occur. But this is
largely moot now, since I did commit your change yesterday already,
for, as said, the potential of breaking the build being obvious
enough.

Jan

