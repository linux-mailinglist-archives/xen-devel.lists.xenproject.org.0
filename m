Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F039EEAC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 08:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138298.256053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqVA0-0006aF-KI; Tue, 08 Jun 2021 06:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138298.256053; Tue, 08 Jun 2021 06:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqVA0-0006YW-Gi; Tue, 08 Jun 2021 06:24:24 +0000
Received: by outflank-mailman (input) for mailman id 138298;
 Tue, 08 Jun 2021 06:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqV9z-0006YO-8c
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 06:24:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e59ea71c-6777-45d5-a5d7-6ba1c271d525;
 Tue, 08 Jun 2021 06:24:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-m8QeLUt5MbKmeNXnwYqtyA-1; Tue, 08 Jun 2021 08:24:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.30; Tue, 8 Jun
 2021 06:24:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:24:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:24:18 +0000
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
X-Inumbo-ID: e59ea71c-6777-45d5-a5d7-6ba1c271d525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623133461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d7B/Jaq2T7t7N2Xwb5Ch47g331S3widrRMqH6FSvhs=;
	b=MR5SekSFJR+8s5oSIc1P9GtUt4NmvjPQF8BuWsT4A09Fi9OOwvD3IBESj5ZmWTUjazoEL8
	ROK0KLFYnH/jg7ithQvni0tPDQzLe8LBoFSVWxiMCPZyezNL0pdLbOne9CROYN1YNeTXIc
	b26o/Ppuk9VxDkU55rva9dnhNCi+p4k=
X-MC-Unique: m8QeLUt5MbKmeNXnwYqtyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e64V1QIu2mdDzS1PfmK9d6t15JfSlSruJGRZOHNE71jvkE2G73IXj9YuV++P6FSbfPeZ4kTg4MOzvyQxnjmrQNquxva1BF/dfRy4cZVNq35J1rfTMRajegGTGBja/H++uyBIZyc1Bxzhi1n92Kg+WaZYgrXuQOurw1BfC8V4QSAokxhhCxX6RgIaKvoFBIr8pxaZ51+N9NikAQfR0ulaemrZtVpPK4R7QZcqx9DS6qZpHpRjMp6ZWotcrD8jlhl08cFBSSiPIdacB8qQPRJFMoFrjHrJaslSooU5+gRdlo2iIkUKJNHuz0zIxSc5Mw4aulK2VTTXASO0P4wKD7AETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d7B/Jaq2T7t7N2Xwb5Ch47g331S3widrRMqH6FSvhs=;
 b=Q99iMyKHA6OSEDc1dEyl9aZSFo7R/1hn0rdpaZoPn7YpHAub7YGHh8dUaMj0uZQWSh1D3Z9W77FWx17RD2mKbdEbfAziE1Cm1ubaa/pWshQaG0MKKVnQwjmhKGTiLcY+H6okfigu17zt0nCxMcQiFkdG3fiSRxmODmUNzACa2QLbWKdAmGJ50dRSXne0jTmupCSb0edYzLnN9jYcpjRWK60YORgrYFX/EpALldvuUr6K/9GfJOjL/Amoy/Mjp4aL4uCKDDrWwelWQCwnTeBkQVk8t7LjTUHZZoPh71gTowJc1AiMDYUYV6abVyA1Mrx3I70VbIAut0Ar1tfqtJZO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [BUG] Passed through PCI devices lost after Windows HVM DomU
 reboot
To: Paul Leiber <paul@onlineschubla.de>
References: <FRYP281MB05828EB0C49C963C7954578CB0389@FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f532ea4-4ff4-e163-9492-096d16a316e7@suse.com>
Date: Tue, 8 Jun 2021 08:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <FRYP281MB05828EB0C49C963C7954578CB0389@FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be43591f-f716-4a44-57b5-08d92a460bda
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31184977D603E471D83FB86BB3379@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pEO2NzhQuTk6XpGMX2gAglUS60c4UoqAixh4BdFex8HiL1lf1VEW8Mpux8Pgf6dnd6Hs2bJwoSrmoS00hRaXR4KkVPNIZTbf3gXjTX0eIXa2JUeBdc4a96BHEYKUOrBZmZ9RL5qNEQYpUn7sHjuH9hKf1A3DorBGvXTtJ9ArGZ6mWG4v3BRvxXUBSh077tMMmk+MOQim7+o1MuVKmSnIKZua33ODD7hY6dBQBH/E1FyoYoZjtIUKg/gnFbYy/gni5/RCwbY7rQCK/1RuON4yO8k5yFyymxKVyG7fdSvUmUqknXV7G9z1krsNDWnLL3xZuYKl/oD/M9uHvpiuUw5m6nX8VVTpqAVlNE0zYyoT3tHsDWn4ikBWoQCzFtd2Fe3VrAdiT0+AWAmUEI3u3SrUf2W7YgHzE6tSr/4TNxU0cqZLh16JY7EOUrX0a5T+LORQC8PT5n4chz0b/blxoP3naqPNxkN4lyzQ/OD7QE8mO48y9pSeJXCG4gwLJATISO4WN9W7zF3sfiyG+aEF2zdtSn0UZfgU/+BqkRs0RtwjK4uhp02pfQ+YCdRYNF1lEBCvPaAMItp/iiRl405Xj+VENhjM8R4jKGPaMVTrU6UcMKUr1XB8pX2a5DvdKq6qpugxqTzIS6fp45TnKJnnKep4WJZnv/ROEOp3BLo0F/MC1YEjgli7QwFKq8BdgqxBsN+szfvNoPHtHm2b9mEV68snRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(346002)(376002)(136003)(26005)(16526019)(38100700002)(4326008)(8936002)(186003)(66476007)(66556008)(8676002)(66946007)(83380400001)(6916009)(956004)(2616005)(53546011)(5660300002)(86362001)(31686004)(316002)(478600001)(2906002)(16576012)(6486002)(31696002)(36756003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?ZEFKOHVya1hJL0Y3TzJWb0lMdFJ5TUNXaVNPYlBCemlMa25ndGFhOC9LUEwr?=
 =?utf-8?B?UXZSaVlzUmR3Smc0MTRnc1JoSktuOUgxK3kvUjVscTdKc3R1WndVT3cyR2Fk?=
 =?utf-8?B?d2xPK29haHZyVHlGTzliODBtVDdpRWh2TitqQ0lVdkRFZUszaW8zNzRkRVdX?=
 =?utf-8?B?UXhtRCt2aUhnVlkvUkJuWUpTQUI3bkg4Zm9VcUkzRDVvdDhPK3VhUTUyQUFY?=
 =?utf-8?B?T1RmNEhuWTg1VVREMjQvOXdlL3J6M3VIUTUyNjE0SnF1OGtTTGhrYjZZNUor?=
 =?utf-8?B?Z1VmQ2hIRzBKcnRTTUoybkN2WEdBczhZVDBrNVFrSFlyR2RtelA4L3lRNHFj?=
 =?utf-8?B?NUh6Nk1pVHcxZlRSWndjenp4aUxFY1MyTVhlSWE5N1JmUVhLK09ZSjBYZ3N6?=
 =?utf-8?B?VjdmcWZRR1Fjcmg2bmM0WXVaL1JIdjUvUTVnWGNpYVE3R2lqeDZ1aGhwenZp?=
 =?utf-8?B?MkgwbUxNbXViVVl5bnlQUksvcHVqQUEwbUp2VnVuNE1ES0JOSzJZUFcybGNv?=
 =?utf-8?B?WERJMW9tOWJVRktObXVCZXRvSWRwaVA0U2FudGk5czJnNEpUREZaVUJlVU0z?=
 =?utf-8?B?cG5HMkYzV2prMGI5WVZlUjlGVWUybEQwYnZYYzRnajFMQkplS1RXTDJaV1Bu?=
 =?utf-8?B?WVJURzJqRE8vR3ErUWdkNUFiU2QyTlJwZS9RNEVKMU1CblF2VkIyOHkrSnVo?=
 =?utf-8?B?ZFdUWWxlbDZGeFI0N2EzU2Y1UGVDbWhVLzRPMi92WHdhTlFETFhnVlU0aHVq?=
 =?utf-8?B?UG9UcWpVTUdPNnJra29IbW5iV2F0OG5tS1J3WUg5NHgzM2g5cFZraUNqQUdU?=
 =?utf-8?B?Z1IzWW9xZ1g5YVNZSmQwNFA5bVlVYnVWWGYzTW14eEdpU3AwYU12cXhsM0tZ?=
 =?utf-8?B?ZlBYb2o2NEdEa2dPRXZKaDkrRC9wd0xhU2g4QlBUajh0dDQ3ZjhQVUdCTk5D?=
 =?utf-8?B?aDk0Nzg0NnZGbXhkR2ZaZG1ZRWZldC9sZnlXTFAzbzkvcWxadTBTUG9oRVpX?=
 =?utf-8?B?bGdKM3ZCeXpYenkwK2RHcVJFaldqL3JkYm9uUFRzS2hlOWRZdW01NmdLOXRZ?=
 =?utf-8?B?NnNkZTBteS9zSHNlaHp4RHRnem1USGZETi9KT3kxM3J1aTFCUGFEb3ZXS2sw?=
 =?utf-8?B?NmNra0x1MVdmN3RER0lZU2Y3ZWFMOGw5Tko2UWo3NEhLcTRFYStaT0FTMlB3?=
 =?utf-8?B?RHlvdkRMV0NHRDYxaXpBT2UvYUpCVnNBRkh2U1VUa3VZVURENlQrUkgwK0gz?=
 =?utf-8?B?NThFNUR1cnN0THp6V0RBMmdGK1NmeFVscXFOc3pTL0xnYWErWHVSallxUDdM?=
 =?utf-8?B?WktzNDVZZzRidk1vTHFiV1FuSG0yUEFXOVNEL2oxM3g1Smd2YUdFcEFpZUQ0?=
 =?utf-8?B?NEp1aUl3cmVxc01QbS9SZldQUk5TZllpQ0ZrdENtbHplelFSYy9tSmt6TzZJ?=
 =?utf-8?B?bzc1L1F5a2VDT1FBSjQ3aktpb0ZBV0tQMWM1QjQzNFlDdU1FeTJwWmRISUdP?=
 =?utf-8?B?OGZUM3RhRXd5OEJOeFE2NHJjSnlFV2dBbWQ5bXovUmoyUWVpYzVHU05TSHB3?=
 =?utf-8?B?TXA3RXJYeGxpQ3BaWmJIN3dKbXpnWlpWVzlvR3cvUmZia21EZFg1RW5Yck9Y?=
 =?utf-8?B?ejc4SVovTlpHS0dwc25DSlNDbjYzUS95bVFHRE5DbjRINzNoQmhWSmdqcVBK?=
 =?utf-8?B?cHM5K3doenpsS1U5b2pWSElPTG55SjBXNmV6TVk1UW85UXdmRmRiRDduMlk0?=
 =?utf-8?Q?T3gDBem9k1KwOjeRbS7BcA+J5jMbStHqXCW9l3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be43591f-f716-4a44-57b5-08d92a460bda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:24:18.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dd/QjAP3qwXqYIild3iPSysgjUqQ+3e8W603EghWhExSjXDLaASMtgkS+itwiY3yCwen4H7Fr1yX+SKZ1umzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 08.06.2021 01:44, Paul Leiber wrote:
> After more testing, I have come to the following conclusion: It seems that every time I do a _reboot_ from within a Windows DomU, the PCI device does not get attached to the DomU. After DomU reboot, it is immediately available for attachment in the Dom0 when I check for it with "xl pci-assignable-list", and I can reattach it to the DomU with "xl pci-attach" without any major problems beside some annoying side effects (e. g. need to reapply settings).

A well-known problem on ...

> xl info:
> 
> host                   : xxx
> release                : 4.19.0-14-amd64
> version                : #1 SMP Debian 4.19.171-2 (2021-01-30)
> machine                : x86_64
> nr_cpus                : 4
> max_cpu_id             : 3
> nr_nodes               : 1
> cores_per_socket       : 4
> threads_per_core       : 1
> cpu_mhz                : 1992.100
> hw_caps                : bfebfbff:77faf3ff:2c100800:00000121:0000000f:009c6fbf:00000000:00000100
> virt_caps              : hvm hvm_directio
> total_memory           : 32542
> free_memory            : 20836
> sharing_freed_memory   : 0
> sharing_used_memory    : 0
> outstanding_claims     : 0
> free_cpus              : 0
> xen_major              : 4
> xen_minor              : 11
> xen_extra              : .4
> xen_version            : 4.11.4

... this old Xen version, I believe. I don't recall when exactly it was
fixed (and I don't know at all whether the fix was backported), but
trying a recent version of Xen should get you past this. If a fully
maintained version is still affected, a backport could be requested.

Jan


