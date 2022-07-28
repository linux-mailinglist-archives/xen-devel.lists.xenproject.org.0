Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606F583880
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 08:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376602.609477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwla-0005So-Eu; Thu, 28 Jul 2022 06:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376602.609477; Thu, 28 Jul 2022 06:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwla-0005R0-C3; Thu, 28 Jul 2022 06:13:02 +0000
Received: by outflank-mailman (input) for mailman id 376602;
 Thu, 28 Jul 2022 06:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGwlY-0005Qu-JZ
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 06:13:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541b254a-0e3c-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 08:12:59 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8697.eurprd04.prod.outlook.com (2603:10a6:20b:43c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 06:12:57 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 06:12:57 +0000
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
X-Inumbo-ID: 541b254a-0e3c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/QgJEYr8EsTlhLze2ApEbO0ZMevwFBZoYV6rCnM2G8Al+j0gAayo/UCHTG9XtElurSuh1oQCsPXX5uEvIlhsforlynGlbEHrWsOA/fsSq8g51u9AUIKtsj+toyTQR7SRrdKKQ7yxFWacTyMjadGaz5DQQp/8gi4ZTAABxsL0hLvPTzQUJpXYEBt8gVcgESVrwxveAJPSbxhwk1kOIV6WaqNlTsiuJ81BoHFmtQlncXUJ0H8hmRhF40zZ/9qU2ZBj45tvYQJeAjMyAWjau1k3h0LhjoosT0Awa7BnKfHEpxOHGOjGSmemVOr6wDRoz2yq8+7cQonsECOFChvADMXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEtgO99dbcglkKouCHuwMDT3wwTwuScGtyOxb3zIuPU=;
 b=aHnheZj71Z6lsuJRaJhM0dRZs6CWCFZo9Ra6QvcTggd6gMm36IizmpnWjdp7Bavto1le49vhBUx/BWJgD/bI2RgasA2wNqBedfL05Wl5Zk6wtjJ8X4nQxsZ05wna0WzqY4T16GG2uzZT5vXBMV0ALLWDNgbe3xvdx7ha+hGU3zcGYhhCEj/tPsVbB/B4/bSFM8T6c4jlyYYtEVb1NeN6NZ5jrJ+9Y88+mm7PZjgF1L/qkiyga90AN1avHh3FD1H9vmYQSAkst2O+hMWVAoreI5wqY95y6QdFQUHViHOS7+K0usgU9/3i+2Mskf3J5yiAtyuSj2usMFh3pUpd/IQyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEtgO99dbcglkKouCHuwMDT3wwTwuScGtyOxb3zIuPU=;
 b=Co7A0zVpDitackqq1oa1fcF5vvC6aGF1NHDTTPHLMe2+7J2jtkaO+FP4SDEVOa+S64B1rJcB5Y9LqsjjWn4CyjuCydcnowPBuybCwSEvdDO1b5Vq7axI0OkXm/t/pcSgsrcUjUXll/nU++zUxKIyWEnCtqFLfpGJ6RVkC8zLUd1wJxQ5lXp/1jYSJFJsBQ1nZ5sKDt2YcYu3D+s+3WHiPbh9rwEOozeLXcvpfcZVat/uh6ckIpaO14eClKbQTtWoB3jiru0J1uxf4MOoqeuEr/2VJInM7UBrallL3AwrOOB14YQs1zS1R9f12pSKa2OYtzyTEECEMsBshkYpubOxHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <634c9f20-0a0a-fa8d-7b22-04791dc90a8c@suse.com>
Date: Thu, 28 Jul 2022 08:12:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
 <6c5b5339-f645-4214-bc53-2b7ead004367@citrix.com>
 <f803480d-4c31-1465-4aa7-c8f0bdc11c4c@suse.com>
 <df94aba5-59bd-7fd8-a9e9-6d4d25653081@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df94aba5-59bd-7fd8-a9e9-6d4d25653081@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a6c37a9-74c1-4d7b-de2d-08da70603703
X-MS-TrafficTypeDiagnostic: AM9PR04MB8697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UICoo9A5Py6XZafMyLdil75h8D5m8Jpm7xAe4iRAS0RCn1OaAr+VDKncDPu+LIyZ+Z0OvB5VlBajFbobM6owe2cLBT+UQq1XsluO71ATs3yYvOGQY5OpKlZxpnZGaWIDip4sr5OSK3SyT79Q5t7MNbSbvnaD/BXDdRa6J24ogB++furJXTYSQgqaNb2iIUD8upn/Q0/j4Bofm5dXcaLWUJCBXG30nOoxv3madY+Z6AZz/qFtfYB1SRUWMh5AXzgBxixS43DbOVsbVgCDCn+z0K7QoGblDwX1Q+wMeIYu2pSu/w80gr4pFV2zOaaBr/gLKCzB6J8Fq4kOR3GTY4vyh+xXyu5YTjenBJsClCSwT/2sSRnnnUF0DNbayAxoiWxJ4B8AB2TiPhwapP0M3xbuU/HDc3jMnZnJ0owuEWeDiJhmSv0Ivc7YSifjXaWaNzdPhYA619590yvw0XQlJHsK94f5AcgeHNkKT+uASlzGVc5oEIOsjzwmgb8FPH/pTreRXnQYRyWVGNXOCpZQ/92XAUqa8TIs3OA0crj4NNkUxXZf0qFdhz/4wqmCcQkP1Lv+fq1kzkfPhJBNBANY5+r93Dh2A9fuoMSPDnD8iI3ctYt3rgro52DuXMpKpeX/YMLn6WZz3nUjER4O3dxYDDPAQw11N9+/nIPm+T95PdKieVNxzUX8phuCYOSFUUxQInlawO2R5XAIuLN8qtNqWsfeYN0IKGmIYMnnFUyqjCrjDXrFH9J4+o2GCjwpdAV2q+HHtA0YAx2bUwobkhpncYodt3wG0ZYLKYJUNZk34WNQ0sT5QGebfTYwNZegM0ekQJzordhfd2iQEFI5bUj5zRGaGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(39860400002)(136003)(86362001)(2616005)(6486002)(6506007)(6512007)(26005)(53546011)(38100700002)(31696002)(478600001)(5660300002)(83380400001)(41300700001)(36756003)(8676002)(316002)(8936002)(186003)(6916009)(54906003)(66946007)(31686004)(66556008)(66476007)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1NKanpMQkl6eTJOZHBaaDJjNk13d3JXTk9JQWIzWG1WNjFDMnpWanpBRHZt?=
 =?utf-8?B?SGx3NDFLc21XZjNWMVpXek5qbWZOL3kwOTBZcDZzK0trNUEvSEtNd3ZvaHph?=
 =?utf-8?B?RitSQ3BuWXpPOXQvelZwbWJwRmN1T1NtZUNESzVqc3J3RkdlenZRK3d3U0Nn?=
 =?utf-8?B?Z0tqOC9oejA0eHpZbG9LMUxRcFQ0TyttdjNiZUIrSlk5TlpHWDhGZjJzNXoy?=
 =?utf-8?B?UFRobXp0cDdZSDBwYkRLZUgxYy9rVEw5ODdqelZ4bXovTVZLeExST2VBRzZE?=
 =?utf-8?B?ZjhiaHVnTHpSVTlTaUx2OGUyL01mMGFld3R5Y1RHWHUwcGFuNE8rV1BsamUv?=
 =?utf-8?B?NUpYWG9UcTE3UHRXZlIxTVZLVllFNWdvWFNkNUxidUdLY3cyRjgrSk9hZjBt?=
 =?utf-8?B?dHpQdE1iOUNhOGkvdGkrNW5BTHE3bnVQdWM2djZGMnFyRFJiemhsOXIyL3VF?=
 =?utf-8?B?MjNOYTNBM08yRGJnUGlvYy93SmZWakRKUjltbTJ2c0l1bC9Scjhwcnk0RFV0?=
 =?utf-8?B?L3QwbUl5RG5xQTBHUkRKRXQvSllMQ0hIZkkyWFdZd2xZZU9tYUJQNDdmWGVy?=
 =?utf-8?B?U1pBTEx4bDBnam5jYnBVcHNTdmd1eHF4bVB4TmpZQjZSMytlQnp1N3RyZjl1?=
 =?utf-8?B?ZmE1YVVPWGgzNXlueWo0UFJkNnMxVFdyWndjSDFhczYrWVJJKzBhWGpudW45?=
 =?utf-8?B?MjY5dTVvZlVYbmFQZHZ1aGtXS0RrYVUrRG9hdmlSWVlMQlI3U1hSYkJUbklE?=
 =?utf-8?B?dWR0SnhzRVI1bldZZjlRRms1djNxRkI3UUV6WUZUNk1QQXViNnpRNVV4VEli?=
 =?utf-8?B?ejM4VUFoNUlLNXM5V3lTVjJCM3A0aGdnM29uRVorTkZDN1VWU1RpZk5OMWI0?=
 =?utf-8?B?cHViU2ZBazdEM1JZTVlhUDdiVlQ5am1hSThDUndrRFdWRGc5dFVIbVQwNnQz?=
 =?utf-8?B?Uk42US9TMVpSTGlTZkxBd0ZCeGwwS1cwSDBUTGZibit2WVhvV0hLTkpnK0Vt?=
 =?utf-8?B?bG5MSlVUMHlYcGF3NkxyWFphQXp5SVRRcHFkL0pqMU9tUmNUb3NrQmxqdjRW?=
 =?utf-8?B?ZGhoZ2sxR0JkSGtrNXJBZGhHZEtBcC9idlY5SzJJV0hMakNidzJDRWlpZDly?=
 =?utf-8?B?TkZVOFcrTm5JMzZZcWhhUEthcjJpYnNObU83NFJIcDFzTDRvYVIwUGpEYWJj?=
 =?utf-8?B?bURLSjNwdnJ1Rm90dTdCQ3I3MEwzTmU0ZGU0LzJ6YXhJbDN1Q0I4QXNhY2Ja?=
 =?utf-8?B?NUpLN0prenEzYnZZOUNlRzJVZWRuWlU2MERSY0ovSDdDZzdPTkt2SnJHTFBV?=
 =?utf-8?B?c3R6alMveGozOVBYWGUyQ1FFd1E4Wi9OcTdZZFl5aTBlN3BLK3lzMzJBYmFP?=
 =?utf-8?B?MTducnlaZHE5bXk2Szhmc0JGbDhzK0JsdkRrcW03MGYwbzk0N2NkTjhkOFJL?=
 =?utf-8?B?RG1CUjVDMGtnVWhpRDRXUUhxcEV0N0tvWDhPaXhDUXk5c2p5STNobVp6aFBM?=
 =?utf-8?B?aU1PYUdTQmZIV0VmU1lCMThQV0lLNHE3VHBIV2JjYUZjQ0wwazFaOXpzNy80?=
 =?utf-8?B?RHc2d1lCQ2Ztd1hYOUtsanlyYW05U1VObjY0T21PdDZrdEY3YnBLcTZjalJD?=
 =?utf-8?B?Qm9mS3pUcWd4NXhpbStNNXpCclhzSTdaaHNtZFFPZnpqYm5DTlNmMlJ5ODU0?=
 =?utf-8?B?cWM0SEdCb1lBTkFSNE1KRVVqckVYNGtTeW9mZUJLRU4wV2hwaGYrWE9ZWmxI?=
 =?utf-8?B?UDlzOGZFcE5JMllla1ZWb1gxRWpuOU1YQjNBb2RQNllrRnBjYmk4QVFoRUo4?=
 =?utf-8?B?OGNMUjJncGFobTdLbWF1dmF6eEpHS1RFNTBvajROckJQejNvQXV6N2p5K2R3?=
 =?utf-8?B?T2N1a3RDWG91K3U1eHRzNjBWVGhScjQ3RGZhcmxlOEIxNDF2MERveHJzd01G?=
 =?utf-8?B?NHRlTlBBREh4dlMwZmJ2cXo0N290ZlpGWTlFM3kzMnF6NDhCTlZMZnFha1dk?=
 =?utf-8?B?cmNLR1ZFTjJMQTZRQW1MT0pyZklaNmsyNzRNTDFsemYyOC9wUW9KY04vZSs2?=
 =?utf-8?B?NkRma2pzdWtBd21Taml1RUFMQkJmNFhJSU1xOUM4S0o0d0JkQXdMWU51ZW9q?=
 =?utf-8?Q?AMYeGfSY+quTG5uAQLvNLqFuK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6c37a9-74c1-4d7b-de2d-08da70603703
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 06:12:56.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZkv+7y41oPeMbRF+p3VeeleKeHZXc4tLqNrYsBwwtQm7ZWJXxnSUuwW2OF04ykUq47ENOQW9//TQ7Sl8mzTdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8697

On 27.07.2022 21:06, Andrew Cooper wrote:
> On 27/07/2022 13:53, Jan Beulich wrote:
>> On 27.07.2022 14:46, Andrew Cooper wrote:
>>> On 26/07/2022 17:04, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>>> @@ -132,7 +132,8 @@ delete_fl1_shadow_status(struct domain *
>>>>      SHADOW_PRINTK("gfn=%"SH_PRI_gfn", type=%08x, smfn=%"PRI_mfn"\n",
>>>>                     gfn_x(gfn), SH_type_fl1_shadow, mfn_x(smfn));
>>>>      ASSERT(mfn_to_page(smfn)->u.sh.head);
>>>> -    shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn);
>>>> +    if ( !shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn) )
>>>> +        ASSERT_UNREACHABLE();
>>> I'd recommend crashing the domain here too.  I know the we've already
>>> got the return value we want, but this represents corruption in the
>>> shadow pagetable metadata, and I highly doubt it is safe to let the
>>> guest continue to execute in such circumstances.
>> I'm happy to add or convert, but please clarify: DYM in addition to
>> the assertion or in place of it?
> 
> Erm pass.
> 
> We still don't have a sensible construct for ASSERT_OR_DOMAIN_CRASH(),
> or a well-thought-through piece of guidance.
> 
> Probably keep the ASSERT() ?  Almost all state checking in the shadow
> code is via asserts.

Meanwhile I was actually leaning towards dropping the assertion. The
goal is to catch attention when things go wrong. A suddenly dying
domain surely ought to be as noticable as an assertion triggering.

> Mostly what I'm concerned by is it feeling weird to have one path which
> only domain crashes, and one path which only asserts.

I'm afraid I've not been successful in determining which other path it
is you're referring to. If I knew, I might be up for converting that
as well (not in this same patch, perhaps). I don't think you mean
set_shadow_status(), since there we can't validly ASSERT(), as the
condition is (in principle) guest controllable.

Jan

