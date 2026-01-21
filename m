Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKfjFe4ccWmodQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:37:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E9E5B5C9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210150.1521960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vid4C-0006UQ-Lo; Wed, 21 Jan 2026 18:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210150.1521960; Wed, 21 Jan 2026 18:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vid4C-0006Rl-JE; Wed, 21 Jan 2026 18:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1210150;
 Wed, 21 Jan 2026 18:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vid4A-0006Rf-Lm
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 18:36:30 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 185560b2-f6f8-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 19:36:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5445.namprd03.prod.outlook.com (2603:10b6:5:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 21 Jan
 2026 18:36:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:36:24 +0000
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
X-Inumbo-ID: 185560b2-f6f8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6DwqXCP/6JE6szDpUk3chBFVTKSx13xgCwpOaVi6B8OaKaNJzErFuU4R0icMT3fNDVVd/AECbs58VluKKZp11NSxjbfE/TYo+OiKS3w4F/7D2HX5QtSxdNNCTkqrtPIhXKnb5NgqIrLq8WuqVeC0WkgU/dJ9j0FOvALdcKKCzxbkgxEJ3Oe1CJoULpsuYmuOmtgO+4/WU6hIFuo6aDrZUVeyJ/Jh/Z2BkCa8iDjIOZ16rAI3ay7AA9V31l3szlRda/bnSPtQKHfpkVfwV2pd4bSQEHQ1/P3WEjALc0aSNkrbFvYqxt174G58DoZ291wq7NJTuABp6/g9aldW+RTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtGQX27Q3ZsY+bGqINgv6ClmHXKPnPmPTyr+7RkbJlw=;
 b=xK4uKqRxmW0W0cRcU9AJtjB1CZGkCdScN/O6AFWqArjK66vQGZvc+2X/HE+VFg8ybrENjUdTAm1jt6BpYHJm2GswUsFynTHZ+fJG6MHI8rufPiCMlZYO3tl5EpbRcXLJCaaIYxBU7x+Hc7FHkzl/mxF0q9mZIkzCtgd+oGgHH8iz+MhJVXvryK//zxhUT+zT6uK5THCL+zqTUjTq9pEQdhuOO5MO30qkaM3wj4CWua56+8zUH9LeXLzwzFfYvOwb9fHQB9ZGApbf7WTDZV/dZSNKdJ6ywgXwwPWV1ZvE5vlK0H05tOFNECgyAcgpnc1c39GmvfXmzt042z6VcDQnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtGQX27Q3ZsY+bGqINgv6ClmHXKPnPmPTyr+7RkbJlw=;
 b=RqY38WuSsKXIVTWoOK57vbdoxyz1QBbmgHviWvEPeo+o42vtmgXcrKugopbEfPpGIEMKE4rY/E/ompdOWkIfMFPS0nqXlIpe1ROrouiw2jiVwu5UTskJDcpzZKIuvJEdqIYX5dMLNEl94MPRuhzIb88yGD9PJs0VW8rR5L8TnFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cd1e05cf-d81c-4e19-a410-d229b68485a3@citrix.com>
Date: Wed, 21 Jan 2026 18:36:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 3/3] CHANGELOG: Note the new SVM bus-lock intercept
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-4-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260121142857.39069-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0592.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5445:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf647ca-47b3-4569-159a-08de591bfaf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmV3SFByRy9XRnpMSkZwWUNaSTQ1N2pMUGkxbjIxWGVYSjJPdnl5Q2IwUDVG?=
 =?utf-8?B?ZVY1YW9yN2hCRnpmOCs2eGxtdGFYdWhhTC9DVktENk5wT2NZZWNlZnRWWHF1?=
 =?utf-8?B?ejFvS3MrNjZ6amRjRkJLeVNIR25KeGRRL2c4N2xaQ09kQ1gra3FBRktwUFRZ?=
 =?utf-8?B?ZW96eUFZNFZEMjlDVE1EcEliVlNwb0RDT096U0V1VTVNY0VaMVVRaXltWkcz?=
 =?utf-8?B?TDIxZHVjYWFPVlFyenBJREYyeVFPS2c0YVFpOGlQZ2ovYUNmUmFZTmtRUlpn?=
 =?utf-8?B?Q2xKZHRuMVdHNTJ1bnhiaU1ObGF3Z2o2STJxK25nMkk0ZElSTVdNdUpQdDl2?=
 =?utf-8?B?QkoxdWc4NEg0NFA2QWsrNTFnNlpCc1JlTUhtL2RNM3k3dzFKZFlLSzBoTk1m?=
 =?utf-8?B?Ujl1bXcyZVpPS1g0VHRrVU5PMkx0M2J4Rk85aFFDS1ZMaUc1bTBYOHlzdlRW?=
 =?utf-8?B?NzI0ZXJ1bk0wVTR0Y3B3UDFHNHRGTlNYSjdDYm15Q3lJSitITGk1Q01QdU1U?=
 =?utf-8?B?bEN2dGo3RDYxKzluUUY0TWMzcklYSEc4ZFZWRWIvcU8xUDc2L1NDUmhUTFg1?=
 =?utf-8?B?UkZEM0tJZ1V6dWRzWmI2ZG1lQ0t0NW5iUWNUZzUxeDhJajI5Rzl0T3NDNXl3?=
 =?utf-8?B?cnlWZ3lhck1ab05kM09hTmpiZjZVcW5jRlhnajA1ZEtyalo3YjRSeGtQUDdJ?=
 =?utf-8?B?WVBJNDZMM3VlZUYrcHZFc21PQkpKaC9YYmswT21reXliMU55bnZVR1o3cE9R?=
 =?utf-8?B?YmFhUDhiZHI1SW4rQy9TV2N4NDUwOGxYYzUrOFpoM0RZN0ZIRjl1a25iNnNQ?=
 =?utf-8?B?U2t3VTVyb1FiTFFEVTEwcG9uMmF2VFRPTTdlVlBFOTdiRXlic1h3QjdQUzJp?=
 =?utf-8?B?eWxBQVR5RzhnRzJKYXJIVGRmOE1CWXVuSGdRaGNIUk1FZXpRdmV4eWUzVGVC?=
 =?utf-8?B?RDJpL1FUYUNucTdGUmtwS25qUUVKWU8vL0VPaXBmOHZ3b2o1dTh5c0dCMHBG?=
 =?utf-8?B?dXY5eGdJd09oV3RaUUIzR0ZnMjRIRXJPbmtncklsWFZBZEZxSzhFb2x4STZC?=
 =?utf-8?B?TVlsWDcyN3hrTlRDV09Iek5FaDZqTGJTNVQ0Zm5CZC9qTVRpNlVQRldRbG1G?=
 =?utf-8?B?a2ZJS3RCVVA0QWVvTGN0ZjIxZ3hQNnRYOGhncnFYL3RyZENlY1FYK1FjcUJx?=
 =?utf-8?B?UW1HK0pXYnRqSlNXMGpOK3JoTlZSbWRXQkx5ZHE4Z3Q4WEdHUEcrdGliY3Zl?=
 =?utf-8?B?Y1VhVVk3bFpkSU9kM1l6WGZ5WU5iYXJJYUp4UzArOHVBNVhOSHJaTkIxT0o5?=
 =?utf-8?B?czYxZzNSNDcwMXVxUUxpRHZ5VjZwUGM5RGpuZy9UcEc0cHFLM1UzVHBsbCtM?=
 =?utf-8?B?cEk3M3RsUVozbENYdkJmWEt4bmtiYi9ReDg2ZTc5MUxzbTRtbUNRU2JqVVVD?=
 =?utf-8?B?M1AxU2lzMzFZTmg4VlRZbmNGa0VzMU1xWDVYcDE0b2I4elRGWnArMmMrSXp6?=
 =?utf-8?B?TnVBNUZkQ2kweUlubU5sRWU2eUc3YUxqY0VkUS9DbkRHZ3VlVCtrR3pWRm15?=
 =?utf-8?B?TlBoZmttSjhTbkQ2RVdJT1RFMjQrNnlhVUhyU3N1V0FpQWM1UGJKUFZrcm9L?=
 =?utf-8?B?THlMYjZxeEtpQWV3NmluY3hwaEhwbURRZFhpUzRkNmY1OWo0YkN4NUZ0eHV0?=
 =?utf-8?B?aDZEdTlTTkxVUldxbWl5Q3lpWll0VGxTbVcrUGp3QTFYaERFOEtEMjVVNG9Y?=
 =?utf-8?B?RHdSSXdabDUzSktzUnVkQjNHd0Rld2dVMUZxZm5lY2Z6LzMzUVg5Z0tDMmZI?=
 =?utf-8?B?YkRWTzBneld5ZEJ4Rjk2WGJpK0ZPRFFnTTgxRTJ2Q3FzMDY0N2xZcTJaRk1J?=
 =?utf-8?B?MElKbTJVSFFYbUtCMEgxZmlZWDIrY0ZTeWZvU28rcDJuTVJpSHl3V2JFSUow?=
 =?utf-8?B?YVI5VEZld21YeUJKRHpzaEs2Q1pPUzF2T2lZWkFLRHpLTmhCMmR6bXVjaG1y?=
 =?utf-8?B?YncweFhhK2c1dEF3MFV5bHFhMUd5Q1dYamd5dXNWWldQUVRMYW9iZ0pIUXJk?=
 =?utf-8?Q?C0yuEX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V01mcE01L3JnR2NwaStrN1ZRKzltQmtidWpjenp3SGE1YzhZS3dtWGpWb2Vo?=
 =?utf-8?B?Q1hBODZrK0lMKy9XOFVWUEdoRFBtN0xJZHZkcGQzV0JXV1M1aXVrWVhOSU9D?=
 =?utf-8?B?ZEdwYUFuS3pPUU9Rd0ljVU02Wk0xVTFYdkdjSktwanVvcm9uMmFxS2w5ZE5m?=
 =?utf-8?B?UFhZVnNTSFc4YW9mOWdMTVIvYnJKc21tOTU2YitCdFl4NzI1aHBLZGxtdzdJ?=
 =?utf-8?B?MFRCR3YzTjV2dHBVVjFYVkpXSy9PQTkxQ3Z1dlkzbitUZnMrcDhPaHFMSW4r?=
 =?utf-8?B?VzFSb2NmWWIrUkxmakxuK3ZIcmZxWXNZLy9EWjY2UFl0dmwrTGhoVkhjcVBq?=
 =?utf-8?B?eERPQ3IxSGxiTHE3N0xJSzdlYUNpM1VTWDR3WXBxSHFlczA1MkN0UFhxTGdO?=
 =?utf-8?B?WUl6VDlQQzNvUGkwZTkvNGQwaXlPOFBrdlNaZll1U1ZWb1pBMFJXYnlvVWtz?=
 =?utf-8?B?UVE4MytEWVFQWk50cDdPWU8zbHZnNDg0ZTZkYUFxMW9EMnZXUlFqcU0xbW5P?=
 =?utf-8?B?d3Erc01qenJ2NldXTWNON0U0bm5yekp4NUY1V2lmaXpTQXUxdHEwY3RPOGNU?=
 =?utf-8?B?Vm1xVVFOYkpnSWVnMlkrb3BwTDlSTVhBcXdJVEV5UWdGZUlMR0VOd0hCY1Vr?=
 =?utf-8?B?UnRXWnBGU2ZCYnAyWjllY04vVDVUOEd2K2RHODM5VXBYZVMwNHlFMTQ3Y0JM?=
 =?utf-8?B?dFRiR2FaajRXUkN4S0owb1EzRGUxRWFBVWppVFFWUXprMjlsUlJSNkUvYWZD?=
 =?utf-8?B?T1Z5MjNHUlVvUXB5cG15djlDZE5LK0tvbzRZdjFxd3FRQko2T3FnSndTVjVC?=
 =?utf-8?B?dlNXMHBEcTRiNEo5eDRDTHBJQmVCRFZ2TUVpd2xOZHYrVHkvZDBhcDRzM3Zp?=
 =?utf-8?B?U3Yvb1h1bjNZOGxkY2ZFRFVwdW1CV0ZJV1JhZmthUjdRZkQrMHRCLzZpNDNy?=
 =?utf-8?B?Nmw0TXpiWjZaaFpVRGdETGorTkZ4T0FEN08wZGdFSVlYOUtOQ1Zka3hEMXlz?=
 =?utf-8?B?MlJiZ0VydDNHaVV4RFJmSGJ4VXk5ZkZ3Q0FFV3YwMVQwYlNGVm9Cb1htZXZa?=
 =?utf-8?B?c2Q3NVB5dVNXcUlrVldpSTM0WFhtUExMQWxGWGRTbUhpYnY0SXhPT1p1SnA2?=
 =?utf-8?B?enFMS3JqMTdvYndjSm41WEtJL1hGR29hZEV0c2JiOWtqR2EzSE1NbllhTlNC?=
 =?utf-8?B?Y0o4SG02dy9VY3M3UmhGVzB5Q0d3VkV4VjBReGlTaENkd2tUUkx2bVZ5NXlM?=
 =?utf-8?B?RXNueU1wY0ptRVFFRzVUcGVuZXA1TUUxenBKcU1XRHlLMVNwWmU4WjhCdEI5?=
 =?utf-8?B?WUJ0eEhvZjhhbERPTis1NzV1RFNWenpmSmhSNmpJaWdtNCt6UnJnNzBBeXV0?=
 =?utf-8?B?bzIyYnlVd0pLRk5COFR3M1JRTlJFcHlGdzRKTDdpbTZaaDh5cVFMK0dtY1BR?=
 =?utf-8?B?NnhHTnJQUTNOMnJ5TnFpNW1HcXRtZExmZWRybzVNc2VQa1dWbjFlemRXd1N4?=
 =?utf-8?B?OTBlNjN5VWs5N2t6YThrMXdGK3pxSHc4b3BWNnZWdHFVQ3RvOG5hK1FGcDNz?=
 =?utf-8?B?WjBBREMxQXBzR1ZLV3l5NDdFRkg4cUlzV2NCVVg2OXpTaVo1U3dTd1lJMlVT?=
 =?utf-8?B?UW5OdlArMVQ5emJCWTBUUVcyVzh4TW1DcjZKMWx0V2hMOFEzUmw0RTBTclNi?=
 =?utf-8?B?ODVtVk5aOHYxMzlkOExCV1ZRb2JPZE1ZY2g3SXZWRzN0UjBUa1hhTUtZcUFx?=
 =?utf-8?B?ZERES0RITTRJeG9MVGxheHNVUUNUam9nTUNaajY3aTNwblY5THZRR293MTdt?=
 =?utf-8?B?WHBJYWQ4SlJodG1wQnN0TWtGblAyaFhxbGJwYXVBWkM4enFKcGpha2FFY0Jx?=
 =?utf-8?B?d1NMc05WZDVXVmYwL0ZtR0l2Tk42UVpSUFNkQUdpZDcxaVZWOHFVcDY5QU02?=
 =?utf-8?B?d0FFMDNlajI3cytiRWNKcnN3K01xSE51Uis3T1ZnbXlBVm5VazBjRmtySUtr?=
 =?utf-8?B?TjFQbE02WEFHTmJyNWM1SmNsMzBFSWJFK2RGMjRxUGtsMFo2akRONjhLRy9B?=
 =?utf-8?B?VTJMYUVreXI1TmR1WlgyUW9mdmd5c04yRlNwcU9vajBMTlh5Z050bHRRb0Qy?=
 =?utf-8?B?c0lzY3lYRERQRlZUZnRGc0xacWcyZjNqRVZCQXIyYm4vdTFlbU80MTRuMVZS?=
 =?utf-8?B?WmJicG81a1VBdmQzQU0rcmZPdU45Zm5USlg3dkxXTG1yeXpKZGQ4a0NvNzcv?=
 =?utf-8?B?YkMxV1BIYUNYOVJ0WTh2TWVqdmR4UHpQQ0M1RFNsbTVMek1oZ0syODg4Skow?=
 =?utf-8?B?cFg5emNGam9MejMwcHVieFRZamxPSG9CaHdySXJWZFh3RGErL3BEL0ZqYkVw?=
 =?utf-8?Q?enYZFCxRirdbtis8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf647ca-47b3-4569-159a-08de591bfaf6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:36:24.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beNVW1Mlp81jHFrleZdpNQsBx6YNzxygrxUikfN1Uf6uPyAyzFT/71h764YUeeGkv2+7iK08pVA2VMZhlwuBe4PBfaL5auXWlHzb+kxFj0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:mid,citrix.com:dkim,keepachangelog.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A5E9E5B5C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 2:28 pm, Alejandro Vallejo wrote:
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  CHANGELOG.md | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 53d92a2597..07c1745f22 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>  
>  ### Added
> + - On x86:
> +     - AMD bus-lock detect, used by Xen to mitigate (by rate-limiting) the
> +       system wide impact of an HVM guest misusing atomic instructions.
>  

A little too much copy&paste from the SPR section.  This wants
unindenting by one level.

Also, this text most importantly needs to identify which hardware the
feature exists in.  I've reworked it to:

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 53d92a259731..9c3bf0411ccc 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,10 @@ The format is based on [Keep a
Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86:
+   - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by
Xen to
+     mitigate (by rate-limiting) the system wide impact of an HVM guest
+     misusing atomic instructions.
 
 ### Removed
  - On x86:


The internet suggests that it's Zen5 rather than Zen4.

Also I personally put the CHANGELOG update in the commit which finally
implements the feature, rather than doing it after the fact.  This is
more helpful when git blame-ing CHANGELOG to find things.

~Andrew

