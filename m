Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220EA7724C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 03:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933346.1335319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGL-0006qU-5T; Tue, 01 Apr 2025 01:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933346.1335319; Tue, 01 Apr 2025 01:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGL-0006nS-1Z; Tue, 01 Apr 2025 01:17:57 +0000
Received: by outflank-mailman (input) for mailman id 933346;
 Tue, 01 Apr 2025 01:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZL1=WT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tzQGJ-0006nG-Mu
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 01:17:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2607::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22de69c2-0e97-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 03:17:54 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB6703.eurprd03.prod.outlook.com
 (2603:10a6:102:ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 01:17:51 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 01:17:51 +0000
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
X-Inumbo-ID: 22de69c2-0e97-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krPtipCaeTQe3o6Aa6BAQZXGn4MZtVUHmI/6vlqF75AcelczLAHAPNcmA/tbWkRBEYnpCXJPQPHxl5i5VfR5XRGzi7EAjrSCG1mrfxWkwPS8to+4waoAl7fDJ5+7aOiH4KnOyXavo+qJpRcnYpREHvr2+OKM8Kc0uL8UucXr/ynIp7sbN3dJ2choa9dstwcNUSiFHerzGfHi1aY/iJmJVKUKjJIr0SuDoHX+Z5ascPlEecolExIt1WXATj8Pa2Qes8U+iQ+K1fAb1Kj2WyEJH0l4tl1UOXyVWO3b+mbpgyfxNx1ZIN9As0Rvl0v9jjl5zGLRqmJUWlb0nWwuA1CZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhyzxsWIAx4f3eaDtm+eA6M5Z//uPe+FE4Q+ivR65Rk=;
 b=aS+cLPNyo5DrJyY/VbLfDjAxmS+rfD7HAHbp6z2inJGCAmrfRqlPQUmeDQGj1qg/fJPtOj1Vh8skdKKbjpT9U6i6Mpr3+6XsfGGmq7ZuX3YdddWmfl+jvwdy942DFYQyBt3P014zrPEQ2zWk5IB66Ackpq12PZ+bJ4GptCEMR7yVD0DbPuQAA5yzvLFf47qd3N3t4A5fz+KzWEb9QmJryrXz2vCl9gl9CSsvZ1eTDaK7x0k3YqrFPFs4iXPdVTSA8l7mz3jZSrjNjMxUssjupITNEywYE/p4xA46MCi0Ur3SN7ltwuZuIx4nCKctAUgE9ezFWLGEPPDsqKr+a1v6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhyzxsWIAx4f3eaDtm+eA6M5Z//uPe+FE4Q+ivR65Rk=;
 b=uAtOp/jllX5v/zw12/fcS5WbJMkohe/ib/DEv+DEoSHLdC2ScfDSa2ss4O/IpWOUQVYC78QNrATH81Oukj2KYWOtTncmvztHpmKh1tAlxKjmCx8rPmiorn89HOPzV2QpX7I/9ptUoNqPCEc3GdnNcS4Y86StY98l8dgiCY/OkCEvlxOWeA6gM9X0WZreHlAAv6wkf5NLMFkw1peyX6GxsmUrCTV+6QSTP6JSi9UmKB+GFU23399R3pW9Avr76Zsio83+ALLNd91qqA2pKxyL3OvrcSz6BwUZTGH15YO9816E/eCJXc35TCmFKS8y59UJkBfeHfFWrZg5EVneH9Expg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] Enable MC/DC support for GCC/GCOV
Thread-Topic: [PATCH v3 0/3] Enable MC/DC support for GCC/GCOV
Thread-Index: AQHboqPid7iD1Q3Hzke/JMt84+VW+w==
Date: Tue, 1 Apr 2025 01:17:50 +0000
Message-ID: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 9a83d28b-c600-424f-4efd-08dd70bb057f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?enpvd3p5RnFjK1ZTUnpkUDBJYkxWNmVlaHovUjFYUktlcVAyY0xPQjdKS2Qy?=
 =?utf-8?B?Nk5IdENRVnp6aDN6NEVtOElVdm1rcDdUVjZlOWZORFVheGlEeGRDVHFCUjhS?=
 =?utf-8?B?SGFtQWdZZDh5ZU8zWmxsZVBVV3ExMUdMaGE5NmRaQkZBREpBSVRweEppYk4v?=
 =?utf-8?B?TzBWK3N1bE1OczZ5NjI2c3pTSlI4RlBVVEdZMHUzejJTc3EwT1dJdW0vWXBO?=
 =?utf-8?B?dXJ6NTBucEpyMGp2dlBneEVnZHlaY2IreW5uYi9QZUdyc3ZIZHZKcmM2TTU1?=
 =?utf-8?B?R0g3QVJEb0hiKzUzcDJjNDQrbVE4eVhDbkU3aWVLSFcvNVZya3pXMVN0TDZX?=
 =?utf-8?B?K3p0S0JsR1dSSTF2WU1lYWRhUjRVS2NnY3I3N3pWY2dUZHB4aFo5ekxuZnVh?=
 =?utf-8?B?K2xVak96REJObHpodHFPQko4R3djcndpeWVZNHFaSHVRaWhLanFRV1M0RU5j?=
 =?utf-8?B?eE4vNHA1TVdDMjUxZ2dNMG84QTRSZE5oazNqcFZacGdKUThRZ2dWcmpSeHBv?=
 =?utf-8?B?NGw2TnFtNVVNNGQ1bGMwSVBXQUQvajA5LzlVM0tIOVA5M0hkMWxnUVFXUmp4?=
 =?utf-8?B?aTdsT3FIUkxQUFl0SHk3bDc5MU9qeUdGcFF6bXAwVGZGUURpMlpHcmEwaTJZ?=
 =?utf-8?B?b2lTRFUxNDhGbXIwWndRYnV5Z1FxYmswNTZUOUU0a20zYSttWkwvUXFTekJK?=
 =?utf-8?B?bC8wa2p0SGdaZ1VHWWpxVDM3WGNOS01HUEhYeTZCZmFzY2t1QUVDT1AxTEFS?=
 =?utf-8?B?YzZKT3BrRHVmL2pyME9sK2NQd0tUNFNxWjZaK2ZQbkZpSTVqR1IvSGlSNFo1?=
 =?utf-8?B?SFlkYkRPNGtuN3dWbkREZW5IbE5MWEtJWGVKN29HZjZibWxLVWhWa1VnNUJF?=
 =?utf-8?B?elNnSGw2WlVQMXptMk1GMlZTWFJnOVRmYm5VcitXOWwxcHluSEVGdHVKK3dC?=
 =?utf-8?B?eDNxWUt3a2UwOUMzTkY4ajdpRTdlL0RUQU51Y2drWGpEY3o2dFhiTG8yckZB?=
 =?utf-8?B?cElKRnJnc0IxOXdxRStGNFBqRm5FZEpNNWxObE9FMmlZbTBXb2R1ZmVYVmJ1?=
 =?utf-8?B?cDk5ckVWcjJKQnc5R2RGT3hFQ3pOeTlsTk05OFhtK29wNUR1YWRRUUpobjQv?=
 =?utf-8?B?QVAxR1hHUUlZaWU2TDk1SmtVWjE4aXk2OGNFS0hadktPMWhCNkRndDNuSG5J?=
 =?utf-8?B?RVk0cVF2KzIyNWttWVdiVHN1ZVJiUUVGdnlCZVZQZXlwdHFjaUdGYmVDWlN2?=
 =?utf-8?B?ZWRUQlRDckpWTzFyS0JJYXFNR25Jc3dORytPVUtJUGxlNDgwZE84YUNlNjhD?=
 =?utf-8?B?UjZKVUp1N3dEQWRLUG1PNHlDdzVaSTFDdm1IWFErRmNjUzZpNWxoR3RRcmhx?=
 =?utf-8?B?VUxKWnY1a1JaZW1KdUMzUWo1ZUJRZWd2elRHY0xyNUJCVUdCZTNsNmd5NmxL?=
 =?utf-8?B?eWE5RDRrWUVQQWwxMkZjMm1PZU1GQzlTbHVoNnVoeG5RK1dzTG1ZY0JOR1pY?=
 =?utf-8?B?VTBPeTBVcjlGRWo4clVXZU01Ty90ZXh5T2lzOWlkNkRNNEFlNjJvSWdBeWFp?=
 =?utf-8?B?NTVyTFdIMzM2RnhDTm5lWXQ3bkkyOGU5VE5uczUrUlU4U2xLckgwb0pUcnB4?=
 =?utf-8?B?dDhMV2o4d3NmbSt0bnFhOXBzUGVVTjBSeDdpdGdjbEM1MEpyZnE3M21VaHlk?=
 =?utf-8?B?VC85ejhGSlA0M1hkRVIyMnhlTDZ3ZFZTMUlDMFFrVFVkbnl4amk2L1N4dG1O?=
 =?utf-8?B?cE12WHR0UWgwMnllZTZRYi92OUIxT0w5dGxZb3JtcTFpbk02bHpFYytvUDdF?=
 =?utf-8?B?OTB0MXR6OHB2ZEJlMmNvdlowc3lSclBuODNQVHBSK2tvdHRCcC9MOWVSOWRi?=
 =?utf-8?B?Zmw1YnZSZ2VlcGY3SWRlMWlxZGlvMTdEVlUvVHVPRXZnZ3hFNVVEMjdzVWo4?=
 =?utf-8?Q?KbN0U/bJxtq9DrCEy6/2iSWIfD9Eb6mX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlUvMi8wZDF0bEpqSXZFNDMvcnc5UW1jbm5CcXE2czhYd0VtRkFVWEc4Z2U0?=
 =?utf-8?B?cU5lNHEySGZNaUs5eC9UL2dKNEF3ZHMzb3h6WFRsMlAwWUpRbDRTbkVwcGNR?=
 =?utf-8?B?aFRZbHBJdlJzNjhZQW0xS0FLR1JsRFBJOG9uZnphTU5lSmJBQyswSzFiR21Y?=
 =?utf-8?B?aHhwME03dzNEaVNXMUtiN3QydVJKSy9sdnZkeUpLYTh6SkE0ZXhBZ1FLakhU?=
 =?utf-8?B?L1BkNVMwT2ZSY2pwWDkrOXRpWVpEKzdhclBEdE55WVBweWM3b3EvTzQzYkc3?=
 =?utf-8?B?dTNRTlZTelpzQTR5bFpxbm0zemRPK1U5N1J3eVEwZXplVHAyL3ZzNm80YWt0?=
 =?utf-8?B?TVdMUm9ZSUkvOEwvcmc0WVFsWjVxWGdqL2syRUlqeExxMTZabVUzM3RibHBO?=
 =?utf-8?B?bmNRZy9jSTJPdnluRTYzbGIyaCtLVzE0NHRBWDhjbDZsRWo0eS85Qkx6WXl4?=
 =?utf-8?B?QnFnTXZqZUNSaXNPcDRKNVd2ajVYSHVIRWhoVXZHdUNzNjNzYWtGeCtTSG9o?=
 =?utf-8?B?WDBxYVdlNDRxeTRYZlRyeHFmZjdqakU2bmp5R0ZJcVM5V0VsYW9uNkRRUFZZ?=
 =?utf-8?B?UVArV0VrbzVzR0E2MWV5ZVNacHZQVTVEREQ5NDdaYmorVDdmQXh2dk00bjJP?=
 =?utf-8?B?bzVTOEY0NW9UbHNXQWQ0ZkV1SklyK01PQjk3MlFyTit3RDU4QjhNbzMyZVdr?=
 =?utf-8?B?R3E4dnYxM0l4WVhZYTJjZEdieHJiZm9HaWxON3hudjR5ajE5ZWZBZVE3dW9z?=
 =?utf-8?B?aEdiZ0xNNERSdVpheWsvdjFhUW1pSmN5bTYxUjhLTGIrdGNCSWsrUU0xaURk?=
 =?utf-8?B?NnBHRW9MeVR4SjNiQmxTNWVqZzZ0SGN4TWoyei9tUko1dmdQM2RicGtQd2w2?=
 =?utf-8?B?bWd0MC8zcE9xQ25lemRORTQ2OU5sa0RHem93SmMrWW54U0ZXNzJ4d295WGYw?=
 =?utf-8?B?anRWYkY4c3FmOFV3VHN0ZDBEY3ZMSE1sTGY4K0ZuSU1lL3RZUWl5STRMeWVZ?=
 =?utf-8?B?Q1FFdmtDRjlIeGhjWWE3b0xvSEFMdUJ0NjYydWYxNkZ1MDlkaWlycjhVeWhu?=
 =?utf-8?B?NmRITnFiR3VtN0FhbHhaOXdCL0NGZGczL2paWm81V1ZOSHBhTVZUekxxcitI?=
 =?utf-8?B?aElpUmJ3OHVNNlR5dkFCd210OFdRVUdSbmx4SDRjc2tWc1lLY3QxOXp1bE9W?=
 =?utf-8?B?dzRIU2pidEFlejVKVTlLa0VnZVI3M0VvZTZBbWFCQ2lLdDdMeDRCSVAyNEJq?=
 =?utf-8?B?b01weGNCZ1E0YThLN21BVm9HUGo0OEh2YU9zbSs0WndnYmpYNXIxSUQ2NCtY?=
 =?utf-8?B?aGVBanNqa1pTMDRRbVNWMGZpUHJ5eHdCejI0SFgvZkxJYUZMODhwRE0rdTdZ?=
 =?utf-8?B?MGJEbXRjRWw0S3RiVWg3cGRYVFFPVTMvQzhQNjlJR2pndjhhbUgwUHpybWZR?=
 =?utf-8?B?ZEVQV3B4aHlKVnhiTGNLUlRRY3p0Q0JpczNORXJrdVJBcTBLTEhsNnNXY3Bv?=
 =?utf-8?B?NW96RHBLRUVORS8yZkdtQWZVblU1VU1GNDR2cTMrZUVEaTc3YjkzT0pLVC9t?=
 =?utf-8?B?ZTc2UGRLc1dPM1lBWjN1TmpSaGl0Qk4yNnBQcE1xOXRCU0p5QXBBVktLUzV6?=
 =?utf-8?B?ODE2QVJBaWxuMXdGdVBQS0ZqUDRTaUhLb0N6bDRRY1pZUFUxM1BabFhPcmVQ?=
 =?utf-8?B?ZWVpOXZhZlBHcElUSGRwNDBBWXZWZ2xnS21xTlhPb3g5d0JUN2RJa2MzZkox?=
 =?utf-8?B?ZFZMdndKSEsrdm1SZjhaL0o4QVFhY1lwdzZGNkVsWXNhaTV6RytacTZQVUhI?=
 =?utf-8?B?QWloSi9BdUhHS2hvOTdlNlZNQVFsVTJzb25SWjgzR3haK3Y2WWdFK2NsSy9z?=
 =?utf-8?B?VmZHQUNWT2RYbk9sQW4ydnN1ZlBUS0I2Z1lvWnNqalo4SnozT05oc2tsNE5x?=
 =?utf-8?B?THF2TFZvV2UrNjJjd2FUZUhuVC9mNDJoRlZUaHgwaHRVWm5ZUzRIN09lWHRy?=
 =?utf-8?B?eThFZnJsOWlJQUlSallhS1piQjJvaG1WRmFDOVhWNmhoS25LZkpqTEcxVVZO?=
 =?utf-8?B?TGpFVTRvamN5a1Y0STNHRmx2VllRMXZXZm5YakNveTdvSzdZVXpGekFkK3NO?=
 =?utf-8?B?YmxKQldGVFdMR3FlVmp1SkZnZ3lBeW1WRjg5NmdPbW8xRks5Vm41cnVyUjJp?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F705019BDA75DC42821A70E66C08E4DB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83d28b-c600-424f-4efd-08dd70bb057f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:17:50.9762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWEL2Sbyy0GBjSjUC7X1pB4DYDLjlWCD5lqYrOpevf8wJhJ+J/cbwi1mpcjoo8S5CDAF1rqZeaVL3U9rb2aNA0daIkXsBVYoGw+wM/eTdIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703

VGhpcyBzZXJpZXMgZW5hYmxlcyBNQy9EQyBmb3IgWGVuIHdoZW4gYnVpbGRpbmcgd2l0aCBHQ0Mu
DQoNCkNvbmRpdGlvbiBjb3ZlcmFnZSwgYWxzbyBrbm93biBhcyBNQy9EQyAobW9kaWZpZWQgY29u
ZGl0aW9uL2RlY2lzaW9uDQpjb3ZlcmFnZSkgaXMgYSBjb3ZlcmFnZSBtZXRyaWMgdGhhdCB0cmFj
a3Mgc2VwYXJhdGUgb3V0Y29tZXMgaW4NCmJvb2xlYW4gZXhwcmVzc2lvbnMuIFRoaXMgbWV0cmlj
IGlzIHVzZWQgaW4gY3JpdGljYWwgc29mdHdhcmUNCmNvbXBvbmVudHMsIHNvIGl0IG5hdHVyYWwg
dG8gY29sbGVjdCBpdCBmb3IgWGVuLg0KDQpTZWNvbmQgcGF0Y2ggaW4gdGhlIHNlcmllcyAoInhl
bjogeDg2OiBpcnE6IHVzZSBkby13aGlsZSBsb29wIGluDQpjcmVhdGVfaXJxKCkiKSBkZWFscyB3
aXRoIHVuZXhwZWN0ZWQgR0NDIGlzc3VlLiBBcyB3YXMgZGlzY3Vzc2VkIGluDQp0aGUgcHJldmlv
dXMgdmVyc2lvbiwgSSBjaGFuZ2VkICJmb3IiIGxvb3AgdG8gImRvIHt9IHdoaWxlIi4NCg0KVGhp
cyBzZXJpZXMgc3VwcG9ydCBvbmx5IEdDQywgYWx0aG91Z2ggQ2xhbmcsIHN0YXJ0aW5nIHdpdGgg
Y2xhbmcgMTguDQpzdXBwb3J0cyBzaW1pbGFyIGZlYXR1cmUuIEJ1dCBDbGFuZyAxOCB1c2VzIHJh
dyBwcm9maWxpbmcgZm9ybWF0DQp2ZXJzaW9uIDEwLCB3aGlsZSBYZW4gc3VwcG9ydHMgb25seSB2
ZXJzaW9uIDQsIGFuZCB0aGVyZSBhcmUgcXVpdGUNCnN1YnN0YW50aWFsIGNoYW5nZXMgaW4gaGVh
ZGVycyBhbmQgc3RydWN0dXJlcywgc28gYWRkaW5nIG5ldyB2ZXJzaW9uDQpmb3JtYXQgaXMgbm9u
LXRyaXZpYWwuIEFsc28sIFhlbiBidWlsdCBmb3IgYWFyY2g2NCB3aXRoIGNsYW5nIDE5LjEuMTcN
CmFuZCBjb2RlIGNvdmVyYWdlIGVuYWJsZWQsIGNvbXBsZXRlbHkgaGFuZ3MgdXAgZHVyaW5nIGJv
b3QsIHNvIHRoZXJlDQppcyBjbGVhcmx5IG1vcmUgd29yayByZXF1aXJlZC4NCg0KQW5vdGhlciBw
cm9ibGVtIHdpdGggY2xhbmctYmFzZWQgTUMvREMgc3VwcG9ydCBpcyB0aGF0IGl0IGhhcyBtdWx0
aXBsZQ0KaXNzdWVzIHdoaWNoIHdpbGwgcHJldmVudCB1c2UgaXQgaW4gYSBtZWFuaW5nZnVsbCB3
YXk6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXM/cT1pcyUz
QWlzc3VlJTIwc3RhdGUlM0FvcGVuJTIwTUMlMkZEQw0KDQpCdXQgYXQgbGVhc3Qgd2UgY2FuIGhh
dmUgTUMvREMgd2l0aCBHQ09WLg0KDQpDaGFuZ2VzIGluIHYzOg0KIC0gQ2hlY2sgaWYgZ2NjIGFj
Y2VwdHMgLWZjb25kaXRpb24tY292ZXJhZ2UNCiAtIENsYXJpZnkgd2h5IHdlIHVzZSBkbyB7IH0g
bG9vcA0KIC0gQWRkIEphbidzIFItYiB0YWcgZm9yIFBBVENIIDEvMw0KDQpDaGFuZ2VzIGluIHYy
Og0KIC0gQ2hlY2sgZm9yIGdjYyAxNCwgbm90IGdjYyAxNC4xDQogLSBSZXdvcmtlZCBpcnEuYyBw
YXRjaA0KDQoNClZvbG9keW15ciBCYWJjaHVrICgzKToNCiAgeGVuOiBnY292OiBhZGQgc3VwcG9y
dCBmb3IgZ2NjIDE0DQogIHhlbjogeDg2OiBpcnE6IHVzZSBkby13aGlsZSBsb29wIGluIGNyZWF0
ZV9pcnEoKQ0KICB4ZW46IGRlYnVnOiBnY292OiBhZGQgY29uZGl0aW9uIGNvdmVyYWdlIHN1cHBv
cnQNCg0KIHhlbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysrKw0KIHhlbi9L
Y29uZmlnLmRlYnVnICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysNCiB4ZW4vUnVsZXMubWsg
ICAgICAgICAgICAgICAgICAgIHwgIDMgKysrDQogeGVuL2FyY2gveDg2L2lycS5jICAgICAgICAg
ICAgICB8IDE3ICsrKysrKysrKysrKystLS0tDQogeGVuL2NvbW1vbi9jb3ZlcmFnZS9nY2NfNF83
LmMgICB8ICA0ICsrKy0NCiB4ZW4vY29tbW9uL2NvdmVyYWdlL2djb3ZfYmFzZS5jIHwgIDUgKysr
KysNCiA2IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoN
Ci0tIA0KMi40OC4xDQo=

