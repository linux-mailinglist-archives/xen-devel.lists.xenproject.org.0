Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51B1E4749
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxw5-00084P-JI; Wed, 27 May 2020 15:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdxw4-00084K-EY
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:25:40 +0000
X-Inumbo-ID: 5210b5f0-a02e-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5210b5f0-a02e-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 15:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 969A0B1FB;
 Wed, 27 May 2020 15:25:41 +0000 (UTC)
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
 <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
 <69bdaedf-c403-a77d-8ab1-12feffa15494@suse.com>
 <779861db-f9eb-634e-3d28-e113fcc37846@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2eb20e19-ae05-e2ae-431b-6ff1f85d4490@suse.com>
Date: Wed, 27 May 2020 17:25:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <779861db-f9eb-634e-3d28-e113fcc37846@citrix.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org,
 libc-alpha@sourceware.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 16:40, Andrew Cooper wrote:
> On 27/05/2020 15:00, Jan Beulich wrote:
>> You can have the descriptor map
>> only the [base,XenBase] part or the [0,base) one. Hence Xen, from its
>> #GP handler, flipped the descriptor between the two options depending
>> on whether the current access was to the positive of negative part of
>> the TLS seg. (An in-practice use of expand down segments, as you'll
>> surely notice.)
> 
> I've found gpf_emulate_4gb() in source history.  It was specific to
> 32bit builds of Xen (now long gone).
> 
> What I can't figure out is why this is unnecessary in 64bit builds of
> Xen.  We still enforce reduced segment limits on the guests descriptors.

Do we? I can't find such - neither boot_compat_gdt[] has any signs
of it, nor check_descriptor(). And we don't have a need to: The
entire range is used for the r/o M2P, i.e. protection is enforced
at the paging layer. 32-bit Xen necessarily had r/w as well as
executable sub-ranges there.

Jan

