Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0070940D471
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188233.337321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmhO-0003xL-Hf; Thu, 16 Sep 2021 08:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188233.337321; Thu, 16 Sep 2021 08:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmhO-0003uh-EX; Thu, 16 Sep 2021 08:24:50 +0000
Received: by outflank-mailman (input) for mailman id 188233;
 Thu, 16 Sep 2021 08:24:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQmhM-0003ub-OC
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:24:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d70720-e747-44c5-8259-dd580893b04a;
 Thu, 16 Sep 2021 08:24:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-pA3oyOJwOYWx89Xfs81eIA-1; Thu, 16 Sep 2021 10:24:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 16 Sep
 2021 08:24:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:24:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 08:24:41 +0000
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
X-Inumbo-ID: 62d70720-e747-44c5-8259-dd580893b04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631780686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CuAQst5osSHV9vAPMHejBIJ2CncxLvl9tAt+Nr/ovEs=;
	b=Xo8BAWL+uFjfn/kczx3QWV5APfd/sUp51Snor6l6S7+phjbgr76hY9leieRLaDFg+ZeTOB
	AyLxENp3Uk4oYe+S+sb6fgL9XxSlcy5uXLCd1qquAkfplY7+N3hgi1nMiWX5jZeH0scf2A
	N0gtEuTJbVtTkWMyT1P4NHh2p0o6OFc=
X-MC-Unique: pA3oyOJwOYWx89Xfs81eIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFN8pbiKvMVel5LDbu0uIsfvxnVUEci7KNAgy48ouRa8WpF555ualDBvPlsCCScEMlfB+Rp7o2UkJ94dLMjjzCnSqfoD1s41FBJvnsmgl2CPQHHTGUpgdAGM1avQ3tMonXlg/KI2OFtTonrxdDJrAVKLR1m+do2LWFLObOFOvNJFW98PImVWrq+4TQueSA2gNLxg24HyOkOx3WCROKyOjOmXQcZPwJJin04D2iuwHi6xKpvhGmHpWxgVFLgvgWlhvcAZ9I83/2gF0LOvye4PP5SS3slP37cSHJ6kpi4zmJcrnd8EjVi9azOJpXYq0Zh5NH5Mpngc7oVLXgJTp6Ph8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CuAQst5osSHV9vAPMHejBIJ2CncxLvl9tAt+Nr/ovEs=;
 b=EDJLnTlg0awGer++LMKA0YuJdoFjOgkmHjujkQAuqs0FkWLymYYQcnWjA+FLHFVCoMQ1Jba+02gok9QxXFw0STmq5QepZdSqjTwGiNesbZYDJeAj0MIeNT6YLH5nh/7328wgNpL+k4CRKKFoYeYEFQR/yJJdzn3h6yD6ibZY5FT6aUNUbSLh45S5t1a3WuUrI1ZcUNHVM8yfObY3dtCKp9bxyFW+AIonDsGEirij0VUHTPCaSKPow003Cw2y3apIMnSSdepaOjHz/9vDox6pS04W66Kr4dZ77tgG5RNKDmdlMrWHyMzM2BkQ2xOVFW+a0Nov4Jq8662bBDRDj3wkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Ping: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
 <9fb1d554-8fcc-fc0c-2b0c-52756001d36d@suse.com>
 <BN9PR11MB5433D8A22A830BE9C2D715B58CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0bc1abd-baa2-7aa8-73cd-7bb36c548e2f@suse.com>
Date: Thu, 16 Sep 2021 10:24:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BN9PR11MB5433D8A22A830BE9C2D715B58CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 164bf7d1-1ae9-42fa-8ed0-08d978eb6edc
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68612194C6A02DD5BDAC5ED7B3DC9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JC98VSSIBlWlhFuZ/r1tBGMEUXIg81QisdDRhcIpCCe0xoKTXOPqxEioOLM0z7hTYOYc7ZbJzYazN3PZys9s0ybfei/R7Ws2rRCQWJP0vF5r5OAXoSBXIW1j6mlOFPdgxaoQKGYkVIZnb7NKEtOk6fLjswZgJFQJey2cpKiN6xbS/1gB7/TTkSduP76n0nx81URRtD8PGIjvmcq9nPqj7P8jHDjmntceiCCqtlaFYATUFPGE2wDElRzbbOeOJPcM2tEfaVeqymzFgEo7o9WRvMcqFUgKyt+Na0Mv2dyxgdoQXTeSkVIqxcbpK0WR7oY5lril4ZI+DW2veUdYmY4Y9ki8Z4IgzqSbLglceJGbxp8DvzsHfAx3y+pkzeTE5xIp5+upzsWtji8CZMdvc7T2v7GkVFzZqBr0OEvwl9tIIcBVl6GgDOB5jjkSni0Xn9V2dS9NfEQPwlMwYz2CYDrJGjpZpu1txOBxonGw/pssSQSMoyyb4ywBuZtn9IodTHBFCJXk0GHVYT5TZlR7X5eYILVtZdgj9bXeU4XEegz5vX0xn51oCjZ/FEDjvXdn4DVx6BAOh6c197XsKdUkx84uEeKFYdIswzKGbFVJHvFf0+4WpWSgP2Px8e7Pvd2WxjSUH9gekEAKMiBWsNgUnmOT9hMZdXfg3GNtoN+X1L4RQK4a50f//fzaJMS5R2CFZN0Ud4AJ/Jnd8TYC4rNpR1LR0J6hu8xEyEVXkv+XG8NYNNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(346002)(376002)(136003)(54906003)(31686004)(6486002)(31696002)(2906002)(53546011)(956004)(316002)(66946007)(16576012)(6916009)(4326008)(5660300002)(66476007)(4744005)(66556008)(26005)(478600001)(36756003)(186003)(38100700002)(86362001)(2616005)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxTNEM3VWx6dWlxUjFjeFp3V0NERXB3VzJvNC9PaHdRaEdkbms2RGFWMzRY?=
 =?utf-8?B?KytvY2R0UllzWFdneXRCdXRXVEtvVkIwYmdTKzhISzk1QTdWSnN3bnBBcHA1?=
 =?utf-8?B?ZFFEVEpXYnpSdXUyTmt0MUJLQWUxZXowMzhHNU5pakxHSGZ6azRScTRQbnlk?=
 =?utf-8?B?dFM2OXloTG9jZFF4T2phZTRsL2I0Zy9NSUd2WG9DbFpGZGlZZjFqaXU5Vm5G?=
 =?utf-8?B?UnV3T3dlWlBkOWtSK05lUjNiUytJcHdGazhURFRTL3dIM1FjdXp5Misvb3dG?=
 =?utf-8?B?aDFQWnRhQmNKQ2FUWVlDS1lNQTlnVVUxKzkvL1VnNmdQNHRLV0Z1NlJzcTN2?=
 =?utf-8?B?Vk9kK01tZ29vVU82YldqU1ZkZlJESGs3aDNVMHRBdmxWRU5jUDJJNVZxRzI1?=
 =?utf-8?B?cTA0bCttcE9lRUJUNnh5d0tuaG8vTTlONkljUjFnUlFFbnFyUVpaMFpjNmhh?=
 =?utf-8?B?cUtpemhnamNINlc2SGtMOWxGVld6cXFwckY3ZUR4ZU45b2NseWIyRXVUR0Nt?=
 =?utf-8?B?cVZaZG8rNDVrTFdtVnZ3VHJFVVhlaDcrNEZNTEtZQjFzdFgxbXZWTFQ0N3VH?=
 =?utf-8?B?d25Vd3VtbnYzbDAwNzBmZHNXTko2RUNjNkJXWElpY2k2aytKR2dMTUdwenRI?=
 =?utf-8?B?b0hPeDdvaE91VkZOeG1SSFdabWFVdS9zNUk1dTV2MC94b3B3a1pjaTdDeHd0?=
 =?utf-8?B?N1M0d1JXMkQxeXNBZWw1WFJzY2swRGQ5WXhOTkNtaHpDejk5eDNSTDAyRWk4?=
 =?utf-8?B?a2NjWHNaNXUyRVZCSnpoQlczSWtkbWRKMVh6SzI5LzFVQ2xYdU1OK1EzTXcv?=
 =?utf-8?B?TjM4dWJoZEZnZDNmK2JCdDRhQ0h3ZXBkWDhDcE9qWFVseTBwV253MVZqd2Ri?=
 =?utf-8?B?V3BPRVNxVGpIK0lZSVFNbGh1eFVua3NGdnBQbXV5Y1dPZnowVE9LbWZmeml1?=
 =?utf-8?B?ejVKVlU3ZDFRK3hISTF5aFNCM3o3anlkQkRqRTBiSndIWTNLcDZMVm1UMGNm?=
 =?utf-8?B?N1E3NnJPaUIxdys3R2JEamgyc0JCTXNDczU0RHZ3SWxvMXJLYlFnL0VCek5m?=
 =?utf-8?B?NEFoMGVJTStnT1BXSjY3dUs2TURFTHJ1cGNQaXRKbzRuaVcvUVBDQ1d1SWRC?=
 =?utf-8?B?b3c3WHd5UWIwdERXRjJwVmFZTGJ1NFpjVzBKZnJEcmJIK0VHNzhFZHpsOWNn?=
 =?utf-8?B?Q3poSGtiRWlaU3RvcXlTczl6dUlkSFl0K2hvOWQ0MmFMbzluZndxNCtDc2dv?=
 =?utf-8?B?Qk11bHNPRWdhZnNVaGkxK1Z3T2FLNFYreHUyMTRqLzBNa0pvTUdZdmdCWGNP?=
 =?utf-8?B?NzB2VzlURGdJOGlodjBxd29GdVZuclhJbWtJNTBGM2NVa3Z6ODh3VDVZRk00?=
 =?utf-8?B?cFFZUTZrWko1aEZyUEd5SlBuZTYrTHlhWU43YXVJWldWMGY3VldRMlVYbG5P?=
 =?utf-8?B?eFVEdFJOUmRrWDhFaWlDemk3ejhqRWdGd3RSNmxyZ0xBOVIwRUxkL1M2UGlZ?=
 =?utf-8?B?bXFnVks2WkxrNTBiSmdLMnN4aU90Rk51NEp4encyTUJKa01uOXlwUzAwQ3FC?=
 =?utf-8?B?YUNyTEJpTjVmdVJkckllRjRPVk0zbEEzc05UcDFCTzgxTElyM2dqekRnNE1i?=
 =?utf-8?B?T1pRVFlYd2lZUFFZNitrb1V1QkY0WitENVprODVMblVZc1JvN0ZaaldjeE5r?=
 =?utf-8?B?SlkwTWdlT1BuWGNVY2FOUDJoQi9vQW1hVTJndXY0NzRRdzRNd2pQQjNCVlRZ?=
 =?utf-8?Q?2aI+HX6gowW/E+0nNeCRY2+tSUtRXd3543/SQLk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164bf7d1-1ae9-42fa-8ed0-08d978eb6edc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 08:24:42.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p39/CKkwBrSyn8JBE+Sp8bGvKvRaY1S2hltXMifv+DNrirx47THbqtUvcMTvtgzkp6ORR1G7hBux7IBBxosdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 16.09.2021 09:47, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 15, 2021 8:42 PM
>>
>> Kevin,
>>
>> On 24.08.2021 16:27, Jan Beulich wrote:
>>> map_domain_page() et al never fail; no need to check their return values
>>> against NULL, and no need to carry dead printk()s.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> may I get an ack (or otherwise) on this patch please? Ideally also
>> for some other VT-d specific ones in this series? I'd really like
>> to get in at least some parts of this series, before submitting an
>> even larger v2.
> 
> I haven't found time to check the entire series in detail. Only acked
> a few ones which look obvious.

That's fine, thanks! It still allows me to move forward a little.

Jan


