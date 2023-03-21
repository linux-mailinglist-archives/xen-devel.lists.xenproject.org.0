Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD86C2A5E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 07:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512209.792014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peVSo-0007uM-Pu; Tue, 21 Mar 2023 06:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512209.792014; Tue, 21 Mar 2023 06:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peVSo-0007s7-Mx; Tue, 21 Mar 2023 06:27:18 +0000
Received: by outflank-mailman (input) for mailman id 512209;
 Tue, 21 Mar 2023 06:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peVSn-0007rz-Tm
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 06:27:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b2995fa-c7b1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 07:27:15 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 06:27:08 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 06:27:08 +0000
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
X-Inumbo-ID: 6b2995fa-c7b1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijX4iDruhMtzse4irA9xX850/whBeNAwRKgo2Kbw1r5IbUXYNgVW/2Nhitz8aIWLgKyJvQHXxtSA0XtyM0XVYLnKbNzoVyKlC3WNLvPBJdAVjQSbLr40jxh6exQy9PpjSJ6/+px2Tx6nZ9Zxs+TWz8IR27SRc9Gbav4THRGC9YMRRX6vaMbSNQlohuUaw7l+Y7vmt7rADZ13ZaQimjUBjTqS6Q/SDgPOmBxt81lIC4XoF8J+CUYDLWwUN05Rys8h/rDHvtw75PQiFGaY6P3l5oLgbMPQZPRVY0BpWOUP9+FVl4DJDQF4lTg4ButiMrckND59i5dUte5rlwmXw0Ndpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy9MYKsv2ZV7QNyvLDQHuWHSm9KeQXfhJouOZGc4auQ=;
 b=lWqkWg0c3tieyuknImN9CAw0kiSxQ5gQzo9aF4Y9ecyniokm/RrKX2Ws9Y1LX/zS/m+ofUTxiSByxFL2jmaJuWUUDWGcLy0LD7G7Lo2nBdezzmWOpW8c0Bfe9J6V36d2j1NeD9asAFRTcTeKOzmK+GWuUwJAS7m7E2vr8KuU8do9C6FlfHdKDImEzsZ27yOwxWfvFOPFaqT35Gg4X9LE0RQGzrVDFU1LW1C5DHvfvVICbDuajbslmnR/14JmWW1hScbHctUk3VwJGlQS7lRozbqwLdmLvFnroq8qDRsCHRpSFUHdpepdSJuvBB1Eocguh2j9jd4uPFzPA0K9TfdKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy9MYKsv2ZV7QNyvLDQHuWHSm9KeQXfhJouOZGc4auQ=;
 b=zg6wolFe5dk1CX76yt5ZyLxAWM5dEdmoSL6g7BEbvonWRaql7XX0xOjAgp7xrI4q8aE+UTXmiWe6cadMOfs6fh6wQuRv/NC8gABFJbkznv+wWVU6Aw856CwlffX0aEW1q7kCev4zhyROEc1KobnsHWw7ysLoXpwCzNtmGv1/DzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 14:26:39 +0800
From: Huang Rui <ray.huang@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [RFC XEN PATCH 1/6] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <ZBlOH/WBueITZnor@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-2-ray.huang@amd.com>
 <682beaa7-736e-432a-3525-1368891641c6@citrix.com>
 <ZA8VNkfHUMjvtUnR@Air-de-Roger>
 <93b735ba-ac00-0190-f8aa-0d85af3b8c13@citrix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93b735ba-ac00-0190-f8aa-0d85af3b8c13@citrix.com>
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: ed733299-8213-4585-ea31-08db29d54ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oiUp239Om2Te54iPA+5qNCwTgV/3chojgi37RVH5De8OxXIILhj9nmRx3T2ZB3wCM+pxiCeeOuQlUjq5TbhveqHrpQrKHu7QcuipyyaESxIxUEfAcJYft+iQT0CqNmtK7OfOm1G/PPkPYy+quI+ogUK6CYKXkIrTRdqzora5pL9b94IWesU8FydOLUHkWxl/TEqfNHqzyR2BN41zFeE0l0RzfZfJwhJr4xoZSUN9a1IdMs6DRRbLDdhh5cT5afy7XlXSdcwUiB5Q1vlGYC/P/d3dcBaGgQqJc9V458haqtDca+TdzD2rfTszR9bNz6h0Ip8vZ8K8oeR6AFnjJ8b4pMhiIr8+ub5dxVHiTlg7u/LSBGDpKhG7zud7Y8nDjAXYw+tMsuG3F4MQ71xXA2w5gOlcKI4yY5ypTf6ReraKnEpINU2qqn/ZHBXbA3KrXHfnjQJ53SA0KFUFbDZM+7Q0VlDWMiQy8W11qw3Qb75MBKFU6+Jr8/B8UUOMJN7O0lf62aHahzjELkrEp3SrMIFscvvdMfhsvLLgVfhCDfkZhQuMgsMs0d2p0VKyWqAvTc2hWiAWbhA3cxp/T/PgEA/0KU8xyUgELWhb8i3XEYyfYIcGKE0LE77p2xNIy6FYpvvK6B3HEmzy3j+y9cs4D5trvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199018)(2616005)(54906003)(83380400001)(38100700002)(86362001)(36756003)(4326008)(41300700001)(8676002)(66556008)(66476007)(66946007)(2906002)(8936002)(6916009)(53546011)(6666004)(316002)(26005)(5660300002)(186003)(6506007)(478600001)(6512007)(6486002)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?OsSFN4pSWDSCaA9oJ7zdMXTGoNDmo1tGIcQBy37iXLXINbfHqqzJjL8AjV?=
 =?iso-8859-1?Q?mBGptyLVgtQI9cylWsWb1jhNAKbh0dJDlOxyyg36fA3bWG31VO2g8tkpMv?=
 =?iso-8859-1?Q?Uy4FOWdD6kiSqQrMO43gB8fjSHV6WEattwEpKofDOUBF1JhXok1Kt0XTeU?=
 =?iso-8859-1?Q?c7JAqGMty4b+LOBIgVE5taJoppXzHJJnTlE4bt7X2YkGRnEpjIDPj5RCEe?=
 =?iso-8859-1?Q?YM2VDA6BQfDO/eIgbd3kmssULxhcC0/E89foM7NNw9VgULgypV9o60tP6X?=
 =?iso-8859-1?Q?A2RtjqCvVbRnSbuF7meuauhqAK573FAGs4I9kiStTo3z9+cVM3oYCwRxXK?=
 =?iso-8859-1?Q?zeH1v+aaO5asjQgH19jKU8Ahm3b12CpThJwnVungg17lwpvef43G/NlA1d?=
 =?iso-8859-1?Q?EkKELwtFMykk/h0H3aBFJBPG6d8XELcEYPuqh7DHSajHD40i8aWXv7a9Ge?=
 =?iso-8859-1?Q?+EZzLBtbqaeoUEz1djRRfU2MX16y5RsB8RtJIGkBkSdZw01ancZMCfOVyE?=
 =?iso-8859-1?Q?h+PZWRkwoBeOO1Eb3PjOMBf6XuBHZc55jByO4SKlFF9WXllafghFewcpDZ?=
 =?iso-8859-1?Q?QrY9H5nLaGHJ64OylPVDOdsyBrwrou1UkOrTc5yVi/z0SRnJFIoKn4ntme?=
 =?iso-8859-1?Q?xywggoDiaIFS8FL7QGoQ5BJR0H7KRdWz+4PFEf+SwbyLXZB6dOCf0CAzJ6?=
 =?iso-8859-1?Q?OCTJQQdeMvtcpQaejX56Q1VboUgrV4zFM8Sovm2y+ELCAyaCGYXCagSEDz?=
 =?iso-8859-1?Q?Coef8rJKhIpyK8gqJZrHJYYCdXCerFGUul02t6i3lMf3LdUmyebue1Vyjl?=
 =?iso-8859-1?Q?SU6lf3eYHToKAe8kEEgUp6M2aGI0MXs7u/BP6fKDGFgnLp6OWhGaCSMxR1?=
 =?iso-8859-1?Q?qXVIJ4fYsLRxv3efr4BKRgWBRLb4ykIKrXlw/25ewYq1VfvRhK8kO1IFJp?=
 =?iso-8859-1?Q?48BiEZeEflquh35qtGWDQ1KNTqSgOzSTAPSVsBmw2esTFhXvWsC5X7Up/s?=
 =?iso-8859-1?Q?nPJYdSxm4Jp9OjC3g+4MH5NaFyff4KGlFVHyVLFUuMLO6t9bQqXnPtVu6J?=
 =?iso-8859-1?Q?BIPenLm44cA1Iy4qAw4tLyAhofNVdn9nkCo8MVSpAe6KJ/i2LsnKeMCEi3?=
 =?iso-8859-1?Q?LiPlv/Go7kZoCVVwVJhhi/VT5cgCnKCOn2Zai6BqIaJ4+IOZ5lxSI2GMEU?=
 =?iso-8859-1?Q?+bNWEgcnSMaP7Lkop7K3F7gu86YgUvJXEIx0uCU49BeqCDi7C0wm1odJYQ?=
 =?iso-8859-1?Q?wTxE9qekC/bqVHOI9hiIhLZATwVub1zfM9jDAsXZ6HLPLv8b/18qLQLdCr?=
 =?iso-8859-1?Q?CfvxNVZv6BjfdvPrJGTnauIyrj8e8ArTXfH2IQOBfU7k5BfE+0jOWcg9iH?=
 =?iso-8859-1?Q?znvbysOSYCk3UQwJur5D7TcE8aKjzSY0NtVVS5e0ZOMyAnSTCU/AjuyUUH?=
 =?iso-8859-1?Q?J04N3kZw1qN4zApPl6ObnnjyBf+EHrL/kZARldmSI9htnRpe64rDPDGB/K?=
 =?iso-8859-1?Q?O6ZpCMK0K3noAScWqSAEJXPkzAnnLNq6Zgvh6qOZRy8Wna+mfqkEtBppwA?=
 =?iso-8859-1?Q?ICN0CD433FBsDDSrICa+vvOOjp9eERF94RDnGCsTc86A39rPV7Bnb/IvcS?=
 =?iso-8859-1?Q?2hwNE2Vy+OGBTyII+RGSXJ/KLBW+5EiTjG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed733299-8213-4585-ea31-08db29d54ba2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 06:27:07.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbp8Uivqd3qPAJMgEFBiSQ+Dcc7KyjFgpgCg0anr06a+TfNn42i/qXrayLt81kLlv0kLnFemSvQz3Eb9HlHZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210

On Mon, Mar 13, 2023 at 08:27:02PM +0800, Andrew Cooper wrote:
> On 13/03/2023 12:21 pm, Roger Pau Monné wrote:
> > On Mon, Mar 13, 2023 at 11:55:56AM +0000, Andrew Cooper wrote:
> >> On 12/03/2023 7:54 am, Huang Rui wrote:
> >>> From: Roger Pau Monne <roger.pau@citrix.com>
> >>>
> >>> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> >>> from the firmware instead of doing it on the PCI ROM on the physical
> >>> device.
> >>>
> >>> As such, this needs to be available for PVH dom0 to access, or else
> >>> the GPU won't work.
> >>>
> >>> Reported-by: Huang Rui <ray.huang@amd.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>
> >>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> Huh...  Despite the release ack, this didn't get committed for 4.17.
> > There was a pending query from Jan as to where was this table
> > signature documented or at least registered, as it's not in the ACPI
> > spec or any related files.
> >
> > I don't oppose to the change, as it's already used by Linux, so I
> > think it's impossible for the table signature to be reused, even if
> > not properly documented (it would cause havoc).
> >
> > It's however not ideal to set this kind of precedents.
> 
> It's not great, but this exists in real systems, for several generations
> it seems.
> 
> Making things work for users trumps any idealistic beliefs about
> firmware actually conforming to spec.
> 

Thanks Andrew for understanding! These tables have been there for more than
10+ years on all AMD GPU platforms.

Thanks,
Ray

