Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CEAFF42A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 23:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038722.1410980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZclm-0005vf-Mz; Wed, 09 Jul 2025 21:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038722.1410980; Wed, 09 Jul 2025 21:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZclm-0005th-Ii; Wed, 09 Jul 2025 21:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1038722;
 Wed, 09 Jul 2025 21:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYN=ZW=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZcll-0005sC-7d
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 21:56:01 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc9e51f-5d0f-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 23:55:56 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by DB9PR03MB9712.eurprd03.prod.outlook.com (2603:10a6:10:451::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 9 Jul
 2025 21:55:52 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:55:52 +0000
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
X-Inumbo-ID: 7dc9e51f-5d0f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqWeAo6cLJz1Xf8Na0qxuxs1hdQJJ5KNUCiZ3SC1edC2ShTNK4JWiIWectIwsPl0tXwYL+RAQ0slcxnyTXgQt/En1shsPfcK3sFkaZHdTQDqEchxBS4k/r3kIDyCA3F/Og1fshImqDusF2265XHmN/A0qgaS4O/z06U4PBOOT5VlfP86GQDYu1mbtWkx/BftkN9C3MqclksMUTogeReG/KMHWNU8uDIuPFZCIuqvo/cpbMUvg+Idt/Hnx83ASvNJz+EIsP9r0tkDLYSpglBa4ABYoQx8djj4MQP6H45Ys1AMmycZTftLxdwNhE92jleIji976tZT18BNhqpMCqbpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+XjiHfwmSmTzheKIvlG8Mi+uDMl9KRiGIXOlT+EmM4=;
 b=mDxtCPfPEGePwuH/acf07xTnzREArO+9wb1QQC82/SyGrJyljHSyMYf1xvA4MMzsj87xSiJQITf+kGQftY4eEJEIhuYBYP6ySDFaPOD1iA7zHPsAaWhLvZezP7TNZ+S+a/yHUW/rzeD0MuVeiTwF2aAPhGvNJYkUd86/VAM4SsNgw0ks5GXL6wUw9ZMNwiinNdiVZIvWd4bMW2mNujdRJQrXT/0SS6Ed0JnDVxsCYCbwvC5n37eh+ubeF+OsFohxLoLM2J93w/QTE+YMeXeVgr7spJtGyhlUuzVsYX3V99UojuFG48iYaJMEjF3WXNZcvedVSuigvQzIT4r5v+eKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+XjiHfwmSmTzheKIvlG8Mi+uDMl9KRiGIXOlT+EmM4=;
 b=AFyUaTiK3JQIfGku0WlJeLn3h4TIqnEJS4V91koaEF3LqvRpEOptqsd+egHMBNrL/IzGWXyNrJ+WuyD7IS2fbld+yAiczf6SpsspKdBW21II8m69BIzDwabL5ebyaWu3coPbvZFAoI4h6ursSvLBxTwV4j4EBUkBqnXbdZtNuriKW+YJUbj/5Kh5HTzzndOo4xTfX92EprEv3E+6O/0hCBduUuNBjMbJSuQ1Zd6dgr7w4XNIaEBbELb5bLK+OkhNXthxSQX/XCmI69cA5QapvDrw5NpIsfuLKW/l9nsk8g9KVl7LEOWi6HIYTbECZQiWUkYxa7QwOaXgKyUce6eFqQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/3] address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 0/3] address violation of MISRA C Rule 5.5
Thread-Index: AQHb8RnHdjjk1vFAUECgAlFQj2Ifg7QqVkYA
Date: Wed, 9 Jul 2025 21:55:52 +0000
Message-ID: <fe8405c9-89c4-4d97-81b3-c33a21856a65@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|DB9PR03MB9712:EE_
x-ms-office365-filtering-correlation-id: 2066c768-0e3e-496c-7b12-08ddbf335fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YXY2QUpZYXBlNVc2QWV4V082OXNwTUpRMzMvaUFJaDBZTjBqQmZUdE1wamZw?=
 =?utf-8?B?UTZxK0RKM0tYbHJOK3l3dVVuOGtPT2g2dGt6SWwvK1Vxb01iY0d0VWpwNHN5?=
 =?utf-8?B?SWtnVWlWVmcxTlBwYVNjNk41bnVMTFJFOE9xcXowNjF0SVhGU3EwaWxjdGYz?=
 =?utf-8?B?aUZZbkxWeStIdkRNNVBwSm8vbjhYRnBMK05kdDRJRTRQMko5VmZCWjQza1lh?=
 =?utf-8?B?cEpXS0FTS1FYV0VtbUJVZXlSS3UzQnhvdm5vVk5mK3VFUWJITEdBM1FxK3ZE?=
 =?utf-8?B?QkRxdUZJZm5zY1Q3ejlxTzQyVGhGbDlRZFFpOVpyQkEzalR3Umo0d2VLdGd6?=
 =?utf-8?B?UjJyVnY5V2JRN29DN2MvWnBrTWJxNzN4YVl5bXA3bEl0NkloM1lRR2xmZlow?=
 =?utf-8?B?QnZCcTRCMzJNUzkzaWp0bVFwV1IyVktManRHdnkwM0VCc2I5ZHd0K1VLbE1G?=
 =?utf-8?B?SjhUL3ZQZHM3ZVRJUWtyaWhGcENGVUZCNGgzTlI0eFFQcFdBamFlMmRyZjM5?=
 =?utf-8?B?VjFBdVUvNVV5aDMvOUlPenVDSjRBMHk0OEZ5WHE2R3JOdWV5b20zRnI4TmxO?=
 =?utf-8?B?K3JTL3JVY21kdmxlRXZNRUhxWml0MUExczkzWUVScXMvNUdBRWlzUXptM0RH?=
 =?utf-8?B?MkFoZzRKYkVzZUkzWHQvWGhWNmFqTlluTksvL29HNEdrdmN4RnZMWjFQUElP?=
 =?utf-8?B?S0FxZGVHRWZHT1RzVEQ1V2dBUmZKZkxLTDZ2NEltM2V4SFphd3BlTW5QYTQ4?=
 =?utf-8?B?YmllTHhNMlpLblJxeVBzcGNmem9ZYVpSNFlmeWxxYXllYnVnaUUyRGlwTFlD?=
 =?utf-8?B?Mmc3RjJEV1lmL29XZEl2cEtONC9aQmZwS1JPVERXZUUwZTVUb3I1ckxVWnNl?=
 =?utf-8?B?a1B1djdpUGxJQW9YZXc0YXlnTW92a1I5TjRvVVA1amxKeWgvSVJjb2lyOWxv?=
 =?utf-8?B?UnY1OVJ6RFNlcjNyS2ZRMGhhalNJY0RkWS9qRWc5UG1KZitpWWtFMGI2L0NB?=
 =?utf-8?B?enFvblNHQklpcHVzWnhpZkpGWDZVNU5oZ3htRWhoYVNSTXZMZ1FoT3UvZnk5?=
 =?utf-8?B?bnZyenI2YnNhV1MrMlRZcE5FOG8xKzBiMVB1V1MxbUxtL1lkcDNyMWVuams3?=
 =?utf-8?B?SXhZT3hZbUs2aEZkR1dSbXUzQndqbVJJZ0NoVWY1NXRxUk9QSm1ySFhVbFJi?=
 =?utf-8?B?UGVFbkJaZEMvS1ZJUzN2cUQxMVRRU1V2c095QlJYSEtES0F0cUNnYTR3bWNR?=
 =?utf-8?B?VmtFdmhUOS81a1NLc1EzUWRHMk53aVJScDQvaTJyeXJ4WXRiLzdjakNzVGg1?=
 =?utf-8?B?bkJ4bS9RSHczajVrRTJkM1BuOUxMSktGZTdZN1d5Z3ZIeis0QzdJcElVS1l4?=
 =?utf-8?B?ZlBrbkNBSkJJa3ZWUm00YUpQdzBTUnI0dlM3a0t6UHpwMDFFVVZlcWpTMFdN?=
 =?utf-8?B?eGhyK0xja0RoU0xtWGVhQnp2N2VTZzhJeHN1SGMxa09yVkRKUDdGMC84RjEz?=
 =?utf-8?B?V3JidDlWcng0MlFuQjRhYVZKUnpUMUlVY2FYb3hNaVd5dVlkc1BYU2wxUmRG?=
 =?utf-8?B?emZOOGRxS0YzdlVKVW9kSXEyUVRqczJjMi9TdGFCQ2xhS0NTL2Z5VGdSejFz?=
 =?utf-8?B?RHhydUdkbk5yTnZhQk5JcVJNd0RibFloTHQ0cWI2ZUNIaWFZVkl6K1RWMDNH?=
 =?utf-8?B?UStoMGxFUVUvWWswWWRnd0FNRTFVQjlZSUh5RXJmc0RkbThtTkRLd1VLaDBX?=
 =?utf-8?B?aTMrSmhUSEUxVThieWwzdU41WktoYTJidElxL0tqWDk1V1NaK2VJSjFBbEdX?=
 =?utf-8?B?SE9JQnM1YkxWYW83bGsrRm5aTGxmaUZqUEdBNzlhOC9IZ1R2YTcwUjN1Ny9t?=
 =?utf-8?B?UnBCMWNabHJ0MmYwdWJudHZxd0VJaEJhNyt1VlFwM0FGdjRnTGtDK3VKbFlJ?=
 =?utf-8?Q?2v/M3/2CbQU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXZHUis1YlRvSVFvYkVTWDR2b0ZJUVhtcXBMSmNXQVlQbUl1Qnh0R0JYNmtQ?=
 =?utf-8?B?cXQrWHArdlZubW04bnhyNDNYWlJXeUZ4SEVoSkZhcG10U2lHK0lyYWRoQ2t3?=
 =?utf-8?B?bGJJbVRSM1BnVTZDVHBEK0J5byt4TkNVS0lHZ1NjSFlwT1FqdTU0ZFlETTRG?=
 =?utf-8?B?ZG9DUGRGY0hrdnlNemlOZ0JxaFBqSEQxbHRhY2lDVWRSdGw4MXcyYkhjZzhP?=
 =?utf-8?B?L2JVYnYvZlo1dnBJT3JLcVVXald4dFJXOW1Tc3hEZnJnSjJuUVlWMWhxclN3?=
 =?utf-8?B?eG5ERTI0cTRBVWZRRFBJa2Y3Q0xxWFpoUUZsZjZ3NTU5NDFMaXlERWhVVmx2?=
 =?utf-8?B?VDRKSFJHWGluUzI1R3ZTK3JXWXlkZXJrVEkwZ1lDMEtFUVY4eUYrL1JMbS9D?=
 =?utf-8?B?MzhnTmdxeHFER0JUZjRFTUJIRU9GYlpBbWVpZEJjRTM2TW0rMmJtYWpZWlBB?=
 =?utf-8?B?RW5zSG43blYyMHhaYnJSbzNKVSs1L1JzSi9GOGFXcmFzTGV5bU45YW54Qkd2?=
 =?utf-8?B?OHJrbTMyaXBGME5jaVp3dDNDbTR2RmlmWHdyalh4MEUzSUlTcU9VSWVQNXVj?=
 =?utf-8?B?b3ZWQWNUNFIyMnlEd1p6MHdWemY3bTZTZWcrcVRqajZST3Exd3QvbllNKyta?=
 =?utf-8?B?QkRUOG05Q3d4aFFEa05zejhaWHJiNEpJOFVZNERGZkJIdXl2SnUrWVhFS0hm?=
 =?utf-8?B?SjVlQngwd3NhUTBja1JGZ21SMCtiRHhrM3NpZmd3N3Q0UEFXNThsSElETTB3?=
 =?utf-8?B?U2VPQXJYdzZTcUlpNk9ZajBaR3ZGaWliNVp1Um5ONnRUUWxxaGF6QlVrZldX?=
 =?utf-8?B?bzdUaWsxUzJrcVF5T1o1NXQ1NnZhNWIyNjgzMS9SS1dXckYxM3hCM0J5UUZM?=
 =?utf-8?B?LytybGh2ZGF1MUVydHFyR3dibENoUDNTVHcrZm5LV3NNU1FCazN5UEZFNDVT?=
 =?utf-8?B?NEpreFBza3h0YzhTckdCZHhnQVNYdk1idHFzMUFwUHF3UkdIMkplbGRlL3Nq?=
 =?utf-8?B?K3NLYnM1RnJ3cHQvb2lQcXRPaTluUUlKTkN2ano3cEZuM3lVTHpON2Ewa0RY?=
 =?utf-8?B?eUc1OW9yU0dLeEZVaTF4U0pSSGZmZDgxZmczUitUNk5DS1FORlN1TVRkaDZQ?=
 =?utf-8?B?ckVsWnBzdzh4YlYxWVhxTWk1enI0U2RRcFV3aytTSm1xaFBaaExUNVRRb3R4?=
 =?utf-8?B?SzdHa0ZJZS9KelIxK1Z2Zmt5S24zSEFUYUN2OVRrb0l6cEZjR1BELzhHblFw?=
 =?utf-8?B?TmRRNFY1ZlZsNG5VaXFjSGphMEFkMTFRK2dGY3QzV3ZaOEhVcWdlTGVBS2di?=
 =?utf-8?B?b2ZMcHY3a0Qrb2hsWVNSU3pqTEovcDFGNFlEc1FhRlRZVzRHUVVmQkZ5UWZZ?=
 =?utf-8?B?dUZyMzlPNTlTRCt3c1pzc2I1N09TelNQWFo2a0gwcWpsODJPNHN5eDZDQ3l2?=
 =?utf-8?B?bDFuL2tsSmRCbHdJYVJZNUZDYmk1L202bG5yajlmV2p1ZVhNMlZFb1dpTjZU?=
 =?utf-8?B?eUZrNkVBVWVqT2tocm56YURyaklzeXhjZG9WOWlGUkhaM2g3RVdpWWQ0bkpB?=
 =?utf-8?B?UnpqUnJEQXlZZExOK041ZmJEVlVvbjFLYXdDclBkY1RKSzAyeDUvaW1JbVhr?=
 =?utf-8?B?QnRwY05wQ2dQZERERm90eG5YMlpYVmpIeHlBVi9zdldlUFBmTHBSMlcwQXJF?=
 =?utf-8?B?YTBBYWczTmxnN1JMQnZKVC83OGRDMmJpc0xqSnpNQjJjbUlQVitpb0hPc2J6?=
 =?utf-8?B?d09uNnZDWU9tTms5NE85WjlHMTE2alVldUMzb1p3alh5OXM1ZWZ1OFNnZVVG?=
 =?utf-8?B?L2hFZlFCZ29rZ1AzUGhSbUlCbmVIdk9RYmdzanZxWWVrd05JY25mTGlGZVBY?=
 =?utf-8?B?eW4xMHlib0gzTjBxVUhEeG9kUVdnTEVZYWFVYmR5QTdGUGl6Z2ZSUk9wbUJT?=
 =?utf-8?B?WXZnSTdmQlJlVWphTzhxUnBlalVRRUltTEU1TjdQV3hVZng2Z2pXZXVlSmdN?=
 =?utf-8?B?MUNrWlFrL3JxZjRndDdxV3BmYS9BcGtOWlRDUmo4d3hBTk8zWEJqQXpPcmRQ?=
 =?utf-8?B?THBveTI4TXNuKzdUT0EzNk5OajdVV1M5YzlRTlRZWWZoS2h2b0YwMXNPUTJN?=
 =?utf-8?B?aVdhLzlwWHNxcU9XWk1aVVBZL3ptRUVsRi9yTWdadjRZMXZjTzFsMFBTY0ZJ?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A7C150DD3FF66489F89A9CC3ADA0BFC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2066c768-0e3e-496c-7b12-08ddbf335fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:55:52.4790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sz7O65SDBnOFJr4Zc/VKybouBPdgTNMRTzzgy4/qgYJSdHRt6E/UT23QnYyao0PO5GmPok2bsjsQ6wHIBYxJbpJ83MzKd48+vWHHfxGf5k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9712

Q0kgdGVzdHM6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtw
NGsveGVuLy0vcGlwZWxpbmVzLzE5MTc1Mjc5MTENCg0KT24gNy8xMC8yNSAwMDozOCwgRG15dHJv
IFByb2tvcGNodWsxIHdyb3RlOg0KPiBUaGlzIHBhdGNoIHNlcmllcyBlbGltaW5hdGVzL2Rldmlh
dGVzIE1JU1JBIEMgUnVsZSA1LjUgdmlvbGF0aW9ucyBmb3IgQVJNNjQuDQo+DQo+IFRocmVhZCBk
aXNjdXNzaW9uOg0KPiBodHRwczovL3BhdGNoZXcub3JnL1hlbi9jb3Zlci4xNzUxNjU5MzkzLmdp
dC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vDQo+DQo+IENoYW5nZXMgaW4gdjI6DQo+
IC0gZml4ZWQgY29kZSBhbGlnbm1lbnQgaW4gImRldmljZS10cmVlOiBhZGRyZXNzIHZpb2xhdGlv
biBvZiBNSVNSQSBDIFJ1bGUgNS41Ig0KPiAtIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgaW4gImlv
bW11OiBhZGRyZXNzIHZpb2xhdGlvbiBvZiBNSVNSQSBDIFJ1bGUgNS41Ig0KPiAtIG90aGVyIHBh
dGNoZXMgd2VyZSBzcXVhc2hlZCBhbmQgTUlTUkEgcnVsZSB3YXMgZGV2aWF0ZWQNCj4NCj4gRG15
dHJvIFByb2tvcGNodWsgKDMpOg0KPiAgICBpb21tdTogYWRkcmVzcyB2aW9sYXRpb24gb2YgTUlT
UkEgQyBSdWxlIDUuNQ0KPiAgICBkZXZpY2UtdHJlZTogYWRkcmVzcyB2aW9sYXRpb24gb2YgTUlT
UkEgQyBSdWxlIDUuNQ0KPiAgICBlY2xhaXI6IGFkZCBkZXZpYXRpb25zIG9mIE1JU1JBIEMgUnVs
ZSA1LjUNCj4NCj4gICBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wgfCAgOCArKysrKysrKw0KPiAgIGRvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICAgeGVuL2NvbW1vbi9kZXZpY2UtdHJl
ZS9kb21haW4tYnVpbGQuYyAgICAgICAgICAgIHwgMTMgKysrKysrLS0tLS0tLQ0KPiAgIHhlbi9p
bmNsdWRlL3hlbi9mZHQtZG9tYWluLWJ1aWxkLmggICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4g
ICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
Kw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkN
Cj4NCg==

