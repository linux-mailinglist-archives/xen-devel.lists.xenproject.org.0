Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F1CFFE74
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 21:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197193.1514809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZjn-0003Ov-CZ; Wed, 07 Jan 2026 20:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197193.1514809; Wed, 07 Jan 2026 20:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZjn-0003MQ-9k; Wed, 07 Jan 2026 20:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1197193;
 Wed, 07 Jan 2026 20:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdZjm-0003Ki-2h
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 20:02:34 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccbeac17-ec03-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 21:02:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5251.namprd03.prod.outlook.com (2603:10b6:a03:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:02:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 20:02:28 +0000
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
X-Inumbo-ID: ccbeac17-ec03-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsTxTBwzVhxj0G/zPiq6MeI7UqjHEOlJC11czgQR/SmwvtTCogCvQ3dCtHoyfX9TTg43bFn1qj36sG6GeJNiCqfG7llAo81ZoPrUngoZOlpowj4vlCNfPWPqTwf3pXNhYicGcsGA5JD047Z70CsIIP4a3HT7njYSQNkCWOyFhPHtjtShk4B0FsoFrvD34VBxQx5ztnK4SydQqzaKEmKJLXoMe5O3RzAhCfZg9wgW+IDGH2NYKAv4vB3KNVMi/A8hOdtat+FVpoVA+WGrVhlggoV8Ae32Db8bnT3w7G/ZPfzU1t1VIC+OrdMR1jHW8GttdD44K2IkZUY1kzsrKJ4CJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtO4dyY2bk0OojaSqZIHZkJptRIqFJUH8tYD5NasuEU=;
 b=OOU4SbIzhXitcBGGMEi6+GiJmxZjSbl4tor10BYvYcmF/q7znTrtLtFzw9O8jJ6f2CS2Ki76l7Lshj/7qPHwkYRI4SUqy86p/ptgrZ9bvasABJnDXiyHr7KsHDl3H1YLZha1zN88Z++Dc2cxLKnD2IpvakmJRypzy/ISeGcpWWldQosFVLKvkek8fkIuIdC5A8TdEHwxhFD0kI12WFsmhnYQgU8mljLr7PlLvrZa9C48YSH3G2JvTHQ95Vme3TF6TMK/yEEfhhL+MYVXogaXKT0fjgnr3bhwJf6R0GstsRgdnFaIkhFDn8H6aYVDhDTEkXp0YAZV/flvYi4+jVUf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtO4dyY2bk0OojaSqZIHZkJptRIqFJUH8tYD5NasuEU=;
 b=TzhuGcUzdwVGq207xHtNMgXPK8XyzGwoUKFTcyx5XbXoqfizulHAvs09UbQiprrk9e+EY+6gYOxycn5Vb/66iFZ59odHCQ/yvY5I0WqqMbq10tIrmuVc5PcqCXqfJIe/rjQp4b+gz/Smdm/3SbI1UbuCRQCHxiEhvjxda+M8gD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jan 2026 21:02:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v1 0/2] x86/pci: MMCFG improvements and always use it if
 available
Message-ID: <aV670JzTtDr_Gmbi@Mac.lan>
References: <cover.1767804090.git.teddy.astie@vates.tech>
 <aV6WPQlni-gkRCVo@Mac.lan>
 <104d15d0-9f58-403b-ac61-dc02f4a2e097@vates.tech>
 <61ca5e49-787f-4d99-b2cc-5e95d8160c39@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ca5e49-787f-4d99-b2cc-5e95d8160c39@citrix.com>
X-ClientProxiedBy: PAZP264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: 28560052-a8f6-4769-ca45-08de4e27aecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnNlRHBJSjBqaU5QS3BpcmFpdzB1VXYrRENRempOcWt4RXdoSHord0Yvc0VF?=
 =?utf-8?B?Sk92YUtwT2dqNGc4TzFIZ0FpRmxwV0g1RjByUXVBYUFCRVN3a1ZwaGc1a1U2?=
 =?utf-8?B?ajBYdU1lMDYyZG9LL3A3bU9YakJCK1d2UE1FWjdXcFBIQVJYd0k3VEdzVkow?=
 =?utf-8?B?VGNCTkN5VElPVVdJalRDcnFWa0l4WlhXNlN6V3VqRDRVODBsYjVRK3l3R0Yz?=
 =?utf-8?B?U1JtQmVUVURtR1p6NGtIaUpUN2NRKzFJQWF5WGJ2ZThHT0xGWnpHZ0F6YllK?=
 =?utf-8?B?VFVJamg0OHc3RjF5bExad0xZM3ZrYTFkR3lmck5rSVhFbk5aT29DYytOemJ3?=
 =?utf-8?B?cks4RmtIbGtqTGJOR1FseHdtY2JNV21YV0xENG5mb291U1VaQ1ZEeGErY1hu?=
 =?utf-8?B?VzFRNFY0WDJNSHR3aS9CQVIwdE52NmVRVTVKbUhqZ0tMekhMbVQ4R1Q3UVJo?=
 =?utf-8?B?RFBKeUw1a1JvUTVZMytubjd0L0dXSXh1cm1XbmtCd1UzVjdWYTJYM29CZWRv?=
 =?utf-8?B?UVc5TFVxOEd3dWpQMHZKYXc0YXVER2dsZUdhRU5kaDFkY0V0Vmh4MXZNTjQ5?=
 =?utf-8?B?bHVnTHc5RGFpNUozM3JmMnhsQkRnTFVRb1hWb2hJUElkVVlDbWVJclFRMjRN?=
 =?utf-8?B?T21pS0ZrYXVaaXhSZXdZcVFBbkJseGdiMnMvblMrV2p0cU1aNDBwRVQzR1Zj?=
 =?utf-8?B?NDdnQy94SGZlbFFzb0JkaU1QcVROa0xvQzFZdFl6UFM2Z2FGdmljNmtqSG45?=
 =?utf-8?B?b2VIdWR0alJZZWxGZmFvYnNEZlJvQTNzZUNiUFhzVG5LeWZrV1hUMlowakxi?=
 =?utf-8?B?OEcycjU5RC82NWtXTzZ1a0EwWjYzWkFtTng0Y2VlblZzdjR4TG55NkI5YWhS?=
 =?utf-8?B?d1RqZFltZ0ptTllta1hVTE82UDVQSVdHd05TSGUwNVRjN1lOYnFzM3hlSGJv?=
 =?utf-8?B?THpydDlVdUlBWmZpUnV3clhIcXVTRUtYN0dYZXY2bVVJSVNsR1FjY3JaZGZC?=
 =?utf-8?B?UmdaM3p1MU5STEhtNUtJaS94dDgxRE5OMzZFN0IySHBtUFBpRHBENHp0NUpv?=
 =?utf-8?B?eUxpdmZLWXRPNGxnZ0E0ODZEWVZwMlhNNnpScE5CZkNQTjE1bUIzMnYrdWZR?=
 =?utf-8?B?ckpkdFRCMElKdEgxb3IzRnNZSTJBUEtRYWdNTDczSnowbEFrcEhGMFFwNzVB?=
 =?utf-8?B?UDBQTk1MenZCSnczZWY4MW9rdFZFa1hRbkVSWHJiUEg5YzBFeFJwZjdrYStu?=
 =?utf-8?B?akdXZW9TK1hMenFiTjJkbFRueGh0MFptcFQ5d00zUUtBMU9zbTlneXF2eWdk?=
 =?utf-8?B?WEE0KzB1RnI1OStMKzFnQ3hKalJLOW5aL1BTQmhEVmlaV0I1NENNSSs1by9B?=
 =?utf-8?B?Z0h1ZjRMWEFCSmw3cmxZRDNpQll2dTk4UWZubE5Sd1h1SFUxTGVPeCtGQ2d1?=
 =?utf-8?B?dXdJWDZHQVJlQk9BdzZLVEs4Q3RQQzJNQVA4RlFFUnk4NXJwODNKbVFxUGxl?=
 =?utf-8?B?UTRzVkluSFluVjlscDBrc1c3RUNISjJmL2xtd0RiNzFzNURPUE5oUlVWcVJ3?=
 =?utf-8?B?TC9McWF3L3lxQklETDFPYmFNM000QVhFenZub3kwYzhJNk8wSm0xZGdranhF?=
 =?utf-8?B?Z2JSeUdiSURIbStaTTJwSlp2RnZsd0tVY2djU2hHa2gveGFOUFlPbWpMTHdH?=
 =?utf-8?B?ZVFJT2tvdU9vWkxtb1F5ZklsRjhNRmlnU3h4ejFwbit5S1ptNVpDZGhOWEh1?=
 =?utf-8?B?MldrZXRrZUV0NVQvVU1UVzBsNm5zZGZkeUhLZVBkcU04UytXUE43TjBPMkxt?=
 =?utf-8?B?cjQ1VHdsbWxabkdOM21VNkwxZFJwSlVxVk1TZVFITDRlWHovQmExS3MwdXI4?=
 =?utf-8?B?c1ZuaG1HdnhmVG1OelduOXlNNkN2eks3TndUQ1ZUcWRvOGV3Y1ZXQVZtV2tR?=
 =?utf-8?B?OFRFanZVc0RLQ1Z4U0dLS3VPam9xMFBZMVVEMDN0MWt0SEZWdnlMUmY4RnFq?=
 =?utf-8?B?TFhNWENzOEVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5PUWpJenEwcUxRWmlsSWlqT2VuckM4cFJjT1RKNDRpZGlwbDZWdDVFKzY1?=
 =?utf-8?B?bHlDODAzUzc3WE5PV0lUcjB0WkNxcGliQU81aGhkR1R1aUZUY1hkZ2pJeC9Z?=
 =?utf-8?B?TU83V1d4cGlIR2FZT3NWemNyY2ZzNkRwb3I4Rmd6Ni9Lcklza3Jvbi9EdFlY?=
 =?utf-8?B?aktzWkt4OG5xNnMwejVtYVJjRVZoZGFIWm1ERVUra1YzMEhvRVJHSmVLb0Yx?=
 =?utf-8?B?cEU4S1M0SnRXSUFaTUp6dWdPUEYwTTNQeHJ3NFJzbW1HcG1uSWdsTlR3Wmtt?=
 =?utf-8?B?QjFKdzY3cFZqdStEeXU5TTd1L1ZpbFl0bVJRbW9ZeVhxNWFBU0xEK2VtcUN1?=
 =?utf-8?B?bHRhL2FtOC84S1VjZDczWmR6bnJUSGVZWXVtZFYwaWZ6a3VrSVp1RGV6ODlV?=
 =?utf-8?B?QjRsZEFsYkd3LzU3SDVMemtoVmFXOHJRSHg4Y3lPWmMwaFFlckxHZ2pnNUZp?=
 =?utf-8?B?Um03MmVTVmgwanMwSjg0MHZRR25hSzVTMnZBckwvMGczbFFLUDVsWHJtWVhj?=
 =?utf-8?B?MXhxb3BGVW1FMGpPR012eEdBRjRITTBTMEFpRWZhL3A3MW13V1JaODBDemM0?=
 =?utf-8?B?ejVPRW5xVVNUK1JNRGovOGxrK0c0b0VKeUZ2czN0emFvOUE0aXBiVHJDSWRN?=
 =?utf-8?B?QUJpKzU5Z2xVUzkrbFkwZkxianp4TGdNUFU1dGpONU15MkozZkdIV1k2SmJz?=
 =?utf-8?B?S0xabjk1M3k1ZGFNcHBCY2I5VExIVEtYa2p5TVpSN3hwRjcvZ0Y1OVNYTHVP?=
 =?utf-8?B?Qmd1Wjh1c3dUdzd2YUNoamVocVR6bFdkSzZCUGJleWplL29WYVREcURiR3FV?=
 =?utf-8?B?eVduWUxjYVJ5Rng2UlR3S0w4QmFEVi9yZE4zSHlRNmR3dEZBbURWUkZKbmQw?=
 =?utf-8?B?WVlWQ3VYU1JOLzhnUzcrSno4em5ERmhsYm9ZTmVZTVQycDVXai9rQzlJeGFr?=
 =?utf-8?B?NG84ZmI3NWppMnN5RE4yeTNqS3F3S2MxaS9zY1Ztek1HcHlmOUN1SnNnZ1B5?=
 =?utf-8?B?VGorNmE5WmlzWXlkcmVBSGxUUkIxYXJvZUd2ejdSOEdQR2lWakRYazg0UWJw?=
 =?utf-8?B?OTJPdGVTeWRBb2NIQVh1Z2dBdHpnYTUzVDVuQ1lvTmU0djV0SUtCdCtVaTR4?=
 =?utf-8?B?bHY4M2p6Rjg2a0gwYTg5cU1oMDE2YWw2Z2J3TFJDNVFCcXEwTUVGbEJpZ3l2?=
 =?utf-8?B?aGM1OWs2OVpvdDErcTlVNCtoSTgyNDA0U2ZSN2RQWk5zeW93VmlwRmc0c1BL?=
 =?utf-8?B?VGMzcEppcUxQcmlEUnFCM1kxdWxrdjJ3QmJQblpPQU4vd0piV3RLakxQem9k?=
 =?utf-8?B?TU8wNUxteXc5WVRUNUJDVHRrcytqbUhtb2NVVUVRNTVjVXRyRkFzR1JXMk5p?=
 =?utf-8?B?cCtkK2l3ZjcwMHZITVFCRjFFdXRDbVFPWkJWYjYyODN2cUxCTmJYMUVra0Fv?=
 =?utf-8?B?bVRFVVM1QnlCSUJzSDMwaURnTGJjMVdheHk2b0czZjJ3OFFGcDJ6QnlodEpH?=
 =?utf-8?B?Qld6eW54dWNBYUZmcWlaaG9RTjdjeHVHV3dZQ3RnUXR4WEhGWEl1VjdxNVFq?=
 =?utf-8?B?TVdMRWJscVppZ1NNbGJpRTFJWERVOXZJcDdJZGpzVG42YXBCNjh1bU5LcjRJ?=
 =?utf-8?B?TmpJMGJPQ3BJMXFDL1pCRE1lcSt6WUVFQmJrMmR2U2ZwNE1wVVUrMU9RdnV6?=
 =?utf-8?B?Rms2MitXaHl3cWVnNk1mZE8zVDF3N2g0a21nNEVobGdGTS9OZGF1ekZKd2FD?=
 =?utf-8?B?b0E4S1ZMRzk2eFYyNFJHZkxqNDVYZkczRmJPV0xndmVTbThBM1g5bHdJbFQz?=
 =?utf-8?B?dk9WVmdrb3VrZEIvZFpPdlRYeXZxYmtseW1tMG1OZ3hIUHBZRkI0L0twNHVP?=
 =?utf-8?B?R2tySVAvUGJUQXBEVTR6YVhPck5MUVpSaGI4L09hNUJRa2srRC9lYmVDeDhM?=
 =?utf-8?B?QjdpVFhodmZYenlsRHdSUDhRN2ZYa0FTcklScjJXVmpHeWZQQ05hTWluV2RJ?=
 =?utf-8?B?Qm9nWmtOV2IwRmdPVEI2dFhEWVlBVmNMalJKeFZrL2szbWpSenhqelBBSWpK?=
 =?utf-8?B?dWlyQVNsZ3Q1NXlUWXR0OU1zV21xVjlvanpsSU80bDIrSzNPQ29NNFhia3Yz?=
 =?utf-8?B?Yjk2SFEzSkorTEJDc0tXZXpFV3dpRkhhcWVKd3pTUW1XMDI4TnloZS9kYXdj?=
 =?utf-8?B?a29xc3ZyYnRNMVYvaFBwTE5HZS9DYk1Vd0pNT05UcGxaVUpzdWRZOUFTWkRu?=
 =?utf-8?B?Rk45QXhHMWF5K1BGeGdDU2RrMEJHanFYbC9mTHZuaUp6R0lDS284cGdmMnUw?=
 =?utf-8?B?d0ROTnVHZXpQT1QrQjBSSG8vQzM3cGxVQUZWQnlkSXZiZG9MM01NUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28560052-a8f6-4769-ca45-08de4e27aecc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:02:27.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W39a7ceGVSv3cSMNBJDJ5SPP2VrgEXpjnYhyfEcfixXG8Gz518xgz+MdOB1hoYjZ2iJ6X9zXdJA3ysFhInijJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5251

On Wed, Jan 07, 2026 at 06:07:56PM +0000, Andrew Cooper wrote:
> On 07/01/2026 5:58 pm, Teddy Astie wrote:
> > Le 07/01/2026 à 18:25, Roger Pau Monné a écrit :
> >> On Wed, Jan 07, 2026 at 04:54:55PM +0000, Teddy Astie wrote:
> >>> Currently, Xen uses legacy method to access the configuration space unless the
> >>> access cannot be made with it, where Xen fallbacks to MMCFG. This is not really
> >>> great, as MMCFG is more flexible and doesn't require a dedicated lock, so it would
> >>> be preferable to use it whenever possible.
> >>>
> >>> Teddy Astie (2):
> >>>    x86/pci: Improve pci_mmcfg_{read,write} error handling
> >>>    x86/pci: Prefer using mmcfg for accessing configuration space
> >> AFAICT Linux is using the same approach as Xen to perform PCI
> >> accesses.
> 
> I think you mean "Xen inherited it's PCI code from Linux". :)
> 
> >>   Registers below 256 on segment 0 are accessed using the
> >> legacy method (IO ports), while the extended space is accessed using
> >> MMCFG.  Do you know the reason for this?  I fear there might be
> >> legacy devices/bridges (or root complexes?) where MMCFG is not
> >> working as expected?
> >>
> > There is apparently a errata on some K8 chipset according to FreeBSD 
> > code that uses MMCFG whenever possible.
> >
> > https://github.com/freebsd/freebsd-src/blob/main/sys/amd64/pci/pci_cfgreg.c#L261-L277
> 
> Using MMCFG is *far* more efficient than IO ports, not least because we
> can avoid serialising accesses across the system.
> 
> If it really is only some K8's which were the problem then lets go the
> FreeBSD way.  Both Linux and Xen both talk about AMD Fam10h issues,
> which is the fact that early AMD CPUs only allow MMCFG accesses for
> MOV-EAX instructions.

Sorry if my previous reply made it look the opposite, I'm all fine
with switching to MMCFG by default, but we need the K8 workaround,
plus this needs to be noted in the commit message.

I wonder if we could use alternative calls to patch MMCFG only access
on capable systems, thus removing the check for the fallback legacy
access on such systems.

Thanks, Roger.

