Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB8651DD6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466831.725782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZAt-0004vW-Ne; Tue, 20 Dec 2022 09:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466831.725782; Tue, 20 Dec 2022 09:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZAt-0004sO-KQ; Tue, 20 Dec 2022 09:44:39 +0000
Received: by outflank-mailman (input) for mailman id 466831;
 Tue, 20 Dec 2022 09:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZAr-0004sI-Dm
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:44:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ff6262-804a-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 10:44:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7067.eurprd04.prod.outlook.com (2603:10a6:10:12a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:44:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:44:34 +0000
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
X-Inumbo-ID: e9ff6262-804a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRWjhcEhfsiD74TjaVbhClWEMdg46rXTy5p7TRJAj39A5Vi114gMMIChrisEDtXNTTB7r5p5h85fg1T0Vf6eeULH5zthqYRYNKwymYAYXvhKsHbO/hmh7kO5KbfJd3gRIkMjQ/cvQpY4eBpVId6rczkWE/eC9zEAUj73jHQrQyEz2TcCFdkiXUwzpVXsWyGslv45zZ6KGvPzDSpp4jve9zCpx356/gSYwsAbzzWTBhI8vrpkPjF+X7n4/PsVUzoV7nUVeIcZB8KamUMGgiaPC16h3NRZTQ4jMEKOvh2bTLDo7GswdWTkWVw1lFh8BliXh/X0sj6OoUkpQ/7egom+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn7b1slLY8wvu4lXcQuKb6YZeycbPJDIEKL82T3pcg4=;
 b=mOY/Q8QrsJM69o7qFA7xpIkmCHcldDDTDxmJLcgmSbtDUvoDOP3ODdeXf4Muz9DnOsYZ9MItu8hhcKjSAsWBrDK4W/QsCH1UbVD4B9tA5KsyZ/xvu1wVwiozwpP2arvmp80fO6EYwz8r4+ETcJ/H9s0nuRZlOCKxNenqEt2A2kVE3AG3uXRI23N9b0wP5sjBo74KgA46vRK3uawgT6EKhY4Arvnt3Y2x/AwufbT0ybIW8R+Uw837dsaaelln8TeAEbjCwNKGbZu1XOOpJL8F/1s7wWoHY0Fu160kEjI3hsHhrtMg4H4eBCs0NZ8W/UNNBQ27alkS4z6513rNtkIVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn7b1slLY8wvu4lXcQuKb6YZeycbPJDIEKL82T3pcg4=;
 b=xqltrtkccvfOwoTay7gzqV4aPvhnv+bOkneY3j9RfAb3KqXERfQrAGP097gVRlXTg5Z70AVuHrpg/On1Tjx0f8bqG/W74NwAKY6oo8w/Id4eFmh6hS9oukhe/z6WhHG+uivdXTVB07bVGrXGyY460wsb7cEylFFPRbQZWcjCsfrudC/a5//MIkRrLqvUzL/tIfABeBpxuNbJ2EIvEq3XDLcYageqrMmp5cTx9LNV4maN2ornKyXfPEmyfEGvW2KxVOgWGvCFLf8zUxPTdZPjfsvIvZW96MWm4NlxwFeyusdShWpKJxRne/fMMEcHQw4GhowfFFjDU1iFd/EGQVWnIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa6ddc2c-b8c5-354a-ed94-bd19fde1a21e@suse.com>
Date: Tue, 20 Dec 2022 10:44:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 08/18] xen: cppcheck: misra rule 20.7 deviation on
 init.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-9-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221220085100.22848-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf984da-7e63-4d67-d8bc-08dae26ecd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AtTAEwUauABcCD3E/+Qs2L7Rg6ShZMY1RCM3CMa36tqwyxO5F9hEB+XSr5CgzTUICg1cZM8GANwR7QgD8ytmQ7VTteGQnFb8hDrHKNJBMfxMHzHwPwV6AoVdy2MUg0/+voOwlZlR/ZkO8K5qrhvxtl5NyzcL1/EOlj4/5FG6CdtFVW9+nmD9LPVy0TwzR3PWTatXlspVcAxwKDa6gz9blehsKTa2c2vFVEMRNTDgV5to6jxqweJ9R6cS3oAuhLdRhnzEmgC+RZfbq004tyhrXhqvrUPvcL5HwyOVgXrbCE3u6KV2jQb/1DuERopC2YjnLmaO3YyYDWvP55dmGFwG4r1YGSqRRn0Te6LuBNaBMXJLkvVvqBR0Uxary8xn5XgC7Y9LJiSvO9m6qrIv3mXbyfdzh9tCyXbL+jbWKLLR9g9y8cK2vGwMww4+N3UlIgIZDPlmbIcgs0BWSbetkvBvN8hraZMST2V3Hnh5oelGgP+tUKyPi4klZy82H1e1n2/IalkVpQ9haVFY2rBMOD6uF5c+m5tcHuXeXcVbolU1L3mLNCz8725VbdUAdnw810NKXcu6kukDM6IuK9VjRvtUoYGzPn7hXGe5fpW7KhX+ZowHn4LFtnXVFgd4Vjfbu1+oeaTRI9tS/YRz5lxWse3F/TIu7Z6sdVUqvnmenIULAWjdXl7dNzQtvGX2ivb15+II+Tal4ozoSLzEWLVBi6t22Uf2fuA7qmR0AHyfSYBok6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199015)(316002)(4326008)(5660300002)(86362001)(31686004)(8676002)(4744005)(186003)(6512007)(6916009)(26005)(66556008)(2616005)(66946007)(66476007)(31696002)(478600001)(6506007)(6486002)(53546011)(38100700002)(8936002)(36756003)(41300700001)(2906002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhCSUtKNnRGb3R5NUViWENLUWUxZEtuM1RsQVN5bEZ1a0JPMjJkejVZdWhD?=
 =?utf-8?B?SVVDUjBaeENMRTg0WWc4b2ZjNnNHOTdHdWFxT3dreFFPTTZZbUVyWHlQSS9M?=
 =?utf-8?B?ZFVOVGt3NDg1ME8veWh3K21ydnd3MUNiNDJ0UlRaL0N5V1NPdzNpMEl3bUpL?=
 =?utf-8?B?RFoyZzVYcDZ2YWd6OUlyQi8zeldkMSszTTJWai9FeVlJSytxSHM1ZHFJTkM5?=
 =?utf-8?B?b2dBcTYyTE5zenc1czVEU08rZTR1SEpJRGI3MzB4QWtFVXVrM2gyQUFVL09P?=
 =?utf-8?B?elBjYTFSMkZQdjdGdzhWMFVWa0xGdnVnYngyN2RESGNOTEt5MmtJNy9hTzVv?=
 =?utf-8?B?Z2hGSm1xRThDQWZoVkExUjU0TTFPSi8yYWRUa21vVHhJNm9RbWx3Vi9SSGpC?=
 =?utf-8?B?UTZlTmxVSmE1b2hkODJyTExqOGVVUFkvclF6ZDJoY3VJK2dUd1p5RVNnMytC?=
 =?utf-8?B?THVFK2J5UGt3M0VsU2prNnB4c2FwZGlsSDI0NDZ3RUpHT0hLTDNQYVJNK2po?=
 =?utf-8?B?a2VIT2w0VGtZaDEvQXp0NmlDYUJDYlpGV0N6dEI4czgyRW5EM291RmI5SFpM?=
 =?utf-8?B?ejNjZ2pQZkxObTM3bnVDbTRFR1V1QXBaRjNheE9LOW1oQVVzNzlQU1Z5dXNF?=
 =?utf-8?B?bytJb05GMWlXb1BhcnNISGNmVVNydUN6ZDJQQkZEU1FoQ2s0L3ZwdmM5bmNW?=
 =?utf-8?B?WStEK29hY25NSkxiNURhYXZpaTUvM1NSWGNKaUJEVTcyV3g2ZUlpSUhmVGM1?=
 =?utf-8?B?RzBNK3BTcnJzbHpDL3ZVRXk4Nm1Sb20vOGl6SmhWc09TemRXc0NqS2QwNk1E?=
 =?utf-8?B?WG9UZk5IbGtTdzRObHphM1FpZHBuLzZhWlBxMTVCWkpCSHk3QzJjUCtoakVw?=
 =?utf-8?B?WDZTN3NZc0VuVmNiS042MitiNlZNc0p6YjM5aTFobjYvazVHbzQ2MnBnOUl2?=
 =?utf-8?B?djE4R1FXRUFlL2U2Umx2bUEzbDJVazZraVlUWmxPNkxjaVA5bUdldTBxdjli?=
 =?utf-8?B?QmttOGtiU29JZzNNUUp5RHNpREkrRGRvdURXSUZiWmd0TmtPcnFiRkd5Yk81?=
 =?utf-8?B?Q2ZZeStjZG9CWkthWS9kZGtUekR3K0t4eWVtRG1acmkvUXozOGpaMkVQbk1u?=
 =?utf-8?B?UXBCWFFQbXhTSUtsekhJM09ic1k1bEZIdElHdk9vS2tTSDdDVkUvamJ1NnlW?=
 =?utf-8?B?eXpWcjU3SEE2N2ZJV3hWZ1ZyR2VLUHlnSDQ4S2QxU1VtSEo1ZHFkZk9pUktk?=
 =?utf-8?B?U2dsOWRGMnduaGJ4WHdrd0JiT3Z5YkVLTVpjZlhaMktBY1kzcXJIVG5uWDRB?=
 =?utf-8?B?SUNHdGNRejJ2c1J2Lys0ZTdjdDRrZ0RWK1h1ekR4ZU1QNENxU0d2bjB6WWU5?=
 =?utf-8?B?VDRsWnpiTUN4VjBQTmh3TGhmUjFwSXd4Z2xsWWZoMFVCeXE2bXJieFhyNEtK?=
 =?utf-8?B?Zlk0aWlEWVJHSktZdFNsNXdkekJmZk54WjVqak4vMHBJVkR4ZUZVUkxBQ01i?=
 =?utf-8?B?REVSbDdBV2k2Sy80UERSVGpYd2lFcWQxWkJZcmhKQm1LUmJ6MTRXYWhjRFJP?=
 =?utf-8?B?c0l3WVQxb1FMclo0NVg0TFpkSUZrdTlybE80bDkzUVN1V1k4VFV3S2h1c2JY?=
 =?utf-8?B?UG5wcUxhMmU3YXIxSW43T0FrTjVlVzBzcWRuM3VnUXNTd0tHZlEwby9EOHVV?=
 =?utf-8?B?VVZLRGVkOGxZa0QvZTZEMzJpRi9ZcGd3QnFKN2x2L1VOcmVjWnlhNHFQM0pG?=
 =?utf-8?B?QkdJL2RDZ2xFUzZVdmxoQmMwenJ4Yy95TVpiaktOQkxLSHB4S0J3QTFyT04y?=
 =?utf-8?B?MFBUMHdTMmV5TzRpOFdYSXdWYWNpRVZKVE55VC9TekpWYW94dDdQZ2xpMTcz?=
 =?utf-8?B?MnpybjdFRjhxTllXU0FzSFF0WHpseHVicERkV2VteXdvdStpVlo0ZFJncWRl?=
 =?utf-8?B?b3hSLzFZWG1wTzBLU3pQclBFckRtTk1WSkROc29Fd1grNExmREh3RjcwaU9j?=
 =?utf-8?B?blhXR2RIc0E0ZjJmNHpWak84OVR5dEJ1NlhGUEZ4YWhBcmdmRmEzemtneW82?=
 =?utf-8?B?TGZxbDY2cW00SEl1TFd6TFhDWHFXR2E4ODJjd3Ztd0pFSkZnN2Z0SUNOQW9Y?=
 =?utf-8?Q?PcOXiF8JL6/JJd9PXAx2dFzBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf984da-7e63-4d67-d8bc-08dae26ecd6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:44:34.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjPUVgscvCyI9nFkyRQ4vLHYYhQ2NJOddxMjrVSWAkhuohuKnICuMFHZ5RP4DGUNnmosM7yR/FBAwklBcy23eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7067

On 20.12.2022 09:50, Luca Fancellu wrote:
> --- a/xen/include/xen/init.h
> +++ b/xen/include/xen/init.h
> @@ -15,6 +15,7 @@
>  #define __initconstrel    __section(".init.rodata.rel")
>  #define __exitdata        __used_section(".exit.data")
>  #define __initsetup       __used_section(".init.setup")
> +/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
>  #define __init_call(lvl)  __used_section(".initcall" lvl ".init")

Would cppcheck also complain about

#define __init_call(lvl)  __used_section(".initcall" #lvl ".init")

? If not, removing the double quotes at the two invocation sites to
balance the addition of # here might be the better route here.

Jan

