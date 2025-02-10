Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF33A2EB0E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884769.1294517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRxX-00030p-3Q; Mon, 10 Feb 2025 11:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884769.1294517; Mon, 10 Feb 2025 11:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRxX-0002xh-0o; Mon, 10 Feb 2025 11:28:15 +0000
Received: by outflank-mailman (input) for mailman id 884769;
 Mon, 10 Feb 2025 11:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thRxV-0002xW-6Q
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:28:13 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c588613-e7a2-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:28:12 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7665.eurprd03.prod.outlook.com
 (2603:10a6:102:200::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Mon, 10 Feb
 2025 11:28:09 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 11:28:09 +0000
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
X-Inumbo-ID: 1c588613-e7a2-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQgWVqcxKlG6iJ5962Qs9Mffg5dId9N+2H1oZta5WC0yQxi9vFC9unmJL9zcElHeCW0k3XteyHAvCdKw4FHYDqLwMZ+PXleCeFJq/vXJtu7jYIQR4AVRbRJ5sZqv4Qt5JaLN1wCylkBTWsoPSzVp6srRuUnsxWyh4mXo9d0YJGf4TLmG4kgYqVVkIi9dLA3ng5SKFZ17BO4GOO8armV2DIhP1U66PhRVOS6s8jyAEiMkGHktsfObhDhqoDsy9vww/+AHriObk0p20mNtGOoV5RcMP4DoQcyKYs9yGcGK+RhYlNv8mtL2RW5hKCnV7KzojKOax1vIzJyTIGjfvX4UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D15s4DLiCejc2myi4G4QxxlccMQq5M4BZnMlsG/0ibE=;
 b=F/WJ//NSTo9bKkbUN4MJMFlXD0tikLbRTy2pztgISPigApzww6ZEjcY802q8irWWc9gDK90ZDC4hUFNo0S35Z7uEzNJTupBNvz8obTbg1F2oxXgeWfhPBZgV9A3Kn7dFkZhK0mTCtTpXEj6isUOvu6zO6tQgp+bVQ1EKAnLkG7HGN1+p397ZjqxEDNJUZReWt27Matfggb0fLNt9PTH9SgBOy81VhY/0H6ULC5z+jZT5coWGQ4pK8/aVVcnWhhobMUsvbWV4wFp4LQDarJtHgwB9ic7sjQyMa3FyhMPMPdC1FzeLqvfwxecU1b8G1n6WkQJBbtZidcsDvLeDbaiqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D15s4DLiCejc2myi4G4QxxlccMQq5M4BZnMlsG/0ibE=;
 b=leE5msNJp6wyxeZcJIVBORgxKNcknOmDp9sHszGknp1UWQLRYoo/2hnVMWV/s0IqrmbsY6D1/yvq2zBNvwRr2JRQy0T/YcnW+8ZfI8zxOB4P4FtJU0/DKPvnQp23pE4m4DsHiuEVYSxcEGdL2WQzBaQe1zNVgqKAlxSvC+/TJGoBU8GZvDm1yRmIv/GRyE7KKDi2nh5pVuizWDVRxXGk9UrwUyRDli7fLz/xZqKFibTeT9IluN66VILPoMh4za1WQx4vTFlax1agdzARlKmMn9js3fJZFiIHJbNMJMezU21Ee5giGsPORXdw6qV0TZ6sHiAQEXrLu5Saa4HqVL+IBQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbe6bYLRtr9CeUhUS7u7CeNu5b3bNAXZuAgAAIzgA=
Date: Mon, 10 Feb 2025 11:28:09 +0000
Message-ID: <5aa33643-2afd-46db-8855-1023482a4f60@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <9950eff2f8344c5d658def7d2c6d7fc010607498.1739182214.git.mykyta_poturai@epam.com>
 <57a595e3-9b90-41e6-8116-94b77ccba615@suse.com>
In-Reply-To: <57a595e3-9b90-41e6-8116-94b77ccba615@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7665:EE_
x-ms-office365-filtering-correlation-id: 3f71fdf3-3c48-4972-88ab-08dd49c5ff36
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MlNFNG9lTXM4YmFsWTJXSlBvZHNPbWg1WmhnWURrazc4a0tSQVMrQm15YjIw?=
 =?utf-8?B?SWoyRUdmVmVnNHNNSXVlOFU5WjhhcXVvNHhiaXFEKy9qQ2svaWlXOS9YVUVX?=
 =?utf-8?B?SmhkaE44VmUvbUhFWnB2MVFTYmxiaGpCUW4ycVk1RDdWa1dRY0FpclZ0cmV2?=
 =?utf-8?B?dHhDVE1BSlJTaFhLbkNOZU1QZDZHVFpGVS82eis0MWFRKytjKzByREdTclAy?=
 =?utf-8?B?cXRKSTZyYzdrcEhHUEFLVjVvN2tDdFhYL2lXUDFwcVdKWTkwdUNtRUd0dG5z?=
 =?utf-8?B?cVBNcWlWMkU0VjBubEFpVEUyQlMvemgrWDRWZUwwckZ5TmVvNFhuNEtwWmcr?=
 =?utf-8?B?MlRsU3hCNjFRQTdqVFAwQlBJT3ZJZW1jY0ZPblRpdmp2cFpCc2FTN0oxTTAz?=
 =?utf-8?B?R1orZys1QkdPOWVpM0ZCQ2pkWW80cTZqcTNQT2xNSTcyUGQwcG9FNCtEa2Z1?=
 =?utf-8?B?VnJQYUtSWUVPM0RsaXprYzViSmtYZXNINFFPL0hGdGl0cElRalBJck9tb0Fq?=
 =?utf-8?B?QVM2eWlJKzdpYmdraHp1SzJ3YmkvcjA5UGp0VU9LSG1uTGxTcUlMT1ltK05K?=
 =?utf-8?B?SzNsL3BlVzdMZVZVdXFrVVpEd1BaaytUN1VOQ09ISjVxbFk3OXVzbzRTL3c5?=
 =?utf-8?B?aHoyRlhSbzlwSWUxd0FyeHV2VlQ0QzFDRlhFMWs2SVhKM1RKR0pHM0loZWh0?=
 =?utf-8?B?eThlb3I2YjJnUDNlcE5MemJCU3ZkZHhWMmlZQ0VFTHVrMVpkZUs3Y2ZnNWdt?=
 =?utf-8?B?RklQajFMMWtaOFFlMFFJOHZEdHQ1Z2FOZUluZG9WLzhSVUVaOTNaaU53UGQy?=
 =?utf-8?B?QVZoREorWFVTQVJCUXVJbEhCdDQxT1JDZmRuNFI0S2dPemRSRjBYWnJ2RU9x?=
 =?utf-8?B?MlJJSGs2ZWJ4eXVhTXB2RWZvN1M2bDdIY2plVWZ3YmxNa2U1cEtmWXB5TUhX?=
 =?utf-8?B?RmVwZFNoM2NQZ3J2Znl3ZVRwTTZiMWNidmVOeTlXTjY4eldZTkNZaitrejU0?=
 =?utf-8?B?UnZiREtwdU43N0FXTjF1bjV0K2QyQU5GSnpKb1NZankzbnJGVFdRS1pJZlQr?=
 =?utf-8?B?SEZlaXN1TVYxTHJYMVBWdTNSVGdFWHhrOFVzQmRYeHFiejE5a0ZnVi9EZ1NL?=
 =?utf-8?B?SlczaUozS0xUVkNSdHQ2RDlWaWxCUkNDWU5uRGNUZ3EydTQ4NEhIbTFDdjBI?=
 =?utf-8?B?WHNzUGJXTjQwUDdOSlI0SWh4czdnRXYwM3hOYytmbkhDa2dxdGlpMm5MMEx1?=
 =?utf-8?B?aFJtQ0NWS0QrM1dtNXZKdllUdmtNU2hHaU1TTXdkNkJnY21MV3BkNlhqejRC?=
 =?utf-8?B?eElId0FyNzJYdHBZSGFXZnpLZ0svZW5vWWJReGxQZGFUaEdSaFVDWFhGODkr?=
 =?utf-8?B?MklrTFhQejZ6R0RDbmFkNTBsSUxHeWlrTGlqQVJFTEJiQS9CUHpNT1hlOG1S?=
 =?utf-8?B?bjZRYXNoR1FuSU1UYk9YOFdXSkRKeWt5K1d3eWp3VVVQUGh3K2o2SGNQU0ZB?=
 =?utf-8?B?YW51Ny9nTUdWM0pXRUdWNC90L2NLdDk0cHVjOWhjaUdkU2R3VWp4NXZ1NFBL?=
 =?utf-8?B?SktzdFdBV2lBdTR6L3psOEx3TFJ6R25KVFhLWGIvZUZXK2NHYXJTN0pPZG1o?=
 =?utf-8?B?OW5lQnNWaW5NT0l5OVVoN1g0bkhlTkFUNnZ1UzBoU25MTEVZQjNvZGw2U1J0?=
 =?utf-8?B?TjE4WjhJTUhSd3oyUlNmcXA4N21FczVoUGN0TkxVNUNmN2pONjNNL3RNUU1V?=
 =?utf-8?B?TFY1S3V4ZzVqZ3k2YTRvb3ExajB1dTJoaTluUEtOK0lja2IvUWpkem9mSmZQ?=
 =?utf-8?B?dHhSL3h0RE0wVko3TFlWZmpyeCttdE9uYU81UjFFNHI1S0JCN0JBNDduaTlH?=
 =?utf-8?B?eGUzd20waFJVMDhYK2JQdlZ4NXhBS0RpYi9qcTlkVHpyb2k4c1paQWRxK1U5?=
 =?utf-8?Q?/BltRSc5qo5kkKdjZgaaxkVnPSJ/XqbE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEh0ZktKeXU4b0NMQVFnMkJoNWFVdmNLS3BGMGhWVnVoTHNLMzdUZlpsOHRo?=
 =?utf-8?B?Y3cvSnRFQklYVTBXUE5FV3NIT2QvVmlPRmJKQW94VkhEZW05Nk5zN0kxNDJz?=
 =?utf-8?B?djJkUXNFTmFEckpaMFNHQmY1akNPdWcwRWhvMk5PWHVMc0VOUE5sWXVxUHFv?=
 =?utf-8?B?WHh2S1k0TnJUc0FPT3ZzNldFTFVVZ1g2TE1hcmJyZWZrVUtzUFFWV3FXVVJl?=
 =?utf-8?B?Mk5DZWh5YkxJNW1CdCtyZTExUlV3RjFrQU9xc2h5TTY2clVOTGVmUGtiaXdu?=
 =?utf-8?B?RUVoSlBhS1RGWlhQYzAra25TY1VDV1EzVE43a0d6b2dpbTNiVnB4S0xxOWNV?=
 =?utf-8?B?RzIyVVBsZjBPc1hoOXJqQThoRmtENmdyWWcyREtyMDhQVE44Yk00MDI0S1Jz?=
 =?utf-8?B?OXFzRkxvMWc2WEEzZzFLeUNwSEc1ZFFwQm44TDk5OTBJeUtGTUE0VVFjM0pR?=
 =?utf-8?B?bVhHM2REYURuYkVvSVdrZmE4N1loRnB2U0l3YzZKelNDQnRYeklSUXhKZXN6?=
 =?utf-8?B?d2pkT3JFMnB3d1BGNnhWbm5CU1BWU3lmM3hEQ1JVUmJSZForSjd1Y1R4dzd6?=
 =?utf-8?B?eXRyamhCMjMwMjVXRGVTMW42cWxRaEIwTTZjQzYrM0dVKzZ2L3VBOGI3ZlBF?=
 =?utf-8?B?K2hDRExaeEJLSWwzTmtZcjhFWjdtQjN0a3Z2YUVkWmFKeWhPY3VhaEhTc1I2?=
 =?utf-8?B?NEpmZU05VlROMW5GdFBzR3d5T1FOSTBRNU1xWVZLWTFsNTdSM01PNmh4VDk0?=
 =?utf-8?B?ay9WM3VLeGtDb0JzaG9TZGg4ejd1bVpia1RkYms4MUJENDdaSWt5empSb1hR?=
 =?utf-8?B?UGJoNzdlYmV0dVFTa1Z1ZFJMRXFzY2h0RFZHN1pQR2dSQ1lLMUpMR2ZCVTFt?=
 =?utf-8?B?TUpkYmx6YytSWEdOTjdZTEMwWW5vRHZIaElIMEt3MFNHTWowSXNGWFBmMGJn?=
 =?utf-8?B?MjZhYXFjVHFGZytlcE1XSHczMy9meUFKLzU1WTZZaU10Q1dLc21XSnI0a3hl?=
 =?utf-8?B?NG11WEROYWpmMTBiMVVUV2ttVWRqMUZzdFo2NkZmc3l1M3VPeU1jeDR6SXNC?=
 =?utf-8?B?N2dtT0Z5N0ZZUlVVeU1tTnJZWXhHbDVhRHRhdEJ5NTFkcGNwZWZET0RVZFZM?=
 =?utf-8?B?TDloVllhbHA5d0k2Q3c3cmxQVHJRWjlWUFFDZ3ltYjQ0bGdCSHVtRzFNbXpm?=
 =?utf-8?B?YlYvaWVTZExTN21tZlFDLzJJK3c0TTUxSktDRWwybHBJT3JvZ0VpNitTNzN0?=
 =?utf-8?B?Y2Q0OFJjUzhvWGdGQlhLbit0elRud3J2bWI0ZVEzNlhkdDJtVnhWOVZ1MUZD?=
 =?utf-8?B?MTlMaXNSUnZQSWkrVlJKaUJWSGwxck8zZkdKYUNLQkRYdFFLTTJkUnJ4M0ZO?=
 =?utf-8?B?WGt0ZjZaT2xIVEdJU3N1V1NDTTlSWTR1a3dFUC9QeGlMZHp0TnVSYzVpV0Ez?=
 =?utf-8?B?VGF1NytFVnduZlhHWHdqN3J5eUVpQWJIdFk4cmI3WmhhRmkybDFudVNIKzV0?=
 =?utf-8?B?YjduY1hiTnF5ZUhPd2xwNFVTTXFQK2Rqd0RubHlRSU9oTUZCYUw3ck5pOUNi?=
 =?utf-8?B?bGZLRTF0cDl6bjQ0aFpydGoyRlZVSjNEUS94dCtXQ2hFVUlPL05xQktNdEg5?=
 =?utf-8?B?dnRvdmg1TFZwT0lGZ2I4bTNCdllqUy9JVGhuZlNOZU5uWE1tMzdJQmk4QWNj?=
 =?utf-8?B?Y0wxYVNHajVIUStSQlp2Q200RWJXSzdVRkxodTFneUZTODRwTUhhSzExTXZD?=
 =?utf-8?B?VXZtYXVianpTRis4UmhFakxDeVYrWjZuZ1R6NjVza0hRZVJpc002VlZGWGIx?=
 =?utf-8?B?WjJzL2FQcGg0anhlTG9leEdDb2FJdzB1WC9VSVcvODVDNnNIakdYQzg5Qm1H?=
 =?utf-8?B?UUk4WlNIY0QxRUU5UjdXWWR0dDdVWCtqcU9DdDVzeHNQT3laejhwMGQwZCtL?=
 =?utf-8?B?RmMraHdjRmpYM0laWHBEMFpaRmVRSGJuRXFrQlpOY1BaK2VYb2lLTGlCR2Vp?=
 =?utf-8?B?V2Q4d0pHdkwvamw4WFBDU0dRM1VQMTJoSktyNmJXd3JUUGVLMFJ4NGt2b3dY?=
 =?utf-8?B?dDlYRlVEOC9FVnppb1FKZ3BycjMzOFEwWEQ1YjY0cDlCUzdQV1A2V29oZVhQ?=
 =?utf-8?B?ODZuVUlYekJnSU81djFaUGhRL1RjRlZlZ3RPVEhvODN5WHpaVEZjbzVDR2tW?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17DB45E5B432824FBA5B9F9A8EB3E473@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f71fdf3-3c48-4972-88ab-08dd49c5ff36
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:28:09.5284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KLq6fKXRjvCii9E/6MgTiz8149g95rJ0W4SJZYVutTVmxWbxN092fhpMIWkZRYdGKkEUIz1Z8TcDnl/uCBpSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7665

T24gMTAuMDIuMjUgMTI6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wMi4yMDI1IDEx
OjMwLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IEZyb206IFN0ZXdhcnQgSGlsZGVicmFuZCA8
c3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20+DQo+Pg0KPj4gRW5hYmxlIHRoZSB1c2Ugb2YgSU9N
TVUgKyBQQ0kgaW4gZG9tMCB3aXRob3V0IGhhdmluZyB0byBzcGVjaWZ5DQo+PiAicGNpLXBhc3N0
aHJvdWdoPXllcyIuDQo+IA0KPiBXaHk/IEl0IF9pc18gcGFzc2luZyB0aHJvdWdoLCBldmVuIGlm
IERvbTAgaXMgc3BlY2lhbC4NCg0KRG8geW91IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBk
cm9wIHRoaXMgY29tcGxldGVseSBhbmQgcmVxdWlyZQ0KcGNpLXBhc3N0aHJvdWdoPXllcyBmb3Ig
UENJIHRvIHdvcmsgaW4gRG9tMD8NCg0KPiANCj4+IEBAIC04Myw5ICs4NCw5IEBAIHN0YXRpYyBp
bnQgX19pbml0IHBjaV9pbml0KHZvaWQpDQo+PiAgIHsNCj4+ICAgICAgIC8qDQo+PiAgICAgICAg
KiBFbmFibGUgUENJIHBhc3N0aHJvdWdoIHdoZW4gaGFzIGJlZW4gZW5hYmxlZCBleHBsaWNpdGx5
DQo+PiAtICAgICAqIChwY2ktcGFzc3Rocm91Z2g9b24pLg0KPj4gKyAgICAgKiAocGNpLXBhc3N0
aHJvdWdoPW9uKSBvciBJT01NVSBpcyBwcmVzZW50IGFuZCBlbmFibGVkLg0KPj4gICAgICAgICov
DQo+PiAtICAgIGlmICggIXBjaV9wYXNzdGhyb3VnaF9lbmFibGVkICkNCj4+ICsgICAgaWYgKCAh
aXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSAmJiAhaW9tbXVfZW5hYmxlZCApDQo+PiAgICAg
ICAgICAgcmV0dXJuIDA7DQo+IA0KPiBJIGNhbid0IHJlYXNvbmFibHkganVkZ2Ugb24gdGhpcyBh
ZGp1c3RtZW50LCBidXQgLi4uDQo+IA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYu
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4gQEAgLTE5LDcgKzE5LDcg
QEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2
b2lkKSBhcmcpDQo+PiAgICAgICAgICAgc3RydWN0IHBjaV9kZXZfaW5mbyBwZGV2X2luZm87DQo+
PiAgICAgICAgICAgbm9kZWlkX3Qgbm9kZSA9IE5VTUFfTk9fTk9ERTsNCj4+ICAgDQo+PiAtICAg
ICAgICBpZiAoICFpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgpICkNCj4+ICsgICAgICAgIGlm
ICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgJiYgIWlvbW11X2VuYWJsZWQgKQ0KPj4g
ICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiAgIA0KPj4gICAgICAgICAgIHJl
dCA9IC1FRkFVTFQ7DQo+PiBAQCAtNTcsNyArNTcsNyBAQCByZXRfdCBwY2lfcGh5c2Rldl9vcChp
bnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgIGNhc2Ug
UEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOiB7DQo+PiAgICAgICAgICAgc3RydWN0IHBoeXNk
ZXZfcGNpX2RldmljZSBkZXY7DQo+PiAgIA0KPj4gLSAgICAgICAgaWYgKCAhaXNfcGNpX3Bhc3N0
aHJvdWdoX2VuYWJsZWQoKSApDQo+PiArICAgICAgICBpZiAoICFpc19wY2lfcGFzc3Rocm91Z2hf
ZW5hYmxlZCgpICYmICFpb21tdV9lbmFibGVkICkNCj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOw0KPj4gICANCj4+ICAgICAgICAgICByZXQgPSAtRUZBVUxUOw0KPiANCj4gLi4u
IHRoZXNlIHR3byBjZXJ0YWlubHkgbG9vayB3cm9uZyB0byBiZSBtYWRlLiBJZiBhbiBBcm0tc3Bl
Y2lmaWMgYWRqdXN0bWVudA0KPiBpcyBuZWVkZWQgKGFuZCBjYW4gYmUganVzdGlmaWVkKSwgYSBw
ZXItYXJjaCBob29rIG1heSBuZWVkIGludHJvZHVjaW5nLg0KDQpUaGlzIHNob3VsZCBub3QgYWZm
ZWN0IHg4NiBpbiBhbnkgd2F5IGlmIEknbSBub3QgbWlzc2luZyBzb21ldGhpbmcsIGFzDQohaXNf
cGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSB3aWxsIGFsd2F5cyBiZSBmYWxzZS4gT3IgYXJlIHlv
dSBjb25jZXJuZWQgDQphYm91dCBzb21ldGhpbmcgZWxzZT8NCg0KPiANCj4gSmFuDQoNCi0tIA0K
TXlreXRh

