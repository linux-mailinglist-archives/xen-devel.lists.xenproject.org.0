Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE19686C64
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 18:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488355.756381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGYA-0004pA-Gd; Wed, 01 Feb 2023 17:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488355.756381; Wed, 01 Feb 2023 17:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGYA-0004mg-BJ; Wed, 01 Feb 2023 17:05:34 +0000
Received: by outflank-mailman (input) for mailman id 488355;
 Wed, 01 Feb 2023 17:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMue=55=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pNGY8-0004ma-HW
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 17:05:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1294a0d-a252-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 18:05:30 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 17:05:27 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 17:05:26 +0000
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
X-Inumbo-ID: a1294a0d-a252-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keDqcSU0e2Tbb5l1nzlpF3mVhZ7hDzNJnMiuvQxCbU9VG+eIWPZFq0xlyEUvU/sYSLbMJ9xIPalSnOZvJlGKk7AkDtC5EmBVeZeSdBCzxJo1a6N6gDt7+vmrXm7RZhYW8tkYu1DcMkvceNh2YfcOKxipBSrfKDVQC7d2f8CMO/5UvWPcqBZS+u4cwPkbVfQSsXFSivNFcZsw0yItuXzqgd0B7itVe/xhC9WkdKFhs9SVf2NKyLcLLh/0SIhYg3dEUE2wgf8jZxD2Zy4Fd7BygAptc9OKI5X0MDnwHST5WA5VBTwDCOeqlhmkUPQYTnT0+Jw9mZ60fFLG7VV9Inh7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA94RVLce3o5GlWAMhI7az39HzBXE50ceQe87PcPDdE=;
 b=d/gvSInXtqhQCTuA9jNvbuw2hIbqQUsaMCM1P0VIW93QIbEPrTZzCRDWUNvHnGGQHkW02LCOTKPJczlgICG9yOo3bbme6reWyydWEmkwU6rWVv/dIYrNmMIpBnm0IpSZJ7I3C3I6uKQDP79zNwDD232Jn8w3OC91MYliocfkY0Y/bUOmihHlFAaE6q4PY3js16oOaUG6rbSFGv9hfceYOOPdXhelgEIj8q8f2HPVRngjWDbeqzloej6N+rDiVDghbOrGBO6NbXuzvxd/vBc//WKaumYWbdno1AfZv1I+SNBX7o52ID8wv+90pE5TIirOk4XGdkVKmntqnsNHCFre/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA94RVLce3o5GlWAMhI7az39HzBXE50ceQe87PcPDdE=;
 b=NozZG80Z39oqWXcoMkj3kD8agrIqMJnIybMEokEi6a36rCfG4K7U+2yIjrZ9lRz5LfqHP0L3slFZalpeCrNQJqIrC5mmf2XMo4aQ6cRKUxwiALMqB+GIEtqivbeArGYMiQ8AETp+rgs+gNEoNJs41pdQblDU/Pp6Q8G1ZvamqIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <796a88a8-03d2-14f8-be50-10085d785eed@amd.com>
Date: Wed, 1 Feb 2023 09:05:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 11/16] common/device_tree: Add rwlock for
 dt_host
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-5-vikram.garhwal@amd.com>
 <9560a124-020c-6a5c-d4ce-c26e52413bd2@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <9560a124-020c-6a5c-d4ce-c26e52413bd2@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d57085-96f0-47e3-8371-08db047683cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4lXCrSXRoc6ZUQBB45Pqov8cDQTPobiYeiXc/N6F6C1xtqqEBU2ZeZNa1TsZUEzR3Bv1QcGZK+46039k23uhHXvzM4zTXDeSIfLH87VhbPomDHv+XwesNryl2NZ3vnILpSsPdAe+WaYj8ok9yOmOL3hs8MIiCCfxBxZmA01v6/CU5JHYQLiLFXVNVxvzpPTA9AIfnf0hj2YzfRUMWqMMA37NwI7lYpxN0BNY825jK/xuB251IWcTLYXr3u7knp7s+IrDVlZqeHUz4lqhUc1oajAlgSyO9ogfA7+Ftg3Fofp6Scm7x38fOlI7ZSGQ6K47CD6lK21IW/eZXVS8+EQEa+tvFfEUjtgely3jbIWlJgCgCkDhdpy6jdDACSDn3PiTsNI/j9AwNpDnm6CsfjtXNuCr7mSb2FhD6oZhAp/4NL9QzKQFBCP1OF4DSUFYhK/nqKa4KrDLb69fps5gYM8PiLY8BNHpM67+Eosvnlp+b+GmhcgABEl1Nh/gqJzmKxQITr/WKNV7w7HZEwOK+9eJ+MU1GY01wVumXaaWmcxNJKzP3J7uwXrj9/ZvVxBqB6zAAgwkfqhi2x3uwyZRcPE6R2XBcvS1eRCqfDmREiN1Gvt+FM978Ga1UPRoxYnB/sEkId46nW4nvc3Ir0j4Eh1tujYWfpvn51SOZNLIW8uViQNASVgj0CcvoDxokHgFXWU7x8iSMzPUwZu+JwLLrGdbC+FIYRqvZ8iLBGDqOhZYNm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199018)(44832011)(26005)(36756003)(83380400001)(2906002)(6506007)(478600001)(66476007)(186003)(6512007)(53546011)(86362001)(31696002)(6486002)(4326008)(66946007)(2616005)(8936002)(5660300002)(41300700001)(316002)(8676002)(66556008)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkFBOTdZR094V0xtaGFEWVJhUm1FZ0xJcmg0aFlDUjEvT240NU5QYTRLaVhV?=
 =?utf-8?B?WFBtQWlTYm9qNFprc2xLcHN1eWxYV2NwdVNSTStwcjNqYU4vVjRXeWVNVyti?=
 =?utf-8?B?bm5Xa1RpVXpkNzBGOVJZOG9acnVGeHE3RnBiMGZyYzIvR2g5cVNLekFobjR2?=
 =?utf-8?B?bXY3QVpiVkpoUXJlaFYyM2Nma3ZQVWtjcjhaeTgxMXBYN0ZoVTBwVWpEZnJJ?=
 =?utf-8?B?emdlRjBKeGdlcHpsakJteGlxRDU2Wi9TMXkyeFY2YVVoT0s0SmRnSGE3ZWpT?=
 =?utf-8?B?L09GSDhNZk9GQ1JJSmt5Mmo0bWNZSXJaMFlIRlNISDZPK0NWRHhUZmpvYXEv?=
 =?utf-8?B?cDBKaDBXNmcwdk9ZNXlYa2I3MlRYUDJsZ1hTcW5RRDVrVE4rTmlDUE9LTFZj?=
 =?utf-8?B?Y2NQU1RzTSt2TDdjOUlFRURhMk5TUjFzY05kelJvV090dlJuMFBsK0ZnSndl?=
 =?utf-8?B?K3lqa0ZyZHpwajVZTWxSUTdEdTM0bWNQblJrNUYyMW56Zk9ZQXpMVXF5T1E3?=
 =?utf-8?B?bWxOaXFuaVUrOXpBOXg3cGZQZHZpbE4vZzFML1d6ZnZ1SVNSdDNYY3czeEhG?=
 =?utf-8?B?S3BQdXg3RldFU2grdlVUdE83NU0ydlczWmJ1TGZud25EdmlhZGF4bWI1OEQz?=
 =?utf-8?B?Q1lLYUVzVUVpRmVyc2VHT0ZiTTJhQm1pZm12Zk1jeGZSb1RUUnJzajRsRDVM?=
 =?utf-8?B?QmJjaHJFRlJLK0VwTThhSWFRcGY1N2tYUG1pZ1JPY1YvdHBQMG91akwvOTVE?=
 =?utf-8?B?My90cGRDS0VsOVh4bmx6K1VLNFk2MzBwWFZPdEEzaDRTWFVTb2VReENUWHcr?=
 =?utf-8?B?bGpDL2Zaai95Mk5LcGtvb3RZSGh3bXhDQ2hHMjM4bFN6MVJUUDVpUkJaMUE4?=
 =?utf-8?B?dVNqVXNpUU1JMEV2cllHcFRvVTFmblh4ZVhkMGRxMHpnQnN1Y081STd3QVhx?=
 =?utf-8?B?eE94SjVFV0ZETnp1WW5vMzh2MVRrblR1dVlkRkdYOFdwRFRsOFNUQlBuS0Nq?=
 =?utf-8?B?ZldHYmhUdldldHFGeHdOOUJlV2hlNXdteThUK2sraGV6V1lDc0hMUGpjWW5T?=
 =?utf-8?B?SGdWTnZuY0JjQ2QydDdnVUxYVUJvQkI2UDlRd2hNUzlabFBFdWtPT2t1QzlT?=
 =?utf-8?B?NTIrV09WZXBKNVNIZHpaOXZDVHFpemVya0RJMGlZQVlkY09GMm1iaVI0b0g2?=
 =?utf-8?B?clBvcUlBbGNjVkg2anNScW1IcGhIVWoxbnNLSHlDOFg5MGhaaXVrWTlGcEZq?=
 =?utf-8?B?dTdmWFJNMnoyRlJtdDl2UWdUOXR3Q1NoTmtURVY1UVFDYmFTWUxQTTNWOVJv?=
 =?utf-8?B?REt1NlFpZHBrQUh2MUIzb3V1bGwvMzlYNFN5eVU0OWowT1dBMjROR21nSzhp?=
 =?utf-8?B?eXdudzFLQ2ZRRjFtQnlpYzFXNkRJb0l2Z2VRV0xjRXZrZzRRTGE0TnhhRE9k?=
 =?utf-8?B?Y0h0cVBITGYyL0ZJY0NMdG1yc1g0N1hzaHNyVzlYbTlCT3pGeXNlS1Q1MTJj?=
 =?utf-8?B?NE04Y2Mrd3pzK0p3a3ZpcmpqdWpLeWQrK1RPcmNqakVCTWpYdE9ibHQ4NENE?=
 =?utf-8?B?a2RKVzhDSmF0emFyczFpbkZFZE5rM3BGUTJrQjl2VHRodjRMMVY0T3B6ODNM?=
 =?utf-8?B?UXZibXVBYU9DbndyTzhLQmxqZFhkUkkzSEJzdHExNTRmeXVPNjNVam9EMGFw?=
 =?utf-8?B?VnQreG5IUXVEaFBUUjYxbXBTbG9JZ1Q4WStHcHl4QUIvc2g0cU5Hc21oVnY4?=
 =?utf-8?B?amE2bnM0UldLdXJhMEJUNVF3K21uYTFiUGljTUdvY0VrcnAwcTJMNktUR0o3?=
 =?utf-8?B?RTdqVlFtSVNLMGE4MER2T3M0SWVlVllKZHhqQUdCYTh0elByRDV0Sk5OQzN4?=
 =?utf-8?B?L2xyQ1JiUHVRbUt6dGdtVEExMUxDaFdoWGR5L3pwNnkxcm56dCt1b1kxVHo3?=
 =?utf-8?B?Nzg1TjZ4dXlzY1EwOVBWbzZnSDcyd3Qzai85U0pjOWRzeFNCckJyT3VuWnp1?=
 =?utf-8?B?TklrckZFTW9mZmpNY2swbVExSUpoYXVaaGxUWEpGSVE4M3RwdklQZ1Z1b2Ry?=
 =?utf-8?B?ZzZxTzJrS2RnWEYva0VzRGZpRWlGdmMwd1FjRUZ2alo1d1NrY1VwS3VITDVD?=
 =?utf-8?Q?WClVO3eawjZlACepjqEGrSiAC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d57085-96f0-47e3-8371-08db047683cc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:05:26.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruEzhbb4DtV4F5/5rTrFgJrvJK7mFEGTkDaVP97U3/GYrdbK3k+ASXGLoNkX8iS3oa1sIWKtrzHfCxPADtdZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979

Hi Julien,

On 12/7/22 8:31 AM, Julien Grall wrote:
> Hi Vikram,
>
> On 07/12/2022 06:18, Vikram Garhwal wrote:
>>   Dynamic programming ops will modify the dt_host and there might be 
>> other
>>   function which are browsing the dt_host at the same time. To avoid 
>> the race
>>   conditions, adding rwlock for browsing the dt_host.
>
> Looking at the user below, it is not entirely clear what the lock is 
> actually protecting. For instance...

Purpose of the lock was to protect the read/scanning of dt_host while we 
remove the add/nodes. This lock is also used when nodes are 
added/removed in "[XEN][RFC PATCH v4 12/16]: static int 
remove_nodes(const struct overlay_track *tracker)".


>
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h |  6 ++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index acf26a411d..51ee2a5edf 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -140,6 +140,8 @@ const struct dt_property *dt_find_property(const 
>> struct dt_device_node *np,
>>       if ( !np )
>>           return NULL;
>>   +    read_lock(&dt_host->lock);
>> +
>>       for ( pp = np->properties; pp; pp = pp->next )
>>       {
>>           if ( dt_prop_cmp(pp->name, name) == 0 )
>> @@ -150,6 +152,7 @@ const struct dt_property *dt_find_property(const 
>> struct dt_device_node *np,
>>           }
>>       }
>>   +    read_unlock(&dt_host->lock);
>>       return pp;
>>   }
>>   @@ -336,11 +339,14 @@ struct dt_device_node 
>> *dt_find_node_by_name(struct dt_device_node *from,
>>       struct dt_device_node *np;
>>       struct dt_device_node *dt;
>>   +    read_lock(&dt_host->lock);
>> +
>>       dt = from ? from->allnext : dt_host;
>>       dt_for_each_device_node(dt, np)
>>           if ( np->name && (dt_node_cmp(np->name, name) == 0) )
>>               break;
>>   +    read_unlock(&dt_host->lock);
>>       return np;
>
> ... I was expecting the read lock to also protect the value returned 
> from being freed. But this is not the case.
>
Okay. Shall I remove the lock from here and perhaps add it when 
dt_find_node_by_name() and other related functions are called?
> Cheers,
>

