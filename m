Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9DEA282F1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 04:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881933.1292102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfWJE-0001uF-8X; Wed, 05 Feb 2025 03:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881933.1292102; Wed, 05 Feb 2025 03:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfWJE-0001tW-42; Wed, 05 Feb 2025 03:42:40 +0000
Received: by outflank-mailman (input) for mailman id 881933;
 Wed, 05 Feb 2025 03:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBCp=U4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfWJB-0001tO-WF
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 03:42:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2418::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b980ea5-e373-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 04:42:34 +0100 (CET)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 03:42:30 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 03:42:30 +0000
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
X-Inumbo-ID: 3b980ea5-e373-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJaz2cevrBAo90y6foNNhOv6rU73gWMprC/r0fQ1tJm0CYP3tuudvybup+vbwe9dlhQXA/yKJXt1Ng08RRbdju6j+DnWTNRtph2+BB9Xx8gh0cElPZVnXYCk0KeQeuPfkOSWqEQOj2bkCDExadO3rNYGkLB1ou0dnWrMfJbvg0vdKyRU6Jkzg8yF6M3XRXa9ew2VJtTJFwBOMhXAYkLubkTPnGvvhLsuB7HPAp1HU6oX4hKbcwlfid4APFOO9MOJQdz80z8PKbzGYhVclu6qjCYiDnqOLO10Lg+5WoN7A0IFAkhnzX887Zg5suk1j8JTPAEsBXPsecDwr6JxdDuWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+1+HOf2uYFfSfnEp4TE5/DxO8t122URboUMDoWE7rI=;
 b=lDDnTZcSl4nez2DKC9TnV5a7lrdqAiV9y2r1tF8kjBVbjvLsQVlZEr+pXCnpgh1ahUBYE/64rtevwSDvDGcQTLw43hh8OtyrLgoroNbPIsj7zeKH9o3BN2bdGom0ZVxURB951qcdIvpe5LHB/FQyJkzrENfd6mrMMvVW4c7h6bgs7F7jkG80qrWKktpNymZ7CaqZn6Fk+uF4OUM3k2/a8kSAZCc9y928Rr6pYxIj6oTwYhaz3rOcJ5aop7VSk9nHXN0InUCeL5USkXEAOJSsbjI4/8Y3tn/ZCWAOrG9nFYCk3tASKoLUfGiBPsKBpAqdD5DSjmEgc3jqOTVIJK8xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+1+HOf2uYFfSfnEp4TE5/DxO8t122URboUMDoWE7rI=;
 b=4ZXL1mSUxoM09yHB3136Dt8zBCcY6PfwdMEP5LF48jaoEQC3xvYwv5X4hGvKhkqe16z9n1UFM9xs1YitpfTaol4zqEj707yir7hJelwM/elsUKWjyIQNGzFNIRMP5UxI5rwDhycMYuKMIWKE94M/k70Wad/rKxf2xxnNrERUCYA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Thread-Topic: [PATCH v6] vpci: Add resizable bar support
Thread-Index: AQHbbUoyUzXRgWLOOkOHv+F73OEjK7MqsrQAgAAFzwCAAAMXgIAABJWAgA3j+oA=
Date: Wed, 5 Feb 2025 03:42:30 +0000
Message-ID:
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
In-Reply-To: <Z5ehh9IK3W8fLXIl@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8398.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|DM6PR12MB4401:EE_
x-ms-office365-filtering-correlation-id: 83589ad7-c9d9-45aa-2225-08dd45971e33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U093cHJKdWUwem1yaEVGeTF4SWx3bFdFNFBwSElVeTVVTjZ4V2ZYOU1mVE1o?=
 =?utf-8?B?R09wUVdoNWNsWmlEMmtGZTNBMGdUNCtpUC8yOC9UVVEvR3AxdU5zNWJqQ2lu?=
 =?utf-8?B?K1RuRlBrMkRTOVB3SWxhL25iWGZ3WXo2NCtMK3k0RXJ4aENqTjNOV2hjbXJP?=
 =?utf-8?B?ZkptY0NVazJCMUxzT2c2SGphL1g5K0paeUtIYlQvODRiR1RzSmNTWER1cVhO?=
 =?utf-8?B?dHliN2ZPYVIrdTM2MlZUZzhtUHYrVkhlRXlyZUtYa3VhUFM1TndFMUlmWlI2?=
 =?utf-8?B?ZDNvZVJoMmVpOC9paUljN3VQUWY2QjUxR2VjYkNhQWVGSlZUSUg5STdnUkFH?=
 =?utf-8?B?WDB3YjBWenFlSDRNU1BQa0xtNGt0UWlnM3Rwc0Zvam9CVHVWazQ4UE51SmRi?=
 =?utf-8?B?VmpYMm1rRUtMMFpYNjV4V0c5WGgrbTAvWlR2RUkwMEtsUkR2UTdNcjVDNkww?=
 =?utf-8?B?cnpCUTdVNllCVFhLU2p3eUFlNWJ6Wk4xWHliNzN5OUIyZVN0VTlNM09KM3ZR?=
 =?utf-8?B?UjBSNkNVWFBWbEQ1MlRkdGJMQUR3QVJBeko2QWZvSytHcU1MVlByNE42clhy?=
 =?utf-8?B?Rm5mL2RrKzMvVEdPbXQvL3ZSOTdveWlSSEgyWkpwQ1lOMHE1MDhCMWtyK0Jp?=
 =?utf-8?B?WkRocmVKM3QrRTQreTBiZUUrdWtaT0hmb1J1aFo2RGFBRXEwSDFwQ0JpQkdH?=
 =?utf-8?B?cnpDcVBmVEthWStZRmhwK0ZjeVVKVGRybFVsS1ZDMjdvSlozL2dqR1BFWSth?=
 =?utf-8?B?OUkwMTVtSDQ2dmh5azc4RnVPQXAzZUFleTFPOE5mVHRQYjBOa2phckZlNkNM?=
 =?utf-8?B?R1lMVmZaNlhHdEovY0hlOURhTTJsN0xldXZtemVzR1BIR0o5b3Iwc2hXRmNQ?=
 =?utf-8?B?d0h0ejlRdFlXWmJkZmlWeEp4SElCeHRwTU81SDBwT04xRUJTNVFhVFNacmRn?=
 =?utf-8?B?YlRaVUV1VFFtZTBWYnZDVEQ0S3BoSG1QaDluZDUxaHBEa1N1MmthS2hKQUJt?=
 =?utf-8?B?czZTUzFub3lsMkVKb3NtbVdRdEI1dDRESmh5aWcvYnFnemdsaTZ4N2RDK3Zl?=
 =?utf-8?B?Ukh0NDhCdzIwa3VJeG9OUFhIUHorVHg5eUFrek8vQW9iNk9xNGVMZ2o0VGdF?=
 =?utf-8?B?dEJlZDhha2VsaFpNdWZuaE8ybTJGakdBWVVKcEozeHhFalNvNWFzMlBjc2Rl?=
 =?utf-8?B?K0dFQUdGRGlJRm5JVmxLYjdsMUlYcTYzdDZQUjFheUJkcithVDd4ZWUwSWJE?=
 =?utf-8?B?Uk91alF5NkF2OTR0bndWRnBqOWhIUWZNU3V6Z05Va0kveVBrL1hGR1JTUnAv?=
 =?utf-8?B?K29HUk54amZ0ajIyRlpRWEZRdzRTRk4xR2YrYmJyVXc3NElyaDhqWkt1VXVU?=
 =?utf-8?B?U0lsdGhmMkgxc0VCYzBRbmxYazZVeklRRXM4T2lEWkhENzF3Mm8veGFVSFkx?=
 =?utf-8?B?bFFxWnBxNVpkcnVINWVDZWdyZG8xbzZTYll6M09FdTdRM09qZXkyOWk0TTRM?=
 =?utf-8?B?dFhoZnhDT1orVlJmeCtSd3ZCK3RYZ1pKNjdqaXY2bmw3ZktkeHVjUnEvdEd1?=
 =?utf-8?B?V0FGMTJ3cDRVYnIzdkkrTXhuMWxRaUJ2TC8ycEtGNm5uaW4wWVFEaEhvcGlw?=
 =?utf-8?B?OXZaWDl6UGptOUYvVGY5b1ZzODlXUlIvWnhmeTZGNHVtZ3JCR0J2RU5zZk9P?=
 =?utf-8?B?dGpxS0dRYVpiZi9iSXdZRmR0SjRwVUFwQlBsUnVPRkxyUEdlakgrU0NSakRQ?=
 =?utf-8?B?b1NhS0dNWDB2cEROcVRLenQxT3dtaEtOdUpjWU5KNVJSdjF1OWVCV3JBclJL?=
 =?utf-8?B?NFQ4VGEyVjJaU3Q2VW4yZWNNamFiRmN1N3NtYmgwcEtSREEyMitGdWJvTGp6?=
 =?utf-8?B?c0d0MGo5U3Q0Y2FRSEN5YXIyY3F2WFNveituR0NwVWcyaklvdG55YzFDaUQ3?=
 =?utf-8?Q?zRG0bDlemD3vNqINiCpBfqm1vt6wIrXX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3J3MERLS0ZzaUFpZnBYQkNRVXlNSWt6djVQRWZtVjNMQ1o1YnRIQ2cvMHk5?=
 =?utf-8?B?cDFOaUFqc0FybTVueXREbk8zNkFkaE5jeEx1SVBLZXF1ckF3U0lrM1NzajVN?=
 =?utf-8?B?MmhvQnJodG9kZkFzODVFZW9GRFJadUFrWTlQMVlMNXI5RmJtOG5EVmJOVVNF?=
 =?utf-8?B?R0RONUdqMnFBOEIweHNuSGcwUjVQdGMvZ1huVDBqMlRjR1RVdjF0aXJHRktO?=
 =?utf-8?B?ZldKcWpjOFF0NlAxMDZaaGY0VjJaSGNQREs3ZTJqNnA4a0RFWG4raUtla3U1?=
 =?utf-8?B?YTQ1d01seFUyQVZVVjZURmNXUjJRcU9ydTRnQ1BOQjVQMWEzdmg0UVY3RURl?=
 =?utf-8?B?Q2EwVzR1ejZLZk5vYWhhY0g3VnQ2V2xHU0paNGxsQUxkZ0xRdmVxZTduVzEr?=
 =?utf-8?B?YlFjdzNDb2QrbjI5THFrSGRjYnRPSlUrSWJtdmFIbHFjSHpNcjhUdlFNcUto?=
 =?utf-8?B?eGdmU1lLWmtkUGw2d21YbE9DMzNSS1ZlUGRTaXdXQ1BwVEk2d0pNb0FXUE43?=
 =?utf-8?B?d0RwbW4vai9IaUxOTUNmYVIrWkI1L1VOc2tXZ2JMUnY5MnZBbGJJRjNxbzhX?=
 =?utf-8?B?MjV4U1FWRFViRk9KVEcwWE80bnMvZEZOSGpqaHdIRFdnUzRXT0t1SVdNYkQy?=
 =?utf-8?B?TWJNekE1UTBWUmtrOUp1d29UakhzREdKeWgwcmlGR1lxcmkwUXdqRUxiMXdj?=
 =?utf-8?B?NWVHTThVUnVpT1hvQ3RoRWlUUTJydW1pa254aTdzRm0xajFpSHUwR21NbWdG?=
 =?utf-8?B?d1dEWGNSdzNXQWRPcGJXbGxUa3dCMDNlcmd6c0hyTmFHZ3dobVZlVkhOTERs?=
 =?utf-8?B?QTRlM1ZFcEpFZERwWUt0SXNCU0VlT0pXY2ZReHNRaDFEZzMrSWpsbW16ZDdH?=
 =?utf-8?B?Tm9CdUdESGhlWTZXaTdUWjF3Z0pTdEhqdkM4ek5seWo2d0w1NnU0bGtFUHVF?=
 =?utf-8?B?TjRYVFpST21OZ3FlL0trcCsyT3Zub1E2eU5xY3lyM1N1WFQ3ZGt0RDZCckd5?=
 =?utf-8?B?YlpQaC9hcHNsR2dtSUhOaytNUmhpejk3a05WS3k2a1pKaUFXUk9LK0N5QnNN?=
 =?utf-8?B?V0xwa0crRjE5OWMxV2RGK3V2QnE1MGpyeHhROG0zY09seDFpTkk1SmdGWUhZ?=
 =?utf-8?B?ZHVwQWZnNmF2WXNWKzhZbW9XY3kvY21zZmVCSThxOXpCRU9QS3ZiSTBrQWI0?=
 =?utf-8?B?MjVpV1p3RTR4aWQvaWEzZ0kxeHdGMkpKOTlNTzdPcGRHWXowTzlLWUNUeDg4?=
 =?utf-8?B?bWJ2MTB6eTE2WFNuREgvakhhZTAvMGIvcFhDTnY1YWZJL0RqR3FqV2dJUzRP?=
 =?utf-8?B?V1cvUXhUeW9IVXJBektDR2JXcTd2Rjh6SzNuNEVrMVpXcHBIQXVmeklEaGNr?=
 =?utf-8?B?ZXp4T0lYczhjZGhZclJxY1JPQnFnWXR6cTBOek9JajlZZmFXODdGdGZ0NVBt?=
 =?utf-8?B?ekp4a1NOKzJvbU15M0hGak5MUlh6eXFiNkQzVEpaRUtENTlsZ3Y3SnNLRmps?=
 =?utf-8?B?cVdNdFpMcmlPd2xWbTBtMGR1bjhVb2h2MWxlMm5GazYzWHJoaG1YQkZobFRU?=
 =?utf-8?B?S1lieFNlNmR1VXJrbDNNODZqMDZCOUd4V3M2UzdZbTduWGFGM2djelZsSFVz?=
 =?utf-8?B?NjJ0d2ZRQUt5WFAyLytKQkErMWdpd3FKTUFWMTZkZWdqQXNXRXpxelRhMEl2?=
 =?utf-8?B?U2d5MkM4LzViekIxYzlPZ0pKUXVncUpkV3dDOTFPNVg5YlFMdzk4RTlacWp0?=
 =?utf-8?B?SUYwYnk2SmhrbEx1cHJaK3NWS2JzTEdZZWc0VndDOWFSQmlPRzhxUGxVT2Zh?=
 =?utf-8?B?V2hkdmN2SlNkd3lYdzc1RWd0U3M5L2NCWDUxRHp5Q0xnS0FYYngxQmJZajdF?=
 =?utf-8?B?YVJ6enRndjRURS9SK0xPeG5XZHZwUDYvK0NWc1d2bmNTaDRUc29HTHN6M3da?=
 =?utf-8?B?VHJsdUNHUjFocGY4WHZ0TlhNY3B1MkRKR2NwUjZBRUxlVHRwYTZ6bCtFdW1S?=
 =?utf-8?B?WWhvOHFIZlVXdDhoTXFlbDMxME1uMHhzam5CTkVESW5jR054T25xbVNqSlFz?=
 =?utf-8?B?bjE0cnBIR3k2RkRiWnVvQ3NVZ2hxbVRSVXNhcGZ6RkRVdzVwcThZdThwdEE1?=
 =?utf-8?Q?aQM8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33E5DF77144D2644AE545DE224F1D372@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83589ad7-c9d9-45aa-2225-08dd45971e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 03:42:30.5026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ou5vsqPISRKIoTJuMBQHelAAEF4deDKs0XOUAcch9x1NK1Z71Wq0x9zN+WMbOEGX18yIk/IcGddf2dbXE9vRUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401

T24gMjAyNS8xLzI3IDIzOjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIEph
biAyNywgMjAyNSBhdCAwMzo1MjozMVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDI3LjAxLjIwMjUgMTU6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBK
YW4gMjcsIDIwMjUgYXQgMDM6MjA6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
IE9uIDIzLjAxLjIwMjUgMDQ6NTAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4gdjUtPnY2IGNo
YW5nZXM6DQo+Pj4+PiAqIENoYW5nZWQgIjFVTCIgdG8gIjFVTEwiIGluIFBDSV9SRUJBUl9DVFJM
X1NJWkUgaWRlZmluaXRpb24gZm9yIDMyIGJpdCBhcmNoaXRlY3R1cmUuDQo+Pj4+PiAqIEluIHJl
YmFyX2N0cmxfd3JpdGUgdXNlZCAiYmFyIC0gcGRldi0+dnBjaS0+aGVhZGVyLmJhcnMiIHRvIGdl
dCBpbmRleCBpbnN0ZWFkIG9mIHJlYWRpbmcNCj4+Pj4+ICAgZnJvbSByZWdpc3Rlci4NCj4+Pj4+
ICogQWRkZWQgdGhlIGluZGV4IG9mIEJBUiB0byBlcnJvciBtZXNzYWdlcy4NCj4+Pj4+ICogQ2hh
bmdlZCB0byAiY29udGludWUiIGluc3RlYWQgb2YgInJldHVybiBhbiBlcnJvciIgd2hlbiB2cGNp
X2FkZF9yZWdpc3RlciBmYWlsZWQuDQo+Pj4+DQo+Pj4+IEknbSBub3QgY29udmluY2VkIHRoaXMg
d2FzIGEgZ29vZCBjaGFuZ2UgdG8gbWFrZS4gV2hpbGUgLi4uDQo+Pj4+DQo+Pj4+PiArc3RhdGlj
IGludCBjZl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4gK3sN
Cj4+Pj4+ICsgICAgdWludDMyX3QgY3RybDsNCj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IG5iYXJz
Ow0KPj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgcmViYXJfb2Zmc2V0ID0gcGNpX2ZpbmRfZXh0X2Nh
cGFiaWxpdHkocGRldi0+c2JkZiwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9FWFRfQ0FQX0lEX1JFQkFSKTsNCj4+Pj4+
ICsNCj4+Pj4+ICsgICAgaWYgKCAhcmViYXJfb2Zmc2V0ICkNCj4+Pj4+ICsgICAgICAgIHJldHVy
biAwOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4ocGRldi0+
ZG9tYWluKSApDQo+Pj4+PiArICAgIHsNCj4+Pj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJS
ICIlcHA6IHJlc2l6YWJsZSBCQVJzIHVuc3VwcG9ydGVkIGZvciB1bnByaXYgJXBkXG4iLA0KPj4+
Pj4gKyAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBwZGV2LT5kb21haW4pOw0KPj4+Pj4gKyAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiAr
ICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmViYXJfb2Zmc2V0ICsgUENJ
X1JFQkFSX0NUUkwoMCkpOw0KPj4+Pj4gKyAgICBuYmFycyA9IE1BU0tfRVhUUihjdHJsLCBQQ0lf
UkVCQVJfQ1RSTF9OQkFSX01BU0spOw0KPj4+Pj4gKyAgICBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9
IDA7IGkgPCBuYmFyczsgaSsrICkNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAgICAgICAgaW50IHJj
Ow0KPj4+Pj4gKyAgICAgICAgc3RydWN0IHZwY2lfYmFyICpiYXI7DQo+Pj4+PiArICAgICAgICB1
bnNpZ25lZCBpbnQgaW5kZXg7DQo+Pj4+PiArDQo+Pj4+PiArICAgICAgICBjdHJsID0gcGNpX2Nv
bmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlYmFyX29mZnNldCArIFBDSV9SRUJBUl9DVFJMKGkpKTsN
Cj4+Pj4+ICsgICAgICAgIGluZGV4ID0gY3RybCAmIFBDSV9SRUJBUl9DVFJMX0JBUl9JRFg7DQo+
Pj4+PiArICAgICAgICBpZiAoIGluZGV4ID49IFBDSV9IRUFERVJfTk9STUFMX05SX0JBUlMgKQ0K
Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIl
cGQgJXBwOiB0b28gYmlnIEJBUiBudW1iZXIgJXUgaW4gUkVCQVJfQ1RSTFxuIiwNCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgaW5kZXgpOw0KPj4+
Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4gKw0KPj4+
Pj4gKyAgICAgICAgYmFyID0gJnBkZXYtPnZwY2ktPmhlYWRlci5iYXJzW2luZGV4XTsNCj4+Pj4+
ICsgICAgICAgIGlmICggYmFyLT50eXBlICE9IFZQQ0lfQkFSX01FTTY0X0xPICYmIGJhci0+dHlw
ZSAhPSBWUENJX0JBUl9NRU0zMiApDQo+Pj4+PiArICAgICAgICB7DQo+Pj4+PiArICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6IEJBUiV1IGlzIG5vdCBpbiBtZW1vcnkgc3Bh
Y2VcbiIsDQo+Pj4+PiArICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNi
ZGYsIGluZGV4KTsNCj4+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4+ICsgICAgICAg
IH0NCj4+Pj4NCj4+Pj4gLi4uIGZvciB0aGVzZSB0d28gY2FzZXMgd2UgY2FuIHBlcm1pdCBEb20w
IGRpcmVjdCBhY2Nlc3MgYmVjYXVzZSB0aGUgQkFSDQo+Pj4+IGlzbid0IGdvaW5nIHRvIHdvcmsg
YW55d2F5IChhcyBmYXIgYXMgd2UgY2FuIHRlbGwpLCAuLi4NCj4+Pj4NCj4+Pj4+ICsgICAgICAg
IHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMzJ2cGNpX2h3
X3JlYWQzMiwgdnBjaV9od193cml0ZTMyLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ0FQKGkpLCA0LCBOVUxMKTsNCj4+Pj4+
ICsgICAgICAgIGlmICggcmMgKQ0KPj4+Pj4gKyAgICAgICAgew0KPj4+Pj4gKyAgICAgICAgICAg
IC8qDQo+Pj4+PiArICAgICAgICAgICAgICogVE9ETzogZm9yIGZhaWxlZCBwYXRoZXMsIG5lZWQg
dG8gaGlkZSBSZUJhciBjYXBhYmlsaXR5DQo+Pj4+PiArICAgICAgICAgICAgICogZnJvbSBoYXJk
d2FyZSBkb21haW4gaW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZXJyb3IuDQo+Pj4+PiArICAgICAg
ICAgICAgICovDQo+Pj4+PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6
IEJBUiV1IGZhaWwgdG8gYWRkIHJlZyBvZiBSRUJBUl9DQVAgcmM9JWRcbiIsDQo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIGluZGV4LCByYyk7DQo+
Pj4+PiArICAgICAgICAgICAgY29udGludWU7DQo+Pj4+PiArICAgICAgICB9DQo+Pj4+PiArDQo+
Pj4+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdf
cmVhZDMyLCByZWJhcl9jdHJsX3dyaXRlLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSwgNCwgYmFyKTsNCj4+Pj4+
ICsgICAgICAgIGlmICggcmMgKQ0KPj4+Pj4gKyAgICAgICAgew0KPj4+Pj4gKyAgICAgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBmYWlsIHRvIGFkZCByZWcgb2YgUkVC
QVJfQ1RSTCByYz0lZFxuIiwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWlu
LCAmcGRldi0+c2JkZiwgaW5kZXgsIHJjKTsNCj4+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsN
Cj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4NCj4+Pj4gLi4uIGluIHRoZXNlIHR3byBjYXNlcyB3ZSBo
YWQgYW4gaXNzdWUgaW50ZXJuYWxseSwgYW5kIHdvdWxkIGhlbmNlIHdyb25nbHkNCj4+Pj4gYWxs
b3cgRG9tMCBkaXJlY3QgYWNjZXNzIChhbmQgaW4gY2FzZSBpdCdzIHRoZSAybmQgb25lIHRoYXQg
ZmFpbGVkLCBpbiBmYWN0DQo+Pj4+IG9ubHkgcGFydGlhbGx5IGRpcmVjdCBhY2Nlc3MsIHdpdGgg
d2hvIGtub3dzIHdoYXQgcmVzdWx0aW5nIGluY29uc2lzdGVuY2llcykuDQo+Pj4+DQo+Pj4+IE9u
bHkgd2l0aCB0aGlzIHBhcnRpY3VsYXIgY2hhbmdlIHVuZG9uZToNCj4+PiBSPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+Pg0KPj4+PiBPdGhlcndpc2Ug
eW91IGFuZCBSb2dlciAod2hvIG5lZWRzIHRvIGF0IGxlYXN0IGFjayB0aGUgY2hhbmdlIGFueXdh
eSkgd2lsbA0KPj4+PiBuZWVkIHRvIHNvcnQgdGhhdCBvdXQsIHdpdGggbWUgbWVyZWx5IHdhdGNo
aW5nLg0KPj4+DQo+Pj4gSWRlYWxseSBlcnJvcnMgaGVyZSBzaG91bGQgYmUgZGVhbHQgd2l0aCBi
eSBtYXNraW5nIHRoZSBjYXBhYmlsaXR5Lg0KPj4+IEhvd2V2ZXIgWGVuIGRvZXNuJ3QgeWV0IGhh
dmUgdGhhdCBzdXBwb3J0LiAgVGhlIHVzYWdlIG9mIGNvbnRpbnVlIGlzDQo+Pj4gdG8gbWVyZWx5
IGF0dGVtcHQgdG8ga2VlcCBhbnkgcG9zc2libGUgc2V0dXAgaG9va3Mgd29ya2luZyAoaGVhZGVy
LA0KPj4+IE1TSSwgTVNJLVgpLiBSZXR1cm5pbmcgZmFpbHVyZSBmcm9tIGluaXRfcmViYXIoKSB3
aWxsIGNhdXNlIGFsbA0KPj4+IHZQQ0kgaG9va3MgdG8gYmUgcmVtb3ZlZCwgYW5kIHRodXMgdGhl
IGhhcmR3YXJlIGRvbWFpbiB0byBoYXZlDQo+Pj4gdW5tZWRpYXRlZCBhY2Nlc3MgdG8gdGhlIGRl
dmljZSwgd2hpY2ggaXMgbGlrZWx5IHdvcnNlIHRoYW4ganVzdA0KPj4+IGNvbnRpbnVpbmcgaGVy
ZS4NCj4+DQo+PiBIbW0sIHRydWUuIE1heWJlIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUgY2Fz
ZSB3aGVyZSB0aGUgZmlyc3QgcmVnDQo+PiByZWdpc3RyYXRpb24gd29ya3MsIGJ1dCB0aGUgMm5k
IGZhaWxzLiBTaW5jZSBDVFJMIGlzIHdyaXRhYmxlIGJ1dA0KPj4gQ0FQIGlzIHIvbyAoYW5kIGRh
dGEgdGhlcmUgaXMgc2ltcGx5IGJlaW5nIGhhbmRlZCB0aHJvdWdoKSBJIHdvbmRlcg0KPj4gd2hl
dGhlciB3ZSBuZWVkIHRvIGludGVyY2VwdCBDQVAgYXQgYWxsLCBhbmQgaWYgd2UgZG8sIHdoZXRo
ZXIgd2UNCj4+IHdvdWxkbid0IGJldHRlciB0cnkgdG8gcmVnaXN0ZXIgQ1RSTCBmaXJzdC4NCj4g
DQo+IEluZGVlZCwgSmlxaWFuIGlzIHRoYXQgYSBsZWZ0b3ZlciBmcm9tIGEgcHJldmlvdXMgdmVy
c2lvbiB3aGVuIHdyaXRlcw0KPiB0byBDQVAgd2hlcmUgaWdub3JlZCBmb3IgYmVpbmcgYSByZWFk
LW9ubHkgcmVnaXN0ZXI/DQpTb3JyeSB0byByZXBseSBsYXRlLCBJIGp1c3QgY2FtZSBiYWNrIGZy
b20gYW4gYW5udWFsIGxlYXZlLg0KRGlkIHlvdSBtZWFuOiB3aHkgSSBhZGRlZCBoYW5kbGVyIHZw
Y2lfaHdfd3JpdGUzMiBmb3IgQ0FQPw0KSWYgc28sIHRoaXMgaXMgYSBjaGFuZ2Ugc2luY2UgVjIs
IHRoYXQgeW91IHN1Z2dlc3RlZCB0byBhZGQgaXQgYmVjYXVzZSB0aGVyZSBpcyBubyB3cml0ZSBs
aW1pdGF0aW9uIGZvciBkb20wLg0KDQo+IA0KPiBUaGUgY3VycmVudCBhZGRpbmcgb2YgYSBoYW5k
bGVyIHdpdGggdnBjaV9od197cmVhZCx3cml0ZX0zMigpIHJlc3VsdA0KPiBpbiB0aGUgZXhhY3Qg
c2FtZSBiZWhhdmlvciBmb3IgYSBoYXJkd2FyZSBkb21haW4sIHdoaWNoIGlzIHRoZSBvbmx5DQo+
IGRvbWFpbiB3aGVyZSBSZUJBUiB3aWxsIGJlIGV4cG9zZWQuDQo+IA0KPiBUaGFua3MsIFJvZ2Vy
Lg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

