Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23125BBF0F6
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138358.1474096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZZ-0003LK-Gl; Mon, 06 Oct 2025 19:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138358.1474096; Mon, 06 Oct 2025 19:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZZ-0003Ig-E7; Mon, 06 Oct 2025 19:08:37 +0000
Received: by outflank-mailman (input) for mailman id 1138358;
 Mon, 06 Oct 2025 19:08:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v5qZX-0002pt-RK
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:08:35 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dad82864-a2e7-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 21:08:34 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ2PR03MB7070.namprd03.prod.outlook.com (2603:10b6:a03:4fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:08:25 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:08:25 +0000
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
X-Inumbo-ID: dad82864-a2e7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4aaGix1zCd14Es06TwT7RoV3XKJap9UKK1vqW79qYA3Wbq3WSkw5kdF0wYDNjMJdsIUdjuDUcsrElstWNVIYXpXrvgAVL0uVFLQh3ybfyP8BKB3aBknRBOIpOUAoop8aphikZ6tQm3dye+us7AQ+Jr0MtpvuT7xfBAgvRL9Oe4xNaT4JL241ribGL+GjP9Rg8QSRIsK6QNQPRvUvkcELBx/U6JS4Xu/tQAVfhZwXuFpP3N5RSuU0PwMHJ5sq7ogabBz9pfqPU5kGqPgkfn0d+mp2oMLAhO5yPQwtIWXKi43WgENHMEMy5kbh08Pv/EaKLhqcaWsr8vvqXHc7aYLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQlhLvI05eusQyov7t6MTC9/969C3skpTIWEwSomhGo=;
 b=OekP+tHPIgpPl0BjjdlwGUKpLnuHGsOPkvSVo1fFPMBbtpDJevLM1W4DsiuDSSn4pdwkkEUTQsrtjhKMikr/ffjU9sFeneyk/F7Yd6RBTHt0HkmO4YoVOPTCFbFfrSvf1HHjsX/NE+f3++BODtbJNaQHnidNoEaHDZy3yzD9PVyddUlstQpBd2bkg+awvbvpZ0UG/YjBSpb0qvVXZ0nn+HMhLRsIxoQvj5fNlrroIcy8nmkgSuTA3J9GAYiQHG1w7YM7UdsA5oN8youlC7d3+m1pEnxD8dP61D/vEM7GvhppoNZ+b7gQAohpMAIK+a4LAaXT/YmYvLYjfJ778WwUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQlhLvI05eusQyov7t6MTC9/969C3skpTIWEwSomhGo=;
 b=wgJBVGXq18gmhya4VONKn5Wogi/ZS5lsYrmjKmh2pIxV9ysOEDI7Dgs2Oju5OC70baepKfRGYOijCe/rgLvYy6Gn/PUy5o2rcfAcKDtskVZaVkMir8aMa0FEM03SnsR5awIrsoDZFl+SvV+oVTIbj8aHmThPa1Oz1ZC8cdJjohM=
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
Subject: [PATCH for-4.21 2/2] cirrus-ci: fix bashism in the test_script code
Date: Mon,  6 Oct 2025 21:07:57 +0200
Message-ID: <20251006190757.72757-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006190757.72757-1-roger.pau@citrix.com>
References: <20251006190757.72757-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:408:d4::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ2PR03MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b92de9-ca2e-4e6e-385b-08de050bb996
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUlXQnRUc1FJSDljOVo4Vi9zWGQ3dzFKV0EreVpvS0pOQWUya3VHaWEydVV0?=
 =?utf-8?B?aEdsZXFPZTk2YlF2YmtwdTB1NXVDdFkwcU5PdlVOMEhYZjFDUHJ3V2hyYUhw?=
 =?utf-8?B?bG1DejE0bXRFSE8yRlFBRG9CWjdjbnpkS1ZYZVZCZFoxU0ZvMVh5djBDZmdM?=
 =?utf-8?B?aXNwaXgwQ3c0cGduWFdCa3dJWlc3am11eC9oblIrVUVlUzVzM0Q0MUtDSFA3?=
 =?utf-8?B?NUlkY1c3aWhKNEVFZTFwVUk3UlpYdWFsL1NkNVFad2IrOHBxVDZKODdXeVF0?=
 =?utf-8?B?bXNJZHBHckhrQm5SN0FXTm0vcHM1N3FDQjhINkZQM2VWbENvZTEvUGNMdXo0?=
 =?utf-8?B?UUNJQkNUcDg5VUlaMGVmK1FrMzBKb1dxNlZsQ0RmeWllM3NKelJXbnVHMEZx?=
 =?utf-8?B?MndwYms5ODkyajFIdUVzOXh5c3pwWHdVOHp1NVdOQk9zR3dpbHVrbjIvVmJL?=
 =?utf-8?B?K2ltbXZUZjlkZjc3MzA4TEFySWtIQk5LK25maXNyZ2Y3ajJYeXc4S1Z3dnVH?=
 =?utf-8?B?dDAwZnd5bFV5NXFpV2hGWHNMZXNkT01MbE9iK0U3dlBOWFdlSnprbmpYVXVv?=
 =?utf-8?B?cmhBRDliZzVUdzFDWnQyWFhmd09KMjQ3aldJZWtod2JqbEdGT0phSTRRdTY1?=
 =?utf-8?B?UjNTNjNLdmZVVWNhcG5MN3oxYlZ6Q1JBNkVjYmZjZFBTTDE4N3ZvUys1RVhM?=
 =?utf-8?B?RTgwZWVjQ3pmMXFGNHdLdkNTNTJJM2FxeERvNEZCWVJmeTg4dEV5REsxZGl4?=
 =?utf-8?B?VUg3Y3ZtR1BNc2YwQU10Zmhocyt3MHFlTDNINHNpcVVGUVJJeFBhQ2d6cFdB?=
 =?utf-8?B?cENzTEdFeHk3WUZlT1YvcU1SeGRtYXZQcS9HZXVRb2l5SmROZFFBSnVMcVRx?=
 =?utf-8?B?ZkJJMkl6MnZmOVdja2tHM1g4TFg2N1RGRmova3hxblUzeko1aGMvOTJuZjc4?=
 =?utf-8?B?ZHdSWWlzL2xHWjZ2eVJNRlMyMnQxUkc1ZGhtT2laZ1VyemNDeEppZUhnaHE2?=
 =?utf-8?B?SDduaFF5dm9YMkVBMzN5S2ttQmRGUGFyMEFqWmJPMDB1RWNsVzdWWVpmL21V?=
 =?utf-8?B?TDFha1Q4ektueTltREhYQjk3TXJlWjZGSjl5SEJsMmV2c3ZnNXJvZ0VVY0R0?=
 =?utf-8?B?MDBEd05ROGptWmVzN09xSmZKNVV1cmhUaFpBeUNCSVRQU2xUcExJV284MjVa?=
 =?utf-8?B?S201NE5aV25KanlpRWtOK2hEZWczSlZQamJHengvdVFmTmUrYUZxd1RKQUpE?=
 =?utf-8?B?SWc2eFJ6ZmRQVFNYam1ta2ltekpvS2oyK1JOQ2Y3SDJUOG9QL2dCblNVeURL?=
 =?utf-8?B?aSsvNUVSdHFMckN3NUVVdnRyQTFNOVduSFVCeGljaXlwVWJyNDFWQmdUaHBM?=
 =?utf-8?B?ZEM3NE9FTVVaaXVkai9wWHFTQ1BPK0NOSFUxaWF6dk1mdXNtL21VNFV1SCtQ?=
 =?utf-8?B?WkhOR3JLTDBtbmZ2SlFOQnNIZDdlNXVMa1RNdHc4U2NibnMzeEFKd1pVUGlD?=
 =?utf-8?B?bmZjbTRrRldvNmMvMklqQ1hlS2RVWEkwclF4ckMrWDkzZnpaSUFpOVZIZEEr?=
 =?utf-8?B?Z2FrRGNyNjdYNlI5WEtJL1MyZWNnOW9YK05SdDY5eTF6Z0hNL2JrNDVpeUJk?=
 =?utf-8?B?dVl5dlJBdE5ZNmxZbGVKbmN3TkVZRmZNd245Z21mNHRoZVFETTVWTEQ2SFpj?=
 =?utf-8?B?WUhUNTRMNlkxd1VaWldvK01HdW9NQ0dVbGZ6M0NyOS9DSGxZQVpsYTRESlhI?=
 =?utf-8?B?R3dudWlhVm1PS2JBcUNiWGJ4Rk53RXlmSDNYWFdHV1BQMTRrNENGUHpQV2FE?=
 =?utf-8?B?UEV1NlhkUTF4U1Naay9RWllVWGFXbklpV0U4OEFTYnhuelc0cVFNMVdISmNP?=
 =?utf-8?B?ODdyb293YlVmN0NDVmRNUEhIZktyNHpZS2dRRTlWRFdKSUpaY2hVY3g2M1pN?=
 =?utf-8?Q?MAleLg4NDui5cz02KzZXyl176WgMRn56?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZYS2QxenhxakpQOU1GemdXTDBsaDQzTkR6UVBTVmNQUkxndS9nTGx1K2Nx?=
 =?utf-8?B?MzFrc3RXUE9SQStFUDNXMGw3VDYzalJOQVNKNDMyRjY0TUlkaGpPR0VPT2pu?=
 =?utf-8?B?dnZqMEMvOVExdkVUd2J5ZmhJYVFWc01wMEFVVzhrKzVLaUQxa042cWZoNlZ4?=
 =?utf-8?B?c1MrR1RNMUE1dDBZbkxCamlIeGpoWUpPcVg3dkhpSkM2eDZ4VHVMZ2VTL3Vq?=
 =?utf-8?B?TEJSUWFKTUppWTlFWTFZTG42ODBuc0tjNFpQSWdMdGJISXdreFFpQkI1d1c3?=
 =?utf-8?B?Q2RERW5KZzNEbkVIZXROL0NwRHplNVl2U0Y2cUZoKzh0RjNGYWltUnN4WGFQ?=
 =?utf-8?B?TUx5SFVTRGtubE5idTJ5OXRUS1dpOHh4UWFzaHhzdnNGUVpJRWZHMzdEZFQ5?=
 =?utf-8?B?dnhvMnZTdCtnWTZycmExTTUzV2ZITnZHRFp4ekl4TitSVTMyeVNXTDNqb0pp?=
 =?utf-8?B?dVdoczdWM0xIaDF5ckVhUDVlS0wvejQwRDNocExyamN6L1EzQTR6Y2xicEF6?=
 =?utf-8?B?aGtycEo5dVFudU9VTXg5UXpKTE1TcnlEZXhtZEp5VW1XY2MyZ0t2bzlISGNO?=
 =?utf-8?B?Y282SmIxQW1oaFM2UXZUVm5qT0pmakJ3S1RxU0IzUi91VkhUWmNNRU5hOUsz?=
 =?utf-8?B?V0hpdk0yQXYwSUtFQzhYcmdOYUNHN1d5bEVRRkFDRFFWbzNEMVphM25vL1RV?=
 =?utf-8?B?VktyUFZHbVhpZXByVTViWjlKdXROaDRCamhRTGJsWjY3NjBiS09nK1lacXdX?=
 =?utf-8?B?UStTd0NNQ1pINU1hNHlvU01URENtQlpGRkhxT1JuczI4TnBtZ2YwTjRCdjFX?=
 =?utf-8?B?MGhxTDZQNEZ3WDhhWEZiME81Y0hpUjZYQ1BkRllDa2hNakNWcUhoa1lHYzFG?=
 =?utf-8?B?VWxoOWVjQXNTSnZyMDIxSUNobGtTMkxPd1lDS3lVSVVabHZvek1ZVWRRVTNY?=
 =?utf-8?B?S01RYlJ0b2NEUHV3a2U2a0xtWG5CdVdWeE9GR0dqVVp6azdmWFlyQldBeDMx?=
 =?utf-8?B?V0Y2YnlyUjZ6NGFmODJOdUVtanNmb2pNMGd0d2Q4eE8weVBid3JGdjk3ajcw?=
 =?utf-8?B?bGNmNE9XemlBZytVYUZGRzNzcGJmd3Fla0ZJWkJhTkRhTlkrOUMrTW13OVFn?=
 =?utf-8?B?UEhPVDdpeDlySHBlYkgwYnh1WFJ4RVVVMnFZanR5K1VJV0NVbW5SN01pMDFr?=
 =?utf-8?B?aldmN01QcE5wQld2c2kwaXV4V3JjbXZmMHN4aWpBcVg4dkg2SFpJSTVyR2JE?=
 =?utf-8?B?QVJZSVcxc3h0ZllKRERXTHVzMTVKUWZ1L1JEZ29oZVpPZTRYK3FWNUNZTy96?=
 =?utf-8?B?TFNzTi9sWWZHWWNiUm10OTBQa0tNYnc0cE10NDZNallMeWNDSDVIU2xIclND?=
 =?utf-8?B?RlE2dEJGUHhnQ3Nxdko5bCtOTWVEWFNKNkF3OXBjQWd6VkY4NVhNRlJPOVpo?=
 =?utf-8?B?N1lyanVtQTdqa0RnSkk0YTVmWHVTZTFKUVdoa0NQSGVlQmlWbklQdldRNGdl?=
 =?utf-8?B?eUlGNFVSbU5kclJ0d3IzVnlVdm1uNHcwNUEwaU8xbHdBOWdWQVBSOUY1aXBV?=
 =?utf-8?B?UlJIaWpybTB0c2Myd1JJZGJZOVE3MzJaODBsWjh6NnpFbmNyS1Y2QW12dHNy?=
 =?utf-8?B?RHF5K3pueHVXKzN4N1ZoVk0rQ0plWWtNQnFDeHg4VTQyMWlUYm1qbHkyTHNK?=
 =?utf-8?B?L2M5MGxnSHQ5ZW4xS0FWNHU3b2lSNjI1RFdUaTJvRVhnQkVKNkR5ZUExeEJl?=
 =?utf-8?B?RlNvN29IZ0QvSk90SVNXS1Yyd1pVYk9jMEJLVFBJSnptemQrdElyVU1ueFpY?=
 =?utf-8?B?SlE3TWd4enFjbVl4Y25qM0FsRVhaa0plV3pIeTBlZCtXckNOcGpucmsvZzhm?=
 =?utf-8?B?U21tWTgreFZIbEhiODBTRFo1RVJOeGJITll4bzZxVlY4ak5sTjdkcmNwMG5C?=
 =?utf-8?B?UGoxVXh5QXFPdHNuZUREWTdaMStHelE1ODZNMTFTcmt0eHdaL1F2WVRkWXBQ?=
 =?utf-8?B?RE45clVrSFRDVmZEcWpaMk1jWWthbWJXR1Nkc2hsbjRrbEZPWHVVRStSSG1v?=
 =?utf-8?B?a0hXcUJEMEd0RVJ6cjZ1ZC9XOExKSllOSGlSMTlFR0p5dWFWUHhhYWVxR0Nh?=
 =?utf-8?Q?eWOtx+ily3CWvqo85PuBTje6U?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b92de9-ca2e-4e6e-385b-08de050bb996
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:08:25.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfBG0qYRvg/j1l/Iff6tIN1DQYoRpG7AS+eCJr6P/q0zQfPMbzf4AlXuHTh08MXpY27mRi9xmzUoIjyeykKnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7070

The default shell in FreeBSD is plain sh, which doesn't support the usage
of the '|&' operator:

./automation/scripts/console.exp |& sed 's/\r\+$//'
/tmp/scripts34c427adc6599db29cb91221a0939d85.sh: 16: Syntax error: "&" unexpected

Fix this by using a redirection of stderr into stdout, and then a pipe.

Fixes: a406195c15dd ("automation: call expect script with redirected standard error")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 55dc9b39092a..2fa1deeeafc1 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -169,7 +169,7 @@ task:
     export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
     export PASSED="Test result: SUCCESS"
     export TEST_TIMEOUT=120
-    ./automation/scripts/console.exp |& sed 's/\r\+$//'
+    ./automation/scripts/console.exp 2>&1 | sed 's/\r\+$//'
 
   always:
     serial_artifacts:
-- 
2.51.0


