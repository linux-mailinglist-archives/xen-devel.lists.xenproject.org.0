Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC277850C8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588950.920611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhdr-0007yZ-NH; Wed, 23 Aug 2023 06:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588950.920611; Wed, 23 Aug 2023 06:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhdr-0007vX-K9; Wed, 23 Aug 2023 06:46:59 +0000
Received: by outflank-mailman (input) for mailman id 588950;
 Wed, 23 Aug 2023 06:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhdr-0007vP-1V
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:46:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da433a3d-4180-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 08:46:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 06:46:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:46:55 +0000
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
X-Inumbo-ID: da433a3d-4180-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVKn7hPxTpDpGoITUPkPOIMvqm+sGwrcTjgyF+UGF+d1QrKIUyHMirv4zlfXpomQbYnlFObp34mkfHMUtTyoccRhEhqw75ybStcyXt/zpoTKX9gpBoQ1gbi3IDg9zxdpx3xDCenMeZ07W6NrDzgt9FSzLFH8h/uDkRX0wfHh+kGXJvRvN2mb1MY5zGQPXooxDqxYPQiJo5vYJnmjluB5GBDOkij9b7OUcaNbjlYMvAMk4h8xa+vPSJ+3LsKE8tGMUppWj6fYGfJ6wWxWWbj62DuWk45vM13S9bVSso8zEKsVvz8ZQ+FRmndvzlc5wjM//4upywK67jjeKX2PqB35ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAXB94WaoqXfvOCrGeO6Bus7E5zQ1Mlgi8S9k7oqavE=;
 b=GLkmhRWBsJZwy1kTbvZdy43svC5NZN8m0qMslYNrJvkvKclmsXNabXpX19gB82rCA3SQZ2jdpWSnzqzvxxw3XjmEF1DnPW5zwzC/xvi34xdUa2TzGVyLspoeO/oH99jRPrM59oW4o9840oZE5TaXI+F+D9ujvn4yZ7rHbkha7Ne3/txzGNCA3DjVXly+lqHuyL6wamaOcLVBGmBhWZOoZItDZqbpLAjHSw45ItKKD/26pb6mw0IXECIqrKGJ+XBisBs8YzhQX9HipgS/MTXlR9vBA33E5YHlPp7cD8lRGIsQTNATAgKtjXNw560m/mOuyisPreTCHKMwDAhD12BPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAXB94WaoqXfvOCrGeO6Bus7E5zQ1Mlgi8S9k7oqavE=;
 b=hiDNHcGLvDMTQ5XLwtQ04Z1zv0hp2Nqr0FiY0IHFSkpMbNIxLQKUiRHPGUNNy/pB7zSyL9t22AFwMx4JHJAoL87swsb430CEykbtmphaXFQCV29AdbfM9D/KFfkAMkUwU1AxKGFglM8I0X+hyKhWF4fvWDVDFN9Xx/WLDQHsvVRlb65x6S0r7Im7hmdc9LFupo7ZUgjgcsIuiP9mLoI4Zyq2wtPvG/B3lAhvbCkTI+iujRBaACU4X/Mjsd/nMAwU9deo5ARjs8T0VtoT5edLDymPtd14dhaXAeyL9KsP+zesw0fwpdXP370rAVGjYx2PSU6nH12z2TS/TvZuKYE0eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8bcb512-a153-35bb-61c7-bc22e46e421a@suse.com>
Date: Wed, 23 Aug 2023 08:46:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/3] xen/ppc: Bump minimum target ISA to 3.0 (POWER9)
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <a419cece7fc01870fc75ce9b374d7ca1a38f0e67.1692744718.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a419cece7fc01870fc75ce9b374d7ca1a38f0e67.1692744718.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 12035d6c-5d01-4d08-5d97-08dba3a4bd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qr0c0ZUeisXXhlqEmX71lfehWbiyvtDUYttysTsA4UkdSSHI7otioiUFfIclGQU/R45l8vYSij8TvN57WGJwl5cu3OlCbzv0qthsZF4ASrry3DJZOD6ww7XoKC05FQP1+yhkqT4E77jwqcm3TzJvi6emI3N58FKWMSAa2BvIn50q4YkU+LxVza/RYE7TpLrBr1Nb3kKee60fuyh8ZJY0YOz4sq5YA+ZsoMZ1jwF3hEMm5QUBDlfBO0TlZgEtkROjBaDos+mEV2LWnv3pHnMAwlVPUW6ZcjPpeCykBQutShN4xxMdkQWzN/aISSNiK+hSi1U9g6XTnYbuPAUZ7aLB7/mq8DQ247l/5JS++3CP4eUp1TEK+nXZ/uIHs9840QOU1Y9HLhjpcvf14QHrU6SmPqfpqWfGFESFBmfFmK3Zq8jrOArzG+6zooBPdCsvUV5gAP8MkZBL5wyDXXb8dzU9Plqtp0LLkzQ5Bd7mTARuV5OLGihJ0YkF5Hw/CzLKmA9clhZYc6lGzZEyFLAUESndm22494nigL3CaXkN2PHS5L1DC3U1dLwW6L7gTzKqvRE0GFPd/8wr2D0Kxv353+E0UOWu3aXIfSxB97ofxOiLaSn+HJyYVhAuuSMDSt0hubaQx5UBtm+MRBMLei1YvnInbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(31696002)(86362001)(36756003)(5660300002)(2616005)(26005)(4326008)(8936002)(8676002)(2906002)(4744005)(478600001)(6506007)(6486002)(66946007)(53546011)(66556008)(316002)(6916009)(66476007)(54906003)(6512007)(41300700001)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTl4bDczMEw4d1FrSy94RUhEOWVZc1hRLzRCWnJIdytreHhwVm1nWVcrZERr?=
 =?utf-8?B?Yng0bmxsaWtzMndYODQvVU12Q1hPL1lEQm9EdWVJS2UvKzRrdFU0aVRueXR6?=
 =?utf-8?B?NGFvSzBFNmJUdGc1a3UraUZrN0hQVHN1RVRDWmx3OUJpclZHNHhqNTF5Y1J5?=
 =?utf-8?B?YlZvbnl4aU1qSjZhelE3QTViS1lYdGpmTlZkTEV5dFhKaWVEQ1pLSW1lakwv?=
 =?utf-8?B?RWY3UVF5bkF2Q0VoZmx1WEhzM25EQ1lTbWRkdGdlaS9heFBwZ0duWUY0OXBt?=
 =?utf-8?B?dEN1QW5ycmk4U25Va1k4dkszSEFaWU1rQzZaKzBEMEk2eTFUVDhYMTZROTc4?=
 =?utf-8?B?WmVQanprU2Yva1N5Vms0ZStFcmlyRjdvNFpUSzR3NEpaaTFlU0VwTisyNXJL?=
 =?utf-8?B?ZEZ1Q0Y1Uit3QVRhcWs3bER1MWFQdDI0VzhlQ3NYZXJrNjd2OVkyeHlINVg2?=
 =?utf-8?B?TnUrYzlNUWF0eURycnpUVUM4dGV4UUlvRHF6R3pZM2JJUjJxNVUyMGF6NHJZ?=
 =?utf-8?B?NmMvUm5WTmw5aDkrMmxsQTF4YmRreEJRb3RvSTd2c0ZUOHVCamZyek5WZUVQ?=
 =?utf-8?B?cEd3eFJnLzIwaFJYSE15eStHelFpelkzU3pZTHc3cWVmaGRSSXFOektLQWc5?=
 =?utf-8?B?RlBPb1EzNzlZbkVaQ1lDQ1hXd3N1bkpuaHlla285Y1BaYWRZWVRKcWhpQVhH?=
 =?utf-8?B?UndtTWJudk92VmE0eTJpYUtOaEtrTk4wcHJadk5HM3BRWWx6dUYwT3Z0Rm5s?=
 =?utf-8?B?ZE9GdXVtSzdCZ1hhQW80blcvLzNaYVgxM0g2aFBFWDVjWlFCdHNYTWNyb3A1?=
 =?utf-8?B?NXVBTm4vWkE4K24vQVQ1dXpLM1FEUk1OQldyQ0ZYOU1VZUs1TitacHV5Q0JN?=
 =?utf-8?B?VkZSU2RiemFzTGZMNVlKOW1BYVVMRmRka3NCRDBMdml3TGJZanVJRnN5OGNM?=
 =?utf-8?B?aDVsTnZxcWI3bEtVeXFWYzNyWlhsSm5mcUpJdUphRHNKYU5FRzBJNStjY0E0?=
 =?utf-8?B?KzJ6cXVRdC9McnpObktUTGtQUndDM1ZnZzNNUzd5bVZySllCNmltS2NGY2do?=
 =?utf-8?B?eXRuSHB3Y0ZvZlJvMWUrTXAxQ3pMN3g5Uld6MmFaaW4vRmxXRFhwajVENm9i?=
 =?utf-8?B?dmRFMlhHVm5Sdksyck9IY0dGS0U5ako3SjU5UDNrdnh5ODBXSlJDRUlQdjRn?=
 =?utf-8?B?U3FhNWd2UXBQQ3VKVHNPVHphcnVzZG9CMjNzYzd4d3h1OSszNVk2VnMrVG9R?=
 =?utf-8?B?K25LT3EvR2xEN0N4LzZlS2VYb2Q4VmR5RGdyek1ER3dFa0t2eWNuakltVkln?=
 =?utf-8?B?Vk9vNmhZVGtmWTFkWm8zeGNJL1kxRWtubnl3MnkyMVBoekh3Q2xpRDF4NlJl?=
 =?utf-8?B?UEcyRjNVTmd4RDlBaVhDdGVqT29YeC9wYmxrQU90SmZjZE1KVzRHOXI3L3RJ?=
 =?utf-8?B?cHdBNEZFWTRRVFppMUlMdzZmUCtzMTZhMkdEY2laajF5TWRWS3EzMzJFM3gv?=
 =?utf-8?B?ckJiOHU3bjMxeTY0UG5Cb2NsQUJFS05TQkJIbFFweVFHV3dvOU15Z3drN3Ju?=
 =?utf-8?B?b2k1R0tUbWVRRlUzWWZVRkVIWXNhb3VacTE1bHJFMGp6TnNxTXhSZVpOZExt?=
 =?utf-8?B?ZzNSK2sraW5yZ1NyK1pmNFo2UWVXMWlvNk9OTjFZbG9PUjdVaTVJUTFYdVpW?=
 =?utf-8?B?dzh3TTJQK1VLaktlM3E2M0wzcjI1cW1kbWsxaFFGWjg1bXJLRW9NZUh0Y0FK?=
 =?utf-8?B?SHdUMk53dzVocXNPdWwxQktYLzg3ZkdJWmZEazg4Z0huTEdvd2JqUFhSMHNv?=
 =?utf-8?B?aElIRERMZUVpSm5xTWFKTE9CN2R5ZVRXTmd3MXJHRzlKNkxwT3dUeEhyanFs?=
 =?utf-8?B?VGFnZXIyT2pIMER3L3IrNExhZk5IdjZjMXdoMkRWSHgyd0NaVDBUbG1JY0NR?=
 =?utf-8?B?cFJoazZraFZxZ1l0blpSVmRxZnFFQlQwSm5USjF6L1RoRkpYMTlnNE4rWWw5?=
 =?utf-8?B?UE9zQ3NUOXBhUFdqME03VDlTVVJnUmZQWWRaeU8waThHY3FCS1Y0dk41dHEw?=
 =?utf-8?B?VmprWFJROEQ2ZlRCa0hWVHlHRmhyU0RzU1o1UnNObmNzNHlSUHd0OUtQOFRK?=
 =?utf-8?Q?KwGrH3nKFibMLcLrXkUHC6Mid?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12035d6c-5d01-4d08-5d97-08dba3a4bd3e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:46:55.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dY6bItcVShyrtNgF0O91llxkkbP33gJcF6c15EhXWSjTdRX6nzfyfRaeLdswpm2sKU+UaJ/ukza81281AGPAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 23.08.2023 01:03, Shawn Anastasio wrote:
> In preparation for implementing ISA3+ Radix MMU support, drop ISA 2.07B
> from the supported ISA list to avoid having a non-working
> configuration in tree. It can be re-added at a later point when Hash
> MMU support is added.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



