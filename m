Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3014039F5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181899.329236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwmb-0005J8-Hl; Wed, 08 Sep 2021 12:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181899.329236; Wed, 08 Sep 2021 12:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwmb-0005GH-EV; Wed, 08 Sep 2021 12:34:29 +0000
Received: by outflank-mailman (input) for mailman id 181899;
 Wed, 08 Sep 2021 12:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNwma-0005GB-3K
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:34:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4505d12b-1626-4893-a4e1-7b4fdfb5baa0;
 Wed, 08 Sep 2021 12:34:26 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-jTNbYORbOGaFlpPb-sRA1A-1; Wed, 08 Sep 2021 14:34:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 12:34:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 12:34:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 12:34:23 +0000
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
X-Inumbo-ID: 4505d12b-1626-4893-a4e1-7b4fdfb5baa0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631104466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PpEv5+mHfqiqUFwb1j4lcLdt4/wSHF+p1OudjtufR1Q=;
	b=Nt/nD4KMhSlbeOwg3BgYO3jurGF/K2v8qY5IHOFXZ6PnCvs7DUlz9/pfJR4tacpl4WkeKJ
	viZS7YsoJW4+jWvnYPX+0TaImfQXPkm/TJPWfmrAKrLhz8EPhbZfqQNnwdhJX0a6n93dIO
	hDTbEGji/LryxGqn/vVeCJ1fx5Txess=
X-MC-Unique: jTNbYORbOGaFlpPb-sRA1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqwT+9zpWiYbBPurU0aVLrTeIAyrCgCwv/H4MgaTrpwg8DxRh5fS1hBr/3o7A5PXG9Zik1+o0mf2bGORgAD/Km6D9q6ONPJeoH7UAWstkfhekrwhxGYR9VvmNteN0U536EbbafQ8o2TtcmaBU7kKFVoc7AG1bWM3P7i8QtB6FHMTfxPj6NlgIvZgLSFZHp3u95mG7wnaV+g73lCczo0LspYlnlQfwMAoZktQfOc/SK+kchGxRZjkFVGfPBOzI0M3+oMJD4fU1Ch8BmrnoEHO968AQ5T3nZayOaSRhGdIdkMUU7AqCR2+YJtMptyQhfacNfiR0a1++LinKIkur5C6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PpEv5+mHfqiqUFwb1j4lcLdt4/wSHF+p1OudjtufR1Q=;
 b=m1NlxbkWqPAk+DLJHFALHwqVr8l/YwRYzXcNH7u9/k47rfnr8v5PD9Y/heHIg7JpczWwCw1iP92Rp/Q3gm33Lyr/kRjt9IMC4Oa2FB29t4MmEOwhKEPHTRQ6cyMPoZJNwFxbtGLRrl76U0ATvcQwGeIh4mkbT16SNjElxHfzuH3e2+qD1fwF1hhiS5GSx7b+ttMMGwwAYJB0uK7luu39pShPdhO402wH6WF+J/E+diucjfo+PeN6UUWnLmubOXx5ML71yJ/ZZ3m+xoA0OJi1tKX4ZjURC418S41KqFyHjdM4aIMKqWijDrjKHhr9P5EtExJ4dRe9P8Rh89w/nRgbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
 <518201c2-1250-26fd-2105-f44a60d40dba@suse.com>
Message-ID: <bb9abe14-22ae-a459-03ca-8895e9f23a61@suse.com>
Date: Wed, 8 Sep 2021 14:34:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <518201c2-1250-26fd-2105-f44a60d40dba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d32e9f87-4a7c-4552-e9ae-08d972c4fd26
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4846F2CF92CDC49F8AB63B91B3D49@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHjJjBl8JgLzZnT3cI7kEJHktjqI6rtQoiRfMti3dSUved4X7zRHED91fwXNoa8IThmz11jcmJ8WytMSHcjPKLPlZG4QrnqjSW3zvEJpTJlMkqNuwrCnWFmD5Kwl+BbYaDHauCVDIlCBNgbjATBQvW8wAF0+lSFStda08aa5UaX4IzhSYgCZGJu8Kqy+Z3S50AR72Xe6QADLtn5rIQT0YeuWdljK6fYWRvDLqZFyCU8SBM3QjrDaljmjJspjEKDYl2QQDzh/e/HI/kvSROMq6jwlzPhaf84C22lOXQ0hYtFu5oI7l834d6vGA7sC19FKKX1FBFvmjsltAGsZlmyatQLKhlChc/pebmXSY42h7GX/5UaO/x54Jhsku6SJc4kCuS2rnT/cuYak/+/I+9MgC1NcFjiICM0UnimvMmc73IJsuwij90Q2aX9wSYXzRQREOt3Ro74McWCxkvuL0yxziPodpwkZIFCFBZgNbpd06SJSQaKdD6a2QVakkm6VuEAtmOJ/OjBfLP/DFKvmdvs0bOmoERenNOoMmUHUPukwZM9lJtL06aQ2ccrpRP5VGOhX/iS3hDxi3fRZ3LyYwiehjurcFl1ymENKPX9xuz1aZd8yxdePPGPYpnF+ZSpNOmmti1DcyYR6v83IjXGVGj9IrHKVL0HwDcmZS+inkensu/BAzOpYlzphLu2QDaVw7PpV/gegqU9FxmJakfgKFJ5llr/BTqiQPhqRr/XmGzkK9Zm5boj6LMVoyX8iTnbPXoig
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(366004)(39860400002)(31686004)(66946007)(31696002)(53546011)(54906003)(16576012)(4326008)(86362001)(186003)(2906002)(6486002)(2616005)(26005)(38100700002)(956004)(8936002)(8676002)(66476007)(36756003)(6916009)(316002)(66556008)(83380400001)(5660300002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDJ0OXBxMGI5eW5SVnFxZVhVSG1FSXhRWEFlVFBpaFRQMk4rRzd4Z1lQcEUr?=
 =?utf-8?B?Y1BVeVBOU0h0U1lSM3IzUHZGQVQ1MkpYK2tHNEpMZDM5TW51V0V2OVphazk4?=
 =?utf-8?B?OWYzL1JUSHkxcUNFUUFUNTBDM04xS0pxNVRucTkvNUR2R3Bnc3RvdzB1Uktp?=
 =?utf-8?B?SHZOWEZ3WG9oTlV4VG5QaFhwUmhmaEhpMldTTzdPdlNvMFFBaWdhL0t6MmUy?=
 =?utf-8?B?bFZWMUthOElHbEFiTytqNDJ4VkplQlFpWHBNTlNvNC9vaFd3cWQ1L205Z0tD?=
 =?utf-8?B?aDR0VWZLT0NJT0tVMTZRbXMvL0NIamJHMzgrNVY3N3dEYklSUVpOQS9YVkEz?=
 =?utf-8?B?N1lWVXozV2NPeGxDbnVDZ2V2ZG5LdnRDYm1MbWFwZ2NLSDl6UDMrM2N4UENK?=
 =?utf-8?B?VVFNdSs3eVFCbDdBVUVaZEYyV3VNTjlEYWhYdm96T2RYRDFJRlp2OU9lQzNP?=
 =?utf-8?B?M3RvNll2Smd0aFlVQWhlVHorNm5SUmZud2RSS1Z6M0xucjRaWVRSbzZSMjc0?=
 =?utf-8?B?anZyMGZxajAzRzlISGsycnhjY1M3cG1wNDdUNm1zazVrV2RIREtyWEpIYWdW?=
 =?utf-8?B?NHZRUlU3bURGZGZSMmZYRTdxc0FHWTZGNUVLZ2ZYYTlCWkphSlZYTzFZWk5R?=
 =?utf-8?B?Q3hzUHF5YXJlM1JwclhCemVtVkppb3g4a1ZxeUpHR2dlQXYxQ0d3Z0ZzOE96?=
 =?utf-8?B?c2p0NWJGOTJwNjJHclUvRDlrTlF3bTdQT05xVnBVZkR2Tm95SEVvRStkRWtM?=
 =?utf-8?B?UWJrcmhiNUlIanBaVWVsd3BsbHYySmVWdTJ2UG5FUCtMc2xjWmRSR0ZVaHN4?=
 =?utf-8?B?MlN0c0FkdmtVamxXcENub3JHMi9ha1ZNQ0pDRkJoNkU5S3h4bkhZKzVsQ0RD?=
 =?utf-8?B?ek9XY2IrNzk2QjhNMG9RYzg3TkhVL1VqYlpIQU50ZklULzdxaDkydWxCK1pR?=
 =?utf-8?B?ZjdhamhsV2FBQ2xIeFpYQ2FKcndnMktyeGpzQW9lMTY5SnNCanFTMndwUXdR?=
 =?utf-8?B?VGFPZVhCL2d0cGdJV1Y4Q2EzWTVmcW5Mc3Rnb3FRY2s3WkRoOFRLMnE1bjVp?=
 =?utf-8?B?WFpMOHFQQnFhVUI5eTdsaUxpdHV0Z3gwZTdWL25rVmF4c2hBUmF4ZjBDZlM0?=
 =?utf-8?B?a0tkdXBRZnpLeUtCanNOZVBZdmN0N0ZLMGhDb0krK28yVWZGS25sWVJBdHRj?=
 =?utf-8?B?Ym01aHZ5aktGaC9XTmZTRzdBL3NsaCtTSFNKK1hWRWZYVEgrajIzZVNOUlNR?=
 =?utf-8?B?NnpHSGtqS0o0YkZDbGdYaUhWT1dJemZHZnhFZ0JZS2FqMEFjOXFqVkJQRW9Z?=
 =?utf-8?B?L2ZrSFNCV2gyYXpGUkpWbGlpaHdrcnA1RGFqaDlCQzZkM2xWQ2tid3ppc05m?=
 =?utf-8?B?MzJlMXJnT25zUFd1WWxxc2lKZXpKc09tQ2dxdzNRVW1qWXFhK0x6eWN3RmN0?=
 =?utf-8?B?d0owLzc1YkVkVnJBOThuc0hHdEk3ai8rMUgwRS9qYkpTa3FSQlQvNDNlNTNT?=
 =?utf-8?B?NUZjaEpqMFNkRnhNTEIxNjZML05Vd2RnSTllUjFHMlZKTHh6VmpRMjhiN21C?=
 =?utf-8?B?Q2paOHcvN3pYcXQ4UnRZK1h1VDlkNi9VY25RV1o2VFJMTVdvQ1BlU1EyTGRV?=
 =?utf-8?B?Z2x0bytDQU9XM2wrZXkrV0Z5NjNqUkc4bk1LY2tZRTMrcllEbHV1dWNWQzlF?=
 =?utf-8?B?R2MrTHBUa083QjZsMEdpR0U4ZlYrak94b3dNbGlkbm9wT1pRQ05MOUdpZk4x?=
 =?utf-8?Q?7QjyzUnlnMF2XScD5gqqmrveWTYhJ8HZxOYik/J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32e9f87-4a7c-4552-e9ae-08d972c4fd26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:34:23.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4asWIh4nAKvQbKrhJoJrZrnjEjAvjKAfRE0bfbizWV7Tk+3/aKbIBVHdhweBgFygUWt9pvOkVkQKfDFQ3+phA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 08.09.2021 12:32, Jan Beulich wrote:
> On 01.09.2021 10:45, Jan Beulich wrote:
>> Commit 806448806264 ("xen/domain: Fix label position in
>> domain_teardown()" has caused Coverity to report a _new_ supposedly
>> un-annotated fall-through in a switch(). I find this (once again)
>> puzzling; I'm having an increasingly hard time figuring what patterns
>> the tool is actually after. I would have expected that the tool would
>> either have spotted an issue also before this change, or not at all. Yet
>> if it had spotted one before, the statistics report should have included
>> an eliminated instance alongside the new one (because then the issue
>> would simply have moved by a few lines).
>>
>> Hence the only thing I could guess is that the treatment of comments in
>> macro expansions might be subtly different. Therefore try whether
>> switching the comments to the still relatively new "fallthrough" pseudo
>> keyword actually helps.
>>
>> Coverity-ID: 1490865
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> If this doesn't help, I'm afraid I'm lost as to what Coverity means us
>> to do to silence the reporting.
> 
> According to the most recent report this did not help.

Just noticed that this was rubbish: I thought I had committed the change,
but I actually didn't. Now I'm about to - let's see what happens.

Jan


