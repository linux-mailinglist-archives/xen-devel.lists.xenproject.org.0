Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2B7813EF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 21:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586530.917794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5Wk-0006sv-2C; Fri, 18 Aug 2023 19:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586530.917794; Fri, 18 Aug 2023 19:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5Wj-0006rB-VY; Fri, 18 Aug 2023 19:52:57 +0000
Received: by outflank-mailman (input) for mailman id 586530;
 Fri, 18 Aug 2023 19:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAsY=ED=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX5Wj-0006r3-AZ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 19:52:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d165a24c-3e00-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 21:52:55 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 19:52:49 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 19:52:48 +0000
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
X-Inumbo-ID: d165a24c-3e00-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAg3MtR9IhmMd8aB7ycNLtUnHSmx7PvaTXjxxQQSyDxukVhUZFfZQNSwlbdtoHvHls/ixDWoilIra5pZFX8uR/ifs7V/CMvqH9cpQShLXeQeLUGaszg+TmftGI3QB+zz/Vee9h+zcNlC39cuZUaScpkHuBWuSk/iPloyuHhMlXyxu0JHFjSGyj3S0l5/PsYqw8ac1tCT6+Ak8pDFlVFBr57SwOPay2WCUNYENnvNDKw82Jb3lKbx5+5k8FIkItKjwlvFZbicu9tgOvHikC8x+2cF8ijglqu3Gsd7BfojufIkpvpg7Wp/jJhojT/xoUa1L8LqmblM0TM9xS4Y3qkY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2rDp46L9Qn+UqrEKRyjjTE9VMY+gbw3gMDpxf2aHuk=;
 b=UCF3lCsIIB1iHjD9EfFUpbcc60nzRNpDHE4Xacjcyet7MOVKgHO0cO1+QVk5HvJvflBDTdmmp4OcWRvRgkJR/+1AKYP2zm0YSY3wApZb+kaYKE6zj7ATvRK0+8QFIve0WHgt+fyOI66Agu4TXX0MIE5tcECcvSvxtdPm2z/bo7lpIErNZVbp5YLdCxQExg/TsstUQoEF8UVTD4D1B/zbZrnhXr91/lIYzIO33czJgakjUsHyL3ahaUtnnM4uSrY90EKurYtsrcH0r8Y+wzm2H7hGChEBIK14cD8UY/C48KMQl9/Pe+YRJ4ZJSOqEngyaEN/xQbGJ/fnZbzHPuwWVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2rDp46L9Qn+UqrEKRyjjTE9VMY+gbw3gMDpxf2aHuk=;
 b=HH+i6r9tGCfo1S0WapgYCorOBfLc06rCrXsWmt3th/BSD1aePEGoZO6gyNyVihPf8Z8pYbxCNGzDZQxId1EWqq19/GHaCu6N8Zpoira8XXgaJeyPLmyHy+moIsgY9BpBjhBLqh3Mym6n4Q7JPBcgzQQByJnkrXz2uwBRtgQGlw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 18 Aug 2023 12:52:45 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZN/MDcuo+IS0m5Cz@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
 <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: a94944dd-d0fa-42f7-ac27-08dba024b30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3oHdC5P4Akkvd6Zgl/1oMpGSiuHKVNMZX5hCoKqNmZDsU+uS6Q8eQaRLg75MDvlmGb9QTbksqneJjdGdSuCCCuhQXlNtzh3Ng1GT4G2JHcgcR8rpSSSHzmOjOKTSntqVED3guym8MegAXHfmldG4CBJ7xJ//hBUosjREYp91pdfBeTErSd4v6mIu3xnztpkqXsFpemw61bJ4QkW+JPBlzuT7P7+s7b6boUGO8cYk5XUYC4F/RPeqGXtTzxZlQubj6MFsPDfpMJteJmRZO5Qjg8cw2+sF8+KQ1LsVCpScSkMqeq+Xh+2h4VKAGdZAtEUgCgI/vg9BbfteXPpA/We17wAv/l4Yfl6q1MgzmKFT+fR1IfbspWfHj31lfv2GpHPk0vAMJjxGhF7PUSM89cimpF7XOK9jEqAWmQhLKRFHPbBGg82TNMg9KltL6I5OkFOXFeMCyN+4VaQZL63vnpIkVI7eh2bxOozS1THMA1RsrZ9zMofMr+bTEPKFnVlsYIF7Smf2rmxbl8FQGa6xvhZ3cUzTYNU/ZknJVhCAOyL0r1rKAWxfjlfMVhm8HUTMj5v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(186009)(1800799009)(451199024)(2906002)(83380400001)(6666004)(6506007)(6916009)(66556008)(66946007)(54906003)(6486002)(53546011)(66476007)(316002)(44832011)(5660300002)(478600001)(2616005)(6512007)(8936002)(26005)(8676002)(41300700001)(4326008)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGNNN2NwUWxJS0c4QXdjNVp3bkFQT2J6alJ0NkR1Y1BjS200NmMvR2xuZFJL?=
 =?utf-8?B?UXdCckxLbkdZVXRZbitMT0JYNGhIMWRRSUpudnZCUkVhdklGOUphb2x6aktZ?=
 =?utf-8?B?dlkwa2xTNVBucnErYm1xQUZIaUg2OTZhdG4xZ213LzFjb2hyRUFFRHB1WkFB?=
 =?utf-8?B?aEdqUTVqa1hldHZpUUJXK3hSWThIYkcyeVFTMCs2VEMyUGFNYnpZUms4amQ4?=
 =?utf-8?B?YkltWjlmNlJsQmdjT0VQQWxFWW55MnBOOWRGV2JyckVTVjc5MXkxdmZRWnhX?=
 =?utf-8?B?dHE1QWRxTk1IMzJYamNXU2tTVmo2aUNEeTkwM0YxdWpQVnk3blloMzZiRmN5?=
 =?utf-8?B?aDJlNTRJM3g1aU1xQkF0M3JOR0xQSk9lRnRYcFhrSkJXS1FQYloyWDE3WElF?=
 =?utf-8?B?S0cveFo1SlM5YnNZSmg5Z1NDZFZLQ3Z0a3ZlUDlId1RLM1JyL1dJTktUZm5E?=
 =?utf-8?B?eDgyWVp0UDNTODczUDZjZnBKRmh3WGtZNk1GRXN6VUNKSitUYzNJTEhmY1FX?=
 =?utf-8?B?TEloWmpjdzhtU1JaZWkwWnphQStvTHUxM2hiNXdaU3NUZ2psampFVkJIVCs1?=
 =?utf-8?B?UC9IL0RWTnpNeUZ1enRGeTUwbS93dy9lL244bU9XRStiU05wekV0NVhrN0pi?=
 =?utf-8?B?UGVUYzhuNGJ6MEdoVzN3WjRQU1k5OXNmMzBQUW9GT0RpVGx0eHRmQ1dBb2la?=
 =?utf-8?B?bXBPaUJWeXU3ajhhV3oxKzF2d2x4aURDNkwwYnZMOGZWdElUZ2o2OTBFbVFG?=
 =?utf-8?B?NWh6bGZmcitKU3NXU3ZXNG51QTBQakQ4aWpFOFpwLzFLVFJ5R3RzUitYRk02?=
 =?utf-8?B?ZTV0YTEwK0RYYndBU2lFVUgzVy92Qk5MdWR0UmgxeVB2ZWRFR2NuYUlGOGN2?=
 =?utf-8?B?RktRMEZHdVhYc3ZQeEQ1TDBIRkR2dDRrOVdHeG9yckZiSUhyZ1dvei9SbWhh?=
 =?utf-8?B?Q0I1VUVhdG8vOGEwYnpKZG1KbjZuUzdUcloyMmhubDgvb0tIWWkrQUhMc3dk?=
 =?utf-8?B?VDJQY1pXY09BK3JBeDhHUm1rZElVY21OTDNPTjdpa3VNQTUvM044c1RCbjFj?=
 =?utf-8?B?RzJSekFXZ2F4cUFKZi9VTEQ5V2VvNlRWOXNMUytqaDZhV2g2NEh2T2pBUHMy?=
 =?utf-8?B?SUR1QURmY1Z4bE5rRXk5UDZkNzI5Myt5TWZjOXgwd1VhbXhsNURCZmRFK2I3?=
 =?utf-8?B?SHErR0tVaXZ5dHJZeFp3WDBrYm45ZVhIcFRNZHlhVStuKzI0NStjUGMwSUhX?=
 =?utf-8?B?ZHZFWDlKQllBMnlLNDV1bzdRUE9hNmhIZUdKUkRJdmNTNEpTejdDQWtBRTFF?=
 =?utf-8?B?cWl1cTU5RTJjL0dVM3R6eSs2UG1HVytNUzU4dVlicU81V21yZDQ3MzhJdE8v?=
 =?utf-8?B?S281Q1hka29FMzc2Q0w1Z3R0ZFEyMHpTNk03WTdKSUxKNjZyNDFxWDhST1FW?=
 =?utf-8?B?eExrR1Z3N0VQdU5iajNaQ0dhOTdQWFd1STVRd0s5a2hXZDltNGUxNW44Rytw?=
 =?utf-8?B?ZzdpQXp1YmtWZG5nZEVHbG40UEVOMDNjVDgrck1DbnNOVEdJb0ZYZENIUVV4?=
 =?utf-8?B?K0E0M2JRU2NPaXlHUzh0MDJhem11QjN5aElPTjJ0ZmRHYklEYW8vdkNMSkJ3?=
 =?utf-8?B?Und3QVFZaG1XVTh1c0t0Vm1WTHpVaVN3MjV6eFQ4MEtlUG9LNnF5MTVBaUZi?=
 =?utf-8?B?V3BqdWpFSERjNzMwZlpDNEV2ZEs1RHp6Nk1aQVhPcVgzMVdQNVJMN0NEY0Jj?=
 =?utf-8?B?SDk1Q1pHSUpvY1kzaEFWekpyVThweW9GOE15R0piV2JIa05rZ3MrMnpmS2xR?=
 =?utf-8?B?Qm5STFdrUWlVOTY0MWsxR281SXozakltYmZHdWFjMWkydlRsY1RSTHYzbnFv?=
 =?utf-8?B?M1BtOGFqaTBiOHNxQkVBcEFOVmlCdWxvSDJUL2hmR0NDSmRnUVppazQybXNj?=
 =?utf-8?B?ZFFXb21WUG4vWUF5U3pWbmF5ZjJhay9SVy8wQWI5L1kyV3V6ZGNRM3BoQlly?=
 =?utf-8?B?NVFiNjVGWEZqTDY5aGlLWUtnV05sMEE5dzNmZEsvejV5NzBIWnhadnkyNEFQ?=
 =?utf-8?B?c1haR1MycFo0OUxQdzRPOXBJOFkybVc3YWgzVHVjSHlSa2J1S2Zodi9LQWNH?=
 =?utf-8?Q?VjJhNHBlBSAaOraw8kpBvv4Ko?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94944dd-d0fa-42f7-ac27-08dba024b30a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 19:52:48.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU0ByoqjAprPQOhpSk+9kEsj1psS26BE1X9TYRmbzRODRQEbb1sAV/bMVO3UlXjwolQNMmnYNBgFVgM8R4U5ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

Hi Jan
On Thu, Aug 17, 2023 at 09:05:44AM +0200, Jan Beulich wrote:
> On 17.08.2023 02:39, Vikram Garhwal wrote:
> > --- /dev/null
> > +++ b/xen/include/xen/iommu-private.h
> 
> I don't think private headers should live in include/xen/. Judging from only
> the patches I was Cc-ed on, ...
Thank you for suggestion. Do you where can i place it then?
Please see another comment down regarding who might be using this function.
> 
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * xen/iommu-private.h
> > + */
> > +#ifndef __XEN_IOMMU_PRIVATE_H__
> > +#define __XEN_IOMMU_PRIVATE_H__
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#include <xen/device_tree.h>
> > +
> > +/*
> > + * Checks if dt_device_node is assigned to a domain or not. This function
> > + * expects to be called with dtdevs_lock acquired by caller.
> > + */
> > +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> > +#endif
> 
> ... I don't even see the need for the declaration, as the function is used
> only from the file also defining it. But of course if there is a use
> elsewhere (in Arm-only code, as is suggested by the description here), then
> the header (under a suitable name) wants to live under drivers/passthrough/
> (and of course be included only from anywhere in that sub-tree).
> 
This is also use in smmu.c:arm_smmu_dt_remove_device_legacy(). This is added in
12/19 patch(xen/smmu: Add remove_device callback for smmu_iommu ops).

I will make sure to cc you for all the patches in v9 series. I plan to send
it today.

> Jan

