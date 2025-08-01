Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45049B18104
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 13:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067161.1432107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnqS-0002cl-0w; Fri, 01 Aug 2025 11:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067161.1432107; Fri, 01 Aug 2025 11:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnqR-0002aL-UH; Fri, 01 Aug 2025 11:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1067161;
 Fri, 01 Aug 2025 11:22:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wfco=2N=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhnqQ-0002aF-GS
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 11:22:38 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12534ca-6ec9-11f0-b896-0df219b8e170;
 Fri, 01 Aug 2025 13:22:32 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB6955.eurprd03.prod.outlook.com (2603:10a6:10:205::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 11:22:30 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 11:22:30 +0000
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
X-Inumbo-ID: d12534ca-6ec9-11f0-b896-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVOOshQy1rmE+lXk7paxvK0C7ZzWb3Q2Q+xxkhFD1Obl9sWr6HjPAm0syVDv0S8KGkrkkSmdCX9TEyyeqbewy1R7jFke0N6yrRYYkMIT959E4njNl2G1oR7btaLG0ps8skPjVAgyN+j51s+GNRRwimGp2zpCCegHykOUJaIdWroQ5OFYS3ZhNq9bEl2MfOw+4vAaCB7RjPvEK4uIr7xRMLvADTRjbtm+BieBGENSV76ypifQ6ee4OzYD6pZwn3Fyg9wR+mvARkB9QOVEAg5N6ct111nlFGYLO0cY9b4jP64JpJpN5MLSuFMivyMtnlO/FkygnNvBjE73WKi434WiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsTFf/tfByx5PqbHucxZxW7daYfm0tCQX/MW+M8PHH4=;
 b=nBNzJpXMwGzwPl2S0WzTQNTnjBU8PzM2b6dRnm+Cta0NQ1njAa12zYVw+MOYUBRKxOgEnsEVUx8x1E6H109vCmiMyyehmuMcLtq+AwY5EAndeLmWDr8s4y4tIkQaEHRdEOLWlRULL7SREAB+iEbT7YWpgg0GP12Vd34kBgyalhAjqB1jFiwt11X2jY4Cb2qCZDycnfZBjIIESB2iOHKzaxWS0mPvvUakL6EKn12TZ/GxKg06QXmFF/aHd1DOJ09Ck/eUM+KsSBWZyM5i9IlCLJ+s/QmzXoL5szJTpvECmXOIfdjvSXczuM0ctvvlGrNJ7+IwAdrItzdpq77FuYCufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsTFf/tfByx5PqbHucxZxW7daYfm0tCQX/MW+M8PHH4=;
 b=YQtMy5R+9xEsrvUNaFihdWoMLn/b1fw7TLlaoXYS2GQXx3iPzObLJh+m29wL9k1R52/qoni7WbvWGXYy9uwO0RFpLcUPYgK+xaew8VeshMJ/ibK91FBGcUQtcEV5oLMNFN4dITAF6iVVaOMfEM060a8Bt0YuVlHUH+AYI0ZrP8D5mQTfh0bpHiVJvs4Y6T28my1YddDmXOdE260HhBvg6yISMT6lUedmm2tGz0NOF5fL8KLSDOUhaO7NpOp+qjKzVO6J9eETtSWPjg085cnQJZz7fww3jvCNN6244NQTy04caCQlq3PPecfEPasfva42zhM9viFM8uyUNRzNLNAKAA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] misra: allow discarding 'noreturn' during conversions
Thread-Topic: [PATCH v4] misra: allow discarding 'noreturn' during conversions
Thread-Index: AQHcAtHLnxwOVXCUr02VFN3cMhRppLRNn3SAgAAICoA=
Date: Fri, 1 Aug 2025 11:22:30 +0000
Message-ID: <cc10c5b0-316d-4ee7-9861-36ed7825aaf8@epam.com>
References:
 <c68de6862ee6d3d6f33eee4db278096c833c17e0.1754043159.git.dmytro_prokopchuk1@epam.com>
 <4475f575-91df-4f9d-ad05-41a4864baa11@suse.com>
In-Reply-To: <4475f575-91df-4f9d-ad05-41a4864baa11@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB6955:EE_
x-ms-office365-filtering-correlation-id: 1315492f-a3da-4747-f9c5-08ddd0edb3ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NjI3WmZGS1NiYUhEVklEMmtGc1M2VEZGU3F1RjhhYXZnTmY4dzFYQ3VCS3J3?=
 =?utf-8?B?OUpUSDUwZHVTMkVMNFc0dVkrODIrZ0FQWWREL3k0VVRMalRZVFJnU1R4M3I3?=
 =?utf-8?B?MzBER2RNL2Jlbzk3am4xMTErbVpSYkhDRktjTFBvZmdnaTUyclluTHVkclY5?=
 =?utf-8?B?MTJNaTkyQkYzaThKSll1dGh0MlhSMEVrdkhKY1c2MnBhOE4zTitlRmdWME9C?=
 =?utf-8?B?RElHT3hDY29GeEFaNVlmVlAzUEhNYkVsblR6N2E2Smk2ZkVmWU52UjEydjVG?=
 =?utf-8?B?NGhrZ2Q0OTUzdmFKRHRCNThHVmdtaHpSSDJOc2VQN3lVMHZJaXdwVU91S2dh?=
 =?utf-8?B?VGZSZnFZMlNyUjhzRUN0TEFUMU45aklkYWprNHU4S29TUG9nSEVzdldxeVhY?=
 =?utf-8?B?MUVHQnRkdmo2WUZ2cWt1MXJPdUFQZlNueEw5d3c5c2dKcGhMdWJscXZ5Q2JG?=
 =?utf-8?B?MTduUS81cG5rWk1HTVJ5OTF4cHlGVUM4a2J4alFxdzA3WU9va2RySGkwbnFr?=
 =?utf-8?B?ZW14dk84RWZtRytTWEEwSWI1NTJSdkR6TmQzSDQzY2l5YmVJenNpVlpmc2RE?=
 =?utf-8?B?V3NMV2RSZUN0VllGU0dYNFZ1SzUrajl3ZDlpandQSGxic0I1TCtRL2VHRjRG?=
 =?utf-8?B?cVc0U0hGbDlOblo5bjI1SVBLREFkRVlqTGxFTmpXTDk0UEpDOEQyTnNFNTFt?=
 =?utf-8?B?dmxHak5ReWREMGg2QUJlejVmQzBNWDZEWFVBZUcxSTd3Y1ExUmhXRnRlRGFB?=
 =?utf-8?B?Z3pFU1JjMzY1Y0YvUWc0RTlIdm5YNHJBV3BLTzREc0lrVjdyaVJlQ25oQmRH?=
 =?utf-8?B?MFRCU1ZjQ0Ryamo4clhxSDdxN3VmUzl5YU5DV3JBai9TSmxkSnkxcEVIU0dN?=
 =?utf-8?B?d21BcEVxMW90T0NMbThZRGZ1M3l5Qm4vS2FFVHlZN1ZxeE9ObVhnUHlKVkxU?=
 =?utf-8?B?eFBTWW13NmxJT05kWmpTT1QyZytVUGgwU3lOQkorak9SRHh2R2JCMTJ3M2kx?=
 =?utf-8?B?d0NLdVRRT1VNU3EwT2dVelYybVgyRkFucUlTTVBsdzNMNDNaT1J5L3V5TkNY?=
 =?utf-8?B?MWZzVm9wOWdLU0NmRDJJMWVlcDRFajNWM2cyZWVNQ1VMWjNJd3EvWWhqeU5Q?=
 =?utf-8?B?WVM0UmVtYUFobEhRRXBqSEx3Qm5DUGo1Sk5BMGdPaEJmU29HdVVWeE0vNUt1?=
 =?utf-8?B?NXVUamF4elFLL1c4OUhGaFFyZ2JMNDBRUmY0YlFFTUNLZnpvdmNuR200Q2N1?=
 =?utf-8?B?LzVzbFFQQUs5QVFiZU9VWmxVRlJZeEtIS2FTd3pweDhMMVUxaUtxM0dqQ1hO?=
 =?utf-8?B?ZXBWSDN0UGYrdkJsWWd2bmRheGx4R2NNa2ljdWJkMEsxUlpYRGl5NW5Sb21P?=
 =?utf-8?B?TTlsTDgzdWRRb2FVWkNHVS9FVlpNT201WnlXejMyWi9DblBVdENmMDFlYXI1?=
 =?utf-8?B?MWszdjVvOU1pU0p5ci82S2J4TWNGdzFtVkRpK1dXeERLcHNqY3BRakhJejZQ?=
 =?utf-8?B?YU04TWk4cnEwa2JwcVAydXRhN2lRZG1QTG1qcFdqdkpUaEMwVlVMRGJYeElK?=
 =?utf-8?B?UUJRTUlzcUdvNTlQakRUU1pZeHNNQVNiZjZtNEludUhLcllQa2YyWk84djJu?=
 =?utf-8?B?bzkwWGpDWW55OEcxWHBOVGtVb1kxNHJBZjgrT2VJRnE5ejVXNHlWU3VMK1Fy?=
 =?utf-8?B?WWZ4Zm1ZN3cvWnJmVjRTdExOMytUbXBxeWZyZFNUaWt3U2trLzcyaHREMWgv?=
 =?utf-8?B?TXVMYkJjTzluaGgwYWhlZTZCQ0tQMFVlT1hQZEppLzZzUzBBNUhrWEE3NHBG?=
 =?utf-8?B?eGo4N0dpdFJFNHR0TFBrZkNaaG1lcXBTMVA5MmNZYUlQOUU1Ym44Mkd6Y1l4?=
 =?utf-8?B?VkVIdzlacWRIQ3VvbmUzcEdLY2UvRGFkdW44ZnUwcjN2dXFsQjQvZTlRaW11?=
 =?utf-8?B?b3VZcGlkTzI5UlprempmaC9zMzF0WmRsTE9NUlg2NVkzeGxwckRKRFB2eHF5?=
 =?utf-8?B?WFBUUXdhZEh3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXBOTTIzSElQVng5ZFYxQzkwbEFTSStUNDZBUVBocmE0cE9vTVI0UGFHNDVw?=
 =?utf-8?B?REZZNEtpaUhVQS80UXg4MGZSZ2VuMHM1SmJBTW5CSjBwVmJ0cjJQUDZLelhD?=
 =?utf-8?B?dWsycVM1Z3k2NHV1cG1hMWNoVm1PcDlaeDE3L3lFRHd3d1N2c0pWNlF3UGN2?=
 =?utf-8?B?WURqeUJEUlBQSlpsaVRjMlhlTE9IVkYwN1lGakhGUDk1eTNUa1duWWpxcUQr?=
 =?utf-8?B?YStsbXVtN2VkcGdOd2lnQzFCRCtRZEJITXJ2L2NCRXJLQzdmY3BCbGxKOHRj?=
 =?utf-8?B?emxRT2dPMURUdHQ1R1NQUW0rN0phOXVKbytEOHpJUjAvbUFNZitIalBvKzB6?=
 =?utf-8?B?bWZiZ0I4VUNIZzFEeE1teWVLdHpoYlNpdlEvUlFiMjFGT2x1UjRmbWc4bHZQ?=
 =?utf-8?B?M2ZUcG80b2VsRzFxN1lmWS9makF4UDNTSjE1TDluRnJzbUxBZzEzV1M5VnZh?=
 =?utf-8?B?NkxqQ1JwZTcyZ1Q2N3JJMkJaaURpN0NOZGZEZzhCR3o3cFVlZXBlVnZha0p5?=
 =?utf-8?B?dGZ6ckFHYzVEV29XYjd3cEZnMVZhaWh6aDcwTzlXUDdWMDNtajFabnRKN2Zz?=
 =?utf-8?B?eUVCcFN5NERZayttRCsvOGdSRFFZMXg4RXl5OHdTTnllVlR5WEJjY1dFS0VS?=
 =?utf-8?B?RjhYcXltVGlNZmNLdmZpS3pkb0hQRCtRR2dVV3JXblNZejQ2Vjc1eXgvUnJj?=
 =?utf-8?B?TXhCNUJYYURnbTFmYy9vKzlPc1A0eFJXT3NMa3lQRmpNSm83LzBZZ0tpWWs4?=
 =?utf-8?B?M1hXdFJiSWdMMGpMS0w3dm55NjVFWDF2KzRhLy9Pem80ZHY4YjRBbGZ3Smd6?=
 =?utf-8?B?dzZsd3p2TDlXdzNRUTdqY2RPNk5kYi9rNi9HUFcrQVdPaFNrN3dGWWNvWXJ4?=
 =?utf-8?B?TkNWaURyeU9BNDZlQVlvUUtiQ0dYa0F1cVBTU3hMSTRLbTc3VGV2MG4vN3o1?=
 =?utf-8?B?UExDTkNtQWxrU2Jtc3lQSUdqVnE4NWR1aDV6WjhlQzBqUnJISmt1MzBQK29k?=
 =?utf-8?B?MWhMV2JCOXZIYVczbUt6ZzNJdXl2UEZSY2ZPalpLcm54bE9RWXZpVW5rTU9D?=
 =?utf-8?B?OUJpbERSWkxPODFFRjhvSTFYYWJadHRweE5WYXdFMVorN3VzSVRjMVJrbVJX?=
 =?utf-8?B?YkR1THFFYVRSbllsUFlsTE9Ib0dTcnRLVWtvY1pRSVR3YU9ZZmEwcjhyZmUv?=
 =?utf-8?B?RkhvRGd4VzNWZnEwZFhoL0ZrZHpwejM4NzdHdW1pZUErNHdlK1dvdi9NNWd0?=
 =?utf-8?B?TzQweHhEQk9iaGp1NWREQVRKV3VNeUdTSjRnV3A2MWVoWFRZMUxSRFowMEpF?=
 =?utf-8?B?TTNLRmFYOXJGbkI0b2laZ3hGS3IzUHJaeW04SkZjZDRkQmZzd08yUitNOXUy?=
 =?utf-8?B?MmFLTUJaRWp0bkN3RThhU1ZIVzlqaFpUc0ZRZHByS08wNFduTU53Wm9OWlFM?=
 =?utf-8?B?T2xyOTNtSklLL2o2VnFNYlg4WVNQcHpoZGl6dlBCYW1XbEk2YTVGcGVSZkx1?=
 =?utf-8?B?L2RwRUtpWDdOc0NENGZReTdySlV3Tm52cXR5clYxQmxuZ0ZNVU1BQ01TNjFN?=
 =?utf-8?B?ZWJNSUE3c085WUcwSjdNWXpxN3VmazBMVlRnL1luVkpGV1JlOXVQTWFHVnN5?=
 =?utf-8?B?M2ZDSktUZk43M1loY05aNTVlaW1YaWlGNWFEY1YwUTdacTBaNklsa25YcGNL?=
 =?utf-8?B?SnNlSVRvN25sMjdXS25tdEQzbnN6T3RxdlBibkFRR3FZVXp6cjJlTXd5M1p4?=
 =?utf-8?B?eWVkVXFVZXdWN2Q5c1RubTRxYVRKZ25CN3BoeXZENnFaUVJTb09XTHcxaWZl?=
 =?utf-8?B?U2lwU2orL2k0OXVlOS9HcTFzRXQrMDJldmJ0UGM2QWdsWGY3ZEVZaVZWelkw?=
 =?utf-8?B?STdkdlFSdC9oS0d5c05LNGh5aWlac1JiamxxUnI1R0hzWlZHaXlHRzd3MGxO?=
 =?utf-8?B?NlR4WUc3NW4xV2g2R0xpODZlVHoyVElMOHVacE9VTjdGZkhpTmMzei9EUTIv?=
 =?utf-8?B?UUtZdzBnRlhITmRjR0xhdzZyKzNUemNMMDZ3eXN1VXhIcGx6RTVTMDZJYlo5?=
 =?utf-8?B?cndQeHN3QURxaXJGeW1jZ21JL0Q2ZzZubnoyVjMrQlRPWENMTVFRT1VYdDQ2?=
 =?utf-8?B?eUlHczB1bmJFcTFadUk0ZVhwU0UrNnU5dENPcG0xcDlldDkrU202QlFwbEcy?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <804EAB63A0789A45B130AC4AF57F690F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1315492f-a3da-4747-f9c5-08ddd0edb3ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 11:22:30.0608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0s2MyWqlJrm4IXLM+DrTwvXG5rUIRs8K8hIkJJMDSPkCgPF65LHFvFVOJqAHetlfeW3BrFfSmRTq+9IXvCd5qIAPW7ApSd4TH+DL6pDlaDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6955

DQoNCk9uIDgvMS8yNSAxMzo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjA4LjIwMjUg
MTI6NDgsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IFRoZSBjb252ZXJzaW9uIGZyb20g
YSBmdW5jdGlvbiBwb2ludGVyIHdpdGggdGhlICdub3JldHVybicgYXR0cmlidXRlDQo+PiAoJ3Zv
aWQgbm9yZXR1cm4gKCopKC4uLiknKSB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZSAoJ3ZvaWQg
KCopKC4uLiknDQo+PiBjYXVzZXMgdHlwZSBpbmNvbXBhdGliaWxpdHkgYWNjb3JkaW5nIHRvIE1J
U1JBIEMgUnVsZSAxMS4xLCB3aGljaA0KPj4gZm9yYmlkcyBjb252ZXJzaW9ucyBiZXR3ZWVuIGlu
Y29tcGF0aWJsZSBmdW5jdGlvbiBwb2ludGVyIHR5cGVzLg0KPiANCj4gVGhpcyB3aWRlciBkZXZp
YXRpb24gLi4uDQo+IA0KPj4gVGhlIHZpb2xhdGlvbiBvY2N1cnMgYXQgdGhlIGNhbGwgc2l0ZToN
Cj4+ICAgICAgc21wX2NhbGxfZnVuY3Rpb24oaGFsdF90aGlzX2NwdSwgTlVMTCwgMCk7DQo+PiB3
aGVyZSAnaGFsdF90aGlzX2NwdScgd2l0aCB0eXBlICd2b2lkIG5vcmV0dXJuICgqKSh2b2lkICop
JyBpcyBwYXNzZWQgdG8NCj4+ICdzbXBfY2FsbF9mdW5jdGlvbicgZXhwZWN0aW5nIGZ1bmN0aW9u
IHBvaW50ZXIgb2YgdHlwZSAndm9pZCAoKikodm9pZCAqKScuDQo+Pg0KPj4gVGhlICdub3JldHVy
bicgYXR0cmlidXRlIGRvZXMgbm90IGNoYW5nZSB0aGUgZnVuY3Rpb24gY2FsbGluZyBjb252ZW50
aW9uDQo+PiBvciBwYXJhbWV0ZXIgaGFuZGxpbmcgYXQgcnVudGltZSwgbWFraW5nIHRoZSBjb252
ZXJzaW9uIHNhZmUuDQo+Pg0KPj4gQ29uZmlndXJlIEVDTEFJUiB0byB0cmVhdCBpbXBsaWNpdCBj
b252ZXJzaW9ucyB0aGF0IGxvc2UgdGhlICJub3JldHVybiINCj4+IGF0dHJpYnV0ZSBvbiBhIGZ1
bmN0aW9uICd2b2lkICgqKSh2b2lkKiknIGFzIHNhZmUuDQo+IA0KPiAuLi4gd2FudHMgY29ubmVj
dGluZyB0byB0aGlzIG1vcmUgbmFycm93IEVjbGFpciBjb25maWd1cmF0aW9uLiBUaGF0J3Mgd2hh
dA0KPiBJIG1lYW50IHdoZW4gSSBzYWlkICJkZXNjcmlwdGlvbiBhbHNvIHN1aXRhYmx5IGFkanVz
dGVkIi4gRm9yIGV4YW1wbGUsIHRoZQ0KPiBsYXN0IHNlbnRlbmNlIGFib3ZlIGNvdWxkIHN0YXJ0
ICJGb3Igbm93LCBjb25maWd1cmUgRWNsYWlyIHRvIGp1c3QgdHJlYXQNCj4gLi4uIi4gQ2FuIGFk
anVzdCB3aGVuIGNvbW1pdHRpbmcsIGFzc3VtaW5nIGFuIGFjayBmb3IgdGhlIC5lY2wgY2hhbmdl
DQo+IGFwcGVhcnMuDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRt
eXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+ICMgZG9jcw0KDQpTb3JyeSwgSSBtaXN1bmRlcnN0b29kLg0KDQpG
ZWVsIGZyZWUgdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4NClRoYW5rIHlvdSE=

