Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0AB13A77
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061426.1426984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMxi-0002IM-D5; Mon, 28 Jul 2025 12:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061426.1426984; Mon, 28 Jul 2025 12:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMxi-0002Fd-9z; Mon, 28 Jul 2025 12:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1061426;
 Mon, 28 Jul 2025 12:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugMxg-0002FX-O2
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:28:12 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52bed92c-6bae-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 14:28:10 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB9616.eurprd03.prod.outlook.com (2603:10a6:10:423::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 12:28:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 12:28:07 +0000
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
X-Inumbo-ID: 52bed92c-6bae-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIh097bKp3mfNNUdAKLGBjk3xZHH/ttTvvvKRovpUL5KiXhUEoCU2CQyUQivSpJWRTb6KhUO9taUeFKYruenifp9n9/jXkno2qiZasYjID0GdotLX0jMmZdFCaaakEAm0F6gScxDuq107t/SUBTpfoIFQ9vLte+oLEyZ7g160Nj689qA21xJZJAi54c4c0SonHbCiEzNrSpCGU9VVnWdzhsFjY+uWLypK+jQZegFgt2xLDXgB96Sb5c/DkBqnDKCQjvbGhNxnFk98yV1RSTOQzuqzxNyBPWc5zIafrV31bhXSebu5wxeGocIRhEvvBCYiVwDts+PCzHm1XSnLfOlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPm69sDucNqttJD9A0r5zXMOA5Ln3CP0phoraqzUc7Y=;
 b=b9l6axMUXLVDioOjRKZ49EmNCky7tXfu7AK4zyfd6hGqz/jKl1hF6xCRujbSuV7xP0LHCX3N/jjfr4poUj+2YUuRILFxV1j337vhmhBnp5MuK8V3P/u29o9jerkJmWX2i6RmflnWlIa322HMZvg+cMMwqmRqJdZOa+sW9HCDB+IZnYv7h2y9j29jdoHL6x8QqK2fDjJvqNk3l5e1dUvQNOgtVex8CyuFx/xk2hOrN0T1UsRbh5t6HKbS4J5TCDQzM+cIBB/LHPIVJMROikc5TccMHomSy0sAlLEMr/FBDQkoJGeLKAZBwrQZTlwpzbfmOdNDC4Qhg1vzovvrjC0c5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPm69sDucNqttJD9A0r5zXMOA5Ln3CP0phoraqzUc7Y=;
 b=SasACy077DGiV6ypqFIBwzdrXErauuGD9jy2kuhfViKrsLRC8rn4fg55no+Op3QhJgk+bLnG7NU5NZgC42GSuOhUcudL+FGCPEwjDlno4eplfsV8oJfsk9gbHvJ27UikMB8EN5j+MyN6OWxpQGrW7RKvjABDtAM8VMOHN9IQBxqyTIZKKD3VzOmPCsDO6nfMUtJpxET3+qMDPATtYra2CvV+dBkrVvOBAYPyY7Ri8sUnapUduSKgy2MxCZ/8ixjDlc3EPuU/ZlGggPP+GUJmz9/eQsks34E/7oCt1mITfGUwx7yd1AfWR4K6ovXPcnzGJSGaezmQ+G0zmMRWmezUqg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jbeulich
	<jbeulich@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb/YCHt9uHUQWtj0esBUS8Oj/ZKbRHS1IAgAARIYCAAAXwAIAAGL8A
Date: Mon, 28 Jul 2025 12:28:07 +0000
Message-ID: <f9a7884b-d58e-4ae7-b5ca-ce751ca70245@epam.com>
References:
 <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
 <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
 <5b4106be-bca9-4c82-bd55-41ada84c3b1f@citrix.com>
In-Reply-To: <5b4106be-bca9-4c82-bd55-41ada84c3b1f@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB9616:EE_
x-ms-office365-filtering-correlation-id: f1f4a015-d35d-4842-56af-08ddcdd2351c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b1hqMklVakZhZEtWZmlCSlRXTjdlMGhnQlU3Z0dJL1VpdzlYb1g2bVlWZXhu?=
 =?utf-8?B?NTRxQUVWZEZISDhxa1RiREhrMGZZRVRLTzFkeTMwQjZFcEVXd3h6Q3JlZElx?=
 =?utf-8?B?WDVzU1ZLcDVNdTdjc2VlZDA0R3crQ0RMZ3c3Q1d1dGg4Z2NmaGhYdTEveE50?=
 =?utf-8?B?Z3NHeU9xZ0V1Y29tNFpndTRWUFdwTTJMT21NZWl1dWFJdVlBcGl1SXBJQ2Ur?=
 =?utf-8?B?bWxCZGZOTjVUOVlidjhPZmdZOHMzRitoK2RrbUZCa1NFT0U0SGdlTEZJQkRT?=
 =?utf-8?B?bkg2V2xsYUh6VDdoVlRpd0l3WGFkdCsyWDlvSWJjdHE0V3VLSVRRY1QvODJt?=
 =?utf-8?B?Sno2c3JNRk5FbkUxekQ2bHpobU1GUGRtOGJzZCs3dHJGRGMyckYwMktDZDVr?=
 =?utf-8?B?cEpscDBsUXYwQldkaDRHNzRXbHJQK0xmRFBJaUxnQWY4K0NyS0JDVTJxajlY?=
 =?utf-8?B?a3ZKQnhMTXJQR1R4YlYvb09YSVo5d3VnQ1QzbkhoeDRveU5zVGQxQ0pSM1ZO?=
 =?utf-8?B?enNiWUIzWnVlUlhMSXRwUVpxMFRXdldidXZFeUJUUkJWT1p5OFcrNVFFMTJp?=
 =?utf-8?B?Zi9Penczdng2b3FYb3ozdmFxa20wNEszMHg1azIxcjVqZWNURW9WbVZtbDZB?=
 =?utf-8?B?Zk0vVlJVYVNSQmpxN24zeG5qTSt0VW5VMHFwamowbjNtODl2WEpXZGptaGNz?=
 =?utf-8?B?S1BPVzlrMkxsMDlyMzF6YWdSK0RMdWxBUFU5OURhOWx3WEIzZGVzTi8yZERG?=
 =?utf-8?B?N1lWVXQ4cFNPUVZCNm1BVFpDYkZNSHdoYmY2WHZrc213S2FjajR2bURkSGRu?=
 =?utf-8?B?UU1waXU4VnVYektTOXduWDNCQ25yR0RLT2o1UjVRT1RzS01SWW1PVDZkYVY1?=
 =?utf-8?B?dG1ObVJSUG1IcjNtdjBQcmRLKzhEN3FrY1d6ZHZZY0VZcFJKSUxXUUV3a1JR?=
 =?utf-8?B?TlNPZXZzb0xsUC9MWnEwSHJ6L1lDdVBiZVNWa2ZXRDA5eVBHSFNzYXJzSENO?=
 =?utf-8?B?d0d5NVpyYkdpUDA3WVRRN0x5OUZCU1JmNlRaRFp1QmdONHZxVlhhQ3FZa0lV?=
 =?utf-8?B?TUhOQnJWTUdXOXJkMm5xVnpZUlg0allDQzNYTGhhWFl5Y3UxV2g1REcwWENm?=
 =?utf-8?B?aXFkbUhBeEc4czFSaWlITWp4WlJRVi9uYUZ5RHJVdE5vdkJRU3NFZUFYeWo0?=
 =?utf-8?B?dGpIdEp3NGcvUEcra0RiZEJ1SnMxTERaWHVVUEozMXFHOG9sL0pPSmQvcEdt?=
 =?utf-8?B?dW1QNks4dFNDT2lOckx4SktyK2oxclFWcjB0QVZncmRtUzF4NFExWDNIVlZG?=
 =?utf-8?B?UVBDOEVzb255cERUNFBHNHJwdS81enZNL1c3QXI1OS9NZkg0YUFUMDBTNytu?=
 =?utf-8?B?QXljZEUzbHVmcEFsc2lKU0lhazdhKy96R2lURGUvVWhTdmlndURxc0hlbjh0?=
 =?utf-8?B?QytMcUlNQVEvSERTYmNZcDVMRU1lVlJaWE43QnRTaW5GbUZWcEE5TkhyQWRD?=
 =?utf-8?B?emhVRXAyU1I1Z0F4ZlgrK1JtYzlEV2JaUWV2UmlGVGZ4YTlmZVcySWlheFht?=
 =?utf-8?B?bzRtekt0SVNuLy9MWk5RQTdDMUZ2UGpmRXdSeVpvVVR3bVdCQkVValRTYVVu?=
 =?utf-8?B?aXpEUmhqNm9kMldrMDZoV3FSK29oUE1KbUVjeXpja1M3R1B4TnRXNzhSSEpI?=
 =?utf-8?B?ME9WcmFWT2dXV0x5UGRZRTZoM0VvYktTTlJFWG5vdVptY0p0RzMwZ2NtMUk1?=
 =?utf-8?B?TWF5TlhKNlBpV3VmVThiZDhBM0trRDhsY2IxQTJGM2w5THN5RG5iaUVwSE5v?=
 =?utf-8?B?ZG1EUlVkMVhmWU5YMVRsMUl0MldINERRWGFXc0tsQlNGd1VVakViZ1FBREdt?=
 =?utf-8?B?ZERyaWJnWElkN3RQamJDRUZJZGxubkNLMTV2eTUvUEE3SXVtN1dEL3g0UW90?=
 =?utf-8?B?K282RERFYU56VWtCY1ZNdldBUlcvaWIrTENNdUJKdERWOUk5cXlJaGtTamI2?=
 =?utf-8?B?ekNMUnVaZVlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXpQdnVldjlTZ2hrUVlCWkY1Rm5PTURQbDFEeEQrVDBOM1UrbzFxM3hSR2xk?=
 =?utf-8?B?bEFpcVRwSVV1TVZsTUVQQVQxNjluQTBXazhZWlYyUmNvYXZib1U2N1JvS0hH?=
 =?utf-8?B?K1E5enlpaDd3d0p6OEZhaVZ5M25aUjFudTVVRlNHRkkxUm5jSzVMK0JkSFI5?=
 =?utf-8?B?Sm1uZWlmdkRrWnVkeWxZd2ZhRllRWDFueEw5TzczcTYxQTl6c1VXZDU0bkFI?=
 =?utf-8?B?S3ZVaC9oQ25NaklWK3MyTHBqWFZRLzNidmIwV2dCY29xdVF2WDA2djNjbjhP?=
 =?utf-8?B?NzZ3eE5yeTMzQWYyQVdlY1RVQTVlaXJGaWhsWGpZbXBNZlpCU01SaGxPc0VY?=
 =?utf-8?B?MVY0ZmhtWk9qUG82RWZmazNZNThkYUxRY25BUmRnREZVQ3oyRzJYWkhzeURH?=
 =?utf-8?B?SjZyQXI3ekRNQm85VTJlclY5Tmw5QURycm9QcDl1a3dOdGVsLzBzWjh2em9I?=
 =?utf-8?B?bjNSYnhJYmtpYTk2Q0taM1Y5TjBFK0ZjbGVveXFqL0EzRFI2SHphVGNMN0JP?=
 =?utf-8?B?RktScGlnV01YRUpiWmdhQkFzWkxhOHdQZ2JCZFRkNGVRWnExbzBSYmpmQ3Nj?=
 =?utf-8?B?MnNXS0ZUR2xKcHJLS3lyaTcvV1Y0OVlZd3dzYWU3Q1FmRWVlK3RKVkZUTU9y?=
 =?utf-8?B?ZldnOVdtLzR1SXYrVERNMnRCNW51cm05d2NEK0hTa0J5eHpDdkwzV2prSWNJ?=
 =?utf-8?B?RThNa0F1UE91NmJIYjQ5UUhhTUtSanovY0ZuWm5wY21BZURDK3J5dHhGM1BJ?=
 =?utf-8?B?K2d4VkcwanBEYVJPdEVNdHBaS0hxRWhjTnVEMGNhUC9sNUdlRWFPVUYzb1g5?=
 =?utf-8?B?RzdVNE5RTFhEQ0g2c0FJWllkVy8zWDAzY0ZtS3NCS1R4TUs3ejF0Ym9neCti?=
 =?utf-8?B?RElwZy83aWR3R2JLcWQ3ZmpyWGo1MzlBSWFyQWJJV2J2Y1dVQUdxTjVkakwy?=
 =?utf-8?B?MmVyTHY2YTdXUU15dkFQSDBIbVp1RFBzS1J5TDhZTlE4ckpCVHFMYVZhanVu?=
 =?utf-8?B?U3paWENVRll6RStRa2piZGVpL2xyTmthWjA4aWF5N0F0SWR5c0REOWQ0TjZL?=
 =?utf-8?B?bUFPSm05RnNNSkRPSEVjVzQ2Uk9uVWg4elZ6WXZsVVJEWnhGVDZiN3BuVVE1?=
 =?utf-8?B?ODRMNlRxRFNnOS9tWTFvdE83TVplRjhVSGV3YTdMV3hHak9Sb2xVRGE3RmtO?=
 =?utf-8?B?QUQ5RjNDemhyWUtGQjIzODF1NkhkRFhlNTF1UDM3QkpqbDN0RThBWE0vSDJl?=
 =?utf-8?B?czVKdXdJUURVZVhCU0ltSE1CWi9IVVIzNmpKcWg3U243Vmh3VHJpdytIWlcz?=
 =?utf-8?B?QmFyT0lyRWlvNkQzTFpmelExbG1xUS91blJXOE1IRDl0cGpQYXR3S2J0NDZS?=
 =?utf-8?B?OG5tMFVDampkbnFhTkJmTWlpemVwNVVyTHcwUHJLRGkxRnN4KzRTNHFJKzZj?=
 =?utf-8?B?TjZNUGtwaDRicDRacFZVeklTWGNjY3c4ZDVCeFAwaHU3RzdSa2tiaThEelYz?=
 =?utf-8?B?czl5N3ZzbzBQSjJFcnJNejE5aXYxVUJTd2dqQS9WNFdHLzhZL0xNRXlFQnN2?=
 =?utf-8?B?aG4xVUlKUExVTDRKQTJBRk5BclZwQkJteGRKMEwydkhxTEtNY1UzUmZ4cDMr?=
 =?utf-8?B?T3RwaXZYT090LzNJS2pYUHZOOE1ZRkI0M1dUU3ltNVZmQnhkUDJGSnZrWXFu?=
 =?utf-8?B?bHFYSVJ1b2hQQ2F5NzNHbm8vTjRhSTFGMEdOZzVQV0tUaDJkb3puWHZlc1pa?=
 =?utf-8?B?M1hoazZkS01seWVsUG83UnE3NHd6YUplRlk0aXlwRTVvakxKMURHQ3ExYXlL?=
 =?utf-8?B?Q3gzNW54T29CVEtjcll2Q1VjQUE2amZ5cWtqZnNzNStSYzZQVHBtcVJvRy83?=
 =?utf-8?B?ellndkg4YlVmWnVlRE1MakR6cnp4VHZVZ0dycG5SaE5OOUh3K2xURVBaVDhT?=
 =?utf-8?B?bFdxeFZBSWtjSVZZMjFtTDZtRnRqUldCbUxBSXl0cmp0a2ZpMm9PUHB0c1Bv?=
 =?utf-8?B?d3hMR0g3OG5RU0pqZjlKMnRPVzN4NnpuRm45ZDBtN1dYa2lFeFR4Uk9WK0M2?=
 =?utf-8?B?bFVleXFCWlRpOEtwcUZHMEh6S3dwZHlWRnFtOXFxYXM0NDEzNmJnWVMxT082?=
 =?utf-8?B?eVVGNU5QR1Z1Y3FQajFEenZ3UU1WY3NobW5OQlRKZFM4MEl5L01wOUxNQlZO?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F38E0664831003408F2148205A9A2251@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f4a015-d35d-4842-56af-08ddcdd2351c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 12:28:07.3881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZ9yuztEPFxbxgzPQB91eEd4v/LJ+yBIaEvaZIdeWciHCz/R9dMyztJa7jpf6OTAeWwUvbbLcQsK0dibjDtE0XOjew+u1L3KAb8v5ss2+bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9616

DQoNCk9uIDcvMjgvMjUgMTM6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI4LzA3LzIw
MjUgMTE6MzggYW0sIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4gT24gMjAyNS0wNy0yOCAxMToz
NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjUuMDcuMjAyNSAxODoyNCwgRG15dHJvIFBy
b2tvcGNodWsxIHdyb3RlOg0KPj4+PiAtLS0gYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+
Pj4+ICsrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4gQEAgLTE0Miw2ICsxNDIs
MzEgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+Pj4gIMKg
wqDCoMKgwqDCoMKgIG1lbW1vdmUuDQo+Pj4+ICDCoMKgwqDCoMKgIC0gVGFnZ2VkIGFzIGBkZWxp
YmVyYXRlYCBmb3IgRUNMQUlSLg0KPj4+Pg0KPj4+PiArwqDCoCAqIC0gUjUuNQ0KPj4+PiArwqDC
oMKgwqAgLSBDbGFzaGVzIGJldHdlZW4gYml0b3BzIGZ1bmN0aW9ucyBhbmQgbWFjcm9zIG5hbWVz
IGFyZQ0KPj4+PiBkZWxpYmVyYXRlIGFuZCBhcmUNCj4+Pj4gK8KgwqDCoMKgwqDCoCBuZWVkZWQg
Zm9yIGlucHV0IHZhbGlkYXRpb24gYW5kIGVycm9yIGhhbmRsaW5nLCBlbnN1cmVzIHRoYXQNCj4+
Pj4gdGhlIHNpemUgb2YNCj4+Pj4gK8KgwqDCoMKgwqDCoCB0aGUgb2JqZWN0IGJlaW5nIHBvaW50
ZWQgdG8gYnkgJ2FkZHInIG1lZXRzIHRoZSBtaW5pbXVtDQo+Pj4+IHJlcXVpcmVtZW50cyBmb3IN
Cj4+Pj4gK8KgwqDCoMKgwqDCoCB0aGUgYml0IG9wZXJhdGlvbiwgcHJldmVudGluZyB1bnNhZmUg
b3BlcmF0aW9ucyBvbg0KPj4+PiBpbXByb3Blcmx5IHNpemVkIGRhdGENCj4+Pj4gK8KgwqDCoMKg
wqDCoCB0eXBlcyB0aGF0IGNvdWxkIGxlYWQgdG8gdW5kZWZpbmVkIGJlaGF2aW9yIG9yIG1lbW9y
eQ0KPj4+PiBjb3JydXB0aW9uLg0KPj4+PiArwqDCoMKgwqDCoMKgIFRoZSBtYWNyb3MgZW5jYXBz
dWxhdGUgdGhpcyBjb25kaXRpb25hbCBsb2dpYyBpbnRvIGEgc2luZ2xlLA0KPj4+PiByZXVzYWJs
ZSBmb3JtOw0KPj4+PiArwqDCoMKgwqDCoMKgIHdoaWNoIHNpbXBsaWZpZXMgdGhlIGNvZGUsIGF2
b2lkcyByZWR1bmRhbnQgZnVuY3Rpb24gY2FsbC4NCj4+Pj4gK8KgwqDCoMKgIC0gU3BlY2lmaWVk
IG1hY3JvcyBzaG91bGQgYmUgaWdub3JlZC4NCj4+Pg0KPj4+IEF0IHRoZSByaXNrIG9mIGdvaW5n
IHRvbyBmYXIgd2l0aCBuaXRwaWNraW5nOiBXaG8gYXJlICJzcGVjaWZpZWQNCj4+PiBtYWNyb3Mi
IGhlcmU/IFRoZQ0KPj4+IHRleHQgZG9lc24ndCBtZW50aW9uIGFueSBuYW1lcy4gSW4gZmFjdCwg
dGhlIHdheSBpdCdzIHdyaXR0ZW4gaXQNCj4+PiBjb3VsZCBiZSB0YWtlbiB0bw0KPj4+IG1lYW4g
YWxsIG1hY3JvcyB0aGVyZSwgaW5jbHVkaW5nIGFueSB0aGF0IGFyZSB5ZXQgdG8gYmUgYWRkZWQu
IEkNCj4+PiBkb24ndCB0aGluayBzdWNoDQo+Pj4gaXMgYXBwcm9wcmlhdGUgZm9yIGEgZGV2aWF0
aW9uLg0KPj4+DQo+Pg0KPj4gSSBhZ3JlZSB3aXRoIEphbiBoZXJlLiBFaXRoZXIgeW91IG1ha2Ug
YSBzaW5nbGUgZGV2aWF0aW9uIHJlY29yZA0KPj4gZW5jb21wYXNzaW5nIGFsbCBkZXZpYXRlZCBt
YWNyb3Mgb3IgeW91IGhhdmUgb25lIHBlciBkZXZpYXRpb24gKGUuZy4sDQo+PiBvbmUgZm9yIGly
cS5oLCBvbmUgZm9yIGdyYW50X3RhYmxlLmggYW5kIG9uZSBmb3IgYml0b3BzLmgpIGxpc3Rpbmcg
dGhlDQo+PiBtYWNyb3MgdGhhdCBhcmUgY29uc2lkZXJlZC4gRm9yIGJpdG9wcyBpdCBtaWdodCBi
ZSBhIGNvbmNlcm4gdGhlDQo+PiBhY3R1YWwgZnVuY3Rpb25zIGdvaW5nIG91dCBvZiBzeW5jLCBi
dXQgaW4gdGhhdCBjYXNlIHlvdSBjb3VsZCBqdXN0DQo+PiBzcGVsbCBvdXQgdGhlIGRldmlhdGlv
biBhbmQgc2F5ICJhbGwgcGFpcnMgZnVuY3Rpb25zL21hY3JvcyBpbiBmaWxlDQo+PiA8ZmlsZT4g
dGhhdCBhcmUgZGVmaW5lZCB1c2luZyB0aGUgc2FtZSBpZGVudGlmaWVyIiBvciBzb21ldGhpbmcg
c2ltaWxhci4NCj4gDQo+IEhvbmVzdGx5LCB3aGlsZSB0aGVzZSBleGFtcGxlcyBtaWdodCBiZSBk
ZWxpYmVyYXRlLCB0aGV5J3JlIGFsc28gYmFkIGNvZGUuDQo+IA0KPiBJIGRvIG5vdCBpbnRlbnQg
dG8gbGV0IHRoZSBiaXRvcHMgYWxpYXNlcyBzdXJ2aXZlIHRoZSBjbGVhbnVwL2ZpeGVzIEkNCj4g
aGF2ZSBwbGFubmVkLCBidXQgSSBhbHNvIGRvbid0IGhhdmUgYW55IGlkZWEgd2hlbiBJJ2xsIGdl
dCB0byB0aGF0IHdvcmsuDQo+IA0KPiBXaGF0IHdlIHJlYWxseSB3YW50IHRvIGV4cHJlc3MgaXMg
InRoZXNlIGFyZSBiZWdydWRnaW5nbHkgYWNjZXB0ZWQgaW4NCj4gdGhlIHNob3J0IHRlcm0uwqAg
ZG9uJ3QgY29weSB0aGlzIHBhdHRlcm4sIGFuZCBpZiB5b3UgY2FuIGZpeCBpdCwgcGxlYXNlIGRv
Ii4NCj4gDQo+IH5BbmRyZXcNCg0KSGkgQW5kcmV3IQ0KDQpQZXJoYXBzIEkgY2FuIHRyeSB0byBm
aXggdGhlc2UgbmFtZXMgY2xhc2hlcy4NCg0KRm9yIGNsYXJpdHkuDQpJIHdvdWxkIGxpa2UgdG8g
cmVuYW1lIG1hY3JvcyBuYW1lcyB3aXRoIGNhcGl0YWwgbGV0dGVycy4NCkxpa2UgdGhpczoNCi0j
ZGVmaW5lIF9fdGVzdF9hbmRfY2hhbmdlX2JpdChuciwgYWRkcikgKHsgICAgICAgICAgICAgIFwN
CisjZGVmaW5lIFRFU1RfQU5EX0NIQU5HRV9CSVQobnIsIGFkZHIpICh7ICAgICAgICAgICAgICBc
DQogICAgICBpZiAoIGJpdG9wX2JhZF9zaXplKGFkZHIpICkgX19iaXRvcF9iYWRfc2l6ZSgpOyAg
ICAgXA0KICAgICAgX190ZXN0X2FuZF9jaGFuZ2VfYml0KG5yLCBhZGRyKTsgICAgICAgICAgICAg
ICAgICAgIFwNCiAgfSkNCg0KQXJlIHlvdSBPSyB3aXRoIHN1Y2ggYXBwcm9hY2g/DQoNCk9yIGRp
ZCB5b3UgbWVhbiBvdGhlcj8NCg0KRG15dHJvLg==

