Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24E908256
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 05:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740330.1147384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHxLz-00039N-Tz; Fri, 14 Jun 2024 03:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740330.1147384; Fri, 14 Jun 2024 03:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHxLz-00036F-RF; Fri, 14 Jun 2024 03:11:51 +0000
Received: by outflank-mailman (input) for mailman id 740330;
 Fri, 14 Jun 2024 03:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLuH=NQ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHxLz-000369-1X
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 03:11:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5489efa-29fb-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 05:11:48 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 03:11:43 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:11:43 +0000
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
X-Inumbo-ID: d5489efa-29fb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/1rwMcORubOtJ+ozlC44yE5MGAfmSm0qiK+J4EwXJeJ6RUukJ9QF2aYEhO/VReQ3KImmOJsTW2pi2Qdo1N9vHZnhIDHk5H1hGiZNeJISbXcRllCPEWa+UawXOCyP8kerL+QNVmR7h5is/lUV4wqjw97xc/AeGZVtYpvthl8Wus+7MXR0zNPRFJ85stjNGffFaAvxVs84d5HyjJWoGZ4e9a2Pyphe6Kxen9pfcIjlHXHoEy70hi+Kf0klFfHZclC+njAp5hZLrSWThh3bDOLfFMbtgZyw39bsz2+JxdVto4s0pDahyOAj9OC9z7skQnpXckdmtfilhdBVJN0CeyeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTjKdXIljRw0k4xLpeVRBGmFVG5YT/vjrzgp9ae5AcU=;
 b=USCUdpSkuE9ARXtWdM5ISAWIrkqSuhl2AkRsAoqzEm1PfE1F9QhmoIsm31h3GqVhrGy6w5+NzgLo5LqQ7AcUi8Cx2BL5O+7YfALPpkjX2h/dkqzteJeSsOBcnTjtfz1uKb4oPI4kuFBSQZzWtOEeBKMHqAzw6y4juGgBSrqzO7gtpjp7p2Yb/m7IeLjB7BvG23s4wJCW1ej68WJlJpAhL1YhFODxnC4yG1GA55qiPsZqiF66I8nWKEAT4TAR8VYoOJnaTJTBgSop2X6EYwr3H0eC7GE1s7LB6KM6X6Z1WrPASA/fP3LVC/1pZ6J+Likkc6t3J7aiwNwEtNRbEinM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTjKdXIljRw0k4xLpeVRBGmFVG5YT/vjrzgp9ae5AcU=;
 b=JByyy6MIu8p39OPSSYNmvCrtDCl7+em/XZFBrikEPWaqgIghMJ/2GAjMlaYGb72Hg3tVyNj0+TJdyDW4i3xaDr5Y309FSwGK/Kj5AnOuRKs7eWVzukJhbuclB2HXQ15Qs00haLUXWoEm7KWtl7iJ1s3dq945MgMwnR7cWpx+KF4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHauLJn3FT0TCW9KkmRq1iRWqwBt7HCqQ8AgAG9m4D//5AdgIAAiWiAgAEvHwCAAW0dgA==
Date: Fri, 14 Jun 2024 03:11:43 +0000
Message-ID:
 <BL1PR12MB584926B7F6153287479E4CB4E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
 <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZmrrNvv2sVaOIS5h@l14>
In-Reply-To: <ZmrrNvv2sVaOIS5h@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6331:EE_
x-ms-office365-filtering-correlation-id: 96e28b2d-624a-4234-5b70-08dc8c1fb78b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230035|1800799019|366011|7416009|376009|38070700013;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXJNU2VoTDJkbjZNUTJtWlVXWE5nSi9IaEQrSU1xdFlQOHFGZmFGcjI4clIx?=
 =?utf-8?B?MnFkQVlHampwZGc3ZWFOdHdOOUllVzJkc1JPd1VSanlBNFJwcVRNZWdCVnM0?=
 =?utf-8?B?WkY5SjhwR1czTW5aTkVMMGc0RE9pSmNaS2ZJVEVOeTlMOVBYOU5OM1p3T1FI?=
 =?utf-8?B?UVU2L2VuNVRBQ0hDWUVoV1V3TkhmNUd6blJiMEd5WStmYmowK3MwNlN3NHVU?=
 =?utf-8?B?YWp0Mmwzckk3djZzTW9SVTNwaXd4Ykx6SXViR1hpNzg0aTByTjlLaXBZUmJ6?=
 =?utf-8?B?bkJxZ2UremJTaWNhWkUyZ2RWRWJURy9zOUNFMjdiSFA0aHFWdWd6MU9pOUgx?=
 =?utf-8?B?dUxvM2xwNnRIenpDS3RianA5NWFxLzNqeXBzUlpSQW5Oa1dOcmd3RXZ4WVc4?=
 =?utf-8?B?TXFqRld4cldTUVJzTzdzNzhtVUEvRTd1dk1QRkVFLzI2Wk5yYmllS3RPakRu?=
 =?utf-8?B?ek5YaW1aNWsvQmIwSEpJY1RwOWthMUNKTUc3RWFseVhuYjNUZDg4OXJtRVFC?=
 =?utf-8?B?ZFFoaEVBbjdML3ZmRDV2RVdDQTY5bTYzbU5LcTZSc1E3ZWVkTWx4bWI2NENw?=
 =?utf-8?B?QXAzbFZLenVXVm5hNjdRTnZvaG5LWDN3cW9vV0tZZ2prNFRyN1pESFBkTGFo?=
 =?utf-8?B?Ykx1Z1RCMVVNNURXY0JlMTFlb3ArRGEwUzZQRVRzbENIemNJbnlERGJSMUxI?=
 =?utf-8?B?OE5oUktNR01OUXJQU1ZBeG9YRzhZelpBYWxGVElhTEZ6R0tsUlRsM0tlNkdP?=
 =?utf-8?B?bUx5UDZTd3NiYUxZOVYvanJ5eEdzYzJqZkNpdmRlRW05RGU0WkxmOG9vck56?=
 =?utf-8?B?WW1WU3dZYmZ1UFBobWhaZDNDUnlYUUN1anNvR3h5eSt1YUYvcktYOUZFeloz?=
 =?utf-8?B?NC9ucjRNTkdCbVZCakt6V3drV01wOU5VeVFrdld4dkYyRnM5U1NYNmYrN09X?=
 =?utf-8?B?NHJmczY5MzBZMlZsSmxxMG9VOE93YzRLTGY4VFBoUjA1dURHMTRxR0F6S3o1?=
 =?utf-8?B?TWllbXpSS1BzMEMxWloweG5wVC9EeE1DSmM4SFdvZlVKbTJ6SjhibFdSeHY4?=
 =?utf-8?B?VVVRb0tpL2lzMmt5dVZSSzRVVGtad2ZlM1hmdENoa3NGVDBZK0xiWloxV2pp?=
 =?utf-8?B?ckJFOUFZYjZ0NFBDdzB0Vjg0TGl0Z3ArVDBsUEVhRmI0dUxZemJDVWF0UDBP?=
 =?utf-8?B?R3o4cVpzNDNya1BVai8vS2xoYmhLdFlHZUFpVGsxZ1Fmc2xmZmZXOThxdU1S?=
 =?utf-8?B?ckZITldqUG11NWp6TG9XbFdrZ1R6dGhzM2lWMWFVa083b3FkM3hiTFk4eEZH?=
 =?utf-8?B?ancwQlZXNmVvZjZMNlJOQjlCbEVuUkFTYjNHNFlXYWt2NTlDcG5wZFcyK1Vw?=
 =?utf-8?B?N2VnTStQeXU3aEczNWd5a1lzSm52UDM4ejBXWjdNczFKU3BRd21RT3NGSU02?=
 =?utf-8?B?RUk4V3hlMGF0ZFBmb1MrY2JyNVBSRGdZam5sR2w4d1lzV0tWN2hGMG0xR1Aw?=
 =?utf-8?B?UXpXOFR1OHV6V0pBY1hPL0h1d3lVMXFQRkFwanNGaVNtOVhaSnpZZGRMbUZj?=
 =?utf-8?B?Mm4vcHdFM1Y4ZllnRTdQa25GV2V5TEp0U1YwcldpRXZhWmhtajVXVWlrblgy?=
 =?utf-8?B?UlRTSjNmZXB0b05pYVFKMEMwaWNYUUZaZnc4NXFWVjVDL1F4eUdZWml3Rmsv?=
 =?utf-8?B?akxReHQ2L3pFT1FDWEFZVTl0QUVmenRQOFJ2TVQyLzBGdkJzY3daZFphSEpD?=
 =?utf-8?B?UG8vQVlhT2k4b1p0N1drMXJLbFVZNUpEcUs5cHpHM1VEdjVyUnBrbGhsNXEz?=
 =?utf-8?Q?GqcVLYuc8pJucRhMgdcQvh50t59fbWNP4dmJg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UndTdVNtZ25TanJJNkxpS1g4MDNPaGdtMDB2V0FSSVZsSTNLV0RHZ1U2SGFC?=
 =?utf-8?B?UlRibVF1alNVM1dnTHZyUGxiNzVuMFppUWN5bTBOV1VUMUtEaGtteVFUMmxJ?=
 =?utf-8?B?TTg2SXFZY2U2djkvMGtyK1hkL0hUVE85ZEMrWm84Y3p2QlZtbU8xalpReHpP?=
 =?utf-8?B?cTFDMVYwanhkN1l2T3dZbk5rM2U2ZmVMbXR5Z0dVRjA4eWlubERmSUVDem9n?=
 =?utf-8?B?cGk3NS8wK1BPUlFHK1B6VkQ2SDRXaEo5eDVmV0JWUERQcFVLOUVJQ2hMMGls?=
 =?utf-8?B?djRwWHJZT0djOUNINzBaL3Z4UEFKVkt3WlZWN2djUEU3b2pIS0xWS3RsSm9X?=
 =?utf-8?B?MDNNdzJ3TCt4Ly9vZ3B0Mkx1Q1JpTWo4d0NFNkt2aGdsbk9TY3V6K3I1N3Bj?=
 =?utf-8?B?QTZkWjRiMVp0T1VEc0sxU2FZZ2tnM3lSYzNDaTE3SStmZ3RIY2JvUy91aHV6?=
 =?utf-8?B?YW52YXJEbUQza2hXRCtFcXlUWnFHcm9COGQvL25GUW1uYUhmemdKSmhhbEdu?=
 =?utf-8?B?aGVQVktXSzdZckIvazA1OWt3dVcwL0VndjZBU0dnMGkzLzB5TWJKSi9obFBl?=
 =?utf-8?B?MDE5bVlDWkZwKzR1UTljTlFTMlg2NU1OeTRmQnFVOGpSSzhUVFhEY2E3VlRE?=
 =?utf-8?B?bytmdFRBbkFCT1VORDRSUXhFRS9LZDZXQWhFcWJrb2loakpLV3UyVWJYajNW?=
 =?utf-8?B?MVJqbzBaOXBYd0xvVnRGWG5RejNObUtkUXZkRGpsTnh4SlJ0ZUxSWEo4Rjdk?=
 =?utf-8?B?MUpuV3crWTRXWkFQR0RaRFhkQWE4WlJvZXVOeVpNTGlUcVhsU0xYY0s2aEtm?=
 =?utf-8?B?dUI1Y0NyOGtIbno5V05NYkxoem52VjI5VzJHMjJwaDRoU09nanNMOStzMjRW?=
 =?utf-8?B?V1VmRU9EekxTWkh6aElrd0JTRVByNGlxcTlJOUJyQTBQKzBTMWw3UVB3MlZD?=
 =?utf-8?B?b29XWlVxNGhGckpod3daeGRGNytzVFljRU12M29LN3laams4VlJXckZOdlEy?=
 =?utf-8?B?VzdDQmR0SEdrbUR1dk1mbmpXWkhRREs5TTF5LzVjK2p4QjZmS0RSeEdRaFdL?=
 =?utf-8?B?YlJYQVJ3bEprUnpRSHptcnNUNUxmYTQ0ck0zZVBPV0IyNitSaDNZWlZxYWFF?=
 =?utf-8?B?Zkd6Yk52RERpK3JlV0RwS1VjZ3o1Qi9IQ2VMaTZDNnR5VjJ3KzQyL2s0TVhT?=
 =?utf-8?B?K2JWakxJOEdoeUJIaUFPNVBnL1ZMRzkyZGRQQ0lKb2RpZEVEMzh2N0VwekVL?=
 =?utf-8?B?SmxIWVNkQWpxWWxmQ0dMdGlkWWYyUVlZbTNUcmF0aG53bnRCYmlWUytQcFRC?=
 =?utf-8?B?cGl2Z1p0ZGNGaXRWYzJhcjQ2cGt4ZkRrL05VZVMwWHpBdUxCakZUc0MrRU1N?=
 =?utf-8?B?WE9RZjNRWDRuVVNnU0tuVnRGc1RnTTVNdGZXSmplYW1TQVZpMEdzQnM0NUNW?=
 =?utf-8?B?eGxGNTJSNnF3UExvUDcyUldLTitwaG5HR2JpUzdSZDRHcFU4a0UwSkVFYWtE?=
 =?utf-8?B?aXE0VEhWTUxsWE02YzFhOGNvUmdqak5teWdEc2ZtKzJJWkd3TmExUTdkSE1t?=
 =?utf-8?B?L2xsNmVKczN2bEt2Q1RGbW1HNEVYUGFmb3ZzekRGYTVCb0oyK0JjeEMwcmlU?=
 =?utf-8?B?QldXOUpEdm9DQ01PeElncnlFWVowdXFoMW5iZmJzRTNtQktwTmQzTnY1cXRJ?=
 =?utf-8?B?WXFuZjlMMFI2NHc2d2ZBUG5mNDE4Uk43ZUdhODRtaVlTdlZxSXU5c1V1QUho?=
 =?utf-8?B?RHR6WDZwVWs4S013MzZhUVVFZWJacm43bEpJMFVraU9hc1ZkQWJ4ZDJzdWNB?=
 =?utf-8?B?U1hnK2YwV1NZMXQybUl6UEszR2FGY2xwNDVTL2N3OFk2OGRqaVd1TlZZdXJ6?=
 =?utf-8?B?emxpU1pEVjFZOFZGQ3FGdzB4R24rTTZIYVVSdDdERVdRdTJsUkl6K2UxNGRE?=
 =?utf-8?B?ak1Uc3NKQnBwU1FsTnZERGlqOFlFcFZ3M0VSejA3STJCalk4allZTHpQcEtG?=
 =?utf-8?B?NENOb1BKdlp0bGpsSTBiS1ZsZmNCbXBUaEV1UmhzS1NRRTFoalpkaG9jQU1O?=
 =?utf-8?B?UGhBVWM3MFlkYTRFY0l6Y3hwV081VVFGU1FIOVJXa3ZCMHNBcEM1MG1PYTB2?=
 =?utf-8?Q?hF8I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22BC7D97DAA6164FA8644633BAEEC9C8@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e28b2d-624a-4234-5b70-08dc8c1fb78b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 03:11:43.0695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fe962HF16K5F48o9z7z7OVzlk2i/UbZJpAp7u+506WYJPS1sMBW6OkMS+bcO3Bqbmc2GFDOAaDyRpRvqqJ7JsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331

T24gMjAyNC82LzEzIDIwOjUxLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gT24gV2VkLCBKdW4g
MTIsIDIwMjQgYXQgMTA6NTU6MTRBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24g
MjAyNC82LzEyIDE4OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI0IDEy
OjEyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjQvNi8xMSAyMjozOSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wNi4yMDI0IDEwOjExLCBKaXFpYW4gQ2hlbiB3cm90
ZToNCj4+Pj4+PiArICAgIHIgPSB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oY3R4LT54Y2gsIGRv
bWlkLCBnc2ksIG1hcCk7DQo+Pj4+Pg0KPj4+Pj4gTG9va2luZyBhdCB0aGUgaHlwZXJ2aXNvciBz
aWRlLCB0aGlzIHdpbGwgZmFpbCBmb3IgUFYgRG9tMC4gSW4gd2hpY2ggY2FzZSBpbW8NCj4+Pj4+
IHlvdSBiZXR0ZXIgd291bGQgYXZvaWQgbWFraW5nIHRoZSBjYWxsIGluIHRoZSBmaXJzdCBwbGFj
ZS4NCj4+Pj4gWWVzLCBmb3IgUFYgZG9tMCwgdGhlIGVycm5vIGlzIEVPUE5PVFNVUFAsIHRoZW4g
aXQgd2lsbCBkbyBiZWxvdyB4Y19kb21haW5faXJxX3Blcm1pc3Npb24uDQo+Pj4NCj4+PiBIZW5j
ZSB3aHkgY2FsbCB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oKSBhdCBhbGwgb24gYSBQViBEb20w
Pw0KPj4gSXMgdGhlcmUgYSBmdW5jdGlvbiB0byBkaXN0aW5ndWlzaCB0aGF0IGN1cnJlbnQgZG9t
MCBpcyBQViBvciBQVkggZG9tMCBpbiB0b29scy9saWJzPw0KPiANCj4gVGhhdCBtaWdodCBoYXZl
IG5ldmVyIGJlZW4gbmVlZGVkIGJlZm9yZSwgc28gcHJvYmFibHkgbm90LiBUaGVyZSdzDQo+IGxp
YnhsX19kb21haW5fdHlwZSgpIGJ1dCBpZiB0aGF0IHdvcmtzIHdpdGggZG9tMCBpdCBtaWdodCBy
ZXR1cm4gIkhWTSINCj4gZm9yIFBWSCBkb20wLiBTbyBpZiB4Y19kb21haW5fZ2V0aW5mb19zaW5n
bGUoKSB3b3JrcyBhbmQgZ2l2ZSB0aGUgcmlnaHQNCj4gaW5mbyBhYm91dCBkb20wLCBsaWJ4bF9f
ZG9tYWluX3R5cGUoKSBjb3VsZCBiZSBleHRlbmRlZCB0byBkZWFsIHdpdGgNCj4gZG9tMCBJIGd1
ZXNzLiBJIGRvbid0IGtub3cgaWYgdGhlcmUncyBhIGdvb2Qgd2F5IHRvIGZpbmQgb3V0IHdoaWNo
DQo+IGZsYXZvciBvZiBkb20wIGlzIHJ1bm5pbmcuDQpUaGFua3MgQW50aG9ueSENCkkgdGhpbmsg
aGVyZSB3ZSByZWFsbHkgbmVlZCB0byBjaGVjayBpcyB0aGF0IHdoZXRoZXIgY3VycmVudCBkb21h
aW4gaGFzIFBJUlEgZmxhZyhYODZfRU1VX1VTRV9QSVJRKSBvciBub3QuDQpBbmQgaXQgc2VlbXMg
eGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uIGFscmVhZHkgcmV0dXJuIHRoZSBpbmZvcm1hdGlvbi4N
CklmIGN1cnJlbnQgZG9tYWluIGhhcyBubyBQSVJRcywgdGhlbiBJIHNob3VsZCB1c2UgeGNfZG9t
YWluX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50IHBlcm1pc3Npb24sIG90aGVyd2lzZSBJIHNob3Vs
ZA0Ka2VlcCB0aGUgb3JpZ2luYWwgZnVuY3Rpb24geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uLg0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

