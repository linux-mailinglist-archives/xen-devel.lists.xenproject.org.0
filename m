Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE78C8464
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723982.1129156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uOC-0008FU-Dp; Fri, 17 May 2024 10:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723982.1129156; Fri, 17 May 2024 10:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7uOC-0008D5-B3; Fri, 17 May 2024 10:00:36 +0000
Received: by outflank-mailman (input) for mailman id 723982;
 Fri, 17 May 2024 10:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7uOA-00084w-Ck
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:00:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd0db11-1434-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 12:00:33 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Fri, 17 May
 2024 10:00:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 10:00:28 +0000
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
X-Inumbo-ID: 4bd0db11-1434-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUOHT00a6iT92iBJBcfc4/nfl93AQLm7vMn9Eg385m74fV9Xu+pypv9vi9Xxd//1MrgTQhiVW5cN+7wJM1Mt6Jfn1Gx0SKDkUtNpxDa4ujQThrItOPUHcNuZZgjBBtT+cGcEBxMCiF6NbKO0Q+FkjvDqjJ1kx2NhJEevlHy09lHbYb+omlaTmf8izewNbtKrRNyTrZWAlZX0T3ySM8kEZSawgvNSK1v78O0ZnzAGwU6JpVVJO6NKWW42gdXCLqfZv8Fc0lk6GupeNEBnyhZ8H3RqXaDqUHSi9/kXwKs01KntVZKIr42Nsoy3mJCGlKUw/iS3IcYry+mcVCDq4OnVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qL8Zbd0+bVxFxeNkqFUC4+wUMs3F7xlhfO3YaNDWndA=;
 b=nSiF4wC8SpCwGdoPJe/BfrbGcshyUI6lSc4fepiJyuvzfcFti0qosPbMPJS5OEkXymutyTXMeIxbvzBgwDUhkXNy60qcZpC/KufLCLtCDI7cDlwQztgDB7S7sROJnvCsQ1nFVZ8D0TGxLQqi1A1AVW98xKMHTJ7uptMjGfF7Y1SPCsMAu73wh0Ky5Bq7oTw115rQ+chRnC8gaLsA/1ZjebMEF8uCFIOF1JIG2NUs9teFBnwCwW5XFMWWTEVlF+KNXM+WIg1tJSQRD6TmC/7bMg9e/vkKUaS1pGUFBtMLns9/HxMTpPDSYig2o16Emipm0z4sIhxeee+1HBxI9CVEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qL8Zbd0+bVxFxeNkqFUC4+wUMs3F7xlhfO3YaNDWndA=;
 b=u8Pcj5jXB3pi3T8MA2p7XcsxNHumzQ/LIBUWZjOEjiSwDg8jmn5dEc7V1kJg02tf2bSCu2h/HK0Ix0LTTNsXiGpBsbBlN2vw4OT0ZtJcKviQLWlRMiW8ycmGZ3/mUXj9qeYRjAMBQVrKo4R3vUIpdn5qE1y4QNupBbohD+sSE5A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Index:
 AQHap3bYcGtlWtrcpEyRLTK5fjq5SLGZ1UMAgAFwSAD//9GPgIAAlWQA//+DzoCAAIa3gA==
Date: Fri, 17 May 2024 10:00:28 +0000
Message-ID:
 <BL1PR12MB5849CCF9A890A7DA969F6474E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
In-Reply-To: <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9121:EE_
x-ms-office365-filtering-correlation-id: 7f2f6352-44cc-4e1a-954d-08dc76582e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VEptTEZzYkRydUg0TDJTZjQ4TGUxU2czeTJKbkJ3aTlLU1IvSjg4ajdQYVFx?=
 =?utf-8?B?UnlDOUdMM2lMdUNkR2E0VW1kd2tjQU0vVHZEWHBTYnRyOGhVOEZ0b3pJOXJW?=
 =?utf-8?B?WGJOYnNxUXZpNTA2WXowT0hjeFgramVZdHFwYU4xR0tpNVN1VU1MT25nSUda?=
 =?utf-8?B?Z2RHemRrM1VjOHdLaE8rb3VHZnV2ei9xaGl0MDJCZW5PSDUxSFZhSG9hMzF5?=
 =?utf-8?B?b25EZ1dYa0ZuOGZIajBvQTM3OENJSUtZRFBlZ24vK2xFaTFMRHpxeVRXRlk5?=
 =?utf-8?B?bklRdkxZcUNpdFF2SEpLOS9FMTRJN095Ulo1ZkNPS2w0cGRUSldIeHZLSWVY?=
 =?utf-8?B?TW1yTmJweGphbFljcE5qZURiNUd3RGJTRGx0RXFWMFZ4SDd0aUFwYnNXbDJO?=
 =?utf-8?B?YU4zQTBnaDhNOHZQWUZ0U2JVc3IvdWN1Z3UzZUhqMGs4YXVXU2Jtek9pbWJL?=
 =?utf-8?B?bzhJUTRnaWpIanp2N203ZkZTTXZ4VDdwRUdodkZaRkE5N21DOThyUFZuVkZ3?=
 =?utf-8?B?aFpCbitjZldGakFoYUlvL3VwN3lHTk53ejlkYmRXNU9Sa3VIckdzSWc1T3J4?=
 =?utf-8?B?allzZ05odEV5bEprMHYxZC9RTThtSlFUTjlRSHVrc2hUM0RlSDRjOFk4eFZE?=
 =?utf-8?B?RnZ1Tk1XdjU1YnJwbHJYNXVRQVNXd2dtbHFDMnlpV2pLNmttbjVMb1BaclVv?=
 =?utf-8?B?cUtUNU4xQ1QyOHdKN3lnUzJXVXJNajdUSkwrMzdXcmNrQ1JKN0ZVQnZGeXRN?=
 =?utf-8?B?Qy9LWjJsNS9wS0dybi81akRXRzdqcDV5N0cwVkFBa2dJT2JIbG1RV3pINjh2?=
 =?utf-8?B?RUU4Q3hvQmwxQkxwNkNUMkFEZ2dUa3UxbzVxb0FRdUw3L3Mzc1JFUWxURmR0?=
 =?utf-8?B?S2c5N1N0cFJVcm4yK2oxa3VlTkJtUEVET2lRN1dnRVhIOHpFNkludzFUajcv?=
 =?utf-8?B?NU81aGVqcFNybVJlZXFINTVXbUpiZ1BaSWVOanA5YkVsMzVVZFBYei9zUmJm?=
 =?utf-8?B?Nm1wRkNLU0x1QWY3TnpCS0Yyek5yL29veHRET1BoQWlyN0gzV2dnR1hXUkJT?=
 =?utf-8?B?cHFYRU12YXFUUXpzeWlZRWZLWlNsN0lTREEra2N0cGtOQTlMYTlEaXZ3YTlX?=
 =?utf-8?B?U1puNXBPUXBweVR3RWpLb2owKzRJYzVOUkY4ZCthSlp0TnhDcFdzNXZXazFS?=
 =?utf-8?B?aU1jQTY5ejNtVXdKd2dRKzdsYnMvakF4OGZrZnN4Qy93aVQ0TUZwTlhvU2sx?=
 =?utf-8?B?YkFPNkVLWWZYZFNVQVZxM1pzUVp1bnJVVHMwdHJaT0hCZ1RYSHRPYVlnTTJx?=
 =?utf-8?B?eTlpWmlud21UUHFGUUVYZml3ei8vekdFOW1aQUoxOHl0cVdzSHlkeXpnOUZS?=
 =?utf-8?B?eXFDWlhYb1dhZ0pOaEdTeG5kaU5kLzl5TUI4M09ncGdlK2MreklxK015ZnBD?=
 =?utf-8?B?OHI2SWRMUHhqZGlBdGNvK0ovVHVZM0p4VE9aa21lTnBTM0MzM1JZS2dpOFNL?=
 =?utf-8?B?TE5Xd1ByQllYazBySnBzeS9aQXN1MUo2Sy9WUVJYSE4yRkFJbmNTSWFjOWt1?=
 =?utf-8?B?UXlDL2YrTWUxclJ2ZDE0UXJoSDh4cXhCVXpUdzhHWFpGdG9rRlZJd013Yndw?=
 =?utf-8?B?Z2hUMTRhT3NGQ1R6aFdyaEgvaEZqaW45V0NYYUpaT01WVGk3MGdVMFFIUXBh?=
 =?utf-8?B?SVpzbi8vTXQvNGd3amZjOExDMTdhbk1ERjJKN1htK2FrNmxhekxSSjNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emVUMXZSdk5wazFUZ2NUMzVjaE9MN09EeFZ2aDQ3aDRTMmpiSUx6aVRmczkz?=
 =?utf-8?B?T29uS2xTSlNwVXRaWlg5V0dZRU1UWm9xY25pcmt5NjYwMDlwcm9Cb3prVDMz?=
 =?utf-8?B?QzljemloYld3bVRid2pTbTY2QkdUSUZ2SmpqWWduMGxVbmRzNUxUU2RYbjdQ?=
 =?utf-8?B?SVJzYlptTkZBdXR3Yk5aalc0N3dNYzJ4UW5aWmRGWVZVUzQrSmFQTnFEWUdy?=
 =?utf-8?B?RFM4dHowTDFLU2JUTEpabVB5dmc2MEtpdFRIVXl1eTdMVHNSQXNJM3F0Q0Q3?=
 =?utf-8?B?ZTNJZmhPUWRZVW9aTEtDODk1ZVBKb2RGUFlTNk5oTGtpaWVocEJBZTkxK1Fj?=
 =?utf-8?B?MzRyeWlBRkRJQ2tKTHBSbnZXV3AwR09RaVVhMXlJSkZtSEtoRlpGREFyYklQ?=
 =?utf-8?B?Wit1U0pjYjBwZ1ozcUVSeThsZEJRaGpVbm9JcmpYMG40MGwvcEJXb0UyS0Jl?=
 =?utf-8?B?YTNtVkx2MVV0UkI4S2EvME9za2ZkQjZZUXU3ZkRRM0M0NDVpeVdkUHhaRURu?=
 =?utf-8?B?WXY2TWI4OU4vSzNSbUIyZ2dCNDkrZ0FkVCtnSmhobzFIQXVIZW9lbXZ3bkcw?=
 =?utf-8?B?dUNtRkdIQ0YrRzBIMlZndmtTU3RVQzZFWm41RkZ6cFBTTktkeFJ5cG93bnVx?=
 =?utf-8?B?KzN2SHVyei9lb2xKODUvanpzY0RjNkRsdVN6ZTVVbHZQN0VFcElMU0thMjlJ?=
 =?utf-8?B?RC9pQ1BTNVlTOW5NaDEyV3o1U0xpV0VLdnpnMktLcmo0RHpEMEJBRjJuWWZh?=
 =?utf-8?B?b1ZhZDRMaDM4c1pHWVE5aE5VSkJxMnhhR29tU2x5YzdFUWVnaU00ajk2NlFn?=
 =?utf-8?B?akJoN0NuNFRjMnpRZVVWMXZxTzRqWVlLUXJTZGJ1bndBUkhGVWJKQnB6RG04?=
 =?utf-8?B?d2dOQTc2LzRHUVlCY0pmS3ZxaU9aRnd6TmtrWG1CZ3VBejhkcUQ3bXBNa1pq?=
 =?utf-8?B?em1KeEJSaC92UjNrVTFlTS9xVitJQURoOVd6bXJyby9lUWQ4WFBCOEtIaUNP?=
 =?utf-8?B?am1sRlJjM3VVNkY1WWEwVHZ0cmZob3p0NThqL3p0ZWxtNExBcGJ2OUN0TCtS?=
 =?utf-8?B?RXBaWkU3S3VLQmFoZm5NblpnSzJlNGxjcmVWYU9JNGVvL1dna1YyeHV3UEdC?=
 =?utf-8?B?UjRJcDhnb3RuOFJTcG5LeUgvc25BMmc0YmQrUWJLczRFWkgxenhlaHlKTGNn?=
 =?utf-8?B?NU1obzVZU1h1Vzg5UTdoa1R5NldXaUl5ajYvZUk4M0lmRmFIcHNmK0d1QXRL?=
 =?utf-8?B?ZnBoR09QYWVNN25iRHlTd2R1TVRBQzh2enRzMVRVWmsyRHdMSUdaN3RuZGhZ?=
 =?utf-8?B?VkxkSUkvWDhPOHFCUXc2TmUxVndQM1k0ZjU0UmNodWNXWjVmZnIrZXlTaE9O?=
 =?utf-8?B?ZXFoMU1oWjJ0b2pFVVZYN2pDMVowV3UxZTFmZ3lPTEdQdG9CM3M5Rmx5NDhZ?=
 =?utf-8?B?VEJQbE4xaTNuZHNpa3d3bWZMeU05M3RseEptTmJKZFZjdXJCQ00rdC9hWFdV?=
 =?utf-8?B?N2hobWF4YlAxKzRoZEZaNzRyUmJIR1huZ0F0S3U5TUxrbGdUSHRjRmRTdHFu?=
 =?utf-8?B?SG1tUll1anVzYmlWdTZmb1QxeWszU3k1MGxYTmQxdzN2U1N1V1ZINzhiR0xn?=
 =?utf-8?B?U3dPMTJweHBiL1JkSmZUN1lIZXR4aThyZjZiNXhubmlabFlscXRYeUJ3emtC?=
 =?utf-8?B?MUttNWpFckZBTEZ1cmNJRmh6K2tzYmY2T0R2TFBYK0xuMFhVeXk0N014Vysw?=
 =?utf-8?B?U3JkV0R3cm9KQnI5WjVwVXBBTFNqdkJCbGJycFY3ekQ4L2wwNVRRTlFyUnVJ?=
 =?utf-8?B?cit4VUZNMUVsTi8xOGJURXlyOFUzalpZVDFEeWhsZ3VaREM0NzFuUTQyN3NI?=
 =?utf-8?B?TDFNYjE5QXoraXgrMDMvUWUzVFhZTG5QVThPWE1kclErVEUwbGxyVjVqU24v?=
 =?utf-8?B?TjcrUVAyUE5ycVZCWUQ4NUp3bS9pZTdVMVF2eDkxbXJmM0NFM1NiVEpPcDQ1?=
 =?utf-8?B?QjlnQkVRc1NQVnp0T2UwMXFUaFRLNG1PbFcxaFduVnI2aDBzay92L0s0eFhm?=
 =?utf-8?B?amk2cUhSUmt5YWozb1l5aENwazBXMFlUU2dKZGhIcWZEMnN0bHJQcEN6SE1Y?=
 =?utf-8?Q?QuhI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <152754977115A44F88D04467606AADFE@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2f6352-44cc-4e1a-954d-08dc76582e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 10:00:28.7084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8C7AnmekO31SqYgyh2UXqvS7Oh7TLdUYBB3f5Tl2mHt+J3qEBH/q3xVb0HzkfKGc3mSnenB1vPJIwjMm29bUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121

T24gMjAyNC81LzE3IDE3OjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDUuMjAyNCAx
MToyOCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzE3IDE2OjIwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNS4yMDI0IDEwOjA4LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNS8xNiAyMTowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Ni4wNS4yMDI0IDExOjUyLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAgc3RydWN0IHBoeXNk
ZXZfcGNpX2RldmljZSB7DQo+Pj4+Pj4gICAgICAvKiBJTiAqLw0KPj4+Pj4+ICAgICAgdWludDE2
X3Qgc2VnOw0KPj4+Pj4NCj4+Pj4+IElzIHJlLXVzaW5nIHRoaXMgc3RydWN0IGZvciB0aGlzIG5l
dyBzdWItb3Agc3VmZmljaWVudD8gSU9XIGFyZSBhbGwNCj4+Pj4+IHBvc3NpYmxlIHJlc2V0cyBl
cXVhbCwgYW5kIGhlbmNlIGl0IGRvZXNuJ3QgbmVlZCBzcGVjaWZ5aW5nIHdoYXQga2luZCBvZg0K
Pj4+Pj4gcmVzZXQgd2FzIGRvbmU/IEZvciBleGFtcGxlLCBvdGhlciB0aGFuIEZMUiBtb3N0IHJl
c2V0IHZhcmlhbnRzIHJlc2V0IGFsbA0KPj4+Pj4gZnVuY3Rpb25zIGluIG9uZSBnbyBhaXVpLiBJ
bW8gdGhhdCB3b3VsZCBiZXR0ZXIgcmVxdWlyZSBvbmx5IGEgc2luZ2xlDQo+Pj4+PiBoeXBlcmNh
bGwsIGp1c3QgdG8gYXZvaWQgcG9zc2libGUgY29uZnVzaW9uLiBJdCBhbHNvIHJlYWRzIGFzIGlm
IEZMUiB3b3VsZA0KPj4+Pj4gbm90IHJlc2V0IGFzIG1hbnkgcmVnaXN0ZXJzIGFzIG90aGVyIHJl
c2V0IHZhcmlhbnRzIHdvdWxkLg0KPj4+PiBJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IHRoYXQg
eW91IG1lYW4gaW4gdGhpcyBoeXBlcmNhbGwgaXQgbmVlZHMgdG8gc3VwcG9ydCByZXNldHRpbmcg
Ym90aCBvbmUgZnVuY3Rpb24gYW5kIGFsbCBmdW5jdGlvbnMgb2YgYSBzbG90KGRldik/DQo+Pj4+
IEJ1dCBpdCBjYW4gYmUgZG9uZSBmb3IgY2FsbGVyIHRvIHVzZSBhIGN5Y2xlIHRvIGNhbGwgdGhp
cyByZXNldCBoeXBlcmNhbGwgZm9yIGVhY2ggc2xvdCBmdW5jdGlvbi4NCj4+Pg0KPj4+IEl0IGNv
dWxkLCB5ZXMsIGJ1dCBzaW5jZSAoYWl1aSkgdGhlcmUgbmVlZHMgdG8gYmUgYW4gaW5kaWNhdGlv
biBvZiB0aGUNCj4+PiBraW5kIG9mIHJlc2V0IGFueXdheSwgd2UgY2FuIGFzIHdlbGwgYXZvaWQg
cmVseWluZyBvbiB0aGUgY2FsbGVyIGRvaW5nDQo+Pj4gc28gKGFuZCBhdCB0aGUgc2FtZSB0aW1l
IHNpbXBsaWZ5IHdoYXQgdGhlIGNhbGxlciBuZWVkcyB0byBkbykuDQo+PiBTaW5jZSB0aGUgY29y
cmVzcG9uZGluZyBrZXJuZWwgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIGludG8gbGludXhfbmV4dCBi
cmFuY2gNCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9oPW5leHQtMjAyNDA1MTUmaWQ9YjI3MjcyMjUx
MWQ1ZThhZTU4MGYwMTgzMDY4N2I4YTZiMjcxN2YwMSwNCj4+IGlmIGl0J3Mgbm90IHZlcnkgbWFu
ZGF0b3J5IGFuZCBuZWNlc3NhcnksIGp1c3QgbGV0IHRoZSBjYWxsZXIgaGFuZGxlIGl0IHRlbXBv
cmFyaWx5Lg0KPiANCj4gQXMgYWxzbyBtZW50aW9uZWQgZm9yIHRoZSBvdGhlciBwYXRjaCBoYXZp
bmcgYSBjb3JyZXNwb25kaW5nIGtlcm5lbCBvbmU6DQo+IFRoZSBrZXJuZWwgcGF0Y2ggd291bGQg
aW1vIGJldHRlciBub3QgYmUgbWVyZ2VkIHVudGlsIHRoZSBuZXcgc3ViLW9wIGlzDQo+IGFjdHVh
bGx5IGZpbmFsaXplZC4NCk9LLCB3aGF0IHNob3VsZCBJIGRvIG5leHQgc3RlcD8NClVwc3RyZWFt
IGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoZSBtZXJnZWQgcGF0Y2ggb24ga2VybmVsIHNpZGU/DQoNCj4g
DQo+PiBPciBpdCBjYW4gYWRkIGEgbmV3IGh5cGVyY2FsbCB0byByZXNldCBhbGwgZnVuY3Rpb25z
IGluIG9uZSBnbyBpbiBmdXR1cmUgcG90ZW50aWFsIHJlcXVpcmVtZW50LCBsaWtlIFBIWVNERVZP
UF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0X2FsbF9mdW5jLg0KPiANCj4gSSBkaXNhZ3JlZS4gV2Ug
c2hvdWxkbid0IGludHJvZHVjZSBpbmNvbXBsZXRlIHN1Yi1vcHMuIEF0IHRoZSB2ZXJ5IGxlYXN0
LA0KPiBpZiB5b3Ugd2FudCB0byBzdGljayB0byB0aGUgcHJlc2VudCBmb3JtLCBJJ2QgZXhwZWN0
IHlvdSB0byBzdXBwbHkgcmVhc29ucw0KPiB3aHkgZGlzdGluZ3Vpc2hpbmcgZGlmZmVyZW50IHJl
c2V0IGZvcm1zIGlzIG5vdCBuZWNlc3NhcnkgKG5vdyBvciBsYXRlcikuDQpPSywgaWYgd2FudCB0
byBkaXN0aW5ndWlzaCBkaWZmZXJlbnQgcmVzZXQsIGlzIGl0IGFjY2VwdGFibGUgdG8gYWRkIGEg
cGFyYW1ldGVyLCBsaWtlICJ1OCBmbGFnIiwgYW5kIHJlc2V0IGV2ZXJ5IGZ1bmN0aW9uIGlmIGNv
cnJlc3BvbmRpbmcgYml0IGlzIDE/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywN
CkppcWlhbiBDaGVuLg0K

