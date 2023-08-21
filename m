Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A0783103
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 21:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587814.919224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYAmG-0002kE-W8; Mon, 21 Aug 2023 19:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587814.919224; Mon, 21 Aug 2023 19:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYAmG-0002hY-SC; Mon, 21 Aug 2023 19:41:28 +0000
Received: by outflank-mailman (input) for mailman id 587814;
 Mon, 21 Aug 2023 19:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tacK=EG=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qYAmE-0002hS-NE
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 19:41:26 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5123197-405a-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 21:41:23 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 19:41:20 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 19:41:20 +0000
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
X-Inumbo-ID: b5123197-405a-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWJ6kAFWC4h/NlK3BlaNYEpb4kKxo3ojE1LghpVsQkAXs8X0TvWD4uN2/fSpXz9TNmqub+dhOKUT1YpzuXDiMIEQRvZLB4gaWkStEf+yRooNZcmMgc1YWwuaRA+ncolnAA7TYf3p2OlMrEBp7QNj+rBQbW8geWOhuqbS/okYtvdvEAgCw65iyApFMOjT6SUqLGd0c/l7m8ytzwkEtpI7yYlTxkOhEKyIa7nLf+1JORyHPk6xXuoKiZzll7IeelCsARI5EBRtnpGcscGILtK5dHu32osj7i8Q9DH9sePFOHuTOpAxUdXf+OhKlao/itfBwC51iFRPhm+1Y93JQBvqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDjQpjjPMSu4jnJwNZ1wPlk9dbFDBEvbS8vyr1SrQwI=;
 b=k417MpRtKGiMdSr99KEwc8JfbPWmrv0KozBD0tlMC7MRd+RWvkK267nUz8noeh+CI2z5x66cal3dOJ9ekzL7eswY67gI5ls1Ws2HckLeGDbxQCKSMUHEyit3G4dA2VqvKZyY52KB+H/0PEvTTYi/MxxjrGfzleHoBTdOvYifIWdFezzAGCQ6wAaKF3KkiI17D+11y1Ka8MesGjizOLgYQJR5q4isVnyptPofSF13GxEdoA2vfZ75l63aYxblkSs23wnayqDmZT53LpEscp0ORLeDRDUCLVSJgw6ew9iOxQDNDDNnQ8Nep2h+0ud0Kwypaa99IxfJUWurgfiEfa9jSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDjQpjjPMSu4jnJwNZ1wPlk9dbFDBEvbS8vyr1SrQwI=;
 b=oKbprmT9ihAh1MXP5yWfYX913hGruQhLJuO22jJ18QNP+WH5DEabpAzEE5ZQhrC+T2bhvfCkTXfdhUBTNrNAznG5IZe8TrLe0jteRfykC5S+eTat5i+DZO8mBW1Fq2EbTwdjyS/BDDcjok8270f0X/PDEAbOC5QaUvNaLcjY16M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 21 Aug 2023 12:41:16 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN][PATCH v9 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Message-ID: <ZOO93JDsKyWGSacN@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-10-vikram.garhwal@amd.com>
 <86717900-39cf-c95c-46ce-f567abda00cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86717900-39cf-c95c-46ce-f567abda00cc@suse.com>
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: b1580fd2-fdb2-43a0-dac7-08dba27e97b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9e73jT9uLEbPaRea/Y8S/A0RBUrS5l8Bl8rafykda76Y3ypNGi7S6dbCflV9B8+bleqEOSsGM2BHR4sxn5vJJfskGuGOf5uY3kYC5Hx1FbpEpv0VGgCDOZS2WCIYbQ86axbqMXcXymKi31RJsFjhY6dYYNVMwDooxUsuExijbPH1pzQBZIE3w1UiJuL3or+nmYVvEt61iTq8R/1lW82/9tbosIMaJ2xoUZTK15uWDbBxaXtZyb+xYBWXr4p02UBGDVh1u6L+YK/6NEigHn1vNFwEgjZs5QTBC1NlHdklfEVra3i/WECfye9yGR1ist8feq9J2TbuzQEQauqYMZcbgLAFYZZ1EI/XKntievwxLaFA1eMgs/gXIooHQkw1df3wXRWK7DuXOlud+rKxYM/yAVEzDEPXUk3L0KfMA+Z8VRJlg0mhA+RlcUJhDIKFgojPQ8N/7MOj9rMjSj8I7EyriIPl6xsEgfj4Vf8PgjVrPyOTOOjgDcnJzdSIPZvjdXa411HsifEVJSy96wiLXQ1y6mKBXWpLr1gxnmnfzaWUG8s62/mAniTfEliBKKgjUTFy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(186009)(1800799009)(451199024)(54906003)(66556008)(6916009)(66476007)(66946007)(6512007)(316002)(2616005)(8676002)(8936002)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6486002)(6506007)(83380400001)(2906002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVlMQTIrMTNnZXBMbmp2eHZOa0lhUllndUZza0ZhcUZHNWUwdjFJd2VHK1Vu?=
 =?utf-8?B?T29wVWxhTEF4SkJkbytoK3RkYS83OE9ERWxoNXFVeUUrWU0xVlVwZVJjcXAy?=
 =?utf-8?B?VlFKL3V6R2Q0Z1lvY0x6eTlKY2QweXY3NkpCa2VyVGJMYitzUHRaKzB1a1cw?=
 =?utf-8?B?NmFkaU5vVFROb1VBL3NSSDRXVXR6Ujlld2tPWlc4SVlDTHRFWXpaUUVyME96?=
 =?utf-8?B?OCtWeFdnN29aQ2pya2RRcityb05Wa2crWWd5eWFicGozUHRWOXI5amR5WWF5?=
 =?utf-8?B?TTJ3TmJGKzd6bTZDVWdXVWowZldqaHM4aHBvcjMzS1hhQ21pQnlIOHVOVXhq?=
 =?utf-8?B?UDEveFdIYkE4ZTdGSlJVQ3d6Ymg5d0IxV0tiTUp1dlFNbHRyNjNPNEl6Ynlt?=
 =?utf-8?B?OW5jYnovOW9YdDg0MUoyVFg3OEVYajh4N1l5MndWZjRXSG80MU84WEp4QWpP?=
 =?utf-8?B?V29jMVd4Vy9aa3pyWGplcWNzRnNTbGprRWRUc0NPSW5pQ0o0QTVUVi9Ja1I2?=
 =?utf-8?B?SHVhY1pPeE0yVGpua0Rrd1lVdTYwZDdvUVp3dTl4V204ckNiKzI1UXF1QW5Q?=
 =?utf-8?B?TXE3bHljdS9QNW9jQ2tlandQSXlTaWk0SmtDL0p6dmREWXlQUzZjWXRlZGNB?=
 =?utf-8?B?Q1FnbUJBczFmcDlNTnJTMmdVTXNMQXZVREFRdFU2azVHL1hrNk1Ua2E1TDhl?=
 =?utf-8?B?Skd4eHJzWkcvbS8xV1lVV2h1eStWNzBxZXZuRFhDd0M4US8zKzMrdzhPMFFN?=
 =?utf-8?B?VjhKZzFCZHpBOEN6ZjlKc3RVWERFM1VzMW85aHNhSVErUUNMa0RxOXY5Zkkw?=
 =?utf-8?B?RmVkdGZXVmhCWFlMZkgwRzFPVVFEU0FGWStHYURmc1VWMEJaMXl2aGNFSGFt?=
 =?utf-8?B?T3JhRUtpam5WUU03dWYxbXAwQkppbnVZTnUwRTh5QVZsZlBjZnZEOTNGNk1s?=
 =?utf-8?B?MkcxRkFHV2hnTVNBbFJpd3F3K1k1OXJFQklxUjN3OWgvbm5GLzhjU09nY2I3?=
 =?utf-8?B?UGJMMUhEMUtqTUhJWnJOWTJoZkxqc2xpRVdKWlpBdkRrM0RGK0VVc0FDY3Fj?=
 =?utf-8?B?RE5JMHRJWm1FWGdvNzdybHpOVG5xRk01ZXpiMUlTOGdkVHdMNDQ5L3lzN2du?=
 =?utf-8?B?SFR5WHkyVGhPR1d5VGJyVjM5QnYxdjF5L041V1V6aHUyMWt5aTNTV0Q1ZElp?=
 =?utf-8?B?S1diNWVjbVhLaHhXS1RtK0lnMWxPRFpSQnowdzdKaWlKOGdVQ2pzNGlrdXRI?=
 =?utf-8?B?VUc1VlAvSU95Z3p4cEN4YTBPMDAxamRmSjdZZUllbWR6L2ZaZ0pORFkrWjI3?=
 =?utf-8?B?eHN3bkFVOHBicEp6UE5RQXk0WEdKQ0hZVUpUOVcva01wSkF5VW55MDZockhR?=
 =?utf-8?B?c3hud0RCbGJlTjhUdFZ3ZWFIZFBod2JhL2xUNzhIRmt1OVp2aGMyL2VUMXYr?=
 =?utf-8?B?RnpiR2RLVGdZT0NIeVdUTXJHaUN1Rk5nM1FQRWRGcUNVM1MvUUQ5bkFLUWsv?=
 =?utf-8?B?ekxMc091ZnM2WHgzMy9QN0YwelBNdXZXaElrdWJJVGJZcjJEUjZra2JRaGgx?=
 =?utf-8?B?eHlSYi9wWGNnSkx6N3BOSVlFYWhhTXRKanM1R3RUbHR0NFlTQk9UNTFqRlJl?=
 =?utf-8?B?em5rWHYvY3VBVVlDTG1YekxKa083djhGcWdMTW9HVE13TEU3WE1YTW1JaEFZ?=
 =?utf-8?B?dE1EemFVWTVuYUdTV0d3cmRTREZGeUtFb1hCZERrQ25xTCtVZEtvSnVBNCtH?=
 =?utf-8?B?bUU1OUdWUFE0d0t4Y2lqMnl2dzJ1U2VjOFRYbG9CYlJLU0dHRTRadFZORENn?=
 =?utf-8?B?RzBWcTJEYVdYekNHSkZXM1p2Ny96ZGdCU0VZYnZpUnFGb0dUaU5JNG1MVnh0?=
 =?utf-8?B?ZysrRVZ3UElaSEFuRVFtelZZcENDWVpBVFVyZ0tnNVYxQlNuUy9WTm91ZzZW?=
 =?utf-8?B?ZFNOT3c2OWV5djhXN282WVV6ZDFRTDNPTU1WUmVzZnBCS1FseFBkOHpmTGNH?=
 =?utf-8?B?bENuNEhucXB1OXl0M3ZEbEc5dGI3aUJCeksraGYxTlJaN1VtSDZHUDUyTTFp?=
 =?utf-8?B?Y3loeE9hMDdQWjgxK3JscFV5ZkxhelB6VzVVUVlXNGlIVkdWeXBVWVBWZkdQ?=
 =?utf-8?Q?rEKEbkZe5qAA2CMhZGYeowGdZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1580fd2-fdb2-43a0-dac7-08dba27e97b7
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 19:41:20.0779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP7LuUOM0YJErQmV3HJ/X30qNZzbv+lwz1OPIeXVMVFy6Ripj9sUMxd6MOMBrWOB5+2BhMI4bo6P41+1TKIzcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433

Hi Jen,
On Mon, Aug 21, 2023 at 08:53:38AM +0200, Jan Beulich wrote:
> On 19.08.2023 02:28, Vikram Garhwal wrote:
> > Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> > Remove static type so this can also be used by SMMU drivers to check if the
> > device is being used before removing.
> > 
> > Moving spin_lock to caller was done to prevent the concurrent access to
> > iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> > patches in this series introduces node add/remove feature.
> > 
> > Also, caller is required hold the correct lock so moved the function prototype
> > to a private header.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v7:
> >     Update commit message.
> >     Add ASSERT().
> > ---
> > ---
> >  xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
> >  xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+), 4 deletions(-)
> >  create mode 100644 xen/include/xen/iommu-private.h
> 
> I find it odd for new versions to be sent when discussion on the prior
> version hasn't settled yet, and when you then also don't incorporate
> the feedback given. I also find it odd to now be Cc-ed on the entire
> series. Imo instead of that patches which aren't self-explanatory /
> self-consistent simply need their descriptions improved (in the case
> here to mention what further use of a function is intended). Yet
> better would be to add declarations (and remove static) only at the
> point that's actually needed. This then eliminates the risk of
> subsequent changes in response to feedback (like Julien's here)
> resulting in the declaration no longer being needed, thus leading to
> a Misra violation (besides the general tidiness aspect).
> 
Reason behind sending new version: Patch 15/19 is largest patch in terms of change
and there was a long discussion with Julien and Stefano regarding a big change.
Last week(after v8) we agreed on change and Stefano and Julien were okay to send
v9 so it will be easier to review with that change.

Regarding cc-ing you to whole series, there was following comment on v8 09/1
"I don't think private headers should live in include/xen/. Judging from only
the patches I was Cc-ed on." I thought you wanted to see the whole full series.
Looks like i misunderstood the comment and Will remove the from cc-list in next
version.

The function itself will be needed in further patches in this series.
I am okay with keeping static and other things same here to avoid MISRA violation
and change wherever they are called first time.

Regarding Julien's comment i am reply back in same thread on why this was
not taken in account.
> Jan

