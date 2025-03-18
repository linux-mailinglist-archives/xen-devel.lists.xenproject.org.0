Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C4A67816
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919375.1323867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZ2p-0005Mm-6l; Tue, 18 Mar 2025 15:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919375.1323867; Tue, 18 Mar 2025 15:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZ2p-0005K0-3L; Tue, 18 Mar 2025 15:39:55 +0000
Received: by outflank-mailman (input) for mailman id 919375;
 Tue, 18 Mar 2025 15:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/Yt=WF=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1tuZ2n-0005Ju-On
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:39:53 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on061d.outbound.protection.office365.us
 [2001:489a:2202:d::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b229381-040f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:39:51 +0100 (CET)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by BN0P110MB2068.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.32; Tue, 18 Mar
 2025 15:39:26 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%4]) with mapi id 15.20.8511.031; Tue, 18 Mar 2025
 15:39:26 +0000
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
X-Inumbo-ID: 3b229381-040f-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=b34jXU0JnZYACLsoA5De6RPujc9cdkUY+2bNfFip4ZvbUknPIIfhsus23XuJziKyYrGAcL7EJQWtwsWrBybhZr+C9m/lFRDanN234eMzRBpsbJIOSr0b9hd1POc8mWVnGVssxZ+5rD8rpdkhni1ljhIIpccYibceSwcEmxQxUE7vGnMZo4CZIwO9FxsJ7W19TqjV6iRM+c+pvT2LfHpaimMzvS6WwFsB1/Ge6YSMCOsFktz8p8OwfnqAPifGuCVcHj9H6eCiSPzDbpzO1ImSJwm5jEmDJnCDDoC9HjkTSCeExFuxhahKK94ygbgz4WZqqBYYsLEbWQA+1oalaaOqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3b561ubURSglaEGA8jGAZ/fGubCHDnLCjrFm1MgkQo=;
 b=EBxq7KbjnZDT2BXuTDUqKjBZp+3X1CZt0yyIZWNAp1i/98ptdTRrja5DAIqFNMmWNWudfLFKgbkSl38r9lijxCgnbqcK+8FX7/TfTnxgdt5/G9KxpekWe5vQeo+cuvEHp834X5WdIYfxQ3Ix0fvWfKSy7eg/1/XpVzfPQX9P4kZSXRknubswXDU+mWBpG+L5/G0CPYjFxzrUaQ5U5BH7P+04gBU/CDPvjndVomh1uPUe7FUQ4NEQd8qGIXjBsavv20eM0BBSM0DMHML4VAkZtusz4MVsu6KoGvTeLVbHcWEFFCCay+iomtj4LtW7p5jSrheu4urvEEyCb05r83raog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3b561ubURSglaEGA8jGAZ/fGubCHDnLCjrFm1MgkQo=;
 b=KTYb1/WejZnGV0cwHlKjqcegNPgyXM//T8u2T9prNIGxP2GtmHF3nT4TcsYTSkFpzKZ3BIPEheb7SoexVKHdToKxNd77TF/lKlL3kcRGrD3NFrZOPMJR/QRrZF4TBaXzHj8TaqERGXu4GgKntyCMsVGanJuJn5tPdT36nId5OkfPKT8w5PoFpq4yo8ao2aZImqtoMuueGkAgvXXQq5/aegxJUO5i1FjQQhdi0Sl5I3UTUdPhZdcM9mb8kpLeUEhZeZ+T0jYWXC6/eTg7AqwVG61wmhdlkpmIABxOkbm5PnnjhmzlxJaP2qIuUXwxtaUnYr+ZF5EApvZKfqXIzBSFAg==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart@stew.dk>
Subject: RE: [PATCH] arinc653: move next_switch_time access under lock
Thread-Topic: [PATCH] arinc653: move next_switch_time access under lock
Thread-Index: AQHblx9ZXx8iZV2D30elmjmYWo3xErN5ANvQ
Date: Tue, 18 Mar 2025 15:39:26 +0000
Message-ID:
 <SA1P110MB1629AA9DFAFE89C65248401DF4DEA@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References: <d8c08c22-ee70-4c06-8fcd-ad44fc0dc58f@suse.com>
In-Reply-To: <d8c08c22-ee70-4c06-8fcd-ad44fc0dc58f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|BN0P110MB2068:EE_
x-ms-office365-filtering-correlation-id: 07be1752-d6f2-41ed-4b36-08dd663310a6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q2hZN0NSRUxyQis5Wm41Ukd4ajkvSGRCNi9FVHFPWnVzL29BSExPcFF5M0Jy?=
 =?utf-8?B?YWdHRzBpTHNGN21zRzFpZmNMNG4rellLUE9VVElpOVNPcFBZbzFURDFVNHhp?=
 =?utf-8?B?TjBzZGFhR0tLUTBzWVJiU1JrUzEzamt4N1doY1k0OU8yWHVabmQ5OEFvOEh2?=
 =?utf-8?B?bUQ3dzhQUW8wRVcrUm9CQXVMTFZiZUYxTmg1NlJRZFkrQ3lnYzJycktsNmk5?=
 =?utf-8?B?YXJQL3lxNGZKbTlnT1lVTzNPMWhBdWJoaFBFeVYweUl3bU5wdmMycFFpa3pl?=
 =?utf-8?B?WUFmZGdTV21QZkVhaHJxUU9GVXh6SHBkUFBHRnBMWHAvSkhLUys0V0NoUlJt?=
 =?utf-8?B?YnZRSjBDWkp0VTJRQlErTEJYblpuK2NyZ0U0Tzg1d0hMQjBYblFWOFBBN2dG?=
 =?utf-8?B?YVRtSmIrTHFQOEt6RkYwelNqNzRZV1Z6aWVXYkxQenRmWkFyTlVDQWtMTDlq?=
 =?utf-8?B?ZzI3Qy84M0poMy95c2s4WlpLL250QW1vZmkxQktxR2p3SnpVR0NNaUZxVWxz?=
 =?utf-8?B?WE9sWXVKWnlGaVRHYmlDWTdXeHc3UkpaRkFYak0yVm9hNGloRHYxMFgyWlNE?=
 =?utf-8?B?N3lYRTVRTEU2bmVrMmJHL1BZTXNpMU9zTkhzQnVTMHRPOWpNNnoybk54bXph?=
 =?utf-8?B?RU1MZTNhaXFTa04vYTFib05FN1dFZXEycXVpWFZ6cEdmMHFHNzJHYmd4T0dF?=
 =?utf-8?B?NlhJbjJKUDlCOHJGdGNsdFVPdUQyREpiR1NyNlFIbHlkWkZxd0Z1R2QwNnI0?=
 =?utf-8?B?azJrVThRZDlqRmhzcGRHem9VYnpzaWxaMzJEYmxqZFFUY3ZacTdvVE82T2xa?=
 =?utf-8?B?dzFwV1R2SGFaZ2NjeG1rdCthQjRKOVdIN0t6RU1lSkRTU1ZQMFJpMnFuNUtM?=
 =?utf-8?B?QjVORGk2Uy9nek51R3NXRXJYVVp4bzU0KzZ5NHAxazRVYk53S0xlQzZ5K3lO?=
 =?utf-8?B?NGswNFZ5c1U0OE9nQ2pJQ2gvSTQ2eDh0bEc5a1AyekROM09FbVdKd3ZEOVF4?=
 =?utf-8?B?Yzl0N01pWHlDVjZLYzhLL0puRGZqZURYZnRpdGE3ZTBtaXJES1V6aW1WTldU?=
 =?utf-8?B?am9SUm9yM0o1cGYwaVpqTDUxR2cxYmJtUjc2S0JORlhRMDhNd3B4WmVrN3l6?=
 =?utf-8?B?NHd3RGFQS2lkMlRjQngzZTRqVzhDL0ZGc0lhblFGNFhtMlM2NUNSMG9xbWdI?=
 =?utf-8?B?VndyNWlrTlYyL3R1cDhMdXpaT2RXaW1IaU1ySC9NMkE5NmFNTmIvckxsWWJS?=
 =?utf-8?B?RmU2b0lEZ1RiZjdJVWxpOFBVRUhzdGVFZ2JqQkNxZ09ONzRsQzM3ZXJacnhD?=
 =?utf-8?B?bmNBTUlKSUs3VmNucUR1cEYycTNYQ1lDNjZSWFZHbzhsQXVON3laUHkyVEVC?=
 =?utf-8?B?RUxxZldQNnpaOGE0UUl2RGFOcEZnTTB0SjhpTVQyb291NmNUYVVLTHUzNWVG?=
 =?utf-8?B?V1FtSDFLSUZ2aTVFZWIxYk93NlBHVjhOekVnaE05SGdaNWI0UndNR2Ivc1li?=
 =?utf-8?B?MlNubm5NUGxET0lBL2F2NEhVMlRZdzBTUnYvV1dnN1ZtSVFLZGNieEdDcDZi?=
 =?utf-8?B?ZGRnSFJBcDdlVVZrbHdybzhzUlJvak90UlV1UkJWRkExR0dEaVd6L1Zqb1Vp?=
 =?utf-8?B?c1hQZjV5N2s3NGY1Nld5T3c3ZXdyUlFwTWF4ZW43dCtUOXQ3eUpCYUt1bjRM?=
 =?utf-8?B?Q3ROaHRRL0c1NUxQRmd4bXdPTTNkVVdjVmRxeHAwVWVRM3o5YkpJNThjZGYr?=
 =?utf-8?B?NERhMGxhTXM0Zk1SeWFYZFZFR29hWGdDSVdYNk1oZXhxdjc3Vi9kZzNQVW5p?=
 =?utf-8?B?RXp5N2ozZ1hodStJMGYwSjM5bVpkQTVuaWJwSTFTNjRIYzNRcVZzM1ZUZ1ZV?=
 =?utf-8?B?SENmT2ZDM2JiVGRIN0NMekxId08xWHpOOXkvZzZMZmtLMlBpZkxGNlkrSjBW?=
 =?utf-8?Q?mWbTR8Z36AMb4bkitEZz6eGeT0ZliiaG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vkc3OFdHbitxVy83UUhzbTU3VjhSZzZncWYrQnlMZ2N5cnN1S3ViMjQyS0d5?=
 =?utf-8?B?eEtkdXV5YXp2TTdQS2dGY2I0cGRVdUUreGpLUzdxVWY1SFo0UGRFT1dBMU90?=
 =?utf-8?B?T0NyV256VGtWOXZGSFZMV2ZRZWkrTXRLOCt1SkJJNWlneHgydHhDSWx1N2g2?=
 =?utf-8?B?ZnRGQmJNait0VUx6VTlOZHp5NWk2KzdKV1E5SEpuM0YxVU1qQnZaVC9GVjhM?=
 =?utf-8?B?V0paNUVQVTRySGxGQTlXd2lQckllNGdjS3MwRndQS0pSQ0ROd2NDV1ErNlRS?=
 =?utf-8?B?aHBrOVFZM3J3eEhia0VmcXhEanFLVUJNMVZWUmw2UEZyMVJINXpKb0x6Y2ho?=
 =?utf-8?B?TkVZN213ZFRmV2JkK0wzZ3JWdTNQVXFWdGpGTU04K3VKM3dsVStkeWZiclBZ?=
 =?utf-8?B?MEdxV2pxTk1IN0FQd0JzdERSVTN5V3dtb3BUR09tUi9VQjZNZm56Q3pyV2pI?=
 =?utf-8?B?Slg5TzVKOStWZGhRK0dvaUVNbUpsaTVSVGowaVR1dXE1NTVZTlg2aWMrY1c2?=
 =?utf-8?B?SDZMN3M0SnlCYlRTNXNIUnp0dDEvam9Ib3pzNEJkNWJwR3IvR1Evend3RDkw?=
 =?utf-8?B?SWJVWEYxdzlkMEd3THM1ZE9UVUlLVWtaZGt1N3l2NjN4S2llN2RpdmtpKzRw?=
 =?utf-8?B?dEdIZW81blZ3YmlrVElvM3U0ZGhxbjBjaVJ0RFRzRElMVG5QYmlrNnRMbmlx?=
 =?utf-8?B?QjFFZ0RpYk56WDR1N2JDVHdDV0JlMXJqWDMzSEhwdUdGK3VROGZ5a1A3cHJX?=
 =?utf-8?B?LzREaEdpMFNtNGNuU3drZUZUTk15aDRpdHRWQUl2ZWpXSFdsci9mSEFQYzBK?=
 =?utf-8?B?bFI1ZlpValcrTElNaGhwTmtzVzZHZ0d5VkdUT0EvaEIxOHJibHRBQnhmM05G?=
 =?utf-8?B?bTJPc3dKckE3UmFWd2tkeUlpYWoyYWhCSW56cC8xaytyblNXNkM3VlhVSXdG?=
 =?utf-8?B?RVRjYXNiU3d4Njk0bUY5NDVwOVZ0TmdkRVo1OWd4U1B6YzlUeXpmRFhnN2Q3?=
 =?utf-8?B?OEpnOTZ3bkZsQXc1Qm9wUlJCRjg3QzFHdEhuSnVPOHlYTG9SaFBxVHY3OUJE?=
 =?utf-8?B?NVllMkRZSmJycGtyM1JxRVEvN0N0Q2V5UTh0dzVoUmJhMjJEejNpUTF5OTBm?=
 =?utf-8?B?cDZhTVpGd2Yrd0RVMi9UeWRaR2VSYy9Nem1peVk2TWdpenF4aUVNOStRNURr?=
 =?utf-8?B?Zkl5NWROcjc4T2hyVUFrRWRTMmZ6aWkxeXhKMncrSXhlUWQyajRtK3Raa0Ni?=
 =?utf-8?B?dVdnMHlLeVFSakJ6ZEZST2pqVmRlUUdSQnk3aEYybXhwT1F1T09qZTBEamtG?=
 =?utf-8?B?enBjbDh1eEZnR2lWTysxZEEvVXBiQXlDbXpWbkNPSTdWdlFENzlqcm53bXYy?=
 =?utf-8?B?aGhIMXFoY3hMOVVaQTJ2RUhYZVcvbEMvWU94RGZBdkJNeEdGdm9ONHRQSUs2?=
 =?utf-8?B?dE1TN25DenkxdkZrWFhYMnVFU0EvSmt5V2ZmS3YvRk5PSTdqQVRCUExxZ1lw?=
 =?utf-8?B?ZTdUbnVhWVJjTlY0NGZtZS83RUNFSnVXaDBKWCt5NjlUcXIyR0FOVkg2Qyt0?=
 =?utf-8?B?WjEvTExxTVVhS3U4VlhOUGxuWlVidHZXSEpKUzIzc0xsem9vYm43c2hQdDZx?=
 =?utf-8?B?YzlXd3dvdE41QS9Eb0hNL0tYcTZYc3c0Y1N6M1dNSk9QS1JDZlFBRkpycnVP?=
 =?utf-8?B?STZlNy9UdnYzVzBkQVpoaHhBMFVmajJ3bjc4d1FpQ2dWY0F6emZKWk92a0x3?=
 =?utf-8?B?REpNZFRsNlhrZXhnUUJDUnNlemcrTXFyeS94VlZPRTFUODk4T2l3b1llSTdj?=
 =?utf-8?B?WDRvQ1JaUzFGdDRmQkhQdG82YzJFaUwvVnIzL1hpWFJ1Y1R2ZnVyT1lEcTli?=
 =?utf-8?B?dVdRSzFFbTFQQWNRMW5PN201RURLaTZVbXNhRnhWUXJMSGJWRDBKbWo0Kzh4?=
 =?utf-8?B?MkhnU2d2M20zU0ptWnJwWCtWSzRDN1phVjFSRkQ1WFFRUFF5MU1RVXFwSFY3?=
 =?utf-8?B?WXMzZHVlM3ZSQm94UXRWVks4RnljQVMrRVkwOVdKRnVseVhPaGxuYWd5TXNS?=
 =?utf-8?Q?2UgAir?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07be1752-d6f2-41ed-4b36-08dd663310a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 15:39:26.4707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB2068

DQpPbiAxNy8wMy8yNSAwNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEV2ZW4gYmVmb3JlIGl0
cyByZWNlbnQgbW92ZW1lbnQgdG8gdGhlIHNjaGVkdWxlcidzIHByaXZhdGUgZGF0YSBzdHJ1Y3R1
cmUgaXQgbG9va3MNCj4gdG8gaGF2ZSBiZWVuIHdyb25nIHRvIHVwZGF0ZSB0aGUgZmllbGQgdW5k
ZXIgbG9jaywgYnV0IHRoZW4gcmVhZCBpdCB3aXRoIHRoZSBsb2NrDQo+IG5vIGxvbmdlciBoZWxk
Lg0KPiANCj4gQ292ZXJpdHktSUQ6IDE2NDQ1MDANCj4gRml4ZXM6IDlmMGM2NThiYWVkYyAoImFy
aW5jOiBhZGQgY3B1LXBvb2wgc3VwcG9ydCB0byBzY2hlZHVsZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBUaGUgRml4ZXM6IHRh
ZyByZWZlcmVuY2VzIHdoZXJlIHRoZSBsb2NraW5nIHdhcyBhZGRlZDsgSSBjYW4ndCBleGNsdWRl
IHRoZXJlIHdhcw0KPiBhbiBpc3N1ZSBoZXJlIGFscmVhZHkgYmVmb3JlIHRoYXQuDQo+IA0KPiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hl
ZC9hcmluYzY1My5jDQo+IEBAIC01NzksNiArNTc5LDkgQEAgYTY1M3NjaGVkX2RvX3NjaGVkdWxl
KA0KPiAgICAgICAqLw0KPiAgICAgIEJVR19PTihub3cgPj0gc2NoZWRfcHJpdi0+bmV4dF9tYWpv
cl9mcmFtZSk7DQo+IA0KPiArICAgIHByZXYtPm5leHRfdGltZSA9IHNjaGVkX3ByaXYtPm5leHRf
c3dpdGNoX3RpbWUgLSBub3c7DQo+ICsNCj4gKyAgICAvKiBSZXR1cm4gdGhlIGFtb3VudCBvZiB0
aW1lIHRoZSBuZXh0IGRvbWFpbiBoYXMgdG8gcnVuLiAqLw0KDQpUaGlzIGNvdWxkIGJlIHB1c2hl
ZCB1cCB0byBpbW1lZGlhdGVseSBhZnRlciBuZXh0X3N3aXRjaF90aW1lIGlzIHNldCwgYnV0IGhl
cmUgaXMNCmdvb2QgZW5vdWdoLiAgSG93ZXZlciwgZGlkIHlvdSBtZWFuIHRvIHB1dCB0aGUgY29t
bWVudCBhZnRlciB0aGUgYXNzaWdubWVudA0Kc2VwYXJhdGVkIGJ5IHdoaXRlc3BhY2U/DQoNCglO
YXRlDQoNCj4gICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZF9wcml2LT5sb2NrLCBm
bGFncyk7DQo+IA0KPiAgICAgIC8qIFRhc2tsZXQgd29yayAod2hpY2ggcnVucyBpbiBpZGxlIFVO
SVQgY29udGV4dCkgb3ZlcnJpZGVzIGFsbCBlbHNlLiAqLyBAQCAtDQo+IDU5MCwxMSArNTkzLDcg
QEAgYTY1M3NjaGVkX2RvX3NjaGVkdWxlKA0KPiAgICAgICAgICAgJiYgKHNjaGVkX3VuaXRfbWFz
dGVyKG5ld190YXNrKSAhPSBjcHUpICkNCj4gICAgICAgICAgbmV3X3Rhc2sgPSBJRExFVEFTSyhj
cHUpOw0KPiANCj4gLSAgICAvKg0KPiAtICAgICAqIFJldHVybiB0aGUgYW1vdW50IG9mIHRpbWUg
dGhlIG5leHQgZG9tYWluIGhhcyB0byBydW4gYW5kIHRoZSBhZGRyZXNzDQo+IC0gICAgICogb2Yg
dGhlIHNlbGVjdGVkIHRhc2sncyBVTklUIHN0cnVjdHVyZS4NCj4gLSAgICAgKi8NCj4gLSAgICBw
cmV2LT5uZXh0X3RpbWUgPSBzY2hlZF9wcml2LT5uZXh0X3N3aXRjaF90aW1lIC0gbm93Ow0KPiAr
ICAgIC8qIEFsc28gcmV0dXJuIHRoZSBhZGRyZXNzIG9mIHRoZSBzZWxlY3RlZCB0YXNrJ3MgVU5J
VCBzdHJ1Y3R1cmUuDQo+ICsgKi8NCj4gICAgICBwcmV2LT5uZXh0X3Rhc2sgPSBuZXdfdGFzazsN
Cj4gICAgICBuZXdfdGFzay0+bWlncmF0ZWQgPSBmYWxzZTsNCg0K

