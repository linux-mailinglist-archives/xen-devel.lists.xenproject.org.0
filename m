Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E006C64FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513740.795202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfI9n-00049w-9l; Thu, 23 Mar 2023 10:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513740.795202; Thu, 23 Mar 2023 10:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfI9n-00046v-5V; Thu, 23 Mar 2023 10:26:55 +0000
Received: by outflank-mailman (input) for mailman id 513740;
 Thu, 23 Mar 2023 10:26:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q/IK=7P=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pfI9l-00046p-FR
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:26:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eab::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38bcfa74-c965-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 11:26:51 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Thu, 23 Mar 2023 10:26:47 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 10:26:47 +0000
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
X-Inumbo-ID: 38bcfa74-c965-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fayl9k4xDCNHKAbms/0OWH+CoebGk/z2GSWwgVCx3U0HL07GHZN9lqRIpPYD9kooQlKJHCqYGX7bcu7SOCW2HAtWebQVq/VSZ9VFbcHfBB+fVuzcVmfd7zuy8qmi3IcFMW3RrWNIOa9UHctDWpZdnnE2+qqqBjoqzeAjETXYgjSxI+URAuu1lJ4GB7gm6q2BP+ZO+nf1ZnW1nD3aFaKUPAqMmpLin2vLhoxd4QjbsWI2ll74dfJ7vU542w2ZSAo7LlbApzJHIH3sRTJOZQx/azstOPxAyRxsfKO8XchaGm3qSL2YtaOcJNW1NYuYtsC9i5zZ8LISGORv1Wlk/Yardw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb8YFjYlladmXl6LtrqQVE54sVh70ierYzEDWgQEZM4=;
 b=AUlz6sjU4brtuzEQywu9Vpe0GLUEGzRt6lhZ+ogiqezeyQvUZvTS16cUNtoxDMH4qYOOOvOIAiHuYYh7qE5+qzgxLhCVEl3a3h0JHvu4kY1QIvpsWkzR5qN1sE+SmhNCdAM82diW8QrzyDvczz376uwvyQPVwSAWMnTGJ8QnUpAxuP5BXGouk0MsQepZEVsLM39eaJRe/JpE310XQH/RRTqnwmt7vtTEZToziJnj/DPIh2sC2UJrYn3dgkscoB5r6w0Ssqu7eWRRAj2F0CyfUabbbZu9LJ4FseyVGUa8LOdDSBSCbKeZ6c76/Q+Z/QWMOVpocom+cOnmwyOJffvuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb8YFjYlladmXl6LtrqQVE54sVh70ierYzEDWgQEZM4=;
 b=Om4Ttb+jo10CFk5ME6gxdBq5vdB7pIp+kLnByYNTtsRk6DNsDo8JIhqJMZTNHxHZFdn60xoyeWva8k+pX+QC2HM9Im9AggZSLFWPkRDCOwt4pLPuffvryR8WWyV2G0dLR22vHPiCHZooCA5ovjKX5oH+0sse5HKs3+zJiV3o8bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 23 Mar 2023 18:26:19 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBwpS+WD/mK40Qx2@amd.com>
References: <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
 <ZBr1k/B/ve8NNqaJ@amd.com>
 <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85aa668d-9614-a80d-8f44-174ecbdcf1f7@suse.com>
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: dacd7b87-6f99-4895-c254-08db2b891b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jo1dLPhpfzIbu0wPqat19MMX7VO0ZcGR+QN/r2hPrfaJM76bEg0t+58+0nGjtswjJgBr6rnmFVfnNK/LLV6n0fygxquoxEFaKlX2upw1+rNxXq2bldMKwtp4hSshyriBNBJnJQkBSmpiwRQocoMSqJ6sY6tm811NLHqNPPJ5t6bg8RcaDy/OX5ibGKcvjg6Jxj6exnwSivdTmL7XjETdZSrB8zZ87ywekJJ3Zj2iTnD34vpruuSy5CVeoBkgOpgUCIUZjkMs63C2FH4zc1KzkVzDBjeJnIpj0Da8h93r3VEws8+8BSh4OKsmfZMo0QvSDiAvZwrHlgxO8yybmKifmB+hS6dr/sNoT9njAM7YzbLR6M3KvuJEpTa0tt0EHVkToQinHf3cJFF5Qm05n7HCn1dN/ptSa0aganb0VnA1UnAHafRvZFJKw3em513eDtFO44OVVyqXi9GcyBNRQLTEnnKazoKqvmkqmeYOI4awYebjjOQCh6FHc4VH3AYsyj8LOZdmpYO2KD4cFEVlvOXo5lAqvRTU4NKCJkMFgVMmdCRNqvHaTR9wExYRnjZN5rX2Qe64cyY92iwJWKK+STgdk5uXcG+u3F+2NTxCFr7jF6qLVOqgubmmPXQ2UExfMCkoTcvjNzmi11Aq3jMfcl0Fjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(2616005)(6506007)(6512007)(8936002)(26005)(66476007)(6666004)(8676002)(4326008)(6916009)(83380400001)(66556008)(186003)(53546011)(316002)(54906003)(478600001)(5660300002)(2906002)(6486002)(41300700001)(38100700002)(66946007)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zvbZ6jrRIGCFKD2M2bPBZD2sLmuDwQs6m0VN+qMd53iKs4AXmL+/83BSdgp?=
 =?us-ascii?Q?kPGYBmXq0ANfwpwjUOQAzQ7MRF6GcTJ5PQuzKruEwLA4KWrvZ6jutGjLAC83?=
 =?us-ascii?Q?r5DEwlFltsanh0d1HVlN+Os+ePDL8N8W0LlMIAXnHAqAYLJuupD4ataA7lnv?=
 =?us-ascii?Q?2nzliQIeDgr0yA5YiufJG26W+T5nFG5p4H19pPeWwvw2QxZfAUCTwF+2Eldx?=
 =?us-ascii?Q?dqmzeNowTgQHnyRqdQF8ac20MI5WVfcaPwDcNXczGnKFARkBa9vT4tlUYwGm?=
 =?us-ascii?Q?Z2OZ1uxC80eWfDXxtUu138Zt/aSmmyrJCkhlflREWItOIuIDZ2InW4WgsaeE?=
 =?us-ascii?Q?QBVGIYgh4gComs5ioSkcFSS6u5A1XKKNbH0WEvkfn07QS3s0DxaRgNZROZGp?=
 =?us-ascii?Q?k0MO+r3uNwQMGHWHbuqxgEcZ/1TR4MTbRIMXKpuVfwprUqUrAG8WiOGht9FA?=
 =?us-ascii?Q?nJCyqy43xB6TkHBKNbUt6n1kXN+L06mevrYVj2JPfsPrmaeUxaxKexX6IdrM?=
 =?us-ascii?Q?HHWs5CmRxd9ru0BaFrUPqlZTQde5JkK6wl9WbhyZXWLGgsuk0dRaAbNGHb/F?=
 =?us-ascii?Q?/aMuHiFxGb+uNaqrLPwUzqlI2DKvKy7+5fH3gIhHAsNV/mJiG1MgVONQT2U+?=
 =?us-ascii?Q?y2OQo2kIy4HGvIC+aX1PCJVA+km5kolnwRBz9V9sbbs747L6Z8fJSLj7dTW1?=
 =?us-ascii?Q?g3pz51/vuTX4IFwN6g58xVOeiLxh5LcOycjrycC2N0a1oOE5CQ2GLkLX5+CT?=
 =?us-ascii?Q?cWUvdFoYq1usaslFt+dDzpTyf3fSNKzg2ltXmSI3nJ23BalTJgoGDzmtEE5/?=
 =?us-ascii?Q?+M04J03fhfD+EhhbrD2xx3IUUlMxBzfDDFxS9pGMTy/SuTxR0aPisFyTpUZv?=
 =?us-ascii?Q?eS/ZpnD36mFdMAC+qW3CuLsn+HNuz8QLHjLj4eSIyiwly1t9zqBOuneZTvdZ?=
 =?us-ascii?Q?evPPcttJecL88IoBczkCtB//anjhqvEhr3iJUbRKvNAM9utH2zbjvT7XZ/Wa?=
 =?us-ascii?Q?d1JH7xE8rev3Vq820knd4k2eKORMOqDl19yQZ0k1bUrekuZaMtrggvjwEAx3?=
 =?us-ascii?Q?gvTM7OdSuKFHAtFtuvojJGTJi8ncsDjCYlJ+10aLt5HAaX0nQBl1FoAYNjti?=
 =?us-ascii?Q?yHY4WENklnNOH7oP1Qqc+/+Fm5t9AH/wYhiLIqxAET8r5GAXVYDda7QEDRng?=
 =?us-ascii?Q?tn4Pcidsvkm9tt0k8q0IltaMcW0tVRrkuVGbHefqp8zQPWo4dLPf4npuVEUB?=
 =?us-ascii?Q?wcNLnRkIJrbH/B/r6/HUJJI8lbahC+Jmmlqrz2kr+c1ZFqrDrHKF21RHHuxx?=
 =?us-ascii?Q?q+1iatpzFNlQWEQxyYviVeZnDDAfg1iNWBcZYurDaSVLw8soHLhz6EBXaqpi?=
 =?us-ascii?Q?IumtIF76PCrSam8OBobaPJ5/HY/MvYNq5eOyvAUCr1hpdvJtp3SvfD9DLzld?=
 =?us-ascii?Q?HxD2OiuaucTNXPYFVHwFXXmgZ1w3dtbRTBHBGpwzMh2kcJCN9RdPfEQWCyjJ?=
 =?us-ascii?Q?hq7oyaJnHwDr6/vJHFK30lAurrCfCCeGgWCkcJtFUdiOEZ2d3snLE/Isk9+G?=
 =?us-ascii?Q?q6cTkfMV/677UecP3yZdC8ptqdheqIczzEJWZwc3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacd7b87-6f99-4895-c254-08db2b891b22
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 10:26:47.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCWoYipC705tXVRuUPxXKi87vgVpQFDsJ0JnkcyrzgzVWGZ52ValfD3ud9cGLzb2SgVrjBJqvehIQhj2pbQJkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553

On Wed, Mar 22, 2023 at 08:48:30PM +0800, Jan Beulich wrote:
> On 22.03.2023 13:33, Huang Rui wrote:
> > I traced that while we do pci-assignable-add, we will follow below trace to
> > bind the passthrough device.
> > 
> > pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()
> > 
> > Then kernel xen-pciback driver want to add virtual configuration spaces. In
> > this phase, the bar_write() in xen hypervisor will be called. I still need
> > a bit more time to figure the exact reason. May I know where the
> > xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?
> 
> Any config space access would. And I might guess ...
> 
> > [  309.719049] xen_pciback: wants to seize 0000:03:00.0
> > [  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
> > [  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
> > [  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
> > [  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
> > [  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
> > [  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
> > [  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
> > [  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
> > [  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
> > [  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
> > [  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
> > [  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
> > [  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
> > [  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
> > [  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
> > [  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
> > [  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
> > [  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
> > [  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
> > [  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
> > [  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
> > [  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
> > [  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
> > [  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
> > [  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
> > [  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
> > [  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
> > [  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
> > [  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
> > [  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
> > [  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
> > [  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
> > [  462.911658] Already setup the GSI :28
> > [  462.911668] Already map the GSI :28 and IRQ: 115
> > [  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
> > [  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
> > [  463.954998] pciback 0000:03:00.0: xen_pciback: reset device
> 
> ... it is actually the reset here, saving and then restoring config space.
> If e.g. that restore was done "blindly" (i.e. simply writing fields low to
> high), then memory decode would be re-enabled before the BARs are written.
> 

Yes, we confirm the problem is while the xen-pciback driver initializes
passthrough device with pcistub_init_device() -> pci_restore_state() ->
pci_restore_config_space() -> pci_restore_config_space_range() ->
pci_restore_config_dword() -> pci_write_config_dword(), the pci config
write will trigger io interrupt to bar_write() in the xen, then bar->enable
is set, the write is not actually allowed.

May I know whether this behavior (restore) is expected? Or it should not
reset the device.

Thanks,
Ray

