Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IbBAMNyg2mFmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:24:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69964EA2A7
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221005.1529401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnffx-0006nM-Lp; Wed, 04 Feb 2026 16:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221005.1529401; Wed, 04 Feb 2026 16:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnffx-0006lH-Ie; Wed, 04 Feb 2026 16:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1221005;
 Wed, 04 Feb 2026 16:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnffw-0006lB-V0
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:24:20 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f7266e-01e5-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 17:24:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8316.namprd03.prod.outlook.com (2603:10b6:8:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:24:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:24:16 +0000
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
X-Inumbo-ID: f3f7266e-01e5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naFhBxEqY2sSnw00B799MrYo6eE7MB4U0sgiWEIKBanpe8yQ4acyeYxvNorboaNwyISHj0ZV/KwJvGBafqr4e8IDFHdh62CIBherg7RQT2WXICO/0CyGyPHfuQkEJCPN/Ct3hSdiY1vYrRyYboa611AbwfmiJKqwKRODHcx74Fc4hXPjI6wMwxODGWF/sGc+NrLh84zU6Gh85vcZjwnVX19zBB8b2tMxGGhZ1Nyfkp/pPoTWltUHqBgQfoflsjZ6zyvTm91qdUFU3fBzx6SftPE5rCC9s8YFPvpMhUyZqTxGnN744kpaDkpja8kX38m5EIbMytpemEYqzvWDs6xkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59GgZe2oAOQUt8wMz8yF/Xk3k0UljDIQ9RNolX3SuAI=;
 b=bQJK006SaPUzSTngySegq8LbqLEGYS2NrvOdwJ/J+iYUSclR33pi0XxXuJUKBepGpJc/XX7EIeh1OH44Y2zzWY29ABkSQXFnt6TfMIVlGNXftdlxr9ZMo7KqLaOFiGXfrKpHjQqjZXwRDlLWKxoSKMPjVDHcpXEGOQSYZ33l8lJWM8tOhuA6VZtVNC5qyK6LWcYFczVcNVicku2uUlhpdfHLQU/oGc15pd56+vvfaXgNvlhocYPx41MoOK7BqCveRtIqi17CVXsDL9A8AkV0iUxJz/vBKZVxVgUmTBl9qLgLkDDzakwaQ0/fxyKZGv7WBt9qCBVZJhk56/n7R68Qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59GgZe2oAOQUt8wMz8yF/Xk3k0UljDIQ9RNolX3SuAI=;
 b=PWgO0S27ibt87iFPBh8ti5PBVqdX4Mc2PTK1RhIBeYOn9hIxp5pYlHhuq1WauMW1lA/oa4yOjX8sPtO7i6Bd4iW4tkq0amvX7OZ3anHGsCn2SSN6z9sDmOikpR2VhDqRbihYM4/B76eTJJ0wf1lhzW50ou1kUJuutWdpDvrpgoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 17:24:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Message-ID: <aYNyrKA7bOiZQSZU@Mac.lan>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
X-ClientProxiedBy: MR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fd1c11-f1c5-4b80-57e7-08de6409d6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzBJbkpoOWc2ZTNqc05mRmlBei9sa2xIT0FyaWplOVBkMjh6NXc5Rlhrelpx?=
 =?utf-8?B?QStTL0lna0hmeFpjVjJqRklxYW1hT3JvZ0hZNHVNUFZodzBybDk5cldRT29S?=
 =?utf-8?B?ZWhZbHpnVkRkR25vaWRBRGUvb0JWZ3lDbUlBU0lnc2lYdjRVejhVSkI4VzhO?=
 =?utf-8?B?aTJIYSt3aDRpcnRZR01ZZ3gvY3BNallwT25xdEt5VVJqNUtxWU9ZSXRqMUM2?=
 =?utf-8?B?aVdYMVRJb0FZbUVJaEM4c016L2Z4ZTBQNGx6UjJobjJlaGtKSjlLVWhrS0NC?=
 =?utf-8?B?YWJjWGpqSGFNbzRhdURMN0F0MWtITDZVWWwvMVVRTG1lNUk4T0d4c3FHQUdr?=
 =?utf-8?B?U2lkS1c3aUxNbFVZM3UxUVVRaGpUQlFiamhQSjRDaUszd29DamxESXVWWHJz?=
 =?utf-8?B?L1pTVm1Qcy9qbWRUNnpVSGkwcnc5WitkQ1QxOHpkU2gxUGlTSHZyaExZMC96?=
 =?utf-8?B?dXlPRUJDeXpOaUpZWjdNalRXellPc0ZvSmV1Sk1pOFRXU3hnbXVyS0RYaWU1?=
 =?utf-8?B?WHgvZVVtdkRSTmt6a2liVzVvZUpWREN2Z2JybHZ3c0VFT2hwS211cm5lUXdU?=
 =?utf-8?B?QjhjS3grOE1WT3pUWkxEVTg1ODM2T0w5aTZyV0RML1FtcFZqdVhsenU1aVpK?=
 =?utf-8?B?cTJtSGhIbFk0MFZibjEzcStwMTN3YWsvdHhtMndwWEZrMEN4VEgzOWJUelVY?=
 =?utf-8?B?R0hBN1BEQ0ZRUmdYUFhaTUFYZU52bkRVM3Y0N2lZMWtCU2lCUlBDUmQwNlNS?=
 =?utf-8?B?cHBzQnJKNEZvU0FWcEFkNHkxYWlxYyt1S2thSGZWQ29oWWs3OHBzcGtLNnE4?=
 =?utf-8?B?ZTJRNWdGQk0raTEwQkFNRE0xak9peVEyNjQyS1QweFJpRG9zUmN5Y2R6L0RG?=
 =?utf-8?B?azBuaWhJaG9XMjF1dnpXc21INVo4eU5PVjh4SHFlT2JNRGNBSTB2SWdjVmlu?=
 =?utf-8?B?TWRlOWFRQStqYjByemc3aUdRdWFmWEZVYUo4eXBJaHZlUkZDQWF2UjJ1N0JT?=
 =?utf-8?B?ZGw1eWlCSlJ2M0tsRFFOdWdaK25TMVdIU0MxN3lRUzlqMmh5QWdpdHZJMEhi?=
 =?utf-8?B?UDBzUEZ5VW5hZ2hiRmFSUTN2SHBhbjlFVmlCQkF0dmxvb3F5SlRHbFg1VWdr?=
 =?utf-8?B?ejc4dEZKUmwwYkJFb21rVS9qZWF1a1VqUE1NbEFlM0YxM1p3R0NtSytmZjRZ?=
 =?utf-8?B?NHcwQmlWYkR2UVYrVVZCRVdZaWpuV2VlYTBHRDExL3RMRC9MdEIyb25YWFRk?=
 =?utf-8?B?SjJJNVN1YjcvOFc5SEkzREEvRFdmc1NGM0F0dHhwbXkrQ1grdnFRbjg5T01Z?=
 =?utf-8?B?d1VubElSSWgwNGNRUDZJaFhxMDY2VW9FUTBwK2xjZlUxZUFKbFJpVmhZWHR4?=
 =?utf-8?B?Z1Bpbm9Pc3FRWDdJRG81Q2NoVXFBd3RpZmlweVlXNVZiY2pvMXhyeUFLelIz?=
 =?utf-8?B?Nml2MjVCSnRVbTAvcnhnaC9SZ0VXbER1ZnY3WlV1c1VGZlFXeTBtbE1FZUhE?=
 =?utf-8?B?REo0eTlXYzZrTVRCeEplMFZBT09VY2JBUVhzcDRLcm1QdWlqUnZudFk3ZGcx?=
 =?utf-8?B?aHkzbUtvbU9PREhOS0VqZnhmRGtrSU9XekpRWG1xRmpNUWJ5TFV1bTRtZUwy?=
 =?utf-8?B?SXZZWVBPSDFmRVpab0tRL0pPa203bDlkUzR6M20xT1NROVVxNXQvTTZEczd0?=
 =?utf-8?B?TW1saDdoOUN5RXZVMWRoWTVhQ1hKRDRqWTdlTVhXUCtWV1J5dDd2VXgyN2lZ?=
 =?utf-8?B?bG5kMFRjbnNZRGkzT2E5S09MeGQ4eWljUU1TSXllMW82dzZqTEdKYWNyalNm?=
 =?utf-8?B?bjc1dWN0MThwUmRmYUVMTytiRGIwUU84ZGVWSXBKVy9nVVdQaGhQK3N6c3dD?=
 =?utf-8?B?clp3dGRFSFpqK3RWN3dqN0NuenFldTY3RWRaQVo1TGlXdjhreXgxT25VMU92?=
 =?utf-8?B?NXB6VTBNY1pFWHJjTjN4dVQ2VVBwL2UxUzQ0VnNZbGluSjN3U1V5dWNJdS9V?=
 =?utf-8?B?T2hnT1Z2MlFnVVZXQUMvc01aTnA2ZncyMU4vb3RhK1lmK1MvQ3pOMG1xTjJU?=
 =?utf-8?B?RnVpaElKV1pLYk5QWWpFdS9NMTl3NFVEVTY3VmJNNkxFL1lFTW1CNUhiczJv?=
 =?utf-8?Q?mLB8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qis4Y0RXcDF4em1ycVFtRmpiZkNNbzdHYnVFcENmRytmTmp6Tkd5TGUya05h?=
 =?utf-8?B?Nm43T3J4ekNhcEpZdFY3dnFZQTlWOERULzVTMVlUdVhleDNxTHM1Si9NRzlJ?=
 =?utf-8?B?KzZBZlIyWDRYVStVeXpieitIcEhsRDJBV1VlQTFObjFOSDN5bTB3dkJpaW8v?=
 =?utf-8?B?S1M1NFE0U3FxYmhGRnV1QjVsb216c0tqMXNCczgxQW9FbVA4UXdTWWhkdTNN?=
 =?utf-8?B?TnU5NmU2blY3Y0lMRE01MW14TTg3bGVlaEtoSFVUUlh2S3VnY3lGUVRYdWkv?=
 =?utf-8?B?T0R2RytEZkZJdFhFaE9hOVJobkprNENEMTZDVXR1T0NYRTNmVjZpNVBnZHgw?=
 =?utf-8?B?NEZPZG1FY1Vwb0l4bmxSZUNlZ3VnOXpDVTNXR1NSVjMzSUIzNmo4ZkNNelJO?=
 =?utf-8?B?VkdvTGU0K3grQTQxcWZNL3JpOS9KQnYrWmlhQXljM1dseUw3UkU5TTVrc0VW?=
 =?utf-8?B?TUFlcmFWem1mUzBRajk3a0V4aHNkVVFPNmgxcXVHTlZodkhVMG5nclA3SXVG?=
 =?utf-8?B?TS9kQTVSeUJqUWJSUDFrTWpKRUxNYlpva2VXM242aWFrdUJ5QXAyQzhLMmlX?=
 =?utf-8?B?UnFWS0p6YXhGM284YmZWUG1qUHNsYVRSK3JZRUx0SGRxS3B0TUVlS1Aza3g0?=
 =?utf-8?B?cGFKaElUdFJCQ1ZJT0ZKTmlHYnEvVjV4MnVqSmkyanpWdlkycTVreWd3UGxV?=
 =?utf-8?B?cmdTbnhBNkROV0g3OWJEVEFVZVp6NStQaHoyT0hLc05Ic0xkYWNSTjNNQ2Rz?=
 =?utf-8?B?Nmx3ejNyTS9TZVIxN3FsZVJjT3Z6NlhtalZDMDhzbW9pYkQvM1FhM1Q5dFpS?=
 =?utf-8?B?QVZCTFlpWTA1TE4vNWdJSk1PVnRMSnFReDhJNkw1ZmphSjZHY2VoR2Z6Y01q?=
 =?utf-8?B?RjUwQjdOSnpNS0tyWlRUMCtWTkFlaHBPY1FnaWQvaDhxeGo3eDJGQUdxMUJz?=
 =?utf-8?B?TDdYcFF5Z3VqVFhhQ0dadWMzOVk0YVJBVE9FaENYcHdaOGFiR1hRbnZ6MGsz?=
 =?utf-8?B?bWlrK1ROYThra1RUVzdoT2dMcHhsNEhvOWgxcXVoSTYxaXN1L2IvOW96bkYw?=
 =?utf-8?B?L2JkeHZIbmRvNWVBVTZ5R3Z0bVBJTjV6VWo2V1daRkRNMUZ5N09nV1E5Y2pF?=
 =?utf-8?B?RHEzaUFmY3g2Vzgwa3VkWmo1UDY4bXhOMU1UeUhyZmE2bEl1ZjEyY1ZGWVRP?=
 =?utf-8?B?dnpCVndrdDhqNENYVGxGU0NVYjV5UkdwYkp0d2RsZGg3OHVRNWhHclRjRWNq?=
 =?utf-8?B?Qmc3cWEvWjBZTmZkZUp3RWpWQU40ZlRXWWZDZzBnQ1ZFSDkrbEx4T3BQUkNt?=
 =?utf-8?B?SDMyOEVzblJuNXdnN1J5VGwwZENzbG9SV21aNDlGb0pnc2htMWFzckZtRERE?=
 =?utf-8?B?aWNrbHR3YzJ2OHRxSDhCL3VqeENJSVdNTFowMHJib01LbGdOV2VtMTdZTHMv?=
 =?utf-8?B?cHg2clhoZDNkOXIwc3J4NGd1NXprYWs4K01oeSsvYmVJVENGZHZCZXJVcXBC?=
 =?utf-8?B?YzdRVXJlVi9oelpRbXV5cGxzSFZPd2FSNG40REhub0VnSWI4WFl3OG43T29q?=
 =?utf-8?B?Wm55OTF4SDY0bVZkYWJXck5xblppWVNaMXVWWFlBTzgxWHhPQTBPb1J1Qmkw?=
 =?utf-8?B?bk9uTVVlUnJoNHB0UkNGaEQzMUczdksxYmp5TzRrRUIrNDJleXhtL0NrNS9q?=
 =?utf-8?B?dU94NTVqK25pMXRsK2NtNE1Ka2dtZnc0K1ppSTZXSUxObEdCM0RSVnlLbmxC?=
 =?utf-8?B?U3lxOTEwOEE1Yml1SHZYYS9DQ1RDRGJSd3VGc2hWVEY2TmIzNFFPTUJwdUxG?=
 =?utf-8?B?TnprRXhFcW9JU1loODU2MjY0eWVoT21CZGZpTkxGeXVSeWJDUmwwa3BaVFZT?=
 =?utf-8?B?VTUzL1NMRnRzUkpNVjUwM3BMMDEySDNjWkR4RktUcGVoTGV1WWZmQjlEQk05?=
 =?utf-8?B?OGkya2VGb1FuR0xJNXd2d2JCUnYvMitTZzZJejJSUkorb3BxeUZGa0E0bHhR?=
 =?utf-8?B?L3ozajBndWIzeWs1SEFsRm9DYVo5T0c1bjlHWE9Kbm0zbnBrRzhRTG9YZUJw?=
 =?utf-8?B?SldheXFHTW1mQnZaMWFqYmpDRW4zdzZQNU0wcmJpeTYzbVdRVy8vOGFJR2dN?=
 =?utf-8?B?T1JYV0x6NzhaazZieWMyeHVpZUtLRjh6MnZ6NDZpVXI4dVdFWVhoRWsxQVdh?=
 =?utf-8?B?dkFkOU01RnZXT2RqaWJLSTlHbVFQdVFJZDFLeXVTL016NVZmelI3T21GNCtw?=
 =?utf-8?B?TS8vdUtpTEJyaEt5dzVIRldaSkFNMVJHR1dEbHQvV1ppWEdFSU5YLzVpeXFn?=
 =?utf-8?B?SjhrVVFzNkhqVkJ1YUZNWWhIK3EwQ3o1L2dlUm93dXBOc1FqOWowdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fd1c11-f1c5-4b80-57e7-08de6409d6fc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:24:15.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIsPPNJn20QnbMitMuFTgT9yCCdd6th8cxdapiyoIJU629nq+Co/AsCEamyYEbwSG8gpx/MQ3vo3FowHS/W1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8316
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 69964EA2A7
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:45:33PM +0000, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 04.02.2026 14:16, Bertrand Marquis wrote:
> >> --- /dev/null
> >> +++ b/config/Darwin.mk
> >> @@ -0,0 +1,4 @@
> >> +include $(XEN_ROOT)/config/StdGNU.mk
> > 
> > Darwin isn't really a GNU environment, is it? The definitions in that file
> > may be suitable, but perhaps a brief comment is warranted?
> 
> Yes this is only valid because we use brew in that case.
> I will add a comment.

Oh, so you end up building using the GNU toolchain provided by
homebrew and not the LLVM one?  Sorry, I was assuming that you did use
the native LLVM toolchain when possible.

Thanks, Roger.

