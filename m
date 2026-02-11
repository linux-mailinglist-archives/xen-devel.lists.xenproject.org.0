Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h3tOJ0pejGllmAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F21123939
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227224.1533593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kX-0003oW-2t; Wed, 11 Feb 2026 10:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227224.1533593; Wed, 11 Feb 2026 10:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kW-0003ks-VG; Wed, 11 Feb 2026 10:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1227224;
 Wed, 11 Feb 2026 10:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kV-0003Ph-1W
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:11 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f3d044-0737-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 11:47:10 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:47:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:47:07 +0000
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
X-Inumbo-ID: 03f3d044-0737-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7EnF9Oh2j9x4MuXQbBgRVLDz7MOIy1NFQn3hG/eDiarEEKzY4d4pThr3e747VkCGqtak5ev4jfQBvReWIB+Jl2eN0Fnbw81XxIXFPePsgaSssaP7oYprbFZ0F/emYNkA38JO8LLTpDatikmlgC7GC3F/xCedBln+hDJUjSFlBvDHQGMAISlYvt9L/ab+D920jNDQQDe+TPBJZz65PJxmvXcpcOpnYI9SBcZEN3Oxo0yA9b2vFMCR7A7OW92aykeC2cqHsHxFWB6R6tVtZCe/7tJil+TpMJaf2V+R4LmPcUQ/3M9i32qnJnVYdKpfkgVDX8SVGrtl5GpYETsGFqWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T8oymG73Snbnqn9O5cozXBum7bvjprNXvXR6x+JXf0=;
 b=q/4nozda7mArKdr7jujsb63ee3VblxZqXlw3BHqTDLJtYZrM8rBfeYtDC/LBIcuMfdwbJ9JPj7oPNd8+Ynt1YF7AmDxTeIPZPL4JwSHsEK0++MvibKedS8puW/DYGqlo4UQaNsHn4VX4wrK4W4j6tYHfW+kHFXSC8H8DXZ0S5qWDAvwjThCbtBPQRoT70ECYw5kfJ9NzBVVrvYLESH6Qicp4VEFMuQrNYk518sih336G2DMZ0HjiiazxPVmn2G7jT+njhxeKF+FoWr7cY1iDbDSyLfctf75Odhr6L0naA2uAJrXhKJRwQNTaRVrXb0SOvUdnddQVRhSZATEVdzReIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T8oymG73Snbnqn9O5cozXBum7bvjprNXvXR6x+JXf0=;
 b=njXDGfIzh9vPkEu/JXMi12WajodikqjaT3GeQkjxOgv2FfmhOTD6sSlRmvsz+ScaOqBcw81jphUW5+q1SlI+bXzMIREhPMCBQhUg6eYdSUZS75aHIaEzC1dO0eRXn3ziUnHy07XwJdcT4+jnjh1vtjptfeXWzfoOQuJOxkYrf9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] cirrus-ci: add x86 XTF self-tests for macOS build
Date: Wed, 11 Feb 2026 11:46:38 +0100
Message-ID: <20260211104638.7938-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211104638.7938-1-roger.pau@citrix.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2264df8b-560a-4ab8-fb7b-08de695ae6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2RkZ0tGZWV2RnJ1ZE1CVkV4dUgvYnR5MGZVS1ZuMDlJcjMvR2xHa2pRVjJJ?=
 =?utf-8?B?Rko5MlBFbkwxdmxmbmRRUkg0Vy9pdFN5dzVpTHdOWjBYT3RncnpMemJFSVQ5?=
 =?utf-8?B?NURsK1V3YTRqM2Y3MllyNFNacStKNW1raTZrRE5ncGFUaS81elJBVmI2MWVX?=
 =?utf-8?B?UHpGS09RZnBPWXdROThyOGduWm50bFFldllla085d0I3akRkZy9FTnQxQnF3?=
 =?utf-8?B?WUNLZzlNRjJ2UTUzVGxSQ1kzWGFsY1J5S2ZPM2JQaGtCRzBzQU12ekIwZ1hs?=
 =?utf-8?B?anBCUDVCOHZhamtzZVF2NXRKd0xXMXpSVVBUUjNhd2M4NUwzQkVQU1VRQ01B?=
 =?utf-8?B?czJYMlZEUW5uc3RHRFNLMmxtWloxQXoyV3NLM1Z0QlgzeXRIZTRrd29LcmVV?=
 =?utf-8?B?N1BSOVpoSU5PN3p0NEFHMDE2aWN6ZEpHQ0pkN0hramNmV2RQRWkwNEY5ZVpD?=
 =?utf-8?B?bjU5NWVQZkltQlk2QjVxUWNKUTVPWUpHOEIwblRvc2FjaUFrbnMrU2NJMDlS?=
 =?utf-8?B?d3B3ckJ1U0o2TUQwVjRPeHhYcGxvSC9mWDNHNVMwdkx6aFU1VnJJWWV6TDhV?=
 =?utf-8?B?VHBLdzRLb0lMQUtQOUZvS0xmZG5YdEZUWFExS3NlVE5DYUpRbDVkMG5KMHpK?=
 =?utf-8?B?ZVdnRXFWZnloL1BXRVRTemRhTjVRdzVGcklkNEplQThQRHF3MXlocXV6QXU3?=
 =?utf-8?B?aEhOL3Y1VUdYTWlDcTZRMTNuNldsZWlzSkRUT1k5SVNnSGZLT3M0MHRLbnNT?=
 =?utf-8?B?T1JkSlRzVzFpcWNqMGVZS2V5ektnUS9rend3a0ZQWVpPajh4MnBBcWhDcHY5?=
 =?utf-8?B?NEhxdzFheWd3WnlZc1pqVkF0S0RqMHlxQmhVSkx3Nnl5NUFOQ3VtV2psaVF0?=
 =?utf-8?B?Y1ZhSi9zTGZPWHNnSGFjaW4yWkdPaWVESUJMY0Q4STZGMlNuTGRrMWRpS1hB?=
 =?utf-8?B?S0paMWRmcmkyMlFTUElCTnJ4OUN6ZkFRbnhkcWNkWXdaRjNIRURXd0VhWEVr?=
 =?utf-8?B?d0g4R2hSUE1DeEFiOFI5amhEUEJOcnVFcXFsaW51cFlMU1JYZUdjUXFaSGdY?=
 =?utf-8?B?WjIvZDdQeXU2VWNkdXk4ZEU1Q2FMUlB1RTZYUUtYd2FpODNYSHgyanBvODlp?=
 =?utf-8?B?K1E2ZkIya1BqazI0TlVRS2JyelZVWW40L2xtQjVnUGhwNFNhUjBtaVhmUHZw?=
 =?utf-8?B?MUNkR3gzdndrdXgxM3pXckxvSGVOemJ6TjVYUHpaV3FrdjNNbUtQN0ZFNldK?=
 =?utf-8?B?WW91b1FUNElOTnd0WDZveW0vYzVwWFM2ZE9GZncvWXdzL0Z5QlNMR3BzWDk5?=
 =?utf-8?B?Sm5CbTdmTzYyS3Jmam50TkhNVmlwVXNML2ZGR0dmUU03L2RNMzVCNktiVUxR?=
 =?utf-8?B?aGhzb1VVMWlxOXR4c1VRYktjQ2x0N3BEbnRNOXY5NmJDUStrWkswN2VmZENU?=
 =?utf-8?B?b3ZrbXBLOVpHRTg5dzVWYnVXdzZSZmVMeEZ1RGN3YnhaZ0wzQWp4aHdkb3RL?=
 =?utf-8?B?dEExekF6MTRRaXlpeFRRTkZoLzhmdmFhS0djTWZ6YkZoaENBREhZUStWL1d3?=
 =?utf-8?B?MHZ4N041dDRLU3NtTC9DL2p3Umw1ZGxRZTgxaDBDVjdYTHJkanVaNGx2WnZa?=
 =?utf-8?B?WEVVYzdxdjZjNDZMTDY0c3NMTXRCTVU1aGFZVHdvUW9uUEpHY1E0Snk5ejJZ?=
 =?utf-8?B?ZUs2eG1reDJUVzBhcjR0K0JOZ0hQM09lTmhSTmhyVmIzdjlRemhNVWhLMDkx?=
 =?utf-8?B?dGptQjJXeGFXZG94Yll3U3lxMndycHdEMzlLaU1WeHFrZzhnd05yb2c5UXVY?=
 =?utf-8?B?L0ZDVjFCbURSTzFITXpvSWpmNWdLTnhvcHZsNVBjYkpvd2dtNDFmM2wyL2N2?=
 =?utf-8?B?eG96YjE4ak9lM0VZNlJJY0NKMVlMUUptOWhnTmVySC9mTlMvNlp4N09wTnVw?=
 =?utf-8?B?akEzWDJ1Q3V5SUJod1UwTDFCa0pFbjhZUnNzSGZ3T0tBbHhiUGFYSzN3Q1Z6?=
 =?utf-8?B?ajJvQ2Uxbm5DdG9wTTQ0THg5N3ByaTE2cWlIQ2R1MnVlOENTNkdBVWNvRzQ3?=
 =?utf-8?Q?X6yR5X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmlrcVJTUWVSVHo0VSszcnJSZkFZbVhTaVViNzZVYWxNbE9zVUYyUnhLZVN2?=
 =?utf-8?B?a3hjQ2gweFlPdkxjMlNLa0hwNFRXNnM0dEsrVVoyK0N1MDY4N1lFYlRVKzI0?=
 =?utf-8?B?Yk1seWlnT3NSYnRtQ29XclhnaCtzNm5sNDRGSHlxSENZTmhVY1hDTS9OdDJC?=
 =?utf-8?B?ci9oU012MThXN2s5emx1dVRFNmUrY1BvOGsvZ2IvUUViaU1TanRNeldoTXdC?=
 =?utf-8?B?L3BLNkxTTjNnaVBDNURrdWpkbVRNUDZvU0U3V1ByMEhlSGo2aXpuN2FhZFBO?=
 =?utf-8?B?eUhaOUV2bmhlWFZ6NTkvSi9DLzlLTDJyUkNSd0hHZXE1VU50TG9VRzc2K1pj?=
 =?utf-8?B?TFZjQ2NCSG9jcFVrVmkxcTVoM1VLSlBvZk9FUTZaM3FLVGUycDFCTU51M3Nr?=
 =?utf-8?B?Y0VNSHBkTCtPcE9IcUIvRnpjTVIwSDVhOTUxLzlZV2lCdGhrSXlGelNZZkFC?=
 =?utf-8?B?aUh6Z09GZzVxRmZHUmpDYUpCVGxRVU80dWNjMUZpTUlPczFBSUxNQ2s0T0VE?=
 =?utf-8?B?VjQycHJuOTFldERrTFB5TXFDdzJKQkF3MEpkd1JidTBTdUJrR3NMTjlTVU1U?=
 =?utf-8?B?QVZURkNjd0dSMnI0WldLNHN0ZHBwKyt3NHlKK0p4RGdvSGlrTENyTjVWdlhG?=
 =?utf-8?B?cENVeW1SV0piZDFRVEVFVXJ6b0VvKzY3d1hBa2pWeHp1ckdIT0YvTjNVV3hR?=
 =?utf-8?B?WXZHOGdKbTFscjJJeWl4N1k4L01adEZFNjA0cXRGMWorMWxSN2VBMXhjbVdO?=
 =?utf-8?B?YnZEYmsySUlselBTZC9hSXJFVGhPdFNYTXZVc1RzUmFHQllFNzRUWkpCUk94?=
 =?utf-8?B?bmN3WVdCMnNzTFN0ajhpL2RucGZ4d2ViSmtIWGYvREhwcnFzOWhGMTRxNUcw?=
 =?utf-8?B?elk3QTA0TkQ1ZCs0dy9OL0ZIeW5CSE5pRklHMmFDL3cxWFoxSFJIUzhIZXEw?=
 =?utf-8?B?bDFmakNzK1ZWcmNHRWRwT0FGdzR2NUxOdEhHcjBPT3lHRXIzejFFWUFVQ2pT?=
 =?utf-8?B?d2xiRVNZZlVCUUsrV1dsc2MwTUFhVXhHRlhBS1RUbGNNLy96RGZOdUJaYzBZ?=
 =?utf-8?B?YjBVOU14eVlLOEdpeks5ZEttSmdGK1ZWR1hlQWVvK2YxU1ZBWTIrMzNtbk56?=
 =?utf-8?B?TElzeis1ODlUUlZpMzFZZDhaRzdlTktXaWJHNzRqckdSTHhpYmVCSjZrZmtM?=
 =?utf-8?B?YlpIa3czMkNUWm1Od0hMbExaOTZVQjd6VXU2eWxrMDJhTzFNVEhhc0MrVTRE?=
 =?utf-8?B?UXBFRmpQU3FWZHRud2J5RlhLNmxmWUV0WHViaGxNeGVxZUl0S2Z4STZKWGhh?=
 =?utf-8?B?eWRpRkdYZEJ4YVZjS25xcWhDKzd0bzhMSXI1NFdsaGNCYkpkb3IyZTIyazA2?=
 =?utf-8?B?WWF5dTRBTFYvSnRIZmVCQXpoQ01SMWtQV0phbjJUalZ4a0RLRW1UMllkRmtN?=
 =?utf-8?B?QmtnS3VUdExsb0xOK2ZhSlBoYUk3VGJQSDNZMHBYb1kycGhnM25yMzZDN3NI?=
 =?utf-8?B?eFZoY0xuQmt6L3NTWjhpTmVCdEg4Wlpzbndza05sQ1B1TitabC8zdGFjMFhD?=
 =?utf-8?B?NmZOZjZ5STg5QUdHZDlLREE2WUdmVE4vRlhUczRKWlFuR0hFYm9JRXFaV1Bk?=
 =?utf-8?B?TXNubFVMTHdhaDlqUE9lTjJBbnV1ZUxVM2R3bDBxd1EvQVFWUDZBd2NZWjFm?=
 =?utf-8?B?UFJhTXU5RkFFaG44L0sxRWNCU25TbElWTzFHd3Y3ZXdHU1R5STFXODd1Snc4?=
 =?utf-8?B?NHZncEhvUnFFOTY0U1BzNHludjBaNVBnZmduYStGR0tPQ2M0ZDJ4enhoeFlO?=
 =?utf-8?B?WnRBbk5wUEFWbEdyYnNWU1E2L0ZMK0RoSkxwMDlIK3hJQ3crWmpEWHY0c0oz?=
 =?utf-8?B?UkpKamZabXVWZzF2aGhNeU9YT0VUQllDdDVSQnJnQWN2a1NjaE5LNmlJTGJv?=
 =?utf-8?B?L1lwbWkyRTBYQUl6ZHJFOEMyMnlBVld5R21JNVd0WUx6ZFJRNXd1SVZ2ODJ0?=
 =?utf-8?B?QnJKVHQ3Q3paWDh5VzAreEpRZGtXUUJWSS9naTAraWJZSlY2Wk9KUTFuMEJO?=
 =?utf-8?B?YmJ6dCtjZ0pkOEVMd3dRM3BaTndkNTJVQnR5QXMvWmxzOHFvS0JKcFU2cC9s?=
 =?utf-8?B?dW0xbzFuTEFRdmFWeWozZWZtUnJrMUxHOG5nSEF1L2JIQzRTNXEvNWtwbTFj?=
 =?utf-8?B?Zm81aTRPbDB5dmtsVkxGL21RSjhqSldqS0xUTlpNdG9tUGxoRWV1a3BaS0Qv?=
 =?utf-8?B?UTgvbmJ1SjkxK1RmcHRtVjdWaVR6eU5WTmxTaHBST1REeWFGUVlvUEh0R0Nh?=
 =?utf-8?B?b3JhU2dVaFBKQ2lDRGhic3BLTUdUSUxoVldyUHFLR056Z2JtcThodz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2264df8b-560a-4ab8-fb7b-08de695ae6d8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:47:07.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzDSlz6+/tOmVwgvV9DLiUMKWIU/t9Fq6LCoJFNMoetkoiQHN69yO21wLEA/LGaOtJNjJkulOB40937Gaz1crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cirrus-ci.com:url,xen.zip:url,xtf.zip:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 11F21123939
X-Rspamd-Action: no action

Like we do for the FreeBSD builds, introduce some basic smoke testing of
the built binary using the XTF selftest image.

Note this is only done for the x86 build, there's no ARM support in XTF
yet.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index b9608e71cca7..839c25149c9e 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -161,18 +161,19 @@ task:
 ## Test Jobs
 
 task:
-  name: 'FreeBSD: XTF selftest'
+  name: 'XTF selftest'
 
   << : *FREEBSD_ENV_PRODUCTION
 
   env:
     matrix:
-      FREEBSD_BUILD: $FREEBSD_LEGACY
-      FREEBSD_BUILD: $FREEBSD_PRODUCTION
-      FREEBSD_BUILD: $FREEBSD_CURRENT
+      BUILD: freebsd_full_$FREEBSD_LEGACY
+      BUILD: freebsd_full_$FREEBSD_PRODUCTION
+      BUILD: freebsd_full_$FREEBSD_CURRENT
+      BUILD: macos-x86_64
 
   depends_on:
-    - freebsd_full_$FREEBSD_BUILD
+    - $BUILD
     - xtf
 
   install_script: pkg install -y qemu-nox11 expect
@@ -187,7 +188,7 @@ task:
 
   fetch_script:
     - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
-    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip
+    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/$BUILD/xen.zip
     - unzip xtf.zip
     - unzip xen.zip
 
-- 
2.51.0


