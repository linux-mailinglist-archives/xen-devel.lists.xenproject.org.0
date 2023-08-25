Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A790F787F10
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 06:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590483.922781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZOgx-0005uj-4p; Fri, 25 Aug 2023 04:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590483.922781; Fri, 25 Aug 2023 04:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZOgx-0005rK-0Q; Fri, 25 Aug 2023 04:45:03 +0000
Received: by outflank-mailman (input) for mailman id 590483;
 Fri, 25 Aug 2023 04:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZOgv-0005rD-9n
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 04:45:01 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 240cd0d1-4302-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 06:44:58 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 04:44:52 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 04:44:51 +0000
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
X-Inumbo-ID: 240cd0d1-4302-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De830zXFSon0qjbFNQdFNK5mDO1n+g4+Dcb6O8QL5IyG9e4PNpoUXbjT5ToD+Zrj+VTOrgDqtxxhwSrxEwrkWIHEjRpxN4rKkEyYfkNfcFTgOXxkeCgBYE4IRb3zjfAcShBwX2LzylahJiJ9zyQKbORBGUihxmbQbmHUut6fH0+zEjsrKOQh1ImJuogo/zZTBWTa2BbML9i9H4S2X9OairnqpdxqlJ6to4n6o0ibWYKHkwbeJaApE9/5JXX51Vv1z+DOFnIGLOma03BSBFo0PXnolLFv4NsuocTjKoC+1J71s7uK23d3WJyLVxsXze3cwPPL/hQXV5E18Xi3jXSjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP44Rz8RZDYYx6gs70yg7+oGb2YlKeE1DZXX9oWyySs=;
 b=bqu2loQVwIlTXjgJHW2AT+j5vJJanm16OXwaHY82yK7aIN6w5ziA29ucH5nx0Z2cgxdVd1qmAm9CD/uRPMd1d0ge8+fmivL2FT/l1PLsbNGhMgh2aA6tWo6YEhFw3wkoSyOaVfHo/bTDNVLqNV7HEltxS59SY+qya1UK4PoZSYHal9x44+xVa3LEUrBGSAXNKPjLHKEzxSRM57RxZkufQdG4gSOSHf5hjHMwkUJtH0CUEA0d/PAOVP0PxM1G435o2B/sJadvY+ojdyhKzMUekFD6snVRFmnBPwjcaUIX1G9qSgaB3UImb+uyipMC+/pxDXCOwCNjsGKNnDlpAbA20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP44Rz8RZDYYx6gs70yg7+oGb2YlKeE1DZXX9oWyySs=;
 b=S507QSTz5Gdm6uzPKivmllCF1KRyIbeqiSLoAS81b/7jFa1dbo8UpzXOy29jYrXyIKOnoK5o7iSMv69fbjAvCqjRuy8ml99Fs2OLd5Yb10OQtoNDP1vL6DFxBqIhOCxP4QSZCNNBsW7qo0manwtNMm/k0XNqxfmxBPli2FLNOfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 21:44:48 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v9 10/19] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Message-ID: <ZOgxwG_0kfhDPFZl@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-11-vikram.garhwal@amd.com>
 <62c19920-cfe4-405d-9294-7ed426b3a99f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62c19920-cfe4-405d-9294-7ed426b3a99f@xen.org>
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6101cb-f610-4f63-4516-08dba52604f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XAMIDSXzhXJhpQ/agmdSgnGA3/aB+lkrFvE3YobvBAoYDQnuiYnl5LljP3dzjWXm+OwcSBYwCjrlJC9wD+fVhkoYI8DazU7lhbkTs3tlydCpDPArc1nVa3ewVb7hOLMA7QqPS6BIbTNHbzhmkmYwHsOeHVjeCgQC/cf9Sm+9+dtQoIerUSVcv/JA5v0xj+mLGxCScHK3GWPIgmF3i1tgklg8ptI6bXy8z/LCl4Lct8VWyDIzH8/D2NcIjKavZeXnubrwGR9YdsDJ0DEUdqCOh8d2Yl6lVrESCAMwLFlGO992vnilKy7Iq3O+wiDGGoaod8yq14uDYGby87PfcVY90/RVnNzUTqv+vJLGCMNdIoN54p6jlg4kAzq3j+DJ0EEfdYLF9u6OP5boRDmAi7U4e9mxVKupng5uG7hdQGxz/Omp445ndi9jz+VkHeuXyTBjFBR2BuhmXt6TXlZ0iJH3DV+Rk8cEMbB0Tz6iF59YMnzxR+RuONtxumZ4t7j0NvTeBZA7tv5c+QXfwnkQyYFXWzVqa5932oCGZevfyZbxhJ/j0Y7yuuWlZ/vgnvoYT4YN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(4326008)(8676002)(8936002)(36756003)(83380400001)(44832011)(26005)(38100700002)(6666004)(66556008)(66946007)(66476007)(6506007)(6916009)(316002)(478600001)(53546011)(41300700001)(2906002)(6512007)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJKbWhzNFBHbWhZR0c0WEhkaUVrbzR0amQrK1dqYTQwTVNOVGZVTU1TZGQ2?=
 =?utf-8?B?ZEFVM2tGczdVbU45TjV2U2srUVZDaWx4TlRnUlBVVEVUL3BXVU5zdEF0eTdF?=
 =?utf-8?B?SDVyb3FzOTFUbzhUUzdDdUV3RkVlQm9jSVJhWk5zUlo2dWRSdWttdkh5YWds?=
 =?utf-8?B?aldBcmVQeEwxVVVLTUk2TWVlbFV6VXhoTEo1eEtnRVpLbHI2Ty93ZC9RVFd3?=
 =?utf-8?B?a2UraUVXVUFtMzJhVjhqVHRVcXFOTlRtQ1EzVXBONG1ONFVKNzVRd2I4N3dJ?=
 =?utf-8?B?Vlc3Qjl3d0VMRHlSbS9WYXFLTlRYdWN3bTBGRXo2dUxBV2Qyb0JhRG5EQlZ1?=
 =?utf-8?B?YnpMRVI5UjJETCsveUZwK284ellyT3MrazhEWkp5LzUxZUFVcEMyTEdqQmUy?=
 =?utf-8?B?UUVPYis5S09OeFFZaVY1WXBLRE5Hbnh6VmUzZURwaXFEUHFoVEE5T25jaHRI?=
 =?utf-8?B?UTNzRW5NN0h0cWY1ci9zTHNrNy80c1RrR1l6Tzl5N2hFWE1aV01zcEcvd0hl?=
 =?utf-8?B?bmlweGkzeHg4b3BFNVRXam1mKy8vYzk4NXJDZXlDV2tHN0VaWVlLbnhtdEox?=
 =?utf-8?B?SnliaHNlZ2xWa1FpNW8zOGIxR25NM0xDNWlYVGJIclhBZnF2czJ3ZlNvY0pX?=
 =?utf-8?B?anJhaFczU25seW1TSDdnZVoySk1FVDVydHd6Wjh2cUFJNERxODIwUld0Vklm?=
 =?utf-8?B?eFljZ3Y1Q093RFVUbHhkRXVMUjNBY3JkdzgrV2hua1RWRTF4TC90Tkp6eC9z?=
 =?utf-8?B?MlovK1QvMnFrMEJ6enlQcVZCazBBdkZMeDBRTFNpOWltejJ4SmgxODV2YklB?=
 =?utf-8?B?bHJwR3FBZDB0RjN6ZDhsL2VhOHhkcXY3ZVVMY0ZlU0tIUmpOejdIWFRVQUNp?=
 =?utf-8?B?YzhKWGhUTkZaRVAzalpWc0xPa1hLUDJqYVpRWlNucDdrYTcxWFMzMXEwZ0hn?=
 =?utf-8?B?a1d2ZlFIc2lCdzMrdE1vQ2pKT042QnNVV0dIQWVWUHNFb0JBdWlmb2FhaXRB?=
 =?utf-8?B?aHFGNjZmZ0hCN1RzVWtWZnhjWm1DQW5GS0ppV0VseWxDRktUdm44VU8zd0dl?=
 =?utf-8?B?T0V2dGhKQ1g4VzAwQ0ZvTTFRL3ZFbHRvL3pOL0dRakhmYmJzSWVKMTVkNncv?=
 =?utf-8?B?ZnBSalg3QzVrU1ZEN3F5S0szREVMYlNXUHBqc3BrWVBvbmxzSkRZdDF2eWtR?=
 =?utf-8?B?eEhpN3grcHNMVVpYcmFNWEtQamw0OVFMSmhINkpRK1VTY1pZRzdZMk4wZjdn?=
 =?utf-8?B?emV0dFVicHRFZXZWeDlQNjJYeUZKK0x3VHRKdko2MjZLaVpyNzJ3ZDZFM012?=
 =?utf-8?B?cnJncWpsbUtHYnhWcmdJU0M3Y24wZmFoZjdmZHlNQUhBME5KcEEzOW5CZXJX?=
 =?utf-8?B?V0tGVGhpemRyenk2YyswOFdoWm9JNkQwd1lGdXppMmpTUlZ3SFZMRW91OW52?=
 =?utf-8?B?Z0traEUrYnhoNXhhUUZPM1Q5TG4vOEFrUlRyWU54eUtSZVVMTk9pS3JPU1dT?=
 =?utf-8?B?L2hybjV5RG5ueXk1L2NwSUI5d2ZRN2ppcDY3N2hhY0xlZXNHV3p3dXY5bkpL?=
 =?utf-8?B?dHJ0U3NrKzc3dEZvLzBNUzdUcTZiREFRR01CZnhqY2RRR0E4MWxNNHRyQU5l?=
 =?utf-8?B?TTJwSnJQcktrRlIzOTFEY0hUblJVODA4bGNrVUZPRTNMY3dBc0tSdnY0UW9o?=
 =?utf-8?B?THc5M0svbThOamtLbWhUWjNaUzBDSUhNam1VK3JUMFRFSnhBallyTWNzNDR0?=
 =?utf-8?B?WlNDRzExSUtaL0N3S2NmdzVRWVk4VzJBOUd6V3ZURjlTZlB3ejgrVHpXZDQv?=
 =?utf-8?B?V2NSbWRIWDljWGl6cDMrbGFXZnBvSmgrclBLUEF5aVdiaE9FbWg1NUdhNkVC?=
 =?utf-8?B?NVQ0akM4UnpTa0h4TEJXK1A2cTh6YVNWNDh6a1A4bE9ITlBZSG9xNys2aFRW?=
 =?utf-8?B?NnFVVVUwZVEyRE05aXhSa3JSZkpnbVlxMm1NQThCT2dGSWp5UWMwa3hmY2pw?=
 =?utf-8?B?SGFyNUFmNmJrL3Y3QnNmV1NJSWdEUmhMcTZiSnQ0K0JKeGFGZG85cEsweUZI?=
 =?utf-8?B?dnhEeW82RUtRZ21Za3E2STJxQ3V6NHdHVk5rcEp1UkdxbWV1QmJTd3d2cG94?=
 =?utf-8?Q?HxlP75iUWckrzrNmVh8I5rtCO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6101cb-f610-4f63-4516-08dba52604f9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 04:44:51.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hwEvfMdgZpifcfcZ4YMVAQ9y+djc3YaItD3lVdNubw46odJSt6vBHo1nnBEAs2O0OJwqpx6wTkposQMmEp4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469

Hi Julien,
On Tue, Aug 22, 2023 at 08:47:10PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
> > to add/remove/assign/deassign.
> > With addition of dynamic programming feature(follow-up patches in this series),
> 
> Typo: missing space before '('.
> 
> > this function can be concurrently access by pci device assign/deassign and also
> 
> I couldn't find any use of this function in the PCI code. So are you talking
> about not yet upstreamed patches?
So, this assign and deassign is also used by pci-assignable-add from xl which
"Make a device assignable for pci-passthru"
> 
> Also, typo: s/access/accessed/
> 
> > by dynamic node add/remove using device tree overlays.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> The code itself looks good to me. So I will provide my reviewed-by tag once
> my question about the commit message is answered.
> 
> Cheers,
> 
> -- 
> Julien Grall

