Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A853A6A8CA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922293.1326168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH3u-0006VT-7D; Thu, 20 Mar 2025 14:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922293.1326168; Thu, 20 Mar 2025 14:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH3u-0006Tg-4K; Thu, 20 Mar 2025 14:39:58 +0000
Received: by outflank-mailman (input) for mailman id 922293;
 Thu, 20 Mar 2025 14:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTqZ=WH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tvH3s-0006Ta-IO
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:39:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2606::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30080743-0599-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:39:54 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9037.eurprd03.prod.outlook.com
 (2603:10a6:10:439::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 14:39:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 14:39:52 +0000
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
X-Inumbo-ID: 30080743-0599-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOldWQ2dxWzoy1mKPltSfJmB/erfk/lsznymOtXjGezxxWswCKpbBeABI8cctIQT2mph9w7u53mabd1PBry6PSiAiyCeoz7cPpEoyrneKK9BiO2q1vOFah40+NNTFki31QHaUFtZCmHSkWpOi/OVvH8RU8Lq0uuHJG+Q8D2krW3OHHRD6yNL2nJuFJaHSISgkV43wN6PW27lV+us7n5JoXXO8IPchThMayNNu2Z1xdxVEk0FmML0/39F8Kh2fbLCG9gr8dZ4csvu6baKp2fIlkBggKrsS8y3VJT/3QHVMqGsfVA5Pv1HylLUJXfrk4csetTBVpKFmxuzY4cW2CoHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=861WXRcE47hjKl69I4CqcqlkijG/GL80BXcMb4HQo5c=;
 b=o3/ym7trRESD+HEBNdDr4X0mAOtO6YoRtx7LdxQQJtJXI8yQ+sQLJJwubvXT04hmy/VhvEhY581TSSML0nHQVXmtcnXc5AlpTsO95VdU5Z2YdtInibX0bz2K6XfsUXhnnC5DGMZE4hdDxSZpSWvU8cwK2LcTH6bGvvpP/BhACEoaBgCyO2Mg30biAuFZXCex88paxXugwhNtk1qCdBAzNQIG/wf0hUlVcWMXOzOQRfHIZZcTwfRx45GbYW1FgKKfnStX5O10yL4fBhaYAa6kby9lzXZEqE4aHgcr6xRKK6c+qCY3LbLYahPLWxOMEmrCBPuuMR/rJmyV3d2Do6uH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=861WXRcE47hjKl69I4CqcqlkijG/GL80BXcMb4HQo5c=;
 b=tehdc86kv6VCgnbV2sF7BC8Un9gF1frSoSYKXylSVLtuctbyUzCrTCGUWZMYZoDGVhC2WiTB2+zl5DT3LLOegfg3tYcs/nYCb2FaeArbvQkBMifsWQLNwVKIM7lWKXFdZE7kC8CyOCTTFOAxg8PRZZ7Rvn/R3A3PbbFEcAzAAU3FopOTYQOHj4/8XTsykS+gwB/iCRpEfXC5vofLBSfulH2Ai3ufLXpbhApAQXpRbf6z3OgNz4UF7lMjw2IlTsus7rxvTK7TVDVLfHmMqxS/FCgi86MhDqib1n/5oiojSkliIf6ME1Vwz22V4KHDlt1apqQ1AZMtxDAY9CbS54/WGg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index:
 AQHaRWELmXttIq3ydUeKyfZPAZRMh7DaobyAgqCezQCAABD4AIAAN9aAgAAPTYCAAWsXAIAACOmAgACHWACAALUgAIAAXkqAgAAZt4A=
Date: Thu, 20 Mar 2025 14:39:52 +0000
Message-ID: <eacaeb24-53a3-4de2-bb3f-32fd6f6c0f0b@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
 <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
 <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
 <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
 <19d8224a-04e0-45bb-9471-abeb684e9cad@epam.com>
 <7f523597-cf70-4673-b4a2-fac602253a9e@suse.com>
 <0f54652b-3af2-4d52-b3a1-76a5dbeddb14@gmail.com>
 <432b0b6e-2e89-4e95-8237-811e5e55517b@suse.com>
 <deafe2cc-df6c-42d3-9639-abd7b41ede69@gmail.com>
In-Reply-To: <deafe2cc-df6c-42d3-9639-abd7b41ede69@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9037:EE_
x-ms-office365-filtering-correlation-id: 3cb5a499-e0b8-47dd-3bac-08dd67bd1319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGdNQ0FwOHI4a3pucXVWS0NSYlhPc2hWZlRHN0gxcFFRc1JVTHFpUURCUWl0?=
 =?utf-8?B?V2JrU1RHcS82OGhkTWd2WDl0RDI1d1ZlZFpyK212OHVSbEFWOVpxMks3NVVz?=
 =?utf-8?B?RFpDTlFZSmM5eElhZS9KRzVETS93UUxKVUs4cnphendXTklybm45YWMvSTBt?=
 =?utf-8?B?WGk4cmo2cWNYYjZiMnNETG1lZHBkTVBaMndvVEtLckhLNktEeU12UG5xbUp3?=
 =?utf-8?B?RmpSRmsxaFRQNVhBeFpBKzFvN1JXYlhaVk9rbG1CU0cyQlFJSHR4S0Z3bUJ0?=
 =?utf-8?B?ZjNOd1A2NStjL1Y0OXNTOVVSTE9GMGhjTmk0NS9YUExKNGQrVExJZExDY2pw?=
 =?utf-8?B?S1VkaVprQnBUSU5taFowTlQ5VEIzNElFNFdZbWdUYXg1N2FiYUNRdC90Uzlq?=
 =?utf-8?B?ZS9XZkNsY3JJTW9UNTdlemR2Sy9IQ1BKYVN0am1Ra0lXdVNjZ1RaZG1SdHJm?=
 =?utf-8?B?S0xwT0NSVHB0YWRxQUhiaVBZSVJ1Nm82V2VxR0lmT3hSeDhJZkJqakJqM3A5?=
 =?utf-8?B?VHdMUjMvc2RKL2JDSDNSWC83SFFaT3NmSHlrT2JVVURvMUhxN3Vhcm9TZElU?=
 =?utf-8?B?NnRaK3NOTUNkaFpTNHNCM1drTTNpUDJCNEZSVWl1ejA1S0xUQkFuclIraXor?=
 =?utf-8?B?THRvV2hQNzJ2RVQxb1hVWHprMGZOb2UvQ3lrOTVpMG9DRVZUUFJweS9OQmtM?=
 =?utf-8?B?WlpFZ1pNS3BhNndwN214Rm5qejY4dWZ4N2RscE5hS1c2UHdGYkJUSm5Fc2Mx?=
 =?utf-8?B?QnlwSk1IS2pMdUhmRXFDd2hiU2NqTG43MDQ5QVhXa1c1SFhScGluMzl3dWY0?=
 =?utf-8?B?cmFCcWVvSFdQZGlSUGFnQm5DYTBURDZ2WFB5N2lkaUdpMjdLdTkybHRVaFdt?=
 =?utf-8?B?Q2VCNnJlMTZKTlVrZjdvUTVCSnA3OTdGQVhoaTh2TEhNRnhwdTBaQXptazU3?=
 =?utf-8?B?VTZuTVlZTWlUazJ5OXZ0cEpncjBaeUdFUDBNNy90V0NGSTJSeDJZeStuM2E4?=
 =?utf-8?B?MmV2Tnpxd2pLQzRDOXFHSjBSSmYzYnBOZThXYmFnQk9PTkNRV0F5aStkZEhn?=
 =?utf-8?B?VDhxRjRNbzYzMXREa1NlbTZURVkyWm5xVi9lZnBUb1dMU01vcjh1SnVVUWhC?=
 =?utf-8?B?bEJhMnova0VJT1c0b0hJY3RQOWp4VG5rVkt3bFUrSTNuWk0yTVlhWlgwVFha?=
 =?utf-8?B?bWs0RjNSL0k5NVNZY3NaRVZFUVJjUXNDaFh2MkRyYm9DeDI3UENESVVPcnZV?=
 =?utf-8?B?UStaTDcrVnI3VFhrZ2FyckY2TmQxVWdhVk9GckQ5eHBGZXZZak1vQ2ZEMVNU?=
 =?utf-8?B?VXN1bFRjWGFPTGNNVXp4UU9ncVM5TzNpTGxhOW1uekNtQ2tITUhuWlZSazJY?=
 =?utf-8?B?Tjd1TjVOSkMyWWNoZkx1dGM2ZDNzMisxaUhrWFd3SncvYlVVRDl5VnVvdlVU?=
 =?utf-8?B?QTNYQ1l2OUVKRXN1ZVVRdW5RS1BRQXBKYkZaRVJWV1RrVHFrOFhHRGY4aVlq?=
 =?utf-8?B?a2h1S2NRUWxBaHl5MHNhdXErcHp6VksvRHdaQmlmMTI5dlJ6bzdPd29xekU1?=
 =?utf-8?B?dUhmUDc5ZHhBd2lZUDEyUE0wRllxaFllNVBDK3VPRzZXZ2NDRWlpWTZiQ1Vq?=
 =?utf-8?B?b0lSUjVWVmVjTzBSVDdvUVI4R2FzMWVrMUVVR0tNSHV5ZGErYjVQWlhaTTA5?=
 =?utf-8?B?RkptNTZiTTAzQTNCNVpaSllsL0pCU0RPUGpxTTlUcFJwckNUVFRpSUs4VFl3?=
 =?utf-8?B?UkhFNmgrTGJNL3E3RWcwK0ZlWVQ1MlZJSmlvclpHdWxtMWUyK1pVVlEwSVlm?=
 =?utf-8?B?QUFNRDN4ODEyZWpzVldZV1I0ZzdKNU56SWdCV3RaQnNxVy9SRVpQR0N4TWNB?=
 =?utf-8?B?d05rV0htU25nS2JuSHo3dzNHS0wrL1FQYWg2MThjR0NDajBid3IrWFdhK2Yv?=
 =?utf-8?Q?eE0T9VTQoI7a1O+Se9eYiOiPu8/DnKrw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1RHRGtHd1pETG54aXZ3TFo2MUx0NzF1ZUlSdzBFL2VjNjhXWWlEQTNPaEQ1?=
 =?utf-8?B?aW9HMVJ1VmFFV3RyN2lBajltTytkb0haUWhaMWVtdnRRaWdLT2FQUGF0cm5G?=
 =?utf-8?B?ejlxUU0wc3hWbCtyWWt1SHM5NXJJa0wvazFTN1lNaXB2V2lxMk5JKzIvSEtK?=
 =?utf-8?B?S1lESTdNNEhpTGtCNkhkclUwV2pJcFZhUW9vTHJST1o1UnlwVnBISURUK3RS?=
 =?utf-8?B?aDRGWUpCZDIxaE8yaUl6YjQwTFJQeWpHR2YrbE8rVi85MTNjQWY3VCt3d0JH?=
 =?utf-8?B?ZjVlOXNObjh5Z0ZQM3A2blJ3bDNBUzlNSFU3UWo4NHFlY1RrSmNtL2txNTcv?=
 =?utf-8?B?REJ4L1hiM3YvanZMb2RJVEltVnF2UkhhZGtwc1JQamZLZ0RpWG45MnJLNkhT?=
 =?utf-8?B?TVBqb1JONmYySGwxb3lpWCt3ek1hT0xseUwzNHkzOERCKzQxUHphcFNmNEdq?=
 =?utf-8?B?OHJkb1pNemJxQWxJSWxNaWVLNXZPMHl6cWZiWFdPTXBtZlZCQllZU1paSVJo?=
 =?utf-8?B?TTgxbnAxa2syakZtOFFkUnhnOFowaVFxQWFWOGtidzF4K0lwcmh6dkptWW5Z?=
 =?utf-8?B?WE9WbjY3bS9VT3pEaElaYnFocXI4OHNFRG5lNFFmcHNhekh0dDhyb0xQVFRC?=
 =?utf-8?B?UU5sa3FpUkxUZ1ZCZlloQ25nM2tlcTRuaDdLWjMyTTF3d29SbDQvVnZsUXBq?=
 =?utf-8?B?NmNpTlV3YTExMEgwYUx5TEViUFc5Y25FMmJVYitjMUZkRmlWSVBabDBJWGsy?=
 =?utf-8?B?eEppcldwZVZPblQvODZUVW04NzJ1OUNaRFZsMkg2b1NoZ1VRMTJ2bkFiaE0z?=
 =?utf-8?B?VllOZTZRNXpOM3ZKay9tNnpKRSsxR0NDUnZjL1FPang0aEljRUtzbWZydGZt?=
 =?utf-8?B?cFRBTytpbW1hbFNWMmN4NEdYRWZYQmg5NFlaVmJ0VXdaK01XRDNmVXlja0Fa?=
 =?utf-8?B?TmNldGJzdDlLcG9ISVZEWmt3ZFJmd2NlNFZuQms5S21VN0xDV3JLVmUwYW01?=
 =?utf-8?B?M3NESG83bE1oUHNvUlRxWEUzM0tTN0p3Q0NzblhHRlJOd3hZNXA2eE4vbGVr?=
 =?utf-8?B?cGgrdXExS2pUU0trUHVSS3FPRzJqTmszb0VPMmJCdnBSMXV0SDRSMlVxeEsy?=
 =?utf-8?B?T2VPWGlseS8zbXZ1V25McFBWb1E3WldHMXRrNmcrN1NqSDJvN3c3eEl2alBO?=
 =?utf-8?B?NmppdTRCck9waVJCVW1hNk16c0IwTW5sWkJzTm9xWktJR0ZLNzh1akw4eWJK?=
 =?utf-8?B?Sml3RlFTcVVXN3VKOU9XVDkwdUFwSXFnQjVDOWcwbWNPc0xRUkl2dm5kVEtl?=
 =?utf-8?B?T2RyVUZNeUQwV1dkeW15QzdxTnFweFZlOTdsZUQvMnJUcHp3VGY1bFYxczNG?=
 =?utf-8?B?N3Zpa3BlUVROMmxrVWgwcUw0TVJmS0xkbWY0UjNTSVd4NXpFYnRyYWJ3aUQ5?=
 =?utf-8?B?K0tXUjNKWGZmY1FjVjkxcW4rTU9MbUFkUmQ2dk1qZ1pWcXJlOXVnbUhqbXJw?=
 =?utf-8?B?REt0eGxWL3l1NS8wSVRMSGpvK3I2YzYzdEFucVlxb1ZiVEliSHB4c3V5ZW85?=
 =?utf-8?B?SnI5NHB1YSs4K1RINmVucXdlQUs2WGU3NE9JRlNqMDdkbEZ4czc2RzBEcllW?=
 =?utf-8?B?Mmh4ZlFWcWxOcFQyTlg1WmpMVEt1Y3NIekxQZmJ0TC9lNHJBUkVjQkluWkpi?=
 =?utf-8?B?dWJEZFltamY4cjhmY3lpMVJiZXlabE9lOE13cVVKYTlBQWRWS2ZEMmJYOUtC?=
 =?utf-8?B?ZURrZTQ0aGZnNmZnb2pDemZlSXVpVHNKeCtnRzBZSnhzVTRZc3JGZmRKSlg4?=
 =?utf-8?B?YlhhSVVrcUQxTVovYlhwNVoyOStuTWlWK1FkY2JZOVFlMnhYbDhPV1FjakVQ?=
 =?utf-8?B?SFdDYk82OFh6TEljQ0QxeEF2NFRGYmpPK3lBbmtLV202enBKc2NHbHpkZlQz?=
 =?utf-8?B?Q3J1ek81bFl5VVlEcHpkZm8wYU9LbE1WYXMzT04ybGlhdllTYnNOQUczbjYz?=
 =?utf-8?B?dUdDVVlmY3RjV2dSMkQ3MmVlMVVnOFBFTHBZcnBXaERjT29mMjlhWGk3N3F1?=
 =?utf-8?B?WEdweXQ2T1Q3THYzYjRIK0VtM0tIU3N1aXFjNXVZOUJWTFp5MnNucS9zdDRH?=
 =?utf-8?B?aEVTZUlTSnFoa1pwSEhiNEsxZkZvTWJMMU9iWnVTQk85cUJ5cThxcHpwczI4?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1BE70D54ED91C47B783D775EE3F4D23@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb5a499-e0b8-47dd-3bac-08dd67bd1319
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 14:39:52.3249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOHYeFowv13BTcoITVg6AY9KrJ71rrahZj7vCCjURVYVvwp553NTJFpjulo0/2Htt7lqfirpm+gWo5D1GgTtZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9037

T24gMjAuMDMuMjUgMTU6MDcsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4+IElmIEkg
Z290IGNvcnJlY3RseSB3aGF0IGlzIHdyb3RlIGluIGN1cnJlbnQgdGhyZWFkIChhbmQgaW4gUkZD
IHZlcnNpb24NCj4+PiB3aGVyZSBpdCB3YXMgYW4gYXR0ZW1wdCB0byBjcmVhdGUganVzdCBBcm02
NCdzIGNvdW50ZXJwYXJ0IG9mDQo+Pj4gWEVOX0RNT1BfaW5qZWN0X21zaSksIG15IHVuZGVyc3Rh
bmRpbmcgKG1heWJlIG5vdCBwcmVjaXNlL2NvcnJlY3QsIHNpbmNlDQo+Pj4gSSBhbSBub3QgcXVp
dGUgZmFtaWxpYXIgd2l0aCB4ODYgZGV0YWlscykgdGhhdCB3ZSB3b3VsZCBuZWVkIHNvbWV0aGlu
Zw0KPj4+IGxpa2UgdGhhdDoNCj4+Pg0KPj4+DQo+Pj4gLyoNCj4+PiAgICAqIFhFTl9ETU9QX2lu
amVjdF9tc2kyOiBBbiBlbmhhbmNlZCB2ZXJzaW9uIG9mIHRoZSBzdWItb2IgdG8gDQo+Pj4gaW5q
ZWN0IGFuIE1TSQ0KPj4+ICAgICogICAgICAgICAgICAgICAgICAgICAgIGZvciBhbiBlbXVsYXRl
ZCBkZXZpY2UsIHdoaWNoIGFsbG93cyANCj4+PiBzcGVjaWZ5aW5nDQo+Pj4gICAgKiAgICAgICAg
ICAgICAgICAgICAgICAgdGhlIElEIG9mIHRoZSBkZXZpY2UgdHJpZ2dlcmluZyB0aGUgTVNJDQo+
Pj4gKHNvdXJjZSBJRCkuDQo+Pj4gICAgKg0KPj4+ICAgICogVGhlIHNvdXJjZSBJRCBpcyBzcGVj
aWZpZWQgYnkgYSBwYWlyIG9mIDxzZWdtZW50PiBhbmQgPHNvdXJjZV9pZD4uDQo+Pj4gICAgKiBJ
ZiA8ZmxhZ3M+IGRvZXMgbm90IGNvbnRhaW4gWEVOX0RNT1BfTVNJX1NPVVJDRV9JRF9WQUxJRCB0
aGVuIA0KPj4+IHNvdXJjZSBJRA0KPj4+ICAgICogaXMgaW52YWxpZCBhbmQgc2hvdWxkIGJlIGln
bm9yZWQuDQo+Pj4gICAgKi8NCj4+PiAjZGVmaW5lIFhFTl9ETU9QX2luamVjdF9tc2kgMjENCj4+
Pg0KPj4+IHN0cnVjdCB4ZW5fZG1fb3BfaW5qZWN0X21zaTIgew0KPj4+ICAgICAgICAvKiBJTiAt
IE1TSSBkYXRhICovDQo+Pj4gICAgICAgIHVpbnQzMl90IGRhdGE7DQo+Pj4gICAgICAgIC8qIElO
IC0gbmV4dCB0d28gZmllbGRzIGZvcm0gYW4gSUQgb2YgdGhlIGRldmljZSB0cmlnZ2VyaW5nIA0K
Pj4+IHRoZSBNU0kgKi8NCj4+PiAgICAgICAgdWludDE2X3Qgc2VnbWVudDsgLyogVGhlIHNlZ21l
bnQgbnVtYmVyICovDQo+Pj4gICAgICAgIHVpbnQxNl90IHNvdXJjZV9pZDsgLyogVGhlIHNvdXJj
ZSBJRCB0aGF0IGlzIGxvY2FsIHRvIHNlZ21lbnQgDQo+Pj4gKFBDSQ0KPj4+IEJERikgKi8NCj4+
PiAgICAgICAgLyogSU4gLSB0eXBlcyBvZiBzb3VyY2UgSUQgKi8NCj4+PiAgICAgICAgdWludDMy
X3QgZmxhZ3M7DQo+Pj4gI2RlZmluZSBYRU5fRE1PUF9NU0lfU09VUkNFX0lEX1ZBTElEICgxdSA8
PCAwKQ0KPj4+ICAgICAgICB1aW50MzJfdCBwYWQ7DQo+Pj4gICAgICAgIC8qIElOIC0gTVNJIGFk
ZHJlc3MgKi8NCj4+PiAgICAgICAgdWludDY0X2FsaWduZWRfdCBhZGRyOw0KPj4+IH07DQo+Pj4N
Cj4+Pg0KPj4+IFRoaXMgaXMgYXJjaCBhZ25vc3RpYyBzdWItb3Agd2l0aG91dCB0aGUgKG9idmlv
dXMpIHNwZWNpZmljcyBvZiB0aGUNCj4+PiB1bmRlcmx5aW5nIE1TSSBjb250cm9sbGVyLiBUaGUg
c3ViLW9iLCBJIGhvcGUsIHdpbGwgYmUgc3VpdGFibGUgb24gYm90aA0KPj4+IEFybTY0IHNvb24g
KHNlZ21lbnQgKyBzb3VyY2VfaWQgcHJvdmlkZSB2U0JERiwgdGhlbiBpdCB3aWxsIHBvc3NpYmxl
IHRvDQo+Pj4gbG9jYXRlIHZJVFMgYW5kIGRldmlkKSBhbmQgb24geDg2IGluIGZ1dHVyZSAoZm9y
IHRoZSB2SU9NTVUgbmVlZHMpLg0KPj4+DQo+Pj4gV291bGQgeW91IGJlIG9rIHdpdGggdGhhdCBp
biBnZW5lcmFsPyBQbGVhc2Ugc2hhcmUgeW91IG9waW5pb24uDQo+Pg0KPj4gWWVzLCB0aGlzIGxv
b2tzIHBsYXVzaWJsZS4NCj4gDQo+IEphbiwgdGhhbmtzDQo+IA0KPiANCj4gICBJbiB0aGUgY29u
dGV4dCBvZiB0aGluZ3MgbGlrZSBWTUQgKHVzaW5nDQo+PiBzb2Z0d2FyZSBlc3RhYmxpc2hlZCBz
ZWdtZW50IG51bWJlcnMgd2lkZXIgdGhhbiAxNiBiaXRzKSBJIHdvbmRlcg0KPj4gdGhvdWdoIHdo
ZXRoZXIgd2Ugd291bGRuJ3QgYmV0dGVyIG1ha2Ugc2VnbWVudCBhbmQgc291cmNlIElEIDMyLWJp
dA0KPj4gZmllbGRzIGZyb20gdGhlIGJlZ2lubmluZy4NCj4gDQo+IEtlZXBpbmcgaW4gbWluZCB0
aGF0IGRtX29wIGh5cGVyY2FsbCBpcyBzdGFibGUgYW5kIHNlZ21lbnQgY2FuIGJlID49IA0KPiAw
eDEwMDAwLCBwcm9iYWJseSB5ZXMsIG1ha2VzIHNlbnNlIHRvIHVzZSAzMi1iaXQgZnJvbSB0aGUg
dmVyeSBiZWdpbm5pbmcuDQo+IA0KPiANCj4gICBPdXQtb2YtcmFuZ2UgdmFsdWVzIHdvdWxkIG9m
IGNvdXJzZSBuZWVkDQo+PiByZWplY3RpbmcgdGhlbi4NCj4gDQo+IHllcywgc3VyZQ0KPiANCj4g
KioqDQo+IA0KPiBNeWt5dGEsIGFyZSB5b3Ugb2sgd2l0aCB0aGUgcHJvcG9zZWQgYWRqdXN0bWVu
dHMgdG8gdGhlIHN1Yi1vcCBzdHJ1Y3R1cmU/DQo+IA0KPj4NCj4+IEphbg0KDQpZZXMsIHNlZW1z
IGZpbmUgZm9yIG1lLiBJIHdpbGwgdXNlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCi0tIA0K
TXlreXRh

