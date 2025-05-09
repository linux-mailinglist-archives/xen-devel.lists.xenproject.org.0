Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F928AB09B2
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 07:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979773.1366273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDGGZ-0007rv-Ub; Fri, 09 May 2025 05:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979773.1366273; Fri, 09 May 2025 05:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDGGZ-0007ps-S0; Fri, 09 May 2025 05:27:23 +0000
Received: by outflank-mailman (input) for mailman id 979773;
 Fri, 09 May 2025 05:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDGGX-0007pi-Aw
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 05:27:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2412::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42cd7074-2c96-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 07:27:14 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 05:27:03 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 05:27:03 +0000
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
X-Inumbo-ID: 42cd7074-2c96-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoY+OaSXKbqL/PapIJLtwXQfu/tkgzwZfj+vVM7pMoCT+0Iu3ylAS2sp/SNNk6lAO+bDEzbNYDw2bzOH5GpQldTFzAtDnISCGFSqQLWCl5XHab1ec/xwJ3zRFvBuyAMhNDRHmYYk+5V2n5njLWvYwb0sH13rk7eqKXUbZJ6BmhLmdxAFZTg9Gkc5EmE9oBHFhMuI3j1Uf+Otc1evQmdBLFXMj9D0fKLB4hoLb7s95qKCEEJH+0EH/y6Ga1M9bnOHbb1Gm7PTQNrYjCsrcyaOw/LeZzGp70uOo59wa5cV4gVFas/PJgttmhc5DUcpqTtU6yu84aE9A7jvUTLnD5MRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjyZaWpR24+2z4/rJih/V4C6vN9fQU2HDqrvqFnp5rE=;
 b=p+nI6rB10+bYiqo2EtSohGmmuE+1gLdO78CvdShxEM8aPDGBTU8BmRd3lY6kE18+4qn+tVWS9+mFSb5rOlhax6coVg2AbJP6IgrtkMhegv/ZETE9YfU3lULExCnSnc9PP+PiSOFxAms3k2GsnHW35vBQZXPu6UnBs261MJB2nKbwDOAlgM5UXvwAlyUYofmxkkUIbEBep4LCnRrQdl+dII9cIX5Vopaow19KS63F+THP2Tx/N18+qiZUF8BwpM6zlNcIzXedrIiBOo0xgdlPK9xRuhFwdzAVu1NEh0IxyxiFJb+KjjLvihN/ARQHbuLVlRPpqJy7kUFsHMTC4I/U1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjyZaWpR24+2z4/rJih/V4C6vN9fQU2HDqrvqFnp5rE=;
 b=hjUljAIwl5xvW5AjJi0TXaXJcy4vm+VnWZ3MBzW0syFP9eetlndg3pzVOYNaboTOs5PagCHjyGbfqyh6edbJquqkphfBBFtspsrtxNW1xDJYWsiUT9hfeVV56lXZQ8BUGT2SIoBk1LiA5AwQwLNrwaRpJ5pvSBINZ4c/B8ROkvA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 09/11] vpci/rebar: Remove registers when init_rebar()
 fails
Thread-Topic: [PATCH v3 09/11] vpci/rebar: Remove registers when init_rebar()
 fails
Thread-Index: AQHbsoVe6F65c/dHgEykZ9ogXltmkLPIlQSAgAHRRYA=
Date: Fri, 9 May 2025 05:27:03 +0000
Message-ID:
 <BL1PR12MB5849F55BCEF039457078979AE78AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-10-Jiqian.Chen@amd.com>
 <aBx7teQ9ZoI0s4Jt@macbook.lan>
In-Reply-To: <aBx7teQ9ZoI0s4Jt@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8722.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB7255:EE_
x-ms-office365-filtering-correlation-id: 794fa715-3fdb-4af2-cf92-08dd8eba215c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlJORXlMYjg3MnhiRlZLbGZpWC9EM2QxaHd1NjhYSlB2clpHaTBWd0xvVFFH?=
 =?utf-8?B?RnpsKzlyaFVoTVk1dWpDZm5LVnlHVUFIdjNWeDZWb2Z6dzBYWXMraVZSTFF5?=
 =?utf-8?B?VVd5Yyt2Q2pWdnphM0U3c3RTYS9Wc2k3QjVlcVNHVUZzUVVlZVRvakZTeGg4?=
 =?utf-8?B?SC9lRmdYQStrajFhNS83bnovck5tWTFVRWg5bzVickpKOE9TTk1RV1pXa0ly?=
 =?utf-8?B?K09uNjRPaFNlamVsSGpkUWVDcFdUYksyYzZtK01lTHVVZ0c4WFBCYTdvb0M5?=
 =?utf-8?B?Mk1BMlM4TU4ydW1sTS9GSEIzN3hzd2RJaWFsQWtPS1NMeGsyMU9JZUZ5QzE0?=
 =?utf-8?B?cUdQMVZVQW5RcGRBVGRlbWM2SWxZaGNlbEJCY3M2TzFhclFoTVlwelU4S0lN?=
 =?utf-8?B?SFZHekhyVjNpa290Y01tY3N0S2FwelcxWngxRm82WmRlTng1YkRRZ0Z1TjZw?=
 =?utf-8?B?amh6K1VmTnFwcFNVZGxHS2dCZ2UrUVdlL3BIY1E0Ni85eHU5L3cxQUxwODZU?=
 =?utf-8?B?RGRFM055ZzA4cWVrUWQzN2pQa0FQRkFtNVlhM2JVNlhlRGxYWkZ6UUJUMm9h?=
 =?utf-8?B?ODNaemdOd1VnUTU2OWxVVGUxTlB6OTNOTHZacXRBZUVBWFhaZWNrUXJNQmZV?=
 =?utf-8?B?WVFPbWtaeG5FNStRYWJJNWxoMlRSUHpOVDY2Tm1ZY1VPcTNlMzBUWU5ma2hw?=
 =?utf-8?B?aXdYM1BVLzlBMEY2ajQ4Q21ObTJPOUE1V2ZraWxQMFVSRUorU1dBNGZZcVNN?=
 =?utf-8?B?a2cydkEzZGZ2Vi90bzRBekUxdW5OMTl6SW1CQVN4MVpGNG5NZ092MjdqdFlm?=
 =?utf-8?B?TXMxaGdHckk5VGcway9CajZXaGF6anJDYjhMUkh5RytnN09lNzl4cm50VXlI?=
 =?utf-8?B?V25nSU5Sd2RrU1lBbmo3dWNzcnEyd3N1YlZDOWRrYUxSU2ZDVlQva2JScUVH?=
 =?utf-8?B?NkxRTHBnOXRyWU4vNkkrdmR4T2tydXVZWjZWcHFPRHNNbmtpQ2RKK2dMemNK?=
 =?utf-8?B?TWY4cFZhTEc4Y2U3V1BoRHJIZFlRc0EvbnBHT0lRYk0zNCtXNDJsTCtCSUov?=
 =?utf-8?B?aDVNbFRlQ2ZUU3B3VVAzajBHL0tQVW82REFmL3ZFWUQ2NVpGWUhpMGIvQmpD?=
 =?utf-8?B?dmVxak1PWUlHc1J1QmtySjdMeEk0OWk2YkR4Z1gwSWs0dGsybHhRTDJjc3Vv?=
 =?utf-8?B?bC9rUUtEOXQ4Zi9tQ0ZLVXdTdGVTaC9za3l1V1d2RTBvblM5dU9QSWNHSmxE?=
 =?utf-8?B?bWtyVWM1bWY4YzN0NURRcUJXU1BHTHNOMUZhYXNQYXBnNWtXY0g0K3VFSXN0?=
 =?utf-8?B?blk4emZzTmVTVFlVZlBpYkFsT0ZNdVNaa1BsNytTWXVkS1pzaGJhaTloY0Vi?=
 =?utf-8?B?Qk83b092VGFST3NsVGZlN0pWWXN0LzhpN1RFeTZBYWtFb3I5azM2YzNPUHl3?=
 =?utf-8?B?dkhFckdMcU9qSUF3NHhVVGVGeHN3ODVTUmpRRVJIbGRIaWtwVU5wSUlUQnhF?=
 =?utf-8?B?aWprWE9xS0pMR2VySDNYUEJnUi92dXJuaEk4b2RiSzc2Z3hFa1lUYzlQZGgx?=
 =?utf-8?B?cjljVUg5T3cxdmhXbGxPK0lLSXFRYkpoY3NCVHdZQ0dCUnExVlVnY3BKK2tz?=
 =?utf-8?B?ZDNxVUp3OWxFMGJoQ2JwM1k0djh5YkZzbGhQOUpYUm0wV0JPNzNlQm9jbzhm?=
 =?utf-8?B?Tm9EdVZlZnB3bm1KNllpbko2L1lLMEdCUG55VGkrN2RtamswemhVeU9tb2ZX?=
 =?utf-8?B?WEErMUlFWW1TZ05Oby9DOGprRmk2VDFDR2UwUXZOUVZqMDZSa1RpR01aMVJh?=
 =?utf-8?B?cjFsbHRNOUkvUk9JYlowQXVmRHM3b3hEdWZ4a0lEbDNNTEUrTVB1SjVLSnFl?=
 =?utf-8?B?QVFla2dnamVwbGI4eGZ3Q0JJWjJCa0RCQ20waXg1OFpJTkZwNDZWaXhEdXRw?=
 =?utf-8?B?MTA3bHpRR0pEbDNGQndHeUV5aVFiQVRoOTFDdzV0Z1RBMnFaSXVLZlIydDRS?=
 =?utf-8?B?Njl5TE9uRTF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUNkeVdPTlI0cFlRUDhXNkFLZ2JDTFlCb2E5K1RMSDdoM2FqWmFZUkRZeEVm?=
 =?utf-8?B?akFESDl0dGxHT0V5VDB5UUhMUG9ZRFJyeGRlK2JqeXc3VC8velZZRWF1dVlU?=
 =?utf-8?B?NzJTMlpjZE5JMDQ3eitvYVNmdjBuaXF4M0F2UEczbnJyckVKd1pNS3VZSnFa?=
 =?utf-8?B?SWY0TWMyWEtlRjA5MDRCemZSRlo3cEhOUmxHa2JHY2MxK1FUVWZoTC9ISjF4?=
 =?utf-8?B?UGNubnBwRGlITktaSFpDTy9qM2NET1RKVkFYT0NLNXBKekkwL01JaG1WTHFw?=
 =?utf-8?B?Tno5NjE5aXpvNlNVVjJxYUtIa0VMS1FOL2ZaeFlmS1h0SGpLSitnOWhLNkti?=
 =?utf-8?B?SFF3TWVQT1Y2WlpUWmJHTnZSQURPV1piS1V0aGcxcDJjcGN2M1dqVi82VWxG?=
 =?utf-8?B?SllWZHRaalpzQU5BQnV4QS9VK3BESXhhWjNxdkwreis4ZVVDUW1JQ0UvQ05L?=
 =?utf-8?B?bGI0TjZmVlZCVlh4TXBzUS94ZXpCQmQwaDRaZ1RBd0NydjhwdHpkakJTZDhR?=
 =?utf-8?B?Ujdnd0s5L0UydkZhUVdXL21nVmpGK2JlVWtWS0QvVzdUUUorZVk0d2IxTDJC?=
 =?utf-8?B?dHIzWGlpdzhrRXVXSXlJYmw1aWM0Z1I0Nm5xQmxHNytzRkF4QnBUTmVya1Fa?=
 =?utf-8?B?NURIMXMvRUU4dk5qZFdxMlNrdzk5azMwTW1NbVQ1NGs5dXNpWUhnUUQ3R3JM?=
 =?utf-8?B?WTFFWXpKdFlrZFl2ZHNmSU9sY2E0OTZEeUZCK2lSVmhEZitQR0pFTlJBYzFz?=
 =?utf-8?B?YjB2TXBCd3B0V3hhditJdmwvaVphRmlqcXJpYWVtY3VEUUg3Q3ZjZ1ErRk5M?=
 =?utf-8?B?VzJKRDNZOWN2M0YxUTlGRXB3UmgwUUloZXcrVkUwK2srVGdVRjVNc2gzeHh6?=
 =?utf-8?B?Q3g3ZGk2VmVxaUJkcVVFZEtUVVIzdnNkUnRvaEROanlZN3dhcW5YbElVaFRa?=
 =?utf-8?B?YitvMXFMbENvZUQvWnU2QWcwYS83RjlDbjRsK09OMytpOW5FQXJUQ0VGbEVp?=
 =?utf-8?B?cjJlNEtJOWVhb1pIaHk2TmtsbWZzT0dDMHZHR1FjYUs5WTEweXdNMnZPTVg0?=
 =?utf-8?B?ODA1NXlGMWFRbWdCdnpSdFY2SDRjOTFiSEg5VHZkbmJaOWlRRDFSOGZlQkh2?=
 =?utf-8?B?d0RHYmRyR1ZDQkg0NTRldlBsemxIYng4Rk85TktoSlJXTUEwME9JRmZ4YmF5?=
 =?utf-8?B?Z0JzNFBNRHpaRHArdEtybnpST2lhVjZ3V0NUaG5iMG9QQ1dBd0F2Y3VNZ2Vs?=
 =?utf-8?B?Qllzai9BYlN4MnZxYjBVTjBrZUIrdVFDUk9qN1J4aEVzYmdNZjEya1pzbTI2?=
 =?utf-8?B?NXVQQ2NmdUw0K0diWnd1TkU4TkpWRHY5ck5QRzQ0cUlydDhMc1B6VktRTWlT?=
 =?utf-8?B?MkNFVXBMOEdCU1lkbTVsY0ZueXJqRytLclI5Sm5GdVdjcDIvQi9ZV0hkNjlH?=
 =?utf-8?B?MDY1MXZwb2hHMm05THhPMkVyN3VRWGFXTTVZRU96aVlYS0VaM0U0OUFFMlBm?=
 =?utf-8?B?Y241UFNkZUxsbHFQbDJ0YktMbFM2K3dpWVNVWnA2WU1SOXQ3bGRXamE5UktF?=
 =?utf-8?B?S0R4YnZyakRJT0tOcEpPMzBqUE4yTE1jMUM4UVN3bE94ZDJEWGpGc0p4UytL?=
 =?utf-8?B?VWpjc0YxOXorS214VnRLclFNckYwNGJscnRlNUJaZUtsOTNkMC96MlAxMmln?=
 =?utf-8?B?d1FYYXp0TTVSWTk0MWNOSWZFbUR0YWdVTmhPOTdpUlNVaklYdUZlRVRyRVN3?=
 =?utf-8?B?a1VHeEdaMnkyT3U4b2p2WlZKa1dnZENHcGdNM09jMmcwbWRZQUtIK0JjOWgw?=
 =?utf-8?B?Ump4cWwzQVJIR0JyV05uSlV0S1RoeEdKTXJVTUVpQ0p0WFZZUVBWbndmQm83?=
 =?utf-8?B?a0N4ODZpMW1wNHF6Z0YvU0ZobWxxSFhzcFlhZ25FWVVyTG8vakhueTh2Ylhp?=
 =?utf-8?B?b2pDWkt0TFQzcmNvL3JnbUgvRGs3UFFOckhSSTg2bGFFTHhDeStKdVRHSlRt?=
 =?utf-8?B?bzJ2VEkweHRBSjA1L2hLbjR5NTJIU1NwcGYrUDNtRmpHaHV4VFIzTmI3T0d5?=
 =?utf-8?B?dFVha1ovMmJEOHpLaFZFbDBweVFYQ1QrdE0zMmZvRnc5eXpEM0JJbm00TnBH?=
 =?utf-8?Q?ZrXc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D494CB2B2834A48BD3E756E22EE05BE@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794fa715-3fdb-4af2-cf92-08dd8eba215c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 05:27:03.1052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNJo7WbHKut6KXiEcX5igNxGffcFXFzGpBLHyASYOfBx0LuE/fjb/iLOb5g93AwDILdjT4+1OvC1u4WMs6+5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255

T24gMjAyNS81LzggMTc6MzksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE5OjAxUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBpbml0X3JlYmFyKCkgZmFpbHMsIHRoZSBwcmV2aW91cyBuZXcgY2hhbmdlcyB3aWxsIGhpZGUg
UmViYXINCj4+IGNhcGFiaWxpdHksIGl0IGNhbid0IHJlbHkgb24gdnBjaV9kZWFzc2lnbl9kZXZp
Y2UoKSB0byByZW1vdmUgYWxsDQo+PiBSZWJhciByZWxhdGVkIHJlZ2lzdGVycyBhbnltb3JlLCB0
aG9zZSByZWdpc3RlcnMgbXVzdCBiZSByZW1vdmVkDQo+PiBmaW5pX3JlYmFyKCkuDQo+Pg0KPj4g
VG8gZG8gdGhhdCwgY2FsbCB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSB0byByZW1vdmUgYWxsIHBv
c3NpYmxlDQo+PiByZWdpc3RlcmVkIHJlZ2lzdGVycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
aXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gY2M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IHYyLT52MyBjaGFu
Z2VzOg0KPj4gKiBVc2UgZmluaV9yZWJhcigpIHRvIHJlbW92ZSBhbGwgcmVnaXN0ZXIgaW5zdGVh
ZCBvZiBpbiB0aGUgZmFpbHVyZSBwYXRoIG9mIGluaXRfcmViYXIoKTsNCj4+DQo+PiB2MS0+djIg
Y2hhbmdlczoNCj4+ICogQ2FsbGVkIHZwY2lfcmVtb3ZlX3JlZ2lzdGVycygpIHRvIHJlbW92ZSBh
bGwgcG9zc2libGUgcmVnaXN0ZXJlZCByZWdpc3RlcnMgaW5zdGVhZCBvZiB1c2luZyBhIGFycmF5
IHRvIHJlY29yZCBhbGwgcmVnaXN0ZXJlZCByZWdpc3Rlci4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMs
DQo+PiBKaXFpYW4gQ2hlbi4NCj4+IC0tLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvcmViYXIuYyB8
IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMgYi94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+
IGluZGV4IDAyNmY4Zjc5NzJkOS4uMzI1MDkwYWZiMGY4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Ry
aXZlcnMvdnBjaS9yZWJhci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+
IEBAIC00OSw2ICs0OSwyNiBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayByZWJhcl9jdHJsX3dyaXRl
KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICAgICBiYXItPmd1ZXN0X2FkZHIgPSBi
YXItPmFkZHI7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyB2b2lkIGZpbmlfcmViYXIoc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQpCeSB0aGUgd2F5LCBJIHdpbGwgcmVuYW1lIHRoaXMgdG8gYmUgY2xl
YW51cF9yZWJhciBzaW5jZSB0aGUgaG9vayBuYW1lIHdpbGwgYmUgY2hhbmdlZCBpbiBuZXh0IHZl
cnNpb24uDQoNCj4+ICt7DQo+PiArICAgIHVpbnQzMl90IGN0cmw7DQo+PiArICAgIHVuc2lnbmVk
IGludCBuYmFyczsNCj4+ICsgICAgdW5zaWduZWQgaW50IHJlYmFyX29mZnNldCA9IHBjaV9maW5k
X2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfRVhUX0NBUF9JRF9SRUJBUik7DQo+
PiArDQo+PiArICAgIGlmICggIXJlYmFyX29mZnNldCB8fCAhaXNfaGFyZHdhcmVfZG9tYWluKHBk
ZXYtPmRvbWFpbikgKQ0KPiANCj4gTWF5YmUgYWRkIGFuIEFTU0VSVF9VTlJFQUNIQUJMRSgpIGhl
cmU/ICBJIGRvbid0IHRoaW5rIHdlIGFyZSBleHBlY3RlZA0KPiB0byBnZXQgaW50byB0aGUgY2xl
YW51cCBmdW5jdGlvbiBmb3IgdGhlIGNhcGFiaWxpdHkgaWYgaXQncyBub3QNCj4gcHJlc2VudCwg
b3IgaWYgdGhlIG93bmVyIG9mIHRoZSBkZXZpY2UgaXMgbm90IHRoZSBoYXJkd2FyZSBkb21haW4u
DQpZZXMsIHdlIGRvbid0IGV4cGVjdCB0aGF0Lg0KV2lsbCBhZGQgYW4gQVNTRVJUX1VOUkVBQ0hB
QkxFKCkgaGVyZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiArICAgICAgICByZXR1cm47DQo+
PiArDQo+PiArICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmViYXJfb2Zm
c2V0ICsgUENJX1JFQkFSX0NUUkwoMCkpOw0KPj4gKyAgICBuYmFycyA9IE1BU0tfRVhUUihjdHJs
LCBQQ0lfUkVCQVJfQ1RSTF9OQkFSX01BU0spOw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBSZW1v
dmUgYWxsIHBvc3NpYmxlIHJlZ2lzdGVyZWQgcmVnaXN0ZXJzIGV4Y2VwdCBoZWFkZXIuDQo+PiAr
ICAgICAqIEhlYWRlciByZWdpc3RlciB3aWxsIGJlIHJlbW92ZWQgaW4gbWFzayBmdW5jdGlvbi4N
Cj4+ICsgICAgICovDQo+PiArICAgIHZwY2lfcmVtb3ZlX3JlZ2lzdGVycyhwZGV2LT52cGNpLCBy
ZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ0FQKDApLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgUENJX1JFQkFSX0NUUkwobmJhcnMgLSAxKSk7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRp
YyBpbnQgY2ZfY2hlY2sgaW5pdF9yZWJhcihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICB7DQo+
PiAgICAgIHVpbnQzMl90IGN0cmw7DQo+PiBAQCAtODAsNyArMTAwLDcgQEAgc3RhdGljIGludCBj
Zl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgew0K
Pj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiB0b28gYmlnIEJBUiBu
dW1iZXIgJXUgaW4gUkVCQVJfQ1RSTFxuIiwNCj4+ICAgICAgICAgICAgICAgICAgICAgcGRldi0+
ZG9tYWluLCAmcGRldi0+c2JkZiwgaW5kZXgpOw0KPj4gLSAgICAgICAgICAgIGNvbnRpbnVlOw0K
Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gLUUyQklHIG1pZ2h0IGJlIGJl
dHRlciBoZXJlLiAgSW4gZ2VuZXJhbCBJIHRyeSB0byBhdm9pZCB1c2luZyBFSU5WQUwsDQo+IGFz
IGl0J3MgYSBjYXRjaCBhbGwgdGhhdCBtYWtlcyBkaWZmZXJlbnRpYXRpbmcgZXJyb3IgbGF0ZXIg
b24gaGFyZGVyLg0KR290IGl0LCB3aWxsIGNoYW5nZS4NCg0KPiANCj4+ICAgICAgICAgIH0NCj4+
ICANCj4+ICAgICAgICAgIGJhciA9ICZwZGV2LT52cGNpLT5oZWFkZXIuYmFyc1tpbmRleF07DQo+
PiBAQCAtODgsNyArMTA4LDcgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X3JlYmFyKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgew0KPj4gICAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBpcyBub3QgaW4gbWVtb3J5IHNwYWNlXG4iLA0KPj4g
ICAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRleCk7DQo+
PiAtICAgICAgICAgICAgY29udGludWU7DQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+IA0KPiBNYXliZSAtRURPTSBoZXJlPyAgLUVOWElPIG9yIEVJTyBtaWdodCBhbHNvIGJlIGFw
cHJvcHJpYXRlLg0KV2lsbCBjaGFuZ2UgdG8gLUVOWElPLCBpdCBzZWVtcyBtb3JlIHN1aXRhYmxl
Lg0KVGhhbmtzLg0KDQo+IA0KPiBPdmVyYWxsIGxvb2tzIGdvb2QuDQo+IA0KPiBUaGFua3MsIFJv
Z2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

