Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48438C4BF69
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 08:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158767.1487190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIiU8-0002lC-Jy; Tue, 11 Nov 2025 07:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158767.1487190; Tue, 11 Nov 2025 07:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIiU8-0002jN-Gp; Tue, 11 Nov 2025 07:08:12 +0000
Received: by outflank-mailman (input) for mailman id 1158767;
 Tue, 11 Nov 2025 07:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifhn=5T=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vIiU6-0002jH-FV
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 07:08:10 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bf79a8f-becd-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 08:08:07 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB7153.namprd12.prod.outlook.com (2603:10b6:806:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 11 Nov
 2025 07:08:02 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:08:02 +0000
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
X-Inumbo-ID: 2bf79a8f-becd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id111xkmCRbKxIQi679UzPymjOia5W1Dx51eVgsDmodC12EaNkD4aViBQr5fz0da2c1GN9dYBaUVM9fM8/t40WOout4MXmh25wHLtSoDlu3AmXXuhDCJEBAL5XjPVN2XPVOkOvi+HP7KqMP7CeXtdiPSu6rNAZRUKwzWB7GZbzxonNxfj73ARxnxJP/LF+T1kjVyLCT+OGwRsPbhvUD/xhSRnePu4bVSJOluWXsgtifkFeFf3szN/mwMaIARqw/mm6HhZVUqRQpF7Yu0AsAzUk3DpDloVM+U5yn584Rmdx3qejXJsNzOEqz8S7OEtK8LkZRL3+48EtlivueF8Z6I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP7lJJsLPhy1oqOsULEvMvu97coRCOdXjbh/x/rTAs8=;
 b=YQpBzme818Qdt6oEmtvAR+mEZzaWQv5FGVipOtOAT05y+pYnJWEZPoAV2FLE9WrTagDwzItCnPZBa6PbURsCr9ScJywMN/yhYdRIi4uYiW7GuHHfLiz6nkwXxin1e5miPeP/ecIdd+LQeR0ea8EqRq1tM1f1oEUiHJnIRSZaE7RI1fl+ETepc9AsQoeDpWRMpeZj+kgVEVeNYb5ND49xEjQefedlTxlMdjVN+NMKm8cAjSHMeXR0dAEm16KhIECV41tPDYlUxgFkbX2uoLRwFliXW1AZCMM/zBxG+E9BSeISviovqQy12QMESk6RJ+OWwFGYjEnUjmKVDCP3qqtWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP7lJJsLPhy1oqOsULEvMvu97coRCOdXjbh/x/rTAs8=;
 b=N8dlmPQSAF6r2hO1rOqc2oLgVliupXaSdzm8qemCV8ibVePqmHkwErrO+0Ol5YDd5ikEtg1LPKufmTexRGTp9z+8N0dk657fNd4vZGoL+ywsTdDkhVFCH9LlpTf0kjQ90LN4SMmf5RO1VfOhJYfXr0ylxBtBKm+aGD4WyQo0MIE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Topic: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
Thread-Index: AQHcPCqA+mY6s9fCEkmLa9SlVlA0PrTZYSAAgBPVwiA=
Date: Tue, 11 Nov 2025 07:08:01 +0000
Message-ID:
 <DM4PR12MB84515407D91133DF7B182BF1E1CFA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-10-Penny.Zheng@amd.com>
 <1a9ac91c-2295-4749-8807-668fcecf8f8e@suse.com>
In-Reply-To: <1a9ac91c-2295-4749-8807-668fcecf8f8e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-11T07:07:08.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB7153:EE_
x-ms-office365-filtering-correlation-id: 53b88c66-3214-4ad0-c6a7-08de20f10d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmsyYSs1cStiZDBwaTBiMnhQOU5jWTFLYVRuRk1tYTM5Q01KU09nYTFDT0l2?=
 =?utf-8?B?dzhSVmFkWkxWRmY3eVlUZEhJNnZSWHhYdGFNRTVuNENtQWJUUkZ3SG01VGlW?=
 =?utf-8?B?U0kvU3Fhbm9wenZCc3U1b2tGazZ3Mkl4ZVd5Y085eTBzbEhTQk8zVVIrSGFa?=
 =?utf-8?B?ZHBSMnlQbXVWZGZLUmxmZjlJd2lyV2lseWwzR093R1BGdWdrdTlsZUJWWU5W?=
 =?utf-8?B?U3kxU0lOcWNNUnhKT2p0VnhBTkM2RjJiMEZCT05USXVsVE9oK1pydDdIeDlx?=
 =?utf-8?B?N3poeUY2NXlJTzcvcnJ4eXVIbnBBMTZ1bkZobm5vTGNwVkoxOTEwRlNqR3Zq?=
 =?utf-8?B?aHlvU2Y5Q2RiaS9NUld2R2xyUjRSNjIreFdyelBsMmcwbEEvcklrTm9DeXFT?=
 =?utf-8?B?aTkxY0xneThXUXZVMUlVRVBpNTRPd2ZhbkdpYUFBdWlLOTRjd1k4cVlNS24v?=
 =?utf-8?B?MjZVVThaWDl2NFRtTVNncm4xeUs5bE1qNUpNb0o1Y2ZaeXJIT00wbzhYNG1N?=
 =?utf-8?B?NHdyV3N5d0ZlclpSb1RMZmJsdkNXdy9WcHBISTJCTlJ1M015NEJ5dFRlMEhE?=
 =?utf-8?B?U1J4MnFrZHR6cHplYXI3cGRiMWNWV0NNUC8ybnR1RTUwZHREbmlUSGI0azZD?=
 =?utf-8?B?dTFieHJ0KytTaGhXaVBBdTJOa1ByRHlKczA0QzE4UjNNcndyclVvenJqbERB?=
 =?utf-8?B?ajJTTGF4T2JvaU5FbCszb0FmNXVwam1IM3Y1Q2JFdHRyM3pLUUtqVU5XNm13?=
 =?utf-8?B?YkhZSWJxZzc5ei9jY1Y4R0RZNmdOUWRLRTdkaytwOGJ5TmtEUDYzVlhMZHdE?=
 =?utf-8?B?VFlxYjBDcnJKWWJjOVRsZkozZmhTQVFybjVWdXY4cGtTRXBHbGxQSDVaaVVD?=
 =?utf-8?B?UmVHQ2V1SmkzeThjajNTVlU4UGRpNHNzUHd2TnhVbzFjTUNiZUh3MVZOY0Zi?=
 =?utf-8?B?NzVZUTRzOVJzRHVyTHg4clFnL2ZLcDl6TVhwcE56NHR2SXZMbnNxZUFFczJK?=
 =?utf-8?B?MnlDdmFiZ0VPck0yNHpkeUZ1UHZsTEI4R0pWazdZWWlNWTExMUM4OUhscmpT?=
 =?utf-8?B?K1B3ZTlCRGtGZzg0eVRYTVRkUDZIKzc5SHh1d25teU1hK3JpTGhuTDlIbHFm?=
 =?utf-8?B?eTVZVCtnNlNhT1pMbU9NWXdmK1Z4eTVQWktodTdTams0bDlTaVhRSCt5L0VK?=
 =?utf-8?B?Y01zWS9KYzk3bXRld1BvNks5cVZBSmY0cC9MSWhOeDNXSXlweGNNVjBKQnpK?=
 =?utf-8?B?S3hpZkFPWVVHZHAzM3FKcVBXRnpXSE1IYUlUOTJiTG55MXdvSGJrWSt4Ky93?=
 =?utf-8?B?SUVva0dzZDEza2RYMmd4UWh4czd5Tmo1b2pON0QwMFZlb2tCTGp1ZGtmV25Z?=
 =?utf-8?B?RWptMFFhRk8yMkV6d3QxRHZCMk0wY2U4clFva292bW1uN1NEczNjcjVrdmpw?=
 =?utf-8?B?a2FKdmVTVi84MlU5RVM5N0ZkSTlzam9MQytQMHJGT3JkYVFSZExOczBlQ3VS?=
 =?utf-8?B?YW1oMGNZZHVTSURURlFVb3ZhQnQwMTBOSW83SFp5QXB5clJGbTM1eml0SFp0?=
 =?utf-8?B?MTRVQkQzMGpnejMrZjVZNTJ5bkR3NWtGV251VFFxdTI1MWlHVHk3RFZjcDh5?=
 =?utf-8?B?QkRyK05GZ1FDUzJYdjl2cFNrWkhmOE0zdFg1SjRiNHhVRm5EdStxN0lZQkI1?=
 =?utf-8?B?anFXZDhzbngzS29OMmxwUC9MdExybkx3MGIxL0hjRFVXNWJYT1dvbi96WGRh?=
 =?utf-8?B?cFFJNmRsaUdIaWVRTWF5d2hVNGl0WlV1OGpZMUpoNHQ2akwrQ212dU9HdTgr?=
 =?utf-8?B?bGcwSDBKcEJTcWwvdWEwaEtIalA2U2piT2QzWUMrVkJjWEhjMytvaTQ3RFR1?=
 =?utf-8?B?eWVxVlpMWHY0Q0VuNS9ZMXlFdmFQMS9CZlkwVWxHNjlPeGtuN0ZVelZaMnBq?=
 =?utf-8?B?aElOemt3ZW1uc3BjTUlaTDR4a1Z4UHpacVNzR1lnL3JTeVk0Ym40ZndkdWhr?=
 =?utf-8?B?UnBOeW0wVGZXczJUSitONnF3ajdsT0dTREFxMENpWjNTeG1wTU9GNHA0Tzhn?=
 =?utf-8?Q?J6JOrr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEFiTnY1NEx3Nk9JT3lUdEhFTTZOZTI5ODJkeHd0LzR3YnFmNG5wN0tSb1ZU?=
 =?utf-8?B?VVNTY0ViVUtRWFVGZmsxLzhBbWdSUWNtaWRtTndwR0tXYmJ2ZVU1SVUxdHph?=
 =?utf-8?B?ZUlEMS9MSWI3TVdsZmhpVk1nTDJDaEJKWmxoVVd4RHhCRG5BbUhxRXZvNFlG?=
 =?utf-8?B?VWdPRGd3TU5zUnFzYlZoWnVNck9sQlJwR25ZUU5INm9nQmk2YUx5dHJuakdT?=
 =?utf-8?B?KzZIZ3lIZDZOVjNDNkRCdVl5RWVYMUNTUjQzNFptdGFZUCtmeXRoSzFQbHFV?=
 =?utf-8?B?Z1cxQTRoQllzblNEOW9ybkRXUzJJUDN3NFJNbGxEZm85OE1NSHMyMmI0NDZt?=
 =?utf-8?B?d29UUVF4TW16NWl6UmN1ZktERGlHc1J6eG1LNW9pMnFpaDVKRlI3LzY2Uys0?=
 =?utf-8?B?TWpwUUpDNWd3dmhtSEZVQ2RVMGFFdEdDelZ3cU5Mak9jaThPNkNrQjZMa0FV?=
 =?utf-8?B?VjRxZC9aeTMyS2dFYXB1QmtKdGllQm9rblVmWk1XaExwVkpjdW9XMXFUSVln?=
 =?utf-8?B?WTgrNkVqeHB4Ti8xWE9TYkVldHVJTm5Xc2thOGhZdFBNUkFEazN3alIvQnZY?=
 =?utf-8?B?b3pQcEE1c1pCOEI1SWdtZlZIcFVWK0E2RHBEYXJXbEpxdm5OQ09vclgvczY5?=
 =?utf-8?B?WEZ4eWZxSm50d25YQ2R4Z3NjcFN4bEhac1Y3S1VPdkNhUHR5ZjNZU1h5cHNv?=
 =?utf-8?B?QkhqUnl6ODBnTDdnblE3YkxrU0hiM2xUSk00MnNpdXFNQ01DT2tNSmNlTEk4?=
 =?utf-8?B?VVR3cXhqQ2swSnNaa25Wc1RuUGlNMkFpMFUwV05tbVpkV3FvRU13dWFEY0Fs?=
 =?utf-8?B?NUNXeElhVlY4ZWQ2b3grQVVGZFdiTzVReDIyaG0rUDRjajR1eW9kaDJndFhG?=
 =?utf-8?B?b2VLbkcvUS81K0xpU0l2NFNKRlRNM0VVYVdGSXRwWW9razdRTnVpcEo3Ymxk?=
 =?utf-8?B?bEZENDF3akZIZTVjYllmNENwbFBvTHFlVjEreHRLTTdUeDdYK2FYL2FmMWJl?=
 =?utf-8?B?b0crWHp4dnY1bTdrUVJDZDJIOW1wZEE2cXl5eVFMMlgxMXlvVDNrdmpuWnI0?=
 =?utf-8?B?aG1QMW1pQ1lDSjd4QVNGTTZaRmZaRSt3aTJxTkdsV2hrcmJPNnNDNGJlN3hG?=
 =?utf-8?B?OFhrbHJueng5YU93bEtHKzBZOUNvMEZoV0JrVmZoK2JEdFBOMFJwNFl3KzRz?=
 =?utf-8?B?c3QyTy9nRmdZblU3OU9HWWdtU2VBNGE3T09qZ3ZkUUtaNFFIZUhmNUpWZUZW?=
 =?utf-8?B?MVBtTGJmKzFSeEtLUTRISlJEdWFWVFNDcEJZMjlMZFNuR3JlVGhSNng2UDlm?=
 =?utf-8?B?VkZBcW4rMFpVb0RXSXZnNHNhUktBS3kyRGl4Vlk4MWZFVWlJek5pb0E1SGdz?=
 =?utf-8?B?cHZ5ZjdITlZTLy94SVFST0liM3lCYUlhdGZJWmVzNzBGRGNTMTE5TVZxVnM2?=
 =?utf-8?B?TUYzRVk1VktxWjZXVVpZWm5CY0Q4aWdJMWdPQTlIWGh2SFQvK0lyK0VwKzly?=
 =?utf-8?B?L01odkJxU0dzamkrL0lmQTFXMWZWMFhIdklZVFpId1A5OFlhWlhBYUo2Y3Jr?=
 =?utf-8?B?QWpHaUxaTHJFSjhPUnpIaDdTRy91RFI5RHJJT2UyM2N5N0t3dng3WWZBYzJh?=
 =?utf-8?B?RHQ0SFd3cy9sa0tGYjdmYVhPRDVkdlVuNVZrazVIRjVESmhRWnhycitma0Z6?=
 =?utf-8?B?cVhJaWNMUTRUNVhkbmRQa1N2MmY0aThsWTY5MWcyVVJsYVNkR05aRjFEQXlC?=
 =?utf-8?B?bUxnMytnd0pqbWpCQ0J0d0FDNUdkQXdkQ1JieGxhOGRHcFBLT0lQOEZtdWVE?=
 =?utf-8?B?L1M5Sk1vV3Q3dmNIbTJrNGxjSTdwN3Q1M3JKdWRhKy9nRVBSYk9INDNXSU9y?=
 =?utf-8?B?SzZXbGlSUHowdEM0c0pudkt0ZzFWVmZCUXlJQ0d1c091Z0dTdmJ1YXV2bHZF?=
 =?utf-8?B?OS9KMW1EMDh3V3kwb1UrNnIyTWpTekFFSUo1c1dHeHJhOXBWNjA1K2NpajFw?=
 =?utf-8?B?R3I5b2I0RGhpL2FuVlpYcU55Y3VQVUI1bTRqV0JMbkNSVEZzTFZVWXcva0xM?=
 =?utf-8?B?a2V2REdVSmh4bSttbEgzT3BLdnBTa3R2cmdrYldwNkpKQXNXaW93dURRd0dl?=
 =?utf-8?Q?7zcc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b88c66-3214-4ad0-c6a7-08de20f10d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:08:01.9971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2xgWIRyTOUrWp5D/dsC64LIqZxQTRVDRUqDobn1dFXWZEHZ/29vlgp/zUjBqaragTiWuLR2g4ai6Gtg411wOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7153

W1B1YmxpY10NCg0KSGksDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZS4gSnVzdCBnb3Qg
YmFjayBmcm9tIGxvbmcgYW5udWFsIGxlYXZlcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21lbV9hY2Nlc3MuaA0KPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tZW1fYWNjZXNzLmgNCj4gPiBAQCAtMTQs
NiArMTQsNyBAQA0KPiA+ICAjaWZuZGVmIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXw0KPiA+ICAj
ZGVmaW5lIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXw0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdf
Vk1fRVZFTlQNCj4gPiAgLyoNCj4gPiAgICogU2V0dXAgdm1fZXZlbnQgcmVxdWVzdCBiYXNlZCBv
biB0aGUgYWNjZXNzIChnbGEgaXMgLTF1bGwgaWYgbm90IGF2YWlsYWJsZSkuDQo+ID4gICAqIEhh
bmRsZXMgdGhlIHJ3MnJ4IGNvbnZlcnNpb24uIEJvb2xlYW4gcmV0dXJuIHZhbHVlIGluZGljYXRl
cyBpZiBldmVudCB0eXBlDQo+ID4gQEAgLTI1LDYgKzI2LDE0IEBADQo+ID4gIGJvb2wgcDJtX21l
bV9hY2Nlc3NfY2hlY2socGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBucGZlYyBucGZlYywNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfc3QgKipyZXFfcHRyKTsNCj4gPiArI2Vs
c2UNCj4gPiArc3RhdGljIGlubGluZSBib29sIHAybV9tZW1fYWNjZXNzX2NoZWNrKHBhZGRyX3Qg
Z3BhLCB1bnNpZ25lZCBsb25nIGdsYSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBucGZlYyBucGZlYywNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9ldmVudF9zdCAqKnJlcV9wdHIpDQo+ID4g
K3sNCj4gPiArICAgIHJldHVybiBmYWxzZTsNCj4NCj4gTGVhdmluZyAqcmVxX3B0ciB1bnRvdWNo
ZWQgZmVlbHMgZGFuZ2Vyb3VzOyB0aGUgZmFjdCB0aGF0IHRoZSBzb2xlIGNhbGxlciBoYXMNCj4g
d2hhdCBpdCB1c2VzIHNldCB0byBOVUxMIHVwIGZyb250IGlzIHNlY29uZGFyeS4NCj4NCg0KSWYg
d2UgKnJlcV9wdHIgPSBOVUxMOyBjb21waWxlciB3aWxsIG5vdCBEQ0UgdGhlIGZvbGxvd2luZyBj
b2RlIGJsb2NrIHdoZW4gVk1fRVZFTlQ9bjoNCmBgYA0KICAgICAgICBpZiAoIHJlcV9wdHIgKQ0K
ICAgICAgICB7DQogICAgICAgICAgICAgICAgaWYgKCBtb25pdG9yX3RyYXBzKGN1cnIsIHN5bmMs
IHJlcV9wdHIpIDwgMCApDQogICAgICAgICAgICAgICAgICAgICAgICByYyA9IDA7DQoNCiAgICAg
ICAgICAgICAgICB4ZnJlZShyZXFfcHRyKTsNCiAgICAgICAgfQ0KICAgICAgICByZXR1cm4gcmM7
DQpgYGANCk9yIGFtIEkgbWlzdW5kZXJzdGFuZGluZyB3aGF0IHlvdSBzdWdnZXN0Pw0KDQo+IEZy
b20gbG9va2luZyBhdCB0aGUgZnVuY3Rpb24gaXQncyBhbHNvIG5vdCBxdWl0ZSBjbGVhciB0byBt
ZSB3aGV0aGVyICJmYWxzZSIgaXMNCj4gdGhlIGNvcnJlY3QgcmV0dXJuIHZhbHVlIGhlcmUuIFRh
bWFzPw0KPg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tb25pdG9yLmgNCj4g
PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbW9uaXRvci5oDQo+ID4gQEAgLTMyLDYg
KzMyLDcgQEAgc3RydWN0IG1vbml0b3JfbXNyX2JpdG1hcCB7DQo+ID4gICAgICBERUNMQVJFX0JJ
VE1BUChoaWdoLCA4MTkyKTsNCj4gPiAgfTsNCj4gPg0KPiA+ICsjaWZkZWYgQ09NRklHX1ZNX0VW
RU5UDQo+DQo+IFR5cG8gYXNpZGUsIGlzbid0IHRoZSBlbnRpcmUgZmlsZSAocGVyaGFwcyBtaW51
cyBzb21lIHN0dWJzKSB1c2VmdWwgb25seSB3aGVuDQo+IFZNX0VWRU5UPXk/DQo+DQoNClllcywg
bWF5YmUgb25seSAgYXJjaF9tb25pdG9yX2dldF9jYXBhYmlsaXRpZXMoKSBuZWVkcyB0aGUgd3Jh
cHBpbmcuIEFzIGl0IGludm9rZXMgaHZtX2hhc19zZXRfZGVzY3JpcHRvcl9hY2Nlc3NfZXhpdGlu
ZygpLCB3aGljaCBpcyBkZWNsYXJlZCBvbmx5IHdoZW4gVk1fRVZFTlQ9eQ0KDQo+IEphbg0K

