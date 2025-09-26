Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74261BA4919
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 18:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131678.1470641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2B2r-0001Tj-JN; Fri, 26 Sep 2025 16:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131678.1470641; Fri, 26 Sep 2025 16:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2B2r-0001Qw-GY; Fri, 26 Sep 2025 16:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1131678;
 Fri, 26 Sep 2025 16:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v2B2q-0001Qq-PM
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 16:11:40 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ff0807-9af3-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 18:11:35 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5304.namprd03.prod.outlook.com (2603:10b6:610:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 16:11:32 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 16:11:31 +0000
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
X-Inumbo-ID: 78ff0807-9af3-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubIRKESjaA5RTPjkQzvmOzN9PMu88JMmnLPSq30PXv6oV2mbtDLDty0+lQ2hfJbMexbGC3KfBKU/eYn48NTAvSh0Foq74oeqcPuVIEEYbedA5jYsaOXAzpeWrCkeIs9w+YgxYFRd86DKDTbh3bSPaqnEpCXZNgVpbaB9TxmrkUgyUpiIpg7K7s37S9DM3I4B6uoQYLliEi50DfEU3KtIm09Ap5GlK4UMGMLTW8154XJ+uvlvgS1spa29rwLhfjhonQRhbLzOUF0O9YIKqyawhE0BDKuALyDa26YkDa5HRzBs090/X5AX0yYoSoOJa6M2r6vAixMY+c46mO5Eu3synA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfY0RCovz+6I+auipczWgf3mr9J0+m54msDYturNMxQ=;
 b=wvg8Z76n2QWwRX+Pg1f+emVY686e8IWdCSRI32Tv5nBeuT4JDeQfdRjR3tSrzNYF7byg3UsO2WrH+no+nyictr78p4Hira6kWngPLCndUnKEBbqVDs3QsyDhaI1W+9PmpaHpTA5x63x4dWRfYoY9ZfFsQNxT5SCAHO0e3Ag95BF2aCdZ1EjIPk02H2CHvMdmHJS9pxPailxd4j/dbzbnwA8mBgaZiqGLych2sz3wMyeStSkLfZpaoQcI56HF25pyS0ru05Bn03L0c1rlbHO+4OKyy6b0uiXcaD9/DLEkK1g67ib27UjeAEcfxMFjh2+/lM1ito66iB/Nhvbzqlmy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfY0RCovz+6I+auipczWgf3mr9J0+m54msDYturNMxQ=;
 b=pAJ/rq7VCpbf7LrZYj2pwFCQ8L5YY7fVKetlpwRBu99otzzZMPc1EnRmkgW9uK2jYPDAJz/7CjxGWjMYyIq5jwW4eVZ0g7IzKYlBvMajO/srs/CPPytRMey+i1JlpKkcCj3Bm31CKO78R0FRO1Nnlqt7EB8F3lOsyoDtpo46kDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 26 Sep 2025 18:11:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as vPCI reviewer
Message-ID: <aNa7MOjELppsYep2@Mac.lan>
References: <20250922183537.8861-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922183537.8861-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: fedfd8c9-4bc9-4df5-6d96-08ddfd175b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzlJQm44U3ZyOE13TnJEWlFrMkU2ZnFkbmowMTZHamxpeFRxZHlpWnFjUHRk?=
 =?utf-8?B?NnhWdzZ5aXNrbndHSVYwVVl4ZXM5QnVYL28xZkV4cy9IM3pUcEg0dnkyKzhF?=
 =?utf-8?B?Z1hXcUF5RmI0U2pvT1V6ME1tRkJlTEhSL1c5dVFSQmFvZS83Q2wxL0JBcjlu?=
 =?utf-8?B?Ti80TmdqMWorUXd4UFVBUVdHNytpZzM0enFjbTZ2anpZVlJ6Y0tFS0VjVXBy?=
 =?utf-8?B?dGVYSUNXRUNuY1RHVy8rd0dYV1pURWtoVTVuclQ4R3JtdHpsbjY0RXRjNTJB?=
 =?utf-8?B?dXN2WGl5bmlWM05jYTNWMVZkZEhjcUs4ZEZEZUFYRTFMR2ZYcGxldURVUWdx?=
 =?utf-8?B?eWtNVVI3L0JyRHZBamgyaGZTN3h1V2JXdUZQTG9NRU03c1hpQ3ptM0hNR1Q0?=
 =?utf-8?B?TWNva2NtTlJvQTFwekowK1dURnRucnlGYnh4RGJ2czNzYzZNbElPUUdHekdY?=
 =?utf-8?B?THZGL2JEWGtXemlnSXQ1UHo5MnRRMDFzWlJxQTYzbzI4MHpubUtwZzRaL2Jv?=
 =?utf-8?B?L1dGQUNTN1ZIM3JNaCt2Y0dsdEJGeE9JNVBJcHFiMnUybXJna1IzaEphYWIx?=
 =?utf-8?B?R3dwTGtsT1FYd2Q4NEJFZjBQdDJEWXlXWEtMY1lWdW53NGtjNWZ5WEVEbm9y?=
 =?utf-8?B?OUN2bGpHM1VKRmREWE5HcDBQSUl0QUNnZ2FqY3JQVDdYdW5HcE1FVGlieitu?=
 =?utf-8?B?a0R0ZVZiV0ZtODNDQUM4bStHYUlpMTQ1SnMxcllVUFF2SFRXdU50d1I4VXAv?=
 =?utf-8?B?MGV3QVRsd1VlOG95bFhTM1YrTG9FUHR4T3pKd2N4V0tJd1FiM1IvOXlMN0J2?=
 =?utf-8?B?RnZ4VDQ5dGY3M3Z4bkFxS3dFT0pvVDd1RklJOEZ4QXdLbzBuZkxRMDhMWUFI?=
 =?utf-8?B?MnJ2MmRCY0o4TzNxK0FzbG5GeFFqTndYM3JLMjRWSE45bklWMktsQWtFNG1m?=
 =?utf-8?B?YlIvbitMU0EvZWVkajlVeWlhTlJReHBUNUkxL1MySDFBcEdFb1dMeVdqRks3?=
 =?utf-8?B?Q05hYUdRMVBSTGE4ZVg5UGwyNFk5amR5eFQvQUt1cjluSkpucHp1ZUtscHJ0?=
 =?utf-8?B?TVp3SnViK2JCanpKNmMzalNmdHBrN0JxaysvbHZ2ZnJnRDVlT3JheWRpZUkr?=
 =?utf-8?B?V01pWG0wdWJybUJVdTg5UmZBckMxY2RlZkw0VmhpaWZJWDF5L0FPNVM2aGI2?=
 =?utf-8?B?TGM3OEFUQ1M0S1FhQzZoUFB3Q0xhM0NvMngvSGNxZFNVV2xxRFNTc2xnK09L?=
 =?utf-8?B?dWFwV0tyenhYVWJoMmpYc01VY29MbUlNaUFPeGhCSUZqQmpoaExIb0plOEt1?=
 =?utf-8?B?QTlNR2VFQkhhYWozL3A2Smw3a1NuVGtVMEFOdXk1TE44S09hS1JGOTUySS82?=
 =?utf-8?B?WGFMSjRoem9VdG9FTjh2YXZDeVJqQU03cWErMEtHUG9XL0NVa1JCV1IxTkpx?=
 =?utf-8?B?bmpJV3E1M2orYjcvWGlDZ1ZMSjIxcUZ5UFlkaXRIR040TzFjRlRCbFA3UHo3?=
 =?utf-8?B?WGltbnNYTlNNeWVZbkFGZVBqaDBpN3k5RkZVRWxRd2x0NGtqYTY3dTFjVnRM?=
 =?utf-8?B?OFZvSGUyMlkvd1owSEdYTXlyc0dRSEtBVGVaWXZvSk1LV2NOb2NKWXhFNWdM?=
 =?utf-8?B?TmE1OTFFRjJWQ2M3cnc5L0daNHNYOHZxcUVvNnBaOGhsRmZKajBkVDJObmVi?=
 =?utf-8?B?OXNLN3NZcXluMUJob2hMa2RkS3BWdm1NTFQwWWw1MDZBNVQzZlZUb2crSkk2?=
 =?utf-8?B?TkFkdTVuNGMyR09KeDVkTzV1NVBnZTBrVDE5d0pHZDR5M3lvdVNMUFF3b1Rm?=
 =?utf-8?B?SXJRaWdLUkdQUytQTTY1ck9MSDJ5elhFT0FOREUwVUErVjcvUUdpWHppa3d2?=
 =?utf-8?B?dzFlNFdQTytJS3Y5MHYyb25COTJualFwNk8yYko3VzByZCtuTFRQT2FTS281?=
 =?utf-8?Q?E5hqq296Ti2AjJ0MlI5UEzbgYLiy0r8Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmQ2YzFDWGxxbG1Oa2p2YkIvWkxsR0Jock1ZaTg4a3cycDlPQy9XWFc4dDZ5?=
 =?utf-8?B?M2JSZEVKcXFOQ08xKzl3dndZNmJ1bHFjOUNoRzYvK1dISS9FZmQvUklpaGc1?=
 =?utf-8?B?WThPWk4wMkNVTlFmbzlKRjdEOXRackd1eS9HUEl1QWFFaFQyclFYRGIvL1hL?=
 =?utf-8?B?SytwaWJ3aHh5NWNCVkNNd3BPR1JVdnl5U1FXdktoQzhvT3BqY3ZVcElocXRh?=
 =?utf-8?B?MFBTUFNiak5rMG9kVjNqdkR2YnYvZnpJSTh2d1JCVUNGTENtZFB5Y20rcCtV?=
 =?utf-8?B?MDZNUnBZZEIxeVBjZU4xTVc0Nm82STB4dXVXZm5YTnJMcEd6SU02TTUvQzBk?=
 =?utf-8?B?cHhBY0FCZzk0bCtjK3lEYnREYTJxSEFGU05PalEwMUN3MDRLUllHb0wvZDRB?=
 =?utf-8?B?TTdBcmdHWkdnazhabStETG5KOENVZ0Z4U0VMRkdBZlNmbm9OdU5ic05XZUxa?=
 =?utf-8?B?UURYMkg0Z3N5bWxjMTY3MldGSW9YOFlna0pMYkdvemdDL05zbVdPKzA3dER1?=
 =?utf-8?B?YVJXbmh1K2ZhMEpqejNGcHdDa0tPNjk2S2xQbG11SVRURkdSRkNQanh1VGM4?=
 =?utf-8?B?VDZFZnFwcjhpcHZrWDYwNmxYU2RPVklNV2tUcGxZSUZlbUVyVElERWcrbGVx?=
 =?utf-8?B?K1QrWjRvNEFDV3hmaWVHNTc4LzRqZE9vMDRYR2JlRGdla2dwdWNQNVhySzJ3?=
 =?utf-8?B?Q3JtNUdBcHB6VW9VVld5MWI1QVBSVFY4QVRFVEZCMm95SUlnS3V2WDZpdkRh?=
 =?utf-8?B?cFJnWjNNVlg4NitiM0IzTjYxTHhIcW5ZMkIzbFRSa0luRkdUOFgwZDJmOEZM?=
 =?utf-8?B?VEhHYU5KU2Y0OWtkbEJQVFhDMmh4cGx1QnVmdll2MUlTbmJWNjEyUXU3Zk1Q?=
 =?utf-8?B?SEZuMXVFS0tBNVZ3d1p0Mi9TeE8rZkZSU1E2MDBMUnBwbE10Vm1vbjFiRzJN?=
 =?utf-8?B?N0dsL3BNcWlBUjBZeXIvaVRiZHAyWnQvdHdhUjFqd3lEbHdmMUNvRnhzREV2?=
 =?utf-8?B?alZYNnVqbVFQay96RFpmd2V6RXAzbWJUVFNjOHpZK3htQUFXUjZXcW54KzJa?=
 =?utf-8?B?UU9yUEFhdzRsSWNNWXBxb3BTSTY1NjBqM2oreGxETVFKTmVWTjNHVTlMNTND?=
 =?utf-8?B?cnNLWWhVWW9ST1l6NHBmOU51Sk5rcTdiVFhlRmhQZWZCRTlOeDdVNUxvemhj?=
 =?utf-8?B?ZTFQRHUyWDQxSHQ4L1FqaytnTzYydEM5eTUzQmVSdURncXArb3pqNDdzd0RG?=
 =?utf-8?B?dUZRcmVRS3lqME0vZVkxenk3SnlmTmxzZ2xya21hcGNCZHhoZkdSN0FSZFZu?=
 =?utf-8?B?VldzSGZmSEZHOHRZZzZqWHA1c3d1d3FyZ3JkMTJOZ2FrVHR6VlRGczFuZmd5?=
 =?utf-8?B?MEw0SDRyY1R6MEt6VlJTZGJucTdNUFJyOStqaTIrTGlPTnQzeGhPVFh1VTBa?=
 =?utf-8?B?V0Rnc2F2OTZLQVR5UGJ4NXoxampsM3ZLTlY4OHJXTUJoeEhWU1pjbU9KTFFt?=
 =?utf-8?B?eThxTXpLdXFmNFA2TUNIN2NjNTZCcUNML2pGVFZnb1ZvMU1SNEprczRzWFB2?=
 =?utf-8?B?NDMwV0RFelFWS1VOVDY4emltMGd2VFBZUndOZDNUU1I5S3FkNDBpWUdpVlUr?=
 =?utf-8?B?WTdpOXRvWVhoWm9JVmsxOVk3dnJ6Y2liTWZIeFB1RG9nRjg2K2Yva0pDd0Jw?=
 =?utf-8?B?c2tLQWdiNE5JY3Jvcnp2NW1zeHhOSVZIOHcvdG9KaHZoOEtDNEpMSkZTdFdY?=
 =?utf-8?B?K1Q5Y21WRkpxa0hBNWZYNlJmbWFIZmVnNm1ZcnEycmJJNTR4L1hxWWcyNlFS?=
 =?utf-8?B?MFpDU2dGMk93dzBSbGNPblBUYjFqK1UwVTVabHdyTXJha3JiWEtEeFltSWR3?=
 =?utf-8?B?d01DdnA0SndVYTVYekFtVTFFdHE0dEE0ZHBlampYMEdaa3lvZEZNRVNqREE2?=
 =?utf-8?B?dW43Qlk3MzF6NEpFWHgrYmJaU2dqSDkxRGo4UVByVjhGcjhFUmdEVERkR2Va?=
 =?utf-8?B?eG1TS3lQaXVDY2lra1ZUWitEYnNsVjFEbWx1dXd2OG81aUQ0b2o4RDNWZFZp?=
 =?utf-8?B?emlFYWZHTTd2TG93U3VPVkNOWGRCNzFub3pTbXJTZUYvMkJtczJXaWtDdFFC?=
 =?utf-8?Q?yFWufKGUjxWMmChNPcl4eiaFY?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fedfd8c9-4bc9-4df5-6d96-08ddfd175b62
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:11:31.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ft0pyj2OOw4lasKKIMRCnstT4NdpEVegcb8IJaZz38RyzBb5OnJWzl+T2vLZfdW/WJRb7PU2Nr54kV+nYSyv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5304

On Mon, Sep 22, 2025 at 02:35:35PM -0400, Stewart Hildebrand wrote:
> I'd like to take a more active role in reviewing vPCI bits.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Sorry, I've been having issues with email.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31dbba54bb6f..793561f63f83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -578,6 +578,7 @@ F:	xen/include/*/vm_event.h
>  
>  VPCI
>  M:	Roger Pau Monné <roger.pau@citrix.com>
> +R:	Stewart Hildebrand <stewart.hildebrand@amd.com>
>  S:	Supported
>  F:	tools/tests/vpci/
>  F:	xen/drivers/vpci/
> 
> base-commit: 656b9ca03bd340715aecf405da63c515afb344a1
> -- 
> 2.51.0
> 
> 

