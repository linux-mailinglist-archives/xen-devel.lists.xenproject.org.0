Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE4220562
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 08:47:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvbCX-0003Xj-0d; Wed, 15 Jul 2020 06:47:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvbCV-0003X1-Fk
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 06:47:31 +0000
X-Inumbo-ID: 0de6c5ae-c667-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de6c5ae-c667-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 06:47:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45AD2AC85;
 Wed, 15 Jul 2020 06:47:33 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] x86: only generate compat headers actually needed
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5892f237-cfcf-eb19-058c-bd4f45c7bc97@suse.com>
 <20200714150344.GP7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41db65e1-8be9-fc19-48e7-3b83b8da1cf6@suse.com>
Date: Wed, 15 Jul 2020 08:47:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714150344.GP7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.07.2020 17:03, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 12:28:27PM +0200, Jan Beulich wrote:
>> As was already the case for XSM/Flask, avoid generating compat headers
>> when they're not going to be needed. To address resulting build issues
>> - move compat/hvm/dm_op.h inclusion to the only source file needing it,
>> - add a little bit of #ifdef-ary.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> TBH I wouldn't mind generating the compat headers even when not
> actually used by the build, sometimes is useful to have them for
> review context without having to play with the build options.

Right, that's what the post-commit-message remark says. The main
goal is to be consistent in what we do. The primary reason for
me to have chosen this route is that the compat header generation
isn't really quick, compared to the rest of the build process. It
is so slow that commit 7e9009891688 ("include: parallelize
compat/xlat.h generation") was a significant (i.e. very
noticeable) win.

Jan

