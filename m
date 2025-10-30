Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2F4C1EF8E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 09:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153406.1483755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENxa-0005pU-Cw; Thu, 30 Oct 2025 08:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153406.1483755; Thu, 30 Oct 2025 08:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENxa-0005o3-A6; Thu, 30 Oct 2025 08:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1153406;
 Thu, 30 Oct 2025 08:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/0d=5H=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vENxZ-0005nx-7e
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 08:24:41 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddd9fd43-b569-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 09:24:34 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5237.namprd03.prod.outlook.com (2603:10b6:610:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 30 Oct
 2025 08:24:31 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 08:24:30 +0000
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
X-Inumbo-ID: ddd9fd43-b569-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaz42UlKVbS221XXQx37A/SBF23rxlRCsKUuN3gp5HxNhPnR5mfszFOn1RbgAUAQOyTR+EiHkz0anzAPrgAeWdYm4/IH8OrzjkQyNaXPtoDrNnqCMx88Hql5dlcYMrw36+URjGnSMLWODVctfp4/jGqA8kTLBJg26dk6pcEyn+wtlDmvcOcDCXeJbNI+Brrp8LYpKpL7PRkude/6lngq8vJALZw8oSPIwjxbl2lBlqBTxpr9RHv5wpcnC6Z86rzt6njaDcg4aUmx5NdVEmVdeGQd9PfxwycIcwlvO9cvylUWKdGuSfer67DCnEMqDgz4pYNmRl5Ss/oy7OTW1es+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Isn9i84sEB/9/zrmh85TkuFwHbfLi8sDWH9laFnBZdA=;
 b=caA+6/TDB45beRUii7eJdW1kkwC0Tqwgf2EB3KJ/mfKiO7B9cuA05xIGdcsmRXmlo1/7IKGdUEoi7G76oUWFHIDLpk551B1SJEVWwnB5qy9TFWFSVED+Rr7sEAHwEsjysyjcYCSVpANwACWCAbZHjwOnxrfDRu0uY3MXs3T6OT6vK8RaN4nOXnIuxgQ5f9a7LIbsmJKiBFJDsumPU24Sw4uT5sakuuBVEStZSLn9manb18Oa+XaZBoWDoY+HlnKfaR1foQBNLFAneIeyYH2VVFZim3tuvy3jfiVAbPbc+sliBaz0KjmV7RvIvKIVYL9y6OCsBnmz4llKgR7GIYo96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Isn9i84sEB/9/zrmh85TkuFwHbfLi8sDWH9laFnBZdA=;
 b=jT44Y7i+GYvu6dL+yQkVS/BDd+akaW7v1P227pJp+PwxyK5L2dpYz/Lsps4FcY3GaI8sV0Je6XFqon+oMevedXnZa/dmvf4Rq5CBo8Hyq+PJslDrAyExVMr0/NefoWH9yzXmsTo5lx2+8XVAvBWfKeWNdzWJOPNFGrg2FjKQZY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Oct 2025 09:24:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
Message-ID: <aQMgu9pkn3m_msf5@Mac.lan>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
 <aQJiZQ37v9av7De2@Mac.lan>
 <9a2c6c79-acc6-4201-b6db-492bd2e536bd@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a2c6c79-acc6-4201-b6db-492bd2e536bd@vates.tech>
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e3b473-dc99-4d1f-1f40-08de178dbf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDdzQjRQY2x3YXY1S3VOWTBXVVBLRW9uTFJydnFJUTYxNHZZUUk1N21CM1pD?=
 =?utf-8?B?VUNtalcwTjd1MEk4bDd2dkxkUWN3MjJHalo4T3hhd0xVc2lsWU5HSW80bXpS?=
 =?utf-8?B?aG5ZMmxHeW4zUEpNZXhOa0tId2pMVlA2UHMvNVVpMWRHSVlJSURNR3VnOUFU?=
 =?utf-8?B?NXlRQW9EUU1wQlBWcS9xUURsQmZSaGpmUnk0TmNkVTV2Q1d5MXExNzJPSnFV?=
 =?utf-8?B?NG9ReGRYajE4bm5iQzg2b1NjRXpTOC9UWCt3cDVaMkt0b0FjUSt3UzcxdXlC?=
 =?utf-8?B?QU5OeVlDd21kQktPN1hYbTZpWnRvdnRLd2s1cnhIU1k1ZUttMzRCc0R6THM0?=
 =?utf-8?B?TWthWWg2Y1BUK2wwVnMxakx5N29pNFpvdzZqU24vbkxDclFNc2hxRkJrUlY5?=
 =?utf-8?B?dUhQNVhoZ2NSZUJ3WnJUaDdYU2psVXpUNzc4d2NsYVB0czVNczE1bjFhL3ZC?=
 =?utf-8?B?OTY1c002N1lqTFRUZllxek9ZNmtjSXNKOVZMbDMzakJKRFgzaE1FMnhYcm9n?=
 =?utf-8?B?em8xQ0gyWEpvRDBoZHpFT09BYmpHUmd5U0l0MjZFTnJBaFc1VmdicjloMlNp?=
 =?utf-8?B?WmlvK3kyd0pTdW1nVWhER1hRaDd2VnBtN2taclFwVU5YNWNmUDZUb3UwdThF?=
 =?utf-8?B?K25XQi93TkFxWERSQTUyN0xVckszWVBET0tKS2J1Wk12akJrbmpwbFdya2pk?=
 =?utf-8?B?VmZmL0JPQVBNc0ozWVp2dUo5MDQ0bDVOWk1xZ0l3MTBLajZrRy9wY2YrYWNw?=
 =?utf-8?B?TFBsaE94VHFuNFBDd1BkVHV5TTNUZ1cyYW41N3djOHY1OERhaVRONGc0NHBI?=
 =?utf-8?B?MlkyUEI4clhpQTRsVkZROUZCZjZFQ05xcFQ2OXRzbTVVWXJtQjU5RTU4VklL?=
 =?utf-8?B?TGQxQk92d2J3bUZlSjY4cU5hZUtISThna1ZaYUIvb0ZEQjZ3RzBOaGRYTzk1?=
 =?utf-8?B?SElEVDlUdnZTY1pvOWhpSWU4MW1CS1E4RTNhU2dKbm9NWGZaTTBST05TSEdG?=
 =?utf-8?B?bUVmZzlYL3hJTG9GOVJJc2g2clZZYSt6WTNLMmNYcHpvdXRRWUNtRDg1VnFN?=
 =?utf-8?B?d1RNYi9rdCswd2ZNSHFVQSthaldBZXpuRUx3UnZSTEZodXRTQ2VLS2w4cjZm?=
 =?utf-8?B?ODFaMndEQldtZFFtY1poTWRqcU05MmZORklnc1FtK3B2L2RzUm5tU0dTN3lN?=
 =?utf-8?B?bDYwaHZXV2dTTXRzQ3BDaEVuMnZHS0l1NDhTSFNQaXh5TDY5YUJTYzhyVmdR?=
 =?utf-8?B?UFhlbEhZMStKdllyYytpTEpLRDVWWm85d1JjUkFBYWN2dGcyOCt2VDJDY3ZE?=
 =?utf-8?B?cnVjczJya1d0SHo0T2RFRTE2NFZYV3owVExTWkZDMXpUMHdWSEZmYUxPS0Q1?=
 =?utf-8?B?OFBBc0R4SjZQdlp2YUxwaVFjQmx4OU82UDFKamJ4RE82K09pN0lneEU4ZWE1?=
 =?utf-8?B?bmYzTFBKZXZ6RHBxTldDbDl6RkQvWjRBb3JWVWFkdUZhVzc2enVwdmowYWlV?=
 =?utf-8?B?cEcvclp2ODVvUmoxRzJGSi81dE01cDk3bnRnV0FCc2VWYnlyWDMwbGp4dlFO?=
 =?utf-8?B?R05MQnlyMVRxemlLbjhhME1EWWc5MEZIZ0Rmb2NISElIaFJoUmJWRTJiRkw1?=
 =?utf-8?B?T29kc05tYmxJWStwdWhydzNVZFhCbHA5ZW9jODRyOXpBcUw3T0pnWkxqMGtK?=
 =?utf-8?B?TTljZ1hnR0UzUmNpS0dWeTYrOGR6VE1ENkNOdjJNUGJoeUN4NHF4M25uM2xS?=
 =?utf-8?B?Ri9IMDk1R2hVT3RXeDhPalMxVnpBNVZPdkhteGRDMHpCRW5PNnUrVm83QnRi?=
 =?utf-8?B?WDcwZG5GWGNRZkNlUk4wVEFrQVYrbS9mNXN5UFRaSGNkTXJqRXY1bzJPamZj?=
 =?utf-8?B?aUIrZ0VCS3p2T2hKeFIrYkRGc3FLbEYxOE92Zm1aOTVxeGxEaGNSb2ZTQmpG?=
 =?utf-8?Q?irKXhLTItVIKU9AIqm2PwGhaNDsb3H0B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ditRNFpXY1lXNFRCL1g0QTJMRUdheElycnptSlA3NDBXczZ1OU12dTVzcFpv?=
 =?utf-8?B?bDdZS0tYcnF6YXE5UDlBNXlSUTBYRVpzajhxRjlDaUZ5am04SnRWeTQ3MnJa?=
 =?utf-8?B?a1Bnc0F1WE9XbnUxMUxDd2VPUE5FRk12MXhld0RVOHV4MkFRUHZWMElkUEVz?=
 =?utf-8?B?VTd1ODJvMTF5TUdySm1od3Q4K3pYeUljWjZNSitWWE9zMWJJeWkwZFJvb1JC?=
 =?utf-8?B?OWxxMHFZQ05RRHgvNTdxSC9xeUliL09vU0laVXdxWnBpOVV3R1MydUhCNkJQ?=
 =?utf-8?B?cXNIcHlkOU5NRG45bjZacEIxVTdpVnlKZkJpZmxGNXFJVk8xRFY2VitnVS83?=
 =?utf-8?B?UCtZcE9KUlZhRTdsZUZMM050aEVYcyt5ZnZBY2swMHRuVEJkWEVVNW5BeHFN?=
 =?utf-8?B?bzhGSzkwTjhaUjBoL2ZtOEU5cDl4SW5hUGt4QWNXYUxCZFp1NDhqOUpteEU4?=
 =?utf-8?B?OFBEaGlVRzlBYkIwaDJ4eDEzMXRIc3Myay91RGFlZ2VQQ0g0bElVeVRCbDd2?=
 =?utf-8?B?Wko3VUZnZnJBV3AwMzRDQnNSV0xDUjh4d3RmZlB4ZDhxQ294MUI3REtUWXY0?=
 =?utf-8?B?YzJ0R1YyQ0tQZ3l3anlpOWVNRlQrYlAralZhTStxKzc1OXVFWTBSSFlQaTM3?=
 =?utf-8?B?V3NpM0d3alYrTll2YStqVG5XMU9NcTF4SUVRZ3FCbnhudVhaRnFXWVhiK3E0?=
 =?utf-8?B?SDVZck8wai9raVpaRTdScmx2QldxS3pWK21FSVRPSEFIVjJSQ1kvUFh4RzFj?=
 =?utf-8?B?elFYMm1EVkxVSjBKcDNYb0tNUjJwNHhNUWF3NThkK1BqUnJLRyt0SG81ZGd3?=
 =?utf-8?B?YlVtdklWODBJTkYxREQzaExCVlBEU3lEcVNJd1NZT0U2YVlKUlZuS3dxdzBZ?=
 =?utf-8?B?c3VYWW9aWE9IcktGSi80aEdTS3BFWG12Yk41YXJjR1Y4R2pydUh1d3BrUm96?=
 =?utf-8?B?bHg0M2lrczlaSFFXOTBUcEJqM3pOZzVlaVZxZGRxdGptbFlPbVk5czZnOXJ2?=
 =?utf-8?B?RnE0UE5sRG16SUNpRmdsSWxiVElvalc0eHUyaWY5Q2JjSHdXWGx5NFBpenBu?=
 =?utf-8?B?cWJVcHFMa1huSWg2ZEhxZ2tUVEk5N21NTDg3RTAxQnBxWGlYRDRuZXl3UlJJ?=
 =?utf-8?B?ei9CQnlMT1hkNXI5TWdBQlE0L3VxV0Nva3BybExCRGlLZE5Hdm9CTEJibS8r?=
 =?utf-8?B?NjhHL1RNTXFiaHRZaGovREg2aXBhSmh1ZXp5U0k2MHptdFZTTGVrb2FCTDJi?=
 =?utf-8?B?RXJTbks4YThOQzY1MGl2SFNPSHdSdURkSkVaZkpaSThxcU95Q1pHb2xXNmRJ?=
 =?utf-8?B?b29pSGFDYk1VQ0wyZFhoL3I4bE9RREI0ZXA3WGtmdmZ6Z001MEhZQTQ5emVH?=
 =?utf-8?B?RGtsWkVKa2hkTlhSUXVwMDc0bU1rYm5wdHBMNFExMXdjeW55aUhjRTlrdVVP?=
 =?utf-8?B?RkJnVTRzampDbjcyYjdCM1lWRXZqY0JFY2hNZVFkaktLSldSYkRvbnVlY2Nv?=
 =?utf-8?B?aVlKS0RUNjkxMFpVWmY4ZEVtTWd6Q1orUml6WDRvSWptVUV0a0FlTy95cldJ?=
 =?utf-8?B?WXNYNFQvQUJ6RzNjKzE3Mytwc0NINjEzZU1BSUVHT2cyTzhzbUdCVjJuNnBZ?=
 =?utf-8?B?Wm5kZ214dnJFa1FZRm5BSTVTWnU3dllvZ2tickJDVEVRYVpFUENleDdscE9X?=
 =?utf-8?B?QlRrK2FHN2NBZGlTYStiVGRoNkR5MW53QW42Y252YXcwVmR6L1JTa3VnQkpH?=
 =?utf-8?B?Y0JYUU9YOE5pYmJDc0NTL2lxVERGajVaZGIzeWpsQ3dPdmVYMXZxRkxTM1kz?=
 =?utf-8?B?R1ZkZjVkNXloM0xENUFybXZ6YVNrKzNJMXJuOHdEU0RmeFY0YWNGSUo3bFFY?=
 =?utf-8?B?WnBWZVo0NzZlU1BRM1QvYkREZThId0pweE02ZlBUTHdHcFlqdzMxRGNRekJJ?=
 =?utf-8?B?MWFKSXFXbWMwUGU0aEFiV0EzUWVIb1RXTWJWalU3L1FmN0x1NmZUQ3BIRXJE?=
 =?utf-8?B?cVhDbHVKNlFLb2t2TG0rbDlOVWVsUVd6cldWRUs4bVo2enRMNmVuNjFZTGpX?=
 =?utf-8?B?S0dwaVlsVzltalFKNmM4S0lTampPaGRxSEJ0RVRjc2pJdWdURWNMdStZS2lw?=
 =?utf-8?Q?OQuuLxZOfU6WD51kp5Roq1TNZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e3b473-dc99-4d1f-1f40-08de178dbf7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 08:24:30.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRloijeMY42kthIEjbXtjvctMkPmYmC+5W1/znbRFJT1x6EQAw2/rw2mndXbjWZubY31XUZV30BhRRqNkeA7yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237

On Wed, Oct 29, 2025 at 08:06:36PM +0000, Teddy Astie wrote:
> Le 29/10/2025 à 19:55, Roger Pau Monné a écrit :
> > On Wed, Oct 29, 2025 at 06:26:14PM +0000, Teddy Astie wrote:
> >> Introduce a new flag to force the x2APIC enabled and preventing a
> >> guest from switching back LAPIC to xAPIC mode.
> >>
> >> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> >> architectural MSR of Intel specification.
> >>
> >> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> > 
> > Thanks, some initial comments below.
> > 
> >> ---
> >> This feature can be useful for various reasons, starting with SEV as
> >> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
> >> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
> >> boot unless x2APIC is initially enabled, even if it switches to
> >> x2apic afterward). It could also be interesting to reduce the attack
> >> surface of the hypervisor (by only exposing x2apic to the guest).
> >>
> >> As it can allow to have MMIO-less guest (using PVH), perhaps it can
> >> be enough for avoiding the problematic cases of virtualized INVLPGB
> >> (when we have it).
> >>
> >> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
> >> freezes for some reason, NetBSD doesn't support it (no x2apic support
> >> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
> >> with xAPIC.
> >>
> >> On Intel platforms, it would be better to expose the
> >> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
> >> guest, but it's non-trivial as it needs to be properly exposed
> >> through IA32_ARCH_CAPABILITIES which is currently passed-through.
> >>
> >>   docs/man/xl.cfg.5.pod.in              |  7 +++++++
> >>   tools/libs/light/libxl_types.idl      |  1 +
> >>   tools/libs/light/libxl_x86.c          |  4 ++++
> >>   tools/xl/xl_parse.c                   |  1 +
> >>   xen/arch/x86/domain.c                 |  2 +-
> >>   xen/arch/x86/hvm/hvm.c                |  2 ++
> >>   xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
> >>   xen/arch/x86/include/asm/domain.h     |  2 ++
> >>   xen/arch/x86/include/asm/hvm/domain.h |  3 +++
> >>   xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
> >>   10 files changed, 54 insertions(+), 3 deletions(-)
> > 
> > Seeing there are no changes to the ACPI tables exposed to the guest,
> > do we want to start exposing X2APIC MADT entries instead of the plain
> > APIC entries?
> > 
> > The ACPI spec seems to suggest that you can expose APIC entries for
> > APICs below 255, for compatibility reasons.  But given that we would
> > force the guest to use X2APIC mode it would certainly need to
> > understand how to process X2APIC MADT entries anyway.
> > 
> > Not sure it makes much of a difference, but wondering whether OSes
> > expect X2APIC MADT entries if the mode is locked to X2APIC.
> > 
> 
> In all OS I checked, they see x2APIC MADT entries as a different format 
> for LAPIC entries and don't really link it with whether x2APIC is used 
> or not.
> 
> But I think it's safe to assume all OS that supports x2APIC has support 
> for x2APIC MADT entries, which could make ACPI table generation simpler 
> (especially for dealing with LAPIC IDs over 255)
> 
> >>
> >> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> >> index ad1553c5e9..01b41d93c0 100644
> >> --- a/docs/man/xl.cfg.5.pod.in
> >> +++ b/docs/man/xl.cfg.5.pod.in
> >> @@ -3198,6 +3198,13 @@ option.
> >>   
> >>   If using this option is necessary to fix an issue, please report a bug.
> >>   
> >> +=item B<force_x2apic=BOOLEAN>
> >> +
> >> +Force the LAPIC in x2APIC mode and prevent the guest from disabling
> >> +it or switching to xAPIC mode.
> >> +
> >> +This option is disabled by default.
> >> +
> >>   =back
> >>   
> >>   =head1 SEE ALSO
> >> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> >> index d64a573ff3..b95278007e 100644
> >> --- a/tools/libs/light/libxl_types.idl
> >> +++ b/tools/libs/light/libxl_types.idl
> >> @@ -738,6 +738,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >>                                  ("arm_sci", libxl_arm_sci),
> >>                                 ])),
> >>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> >> +                               ("force_x2apic", libxl_defbool)
> > 
> > This addition needs a new define in libxl.h to signal it's presence,
> > see LIBXL_HAVE_* defines in there.
> > 
> 
> Something like LIBXL_HAVE_FORCE_X2APIC ?

Yes, something like that.  Not sure we want to add X86 somewhere in
there, but X2APIC is already x86-specific so unlikely to have any
meaning for other arches.

> >>                                 ])),
> >>       # Alternate p2m is not bound to any architecture or guest type, as it is
> >>       # supported by x86 HVM and ARM support is planned.
> >> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> >> index 60d4e8661c..2e0205d2a2 100644
> >> --- a/tools/libs/light/libxl_x86.c
> >> +++ b/tools/libs/light/libxl_x86.c
> >> @@ -26,6 +26,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>       if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
> >>           config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
> >>   
> >> +    if (libxl_defbool_val(d_config->b_info.arch_x86.force_x2apic))
> >> +        config->arch.misc_flags |= XEN_X86_FORCE_X2APIC;
> >> +
> >>       if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
> >>               LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n");
> >>               return ERROR_FAIL;
> >> @@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >>   {
> >>       libxl_defbool_setdefault(&b_info->acpi, true);
> >>       libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> >> +    libxl_defbool_setdefault(&b_info->arch_x86.force_x2apic, false);
> >>       libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
> >>   
> >>       if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
> >> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> >> index af86d3186d..d84ab7c823 100644
> >> --- a/tools/xl/xl_parse.c
> >> +++ b/tools/xl/xl_parse.c
> >> @@ -3041,6 +3041,7 @@ skip_usbdev:
> >>                       "If it fixes an issue you are having please report to "
> >>                       "xen-devel@lists.xenproject.org.\n");
> >>   
> >> +    xlu_cfg_get_defbool(config, "force_x2apic", &b_info->arch_x86.force_x2apic, 0);
> >>       xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> >>   
> >>       xlu_cfg_destroy(config);
> >> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> >> index 19fd86ce88..02f650a614 100644
> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -704,7 +704,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >>           return -EINVAL;
> >>       }
> >>   
> >> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> >> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED | XEN_X86_FORCE_X2APIC) )
> >>       {
> >>           dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
> >>                   config->arch.misc_flags);
> >> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> >> index 0c60faa39d..73cbac0f22 100644
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -616,6 +616,8 @@ int hvm_domain_initialise(struct domain *d,
> >>       INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
> >>       INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
> >>   
> >> +    d->arch.hvm.force_x2apic = config->arch.misc_flags & XEN_X86_FORCE_X2APIC;
> >> +
> >>       rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
> >>       if ( rc )
> >>           goto fail;
> >> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> >> index 993e972cd7..ae8df70d2e 100644
> >> --- a/xen/arch/x86/hvm/vlapic.c
> >> +++ b/xen/arch/x86/hvm/vlapic.c
> >> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> >>       if ( !has_vlapic(v->domain) )
> >>           return X86EMUL_EXCEPTION;
> >>   
> >> +    if ( has_force_x2apic(v->domain) )
> >> +    {
> >> +        /*
> >> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STATUS:
> >> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
> >> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
> >> +        */
> >> +        if ( !(val & APIC_BASE_EXTD) )
> >> +        {
> >> +            gprintk(XENLOG_WARNING, "tried to disable x2APIC while forced on\n");
> >> +            return X86EMUL_EXCEPTION;
> >> +        }
> >> +    }
> >> +
> >>       /* Attempting to set reserved bits? */
> >>       if ( val & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP |
> >>                    (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
> >> @@ -1474,7 +1488,14 @@ void vlapic_reset(struct vlapic *vlapic)
> >>       if ( v->vcpu_id == 0 )
> >>           vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
> >>   
> >> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> >> +    if ( has_force_x2apic(v->domain) )
> >> +    {
> >> +        vlapic->hw.apic_base_msr |= APIC_BASE_EXTD;
> >> +        set_x2apic_id(vlapic);
> >> +    }
> >> +    else
> >> +        vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> >> +
> >>       vlapic_do_init(vlapic);
> >>   }
> >>   
> >> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> >> index 5df8c78253..771992d156 100644
> >> --- a/xen/arch/x86/include/asm/domain.h
> >> +++ b/xen/arch/x86/include/asm/domain.h
> >> @@ -509,6 +509,8 @@ struct arch_domain
> >>   #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
> >>   #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
> >>   
> >> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)
> >> +
> >>   #define gdt_ldt_pt_idx(v) \
> >>         ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
> >>   #define pv_gdt_ptes(v) \
> >> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> >> index 333501d5f2..b56fa08b73 100644
> >> --- a/xen/arch/x86/include/asm/hvm/domain.h
> >> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> >> @@ -108,6 +108,9 @@ struct hvm_domain {
> >>       /* Compatibility setting for a bug in x2APIC LDR */
> >>       bool bug_x2apic_ldr_vcpu_id;
> >>   
> >> +    /* LAPIC is forced in x2APIC mode */
> >> +    bool force_x2apic;
> > 
> > This should be a field in the vlapic struct, but seeing this I wonder
> > whether we want to virtualize MSR_IA32_XAPIC_DISABLE_STATUS MSR and
> > set the bit there.  This would also help with migrating the option, as
> > you could then migrate the "locked" status easily by just migrating
> > the contents of the MSR_IA32_XAPIC_DISABLE_STATUS MSR.
> > 
> 
> One issue with MSR_IA32_XAPIC_DISABLE_STATUS is that it is only 
> meaningful on Intel platforms (unless we also virtualize it on AMD ?), 
> and I haven't found a AMD-specific mecanism for exposing it.
> Most operating systems don't try to disable x2apic (unless told to do 
> it) if it is initially enabled ("enabled by firmware").

Yeah, I see the availability of MSR_IA32_XAPIC_DISABLE_STATUS is
exposed in MSR_ARCH_CAPABILITIES, which is only present on Intel
platforms.

I also haven't been able to find a way to expose the APIC is locked to
x2apic mode in any AMD manuals, which is a shame.

For Intel we should expose this when possible in
MSR_IA32_XAPIC_DISABLE_STATUS.  And we need to migrate the selection
in the stream as part of the APIC data.

Thanks, Roger.

