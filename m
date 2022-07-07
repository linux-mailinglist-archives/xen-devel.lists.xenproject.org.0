Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75856A1BB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 14:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362964.593260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QH0-0004QL-SS; Thu, 07 Jul 2022 12:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362964.593260; Thu, 07 Jul 2022 12:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QH0-0004Nl-Oi; Thu, 07 Jul 2022 12:06:22 +0000
Received: by outflank-mailman (input) for mailman id 362964;
 Thu, 07 Jul 2022 12:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9QGy-0004Nf-Sp
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 12:06:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35ddf175-fded-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 14:06:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 12:06:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 12:06:16 +0000
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
X-Inumbo-ID: 35ddf175-fded-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfUJgS2kEaAfU/FgDEh6VHuzNjjCljA5lsCFJseznkRScjelIhBXXuNVEq9ZORBNrjwzipQ0Q1eUEIOxyJtc7Xv7byGuG25P96aQrNzdpNwkTxMIIsD0KJ/HJbmIVv/GeCQmgVddBg+cAO5tlDGpA2AQX073dsaErDe/fv56uqLvIlPRJDOuvVb2UyDvn25SKSyeeJb6nhjTs2X+t18r9GGUTgn0FjdiWWJDcJr9RcZjDRZboyawFS/a85SWlMzlOzKxUZv/5w9aw5c4y4ZF/uyvwAbsZgKww9FoQvwuKoYp3DRF5CqOswF/1hhMGjiQT0YRUESK/Pi2eFvF19Z1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGgmhBBHbPLjkajTGvRH38P2O1b/8d/vclKAYv/dbfM=;
 b=Hqsz+tvBPgkQQjkKg4UV80E7Xndlm3gZMG53VoKtnye1JAFKHUfbTgEIHPyZaJB7cwrqPLuhomB2/Tl+1rv/hS+P4IJUAdLiXZWx5KO37Mn1aVxuy8AI/hz57G73stiKYFs7qTLLpxB1z+N97DFD0D78VeY5Eu+xTa7ZrlxAozn6zYJu4nMkFFbTT7OfXOClAT6ltr+vAO6XWR4uXWfMFhkUMpUUmPSQ7Safsr6K9wz7ETUOA1nvXunn4aRNiRvBkuhRVtDTX9MQVB9YT9Xs3Cfxg9qN8ijvyX/bJT8mu8urTug0HMFOGPYz1BfKb30j8w7cBQCxTzylhg0OrHZyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGgmhBBHbPLjkajTGvRH38P2O1b/8d/vclKAYv/dbfM=;
 b=iwbnEJFNCQnVUg1OCnY0wmhx9/DhJP3WjZcnicHzj3wDI26QIntNT/d1rxPvjSZiGsCEXxRkvGTd28+E09kVDsivhce5KD2y2/QmjSUrvGyLcOLl1Jmc/UDAjzIlM/iCC2WZkdCALlaQIzJCmKdIElSlhKLXkmMcRl/WdaHr7u4F1N9bgNMit3mkAeOw1yXwhZU+Zt6kR/hZhdXGnVJ094UB9N+szvKD6tLGZwgoWDBJsgw+Jf7cpY8KKliyJRC+CscW2tXRR4/VqbV8DmQa+l3T5i5SK6+yI0ojr2irX3hWSrfaNOFKbTNf8ktcJQtcmfkRmLqPLxJ9M8tbMkrlLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db90aa82-89fc-8423-ecc0-ab1c3a4bbce3@suse.com>
Date: Thu, 7 Jul 2022 14:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
 <9916754f-b730-6201-5225-167995f69b51@suse.com>
 <AS8PR08MB799100B72C4DE86A0CA1F20F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9f40f2c0-f586-a1cc-75c5-a0f339b89848@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9f40f2c0-f586-a1cc-75c5-a0f339b89848@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0041.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf3468a-e08b-423f-5ea4-08da6011182d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8887:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pWwi2WY3r3IF0JMYPyc+5D7WKfOCyFz1YCaLLEWJf4iUgZ2Hbi0GU31Zv2vUv9UrO3GCu1rA67zIM9Z2BojxRiMcI3i3jlcPGbYSKXhG6hKPiKEwP7aHoCh3bUxsP8szSTL60wXV6EnznVV7BGplkzrbbsRA59nCZjJna003STVtO5A67+GqzmCRWdhPyncvcVf46yOobN76HPPuFaixwLithj/n8M05wxFuewkCCGoob6bVjsqT5k8U+igP2HjEe+vquTgDn93L8HBjNkM7RExdxJ/eWO5GapooRvSod0FmPm7gy2DtoaW8nuzf+R4tFIFugEvJ6dpC9kppbOCrz8kujzHnq9xigMJE+dTji+sZbu/j0uOECaq/kN26CITMPrOTbChIuQWxVq9HoOnPMXJzxYUrPrixdDPAxe8O3wkvBTe21fghLoT5XHLMYgBL+RUGcnutSMzkAAnb3ZMxTVyxbz9ZpzZt+w2jVdykY0WRQWheRcWoQ763h7zPfQCFvEevf/F7pKXSoYQk83didjliiXmWbtoeotiNu+WELssUfELFIK84oauhK71gqJ4T7Jimk7QNAtC5fAQD5G0/WBI+H+kOL4Vy2ugV4vltK3pTE2wUX8ieZyhKhNHKEgRM8Ec6Qh3g8KbX9SU0hSaCeOkdaBFKRGEImUGBmTrFrLEdSeOs5PuzNKXjwyMQFCogHQ5L+AWaRe5Vomr0JLNUEEcWax2s4YR00n97vGx6gIUzHUcoHFjzgCY7E5tv8KgQOQ8MqwaKdDnAK09+B8iMfm+VjzQq8wr0q5l+60TBbW7It3sAcF3X74BP6MTAr2UXXRjj6VNmW+I8rlsjN4fpRAaNWYZm5z4SM6uD3WoYZwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(136003)(376002)(396003)(346002)(31696002)(8676002)(66476007)(86362001)(66946007)(26005)(8936002)(6916009)(31686004)(6512007)(54906003)(2906002)(5660300002)(38100700002)(66556008)(4326008)(83380400001)(186003)(6486002)(36756003)(2616005)(6506007)(478600001)(53546011)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0I2emt2eVhKSnRtQnkwd1YxeEY0VGljQmQ2R2VDUzdGYytvcmttZ0RQS0dr?=
 =?utf-8?B?ckN6c2ZJSzdrV0pIWGh0VE1PandKREVmWXVRR21WT3dHNUhuWlUxYlprYWM5?=
 =?utf-8?B?YnIwcytrRXhBWFhYT0ZxeW1zb0NCRktPYkdaN3lCcnl2VkRKeHNVWkFHRmVD?=
 =?utf-8?B?T3ZYZE9rd28vMDRVSktlSGkvR3ljdG1QQXIrQTFpMFM4bFF5ampFdDJnL2tC?=
 =?utf-8?B?Tk1mU0o5WTRObjZlNUxDMTN2TkFBaFExM3BnUlJSak45NGx1YWx1Qk1za1ZG?=
 =?utf-8?B?SGR4UHF6QnlRdFgvakszbWdyV1N2aUJzWnZ0ZkpDc284MHlCVDJPLzVhMDZk?=
 =?utf-8?B?WHR6b2wvR1h3Uy9aak1zalZqanpKWENUanVMT3QxQktCMHh5dnozU1E3VTlC?=
 =?utf-8?B?U21pdXdJM1RsRDQrYzhHOGcxOVdLcTNLOG4wTEtvSGVFWWk0azFla3FNenhL?=
 =?utf-8?B?NG1ETm1FTmVlWjUzYmVyYStoV2hsZytwTXBDNXFod3VPVEl4RmNXWC90UnZO?=
 =?utf-8?B?c05qeFVSelM1ckN2M3FKL3NUdXM0TkIyTkp1UUFjcEgwMjc0WWIrd2thdHBi?=
 =?utf-8?B?d3Npa05kR2ZWaVEzeTNZWXRJZEE5Z3dMcjBPbFFDakJzME10UlRpQkoxTXll?=
 =?utf-8?B?ZjJ5Y1labTZBbGx6eTAzRlBQa0s3My8xUDdxb05Tb0pxWkEyOTY3ckprb3ky?=
 =?utf-8?B?M3pwSndtSWk5RHlrdktybU54UCtkeGYyM0ZPeXR5NjByYVBVS1BBeEc2T1FY?=
 =?utf-8?B?OFlScElmelIwMFhkaEU1LzI5eHVlNW81UDVsbWJUY2hVdFF3ME9YT3RqWFVC?=
 =?utf-8?B?YS9Ya1ZjREZ5YW5iaEE1NEhBYkdjaXBoMGV6QVpSTUVkNWtLbk92cnAvYVRO?=
 =?utf-8?B?MmhXSHdHSEtQYlQ0bUpZQXloMldnQlBJZk1hcndwVkZqK1Erdjk4QWpVRERz?=
 =?utf-8?B?OEd3bzJncCtlc1U5anBBMUt3RVZqUXBKQkNyZVYwUW01aVphMytqQ01laU9l?=
 =?utf-8?B?YzhOTW9rRkZQQ1BqdzVoWFR1Mis1ZmpkeWVYdjBqckN1aWQ2R0t0OFE2T3Vy?=
 =?utf-8?B?SzIxQUNrUTVOV04wSXhNMGhyTmFTMUloTUFJRkkxVVpFN21jdE9VZ2YweDZM?=
 =?utf-8?B?dFNtemN4VDlzTXZ3WFJDVVRnOXlvMzN6VEVTUzByZjNFajZVb3dRRWI2dFdL?=
 =?utf-8?B?N2VRVU9wR3JENFpHQjRab0g0VDNYR3hFa011QXprSjhWd3ZFYkVicTI3Y1Uv?=
 =?utf-8?B?QVRhTm1JTGZlK1lQRlU0RWlGL1UrMVVDRnk3TDVVKzAranFLYlR5Nlg4QkJ2?=
 =?utf-8?B?UHh2THl0WERWUllHL0REY0ZxZTk2Vko1anQ1bFE2Zjc3TFVHSXMvcmRPV2lE?=
 =?utf-8?B?NlM4WjNsY2RtZVFlMU1aNTN6VVFEOElaamhFenpKemR0b3E3VVVWR29wNTVV?=
 =?utf-8?B?WHpKSEhFbFFscHFMdk5rKzVvb1FYTnNDOENYRmZXT2doZTg5RzlPdFNjaDBh?=
 =?utf-8?B?alVOZXBjczAwS0xPSkZKK0tKWTFhWlN2bXlCSnpISVRRNmJDQmc3TWxwZ0tJ?=
 =?utf-8?B?U29nYXlpVlhabEIxQi85YmZsUzBUcjRyNld5dUtLQ2paLzRFOXNMZ1VVdTFl?=
 =?utf-8?B?ZGVsaTdXNFNNSWZrMnlOb3Nwbi85ZnpYOHpWMVZ5bVNZck5HMlNDU2xjc0ZM?=
 =?utf-8?B?TktpYWE4YlBIMzJ5VjZuVElnNkU0cElJUU9mNExRQWdBdGE4QmdqV1BsZUVp?=
 =?utf-8?B?OVI0dDBraGgrVEV3bzJ2b0luRUV5cEJid3JKa1RtQ3BmbkFWbStqejhsYTNy?=
 =?utf-8?B?dVJiT2wwUEdiUUlGZitSZUtXRkg2MUl0TGI2c2twUXFtazI0TWc1V3d1RmZ5?=
 =?utf-8?B?Z0ZGM0kvS21mbzNIS2NMS1l6VlgzdEI3alV1S0UxU2wvc2tScncvMUxSZ2tw?=
 =?utf-8?B?NnBta2tSMmpVZ2JHd3p5SGpJSng5NVJzaVpMSCtmdWp5VHQ4M3ZrZ0NQVDVQ?=
 =?utf-8?B?WktxWDAvYkFTTE0vTkNqcmpPQVF0YzU5L2UwSVhUSlZzcG1IQURkQS84U0xU?=
 =?utf-8?B?R0VjdTdXa2w3a1RTQ0VJT2s5bzZ4ZkVqV2VySzhrcStsU0FTSlBYNHJ2eFcv?=
 =?utf-8?Q?BFaUxaPVMFVoRGbQTsYHLWTi/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf3468a-e08b-423f-5ea4-08da6011182d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 12:06:16.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5HKn1Z81W9vgvpKCkPkZJQyAmRw4898qnhszw90597PFWNtnB52yV965n1I+eMqPemuO7DMLr05yYc/5gfL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887

On 07.07.2022 13:58, Wei Chen wrote:
> Hi Jan,
> 
> On 2022/7/6 13:44, Henry Wang wrote:
>> Hi Jan,
>>
>>> -----Original Message-----
>>> Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
>>>
>>> On 09.06.2022 17:52, Jan Beulich wrote:
>>>> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
>>>> there's no intermediate step (mkelf32 there) involved which would strip
>>>> debug info kind of as a side effect. While the installing of xen.efi on
>>>> the EFI partition is an optional step (intended to be a courtesy to the
>>>> developer), adjust it also for the purpose of documenting what distros
>>>> would be expected to do during boot loader configuration (which is what
>>>> would normally put xen.efi into the EFI partition).
>>>>
>>>> Model the control over stripping after Linux'es module installation,
>>>> except that the stripped executable is constructed in the build area
>>>> instead of in the destination location. This is to conserve on space
>>>> used there - EFI partitions tend to be only a few hundred Mb in size.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> GNU strip 2.38 appears to have issues when acting on a PE binary:
>>>> - file name symbols are also stripped; while there is a separate
>>>>    --keep-file-symbols option (which I would have thought to be on by
>>>>    default anyway), its use so far makes no difference,
>>>> - the string table grows in size, when one would expect it to retain its
>>>>    size (or shrink),
>>>> - linker version is changed in and timestamp zapped from the header.
>>>> Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
>>>> Directory size (1c) exceeds space left in section (8)").
>>>>
>>>> Future GNU strip is going to honor --keep-file-symbols (and will also
>>>> have the other issues fixed). Question is whether we should use that
>>>> option (for the symbol table as a whole to make sense), or whether
>>>> instead we should (by default) strip the symbol table as well.
>>>
>>> Without any feedback / ack I guess I'll consider this of no interest
>>> (despite having heard otherwise, triggering me to put together the
>>> patch in the first place), and put on the pile of effectively
>>> rejected patches.
>>
>> I did a test for this patch on my x86 machine and I think this patch is
>> doing the correct thing, so:
>>
>> Tested-by: Henry Wang <Henry.Wang@arm.com>
>>
> 
> Because there was no Arm EFI environment in hand at the time, Henry only 
> tested the x86 part.I have setup an Arm platform with UEFI v2.70 (EDK 
> II, 0x00010000) today, and this patch works well when boot Xen as an EFI 
> application from UEFI shell.
> 
> But the binaries sizes are the same with/without this patch. Is it expected?
> I have enabled:
> CONFIG_DEBUG=y
> CONFIG_DEBUG_INFO=y

Well, the way "xen" is built (and "xen.efi" only being an alias
thereof), debug info is stripped in the course. That's quite
different from x86, where - with a new enough linker - debug info
is retained while linking (and it is truly linking by which
xen.efi is built), and hence can make sense to strip while
installing.

> Is there anything I should be aware to test this patch?
> 
> -rwxrwxr-x 1 weic weic 1081504 Jul  7 18:43 xen
> -rwxrwxr-x 1 weic weic 1081504 Jul  7 19:43 xen
> 
> Tested-by (Arm only): Wei Chen <Wei.Chen@arm.com>

Thanks. Btw the proper form of the tag, as of a couple of months
ago, is

Tested-by: Wei Chen <Wei.Chen@arm.com> # arm

Jan

