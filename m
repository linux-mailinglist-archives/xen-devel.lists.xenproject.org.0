Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4B4E2278
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292810.497246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDi0-00070G-TI; Mon, 21 Mar 2022 08:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292810.497246; Mon, 21 Mar 2022 08:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDi0-0006yR-Pl; Mon, 21 Mar 2022 08:48:12 +0000
Received: by outflank-mailman (input) for mailman id 292810;
 Mon, 21 Mar 2022 08:48:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWDhz-0006yK-JV
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:48:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b89d96-a8f3-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 09:48:10 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-FXOgr9BvNBmGZphQ7gVVFw-1; Mon, 21 Mar 2022 09:48:08 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3362.eurprd04.prod.outlook.com (2603:10a6:208:26::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 08:48:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:48:06 +0000
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
X-Inumbo-ID: a2b89d96-a8f3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647852490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiG1GcGYfMsd7mWxX9j1ZoaOXKnuTxprSE38Z1XhgRk=;
	b=hC1FYDFzbUGTftyVp1SpPHIOFPfKyAHHiT1Ji4gB5R9sTvtbndBVaoo5x/UrftTWrWvwts
	dE4d/w5FV5YvtdmSjBVa7A8VubJ2Cy5+kKvIZNhReI3znrWwonaRZUl4fwbeq81j2UI35X
	TRRHavFnN/89ojpQI37q+5Npzmo6BRk=
X-MC-Unique: FXOgr9BvNBmGZphQ7gVVFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZT47uXf5gdX6VJnn6J7jsCqMBSVZghQvyyYmjnbxQwEIPD4IVHEFqRhIpcIyU3u0AAdv/XCUCaEBY5p6QSan167Qc8iXSgVeUBAf0JrJfwpXYgxfBCkyKMSMNt7DuAoikZQHi9XxWM3cI7o8GwYvblay90EKIai4/YBzo9gMH7pSX1FKaDzQrz5EC+tTev7JFw3s4s9sQETwgwGQq+zCDNIyKOot7+veXg5jlOeUqNbgN3rzBc4PixoSQ7j8Vp4H3ZMifFIp2rubzZlXWaToBZnEH1QAkLlhuRpuxiuIfY/H3pkS+s1HDZ2OMIxk3M6RaHR52YKNuQjzWZjAvRgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiG1GcGYfMsd7mWxX9j1ZoaOXKnuTxprSE38Z1XhgRk=;
 b=fMn3xhlRh9j40FwrBBGC982W0kUrPeZ4fDMyeTAiC3rX3Bople8e88nMUipUOK0OCYJhGnlx9XFpyB12OCH6fDopqXwSBqMDUjx88q9QZEmzdBaH2hdw1b3w2byJ/VgH4Yfwy82/6Y7uB+flXg+7R63zblaLkzTZQo+BW3CpBT+LZEZydV6AmPK1TvBCWjjr/WfGuirArUGc7y5NBJvWIRDmdh3mVe4tDBFkvB8yISwj5oJJx710lwN9pN0hBMU3yl2+Hu0yKLFozHMfhdJjE4fWrwqv1V1PpYvcgdX520Ekvso0l3dzdzilmJ5wUnhdJ8rW3Eit2htmrV8wzUivJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
Date: Mon, 21 Mar 2022 09:48:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>, nd@arm.com,
 Penny Zheng <penzhe01@a011292.shanghai.arm.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
 <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b796a58d-7a59-4517-7f12-08da0b1784c8
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3362:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB336239B7E93EBB73A4283C17B3169@AM0PR0402MB3362.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K0innPqqRLwwKztWvjo6YLxYbyw5nhERvdUz3N9OFOkXmgnFzje5Fi+SDMCWZlDMxEejNxRu0n5qOm8/hyzsBRGJ6j8XOTSGe+WRim9b+HsXvqlUy0cI9ISmH7Os76O/umXguAVKF4+V4MBQ1aqaWJvjawlkyYERI9fDyWQGXUcjrUkDW1uq1O83/Yp6MlJOdg5D1Jai1RPxT9l/4yxi3kF22gD791tYDpbZzx1qw284iuUuNHnWoOB+qzvGWszLm6cOHFUFOPmLNaBXytbBfW2muLHW7CaSDa4ABl7dqctBgGS5dCIQkl7Ea0HWWp6GYuJYRUTfk/YiTV2+KCcbwL2EikNc0E6fhuE9EfyasJDiNebBpN87Wm+exVE4OK2VBJ08J/+bhBOk5kCzWuIoGQGbLE/RSwbvZPDav91NBDsN9nORCoCpNR0BEGulqQQRj6qLOvLPO2bSGU5gifkt+KSyiQWcwbKmw2BlI9PiCipn1XK5z1RhwAJsotxHYjjj4ovqB98VbFn2akjOGH16brFjLmxH1KfqE7gEmkIuizs1SAr6KiAiRI1/ytpQQZT0nz+ALigm5nu1QPo/xun/n1+cffXqlQMn460QmirKpJf4ox/YT7j4DJVt07gxsv02ivo4awLVI4dILcVTwM6+7kvdCARi02stf/kXdgdvLRRFcSyV9u2uT0KH8emR2MPcSqSCwMGOs3aH85wCKfZPCETDBOR20LNsq67MJIog97uWg5qf+BcUP3LyaugChI3D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(8676002)(66946007)(4326008)(2906002)(38100700002)(36756003)(53546011)(31686004)(83380400001)(6512007)(508600001)(6506007)(6486002)(186003)(6916009)(54906003)(5660300002)(7416002)(26005)(316002)(86362001)(31696002)(2616005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCtxMXd5WC82ZytEa0J2RzB4aTFVOW9xaFozR09EQ2JVVmxLQmZRV0tJSnNx?=
 =?utf-8?B?Qys5cHArakhEREhFb0gzSTd5SHFvYnZLUnc2Vm1XZFlYSGtDQWc0WkJnb2V1?=
 =?utf-8?B?SUxqYmRJZ0xTWjNVa0dZZC93UzNENUFOanRUQ2V5d0JkcGd5Zng3N0J3d1Zx?=
 =?utf-8?B?YkVYRHR2ZDZOQXV2aExUYlNEaENOazJYN09MclpKbGlkVHo5ZW1sZjRHTmgy?=
 =?utf-8?B?VXh1bzRsYjd2b1YxTWZIWkhpZndwRnB3L3FQa091Mi81SGJhZTVXMFFqVG10?=
 =?utf-8?B?alp4OHkzZ1JNZzFoRlo0ZHhOMWZlQ3JwSCtwY2x3L3NJRjB3YUkrNUYzRUdl?=
 =?utf-8?B?ZmloUWM4RmZwcUNIbmVkTkVCMDRmRHpDMEFTbStVY0JnQ1RzenVZejBIdnZm?=
 =?utf-8?B?RjYwdWpvVm5JeE51cXB3SmV5MHhnL0orekF5ajhlVktibGFGakFtZlFpVTZq?=
 =?utf-8?B?UmdwYVZHWFMxUDY0WWgxUFVnOWtRdlVBc2hKYVo1aHpxQTV0VUpjYjFXU3JM?=
 =?utf-8?B?dWd5b0dKZFlrTmpEdVdoejVoSnRsQS9uY2RnZTJLOEtKMVhPOGlMZ2tLS3Z6?=
 =?utf-8?B?TStoMmJ2RjB6bWNDalhkSUpYeGVNNHp1S3pNMUt5aW4vVVZsSldOcFZIaHpl?=
 =?utf-8?B?b3ZkKzUwZXNvbFpDVmNHQVFCTUJVS0RzWWtBZGs2bU1zNG9BUUFmNGhKT0o4?=
 =?utf-8?B?bWk5ZGtMaGhjZDRVUFpKQTdnV243dGR5ZzJCZ0RmU2tvZWMrVE1MYmJWQXl5?=
 =?utf-8?B?aHFvZWtzYXArMnNieE8wY0hCQmEzcXV4MDBKVmNVYU14QlQ1bnh0ODVZaUN3?=
 =?utf-8?B?MTZPZVBQdEtVMzN5UnFpaXlOc1RDSmh3TXdOYXBoUXJwTmZFOWZzV0d1L1NS?=
 =?utf-8?B?eXhoenhOMFlBWFg0Q3JjOS9rb3ltT0FTUzdRaSsxRTdTWTBXZXJVRTNNamtO?=
 =?utf-8?B?dmd0aFRYM1g2OWFEM1FrbUxGbWFseDlLbldCQjBwaUlWNXlJTmVCN043NEIr?=
 =?utf-8?B?NGpHbFFwNi9LWTZjaEx5WHB2Z1h1dm5KU3FBOUJOS3UxSWVVb2NLS3hVc0VB?=
 =?utf-8?B?TWlZQ1FxNnRCSWhiK2ZrNnlMQUZHUHNUSDNYWnlZSnpFNzZvcDRuU2ttUjBx?=
 =?utf-8?B?UmV4WlNicmFtZXdDM0FmbHF3d01Ld0FzVVhnUzBUbXJnVVZ3TmRwV0tSS2Rr?=
 =?utf-8?B?OUgxdXhmbDFMZFZZa21XRUNCQkVkWGJFMDh0NWhFcEVqTTh6bko2SCtNNHJR?=
 =?utf-8?B?VjZObld6VUJxNHBoYUNadU9ybFZjSkNBYWZDUTV6R2o5cWtRbHBVbzB0RXlp?=
 =?utf-8?B?KzZNZWdVVjdVSmFSTVEzM2lJei9ldm9Kcm5HeEZWMUxUeVJFQzdCanoyd05F?=
 =?utf-8?B?NzJ2eHBydSs5QUlRTlNvTnVGYnk1WHlCVmp5UTdUTXBBR3cvYUFiVmdwTVNG?=
 =?utf-8?B?c2ZjYitLSFNQS2oxNTVZelRrd0E0MDV1SW1rWUVQSDM5dHZrS1BLa3l3dTJ1?=
 =?utf-8?B?d0ZhUHg3MWhUbkJJQXVrRnlEeVdiVEV3VmFoU0xqYzBwbEhMZWR3RC9FK1py?=
 =?utf-8?B?ZDdpcG5uVmtHMVUxZ2NMdkJ6MFMrMDlTOGpzalZGbGZPWGZmSnZTUFFGeDFF?=
 =?utf-8?B?NzJaUzA2ZDlpa1R1S1Q5bG93WFlkYTNZU2JVWnI5RW94Yy9OQ3lXUUdjbzNG?=
 =?utf-8?B?NEM5UzhnTGRCUHlLWEppR1U0Um1RNXBXYU4yV2JSNVhhSnlFRFZYMERoTyt6?=
 =?utf-8?B?aEdJRHh6eEtjamxrSUw0ckpPUi9zNXo3QlF4WDFrbHAvekFnK3hYUzArRDNr?=
 =?utf-8?B?TTlPcldzc2h4eWNsQ0pQV25KWGdLQ2ZseGV1djRYNW96aUlrYUdKbzBnZWxV?=
 =?utf-8?B?eVRrN24wVnlBRjYwQnBHVUtXTldueHRvYlYrc2ZEUzgvQjRaMkdWWHZSTlZt?=
 =?utf-8?Q?2p5Fb1Ay4SIKQYfXhvCjKw+rO83Luo1x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b796a58d-7a59-4517-7f12-08da0b1784c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:48:06.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ck8etY0+X+M4aH84G8vMqwruRplU4xtiHtzQ6+wi236kmA6hrbi+fm0gzQ2rkQWJsnh+LLVG4x9sHewqF3hYmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3362

On 18.03.2022 22:50, Stefano Stabellini wrote:
> On Fri, 18 Mar 2022, Jan Beulich wrote:
>> On 11.03.2022 07:11, Penny Zheng wrote:
>>> In case to own statically shared pages when owner domain is not
>>> explicitly defined, this commits propose a special domain DOMID_SHARED,
>>> and we assign it 0x7FF5, as one of the system domains.
>>>
>>> Statically shared memory reuses the same way of initialization with static
>>> memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
>>> related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).
>>>
>>> We intends to do shared domain creation after setup_virt_paging so shared
>>> domain could successfully do p2m initialization.
>>
>> There's nothing said here, in the earlier patch, or in the cover letter
>> about the security aspects of this. There is a reason we haven't been
>> allowing arbitrary, un-supervised sharing of memory between domains. It
>> wants clarifying why e.g. grants aren't an option to achieve what you
>> need, and how you mean to establish which domains are / aren't permitted
>> to access any individual page owned by this domain.
> 
> 
> I'll let Penny write a full reply but I'll chime in to try to help with
> the explanation.
> 
> This is not arbitrary un-supervised sharing of memory between domains,
> which indeed is concerning.
> 
> This is statically-configured, supervised by the system configurator,
> sharing of memory between domains.
> 
> And in fact safety (which is just a different aspect of security) is one
> of the primary goals for this work.
> 
> In safety-critical environments, it is not considered safe to
> dynamically change important configurations at runtime. Everything
> should be statically defined and statically verified.
> 
> In this case, if the system configuration knows a priori that there are
> only 2 VM and they need to communication over shared memory, it is safer
> to pre-configure the shared memory at build time rather than let the VMs
> attempt to share memory at runtime. It is faster too.
> 
> The only way to trigger this static shared memory configuration should
> be via device tree, which is at the same level as the XSM rules
> themselves.
> 
> Hopefully I made things clearer and not murkier :-)

It adds some helpful background, yes, but at the same time it doesn't
address the security concern at all: How are access permissions
managed when the owning domain is a special one? I haven't spotted
any recording of the domains which are actually permitted to map /
access the pages in questions. (But of course I also only looked at
non-Arm-specific code. I'd expect such code not to live in arch-
specific files.)

Jan


