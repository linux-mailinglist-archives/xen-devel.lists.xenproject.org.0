Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C35393E6
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339799.564705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3jm-0007cC-Dp; Tue, 31 May 2022 15:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339799.564705; Tue, 31 May 2022 15:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3jm-0007Zl-95; Tue, 31 May 2022 15:24:50 +0000
Received: by outflank-mailman (input) for mailman id 339799;
 Tue, 31 May 2022 15:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw3jk-0007Zf-QC
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:24:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce62c22d-e0f5-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 17:24:47 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-Q2GDql4qOHC12voHXuGANw-1; Tue, 31 May 2022 17:24:43 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7400.eurprd04.prod.outlook.com (2603:10a6:10:1b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:24:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 15:24:41 +0000
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
X-Inumbo-ID: ce62c22d-e0f5-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654010687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjklcfaR88s4NlQvNtqCPvVeyqSk2X5x4BS25Bw1FvY=;
	b=l3UW5u7DP7BH5S5FQYVNYnCJ7nsLsKCn1XOduYjZUAeIYT7xJ7AF6ra/uv3EmLVAlILReS
	vtyeRjKM/HA7GZDVYltC0vWZ7A9PEbOWlp19E8PZ7DK616c7xZyKTJWtaSuoVHCDFPWrzE
	c2wPL5a2ekwqRzfL8oLPCNAqCgSmQE0=
X-MC-Unique: Q2GDql4qOHC12voHXuGANw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcb/hifkokMXg8BHNIvhJK2sREnlxKq6tXIktUOKVuCpPXTmcywQrFHLHJ6PdxyuwQtZ1wha9AaNkWJG8A7/JG4HqdVIlN26E4R0V0hn3r+f1EWqYkj1DJOS7j5QcO6csmzfXU1mvNhxUACNdxSxfX/hlaY0wqtySzHrvifOI5dxbOaK0RiNNhqiFCjFNaazkZy9MYK0uRwITJAVKJ74tpXiY+9SonKP/VXV0WBUMM8tDWYfq1NYDZWnO+dCX5n6cyavsAhaQWVFkxXI4803dxlFALF5VP/637p9ql2ADIXv+GngQNZIEz4WQ82m9nEmSNJnc1wGo+gTXdvKvAcpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoBP46remYpKdGDxjL5PUvGN+MnUbVlVnLxc2Kbq3sM=;
 b=asAWeqV2dX995abquAxFXIwHTTFYEBoqszVo8JCYfi/Em3B91jmqc9dYAnDRFFzVYoAcuJaYCLCAMZ+q8NnR/MYOegz7/EmeS/7X5PSalMxVF1IgF+fID9De338ciPdyzz0EeheyyiBQEDvEmdEXkmVG5IwcyDqyLekMyjTTFzVyL0JC6rzl8frCJULfj3MPheTjMhyP1gRoK4Dx8EicqIHu0WO05m2g2D9he4/yVDJomgaDhwBk+2Q/PwcNjkhunthUGAqw6gToo5NC3/3YEYZFDwOMjjVOTOKLSIyp9zbcetiTj0Q+2s6gx5TogeDp8q4EgJ2TQuzJ/W9jzmrCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e818ecc3-ae4d-f636-353e-6bce07bcee9a@suse.com>
Date: Tue, 31 May 2022 17:24:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
 <20220531145646.10062-2-dpsmith@apertussolutions.com>
 <73072b2b-0cb8-6a7e-04fe-11dd2085e9ad@suse.com>
 <28239bb1-686f-af94-0e38-b2e056c8acc6@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28239bb1-686f-af94-0e38-b2e056c8acc6@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d6a1782-6eb6-48fe-b6d0-08da4319aee3
X-MS-TrafficTypeDiagnostic: DBAPR04MB7400:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB74007D6EEA017AC542920F7DB3DC9@DBAPR04MB7400.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CFpCwf5WcsGv7oW38tw2O1rr77Z1dmUKZEtTdzxJAll/7Ab4nn+KHxMSwDnd3/lLPHUr5A/JVoZDzZYLKh7EJN6Z1Bd64guVQobVaPgcfChORR6ehl8Pn+eK/LCD+sAFocIgRmMSm3RRcKybmVtuanujILz9tNRW3kj7DnXElYGYMjO6BsAUSPlHo4B5FrEH6RdfZftsuV/vfGT30bYzKqnik+WgpKRFNzfo5jSAPjFaXR3FtxL1ZbisZKogSjE3aSUzBJFgV0ENGI/i5n8kPSsFZ59dsAAvA2DMgWP9xBuAQXE2vr9Pxre9Stq1afAL8COyGSXm1HSLEADi2nt9ahvBWivMlFsyqqH0mDmxBTnQ8QY++IoBHw6vlBXw5QEmtQQRGPRjCDyTb/xU2QS7KuebAavpJb31E0kStiSZro+pcUwoxov7Amz6lj3kv0mOM5rA/RbYLb/t27K2g5ZTGZ3k2M8JwUJypqMiicOEWwxRn+tYc4vhkiov2hpeYVGPqe8X9MsPehxxfHevVMQOwUWdKS+FqrFEa53JSMNNzGERYTnZUm9zcaG6XrbrHvSKJgbk+jmS5audMXEiVH7iWdC+D3Hs1NfLBipfUnv4drSsQttfnjmOGCSeab32Qwjx5OnT1LaCQ/RrYDn94QTY32fQCFnOP6XmmQus5NpWSVXnOZhNxiJi8NdU3/6haA6HhXPaC9a8b7WOxHLEcA3q0gHa+Xt2ywP90WJ0a5p0mgwpw5kY1wReaYaCBxN6LG05
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(66476007)(66556008)(4326008)(8676002)(53546011)(6512007)(31696002)(26005)(6506007)(2906002)(6666004)(508600001)(83380400001)(8936002)(6486002)(6916009)(5660300002)(7416002)(2616005)(36756003)(186003)(54906003)(31686004)(316002)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+wnTHPiLgCjXBBj8izmrjv0IkdIffL73qtxaRLcUvY152iaygIWY3k245j89?=
 =?us-ascii?Q?WA7u7OU/1ciRqQX4kKMJ/ClMyoMslpGtLG7GmbwSKsZ74StD7bopL3FsjK6U?=
 =?us-ascii?Q?GBXtcxEak+W1YBTnineo0HDlQS4lkfxub1MccDNokiwWDRovK0aVLVXjmqQj?=
 =?us-ascii?Q?Q37p5zUpHYyY/cCR8ujHjQ3/u3i2EtHURcBamge2qh8B+uQ6NmIos/YOMizP?=
 =?us-ascii?Q?+q8bOx6w774PwrqEu2uQhSLB+MWYTIAuD+NuBMdYjsqf84JNz7z0iKJ1+DbU?=
 =?us-ascii?Q?1bNJ/JNJZZjNJLEG5Da1FRVm28c2KPIMKgUHttid18FFPfobqdCXGokHdINr?=
 =?us-ascii?Q?TImAPkUpkAc9uaXuuEZIlfDlMkYRfdWWr+eAEvWjlnpkUShY71e/7doyHjx4?=
 =?us-ascii?Q?0wKPnm3GMELPIn1YJkaUsRo8+Jkv0WI6HJ0jgL4jSqn5no03pUlBfC8LDgYf?=
 =?us-ascii?Q?gzMvPdBKjtjbTc0ODsNqAhd2zEUuCcKzTsLit31fREGlZs7hkF0Y+1U5Fyv/?=
 =?us-ascii?Q?DmbJrQT2mq1AKmdj0sAnjnUn2f5diD/6kDK+wayaFoLyo2V6RV/Qes5KSVIK?=
 =?us-ascii?Q?yvSzX827W3kAaIvIc8ABrJhkNsz9xS/Rk4UMdDLpyQ0LoyhvaQWyAASVI/Jb?=
 =?us-ascii?Q?5bwJkbzkaogV28KXMDJmgXAj2uVEsCAtf81eCW/kCxKcFnoLvkg0l2mK+60M?=
 =?us-ascii?Q?XwTz3/U5cEVZh7RkQdq7adeER2URIzV93oiJlVqMeAWRHf2+1gRJ2CgJAeHl?=
 =?us-ascii?Q?FMOnSXmLQPRE4Is/rxvQTJRiwt1qo1448nTXRbIiiMIGn7t+1kcBrShd4Ria?=
 =?us-ascii?Q?HncNqquT+2ej7Gc1/6GUGWetGRYIEn+7o+iR+B1nX39I12mfNRefltD8fMn0?=
 =?us-ascii?Q?E5EXW/MOBVLcUNyDSyBRXZNxmn6mqEhonXvm0V6CG2ZbHTqth9HZhu4MsBMK?=
 =?us-ascii?Q?NGKrGsuvVFcKPbk86ZiskK+4irmtTlBpM1wTFgQ+cgvvP9KGncLoYglzJJqb?=
 =?us-ascii?Q?KrgRJkbfRDhk3F7DCH9gV1sBNqmdyTKK6P9HUMg/2/aOYEc2niU8c8+FviVP?=
 =?us-ascii?Q?yWSUVw+WStJ4YMbb5PVQE9qVEIMO2bnuV9yQywPFmdrhZWjIolLq0enAgLjb?=
 =?us-ascii?Q?URjWl93lR32BdSOgpZUq1JeLCOlx3+s0BLljjy+VJcRdIYJ+jCEF9muk36FF?=
 =?us-ascii?Q?Fz7GnJlLjR1CurTGbwAf4NOZvK3F13A+YuLUmDgAc1g8XIxJX7UkLzwBkT6/?=
 =?us-ascii?Q?0xWQ500e4uTKwMmgV93Eq77n1lnYVCmExTtERkzKLQa2wIy3hvDBLQ1JmBPx?=
 =?us-ascii?Q?IwSZ2BqC6wwjx3mTzGJR0OriXUmGWa/aKMEiNfAokvCHmogpC/E1CubGTdZf?=
 =?us-ascii?Q?0YPgCuGd/duq4Wr+SFqOQvYRgGlY8AlsCPabaX3VTbmGyocFgkkcl0/J+/sr?=
 =?us-ascii?Q?VBPWDdz1WISMix5MKoCHJUmnnb17i4rTt4E3fcYTP8eI1DXLMeVceNbBuPMe?=
 =?us-ascii?Q?B4kEkJVcSGGDdbIVoSK6WluPaeVwqIvpeAcC6rclv91wO84HJvtUQW8UZ3rn?=
 =?us-ascii?Q?hqu6E2iSZTmveTcfv29EbzcneS0NMG4tXI6/odjXABVBsbfcn/LTBDofCqdo?=
 =?us-ascii?Q?R/0McogI1iJMFw4/P77GhZxxjO0gmokdHNSvOIQg2NLyGvJfnRrzQX62yJ4T?=
 =?us-ascii?Q?e/fTt8Mfb/vd41h186QKmrl0WeSDMe9DtHU/mp/6BrLToFm6et2Cfz3thL1r?=
 =?us-ascii?Q?3LTeQwGHYw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6a1782-6eb6-48fe-b6d0-08da4319aee3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:24:41.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnVyCQtvj3eWO5EIz4QqvvGfAZ/7J34KwX7F7j6CePzcdDAT4pb8wdy26ofokT/j+7xw3QwaCt7He/3ALqSF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7400

On 31.05.2022 17:19, Daniel P. Smith wrote:
>=20
> On 5/31/22 11:16, Jan Beulich wrote:
>> On 31.05.2022 16:56, Daniel P. Smith wrote:
>>> There are new capabilities, dom0less and hyperlaunch, that introduce in=
ternal
>>> hypervisor logic, which needs to make resource allocation calls that ar=
e
>>> protected by XSM access checks. The need for these resource allocations=
 are
>>> necessary for dom0less and hyperlaunch when they are constructing the i=
nitial
>>> domain(s). =C2=A0This creates an issue as a subset of the hypervisor co=
de is
>>> executed under a system domain, the idle domain, that is represented by=
 a
>>> per-CPU non-privileged struct domain. To enable these new capabilities =
to
>>> function correctly but in a controlled manner, this commit changes the =
idle
>>> system domain to be created as a privileged domain under the default po=
licy and
>>> demoted before transitioning to running. A new XSM hook,
>>> xsm_set_system_active(), is introduced to allow each XSM policy type to=
 demote
>>> the idle domain appropriately for that policy type. In the case of SILO=
, it
>>> inherits the default policy's hook for xsm_set_system_active().
>>>
>>> For flask, a stub is added to ensure that flask policy system will func=
tion
>>> correctly with this patch until flask is extended with support for star=
ting the
>>> idle domain privileged and properly demoting it on the call to
>>> xsm_set_system_active().
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
>>
>> Hmm, here and on patch 2 you've lost Rahul's R-b and T-b, afaict.
>=20
> erg, you are right, my apologies. Would you like me to respin as v9 to
> get it in there, so it is not lost?

Not sure; much depends on who would commit this if this ends up being
the final version. (If you re-send, I'd suggest v8.1 rather than v9.)

Jan


