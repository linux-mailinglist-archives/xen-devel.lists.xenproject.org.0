Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4B557973
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354878.582222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LVH-0008Ft-0B; Thu, 23 Jun 2022 12:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354878.582222; Thu, 23 Jun 2022 12:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LVG-0008DO-Rg; Thu, 23 Jun 2022 12:00:06 +0000
Received: by outflank-mailman (input) for mailman id 354878;
 Thu, 23 Jun 2022 12:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LVF-00081T-LT
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:00:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50084.outbound.protection.outlook.com [40.107.5.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02bcbf90-f2ec-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 14:00:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7534.eurprd04.prod.outlook.com (2603:10a6:102:ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 12:00:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 12:00:02 +0000
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
X-Inumbo-ID: 02bcbf90-f2ec-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqq6RWUATtdPNR9zdKtGKxEqeyw16skSiBdPaHka+fbjJUqvN3sT1ttY0Bg4+U3Hwa7tkrEpfDess6W+/sCgwK7okzVbktn/1pcl81H6PomQILIuFEcMQzrKCf9aAg3j75SWc5AGbP+A6DtFNgqE1ggOVw3biKZ9rU3/A09C2il0sOd9QHXATSxEL68ruoXMW/epgVjU7OdhjNE4FOcktyu8QUtjbSu4parEc+5/zmsTqyj1ZeC5VJXUchGYAmVr/MXO4st6lJ6Js1aKPSZSbRfyvKx0X4cvNgRyBIFfNk6XucX2YJ0ShUPAXnQLdzd94RfGT2lWW+tHqOgggEf6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY0oLw+JgO0O3oLJDGXCJgI7h6GzmAMlBIXPvCVAq0A=;
 b=Rqdj0atFOPcqAaTf5Dp75Jx6rPobcOaHfgS7i1grVIEI97og9HFpQCgb7HJbMMNe33fqJvY7QkaXrAPmFwGB3ojirZyMCiNCtvrBdoa2yZZSciXhyWgn69l//SWDv0B/KwaURcD+0GEAsjWS0AzGNIu0i2fH6kw5Vhmmu4JCxhwqJkvGDGglFgyIUfrE5To8oUhLAAjTR4B5iuniTgFyAmh3TLdyMzotmVzRrt8bSCfJ+mq2URt2d6Pj0AlwY+lcPsS1qQD0DEW/j0vMqwrFaCX2zAFOVsODeIjZPY2kDhoMQHsKU6o9ErB7oU9PtJG98XWgcoOVj+ccYarGWU54Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY0oLw+JgO0O3oLJDGXCJgI7h6GzmAMlBIXPvCVAq0A=;
 b=TpbuoeK4o+abSLUPsxsQqmuvLjXjNMAYvGv38pWV+DbBtZmGc1njaW6Idn9LIM0rQNQeF36HovMbog5WZFqmTs9re7e+4F1FlGIAfWidhbXd4SyR6PpmW93q0CQ8p7xrUJNvRf/V4SGYgeZRFujD7HLoiPvvfsQMuUnKHkM9frcbNFo9+SzRev1fNzgKO/KuW2KrgigMMHN6gkhOAZB5Oo7/H5Ei+Vq40OdQeRITeXXUUeMmIdaGxJJDJI2SjOV1PZOMxVI2WqLh/4gpTE4764QDIDd2/rNGt/8xmY/Kr+TmMw8Vfpd5RQ3CGGOi5JGU957HCIz3X81BX8XGsOhwnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a8a8f01-03cb-b84a-bbca-9c5f6d2ea9cc@suse.com>
Date: Thu, 23 Jun 2022 14:00:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Ping: [PATCH 0/2] x86/P2M: allow 2M superpage use for shadowed guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
In-Reply-To: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 133e9172-cb78-49f3-b29a-08da550fe762
X-MS-TrafficTypeDiagnostic: PA4PR04MB7534:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB75342D4E834C5B732EF4EC24B3B59@PA4PR04MB7534.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TRhAX4gdkVb4HosAf5UhwTd+aZ0HUdB7Tnr9IfLcTxUEk0Fgq9SfMyvaGI0TbCaS70NEuklSVAIYJw7ifuMp1FQkJ6NIkKBRqKHn9Lt4HIIbBQ4s94/DuSyquzTFdIDYvLsAbt1d+FyxSKrSgcRQQPG316lVWsr9WqMtuwNaJ9uuaXbawlvagnJ2/UvpPUWdXfUFVsIMqRd1rwMlbZ8dPu3ocJpchyysFXWLHKmTxGhJyr4woehrPeJ+JFELDZE9c3VQpPfOFwkYk22hW6AIIBZqFMwkqn9pxpWeyf+75OUpe+p5Ie4DCe+9DwUM+f/QB/8UMSL3jyCgUFWvw5+wGFg5RS1T0xYEAUxoUVkQwUuQsZ9lNw8rvg6AT0ZsibjWnA1+eN1S4bnxMzMbJfMdazstSJ1Na51V9wmwxisd4o6nTu8ngPsjeEPbtmIrfp7BSHum5/e2PdE2WsfQu4DtWRd95jEVF43t/jtoHQznTQajJWWLLZ5uEEHTByqfEYanxp8bO1Ba92aJWkszBllbACw2gO+2/S/6SsSIgkCod6AItmPuJdbaqKX7klh48EWFZhjqChLa5aM8ddefFLRnC268wns2MfiRHVIIdLTmBKXZG+GlXxy1msoFpuAWiiMArBV9s1QKSLPEFvOI51mBcGpdTrk9D/QFxXAdqgdrVYi4oXc03OPwthBom3GzPaAxWoqN4/LrxhtiNTYyGMzbqhBYkz/q25W5bKigCA8PsEQzcO36axVCDeyLgjylHnwE4uMw7lAFqPnHek6DeUyatgXhXCFK5tS0acfpZ9JYLmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(366004)(346002)(83380400001)(186003)(6486002)(54906003)(38100700002)(2616005)(8936002)(31686004)(5660300002)(2906002)(36756003)(6512007)(66556008)(31696002)(66476007)(8676002)(66946007)(41300700001)(6506007)(86362001)(316002)(110136005)(558084003)(26005)(53546011)(478600001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWFueklYNHpGbTJXZEpDUGpvU0pKYjRDNkpCQlFSS3psVjJPaTI5blhxczFz?=
 =?utf-8?B?K2VRNHBvUmpjd0pvL0tiRHpabmtEWkIwNFM0ZUdzY3VnVEtZN3c4cjBsbGt2?=
 =?utf-8?B?c0p3OXM3QVVGeFJvWUlMcXYrZytFZEI5dmdqUW1pSXJEQnd5OGhpS0ZvVC9W?=
 =?utf-8?B?cVNOVGdUblFkUzdjV01ldkN4OE9qa0FMWk5yU3dIelhOMVRZaHhZVTlvNXcw?=
 =?utf-8?B?Y2V2eFltejlIb3BpbWNnNkd4RVova245ZzE5YUtwVk4zeXJ1SGZ3Z1J3dFEx?=
 =?utf-8?B?UTBkL3RXZ2NrcFdaZjZaN1kvVGlEcHIrK0FQT21TeTc1SE1HRWVsKzJ6QU4v?=
 =?utf-8?B?NUZJcUozNk5IN3B5QTlqZmZFQW90TnJWTHFlY1JDUTdLTUYwQmRWM3d4VUk5?=
 =?utf-8?B?dXhsd1U2V1lZb1dZdnNTc2hLdy82VEYxVlVOMjRNVVgrZE52VTA0YS8wYjl0?=
 =?utf-8?B?blNuQUU0T3lzY2Exd294bU9wMGdPOVkyR0RzMGxJcVNzSXR2cDlabHhRTVBT?=
 =?utf-8?B?MkE4MXFGUWZaeVBrVHZkUllJK3dUYjdXNmtmbWVhVitxRE9ocXN0OGpNeVJB?=
 =?utf-8?B?b3cyZXlHc3dnanVnNXNFbnRXb2hNU21vVTZoQ1ltdEN0enF6b3Y2aHhqTmp1?=
 =?utf-8?B?MFdMVEpKbkVMcjB5cy9nSGZWak9nMXI1ZldmQnRRYnphallTUldNU2prZnNT?=
 =?utf-8?B?dHJkNUNteDRvRExaS2R5TW8vdWpoeldMaW9mZzcxb1RxanRBcHg0OXYwK251?=
 =?utf-8?B?bjlmSC8wQ3JtVUtNZHhBM3NFN3hRakhlZG1OS3VURTZ2VmE5L29nL0lhOUpk?=
 =?utf-8?B?WHJwbDNqUVNWRm9XS0VidmxkajQxUms5M3FId3ZYQ3BiOS92a3QyZW9TN29L?=
 =?utf-8?B?cGxWTkpVRFhFYUp2LzlVVXA1MkxiOUhUWGhlejdwQXpvOEIyNFdMN2grUTdE?=
 =?utf-8?B?MXR5MlIrbmFhbTJKTnl2ZFJqM28xZkp6MHZaeUhtQmF0WGhTT0drdVBzZlRF?=
 =?utf-8?B?R3VIT1FBRFNwb3BxeDdpWnJ4YXp1L29VMC9ucUpLN3BkMUk3MERCVG0yamN1?=
 =?utf-8?B?M3U1aGdGRVR3TE1uK3dJaFJNcm02R05oOTF4dFQvRWhlOWV4dTA0MG5hbnpx?=
 =?utf-8?B?bFJaSElaVm1UOWVTQXQwL3NLZFJTR2k4VFZKS3NFWk5SdXBrWW1vb1JIOHFH?=
 =?utf-8?B?V1lyRkJkUGRyanlUckFQbHVFeXhqOHN5SWdLVmMycytNQzAzaElFVWdOc0ww?=
 =?utf-8?B?K3owRG9tWkwvbG50azZ0S256ZWhPR1VvT3cvREVScmxBc0JoQWF2MWRlRHMx?=
 =?utf-8?B?aHNYdldOcUhGNm14T2k2K2NMZHFoN2hpMFBzWXNIZElQYzFkTm5Tb09Ya3RB?=
 =?utf-8?B?aHMyeG1selBHYVFDclkwckVlenBEclhIYmtzZnJJaFNoeUc0RVZ4OWsyT3pF?=
 =?utf-8?B?dWN0MTBGS2NDWFA0d0FiVGo0akx0YmhrODVUNGdDZk81TEw0WmdyQ2Y4UzNF?=
 =?utf-8?B?MVkvUkdpaGZTZnMrK3R6UDBUTElRM3R0NHZjTUt2WGxjNzd6bDFMS2paOUk1?=
 =?utf-8?B?Y0dkQ0dPTkhsczFaRmN4VmFRZnArc2ppTCtjR2hyeHp5Y3JuMHdrT3RtMHkw?=
 =?utf-8?B?ZDJ5d3JhQW5sMEhJbUNMMjNFWjVJN2kyckhSbWU5N2IzZDFzWUZUb1Y5a042?=
 =?utf-8?B?M3dnMDNXdm5Yd01xV2c4b1NZa0RwN29makRZUzNMVUk2bTdnQzBkU3JXU05P?=
 =?utf-8?B?NWcwQVZQUFltcVRNb2V4L0lvWEVlaHV1ekNVb3JLYUlTdzRjTTBPMi80NU5z?=
 =?utf-8?B?Q1BEdnBzNzVPZTNLMHVDeTMxcmNEcjJtdUU1cUlndCtpcXVIOU8wV3Rxclov?=
 =?utf-8?B?RDRKMFZ1RnVWSjUwNjc5SWY0Sm9wUi9JcmZLUHErcnAyaUwrRUJqSGNOekFY?=
 =?utf-8?B?T0V1eUpIRFBUUkIzYzJKOFJla1FNL2hWRURrb2l4bWpIejNnbzUzM0lMQ1B2?=
 =?utf-8?B?dWFNUEpOSHN1R25reGIzVkRmRDQ2ck91NE01bUdiaTRzUGxsUGhMZ0hNb1pN?=
 =?utf-8?B?THhINTQxeVRwbkdrM2g4THUzS1UvNWM0SC9Hdzg1eDdqVXdlT0Z1V0FLd0FD?=
 =?utf-8?Q?VGagl0Jqpv+bJ1Ur6tlaGFG+Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133e9172-cb78-49f3-b29a-08da550fe762
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 12:00:02.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEZUnU8WYPaC9/SntoResj86C/oNIP2tZ93RlvzgLfcrSzNpF5LfGFloa3wruuc/yvNeOY1GPlDZjYOdpYJMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7534

On 09.12.2021 12:25, Jan Beulich wrote:
> I did notice this anomaly in the context of IOMMU side work.
> 
> 1: shadow: slightly consolidate sh_unshadow_for_p2m_change()
> 2: P2M: allow 2M superpage use for shadowed guests

This has been pending for over half a year. Anyone?

Thanks, Jan

