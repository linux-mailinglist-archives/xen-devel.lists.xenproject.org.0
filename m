Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CAEB40C7F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107237.1457740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV9r-0005l7-Rs; Tue, 02 Sep 2025 17:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107237.1457740; Tue, 02 Sep 2025 17:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV9r-0005im-OO; Tue, 02 Sep 2025 17:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1107237;
 Tue, 02 Sep 2025 17:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qz2=3N=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1utV9q-0005ak-3u
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:51:02 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c62c858-8825-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:50:49 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by PR3PR03MB6393.eurprd03.prod.outlook.com (2603:10a6:102:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:50:47 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:50:47 +0000
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
X-Inumbo-ID: 5c62c858-8825-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+/kLqosCGL0a2isUuQ5ltaC4541xZLTxowTmrY7Yh88coPB9JzGzY+MV2MtKDa/Fynyo3N17DwZZFP7sJATcM4tJCAINx0lfeAnZ6nm9bXJK94SqOTkPqeXXI0SvOhkKJo9ULHfyeSoGqL6hll5dgeb/ARim6HxnVn6zyOvWFIvccOOOQep9J+HccPjbGCjH5LAnlmfCQNEVxPgog0cVdPUyeWpraW+AK8vrh7ZtY7H0/wZ1QYZAYmGPkaJzZtr/6rbLqD1hQbtOHfZRqHDJ920cfW3kMOWwqsUIU5xIh+9Mi1HWg8jzJjJrzq/jlCaw+VmL/+X1PI3YBs5ru7jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXGGT5mRXV753L47a+ZTuU6JasbY92eMbcTm1MoG6K8=;
 b=SnS7ihVdJ2WSBDOy9TgiDENxYChtfr3/M5jA+mnHOo/Ko5tcBMp9fKMT6csqvxbl1fXYPHAdTf41UGcea8ZlBhu6iZUtfC67SajRpCmDe1NZd1j0WN5iQOtK+43IPlcdXTOfbvt6247ySdVNv2KySWOBiYhMVdwvus3ehdMKDrDlYqDMqyHVx5dyrJ83W9pernp/YuB1hJwflD0IjGorgx+wwtWaAcqDyTu9TrgP7QSnA5LkUZt/Y18tMrFOn7yoBNkclArLCyjPuxM5H1zRNYejpB6TrAcmqNjJ0FyHrcsFaxCJWHeuakVx6VRXgf6qeQGou4kMMDEUK+2fifvsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXGGT5mRXV753L47a+ZTuU6JasbY92eMbcTm1MoG6K8=;
 b=THmSnQK7wqYGCLlVgxYXtRHYX1PwP49cj9IlTGLXTY/H0qwcE8k1dMnSPjcFcevTEP7baW/yQIix32LNrtzqceVjcT8bCMgu+BbO7yEjTud0tFJ7vjiuP5bcCnwitmzfydIi3mEqziMRjn7boATY8WFqmNCK93GZs76ftB+AgNyGZeu++lsXS8rYVZFCCT6CHNwPC4EfdaD7xxSALzxyXBUEEZFUrUC60P+4Zvjsjq6kc1MlnLnphL7W95sbOgCmuKJ4WIVxLaDp80hXCZwAd+/fjWFnXAVqJUVdxHj6c31wXbAlhU3VZkkAne7y7NBmD9//kdLHX5M4EqtfcYFQBw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Topic: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Index:
 AQHcG+7h2TGQQIBGXEebyEy6VBbgNLR/rhaAgAAaygCAAARKgIAAAqcAgAAcDQCAAAofAIAANl0A
Date: Tue, 2 Sep 2025 17:50:46 +0000
Message-ID: <ea32d982-4ec4-4d9b-a5cc-acf5906b52b8@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
 <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
 <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
 <8af7ca62-2f05-47d9-8604-170e7a40d8a0@xen.org>
 <411d7b0f-01b8-46df-9bce-929eec366d2d@epam.com>
 <1b79fedd-582b-4ec0-aa85-d4ae100eba1d@xen.org>
In-Reply-To: <1b79fedd-582b-4ec0-aa85-d4ae100eba1d@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|PR3PR03MB6393:EE_
x-ms-office365-filtering-correlation-id: eb35ac59-a6a8-4818-65f2-08ddea493f34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TisrVnp2YVpvQkV3akdYRmE0MG04NUZKbmdpUEdvaUdyVUYwUElOM2lFNHVh?=
 =?utf-8?B?NC9kOEVvT0xnbU9Oakp5QWZaNG9QcEZQUDd3bWNSZHZ0RTJ2MERvV2hvSDlE?=
 =?utf-8?B?THNOZjVoeGxVTW1ucVVBYlVpNnltUFVOQWcyeTJyNHdzWmlRTnpRQ1F2SlJx?=
 =?utf-8?B?UTNORE8xand1WDFpZlJJWHloQ2hJWEY0RWNXbkRQYmtWVHdvd1BtVG5FNjc3?=
 =?utf-8?B?T1Y4aGpBRU9JY2Y4OW5vMDk2Q1VHUDljcjhUcjFlWlFJL3NuVll4bE1PU29s?=
 =?utf-8?B?V0U0N3h4QUlDTjk4cGhiQTlsTXB3NmFLSkJRVUVITE1DbDhHWXV4ZE9QR0tB?=
 =?utf-8?B?N0YvK2wxTWdtWllpYWNmeHBMZ0greVRXMDVoYVhOOXhXT016clhvWXpCMFFR?=
 =?utf-8?B?REp4SGI2SndsOGJpTUlkQlYrb2FuU0d1M3JDVmU3bVZ5YWZjQ2JQa2FxdlRG?=
 =?utf-8?B?ZGJkKzNJbm5iQWFXWVFsL0ZPQ1lGTERrRVVTRnpSbmhBRlNuNllzMnRyc1JU?=
 =?utf-8?B?T2MzaFpyVDJWNytJb0h0cWVNTGlmNEVYTUpIcXU3ekMzL2l4WFRrTVNCb25u?=
 =?utf-8?B?aFh2NU5WTkdEMlFFRnVSMlBqSEdJVHpoMThIeGVCemgwd2JiSThXZmFFQjJ3?=
 =?utf-8?B?ckRVWlJEZzkvRVRhc2pzbms3bDYvT0srMkhYVlBSUm5uSFBnS0ZiWUF4c0Ir?=
 =?utf-8?B?bzVpcVlPemtsQ2VVMHkwSk9DRzZDVkxpZFd2bk1vTHdxeDRjcjdhdDM5ay8x?=
 =?utf-8?B?aVhock9PN3ZVSVhNK3FxUnhoR0tIakVSR1JRQ1NmcU9VQS9uRndFb1R2TUUz?=
 =?utf-8?B?dUs2TERVRm83MHNiVkY0Mk15TWY4WjlwWXh5MVZjblZ4QjZad0pNcmVlOFdL?=
 =?utf-8?B?VHNVbDJUSVNra3I0dUFoSFhKbFFJbEg5ME03RjZFRnZBdVNZTFBROGZFRWtL?=
 =?utf-8?B?TjBwekZzWWc0dStTZzI4TnZ5WVJLQ1N1ZkRXSTVRMjdFcFhsbmlWVktWU25j?=
 =?utf-8?B?MmdFV3N5T1VSR3V0NEdoTzJqOEJvRlg1czltSVJxN1JrUUNnSVUyZHVrUmMw?=
 =?utf-8?B?Yzd0ekhTNmhuaWkxZ0FUYmh3S0hycDl6NXlmakR6QVRxeGhPTzVuNGUzRU9t?=
 =?utf-8?B?dFYzNkt6eUx0NzdBYW8xcm42NUw1cXhvTHMrMkJxM2hrMUVsMWhlbHJGNEl2?=
 =?utf-8?B?NWtBNG1QcklZV1hkbE9LSVlLS21vcTVmZnpCc0NHSEc3bTRXNUJUNHNZWVY0?=
 =?utf-8?B?Nm1SQ1IraGhFeGY1MnE4NitBbjMra3JyQjVxSmF1THRGMUxoc2RuR3F2TlBR?=
 =?utf-8?B?TDZQdlVJSkl3L1VRNDVwN1FtWVd0NVp1anR5K0l6andSTHA3MUdhbkNsVXZK?=
 =?utf-8?B?bWEwb280S2Z0Umc5dmhTSmVlMnQ3cGFUdC9PdlB3SW1vUit0ZGVFSGFsQ0Zv?=
 =?utf-8?B?UUxkRC9SOXpYdHNieWhSMkg2NGh4endWK2luRS80Z1VTOHdoYk9MMEtyUVpH?=
 =?utf-8?B?MnRmYkpNMjZrMEpoQlQ2UGhKOVJIR3RLajVzMm8vYzlVUFFIdDJhTGkxWHBy?=
 =?utf-8?B?d2lFb2RCdENhc0NzSHdMNlFkS3VhNXYvMlcvUU1QVDV3bGowcjNmSjVNMzQz?=
 =?utf-8?B?QVJjaHcxSGM1amlUMkF0Q0tGeVhsV0R5U0ovaldwVDNpNDhQdkh5THRtR24r?=
 =?utf-8?B?RVBDZ1pJTDZVaE5mUWFPdHRRV3dTM3V2YVRoSGtCc3RPMzB6SytJd0E5eDgr?=
 =?utf-8?B?N2NnSXZJd0QxdzQwcDZmNGR3T3NGYThnd1QvVEVxUGFrZ0haZDM5ckRibG5y?=
 =?utf-8?B?dUlWajFta2p2M1pESFQ0bVAyTGhYNUdiaEU5R0FrS3hTWTRvQS95cVpIZyts?=
 =?utf-8?B?bXJiamFqTmNlam4rTkRrYndXYmRsamxRRkxXL1RtcmNkYytUUWRNSG5LTldL?=
 =?utf-8?B?aTBoSG1TektzL3NOZ0IyTDNCSlIzNlNDZnlwbU5zazFEY1N0dmxqL0M4czVs?=
 =?utf-8?B?d2gwL2I1SkxRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d243NFBESmt3S3J0cU8waGJBTVpkeGtZTUU3WWUwaFpJUEdrTDZwbWI4ZUd0?=
 =?utf-8?B?SFE4NjUxblNYYm92NkNmeGhFb1dRQTkzMTVzeXJMUElZNFdGQzV1VENjWmJw?=
 =?utf-8?B?Q1RvQ0lraFlXNU55UTR2bmFjT3lPa1k1RCtBem5RV0NnRW9NR0RnTllKOVVv?=
 =?utf-8?B?RmYwajl5a2tSdnJYNjZHTGl5MElZUkdac1BuNkpWS0NHc2Y1b3hHV1BiVm9V?=
 =?utf-8?B?Z0N0WVJ0T2owZGhUVTRYM0J5Q0hvZ2VOSExTNGExSnEyeTVNN2pyeHRqWlM4?=
 =?utf-8?B?a0VkM3JtT212elhyd3I4RVFlcU1CV1BmOVFVbTkwMFE2VDFFTEd6NkFtZmkz?=
 =?utf-8?B?SlRkRkFtbDhwbzlhQWI3blBXL3JQRzhIbWxyYjNWS1d5U2dkcnB3eCt2SVlK?=
 =?utf-8?B?SWdDYmF5eUludjE4SkhzbDBIRFo2R2piMG81Yyt5QU96Tm9kZWd1VDVzNEF5?=
 =?utf-8?B?SjJmdzZORmw0eU1iTXZNVG5qc0lwU3QvNEJYVzgxNmM4Z0NZd1NHa3FMOFI4?=
 =?utf-8?B?NVl2czRGajlHVU1KQjV6eVpHaFMxYnhYVG1ZdXZZa3lkeW15eHc3MSt3L1JS?=
 =?utf-8?B?MlhtZjVYQjdBcGtWZkh6bFRVL0hFN2F0YUo3VjkxcG9GTWxqSTVKWW1DQkp1?=
 =?utf-8?B?ZHZUVG9NQzBKbTFYaWtWdk9kbVI3dmN2VzZmZFhjMDUvdElDckdvS2ZyeUJ6?=
 =?utf-8?B?c2oyY0RjODlibnhlRzI5V2RLN3ZQcW01cERGVDZ5eVFmZWgrTnZ3NVIyZW1J?=
 =?utf-8?B?SndMWFRZZ285RVlObUV3eGRRWC9zK2RFZ1liN2JaLzlxeXFtSWZZaUdFdWZW?=
 =?utf-8?B?UkE2Y1RaZDhHRTdJeklmWU0xcG13Z0Fta3ZYWFdsTTVMdk9WV3diODZIS0Vs?=
 =?utf-8?B?a2NITnc2bkNRYVAyN3VPVWtLSUE2M29UU0xCVCt1OTAxTkYvRmNoUEt6TjJs?=
 =?utf-8?B?NjA1NHFJeGVHYTAvRVpJTE8yb3drUHdrMStYdmJ2VDREUGkvazBVMlNLWlR2?=
 =?utf-8?B?TnN1aklKZm9hV3FkbDFGSHlXOCs2MFo2U1dUcTBub0tERkdBTGV4dk9rdnN6?=
 =?utf-8?B?bWhnQkIrWjlmY0hjZUJFb1huakdmcUVHekJsVjh0ZktMOUIwYlRKTE9vRWVu?=
 =?utf-8?B?TXd6N1BqNlBqMHdaeDNJS1lpUjdaMkVldXRvOTBkTXZMVFlMUlkrK080TGto?=
 =?utf-8?B?OXZFTVZ6aEZ3Vk1Pc3VKY214ZFVTM2lFdERsQW1BVXhFWUJWZk11OEdXL04y?=
 =?utf-8?B?NVVsNzRNVHN6RVlKV1pnOVRQK2JlVFpXM3NweGdISkZXaGRPTWdsN0VFYjVR?=
 =?utf-8?B?RElDMUtUT2xhWE9jcnVzVTNaMGF3blAwK3puOERJUngvZkN6UUNraFlENHcx?=
 =?utf-8?B?SE5WUnZhWCtKT2xuYlpZaUVHTkMxRjF4eEgyeEk4WmtJY0tIVFhxdFJOZjBQ?=
 =?utf-8?B?K2RlbWVjZlhHdFN3K1A0Z0svWThNL0tmeE8rbUpQelpQeHFNdDYyOW5JTzZK?=
 =?utf-8?B?NDdtKzVJOEJ5c0lBUFJOWFBMVXFVbXNtaWllU0U5cERWUi9URmxMWHkveFRX?=
 =?utf-8?B?ZkFzWncrWkxZUm1TWHdESjVmVFBxTXJTUEx3MlJxNjR2d0IyRnR4UWlmckY0?=
 =?utf-8?B?ZGI5UmRlbUsrNnExV0lhTjNvY1A0cmJwWmVySDB6ZFl0NEg5MmRLVWQxSlF1?=
 =?utf-8?B?QUN6bHhVVzNZa3JFS0o1cW0yMndaUTB2ejBaRmwxWUl6aDR1L1dWYmNCcDZB?=
 =?utf-8?B?RGFsY1dXcHVOSys3MGFxZVV1WmV5RzJLUG00T0xFZm5QaXVMandDakZBUG9T?=
 =?utf-8?B?cTZJM1BkVjA2SG5DTGo1RjZuOTB1b1lqRnF1QWhHWmFmNmlWYVJHMlJkK1pF?=
 =?utf-8?B?eW12cnJCeDBwcWtHTkdndHE0ZFk0NHpPWE11WXhPTjg4R3NmcUhTdEIwWDU0?=
 =?utf-8?B?Mnh1WjVZYTloUjAxWVBaSXNnbmRxMmtLajlMYjcwYlQrSUxlZDlhK0hPTVdV?=
 =?utf-8?B?K1lFVG0xK3ROdm02WkIySjFsZ1VmL2lzcHNtSGpUQXpqUmQrMWpQeFYvSlpt?=
 =?utf-8?B?Mzh6bTJUaTA3VnVVZ054cFVtYlRjVDFaMFNoeW5VMkhXeElXMCtjcktsSlB6?=
 =?utf-8?B?WnNZT2Urd0wyUWk2ejJieEU4NjFGZVo2MlI5TVVqVEVTZGd5UUh6aXZqN0tz?=
 =?utf-8?Q?Qr55X+N2FrVa0dh2yeSKzXg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13E56CDFED767745994D5E093653CF49@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb35ac59-a6a8-4818-65f2-08ddea493f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:50:46.9681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EGw0nasy1GBe4b+YVnG9AHVseOOU5qcHOLbhlRemtnfIoZdu450TgVcWR2Uiok7vwRNme39EfSH7pGbC3BdEmGhzcvKmZC+fYGPaiMJ9QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6393

DQoNCk9uIDAyLjA5LjI1IDE3OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5k
ciwNCg0KSGVsbG8gSnVsaWVuDQoNCj4gDQo+IE9uIDAyLzA5LzIwMjUgMTU6MDAsIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAwMi4wOS4yNSAxNToxOSwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPj4NCj4+IEhlbGxvIEp1bGllbg0KPj4NCj4+PiBPbiAwMi8wOS8yMDI1
IDEzOjEwLCBPcnplbCwgTWljaGFsIHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBPbiAwMi8wOS8y
MDI1IDEzOjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+PiBP
biAwMi8wOS8yMDI1IDExOjE4LCBPcnplbCwgTWljaGFsIHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4N
Cj4+Pj4+PiBPbiAwMi8wOS8yMDI1IDExOjQ5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToN
Cj4+Pj4+Pj4gVGhlIHNhaWQgc3ViLW9wIGlzIG5vdCBzdXBwb3J0ZWQgb24gQXJtLCBzaW5jZSBp
dDoNCj4+Pj4+Pj4gwqDCoMKgIC0gZG9lcyBub3Qgc3VwcG9ydCB0aGUgYnVmZmVyZWQgZW11bGF0
aW9uIChzbyBidWZpb3JlcV9wb3J0Lw0KPj4+Pj4+PiBidWZpb3JlcV9nZm4NCj4+Pj4+Pj4gwqDC
oMKgwqDCoCBjYW5ub3QgYmUgcmV0dXJuZWQpLCBwbGVhc2UgcmVmZXIgdG8gaW9yZXFfc2VydmVy
X2NyZWF0ZSgpDQo+Pj4+Pj4+IMKgwqDCoCAtIGRvZXMgbm90IHN1cHBvcnQgImxlZ2FjeSIgbWVj
aGFuaXNtIG9mIG1hcHBpbmcgSU9SRVEgU2VydmVyDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgbWFnaWMg
cGFnZXMgKHNvIGlvcmVxX2dmbi9idWZpb3JlcV9nZm4gY2Fubm90IGJlIHJldHVybmVkKSwNCj4+
Pj4+Pj4gcGxlYXNlDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmVmZXIgdG8gYXJjaF9pb3JlcV9zZXJ2
ZXJfbWFwX3BhZ2VzKCkuIE9uIEFybSwgb25seSB0aGUgDQo+Pj4+Pj4+IEFjcXVpcmUNCj4+Pj4+
Pj4gwqDCoMKgwqDCoCBSZXNvdXJjZSBpbmZyYXN0cnVjdHVyZSBpcyB1c2VkIHRvIHF1ZXJ5IGFu
ZCBtYXAgdGhlIElPUkVRDQo+Pj4+Pj4+IFNlcnZlciBwYWdlcy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPg0KPj4+Pj4+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gQ291bGQgd2UgcGVyaGFwcyBhZGQgYSBGaXhlcyB0
YWcgaGVyZSBwb2ludGluZyB0byB0aGUgY29tbWl0DQo+Pj4+Pj4gaW50cm9kdWNpbmcgdGhlc2UN
Cj4+Pj4+PiBETSBvcHMgYW5kIHRodXMgYWRkIHRoaXMgcGF0Y2ggZm9yIHRoaXMgcmVsZWFzZT8g
Tm90IHN1cmUgd2hhdA0KPj4+Pj4+IG90aGVycyB0aGluay4NCj4+Pj4+DQo+Pj4+PiBGaXhlcyB1
c3VhbGx5IGltcGxpZXMgYSBidWcgYW5kIEkgZG9uJ3Qgc2VlIHdoYXQgYnVnIHdlIGFyZSANCj4+
Pj4+IHNvbHZpbmcuIEluDQo+Pj4+PiBmYWN0LCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIGFy
ZSB0cnlpbmcgdG8gcmVtb3ZlIHRoZSBzdWJvcC4uLg0KPj4+PiBIbW0sIHRoZSBpc3N1ZSBpcyB0
aGF0IHRoZSBzdWJvcCB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQgYXQgdGhlIG1vbWVudA0KPj4+PiBp
cyBsaXN0ZWQNCj4+Pj4gYXMgc3VwcG9ydGVkIGluIHRoZSBwdWJsaWMgaGVhZGVyLg0KPj4+DQo+
Pj4gWy4uLl0NCj4+Pg0KPj4+PiBBcyBmb3IgdGhlIGNvZGUsIGZyb20gc2FmZXR5IHBlcnNwZWN0
aXZlIGlmIHRoaXMgc3Vib3AgaXMgbGlzdGVkDQo+Pj4+IGV4cGxpY2lsdHkgaW4gQXJtJ3MNCj4+
Pj4gZG0uYywgd2Ugd291bGQgbmVlZCB0byB3cml0ZSBhIHNlcGFyYXRlIHRlc3QgY2FzZSBhbmQg
dGVzdCB0byBjb3ZlciBpdA0KPj4+PiB0aGF0IGF0DQo+Pj4+IHRoZSBlbmQsIHN0aWxsIHJldHVy
bnMgLUVPUE5PVFNVUFAuDQo+Pj4NCj4+PiBXaHkgZG8geW91IHRoaW5rIGl0IGlzIG5vdCBzdXBw
b3J0ZWQ/IEFGQUlDVCwgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8NCj4+PiBwYXNzIFhFTl9ETU9Q
X25vZ25mcyB0byBmaWd1cmUgb3V0IHdod2V0aGVyIGJ1ZmlvcmVxIGlzIGN1cnJlbnRseQ0KPj4+
IGF2YWlsYWJsZS4gVGhlIGVycm9yIGNvZGUgd291bGQgYmUgMCBub3QgLUVPUE5PVFNVUFAuDQo+
Pg0KPj4NCj4+IFllcywgYnkgcGFzc2luZyBYRU5fRE1PUF9ub19nZm5zIHdlIHdpbGwgYnlwYXNz
DQo+PiBhcmNoX2lvcmVxX3NlcnZlcl9tYXBfcGFnZXMoKSBjYWxsLCBhbmQgeWVzLCBpb3JlcV9z
ZXJ2ZXJfZ2V0X2luZm8oKQ0KPj4gd2lsbCByZXR1cm4gMCBpbiB0aGF0IGNhc2UuDQo+Pg0KPj4g
QnV0LCAiYnVmaW9yZXFfcG9ydCIgZmllbGQgaW4gc3RydWN0IHhlbl9kbV9vcF9nZXRfaW9yZXFf
c2VydmVyX2luZm8NCj4+IChvdXQgcGFyYW0pIHdvbid0IGJlIHJlYWxseSB1cGRhdGVkIChzaW5j
ZSB0aGUgSU9SRVEgU2VydmVyIHdhcyBjcmVhdGVkDQo+PiB3aXRoIEhWTV9JT1JFUVNSVl9CVUZJ
T1JFUV9PRkYgYmVmb3JlIHRoYXQpLg0KPiANCj4gU3VyZS4gQnV0IHRoaXMgd291bGQgYmUgdGhl
IHNhbWUgYmVoYXZpb3Igb24geDg2LCByaWdodD8gDQoNCnNlZW1zIHNvLCB5ZXMNCg0KSWYgc28u
Li4NCj4gDQo+Pg0KPj4gU28sICJhdCB0aGUgbW9tZW50IiwgWEVOX0RNT1BfZ2V0X2lvcmVxX3Nl
cnZlcl9pbmZvIHN1Yi1vcCBpcw0KPj4gbm9uLWZ1bmN0aW9uYWwvdXNlbGVzcyBvbiBBcm0gKCJ1
bnN1cHBvcnRlZCIgaXMgcHJvYmFibHkgbm90IGEgcHJlY2lzZQ0KPj4gd29yZCBpbiB0aGF0IHBh
cnRpY3VsYXIgY2FzZSksIHRoaXMgaXMgbXkgdW5kZXJzdGFuZGluZyAod2hpY2ggbWlnaHQgYmUN
Cj4+IHdyb25nKS4gVGhhdCBpcyB3aHkgSSBoYXZlIHNlbnQgYSBwYXRjaCB0byByZW1vdmUgdGhl
IG1lbnRpb24gZnJvbSB0aGUNCj4+IHB1YmxpYyBoZWFkZXIuDQo+IC4uLiBJIHN0aWxsIGRvbid0
IHVuZGVyc3RhbmQgd2h5IHdlIGFyZSBqdXN0IHRyeWluZyB0byBzd2VlcCB0aGUgcHJvYmxlbSAN
Cj4gdW5kZXIgdGhlIHJ1ZyBvbiBBcm0uDQo+IA0KPiBUaGF0J3MgYXNzdW1pbmcgdGhlcmUgaXMg
b25lLiBJZiB0aGVyZSBpcyBhIHByb2JsZW0sIHRoZW4gd2Ugc2hvdWxkIGZpeCANCj4gaXQgcHJv
cGVybHkgZm9yIGFsbCBhcmNoaXRlY3R1cmVzLiBJZiB0aGVyZSBpcyBubyBwcm9ibGVtLCB0aGVu
IHRoaXMgDQo+IHBhdGNoIHNob3VsZCBub3QgZXhpc3RzLg0KDQpJIHRoaW5rLCBJIGdvdCB5b3Vy
IHBvaW50LiBMZXQncyBpZ25vcmUgdGhlIGN1cnJlbnQgcGF0Y2guDQoNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCg==

