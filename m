Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AE8445118
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221355.383029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ3M-0005Gn-B1; Thu, 04 Nov 2021 09:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221355.383029; Thu, 04 Nov 2021 09:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ3M-0005E3-7Z; Thu, 04 Nov 2021 09:29:00 +0000
Received: by outflank-mailman (input) for mailman id 221355;
 Thu, 04 Nov 2021 09:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miZ3K-0005Dv-It
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:28:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a29f6c12-3d51-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 10:28:57 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-lKlKu7G1N0OrFGuaCmXytQ-1; Thu, 04 Nov 2021 10:28:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Thu, 4 Nov
 2021 09:28:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:28:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:92::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 09:28:53 +0000
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
X-Inumbo-ID: a29f6c12-3d51-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636018137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49CtYtBMTrJEQjLrxr9q4WUukTfd0TB81+zhmPYcj5s=;
	b=TI6lx2+1ul47ncfXXJBGIajERFlBuBjBqdqu70yJGmZ8BKczo7RfnTQYeppmJsBGsLHgTR
	OGsaTjr3bEzqczr46zgGlQrHgxra/MMWl0nqJjPl9ZAkHdrUBfTpuVFr2+9188S1zuLaY5
	XL0MwyQ1AyCRHIPleRSPztyGmDQ3IUM=
X-MC-Unique: lKlKu7G1N0OrFGuaCmXytQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWQPFL86FWLZihKZrccVusQBOtYgZT6w0v44JMISbK4xLQD1e168mG2gxgoetR+6K01xSN8DybWjsFt9iiiH+CvDCGkJJ/LedNag/mPwrxNK3wHygJONS2uXRoI3dlfFXiRkbuWahEV2g04DlHPRB7JXtB0zCRgm7030FeJe0NjG6fBcojPtfUvkGu2mWT9sdydAr/EB9iIbXGd7iLFW3m7Ofr2lXl5l2GVCm35LxMt/TwNsnQAz+apbG+upPytWOvRycDYhaFfKudf/qpeAZTlWhooVCUHCXv5mEmZ0F0SIpIUsJDLkQXqLnJgoqI5qz3Amh/OFXkICyqidPBD37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE8DEev9toGOWwWTKUArAZjTU0VFhGpTM+F7KvHF0ZE=;
 b=RsXOi02xiEKLKOM2QHwIEE2mVjE8br/IciByK7StTPRaQc9s0a/z73UMdPmQxNQVdv5xzdRXXBpcf2utz/kR68hLw9kLUmvyZQnwsEhhQ4BAdCjTwNAz4A12ivUF4Ndax4Vcz64LnOD5aQLJfFY/jRC4n7KlEGsOI1wmaYf5o1hAKfDoRrjRlSR/7lYrAni56YkOlvCNkxia41RqZ5egVpsdw7KV6syG+dsL0sZTrMNrbSjc8jksd47s5++4BPjnxL8irficTBEm26OnGD7e7ch0LCy6EX29hs6B/teIpx8o/0kUEE+ZweK4keXNkKHpdXj9q/57iH5pMIvpfoUi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b783d157-e8eb-9ba5-c70d-2efb7e426c67@suse.com>
Date: Thu, 4 Nov 2021 10:28:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v5] gnttab: allow setting max version per-domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211103145719.96162-1-roger.pau@citrix.com>
 <e50141eb-f776-4b8d-024d-709614143ce7@suse.com>
 <YYOk8fK5uGeJEBP9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYOk8fK5uGeJEBP9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48a5a79-796c-4264-09e9-08d99f758518
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4944BA88E9142C2CEC7DE62CB38D9@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3TOOUDIcdWB/jEcma4X6lAOY7dwPPIajbDsBS01rabHzvdGbiXCK0WIm1cjkV9ONSW2b2q15K/UyywKA+AOfD10aKGBME4FIHPqMH0u3tH/m8TnXXL+QkT5/dZwJ+zgeLqva0SQydEHo5p3iGDTrV4l3Erc7AeRFyEitnj+vPNPeRy5AoTBooHwm/TCK/Hw5KVj12OlfNKF2rQR4RmFSu1ZBPjrzPfD4HF6rtArYZSTQzKIphbTswhEBuSU2ogDiF2WIJ2sh+pDYfvxGmnASAF3qwi2NWlGFpGiOOQy4LNEeUrU7XAb/Uyim9kyfKcVOO0048hpgy1Z0D5atKTu5z5qf9m9ME+EwG5XUTz2nwVxpgdlU/9ykTQRKSkycLGPjo/ViqE2jr36VCULlHMbYo5kGCpV+900Ba/d0RdTz6+Zq9jarwMkTjzIaNZ2/jEkRs2e1rOtnJ6nh/aAhA5FBt852OrbqII9zcqHOW360Au9SVSUlJX3iP+E6nGvXKV5fj9115cHO/dEkp/cGMyY8lJIpy4TZAYHmS8yCJD8f2t+9dGErEi3m4+Pwe0s3GuXKIq5Fsu2TlRhHS6+FEcwlNIlmhKKoy+jpx5oBdK63GNh1jb6aTefJY+FgBWDFFJVGJl3/M0JTPKEhD5Tw32Grv5Z/cblZNraC/6IgKcPSYpvVQQEKSva7VRPAkwp9/W82teSQICNDvjeH3qBFKukiAEKTg7SERQW8i4U8TfA8uI2/tNFJ/V4z1cnAIJT1Gucn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(38100700002)(86362001)(8936002)(31686004)(5660300002)(31696002)(8676002)(7416002)(26005)(16576012)(66476007)(316002)(4326008)(83380400001)(36756003)(6916009)(186003)(2906002)(508600001)(4744005)(956004)(54906003)(66556008)(66946007)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ssJ54WY8e8QhwChntysP48153A99mRb/0mJX3B7HfsEQ4vzkTbIXNu24on7+?=
 =?us-ascii?Q?7l+i+uv7ViTdUWkmteYaxPdYRhB+RFt8oAxeAMVz4QTSYuCG5sl+Cjm1KVwW?=
 =?us-ascii?Q?xt+xuwDpVteOO2T9xVXckQTkIk4CqyWo2kkY5Mdx7k0tV6Ns6H3oehBwidT2?=
 =?us-ascii?Q?xA1oNzhIjcAm1lxsXF7up7jWDrmvsUv3WS4Tmyn+XEZSIyXIk3YVFAq7ZlyQ?=
 =?us-ascii?Q?80crDBC/a2eZ3QJMZ6npMl7xdfeQ3nvo1ZGe2DPQgtaoQP6nFcu3YXt3pSHm?=
 =?us-ascii?Q?MvjFpVoaCIC4IB5X3o1ISqDwWu0cD14n3sYW4Oqzdztihv9RAE3spvHuUP+B?=
 =?us-ascii?Q?bpDRLrWvo0q49FEJWwz3YFDX9xY3/hdRwrFT9ERvzpcxXv6PsKzeCzTwyMEO?=
 =?us-ascii?Q?KbnzC4xc3qbPc0CMNcdYu45IDeuvqc4n0qm1+B7VSmhXByt+VAFygLOpxGEs?=
 =?us-ascii?Q?87aw0PxlShHBZGDXPQ3FAZiYDVDGJ+iG2xzoDIovTm6sNL+2CqZiY0p5CUMZ?=
 =?us-ascii?Q?JlkNE9HO2y6X4FhLMyHAYOsIvD2LABPulzhrn1z5g8Hb6smF2+5+xEtTCTl+?=
 =?us-ascii?Q?SeAzOYorcSNibqJ6Ktg0LZK8f8FqE9ZMPI0BBMuN3LAT/ZzhKrcTXnzIRDpl?=
 =?us-ascii?Q?9MHaJ7acFlivIXgSWRjjOvajpBspmdfMyTFDLltFDAXkGFe5JGw8rSnRj3Pq?=
 =?us-ascii?Q?MUHdXf4lKd4NM0+OTM4GOti+EfcoMhmfMe6WHqkjuWGp+X/sVrUKmAILcWej?=
 =?us-ascii?Q?L/E+yY7oWSvCsvYkx6b3joM5GANCCA+AK6/nqaRbDgEJRECNFeWEbI0W5GJv?=
 =?us-ascii?Q?BvY4bEyGrN766XEVKnBiJrJhblCe3/9itdZrjW6+6cSJNbfL15HTV+ldAGCM?=
 =?us-ascii?Q?oQyw0XhUL49QyJD8zR0ersqSA79rywG+8uRgMpnQWrJhzUeY66iy7Lh6JNY8?=
 =?us-ascii?Q?7EpkzZraiiOkoBRuiWV8EnEvtocOu4cnS9jNyRwLVlPrx5+1m3HHObKvJzR0?=
 =?us-ascii?Q?t06ZFKL68R5inZhMx7ZMVtCDIWjKFRVF1GB06mfS31cc0qUlo9GSENLpqLBK?=
 =?us-ascii?Q?CJx2XczqCEb7F8z0ZBG2rsNVc9HXtWd+Hq+RG5vuMkanvk/7LEn7PhqwZSlb?=
 =?us-ascii?Q?CmzotU3JbM4vGCD9mp8PvsmjOx2x7HBcPV3zESzMdwaVIj+6tv0ETlYXsi6G?=
 =?us-ascii?Q?3tNCHcEtPieEsBmiRvsRJxFj0EDuQ5ZNz99XqxU5SsxpLrISXku3Lr8WdfqI?=
 =?us-ascii?Q?a/UcrmBziKI5UmtcP9wBHviCZuzHB4Wd9GvhUkGlvDoKOLr5K4iJnKKycoOZ?=
 =?us-ascii?Q?Lqc199XK+2ECM7de8qKql1oyel0Shl0MYGfLaGK48chSfu3X1hiVtQ6Ao4O8?=
 =?us-ascii?Q?F/IsgcRPA9nUSZbnwkmBIvHV7Ue2GD2HEFuYBDH5lcUxvxha6c+gEt/CMEgS?=
 =?us-ascii?Q?usfcaXjTBBynGXhtBDUxfCKX6lmX9BdrtsVvKXkNUZPTJSh4euK6fDomdBhW?=
 =?us-ascii?Q?SOxMhP2weqCS5gaoEpbcY85SKe+W5/gFql6Q0hzozF2ksbnZCfb8oz36ihEF?=
 =?us-ascii?Q?RthH6m3dgiTGE9yk9bIs0ZdkMiNLW6INMRhE6HZSGgU5ieHuZWCmwSuRq+8s?=
 =?us-ascii?Q?q25cueI9WAqmPBCLePUIKZc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48a5a79-796c-4264-09e9-08d99f758518
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:28:54.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3uTQTb+fMq4L6KePc7dWAESdeaYmf4HIGiVs1sUiQQSnAX22paSVGTix0dxTXmgWLf3L+V5gGNybqbY7uUAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 04.11.2021 10:16, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 04, 2021 at 09:55:03AM +0100, Jan Beulich wrote:
>> On 03.11.2021 15:57, Roger Pau Monne wrote:
>>> @@ -69,7 +69,8 @@ int gnttab_acquire_resource(
>>> =20
>>>  static inline int grant_table_init(struct domain *d,
>>>                                     int max_grant_frames,
>>> -                                   int max_maptrack_frames)
>>> +                                   int max_maptrack_frames,
>>> +                                   unsigned int options)
>>>  {
>>>      return 0;
>>>  }
>>
>> While arbitrary table size requests may be okay to ignore here, I'm
>> unsure about the max-version: Requesting v3 is surely an error in any
>> event; I'd even be inclined to suggest requesting v1 or v2 is as
>> well. Adding such a check here looks like it would be compatible with
>> all the other adjustments you're making.
>=20
> I think if the grant table is disabled at build time we should only
> accept version 0 as valid here.

IOW "options" as a whole then wants to be checked against zero.

Jan


