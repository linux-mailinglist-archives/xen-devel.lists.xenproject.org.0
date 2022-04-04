Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37484F142D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298303.508122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLMt-00028I-69; Mon, 04 Apr 2022 11:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298303.508122; Mon, 04 Apr 2022 11:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLMt-000257-2N; Mon, 04 Apr 2022 11:59:35 +0000
Received: by outflank-mailman (input) for mailman id 298303;
 Mon, 04 Apr 2022 11:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbLMq-000251-Os
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:59:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc687df-b40e-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 13:59:31 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-KQwK-yiGObCNKEx2XMbUww-1; Mon, 04 Apr 2022 13:59:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7333.eurprd04.prod.outlook.com (2603:10a6:10:1b2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 11:59:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 11:59:28 +0000
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
X-Inumbo-ID: afc687df-b40e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649073571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SaEaNWNoyN0DoMKLTs7uxEr8L7UBTN6jBcP3HtuAtI=;
	b=fnEBlesaG187GFywNGKpxNEb5xSwubHDqRDunUsNsCZlopkyVlJ6sAL8KlCHjiBRtGr/o0
	+R0OVGoSYp4c3Opd6SSw4CXEWT5EPwnewNrCtqTL3VhdMmDGJboeC0lptyjfQlOsZe2jMr
	Z8BftXhWmOKiOnDm94KJHeFSPmtFSko=
X-MC-Unique: KQwK-yiGObCNKEx2XMbUww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmYOiIDe/VmY9Wj5ICR6yJvIkoc9He3sXlEom4TAIBZWC2yMxOypuhgV47Wd/lj7gvYX3aryrK8Xj7Nk5xz5IWl/p5KigCgFqnIwsMYE4Q5eXl8HNPst9PMlSxbvFzcg1L6LSuK+JYa6cXshU5tOISsAN0n5AccMN+2vsK+F/1cBk+l3PjWK/B5cmELDTEVdFP13BAfZt2t5jKPCg78PEOgeUkZQnspuz4wuORs3VCeMuLvm1QBhSFbgAVSMQo7MNon8NY6EINMQz3vMAkGdDcmOHlZ1owKFllqEI95O57E8KnRr1HQStt/exIRMlmqpFihm8QiLU36O4VRtslx5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+gnQXSiO+emOGmhfMkkLu+WcLM4o9eWK594FRLHyHE=;
 b=jSOv/Oe0j7R9TCduxwJ3r/B1AS9/3vm5QS9Ts3XYrJ02IXqQz0XwebSQVjt2GU9PtSqSUi+XJBTQk/xkKro0CQzrGIMF3VKuVTPaiPQ21pRWos7duntKzpqXW/kJM+yPLaAGQMXUsxZxWYBXR7LaQR1k8nQR3BQfAVgOLdZNH1jrg12m07enbI+wqFpH1IknMnnBW6ESqSehSoFuUNEym7RbxzC3O5m7pQppEv905HkUjtojZD5FBvx2BIRd3VSzKJeyMljW0XKYMaEKmtM0lUknpcSJ6HdvNUmT0csjFMiY4Qx6lr0Axzg+1cxNKlmpuEzNS3V7RpveofFQ4lnwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46c3f2b3-85f9-5de3-d4da-5a2e761d4c24@suse.com>
Date: Mon, 4 Apr 2022 13:59:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 02/14] x86/P2M: introduce p2m_{add,remove}_page()
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <c8ad290d-65ba-8437-276b-5d5f1d4d225b@suse.com>
 <AE149C77-2D93-4DEE-8D03-925CD6744519@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AE149C77-2D93-4DEE-8D03-925CD6744519@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f23e87eb-ff9c-4ec3-15b0-08da163291f9
X-MS-TrafficTypeDiagnostic: DBAPR04MB7333:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB73331FF6B1C70EB800EA2C9CB3E59@DBAPR04MB7333.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qa8sDjpa4txd5oDudiSm/jGsdXW1uXmMSpF6KApVLa/OofxQ/CAD7Dby2SztlN5/8BSk2zHp801NxGFCOAaMRrcaQnfvpKOW7W0E4Bwfy+iYkvDUdot27tmul90Vous5gV/WEXi61C1ZFN6KV+jdNQtBblYK30Ijjp+pHhMmZAEucmzYmvImSAgFmXf0t7JiU+ebdVLHbT091cBT9JMmIq7GwExfIMCa416Tf/496mssqxyWWxc3jBi5iL3xKcT+NtQkSnysnl6pAplCNLHjw4uSiB4yc6M7hrICjhyL/v4qMHIrlXUBooWA/lhGSZmbzG6ZexnBEYtBMDwUnx6ZYWieHULBmXvR6i+qmSwHaB8n5Xqv3r2BM//kCiPmTckEpv5Xl9KnttlfzGaXz3QNfSXDGyaRpMxN+A6/oBFFccuGnjjMkCL17gCI3/5oywL0MdqPrPjNBOcXVTARPnMZnNBmmuWYyGs+GN9C4GAFMlLzROiOUywJY399Q14mkjSuVbfmwtvVLjlNBlgBeaJBRltSo5LHGcxvrYmnT2/5sS6N/uwAmKDp0nOVP1bAJNMYQxMWpO/lxtDXumgwnLSFLaXi39m91eSlN0uzmRd5lJw3myMe0KRu4v/97RdR8qXv3U/4zN0wqNUIQzI604LBszv7SobM2bzis6IScUVayltWqtB9snyoEWrf9aT88O6G7cmQAAVKNv4NEdB7533h/3880TqQ0zt6sz9/xgWCp1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6512007)(6486002)(2616005)(8936002)(86362001)(38100700002)(31696002)(6506007)(53546011)(2906002)(4744005)(508600001)(66556008)(26005)(186003)(316002)(4326008)(36756003)(8676002)(54906003)(66946007)(31686004)(6916009)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m7dEiHo6QnMCbZnANaT4VgzJiwzxnuSbxqSDlXmooufaAuWa5/8nUEZeOjAW?=
 =?us-ascii?Q?x68t8B7KiIT7ISXtE4cWB6m/7Ox1PaOlNXxu2LkOV80D3hQnQKwCsyq8tIZS?=
 =?us-ascii?Q?Juc4vKUP4D42E80gZQQ5LP4NAUuTg0/eN7N67mrlDi0puSW4gqbq4kSOHxBQ?=
 =?us-ascii?Q?nttr++yWsb6Gpnwl1CG9i1Uudhg17ZFQJYUyBoeBlOz7Xm/FmqaWidgO5qKa?=
 =?us-ascii?Q?qhGc4oBHbveuRLOeUu7p06rKFb1HxeCBvf6AVnVuA7/1YSLI2XRjRK1f0ImT?=
 =?us-ascii?Q?eY1XHnW2H0QBHXZKlrR6q4eBsxF+D6MnVJ0Xyg2RgiAzxjQkTDfC+JGoTh9Z?=
 =?us-ascii?Q?/jHAro2Oaz4pK3Yhq3JHxV96IpYKkzZ8Go3RlC/YEvshdhEaVf32KMB6HEY6?=
 =?us-ascii?Q?fJfrqWzwl1wtkhIz6IIbvNgCcADzWG7MT5LMwdLOjjF/TnK6tps4uTkyop5K?=
 =?us-ascii?Q?hPSqwXkN7i5J9AJiRcU5cJ/nKSTh9el3rzoyIxrDEwbu9mwTOBhLWIpWGR4t?=
 =?us-ascii?Q?zRGtP8hSpTbMyXQgxalCXrccByJZtnB8KI7HW9+9VKm43QznuEl8lCnQbYWq?=
 =?us-ascii?Q?r2fFuhwtFhv5Vhu2FVMTG4+d23Uh5hFEbZJm6kOl8f5FTZancGc0bqUtzWnp?=
 =?us-ascii?Q?zmlQAZgyOMVAC4qHWC4iv1VSFnXX9iyo8fgVEX3lx2rkbXEaFeUVhyv9Ki3R?=
 =?us-ascii?Q?wrbuql/Yyf+KPfF7w6aCaZ1JGuvvwHC9dGynd5FOpp5R5vMHp0OONJ5mA1fa?=
 =?us-ascii?Q?Jem/qxhViRHYRP69OJ6tBhVy6W4+Y3g1RbGQHJAYUaiFKbCfsTLFNhOW39oo?=
 =?us-ascii?Q?PmJRy4uyLmQv2X2LZqPWOL65xWNwnVww2QFoEFF0YG06oUZLXU137Dr+aBDb?=
 =?us-ascii?Q?OkVGA4VcOUTc9slLz0ZwTNx6cXNJdGUoRh2z8pkqszRN9sHhyZYybyEKH99H?=
 =?us-ascii?Q?xnWDXGrnPfCxE76T+C+t8aTXG/62XLNM4TQbxpHAgK8vYSknyaYiH9FEw4yV?=
 =?us-ascii?Q?Aj+evMBbsNtkVeMEw9ZbMBOwpTvC59/iykUF43Uh0XiszGmhKCpUGvU4YW6Y?=
 =?us-ascii?Q?occqXNPHjDFihuYOVfEQdx1dgyx65y4eH9MNrzlu9hmG9TCtUh8tcDM/uA/i?=
 =?us-ascii?Q?BgW20XGvHzeHOW3nf4cra6nE9naeJgfeaFy+aP2nmaDkzXUeu2+TVRgMUTQz?=
 =?us-ascii?Q?4b9YcBksic2XgOXVUBl1IiU9XhnmazfyYgIEVm1uCHI1ter+UoWSWWXHWQdG?=
 =?us-ascii?Q?sYUcnCWZSairXKslgmZUf6yuKE6hUTP4evVM3YRaJ6kIqb00eME9B7wfzNNT?=
 =?us-ascii?Q?ijrM4G1uMh+uHXryEuZHy3ukZ4C8w/kLIko2SNWniV8AXSDy3zrV4D69yGy7?=
 =?us-ascii?Q?vz7dJA/nHfK+qzkgo0qg8Yg1IRQwGAO3KipoobUpzfVsYctfNy0uMoa71rAy?=
 =?us-ascii?Q?Oe2QB/ziBo4e35phx4VDJ1TY/c1WtsDDfa2/ye1zulyIZIqPCYrFr+fRcv0e?=
 =?us-ascii?Q?SDlRV+wXvb8PmSBlG3ztZ9MUy3oZtK3KctM4Ryl1Lyoel65Kv8zevEqW0b39?=
 =?us-ascii?Q?deCBbEaZudgosLvGTJxwmxb56IvPi17uhvwWZnQTPArzFxZ9umzjMi/zjiLP?=
 =?us-ascii?Q?7MFgRLMinB0tlXjPSKCHcQTAfQSK0xsgbKe37naNecw5qbM8IfeogCTj4842?=
 =?us-ascii?Q?pbuVFUFBDTeRvozKip6JBh8Fv9fJbxxGC1zTdJhm86RDqz4T7P3dfIUzaqBo?=
 =?us-ascii?Q?Xd8TEjoukA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23e87eb-ff9c-4ec3-15b0-08da163291f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 11:59:28.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxDgTb4RqQTuXsdlaXjaVvcrOhyV8x2QHxVQUDdO/O92D5k0yRRqn8EwkwEAEeNISlgaDstlgvlO8ah8PBE1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7333

On 01.04.2022 14:02, George Dunlap wrote:
>> On Feb 23, 2022, at 3:58 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> Rename guest_physmap_add_entry() to p2m_add_page(); make
>> guest_physmap_remove_page() a trivial wrapper around p2m_remove_page().
>> This way callers can use suitable pairs of functions (previously
>> violated by hvm/grant_table.c).
>>
>> In HVM-specific code further avoid going through the guest_physmap_*()
>> layer, and instead use the two new/renamed functions directly.
>>
>> Ultimately the goal is to have guest_physmap_...() functions cover all
>> types of guests, but p2m_...() dealing only with translated ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> Description reads much better to me =E2=80=94 thanks!

Well - thanks to you, as iirc it is largely based on your suggestion.

> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks.

Jan


