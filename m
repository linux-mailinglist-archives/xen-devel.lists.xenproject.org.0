Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF487E2622
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628001.978987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0047-00033g-4r; Mon, 06 Nov 2023 13:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628001.978987; Mon, 06 Nov 2023 13:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0047-00031P-1d; Mon, 06 Nov 2023 13:54:55 +0000
Received: by outflank-mailman (input) for mailman id 628001;
 Mon, 06 Nov 2023 13:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0045-00031F-Qn
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:54:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e83f65a-7cac-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:54:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9865.eurprd04.prod.outlook.com (2603:10a6:10:4f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Mon, 6 Nov
 2023 13:54:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 13:54:48 +0000
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
X-Inumbo-ID: 0e83f65a-7cac-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a38QHW4l31WwgpnZGchyuAgSV6AiJLsHtjAwas6Gw/8XFo4ixohC2z62dHIxtYhAXdDvQv34nk09p0RLvWnyCb+InicBGV+xBjKkMBmnOPtui6eBu7D0CW7+v0e8Yohi2phTqyJdVtlPRibGB5xY3l7mOdfAlR4CIXFGJEgojmGfICBTBCQpoeUm5UDj9oPpQEg2VFge6Osy0l3c5EIEMTYp40iEkEmMy1eb2s89vZUxnBqRbcVNcoZIRFLCjGWAoT2EpYzse+bnVaPJpIZ4TJNGfFuoeMmFd5h4Y2/OmgSSU5+f9OP6miW2X7ux71PEO7qBueUnJWhaUCuaUQERBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnCVJruYxgBv2eG/1yjy9xmZRo9eW8MY0BXa4erKkTU=;
 b=kwtUQV9+sOHvgWtIq4EejIfiNFkUyxLkUTql7MHtBq6lG4hMKnMQnrYw8VkjIbrHprRLcymiuMLz+5W+lzyIopaHKT+hG7zJNNeUtzMW9AWaaaxf41jc1ARvp64axQh3JI2UGCDDotoJCKQc+sdL2sz91NT9hXqJeUAZ9rofdY9NgB/qvH6OA3xIh0/90hG/PchcY8zNZ8N8bTB1DDOueq5zGCtj2xaxjWQriwnp3QegmcXxP4yExRmu+xFP6h3slcJSSjKxrMEkN0hg0agKZYiJiUgp5JlPvOqTCGGA8A2QxOdlkc2xkQUiX9l7aR1V+E2tKOrmsByqiuW1Vwj8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnCVJruYxgBv2eG/1yjy9xmZRo9eW8MY0BXa4erKkTU=;
 b=wNbtFz2qDnOBSX629PNYIiLGSW5/84dpUt9P5MZwNs8E7fcMDmntsScrNkYiu7xP2Eq4YOYt6hOkNL/nY6sraByx1vU/Ptr/64+IEppA1JjoAjq4CY/jcO6VhBQ0dkI7L6jnBHeHEp8qkdmuiCyPCYHAbW9OJqrlHHbw8/j2EXFggL5PcUBHs6Gjuaumfv0Lqv27DBigGgNPx7Yd17tcrTXaZPSO0D0qTXYHvFdQixHZOZfOFVxmkctjv6pe5Le/pU+mtjXM/8JRO40OytKbUAG6VHI2O2WE74HCgScPFaZSJ3gB2vUvU8z5/zHgH1HlflA34UT8DZwf2ygyJNZvdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e09e3a6-fa95-723b-1477-b76eb7e4ad16@suse.com>
Date: Mon, 6 Nov 2023 14:54:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] tools: Remove all DECLARE_* op macros in xc
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Olaf Hering <olaf@aepfle.de>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andcooper@tibco.com>
References: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
 <20231106115852.31df968d.olaf@aepfle.de>
 <3620b635-0014-4def-b4c6-aadf099b0410@tibco.com>
 <6548e690.5d0a0220.b4d80.fa60@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6548e690.5d0a0220.b4d80.fa60@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 70590cd8-b7b3-46c6-55ca-08dbdecff101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gJT1VQsZ34UDHZW6044f2enKC+sQ3o1boAWAhEnzR6IZmtNHBa3+D8TcHoRktfiOlRyCUQCf3jt74003cGpk9XReTjVatnjOzSjN39M1FlAXvP3V1624ad499beyqBHRAvjHEmRpudM0Uc8pAIzx1qdhE/ybXEXtvzl3PkWEWRcpSfLsznHTMgUTBdux8c3GYHwMQszjQKuailW2gM079ZdeK002Zx9gsBrykBKnXzf5Og79r1cvvtIXVUR3HTE5/9dcATLTJdEqxDs/aPWjmm3Qup5+/c54GhTj0cf+TSnCL9Ua1I6y8zTfmftNCmo58ad8Z+uQh34MOvrsYCCph44V7m+qAh8uLKjaDt+Q9/lr8NPHOBvMhiQ/Qlb0/M4utsJvcSltmTOxF8NE2VOZvP+0M+2Y7FLWVHluwn2YU8pCAY7EDjNFMhU+6SMycirGqFRnLuLsuN97fh9nx+A1qp2fsmnJEcC4DIdhh9vd6M7U29xpnFXY4ixMV9pjmnypRocSYFQ4KFfjZqBxjZDbW1YQ44vakU2GThbs5boJhI4mK3BPYWurKHdzs+KAl79p/RAcuOs2kpx/Dnh6WtWcUMW3cYsmUSd3saktDWvleMxMacxgcvPp67o1Yp+JiPzVOxZT00H7uxQQVsp3P25Pi2DvsPOlTCs+/8zEQxjv6K+/69QtY8diiQmyhCmz6DPK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(1800799009)(64100799003)(2616005)(6512007)(86362001)(4326008)(6916009)(41300700001)(36756003)(66946007)(5660300002)(54906003)(6486002)(966005)(478600001)(66476007)(316002)(31696002)(8936002)(66556008)(26005)(2906002)(8676002)(6506007)(53546011)(31686004)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnlmclFPekwrZTg0RlBFYU5SRWNlVnFLa3dmZDhsNllDbjJPR3BsdWdCQXhh?=
 =?utf-8?B?TUY0UTR3R0NjMDJ5cnJQSll5RGFCaks1a256dFNQZjQxZUJMRWh4ajJrOUUw?=
 =?utf-8?B?eEkybnlpcThTWTR4ZXFCVW5qLzlHR2tWN3VkSGJDNlYyNmNFR2E0bW8rbHM2?=
 =?utf-8?B?bjNCMDAzWTRTQnlYRytDblcwZVRLNmczUjlKRjdjQ1lFenV3WW5nQTA2VWRv?=
 =?utf-8?B?TXEvV3QzODN5bXBsaHYyQUxmZGdyeDMrRXZZVEJrYnlMYzBLK1dONDJkMW9t?=
 =?utf-8?B?MUNkUkJaTTBwQmxiL1g5WjVoVFY3YUFsZGs5VU00ZFRzOXZ3aWFoK1Z0eWFL?=
 =?utf-8?B?THRmdEtTLzVPV0lEdit1enFsQjZYVTZFTUR1dEdtdCtpeXdobFB6ZGpzQk1w?=
 =?utf-8?B?N0tpa2l2dW1oS3QranFDUlgwY1BzVnRmbU5hZklJa3Zndm9YUUs1V2duL0Jn?=
 =?utf-8?B?RXFFK0R2c21UUm5BVWN1OEVDenp3dlVjdVBJcHVaL2xTU2I4cFNTQkd4TFRH?=
 =?utf-8?B?SjZPbHo4NktPREl4bzg1dUc1YTBQTkkrQ2hoSHJOdUE3WklNVS8veE5RODhh?=
 =?utf-8?B?R1JBTS9BblpwUERJL1dtZ0tBMGdHSy9hMHl6TXJNTVllVUM5RFNMUFA0UkJP?=
 =?utf-8?B?L0JleThxczl2L3FaQ3FPQjBERnM1V2FDUnk2N0R5M1hRZzk1NGptYXJhanpB?=
 =?utf-8?B?NThHaFdrUGlHdjlQVnBpdlNpWnlib1c0WWRVdFl4WDhPK2ZmQmg0Wkk4M29G?=
 =?utf-8?B?MHBCaEs2TTQvWUUrSjk2ZEVvK2FDYkUyQmtIVm5kVFNvM2pCVGcxTXJkSmRS?=
 =?utf-8?B?Zmw3WngrZnloazBIbUVXbmIvZ3lOWXBtSXV6dDlhVXI4eDBHVzhiL202VXB3?=
 =?utf-8?B?V2c3YWNRWGlxMGdneThTUFl4WFJmOWtNZmpXRzE4aTJlcGNVbkdEVnJxMFNu?=
 =?utf-8?B?SlRGWUxuc3BCTUNGaWhTYXpxL1QwbXBJVWl3bERPeHJoczVHWmdLek9td2VT?=
 =?utf-8?B?KzNzWnQwTUF2UlkwRTRwaTVBZnFMbVNyRzNTbG15Yi9rclFmMDJYZFNWUDll?=
 =?utf-8?B?SzFMSDQraXNySXMwY1hCUFNTNmNOWFpkN1Foa3pHelZnNlNoZFBEdHhGYnZU?=
 =?utf-8?B?NnBzZE1OcnJZcmFpSysrdTFKQU1SMFdBbERaN1BpeDZOQy9aNFMwMm1YQVh3?=
 =?utf-8?B?NDFsTU4zd0NGWWltRUJCTEttVWYvWDJZd0NNREE0Szd4SWRZVGNEem5MQmhI?=
 =?utf-8?B?TEZ0M0cyd2JMSGRnRHpIREszVTdQOUxtQzZ6Um9XZjd5QXlraC8yZHF1SEc1?=
 =?utf-8?B?bGh1ODg0Lzl0ZGtvZXNNK3BCUU04VDN5Q2twV3pHdlhxWDlUNk1LelpPeDdT?=
 =?utf-8?B?UE0yZWlPVWJ1RHdmMkxOU0dZU3lTK2NIcEM0enBOZTZlMUFoNmNWRDA0WTk0?=
 =?utf-8?B?N2VqenFHamY2Wk8yRSsyaEY3dVR0VVd5TnZGOU5XOEFUWHJMOXMwczIrWHh0?=
 =?utf-8?B?MHNWOWZ3MFppa0pVT1B0Y2M4RCtkMWtnL0FScDRJL0tuREZvVzlwbExsWjlN?=
 =?utf-8?B?cFlaL1NiQ2J3Z2NqOHR0Y1BxK1Q4enRnQUpxc0NZT1ZyTTFsQkg4V3VJNk5h?=
 =?utf-8?B?YkxkWlpvN3BVR1FXQkVkbzlVN0w0RUQzOGJPWjJDMnJqcWhaVjZsTjJwUmN6?=
 =?utf-8?B?N1YyQ3I4NDF6OUM1UFhCMlh0QWdTNnRScnd3dldUVUFzVEJmN2Rid0x1dC9n?=
 =?utf-8?B?QVFkZUtMOFlYcit5cDJ3Z2x6UHFsMUc5QUJOUHpoVzdRaVlDc2Nqa3BTTlpl?=
 =?utf-8?B?R01oVklwK1U5RDgyOXdUeUNXWXRQcHNCTTM1c1FNSmRoSENoNGtQNXphYXNp?=
 =?utf-8?B?QU1KT0ZzbC81U0IvNFBKd2NzdmJSZGZIMW52L25id1pXRmhaWGdybXJiRmln?=
 =?utf-8?B?MzJadE50NnAyaFdYSnRTS2kxRTVIckFlYmdHa1cybUF3QmxHOEFkV3FNbzJH?=
 =?utf-8?B?dmxzbnAvR3hUQU5HYVQ0dVJGN25UVkFsVVBzOHJjRnNQa3lFK1VDbTA5SGYr?=
 =?utf-8?B?Z29BbVpmQzUrcGpwSlB0b0l4ZktLcitlRExDZExiUXFBQjhwVllVR3ZYR3Zz?=
 =?utf-8?Q?3Mf5DPC8F9VT7kagf0DQZWYB8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70590cd8-b7b3-46c6-55ca-08dbdecff101
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 13:54:48.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3i7urYQicpFKj2T7OqAQnGHapBrCRFMAbUFXbn0Q6kCjTx1cuV4iphgGeJhOZp/PXgHU5gebIcTWAG1Z59oZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865

On 06.11.2023 14:13, Alejandro Vallejo wrote:
> On Mon, Nov 06, 2023 at 11:29:57AM +0000, Andrew Cooper wrote:
>> On 06/11/2023 10:58 am, Olaf Hering wrote:
>>> Mon,  6 Nov 2023 08:19:46 +0000 Alejandro Vallejo <alejandro.vallejo@cloud.com>:
>>>
>>>> +    struct xen_sysctl sysctl = {0};
>>> What is that zero doing here? I think a plain {} will do it as well.
>>
>> Indeed.  It needs to be {} and not {0} to compile on some obsolete but
>> still supported versions of GCC.
>>
>> ~Andrew
> I tried to find out what you're talking about and all I could find was:
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36750
> 
> I'm guessing we are already inhibiting that warning because grepping for
> {0} shows a bunch of uses of this pattern both in toolstack and the
> hypervisor. If this breaks something it's already broken.

But it depends on the nature of the structure / union whether old gcc
would have an issue here. Just seeing the pattern in some places doesn't
mean they're also fine to have elsewhere.

Jan

