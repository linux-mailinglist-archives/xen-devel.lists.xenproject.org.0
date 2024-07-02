Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C991ED86
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 05:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751933.1160042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOUUG-0007hg-7e; Tue, 02 Jul 2024 03:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751933.1160042; Tue, 02 Jul 2024 03:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOUUG-0007fw-3c; Tue, 02 Jul 2024 03:47:24 +0000
Received: by outflank-mailman (input) for mailman id 751933;
 Tue, 02 Jul 2024 03:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMB5=OC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sOUUF-0007fq-4s
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:47:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c871b4d4-3825-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 05:47:21 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB9221.namprd12.prod.outlook.com (2603:10b6:510:2e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 03:47:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:47:17 +0000
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
X-Inumbo-ID: c871b4d4-3825-11ef-a59d-41c015c667e1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey4Jx+jcZNoOU9xvd1ke9hOC4XPMfe9A2bX+EM3ypo8Axh9Qbs4BK3TLPU0dmFhH+Y4HggaLtN14WRxJ9RzdXfVxwH7LHK3L673sS32r2vclWOJvjS0bzGHX3/UYf8Q2rNUeoTePSaf3UWQedyy9igtzhbATLrTcswKarnW3PZ10wXUvQtRadGXlUrqLF8ZqtqaYC64/iLNWfBbGLM22y9vDbQ/l0CYGMMgCt957eXm8d5Y/nNf0jkJdMI8O3BeB64KPqkl7DaY80TZr/ReGOJxZ2RiAO6K13olwxmie5b4Sq6ZhOVOnBtZmpOpmqS6AHB0ve8uVm00UN0nOtJSorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHdu5GcmkebxRQZ0aYi0oYSvbp/gjzeigQkEObYZF6Y=;
 b=FkqFC4tXphduiNLaLxR1BMFx4jCvvXbj/EUFUC9l+7CydJkthRFti2tE/G4FPdJuXgTwrxyZNeAG/LPFncmXtT7UhozqIvI8omg2MQETdxgAZ4xLyNuozXpIThH5pvOoEHCDOHwcCzD/ndoJqf6El7dXzK398bFkbrfizvgzzD+OnsYUV8TBi/CMf88quVpg52zy0Cl71rG4+7bug2C5YElEJsnZHFe7WSFpav1Iz3tcd7Pn9jiwOB1fW4nw3xOFu+gLGhtVDCG7L5qk6zhs5kL5mEoRdzAO+2KiKi/m0WgiQqCF3T7TU1aLYI97xKva7U4AD8k5BOhnNUX0L8tKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHdu5GcmkebxRQZ0aYi0oYSvbp/gjzeigQkEObYZF6Y=;
 b=g2Yqo1NFdnuiRVfPpqTHSTYYNjLA/TbTNrvwm9hRLoRjt2WqXfcH0ry5W8LukHFvRL1ZRgPvsz68W+sByCt3Ajw6Dffs/DA2yDHvA03a+/suh1kZ4nUpXCYJ3Oc5QaZW1ha83gwtxWVwuU6OC+ULVuQ0YkGvxjrPMkX1ZOXbeaU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from
 dev
Thread-Topic: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from
 dev
Thread-Index: AQHayundYHEz4Kn0sEizSQnui4wvzbHhe8EAgAHYIoA=
Date: Tue, 2 Jul 2024 03:47:16 +0000
Message-ID:
 <BL1PR12MB5849626196B8DE37E0BA4F20E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-8-Jiqian.Chen@amd.com>
 <ff827def-743c-4312-88fb-dbd1b87bb85d@suse.com>
In-Reply-To: <ff827def-743c-4312-88fb-dbd1b87bb85d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB9221:EE_
x-ms-office365-filtering-correlation-id: c646c635-14a7-4cb6-8937-08dc9a49aadd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qk0wbnFtdjZEcExsZ3hDREhPWG11a2xRMHJQVStKRkI5Q3N0cmV5S3ZlZDRp?=
 =?utf-8?B?eHpxQ1JvWjVURW9oSEdnbjloaTU1Tjh0cXlSbDZkK09JbC9DbVAzS0F6cUlV?=
 =?utf-8?B?UzRMYkJPS0dwQ1hndGVNZUJYYklqY2tzMkl1eS9uakVKSERidlFYTUR4Um1r?=
 =?utf-8?B?dEpNaVA1dERHUWQvNEVWSkpHM1pFKzZkb0EvY3FzWFBHakpVcTVPdXRGMmpY?=
 =?utf-8?B?MU9ZTmhmVkEvMmgxTjhkRHpJL2djT2Z3REJkMnJ6MmdRWFhFYmFuOG5mMWRF?=
 =?utf-8?B?K0lsRTV5UmZSREt0NVZHU3FrK1VUSUtQcDk2TTBvK3JaVUoydCt1MlduSXFJ?=
 =?utf-8?B?UytaaUVZbnlqNTIzUU4yYkltSW5iTTVYdzhPSE9SUkgySGcrV3A5b2lYaWZL?=
 =?utf-8?B?d1l3QXhKaEpDL2laTXN4eFl1cXRCS2hyalRxWGZjR2VyOTR5WG52MDI4UHJG?=
 =?utf-8?B?cWh6azNWcWQrNEN3VWFUa202ZmxHUHNxVFo0VzA1ME90T3pJMW9IVExXN1dQ?=
 =?utf-8?B?dWRxMDYvOTJITGhocDR5TU1QM1ZrZG9OL3NEZmo2UkFReG9LS0pFb1NENkdL?=
 =?utf-8?B?bkxvU0hSaFROSnFzTGgvQ05EWFpIRzIrRlpQd013RlRzWTdSVWFEYSs2cFJn?=
 =?utf-8?B?a0xsN0V0SlZrNThpUmIyR0lLd0dqM0VaeVRHaVErenlyeHRXQ2p6VmlTKy9I?=
 =?utf-8?B?MmNwajRwNEF4NUwyYkczL3FBZ1AyRG9wUjkrYzVUTExpRnBOZEl4Ym14RlZ3?=
 =?utf-8?B?MElpRjcxRjExVzF1RXJuNStwbEtQWmZwZ014cUwwREt5eFE4OXBiUTVEa0Qy?=
 =?utf-8?B?ak50V2daRVF1WGR2M2d2VmdOanBCRGFvMm5pL05reC9QaWFwaDF0ZlBOdytG?=
 =?utf-8?B?U29obTI4QTRQMUlKYmpKUU0zVzZUb0VjNEVNNmZnazBEYy9MQ05wSUpMa1Qw?=
 =?utf-8?B?cTRubDZRSVVoTkR2WFlhN3Yrc1dxWTNYVURFOERjSkNadVdFS1dSVDIwZDFC?=
 =?utf-8?B?V3JaVDFWQ1kxZTFNQ2RpOUwvUm1GNjVFamRKanA0Q0s1NzZIY2duU3Juampw?=
 =?utf-8?B?L2drOW1Wbnh1OHdMRnVZZVA2eHZCU2paWnJmUGt6Z2VlVFFGRndsOENjdXVP?=
 =?utf-8?B?aDBOeVJBSmk4RVVHbzdheDVmL3A4NUJUTzhLTHJsNVZzZ2ZPQmVXUUQ3RVF3?=
 =?utf-8?B?SXBvenpPM2R4WnZ0UDZ1SytKYXNQV2hOaDlYbThvbDI5SmNtTVNnVHNOaEFH?=
 =?utf-8?B?SGI1OW5HUkdEMExJNW9hbHNsUy9OeG1KZGpTNmpwR3laTVJVazhjMGd0cERK?=
 =?utf-8?B?alJKRzFsTnhlTmJuLzZkb1V6WTVLM2lwVGV2UFBFZjkrSG11NVNza0JmQlll?=
 =?utf-8?B?cTJiOG5aQmJUK2RNc1JBT3RrK1ZVMndUS0hSc1RwYTBEYS9GNjYwaldsUnVN?=
 =?utf-8?B?ekZMZVN5d0EyLzd4ZkdGUE8zM3BueXBXV2xUMWNEbVU5MGdmQ0d0THV0RTFa?=
 =?utf-8?B?WWJ5Q0o4RnZpcUFiMjV6Q0ZiWjZxdGtxNC9iSmlibVlCMGw4Z1RaTWZwZVdv?=
 =?utf-8?B?eWhBSnZjNzhZNkZVWml6Rnp3ZlRMSDgyYzlGSkQxVSs0enJ4WkN2bjhYbnYz?=
 =?utf-8?B?ZEhkYnEvUU01SnRpaTdEc1piZU0rK0p3YWlYeXJFbm94TlgvN0NiNlROK3Va?=
 =?utf-8?B?U05FM0J5ZVE2ZTRKNHN4L0tydFVyUm55akZMZm1XV1ZKOGpReEx6cTY2cE4y?=
 =?utf-8?B?NWErdEIxeTBaUnBBdmNCcE9vNzIvbEZVNFJETUxhdnl4eHcrNGhXQ1VudUVr?=
 =?utf-8?B?NE9kWFNJdjZ0NmY3UElCa0RaOWovOGtnb1o5RXdRcXZVMEo4Q05kb21VQ0Zz?=
 =?utf-8?B?NUcyYU8xVlVYYTl1L3NjSm01TUgrRG5veEc4RWZvZjJPUHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXBmTEVuMjhqdE9lVGU5REt4cmYyaHVTbWhnendQbTlGMDVDT1k2VDN4bkdU?=
 =?utf-8?B?ZlVQaFZtMkszQmxpNXNpNitFTmNTbGFrM1BPUlZaWVRqUFNTV3Q0ZUFkMFIr?=
 =?utf-8?B?VnRMWVdtcWNUYW9tTjdDTkgzSEV0ZUgzclo3N0xXSFBqcW8rYVRRMmpCZ3VN?=
 =?utf-8?B?N2dONUVrcmNWUmlWMlJYQi9kcUlPc002UHpwTHRMYlBpMjNZbnNRYk91R3NQ?=
 =?utf-8?B?WDNSdGhUbkJGLzFPK2laNXplWkJJSzlKN3YyTDlSKytWL1pEa2xjYTdLUjdn?=
 =?utf-8?B?U3ZJNjRjOUY4K1ZydHc0UjUvcTAzZVJtcWFmM0UwMzA5WXpLTTFBZSt5VUhG?=
 =?utf-8?B?YlZ0MkM3WHN0UU0rVFVvNnNaWUluMmU5VExRaG1FKzg3bEtWYm5sVWRIcTZv?=
 =?utf-8?B?eUlJWlB0cmQrMUk2MDcvVWxxUmh5Q1JzbmRneUltcGtYd2EvWXVxd0VPbloz?=
 =?utf-8?B?QlQzOTVKRmtGb0ZGNkE0bHAvR3c2cEhWV1VhbEcvQnRlblcxWk1GbWhmU1RT?=
 =?utf-8?B?R084Z1ZETWNNam5lSERPMnp1V29lNVJmcUh6MGhGQmFTYjVTb3kvTkwyTklU?=
 =?utf-8?B?Q2c0cFJPbGJCVzBvQVphQ1RKc2FKaDljak4xVHp6NjJOdk5sWlk5UVRpZEVD?=
 =?utf-8?B?S2x1MS8xVUczdDFQU2hYTVpNUmsrU3dobUxYZWoxOWE1WFJQOEhHWEVjdk45?=
 =?utf-8?B?dGhWdjY4dThtVUtWWnJmT2ZPcGtveGpNQ2QySVRYM3JZVkV1c2VFVC9pOTRB?=
 =?utf-8?B?em93c3ExUHhBUVJ2R01pNlZJRUx5b3lSeWpjQm9jRnVQYmdUSWNvWi9iZ0NZ?=
 =?utf-8?B?aTR1OWJwaUV2Rm5PUWhHUkFSZFFiYUQwNy9KRnBLR3ZyREExcW9WQjUzdFZt?=
 =?utf-8?B?V25OTlhvWjR0a2ROZkcvRXh6MmxZYXR4RmJPT08rbW1VN05saGIrUjBnZURw?=
 =?utf-8?B?UzR4R29VWk5GaG94RHFVaFV6NllFaHFFK1VONVIrVjl3ZS9oZjJPR3IzU2cv?=
 =?utf-8?B?MlRlbDhzYWVZSVJiZTBkaXVFTGtYeDhXRWZRUmE5T0lBWjJ3TVludFlpWVg5?=
 =?utf-8?B?MTNJN1RaK005aVlCUXNNd1ZVQkJVZ2krdkowc2Q2TjdNK2crV3dOUlhQTEgv?=
 =?utf-8?B?MEJJT2NlenhTTXNYUDhwVW11dkJHeUdjanZMeEU3UDlFdUZ4VEVCVHNhcTk3?=
 =?utf-8?B?UVZWSTd3eGw2SkZmNG5MRFB4ejZVcEErQWwwTjB4NitlRCswQlZySTJLS0Ex?=
 =?utf-8?B?VnJSYzF0WmZDSHlWbElsY3lncmw5SEEzeHhJK3EvT1NLMk5YS2RDYUd1QXAx?=
 =?utf-8?B?YWNtMEd0MnVIekFKM1NEQjhWdEZPUGFmYWRUQkVZNmJIQ2pmTzgxYzRsM3Ri?=
 =?utf-8?B?bGhCMGdjZlN1ZnZGQUhEdlFDeXFFNDRFNmxObnI2OUJjeEczelJFUWxyVHhE?=
 =?utf-8?B?UnI4RUVaTWZOWTlWbEcySXh1RFZBcklGUjF4M2oySHlsSHBKZHZVaGhwZllM?=
 =?utf-8?B?WjZpTmxuQzJPbFIxcjViUTNjVzN4UHB2SThrUHJvNFRlY0gxMjAwbDI1T1pp?=
 =?utf-8?B?c3RWTnhpSHBrdTgreld3TnhCRG1sZXNVWkppRWNtSW1qYzFyVWpVa00zRUkv?=
 =?utf-8?B?L3VoMTBSb29jL0FsYklTMFpHYlMvdDRmVlBBWDVRYkQ0MXdIbG1lUVA4WWht?=
 =?utf-8?B?UjMxNjRYTitRUDRhY3hSa09pU3pkbjdqRzZma2hGNUN2ZVJjTFA1Znhha3J2?=
 =?utf-8?B?UCtUUFd0THpSdmtGc012VEtzNnBkL1J5WUpaY0ZSa1Nrdy9hS3JEaDl6b1hB?=
 =?utf-8?B?Rk54Q1ZlVnMvaGphZDNvQ0lUVmwydGltMWRuSkVSSnNUd3JsT0svVFR2UDRk?=
 =?utf-8?B?Y1FkcEt3MnZuelR2TnRobHZVSFZramQ2NVVLR2hOWE0xbVQxa250U2c4T0pK?=
 =?utf-8?B?STRoYklaOWh6RmdKbXVwakF3L0YyREZJN0xPV1lEejBaUjdKYlNUamNvMTdV?=
 =?utf-8?B?bTUvTWdVa1NjUFRXQ2pWcmVEa3BwbWNFSFVoNkRka1l0MUVoZWJUdC94V3Bj?=
 =?utf-8?B?VHBYQnhJci9xcVRwMmcrc0lPaktUemwzam1YUWtFVWI4dVAxendub2l0VWdt?=
 =?utf-8?Q?7nic=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71C65E03140FC4C9FE17358703DEEEC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c646c635-14a7-4cb6-8937-08dc9a49aadd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 03:47:16.9211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3fhKOCX9OnA1ibyJxW2CbZWGHapW22vELcVayvYAyTOAe1M2OwA0LS6yNv+y/+0uPmC0l9mHNQP9795AdJMWJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9221

T24gMjAyNC83LzEgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvY3RybC94Y19waHlz
ZGV2LmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvY3RybC94Y19waHlzZGV2LmMNCj4+IEBAIC0xMTEs
MyArMTExLDM4IEBAIGludCB4Y19waHlzZGV2X3VubWFwX3BpcnEoeGNfaW50ZXJmYWNlICp4Y2gs
DQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9DQo+PiAgDQo+PiAraW50IHhjX3BoeXNkZXZfZ3Np
X2Zyb21fcGNpZGV2KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBzYmRmKQ0KPj4gK3sNCj4+
ICsgICAgaW50IHJjID0gLTE7DQo+PiArDQo+PiArI2lmIGRlZmluZWQoX19saW51eF9fKQ0KPj4g
KyAgICBpbnQgZmQ7DQo+PiArICAgIHByaXZjbWRfZ3NpX2Zyb21fcGNpZGV2X3QgZGV2X2dzaSA9
IHsNCj4+ICsgICAgICAgIC5zYmRmID0gc2JkZiwNCj4+ICsgICAgICAgIC5nc2kgPSAwLA0KPj4g
KyAgICB9Ow0KPj4gKw0KPj4gKyAgICBmZCA9IG9wZW4oIi9kZXYveGVuL3ByaXZjbWQiLCBPX1JE
V1IpOw0KPj4gKw0KPj4gKyAgICBpZiAoZmQgPCAwICYmIChlcnJubyA9PSBFTk9FTlQgfHwgZXJy
bm8gPT0gRU5YSU8gfHwgZXJybm8gPT0gRU5PREVWKSkgew0KPj4gKyAgICAgICAgLyogRmFsbGJh
Y2sgdG8gL3Byb2MveGVuL3ByaXZjbWQgKi8NCj4+ICsgICAgICAgIGZkID0gb3BlbigiL3Byb2Mv
eGVuL3ByaXZjbWQiLCBPX1JEV1IpOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmIChmZCA8
IDApIHsNCj4+ICsgICAgICAgIFBFUlJPUigiQ291bGQgbm90IG9idGFpbiBoYW5kbGUgb24gcHJp
dmlsZWdlZCBjb21tYW5kIGludGVyZmFjZSIpOw0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPj4g
KyAgICB9DQo+PiArDQo+PiArICAgIHJjID0gaW9jdGwoZmQsIElPQ1RMX1BSSVZDTURfR1NJX0ZS
T01fUENJREVWLCAmZGV2X2dzaSk7DQo+PiArICAgIGNsb3NlKGZkKTsNCj4+ICsNCj4+ICsgICAg
aWYgKHJjKSB7DQo+PiArICAgICAgICBQRVJST1IoIkZhaWxlZCB0byBnZXQgZ3NpIGZyb20gZGV2
Iik7DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICByYyA9IGRldl9nc2kuZ3NpOw0KPj4g
KyAgICB9DQo+PiArI2VuZGlmDQo+PiArDQo+PiArICAgIHJldHVybiByYzsNCj4+ICt9DQo+IA0K
PiBJIHJlYWxpemUgQW50aG9ueSBoYWQgYXNrZWQgdG8gbW92ZSB0aGlzIG91dCBvZiBsaWJ4ZW5j
YWxsLCB5ZXQgZG9pbmcgaXQgbGlrZQ0KPiB0aGlzICh3aXRob3V0IHJlYWxseSBhYnN0cmFjdGlu
ZyBhd2F5IHRoZSBPUyBzcGVjaWZpY3MpIGRvZXNuJ3QgbG9vayBxdWl0ZQ0KPiByaWdodCBlaXRo
ZXIuIEluIHBhcnRpY3VsYXIgdGhlIG9wZW5pbmcgb2YgL2Rldi94ZW4vcHJpdmNtZCBsb29rcyBx
dWVzdGlvbmFibGUNCj4gdG8gbm93IGhhdmUgeWV0IGFub3RoZXIgaW5zdGFuY2UgaW4geWV0IGFu
b3RoZXIgbGlicmFyeS4gQ291bGRuJ3Qgd2Ugc3BsaXQNCj4gb3NkZXBfeGVuY2FsbF9vcGVuKCks
IG1ha2luZyBhdmFpbGFibGUgaXRzIGZvcm1lciBoYWxmIGZvciB1c2UgaGVyZSBhbmQgaW4gdGhl
DQo+IG90aGVyIHR3byBsaWJyYXJpZXM/IA0KSGkgQW50aG9ueSwgd2hhdCBhYm91dCB5b3VyIG9w
aW5pb24/DQoNCj4gT2YgY291cnNlIHRoYXQnbGwgc3RpbGwgbGVhdmUgdGhlIGlvY3RsKCkgaW52
b2NhdGlvbiwgd2hpY2ggbmVjZXNzYXJpbHkgaXMgT1Mtc3BlY2lmaWMsIHRvby4NCj4gDQo+IEph
bg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

