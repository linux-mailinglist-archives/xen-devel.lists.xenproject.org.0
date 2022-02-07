Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF24ABEA3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266826.460536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Pq-0001Q9-KX; Mon, 07 Feb 2022 12:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266826.460536; Mon, 07 Feb 2022 12:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Pq-0001OH-HY; Mon, 07 Feb 2022 12:46:46 +0000
Received: by outflank-mailman (input) for mailman id 266826;
 Mon, 07 Feb 2022 12:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3Pp-0001OB-7f
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:46:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0107be40-8814-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 13:46:44 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-P2hLgr-CPP6s_uV8sZgd5A-1; Mon, 07 Feb 2022 13:46:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4143.eurprd04.prod.outlook.com (2603:10a6:803:46::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:46:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:46:40 +0000
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
X-Inumbo-ID: 0107be40-8814-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644238003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwlBKYbv/zKdEzC/6AL8tV37IW1fDoFnfkUJOLWzqDM=;
	b=bEwlc9UUngFhERqplCO1Npq9u4vcRAYjwfn2uLp9/GxUEEpGkJZsXcNnL5xo0NOb/P9Q4R
	l1U7ZOFgWQmkFsGg6U+OqCx3O8MgTd2N5YoJuabiWDzHWNAGhOUSr/zV3qG36wcZgTmGRJ
	68oCAdJ9tzKs/bx3+79mZ5uAh7HlN68=
X-MC-Unique: P2hLgr-CPP6s_uV8sZgd5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZnDc2br8dl6DIP7ZlRdHT7vVlvnZfrMaaEq+COyxWBIltDmyf3cvP/BhpVRzedzqDN6I3aQ/nVFgOGKHuyOSgSL5xDdlSb0yV4J7bGPBdQmfVVd9kCXA3SXOrQFwM3vjuyu6L2qLqS5WKL9NzwuU2VJYuVkkPoGuN7CvPDAmgytewXSju9bMKvuxqtNubxAdsTe5ljjL6/3K6R0UfsTKybi2ye8QzRdtu4wcBziGWsiKTHI8NtCw7x4wGwHS3rBSL3PTw9i0nq+KhKiab+7s5ULzWxUKObD5Ec9rhXB1Rln8vIH7/vFTnYSWswDzhgYks8kpRtOr7W2k+OREH0G1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwlBKYbv/zKdEzC/6AL8tV37IW1fDoFnfkUJOLWzqDM=;
 b=lE3Cfe9LhqOxw/c5FONPmR0fOUwqmFaU7ENoe+2+OEBT/+TkZpEaujaLC6JUBNw9ONFwvTeY8DP6yC4qJz0pW3ueSziTiSAvaiAs9qty3V3dVgaKbPLEPuhWiZl/Hbxy2aBDRJHN7skCopLtPInn0TNzYtpGtdtk4d7an4SeopSD75PiZqGMS/Rd2ETvVb9JxWZBtKxTrCyzCClpzKQU+ox/iotD0pf0/cnek2xK3oPmPQdhGa36L01dBXNcPTmM1tEloJcS0URKnPeeGgPOHtxsCoT7sLJ+GSDHrOmV6x+eRnaPYa9zRE0qa6FeJbhA1FcM1TE2t/RRauN8AjFQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11b3a2be-0ca9-6464-e9a3-392f7495793e@suse.com>
Date: Mon, 7 Feb 2022 13:46:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220207103613.32260-1-jgross@suse.com>
 <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
 <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4561440e-9310-42d2-55e1-08d9ea37e31e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4143:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4143918A3E8B32D43AD8B026B32C9@VI1PR04MB4143.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BOeCLrD2M7Nw8Sw0kMtW8Rt/sMzf/jteiXYSlknIZ1iz+g+k+QCmipztHI09c0L6ivkQonBsLA3Ecq2Es5/Zrl5i+ISG0kg2CeoiqLUV/SdFwSF4PMfJ+g8jglrFVG/c6UV64s20AfRGTPjZ4pMohxo0kVQudKvP3mSY8gm7kb1JdL3XZcyUzp86icKsJToIJLSajdhtcNmCUu1pLk1wV3l+veO+AEl4AyjrXvllxxC0epiqcLU3WqYc0XqBQIJqLpkrMWl2OM05cO9GPNixOT5pQMwuqYodWdaEKO5VQHrESoYsb81GoWArnrFCZ1jb3nUX6oGjacRhbHzoHxeiVhEde1Kfc+3KDnbMsSMat/ryMBCb2ptIh3zvEYIep0wzatUF+sM8+rgkozRVKrq5fcd8Xms6815e250T6snMZMGmjCQ2f8q0uf6sKXnjwk/FVR6EaZUAGykoAgkLZdGUFk0W7r46y7JgBIiv4F+mbBGXmbXiiAlNKOcpBG8HY6zgY+IvnTRXuMJWa3Zxs7KJXc+u98fJUAbLvk5YHqgCprMLs5k6Z36BebuNQdE4K4PhwRPCMjGdRICXmvNlK4m4Jvx10u0uv2ar4tKPJP0z57PSf95b933gbB7HtjkIxB6DQifErfMaTJCr9o6Foa1xUHMfa5ARrJND+mWe82E5GGxu3sHFM1XGo3IkQW26e/B3oqvr3AUkqvnIIRMv1SepgycCERoLkpJHVBdA39vNpbruH1n2z46W6y2aClsL4tGU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6862004)(66556008)(66946007)(8676002)(4326008)(8936002)(66476007)(53546011)(6636002)(54906003)(37006003)(316002)(83380400001)(6506007)(36756003)(31686004)(6486002)(186003)(26005)(2616005)(2906002)(5660300002)(86362001)(6512007)(38100700002)(31696002)(508600001)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enlmb0I3Vm5mbk05M1dvaDVUMDRIc00yMWUydWtUNGFnMVhPRG1HRnl1Zmhr?=
 =?utf-8?B?ZEY1dHIweGg2a3N1VEhwYk9SRXdEbjByRHhkTStMUWNXSnlIYWYyS2hPNE1X?=
 =?utf-8?B?N0RoMTNpMm53amM0d2dQUndPQUtBQ0wvM2d5YmpUTzh6UGVPMFNSckdsMnNJ?=
 =?utf-8?B?VFN4RGpOcUd3bGpvRVV5dmVTL1pBLzI3a3FUMWZ4UjJNbVh0M2dwaWNLSDR3?=
 =?utf-8?B?Zy9kdVp5WHEvLzMzUjQxaXUzdU4yL2VUVnFNb2pkUThxMlpNdHM5eTljbGJx?=
 =?utf-8?B?QVgvRVdkMHdRejBVdlUzZ0xZN0Iyc2c5d0J5aE9BRThlRkxJSER3eTBOQ3kx?=
 =?utf-8?B?WEpzNDExbi8zUmtPMHZHQjhONmt4azZGdytJMThVNHcwY3h5OE9GQjdtZ0pp?=
 =?utf-8?B?S0oydm1rditPcUFDM3BtM09iTWlWaTkvbnd1Uk96cWlLR3lMQW5VVmtHRi9B?=
 =?utf-8?B?c2RGanhtNnhCdTZHVEgxdGdia3RwcHhyY0pQNEFGN0s4VHJrajVXV1ZlUStV?=
 =?utf-8?B?cG5JTkI0bnNvVURTVFJGM2w4MXNibThNclZHTG56QTY3VEpwUWtZdndoOEo4?=
 =?utf-8?B?bkNUUmF3TG5Db0dubmxuekJHS2J5RTc0NmFjc3JkSWlpYmtmeG9WQnJzaDV0?=
 =?utf-8?B?NS92K1pNUm84WU9JQWhGaEpBMXBqR0JUS0grb0Z3WThvbUhzMzdJL2luSTky?=
 =?utf-8?B?OVo0blJ5Z3Z1Y25zcjBlcy9UL0dOYWZWMXdMamVYcUVzaG00ck53M1EvMnUy?=
 =?utf-8?B?dEY1MjFPY1QvMnZCRnRDQXBuaVpQVFZGeHJrZ1VkY3RvOUhMMUlKU1NmUmc0?=
 =?utf-8?B?ZzVEMWxyeGNHY0RJU0lHcTFoczQ3akV5bklNTFBOUWFVTmVXeU1Sc0FZcUVL?=
 =?utf-8?B?RHYzUWNJWnB4MVlZOXU1MTlOMjJWZHArRzBqZ09jbWlWZjc1UzZ1N1FjQzdN?=
 =?utf-8?B?a3I3M0Y5cGdKaEN0WjRLWTVZc2V6bDVwTER3eWFONm9UU1lKclJ2dmxraTNQ?=
 =?utf-8?B?UXpseFFWMTdIMUhjemlWa3N4Q1RwWmNGdG5iRFZYUlgxVDZQK3hFUFdSQlAz?=
 =?utf-8?B?d2pNVitsTEdpUmxRSkN2b2JycVNRS3VZZTZDbyt1UzVnSndmc0tvT0thcTFh?=
 =?utf-8?B?UDVjMnpnNWdhc2lPMWtyaktaUytjRzE2SVY4WmR5OXRGd1FJbFhuSGUyTXRm?=
 =?utf-8?B?Y3J3TXc4bmFEYWlhQ0NUUG53M1NObGhGOU5QcWxSWmNkRVBmZms0c1h4Tllw?=
 =?utf-8?B?VTJzcHk2NER4b0c3b3hla3p3d080Q1ZEQzBIdFQwaWJiSjhpVEVTTWRMMWg3?=
 =?utf-8?B?NWVlSmhKR2krRHdlVG9sZEx2YTRvT3dadlczUkMyTXBWamg2RVNYazFCWGhE?=
 =?utf-8?B?SFNVODFNcWNBTkVOYitoSDRkQ2NZTkxjSVpKclpaeVIveTJ4NkFjaHE4aml4?=
 =?utf-8?B?OG5BSmVqME9CUjBOcDM5OVhQV0dJT3l1Rm9IOTFyL1ByTFIrK0pZV3lCRHQ5?=
 =?utf-8?B?Zk96NmIwZ0FUb1Zma3B5ZEl5QUVTY2Zxd0w0eTI4TEp0OXJ5cVF2Z1lSYW9v?=
 =?utf-8?B?ckhyME9rcFNEeHlhZ2xkTHZzR3pGLzhNQ2c3QjlwMlRYa0R5ZUlyazVraU1Q?=
 =?utf-8?B?ZGV1UUxnVlZRY2QvUVBoalZtM2EzWGxQbXgySDFUZjhvbjdpRGExT2M5TFRM?=
 =?utf-8?B?bVRUQjRneHptbStnRFAvUFJyclJMSk9FRmpGMTBGd0VHYyt3ZEtmOFZoaklX?=
 =?utf-8?B?WElEai8vVnBqbWZoanJLditDYkMwaTEyM2lIMFp1QnMyQTM1dHJXcWR1bFB4?=
 =?utf-8?B?U1BtcStNTXk2NnBsQmRlOFJEamdIN0VMQVVWcHNHVG0ra25uZmhiSzYvaFdS?=
 =?utf-8?B?VFZkc29QdHJBMXY2YzJzejMwS1d5R3BhWjUydGRCUHRhWktLZGk5UWJKL1Ey?=
 =?utf-8?B?ai9Sa21GcmhTeFVTSWJGeU1jdEMxYUpIc1VGbEU2V05GRjdRZ3hMR1ZKNHlB?=
 =?utf-8?B?Q0xNL3ozb1JiTVdrRzhKWXBIZ25SMlpsSklheWlvS1ZKbjlON0podnc3L0pa?=
 =?utf-8?B?RlN4WDcwU1F3blhRUGw3Z3ZKZVFyTkhpaEl3UlcwNEhEdVcxWm51YnBQUjFF?=
 =?utf-8?B?MEk0cTVJcUNrWWh0QkxvbVZUN2paSGtYdUJQMnVjb0FUVTg3RTBPSGhrOVVq?=
 =?utf-8?Q?uP0LunMgPotbLOMTElShpHo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4561440e-9310-42d2-55e1-08d9ea37e31e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:46:40.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbgHc+A/Chk2k7369es15g/9glEuOH/R1NNxTp3os7tfTHDiBFAuPHnNeGM1wLeYmEl070S346PuJqJPLSI+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4143

On 07.02.2022 12:00, Juergen Gross wrote:
> On 07.02.22 11:46, Jan Beulich wrote:
>> On 07.02.2022 11:36, Juergen Gross wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -662,7 +662,17 @@ struct xen_mem_acquire_resource {
>>>        * two calls.
>>>        */
>>>       uint32_t nr_frames;
>>> -    uint32_t pad;
>>> +
>>> +    /*
>>> +     * OUT - Must be zero on entry. On return this may contain a bitwise
>>> +     *       OR of the following values.
>>> +     */
>>> +    uint32_t flags;
>>> +
>>> +    /* No longer supported - will be never set */
>>> +#define _XENMEM_rsrc_acq_caller_owned 0
>>> +#define XENMEM_rsrc_acq_caller_owned (1u << _XENMEM_rsrc_acq_caller_owned)
>>
>> I think this goes too far: Neither do we want to re-introduce the
>> #define-s, nor should we re-fix the purpose of the padding field
>> to be OUT (only). All we need to make sure is that the field
>> coming in as zero won't get responded to by setting bit 0 of it.
>> Imo this can only reasonably be done by way of adding a comment.
>> This comment may, in turn, mention XENMEM_rsrc_acq_caller_owned
>> of course.
> 
> The kernel could be changed to no longer use that #define before
> updating the header from Xen, but are we really sure there are no
> other users, too?

Pretty sure. And I think in this case it's better to break the build
of consumers (so we're sure they'd notice, assuming they import the
header directly in the first place). It's rather an exceptional case
after all.

Jan


