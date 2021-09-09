Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B4404BCB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183064.331006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOId7-0000g8-4s; Thu, 09 Sep 2021 11:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183064.331006; Thu, 09 Sep 2021 11:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOId7-0000e4-1Z; Thu, 09 Sep 2021 11:54:09 +0000
Received: by outflank-mailman (input) for mailman id 183064;
 Thu, 09 Sep 2021 11:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOId6-0000dy-4J
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:54:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f586ebe-8d29-4fe3-a23b-a8e6613f48cf;
 Thu, 09 Sep 2021 11:54:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-1salnaTRMXi3yILUMtRNeA-1; Thu, 09 Sep 2021 13:54:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 11:53:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 11:53:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0081.eurprd07.prod.outlook.com (2603:10a6:207:6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Thu, 9 Sep 2021 11:53:58 +0000
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
X-Inumbo-ID: 0f586ebe-8d29-4fe3-a23b-a8e6613f48cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631188446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgsW9dSRnjtKa60RLy4P2pvYkjr9xFazVfaG+r2YUiM=;
	b=W7tF26TaKxSr+jUJebVplR2bXuYezhP0+roZajXsu7Lk4inE1Rn/M9bpaUwpHf8monOqNX
	ZtLTSIbkAvd/6c57ggLc2tIJNK0mtc+hdoFQM0lVH/1LbGJ8OMjOtnSiQ5MaZrrIsAxQqM
	HxQlOjRDl2/kzvllBP0uoa5lR0R48vk=
X-MC-Unique: 1salnaTRMXi3yILUMtRNeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9jtM8tAumPlVyMT06PX7MInqmCz0zjNbFoTUqvlUGz1fC+uMNXli1/jZXyyfRSXDd1p6DQ6Ba3kNNu0B8G1gxbtd244cLODFRhRN4gqRzxrb2upxyppnr7vSuGg7ZpU9Ja62VxhmcOs/aBhBXJ9kXgPLsX5Y0S6Rlrmmun/kO4QRnvPtO+og1cNky6TH9ZNaN1Zi0g02dL0YxW0b7fsAQ6nBmDXeZ2RkYo9+p0OaQ5Ch4zmft98fqmUob6jK6w5HBk9wP4mRFaibGgsylSeTTbCOQ5BU79X6YF1mUEBzRPIG5bxHUfeu7siEmHTFBRx20RY8qrPGpekczZvquNZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TgsW9dSRnjtKa60RLy4P2pvYkjr9xFazVfaG+r2YUiM=;
 b=emaD0BFYl1rP6DYAZ7i+ZLf74NFpoq4+x0c0Qwlv+N4/yJf7zf/+TSFDEmCuj9SMdswTrebh0ygWyfmolJqXGpkTyKYZhDRFx2ZXDwCCTght+Ec0onVxUCy9TNwtvbX+QJMlVuxA4ZBlGCyRY/BFsLzwlECfaf3IkHddFrmh3ng6X2UcuE2oj1gRc+X2lBMeLlAaDIbFTcE9nJ4872b+5XQ3krwvzH1ZAjM2S7a0asIV21CB7y+BU1cotxXJLSHCtN2HWtoV7OmpEgpGughEjZ+dDTUS6CMK5KaXgLQ7xHu2RiGnz7vajv3kBUg+nrfUFAHyYIMyNZDQhqMwfm2u1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
 <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
 <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
 <3ca10b3a-35c9-00b4-f736-293589d641d4@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06560d04-6d71-bb94-20af-fc43cf686b0a@suse.com>
Date: Thu, 9 Sep 2021 13:53:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3ca10b3a-35c9-00b4-f736-293589d641d4@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0081.eurprd07.prod.outlook.com
 (2603:10a6:207:6::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816cf052-18fa-48f5-c7e8-08d97388824e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68630E2D53D6447A5FC26ED3B3D59@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kadVDskirG/uW2IJMQgpWcEo1tNIn4exKzgiyy60qJR22yLu3JL/hY3aMx50ct0oRKQDwdN/o8j7NHpme1ErcA5LGCY2+q3jAa5SFCnrDTlciUfcPrMAvxYliRp0czaecqDUE8zRjvhJu5nYJacqgfblcSk2r/+zdTJWQiwGB7bzotOjcxsoNwmeCaNH0LCi9m3+4WobSayMX31Ke6yTHCn9NCHDJwB1F8bxXtBZpLOkbt0kN8/eKHN1TANoOdnFX/iv/kOSLvavlo/q0U7I5p+K5XHxBtXv8ZkH1AfCfgKweVI/Y/rrtzeWjgm0ino6G/0M1vmoApUqiiA7KkK44QhOFl/bHtqc/9u3vPTrkb8iVcGU0yrbcmhgYp8vzz5hkgg4HbZma932KP6IInT+gDeRsheUroyFnQ1s+T6amAr8I2R6bKJZAsy5rBrIF4DBsI7AV6A5I41fPxTrNPzKUc5mpEutgRQVbpNjQwZ0cNkVTT2enaR/JQ4DIArvnvr9wFDgLhhiAGOj87exwO4m5WVHbt+2FD74eGE6QEkzVj/XtFSNemRJX15eepgzal2GWe+ukiqpLHyH0UOetHhs/aidNmwvNYccLevZ/gHRNpXMJOAqb8Wwe0sUWAfusseEekHw9hEA4M5eEP4myzunS4cUnpg1/LBFb4IeK9MUrp7iTtldCUhck1CmCSIjMBzqJxZn87iYaDyd+JW6uXoBK7QVOSq9rycyVUOhn+L49gCYF6xNYqbWaDo6SRoksidS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(6486002)(86362001)(66946007)(53546011)(16576012)(31686004)(2616005)(38100700002)(66556008)(36756003)(66476007)(956004)(31696002)(83380400001)(26005)(186003)(5660300002)(7416002)(4326008)(478600001)(8676002)(2906002)(54906003)(316002)(8936002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRMbWhJOWZvaUhRQUsweks1eEdWQmVGOFE3TmJMY0luRXhQZU1OY3JKYkk0?=
 =?utf-8?B?WmZwZ0FXdWVXL0pvRHpoa1YvTWVya1p3cjIxSVYranVhZUcxVDFwd244M1N1?=
 =?utf-8?B?RFZweUVrYjk2ZDhmTGN3YUNpMkpvRENEbEpMT2xVNE5iK3h2Y0ZPYm56ZnNi?=
 =?utf-8?B?Y2RRR2NaYk40ZGhRMk8ydDhWODZwamJjZ2thQUsycjZwSnJJazN1eGZRUENm?=
 =?utf-8?B?K3BTN2pzSWFjSlc5ZFpWYWlVQjg0V2NiUWRTNncyL3VhM09BUzJGQ2dyMXF4?=
 =?utf-8?B?cUdHSmptRGhsL1FlMkdJUnJlRE5SQ1Zla2ZvYUtFSFFYcmVMU3pHa3c5aVk5?=
 =?utf-8?B?M2xIL1BDOEdmNVFvbUVmd052UURzME1aTlppemN4ZGdJSC9BOFd6NlRBVStl?=
 =?utf-8?B?UTk4YXdHQmZaVHU4MldtdFJQQ215blBBQUIvMmd4bGxGMTZvOXZ3TU9UcEdh?=
 =?utf-8?B?RUxRNnNkWTdwNkM3SHBrY00rMitGUlpaai9DSElEYmpaeHdzSmMwS0tUZlBY?=
 =?utf-8?B?UWlabW14N1ZlVVVCRW96ak4zdHozVDRJVnFKVjZSMWFIN1RSTktkU2lHdUpp?=
 =?utf-8?B?TTc4S0N0TDBnZkczWGw5VFVpcWsrSVRCcG44ZGFsYjNERzVRdHBKeHNHL2hT?=
 =?utf-8?B?bzlBVzhrUHRMbFloR0VQNjRjQVA3SkRoYUVFM1BDTDZSOUNDVVVDMGhIN3U5?=
 =?utf-8?B?NHZHODQxMDZiL1djMFhuMy8zYkFpZ2dFRkxKaXZ4RzkwSFhkMGp2RnRHYzMr?=
 =?utf-8?B?WTV0dGRLL2RUUThqZHppcGxwZDFwNTRnVEt1Y201ZXkwV3RmSTFXazI4ODFp?=
 =?utf-8?B?RzFrUE5vaUt4d2Y0V0VkSHVuemRSRVp1bi9lUFZNQVBSa0FRRnNXMzFsOE1t?=
 =?utf-8?B?aUd4b284a3JFR3hRTk1ZMW1UbEpHTUlpaEJaeFJyYkVUY21CaG1FM1NvZVNa?=
 =?utf-8?B?TE8vKytPek1CakVyU1ZtbkpGeGJ1YWlpdHBPcEo0ZVprREFXWGhzZ0YyZ1k5?=
 =?utf-8?B?VDNQN1RIMmdqc2NyUjF4ajBLKzZhVVRsVTRLcTVPSWNzWHBpTGkzTERGWXox?=
 =?utf-8?B?QVhINVZadnlWUzUvMUZIbXB1SW96NDhkMm0wamU1RjdOTjdnUHE3SDc0ZXVt?=
 =?utf-8?B?VnlocVRtblRMNFUrU0V5Q3dqSXZ0N1FENk9mTGFzYUd2TW43bkFaazRRVWlP?=
 =?utf-8?B?ZlRmMXVuZWR4blVNakhKTkZpNFY5bTVNYUMwbUlBcWZIRzIvckdGckpaRWJY?=
 =?utf-8?B?cjlWMk1qSm93WTVSVlZaMGY2dDRvOW1WZVlyTXk2RmRjQzBTSEsrcmdYdG84?=
 =?utf-8?B?T05XdUVRSzhYK1VqbjdaRTFRTDlRc0RGak0zVlJ4REkxN3I2YkJhc0Z0WDRC?=
 =?utf-8?B?SG1LR2RpbjJleW9adkdTK0JVWEtLT0l6akJTd2ZORGMzZ0tCWmVmOTMwbWRU?=
 =?utf-8?B?UWY2UVlEckhnNGx2Ui9SWjY5UWpKbzV2RDB0Z3o5R0ZyaHNNR2M1RlZNVUs3?=
 =?utf-8?B?SDBMOUlsd1dMaXEwQVBEUmtsWjVLaTE1bFZxeG9xNStKNkhBMGdmWEVPdk1n?=
 =?utf-8?B?aWQrcnlwZjBzMXZUMW5Kd1cwNUJXVTBkQWQxeWRRTG9tSjFGVFlOMVF5MzlV?=
 =?utf-8?B?QXp2K3l6cEwvd2Y4d3I5R0pKTlVqcXdtVnRLUG94UVdndld2eWwzV0FoUkV3?=
 =?utf-8?B?Q3l1YkJsS001Y2NFOFc5OFkybmowZFAwSU5hbFVPQTcrTjNnTkVZOHMxbVMr?=
 =?utf-8?Q?wa2+Y3/xuFtN3dn+iBXjVdNLbaJIde7YjGIcj2X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816cf052-18fa-48f5-c7e8-08d97388824e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:53:58.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuuVGh0MV2sASbA9cITYHrOTlquO4rkV681HECJ65Ol9C75xRb48z7N6LWUP12g8yQUzecIVG+y7g2wLyeNUMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 09.09.2021 13:48, Oleksandr Andrushchenko wrote:
> On 09.09.21 12:21, Jan Beulich wrote:
>> For the bit in question, where the goal appears to be to have hardware
>> hold the OR of guest and host values, an approach similar to that used
>> for some of the MSI / MSI-X bits might be chosen: Maintain guest and
>> host bits in software, and update hardware (at least) when the
>> effective resulting value changes. A complicating fact here is, though,
>> that unlike for the MSI / MSI-X bits here Dom0 (pciback or its PCI
>> susbstem) may also have a view on what the setting ought to be.
> 
> The bigger question here is what can we take as the reference for INTx
> bit, e.g. if Dom0 didn't enable/configured the device being passed through
> than its COMMAND register may still be in after reset state and IMO there is
> no guarantee it has the values we can say are "as host wants them"

In the absence of Dom0 controlling the device, I think we ought to take
Xen's view as the "host" one. Which will want the bit set at least as
long as either MSI or MSI-X is enabled for the device.

Jan


