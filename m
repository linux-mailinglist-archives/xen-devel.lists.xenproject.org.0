Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B9783109
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 21:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587822.919235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYArI-0003Ti-O6; Mon, 21 Aug 2023 19:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587822.919235; Mon, 21 Aug 2023 19:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYArI-0003QN-L9; Mon, 21 Aug 2023 19:46:40 +0000
Received: by outflank-mailman (input) for mailman id 587822;
 Mon, 21 Aug 2023 19:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tacK=EG=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qYArH-0003QH-BJ
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 19:46:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f82d91c-405b-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 21:46:36 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 19:46:31 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 19:46:31 +0000
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
X-Inumbo-ID: 6f82d91c-405b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwp7ZQmz61vTA+3ylRHM+B0CfhSDPdaVXmg8/UTnGv4O3y1+/FGeGvgAMPdp10wm5QgEEerTyK7sc9HQqM+iuMVUiSvr21XpEtCJiZLoO9XbmnPaMEvcjHkXpOcKCle1aI4T2AiK9HiDzBnlE0231J/zcJcAAbcixupkBQKVcQlb30QrpwNPOWMUT88J3XHMsCnNlDKFj3M8HrjaLGU5ka5bQsXpSCdmrxGAVCPBkz+dNh1T1iIYqVeUDgWfYnRKAdZIMlPX0QvQCSuRNn6sDYyqOo2GVCTx5cpPaX/XT9uC69kilA8FlXEXZWJPbO+OP3pGnjZSMi61JEJeWq1faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c3qeAlpaGDIznTiV52LeUK73FrSjST/Uwpj7NRl5cc=;
 b=bu2g06DVOpERfSwy7TM1+nsJue/5WHWYEcz0+ZZzgmufC0eE3gs0XxYa5mJFKEM7xDSngzTsVnWg2H7s4MEIuLDZn26275+AD5sq3DfhWESFYLpwdtd8tXMopY3F4NUfmnzjEd65UIyxDMmHO5tEISMmovy1IQIeFv6SfbSROday7SYvztUZn8nwd5Ylh0f5DcMsIlKI6SHx+04AHgu9K6Aen/L7+XAtgUpCot55yjXLZUnsxhdHdY5DVQjhXaIzSX1/oPRSw5Trxvdm7047ZWzBcBYJ/wfJJnCv+rISDBQ4febDuEQnyFr1h9fTxgTikJntRWwY3NcpHGUXZcB94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c3qeAlpaGDIznTiV52LeUK73FrSjST/Uwpj7NRl5cc=;
 b=YL/jQRq2T/cUvRaLM2+hU5w9xxx6GUcC1qLHsxtACR+8vPRA+62cu5tVqv8ShXUDx8uPbNbgnHn6up7V4+oOOLWN63NsOzx/a2dSOFsl52NVALmdwwzfwZbpnTkYSQXmnoDLFpM9tyMTaLX/agDdqLzKQrfoGEEY5skzBpkoTQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 21 Aug 2023 12:46:28 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
	sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZOO/FDJaqA68eaAl@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
 <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com>
 <ZN/MDcuo+IS0m5Cz@amd.com>
 <e667948d-944d-2649-7063-3725cc68ca8c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e667948d-944d-2649-7063-3725cc68ca8c@xen.org>
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2e8568-9370-4c5f-2524-08dba27f519d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mj/u02+HCVvxYRss830YNnxLr0XmhQFMBu4fyRh8XGMU8WqKA26/b1NVdIeNKhBROeHh53UMNIii2fLIZaehyiCK1EwMOWPRhYa7+lYjT+vtONV7O3GNgUo8uGAjP3bJqPcphaq7zypKBdDQnj5FZD+UtqhBycPbiQhq5jIhrT383yLi3mpfeec89y3KDY/7cK85U6XNwjG6XTkkDMSTEphSR9eVnViwYvrjjiL96sCb+5xmj0ZyT2QbDWfF3lAZj5ngXrl1CadgyNcDZ8E2b0hsW5mRhesyfwufKSWFv4Y4W7QTRj7SNqCy6Tf9lHc4Buq4X0Ds2hqwv+ksQsKxfXRda9h96AAAUhuOsR5pLVOMqaUI6vqEU0RQK6it2S3E00vAx0fLjYTZ4sMLU+yXnhKweED9sJa6jVxSzVQPgGIX5M1UhNhHX5KakEs1f0uKw8LfmDvDi5vQExc1C8cOm6L8pkfcB7KDVYeknhlE0pQn88zMkQOvYU5bJSA9x7U+9/7v/sBptMMJzZbJp86z3rrJD6mHPTzVUX2n6PTca/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmhrcHlEczFnWE0zQnliMFdHVXRSekZBM0lUUERGSGtuZkFhbVJUMktLMWhJ?=
 =?utf-8?B?VUpBcDFBOS94UHlVKzJ1VzVTeHgvUTA5dWZDa3RsKzVua0t1UFhSWkg1VlJE?=
 =?utf-8?B?RDhPRU5WdEhhOCtsckwrY2lWa3Z1bWhWOUtlN2dIVFVSZU5aODAvaGNyVjlU?=
 =?utf-8?B?UUo1UituTnhYenpMZFJ5U3FtN0tPNnlWbEhKaEx2NEhZaXNXL25SSHVHYnhO?=
 =?utf-8?B?RmVIczAvYlVTYTBoSWhjdVZla0JkVzZRazljYWxlcWw5QzM5QjNRYnJZMWVM?=
 =?utf-8?B?UjJsbjd6d1dvaWhkSWJZSkJzZG5DODd1US9Leks4c0UwcnFEeW5MMHBVeGU3?=
 =?utf-8?B?R1JEWU9OSXhRbG5wRTYzZzc5ay9DK1pNNXNMWUdHYU9Sc0lnMTAzTUhXZUZ5?=
 =?utf-8?B?QWk0UjNTaytRUnlNNDVyNGxRSjBBdS9QQVU1YjlZc3hWdkdMcEVvNWc0T1ZC?=
 =?utf-8?B?WEI1SWtvSzZEMmNUNVkxdVp1L1UwdVpnR2c2QXpXZ3JWcFlQMGFHTWQvMmZ1?=
 =?utf-8?B?YTdKeThzY0hiQnl6T1FMcExKVkw3TktOUFBBZEI5Q2tSM3c4N0U3WWpJdXdS?=
 =?utf-8?B?MDZSUXQ2SWlKbTd5S0psSGI3bHlBaDRGQlhzQ0MvZld6SEU4OGsyM1VBVzJx?=
 =?utf-8?B?VWNWb1hvSVYxN1ZBN0FXZWdGVGNKc3RwUWV3NlZJYVUzMWRvS2VNczF2Q2o5?=
 =?utf-8?B?MmxJazk0SnZZb3BhTTdLTXZDeHhpSk0xOVBFOW5mWkkxd21WWnd4RFh5Nzho?=
 =?utf-8?B?STlBYWZBK091VFJrQmxTWXFaVkxQMm9ZVkY4SEg2cjJGcHU0bmE0cWZGdlFE?=
 =?utf-8?B?S3hPcjhNdURNbW5VWlQ5SzZWL244dlg2R0srbjNkb3pPYnJaMEVrZzROaFFY?=
 =?utf-8?B?NmJxVk1STDZHWDRIVDRra0NSQlMrRDJ0NC9hUC8yK1ZPaWl2L2N2cW1OQU5a?=
 =?utf-8?B?cE9MRFl6N0oxeVdwTERXSVp4S0FMZm1UajVqeVVzbjdWdjJtVitmYTVpamkz?=
 =?utf-8?B?ZVlOdHFqOXZ1Vk1DZG1lYUVDUCs0U2ZVMlpBeFA2eitETmtVcVpKc20yMi8v?=
 =?utf-8?B?VEc1NXBGWHRJd0xYUXg0OWwxVzBWNW11ZGoyK1JEYkxFZFBQdjFEaWdSVkQ1?=
 =?utf-8?B?ZG1YWmNvRkEwSzcwTVJCTzlxZlpEWUE2MDNPbjBwTndmZHdoK3ljRFhrS0lT?=
 =?utf-8?B?SWxDTzFGNkZ3aDEwRFgyZUtpekhEWkE1REFOcHk3cys5Q09Obkdia3pKUDVX?=
 =?utf-8?B?a0haWU5SQmdyOWhLRGxqQ3JrMmtuRHNjSW04c2x1RHVIcGE3NHFOMTNIVWF1?=
 =?utf-8?B?a3dnM3hLNytSMXN4YjlKallWVzFzc2U2QWk1R3lQV1o5VlhoaWlnam5iYnly?=
 =?utf-8?B?VENybEt1Q2czak1XeVk4OFdNa0lpOU9FVENuSkFUaXZyYUZOSEJzQmV3NDVu?=
 =?utf-8?B?ejN4dy9OcnpXYS9OREFNUTdtK3pYTXYvN2VNc3ZseUlQd0FVYklqWllwa1BN?=
 =?utf-8?B?aU4rSzFjRUtRQUh2MzlITjBoTThnRUs1RGo2WDlzNVMvdU9zWnBwQnlWQjNa?=
 =?utf-8?B?aGlrYWRyWS9BajJSTnFOK3BabWJFV2Nnb3VxQlVaUFpIdFpxcGF2R29Qc0d0?=
 =?utf-8?B?a084MHFJQ084ZmlQUDc5bzZSNzc5ZXZ1QXBwRXp5dU1LUE45UGZVVVR5YjZG?=
 =?utf-8?B?b01YSDBHM3Nnc3FpYjZISWtGSkRFWHp1b0JudnJ3bndIQ0hJZ0J5RjQrNXFJ?=
 =?utf-8?B?T1pDMXhGME1lUGVXeGtEaTdEOGN0UTY1UkRYdW95ZGY0Mm5YSlhBTGc2V1k3?=
 =?utf-8?B?Q0JPeW1rdExGYzdvU28yek9FQmZiM0k5dWVOcjR6MHlCYzRmRnVTQ25DSjF6?=
 =?utf-8?B?b3BhcGgybXhzQXl3WmRQdjVKNFd6dURSZlZVOUZnNGFoaUlYcE1EeWRLOUJx?=
 =?utf-8?B?N0djSmY2WWRmbFlmWUg3R29QdTFiRkcwZ2V5M1FoQ3hQSmZWdDM0WnhGTkJl?=
 =?utf-8?B?U0E3ZEQ3M2YreUtJWFd1bEN4RUx1R2szUVltYm5IUmpWSDQyYXpZWmJaSGRR?=
 =?utf-8?B?NlZ1T01OdzZXV3ZSUHhTV2wyY3JxMitUUzhqZ2VFNE9RRWNTelp5bTNDMmZm?=
 =?utf-8?Q?N8rX8dXw+IeHWoJM85X1sy01G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2e8568-9370-4c5f-2524-08dba27f519d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 19:46:31.8552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8qn+tXCp8UIPUEKuMloBkqzC6SoHVR6LODYTb4b7FETMHnSqj40+9bBJ6ULVBie2t7g6/S2lQO3pIM5QgJfpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076

Hi Julien
On Fri, Aug 18, 2023 at 09:35:02PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 18/08/2023 20:52, Vikram Garhwal wrote:
> > Hi Jan
> > On Thu, Aug 17, 2023 at 09:05:44AM +0200, Jan Beulich wrote:
> > > On 17.08.2023 02:39, Vikram Garhwal wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/xen/iommu-private.h
> > > 
> > > I don't think private headers should live in include/xen/. Judging from only
> > > the patches I was Cc-ed on, ...
> > Thank you for suggestion. Do you where can i place it then?
> > Please see another comment down regarding who might be using this function.
> > > 
> > > > @@ -0,0 +1,28 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * xen/iommu-private.h
> > > > + */
> > > > +#ifndef __XEN_IOMMU_PRIVATE_H__
> > > > +#define __XEN_IOMMU_PRIVATE_H__
> > > > +
> > > > +#ifdef CONFIG_HAS_DEVICE_TREE
> > > > +#include <xen/device_tree.h>
> > > > +
> > > > +/*
> > > > + * Checks if dt_device_node is assigned to a domain or not. This function
> > > > + * expects to be called with dtdevs_lock acquired by caller.
> > > > + */
> > > > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> > > > +#endif
> > > 
> > > ... I don't even see the need for the declaration, as the function is used
> > > only from the file also defining it. But of course if there is a use
> > > elsewhere (in Arm-only code, as is suggested by the description here), then
> > > the header (under a suitable name) wants to live under drivers/passthrough/
> > > (and of course be included only from anywhere in that sub-tree).
> > > 
> > This is also use in smmu.c:arm_smmu_dt_remove_device_legacy(). This is added in
> > 12/19 patch(xen/smmu: Add remove_device callback for smmu_iommu ops).
> 
> AFAICT, the caller of this function (iommu_remove_dt_device()) will already
> check if the device was assigned and bail out if that's the case.
> 
> 
> So why do we need to check it again in the SMMU driver?
> 
This was comment from you in v2:
"Even if the IOMMU subsystem check it, it would be good that the SMMU 
driver also check the device is not currently used before removing it.

If it is, then we should return -EBUSY."
Link:https://patchew.org/Xen/1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com/1636441347-133850-7-git-send-email-fnu.vikram@xilinx.com/

And there was similar comment from Michal in v5.

That's why this was kept.

Regards,
Vikram

> And if you really need to then you most likely want to check the internal
> state of the SMMU driver rather than the generic state.
> 
> Cheers,
> 
> -- 
> Julien Grall

