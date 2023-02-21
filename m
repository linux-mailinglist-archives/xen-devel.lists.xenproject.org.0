Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F410369DE87
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498774.769684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQZ5-0004Pt-02; Tue, 21 Feb 2023 11:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498774.769684; Tue, 21 Feb 2023 11:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQZ4-0004OC-So; Tue, 21 Feb 2023 11:12:06 +0000
Received: by outflank-mailman (input) for mailman id 498774;
 Tue, 21 Feb 2023 11:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQZ3-0004O6-Mj
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:12:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92690cd5-b1d8-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:12:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 11:12:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:12:03 +0000
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
X-Inumbo-ID: 92690cd5-b1d8-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHNY6iR5u0QieUSUehsOeFJ0uh5J34GQ8XPxj7XWuFbLqAQ3faeD0RT7a7zpvKQKg8G47W4NOiWuTp71TxsjbfyqKE5uGmu7ecbs0pj2hlabDIh4z5Plm+ieAM8IuDYAuqT1eLpwoG5j9VH27iLqxRSwlXnO1zozQT25B4yBEPaFUAPaoQN4dW0txfiRZVNORp/Wx/6ZQ0M2Y7tgTHA7Lbuvn6QYm+hftKBBnd8oZz2rhgwcSwnM9AElt0vAkLVYar0fmtziaPvUFZGeSR2ADY/zgfTlaXIdYnnHt/A+/cEaK76BxGMD7Zl9tatI49j7rsygwZ5PMkSufXlBE8Ew7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slUQ2bLp9MqEYH5/EwKWdF1TzdAfLs4g00vpbimjalM=;
 b=ITVkqIg8sbkY/4tox0pYUSlvHGXwcaag2b9IkSOccnNJSpu8cPQ7lYm6zbANRm5Q33nnnGMe/OUcHNcXcKXwJLS2Tk1is/7jcMdHX7twhhfh5BU1ldGbv+kPO9vo4WBPbxvHotVj1pHDQDsfSvo9EYs/cAest+8GbE9Cyv2wb6Qnrq4FUzxfjqNp0QcXlIQcQZmmZxU3vtu4fU9W00VlpqCLGjp5MzPKhfWyNZVXOQ6JANXNAJnaQLNP0jvuCP7ho/C2QrNoCSJ556tPXqxcVti0ne9QgGoY9QZbsj5+FLD1lPfRgx9UCHrwWncf9jxt0iYfop5QxBXaWILLid6zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slUQ2bLp9MqEYH5/EwKWdF1TzdAfLs4g00vpbimjalM=;
 b=VoHcYTDbJGsLs02vzy2TTgulO/BVcwWxAQJlqq5cx3SdlbHzTFSR/IUJcTFPdx12jxPf1gDnOqi3D4EHKrFMNp+091nlvivtYkIsWRTypzzD4Qv9jeOPqZ/pmmHXPZpzb9elhQ+i+AdX1R1HgsWyp5q02eLxrFgst2i+Rmxduhe4tPcB/r0W3S1R7B6Rz3CJfTjyWMHOCYF1/IATrsQf2NK3ZjyQkEAeO5FlKOq4WynnGC4WhnD66xWPpI2kmtfYm3+vJeUGA+MC8Z0Qe+vEe1htIcAnxKyEb+k7Z1WEOLwSIXae8GJKHJ5v9Ru5FghxGMS1onGihRjXkmADTyf3vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12c71fff-a27c-36ca-992e-1b1d1c075c4b@suse.com>
Date: Tue, 21 Feb 2023 12:12:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] x86/svm: cleanup svm.c
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-2-burzalodowa@gmail.com>
 <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
 <936cd14b-70b8-0c28-3aa8-85e5b3f2a8c9@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <936cd14b-70b8-0c28-3aa8-85e5b3f2a8c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc788c2-02f6-4717-ce3e-08db13fc75b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrJCy/4KdZgrn7Rk9z0FcVvLtlHHxkc/7jJvPYbQjEPQmM9gzxHI33iZ+DMvJyT0ffnGwL1k1j5OvCs6HdprPYPVkQU36G9OhKnfjqz09wbTatmdefw84jEswVEXxAlLDZRQSqVG5ENOAMobbgvvSSPbUTFlMa2q72hz7ZlQZoJo9qgiXPW0E5LS9fBI+09oQCKGxihuOQSrG0hq6CXP7WJ3O7DUGEcdtPhlZGf2BuaKNW5AoQRB1KHV+fbRqwgdsR5UfBMHkBSo+GCkvQ2N6VxiziamHejX3s0PtBfWQzwKwyHwDoPDBBuGizGZPtpiz8c5/rzv7JKw6Akv2bM/nZDCveJSSx2fK7KYmZwnrp77eOiO+6A8tq89FsOVz6wJ5VPBUNTjYOmzHLDPh5mveoypHqbB423I1ERV/DLxln/Zl3X2768w2qZGoWkjc1484/320Y8IaAO3sexIt/o4GePIHvbRQIoHRmr3CBJ6cIbTaJOuB9m3bfOpzAZQYELOVezPutfjnoDh/eVMy1zfrKgvAAfbUMFVeNE9KHhRPSzfEpMFYPd6uveS+Jp+1p25ReO0FW6hXX5o1M156T0YxfWsKCEw0dhCPGat/hK2ADeJKBqu0wx8GVtmbscYqn4Xksv+0UjWqxoVyALXREmW8kSxf6nI6CAKm1hp0ZgIG0Vf4Oa0ZTgbxTh7GF2eH+wZA+oM9GW26pBt1kzi64QurHAXAkJ2CV19qll069aPqjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199018)(38100700002)(83380400001)(31696002)(86362001)(36756003)(8936002)(2906002)(41300700001)(5660300002)(6512007)(26005)(53546011)(186003)(2616005)(6506007)(316002)(4326008)(6916009)(66556008)(66946007)(8676002)(6486002)(54906003)(478600001)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1NvVGt0cnJpZCt0WUw2c3I3Tis0Qk9rWnMxdE0zclArMEo4WXliQlZaRzYr?=
 =?utf-8?B?TFJOUUhVc1RQQzMrWSt5RmRlTEpSOE9jTElRNXRicDh3MEZKSCs0eHVZblFo?=
 =?utf-8?B?RWVTMGFNb1F2SlV0Tmx5S3R6R2tlWkRMaGtsUDN3NlNjcHNSTXRJczNLTVJG?=
 =?utf-8?B?Wm9PNnJkOVd3aVNrRmwrOWhORi9lM0RGQ0pTcy81aVQxdHlLQ0hjN3pFSTRV?=
 =?utf-8?B?UGY0RkkwYUU0ZU90QTFFQm1EblBYL21IWk9XL3EzNXhDNGQ2ZVUvRmxid2ZB?=
 =?utf-8?B?VWdxV1lldDRSbHpIOTl5YjVDQ25tM05WWGZjYk1vUHlYL3lBZHp6L3gwWVpJ?=
 =?utf-8?B?MGhCM2c3OUhtTjYybmYxT2NUaitqNDJibFpWUi9RMm00Y1pROUFRQzVSTkJF?=
 =?utf-8?B?RUhqU2Vkdzdpa1NZMjBCdXk1VjNkYWNtMzAvUlptMWtYalVTaVVTZUdEbC9B?=
 =?utf-8?B?TlBJTXMvWS8xQjIzbTRENFJtQ09pVkpLNmErWW9VMmN1UFRjSWp3dDBHVFJW?=
 =?utf-8?B?NHpTSEUxU29ySFFYMDZ3WEdYWDFCYXBjOFczSFdyYjQydHY1b3puZWJqT1cz?=
 =?utf-8?B?VHhBOXd2R2pTNjhocGFsL3JkbHBHUU5ZR3dSU1picGl2Q2M4WEdVK1lBenI4?=
 =?utf-8?B?dGljbzFndHdsdGpoQS9KQ3ZybHluUFc4RzV2VGRIK0dyUFR1M2tlNm1JTmJt?=
 =?utf-8?B?U1NTcCtwdnRodzh1NURVd2l0VkpSUDIxQWRVSXprcWxkbXJOM0tqU3RMYUVV?=
 =?utf-8?B?bm9NVU93ejRCRndQM2t5MEdjUmlDaDVLdGJWY1NpVDN1bDFBRTdwYXlURFN5?=
 =?utf-8?B?UDhYN2Y4U3lmb2RqYVZsdVo2bzBrSlVuQzJwSHMrSGkxTzBKcXVSRnFDUXFp?=
 =?utf-8?B?TTA5eEl4bTMyZVhSQ0hBbkJMVVlUVkdBcWYzemxqVEhFTStMNHV0ZVJJYkpo?=
 =?utf-8?B?N3pxcEtaUVkyenJ4N0ZMUlF3ZEdVVE9oS2x2RXZpLzdhSkt0Z3J4MjdVTFJw?=
 =?utf-8?B?WHlEMFJRRU5pelNjak9lNUt4L05mS3hlOVZxbHhxaDdDdDFDOXBReGxObnhm?=
 =?utf-8?B?UmJBTTZycmc2MWlBejhjOWZadko2K3A3VVdFaEdHQTNTVldDUEZRcDJkdVJm?=
 =?utf-8?B?d2h4UzczZTJlSS81ZjZBR2pqY3JuVFVUQjRHNWNTQm5hNURoY2tUYkp2WDZr?=
 =?utf-8?B?YUZMRWFiWmtHYk8wVHVHN29xN0lsaDF5RDRXSzVmTDlyK1NaSkJLdDdINFVK?=
 =?utf-8?B?dWZKZmNHMjJJVnE1L3RndlRJYW05eEh4b2RmSUsyQnI0WG5OZWNOS01ET1g2?=
 =?utf-8?B?aHdidis4QVo3SDJiRlplNkhlVUtMM3ROVW1FVy9tbWxSaDZ4dzgrT2tsNE9u?=
 =?utf-8?B?b2huRmZXdFNZRFYyK0xNSFNGWGZuV01YeFlqaHp6QUtPQ0ZKZGcrZlo4cEpx?=
 =?utf-8?B?QWIySmtrTnA0UGhIRkgwdExaS2M3ejV0bEFCSVVzUUludzBYSXFoWVpneVZ3?=
 =?utf-8?B?cGgzWXdvRTg5TERySHdNTW5wRk51amIyYlFjNW1DRW8zQlkxckV2WWdwT0VI?=
 =?utf-8?B?MDBJWjVMa3RtdVl1WTZWb0EzRUpINHNTRDMzazFtMDhMN0NueDlKbnhzbGpH?=
 =?utf-8?B?ZUs2cUtLR2w5amNlVEpSREwvRjlpQmVzQ3YzVWpLRU04aGUwSE1JWi9uQ1Ax?=
 =?utf-8?B?Q1F0c2VvdFV0eGtHaHZQQm56UWtiN1REdEU2bGVZQUJNRjUxVVpjcGNFWXRY?=
 =?utf-8?B?bExoZE9FeXh0ektDYXNNVTJTM1pZZGxwUnZBTEJBdFZtSTN3Skphd2ZTZG5Y?=
 =?utf-8?B?Z3hnZFZZWGREMk1KSzh5OTVZZk1nUG1OQmZHcjBUaFkwS0pCVWR5S2c0K3B3?=
 =?utf-8?B?VUtjcjB1YXozU3lRRmtMTEN0TXA4anNuQ3hlbUd6a0JGNzgwTWowR3FCK1hq?=
 =?utf-8?B?K3hHa1FQZ2dpUHNWQjlibUYzZmEveE94a1Y5ZVZWbkpRVHFEbDFyZlNTcFNz?=
 =?utf-8?B?LzN1c1MxejdaaVpSM0ZjVXFyWmRZbm56MlVYMVdGTFN4WTg5WE9ZOWRXcDc0?=
 =?utf-8?B?NGt1YXRvT3p3bjkwMmE2a0tSNCtjZFJoSU9tdGo2S2xFdWlwQWNKK0pWdTBi?=
 =?utf-8?Q?UGdlQC2cVNqKawS2+YTOSoaM8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc788c2-02f6-4717-ce3e-08db13fc75b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:12:03.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgcvziPFbDkJNHxVRrzSy/oj9UkkABt4Qyt+/oBKSVvhmhObRMucOOxoppQoLF+oKocd3C6s3bSTIXJRmYodjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8477

On 21.02.2023 08:45, Xenia Ragiadakou wrote:
> Hi Andrew,
> 
> On 2/21/23 00:12, Andrew Cooper wrote:
>> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>>> Do not include the headers:
>>>    xen/irq.h
>>>    asm/hvm/svm/intr.h
>>>    asm/io.h
>>>    asm/mem_sharing.h
>>>    asm/regs.h
>>
>> Out of interest, how are you calculating these?  They're accurate as far
>> as I can tell.
> 
> I do not use a script (at least not a decent one), if that 's the 
> question :) . I verify that none of the symbols defined or declared in 
> the header is used in the file including the header.
> 
>>
>> Looking at asm/hvm/svm/*, intr.h itself can be straight deleted,
>> svmdebug.h can be merged into vmcb.h, and all the others can move into
>> xen/arch/x86/hvm/svm/ as local headers.  None of them have any business
>> being included elsewhere in Xen.
> 
> I can send another patch for that.
> 
>>
>>> because none of the declarations and macro definitions in them is used.
>>> Sort alphabetically the rest of the headers.
>>
>> Minor grammar point. "Sort the rest of the headers alphabetically" would
>> be a more normal way of phrasing this.
> 
> I will fix it in v2.

I guess this can be adjusted while committing, seeing that ...

>>> Remove the forward declaration of svm_function_table and place start_svm()
>>> after the svm_function_table's definition.
>>>
>>> Replace double new lines with one.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

... it's otherwise ready to be committed.

Jan

