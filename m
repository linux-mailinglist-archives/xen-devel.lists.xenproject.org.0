Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D93BB87B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149849.277156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JTu-0007UR-3P; Mon, 05 Jul 2021 07:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149849.277156; Mon, 05 Jul 2021 07:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JTu-0007Sc-05; Mon, 05 Jul 2021 07:57:30 +0000
Received: by outflank-mailman (input) for mailman id 149849;
 Mon, 05 Jul 2021 07:57:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0JTs-0007SW-Ld
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:57:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f6fd98c-e388-48de-bcd3-23975511afbe;
 Mon, 05 Jul 2021 07:57:27 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-WhUkcdjWPrCmmsqHuORxBw-1; Mon, 05 Jul 2021 09:57:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 07:57:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 07:57:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 07:57:23 +0000
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
X-Inumbo-ID: 4f6fd98c-e388-48de-bcd3-23975511afbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625471846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDakExeGU87B0Ei+ei/sjyL0MKjhCwbbAD1XFe3zn7o=;
	b=Oh/9cwlA60s5WIzqO0HjuspXGpV2gXDOMCf36Rj5krzvyyv17czxKufG/9/XfvI6ZPK4zi
	LJyEpFRyUpq9OsKxEcSYkNOJy2yT//glT6E7E5lki+79p29tD/unnqtrKM5si1cTEKDpiZ
	mNFldAzfxKrNRpPZgWCeQJXMeicjRjY=
X-MC-Unique: WhUkcdjWPrCmmsqHuORxBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2mfF9NRTqm8qMt/aDU8xdS0rYprOLo+idq0pjAZUTvKlkP2ONNranpuEcrObJdco1yFdE/K9xcwE1Z6GclHytF8ttendTQ8+Y7HHaj7oVs6cqtobGKoHCbws2n9yyYXl2akEJtIdy2FmTow2IfWSlMCdkovgdhvRq7RyAzzfYQO199wjOWUEoQC1f9pZOy5uCuydH1//s9FW4XTtPJOnT3RRzkylX41YU+kSxmX4iwiNsQICfU5VkEiXUAzj8j4tf6PuyntojCU0pTppW6GM9u8Zw30svjPNN7z242imgP89LaPfIFK7+Fpdvu92s4ZRuXnWh5t+8gjYH3oP6d49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDakExeGU87B0Ei+ei/sjyL0MKjhCwbbAD1XFe3zn7o=;
 b=W0hkntrt2Czsj8Z/hodmvxJK3ZeOLw5Ay57lcqmykKOrZZgoZxpZmlRCzLfr0O8RwStKVDfK8IG5uxHzHB9or65zIlZtjX4214iqrlh09IVfO4T250gOW46ZL7YumyeRCHgzlPhV0TSuE/pI1z4UgAmxwxKikayGRqB2nGMRpLWwPYt2VcLIDWZlcP6wgMi6VpqvZ7ff6LNe9hT/JTu+1BnBB01/aWiWbC/WgnaRuj5R4YSY1YW+X0RKPtNTw/Jl+bfWDNXYLfiFtu3zjuKMGzIzua3f3hN9DQWFBT35JmrUuSDQRRYLosdWspseTS/cLMQGFHsvCE4qiJjPmkRvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Olaf Hering <olaf@aepfle.de>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06968742-355f-ad37-0681-e51eea256414@suse.com>
Date: Mon, 5 Jul 2021 09:57:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702190342.31319-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8cc0c70-e2a0-4607-1fbe-08d93f8a85e5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445C866DF92B8BEEAEAA756B31C9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m67B1s4LOZ18c52XINyM5OqW/NrQ9UNSFA6cNXoAPWuC1bYfOpAdU6GEXqNzZP3FlIzKPlEaERSlo3m1rD6rcaCAPgydXvTNW39SBbjcKtgktdMgzRujGvotujhCVSER92rGKCevaTaOXbcUr/P8aekAgeedJBNSng+QiUNhDUOiPx25ltnCC5N6lcMM5boYPtwhJKwJn5qSG/+ysZT367oCM1eO4gGOc39WoQ7d6mnexQbIA6+ov2dfTitrvyvXxH43IsJSpP/xxPgaarrq9UIKY3WH7f+Ta+LZay+giudmmOnnE1xCC2PTwghY1f3La5hVab9INoGQzxzi6xcpgEm/bAdo344A6hVgMkxPLZvuPP/dRzY5AZxxhq0JlCTblE/IBSrAP8r3H5vRdeX3OeX7peAIIUypiocHWRV7sXrZccH3bJ75IdsYYuvTF4InChhYy/rg6T6PQeaGLtYz8YkR4H9kZC7D/bodODpX/rzY/xWxEd4PGrW9kMm2TL3hE15xl+T8vHp8gxDbZgyM71cz2Oe4KxJi6urzDUvAOickZ5kXHHBON/LjSw7PW9MlOl1cI4heR8MHKw+KqZ7jbm5+JI1QpvHiYxAPNbTGbKvX+hujpjOvNIkDskn/VTi2w+SpvJDxMFxujxoViCOgfrauFtbWy3GI1+//tFrKOR+dx8JJ3fpgrF6lnI5hU8sE1urkZRNOQpK1bpIhCI7Mu2EuYxg8i1XqGNQY/wejKeGgCl6dMy+ZphLoWOf2mq6q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(366004)(39850400004)(38100700002)(956004)(31696002)(2616005)(16576012)(2906002)(16526019)(54906003)(4326008)(186003)(316002)(6916009)(478600001)(36756003)(66946007)(66476007)(66556008)(8936002)(31686004)(26005)(8676002)(6486002)(86362001)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REZ4NUt4SERDSDY0c0hjOFg1bUxQT1htSEtEUGF3MFlYOHc1enhWTXRyaHNs?=
 =?utf-8?B?aDI2c1E5ZENINEIzZUE0VmptamVIdlVIdkFZWExwbXIwMTJsTFV6RlBrc0dD?=
 =?utf-8?B?QVdYdndLb0ZodlFKaFhzYmZuTW03MHUrTHJnWDVieWVLT2pKN3JKZlExMExa?=
 =?utf-8?B?N2tMZ01GME5kbjNZS0tmcVFSVjBHWmR2VUVSZ3h1aEhndzYvMkZza3NxQXdw?=
 =?utf-8?B?UTY1TGlXWWRaUWFaNC9CQ2NrbW53VWt3cFFrZHU5YXE0VEhQVGJXV3ZzdFZl?=
 =?utf-8?B?THhwZlVUQ2xQS1ljakhUejJvTnpid1RMYW50QVlIbzJrNmt6Z3VockZBN2hv?=
 =?utf-8?B?dDN5NWk0VVAxU2NrbFBtTzhxY0hTd090V3JEL3pSOXBlYk1EWCtUWlRGOWRT?=
 =?utf-8?B?RmtFMU94VXpqeWc5ZzZSUnNSWFNqekZYVGJmQ29DeWt5Z1RzdUFFalhvOXNw?=
 =?utf-8?B?Q21wc2hPRUdyTm9GcXlxelR0OWYwamU3ZWR0MmNWVUZBMzVQM2FtUllsc3Zl?=
 =?utf-8?B?NHNzdndyQk1WT1FCY0hvVmJYd3RTMnpYRVo4eWVvdm80K29TaGhoSDU5cTNw?=
 =?utf-8?B?NXZmdml2ZzNVMjVFRWR3eExPSGM3WXNiK2VIUExlMjhyL3lMNXVXWmpJOWF4?=
 =?utf-8?B?U2FxaFFGL2RhemFvdllzc3puQ2dkRnZUL0RCd2JENlJMNS8rbE9iZ21oenhU?=
 =?utf-8?B?VVE1NmdvektzREh1R0h0ZWR5cUxLdVFTR1J5R0dhemY5azR5bDkvMXVJZy8w?=
 =?utf-8?B?Wit5S2pER004aXNhbkRJNHJJVXg5LzBNMzkyY3VoWlFWRWV0S3NSWC9DQ2s1?=
 =?utf-8?B?cFBRV0VVSnF1ZjlraE9rQ3o5M0xpcktObXcrbWtYZExFOTlVYzFQUVMwUTBS?=
 =?utf-8?B?WXVtNVFBaHZBRllxOXRlRHJDMG5ubUF5OEhFa1dzQkxqVmwzRzJ6VzRGTkJU?=
 =?utf-8?B?MGFuM0QwRkN2bUd1Y3cvbHhMY2dqQUdrRFgyL1lPN1VyVGZrT2FGZXZESC9C?=
 =?utf-8?B?WkxtMGlSOWtXM0RCVU5pNHlJWmh4N0ZaL0VUMWFJWUYyZExjbkxCMVJ1S2dE?=
 =?utf-8?B?K3RZREpVeSs1ZTBZUzZvNkswQW5GV3dHQldENnRDa0MvbjNzckd0bUt2bU5G?=
 =?utf-8?B?SGhPT2daZUNISnBWRkRKNTF5eDJkU1lpbWlKZ0NpMmQvaWRnVGlYWm1hWlhp?=
 =?utf-8?B?VHRFeFN5VG1uVVBuOXZOUVU5b3pCZ2dIUHM3N2VYTldiaGxGRnB6VEd2MmZi?=
 =?utf-8?B?MDlEcEpmbUU4c1BITlZCUlFQNVdXeUtpUzl0YURLWnJ2MENDWUxOUVBKZ2lU?=
 =?utf-8?B?TlpzTVBIcXZXYVlmTFRKdGFQTGsvbzhhS2JKOUxiS3BnVDE3ci9UWmlZbWdx?=
 =?utf-8?B?ZVhKeHpWR1UxeFdja0tST1JxR1hSbkpVNnAwMTBSVHBXYW05enBCZ3JVRm5J?=
 =?utf-8?B?TThRelVIWnZWdmxmT1VWRW9oVVpDUlJnT3R2aGdXZEl5elZIOXVQM0JET3cx?=
 =?utf-8?B?dXJBNVJBNXB2Snd4TytnalhzTHl3UGI4Z2xmZjY1eldldG8xQ2lqR0pPZlgy?=
 =?utf-8?B?MW9MQmJkZmQ0RlMreHAxSHhpNTZLSHJYdURNYlFXMENTOVVxRlNXRzhMQ0dT?=
 =?utf-8?B?N0ZvN2JMNFdCMGJROVg2SmZ5WlpudEQwcWQyVWl3dVd4WmpiMzBtRURMUnR3?=
 =?utf-8?B?WFJIVWIxTHR4ZktkcHE3WVNjSTRBS2dIUGtSazh4Ri95NVorcUF3UGpKcG9B?=
 =?utf-8?Q?X4gBvIjWbqFuqgCVk/XMCmJ54U0E0JNl6bL46zf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cc0c70-e2a0-4607-1fbe-08d93f8a85e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 07:57:23.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcVVI/OFWkVs4NqRQ3GvZPp8LCxKbfwAK3gHL4Gayzr8C8I80uMHRQwLDd/k0BZdISkXSS7ynHI6sTNzfsYlcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 02.07.2021 21:03, Andrew Cooper wrote:
> The code has gone through many refactors, but the first refactor was the one
> which broke it by inverting the check with respect to checkpointed streams.
> 
> Fixes: 7449fb36c6c8 ("migration/save: pass checkpointed_stream from libxl to libxc")
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Olaf Hering <olaf@aepfle.de>
> 
> `xl migrate --debug` might not be perfect, but this at least brings it back to
> mostly working.
> 
> I don't think dropping it is a sensible move.  In particular, it is invaluable
> for testing the logdirty infrastructure when migrating a memtest VM.
> 
> If anyone has a clever idea to fix the grant problem, then we can.  It is
> after all a debug option, without any specific prescribed behaviour.

What is "the grant problem" referring to here? Neither anything above
nor the offending original commit has any reference to grants, or a
problem with them.

Jan


