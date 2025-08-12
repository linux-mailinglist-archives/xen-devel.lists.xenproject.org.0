Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3892B22565
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078671.1439713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmtK-0007m8-RV; Tue, 12 Aug 2025 11:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078671.1439713; Tue, 12 Aug 2025 11:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmtK-0007hq-O5; Tue, 12 Aug 2025 11:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1078671;
 Tue, 12 Aug 2025 11:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=71Zs=2Y=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ulmtI-0007TX-Qp
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:10:05 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2ea20ba-776c-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 13:09:59 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB8943.eurprd03.prod.outlook.com
 (2603:10a6:10:432::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 11:09:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 11:09:57 +0000
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
X-Inumbo-ID: e2ea20ba-776c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEQS/IfWViIuznv3eEEvRUhQdCzWSse5bVeI72MQ3uLg5szHnuFOrdVrNL/BauJH32kaBxn0anynCCU3mKiUi3p8cwLjPzthPAZCxxy3j5d2dG6G/TjD2cagkN/JosByGi3RfzVQaKqMAS33BodLaNxuQy1EuiMm9HwZPZrbdoRkLh8lx8F4KMTSVcQMzGLktDcIdpz2pgMm5q5iE1weygUB2ZQZQUdDJTXku8/3sFYHI5YkbicF0Rvh2LAAnQBkO+px/XA0E45jnjJBWVUeaKKfLiTomJDXJWpwyWbgguYFR11Tht4JiNxH0is7pd/jgLnGHNZ/VMtGM9nloCC5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CV0EefV+zCVZHjjF/2P4lNAwLrdiOMUMEiXIP4Iqtg=;
 b=KpyIcRclx5jZyPk9SRhBjh/LoF2VKndpVHBJ4ZHNro8kTDT69lxk7s9iYnSnJH8D8d88PKpRrDPzG6LEJNUP+kU/jFFS46bmfLor3MtR5uXKjVgW6sARq+2doauDUqiAPQcpoHZxvM/NoVNERvsGA4/CyUK0jSE+Yva6IiWw4M4di/atsYY98kbFp2VNlBwAUTVy48I0v58RfpUqCwzJEcDWRPRvlGolChH3noUwsQC5BDU5O/PTH7mdFZTA2oHE7wUuP0RWZ31tzb/BTjjNQV56b6zYWJf46IiSsTP+Ml554jgNNTn1AHAtE8kS5qdl5YX6zFBmgmQkgJ2jXmE4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CV0EefV+zCVZHjjF/2P4lNAwLrdiOMUMEiXIP4Iqtg=;
 b=HjYUWbLxXWAVIn8ahMX4HssmY+a2zXHSVFs/hg5RIvT5rr+yhmvTUvQQGyyu/cMUFmFtTsrXjzHhpgMWC2oNxEOR0wTpKuokrgW0YkdJfZPgotEFJFbw4mIMLQy703MNabB020/Z3I6DLQ9weaPCETcSQH3M9+Mo9FrYq/opFLbODmE2B6v581zcxVXCbQpIe3V44V9QB8EnQZValnRItufTwjfBIZKzKKFHOo1+sQ8Rb+7D//31HZYGOVw/Q+Bud3ICoKWkS0VipfXYipTx4H9AoPQc91qGd6gTYWFVoDp7fwLz44FGrP0Ct+BaguxREKj89VooVJUs0pCHmTmgjA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
Thread-Topic: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
Thread-Index: AQHcAsXVA3qngHqyPEewy8MzwqQRRrRSL/eAgAy9wYA=
Date: Tue, 12 Aug 2025 11:09:57 +0000
Message-ID: <2a324f7a-6b25-4f30-a3a1-9c115aadbfae@epam.com>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <5097b76acf0a5c64cc78522f6af6233370c948e6.1753968306.git.mykyta_poturai@epam.com>
 <123626b4-3234-40e5-b1cf-bd5c2b19cbc8@suse.com>
In-Reply-To: <123626b4-3234-40e5-b1cf-bd5c2b19cbc8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB8943:EE_
x-ms-office365-filtering-correlation-id: b63d75e5-98ef-402c-e25d-08ddd990c5dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K0lvYWUybnpNOTJsNlF0YW9vekFhOW9zM0pqZk5XR3hMSldtTmNnNkMwQ25p?=
 =?utf-8?B?RXdNdVNORXZUVHlYN1B5U1J5ZWtwUWVtTUtMUUtoZ0VrVi91em04dmZxUzVq?=
 =?utf-8?B?cDI1TWlEd0JxeGNhRCs1NmlxemVUekRRenE5VFNySW1rUnhscFQvWndpR09W?=
 =?utf-8?B?WUtyOXRUc1o1NWVybWxPamhNUEFIVFZzMCtGSGxhZlE0cUNHcC84WVcxS01B?=
 =?utf-8?B?SVBveGNnNEV5dEVtVDhISjZvOEluN2xlSjVyUzRQeUVvTmtsaE5hTzlFZ0xz?=
 =?utf-8?B?UU4xTFlpVm5LVjkyOThuNTdRSkZlakZld3kzbjBhL2JVWUpYaHdyb09kSVVQ?=
 =?utf-8?B?QXcyWENsZHhSQkdleUVER3F1b3RwZlNvWVo0a3pIZVhhVFFnMytiaWE1Q3U4?=
 =?utf-8?B?c3JYYTRwVDd0NUF0UFlpTkpybkNpOGRlK1ZmNXpJcVVFei9QM2hHbDN4WjJj?=
 =?utf-8?B?aVVPbnk3NDJ0QTI5a0h3NXEzanB5a242bjlJWEp1WmZMcjdQR25KRVV1NFVV?=
 =?utf-8?B?VXRvRkM1dTRrY1o5YTNTeWl6bnFsQkFOQnV1cjl6RDhBaWhFRWN5Y2lkc0Rj?=
 =?utf-8?B?UFhCMGVqMnFoVWorUDVyN2U5VjMrZURXNkt3VkxIL0FnTzVaWDZURTduOVNT?=
 =?utf-8?B?OGFOZFdVcFNqVzdDdS85cTVjVGQ0MER4QUFzb1AwQ2UwTVgvOHJ6aGVJZUw0?=
 =?utf-8?B?ZDJYcXp2L2R3d0hNbWRUZDd2eWRZMHo1Z3NzTzVPOGhaV2VSSmkwTkRKNWhI?=
 =?utf-8?B?SUNhUm9MTHoyL2pGbldnS3JuL25vSGNsdlRrUEZ0UndPelRleFZ2N3cxRENZ?=
 =?utf-8?B?L3Naa2JCUHBBQ3c2alNKWVhIc29ZREZFQjI4SEhsSzNrK2g4R1RLRHU3cWZs?=
 =?utf-8?B?eVFJd0h0TFVPYjNvcWFqVldhcTRXL2RhNlliN3lSNGg4SFUzTVRSVjFMSExj?=
 =?utf-8?B?L2dUcjFvQ1p5bEZXRmhoVUpzSjZFaDJUcTBFd1k4WG9QemJhRGZGSWY5MUNu?=
 =?utf-8?B?RW1MYWVDU203UmcwKzEzSDBYUUIvY2NNbzB1SkozQ2ZCK3RTbjZaVTRkejFy?=
 =?utf-8?B?N09pRWgycEV6dElnUWxIN3Zzc094aEJuYWhoSEtQZUVmanVlK3hUeDMxSk1W?=
 =?utf-8?B?dU94TFJPTlBRUFdxazFJS3VCb2tKcXczcnVRRCtVRW5xQk1MMGw5T29PN3Bq?=
 =?utf-8?B?NW5RdXc0N0gzb2Y1dzJiYjN3V0I2bFdDalpiajQ5YlVKdWd3Y0FOUnZsYmhK?=
 =?utf-8?B?Y3hpVjROb0I2aFgzRFJDTVNudjVtQnZ3eklYKzRyZUsxai80TGRWdmRoQ0dQ?=
 =?utf-8?B?dFMrelA2Vk9ncWJ4Mi9vaEh0SGQ2MEpYZFFqZDliZzJhNjEvZVRHTThvYUxO?=
 =?utf-8?B?eERIc01rRTNUZWZhQmViZ2luK3IyVUI4RDRXdWNBVDdNMlloWXo2VDVRckNu?=
 =?utf-8?B?UGIvK2g1WDRpcy85N21oR1I0d0F4VUtBVFJhL2xhVGhRVktFdFprUmhGUENH?=
 =?utf-8?B?SnNNVWpiL0YyWnFKRFRvN1BwL05USnFKZExXWGZTVGplUDZEdndLNWlqNzI0?=
 =?utf-8?B?N2E1aEVEcnBqa1AweVRlVnB1L0p0bXBxUFFqVmEyU0kyRzFvRU9yRG5FN2R4?=
 =?utf-8?B?Z3RFblJnSXA2SG8xdHZTSGZOMmFWOHJjRmQzSlUvbE5RNTNhdE9zbDc3V0xv?=
 =?utf-8?B?TlUraXBMZWc5TG5uMjRRMXBvV25PMmtaQ3pFYjBSVmE0M2dqM0lOTzM2UFBV?=
 =?utf-8?B?Q1o3dGFxVjFyK3hvSkZ4blMxNnBNMnpPc1VVTDB5T3RTY1g3NkpoL0thTXVM?=
 =?utf-8?B?citNQlRYeUpiQzZyVkRlVXBEeXBaRWpKdzFkVW9Sc09SN3hHZFNxdWdoQW1l?=
 =?utf-8?B?cFdWaFdVNXpqaW8zbk0xSWh3RUJHQzMydlpzMXp5NlNIdmw5NmcydHZ1TXlZ?=
 =?utf-8?B?NnIzYWU2cjFDSnNaZStaYlNEbVdJUXEzdDJ3c2JnVllrQThCanN3VmVMcGx2?=
 =?utf-8?B?MW1XSEhsZnd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWtSNlRDZHZKNHR4MzdFc1YwL0xOWHp1T3U2TzBITmlhZVZPS2lSM1g2Y1pq?=
 =?utf-8?B?Tjl3SGhhdG1EVWUxOHRyOVNVQlhUQnpnWEUzcnluZlVZUjdCNFhydGtUeU95?=
 =?utf-8?B?cnFKdnU1MXVMTWtQU2RiNWhVTVhzb2VHd0paRFBRQ0N0Rm5pTkRoYjJXcFVO?=
 =?utf-8?B?M3NpN2QzaXNHRWFpR3ZodXdZckRJVkhtRUM5OEVHQjFqSHVBU000SVRsWkhY?=
 =?utf-8?B?QnZHdHBFNHNzVmd3Zm1tUC9qcHZobnZsam4zNjMrN1JKcXRLL2tKZWlISTY3?=
 =?utf-8?B?Sy9zTEFUU2NsOGI3c1F2N2g1MVYrMDZJUndMRys5aGpaVDRzeXN4djNSbHhB?=
 =?utf-8?B?akZRWHRSd0JRL2dMd3FKa0MybEJ5YWVZNEhPS01qL0dBNHJwZncwbHJFeWNI?=
 =?utf-8?B?YXVMek52V1gremZ2ZjV5SWhZbnFpbEI0RVBMLzByOEV6NnhvU0R3Tmx5WGhF?=
 =?utf-8?B?VnJGTkp0N2dxOG9aM3Y5cm56S2RvWXdpcjc5TEcyUHhlNU9NdUo5U245eElT?=
 =?utf-8?B?dGFBZ0MxdG8rNkxFYml6WHdGa0xwQ0I1NjZYN3oyS0t3SmFmQnhtajVvZU5D?=
 =?utf-8?B?RFYrU1pERlp6d3A0a2VhQ0xsOWRkOHRENUEvZ1J6L25Ic0N3RmZmbGI1QjlO?=
 =?utf-8?B?T0QzMHJ6bUM3TnYxTjk2VUNDSzQvWTdtckt5eEhTQitRTk9TY3FYMlJuNDAr?=
 =?utf-8?B?STQ1QkJ6WVFEd3VpT3pYRUdBNjVnUWUyTGxqWWZiRXpnMzJ6dnArMkF2ZVNa?=
 =?utf-8?B?VXY3dmYxR0hCTTVyUmpaVDh5ZENXZDZVZUVuSVViUDIyM09RRTNlWGFCTkUz?=
 =?utf-8?B?SVcvYXRyVmlvVzJVeHFXNUNFUTRlUHpIRVFicmxWZHZOSDB3Tzd4dGhyY2Z5?=
 =?utf-8?B?WlJMOTFrajNMZFFwTDl0UVpwbkFMUThScFV1dUVUNDhGbVBkbGh5OVdrc2Yy?=
 =?utf-8?B?aGFKWFFSSld4Z1cwWTQ0RTQ1Q3BZd093ajU4a3lBN21WQ1dkY1c5dnRmWlo2?=
 =?utf-8?B?ell4WjRTWkkxM1VEK2puTWNhY2gzbGltMEFYd1htS0l2Q0FQYng2eVl0QjNR?=
 =?utf-8?B?VjRWZGVKUitqZ1UvZndRcGpQMUtIVDBRZGtUdHB4UDQxS0Mza2plU3ZoYTBh?=
 =?utf-8?B?K1paeTZwekFsbEJFVXN1b24zdnRKRWZzL2dTbDFPTlNOY0lWakt1NDVtalZG?=
 =?utf-8?B?NmZaMmRRVjJXSnFMMDRjMU1rR21TL25vQkRzRm1jbjhoUUE4djd1V0tTakxz?=
 =?utf-8?B?WjNhRXRWb2tNOGRlVldzeVJLcHp6bnBJdlhWU2JpMW1XcUh4QmZjTnNSK3Vq?=
 =?utf-8?B?VTZGMms3aG04MUpZZjNBS0o3RVdWSVQ5R3FuUlFiQkhhQ2JoSkx0VzRmNVZZ?=
 =?utf-8?B?RFEweVNVcGxOMXFLM0R2TGtwRTJQL0xCbHJiTnV1ZW9lZTlBNHBkVCtEVCtE?=
 =?utf-8?B?WWhCT3NmTFJnejlTMW41YVZuNWxJUXE1aU9MamNYcmhCNFFiSVVsMlBtcmc4?=
 =?utf-8?B?c2htRVY1TDRrL2JHTVZ5OHZtQ3NtYlBHMXNXMjNLUGNiQkhOV2J4WXU2T1Q0?=
 =?utf-8?B?VHRaOEpRazNDUE82WGZvS0E5VnRYbUZkcnBwaC9RaU9pOFdUSkN2U0pxMFBO?=
 =?utf-8?B?akpSVjdyYkQ1NE42RmhEbnd5WFJIdW16Q0FseTZZdlRJSS9NbUgrTE0yWmJ5?=
 =?utf-8?B?SlUxZmFGdUJ5NSt4VkFxZ2lVYW9PWFpVTWQxL0NaMUxzMFVzeU8yQkFJSlhK?=
 =?utf-8?B?QzJ5cysxUTIzOTVIalZVTGdxY2Zaa1NmT0JsSnFLZFFqdHI1elA4QlFMN2Nr?=
 =?utf-8?B?ZEM0RWVDUE9Ed2llTlB6OVcyOTdVWllDbm95THhXdjNIcldNd3ZRK1hJbXh6?=
 =?utf-8?B?Nm9BVVlrb2llVms0aVRhVzRMaXo5UG5kZHlmaDhkYW1sM1ZMajhuQmR0K0o4?=
 =?utf-8?B?OFUybCtldjhOUlVNUldWMGt3V1ZXTVE1SFNHYnRxVng2U3NsWDl3OTlYaWMv?=
 =?utf-8?B?N1BMNGg4NzZ6SHhaYzlVYmZ4VE9aRG8rYStSY3NQeXdPbHoyLzdCazcxZ21s?=
 =?utf-8?B?NXdmeWhraUt3YXRpT205dFVFNjFOMGlJdFRhaEJpV3V1MHRsVWFRTnNTVmdY?=
 =?utf-8?B?V1ptMUR1bkJDVk9zMXFJNVVwNGRLVmd3T1Y1SUk2bGVBTlNxMktkcG12UmVM?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB1D2539F9C4C04CA5330D07370206B9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63d75e5-98ef-402c-e25d-08ddd990c5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 11:09:57.3875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCN08jcHHOMqnlaBtIXBNWhyh+2DobtXT4FsqPrOgF6HBfbJMPGn+OhbamXnQ9Z+s1xtoSzSr4DQF7iJIjdH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8943

T24gMDQuMDguMjUgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wOC4yMDI1IDEx
OjIyLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IENyZWF0ZSBhZGRfZGlzY292ZXJlZF9wY2lf
ZGV2aWNlcyBmdW5jdGlvbiB0aGF0IGNhbGxzIHBjaV9kZXZpY2VfYWRkDQo+PiBvbiBldmVyeSBQ
Q0kgZGV2aWNlIGRpc2NvdmVyZWQuDQo+PiBUaGUgZGV2aWNlcyB3aWxsIGJlIGFkZGVkIHRvIGRv
bV9pbyBzbyB0aGF0IHRoZXkgY2FuIGJlIGFzc2lnbmVkDQo+PiBsYXRlciB0byBvdGhlciBkb21h
aW5zLg0KPiANCj4gQW5kIHdoeSdzIHRoZSBpbnRlcm1lZGlhdGUgc3RlcCBuZWNlc3Nhcnk/IElP
VyBjYW4ndCB0aGV5IGJlIGFzc2lnbmVkIHRvIHRoZWlyDQo+IHRhcmdldCBkb21haW5zIHJpZ2h0
IGF3YXksIGFuZCBvbmx5IHdoYXRldmVyJ3MgbGVmdCB3b3VsZCBnbyB0byBET01fSU8/DQoNCkZv
ciBEb20wbGVzcyBjYXNlLCBndWVzdCBkb21haW5zIGFyZSBub3QgeWV0IGNyZWF0ZWQgYXQgdGhp
cyBwb2ludC4NCg0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBAQCAtMTE4MCw2ICsxMTgwLDM0
IEBAIGludCBfX2luaXQgc2Nhbl9wY2lfZGV2aWNlcyh2b2lkKQ0KPj4gICAgICAgcmV0dXJuIHJl
dDsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgaW50IF9faW5pdCBfYWRkX2Rpc2NvdmVyZWRf
cGNpX2RldmljZXMoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHZvaWQgKmFyZykNCj4+ICt7DQo+PiAr
ICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gKyAgICBpbnQgcmV0ID0gMDsNCj4+ICsNCj4+
ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFs
bGRldnNfbGlzdCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IHBjaV9hZGRfZGV2aWNl
KGRvbV9pbywgcGRldi0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZuLCBOVUxMLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVNQV9OT19OT0RFKTsNCj4+ICsgICAgICAgIGlm
ICggcmV0IDwgMCApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlINCj4+ICsgICAgICAgICAgICAgICAgICAgIiVwcDogRmFpbHVyZSBhZGRpbmcgdGhlIGRp
c2NvdmVyZWQgcGNpIGRldmljZSAoRXJyb3IgJWQpXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAmcGRldi0+c2JkZiwgcmV0KTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAg
IH0NCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+
ICt2b2lkIF9faW5pdCBhZGRfZGlzY292ZXJlZF9wY2lfZGV2aWNlcyh2b2lkKQ0KPj4gK3sNCj4+
ICsgICAgcGNpZGV2c19sb2NrKCk7DQo+PiArICAgIHBjaV9zZWdtZW50c19pdGVyYXRlKF9hZGRf
ZGlzY292ZXJlZF9wY2lfZGV2aWNlcywgTlVMTCk7DQo+PiArICAgIHBjaWRldnNfdW5sb2NrKCk7
DQo+PiArfQ0KPiANCj4gVGhpcyBsb29rcyB0byBtZXJlbHkgYmUgYSBzcGVjaWFsaXplZCBmb3Jt
IG9mIHdoYXQgLi4uDQo+IA0KPj4gICBzdHJ1Y3Qgc2V0dXBfaHdkb20gew0KPj4gICAgICAgc3Ry
dWN0IGRvbWFpbiAqZDsNCj4+ICAgICAgIGludCAoKmhhbmRsZXIpKHVpbnQ4X3QgZGV2Zm4sIHN0
cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4gDQo+IC4uLiBmb2xsb3dzIGJlbG93IGhlcmUuIEJ5IGdl
bmVyYWxpemluZyB3aGF0IHdlIGhhdmUgKHBlcmhhcHMgZnJvbSB0aGUgdG9wLCBpLmUuDQo+IGlv
bW11X2h3ZG9tX2luaXQoKSksIHlvdSdkIGFsc28gYXZvaWQgdmlvbGF0aW5nIE1pc3JhIHJ1bGUg
Mi4xIG9uIHg4NiwgYXMgeW91IGFkZA0KPiB1bnJlYWNoYWJsZSBjb2RlIHRoZXJlLg0KPiANCj4g
SmFuDQoNCkNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBhIGxpdHRsZSBmdXJ0aGVyIG9uIGhvdyB5
b3Ugc2VlIHRoaXMgDQpnZW5lcmFsaXphdGlvbj8gV2l0aCByb3V0aW5lcyB5b3UgbWVudGlvbmVk
IGJlaW5nIHNwZWNpZmljYWxseSBmb3IgDQpod2RvbSwgd2hpY2ggbWF5IG5vdCBleGlzdCwgYW5k
IHRoZSBkaWZmZXJlbnQgYXBwcm9hY2hlcyB0byBQQ0kgDQppbml0aWFsaXphdGlvbiBvbiBBcm0v
eDg2IChhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIG9uIHg4NiBhbGwgb2YgdGhlIFBDSSANCnJlbGF0
ZWQgc3R1ZmYgaXMgaW5pdGlhbGl6ZWQgZnJvbSBpb21tdSBoZWxwZXJzLCB3aGlsZSBBcm0gaGFz
IGEgDQpkZWRpY2F0ZWQgaW5pdCBzdGVwKSBJIGFtIGFmcmFpZCBJIGNhbid0IGZpbmQgYSBuaWNl
IHBvaW50IG9mIGNvbnRhY3QgdG8gDQpnZW5lcmFsaXplIHRoaXMsIGJ1dCBJIGNhbiBiZSBtaXNz
aW5nIHNvbXRoaW5nIGR1ZSB0byB1bmZhbWlsaWFyaXR5IHdpdGggDQp4ODYgY29kZS4NCg0KQW5v
dGhlciB3YXkgb2YgYWRkcmVzc2luZyBwb3NzaWJsZSBNSVNSQSB2aW9sYXRpb24gSSBjYW4gc2Vl
IGlzIG1vdmluZyANCnRoZSBhZGRfZGlzY292ZXJlZF9wY2lfZGV2aWNlcyB0byB4ZW4vYXJjaC9h
cm0vcGNpL3BjaS5jIHNvIGl0IHdpbGwgb25seSANCmJlIGNvbXBpbGVkIHdoZW4gdXNlZC4NCg0K
LS0gDQpNeWt5dGE=

