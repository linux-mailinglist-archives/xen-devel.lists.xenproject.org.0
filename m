Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655756E7DBE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523558.813718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9UK-0005bW-71; Wed, 19 Apr 2023 15:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523558.813718; Wed, 19 Apr 2023 15:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9UK-0005Y9-3x; Wed, 19 Apr 2023 15:12:52 +0000
Received: by outflank-mailman (input) for mailman id 523558;
 Wed, 19 Apr 2023 15:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69VN=AK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pp9UJ-0005Y3-0P
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:12:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4e9779c-dec4-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 17:12:49 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 15:12:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 15:12:46 +0000
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
X-Inumbo-ID: a4e9779c-dec4-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJewN83j+zcTt4VUNz8J99K6+L4/JQMw4u6rwMvk47gRLJtAdIV9PAqpX2FyzY59B2V2EPNx9byBDfG89K3weIwqzzrmbdJYCVCiTaHUMobjzCk+WB1xJamq+IJzbyjmcWjWOLNl8IFi71BasTdv75gshw/ZFBOPqxXpW1O5r4AlyXLXAz4o8OSdA7krfYJ2lbqMueMXYrIyC6G8NXG1aNKTlSW7FhwyZ8KvUdi4V5UB0D3e7gAcNVUbYvNSjhNwThMgpwO9mKB2QXxSf7M4ctj4hYy2qzuMxV4eecSRWyV/NsCIp52pf4PCGHHFewvefDieJ7eSKQjq8Hk0DRWjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjStGSEMB1ILhnUhnahiOGJY3M/slAJ3k+sqICye4Ls=;
 b=FNYs01OPbfGrSeRn5miJjObZYcjQENrFCZoVWJqTPtAfRsDPt8i8USpr0+wglqYSnYc9XumjKSIXEiVa/mxvGzXM/dt+IcADjFkQglIEg7/6sWCHJAfs27hputZpmw+cTUwcPYXt66zVG7PrPq28Ecr1Qqf2Z9/pUYYfA+u2eS6y12EWfT8WO1uxTcZ4uZtC+/7EmWCz73ZV0JSmYJBcKBjUgjPU3HNCRmdeRYJ1ZEfkQl3jCGE+OcCaFUEDiMtbaR6yDZh7xq9o8UtHBO/De27608LMV022QvAziHze4BneJxvdtoImAW0MhWYWNmVtCMgQuf0aQ6xLAee9rGwy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjStGSEMB1ILhnUhnahiOGJY3M/slAJ3k+sqICye4Ls=;
 b=HE/NHwFGM2nEVPdz/FPbiuQoQeMrz8hh/kob+5vb5ufceX7GAfGMUDVULeUd7FIuDnLo0YQm99gMby8tGdZnBd+YSeJGvVBVslQA1XbHa7ubprGIOGLubZlq8Z4c1bRuu6dbUkNqINlpphucZ/IQVNct9n+Y7a3KfN7lUZ5tNh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f6c88703-a3bf-94e6-246e-ab0d0582eb7a@amd.com>
Date: Wed, 19 Apr 2023 16:12:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a4698d-03ef-4a07-698e-08db40e887ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	egMCrr0uzyoemsytCwFOAWLmyYirnIFNgFdsxmZn3ULsORxKbVPPNmJG2WFz/A2xwI4aQvbGmnuvtv5ygHRAw0WZthzvKe0DTki/9hfBGHkifIOD8wgVTXoN3Ea3GpdxkX45k1kNVSoMZYr87EU6U+0X8h1i5KpgwYygZNZdK/dmyWB2SwXASKKoax3XeYWLvuCVpfhvIN+7TNRvfbi2BZVs/9XiQl2XwXRosnnUgjWq/6kmOhxcki4crh67yqtuRePSM+8MpnQ+iD8d31bcDBCZt/m42S7/OnHOShQJbiUf674m+itLszvES7/D6EOSO+z4yJy793gjgYCWKJoR41UOg5z55aVA/cACiJshGhXcITB3ZnXf8/IO+6/GNXRyY7FX9Ve/1vF6wKoVy0rLxSxxg2Wm4PygB7SXq4b93/sPgHusAOsl83tGW+bS2J83/53iqHCU2YxEsT7a/R5Sq7gJRGdBfDdF8bwDz3YK1OQSclV0BtDdYS+JoLt4PWZRV06gm/a9QOrV+6iVWLthrVfx5j/VM9NZxWpk5YKcxkVzuw7j+HGPldY4bKQPUsibrLheSuEd1fK4RJjOGJB8YY9EdjcKFDpqt/8q9mkgJ5TZ41SPSB3FFl4sVKOM8qkIDpbhvTFQp0u61sE0+macJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(7416002)(36756003)(2906002)(8936002)(5660300002)(8676002)(41300700001)(31696002)(38100700002)(31686004)(478600001)(110136005)(2616005)(316002)(53546011)(26005)(6506007)(6512007)(186003)(6666004)(6486002)(4326008)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEhOcXVkOCtDVnRKT3U0ODdPeTNsdm9zdUFJT1VTUTVYTi81QlFzMnlIVy96?=
 =?utf-8?B?cU9VK3Z5WFZvanU4bjR2K3A5Y0dGcWV5RnhFdGV5UlQ1MlZMV0hTSkZwY0Jx?=
 =?utf-8?B?UVVUOS9WV0h2T3Rjb0owL0NnUE1CTThnVTFDT3JWT0x5cGIxT0VKYnIvQ3Zw?=
 =?utf-8?B?YTE5RSttSUlTd3QrbDRGT0lNYTV6amtVWmt4a0hnQk9xSDRUUHN0SDdoZGwx?=
 =?utf-8?B?dUF4T3RnckxpU0E3ME9TU3hxUmhIUkhBKzAwR2pFemdhNUtTTm1ibkZzUTN1?=
 =?utf-8?B?Zmx3RnBjc2lUZHJWV2Y0TmtGTExjNmhyZmpmTVJqNy9vV0pqdHBEalFjaFpn?=
 =?utf-8?B?dG9IQlRNaTdkSnozbXlVYi9IajAvNUhuU3VpeVE1aVBDaVlIa3AwOVo2RnJC?=
 =?utf-8?B?Z0V3Z0VnRHNqSUk4eWFUYmg1b0U5aVVidmQwNXV2MWhJc0QvWjQwSVdNSUNl?=
 =?utf-8?B?WG80VWJ2cnRrZEdqL1UxR2dvdWNGS0dqcGZuUXRQQUxQa212S2tLZzVaVk4v?=
 =?utf-8?B?WVdQcmFFa0tYeWtRZXFWKzlUOWcyb3FKSy9JRjl3Wnp4ZjlrSWpJNU8zN01N?=
 =?utf-8?B?by8rcWR4a2h3Z0t4R1BudGV4cVF5TkNZQ1dPcmlKTUdXTU83U2pOcnNLRlNX?=
 =?utf-8?B?YVByODRQYVFlZVdVeHpWNDNCUGJZUXJWVHRORmJ1OEIzOFp2S3I3MGxGejBD?=
 =?utf-8?B?dmJFNmJTR0sxRk01ckRPeGoyb2lSbXNVYkU4SElnbi9pdnkyTEt6OGdlVjR1?=
 =?utf-8?B?MnJLMUQ0RnlMWUQzTmh4VEdKZnZFTFBDZWZqR0Q2Q092d2QrbmM2bUpLTmxl?=
 =?utf-8?B?dUFBR1luYVlvQ2FZU1hKRUxJMUpkNzNWVytCZEMrKzZLRjA4b05mK0lxdE9a?=
 =?utf-8?B?OWZRTk1aTnZySXdmTXJGZTRiWm5EanZDY1UzeFVzSVFSbWxXVTBDQTlIZXJY?=
 =?utf-8?B?KzRySndhNldTanpkclh0VzRYcitnWnRDeHk2UFpSMW42ODl0aTZCNVJOWjNO?=
 =?utf-8?B?bWc0SWd1NXhGY1VOQjNqTkdqMEswZHFmdzRwZlkzZTVsa3RpYTBuQ051M3Fa?=
 =?utf-8?B?b29Rc3ZERGtTMHJ3VmVnYXBRQ1BoNks2UUYvd2NaSkxHVFBpMjJzaGkrLzRY?=
 =?utf-8?B?K21udkltaElSb3ZhUEZqd1NrMUptN1NSZnJnTC9vdFpXN3M0QUVWaVhsYmlE?=
 =?utf-8?B?c3kxczIzdEJIaHdpd1lJUUFkQ0pnaUFtRWZVVWdmamQ3aE9uYjlKSGVMZ2to?=
 =?utf-8?B?aDA1TjVsVUk5WkNZb3NWY3BqdUJhbGROWHNmVmFDaGtabk4zSWc4WXRrVEQv?=
 =?utf-8?B?QlBNbk9YbnJXc0NySUp4UzhrSzJub3E1R0tWdTVGK0k4YUhFMWpIK2JNYVBq?=
 =?utf-8?B?RUJHaG8vblhENVJDQlk0ajJFZkJZTnlRRHNWUDVjdjRYbndHTk8zNW9jcHUw?=
 =?utf-8?B?VHE2cnJSSHVYOUZYVm55blc4Nko0RFZrcThwRVRMM1phSmxYU0dYcmZVUm9O?=
 =?utf-8?B?MC9EaHdhUXQ4Smh4ZFVMYXorYm5YRjRmdk1SelQvTytzazJkVVpXTFdQMXpD?=
 =?utf-8?B?UjdFWUtIR0VpMDVHSmtXVVdiMk1Zam5RU2tGR3E3Mm5lY05wZ3FUMmZ2eFJ4?=
 =?utf-8?B?Zmk3cHpUMUNJbEUyZjBTWVdId2NJL2Y4SEpETzVISGozVCtaMCt6VmcrUHBt?=
 =?utf-8?B?NlRqd0QwSCtWc2JIbUV6cmNLSlBQSmI5dit2SEs4TW55b2c5ajJ2dkJoeUx1?=
 =?utf-8?B?VGR6RHREL1k1bTE5ZVp4eVE3VmVkNXl4bE82UEVCSXV3Y01ibjQrN01zYlJD?=
 =?utf-8?B?ajJHSVczVS91NC9Jam84S2NJamhhYVlEeFJoRFp2NGIvSEpmZ1V0QzVPUHBD?=
 =?utf-8?B?WXRIQ21yZE9ReFJjb0JRajRxVVB1a2UyQm0vcGhUSjg5ZU1UVUpJTU9YNGtV?=
 =?utf-8?B?ZmNhbHd6MWRjUHZhbUM4QkQxWktTQ1lvcUMzRktGNzgzMFk5Rjh5d0lNSlRF?=
 =?utf-8?B?eFQwenUvc2RVRVhiRU1vb0xTVDZXcmUwNWFyb05DcUVTNTNITjFmMjFvRzZm?=
 =?utf-8?B?Z1laR1p2ZTR5OGxrYVEvbzRLSEJmOWVaU1RXdFRQcVMweVoyWnlKbkhQSlFW?=
 =?utf-8?Q?5XafUDp6DGJCKLetKgE/gmtyQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a4698d-03ef-4a07-698e-08db40e887ce
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:12:46.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0YX2bPd8rhUvqE0/QVr65aEEvAoVXy0V6tkbrddhUmOA59vVGKtNndRGUma9ygAOGXGPnmN5LfViv3++XGaCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466


On 19/04/2023 14:19, Michal Orzel wrote:
> Hi Ayan,

Hi Michal,

...

> --- /dev/null
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -0,0 +1,55 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only
> Our CODING_STYLE says:
> New files should start with a single-line SPDX comment, ..., e.g.
> /* SPDX-License-Identifier: GPL-2.0 */
>
> For me it would be perfectly fine to do as you did but it is not what our docs state
> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.

Just to be clear, this is what we should have (as Julien had earlier 
suggested to use **GPL-2.0-only** )

diff --git a/xen/include/xen/libfdt/libfdt-xen.h 
b/xen/include/xen/libfdt/libfdt-xen.h
index 3296a368a6..cad7ad3bfb 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
  /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
   * xen/include/xen/libfdt/libfdt-xen.h
   *
   * Wrapper functions for device tree. This helps to convert dt values

- Ayan


