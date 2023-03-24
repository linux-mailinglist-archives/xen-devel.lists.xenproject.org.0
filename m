Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7A6C769D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 05:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514156.796143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfZC1-00036t-6h; Fri, 24 Mar 2023 04:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514156.796143; Fri, 24 Mar 2023 04:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfZC1-00034D-3T; Fri, 24 Mar 2023 04:38:21 +0000
Received: by outflank-mailman (input) for mailman id 514156;
 Fri, 24 Mar 2023 04:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsyw=7Q=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pfZBy-000347-UT
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 04:38:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b065693d-c9fd-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 05:38:16 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 04:38:11 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 04:38:11 +0000
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
X-Inumbo-ID: b065693d-c9fd-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoRyu1dENRMJdEbndVGiEumEBvjKLrJtrsZI2WXLD6kG2bHrtgl2eVGvsD1/xL7GfsFD0366RIAB6AHwPLSFm1YGZTY/T1f2iHobbhuaz+nldRMlfxAEkXxso4uQ1uesR+jWpIe6AGITO4C4RhXl1tnGE9tzXmhW2b30pCxuUm6QoLhw4WF43HY+HWzoR2ttg4a2Cq9C6uZZGgB7Zz45CDCPio9+Suuz4D0plHg06P5J1Rpt5q0tYGgPlCgnEOqyMJn+fTAhs47caKK0cE1zPswA3imFbxrizFn+OO1eLBnl0nNrm7X+Od0gu0K5WxSLw24NX8DhiJdfQKykWcst+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RexTfs9WYlOdPjfhvlCmq7usdTv8HYrY3n+unJGzQus=;
 b=CP5Mu7a3Bqr68hR/X6k6LR72GieGt/UaMuO5/Bnj5KDwlagKXw4AMWCGnr1hya807vzwCCfPjYstJfMzhHomz4voJjPZ/5auxJK/ahKTlnAznJXuIJrDKMycQEbw8OFw6uvWgfNX9ofoHeJFvf9DVpxwLljP4fXOLBW492hact35BRe9inRai+X5RCK4x/4bJJ4THAdEan0BFnPY1l9f5P25zPDYZ4TASc+1DOEZ9npqLykt7UDYDhYa7x0FFswuSHe92OcCelDO+49xNKlmAVv/ZsU+H6RjzJA4cMqs7w4Du2hn1GWr8WT3Yc7o7vZrKrbiYzHQBWhCq9IjOkp9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RexTfs9WYlOdPjfhvlCmq7usdTv8HYrY3n+unJGzQus=;
 b=SSiIZBx5yn9dctpcX8YvSfxKUsw3CHuqHWrG6dk1JK0tPVMRF/JhoS1hqIJ6pKCDEM5yd7vlSum26a3VrreOkskmNiSznjMIfa7ISjh1CR8xQ5E1wg4aLD72mnLZwuDL0CG1hDEjjHb/0IMB0ZYcBXu6YMisPL0gXRgbM8Ldmlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 24 Mar 2023 12:37:44 +0800
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
Message-ID: <ZB0pGDo9bKYw5Pvo@amd.com>
References: <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
 <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
 <ZBwtaceTNvCYksmR@Air-de-Roger>
 <ZBxVcBG5yD74Pa3a@amd.com>
 <ZBx9C5BJD1jSiHPS@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBx9C5BJD1jSiHPS@Air-de-Roger>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7793b15d-933a-46ef-65bd-08db2c2192ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7oqD2byQkihWnQyJIwd05IYSYEu13JME2ZziSe1F/eJLNzpsJ+md/A9YX8GtoxKw8/2ksR2G44rTatwkzJqvQH8blv8YTuh8Qau1ET6HU99JngCIszC2rVJy0wczNjok335IBykSleuDW00iw3/8vQdL5+whs5qkoyyfoeO9FEXGC/7/CQyjnCz1iVmWrE2WQJP0QZ/0quTKRBmOmUraOKikW5IN6r1BybptwkMUeIr4d6LGpNpTqga83PxdnV0T3QvRKFIG0W6Ivvma8Vs70NMuDoYi57aJDRQ4LtoCkTRV0OzYKFFrGjt3NXn0gHDZ4Tj/GzsQnck5YstjMqoMNqjZ4kRtcoiS6A2Pv6pnhj5mqNTtBJD5nWWKB+3xoG6sNa25hjnyzpth9EdwTrvW/WtddEFFLAoRgMfPnc31A4cDkUrRsKjdQhxXxy6cIk3kLEknem7LTbNDLqa7yQzRu0UV4SdmZ46X3SSsu2/C2OaeePk8mk+HORvoPxbtTNHd86ZxpfKi7tUDIuAkfZDGgeVvhkQzHWu5RYH+QjcZSZnMXByMAXaVqzsZqPVjWRo/Xy85ceucI8T1VrbzEPhAr5q/zBy3uakoLo+32ISZjArHn/uXZ8Hmr6F8vaoyHxUAHGubl01bkC18in289u3JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(6486002)(8676002)(4326008)(66556008)(5660300002)(53546011)(66946007)(66476007)(6916009)(54906003)(6666004)(41300700001)(26005)(8936002)(6506007)(316002)(6512007)(2616005)(186003)(478600001)(86362001)(36756003)(38100700002)(2906002)(83380400001)(66899018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?UaZwxd/AS1sACNMgcR7Gc7IGz3e2TgLPKS+QSfsTCdPDyWlOAqo+LAYAtO?=
 =?iso-8859-1?Q?UeKHHusQOatROQZg43FUS+TxAJe8MyvB3IxJQVROLtpJ28Mk0hS1qhXi8Y?=
 =?iso-8859-1?Q?N4USMh4yz5miVtaKh3WU6X3Q9gStaoxjl6M9kfkT5ZhBX1yJRAEtIctLKF?=
 =?iso-8859-1?Q?XxdgXyTxCq1/Hx6KDU3JPycwC84Yg7Wy2ZgJEcNhO0iayypIkY3l7BUMAy?=
 =?iso-8859-1?Q?OfZnHzrOm5HN2LCUSb8E3nLa6ywI2zlsCl3ZXC2OKV9VBtX8S9+Ue+NHVo?=
 =?iso-8859-1?Q?oYEOjGPD2giFrPqxOLibhJk0jtWkJISspmoJeb/DStkA6RsXGVhhAxurgf?=
 =?iso-8859-1?Q?BdzgongZ9MmKptFcZOvbuILh3mJBxnr6LmR8Wsm0Yf0w9daN1TCNMLrzGk?=
 =?iso-8859-1?Q?8+94q8Zk1t8nmy+IRjuha40aIp3qcvWaUUZ8BMKrTIPVA9PF9oa42gDQOE?=
 =?iso-8859-1?Q?aRJ9eCXJYCseYPpS4KuiXodZlKrpe1p+ny3dNgbZrXI82rYZsJF5d2oIyS?=
 =?iso-8859-1?Q?+CzBTDcL7YE94qs+zir8cr1uSIoF+/YGEQaD4TKz4d3XBXZVDIRjGs1jWe?=
 =?iso-8859-1?Q?QVFm+f7b2fXFDCaD5LI0embS+3ht03dBSceZIY1nko/HLZJ9ks/PF3TQ9s?=
 =?iso-8859-1?Q?mHK5SlbCYICsfnyr3HqpHxb/XMKdO5p9OSGQ7KdvRPHuKAcNDrpDQgl0vr?=
 =?iso-8859-1?Q?yOIxR+S9+sUCiJ1/RX6W3WigxYm86QfK2aZx77FkWkKyqzClm3tTL4CgpF?=
 =?iso-8859-1?Q?udyqM8uyPiubj+qnKYdGZZae1MvDdTtIo/L12ugS3Ao4rGUjkMT0MN7fQX?=
 =?iso-8859-1?Q?RADbOBS7KkNbEYsfttfVS9s8+FqXDAJf9ldHI6mrUGIpCq+HLN6jRiGqhu?=
 =?iso-8859-1?Q?Ulgcs0lZG26Ck7kS6oTmuNwayHdIvsuJBYoeRk5+8SWSdoh1Kbx+3B7ybI?=
 =?iso-8859-1?Q?8jZ8Ngm59kJaOOraL9d/kvVfOn5a33ejWsNxQ6bFeN6CS5AIMFGD71Rv4/?=
 =?iso-8859-1?Q?OFpdrO5tqNksrkSn7J0ZNQhSY1snxI1eYnoUFTBrjpXPZxXKZ9y5C0p44q?=
 =?iso-8859-1?Q?gREvn98M6fsvYxQ5KsfeLppMNQ0oew/IhZlRtgdNMBlIvAkexRI+xNGD1e?=
 =?iso-8859-1?Q?arJlOy4xYELx5Uh+yB/JIr3rJkolkDfnP6+8ZQyOMnRq477gzEbGTjdyi6?=
 =?iso-8859-1?Q?+aNnIJiUV64fpv9/DPS8KoBb/JY9WKTlcMTSW6+S+1VGsJqnuu6XhhGSGz?=
 =?iso-8859-1?Q?MhyseEpQUclkHjTY+AlXqmIZIt/o/8Y5LP8UDuzflWGiyqr8kkreH88o4s?=
 =?iso-8859-1?Q?+rhdZQSpwse3+K5J56+17gYJB+1JCYSR3qDsyhwK580x69eAJ//XpKxgpG?=
 =?iso-8859-1?Q?B9ULH4fgfTyuTcEeRagU0vGQg7dRj1f408HY5xhQ3pobdlmm4hVl6GTnLx?=
 =?iso-8859-1?Q?FQPm0HYC6u3WVsPIMO3dtdgcCGw3m9VW/9zobEog3M2zqSek0ImZMnBw1d?=
 =?iso-8859-1?Q?9e2Rvm2rHulj8qNYCcxRgeVYsWHLmf6d+9u1eYs3FfvtCF6+V3A03kD9QT?=
 =?iso-8859-1?Q?h7P4t+AOqyBGx8IXi6VPbLh5X+ihDHMF0id8eR3fzO88mTxMps3PhoRQJ6?=
 =?iso-8859-1?Q?vELDwY91oCO7kRL2rGkPSpcQPkf87fNIyO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7793b15d-933a-46ef-65bd-08db2c2192ee
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 04:38:11.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/OWeghMHGLdbBcg+6UhYOZgHdTiYQr8lNO5bIiU4cgNi/n5jlaZqDccn7z9IGFUhsjpJHR1EX1KhsJZlgCuYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642

On Fri, Mar 24, 2023 at 12:23:39AM +0800, Roger Pau Monné wrote:
> On Thu, Mar 23, 2023 at 09:34:40PM +0800, Huang Rui wrote:
> > On Thu, Mar 23, 2023 at 06:43:53PM +0800, Roger Pau Monné wrote:
> > > On Wed, Mar 22, 2023 at 01:48:30PM +0100, Jan Beulich wrote:
> > > > On 22.03.2023 13:33, Huang Rui wrote:
> > > > > I traced that while we do pci-assignable-add, we will follow below trace to
> > > > > bind the passthrough device.
> > > > > 
> > > > > pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> > > > > 
> > > > > Then kernel xen-pciback driver want to add virtual configuration spaces. In
> > > > > this phase, the bar_write() in xen hypervisor will be called. I still need
> > > > > a bit more time to figure the exact reason. May I know where the
> > > > > xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
> > > > 
> > > > Any config space access would. And I might guess ...
> > > > 
> > > > > [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> > > > > [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> > > > > [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> > > > > [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> > > > > [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> > > > > [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> > > > > [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> > > > > [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> > > > > [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> > > > > [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> > > > > [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> > > > > [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> > > > > [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> > > > > [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> > > > > [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> > > > > [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> > > > > [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> > > > > [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> > > > > [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> > > > > [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> > > > > [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> > > > > [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> > > > > [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> > > > > [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> > > > > [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> > > > > [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> > > > > [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> > > > > [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> > > > > [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> > > > > [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> > > > > [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> > > > > [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> > > > > [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> > > > > [  462.911658] Already setup the GSI :28
> > > > > [  462.911668] Already map the GSI :28 and IRQ: 115
> > > > > [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> > > > > [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> > > > > [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
> > > > 
> > > > ... it is actually the reset here, saving and then restoring config space.
> > > > If e.g. that restore was done "blindly" (i.e. simply writing fields low to
> > > > high), then memory decode would be re-enabled before the BARs are written.
> > > 
> > > The problem is also that we don't tell vPCI that the device has been
> > > reset, so the current cached state in pdev->vpci is all out of date
> > > with the real device state.
> > > 
> > > I didn't hit this on my test because the device I was using had no
> > > reset support.
> > > 
> > > I don't think it's feasible for Xen to detect all the possible reset
> > > methods dom0 might use, as some of those are device specific for
> > > example.
> > 
> > OK.
> > 
> > > 
> > > We would have to introduce a new hypercall that clears all vPCI device
> > > state, PHYSDEVOP_pci_device_reset for example.  This will involve
> > > adding proper cleanup functions, as the current code in
> > > vpci_remove_device() only deals with allocated memory (because so far
> > > devices where not deassigned) but we now also need to make sure
> > > MSI(-X) interrupts are torn down and freed, and will also require
> > > removing any mappings of BARs into the dom0 physmap.
> > > 
> > 
> > Thanks for the suggestion. Let me make the new PHYSDEVOP_pci_device_reset
> > in the next version instead of current workaround.
> > 
> > The MSI(-X) interrupts doesn't work in our platform, I don't figure the
> > root cause yet.
> 
> Do MSI-X interrupts work when the device is in use by dom0 (both Pv
> and PVH)?

Yes, dom0 works well. But they don't work on passthrough devices in domU
whatever with PV or PVH. So I would like to implement the gsi firstly, then
continue checking the MSI(-X) issues.

> 
> > Could you please elaborate where we should require removing
> > any mappings of BARs into the dom0 physmap here?
> 
> I think you can just use `modify_bars(pdev, 0, 0)`, as that will
> effectively remove any BARs from the memory map.  That should also
> take care of preemption, so you should be good to go.
> 

Thanks,
Ray

