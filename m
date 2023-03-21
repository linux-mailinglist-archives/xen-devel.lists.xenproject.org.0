Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD36C2E7B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512289.792181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ1W-0007CC-8s; Tue, 21 Mar 2023 10:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512289.792181; Tue, 21 Mar 2023 10:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZ1W-00078p-5Q; Tue, 21 Mar 2023 10:15:22 +0000
Received: by outflank-mailman (input) for mailman id 512289;
 Tue, 21 Mar 2023 10:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peZ1U-00078j-QO
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:15:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4723b389-c7d1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:15:18 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 MW4PR12MB6755.namprd12.prod.outlook.com (2603:10b6:303:1ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:15:14 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:15:14 +0000
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
X-Inumbo-ID: 4723b389-c7d1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AamAU+1VZSIFWuc5Q5AG3M0les/oec7t45GS9ww1HNWRYUhpFZxEQFBa94FAv1i7fyTUVtErU93yaeIPDqX3KcWtxnVOG/SMMZVU52+x4RtEzILrPoeTNp4UACIeV2Ko6GXbstfQ0BYRdQjT9y+oh9dcbNCN4Pp+Se4NAKuxsAqdjDDSn81Uz9yze8j6nNkGLPAdfJTTJVVqlrXwfAO0R5s1Yn93dVZJG6PU8fnBz4M5MKSgZNNtCWIM05yrcKFvSkZ2HbV+OAaZQUumW89G7B6ei/l5Z0Xm5nv8YneX+QR3JlWDG0AcSFwYOql7C4on+5B15Zx5u09RYjAiGGSRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v/L66D0EHJX+zoLAQNHzE3LetCDlJU+g+0kpEWgTWY=;
 b=LH8ddLviFjlULF/+K3qFRoBNOQwNJwHtmcXJKGypgQN3H5quTSbehwM+4xQtushaYD9vXIUpaP4Scs93apCag3nE8kMwRTNwu5jK2Sbu2W2BMFP7rn6wYtbTvh0C0LgR+eq+0TnoGNENZO1cXFeG7av/AM6QakE+MSTLz9MnQk236C0LjD9y8OmUKzOM6DIEC6I6/YIfwE7pdDroTMxtGF+bOrwmJso+rvSyjckRVn2+63b0WDYmstxpxje83AUAyiqdZllES22HM8XopOGfHTXUK9ySE9ACiTIQJ8YJZ9PVzN6lla4rrHw2Ap8IL2FBSrcadffFFWgr0hOyugJBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v/L66D0EHJX+zoLAQNHzE3LetCDlJU+g+0kpEWgTWY=;
 b=lsQu48piaRA+9+W5SvsKFrNFT6qEfW1b5pDQDhlnDerHJU766znhwdIoiBR1ve5DGk/xeYIuyZ8K42l0+Qvb5KOVtC2IfXO+fHljkL5gvNMHZGmXUgUBhfvl1xJZB1p4dxrfqj+tV8dngyE/GeC9QtnNUzOl2ECY6Bck6dgNFQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 18:14:47 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBmDl8XjIos57EIy@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
X-ClientProxiedBy: SG2PR06CA0198.apcprd06.prod.outlook.com (2603:1096:4:1::30)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|MW4PR12MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b121e6a-0ac9-41fc-2b6e-08db29f52996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kadieq83MGbKFrir4vkby82Gd1kYEVUyUFmFUeY+SjpZKKPoeB3amkPTZkhHvL3J8KfGFRbZeo+fCZi41xeYYidoyynnBN4Lb+1t53+kXWG/TT9TcyuYz1IRr0W7G/uaGP1Vn/PXbffxiw/FXrFgYDILNa6+jZ7uxLm7N83zs+KlF+uluGhdFGWZINk8CWSVfuCiHWlTICBpp7+zd4gyZqz1pPXwMYwrYiyJHkURJlLHo4cR6quSZLxgFgdDYrzQFzIor1QYOOFg1rUTN43yVpdcutMijpDwVUWsq0zk6YNq9rZKQb2TPQge9/xBZDtLsO1pH3HWPjdyonv9T61VgdmA4m/20XXenga8sVs3MxLd7LJywBciwITp/sfLgspq+5okZl/8R3yuQ8TsCP7yBE2A+9oe1cYrOPEBzl1k2SpbBHKzQpVRorOnTnSSS8nPnWGizefmhrQVZAEfQCleupE0LDtplWmIQTlitjnCGKI4LY0DEhGSBaGNxgzDCwpSoG/Fjc2OJB7zPeRQltSMeSspNdzG/yNOvZisgge08FEZFqBZbUd0amDqKnfoj68uAp1YJ77icl7rHcXMr2zszXp/i6CS4iZ6pB2B6iVN6ZpDvEnBT2hj6X6Y5XjzOWIXOM3tw3qpg9T4m52PxdVHzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(6666004)(186003)(478600001)(6486002)(6506007)(53546011)(6512007)(26005)(83380400001)(2616005)(54906003)(316002)(8676002)(66476007)(6916009)(66556008)(66946007)(4326008)(5660300002)(41300700001)(8936002)(38100700002)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EeD9Z0hCbgXyT0Bwa9HWZBcMtXIMQdDWoSMSOoytZYHAEPYufXSP8y4JbHU4?=
 =?us-ascii?Q?3khaJx1/ZsvHxyXin24NTxqWcdMU791RE/CHr0GzY7vOq28PPOdh0NE1xqJe?=
 =?us-ascii?Q?odCCKAaAV9f+DHMA3v/MiBmdKXjxunxMETxUfpNyg6loRB5eKkWSfcU7Qivg?=
 =?us-ascii?Q?bcbpEGRTG40vI5hxcu05TSwGdsMoV3HXLIWIh6+tUpzclb5iw+em7LepcpOt?=
 =?us-ascii?Q?ZYHU7kNFGyCjCkCAJHl7UmDUkpkXP0l0n3LO5SG8FXWM2eAphd9CNft/A+za?=
 =?us-ascii?Q?FwSQfWz4ZlZLeRFkpzydG8tUrFJ+5A9ZzTMfksv1kS2/7X0G+3ce2kfXzw22?=
 =?us-ascii?Q?IOX4ibF/9Q8mtsbwP1KXZ/wbS9tby7snR7JyiLf8NqxAnxkEpTTsvtfye+Kl?=
 =?us-ascii?Q?OhKfOTrtgrrndfHbaX399T5Ed6ycQL+13ArIAEyZvlXQ8DR6SOXikhOYieYC?=
 =?us-ascii?Q?9d4TA4jPh4lrkRcuvtgNpoJOWkS81aU4eT1YRQIx1oGZIKwUnnCk3VTr+s/F?=
 =?us-ascii?Q?UYAnV4o4Mu5KC+Fad+lE8PkJP0nyUsH5JY/SXtyxKVSlFLjmwbwZ3X4CuT9i?=
 =?us-ascii?Q?dETWlNJEVM5eMMufRF5ZOH5hLqQ5h3GBoBYRZRCTAZCdNZ+ZT1Kb3dGk6X0u?=
 =?us-ascii?Q?q3LRnLeQi3R0IOlxFLZiI63AoYx2RYocuNEm0tsA3WVwQMGkvUy3Xpa1kqVq?=
 =?us-ascii?Q?pAYxaSU6kbQo382WBuJS302eA94zaaIXUzlTU59az8H7RPJrIyebKW32ZJCp?=
 =?us-ascii?Q?qxDmi43yhVsJoAQJy+R1m1i1l/He7W7YbOnUW/JA8AS7R8R8C/hp9z8cVaIu?=
 =?us-ascii?Q?8uNDWh/nXc3PGCPIaaQxFria1m05tjt1ISNY5G3SuUo8HrLlZjUxVP6cFqaX?=
 =?us-ascii?Q?0jeIsFD2erQ4242mm8ksKhor3bu0UfH5bpMYBGJh3ruun8YumRmnEP6ACdjG?=
 =?us-ascii?Q?HprYtmti/RvJbp4o3WtoPy5oSFEygFqkzV79BZG5wORSXfUymt76LAbpIbdY?=
 =?us-ascii?Q?hZtll6VtWH4I+TjA1vdZYo8ujkMDohqcQekODDQOWehhHIIr00qKFB/XvoNn?=
 =?us-ascii?Q?5X/Mln1aDWriIkSjz2L6zWPE4aFloMdvr1XZviKEIU4aNErY48Sn+PZzRhhG?=
 =?us-ascii?Q?NHtGiIc2Z0Ti90g69CWsnQSRseOdVoeK8JyQrJrwnOHhd2D1ls2Dv+JX9dmT?=
 =?us-ascii?Q?PpRQNL6FOx4jf5vf25zuFgxjBACpC8ZTWB5NnImbp2PCkiovbHdfB2Ye6bWu?=
 =?us-ascii?Q?IJnUMYlUFp1YFOWl/vkR6i5c2VPxC3CPOp18torL4t7CHEy2DY8AEEhYnanH?=
 =?us-ascii?Q?M22tiEFgvyQ6QDNxoLft/ozA1FkMCdvkSXge+mI3shDSZw+wWM6S88A1IXkn?=
 =?us-ascii?Q?tTl+oR8aAgWAmiBd2vFz+VIR9ebGBIytkeCLkc8UFvLOxAXu4y5crQPMNPff?=
 =?us-ascii?Q?1QDWhujX7hwodHEYXDOz8oELY150uDFF6rIOFMbZ379omxG1SbfmIzYSSnmA?=
 =?us-ascii?Q?GD2m/rFr1cNgKMp8JhOvsFhx0/gGk6XK+94l0toW630cgLIK0I4tdUvB6f4Y?=
 =?us-ascii?Q?j4Ix7lZ7vIiCuXfWeS/dA3RJEMXcmFNn86La1Xci?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b121e6a-0ac9-41fc-2b6e-08db29f52996
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:15:14.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U6ceJq8z9Dj+HUGt8BrmrdYvRxkdUz10TntsKm7GAl93Bq+hTuDrC6IjOAG0rzCfIs5IyrDEfIoKtYLoKhMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6755

On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
> On 21.03.2023 10:36, Huang Rui wrote:
> > On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
> >> On 12.03.2023 08:54, Huang Rui wrote:
> >>> --- a/xen/drivers/vpci/header.c
> >>> +++ b/xen/drivers/vpci/header.c
> >>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
> >>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> >>>       * writes as long as the BAR is not mapped into the p2m.
> >>>       */
> >>> -    if ( bar->enabled )
> >>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>>      {
> >>>          /* If the value written is the current one avoid printing a warning. */
> >>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >>
> >> ... bar->enabled doesn't properly reflect the necessary state? It
> >> generally shouldn't be necessary to look at the physical device's
> >> state here.
> >>
> >> Furthermore when you make a change in a case like this, the
> >> accompanying comment also needs updating (which might have clarified
> >> what, if anything, has been wrong).
> >>
> > 
> > That is the problem that we start domU at the first time, the enable flag
> > will be set while the passthrough device would like to write the real pcie
> > bar on the host.
> 
> A pass-through device (i.e. one already owned by a DomU) should never
> be allowed to write to the real BAR. But it's not clear whether I'm not
> misinterpreting what you said ...
> 

OK. Thanks to clarify this. May I know how does a passthrough device modify
pci bar with correct behavior on Xen?

Thanks,
Ray

> > And yes, it's temporary workaround, we should figure out
> > the root cause.
> 
> Right, that's the only way to approach this, imo.
> 
> Jan

