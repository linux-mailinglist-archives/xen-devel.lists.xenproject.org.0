Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F1787CAB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 02:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590418.922700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZL6I-0007zq-G9; Fri, 25 Aug 2023 00:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590418.922700; Fri, 25 Aug 2023 00:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZL6I-0007wz-D6; Fri, 25 Aug 2023 00:54:58 +0000
Received: by outflank-mailman (input) for mailman id 590418;
 Fri, 25 Aug 2023 00:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZL6H-0007wt-Hc
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 00:54:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ce541e-42e2-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 02:54:55 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 00:54:43 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 00:54:43 +0000
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
X-Inumbo-ID: 00ce541e-42e2-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFLjuS83GO32phk63nWnLAlY6+gVwvY5wBtoU+u0x2YH4c/0/xE5hT9gbNBtHyY3/em6z6aDV9X3u5w674OBYHi7K1noijcYceWPvfZB37M4P5XiAzeB7rEXVHKNikTt06GTZ4vo77Mz41TnRiRRBN5cxeQEjp5s7nk9Ftul+RqVAa/GZq30RexY5XFqVAq1iH9I4/e3vLsxhQ78Nohwo/8xowzjrGSrpmPiOF5wcHHXVgewZdte/hie8/Y/H+Z36WrT3iayFKYXbEOsiwtNFYlPJz/RMuiSxuVLWpu5FNfrlEB9M7ii7S24t+qapo4pytlS8saONHgvKijyoYH8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hQBKzXpWHZ4SsXl7ISxxtI+lq1+fzUmI62LcvNTqxE=;
 b=g3IhBxisPyR57uEFT/ER2FdyLAtuMnwmYM1+VZh5M14pt41gUfyydIAZa4ieB1bIW8C0OvFJVDE36zH1/zJqev2HY2/bMYDtv7vj2cT4JkuYL5k9EFuhq4TXkgo93biTX4APPLgpzaSdT2IQG/wMD52WfI9i1FHE54xBlloAqoleF3OLxZmRViMM7vFfwKoxI5IMU4NQhL3RHaMkUGkxd+ZZwYX2NOhaO151sQ3qsFA7EA3rQGQer2yDjMRXb15QrZ3Z/LkD3TIZsvSD1+zOvCXopHrB8uquUcHCbZHSbMg2F8Kx1bizHXAsuXQ4SRXYnKlR1pKCwKE2wPesZwh1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hQBKzXpWHZ4SsXl7ISxxtI+lq1+fzUmI62LcvNTqxE=;
 b=4dYajNA7IxqsnNFgElxAXZJJG0pkj2PdM6IV2C/9Ruh9mFzcAl7exHSSTKhzdbnZ+DipFjYAHEuYYsan061HJ+oXrkq/015UxKaGm6jtrEen+QU6+8QrayCJ56fEmhnyN7L6V/qkOhP3/i3I4v3JuZqeubnveTfuJBWwRORQOnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 17:54:40 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v9 04/19] common/device_tree: Export
 __unflatten_device_tree()
Message-ID: <ZOf70KJ5lYg93aiH@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-5-vikram.garhwal@amd.com>
 <90fcd05a-3b89-401d-8321-7f792b3fa52c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90fcd05a-3b89-401d-8321-7f792b3fa52c@xen.org>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c58e8a-0f0a-4e99-ec1e-08dba505dec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBVPjx3vVFyusCgwsVT4qbRdsRkGPA35a/tcuhIdHJoNPnLX7ZYK610qpfpdOAeVeg+ZuQLNSEWJJjPiQ4rAVWZOrCUqUWvHnMpgWO+ok+t458HNdp9sp8zaL0JFNRSrEURUEs8Go9XOPskfTohvjDV423EGT52Iwb69rVU/7PPGCIYyVa0VBd/83B+bBLFnejsYLvWsJ9adylcSqFEsr/8Ie9eGiRh8cAGrThpRuJJNhIjLt/7b2DvV9HasfTPnlnELLJr1NnVipmQh3OauIQbsZ4WZWz810KTF/qTYsCliulg6P/uNhK1/i9tG1CjB3jK5xwWBAFwM1grePKPu2himBhT5I0lOExId5u3dN11YQf0L6qEPOd4RkrMyHuFOB1zk0Q4nDc3vOmWXCy37Yt4HHgMOi5QJMmG7BXz+6mNf+T18VENtZ5vYigMUhQX4/DvipiY/pOTj2uORKg7nCkfo7VbB69LhY3vwPLqM0b8eNZApxnlGrdS5N0CW0V5gqNJNHjenctRRbkJW576mhIoWit5Ts6EcUldqIQ4N9m61fn4aWsl9CUF2ORYFsT21
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(38100700002)(4326008)(8676002)(8936002)(41300700001)(53546011)(6486002)(6506007)(316002)(36756003)(6916009)(66476007)(66556008)(66946007)(86362001)(6512007)(26005)(478600001)(44832011)(83380400001)(2906002)(4744005)(2616005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk41SzFPdzNBVU95OTNUYjJwOG1LU2Y4WGhKdWdiUkxJOFRLU1Q5VlZiVjN6?=
 =?utf-8?B?VHJULzZDbVIvRFVsSUJ5TmlUL0V0TG5pNGlBVkQ0K0lkMWZHSHg4K2xORzc2?=
 =?utf-8?B?TTd2Y1N4ckpMdThCUFBBaDUzWk85bmdRczBzdFBNaHdNOSsxSWloQWNQd2I3?=
 =?utf-8?B?ZGVMSW1YbWV5aCsvVGlFc3RJYmJ0SlN4YWxoZEtXM2pMU1oyL0IwY1VsdHlo?=
 =?utf-8?B?QnJFWjB0YmVSNVFOWTJxRmhuTXZidEIzYUMvZitSM1NKQm9mazhOUVN6ZHM5?=
 =?utf-8?B?eVJhdlh0TnhSUlgzS3U5NTRDaktnaXZwTEhBMnpjbCtidTlxeEp0NFJ1R0VU?=
 =?utf-8?B?VDNZaGJHNVZiVTY0N2UyNHVvRTlnRFBsN1IxbEpBYVhjdEJWQVY1NGRDOXor?=
 =?utf-8?B?STBCY0hheWQxeDRYOE5tYlJqNUVjM0FKM1U4ZGhxeHRHV1VDNlcrUTJxT0ZI?=
 =?utf-8?B?cjFzemdpZGp5dnllNXE3RnpuQ1RubEl2V1BlQmY5TjEva0ZRQmdZMDVEVXVG?=
 =?utf-8?B?N0J2ZkZRanlVLy9nOGV2MHkxcjlINElWamJjcHJCa0hubzQ0VVJYTS9NaXR4?=
 =?utf-8?B?amNJRng4aFprTUMxc3E2cXN4VFFXRTlBSXNGc0FwV0tIa21udFJLWnBsOVQ0?=
 =?utf-8?B?Y1FDUExBOHU1QTJnbzhUL3RiNld5M0Q5K2thQlVNY0JzL3kzdXNJUEMxZFdj?=
 =?utf-8?B?d2s1cHV0c1ZRUTVob0hLeDkyUUlTVjlTSDZtOVFGUjI3N1NuVnhQYjcyYkhw?=
 =?utf-8?B?U0J1bzAwWlJtVG5vLy8zVUdWb0s3dytCb2ZBZGRLMkl2TEhsNFRXQ1NLYnUv?=
 =?utf-8?B?bU12WHBuVnFNajJKQ1Y2WEFyRDhma01hTEtQeVFHUnU5dndva1lXUVNEN2hs?=
 =?utf-8?B?bXo3RVM5VU9FbTFBbXV5M0N4SldLS2lQeU1tSHd1dlEwVGhCZFBzUVVIUlVN?=
 =?utf-8?B?WEIxTWI2MzBFOThoQTVWVXU1b1NCWHM4c056TWNjdVp1NGhkbWxsMFFKSXF4?=
 =?utf-8?B?VnNxV3l1dUxOa1dlN29scTRLek9Lc0sxRUtVVHQ1V2FqckQ2V3Y1eHJLdkJE?=
 =?utf-8?B?djBONWkwR1kxVWZFc3Nqc2ZQdW9UckhEaEIwQjZJR2d3c3JaUWVXdS8wcVNB?=
 =?utf-8?B?UW9WZ1IrVkJXV3hoSWkwM29FVm55NndUSXBzZ1hBZGp6MTN0MDA3NG83Rmhx?=
 =?utf-8?B?VE5jdHI0VHRlUjh1ZmRnUWcxcTBoczVFNlB1ZnBobVlJNmhCYXVMQnROTVA3?=
 =?utf-8?B?MzZ1eG5Ba2d5OVVIV1JTMXptQ01tYlRudmRZSUlkVlNpU2cyc0gzTG53NUFj?=
 =?utf-8?B?R2FSMjUxa0E1UDBVVFdkS0U0UDA2TGRLVXUrZTZDT0tMZkYwa2RiK1pSZGZz?=
 =?utf-8?B?V21TYmhWVExDcG9GUERjK3g0NTBoOWZFdGNyZnM0eG0vWnhqdjZQR3JNZG4w?=
 =?utf-8?B?UU5lUWxvV3AxSTMzVkxoS0Uva2diSDJqQzEvZlNsSGt2S29rMHdhNnF3ZEJV?=
 =?utf-8?B?TnBlWGFXOW5CbjBISjZIeUdvdlh1ZjU0dVBkQW5xZVVGbEI1UHRLNVRtM29w?=
 =?utf-8?B?V0N6bmZibTI2RGZTTE9kckZFYW82Q0NPL1BqNHhOVTh6Skd3VjlEVlo5WTlx?=
 =?utf-8?B?ZTJaejB0RUVqdTBzTHYzbGV6MGJlbldySFVZQ1E0UzBBdTlJYVhpTXI3endS?=
 =?utf-8?B?SExvZVY0Q29na2ZNbmdlNFpMeUdBc29Ta3NzRDlhQVFwZHNvYm9VTWxEK2tE?=
 =?utf-8?B?RTFwWStSc0xCbmxBS293cFBDUlc0b3hndGp0TTZJeG14aU45ekpJRTNLU1J0?=
 =?utf-8?B?emVLWG1CRFV2dzVCQ0JNZGdURFIrYzNWY2ZJREN5RlNCcmo1YW9uRVZyZ0J2?=
 =?utf-8?B?dVNhMDVtR1paVWEvcGRETFNSTU5iT1l3Z2tCRDJaR2lGcGRHT2k4NlFEZWYy?=
 =?utf-8?B?M2cxOVU2WUNuTXVaOUZ6enlzWktwQTFGMkRNSWk2b2VxQjYyMFZZNUZNYmR1?=
 =?utf-8?B?ck9pU2xMdmtHUmJQSGgvRFJERUhPOWM2WHFLWUJob1UxRkp5VkVPK2NlVG9z?=
 =?utf-8?B?ajMyM081eGRVSHZieElheFdZK1g0bjdNRXZIVnF4OWp4N3Ntdm5zNzljVjlD?=
 =?utf-8?Q?TpfdW5a1f+DeirH6NK5UYiSm0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c58e8a-0f0a-4e99-ec1e-08dba505dec6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 00:54:43.6232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAk4mqniI2c9Mz/4qZlKERUhuJyKC3zXc59EUzX/dCXYCJ6PAi+a2gX7u9m8EYfVI6g+MyojyCFqIpk4E7ErYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

Hi Julien,
On Tue, Aug 22, 2023 at 08:05:18PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Following changes are done to __unflatten_device_tree():
> >      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
> >      2. Remove __init and static function type.
> > 
> > The changes are done to make this function useable for dynamic node programming
> > where new device tree overlay nodes are added to fdt and further unflattend to
> > update xen device tree during runtime.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> It is not clear to me whether you saw my reply about using ERR_PTR() as I
> can't find an answer.
> 
I saw the comment but was not able to work on implementing ERR_PRT(). Given that
I see your Acked-by, i will try to address this as separate patch after this
series.
> Anyway, I am not against this interface:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 
> -- 
> Julien Grall

