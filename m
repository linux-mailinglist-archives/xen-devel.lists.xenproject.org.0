Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C3AC0457
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992890.1376373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHyy5-0006Mz-DR; Thu, 22 May 2025 05:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992890.1376373; Thu, 22 May 2025 05:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHyy5-0006Kv-9u; Thu, 22 May 2025 05:59:49 +0000
Received: by outflank-mailman (input) for mailman id 992890;
 Thu, 22 May 2025 05:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ydy=YG=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHyy3-0006Kn-SN
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 05:59:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5192031-36d1-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 07:59:44 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.31; Thu, 22 May 2025 05:59:41 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.035; Thu, 22 May 2025
 05:59:41 +0000
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
X-Inumbo-ID: f5192031-36d1-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I167EzEwUjGcxlazB4KH6YRgJ0hBkrCf97T2Tl7nqlblCyxvWhdfWvlo2IqmxynHMCeCHfbOIOQI5cEdd3z4cG5nOTDzA3WrLsmMqizeKAbPrPqvcXwaJJFjUoyUhfV48CE5x1ustTuTF3JU8LRsL0O60k04fkWV6gwQ0R76T9MsR20/PYFGbODDSpMg/LHolOBLPgoL7iS7YH2z/RgRkxrtA7kYPjWvqq9DnFnhWoOmGP9LEZdEOaZBbVpcO1gyez4aLYK5Ok4NMwKexhWZpAMY/60h7SxyCIfEQOoTIINEU0EJR8eKgz/1YKSycgh7kX/PikqPF/5CAf9jzC7Ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URqgedpDIipbImUzPk3jV2mGpeB3OInPHgAlaLmnlrE=;
 b=ZN9oZInW9bqtLXs2ZHshcDHaa/BFms6XinuC20kPCvpyERPNGDm0pdZzguoB+T3Ku1kBfnD/e63aAOuPuU2BxcKWUVoM1wNaHcQCSPOJXLx2R78ey2eEQDTHeDTCwHxZ6qXAlV4iwa9ZvnPwC6ldWVttJ1y6g0sjQxp2g80tbeHVQXFIznDb7LIPAXYlp6lQkw2gl+hKobVKJoxy3+kASLFNziUYl79CV0UUykUOV9jaU4hiPobJb3EgxDHiVW9YjKlg1Hpx8FaCuRNG652AHq99EGczQjoco9OMyW69MfonInsy3/+LEX0sXpP3TbJcT0+kSmHobn6QSP8JXas9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URqgedpDIipbImUzPk3jV2mGpeB3OInPHgAlaLmnlrE=;
 b=lx35ycu1FzcAhMNNTdhJ6HLW3Xd3Wg8AwEGI1jCsvMWeZdxTIN4YiKOXS/iHOcZYYlmrgyvo3peqM8HYszI9lfjPspfNk81vTHmW7Sw6v88APjRT59PUCZU/00QlCB9lbq5v2KPwqPSRNI3V/PODnzc8DDPdmKVrJqVbvIxLzb8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHbrRCy0dvLnopz7kONlcDKiL+9s7O8Z2mAgCH2THA=
Date: Thu, 22 May 2025 05:59:40 +0000
Message-ID:
 <DM4PR12MB845151DE494A9E7EF888E402E199A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-16-Penny.Zheng@amd.com>
 <239e1256-a47d-44e1-a335-2199b880f5d7@suse.com>
In-Reply-To: <239e1256-a47d-44e1-a335-2199b880f5d7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7d81e07e-7a48-4427-8fad-24b268d87197;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-22T05:59:33Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB8501:EE_
x-ms-office365-filtering-correlation-id: cb353a97-429e-422f-6b52-08dd98f5d7d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VE1OWVlrOFYxRWNqWXkrYUFqZS9qSmlBQnZZZzRuVVJaU0xTYU54Zkdyc1la?=
 =?utf-8?B?bmYvNnBLSHVwOWNXYjRrZWp5VEpLYS9hQU1JVmVWdXBaQzhTSUlvL3cwaVZM?=
 =?utf-8?B?OGJ4WnoySi9aeGp4Mkx4dmN2WVN0M2tHSjNaMzV6RVlrNkpoRk03QitNdG1X?=
 =?utf-8?B?N2o2eHpQQlZ2SWE2RXZjYjVnQnB4cEVLMHVUK0w1UFMzN3FyeHdrQVJPUmRO?=
 =?utf-8?B?SXJWaFdYaDNnZmRMbmxhZmZPWTNDRklVaU5HSmM1cjN2dERpZFhUMzlWdlpv?=
 =?utf-8?B?VHVjczZBOXhGK0tZWVA5VWZDcGFKZFpualNodDJMTEJ6UUllWlc1UjR1WW5a?=
 =?utf-8?B?ZldhUzBJcnhONmwrUVphWkc5YjBOdXRHQmdGL1NQNlZSOVdVTnY5alJJZ3d4?=
 =?utf-8?B?ZWY4SElmbHU3SDVLbFFZaGViVkNtNGwrNkpubnA5VmM2clM1OFc1LzhQczQz?=
 =?utf-8?B?NnFNajhVU0lkcDU2T2VzdDQ0Z0tiMjJDNEpnUWpmcmRYQTc0NHlpK21vLzBS?=
 =?utf-8?B?L2Q3T0MramRDcm5sZ1JYZnY4VWN0a21SZ2RsN3A0cVI0STZyaDIrVUlNazV6?=
 =?utf-8?B?WDhweENrTXV0cUE2YU14MG9pdHk1VFBVL2pnNjg4aGRiZlNRNmJic09HdXds?=
 =?utf-8?B?bURja3RGMU9sRWMyY1JJMU4wL3ZmQWJNY3RvTDFxMGNLaUtlVk9nTVF4R0N6?=
 =?utf-8?B?NnkvNVJwdjU5czhuY25WQUhsT0d5dTVUZHZ6V0t4a0NaV09YcHZwdDFYUVFM?=
 =?utf-8?B?V2Fnb21HRWMwREpVREZwOWNuR241UWJxZCtWclJFZXVEKytHS2hEV2RudC9B?=
 =?utf-8?B?YkxPVnBzSDhWNnVPUXRIcjBPN3BXYXNLK0VzOHJleVhldXBiZmFONWxhR2ZW?=
 =?utf-8?B?YnpWMVpBSU5FYXVPUVFpOXlZSDkxSThCTWp5TC9xRGhqSG1GVUlsUDBSOHo3?=
 =?utf-8?B?M2U0U2pvSEFYT3M4UFRDY2RNZUNXTjVHTUNVSXQ2a0pJcDFLT0dnc0I2djdj?=
 =?utf-8?B?WUJWUXVZRWJNOVkxd3lEaHZKQ3g5RWIycHYwQ3lucWlIdUM1KzhMRUZhbGJh?=
 =?utf-8?B?V0g4UFhWbFA1a2NkZ0VTaVBYSlhuMjZ1ZVdrQnlJYkh2eTNHU01ZYkQzZlJw?=
 =?utf-8?B?emkxcWlrZytPQy9BaVVRam5hbU1WZmlRSnpsUmFZQ3pjWVBtM3lUaUc4RGUv?=
 =?utf-8?B?MnFvQk01bS9TQ2NOZHhiaURGdzFIZm1USk1NVGlqR3lKelNNdDhncDBCelYy?=
 =?utf-8?B?b2JqVk9oTDZ2YXVTWjByLzRlUEtFeTdjakdYQzF6TGFnOUdoazgvaWtrTEUz?=
 =?utf-8?B?S0hacCszTklIRzh0dmphYm1Kc3RzSmgxWkFiQmJ2enNYQnR5bmlyWjR6ejht?=
 =?utf-8?B?Ry9zK2tRZG5mVTJBdm1oTDNHZzZQNmN3NHB3SW1JazEzdm1vN0VqZWlISEhW?=
 =?utf-8?B?MFg1QlEwUGhsc1p5ZEIxRkE5T2NKVElaRUpFRCtNL2pDVXBUZGR3TlFhbm1F?=
 =?utf-8?B?OW0vTnZza1lOeG1Oczc5dzlRQ29sTVJGVmpyZ2t3TzlFNTZndHcvV3JNVldr?=
 =?utf-8?B?S2dYUGRvRkROd0NhaGNTcjhYMW9QWlFuYVNpREREbDJpcVg5WHBBVWJENXcz?=
 =?utf-8?B?VHAreStPcDhkZ1REVUVRQkR0cWV1RXBIOXRXUWE4aGVrWThoQ1Q4bEdnYmhZ?=
 =?utf-8?B?RmRwMW8xZnJoeG5mZ2kzdXhEbnhveWxkeE1BdWhYdFcyalhwNVdCNzU2YlFC?=
 =?utf-8?B?SVdBNmpIeHVNK0FBZVFSSzh3Z2M3NndnVUFRZEUwbUxRQUtURXpmL2t2YzI2?=
 =?utf-8?B?akJ0MjQvVDVXb09IZHN5MzNMNzJBUXY0S3VkemIyRjFqTlEvSy9vWnNUMlh6?=
 =?utf-8?B?K0NvRTErMkdUVkMyczRTcmFyZmxYd2FBNE5laWs5Sk5vclA3RGNVM08wNERl?=
 =?utf-8?B?N2c5Y25TZWxUZHhvN2RpR1VhQm5JOTRmZlFUaWhCdWlwUk9CdDhJRXI5ckp1?=
 =?utf-8?Q?Eb7DIUhO7xXS7I5avDl8z+8JVf/93o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VSt4WkVIa1dZUmYycXZvczU5dkRuR0pTTE5ZazQvWUR1SzZoYlpneXZFeWpO?=
 =?utf-8?B?OXdEcFUwVDNDR0owMFVISkpaY09SRjJuVjRyeFFpK3daaUxoOWxrQ1ZRVVIv?=
 =?utf-8?B?VWNlMG1DTXpUaUU1MWdETm9Bb25yMVJUV3gyRVNZa2EwSkduZENheWJOMEpM?=
 =?utf-8?B?b1RyaW5POXVJdHhuZGg3YU9WdUFtamhVWklGdWJxVzFMRi9tcXRtblVrWjN1?=
 =?utf-8?B?V20yb3A5V0xZWkVNTkUvTUlZb3N0ZWRHRTZReG1TQzZLUTR3cUpna1NhWk5p?=
 =?utf-8?B?RGhqUEh0blRvZUdmTlBKcmtzaVl0b0RCOVlsSk5zdXV0VmtBVjJDNS9FVVh6?=
 =?utf-8?B?N2RuR3Q0QWZTcEpuQXZSSEd6S1RvMC9raDlHclMyUXFtQ015NENPcWFHMk9n?=
 =?utf-8?B?WGZxb0pWYWErdzVjdnFUOWRGb2RiS2RPWlJ3OXMrdUNrdEFYMFpHclZDdktt?=
 =?utf-8?B?MTdTd0k2WkI2ZjR3RTZPYXpqWGRwakY0NVB1MXpoNEZwampyazYvSTRsMElm?=
 =?utf-8?B?SmpwUitXNE5lNStSa2FhTXZBeGNpRzlLV2t3RllCZjZ3b2tka2VyUkxDczhU?=
 =?utf-8?B?S3d3ZFAzT29HaDBpRzV0M0tLRU1way9UNjRjVFF5bE1aMkJZLzZNeUl5UEJo?=
 =?utf-8?B?UGhsZ3pEYW5wYWhGV0IvWWE4dXErWDhLaWpVS0s0TnI3VERQQ0U2YnVoUi9Z?=
 =?utf-8?B?V25BejBESDhzZWp4ZkdvMHBQRTZXOXp6enVNSXJxd2JENGM3WmFxYS9GcUEw?=
 =?utf-8?B?Nmo4S2ozcEptcjNTYnptclowdUU2YTRva1NEVVc0V3Y4bGpBUkhQclBSREdm?=
 =?utf-8?B?UktQSHFlSWRUQzFFVlFrdlhCM0pTaEVUTGc2RDN3d1NWc0lkWmVISGFGQ0Ji?=
 =?utf-8?B?bWR1Zi9tTHRJWjNJN1hwNUR3K2o3VU1jN1BkT08rOVIwK2w4SUJrdnNNMlUr?=
 =?utf-8?B?eGVmU3QrOUJ4K1kzVjBORnl6WWNxRjNYOU9sMm1uNS9NcFIrQ21MTlpRT1Nl?=
 =?utf-8?B?bVF0SjRkcnpvSFd1ZWhwRldXb0F3dmJzYm00NFVCenZmZDIyRWRMa01DOEwr?=
 =?utf-8?B?REhxaVJ3NEI3VXcvSXJhU0NaL3c1WmhlYlZEMEw3ZW54UnRYRlZBYUE0STNX?=
 =?utf-8?B?YXcvWGJsT0IrNzNtUnNCc041YU5leExGZVNWV1FSbm5UMzZxaVcwMnNMNXpn?=
 =?utf-8?B?V0ZLNnhESlZWWkFQbFhYTjJiMktJeXJYSzlmVDJTMTErNXNrUTg3RHNtMDdv?=
 =?utf-8?B?Q3M2TmFwM3J6K0FHM2VFTmZ3cGdiMHB0aTNRUXlDb0dRQnlaVHlmZmVUMTBz?=
 =?utf-8?B?ZjZEVjNpTlBEUnBHdlg0OERHQzhycDdRTlhkODZpclljRlgyWklIaDBRdjFp?=
 =?utf-8?B?SFNGM1BEUFU0Q0M1YUdFb3krWTR6b0VMTkJIaVg2UWd0dnBoeUIzdDdVNmFy?=
 =?utf-8?B?VmdzSlNDbEN4bWphMFAwRjV4MlpENjVsZlN6WlhyYnRxSUVRMHRRT011SGNT?=
 =?utf-8?B?VkZXeTA1K25BNk9LT2FDazdqRFlPY3RYcUlIZWlvQ09nSEdTeThjVS8yVFhp?=
 =?utf-8?B?bW03dmZ1SEY4MHdrbmp5OTFpMzAvQ1BMckN3SG9hVnRZVmlWL093eHN0empG?=
 =?utf-8?B?V2FzNlZiZENiWW9BOEIvQkI0Y3NMajR4MmtkbE5nbmk5cGhaeXdZOGpHcitJ?=
 =?utf-8?B?ckxGd3ozNHpIUjVLZWxKdW1Vc29VblFQZnZFN05zTGFlakVhVG96YUFEcFBs?=
 =?utf-8?B?amZWUUcrVnZzMFRCR0E3dVFYSkd4RkF0QkxNNGNmdzhFMkRUZUh3YkJUMEM5?=
 =?utf-8?B?eHh4YkZ4M09kRWd4NW1Ec3lsVUJQd1FsdXdSVldqUzRJWG55V1dlcVJvN0Fm?=
 =?utf-8?B?bGZYZlp1eitHRFJ2N2pweG9VQTJEQjBJNmFrSWhsQW1hdVJEUHZBVkZ5b3Vv?=
 =?utf-8?B?Y3dHWGVwREI2bGRTQ2JibVlpUGNiTkRqU01McVpxRVFHV2tIbmpodDhRbmNW?=
 =?utf-8?B?dUNNcENuOEpaa2NKdVp2c05nOElpOXZlT2doZFMxdUI1TWZiVEpreEpsTmJC?=
 =?utf-8?B?amk1TGxuZkNTREJiMXZyRFpTTjFqeGZRL1ZDNWtaMFdiZ0M2NWF3Z2d2U2gz?=
 =?utf-8?Q?Rac8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb353a97-429e-422f-6b52-08dd98f5d7d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 05:59:41.1537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwodT9Av2mtDzDlj/aGn4alIU2DJhZ685J7hXx8pjlX1BDdR8SB/73XiYexuK8WqGBz0kK6B6ap2GXNVBHIh1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMzAsIDIw
MjUgMTE6MDIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY0IDE1LzE1XSB4ZW4veGVucG06IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBD
DQo+IHhlbl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAxNC4wNC4y
MDI1IDA5OjQwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiArICAgIC8qIE9ubHkgYWxsb3cgdmFs
dWVzIGlmIHBhcmFtcyBiaXQgaXMgc2V0LiAqLw0KPiA+ICsgICAgaWYgKCAoIShzZXRfY3BwYy0+
c2V0X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfREVTSVJFRCkgJiYNCj4gPiArICAgICAg
ICAgIHNldF9jcHBjLT5kZXNpcmVkKSB8fA0KPiA+ICsgICAgICAgICAoIShzZXRfY3BwYy0+c2V0
X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfTUlOSU1VTSkgJiYNCj4gPiArICAgICAgICAg
IHNldF9jcHBjLT5taW5pbXVtKSB8fA0KPiA+ICsgICAgICAgICAoIShzZXRfY3BwYy0+c2V0X3Bh
cmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfTUFYSU1VTSkgJiYNCj4gPiArICAgICAgICAgIHNl
dF9jcHBjLT5tYXhpbXVtKSB8fA0KPiA+ICsgICAgICAgICAoIShzZXRfY3BwYy0+c2V0X3BhcmFt
cyAmDQo+IFhFTl9TWVNDVExfQ1BQQ19TRVRfRU5FUkdZX1BFUkYpICYmDQo+ID4gKyAgICAgICAg
ICBzZXRfY3BwYy0+ZW5lcmd5X3BlcmYpICkNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiArDQo+ID4gKyAgICAvKiBBY3Rpdml0eSB3aW5kb3cgbm90IHN1cHBvcnRlZCBpbiBNU1Ig
Ki8NCj4gPiArICAgIGlmICggc2V0X2NwcGMtPnNldF9wYXJhbXMgJiBYRU5fU1lTQ1RMX0NQUENf
U0VUX0FDVF9XSU5ET1cgKQ0KPiA+ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gPiAr
DQo+ID4gKyAgICAvKiBSZXR1cm4gaWYgdGhlcmUgaXMgbm90aGluZyB0byBkby4gKi8NCj4gPiAr
ICAgIGlmICggc2V0X2NwcGMtPnNldF9wYXJhbXMgPT0gMCApDQo+ID4gKyAgICAgICAgcmV0dXJu
IDA7DQo+ID4gKw0KPiA+ICsgICAgZXBwID0gcGVyX2NwdShlcHBfaW5pdCwgY3B1KTsNCj4gPiAr
ICAgIC8qDQo+ID4gKyAgICAgKiBBcHBseSBwcmVzZXRzOg0KPiA+ICsgICAgICogWEVOX1NZU0NU
TF9DUFBDX1NFVF9ERVNJUkVEIHJlZmxlY3RzIHdoZXRoZXIgZGVzaXJlZCBwZXJmIGlzIHNldCwN
Cj4gd2hpY2gNCj4gPiArICAgICAqIGlzIGFsc28gdGhlIGZsYWcgdG8gZGlzdGlndWlzaCBiZXR3
ZWVuIHBhc3NpdmUgbW9kZSBhbmQgYWN0aXZlIG1vZGUuDQo+ID4gKyAgICAgKiBXaGVuIGl0IGlz
IHNldCwgQ1BQQyBpbiBwYXNzaXZlIG1vZGUsIG9ubHkNCj4gPiArICAgICAqIFhFTl9TWVNDVExf
Q1BQQ19TRVRfUFJFU0VUX05PTkUgY291bGQgYmUgY2hvc2VuLCB3aGVyZQ0KPiBtaW5fcGVyZiA9
DQo+ID4gKyAgICAgKiBsb3dlc3Rfbm9ubGluZWFyX3BlcmYgdG8gZW5zdXJlcyBwZXJmb3JtYW5j
ZSBpbiBQLXN0YXRlIHJhbmdlLg0KPiA+ICsgICAgICogd2hlbiBpdCBpcyBub3Qgc2V0LCBDUFBD
IGluIGFjdGl2ZSBtb2RlLCB0aHJlZSBkaWZmZXJlbnQgcHJvZmlsZQ0KPiA+ICsgICAgICoNCj4g
WEVOX1NZU0NUTF9DUFBDX1NFVF9QUkVTRVRfUE9XRVJTQVZFL1BFUkZPUk1BTkNFL0JBTEFOQw0K
PiBFIGFyZSBwcm92aWRlZCwNCj4gPiArICAgICAqIHdoZXJlIG1pbl9wZXJmID0gbG93ZXN0X3Bl
cmYgaGF2aW5nIFQtc3RhdGUgcmFuZ2Ugb2YgcGVyZm9ybWFuY2UuDQo+ID4gKyAgICAgKi8NCj4N
Cj4gSSBmZWFyIEknbSBzdHJ1Z2dsaW5nIHRvIHBhcnNlIHNvbWUgb2YgdGhpcywgbWFraW5nIGl0
IGRpZmZpY3VsdCB0byBzdWdnZXN0IHBvc3NpYmxlDQo+IGFkanVzdG1lbnRzIChhcyBJIGNhbid0
IGRlcml2ZSB3aGF0IGlzIG1lYW50IHRvIGJlIHNhaWQpLiBQbHVzIHdoZXJlJ3MgdGhlIHRlcm0g
VC0NCj4gc3RhdGUgY29taW5nIGZyb20gYWxsIG9mIHRoZSBzdWRkZW4/DQo+DQoNClBhc3Rpbmcg
ZGVzY3JpcHRpb24gb24gImxvd2VzdF9wZXJmIiBhbmQgIm5vbmxpbmVhcl9sb3dlc3RfcGVyZiI6
DQoiDQpMb3dlc3QgTm9ubGluZWFyIFBlcmZvcm1hbmNlIGlzIHRoZSBsb3dlc3QgcGVyZm9ybWFu
Y2UgbGV2ZWwgYXQgd2hpY2ggbm9ubGluZWFyIHBvd2VyIHNhdmluZ3MgYXJlIGFjaGlldmVkLCBm
b3IgZXhhbXBsZSwgZHVlIHRvIHRoZSBjb21iaW5lZCBlZmZlY3RzIG9mIHZvbHRhZ2UgYW5kIGZy
ZXF1ZW5jeSBzY2FsaW5nLiBBYm92ZSB0aGlzIHRocmVzaG9sZCwgbG93ZXIgcGVyZm9ybWFuY2Ug
bGV2ZWxzIHNob3VsZCBiZSBnZW5lcmFsbHkgbW9yZSBlbmVyZ3kgZWZmaWNpZW50IHRoYW4gaGln
aGVyIHBlcmZvcm1hbmNlIGxldmVscy4gSW4gdHJhZGl0aW9uYWwgdGVybXMsIHRoaXMgcmVwcmVz
ZW50cyB0aGUgUC1zdGF0ZSByYW5nZSBvZiBwZXJmb3JtYW5jZSBsZXZlbHMuDQoNCkxvd2VzdCBQ
ZXJmb3JtYW5jZSBpcyB0aGUgYWJzb2x1dGUgbG93ZXN0IHBlcmZvcm1hbmNlIGxldmVsIG9mIHRo
ZSBwbGF0Zm9ybS4gU2VsZWN0aW5nIGEgcGVyZm9ybWFuY2UgbGV2ZWwgbG93ZXIgdGhhbiB0aGUg
bG93ZXN0IG5vbmxpbmVhciBwZXJmb3JtYW5jZSBsZXZlbCBtYXkgYWN0dWFsbHkgY2F1c2UgYW4g
ZWZmaWNpZW5jeSBwZW5hbHR5LCBidXQgc2hvdWxkIHJlZHVjZSB0aGUgaW5zdGFudGFuZW91cyBw
b3dlciBjb25zdW1wdGlvbiBvZiB0aGUgcHJvY2Vzc29yLiBJbiB0cmFkaXRpb25hbCB0ZXJtcywg
dGhpcyByZXByZXNlbnRzIHRoZSBULXN0YXRlIHJhbmdlIG9mIHBlcmZvcm1hbmNlIGxldmVscy4N
CiINCklNTywgaW4gcGFzc2l2ZSBtb2RlLCB3ZSByZWx5IG9uIFhlbiBnb3Zlcm5vciB0byBkbyBw
ZXJmb3JtYW5jZSB0dW5pbmcuIEFuZCBYZW4gZ292ZXJub3IgaXMgdGhpbmtpbmcgYmFzZWQgb24g
UC1zdGF0ZXMuIFNvIEkgdGFrZSBub24tbGluZWFyIGxvd2VzdCBwZXJmIGFzIG1pbl9wZXJmDQpX
aGlsZSBpbiBhY3RpdmUgbW9kZSwgaGFyZHdhcmUgaXRzZWxmIGlzIGNhbGN1bGF0aW5nIHN1aXRh
YmxlIHBlcmZvcm1hbmNlL2ZyZXF1ZW5jeSBhdXRvbWF0aWNhbGx5IGJhc2VkIG9uIHdvcmtsb2Fk
LCB0aGVybWFsLCB2b2x0YWdlLCBhbmQgZXRjLiBTbyBtYXliZSBzZXR0aW5nIG1pbl9wZXJmIHdp
dGggbG93ZXN0IHBlcmYgaXMgYSBiZXR0ZXIgY2hvaWNlPw0KDQoNCj4gPiArICAgICAgICByZXQg
PSBnZXRfYW1kX2NwcGNfcGFyYShwb2xpY3ktPmNwdSwNCj4gPiArICZvcC0+dS5nZXRfcGFyYS51
LmNwcGNfcGFyYSk7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBzdHJuY21wKG9wLT51LmdldF9wYXJh
LnNjYWxpbmdfZHJpdmVyLCBYRU5fSFdQX0RSSVZFUl9OQU1FLA0KPiA+ICsgICAgICAgICAgICAg
ICAgIENQVUZSRVFfTkFNRV9MRU4pICYmDQo+ID4gKyAgICAgICAgIHN0cm5jbXAob3AtPnUuZ2V0
X3BhcmEuc2NhbGluZ19kcml2ZXIsDQo+IFhFTl9BTURfQ1BQQ19FUFBfRFJJVkVSX05BTUUsDQo+
ID4gKyAgICAgICAgICAgICAgICAgQ1BVRlJFUV9OQU1FX0xFTikgKQ0KPiA+ICAgICAgew0KPiA+
ICAgICAgICAgIGlmICggIShzY2FsaW5nX2F2YWlsYWJsZV9nb3Zlcm5vcnMgPQ0KPiA+ICAgICAg
ICAgICAgICAgICB4emFsbG9jX2FycmF5KGNoYXIsIGdvdl9udW0gKiBDUFVGUkVRX05BTUVfTEVO
KSkgKQ0KPg0KPiBJc24ndCBpdCB0aGUgbm9uLUVQUCBkcml2ZXIgd2hpY2ggaXMgZ292ZXJub3It
aW5kZXBlbmRlbnQ/DQo+DQoNCkVQUCBkcml2ZXIgaXMgZ292ZXJub3ItaW5kZXBlbmRlbnQsIGlu
ZGljYXRpbmcgYWN0aXZlIG1vZGUuIEhhcmR3YXJlIGl0c2VsZiB3aWxsIGF1dG9tYXRpY2FsbHkg
Y2FsY3VsYXRlIGFuZCBzZXQgZnJlcXVlbmN5LiBVc2VyIG9ubHkgc2hhbGwgc2V0IG1pbl9wZXJm
LCBtYXhfcGVyZiwgYW5kIEVQUCBhdCB0aGUgYmVnaW5uaW5nLg0KRVBQIGlzIGEgcHJlZmVyZW5j
ZSByYXRpbyB2YWx1ZSB0b3dhcmRzIHBlcmZvcm1hbmNlIG92ZXIgcG93ZXJzYXZlLCBvbiB0aGUg
c2NhbGUgb2YgMC0yNTUsIDAgYXMgMTAwJSBwZXJjZW50YWdlIGZhdm9yaW5nIHBlcmZvcm1hbmNl
LCB3aGlsZSAyNTUgYXMgMTAwJSBwZXJjZW50YWdlIGZhdm9yaW5nIHBvd2Vyc2F2ZQ0KTm9uLUVQ
UCBkcml2ZXIgaXMgc3RpbGwgcmVseWluZyBvbiBYZW4gZ292ZXJub3IgdG8gZG8gdGhlIHR1bmlu
Zy4NCg0KPiBKYW4NCg==

