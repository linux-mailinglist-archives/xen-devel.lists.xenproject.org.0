Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMGlHD27gGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:57:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B11CDB6B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218674.1527519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvLs-0000Wq-Lc; Mon, 02 Feb 2026 14:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218674.1527519; Mon, 02 Feb 2026 14:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvLs-0000Tj-IK; Mon, 02 Feb 2026 14:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1218674;
 Mon, 02 Feb 2026 14:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmvLq-0000Td-Mo
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:56:30 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 593b85ac-0047-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 15:56:27 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7800.namprd03.prod.outlook.com (2603:10b6:8:21e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:56:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:56:22 +0000
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
X-Inumbo-ID: 593b85ac-0047-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cV3oaWzdFx92uZ+OzmiVbZdTYQPl/Ps67fnXGh9/utzPV6t6/M1DbRx7eOb2tmUg+AahEo0CXIr5AabLDSYGw1PjT0eSh1aQK0dUxpAvYISgjfKhTHgdJMaPjFdon7ICKfnLciP0bVgTIGAmgWYp/zMgSIFfrlwPdpmzj+3BoVHhKCcx4BAQ525nadOgkL6EjJjzUtRdnR8sbwvl3+FVHCOyakcomhxPsaOV+kihA9hz/9mILf711BompE8KXZmV38elmSEqpv+1I2K+Smpc+R3eE496Pwp03B0nTIFS6inaEdVB6Vd9VWmpj8uhMskJewrQor2TMsznBo1d+N0mfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nz6C5tG4To8W5aMpVWMeIxuUDN6TfPfKJnLwWtdg1Cg=;
 b=tvE82B+2Fy3vE6ncEx//4uLcaK40WelSJ447VJzflGvensRkRHiincpuZMhZ4K3B4OePrISFaiZLzmUuzwkwWIw2SIuXXiRo/PksfJHqxFUpEtcVf8uhsbEuYCYXGuB0s8cfEOQycWSF9in3P2axj78FCRdw95xPkRUeiItQ+eVHg6mNNT9RlQN1ZUdYvnDTZU3gSYUIoMoWZsafQEwrOZbWWHK6EUuvkgwwnYclG5DZog+IDj4bfcyzx2cMkGZASc5AJtDSC4KzDWMrXlxGyhnM0Ib9q92C6TSRGf3AZnRXNbrt2/Uh6gE+TlTkdsTOGjpiH9pjaXlswWuDVbSGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nz6C5tG4To8W5aMpVWMeIxuUDN6TfPfKJnLwWtdg1Cg=;
 b=rLmb3OjOyn8xx5XdXI2/VDuLXk6FfhVh7fzsqQw6PE8A/F01cZ/bRh0ecOBEcMXgQ/BQv2YH7Qad7Ufjii1ScjSNTrHMTfwqy9GoSW6O/FOo9Fc7bq/sIRyw2lNpwDeisQ/uvortFq3yHBARByqaXndJ286j5/1ocoL74ilIv/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 15:56:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] PCI/regs: minimal adjustments for Misra rule 7.2
Message-ID: <aYC7E0947_Np1bL6@Mac.lan>
References: <f9b84a18-c968-4dfc-8e5b-6c97e7d3a04e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9b84a18-c968-4dfc-8e5b-6c97e7d3a04e@suse.com>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 427a8227-e873-4ce1-b679-08de626b3ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWIvblVzdzJpZTRtdHh4K3krRFgvdDZYa01wNk95ZHNoTm14V2lwN1pUckl0?=
 =?utf-8?B?d0NKbW1raVp2em1HdGF5MzVJekdnNnFHWmJvdGhXZWhRc1N6cWFLbnhtaVVj?=
 =?utf-8?B?ZHhnL1lEQlhud3hGMUx2Y2RUK3Z4VHE2V1lQSXFPWHhvMEJORm5iZVVXSDM3?=
 =?utf-8?B?NU1DWnlTTGp1VzVsMGZMZmMxTkh0SXBiakM3ZHVrSkZldktvd0oxR3B3SnBD?=
 =?utf-8?B?VWkvbTU3NHpSS3d1cUptNGtKMDltMDRLQzJrcGorZ0M4cXNqeDExMFNyMExZ?=
 =?utf-8?B?d2NQbWFBUlJLR3Nka3kzeFBxUzRMMEJ5bGxxUzhOcUpLaW9MUVZMTEFIa1BS?=
 =?utf-8?B?WTVwVFRNMjcxRTUrRkp0QWRzQ0ZLS2d5aWY5Mlk3L3ZGNiszSlV4UDhEbnlL?=
 =?utf-8?B?ZGZYRXQrTE8zaEtCUUlKRC9aZkhFRlgxdlNNU25YL3NxYk1pMFlyT0hwZHA1?=
 =?utf-8?B?WnhHbk5RaHBmWVB0N3pFN2dTcFVMbi9zMWZzUlkyeVA4dkdTVkdSeDd2V3ZE?=
 =?utf-8?B?VUJ4dUxzWkh0WE1GWnJza2MwbElnMmtDYzdTbkVJRFlWbjlDY1NoalR4Zlcr?=
 =?utf-8?B?eTFPMitqbjMxWHlxVWJYdEU5Q0xIdnUycmpzcDRwZU10eDJ1U3FIbnUySlJs?=
 =?utf-8?B?aXYrMHRaWmlJMXExdHpwK3pLdGV5QzlVa29RVENnaFpnL3BncmowUVgyTlBz?=
 =?utf-8?B?TE5rRnR2QW1pY1h4YlRXcTI2b25CWjZLcEhhT0NMWU00QTNtOUFadlB2ZkNv?=
 =?utf-8?B?VzUwRkVrWjVlK1poWHBTMlgvWjFpZTlPYkNINTZ2MjN2TU5BeUJkRzFaRDha?=
 =?utf-8?B?b3h0T1d5dXg4KzlaV0l3VjVKSkp5Zk9TNFdtNUxZSzM5a2JuT2ZYR0xuZm4x?=
 =?utf-8?B?aHVNS2lVNkJrdUg5dlFORDB5Q2ttWjlHLy9Qd1V2S20rREFCN21BZ2YrVWhK?=
 =?utf-8?B?VWtuUXFEbjFHYVlJMGdZTkJKZS9EZVdLZ2ZneXNWWHFidEFCSkZyWU1yNXFV?=
 =?utf-8?B?WGJjNGRhQ3ptTmVMYXBzd25ZOTFPdHlCNHRGYWw4aXlVWEVscnBsQ1V3aXdR?=
 =?utf-8?B?dVl4blQzclAvRVEzeEVZY0pQYmxuRUlKSHZSV1FvMFF2VzlEdStQcVNsd2pn?=
 =?utf-8?B?L2FaQmNrdEhhdythU01qeWw0ZlhjY05LU0pvUUVZbkhNazh1cy9WdkJzbDQw?=
 =?utf-8?B?bmtNL2R0Q3RjcDZvRmpHcU01M2RyYllpM1NDUmo4Q3R6L284RXJGTlVXWXFP?=
 =?utf-8?B?cm5pcDB0Q0RuZWdxRlhlRCt6cmYwY1dvRjNqekRFbXhDRE1tSm5lT0Jlc0Ri?=
 =?utf-8?B?VGx3SEdhZ0RwMmN2Q2I1VzRnbWxSbDZzUytJclRCbng1eGo0MVR6dVlwWlY4?=
 =?utf-8?B?VWVpa21nZ0d3d1FXd0tqY1FOWjBZNjZXTlRCWnRZUHlSUWRzWUgrVC9pQTBW?=
 =?utf-8?B?SFBIWWZkWmkrK3lLeWo4bk1pbk1MQUNWdHBqaUhHRHRkR0NoL1FyeXlWNUEx?=
 =?utf-8?B?aEFhOE5wc1k1RDV0NndtN1Ztbzh1VkVXVkg3VDlnTVR2cWpuVWl1Q1FWVUNh?=
 =?utf-8?B?RlpwVkRZQVFMYnpQUWFSMHZua2xuQ0FmckRaM3Z6VzR4NnJxSHFnWWovYUVN?=
 =?utf-8?B?ZmZrVGJ4M2cwYXBwUHlFNTdTd3NoaU5WcVA1NDFvbnZlY0lUVTVrS2h5UmVG?=
 =?utf-8?B?UHllZlhhc0pWT2VTSnViSkZQZVVtbFdLMFJRTFRPeWtPN1R3OVZ6OENBN295?=
 =?utf-8?B?SmtrcEczMVMwRmVkU0oyZUU5ekJkcVBxVzUvUEQ5MjU4cEg2Wjh5U3VqeGQy?=
 =?utf-8?B?UXlXbW9BUGVRTXZzbHRTemNpUkE1K0JmdGx3NS94SzRGbWJNTjgzd01yR0pM?=
 =?utf-8?B?bVlQTmRPNDRsS0QzVjh1M1Vqa2ZLVW9XaGhOcnV6alhBVXBPRkRneVR0VUoz?=
 =?utf-8?B?Tkk3TERrREluRDZBTWI4UDVzVlBYSjFIVU8vdjR5Q0RnUXEwaDJBVFdianpY?=
 =?utf-8?B?V2NUUXZTakQ3Z2YwYTNwNzFLZHZYY3lSeDVWZElFWGtjRTJJOThTaUlhejRY?=
 =?utf-8?B?Y3hsUDJWQkFCY0UxU1U3aU5MdXNLYmV3NlhsWUMySHhBRUpiRUR4S0J2bGtt?=
 =?utf-8?Q?R9As=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdJL2NUdjFieVJuamFXbVRNY1pWdW9Rczg1R1RVTy96anpEVUNCR2ZQRXFN?=
 =?utf-8?B?T1JzZlM1blJzYUpiamIxeTkwVGlOc0pEbWRTVGdHemFweFlHdHRGcFdKVS9M?=
 =?utf-8?B?UDJZcW5MQ0lYcnRMMm5FMDl5anlwNzZXVGN6WHQ2WUdjRWFaUXVodUNobzVu?=
 =?utf-8?B?QncwT3pyRmI4cUlFTE1PRWJwSzJZb1VaQU9kQXVaek9NTnhySjc3UWMvcTJp?=
 =?utf-8?B?VHBJZzhtWThzaG5VcTRzMXh3NGJ5UTZKK1hsaTRSSUNFejdnOUhpTUl1QzJv?=
 =?utf-8?B?RGd0VTR1NVN0MklTT2RuUFBCVy9uSi9QdWhzOERhaHM2dEF3VjJJdkVHTGVP?=
 =?utf-8?B?Y2pIYUJKUHJLWldaSThqUHcyVytBalNNUVQwTHJzMGhST2FObXJWTE5ZdTBI?=
 =?utf-8?B?ZHIrTnFxLzJQN2Y5UENpMjU0dHRObXZkcVJ1T3lta3hsL3ZxemtpWmc2QXh5?=
 =?utf-8?B?OHhEKzRMK085WG1tWGJHeElBbG90T0NhRXBsZXc0bEVpUE9ZNUZCVjREV1JI?=
 =?utf-8?B?UXAya084NHpnZFR2TDZQWmhPOGRZY3owZzFNdUI3TDhDdHNpa0JyUlRwdmtV?=
 =?utf-8?B?TCtqeEVJU1g5UUQ3Q3puM3dzcUN1ZmNIS0JnM0Z3YWd2bTVIZTZ5MzlhekxJ?=
 =?utf-8?B?L3hJWGhEd1VwSjMrUDVZZXAxTTUxZHZLblRaN1VqRWVuWncvTmZPL01jZnlt?=
 =?utf-8?B?OHFab3J4Z2VnNS9FQ2ZleXhIWDg2akpXSlduRUEyRWdTL3RLaDh6RlZyRkV6?=
 =?utf-8?B?RVFKVzNUUDhGZEVkYitHaFVpUGlIbkRLY2MzVHdjSFNPY2g0V0I1WXlheGVR?=
 =?utf-8?B?WEsrd1B0bUF0R0VWK3ZEdWVjWTlZU1NFS2tCTUcyOVd6K0hDQ0N3NFVKQVdw?=
 =?utf-8?B?Vks2aGNTUzB0RnJSYkRBWkhLOGxLS2FveDV5anhWVzlrY2YxMVFRblhRZUMw?=
 =?utf-8?B?d3VwNVRCV010YitoMXVySldQbzU1NmZwcmVySlYyVjVOSjBQaVE0NWJBV1VY?=
 =?utf-8?B?dFRmUDkzOWpvcC9udzFEM2tDelRNdTVUZnVoaGlPajg5am91ZG9GOUwxTzJJ?=
 =?utf-8?B?Nldzc1pMUlNONjFUZFdyYTBHT0JQd2JhTUZYdG1uTVUvcStwb2d2cCt1UGgz?=
 =?utf-8?B?WUJqNHdIczA0aXJlLy9ublJWT21lZHlFRjYvMWszZ2pjSFByTk5oRXFFQXhz?=
 =?utf-8?B?eFAyNHJsL24rNHV2b21yTDBLQkJtT3FTcDhGV0wrNjI5QUhQOTd4WklmSWNT?=
 =?utf-8?B?VTZpdWR3ajhwOWI1bTIyV2xoUzFDWWFtNmNuT1ZrVTFBNTNZdHpTZTQraERz?=
 =?utf-8?B?N2tXSFdRWHAzYXB2VmtsZXkwOHJwMm41aWx4cVM2NTN4ak9IWFNlbGNKWXVt?=
 =?utf-8?B?amlWMmMwNDJ3WVRWVUFEanVFMi9OQnBPODhIcmE2ZWhSeW5YZXRzL0U4Q3c4?=
 =?utf-8?B?V1QzOHNuV0lDSnRXbTdqMDVXWFMrV24vS3NzNGVualRhN3ZmTkpIdG5xbC9H?=
 =?utf-8?B?Y3lZUldOdDFPOEx5bjFST0M1cHZXTU84dlJJcVpnTDgvTkx5U2xyS2t6ZW5u?=
 =?utf-8?B?Y1ZtZkE1WkdIV3l4bzN6UUNpTGdZVmRQeFc2QkF2ZjJGRGNHYkw1RXlTNFB5?=
 =?utf-8?B?Tm9MM2JCc3pEOFBFNHVVNGVoY2g2TjdyZHdQT1RaNDlqYm1PVzJLakROWXUv?=
 =?utf-8?B?YVRhSlp0L0FCUlhaTDJtNUVtcVE3c3B0UTRFZnFYbmdSUFpkaEdYQVF1Vk1y?=
 =?utf-8?B?OU9ZdWtla1B2cHZML1Vudzd1SGpZbEQxZUM3Y0lYY3VkWnpreCtlL0VyTjVC?=
 =?utf-8?B?c2hmZEwwOUNEVDJTbzBhdk5LYUYxT3pBMXQzRVdITU5QRnhLV3FMdHdWTDlz?=
 =?utf-8?B?SlpTNU1aaVJ4N203QVZFdnR1akN4Um5IQ0k3RE5DWXpEbkgya2V5WjFaRW1V?=
 =?utf-8?B?enVJNk5rZC9NMHFycGgzd09QOGJEYW96ZjUwK0I1MlNMTHMveXhpdXMrWXA3?=
 =?utf-8?B?UEltOHE0bE94QlgwTTgvMEFiekw0QzAxZVFzaWNFb09kNDRTME14cmllWkdz?=
 =?utf-8?B?WCtVcWU1MGFJa3BlaGNmU1ZEWnp5VzdvVmxBT1Q2K2t3dWxYRVFLTHArcm13?=
 =?utf-8?B?SDAvbTRaME41NTJ2OHlZS1hRYkZvN052NUlYeXcxb3pZZC9Va1dRcXZuc2Z6?=
 =?utf-8?B?anZ4NDBvTUZKbUhzZUxyRmlGTGpzMVU3dHRtWTBZV2F3M3hBVHRlUVdQK29C?=
 =?utf-8?B?UU9zWktDM09JQ0U5RWNrREpXU24zZ1kyVzNIb0g1RXBNRDFmS3NRdkNDTnYx?=
 =?utf-8?B?eEgweEpZUUhtMDd6WWVMQnVFUWxzVUhXdjZpajVRWHp3REdkamtCZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427a8227-e873-4ce1-b679-08de626b3ad7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:56:22.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2JLNZec2KzgOsBH8D1d44NrDL+D7PA/0VIhgTzb7LMt3H3px3igTCVE6CzWtn93OgPDoPsM4x3x8AsLSt04Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7800
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8B11CDB6B
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:43:05PM +0100, Jan Beulich wrote:
> As was recently noticed with PCI_X_STATUS_533MHZ, leaving presently unused
> #define-s in non-Misra-compliant shape (7.2 is "A `u' or `U' suffix shall
> be applied to all integer constants that are represented in an unsigned
> type") is putting new code actually using any of the constants at risk of
> then causing Misra scan failures in CI. Adjust those few constants which
> strictly require a suffix.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

