Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443A6C3222
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512610.792611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebaV-0006gf-Mb; Tue, 21 Mar 2023 12:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512610.792611; Tue, 21 Mar 2023 12:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebaV-0006eC-JE; Tue, 21 Mar 2023 12:59:39 +0000
Received: by outflank-mailman (input) for mailman id 512610;
 Tue, 21 Mar 2023 12:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pebaT-0006e2-Qt
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:59:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a6061cf-c7e8-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:59:36 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 12:59:32 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:59:32 +0000
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
X-Inumbo-ID: 3a6061cf-c7e8-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GExDihwFaTWNKejISg/vq75K+wnv0aHUCQXFdjsjFcWPPqgG2JLZGVbg21b094C8qxoHgKFH/ugA+qnGcETUP5sYMrTBkYBxYfe9PkOOlCYaMLVVkln744YJAJvb1lkM7wvDlbFdcm0UL0COBPUrChae5lvVEJvPuAPlnmafU69/SS2wVchfiL7iYdSWt6/6ZxgmXHHFlZIIvIfRUipE4tH2vXflkLWa/FMVHPm3F1L3fWmV1faZZdBGnkC/UGycDpval4vbYzjh2p5OkwuP6Dq00LdZZG1RRKkqgoAQtVI3OGlI0TDBD+CY+ID7L1bChjkFMC90NLKp5DyRmfHDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY/S3ATxP/+0mwpGLVVfmO21NZOswhDnZIU04JyGf7s=;
 b=SUMAYRIbydVHzTXxwY0j68gTWVZi+Kl/LGWHk/CghO678IV5yUCbcMxIl8oDCPrB1Yke8jV92ihGzSsffYPz+b0BdD2k60JQg47NvPiinFCjHuqbAv8sFJA8Ilyy5HOjS1IUYyq8HfTp/QWhYovR1qHe1oQBJBYRvxop0fUDUju/oxL+Rv6pUA3656EJfp2hOKhYYhIxm0hBrkAiq4Sfs866riA2o5FhUNRD+9G+UD7JJSBnS/od4WzGBjvH9GKgRjm5RxxsJFaVdJcMO6sBmtZxtB45CSmfS3CG50xRtvMszxAuMk/oCcOqllH5hiKmvtRS/KvlO11PClwU0lhzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY/S3ATxP/+0mwpGLVVfmO21NZOswhDnZIU04JyGf7s=;
 b=dddBdx8+C3VI6DBuN1jo4/pXtaJQRwCfuH3+TVu7TI2/zKV/xpA9Z8NjLy7FG2+Lk7aqGmPnl/cOl7+wpT8r+7eYuPDi2N1s+cCnJEXst5l1Lwbg8clvSJgEazuREksCcK4lRK9YrIdHLJAvFTcMHcNfdres3wvqO/uEREh9sGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 20:59:03 +0800
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
Message-ID: <ZBmqFyvCarjGS/qF@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <ZBmhJfBPtdLPi7X/@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBmhJfBPtdLPi7X/@Air-de-Roger>
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de9a5f2-d426-4efa-893c-08db2a0c1d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PtyQXHi8pkXq0bkwK8Q2hBlXlCav/fcmg8G9IdIKgUXVttZ3QI55Z6TSd8nx2V9QSql+sOKABglOZcihlDyRcJj04e6z/UaBUvf3rajy98foaJnk+dAa76vzi5M7kPRvjpAd1uLzND+2epwbz8GhTQz6GQav26U8KF+MGizCZiB4gtwg7V4U99FYxVTc1bR1LFibSpkykAREtfCrQPC0wcF8V1+BSWFc/5NxkdSPSGYvQoHgQVJKP3n5r66+SSpr39rJV6q3M05wLq29hzsU1NGC0LFoTSbkOVXwnqqoARp1B3GUucrEnc9ve3r0stqbuzomsHH7dX5S+CcOFbFdUZtIZzU/1pVcwLd7LyMqthTF2s8AJSxtw1s53zUMn0Glemn4FicQbjunAwLxZnb9NpUHc9qHB6Uqh++QUkVW/T7R3D2bxcqX56DS11oxI6juiVEUjWEs3j5vJ4hqG/zfE2HwfFAlYZVi11+y2gwW/k5kFUfAJaM77h7Ph0vYiHkYoXz0G2IkBGfitEs4EN7A711Ac148/JLtNgndBT4mYUZXxCxSeoBUNRx33xqqh3hnZ9/rHVgCnVtzt/nDCmHl0N95p3yPfgdi+usqycu9SYkqv0ExayaQ7MsG1A7aJjSr5nNvbwm31nmCYtfZKsSiZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(38100700002)(86362001)(316002)(54906003)(8676002)(66476007)(66946007)(36756003)(66556008)(8936002)(4326008)(6916009)(5660300002)(41300700001)(478600001)(2906002)(83380400001)(6666004)(2616005)(186003)(6506007)(6512007)(26005)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TR1EzD2wJArNgjRNV1820GFPN1V5xj2fmRQBX/vLRl18OS955muoyU/KET?=
 =?iso-8859-1?Q?gH4fRuGIF2lmyAS/ptpd3aUYb6LiEKTyeRxIoYZOQlwNuMqkl8DLjIBU9m?=
 =?iso-8859-1?Q?cMTk7B0hZUf+nKxIZNs3r414KYhmcy5tQCjLegjTArtYC+hv+wXbCZtue+?=
 =?iso-8859-1?Q?zoyOf0gMMuvq28rg+y7KVn1u8yZncpcIwK24EVOF8YVhkVVQsATc5MN2xi?=
 =?iso-8859-1?Q?VI8nseHwDpQMt0sumcZCw7BAbewiaQsYBkYqVPgS2eSgwZDHqiBzpo6iQa?=
 =?iso-8859-1?Q?wxyhftrcb1162ShsCANhkfHy7VbfbUEzCzdL8rVbzaGkGy+EJXtnScd5yh?=
 =?iso-8859-1?Q?4uN/MM8Midoo73iTS/roaOL2YOa4QYW/gZrNfPUmuUo1C+hp7d/LNwcnoS?=
 =?iso-8859-1?Q?uIJXfWzSC5oeVwxDJYvVNtG3ksvXWmHrGHh5yRKPHIPwhSPjHnuvKHKGx3?=
 =?iso-8859-1?Q?1xa5RFNmHT73Wd+aFHpqJ2nNlE+57HQH/f8r5BeLt4POlQxllISad0v1xl?=
 =?iso-8859-1?Q?OGWlWGUQfYYjMbRMnCeummZJTzFUHEmBr5ReeH1ICMgpz18k2RY63xs6YR?=
 =?iso-8859-1?Q?cQWkS6vH7dUxzBNLpRFDR4TlmwYkWS8QTdDKT9sFMHR09p7/opyQg+Ts8M?=
 =?iso-8859-1?Q?hZ4cLX9NjmHFVUMZ2q5Rw9xa3HUlxJnbgvIKtl2ca6Txp+x0q7aTLYW8Wo?=
 =?iso-8859-1?Q?C2JuQlUtET6MobV7+GHDT2FfA/uN80pum+6gizX4yb8OHbwiox+7oIiR4e?=
 =?iso-8859-1?Q?xTz5bzafvJynUlhbS1B7We17gVVAkwgLk01dVk7Hewi4Pz4GdbsnSdsRUL?=
 =?iso-8859-1?Q?OEFPwma9qB1MzDXyHAbOpwaB3V2laa5Rw74pThi7+cs5tIJGeF4hGA/O/D?=
 =?iso-8859-1?Q?vm5RuzKvNTk26K3JcASRf7pBQYCaR8mHQwgXdoIhNdhPuY61DVUDtDExFS?=
 =?iso-8859-1?Q?mw2/48eQoMlqbdfZJpZPjLTnjD3EzI6DhAYSyOPyyw0MHBYg1OfR1ddG72?=
 =?iso-8859-1?Q?5qxTU7d+rsy5qF1wJJ8JhZ4W1keaTTkpM1TTPY97glSAhZN7SgXd5rXPSj?=
 =?iso-8859-1?Q?cHNgFKreOe5xUJUP2iOQQeKRWHP7NSI13SKAxmPXaHbYw3wjVCKlbhhWph?=
 =?iso-8859-1?Q?Nejx5DcxZPZ8Gdg1q7ykSybDBXqBSYDyCDN5kqZwve2JkJSRrUpvaTiRTP?=
 =?iso-8859-1?Q?AuRyA3KbZmSpsnrQP2QAMvv7QumxO2HYn9nPc0CCn9BD+LB987ESamvi2A?=
 =?iso-8859-1?Q?ZVc/mc8OTsSTYWzydI0IPfsj1GYAPw1rBLBwZZLZ9qUkKwTizZh1lxXIQs?=
 =?iso-8859-1?Q?kO2qTkmzG4WnXC2K+fyzlV3E7fVZssotInUNxqXI80l7GYpQYlY9+gzAfI?=
 =?iso-8859-1?Q?xmVlP+SUJJg/9pphfIPfY3QzAb8oe63cFUlqh4czEkHF0QaHi6KLy+SbG2?=
 =?iso-8859-1?Q?ShLg2SgEwwGVXZkQC+S7VrVSEFSIf2ajNtedZhzdw6XuQxSr7to7xARYQL?=
 =?iso-8859-1?Q?Mb8NajERxAxb6L/6xz8eR8EpWSnZk0DWxhDR3AtBVE2T0WL/ADRfWS2LCy?=
 =?iso-8859-1?Q?sZPWwoPQDgASgCxVBgbBlTwCmPNnt98X6YblbbdJgyEGN3A6RWBirTn688?=
 =?iso-8859-1?Q?LOBSt9IP5IYXd054d7xHPTRMKAVOGB182V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de9a5f2-d426-4efa-893c-08db2a0c1d18
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:59:32.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ivCBATVz4qsqrRhNJyF+hihNV+Z+QdTT8TD0XAHgaJ0w1X+xzLceHb7Oy3O7vRFpngmmadIxkreftxJq+S3GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298

On Tue, Mar 21, 2023 at 08:20:53PM +0800, Roger Pau Monné wrote:
> On Tue, Mar 21, 2023 at 07:49:26PM +0800, Huang Rui wrote:
> > On Tue, Mar 21, 2023 at 06:20:03PM +0800, Jan Beulich wrote:
> > > On 21.03.2023 11:14, Huang Rui wrote:
> > > > On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
> > > >> On 21.03.2023 10:36, Huang Rui wrote:
> > > >>> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
> > > >>>> On 12.03.2023 08:54, Huang Rui wrote:
> > > >>>>> --- a/xen/drivers/vpci/header.c
> > > >>>>> +++ b/xen/drivers/vpci/header.c
> > > >>>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
> > > >>>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> > > >>>>>       * writes as long as the BAR is not mapped into the p2m.
> > > >>>>>       */
> > > >>>>> -    if ( bar->enabled )
> > > >>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> > > >>>>>      {
> > > >>>>>          /* If the value written is the current one avoid printing a warning. */
> > > >>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> > > >>>>
> > > >>>> ... bar->enabled doesn't properly reflect the necessary state? It
> > > >>>> generally shouldn't be necessary to look at the physical device's
> > > >>>> state here.
> > > >>>>
> > > >>>> Furthermore when you make a change in a case like this, the
> > > >>>> accompanying comment also needs updating (which might have clarified
> > > >>>> what, if anything, has been wrong).
> > > >>>>
> > > >>>
> > > >>> That is the problem that we start domU at the first time, the enable flag
> > > >>> will be set while the passthrough device would like to write the real pcie
> > > >>> bar on the host.
> > > >>
> > > >> A pass-through device (i.e. one already owned by a DomU) should never
> > > >> be allowed to write to the real BAR. But it's not clear whether I'm not
> > > >> misinterpreting what you said ...
> > > >>
> > > > 
> > > > OK. Thanks to clarify this. May I know how does a passthrough device modify
> > > > pci bar with correct behavior on Xen?
> > > 
> > > A pass-through device may write to the virtual BAR, changing where in its
> > > own memory space the MMIO range appears. But it cannot (and may not) alter
> > > where in host memory space the (physical) MMIO range appears.
> > > 
> > 
> > Thanks, but we found if dom0 is PV domain, the passthrough device will
> > access this function to write the real bar.
> 
> I'm very confused now, are you trying to use vPCI with HVM domains?

We are using QEMU for passthrough at this moment.

> 
> As I understood it you are attempting to enable PCI passthrough for
> HVM guests from a PVH dom0, but now you say your dom0 is PV?
> 

Ah, sorry to make you confused, you're right. I am using PVH dom0 + HVM
domU. But we are comparing passthrough function on PV dom0 + HVM domU as a
reference.

Thanks,
Ray

