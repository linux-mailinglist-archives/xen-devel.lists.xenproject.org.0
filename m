Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C929AC68C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 11:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824491.1238612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3XgZ-0004JN-SR; Wed, 23 Oct 2024 09:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824491.1238612; Wed, 23 Oct 2024 09:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3XgZ-0004GJ-Pj; Wed, 23 Oct 2024 09:29:47 +0000
Received: by outflank-mailman (input) for mailman id 824491;
 Wed, 23 Oct 2024 09:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvWg=RT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t3XgY-0004GD-J1
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 09:29:46 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2409::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a1dc99-9121-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 11:29:44 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 09:29:40 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 09:29:40 +0000
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
X-Inumbo-ID: 55a1dc99-9121-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhHaP8Cegrx3hSogthTK3Fx8hwnOX/98E5T3uvreUgOtHkEk0imajqcPCZIMZ6eKDGRXwUOrKJS5dj5+zxyjQddEam852lrtHdf9eljK1k1Bvv8hFnZy5E7cek0rZbOoU1tx3bkzbPkBkNadjGCM5VU99dYIoDBzPpPBSqbrG6aGaQkOyliRNbApsPFGVCMbHSfRlb5ss4E0e9q9Cp74XcTOY32kEc5HnJsHy0hxaplyz1dF5eN/nVO5A2XPeYEt3UjSCjSmWqNpib/IieUX8xlN3cFZZBz3scs0yxPeLBAANRLuzElNHw6t/VbSYa3z7mhp8lnD0CLSlB7oqdgZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvw35kUVAkte2LwthYyjDvSiuNqPW1GicGkr/+EELsw=;
 b=Vienz4fL2Z10ksmhqefxSo5Z1cTIQAdsXv0MBre3HmS/uHpeHPxZZrqceoTX3qipIKkqX2PGVM+O11j8XYEY/enZ9rSXahk6WTBz/+XqJ1SMhdMq4HDA6RX8b8xF1z4o1yNHCGKR5kpzcfqQ+gChSPfd7QdJeJ/Mw+35Y39Y6lKHdHKHFl1OAfaN8bdgcckrXlLF3DAWGkE4iIu3t03PotTW3ExJkc7UPHtWK3ZNJlH2BroqmGTT4J7BQINfNgmREIqS4oVv9cwML61ZAnZjVIzKf7gsqXhyPeM3WcCH1posOjtloDmyylCAIRN/pdIMz6cr5h+XEt0x4Yr0dTcxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvw35kUVAkte2LwthYyjDvSiuNqPW1GicGkr/+EELsw=;
 b=DWL98DCWusDG5sjY3detUBGTWvHdduh7rbFzAA2xub2uokTtjPSNp++Ep6mZ8+I6Hp912OZ7m4deuCIBTVgyu2sFzbmmz4lxqiRozS8PP7e6YFSn4Jwer4MkDP+1G7AqFef/yS/TR92jVkWtuy7hI4L6QaMVjFf9yNR9yKL/cvU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>, Anthony PERARD <anthony@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
Thread-Topic: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbH5SoA03nzCynnUmi2VFVuzae7rKRuBKAgALqNQA=
Date: Wed, 23 Oct 2024 09:29:39 +0000
Message-ID:
 <BL1PR12MB5849A93613726C855C612580E74D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241016062827.2301004-1-Jiqian.Chen@amd.com>
 <83ae0df2-c255-48ca-9f50-d495d1593852@amd.com>
In-Reply-To: <83ae0df2-c255-48ca-9f50-d495d1593852@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8069.027)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB8103:EE_
x-ms-office365-filtering-correlation-id: 07b126e0-b987-417f-49d4-08dcf3453824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1lVREJBeWtIK3RSZEk4SDBYUXRjaC80MFpVd1hudGJiYlZpNDlMd3pWTzRu?=
 =?utf-8?B?RHpKUlJNbmNmQWduYjdaRGtsN05vb0M4TTcwVXRlaTU5bHl1Y01rY0JDOEE4?=
 =?utf-8?B?bnF4aDlOTi8zTDN0NHBXQ2tZQU9DU0JUZUU0ZjY5WStic1BjZnBPRVJQTkl0?=
 =?utf-8?B?MkNEMG5Xd3hjQVRBS2JvRVNCZVMxSG00Y1B5YWtpcVd0Z1o2RzAvUkl4N29n?=
 =?utf-8?B?Nm5KUzR6VGMwQjFaNjIyVlB6OWY4bllEL0d4SjVvd2VUb3NhZ0ZVZXFoYTBK?=
 =?utf-8?B?S3BmOGxSb1ZqV0EvOC9CWWtKMDhtcEM5aFRoTUtmWUhvakhoUFhOUy8vS21O?=
 =?utf-8?B?UzNmR3NLd3lTVHFYRVpkdDdCMDMvVFlPbDNhU2E3eU9xMVMvRVJWUnlkT0JY?=
 =?utf-8?B?OTNzajUrM1A5R2lYek9wTm5NK3ZNczJHcUpuc21MdjRFUWVsVldmckpsZ1Rt?=
 =?utf-8?B?YVM5eGhseDV1UER3WFlEMDJxQ3pOcmFQRUErNmZZakhOcDVIZ1RWSEdZUUxw?=
 =?utf-8?B?ZDNSMXhZWjF4TURPZlZ6OWlHMmxoU2lxUklSc1hXVStEZHlRZTNNOEs4OEdJ?=
 =?utf-8?B?dlBpRUlxTlI0TDJXYmxFYnNEdGhWNlFEeUtqNUlBZWpnTDFETmhFMFBNU3Yy?=
 =?utf-8?B?dzZwd3VzUm5lYmNFNkd5U0FqWUxqMUpKNUJDUGl5d3hrdDNMaC9yRmVWSnJs?=
 =?utf-8?B?K2N1aEYvNXY1YUhGbHNLcEhqUlF3UThzRGw5UU9sVHpXTlJqYiszUUJYM0Zz?=
 =?utf-8?B?ZkFGTlRuUnlxbG1TbGRpQml2M295Ny9FVCtxKzJVWUE4UkorcDd1Z21qNkxu?=
 =?utf-8?B?V2swTTFlYzB1c1N0TG4wb0RCRHc2S0IzczZEYVdVTC82K3o0VEY4aHZaQitJ?=
 =?utf-8?B?UGVZS3UzemZOcTNEMjRhcExLL3Z6RFV1SmRQZmRKTlk0anpFdEdBTnFUQkE4?=
 =?utf-8?B?TVJhc0JLbnBNTXhOaVRWVC8zcUlsRFhxT0t1SFRrUHBMb2pvYnR5WFdmV0sy?=
 =?utf-8?B?T25lUW5aaEsxSTQ1azhERVp5aE5sT21tVTJwc3A5QUU5WmI3R2JNQ2NTcVNp?=
 =?utf-8?B?cDdmeDB6elVzVjBIbVhRbjlMczZPUnZ6WG8xaGJjRjhMN2ZlRnd3K2l4TlYz?=
 =?utf-8?B?K0VIcjRsNHRIczB1TUZlNjF2MVUwMk1YeTlSdk5hR1VGbjI5VEhMeDVCLzR0?=
 =?utf-8?B?d3F6a1IzWFhnWXc3WGNQZ2tqZ2E2RFM5TmI1U3NjTThMZEN2blNySjhJWnkr?=
 =?utf-8?B?bjBUZTJYbll6NUtIOEpmRGI3RXY3SVQ2N0VnbmNaVEhSamtsbDc2OU8rbkxi?=
 =?utf-8?B?cmxENHBTNXZSTnlOYWp4alRiR3N2TlljVzR1UCtZTUtIbnJ4Q05yRmFCUGRM?=
 =?utf-8?B?NHpjVG1DbXlvWjZ4VWpOOHZ6c2M0Tng2ZVd3Q3lKS3hYL0ZxWmlqRURtcXFy?=
 =?utf-8?B?eVg4MmlVa3oxdGpQVmpTNVR2dFRZVVFtZ1VHN0xEdTdZZ2srUDl4cHdGWjI2?=
 =?utf-8?B?eTFJRzdaTnByOW5wSXhxdzBCbCtzVG5QbXlYcGhzeDFRd2UyWTVUME92K0Yy?=
 =?utf-8?B?TDZ3M3pLSy9NZitxR2dvbHdpV0RhQmx2MDViUGozbHFMOWtkejdUcWp4SVoz?=
 =?utf-8?B?U3B1ai9BWXBXc0hSSlZZR3pMelZlVUR1b3hXbEdaN01HZ2lNNm5FRlFFbitq?=
 =?utf-8?B?dWRMT2pHZ3cvb0dyd3FHSHpleHpWY0dwWkxuejBZbWVnbWp4Mys0ckszdXJI?=
 =?utf-8?B?elBOUWRYL1NZTEdXelNpV3FoZHpzVENBajdEQUwzVkNLODh0QkZHZVBTRW5Q?=
 =?utf-8?Q?l7ftozsEwt27OuK0qTJEawnXOdKUO+E8iL4UA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVk4WlNmbTlWVzZLV3Z0V1hpWGs2QVV0WitxaGlGeWZxaHIzS2hNK1M4ZW03?=
 =?utf-8?B?MERVaHdhTm9uT1VhNlN2RDR0RVdlTUtic1BKZ2lhRHYzbndCMi9wNWVLc2dP?=
 =?utf-8?B?NEozL1FiV3RhMlR0NEhFUHE0cXhNcllMdm4ybldteUpUa1RXZGVHQTh0QzRV?=
 =?utf-8?B?Q0lkOWxyU0FKemI4Znk5OUFobmw1K1JKdFNvdjVhZFQzSThoQnFNYlAvbi9R?=
 =?utf-8?B?V3Jid3YzWDBRaVliVUJxYllPVkdvZkRwV0srNWI5UEU5SmVzSmJ0SmJjZjlL?=
 =?utf-8?B?YUxoYWQ3bjBLUTNSR2x1dGh1dytzTXZRRytKM3phbldFWTdkd3JJNWFwTkgy?=
 =?utf-8?B?Rjg0YkNGbjU2dk56ZU9tWENqMHBQTHdXVzRpd01uTkcyU3ZkVFVETWhVcGRK?=
 =?utf-8?B?QlZ0cGdtUlhVQXZ2dHVhU3NyczcvcWdoeks2ZDVJY0xCNW9wUXRpUlFBdWkr?=
 =?utf-8?B?WStSa0kvbGpPMnh2MXRlQlNrWXpHOUNvSDZrMjlLam9PaVNFQ0QrVDQwT2ky?=
 =?utf-8?B?ZlpSeWl2cmo3VGJ4MW9tb1BTVC9CSnRocTluL05ackxyYndrRXFFNFNBZjNJ?=
 =?utf-8?B?dEFoTExUdmR4ajBLUlJiMVI3UW5pV1J4TXJYNUlYQWc0cjFiR1c3ay90R21F?=
 =?utf-8?B?WmxyaFp2NmxQZThlL012Z09ub0oyQU8xUDQ5dEhZR3lmSDFkeDJJS1FMRnFD?=
 =?utf-8?B?d21ETVpwQ2dVM1gzUHVaaDNZMXVRbFhlRjhRV1NkVlorbVZlczlDdEErMHRT?=
 =?utf-8?B?SUpBbVN6cWtBdUQvTVpIcnQxV3NRc3NRaHVVVCsvWkhRcXdQQkI0MTZMTVI0?=
 =?utf-8?B?cUg0dUdQemVxdkFKaEsrMzVaemtSY0o2Mmd5a2pBeVRrazN6UnF6bWxZR0xw?=
 =?utf-8?B?VWZPK3MrL2g5dWgxMGxzZFZNZDduakpGOXBVSmxsWVVUUzFrd0FJaytvbUd3?=
 =?utf-8?B?RUZVVkJRMnZNWG5jRnAvdVpPeU1YUE9VRU52a2J1Q1VKOHdhZEd4dVF2TVE0?=
 =?utf-8?B?ek0vZzZFWWNVRExPM0NpdUIva2d5Z0ZjMVM5blU0b2hnMzNiZWpuN2Vrc3Ja?=
 =?utf-8?B?VGxXUmRrTnhjVyt3cmtsVUtyYzg0WjhnelB1TG55MFlUUGFWQ3ViVGp6Ulk4?=
 =?utf-8?B?MEZIMGJacHJBNDE1bGZibGx1VHRHeXBtZll4UWN4aVN3dDdnc3ZrUHl3ZUhT?=
 =?utf-8?B?aGlvcVA1WHcwWWVpbHcwR1Ftb1VNcUN1SlVEanhMTElxMGNTWWVZWWFkWXp5?=
 =?utf-8?B?Z04rY3dPaXpWL3hiUWc1TlVkSkhCbDJMOU45RUp0QTc5eTR3L0FWQ0dYV3hP?=
 =?utf-8?B?SDlGbjdpNkYvc2pHY3IyVk5abnNJVVBZOFlyY2pPckVnYy9GUU1VOE94VUcy?=
 =?utf-8?B?N2M4WDZSQ3R4ZmVkVDVrL045TGZlWE12UVZwMDV5emlZQWdVN3VuT1ZGdXI1?=
 =?utf-8?B?eTI3ZDlkWDVwQy9NV3dZWkFaZElOZWxHMFArRHQxY1lYMkkrQkR0eVRqek04?=
 =?utf-8?B?SjRYV1BCWHhka3ZyVThCdWhNUmZHOFhKN3RMd0Y5TU40Nk0wVkR2ZzFRdjFo?=
 =?utf-8?B?akN1T2hjWEhHckRDWG9JdUtHN3Y5OVEvSDV0dEhkeVQyTG1WWCtHckN0SW9F?=
 =?utf-8?B?ODNWSW1ZY2xqVWN2TWRHUEJCNTExMWlJZTZQQ2JDVGdmbHRsZElWWDVNZ0li?=
 =?utf-8?B?KzhReFJyWFgxb2tZUlRrNTNkUG5TTWUvMVVWbldsY253RUlEWG42S0ozR0hN?=
 =?utf-8?B?alp6WTY4MFpnc2U1OWdhaW1zZG91bmREM0N2Z3gyRVRrdnlQb1BHaHZrNmZD?=
 =?utf-8?B?MDF2bGVWRTZzTVY2blNibGNWczRSKzc5KzZMN20xOGw1SDZJSUc0Q3FXRmpE?=
 =?utf-8?B?VlVpM1BUSlVSUHBoaFdZYUpuNndGMGExUHNFZ2F2dVJYbDZMdVlzcCt2UVdF?=
 =?utf-8?B?SEpTa1VEQzBFVzZLL0VVMnJvV2JTUUtKYS9YelNwd2MwVTZmc3ZYdklhaVVn?=
 =?utf-8?B?c3JYakgxS056Z3lTTnJxV3lUcXpOTllvenFlRmhpME9uanJQR253SDVjbTlY?=
 =?utf-8?B?Ly9XS2x3OUh6UGtoQzZPcjltM3BHZkcwSWdMUk9mSGdrcDViUGVrdlRYVWNy?=
 =?utf-8?Q?ljXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EB7346B7A9E7D4186789DAAEC80C1BD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b126e0-b987-417f-49d4-08dcf3453824
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 09:29:39.9428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XtLWSR/wPx927qcwjipSVAN6+Go+sSn3jcu3U6dRcG033TqLaHFrNIOiYES+SEsBaKP7B5/+BLBWFpZ1Ka3oZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103

T24gMjAyNC8xMC8yMiAwNDo1NSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPiBPbiAxMC8x
Ni8yNCAwMjoyOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJbiBQVkggZG9tMCwgd2hlbiBwYXNz
dGhyb3VnaCBhIGRldmljZSB0byBkb21VLCBRRU1VIGNvZGUNCj4+IHhlbl9wdF9yZWFsaXplLT54
Y19waHlzZGV2X21hcF9waXJxIHdhbnRzIHRvIHVzZSBnc2ksIGJ1dCBpbiBjdXJyZW50IGNvZGVz
DQo+PiB0aGUgZ3NpIG51bWJlciBpcyBnb3QgZnJvbSBmaWxlIC9zeXMvYnVzL3BjaS9kZXZpY2Vz
LzxzYmRmPi9pcnEsIHRoYXQgaXMNCj4+IHdyb25nLCBiZWNhdXNlIGlycSBpcyBub3QgZXF1YWwg
d2l0aCBnc2ksIHRoZXkgYXJlIGluIGRpZmZlcmVudCBzcGFjZXMsIHNvDQo+PiBwaXJxIG1hcHBp
bmcgZmFpbHMuDQo+Pg0KPj4gVG8gc29sdmUgYWJvdmUgcHJvYmxlbSwgdXNlIG5ldyBpbnRlcmZh
Y2Ugb2YgWGVuLCB4Y19wY2lkZXZfZ2V0X2dzaSB0byBnZXQNCj4+IGdzaSBhbmQgdXNlIHhjX3Bo
eXNkZXZfbWFwX3BpcnFfZ3NpIHRvIG1hcCBwaXJxIHdoZW4gZG9tMCBpcyBQVkguDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1i
eTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiAtLS0NCj4+IEhpIEFsbCwN
Cj4+IFRoaXMgaXMgdjggdG8gc3VwcG9ydCBwYXNzdGhyb3VnaCBvbiBYZW4gd2hlbiBkb20wIGlz
IFBWSC4NCj4+IHY3LT52OCBjaGFuZ2U6DQo+PiAqIFNpbmNlIHhjX3BoeXNkZXZfZ3NpX2Zyb21f
ZGV2IHdhcyByZW5hbWVkIHRvIHhjX3BjaWRldl9nZXRfZ3NpLCBjaGFuZ2VkIGl0Lg0KPj4gKiBB
ZGRlZCB4ZW5fcnVuX3FlbXVfb25faHZtIHRvIGNoZWNrIGlmIFFlbXUgcnVuIG9uIFBWIGRvbTAs
IGlmIG5vdCB1c2UgeGNfcGh5c2Rldl9tYXBfcGlycV9nc2kgdG8gbWFwIHBpcnEuDQo+PiAqIFVz
ZWQgQ09ORklHX1hFTl9DVFJMX0lOVEVSRkFDRV9WRVJTSU9OIHRvIHdyYXAgdGhlIG5ldyBwYXJ0
IGZvciBjb21wYXRpYmlsaXR5Lg0KPj4gKiBBZGRlZCAiI2RlZmluZSBET01JRF9SVU5fUUVNVSAw
IiB0byByZXByZXNlbnQgdGhlIGlkIG9mIGRvbWFpbiB0aGF0IFFlbXUgcnVuIG9uLg0KPj4NCj4+
DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hlbg0KPj4NCj4+DQo+Pg0KPj4gdjYtPnY3
IGNoYW5nZXM6DQo+PiAqIEJlY2F1c2UgdGhlIGZ1bmN0aW9uIG9mIG9idGFpbmluZyBnc2kgd2Fz
IGNoYW5nZWQgb24gdGhlIGtlcm5lbCBhbmQgWGVuIHNpZGUuIENoYW5nZWQgdG8gdXNlDQo+PiAg
IHhjX3BoeXNkZXZfZ3NpX2Zyb21fZGV2LCB0aGF0IHJlcXVpcmVzIHBhc3NpbmcgaW4gc2JkZiBp
bnN0ZWFkIG9mIGlycS4NCj4+DQo+PiB2NS0+djYgY2hhbmdlczoNCj4+ICogQmVjYXVzZSB0aGUg
ZnVuY3Rpb24gb2Ygb2J0YWluaW5nIGdzaSB3YXMgY2hhbmdlZCBvbiB0aGUga2VybmVsIGFuZCBY
ZW4gc2lkZS4gQ2hhbmdlZCB0byB1c2UNCj4+ICAgeGNfcGh5c2Rldl9nc2lfZnJvbV9pcnEsIGlu
c3RlYWQgb2YgZ3NpIHN5c2ZzLg0KPj4gKiBTaW5jZSBmdW5jdGlvbiBjaGFuZ2VkLCByZW1vdmVk
IHRoZSBSZXZpZXctYnkgb2YgU3RlZmFuby4NCj4+DQo+PiB2NC0+djUgY2hhbmdlczoNCj4+ICog
QWRkZWQgUmV2aWV3LWJ5IFN0ZWZhbm8uDQo+Pg0KPj4gdjMtPnY0IGNoYW5nZXM6DQo+PiAqIEFk
ZGVkIGdzaSBpbnRvIHN0cnVjdCBYZW5Ib3N0UENJRGV2aWNlIGFuZCB1c2VkIGdzaSBudW1iZXIg
dGhhdCByZWFkIGZyb20gZ3NpIHN5c2ZzDQo+PiAgIGlmIGl0IGV4aXN0cywgaWYgdGhlcmUgaXMg
bm8gZ3NpIHN5c2ZzLCBzdGlsbCB1c2UgaXJxLg0KPj4NCj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4g
KiBEdWUgdG8gY2hhbmdlcyBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIHNlY29uZCBwYXRj
aCBvbiBrZXJuZWwgc2lkZSh0aGF0IGFkZHMNCj4+ICAgYSBuZXcgc3lzZnMgZm9yIGdzaSBpbnN0
ZWFkIG9mIGEgbmV3IHN5c2NhbGwpLCBzbyByZWFkIGdzaSBudW1iZXIgZnJvbSB0aGUgc3lzZnMg
b2YgZ3NpLg0KPj4NCj4+IHYxIGFuZCB2MjoNCj4+IFdlIGNhbiByZWNvcmQgdGhlIHJlbGF0aW9u
IGJldHdlZW4gZ3NpIGFuZCBpcnEsIHRoZW4gd2hlbiB1c2Vyc3BhY2UocWVtdSkgd2FudA0KPj4g
dG8gdXNlIGdzaSwgd2UgY2FuIGRvIGEgdHJhbnNsYXRpb24uIFRoZSB0aGlyZCBwYXRjaCBvZiBr
ZXJuZWwoeGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbA0KPj4gdG8gZ2V0IGdzaSBmcm9tIGly
cSkgcmVjb3JkcyBhbGwgdGhlIHJlbGF0aW9ucyBpbiBhY3BpX3JlZ2lzdGVyX2dzaV94ZW5fcHZo
KCkgd2hlbiBkb20wDQo+PiBpbml0aWFsaXplIHBjaSBkZXZpY2VzLCBhbmQgcHJvdmlkZSBhIHN5
c2NhbGwgZm9yIHVzZXJzcGFjZSB0byBnZXQgdGhlIGdzaSBmcm9tIGlycS4gVGhlDQo+PiB0aGly
ZCBwYXRjaCBvZiB4ZW4odG9vbHM6IEFkZCBuZXcgZnVuY3Rpb24gdG8gZ2V0IGdzaSBmcm9tIGly
cSkgYWRkIGEgbmV3IGZ1bmN0aW9uDQo+PiB4Y19waHlzZGV2X2dzaV9mcm9tX2lycSgpIHRvIGNh
bGwgdGhlIG5ldyBzeXNjYWxsIGFkZGVkIG9uIGtlcm5lbCBzaWRlLg0KPj4gQW5kIHRoZW4gdXNl
cnNwYWNlIGNhbiB1c2UgdGhhdCBmdW5jdGlvbiB0byBnZXQgZ3NpLiBUaGVuIHhjX3BoeXNkZXZf
bWFwX3BpcnEoKSB3aWxsIHN1Y2Nlc3MuDQo+Pg0KPj4gSXNzdWVzIHdlIGVuY291bnRlcmVkOg0K
Pj4gMS4gZmFpbGVkIHRvIG1hcCBwaXJxIGZvciBnc2kNCj4+IFByb2JsZW06IHFlbXUgd2lsbCBj
YWxsIHhjX3BoeXNkZXZfbWFwX3BpcnEoKSB0byBtYXAgYSBwYXNzdGhyb3VnaCBkZXZpY2UncyBn
c2kgdG8gcGlycSBpbg0KPj4gZnVuY3Rpb24geGVuX3B0X3JlYWxpemUoKS4gQnV0IGZhaWxlZC4N
Cj4+DQo+PiBSZWFzb246IEFjY29yZGluZyB0byB0aGUgaW1wbGVtZW50IG9mIHhjX3BoeXNkZXZf
bWFwX3BpcnEoKSwgaXQgbmVlZHMgZ3NpIGluc3RlYWQgb2YgaXJxLA0KPj4gYnV0IHFlbXUgcGFz
cyBpcnEgdG8gaXQgYW5kIHRyZWF0IGlycSBhcyBnc2ksIGl0IGlzIGdvdCBmcm9tIGZpbGUNCj4+
IC9zeXMvYnVzL3BjaS9kZXZpY2VzL3h4eHg6eHg6eHgueC9pcnEgaW4gZnVuY3Rpb24geGVuX2hv
c3RfcGNpX2RldmljZV9nZXQoKS4gQnV0IGFjdHVhbGx5DQo+PiB0aGUgZ3NpIG51bWJlciBpcyBu
b3QgZXF1YWwgd2l0aCBpcnEuIFRoZXkgYXJlIGluIGRpZmZlcmVudCBzcGFjZS4NCj4+IC0tLQ0K
Pj4gIGh3L3hlbi94ZW5fcHQuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgaHcveGVuL3hlbl9wdC5oIHwgIDEgKw0KPj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0
LmMgYi9ody94ZW4veGVuX3B0LmMNCj4+IGluZGV4IDM2MzVkMWIzOWY3OS4uN2Y4MTM5ZDIwOTE1
IDEwMDY0NA0KPj4gLS0tIGEvaHcveGVuL3hlbl9wdC5jDQo+PiArKysgYi9ody94ZW4veGVuX3B0
LmMNCj4+IEBAIC03NjYsNiArNzY2LDQxIEBAIHN0YXRpYyB2b2lkIHhlbl9wdF9kZXN0cm95KFBD
SURldmljZSAqZCkgew0KPj4gIH0NCj4+ICAvKiBpbml0ICovDQo+PiAgDQo+PiArI2RlZmluZSBQ
Q0lfU0JERihzZWcsIGJ1cywgZGV2LCBmdW5jKSBcDQo+PiArICAgICAgICAgICAgKCgoKHVpbnQz
Ml90KShzZWcpKSA8PCAxNikgfCBcDQo+PiArICAgICAgICAgICAgKFBDSV9CVUlMRF9CREYoYnVz
LCBQQ0lfREVWRk4oZGV2LCBmdW5jKSkpKQ0KPiANCj4gTml0OiBUaGlzIG1hY3JvIGxvb2tzIGdl
bmVyaWMgYW5kIHVzZWZ1bC4gV291bGQgaXQgYmUgYmV0dGVyIGRlZmluZWQgaW4NCj4gaW5jbHVk
ZS9ody9wY2kvcGNpLmg/DQo+IA0KPj4gKw0KPj4gKyNpZiBDT05GSUdfWEVOX0NUUkxfSU5URVJG
QUNFX1ZFUlNJT04gPj0gNDIwMDANCj4+ICtzdGF0aWMgYm9vbCB4ZW5fcnVuX3FlbXVfb25faHZt
KHZvaWQpDQo+IA0KPiBUaGlzIGZ1bmN0aW9uIG5hbWUgc2VlbXMgdG8gaW1wbHkgImlzIHFlbXUg
cnVubmluZyBvbiBIVk0/IiwgYnV0IEkgdGhpbmsNCj4gdGhlIHF1ZXN0aW9uIHdlJ3JlIHJlYWxs
eSB0cnlpbmcgdG8gYW5zd2VyIGlzIHdoZXRoZXIgdGhlIHBjaWRldiBuZWVkcw0KPiBhIEdTSSBt
YXBwZWQuIEhvdyBhYm91dCBjYWxsaW5nIHRoZSBmdW5jdGlvbiAieGVuX3B0X25lZWRzX2dzaSIg
b3INCj4gc2ltaWxhcj8NCj4gDQo+PiArew0KPj4gKyAgICB4Y19kb21haW5pbmZvX3QgaW5mbzsN
Cj4+ICsNCj4+ICsgICAgaWYgKCF4Y19kb21haW5fZ2V0aW5mb19zaW5nbGUoeGVuX3hjLCBET01J
RF9SVU5fUUVNVSwgJmluZm8pICYmDQo+PiArICAgICAgICAoaW5mby5mbGFncyAmIFhFTl9ET01J
TkZfaHZtX2d1ZXN0KSkgew0KPiANCj4gSSB0aGluayByZWFkaW5nIC9zeXMvaHlwZXJ2aXNvci9n
dWVzdF90eXBlIHdvdWxkIGFsbG93IHlvdSB0byBnZXQgdGhlDQo+IHNhbWUgaW5mb3JtYXRpb24g
d2l0aG91dCBhbm90aGVyIGh5cGVyY2FsbC4NCj4gDQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gZmFsc2U7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyBpbnQgeGVuX21hcF9waXJxX2Zvcl9nc2koUENJRGV2aWNlICpkLCBpbnQgKnBpcnEp
DQo+IA0KPiBOaXQ6IHMveGVuXy94ZW5fcHRfLw0KPiANCj4+ICt7DQo+PiArICAgIGludCBnc2k7
DQo+PiArICAgIFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMgPSBYRU5fUFRfREVWSUNFKGQpOw0K
Pj4gKw0KPj4gKyAgICBnc2kgPSB4Y19wY2lkZXZfZ2V0X2dzaSh4ZW5feGMsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBDSV9TQkRGKHMtPnJlYWxfZGV2aWNlLmRvbWFpbiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcy0+cmVhbF9kZXZpY2UuYnVz
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5yZWFsX2Rldmlj
ZS5kZXYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMtPnJlYWxf
ZGV2aWNlLmZ1bmMpKTsNCj4+ICsgICAgaWYgKGdzaSA+PSAwKSB7DQo+PiArICAgICAgICByZXR1
cm4geGNfcGh5c2Rldl9tYXBfcGlycV9nc2koeGVuX3hjLCB4ZW5fZG9taWQsIGdzaSwgcGlycSk7
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIGdzaTsNCj4+ICt9DQo+PiArI2VuZGlm
DQo+PiArDQo+PiAgc3RhdGljIHZvaWQgeGVuX3B0X3JlYWxpemUoUENJRGV2aWNlICpkLCBFcnJv
ciAqKmVycnApDQo+PiAgew0KPj4gICAgICBFUlJQX0dVQVJEKCk7DQo+PiBAQCAtODQ3LDcgKzg4
MiwxNiBAQCBzdGF0aWMgdm9pZCB4ZW5fcHRfcmVhbGl6ZShQQ0lEZXZpY2UgKmQsIEVycm9yICoq
ZXJycCkNCj4+ICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgICB9DQo+PiAgDQo+PiArI2lmIENP
TkZJR19YRU5fQ1RSTF9JTlRFUkZBQ0VfVkVSU0lPTiA+PSA0MjAwMA0KPj4gKyAgICBpZiAoeGVu
X3J1bl9xZW11X29uX2h2bSgpKSB7DQo+PiArICAgICAgICByYyA9IHhlbl9tYXBfcGlycV9mb3Jf
Z3NpKGQsICZwaXJxKTsNCj4+ICsgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgIHJjID0geGNfcGh5
c2Rldl9tYXBfcGlycSh4ZW5feGMsIHhlbl9kb21pZCwgbWFjaGluZV9pcnEsICZwaXJxKTsNCj4+
ICsgICAgfQ0KPj4gKyNlbHNlDQo+PiAgICAgIHJjID0geGNfcGh5c2Rldl9tYXBfcGlycSh4ZW5f
eGMsIHhlbl9kb21pZCwgbWFjaGluZV9pcnEsICZwaXJxKTsNCj4+ICsjZW5kaWYNCj4+ICsNCj4+
ICAgICAgaWYgKHJjIDwgMCkgew0KPj4gICAgICAgICAgWEVOX1BUX0VSUihkLCAiTWFwcGluZyBt
YWNoaW5lIGlycSAldSB0byBwaXJxICVpIGZhaWxlZCwgKGVycjogJWQpXG4iLA0KPj4gICAgICAg
ICAgICAgICAgICAgICBtYWNoaW5lX2lycSwgcGlycSwgZXJybm8pOw0KPj4gZGlmZiAtLWdpdCBh
L2h3L3hlbi94ZW5fcHQuaCBiL2h3L3hlbi94ZW5fcHQuaA0KPj4gaW5kZXggMDk1YTBmMDM2NWQ0
Li5hMDhiNDViN2ZiYWUgMTAwNjQ0DQo+PiAtLS0gYS9ody94ZW4veGVuX3B0LmgNCj4+ICsrKyBi
L2h3L3hlbi94ZW5fcHQuaA0KPj4gQEAgLTM2LDYgKzM2LDcgQEAgdm9pZCB4ZW5fcHRfbG9nKGNv
bnN0IFBDSURldmljZSAqZCwgY29uc3QgY2hhciAqZiwgLi4uKSBHX0dOVUNfUFJJTlRGKDIsIDMp
Ow0KPj4gICMgIGRlZmluZSBYRU5fUFRfTE9HX0NPTkZJRyhkLCBhZGRyLCB2YWwsIGxlbikNCj4+
ICAjZW5kaWYNCj4+ICANCj4+ICsjZGVmaW5lIERPTUlEX1JVTl9RRU1VIDANCj4+ICANCj4+ICAv
KiBIZWxwZXIgKi8NCj4+ICAjZGVmaW5lIFhFTl9QRk4oeCkgKCh4KSA+PiBYQ19QQUdFX1NISUZU
KQ0KPiANCldoYXQgeW91IHNhaWQgbWFrZXMgbW9yZSBzZW5zZS4gSSB3aWxsIGNoYW5nZSB0aGlz
IHBhdGNoIGFjY29yZGluZyB0byB5b3VyIGNvbW1lbnRzLiBUaGFuayB5b3UgdmVyeSBtdWNoIQ0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

