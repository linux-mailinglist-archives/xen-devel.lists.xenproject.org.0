Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD59A2C1A2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 12:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883619.1293567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMex-0001M8-Be; Fri, 07 Feb 2025 11:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883619.1293567; Fri, 07 Feb 2025 11:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMex-0001Jg-7a; Fri, 07 Feb 2025 11:36:35 +0000
Received: by outflank-mailman (input) for mailman id 883619;
 Fri, 07 Feb 2025 11:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDZ=U6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tgMew-0001Ja-36
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 11:36:34 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:240a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6c81ab6-e547-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 12:36:32 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 11:36:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:36:28 +0000
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
X-Inumbo-ID: c6c81ab6-e547-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7RExT4qDpz6VeARAAkpgRdhsWtI+rl3Y9AyFGWwz7O00E3VrOIGsYk7uJXt6crZIk+VIXpTGspqWZPrfZMihzOgf6KkVXKPHJs4YRWVt09c9ZI9jTtkaQxIHDiLL6d+QSEfXk7P3EGLrUKZeHc2PeX/I8RLjelZCP6Rdzbi4zws3vY0OzJXN7TpYQNpaxiPk+smzRd8DRn9qIieawio5KaE6A1XZ3+jwUfhHPvJDnmOzihURWAAXriyc+e+Xrabm+KQ0dKwTvvitycGruaScP+fLL0OK5eDG0htH8sYPiKr1GTxKrlJX/p3YlA4TmMLTtq31uY7aBAKnxYfstfZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWdJfgw9MbL7LVHWuxihk+rZ3qJXHnriM9WwmEMx+PE=;
 b=pXX0v5eW+bg2cOIzUQch2db8ALvZIuv6+BW4qWszRyTVo0pTeHk2PRp3Dw2FwwRO7DTLEsJwq50zX9Qve5ob08jaU0r+0OKKJ+wN86U/tqQCHU4HZZ+qRhh0LEdTHltCxKvX+H1xDNrZuCAdJW79d0F+pAy5LGeMcxaLFlQA5Dr9/wDS8XuVV5SJlnyjH6X/U2wIxREijiQ9vLwmJgkwAIvkyitn+Q/bsiLTUF+w5+XomSQogokLB0azLY8qJ7VJfTtkWLdXBqPQcd8EHn8DCEtlvN1WK2WVBmHu26YTnYfM8iiy8GAg1IdvWzKIFmcUVIBX+GN1R/fAo9VdmfXyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWdJfgw9MbL7LVHWuxihk+rZ3qJXHnriM9WwmEMx+PE=;
 b=k9p031z+ETKwQT3NBwjn8vtyCewuUkKwg3JyxHJshmYp0EIbfuCTiX/kFAQrIeupUjuXFAXm0opfTKEQcwoO6j/Lwqv+ic+H1LWM4KwNrzdi6w5QXBY0MoxHfgIBE7GeXDp3OuAiISnkcj2vRlWYeL4FcPQn3Onesg85+CnnaDM=
From: "Orzel, Michal" <Michal.Orzel@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 5/7] init-dom0less: allocate xenstore page is not
 already allocated
Thread-Topic: [PATCH v6 5/7] init-dom0less: allocate xenstore page is not
 already allocated
Thread-Index: AQHbeQMlExRkfeH0QUWanXHTtrhJ6LM7twWA
Date: Fri, 7 Feb 2025 11:36:28 +0000
Message-ID: <fbe1bc68-e8d1-4bfc-b113-542529bc1cc0@amd.com>
References:
 <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
 <20250207015341.1208429-5-stefano.stabellini@amd.com>
In-Reply-To: <20250207015341.1208429-5-stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5273:EE_|SJ2PR12MB8848:EE_
x-ms-office365-filtering-correlation-id: 1fa72005-3794-4d16-4a96-08dd476ba948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDVpcmhIRTRnM2VEUmZmSlJtMnNaQlIvYVQxazBCbWxhUkc5N2Fpc1F5akZK?=
 =?utf-8?B?cGZHby95MjNsbEp4ZTU2bERVNlI1OG9JMm0wQURCSHc0dXZlcDVxYU5lc3Ir?=
 =?utf-8?B?S2NHQkIrV3RmdFplZTRjdmY0bDJ1ckV6OVVaQ3U0dUFPRGtVNUw4dW1xYk1Y?=
 =?utf-8?B?Q3IwKzJraU5iZStRN2pEYnppY1hlUjZoRkNFOTZJdnVmSGVFcSs1SkRRM1Fq?=
 =?utf-8?B?dUVYb0hudW41K2pHQmo0UEhNeDF0TEYwaVdrNElrdWRXTGRFUm1wSmVVdkJF?=
 =?utf-8?B?czZvNytNWjl6Y20xNjhYY3J0Y0FhLzRJU3Q1bnNLUktQYXVKU0VyYWp1MmlM?=
 =?utf-8?B?dlkrQ0tHdFlaUjVrNEhuRGlXcm52djFtV08zc2x2ejEvRVRaUjczMDhYUm94?=
 =?utf-8?B?NXA3a0VFSWVBUDJWNFB4UDU0NUQwRUJ5QzJUdlBPaEVpQVpqVjdLcFJLa2lU?=
 =?utf-8?B?V3VnMCtqLzJpS0JRckk0NXladlpDSVhxd1FJb3dGcU9GQVA3b0JmWlc5RVZW?=
 =?utf-8?B?QURSOWdiNDhWL1JKZVd1bzZpR0FjZHk1VWJGS0dVeEh5eFRrRzA0OGxHcXRs?=
 =?utf-8?B?ZEsrNk04SWVxTEEwV1NMek9EZWNGc3JtWElKWXhudmdEc1BoazJ0K3dua3VV?=
 =?utf-8?B?N3NuWGdyKzdaWisxTkJZWTNtVGZqTDBNdjExTzBPUUFydEVjRE5mckxCRVM5?=
 =?utf-8?B?VzkyTmlXTXNvcHZpN2t2cmdXb1B1VHhPenQ3VFUyeDVMTkRkdjdRVjU0bjBp?=
 =?utf-8?B?TnltVU1USUo3cnkvSzlHcmRib0N2NWlNd0VzNXpvUS9pTHR5VENneDYxZE5j?=
 =?utf-8?B?L1c5b0hGVUhBbjFVWVRWWlE3UXFmQ1pFRy85Qms3U2lqZWY0ZHB3emN5cmQ2?=
 =?utf-8?B?V3F6OUJSQ1d4QW9ZSTVJbkhHa0RqZU1VTTZka2pUWnpoRXdxN1NvTmxOYnZh?=
 =?utf-8?B?dm9idkJUUDExWVE2TTFuNUdZUGs2UnVrU1BIYkhZczkvVE1vRjFRdkh1ZEts?=
 =?utf-8?B?VW5SSXNCYUFxMXI0eGlPdnZTWDNTOWhkQnFTeGJobm1TTGl6NW8yejJaVVpr?=
 =?utf-8?B?bGJTTWVTYXJONFJmTVM2SnRXT1BVdmRRdStQU2tNSGRseVJKS1hYeXdTZjUy?=
 =?utf-8?B?L0xGbGUzNUNXTGNmdElvaG1reER0aittU1ZvQVNzNEVJUklJRWFhUm81QkI2?=
 =?utf-8?B?VXFnMUtjM0tuUFZoY1lvMktCSmp5Slg4bXBTVCtQYjBtdmk4N09GUFZHa2Rs?=
 =?utf-8?B?MEpuV2JhallyU2Z0S3hUQlVlaC9KVURSWE81MW9xRDUzQ0tGTmZyeDJqek8y?=
 =?utf-8?B?bGdTZ2lXS0publJhTWJZU3A0ZytVSk14SGx0dGRWZFBHL3B2ZnY2WTBuUFVs?=
 =?utf-8?B?NllWSHFreGpJNEJkbUcyclJ2NlhnWCtVNjZUNW81ZCthTHZtdFY3aGg3K2Fx?=
 =?utf-8?B?ZERmNEh2OWJxaWlLUW40Zzd1eHR4TU9pNXJCVzdvZGJxemZneC8yL1Z5ZEph?=
 =?utf-8?B?bzJabWJzYjd0OEh3UGhxSVRMaDkyZ05FMUxNTDB5N2trYTE5a0VsSzVlMXNk?=
 =?utf-8?B?dEQ3djJjT0I0QWNBeXJ1T0xnYWhST3d5c0RBc1RyNitpaUh6ZlkwSytHV014?=
 =?utf-8?B?elh0bXRmbStLdTBVSlAzNi95WFVBZEpTL0wwWXZlNkF1NEpPZFo5SzBrdDQ3?=
 =?utf-8?B?UHpHZk1HYUhJV0NOSURYU3p2aGRkZE5YdGVmUlJxcDFGeXdUdzhQMStGdjR1?=
 =?utf-8?B?S1ZsSkxUYmo1Mm5abkNDOWpIT0VHSkc1WEc4dDErL0NEV25wcWxXaTB5L0Ru?=
 =?utf-8?B?VnVFWURNZ0xEK3F4MU0xQUQrbHBtN3RnM0JkTVdzbGsrR3cwbURzQVZzU24y?=
 =?utf-8?B?M1BaVm0vL0VrQlF5Ym43V3llUDdOYzE5WFQ4YW1PZk13dWhNSTVBYm9lT2ta?=
 =?utf-8?Q?XalKmssxHr6nQJHO2kwjlAIM/xFw5Gjt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWFrMk9oa012QTVkL3JWTEFjSjhnMnJmVU9PUy9yWmhJVGw4Zm1DNGtxd1hE?=
 =?utf-8?B?MUU4T2tVanowTVhnV1JYNUl2aU9zeEE1LzM3RTA1dTcxSjF3SndUamI1bGl5?=
 =?utf-8?B?d0RzeG4xYXNiOFZnMjkwWHZvWW40cWRpSDNVQlM3a08wMFlEY1ZKaThtSWpW?=
 =?utf-8?B?aUxCQ0JOWWY0WndrZHc1T25sZitVOGR4UktUUnIwQUJsS1V0MWFGa0V6MmZ2?=
 =?utf-8?B?RXNLTXlCTkRnc0gzM2F3WHpyMmRoV3ErQmswMG5ueDFneS8wbWtMWFdrbmJ6?=
 =?utf-8?B?c2V5Z3dPYXFIb0R4SGhxd1R2SU1RcHJ4Uy9DQ1Axa2VOSTFDUk8xMkJDeGtJ?=
 =?utf-8?B?bE1zLzlrZkowVWw2VEs5WjRibHhoVHJTUk56b0FSQUtpQXFmVXp0MHBWemVL?=
 =?utf-8?B?ZUJMdEJvWjhOWXNhUERodTRhUHp5dm1LL1puVVhyYlN3OUNPdkc1Z3k1M3Zp?=
 =?utf-8?B?TzdUQVV3U091eGh2VXk4L25DMk1JTlpKaEFZUHY1NmVxMzJwTlM1WUxLajBj?=
 =?utf-8?B?T1hhT1EvUk9VbWsyaUhaS0EvTXY1ZDVVMzB3aUVkdGpaWlpaa0xveGl5eWpi?=
 =?utf-8?B?Rm1DZjdYNWxxc09Jb09jdzNON2xrcjAzYUZWMUZrbVdBcWdjV2dvMGdIQndH?=
 =?utf-8?B?NG0ySVVxdVBRMkVDdlRDc1pQREF2NXB1YVFiQy9YenFTMGt0Z291dE9lZmNm?=
 =?utf-8?B?Snl5V2RHM2ZNSGhWUlhMUVB2Yy9OSVJtaFFLMmpSU05mTXlsMkJBVk9FdDZZ?=
 =?utf-8?B?SU9MV2lXMkdtU09KOWN0eVM1cWE3VklMVThtdnV3M1FUY2FjZEN0VlhtZjNy?=
 =?utf-8?B?c1pJQ1FhNDMwOFFBNjl4ZjJuRXNlVVRLaEZVRGMxM3lVWDF3bmREdCtyV252?=
 =?utf-8?B?K09BNFk2cUNiOXVhTDlHclkzVE5VOTZUUVp4YnFVcFV3SDVRdWFYZ2h1VDVy?=
 =?utf-8?B?Q1NFYnovd1Z5aFIvVzBIeXB4anU1Q2VmSFNzcExpR0RoMzhoSlFld0RFYW9S?=
 =?utf-8?B?Zm1zQWdJcm5XNlM5dkYxSk43OGdqemx6b2EvNjNuRmtaUUp3NS81a1ZUNith?=
 =?utf-8?B?N0ZZMnE0eFZWYVhtS3ZxcTRWelBOUmVvdkMyUzdOV3Q1Sm5vY0Y4NTdjREhr?=
 =?utf-8?B?UjZyKzZCVzRIbDU1R29TMDY3L3BBSGhtMHFZTkJUeVZ4cTdZbzNHMVptR0pq?=
 =?utf-8?B?amlRWFBHY0pucFlBdDk4TWlVbE1QR3k4VGh1TmpoY09YaUhLRkgvVG1kM2Fw?=
 =?utf-8?B?aTFzakdwaCtZd3pDMVZJV3V6SzdNVE5WTnpzbWs2VURuMlVGUFdaWXM3YmZs?=
 =?utf-8?B?c1AzdHRPSWV2akNRbTdyWUdVWTBnWUFZRFF4a1VWYThUVVlQWW1CeFJKTlpn?=
 =?utf-8?B?OGp5U3o5cllWTXFETEM5SDFqRmNxQUwvQkpuOXByQUkycXgwemdYQ29yVEJT?=
 =?utf-8?B?L0Y5Ty9SODRqOGdRZnp5SDQ3UCs0NWJBTWJIM3hjWWFMd2NoRE1pVC9uVU1B?=
 =?utf-8?B?LzNWSkI4Mi81MEVDSjR2d2NLTlZ3SitwTExsa1NyOFFOYWxmaWo4R3dOdW9Q?=
 =?utf-8?B?NzhFcWpOMkhkbk5ZTkkxaUdudEpIN2FKSjd5Q0lmWGNmTVk2dFUwSTRNUHcv?=
 =?utf-8?B?T2d2RUtmV2RTUll5bER5YkVnYU96d21FUnl0SHNDMGlDQmpwV3EySWNPaVRs?=
 =?utf-8?B?blRzanRLei8xbFVpdmxYelFCVUVBU1o0U29XR3pKUHl4S0VGY1VzcW5ydkNV?=
 =?utf-8?B?SWdqNUttRlkyMXExTHpJWG43SnZyVTFvSm9teStheTU5bDY0SUw4NGJTYm1W?=
 =?utf-8?B?RUJDRXBIRnI4aDVKVVZEcHQ2elJDcUd6YlZ5TWRXRy9Bb2tlVFJzNkc2SnQw?=
 =?utf-8?B?cFg5bmF5QWFTSWhNeVQrVWNGRFp0ZThvRVIzRWlWbWZYeWl1VytLVHlKcTU1?=
 =?utf-8?B?WGtzS0thMjNNVys4Snl0ZFF0L3JwaXNQY3hpb1hqdjh3aHFxc1NIOE81UXBT?=
 =?utf-8?B?a0lLa3ZaZFFpRG5uR21aWllGL3BYem5mVkwxMUlnZUxSQm5McjlkeGNMTXVq?=
 =?utf-8?B?Uk56dVViM1Q4N3FhaHc2VkVQcjRVaGllMzlzV3lnSnBWVFZ2eGl5UWRDR1Rv?=
 =?utf-8?Q?IgWY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F480A35BAB3DF46990FDFC596A27EC3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa72005-3794-4d16-4a96-08dd476ba948
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 11:36:28.3102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FdRCeWudioF6Aqs6oPxix/eOjLZ4jMd+lMXjgwh2XA/pc2nunhqA9SblzLms7T/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848

TklUOiBjb21taXQgdGl0bGU6IHMvaXMvaWYvDQoNCk9uIDA3LzAyLzIwMjUgMDI6NTMsIFN0ZWZh
bm8gU3RhYmVsbGluaSB3cm90ZToNCj4gV2UgY2hlY2sgaWYgdGhlIHhlbnN0b3JlIHBhZ2UgaXMg
YWxyZWFkeSBhbGxvY2F0ZWQuIElmIHllcywgdGhlcmUgaXMNCj4gbm90aGluZyB0byBkby4gSWYg
bm8sIHdlIHByb2NlZWQgYWxsb2NhdGluZyBpdC4NClRoZSBjb21taXQgbWVzc2FnZSBsYWNrcyBq
dXN0aWZpY2F0aW9uIHdoaWNoIGlzIHRvIHN1cHBvcnQgb2xkIHVucGF0Y2hlZC91bmZpeGVkIGtl
cm5lbHMuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
by5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY2Og0KPiAtIHJlbW92
ZSBkb3VibGUgYmxhbmsgbGluZXMNCj4gDQo+ICB0b29scy9oZWxwZXJzL2luaXQtZG9tMGxlc3Mu
YyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS90b29scy9oZWxwZXJzL2luaXQtZG9tMGxlc3MuYyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC1kb20w
bGVzcy5jDQo+IGluZGV4IDJiNTE5NjVmYTcuLjc4YzU5ZWM1ZTcgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2hlbHBlcnMvaW5pdC1kb20wbGVzcy5jDQo+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC1k
b20wbGVzcy5jDQo+IEBAIC0xNiw4ICsxNiwzNCBAQA0KPiAgDQo+ICAjaW5jbHVkZSAiaW5pdC1k
b20tanNvbi5oIg0KPiAgDQo+ICsjZGVmaW5lIFhFTlNUT1JFX1BGTl9PRkZTRVQgMQ0KPiAgI2Rl
ZmluZSBTVFJfTUFYX0xFTkdUSCAxMjgNCj4gIA0KPiArc3RhdGljIGludCBhbGxvY194c19wYWdl
KHN0cnVjdCB4Y19pbnRlcmZhY2VfY29yZSAqeGNoLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX2RvbWluZm8gKmluZm8sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDY0X3QgKnhlbnN0b3JlX3BmbikNCj4gK3sNCj4gKyAgICBpbnQgcmM7DQo+ICsgICAgY29uc3Qg
eGVuX3Bmbl90IGJhc2UgPSBHVUVTVF9NQUdJQ19CQVNFID4+IFhDX1BBR0VfU0hJRlQ7DQo+ICsg
ICAgeGVuX3Bmbl90IHAybSA9IChHVUVTVF9NQUdJQ19CQVNFID4+IFhDX1BBR0VfU0hJRlQpICsg
WEVOU1RPUkVfUEZOX09GRlNFVDsNCmJhc2UgYWxyZWFkeSBjb250YWlucyBzaGlmdGVkIHZhbHVl
IHNvIHdoeSBub3QgdXNlIGl0Pw0KDQo+ICsNCj4gKyAgICByYyA9IHhjX2RvbWFpbl9zZXRtYXht
ZW0oeGNoLCBpbmZvLT5kb21pZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5m
by0+bWF4X21lbWtiICsgKFhDX1BBR0VfU0laRS8xMDI0KSk7DQo+ICsgICAgaWYgKHJjIDwgMCkN
Cj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiArDQo+ICsgICAgcmMgPSB4Y19kb21haW5fcG9wdWxh
dGVfcGh5c21hcF9leGFjdCh4Y2gsIGluZm8tPmRvbWlkLCAxLCAwLCAwLCAmcDJtKTsNCj4gKyAg
ICBpZiAocmMgPCAwKQ0KPiArICAgICAgICByZXR1cm4gcmM7DQo+ICsNCj4gKyAgICAqeGVuc3Rv
cmVfcGZuID0gYmFzZSArIFhFTlNUT1JFX1BGTl9PRkZTRVQ7DQo+ICsgICAgcmMgPSB4Y19jbGVh
cl9kb21haW5fcGFnZSh4Y2gsIGluZm8tPmRvbWlkLCAqeGVuc3RvcmVfcGZuKTsNCj4gKyAgICBp
ZiAocmMgPCAwKQ0KPiArICAgICAgICByZXR1cm4gcmM7DQo+ICsNCj4gKyAgICByZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiAgc3RhdGljIGludCBnZXRfeHNfcGFnZShzdHJ1Y3QgeGNfaW50ZXJmYWNl
X2NvcmUgKnhjaCwgbGlieGxfZG9taW5mbyAqaW5mbywNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDY0X3QgKnhlbnN0b3JlX3BmbikNCj4gIHsNCj4gQEAgLTIzMyw5ICsyNTksMzAgQEAg
c3RhdGljIGludCBpbml0X2RvbWFpbihzdHJ1Y3QgeHNfaGFuZGxlICp4c2gsDQo+ICAgICAgICAg
IHJldHVybiAwOw0KPiAgDQo+ICAgICAgLyogR2V0IHhlbnN0b3JlIHBhZ2UgKi8NCj4gLSAgICBp
ZiAoZ2V0X3hzX3BhZ2UoeGNoLCBpbmZvLCAmeGVuc3RvcmVfcGZuKSAhPSAwKSB7DQo+IC0gICAg
ICAgIHByaW50ZigiRXJyb3Igb24gZ2V0dGluZyB4ZW5zdG9yZSBwYWdlXG4iKTsNCj4gLSAgICAg
ICAgcmV0dXJuIDE7DQo+ICsgICAgaWYgKGdldF94c19wYWdlKHhjaCwgaW5mbywgJnhlbnN0b3Jl
X3BmbikgIT0gMCB8fCB4ZW5zdG9yZV9wZm4gPT0gfjBVTEwpIHsNCklmIGdldF94c19wYWdlKCkg
cmV0dXJucyAhPSAwLCB0aGVuIHNvbWV0aGluZyBpcyB3cm9uZyBhbmQgd2UgZGVmaW5pdGllbHkg
c2hvdWxkIG5vdCB0cnkNCnRvIGFsbG9jYXRlIGEgcGFnZS4gVGhlIG9ubHkgcmVhc29uIHRoZSBz
Y3JpcHQgc2hvdWxkIGFsbG9jYXRlIGEgcGFnZSBpcyBpZiB4ZW5zdG9yZV9wZm4gaXMNCmludmFs
aWQgaS5lLiB+MFVMTCBvciBub3Qgc2V0IGkuZS4gMC4gQXQgdGhpcyBwb2ludCB3ZSBhbHJlYWR5
IHZhbGlkYXRlZCB0aGF0IGd1ZXN0IGlzIHhlbnN0b3JlIGVuaGFuY2VkDQpzbyB0aGUgb25seSBw
b3NzaWJpbGl0eSBpcyB+MFVMTC4gU28gdGhlIGNvZGUgc2hvdWxkIGJlOg0KDQppZiAoZ2V0X3hz
X3BhZ2UoeGNoLCBpbmZvLCAmeGVuc3RvcmVfcGZuKSAhPSAwKSB7DQogICAgcmV0dXJuIDE7DQp9
DQoNCmlmICh4ZW5zdG9yZV9wZm4gPT0gfjBVTEwpIHsNCi4uLg0KDQpPdGhlciB0aGFuIHRoYXQ6
DQpSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0Kfk1p
Y2hhbA0K

