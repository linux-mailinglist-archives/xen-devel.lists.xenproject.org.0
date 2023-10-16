Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87477CACF1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617721.960618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPAi-00028H-3t; Mon, 16 Oct 2023 15:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617721.960618; Mon, 16 Oct 2023 15:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPAi-00026Q-1B; Mon, 16 Oct 2023 15:06:20 +0000
Received: by outflank-mailman (input) for mailman id 617721;
 Mon, 16 Oct 2023 15:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPAh-00026G-6l
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:06:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e8a2a28-6c35-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:06:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:06:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:06:16 +0000
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
X-Inumbo-ID: 8e8a2a28-6c35-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovr0GORCBcrDdrDm0zUdCLtKU9MZmOl8Oe9QuvJUJqL/nbyoZQBL6x/yPGQ3u7fwlAnq/Mm5jVmLN8bXoDFi9ARbkd1kDh/x2nrcxSbNf72Ts42mD+YM+99N6M6HeJ0qJPVkQMZttk3yu6qJ0XxwxSTNIl3xVNihJe9HhAQxJmcmaz/GuzEZTAXYTz8CxJJ+2tn9aipbg4XfFl6k7N9Lwm6He9YzgHJHaLJnOnwRomXqe64PdHo6DSMIdd5B1CgKSEckv80FQxQvGiJkJVbHMmapAUXYeMEl2If52K6d2jkAVDV2809Uqky5IYAJryB9hwxGIl+t6YUjangSYdbAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHF9bSydrJnlQQhHlK1c8Rg39wAvjcu6/Q+79nc22sg=;
 b=KD129K1mZaObO91QnvIPFtOhfWozURlz23S38/SWgqLEjxYpBFFqX3w81iyjuKVpDW1ZEXmhlYjgvfUAanPic0WsdzebcPrOF+wZRGyw7WqoPHfkLDxL31Hbn/AvcmZ46XULoZbbIUvP2TJ8Q0NCWCGRfiYn8knTUCZGTUgzyhUH5ELS+qkOaZnDhNLNgv0RXHI6Iw7lrTSdyv1G9qANJIQLGykyo7i+aVnbNB/4cyOpbueirPbvfoxEFgrsddmHAjg/ffjPLnNkaecHrILjJA3eMMBWPrSyHhxVT5AFAuUeH4jmh1deAYhJB8wtgkOdZddf6sycJ94jUZvzKZZJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHF9bSydrJnlQQhHlK1c8Rg39wAvjcu6/Q+79nc22sg=;
 b=VDQnYseT5TwnKKxclx+kP+E9AltKo8DjwRk25GpZZEhOlhdvKjKeaaYrVB9KL1MRQ2uiB3tCND2SjtI+ErobrWoLajQNRELZxufFEt9syzwiyDrEm/3jBT4/saNsZHMYCwVMGaDG0a2ROgzbSbRl/E5BIPEaC88hhU3xI6zI/srOG19OpuTtDeR6o/ej3/qZgtMZM+fS4rn6ABoeWecKYTTt9CQbCziZ9oYSNyS2GR7IyH6QJbvOE9J6+iLb0Nr9UpP5FHh8kTZbj0haa3tYvgrVGBE/wizprCAUp+cl5BST9GKKvc8v8klkFke6UO5mnm3Rq0ciPkoRFjXPu/NPAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97931622-24b1-ce33-ff97-a2f201ae7fad@suse.com>
Date: Mon, 16 Oct 2023 17:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/4] x86/xstate: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
 <198577fa8876efc48a08a89b55fa5f95694b37c1.1695972930.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309291353430.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291353430.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 57de413b-f743-45e1-66e6-08dbce5971bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ovTUQMfhfN/MLyhvpqrobznhj+Xl4Gg1eui5FWAf5rj1T7VmGY+n0V9y6OPA5rHXQYNdfZ0Wjf2J0CzIRPJgozDKGyqVnA7UeenvrE+ZO2zoUAiMEj3kvPmW6Kc0MVqoo5A7qk20LmIVRaYDQ+/HlliYgv+txrOXy2pOI2x6o9NIRGrDvUGllnsMGbyEhUtUfse7miAZ2CvBCm+dXS/fl6pghfvK81RzF5fDoQobPqclj1HReNN9vqEfNhann98sIVGlIPFbC1JyHAtMaozJYAOfXCqAEGcnDaSXHYYyw1DzXoZcxr5U3VkADNi48bo6gw0S7lxspx4aeu7NoiZy/KVtdEviGI+Bkl9/BKVQ+d7usByhLXhFKVu3zeMGhytCV6Qc97Ajl/Rzl14wI80FVaRJPldWHalZwNLpk9XfYvABhgDoZGnjComoB7Czgd4/y7H3GY9oLaRQDZeiL8weFqVbjXPUUxw85liu/wcW6KLjtfzq2yKTpTrbfda05IUtJYwLlUVDVyHFjZo2qNspoh4/EkP+kTh89qrpJIrhq6UdvWEWbpIgT96lTCYDUmjKryXm8uZnC+bpRffStagy3MVN7yJXHA3816AD4juqR1qEAsLDOc6pYb/TQzMyvXHLVn6ygcUIHcQIDjEMWBjP8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(6916009)(6506007)(26005)(53546011)(316002)(6512007)(2616005)(8936002)(4326008)(8676002)(4744005)(2906002)(5660300002)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BtMlBoSmdvTklLM2JEWFBCRW5jMnJPNHZpYjdTWXVpWGFNcjdTZHYxbXJ0?=
 =?utf-8?B?emtuc0RDQjJWaU5BQXIxSjAvT2hFeSs4MlFFQi9IYS9yS3o5TGY1YUFjZGFK?=
 =?utf-8?B?UUNobUkxU0FnTFloc3A5OEdXYTFiTkZ3UzhWVXNseEJ3c1JzMzFSbC80dEl6?=
 =?utf-8?B?Rk5ZOXAvOW8rQTlLVnZTeHFsWUVMbmt0Wjg3MEYzcHdoampDcnZrc2pmZHVM?=
 =?utf-8?B?NnNyQ1JLY0QrMHZ2RE1LK3FPY3NSdWxobnUvMFQ1THBtNlRjQzdHZXNPb3BZ?=
 =?utf-8?B?N00vWHdyeEVnb01NcGJGYmx3QmZ3UVBqR1RCcTcyeStjMVFRWVlOVWJkdnUx?=
 =?utf-8?B?amdFaEFSb1lQZWF6RWRMMXowaldhL2ZrSWh6bU80VnhiQnVvM2UzRXhwWmo1?=
 =?utf-8?B?MHJpTzNtelo0Q0VJTTNidkRCaEhtWWwvK1dGRmRVTjZMUzJKTHdBRmQzaTZI?=
 =?utf-8?B?T3pNRnRERnJ5dmYxWitqZVpibWRvN3JEVktlVFBGditpWkxOQVNRY01PT0Uy?=
 =?utf-8?B?c1JnREVCWUN6Ty9yNzFTck1ZbkVUdHBvNERIYWtFTHp0ZWpXMUdUZkJONlVs?=
 =?utf-8?B?TVhoK1BuMUxLL09mSFZDUGVubHR5MUVmeWhscjBpdHNFL1FtcGtsbWhoUkNj?=
 =?utf-8?B?c1pVOHFieVVyMnhmZ3FJaTlKTnI2cktLOXZWYWtzTEc5cjFuTDdZWDcwYk02?=
 =?utf-8?B?ck4zTnV0QWZTaE1vNUpPU2J2Y0QxMmpOb0hPN3dXQWFrVkkxU1V1aERyaFZ0?=
 =?utf-8?B?TVlUUklqZjRYTW9zcTJpWVE1QzNCekhkVVhhRTdkaHQxTUIwMU1JZStnVHh1?=
 =?utf-8?B?bm4rZEJNZUw2K1BDLy8wMXhHS2FPK21qNkJ4ODR6ck9QZVpWdWhid21ZT0RT?=
 =?utf-8?B?TDdwNjMxN0MwdFBlSVhjOHBySXFidHp0WWdiUTFkRENXbHU3bm9hS3UvK2s5?=
 =?utf-8?B?OTJzZzdIV0VEeGExNjVJRXpsQlFvQ1pYbW1xVldDb0FXS3kwRWV2aFI2UW03?=
 =?utf-8?B?ZUdoZG5DK3IwYWxNdEx2emlkTW03OHdFTkFkQ1dHSy9uN0kwQWh2bnkxZWNj?=
 =?utf-8?B?TDZrMlFHcFNQT05zT2VhRTFlM3pnNWhKN2YvVlhoSFUwN2xaTTBOUVlYN2dt?=
 =?utf-8?B?SU5pZ3lrNk5nUTRyaDZMREhhYkJ2eHRFTnVMTTNDTmlLVTlqaHF6Rk93SVcx?=
 =?utf-8?B?UGNWOFJ4MUlwcDJMWElJOVlJYlJIZ2Q2a2FWL21jYkVBaVhWQzdBTkRQNk9N?=
 =?utf-8?B?MExFMHhtSE5pMkFjaFFEZkVnaU1nUTZLbGtVL1lIdnhWUEdyWFRwQjNYMTg1?=
 =?utf-8?B?RTNUaEtNK250YmprY2kvVk15VERQV3FSdjZCS09UU1JORUw1WG1OZThaaFc3?=
 =?utf-8?B?aENGZ0ZETTA1TGxpUjlyNE9ZN1ZKZmQzbnhWNmRLVTExYzVQMUFKandsRXI4?=
 =?utf-8?B?RDhZVzM2eGlvRkpFOGEyMlRyMXVJNVYvc2o1OUZwNUc5WkhxekowU1pQK2hj?=
 =?utf-8?B?amZzdEhjQlVpWjdXZjl3dDBKb0JjWmZBMFNhSEFtU0d1SUh6TnF4M3pVM2xP?=
 =?utf-8?B?dy9XVzV0UDRDR0Z6Sy9NR2s2KzFXcXpXbElWMmxLSm5ZZXMrRmZVdktQRFBG?=
 =?utf-8?B?cG8zS2ZGa2tYTy9FNS80Z0hSNThOaWxwdE55bXpPTGYzd1dYZUxsSmg5VHZi?=
 =?utf-8?B?dVljYkt5aENqOUVBWENHQmp4Tk4xQTRkVFBiUU9RQW5yVTRic20vNUhhMWcy?=
 =?utf-8?B?OHcybHFVRWcxNzgwdUdiZnZILytLTFNuaWNXUEtjcHVFaTdoVGlrblhlcFAr?=
 =?utf-8?B?QTBaUmlURnE3YVVMWEE0Znp1amxORlRobnR5elNvbnpZYThEaHJYZkVhQ1Uw?=
 =?utf-8?B?NFJEN3ZRODQxamk3SEkydnowMStCalJLU3FFVmJvWTdBcGlzM0pEdDN1SkZj?=
 =?utf-8?B?R3hWb1dXZlpveERPTkF4Mk9uazFvY0tyNjBvclEwaEFva2ZQemtheEM0b3lI?=
 =?utf-8?B?bFdHa3QwS1FyeWVDaEZZLzk0ZEtTcUtXNHpVTUFBeUJQU2JMOEdoVFk2ZnUy?=
 =?utf-8?B?UW1FSThoZGU1UlcvSm5OK21MUEppYis4eFNWRGZ3R0dHcWRkMTN2b2Q5eGFJ?=
 =?utf-8?Q?GQf4ItKWu8GkWq6ao2XfZwpPw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57de413b-f743-45e1-66e6-08dbce5971bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:06:15.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyhxGukZeywn9Xg3Ybn5FGjuThtgoBHa821/Q4/6xTMor0vD+cMalqQQINXW/aabv7zmJ+5ru0RwBnDgFX/JNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 29.09.2023 22:53, Stefano Stabellini wrote:
> On Fri, 29 Sep 2023, Federico Serafini wrote:
>> Make function declaration and definition consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


