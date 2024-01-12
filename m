Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7A82B8CB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 01:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666592.1037335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO5rB-0002cc-4m; Fri, 12 Jan 2024 00:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666592.1037335; Fri, 12 Jan 2024 00:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO5rB-0002ah-1z; Fri, 12 Jan 2024 00:57:09 +0000
Received: by outflank-mailman (input) for mailman id 666592;
 Fri, 12 Jan 2024 00:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qME3=IW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rO5rA-0002ab-94
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 00:57:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80349abe-b0e5-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 01:57:05 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 00:57:00 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1%5]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 00:56:59 +0000
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
X-Inumbo-ID: 80349abe-b0e5-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmAbkXN3MLw4K4vAhMNe6nFobkvhvydJqI+7XmLPWYmgoaVwDComIAO6tSSbw25A7bpDu3Cq4VDISFEMp+q2VSWanCXbz0axlEL9RkvHTZPi5mNGV9/MXGU1I9KUf69ONDsWRDZzPVzZr/fNOpNXJIORtl7iEszN3odLxhl6plEl24FYxuV2xe7PWvLSakMhl1i2M5dF8RoH6J+EIHF+brjAOkQYDWsAKcqj7ggHmJk7O5r2X7ZICcI4uFlLngU95bbh2pyhLlBWzZbRZJvvRlSEh37KH69Awt9+p1zkGM1+ycH4mKx0EtB/tZA5EsIPPBHHniJLQAzHyuF5h2+wsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yqcE9/4t3fsWghOpIdyTxV9b2TK+2b50BVGqPPikeY=;
 b=P/zzmEyAg6Iqn3JpRdVkGPfY/w6RQTsO5juO+mJrYlyfKV1l68HBKFXoJs2jjIPQ19AVSSXDeFASjIs7qQd0IJlVyLsUkUcKnLpOHvQwiF/E/EIJf9KsKyTgbViFezlpJPV18OG1DXWpsqOpEwW+yI3AxVteOzn1BXz4YZUfCELnvYdjDoyGs0cOqszmU959lno5c24GfLNNRd/+NPNxLKYAJXNArRZnf+sXWDu/Sk58vSfPMbw3JSIjNBdpziqxVuRG1U2EVpRaGzsJHc6yGgyzePmjMImvumXAM7UYmamcmq8DlTJKhl+5JASBxD1PZsKbByoq2hn6452PTZnybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yqcE9/4t3fsWghOpIdyTxV9b2TK+2b50BVGqPPikeY=;
 b=RA13C2rSWy4bBT4szjsdkeh4mAngqtMJnIPX3kXv1UcCkL6gdTVfGOI32Jo4rwEpBv9Ehqxz773qhRAXpdKCQwBZ5YlR1abWxHlZCSYY+F+uCInjyH6JzJN+K/j6STAvn4U5N9DnLQyCfDhIvFI3Ju+GOV6iFVJyhoinI72smcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 11 Jan 2024 16:56:53 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>,
	Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Bertrand.Marquis@arm.com, michal.orzel@amd.com,
	Artem_Mygaiev@epam.com
Subject: Re: [VirtIO] Support for various devices in Xen
Message-ID: <ZaCOVSuEJtsAj9G5@amd.com>
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd2c670-4e23-4289-6730-08dc130961e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GTWpPctJQWsqbHvpWNzQvLsApNPiiHxxoiieko6s3T8tYz4dtxXhNcsyyQZuZZDu8wEGD46xn+MX19Ls85XF4pLzNkY+NhSqv4KeCwasZS//CQeoYAvCt3LXyjcS7/67F1Gl+aKl98dGhLj1+tMdA4RCPK4NaHFB+IGKnCbQ0NDSuBZJEUQJ5Ti6QcIKin6suzuAhgbSCxlEBaRzgYrMvZW3znVEVMhCN+VbXX9BrQkrfgl/tKgcllUuFhmtrn5U7z+H5B55iXGX8AOOGKDibXAeIVkoaZ8L92laI/lJvwM4fr4GD6v29Zj3HHiAoqnED1zTqIFDYdbhrHuum58Azz6GYbG9iKxkUrXUns1pFElhgKvow83JlCf3yCnMrRZhJNU9U3ylqYzD8X8m1d8zsdAGmyrvbJTAUzah675TN02d45iBnN1jg8ufHGWKJpQHf2kXntk3jTqg2oH+IreSBCWfG4Pq1CDR3pACxiKJh5R7zXtJZLJKTNVxWP5lV7a94AgHZcDhmqS+36tIdx9vCKh1AudiUFGUzFMwh0iK+WdeBh4NNq5K/MKV/sc99tfigxgi5kaLEbp/Stm2qxp7Mg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(36756003)(86362001)(2906002)(38100700002)(83380400001)(478600001)(2616005)(26005)(6666004)(66476007)(6506007)(66946007)(316002)(54906003)(66556008)(6486002)(966005)(6916009)(5660300002)(8936002)(8676002)(4326008)(44832011)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS95MlVpckJTTmhVYnVvSUNBOXZ2cWh1VWJnRDdBWHNMVGt4NWdxVHJMUVBn?=
 =?utf-8?B?L1pqemFqRGN1S1NrYW9LRTlVMk4xQzVwYUtMcGM3MFVFYnUxQUluTzlmRjc2?=
 =?utf-8?B?cHd0UG1JbGZveDVKYU1QUE9mMS9yUUlobzFtOVV0THdMczFaNVU5bUQwMEgr?=
 =?utf-8?B?bzMwNEhTNk1meTlKZnFsVnFqZml0QXZOV2cwaS9PK2s3ZEp5T0huMkJaVDNI?=
 =?utf-8?B?Zzlsd09EcS9DcUZ0cDNCMlZtbmpGTGEvcVZaWCt6azNHM1NPYyt4Y2dLUEVO?=
 =?utf-8?B?RTlOODNVT2lmWVVSWWtEeG82S1k4M243SlB2djhVZWw2eUZVeVVYbUJCMU5N?=
 =?utf-8?B?TVJFaENCMmRaNVRwRWE0UmoveGV3QzBOdDZpaExGMHpyd29KajJQU2V0L0JY?=
 =?utf-8?B?T3Y1bUZYdUxXVHQ4cFhUN1lyVVNhdDVZZ09uSVh4QjFnRVVuWitZaVBiY3E0?=
 =?utf-8?B?ODJ4Q283ZE45cW8ydWxLWVZmZjdqQWhmQTNHeVFnZDF4dkxnVkE2U0ZURHFB?=
 =?utf-8?B?MU1mZENtNEtOYXNmV21vMGNjejRNUDVFeHZyamNhWHFsTVZ5WnpYeVhCZjVh?=
 =?utf-8?B?TXBObWtJdDA5VVNyOWFFbnZmSEE2T2lGRFMrODNUSTFyTDNJTVBoQkY5TU91?=
 =?utf-8?B?VEVPM20xdGFqb1RVZzk2RTBRbUtNUm4zYy9nQVdTbEY0U3dQaWg1Z3Q4Rk5h?=
 =?utf-8?B?QWIvWnpId01jSm14ekRQd1paSjVCQmdrRU9sdm90ZTdMSWk2d3R3dmR0b0tE?=
 =?utf-8?B?dFVDelI3N1NnSFNkK2lGU0NoUDlGeFY5R1JZNTQwN2RPVldTTEV2NnVMQ2Z1?=
 =?utf-8?B?bHBSdXBac1ZjYmxzclVUSjhWMTVOL3pKRWk2VUFvdGg5WlozZEFyY05vYjFx?=
 =?utf-8?B?MW5iWWlDWGRMTXMrekhvWUdsNHh2Z01POVFKQUxmSS83YWEySUwzTDJSTVdr?=
 =?utf-8?B?RHBFaDg5RTBNSXhxU05qcVNMcm10MzF0dWFtM0ZXUVN4bHcrVTlJZzNGdHM5?=
 =?utf-8?B?d2xHOGpwZDZkZWxncmVYc0dFY2ZIQVEzeDZraVJkVXJBRU5DOFQ0R1RXemtG?=
 =?utf-8?B?RmZMUktQQXgvYTV0aWNObXlhK1paaVhFU1dlWVc4elBFU2Y5Q2N5VnRJc2dv?=
 =?utf-8?B?a09HTEU5Y0hnWVc1UmkwMndhT0RSZEVaK3NyNStkS2FEQnAzMjhFVEZnZmhM?=
 =?utf-8?B?bUxzMGFQbHFtUFFkb0RXR1QxRGI4UWlxOWMvY3pSVmY5bUtOOGp6OWpGQ0tR?=
 =?utf-8?B?Y0U4YmtmdlBsdUlkNVJqemhDZmpZK0hTRDJ1SDI3MEQxc1lWdGpZVmVFYlE4?=
 =?utf-8?B?RkxkUHVWOUY3SDRhd3Y2ZXpvUnVkOUVZQ05ZM0h2WU5CT2NiZDN1MWx5VG1t?=
 =?utf-8?B?eThvS2xIcDluVG9ua09aM1l3b1c4eUtYVnlRSlN5OXJ0UGZFL0swZi9FUGFi?=
 =?utf-8?B?OVNidncvNlJqVTNiTGxhVU9RUGx6ak5VSVppeTFvQWJ2L2FDUW9NUm9naFhE?=
 =?utf-8?B?Z3FRRENFbmh0ZHRkNGc1OXFHS2NqOENUSkJZM2FIS1dRQnZ2cnJUcFBRWE9x?=
 =?utf-8?B?R0pXak1VTTkxcWJTNllUVWhhQnlFM1Z2RVVGM3R1SVB1UXh0bFprVGsyb2FV?=
 =?utf-8?B?QmRYcjMwbEZYYzl5bVBST3FnNmVoL3BqQUxKdzI0VUU4MU9NZXR2L2djSzBO?=
 =?utf-8?B?QVJBTTk1TmZaOFFnK1VWbWE4eXRVdzBhTVBkaC9wcm1aeWFlVzg5RWJFMTBi?=
 =?utf-8?B?QkdKWUQwU2t4aGFJcWF1cGZ6UDBocCtpYi9MaCtXN1prT0VYR3Yra3BlMWJh?=
 =?utf-8?B?NzIydnpwTGpaWm1VSVJYVGc4MFZDK1pXeFAzNHB0ckNqLzJBaWMwZFdnRlN1?=
 =?utf-8?B?eTF1b1FZeVVEWmtSTGxDbHdoWklSN1d5T2xNb29SdURpTDRhOXZCMEpoaE8r?=
 =?utf-8?B?aXlXa0R3TmdLOTE1V2IwaGJmT3Z0Q0Y3anROcDllTEh4T1ZNNjZoUysvZ3J6?=
 =?utf-8?B?K3lGVklYdTZnVGJ4TVRGOVNRZHJJL2x6dmhmb25uVGgra1pLa2RETkdqSmpU?=
 =?utf-8?B?cTlzNEk1OTRsRzBzYzVBcW9xNVR6MnpkeW1YUUJBZmhOOGR5M1RrUnJZTlZa?=
 =?utf-8?Q?+GCXWBM7dQcnJ6v/gy86UYJEX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd2c670-4e23-4289-6730-08dc130961e5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 00:56:59.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwkjnTNOC++UoDEvL3RwDKzQrvDGVhWS/4AJGz8baQvPjLqXiCIv2h6tz0zxZ/Ql90N2XpYdDkWQPh2Z/ULHnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

Hi Andrei & Stefano,
On Thu, Jan 11, 2024 at 04:35:22PM -0800, Stefano Stabellini wrote:
> Hi Andrei,
> 
> Great that you are working with Xen and virtio. We at AMD are very
> interested in it as well.
> 
> I'll let Artem (CCed) and his team comment about the xen-troops
> repository.
> 
> I can share that from our side we are working toward adding complete
> support for using QEMU as virtio-backends provider. Vikram (CCed)
> managed to get virtio-net to work with the backend in QEMU. He should be
> able to provide instructions. We want to get those patches upstream in
> Xen and QEMU as soon as possible.
Actually, QEMU patches are already upstreamed for virtio-blk and virtio-net
devices available in v8.2.0.
For virtio with grants, the patches are WiP.

On Xen side, we are yet to upstream xen-tools patches which basically generate
the right arguments when invoking QEMU.
Here are down stream patches if you want:
1. https://github.com/Xilinx/xen/commit/be35b46e907c7c78fd23888d837475eb28334638
2. For Virtio disk backend:
    https://github.com/Xilinx/xen/commit/947280803294bbb963f428423f679d074c60d632
3. For Virtio-net:
    https://github.com/Xilinx/xen/commit/32fcc702718591270e5c8928b7687d853249c882
4. For changing the machine name to Xenpvh(to align with QEMU changes):
    https://github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a
> 
> The libxl changes are lagging behind a bit and you might have to use
> device_model_args to enable virtio backends in QEMU.
But QEMU 8.2.0 can still be used for virtio-net on ARM.

@Andrei here is an example on how to use virtio-net with QEMU:
    -device virtio-net-device,id=nic0,netdev=net0,mac=00:16:3e:4f:43:05 \
    -netdev type=tap,id=net0,ifname=vif1.0-emu,br=xenbr0,script=no,downscript=no\
    -machine xenpvh

Please make sure to use xenpvh as QEMU machine.

Regards,
Vikram
> 
> For SCMI, I'll let Bertrand (CCed) comment.
> 
> Cheers,
> 
> Stefano
> 
> 
> On Thu, 11 Jan 2024, Andrei Cherechesu (OSS) wrote:
> > Hello,
> > 
> > As I've mentioned in previous discussion threads in the xen-devel
> > community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
> > S32G automotive processors (Cortex-A53 cores) and we wanted to know more
> > about the support for various VirtIO device types in Xen.
> > 
> > In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
> > as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
> > virtio-gpio.
> > 
> > However, we've only managed to successfully set up and try some
> > use-cases with the virtio-disk standalone backend [0] (which Olexandr
> > provided) based on the virtio-mmio transport.
> > 
> > As such, we have a few questions, which we haven't been able to figure
> > out from the mailing list discussions and/or code:
> >     1. Are there any plans for the virtio-disk repo to have a stable
> >     version? Is it going to be long-term hosted and maintained in the
> >     xen-troops github repo? Or was it just an one-time PoC implementation
> > 
> >     and the strategy for future VirtIO devices will be based on a more generic
> > 
> >     approach (i.e., without need for a specific standalone app)?
> > 
> > 
> >     2. With regards to the other backends, we want to try out and provide PV
> > 
> >     networking to a DomU based on virtio-net, but we haven't found any available
> > 
> >     resources for it (e.g., the standalone backend implementation if needed for
> > 
> >     control plane, configuration examples, presentations, demos, docs). Does it
> > 
> >     rely on the QEMU virtio-net or vhost implementation? Are there any examples
> > 
> >     on how to set it up? Any required Xen/Linux Kernel/QEMU versions?
> > 
> > 
> >     3. What other VirtIO device types are there planned to be supported in Xen?
> > 
> >     I'm supposing libxl will also need changes to accomodate new configuration
> > 
> >     parameters for each of them. Or is there something I'm missing?
> > 
> > 
> >     4. Also, while we're at it, are there any plans regarding SCMI
> >     awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
> > 
> >     seems discontinued)? Or is the preferred approach for sharing SCMI access
> > 
> >     to guests through virtio-scmi?
> > 
> > Thank you very much for the support, once again, and we're also looking
> > forward to the progress on the rust-vmm initiative.
> > 
> > Regards,
> > Andrei Cherechesu,
> > NXP Semiconductors
> > 
> > [0] https://github.com/xen-troops/virtio-disk
> > 
> > 
> > 


