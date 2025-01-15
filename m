Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA03AA11BB6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872199.1283153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXybh-00070E-4J; Wed, 15 Jan 2025 08:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872199.1283153; Wed, 15 Jan 2025 08:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXybh-0006yE-0L; Wed, 15 Jan 2025 08:18:33 +0000
Received: by outflank-mailman (input) for mailman id 872199;
 Wed, 15 Jan 2025 08:18:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Lts=UH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tXybf-0006vG-6S
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:18:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c82eb77-d319-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 09:18:29 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 08:18:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 08:18:25 +0000
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
X-Inumbo-ID: 4c82eb77-d319-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynto8wkk5LP+uh8S0IKiETHxxYxLGAhrKIF3y55SF9hxDtsdrbADwJwUqZf+fEcwIGB1y8YLSWjvGtjEfxB7DFISeuRgnwhdfLb6n9IVnuOwhWkN50A/TzsSTXP3/YByj1H85QHPLz5tf4kdXIrJZWusj6tie9N7QER5w62voaLoYkVl+yQ38FexfKr6oaG2hv1r2V5Z/YVwBxCG+uqhDkbO9ry5DDjiEXLgOmiVM86Sx6zeqj8P6dOqbQf0+NsWrQo0dgX1LIPuD4i7seSKtNrblvG6PAeaM2lHg2bCl3SxHM1y3NMKjziMZEfsI3wy4AmGl6kQTAqJNe0jaGJJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un9NIh0Ntbgut6g7kr8wapghiWutZgAzAANKgdnw29s=;
 b=bxvmYQocORRH5ga/wCKei53WIFXHR9Osj8Z/nYR/CC0nA6KQtE4EAVkk2oG32kyVucKCohOq9rGDO7RYlTCywRwLzyfFOf0I/0wWi6+0cpDIHMI1HBLnY01YDtzaGk27JHH999RKLJ0QS7P5nFxzgIL5hBp81pvdy13b9XkHL+/Jpc6bvf4g8gRKHdZIs2uHrHQR95qEtiQq1opLkxhck5/YIfKh2P0SSgNMSXaezBU4fkIcYRrj334tSbDJWnpD1HZgqwwGcQbOZVQoadHPDzzxvcl36JXApLzrRlYWamWDSzLqL09rDHLmLVmuuyN4IJwinUtCUVZ/pO0EETdodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un9NIh0Ntbgut6g7kr8wapghiWutZgAzAANKgdnw29s=;
 b=IKr4xNYyHpEJicGCbInj1MlgnNxAgoObedsmTV7BnkyJwwM4jLqTLUCJPciAdtwwXyFGuMIgWqm0f2ROGpF0RLK/9sutzjjOMg1NB1E8ilLa7I+B/sJr2jGYARzF4SdcBAL+5hVFP7kOexDfpbvmyGTyJNkUZG0v+IxC3JVYyho=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
Thread-Topic: [PATCH v1 03/11] xen/x86: introduce "cpufreq=amd-pstate" xen
 cmdline
Thread-Index: AQHbRVx5dnEd/G58t0eEMeNox50YY7MOb2uAgAksanA=
Date: Wed, 15 Jan 2025 08:18:25 +0000
Message-ID:
 <DM4PR12MB8451AF14F5B8609E54312F8DE1192@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-4-Penny.Zheng@amd.com>
 <e7f1b3c3-dce4-4a0e-b1cf-c6ba8af95290@suse.com>
In-Reply-To: <e7f1b3c3-dce4-4a0e-b1cf-c6ba8af95290@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=05087760-f5be-4c84-b0b8-e9e4fb3eee1a;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-15T06:04:03Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM6PR12MB4371:EE_
x-ms-office365-filtering-correlation-id: 9691198e-62cc-4ed3-37e5-08dd353d2edf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eU4ralU2U2lad2pnNUZxMzkvOEovYjRXZ0VpTmhlaGc1dTMrWFJqRlpKblFa?=
 =?utf-8?B?RWRqMFFrZkhzaVk3aFhuMHljNmV3TXJDU3FZU2dERWtTc05MbE5kUzJxeWhj?=
 =?utf-8?B?UzE4SSsyWWpRTXhTeFFNZnUrdVp4QThmMUUzMGk4V3JjNnhxdDRnbEFUOEhr?=
 =?utf-8?B?bmVzK2NIeXl6UmJFV1VnWXJUMk4xLzlMRjhNczJ2WDVYbnEwTjl1S1B3TWh0?=
 =?utf-8?B?cEVYYm0vblNjRjJJcmV3RDVMeHVBNUt4TkJvODdLRDgxZS84QlpOVTVDZjhX?=
 =?utf-8?B?SkFTUG5HUEVSRFZpN3doWHZ3QkhRNVRlOTQwUEQ4aEVLQ3phRTFsV3hmTURa?=
 =?utf-8?B?Q3RCZjAvSkpwSVRPbmMyRnBGekNqQTRuR0JoS0xwbVRMY01ZZHgzRVNobisx?=
 =?utf-8?B?VTNRSDZzOFA3cllsMEFQOXl4cThBYjlnZVpvVGxyb0xIeWNFZEQ2ek5JNlFL?=
 =?utf-8?B?UEc2N2gyeXFoUDBOaWorNlA0NDgvSFlyZ2ZVbFNlSFhjTEU5anQ5NXRZN3pM?=
 =?utf-8?B?VW9jOC9GZ0U1RitwYlIraUxsSVZleDE2dktocXRXb3B6dmFwQURqYnRDZ3RM?=
 =?utf-8?B?d3BJcWFvT0M5U2I2ak1uWWZadFFSZitidFBkNXpTRE9ES0o0bHFqOHJqQ0Vi?=
 =?utf-8?B?VFNLV2tNZG9qYjczMHh1dUQvSiszcEtQRUt3eG44TnlQTGt2QldaMVdpcmhG?=
 =?utf-8?B?QWlxMXdEUHp6TkRSY0FjNzRyWVZOMHludjkwWEc0MWh2R2hqb3BWZDV3VGZl?=
 =?utf-8?B?cjloNDhGUVJzeHhjNVM5TXUrQkVtRzBRTjQySkVka3hPMU02WVQ2TkovZ1BH?=
 =?utf-8?B?NlJLd2hPaHJhUVA1YzhReWk3dnV6Q0wxQmxySzAxeXMzYXdQK0lCbnh1cHV5?=
 =?utf-8?B?NXdCL1F3UGwyamI3RGd0VTdMVXd5RWNXTkJ0YmJuZmx3STNGUTJHK0JjREp1?=
 =?utf-8?B?ZFUyYURiQzFVSEhxMXdWRG1YMGdTRkZyYkhUVFBOcEhpWU5XR2pxLzRuanBS?=
 =?utf-8?B?SUVrZUl4WWtmL20wYnpxVmJrZk1kTlgxRDN1bDREcXU1TktkOC8wZFJUWkQz?=
 =?utf-8?B?WnVJOG5rVVpOd0FWbGR1ckpHbStBYjVSYmMxVS9LV0JORXN3YldyNGlTVjMy?=
 =?utf-8?B?Yi9BRTYxb3dOaURKN3JpUlVhL2h6SkprWnc1NEk3cDM4ZE85ZWlrN3ptV2dr?=
 =?utf-8?B?L0pzMW1MVU1lVkxpVUtEdU1ZeExzU24zK25PcysxczhGVFh0cDNiZ2YvOUZ3?=
 =?utf-8?B?czZ1VUNQSlVsSjQrNnc1dTkxZWRJRWFQa3M1T0h4YlhUOUpxdnF6cHF6L2wx?=
 =?utf-8?B?R1pLblNCNEplVGZON2FFY0liekpzRjBFSGdSUlY2VXk4UnAxbFJ0NGFvNjBM?=
 =?utf-8?B?QVA0SlQzS1RDazc4eEtGa1BleHQ4bzZsL01BMEhZQStQM0JkZHBHSUVoSzVB?=
 =?utf-8?B?WHhSYWVvSzBnQ2taK2x2cTQ1TFM0THEyKzNJM2JyZEZQZlR0T3R0dS9qQ2hS?=
 =?utf-8?B?V29oZU1zUXk0Q0lJYjZMSTQ3dXRKUXFmVkwxTjJJcDV6K1pvbzY2dzBUTm9C?=
 =?utf-8?B?cmFoTzlpcDFBYkhWM21ZWEtmQlhpelE4YzJDdjIrTnhrL3lTWFhwbVh6NGE2?=
 =?utf-8?B?Y1RNSXNOc1JjVVBoYlppbE9CYVliWnVFcmp6ampJMHBRNjZUR2ZKTEQvMSty?=
 =?utf-8?B?VWFIL3NrK3VUSjNIUURGTEJOb1dmZWxta2gzSEtaUVZobUk5WTJZUjdRMHpY?=
 =?utf-8?B?WUhHTi9LTDB5WDFxOFJkcG81azFrL3ROOTFBdXQ2WGh4N1hRa0kzbCtTdlFI?=
 =?utf-8?B?S1pqSUNkQmRRMnpsYjhBSVZzQzVaa3lCTUYySVk0UG5yL21jMm8yem91NmZz?=
 =?utf-8?B?SCs4WElLUFYyVUNuNFZFSU9hdThZV3JCZzd4N3orNkxhMHVCeUNZQWQvU05w?=
 =?utf-8?Q?kfYsr8JInv0KnZznc9dzBySWGHwQPZVQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1A2QXVtSEJ6bXhCMThjeUcvYkZ2aG1DMUxwUjFTdlc1aFVhOHdvSzhzamM1?=
 =?utf-8?B?ckpFSGdaczJIa1JUNDBBc2MyQ2duemZKQVlVWVcvbjJUNUk3Ykd4UFBIVXAv?=
 =?utf-8?B?L3kvd0JSS01jRTFRVEZYSHVFeWZueUFCQzBGWWVmWitPdFAweGhTUm5ZZVhw?=
 =?utf-8?B?RmU4UUZJb0Z2N1NmZVBSeVh3bkl6Ukx6M1A4a0sxNUtaaGJObGxwNWhUMUlR?=
 =?utf-8?B?amVXSElPMVRvM0FOci9aakFOVndJejc3NU1Rc0JoYWprSTIwSTZSajhlZVp1?=
 =?utf-8?B?cnBLQWJPUDM3SXZ6Z3NvSWI3cENzMXVpRWU4OU1PemtsZDZKRjF5ZFIzNHpO?=
 =?utf-8?B?R0d4YXgvRURxdGtYcW5kWlFxUVExbXZYMHBWSEdUUGlheUNqMVYra29PVzFo?=
 =?utf-8?B?Nm1haXgyUGFaK24ySFlsdm1ZaEZyZUt4LzYzWUwvZjQ0UzB5dHV2and2aGhO?=
 =?utf-8?B?WDgza0ZFdm1iMFhoYml5Sjg4WnFzQjliRGRPaXBjczQvMHIxYnMvcHpFeHFU?=
 =?utf-8?B?SURiR2VYZUdpbGVJZkdzV2ErWFRqenVET09qcHZMQm1qYStidlJIMUdSc21T?=
 =?utf-8?B?SysrdnNGT3pleDVHZC9kS0dmVjZWSS9NQzFycnpCRHFlRUNVYmY5OEVLQWZw?=
 =?utf-8?B?YnliRStCSVRqaWtTK08xR0xiK3Btejg3dW41WlNsdW1hWnBNYWNGUEZxdGFP?=
 =?utf-8?B?RFRjTXhJbmltdlJOMWRFNG04cDRqcGowTjkxNjZqWnlObTJvM0x5VU5GcGVC?=
 =?utf-8?B?cUFscURMMWRuQkh4YTBpRGc5Q3JzRWplbGpsNllEcmhWSytOcGlhN2s5ci8z?=
 =?utf-8?B?cVVja003VGF0dTJPWUo1N2JoSVRlRmFoQVlpSjUyN0E3aWxFWHA3YWsyZm9n?=
 =?utf-8?B?VVNuY3BEblpxWTQraWdJUVZFL1JVNy9lUlkvWkFrd3N4b1kwVjhRM3JWcFA2?=
 =?utf-8?B?cjBQRlhpSTBxeEwvWTdYb2E4VE9hRi9jaWhsc00yN1JvVERmcjlEY1lXSHVV?=
 =?utf-8?B?UWRBak9OT3VWOU1UVU9NVmcyU2V3bVRrVTZQMjdWekVUVmh0bVhxZ0lKWVVN?=
 =?utf-8?B?L2ZoUXA3c2FzcW9vd0t5WGRabGIyb2owOG1MWEdyc0w1cSt6ZnZyUW51b2Vp?=
 =?utf-8?B?MHFFL1dsaEc1K1ZEV1hhTDNpMERaVHl6aC9xNWpxN1dtbnVKVnZOQ2ltZ2Fn?=
 =?utf-8?B?UEd0SzA1SE1uN1RNT1cvME5PeEhMOW9scWdBdUc4RWRROG4zR0YyanFhdGN5?=
 =?utf-8?B?aUI2N3NId3V1YlhtVy9XU0RMSTJObm5PeThGblFmQjVkQmJSeTR0dkpZb052?=
 =?utf-8?B?c2wxT05OanU0SSsrbmFSdm9KVlZkckhGZnNxSzJtVWhDYTZiWE5RUDgySFQ4?=
 =?utf-8?B?djRmK0hTcFA3WWpHelZFdW5mTkkycGFJeVdBZ0JrQVNFckRyb2tkRHdQK0NC?=
 =?utf-8?B?Z3pZeVE1UmRBVHJZc0hmaE9zRkU5VGkwVFNQN2MrVVJUTHlrcVh5cnI2T0RS?=
 =?utf-8?B?OVBYbWRJakRSQkdzUGxYVFlTSzAxek1VelRsSHpmeVN4RGU1MmFpaFJhbG41?=
 =?utf-8?B?QlY0b2p2TllEOGtBdlRxRGRiT0lIcWZOdWI0NTJHbW94L0tNVTZvUzlLTTdK?=
 =?utf-8?B?RFJKLzJ3ZlJIY1gySkFzY3FsNE5QamhPT1hTcnl2QjdYT2V1bWdpTXVKMlps?=
 =?utf-8?B?TURyRk9jcnB0K2kyMk9TL0grb2lVeGl3WmNJU1ZPYWZKVkVIZ0FleitBQm9O?=
 =?utf-8?B?c1JuM1d1bWV0SDV5ZUpkYjU1WlpjeTVwNHk4MWxmSEZ6c0FBMmFKcGYvVUNF?=
 =?utf-8?B?Qll5a211NktHTktQcXhkalJXQk1mYnVmQUd1MGJYVWQvSElqTjVzcEs1TkZw?=
 =?utf-8?B?MWhFb0V4N1FUZHNsU1RHd1FRWGF4YUFnSmJidXNLUkxXUUdXTzNEWlVoT2l2?=
 =?utf-8?B?TFI2NS9VKzF0cTlPQ0djWk5yNDJIRmZOQmtJWGY0RjdaK0ltU1A5QjhJQUJt?=
 =?utf-8?B?TUFNcW9rcjFhdDY4TXBObnNZYnVmTUJXMk1JYlBLUE56ZUJwNkZTYjdVWUtB?=
 =?utf-8?B?R0hSVi9YaXBkMzdOTGRFWnFhelF3UUZVdVlJamphNGFlb1UvbW8xMU1hd0hZ?=
 =?utf-8?Q?zw/g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9691198e-62cc-4ed3-37e5-08dd353d2edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:18:25.1921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TS1WnkxxIzXik4mknND6BfUZyi+mbPWAweo6h0P9rAqohje6kgnNwrZ0sIZBag59Y+SBzkNX5KFFC1awK8u2EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDU6NTkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMDMvMTFdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtcHN0YXRlIiB4ZW4NCj4g
Y21kbGluZQ0KPg0KPiBPbiAwMy4xMi4yMDI0IDA5OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL01ha2VmaWxlDQo+ID4gKysrIGIveGVu
L2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9NYWtlZmlsZQ0KPiA+IEBAIC0xLDQgKzEsNSBAQA0KPiA+
ICBvYmotJChDT05GSUdfSU5URUwpICs9IGFjcGkubw0KPiA+ICBvYmoteSArPSBjcHVmcmVxLm8N
Cj4gPiArb2JqLXkgKz0gYW1kLXBzdGF0ZS5vDQo+ID4gIG9iai0kKENPTkZJR19JTlRFTCkgKz0g
aHdwLm8NCj4gPiAgb2JqLSQoQ09ORklHX0FNRCkgKz0gcG93ZXJub3cubw0KPg0KPiBQbGVhc2Ug
b2JleSB0byBhbHBoYWJldGljIHNvcnRpbmcuDQoNClN1cmUsIGFuZCBJJ2xsIGFsc28gc3RyaWN0
IGl0IHdpdGggQ09ORklHX0FNRA0KDQo+DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLXBzdGF0ZS5jDQo+ID4gQEAgLTAsMCArMSw2NiBA
QA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+ID4g
Ky8qDQo+ID4gKyAqIGFtZC1wc3RhdGUuYyAtIEFNRCBQcm9jZXNzb3IgUC1zdGF0ZSBGcmVxdWVu
Y3kgRHJpdmVyDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBBZHZhbmNlZCBN
aWNybyBEZXZpY2VzLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQo+ID4gKyAqDQo+ID4gKyAq
IEF1dGhvcjogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4gKyAqDQo+ID4g
KyAqIEFNRCBQLVN0YXRlIGludHJvZHVjZXMgYSBuZXcgQ1BVIHBlcmZvcm1hbmNlIHNjYWxpbmcg
ZGVzaWduIGZvcg0KPiA+ICtBTUQNCj4gPiArICogcHJvY2Vzc29ycyB1c2luZyB0aGUgQUNQSSBD
b2xsYWJvcmF0aXZlIFBlcmZvcm1hbmNlIGFuZCBQb3dlcg0KPiA+ICtDb250cm9sIChDUFBDKQ0K
PiA+ICsgKiBmZWF0dXJlIHdoaWNoIHByb3ZpZGVzIGEgZmluZXIgZ3JhaW5lZCBmcmVxdWVuY3kg
Y29udHJvbCByYW5nZS4NCj4gPiArICoNCj4gPiArICovDQo+DQo+IE5pdDogVW5uZWNlc3Nhcnkg
ZW1wdHkgY29tbWVudCBsaW5lIGF0IHRoZSBlbmQuDQoNCkFjaw0KDQo+DQo+ID4gKyNpbmNsdWRl
IDx4ZW4vaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL3BhcmFtLmg+DQo+ID4gKyNpbmNsdWRl
IDxhY3BpL2NwdWZyZXEvY3B1ZnJlcS5oPg0KPiA+ICsNCj4gPiArdWludDE2X3QgX19yZWFkX21v
c3RseSBkbWlfbWF4X3NwZWVkX21oejsNCj4gPiArDQo+ID4gK3N0YXRpYyBib29sIF9faW5pdCBh
bWRfcHN0YXRlX2hhbmRsZV9vcHRpb24oY29uc3QgY2hhciAqcywgY29uc3QgY2hhcg0KPiA+ICsq
ZW5kKSB7DQo+ID4gKyAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgIHJldCA9IHBhcnNlX2Jv
b2xlYW4oInZlcmJvc2UiLCBzLCBlbmQpOw0KPiA+ICsgICAgaWYgKCByZXQgPj0gMCApDQo+ID4g
KyAgICB7DQo+ID4gKyAgICAgICAgY3B1ZnJlcV92ZXJib3NlID0gcmV0Ow0KPiA+ICsgICAgICAg
IHJldHVybiB0cnVlOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJldHVybiBmYWxzZTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IF9faW5pdCBhbWRfcHN0YXRlX2NtZGxpbmVfcGFyc2Uo
Y29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqZSkgew0KPiA+ICsgICAgZG8NCj4gPiArICAgIHsN
Cj4gPiArICAgICAgICBjb25zdCBjaGFyICplbmQgPSBzdHJwYnJrKHMsICIsOyIpOw0KPiA+ICsN
Cj4gPiArICAgICAgICBpZiAoICFhbWRfcHN0YXRlX2hhbmRsZV9vcHRpb24ocywgZW5kKSApDQo+
ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgImNw
dWZyZXEvYW1kLXBzdGF0ZTogb3B0aW9uICclLipzJyBub3QNCj4gcmVjb2duaXplZFxuIiwNCj4g
PiArICAgICAgICAgICAgICAgICAgIChpbnQpKChlbmQgPzogZSkgLSBzKSwgcyk7DQo+ID4gKw0K
PiA+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAgICB9DQo+ID4gKw0K
PiA+ICsgICAgICAgIHMgPSBlbmQgPyArK2VuZCA6IGVuZDsNCj4gPiArICAgIH0gd2hpbGUgKCBz
ICYmIHMgPCBlICk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY3B1ZnJlcV9kcml2ZXIgX19pbml0Y29uc3RyZWwNCj4g
PiArYW1kX3BzdGF0ZV9jcHVmcmVxX2RyaXZlciA9DQo+DQo+IF9faW5pdGNvbnN0X2NmX2Nsb2Ji
ZXINCj4NCg0KQWNrDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZy
ZXEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4g
QEAgLTE0OCw2ICsxNDgsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBjcHVmcmVxX2Ry
aXZlcl9pbml0KHZvaWQpDQo+ID4gICAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFfbm9uZToN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICByZXQgPSAwOw0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICAgZGVmYXVsdDoNCj4gPiArICAgICAgICAg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIlVuc3VwcG9ydGVkIGNwdWZyZXEgZHJp
dmVyDQo+ID4gKyBmb3IgdmVuZG9yIEludGVsXG4iKTsNCj4NCj4gVG9vIGxvbmcgbGluZSAodGhl
IGZvcm1hdCBzdHJpbmcgaXRzZWxmIHNoYWxsIGJlIGtlcHQgYWxsIG9uIG9uZSBsaW5lLCBidXQg
dGhlDQo+IFhFTkxPR19XQVJOSU5HIGRvZXNuJ3QgbmVlZCB0bykuDQo+DQoNClVuZGVyc3Rvb2QN
Cg0KPiA+IEBAIC0xNTYsNiArMTU5LDMxIEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIGNw
dWZyZXFfZHJpdmVyX2luaXQodm9pZCkNCj4gPiAgICAgICAgICAgICAgYnJlYWs7DQo+ID4NCj4g
PiAgICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOg0KPiA+ICsgICAgICAgICAgICByZXQgPSAt
RU5PRU5UOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgZm9yICggdW5zaWduZWQgaW50IGkgPSAw
OyBpIDwgY3B1ZnJlcV94ZW5fY250OyBpKysgKQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAg
ICAgICAgICAgICAgICBzd2l0Y2ggKCBjcHVmcmVxX3hlbl9vcHRzW2ldICkNCj4gPiArICAgICAg
ICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgICAgIGNhc2UgQ1BVRlJFUV94ZW46DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgcmV0ID0gcG93ZXJub3dfcmVnaXN0ZXJfZHJpdmVyKCk7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICAgICBjYXNl
IENQVUZSRVFfYW1kX3BzdGF0ZToNCj4gPiArICAgICAgICAgICAgICAgICAgICByZXQgPSBhbWRf
cHN0YXRlX3JlZ2lzdGVyX2RyaXZlcigpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBDUFVGUkVRX25vbmU6DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgcmV0ID0gMDsNCj4gPiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4g
PiArICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HICJVbnN1cHBvcnRlZCBjcHVmcmVxIGRyaXZlciBmb3INCj4gdmVu
ZG9yIEFNRFxuIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAg
ICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgaWYgKCByZXQgIT0gLUVO
T0RFViApDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAg
IH0NCj4gPiArICAgICAgICAgICAgYnJlYWs7DQo+ID4gKw0KPiA+ICAgICAgICAgIGNhc2UgWDg2
X1ZFTkRPUl9IWUdPTjoNCj4gPiAgICAgICAgICAgICAgcmV0ID0gSVNfRU5BQkxFRChDT05GSUdf
QU1EKSA/IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpIDogLQ0KPiBFTk9ERVY7DQo+ID4gICAg
ICAgICAgICAgIGJyZWFrOw0KPg0KPiBJcyB0aGUgY29kZSB0byBoYW5kbGUgQ1BQQyBub3QgYXBw
bGljYWJsZSB0byBIeWdvbiBDUFVzPw0KPg0KPiBXaGF0IGFib3V0IHRoZSBJU19FTkFCTEVEKENP
TkZJR19BTUQpIHRoYXQgdGhlIG9yaWdpbmFsIGNvZGUgaGFkPyBEb24ndA0KPiB5b3UgbmVlZCB0
byBtaXJyb3IgdGhpcyBpbiBzb21lIHdheT8NCj4NCg0KR29vZ2xpbmcgdGhlIEh5Z29uIGNwdSwg
YXMgaXQgaXMgYmFzZWQgb24gWmVuIHNlcmllIGFuZCBhbHNvIGFtZC1wc3RhdGUNCmZlYXR1cmUg
aXMgZGV2ZWxvcGVkIGZvciBaZW4gc2VyaWUgZm9yIHRoZSBmaXJzdCBwbGFjZSwgdGhlIG5ldyBz
d2l0Y2gtY2FzZSBjb2RlIHNoYWxsDQphcHBseSB0byBIeWdvbiBDUFVzIHRvbw0KDQo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gQEAgLTU3NCw2ICs1NzQsMTIgQEAgcmV0X3Qg
ZG9fcGxhdGZvcm1fb3AoDQo+ID4NCj4gPiAgICAgICAgICBjYXNlIFhFTl9QTV9DUFBDOg0KPiA+
ICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgaWYgKCAhKHhlbl9wcm9jZXNzb3JfcG1iaXRz
ICYgWEVOX1BST0NFU1NPUl9QTV9DUFBDKSApDQo+ID4gKyAgICAgICAgICAgIHsNCj4gPiArICAg
ICAgICAgICAgICAgIHJldCA9IC1FTk9TWVM7DQo+DQo+IEVOT1NZUyBpc24ndCBhcHByb3ByaWF0
ZSBmb3Igc3VjaCBhIHNpdHVhdGlvbi4NCj4NCg0KSSd2ZSBtaXJyb3JlZCB0aGUgcmV0dXJuIHZh
bHVlLCBzbyBtYXliZSAtRUlOVkFMIGlzIGJldHRlcj8NCg0KPiA+IC0tLSBhL3hlbi9kcml2ZXJz
L2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVx
LmMNCj4gPiBAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjaw0KPiA+
IHNldHVwX2NwdWZyZXFfb3B0aW9uKGNvbnN0IGNoYXIgKnN0cikNCj4gPg0KPiA+ICAgICAgaWYg
KCBjaG9pY2UgPCAwICYmICFjbWRsaW5lX3N0cmNtcChzdHIsICJkb20wLWtlcm5lbCIpICkNCj4g
PiAgICAgIHsNCj4gPiAtICAgICAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyAmPSB+WEVOX1BST0NF
U1NPUl9QTV9QWDsNCj4gPiArICAgICAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyAmPQ0KPiA+ICsg
fihYRU5fUFJPQ0VTU09SX1BNX1BYfFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyk7DQo+ID4gICAgICAg
ICAgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJFUUNUTF9kb20wX2tlcm5lbDsNCj4gPiAgICAgICAg
ICBvcHRfZG9tMF92Y3B1c19waW4gPSAxOw0KPiA+ICAgICAgICAgIHJldHVybiAwOw0KPiA+IEBA
IC05Miw3ICs5Miw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrDQo+ID4gc2V0dXBfY3B1
ZnJlcV9vcHRpb24oY29uc3QgY2hhciAqc3RyKQ0KPiA+DQo+ID4gICAgICBpZiAoIGNob2ljZSA9
PSAwIHx8ICFjbWRsaW5lX3N0cmNtcChzdHIsICJub25lIikgKQ0KPiA+ICAgICAgew0KPiA+IC0g
ICAgICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzICY9IH5YRU5fUFJPQ0VTU09SX1BNX1BYOw0KPiA+
ICsgICAgICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzICY9DQo+ID4gKyB+KFhFTl9QUk9DRVNTT1Jf
UE1fUFh8WEVOX1BST0NFU1NPUl9QTV9DUFBDKTsNCj4NCj4gTml0IChzdHlsZSk6IEJsYW5rcyBw
bGVhc2UgYXJvdW5kIGJpbmFyeSBvcGVyYXRvcnMuDQoNCkFjaw0KDQo+DQo+ID4gLS0tIGEveGVu
L2luY2x1ZGUvYWNwaS9jcHVmcmVxL2NwdWZyZXEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2Fj
cGkvY3B1ZnJlcS9jcHVmcmVxLmgNCj4gPiBAQCAtMjgsNiArMjgsNyBAQCBlbnVtIGNwdWZyZXFf
eGVuX29wdCB7DQo+ID4gICAgICBDUFVGUkVRX25vbmUsDQo+ID4gICAgICBDUFVGUkVRX3hlbiwN
Cj4gPiAgICAgIENQVUZSRVFfaHdwLA0KPiA+ICsgICAgQ1BVRlJFUV9hbWRfcHN0YXRlLA0KPg0K
PiBNaWdodCB0aGlzIGJldHRlciBiZSBDUFVGUkVRX2FtZF9jcHBjPyAicHN0YXRlIiBtYXkgbWVh
biB2YXJpb3VzIG1ldGhvZHMuDQo+DQoNCk9rYXkuIEknbGwgY2hhbmdlIGFsbCBhbWRfLy1wc3Rh
dGUgZGVmaW5lZCB2YWx1ZXMgdG8gYW1kXy8tY3BwYw0KDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL3N5c2N0bC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+
ID4gQEAgLTQyNCw2ICs0MjQsNyBAQCBzdHJ1Y3QgeGVuX3NldF9jcHBjX3BhcmEgeyAgfTsNCj4g
Pg0KPiA+ICAjZGVmaW5lIFhFTl9IV1BfRFJJVkVSX05BTUUgImh3cCINCj4gPiArI2RlZmluZSBY
RU5fQU1EX1BTVEFURV9EUklWRVJfTkFNRSAiYW1kLXBzdGF0ZSINCj4NCj4gU2ltaWxhcmx5IGhl
cmUuDQo+DQoNCkFjaw0KDQo+IEphbg0KDQpNYW50IHRoYW5rcw0KUGVubnkNCg==

