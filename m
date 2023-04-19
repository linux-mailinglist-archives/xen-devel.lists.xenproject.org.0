Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C336E7483
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523230.813096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2gf-0004eI-6Y; Wed, 19 Apr 2023 07:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523230.813096; Wed, 19 Apr 2023 07:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2gf-0004bK-2C; Wed, 19 Apr 2023 07:57:09 +0000
Received: by outflank-mailman (input) for mailman id 523230;
 Wed, 19 Apr 2023 07:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp2gd-0004bE-Dj
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:57:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7415788-de87-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:57:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:56:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:56:37 +0000
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
X-Inumbo-ID: c7415788-de87-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ/XD3n50rBijmZ2H/ZHNbUpgTe4lrp0THLTa8DZCZQfWpUf0L0lS20wtArxF0GqVP4UyHNUI+GunovvHQawTIJhB0d7YdAM8nUBVoljMMVKrQr9KKywDBqmiziloIqYkbgOlICKeRoP2TmaKTPHty/1ZDOVCM1jzdb8nmrfL1Voq271TptWNhkveJ2ujxMK+zJ4rJfr2BYED8WSqiPfyJ2IbfFT9PS/Gp/S/paSMTsqb9GLrXFOfSJloJYbN83bv8mL1sOkn5avXCfeECfFEjWXnCiOTemu6NGER+Ajt9Nxk4AP7hoPNGuBfzC1tH61rRItS6dE3gZnB4A9NMY1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmCLQJlBYbn6dcif6atux0FPC8qBpDdBLSryj0Xailc=;
 b=ZOKyZ/CxCHJcU9sxX7Z6BhEo5ol38+6t0ZqA359gTCqZBSUT3yyp1haDTyhTm42LlHN4yyLlpglHv5+HCx0R6nIsO0cCpXjN4kkDuGHYLze6qhxc1o3dUrmLtBt4qu71/2h0FC3pu9t+wuQrvVaok28x/NMftvW+hadL8x1+ehnP7a9Z2bAtUWawW3NH9ttmEui4Q/ROfuQrK+V27+4uE1FMC8cy/TVVvs5yePckIrgSfdjvAAn3HiPjw0P7d9nDN2yz6sX8sYtfkhcahRPOdz9gKLxZAQC8G0DDSr93k9r5zaz1kGiUGFJJXeBUS6xp4Soj2XarDjjPsSlaBF68mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmCLQJlBYbn6dcif6atux0FPC8qBpDdBLSryj0Xailc=;
 b=MH9smZw0znmbPr9wzBoArx+0OoFtXWdSlOJrg45b3FTUssnnMcdrc5LrErhR8qZdJsYtjYNFkzgEdJKGFZESZEvy+qY8XiIi1AKfJPxPpffT+R293sIEWDhXLnaLGyjwr8CN1RISNc93lVU9ITlgOt9J1r1J8xJHyKelOcQBEsCw9XfpsLHLd3WvDRJnR73bRTmLCJwhFnkRvPAbb1Bx1DJhZ+yrE2Avwmjz9LF9rhrx+vpVLvs1u+9mq+1qq30rqeTCCZ+Jba1l5g7EQjVhIU9hTN/0UJ/hxUxzaOFK/xHx8wAKHH53fbfVoyZViQiQfq3JKgekThUM2nCjBhp55g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e90e951-20bc-3ff5-30b3-da17cb14d260@suse.com>
Date: Wed, 19 Apr 2023 09:56:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD6AejXJxQxAyrx1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: caedbfb8-d930-4288-8e64-08db40ab9a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zZucu/ScN74BeigQ4Pa0Y6/IsWOaLMicpz15gbupuqkg00VpLXVJz8zZJ+EdBJ5CHpflCTlKL3E2kZLBYqNGCka87MPPCCB8OPyeCNPduhjN8giZRhvPM3WRCVR1Hcm/0CttUA8eIJl5eh6cHGjN3kSxqZnoo1YdujQ62IHkQrpM3iHJKsOxDR9+IYv8iDqV5FXQJmst7eO/R7yX1syRw5Oop2vNSXDEWS4yqinczz6IU+jEZeMQFEV1G+M2X20pdOv9aAY4m+5OIOKbot6ZOz0YRbOkz3jVtbLxyRkQ+iIC4RGHEkORF0iyVu+yD9AlShnEvdK33gc07f7XbxOxtW2nZAOkN4RxjZo5bjaNg7yiQTn1zXwkrS4BZf1vAUFMW0oAFNHXlGK8h95QT8i9JdXrAjTX4yVBMfTn5aQlkSvq9nUf65zOQqkLwHh/4C8hOUgf1/VaV94675sNBLwDWJSW/JB7MWxQ18dVlZ7eYZSH70cH5wtkjugy9zC8dPx+6afSQClzQbM7nuqdbjCdVhT+7DC57h1qqNUYbqbqTy2IBJaDzr5tQGS0tQZEOEnG5EVexJ9zy81haJYk5DEc3awdtlE5C8rGxriilGthW0o4krVlaSoWXR/2u4lzkRcshJsJln57GqIFMMRJWhIMhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(31686004)(26005)(6512007)(6916009)(186003)(4326008)(53546011)(6506007)(316002)(8676002)(8936002)(36756003)(86362001)(31696002)(2906002)(5660300002)(478600001)(54906003)(41300700001)(83380400001)(2616005)(38100700002)(66556008)(66476007)(6486002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1QzRjdmeWtmdG9Gbm1WMG1XRlduMzEwNTR1MnBpQUEvTlZ5ZGRQSUVLZEhB?=
 =?utf-8?B?TnhYTDlpTnhhRDZ3dzF0c21LM2M0THZiTzhiSEtOYWp1bTN6czhsSmtzYXh0?=
 =?utf-8?B?RjROMWZsQjhERFhrSnhGREZIdzhJM3dCTnk2QXZISDJ4S0pZdFFEZHZGN1M0?=
 =?utf-8?B?cUtKVW1pU1BNbEFsaGNWTXRaQXBMZVhiZEJlL0M4ZGFXb3RmZzZnODJFeFZO?=
 =?utf-8?B?UGFlK2VPTWFaQUc1czFNU1RST0ZuQ0FGb1JQbnJLZ0NGZFNxMnJsRmZzUlRO?=
 =?utf-8?B?TWQ4NjJuU3l4WkZhZTlsZS9ZbUdVOVhzTG5aeWlJVDdRYXA5ajByWTJ6WUJL?=
 =?utf-8?B?ZkF4UmxBN3l0SHBIeVVNcVRkbVNNN21yalY4MFBoTHViRHJRY3lJY1NjNDVT?=
 =?utf-8?B?ZWxXaExpL0hzMTJCRmM3cWpNNEl2VDZRVi9WNFh3cUJ2b2p4NWdPdHQ4WVBE?=
 =?utf-8?B?N1BrVEEyKy9SWjNSZ3VMMlhsbXZCQ3lqamdaOXg2TVJJT0g2bHVWQmRVMG5z?=
 =?utf-8?B?N3ZsYjQzRG9JempCd1dwNFBCNmcxNlhmcVVuc1Z0WXM2MnpzWDEwSGM5WExV?=
 =?utf-8?B?bmh4QjcvT0FVb1ZNVCtUMDVsOGxkZVRsZkM2VFRtNWF1cGs2Um9KKzhhYmpT?=
 =?utf-8?B?cGlKRTMvSUJvb3VSc015bmVSZlMyZ1luR3dOODBjQW9UY1VHbXZCaE1Dejhl?=
 =?utf-8?B?WjNLakliaWhIcTcwUmtTODlwb3pMWmJKUzhyVjc5amhpUHM2bmM5QXNyMjR4?=
 =?utf-8?B?TEFNR09TZUV1eUdEeGxpRlNTVE9FSmlQWXdKeloyb3FiS0ZWQ0FhNmRiOUQv?=
 =?utf-8?B?VlZOazhPdnRRUFRHK3NXdTJWNkNrYWovMmcwaGtKU2pTSEgvNVpLQ2N2TVgy?=
 =?utf-8?B?YWswUlFPRVB0WkFJcVZUYXlXYWlCellhUVc3c0xOUFJ0emQvTCtyalZYRHZ5?=
 =?utf-8?B?czJkWHc5VGZHaWRwbS9pSytCb1N0VXo1VkgvTmk5MTBBSVErK2hKd20zQXhX?=
 =?utf-8?B?dXBPZk54cEtXMk9LWEo4WDEyWjZHT3U3bEtVZFozTnNubGFRcG9yb3JVaVRR?=
 =?utf-8?B?S0xwd24wOVBTUnQ4cTNXa245bXRmUVF3RHREOExnRkJFSUJaeFd4aWt4WFdk?=
 =?utf-8?B?ZnpEQ1RHZUNlQ3ZZUnRGZW42Z01OL0F1WkE1MWxvd2dnSm9ROXhML1BiQm1n?=
 =?utf-8?B?QXIraHRCMGc0TzgvOHJ5YU1BdE5xK2lhUS94Wm9vUUJXM090Mmx5SFVoT1c5?=
 =?utf-8?B?aHVFcHVQbFZDc0FJbVA5WFRXVDZKcWRCeVZaQmR4ZXNXU29iNE0zNVNycm9m?=
 =?utf-8?B?dUE4aXAxVi9sN3B0aTNYKzIxOEVWaFdURXFJeldNYkV5emtNaXA3NE9ib0Zj?=
 =?utf-8?B?L09UV28zSWlTSTdFaG1RQU1oN2lIV0E3Q3lJNkhvOFZQekJZYXkzUFRXVnZM?=
 =?utf-8?B?TGgrb1BzUG5ab3VHZWRubnlqNkNpaVRicWFLbEp1d3M0L2VnSndvUTN0S1Bi?=
 =?utf-8?B?T3BCbitlUjBzZWJGOG1laW9VekZEUUdrbkNyTWcvYmZsRVdKSmptWUY0dDVU?=
 =?utf-8?B?M3FOczN6WW84Y1BqK0VqeHhCajFQWUx4eGFZK2Y1a2c2cmNUUXJQUHNNZmhF?=
 =?utf-8?B?OFZuaG1HV1NkNDcxWm5ubU9jRjdMQjBBMThvbkJlOTV2b1dxSEhLNmJadkRo?=
 =?utf-8?B?VW50eVk3U1dqQ2pTTGEyK2YwaWhrOGxOcXQ0ckVZd1BNYnJQdGFyZjN4cWpF?=
 =?utf-8?B?dmx0cWxKcWZWbVc2d1A1M0M1VEc3dEtCVnlvZjRjZW9vTE05dFRQWFJ6eGpK?=
 =?utf-8?B?N1Vsdmx6UVZnVUtKbEhvdk5tMm5vS2ZsMXYzVkRLUlBKQTJaWHMvbUJUaFYr?=
 =?utf-8?B?QWl5L0lWWERXeHJUOWRjcEdJSnAxaGMxNU5oZXhFU2xxMVFzdGRsUk80Qk5F?=
 =?utf-8?B?R014MzJxUDNaS2dEZlFjalN5L2RwajNIN0k5YnA3QzVTeFBKN2Q0YWI4b1RL?=
 =?utf-8?B?Q0lNNXM5OGlJR0g0aFF4aHNQYWpRREJLNDJ0Tmw4REFNZjRJTXhmdVFnVGFI?=
 =?utf-8?B?Y3dmem1xaHBzSSt0eEt5WXNhQmVXclVGZmtEU2ZZbVh0bHBmdm9LQVp2Zkd6?=
 =?utf-8?Q?fvXk7UZvYoaghR8/ML1KjZQ0R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caedbfb8-d930-4288-8e64-08db40ab9a1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:56:37.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA9SD6zxwOsqxotMr2Xia38OVeZgInKtW+Fk1VKvlxfvPUvZBfPtZv7eHR8A6GIP+JhyhPiEUaVgtvOpSZ1sTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176

On 18.04.2023 13:35, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
>> ... in order to also intercept Dom0 accesses through the alias ports.
>>
>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC, because of there being none.
>>
>> Note that rtc_init() deliberately uses 16 as the upper loop bound,
>> despite probe_cmos_alias() using 8: The higher bound is benign now, but
>> would save us touching the code (or, worse, missing to touch it) in case
>> the lower one was doubled.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -208,7 +208,7 @@ static bool admin_io_okay(unsigned int p
>>          return false;
>>  
>>      /* We also never permit direct access to the RTC/CMOS registers. */
> 
> Hm, it's unclear to me whether the comment above would need updating:
> we don't allow direct access to the RTC/CMOS registers, but we allow
> direct access to the RTC/CMOS ports if there's no device behind.

Right, but those ports then don't allow access to said registers. So
I think the comment is fine as is.

Jan

