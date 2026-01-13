Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB2D1A05C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201988.1517599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgfV-0004aJ-93; Tue, 13 Jan 2026 15:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201988.1517599; Tue, 13 Jan 2026 15:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgfV-0004Xo-5v; Tue, 13 Jan 2026 15:50:53 +0000
Received: by outflank-mailman (input) for mailman id 1201988;
 Tue, 13 Jan 2026 15:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pu67=7S=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vfgfU-0004Xi-Ap
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:50:52 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2958142-f097-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 16:50:50 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAWPR03MB10091.eurprd03.prod.outlook.com (2603:10a6:102:368::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:50:46 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:50:46 +0000
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
X-Inumbo-ID: a2958142-f097-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuQE/YXhLVcjj7yFX1gJHA7B12mHFp33I7xImwhwncQPuuP1G0Cyqn975xS53C+1Fo46O2haRlMAL+QqBpECIZHmHiZUOGZMRF5PUd/B1/66kCOsL78H6WnAEdDq01FCoIGhyCidlpC9VeZxDI5EOPcRomxT8R6CZ9uB6qkofUI3KFFugPDBJ5DdVY2Up0rsnRqYJ65bJGT159/48AguVxCmMsBrvOrWHcQJ33MTeDvPauljKaiADK7euJmcbddyxizMU39qmvydzsLH74fCL97Sq4GHMh7Npw+ywHiFbBEsljzKo7ASgTBfCM9Es0/HmmLbNqEpsvbk6XSDLKt/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZvjKgStKPMde36gAL6tBXrsBvuvEBoAVsQmNafFi4I=;
 b=v8YZPgeEJ5yQ32jDuIsyfjchEYTNBU++YgtEiMJs+BtzTP9ArK0oKgnYjX7Eb7qFbHhbermcslrufzSk+fLYp8lq5u+AVQC8lR2tz8LtSo1B60LGcQPTosuG9p3LGQRtyXFG4GTRBG4/MO2tL7S9s/zA1uahx0IxKZYjzMnaKtNjSCmaj1mEbwJzQ0/1NsNR22Pl7/Y2XPxX12BZXob0sEgjWBgPGKuy+iDDyw8niKrN2bpGXJ5tu2uw5CA9KyxtjEBNqy8U0rn+AOMCTxmyqCzT34hWvekvj99dFsfeMHVqan0OMVEoeC/M4rj81EF9oCZBz2I5EK9GWyJuio+NMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZvjKgStKPMde36gAL6tBXrsBvuvEBoAVsQmNafFi4I=;
 b=abhpVnfHSQLL2Devb9/KmgMrC6UL5xFEuIUGC82kF+Lf/Rq+oqZVtJvAljM+gMH4jRb4D2jVsDn/p2xXzIz6YSBVuQ+P/QN2z5p5DSzegNVtKPbphxEF/tN6tqFWQFJJ+fz1MLJjZ4MGoRyHA1R82oMH7pH2tdnNmeFXo5v0xfISFsWuMZCBLLokKtAmJhUCOWYKtvXUX8uu3Fyhk6lgPm7EXZt+Pc4lebs6tTbKf9j00MK2YxaJN3JJqaftaGhA00C03wMNQZvaC4mrRrU3WsRGR4ofCDYcLKa1I133fmcAoHJUHxHus8pdYV6frOTGhfFi5WlFel/2iYDep+uAvg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index:
 AQHcSyafS16SOr0Uk0OkeRdy8jd8CrVPHVoAgAADtoCAAACtAIAAA/oAgAAAqoCAAYwTgA==
Date: Tue, 13 Jan 2026 15:50:45 +0000
Message-ID: <87ba1c35-f1f3-4a52-ba76-306a538ad0c6@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
 <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
 <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
 <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
 <9631b854-2fc6-41aa-8b12-1e7283b22246@epam.com>
 <4807d2d3-fae7-45a4-b7c7-e101a95a6b58@suse.com>
In-Reply-To: <4807d2d3-fae7-45a4-b7c7-e101a95a6b58@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAWPR03MB10091:EE_
x-ms-office365-filtering-correlation-id: 593fd846-7aa5-46f4-c6a4-08de52bb83f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?KzB0d1RNK1prZ1VoY2F0TVVPODQ1OXFRSDBJMDdtVW9OczlyQnZDRU9xeSsy?=
 =?utf-8?B?bFgvRFg3UG1xWGl3Ly9KS0k1QVdwN25VTWJlQzlIbXVXZkU2SVNpRVR4V1gr?=
 =?utf-8?B?WFIzaHRlTzdtWU0wVXUxdDMwU3JHRXpnYVFjc0c4aHRvanUzVUsrVDl1VjFN?=
 =?utf-8?B?SlUvNDk3VUdJb21DSlRKeWU0eDlqMlRTR2lIa05rZU1PMGlSWFVBSzZFRVlP?=
 =?utf-8?B?RnBnR2J0b3pkbU5xcVQ5L1N0UzJPcXc1TG1zTDFsUm5uT2xLcGl5Y0wxM2lo?=
 =?utf-8?B?eWxySS9oNGZVVEt2S1lYYkVIYkU0Rkx0RGdwbjcyNnlTd1M0NWVscFVSY2F4?=
 =?utf-8?B?bnA4YWx4cE1ZdWdnMXNBUndzVFJHQ0dIVTB5SmIzeTlWaERxS2tEd3k5Nm5Y?=
 =?utf-8?B?VzVtMjRsVWlwQWNpaFRIS3FEdjBNYUpBSkx5Mk5UTUswREtFc1NmRlRoMlJz?=
 =?utf-8?B?NEg4QnptZ2M3bXh0eUVaNEpjNVdGakEwTDFxTjFaY1dTUlowRlp5Qkd4dktF?=
 =?utf-8?B?MmFIYlRaVG5CSkgrVndTSVo2ays1S09Ec1dQZ1JwOFR2MVhaWDBhdXpHRFhu?=
 =?utf-8?B?MzFMZGNaV0RFRUtkT2tPK2VORkwzTXdRazJJWDNBdjNUdnZTRGZDUStRNFNH?=
 =?utf-8?B?eWJSQXhTdVplY0tEc1N2UEM3T2FJb1JuSzRQSDJreENUQnlzbHFYQURBSzAy?=
 =?utf-8?B?c2l1c2E4MkFaWTE1M2J3SU45TnBmSUhvQVBIbTUzK2FJdzZqNU1hbVNxQ1VP?=
 =?utf-8?B?VXpEc3ZqYXdMMjNYWnQwZWpMaUlPNU9WZTlvYWcvWjE1aXMrUjBCenN0SGFG?=
 =?utf-8?B?anR0a09zSzgyVU12VkZJS3F1RCtUcjlTUitLU1QrVzlhRkl1aWRiWC8zRGl1?=
 =?utf-8?B?U2kzMlJWTGkzQVpvMnBOQnl3ejVZNjlSZ0ZEMU4wMklxR2lMbEIwV2xkenJM?=
 =?utf-8?B?ME9aUUIySWVTV2wyc3M2Tk10MWREalRpR1NLMXZPZXh6WXltaEdnVlhuVDlO?=
 =?utf-8?B?Q0JmY1hyVG40ZmVzQ001MElTMHBBdE1rTURSLy9KUklCQS9lQXEraVQ4NEE5?=
 =?utf-8?B?VkppRlVyMVNoZHRwVkFDV3JqVzI4UW1wOU9YUHQ0dks1UlNNZTB3STRRSU5L?=
 =?utf-8?B?eU5xQW9FMzJIV2czZys1ZXZsRnRxSWFCSzdLTEJpTEJjbllsMkNPOUJ3TlBJ?=
 =?utf-8?B?VnNSTWZnUFU1TlJVd2dzS0NFaDRQUnRrOHZ6ZU9IZ1ZjOGQ4aWtVTUV3RG1o?=
 =?utf-8?B?NDltNnJpWkVBNWtVU3RXRTduc1U2UFlQaEI0TktEQm44cEhUamJUckd6RXFw?=
 =?utf-8?B?SUZHODArdUdvdGI5V0J4RFZDelAyRDUzNXRZZVVsQjcvcVp1bDlnSzNMMHhZ?=
 =?utf-8?B?Y0c4WGtGeWFCMm5JTCtDQkQrajJKdTl6ZzRlclVtb3RZM3UxYzRPR0YrbDEr?=
 =?utf-8?B?YVFaeG1ycTFFcWoxVXNjVXZncjVZZDR5bm5DVGpxS1g4TVp2MmJVdGw2OFcw?=
 =?utf-8?B?OVY0RWxyMHRCTDlFZmYvOHJzM2hNWHdzSG5SWm0xdnV6SGZXTndsZlNMTmYr?=
 =?utf-8?B?WkthZjFUREpOMmxNQ1RZL0hIT2dIbHowNERQdmxWMUE5VGZzM284amJsdTBa?=
 =?utf-8?B?YUNNNTYyZ1RqenJET2F4QmFvemhLWVljV3V0MVRLWVd4em53dGczN3E1SGtv?=
 =?utf-8?B?N1NPMXlFRkZnckppQm1rSG5ZV3BYcnpFdlc1eXRhcFFWakFFWC9oVXBiRm05?=
 =?utf-8?B?bjV4ZnJKT3I3QWZ6Y3lKdXo1dmlPQStFMkhHcjQ0U2dERlBCQTFnUlZUV2Z5?=
 =?utf-8?B?QzByT2tJd3ZrTm9ncXQ0dzFMaTA1eHN0b3k5OFpKTDFuRVZoU2VteXFxMGh1?=
 =?utf-8?B?RERoc2d1KzJVVWFoeTc0R0hKVkJFVDBiOGpSTkVTSVNsYnBHTFI1b2EzMVNY?=
 =?utf-8?B?anRraGVkR2RLakJqS1FacXpUc0NxakxCcllzUmcwTWpZWStDczkzZi9wbFlp?=
 =?utf-8?B?U04zcWc2ZmhSSVp5L1VYNTl2aVE5UEs1bXgvZ3puRUlLdXJkQUI4SzFlMUJF?=
 =?utf-8?Q?G7beyJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckVCQktVTVJHVCs3dld1Zzd4cDlyL3FtKzYxV2c1QmNIS2Z0MVVueHNXM0lE?=
 =?utf-8?B?emZmd0g3eWJLaGZhSWJiT1RVcmpJaVBOQUU1ZWo1b2Zya3NJd3FnendqdjNL?=
 =?utf-8?B?OGZQdXRRZ3Y3Wk56RC9yZklpKzlJNGh1UGg2YkIzdlBNaERZZjNnMUE2aFM5?=
 =?utf-8?B?b3JKL0FjNDBtY20vMTM2aHFpdFZDUENXaHhFNXdGN205eXdxVG1oK2w1ZVNS?=
 =?utf-8?B?eFQ3anBhWXNwYjZQUXF2SlF1MTZuYzQyY0JTR3dOdVkvSUhhTnFwaE1BcVNC?=
 =?utf-8?B?aEltQlFNZ3RBUWVoODFOeFpRTlV1L0JMZlN2c1IyRCtUeTRoWmRGOCt4SEN5?=
 =?utf-8?B?WnF2VS8zYi9TekVxZkJFdGZBR2tVNU94WXA4U08waCtaTkdNRFB4UGpkQjJG?=
 =?utf-8?B?MGdsSWZGWGM1SW9CNGc5aHJyYlhRWGhybnVvWE1mVG43cFk4c2ZoU1JRZW81?=
 =?utf-8?B?OFZjeE1WU2lpTTlzQTRGTHh2MjFjVXBpeEEvdGJPUXhLWWdvVSs2dnFaajdj?=
 =?utf-8?B?cnN1M2tZMVBvV2txc2ozM3BzOExRSkt4NCtXYlM5bDhOM1UzOGRqdC8vUTNn?=
 =?utf-8?B?Y0RwaUkySXplSUFSaWo0QTZvMkdJd1BvS0p2djBUci81RUFjRG5jUFBTRFNa?=
 =?utf-8?B?alQvWnZhcTJtL3RicjFRNlRwT0NQWjZ6dXk3Mk1PdmxtU3pMMEhpK2tlYnVn?=
 =?utf-8?B?K3N1WlRyS0Vmb3AyblI2ejJXUE5RQm9zZkVNZ2x2VnVKZkZmK2UvNjFUT0FX?=
 =?utf-8?B?dGs0SnA4cW1IWktMRlhMbENzY0JKUkJlRlB1VVdjTkxrRThHVjlFbFduL1N4?=
 =?utf-8?B?RnlMWGgzM250UXk0QUFTQjBJemcvaU9rclhDZ0ZQeElsSUl0ZUQ3ZXZWT2No?=
 =?utf-8?B?ZHBaaENaeUtxYmVFZVIyeVdxekdSdmR5eURkNjRKcjR1UUpKUDR4QUhrR3Ry?=
 =?utf-8?B?Umx2TzlaQ2daUGg3ZWZuN0loaDVaZ1VIalBKaVpCUWNHRmx2N1QwZ2dLMnVJ?=
 =?utf-8?B?YnVQb3htejhsSmRnenBoOTBJZytzcGFQTFZkUjJYUmNscnQvaXVvTFZXUEw0?=
 =?utf-8?B?VlVnTUQxMXcvTGVzRFBpNVdlWTkzQzQ4L1FzUHViN3owdUxOU2FJK3YwQVVE?=
 =?utf-8?B?YWplSEd6Wm1saEpLSU1XbzZtU2VuL3pXYWE3cFV1MjBNOVp3VW5FUWUzekcr?=
 =?utf-8?B?RHQwMFRuZmdvT2FQNkU1anhEOHYydktOV0x6MUVpSXgxdUQ1WThIRGZkamo4?=
 =?utf-8?B?U3dkeFdxdVp6bGI1NGdjRkR3TGdNTVJhZEZXYmVaUWlWZFQ4WWhsdWRVQnFB?=
 =?utf-8?B?SHdDVnBPSThaL0lsYVNsVVBCeDdyQmVEY1U5d05rQVloUUMwKy80UksrWWRT?=
 =?utf-8?B?RTdkRjE4cjVKRERHZCt0SFJ1SDVlZUp3eVlWOGNUQnRzcXBSM1lGejlTL0V6?=
 =?utf-8?B?SkE5YXJUYXZOaVh5cVN3UkNGRU9LU21UMTNaWCtINW9ZZGJZWWpOemQzZlRW?=
 =?utf-8?B?aVNlWUJLalM5enVVMFZyOTh0MnRRNlRKNloya2liVFlUQ0ZSYXNEanI5cFdE?=
 =?utf-8?B?RGF1b25mbW8xQ1RyTUVkb0RHSjlncXN0NlJWbS80NDJUdW9wOXdFd2ZHL25B?=
 =?utf-8?B?UGxrY21ZNTAyMUNQLzJZWU12MnBYb1Fza2dMcGQ3cmNlNm9IUVhSWTJDK3ky?=
 =?utf-8?B?S3dCbWFnU3RtdXJxNkZ4c3RTNTgrdFNFNmx2QzEyNDYxSHZmaXBLc1NQajV3?=
 =?utf-8?B?YVB4ZldtREh2eTV2RU9WUVNUNkJXdFF5L2FLNVlLTVRvRUtvdlQzTUY5OTRM?=
 =?utf-8?B?QzcxK0UvOC9ES0ZpQ3FISGh1Y2U3L09TZzQySDlsVXpvZXBkRXBZa0NocHYx?=
 =?utf-8?B?eXFyL1dQL21mUDZTV3E1dTJxZVhGclJ5TVE5Z292bE5xbCtUREl3VGR6RHVD?=
 =?utf-8?B?OG5xWkdabUh5d0NVSEh5MUp4cWZPNWxtd2dyNmJjeFlEbVl3MmUvS0hieGZi?=
 =?utf-8?B?Smw0N1NleXNLR1pzR3BZRTRPTE11QmpZMFRIREJISEpCUGJVTngvVGpjcHVG?=
 =?utf-8?B?MHh6SkFvTDl6cUJ4Um1iOEF4ZU1NcjkvSnJIaGRsQllyMHczcFpJc1QwTmgy?=
 =?utf-8?B?bFByMjFPbWZscDBSZXlEcm9keXVLNktIdnUyTW80emZXVHlaZWFjZnhWYmZz?=
 =?utf-8?B?MjRrS2U5STEvZk1SVCtmQ05ZL2xHcEoyYXlRY0laa0FIMFlmWTZDUmRlc3I4?=
 =?utf-8?B?NVRCajBxaWF2TU00Qlo5azNLN2ZualpCT3dWSUU0YlhQNmhHZk5lZy9zTlhW?=
 =?utf-8?B?SXl0MWpKTTlueHc2YnE3K1ExdnNzdUhpYTdaZmZKa0ppSm04VEVkV2lkano4?=
 =?utf-8?Q?Pwjoa7fZkfzot1t0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <231143C9ADE90C41B09879F3D40639D7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593fd846-7aa5-46f4-c6a4-08de52bb83f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 15:50:45.9193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ef1Rb0LGQvcAucEjsB9aDGXYlqAOdcE9OWKnVGwk6rAe+e/8A8NDPY9++WYRPB2ABZ33ycPNB3hUWpRiFdpFOTAHvH/J1TdQ4Ribaw1E39A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10091

DQoNCk9uIDEyLzAxLzIwMjYgMTg6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wMS4y
MDI2IDE3OjEwLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IE9uIDEyLzAxLzIwMjYgMTc6
NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEyLjAxLjIwMjYgMTY6NTQsIE9sZWtzaWkg
TW9pc2llaWV2IHdyb3RlOg0KPj4+PiBPbiAxMi8wMS8yMDI2IDE3OjQwLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+IE9uIDEyLjAxLjIwMjYgMTY6MTYsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3Rl
Og0KPj4+Pj4+IE9uIDA2LzExLzIwMjUgMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+
PiBPbiAwMS4xMS4yMDI1IDEyOjU2LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4+Pj4+
IEBAIC04MjcsNyArODI4LDMyIEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCj4+Pj4+Pj4+ICAgICAgICAgIGNhc2UgWEVOX0RP
TUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2U6DQo+Pj4+Pj4+PiAgICAgICAgICBjYXNlIFhFTl9ET01D
VExfZGVhc3NpZ25fZGV2aWNlOg0KPj4+Pj4+Pj4gICAgICAgICAgY2FzZSBYRU5fRE9NQ1RMX2dl
dF9kZXZpY2VfZ3JvdXA6DQo+Pj4+Pj4+PiArICAgICAgICBpbnQgcmV0MTsNCj4+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4+ICsgICAgICAgIC8qDQo+Pj4+Pj4+PiArICAgICAgICAgKiBBZGQgY2hhaW5lZCBo
YW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQNCj4+Pj4+Pj4+ICsgICAg
ICAgICAqIGFjY2Vzcy1jb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3
b3JrLCBzbw0KPj4+Pj4+Pj4gKyAgICAgICAgICogRFQgZGV2aWNlIGFzc2lnbiByZXF1ZXN0IGNh
biBiZSBwYXNzZWQgdG8gRlcgZm9yIHByb2Nlc3NpbmcgYW5kDQo+Pj4+Pj4+PiArICAgICAgICAg
KiBlbmFibGluZyBWTSBhY2Nlc3MgdG8gcmVxdWVzdGVkIGRldmljZS4NCj4+Pj4+Pj4+ICsgICAg
ICAgICAqIFRoZSBhY2Nlc3MtY29udHJvbGxlciBEVCBkZXZpY2UgcHJvY2Vzc2luZyBpcyBjaGFp
bmVkIGJlZm9yZSBJT01NVQ0KPj4+Pj4+Pj4gKyAgICAgICAgICogcHJvY2Vzc2luZyBwcmVzZXJ2
aW5nIHJldHVybiBjb2RlIGFuZCBleHBlY3RlZCB0byBiZSBleGVjdXRlZCBmb3INCj4+Pj4+Pj4+
ICsgICAgICAgICAqIGFueSBEVCBkZXZpY2UgcmVnYXJkbGVzcyBpZiBEVCBkZXZpY2UgaXMgcHJv
dGVjdGVkIGJ5IElPTU1VIG9yDQo+Pj4+Pj4+PiArICAgICAgICAgKiBub3QgKG9yIElPTU1VIGlz
IGRpc2FibGVkKS4NCj4+Pj4+Pj4+ICsgICAgICAgICAqLw0KPj4+Pj4+Pj4gKyAgICAgICAgcmV0
MSA9IHNjaV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCj4+Pj4+Pj4gV2h5IHdvdWxkIHRo
aXMgbm90IGJlIHRoZSBpbml0aWFsaXplciBvZiB0aGUgbmV3IHZhcmlhYmxlPyAoSSBhbHNvIGRv
bid0IHRoaW5rDQo+Pj4+Pj4+IHRoYXQgd2UndmUgZGVjaWRlZCB0byBwZXJtaXQgdmFyaWFibGUg
ZGVjbGFyYXRpb25zIGF0IG90aGVyIHRoYW4gdGhlIHRvcCBvZg0KPj4+Pj4+PiBzY29wZXMgb3Ig
d2l0aGluIGUuZy4gYSBmb3IoKSBsb29wIGNvbnRyb2wgY29uc3RydWN0LikNCj4+Pj4+Pj4NCj4+
Pj4+PiArDQo+Pj4+Pj4+PiAgICAgICAgICAgICAgcmV0ID0gaW9tbXVfZG9fZG9tY3RsKG9wLCBk
LCB1X2RvbWN0bCk7DQo+Pj4+Pj4+PiArICAgICAgICBpZiAoIHJldCA8IDAgKQ0KPj4+Pj4+Pj4g
KyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+Pj4+IFdoeSB3b3VsZCB5b3UgaW52b2tlIGJv
dGggaW4gYWxsIGNhc2VzPyBJZiBzY2lfZG9fZG9tY3RsKCkgaGFuZGxlZCB0aGUgcmVxdWVzdCwN
Cj4+Pj4+Pj4gdGhlcmUgaXNuJ3QgYW55IHBvaW50IGluIGFsc28gaW52b2tpbmcgaW9tbXVfZG9f
ZG9tY3RsKCksIGlzIHRoZXJlPyBPciBlbHNlIGlzDQo+Pj4+Pj4+IHRoZXJlIG1heWJlIHNvbWUg
Y3J1Y2lhbCBhc3BlY3QgbWlzc2luZyBmcm9tIHRoZSBkZXNjcmlwdGlvbiAob3Igbm90IGV4cGxp
Y2l0DQo+Pj4+Pj4+IGVub3VnaCB0aGVyZSBmb3IgYSBub24tU0NJIHBlcnNvbiBsaWtlIG1lKT8N
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gQWxzbyB0aGlzIGRvZXNuJ3QgbG9vayB0byBmaXQgdGhlIGRlc2Ny
aXB0aW9uIHNheWluZyAiVGhlIFNDSSBhY2Nlc3MtY29udHJvbGxlcg0KPj4+Pj4+PiBEVCBkZXZp
Y2UgcHJvY2Vzc2luZyBpcyBjaGFpbmVkIGFmdGVyIElPTU1VIHByb2Nlc3NpbmcgLi4uIg0KPj4+
Pj4+Pg0KPj4+Pj4+IFdlIGNhbGwgYm90aCBiZWNhdXNlIFNDSSBhbmQgSU9NTVUgY292ZXIgZGlm
ZmVyZW50IGNvbmNlcm5zIGFuZCBhIERUDQo+Pj4+Pj4gZGV2aWNlIG1heSBuZWVkDQo+Pj4+Pj4g
Ym90aDogU0NJIGZvciBGVy1tZWRpYXRlZCBhY2Nlc3MgY29udHJvbCAocG93ZXIvY2xvY2tzL3Jl
c2V0KSBhbmQgSU9NTVUNCj4+Pj4+PiBmb3IgRE1BIGlzb2xhdGlvbi4NCj4+Pj4+PiBTQ0kgcmV0
dXJuaW5nIHN1Y2Nlc3MgZG9lcyBub3QgbWVhbiB0aGUgSU9NTVUgd29yayBpcyByZWR1bmRhbnQu
DQo+Pj4+PiBDYW4gdGhlIGNvbW1lbnQgdGhlbiBwbGVhc2UgYmUgdXBkYXRlZCB0byBwcm9wZXJs
eSBjYWxsIG91dCB0aGlzIGR1YWwNCj4+Pj4+IHJlcXVpcmVtZW50Pw0KPj4+PiBZZXMsIGZvciBz
dXJlLg0KPj4+Pj4+IC0gc2NpX2RvX2RvbWN0bCgpIHJldHVybnMgLUVOWElPIHdoZW4gaXQgaGFz
IG5vdGhpbmcgdG8gZG8gKG5vbi1EVCwgbm8NCj4+Pj4+PiBtZWRpYXRvciwgbWVkaWF0b3IgbGFj
a3MgYXNzaWduIGhvb2spLg0KPj4+Pj4+IFRoYXQgaXMgdGhlIOKAnG5vdCBoYW5kbGVkIGJ5IFND
SeKAnSBzZW50aW5lbDsgaW4gdGhhdCBjYXNlIHRoZSBjb2RlDQo+Pj4+Pj4gcHJvY2VlZHMgdG8g
SU9NTVUgbm9ybWFsbHkuDQo+Pj4+Pj4gLcKgIFdoZW4gc2NpX2RvX2RvbWN0bCgpIHN1Y2NlZWRz
ICgwKSwgdGhlIGRldmljZSBtYXkgc3RpbGwgcmVxdWlyZSBJT01NVQ0KPj4+Pj4+IHByb2dyYW1t
aW5nDQo+Pj4+Pj4gKGUuZy4sIERUIGRldmljZSBoYXMgYW4gaW9tbXVzIHByb3BlcnR5KS4gU2tp
cHBpbmcgaW9tbXVfZG9fZG9tY3RsKCkNCj4+Pj4+PiB3b3VsZCBsZWF2ZSBETUEgaXNvbGF0aW9u
IHVucHJvZ3JhbW1lZC4NCj4+Pj4+Pg0KPj4+Pj4+IFRoZSBmaW5hbCBpZiAocmV0MSAhPSAtRU5Y
SU8pIHJldCA9IHJldDE7IGVuc3VyZXMgdGhhdCBpZiBib3RoIHBhdGhzIHJhbg0KPj4+Pj4+IGFu
ZCBJT01NVSBzdWNjZWVkZWQsDQo+Pj4+Pj4gYW4gU0NJIGZhaWx1cmUgaXMgc3RpbGwgcmVwb3J0
ZWQgdG8gdGhlIGNhbGxlci4NCj4+Pj4+Pg0KPj4+Pj4+IERldmljZS10cmVlIGV4YW1wbGVzIHRv
IGlsbHVzdHJhdGUgdGhlIGR1YWwgcm9sZXM6DQo+Pj4+Pj4gMS4gQWNjZXNzLWNvbnRyb2xsZWQg
RFQgZGV2aWNlIChub3QgbmVjZXNzYXJpbHkgSU9NTVUtcHJvdGVjdGVkKToNCj4+Pj4+Pg0KPj4+
Pj4+IGkyYzM6IGkyY0BlNjUwODAwMCB7DQo+Pj4+Pj4gICAgIMKgwqDCoCBjb21wYXRpYmxlID0g
InJlbmVzYXMscmNhci1nZW4zLWkyYyI7DQo+Pj4+Pj4gICAgIMKgwqDCoCByZWcgPSA8MCAweGU2
NTA4MDAwIDAgMHg0MD47DQo+Pj4+Pj4gICAgIMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZzY21p
X3BkIDU+O8KgwqDCoMKgwqAgLy8gRlctbWFuYWdlZCBwb3dlciBkb21haW4NCj4+Pj4+PiAgICAg
wqDCoMKgIGNsb2NrcyA9IDwmc2NtaV9jbGsgMTI+Ow0KPj4+Pj4+ICAgICDCoMKgwqAgY2xvY2st
bmFtZXMgPSAiZmNrIjsNCj4+Pj4+PiAgICAgwqDCoMKgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwm
c2NtaV94ZW4gMD47DQo+Pj4+Pj4gICAgIMKgwqDCoCAvLyBubyBpb21tdXMgcHJvcGVydHk6IFND
SSBtYXkgbmVlZCB0byBhdXRob3JpemUvcG93ZXIgdGhpcyBkZXZpY2U7DQo+Pj4+Pj4gSU9NTVUg
aGFzIG5vdGhpbmcgdG8gZG8NCj4+Pj4+PiB9Ow0KPj4+Pj4+DQo+Pj4+Pj4gMi4gSU9NTVUtcHJv
dGVjdGVkIERUIGRldmljZSB0aGF0IHN0aWxsIG1heSBuZWVkIFNDSSBtZWRpYXRpb246DQo+Pj4+
Pj4gdnB1OiB2aWRlb0BlNmVmMDAwMCB7DQo+Pj4+Pj4gICAgIMKgwqDCoCBjb21wYXRpYmxlID0g
InJlbmVzYXMscmNhci12cHUiOw0KPj4+Pj4+ICAgICDCoMKgwqAgcmVnID0gPDAgMHhlNmVmMDAw
MCAwIDB4MTAwMDA+Ow0KPj4+Pj4+ICAgICDCoMKgwqAgaW9tbXVzID0gPCZpcG1tdSAwIDA+O8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBuZWVkcyBJT01NVSBtYXBwaW5nIGZvciBETUENCj4+
Pj4+PiBpc29sYXRpb24NCj4+Pj4+PiAgICAgwqDCoMKgIHBvd2VyLWRvbWFpbnMgPSA8JnNjbWlf
cGQgNz47wqDCoMKgwqDCoCAvLyBGVy1tYW5hZ2VkIHBvd2VyL2Nsb2NrL3Jlc2V0DQo+Pj4+Pj4g
ICAgIMKgwqDCoCBjbG9ja3MgPSA8JnNjbWlfY2xrIDM0PjsNCj4+Pj4+PiAgICAgwqAgwqAgYWNj
ZXNzLWNvbnRyb2xsZXJzID0gPCZzY21pX3hlbiAwPjsNCj4+Pj4+PiAgICAgwqDCoMKgIGNsb2Nr
LW5hbWVzID0gInZwdSI7DQo+Pj4+Pj4gfTsNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2RldmljZV90cmVlLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2RldmljZV90cmVlLmMNCj4+Pj4+Pj4+IEBAIC0zNzksNiArMzc5LDEyIEBAIGludCBp
b21tdV9kb19kdF9kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFp
biAqZCwNCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4+Pj4+PiAgICAgICAg
ICAgICAgfQ0KPj4+Pj4+Pj4gICAgICANCj4+Pj4+Pj4+ICsgICAgICAgIGlmICggIWR0X2Rldmlj
ZV9pc19wcm90ZWN0ZWQoZGV2KSApDQo+Pj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4+PiArICAg
ICAgICAgICAgcmV0ID0gMDsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+Pj4+
ICsgICAgICAgIH0NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICAgICAgICAgICAgICByZXQgPSBpb21t
dV9hc3NpZ25fZHRfZGV2aWNlKGQsIGRldik7DQo+Pj4+Pj4+PiAgICAgIA0KPj4+Pj4+Pj4gICAg
ICAgICAgICAgIGlmICggcmV0ICkNCj4+Pj4+Pj4gSG93IGFyZSBEVCBhbmQgUENJIGRpZmZlcmVu
dCBpbiB0aGlzIHJlZ2FyZD8NCj4+Pj4+PiBQbGVhc2UgZmluZCBleGFtcGxlcyBhYm92ZS4NCj4+
Pj4+IFNvcnJ5LCBidXQgSSBjYW4ndCBzcG90IGFueXRoaW5nIFBDSS1pc2ggaW4gdGhlIGV4YW1w
bGVzIGFib3ZlLiBUaGVuIGFnYWluIEkNCj4+Pj4+IGFsc28gbm8gbG9uZ2VyIHJlY2FsbCB3aHkg
SSBjb21wYXJlZCB3aXRoIFBDSSBoZXJlLiBPaCwgcGVyaGFwcyBiZWNhdXNlIHRoZQ0KPj4+Pj4g
UENJIHNpZGUgaXNuJ3QgYmVpbmcgbW9kaWZpZWQgYXQgYWxsLg0KPj4+Pj4NCj4+Pj4gQ29ycmVj
dCwgcGNpIGNvZGUgd2Fzbid0IHRvdWNoZWQgYnkgdGhlc2UgY2hhbmdlcy4NCj4+PiBZZXQgbXkg
cXVlc3Rpb24gYm9pbHMgZG93biB0byAid2h5Iiwgbm90ICJ3aGV0aGVyIi4NCj4+Pg0KPj4gSSBo
YXZlIHJldmlld2VkIHRoZSBwcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGUgcGF0Y2ggc2VyaWUgYW5k
IGNvdWxkIG5vdA0KPj4gZmluZCBhbnkgcXVlc3Rpb25zIHJlbGF0ZWQgdG8gUENJIHByaW9yIHRv
IHRoaXMgc2VyaWVzLiBUaGVyZWZvcmUsICJIb3cNCj4+IGFyZSBEVCBhbmQgUENJIGRpZmZlcmVu
dCBpbiB0aGlzIHJlZ2FyZD8iIGFwcGVhcnMgdG8gYmUgdGhlIGZpcnN0DQo+PiBxdWVzdGlvbiBj
b25jZXJuaW5nIFBDSS4NCj4gUXVpdGUgcG9zc2libGUsIHlldCBkb2VzIHRoYXQgc29tZWhvdyBl
bGltaW5hdGUgdGhlIG5lZWQgdG8gYWRkcmVzcyBpdD8gSSdtDQo+IHRyeWluZyB0byB1bmRlcnN0
YW5kIHdoeSB0aGUgcmVzcGVjdGl2ZSBQQ0kgY29kZSBpc24ndCBiZWluZyB0b3VjaGVkLg0KPg0K
PiBKYW4NClhFTl9ET01DVExfYXNzaWduX2RldmljZSBkaXNwYXRjaDogd2Ugbm93IGNoYWluIHNj
aV9kb19kb21jdGwgZmlyc3QsIA0KdGhlbiBpb21tdV9kb19kb21jdGwuDQppb21tdV9kb19kb21j
dGwgZmlyc3QgdHJpZXMgaW9tbXVfZG9fcGNpX2RvbWN0bCAod2hlbiBDT05GSUdfSEFTX1BDSSkg
DQphbmQgZmFsbHMgYmFjayB0byBpb21tdV9kb19kdF9kb21jdGwgb25seSBpZiBQQ0kgcmV0dXJu
cyAtRU5PREVWLg0KVGhlIG5ldyBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkgYnlwYXNzIGluIGlv
bW11X2RvX2R0X2RvbWN0bCBvbmx5IA0KYXBwbGllcyB0byBEVC1kZXNjcmliZWQgZGV2aWNlczsg
U0NJIHBhcmFtZXRlcnMgYXJlIGNhcnJpZWQgdmlhIERUIG5vZGVzLg0KUENJIGRldmljZXMgaGFu
ZGxlZCBieSBpb21tdV9kb19wY2lfZG9tY3RsIGRvIG5vdCBjYXJyeSBEVC9TQ0kgbWV0YWRhdGEg
DQppbiB0aGlzIHBhdGgsIHNvIHRoZXJlIGlzIG5vIG5vdGlvbiBvZiDigJxTQ0kgcGFyYW1ldGVy
cyBvbiBhIA0Kbm9uLUlPTU1VLXByb3RlY3RlZCBQQ0kgZGV2aWNl4oCdIGZvciBpdCB0byBpbnRl
cnByZXQgb3IgdG8gc2tpcC4gVGhlIFBDSSANCnBhdGggc2hvdWxkIGNvbnRpbnVlIHRvIHJlcG9y
dCBlcnJvcnMgaWYgYXNzaWdubWVudCBjYW5ub3QgYmUgcGVyZm9ybWVkIA0KYnkgdGhlIElPTU1V
IGxheWVyLg0KU28gd2Ugc2hvdWxkIGxlYXZlIGlvbW11X2RvX3BjaV9kb21jdGwgdW5jaGFuZ2Vk
OyB0aGUgU0NJL0RULXNwZWNpZmljIA0KcmVsYXhhdGlvbnMgYmVsb25nIG9ubHkgaW4gdGhlIERU
IHBhdGguDQpBbHNvwqAgU0NJIGhhbmRsaW5nIG9ubHkgZXhpc3RzIHdoZW4gRFQgaXMgcHJlc2Vu
dC4NCg0KQlIsIE9sZWtzaWkuDQo=

