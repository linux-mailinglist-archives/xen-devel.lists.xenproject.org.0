Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F4D24DDB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 15:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205161.1519565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgNxn-00073A-Bj; Thu, 15 Jan 2026 14:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205161.1519565; Thu, 15 Jan 2026 14:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgNxn-000708-8T; Thu, 15 Jan 2026 14:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1205161;
 Thu, 15 Jan 2026 14:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+tl=7U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vgNxm-000702-1g
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 14:04:38 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff49d6d-f21b-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 15:04:36 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM4PR03MB11129.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Thu, 15 Jan
 2026 14:04:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 14:04:31 +0000
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
X-Inumbo-ID: 1ff49d6d-f21b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6KPTtrJoENOBo9Rr8ryteYYvtvjPYCi1wkTcGrpBTi5Nn5kFJgd1SnrlNviAESJDAWdrMtDrsva888Joc4a2oK8NXQIl3mlIZyzVN8r9WQitLG0DwyxW+ZDameL/NzPbBMK1JPVH8vS9QMB0lYkBO5vUWx0Gxh7UU3fx5GZdRJpP/kqykrReOnBGT961Zdi6ASLV5g1qN4sqF8nvAjL9V3X9hA0dRnROWw36iSzmMPlodCpHDmw0poHp/ChqOdFI3R7On5gpdm9MGde6tCpCPSowIzBjShdMI38sVH71AKlnSnSmoWno9Kd6xObsynuR+pgSWSpAPCkpK6MhN6uMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUryxahDtJTk/fDntRR+sditQ0dn1x83U5LY3cQKckQ=;
 b=e+Zp8kRIAhjfnA9mK/EgCJ2LQgVhN3NkKlqL1dr6JLRw9jJZkJTNv/VE/xsTk/gJUzy9Jyid924WJBiSdAT8Mrghj13rz+IVc/5/vRB5weYm3eGUNR3IA5651P2a7f7zSgGWdoDyJsn1ZpHVlgAq8qlhIMw3HJ3af72QIWbT753+RTReCLlrbsT7cQ0k275hHxd7853YxCqMx5pIYNg93OPgMCtMY91+ib3p357M/ZDRKA6gDMNSGFt+CP88hpa5sznuoWcmtBarRzbVMiFMQoIdohEuwJCh/1Iv4qrBJyOJ1xu/hvSukh7ZjsY3c/alOixcK1E5ywWRu9GLIj96GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUryxahDtJTk/fDntRR+sditQ0dn1x83U5LY3cQKckQ=;
 b=ldBBDhmmdXONcrBdgD/nm03Acaalyjsq1sphay2KZcNVm/wi63/VNQyxniYADijNly1JZ/3b6lpKgOcNud/JSQN4KYlzPrhKKKaqhfz74WKw3il6qRyIoBCF8QFvyXar34VYm+Z6m9AB3xV+0o14fGLq/8Fv1pvLLd+or3q+YV/GwvO5z6DbUZbJqMCfCQwwJ7ZNyYGAoKtdOT1XCFCYMD5xI/k0qpRmpZJqRAySL2TWrVxLSPpuj9BMLW2INYwX3QfYQhbIHFUIDnBprHblZD49Cmcgo0HxtoFQkaeU2uw1kJkHWjd4MfI6aFPSyh4KMy6KIelZXjOY4mBGp/sb0Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "penny.zheng@arm.com" <penny.zheng@arm.com>, "luca.fancellu@arm.com"
	<luca.fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: GICv4.1 support patches
Thread-Topic: GICv4.1 support patches
Thread-Index: AQHchifeIJuTyIWpjU+OJLTHHxG0NQ==
Date: Thu, 15 Jan 2026 14:04:31 +0000
Message-ID: <d13b19ca-ade1-46b0-bfae-0017d73c13c6@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM4PR03MB11129:EE_
x-ms-office365-filtering-correlation-id: f2e50d1a-d924-4785-b3ca-08de543f0187
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZERIMWNveUVxbXhGM0FYbUJpbjliZ0Q0VDd3QUkyZmk5ZndvYnk2TlljR2U5?=
 =?utf-8?B?amJ1cUJQVCtOK0ZjTVh2b0Y5V2pINHp2OTljc3VvWjVBbWc2THdYVGhvbndj?=
 =?utf-8?B?YXFhTUh0Ym0rMmVrdlR1dWpxZkJWeXFwRWNUOWZXRVVlWVdETkZCN3daQ1VY?=
 =?utf-8?B?WGkxVHAyOVJ5S1lOTG1oK2lTTE5JNU1KbWdWNjlMaWI5b0RmekR6aE5KMVVU?=
 =?utf-8?B?M2JiSzJrSWNrTFBDenVLTWIzbnlLTWZCNDhqeGdWTjF2YkdrazRhaWgrNVhx?=
 =?utf-8?B?MmRnNEdXSVZwL2RaQ1JWV0t4RVhYb2h4cVR6SHRvUHdkallvOEdKNzgyU2FQ?=
 =?utf-8?B?bVFoOFZDVStEWVBnSXBJTnUzdDNMcnh5Q0xkVFhrTGdJZTVoNWxQc3lqL3Rz?=
 =?utf-8?B?ZlczWUMzSWt0Ulc1VnJkcUVtMytoWUJKK0djMlpuRGJ2NEd6bnMrQ09VODFo?=
 =?utf-8?B?MkRVcWZIS3k4RDl3UlhmTnF1ODZXeVJKandoaHk1TTJzTVNhaitzcTFOOXRq?=
 =?utf-8?B?Q1VFSDJOMjVCMnFUTG9CWE8yMzZ1YUFyU2p4eXBvejJDRU9WVmc5UTRLOXZn?=
 =?utf-8?B?amRCNzhPVEZnaDRQazZhS0FnWTlBRFp4RFJMSWRVYzJ2YmtlUFBod3VsRVJ6?=
 =?utf-8?B?ajc0YktsQTBvTDVmWS9sdXBQN2lVN2Q0bUhBNkdib1EwVFM1cXBRQTVQaUxC?=
 =?utf-8?B?UmJLT1ZkUnFnakt6SitWWVZDZHV6dG9KVXpPSnp5aENYbEl6Tk50WU0xTjY5?=
 =?utf-8?B?MmR5ZVU3Mllnbm5HL29mTHIzSitYa2UzRkd1WHZiRlZSSXdOaDY1bUgyRkxX?=
 =?utf-8?B?dXpUQVFLOTlWcXdFbmRTbkJMT1g0bXBUVHpTbVVFL0dOTUFRNk5RMHM0L0FN?=
 =?utf-8?B?UTZySXR6alhpcXVEc3FaQnVsMlJPRFRaUFdoWi9nSzhYa2JhaitPeEJIUDkr?=
 =?utf-8?B?NEJYcTh1akY2bEIwbXhWeTVtN1E5VEJLNGl0YnhvQ0h1UzNtN1lGb0hXTnln?=
 =?utf-8?B?cWhRdW5tbUo2UXJPbnA3c056L1p1dWIvbzlyRVpuWjV1SldNbmVFUk9BV3lK?=
 =?utf-8?B?ZU9xVVI4UFo4UEc4MmpvSjFiQlhyTS9HeDlpMEw4YWYwc25Kb1ZmNXlXNlNp?=
 =?utf-8?B?TStzNlUrTThZRk1Ed3lFS2tyZkhyRnptTE54RVdCWXhOM3J6dHBMdHl1Mnd3?=
 =?utf-8?B?dEhiNHFhTjgyWW9DUjMrMXAyWWQ5Q29DZjNVQ2tzcFVvd0NFLy9EcyszaEtV?=
 =?utf-8?B?c1JLLzJlcjdsV1JtZUhkajErcDN6VFpRcERBbUtmRDl6VHFSeFNFQmMvRWJZ?=
 =?utf-8?B?RVFUSUVJREhodXdJUmhITExVY0h4OVcwN2dCb1ZDUklKSjNjbVRLb1c3MGNL?=
 =?utf-8?B?TFdlYmFsczZKY2xaeUpDeWNLTWk1c1pDUDNiL2dQdTh5bDRBbmRXWFdRTVNr?=
 =?utf-8?B?TGltMG1wS0VnYWMxOElIZjR5UVVCemRwWEowU2hZd0c2YmxybEplenpUdkRL?=
 =?utf-8?B?bFMxWmVHZTJWUVh5RTFMWC9Cd2xpVUViZlY5SEg1blpyYS9sWm5yb1J6Nmlj?=
 =?utf-8?B?akQ1ODRIbW9abzE4OXVMa1dDOWM4RVJRNDdTekJoOGpGeFAzSENsL3dZWGto?=
 =?utf-8?B?aDlhbHlqVitqZlpTbnI5bDNTVWZnSlNrdVJIWWJvUmU2RUFvTllZZlMzc0wx?=
 =?utf-8?B?bE5ua1F0UkJ3V1p1Sm1STGpTV0g4anpxczUyOWlqbHdXYURVNTRTQ29NaXBV?=
 =?utf-8?B?eW9QMWZqb1prUHF1dXhteW5Sa0JnNm90UXc3ZkNlTGlSZEZWMDdkMTVoMkZQ?=
 =?utf-8?B?SVZNcnV4Wm1JRkdBQS9lUVN6Q0R0Wkgvb3J6NC9CZlQvYVUyZ2xqa0JCeFRk?=
 =?utf-8?B?RWRxMjhKYkFRVU9EWC9ZYUFkUHBRUGZ0NUJLTkcwRnhaMUdrR1lEUUVIekhC?=
 =?utf-8?B?UFlybU9mbjRRNU1DTUE0d05XUTN2ZFZWenZHQ1FuVWRmaXJoZnN1UlRQZklV?=
 =?utf-8?B?WnJsNHpETy9NT2V3b2Z0ODc4bnZZTU5Vc3EzSjdJN21SUDUzazZ4a3Z5Zk0v?=
 =?utf-8?B?ZkI5VUw0djg4cXZyUXRoTy9JNHpKdTNzblVIeC9mY2FVdWduR0NZb2dhTDJY?=
 =?utf-8?B?RW5nS1RWOVRocURLTUR5L0ZrK21uM3VGdUw0cTZ5ODM1MUpwdEpUWVg0ODVp?=
 =?utf-8?Q?BNmGoqRaR+PoVNk9V4kKiK8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVpZSlVkRU0xSjltNGd3UU1OWGdDbWtmR0s2VWJtWHFPOXlZRklIemM4VDBz?=
 =?utf-8?B?RllWSkxUWk5ZOCsrMkZ6akxrV0o4UE5EVVp1OXIyRDExMmNITWFsWVNKZEdr?=
 =?utf-8?B?MW9oaU03TUozaEJ5K1haMEh1YVlFN3pGZW9UT0M4cWZUUVVLVGNoN1hTbFpI?=
 =?utf-8?B?MHV0TWhNMGp4S2tXV2FibEJHVk1KK1FDMHdNNkd2S1VZWWNIQXpObjd6YUxQ?=
 =?utf-8?B?WXhjV0N1ak8rQ0ZaQVVpbGNjSElEU3NQM3JteUcwUVNab3plMlVXbDRQcDBh?=
 =?utf-8?B?c1RXNVhJRTcwb20wbkhBQjNIRm9zWm1wcjNUMUU0NTltRWVKenZuZkc5VEhL?=
 =?utf-8?B?MkRjZUd6UlZ2cVdnOXNNWEttTWlUZnMxUUl2VTl1L2xvQkpZVFNydkRXVmd6?=
 =?utf-8?B?bEhVMDhQeW9oZ2VuMlptcVRCcytwdWw0ajBFbk5NZ1lZT0I3MS9heDhvWC9H?=
 =?utf-8?B?SlFTNCt5UDk2OWtCVUUybjRUb096YTdYcGZwZ2pqVXZzOHl5MlBXVGNzTU9Z?=
 =?utf-8?B?eTBpSE81ZG5GSUd0V1Zpb08zczlNMzl5enc3NHNkempwMXJNWmtTMXAxdkZI?=
 =?utf-8?B?ZGxsYnlWTzVRU3V1WDJmK01wcGt0TkJLRGlmMUYxYTRhSS9mZDhBdlpMNWZW?=
 =?utf-8?B?aG9vZVhhaWhLeEJQV2N4cU05US9uTW9YRzJiWnJRZUNXKzVTdmlnMWQxNDNB?=
 =?utf-8?B?VEs1MXpaWDhOQ3l3VzR0RDl3S3AxOG5mcnNFNU9CNTQ2eStSeUpUL2ZjVm5h?=
 =?utf-8?B?OUU2emdVRmV3ejJEUXpEL1JpMHhQbmhaSjl5V0xZVEZSd2xVM3V0L3FVcXEz?=
 =?utf-8?B?V21tY0dCRTB2YnVhMlkvNUJKd0lSMXQ4KzdicFFmampBeldUR2xwZ0Z3cWMr?=
 =?utf-8?B?WXVxVnNGWjBuWkEzckVCR01tR0toN0Vhb1FyTXp4U0FGSkkzNk5tTURpUGZE?=
 =?utf-8?B?R2dVQ2dZSzJDTmhnM2xDY1NoY0NuOUlsbFhYdjJNeVZFVXJYd1pDemo4c01K?=
 =?utf-8?B?MHFBSlNNZXlyUTArSVhjbEcxMjk1RDlJWTVUMG53ME13UDRFajBPMStLZjh4?=
 =?utf-8?B?UmVKRjJsOXlLN3R5NHcvVlNTRDdKUEdFaGZ1ZGFrVUw4ZFNSbDk5SXhlaWFL?=
 =?utf-8?B?SWFZc2R1M2ZGMG1rYnZHWDJFME5iOXNucEh1cG5zTHJoZ0N2ZklKNVF2dGVH?=
 =?utf-8?B?dnZNaGFKOVdYUDNkZUROZ0lpTWF1NWNzZklwNzlTRG9xSk5GK2Z3aS9rQ3ZT?=
 =?utf-8?B?RDhKQVdOcGRTUW0vL0QvRFU0YlFUT1J2aDVaYmxRN3ZFOGt4N2xSbktjOGxF?=
 =?utf-8?B?Q0tMWE51bVJIaG9qMzg3NytWYVBJQWFadkora01YWlhaMmVNU21hTzViL2JL?=
 =?utf-8?B?aGQ1bmpIeUhNNTIwdGs2OU4yQkVIbUlXVThUbXlGRFYvcXpPVExHS1dMMmRL?=
 =?utf-8?B?dHFOdEk5T290NWpid1U3UHlTNE81c0hja0NWTHlvTUhHTkcxUXFFN3FIN0xG?=
 =?utf-8?B?Q2V6M2h4QUVaVFVSVlZ5REJEQW8rcnFrNGIxT0ZFMXJHYlhSN0E0MVBsM202?=
 =?utf-8?B?a2lIbXYyMWlxSEJEcXc2ckExUjJxUFhYM2kzQjlWODVBTEE2SHRzVXBMTWQz?=
 =?utf-8?B?Z09hc2RNVlE4d2I3UnhIV3B1dVQxVHFOVHB0TkdNeDRESGorNEFyVXhvYnlC?=
 =?utf-8?B?SjZrY2haR2g4M21VNDF6NThmQVBiZDZZSGZkUFJWSVpxUUVKc0JGdzhjRVV0?=
 =?utf-8?B?L0w1M3BKZ3lTWmVQcHV3UkpObENjZWNERytpWlJZRWd4Zkh3Z0J2ZERQaEgx?=
 =?utf-8?B?Q3BqeXhGTFdEYXlhTWZyL2FTSzNlTzFhUlFkOFZEcGg0c1QzQ0ovTklkUFFj?=
 =?utf-8?B?N2N0OVh3LytWTHJkUnFSRkNVOTJBUGZLVWhNTnR2TG9jRGhJOW5ZM1hvMk5E?=
 =?utf-8?B?RExkakVjMzRKaUVzUzIvRU94Sm1sc3dOdEJvcWFIdHA5REdxUk1aZGVHVEgz?=
 =?utf-8?B?Q0xnREVtWGtON2djTHJVdVRwT0V1VFErL1RmWEJpL1ZTQjdUT201NWFEVWI1?=
 =?utf-8?B?bitXV3ZYRmdMb2F3R1orbjcwVHRUQlI4T3U5U2tBZTZvYkZlM21UbEtQZDVx?=
 =?utf-8?B?R2RvSVBTaFM3dmJtcmVzUFliSTdhekZOY2pod2lDMEt1NHlkTmVQNG54YlM2?=
 =?utf-8?B?cUN0dGNZb3NEd200WHoxcURHNmk0MUhNZDBTZ2tTQ2ZUNTczM3ZTeVBHR2Zx?=
 =?utf-8?B?TjFCcHJkbmlERVM4UExaOFY3WVpKVlZCaVdLL3dXVDAyNmI5bHo2VzYyZmVK?=
 =?utf-8?B?eUlkNHhBQmJuMDFBNFh2T0ZtaUxpZjBLcFhCb3RkMjYreTFleldtdlpPM1Vk?=
 =?utf-8?Q?Xx6H5GjYJR5J71xA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <745F3C9C631B764A8F4BD212D4A5B1AF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e50d1a-d924-4785-b3ca-08de543f0187
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 14:04:31.7933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXiQwOrFaPu67Usb7qAMQVSHLiWTGEXQjSDbv/POeCYrMRXqgTjql9XfyEjOd3Hhh0DbEm9f0tVcPjcWWFF9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB11129

SGkgUGVubnksIEx1Y2ENCg0KSSB3YW50IHRvIGJyaW5nIEdJQ3Y0LjEgc3VwcG9ydCB0byB1cHN0
cmVhbSBYZW4gYW5kIEkgaGF2ZSBmb3VuZCB5b3VyIA0Kd29yayBmcm9tIGhlcmVbMV0uIEnigJl2
ZSBub3RpY2VkIHRoZSAiVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIiANCnRhZyBpbiB0
aGUgcGF0Y2guIENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpZiB0aGlzIHN0YXR1cyBpcyBkdWUg
dG8ganVzdCANCnRoZSBwYXRjaCBiZWluZyB0b28gYmlnIGFuZCBub3QgcHJlcGFyZWQgaW50byBh
IHNlcmllcywgb3IgYXJlIHRoZXJlIA0Kc29tZSBvdGhlciwgbW9yZSBmdW5kYW1lbnRhbCBjb25j
ZXJucz8NCg0KQWxzbywgaWYgSSBlbmQgdXAgc3BsaXR0aW5nIHRoaXMgY29kZSBpbnRvIGEgcHJv
cGVyIHBhdGNoIHNlcmllcywgY291bGQgDQp5b3UgcGxlYXNlIHNwZWNpZnkgaG93IHlvdSB3YW50
IHRvIGJlIGNyZWRpdGVkIGluIHRoZSByZXN1bHRpbmcgcGF0Y2hlcz8NCg0KDQoNClsxXTogDQpo
dHRwczovL2dpdGxhYi5hcm0uY29tL2F1dG9tb3RpdmUtYW5kLWluZHVzdHJpYWwvYXJtLWF1dG8t
c29sdXRpb25zL3N3LXJlZi1zdGFjay8tL2Jsb2IvNGZjNDIwMWIyMWQ4YTBjZjY4Mzk1ZWRiZmFi
NGRjYTFjNjAwNDk1NS95b2N0by9tZXRhLWFybS1hdXRvLXNvbHV0aW9ucy9yZWNpcGVzLWV4dGVu
ZGVkL3hlbi9maWxlcy8wMDQyLXhlbi1hcm0taW50cm9kdWNlLUdJQ3Y0LjEtb24tQVJNLXBsYXRm
b3JtLnBhdGNoDQoNCg0KQmVzdCByZWdhcmRzLA0KTXlreXRh

