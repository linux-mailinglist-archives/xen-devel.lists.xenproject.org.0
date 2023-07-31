Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF376934C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572887.896981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQLv-0003WD-PH; Mon, 31 Jul 2023 10:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572887.896981; Mon, 31 Jul 2023 10:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQLv-0003UB-KO; Mon, 31 Jul 2023 10:42:15 +0000
Received: by outflank-mailman (input) for mailman id 572887;
 Mon, 31 Jul 2023 10:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQLt-0003U5-SH
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:42:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e799d2e9-2f8e-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 12:42:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 10:42:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:42:07 +0000
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
X-Inumbo-ID: e799d2e9-2f8e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIq9WTz9eY5Sz54fEDUs2ww9xjijbyzFeJprGO7+ctZIAFcKNO/JX/17cFuHh+LsDAAf3dSwDjQsF3DXv8DAPSYQz5K77pL0+sAdjITjofiXFzqQ7vYKrJlVEyestcbqER6B9fKPzHtdUPUNIJ4S6vUJZjoxsNbk0Pkz1aNN5n4GjeV3NPseaWs9qtqvhJP5JJStt2Cfd/bjJcA3qtwmLxwgJDodjU6gAu065V6U+PLpChfzQLdfZPnMNRwmYyZ2fBauZWjNxIWkYVYh6bXicSfMsX+ktxU5TSFYdahnTMiBTz4nJ6vfcTjg9V8XWjgNkthQ05hxnCwmImNTpPpCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxcWbuG6pYAfIrM2OIbIli2RThg4K/IU7PnaTQ/lKKM=;
 b=fVxZG9gOyjJEUJdBwR2xCyTpfSB8t77zDDLXlhWolg0eKMPkMhJtUZvNZPFjHy3BN1vumLb78aaPZyg/BB9kTVj31GFBBUAAhts15wYy538T+FQmHvqPaRhFMh26JUeJpuB8HkRoc4PtfpM14QivmdTIXefoZrf9v10bUT2Rp04uLloFsIYh5uyZcRISQqgYI6Zt1V5Az2gbYKxF3UynaGfpcOaigYM9Ti9fQwVzVAlYGSKp/seIDzJGfo6nFUYFlvq3QOVi+56uq6TFZilw8RzCS9L0iq24KkiCXPG0hZI+1LXAKKDu+PZS6aeiIdJ3WvCuVsXXSD/XlXAanR9wyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxcWbuG6pYAfIrM2OIbIli2RThg4K/IU7PnaTQ/lKKM=;
 b=OQ8P6eKXwaKIx3tCV0fhYBhvJ/9mJVUUjiTwbrUauERCLPqgMAeNlJ9d7IYffzl9MXtz1zGPscDBQyAsS7DpfLbgzT+btQCA/DGCJnlUdRXD+65kebIm0sitrmy+fOTTiGKN2uA5YskpCUfLZOBYLEpZZEHZf+ZUCtu7/ovrh3FOSaxdY9omujZz4S/tInk6uhq0IkWXbcFSslnOdl1GySkDrsAL7wmmQifJSszyo4MQOjzpPe972YQWWdslgeq7S2O/++PMRVei+AfxIJe7/0xQVySWWKkbNHvMg7tiHWAOhscidI441mglloRTpN98AUjJ1vLiUyaWNXVU0BPoGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abbc82b3-dbc2-7463-43e0-414b2b294e78@suse.com>
Date: Mon, 31 Jul 2023 12:42:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] IOMMU: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <ba140642a267791c619dbbe2ba21f880c7e2b53e.1690551759.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307281626290.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307281626290.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: e213a0f5-e8e0-4ee5-bf71-08db91b2c957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WGtI+vBrL/n/mlMCNKgnddboQx7T9ZJay46BIgGWpM5zPnP9tTQmOUDrBSLV2M4rP1CtTiWgFZ3kBWniwb+WGTMNrAVlQpclOTu68cLO9S2ZKdkVYbf/Z7ORrEgGzi2cdBnrqJYIiO7N09fy8B8+KOfBQjQ2XT8C+O6zSrzg7bQIx/+DGKPxQxVjsTXJxISEugYu12AO7W3YRBVVByvY1X2rcV3B5+pHDzamSfnr8B7kZG327uPtdtYTDwWyofl0QU/+f4CJa+lAKRHVJBl7JswkeoWqpAY4mC8wl/0tLz5cPANVfWQiyKZotgctSEje+2EuqbIw6KopdxTXvw0DWUP8yNH/kcWk4NAUsN4E6pOcKcBwix6Q/ca9AsYQKmBJiOPgMHt0ZzRjQ6QInurRk8/rnZec6piVoLBQxypgQSMffcYaSvYmlog6CFiricXZ1NnYYH7TBaloX4Tbwxa8utRWz+nXDJMC3UChnrBdnoTMlW2hGcXk6qt+KDQtFCIBHFtqdplmr9O26DbAwoAFfRUkSNKgRUPjhX2JpMYJb3ASc+I3Rd099NIlXfgXuUtpJt6QIJ5GhvCc0LeQ3hP1OrMbkSPsY3Iwqa5kv1xWMhnSdYI2zg1hlqd14QpBU9V644A9pg9CYvQ+Nga2MWilYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(5660300002)(6916009)(66476007)(66556008)(66946007)(2906002)(4326008)(316002)(31686004)(54906003)(41300700001)(2616005)(6486002)(8936002)(6506007)(8676002)(26005)(53546011)(186003)(478600001)(38100700002)(36756003)(6512007)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDQ3cEJWcWFRMTJPN251eXVqTHBNU0t1OHorekl5QTQ2b2puTmhZM2M2cFdo?=
 =?utf-8?B?b2c4cnBuZnF1d280YlBKSXpibitPRU1hNGVrWHVuWGNHbllrN0pmUnQxTzNk?=
 =?utf-8?B?N1laQjhvUVViR1JhM3p1THhlWmovVG84aWFud1E5YnFNZTFTaWRBeDFYVm9M?=
 =?utf-8?B?dHNZdytaNzVTazZOSzk4YlR5c2ozR21yYXlNWkpmZTA3d0l0L2QvR2cxWFJX?=
 =?utf-8?B?enZiUkhVYW1yMkZOMVVxL1h4aVNybnE5OGdKWTdjU1N3NVh4cUkvb0RMQU1l?=
 =?utf-8?B?U3FJWkh6OU5xcXVqNVRydmF0S0tUK1YvLzZqaVMzNnpla3ZMQWMxV3ZybnNG?=
 =?utf-8?B?MzlMNVRLTUZuaFk4TGtPNDk5dElncUFZa08rNXZSbWdiTDNueXZWeWxnVk9w?=
 =?utf-8?B?aXFZeUdheTVPN2lCMmZNZXBkVkZZZXhCZW9Cbk16ZEIxS0g0QnZzNks4bS9p?=
 =?utf-8?B?VGNsaWN3bnB4MXZxNHMvS1JucmU2emdKNDRMOUswb2NjaDdTQ0xhSEFRWDF0?=
 =?utf-8?B?VVNkU2c0TTlSKzRRMlVQaHNnWmRia1lQT3BQYnFtT284ckxnUzRITy9seEZP?=
 =?utf-8?B?Y1F4ODB0dXRmUlBNN0VwdkpGMkN1UXZhMUJXcDRwMG8xQmZnZTBFdHF5cjRU?=
 =?utf-8?B?Y0w4eGMweWtZam9jSHBIb2lFYU9ZTDQ1ZXJKeWpuRjVyQkpYNkNUc2JEdVBE?=
 =?utf-8?B?WmxXakN4S3NmT05JeHZPSXJRd29oUS95Y0xTM24vYW5zZWJob1JaencwQ3Mz?=
 =?utf-8?B?YjM5WUc3akxCME5mQXJ6U0ZpUk5VckdiQ0VpQSs3eEh0VTlaRkRpbEswWTBZ?=
 =?utf-8?B?cmpJdHVXQkIwZnNEZUFUSUVMT3JuKzUvMUc3ZVg0QnFWZmg0RHhwRCtCVnp6?=
 =?utf-8?B?Y0JrMTR3bkx6Zkp0V095bWFxVElsT3psbHdwR202N2gwdjZFNEN1UVl1eHRL?=
 =?utf-8?B?NWxzemNNNGVST0dFMGE0THk4VmxWTFBFVEZDNk8rVE9tZTJvZCswSXBkTERw?=
 =?utf-8?B?b1BkaFY0MnA4NHB2cVVKUzR3b1lFZTZMZnAwYnkyRE02bllQSDhRTVJyTzRL?=
 =?utf-8?B?VFpXWEhrRkszU1dRWGtBSnYwYk1JWS9IdTY2bzFTakt3VTgyUDlXME9YcGV3?=
 =?utf-8?B?Q1JNVFVONWUyTTBwK0VsMVNYM1htZFVLbGRUOER3eHN5NHZWRmpOU2dFTVNk?=
 =?utf-8?B?SWxCMWJUYmN5Qi9wZHdxZU0vYWdkc3BxQjBhcFBUNVNCODIwbnFpd1pkUUds?=
 =?utf-8?B?c2ZIdVFVTHFnWllKbnoxZkxHQVRGSUxGb0FtbFhnZ0MxSTdMMUlmOUkzc1NJ?=
 =?utf-8?B?S1dzSHdONVNoMHY0ZmFwR2NtOXU0VmlWbXQra2dOMkNyL2sxRFkrWEZEU012?=
 =?utf-8?B?eGo2ZnYwSGdTaVBkVkhpRUUwcDdXZHQwczE2NzNSUFdqZnd0RVYrcXY1T2VF?=
 =?utf-8?B?ZXlXclA5aVpCRnRFVHNoaTBtZWNvY0tsY1cxZ01iOVIxRE91MmJVcmJQMnVx?=
 =?utf-8?B?Y1hEUXJ5WWlrQW0yNXJtN2FEYmZjRy9HenJXWVNhZXQvcU1TOVRaZHEzYngz?=
 =?utf-8?B?bzE4Rzcrd3AxbGIxN2RNelVyb3QzSjdhRWRQdWZPRVhZN0FMYzc5VktQOU9E?=
 =?utf-8?B?cEhGWU5PK2JCTHBCUjN1QU9SWE00c3FUTFFaMEpidE9JMlhZbXkwRHhDVHI0?=
 =?utf-8?B?M2IzVC8zRGx3VmJZN0psdlAwTG0zNGxqQ0pWSzdNMnl4bGFHMFBXc043c3Bv?=
 =?utf-8?B?QlIwdkJoVE9CM1pTZ1JOWXBRcXErSENOckN3U2x3VlFTL0NGOWQxMG9aS2F3?=
 =?utf-8?B?czZlWnBoSWZ2ekEwR0NmVm9VQTBYQXhFZUdnS0lURTZ4WEdCcm1tYmhhMjl4?=
 =?utf-8?B?NXkyQ3dqZWlUMFVuemFDMVY3VHBqSlpuUG5naHVEcWUyMzNlOUtCLzF6VFpj?=
 =?utf-8?B?blFSSWkzUU41ZVBLczgxaFU1RGZXWGVXdGE3NFMwUm05NDd4S3VMMGNlNHpW?=
 =?utf-8?B?WnZzY0t5Q0locFM0c25vOEhCVFByR2dRRG4yU2V1QjVhanBSRXg4d01RR2FW?=
 =?utf-8?B?NVhlMkkwa1Q5K0trbUtwWG1ZNm05VmFXSGhncGdndGk3RkZzMlI0Sm5oUVJZ?=
 =?utf-8?Q?lviGabdI2tevnwGX2E5CmZ/N/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e213a0f5-e8e0-4ee5-bf71-08db91b2c957
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:42:07.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afSNO103Cva91ATkbbLPHMKvf4fECDK/Fbmka130MsDnvYgdX6udheOi2jJJGp7gQQf7+SXvhNt+jdng7WW9qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9778

On 29.07.2023 01:29, Stefano Stabellini wrote:
> On Fri, 28 Jul 2023, Federico Serafini wrote:
>> Give a name to unnamed parameters to address violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between parameter names and types used in function
>> declarations and the ones used in the corresponding function
>> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
>> ("All declarations of an object or function shall use the same names
>> and type qualifiers").
>>
>> No functional changes.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -25,10 +25,10 @@
>>  unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
>>  integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
>>  
>> -bool_t __initdata iommu_enable = 1;
>> -bool_t __read_mostly iommu_enabled;
>> -bool_t __read_mostly force_iommu;
>> -bool_t __read_mostly iommu_verbose;
>> +bool __initdata iommu_enable = 1;
>> +bool __read_mostly iommu_enabled;
>> +bool __read_mostly force_iommu;
>> +bool __read_mostly iommu_verbose;
>>  static bool_t __read_mostly iommu_crash_disable;
>>  
>>  #define IOMMU_quarantine_none         0 /* aka false */
>> @@ -57,7 +57,7 @@ int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
>>  bool __read_mostly iommu_hap_pt_share = true;
>>  #endif
>>  
>> -bool_t __read_mostly iommu_debug;
>> +bool __read_mostly iommu_debug;

Lots of data objects are fiddled with here, so I guess the description
would better not talk of only functions. I guess adjusting for that
could be done while committing ...

Jan

