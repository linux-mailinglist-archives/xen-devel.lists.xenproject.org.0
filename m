Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE03074FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76952.139129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55hQ-0004Wo-R1; Thu, 28 Jan 2021 11:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76952.139129; Thu, 28 Jan 2021 11:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55hQ-0004WP-NC; Thu, 28 Jan 2021 11:42:56 +0000
Received: by outflank-mailman (input) for mailman id 76952;
 Thu, 28 Jan 2021 11:42:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GBf=G7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l55hP-0004WK-PL
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:42:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46ccf864-34e1-4309-b823-b16a1e0070f4;
 Thu, 28 Jan 2021 11:42:54 +0000 (UTC)
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
X-Inumbo-ID: 46ccf864-34e1-4309-b823-b16a1e0070f4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611834174;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=68rfKiqzdjedBGxp4NIvJmTStdNVoGOzQq//KpdnnAQ=;
  b=DHxGYpxZq+wlY3e+h1yW4X7Ic67v1A160eBMw8++f81kkF05Mpd0vequ
   8ukJxGiimPVATidHv08xf9H00wibBT9Itqe1p0mouHeGY3afOfzmH8+77
   DEQNpQaJoErrXjLLUxqYwlUWukeHlS7eyuS7OExYNWueRF4exeZorwBsf
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kkcmagkyHsE/MV95Vl06sn7W6GunRZ4pPuXlPiY7XMPvB9KxncoECBqz+sPWHMz7QP5pMtOUHK
 iZNnYtVDy6CIBrS99e+BDDZIfNxr7TXDjwZU+Vwi5FWG+C936I4oAXFclGpTbq0t3yaE7eqLih
 rJQOC5lg3b00LWc760Ky7IFEFaWcruYtJHixOUOhDj7VKIBP4eCOZ/2gkOjcTIhsHuIXonc8aO
 AwJdTzKZtP7XN8ZXsIb7YDVcTv9iD4O0fEepKkku7W1VA4c89SA+5BGO8P6aDsYBMUGb6CcHy5
 ID8=
X-SBRS: 5.2
X-MesageID: 37368014
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="37368014"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktbcnwXclNsknBwCIW8SOFGQf7TzuqjFvYKzY796aDWZdShrgmo8T/mbux80e1J9zQQxcTcUgl1WN2sYaiodOW7BEsxjQUn/c8Vd7Voe0RmIaRAiTboj+zv/DTnpzw+9QY8GveQSe45Pfiy/OaeVnbRCHsUnjV/cEynwlypMvhinIfZT+FcFs6Z5nY2WdTJRC717FNpbgUCufJZo9+UYjZOT7qELk3CiU+9jXq0gzIDwSjvrNuGa5aAyA1/XaEjAWrFQFRyHm0ME1e2Qlp/S29GYxdwJRWxxAILRaPEs8kZ3lijOl2qdZ/PMEvrJbgwfBR/xKPP0THgNMal7S/FJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y074VSS6ebpd/+QbaEAkvXbyJg6BpZHtx8MuzaNh43w=;
 b=A2xtcn95t6WYTjnC4ZRPfehTe/5B4KnufMRQ6LA3TXKyfM9W7rNS7BhYysITYnuH7nqLw171ulznEpu+7W8vGPMqcaXq9f3TV3T6LV2xsgzw2FKyJa3nyvyfXOVFSLZdPzFGAZZhyq2fqyVlMnclzXKwwwCLlbSAIu4O3qlhJi70btWOdS/HMdt+jHeGar+TG8Zqyi767MXRRLxNPzgfEtK+UZ2YWV2JIvRA/p2QWRzXGYnxW6u/gz8QbNjuK2zKfH1aY1NWHXQlICBstQvJf74kVOgNFMD6hxEpgq5c30hqFGvBeySBe1zU9wxelm6XcFkmLJj1UJLKpBBI8VwdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y074VSS6ebpd/+QbaEAkvXbyJg6BpZHtx8MuzaNh43w=;
 b=XDYw7SYRym2iQbfKJRAie4Y0QZJHyWUhDXzlv5MBAowJ7j9xiJXHrIYgFXTRlrbcpotL4xCnV9Ryt2AskwS4hMbXr2/WrwzKyNhvdrnc8jRLhYixUjujGgW9jcRzBKEl+v+1SvVpsuxats2rkn3cIFJbloU4nJVUxiIj3k+iAII=
Subject: Re: [PATCH v2] libs/foreignmemory: Implement on NetBSD
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-6-bouyer@netbsd.org>
 <6afef0da-ef83-15cf-1726-78ac16eb0799@citrix.com>
Message-ID: <149e1dbc-76e5-e23b-1909-508f084b718a@citrix.com>
Date: Thu, 28 Jan 2021 11:42:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <6afef0da-ef83-15cf-1726-78ac16eb0799@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c0950f-aa85-4487-8fbe-08d8c381d752
X-MS-TrafficTypeDiagnostic: BYAPR03MB4278:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4278D4A3BF70700480982AF6BABA9@BYAPR03MB4278.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNa9tSgQg7gZm7R4j/Mfl7tzCjBldGTkLQjTcgxo6QgoibS6n+8k8L8Vj7U/FBhK+LI2i2f8XX/eGck7X5C4OIIpXYlPxfAxZWLCuL0g+sQs60YPcWRkkLda10ISxoq4K6DDHoonYCVzKxnyS/F2zRs71tnU+oxYs4qH/dtqQK8qJ8PTiM0MkFa7BOkQedTGGeYlac25/8dVkvWE1JmuTKmmROjqa74IbIuk6j/EXmZeiCCOYmv2CleLgTRpwty1Kp9GcvQ/JCoz/eulSkI5u6vNyVlSUVw1+KZwW9WD5PN1EnZ0Oaze5g2l4XxsD4y7w+fv8BtXpUhLa/w1yvZqJU3tokNgm5y6ci0sOQZEqy4x4qaYvWPaO8Q3kqiVcSzBM07c8VND8tspCaPRZJMGoVZ6nHJPOV+bWsXkuZyP0g/+m31f90pZ4Wd1lmSSo2J4GnaPtoMO0PaNLRuWvlKJxvpVtY0UHJMXk7ypHO0Rsey7uNlTJLncgNZg4vxSUT1UrboT/6pqpA4j0jUIltHysGFDfXVsuPI/lDqDZQsPQt2SfVUn5KQVCN8lqgLa1aH5US9NPGwtGbx4/xK04SuwPhmBsfAtdAFBSeY38eWUxdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(2906002)(86362001)(8676002)(186003)(36756003)(4326008)(316002)(26005)(31696002)(54906003)(6666004)(8936002)(478600001)(16576012)(53546011)(956004)(6486002)(16526019)(2616005)(5660300002)(66476007)(66946007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tm4rMTRMRDdzTDdBNDhtbURLSHI2Z1JtdmtBSGVlWmJvaDZrTUt5bVpVNVVz?=
 =?utf-8?B?YlhHR1FDdndwdlNjYzJPY0h5aEVFa05IS3J1b2xjUXdDKzBVdzV3cGVaL1ZP?=
 =?utf-8?B?a1k0a2wyTTlmZXlGNGRRVUQxSkNwUEJPdFhTazhpMEJCcUlkbmFuWXpuMVBl?=
 =?utf-8?B?MDVNNFo2aVAzUkd6bitwUm8wdm5OT2xab0RicXg1VSt4T3NiQmIyTkNESFU4?=
 =?utf-8?B?Y2hwZG9OMVV6cTJiTXZ6SmRpdldPaUpVZklMMUpOK2FoYXY1WEplc3U4Y1hk?=
 =?utf-8?B?bEhNRFJrUERVcVFrMVVDTjd3WElwK3NKcFFCZzRlYXNsU2w4elBaZzhkcGdD?=
 =?utf-8?B?WllvZU9sdlEzSzVPSUZISU42VUljWGFwQ1VNM25aa3NLQUtwQlMxbUpicmRl?=
 =?utf-8?B?TGgxQURNVkR4K1VmL2ljSjE4N043Z2p0RkxKeFJEUkZ2VFVBYXBPcjBJREww?=
 =?utf-8?B?Kzg5ZEVydGhwenJwVmgzZjVHNFhBZUg3MGtPTU9mY1I4RlhFYmd1dXdZcWlK?=
 =?utf-8?B?bXFsNm1nTHZkSm9Qakt3NUJKQ0swbzNlak9EY2NlbHpTVkgrUEJSWnZPSEZE?=
 =?utf-8?B?U1lWQUx1bEF1SktNaVhVcE9PQWR1bjA2Zm5Ba3BFbXdtWkNWQ1U0WmFPSmxI?=
 =?utf-8?B?d2tSN2VjRDIxVzcwQ0NvRlN4RFlxOXIvamhZUERINHVoa2graHJGbURpU3lz?=
 =?utf-8?B?b1IyZ0xtVWUyRGVuZ3BjcC8vcXl5YWRJRzd3YkQ4MzdiMU9ObnNCY1FTT1dF?=
 =?utf-8?B?UlplMXpTUjR1WS9aTExXQUxWOUY4TVVIVHZXYnZqMzdlNktSMjVYQk9TcTdC?=
 =?utf-8?B?dGd1N0M0dEV1N2o1K1FmZGVROWlXeC9kZkhWU3VBVWE3VHhZckhoazlIZmMy?=
 =?utf-8?B?TjF2bjJzSzdScDhYcEFDMjh1VVNqVEk1MUZSNkozWVZwWDExbVhuVDdjL0U4?=
 =?utf-8?B?c1FZeS9BZzhwUUhMcTFYbmhuTkYzNm9oRE0yYXZRK3hSREFyYy83QWlaQ1RD?=
 =?utf-8?B?ZWZGVWRrdXVCODQvTExzdEdhb0h3eHhnNk9qWjlDcklwVVprWk14QVJ2Mkl0?=
 =?utf-8?B?ZGRjUzNjR0p6enRpVCtSMUxWOVB5OWtIOE9xUzliVWJOakNCRDdNU2xkcXVx?=
 =?utf-8?B?Y0hXcC84Q2s2VzIwWWZhR3NROWs3QkYxQlhTbDErblZxaElvdUVWQ1M1dUQ5?=
 =?utf-8?B?VTlPemd3VlpDN0NzbnlvdTFEaTNMa1U0RS9LRVovYXNtSzN2aE55Z0Flakhr?=
 =?utf-8?B?NCt2MW1hVy9Pd21zcjB0Q2ZYTmtBMmNvYit2TVN6bmRndFlEeXJmakcwaWlG?=
 =?utf-8?B?Y05JQlF0WEV3bG9BOU1TQ2pJWmZQN1RJU2lnSHpFR1ZyV0VxanlQaWhiTHl5?=
 =?utf-8?B?bWIwY1o2L0JqRkxoMXczMjhvZTlHczhKclpUUCtrY0ZhT2VwczZxTDhwckNY?=
 =?utf-8?B?VDAxaWR2QjRsdTFrNE0wbEdLVFpMWk5YZXE1Qm5BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c0950f-aa85-4487-8fbe-08d8c381d752
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:42:50.5843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUuJkuzZHIUZRCXOlfJ5rR8bCYktXN7ZCRByAE69WC2VoEv5ffXCiPoABhcHk6p1Jjw4ecE6jUQn0AIJEh9XRLRBou+9zMCIjs0bOo7E7S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4278
X-OriginatorOrg: citrix.com

On 28/01/2021 10:52, Andrew Cooper wrote:
> On 26/01/2021 22:47, Manuel Bouyer wrote:
>> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
>> index 54a418ebd6..a7e1d72ffc 100644
>> --- a/tools/libs/foreignmemory/netbsd.c
>> +++ b/tools/libs/foreignmemory/netbsd.c
>> @@ -97,7 +102,48 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
>>  int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
>>                                   void *addr, size_t num)
>>  {
>> -    return munmap(addr, num*XC_PAGE_SIZE);
>> +    return munmap(addr, num*PAGE_SIZE);
>> +}
>> +
>> +int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
>> +                                    domid_t domid)
>> +{
>> +    errno = EOPNOTSUPP;
>> +    return -1;
>> +}
>> +
>> +int osdep_xenforeignmemory_unmap_resource(
>> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
>> +{
>> +    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
>> +}
>> +
>> +int osdep_xenforeignmemory_map_resource(
>> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
>> +{
>> +    privcmd_mmap_resource_t mr = {
>> +        .dom = fres->domid,
>> +        .type = fres->type,
>> +        .id = fres->id,
>> +        .idx = fres->frame,
>> +        .num = fres->nr_frames,
>> +    };
>> +    int rc;
>> +
>> +    fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
>> +                      fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
>> +    if ( fres->addr == MAP_FAILED )
>> +        return -1;
>> +
>> +    mr.addr = (uintptr_t)fres->addr;
>> +
>> +    rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
>> +    if ( rc )
>> +    {
>> +        PERROR("ioctl failed");
> return -1;
>
> I was rebasing my resource_size fix over this patch.
>
> It would be easiest for me if I fix up and commit this patch, if
> everyone is happy with that.

FAOD I've committed a fixed up version of this patch as discussed.

~Andrew

