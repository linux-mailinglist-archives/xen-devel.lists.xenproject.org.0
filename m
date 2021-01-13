Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C741A2F555E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 00:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66799.118801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzq1r-0000Ip-Kx; Wed, 13 Jan 2021 23:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66799.118801; Wed, 13 Jan 2021 23:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzq1r-0000IP-H7; Wed, 13 Jan 2021 23:58:19 +0000
Received: by outflank-mailman (input) for mailman id 66799;
 Wed, 13 Jan 2021 23:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzq1p-0000IK-Pj
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 23:58:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b8047de-a1af-486b-98e4-17c432fefca2;
 Wed, 13 Jan 2021 23:58:16 +0000 (UTC)
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
X-Inumbo-ID: 3b8047de-a1af-486b-98e4-17c432fefca2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610582296;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jmr1N8GGLXGJbxrSQofcOb4hO7vPAvVc9kc2NPbvvJw=;
  b=iZuayIB24MmaLzJFC0X8YZreozQEYOOnBnHVOcctPg2n8sw7ozN8q1y4
   tvciOb8JmnA2QaaAEssBjtahuirrbXXGne4C1qNGn0Ga2SYNYAA8RR809
   bBOlRHlroVtlawBkkv2wujYpFV0pPdrco4961mVPKPs2Uk2XAir+Y/Jyo
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OVsMO7QtlJGuAV/ZHW7vjm9y4w2f3i9sU3az/ekevqegxi+KFmM4yKe0aPQZcT7EXmQpD6eXB6
 DZQ/GCBbtpAUn/u+VGW7hoZiNT9aC4XvBJD6yaD/ttwVxAx9l2k1NABTDwVYgfIHFvzxLIpKoX
 qg0AfzegQu/IaLQF+tyiibWLIuzqXPW1GAMI/YKCKLmNA14HW0syk7iIgmtxsHYjNC14Wsev9q
 use/WN7e8rv5LfSe2utLVHy9ufd+OonFo+OLsOx7o5qGIZhLJeLRbDrWdmXi0kFRsjc8/V+iCL
 uiI=
X-SBRS: 5.2
X-MesageID: 35267471
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35267471"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIDFDj+fAu9POhTpz6vjjA0ipK5nb61AZjp8u4GRjfILLcaL0G6nrCQN8rsxmMQlpwtmhuPtAeg/fu8whX3lDiWHhIL8oK5vwEIVPVTBwDIyPQ68s/groyFWazZqoymAb80oLkm1eVLMByG00k9Kj23ss+bHPUVwyyVkwxplz0R+472XLRCbqWCrlj1N32huUDdJgevsN82NjLCI0rKxO5BUrh7IUtfn2FAXth89vfg+blIWJ4Bv6ZBTXStZINVAm4fo99fOj3KWpC90QWzUTfcRRlLqX+Jp/vHNI2lBtSOd6e/0L7wAMLurS31CQ7roRhx/Qffh2pQCluVNvKEuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEm9ojvtREQkn9StehDvgBy5mR2MLp+t0ipJHvgVba4=;
 b=NAG2t3kSyR2VszpJnJNAtiTOAj6aeT03sRICDO0S+bGLgOQHIf2sftQdPFLli/jE7Er0IZErvezjAMfFh4iEHyep1St3j/TkzaczOgMJ616huxPo+BCiH/zJqXlBEcdmbj45/7IJ0AFq04XKPYBEj9HC+arVvQ18kVdcnHOtvvvTduumK/6fOY+oroqfWt+CANxgc8514zyhJrWmXeo9XRn4UEOI1sKyR844+uLgzNXn2snTHtTVCBXyWQkRPm1GHjTFasF+jLtCLKQGfWEAMYhy4Jh5sns9F1OEmNdiHzTLal8KKlhfHjQi4Jhwg0YTF9jNmVtaHFiSHCUMVkdIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEm9ojvtREQkn9StehDvgBy5mR2MLp+t0ipJHvgVba4=;
 b=c0l39kJqqyVmjOs2y8WWtsrClIfkj4d0RtBCiwgONiqs8a2OA7ZHKgHM+9d55153y0aRPbPhfA9ueb8ZNUnuGfWf262rZV+HFqFArIi665BRuomfRuAzKbX02bY5cytkTOxYI6RM0lq1hOOa9jaRbudOU4llqBvQydpps+7t2qs=
Subject: Re: [PATCH 3/4] xen/domctl: Introduce fault_ttl
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-4-andrew.cooper3@citrix.com>
 <c8956065-1528-d85a-a222-187ae737178a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4d4ff9d2-7176-cb21-d594-56e993aad477@citrix.com>
Date: Wed, 13 Jan 2021 23:58:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <c8956065-1528-d85a-a222-187ae737178a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe3bae9-f4e0-4ab6-779b-08d8b81f151f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5112DDE950B4B812FCE6527FBAA90@BY5PR03MB5112.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qa3JtEzS8CXqANX2qHTVKZ/UtxxXludz7OZ0e52Tpovd9gggZPHFBeoNBSC9aeTxNXE68bzhGitLgWD2dvu0iv1AUEl9w5GA4wrEp2u+9Y5TiXXouDdqmTei+TbuDXX4mdEHJHn7t1N2E6JW3et80QWYUt3J64+9ATXC/eXEh/UPuGU14dgyslhirc/9wkabC+YKyPUlWnmAYd+MVfEfHIyApvVIF1H4s0V+EGPqPhsLtXaObsLBgUYcJAiacLBBw74IeKZUZ1F0Qu/1jW/I8ifqDUFbFQAj5S70zNr2qSY9G5nncENyvu1XF5Z8J8Z7uTd8ESqMeT2UW4rkhl7G3o6hkN+4FmpMp8TyVdR9wIKzWD9UzX53xy/JBdaL4DYO97xj1MQvI4ebhTsqD1dIiKWh+wCElGkfuFqcgXBLYV3WI5SX//aY6j2Myo9v9N20XIUQhTIcnBq2i5VUD1wCdd4UedhseCg0rQJvWfb2HY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(8936002)(31696002)(2906002)(86362001)(31686004)(54906003)(478600001)(83380400001)(316002)(16576012)(956004)(2616005)(53546011)(6916009)(5660300002)(66476007)(6666004)(66946007)(4326008)(66556008)(36756003)(8676002)(26005)(186003)(6486002)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFIwSTFXeVVBMjFoZ0xoSTVLSEUxRUVqQ3pFb1FQalVycXBWUU4zMkpBcXZI?=
 =?utf-8?B?bGJEcEw0ZVlXUTRMTzlXKzBqbjhhREVJcExCT2c3eUp0N0dDbVF0Z2RQSUZE?=
 =?utf-8?B?VEdiTGFaMDhPWlV0NHBLSVRkeUM0QkFrU29wNkliNXJmOWFYNFFMZGllM3hw?=
 =?utf-8?B?dndGQmJZZ0Q4ckVpVjJUR2ZuQ0ZrelZMMEg2dTNNdkhPd2g3bTlLcHM3MTJS?=
 =?utf-8?B?YngyS3F2UERCaVo3STN0cVYrL3FlK1g2a2pLOFlremtheGNWUlhGODdJRWx0?=
 =?utf-8?B?RzRMaklUazMxOVBRNy9QUkE4R1NqWFN6aDhlU1BOVFljeXZkT1IrQVpNY1Bm?=
 =?utf-8?B?VXg3ZnlHNXJLUFJRclJzckY4ZFZTNm9xVWd3RkZTRTM3UlYzd0EvditIZk1x?=
 =?utf-8?B?VURua0xvUWNXc0pITmJ2Vmc5MG11TG1OazVOd0VUVG1JdVI4dW1nRmQ5MzZn?=
 =?utf-8?B?MDVpdXdkdHJlbVdqQ3NJelRwS2dyRWVEYXN2ejlaK1ZsaG5iZndzYkZDeWtu?=
 =?utf-8?B?a1FkMUJQb3dUc3hZS21IQzAzQ2hpQTBuM1YrRUNYZEZTS0syTllMRFQzYUpv?=
 =?utf-8?B?N1diNWxzN3RTL1FKN1AwTGwzZ3lFMW5zNUd5bTNGM2xSNEZhY2dKQjQvSWxU?=
 =?utf-8?B?NHdXRlFGU2RuRGVSUjh0UXlPNEVGZnRUZkZmVitEeEE0cU9JQUZPaDBJeUxJ?=
 =?utf-8?B?Nk9WYkdTRTNRbm05UjhsZWYvNlQ2ejRPNWVON1M3T2lVVnFkcW5kUTVBV3ZB?=
 =?utf-8?B?MUdpZEFLZHQwMy8xRmcvdzNJckN1YkpSZzRJMDZDcERvY0FWdXMvSDNPVWJB?=
 =?utf-8?B?RHBkZjlha2I5SmF3UCt5Z3NNRXFoanI2WmpYMFhtSmFTbWdLenBvWWJiNm1k?=
 =?utf-8?B?K3BRdnNnWEFrQThvZFViWEgxNmJ3UldZWjFUM0hwN29Ya2RxTUd4OU0vOHYw?=
 =?utf-8?B?NVE4dEMzL2FvYUNsNC9PTGdLUjQ5QThXSllFcHpNbm03NzdiSTVNT2p3UFVn?=
 =?utf-8?B?SmFCRHYwR1JRd21zS3dNZEtvdERZcGFLMjMyN0ZHOGpVWjUzTkY4bmNIcERz?=
 =?utf-8?B?SHdwS0JlNWV4NlRxVlVWaU9oMzdUSkkwM0wvRkdXQWxPTHB3YXdsM0txblBO?=
 =?utf-8?B?enAyeFdzQ1lPUnoreFFteTFJUjNydEJwNy82eVVqb2F6NWtXNWwwM2dSMVh3?=
 =?utf-8?B?QUJYRUhMVTVpZEFvbWlJK2VJSmJqVWxhTWE0VHNTbXlReWg3UDdoRnNjNCtM?=
 =?utf-8?B?VUNnR0FMVG80M21TUzRrSzlldUorMnRpZXg3eWt6dWJZU1d6b1cxR1NzSHlJ?=
 =?utf-8?Q?biGonisv7aUI1i8KXilouCcx0GdguLc1gk?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 23:58:11.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe3bae9-f4e0-4ab6-779b-08d8b81f151f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUvU1NPNkJ3m+8eg0q/1oDdAsHex4ZcXIAt2oTjb838Oo5aqJcyeavmwCWVc53J1K5NQ2QUk9UeCrkhn8Yf5GT/Z3f1vUT9SYtHKaOfEhLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-OriginatorOrg: citrix.com

On 05/01/2021 16:39, Jan Beulich wrote:
> On 23.12.2020 17:34, Andrew Cooper wrote:
>> To inject a simulated resource failure, for testing purposes.
>>
>> Given a specific set of hypercall parameters, the failure is in a repeatable
>> position, for the currently booted Xen.  The exact position of failures is
>> highly dependent on the build of Xen, and hardware support.
> What about other kinds of resources, or ones only indirectly
> related to memory allocations (e.g. where we don't mean to
> associate them with the domain)?

I intend this for "any fail-able operation", not just plain memory
allocation.

It's merely that memory allocation is the simple first resource to go
after.  And after all, these 4 patches alone have already identified a
real bug in ARM's dom0less logic.

Perhaps what we actually want is a general "bool simulate_failure(d)"
which dalloc() and others can use.

>>  * I'm thinking of dropping handle from xen_domctl_createdomain because it's a
>>    waste of valuable space.
> Looks entirely unrelated, but yes - as long as Xen itself has no
> consumer of the field. The more that there already is
> XEN_DOMCTL_setdomainhandle.

It's purely for pretty printing in 'q' and handing back to userspace for
xentop, et al.  Nothing in Xen acts meaningfully upon the value.

>> --- a/xen/common/dmalloc.c
>> +++ b/xen/common/dmalloc.c
>> @@ -10,7 +10,13 @@ void dfree(struct domain *d, void *ptr)
>>  
>>  void *_dzalloc(struct domain *d, size_t size, size_t align)
>>  {
>> -    void *ptr = _xmalloc(size, align);
>> +    void *ptr;
>> +
>> +    if ( atomic_read(&d->fault_ttl) &&
>> +         atomic_dec_and_test(&d->fault_ttl) )
>> +        return NULL;
> Perhaps we want to introduce Linux'es atomic_add_unless()?

Possibly.  I definitely got caught out by the semantics of
atomic_dec_and_test() seeing as it has an implicit "!= 0".

~Andrew

