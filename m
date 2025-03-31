Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44CA76CBD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 20:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932886.1334950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzJUN-0003bZ-NU; Mon, 31 Mar 2025 18:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932886.1334950; Mon, 31 Mar 2025 18:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzJUN-0003YR-Ji; Mon, 31 Mar 2025 18:03:59 +0000
Received: by outflank-mailman (input) for mailman id 932886;
 Mon, 31 Mar 2025 18:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Diii=WS=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tzJUL-0003YK-VY
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 18:03:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f403:2612::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83090420-0e5a-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 20:03:56 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by AS2PR03MB8820.eurprd03.prod.outlook.com (2603:10a6:20b:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 18:03:53 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 18:03:53 +0000
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
X-Inumbo-ID: 83090420-0e5a-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+aNE9v7cllKHpBIyVSH6027mnOwcw2lkx3UCJ71WOEF9GjjCkrYeYLynLlpY/LoZjTn0FBft869gAXY5MLmPau/YW5DqMrXJqfgx2OQoGENMQZd4RFsC7Qn7r5LBV+A8hZC53zk8ftQtWmcLsug+3NV/SffqDpO5/B60Ip7pA/nwGn49orqIK2Ifti4uIDvjClH5wto/TyJiaPyODMNFaigEwzQuxdZi/SczKjpDKB439mD3/iU4f4NepFLscYPLp4xsmmKKVRX/ZMBE9/JDENB2CKbIZ1SH9pENcGuP7oOv7oMa32i1/U8DydEDv31Ah1YAPNpKy24BTfMBZnoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPervR16P3Ka9cdaCbf/nOF0qyc/IJMulQNpEMkjNM4=;
 b=gTVvqepmHC9m4H6Y5SqFstO3N6Kj5qSQBHnusLZl/VyEOIhAfauFMjtiCBusxt34UQXu5GTDyp2MYvchIiGWJcN2oDU1J+rBtnaAjn0Jzgp16Is/Z4PAjuGuvmWr1HI6U/vkXjAit6nHbk9ViEUqAtoQHKAfnqAsSS+R6MSr0yiuGaZwaz6Yvq06ZhTShAUpPLLkDYF7bqefeQffnp/+Jk5X3pkkQ2ahg4K41LSqyiUrIw7+g5iLSSgyw62hz/nPWSE0sj0oGlBtRzERfY191hb1+HHJi1fjzE4wDQgWM06LUyXJPzh34vz0hnyevCzMpUfCy1huEBDhwORzz5BJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPervR16P3Ka9cdaCbf/nOF0qyc/IJMulQNpEMkjNM4=;
 b=nCaq8EXsvrm6pdIFBtCckIzPbvL+jB+jhdDDO3/v/Qt9iUGujgj04wBvHorD1JDTlDP1chR0heMUMKY3h9SqAeSHxd2W+q6CywuXvc/+mVQj+9iaw3cvgeHi4bBIOsYTIK84WZf4YWOJWkd+DwQvsvdtJJmV7jhM1rOVeW77TVhJOUM6DYsCMn6efJxm1CrYUNKbvc8q17vptTci2YqEB8kIKUsHAus40XNJhiskvcVvUoojsf4l8/B1YZjqJ5dDXH7fGprXHMtK8U1ak+MuMtk/B7viqXTjiX3T1R9bEEvFhe+hsrlk3TEhNxvzAszktWLoI4aUtrKo7dRqua44HQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index:
 AQHbnZfMrs+h0o/uEkuTNWO41qxIcLOD+IUAgAADaoCAAAM8AIAABQEAgAABHgCAAAyVAIABDTwAgADj8oCAB5BDAA==
Date: Mon, 31 Mar 2025 18:03:53 +0000
Message-ID: <a76408dc-0dbb-4b01-af7c-cd1c96f853d6@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
 <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
 <8e19bb8a-ff23-4068-ae48-83e81eda2f20@xen.org>
In-Reply-To: <8e19bb8a-ff23-4068-ae48-83e81eda2f20@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|AS2PR03MB8820:EE_
x-ms-office365-filtering-correlation-id: 35e09a6a-5add-4c1c-f40e-08dd707e65fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1lGckFxdTJXUDBsMDMrc0RhNllwOW14ejJoSWNMc2NET3YzM0NteHh1eDBi?=
 =?utf-8?B?RWJxNXNkS2Yyd29EMi9sTnFiQ2k3Ui91RVBudFNWVVM4bitSNGZ5RXkvem5y?=
 =?utf-8?B?UDhqQm05RUJTc2FQKzFPYXpHdWppTDFoZmRMSVNFZUJtaGxHTlAxVnF5VlRk?=
 =?utf-8?B?VHRpRVE1c0RUK0ZJZDZpbzNFYUZvOTVUUVQvT2txSWlwTk1Fa3ZERTBqVS84?=
 =?utf-8?B?a2Z4aEdiZU9nZSsxeDgxVnB6dXpPVzlUNmNPUGxIL1FjRzdxdjNaT0hnVDJy?=
 =?utf-8?B?TXZDYmExdFBqM2YyNm4ralp0NXlWcHlYa1o0elFVRFhRQk9rcm55Z1Via2Vx?=
 =?utf-8?B?bEhFdkFUN3VFMmgzVExjMVVHVE84RllJM0JvMXNabmRvSjJhNnY4emR0TEtj?=
 =?utf-8?B?bjZSL2gzYnNhWGtsNDA4TklvdGo5YW5hcWdBVXpTVXA5MHVqTk1pNWRzam40?=
 =?utf-8?B?SWpKWHdhcVI2WGcrcEY5UXk5NlZPSXZKUjZWZW9rbEJiZlR3TkNoUXpzNGFD?=
 =?utf-8?B?UHpSSDY4ZTVqWksvYVBqc0Q3RTgySUIrRnFkYUp4aVZiWDNuc2hxZ3ZXbzJT?=
 =?utf-8?B?LzNJdUltamM1NU1uM0FnRDRVVjN6L0ZDVWJDMS9EajJlbzBOMHFicVVkdU1r?=
 =?utf-8?B?cVBkbHlrQmIxcnVNU1RMSGZLMmRQcndxSklLc0ppcXo4R0x0NFBod1pGR3I3?=
 =?utf-8?B?bDIzbFhyT1d5TnhVWHNValVzUXplSWlhcjJVZlE2OHJiS0Nlc3ppVERLbGFz?=
 =?utf-8?B?WWdSQURnZStjb1BxU2s0TGw4WVQxVTlkdS9Dd1FIM0NldDM4am5DRUtLYmxJ?=
 =?utf-8?B?OTJDQTFmNGtmUERyOFpad2RKZ3h3RkNaTlNJVVRTdUNMaW8wT3h5ODh3TmRz?=
 =?utf-8?B?Zi9vYVdlTHArTFcxRnVCS050WHBOZVZlSHlkZWE3K1hzVEIzME5oa2RTdlMr?=
 =?utf-8?B?aWM0eUxMY1NUc2FKdVFjY3hlV29WbERlWmF4L2oxZEhmUU5aRHBLNk5WUEVo?=
 =?utf-8?B?citHN0NqYjZYcDNDd0tEREVaMWpUUllQb2tydWIxRVphVEFXV2F1azREalNK?=
 =?utf-8?B?SlRUOG1QYXBHdFhUSHFKQ1ZhcngxN1ZwMkdQU2ovTDhnayt2WUhiTTByQlM1?=
 =?utf-8?B?MWVyb09oOW5IYzg1aE5adFpDM240WFZ3ODhicDZYSGZOZG9xaDNvaXBjSWtQ?=
 =?utf-8?B?MExBZVl5WTN5ZWNuM3R4TUFFcVg5clpIeVB5TnJsQWNsOEZCR1NMa0ZYVXBp?=
 =?utf-8?B?L3NScmhueStCYkdyK0RQaDdFbm1yZGVHTU5HRDl5YjBVbitoMVNzQS9Db1Rh?=
 =?utf-8?B?Q0wrazZuaXhZVk9veTk3T1VrVnQ2b2lqYVhFeDB1SkFZS0d1SzBqbUovRXJl?=
 =?utf-8?B?ajNWWWtkelVYYzlqSjhiMWVUV3VGMEZEdm5wNFpOREdBS1BqV0huRElIamli?=
 =?utf-8?B?dkNDa1VnYmN6T3ZrUFVNYTlPNXl1S2dTNHJuazEyOHhwaHFrOXJYVEhQUHVl?=
 =?utf-8?B?SVBwU3B6WHNZeXhtcDdNdzhMSFJGRFBKNDlJK1pwR05EYkk4OVQ1Z3B6U25z?=
 =?utf-8?B?dVlCbEhZalkvN0N3bVdzTlNvUnBoL0lnaWRqaVZTaEVwMnBNKzVRUHVSZVVo?=
 =?utf-8?B?WTVteThYRHdZaGtRT0ZWbW90ekkrMTNEU05hYzN2c1JhditFYnN3WTdvZ2xY?=
 =?utf-8?B?UkkzdnU2dVd1bGozNTBpbHhQeHFmSUpHYTdXQkdDcHQ1dzZuRXVSZ0pNRitl?=
 =?utf-8?B?UWd0VmJzZHVvRTFuemNzVjNRME1VSTQ4d2x3N1c3NTdleVNsbmpwZWd5TUpS?=
 =?utf-8?B?WTJIOFBUTC8rK0pTdVVKd2ZCdTdmMWo3Q0hWTVRza09BNm4vSVZEMXhXcXVO?=
 =?utf-8?B?emxiakx1b0ora04wejNaWUZzTTI0M25tSnhzSklMcWxyZ2dTSlJqS2xST2xX?=
 =?utf-8?Q?446EiAgSt1DtwvvODJcSrZxhLR7bP5/p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bW9vSElHSFhHbXRQa28zVWJqOGVLbFdyams4b1Z2ZUNtZ1cva2JCMXpNNTdl?=
 =?utf-8?B?ME0wL3hLZk1mNDZ4V0pKeGFGZ243OUltWDVDcFErUFhoNG5FU29aRHFwWWtL?=
 =?utf-8?B?SkJxTkFFc3M4TS9JWlJIeHdCRUpsSTdIcFR3MFVvdFYrbkt6ejc1MU56SnFC?=
 =?utf-8?B?Rlg0eUw4WW9nV0R6bUZQeEYrM1FBYWVNY1JzaDIwRU9QdUlvdmdMeG0zY2pS?=
 =?utf-8?B?R1hwQkxGSVRnN1IyWUlUbHdvTzVyR3NBN3hRcUhZSFo0dWJESURJWDRXRnFU?=
 =?utf-8?B?eVZuODdVQ2RBc1VtVGxEUnlHby9QQTdDNXFNQ2N5UVNLNjZTdHI4S0hzUEUv?=
 =?utf-8?B?L1FpelBzVVZwbVZDa1RsOXIrYlVRendCMjkrS0NMczBpMlFOS2tRMHB2SG5x?=
 =?utf-8?B?ck5UVGQ0V3hvT2VjR2pBeW5acDRiQWNGQnZWQmZiaURqclJkTHRjSnh3WWZX?=
 =?utf-8?B?aGFiRTVLR2paQ3NtTUFnL1BkOVUxejFYYzhRWHNpSTlvRHFyaS9wak1nelFW?=
 =?utf-8?B?bWoyTnhqWS9Ja09HbWd6cXhkSTBCZjVvTXZiSU5KcWJNNWhMdXJzY2tGUmkw?=
 =?utf-8?B?RHJBVjRjeGxYTUVIcnFaa2tkZWRiZ2JCcWRWV3pzQXkvbUhEb3BnV01FNGNB?=
 =?utf-8?B?bE16WWd3aFRxeHRwc2YyZFQzbHJZSGUvVmIyakRXSU5YakZLTDRCU0UxNzhm?=
 =?utf-8?B?b00rVlZIcVZzeFFhOW94dE4rYTZIdWVsb00zWittcW9lV3RQcDNkSTVvbFhj?=
 =?utf-8?B?bTc0d1pjZUtiY2duWngwc0l6eWgySFMyUndBWW5tY0FCRW11azQ0Z0RpVlNr?=
 =?utf-8?B?Y3FOVlMxOFBiYkFjd0RaaVFKUXI3enN6eEJBUERvcHkyZzFNUC9kNWQyZnd5?=
 =?utf-8?B?QXk5QlYvNkhBNmlVa2dPNzgyT2tpYlJNdUpza0MwSkY5bTlPUEpCQWlqSG9m?=
 =?utf-8?B?Y0tOR1g5K1RKNEhCckxHYUpiTGU0aDAwYWF1ZkpUSkp3VjNTcE0rZXNkem1V?=
 =?utf-8?B?d2FJdTcyaXJZMSsxMWdYNURmUlREWmQ4aFNMYnNESENXWkZkZkkzM3p6RHZ5?=
 =?utf-8?B?d1gwOVl4bk1ocGkwYmVCVi9wTVprMlBqbFN1UnFpaHBFREtWVVp2NWFaYU9k?=
 =?utf-8?B?WTZ4WnhHQ2lDQ1N1NXhQcHorYTdZbitqTEtaNFdGcVRVMW9vN2JLVTVocVNE?=
 =?utf-8?B?cllaUnc5UklNMVhIZU9pV1dLNHhYM0gxUVhGTlU4OE40a0FIVEdUT1U5WEdS?=
 =?utf-8?B?UTNXUExVbnJyY0pXVCtHd2FnSXViUmVwdTlBV1lBeXpxM3lqenlwVytkd1ZY?=
 =?utf-8?B?aENkSmV2K05QenJDNy8wNFpGNDRMVjYzVG51YkNxT20zMGJ0TkhycEtBVHQ4?=
 =?utf-8?B?NzZueGFHdmZLZzN5dUZmYS92a0QyKzJTbEFodnBWTE9yNXFmNFoyOWZWR2dP?=
 =?utf-8?B?RXZlN3FpMDFJYjRYaEFYSXpMek5UZHhweHFGeEJGNlVTd0VwZERzOEhvVDd3?=
 =?utf-8?B?aXNmdSt2cjlZY1h6cjlMdDdoNTRhSk50Y0V3U29BTkpHdWt4VXc1NHNQdzRZ?=
 =?utf-8?B?REQyaUFMbUxacWVKb1p5emFCMGd5MEFxVFN0Z08wY1JPTmRRYUsvTVlITW9M?=
 =?utf-8?B?eW4zK2p4WGQ3Y1NJL0k1ejFXalliOFVGelBvTXBNeWs0UWgrNFVacUxHMDF1?=
 =?utf-8?B?Wm1zWUNlN3kwU0NFNUJndDJLR0JvTlFxazlDTlJOQUgwcEVrRWZYNGJqendS?=
 =?utf-8?B?WDhrOVdid1Vab2hmK0gvOHl5aVY5cWdLN2tiaGZBSG1nYTdNUk1CWTIzcGNq?=
 =?utf-8?B?Qm8zWGM0eWh6NHJJai9MY3hTdEZidkJ1WWpwYWx5NmJ4RkR5Wm1SUU00NHlP?=
 =?utf-8?B?TTRDR3dQVkN2QkZKd3h4T2lnSTI0eStiWnhaeUQ0UDVkcDUyZWU4M281Mkwx?=
 =?utf-8?B?bXdVYSt4YmZPS0VNU1p6UWhLSUNrSkdXYWJwTVE1WkdRWlJmK3RQSTE1ZG1t?=
 =?utf-8?B?dG5sYktRWUdlaHZZRjd5WVc4UUVwYm1QQlJkNkszWnY4ODVIT0VidXlNRXZP?=
 =?utf-8?B?Z29lbjdvdlVYdFZZZXQyVS9nWWlYM2R6YnFJQithdEtDSUNnYkRQM3BrWE1u?=
 =?utf-8?B?Sk8vUkxWdlFaeCtMazVCSlJXdGtQQktOMFJEZlMvMWpZUDB4b1Y0QVVybHcx?=
 =?utf-8?Q?2DNSAdCxPic+Yiffrlav/0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C22FD2777178424B89549CF53DA9A9FD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e09a6a-5add-4c1c-f40e-08dd707e65fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 18:03:53.5159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MH+Y1BJVsFCFrU2y4rMYuIOO/pX/WZqE7JSyQdwVgAbHJSd7Jx9FpVW8R3LJG4MPdYjKe9Ba833a4LcDhhBwMlzROSe1Br7ftfTQe6vKAbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8820

DQoNCk9uIDI3LjAzLjI1IDAwOjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIEp1bGll
bg0KDQoNCj4gSGksDQo+DQo+IE9uIDI2LzAzLzIwMjUgMDg6NTcsIE9yemVsLCBNaWNoYWwgd3Jv
dGU6DQo+Pg0KPj4NCj4+IE9uIDI1LzAzLzIwMjUgMTc6NTQsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiBPbiAyNS4wMy4yNSAxODowOSwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+DQo+Pj4NCj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+DQo+Pj4gSGVsbG8gSnVsaWVu
DQo+Pj4NCj4+Pj4NCj4+Pj4gT24gMjUvMDMvMjAyNSAxNjowNSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+Pj4+Pj4+PiBGdXJ0aGVybW9yZSwgd2hhdCBoYXBwZW4gaWYgd2UgZGVjaWRl
IHRvIHVzZSBBQ1BJIGFmdGVyd2FyZHM/DQo+Pj4+Pj4+PiBXb3VsZG4ndA0KPj4+Pj4+Pj4gdGhp
cyBtZWFuIHRoYXQgdGhlIHN0YXRpYyByZWdpb25zIHdvdWxkIGJlIHJlc2VydmVkIGV2ZW4gaWYg
QUNQSQ0KPj4+Pj4+Pj4gZG9lc24ndA0KPj4+Pj4+Pj4gdXNlIHN0YXRpYyBtZW1vcnkgKGFsbCB0
aGUgbWVtb3J5IGlzIGV4cGVjdGVkIHRvIGJlIGdpdmVuIHRvIHRoZQ0KPj4+Pj4+Pj4gYWxsb2Nh
dG9yKT8NCj4+Pj4+Pj4gSSBkb24ndCB0aGluayBzdWNoIGh5YnJpZCBjb25maWd1cmF0aW9uIGlz
IHZhbGlkIChib290aW5nIHdpdGgNCj4+Pj4+Pj4gQUNQSSB5ZXQNCj4+Pj4+Pj4gZGVjbGFyaW5n
IHJlc2VydmVkIHJlZ2lvbnMgaW4gRFQpLiBTZWUgY29tbWl0Og0KPj4+Pj4+PiA5YzJiYzBmMjRi
MmJhNzA4MmRmNDA4YjNjMzNlYzlhODZiZjIwY2YwDQo+Pj4+Pj4NCj4+Pj4+PiBJIGRvbid0IHRo
aW5rIHRoZSBjb21taXQgaXMgcHJldmVudGluZyBoeWJyaWQgY29uZmlndXJhdGlvbi4gSXQgaXMN
Cj4+Pj4+PiBqdXN0DQo+Pj4+Pj4gc2F5aW5nIHRoYXQgdGhlIHJlZ2lvbiAod2hpY2ggY291bGQg
YmUgYSBzdGF0aWMgcmVnaW9uIGJlY2F1c2UNCj4+Pj4+PiB0aGlzIGlzDQo+Pj4+Pj4gbm90IHN1
cHBvcnRlZCkgd2lsbCBiZSB1bnJlc2VydmVkLg0KPj4+Pj4+DQo+Pj4+Pj4gSU9XLCB3aGVuIGJv
b3Rpbmcgd2l0aCBEZXZpY2UtVHJlZSB5b3UgbWF5IGJlIGFibGUgdG8gdXNlIHN0YXRpYw0KPj4+
Pj4+IG1lbW9yeS4NCj4+Pj4+PiBCdXQgaWYgeW91IHdlcmUgYm9vdGluZyB3aXRoIEFDUEksIHN0
YXRpYyBtZW1vcnkgaXMgbm90IHN1cHBvcnRlZCBhbmQNCj4+Pj4+PiB0aGVyZWZvcmUgdGhlIHJl
Z2lvbnMgc2hvdWxkIGJlIGZyZWUgZm9yIG90aGVyIHB1cnBvc2UuDQo+Pj4+Pg0KPj4+Pj4NCj4+
Pj4+IEp1bGllbiwgSSBzZWUgeW91ciBwb2ludHMsIGJ1dCB0aGUgY3VycmVudCBwYXRjaCBkb2Vz
IG5vdCBhdHRlbXB0IHRvDQo+Pj4+PiBtYWtlIHN0YXRpYyAocmVzZXJ2ZWQpIG1lbW9yeSBwcm9w
ZXJseSB3b3JrIG9uIEFDUEktYmFzZWQgc3lzdGVtDQo+Pj4+PiAoaWYgaXQNCj4+Pj4+IGlzIGF2
YWlsYWJsZSB0aGVyZSksIGN1cnJlbnQgcGF0Y2ggdHJpZXMgdG8gc29sdmUgdGhlIHJlYWwgaXNz
dWUgb24NCj4+Pj4+IGRldmljZS10cmVlLWJhc2VkIHN5c3RlbSB3aXRoIFhlbiBjb21waWxlZCB3
aXRoIENPTkZJR19BQ1BJPXkgKGF0DQo+Pj4+PiBsZWFzdA0KPj4+Pj4gdW5pbnRlbnRpb25hbGx5
KS4NCj4+Pj4NCj4+Pj4gSSBhbSBub3QgYXNraW5nIHRvIG1ha2UgQUNQSSB3b3JrIHdpdGggc3Rh
dGljIG1lbW9yeS4gSSBhbSBhc2tpbmcgdG8NCj4+Pj4gbm90DQo+Pj4+IGJyZWFrIEFDUEkgaWYg
dGhlIERldmljZS1UcmVlIGlzIHNwZWNpZnlpbmcgc3RhdGljIG1lbW9yeSByZWdpb24uDQo+Pj4+
DQo+Pj4+PiBIb3dldmVyLCBJIHdvbmRlciwgd2h5IGl0IGhhcyBub3QgYmVlbiBub3RpY2VkIHNv
IGZhci4NCj4+Pj4NCj4+Pj4gQUNQSSBpcyBub3QgYSBzdXBwb3J0ZWQgZmVhdHVyZSBhbmQgZ2F0
ZWQgYnkgVU5TVVBQT1JURUQuIFNvIHRoZQ0KPj4+PiBpbXBsaWNhdGlvbiBpcyB5b3UgaGF2ZSBl
bmFibGVkIFVOU1VQUE9SVEVEIGFuZCBhbnl0aGluZyBjYW4gaGFwcGVuDQo+Pj4+IHJlYWxseSA7
KS4NCj4+Pg0KPj4+IEluZGVlZCwgdGhpcyBhbnN3ZXJzIHRoZSBxdWVzdGlvbi4NCj4+Pg0KPj4+
DQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSXQgdG9vayBzb21lIHRpbWUgdG8gdW5kZXJzdGFuZCB3aHkg
anVzdCBlbmFibGluZw0KPj4+Pj4gQ09ORklHX1NUQVRJQ19NRU1PUlk9eQ0KPj4+Pj4gdHJpZ2dl
cmVkIGEgQlVHIGluIGNvbW1vbiBjb2RlLiBBbmQgaXQgdHVybmVkIG91dCB0aGF0IGl0IHdhcw0K
Pj4+Pj4gQ09ORklHX0FDUEk9eSBpbiBteSBYZW4ncyAuY29uZmlnIHRoYXQgY2F1c2VkIHRoYXQg
Y29uc2VxdWVuY2UgKEkNCj4+Pj4+IHNwZWNpYWxseSB3cm90ZSBzbyBsb25nIGRlc2NyaXB0aW9u
IHRvIHByb3ZpZGUgZnVsbCBjb250ZXh0KS4NCj4+Pj4NCj4+Pj4gQXMgSSB3cm90ZSBhYm92ZSwg
dGhlIG9ubHkgdGhpbmcgSSBhbSBhc2tpbmcgaXMgdGhhdCBtZW1vcnkgZm9yIHN0YXRpYw0KPj4+
PiByZWdpb25zIHNob3VsZCBiZSB1bnJlc2VydmVkIHdoZW4gQUNQSSBpcyBlbmFibGVkIGxpa2Ug
aXQgaXMgYWxyZWFkeQ0KPj4+PiB0aGUNCj4+Pj4gY2FzZSB0b2RheS4NCj4+Pg0KPj4+IFNvIHRo
ZSBjb25jZXJuIGlzIHRoYXQgbm90IHJlc2VydmluZyBwcm92aWRlZCBieSB0aGUgZGV2aWNlIHRy
ZWUgc3RhdGljDQo+Pj4gbWVtb3J5IHJlZ2lvbiBpcyBnb2luZyB0byBiZSBhIHBvdGVudGlhbCB3
YXN0ZSBvZiB0aGUgbWVtb3J5IG9uIHRoZSByZWFsDQo+Pj4gQUNQSSBzeXN0ZW0/IE9yIEkgbWlz
c2VkIHNvbWV0aGluZz8NCj4+Pg0KPj4+IEkgc2VlIHR3byBvcHRpb25zIHdpdGggdW5yZXNlcnZp
bmcgdGhlIHN0YXRpYyBtZW1vcnkgcmVnaW9ucyBvbiB0aGUgcmVhbA0KPj4+IEFDUEkgc3lzdGVt
LiBJIGFzc3VtZSwgdGhhdCB3ZSBzaG91bGQgdW5yZXNlcnZlIG9ubHkgYWZ0ZXIgd2UgZGVmaW5p
dGVseQ0KPj4+IGtub3cgdGhhdCB3ZSBhcmUgcnVubmluZyB3aXRoIEFDUEkgKGkuZS4gYWZ0ZXIg
YWNwaV9ib290X3RhYmxlX2luaXQoKQ0KPj4+IGNvbXBsZXRlcyBhbmQgYWNwaV9kaXNhYmxlZCBy
ZWZsZWN0cyB0aGUgcmVhbCBzdGF0ZSBvZiB0aGluZ3MpLCByaWdodD8NCj4+Pg0KPj4+IDEuIGVp
dGhlciBjYWxsIGFjcGlfYm9vdF90YWJsZV9pbml0KCkgYmVmb3JlIHNldHVwX21tKCkgaW4gQXJt
NjQncw0KPj4+IHN0YXJ0X3hlbigpLg0KPj4gVGhpcyBjYW5ub3QgYmUgZG9uZS4gYWNwaV9ib290
X3RhYmxlX2luaXQoKSBjYWxscyBBQ1BJIGZ1bmN0aW9ucyB0aGF0DQo+PiBtYWtlIHVzZQ0KPj4g
b2YgVk1BUCBhbmQgYWxsb2NfYm9vdF9wYWdlcywgc28gdGhlIGJvb3QgYWxsb2NhdG9yIGlzIGV4
cGVjdGVkIHRvIGJlDQo+PiBwb3B1bGF0ZWQNCj4+IGF0IHRoaXMgcG9pbnQuDQo+Pg0KPj4+IDIu
IG9yIGdvIHRocm91Z2ggcmVzZXJ2ZWRfbWVtLT5ucl9iYW5rcyBhbmQgdW5yZXNlcnZlIGV2ZXJ5
dGhpbmcgbWFya2VkDQo+Pj4gd2l0aCBNRU1CQU5LX1NUQVRJQ19ET01BSU4gYWZ0ZXIgYWNwaV9i
b290X3RhYmxlX2luaXQoKSBjb21wbGV0ZXMNCj4+IFdoYXQgaWYgd2Ugc3BsaXQgYWNwaV9ib290
X3RhYmxlX2luaXQoKSBpbnRvIDIgcGFydHMsIHdoZXJlIGZpcnN0IGlzDQo+PiB1c2VkIHRvDQo+
PiBkZXRlcm1pbmUgdGhlIHJlYWwgImFjcGlfZGlzYWJsZWQiIHZhbHVlLCBjYWxsZWQgYmVmb3Jl
IHNldHVwX21tIGFuZA0KPj4gc2Vjb25kIHVzZWQNCj4+IHRvIHBhcnNlIHRoZSB0YWJsZXM/DQo+
DQo+IFRoYXQgd291bGQgYmUgZmluZSB3aXRoIG1lIGluIHByaW5jaXBsZS4NCg0KZ29vZA0KDQo+
DQo+PiBUaGVyZSdzIG9uZSBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2guIFRvZGF5LCBldmVuIGFm
dGVyIHdlDQo+PiBldmFsdWF0ZSB0aGF0IHdlIHNob3VsZCBydW4gd2l0aCBBQ1BJIGVuYWJsZWQg
WypdLCBlcnJvciBpbiBBQ1BJIHRhYmxlDQo+PiBwYXJzaW5nDQo+PiBpcyBpZ25vcmVkIGFuZCBB
Q1BJIGlzIHNldCB0byBkaXNhYmxlZC4gVGhhdCdzIG5vdCByZWFsbHkgaW4gdGhlDQo+PiBzcGly
aXQgb2Ygb3VyDQo+PiBjdXJyZW50IG1ldGhvZG9sb2d5LCB3aGVyZSB3ZSBzaG91bGQgcGFuaWMg
aWYgdXNlciByZXF1ZXN0ZWQgc29tZXRoaW5nDQo+PiB0aGF0IGRvZXMNCj4+IG5vdCB3b3JrLiBF
eGFtcGxlOiB0b2RheSwgZXZlbiBhZnRlciBzcGVjaWZ5aW5nICJhY3BpPWZvcmNlIiwgZXJyb3Ig
aW4NCj4+IHRhYmxlDQo+PiBwYXJzaW5nIGJhaWxzIG91dCB0byBEVCBhcHByb2FjaCB3aGljaCBp
cyBub3Qgd2hhdCB1c2VyIHdhbnRlZC4NCj4NCj4gSWYgeW91IHBsYW4gdG8gc2VuZCBzdWNoIHBh
dGNoLCBjYW4geW91IGhhdmUgYSBsb29rIGF0IFsxXT8gVGhpcyB3YXMgYW4NCj4gYXR0ZW1wdCB0
byBwYW5pYyBpZiB3ZSBjYW4ndCBlbmFibGUgQUNQSSBhbmQgdGhlIHVzZXIgcmVxdWVzdGVkIGl0
Lg0KDQoNCkkgYW5hbHl6ZWQgeW91ciBwYXRjaCwgdGhhbmtzIGZvciBwb2ludGluZyB0byBpdC4g
QW5kIGlmIEkgZ2V0DQpldmVyeXRoaW5nIGNvcnJlY3RseSB0aGVuLCBJIHRoaW5rLCB0aGF0IHRo
ZSBwYXRjaCBpbiBpdHMgY3VycmVudCBmb3JtDQooYXMgaXMpIHdpbGwgaW5kZWVkIGhlbHAgZml4
IHRoZSBpc3N1ZSBpbiBvdXIgcGFydGljdWxhciBjYXNlICh0b2dldGhlcg0Kd2l0aCBzcGxpdHRp
bmcgYWNwaV9ib290X3RhYmxlX2luaXQoKSBpbnRvIGFjcGlfcHJlaW5pdCgpIGFuZA0KYWNwaV9i
b290X3RhYmxlX2luaXQoKSBvZiBjb3Vyc2UpLiBXaXRoIHRoZSBleGlzdGluZyBwYXRjaCwgd2Ug
d2lsbCBoYXZlDQp0aGUgZm9sbG93aW5nOg0KICAgICBhY3BpPW9mZjogVHVybmVkIG9mZiBBQ1BJ
IC0+IERUIGlzIHVzZWQsIHN0YXRpYyBtZW1vcnkgaXMgcmVzZXJ2ZWQNCiAgICAgYWNwaT1vbjog
VHVybmVkIG9uIEFDUEkgb25seSBpZiBEVCBpcyBlbXB0eSAtPiBEVCBpcyBub3QgZW1wdHksIHNv
DQogIGlzIHN0aWxsIHVzZWQsIHN0YXRpYyBtZW1vcnkgaXMgcmVzZXJ2ZWQNCiAgICAgYWNwaT1m
b3JjZTogVHVybmVkIG9uIEFDUEkgLT4gYXMgdGhlcmUgaXMgbm8gQUNQSSwganVzdCBwYW5pYw0K
DQpCdXQgSUlVQywgdGhlIGNvbmNsdXNpb24gKGl0IHRoYXQgdGhyZWFkKSB3YXMgdG8gY2hhbmdl
IHRoZSBiZWhhdmlvciBmb3INCiJhY3BpPW9uIiwgaS5lLiB0byBwcmVmZXIgQUNQSSBvdmVyIERU
LCBpbiB3aGljaCBjYXNlLCBJIGFtIG5vdCBzdXJlDQp3aGF0IHRoZSBleGFjdCBYZW4gYmVoYXZp
b3IgZm9yICJhY3BpPW9uIiBzaG91bGQgYmUgYW5kIHdoZXRoZXIgaXQgd2lsbA0KZml4IHRoZSBp
c3N1ZSwgcGxlYXNlIGNsYXJpZnk6DQpObyBtYXR0ZXIgaWYgdGhlIERUIGlzIGVtcHR5IG9yIG5v
dCwgd2UgdHJ5IHRvIGluaXRpYWxpemUgdGhlIEFDUEksIGFuZA0KaWYgQUNQSSBpcyBwcmVzZW50
IChpbml0aWFsaXphdGlvbiBzdWNjZXNzKSwgdGhlbiBpdCBpcyB1c2VkLCByaWdodD8gQW5kDQpp
ZiBBQ1BJIGlzIG5vdCBwcmVzZW50IChpbml0aWFsaXphdGlvbiBmYWlsdXJlKSwgdGhlbiB3ZSBm
YWxsYmFjayB0byBEVA0Kb3IganVzdCBwYW5pYz8gSWYgdGhlIGxhdHRlciwgdGhlbiB3ZSBhcmUg
YWxsIGdvb2QsIGJ1dCBpZiB0aGUgZm9ybWVyLA0KdGhlbiwgSSBhbSBhZnJhaWQsIHdlIHdpbGwg
ZmFjZSB0aGUgc2FtZSBCVUcgKGFzIHdlIHVucmVzZXJ2ZSBzdGF0aWMNCm1lbW9yeSBpZiBhY3Bp
X3ByZWluaXQoKSBzZXRzIGFjcGlfZGlzYWJsZWQgdG8gZmFsc2UpLg0KDQpPciBJIG1pc3NlZCBz
b21ldGhpbmc/DQoNCg0KDQoNCj4NCj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8xNDg2MTQ5NTM4LTIwNDMyLTYtZ2l0LXNlbmQtZW1haWwtanVsaWVuLmdyYWxsQGFybS5jb20v
DQo+DQo+Pg0KPj4gfk1pY2hhbA0KPj4NCj4NCg==

