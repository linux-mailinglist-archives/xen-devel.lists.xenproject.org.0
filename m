Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A80855B9DD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356674.584969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oiy-0004HE-W8; Mon, 27 Jun 2022 13:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356674.584969; Mon, 27 Jun 2022 13:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oiy-0004EX-Sa; Mon, 27 Jun 2022 13:24:20 +0000
Received: by outflank-mailman (input) for mailman id 356674;
 Mon, 27 Jun 2022 13:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5oix-0002yI-IS
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:24:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7025af69-f61c-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:24:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2748.eurprd04.prod.outlook.com (2603:10a6:3:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:24:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:24:16 +0000
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
X-Inumbo-ID: 7025af69-f61c-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7cRKfddbOpC9/RbaOgR65ans69Fvhyv7L7JAckBw3podRhe3N31ANRP+Rn0xOuDQlAeihfWv1rIozlZvQP/gikoDaissCLn4AX1SZow0w3OsL7Rk1NsnIStq5qcUmTXix0YSTDRTfJtKBnihHjf8/fNcSTF3yGmHpHzbnEGMZaMigvvRjh+sCoY1xQsf0i+MEdjHJRd1sxCRbaBv/v7feYcUEaLCZLPHm/CLmt3FRTUI17DiKVrpuZdwzA0Xy0EyPaYxwsATI8Cn372ejl0a4M3ViZe8TcjftbfLL5Vj7O2VGc8pHzoyc1fYZzsa/VdGfVXFhM+zPQj5rhepyJZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXY/RvvLeX38EgZncQfxe9NgQsrTPq1js01SnIFooeA=;
 b=A2ARYscB88S3h5NQMH/SCYEzrTHyKp0ZYVhBBCSa3fQUADtKygOfVtZbLdszkYm+CJCh5wuFxcljhu60FwYOBLl0VH/AYSU60AgA6YahXwj1WzLuMYZtf9CfsuptmNOa45cjtoL2yGOIxsZzrR0r84bQROeGl1ICKESDOLCW12tWS8wkx8iIwAZlMbcETQcHXjK+Z1IVspl09wRbGHa44s3Y9nRcUpd+DX7JSqcz9L5YQi9se3vbYnJcDW+39MJaxwz5ub9eXX+EQH1tB5ub4KcCjTbpJMFfiFD2uk0oqb+Pd+q2cqYyPnxv8h6h9gxXGic5pGwDJSTVRpN24o1xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXY/RvvLeX38EgZncQfxe9NgQsrTPq1js01SnIFooeA=;
 b=oy7RMDyycjPOTWz4a4sGWIhk+pSeM6PSV5YoGqztijeEi+vtwOSGtN+Dj/vqMghR71z3B3aD5SFnR8s1GzxNBXs0hAQL7uQE0Fl644a67Pak8uuZyWTkD1fWOvnBi8RGsGeKeyI6u4Bt4HN2/1Vnk5uQyNNMKb3wLePMu+5M2XihJDNU6tDlX+3JX62WLz7uByjYCqUayMggQnjFUFWvawxzXVlzHe8S3X0lHUM9Ux7nvo45yro2wp7Ist8v7U8dQ6mXRV2PT2n6nnQZ6Mavcg28BQK+qrC+kPUD04otfBI8Bc2WwiaH2n6E7mWcTFhv86mQYr50d56M6D8qGcEEeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06307ee9-b331-dd07-ee25-d2455f70175c@suse.com>
Date: Mon, 27 Jun 2022 15:24:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] include/public: Use uint32_t instead of unsigned
 (int)
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-6-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-6-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf6467e-06d6-4554-4f0e-08da584055c2
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2748:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z2v6C1qiQkElR/lFxsTWW9J3CvuHDoDnuGrFrXjBSecW7IH/UoBQz1OU4OAUUPEliPQTr3+4ZyAM1gBH4SEhy9pNbT3PlQngnJyndi8ZUZbI0Q1UT+kcrHArQ3zUplfafXo6HfcN1jJJFOoOTQZwHyd+uE8RPUHnIBJ8Xf7gvCjLpmQTvxifCKcL/Gx5Cap1zUOFPZx62eFcwS/pyzUqqNXW/6HIjKlKOjSrbxq5lfqfSWVVfcXra4qKOm09eA/Vv0uBWzDIMreWuRA0Z0Yz3Rs3j2NMb3eeZkrMgYxTTYGA/R03Oemf1RUyibjRl64Ux5zZQ37r0I0gsWxl4mw48/FNwatz9Dhow5kBxc066IcuByFvurFCA3Ffy35SsIy7AZG8jM5En9YvnaXjJIYArOfThnVadLQXm6BTz6TrPaPEExSOwgjTmnHYzVz/EpYWFyuAXj4I4m7V0XSPe2vMpt1BmiqMoKzXKf1893ZhbTZVFrMEuq9lYwQbI9KSvDgpXD7Y3zFwuhQ/VeK4YMedXYbIVZgsYihq+n0J1N3V0b5uQOgYlhWX2cQFHdot7xQA0kcMEKvCe/68k1cMTzR5eLld4GPEkJDQBOpQeOzSB1oKtmVtRYJ6ShbAs8ZfpMu6P6F7mDdKRDt/HAmF0D7pJO+FS0nt0nYyyy5Jpj7/3Zs98r/TzVjGOxHLGYMlDV1+T5N1xkiRuerlLvppXjCLWDvdGHgwre7EIhixOJth0HYAHgXcr2zcF2uJ80Mft6iq5xozI/jYQbc/TieTGCo1fFcZRDn+g8yercANZPZqNfGQcjbVnHVz3iwFmTV7PGh7Nx5yYwoMAsYb6exsUV9eaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(376002)(396003)(346002)(26005)(31696002)(6486002)(8676002)(186003)(4744005)(54906003)(6916009)(4326008)(478600001)(6512007)(66476007)(86362001)(316002)(5660300002)(6506007)(53546011)(41300700001)(31686004)(2906002)(36756003)(66946007)(8936002)(66556008)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1YyYXg1YmhKRncxd3RjQXp0MGtDSEVtcXczUWtEbE1PbjkrRFU5dUtIcWw5?=
 =?utf-8?B?T2g4M2krSk5zM00xaG0zT2NDMzdUWXllRmNSUGVBL2E2aWFoWElZSkJnQi9s?=
 =?utf-8?B?dXp5ajY1SWVaSjV5bGpxbXpGWjlrQnNmQTdFbHUyS1FsRllmY1dpemEwSXI5?=
 =?utf-8?B?NmZOMWxTaEU3MVpEUk9lN255Tmg5NERkUU9ITUlRckQ5QWhCR3NKOXBSS280?=
 =?utf-8?B?a3Z5VkI3WjBkZXdvbExnZ056RHdZdENZZXI3R3B0NUl4Y1Nucm9abi9TM01o?=
 =?utf-8?B?ZTF2YTBrV2c0bER4b3VZRFJFaUcxY3hWRmcxdXJkYW5ScktrMVBmQ0hFQlM5?=
 =?utf-8?B?cEN4aDJLb1FSNHRPRy9hcjJHc3V5UEMvWnN1SlRZaFpDSlppeUZSb1NUVW95?=
 =?utf-8?B?V1ZwL0tCbFprd3NnUTdKR3JCa3hrRzVjL0Y4MFhtZzlDSWt0dlByQlVobExD?=
 =?utf-8?B?YytjaGJkN056R3lBRXQwU1dteW5TRlVSMHRCbXNOK1NvRlBaNEczMkV3NTVO?=
 =?utf-8?B?WStPQW93QVdjYUROY3IwTEJVRFZtb1R2dEErSDNlYjQ5dUhPdEVXaEszdnNk?=
 =?utf-8?B?a2FuWWt0VGw0eHRENEZsK3BWbXh2NjUydjIrcjZBQ25OS2kzWHJheFJYV0Fz?=
 =?utf-8?B?dFBFOCtLKzZXeThoVkcyRlYzY2FKeUZiemVmZDUxYTIraEdVNU9MVXM4Qjk5?=
 =?utf-8?B?Wk11RE94QUgrRDkxRUhRMFpjM1M0eXE4VEJqUW9Ici8yK1JUMEVzSDRlTWE0?=
 =?utf-8?B?dkI2dmZkdnFhaWZScXR4aCtXaWtZd0ltQTJxdXFTbWRsUHd2T0hwWitxWmtk?=
 =?utf-8?B?TFR5VUhGRzYwTWxDQnh2NWRzNElkVkNTajFwenVMZHFEbHVSUFYrdzdFMms1?=
 =?utf-8?B?QXFxQzA3eXFnWXRBb2F0aTNoN2t6TEdJNC9NUUhXRjFsU2trQW0vcXFHVXVm?=
 =?utf-8?B?MGFKV3ZPaURvYTlBQnd2ek0xanRwVlN3NXJSOFhkR3FTaFF1RTJUR3BOU1p1?=
 =?utf-8?B?UjJaTWVzQzRYeHFzS3k1dkZ5S2l4QXdEQ0dhOVdURDlBRnFlQ1NSWUdRWGM2?=
 =?utf-8?B?eThGVVd2ZGRmakU4OUUxOEwrdDdBajFKQ3ZGMURTWWtsbDA3MEVlUlRLZnc2?=
 =?utf-8?B?MHpZbk5GS0tiWnpRaDBKOHR5clJkaDFhajRJOFl3dWlVRXNTY3g0bXNZeXRJ?=
 =?utf-8?B?V1lRMWtTQmZYS3VtUTg1UEZDN1FHMnlmRDFDcEpCd3JUcEVUeVlPeXZkMXFq?=
 =?utf-8?B?MWxDT0NPUmRFQjdNOFpJN3BZZ01tTnY1YThhNVRMbUQ4UmRGWnMzSG11Q25v?=
 =?utf-8?B?N1hBYjcxWSthOVYrRm5JaHc1aDN6ckZsZ25rOXN2bXBsU2lNR281WFpPSVh0?=
 =?utf-8?B?dU5xWjNRMFAvK3RkM2hCY2N5RlNuTkwxMHgxbHB5WmlROEQxRVphZXZUNkpQ?=
 =?utf-8?B?L2ZEOHA0aklSVUk3ak1UdytjSkwvM2NFVitjM2ZxWHlZU2V6V09kR2o1ZGw1?=
 =?utf-8?B?VzUwNWZpTGI0US9waXVJdFpMektBQitKdk9SWU5GdnpVZndxc0s5VTlJTUlm?=
 =?utf-8?B?OEpkQ2szYzR4eDI3bVZxT0RpSWVoU0MvNktZckJIM0tOa1pzZ000M1BIZE1X?=
 =?utf-8?B?MmRTU1l3TjlVYXVHeFRvSEVxWll2NzZQdFQxKzM0eWdyVXBlL0FTc05vWjBw?=
 =?utf-8?B?TmFKSXFHbHVtaTJyVzc1RFU4dTF1b0lXQS9ibHpaTy9mMi9WOGdkYUJtem9R?=
 =?utf-8?B?S2QwTys2ZmhISGV2aUUrWWdlTTNXSEVIcUd4YmlCTS9McVZrbzg3eTVha2hk?=
 =?utf-8?B?eFlZZDJTYlRQcTRhc3NOZitZOEtBMGRBcUpCR2Rsc05KQ1NqR01qaTBhYnl4?=
 =?utf-8?B?RTM4Nkx0WDE5cXRsczhFamtIa1ZZZVRTWDhRMzU4OGdTUmU3ei96ZWE3QkxV?=
 =?utf-8?B?amxrWnhjY3dVYjFlQmloM2ROSEZ3Q1BvV3FEbTNMSnZVTzVuUEE3eHEzMC9z?=
 =?utf-8?B?czJkdE1kNHh1ZUE4TnhHQ2liaklIWkVLR1BmSVNJV0VTWHVwd2wrYWpld3Rr?=
 =?utf-8?B?bW4zOFdHS0toby9LNmJibUdDVXdiUVFSRk5nSGpiMnFTbE0vMU5SUVBrTnFm?=
 =?utf-8?Q?MulVXb6rxKw3NsvkNXaTFT8Av?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf6467e-06d6-4554-4f0e-08da584055c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:24:16.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfpIK1ua/VvSj/AbV6YOGHI/VMcEwALGqBjuLQvKPsOSwQqL7Z6b/5fShBso9qNMBZodEOnNgX8LHaQouMUadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2748

On 27.06.2022 15:15, Michal Orzel wrote:
> Public interfaces shall make use of types that indicate size and
> signedness. Take the opportunity to also modify places where explicit
> unsigned int is used.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


