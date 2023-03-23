Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E16C699A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513878.795564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfL64-00053T-DT; Thu, 23 Mar 2023 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513878.795564; Thu, 23 Mar 2023 13:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfL64-00050u-9p; Thu, 23 Mar 2023 13:35:16 +0000
Received: by outflank-mailman (input) for mailman id 513878;
 Thu, 23 Mar 2023 13:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q/IK=7P=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pfL62-00050d-Bx
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:35:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b997a4-c97f-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 14:35:12 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Thu, 23 Mar 2023 13:35:08 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 13:35:08 +0000
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
X-Inumbo-ID: 88b997a4-c97f-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzWWeRM+lRZsGkUFh4yd+v8rC1yULTaaKKfptb/hsYpcCoFSR1s6dcn3KHxFkQ0MJxG7HOTyggUN3pfdEmAH1D+cmFN7N+qaw4jw0GGoeDfw8O5ZxDJyp45FhTJ9M2juUr2P2rbyTBYVLU0t5njwJNYwKNXRu5pjEZgDuhhrM0hTJhiL5jFauLwFZ6XnghB7BfMTFscgigjnug3NPmhgvAXUOMnMyx+/qWobNrDcAfS3Ep09uO7Iv9LRdT7375ao5PVGCABZSzJ6iot6PcCJ3JCpsvyFTMwHCvqbpcp39hnjtxPtAaPhG0bdBzvWh4ZgUl5viqE5yLybw/7op5KxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVIBdSsX7Z7csJ+Rf5IwI5a2FJ5fKi+OEdibwgMdCfM=;
 b=OoXNqogtRA6SAFC08UZt0zPIwEtd1yr7bukMMnMWFvgEjkuN3Tr4qO6S6bF79D10IkoMCBPOBPl/pBv/2+ynN8DNPeFVtIF13UuE1s9j0PCPWJjpN8uJIkncNAU9RV1/M+mAv3bdKzyI3o5PlPmqvxQSLHL5QYc5xA3321rQDpZ7wRs7nvrntdCEPMah6MDCVZvw3EWwFUGwM02FCQ3S3V8zPmCYG0H1kvG1iigZE0baGJEXUDmY79vW1/5/XOJFOGznL+9uGJ0c8ikh2FCjdBCV4CA9vIby2Pbpap2B4E9hrpAZdoejSCqiklYOu0+qZ3izbw62CI+PHKzOw42uOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVIBdSsX7Z7csJ+Rf5IwI5a2FJ5fKi+OEdibwgMdCfM=;
 b=D11zEv76izhc7HKdhVybQmuMO0RwbmJvILT6s8Cekx+FNl9S3gdPw/mpwA97jAQBEpljGpZb9ee2EsCx8Zag/5L48VvsJRIJtB8jWFefOIRBBJ0zN0dnLH5akKXG82bg58zua++NZGeXZiAG/NxQ9tt5SkWVFlqKy8w/IdVepiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 23 Mar 2023 21:34:40 +0800
From: Huang Rui <ray.huang@amd.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBxVcBG5yD74Pa3a@amd.com>
References: <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
 <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
 <ZBwtaceTNvCYksmR@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBwtaceTNvCYksmR@Air-de-Roger>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6aa50f-b3ca-417b-2c2a-08db2ba36aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xg4CdKl6yv/C285ofAuF8QAAbkaYwvkMUPlgAypfQ5OP8gbsdL8UK7SbK+HQtH/wjUQz49Zkaes8dRvJgoMIJwjCNLG52w8jUfJR706vqv6+RP8+TYzbwdQGaAr+n6neapN/Gw8fBA6cMQSdFAh3EMDDwRuZDDFGkMCslk1x8uAjk5FB5/xWsKD5Wj5LMRUkfcS9DeJk/XoPgAvlowlT7VyLYjlDx6tcFdaTUJMW394nX/5nd41svpMjgPkjbWzk/82gigGDw3kfwbqUAVBtXstL7/mKqFln/uHW4ZMfPMjcUgO7fUcd0BntH7lNujA/I4dlyEeRwwnM5uBKNlhq8l03C8/66UInYUjM4u568d+NQ21jacYfIwcluJVgBI45JOdRzcXKcyLCIoKriMgWKrNu/YAhE+y0tke0nqQIZxJWTOTYDXFOh9bZcA/lGTFWTI6bqFyGy621JErwc6SORbufKFuEE+BymRpPp/UY2j+hYvNvLl3OC8udIKqlIDrLkKK7I1dOzFK4me8zUYrt6XIzBDdv0LkpxVLd1zlk0rHrN1xlO3PNi1KMC7Wo2I3c3X+RZJeWk4SQgTH2OPkRBbofkC2uOyB3iNCsu261ra8fGU1Kb9dxlzTBwEDNRKHnEoAD5CVqomSdIAR1pb6j0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199018)(6916009)(4326008)(8676002)(66556008)(66946007)(66476007)(316002)(54906003)(5660300002)(41300700001)(8936002)(53546011)(26005)(6512007)(6506007)(6666004)(186003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003)(38100700002)(2906002)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Xau+HbB7j8nH0L40oYrJtVdGlUpR0lrpypXO/R26EzPLiyCLkro8rUtWnD?=
 =?iso-8859-1?Q?vybi5JVHVpkFlTixzfYZr6EQKOInG+Tm7DZUIsJ5SDf8APM5AIBBu/Z+oq?=
 =?iso-8859-1?Q?4K69TOMaQb3cqEb3KH+SxUmQO+zjYprMVI3/2RuwTslQkK2T0SwAZxG/mD?=
 =?iso-8859-1?Q?DkmlfkaTPxdPWZ3war6ya3p2SNl+x7RZsV1Ii3dxJKdrDEvADnxVuAWoPk?=
 =?iso-8859-1?Q?JldG0noDqOA9NBhQ0uBtysnslNc3+GmkjUDc9Awhlrt50AY6QOOaaMu/uK?=
 =?iso-8859-1?Q?PmfjN4n78i8b1Lx3dTwu96JFMQrxSa8NdByIh0ROx/QiID1gb3GkJn2KFc?=
 =?iso-8859-1?Q?VykQdcfbylJiD7h85gPgyQk5iXXn71CQT1NWNHOFR+PqTjgcnM3JcEpWPJ?=
 =?iso-8859-1?Q?NbQ0tmmxHE+dNH/W95yX8OH8+xF15KUM5UP6j0ot6MRVLFvy4Sa6KgO7u7?=
 =?iso-8859-1?Q?QlkY4bp2o5LwpRJOtMXCG0hSSJDuC4rTkht2nXlAhEVCgDMarqOLhofAY/?=
 =?iso-8859-1?Q?uVbBGyDnjP6uYjFnkB6u2rnpTw6VHb49yuI8umPkhtAO1ibmf7s9GfDzbW?=
 =?iso-8859-1?Q?b7OHY18xsq3p/K4xy2HTDcLEY6BDL3LNMhz9IP2Q9/OweRlRJI6PW7GJyt?=
 =?iso-8859-1?Q?XYL4SN9fiSKOWaztWG9f4yATSmR9APAdid59XPT6wOrBotD3nwZtLn2oLE?=
 =?iso-8859-1?Q?VQin4OISPXF2BwwHhYsTcdoEIBiJkpOl/5cb1Rpxaj0p8qRkfxR5DEap3c?=
 =?iso-8859-1?Q?lS/pzIlWbcpxofeNt+dLiQhzif/hKNwo7qFH7iex4L9rvJMqOlJ6NFypDX?=
 =?iso-8859-1?Q?sKA28EY4BCym6zSi+9JraJrLghGfeycn0lXZiPcg3tk0CoU4l8LW3Hq2K/?=
 =?iso-8859-1?Q?Sbs7316BRqo361EzfWQk0vEOT3P0LqoDGOcDyyIgozPAGys6ag8+ccrgK+?=
 =?iso-8859-1?Q?Jri/yboDlTpPT6O5sTxTP5H3J2aHHsq0/Uups+1ngZG5TWBCIcXww2LNhI?=
 =?iso-8859-1?Q?pHJ0sLmY2p0l4FaEabKs7u+FcAvFyNM9qdFeYgnif0kbL48aZ0gGdWxtSY?=
 =?iso-8859-1?Q?yFhGzIWRqwbZAIsD5t5Pu+lwG+B+c0LrhNNQmvePjc8e6S4a8qTjhA6DjY?=
 =?iso-8859-1?Q?IJJhrNPhLWAQ397tiZ4zuqzSQqRBe/mE+xxizCtiHWqPmaVXqqa84WDm/I?=
 =?iso-8859-1?Q?zQQbNfO7QMQMuZhg5AyQN2VJO7YoWyMidimufW3eCxzXYa83DGOg/nHJbo?=
 =?iso-8859-1?Q?MFkfTC3NTXjxDUcwHeWzCrV9XqSpJ+X95IdAFotiBkQlht3cy27kNj5Jlr?=
 =?iso-8859-1?Q?7eCluSD74QiGZPwOb7GiIAsa/+VFiL5g0hmJw6Vt/dH3Vvv74VAlKqp8yr?=
 =?iso-8859-1?Q?N0jdZ0uICJqVi/9WS7yG3RHZBiiC7kB7NB8nHDvW6XGKWR/o2e4ekSmEyd?=
 =?iso-8859-1?Q?XYMGZrNqgsXqlNdyanI6rCWu+DT5SyxVRQKZqRJlN04Gfz/PdDPKqpUDw8?=
 =?iso-8859-1?Q?V9fjYSrx8EdwL68Rhi07T7J4piiY0UV8neuojtwMCR1kivwM9hYYj1flwh?=
 =?iso-8859-1?Q?hIBtEkvg0zvdXJOY3dYRPcvYlfzjM0osicwu5LCV0DbcignZyMx2YsPE2s?=
 =?iso-8859-1?Q?XJrdN4FQMOPqaf8Uh0AeQgm5ruTIlHQpZ1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6aa50f-b3ca-417b-2c2a-08db2ba36aed
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:35:07.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCsOZ63FCc6ulSAbRl87/XBP2g6qkYUXquUItrLcR5Zezp3oRjaztgDtWeMoES10f9AIskc6FWmvKKH9cCHwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062

On Thu, Mar 23, 2023 at 06:43:53PM +0800, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 01:48:30PM +0100, Jan Beulich wrote:
> > On 22.03.2023 13:33, Huang Rui wrote:
> > > I traced that while we do pci-assignable-add, we will follow below trace to
> > > bind the passthrough device.
> > > 
> > > pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> > > 
> > > Then kernel xen-pciback driver want to add virtual configuration spaces. In
> > > this phase, the bar_write() in xen hypervisor will be called. I still need
> > > a bit more time to figure the exact reason. May I know where the
> > > xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
> > 
> > Any config space access would. And I might guess ...
> > 
> > > [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> > > [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> > > [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> > > [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> > > [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> > > [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> > > [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> > > [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> > > [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> > > [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> > > [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> > > [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> > > [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> > > [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> > > [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> > > [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> > > [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> > > [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> > > [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> > > [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> > > [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> > > [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> > > [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> > > [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> > > [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> > > [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> > > [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> > > [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> > > [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> > > [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> > > [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> > > [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> > > [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> > > [  462.911658] Already setup the GSI :28
> > > [  462.911668] Already map the GSI :28 and IRQ: 115
> > > [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> > > [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> > > [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
> > 
> > ... it is actually the reset here, saving and then restoring config space.
> > If e.g. that restore was done "blindly" (i.e. simply writing fields low to
> > high), then memory decode would be re-enabled before the BARs are written.
> 
> The problem is also that we don't tell vPCI that the device has been
> reset, so the current cached state in pdev->vpci is all out of date
> with the real device state.
> 
> I didn't hit this on my test because the device I was using had no
> reset support.
> 
> I don't think it's feasible for Xen to detect all the possible reset
> methods dom0 might use, as some of those are device specific for
> example.

OK.

> 
> We would have to introduce a new hypercall that clears all vPCI device
> state, PHYSDEVOP_pci_device_reset for example.  This will involve
> adding proper cleanup functions, as the current code in
> vpci_remove_device() only deals with allocated memory (because so far
> devices where not deassigned) but we now also need to make sure
> MSI(-X) interrupts are torn down and freed, and will also require
> removing any mappings of BARs into the dom0 physmap.
> 

Thanks for the suggestion. Let me make the new PHYSDEVOP_pci_device_reset
in the next version instead of current workaround.

The MSI(-X) interrupts doesn't work in our platform, I don't figure the
root cause yet. Could you please elaborate where we should require removing
any mappings of BARs into the dom0 physmap here?

Thanks,
Ray

