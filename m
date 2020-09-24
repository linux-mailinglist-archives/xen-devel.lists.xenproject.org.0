Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F3276F25
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOwj-00089z-GG; Thu, 24 Sep 2020 10:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oT5B=DB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kLOwi-00089u-8Q
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:57:52 +0000
X-Inumbo-ID: d418da8b-4089-4c1c-9c74-e2bd1145c014
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d418da8b-4089-4c1c-9c74-e2bd1145c014;
 Thu, 24 Sep 2020 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600945072;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yvzSyTYJ9gtNRHznG5YTzeN4pAeIeNypLZj//QsKxGU=;
 b=WHphIW5FyKxb6ph+3rUqtnMIlO5Y8J/akrniYrR+C7rfw0scKtBoY7WW
 g4KoKF6VUqyrPwx+xL0YsBkDTsyAYgWPVCmEwkn+TkFSd+MMj69wnoHTO
 PLuISUyrOE3eUW+XkTP4vSTeYFEAwMjjQqmHNXGLmEZy6rQnzqy9ViQBw M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PcFFpqhTJ3cGg9+oomZr6Y3BgXHZ1yRi4BsXG6qEN5BLdHSNHBE1g6zyNuuFhxxnNcYUQ3eUdz
 B5aobHs7K0WycFs3t36cyMnt76BKmvh5Qn1qKHHRrlXwpl3I0AZOmZbbw9qD7RxmVN7KjCtyKL
 lLhDijbUbTytSMhrgAjqbB9MAET9sj7iIz88SvEtLXsrY2KR2AWs+UJ467s6DSoUaeA+7iXefo
 dEplnA6/uGwOer/fLGTexut9oW2p6xuF47n7OpIz6fbPxe8aNcGqC7Z/JaRkJLaRAmuJNWOfsd
 L20=
X-SBRS: None
X-MesageID: 27435887
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,297,1596513600"; d="scan'208";a="27435887"
Subject: Re: [PATCH v2 04/11] xen/memory: Fix acquire_resource size semantics
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
CC: 'George Dunlap' <George.Dunlap@eu.citrix.com>, 'Ian Jackson'
 <iwj@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, 'Stefano Stabellini'
 <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>, 'Julien Grall'
 <julien@xen.org>, =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?=
 <michal.leszczynski@cert.pl>, 'Hubert Jasudowicz'
 <hubert.jasudowicz@cert.pl>, 'Tamas K Lengyel' <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-5-andrew.cooper3@citrix.com>
 <003b01d6925a$67f9e2b0$37eda810$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <336c1114-2ffb-312c-0990-d2fa389a3b23@citrix.com>
Date: Thu, 24 Sep 2020 11:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003b01d6925a$67f9e2b0$37eda810$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/09/2020 11:06, Paul Durrant wrote:
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index d1cfc8fb4a..e82307bdae 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4591,6 +4591,26 @@ int xenmem_add_to_physmap_one(
>>      return rc;
>>  }
>>
>> +unsigned int arch_resource_max_frames(
>> +    struct domain *d, unsigned int type, unsigned int id)
>> +{
>> +    unsigned int nr = 0;
>> +
>> +    switch ( type )
>> +    {
>> +#ifdef CONFIG_HVM
>> +    case XENMEM_resource_ioreq_server:
>> +        if ( !is_hvm_domain(d) )
>> +            break;
>> +        /* One frame for the buf-ioreq ring, and one frame per 128 vcpus. */
>> +        nr = 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), PAGE_SIZE);
> The buf-ioreq ring is optional

Yes, but it's position within the resource, and effect on the position
of the ioreq page(s), is not.

>  so a caller using this value may still get a resource acquisition failure unless the id is used to actually look up and check the ioreq server in question for the actual maximum.

Yes, but that is potentially true of *any* acquisition attempt, even if
the id matches, because maybe someone else has destroyed the ioreq
server, or the domain, in the meantime.


What we have is an mmap() where the caller needs to know to not try and
map page 0 for an ioreq server where buf-ioreq doesn't exist.

This is a direct consequence of:

#define XENMEM_resource_ioreq_server_frame_bufioreq 0
#define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))

and in practice, what a qemu/demu/other needs to do to map just the
ioreq frames (in a manner compatible with >127 vcpu HVM domains) is to
query the resource size and map size-1 pages from offset 1. 

~Andrew

