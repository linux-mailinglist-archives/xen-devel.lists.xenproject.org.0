Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E6B4A749A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264332.457398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHZo-00083a-Ta; Wed, 02 Feb 2022 15:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264332.457398; Wed, 02 Feb 2022 15:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHZo-00081C-Q8; Wed, 02 Feb 2022 15:29:44 +0000
Received: by outflank-mailman (input) for mailman id 264332;
 Wed, 02 Feb 2022 15:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFHZo-000816-6g
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:29:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1895a3b-843c-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 16:29:42 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-D687-Jn0OKq2wVFXdMj0aw-1; Wed, 02 Feb 2022 16:29:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4249.eurprd04.prod.outlook.com (2603:10a6:5:19::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 15:29:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:29:39 +0000
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
X-Inumbo-ID: f1895a3b-843c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643815782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TptP1pfm7DD/12XIWwHI552QXwohCJKla0Qt31WDE1E=;
	b=UcmsMuZftLrfOewdg3g3huZfBrY8aOz6fQJJOIvONUhjg6jUA1HmAeCDWOuNuxnXvUZdRT
	tw8da2lT3fZoY8511MAxA/+5ogAjAhQpibFsbizn60gc/lnspFrqi1QFahzilDKAI+hqaN
	phTbCsVtO93x3yxmBT24BH+jxszwYcs=
X-MC-Unique: D687-Jn0OKq2wVFXdMj0aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz0xSPbLXva2fjgNbe5TSioDlLCHM1RyEGMEAlTn4huVewklL91Gx3/pzJlmQ6KKKM9w0o05eXoZF/rFm1GwagjqT2ntjjePFqK3Cv+DkMFdpyLkaKZhoTmBIubTNbkMe4CwA5VozRjrC5cQSbdEkMwCxR1rASypShNOb5rOfWBxpImN3UWftnbBF+n6d6x6XYthej3g0EjHd6PYT39zmk88ppie1RJd5TUX+1Emf4V5LPbzWR1VJSXmyAn6vg37Wq9bQFVas1i8ZXwZRrSoVM8zWQKKc3runHNn1ZeOZwzW3Y/GdSLiKiGeyt7aA6a7BlWpzxgBP0k/9lMOXYE9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KY+SS1IYWFi1LjRPIQdaTJLaih+KVVlSXmR3CEpSGw=;
 b=bgfdsaLp9YuQb7llvpyiri+q2+vV6H4Iq7RYJPAw/5MX6d3O3yroXXJT1V8YiEpj8F4YFqndQG0YbFMFM1j0Rql0u8/46xOZmSUptskeUDmqVABGzuHszcLACbaDzUIhE8R0mEpoJ5yO8S6/63LdCQk993xwy3VwB7Bg98Etx1b3BIG8qGcPSV97W8pcez9qNAUlvFWj1h9NT5kX96ooJ8aRHSTrwJNvxNnZ8psdv9dHLUHOi/MS124ABJRJdNou1aRQ5V2N6DixMwr2TxmVWnK/QeFRH/ATOddH38dC2ZIf203SMTW3uPZUAXkV9lss2LjKkJwXmEElrrdwPNBfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a325d1e-85e0-09ea-e2ab-f0aae123d4c9@suse.com>
Date: Wed, 2 Feb 2022 16:29:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
 <Yfqf5jiO0cHjR6gR@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yfqf5jiO0cHjR6gR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0104.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 597d6a37-56c2-47a4-37da-08d9e660d3db
X-MS-TrafficTypeDiagnostic: DB7PR04MB4249:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4249720F99C42EF90FFCE291B3279@DB7PR04MB4249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8WlC91kKqkSbXVG8TDDyz8pBK9pNae+yau6w+9ufQ359NsSvjMfn7/eK6hI1qkV3lDipBQDXI8cxedXnzsr7EtXpl2HpHYGxC6x70D6vjnGlx7YtTZgyFVChAhJ8gkRW3TU3oHhq/sI0HR365/WJkuSVjrKhnwkOS8MoDmysTkLY0vWBglzraHKIpJT7IsYdy0ZTt/76DoLMw3d21bFF4jDOmdnpxLFsBwq/hYqHeZ/RFb9aY+Ul4MC2v+dE/pVjR0bn8kzvSCrmgh7/+m2p2DicIL4ApgvsL5CMsi//1zhwm1rewpBOVuZOzbUSQf9TqE7r12wFBapedY/zIpDOsshN2NvSzj3ksbzmV9q+zf81ut17BogcG7g3BnRNU/aBZZ9atYsrpN36i/fazRcb3DGrmfvG3arK6xlYXqZtHjXT21ib1NuTUHyVwGYTa4jV01oqkPZBBPo/RF4/RLB09d6DzQs44vdgr8VcFyj6hQNYvmvy6til7MRwNZwKdL+2ePJ3Ji6ofKkRzbRWFsrbBa9lDngOHdM4cMj8ivr+h1/thM4gbMKx7MQckHb73J89nlHA7IxqFBCeIfmnXUfJbGJT6qh6FrwSfpKSHqMfx/g5yxgtnGvgc2AllB6CVIr4ENaAAao7ppNOysxO3y1UsHUrUZJ3p6ceiq3z1F5QFfGwe0nA6oCWn5FBO3eI5ajknIeONsEy06gfpspVbMqOGB/mKMbk3EGARVuX4gCYq6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(31696002)(2616005)(6512007)(8936002)(86362001)(66946007)(66476007)(4326008)(26005)(2906002)(5660300002)(66556008)(4744005)(186003)(53546011)(6506007)(38100700002)(31686004)(6486002)(508600001)(316002)(36756003)(54906003)(6916009)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AL3sp1YwllGAregOUkcLMfychvLPAFjmdIyPNsnqJDYsxEUJe8/T8QH4G99S?=
 =?us-ascii?Q?F0OALqc6+Yt8dPo9u38loAAZNm1U+8jrwd/luzFurxwbVSDOELXfAVo1RYJu?=
 =?us-ascii?Q?dN9NJKBuPwDmL2cC4hAx6EgxPKHlP/lOIBdk6pE9/b7R57DFqjq3iIK5koZB?=
 =?us-ascii?Q?NooGTYjCwu021frv8AKM5mLdVRkWUn5OIZGYnqg7/HIz/qO+3Q/VuFi9Z/us?=
 =?us-ascii?Q?DHXsI30UGZHs8EVA0g7LN+L8oQ6C0taTwCrFsk9EWva1t9cAt8ChafzWIHWQ?=
 =?us-ascii?Q?pdVdOxOJV7nWbtAoj7U2+jAMEGYgJB33pBndrBA585hWEK5MpXfO6aVzuSc/?=
 =?us-ascii?Q?zyX64qIPb6gGHitVcztI1TdDeBir4pC5Mom+pT7TT9hjYn7Ni1/JfNEW4OgE?=
 =?us-ascii?Q?BxBNtdkYx++kwbE4yrXvEMWsur6FHeCfuSBtdpqYyKAS0HlGaL68GOp7EBF7?=
 =?us-ascii?Q?qoD5UR/Mc+kz2BJNiPatujYK7+T8NTmyGQlXVWMfUwIw48H7Y2rZ0mAL9fRZ?=
 =?us-ascii?Q?3YFnrPGCG3sDrPcLg1Vwkkk2VhaGi77U43p6ItFHU3DPvNGAJq8p5IEZ/ym3?=
 =?us-ascii?Q?7AXuCuKuJ5/IQZXRDp2t9UpGlTCjPwo0Vqa9b3JlibetZoYKjPxyxCoDoYH4?=
 =?us-ascii?Q?O4CBIE8iXL2jyyseFpuhDdlKzZKKb/9/degS4AamM20CHfBqyE20AhgJy7Of?=
 =?us-ascii?Q?fpYHD8nqHIrww95r5a47swz55tKGxRnbfsoEyng3Q27jfBrkEckvrNmx2qC3?=
 =?us-ascii?Q?IqL/9rv8rY6VZ3RsBbA/QZ0GFrGrjCIMubdKof4JDjNKzeN6GqNqaJ/nDZug?=
 =?us-ascii?Q?X4jhZjC/pVn5DGp09STqVoWmNmc9PetSfKe0ZoP51t78Y/1hEd7CeBPoEyJv?=
 =?us-ascii?Q?9Xc1MeJWdtpkuiAgFbxszDRbEm1CL8tAIsafVXoQyyXmju/ax50oC5LTR5ke?=
 =?us-ascii?Q?jcvvQ/0lPP2Z3Cvxuk+g+Tvt0k4yvcXm32ysAKYs9CPHjTbKV2YmRBzFcsSG?=
 =?us-ascii?Q?Y201coT81c42uWdjX/WnRxZgKGOYXWrq/b97Yd9xL0G5ynTf3Zhub29Yz0wZ?=
 =?us-ascii?Q?3+0iL4PkvaaPb18E9ftSQEs2BUYYbrBCw2cDqHdM4hM5dkCjIJtPLsrsv530?=
 =?us-ascii?Q?SG8uPdxs0lIzwLnKuT1ArIo8yX2aztN27Y7IhbUiigxw9LLqcUx56W+Kt/zb?=
 =?us-ascii?Q?lm9H0mUKQVuzhsq/Scbyq6gYzFgavGth9RkpXXwOt9JL5RSo3XmXr871hK6h?=
 =?us-ascii?Q?86AlRCNBydN2fZmRlIw75OkVfE1oSBZfe0NHI6A+HrLP0Vz+VSlxGwK2B2lI?=
 =?us-ascii?Q?xI/IPCzD1E+cM6orDa7bwWzIsrwCn1wET4xjjN2xu2ThzzN+IMuHEFoJ1b9N?=
 =?us-ascii?Q?mGx0hHQkxo30g7Akc90rwqQfMBSgl2oT/pVHIpiQpdGlYw63OJIm1THoKucb?=
 =?us-ascii?Q?VSjdc1krNDUcSqtpqdwIzpEP+mugRhePw0rgu2lkB32vcCLSThNO3Ph4UNcx?=
 =?us-ascii?Q?y8Ogv6H0WIwtr3zV5xliMzCbR5qZhqb2R3+2JXrr6Yb1F/brs88hsjZc/E71?=
 =?us-ascii?Q?jF3ErhujWVjM6nZSJ6rfptOasc4J7w83jNF4DC/W/cdSTu89kzqOl0S80KIO?=
 =?us-ascii?Q?rJwZeGzzuW6vEn/P2JLbwD0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597d6a37-56c2-47a4-37da-08d9e660d3db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:29:39.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LV/bX4nJyatIrz/vUZg9WxMD1FAVX1ZtLoTx07k0rw/TqdrUXVjMNJ9aif2/es8MwvMuxn20lnYl76rwctr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4249

On 02.02.2022 16:14, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 04, 2022 at 10:41:53AM +0100, Jan Beulich wrote:
>> Do away with the "pod_target_out_unlock" label. In particular by folding
>> if()-s, the logic can be expressed with less code (and no goto-s) this
>> way.
>>
>> Limit scope of "p2m", constifying it at the same time.
>=20
> Is this stale? I cannot find any reference to a p2m variable in the
> chunks below.

Indeed it is, leftover from rebasing over the introduction of
p2m_pod_get_mem_target() in what is now patch 1. Dropped.

Jan


