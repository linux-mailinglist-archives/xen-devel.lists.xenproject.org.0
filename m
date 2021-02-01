Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B27F30A65D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79765.145252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XFW-00020Z-76; Mon, 01 Feb 2021 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79765.145252; Mon, 01 Feb 2021 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XFW-0001ye-3N; Mon, 01 Feb 2021 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 79765;
 Mon, 01 Feb 2021 11:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6XFU-0001iw-HC
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:20:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 806c5104-4c36-40c4-a2a1-244b893126cc;
 Mon, 01 Feb 2021 11:20:03 +0000 (UTC)
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
X-Inumbo-ID: 806c5104-4c36-40c4-a2a1-244b893126cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612178402;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OfCSUijL/g03NqFj5e7sExKBRjyMfgp8WWFBBFug8+4=;
  b=CTknYlls4eAymCVm5XBl/mC23Cl1shal/HAV2OqlbEmlpQHA/1vz9etP
   3IcYwbtvIqo8DN0ObawxNMkghtiIvQNlsSzBUBYmWBG8CgXqe+kKv6TTW
   3gYLAYuT0qtmZbugIdaF3csxiRNeNq9hpihL3s54Yt3VzKoR8yrxpJuKp
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZdEBIlaBH/IEloNEBEteueFtJkdo72H2ux3hy4IGsGLLSGXWRqrQNiOuXzmoAq+zfWII31gFnH
 ofTI758DA3gw5H7EhUwsXCJb/Ch4xQRqyrMhEMv18L8OZru40Z3qoLQz8HqzwpExRWUlVtB5n7
 li1RfuyFDt1++0g5OtTWhpGfaDZ91tla2YIHA4ZDUVReGkdOHjsg8iyViURP8AQ7vxblUqjsDz
 QuXVEeOE5Y6OZTn0MiugHNFdj9Nm7mu7zXonZ0DQBs9hPKV/5Oq2GjGcBU1p7AQYGpJ3db0VNB
 598=
X-SBRS: 5.2
X-MesageID: 36645156
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36645156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7bM7vhPuVB1HkDaSMuaH54xy8B1EuDZW7BLuYeBEg4oeYhAU4cOSt/wR+rQ/iMokyW8lW0fSHs660EkbhKj3k04NzFPxsbRrwmP66DphDVZXwbqBFpqJz8YnMraKHPRjaa9d67fyGKz7khPJwagU56thlQRn32N5Y0kzAS2tTZV/1lgSQwKexawdv/PkFFR5W+3hSUJYGLCYqf5RUBP2Ox6zXZmz4wmN5gEn9mieHc9jKqAiheBNnfjsUpvMRt9N9nVausMSKMm1bUCc2ULbJ1lvrKJ43AyknJR0L8qrZw5MoQpA7ScolEnB6dPOk8CuvKkZ/zZNGaURP2jMyLauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK4h1NonlODp/K5/vAkWB4w8rS9acAkKX6uErWPY+To=;
 b=WmR1Yo9dcIg9y/BUUXULmCwVqBnfa1DdmVE7Ibmdv7rUcsOdM9TsWZJJ/wM4mBZBL2Er1kKVejVgqbnHOthWxsFVH1RLxu6TjyWWm6P6tCVp0bIo9JQt2Bg3ZhYjd8nQRh0f+f5rao4jdCbbF8bCByPYFs4qjq5E8aPc+7dyzdwuzGCMUpdoJUCLbIKduwSHq+lTwRBLSwBzNPexx4pw8Oyd4Fu4EuCQTceUBB57fz41Rq17YdVS4UgwL07Zf1oVZuNzcyp8Fmq/1UhcGv7hgrAwxzJHqP6RLrkNbrqI2KSQLRFwHu8Ye88bauw6V506EStBLonKMRCnJoFMCdo/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK4h1NonlODp/K5/vAkWB4w8rS9acAkKX6uErWPY+To=;
 b=pfHGfefksJoQecaHt8TxnhNdWoJyV9QxQlhMn50mkxRjoVuEArJIoYFO9CbgoiVDaXilqM/xHV7Mo4wLAUu+IG4SxhaDonLr57nPSpEDT6xKXp1soaw8hsD6V0tJK5JQg0a2TV/Ho3ALN2UuhBCkq2hkXlLA28LgBJz6Yus5pqI=
Subject: Re: [PATCH v8 08/16] xen/domain: Add vmtrace_size domain creation
 parameter
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, "Jan
 Beulich" <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-9-andrew.cooper3@citrix.com>
 <YBfc+BaXLm5dSvkG@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a549b8c5-e5de-2b03-f8d5-ce5ae5de6067@citrix.com>
Date: Mon, 1 Feb 2021 11:19:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBfc+BaXLm5dSvkG@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0477.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::33) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43b7400-ff44-4938-dcad-08d8c6a34bc5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB49040F3E1B03C597D872EEFBBAB69@BYAPR03MB4904.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PQ9RjKJDop6UHzvtPQKJBCOnQr1eerNtdqTlI/FU430jDxLUcjceC2V9jhfuS1wcCscdXZ0mm6hN0yRIWYbb64H1+OZ2fLKfBcvOzGuyK2lcQAwo2VXo9MUaq+iIUPr1zu0QcNb5joGYl36EvlqvqtDZ1V+MgbE+BNdjvYVUW32Uquw74QW00x4xytA8aR3YFzicfoyf8bxwrbsD9/o7RTin5rMKsX6u7mRexMWtF3TVjKrqjmjRtM7rrl9WBahRECRDN/Nov1YZGxJUP9ACqxkWgdzKzXlU2+NyI6SCzw2icdHwznUo0LxhsASRYrDAWPRqjUPBVJQFPDxYlnsaADE2tWPORW+ZqeVPd+n+b7+g3zP7rLhlbRhVpkgqyvSN23no3NVlgY9PTW+XjKw3bhsIjiUvmaxsHHh555Wy+vTstjT4LWliEZUBxQDypi1HhHiySru3MtlJ3x7jl1bgcpfhn6MifedXV7JiZJS9WAqN7cqhOJZZvRPPuc332sHsa05BgJ4ZcXk9Bp8RpS1//Ias2RHuByk/vXwLUndxyzjVgL+wCEzNnYHaGSV5c0+yv4jkRjsiSLh3UO74yAGNLi+0NOUcoR5cnQPI8YIl7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(6486002)(956004)(6666004)(8936002)(2906002)(478600001)(8676002)(2616005)(6862004)(66946007)(66476007)(66556008)(26005)(186003)(16526019)(53546011)(16576012)(316002)(37006003)(5660300002)(4326008)(54906003)(31696002)(31686004)(86362001)(66574015)(83380400001)(36756003)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHJaUmhVbnBlT1FOTU11T3k2MDZ4VThiZkIvQ3EvOW9DM3I4ZGhHQ1BYY1I5?=
 =?utf-8?B?UFoxMVNkb3BHVnNNYzJGb2ZkTEVjdjVSQkFMazMzeDdNT2NxSE9hQzdDaUQ3?=
 =?utf-8?B?SC9SMjg5NGlpQVlmZThzL3Q1ODdpYm9QUWs1WU1oVzB4V25wVXNENjdMaTZQ?=
 =?utf-8?B?M2RWN2hKT245anpqYnZHTTdqWkRJOC9zbHRZdEZMQjYxcERHVjRHZjQ4Z29T?=
 =?utf-8?B?eG9xYXZIeisyRFUvd3lxS1VoUHo1SytYMVNvcmNNWSswVHV0WnFvcVhYbTg4?=
 =?utf-8?B?SHF2bXNSYlZWTklGYjJYWmE3ZG9KaUhJY0JZSzB5QzVtdHFLUUltSUVRNmNK?=
 =?utf-8?B?eUl6cFFyZmRCdmczaEtrcERxSGloVGxGWnltd0tud0dlbURJTlBoWjBRRldE?=
 =?utf-8?B?VnhEcXJUeFJPM3RjeXhlOWpYRnNleXpZMzYvVndCR2ErK1pnemNRSFJUSklV?=
 =?utf-8?B?cFpOVWZnOEVHbnJ0bGRLbGJ5TEFOVVRRSFJURlUwRUdGWjZyZmZXZzZVaHk5?=
 =?utf-8?B?djIwMDYzZ2FaTkZnRy9QNklSdVlBa1ZrVzNCd2Q4ZEtBeTVUUWJjY05hSGcx?=
 =?utf-8?B?RWdyT1dXc01PV0xhbXZla2lLRU9QSHd0aGRWcEJUWHcva1RuZW9Xb3VEekJH?=
 =?utf-8?B?ZS9uL1NWMUJXQU5KNlIwMGNQQ2dVVHJMakZweVJuYXllRzJqUzdONmdsNklj?=
 =?utf-8?B?Zk5ta0xRSmVtVWtwUzVjdVpFaXMrK3JEY3RZV2wyTmZmcjFFaS93U201NHZo?=
 =?utf-8?B?MzNXWUNOWHB0WmgrOURxRXdwM01ONHdGYXM3SVhiaDEvYmJHK2RHYTIwZmsx?=
 =?utf-8?B?ZEFlSGVQdksxRlF4OURPb0g1VEdqY04zbFUxL08wKy9GRVlVdVl1QlZ1QjJj?=
 =?utf-8?B?ejdMaGRRcngxWVNvTk1FUW5kSVlrQTFyWWgxQ2pnNkk2Q29NSFVqQ0JWdllz?=
 =?utf-8?B?ZUdmTUhOcUhOMWFyMm9FYnd3eXdua2o4NUdYRFZua2diYnNOMlNwZnJvbmxY?=
 =?utf-8?B?QVB0dEh2c0FBUmZVVlJyOVMzcGUxblJxai90R1FNSlprUWtsRTR3NUFLOUhD?=
 =?utf-8?B?a3dnUEVNM0ZQUVMvWW1XSHRId1ZidDc3NXRTZ0RicmNWZ1VIVTEvb0IxbjFD?=
 =?utf-8?B?SWtPTGxrTllFeWVLdjRLUnpxN05lZk9lWk1IYU5yaXp4c1BHRmJOVHM4TXBR?=
 =?utf-8?B?bmVuOEJaMlRvMHA2S0VnaFk1SDJvMXRrY2U2UGVkRDRlZHhpenRTcEk0L1Ew?=
 =?utf-8?B?QXdBb1QyemF0QVM3aXNaZnJ5VzloMUdvdkU2YXhXZmRZMFVjZWRnV01jUlln?=
 =?utf-8?B?dXM2aHBscTJpUEU2ZkhVYzV2SE9sNmN3eEMvNTVPVlRpUjU3UW9peEkrNG1F?=
 =?utf-8?B?UitpYm5YQVhUZWV3VjhUc21jTnNNVWFFNERhbXdENGdkMW1VZlNFcGltK0s0?=
 =?utf-8?Q?HYV+tIDL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a43b7400-ff44-4938-dcad-08d8c6a34bc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 11:19:52.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+UPzsHZx/uM29g5QLa33CrwypPbwkKRicAWkPXA3rGE3DGHCzzG5lvY47a8T8TmkbrwX9Q+4D4pXEvzBepukVz3hNT6toLiPNndx9B2KHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4904
X-OriginatorOrg: citrix.com

On 01/02/2021 10:51, Roger Pau Monné wrote:
> On Sat, Jan 30, 2021 at 02:58:44AM +0000, Andrew Cooper wrote:
>> From: Michał Leszczyński <michal.leszczynski@cert.pl>
>>
>> To use vmtrace, buffers of a suitable size need allocating, and different
>> tasks will want different sizes.
>>
>> Add a domain creation parameter, and audit it appropriately in the
>> {arch_,}sanitise_domain_config() functions.
>>
>> For now, the x86 specific auditing is tuned to Processor Trace running in
>> Single Output mode, which requires a single contiguous range of memory.
>>
>> The size is given an arbitrary limit of 64M which is expected to be enough for
>> anticipated usecases, but not large enough to get into long-running-hypercall
>> problems.
>>
>> Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index d1e94d88cf..491b32812e 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -132,6 +132,71 @@ static void vcpu_info_reset(struct vcpu *v)
>>      v->vcpu_info_mfn = INVALID_MFN;
>>  }
>>  
>> +static void vmtrace_free_buffer(struct vcpu *v)
>> +{
>> +    const struct domain *d = v->domain;
>> +    struct page_info *pg = v->vmtrace.pg;
>> +    unsigned int i;
>> +
>> +    if ( !pg )
>> +        return;
>> +
>> +    v->vmtrace.pg = NULL;
>> +
>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>> +    {
>> +        put_page_alloc_ref(&pg[i]);
>> +        put_page_and_type(&pg[i]);
>> +    }
>> +}
>> +
>> +static int vmtrace_alloc_buffer(struct vcpu *v)
> You might as well make this return true/false, as the error code is
> ignored by the caller (at least in this patch).

At some point vcpu_create() needs to be fixed not to lose the error
code.  That is the real bug here.

~Andrew

