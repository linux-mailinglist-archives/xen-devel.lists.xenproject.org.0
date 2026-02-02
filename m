Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJxwF3bKgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:01:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F7CE95E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218756.1527609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwMw-0005f7-5o; Mon, 02 Feb 2026 16:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218756.1527609; Mon, 02 Feb 2026 16:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwMw-0005cf-2s; Mon, 02 Feb 2026 16:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1218756;
 Mon, 02 Feb 2026 16:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6EL=AG=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vmwMu-0005cR-5D
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:01:40 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73c323da-0050-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:01:37 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7893.namprd03.prod.outlook.com (2603:10b6:8:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:01:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:01:32 +0000
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
X-Inumbo-ID: 73c323da-0050-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1QeWMHqmb9f7ZXDF3pKpAPAl9VAx7f95CxqSS8BX5ZzxgHlE82AseeJ2CXQd6VhDkOza/dPvl5PN6NxzCAQGYix8SLzLeMRpffQod04XfOW6prsDeqntM6HI7taNi/uHbh83NFzdDaX00Cuj0FvZaAZ3a/3hu+w7Mkyg3eS1oBNjZMpFSsG6SR4dPp1C3XtpkkleOxvkj2XW1KgTwXxGXCcl7RAjjn2AWyNvRfJNQnE9LDl1UOHoqfV+WTYaRltMipbeQXl6hOKQLOKzdBwKYEYi8OetO/JuZ/Qe1jSWsWgTUD6FdM0M8EVAniRvxH5EVW9aTJILPAQlb0eXm/3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2k37cCrIbqPXYXBHg0rdHuV9sj7hWiF23lOhuP6Lu8=;
 b=BOqcNSI0BxnVgMZ67T7Wc0R6SUhcnez6xo0HHYW/rVGpkuBzprP+5s26rNXp7aANkeSRvHPAx5A3qlDb9XVv1N9VN0Etff7/XQdLnRYRDwrWUVDwzR+m4XJ/57wh3x/ZwT0KhUyE6M2qbaZ7FzmGAhqYYzRZLNiIWFzfGFDhqqKdbZd9dfhYYfXq6CZZA1XbVGoaVdW+rbEdxd/sCHx3iRGpbY9+Ft8y6x4atMToiGpwof2fQPNIyyFWKg0+kXDANIoqTenznfgkpRm0dw2Q2EXS1c9ODVqXt6R2ywPQqiIxhdoaBWX+E0K3Qz6xuKPRzTz3SijgssnTcARQVMk5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2k37cCrIbqPXYXBHg0rdHuV9sj7hWiF23lOhuP6Lu8=;
 b=ZcWpv9gRHumXjgKnk9ETWLA91+L8+ez1Idnl4S5VAkUp/od+sESlKMQ9IH6Mz5Y13+tUgt4RoUsrd7bXUstwPKWHSy3GF/AgWTWPOuTL5h80vUQtr4M/lEhRIvJ+tFxXuAWDcsJsveL8jmTmlxlDwM9srF06HLj/wNKCAoTWp38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5b5a4362-bd2d-46bb-8584-46f7d1bf03ff@citrix.com>
Date: Mon, 2 Feb 2026 15:48:19 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH v2 2/2] x86/cpu-policy: split out copy-in/-out functions
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <d5045a94-a38b-4c56-b4c7-61503589747d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d5045a94-a38b-4c56-b4c7-61503589747d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: cbeef74f-e946-4867-a8f0-08de6274556f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFVGTVBlVG50ZUFCSTNUSndZZXhpVVNMWWg3Q0pvekROWWQzdE11MTI2V2wy?=
 =?utf-8?B?SXF5TndPRmZrek5XR3BxVGd5MlJEaVBINUVZckNXRTVTcDhLUDNHY2NOWWJ0?=
 =?utf-8?B?Z3J2Yys0d1JveURhQWMwVGFQWDV5T2pzWHg4bDdJQTN2dnR2N2gvNnQxL1ZK?=
 =?utf-8?B?Y3gyWnZyTDFOdkQyaU50a2FtNzk3dWdtSmduVjVXV3ljZFNmYlJ3c1Z5SGFs?=
 =?utf-8?B?cnVySjQzbkM4Rk1td3ovY3JkK0UxT0Jyc1BaaUxlMDdjRjd1cjRTbnZONUVL?=
 =?utf-8?B?dTJLU09EandBQzJoMzRRMkNGTzBEamY3cEFxSWRySTY3Mm5QR2dmWUJDaE5r?=
 =?utf-8?B?aDU1TTI2Y3MyOHQrMmd0QngxN3ZOamMzaWluSTBwZ3pIbG9Za1NqeENDY3VM?=
 =?utf-8?B?RkQxcmhqWFQwRWhnQ2t6YUhrMzQvblJqaHFoTTlma09ac29lYlA1QzFLQ2dN?=
 =?utf-8?B?K0ZkME1rYTNyKy9HUkZuVHZrZTFScFFCcGpZZmtZamhNUmVodnUvcW42MHhy?=
 =?utf-8?B?U3MzUHNWWjJ0TTFyQVY1dTkwWTFyeGsxMGh5UkIvVlk0YUtIUFVhbXREWnFV?=
 =?utf-8?B?NEQ3MnFGSncvZTU0Z0k3MjF6dGl0TGEzVTRTSFpOTVpPM2dCamJ3NElLbkFD?=
 =?utf-8?B?d05ESUxJUzAwVkhiN2diN25VZURueWtCUUlEcC8yQk1jKzVqUEp2dEpyM3Zv?=
 =?utf-8?B?dTVwWE43QVBBOHIrOG9UeEhXYnZ4Z1ZzM1kvaXNsUzdjWGpOd1pPNUNvZEVs?=
 =?utf-8?B?SjcxS3V0OHJxejlZRFRQSnluaSsrcTdQK25zaHZEYy8xU1JpZFhJRk82RG5C?=
 =?utf-8?B?S0QrdElhOE01UjBVQkpPdmphMjVWbDUwell1ZTlpSmtGR2RXUGw4Uk85eVZE?=
 =?utf-8?B?YkRIOWtUbEljbkZoMWxaR1AxR3VOYTdoY0todkRtQ09XV3B1Wi9EOEN2QlI3?=
 =?utf-8?B?OEp3Z2lFcjlqbzRXNmhuS0Z5VUtSUTFmRWFIR0NrUnRhblpQWlNzblZUc1dy?=
 =?utf-8?B?eG9IVHg0UmQ2LzlKdjlnRTVYRDZsMnlRbjhmdkgrbHJFOFI2TmdXbzRLdldK?=
 =?utf-8?B?S1JDTVlGbDB4VTVlcGp5anNvU3NTd1g3eUozcEVWK3hrVzNlRWo2bXhGazhi?=
 =?utf-8?B?SlRRdnpSc0MxYXcwMUh1WnBEcEZpUDVJU3FRRDhMUEhxVFNXMGtOdVN3K05I?=
 =?utf-8?B?QTFnQ2VxNjJLMFNEdlJLRXV3ejgvaHFjWG95aEZKTjR0emxDNEhKbHpNeEla?=
 =?utf-8?B?L09rOW5tZUdKWnI3YWdtVXBVLzEzY2UyYzU1VW9XbExZNmwvdDQySG1PYXFE?=
 =?utf-8?B?cW5aZ0k4WHBIRHp3b21RclA4SjJsRmFCbGZsUTBZdU0rc3VmK05aOG94YkNt?=
 =?utf-8?B?VTBaNlQ1UGRWWGxUWnA0TysvTTZoWXhZeXBzOGJRSnZGTGZua0FHRlMrSEVX?=
 =?utf-8?B?L2hHUWRXcE5jaWRvUTNOTEFIb0c2dnNEa25kNTFQKzBNT0RsZHgrMXFIZmZZ?=
 =?utf-8?B?OUtwdjJ2aGJhMUV4bkZjYys3ODZPcnc3c051WVhDVk5TOXlKT3U3Z2VjNEN0?=
 =?utf-8?B?em43c1JBL2Fqb1E5OW14dWVuNGVKTnYzUnFZaVd6UTI1dHVwbGMwU2taL3N1?=
 =?utf-8?B?cFAvZHZNYWJROWRSWXVQQStnRWVzb2FMNVd1M0hPc2Q5OU5udnJKb1BMQlNa?=
 =?utf-8?B?b0tCUmVKVnlzdE4wazJ0OEE4c0JJNnZLLzVWV2ZmdmMzdW9tRnFibDJGaTZ1?=
 =?utf-8?B?UitXcjFxaXN1MnlHZmhVS2JMa2NjdG5MZnlSam1FeGZVZHZwUjEzcFdxMzZI?=
 =?utf-8?B?bmNnWTZwUEtyM3FiRDM4Rno1VW56bjhUcUE4WjhIQmUvQUNvdEViV3ZBejNB?=
 =?utf-8?B?ZFVwZ1dqL1IxY3VUVHBwYncyODdkbFhQdWNJRllJSkQrc3dkR29MZld5eUdD?=
 =?utf-8?B?VVUyNTJoT284UzIxdlNKMEtTQm43UjdEek0yOHVSOWpkeWV4T0JpdE5ZWjM2?=
 =?utf-8?B?cTI3OS8wZVFZVGFDeFJaTkg5TFVWRnFoalB0VU1FT3IxWHdyV1JRR2E4YW1j?=
 =?utf-8?B?YldyOS9Ta2txQy9IR2FGWm9ua3JjZEdaRzBjSzNYWDczUnVoUXhVKzk5Vjht?=
 =?utf-8?Q?n0oQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENKNGoyNlZuL0ZsWS82TkhOZXN1TFNYQVJPVm9ZWHEyZ0hhWE1yRHlKQTZ6?=
 =?utf-8?B?WSszenhmTHNOWm15NFdMRzliVkxXSG9xVlJYdTZuaGY1Z2tEeUJhd3BJNGI4?=
 =?utf-8?B?WGtOeFZKb2VPdDd5SG9zWGN2ZEREbnQ3MmM0QUNha3RYSDFuRkZabzdTeks3?=
 =?utf-8?B?M21iUnFveFowZ3lwMTFlUGk2RG0yY1BLaDliemxzN0JvVENZS3BGVk1yaEtr?=
 =?utf-8?B?blladGZLV2VaQWJHVFovdjFIOGg1L3drNXRFWTVOa1NhTGVwSW1iSERlOHBT?=
 =?utf-8?B?OWZvckxkeGtIaG9rSGYxcGdkOTlXT2tzbU84d09kZDZKU3BLK01za3hsSEF5?=
 =?utf-8?B?aVp5blM5cnNWYlNQcVlha2gzcDcxMnZaV1FRT243bzlqSEtkQWpVMGE0Nis2?=
 =?utf-8?B?TUlPK3R2N05abXhXSFppbndOd1RYc21ocS94SVMrZCs4MHM3SWtvYVovNm9O?=
 =?utf-8?B?WGVtTDZiakNxeHBzeHpIMm1sUHJ5R3JlaUthd1NndTViaXFYL0Vqdm9oSGVH?=
 =?utf-8?B?T3dIck5tS0R2Njl0MnNaNmpqV2VydHZMdFhpZGVCem1UYko3K0ZaR08vRFlv?=
 =?utf-8?B?ejJNblRnM28xaWpzd3VtY1FVRjd2K1EvSExzanZScThmVXl2Z2xhN2RBVk1u?=
 =?utf-8?B?T3h5Tmk3OXNKTTBpZXdJSFZDRmhpb0Y2WU9FSGU1MkZtNGU5VkZUT01QdG9C?=
 =?utf-8?B?c1dBOWRNTjNpcFcvYkZGWVdqV0tVUzZURmtjblVmOVBMYm5ITzBaTC8wcjIr?=
 =?utf-8?B?WlhUMFZ5SU0rVnIyVW5hUEEzOVQrNCtQRlpncFlFNXFMcmtjS1pzbGlHcm13?=
 =?utf-8?B?TUJwMzJ0NXBnTUhUZDh6OG1DM1RvVG1UZDErMmJtcHpzUHc1WmFIVlh4eThD?=
 =?utf-8?B?dUx4RUNlY0k0eVRScnpoR1VvRVBXWmtGT2grRm5LcGZrYzl4SDYrT1lRUk9E?=
 =?utf-8?B?RWVyV2htUC9PQk9qbVpJSUxkbno5dkQwdTVuLzZaQlNjSS9WK2Y1RnZwRTdN?=
 =?utf-8?B?S0V6eVRIVVE3RmczenJ3ckNQVmc1MVpBYlBBa0ZLRTErWVprNkJ0RWZIc3Rt?=
 =?utf-8?B?bFFteHJ4d1c3SzJlalB1V09XZnNDcnppL2x3V1pqdjI3SWFJWVVtd1hyRkxi?=
 =?utf-8?B?Q01hK3RBRzUxY2oyTWtPcGltMFVwZ3RCaHlrVG1vUWcxRmxqS1dlbEdBbzlj?=
 =?utf-8?B?Z0dDcmNsNlVaeFRnenNNN0lQdkVRYTlyMUozMXZISDVpR0pnVHpyVWphVUp4?=
 =?utf-8?B?UG5DS3g0NDU4K0d0ZWhhTWhwRlAyditXOXR5ZEFRdVJvRkRsd0l1MjlDRUVN?=
 =?utf-8?B?Nkpwd2pjVzNjajM3SXJsR3RIWHM4bjBtRU9CaXIzU05LSlFpNEJvb1RNc2Fk?=
 =?utf-8?B?bS8vazdWdHJkcmVyWEJBUXl6bUNyU0xUaGd3ZlJtQ0k5Qk1qRTBtbVczU1Z4?=
 =?utf-8?B?UzhaRENuR1J1NXdLVDhkUVZMSVV1VGdndU1nYllKRUtQdWsvck15MHlUNC9O?=
 =?utf-8?B?ZVRCYVJvT0kxaFZ4dlRydlMxNzRsSkRFTHJ0V2VJY0ZFakNBSkNHSE5TeUp2?=
 =?utf-8?B?WFlvVmZoMDRGbWZZK2NMREhtcytLTjBMdStoU2xDckRBL1M4azJhSzQwME0z?=
 =?utf-8?B?VTVOckExbXBUL25rV1hzTXVQQUk0Z1BFeEpJbXFUQTFHditTWUkzc1hseU9z?=
 =?utf-8?B?a3lwU01RTjhWemhrRnZjUENxUWIxc0FCNWhGZ0Fka0tWUTU2RzhYSkRmV0tF?=
 =?utf-8?B?YUpXSDZWaDJ1M0VyUkdFNlBVeTYzS1RvWWROcm0xa3h4MTUxQUlPR0M2U051?=
 =?utf-8?B?QUlGbzhxdFVVM3hzL3I1Y1EyVnNjcWY1TXdwUlNEUk8rMmZZOEJNMXE0YVNw?=
 =?utf-8?B?SnUwbnZkWEhicmVyMmwzZjhMUWoxUW8rdXQ3NFBmampDQURqTyt5TGovMW4r?=
 =?utf-8?B?OHNHKzB1QVQyL0hLa2M1aXFnRnVLdnZhRWRxUjA1U09pL2dlZ1NRZTVEb2pJ?=
 =?utf-8?B?WVBYZ0JTajRaWFJhM1BCemRObjd6WEc5TUpuRCt6dTQrMi9rV1N0WnlNS2Zo?=
 =?utf-8?B?WDRXamRiaVhVUS90T2tVOGJBUHVZRm4wT3BKMWxrMDAvYS8zbjFudGdtUkM1?=
 =?utf-8?B?TWlrQ0U4bEpWR2VvbHF2RWp1bnErcFZnZCtpbDVRbm5JblV0TjJxZ3JHUTRM?=
 =?utf-8?B?dHovbFNwNGVVdDlnd0lBY1JDTkVkYnF1SEl0RTk4bWR2QWt0bEpNd0hNWkZJ?=
 =?utf-8?B?cWhRN0tJWjJ1Uzl4YWltak9UV1BPRFhTQ0tBOWREdVY3RnZEZWFPRmphSUti?=
 =?utf-8?B?NUJsRm1vblZrM3hYNCtLNm5kVzZUS1F1QXdKUmZvT0JBeC9PYUl6OWNGOWtw?=
 =?utf-8?Q?V2t8LK0jPGxS1tnw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeef74f-e946-4867-a8f0-08de6274556f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:01:32.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spYyAfEnVtdKz3jcj5xLyYFSLQtYJB/IlU0AlGk+F3StN06i+Hdwr5c9GaLZF/cvzOW4Yl4L69YwKWWhrQdmyl+rb0emmxMxzmClMZF2YOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7893
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Penny.Zheng@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out,citrix.com:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid]
X-Rspamd-Queue-Id: C88F7CE95E
X-Rspamd-Action: no action

On 07/01/2026 2:17 pm, Jan Beulich wrote:
> This is to aid with MGMT_HYPERCALL work, leaving the functions potentially
> unreferenced (which Misra dislikes). By moving them to separate archive
> members, the linker simply will not pick them up when not needed.
>
> As the CPUID and MSR ones are always used together, put the "from" and
> "to" variants of each together in one file respectively.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

