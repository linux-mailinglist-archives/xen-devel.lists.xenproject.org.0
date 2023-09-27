Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74E7B01AE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608851.947608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlReM-0001en-6r; Wed, 27 Sep 2023 10:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608851.947608; Wed, 27 Sep 2023 10:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlReM-0001cs-3n; Wed, 27 Sep 2023 10:20:10 +0000
Received: by outflank-mailman (input) for mailman id 608851;
 Wed, 27 Sep 2023 10:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlReK-0001cT-HK
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:20:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6da682f6-5d1f-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 12:20:06 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9567.eurprd04.prod.outlook.com (2603:10a6:102:26d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:20:01 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 10:20:01 +0000
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
X-Inumbo-ID: 6da682f6-5d1f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPloEKHuBDpDyejoLIXQic39XJGqZ1jm3DQbocSmuXAGXTB4SjUltdyq9vTXjgnt7UBU6XWojt0ym8FIYi27kPlDCpkARN8nREWcAaUmUg1hBCX1E243acW+2kpncAol7Ovml+d9rh0I7kuOynjxTuLAQeZYvMR5hi4V2wEr4tjqJWbqdPQd6Uq+ATB9GrxDJ6Q/UADq3zZ/P5vedYOFqLRJC/AulT/1jyQvqNWMN69gWqWKrY0R/szSpJI1gpGoF3chSXf5Zr9ItnsZyqwftN5WACWaubfHTdEKm1nhcT0V9cISqjg0H5c0mO7sNfkuGReslh4X0uUeJIApZ09ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGexAdk9bM7ssoOXTrZr+4jSeP4JbipQGyZ1N1Cikv4=;
 b=iSw9yh9doYgbARp7MLFGby7QzA1+h+eDqfTyUQj1+4+IQ+CI5MdiOk8Ig54giazZ9AkEr1PJa7EYbyqcIqr6qL8PpftOvU9bzqTdAXlyG9NVZoTj1mzKawljpeHLI2nwb0Uv0WX3ZBUtlQA/aSqV3sWStj56ZWWjlJqsKeYE7y44Drzb4VDg/vYgJjNOL5fqb24G1iJKgnt3x4EooU/fHHdJGCCae29u10NDIpP0qFDsSmuS4EwZR6i3Oiw2Ulzz7ZJdCyMFzWm2eu5B+zYLXze2SjUFPdMebqh/Sb79TvvkdS8i+NW2hktDEe1FeDUr21AUcuhrQcV7Ljz//MCfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGexAdk9bM7ssoOXTrZr+4jSeP4JbipQGyZ1N1Cikv4=;
 b=X7MR2mvKbk73nrya0yXN/btL2uxKlbSC4Pss0Ng3S4QdLyIltJZXiFu2oCRIUMUafBKBk7IcJ1JJ1/z8uGGowOa8Ifm2pWNEwi8f8SOrrBvZPpwNQUiMlNzp30rgUKDczWGIGvi0/7s+EwfD1DtVtRDyCOosLX7GH1GxsWCA4adL/5xD2XvChhMU4puwZh3jCd6pNnQBSAhduJhhfG/H5paUQDj3oo5hU8l9HwXjxWq3fGxYofnHlM5iXKX8OuAL557sIeI0AbZhKLPq7WZ8R3/t6k2zAWy6eEAUT1bSwbttPTMKbRhi6WknSvfZxWTtA/6a71pfHuHl0dkopK7G3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <058b1cea-3437-2779-0c2f-efca2adb1f15@suse.com>
Date: Wed, 27 Sep 2023 12:19:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/8] domain: update GADDR based runstate guest area
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <65893a9e-e2ae-6853-7c4d-54f2bf19b17b@suse.com>
 <ZRP5b9qOUK_sCL51@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRP5b9qOUK_sCL51@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef2ccf3-cc6b-4062-693b-08dbbf434eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0oIg0BNdGqC5xK1ZlqDA/6CiGCjoalMc5lZjLTp2yZnmo88XBjrwV006jVSFfnf6xDqFfYSpvwtLxZ1O0ncJIOcDo+NooTioYJldYmDUA1NeAlJv2Y8BzryHT2l7VChHDXDuppxBiQ+PUwHrToT2ZeIKiDrUJgqww7NzVp8/23o1iw2/GIGa/tdBSKwc2rj5K6Dc4UYQm/4JEaIqyMw9xbVx4Z1dPe3WmUoIt+TfHJnwDS84LHKEkjBFvWD+7+GFb+EkV7q+yQYGRK7PGYD25XyhTUwRh8CAnm6oD/vSnnGIU3EpPtdqT/5bp7P8lujwIXz4I+qeEpwqd9OyB4hQsVQ7thxJi93+ihqYrhWAdoRfH/wyajPUUHJAi+qZgD4rQ1oukhr9pR1Jkrwkrp4+gCv4MJPVn7jwb4lA1+gscBZ6WftJOILn4kaxJ4vl9OOgaQavtNj874D5UoWh+eqXI808FWQGjdAl+wYiyUimh5o97m1DllDVirCnm0jRui/81bcA7JgdniFqsArtAp538fe08IXofbge5RQ/yuGY5ULmvL128Ddb9juM9rIopCwJgo5G1QJ0Uf24COuvoTqk6LJThnBMnD1DmhsAN1IbzlU9jk82aKavJtfLKktK4GFbVtNLFi23MD7jjwweLMQo1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(31686004)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(8676002)(6512007)(4326008)(8936002)(2906002)(41300700001)(478600001)(26005)(6486002)(6506007)(83380400001)(38100700002)(5660300002)(53546011)(2616005)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWMzOU44NFZ6Uy9yUGx1UlpPNWJaUDdzYXF2TGkrSjhoRGpjS1pEQkhkM1FU?=
 =?utf-8?B?UUF4OUxZOFVUNlpSUGo3c0o0STh2Q081YU5kUU5FRWRMZ1ZndUQxSy96UjFT?=
 =?utf-8?B?RXdJQXNFcWprTU5NWUtWNUZQaDVNOUNiMWx1V0pReHhPMmlwNlR2cXNSMGxU?=
 =?utf-8?B?RkNUTFRlM0c2SG52bXR1RHpjdkE1SE1EUEVRMnFWMUFBRUZGaVEzQndwSWJk?=
 =?utf-8?B?SnlrWEJheC9nb0ZhV1l2ZnpMYTlIYURRWUVUa2pCMWFnYi90b3hGbzNkZjMx?=
 =?utf-8?B?TmNiNnZBY1NJcHo4SFhWT1RYM2lkNEJGOG0zTVU0V01MT0ZCWVBrQjVKTzhM?=
 =?utf-8?B?VzNSUHJ1a241YVRIMWFDc0xiNDhxRmxWMllwZU44MUhVazcxbThVRFowY1ph?=
 =?utf-8?B?cjJsVFVzOUdVMzNZTFo5MkxBSVBjUEVZSWNLN29QSW5vdmpucGZZaENRMjRK?=
 =?utf-8?B?bHovMEFIUjBvMlhIY1h6ZE9IejJxcFI4bEU4Q3M5eExKVlhjWmI4Nyt6bGNH?=
 =?utf-8?B?d3N1UjJaZ1hLSC85NHZ2V1dYbTdzc0tDZG41bklNOWRXWGJtZTBFekJEajV2?=
 =?utf-8?B?Y2FUSDVjdDhiSDNaWEV5M0k1Q1R6M2JLWDJabjN6UXhndFBNMlU2SlFMdkxu?=
 =?utf-8?B?cmhESjFjZTRydVBpL1BSbnI5QkJwdkxHVzN2WHJCaWQ5ZmlCWmtVamhsYXp1?=
 =?utf-8?B?SzJYNjlIUU1rOUFpZkZFUGZjWVR2SC8zb2tiVEhEUXdBU2VrenpEOHd6K2tO?=
 =?utf-8?B?NmdNbnVXTisrRUlQNUNLRy9yVjNxdGZJTGhLRCtNMkdtSVBlQ0lhc2pSUzln?=
 =?utf-8?B?OFBkU2pZa0FpR1JiYUFOT2s4d1pHTzBpNXFjOFM0dXJpSXhvWWx4U3ZtZ3Vn?=
 =?utf-8?B?OCsxeUVGWjZmSW1sOUloeVRFOFVVZVRzOUFrUmpOZFlpaFhuLzNTTDRUZGdz?=
 =?utf-8?B?ZnZSdThqWnBYSnNjRmFiaXpKVFVnWlNEYTlqRS8zcThMdkErenJrelA1SjNU?=
 =?utf-8?B?OGpXbDROdXZHM0xCNUNJSFZJWnpzOGhMZVVNSDMyM2JuaSttSUYzT2dKcnVX?=
 =?utf-8?B?aG13R1RyN0FjWitUTTRmR1I2bU1IVHN4Q3hvb2lpT2F6OWNRQmJ3T0g2dmh0?=
 =?utf-8?B?ZHgrU2Q1cDg3eStQYi9hVmsxMWNtaE4rY1JQSHNRNVZzdlA5WndrTVI1VE9D?=
 =?utf-8?B?ZG5pMjN6U0NWNlozdFhEbEtWay80L0YyZmIwamtOTGF1aTVHbmRoVElTbnBR?=
 =?utf-8?B?WlFNRVB4Z2U5NC9LYlNvMXVjWDFqZW9ENHUybWlZWTlSNGN3UldjTjJnN0hP?=
 =?utf-8?B?K1lOVXdjUThvV21HN1F4ZHB5ZldEcHNyNEtUOGttWWJoOFdrdGtuWXlONEFh?=
 =?utf-8?B?U3ZSeGx1ekNYZlFPRUMrekxRQWRvcS9IbmlqVmJyaGhoVXZ1NEs5L2NpTmtz?=
 =?utf-8?B?NHpISkpGazRLSWhsdFJOdnRqTm1TOFR6bEJUZmlNZllZaUlMby9Rb240YXo2?=
 =?utf-8?B?MFlGM2hmY0lWMUt4dUtEdE9LeWVHTWVONlJIdyt3b2xKSm5TUTUxSXdXY0o0?=
 =?utf-8?B?bFE4Q0FRdUU0TWVzdG1lNzFiSzZ4YmJUVXRlMktZR3pjdzVycmYzR21FNHM4?=
 =?utf-8?B?YUNERnIrZjlsTmEwWHU5QkE0RzlFamdxNGkyeGd2d1d2Zkk2OU01bW16OGNy?=
 =?utf-8?B?ZEEvUU1idUpwVThqckxZMWxKZkwveDBxeGplOTlZT3lsZTZza0V5RmN5UlBK?=
 =?utf-8?B?a2gxaTNTYnBUeEp4NTdIOEFCMUNKNFBONmgxeVhyQWs0UExLWS8vb1l2eVgz?=
 =?utf-8?B?ajJLRDk3dFRmTFJFa2ZTUStWVUpVVWJCbTdiQzhwSmFTNFJqOHlRR3YrMjF2?=
 =?utf-8?B?ckhobDducS9FcWw5eUtaeGlNTDJWeXBZL3UvMnhadTJPbkxXdkcxQTA0cjNC?=
 =?utf-8?B?K2Z5ay9nUWJHNzRxU2hUNHlPZTcyMlJYbjUyNFhIRDcyUjFLd080OEpPWWJZ?=
 =?utf-8?B?VitKdEZVWGc5YzhSNktRQXRoUVE5NFF5ZUtZcUF3WHJ2TW1xVEFUdXd0N0tD?=
 =?utf-8?B?dHkzNWQ5VEFNdk5JOW9BcnNkNHZ6VjNJczRaK0REVGlzYUp2UnE4VHd2YTVF?=
 =?utf-8?Q?rdmTl+ICw++zU+mbDlYIIaXE0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef2ccf3-cc6b-4062-693b-08dbbf434eff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:20:01.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyZE2K7nn4HCSWoj8xN3rvZ2CULqUXxi4e3YWbVLSZzbUq8tpedMhIBYPBg52GD7xS3PnLGlbLVD3ZralQoE8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9567

On 27.09.2023 11:44, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:55:11PM +0200, Jan Beulich wrote:
>> Before adding a new vCPU operation to register the runstate area by
>> guest-physical address, add code to actually keep such areas up-to-date.
>>
>> Note that updating of the area will be done exclusively following the
>> model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
>> based registered areas.
>>
>> Note further that pages aren't marked dirty when written to (matching
>> the handling of space mapped by map_vcpu_info()), on the basis that the
>> registrations are lost anyway across migration (or would need re-
>> populating at the target for transparent migration). Plus the contents
>> of the areas in question have to be deemed volatile in the first place
>> (so saving a "most recent" value is pretty meaningless even for e.g.
>> snapshotting).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>      and alignment) of the runstate area. I don't think it is an option
>>      to require 32-bit code to pass a range such that even the 64-bit
>>      layout wouldn't cross a page boundary (and be suitably aligned). I
>>      also don't see any other good solution, so for now a crude approach
>>      with an extra boolean is used (using has_32bit_shinfo() isn't race
>>      free and could hence lead to overrunning the mapped space).
> 
> Shouldn't a well behaved guest attempt to unmap the runstate area
> before changing bitness?  I would expect this to happen for example
> when OVMF relinquishes control to the OS.

Well, the OVMF example falls in a different class: Before transferring
ownership of the system, it wants to unmap regardless of whether bitness
is going to change, or else memory corruption can occur to the following
entity.

Jan

