Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB278B546
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 18:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591699.924154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf08-0002aV-IS; Mon, 28 Aug 2023 16:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591699.924154; Mon, 28 Aug 2023 16:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf08-0002XS-FM; Mon, 28 Aug 2023 16:22:04 +0000
Received: by outflank-mailman (input) for mailman id 591699;
 Mon, 28 Aug 2023 16:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXm6=EN=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qaf06-0002XM-74
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 16:22:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 033cc35b-45bf-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 18:22:00 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:21:54 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:21:54 +0000
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
X-Inumbo-ID: 033cc35b-45bf-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFsotpgG1RY7dKtC27FqI3bvo7MU5hyUGJKmMdtKsVKzLYiUvhQh1y/xi4pSH9az/rNSpuYwt4cSwCtY8TaNIKx++suKG7w93QkEoYqAxCe44D1Mqj9m3WgtXygQ+TDAR/NbfzA3ekxmp9GLvi67U3S8BUMKfpRPVExNLOONu0LKFYbw1pImx6m+fEzfqkqeydjza2um91x0XAS0Yhx7l3zErSsjDW+6l2M1STpqmnFn/ayfZIbSRbke4E3HqVVuwVLLnyEDiyjMtYR+nSqBD9C981XTQqFc/mlJ9bC0GFvXLbbOhJ++2djYB+QxjjnxXI/G52pdSYX3kR+p0I2mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SSjuE/GCajdaTJNp4yiC3EW6+InoAD5ApDD+ZM2ZF4=;
 b=QKns76NaTudywW0vkUnC4imJWkTFP1x23bU+Vtr/nLFKge1km8FtISgwdLpePa5r0B5/lck6D/U0KOqlLlnc2gw2rRLBrxCktTEW0IvV+myzLq25SLjCdvI0H543QNzb9AHbcuA+bWZAUPwsY19Xs790aAfVChwN4tn7ZR2bv5OiunSYiX6Fa9/xCsecizaiT6HcqQyd51ss8Ghcp7LQcBEYFfDow4pu/m3Bll9Y8jOECKe2gJUTj754sm+mgRHQFflJ2ThDBvDeLQ0dZ9n5CmF0zhyNTmY2Ey8A1S8DYaHgnxkbDoKUXd6xB2mFT1QKzcUl+MfQjnO6tcuVdiGtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SSjuE/GCajdaTJNp4yiC3EW6+InoAD5ApDD+ZM2ZF4=;
 b=nHqoL82/OKIVEWP6rAbR9l7c4mknnbOKCx5WDG/0NA1IuQa0Hr38yE9aeAvhwth5EcL1OIPUIpxyK09lFewYFtAooGyPeqXdqifkxTvjGCPKxa8VZo6yd/W+ZAV/Oya6F+XakOhP023nz/AZ2ryAlY0rs2MAdHprT2IxJAS6kYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 28 Aug 2023 09:21:50 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 03/20] xen/arm/device: Remove __init from
 function type
Message-ID: <ZOzJngLaiVrM6V_w@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-4-vikram.garhwal@amd.com>
 <2A11B6BD-60C3-49A6-9680-084E41EBCB6D@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2A11B6BD-60C3-49A6-9680-084E41EBCB6D@arm.com>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c5bae9-c94a-4477-c0c6-08dba7e2e461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sXgJYmze+f6ytZ+KzUhLIWODvedVQ3QudoXaY6inW5cKpY6iculzaG8NFHTy16i6rmxCGFTJwvhxOtvQdOri10W8z8VzUyjzXMn3/E1OAhKFL5UJmbsvMzsarO9RnwY2bemJKbiJxgtEtVEHOiiELzGwgQ9cKgGGfauOlexTJlxc8W9t2mJSyVviH/JyAZRouaEGRo2+966r1UcfEkGzkd4Va1lSsmZv0x85oXM5NfMyS7aDTFTpVQQPTyT6Fh//So8tDOIyY4a+hBJZ+CYbpl8jR37OKF7INWpL/A50VaXg/ChoiMFJxGHd8SwhrTw947e6jNDACo0bvhjIqMW60AlUMY40P/SsFQ5Izjis3CHcz1mxkzQZ2AjPqVbmY2ON+EOJoxYkaulfzXe6jjFEjGK12LJwmMHcM+2Y7WUQOCT5sTtD4ggPtaaw/cbkZLMVcOzZk79ADWTovdvvf0A0g3MNW5mi5inK7luF8Ko1W/VfGZoBSwyg7qnc0efivhlWZqEdsjyQp3IrTT7MHgQTCzd6HaYP+/NP/jxQ9xYz+2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(186009)(1800799009)(451199024)(41300700001)(38100700002)(6666004)(86362001)(478600001)(966005)(2616005)(26005)(6512007)(6506007)(6486002)(53546011)(4744005)(36756003)(316002)(54906003)(6916009)(2906002)(66946007)(66556008)(66476007)(5660300002)(4326008)(8676002)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVk2dnVpS1VOcENZb3RuZmh1QWU0UDVGQXprYi82L1g5dkJXdWZ1YnRmWXRo?=
 =?utf-8?B?ZGxQaUdOUnNrQzVMSHk4ZWxFd1pqSzdBYlJLZlpSR3dGb3cvVlQvTEx2ODZ6?=
 =?utf-8?B?NElVZ1hMMGhRRytEU3Y5TkZYNkt1dGMyVzJKK3NTOVJ5M1Z3QjhZenZYK3Rl?=
 =?utf-8?B?Rk4vRHFsbjYxM2pyMENXRWhJY2N1bnc5NmM0WEJWN3ErQnc2YnhYYUt1RTRl?=
 =?utf-8?B?Yjd3OUU2d01xK3lnUnJHMDhHVUpSenQzbFY3T1JyQzJXc1RmSXozOXNJci9J?=
 =?utf-8?B?dzUrd0RCdzIwek02SDVWUGJyZnRtUEtHbSswT0UyaWtmWWEycEZ2UnEvNUV5?=
 =?utf-8?B?dnNKZThaL29EV1N6Rk1zZHVzSEZaTEF1M29qUUlJU2sxN0xvUlJVVmVDem15?=
 =?utf-8?B?Q1ZobEdubkIrc3RnRkkvQ3JubGlZT21QeUQ1RXNjUkV1bXpybm1vaENpU2sv?=
 =?utf-8?B?cDNsZDdCMmp2OVd6RkVXbFFMVXoyWlpOYnpIcHkvcVdaZ2xCRXJ6RlMwOGp5?=
 =?utf-8?B?cTlrYllvNzQ2cVhmWmM0OCtlOGxTZ29na1o5d3FtMTV1N2FoN0ZZMDdwb0FK?=
 =?utf-8?B?dUdFS2E1QnlSWUFVK3VpZnpUNWN0M0U5MXlEcHRldVdrTTRqRkFiRkExcHU2?=
 =?utf-8?B?Z1dkOVpHT0d6ZGFOUVlreXQ3enhEZFRpV20xS3ozUkZHUzBPZlY1U2cyaGQ0?=
 =?utf-8?B?OWFsVjkwdXJEcVlsK21tZmovcEp1d3ZidjgwUkNMKzlDTmREZThrcWtiaXJs?=
 =?utf-8?B?N2lnekZYOStseThBMEFiUlpUZmZzNlMrWXFVckQ0bzBzcmovckEraHBLWisx?=
 =?utf-8?B?VzZIV0ppMHdlVEN5blpxemxRS1NyYVVwdXlOSk5MdGZJYkluMnNGSWl3U1ZU?=
 =?utf-8?B?cGJJZDRXY3RzSEd4VFZldHl6ZmtlejFSK2FBV2xkTnpGR1JBK2VOL0RsNkRW?=
 =?utf-8?B?WGk3aldXT1Q4OU9IeTUrY3hpVjVHMXBFcXArVUtKL0NrUDlSVjUwbWhmTEJ3?=
 =?utf-8?B?VElUMUNsRy9kMmVaMTExTVFIelVGNFZZdjJJUkZFL2Z5SXg4bm80c01OdWlC?=
 =?utf-8?B?N0hXaHFsNWdHVnVLRGVKaWJjTDRXcTdJaXpxaDZ4TzZIUUFFRmR1cHRpK0Z5?=
 =?utf-8?B?eHhlTTYydUNGeUJRbGhtb3VXOEtyUzJ2V3JZZzhiS3hVUVZybklWQjBOL0dM?=
 =?utf-8?B?elE2Y2l4cExnbS9LVkIzMElReXcvZFZtM0NpZ3lkNXZMWXFxd0pNeVdITWlB?=
 =?utf-8?B?bXRuYkRPK3MzdU1oZ24vYWsrTll2WXJEdzVGS2xvbzRGWjNFTE5WY0tsRis4?=
 =?utf-8?B?Sys5emU2dnRROVdZaFZSWGY5VC9ZemxqYTRURDVYOGxERlRLUXdZR3ZEa2VB?=
 =?utf-8?B?UVd1OXl2V2hHMGhONWZEWGJOc2p4V3ExV2Q3aXgxNnFtWmtDNU4yU1Q1YVZ2?=
 =?utf-8?B?blJ4Y0VNVitQS3RMU2gyNFZVTnkva0Q3K29ORVN2Smsxa2VtMlh0SFJML2NE?=
 =?utf-8?B?ZTNvRlRuUE9HcE13dEQ0NEJ4aE83MFQrRUZ1MkZOYmRKU2ZOaFFVSXE4UlVt?=
 =?utf-8?B?enJBMmZTOTBJK3ZGWlVQZGl6aVNqQmZYWjlSNS8ralZYR3JGUFpaejhYM0Qw?=
 =?utf-8?B?T3dtUDlJUUl2RVpNaWhUL3duK05pY0YrK1ErVmE0Q3Rhd2o5eEp5b3BSTngw?=
 =?utf-8?B?SHREWHg3VmIycVdXaDlzTGY1S1Z4cDFwVHhoVjFTbUFlYjIwTk1TNTVZWitH?=
 =?utf-8?B?Z05ZVmROYnJxRzl4clRwOE0xbk5qQzVmbHV6TGtLd0NSSG12OXdUMkVnbkxz?=
 =?utf-8?B?YktabEJGak1NYmkvZWxnSGppaEY2ZUZTNFhQZnl1TkYzNmJadHhZQ1czQVJJ?=
 =?utf-8?B?SHRLbnJYTDF5TDhFM2tsd1FLb1c1NU5QTmtUMDZWSjd3RXlzVmw4R1RKdUk2?=
 =?utf-8?B?UUJKQ2JNOWRlZFNSRVNMV3FCQUk5R2kwQzUzRTRDcGdqeVZ4OTVkMXNBUzB3?=
 =?utf-8?B?R0hVZkVxeW5zZFYwUlp0bFdNT0VkNTI0bDAzNWY1T2xxVm1GRjNlSXlCRlcv?=
 =?utf-8?B?ZnZSMis5V3Y2eG14M1lnWXdKZlFwMVFuaFFoRUNoSXM2VWNoYzVobWdrQjl5?=
 =?utf-8?Q?FKDU7ho8eRFbEFI/QG9yjCup4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c5bae9-c94a-4477-c0c6-08dba7e2e461
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:21:54.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69ykpPnDeW5Hwtl6XjHfM57qtRrmQBe25fZrw5uCsLmGiUY69IdZGZCtfPJXIYJfPxV+CTlU4NOvjHVKa8JyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

Hi Henry,
On Mon, Aug 28, 2023 at 01:53:15AM +0000, Henry Wang wrote:
> Hi Vikram,
> 
> > On Aug 25, 2023, at 16:02, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
> > 
> > +
> > +/*
> > + * handle_device_interrupts retrieves the interrupts configuration from
> > + * a device tree node and maps those interrupts to the target domain.
> > + *
> > + * Returns:
> > + *   < 0 error
> > + *   0   success
> > + */
> > +int handle_device_interrupts(struct domain *d,
> > +                             struct dt_device_node *dev,
> > +                             bool need_mapping)
> 
> I think you missed one of Julien’s comment in v9 that this function is
> suggested to be renamed to "map_device_irqs_to_domain" [1].
> 
I sent v10 bit early. I will do the renaming in v11.

Thanks,
Vikram
> [1] https://lore.kernel.org/xen-devel/5908b638-f436-4060-a426-9839fc563c63@xen.org/
> 
> Kind regards,
> Henry
> 

