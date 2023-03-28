Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF616CC757
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 18:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515980.799433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBlF-0006o5-Cu; Tue, 28 Mar 2023 16:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515980.799433; Tue, 28 Mar 2023 16:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBlF-0006mN-8j; Tue, 28 Mar 2023 16:01:25 +0000
Received: by outflank-mailman (input) for mailman id 515980;
 Tue, 28 Mar 2023 16:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBlE-0006mH-GY
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 16:01:24 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe16::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c87d77f2-cd81-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 18:01:22 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7846.eurprd04.prod.outlook.com (2603:10a6:20b:2a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:01:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 16:01:19 +0000
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
X-Inumbo-ID: c87d77f2-cd81-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTlzIcLbI3edS8NnCDBe12i0PcdVQDvxhy4gVUxd+mo79llkPcm+g8+ZB+/03zmWyeduBHMURRTOKBU0i4zyvWZdufSyHWkJ64ufobvzB/xxKrJ4FYu9qlwMNBT/DLH2hJ+eVgucNXkSwA1Og90F3XIBjKF/DM+0/9cOWEirjWmznGKQKq8iAxFNBEHSYywbIVvAtnYGQ30Zo+s23OGt3CP5wDT3D2p8V1RsJfLQsjJ70eGCOO1D+sau8bbfyuHfUg3dz1IWDZMR4Zr8zIaq7hEzB0t+APTqADYBpDQWL5gMjqk5ZltwuwgZjHGXEA1WTtyk7yE+2vYlBlMpsbq0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRvuKYbS+QJL6709WtQbaCoWNTCNq1Sg0Yqg/TCmN3s=;
 b=HCDRvYUTp275Ft+Gk5dVLJvnTh55oexzeC3W+0jX0NEsGoWRYEbinyhGdhce896u7O3EJCsht+su68tS1DR19+fK6vrczZSzxLpHDNymT7kRBaeo1DL1doJqt+LmXwTKmX7HnpaOG8O+J84aGMao4LQ9FI/sMn9W/R1eR2L9bsG05aLdH/DgvyJ03kqN5Ag1A0GtygF9j59SmgOQh3ao7oyyaMEgIhJmMtiDXsCNoV9krtV9af4RSQkKLT8enZ8G73ZR9z3CNSj+ywDxz67dMyj74kOxCg8cwARi+sA1zjHKis/i4BhOlLcmQ0AP/a9WMeG/ceMUQCLuLng98ib33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRvuKYbS+QJL6709WtQbaCoWNTCNq1Sg0Yqg/TCmN3s=;
 b=XG4PZp2LCPIehfOwiLqdvuoBkh9TKlYwAryl/lih9+hETLuvbZX459iuI74NzUjNYn/dS23BkpKrAt+Bx32qfdrUc9+CawT7vlancCVeWDBOWRyt0Ma7ys1Mb7vX4DmYsfluYpm0ZodZDgbkXNRa97MMh/KDPtjo6K3H8GiyjOsOOs5hlMhJr4ufUc3+OdlcRcDgWVXN9LzXk8C4z039jVQ1ker7Udl837Io5JLWaGXvv8g1SHxhANz8u47l+fBOYzmbGUV/6JXilkM4NhQOiJoEeO1uDrd9C//N0fNiAnwEfV7RznrHY7wNrVeUWqBL3E+swK2xPHBlbRx6Ymt3qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf6a0e24-ef24-57bc-b53d-919cf494ee63@suse.com>
Date: Tue, 28 Mar 2023 18:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-5-andrew.cooper3@citrix.com>
 <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
 <61f32d99-67b7-d7f9-db93-12105266a03f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <61f32d99-67b7-d7f9-db93-12105266a03f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::21) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4c2b5f-2c06-4139-6ade-08db2fa5ab4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ni0bBbwH3u7I954rlqZmtpY9fBwUD+ncUqGR4ISJ7r4ke1vvxapqgJwQbYONvwlifWi5UU9LwJ6I6WzoqTPdkQQYz2e4URmnifeOqG3F5FlxKvotZI2u8jZ/he/iNKCC8tC5psvhZwHh6ZChSUPf2SiLaqmZMeQPrvDQUpvlbvUi22j7MZEiuwlqod22T7ZmiymRuoct5ZE01D50xj0JcKbn4voSkTXeACWF4Orc2XOywmfYUMpFSWsEwxLdpfTF/ZvlQC56Dr8uQlVT/Y3ZRJjYPdlR1oJYW0G5bNuijataAONY+mY8nYgGT8bKT0u56r2zEF60naXl4aji6j8ID0yDZWWuSrDdBYgnZD0LW3DAmYakrtnpCgqBhFmRc/jX2NMwHdwIa4F3hS7HDbAIf03gJDFfYFx/Fbx77Hs/Y9t/4Y/h7GJV2gM4wBviWh4SsO4Ar4h/zrBCxK7jKSRDyDe5xn5txZ+GrYYNhfzwqPgtRcDyzgzFOzIvcDql86u8bDm7FDa9/jkUto6iZ5MoLv0VfSku+4ieP0+PIKAhw0EtTKh6XaFq1J75C1zhadDlUmM9UBKvGeaLyzCLxgJ5Sc9WKjbe4m4MFEMRT1Sy7xpe8pCbKux7aYBHnQSGFDOjDbYVATA7FwWtxHW8UptIjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(6486002)(478600001)(38100700002)(54906003)(8676002)(66946007)(2616005)(66556008)(316002)(186003)(26005)(6506007)(6512007)(31696002)(86362001)(66476007)(41300700001)(36756003)(4326008)(53546011)(6916009)(2906002)(8936002)(5660300002)(66899021)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZIS3FPS1oxTWpaNkhsVVQxNHpDZE1KTGVnMkpwR1ZIUFhuTFZKL0RBMTRC?=
 =?utf-8?B?YWwwVm56ZkZ1Q2YwOHFWaWJETU1MUnlNWXFTaGNLUmE2UFlGWjAvMy9aeXpC?=
 =?utf-8?B?eDRoL2U4QWg3bzFJN3l5L0hjRGpUem92Y3QxZkJnRDR1NVlaajBTblByU1o1?=
 =?utf-8?B?cEV2eG1ZUjY4LzAvdkdXOElla0syNXJobDBpR2VaclJjRWg1anVaOVVqZFJo?=
 =?utf-8?B?aTNLZEJVZlhGSDI0MXVGUUs4cmlmelpXbTB3SnowdDNaV1RtdUg4ZE1vRWpD?=
 =?utf-8?B?ZDdPN0tOVU40S0FCUnl1UjdmWDBBdFZtRnJnSE5nY0QrQ2FJYy9WWk1zeWtE?=
 =?utf-8?B?NXBGOENGbDdxSjh4emhrbDFJOUFLTHhvcXcwajZrcjBRL09yc05vRWxmeFN4?=
 =?utf-8?B?a2FLUXhaKyt2U2I0b2RydW93UWlYSWNXMlQyYzFlT0FqK3lFSFJZc0VRcGJ1?=
 =?utf-8?B?NGZPYitEVm1aOVpySUR5RUFPdU5OMzBpTHVmaW1seXZaTFNEbGtxejM2UkQw?=
 =?utf-8?B?QmtRaktxVkRTNmtXUm5Ja1BONCtiQzZnS3ZRYnd3bmdTeHVGMmZ0NEFJeVl6?=
 =?utf-8?B?WUt6ZnRXVC82NWZUTjdXdm14QjMvUFpCVEhYTWhybEpLU3pKeXZiMlJnTENy?=
 =?utf-8?B?azhBODV5dmhyQ2xIdFh6eVprRzlNYW5yNW9IdjE4MWNZTHZiSE4rL2JOQzdI?=
 =?utf-8?B?eVRGeWd1TU8yR2oreEZlemlVb0cxdlYwZGZybWZmT1lPUWZLZDZReXAzV25O?=
 =?utf-8?B?NUJKeGlDL3NGVHphUDNkVlFPZU5GRGZUUDNsYVZ5cmRrZG5FcFh6dElEVHIv?=
 =?utf-8?B?OXo5c3BPMnBUeWV5bm5CcXhXYU41VlN1cTkrUjlFWmVyUHhXS3JCOGE1amJ6?=
 =?utf-8?B?OWF6eHBuOGhZdUpod01TaElEcURHZnZyNGNGck93allSMzh5MlFXczMxRGNL?=
 =?utf-8?B?YTFaQ0l4dHJSY1FuTjlrWDE4OUNmV1lncG0rZTJQV3N5aGtYeU14YXR2QWho?=
 =?utf-8?B?VzhjcS9WT2puU3FxTlRiTmk3NzI3cm9zaUxnSkZMU01rL3ZjNWNqMUNEQTBQ?=
 =?utf-8?B?Wk1lYmoxR0hzNFBUNmhrRmg2RlRzY1dYaGJOU3dSOFZyc2kwbmRMaldrZjI2?=
 =?utf-8?B?TWtmVnkrY2EvWHQ0ak1qUFVSMDFNd0FzcXlXdC84V0M4emliWXJxa2FJdTI3?=
 =?utf-8?B?YVJvalBqc3BoNUxiTFlqOS9yaFJObDE2UjlKVUJsMVhEZnRnMWMrZHc0TlZo?=
 =?utf-8?B?SkR5UmhWRUcvNDlhdTNnUThsaUxVcWgzTDNMV1BjUnUyQ3dQbE4vYVRGcnFx?=
 =?utf-8?B?UVVPOEtIZ21NWUVsMVlqSDF5Y1k0dkhvUU9xeVFOU0JTdC9XOFJOVWx5cDhh?=
 =?utf-8?B?djcvZXR3bFpSYXk5Lzg2Uy9GQkRkV1FKM0d6aFY1R1ZjbXVhcnlPcVVLNmVw?=
 =?utf-8?B?VEVxM0x2K2VwTE9CalNhaDhiOXB0Q2hCWFZxazhEMG5kMXJOZ1QyT2JOaGFE?=
 =?utf-8?B?WW9RbDRrNEFOWlhXdEVlVU8wTUN5dHNUNVJyQzV5b3UvMjc2a0RZc2M4ZlBm?=
 =?utf-8?B?VkllcC8xWWRUeDBXT3A4UTJHaHc4QWZtSy9UN1J0MVAvRitMbEFiT0NqMXps?=
 =?utf-8?B?L20vUTdDLzVra1ZBRWNYYVBueXE4Yy9WdTlaaFNING0wcnNJbytJVUprTFJV?=
 =?utf-8?B?VVI4TFB2K3dxWlFpMytmNGNmUUxKM1ZSak8ra0ZIbkV6cHEzMzMwUVRMZWFE?=
 =?utf-8?B?MTNJR3lNYk1uY0MvY3VFQW1vblRGdEw5V0xyOGwycUVWV3BzSlRKWk1CUHZm?=
 =?utf-8?B?djdjQm50MldqV3BVVFBWNEpyQUxPRitPYStoT3BYaDd1VStOY0lHQlFOcCtI?=
 =?utf-8?B?Vm1TUmNNTGRVaFFhK0VwNG40RXhlOW96WUx2aml3dzVkS2JYcFhvSlhwbjc5?=
 =?utf-8?B?cGw0YmU2MzJHY1dRK0xia3ZsRW5zaGF0Y3RSc2gwQ00rb3Nib2pFUWtRaHpx?=
 =?utf-8?B?dytGNXRYTHdXRTBsMlA5bkZaMzM1N2FadUpzNW9TclZONFVQL2x6STdqbzJp?=
 =?utf-8?B?UjVWZjBLRk1PRitPTGlrMitPM0lwQ3RIdmhBN3JLY3RySnZyc0tSMUZkSUhm?=
 =?utf-8?Q?ZWp8YWJTQ/3HJVtUT/q7ZLvTi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4c2b5f-2c06-4139-6ade-08db2fa5ab4b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:01:19.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyQOzVD3LaAuJi46dM00+DKC4ljVXHvK60ljVk1JnTSf1kohr1+tL8COgUNxZCH1ZS1kwTm4+pzta5khaumPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7846

On 28.03.2023 17:12, Andrew Cooper wrote:
> On 28/03/2023 3:19 pm, Jan Beulich wrote:
>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>> Right now, the boot flow depends on the second pass over
>>> bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
>>> alias of the CPIO module, where previously it caches the early boostrap
>>> mapping.
>>>
>>> If the scan is successful, it will be successful the second time too, but
>>> there's no point repeating the work.  Cache the module index, offset and size
>>> to short circuit things the second time around.
>> If the scan failed, it will fail the 2nd time too. Maybe deal with
>> this case as well, e.g. by clearing ucode_scan at the end of
>> microcode_scan_module() when nothing was found?
> 
> See patch 5.  It can only become true then because of how the callers
> are arranged.

Right, I've meanwhile seen you do it there. That's fine. Yet I think it
could also be done earlier (and if I'm not mistaken also ahead of all
of the rearrangements you do).

Jan

