Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7776E3D7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576111.901887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUDA-00057B-UT; Thu, 03 Aug 2023 09:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576111.901887; Thu, 03 Aug 2023 09:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUDA-00054o-RO; Thu, 03 Aug 2023 09:01:36 +0000
Received: by outflank-mailman (input) for mailman id 576111;
 Thu, 03 Aug 2023 09:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRUD9-00054h-Px
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:01:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58a9f840-31dc-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 11:01:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 09:01:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:01:31 +0000
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
X-Inumbo-ID: 58a9f840-31dc-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd0na9u7ndVbVsUbaSUfbXNpGgOgtpm/X8Y8z6yCE1Y7xfMM5/rWua575TNrGU7cIypZwAJHfMja9oNFrLwQw61h4kcstX+2LEIyoVmpLpqZjLK1DSSDlAPs9VywNIVni6BxMZIwRd6mkBKMPnvUm5SHogxXTJzLAZbtS26l6Q/SL3WOuHaPBHRZf4t+70ufVu7UnWE8D81EEFmYPGtqIdQ5wcCH13FiNGK06Ma7ZHKlhce6lYQTF7sVN9aWkGsYfM14nDv23s5AoVr7fdnTliGT3PXq9/R1E3DW4eYrrm6Df8CB3frtJVeJj5RWVQz+X8JDBbB8mLCxE6QU9BwPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFyfZvvP2uaovuJM+c1ngdvlhJmsALwSlhhtKueHeYA=;
 b=S6OftbX2/6CSdDn4UVTWGQekGhbBIEK85oVj77gugB4HLT9HPZYOhfqIeIDuY8cnZ6ARkBi9+Cf0a70pu03hxuZvnOMd1N5NZkiCmDri8NmBEb2lDomX1L4FIFT+oNIpvUfPme9vGABgvG2WYkneo9meBYiLBryDsd/CVGTaaxNYxP54Tz/vFKqNifsxFvVLNEKSjdswEVloz88ojSgdU8LWhRvbehmQNtPWYDK8XwQecQMzjE5nFsvLNUGPB3H+tfG9nWsFgluudjvaxL6t/WV1fHwnXWFknEfx7Re5JgIV5XKAtLdz9iPnkr6KCAY1NAdCX4fovkMd6Y8T9ncgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFyfZvvP2uaovuJM+c1ngdvlhJmsALwSlhhtKueHeYA=;
 b=Kc2wFxJLK2RgsSwKe9E7C/fysE3qd5dGFAbCYTxUzc/8jVOYejoqsQ2RhRvXk3813Y3DvRc6PMLnaSebdq9CDWILJX5c4TRGykk9l750oJzNKhqOOJnkO3GkSRRH/WT9zedYEpJy6+zRAza6sb2L4KjhOoVZGkkJUL3ddrSAASvcENrnTHqgYGYYTouN90NLo3Pfr025Ix+pfqttaPK6eTvnGT8MJ81RRyu4XhTlD50m+VnM7UslKj02b5L7oxKkIh21xajyt3dhMDyQKtgnvZllHjATztlff/Y7yGPnzniU5uivmmo9SRyD8OXNlk97/9anZtCu2tzm0ws2r0Zy5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
Date: Thu, 3 Aug 2023 11:01:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 902989ab-7308-4b32-37d4-08db94003aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dE4N9Eo72lYYeMktimdbhvH4t0hRc4ODoRLGwaJaVErkvFpitC5sqEXBJKZvXDoPhQ26saciuOHYATZ4W2gMiF+5LHf6nlfcUmSWwavtJfQ/FP9FTpqV5vErwIj95a3f/yEMIa7yz72GP596hoUqdhSFgRXNHX6R+B/UmleOvbTe3SU/W5WvlVjCpzKINGxat5+qwbxU1AxqvWxGOWA2cKq8moCs4oAwVTiDQ/Tpp0z4S/Rl+iW7rcMiebrnGEvM7b248OUe4NUBm51YifuLdsg3q7+WgQkSQO9mLYrRyrGHGYr00OlEra9BnC1fOzOqBHPuUn0gJoyQGVbsEjSeN5pcveok5FTM8M5nvPu+kFkFwTrWU+w27HqiV6yE9b3tIg5+SAsSDfkuAAlDO29F+T+VAOw3tNIhjmTSB0DVmZlP2D5V5z2mGEMF+bRkBYv+h+lDfjKDHJ82evNVrTSvylfP5jtEiwAoIoJT4v3/GNUbQQj2tAWE5CtHV5Ioh9doStuVvjLNjo0UrsuEMjXBKAuJNm0ZrMLiZefsDbHzqL0OKgNZsO++z9mto7cXEFxHPsmMY7BrmA/Sv/DDcMsC0pmsj3m0uUARq46cQb0KIKNu7JhYA04Yhlq3cViqpmYSPsl/7jLOqLcAOVBIxKPcaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(36756003)(31696002)(86362001)(31686004)(54906003)(478600001)(110136005)(38100700002)(2616005)(6506007)(186003)(26005)(83380400001)(53546011)(8676002)(8936002)(41300700001)(6512007)(6486002)(316002)(4744005)(66476007)(66556008)(5660300002)(4326008)(7416002)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkQ5WWZqU3RlTWdrSmVBTlZMUVZWbzYrSlc0bjVML0g1YTZnZTQ4Q2NjTk9B?=
 =?utf-8?B?VmN4OEY1R2p6NWZ1RU9LV1JmVzRJMzlidzdFT1hRQ0xUMHNpdXo3Mzdod2Ez?=
 =?utf-8?B?UkxMbzdLUXZaVWRqYXB6bVJSbUJtNTRYbEVFRWlVMUkvd1Q1MUVLbWhtWUpY?=
 =?utf-8?B?UEJwYU5lVkwzc2IxTnJYZGt2M3phMTh4czlPbk5UVm5CNFJYSWZTUmFqWEd4?=
 =?utf-8?B?bSs5cnM4RjV5M1QvUkZ5czVXLzRERVQ3Z1REMWhYZW00MUgxSmkzMCtkOTJZ?=
 =?utf-8?B?eWFieWhKbXk1b1BuNmk3WmpmSUQrU0d3bmtPd0duR3dxSGhCRis3ODRiVUdR?=
 =?utf-8?B?RlU4d2VtQkF6bFlrRTRyZ0diSFFvQThwU2lGKzgvQUgwYVNzK3dnL2tSMFRt?=
 =?utf-8?B?d00zQnlHRUFhaVE4am85eVB2V3JWOUo5NEhvZEg2a2RlSXVRVWorR002NkFC?=
 =?utf-8?B?SzVnMTRlejBYZkw2Y0QwZnpmYXl3Ry8rNmFCMzV6ZU1lT3RsdnpXdnI2b0Nt?=
 =?utf-8?B?ZnRiRTlmSG9GNVladVBDeGhwb0F0T0NTTzFLeDFibWFzOWpJUCtjamxkbnEv?=
 =?utf-8?B?TGh3Q1puYkpNR3c3QnFWczhRMU5YTkZkUVlCeXVmdENQdjVrRThRSmdNS25P?=
 =?utf-8?B?OTEwRldWVGk0bDlWQkltZzNaeGFhNjJHOXRYNXVxWnlVYTd3SWZpY1pjU1l6?=
 =?utf-8?B?c1lSQmRZMDcxSC9JTDNoZ09UMjkvSi9IcEpnbmZiR3BkbHVwSzlrUGQxdzdx?=
 =?utf-8?B?ZUM2Mkljd3I2dUVOSlI1MUppb1orTDZvYmg3bk1MWndTVkdJWlorbUxOYVFO?=
 =?utf-8?B?THBOUE5XUzg3YXIvdjVYa2R0dXJySmVQM3BMaWhHcFdLT242TWgwK2Vzanor?=
 =?utf-8?B?NWtwdVRvK21vMG5jdlJMWS8zdlkwKzd3VTJwRmlQTGtZcFpGaGliSUFPQVVS?=
 =?utf-8?B?VkJZMVdNbmtPRTF4a3JwUFN3WHp6U3hHYlRXZnlPT21FM2p6OXR2Sit3UXQ5?=
 =?utf-8?B?OVQ0TGlqa1ZKZmlYV3BCdWk4QlFtZ1ltWGpHN2ZXa2JRc3NVNVRIeHhoUG1t?=
 =?utf-8?B?UGlYS1BlTU4rMVdrNzc4cWFMbWhNUzhWT09WMTdZbTZEaW5GTGNBblU4VFVX?=
 =?utf-8?B?VktxSjN1Q2Zsd3N2aitBSjNBL0VKN0k4ZSt0dDFNbmxoUHhQanA0YU9GUGt2?=
 =?utf-8?B?MDNyV0dQQkFkWlJOeCtYNXVDWklOTm5FK0NnSHIva1lnTmJieUQyblZsclpF?=
 =?utf-8?B?NFRFcDdndnBjZnZ3YlZNbW50a3RKcGtlSitvOWZUWFMxYjJXYzFDd1lvUzJ1?=
 =?utf-8?B?aW1HWC9XVEdOTVk1OXlCdVIzTEZ1M2lEUTRoZTNmcGxaR2pJZXM0NEZIcXkw?=
 =?utf-8?B?aTV1eEVLTFNEbEs1ZGFqU3M2bSttQUpVeHU2dlQvQzI1TUZJSXpBQU9XY09B?=
 =?utf-8?B?Q1NaVjBMTHV6ZW5WR3VCeW1zNEJ1YkZwdU9QOGprWnNxWW80UGxYeG9KS3p3?=
 =?utf-8?B?K0JEYzhjaE8xaHpYenFDMi95NDR3ajlNRFJqdEtIQ2o1OHpscmpiTmFmYWo2?=
 =?utf-8?B?WTlVaVluYXd6MmJ3QXBacGxmTklEendBNlA4eHVMUmJvUGZmREY1MEF5NHBz?=
 =?utf-8?B?dXhEVWZXTHBCQXNvTEdxYVJzTXNDalZ2cHpOdUN5VUhHU3BJN3RRQXJLdmN1?=
 =?utf-8?B?N0hBUmtwYmpjd0llTGl5OXl2aDVXbGc2STRGekFsMWhUZURZZW90N3BsMnFV?=
 =?utf-8?B?UkhYNVVsSGdlZVZxMUlXc0VoeDF1b0ZWOC9YUVNWZEdFN051dG5yR3E2NnZj?=
 =?utf-8?B?YXk0T3R6SnNzaWc2WGVZVER2ZFBjd2NMQTYvcWpUSDRMcXcyak9GQndibFFz?=
 =?utf-8?B?TVU5bmRKUkVMazlyMmxjQVlPZWplS0hMbVlUNnlnamtGOExYeFZ5Wm9nOHd3?=
 =?utf-8?B?ajdUVzhET01JcGVKb1NQNTVuWDArb3NTTjN2MytuTldscG5XdmN4cXd4YlFq?=
 =?utf-8?B?dDdPUml0UGU1cGNHS3kraWZkOCsrRnFVZUdRdVNXNG96aWEvR0c4cTJ5bVhO?=
 =?utf-8?B?ZURReEhEZkFHMEMvZWpSZTc2dm56RlB5QkVrSTNYdVlxdHFSd1g2T2VNUnp5?=
 =?utf-8?Q?35xmP26WI1A1GE/t1pIArHgHF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902989ab-7308-4b32-37d4-08db94003aff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:01:31.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKuBiqqH8ery9cBQkgCjfPMXRTfadUj/vQYSRUMtmbMv9x/myN40HrYuHeKSm/ccIby4alaAs7U/ekq9oIipdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 03.08.2023 04:13, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> @@ -1169,8 +1170,6 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>>  
>>      switch ( action->ack_type )
>>      {
>> -        cpumask_t *cpu_eoi_map;
> 
> It is only used by case ACKTYPE_EOI so it can be moved there (with a new
> block):
> 
> 
>     case ACKTYPE_EOI:
>     {
>         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
>         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
>         spin_unlock_irq(&desc->lock);
>         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
>         return;
>     }
>     }

This pattern (two closing braces at the same level) is why switch scope
variable declarations were introduced (at least as far as introductions
by me go). If switch scope variables aren't okay (which I continue to
consider questionable), then this stylistic aspect needs sorting first
(if everyone else thinks the above style is okay - with the missing
blank line inserted -, then so be it).

Jan

