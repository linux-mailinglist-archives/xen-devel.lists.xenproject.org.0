Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743EEB40B9D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107136.1457669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUSm-0004CB-4t; Tue, 02 Sep 2025 17:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107136.1457669; Tue, 02 Sep 2025 17:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUSm-0004Af-1R; Tue, 02 Sep 2025 17:06:32 +0000
Received: by outflank-mailman (input) for mailman id 1107136;
 Tue, 02 Sep 2025 17:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/Ey=3N=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utUSl-00049G-2W
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:06:31 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b31d918-881f-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:06:30 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAWPR03MB9154.eurprd03.prod.outlook.com (2603:10a6:102:33f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 17:06:26 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:06:25 +0000
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
X-Inumbo-ID: 2b31d918-881f-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QchOGZc/kdJCrmimdS3flJ8osyccZPq0C36E8oY74Jv7qOaTKTctR1No2Qv6v+j3cAYhGQj/L8rTbvqpNJ2kWvo5JxJNtZ4BXFq/+OCVkJGi4x8ze8eqg4bD3aJlBVc+lvgR2LMtxSX/vJSCEmBZfJC2QqqWe9srNjgmXk54TieFqta42wBRt4EXUo8H9j/AHph5+yPoTYqjF6B2wc56DoVTI6JhtSJeYfgx22exLzXh4NRZQPJp29qSfYR2IKiYz1TePHaundRkPN7haMaaDQt+Rn0WDuli9QxzJvU1uv2BeM6YUbDcPAzCO/BvlCEjjQivelUrkyolK9jPem+ZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIp0ZermkvYdId4d+XAtfCKgp2r+e2osQHFdaiDPTJA=;
 b=cvXBrNW8Hg9slBdlc4CMdBUfDS0bl2pNvzFLUBBk91uXXvGgS2qYgJp171bLShnnuUA08uvStYeazR+ZmhZMN0/Bgr4hkPi97ogN1GyhuoNSX5PCnvIGqIEJbQI7hh9120JQI7zQRq5gox3MhkF3cFHMUQeFqUIsezLsUlARuqosTwHTmQnUM7sX5CV0EJtF8/pl0BnmkMuidnCa2WWsqvUxpltA5Ps4Z7KK9aicQM8ZO5YM2xIII+xOXZUc3yEViSmqouBWl/qT4nZkRTCts9cNwrafBeOqClNmJ+yjQoP+6+yUjRGLaQ00MRsnncnt3fIFY3R3hxFPuBxM4rzwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIp0ZermkvYdId4d+XAtfCKgp2r+e2osQHFdaiDPTJA=;
 b=dSCdUJMowbxjJBSdS6pl78MwVhqLf2pHgHsg+ZKwFlyos+hFzc9lMijDkSLkG6crljL1xDOr1PCJYUbf2vsmMf60doxaAbA6HCBHfW2jQWUDzGiHFA3qjnTwK3ztMBEYadYlynuFPGbY3iFIyxcNNl5tKlyKf+AJ8MVjFueelv2U+Twfos8/H+7h4E/iKMGklVUtRgLsmTZbmVPHb4ly/3KaU23F1r2oXwAzwV4w/I3xW/Hbor7TK+fHYrTpVb1I3iJ7Epwz4F/TeG4CDJ/Kz47I7gxG8iFrXTSXl5rpF1TdfOj981by+YZlNznnMOwlqxud3jBimfdDlOCYlyFrgw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH v5 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcGP7fr2aNz8WgzkeaOcGbW6a0ZbR/78+AgAA2BgA=
Date: Tue, 2 Sep 2025 17:06:25 +0000
Message-ID: <6d1492bc-195d-4b74-85ca-82b5565dba1f@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <34b86693e1031a3ec786a38a0510f047c6c708da.1756481577.git.leonid_komarianskyi@epam.com>
 <862df090-cbe2-44e9-8c7a-733f3bfd46ad@xen.org>
In-Reply-To: <862df090-cbe2-44e9-8c7a-733f3bfd46ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAWPR03MB9154:EE_
x-ms-office365-filtering-correlation-id: d4577c3f-ec50-44b8-5e20-08ddea430ca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUNoUzZzYW1lWWRScWJBcDk0RDNDMGN0aU9lQkpXU0J6aTJKd1E2SmZTOGNV?=
 =?utf-8?B?WTFxenRJcEU5cTN4QUd6cTRUMnpYQis1YzAyUUdsZitCUVdNL3JPT1I0TnA5?=
 =?utf-8?B?KzNFTGtQbjB3RTFCbUhuVmZZUUd3azdhb1NRUzA5QmxjRExsWkI0TkVHU2Q3?=
 =?utf-8?B?MXg0Zk1pbitvK0dQWE4vWGJwNG12ditCQjhYOEpZYUJxbmpsK20vOWpYdlRl?=
 =?utf-8?B?U09CemM4Q3pMejMzTHBaNXlkZkdxVGwxZkFkTW1VMi94bldaRnFnRC9SVzNm?=
 =?utf-8?B?T3cyVC95dWdsM2xwM01DdDZGRGU2MTBKMENPMm5XbXcxMnVOME9EMDNhVEtC?=
 =?utf-8?B?Unc4SW1XS0U2SDlkdlEvNlVnbkMxRmkwRmRyNzdhMStVTDI0MS8zS2t2NENw?=
 =?utf-8?B?bjhNQjh6NnQwM2NVOTVyWXFQSmFqWTlvVVkrWlRRZTFPY0FIWlNnWkJxVU5Y?=
 =?utf-8?B?enVEeHRvRGJwQkd0VVhtaklzbXRBR0lIVlk2WlBqdC9WQi9LODZ3R0pwUmRv?=
 =?utf-8?B?OTFKUU83ZjNTSjQzVHBsVjBOL1UrVGI1UmhZRk9EM3kwalpqTks0dXdxdTE0?=
 =?utf-8?B?YkVPNG9HUnFkVlQzNlNVNFNsa1d0c1BpaGNhZjc3bDUxL2VhZTFLOFJMWmFR?=
 =?utf-8?B?YStOL0grTzMyTy9wcXd0cm9WOXJLbVhIb0JkaCswR0J4TnQ2ejFUZ0RVRVE5?=
 =?utf-8?B?NFlIVHF5N1YzSWJ3Tnhxb3ZSOW1QcDdOMnRyWWxHVkN1K2YwSDBqdkRTK25o?=
 =?utf-8?B?M1VmQjdieWcyaTBZaXhmVHlQUGFBaEFwbzg3Q2dtYXlCeW55T05CQXBFOEJG?=
 =?utf-8?B?MnF0RmFOZXhKTWUyeG5BaWNoeVFIa0Z3b3BEeFlCbVVlVU10Qlo3dFRsNTA0?=
 =?utf-8?B?T0FDZm95TnF3NERnMVQxM0hLdStyRVV2V0pjaFN5UUFCeDNsYVJzdjllYXIz?=
 =?utf-8?B?bG1TamVhSUJsMEJNN3dkYURocVVaRmdZUEFPRDczdEpyKzdHd283QUp4RGVz?=
 =?utf-8?B?Rnkyc1c0R2cxQXFoYWkwTVg4RzRxSjlKNDQ5bUYyRzMyU3dSMVR1bFgyUkwr?=
 =?utf-8?B?bnFkWnE0YWRxNTM4UEh5UmpoekxlVDZtRGNhMDRsdktJeXRDUXJCWTZRR29m?=
 =?utf-8?B?eUFuRytYUXAwQThUUmdCRHNNVlVwR3Z5UmdueTZkSWkrM3o0TFExcWtHYVQz?=
 =?utf-8?B?bVFGeXplVkJNY1Fjc0ZoTEE3MzY2Mm9JMnI0WmoySHc2dnBmWnBTQjNFWFZz?=
 =?utf-8?B?T1hkclBoOHNtRmMzdXdCVTMxY2N1WVI3YTI5c3lCNmJ1Y2JFeDBPRnFzaXZD?=
 =?utf-8?B?Vm1rRUpmMVlld2tGeFEzUHp5eTh1SVRsK0doaXU4NnZaZjNTRXYvNEROV0dS?=
 =?utf-8?B?czlHV241R2YrYURoTkhKdVpXalF2SFZMcXFZZlZRcDZtaGw2c21mbWhDejN2?=
 =?utf-8?B?ZE9UUmk0eG15NS9kbnlDQVRxTTVqcld4SHFxZlZiejdLSW5MWHMwS1JySnBj?=
 =?utf-8?B?STFrTUZkZVNJd2EyWS83cUtDUGVwUDMwbzlrdTlWbmdJcHBkM1lxeldhRTR1?=
 =?utf-8?B?aE51d1lsUmFTMjREU0tkUVRRQ09TR0VDWWNEVkQ2VmwzU1E2MFdSK0srMW9U?=
 =?utf-8?B?TTJ0eUEvYTlCTXFndE9jWExFeTBPc1U3Y1NKVE1SeHFucERMTmRmT2d2NnVH?=
 =?utf-8?B?Y0ttTk1pNUo2YTZ1bDlWT0NnSjBPdGg0Y3ZhekxaYm14bGpkbGhGZWZvTXFN?=
 =?utf-8?B?R25QREJReE1QNmkrN3ZhVDE5RnpkRGtEQ3VrUXZnZHhtMS9NTytVaDlLNm0w?=
 =?utf-8?B?QkdzSTQ5Yit1anJFSHhKaE1OeThqamcyU1VrdzBUdzdKS1JjRFdJNm5acWIx?=
 =?utf-8?B?cWhLdENCUEFLVzU4WHZ5cjZvZ0czOG5OTzZTOWJreEp1NU9oQlJoOU1pVWtR?=
 =?utf-8?B?VVFReUZHY0VjWVNNSmpCZVBpSXIzU3dpOFBWZ1FhRXoyRWVVU1NNdi9iWndC?=
 =?utf-8?B?TFhIajFkZlBBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWtZRE0vVjBIOEU5Wkh6S215NjRTSW9LMUtsbEdCK3l3Uk5QZnhkeDAxVk1S?=
 =?utf-8?B?dkM5YzZ6M3dEZ1oydEVWNXJSY3JVQi9FVHFKUkkrV0lsektGdG04bmxaNjFw?=
 =?utf-8?B?ZTZ3Vk5ya2hGNGtSRnRDdUMyWDVzRTRwd3FHejVweVZFVUFROTJEdEtxb05P?=
 =?utf-8?B?ODFkbUoyS1F4Qnc5MkIwUzE5ZHV5cmxtSlg0YjRCYjl2NUpJZnNzSHV2aEN5?=
 =?utf-8?B?WmQwUnVkbU5MaS9PbzFxMHpZSWFmVS9RQUN3RWExaU9oeFFkUFZ4WWtwQVJG?=
 =?utf-8?B?WDNRZWxCYi9SbTQ0RWhtMXIwOUhZdUJBNjRJRFdxRDFYVEhQZENGMzMxWU5q?=
 =?utf-8?B?WWhZcEwwMG1uOHU4K2pkOXZrTWNSR0pIU0prMnNGV1FLc3Y3eWtlZ1FnZ1h4?=
 =?utf-8?B?Z2cwUVQ5M3pCck1IbjZ2T0krSHJqQXR1K1FwbS9jeVNHLzM2LzJtVDBJb1pM?=
 =?utf-8?B?UFFLeVZuTVdYZFp4c2pOTGZ0SkFKTk1qS1lCMlRRWnpQZmgwaGhIUVpSRStF?=
 =?utf-8?B?MHdRT2xBbVl6WXlONlN2VHRWZlg5UmRlaE95RlhBckN1UjE4U2FNVTJVSEQz?=
 =?utf-8?B?OUlpMUlnSU5KSXF3UURScXdhUy81cDFydzlleVFndzVRN1grTjcxZUoxK2Ro?=
 =?utf-8?B?SndKVnlmRi9HUDlsN28rK3U5VEtwZFdJekx4M1JaSVlOY3N1ajl6TjkrM1FB?=
 =?utf-8?B?SU11c3FvN2NCemdzZDJrdlhWZkt0M2xtNUVrN0djSWlVOWwxTXl4SXVqSGp2?=
 =?utf-8?B?VitrRmU1ZkgybklDNHpsQTJvTkZ1ZmdMckVSU3U5dUUrTVY2N2E1SFNGRzNO?=
 =?utf-8?B?MmFvcUhTRktadGpnQ1NjYlVMdEdOOWd4alM5OVpGMU1JWE1qdGY3Y3Q1aFBn?=
 =?utf-8?B?aUNoaFFwV3JYVE9vOWE3bG1iZjlQV08yOVZhWVdrQ2NYckliM0xIOGlVV3RX?=
 =?utf-8?B?QmV0aHowN0oybjNPeXNYamM5SGtmaStGWENXN1FmSzh6elU0bG1SeWE2TFVC?=
 =?utf-8?B?dG1lSngxVGRYVUNQNDZaTGc5OGEwN2pzejVJUFhCQytQNFQvemtacUxzc0FP?=
 =?utf-8?B?Q05LZnBuYnJqSlI5aEM2c1MralVkZTBIWnU4bDJyQjVtcEM3R3JwelBjTzNh?=
 =?utf-8?B?N1NBWDdSaGJrZmJlaW9TczVDSndxeFFWZHdTbjFIL2h6eG9HL0pueWF5Zm5z?=
 =?utf-8?B?YWUxRWpzam1zaEVFSnZZVno2WjhnMXpKS3dWMjRVZDJCa1RUS2FQYitmUDV1?=
 =?utf-8?B?Y3dNRlIvUFlXVW13Mjd6QVRTd1Flczg2ZisycVA3ZGY3dzZySVVjdW5DdTZo?=
 =?utf-8?B?YWR1c29MMVlqNXVod1FCLzJlcnBBTWhDUjM0R2U0dHRIQ0U3NUwydUszYkFY?=
 =?utf-8?B?VlRZMmpWa1lRbTJIYW1BTlM4NGtFYTBUeVhXbFVkanV4aFZTMWsvZzVTUVVN?=
 =?utf-8?B?N01yY2lBa3Zlc3B0ZFhBWGxtb2c2bjdnQkc1bHZmdkNUc0pTQm5ZQW5BUU5i?=
 =?utf-8?B?ZHpkYVgrZkRqQmUzSjVsMUJyRnN1SVJIblZPcjZhSDhML1doVlVyRkhxQ01M?=
 =?utf-8?B?WTNCU0ZqNUk4RGtOR0haMTc0YTZ4YnhLWVFjZzdoL29xUGJUOWxGZ1pFcWhI?=
 =?utf-8?B?L1JGK05yb3kzR1Y4VStNQy9VWEtOU2ovVkthbGtSY2RwSTIrVGZaT0V1MGRv?=
 =?utf-8?B?YmVvZUl0K2lhWnBJRENvcUVSNCtXejMxcTg1OXhLTWl5eDBWSWhaVko0MTJj?=
 =?utf-8?B?SjE2RkJmOWE5dmZyZVZ2UGx1OCtkOXhlUEpYOUlBdDN2N2FpL1JiVE9wcnR1?=
 =?utf-8?B?eVo3S0lrdGNEM0VmUUg4bWhzNTVPSTh0elQzQXpvZ1JQZUVPb1BBTDE4QXQz?=
 =?utf-8?B?eWt5MmoxQUVKc1luOTR5RDlaMUducjlSUmw3VFRiUmM3aktoKzFua24vM0k5?=
 =?utf-8?B?Zkg0YlE1MWhHajNlT2J4eUF0c3RuUzRLbnVZc1BNaHBIc013eFFEUzQzVlVl?=
 =?utf-8?B?cDE5NWhRMUxocmFhTVorMldZVEg5TVRkVmkrN2UwRlBZV3RDL0RwSjg4VEpp?=
 =?utf-8?B?bUQ4b2R0YkJWSDNhK1piRm5LMWoxZldCczFsTS85Mjk5MWcvNndNMnp3UlZQ?=
 =?utf-8?B?TzRHWng1S1N4RUJiQnFyc0d4bk9sZysvUU1pTkdRd2M4N1NjZUtyMnB3VWxJ?=
 =?utf-8?Q?LY6EFvUXtK4f0EJQ8JpCSUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70AC2874CEF83148AA73E508633C44BC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4577c3f-ec50-44b8-5e20-08ddea430ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:06:25.2298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+RHf+8vOyFfjA/Gb63+SJHTN2Eg7919Xj3jZ6WmsizUdQimiReJDW0NQ6hN/n8MkQKqEX4oTaqZ0A4zJTFgvrflRxLxR/A7yFl6qXvmXcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9154

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAwMi4wOS4yNSAx
Njo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIDI5LzA4LzIwMjUgMTc6
MDYsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6DQo+PiBUbyBwcm9wZXJseSBkZWFjdGl2YXRl
IGd1ZXN0IGludGVycnVwdHMgYW5kIGFsbG93IHRoZW0gdG8gYmUgcmV0cmlnZ2VyZWQNCj4+IGFm
dGVyIHRoZSBpbml0aWFsIHRyaWdnZXIsIHRoZSBMUiBuZWVkcyB0byBiZSB1cGRhdGVkLiBUaGUg
Y3VycmVudA0KPiANCj4gV2h5IGd1ZXN0IHNwZWNpZmljYWxseT8gSXNuJ3QgdGhlIHByb2JsZW0g
dGhlIHNhbWUgaWYgYSBwaHlzaWNhbCBlU1BJIGlzIA0KPiByb3V0ZWQgdG8gZG9tMD8gSU9XLCBz
aG91bGRuJ3QgdGhlIGV4cGxhaW5hdGlvbiBiZToNCj4gDQo+ICJUbyBwcm9wZXJseSBkZWFjdGl2
YXRlIHBoeXNpY2FsIGVTUEkgcm91dGVkIHRvIGEgZG9tYWluIGFuZCAuLi4iDQo+DQoNCkkgd2ls
bCB1cGRhdGUgdGhlIGNvbW1pdCBpbiBWNi4NCg0KPj4gaW1wbGVtZW50YXRpb24gaWdub3JlcyBp
bnRlcnJ1cHRzIG91dHNpZGUgdGhlIHJhbmdlIHNwZWNpZmllZCBieSB0aGUgbWFzaw0KPj4gMHgz
RkYsIHdoaWNoIG9ubHkgY292ZXJzIElSUSBudW1iZXJzIHVwIHRvIDEwMjMuIFRvIGVuYWJsZSBw
cm9jZXNzaW5nIG9mDQo+PiBlU1BJIGludGVycnVwdHMsIHRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUg
bWFzayB0byAweDEzRkYuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5
aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBWb2xvZHlt
eXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBD
aGFuZ2VzIGluIFY1Og0KPj4gLSBubyBjaGFuZ2VzDQo+Pg0KPj4gQ2hhbmdlcyBpbiBWNDoNCj4+
IC0gYWRkZWQgcmV2aWV3ZWQtYnkgZnJvbSBWb2xvZHlteXIgQmFiY2h1aw0KPj4NCj4+IENoYW5n
ZXMgaW4gVjM6DQo+PiAtIG5vIGNoYW5nZXMNCj4+DQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBy
ZW1vdmUgdW5uZWNlc3NhcnkgQ09ORklHX0dJQ1YzX0VTUEkgaWZkZWYgZ3VhcmQNCj4+IC0tLQ0K
Pj4gwqAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggfCAyICstDQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggYi94ZW4v
YXJjaC9hcm0vIA0KPj4gaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaA0KPj4gaW5kZXggMzM3MGI0
Y2Q1Mi4uZTcwYzFhNTY3NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9naWNfdjNfZGVmcy5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3Yz
X2RlZnMuaA0KPj4gQEAgLTIxMSw3ICsyMTEsNyBAQA0KPj4gwqAgI2RlZmluZSBJQ0hfTFJfVklS
VFVBTF9TSElGVMKgwqDCoMKgwqDCoMKgwqAgMA0KPj4gwqAgI2RlZmluZSBJQ0hfTFJfQ1BVSURf
TUFTS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg3DQo+PiDCoCAjZGVmaW5lIElDSF9MUl9DUFVJ
RF9TSElGVMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEwDQo+PiAtI2RlZmluZSBJQ0hfTFJfUEhZU0lD
QUxfTUFTS8KgwqDCoMKgwqDCoMKgwqAgMHgzZmYNCj4+ICsjZGVmaW5lIElDSF9MUl9QSFlTSUNB
TF9NQVNLwqDCoMKgwqDCoMKgwqDCoCAweDEzZmYNCj4gDQo+IEl0IHRvb2sgbWUgYSB3aGlsZSB0
byB1bmRlcnN0YW5kIHdoeSB3ZSBhcmUgdXNpbmcgMHgxM2ZmIHJhdGhlciB0aGFuIA0KPiAweDFm
ZmYuIEl0IGlzIGJlY2F1c2UgZVNQSSByYW5nZSBpcyA0MDk2IC0gNTUxOS4gU28gaW4gdGhlb3J5
LCBpdCB3b3VsZCANCj4gYmUgb2sgdG8ganVzdCBhZGQgJzB4MTAwMCcuIEJ1dCBJIHRoaW5rIHRo
aXMgaXMgbW9yZSBjb25mdXNpb24gdGhhdCBpdCANCj4gaXMgd29ydGguIFNvIEkgd291bGQgcmF0
aGVyIHByZWZlciBpZiB3ZSB1c2UgMHgxZmZmIGFzIHRoaXMgbWF0Y2hlcyB0aGUgDQo+IHNwZWNp
ZmljYXRpb24uDQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpZZXMsIEkgYWdyZWUgd2l0aCB0aGF0IC0g
aXQgd2lsbCBiZSBjbGVhcmVyLCBzbyBJIHdpbGwgdXBkYXRlIHRoZSBtYXNrIA0KdG8gMHgxZmZm
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg0K

