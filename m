Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD2771D3D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577931.905054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwgL-0000uz-W4; Mon, 07 Aug 2023 09:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577931.905054; Mon, 07 Aug 2023 09:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwgL-0000sm-TF; Mon, 07 Aug 2023 09:37:45 +0000
Received: by outflank-mailman (input) for mailman id 577931;
 Mon, 07 Aug 2023 09:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSwgK-0000sg-KE
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:37:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f1afea7-3506-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:37:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 09:37:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:37:40 +0000
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
X-Inumbo-ID: 0f1afea7-3506-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvk03PJeY9/ZjAIGvb9ny+u8UoYqFZXZo/Z6q6y+pCA+CH13kAZyIFkt4CUJahlPfk+R/wXF9VlHurhWggBIKPshiYrfPNse+OpTJXvTq2sE6TY/E1+akuOX9fGyEv9/AroiIdaztQTqINU91drYQyL0XCebeCaGLkVwikxNSa5ostvzZTY6ayTySq0UcwUrXKWvdKI/fZ7m5W5FX67MXsGw0Fn5HBCwJ5SCydpBtixkbO6ylJdmsWpSnfLQ8nh+7ABRA5q7a47kBYyZrY0DSDeptChmN2jO7DQVfvMiMS6duGyN0dNl8YjBZ29blCfnuk1/1x+FEhV4gR2J13bBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAju/AGE2GUSoIQ1i7AYhQoyBPXYjqks3hDukTUZrBs=;
 b=cRad9Bn7hn5umaUQQlDe3cBf3BDrzkg6qwhNo2y43PjW5Mst9nOuhgtv0iGXEq2TAeQ3jJ4RIV26T/GNzOkvL5/IkJB/zDGFGU46efn043JrcFHLQTazrL42g7G/7cnVRqQDAZThOzL6WMGepMByaWGe9sWtBhbRSYMUzlENLYx6F2hqZfc/Eawo19tBeVwbRgwF6Z/R1k482nZhh2HL162LH6N61FS6I3t49YxWbx9fGfaT4nZssjOF92wl08QZR2nZri1D0WtEyIMSqGq3OgYs0l+S9u2AD36hJ0RMqa8gG22SH92V7p//UTYe3jr+5VGi66rMtGM6lf+4HIrRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAju/AGE2GUSoIQ1i7AYhQoyBPXYjqks3hDukTUZrBs=;
 b=JjcGaryzuWyCDC4g9QYOUGiw6aGvmp4PyesAFMxf6/kXjtlhHE9HDCTDTZ+vJuvfQMHqZ5kzImgXXjeS+GhkWScLg1Q2wnri+ac0d9WlzaXnJHvG73rGtAUxjJ0Xdb7yaWby4VHgC2RFbrQzxts2Dzg2ZcoBHDsU54X2TJp28IpW8NILxHbsMfJVB0D6PoRzjEfTqaYD2niFGlw/0485XIfun2BBYQfuV6ZrNJR8NH/4wPP3u1zyIGocVlLhofdOImwi5xN2VraJkSsI0Fcp6aeTIXKXNPbVsf3UXrZRas34yEIODxlBf0tOUZ1b6KWUPM33jMKJBBhoweeLAREf4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3c0110b-f019-0943-662c-ebaa54fe6317@suse.com>
Date: Mon, 7 Aug 2023 11:37:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/mce: Address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1506ba7675065ee0cc3c84b05c2f8f963cbf64e6.1691399401.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1506ba7675065ee0cc3c84b05c2f8f963cbf64e6.1691399401.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5cbedd-8cc9-4f27-720b-08db9729f16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9743qxCp4UZn+PUZrKG8leeFP1/YPh0AnXHJ18QSE/O0vZX6LjfULox4m6070j1/H/ICg70HWwTpt2IivWk0KSuFZSKqJg8L4KXhLAbtKmDu7LwTkJtORCVbL0pBwrHoHa7DaXMDQQ7T87mkL7yuJpEb/oAxU3bMUMDcOi0esnycDwYukdonAcOZWk3EmmpzdT8w3Jxrucftiiukbq1SEpMr6qEUSUSiAdX8RuLMF0TDv7hIqDVfRR7vknrFakh9RWRYAhdVYLTDJTh76u+dOb8E2YvTlFmmP6r3vHYjbqoY/50TiUDKy143eh62bu+dQkZj1KZ1nbacgMKaC7dkGgMJRriJT2YMBjuTufeYlIBEZT2R1lX+lG4K6y37yFhVdFgFzK1n53eDopzWDs+8R1ltP8zLytWGmGhKdqZrr+ou8hAXaxOUn+I22xyxlMnFQea0bAa7I+tJkK3oZon9GjLnizeNumFP4YOVvmgHRDXUp51/cA0NJKsg53tqTlvRAQ+v3e4aiaOVa1yaGJzDlX1EkfkxLLJLJgP/27N1opXNYUMFVCOX5nbuJkqp6zUBb4h3Hdgodlmdk5aRHICepinsqc3WOyeNugcj0yg67w4v52bU3wqSQwRKZ0onBFgtF+YZoug0uSqLTiVr2H6l6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(53546011)(478600001)(6506007)(26005)(8936002)(8676002)(7416002)(38100700002)(6486002)(2616005)(4744005)(5660300002)(36756003)(2906002)(54906003)(31686004)(316002)(66556008)(66476007)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi8yMy9HZHhYZUY5bnphWXVleW1CWExsSHJ1T1o2WWJWdHpwbEs3K2RyUEhC?=
 =?utf-8?B?dDJBSWNrWHYyTGJIbXdSVGxSTXJvSUhVbXJtRjNjc0UyU1d6NWVyNUVValhH?=
 =?utf-8?B?ckxMZGxJYTVQNmE2L1F1djlReDVPeXppd3VMVmg5dkdINGtMVnBYRE9qazJq?=
 =?utf-8?B?aGFja2Qwc2FYY2hBN3VYTVJyd0F3enZtVFdIeWF3NEJzK01oTG92eVlkZE5w?=
 =?utf-8?B?NE5ZVGgzUVNhYS80dzJYVjJVMlVoNlNGd0xkWm96YnBmWmM0bGd2Y2VEUXNW?=
 =?utf-8?B?TTdieGhzc3FHT0JPTVNlYU9JM0RwV2w0YXdVUWNvYmpMakRTMmRtZmhDWkk4?=
 =?utf-8?B?akNqVXVVZEdvK0swYjVwT1lXVklkeEpLNUFMcWpEZ21WL2hETjRxazc1OGVj?=
 =?utf-8?B?OWxsWG9yOGhoMmg2NitaZ0xhYjhVb3ZuRjhaRzlDYTFJc1M5VW1kcnpnVjlJ?=
 =?utf-8?B?NzFmdWZ6c0FVeVhiSWVqY3o4WDRDOFkyR1RqZ1NtUmtYYytNbHZFSlRHenVs?=
 =?utf-8?B?UTJmUXRqb3VNVm5VdFVkR3pZMFcyNStxNm5QeDAvdUh5bEg1U1pUYktlL09l?=
 =?utf-8?B?YXpUdklqTUhVcXJtaG9PMk50aWtHMFVMSDYweE82djkwRnhYVXdVVmpRT2RE?=
 =?utf-8?B?a2lnanNDbk1aWHlZbjlGeGZhY3ErcTJYUGQ4TnlnR1pYUGJ6cmFpc2ozQXd4?=
 =?utf-8?B?TW1YYlN3dXlPSjkxODc4K1NCY2NPcm0vZVpBcWlHVjhMemIzTDdFR3d3Y1Uz?=
 =?utf-8?B?UTlOeitCVUhwNU5SbU51N05EdU0vNldzRENOK3hOYmp5R1dGNU13aUFMaDdO?=
 =?utf-8?B?Zy9xd3JUako5LzFvaXJYWXlPcEtFQUgwSTU2K1pwTWZObGZ0eGRxM2pvdHVj?=
 =?utf-8?B?MklEZVJ3bWM0MkE3SzdIcEszYnBOM0VOYVI4V1ArNkNtTGpnOUhVWFZJaExX?=
 =?utf-8?B?VGJhWTYyaVhmYnNGS1R0TFJpMU5HMGdKT0M4UmZONG1vb3g1Z3VFWm9PTTl1?=
 =?utf-8?B?N21SQS9tY3JJUEtsUk9pRWtXWEtHa21wZFdvenhvcHovbE55c21OQ01nQUp2?=
 =?utf-8?B?QVl2OGY5WG4wMHVFTXdwYnBVaG1rRm12MUVOSG4xaHlKNXFmMTRiM21USUxm?=
 =?utf-8?B?YStoOWwwMG1XMlBFNHQxdTFEU1NoU1NHcXRINGhQS2dKc3lKRU94RWhOR0t6?=
 =?utf-8?B?TjR0V2gxcUt3OTBSYk51OXRrcEZlbTJNZ3dySStQYkNDQ3RGV3lPWnFNMXVK?=
 =?utf-8?B?aHFRTHRsd1NoVENtcWh4WTVSSTF3WnRMVkV6bDZpVFZRaWVtRTdOQ2xWSytE?=
 =?utf-8?B?SWE5ME9iZ1NsMnZ3NnBCOEpuZ1ZTQ0J0VE8zZUJ1N3o0RWs0aGVpN1pHeEdh?=
 =?utf-8?B?bnlBWXZUb3VhY01LU0M2cWEvTWdCVEYxQWRZWXA1b2lyano5TWF2R282QVlv?=
 =?utf-8?B?ZElXaDVvNDVMWnBIUkR4aksvOWU3aDlaZHNJeU84b29xbTU3RWlwNTZZZitj?=
 =?utf-8?B?a1lKNkFlM0V5VWtlK0Q3Vk8xcWpmRmt4ZWY1Nkd3MkVXSjgzVW12R0dMNnZZ?=
 =?utf-8?B?amZEYVlQTTBZbkNCUkNXZ3ZacVRZRmdqakNwaUhUOG1RYWVLSnYyRk9xL1JJ?=
 =?utf-8?B?TGZOb2c5NDErUmhBTjlURHl0Z0tYRW91Q09MT29TT3lVSWZjQ3o4Mkt6Mml1?=
 =?utf-8?B?alZCdHBZTUI4anV5Nm9QOUxKQjN2OFFPK0RXM2F2eDZHMDFzYzJUNDlyc0xC?=
 =?utf-8?B?YzhwNjV6eExvVmUwR3lkcVhHem14M2dLTFFDS1hJSEVSeW5HL3RHc3NTM2M2?=
 =?utf-8?B?NENla0s0Y3R5WVdPemYyL01QRTNBVFpYWVc0Sm8xVzM1Q29YNDRUVXJOMjZZ?=
 =?utf-8?B?VSs5ZDRvcnFFQlJiMlF2TEJYWG9uUkwwaHI0UWphUk1EaHo0L2RmV1ZPMWds?=
 =?utf-8?B?VW1oOEcyVFNjZURFZEFoWFBDZWpSMi9aZmhDOVRGU2ZWVXZQdFpzM05SVlhu?=
 =?utf-8?B?VXZESXRZZjdGVmZJczB1UFQ5WEYrcnR5RWlsWDVUYWM1OENTcTAzRjQ1ZGlR?=
 =?utf-8?B?cGpuZU5BemExVCs5Qkx1VGlKNVVZR0RLYjFlU0ZsVGR6RlA4VmxoMTQ5TG0r?=
 =?utf-8?Q?XZtsqyfjnFtRtSSj7cxGmRxnJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5cbedd-8cc9-4f27-720b-08db9729f16d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:37:40.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnF+tUL5X+N62FgBOOuPzCl8gj9wSGeU8OBKR6JoMf4M/IWvnqb+8LQMxsQmJA951bDh1dAx1t0Q476hRMqn0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390

On 07.08.2023 11:23, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



