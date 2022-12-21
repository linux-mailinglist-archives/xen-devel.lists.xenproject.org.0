Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE406652E75
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 10:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467655.726684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vLt-0001la-9m; Wed, 21 Dec 2022 09:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467655.726684; Wed, 21 Dec 2022 09:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vLt-0001iJ-6Q; Wed, 21 Dec 2022 09:25:29 +0000
Received: by outflank-mailman (input) for mailman id 467655;
 Wed, 21 Dec 2022 09:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7vLr-0001iD-1i
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 09:25:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2074.outbound.protection.outlook.com [40.107.14.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 668b97aa-8111-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 10:25:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 09:25:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 09:25:23 +0000
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
X-Inumbo-ID: 668b97aa-8111-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac4Mv8aYixo6cY0bQAnILQ2ot8zAJgcnj+RIhX6rCP4RVoGlhqjdnqwx0nqEfkf+oZl+xjzACd3jy8vOkDOUaC9AvK1ftVn2xSNpP8fRDVT6+mkM+VGNBwUrbkg6QK57MrfGzW6csuliD+wXZUjX5cdl6pGQXVP2YkXkwr1qJoH+FVp1XbtDtQF0eO4WilQU18bNQH80A/xOUbshB01VMKqpY23kTYfH4Jsv5UmQSYqE9TWl4PfrW9DSw8FZATXy6EoTJyydmPDZeVtsdDIda6YqTCW4qZ++N2+0GIpAwjIxYpBesV/xhHGDJYFWek2dbrufvk0o8crXqIc5lF6e+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Afbr0GHsM6eA05h7aH4WcjeitjCtOQBtgPnVt9trW0c=;
 b=PUbumzQT94+mBtjMADnDFIV7Lb0sPN6eCMsuceMLZyhFZ9p6E2XsNod7r3CneFJyDGjwC566voMrySou26LhytHiDhn80pMejyAUfNhuOEVM7hV1srhmM8RNTVgYlLretQKe+dzSR6n5QbHedMxhJg0ZYTAetGBYWuv+ESWeVhG01TnuPI2XGuLZjSKqNhnUPwP8uF0l0cZOHv/gSl7hqC4u9SOIVniSxr6QMp4ReI4Kj3qqERdt6MOcKDo2zY+x7lPaj/6mi9nIeZnY6FM97RSG89NzMOOCz7EcvXxfFVXUB2zbMkUja3Rbir6AbRt7ZG8rAzVCUsRsDtx0+AAmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Afbr0GHsM6eA05h7aH4WcjeitjCtOQBtgPnVt9trW0c=;
 b=r4N/mG18+BK96sxkxAqAv2lECIR+e5UJqKktRhMNiSHJugO1JfmSaq+kC18QHMSz3OM+/97z2W0Dz0ynbIzJnF+7INPcbF534Wg/UZnbgWIXKi2T1Sn+S67GCfbAC/c15EG39yXZQv8UF85LXV5NgHlJ6CUSwg/gzmcz02VMdE6FwlZ2JPOxAhVlSQfXKORDQIkXT1Xzfa/hEkinx8Qogaq5PxB4C8vgRrz+pDFFDRESVni3f91Q9eLZhCgYFOdW4Q6d+rDEk3I80DFfTDQa1/OK7mroQO6sjcSWUA5+9JdZY7mmv5z7AUdYlSvalz19xe8bLzXEbeRFQEqIi/nk7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b36597b-635e-6766-50a0-2fab6eebe988@suse.com>
Date: Wed, 21 Dec 2022 10:25:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 17/18] public: misra rule 20.7 deviation on errno.h
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-18-luca.fancellu@arm.com>
 <77931264-71a4-edeb-0749-9de77bfd9c1a@suse.com>
 <5493C27D-32EA-44BF-B3F9-DBF5274FDD3C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5493C27D-32EA-44BF-B3F9-DBF5274FDD3C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bab2dc-4431-44c9-2b24-08dae3354997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APJ/XGRA6TVy5uzY1P/nHwrr3n2+wGjQhqHWC5svXD2SZ6K/714fUzW61KfR+ICXHtjo92cDrYPQbsBi5+zsGZyS8RALmW0o48Z/HA+0Q5oe+gsfqgJVZ6J6sBbQqdq0CgLMxMtCe9laV5eljbPZEyA2/1DbT+tnQcfju3KbCReuU7MYtFsKqnOiGJgheQKZUFk42gN9anY+5liCwI+Ets/Ble1MTZxN5hTI9xf1LEOPviS0O5cOMcdp/BWq0ZadyrYwZRJfwfVg87vli7sF0sFlY5ZxLgB+pN3dBLacesM9XoDISALfkTWc0KKICYZagDRu5Q5e0DMnARJKW4SnAaHILcvQEzdcgqyAQn1KcsC6gtHOxTJLs4nsrxuwyHquwz8q5UZQTRjh5SzSP+2kK9w9j19d4k9rOJ/FUw6XRR1RUlaSjxH3EqIUmJNINUjq4i9uO61N4Q9U2H/D+DtlwK0gAXAAvgCaSEVNXwsS2kzLWXJtO0bD9RzXyaylZ3rAY1aZbrtmJNpAQpTf4M+oyHfr6oEgyFEnTAHWV9aGcbdFtHfSGD70yCQnpiVB4MLs0dp9ExTGv/y4sTAgSerskJIygle302dR3IxhvRqlzBAtWig+yr+yYas6HB2cftyyA4KckNHn7CWRcm2t9fdapyrHnoGpbp+T1Ss6twiNAk0iHKZp/i7COY+EMJflPlwAzEfFIjDZ3/t53/dMQ5h/8ndSjIGf8zcT/RB82GeWmTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(31686004)(8936002)(66476007)(5660300002)(8676002)(66946007)(316002)(4326008)(4744005)(2906002)(6916009)(41300700001)(66556008)(54906003)(86362001)(2616005)(31696002)(6512007)(6506007)(53546011)(186003)(26005)(6486002)(38100700002)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2Z1ZlZIZmZXZWJ3cWhUeVVoSGNDNFVXSXFXVjRzVDMzcWtscGlFNlFrY1dj?=
 =?utf-8?B?aHBBaGp0T2ljQWE2L016SGhWN1EvclNIRnk2ZDZSenYvZEtWcVhKektnM0V4?=
 =?utf-8?B?eDFMYTNLODV2S2tXSDNUVVdCWkVnUCtHU3ByTG9sVHA3NjExTW94cnZ1bVZU?=
 =?utf-8?B?bFdYaC9EZzVaNy9OY0NZMlNzOUQzcWZZN3FiRDlhbFppWmxFVzlVOUxteFNh?=
 =?utf-8?B?R0xiTjVNa3ZUUGRSSWpxQ016NmVXY0FPSmFucjhvbExpNXhwSnd5RVpIWW1K?=
 =?utf-8?B?ODltNHBaNVY1OHFIM1pIL1NlTllFZUx3OWNpWUxCNzY5L29tQlhiS3B2d2Jq?=
 =?utf-8?B?MW9FWjZVUDRSQjVDTXBSSDdsZ2ZvQWYxNy9iY2Q0eW53bTdXUHNVcjZtRGZm?=
 =?utf-8?B?b09pYStPbGVYeDlnMG1PZUlWSEtmTGJnRDRmUW50N0JJSTgwSVJVRVB6R2hC?=
 =?utf-8?B?elcxMTRaVmxyMlZFRkx6SHJtbi93QUtnMTd6T1VGQVVIK0x2V0FDNnB5Wk9o?=
 =?utf-8?B?UHM0c1liUzlxa0hNSTRxL2JpcGg5Rm5nNVJWSjQ0bXRlbERJTXhYSktYckdH?=
 =?utf-8?B?YWYxbGpUNVdENlJUdzd6RHkyUkplMHkxZnZ1WndYMXY1bEE5bXp3aFJibkVq?=
 =?utf-8?B?VFVMaGFubU1oZUh1N2JxTjYwYUNBaHNZbTBUWTRjeDBsV1EwNHNlK3JCVnhL?=
 =?utf-8?B?RGt0ckJ5MEczVnBKT2pqNkR1b3FEN2h6bHowV3RwRlFSV1FmaUhKenR4SXht?=
 =?utf-8?B?ckZZSC91N3hFUElTUXBjVEpFVFhlbDR4Z1BpZ3ptVDYvbG5IakFHdi83ZXNl?=
 =?utf-8?B?UVpDVFRGZFhXQmNHWmVEOEo0TWJnMkt2S3lPcEIxRnpXZ2dQVFQxeW1kRlZN?=
 =?utf-8?B?RnFUUmlSbGFGeHpTcGNrSkZPYTVUT1Ezc29Mck9rNnRtSGR3U1JvU29ISDNQ?=
 =?utf-8?B?WDBBdklHTWpLSkE2UkFGdjg1bU11NVh4NTM5TjhBdUw5bFlxVWw2eis3bkJp?=
 =?utf-8?B?VWhOOW1YclB2NUVyZm43eVpiYm9OQUlKanpmc09KblRwZit3c0xlR3VKZjNL?=
 =?utf-8?B?b09jNmNIeFJoMzhmOWRBZ0ZOZmIvbWhKbFJNMmpyQUh5RmIvYkNaUjg3Y3cx?=
 =?utf-8?B?M3l4MzUwODNrM0NTL1ZkdjZ2VWJ5cVZqY3p2RC81OWJZUFlvS01MUWYwY3lq?=
 =?utf-8?B?ZGtROWt5TFdteVdkVDQyQnVFTmF4QXE1ZmYvSFl0VXY5a2k4aytJKzNHVjhZ?=
 =?utf-8?B?Sks1REh4UmhWYnFjV05IWTErNlljejV2V3Y3dnUvbjFVZ1F5R21qdmZNMDdN?=
 =?utf-8?B?a011QjR5TUJlcjZzVFUvMUExQVozNnFaakZDZ0QzSWd1ZkpUZHQyaldodmJx?=
 =?utf-8?B?UVdCNnFoMzFkWEJmUUNpZlpGSlJzN3NNQmhXWkNkczk0SXYwREEyak1MckdT?=
 =?utf-8?B?MnR5NmZHc0JDTTNSUGxCczYxUUxrTzJTUkdrUS9weVVCZDAwU2hZNndncEdJ?=
 =?utf-8?B?MnFyL29hQ3hnWjFzc3o0NVdSMkJHMFNFZmJRdnpzM3A0ZG0vNmZrSkFncnZQ?=
 =?utf-8?B?RWhLRDB1LzBvbXdETDUvLzlLdGZPemtTT3FpYzFHdytqNlJ5bjNPeVBYK25s?=
 =?utf-8?B?Z0FmSTZvb0ovZUlYY01td0xpNVpVeFBqcldNY2U2cU1pcVZwSmh0bjBiNld0?=
 =?utf-8?B?aG00N0xCRjJwQzNkc2o3cmdzMXpadTQ0Y2pJWUNQZDRuaFpXZ3BQdlJsS2du?=
 =?utf-8?B?bXdBanBLNFQybWltY21sT3hwaXZReHZqSkp2Kzhzb1BiV0t4NWd4Nkl4MlJX?=
 =?utf-8?B?YVR3Mzg1Ykc4VDJuWDB1NzNSVnZtdlBsNVR4SitZd1FGOWJnbUt1REVwVzBp?=
 =?utf-8?B?d1F5UCtpdzNHODdoQ0laWDZ4SG13aC84UW5kYTZzdkZBSE1yckxzbmE5QTJu?=
 =?utf-8?B?WnhBVHorZ3dSVk5POHlCTEw3bStpZ2xMVmw5aEZYRzB2UVFkWllOR0JoTWly?=
 =?utf-8?B?aDRNWlJnZkRwL09GdUl1ZEZMdzhadG11OFYzUTltVjlPRENRWTFoZldxNU1w?=
 =?utf-8?B?WTFpNzBUZHhjdEk2MmNUSDNIQ1lNdVRuSHpOUGJHWnI0N3dURmJJbzMvdFg3?=
 =?utf-8?Q?9W9dGpnc1tPoX/tJrHz75j2xQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bab2dc-4431-44c9-2b24-08dae3354997
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 09:25:23.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcGhRNFKtHm12DbC4R4spt7qQh9Hz3k7ijDp3dtxti1tAYA89bX5ogdtM542VahqfwmaZ1mXf+LSk9P85DVEFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 21.12.2022 09:46, Luca Fancellu wrote:
>> On 20 Dec 2022, at 09:51, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.12.2022 09:50, Luca Fancellu wrote:
>>> Cppcheck has found a violation of rule 20.7 for the macro XEN_ERRNO,
>>> while the macro parameter is never used as an expression, it doesn't
>>> harm the code or the readability to add parenthesis, so add them.
>>>
>>> This finding is reported also by eclair and coverity.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> But with the title adjusted - this isn't about a deviation, but actually
>> addressing a finding.
> 
> Is it ok this title:
> 
> public: misra rule 20.7 fix on errno.h

Sure.

Jan

