Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34317CF0A0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618919.963233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtN4g-0004IG-BN; Thu, 19 Oct 2023 07:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618919.963233; Thu, 19 Oct 2023 07:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtN4g-0004Ev-8O; Thu, 19 Oct 2023 07:04:06 +0000
Received: by outflank-mailman (input) for mailman id 618919;
 Thu, 19 Oct 2023 07:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtN4f-0004Ep-0E
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:04:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afb974f2-6e4d-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 09:04:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 07:04:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 07:04:01 +0000
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
X-Inumbo-ID: afb974f2-6e4d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR05aOQU1TFEPMK22rBGFVQhzFnUxFIqmdDikYpnbpUbLkC6/xwv58aInW2zO8Hb2nAHlhkeNHegFfIlDRZMJ7A47hpDPARpMbeGGkpSC1m0lrYvLxF+D/pzTQ371GuHJ8lnXa7qhYKeg2NrZYpgBSfeQ5rTaMKI9GJnUh0Ea3LQKA9/FbuFgYVaE80AK/gYZDdJtkoWfVtjTA/TbLqm6j44EjvNfDMHsv8H0IVWDRteAFeu0Zagw1IR3pRKl7fttnzGc0hEXCV16ofKsWXukwEaNSmKJg8JtPvXmyIHSO3vzAwujzcNM4xgZVDIM+u6yFgCqz97/zwfCrWaqBTQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm7zzDCNquY95ZThtAd9HyPjgROfnWsn8rVzmO8/BgI=;
 b=mpb4m0ZK8AG2k3Y3deskk83GLFH0+XgzFhWv6cklsrDJcllSl1jQitiTyfBwRbl/dUldYT0+ZRBd4VID53hc4MLDeXuIFILXDZoJFcaU6OtVdd35jV10tQMDL/zPOMmKI1YLcFsXHJWHrZ3eqyU3h/RFZZegcvMUwY5jeClVAW+W/BgCias3vvMPjSYjOqol4yver7XI+5Pr2oFSbe4VF7NJs9V74QYnaQ+2ia4iUc+83YIL148QzIAcSyDt9RVxPdGB2aoCjA/eoz5fOOw57XGQ5a5AHNVZ4tUNdomf7O8zgDwjkxWzXizYYxA2eTnNY1OjwyLMXmftLP0xzLDvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm7zzDCNquY95ZThtAd9HyPjgROfnWsn8rVzmO8/BgI=;
 b=0TjvvVfKuyTROhSQn3OElC+a0HY+bJ7DrPL2VXdIYjIDmECYpMNAyca48Rg5bwlolQ1yH8t0roRidJBPPft6fY9AdlOqRnjzunxpgusxoCIMZ4ZQssCcVYX3lHJ9MWSq/caWNo9N4wh6qsQrJXv3WdszBs1Twk1HiTL6xBZbrcp3Kpqn3LKwFneYYepns9aQy4IinnoOem9dos5RTCUKplEB7GEID4vzb0GgSgc6tO40CHWOOSnVE54gCCJIe1WSgQLQT+kHhNZwMSfgiKn3OV7gJyshBPU6PlgIUaPlyFtA9vSsgk3LsSJCDMj5qvOuKgddnw0sgHXvLo8m5N/g0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b44bf79-24fa-abe3-1759-da1dd5d3e5de@suse.com>
Date: Thu, 19 Oct 2023 09:03:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
 <35abc556-2f66-4498-b567-87e6a3216d50@citrix.com>
 <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: bfff18f7-2017-4495-be6d-08dbd07192db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AFnLhe/E1RVXgER2qd4XXZamaPv3Lxlbc8zbhyQ9T9JcudwdstGHiH3VyMu/r4+TBnO59O1JjatQsYITb9RYLtJJoiSsweqSQOg9sPycu6snZ0mI1yKIuzxd811VKrk/B8gQsaTVUddUdtOdIAC19jZCdPNA369d6yWO0/hNjwJczBR8mLNGny+spf6ctKJq4zDrVjfdUflHTL62CnFYsWtlvn45bk0+OUUemUcFBT2y9d24sjGq789Csr0LoCm/WPiSB6lxDQ7lwI6REhTN78kUFmWq8kud7jq2/QUossd4EoFbx+N6a89ecaXiG1M8ku2J6Er+NOzsZFiPgwuMpSU5qv+51b5F5XmTQ6gnVFFSAyVDgRz5cEjpGGYhBmj6EvSfl5ZNwVxRiQOwHF7++4ypxpP+IExIgUHafDQUXQ8SEu10CmUWSPgaT8ZtMclhiuq7TzBcF9as0qrUD1bjluAVu166v7rQAhVn7u4W5YmorPCqFASdWwZ55HvhBm6QvrY+edmW+oUqx40xauaxJQC8j6JJAQFKkKsO7nbpigKL8dKsPP5hiQR8JF/YZqu5IJ/9KHQq5uMa2oBSal6Sdydpt4efrvyM6avlHi5UQw9u+Fd95T6+FS10GgIyknP4sid7RrwHPbqc3wVGEe0Ozg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(7416002)(41300700001)(38100700002)(83380400001)(31696002)(86362001)(31686004)(53546011)(6512007)(6506007)(5660300002)(478600001)(26005)(2616005)(6916009)(316002)(4326008)(54906003)(66476007)(66556008)(66946007)(8676002)(8936002)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJRV0tQZUFBY1o0RjBZZFhwM3I3TzdnRGU5dlhGRjRpbG1HMEJWVnhnK3VL?=
 =?utf-8?B?STlEaEdCdFc0YXNJU2ZRWVMwTk5TM3NHMGl6QjZDeWhvcU9wZ1d2ZXQ1b3du?=
 =?utf-8?B?WU9PblRTK0V5eWprYjhZNU96bFlsZWF4elU4azYweVcvV05xOTVsNk90cUV1?=
 =?utf-8?B?a3d3YURlMEY1cWtQZnVqUUVoaVNNRkh6T2VCNUNtMEJCZmowSEo5dFg3R0Zi?=
 =?utf-8?B?aGZvZG4vRnp1MkFLd1J0M05hVFNYOVNXMjdwMHpuWU0wd1VpMVo2SUR4ZEVD?=
 =?utf-8?B?RVdJc1JFWWs0aC92OXpEMWdMYmZ3Vk1WSDVTQ1pyRnJpUUY2VGE0a0lMR0Nk?=
 =?utf-8?B?TWNHR0pZbHNBUXREZlpKSlkwTTJSTlUxaFpzcmx2L08vN0V2TXpBY3lEWFBw?=
 =?utf-8?B?cGlLVmZoK0lqZlUrVEZrSnhKL2d6bHFhWHVtcU8rbURaRHJvZlJPdFNqMk02?=
 =?utf-8?B?MHVqYXZydnRBOUxrT0FVb3ZzMlpwcDlBanl0ek0zK1R1Q3ZJZy9JeEZXTTVx?=
 =?utf-8?B?S2ZiYmpLdmliQTA2NDBsR1ZFWXRjYStCMENBVTk0eEk5YW41TlpQTUpQREpC?=
 =?utf-8?B?NWgwRzNGYjg0VkxDQmpwTUE5cVdZNldBUm9vR2RjOVBSWlV0MzZqbHdneXFt?=
 =?utf-8?B?RGo1QjVIVnV5VXVJbnpoZ2IzZVFXaGJjdjFHYUJrdWQyeHVrR3VoN1o0UmlR?=
 =?utf-8?B?bklESC90a0QrTDdrZ3JHVnFjR21QTVREbmFiZWwxYjFENUs0dklWK0RGazBK?=
 =?utf-8?B?VWozMWdnMEFTSWw0YnNhbkRyOURXSURjZ291eU4vZnlRUmE4M3krK2d0czU0?=
 =?utf-8?B?SGNPT1BNak1KRUVLTGlXN2V0S2RURFNkN0VKY3JRK3U1YTlpWldRSU1weGJN?=
 =?utf-8?B?M2dHeUhSd3hZTTNHVWhGc2JMVWNmSXV0c0xMVkpwc2psNTBqSDhEV1pzc21I?=
 =?utf-8?B?YTdiNDhqdmU1NFpkRUpRUDVXRTU2clF5Ti9Ma0Q0U1AyYzNLUGVKZUlhamls?=
 =?utf-8?B?TjE1TGY2dlZSd2FYQWtWaks4a1MwV01NaHcvNG1HRWxjaFBlbytGd0FsSkZQ?=
 =?utf-8?B?OHJPUVhPa1RCWEtHdTQ0YThLOVVVbjBIYzg4eDM5MVdITXIvRGFrOE4vbzBo?=
 =?utf-8?B?a0N2a05ZdmtDQjJqVmN6QWxjMUhsOWxWdmNNYkU0ZFNGR1dtdFFGOS82UEtE?=
 =?utf-8?B?Qjd1cjBCeEFvU1RlZlhsdzJOTmtsUkhYVStOT3RNYi9rclRJUDlxcnJMUWU1?=
 =?utf-8?B?SHAyWk1PTHdwQWtSR29rTFpjL253ZC9iVy83amFTeWF1VCtOclZwUkF5OUg1?=
 =?utf-8?B?V0l6Qk1qMTdsY29rYmE3bjNneWhNcFpGR1dyZFBVTE9ybFA5MFFsblBTbFRk?=
 =?utf-8?B?NjFtM082RE9EUmJXVkhJNGFzOUhRVVphd0x4S3A0RDQydjJRa2lVWDVUN2ZQ?=
 =?utf-8?B?QmpmZk16MGh1aTdOOGpUblIyemI0ZEJNenlBTkZ0QVdqcWZrZ0wvNHlDRnZV?=
 =?utf-8?B?eHM5cHJ1d3dQdldtenVlb0ZIZFNrNVk5VVlCTG1SZk5xU0orakVKUUZXdjFX?=
 =?utf-8?B?MldUUzFHOHJlTlRDM01YdWI3MEljVFgzaTNoWTZBcWQzV09Ea2hvMHE0NXNW?=
 =?utf-8?B?cEhzYVVidGdjQURJdlNIZ2RFMmUydVZYNFFYVUZlR2VuY0cwUFFTZWVlUzFs?=
 =?utf-8?B?cTg5YzN6M3UveE54TDU5OHZoYzZOMUovM0VKdDZORGpkY3NkbU1iajVia2pK?=
 =?utf-8?B?dnNKbkVVM1A0WTJnL1AyZXpWZk5BbU5RaXdRQmFCcDJ1Y0xwOHJOd3hDZU9J?=
 =?utf-8?B?WUo3aGRySm13YnYwZWRFbHA2SUtjYkZCODdjTE1pcTRFTGxTaktEVnU0NGs3?=
 =?utf-8?B?U1h5M3dpLzN6bXdqcU5ERWYveFc1amNjUlVtT3Z6L0M1cmhra0RYTFJGZE1U?=
 =?utf-8?B?ODVhWW91NEprblJoSEMzSW1KdzlCemFiSjRzdVY4QmlHSnphbE5SSWVLaGFV?=
 =?utf-8?B?S0RhMmFMZHJWelVnamh4eXJTRi9UME0xOTZwWi8yZHphZ2xUSXRvcFRyWVp1?=
 =?utf-8?B?bVU3UVpVZ2xMeSt4NGJ4d05NNk91UUFIQ2pGMGtJZFZpbzdzOFdZKytkbHZE?=
 =?utf-8?Q?KDQnQ6Y1VlTI9ipCLKNxmO4Gi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfff18f7-2017-4495-be6d-08dbd07192db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 07:04:01.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjVE2wqXAZOohzA2HfsMnt6cAA1pZiXJiAc+dgcavLc2vO4t5xol+YmgtxDKrScr/5IZMP+y/EXDkPjtHp053w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

On 19.10.2023 02:54, Stefano Stabellini wrote:
> On Thu, 19 Oct 2023, andrew.cooper3@citrix.com wrote:
>> On 18/10/2023 2:42 pm, Nicola Vetrini wrote:
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index ee7aed0609d2..1b00e4e3e9b7 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>>>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>>>       - Tagged as `safe` for ECLAIR.
>>>  
>>> +   * - R11.9
>>> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
>>> +       scalar, therefore its usage for this purpose is allowed.
>>
>> This is still deeply misleading.
>>
>> There is an integer, which happens to be 0 but could be anything, used
>> for a compile time typecheck[1].  In some cases this may be interpreted
>> as a pointer constant, and is permitted for this purpose.
>>
>> ~Andrew
>>
>> [1] I know I wrote scalar typecheck in the comment, but I suspect that
>> what I actually meant was non-compound-type typecheck.
> 
> To help Nicola find the right wording do you have a concrete suggestion
> for the text to use?
> 
> Reading your reply, I am guessing it would be:
> 
> * - R11.9
>   - __ACCESS_ONCE uses an integer, which happens to be zero, as a
>     non-compound-type typecheck. The typecheck uses a cast. The usage of
>     zero or other integers for this purpose is allowed.

"non-compound" isn't correct either: __int128_t, for example, isn't a
compound type but may not be used with ACCESS_ONCE(). Furthermore
certain compound types are, as indicated earlier, in principle okay
to use with ACCESS_ONCE(). Both are shortcomings of the present
implementation, which imo shouldn't propagate into this document. I'd
say just "as a compile time check".

Jan

