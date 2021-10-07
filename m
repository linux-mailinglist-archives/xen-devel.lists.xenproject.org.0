Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914BD424E92
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203375.358480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOPD-0005cY-5l; Thu, 07 Oct 2021 08:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203375.358480; Thu, 07 Oct 2021 08:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOPD-0005Zr-2N; Thu, 07 Oct 2021 08:05:31 +0000
Received: by outflank-mailman (input) for mailman id 203375;
 Thu, 07 Oct 2021 08:05:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYOPB-0005Zj-TM
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:05:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e113a91e-520d-484d-8674-83083dcd4866;
 Thu, 07 Oct 2021 08:05:29 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-J90HtK3SNHSaVj0kxlrLaw-3; Thu, 07 Oct 2021 10:05:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:05:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 08:05:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 7 Oct 2021 08:05:24 +0000
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
X-Inumbo-ID: e113a91e-520d-484d-8674-83083dcd4866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633593928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQildSs5R9Avr2U1TPosDlRvcDgGAd5+zSEEpLXIeks=;
	b=l18efNCgcwnzs1iT+qUkLetKT9UVlveea5ZgcE3RHp7iyTISphXMC5LL3DYjhJxmNyeCFJ
	XZzh3dwSOXPDlEcgoHO/cUmKbv/aSGC7NZoFgIUufRG/EAI3AJ4G+8lF/JRFFTrfyQ8FrZ
	ReD3OkjHOYD62XreCzIIZUzWe7Ew+Ow=
X-MC-Unique: J90HtK3SNHSaVj0kxlrLaw-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4+eusjb+iKn8zgxPn+MlpABP/YvcnlTKuQCdaFYx/bmqb4O8UGSopl2z8hEnJuefTwSqBDfqlqlGYcd1NMcvNOCnPE5nu5C/3WaWYsw6xwZNvvD0j/ZA9Cm1BEty5/0CBxebajDOEfbvz4mC4RzpWx/P4/WMmTqGutZTEg+ZVQo9n28r+gNAlatRVsy1ZhgXAZtaCleCcnnaJFn87OLBNx57T32HPqx76AfQNmXeJ7Ufyo9rplo+teE2niWQVPdRmSeZLnsrB8qMBC1l2buUB9OLdhCMHZ0H94Nud2J5VacPp3VgJNx6Q9iQBAPhayd85OhV8JhRPhbTEDOFM3ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQildSs5R9Avr2U1TPosDlRvcDgGAd5+zSEEpLXIeks=;
 b=Z1jPMDkj0ybPpBKB5vqE41UVqQhYR6R3r6Wjc8/XeATl+bbBw9EH1iTIf+HbXUZFFpYJ2FV/MdPuzdI64o4TJiJ/PnjFGzecDuAcjB2Ceo/FECvyCF4IdoUqwsdg5673jTFgA1HWJIBlFvLksZdUpFaWhuk9KoG/JLXbsZ1t/j8MVwUyZrAWcbiN6p/UbzdDR7uib2s2naPCX6FHPovXCwGawu6R/ZChgAIsTishSNXn5CQ9PoXKm7BYHK39Dgzk55x4dXwzp+SKQCFv09bwvTwu4+4VeMTIbhH76bKhaCK8daOq5RE7r495cTCQx8dsikorD8dzzJ0Tl3ie543HRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
To: Michal Orzel <michal.orzel@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-2-michal.orzel@arm.com>
 <6c97eefc-77a0-5e2d-92b1-6cb704a93e13@suse.com>
 <19a4b434-3cfc-e9db-80a1-1afb42c57fd5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9918ad74-e089-4df7-bd31-3440d1ffeca3@suse.com>
Date: Thu, 7 Oct 2021 10:05:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <19a4b434-3cfc-e9db-80a1-1afb42c57fd5@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0047.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbd6cb8f-473a-4b7c-68ef-08d9896937e5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743B213244195FDB5DB8D57B3B19@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fxVpLRdbkaQfGYLFAjqWisex9HMWzqK6onW4DojMYayYK8cdJJQvuOlgPJlCFwPPlymmSgi9aSkmnVz9ESI3hhe9ilZ7sJ2Jffsv44zjvSRH9pxwvysGB5lrDW/Ta89+yW4kWmloZzu4ZOKt8vyMozRisa5XyoqQ1X7IZCrvFJSk4vzrHx69IZpqxrbUdNVJNDUjM4Etyw/wzK6fPNFHC/nWP7K31ldyfPOsdH0vA3Df2Hd6qWubwpilCQ7XBmdXvbJ4q25EnEsmGn+PW7ROedjSXG1NJ/5Jygz0AvLyyec9z+Ot0VZ8+XTwOGG4B3uF1lNBmt90Fozp7jihygMBSvsNL3MKR6ZctdysBfBgnUyksrgoM0nFT3vKPEvFxd4U8kAFleW1Y3b3qfFipRwx0zt88giyJBwcQ4DRDRQlXYpgB1ptLKWIG/blXrNYdHSaxcixcRhMQYROrLX0LwPYlBc1g1JbjmaB0ykdjBsWUZ5c5ukfo42KS01zYy/hIb7hY6HbbE5ksHunH0wCnAFjLIUiVgnXcwnbF0G6GMHsGuj3lpRQAjXNcx/tgyN4ACK+oUzsTRVSoNBxw/CbaE8VY/527Sc8YBOB5CU1njXrfJHECXMfk7wS1ydKg3mOTHeJzrADSjly1vbNfCAjQY08kwCz7ByH3OVKkoi8XUia+SvSaUGD5aHwqPvQtcPqw//6Xz1AhB8OZo555/ZJhcFmglkGQRCxFHHdfGKdzQ5kLew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(31686004)(186003)(316002)(86362001)(508600001)(54906003)(66946007)(83380400001)(2616005)(7416002)(66556008)(38100700002)(66476007)(31696002)(16576012)(6916009)(6486002)(53546011)(2906002)(36756003)(8936002)(26005)(5660300002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBScUIwRWQ1WFdkbGNNQngzU3J4KzJ4V2p4blZzWGMrdXYyRWRYWWw1T0J2?=
 =?utf-8?B?SFpTK2Y4dEZEblVReTdrSitRLzNLNmIzejRSd3p1MGVLemM4OHdXTVU5TDdV?=
 =?utf-8?B?SXFxeG5IZXBVK01CVlhQZzczS2lXRk8vaFZJVnpzeXJiOWdvYnFSOVFsRGZk?=
 =?utf-8?B?Zm5jdUpucS9sdERWRnlMekJ4Q1ZXc0FGWUhuUE5jNVdMVUZvd1g0OWxMVGVw?=
 =?utf-8?B?VG5aRmoxM3lacmFoUHp2aGloS1pyUDJsVUd3a1ZobDdYb2R1Y1BtTHR5QUk4?=
 =?utf-8?B?WUtqUkx0MU5rR21ZWnppYmxqZ3N1dTZEbjA3citjR2RYWmJkVVplY1phT25T?=
 =?utf-8?B?ejBIUVlrYkRsYm04RCtRSDhadVcxOHovUy9pN0w1c01hdU12dzRaMTBjQlQx?=
 =?utf-8?B?Tm13TTYrNDVZSjF6SGExRG1XalJ6UXpTTEtNdjdjajk0eSsydUFwMVpEK0Qw?=
 =?utf-8?B?ZkM4b2hidnAyQWVHREpDdnNUZlVVb2wzWFFpMzFuRlpmVFdkVWVEU0pwSzJs?=
 =?utf-8?B?YUdUMHBZSzBubU1mWG5PczM1bHJpejFYODFEUTJxUzZqUWh2VGJyU3hKTERP?=
 =?utf-8?B?VkNYSkFhOGk3SHZPV1l3UDA5b1o2Q2FQQmJvQnRqNTNTT2JNbmtMSVVoendu?=
 =?utf-8?B?OG0rUFE1VXZLV0U3T1UzNHdwNVRzNVhrcjVIRlUxVnpKNXZIbnYrL2p6T2lj?=
 =?utf-8?B?SXUzcHJkakx1MU40SmxhZzIrTnAxQUhocTB6ZFJ5Vk5aR2c5QkltUXQzaWtX?=
 =?utf-8?B?K0RIVHNJV2EwaEptMnE5SEw1SlRzeGxNM21EVnpidnFZTndKS3BHRW1HNE9D?=
 =?utf-8?B?MkxXQWhsSkVoQTFmaWtxaWlFTXdIK1VFZjIxcXBXMEQ0b1Y0OGVBU2ovZGNh?=
 =?utf-8?B?N09jVjcyWmJvekxuUFljTFBESkNsNTl0QzhnTyt3c1JMT0ZtZDhFS044ZXIy?=
 =?utf-8?B?cjA2bnhGVmt4M2xpVWk2c1ZQZE9GdDNPZ284VUV0eGJQZTFWWElRWEo3c1Uw?=
 =?utf-8?B?UG5COU5VdVBmbTZlYmR1SjcwUTF0UTczc2NiRkI5RzNmeG56SXdMNmdOMFFy?=
 =?utf-8?B?TDRjTFlhOTJSVUZBU1BzcmdxOXBIOXhDOVREZHljK0x6Yy9HRFJWTkJPYTZI?=
 =?utf-8?B?WTErT3ZpMm5SYW5QMjBpaVNyeG5lUnJBMG1pZjV5a2VDR1EyU1A1S090V0dB?=
 =?utf-8?B?aFkrazAxSno2dHNvWG9rbiszcUNmdWIxdzJ0OGFEUytBNFVML1hKdEJ1dkFD?=
 =?utf-8?B?ZDA0R2d4SUVXZmlwY2drMEhPc0p1UTNRZzNFdm1jeXhPa3BRdCt0YklXVVJX?=
 =?utf-8?B?RktMKzhBcHRaOUd1VVZIRnBkVElEZDVPZDZPUkFuQkVUdlhxTCt2eFBxcHo0?=
 =?utf-8?B?SWlZd2pWUEpDTWw2SW9UUFVMaDBwRStCZFkzSVBJUkNkakl0TlZuS3RjcXdw?=
 =?utf-8?B?MHhubFh5cGhVbnFmSUorZGRGc0RiSkw1Qm05bVNZcUI1STJzU1pVYklDNG5v?=
 =?utf-8?B?VlJOLzRrMG5BR0l1cmo5MEp4bkRra0piMHROSlQyenFhWjg0d3UxWkxpb3pq?=
 =?utf-8?B?dkkyaTROWTBMN3FaOFJzdXRDdWJONzVxME5tQkw4dzhoaGRyRzB5ekMrd3Mx?=
 =?utf-8?B?R2t5T2JxbzEvUWx5dWNjeFpPamhncHhlZ2RaN2UwUE5qQjRzbHByQXFDU0Jx?=
 =?utf-8?B?OFhVTmZ0SGMrUnkyci9uc0tTemZFMjh2NTQrWGs0amQ1N0RkMzJRWXlvQmJ2?=
 =?utf-8?Q?wlMh4deLaRjwZTJe/sdDORQjLO6i4SkU7GQlSio?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd6cb8f-473a-4b7c-68ef-08d9896937e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:05:25.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj9P0YWd5P5OQM0Flu38sIir401M/G912bJKJ6auyYqWxI/V/iDaO7coufQOsXPO8O69qCJpZUvEJ5Oju3zokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 07.10.2021 10:02, Michal Orzel wrote:
> On 07.10.2021 09:59, Jan Beulich wrote:
>> On 06.10.2021 12:58, Michal Orzel wrote:
>>> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
>>> indicates whether the platform supports vPMU
>>> functionality. Modify Xen and tools accordingly.
>>>
>>> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
>>> definition in sysctl.h which wrongly uses (1<<6)
>>> instead of (1u<<6) and does not follow the standard
>>> of using separate macro for a flag field.
>>
>> While adding the u suffix is fine with me, iirc not introducing
>> _XEN_SYSCTL_PHYSCAP_vmtrace was a specific review request at the
>> time. I would similarly ask to avoid introduction of
>> _XEN_SYSCTL_PHYSCAP_vpmu here, for it not being consumed by
>> anything other than XEN_SYSCTL_PHYSCAP_vpmu's definition.
>>
> Ok I did not know that. I thought we should stick to the previous standard.
> Is this something that can be fixed on commit or should I send
> a v3 only for that?

You may want to wait for further review feedback first, especially on
the tools side. Considering adjustments to subsequent patches I would
think re-sending will ultimately be better.

Jan


