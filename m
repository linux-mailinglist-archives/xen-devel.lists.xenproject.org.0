Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE24CD3FF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 13:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284231.483432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6h9-0005S5-HS; Fri, 04 Mar 2022 12:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284231.483432; Fri, 04 Mar 2022 12:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6h9-0005Oq-Co; Fri, 04 Mar 2022 12:06:03 +0000
Received: by outflank-mailman (input) for mailman id 284231;
 Fri, 04 Mar 2022 12:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKET=TP=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nQ6h6-0005Ok-UZ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 12:06:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72cdfeef-9bb3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 13:05:57 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by AM0PR03MB4962.eurprd03.prod.outlook.com (2603:10a6:208:103::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 12:05:53 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 12:05:53 +0000
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
X-Inumbo-ID: 72cdfeef-9bb3-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MywuC+V+Vk9d0iFk9LpHKYMnehDUO1FsUmnxvok9UGmSOfE6GPkUg7wMJaHlf8vWIECA7nF+yXo5XIyLYG4NxkQEDtNPO3GNO2u7l+2bdIqrS6PEspNM0JiGC68HAV+cMDP6GlmpQBVJj3IeEecCTw8WQtwk4vTMc3YmmK50WAz5kMBjgvPC3cWqddJnCA4fPqpySRGsFcXsQtzW8k4LIiEVTOzWKCCrdtlIFfrMLhTIsXdDaQuFag3gRcQrdriWBNw3WjVKklmSX08CUzE2zHbBtWyyxg5S8cteeZDu2R/7lX8DWrX8YhcNt2QNHz5jJ99tgXcSHNN4Y0AaR/IORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nriWyWVC9vk6oUd3gR5IdgnmsSBK7vaOjO/3nysPD4U=;
 b=Ke9+xvtGEF7CnCNnZPKO6ZhqAm6rqiqvbj2Q8NA6Q/2ETNYX+yqjx8aA+RR8n/R+zkjBMhSVL7/s9fnaSXXd6wiilEFvV4TGmsriYSEZF2V5Uaf4TlqNj2+d8mPiHmH5Uw5+UP9pfO4AHTSQLs5lj6Wl4iKYZJq+WxAKy1vW6mmHYwcJUY+peYQHWPke7LjJCnUbe60TWbOm44BZNQwJNE0xz7tInav8Qfw73Iek265O7Jr2c0O0sVIPZa3NvHkC1W9lqO54TUBRKl/I8ANO0ykzGqRPRtBwVwbZ9o1yspsPvuJLewSPi5GogJTy+68IRkCIsLtfQv+IJ02QN4qynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nriWyWVC9vk6oUd3gR5IdgnmsSBK7vaOjO/3nysPD4U=;
 b=rFkQXyfeo0Es1ZQMfB5/cQYwNHG/YQbqbpWmtf952DDTPTocDmfNjbP2apXEdJox6WklpSZhUJtFBSBAmQ1objiarUkGv4OlB5r7EdLPVO5BnoRHWhcRQj6yG2f79/U1AZkwJcNlJmgB7hvkQLjItYzGWWTZzrz24eSWyJB/7vQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
Date: Fri, 4 Mar 2022 13:05:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <YiH9cee6NIKA6MWg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::31) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3c2d5d-6d8f-4bec-6ca3-08d9fdd754a6
X-MS-TrafficTypeDiagnostic: AM0PR03MB4962:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR03MB496273E1880F159565C8996298059@AM0PR03MB4962.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbBR7Golo618fDZkp4e2cj5dPA5jMk1exuLhLy7xQk4RfGCf+eVax02bvISk76NlUkGS9lQG/16aPGKrCpZ1n58k6iFNrVH/E1IfmF69I242V0h5/DEZNr2kQhcvfIM7n5e+uT3fpvy3nuh4MIJKGQbKyAHhNzXzfDebgjKefNbdlyiE0u7N9pBkCqHc/dW+3Hd6UIXeIEgtpF/WybKO1nlucxgMX//1b3KRaA+1ixiozTCh5vCG+Iy4i7CEqSvW/bao/Ktyl+fxLxYhl1uKaWEY4vTqnnDez6ZK64uuNoP1Qd84OiUjfpqUQAQhdgMRym/ONFCYx+S56htMBM2FX9h3FF6UFkUYB/DInLw9krS+FuCcq0nzceGx1rsoWWKXAtZuqKLWzYGk2EczclOVdgwt6/sJ6+B3+a7vjwGVkPKqL7l6q1/H3XfsRpfGc7T1c7IfiS1anPe5nJMaDNCpJr4lqtZTZx1/XOWy+WmY+ys9nRWWS5xrmfUdlV96Q+vkhgXca9/nZODyOErgvPLWUA8eCiJ4MzNd/rmMKbx6gDmXNiRJk17fMyzIm7+pfbqkkoCo0pZXY9N5c35rUHwNawUKXSV5Jay8ea4Lz1SnSpnHY1LCENTSGMxHsDiBhGcGQLh30oQiklvDXS/u4vGHAkqdth5/8kcCj2L9sIC/rCj59XtFWhfMxewb3X7vRX+XEasWLz05EzQY7LBYMuHqwK7SutwuHd1dAFcQsYGkPy7IDid1+nEzvrebnFXXIvMeQlP6NmBOnXqMpbnjmLMLAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(31696002)(4326008)(2616005)(83380400001)(186003)(26005)(2906002)(5660300002)(44832011)(3480700007)(30864003)(8936002)(786003)(6486002)(36756003)(110136005)(31686004)(54906003)(6512007)(86362001)(52116002)(53546011)(508600001)(6506007)(66476007)(66556008)(66946007)(38350700002)(38100700002)(316002)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZacWh4d3cvaFpKQnRoL2dJRmRmVjJxcG85Zml2NEZSRGV6Rnl3WVdrSUNv?=
 =?utf-8?B?eUkyci9JS3BwZ3FZVS9veVo4MVNHZXFTZmZXRFdCdDBMeUo5MEVsUEVWa29x?=
 =?utf-8?B?NStpYnN0MVpObytzdGNuRjBod0RUVUtpdERWaEtWUU93YXB6KzJtMTFyMG5B?=
 =?utf-8?B?cmlBaDJ3WWhiZDVsZVZ5UnB3UzlVYVhWS1JWS3NQdncraXN4aU5qbVFtVlVa?=
 =?utf-8?B?bmJsNlpiVUVxTGVmUXFrNm9NVEh0S2svQTQvN2lKbG1wNE1NVldvTEtVZkhq?=
 =?utf-8?B?OUc5VDAyalRzdXlocURUYm5WMTR1QjRSN1NZUFpQbVh6Y21yay9pcElVRzBL?=
 =?utf-8?B?RGNDZ0NiQllUWENjdE5MRkJOQ2ZxSkR5KzRIM1hHQXlNL0U4SEUwbTNVUnVN?=
 =?utf-8?B?dXdCMnEvTDhkREY4dUNzY0E0Q1phSDRsL0Z2Yk9JRGM4bERmSG9wcjVjUENN?=
 =?utf-8?B?UVZiM1pFby81NHN4engreHFxTzBrNUsvbi9lWWFpMU1SYVpKMzNuTG5uUlJm?=
 =?utf-8?B?SnpBMGRFQlV5Qmd1bENGRW5XQTRKdzlkb1ZET09ZWGRLbndIU0Nrd1hGcWJ6?=
 =?utf-8?B?cUx4bXRlMnhnQUlNWCtPaHh3MlBCQ2NRaFNpa3psdEd2dmtKT0VjZjdaeDM3?=
 =?utf-8?B?ZDVFQW1iazZOVjl2eEJZTjUvMENXT0hhS2ljQTlhcTdPKzBSRnNacWoremx2?=
 =?utf-8?B?Q25MWVhpY1NkZWovTmRDQ0duSUNFMUpyY2YxRHdoNTQwa0ZwQ2ZIVjVQSHJn?=
 =?utf-8?B?VTZac0FFQmQxbDdHLy9vVWFTTkFjTHhZc2NkOGhwcDgvT3l4dUwrY1lKOG1L?=
 =?utf-8?B?Qy9BZERPdnNTbkJVT2NtTENzMWdEVGxiV3pGbkQxL2NXRlpnRThtdGlxOUFl?=
 =?utf-8?B?a1pxckZFNlkxbnU5cXVjelZSZ1lSYUtjUHNSaVVqZGY3N2w3WnAwSnUrUysw?=
 =?utf-8?B?ckJ1L2RaM1JjUmxVdnhwNUVTaHl4RmpDNlZZOVBkM1dGR2VObEZhNlFITnhi?=
 =?utf-8?B?akVuWXNiRDJpN2tHSDFHYTRyUnNqQ2R4Wkh5eWFWaU9Rc2tYOFpjeTVOK2I0?=
 =?utf-8?B?OFNaZENiVC9sTWxsK0l2eG51Nm9EZmkvZ2ExbkxUdXBiR001ekJTOGkvVTRE?=
 =?utf-8?B?MHNQNkkxa0wwQTZiQzQvWFYzNGllZFNTakovZmM5VHErQzd6RTlnNWdXcWU1?=
 =?utf-8?B?Q0VzVG9ZUXRqYnhnUDZhOHczcVZRK0syVm1nLzZLVXFDWi9oVlJYQ2tBRXVt?=
 =?utf-8?B?WnEwaGUzZ0pIbjJrdXVVdCsxekVSQlRKRnQxS3pHMC9KR3pZdDRIUWtoN0VB?=
 =?utf-8?B?VVVwLy9NV3pnMmJndjlOUnIxZDlMTXZ0ejRHME5CUEM3NDllL0NMRlR1cTVH?=
 =?utf-8?B?VnZuMkhPYmNaWVJyK3VyWDk3Y0IyWi9jVmdGK0ZGZ1o3V3VOTlg5RnlzWTQy?=
 =?utf-8?B?bDM1R1pSUTJYeEQ4TFBpb1FVMmV2anVocjhIakpXY21Zb2JYNGJQVnpyaHNj?=
 =?utf-8?B?YThtVm9CQWQvZGgrb3pheXNqUUtRZXlodDM2aGpDaG9rU2d0aGtLQmdISkJa?=
 =?utf-8?B?UmhhK2tDMGlZUjk3T1N3cTFINnVSMUlLVzZsdGh4MXVJbGM1cWlnWi9HbVln?=
 =?utf-8?B?NUFuNUFNWmQ5U1VWODdFUi9ZZmpGMzIzSkUxUndzSG55UFJBZDhwWjFrNHUy?=
 =?utf-8?B?eU1DK2F4V1lja2hhUkg0WTAzREJrRFlFL2xpSnF0K2RyVTRtNTg3aXp6SVRB?=
 =?utf-8?B?bnVHdUsvY3laZlp5dE4rbnJ4aTZNcXkvTFM2YitVOFV5TnV5OXpQK1BRYkFB?=
 =?utf-8?B?WGFxQ2pUb0tuT29nVGpwQU9rNlhmWnd5T0ZGU243Y1pnN3hkNk1hc1NyQ3Vp?=
 =?utf-8?B?UGJnbzYvNDVjZlBMYWk3V0orZGErRHRWdjNkSWtaeGVjSW5lQjU1bExoQUEw?=
 =?utf-8?B?UUF5OVJ4aFhaWkJZNFlla2hGQkVia2IrbktHY05ETnRXcUZoRi8zU2ljM1V1?=
 =?utf-8?B?dmJEVU5rY3ptb3FhU3A5VlcvbE5xdlNuVmw4QUYxMzNUb1Z5TzU0VFlRd295?=
 =?utf-8?B?aHlkdGpwNjlMazlFQlNxSHM4NE5MUXo0MHIrRjZYNE90Tjd5bzc0STh3YTY0?=
 =?utf-8?B?RVU5S0NJYi84QU80L0ZxYUsvQW5lSDNsZVdsZVN5WjRjaEJ3UldURTNRQjZ4?=
 =?utf-8?B?ZU42NlZQWmZTeit0VFpJOEpvL1ZjWkpkZlg4YlV4amNKUFhVSGYxQ2ZKemh1?=
 =?utf-8?B?QkVkSUZRcE1aV09YYlVrckZmT3AwQVVjRXN0V2tPZnhkU1Q5T29XMUVHNVN4?=
 =?utf-8?B?cEppb0oyYnNZc3dqZkkwWnJuVGFhTU9MTlpZYWhQOG11bXJGWnRzdz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3c2d5d-6d8f-4bec-6ca3-08d9fdd754a6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 12:05:53.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygiy+EPsIwCh+4IC629J7MUyM7Hiyrtfdpl+7nZd0VqFW7HLXA0N9b9rMGszhkxxIIs697c7mDJdf7JpuoWF3U+wY8h9Vxpsry6PdbVHEtacSUywDlZWVG66UbVB4pLA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4962

On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
> On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
>> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>
>>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>>> Hi all,
>>>>>
>>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>>
>>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>>
>>>>> name    = "guest0"
>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>> memory  = 1024 vcpus   = 2
>>>>> driver_domain = 1
>>>>>
>>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>>> While the second guest has been started with the following cfg:
>>>>>
>>>>> name    = "guest1"
>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>> memory  = 1024 vcpus   = 2
>>>>> vcpus   = 2
>>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>>
>>>>> Follows the result of strace xl devd:
>>>>>
>>>>> # strace xl devd
>>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
>>
>>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>>> write(2, "error: ", 7error: )                  = 7
>>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>>> write(2, "\n", 1
>>>>> )                       = 1
>>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
>>
>> xl devd is daemonizing, but strace is only following the first
>> process.  Use `strace xl devd -F` to prevent the daemonizing (or
>> `strace -f xl devd` to follow children).
> 
> Or as a first step try to see what kind of messages you get from `xl
> devd -F` when trying to attach a device using the driver domain.

Nothing has changed. On guest0 (the driver domain):

# xl devd -F
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
[  696.805619] xenbr0: port 1(vif2.0) entered blocking state
[  696.810334] xenbr0: port 1(vif2.0) entered disabled state
[  696.824518] device vif2.0 entered promiscuous mode

While on dom0:

# xl network-list guest1
Idx BE Mac Addr.         handle state evt-ch   tx-/rx-ring-ref BE-path
0   1  00:16:3e:18:52:ac     0     6     -1    -1/-1 
/local/domain/1/backend/vif/2/0

The same with using strace gives the following output:

# strace xl devd -F
execve("/usr/sbin/xl", ["xl", "devd", "-F"], 0xffffeed242a0 /* 13 vars 
*/) = 0
brk(NULL)                               = 0xaaab092a8000
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such 
file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=7840, ...}) = 0
mmap(NULL, 7840, PROT_READ, MAP_PRIVATE, 3, 0) = 0xffff986e2000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxlutil.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0200\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=68168, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff986e0000
mmap(NULL, 131784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98694000
mprotect(0xffff986a3000, 65536, PROT_NONE) = 0
mmap(0xffff986b3000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff986b3000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenlight.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\16\2\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=861848, ...}) = 0
mmap(NULL, 925752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff985b1000
mprotect(0xffff9867e000, 61440, PROT_NONE) = 0
mmap(0xffff9868d000, 24576, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xcc000) = 0xffff9868d000
mmap(0xffff98693000, 56, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff98693000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxentoollog.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0P\r\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=10368, ...}) = 0
mmap(NULL, 73904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff9859e000
mprotect(0xffff985a0000, 61440, PROT_NONE) = 0
mmap(0xffff985af000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff985af000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libyajl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\22\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=38728, ...}) = 0
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98584000
mprotect(0xffff9858d000, 61440, PROT_NONE) = 0
mmap(0xffff9859c000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff9859c000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300j\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=113184, ...}) = 0
mmap(NULL, 192872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98554000
mprotect(0xffff9856e000, 65536, PROT_NONE) = 0
mmap(0xffff9857e000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a000) = 0xffff9857e000
mmap(0xffff98580000, 12648, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff98580000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320I\2\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1428872, ...}) = 0
mmap(NULL, 1502000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0xffff983e5000
mprotect(0xffff9853c000, 61440, PROT_NONE) = 0
mmap(0xffff9854b000, 24576, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x156000) = 0xffff9854b000
mmap(0xffff98551000, 11056, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff98551000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenevtchn.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\f\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=10240, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff986de000
mmap(NULL, 73856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff983d2000
mprotect(0xffff983d4000, 61440, PROT_NONE) = 0
mmap(0xffff983e3000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff983e3000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenctrl.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\203\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=154752, ...}) = 0
mmap(NULL, 218504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff9839c000
mprotect(0xffff983c1000, 61440, PROT_NONE) = 0
mmap(0xffff983d0000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff983d0000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenguest.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0PB\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=77248, ...}) = 0
mmap(NULL, 140880, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98379000
mprotect(0xffff9838b000, 61440, PROT_NONE) = 0
mmap(0xffff9839a000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0xffff9839a000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenhypfs.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300\16\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14432, ...}) = 0
mmap(NULL, 78048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98365000
mprotect(0xffff98367000, 65536, PROT_NONE) = 0
mmap(0xffff98377000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff98377000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenstore.so.3.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 
$\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=31176, ...}) = 0
mmap(NULL, 107088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff9834a000
mprotect(0xffff98350000, 65536, PROT_NONE) = 0
mmap(0xffff98360000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff98360000
mmap(0xffff98362000, 8784, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff98362000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\20\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
mmap(NULL, 77920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98336000
mprotect(0xffff98339000, 61440, PROT_NONE) = 0
mmap(0xffff98348000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff98348000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxentoolcore.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 
\10\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=6104, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff986dc000
mmap(NULL, 69768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98324000
mprotect(0xffff98325000, 61440, PROT_NONE) = 0
mmap(0xffff98334000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xffff98334000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\21\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
mmap(NULL, 77840, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98310000
mprotect(0xffff98312000, 65536, PROT_NONE) = 0
mmap(0xffff98322000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff98322000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\30\0\0\0\0\0\0"..., 832) 
= 832
fstat(3, {st_mode=S_IFREG|0755, st_size=30680, ...}) = 0
mmap(NULL, 94240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff982f8000
mprotect(0xffff982fe000, 65536, PROT_NONE) = 0
mmap(0xffff9830e000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9830e000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libnl-route-3.so.200", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\200\327\1\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=536688, ...}) = 0
mmap(NULL, 609024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98263000
mprotect(0xffff982de000, 65536, PROT_NONE) = 0
mmap(0xffff982ee000, 32768, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7b000) = 0xffff982ee000
mmap(0xffff982f6000, 6912, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff982f6000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libnl-3.so.200", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360\221\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=141304, ...}) = 0
mmap(NULL, 205192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98230000
mprotect(0xffff98251000, 61440, PROT_NONE) = 0
mmap(0xffff98260000, 12288, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x20000) = 0xffff98260000
close(3)                                = 0
openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0#\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=31032, ...}) = 0
mmap(NULL, 94568, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98218000
mprotect(0xffff9821f000, 61440, PROT_NONE) = 0
mmap(0xffff9822e000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9822e000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libfdt.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000#\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=38800, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff986da000
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff981fe000
mprotect(0xffff98207000, 61440, PROT_NONE) = 0
mmap(0xffff98216000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff98216000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxengnttab.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\20\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14368, ...}) = 0
mmap(NULL, 77984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff981ea000
mprotect(0xffff981ed000, 61440, PROT_NONE) = 0
mmap(0xffff981fc000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff981fc000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxencall.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\17\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
mmap(NULL, 78064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff981d6000
mprotect(0xffff981d9000, 61440, PROT_NONE) = 0
mmap(0xffff981e8000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff981e8000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenforeignmemory.so.1", 
O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\16\0\0\0\0\0\0"..., 832) 
= 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14392, ...}) = 0
mmap(NULL, 78000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff981c2000
mprotect(0xffff981c4000, 65536, PROT_NONE) = 0
mmap(0xffff981d4000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff981d4000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxendevicemodel.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\23\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
mmap(NULL, 78008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff981ae000
mprotect(0xffff981b1000, 61440, PROT_NONE) = 0
mmap(0xffff981c0000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff981c0000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libbz2.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\27\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=70472, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff986d8000
mmap(NULL, 134160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff9818d000
mprotect(0xffff9819d000, 61440, PROT_NONE) = 0
mmap(0xffff981ac000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff981ac000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/liblzma.so.5", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\3403\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=153496, ...}) = 0
mmap(NULL, 217104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98157000
mprotect(0xffff9817b000, 65536, PROT_NONE) = 0
mmap(0xffff9818b000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff9818b000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/liblzo2.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320&\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=120648, ...}) = 0
mmap(NULL, 184336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98129000
mprotect(0xffff98146000, 61440, PROT_NONE) = 0
mmap(0xffff98155000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c000) = 0xffff98155000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360%\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=92056, ...}) = 0
mmap(NULL, 155664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff98102000
mprotect(0xffff98117000, 65536, PROT_NONE) = 0
mmap(0xffff98127000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x15000) = 0xffff98127000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff98100000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff980fe000
mprotect(0xffff9854b000, 12288, PROT_READ) = 0
mprotect(0xffff98127000, 4096, PROT_READ) = 0
mprotect(0xffff98155000, 4096, PROT_READ) = 0
mprotect(0xffff9857e000, 4096, PROT_READ) = 0
mprotect(0xffff9818b000, 4096, PROT_READ) = 0
mprotect(0xffff981ac000, 4096, PROT_READ) = 0
mprotect(0xffff985af000, 4096, PROT_READ) = 0
mprotect(0xffff98334000, 4096, PROT_READ) = 0
mprotect(0xffff981e8000, 4096, PROT_READ) = 0
mprotect(0xffff981c0000, 4096, PROT_READ) = 0
mprotect(0xffff981d4000, 4096, PROT_READ) = 0
mprotect(0xffff981fc000, 4096, PROT_READ) = 0
mprotect(0xffff98216000, 4096, PROT_READ) = 0
mprotect(0xffff9822e000, 4096, PROT_READ) = 0
mprotect(0xffff98260000, 8192, PROT_READ) = 0
mprotect(0xffff982ee000, 16384, PROT_READ) = 0
mprotect(0xffff9830e000, 4096, PROT_READ) = 0
mprotect(0xffff98322000, 4096, PROT_READ) = 0
mprotect(0xffff98348000, 4096, PROT_READ) = 0
mprotect(0xffff98360000, 4096, PROT_READ) = 0
mprotect(0xffff98377000, 4096, PROT_READ) = 0
mprotect(0xffff983e3000, 4096, PROT_READ) = 0
mprotect(0xffff983d0000, 4096, PROT_READ) = 0
mprotect(0xffff9839a000, 4096, PROT_READ) = 0
mprotect(0xffff9859c000, 4096, PROT_READ) = 0
mprotect(0xffff9868d000, 8192, PROT_READ) = 0
mprotect(0xffff986b3000, 4096, PROT_READ) = 0
mprotect(0xaaaaceff0000, 4096, PROT_READ) = 0
mprotect(0xffff986e7000, 4096, PROT_READ) = 0
munmap(0xffff986e2000, 7840)            = 0
set_tid_address(0xffff980fe0e0)         = 882
set_robust_list(0xffff980fe0f0, 24)     = 0
rt_sigaction(SIGRTMIN, {sa_handler=0xffff9855a570, sa_mask=[], 
sa_flags=SA_SIGINFO}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {sa_handler=0xffff9855a630, sa_mask=[], 
sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, 
rlim_max=RLIM64_INFINITY}) = 0
brk(NULL)                               = 0xaaab092a8000
brk(0xaaab092c9000)                     = 0xaaab092c9000
newfstatat(AT_FDCWD, "/etc/libnl/classid", {st_mode=S_IFREG|0644, 
st_size=1130, ...}, 0) = 0
openat(AT_FDCWD, "/etc/libnl/classid", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1130, ...}) = 0
read(3, "################################"..., 4096) = 1130
read(3, "", 4096)                       = 0
close(3)                                = 0
ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) = 0
pipe2([3, 4], 0)                        = 0
fcntl(3, F_GETFL)                       = 0 (flags O_RDONLY)
fcntl(3, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
fcntl(4, F_GETFL)                       = 0x1 (flags O_WRONLY)
fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  = 0
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 5
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 6
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 7
ioctl(7, _IOC(_IOC_NONE, 0x50, 0xff, 0), 0) = -1 ENOTTY (Inappropriate 
ioctl for device)
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 8
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 9
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 10
ioctl(10, _IOC(_IOC_NONE, 0x50, 0x5, 0x10), 0xffffd0b60960) = 0
newfstatat(AT_FDCWD, "/var/run/xenstored/socket", 0xffffd0b60d90, 0) = 
-1 ENOENT (No such file or directory)
faccessat(AT_FDCWD, "/dev/xen/xenbus", F_OK) = 0
newfstatat(AT_FDCWD, "/dev/xen/xenbus", {st_mode=S_IFCHR|0600, 
st_rdev=makedev(0xa, 0x3e), ...}, 0) = 0
openat(AT_FDCWD, "/dev/xen/xenbus", O_RDWR) = 11
openat(AT_FDCWD, "/etc/xen/xl.conf", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
read(12, "## Global XL config file ##\n\n# S"..., 4096) = 1602
close(12)                               = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 262158
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) = 0xffff986e3000
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 4096
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b609c0) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b60990) = -1 EPERM 
(Operation not permitted)
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b60cb0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b60cb0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffd0b60cb0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
pipe2([12, 13], 0)                      = 0
fcntl(12, F_GETFL)                      = 0 (flags O_RDONLY)
fcntl(12, F_SETFL, O_RDONLY|O_NONBLOCK) = 0
fcntl(13, F_GETFL)                      = 0x1 (flags O_WRONLY)
fcntl(13, F_SETFL, O_WRONLY|O_NONBLOCK) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0\6\0\0\0", 16) = 16
write(11, "domid\0", 6)                 = 6
read(11, "\2\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0", 16) = 16
read(11, "1", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
pipe2([14, 15], 0)                      = 0
futex(0xffff98349048, FUTEX_WAKE_PRIVATE, 2147483647) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
mmap(NULL, 141168, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 
0) = 0xffff980db000
mprotect(0xffff980dc000, 137072, PROT_READ|PROT_WRITE) = 0
rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1], 8) = 0
clone(child_stack=0xffff980fc0e0, 
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
parent_tid=[883], tls=0xffff980fd000, child_tidptr=0xffff980fc940) = 883
rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\4\0\0\0\0\0\0\0\0\0\0\0\34\0\0\0", 16) = 16
write(11, "/local/domain/1/backend\0", 24) = 24
write(11, "3/0\0", 4)                   = 4
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\1\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", 16) = 16
write(11, "/local/domain/1/backend\0", 24) = 24
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = -1 EAGAIN (Resource 
temporarily unavailable)
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\1\0\0\0\0\0\0\0\0\0\0\0\34\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif\0", 28) = 28
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = -1 EAGAIN (Resource 
temporarily unavailable)
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\1\0\0\0\0\0\0\0\0\0\0\0\36\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2\0", 30) = 30
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
futex(0xaaab092a92e0, FUTEX_WAKE_PRIVATE, 1) = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0'\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 39) = 39
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAIT_PRIVATE, 2, NULL) = -1 EAGAIN (Resource 
temporarily unavailable)
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\n\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0", 16) = 16
write(11, "1\0", 2)                     = 2
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\n\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0", 16) = 16
write(11, "1\0", 2)                     = 2
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\4\0\0\0\0\0\0\0\0\0\0\0*\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
write(11, "2/1\0", 4)                   = 4
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0'\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 39) = 39
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=736000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=719257893})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=703000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=692405877})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=675000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=652580293})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=628000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=626201831})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=608000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=606705200})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=587000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=579627984})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0'\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 39) = 39
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=446000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=402461923})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0'\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 39) = 39
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
read(14, "/", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=173000000}, NULL, 0) = 1 ([{fd=14, revents=POLLIN}], left 
{tv_sec=9, tv_nsec=146785969})
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0'\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 39) = 39
futex(0xaaab092a93b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
read(14, "/", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0&\0\0\0", 16) = 16
write(11, "/local/domain/1/backend/vif/2/0/"..., 38) = 38
futex(0xaaab092a93bc, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab092a9360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, {tv_sec=9, 
tv_nsec=13000000}, NULL, 0

>>>>> close(6)                                = 0
>>>>> close(5)                                = 0
>>>>> munmap(0xffff9f45f000, 4096)            = 0
>>>>> close(7)                                = 0
>>>>> close(10)                               = 0
>>>>> close(9)                                = 0
>>>>> close(8)                                = 0
>>>>> close(11)                               = 0
>>>>> close(3)                                = 0
>>>>> close(4)                                = 0
>>>>> exit_group(0)                           = ?
>>>>> +++ exited with 0 +++
>>>>>
>>>>> royger told me that it is a BUG and not an issue with my setup. Therefore here I am.
>>>
>>> Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
>>> parse_global_config will prevent xl from being usable on anything
>>> different than the control domain (due to sysctl only available to
>>> privileged domains). This is an issue for 'xl devd', as it won't
>>> start anymore.
>>
>> These look non-fatal at first glance?
> 
> Indeed. I was too quick reading the trace and assumed `xl devd` exited
> due to the errors, but those are non fatal, the process just
> daemonized.
> 
> Thanks, Roger.

Cheers,
Andrea

