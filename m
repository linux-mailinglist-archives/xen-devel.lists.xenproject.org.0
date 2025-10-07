Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B43BC0720
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138517.1474196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hT-0003yl-Bv; Tue, 07 Oct 2025 07:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138517.1474196; Tue, 07 Oct 2025 07:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hT-0003xB-90; Tue, 07 Oct 2025 07:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1138517;
 Tue, 07 Oct 2025 07:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61hR-0003wm-QS
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:01:29 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7299e6c3-a34b-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 09:01:29 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB8224.namprd03.prod.outlook.com (2603:10b6:8:28c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:01:26 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:01:26 +0000
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
X-Inumbo-ID: 7299e6c3-a34b-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llYacBjHwPDPvm1EfKlzShAJCNaRW8GYribK2HeBfSiAKAar8XiOKiAdi8pQ8jCESNLGnEflt4uGOPr2UNInc6RakIo/kJvX3etCYquZb4TNakO9IiC2Xr7zeWr1p3Yomu+ozb2Oak9IcN8f97sjhiWLSlTykXPgEW+i6kb9Y9lct6q/VPF3Eo62z8sda+Db4XUWjzbWqzm10f8ZQ9VeIk6UM3u5TH1SKSJgfMRTwVX3lWvoJkwu3BVJlEwJkNy2nheMeIDxCU+UW9cijg6SYTcR9x71RcS8lXh6G8HcxNXaCssxoyvtxSo5+VtfqMvkMtR5KimevRjwey5V1/sW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VPOS52+/hQoS1plax3j1DB4curtD8jBJtoEMUqqbNM=;
 b=eocizlyLdRTXcDiLUqxVQVQK9z3Vw9z2IHGzgvNChkZH47W1jc3v0xEdwJUFKnpfmc3+hQICXmYUJ5HzuUIlJPOCWNL3jxARZgRVUdndBHWxxLvSW2UbdigeK5PTzhmpShWHkEhyMJEplOkFK20c9T+amQk1TQTXJqXo0sD0CrfQXH4QuCDxiczPMneIa7gAQqCvHcfv98xZhw6pSyVwn/ONT18eTKYFqGYXXw4r1/IkjdZxdJvUR6ws4lPCZgY7hCwo2ME2dpvDuPGNVAhKwtewBPAs6dWnGBhRaxyrL6pMwmbqK1gHeJqCGmKBK97P/brR17R2jZGv12gKakC93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VPOS52+/hQoS1plax3j1DB4curtD8jBJtoEMUqqbNM=;
 b=adr8qqDCBZzwmX2fIl+u40b1+t/Mdru28h2ldAzXlxwmyJfRy2PnMkZRrgvFHcP7BIkSwFZsU41C7ayWrslwCFJlg0/Pwy3CGZEYBrA258zSN9pxhwIE4N5pzPvRkpToEY5JvvQMhzepjwPH0oB+C6ZkKH/LiFFDTOzAwcSL1c4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 v2 0/3] cirrus-ci: get testing working again
Date: Tue,  7 Oct 2025 09:00:53 +0200
Message-ID: <20251007070056.83423-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::33) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: fa02c504-3cea-4a7e-b642-08de056f5530
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWpWeDVaR3ZRYUxqRWsrRWxaeDN0MFFyQlJoTUJyaktmVmRGdGxIUnFzVkxm?=
 =?utf-8?B?dkxIdnkrQ0h3c3ZKWHdyRWs2L2F2dGpsa25XRXpqWmR0eGlqUk45K21VN2cw?=
 =?utf-8?B?VjkybE1nd2d6QUtBNWt2RGV1cFY3ejFJQ0dHS1JiS1JkSFcvTTAycSszQjBr?=
 =?utf-8?B?ZkNsa256aEhPNEpFcnJLYjdYd2Z0NXBnc2hBQnNyZVY3QU5aWktYcngxcnhC?=
 =?utf-8?B?K0N5RXpMZGZ3WGJwWWxoTTZ4Mi9KWThsY0c1UExjWitFSVFKY1BsK3hSUlFL?=
 =?utf-8?B?MDV1TTBWNzFOSWRYSkFpQ1hnOEhvM05ldUFEWlhFcDJVWEdlZE5taTh3Ulcw?=
 =?utf-8?B?VG1OdVJOYnE1ZENFUEhUbVl0R1doNTk0RlYzL0FoTmxTVldRTEVsMk1KUHZ1?=
 =?utf-8?B?L2RqS2YwSExJclNKbisycnlhdmtQVXFhQUt5SHZmaTI3TkVtalBPREdLaUVM?=
 =?utf-8?B?NnBUelM2cEYyY2w1MytTVVF4M0tnVWQrbEdxclA3L1VQRmJERml2cVBHNThj?=
 =?utf-8?B?YTdQYWo3VzhNcDB0Z21UR3dnQVkwZzY4Q2EyL0RHazEvN3d5aGJCNXQ5R2o3?=
 =?utf-8?B?aVo2TlRBcFUwaXlqaGw1b1BLT1U5U1VtUDJwR2hKR21sMTBwT0R4Z3VBZXVw?=
 =?utf-8?B?TlBucVMyWWpvSEVzMDd3Q0JsK1d1UVYzTjY5Y25mSEhzOXc4RExkUnh5WWV6?=
 =?utf-8?B?eG5RdW9ZWjRZVS9PUjZwRUpmd2FqcXh3UzBpS1FoN01BN2VrSm5HYWFIZHY0?=
 =?utf-8?B?STdtRlR0Q2JldXNYbkRoK2dOcmFyVVR6Z1hIK2JsdzlGZFdCNDh6Y0RJQzFp?=
 =?utf-8?B?RlgyL2l0RnFwaWFyamxBT1o2Ym9NbUdsWXF1VWgxaVdjdDd3cWFiQzUrZWZw?=
 =?utf-8?B?M05WV2FMZlpJRXdnc1BIcE95L1pVVlRjZXhZUlVRYVpXTlRuTDczSDAwdVlR?=
 =?utf-8?B?S2FURDNtTW9JaTZacjFDbWoxS1V2VGRndWlPQ0gyVEN0NU1BN0luS2pDb3Ji?=
 =?utf-8?B?WWJEdUFFYjAxbmNhYXZjTlQyUWJkYVN2RmVZdE9EUmxlU0hSWnZFSlIyVCtK?=
 =?utf-8?B?V0l3UVRXY0p6cUoyS0c2K3IxU0dmUWJsUlZKUXZEUU1OQTR5ZmFCZzVnOVJK?=
 =?utf-8?B?dEQwMTdEUXppR3RSOW50NERnWUg3bjlwWUpIR0YzNStRRFRXZWVpQjN5bEFx?=
 =?utf-8?B?TDFvUkJhOU5UeTlTMzNDK2xzNFhsOGNMNUJKR2ZibTV0VFZBR29JZkFQeGdi?=
 =?utf-8?B?K0hMb1dUazVMamkyTVdESjlXU0h2OUVKNVlXQmk1U1FjVFJxTHg1ZzBQRE1u?=
 =?utf-8?B?bUxiRDNvcjFnYmIrNkRsanVnVnBpelZCTnNpZlZDUzhWMGFlTE5TbnNQNVI0?=
 =?utf-8?B?S0poQ29WQ2ZnbjJscVJicmFCTWI0UVlUcWVtbk1RTlpjaEJsd29BUFk5L2hI?=
 =?utf-8?B?WTA2THN3NHVyR1kvMjJmL29aZW9CRFlaWkNLY0ZaVlQwYXdBbkRvdG1LbS80?=
 =?utf-8?B?RENmK0U2Z2pScEE5R3FESU1qaWFCb0J1cVdLNEVCS3BxSWJhNEtpamJlNFNC?=
 =?utf-8?B?YzFHYkhybisybUZLT0hvZEJ5eWh1cS83T2lhMUkwQXN5SStEN245R1g1MVJT?=
 =?utf-8?B?VnNod25QeDljQTFNQlhKTWt2QTJtcElKN2M3SFFHUGVtQVE3SHIxc0NoaTA5?=
 =?utf-8?B?TjUyNlpXU0tUSHdmaXpMem51T0kwZVZJb25DaWVKenlQTmkydUc0TDlDUWVG?=
 =?utf-8?B?cTNJOHNYdHYrdEJvZ0dNMmNLdHh1NXhISUZQOTlENHI5ZUp3MzFad0xaOTZF?=
 =?utf-8?B?ZHg1SFpWMWpaL3Rwb1VqKy9LeXc1czhYaTQxeTJmMFlja0NaU1Mrd1VoM0pz?=
 =?utf-8?B?Wmw3ODRNSXZSVXFmWmM4UUp1OTdnZzl0cGNlTGc3RnBpSWRvNmVMTXpVWGpI?=
 =?utf-8?Q?3Nl6ukzyppZWMtfnqR8+rCwqI6YlLHLr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xLVDV3U01IeXBwNGQ0S2Q4SlJ6M3J6MEpMZm9TQXgyZ0J3bExWT1pXRE1K?=
 =?utf-8?B?cFpnL0JmLy9JdHQwMXBNQjVrZlVRZzVjZmhyNXdtVWlvVkpKK1p0NUxNcm9m?=
 =?utf-8?B?T1RZeGUwM25XZC9kWGVEenRaaUNHZWQ0MWVNZ0R5Z25pQmNWQy9GcUtYK3J2?=
 =?utf-8?B?OHl0ai9WNmpRbW55akIzbVpLdis3eU9hTWxBMmdrZDVPeEQ0bStDQ0RLVWlK?=
 =?utf-8?B?SWJ4KytLeHZDWDhkRmxycStSMDY2UnFqWnVFNG1hczdTR05NSXN6VUpBdVVr?=
 =?utf-8?B?TDhUSyt2ZC96KzZ4L3hicW9GbCtCZzNZbWxDYnNJR2RyQlQ5Y25zZzBET1Qr?=
 =?utf-8?B?SU55WFh5V08wRFVOSlEzcEJxU3J6a1VTa29lQVdWM3ZYVWVnTDZtUS9kbzVy?=
 =?utf-8?B?Rkg5WlV6OVYrNUMwbWRHakFsN1V1dUZGRFdwMWFvRTcvZXB5dWNvYVZmeVRU?=
 =?utf-8?B?STcvM3NQZ0lOdEwxRTlkN3ljeGlJZ3hoMDBNWWpKTnpTRzltMDZEQ0w1SzlY?=
 =?utf-8?B?c015ZVFwR3IyUHVZZDFXaVF3aStkQVQ0N29KMjMzQ0pwYVRLcFd2TWRxbGQw?=
 =?utf-8?B?aVMwcjcwVlZhNDhsYVJRWXJncThlN0VoNlFGL3kyOVlBak9XU0d0eEs0cTZ3?=
 =?utf-8?B?K05PNzRRSTlSYzBicmpaNXZvUzcycWxEQnFpWk5XNHg1bDdPQUZnbDFWK2pZ?=
 =?utf-8?B?cGEzZU9qZWVJemFIQ1hhcFRmMmZSRnU2VVdUcGhxTW1CZ3NyN2xHSm5SejFK?=
 =?utf-8?B?RUdrWWZKSmwwdTZzUXFZbnZINTd3SndWRUVMSDB4Z1IranhaQWU4LzlmRUJn?=
 =?utf-8?B?Q29xdW10K013WDdOUDdqZDdyVXRtVnc5TE5uTENhL2lDR1dnYVJOMXJTT2x5?=
 =?utf-8?B?UEgrSWVHTXRMWDZsYm9Ccnh2YjFlSHB3Vy9CbW1GQ01aRWpQRGw2S3pUTWVt?=
 =?utf-8?B?bXJjeWN5MTE3MXJISjZaVkh6aDRxT3k3QzdacXRVMlpUblFabU9YSWU5ZEdL?=
 =?utf-8?B?dHVEZXVBeUJZdEdtc2lUUEhGRzhnQlVEVzl1cG82bU9abXJDMzJsWWUwMExV?=
 =?utf-8?B?Y2VpVkRUdURVMEpPZEpydkt2aExUSGJrc21aMWRna2ZhOEhKRW0zWkN0b0pI?=
 =?utf-8?B?Nmx6dncwbU4vTlFaWE5VQ0ZxNklYZjhMOFJtWFh5MlNFeTRWOFRFcm4vbW8x?=
 =?utf-8?B?TzI0STZQLzZqd2ppU3FmVXUycG5kNGxvSnlVQ2FIRUtHYlV1YUozU0JMMllQ?=
 =?utf-8?B?NkZGaW9WOWxrRzlQVkMrd084L0txaVQ3TDFCRXFvRmNJR2hHaDVUZ0c2alAz?=
 =?utf-8?B?ZDVSdVRuVG5JOWNrZzVrQnFCSE9BQmRxaVBxdmVoem9ZWTlGMGYwMU1hSXJS?=
 =?utf-8?B?cHpsaHpyZk83a0JRVlhZK0paZGxpdFdpK3kzRXZkNGZUOGVLNEtscUVoU050?=
 =?utf-8?B?a1BFb0FZdGI0TjV2SFdOUE10S0h4ZG5mUzVLT3FSQVExNW82ajNlWFRlU3Qw?=
 =?utf-8?B?Tm5ZdU43OG5CMlVjZjRybnlKcksvVFlScVZUbVR3bXc3UXRPMjV6R2tRMWJh?=
 =?utf-8?B?ZkE4RXNJS1FhTGc0QkRwS04vL3MzZnlQS0Q5Y0tlbmFSRWtHQU9vMnExUGk2?=
 =?utf-8?B?dDloZWE4L0RKOFJ3c25SN1g4c0t3ZEV1ZzF1a09JeUxKdGdDWXdvRmpJNzVV?=
 =?utf-8?B?TmVKc3NKOUc4NXRWaWszak5iQk13OWJhZXpSUGxBakF3RFh4TlVoMjZ2d3h3?=
 =?utf-8?B?QThqK3p6MzVWbDZGK1E5c3k3d0NYR2VlNXcxMmxSUExpNU1CUkZoMlJKQklt?=
 =?utf-8?B?VU1VdTFkV3dKVGZ2RUhzc2NQT0hVUU1sejBwVFdYNjBZMlhBVFA1QkVzQ3Y2?=
 =?utf-8?B?czNLV25zaloxM3pSNGlzUmYzKzJxZDdVWHZnTmpzUkU1VHA4K1hzSmx5cjR4?=
 =?utf-8?B?ekt3eldEdGUwRTRCQTVKdkM5Nkh3MVFBQ3p4MDM3RU9Pc0RjQ1QvZlgyTS81?=
 =?utf-8?B?YU9pV1dQOVRlQVErcFdWaDI0cHpLSVI2VVNrUlphMXNMM0Q5YlQxc1ZaUnRz?=
 =?utf-8?B?VVVST0Q4NXI5dXBWV3ZVSlJsYmlGUmczN1B6bkdUaE1wZGpXMzhtWmtHcFBa?=
 =?utf-8?Q?X7gaLxKxl0vZyHHHylAmkllBE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa02c504-3cea-4a7e-b642-08de056f5530
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:01:26.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mk2ZBMguKeqoQRANxDYzhMRIMWMmyf3u1UywibUD6HSZGlLER5jjmFtHFDgXsYGcsxzoQ46mQzXIVoOEuToAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8224

Hello,

The following series fixes Cirrus-CI testing so it's fully working
again.  I request a release-ack to get those committed (once reviewed).
The risk is very low, since they only modify Cirrus-CI code, so
Gitlab-CI is not changed at all.

Roger Pau Monne (3):
  cirrus-ci: install libinotify for FreeBSD
  cirrus-ci: fix bashism in the test_script code
  cirrus-ci: bump FreeBSD version

 .cirrus.yml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.51.0


