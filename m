Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69CB583B36
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 11:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376712.609667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGznM-0002Hb-Rc; Thu, 28 Jul 2022 09:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376712.609667; Thu, 28 Jul 2022 09:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGznM-0002F4-Nv; Thu, 28 Jul 2022 09:27:04 +0000
Received: by outflank-mailman (input) for mailman id 376712;
 Thu, 28 Jul 2022 09:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGznL-0002Ey-3e
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 09:27:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f449301-0e57-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 11:27:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7774.eurprd04.prod.outlook.com (2603:10a6:102:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 09:26:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 09:26:59 +0000
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
X-Inumbo-ID: 6f449301-0e57-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnQ2NK3OOlXkxV8gOfjd621AuVqlbjvmXnJwDzOLos8ebymDtJhC8VJ4c5vvIa3B2XdFanDSnweAZ9GeXfZY0e3nCQX3CsoE6bCwjFmPvjJrb4IQPML1Vpr4QwDNbJX31lLPSPLb0aEcaytuT2Ua4iMF0tbBs6chrtkUQ83Q5/4D+zbsNMnBlI1ifVN3kRBdrzTAE+B3NafE26ZtUIPKntqEc8tnaaxQtAZs/mYDPrjLaYkbJFicY0uJNhX8wbA71ArMpcsGynekLH/FBPl5L+fm/C5l+dqlYATyf3yGEJXl+bi44S6nRoVIqdNQeaAhLX1TDJm+649rRmbEe5+6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z5sZRmGAOzPBz1xFfN/4/KVaxEVUoXwzI6FaPG+h7w=;
 b=Cj5xE7AAaMRWeR64Mxpv64Bc2gNFFGtpxYOz8tSZvUhYK+pOaW5mhtxuVLpvtOPmAIqSjqSewePb8xNHh1LLkBD3GCAkhv6InToFHf5qqhxINb9cp+l/y61EmYKFnIRFDA6bEs+s2vKwUwclBWbHocXvRt2l+ih94KkP2aPs4huamFZ5cWDkiTDfbl+tN7ejn/d2JS3G4kbsWMN9N5TL8X/YDzZ3kcJdOXWpdvWz4I/Bqfp9pRKP2Evq40L2TVzD5H5eCBGrDQL+Cuw19Bwje74RK+bshC3Ei+3euimK2M4VL6gngu6T0oQa5omNY0QsK88dH1dop0nPfhuSRhzYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z5sZRmGAOzPBz1xFfN/4/KVaxEVUoXwzI6FaPG+h7w=;
 b=ZsmXmwoiXGFjrwVd9wtm77yDHzdeUwb1UKm1UYab12yuVpTo1VKNrXE7ZDv4Lact0yh236JU+UL/pml7qGwcmiswspwrbElHUFNguULUGom4CHrELgNdLskvea5sT95h9SU6mlqS+ZN7XHB2pwT/vnkNijJx8gVxRg08XjjYi4wtYCCTDO835WLqgPgzVrwZQ+p/WoW3TmkqZM8zITkyPcj4MuTMAzldNfLiyJ85V3/wpPF9SL4JRirIluhtPhUs5vKunLODVBUN7UJp5oljN+5TA1u8VrxNZNQEQV4q3PXOOLzevfWRnF0o4UNJR41C+HUxot1qq/ySwRbf86l3Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
Date: Thu, 28 Jul 2022 11:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728075709.1175445-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220728075709.1175445-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd865230-0793-4c97-fb55-08da707b5275
X-MS-TrafficTypeDiagnostic: PA4PR04MB7774:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lTsu67mXMe94JieAaMpakMgzfcSbI3Qd7vW/DkQ42q4sVMvWEiHDLHrwd/bNF6PV8oQ4V+Ha5UADjahYoFf6nxdL+0rQWJEoAhmb3HxvoL5GK1d4dNVk3yOQ9gLUpMtg2y78x836TXsMHyqgk5a8HnjOHtjJOePUE16MPS3DIVXRMXN+Ww9vIDH+bTIireBgfpD7caRsedcZ+GhGge5mPytgYeUwD4FsKO6pPcAKhiJ/lzI7gIiOW0ULiuBgDkHJQh6xCckuRlfDbAHr7WSJye1uxxCC/bsbLgTSKnzzEpyVPys5uaiD/19RzLiswsRZSgGfOsbAo3XoPHp1bd/yghfWIsH4wapIkpy6kq6fLb0CaW50rIDLzCZP7eXUGzlwCwGqaPSO+OFL8HFhGRAz0mzo+Eld9TCtnnccyXsgsGyR8AioL14GoHwZiE6Z9s2vtp+Ho8jDMxye7Pe0KxBnawAKLeEIvnch74a/IZeRbX44RYPYilbM5bGfp5tJqImimv0ikBbgCoCvttpPYbH/fydDm5Wj72H2/0nkPulDVeaoCLE0rfLyE4NnLx1zZgDtcZyqfLjZfLsFXQIvBoo3fNtKr+S7whw1eGMmYOy3KCelZLCuuinSgP3k6bgyEhU356ot69drrx6+M1rIusmX3MupNluj1TF0vf++G7i9ykh/8/IngGGu7iAeNLpEV6acaDrv87A+aqbRpgbtd1MHRD/vuAVrUwA8/Jle7mnK1mtUtcWAgD/GwK6g22cQhConzyI7xEVgERGOzoGruEXkhns3rxE7zji+BzTY6g5YJePalPVLq37ZyhLqu2OdGQvJkbPMf7O17q9rLZQT+5zvNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(396003)(366004)(376002)(41300700001)(83380400001)(8936002)(4744005)(6486002)(2616005)(478600001)(186003)(36756003)(5660300002)(31686004)(6506007)(26005)(53546011)(6512007)(86362001)(66946007)(31696002)(316002)(2906002)(66556008)(8676002)(38100700002)(4326008)(54906003)(6916009)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE5YYk41WTdoQkREMWVJejlBbWkyN1p3NCtWam8xbkUzclpEamN6QWxsRWU2?=
 =?utf-8?B?clZMSDhSdEdTTzUxWVhRYW1CWTZTYmJuclFrU3RSTXVYK3dEV0FsTmRpemJ5?=
 =?utf-8?B?KzhDVmszS013N0pnOXVCZ0FyVUtVdUduMkIwb2xpMFBPRUtHaUJpNnptMmlN?=
 =?utf-8?B?Y0FoNEtnS04zSFVvSkM3WGxybzBaejhGeFhyNEJ0ZFhGM3dpajVVRG8yeS8w?=
 =?utf-8?B?cWR5Z1VkckI0RnIvMlh0T0VHSk1yVGljazJleWtLSkZuZkp6a04zd21xdmlq?=
 =?utf-8?B?WERvTHppZkJoQitnU2tleVdnNy9YeDVRdnc5K1dRdlZqTnlpNHNsVkRJZklF?=
 =?utf-8?B?VXJUVzJkc3RSd0F5Nzg0RFZPeG4rQ3F1d3NwZTJtZzBwWWVYRVhkakFmYkp4?=
 =?utf-8?B?U1NzM2JWZThRVDQ4cWFpWUVZZ25jVTdVaW5sM2Iwemc5ekdjcU1GKzY3L0Mz?=
 =?utf-8?B?RWFzNUtqTUlLbWk0MDZHRDlaRjJmdzZRSWJINEN0bGk1Y0pKQ1p4RXBoemRC?=
 =?utf-8?B?Smd0blVueERyekJ3Mi9lQkE4d0JHejhsaVBjY3B1L3JIcmVzTU0rTEE1clJ4?=
 =?utf-8?B?RDErU1ZPenJaY3RDcjRPaXJkMWZmakZBTElvUC9sYUg4STErUjNRVmpTQTJC?=
 =?utf-8?B?bXQ5RE1RbjFJMTRtcXpyOXVJemFCbUpVWXNFTm0yK3FabmhjTWVleFN5bDMy?=
 =?utf-8?B?T1lPMEt1UEYrN3NQeVNKck56MXNHL2psSEFpNnpwSlNiSi9DYk1McHhrN0N6?=
 =?utf-8?B?UlpxeittUDdZYVg4cFdQU1k2MU5ZdU9FYVpxZlBKd0dnTDVFc1ZkNnFqYU9J?=
 =?utf-8?B?QlZJUndpdDVaT1dTbFBQdzBkRGJzNHVwRUVHcmczRzVtVG1jb1ZtQmlERnVr?=
 =?utf-8?B?aHJpci9QLzdheHUrdmhjVzdjV1JsOWVSUGpUVVNQZlFUY2tHUk8ySmNGTVhy?=
 =?utf-8?B?bHlRZHQvQ09lWjBLdGltSjBiU29jNVBXNlhQYUtnckV3T0JlVnR1cERobkZP?=
 =?utf-8?B?OFVGenozb1ZjU0hKcDBFakhVMjA0cW11SFRqaTlPU0ZFSThYOWtZZ05GeS9L?=
 =?utf-8?B?WEhxa0RzNk5jaGlteU1yYS9Day9jV2JpSllyWWhsZWxuYVJRRndsQWwrcXBs?=
 =?utf-8?B?Y25FM011eW0vZXJyN0NVOG1iZU5DUVRmL1F2TE81RmpqT2w5ZTdqZTlCU0l1?=
 =?utf-8?B?S2N3eDZhUU9TT1EyRmFIODU1cTA2anE5b3VJMitJcEFGYVNmdnc1SlJCdEJ4?=
 =?utf-8?B?RXpSUDJFYXIyZytiMWk4Q0NCeUI2cDByTnBTV1o1b2lFRCtVSVpEMmNuRklh?=
 =?utf-8?B?ODRtTExxeCtsVVhDUjVNcTFxVVgzZkJ1a0tuQjBhOElaV2tOSmtqWlloc3Za?=
 =?utf-8?B?NjlMbDBJUHpTc09YSjNCVDRrM3dRTTFKTGFuSHEwMnU1Qzl4dlF5WTFrSEpa?=
 =?utf-8?B?TE1GcU51NzZxM2tSM3p0TmlyZEU5QVZSUUVjdlIwR1A0ekk2NW9zMldnTGM5?=
 =?utf-8?B?ZXBORThoeUhWcEpZR1RSRFNSdS9WaVlHVEtuQ0hSQkE3bWlTOGVXL3k2WElO?=
 =?utf-8?B?OThTaSt6Q2Q2S0dGMUZDYmVFMVVSTi81RVFIajZuSE53T1FhUDJTcmFMQ1ln?=
 =?utf-8?B?VXptbGo4My9mcGVEWVp0R0EvNUxHd0gyQWhDd2s2QlJEUXJMNmFSSG9NL0Zx?=
 =?utf-8?B?TG9ydjRHVnZ5MUw2S211RnNsbDNuaExMckI3SnpSSE13VEdsNjB6YmxBMUFF?=
 =?utf-8?B?SWRjVmM4MU5ubWRwdEJJQkhyMVRRMkpLRkJobXpqRUlQTnN0TjFHMXllZW9t?=
 =?utf-8?B?ck5Xbm5TUFVKOWpacUpBNDN2MUluanJsSThFb0JrVkVFTnFwNVVtV00xaXhx?=
 =?utf-8?B?T3UrUmxCYnFuMnp0bi9wSHBJb01hZjZpM2VValhWREpiTlQxY0E0cktxV29Q?=
 =?utf-8?B?djBhYk9tbSswdnRWbFhnTUM0L3NQVkJ1OXZvSnBiK2lERDNZYnlKSlkyOFJU?=
 =?utf-8?B?VHUyM0NncWt4alBZbTVvSFZRQlJmZ1Fud3BxdE9DajYxOUNVNXVaaEMvQWdo?=
 =?utf-8?B?YjZYMkc0cnNsQWNEdzZocms4bDlEbEk1SVBPT2h0czY4SXc5ZGNDeE1WVUM5?=
 =?utf-8?Q?5F55DjGP9740JxoGtxhZB4C9g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd865230-0793-4c97-fb55-08da707b5275
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 09:26:59.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMLJNjxBv5X2pHKCKQAIRiFFjunWf8b6Fe0wFATvPNi/RjmPPHS4od2Xck0fGcvVP4XVka8seNHLEYC4aQvKPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7774

On 28.07.2022 09:57, Xenia Ragiadakou wrote:
> --- a/xen/arch/arm/include/asm/current.h
> +++ b/xen/arch/arm/include/asm/current.h
> @@ -44,8 +44,11 @@ static inline struct cpu_info *get_cpu_info(void)
>  
>  #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>  
> +extern void return_to_new_vcpu32(void);
> +extern void return_to_new_vcpu64(void);

While ultimately it's the Arm maintainers to judge, may I suggest that
these be put in arm/domain.c to limit visibility?

Jan

