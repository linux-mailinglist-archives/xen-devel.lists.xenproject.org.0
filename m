Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD14B3B46D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100741.1454071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtdN-0004wm-Mm; Fri, 29 Aug 2025 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100741.1454071; Fri, 29 Aug 2025 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtdN-0004tc-JM; Fri, 29 Aug 2025 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1100741;
 Fri, 29 Aug 2025 07:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psBU=3J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urtdM-0004tW-Cq
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:34:52 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60a11ea-84aa-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:34:51 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM4PR03MB11101.eurprd03.prod.outlook.com (2603:10a6:20b:6cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Fri, 29 Aug
 2025 07:34:49 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 07:34:49 +0000
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
X-Inumbo-ID: a60a11ea-84aa-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ4lwJ6lV7w9B19y2Q5V4XHtqPb8OYsFRmp6AB/3uMZEcufwbAM8vD9YEFl/oII5BDD+jF1fdglacRYt72XRiAQ4W4nLhlcPWiKQIF3iU435evH0O4hnbPUajUeLzDb+uLVqEqqng9H6A+4P4pdB43tIRh7kDalRAhZ2MH0WwLc3X2wHSI2prokZFg54h8HGY8TX4Gu4dC/1dB7hYPDj5wqU4tFOGpyhxJC/qRcWIRyRG2e77c4jLSTw7bBPWmtAdmX4C3GVkP70KaamIuHWum1jRKGM2AkLfwHJH+WWR5xb1/ZKvnQ8gsHJ/jmxc5SIzJQKoJ5WY/2bT744daxVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fepvCsjU5wqmfCMRdOUwegDt3OB7Zk/e1WHajvn5db4=;
 b=WLw3EqCuBDf14RyMx/v//xfV/ZzGZ3ZrRwAYS0vLjxFPydAa/HYIntDySFmGPFzELETJ9rdTv1LosEBG0vWfTSUHROmA+8e6p0lDC2qBudu18QoWQtW4Po10uiuwVtPEzNN6Mk+kijZBINt1zCqGQKgHAGPwr0n7BU0JRWCOaDFl9qUEGn28GDCLZQ87Vppw6ed/p0aAPJgNAH8K/B4iagiyvrHX7aUjx0JQcQd5ur9076sLHNnNukOWry5hXNbl/SQCsJT5srWUda33LaSJk3Od6P1HH2sQxXK7Xf9Rw2Yn27yftY6ufyAk6QG62gUHf8/Sihv7SM+uBAvj+9LFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fepvCsjU5wqmfCMRdOUwegDt3OB7Zk/e1WHajvn5db4=;
 b=llSZlnY9bG5S43jDgKaJfOqSraPzeuDwFZI7qCcHpYSVg9ap3K1YFcS0xq0IDa0dRtIZdLheFWq33e/S9KiR00AAvM3j8tAr49dzKlKNYnlCVVGaEaZoWzHS9f1C7wIqNFVIy+jF98feSTi8JZlXpIKhn2uWp+rHVtZ0Pffhd2xuAn1vmARBH0GrHeBVnpRJYH3ZGXvVKxloj2QbAP/PF4n3vtqmbt7RSjCZwHT+J7ftT+jHq82XW+nWt7sw1XH2PIBlmQuIe9KTimCifc3xQZasFfc+Gawb8yoWzfDI4aBfpc3Gsi6miuEFSPBP0wuDusP6elOOwyW2mZ+mQH4bCA==
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
Subject: Re: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
Thread-Topic: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHcGDp07aUQwsobaUO2Bmd+Gq/u2LR5OwuAgAADSoA=
Date: Fri, 29 Aug 2025 07:34:49 +0000
Message-ID: <e60f3f41-49f6-415b-9756-83bff555f303@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
 <4b554221-336b-444d-a2d5-849017f3b943@suse.com>
In-Reply-To: <4b554221-336b-444d-a2d5-849017f3b943@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM4PR03MB11101:EE_
x-ms-office365-filtering-correlation-id: f1de33f9-591f-4b9e-b7f5-08dde6ce88f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXFNNDhEMFJGcHR0Wmx1bFd1UFI4NUFXM3l2WjFPd3hvOCtJOTYzOFNHWkI4?=
 =?utf-8?B?VE1LaG9NSXZIMkYwbmhYQzlNMkFWNFlucGVlOE13WDNsOGFTYnpwZjIzQURi?=
 =?utf-8?B?SUw3S2pLNm5tcmVLamtTM2pRZU9QTnExUEE5VHhUYTJWRUkxa1c4cnkwOW05?=
 =?utf-8?B?MEtQNHNjaWxEa05QeC9HYUt0VFVBL3JHZHR3ZHVKRS9GcXlMWGlWVjN5d3Yr?=
 =?utf-8?B?d1pkMmNSUHBDczEzUW02YWs0UVk4M256OHNvb3loaU1CUTNEUy9BeWVYSlBI?=
 =?utf-8?B?VmJQOE8vZG1SdE9jYmtmQ3BuM09Ncm9SWTg4UTI1cG1pTHpMaHpHSGg3c1N1?=
 =?utf-8?B?b3VpbWgzeXMzYlhzQzN1SWVNa29TZnRCdTVETTJqKy9ZTW5nWGg0aDVxWHhy?=
 =?utf-8?B?NkdtNVNyeHhGWGgyUUgrTVdOMWN6b2pqL3JZMElBeGhON2ZWS0hnS3ZQY2JG?=
 =?utf-8?B?M2hET1FNM1ZFUmVCRXJ2YTZxb2V1RXk4K3p0cmZtWk96LzJrN3NzUFJoejVk?=
 =?utf-8?B?ak1tdVVQK2t3VWJrQnFQeXNpZ1JGR2JaL0xWUmpQY2Z1bUF6OXo2SWdQQ0lT?=
 =?utf-8?B?aXJDSlpKTUU2N1BjY1FGL2cyVDE1WlRTcWZOYi9TNmtlMmY4K1ExV2ZtK2lY?=
 =?utf-8?B?VXZ1bHV5YitFWnRVNnBEZitiQkZScXVEVmhzQnYvcENvMHVkd3B2a2p3NEZq?=
 =?utf-8?B?VnlIYW40TnhNTW9VRlpWUkFONFA1MW1yWWs4dFZBR3VRVWxDNElUUzJBTHhm?=
 =?utf-8?B?TW1oK1lMLzFUdHRpaDZQUFpXMTFSQitBZCsvczUvSmRDNG8wZXBaMzdaeTlx?=
 =?utf-8?B?cC9TL3pvNHFQWEVPc3U5ZXhQOGlHQ3pYdzdZNDVpaHdKR3lSemdKVzkyWFEy?=
 =?utf-8?B?a2tpT2FYeEhiYzlIWTZ5WGwxVFdTZVNWWWhjZ2JESUJJOSt4TStpenFUdFl5?=
 =?utf-8?B?ZU10eWlsZjlqdHpkTHptSWg4bmdLQmltNkxZcmtPUTgxM3lEVGJ2MHV1UWlh?=
 =?utf-8?B?UmdBTytEWW1IRDAvWHdyVUVkVTJKWkx5akF3c2R0bXB1eHVvc0c3eUI2N2g3?=
 =?utf-8?B?K01mWmN4ZlVWeTV1ZDZuUk41bWY4NlN1czhvTi9ZUklVd3VCYUw1Vm01eXFa?=
 =?utf-8?B?bFp5a0M5bHkwU0ZYbU5abWdzKzNSVC9NeDhQVE1TY1VYdEpXdUlDRURHeUVm?=
 =?utf-8?B?ZlZzRmg0R3Nnejh6WDZ2Q0twSTdzcE80MmZGYklXZytDTEE1c3YxVS95MEl4?=
 =?utf-8?B?a3NwTloxUk9ibTJGUVJGSXg3RUl4ZFdCRnJOa1VvZjRXZ0lJYXBZSk1nOWhM?=
 =?utf-8?B?WWpRb0JRd3QyTVRVNU4zN3ZRa0YyVHNvdnh0MUZqdXE2WXpTU09ENXo2bUR3?=
 =?utf-8?B?cks2bU1Wb2NneUNRTzU4akp4UnVORkVXWEpLbjlhYklFYVBvZTZwYUIzSmZH?=
 =?utf-8?B?OVpZMnRWaDFsWTAyRG5RYjhTY3NKU2N0OTJLU3RWMXB6SnIzenh1MktRK2Qr?=
 =?utf-8?B?dUNWMGRZTHczNnB0UU1YM3dzNkt6VDk1SmxwWk5RYVpUSTJ3enlhSHMvZFVL?=
 =?utf-8?B?bEQvWkVMWHl5K011TEhTaGgyVTFjL1k4QVFOUUZiemVROE92cXRiVk9qeEtH?=
 =?utf-8?B?a0J5REdMMzNXYU80Nlk2VmJnalIvVDR6REZUTGtabkZDQWRzNmpHT045WlZV?=
 =?utf-8?B?ak1FL3hNc1I3b2JtU09YOFh5MnJCS2dPYzREU2NTalN0c3Z3ZHVtUVBvbGxI?=
 =?utf-8?B?Zi9UM0tDTWtvK3dzVHV3TUY1ZCtPNE83bnJpMmIxMjROSmpFUlJTT0lVV0dG?=
 =?utf-8?B?V3JJb3ByQmZ4MDI3YnZTRjRKTHhOS2M3Mm1DQU9Lcm9qWm9oSGJoU0tLODBF?=
 =?utf-8?B?ZVE1QVpVcmZscC9ueTFBY21qUmpsVkp2N2l4WHNlUG5xTXFZRllWVTlnV0xy?=
 =?utf-8?B?QnhLYTkzdWNiUElOTnBvbnVOY1oxK1B2S2V6ZjVmaXV3KzhPQVFhMkkxd09S?=
 =?utf-8?B?N3kxWGZnNFdnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTB3eHR4SEZMQkdCTmZwd20wUDduVWs5UUd1RjRNZDY2VHpFcmtZeVNjNDNz?=
 =?utf-8?B?UU9IZHl4bFFQcmJrY0pLQWVVY3gwM3dkdTNvc2RQeHY3bWJrUktyQVlhOHZS?=
 =?utf-8?B?b0wraGlMbW51RnhQUWdtUzdwakV1cVY5cGVITlpVMzF4NndENnQ1YWVkdVRj?=
 =?utf-8?B?UkJUVnQyWWRETTNVQmI0THhwSWpxSXgycnRMVmdhdXIvRzRYVXV3SEE0Znkw?=
 =?utf-8?B?aG5VVTFMNWhVT09CbnlWeXpRYW5XU2Y2VjJ1NVQ3R1I2TXVFd2R0SmZKK2hr?=
 =?utf-8?B?NXl1RVlic1ZHZytzZmpVYW11UVZ4WHc0UHZnMzhRM05QdXJVczJ3RExDdUZB?=
 =?utf-8?B?ZFFsaGNUWGxwV3hSTGtHRW5LYk1FazFXWTRiYzQ1U25kaW1LZkc5ZURWMTlS?=
 =?utf-8?B?WjUweWo2azRlRWIrYWY2Q0JIWGp6c2JENTllUXJTT09Dbm9qVmwvVnY3cVlR?=
 =?utf-8?B?aExuS0tKSFhMNnJkVExXbFJrdHZVWGpjdGk3cC9TRExHd3lUcFVwbWVoRlR6?=
 =?utf-8?B?VzZzbEhUc2d1NEIyZGdOL0tVMTZDMytmRFBqMFpmdEphMlNOOVY1NXFzMFJ4?=
 =?utf-8?B?N0xlWjlYeGJlS1kxdFpQbUZlMDI5RS9XZHYxWURyS0ZKUnZZdWE0RWxPTnM0?=
 =?utf-8?B?Tjh5dXpBZ3dIRUdHaFdrREVkNW5pNXg5M0FLdStqZzM0MTZoRTFURlRISlV4?=
 =?utf-8?B?N2dTRU5GcVZUNUFoSnozb3lLSTVrMTJ0QXJTdUJoTHZIQ3FBaGtEY0xsZHF4?=
 =?utf-8?B?QlphSFVYMlRNQkpVN2NRUXRVUStUeGJibnZZSGFwN1VCNFgrcTcwSTJ0TEw5?=
 =?utf-8?B?QU1SZjZMSmZTQzdqSkpjc0pqNktXYndtRGdYM2V0ZU5TMDJYYkx1QlNpQmVC?=
 =?utf-8?B?Z0lmazFQUHFvZVJvVDZLc3VwOUxFZXYvKzRmTWV5TEVGRGE0SHBwSVNjcXBn?=
 =?utf-8?B?UW5QOGhVS0c5TDZJaUxYUW5VSGtuT2xqdC80NTRuV3RJd2lxT2EyUUZ5VWJ2?=
 =?utf-8?B?WHpSaHZuazY3Ny9uaUp0cld1c1FyOUh4S2Q3U2p6bjhSWG9rSUZ4VkN6Snhi?=
 =?utf-8?B?cTFiMGV2bklUZ2RCYnlBSTlrUlJEcFI5azFvcGtSVEpUV3dKR0RBdDRRcU5N?=
 =?utf-8?B?NncwVUJKTlNmL0tzSGFNaXNNNlNlS1ZsRHlFbTVscnluYTVkT1JGcVpGbDVS?=
 =?utf-8?B?eWZhZWVHK0pWc3dVQ3pGbEJPSTNkVllkeE1xbi9FZUMwZmdRL29RMmt1Ui9D?=
 =?utf-8?B?Z1M0RHBONDgzRnpqVy9XSnhYeEVsSEFqRW9IUzFaVkd0OXByYTFBVzFBWE85?=
 =?utf-8?B?WVhmdXIzWVVMeXBEUUtaMzVqdHFSNURHWktQN3ZHejhYWldrdVRlQWoxZ3ZZ?=
 =?utf-8?B?K2RqQlYvT29selBrS1RObGpVVHdRRlpFUGF5QmNEelAwQmg1cGN2K2YvVDZN?=
 =?utf-8?B?ckg1QUNtbGJSeldTenorVFY4Ti9IYUMzNG5UU1NHUWVXVFBheWxnV1NESy9V?=
 =?utf-8?B?elBJYTg0b2lwWTgxSlU1cEo3VkFaaHRzVW9lQWcwNGdJRnBDalFmRDA0OStN?=
 =?utf-8?B?N0ZsVkFwbnlIRzhiRWVPY3l1aEV6YWdNTDNKdFVsdnV5VGo5WmpGQVl2cENl?=
 =?utf-8?B?UnNYS0lha1RQRXlkNGo0UWVRQytPNGFhWDZ4RmNZbWpIT1E4bEJlMmo2eEN5?=
 =?utf-8?B?RXQrMTdkaW5aWFJUcHk1SkttdFA2OWtuRFg3WHRRbUk3TTg0Y25UaE52Rm4y?=
 =?utf-8?B?WHhkdWdWSlcrU3h6UDZXZWIzcHFxVWFZR0Z5VEVZZUw5U1ZIYWh0UGVxYkNE?=
 =?utf-8?B?dlpGeWdiUEFlM1g0TW1QU3o2N0ZFSE1ZbythUlFZaGNXZFNZMDNzM1FYTlpz?=
 =?utf-8?B?am9DbVAxSkoySU5zMklwWStiVHlzQStBNWYyYzR6dUZOU3U3UHlhaFhsUytq?=
 =?utf-8?B?Z214VHlOQ0VFTWJLZHVOSTVnUzhkMjcveXdnSjJSaDdOWVFRelNEQW9QVWlr?=
 =?utf-8?B?WEFCNDJsQzdBVC94dEMyek50d0JEK1o2TE9WT1BmVEF3ZU56YjYyUlY2QWVT?=
 =?utf-8?B?WTIzMThLVnF3U2NuL0tHMVVPb1gzZ2xyejUrWWl6NFRGNldFSVJuV3ZSemY4?=
 =?utf-8?B?cDJDQVJRcFpOMkJpRkRKSE9sNngzcmNjcVVSbkIrT2IyMlhjNHpiZkZJMmk2?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F60E48D4670D144993BBBDF532815D91@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1de33f9-591f-4b9e-b7f5-08dde6ce88f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 07:34:49.1384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2iG1tgExNFq8nA3+OXjqXBo8LowFEW6OTkB/E7iru+xjM8i16AMVH5OX2rk3EUXBc1IdCP8n+YMBAH1BoJTqHPRLoE9iCu01fIAU3fOFRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB11101

DQoNCk9uIDI5LzA4LzIwMjUgMTA6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wOC4y
MDI1IDE4OjQwLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IC0tLSBhL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jDQo+PiBAQCAtMTA5Nyw2ICsxMDk3LDE1IEBAIGFmZmluaXRpZXMgdG8gcHJlZmVy
IGJ1dCBiZSBub3QgbGltaXRlZCB0byB0aGUgc3BlY2lmaWVkIG5vZGUocykuDQo+PiAgIA0KPj4g
ICBQaW4gZG9tMCB2Y3B1cyB0byB0aGVpciByZXNwZWN0aXZlIHBjcHVzDQo+PiAgIA0KPj4gKyMj
IyBzY21pLXNtYy1wYXNzdGhyb3VnaCAoQVJNKQ0KPj4gKz4gYD0gPGJvb2xlYW4+YA0KPj4gKw0K
Pj4gK1RoZSBvcHRpb24gaXMgYXZhaWxhYmxlIHdoZW4gYENPTkZJR19TQ01JX1NNQ2AgaXMgY29t
cGlsZWQgaW4sIGFuZCBhbGxvd3MgdG8NCj4+ICtlbmFibGUgU0NNSSBTTUMgc2luZ2xlIGFnZW50
IGludGVyZmFjZSBmb3IgYW55LCBidXQgb25seSBvbmUgZ3Vlc3QgZG9tYWluLA0KPj4gK3doaWNo
IHNlcnZlcyBhcyBEcml2ZXIgZG9tYWluLiBUaGUgU0NNSSB3aWxsIGJlIGRpc2FibGVkIGZvciBE
b20wL2h3ZG9tIGFuZA0KPj4gK1NDTUkgbm9kZXMgcmVtb3ZlZCBmcm9tIERvbTAvaHdkb20gZGV2
aWNlIHRyZWUuDQo+PiArKGZvciBleGFtcGxlLCB0aGluIERvbTAgd2l0aCBEcml2ZXIgZG9tYWlu
IHVzZS1jYXNlKS4NCj4+ICsNCj4+ICAgIyMjIGR0dWFydCAoQVJNKQ0KPj4gICA+IGA9IHBhdGgg
WzpvcHRpb25zXWANCj4gT24gd2hhdCBiYXNpcyBkaWQgeW91IHBpY2sgd2hlcmUgdG8gcHV0IHRo
ZSBuZXcgb3B0aW9uPyBJdCBjbGVhcmx5IGRvZXNuJ3QNCj4gZml0IGJldHdlZW4gZG9tMF92Y3B1
c19waW4gYW5kIGR0dWFydCwgYnV0IHdhbnRzIHRvIGdvIGZhciBmdXJ0aGVyIGRvd24uDQo+DQo+
IEphbg0KQWdyZWVkLi4uIHdpbGwgcGxhY2UgaXQgYWJvdmUNCiMjIyBzY3J1Yi1kb21oZWFwDQpv
cHRpb24u

