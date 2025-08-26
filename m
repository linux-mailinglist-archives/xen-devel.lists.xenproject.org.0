Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B92B3584C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094162.1449509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpjX-0005d0-Aa; Tue, 26 Aug 2025 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094162.1449509; Tue, 26 Aug 2025 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpjX-0005aO-7T; Tue, 26 Aug 2025 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1094162;
 Tue, 26 Aug 2025 09:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofj+=3G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uqpjV-0005aI-3o
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:12:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2412::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d46807e2-825c-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 11:12:47 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH1PR12MB9645.namprd12.prod.outlook.com (2603:10b6:610:2af::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.23; Tue, 26 Aug 2025 09:12:42 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:12:42 +0000
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
X-Inumbo-ID: d46807e2-825c-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc/ms7H9b2xikJu+V+Qy5pKzqtzFk8U2v68sfR2R6XoiflQc1TFpvPhdokVLC/+Vy4N07IFW2lDvyrfTXmU2CtR32xfzmDQzr0cH2hckYDD+cDW+t2Lwbc5xOh6VQZyUZq7K7z119aLsJ0dnk1PJ1ZhQwMZkHEpLn8Bu2YvXfgA8ei9g8enyfoOh2vkj0WwOvE91tCGXPRPZS1vuLBEIbFRzgmxoeW1if3Hq+ZcEVBTXaHd9DiVzEAqY6q10f0S/mpkwZjBLtdmWU+x6JW3Of7LVceYv+rotkpbE4O7FU/XxwEn3WfVdxn5xlhE/PtxVu6W64Nva42yeJP8i+iC9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxKFLY33cxkPuswlPGM8nkHT3cPorvHDMOTlzE3i4rA=;
 b=LEvHHlhtCmDTebo3vjkEgMRq/ASK0ItzYDVbyMU2MiPu1Grr/xu0drX6oOaspaYav5/9m3dazIe9H24o5J7KhdoKo6e3/Wb5HqPkdOcV+9+pILDwRQpexc+OWKzld7kaskqwYvrgyzmzv0TWp+ju4PrXnuqdHaukqudlO/Hli5UdKyzEoMEC/hl2P7ZTK0qVz6f3qsNlBWwU3iLpNl6mI27EYYMIiQyqw97sTW0H2oG0wGzDpAri3FTlDobX0X//DE9D7rLO3/UqyostKn8TI2yXdrauSccNHnH+C+T7Bs94KDEcZxfmViJY/jY1Xfigr+DoMviWL8TnFvfjGCUBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxKFLY33cxkPuswlPGM8nkHT3cPorvHDMOTlzE3i4rA=;
 b=5CNhLhHiRL0O9WlYYCthwMcdChMArO8YAl6wJz1DOPokpTbWK6FasaFTN/v39i6s252eFPpWcgb1fG02wuYuA3nknX6uvSs1/RYLK4tL4oge7uAWuIcGPpRPFTssbhw956LmH+n38NDs0buERit1rsFw8D58On8GKxifiy3wEJY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Topic: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Index: AQHcE1LyQ0lYyaNtv02FRdV+NHpcFrRzhX0AgAESjyCAAAlHgIAACnwg
Date: Tue, 26 Aug 2025 09:12:42 +0000
Message-ID:
 <DM4PR12MB84515E30F6D144FEF9E051A6E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com>
 <b54e3460-380b-41e4-b9e9-75ba5c6129fd@suse.com>
 <DM4PR12MB845198356D8DDCE39A62DF29E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af56fd77-7567-4fd9-89ed-340939843e51@suse.com>
In-Reply-To: <af56fd77-7567-4fd9-89ed-340939843e51@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-26T09:10:20.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH1PR12MB9645:EE_
x-ms-office365-filtering-correlation-id: 958ee53b-4b8f-41c4-1b71-08dde480b689
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk03UWdlN0Q5UlZyYVN6SGZWMEF3UzlidGllRjQ5YmdCb1MzOHFnVTlMc0ZI?=
 =?utf-8?B?emh0RG1iWkppYzV2eHN3d0kzU2Ura0paSEdtZVNzSytjVVRrSGp6dmFmUDJN?=
 =?utf-8?B?RmxESDVRbU9DK2dMWnh0eS8vVEk0THF0VHMrUSthRGZoaGg1QzdPUDNuZXZM?=
 =?utf-8?B?TEZQNUNPWW55cjk4QVAxd3VlblJSSERXckFLS0Z0N3I5blFHMjBmMXZFbTlM?=
 =?utf-8?B?WFRaRS9BYzVyZWJpZ3BSTFI3K1k1LzY1UGFUVjk4VzhjSS9XNTBhNGMyazJE?=
 =?utf-8?B?TDVkaTdTbVNZeitqbzVpaUtvd25NblMxTDJuVFFNd1NXVEY5NmVoVXhBOS9D?=
 =?utf-8?B?R29QZU5kWE1FRFhrTWJsZFlxOUxZWXVKUG9sTzZXb3dpWFZ1VFhNWEc3RVZn?=
 =?utf-8?B?akF2Z0FWS1ZmZGxFbGc3RldJVHU0Rm5ZZjIxdzNjUTlacTJBYmRkQlhyOGRk?=
 =?utf-8?B?MmRBUm1jd1JiTWxma3g0UVhEOEh5cVVxV1FRQjJzVlo2WlExNXRZM2FHSUV4?=
 =?utf-8?B?bTMwR2RqaTlFKzU4WHQxSzVqWENNTkc5SC8rbVdKajFhNkxMdXVWUlhVZmZx?=
 =?utf-8?B?cURHc3p2c1pIK3QvaHVvWkZnK3RpMUl2bW95ekZvRFhlQ3BqdFNZd0NNUzlU?=
 =?utf-8?B?aXZ2QlcyZXpmZ3hJRG1aTzBMYkVSckhrbGlOVXNFUW8zSDNuNFZSeTlmZThx?=
 =?utf-8?B?QkxwcEZCYkM4Mm5pWW9HZUtjM2Q2QnF3OTMyU1lUY2dHUEJTN0RrN0dTWnNZ?=
 =?utf-8?B?SWw0UUptS2ZFTEwvTjlwMGc2M2tWU1NmUDROdDVYYU0xdzZTVVdGVWszYlo2?=
 =?utf-8?B?Mkx1K1FXOHkzYllrTW8wQnZycmdYeGRiamtjMU5wYjFPOUh3bUpMVTNTelVr?=
 =?utf-8?B?VmtLNm5mMzdhT1F3QmdsMnNjM0k0SVBnU1hMTk1DOEF2ZWpqK3dmUjU5LzJZ?=
 =?utf-8?B?UTFGWHFVbFI5SW9tZ0lGOFNYYXpqSUhUajBaZisyYVcwaTZ3YjdoS3ZHNFI4?=
 =?utf-8?B?bWZ6L2s0S0dycGFqUEtBTnphcFFHYTNma2RrREhlckM4dW9zbFNMODJaYjRn?=
 =?utf-8?B?S0RBN1VtRFh1V25FbFQ3cW8rNlRMWDVXTXFCanlEcURwakpWTmdvcGpUdGlw?=
 =?utf-8?B?SnZjRG5PSTA3RG1RTVRiT0ppamdSWlR0RUQ1MnpFQ0RLZ1NDcGhoSkFBcXJN?=
 =?utf-8?B?WXBIYkQ2LzFIM3lTY3ExNXhXUGFuS0hyYldhNnY0S1N1ZFN5MjlnSXZiV3FS?=
 =?utf-8?B?bnQxNFBIMmwyamhKTlJJUnExcEhpeWpyUzg4K2dJNVV4aHVacDc3VDRxM3Nt?=
 =?utf-8?B?NHpFYmdIWmd0S0xmK1V4M3VGby9zME1kL0ZDQUJ2RjNuRzBKVTJRcDRWNkRs?=
 =?utf-8?B?V296VGo0eU93WGw3dXhidjM5NXBUazdrUG94czVjZFErazE4YnpabEwvWUJj?=
 =?utf-8?B?bURCT0JQaHRyNHVoWlRNNlpWU2tBcEIvK0tvNTRDQWZ5c3ZNemdpdVhGbVFj?=
 =?utf-8?B?c0wvL2krdGtmQUdEYlJtS3pta1U4UEV3NzVFc2U5ZS9RNHFRL2UxcUNoQzZ4?=
 =?utf-8?B?eG5jaFI2Zm5udkN6VEZVWUhzT25xOCtheVNqazZCVHMxMm5GZkxkVDFEcklE?=
 =?utf-8?B?ZTdyWDBreVc5b2lPL0ZXdGRRa2tnZEFiQnFCVXZUTUp1RkF6MVlBZzhLR2p1?=
 =?utf-8?B?UXUxZkkvZ0Q0YjFMaFVRT3Q3cmVNRG5NQXhVenRJa1lCNDJ6bmpUMUlSZFJZ?=
 =?utf-8?B?cDBTRXdWQmc0c3Z0Skl3djBZQlFpN1IrVml3bVQvSE5PNjdBRE9KTXpzenZE?=
 =?utf-8?B?QmVzZHU2VVlGYTU4ME1oajhXbWxuMkMyQzd5dk9yZWRHVFcydUpydFF6T1pI?=
 =?utf-8?B?UU8yQ1phNGdUdXFxTmdENWxOSkJVVlE5MFduTGMwb2ZaY3RBZ2Erc3ZuVDly?=
 =?utf-8?B?NW91eGxRS2IyQ0xMdWV4TVVUb1JnQnZweEtNQzdWeFVRTmlVdXkySTRxL0ZP?=
 =?utf-8?B?ZERqdnFkeDZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk1sZFhPbU9FOEFRQTd6citlVUN5ZDdIOGFnUnR3aGlMZEJBeWtBd2tNcnVh?=
 =?utf-8?B?TzF2QlBZNm80TU1XenM2VG5CVnp3a0IvWDQvRjY0anhoelNnRDltcmRsMGo1?=
 =?utf-8?B?bnJ3S2dEMFRSS3VKQzhleDYveXZjcHlPSkphRjUwdXVPMWlML0hEU0ZpaTFG?=
 =?utf-8?B?UmNIVUNhWE5qaVEzS2xQbDRUNmFDcGVSaG9pTHB6cHFRdzYvbzRpQlE1ZC9B?=
 =?utf-8?B?cnBCVzZ0Y3o3dzBMVHp1SmluZG5Gdkh2MXNPNkQwS3lKSEgva1p1ZFZGc1dN?=
 =?utf-8?B?UUdaQmZ4UE9aWjV1Z0VHOHA3NXNUQXFRSVdMaXFiZVlWWGNNU1RjTEZ2WEZU?=
 =?utf-8?B?cEtMaDJPMHRNSVdpMFhBdUg4SStNbDdKeDRQK1NtQmlHTEpQb1A4ZGpZMmVM?=
 =?utf-8?B?aExJUWE3di9wUDIvcnIyeE43RmFvaUdUa0Jlb0dlQjRSa1JINFlDaGR5Rkd1?=
 =?utf-8?B?MFlKVGRJWk01MXMrWkxkSkJ3K21RdEJYWGgzbTBwT2FqUnZnM1B2MVZvYURI?=
 =?utf-8?B?V09qTWJ0N0NXbVNoWjJJQStsVXE1UkltTmVobjlTZEFrclJRQXY0UkI5dUZL?=
 =?utf-8?B?QmdaSDg5c0VSNDE4a3U4YnhJR0JrZ25SOHhGTDV0cFQ1OVBOekJQUVpTV3RD?=
 =?utf-8?B?VS9SVXJId2kvQnVuSzFIaE5GbXZ5Y3NTeHl2bkRkMWxqT2Zrb3JCaVg4MHUz?=
 =?utf-8?B?bkl2dnEyTmRiU0RZcFprVm5EYndZTVNKemRHSEZCU1hLdTI2UXgweFlGZ0pw?=
 =?utf-8?B?anJDUWIwNll1YTlkOU5qeVdxZVRYUkYxVllMUy8yYzFnWGVsZlNqd2VkM1dC?=
 =?utf-8?B?cmo3QXNiT0orbkdrR3Z2SWczRWNXc1N6aTFiZXpZUUxqeHU1eHRmMzE3UFJ1?=
 =?utf-8?B?SWZBa1hId0NuRkp6TnQzOTRqdnZNV1RtcjBLZ1Y5cWVCMmplb3llcitvSWZR?=
 =?utf-8?B?aS91aEtxdlBKOEtXTlRhcXdtUHIzTDVRNHpoc214UjNhRnZkNUJGUHp2M05k?=
 =?utf-8?B?Zkh3b2IyU2d4aFpwMStseUNoOG5WN0lMcXZld1NjN0hBSytMSXNmR2pEUHMx?=
 =?utf-8?B?aTBmc3F4MFFJZ0lSWkpOTm5EaGtDVTMzanUxWEZhS2J5cUtpOGtIV1dWcE1z?=
 =?utf-8?B?RStiS2Noem84czViS2lYMVNHQnNQRzViWGUwczJKQjZMQndCWk9tSmZCK05C?=
 =?utf-8?B?U3V5V0dqOGp0UHJTeVN5bXhFWEVJTTRpWWp3dVFBRytjbElNL2NIeVh5VHhK?=
 =?utf-8?B?enRwYVpoak5YZERINnZWME5UNHRmYnJaSmFqZkVSZjRBWTEvNGlHSFhCM0VI?=
 =?utf-8?B?bURDcS90VjM3WHdFdDhFdlZaZHVsdVVVdmJIQzdIeGpWRHVuL2duYjhaOC9u?=
 =?utf-8?B?Smkxb3NyaDhaMEVVRGpsaEVrMWVlYUhGWFdaSlhPcjhGV0FmWUxZczVnd0ti?=
 =?utf-8?B?WWwrSjN1SE9QbDZBTnBZak5HYVViTFhxYnMrTUZtSGhhdzEwUVR5RUFqVDdq?=
 =?utf-8?B?NUEwVlpRSWg2eWhmblo0SEJvZ3NRUkVxT3o4QzNBRDNaUHpxVnZGeGp6ZkVG?=
 =?utf-8?B?WGVLNGROWGVEejBTR3R3dTNXbEFxYkppQzRSQ2RLdUJlTXVoWjdmMzFMYTZj?=
 =?utf-8?B?YUI1MVFaN0ZLTWhkVEVRSWUrN2VlZnZ5TWNwSFJVc2VmYUVYcUdEYnJGd1lH?=
 =?utf-8?B?T0Q2QVUwK29MQzF6aEgwZWJ1Y1FuNm1mWDZHUHJwUEJRWkZ1RmZTUTltRHBa?=
 =?utf-8?B?VGZRR3lsMlduK1d4M05GYTdSRndVd2NDVG5uN1JWOU9ydWpTYmJlNnZsUmtl?=
 =?utf-8?B?WXJOYjIxRkxNSDF5VklEWThIZVNQRGJYK040UnBacFRhb0dJWUhIVWt0YnJF?=
 =?utf-8?B?cUc2QWl3OTQxa2dmTU1GdmlFNU5FVkxOaG9IenRraEFRNjVvbS91Tm0rZDF6?=
 =?utf-8?B?WTRzaUZING82NnFWdUtIU0crcmZWZU9iNXNyY2phZWxiL3Jud0tFd21Jb3lT?=
 =?utf-8?B?UWlWOVgycnRxY25KdnhJSVpJdFoxOGpQV3BadElQOE5ITzVGYyt6V1RjN2ZF?=
 =?utf-8?B?VFRHS2dsbDY3YWJlYmdoQjVzWFhScDR0cjA3b3ZjZE8yd2FwcmNvNHFLdmR5?=
 =?utf-8?Q?DGEw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958ee53b-4b8f-41c4-1b71-08dde480b689
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 09:12:42.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJfDXt34Y5XRCxF0v8D3iO+oeUpS0izf6Php3B+00zFfXw2FF2AkddzSz1nSkLX8fo86ArdKNltDzS6ca3lkZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9645

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNiwgMjAy
NSA0OjMzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsg
QW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE9yemVsLCBNaWNo
YWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMTEvMTNdIHRvb2xzL2NwdWZyZXE6
IGV4dHJhY3QgQ1BQQyBwYXJhIGZyb20gY3B1ZnJlcSBwYXJhDQo+DQo+IE9uIDI2LjA4LjIwMjUg
MTA6MjEsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50
OiBNb25kYXksIEF1Z3VzdCAyNSwgMjAyNSAxMTozNyBQTQ0KPiA+Pg0KPiA+PiBPbiAyMi4wOC4y
MDI1IDEyOjUyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3Rvb2xzL2xpYnMvY3Ry
bC94Y19wbS5jDQo+ID4+PiArKysgYi90b29scy9saWJzL2N0cmwveGNfcG0uYw0KPiA+Pj4gQEAg
LTI4OCw3ICsyODgsNiBAQCBpbnQgeGNfZ2V0X2NwdWZyZXFfcGFyYSh4Y19pbnRlcmZhY2UgKnhj
aCwgaW50IGNwdWlkLA0KPiA+Pj4gICAgICAgICAgQ0hLX0ZJRUxEKHMuc2NhbGluZ19taW5fZnJl
cSk7DQo+ID4+PiAgICAgICAgICBDSEtfRklFTEQocy51LnVzZXJzcGFjZSk7DQo+ID4+PiAgICAg
ICAgICBDSEtfRklFTEQocy51Lm9uZGVtYW5kKTsNCj4gPj4+IC0gICAgICAgIENIS19GSUVMRChj
cHBjX3BhcmEpOw0KPiA+Pj4NCj4gPj4+ICAjdW5kZWYgQ0hLX0ZJRUxEDQo+ID4+DQo+ID4+IFdo
YXQgaXMgZG9uZSBoZXJlIGlzIGFscmVhZHkgbGVzcyB0aGFuIHdoYXQgY291bGQgYmUgZG9uZTsg
SSB0aGluayAuLi4NCj4gPj4NCj4gPg0KPiA+IEVtbSwgbWF5YmUgYmVjYXVzZSB3ZSBkZWZpbmUg
dHdvIGRpZmZlcmVudCBjcHVmcmVxIHBhcmEgc3RydWN0dXJlcyBmb3IgdXNlcg0KPiBzcGFjZSBh
bmQgc3lzY3RsLCBzdHJ1Y3QgeGNfZ2V0X2NwdWZyZXFfcGFyYSBhbmQgc3RydWN0IHhlbl9nZXRf
Y3BwY19wYXJhLg0KPiA+IEJ1dCBmb3IgY3BwYyBwYXJhLCBpdCBpcyBhbiBhbGlhczoNCj4gPiB0
eXBlZGVmIHN0cnVjdCB4ZW5fZ2V0X2NwcGNfcGFyYSB4Y19jcHBjX3BhcmFfdDsNCj4NCj4gT2gu
IFRoZW4gLi4uDQo+DQo+ID4gU28gLi4uDQo+ID4NCj4gPj4+IEBAIC0zNjYsNiArMzY1LDMzIEBA
IGludCB4Y19zZXRfY3B1ZnJlcV9jcHBjKHhjX2ludGVyZmFjZSAqeGNoLCBpbnQNCj4gY3B1aWQs
DQo+ID4+PiAgICAgIHJldHVybiByZXQ7DQo+ID4+PiAgfQ0KPiA+Pj4NCj4gPj4+ICtpbnQgeGNf
Z2V0X2NwcGNfcGFyYSh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IGNwdWlkLA0KPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIHhjX2NwcGNfcGFyYV90ICpjcHBjX3BhcmEpIHsNCj4g
Pj4+ICsgICAgaW50IHJldDsNCj4gPj4+ICsgICAgc3RydWN0IHhlbl9zeXNjdGwgc3lzY3RsID0g
e307DQo+ID4+PiArICAgIHN0cnVjdCB4ZW5fZ2V0X2NwcGNfcGFyYSAqc3lzX2NwcGNfcGFyYSA9
DQo+ID4+PiArJnN5c2N0bC51LnBtX29wLnUuZ2V0X2NwcGM7DQo+ID4+PiArDQo+ID4+PiArICAg
IGlmICggIXhjaCAgfHwgIWNwcGNfcGFyYSApDQo+ID4+PiArICAgIHsNCj4gPj4+ICsgICAgICAg
IGVycm5vID0gRUlOVkFMOw0KPiA+Pj4gKyAgICAgICAgcmV0dXJuIC0xOw0KPiA+Pj4gKyAgICB9
DQo+ID4+PiArDQo+ID4+PiArICAgIHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX3BtX29wOw0KPiA+
Pj4gKyAgICBzeXNjdGwudS5wbV9vcC5jbWQgPSBHRVRfQ1BVRlJFUV9DUFBDOw0KPiA+Pj4gKyAg
ICBzeXNjdGwudS5wbV9vcC5jcHVpZCA9IGNwdWlkOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZXQg
PSB4Y19zeXNjdGwoeGNoLCAmc3lzY3RsKTsNCj4gPj4+ICsgICAgaWYgKCByZXQgKQ0KPiA+Pj4g
KyAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgQlVJTERfQlVHX09OKHNp
emVvZigqY3BwY19wYXJhKSAhPSBzaXplb2YoKnN5c19jcHBjX3BhcmEpKTsNCj4NCj4gLi4uIHdo
eSBpcyB0aGlzIGhlcmUsIHdoZW4gLi4uDQo+DQo+ID4+PiArICAgIG1lbWNweShjcHBjX3BhcmEs
IHN5c19jcHBjX3BhcmEsIHNpemVvZigqc3lzX2NwcGNfcGFyYSkpOw0KPiA+Pg0KPiA+PiAuLi4g
eW91IG1pbmltYWxseSB3YW50IHRvIGFwcGx5IGFzIG11Y2ggY2hlY2tpbmcgaGVyZS4NCj4NCj4g
Li4uIGEgYmV0dGVyIGVmZmVjdCBjYW4gYmUgaGFkIGJ5DQo+DQo+ICAgICBjcHBjX3BhcmEgPSBz
eXNfY3BwY19wYXJhOw0KPg0KPiA/DQo+DQoNClRydWUsIG5vIG5lZWQgdG8gZG8gbWVtb3J5IGNv
cHkgdGhlbiBpZiBpdCBpcyBhbiBhbGlhcw0KDQo+IEphbg0K

