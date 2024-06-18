Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EFD90C402
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 08:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742723.1149570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSf5-0005cZ-SH; Tue, 18 Jun 2024 06:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742723.1149570; Tue, 18 Jun 2024 06:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSf5-0005Zu-P7; Tue, 18 Jun 2024 06:49:47 +0000
Received: by outflank-mailman (input) for mailman id 742723;
 Tue, 18 Jun 2024 06:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZif=NU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJSf4-0005Zo-PY
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 06:49:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f213d70b-2d3e-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 08:49:45 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 06:49:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 06:49:42 +0000
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
X-Inumbo-ID: f213d70b-2d3e-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akOmFUnMh9zIUyNTxQZb++H4M0PzBXIEDcUOu3Xk0TK+ZRrS/aUGBX2VGE8k5dibIHz8ZXVK9jeGAas95NSQcSb68Z+9A36rTnUwTVhthqt8/T7O4WLi3iqFxyvRM6vYUYgxpfrRVxSYAw87XWH82inKGkdFmoqWzIYnIzwhXZ1wIU2chpz4SJHSfpTYs3xIZchzKET2XIm1f1GVt/EVTGKYpAGUJvHQHKZALYE4/s1EnKD5ztu75zTPVTfZD3ZodF5sMg88q8SuDiysium7uzEVhUrVJfZirL9iwWk2iPbckLok8Zb7+cfYAf8L8L2rOJwVz0XhqArSefnz3wvs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z317kdvVsYYquI0dJeuWg9+8nI6pwxFMuT/MhT7h7M=;
 b=eoMmcfRumMy4HIPoF/hgWt95aIuB2nWWiekqSM7G4810cJD45h6U264AUZUOzq5diLkz/7yfbNDnZqPL02yziRB5Ba7SbzLxUqddCGhcOVfQCWnsDoVG5DMlHmFddCimAZ2JMoBgO0ldQjy6836wWdpiC8HE8xoBUI+L4K4XzjGaTAJhwyJ4cKc9/iDAnAv+KuqjzchGAOHJnXFIwSYkLg9NNd68Z+fZThKPaLC8pUXkQVtLC93wZWVhZIS9nvYLGV76iy5aO/iKZ28+Wr9+NJFp97QH6oBOlG5CrftQ0IwFiqIpTwjslD0AgejdkNQPylpGr/+sUyJQHSVcYXmiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z317kdvVsYYquI0dJeuWg9+8nI6pwxFMuT/MhT7h7M=;
 b=pHO9/VmuVUnBtcv0X6PN37PGN6H62bhIGPQlapsR8UCCpgEPjxiT08rkr6iTu+liceKLe+FaxJILmeoXYmGf6Hw4BzXS1a12PghleASHcaRBX2/dFblP8imn7zLzk8vI7s+ndriAN+6ax3zLbBNJW9Tz8ovey99Z9eXRsFXpFqM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHawJTj1WGIKHaz7U+FK+dQX59GpLHMCLWAgAGOVIA=
Date: Tue, 18 Jun 2024 06:49:42 +0000
Message-ID:
 <BL1PR12MB5849FC16D91FADD5B7D30A63E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-3-Jiqian.Chen@amd.com>
 <cb9910cd-7045-4c0d-a7cf-2bcf36e30cb2@suse.com>
In-Reply-To: <cb9910cd-7045-4c0d-a7cf-2bcf36e30cb2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6265:EE_
x-ms-office365-filtering-correlation-id: e5a653d3-6788-4102-d49e-08dc8f62d4e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|1800799021|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3pmcWp1K1VUVkxNaXRqNGpkRXNGd1VZWFNuREdyRGJBalgwMm12UWJZcGR5?=
 =?utf-8?B?aGNrK2VSSWVIUVF6NXJqT2xmSHZnTFQ0VFZoQlQreVlzVnZEdWxSRnBRMEZO?=
 =?utf-8?B?M2p1L1pSN2lVczhTOERzdVFHc2h2SWRWMzY2M1N5eEtKQWc0aGliSGtGQkhE?=
 =?utf-8?B?cW9aWVIvdmRydURReEgzUEwySnp4dzRTOW5mUERuRFZYSU9uRU5TVnhXelZz?=
 =?utf-8?B?Vk1rSGRPRlV1SzUzemE0UXlSM01zTTlrZ1N0Mkg4OXBFK2xEVUQ3NStkY3do?=
 =?utf-8?B?NGFDYjk0UlYzMEtqZ25tL3ZCSnpwbllnaUlyblQ4K0FZeUJHSTF6YXZ1R3Br?=
 =?utf-8?B?THJlMUE4YTRYbmRKUFNGQVJlUTNzNURLc1ZGRndQZFFXTmY2MVM5ZjFvTFlZ?=
 =?utf-8?B?OTRUcnowVVFOUExScE9ENEo4VzkzRFZITkF4OGsrNjJZTllnU0RsRitwY2la?=
 =?utf-8?B?MGlneUFkYnZ3L2phVnNpN2pXRVBKcENlUlVveExXdWZIbS85ODJoRjBnaDJz?=
 =?utf-8?B?YkpUL3FmeHFQcjB5SnV6TDJVV2tmNEJTNWp2cmpUdkdHYzBJeTNBNUZkelF6?=
 =?utf-8?B?S3g5YmFWb1RRTDVyYjNOcE5VYTRMQm8wd3F4bjJCNEpnZVh5eVJzQ3RSbTFT?=
 =?utf-8?B?RGRXTE9SMVQ0b29IUHFFTEZ2N2EzLzl3aXV1dE5wM0didWtjY21kbERVMmR0?=
 =?utf-8?B?Z2tmb0lISXJ4VVZyekdXNDNQcnVxSGlsTExSaE9rZ2d3MllIUWZiV0NMMWds?=
 =?utf-8?B?UkFIL1dTbWFpRXZhMnJHZ3MxWU5PWlZheHp4ci9vbjlEcUx0d1FjblN1Y3RX?=
 =?utf-8?B?QU5GVlgybWNVc3BzNFo3b2tCc3A2ZnNVS2hEWFVuTElyaVc5cEVmTWhPZHJu?=
 =?utf-8?B?V3BLam9RVjFkVWdmWnVEdUFYaXRCRnFEZG9zY1h4NUJXZXFERVNDaHorMWJ3?=
 =?utf-8?B?NDV6bUJubGJrWTNmL2ZHU1JocHl5cUlINlRLSURWeXR5VmdDRjZvMjV3TXpG?=
 =?utf-8?B?M0FNV09YVTJrbUkxc28waWNIdlp5ZjZDcDJqbWRhdXo2dFBiQVdZOXR4UDhi?=
 =?utf-8?B?dWhUeFRnbUd3VmJZYVlqb2poUG9hNzhTVFRNZzBhOHlrM0xySW56SVdTeUZ1?=
 =?utf-8?B?dVk2Q3U2akJBZUxkMFMxdE5rTHZaQnkyZkRobklCUm5mOEZkU1N1U1hQRmV5?=
 =?utf-8?B?SnRQbzh2ME84QUhHL3BzZkFTUTB6MGhDQzJCR0FFZGRyNzVKNUpjNnRoekVt?=
 =?utf-8?B?SER5aGxWb05pSkI4VVRXTHpTUVdtSEF2TzhtSUEvVDhvbDhCOE1vUlRETU1O?=
 =?utf-8?B?NGtxUU9BVDB6Y0xtK2J3c1dOU0thYWpicUJSQjM1STZrZ1hZYUFoT3JtMmlj?=
 =?utf-8?B?QnV4dk9WVzN4YmdJRXBsc3pJOWowZFdpQVZ3YjF6anIwS05QZ2F3ZEd0Rkhx?=
 =?utf-8?B?S3FMZnJyS044amVzcUpxcVo1ZStVTjJDQXFHdVRNUXhMejFQZy9JeDhNckJS?=
 =?utf-8?B?SFNDWDc5elBJR0lVaHB0TUVRMGNZTWlZa2l2bnhkSmVoa3ZwTE9lcVlGdG5X?=
 =?utf-8?B?NTgwYkp1alhPdzZKNnpzVjhEL0ZlWU03dmdESXg5Mi9VWDFpMU1EMm1VeFZY?=
 =?utf-8?B?SlF6SGJKZ3JtbXRVTlBWMzB3a1BxVG9BTzNEcFV3T0JGaU1BcE4rZ3hLcmpK?=
 =?utf-8?B?SDdFZ09pUGdWWkhNRkd0cE9EeXNYTEVYU0F0SFRkODdqaW0wM0JXL3Z1TGtt?=
 =?utf-8?B?VEFXaDR6cG93cVE3SldLSnBBcUxQNjUrL1MwN25FckgwRTBQK3RsMC95VHBk?=
 =?utf-8?Q?RGyOBslXMK2cqg03VkB7sDzzae7d+0ldSQNB8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1BWWWlPZU5sYTd2alhyTjFkT2tSQ2dsa1VPSFIwQTBQdW82T1BjTzA3Zm1h?=
 =?utf-8?B?WlRzNWZnaDBwdU9Kc2tMUjBCbnZnZGpoK1VjUE5kYmVwcjJ0enlRYnQyRStl?=
 =?utf-8?B?Yk93WDlEdlBYbzNUNVJhM0FsTzg2WmNjaHpwWDdVVGtjc2toNy9vOGpPZWhK?=
 =?utf-8?B?R080SmNiMDN6U2NISFVxODZRWUFxQXdyRzZVUk94bVh3cWRndFNsMmcxajVt?=
 =?utf-8?B?cDdJZ0l6bVFsbzI5Wkt2ZE1vall6eWM0emRNcDVnNEVwblk3MkUzR2o3RXZQ?=
 =?utf-8?B?S05aZUR6bnplMElMY2lSVitWT2tOeWxidmhPZFFpZENWOXczVEIza3dyUUcv?=
 =?utf-8?B?YUhjYTBJdlo2S01oSGNXdTJsRmFQOE0vK3dIbVpHa0VxOEU4UzdzTnp3d0tS?=
 =?utf-8?B?b2NGZVBqeVBPWG55ckVCTWJiWUlsMUpNeTIxa2RYZDA3ODFZRGpKR0NFcDIr?=
 =?utf-8?B?V05jNlVlaW9wRllrUDNEU21iVmZhNVgvQWxHNlJWUnFwSGxQUVU5dVRtMTJH?=
 =?utf-8?B?U010TXBPRFJ6bDBUMkVaSm10bEhmM01CSGo0R3NBKzVTSzAvQXlOeFVxdXRM?=
 =?utf-8?B?TEpIcEJ2Q2tFblpBenkva0dtOHBNaEVTSzlVeldPWVE0Ni9VSmpGUGlhU0VG?=
 =?utf-8?B?VzNrZlJ1bGk2eU1VRWZmZGZkL0hOd1Q4alBVZ1Rrck1QMUtEczFyc29YSnJM?=
 =?utf-8?B?Qng1dHVDc2hpQVhLaFV0R0N1dXU5c2k3b3AyVDhpem1UM1lXSGprTUZtdmhk?=
 =?utf-8?B?MVNIM0FrSlluZmNyMWlNQmpscTNWajJnTVZJZGdISnRpb21qNk00MDZ6YWtL?=
 =?utf-8?B?SkdKeFh4UzhSc2JWMWhJMDZrZVk1UG5QdXcxdE52amM5ZXBpVjROZElLUnZk?=
 =?utf-8?B?K0RFNHlFcDRySnZOWGtVamxIc2hkNmJTQ2VPS25ZZ0orYU1mUkg3SjNOSDdn?=
 =?utf-8?B?WG4wUVZBOXd5eGRGQ3VXMmU1Wm00T1YzMndmOW9YS2djaDhOWHNsTmlDR0pH?=
 =?utf-8?B?TnZpS2V1eGU1NGRCaXBrQTdDdEtDcC9oSWJjeEs0YjFWN0dkVDR4NVRNbUhu?=
 =?utf-8?B?UlRidTJqNTNkZS9zdmxSTlFvK2NhODQ2aTFtQktSUzkyKytjQ05GYlZ0NXRC?=
 =?utf-8?B?SkNXU204anJucW9MOW5nK1JCZGJmMncvelNjZjc3ZTU4anA1bDlaV0dvNVR3?=
 =?utf-8?B?T0NwNUphdTR6NHg4WDVtVC9TQWF6S2ljUTVrQXpHYlRaVFROSTRFcjhRMU0z?=
 =?utf-8?B?cnZtRzZvSTlVSmVHNytDRWFGUDRzWklMelc0dEhXTDNxaU5oc3pFVFZTdEFr?=
 =?utf-8?B?ZkxQd1Y3V1ROMEJxTTZjSXUrTmJqQ2xIM1dwVHA1aWhHakhwUFB0MjJNYWc0?=
 =?utf-8?B?Zy9mT0NoWk8zTEhFQjB5ZkltNVRmUkw4WDJPRStsNFFYbDdLVkhiRjdUV0hy?=
 =?utf-8?B?RlplMW5nYmpDNm5wazRmYWxJd2J4RlJSaEFRZmdQRC9JbGg2NkhJT0ZTTGZU?=
 =?utf-8?B?ZThlZGloSUJINThISTFEbGlCY204MHJSMjNNYjIvTHBJZVlLaXp0VHFCRlJ0?=
 =?utf-8?B?cmJZWVFFSUVyOWMvYWhGdFMxbktGZVV2QWxkSUVQUUJzT2FvSFhRVEh4OWFM?=
 =?utf-8?B?b3ZnUkRBOXZlcjdzYjhMcmlGemlqQ1ZpME9yenVwMk9td2pUWkl4RlZMMFpv?=
 =?utf-8?B?b25sNmkvMzhoVjc2VUFyL3dML1JxNlpiWHNQeVFJQlZHMDVwQzhhR1VnNGN6?=
 =?utf-8?B?NUxmUlUrb3RHU09HSExkSXdNcm90REtoU1ZPempFbXF0UCtPRUp6aWNRZTZC?=
 =?utf-8?B?cnAyN3FmREVrWVVaODVxLzU0YkNPeXpOdHh4aFQwSW5NSTViUGdmcERMcDU2?=
 =?utf-8?B?UzhtV29ablNDQ0tIaXpwT0hkT0dvWGlCdWhyNUtvZUlIT0NQeWZycXducDZE?=
 =?utf-8?B?bk43UVdqdFFRTXduLzMwWk84QjRuUDMxd2Q4U0FRcFhXU09heE5zTk43SDk5?=
 =?utf-8?B?R2h2T3ZkaFlwTDE1RnpXMWtMWkNScmR3UVVPWkNlK2pacndKQWwvYXpTdWEr?=
 =?utf-8?B?Qlk3YVdTM2U1UGsvMU9ITXNJZ2t1TFNHbXBXZ2wvUVV4ZTdlNHd3bDM3Wlhn?=
 =?utf-8?Q?uHHM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2688986108B4454EA3C0123B9EEC9382@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a653d3-6788-4102-d49e-08dc8f62d4e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 06:49:42.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElsbhQtxZBQy4lN+ShCv+8wTCSxK6qPM3WYLWjoXcfgUX5iH4h+Iut5ZWPOhPQb59Bq2njwK9Do2WNeIs84hwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265

T24gMjAyNC82LzE3IDIyOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDYuMjAyNCAx
MTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJZiBydW4gWGVuIHdpdGggUFZIIGRvbTAgYW5k
IGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJxIGZvcg0KPj4gYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgYnkgdXNpbmcgZ3NpLCBzZWUgcWVtdSBjb2RlDQo+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5
c2Rldl9tYXBfcGlycSBhbmQgbGlieGwgY29kZQ0KPj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlz
ZGV2X21hcF9waXJxLiBUaGVuIHhjX3BoeXNkZXZfbWFwX3BpcnENCj4+IHdpbGwgY2FsbCBpbnRv
IFhlbiwgYnV0IGluIGh2bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+IGlzIG5v
dCBhbGxvd2VkIGJlY2F1c2UgY3VycmQgaXMgUFZIIGRvbTAgYW5kIFBWSCBoYXMgbm8NCj4+IFg4
Nl9FTVVfVVNFX1BJUlEgZmxhZywgaXQgd2lsbCBmYWlsIGF0IGhhc19waXJxIGNoZWNrLg0KPj4N
Cj4+IFNvLCBhbGxvdyBQSFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxz
byBhbGxvdw0KPj4gUEhZU0RFVk9QX3VubWFwX3BpcnEgZm9yIHRoZSBmYWlsZWQgcGF0aCB0byB1
bm1hcCBwaXJxLg0KPiANCj4gV2h5ICJmYWlsZWQgcGF0aCI/IElzbid0IHVubWFwcGluZyBhbHNv
IHBhcnQgb2Ygbm9ybWFsIGRldmljZSByZW1vdmFsDQo+IGZyb20gYSBndWVzdD8NClllcywgYm90
aC4gSSB3aWxsIGNoYW5nZSB0byBhbHNvICJhbGxvdyBQSFlTREVWT1BfdW5tYXBfcGlycSBmb3Ig
dGhlIGRldmljZSByZW1vdmFsIHBhdGggdG8gdW5tYXAgcGlycSIuDQoNCj4gDQo+PiBBbmQNCj4+
IGFkZCBhIG5ldyBjaGVjayB0byBwcmV2ZW50IHNlbGYgbWFwIHdoZW4gc3ViamVjdCBkb21haW4g
aGFzIG5vDQo+PiBQSVJRIGZsYWcuDQo+IA0KPiBZb3Ugc3RpbGwgdGFsayBvZiBvbmx5IHNlbGYg
bWFwcGluZywgYW5kIHRoZSBjb2RlIGFsc28gc3RpbGwgZG9lcyBvbmx5DQo+IHRoYXQuIEFzIHBv
aW50ZWQgb3V0IGJlZm9yZTogV2h5IHdvdWxkIHlvdSBhbGxvdyBtYXBwaW5nIGludG8gYSBQVkgN
Cj4gRG9tVT8gSU9XIHdoYXQgcHVycG9zZSBkbyB0aGUgImQgPT0gY3VycmQiIGNoZWNrcyBoYXZl
Pw0KVGhlIGNoZWNraW5nIEkgYWRkZWQgaGFzIHR3byBwdXJwb3NlLCBmaXJzdCBpcyBJIG5lZWQg
dG8gYWxsb3cgdGhpcyBjYXNlOg0KRG9tMCh3aXRob3V0IFBJUlEpICsgRG9tVSh3aXRoIFBJUlEp
LCBiZWNhdXNlIHRoZSBvcmlnaW5hbCBjb2RlIGp1c3QgZG8gKCFoYXNfcGlycShjdXJyZCkpIHdp
bGwgY2F1c2UgbWFwX3BpcnEgZmFpbCBpbiB0aGlzIGNhc2UuDQpTZWNvbmQgSSBuZWVkIHRvIGRp
c2FsbG93IHNlbGYtbWFwcGluZzoNCkRvbVUod2l0aG91dCBQSVJRKSBkbyBtYXBfcGlycSwgdGhl
ICJkPT1jdXJyZCIgbWVhbnMgdGhlIGN1cnJkIGlzIHRoZSBzdWJqZWN0IGRvbWFpbiBpdHNlbGYu
DQoNCkVtbW0sIEkgdGhpbmsgSSBrbm93IHdoYXQncyB5b3VyIGNvbmNlcm4uDQpEbyB5b3UgbWVh
biBJIG5lZWQgdG8NCiIgUHJldmVudCBtYXBfcGlycSB3aGVuIGN1cnJkIGhhcyBubyBYODZfRU1V
X1VTRV9QSVJRIGZsYWcgIg0KaW5zdGVhZCBvZg0KIiBQcmV2ZW50IHNlbGYtbWFwIHdoZW4gY3Vy
cmQgaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxhZyAiLA0Kc28gSSBuZWVkIHRvIHJlbW92ZSAi
ZD09Y3VycmQiLCByaWdodD8NCg0KPiANCj4+IFNvIHRoYXQgZG9tVSB3aXRoIFBJUlEgZmxhZyBj
YW4gc3VjY2VzcyB0byBtYXAgcGlycSBmb3INCj4+IHBhc3N0aHJvdWdoIGRldmljZXMgZXZlbiBk
b20wIGhhcyBubyBQSVJRIGZsYWcuDQo+IA0KPiBUaGVyZSdzIHN0aWxsIGEgZGVzY3JpcHRpb24g
cHJvYmxlbSBoZXJlLiBNdWNoIGxpa2UgdGhlIGZpcnN0IHNlbnRlbmNlLA0KPiB0aGlzIGxhc3Qg
b25lIGFsc28gc2F5cyB0aGF0IHRoZSBndWVzdCB3b3VsZCBpdHNlbGYgbWFwIHRoZSBwSVJRLiBJ
bg0KPiB3aGljaCBjYXNlIHRoZXJlIHdvdWxkIHN0aWxsIG5vdCBiZSBhbnkgcmVhc29uIHRvIGV4
cG9zZSB0aGUgc3ViLQ0KPiBmdW5jdGlvbnMgdG8gRG9tMC4NCklmIGNoYW5nZSB0byAiIFNvIHRo
YXQgdGhlIGludGVycnVwdCBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4gc3VjY2VzcyB0byBi
ZSBtYXBwZWQgdG8gcGlycSBmb3IgZG9tVSB3aXRoIFBJUlEgZmxhZyB3aGVuIGRvbTAgaXMgUFZI
LiIsDQpJcyBpdCBPSz8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFu
IENoZW4uDQo=

