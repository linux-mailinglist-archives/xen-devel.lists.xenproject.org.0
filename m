Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF6773828
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 08:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579262.907166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTG1t-0005ky-81; Tue, 08 Aug 2023 06:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579262.907166; Tue, 08 Aug 2023 06:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTG1t-0005j3-3y; Tue, 08 Aug 2023 06:17:17 +0000
Received: by outflank-mailman (input) for mailman id 579262;
 Tue, 08 Aug 2023 06:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTG1r-0005ix-OP
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 06:17:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375ab3a3-35b3-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 08:17:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 06:17:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 06:17:11 +0000
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
X-Inumbo-ID: 375ab3a3-35b3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip19fuEGKZ8hRXwRXWtUsmloZB2qXC+ou8kbZaZj3u4OjaKIzrWUXmz2wuHRPeaNH7pbnVr3JOKpnYH8vyPocR2tz9pelhPnyKHC/zKQ50Pp8mj6co6OTznD3yul5xEOOiYL/OVb2FKgh9N8CQfDCKZaKUYx/ii+DQXdyZMtF4mHWwGXT4cYEpLpBQ4Mf2lJilc+pCCnmyfCGmo1Aw5j1Ejx118qFQjLWq/4F+en52C3Pv53JHxWAYiESiOkrTw46SP305jAhmkQhM0v1sll3+GbOPUP4o7Yn4ShRD2C2vhf0jtKp9cZPvCWH3E9dllrZBS+K6V1sZIZgphu7l8X0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLRrvUKXB/O7RFFHnmwCd+qmJOIipN2/PdpFVANAkR4=;
 b=UGFGanwCMymYUf+kXwqzMuzRpUkAQyzJMckcjMpnOubk2oVo0L56vMKqhYgeTeWBLIj7Sw4hhHtXfFR9IR2o60Un/ErAvKLmIdd3IdCWUVM9YxksEsZ9g3p2xq9L/XPvrYqGNYzKDgvpzpLjF1LgdkTHzs9Cgy1pyLknltSna2O+7fF/u/m/H0RJfq6Cum2Ka9+U7bjVMpGaa9ILXAwnS9OULNPLbmiKhlHN2KNoxVcO4+DfruYMXbURF0zFUFvyI/VJup0bmVucDadUxFY71XbAmq0nrB2FqM/BV8PrpTaH680wzxKLSf2ZKne8/cnB4+xDZWCqZyOV7eVDtU/q4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLRrvUKXB/O7RFFHnmwCd+qmJOIipN2/PdpFVANAkR4=;
 b=TuCjCGH39nHddx8Z7MZ1J1SMBDFm+Ur7Es5R8NFF3hd7pzrbAwKKFbgldv4Ylk0qgnczOLDdUrAYKpExFQB0LuGv8FXrJ/xMNcuM49KlY9UUGFb3l0eyeRYYQc1yyXRebOJZr3n/ZBsFT2Xp0zodxs8qB5/bES8cRE7ktNgr5ruEJwcxkjfiwn7KuY6N/TYBtOkldAlVHOp0bFAIc9SjhJzkYokUrXTVj6ULQNe+5yiXfwX47qsMA0tNyf1bNxaLPMbbyYS+OGe3tmmlusL8NWzl2skMHheT7t3Os0StEUwkXQ/aCZCio+zZBZOxAETmUUau1Y8DWs+s1CXCfsyBeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02de9a1f-87d2-1a7c-a475-a83a6ce998cf@suse.com>
Date: Tue, 8 Aug 2023 08:17:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
 <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
 <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
 <67b5c363-a653-3f5c-ea3a-f52bfac3dc49@citrix.com>
 <75a70fa0-ab40-e2b0-685d-db752c943a7d@suse.com>
 <64d11674.7b0a0220.ec9d0.7073@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64d11674.7b0a0220.ec9d0.7073@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: fab78cda-7570-47c0-8891-08db97d719de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yk6sYKl0S52BQpjnX/h8bBakIRMvj8wWIsmI5pFVAibvzhUdLyM7Cjaj6GF5kv7wQUsNgXsDdlk0T4NtmhI1ny11ctfkxBR9693FOcUGArQnegczwrScUisMsACI3e9Ce+kA+rxHssElyEVvOTg/m5INQWfaQUkEPzMLv/Iq2C+yN73IUzNy/PabMhsK242/pVLM3e5dzheyh5MDp/b9JL53k7KWFQdNcCZcv85GniaIiy2Nl8gJ0QhbJZwIatMy/OkX8/jKXh+b8T4Q+rLFXh/8oM/AxBqctWFClMoXxjHrJXOac2OhvJ+rRQVGhOiJbieXCZfG1xH8hSonMbOAv8CZsqe6UYhyxu6mhl+nJZw+cbZm+9ES8Zs4OFzdmfGCbhBmBg5o9Ssop6ul0cZa0XXhvxM5EKEPlb7zBTtV2kpcpXg+K8Z/+oc3ClDMoAeG47DnHfYOzPBVoDHiq3TfD9Cw/nWuB1ThWMH9LEv/wi04RK2A+mSxcsJvhElsB67PJmlhCpb0/6V7B6W6NlTex4gz9lPZBwHHOZL9s0OjJb1gkV0yIbzsGYOEk/fDiO/NKrDNBAdLY5dm/NXA1e3YXL/inmbam9hKBws3DCVvH1OK6sYwvBeYDmT19l3KNmNDWBdVF6aBQYmrzUYvsZ2WdxR7dU+ycs7J9Q/HknG5YheNLWMtFoDPk6SNMsWq+Er3ep4SlN4LsA07JQ/5Uoeh0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(90011799007)(1800799003)(186006)(90021799007)(451199021)(38100700002)(54906003)(478600001)(6666004)(6486002)(6512007)(6916009)(41300700001)(316002)(5660300002)(8676002)(66946007)(66556008)(66476007)(8936002)(4326008)(83380400001)(2616005)(53546011)(26005)(6506007)(86362001)(31696002)(36756003)(7416002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckx0OHlQWUVFdFZPQzBWejExVVlsU1ZUNEkvcG5HQW82MTBkQXFUTHpubDVX?=
 =?utf-8?B?NnpWYzUzQ1FiU2s5bnc5NzZOQXlzeU1XVWV0enhyMGwvNFV6dWdjcCtSaFV2?=
 =?utf-8?B?OFdnTHBndnZUNlduVytwZkhtaG5SUEF2STc2bnorUkZkUVRPQVBUVmlOT2M5?=
 =?utf-8?B?UTQ0cEY0MFo4ZnhnWFhwUjRYSXcvekI1SnF2TTRlWUNUTnZpMmJ4U0xiSjBx?=
 =?utf-8?B?cFBOcGZKWitBc0FiQjVkK3JoU2FyVUtqYjNnL2ordC9xMUI3UDgwMVhjOWJh?=
 =?utf-8?B?R244a1VSTStmNHFqZHlhV0ZkakhORUxod1dvditJUldPd3Rpa012SFViUEZ0?=
 =?utf-8?B?bEpUUE5QcTBhR1lPK2lxVmtzcHRaelVUWElyaVpXU21IbHlGb0hRTmY4ZlJm?=
 =?utf-8?B?Z3hXQy9EcXhwdTdNN0RDNXN4YUhzU2hyVlRTT3RTWWNjL0VxeTVmQXNBNHk3?=
 =?utf-8?B?RGNORlBwZzBCZTlId3JGODlka0dwUmhLY0RyL0tlU3BycnA2RjJqOEEweTlq?=
 =?utf-8?B?c3IxVUNrOUV4Y0J3R29UYjFsWEtGQi8zSnlJaGtBMTJYdU9BSXZxN3EwNUMw?=
 =?utf-8?B?WGdsaUtXWEp1aUpscUFjUTBJSXhIclVGblRPVjkwcjB3dmN4UGp6bzB2SVJF?=
 =?utf-8?B?T3F2LzVKOGNYNkprSWFPVG5TbnQvYjVMUnNqUHdRWDEzb29TQkg2M09qSnFT?=
 =?utf-8?B?cVh5VHZ6V1N4UmM3R2x4dnZVMElzVW56cFc0Zmp4MzBtK0lZRFFhT3c4NlpV?=
 =?utf-8?B?MUp4N1pKNXdRdHI5aGorcnkySVA3S0JXL3l1ZDZiRE5oT3NZWGZXUUsyZWZW?=
 =?utf-8?B?d09HRGh5L1Ard01ucmtOY1VSOFozMmcrY054Q0dOZldQZlBWb0xpc1R5OERs?=
 =?utf-8?B?M0duSWxoeWVMQWQxT1dNSnVzSld5SHpWalpuYXg2MTVLdndmVStMeDZ4U2xL?=
 =?utf-8?B?SHhhdE0vMVY2YVE1Y1ZMWnltZkhUWE56Y2hNcmlRZDRQTWFtWXFoa0hMNHdn?=
 =?utf-8?B?Y2JsNFFaZDMzUXpzT2tEWDZ2SWM1L1dYYmxSMHhmWXpwQVlTK21YZGxjNHR2?=
 =?utf-8?B?czMzWFArRHhvZ3Y3YnRnalNkNk5TV0Fzdkg4L1NaOEkrOSt5emIxS0ltNWR2?=
 =?utf-8?B?KzYwSVRBVGNod25uZXZac1FDU1BJbUdCcUE2N2ZUU2M4ZXIzRlFvSThHOVht?=
 =?utf-8?B?NThXQjluUUtmWHJxb291anhHRFRlZlpidUU2bDlrdmkwVHBUYnlTd1VGTkFU?=
 =?utf-8?B?dzludjE2cnlQTkxxbUNLTWo0MzZ1YUxrYVg3NnpqdlprS0tmaW9qSGdUVHpB?=
 =?utf-8?B?TGF4RkEzTmpnSmdUbTkwU1ZodWsvYTdhakdtbVREZEVUd3lTQ0d1NGI3cjhJ?=
 =?utf-8?B?NWxGUnFCZ1lDbkJWaXpXcjI2UHU5R1VKNzVBTXdMbmxLbFFjWWRzL2Y2WFAz?=
 =?utf-8?B?S01ZbExiVWg1S2Z2cFFyREI2VzRZci90SG1YMjlZNU1rZUtpVWU0bnpsVVlq?=
 =?utf-8?B?Tyt3NGpic2tITG5VTDROZG5Rc29wS0xCdDIzQVQxZUhGWm5neGh6Yk5FMUtZ?=
 =?utf-8?B?RlZTRUVudlZwbG1BbEhyQkRBOE9jZXUvZlVjV0NhMHpvWWg1UnF5a3pNRDBT?=
 =?utf-8?B?SCs2NHVPdGxBbXpXTHdDWktiODRDOTlLSCs4cWhIVjNiL3Y4cWxyeDJGZWtC?=
 =?utf-8?B?S2tucEM0Sk1aN3FtSno0UTFDcStXVTJSYktIYzJtNm5Idk0rNWNxYXk4YkFl?=
 =?utf-8?B?V3RrcmZsdlNaV1lhWDl5ZXNjYy8wTUpPcURaTFU4ZXVHUDZSUWFreW5YMWhG?=
 =?utf-8?B?Mk0veUVXMlcyVnJaSEwzeE8yMDFEK0Eva3VhSU9sUExhSjduMzVPVmllSzZD?=
 =?utf-8?B?eG44cnA5anpQRzlaUW9pTUYySUNEQVJWWlM0NFErektZdGgzYjZwLzRtQ0xw?=
 =?utf-8?B?c25VenFKRVk3Qko0ZVR6eEJ0bWduTVBYNnlVVGJ5b3Q2TEdURFdyUzI3ell6?=
 =?utf-8?B?OUR1enRMYUttaUNaZmJNV3plbWNwQmNiZ0hYdXlmeENadDRwRlVvZW1udlVQ?=
 =?utf-8?B?U0crVUwvbUZCZXQycUxvUmxzN3Y2U2Frd0hZcUErME10c2tER09SelJ6Y3U2?=
 =?utf-8?Q?EaYXOsWvS+M0d7Hik8R1DQISU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab78cda-7570-47c0-8891-08db97d719de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 06:17:11.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt/G6c1r4aG0m25LFcXny73/J92BKz0Xhr8P6wAUH5Tj5HSTSw9EnnxXVxlzl76ZKysBHcIMVrchhFjD0ZOqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

On 07.08.2023 18:06, Alejandro Vallejo wrote:
> An alt-patching series can probably make it very close to the perf win of
> this patch as long as it transforms the conversion hunks into no-ops when
> there's no hole. I looked into the 2018 patch, and I don't think it tried
> to go that far (afaics it's purpose is to inline the compression parameters
> into the code stream). I highly suspect it would still noticiably
> underperform compared to this one, but I admit it's guesswork and I'd be
> happy to be proven wrong through benchmarks.

The alt-patching certainly will have some residual overhead; if for nothing
else then for the long clobber lists in some of the alternatives.

> Summary:
>   * While alt-patching is an attractive alternative this series doesn't do
>     that and in the spirit of keeping things simple I'd really rather keep
>     it that way. Does this sound reasonable?
>   * For the topic of when to disable compression by default on x86, I
>     genuinely think now's as good a time as any. If we were to do it in 2
>     steps any project downstream may very well not notice until 2 releases
>     down the line, at which point they simply must turn compression back
>     on, which is what they would have to do now anyway.
>   * For the topic of allowing or not the option to be selectable, I think
>     it would be a mistake to preclude it because while we don't know of
>     physical memory maps with big holes on (publicly available) x86, Xen
>     may be itself virtualized with arbitrary memory maps. Unlikely and far
>     fetched as it is, it's IMO worth being at least cautious about. Gating
>     the feature on EXPERT=y and adding a big warning should be good enough
>     to avoid foot-shootouts.

I could live with this as a compromise; really my main objection is to not
allowing the functionality at all on x86. Beyond that I'm obviously not
overly happy with how things are moving here, but so be it.

Jan

