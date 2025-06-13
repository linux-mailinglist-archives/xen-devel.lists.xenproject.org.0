Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6CAD8344
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 08:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013804.1392027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPy0w-0001vL-7r; Fri, 13 Jun 2025 06:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013804.1392027; Fri, 13 Jun 2025 06:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPy0w-0001sL-4f; Fri, 13 Jun 2025 06:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1013804;
 Fri, 13 Jun 2025 06:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8fEO=Y4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uPy0u-0001d7-OF
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 06:35:44 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [2a01:111:f403:240a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a03bad90-4820-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 08:35:43 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.33; Fri, 13 Jun
 2025 06:35:38 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 06:35:38 +0000
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
X-Inumbo-ID: a03bad90-4820-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUGq2G/yCv0hTDgYdQrR7yABVxaIT9mBOa2/5RrfmGQ5zDf+fxR3ChfO3BxCJwW9MGIBew/VN7fJa4Xnf6Gn97b5HxaShaCxV2GLW0kkbAnBp4fB7pDN9WYWPzBPA1mD7ABR0Ao1TXug9f1dC5S5cEF/lx5ZiHImOMPMY88HtpNLNd20XMtsETiYbq2k9p14bNvF59sg3S9Rg9KYWSizndWbg6Kta0XEd0QSkt76brBYVCxOMfZa3qGVkKYwYZk8sXI09R5lc8V6TPCWBvYwjhCthakG1HBgb+mgTsVbm1JT4o/6F8j4BCxeTX7tj3pGj+VO752DcgDBu91zsX0uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=453UZOf8DqXnlgtoH0CxSf+qNMouKVvUB4Lpp6Kfhs8=;
 b=M3OqMLoYJRc/SY6VtEFAGr0Qei16+t70Keiv1toiYNSrtNlCQXxtIM4QMmTY22jH9AUdLKun6ZxcjJXFDRKA/iRE8qDUDllNJjMQhDO4pbM5D6Uen0mg80+sSUxgo6b4HMQH76detgY02mhEcC94QJfVBsIg1vE7O7eBKrRTyK3dkSjp38HWLx5RjRIu7dh4iOBTf8QEmSyGxIVB2GotfNxx+8b8vZH68X7nWp3YP/YGulSgSLs+Mx7I/7FzqimB4eWDHcymAH16Rv69wH2LkpL2OrBR0zO+k7dMYIFNkFGUn1TVfVaf7w8TH7caaBS2pLQIQxyiUqDbFw3s0IMkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=453UZOf8DqXnlgtoH0CxSf+qNMouKVvUB4Lpp6Kfhs8=;
 b=4Xh342H9+Q0dOBw6iXo33nDY50vJR84ahzVLTPtVu8YgiN8kunJyFd68zStr0t8GgfW4VZylOlFOZO9OafxE+FcYM/e3wd8LfSIa7Ar2Oh056j/2cdEK3c0uaLGQef60r8R9f6oIrfu7lMGnmg1ngxDCGoiEvLh9/JZIpM2DmmE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 17/20] xen/sysctl: make CONFIG_COVERAGE depend on
 CONFIG_SYSCTL
Thread-Topic: [PATCH v4 17/20] xen/sysctl: make CONFIG_COVERAGE depend on
 CONFIG_SYSCTL
Thread-Index: AQHbz7F7SunEZNF6NkqENGvwpWoLO7P8fREAgAQ9xqA=
Date: Fri, 13 Jun 2025 06:35:38 +0000
Message-ID:
 <DM4PR12MB8451DD4080FB1750976D8494E177A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-18-Penny.Zheng@amd.com>
 <9db2daa0-8905-4b21-8161-27b7fb96dfef@suse.com>
In-Reply-To: <9db2daa0-8905-4b21-8161-27b7fb96dfef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-13T06:35:32.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH8PR12MB7256:EE_
x-ms-office365-filtering-correlation-id: ca094e67-bb09-4e81-62f8-08ddaa4482eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cG1WeUpJQmpqTlpNRTAvNmtpcDdoU2xoZU9RRytvd3RUbWtrekl4VEJBVzJR?=
 =?utf-8?B?ZUYwMHY5eUlhMDRQQjZKSERXVTdXVVdIdTBrbEVrKzlzVTNGaEJhWWkzY2ZT?=
 =?utf-8?B?a3U0bngzdGpNZnhZSkpIbkJCZm5BSUVYL0ZFQ3pyQ0g3R3IyUmdOMWJ5VzAr?=
 =?utf-8?B?eTY4WnhwRWVmSDlmNkRCVGxRenNId2JJaXZTaTlvaXR3Z0J4N2hzeTR0YnJj?=
 =?utf-8?B?MDJBUlBvd1ZleGtHc2xKaE14amZpeC91UEQvd0x6Y2FGK3V2bzhBWXcyOWhC?=
 =?utf-8?B?KzFNWkl1SW13d21EL1J3dVhXMC81Ymk2cEJlVjhIc1hpR01VVVRKd3lhMXBZ?=
 =?utf-8?B?QTZJMVRiWFpLTyswTGtjZ3BIS1VtbWhJSmhReGJMMTVrZkhDaGVlK25uSFhw?=
 =?utf-8?B?ODVBRmVvTlNKTHR1aFF2OWJVUHZoN21qR0FXVnd2Q0tlbHgzTExpZUxMU0p3?=
 =?utf-8?B?SEJ0aEVVL2UvM0RpSWhDUDZxR2F0NVh4ck1YMUp2Zkl1b2VkQm9Da2g3Wkt4?=
 =?utf-8?B?RHBLSjJ5dHI5OG9RTEJrVEZVKzNodzhPVXdQa2IyT1hmS3RFTEFzcitUaTNR?=
 =?utf-8?B?VmpaejRZWWxqSFhSVWF1eU0yZytMaWlhMkpwSjlUWE9DRjdIUWlmLzNCNFll?=
 =?utf-8?B?K2ptSVRFZ0RObndBU25ZbXd5WEYrbEhWeWl6dTgzcVQ1MmZOZWlaNXpYWDQ4?=
 =?utf-8?B?dXJxTHJKajJ6TEdhbGppVjZzaHRLWUp0dFdmWXhmb0t5RGZ1VVJNOHpTeDVq?=
 =?utf-8?B?cExJczlKbEdqOTdDbTc4NnNha3dhWE1UY1RyMHE5aGFlT1JaTWVReUN0M2lk?=
 =?utf-8?B?NFJtS2dvY0xBeUx6QU9BR2NVelNWN2tYb1QwVFE4aFgzcEQzUHFPc2dKeVB2?=
 =?utf-8?B?N01pUUlxUnRUYWQ1eG1BYk1RQnlESTNVK292bGlLUVBONXhkWFVTODVpKzFn?=
 =?utf-8?B?UjZhM0l5TzM3Y3JaejhmcUsyTWFJdXNSUjl1MGpGQ1FIQk4zTHdYVmZJQUVi?=
 =?utf-8?B?dk9XSVJNRWR1WldaNHRJZlpEWnNQWlhMQ2dPS1NSZFdzOEtTTkZsTXJKUEM4?=
 =?utf-8?B?UjI2WitoM0d5bUpMOVpUOThCcHZ2OTBiUGV6cUxRRGVHYjd6VURMYWExQjNC?=
 =?utf-8?B?NmFmMkJFWW44MGxCRXNJcGZ6OE85aWpiZzVxb3NYVHNlODdaVXFWdG12YXUx?=
 =?utf-8?B?YjV6Q0E5TWlBcFB6dzNWRkNlY2JudzdqYmFwV1p1Qzl5b0VqaC9DNStlN1gr?=
 =?utf-8?B?NTBVdjJOZ2N3UlVvcWwxdUMrVEtVNjFTY3BhWnhOQ2VEMnBpZmFiZUhrN2ww?=
 =?utf-8?B?ZGVraEZQVXFvRDgxeXNwc3BIVkd6M2VWb2ovcUlLWlN3ZE1nUHVWNWJ1WFVK?=
 =?utf-8?B?UFQ3YkI3WS9iYmM0YUJUTkhTVDRKMVJYVSs2YWM4UmM5bkxENzBmZUFkTkpx?=
 =?utf-8?B?bUF0ZE5sbEI1Snp3emdBanpLaERwWExKZHNGNzk0TmxjNXBjdml0aTBTbHc5?=
 =?utf-8?B?cTRBeWNFSEVBNnNmVDNZYlpETUFxaHFsd0VJaXhWNWdFbG43clBLbWJWakVP?=
 =?utf-8?B?WFZ1TVg2OE10aFdsc0gyMGVqcUcrYm1YZmxjazhGREFsUTNpcVNFRjVFQlh0?=
 =?utf-8?B?M2h0ZG1XMUJ5WE5WN1VQdjI2bDZ1aFVCZkNYQnJvZDF2T2UzMlMxeUkvNzhi?=
 =?utf-8?B?K3UwQlAycHErR3d3dXg3QW5zVGV6M251YVpzS3I0Zi9NaUt6NEhXN0Q4Uy8v?=
 =?utf-8?B?Z0p2U2RWSWU4c2wyUWdLNHhnZWhQcEVzR1VIdXZIOE92NStqOTkxTld6T1hJ?=
 =?utf-8?B?VlJXdXQ2SjNGb2FBSUVUcnlWd0N1bUNnVEVCM0QrNjRrSEFOdjFJSndzdDl3?=
 =?utf-8?B?cXFyYjZXUVRxeTJCMjVVdlA5NnhoT0NzWGFRTUF3Zng4L3hRZFFVMFJTSjVQ?=
 =?utf-8?B?VTR6czBadGVWMERDR2M3NEZlN01WZUVSQkVFL0w3ZGJyMUJxdHBCTnJXK3Br?=
 =?utf-8?B?dVg2RTE4ZUtBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dU5IQVcvWkNRQkN4ZUZZUjdNanBoWnJXWU95MDNUdDFsbVowQ2t0Wm42Tm5W?=
 =?utf-8?B?VlhKUkdWR0JEWG01ZG91aGxBWE9iakRvZW44Z20xNExpRC9hZHNDVjFudUVp?=
 =?utf-8?B?d1VhRTlqVjVYVEZQZGVoY3Nrb2VWLzZiMlpRWWJCTVhLbHBFb3ZUU0Q4MlJB?=
 =?utf-8?B?YVluQlpYU1pYakVlUWFLVDNDS0RvQ0xyM0JpYnpuQzNWYUI0a2s0ZUEwY1dO?=
 =?utf-8?B?dFRMSGhoaGt6QnQ4QVBoMGdLbHFlcklFTzBjb2lBMDNjUEc1SlJPd21WZVFP?=
 =?utf-8?B?MkNIL1RldmRKQWVlMml5S2JxWWRFbGVCTmY4b0NEdnl4U24wZGFuNitOM2Zh?=
 =?utf-8?B?R2ladWhqTS8rL1ZqdGJEeWVIVXJraXZPbWhkN0Z4azZOR2FCSkpMY0daaXNN?=
 =?utf-8?B?ekVBWE5mT01jLzdrdHIrTGo4NmRvQm9GdUFvMnlXdHFxcVVDckRJNnFzcEll?=
 =?utf-8?B?N1FBQkdtNjNveVhBelNZblFtS0c5WWJySkQxaHZQN1JsajUwZ3ZWeXowc2Yz?=
 =?utf-8?B?TGpsVzU1dzBVMmpMekFTYWVTYkVURm05VnFxcnJZZFlKVDdyeWZEUFFOZ3VC?=
 =?utf-8?B?NU56dnM1eTkyZ2t0eHRXVW95WmxFcnUrM2lMRmRJN1ErbU9jbzY3WGMxSm9R?=
 =?utf-8?B?bndUSUp0cXkvSEx5aU5zM1JFV2pxd3cxWTJhNTRmQzNaSUt1a3JRN0ZjU1dq?=
 =?utf-8?B?b2E3Y3RUV1AvOWdVc0EvRGtWVyt1dFBUWGRTejlSMEpSTVpxZ0lPeVQ3Nmd6?=
 =?utf-8?B?SlIxN0hOSE1wQUhIc1d2S0hINjhoaDhHRXgzQXpPUTExdVN4RWJBZ2FBaHMz?=
 =?utf-8?B?ME9lQXJoVS9OVVlqK2tDbnZKQXE0cVFwazRFREl1dlIzbThtdEp1clNtZHFL?=
 =?utf-8?B?dEFJNjJPdTVxMzA5cFJVdlpWZ1BjSldUTDNQMXowUDJDQ0VKdjE3T2VHaW91?=
 =?utf-8?B?OTNUQU12Rm5adE5NaEtCWldWc2dCSTVoNzd2dElmVGFqMXFhNXpvMzNPSzhN?=
 =?utf-8?B?UlFGNVI4bk5TOXh5SmZQdTE0cmVTSVZ2QVJacFJpUlNFeVpVUFdWSndVYzZ2?=
 =?utf-8?B?NDRML0grVEhhYWUwM2NQWFlFTGQ3TS9jR1NmeVMzTzl5YmxVcmtLeWp0b1M1?=
 =?utf-8?B?YUg5ZWhkcFFpeUdOUHhCTzVmZTRaWWVDLzc5OTJvbjJuV0dQOXVtTytVWTdU?=
 =?utf-8?B?aTF2YjFnQjErWmVuR2I3NGRtWG5uWDJkOEtHM0FGSzd5WjJwa2NQQmphMVFZ?=
 =?utf-8?B?UVRBMXRURDRlcDF5NkJySEJjVmdFY1gzZFdLRWZOT3hIUDU1RmE1ekZVY3M4?=
 =?utf-8?B?dWxhL3IxcGJJQVgxRFdmMmQxRHZ6eUFJdTRmcFQ5UnJWa0lOdDBwZ3FJL3lx?=
 =?utf-8?B?NU5Bb3dSZXI2bkJpdjE0dGRSYkRCdnRQM1RJTThwZi9BSTVDb1gybTlXaEN0?=
 =?utf-8?B?KzFjTVYyalRnWkxIVHlmNXpRcjhSRmhPckxObzIvY3NBWVRhNVFkNUs3UThE?=
 =?utf-8?B?MDJNOHNhSXZSdU9JSHFuYmI1ZnBQR1FQamNRc0E0OVlhc1cyRFlxa1AyTEVD?=
 =?utf-8?B?ZzdrMXdBZXFJNksyMmhzNTZmMGdoSHB2bDU2WTVmcUR4bEUxTDE1elJ6OE9y?=
 =?utf-8?B?TzRYK1JFM00vUVJ4VkRyc2Ztb0VPaDNOTnBXcUtybkM1ZndhL0piYWZhMitC?=
 =?utf-8?B?YXBYM0RBNHNrWGhWVFVhbDdoZWJ4NlJUaTVUVXJscnprU0x4Z2wrWUt2MFZq?=
 =?utf-8?B?MVZFOXoyb0NyYnhtUG85ckdoeWdzVEVtU0JaL1NXdGlTN1VCMlJEMGU0aVkx?=
 =?utf-8?B?L3VHSXZyWWt1VVNxRzBpTVZOOTQxcXJiR0Iwc2tKTFR6YXZSWkg2VFovUmNo?=
 =?utf-8?B?TUgzN28rMjdsOVVyc2d5THljRFA4SUw5QmNDYTRVSXgzWUNtMUpmekxaU3ZP?=
 =?utf-8?B?Qkdmclo3Y3BSNHRGQ0NneVowVVd6YjZaUnZWSTh3YUowb1MwaVJvaDJMTFY0?=
 =?utf-8?B?Q3lMTUZEckhFck80d1VBMnJra2dWZjBIYXA5K3AxNjlYY3hXTDVzLytyTG12?=
 =?utf-8?B?WHBybXZxWFhjUzlPNUtRaU1nT0ZWWjFCMnlzMkRhZFpWa21JOU43b0NQSXVN?=
 =?utf-8?Q?65c8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca094e67-bb09-4e81-62f8-08ddaa4482eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 06:35:38.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOmTEM4X+XReX8kYXZc4m11fPj5dJCSHaFCvkK+y7RW68w5CFLEBGpkCbcVKPD2LWZkxJ+/oFIC0uePu7ee8ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTAs
IDIwMjUgOTo0OCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QHZhdGVzLnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAxNy8yMF0geGVuL3N5c2N0bDogbWFrZSBDT05GSUdfQ09WRVJBR0UgZGVwZW5kDQo+
IG9uIENPTkZJR19TWVNDVEwNCj4NCj4gT24gMjguMDUuMjAyNSAxMToxNywgUGVubnkgWmhlbmcg
d3JvdGU6DQo+ID4gQWxsIGNvdmVyYWdlLXJlbGF0ZWQgb3Agc2hhbGwgYmUgd3JhcHBlZCBhcm91
bmQgd2l0aCBDT05GSUdfU1lTQ1RMLCBzbw0KPiA+IHdlIHNoYWxsIG1ha2UgQ09ORklHX0NPVkVS
QUdFIGRlcGVuZCBvbiBDT05GSUdfU1lTQ1RMLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVu
bnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2
MjoNCj4gPiAtIGNvbW1pdCBtZXNzYWdlIHJlZmFjdG9yDQo+ID4gLS0tDQo+ID4gdjMgLT4gdjQ6
DQo+ID4gLSBjb21taXQgbWVzc2FnZSByZWZhY3Rvcg0KPg0KPiBEZXNwaXRlIHRoZXNlIGVmZm9y
dHMgdGhlIGRlc2NyaXB0aW9uIHN0aWxsIGZhaWxzIHRvIHNheSBfd2h5XyB0aGUgc3VwcG9zZWQg
d3JhcHBpbmcNCj4gaXMgbmVlZGVkLiBBbmQgInN1cHBvc2VkIiBiZWNhdXNlIEkgY2FuJ3QgcmVh
bGx5IHNlZSBhbnkgd3JhcHBpbmcuIEFsbCB5b3UgZG8gaXMNCj4gYWRkIGEgZGVwZW5kZW5jeS4N
Cj4NCg0KV2lsbCBjaGFuZ2UgaXQgdG8NCiINClVzZXJzIHJlbHkgb24gU1lTQ1RMX2NvdmVyYWdl
X29wIGh5cGVyY2FsbCB0byBpbnRlcmFjdCB3aXRoIHRoZSBjb3ZlcmFnZSBkYXRhLA0KdGhhdCBp
cywgYWNjb3JkaW5nIG9wZXJhdGlvbnMgc2hhbGwgYmUgd3JhcHBlZCBhcm91bmQgd2l0aCBDT05G
SUdfU1lTQ1RMLg0KUmlnaHQgbm93LCBpdCBpcyBjb21waWxlZCB1bmRlciBDT05GSUdfQ09WRVJB
R0UsIHNvIHdlIHNoYWxsIG1ha2UNCkNPTkZJR19DT1ZFUkFHRSBkZXBlbmQgb24gQ09ORklHX1NZ
U0NUTA0KIg0KDQo+IEFuZCBidHcgLi4uDQo+DQo+ID4gLS0tIGEveGVuL0tjb25maWcuZGVidWcN
Cj4gPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zw0KPiA+IEBAIC0zNyw3ICszNyw3IEBAIGNvbmZp
ZyBTRUxGX1RFU1RTDQo+ID4NCj4gPiAgY29uZmlnIENPVkVSQUdFDQo+ID4gICAgIGJvb2wgIkNv
ZGUgY292ZXJhZ2Ugc3VwcG9ydCINCj4gPiAtICAgZGVwZW5kcyBvbiAhTElWRVBBVENIDQo+ID4g
KyAgIGRlcGVuZHMgb24gIUxJVkVQQVRDSCAmJiBTWVNDVEwNCj4NCj4gLi4uICJkZXBlbmRzIG9u
IFNZU0NUTCAmJiAhTElWRVBBVENIIiB3b3VsZCBmZWVsIG1vcmUgbmF0dXJhbGx5IHRvIG1lLg0K
DQpVbmRlcnN0b29kDQoNCj4NCj4gSmFuDQo=

