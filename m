Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E2A8B406
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955340.1349135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yHu-0004hJ-JO; Wed, 16 Apr 2025 08:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955340.1349135; Wed, 16 Apr 2025 08:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yHu-0004ey-G4; Wed, 16 Apr 2025 08:38:30 +0000
Received: by outflank-mailman (input) for mailman id 955340;
 Wed, 16 Apr 2025 08:38:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slpe=XC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4yHt-0004eo-0U
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:38:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29fcc9b7-1a9e-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 10:38:27 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Wed, 16 Apr 2025 08:38:09 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 08:38:08 +0000
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
X-Inumbo-ID: 29fcc9b7-1a9e-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuOhAX9oSRphGvKddoBKr8XXxUCblD/XhoI/4rwfNg+IdcLNBeh3cjGhagIzPsSrIWJCvGFDPTU0uPTKkXkAFcF8Myl1WNqDFrXh5bNrMhbZLO1pS06EurE3iCn13uP7VfqfL+I0RjO6Yw+GG8H2RNZqvK335zjH8LMyYfZagcq2mwI7oMDxTX87YBQ+5uzpgsYZbys0dNijlw+Fmav/yJUxLE7uZ8ftdhqdKUnfRkB+xnstYTYM2Q8TZc3kuexELpwsfxzEgd7o+gTV8T7dMvhf2cTAyxCEzXpGJYj5HFlRxHuaxA0aR620nsZyCyePLMEZ+6o/e8zjLaSOhMXv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxpyWd5KMf+liIXvCETDmdk9xIjSAg71tWtjTLusOhU=;
 b=upBpXR+UDVwPfT1T/eGELd3DpMwgubInfMqy17D0mO/RI/XhlO9P7ifWBnmg0pCXvXlyWchUWfDNHoNiiF06Dwg3yA/qM3q+nqfSCGPRFNk2Z6K51xGeGClcEhz+8JdKY4U+bZonPNNrCiQfZKu11IKrvoEwQ4tLGOCkudvmBVzI6o3TaA8Ela16rDEgfW1I9T6a/NABVJ+JTEnvKo35VwtTw/60RfgdlragW7L4el/vWpun/LoPGiTJiaRSXfhJYs8bxiN/6cd7goCmr7mbWggZEQV243IGfYxflNw9lbcd6kNgAWAvTiAtatbg7y/QMa4RqW+jC76ZNhd38jF7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxpyWd5KMf+liIXvCETDmdk9xIjSAg71tWtjTLusOhU=;
 b=dnK7OcxMDhHwO0ep6xZtqmNngO/l2QEEiEXqv1NmTtGYnl/Vd2lnXLKc5evZm8NItnwWYxwOraAbDaq1qjvLK08qd3iOD9vCw/XvmQct7I3SO90aLLXPmrLlMDDqs4/GTimLyopgQN6/QeXBpe4PYpNqBYY0NKRq0A+PJT7qoB4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
Thread-Topic: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
Thread-Index: AQHbnhN0GO5sSI+g2kqtQPzlgrAUG7OO0pKAgBbuLcCAADcSAIAAF55A
Date: Wed, 16 Apr 2025 08:38:08 +0000
Message-ID:
 <DM4PR12MB8451C5EDCEAB4592434706EEE1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-11-Penny.Zheng@amd.com>
 <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
 <DM4PR12MB84519E18C6F4FA7724C03751E1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <6c5b4f07-0f7a-47aa-9469-a5a7adffe27f@suse.com>
In-Reply-To: <6c5b4f07-0f7a-47aa-9469-a5a7adffe27f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7e4ee221-c559-45fb-93ed-8c519a00e044;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-16T08:37:59Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY8PR12MB7413:EE_
x-ms-office365-filtering-correlation-id: 0ea74874-dec3-4ab8-42cd-08dd7cc203d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlFsREdLU0R0bUpkTElLSjZNM0VuRm16RVF4RUdTUEN3MjZNaVVabzExL3JU?=
 =?utf-8?B?WXRYY2YrcTRZbDV0dXRRZFhqbWJrZkJsTTV6SCtjU3lpQ2J2U29FWlZwWnla?=
 =?utf-8?B?WUIvbitxajVYdVhUQjZhbmIwUS83RyttNEw2cmdGQnlVaER0eE0zemVRek51?=
 =?utf-8?B?dTkvYTlYZGhIdldHTW1qUFVCbU9IVEhFd2FiYmU5YXJaSnhOWG5BUnBDT0J4?=
 =?utf-8?B?aWk1OVU2YlRXWTlVSStCS3FNcGhwMi9nU054S0ZWK0ZEYUJZQlI2YU9vRm05?=
 =?utf-8?B?NXY4cHRrRFFwSTNtVVdmUmhzSFF1NWhmVGhnWHNaL29OSWVEMEpmWHZmbmVC?=
 =?utf-8?B?ek1HOEpLaUZUSUkvT3FjNkRwVk5MSXpzSFRNTHNnVVdVeFFlV2tDdHlXWFB4?=
 =?utf-8?B?MU9TU21ZazlnNHhlMDFOcXJVYTRZVlZkaTd5OUQ4d3NuYmQ3T1lJTCtWNllw?=
 =?utf-8?B?cGNQVHNsVFZPVFNlYWZSQXNYWkMyaVhUdlVSMWZJNms2c2RZRjl5dGphMU90?=
 =?utf-8?B?TGNIYmNHc3pkWm1uMDA5VU1JRUhnWUNZWHJ0TmVDMmg2OU1rZDBqRFpJek9q?=
 =?utf-8?B?ODlyUytSV21MNFAxWWUrV2I0U3NPelVGcHJPbTdtRjhFa2dXZElhbnRTQ0ta?=
 =?utf-8?B?bU5nSWN6anQ5czgzUFVvSXhLQTZ3T3ZPZnBNdTk4MXYzYVlwV1E0V2h1QytU?=
 =?utf-8?B?SVhDY1RtWjVMcHhzR3h3cEhCT0hRZGZCVUI5Z1lUV3IrajRFS3ZsZlo5MmFm?=
 =?utf-8?B?ZUM5cUlVbHRMeDZxd0llOEVkRVhhK00wcXNrSExkZy95aURtUUhGQXBEaE8z?=
 =?utf-8?B?bmhqNkUxdFZsc010bnlYbmtOWFMvVkRzMXFRMEdWNVlWQ0FRL1lSNjhYdG90?=
 =?utf-8?B?MVR2bERhYUdtNml5MzZxUlFBWlNmbjdqaU1meFdIM1hVOVZTdGtISlFsY1hU?=
 =?utf-8?B?cE1RYysrQlZLNHNoK29XNGNaZndlN2x5VFE1WkFWK1V5OC9jR2E0aW5DMkw2?=
 =?utf-8?B?SC9JeG50WE9CSnFIWTN1NW5CRlhnNjBsK2NlTVlHdVhXam9XU0lFMUNQdUdI?=
 =?utf-8?B?WmxST0grNWFKLzQ0RzI2djc0VEUrcTVlQVJVMkpQc0NKUExncS9MNk5la2hy?=
 =?utf-8?B?ZTAwQjRLdVBTck4ydXFWN0FzbVJpK1dkdGx2RWg4S3lzQ2VNVnpXblUrUFNS?=
 =?utf-8?B?THRxU013ektORkQ5SFozd0lQMWt5eG1ubWZRNXlTU0FTUWlPQ0M4VjFoa25n?=
 =?utf-8?B?akt4bENZRkJocjlzS2FPclJiWmtsajRDdEtKam9td0dIV2l2NjhEMzNQMUNQ?=
 =?utf-8?B?UDErV2g0ZUN4ZWhLdW1xNGVDeS9KUkREWjZ6TW1teGx5MERBcU93RFJuRjAw?=
 =?utf-8?B?Yy9EKzVaZ21wdWFKbFc0a0NJQmUyUDdIU0daSTUxNStzb2pWOEt2YjhtU1Ja?=
 =?utf-8?B?ajJZbjlFK2ZHUGxZZTNWNysrNmpiMXBTSnoxakRoRGpzdWhURld5dEs1a1FX?=
 =?utf-8?B?OGVNczZMWVptcEtlWFpPMnVJQnhXUnpDZVV5RDU2QzhkT3hpVVR0anpWdkFR?=
 =?utf-8?B?V1VLaEFQYXBWSTVqL3BaWlo5dENRekpUeDJDdlJVUFZhUkRDUkpYVmxKaDF6?=
 =?utf-8?B?amkzaG5GUkhnMWFVNk1Nd0JZdTRqdUJ3a0FZSXU5bEtRWXZDL0hXdFBZWEc5?=
 =?utf-8?B?LzBQQ05hRDdUZEx3QlRPR2c3ZzVNWnhPNmxMNDJzeE10R0hxUysyUnQ1elNX?=
 =?utf-8?B?bDJzSlJOdFpzWHFWSmR2a3EyT01ZUnVOS0FuSWFFSmpNQ3pqY0hQQkgrbjJU?=
 =?utf-8?B?U2dMZDgxWXBOdnpxRUlmaHo2Q2xSSVlkazNXOXdJTUx5dTVJVlNEV1JwWnJD?=
 =?utf-8?B?QU9JWWMwOUxxaHR4eVlLWlcyUFg0VGFkQ0Q4c1B4Yk1BR2thY0k5OTl3K3lw?=
 =?utf-8?B?SjRlVytIY3Y4bjRCV0JnNlgxSEwzeitFM1JKS0ZzVlVzUVVyYitXcVdzTXRI?=
 =?utf-8?Q?UFrAadJv3JBDnpY8B3sl/KHd3R8Qjw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEFVY042a29QWmJkWEMzQ200clZKT3VSZ0hHanJKZ3dNejVndUhBMmk4bU5p?=
 =?utf-8?B?YzFPR0g4RWNuYTF1dXV2aEZ3WTREenZ5d1BNeHpwOTAvemZTOVZ0RzNDMlMx?=
 =?utf-8?B?ZktZQStpYWUyUitQczZ2STF6V2JqdFdVUjZPU00zdlZSM0dkam1Od2UvVkhh?=
 =?utf-8?B?WnVFL2d6d0pzNFRLV09oaUhMdkpTTjNPN2FYa0FPNHRTaHhvQW8weUxMOW15?=
 =?utf-8?B?Q0J0N1ppRUE4VGFFbnMwM3ptNElBNmh3L0tvTlBMYjdKT2g2YjhBTkh0VEhI?=
 =?utf-8?B?a1pOQXE5a3Q5K1JCaFhWUFk5aDIvU1pqaU5aQWhHOXZWa2REdEo3emZkSGNt?=
 =?utf-8?B?UGlsTDhFZmxBeWd6L2oyY3F2aFhUcXExNDRpOE9ZL3BVNTQ1V1N6bW03SnRS?=
 =?utf-8?B?L2tvQ2VxU010dUc0by9ld285L0YrbWhUdnJyVjI4QVBLWURaekkrR0QzRW81?=
 =?utf-8?B?aTdZcy9PQTk4T2U4RmkydFdNNFZuUU9XVXlmNE02L3VncHhNQ2N1b2dqdUFZ?=
 =?utf-8?B?UVBPc28zMzU2YkJTdjdFSjkwcDdEZWhFSk4xbXpDU25CZVZwcWM0dTNoRSsr?=
 =?utf-8?B?TGZkajZvYjQvMnN3anNJSXVWZ1g3eStIdXZXRGVHMExIT0grc0JMTHZMd1ZF?=
 =?utf-8?B?SVVya3hVMklpdGF3ZkIwV3RSVG9RbWpWWmpDRGdZN1MxRkJ5Rk93ekxtNFBV?=
 =?utf-8?B?YUF6dFFwelZtYkc5WkdVK1V0TllySmM5NG8yK1c1aDNLekRWYXk5cnkydVhW?=
 =?utf-8?B?UFJ0bWtQdy9tZGgzVjZVRTdUMXhsbjdNSVdHVEEyblRsZ2NqYnV2UWttYTR5?=
 =?utf-8?B?K1JwWS9CU05JTC9Nd0NhSFh3NW5RaHg2RmMwazloYWtyWVJzUUswdXRZc2ZB?=
 =?utf-8?B?Ynhndmp3d0tvUlY0R1lhbU5OaFJCVFg3alByNnBYdEZPcWpXOTRiZ1YxRFJh?=
 =?utf-8?B?aGlBZGxiY2RwZDdGUWFITGhWNzdROEhSUTNIK1BiOUc1MjRxRlFSc01yYW9B?=
 =?utf-8?B?Nk1HUVlYbFRuY201elNQNm1lbC9HTmxpVjVNYXNWMnNybk5jTy9nTFFTeWhx?=
 =?utf-8?B?ZzB3cTJoLzFsNEZsU0hyZjBKc1JsNlFZOWozSTkwdm9iVkdtMURvWlB1MlQx?=
 =?utf-8?B?eVlURTZYaFBlRTZYVVk4aWVGU3EyMC9vbWhWb2wzRVA4cmFiTklpeFBmRk9H?=
 =?utf-8?B?SXM5TGt6T01nL1dtaFpBZk4xN25ZTlZmQ21zMGJVQWRheHBIK3lXaE5rVTc1?=
 =?utf-8?B?NUQrVkttcURiZ0IxZGlBeFZyUm9KN0RhSmxaRis5L2V1M2J0Q3YweGtpa2t6?=
 =?utf-8?B?VFhpQUhnTi9YMDZKeWovbXByd2lvNGJaODI0V0tZK1dja1N3S1V1UFphaUky?=
 =?utf-8?B?VE5USWpOdGJwSlJwYkdldlFXbnJScWJXSnV5THZBY2wwaU1TZGFydWJ6R3Rk?=
 =?utf-8?B?UW5vcnFVUFpCZk96ZjFyaVpONkxRb2FObkMxL0JSOTJTYm1XUXhKckZhaURz?=
 =?utf-8?B?T0VsT21DSUtJK0szdm04UnJHN1UySVQ5Z3B5M2pVQjRNcHgwY1pGb2dSNVN0?=
 =?utf-8?B?OGczTHVJbUY2cWI5bWdVc2t0S0tNeG55TWVGQmNENUhwUW53aThLaFg0M25s?=
 =?utf-8?B?Z3p4cGgranpmbWV2eHNNelVWS1BWK1Q2bWh5MVlSREIyRyticEwrMnRYcmlQ?=
 =?utf-8?B?Rm4zR2hvb0trUDJxM0dzNUJtREdJVnpGMUlPZjJpT1VGVk9ta043eXN1bHNM?=
 =?utf-8?B?N2tvZXRNbXNDVnhlQS9jbWtZR2U5VUhUMGUwdkVicXl3cEVZKy9oRDIrb08r?=
 =?utf-8?B?R3d4TUJlYXh1RVJFVkZhK2tZQWF1cmIxdk1lMnZNL25hakpJZUtqZXhGeC9L?=
 =?utf-8?B?ZmZ0YU5mSTRUZE9KZjZ3cUt0Z1BaajRCWlZ2KzIvUnRrdDNJSUtzUnoxRkY3?=
 =?utf-8?B?NTB2c3dHQ290bGE1SHd6Zno0OFlMSHJadUM5YnI4bFByVW4xNHcrQ211OU5R?=
 =?utf-8?B?Z2tBWjJXSHc0Qk56YUdzbUhKM25YeldzeUt4M3greVJ6dkpiSU12RjlrbmFk?=
 =?utf-8?B?Tm5rZnRrVG9pYVdUU3IyNFZwZkRuREMvS3lqMVNJYjN4dTZCK0dYVGpTeGdz?=
 =?utf-8?Q?9MV4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea74874-dec3-4ab8-42cd-08dd7cc203d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:38:08.6297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkZbqNTmgpJe65af9J0CqpZyJJhd56ZZFeuuI9KI1Dzw9ebf+TAh+NN1cqt6UHzcJ/w43SZ2Nd9IzxDMb1HtpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDE2LCAyMDI1IDI6MzcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29t
PjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDEwLzE5XSB4ZW4vc3lzY3RsOiBpbnRyb2R1Y2UgQ09ORklHX1BNX1NUQVRTDQo+DQo+
IE9uIDE2LjA0LjIwMjUgMDU6NTQsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxLCAyMDI1IDk6MTAgUE0NCj4gPj4NCj4g
Pj4gT24gMjYuMDMuMjAyNSAwNjo1MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0gYS94
ZW4vY29tbW9uL0tjb25maWcNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+Pj4g
QEAgLTU1Nyw0ICs1NTcsOSBAQCBjb25maWcgU1lTQ1RMDQo+ID4+PiAgICAgICB0byByZWR1Y2Ug
WGVuIGZvb3RwcmludC4NCj4gPj4+ICBlbmRtZW51DQo+ID4+Pg0KPiA+Pj4gK2NvbmZpZyBQTV9T
VEFUUw0KPiA+Pj4gKyAgIGJvb2wgIkVuYWJsZSBQZXJmb3JtYW5jZSBNYW5hZ2VtZW50IFN0YXRp
c3RpY3MiDQo+ID4+PiArICAgZGVwZW5kcyBvbiBBQ1BJICYmIEhBU19DUFVGUkVRICYmIFNZU0NU
TA0KPiA+Pj4gKyAgIGRlZmF1bHQgeQ0KPiA+Pg0KPiA+PiBBcyBwZXIgYWJvdmUgLSBlaXRoZXIg
bmFtZSwgcHJvbXB0IGFuZCB0aGUgZGVzY3JpcHRpb24gdGhhdCBTdGVmYW5vDQo+ID4+IHN1Z2dl
c3RlZCBhcmUgd3JvbmcsIG9yIGl0IGlzIHRvbyBtdWNoIHRoYXQgaXMgYmVpbmcgY292ZXJlZCBi
eSB0aGlzIG5ldw0KPiBjb250cm9sLg0KPiA+Pg0KPiA+DQo+ID4gV2UgaGF2ZSB0d28gc3lzY3Rs
LW9wIG9uIHBlcmZvcm1hbmNlLCBkb19nZXRfcG1faW5mbygpIGFuZCBkb19wbV9vcCgpLg0KPiA+
IEkgdGhpbmsgZG9fZ2V0X3BtX2luZm8oKSBpcyB0byBjb2xsZWN0IFBNIHN0YXRpc3RpYyBpbmZv
LCB3aGljaCBjb3VsZA0KPiA+IGJlIHdyYXBwZWQgd2l0aCBDT05GSUdfUE1fU1RBVFMsIHdoaWxl
IG1heWJlIGRvX3BtX29wKCkgaXMgbW9yZQ0KPiBmb2N1c2luZyBvbiBwZXJmb3JtYW5jZSB0dW5p
bmcuDQo+ID4gSG93IGFib3V0IHdlIGludHJvZHVjZSBhbm90aGVyIEtjb25maWcgQ09ORklHX1BN
X1RVTkUgdG8gd3JhcA0KPiA+IGRvX3BtX29wKCkgYW5kIHJlbGF0ZWQgaGVscGVycz8gSSBzdWdn
ZXN0IHRvIGludHJvZHVjZSBhIG5ldyBmaWxlIHBtdHVuZS5jIHRvDQo+IGNvbnRhaW4uDQo+ID4g
T3IgYW55IGJldHRlciBzdWdnZXN0aW9uPw0KPg0KPiAidHVuZSIgaXMgdG9vIG5hcnJvdyBpbW8u
ICJjdHJsIiBtYXkgYmUgYW4gb3B0aW9uLCBidXQgaG93IGFib3V0IHNpbXBseSBwbS1vcC5jLA0K
PiBmaXR0aW5nIGRvX3BtX29wKCkgcHJldHR5IG5pY2VseT8gUXVlc3Rpb24gaXMgd2hhdCBlbHNl
IGlzIGdvaW5nIHRvIGVuZCB1cCBpbiB0aGF0DQo+IGZpbGUuDQo+DQoNClRoZSBmb2xsb3dpbmcg
ZnVuY3Rpb25zIHdpbGwgYmUgaW5jbHVkZWQgaW4gcG1fb3AuYyBhbmQgd3JhcHBlZCB3aXRoIFBN
X0NUUkwgb3IgUE1fT1ANCiAgICAtIGdldF9jcHVmcmVxX3BhcmEoKQ0KICAgIC0gc2V0X2NwdWZy
ZXFfcGFyYSgpDQogICAgLSBzZXRfY3B1ZnJlcV9nb3YoKQ0KICAgIC0gc2V0X2NwdWZyZXFfY3Bw
YygpDQogICAgLSBjcHVmcmVxX2RyaXZlcl9nZXRhdmcoKQ0KICAgIC0gY3B1ZnJlcV91cGRhdGVf
dHVyYm8oKQ0KICAgIC0gY3B1ZnJlcV9nZXRfdHVyYm9fc3RhdHVzKCkNCkFuZCBkZXNjcmlwdGlv
biBmb3IgUE1fU1RBVFMsIEknbGwgdGFrZSBzdGVmYW5vJ3Mgc3VnZ2VzdGlvbiBhbmQgZm9yIFBN
X0NUUkwvUE1fT1AsIG1heWJlIGl0IHdpbGwgYmUNCmBgYA0KRW5hYmxlIHVzZXJzcGFjZSBwZXJm
b3JtYW5jZSBtYW5hZ2VtZW50IGNvbnRyb2wgdG8gZG8gcG93ZXIvcGVyZm9ybWFuY2UgYW5hbHl6
aW5nIGFuZCB0dW5pbmcNCmBgYA0KDQo+IEphbg0K

