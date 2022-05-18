Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56652B8E5
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 13:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332044.555687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrI1H-00064u-Lq; Wed, 18 May 2022 11:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332044.555687; Wed, 18 May 2022 11:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrI1H-00062a-Hk; Wed, 18 May 2022 11:39:11 +0000
Received: by outflank-mailman (input) for mailman id 332044;
 Wed, 18 May 2022 11:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrI1F-00062U-Bq
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 11:39:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b8ee29-d69f-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 13:39:08 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-cohQZRBqOzeE9PeN1wVS4A-1; Wed, 18 May 2022 13:39:06 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 11:39:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 11:39:04 +0000
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
X-Inumbo-ID: 20b8ee29-d69f-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652873947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xdyt7VXZgVdxcKH0N0AKRiKVoVy1tV7Pb639WALY7Rg=;
	b=ZjYa1BjhTfS8W1gWLbQgWbrSzTp7rP1SANAigoqaJSmuKCoe65R/27X/Wfe4eXgm6D1aDH
	BoqfT0mUpuCJ1v57qM2CqGgqKN18UPWBRKerKxksjB0hWp2rSIyjO5NSFenWCnE12An9TJ
	HuRbnYhJhjQrFecBOWQe+sgd7jpvHC0=
X-MC-Unique: cohQZRBqOzeE9PeN1wVS4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSR267e/49cLFTRg2yx3eukQMK2ZNphC04AeEnXivQIMNvBzF2Q2TMAUXqOUtUblMAGTbVgVsRkcHO2P0ZeQqYkRhfrvHLH45w6WvoHfBc9Z0XnaVj/JhxyPf6k9oGuySJGDT2QBAvSkOTkZYjUo33MbblQTj9mzBtGaJmz1xxtz5YK6/QqO3HKJHROGCahAGR5B/p5FLOawX9tak6yxi9ihPMMQqkiYTf1H22J/InVfuycjSOUg4T8ZErNBWjskwuOQilMEeyjW8IeNkpWMg3nsgVGVZmY5ytfNgkj94N7YWo2kNbEv2qVgjoaaUYcGoEsIt7SMIt69ckoLnFA+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn2ZofV4HJ/GMwAnBn02Iq3rnuCRMchLnpkXWNfy4P8=;
 b=Zb/kycdwLV69iem1+k771CLGZlKpvAoHyiPgoXzjaWYYwUeU3ZmM1pxoJemNIlkbNxmoSUHtfjgKyqxc/2nlo8AJ+ypJBHhXv/J/9xk6a7lKrerASmLabbCiAPYIrx+n44dbQm7fbAsf+YWS9sSv/8pO7abIQHVtsYyEjQaB6xVETHqs7dloyzFHvG3VXn4g4RgeN6XT1euZ1yBdQw5Tj+rFycamDKZEQlz0EVYyqsdcftdd0H18lF/AEy7voAVWIAXrXhdJ/wHCjSk2dH1OvXfuuJp+AFho85epnw5XJarQwopUIc9IXy593D36RdkdVehPD93RI+pkU2bc22u3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e13a592e-5405-6a09-a902-51fd3ffe11e3@suse.com>
Date: Wed, 18 May 2022 13:39:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 19/21] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cd077dac-c53c-3369-03db-f2e4260ee94f@suse.com>
 <Ynu+qM0o6VsaDEfJ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ynu+qM0o6VsaDEfJ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0724.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5036768-9913-46fb-deeb-08da38c302ee
X-MS-TrafficTypeDiagnostic: AM9PR04MB7634:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7634F59218F9A8B52B82DACEB3D19@AM9PR04MB7634.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6YcfPm6pDzKORy7S+g20BkCo9rScs1JfUumjMnFOf2C8TWDhwzZm5A+fuannAxdFSJjrGb3BaBIAwsejemny5IRci1wqvJa6/3PYVqIjiAEowCfh6gfu284+kRjfgUxFdQVzp4G//SL5xsKMZMrNuLohWMWvoB0SDUW/xX3BF6uH7Rew7f3JZyVlRVrNMfwVo364Wgkw3n+SfWf/K85oexrdcoEdwbdC1SGvlzFl0ToqXGLiCxo4Iq3f0fnWEFjQ+yJlx6Hacn8r6NudJKZxcaf1g28Ah7hwnoUTy1j5TNQ7KDW56rSkI3evUxFaYOaRmB+jSXJXz1ZnqAuZd3yc5fvzuVrxlsrSR47ybMOKmXZTp9vuyAOhVGabw2YdF92EgLsM1z7Amae/aZA+xtPzeLEF1mDPFVxgyxQbXBi1rfRaTDnReA6qet0Y0a4/TR1vlxPydzli5qco57BXkpSA0/+6LcwkNNCIiysnUCbUt/98cTv+SEhPRSSTnlrsfcGqnouAOIsWjnHsCnNQpugM6v5A850CfipofOJ/hbleiSkoxVULO0Hiuj7KrkwjM04zHe40P0sDjP9ziKV2NpXFl2R6nR42igFh7B3ykdCAbSy8jcHnq3tr63YTMBhBL3Y9oTCjKPf+H+3vqmxji/EdsKkE7bJn1cGRRkGnHd1jK+mcELUBJA/uRVrr5DDFXEddpjDVMxu0EyTZwVazYTKykhRdN9p7pxp8nt2lWQMnfUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(31686004)(53546011)(66556008)(508600001)(6486002)(6506007)(38100700002)(6512007)(36756003)(8676002)(4326008)(54906003)(316002)(6916009)(26005)(2906002)(8936002)(86362001)(186003)(2616005)(31696002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wg94gziotFCXGBR5WpdDC251o+I55eJV/6HYJIFuTsfM38I6Hba01Fjxdiz7?=
 =?us-ascii?Q?YC4GU7NIYYgp4Iw3935sq4ORQQdlzjBkCCd3C0dcFjTXaS9kVrkZA7SHq1Ml?=
 =?us-ascii?Q?1kUVh+dUVBbZZLopukd+rTfK3/QNrqOcc4QS89E4ti47n371gSr5LpFFHYLD?=
 =?us-ascii?Q?4DuKGHkMIrJecUiJyOLimHsqBDS7bhbcVbXjx318lCGy96NQk72QNAC1CwgW?=
 =?us-ascii?Q?SUcVOm1PDMUEIa+gdEXoeHIzdhJOAtYU1mvUjrd3Kzd4GXOd6h8rAfWqx7IB?=
 =?us-ascii?Q?4opmS9mUT8lyXSOwF/TaRz2/YMlVpSI6/Ze3KOkKPzPO/mC5Flzl389V3FLY?=
 =?us-ascii?Q?fH6J+LKyQqPlPjcGda1unJ8mJWDre/ZIQvnlN5fqZhHFQqgn76XCNHqN88mw?=
 =?us-ascii?Q?0RF7wijzANxvad1QemzbBEwctqEJEqHk/aSpgMTJrbLq8hIrBiKWWjAnWe2p?=
 =?us-ascii?Q?TmXtA++1v1mBWFJzv1juOWA3ce8lZKO6yeEXFCrSBbPpywH9dS5FWo7AKjqO?=
 =?us-ascii?Q?iLNC1dZs5ZSj6/0S0MBoqVMNYfm7MFhINfYo7s1+DIE5NGwN6MjxGdvlRRcw?=
 =?us-ascii?Q?OfjEsZs5HyAmAQ149r3Jip/ojk/Yfr2aYbHxYR/0Swt2kKgw/JTspRGNMckF?=
 =?us-ascii?Q?bepmt/w0RVGfMBue1t1Rj6uAfLtLflLP5bA7PTtyrwTMqYTPbVtNiQWZ3ke4?=
 =?us-ascii?Q?s6ec6CrFHNX6Dnt4kYNI94hZypFafXHMuCM3Nl/84tBjiR0CrVjVaygCsV30?=
 =?us-ascii?Q?vEuhUSKsblmrqyzeUuoMgdD0qpoBfzMUx1GT2EaGDDZbkQcWqiNc+jpbcvbD?=
 =?us-ascii?Q?djd5SJqp9YHkEkzCYXqx8h8yHQsVs88mAuSsJIu/2Kex6NIv6NjXZmJSXwoF?=
 =?us-ascii?Q?XWsczQXziroilmM5SBUnDdobiRJwt618lkCDBycJlVDKZijJA4RLcpcR6KTL?=
 =?us-ascii?Q?CBdtpSM4+fjylKn6naps8XosiERotu2V19ssALdQCOThB+j5ypZY+aIEPSYO?=
 =?us-ascii?Q?Xo+lwySEs+Y8hKR75oNMngIAkg33V5XBJ4oFUBEi2gb86OZC0c6+gLRVFRwt?=
 =?us-ascii?Q?9OEPO0iwxcyEDczZT/wCrtjFddYYb1BC+ZO8ZrH6VZxx7YOHXmXNzFrHKPyC?=
 =?us-ascii?Q?vXH5lNEdVaQYSysvthN4kWC0QSN3d1QMfo0LFMHYu6FWL1HMsYNQ6PEQ5YKx?=
 =?us-ascii?Q?RWZh17a/VJ+v8rHfyxM4hHF2fci1k7zRLcRDfOKKH3W6pKdcBhFLqLT6KKI+?=
 =?us-ascii?Q?kCkrTOV3kimkg4CwoSQFKlnyP4lZWr2k9mxfRbk25/Jaj4bYr9oMR86AYwo3?=
 =?us-ascii?Q?0nlZZeNyGZL41fbwC7ganRlTLbloAJ/ZKkt/gBMVGemxi2wfk7FCSouVD32t?=
 =?us-ascii?Q?pooruUjKt84F6xohdj84nqy279rstoTgQP74rcxNqqtMgw3c4o0WKoQzwt7n?=
 =?us-ascii?Q?J61Iezs9Aek2slCKTOtKPms4l2xRFTEaMLXX4cURWxBSnmAglMR+jeoaWdbo?=
 =?us-ascii?Q?MrmFFfAobmWTdYWJclEjnNxQ0ujL/IB9Kub/MN/Ztj4yQVk8StAxk4YL9fX2?=
 =?us-ascii?Q?Ye9bEMLzjfDL0oJblVTsq2kUjmLPRcLsm5h/6NA0m34Rsd4uuJ99WabQzerj?=
 =?us-ascii?Q?UvwLcKo9+pRXm/L4t3rLIFD+iYslTtJQGEoFqrk6bRnMcrmWOSFhvFvlf2MZ?=
 =?us-ascii?Q?vGq6rR9RYMgOC24ocvMAAjeGnsgbn07yk8NH/qRyVJAEQ8diNklDO3eN4Aau?=
 =?us-ascii?Q?dlweu7skIg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5036768-9913-46fb-deeb-08da38c302ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 11:39:04.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upmh98E2p9du/rLZzftKZuOv35G7ChSYcs5VHDTDHEiSTCmNjkP/W1jlcOmNI6t2ZZX6rIFkITx/NN9f8ZqJ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

On 11.05.2022 15:48, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:44:11AM +0200, Jan Beulich wrote:
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin tian <kevin.tian@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> Would be helpful to also have those per-guest I think.

Perhaps, but we don't have per-guest counter infrastructure, do we?

Jan


