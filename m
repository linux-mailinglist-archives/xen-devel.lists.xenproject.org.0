Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AEB0EADB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053303.1422054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTEc-0006bO-0X; Wed, 23 Jul 2025 06:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053303.1422054; Wed, 23 Jul 2025 06:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTEb-0006Yv-TK; Wed, 23 Jul 2025 06:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1053303;
 Wed, 23 Jul 2025 06:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKM/=2E=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueTEa-0006Rf-50
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:45:48 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2405::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9c309df-6790-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 08:45:47 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:45:41 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 06:45:41 +0000
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
X-Inumbo-ID: a9c309df-6790-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tt0wHxTTV7erC9k67UKAI03Krq6OvhHgiDEn3WEWMpx5OV6+k0InKj2VctZjRxeNF2Q8OVcWcwijl4FZRA8rDpsPyX+2C+Pw041gjKRzuc3yoB4rdKtFkPy3c1TeEe5Kk1A3RkKhZSTsJoJUZdRTFZeA9qHMyHwjaBk7afrQQ5tvhO80uYqTTzdu2FzY4BElsVNjiijIhkcsLTBEDiaJxCOH5xr8f08Cm8jKhgFXgiG/s4mK9//2Z39z3peFIQV3IdJteQCIIrg5AZazSemjuHdUN4fWdm9RYgztTZwVlNLaz+rewsq9A1lhfxGm3w2AuYo4pkM4alI6uxEM1tbxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB/kz07yqnxQcZBwUl1sU3ARjP/BPNUNg0UsShWTNlw=;
 b=KD3Kh8fAnpI0iEyOV/7Naz5FIDO/J0ixzo37FEXGkwqaUEd1f4jEmZ/fLLDYsuxbidmO6lGeud4fOX8b6ChW3iMTMH9yPHnvYE04wmn6Raz7xfBYxfX/cpVRJY8M155COz4SZ8rqaej3ZdChZInH0LMRsqLv8G9gwxpLkTgBehuQt/PJyEPy2cafPk80k72TL4uG3rHPby9X29PEHJCZ999nrOPlTaUZ2qOhM7hydBUiJ54jMwrS6b2ayTOmeH7Q7gUwX5+WeuhvbS2g8/Fg/DiWZudS8UlnrXGuc2XoOAx/fWNIBQL3rD6Kgb2ChggUhv0zjtUJqjULyBSuzBzFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB/kz07yqnxQcZBwUl1sU3ARjP/BPNUNg0UsShWTNlw=;
 b=jr9D4xY5kd25+FASsdyXKpULgl7758kjE9yxGqIYIaDTW/udjDK5D16PpWsnunn2eeHf2bPiUMolYNWVtgQxoKDvoLxa04natN81heKsn0QrS4aQnyT0ypaKjYydxeRgkzMfR2w+7SgnkGYU/0w2RIZLiQH3eJ+1Y/ZzEcYFrbY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index:
 AQHb7LJxCAe3dwZ41UCqlD5sc7if87QoStWAgAGGGID//3tSAIAAhoUAgBLn/gCAAyx1AA==
Date: Wed, 23 Jul 2025 06:45:41 +0000
Message-ID:
 <BL1PR12MB584968692F09C14B8C149D5FE75FA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
 <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
 <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <49c5ba24-e1fd-4b55-b230-1af2b22c1b18@suse.com>
 <BL1PR12MB584906633E31701F71330325E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aH5LyM0og-vEDmTV@macbook.local>
In-Reply-To: <aH5LyM0og-vEDmTV@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8922.036)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8458:EE_
x-ms-office365-filtering-correlation-id: c4fa36b1-8b11-44c8-da41-08ddc9b48a8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alU5eVk2bU9NZlV3Nkl4SnNqUkUxL29SSTQ2YnloOEVBSUJaTXRzeVVvQ095?=
 =?utf-8?B?Um5GTm9Ja0VYdExaRThYVFV5eUJYdTR5YWNHWitYMUxENHFUd2hSdzV6UGVL?=
 =?utf-8?B?T1JjbTZHR0ozZjAzMWw3UDVFbTVPbGViQmFBdms4RzNad01ZaENWYkJVQVJD?=
 =?utf-8?B?Y1l4ZkZqajUyc1RQOGpOQkxyd2VCbDZpK3VJS3c2akQ1ZFlGMFRxRUh6TUI2?=
 =?utf-8?B?MnRKeTY4ZW1NbDdlYW82ZWwxRHQ0OUdiN0lnNHFaNHNHWDRkdjBqL0tNS2hO?=
 =?utf-8?B?STRYZHJHcVVMeEp5SGpRZ0JHZFFBdjloVjdYeVJVUWV2TVpaUHd6TUhxU1Nm?=
 =?utf-8?B?K2VDSXhhaEREY28xNFNWRjFoUC9Kd0FZb1k2bktTU0VOSUlxQXBiWkdvYzNk?=
 =?utf-8?B?Z2NWaDJuTGNkTm93VFo5V2N4cFlyNGtoSCtaWTFLekhPTksxL0luckZIaWVD?=
 =?utf-8?B?a042dzRYVVJ3SUdqc3JHbHYvNTQzTVNzTkxPZ1BQMFgzMGR3bnpPeFJrem5v?=
 =?utf-8?B?b0lURGdieGNBRkZBV25XVjM0TXFSVHlqRUNXc3V6ZmRnTnZUY1FYQ05LRExY?=
 =?utf-8?B?UkE0NG40cHRCWEkxR0t2MUpPZ3VpV3lZVkhnQ3Q1aE5wUTBjTjAvbGI0blQv?=
 =?utf-8?B?ZTdYRU5KSTJMdlNLUkNmZjBqRkpGblFvTmk1bjJkZGpwR29WZ1orWktWRHZB?=
 =?utf-8?B?N29PQWo1bkpzRFZjd1hENE5NRnpPTEowRE5HemNUV3JtUjBTMmNoVFNocEtX?=
 =?utf-8?B?SmhtenNFYWRmSzY0aEh4c2k4UHhsWkVQbGlXNHZRd3kzR28wUG1DaDVwWHBT?=
 =?utf-8?B?RHo1cTBxNHpsc0RZd2ltb1Z0N1lhZVBMNHBXdU54eWJzemJqNDFMSzdUOVB2?=
 =?utf-8?B?MVBEVXptb0hQaHhwR20xaGEwRFc4SGVhU2RzZ0I3Q0E1dGMyRllidnlINUlu?=
 =?utf-8?B?amNXK3hKTGZlekh4QUkxc0d4SGNUbWdTbzdIZ1N4ZXcyUm1ST2xqbWYvbzli?=
 =?utf-8?B?QVBKRFZGUTkwNXA3Y3orWkhBMFpGSzM0dWtzZCt5di8vdkUwcTlvU1JLTmZ5?=
 =?utf-8?B?eUZaMUZRbU5QOVY3R3Y4Z3lZemxvTGd0UFB1RVd6TS95YTFRM1QzMUpvUlJC?=
 =?utf-8?B?SFVpTGcyL2Y1d25uSnNROVAxa1VxSnRpOVorMlJRdk4zQ2NueU5ray9RZ2Fn?=
 =?utf-8?B?L0lxRXZmeUVFV0lvZzN1b05POE9NL3FWMnBtdTA4Mit4ZUdCZnpnKzFlVk84?=
 =?utf-8?B?SzJJYmUxNndKSzZJLzc2YXNnK1FKTjhXNzBHK0hGRmh3QzQ2dlYxQ2o0U1Zj?=
 =?utf-8?B?czJnSklMRjJMOEh6RmRsMEI3SkR6RmN0cUZzV1Y5S0w4ZUpiUktxWVNKcDcx?=
 =?utf-8?B?QU9KNlRuT1RWS0ZGMmtPM3l0azUwVWo0RFRPcmFxc1ZtR3RtUDNnUWdWcm9U?=
 =?utf-8?B?UUFybDcwaDdYNTExbHZkcnMrT2ttSjExZHRzVkI0RkQyUXVGcDl3WXU4REE0?=
 =?utf-8?B?cFRWVVcycGhobnpjK25tNEtkdE5rT3pyS1c0WkkzZzhpL0VWREVxSXpYVzY1?=
 =?utf-8?B?N0oxeUkwTkpLQzNZSndqY2puRFRJcG1mYmxEYzBZS01YVVc2Wmh5Y1hKUlFs?=
 =?utf-8?B?TlZLWCsxSDRzaTNMQS9IWGhGTlRCVkp2b3RmeEIxY1pOTUZHTXRVY0FLRG5v?=
 =?utf-8?B?TU83R1NsMWFBQlBydGVMOWZmdllKb25nUUsxa0NIUEVBMGp3UjFJQ1g2MXpa?=
 =?utf-8?B?a3J2WGJ5b2p3dUZTRTcwWWxFSjM4QnNVRjNRVHhyQU5oZG9KR0oyOHNsVURS?=
 =?utf-8?B?SWhmTDNybzdveXpHbXFoSmxqaDlwSFlGaHF1K2YvU3lXRjlzNndSWW01Um1u?=
 =?utf-8?B?MlJaNW5xOG5XMXA5WGJZRThTc0FBeVl0WnRibkNibVR5VzRmcWRraTZPSWli?=
 =?utf-8?B?ZVpUc0lQMUw4TEtQUTI3TlNjcmNqREw5WjFDaTJ4Q1JObTVYWm53RnZzYXBq?=
 =?utf-8?B?aml2VjFtL21BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnNHSnFtNG4wRWt0ZHJ4MG82WTdoVU9HL3YyRnJZSWVmaEd6RzhlVTd4bzd6?=
 =?utf-8?B?ODZGZGM0NVRqWUtpUHh4ZTBtN3FHRm56VDlmdzN2K0VsbmhMRmRtcFlSdEow?=
 =?utf-8?B?eHBiSnkzNkJlQUZQenl6OXhVeFAxamRreldyS1VIVitKMVRNUDBhanZXQXR6?=
 =?utf-8?B?bWlFWnRBNUs5ZVk1am9lNzhoRHliSGpyOVpvWEpTdUV0NXN5aGtPZDZ2SGo3?=
 =?utf-8?B?QjAyd3FlRGpsMzE4eTV0dWZDRzVVSTgzUjlyRzRSU1hNRk5jMmtlNzFzaG5Z?=
 =?utf-8?B?SEFKdDNmVzRjdi9RTDA4OG5XTzhnbnFCQkRYTHdiemJIamNQSFRvQXIzQ1Bm?=
 =?utf-8?B?YkRUSSswdGo3V0huRHhaYm13VzlXZi9oOW51ZW9XZGtmcEhiSFRDT3RTZVN4?=
 =?utf-8?B?NjE0RjFkeUlOaTVBMGNkRU1MNW5Ga090WFRDK2Jwd3BsR2RianJvSEFwZXZv?=
 =?utf-8?B?c1ZMSVRHb0ZEakowQ29kZGl1OHdYaEdBb1dkTzc1ZzYwZ0FrejVhWXhHQkVH?=
 =?utf-8?B?aEt0a1ZDOThqd1RTTFhmcWhJVFlITS9zRTh4TTJwUHgrN2dtdzVSTGRvTENi?=
 =?utf-8?B?UFAxSjAzbFJTclU3NVFjeWNuTy96clVKbUsvOGZDZ1ZMUVhMZlFTUkpsVmsz?=
 =?utf-8?B?UGwvZWtOeUV6NUE5SWE1T3A4cWloekVHQ20xbVlkVkVkeXpUL2lQdTNNakp1?=
 =?utf-8?B?SjNDTDFqWmFMWVd1MEMyaDJsbWVyVXdRSEhjS1RUM1VrUWZsQzRNUEtpdm0v?=
 =?utf-8?B?Wmx2aDUyOHZmQ1VZUmpQVHJ1SmVtVUgzM0syY1cvOGRsZ2pqQ2hjRDZxeTZl?=
 =?utf-8?B?UC94a2dBaDdhQVA3SDV6eVRtMi9COGdDSDkySkwvN3plSm5OUjNDNmxGMnpP?=
 =?utf-8?B?SzhGODFJaW41anlhY2JtUWZsVE1TUElJV1BSWnZ1Ukh3dUlkdXlzZmZWSWt3?=
 =?utf-8?B?SXU5VnYzbzFPUWhvVVlZRzFpL24xTk5IdVZCU0tHd2JDeGI4YWI5cWJGOTF2?=
 =?utf-8?B?K1dPZmRuTjdGdjFLeDNZSCsxVzRRS0lRcEdzeEd4S0hXZGE1YlNvSTFXbXAx?=
 =?utf-8?B?Q1JFYk85WU9TemRYRXM0NUtNY0R6cUxub1pyd3VOcWdLUW5tZ3RJM0U1cEc4?=
 =?utf-8?B?MTNlRm40eWlRZVZsMWtBbTV3Tm12NEE4c0VKMk4xQWVLRGwxeXdNQmx1c3hp?=
 =?utf-8?B?K09WNngzeWllUGl2Zzczdk0wS1BGemFLUmlvTFpRN2FJQmE3NFBsaTNtdkNs?=
 =?utf-8?B?WSt2aGpqYjBkN2hWdVJib200ZVVWQ2ZCdzk4bEpVK2RYTG5CTFd6QTEyV09n?=
 =?utf-8?B?c0liRjNldElnZUFNb0Z3UWhudVFISmJQOHJvVXphMzVlTUo3RHhGUnlZa3Ay?=
 =?utf-8?B?RXhEMDNUTlA3MzJ5SlZtV3hycG1Rako5V1FUN2ovNkpxcFVZMGhIOVNpU1FX?=
 =?utf-8?B?WDRKTDZ5NitySE15bm8xQ0FqYmQ0REZqSG55Rm1YeUxEZWRoV0hZZnl5eTZ0?=
 =?utf-8?B?YmVkZ2FTYjlCMnBIa0I2VVRxQlZTK005WHUwUXEyLzRZN0Z2SHJPS05odjFn?=
 =?utf-8?B?TCsxQlpsV0dIaDBJbENIZCtpV3JsaEVoaThyaFZVbFpaOTVrSXhBZTJkL2lC?=
 =?utf-8?B?NVU4UytFN1g2MGhqaGxYeCtLanBoQXFDSGVORFNFV2tQeTlSWjlVZ3VBM2RF?=
 =?utf-8?B?NmU3aVVlRk5ubExrUkJONHJmREZCdnlXUitFREMzY2ticjVaYlR6RWEwN0RH?=
 =?utf-8?B?TzMyem9Yd3huc1dib3B6OFVUeGhSR1hzblJpeE04K3ppV0dDeWdDM2Njbyt0?=
 =?utf-8?B?NkdsQytCUXdXeGowUzRxWFQ3dWpER2Jrejk1OVBSVWNheE1hYkRIU1NoVXZ4?=
 =?utf-8?B?UE52ZEpmUWFYdGJtdFZsUEdHWWU0NktXbVZkVkNiOUtRV0NQZFRpMDN2YU1t?=
 =?utf-8?B?WWVXMkE1UUpOcGlWbVZ5RkJrbm10bjBxQlZ6M2J1YmYvUE5xOEJ1aW5zK1ha?=
 =?utf-8?B?TFBvMHlPWHBMUEhCNFRqOUdFQkxJd0lTK0FxS0YyNitHUm1paGxmelViUmZn?=
 =?utf-8?B?aWNQUVVDczcvdExyUk5LMjFQNjY3OVRBcTcxc2JEMVpJbWtySUlic1FVaUF4?=
 =?utf-8?Q?zlAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5547582F5898A4DB1A11CECAD5A276C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fa36b1-8b11-44c8-da41-08ddc9b48a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 06:45:41.1979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klSljii0FykPLNhK1d6DvtqcufKxib7X5a27Ja44LUsLVRgbP8lWEerhksq+dSplXCOclLnA5eCrveb7I+e3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

T24gMjAyNS83LzIxIDIyOjE2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEp1
bCAwOSwgMjAyNSBhdCAwNTozNDoyOEFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBP
biAyMDI1LzcvOSAxMzozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDkuMDcuMjAyNSAw
NzoyOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+PiBPbiAyMDI1LzcvOCAyMjoxMCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4wNy4yMDI1IDA5OjA3LCBKaXFpYW4gQ2hlbiB3cm90
ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4gKysrIGIv
eGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+IEBAIC04MzYsNiArODM2LDM5IEBAIHN0
YXRpYyBpbnQgdnBjaV9pbml0X2NhcGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfUlNW
RFpfTUFTSyk7DQo+Pj4+Pj4gIH0NCj4+Pj4+PiAgDQo+Pj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9p
bml0X2V4dF9jYXBhYmlsaXR5X2xpc3QoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+
Pj4gK3sNCj4+Pj4+PiArICAgIHVuc2lnbmVkIGludCBwb3MgPSBQQ0lfQ0ZHX1NQQUNFX1NJWkU7
DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRv
bWFpbikgKQ0KPj4+Pj4+ICsgICAgICAgIC8qIEV4dGVuZGVkIGNhcGFiaWxpdGllcyByZWFkIGFz
IHplcm8sIHdyaXRlIGlnbm9yZSBmb3IgRG9tVSAqLw0KPj4+Pj4+ICsgICAgICAgIHJldHVybiB2
cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0KPj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2b2lkICopMCk7DQo+
Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgZG8NCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiArICAgICAgICB1
aW50MzJfdCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcG9zKTsNCj4+Pj4+
PiArICAgICAgICBpbnQgcmM7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgICAgIHJjID0gdnBjaV9h
ZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9yZWFkX3ZhbCwgdnBjaV9od193cml0ZTMyLA0K
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9zLCA0LCAodm9pZCAqKSh1
aW50cHRyX3QpaGVhZGVyKTsNCj4+Pj4+DQo+Pj4+PiBJZiBpdCB3YXNuJ3QgZm9yIHRoaXMgdXNl
IG9mIHZwY2lfaHdfd3JpdGUzMigpLCBJJ2QgYmUgaGFwcHkgdG8gcHJvdmlkZSBteQ0KPj4+Pj4g
Ui1iLiBCdXQgdGhpcyBjb250aW51ZXMgdG8gbG9vayBib2d1cyB0byBtZTogV2hhdCB1c2UgaXMg
aXQgdG8gYWxsb3cgd3JpdGVzDQo+Pj4+PiB3aGVuIERvbTAgdGhlbiBjYW4ndCByZWFkIGJhY2sg
YW55IHBvc3NpYmxlIGVmZmVjdCBvZiBzdWNoIGEgd3JpdGUgKGluIHRoZQ0KPj4+Pj4gdW5leHBl
Y3RlZCBldmVudCB0aGF0IHNvbWUgb2YgdGhlIGJpdHMgd2VyZSBpbmRlZWQgd3JpdGFibGUpPw0K
Pj4+PiBPaCwgSSBnb3QgeW91ciBjb25jZXJuLg0KPj4+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91
dCB1cGRhdGluZyB0aGUgaGVhZGVyIHZhbHVlIGFmdGVyIHdyaXRpbmcgdG8gaGFyZHdhcmUgaW4g
d3JpdGUgZnVuY3Rpb24/DQo+Pg0KPj4+IFRoYXQgd291bGQgaW1vIGJlIGEgbGF5ZXJpbmcgdmlv
bGF0aW9uLiBPbmNlIGFnYWluIHRoYXQncyBzb21ldGhpbmcgdGhhdCB5b3UNCj4+PiBwcmltYXJp
bHkgd291bGQgbmVlZCBSb2dlcidzIGlucHV0IG9uLg0KPj4gT0ssIHdhaXQgZm9yIFJvZ2VyJ3Mg
aW5wdXQuDQo+IA0KPiBIbSwgSSBzZWUgdGhlIGFzeW1tZXRyeSBvZiBhbGxvd2luZyB3cml0ZXMg
YnV0IG5vdCBkaXJlY3Qgd3JpdGVzLCBteQ0KPiB0aG91Z2h0IHdhcyB0byBnaXZlIHRoZSBodyBk
b21haW4gYXMgbGVzcyBpbnRlcmZlcmVuY2UgYXMgcG9zc2libHksDQo+IGhlbmNlIG15IHJlY29t
bWVuZGF0aW9uIHRvIHVzZSB2cGNpX2h3X3dyaXRlMzIoKS4NCj4gDQo+IEkgcHJhY3RpY2UgSSB0
aGluayBpdCdzIHZlcnkgdW5saWtlbHkgdGhhdCBkZXZpY2VzIHJlLXVzZSByZXNlcnZlZA0KPiBi
aXRzIGluIHRoZSBjYXBhYmlsaXR5IHJlZ2lzdGVyLCBzbyBJJ20gZmluZSB3aXRoIHVzaW5nIE5V
TEwgKHRodXMNCj4gZGlzY2FyZGluZyB0aGUgd3JpdGUpLiAgV2UgY2FuIGFsd2F5cyBhZGQgbW9y
ZSBjb21wbGV4IGhhbmRsaW5nIGhlcmUNCj4gaWYgd2UgZXZlciBjYW1lIGFjcm9zcyBhIGRldmlj
ZSB0aGF0IHJlcXVpcmVzIGl0Lg0KT0ssIEkgd2lsbCBkZWxldGUgdnBjaV9od193cml0ZTMyKCkg
aW4gbmV4dCB2ZXJzaW9uLg0KVGhhbmtzLg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

