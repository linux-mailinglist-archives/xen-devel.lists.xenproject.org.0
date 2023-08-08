Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89533773A14
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579741.907839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLZT-0003QP-Rf; Tue, 08 Aug 2023 12:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579741.907839; Tue, 08 Aug 2023 12:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLZT-0003N4-Ou; Tue, 08 Aug 2023 12:12:19 +0000
Received: by outflank-mailman (input) for mailman id 579741;
 Tue, 08 Aug 2023 12:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTLZR-0003My-VD
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:12:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe16::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b5484d-35e4-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 14:12:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9246.eurprd04.prod.outlook.com (2603:10a6:102:2a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 12:12:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 12:12:14 +0000
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
X-Inumbo-ID: d0b5484d-35e4-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAw7OTb9LnBNeCD9K60MXEF/XieD3kyvM/vXEI/lu8NQ+K8VmNP82P0qXJ1wq+7mWNUwIP9G6aH+CR47huale44YndB5PzFm7pD1BSpV0cXNVZLLriPqg5/det7d8kmzZ/ji5f3pGedYGvhg830xMllORKVXbvuVXQDLsDEteAZOTXaUTf2WiEC4XAJ4OWhg9tr+CP9zXgRSwepRdeiFd9VaT0qGeeBHWIjMntJnYOzS425vqLCYg9NWDflFztwEYrMIdOoywEa8ghZAEHYSmxZrBw4RMr1cQ7d3TL0ma/ZmwjLqRVM+XSSbmgvn8ynRIBrYrE/8kNEv9mEya525lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDXJFUhU/mADNUjwLM0sVzaAQ/sTsGmRu5XwIKXxzJs=;
 b=a4CLkuaS43axHZcj1SyQpDbwAo8fdpaJJU1h1miTP5LwdzPL1adpbn9MkTcdCPBvJY+H/kRwzjHlR6P/iisaQk3DDlWX9jOviLx7pqK9Bf7dAT0Un/MFb0foStYyRGHqtZE/0RIyDxcdmLY3OVOEppFPQRlRQZpcK5Ip0rHQ0d8q0V+eTI+0BIzx/XDwRRC5w9eWAeHzbdlOiSjeM+YFd6yk5CJeVBB8ssnFzlENDEY5gVEiVE+y2H934yJOKymIjTNdWGMovipZQm12zhIBDA/flrqHAeOkU+ox4l4N5S2sSArBzp9itdX3dx/G/s/K8QDRQoZrrGU9k+2toAU2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDXJFUhU/mADNUjwLM0sVzaAQ/sTsGmRu5XwIKXxzJs=;
 b=FkHmhla452ZOjqYybjwON6n3FcZJ+Vp7c9DHKt+wLDTfbpNG1oEXbLQDfHZ7VXtAV6JZGMJMJ4oIP5mMVgNlpgyKh+5KZnnxnbEaUpMKwez3itSQcJwGbS893SjckM+JU7RSRJtLahJVWWYhV+Bfnd+aNwPkeynjNFpAlR3HldpsdsqLf9/Hbm1OixZmTqcbN+9fi/hgoP/KdR/W4PctLIODiY304G4ySMj27DFfxu6cmfoYt9D1xKK76hTKyEUOVmPq763AgBuau7ayP2uQ1rM24LE2qA2wut0/vfhGuyexycgP4cTV7l2I/ybQEHRKbeEhTVjOqKKD0ym6VuHRrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5649355-e441-0de0-0189-c7ec5863ede6@suse.com>
Date: Tue, 8 Aug 2023 14:12:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xen/IOMMU: Switch bool_t to bool
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>
References: <20230807165830.6719-1-andrew.cooper3@citrix.com>
 <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
 <b2551bf8-06de-c098-77e8-ed1a01ef6319@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2551bf8-06de-c098-77e8-ed1a01ef6319@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c24a097-6e9a-479b-ec32-08db9808b35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	62up28BMCp5CJ646YvRL2N3dhdJL6b2hWnQ3cZLEkUd/VBVIFJYZ0v7KV0vernDza342aynQljw2/+VMfR+qCzeXySMtLSEhspB0TSz0+dbicAnEfDULzlCw0H8MMF43g2oDkIOyS0h4FSelBnD0lCmMCa9HYsWxUXz/fP/tIZY/SRGd1+TltYsmhIJTKE9CHZAvsmBnlfYrDANws8UFZ4Bs+rSb2Me+XTq0JCEGfp8edopsNRjKOGhSFLgAX+iuXTVtvF19UvBN6FBVY8E0b/0GT+KSM5uWKWgAiG3U0siFpsDn17IRBOQpou0xAPyoqGTCMJh97kdlO/1iUq++GlUZOvJhM8a1X9CNpmHaVImashSKzT/hbt3JyMbLEFxo/FudWpQgQBxfgQhWddkgrU2aQQJE7FdwWul3askJsahx1GiYGmtXeQGDe2MayGjuLDkbadq4DvCGizGV+coU6w/eohbYZV3iqNYfVO94fAcFdlOPfyjZkbgtWFrVt/RrIC1SDpxiB7vaS+neUNkE4LkdWreOYEK+JoMM/GE99ztVDg+xyyNFj2xHy6azC+RtyySHcMfgSP8heBiHjHwKW1aG0MwRxPSO8VvYrRgtfjfkDlvxj9hJff+rPoZWXGzvIcAUmYAF2vag7Js/n0Npzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(1800799003)(186006)(451199021)(6512007)(26005)(6506007)(53546011)(66899021)(36756003)(54906003)(38100700002)(5660300002)(86362001)(2906002)(4326008)(66476007)(66946007)(8676002)(316002)(6916009)(66556008)(8936002)(41300700001)(31696002)(6666004)(6486002)(31686004)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmQ1d2Y5Z3hQZXdtWTdmajQrM3BQNDlKSjFWd1BwclhoMWVlWERua0hIWDha?=
 =?utf-8?B?NFA2eUt4VWtvZDVLSmVQbmFrVTdCc091Q1NDbEh3WU0xTlljaCtXandqamRB?=
 =?utf-8?B?TGlEUDZiclRQTEc1UGt5eS9HY3ZQMXpEQzB4M1k0eVkrZnhUR1dWN1NwMWZJ?=
 =?utf-8?B?WDRlVmYwRVJ5VlVJS01xWHlIUzhHOEN5TDBuTEZ2QklCVFNyNWtrNjlKM1U1?=
 =?utf-8?B?cDMzWS9NTmJWRkNRL1ZvSlhTNmdTTHBQaGxTaTFEQlA2NXZoNzdYZlMwaERt?=
 =?utf-8?B?UC9XMXJQalJZbGVWS2diTEJWbTQ3dE5jZ1ZhZjJmODgyOWk1Z1FqdWN1LzV5?=
 =?utf-8?B?Q3d4cnBKdmYrcjZpRXkyRnNseDBGYXlXYlNCUkF1Q2dFbXNZV0RXS3BNZnBN?=
 =?utf-8?B?OUhUeUJkd1ZBcTJWNkRPTEhTaVVVbHB4VkJSYjNnckpBa2M4K2Y1czZwMWRS?=
 =?utf-8?B?aFJrMHZ2S3laalh6Y0ZqazFjeEQ3aXlJWkNGWHpkb1lUTXV5TG1JTkNWTjgv?=
 =?utf-8?B?S0tPQmEwOE8yUFNCUFFIYmZxd1N6emw0Rnhtd3pNZHJQUDNaWUdGWTRvQTFN?=
 =?utf-8?B?WmdjbU5xaExxUUg4ZVU4dEoyS2ExZTFSSWJoei85NTNaNlk2MkZFUGxOOGdP?=
 =?utf-8?B?cXBYd1VNc1JmcnVaenV3QURqTS9KWjY2WmIyT3duVHpJeXovUmRod2RMSUlj?=
 =?utf-8?B?amNaQ2EyQW5yelppQnZkd1NLQUFzTUhFS2wwUFM2WXhtSnZxNFZpRG1taEIr?=
 =?utf-8?B?c09QVjVKWk96b0Q3TjhhZzFaRkdXZDR2QVp5dFN3RXhNMXBNWW9NbWR0Rk9J?=
 =?utf-8?B?ZEF3bUwyS2YxZU93Nmd1ZHVRdXJnTW1qVW1DWFNNVlZFV3dXQ1RyWHNFRDd4?=
 =?utf-8?B?Y0IzeUpzaXJQbzJ6OGI5OEZVeEthVEtMOTB2bWdMYlhJRXd1b2o3aU9WbllD?=
 =?utf-8?B?VE9Vb0hyT1NXa1VONGphOHBDQTNVSWtzMXlIM1M0MVJyWVUva0NYSXFSeDN2?=
 =?utf-8?B?OHV0OFZpTlR6YnV4bXVQK3NIU3dlOURkNTdwaGU1K0E1M09BRGxRaTc1SG9L?=
 =?utf-8?B?Q25DcUY0bmdVTXg4eWNyekZPNEpLcW9oc3pFMC9EaGpmNWEvM2ZhMWszQ1RN?=
 =?utf-8?B?aWlST2JqeExBRVRNYXlQdlpKVWw2Y3o3aGN4ZVg4L0JhbUt5V0pwckFmNlhp?=
 =?utf-8?B?Sys1WlhvcDNpSjNrMnU5RW1yNFRjMGZGb0hLSE9WcTA4MlNwRm9ucElDblJp?=
 =?utf-8?B?cUtlbVRZSWRORlp3SXpaYjB5YWRZVllnNmtEaXI5NFFvMHpzU0pnU1paMGVI?=
 =?utf-8?B?YkIvT2JKa29HUk5lU0pacmw1a3JaK1kxMjJrakJSamdJeW1vbzdvaUxTVVRB?=
 =?utf-8?B?L2xQV3pkOVM0WDRnL3I5WVJOb24raUJya05RN29xa0tTVm83dnFjWHk4cDlO?=
 =?utf-8?B?RlQvaFA0WE92QUdSUFBSUFVmSlY1NjBaMFNUMDNSRWlJK21OajNwcTQwVVZU?=
 =?utf-8?B?NnFrNWxJNWZqLzhmTWx3anc2SlIrTmNSWjFNWnVBcFhhaWF1cGt5YVIvbm9K?=
 =?utf-8?B?eUhpajdBdzQ4Ky81azRmcnZsbGJEblpReXZGQ1JkcUNBNHRneTdVWDBhMnl2?=
 =?utf-8?B?TzR2d211aGoxZDBnZkJlQnEzZWJsZi8vSlM3VnkxeEtEc05VdWprNWJGM0Nz?=
 =?utf-8?B?a29iQXhhQ1krbitMYTc4RUFBanZiRHJaRjk3aUVkOEtlOXF6RElHcExqcjVx?=
 =?utf-8?B?bWlWWEtPemlJMXJCRzlUT0ttN3hBSjN1ay92dzRVYkRyYkdkUExrRmNhNE93?=
 =?utf-8?B?NHFhbVBaMHBzc1Y2MTJCcWVHTStBRkRodC9FMWx4bE5xUFlRVU1CSWtZbW5L?=
 =?utf-8?B?ZjM4U3A4NTVUR3FPN2xBaDQwckFBaFhrQkpKR3RIck95RldkenpaY0Z3aHMz?=
 =?utf-8?B?QnQ5bkRvdWh0RjA2aVRJVnZMWVdrMHAyKzdYVzROZnN6THc3ZjNNQktFbDdJ?=
 =?utf-8?B?cFRVODRQV0FmTDFzdFpRdkV3aEJ1MnU5a2NMZE9DeU5lRmhrZTFOaXdDU0N1?=
 =?utf-8?B?NWNZd0N0MU5oMFczQlZkanNSTnl5aVFDNmNPbjV6M1NXTUp3cjZMa0JTbSth?=
 =?utf-8?Q?aRSNhvOie3h1qq7eG8EowjgOs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c24a097-6e9a-479b-ec32-08db9808b35b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 12:12:14.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfIasFnb4WNoQafjEXymlIlpnZ+j23nKUTOI5h3Eadd1FWpMjnBkRs+FsNp6IEhjg4ny87v1/r0TFxKGuMlW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9246

On 08.08.2023 14:06, Andrew Cooper wrote:
> On 08/08/2023 8:54 am, Jan Beulich wrote:
>> On 07.08.2023 18:58, Andrew Cooper wrote:
>>> ... as part of cleaning up the types used.  Minor style cleanup on some
>>> altered lines.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>  xen/drivers/passthrough/amd/iommu.h         |  4 ++--
>>>  xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
>>>  xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
>>>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
>>>  xen/drivers/passthrough/ats.c               |  2 +-
>>>  xen/drivers/passthrough/ats.h               |  2 +-
>>>  xen/drivers/passthrough/device_tree.c       |  4 ++--
>> This will want a DEVICE TREE ack; Cc-ing respective maintainers here
>> (and therefore preserving full context).
>>
>>>  xen/drivers/passthrough/iommu.c             |  8 ++++----
>>>  xen/drivers/passthrough/pci.c               | 16 ++++++++--------
>> For these and ats.? you would also have wanted to Cc Paul.
> 
> This very much qualifies as tree-wide.

Certainly. Question is what follows from this. In Prague we discussed
whether to weaken the required-acks model, and if I'm not mistaken we
said we'd first try whether we can't really get chasing acks to work
(i.e. for people to respond in a timely fashion, ideally not really
requiring any "chasing").

That said, it certainly remains up to you whether to wait of whether
to commit. Yet even if already at submission time you know you're not
going to wait, I think relevant maintainers should still be Cc-ed.

> In fact, it was the only decently-sized chunk I could pull out of the
> pair of patches, one for common and one for x86.

Right, and I was actually (positively) surprised you sent a smaller
granularity patch here.

Jan

