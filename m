Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8A7881F5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590746.923130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZS4j-00018f-Fw; Fri, 25 Aug 2023 08:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590746.923130; Fri, 25 Aug 2023 08:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZS4j-000160-Cd; Fri, 25 Aug 2023 08:21:49 +0000
Received: by outflank-mailman (input) for mailman id 590746;
 Fri, 25 Aug 2023 08:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZS4h-00015u-Nc
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:21:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe13::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c828ff6-4320-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:21:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:21:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:21:41 +0000
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
X-Inumbo-ID: 6c828ff6-4320-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WypPvYJwsC85WVnksT2fJ4gqorFrrT6DD7gg0IXORX10LGucPmq8ZWWZYNclTvxhAuSfswb4TDauR+pR7unX3C1bBHv3boYKma9yyBELEAjjvl2rL2GQvrRu+4ZtZRmZok37mZ6KU55Er5vkZTXdH7h4bgwLIGUWYBGDDwniUuyGlt4OyMlnmGLvpB3Qg99NlUaaySYnZP1LAN4MeYzSR5igIQRjDysl8NiimzH6mPz+ktd4dMTlxo3L8fpOgPdlAL3StXimYK3P+4SpHKSPqhUsHPc0WtGJDut91JJyksRD908hGqBmh5lYYodhto2eORPYz7HWUAW/dQAcQ9LeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnuDmbIkkF2oI029vh8HoXx5en3tqGvFAc1SXTtzHt0=;
 b=i9/vP+7snolsX9mLa6MtaQEnrmgdT5bHv+ZEQXlT7IaYMnPj5YQh9sOBfeYy6QmjY8VtOmLRdz+9IIqNy/CoVCL7M6KTAlP6HPSaZ1VLpEP/lM/D21Uitxal74fx1Y86136bpZUok7c+Q2Od/TYRdVhyCAgKqYpE9JR93NihUb/DK4O8Vl0hbe+QV7s6nvKdJok2sNtcGtjdvaigXOjgDguXRv0NljdY2gQlJ+JX/Lrj42TQ1lfI4rRv2s8sky2bc7hk16WhZSy9Y/NMm5ZsGkiRg7itTxZvAXhRh3hU88JrsHZ3EOjfz2V3LY6tHhPiOn5GuTzcBpdh9WpAqFYk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnuDmbIkkF2oI029vh8HoXx5en3tqGvFAc1SXTtzHt0=;
 b=5JV9b5XLbmOa5kdUGSyozE7dqNAoJ7nix3aX1wViJa/nzCpjj7mPnBGeAA4m0LKu3WCwtvWC7na6KJ//0aXHbUzgoF50cndL3G6J2R/JZErnVMGwowEYwfwtA+z6ZVf5SLKCP/wN7KV/lSw6dJxW4D7Iub00GEc+AcsQgmaJp2w9/moMLJHfCjzfMvWY3JiiXSpgs2Zq7x0tD49J1H2SmB3Ct9VlypH8LKTff4+RNa9kvAoHTjXbQhYJZtsdz95Yh4yl+RNCHvkc26D4JN/jxwBXyHbZ26W+04vDOf7BGJM+UEcTmzDikmtmJ1lxgvOppm55f4VDcuscpfT98B3RrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c02e9314-6891-bf97-6ac4-8fa285fa412d@suse.com>
Date: Fri, 25 Aug 2023 10:21:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/8] x86: Fix calculation of %dr6/7 reserved bits
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Jinoh Kang <jinoh.kang.kr@gmail.com>
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <8e594d08-9489-5446-525a-526a1f79dc07@gmail.com>
 <01e5cede-0aee-eff8-ec8f-64b015ee5918@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <01e5cede-0aee-eff8-ec8f-64b015ee5918@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd08138-bcea-46a4-9735-08dba5444f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t0NME6ME3R1/yLhpLHh1+0A1kOsH4TwpXqGg/lgVxvuTwIl0UR+xHLge/dhm0UnK08PPabFgZEuqEoCuJ5IHGyENuBVvXKMPc+nZpVtZtRoeZ304gQqUyZo/cdio74urZI0qgpeNeZ+nt/VfeEeIUyLh77nO+wqrYzGQc6/jbNbtbCt8VVXPUunB7Dbkih9zp7De0nh1Mq/DPGxwpX1HjnJOOZtqSs503qypE3K/K2qbAVucFtmHb8mOaug+eZXwnv3seFZHCwSBWGseyRhqZ//PIszSvEBz8RGkgUdD2Ggd88/2l/m8sP+kESRKaRk9f2CdDB1pj2lkAAfzH/B8hkCU47s93/686EU9Qt5WeFG4v2IGUIpVZXX9CvS+H6N2I1lCLk/Z8apKfPH0b54pXbWOxXsJvIVNMtY4eoY2oPqTWixxMos2aNHbTZiTMG466rhkvd5aA8f04seoY6P0Yh5lmULc5XeXYa7qVb6TcTm2lMKYP0LqCciu0ePsBZqRjzRUuvqYkMi3CgqObUPUfJYrXiJo+pfr1D4p40PQWQ46ri7W2AmBQe5Fv6EWCpNLmLmWn/YojzU/vj1+nrCNHDnxpFkn1PJMIjkGxg4/+ek7aGufgQ4szBgVNwHGd8YWLyb9xvOVinqHBsYg2GBjqacVmRFV6Zi6VGhtjQPjH6asOsaH+t4SiXTOwInf9axc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(136003)(346002)(186009)(451199024)(1800799009)(26005)(53546011)(6512007)(2616005)(4744005)(41300700001)(66556008)(66476007)(54906003)(316002)(2906002)(6916009)(5660300002)(66946007)(8936002)(4326008)(8676002)(478600001)(6506007)(6486002)(31696002)(86362001)(38100700002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3pOTStPMTd6Sy94cDFPK2o1TkNCekRHYjFRQUxCQTlhN1p0bmg4NGtTOUdh?=
 =?utf-8?B?cjRKQzR6R090TS9VbmNXelZqbUs0c1Yyc0xBQ2M5TVJwQkVHRXNzb3VsZ3JI?=
 =?utf-8?B?bGkwVjRpRUhJUWZJQUZadGRSVnh5YU5hNDdjOVN6dTl5UTJzRytaTzZzdzA0?=
 =?utf-8?B?aWhJVkRlR0xncFBWcU5oYXFuM2tXQU9yUzJhczdHajR5OCtMcjN4N2xSU3c1?=
 =?utf-8?B?UEtCcWVjalBwcERnb25MSFYwb0EwUGx0V3dvL0JTWjl1c1NmeDZTWFBMQmpI?=
 =?utf-8?B?ZXBZdFIzb1N6Rmd6OFBmcnVhamYzRUtmRlliOXVwbS82ZXA2SnZ6OTVyYXlT?=
 =?utf-8?B?NW1XOC94S1lMNzRpeFAvZG1oeUJIM1E0NFZWMDZFMkk5dzFUWTZRajZZQk5T?=
 =?utf-8?B?eGhSdEN1V29ZMjZNV0w1MjVUaUVxRW5nUHoxNjVhK3VaSHRDMEpxd3c4K3ZF?=
 =?utf-8?B?OGY5SjNLUkVNcW9kZFU2dlhFNFRGdktvSXhOWVcvVDlEWDh3SUtvNXNYcDlY?=
 =?utf-8?B?Y1BTYjdlZlJjZHFEL1BXRE5JTUFIOTdSWGdqVGlPQUhObzd3Wk1MVU50OVlG?=
 =?utf-8?B?c3BPU2wySXJESkMyUUwrb3BpM09Ja2xHdEExZFlXL3pZcnpqeUN4clVBOFh0?=
 =?utf-8?B?dFFxQzJqc3lvaDYwMmJ6ZjRFbGJ3eUwzM0FSOElKdnp5VVFJL29qVm0zTk40?=
 =?utf-8?B?ZUpIMHo3MHlKcUVrYW03N1dFZWxrMGE3d3ZzbnpqdnE5a2hoS25TMzhvTlpn?=
 =?utf-8?B?bjNWMjl3UGwwb3dTb1gxZTdSRUFrbEFqSys4RW5VdXBORXBYek5BV0U0Wmpv?=
 =?utf-8?B?UFByYTBtUTFDVzd1MEFFd2VwUnJqei9pY3pYbWNqaG9teVJZVUJCdVZjRlQz?=
 =?utf-8?B?TkxkSXdUa3p3MUJpTlVhWitZRUdkZ1FLRHlISlUyY05iUG5WdGRJSDIzdGVi?=
 =?utf-8?B?MCtMYXRVMlQ3Z3hQd0xYbGUzMXY5a3grazRiOHRjNFlQdHRaV3pwdW5PRDRs?=
 =?utf-8?B?Qlk5a3VRRUdhcXNLQlFnemw1YWEyQkpId2dzaGpxbUlyd3drT0cvUDZONFVU?=
 =?utf-8?B?RWpUd3BIRGZVYytNYjZGRGxNekpCKytWRHlvNUgxaWhROGNTNkVvMjJiSmxr?=
 =?utf-8?B?eTBPYmxjYjVndElDYlg2UWNCREtFZGNSTS84T3EyZXVCUWxLN0RqdlBOcmhS?=
 =?utf-8?B?RW1uUjhqMHJEcXpWM3VFcTJidTZUN3hZdDcxTE9NYTZFNGdBdk5pdE1TdEhF?=
 =?utf-8?B?SWZOSjNvdDV2WGFaRUU5ZGV5aDdvbndia0RBVUNpVG9PWTNNcWE5TE1ETERo?=
 =?utf-8?B?K0lScVVBQU9tQVR3bkRlclFLOTUvNHRFWm1kT0U5ZnFyL2xqc2xnV2drUFVx?=
 =?utf-8?B?dDlFeGlubnpCRWRGOEVzT2duczVXTzZleHVDdGV6UEgzSHhUY2FSWU4zRExV?=
 =?utf-8?B?aGtFWDF5WkNBOHFJVU96SDVSMUhwSEhCYWxQNk5lci9xaFJTTGhqejIxMkN2?=
 =?utf-8?B?aWZPakxLUlVCMnRaQUxLbmI0UTZERUZNN1dpWmx6UmVpZ1Z5RHQ3Tnh4SzRj?=
 =?utf-8?B?WGk2YUljVGRwNlQyWHVJTFB5blJHaUcrenVGSjVBYllGWkxiS21kaURmSmxm?=
 =?utf-8?B?UDRVNTVCQlNaekoxWmQvYVZRdnF2eDh2Ry9Ja0xxa1VsWHFHek9IVzVlWVpZ?=
 =?utf-8?B?Z1g2cSt0VkYrM3huYVNQOTByZ0h1N2x0dENGNWs3REE3RDJBVERnK2pSZHV0?=
 =?utf-8?B?S0VFdTZHWmhwNG83OXpkcXo1OFdCVVl3TThxdXJybVkwSVlMMkhtWXJZR0JN?=
 =?utf-8?B?Z0puTEN1Yk9jdU5kMUxBd0tpVnh2akMwMUkzY3hPRER6dUlLNjkwanNQMGVy?=
 =?utf-8?B?eVRFRUk5eG5wWXdBTXgwQi9pYVhzTkl4T3ljMFZ2My9XSUlUNVVsUHFHekFK?=
 =?utf-8?B?c0JrbTEwNWtKenNpZE1uNFlqRVRXcGkza3V5ZCt1bFFnY3I5VHY5Wlo3MC9h?=
 =?utf-8?B?NlhxMlVIRkliR1JoK2FET05veXVHOElkVkZoL1ZoRmtrbVBoS3ZGMkRYOTIr?=
 =?utf-8?B?ZHM2c2ZONjZpMng4eWtYc216Vkh5RC9vNHpjbVV5OXlQY3R5TVN4SU9CS3VM?=
 =?utf-8?Q?ZbOvJurAfAROoCb1P336wG4Jj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd08138-bcea-46a4-9735-08dba5444f8d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:21:41.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECLNqw897GEgt9XVEy3p+/vtIWBRcQKPeenxb6F2xA4kFPgw7zD3Bd2q/BJGW6a88ZnmUw50LQQ27eTqldeejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 24.08.2023 18:37, Andrew Cooper wrote:
> On 24/08/2023 4:25 pm, Jinoh Kang wrote:
>> - Define X86_DR{6,7}_* constants in x86-defns.h instead of open-coding
>>   naked numbers (thanks Jan)
> 
> Jan - stop insisting of other people things I've already rejected,
> particularly on my patches.

Quoting from my reply to Jinoh: "There was one aspect Andrew didn't like,
so leaving that part as is would be fine." I can't see how one can call
this "insist". Beyond that it's clearly his decision whether to agree
with your or my view (and just to be clear, I'm okay with your
justification of why you prefer to use bare numbers).

Jan

