Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E64B39344
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 07:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097482.1451770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVVD-0003wW-Hy; Thu, 28 Aug 2025 05:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097482.1451770; Thu, 28 Aug 2025 05:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVVD-0003u1-Eu; Thu, 28 Aug 2025 05:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1097482;
 Thu, 28 Aug 2025 05:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urVVC-0003tq-3w
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 05:48:50 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab4fa64f-83d2-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 07:48:49 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB10055.eurprd03.prod.outlook.com (2603:10a6:20b:63a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Thu, 28 Aug
 2025 05:48:46 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 05:48:45 +0000
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
X-Inumbo-ID: ab4fa64f-83d2-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/jUUnveh+obbIuNjgNb2basutzAoQjYkw7J5/tpn85dDkdx19qoZyCmkLNCSkeb5R7Eu9rwufiYHMJnFknsWnrvyx3PJ6UejDqz8WkClfX7yxmfqhNqx0W8orbcH3eLeRb8b+DebPZmGShwP7jqxhiRGrQyEo4rSKUfkcB/jMyJjioV1+hRoLKm3hTZAkf4Tl5UgGvYcckPBYTkSLeD1JEHJVGFa2ThNNcf2+CDguDsIwgRuvm+GniThpvNWtc97rWSjKMEDoGg1r5wnOtdeap8misvTRkQBBHVSQZ3ybEE0KSjjxSx6c4EVEajLciqj04e38aOG+HEAWVctIDr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqC3N9DMASgfPW6lFP2YNm96SmEdAhjb7HDeJKcvCas=;
 b=O8eqFxFm39g6YmKrU5A5BKppqoIVs6TknqMZKIG4B1E1eaLHuJUUauWVgpCA/nIclbxwH7UjNE0u9ZgfnGMNtEqJmxXuyqAd51FnvqwWUfIwvXRYIKnRcMYB+koOdrwq+Yx//9tOmrNxLWhxR+rx9kil3pwWaVAlkQyw1m2eWhTI2gR8y7ki6rGWh49Cl6b6fMYL4daAFnnyzTJzqPUAu1YNHwyJkxm3ZRkndyh4qQ/F1U5zibiECER6HDwmz8iWLImlcPSwUgDJbAKwDEKP/vrHXT7FgaL8vp8Rcw4LRV78kqQI1VmN5v/wRbXdr6lz94cnX3SbTq9dPHRfnsJ9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqC3N9DMASgfPW6lFP2YNm96SmEdAhjb7HDeJKcvCas=;
 b=SEG4xOz6gKem+UbOg9621ezzBnU2adsj5D1yAUZ6pgi9B6u7NKKjevJPWTu6vhISOb5hhO7aOWJJVkFJSUJKCO4F4xyB6HZIY5ENe2lIvryIJTRZZwX7g0/C+Wghv+Gav7Yx/WRlZrZTWz4qSzVtHctVHCjUT6qdkmAkh86O7x94vHrRVzvrgky440xWZgvNQR3CtGgo5bLeujIHVdH6pTJRR+XcmcZu59D2C2eZDA5a1jv5W16sFAtkRFQ9CBGI2bX3KzufJZlpCcm+4gWd/cdmCY4GoY9JMKU4QGquUDrowQV9KLnosuiaar+dKt197m7n/MEJnwQY8Lxc41ubrw==
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
Subject: Re: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Topic: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index: AQHb+v2XIf5rVjN6B0ydmKskjXCNlrQ+E9WAgDm1BAA=
Date: Thu, 28 Aug 2025 05:48:45 +0000
Message-ID: <e214b0b9-1cdb-43c7-a02f-a1b64b3bfb8a@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <aa4bf9a069721ace3b9da7409923455eed2f6896.1753184487.git.oleksii_moisieiev@epam.com>
 <3ff863d9-764c-4478-9bb9-b783ff850185@suse.com>
In-Reply-To: <3ff863d9-764c-4478-9bb9-b783ff850185@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB10055:EE_
x-ms-office365-filtering-correlation-id: 9c405a46-26a1-4ffc-ec3f-08dde5f68db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MVRlZi9xdS9LZHZNRERSb1c0TTZUbE1oREFxcGJtYW9UOGpaeVJaSUxWT0dH?=
 =?utf-8?B?em1GUGp2c2xHMC9IYkw1SW1VUDJFc09LWDhSMEVyZU05UW54YVJ4anRqM1JB?=
 =?utf-8?B?QkFTU2dBV0FaaThNZFVIelNPVWMxL2NCYXA4d3NRdTdBVC80QVBOQU5tRkF3?=
 =?utf-8?B?ODltSC9uTms1L2wySTFVMjkraXBQMEx6UHh4T0w4Ny9vUEc1YzJFNGNGL3o3?=
 =?utf-8?B?eEYydUxLOGlVblpTb1dWYUM2MHlnUHZ0b3ZjcGhnb2VGZ3BmdmVFUDA5aGN5?=
 =?utf-8?B?WHhaaXlka0RxeXRONVZReEJzUWFRUUVLQmtxd2puSFZMbXRWMDVVM1B4emo3?=
 =?utf-8?B?ZWkwQ2hHVVZhUUs5bWZNZVhXaUx5MlRQcTBoaEtXa3BhKyszWFJma1VmT3Bw?=
 =?utf-8?B?RFMvVzZ1dnZWVjAySjFqSUZMSmk4MGM1NE9ZNlp4amtXaEtjZXRDK2t0Z3JZ?=
 =?utf-8?B?eVA3a2YyU2w1WU51blE0RkUyREZMdlBLRGxFYUxMNmZveFhVMmlOU0d1azI4?=
 =?utf-8?B?cTNzQVIzeVQ2NERmWmxyVXlOMGkyOE5LWVRvV0pSQU1DUFBBdTVjVzVJYk1C?=
 =?utf-8?B?RE13Z1pKKy96UzBWbTNVcnhQMWsxMDlNbjN0OHNDY1d1Q1REdkZMU2JJa2RE?=
 =?utf-8?B?OVcyMWhodDFnN3NvUitJVjIyelBvd2piYzJUWlcrWFdqSU16eVZFZXo3bWY0?=
 =?utf-8?B?aEhISUVFSGJjYzZhMy9yL0xYZVFjQzdvV3RWQVR4cDkzOTFKaXJSYjRRVnJI?=
 =?utf-8?B?MGlaODYxbCtKTXRmbzlzTUkwTmh4ZTY0Sklic1pQSHBsUFl5aFp5TGlsVENj?=
 =?utf-8?B?R1YvYzhFMHdhcVgwcXF6YkVPVXlzeFI3UUV4MkxLbGhFQ05SN2VNc0x1bjhw?=
 =?utf-8?B?ZkNzeDQ5UUNOUDVGRkhsZkxWVS8wWmc2eDk0dm81NEMwY2tkUkhjMkQwTXVD?=
 =?utf-8?B?YS9DajBUVUo0WUpZa2FuVTNVME1sR3lrdEJyUG53U29uVDE5WFhvSlFIYWFY?=
 =?utf-8?B?NkZHdGZkcHlyTlRzSWVUNXdWRVdRR2hkV3E5TStpbk5JeGI2RkpjN0J6SEUv?=
 =?utf-8?B?aXZqaHk0aElnTithNnozRDI0TTJTZVRZMU1oUzdLVlhBblJzQ0lySXMwWHVZ?=
 =?utf-8?B?R1IrSmhIZ2JIcFRQRkVSZzA4dXlqQnBLTFpSanVEOXpiaVFJK244V1F1MnNu?=
 =?utf-8?B?dFExOEJMUjFvVVdJRERwRGt0eko4bVN2SWJqdFBqVytOOUZOY0pHWlBvMmZC?=
 =?utf-8?B?ckdXN20vSklWN1NvUjlwaDJLbEoxZHZoNkFuTVp5L0tRWTg1QkNEWko4WGFs?=
 =?utf-8?B?OURKdGYwaVZPYS9mVkNOamN1ZC9nMFVuZUs2Sjc0dHFRUVFYZzBmWkQwY0Nu?=
 =?utf-8?B?YzVjUXhGbnB0bkxaTmNiSFdMSmVqM3RrZWtaUXRuRHp5VjRmSURZTEkwQlg2?=
 =?utf-8?B?TjJXWnlMS3o0dzQ0UzJwRENXSVhhOGpHU2M1SzZDMmFSWi9vSm9rcVQ2ckFG?=
 =?utf-8?B?bFkvUlFoVEFOV3dMNmJmTDJpMDVPWmZ4ZjRPKytJbDJzMjFZL3hGaUR3N2RX?=
 =?utf-8?B?cEhQaEorSGRMVGptaGF2UXp2UXVnb0ZGQldJbUhyMDdIcjhaaDdwQldnV2Y0?=
 =?utf-8?B?NlpsN0pmeW9WMUtWdHk2NGFDWWVRRmE2S254VGk3SVE4bW9HNm5uSXhYeUpN?=
 =?utf-8?B?c25tY3NWZEhTZ0ZLWmJlM0hSR3dwVm9rRlhnVkpiam5zSlAyWXJXY29IdUEy?=
 =?utf-8?B?S0VuL0dwN21NRkVESXFoU3MyTkJtd2hjM1BaNmpMeXdWc1U0UDlXdHlxMmg1?=
 =?utf-8?B?V3BTMUNvaUJvZ2plQllxZm1Od1lDSGk3cklWOGpkajd5Lys1c1lWYWJFR0h1?=
 =?utf-8?B?bEdwZ0JXT0hBWTJubXV3VTlrNlVBR3BkaUZrNXhxTGJCNzltaUZjQ1RaRFZ3?=
 =?utf-8?B?TzliZ3M5ZWtzL2EzVXhIZUlYR0w1S2VZLzRHRnM2cjR1Vi9UZWd5Q1ZtNFY5?=
 =?utf-8?B?Nkd0eUlJWU5nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHNkTlNvTWZqVHBVbUlPNkc4dkUzaWdlcjdrK3c1akZzNlNVMUloM210Nm53?=
 =?utf-8?B?VG13M3JpbDNUUjZyTzV2Z2s3aVRVZXZ3QUVHanZ0Z29XRFVzUFg5Mi9xeHFj?=
 =?utf-8?B?ejR5cXFwVzNOMEpDOFB6azFZdkJVcWpzSzlSdmR2ZktyQkNycXlla0pOYjF2?=
 =?utf-8?B?dEtUWjl4ayttcW1pZDFBcGFpSll3SU8vNlZkY01wQnVNbEV6OVRVQlROUzFo?=
 =?utf-8?B?WmF1ZDBNTnVUZURxc04vclB0VUpqOUdyNkgySWE4WkVYeG1RMm9yekh2RzBO?=
 =?utf-8?B?aGEvK3ZsS3hhOHR3WnhkYTVNcG9SQlBjVE9zekRxUHVRUWQ2R3UwREV3RFpN?=
 =?utf-8?B?QnJIY2tlUWE4eXh5eldPWTAyK3RXN3IvaFZZbC9xb2lQbkZra3BENFF6M1pV?=
 =?utf-8?B?ZktzcVowYXNhQUNldXJ2VnJaU0FhSUM2WnBIY0o2N3laYWtvNS8zNHVPRWU0?=
 =?utf-8?B?THNHbG1rQUhMRkZjbEFBUzNGc1htekhQRlpNQm5TMmhhc1BLQU9NdGdYdnJE?=
 =?utf-8?B?RWc1QXBmeCtJcWFhdlRvRmh5Z2hpUVlTcmt4dHFBZXhKUWwxQTZGdWZua2Qv?=
 =?utf-8?B?dWlhNksrVWJFbjE1aGRIdW1ac1Y2MFFjVWsyYXd1anBza2w4UEF4QXlIajky?=
 =?utf-8?B?VGRsMXBOejVsaUhrMjFIeFhkakNkMHA0RFY5TDRKZjQ4Zk5lRkdQUEpONWpy?=
 =?utf-8?B?bFdBblBiTEc0WUo1Z290SmpBREkxRGhPWDNlczE5UE1qL1g1bEJoTlo2SElC?=
 =?utf-8?B?Q3orc1l5eVkwcGhRNk55U2phOENrS0QxSGxUMHhVU05zSGU5YnRmNzVuL1pu?=
 =?utf-8?B?WWVMcFozZy9MZm85eVlsYnU1cms4OXdhMGc4WWp5TnJid055eTduNHBwbjZj?=
 =?utf-8?B?ZEFpRXBQSjNia2o0NVp0QjR2MDRhanp4ZUNuVi9FbU5NYmV6UmtRZklaakpy?=
 =?utf-8?B?SVhiQUNXVGFKenpIbzZxU1lQY3l0eTZUelpnNndiUi9zY3FGUnBxa3dSVTYx?=
 =?utf-8?B?M2ZQRkx6WnJ4cUM2RVZrZkVoN0xtTHVnVWI4K3ljUW9zTU4zbjVkdFcvbnJv?=
 =?utf-8?B?NGhVZDZBbVVmbzdjajBHd2RvZjBvdWlZcG5TTGNOem4wR29md292TWlBM0pW?=
 =?utf-8?B?VXJ4QmF2bUVvK2x3eWRORnNzZEdzeFBZZm1ITWxPdjlrWjluTUtIb0duTE82?=
 =?utf-8?B?UDBzSTJRQTdYNnJhbVFKREM4R0ZVOXY4cG9VV25LVVl4K21rNTdoMi84cVk5?=
 =?utf-8?B?QlVRYzQ0NDZYL0lRR2lhRS9jYWFsWHZvR0NPdWg0WEFjR29sbWUzYXBUTHRw?=
 =?utf-8?B?OTI4USs5OURxQ04wdFZSOFlzSnRGMDVZbkxac3dzUWJmdE1USmErSkdrbytx?=
 =?utf-8?B?WXJISVlJN0RWU2hHTG9FZ3E0dTVDV2FSZzFDOWVHN050dXpvVm9rREM0WmlV?=
 =?utf-8?B?R2NoUHRQMSt0NDZjWlJGS1gzVnhxMkRjTndRTGZqYU1hWDRjMHdWTFRCWVBX?=
 =?utf-8?B?eWpQcU5VZnV1eE5GNmo3dm04NjdYTGZLcnMyRTdMdHh3TDFHQzV1VkQvR1po?=
 =?utf-8?B?N09tbDdxLzl1Wm5HeFVtZFBIZG80c2d0ZHg1MGtTemMvb1JkeGg5QllBNWUv?=
 =?utf-8?B?ZTlRNzJUTmxndHo2UUxEWVVPL0hwcm5vdnlQbkQvRmVLb29Ta2FIQkdxT1Ji?=
 =?utf-8?B?NUUwR0FTSFpOc25jbzRXTGNDbFdQNzZtb3ZuVFF4NFgrQXVJME1RZk1DL3RO?=
 =?utf-8?B?V1g2NzdNNHdSWm5VRmQ2RGEwak1lWHN1Um5hZHYzMktFd01YRExiSnR2czhD?=
 =?utf-8?B?Rmx5Rno5OGlHY0d4NHBDUzk1bFhMQ3ZicnJGci9QdHhZb2hicDYyUzRoRVhu?=
 =?utf-8?B?TUNQK2V5KzJyK3JxcHQ5YndteGN2ZFZzbGh3UEJ4R3lGYnQvZG5IWVhpNXJw?=
 =?utf-8?B?cFErOWl2ZzAwOVAySlZGaEdmNVh4UzdlL3RrVEl6bTlSRWNVSDNtS2xPZnlH?=
 =?utf-8?B?Q1hiZmMxaVRMRkRTdkExWTlLaE1wM0xDMzBzaXo3cER2VDRRTDNiSUczdVRB?=
 =?utf-8?B?Vzlja3NseEdDaktJVHBOOW5TNXlYRTNWRTRoOEU4ekFaWDErbzRPWGVSQnJ6?=
 =?utf-8?B?M3lsZDJvVytkVThadHVSQ1BXRkxXQy9rQms5N0ppbkpBS1pCZFFFWXJJdjNq?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BE95FF5C09E9E439E60B1157261ACCF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c405a46-26a1-4ffc-ec3f-08dde5f68db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 05:48:45.7844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1SO9hsjmTpcebGVX3hBLehn9JbbSdyLE9/wGjOV4xM708ocAUObVkIB4fUoowI6WAMFQohxYvQvxzREzNp0RMjnRYoqx7fjAllxjPN0Vbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10055

DQoNCk9uIDIyLzA3LzIwMjUgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wNy4y
MDI1IDEzOjQxLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEBAIC04NTksNyArODYwLDI1
IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1
X2RvbWN0bCkNCj4+ICAgICAgIGNhc2UgWEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2U6DQo+
PiAgICAgICBjYXNlIFhFTl9ET01DVExfZGVhc3NpZ25fZGV2aWNlOg0KPj4gICAgICAgY2FzZSBY
RU5fRE9NQ1RMX2dldF9kZXZpY2VfZ3JvdXA6DQo+PiArICAgICAgICBpbnQgcmV0MTsNCj4+ICsN
Cj4+ICAgICAgICAgICByZXQgPSBpb21tdV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCj4+
ICsgICAgICAgIGlmICggcmV0IDwgMCAmJiByZXQgIT0gLUVOWElPICkNCj4+ICsgICAgICAgICAg
ICByZXR1cm4gcmV0Ow0KPiBJZiB0aGlzIGlzIHdoZXJlIHlvdSB3YW50IHRoZSBFTlhJTyBmb3Ig
dGhhdCB0aGUgcHJldmlvdXMgcGF0Y2ggc3dpdGNoZWQgdG8sDQo+IHRoZW4gSSBzZWUgbm8gcmVh
c29uIGZvciB0aGF0IGVhcmxpZXIgY2hhbmdlIGF0IGFsbC4gSW5zaWRlIHRoZSBoeXBlcnZpc29y
DQo+IHlvdSBjYW4gc2ltcGx5IGZpZ3VyZSBvdXQgd2hhdCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8g
aXM7IHlvdSBjb3VsZCBhdm9pZA0KPiBjYWxsaW5nIGlvbW11X2RvX2RvbWN0bCgpIGFsdG9nZXRo
ZXIgYW5kIGNhbGwgLi4uDQoNCk15IHBvaW50IHdhcyB0byBsZWF2ZSB0aGUgZGVjaXNpb24gbWFr
aW5nIHRvIHRoZSBjYWxscyB0aGVtc2VsdmVzLg0KU28gaW9tbXVfZG9fZG9tY3RsIHdpbGwgbWFr
ZSBhIGRlY2lzaW9uIHdoZXRoZXIgdG8gcHJvY2VzcyB0aGUgbm9kZSBvciANCm5vdCwgc2FtZSBm
b3IgdGhlIHNjbWkgY2FsbC4NCkkgY2FuIGZpZ3VyZSBvdXQgaWYgdGhlcmUgaXMgYSBuZWVkIHRv
IGNhbGwgaW9tbXVfZG9fZG9tY3RsIG9yIA0Kc2NpX2RvX2RvbWN0bCBoZXJlIGJ1dCB0aGlzIG1l
YW5zIG1vdmluZw0KcGFydCBvZiB0aGUgbG9naWMgZnJvbSBzcGVjaWZpYyBjYWxscyB0byB0aGUg
Y29tbW9uIGNvZGUuDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogQWRkIGNoYWluZWQg
aGFuZGxpbmcgb2YgYXNzaWduZWQgRFQgZGV2aWNlcyB0byBzdXBwb3J0DQo+PiArICAgICAgICAg
KiBhY2Nlc3MtY29udHJvbGxlciBmdW5jdGlvbmFsaXR5IHRocm91Z2ggU0NJIGZyYW1ld29yaywg
c28NCj4+ICsgICAgICAgICAqIERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUgcGFzc2Vk
IHRvIEZXIGZvciBwcm9jZXNzaW5nIGFuZA0KPj4gKyAgICAgICAgICogZW5hYmxpbmcgVk0gYWNj
ZXNzIHRvIHJlcXVlc3RlZCBkZXZpY2UuDQo+PiArICAgICAgICAgKiBUaGUgYWNjZXNzLWNvbnRy
b2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2hhaW5lZCBhZnRlciBJT01NVQ0KPj4gKyAg
ICAgICAgICogcHJvY2Vzc2luZyBhbmQgZXhwZWN0ZWQgdG8gYmUgZXhlY3V0ZWQgZm9yIGFueSBE
VCBkZXZpY2UNCj4+ICsgICAgICAgICAqIHJlZ2FyZGxlc3MgaWYgRFQgZGV2aWNlIGlzIHByb3Rl
Y3RlZCBieSBJT01NVSBvciBub3QgKG9yIElPTU1VDQo+PiArICAgICAgICAgKiBpcyBkaXNhYmxl
ZCkuDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIHJldDEgPSBzY2lfZG9fZG9tY3RsKG9w
LCBkLCB1X2RvbWN0bCk7DQo+IC4uLiB0aGlzIG9uZSByaWdodCBhd2F5LCBmb3IgZXhhbXBsZS4g
KFdoaWNoIG9mIGNvdXJzZSBkb2Vzbid0IGVsaW1pbmF0ZSB0aGUNCj4gcXVlc3Rpb24gdG93YXJk
cyB0aGUgb3ZlcmxvYWRpbmcgZG9uZSBoZXJlLCB3aGljaCBpaXJjIHdhcyByYWlzZWQgYmVmb3Jl
LikNCj4NCj4gSmFuDQo=

