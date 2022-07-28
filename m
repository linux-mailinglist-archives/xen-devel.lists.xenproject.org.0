Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98B583936
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376628.609522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxZX-0004mW-2w; Thu, 28 Jul 2022 07:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376628.609522; Thu, 28 Jul 2022 07:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxZW-0004kX-W7; Thu, 28 Jul 2022 07:04:38 +0000
Received: by outflank-mailman (input) for mailman id 376628;
 Thu, 28 Jul 2022 07:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGxZV-0004kR-LI
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:04:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e53591-0e43-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 09:04:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB2847.eurprd04.prod.outlook.com (2603:10a6:800:b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 07:04:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 07:04:33 +0000
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
X-Inumbo-ID: 89e53591-0e43-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi3DmqpSdUjCf1a/yGbwf95N+1btNCpv/o3qhbYKhidv5geMnP3kX+7Wd0JzuX3A0NHZ4T07k254EbZuQpcVL2L9+tbtIo9jdgUlo/9Xls9cBp4T7RME10o1zS4NxGGo8AR0VWN8+0qdxbPTBAYCOn6+m7qT9e+S8k3AGS+TJgxdTotOsdBkJz2oFsY9WcDYCzP1GCwetnatt9QkElqnnzv2y6e7LAWQL/KlECN4+bpv/Uka9vsR5CTfVFC0hHfjOe+RAlcrNJhocx0gpjDOSTOFPXGuHMir9574E34thc3ro/aJnN5k9+W6fPrFnXClPSzgLCwiyRtlK5JQYDF8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb3PDVQs7FlAqnRbsY4JVCnfJzt6AEgUfDJbtfulbcc=;
 b=AVJdVYLF1Bu8TWI2E4TixZkfiJnuGZstBKq3gp2BLoA87mQg2TpUtBNFR9tOjsU09OBWDjLsz0kV7zD+J0uWbvna1xUEFoRccoWunZb0pWajEzIWEkCYsfGdetCCKjRSXffDkM8Vax6Q7f93c3XZc5Jasg7SIj7bpGXpoGxVy7vbXO8Bbkdofamv9oRTkCGpPW/l8m7Z3dV/vrlLAKWsv8D+TMZHokzOKx1AYeVhlGDaPyf5OTuDEHV47x3MtuZdaF8nD5If3khZXWL1YuOpA8mhvqt8nv4L/iAvR0Wy0mDMPxJRCG60mrbdPhm0BhMG5m/qFkdG2U48MQXoPAtTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb3PDVQs7FlAqnRbsY4JVCnfJzt6AEgUfDJbtfulbcc=;
 b=H0zOcTVwlhhdHIrkuO6sieRdyID/hgXUUVD+TtKG7vt7230eeDG9g1rjr2s4ziw0/QE9P7NyIW/JrgFhGrou8ixcXjLokA6ceY2jXh6ukvKcuE495r0dVJ435ZgoDs/7gwOKoOA33Tm7fCHBHwsOFlY8FTTLlsdUD/U+ue+hPZ4cN5nPg88vuCbASvxYPAUEJBIJh9vIU0k5YG3p5ihddyZaTu2crRr16huZWiLxksch8bb0fV+zXuXGAyu5pam2JYWwu0s6uyUFgzpjw6xTn3cninh86o0pLZuHH8b1x+km0K/71UjARcEiPbtt3ywBFwDczX8PKHqTeEtZnm98zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9359c032-1cdc-542a-da9a-99a42a67d27e@suse.com>
Date: Thu, 28 Jul 2022 09:04:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 06/11] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-7-olekstysh@gmail.com>
 <85853c9f-5706-22dc-4798-48c775a17d12@suse.com>
 <6a687fa9-aae0-2257-5d95-91b00db1613a@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a687fa9-aae0-2257-5d95-91b00db1613a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f6f7bb4-bcaf-40fa-dc49-08da70676c41
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2847:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDg1vsBUQOu2yJZv11y9sNPw4l5GIq6AGWHpRr8IQQv6BWk3G5u7qXaBlEqtEztyWAys1T8xGmD27OKnjZ4GogFDk3qLJoRuUpGA9zyG7ICnSavCaINobMXK+bM0++vElOvyjn+wAyZJnHxMB+wXYPLhZrHepjXICvo2x0NfIlmWlJOn7h03Org2fprIUBJpnZ7UDZ4FKXm1t0nNK2pa2pxzgbI7OVGbOI9MtCXYum5kNpnmfl0iXfvz65iK9I50yhgEGo5u1rNxKxeQHSAzFizWn6YJHvmOwxiDe6AHZ1+A7ezfCOXL2PjZzdP+wd83/zL6u+y7kb4rkoSr92Mjo/J2cLZohZGKhWKU94gLr/sgfyG4dOc5fQ4sbN0QsncDStegE78RYS14XRlRpy5sErurFzssZlTifmqyZbnNjNxkfR7F5Lg23iIVl3NWSy8LLbBlLmaY7YW3WCkAcCBu9i71S+QnA1Km//JywaAg/JQuQN2F9GhJEqkuF/GHw7Cd97kbn3czF3rqE6/wryG2IC+gadwdRO8rQhm9CQWFECG+RziPmYEoyCpGrHCKhqpgBe/e3Hp/cwXSI0uitL/a1Q0mLPXxW9rMSVhCCfg87cTf8jGVu8nMsNMdBLtjOy9G+P9+mEHmwQ7VXaB+KWIyYPFLMbjWtKhzaSVO7XetrVeqnxl5r1CQBmxR0IXVSlCYxGLxKw/qKhvyujWsdIiw0qdeGAKqXFJGgETz3XFxLg3QQ/Oy+YwY3JV7vSSy1QTSrPY9kLzP6Yh7Zl//qo3b9MpLyBUY3vjkMTrNkaTMP/RCAxrQhLapUAqF1PSIJ0S7bUAgaWsx5rGl7qAbfoNJ2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(366004)(136003)(39860400002)(2616005)(41300700001)(2906002)(186003)(6506007)(36756003)(26005)(53546011)(31696002)(6512007)(66946007)(83380400001)(86362001)(38100700002)(31686004)(4326008)(8676002)(66476007)(8936002)(478600001)(5660300002)(66556008)(316002)(6916009)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCtReFk2S3lWeTdMSENVbUFpWXZKRCtrYmpTNFFNSGVHeW5DcG1FdWY2U3Z5?=
 =?utf-8?B?ZVJyMGhHTG9IcDlFTllyMVVDbk50NFdRRzM1NkJvbnE5RUdOU0QwbUJiQ3dJ?=
 =?utf-8?B?eW1DL3FaUUU4UnNJNll2M2hwc1A4Y0NONnpPWGRORzB6NTRXd3VzVjdFNTls?=
 =?utf-8?B?OS9MMmNJYXFzTFU1VmpiQnVxeDg1THcxTjlRaktPYnVvMnpIUGFNRm5aUCt0?=
 =?utf-8?B?NDIvVVh1amdPallVNlQ3eW0vbWJtYXFpdm1CS2N3aS85QSs0aUpIOFM3a0l6?=
 =?utf-8?B?dU5sUDBhMTFCTVhUL21vN2Y5Z1RYamZqQTl0cVNhZ1kycTNxaG5zRlIxYzFp?=
 =?utf-8?B?a1E4OWJWM2lsbGRZRDJUZlVYNmRSTGdHcTJtMWx2cElvQ3RJdDM3YWEyVFB5?=
 =?utf-8?B?SzEvZzUySDlkMVlLcEE4MHJNVVRrdDVYTEwzWnVQRzNMT0dKT1EzaVJHSTJK?=
 =?utf-8?B?ZDNoQnJncWMyZGlUR0xGOWdwQ0k3Y3dPMUY4N1hUbDNiQ0VkSUZINmNlQ2J2?=
 =?utf-8?B?RmRlbmtKbGh3ZStsdjl6VWt1dkllTHY2SFVYTkQxYjVJd1dxTzFjSFU5Zi9W?=
 =?utf-8?B?TGVVZlZRZ2lNYXk5NE83THNvczUzakpRR2tobDBZazRIMFdKZVhMUXN5L0dC?=
 =?utf-8?B?K2tuQXRRdFVEaEp6dzN1WTBHOVB3aWlGelJDbEtPclRheHlUU2k0WmxFdVVK?=
 =?utf-8?B?U0loQk94SEovN1N6eldxQmdkUklUYkczalhTdFNtSjVNbUFNSXJRWW0wekhP?=
 =?utf-8?B?YzFhK3NmK1M3SGZydCtWYlN2eU5rTERtcGxlQU5mSW91ME1IeXpIUitqeEZw?=
 =?utf-8?B?RnRnaU05VjVpZU5pdWlwZktMeWI0MDZ4N3lYWGNZd2YyR25MMzBybGhHR3BB?=
 =?utf-8?B?UU1ZR0RkQ1FWQnNsK0dQNFhKWVR1WkRuaXF6ejdJbWVHMGFmalhncU1QODNN?=
 =?utf-8?B?eVJadDMwTFNZQUJXS3NPWHoxeVVnMEEzL09pYWhZRmRkUHpJYlpHeElvRFRW?=
 =?utf-8?B?SWxsbHNkdzJWSFFLYmRLQm9PR0JKRk9Kb2U3WTNPRHduYUpHb2tQQUg4VzEz?=
 =?utf-8?B?MFlOSXl4OHpSVXhHVEpKVTJCazFjSGozZHR0SUpZWWhUMFJMNzNnSk5IbW8x?=
 =?utf-8?B?bWNMcnFVV3l4bm1OWkQwY21LWlFscEJ0ZENkQkg1aEtvUVpiSlNpa2pSd0kw?=
 =?utf-8?B?aUwybkxTdFFrV1pCWk1uVklEbGpnVlFvMGNDS1N6Zmg4azRDMnlPQ2V0aC9D?=
 =?utf-8?B?a2U0MVFqUXN4NUVPeEhMcUU1S0dpYldMM0I0Zlo4dVF6NXlEalZVUWlRL05k?=
 =?utf-8?B?M3NMbk9KS0pXNTFaNXU1Q3BOVWM4OGdOTFdoajR2V2E2c1FCYUVTU3lWTzNj?=
 =?utf-8?B?Q00xS2krOHRjQ1hFSTc4dWdGZ252RnhmaHhlL1hCS0NmTjR5bG5McEZwdEtk?=
 =?utf-8?B?S201MGtlQ05YQ0RhbFBqL3o0T01Mekc1NlpmUVQ2Sy8vVnBVUnphVGlkKzFw?=
 =?utf-8?B?Zyt6OU50QTM0WVg0b3dTb2Q2ekVhbUJrUE1nRmk3NDlqZVMwdW1wYW9pRWZy?=
 =?utf-8?B?d2ZlaDVUVjJ0L3pVWE5pcnhMUGMyeUtENm5IdXB4UDhhOURwYjZBSXhnZ3ZL?=
 =?utf-8?B?VU9jMDZSQ3BzRWtvc0Q1UlYvSUcwK2pld2NSM3RwSW1hUGFlQ1ZXYjV0WmNW?=
 =?utf-8?B?aFJSYW5aQmd0MG9sVFR0Qk5rODYrZGpUcTBuamEzcEtzZ2l3VXJsZ05MeFk2?=
 =?utf-8?B?eG5wakZBazVOVCs4WFFoTU9Dd0VBemNYTzlQOEtaYlNnOCt0V2diUytUWk9l?=
 =?utf-8?B?RDNsamZ1OWlDMFhvS2JzeFhvTnVMbk1adU1NWmlzS2N0em1nTmU4RWdvNVY1?=
 =?utf-8?B?RTR5ZEx2R0VMcWdIOVZrcjVweEE4a1VUWHU4bHBzcE5xclRyQWxZWG1rUU95?=
 =?utf-8?B?VHZUZHIrdHZEaDJ2R3V3RTZSbFJIRVI1Rk5HRVQvdG1tWUxneG9ySjJRekpU?=
 =?utf-8?B?M2pMTm9keUU2SCtuZVpSVkhYeXM4ajFUN3RNMmJjVzkzeDhnR1FsUlR2NW1P?=
 =?utf-8?B?a3k0R1lHUlNVZ2JoLzBjR0Vmck1xbHR1TUFIdk83YVh0NlBYS25SUVFPWXpk?=
 =?utf-8?Q?gldYwEOcureNdH0xoFHD1cT6G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6f7bb4-bcaf-40fa-dc49-08da70676c41
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:04:33.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLoAud4vmsPqwV1rCeNPI9fW2C0QXEv6rISLRUWZXbZS0GH0Kq4c/VLQk7kqi2/zMKsiLYGngEH1suBHtExsGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2847

On 27.07.2022 19:06, Oleksandr wrote:
> On 27.07.22 13:19, Jan Beulich wrote:
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Take into account guest's BAR view and program its p2m accordingly:
>>> gfn is guest's view of the BAR and mfn is the physical BAR value as set
>>> up by the PCI bus driver in the hardware domain.
>>> This way hardware domain sees physical BAR values and guest sees
>>> emulated ones.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> If taking the previous patch as given, the patch here looks okay to me.
> 
> This is a good news, thank you.
> 
> 
>> But since I'm still not really agreeing with what the previous patch
>> does,
> 
> Previous? Sorry, I didn't see any comments given for "[PATCH V7 05/11] 
> vpci/header: handle p2m range sets per BAR".
> 
> Or do you perhaps mean "[PATCH V7 03/11] vpci/header: implement guest 
> BAR register handlers" where you explicitly mentioned concerns?

No, I mean the previous patch, to which I had given comments in a much
earlier version. Roger looks to agree with the approach taken, so my
comments were (legitimately) put off. But with me not agreeing with
the approach, it's not very reasonable for me to (further) review that
change. Hence my deferral to Roger.

Jan

