Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F4729417
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545703.852208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Y2j-0006Q1-Am; Fri, 09 Jun 2023 09:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545703.852208; Fri, 09 Jun 2023 09:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Y2j-0006NX-7n; Fri, 09 Jun 2023 09:04:25 +0000
Received: by outflank-mailman (input) for mailman id 545703;
 Fri, 09 Jun 2023 09:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7Y2i-0006NR-73
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:04:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f2ebd38-06a4-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:04:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 09:04:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:04:18 +0000
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
X-Inumbo-ID: 9f2ebd38-06a4-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR1cz5sLILX3z0BcAcNiuXdOVQCB5lh4m9uEnrUMZYI/rCXdFoylIJPsHqTsplmLF131ZYRK5SwoyNqcGifTzS/HCK1qT9/ctzqBgySZ4VpSHY2TJ15KXfsp9t/ydg4yJXzMLcSDV1jK9jTBT1m3RG88y0XOwQl4w6cKKSCZ2h8GC2MVXDVCaiQaiAdJRsHzprKKMSf4X6EPrXPuXfK6yenJaf9iXJHT9IUNyaSV9jO1+y5BAVr0vphJz13zJGDaM9LZlYJwFavJtZlgGXZiRHoNtFNxVR5oiKby7WusRg4kvWgOpCP9tN684H6SC+OnNhvk4DNzvmGCEOBb++2A7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BqDHaZVdTMlAiI0cCvelxjHso/HKHC46qE1Me19eFg=;
 b=ENEv9bsM89z6D4jmTpUNHnDL6ESeFpZPGPCI52KSJttm7h33YeQrwQFJQ1WDierdQufbEmAZSAk3LjCg2QPv7JiTSCZytgvA/k5QzJ4SWgXEfet3lcXucEXcZJ+7oXXeY3XPaRYNohfJx0nWDEjofmwRXYq7Tj6qhhe8NVkWNL1xkg4QY9MtPaSGBLaBoImAylL39p0Xdl9VO1h0p91orp7SNkIqSZX0wk9xZOo4QkUVpXMFDy3yxN/ybZiLhHIIBqh2xhmI9KD3IhK8xnJL90xsHEE4BgeH6L7VrP8Oy8y+gGmL8uhCc+VlFW7W1KaLhUN4nROKcgoxTBKMUJYGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BqDHaZVdTMlAiI0cCvelxjHso/HKHC46qE1Me19eFg=;
 b=PQ15oR50JX5ivznwtlKui4g8SLaklqx83YmCpep4CYNRKg/CcRvX0MMgWcEdll0NQ4kI+oAftLThLUx4XXjnMjC7JIDx/cHlEAxmQ+EIamSrh8oFgvnBoTHu6ITqR9AVFBuoYK1vqgs15eKk1Fje1ShBEvNb+RtZk9R65Quw4JQsuAabOCtTG9q4pzIo9GVdrW8MgNt5KZY3+2snhaeIw/b7py3ddW0pT5HPBhKU6gjOLtRCMzFK5y/L8OIa4/joNt8/hRm2AEWUnj/HE9tFapMMNnDfeSaDn7ntphkTsaBxTMLhmBAuJBINITq5aJz1BmgEnrswMKxdPsDJfsgKMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ad44f3b-587f-07e6-4601-59b961954c9d@suse.com>
Date: Fri, 9 Jun 2023 11:04:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] maintainers: Add PPC64 maintainer
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio
 <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
References: <cover.1686148363.git.shawn@anastas.io>
 <2ec38b52d944919934b2326a1924200aa954008d.1686148363.git.shawn@anastas.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ec38b52d944919934b2326a1924200aa954008d.1686148363.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: a62fd179-baa0-46da-0b43-08db68c881a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fBx1n1FhF7YS/ij54HnSZr/qEQIb/PtlsdS/woqEmdRtl+IwBMmSAs3ou5MuLDyrICN1/+S5qVEverrqou5hQ8nrShvDHlCumZ9saxKIfXZrbAbFe4wmaef37x2Oi/KifmE6dOVAl3fMA3jgzjn7A94Wcu3SQAmJo1odmaDB8Ou7OuuZtdv9nru28Y52793mnir7wWgaFvJuXm7idqOyIvEmWdUv+v0y48PNFods0B1DXADGWI3rjEffuEJ590rhDcNY3lYDqv7pJ8/JAGGPQC1org7l1BTDMWLZgLmt8HB7Vr/jg+RzzQ/2Ws/09c6CEwYPETT4pz8BpyNO3sPncD2nEVWTvJ8mI+scpfBGWZxhl97ET6IVKg5jDv0RBADQxBJRBRgh2b6HQz75PHqNqxDvVCp0EH2Mv7kuGo4nljSMvQLXfcLhdM3ONjf0yMJTnQ5zpLu7ZFZWD5c8jJhmw1dPiYy1I/SLL+/58KiABYAZ/L0SECAMrBmLJLu4ycGtrDnKIMi5SdOF5IpQR2gVVpmo1AiojJY0G6daS5zKNaK5p4i+DUxmY7BGqwAfldCEScSVaW2qlgOxNkDbcz9UukxmjH1qCB10KlA5Vuh/XFPXtSkwcMZk5YPFJ4IF0d0xo52vR2Fdhg7oJTyM5XdxMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199021)(31686004)(26005)(186003)(5660300002)(41300700001)(53546011)(6512007)(6506007)(36756003)(66556008)(966005)(66476007)(66946007)(4326008)(478600001)(2616005)(8676002)(54906003)(8936002)(31696002)(4744005)(6916009)(86362001)(6486002)(316002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVuVlB5NC9uTTdlRllYREFHVEhXUzI2a2dqTENiVHZ3ZllETWJWeFB2Rys0?=
 =?utf-8?B?N0l1M3BFejFCR1Z2Zys1dG8xYXhQNUdZeXhwNU1udFhWVGRRM3hHR0daSWhI?=
 =?utf-8?B?UGhrM0pNbE5STUZvNi9XL2lINDA4T1VYdkdTRFlSQWdyalpTRVFNR3QxVSta?=
 =?utf-8?B?MXRKQW1FN3k3SUt2Z2JQR3lQNFY2akRMZE9Xd3AvN0MvRXhaRUtZQWlXRGM3?=
 =?utf-8?B?b0IzNW5tRnp1S2xOVmlDY1k5blBURkpOSTFRcWR3RXY5NUQ2NmplR0pybkho?=
 =?utf-8?B?RGN6MWtvZEJSdk9ONS9kQjVUSUxMZ2dSem5WdFBmd3BWM1hzTW1XN2l1ZEV5?=
 =?utf-8?B?MHNUamkyc0tzMkd3M0huT1NNS1lNMGJmcElxTGF5ZW81dlZXb0xiYkUreHJi?=
 =?utf-8?B?d2N2eGtla0R3LysrNFoxRzFubGNJOVZRQ21mV3hRMWZWd1hxQlNqUGxZVXhM?=
 =?utf-8?B?Nm0yamZ6S0IvTUkzQWlyQW9OaVM3U2JyWVJ3cWkweVJ3Z2Z0b3gvRDYvanUz?=
 =?utf-8?B?ckRsMGxYT2VObm8wS2FMVUNFekRKeW9FQVdEWjJOdnNtRk1uY1JzSlNmbXNB?=
 =?utf-8?B?dUVERENFN3B6M1o1V2xqVklPMFB0ajZuWXNGdnBhVlRCTjZDWTlNcWxETnp1?=
 =?utf-8?B?aVF1SnRSRGhlSVA3Tkh5ZDNsanZEb0tlVWsyeEw2aTBhaDE0YmppR1Avc0RF?=
 =?utf-8?B?bklqS0NJNitucUY0MVNiME5Jc0tNZ0JUZEVMZ005eG5OQXRMRFpMWE9rUWtI?=
 =?utf-8?B?aEw1b0R5UCtlSWZ2TXY5Z25LUjREMG50dDNFUHFEZWlpMjh5NTVSbUFQMnhL?=
 =?utf-8?B?MUF4SWdCK2pzdTJRZlAxSlY2SEsrcHJya2pudzBaTlFiTlFZSDI5aVVGNzRP?=
 =?utf-8?B?WGFpTkpkZWxHaklGS21BWHZkc0trUFgxdlcrZTZ1a0xBOW1nQno0Um8wNzVs?=
 =?utf-8?B?VWtsanIveTBpZitkb3Erd25RKzUxa2E0VytkU2FlYUEwUXpUR3dyUlUvQVJs?=
 =?utf-8?B?emY1ZTIyTGJzK2J1dzlGcFFHRU52VFRHSzRKdkpFR3lTNURMTjRUUGhyUk1F?=
 =?utf-8?B?cWQyY2ZkbXZhWmZvWGRRRFVKaFZQUmxLZ2NrZnVISklLQmlYTjN4Q2RaOVhR?=
 =?utf-8?B?NnJ5S1oxOGxOL0k2UXhMOTJwY2VmRVlNYzQ5dVVlYU80L0R3bzAxQlRkaThR?=
 =?utf-8?B?VCs3SW9ldGRPK0dPMzJleXdPSXRNMldoVHlNbWRwK2tzcm1TTE5FZ0ZWN01V?=
 =?utf-8?B?SlQ0S2dva1J3M1pPTWhGVk5VTkVhYStMSE5iZjU2aldqUDVwdjJERlhiKzFR?=
 =?utf-8?B?NGVVQ2ttR004eGVsWitZREpkUjVaeTE0KzRnQkkxRkY3ck4xMlFxU0FyN1JD?=
 =?utf-8?B?SVhXd2thTUd0TVpIT1ljY0dQdm9PM3h1aVVHVllOZG1uNSsvcFNaWW1xSjJK?=
 =?utf-8?B?anJIc2c4QVc1VnE1UmhLTGNTRVdhRzYyT1ZacFFubU9ncHh6T2hPS3Jpdll3?=
 =?utf-8?B?RHRBY2RrcytWOGdpTi93aHlaVE5rQTNSWW1GRjhGeitPVmpVUnBmeXgrYjdK?=
 =?utf-8?B?VUxvbTFGN090MDZuMUZ3ejF4Y1lhNW5wbCtjbFJQZWZTaFRFeGRYcXJjMWl1?=
 =?utf-8?B?cDM3QWcxYlBSYmpNUFN3L0x4YWRoT0FkK1ZhSGUxZHhmR0xsMDhTTTBHSWdB?=
 =?utf-8?B?Q05FL2Y1c1RBNDZqNFhXWWs4QWQ5S3Ixd0piM0ttU3dXTDFjelpEMXQ1R2hh?=
 =?utf-8?B?UGdhRFJremMyZnFuS201emZVRXdhNUdUYWw3ZVJqY3VXWEFOWGh5N29RdVpu?=
 =?utf-8?B?SjByTnIyMUZIOGF2d0RTdE8yaEhYRDhCTndnWnUvbXlmS1RWbHE2VzFiZm1p?=
 =?utf-8?B?ZkZyOWIyd2JEOXdkSDFwUHpQV3lUV0ZJUkRGOEUzZVVRNkwyU1lkTkFidDF0?=
 =?utf-8?B?UmM0SXI0VDh0VVl4S3A1K3R6MlhjeDFoWDF4bjZjbmtVVkJGbk1qbk5tT3M2?=
 =?utf-8?B?Q0NmZitVdHk4ZisxOVB1WUk0QVRpaldOdGp3NXNMYm5xNGs2VmpuRlovMFRU?=
 =?utf-8?B?Ti9ieFllaTBGYXZENVdtTFdKS0llblNHdTJxQUMvc0ovQk1VU3Rjckpmb3Jt?=
 =?utf-8?Q?M/QDyJwAkS3NNjTH51C6hlLWt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62fd179-baa0-46da-0b43-08db68c881a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:04:18.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSOCQM6L6n4L6lOq1XRl6hcD+64gKh4NGlsFi42YMU+yaHPW3ZgUXA91oO604QnqYSO4JbARDw/jbD2Vy5s4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885

On 07.06.2023 17:06, Shawn Anastasio wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -451,6 +451,9 @@ M:	Wei Liu <wl@xen.org>
>  S:	Supported
>  T:	git https://xenbits.xenproject.org/git-http/ovmf.git
>  
> +PPC64
> +M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> +
>  POWER MANAGEMENT
>  M:	Jan Beulich <jbeulich@suse.com>
>  S:	Supported

Nit: You want to move your insertion further down, to maintain alphabetic
sorting. You further want at least one F: line; see e.g. RISC-V's entry.

Jan

