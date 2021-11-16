Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AF4536C6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226417.391293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0xS-00078R-7V; Tue, 16 Nov 2021 16:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226417.391293; Tue, 16 Nov 2021 16:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0xS-00075d-3i; Tue, 16 Nov 2021 16:05:18 +0000
Received: by outflank-mailman (input) for mailman id 226417;
 Tue, 16 Nov 2021 16:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mn0xQ-00075X-LN
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:05:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc55a7f5-46f6-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 17:05:15 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-CgIaZ9rnMdy5VO-1RffNDg-2; Tue, 16 Nov 2021 17:05:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 16:05:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:05:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0024.eurprd03.prod.outlook.com (2603:10a6:20b:468::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 16:05:08 +0000
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
X-Inumbo-ID: fc55a7f5-46f6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637078715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whQ4I7PyIUrwvkOZICqYXl52m8YRR/9/eF0wu5gh0Qg=;
	b=WJ1Gcms7hDqMC3EM6z5V0Pp2k23EirTAQYLl8+GqvwY8QuIhPmIpU8t83afW2Oslr8NeyH
	OWZ5QiGJPVOlExwD8d8KRAXnBV3OZgvxxczNwxSn99pDDUlvDVdM1ZRHRXyCtKDSFIYOaW
	NDqRv1VB7j5qnqjT53jxPS2aZ/bmvzc=
X-MC-Unique: CgIaZ9rnMdy5VO-1RffNDg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtrjlPbCAsa4mown8CHTFajQwlJKAO5vWkgfAgYupuCgsLbKsJ8YLTxeVYqyx9Fok/2/UkjI0vXCQK+NG+KpkyJtzD75gICjDayvwHTbxFagtY4TXi+9GMehCqqtjIO13gijof8O4KIMBTRaqCzD01zUnLS/lphBuMHhnbSdS7U/IjzrJFWXMNCb3zIhzQeAa6cVkq1ObgcO0xbrmFsvJRqZRI2uuCvr+kE/D4lP4kmO7VkYyVM4HmF1lSc6fqL7zbCYbAaMnNlttlZRQKdmCn2LXv476FZQ7gFsfwcbtV/fI2SwgjVHudPpoLj4sOMq6csoPs3aSYUunFPfovEIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+HHqtJ/rLiT0XwV72sxXskxC5NtUpOCHakEVJwbD6A=;
 b=gq82RvSva6j7WVp4ZG297mVEJLF1FgZOHIKuPf5M35DMOnQyCAiqkf83BPxs/1UfCg6D0y+mMcal9vFbUwL6sKHt4JgN5fg5SSxf/YYDna8MvyFHwdEKPZ3qn0AQcEH7hgHIQyZkyLLwzksZh+2BRN76FPYJ2UxmTj4uFWwOIbqAFHiQlB9aPScKgj0IkWLhd4dmdYUmSOqRQbwB54Yw/QK+wAr9fG72e23ziBmptAXNOXXtv+tm4+qDYx3ZpA/HibINIJN2FZG/hVLe5PrmOxewPGR+y/AI5JLLddpHpCP97tQ/FVnk7POzYHkdTafh0Pl98M57Ge1KGfRSQ03z0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6de136f-a1b9-2643-3858-9cd3d76e6f57@suse.com>
Date: Tue, 16 Nov 2021 17:05:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: linux@weissschuh.net, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20211116143323.18866-1-jgross@suse.com>
 <f80f3207-363d-51b7-4ae0-e4b8aeb2544b@suse.com>
 <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b155f66d-8259-ba87-62c4-ce8a0f7ed82f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 267772d3-ac1c-4a4e-25a1-08d9a91adccd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167A2181544473B99D9ED48B3999@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DEIXAoC57jiJPuhXnkXmEQf7fELKxDYo1/7Pl83Yc36ZQDKXI3yQCBEbVUXM8CoydK1wnWNo9IEZx71ZFKjGha8U/dmKz8NDcNcAgdP7g3r01u5N2alFRORJ+xYKK864/MPBgU/mzDVbz5a94LRVjBwJgKU3A161JE/yH+Qr/fEBM/lMfXi2jU6BQJMaO1wCJzcyk0v1rzZR4vNvFctj3feYFeu1rUwAMTx8YnhBI6s1P3U2Lg6PNgLHaldGJQVrlBiDmZDy49RdYwDroDDTBlZ5nN0DRUtl2bx7anZeTlA6rHja3giGfwwVYmdLeRg+LeFrUJnLnYVJzyqKYrBOu5eKFsMymuCgEaeaNDmTOr+7qDxvtIBCbvoA4Sjs6/I2XCVNcwje94f3C+TUX5u+NPi1Bd+EHa7D6Vc+tSbNu2P8joLVWZMkKUd7yLYube5oT7D/pzD0MIM9C9YsnOzslcQ08JCRXQH2Tsz9sREy1G7PMUcKlpyp00zYMHnx2gWWOJSM+paMyxchJ7HGCv9RACdb4+4DgWpI3I+LkMVNB1LQ8BvILn5vOobw2ff42TFthbVBFGUudN/36syvPcotwfGdejIsn/2zk9Tsl/BuHoyD1/kP29lhyAL9W9pskGZzqnz1mWQcWCPyWKmsU0lF0slYltVs7JdFcOyN3g6dhnOXSEdemc9GSt9ePl2mg1uOunvmIs5cnXlYNrbPKpeoCoT8igM7+p1KlQqj917g+Hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(38100700002)(8676002)(6636002)(5660300002)(2616005)(8936002)(956004)(86362001)(2906002)(26005)(37006003)(66556008)(36756003)(508600001)(66946007)(66476007)(54906003)(6486002)(16576012)(31696002)(186003)(6862004)(31686004)(53546011)(83380400001)(66574015)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7IzTLla7wwRwB6aywf2soUYQNmQY9Sg9sLtQ2spUClLpJjLLsjlCAcn/7Wn?=
 =?us-ascii?Q?aufnYqsy9Yi8UhlO27c+lmSEvvVNr9m8Jl7HyUJnRwmTpfz8IfoRk0VLD7Ui?=
 =?us-ascii?Q?6TACxBDPQQCmyIkw88soA1BHzwe1ywP/ZgK2YnzyFnVho5hxVLaf+wSRgH+v?=
 =?us-ascii?Q?ceHPU3EhFRvxMVeuNr0rmdXslSid//F3jhQMitNoou3OaHlIMDqGzJUMLXY2?=
 =?us-ascii?Q?X3LTsWR7r77p0XnhSB7zRDUA8KYT/BvSyivdOwDbH+2wXtX3bqoiXUct8k7O?=
 =?us-ascii?Q?/hfAjmpRlTTJCyXffB4DhGPTr01AuuPhk9wRIIim4GCAjkjIBj4ef/ly1us8?=
 =?us-ascii?Q?uMoP7lfHDxhqFV/EvMiigRdFMACZDBjNSgi2UH4KQ9yIb5Rgzs1EcCqMuw3I?=
 =?us-ascii?Q?2ZD8LyXhncdPdRQuXJ3sKj6lZmuiFUKWFGvI6NkkiIji84qZ+fog0hxMB11B?=
 =?us-ascii?Q?Bdy6+afp9CfK7uDZxJIzXyHo4obIBXHXVum837v4wIC8SefV7VJwYIb0l+l8?=
 =?us-ascii?Q?+jOmTeVyOhmtbxM5ck/7il1H+RyDQTRKrLVk7zixDpRqdlXeL+OyLYDbmQuJ?=
 =?us-ascii?Q?2UoeyFjEWMGsWYcM3r9I/m8TPmvqQB5ZqrlYMK8k8w2YO6aFy7lvZ1Y5cYIZ?=
 =?us-ascii?Q?COyhymTs2ld6w+0Xrchs5qtRijh+pHuF6tHX+X2u7sVGYWAr+oaA/EIFuGDB?=
 =?us-ascii?Q?VYghJ11pjXqMQCdo5ryTK6VbPuvs1yzlvu10DPjIqBSvZO0MhFkgFBmgY+p2?=
 =?us-ascii?Q?h6Y2Q+dvDAixxahCcNPgBd2JbCOLdFP2AEqHaSuPbwh+fy06b4H3FfSgy9mA?=
 =?us-ascii?Q?yUS+VRtYVyxd16L9GPBfddm0yR6vLl56oSKPOOpGXDta+B7vNLb8MVzw3ege?=
 =?us-ascii?Q?T16ePuZj7aElUCGP2x7iLDujYn+zIsGwLbGNvhaKu6ET9RDN/FQndYj8/ps/?=
 =?us-ascii?Q?+laLGyKul1GApgQEDgdPNlvUxBTjO4tNZlY8Stqp9Utx0D0wdLrxYubhX7ov?=
 =?us-ascii?Q?DT6psoevi8D3OKjWOVxSsFOmqeU3Nb8pgJ86f6EUd0HUZK8T4jb3srUZgvgF?=
 =?us-ascii?Q?Mc25Hm/Bxf7xEWCjeOoOoOo6B81ljaLrRkbEaJHElY2mYUfrhywiC55PyPwn?=
 =?us-ascii?Q?CTYjXvHAhEcpbJBUzr1TKehMZDeBViCb+FzkDO8W4No5d9AOMQXcjc2pgNQO?=
 =?us-ascii?Q?eQLVYh3OrkHiCnFDt8ojfZ1HNQ/x765nGepU6NIk/vVWZGKlIJqHwLSavdxQ?=
 =?us-ascii?Q?pRCTeJ0hnaUTkW0/2OD3JSDdl/D8LFjaLs1nih9M0LaDX2oiPQmZ37O+ayvN?=
 =?us-ascii?Q?72QUkEaRI7DOF/qZX/sS9lvczujL23eKLBhXHBgWGV3JG7uQKoUA32HMuCFZ?=
 =?us-ascii?Q?J/c4ACYTCM/7ecOFP0Doyejp6AjSk0tLKz8ttkMDqdELrHQ3DR1G7Uu0+X2r?=
 =?us-ascii?Q?yj2JCXTDQjvlmWRVMeqXysaiQDeU31DumEgxENMupDNClnOA2Zefrh30Caki?=
 =?us-ascii?Q?PystYgNrCKQmY71k3t9iuKp6ef5E3LPdB9Wo33Z2JANvR/Jfqy2GVLtn3ZFI?=
 =?us-ascii?Q?Viib08t5wBk13GKHVCfws8RavX6Osia3Ks7uWlOJxXeqkHYRLcU/UXeo0+KJ?=
 =?us-ascii?Q?8HSQhiWzm6YF1qzMOVJXlsY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267772d3-ac1c-4a4e-25a1-08d9a91adccd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:05:08.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28Uq11oYECyIKnX4lpzng1iaA4nc5IpRvaC/EMN6Np5BZDoy1q6nNr1rxYCDJRhWKwUMz6NteCOmFymrMfng1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 16.11.2021 16:01, Juergen Gross wrote:
> On 16.11.21 15:55, Jan Beulich wrote:
>> On 16.11.2021 15:33, Juergen Gross wrote:
>>> This configuration option provides a misc device as an API to userspace=
.
>>> Make this API usable without having to select the module as a transitiv=
e
>>> dependency.
>>>
>>> This also fixes an issue where localyesconfig would select
>>> CONFIG_XEN_PRIVCMD=3Dm because it was not visible and defaulted to
>>> building as module.
>>>
>>> Based-on-patch-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> --- a/drivers/xen/Kconfig
>>> +++ b/drivers/xen/Kconfig
>>> @@ -259,9 +259,14 @@ config XEN_SCSI_BACKEND
>>>   	  if guests need generic access to SCSI devices.
>>>  =20
>>>   config XEN_PRIVCMD
>>> -	tristate
>>> +	tristate "Xen hypercall passthrough driver"
>>>   	depends on XEN
>>>   	default m
>>> +	help
>>> +	  The hypercall passthrough driver allows user land programs to perfo=
rm
>>
>> Maybe worth adding "privileged" here? Albeit of course that's different
>> from the use of the word ...
>=20
> I guess you mean "... allows privileged user programs ..." (another
> variant might be "The privileged hypercall passthrough ...")?

The former, yes.

Jan


