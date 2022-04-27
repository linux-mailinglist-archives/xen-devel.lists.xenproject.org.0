Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E93511893
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315110.533485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiAl-0005LF-Ni; Wed, 27 Apr 2022 13:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315110.533485; Wed, 27 Apr 2022 13:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiAl-0005JQ-KX; Wed, 27 Apr 2022 13:57:39 +0000
Received: by outflank-mailman (input) for mailman id 315110;
 Wed, 27 Apr 2022 13:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njiAk-0005JK-Bk
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:57:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fca5118e-c631-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:57:33 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-dhnpWpgRN5Ki8L9x4AT5vw-1; Wed, 27 Apr 2022 15:57:35 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6439.eurprd04.prod.outlook.com (2603:10a6:20b:d8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 13:57:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 13:57:33 +0000
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
X-Inumbo-ID: fca5118e-c631-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651067856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZX6Q2qIw8ZWRtMMu00Avbk2WY4ydH0MH70DMP2my8sw=;
	b=C6/MzjzUARqWTnlMZCwPu8O8G67mL7ovD8PzLbCcCsl2tdqBkEKjMV4yGoxJGO9x8QFw/Q
	LqEffFDJqQayUK5dkve5Iu5vC6hxdF0980kW5WsIRth9kjObvyo82SHly93mUFUl8Zwmju
	rbGVjZCfR5vBhHnmtkmOUmTAHgSYiD4=
X-MC-Unique: dhnpWpgRN5Ki8L9x4AT5vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imZm/26SavVn/suYPXa15InEQQCaJ6QLY30Ps36dkNZCzqSlPg9GMCvy/2F5s5JUG+6SkAcS6+MlsbS8AmfLXvXsLR1caqBwWOKx0wQclAgoNFaUCri99tGYjN1FDWXdquyXCsHflsXvCo4O4nO9KVOjXcZl3gY1UWPouTyDTLB5GM7wls5IWvoZtPhk9JFMbdx2ysu3WwvaC+WaugF1Lv8uPEVTWFHmFeUSh2esoyGUI1xMrglz+nwaRSbcMEGtc/Q029HsEVT0rcJwtLUN3zAPkF2Oqiy3C23ABhw/UfwuW262HUCznVmgIkRx9kESPTZMdYv/D2UctsNR3LiFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX6Q2qIw8ZWRtMMu00Avbk2WY4ydH0MH70DMP2my8sw=;
 b=QDB11znjGPa/P/Vo2zUtKP/NcgXEgcs//gMtl9yzfIJLeJpRzuU03DjDTqoaUJlwL0Tq1/sRsVw+rLq7e/jqdnWrdZfo+L60V7HfKJkEyG/UkRgH69H58Hwd7Ymth7LdEWJ7wT6i6IgPTKEMrVItjHA57CwVSHP6+qUnC/L/P/IMBh64M44EC1OPWImntTxSLVorW2RnWTJck0g8NK/vtF0yreI0wg9njCQukW64yRvz9Bzi5ECQGDd3y2oHWcoKvVd71nN62B5n1CftJi8wyYbVMc9bI6FtB/Ka7p1P5/COtll/bd4QmkKVJMFmuOpUS2qXr/rotPIv7IJe0PrG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f39020e9-f25f-bb82-ee49-fbf595b4d3c8@suse.com>
Date: Wed, 27 Apr 2022 15:57:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
 <00d978cb-be83-79de-ef02-5b6ad1042f52@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00d978cb-be83-79de-ef02-5b6ad1042f52@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3925af8-3da8-4dc8-b42c-08da2855e0ad
X-MS-TrafficTypeDiagnostic: AM6PR04MB6439:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6439C252C849B2E2E7504F01B3FA9@AM6PR04MB6439.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UuYgwz8QiNBM4r1WbK1zRvMYilHe7bFzKRekx+6t0OVVIb/FZzHJ9mD3rP1UUQfMKMPc6a0A2c4WuIexDexPKaAzhnl5FojnboEMsvTGCzCLOBlx4oVWBpXc55bpwGGvib4Lz0nCLpViFZta0rb47xW5Vnd6bNTQpAKDH3Y0MFjedmjwTudk7yEvMCFho4NBz8DHXw0BTS4fLilvMci9mRCAsZPzozKTib/dvtGJjPCuxVMDkJfNSkzruWk4ly1R1B0Uu6h9zYJfy7+K5QnxCbV2AJDnZOsiLuVeP/bOkSU449yUqdAKtJGA71mh3Q0/6fouY+GFfp9brcutdZ7pBEGRrYhy38XxamQAe+E80crUzHa9ZDzyX10iOqGwAv1YTWcgBp46In/I5xK9TRwnbZBGs8cAAhfW+7HAdWOEPFeNNRa/3XUWI7d8wOamTNcX2W5WNWZsk93cyA31HbBPNd+TEf/V/lsS5tgu2aGALhzh4TBSM7by3nF9RyeMCBEgNUkfHej0YWB/TCgRcmY8kKnPWJJSHDTwnt/op51/nnwh2oK9VClJvWKCmcIsO/BMhqljawJdxfY2MN4J2jujtl98a0vZn56zj34qRS6IXoaPd+QUwZwknIpxT/WQbyxW94Av305BMSvjKQITotcj2nwgj39WAwJisRsW9cRIPFt8ciP/sxjbcIBT1pS4tVY8VtitPiCyYMuOMhzgszS8fEN/DYsPJAcM9jHsymAs5wPjuI6xMn9msZO6ktbFmTuL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(66476007)(66556008)(66946007)(53546011)(6512007)(26005)(8936002)(31686004)(6506007)(316002)(54906003)(4326008)(5660300002)(6486002)(31696002)(38100700002)(508600001)(86362001)(83380400001)(2616005)(8676002)(186003)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHlFT09DOW9nMzlmYnd2cWdtUS9QbkFidUlPdXBFUkZibzhCM0VXUHhsNkc3?=
 =?utf-8?B?eXpCYzh1MnE0VjR2bVJmTGo5a1llNDRVUmlvT1NMcDkwZW1aS3ZURlUzMUdM?=
 =?utf-8?B?ZVhhSkczcXRRbmtnWUV5dFVvTG92ekNXcktmMHM4NDdIMVNLTTA4TGlnSWxv?=
 =?utf-8?B?UTFPL3Vub2FBd0pHZ1ZVMWQ2RVdLZnpRdFZ4UGZFL0p4b0hScVpiby8yQ3Zu?=
 =?utf-8?B?WmVlZEpqWVUyekZGTGlMSGtjWFQ5MEJ3SEtJbXE0Sy8zS21hQkV5b2JkRVU0?=
 =?utf-8?B?ZklubzJhYzVWMWZKRlhiRWxBKzZ2ZVllMkNQRThQRkFYYVhrWGt2WmdOQjI5?=
 =?utf-8?B?WmNEY1RvalNzNUp3c0FnWTRHdndZQW5KN0lkblNvWjJ0SnFoLzdiNnE3dmJC?=
 =?utf-8?B?Z01WS0RpVjFBajJDTmpacnBhcWg3RUtGWWlNZWtaRXUyZnhqb2FSMlBPRUUr?=
 =?utf-8?B?K20zaDBrYXpqMmwzdTlLU0cvVWZxL21zNGllQ0x5MGVjOVdhOFhpVTI2ay81?=
 =?utf-8?B?eWlKRjFJdFdLRTFkemJNVU53aEduUkZZanBSK3ZxOWlUNHpoYUk0QUhobERp?=
 =?utf-8?B?VzZ0N2txa0ZKKzhERTBKN0ppUDRuZDVLWlpvRWw1Y1FEWHgrOGQzTGZnVnlF?=
 =?utf-8?B?ZkVDdW0xWk9YTmZheXJUbXc4YlA4dHZMYkNJUHh1Y3c2Q3pqZnRQc3orK0hR?=
 =?utf-8?B?cURiK3FmV1FxVjFhOG5ObzZQNmhNa2hrb2U3b1F4aTlLdDJuOTZtdCtlaXpq?=
 =?utf-8?B?TzgwNGl3NC9ucENaZ2JrUFVid2hVM3NGS0xrRjZvMmFuTjVBNkJhQklMNHZk?=
 =?utf-8?B?UGx5alFJbjhIaGV4WmYzVEVvV2FON2xqaWhYRzRZUVJtbnFFSk1JMitycnBF?=
 =?utf-8?B?Ujh6WXNJSmdHeUJmZU5XYzRGcXlmNCtjNHZpRmU4alI4R2VpMEpDOGxUMzdP?=
 =?utf-8?B?WjlKNTZOZ2FnbGR5eW4yOWNIZmUwdS9xTW56czgzUG5aT2hVNDdGTGNLYUZv?=
 =?utf-8?B?RlZQSGljZ2ZXblU3VHlVeFErSnFNdGM0YnBlNCtIMFlvbkJDc0VvbHZQcFJI?=
 =?utf-8?B?UnVLdE80WlhrcXloaUZ1Mkd5Mng2SmdjRlNQWnV1eUQxcEJlTEd5L1lBUzlK?=
 =?utf-8?B?b3MzTnU1K2cyNDdKOHA1cGZZeTRlVURHWUhiMGdpOVR3Z05WdGk4SGFBQVY4?=
 =?utf-8?B?Z3ZQbmdOdTFITW9xMUlGV3RtaDVTQm9NeXl5VThjRm4xQmJKZjlPRGQvZWRR?=
 =?utf-8?B?b0FOZXJ3RnJySE9PNStxSXVFN2lVQnR4ZU9FR21jQ0YwenFMWVZLdWVjY1ZX?=
 =?utf-8?B?dW9GWTdESHZ6VTM2a3BLV2NFcTlFZ2t4RnVDNnpMWlpHRjVINUU3eEpKM3FG?=
 =?utf-8?B?T1BBdkt3VnI3VWF6Nld6M2VnTTNuTzZ1WVBsMVg1bWU3c0pYQ3VYOWtVL2tV?=
 =?utf-8?B?b29aMzYxWGNqam85eW1jQ0Q3ZjZPenkyd3F0YmU0ZTFtZTZyRVcyNXlIVk1D?=
 =?utf-8?B?c0U0K3FXcXh1dXY2eUdZMWIxNXZDazlaWWppbkFNREJDK0YxNVgwZ2ZJaXE0?=
 =?utf-8?B?cXMxN0JjQ3dOTERMWnFhT0lzYldqYlN5SUFRZ1dvZTJuTjlrcjcyWktsVnll?=
 =?utf-8?B?QndLZjY4TzVYdHduNjQwME1kamtQa0JLR3c0aHZtZ2czVGM0QVYwRkZhT2t5?=
 =?utf-8?B?ZkludFh4TFFoUFpwM1VIbVREUHUrbVBBRDVFVHlxRmQ5VjlaWEFFOFNWN3NO?=
 =?utf-8?B?WXU5MHNqZDl1bWhNRXZBazZxZFphQ0dYeVp2cVpncWtTREs4dHFNZFMxekJV?=
 =?utf-8?B?Z3JrdTNRZVZoZ3kvOGpNNFA0MlNwdDVja0MzR3E4R2ZLNndjSGxSQUpPVERV?=
 =?utf-8?B?elZNcllrUEJYUldOdDJ1d1BTamZyY3lJTVNNL1UvdFJXQ212QnBqdW5DeTRk?=
 =?utf-8?B?Y1dUaDRJYkNjL1lrUERpN2Z1WjRuNmRhYks0RzFpcXpuZ1V1K04xNUdUQ2Qx?=
 =?utf-8?B?OVl0N0FiWnljWGpiQXI1eDUweTdMQWNjWlVkRldYQW5vQUJScnBNaUhLVVlj?=
 =?utf-8?B?MEJOaytaMVB5OW5OS3RZNlJXaWtxV3g3cVRPQ1Zua29PVHRYa01YVXlJVVRu?=
 =?utf-8?B?dWtIMG5tcnpaWU53Sk4zNVZ1RGpNUTc2LzNzZW92UnRQWEJtVFk5YkFhNitT?=
 =?utf-8?B?Q3lvTjJabm1JcmgyS3B1Ymxob0tTelFaMmZacXIzZkJPcWZ2VDU5dVlqc0dZ?=
 =?utf-8?B?ZUNwZGgxcU8xTWFkZUVwYWFCbmdkdjZ6aWt0bHFHZ2tVdTNINEN5R2JWeVdw?=
 =?utf-8?B?STAxclhKOGc4VUFuOGZUNk12QWJLSkVWT2lJSmVtVGJSYWU3R05HZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3925af8-3da8-4dc8-b42c-08da2855e0ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 13:57:33.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOtEkmQQ/mgOfv6XAd57BEEzLvFdw/ryokvKhS2Cs/XGJw3XPuEsPMmSKscTGpEb0J1dK3w0Po6Df/FyK+iwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6439

On 27.04.2022 15:08, Andrew Cooper wrote:
> On 25/04/2022 09:30, Jan Beulich wrote:
>> Recent changes (likely 5fafa6cf529a ["AMD/IOMMU: have callers specify
>> the target level for page table walks"]) have made Coverity notice a
>> shift count in iommu_pde_from_dfn() which might in theory grow too
>> large. While this isn't a problem in practice, address the concern
>> nevertheless to not leave dangling breakage in case very large
>> superpages would be enabled at some point.
>>
>> Coverity ID: 1504264
>>
>> While there also address a similar issue in set_iommu_ptes_present().
>> It's not clear to me why Coverity hasn't spotted that one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: New.
>>
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -89,11 +89,11 @@ static unsigned int set_iommu_ptes_prese
>>                                             bool iw, bool ir)
>>  {
>>      union amd_iommu_pte *table, *pde;
>> -    unsigned int page_sz, flush_flags = 0;
>> +    unsigned long page_sz = 1UL << (PTE_PER_TABLE_SHIFT * (pde_level - 1));
> 
> There's an off-by-12 error somewhere here.
> 
> Judging by it's use, it should be named mapping_frames (or similar) instead.

Hmm, I think the author meant "size of the (potentially large) page
in units of 4k (base) pages". That's still some form of "page size".

> With that fixed, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

If anything there could be another patch renaming the variable; that's
certainly not the goal here. But as said, I don't think the variable
name is strictly wrong. And with that it also doesn't feel entirely
right that I would be on the hook of renaming it. I also think that
"mapping_frames" isn't much better; it would need to be something
like "nr_frames_per_pte", which is starting to get longish.

So for the moment thanks for the R-b, but I will only apply it once
we've sorted the condition you provided it under.

Jan


