Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891CA3A3EED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 11:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140296.259261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdH0-0001Lo-Nq; Fri, 11 Jun 2021 09:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140296.259261; Fri, 11 Jun 2021 09:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdH0-0001Jc-K8; Fri, 11 Jun 2021 09:16:18 +0000
Received: by outflank-mailman (input) for mailman id 140296;
 Fri, 11 Jun 2021 09:16:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrdH0-0001JV-1u
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 09:16:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 003df88a-39a1-4007-98e4-ddcaf689c4e3;
 Fri, 11 Jun 2021 09:16:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-gObRCzchPne2AjneFU1o3Q-1;
 Fri, 11 Jun 2021 11:16:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:16:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 09:16:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0070.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:16:11 +0000
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
X-Inumbo-ID: 003df88a-39a1-4007-98e4-ddcaf689c4e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623402974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA/siaUq5mzl60nL+m+UPGxrGbDmbfXqDnjrfT/8wF8=;
	b=dkQm5ppEA6BVlS1fepTVAIBVo4Yuqw2XVxy6qmvssltXp4dK1hP+x36hx9ZtZJ+Muny5sE
	wAnq5HotwP78X3HJ9+GKHqShvkFcUP+FK3PnKTZUgjjkLLMkBn9sagY/GUwUsBHZ71/hhE
	hPU5qHjEQSkDHSf7S4OLRSsibdvSF5o=
X-MC-Unique: gObRCzchPne2AjneFU1o3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIB4FA09p76fXcqjf7fXWqkS2haaYWrqBJe4xlDv4bndTStGSTEm7qQQ1iafqn/yPQUOV+J9xkokx3Gxzjg6twDhhB5i6Ow06EHh9yQ3eU9ldrnLt8ISfM7gF/Lv9gSOg6nk561j5Ah1FH4Icb+RWYyl1aWnxDBY5ZxV/Si9Fnxbk03V309WhpiXCN43Ig6aGe84sHOnCPOl1kkZXzZrLeb9Yv9wa9z3+SK7Hhx7J7nXj4UchOZF3NieefZbifEbrj9L6zr3LkEpRxeBj2z1R48oCjW2HiYxI+2DqsGfffAVfK/oIQ9s8pvtlBr6oKyai4+NbcXMJ17xZt0Qx2u92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA/siaUq5mzl60nL+m+UPGxrGbDmbfXqDnjrfT/8wF8=;
 b=VZf/ki4PY3YfaRldFBwA4iOhf0M1Dz6ECPO01xNpkVoP2FgCE3W6urYz7bBaFSeYnvFpjN16R27NNpmVeVbrF2xtRxOThbJziJWPE0WZy9NXB8k0nvtJUh9457rS6QgrEh13oDKQN0oM1zkxcxhaqe/G7o3BhDI0+FAqZZ6ER9eB4IvhH/hg+RmWAeQuJ3efnruF6nxb+zeuzL8Yj94AjDxMwVm4pkLBJoRAO+CVTISQR7iFbKo0FYfsaeT705x3H/wBznhflLmJVqEXVC6mSgppY0tj5bwejx7iTcfcArtScoBJP5wekyAMsycal+GAFhiq0i2vTKMyKSzcThj+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] Arm32: MSR to SPSR needs qualification
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
 <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af2f231a-5130-8e5f-b024-04f74e57d1ad@suse.com>
Date: Fri, 11 Jun 2021 11:16:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1bacd2a-0938-4ef0-cc02-08d92cb98e0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312030C02EB4206E6D37BE71B3349@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vw9TL/mD5bxqwLWP54ikmSSkrXr9D2fk2b6OGt5EQHr3B/loAu5MAcTW1UsqsB8xTTKeqruU14S+FI/MUPRoDu7t/lpcyHqekHrCnPQYCywJUj3cUPNzWp2Qt2e0Zcai6OLJ3AD/lUhxTwYGHDYkeckBzpoR9B/5QE3fPRxthp3QdO9GxghEeCg8MsX8pcYsql+FrTpz9JuV15/xRSCau8qoVf7/U2urHVpJCZLQI0A4vW1Vmzv38/b1ytjDqSB71gEbFCReCNBQkl2SGt0E5fbQmr7u2HD1+a62z47SeLPDD0cCLUSSjADyWbHel770T8fyd5xI2cbGGhuhsxQCd6nu3/KI5iarVCjo+JIHrj4VMVigfKZc8oPbxZ4GbAW2dD01GQ9LNAG40V3KHHnqqM9LQESeKLbbgOkusFLj7ueHu277iyX/0HuKZy4Ad+CpShZHxXSKNo0MzIaZKNTc7boVTJXJ5Snlj4xYmtRK5sCY4kl+I9m3mnFB0qRAWnlBgrD34y/cp9jAC9H4y0zEyceBSktFEtxXhXRU++Z7dWcPaeNBeNzt1EDrIz1iKmtlpRFQ9hSLymrEPc9RYi0V3Gx5Rua6+NweYC2Q8iNjxKxdgD6Z6g/PXgvh+QeeRSiwcZHL5rA1Ui4WRuY+WntpLJ94VnnaEXsiOTNMZFWMsQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(396003)(376002)(136003)(366004)(5660300002)(36756003)(4326008)(16576012)(38100700002)(316002)(86362001)(2906002)(66946007)(66476007)(66556008)(53546011)(54906003)(8676002)(478600001)(31686004)(6486002)(6916009)(8936002)(956004)(31696002)(2616005)(26005)(83380400001)(186003)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJUdEswNVh4VDhhNFN4dGFJY3NoZUF0Nmxqa1NBK0loV0RXaTZCTFpZdkdB?=
 =?utf-8?B?RmlNZThvUm11VGNhV2hHRDFBZEp2NUMvampRdFVGS0xlcnFvUzRpcGlXTFBq?=
 =?utf-8?B?aTI1ZzY5dFNpQVBzcllZL2NycnBVbTcvc0taOGVDVjgwVklxSXVvSGVsZkRF?=
 =?utf-8?B?QjFlVG11N09RRmppTmwzSENmV0R0c1lBbi9GVTc4MnZoVlJWaWQybzNYSFBY?=
 =?utf-8?B?azlwODc3SnFtMU9Qd0NjaWdzY2JiRFFSaHFhaFd3SjlOMERpR1BpMkNhRWpq?=
 =?utf-8?B?VVhIQml5Yit4UEdKRXhGNUY1VUErR3hmZGJVLytMRUZoU2gvZXpsU0VQTFQ1?=
 =?utf-8?B?WmpRdXBVKzBzbFBmM2ZPQVVhVm9UZTJqRU8zMUlnNkFpWThqZFV3MVF6ZVFj?=
 =?utf-8?B?OGM3UE9QY3B4L081c0tyWk1uZFI0cU1zWmVCS3gyTE9VMWpGd01idWhyL3BT?=
 =?utf-8?B?U2pCWVBkbmM1VHIwZGtBTlRTdHZZUnFYUTRvQXBPWDIvZ0FmSjQxcjF1ZlF4?=
 =?utf-8?B?enVWUkJVbXlBOExwK0wyWkRTeTM4SjB4RWJyUC9iY2kxSEFLWmdmZ1I5V1M4?=
 =?utf-8?B?dStqeFdMYXlwczRMb0Eya0taWW95TVVWR3hZMkNaYnY0ZEF3SERnaGNERStV?=
 =?utf-8?B?QUdxOTdhTXl6dEVWZG45dmtjNE9IR0lpMWV5Y0puS0ZtVTI5NHRSUnF0Nzg1?=
 =?utf-8?B?c3RaSVlZTjRsYjJ6YlpHUzh1dEVYQVIycmYyYk1veWlYQnp2LytQalhRc2JP?=
 =?utf-8?B?TDR6UDJhSU0yQlB4V3RiRDJnTFhJR3NrM3krbkFoSVN0VHd1d1JBVWtYem1u?=
 =?utf-8?B?WTNqWFJlM2ZrUGxNREZXVDRNWnFsUGFCTHUvYkJEaFlXdE5vdVdXV3gvbzA2?=
 =?utf-8?B?ekdaUk5jSHhrT1BYR3BuZkprMXNiT291dmpXRE1uZGlHT2pxRldsNDRBZjdt?=
 =?utf-8?B?eXR6WDFoOTZGNFBITWZvenY5Z2VmTktnT2R3WVF2MXR0OWpjVGloM3B3MllC?=
 =?utf-8?B?WHFVejZHMTEwYlJTckJWMVFrT0l5eldkOUhPbUYxVFFZRitTYkRWZHdXMGw2?=
 =?utf-8?B?Mmhaekgzd256MzJaTUdHRm9ldGhJTmpVbjViYURROVpONjc3ZTJpYVQwNUtD?=
 =?utf-8?B?NW4yV3ZKY3V4NWExZ29TZGNBY2E4aWs0SUhXR1hjbytKYUlHc2RScnUxR3hU?=
 =?utf-8?B?elY4Vk1LSGFubUQ5QkhTSWVyblhmWGt1Y2dtb29lK3ppM3UwbG5WU01uQzg3?=
 =?utf-8?B?UXY5UkpiWkxvRFhab2xlaWpGVysxL2pXT0kyMFduR1V2dzNrc05aWGJkRnBE?=
 =?utf-8?B?WU5XZTUra2Y4U1BGU3dUUS95T2I0WWZqRXVMa21CZUpuNkZrYkZsM05JcjJt?=
 =?utf-8?B?UUZReXc4eGVndFg2WnZwZUNVRTRXZVdnUEJBWWcxNmhzOEEwcTZralh4VHVC?=
 =?utf-8?B?alVvbWphQTZ0N2NnT1I1c2FoSmRpam0weUZkK1YxSDZjWVlhcWh6S200N0hE?=
 =?utf-8?B?ZWJMWkswQ0Y1STgzdUo3Um9HOTdWZmkzaU1FMklPT2V3bFJPSW5NdW11bkgy?=
 =?utf-8?B?UDh0eUdHZ0tQMlgrVEZNV2kvT1BZV3RmcENSSEFwV2lwbTNCc2hhRDZBSVFD?=
 =?utf-8?B?dFYyUmRSWmFwdnpBZU1wZ1ZnVC9UU0VaN0Q2NE5OUkFmRjZJUUM5YkZFdlJz?=
 =?utf-8?B?alY0QUlDSjNsdjg0NGZzTkJoYy9SWVZzbkpmdG9scHg1YUFBRW5lb0tHaGdH?=
 =?utf-8?Q?+pTVrTkWXeuBsWvkMSjlrXFaGjiB+otkbia/OGw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bacd2a-0938-4ef0-cc02-08d92cb98e0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:16:11.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Beh9YUSIOSYZ3KLnjzkCgFcSo/AaaG+X5R82yf7ioj/LT+D1auG8vkjoHfWEI9IIms146ZCjaAXfgXccE++3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 11.06.2021 10:00, Julien Grall wrote:
> On Fri, 11 Jun 2021, 08:55 Jan Beulich, <jbeulich@suse.com> wrote:
> 
>> The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
>> here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
>> surely all of SPSR wants updating on this path, not just the lowest and
>> highest 8 bits.
>>
> 
> Can you provide a reference to the Arm Arm? This would help to navigate
> through the 8000 pages.

Referencing the instruction page would be enough, I thought (as
even I, not being an Arm person, have no difficulty locating it).
If it isn't, how is a canonical doc ref supposed to look like on
Arm? On x86, we avoid recording document versions, section
numbers, or even page numbers in code comments or commit messages
(which isn't to say we have none of these, but we try to avoid
new ones to appear), as these tend to change with every new
version of the doc. Therefore, to me, the offending commit's "ARM
DDI 0487D.b page G8-5993" doesn't look like something I wanted to
clone from. But if you tell me otherwise, then well - so be it.

Jan


