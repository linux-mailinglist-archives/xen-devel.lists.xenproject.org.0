Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BC3E91C0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166049.303253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnYM-0006NI-Q5; Wed, 11 Aug 2021 12:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166049.303253; Wed, 11 Aug 2021 12:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnYM-0006L6-Mt; Wed, 11 Aug 2021 12:41:50 +0000
Received: by outflank-mailman (input) for mailman id 166049;
 Wed, 11 Aug 2021 12:41:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnYL-0006L0-DN
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:41:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7de9fb0e-faa1-11eb-a071-12813bfff9fa;
 Wed, 11 Aug 2021 12:41:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-VGsDGEeoNkyXpKqIGnUOHw-1; Wed, 11 Aug 2021 14:41:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 11 Aug
 2021 12:41:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:41:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0071.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Wed, 11 Aug 2021 12:41:43 +0000
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
X-Inumbo-ID: 7de9fb0e-faa1-11eb-a071-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628685707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJ0VCNioL1Qc6fdOFmswle3K7grO1QbfIHke2H1n6a4=;
	b=PdnwKRxwx3fL69FpRHqtPQ6MPREdzTwVFqsrHHspNALBa9fXUhaF1yc3TI/K4DGncE8VmP
	fqpH0dbMWvY5+nVScAzoWnrhhUGOk2l1kJjB2NHHKs8A9dJ/YO8Zlexuuh7XLUnu5vtVpj
	vOUysjg1EFp3uuPT2l6irFJh8xCXy0w=
X-MC-Unique: VGsDGEeoNkyXpKqIGnUOHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elF5jFFME+vB3Qt2NwE1XcjUhJpFDWTPj5vZHA/cd4ZkvnxubpS8/KF/UHlD9AYgNMkWyItiw0vCR0xUMqycCdyZhFwsCoCnrxkQkWXTvO41Kskf4hyI2XVMweWTSMcZE8Pn43idkP0dYX2/j7M2ua89ElwB9PEwC+doJCllQGVrbH9aUumaMdKHkJ5lzSvBJUW5fU8TVfHLb9F0CEYsH5Ii3EHJ5i4Ow7pDQUd/vnSajomM1MzC2RJVpvJrlk3k8SnbPaijumLF6+p6g2GgJm47aez2mP0UG3/ngRlLoavDm+pVHN2ZhnmT9C4nb6pXYqgaxUWVI0M3McdKN7eZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ0VCNioL1Qc6fdOFmswle3K7grO1QbfIHke2H1n6a4=;
 b=PP07N6QQqiA7P79nE5P4sp9R5dr8D83f/LGJEY6m/iOf8cRrkBxK7Q1MHURO8jbeuBakkXpB6goK3BqmJ3D0sgRHuS9nyYQ/M6CfYFyhETCiUDr1yCj/sAoMTaKX6I6pCJhUhdvGmhLUDuma0F70JNfAxzLUiwUytBCjskLl38sIiKSfpYrJrdwzcHd0ocwOUHYOw4+u+IaHJkEhQNhEpoeSUYdJzauA0kKTqt7TDTXf8rdGDP7FCzF8uqzOX0ZHT6f00ferblSJNDi8sFDEVc33pBb01Mzb873Q7k7++rlEy8q4BrTja71j8Ux8fGNvGVH4wSNhDfN6AVa6ppbwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/2] x86/ioapic: Remove use of TRUE/FALSE/1/0
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210811123135.18195-1-kevin.stefanov@citrix.com>
 <20210811123135.18195-3-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c070b7e2-8cc1-0168-4369-5f294c446fbe@suse.com>
Date: Wed, 11 Aug 2021 14:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210811123135.18195-3-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0071.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84f2d225-a4ed-459b-8b5c-08d95cc5600a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087EB5E6A45DB3321D7F4F1B3F89@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jb7LPeoE9nJXqLNx8/x/9bijxP9SyiazdogfA+IBPnVh4Hq3cCF/SCo92lAKF0PEFCwXNCgQ2/0+Wqc7Wu2AkkaUdbzFNC4xrnq0rx9J43UU6XYyo4dHpQDcq1MGJQOXvBa1TN35UGxOTLlpnAXh6QuwcaPy+lfotBWCNTGQn6YAXnRoFox8YETQHmGzVC4rb+nGxkampB70HPDw72LJ5K3Abnh2osHiLTzKnnkGFhKc2H0fc2tBioVAu39cOycH4sRDpmZRkl+h4Ekai5a2GKKbMojuAYY4aJftpyBPIjn/GfUFJGWxjV0ny6yqb5K4Js9gttWjKlRdiWzL0qHBa01sDZUfblADk7XvE185gX+tiVdNWjfr78ZtGoEJgNfltp/5FtRXG08rjhfgrF6Yy8ABIuET7/Dy5DkN8I8krJ4yAL/CwFEJ2Pj4MYJDZPoRavTtLcmqiZ+QbcbA90SJ9V+p7ysn2x9Gd69pFnRSRJX87mA1IPk/gANMRGA0v8V2FxiE4W/twfLLjGFnfXNMV6FcjKZmtIlm6ksBQBIHFBQWrL36zvo2jvcZ7igWW2XbhzgLAFJVo7YkaebVfmrW3sbVWyfj5zcAc/aCMOLM3ac+XjZ+4x49a3Ij3fbQ0CqOC+HwndWkphhaNn/BpNmUR3a/zRtA6AEJoBVdMEqigALN+g+BDFG4xMcRfbSrYRMmTVfRZHmsrui3iC96peTAIIttBqwxs5lSHhNEYh5U32Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(26005)(8676002)(31696002)(31686004)(956004)(186003)(54906003)(66476007)(66556008)(66946007)(53546011)(16576012)(316002)(8936002)(2616005)(478600001)(6486002)(38100700002)(86362001)(36756003)(2906002)(4326008)(5660300002)(6916009)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhpZVQ5bXRmWE9lOG5YZVZVMWJwVENCT2l1M01ZMFF5Y3lMTXp6cHpMdjRn?=
 =?utf-8?B?cHBtK2lwa1lmL3RuY20xM09lZmZPU3FhSTRPVTJXNW5wTzQyS0IzRHNBYklD?=
 =?utf-8?B?dXdQRmlDNVlZQ3J1dzFrZk1kYkhaQzJUTzNDUk1WSmZCeUxsVkppbmFQYTFT?=
 =?utf-8?B?QUxqMXIrZVpQTVYrQUYvSnhTODcxZUJkbENUVnV1REs4RU5IYlM4eTdKOUor?=
 =?utf-8?B?WGRBeHRuNWZnVDRDMDE4WjVPbVhDbjIweERWMHJ4RXpHaTZVSC9IUklMWmlQ?=
 =?utf-8?B?c2tFcnkzbEYwSFU4NGxUZGYwTGY1S3ZHVFZ6bVptNlpsZkRIdmlscjlKVWcx?=
 =?utf-8?B?aGZ5WlNSZHVZV1AxUm5iL2haTWZ2eXljRGNtc1JqNmMrZFdQVG5yTFVJZkdp?=
 =?utf-8?B?QmpvWWkzQldpa2RkSEFZS1BqUXVjS2kxeVQ5RVRQdWpkS1creXpWVnArZ2Na?=
 =?utf-8?B?OWN5L1lOTjRXVnVwOEVjNWRHYnFwMXp0U1dZdmJNcGMyczZjZFNyOGgwR1FC?=
 =?utf-8?B?Y2haQzh1REdMZ2RieVA3bVFUci81TmIyY3p6SDZyT3EyaXNUT0F1MWRGc1Nu?=
 =?utf-8?B?Q0MycTJuTmtOUE9ycldjVjJtbWJtVnBJdUJ3eUE3UFhVT3AycG5RM1JsMGV2?=
 =?utf-8?B?M3lURE9LR0hpU2hpaDYrV24rMytweGV6UGlLL3kvNzZGczZOZ3pVT1JsWGYw?=
 =?utf-8?B?US8wRU1rQTBFeTdoTVFuTlpBQWh4ak4wTUdrZHhmRnlTVWpnL1RLR3Z0STl4?=
 =?utf-8?B?b1lZSUhWY3JxZysxeklYbTQzdjBvRll0QnQ3c045bjlETFpDZW5TeE51VzlV?=
 =?utf-8?B?dFZCa3BlbHZFampJb01rdzVMbm10Vi9hc1ZZbGJZV3dmNkxRQm14dVdyd0dO?=
 =?utf-8?B?c2Fta0x4NFlZdmtNa1MxTlVyU0RiSUhPTFh3b1BMOXhsM1BKYWcvRkdXVGpM?=
 =?utf-8?B?bUJGVUZSc0NlbTRMVFphTTBhRDZSc0FxSjYvOUtjNDNKRlRkVHNkOVNFLzBp?=
 =?utf-8?B?TE43T0NMcVNYOU9ieS9lUVlnbUs4UnJjaE4vMG1sem91c0NjcjIxVUl1cGtQ?=
 =?utf-8?B?M29WaWJ5NDRMdVlIZlJnTEYwUHhFSnVwS3h0eXNDb3N5bHhtdmgzaWtEcThH?=
 =?utf-8?B?NUVkUVcvSVVlazY3eCtUTi8xYkxSUDZyUjIzNXNJRkNNYnBSR1craU9tRS8r?=
 =?utf-8?B?b0NvUTczR2d3RHIzOGkrQ3d2WTBzY0RONXFBVS9jQ1QwQVRYZ1hmWEtpRkNa?=
 =?utf-8?B?TzhNZWN5akYzME1wZWNnUHFLRVFYQzJnOGhhNVF5cGhMcXUrdFpaYnN1bkNm?=
 =?utf-8?B?OTlhY2syVFVEcXBDamdEY0Q5NWtEVkp0UEFCbFRIbHJlSzkyck9Zc0xZNUlu?=
 =?utf-8?B?VC9tQ09jUW5oZTM4R1AvcGh0Z0FmbzljdEFPUUhtWGhRWkZKN2JrUzlyZmJU?=
 =?utf-8?B?QitkWGgvL0ZmSGVjVGRadEtUMXMvYVJTL1FrSUtZWVE0Zzg4a3FiMzFPUXF6?=
 =?utf-8?B?Szl6S0hKdTdKNmxCbzlKekdnSEppcGc1U1lMdkY4NXZqWVhkM2NZY3RuZy9M?=
 =?utf-8?B?Q0ErTldVVTlncGNlVlI1SkNEdThlem9NamdLM042dWlEZ2UyMU0yNmFpYm1N?=
 =?utf-8?B?d2V2bTU3UE5GQ0ZzUGEwaTBIbWUxUjJqZTJENGMydTN4UnJ6d05VQW44ZjZ6?=
 =?utf-8?B?aXhPdGxMdWJyRmdUUWR5aVNVK2txOHhVcFQ2UGQ4R1JsOUo4OEhiZUNDSzJI?=
 =?utf-8?Q?ku9Vz3yVAz+5m2CbWgL59frhWIWOZygLnfSS7C3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f2d225-a4ed-459b-8b5c-08d95cc5600a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:41:44.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frvHFEbfUfO74xCmVW46t9IaKeHTmqOXS5X2YQz3JWfpnxyTq80fedPwoGaIpH7kAP52DBr3Tg97XcTVNuX/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 11.08.2021 14:31, Kevin Stefanov wrote:
> @@ -448,7 +448,7 @@ void io_apic_write_remap_rte(
>      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
>      int saved_mask;
>  
> -    old_rte = __ioapic_read_entry(apic, ioapic_pin, 1);
> +    old_rte = __ioapic_read_entry(apic, ioapic_pin, false);

Oops? I'm relatively certain that things wouldn't work this way,
i.e. I'm wondering if you did actually test before submitting.

Jan


