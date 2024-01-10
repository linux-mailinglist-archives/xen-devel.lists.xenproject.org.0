Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3F82A233
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665733.1036024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNf9U-00075J-GN; Wed, 10 Jan 2024 20:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665733.1036024; Wed, 10 Jan 2024 20:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNf9U-000734-D2; Wed, 10 Jan 2024 20:26:16 +0000
Received: by outflank-mailman (input) for mailman id 665733;
 Wed, 10 Jan 2024 20:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7A+=IU=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rNf9T-00072y-5N
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:26:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f0d7685-aff6-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:26:13 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SN7PR12MB7882.namprd12.prod.outlook.com (2603:10b6:806:348::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 20:26:09 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1%5]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 20:26:09 +0000
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
X-Inumbo-ID: 7f0d7685-aff6-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkQghcuCVaxuvzvoVs5yRlzeIqYizxx2scm1Vs3D8wGluQ+jaNP6A6mB3QHwJaqgvkaovCeSwMUNSsqWYHkBzKs6UHROx/jy6vVBAlXDBx46WPcz5T7+AiTGQA4+zdXT/u7nPW9nODi4Bex4QdmEv68LcXMAiU9A/CA3UNTHyooaf1gB3IV+LJ0ttt7ajRS1wn7tIEOC9jHkxgntRcxj1re2boO6k02l6EsQV+lr5B3sA70273E2cXmTCYYgv6YnaPntz9XydPz2eHq346vlTn6qeIR7K6+a/cXAj5sQK+cD7lN+d5GPekZv8mgeAnUA9mLJbirp/5VA7uKP+i1m2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inpf2mpS27KMeYkyYmNBEi7e3NL3gM3HocX5uPz7iqw=;
 b=KruJ/IE2xjpSMBCkcBJJa5LIsvXy1ukJALbiIR48Rtjbp0P/ggUuD9q3Pv1Pr7G3aPt68VZj8h3vSLELMNIvLUkHSeTE9ZGs5RWAtUpLPrXwGP4ClIMzsjruLa3SeuWtvtV8Ie6iN7+nr3bNTRS0ve8XirC77B93LWwuqSsFtLCX3Dzccq6eC7YRdV7DcjqeIQ+tSylnTbUcopO8zSHxQuo8kt4Z6Btjlu+LMlGzOajAHGTe5UXabn1PHM/JnKPeeYeQLkqKjU4tm7XL6JFGf+0smc2FLhLkOuRVmzWDXI9d4MrN2Fc5pSpPttYlCZAeVVNquq+NPmaZ+za7hQZl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Inpf2mpS27KMeYkyYmNBEi7e3NL3gM3HocX5uPz7iqw=;
 b=s7aOBvrjmUojKw/NOMdu0bXpC/voBdxE7Rt7Tlxl/oSehApODtxad4EmyX1B2+9S3g5XVDEJsvK7Rh768+BLwpfUwTx5fRkH+csEHI4QHVm7Z8lC7uHsPAudGOeF7v4s+xa6qp+0JqoaTliYBF1IbPqVnMhHclV1hop6l0FWaAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 10 Jan 2024 12:25:57 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Message-ID: <ZZ79VcZ1eCqfny-j@amd.com>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
 <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SN7PR12MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: e1171a19-c26e-463d-ab71-08dc121a60f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PXMQS7YgFap1pVex1HUsD3uPGMlaur6WOSH2KgNU+GR0olshBKZkIScLbo4kp+eVj9gFixSm/A7MYW0utHXRCFecJXMdLbf6KtDV+1q0A6IpWZU3ASdVUOuqveqDB+IICN+LldJIZI9xU2hP+DeHQT1VovtRaXvye7klOIBEjY9ASmK3Hdzel0qQ6uX5fKP7cpKWP1IjrylTp9DQmJLuyrg2DOXtHYvlsd8voAUkfCyh01tpb3c3ayCn9LYDgOXD5slzjTOz7kshgUTf6Rbs9/ZgsRpgV6AZiI6g1/vu+7THih+8+I1k8YxB8CF1h7VXje6KmXfO5ygiSiwBEGJB5DFji6Nl3g/BFiCp00YUEaw84T6a0IJh0tshundrI4dTa2M+T6Sj6+Zym1QkGVJcVobN8IVZrg1nxyZQcPybbi68lt82NDZT0239lYtDW1yU7zozhtoROD+TgtiaXhu8OlKPS/zg9UVjBSoRAgzIzM0AlC4bygj0jzMzfVaXE6EV8dm+3geB9+JM15de3gVf5TdHK76dnAgozvEbMCv06Mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(8676002)(8936002)(6512007)(316002)(53546011)(6506007)(54906003)(26005)(2616005)(83380400001)(6486002)(66556008)(66476007)(66946007)(41300700001)(86362001)(6916009)(6666004)(966005)(478600001)(5660300002)(36756003)(38100700002)(2906002)(4326008)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHAzc2x0RDhXeWRKMWtPVnA2QWxMOWppY1B3TTA0VE4zYVpoSUJKcjNEc1RZ?=
 =?utf-8?B?aGFJVW9IdDRBVVI5U2UxNng5RWhNeUNuSFpSbHpSVVplZzdkN3VwSW1OcXk5?=
 =?utf-8?B?ZUtOY0N5bkhhQnduaFBiWUZTbXJMNzMrR2RqK2ZJTzFPdVFDNzhESEpwcTBO?=
 =?utf-8?B?djZiclZpQjRpSmJic01xVGdFUDZKRkJXMVZ5dlBFbXcvcHBITHZld3Fwdzc0?=
 =?utf-8?B?UHQvOUZCRU5mWk4ySndwNjFhR0JpcWJ2NXljcCtEVisrRWtEWnZhQTBXRFdN?=
 =?utf-8?B?MVo3clFVYUY0aGNGRXdsR1Y0TlMxaVpLclVqcGFnaGNiRTVvZUdQYkkvYVo1?=
 =?utf-8?B?WHN2WEgxZlIvcXU4a1FicHBCVnZPNkdMdnIxZFVpQTE5eUp5QUtSMUlOK0lO?=
 =?utf-8?B?NnhpU0FOOElqcWV5ZkwwVGxycUh2WkpGQzhPN3dselFZVmczeVRCTUxJWjZy?=
 =?utf-8?B?WWNVbHZ4U0JWakUwNXh0dDUwVHhadDdCbkYrd1psMjBkdHBscHNteklTelI5?=
 =?utf-8?B?MjY0cUxmSE80bEpuSm9uY3BUU1l1RW5wQ1dSKzVGRGpEYnZQc1huekFIb3R0?=
 =?utf-8?B?Y0hvV0k3dWNXTkhFTEMrVlJJYzBlNERKRDRvWjR5NzNjN0paNWdtek1ZUEU2?=
 =?utf-8?B?QVBiN2dnQ3k2YjVhWXFtbnYySHByWEx4dVBRcVFxT1NYSHVyd2V4bExPTjZ4?=
 =?utf-8?B?dnRSdld3bUF4SEhxQjZ5MlhMK2NQZzVPL3dPdFlmTzVuamw2U05QRlBDQ2Js?=
 =?utf-8?B?Y2RsekF1VlIyMWdBNzlzOFZaSzBNbEVIUkFvVTVEWnVtK1B3alErTE82V2NT?=
 =?utf-8?B?S1dmb0lSeTBUYWxyWnFITVBJSFl3TVdJYnlYYk9UK0N3TGNWcmhmUnJSWnBw?=
 =?utf-8?B?a0JtcXF5dndXS2VNVGZqRUdrWDh0TEFYZXlaQnA4SzkxaHVIS1AxaDBCcVN6?=
 =?utf-8?B?RDlMNUJ5Zi9qbVkwQnpYMTFDd1h2OUY4Z2F3ME5HSm5wZ1RBekxuaVdDVTBx?=
 =?utf-8?B?eVVSR0h2UUVOaExMS24rL25mbDZoS2pLUmxScGpGeDBmVkJEV09meGMrWTFX?=
 =?utf-8?B?THFCcGxJeGhXZUJWM2hRM1VNdTdMWnZUanFrVVJkYUlhU240Um9LN0ZRTHBG?=
 =?utf-8?B?QXd0MkVjQzlWRGZVMlZCcFhrSzRHK2pxS1g4OGlOY2NvY3habVNpT2RyQlRt?=
 =?utf-8?B?SDhsTlcrT3Y4MnU3QlhDTkxDVis0a2JxU2tOZy81YU5NTFZOaW5mRC9yUUV6?=
 =?utf-8?B?Zys0M3RTeVhPNUcwaWtsRGRwZlQ0dEpFY3p4Y1FIalJNSU90ZjBTUkcwM2V1?=
 =?utf-8?B?ZjB5UExjdGdiRGNQU281NG9ibDQza1A2Vm5mWkNDWHljVFJZMU01OXlKdVd1?=
 =?utf-8?B?U1RFZ2twV1dPQjdYTkVRSFFML1lyMlRaNDBvako0Vk0ydW55Wit5bkRXSlhX?=
 =?utf-8?B?MXFVOC9ZeVN1WVVsMFM5cEVJYWdaRGpWeUR5cWYzT1dVamQzSVhNSHJXR05S?=
 =?utf-8?B?M29oSi9lelBFWW1OOGpOdGkxNHgxSUd5RzlRL00xMmRvZDROdmNhekR4T1JT?=
 =?utf-8?B?R1lIMWlQVjVUU0pud2lPUXczRkU3amdmR0VnSjdXVDNEdmUwRElYTmpPRFhT?=
 =?utf-8?B?VHRTVW5sNXVUZDdJejlEa3lWWDVmeHlkaEpkbE9HbnlYNkxmNU80azhVNngx?=
 =?utf-8?B?MTRCdDNYNkJTRk5sQWRXdW1ZV1d6S3VVaWg5dHJ5RFF6RlZ2aGtsRDBZR3ZI?=
 =?utf-8?B?eG9LZFhJZ1RYTHFHRmlmeVFnNEZzWG5iRFpCa0gxcm1TSUNmWGRZSURZNEZ3?=
 =?utf-8?B?UEpheThoNHlNK0V4YXdaNkk1bkFJeFJGU0duOE9Cam02bkJ4U2paaU9EdTE0?=
 =?utf-8?B?WjRwWklUZ1A3QzMxWFEvNENVMGh4S3BJdTFhVE9TMnJHK0NRSFRFWEs1SVIz?=
 =?utf-8?B?dVgvbU9jSVhBS0lHbWNpbjdRbVYwMlpUOUJ1bnQvTUVHcDZqbjU1cXpyN1d2?=
 =?utf-8?B?NVZFTW9kNlltUlNmVVJqSlZRL2JrRmhFNXM5dWJHcXFQdUdjRlVycWdyQVNx?=
 =?utf-8?B?eWZGdjMzOXhyQVdPdy9lSWFZcm9BYklDV2ZmTmFZcW80c3NlVCtBQWZrMits?=
 =?utf-8?Q?MjaS929EGLGNu6i6e7TyUfs/6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1171a19-c26e-463d-ab71-08dc121a60f9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:26:09.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ufUhlFPxGaFOJH7A2OPQxC+mCOpzkloWMBW4KH8grAfy7khwaEULdeNE/izxcCVP//p8xTy22CfOwNJlRv3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7882

Hi Javi,
Thank you for spotting and fixing this.
On Tue, Jan 09, 2024 at 03:31:55PM +0000, Julien Grall wrote:
> Hi Javi,
> 
> Title: Any reason this is titled for-4.18? Shouldn't this patch also be
> merged in staging?
> 
> On 09/01/2024 14:19, Javi Merino wrote:
> > In remove_nodes(), overlay_node is dereferenced when printing the
> > error message even though it is known to be NULLL.  Fix the error
> 
> Typo: s/NULLL/NULL/
> 
> This can be fixed on commit if there is nothing else.
> 
> > message to avoid dereferencing a NULL pointer.
> > 
> > The semantic patch that spots this code is available in
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
> 
> Good catch and glad to see that coccinelle can work on Xen. I am looking
> forward for more work in that area :).
> 
> > 
> > Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> c> ---
> > CC: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > Vikram, I didn't know what to put in the error message.  Feel free to
> > suggest something more appropriate than "Device not present in the
> > tree".
> 
> More questions for Vikram, looking at the code, it is not 100% clear in
> which condition overlay_node could be NULL. Is this a programming error? if
> so, maybe this should be an ASSERT_UNREACHABLE() (could be added separately)
> and it would be fine to print nothing.
> 
This can happen with failures in add_nodes() function. add_nodes() failure will
try to call remove_nodes function. Depending on where add_nodes() is failed,
nodes_address may or may not be NULL.

We also added a detailed comment on this:
https://github.com/xen-project/xen/blob/5a3ace21f3d779b291a2d305824b2820d88de7f1/xen/common/dt-overlay.c#L816

For now, we can return from here without printing anything as error message will
be printed by the caller of remove_nodes() anyway.

> Cheers,
> 
> -- 
> Julien Grall

