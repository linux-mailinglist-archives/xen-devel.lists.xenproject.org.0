Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53E787E6E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 05:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590441.922730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZNKM-0001fA-R5; Fri, 25 Aug 2023 03:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590441.922730; Fri, 25 Aug 2023 03:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZNKM-0001cS-Ny; Fri, 25 Aug 2023 03:17:38 +0000
Received: by outflank-mailman (input) for mailman id 590441;
 Fri, 25 Aug 2023 03:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZNKK-0001cL-JW
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 03:17:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edfed349-42f5-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 05:17:34 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 03:17:29 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 03:17:28 +0000
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
X-Inumbo-ID: edfed349-42f5-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNc+wkO76ZEyuvLjF8QNLjRS7HsnsU9IH20p5cmoruaMU/gxi4Sz7svTWgO4fKBcF9K++1DBXn1juFrtb3LoAUIb7N8zmN6Dr3ocG0uKjThVSGHjM+gGQSv14wWwQ0HnY0hGIEkwyD3cPdaSbass67Ms7xqH22Zvlg4UbtjIYFDYmQ4N/VfcqYBN1AJfLycan9Vt3O6F1d8WFW8PwNKLSOVHjxc1d9wSGeNhGBhNDvSZOO6hq8OOPAHl/vVqeC8MoVKTzLhwDPl7tU3ePgm9bQjWOutAayB1+D7Xvvr0bGS+j/MiDMXmcyJdqsteVguI/wnDmienlxfc2D387V4IHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiMn9GiZQOOQBj0hyyj6Ppy0EASobpSXPJaDNhBtNr8=;
 b=ZHk9ugCz4T7AO15JsIO8bx8WA0y1WizJlzaWRm/MkXU9fxE9p/Bxpb51q96srvYap55SeTqHsENdsIc9HUZbQ9MGQmlg85fkCzS16bYl9Lv/saBcJNjMF1DHK/lH0MblWRJAu2X6wVLcd91PmhKVahO4dqDKbXMNfKJQl4SCjcoOP7bQy9Qo5jxpwJ1vaS34IZxGHdFJSPUJ9hJM5IlZMZY8Ur+c2N/VTc8vJ8nmSC8fwJagu5AmfYi5lGbxmayGceHEdHnDn4FSTdLO7Twy7GV4/GePB2OVN0I6ZiEtyL8hSwart92ZSna9cnqsz3RjUr3Yn8XOAOat/dpOlXk/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiMn9GiZQOOQBj0hyyj6Ppy0EASobpSXPJaDNhBtNr8=;
 b=y6+hyo5eh02eV8GPB1Cy+UqCk8s8y2/qB3fpmz1sHS9v30C/FEN/asAGLCMs30Y2Tq/V2zjFPTXd96bhghw8Kz7PVPORq8cdB9Vrs7EP7sh4wfFUsMpZVVC6TZOQvRRN87ADCzaorb+VEsGGdNNYHgJeQdXSZMxg+8jLXRMnVMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 20:17:24 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v9 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Message-ID: <ZOgdRIjd2nMWDtNP@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-6-vikram.garhwal@amd.com>
 <5c38c1da-8d7f-45cf-98b7-c80a55557b36@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c38c1da-8d7f-45cf-98b7-c80a55557b36@xen.org>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9eec68-7eea-4d02-07c8-08dba519d002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4UG2w16GH6N8d+/gojM6/LXgPLeBUASjh512Kue6EdcrSys7HZZZxjM6IJKbNU0mSQU5UBALHeDmEREjrABmscnSpT3mK2kKr3qOK6X5fI4NtQAwISqAlYlEoEMYLKJj2dvhPlBb5pZF9U3VSQw05ZOnURB2IEp8P2kJoqZ6d+BChadR1DfV84YaVFbIyhRq+et9FnuoIws3rvArygaYf2sxQu6Ji18vbbeCCFgo6/Jfs7jAvWhOlSg2JPoKHjtmQy604n78otvHvdX241PWBN5cDZcFjyVCvjdfqOxSxwuBu9iIG8+qeGAGn6uEyrpab/Hurocv+AX9a4LWYQ6EQEh245fHTna3uIf7mAylTflP5Ckfe7/n5WC6i2vy+s/Q/lthq3wZotUfWzdvSWlLdgJt/q2+/ZPPeOqf0zddJzO2Od+TtTp/qxCqgMcSLNUHp0N4mQG+DPhcpdDzxBUdGMYP82zKRLC85FJxZ9KkARnmhzDpytFVaSCeHMZ+zhbnujgaeyazBontkgBOcC5iQdJOHluZR1W1a+BmtkN9EWqars80ue2G8N2DDRU4jF5aWCwIUfn+AcV3wu3IfnQ1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(8936002)(4326008)(8676002)(36756003)(83380400001)(4001150100001)(7416002)(44832011)(26005)(38100700002)(6666004)(66556008)(66946007)(66476007)(6506007)(54906003)(6916009)(316002)(478600001)(53546011)(41300700001)(2906002)(6512007)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUYyTFFMVmJ1MXBQOXg0d3BtOVpyemx2Wm9Tdm9XaWdEQkl5ZG94VDNVbTZE?=
 =?utf-8?B?REd2anhEbUo2a1Uwd1FPNG84cEtyMDhPMEhaSFFCR1k3YjNCUW9BN0hGTy9z?=
 =?utf-8?B?S09WMlRWOFdrYjR2RDI3WENkTTBPZ1RJRzFBWlAyZVhkdTVORTY4R0FoNDJv?=
 =?utf-8?B?NFR5SFB2dUp4SUNmbW8zM0wxUUJFa3FnOWxlc29IN0psVWNteHhoRFU5ZzR6?=
 =?utf-8?B?eEVZMnZmYU9ta1ZYMmZ3RzE4b0Rvd2ZrMitNODhNQzRSYkxjS1E1NzZiNm1i?=
 =?utf-8?B?a1pHOEZ1OG9YNVZKamNSQUsxSkR0L0k4RU5OemJrQmlQQTg1WEFiM3QvNXcw?=
 =?utf-8?B?VWd0cG0wK0hPMXZoMFF2em1BYnJnOS84YkdLWjBQUXIvVmgyTXlKZmV1ZSt5?=
 =?utf-8?B?ZlVoSm5yY1RvWjhWYVVvUVZOVHJqbmdscUdBdUlJZHM4WnNmdm9hb05MWW0r?=
 =?utf-8?B?bzFHR2dERmI1TGcxQTZyRlpUZ3gwV3BpV3ZGY2pUYWlYcFdOWUpMdHd3VkxP?=
 =?utf-8?B?cDJTKzdqbU1JZVVYeWNzQkNlaWlWcGN2MFJSQjRXSDF3RWsya3RwdDZOc2Ro?=
 =?utf-8?B?bXhseVUzVVhRb3NXNkdWR1RvQWY2TFF5MDFzM01sZ0dXNlYva2JSdjdHVTVV?=
 =?utf-8?B?Z3owRUVjOFhsMTc3dENxbkRsekNzb3pxVnJnRFdoc01SSVowaklEbk1LZFVB?=
 =?utf-8?B?dTNnZlMyaEx2OFBOUlRwSU5XYjhwbEZwb1VFOVp2eldkNzA5RHZaRGY4R1Vw?=
 =?utf-8?B?UmROekpuOS9BVnlhb3RzWjlqN3RBQVUyUkRZVjFDTzdFd2ZzRzZMSFJ5dXRm?=
 =?utf-8?B?NkNJYXFCam11MFQ5dmZDV2xjbVFmVUlzOXVHd3lham5zKzB5TGZNNFgwdWFW?=
 =?utf-8?B?NzFkY2hzdTRTU1NmeXB4U0hjY3c2UWJYWmtkK2c2dURLWU5iczN6ZVROWldl?=
 =?utf-8?B?T0RFWlFGTmp6WWJqaU9BaWZJQ3R1RmhXbERkd2h4NXR5RFVqTnV6N1ZGN2ho?=
 =?utf-8?B?UDNzMkdMQnV6bHpmUWloK0hhdjlUM1JMRVFmd2lDU0haSEp6dksydUQxRlJh?=
 =?utf-8?B?ZHFjeGtBZFQyRTJUMmUvWUxiQ28xVDlaMkVJN25vOGRhM0NQbjZiN21Nejgy?=
 =?utf-8?B?NmFER2RMa29XM25RVUVWUXl0WmVXSTJNbkNQdEl5Vk50UGo0WlI3T2VMdE10?=
 =?utf-8?B?R3J6WStab0RhdmFIMk0xOTVJR3ZkSTlia3hrRlZFblhPVFE2NFEybkloZEZ3?=
 =?utf-8?B?S0V5K1F3QXo1Tm1XcEx6ZldtNEszc1dDS1k4cmFQTmlrODgrSERFN1BIR1Z6?=
 =?utf-8?B?OUluMVVsOTZaUDFOTXNJMDZxYzgzNThSWUdGbzg4ZlN5RURXZmlzVWFPR0hs?=
 =?utf-8?B?V0JtOW4xRG0vMU5VSE1oMWlvWFZvNVA1bEc3a2J2NTNwcER5dDlaL1lZZVlQ?=
 =?utf-8?B?MmprZG9LVkYzSUI1UXJDYUwzQkZGcjJ4NlpuV3E2M0d3bW1TQUJmbE1vWEFx?=
 =?utf-8?B?RlhRc0ZORmwzVXJSUnUwN2hwTDg2L0hVRUo5eUo5VDc4VCtieHN5UXBrTlQw?=
 =?utf-8?B?cVNpdVJxRkx3a3JzdWhmdllOd2d1RjI5ell5ZlUxbTkyY0tBU3hnMjFHQkV0?=
 =?utf-8?B?dUI3ZzVMZ3VmaFIrSUQ2bFNEeFFUS0JaQlZVQzR1Tjl2NmpPdFp6ZHRBZVVB?=
 =?utf-8?B?QUcwalJMc2tTU1ViektwMXFZTkxzd0w0MUdGcnNRZ1BTMDk5aHFhYmZtNXdW?=
 =?utf-8?B?WjBvTEFjWjM0UHRhQzd1aUhEYUdyYTB1RmNpVmtkYU9pV1kwa1l2SkJ1Yldo?=
 =?utf-8?B?YWNVa29vSG9kenNlZEI1NlFxdUhHZDNtWDlPYm43aDFwRlZhUWNlc0NYcVdq?=
 =?utf-8?B?WmVKSE9qdlBHMHAvSGF3SUtkTWEyTENaVG8xNlloUDlONHdIREVCbitpdkps?=
 =?utf-8?B?cFp1MDUzMjh4VDNNV0NHWHJYclM5c09BQzhvNnFIeU5TU28rRnR3Q3FtTTQ3?=
 =?utf-8?B?T05zQmYxRTArWlpSTjk1MFVOVHJPbmVyNFpoNlA3QUswemd4VS8rRkFPOWNy?=
 =?utf-8?B?bTlyUm41dFJ0ZVpUNm9DemVPa1JQZjRnbUtQZ0Q4OW1OOFp0VkVrUUhNeDN6?=
 =?utf-8?Q?ZX6fZ3GR5HrcHnXjbaMWDFVh2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9eec68-7eea-4d02-07c8-08dba519d002
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 03:17:28.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX762KLDrpwsp3vJ/oEh/8iBwXCFwqXixUPONFsBy/ng9nhAqJGkGszSGenHOnO5Yq1MOWagzEnDJHYeByeVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172

Hi Julien,
On Tue, Aug 22, 2023 at 08:10:05PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Introduce a config option where the user can enable support for adding/removing
> > device tree nodes using a device tree binary overlay.
> > 
> > Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> > Arm.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Acked-by: Henry Wang <Henry.Wang@arm.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > 
> > ---
> > Changes from v7:
> >      Add this feature as "experimental support" in CHANGELOG.md
> > ---
> > ---
> >   CHANGELOG.md         | 3 ++-
> >   SUPPORT.md           | 6 ++++++
> >   xen/arch/arm/Kconfig | 5 +++++
> >   3 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 7d7e0590f8..47098dbfca 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >    - xl/libxl can customize SMBIOS strings for HVM guests.
> >    - Add support for AVX512-FP16 on x86.
> >    - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
> > -
> > + - On Arm, experimental support for dynamic addition/removal of Xen device tree
> > +   nodes using a device tree overlay binary(.dtbo).
> 
> Typo: missing space before (.
> 
> >   ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 35a6249e03..8eb006565c 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -844,6 +844,12 @@ No support for QEMU backends in a 16K or 64K domain.
> >       Status: Supported
> > +### Device Tree Overlays
> > +
> > +Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
> 
> Same here. I don't suggest to handle it on commit because this is not
> something I want to merge without the rest of the series.
> 
> > +
> > +    Status, ARM: Experimental
> > +
> >   ### ARM: Guest ACPI support
> >       Status: Supported
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index fd57a82dd2..02c4796438 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -92,6 +92,11 @@ config HAS_ITS
> >           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
> >           depends on GICV3 && !NEW_VGIC && !ARM_32
> > +config OVERLAY_DTB
> > +	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> > +	help
> > +	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
> 
> Do we have any documentation in the tree of the limitations and how this
> works?
> 
> The reason I am asking is the wording here suggests that it would be
> possible to remove nodes from the original Device-Tree. AFAIU this is not
> possible with the implementation and you are not planning to handle it.
> Correct?
Yes, that is correct. This series doesn't remove the nodes which are not added
by overlay before.

I will add a document file. Is this needs to be in .pandoc or .txt format?
> 
> Cheers,
> 
> -- 
> Julien Grall

