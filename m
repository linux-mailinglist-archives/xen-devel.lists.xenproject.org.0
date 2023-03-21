Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44026C2DFE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 10:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512274.792150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYQA-0001A6-L1; Tue, 21 Mar 2023 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512274.792150; Tue, 21 Mar 2023 09:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYQA-000184-IA; Tue, 21 Mar 2023 09:36:46 +0000
Received: by outflank-mailman (input) for mailman id 512274;
 Tue, 21 Mar 2023 09:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peYQ8-00017y-DK
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 09:36:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e27175ed-c7cb-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 10:36:41 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 09:36:37 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 09:36:37 +0000
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
X-Inumbo-ID: e27175ed-c7cb-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzXuDvUnM5hfmes0La22d/LwdhPetIJynkd3d49Y6UqyHkrzKiVKWV3h1IXp8uLSr82EKZPruBHXeZV8vzn5sLcfeub0FCnI1+wSRCkbTFox1t9mtS15f4Nzlx9bX8X8X/cQMgGpxLwW1hRCc50z8dj8ATsCkhnKwn5XZ20pzuDobwMDh4E8ZItpuJP2I8R8Aoo45Csoa9Dz8Chg7hr4ojusVjR1E2HGvrOTeWHxlNx/C6GPEdObuc2Hg7qh7WRxGSTlxFchpmLJrHZ4OE0uXEDZG/Soh9NEoKSEYfFiGWa3doFsIyH4Oqk9vVWhc+WNlSu8ydOU9ZEU8gvqqc56tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6O+SpqqaInD7XyHgyeS+tF8D5u0zNWAXjzU6g2AX/M=;
 b=UufdGQL8gxwB/iShqCl5590hgwEgylvaZOIH7UswqvOACcdxUmxEMPXoUpzrq/LOGs1uuiD+4Rv0p5blbWRIS30nwtMKvaToUwImeSxgr/Vn2NVAZq8m7R+2CU+aV/JnP+aqIDtjngLqeKqZVyK0IUTqzVTxs5yu1vZIH8yHi4kmQde9xmx9Az9hTUvo8uFui01yVyLmI/YBbYaQPsB5qnfniKkhNfuOT0IiTAj9TYK46T2C9sLNdDE3FcqLrZ+vuc6V4VYR25G1tHwj4C+T6/18aFuE/VXh6NUEAjBAr3XuBIyYHBFDm2g6zLDZT+fK5lOSG18q0k3z+/PVuhWnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6O+SpqqaInD7XyHgyeS+tF8D5u0zNWAXjzU6g2AX/M=;
 b=0ofg+PEr0xQOhon3ahlqKk1wTLvEgLDwRiorpjPKScGEbTmGB3kP1xrkKWYdIOwfiCFWqKkMLhd744zA2fbFzxTbFb7odFGFvtlghfKjfjaaB/9ZinXn/7SPhND5lr/1chJDOCxJfMM6Y8CXWEx2RMlEvUsywYRU0O8dXKEWkRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 17:36:09 +0800
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
Message-ID: <ZBl6iU6T1CsWqVx9@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: af96429a-2994-4436-fda1-08db29efc450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SfCNa/QcFQT1KS+YMsUnevCeoNWD4TDvK++E3AqaxBge66d91vuxQB+uRVIcfOHNcAmOIHc6iajgSuP5XDOWY9oYtvCBeP4QmXguxL0IU/Gac+d0fJRPNnBHHZo4F5HRasC+SIO2nuy/r52Cp4gKWFyY53ivsDHWSXxtFtqk5N1mzNbtNFZVyA2hNkn4c3c9Fzrgv1/aAECaAN+uokz+dEPmuP3okpHXhZfAThTlWKYKOyCMqr7GLzTsNzuRFPDB3LmNjGP5PHuTCePmnbuH4UQ1IKmVuOnlghFSJLEuqrK2OCy7mwn4GgGHHvfg5nfntcMYk4XRQyWmfH+1iE+CjR6t/5JfVqTLiOoW/Wm7fmcUL25vKX/suqZHXHgEvCK3j4i8tYPef5HhBQ3Df/T+w6WD+Aqnca4rPfXU00uoZMjHWRsxXQCl1kMaAM+EYjqY235+a8guij28m6tzjrWLa5/zeTU0F9w8s/el1hMRDVhXc1gPxv2J58FYEaNoMQmAQ0Qz2XFC7xpzkgs+2I0m42dTUbUKpOUL6cdKh/nPm2WH9GUqV8Eluz4aRr0JN0cC29IAbFR4x6o5PUBws8MfGVlDeHa/v1r+EOpGzG5em5sMdKHgeOpshpO1FbyV3nePOiJ/HrpGXFztpd2PlJDZWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199018)(66946007)(41300700001)(4326008)(6916009)(8676002)(66556008)(66476007)(38100700002)(36756003)(2906002)(8936002)(26005)(6512007)(6506007)(53546011)(6666004)(6486002)(186003)(2616005)(86362001)(83380400001)(5660300002)(316002)(478600001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AEBeJS1f4TpT+3PG6w0gPpHHET8KxLVhTfhfJImRBXNzXTBxsftqM3tckYix?=
 =?us-ascii?Q?sG5zcYzygvU1n9SsGnKSfwLkIZFXvPtfFcmNaVyd5lWulhZvtdNVwPsVqABt?=
 =?us-ascii?Q?499Y6f0NaF9CkyJeU/XI8Wn+esTG9qSLGPZal27bDY4/qZfnRvFgVKGFMr8v?=
 =?us-ascii?Q?eh3v+hsQ0JtwurWgUADxpNmXpGrF63w1QNuMgue2qXlPL2v4fP5GJtdzJfxI?=
 =?us-ascii?Q?Z5wsM+MvTsD3x7qVCQXVazhNZdNfOba4or5ILpA+QwBOnao/oy2SYgvNbvKr?=
 =?us-ascii?Q?0trkMb1hTk7EaIno9XyaEs6FtyDmlAcgf9/rO7kMNF9vW83XhWF9BXokNMCl?=
 =?us-ascii?Q?+TOU8b/VPRPQjDTev+aH685vWHn/KMUg2fwV1wlJ+rq4FTeWAfteis/VU2y4?=
 =?us-ascii?Q?rL8AI9DxbE8bNqFNiOjNfb08ULaNP9wP+6Zz6+yHxPwPDLeBCv/tfMN4yfS/?=
 =?us-ascii?Q?Y8hKRJ2hzqLvGQN1yPJJesEiO26BDV6vUcQ0qcTOpoS42N6oxBTBLmYDL0CY?=
 =?us-ascii?Q?33L0EHYDJ7sM7Rt556MiEnFjTWcMw420d3ubuaUKwHNBN3emxOZII5aYMI56?=
 =?us-ascii?Q?JvehGzgWlq/plzogzSIp0EKFpHiJlxRAc5+aAJICwv5vDOjUi+gu/baGZf2j?=
 =?us-ascii?Q?98hAzVLaJ745NHmZ65nC3SIzWjsuCIYin6K3GhWKB6WHeT04UwLkWLAsJgHH?=
 =?us-ascii?Q?L1WQL4RyyA4oaq7svEz8SQAmvDKld6Waiqz3MGh/ESj6Hx8tzM+xFfCJi5NG?=
 =?us-ascii?Q?kPsNlT7BlZdP2tBXyJFrBEae+/a7JfE6GmA4nfG1Dr4pev3lHt9oSrmbUP+s?=
 =?us-ascii?Q?qZvtMPkL5i6UJPVpSrX0T/UOQlrwkKNmnocmetKV4flFyAXZY3YudARtZBew?=
 =?us-ascii?Q?Ay0S1A17yk7fRb0+UE1hzAD/snWu1Kdt+xIECun693xSYYNXhZRqBOL5+1dp?=
 =?us-ascii?Q?1srv8GrFpX1ftJj5IvoX1pU+pL7Bay8de5QVPR49LEwIxZ/10GiybuBSjZ1M?=
 =?us-ascii?Q?m2xkQIlGzo8Yio7WVNOcfhTwAC2WEios9vhGOc34jOLoVKpbDOHHskIU+JbK?=
 =?us-ascii?Q?X5E/lERE4nFZKOrBCo9aR3DzFkOFRlcjMt6Rx9WjeHB+Mt/X+H1MtOmBREfr?=
 =?us-ascii?Q?sPowqSU3+shWhIW80LAJTPJ7XV7RWF9ec3MoKvLcRNrlcFl/thyLQRV42QJV?=
 =?us-ascii?Q?3UYG/g3Uo6KdxSE0qBN/n5s3eZhD/2g/ApDQkCiCn6h7/udFgPjjl1u8bnzt?=
 =?us-ascii?Q?lsx8JV48uAMJG6Qfsw2LJ2u69YFbuJ2h6rmDquLMg/9bTMfgKuqJCggDXACj?=
 =?us-ascii?Q?dYZBFWvuBH3VVWhT6Gd37uN370YiCWxlJrH+IekeiUXyGWhSrq6wms7vAK/s?=
 =?us-ascii?Q?NISKT1n9qkYo21q4R5dyddkatURaONjuA9cNoUne4Caeef6tWLwpm593F3Tu?=
 =?us-ascii?Q?nQHgN+IZDcGlLTyEjbLq2UCBJu0UvJSTOQuc5lBwwTkwyKTLWM9GEtk2aa61?=
 =?us-ascii?Q?0hGsKTuxQ05LA4KD6zMrKi/v79p6PwzmwujT/c0aQ/z8FNyzN0yLs39URwmw?=
 =?us-ascii?Q?mrN/G8fwR1yV4CaMKo44LwfcKDRahoOP2B7plBZP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af96429a-2994-4436-fda1-08db29efc450
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 09:36:37.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dq1VdMzV5pONys4zHXhVqYZQ7nH8p15jQHpDn1B8yRhdV+3UtrBnCLdu4dnLR8qi/QesYSik8wFY+bGKfj9/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

Hi Jan,

On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
> On 12.03.2023 08:54, Huang Rui wrote:
> > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > 
> > When dom0 is PVH and we want to passthrough gpu to guest,
> > we should allow BAR writes even through BAR is mapped. If
> > not, the value of BARs are not initialized when guest firstly
> > start.
> 
> From this it doesn't become clear why a GPU would be special in this
> regard, or what (if any) prior bug there was. Are you suggesting ...
> 

You're right. This is in fact a buggy we encountered while we start the
guest domU.

> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -392,7 +392,7 @@ static void cf_check bar_write(
> >       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> >       * writes as long as the BAR is not mapped into the p2m.
> >       */
> > -    if ( bar->enabled )
> > +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >      {
> >          /* If the value written is the current one avoid printing a warning. */
> >          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> 
> ... bar->enabled doesn't properly reflect the necessary state? It
> generally shouldn't be necessary to look at the physical device's
> state here.
> 
> Furthermore when you make a change in a case like this, the
> accompanying comment also needs updating (which might have clarified
> what, if anything, has been wrong).
> 

That is the problem that we start domU at the first time, the enable flag
will be set while the passthrough device would like to write the real pcie
bar on the host. And yes, it's temporary workaround, we should figure out
the root cause.

Thanks,
Ray

