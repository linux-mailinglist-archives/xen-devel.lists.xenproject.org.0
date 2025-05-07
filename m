Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFFAAD9D5
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978335.1365152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZum-0007Dj-Kd; Wed, 07 May 2025 08:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978335.1365152; Wed, 07 May 2025 08:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZum-0007CA-HL; Wed, 07 May 2025 08:14:04 +0000
Received: by outflank-mailman (input) for mailman id 978335;
 Wed, 07 May 2025 08:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCZul-0007C4-Ak
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:14:03 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2405::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b1b074a-2b1b-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 10:14:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 08:13:54 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 08:13:54 +0000
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
X-Inumbo-ID: 3b1b074a-2b1b-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rzvn+A2CIHyRhu0BZzY52viEjBX3Zf9cye4+wz9AmUvSKoNOURZvS2k62nehqYIGo0eEiNExbZks87zVflSsziRzrZk+FdShvyoIowNJJie1qJvuS51SCr8y2BGlIoEM/NVF2vRY7+bl5nyw0t5G9lhk92LiZhsP0ycAYvun47JVmcJgjNe9m+GtTCmnfhu1lC9OMYHoMVidVeVxo2VERLv4Gyrg5kLmTVP8wh7N/EtiQKZ7LtVJE0ZJETtxaaSfpzSBziMNhclmva+moQVRlmmaawy31SnVcYU+kStWx+cHU/hr+d2CfCDPocm44y636UayuQM3n70HFNVztwwekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrBokqMYpA3NvfilMAsyyTgelG4EMTE+Eff8kRUArF4=;
 b=obUD1R69KRsQLmLyyXjUhYtZ9EM1TAkR9f8AQgnFQmF/LvWOSf1gTSMQDB6AsNCa/MdlqpyVt9nV8104VpBv8vCa3LvuC09NTP07GEYdwDOyBzmIwUw7jh5HfJsBuwqTy7c9qPfInhZ5S2IpvBDMeWqMqd/vHtw8kO7EbCpjNE98mPUI2zEpKiQvZqr9gaL4lA5cS5R+qizT2JlsOEiCnTNLUeUvQWOFY9ZoITEvuj52NbzM6FcMYEBjoeXb5hvg1lQkno1AM/oKEj3pbPa5+8Qt0xY7B6o7ZlP5MnA1zclUEBr89WDyy3JWBP1f9cQnAv+KkbJYuCH1CDHCdCLQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrBokqMYpA3NvfilMAsyyTgelG4EMTE+Eff8kRUArF4=;
 b=wY6vhwvM7FcJXXoVoKPZ4jGpD4ksIs6WxYe5zAOdUcNdCgi2cX/SyskIMJgFWMAzwesSKtiakxsDxJIvFSi7lt1ke5o/0G2DpFmZ2ZJ9+R/k38fI6+MOe11rD3V6M0y39BTuksHOJ8vhnY0Nyiy2sYGn3Fl4qLC+vb+Qvdf6Ugw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Topic: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Index: AQHbsoVY0As/JNC0IkWc2g8aH+9wh7PFtqAAgAFbx4D//9G3gIAAjICA
Date: Wed, 7 May 2025 08:13:54 +0000
Message-ID:
 <BL1PR12MB58499F55D83D708AAAC8BD8CE788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com> <aBoTqCf5y_LXzZdb@macbook.lan>
 <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aBsQkZLNAEEztXZC@macbook.lan>
In-Reply-To: <aBsQkZLNAEEztXZC@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYYPR12MB8653:EE_
x-ms-office365-filtering-correlation-id: 540c147b-b72e-459a-ca80-08dd8d3f1bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnQvMHBHbmF1d0FYbCtYRUlWUXFYSURyeFNCZUxpV0tqWVNhS3FlUjJmSlgy?=
 =?utf-8?B?WllUK0V5bEx1cjAxbWFWK290WGxQUEUzTStZUHFtWlZFZloxa1pjQmdEZk5F?=
 =?utf-8?B?ZTRzRk9rVHFyVDUrS1pVQVVxNXpheHJkL3M3ZnMzcGZuWCsrcGRDM1JjL2ww?=
 =?utf-8?B?YVNkSStsSU5VRUw0cVFyTzJWQVBUZzJOa0VMckNOWmNSeEhXQWk4bEJQZ01X?=
 =?utf-8?B?K0lmMVNFV3ZITklRY21MdnZ5SXpwMHI2UmFWaEZPMGV2ZHN4MWc5czFUTVdL?=
 =?utf-8?B?YU5hT01FaVdCSWdpMjRFRG5mazZicVFoOFFKcUNIaHlSQUU4cmtzQ2s3L0x0?=
 =?utf-8?B?RHhtbndBL3I2MlpialpXTWRqUVF6SExNNlFaamVkSllnNGg3RG41UUdPSFJR?=
 =?utf-8?B?ZlBIUGcwbnNQOFgram5WMFFkSm90VmZNNU5Rd0JPUGdvYXo5RG51QTZaLzFJ?=
 =?utf-8?B?VmpsemQ4RFhyTGxIRVN0V2N4Z1grV2hrZ0M5My84UExRcXNiT1hCMGZTeW54?=
 =?utf-8?B?SW1SYnUzaHlLL1ludldmTlR0MlkzRjkxK1F4U2crM3FrL0ZvUG1Ia1NsRnk4?=
 =?utf-8?B?bFFieGJKclJhV3JhUTlUbkIzWXo3U3ZDaENMSUVkTll0RWxnYlhJVlMvSnJq?=
 =?utf-8?B?L0VOMzRsVmZKQUlyNDdEUlZ6SS93dzYxdmRwNlVGV0RrSSt5YkNya3FXYjJH?=
 =?utf-8?B?OVhzUlpoRW9UVXlBd0c3MG1RZlhMSW1UK2hiQUpraXQ0UTF0ZlcvQjdlYUR4?=
 =?utf-8?B?MHZyMGFya2xhY2pmOFFBS0tWeGxZMmlyemFMbXE4TDFEOW56cjFycTQ4RzN1?=
 =?utf-8?B?enQzZVkxa0J5bnh4Ty8zU3lNVS95bWhBSlFIUXppZkZHYmRHRmJlVGRhRjhv?=
 =?utf-8?B?azJlZTVDMThRaHQ5a1ZjWFQxN0gwSW5zQTFyUWp6WjdSM0h2R0tqTzZSaStU?=
 =?utf-8?B?RkN6MGhBSWZWMHNLbnlzaXlKYllEWkhicjNiSmttaTEydmxoZkluWlFaVzF1?=
 =?utf-8?B?aGlEVEFReGFZbGZUMnNTTDVLVmczRlIvbjl1SWltSW1tM080UkZFWnNraVNG?=
 =?utf-8?B?cGxnYTBrOS92UnFhOTZhbE9mb1RROS84OEFONThyU29EdkVvdHFiQXR1TFB3?=
 =?utf-8?B?eXljSytzQWlqcGJpZUJxYzNrV0NUN3M2aElhcnJpeC9oYVRyZEVnNnlVZVRV?=
 =?utf-8?B?VnB3U2o2OG9VK0x3MFhxOXZDNFNnSDRYTWZFVHN5ZmQ2MVlWVGFBdnBBT1dl?=
 =?utf-8?B?ZytzZ051OGtpRHdod1ZoZjlHWGtnWUk0ZjNqM1ozOCtvY3RaUXpKQy9qRDBt?=
 =?utf-8?B?UU42ZjZjTnpxbEp4dkFSeHVEeXdoa1NiNDFTSnZ1ZHloOGFBVFJpTHN0Mlda?=
 =?utf-8?B?TlZOdThBemNUSzNPUnBHUXlrVnRrbE1XU3VtaHVLZFpKY2dBeDVpa3ZrQUlU?=
 =?utf-8?B?OG4xcjEzNFJ6NHgzOHZpWWNDU3UxSTA0eWh2QzRiSE9ReWpZSmRKOUR5OUk5?=
 =?utf-8?B?R2JrWEJDNUYvbm56cDJHNTM3bzBheURGSHdMd2x2bjYyb3pZSTRDNkNjU3JN?=
 =?utf-8?B?Y1lvMEF6RzFuOS9qZzBxYjJaTkh2YU9TN092MThnWDJDZXk3U0VaRFB1RnNY?=
 =?utf-8?B?WU1jNTYvUkhZS25zcVJSTU5EcmxYTEZGdHpPVldodmk2dzhPQ2ZZbnBTZUNi?=
 =?utf-8?B?MWVBVFJsRVpYbmVsTHZWYXFDejdwUlZNbEUvY3k1YXd5ajFrQkpla1lFNXU1?=
 =?utf-8?B?WXNxY01XclhDNnNZSlJxc3NBc2FWVzMwMjVMejhiRWxZWTA3V0FERTdWTjE3?=
 =?utf-8?B?MHFKem9haEZ3akpRTDI4VWx2MVJ4SGt2Y2NNaGwzVzQ5VXFiWkwrRi83bThO?=
 =?utf-8?B?aVM3cjNzTC9WVkIvQ2RaS3psMThack9oa2NRZU5uNTZUeFRzN3RHVWxmTkI4?=
 =?utf-8?B?MUYwbTJCM1hnU1hLckRUbkViUjVvaTRJbWxZOTlzTGtGUlNEUndyanJ3ZFdM?=
 =?utf-8?Q?HxFCPT9LgRcIW+sDy5cd0g4ysDTWmY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0VzSXlGVThheDR3UEg1ZzJsRnEyRXhSV0xUaU9iYlJxd2xqbXZ5ZDdZN3Fa?=
 =?utf-8?B?VHk0OGV6bnhiM1ZCY0srODlReDI4aStpYklHUVJmQXU2cFdDdXdGUDJJYzZu?=
 =?utf-8?B?dm83UVpnOGg2MFFaYlFXN2tscTJIemdqRzFpTzRCY29ZS1k1TWJnOEF5bE1w?=
 =?utf-8?B?bTFGaHJKUTVRZVdoUUEvUHMvdTUvTnZNUXEyVjVTajhsQi9qQWpKN0QxUlg4?=
 =?utf-8?B?NXlLMURjMXMrd216RDlYU0JhMkJZWGZjckN1MkRCY2kxdUVEZ3VQVklNd29M?=
 =?utf-8?B?bm15bUdBR2NQOWNCUkRPU1FTK2pKSU10MHVTazhQNytuSkJ3cDh3Nzh3bldW?=
 =?utf-8?B?RTZGZnl1R2ZHU2UxMjVUcTA2RWQ2djJQeUZCTDN3RFR3akJJektXQk5SYkNU?=
 =?utf-8?B?eWx3Mko4WEptN05UcXNnZmZsM1lpOUhrT0pJVFJtUmIrM2pXOGFWZVROeEJH?=
 =?utf-8?B?dGRDbE5sQSsydXJ0VUVtdExIQTlHQmZlWmdlZ2JGUjlINzNVaDhHb1FaYnlT?=
 =?utf-8?B?TGZGaHdQcWFFYUtTSFMrRjVhZ2RaN25mQmNWeDJIUkl5ZU1ia1E4UlR6Vkg1?=
 =?utf-8?B?RmY1bG50YzMydms5SkdJbEl3bmt2bTh2OUQ1aVZsQlRTTEo3Y296VmJSends?=
 =?utf-8?B?L2piVlRySU0xOExEenVFcDdzMVUvbGVlcFllQ1E5UGJ6R2RIVDkrVGxBL3Ro?=
 =?utf-8?B?R0VEbldNRkwzZXUwMGVBVW9IbndFUUxQYWxOVkw1RDdrWjBVaWVYUEVLN1Ur?=
 =?utf-8?B?YXcvS2VVM3ZWdU9DeCtZbjltTkVQczV5Q01ySlZjbWswRDNIL1JEcGNiMlo0?=
 =?utf-8?B?MDM1VDJGTkpWeVh6akJlMFo2UGtjT20zZFFKZTB4cGkwUU43SU83eUFVdSt1?=
 =?utf-8?B?RXZGWlhhSnpjY3o5M2IrV0tlMS9sWnRLOU1vYWlOSCtuaEV1ZGJMdENmTy8r?=
 =?utf-8?B?VWtSMnN5RkwvTjJ1SEtTZVhvTlN2aUtqNE5WaVZhQ2hwbysvWm5sRncwUjJr?=
 =?utf-8?B?Y091Skt4UUNFNk5tS21MVHJBcnhHT3BnN1FzRFMwSTRZYk9hSkprclRFTmxp?=
 =?utf-8?B?dHhxWmN6RmIxakRCekpIZTJxWVVwZXNLNHY4NUNYZ05vcUFnMVgxMzVob0s0?=
 =?utf-8?B?SSszU3Z1NEd1Z2pUaU9vcDZRcC9EWDVQbWJIenVtL1lDdHB3ZTQwVGhTb2NM?=
 =?utf-8?B?NTZWZnpIRGxVVnVQOGh1c3YyempudUROWTJPaExsRmRuaGJaZDBwOWpRV1lW?=
 =?utf-8?B?YzdXc0NLWGtxYlhsNHFkOFB4STZYSm5OR01CN1hmZDZHMUQ5R0prRkkyMWJw?=
 =?utf-8?B?L3JLOFcrZTRDcDVjZDQ0OVI4UnNzc2VIeUR2b1BKNFUrbDFsenBUdFQxdXJL?=
 =?utf-8?B?NkRnQjVnQjRhNTdQcnMvTjJacHRVTjdqREtlQ3d3MkV6Y1U1eFU1Q3d5TitK?=
 =?utf-8?B?R2VtTnh6WGo4ZHYvRk1EUWVVZ251ZVY3TGg1ZzlDamtTMDdZVHVRY0N4ODVP?=
 =?utf-8?B?MVFDbHZLdUdkZkR6aVZDMkI0elRKa0hBTDYxRWFUa0IwckhZTWQ0d1ZZbXkx?=
 =?utf-8?B?ZjdaSmpVc0o1Z3ZjMHk2RkExWTdVYUtMK2d1V0dpaVl4d01SZ1pjSURjWE8w?=
 =?utf-8?B?d2p2OU9HMzEycW1YL3JVczN3a1pPajNwT0lQVEtqcE5teFVRNEZ1blBDOUtY?=
 =?utf-8?B?MW50SUF1d2ltMkhyZ0xrT2k1djltSVJHZndJTlhvalYyTFAzQWhaaUxtTEh1?=
 =?utf-8?B?SDFFOStIb3pPRXF3RFlIZXkvRUVkKzV6dGhOT3VrMlgvYkhsNms2d1lLR3kw?=
 =?utf-8?B?d3BVa3dmOTl0NzhsZGd0RWZqSkJjR201MFZNSEFHc013MjEySFlIejFCWnNZ?=
 =?utf-8?B?V0N5My9VV29GZVkvU1FFaDZHb25JY0Q4MHZCU1hSd095c3RyZm5yc2dIL2ZZ?=
 =?utf-8?B?VmxzellMQjB1R0hGMzYxRDdrKzBWVDVoc0RJZjJBZTJuakdPeHJEWUMvaHdX?=
 =?utf-8?B?aWw2T0NmZ2tFQ0ovZXh4UHBsL1R0NE5yWHlGR2tMeHZzN3pIbXZSajJEM1ln?=
 =?utf-8?B?R3Y0Q3RkOW5lUFljbEhjaVA3eTcrTCt0bno5Z1p3RzFYN1luc0g0bTcvM3Yw?=
 =?utf-8?Q?HpU4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7C36B71923A6F40944F2C9AE7E221F9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540c147b-b72e-459a-ca80-08dd8d3f1bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 08:13:54.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc8fJHSG3WjbdI5h9cbZj2m3U4FGNNBA1xlMryNuH+JREiUc9vu3GsLRvdOgRHE8zjZFqfDDOhFJuidoGYemZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653

T24gMjAyNS81LzcgMTU6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwgTWF5
IDA3LCAyMDI1IGF0IDAyOjQ2OjUyQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjUvNS82IDIxOjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU1UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+PiBD
dXJyZW50IGxvZ2ljIG9mIGVtdWxhdGluZyBsZWdhY3kgY2FwYWJpbGl0eSBsaXN0IGlzIG9ubHkg
Zm9yIGRvbVUuDQo+Pj4+IFNvLCBleHBhbmQgaXQgdG8gZW11bGF0ZSBmb3IgZG9tMCB0b28uIFRo
ZW4gaXQgd2lsbCBiZSBlYXN5IHRvIGhpZGUNCj4+Pj4gYSBjYXBhYmlsaXR5IHdob3NlIGluaXRp
YWxpemF0aW9uIGZhaWxzIGluIGEgZnVuY3Rpb24uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+DQo+Pj4gU29ycnksIG9uZSBu
aXQgSSd2ZSBub3RpY2VkIHdoaWxlIGxvb2tpbmcgYXQgdGhlIG5leHQgcGF0Y2guDQo+Pj4NCj4+
Pj4gQEAgLTc4NiwxMyArNzg3LDE1IEBAIHN0YXRpYyBpbnQgdnBjaV9pbml0X2NhcGFiaWxpdHlf
bGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gIA0KPj4+PiAgICAgICAgICAgICAgbmV4
dCA9IHBjaV9maW5kX25leHRfY2FwX3R0bChwZGV2LT5zYmRmLA0KPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfTkVYVCwNCj4+
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3VwcG9ydGVkX2Nh
cHMsDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZ
X1NJWkUoc3VwcG9ydGVkX2NhcHMpLCAmdHRsKTsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY2FwcywgbiwgJnR0bCk7DQo+Pj4+ICANCj4+Pj4gLSAgICAg
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkOCwg
TlVMTCwNCj4+IFRoZSBzYW1lIGhlcmUsIE5VTEwgLT4gdnBjaV9od193cml0ZTgsIEkgdGhpbmsu
DQo+IA0KPiBObywgbm90IGhlcmUsIHNpbmNlIHRoZSBQQ0lfQ0FQX0xJU1RfSUQgaGFuZGxlciBp
cyBvbmx5IGFkZGVkIGZvcg0KPiBub24taGFyZHdhcmUgZG9tYWlucywgYW5kIGluIHRoYXQgY2Fz
ZSB3ZSBkbyB3YW50IHRvIGlnbm9yZSB3cml0ZXMgdG8NCj4gdGhlIHJlZ2lzdGVyLg0KT2gsIEkg
d3JpdGUgdGhlIHdyb25nIHBsYWNlLiBJIG1lYW4gdGhlIGNvZGVzIHRvIGFkZCBoYW5kbGVyIGZv
ciBQQ0lfQ0FQQUJJTElUWV9MSVNUIHdoZW4gaGFyZHdhcmUgZG9tYWluLg0KDQo+IA0KPj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQs
IDEsIE5VTEwpOw0KPj4+PiAtICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+IC0gICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KPj4+PiArICAgICAgICAgICAgaWYgKCAhaXNfaHdkb20gKQ0KPj4+
PiArICAgICAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVn
aXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkOCwgTlVMTCwNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcyArIFBDSV9DQVBfTElTVF9JRCwgMSwgTlVM
TCk7DQo+Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByYzsNCj4+Pj4gKyAgICAgICAgICAgIH0NCj4+Pj4gIA0KPj4+PiAgICAg
ICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFs
LCBOVUxMLA0KPj4+DQo+Pj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gdGhlIHdyaXRlIGhhbmRs
ZXIgc2hvdWxkIGJlIHZwY2lfaHdfd3JpdGU4DQo+Pj4gaW5zdGVhZCBvZiBOVUxMLg0KPj4gT0ss
IEkgdGhpbmsgSSBuZWVkIHRvIGFkZCBkZWZpbml0aW9uIG9mIHZwY2lfaHdfd3JpdGU4Lg0KPj4g
QnV0IEkgaGF2ZSBhIHF1ZXN0aW9uLCBpZiBoYXJkd2FyZSBkb21haW4gd3JpdGUgdGhpcyByZWdp
c3RlciB0aHJvdWdoIHZwY2lfaHdfd3JpdGU4LA0KPj4gdGhlbiB0aGUgIm5leHQgYWRkcmVzcyBk
YXRhIiBvZiBoYXJkd2FyZSB3aWxsIGJlIGluIGNvbnNpc3RlbnQgd2l0aCB2cGNpLg0KPj4gSXMg
aXQgZmluZT8gT3Igc2hvdWxkIEkgdXBkYXRlIHZwY2kncyBjYWNoZT8NCj4gDQo+IEFjY29yZGlu
ZyB0byB0aGUgc3BlYyB0aGlzIGZpZWxkIGlzIHJlYWQtb25seSwgc28gd3JpdGVzIHNob3VsZCBi
ZQ0KPiBpZ25vcmVkLiAgV2UgYWxsb3cgaGFyZHdhcmUgZG9tYWluIGZ1bGwgYWNjZXNzIGJlY2F1
c2UgZm9yIGhhcmR3YXJlDQo+IGRvbWFpbiB3ZSBhaW0gdG8gdHJhcCBhcyBsaXR0bGUgYXMgcG9z
c2libGUgdG8gbm90IGRpdmVyZ2UgYmVoYXZpb3INCj4gZnJvbSBuYXRpdmUsIGFuZCB0byBhbGxv
dyBwb3NzaWJsZSBkZXZpY2UgcXVpcmtzIHRvIHdvcmsuDQo+IA0KPiBJdCBjb3VsZCBiZSBjb25j
ZWl2YWJsZSB0aGF0IHNvbWUgdmVuZG9yIGhhcyBhIGhpZGRlbiBzcGVjaWZpYw0KPiBmdW5jdGlv
bmFsaXR5IHRoYXQgc29tZWhvdyB0cmlnZ2VyZWQgYnkgYSB3cml0ZSB0byB0aGlzIGZpZWxkLg0K
R290IGl0Lg0KDQo+IA0KPiBSZWdhcmRzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg==

