Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F1B14BE2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062376.1428035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughCO-00072S-Co; Tue, 29 Jul 2025 10:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062376.1428035; Tue, 29 Jul 2025 10:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughCO-0006zL-9i; Tue, 29 Jul 2025 10:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1062376;
 Tue, 29 Jul 2025 10:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ughCM-0006zF-E4
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:04:42 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717788cc-6c63-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 12:04:41 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9022.eurprd03.prod.outlook.com (2603:10a6:20b:5b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 10:04:33 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 10:04:32 +0000
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
X-Inumbo-ID: 717788cc-6c63-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRZyaBWhOdqIedjVmYZwafiWnT4pyXDz11AjQhqqYdij8l1PXfjcw6TqJdElsrhvQKHwmsPYb2CZe0HXeRw8MD/kYpTlvvxqSJlzG6PlJLt4JYUgOSzDWmJnV7SXo6CP+V97viy08nFIGF31ZkT1kFN3s9+sn+1YMGDiymrWLD5PzgFtfHbiROxR+/Yx4weYleudWshDBDznK6kPS1VTqpKuYEj34M9HlqgRw4tUfA7/OKNO87pseOif3JM6GOlp3SrjyrgJ9LC6X8uOCydzPdr2rFVk71Dcuf9y4f7DS8+S9sz+UX9jyZkAJ3GVIx8eoUVuJfc5HaJftO2dTl0AvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od6xRjsF/LomqPTdEfum60583eacjXwDjf3+yCCltA0=;
 b=kmtmOokm5RkbsqZy6HxYi7ntOApdHh1nqQdj6Q6CbisiXSDFHfbO+me7ipzgZ+m5meQL06h9mDfUg/tI4ORwg4o/hTsioWx44HFqx1J1cZyfHxngCHVoQu8V3lOWjT6bL5cxx0mhEGy/71Lz26aenuA3R3+MzLtnQKrnnScBenAXUvI3RI9piCuMKDLozBhF69GLW9eALwSz9woqENVQ8BZWyKeesyNUMYPCsdxuIGeDSYBX0lcUT3ag5YWgNBos203SGGc0WDY7apsISS741JyCQkf+pudFplhd1payp6uoWJSHFVjn0/NhNB6GHd3zY+qde/VnyAsOWeigpScsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od6xRjsF/LomqPTdEfum60583eacjXwDjf3+yCCltA0=;
 b=udUFsAyd0MJ2zbxI5SOjZLW6Ecmqso8di91Zg76qmXHTMBz7OBPleVP8UBmIeuLbNc/tNGmuHI5TTQW8BA1Oy6nZ559AEJmt2beVXfcoAvTT59vCAOsBvCVSb2E233lS/0pL0XPOVJLWLAYl016pg8k7bz07SlMp+5vNyyCY/sNq6pCVbcH1Arsn1cuH+navWQM2NO+4LL0cr7yagZxTUM8kCBR8TgIjaaJ2UQBBHni19qcZSHjlLwx6/6OWrz/4TikHA7Mb/lEFIWsuEO9It8v/vobeRENFJ/Ur7umB33oRKe6irqSDfaW5Og3AbNV31/eurlzBRLP+aRzGB91k+w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
Thread-Topic: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
Thread-Index: AQHcAA0QZaFBUUSap0maTjLkZJJTcbRIvq4AgAAhkoA=
Date: Tue, 29 Jul 2025 10:04:31 +0000
Message-ID: <ef43422f-902c-43d6-8b67-10385427e2fe@epam.com>
References:
 <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
 <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
In-Reply-To: <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9022:EE_
x-ms-office365-filtering-correlation-id: 7903865b-26ac-41b0-44eb-08ddce87505f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFRZT2tNZzdNSnl2Y1ZIVXNLeGQvdjV0c21Jd1QrQkVoNlJYWlJRR0F6Smdp?=
 =?utf-8?B?NkxacWc2UlRLSml6a2NtTnJtNUVzY0VsS1k3NHhUZjQrTG5GYXByak5PaHl0?=
 =?utf-8?B?QXI4dFpaSlJXS1p6T0NJZGp6dk5aRUV0SEZ0Y2hDaXdTZEpJMW5wb3NrQ0xa?=
 =?utf-8?B?YWVGV3ZWMWRKK0hRb2VCaDBNV2Fha3Q2VlppL3kxc3lnSDNjUktXc3JGTUk5?=
 =?utf-8?B?N3BPbXZyWll4Ymswem40U3pZd3Bhd1RiNmRkOEU0eXhGNUdiQzN0c0FDZmNC?=
 =?utf-8?B?Wm1BR01vK2FOYW00eFVzWkNNc1ljMU11R3hNa3hkZGZZc253WVNnTnFBYWFJ?=
 =?utf-8?B?Wm5ROVJkRlBLWjFBSU9SeklTUHl5YlBmZ0dhaHVaNjZzWjdpTlo5UlR3R0Qr?=
 =?utf-8?B?VEYyc0I4cDRkT3lQelprN1ltUUVkeFhMVFdaem9US1dreUVrcGl1MGt2cHJY?=
 =?utf-8?B?cWlYTW53MzZyMXRUTUxOQWt4MDVVeWlNUFhtOC9oM1FKUGh3Q29HSUhpWG9C?=
 =?utf-8?B?bW10MmpURFVNdXhxK2xMb05YRzhucFgyaWJlNXVvVnd0OVJIaVBGMzZNMGcy?=
 =?utf-8?B?ODlab1JxeE1saE9uQ2V1SzJQSW10Tks3VzhSeGlyYXU5U3pid1Nkakk3aFZX?=
 =?utf-8?B?NU5xeVQvY1pCeUEzVGlYQ1dMWVZaK2NnRnF0NUYrMzBMaWZKMDVLRU9MU2w1?=
 =?utf-8?B?Yk9aSHg0NDE1TjAwQkNidS92a3dTOW1uOWFLOGNGWmFhUGE2Y1U0dld5RFhp?=
 =?utf-8?B?K2FRNk1VajY1Y1NoSks5c3h5S3RwYlFVN29BcXNqQ09FUjZjRm9CdHc2ck1y?=
 =?utf-8?B?TmRVZWNmR3FFM3VKTmt6T0RpWFNaazJLcjVXYzFVcXRyMzArSVZTSE1TbDNp?=
 =?utf-8?B?RjlONkFtbks0bGU4WjRrWUpkRi92d3JqU0tVWWdWZmtIbUhtSFh2K2htUmtm?=
 =?utf-8?B?QkxBMHg1djV2WlZ5L1RPMUdQVmFaemhwUzlETTVTdWY3N3RNcHNMOWIxUHpv?=
 =?utf-8?B?dC9GYk9CTDVQRVMxQU1VT1BNZjY5Rml6dk8wNE9ZVXpGYXkrdVBSWHRMNk1E?=
 =?utf-8?B?dHlDazE4OHQ5bzFBWU5CRGtJTWRjM1MwbTZrTit5NENueDN3dkR5akh4bSs3?=
 =?utf-8?B?ZUZsZmxWZnBHa2l5azRDS0xrMU1YSUFFSW1CZGhyYnBvMzhQcGFvRVloSDl6?=
 =?utf-8?B?WUFzYWtUWFN1N0FEdXYzT3laS1ljZjZ3MmdDblBUNGVKdG9YMWtKc1VISGJl?=
 =?utf-8?B?RTk3MGlkRXBTc0U2Z1RLRE15bi9ZSHpOV3R3Q2NnekcxR083VUhzbmM4eGo3?=
 =?utf-8?B?UC9pbXlYWkkvM2VLVzVPVGRpUVBXOW93REtVQmtkU3VjZTdqMm0xUzlnMG5o?=
 =?utf-8?B?cm1JWWxyU3BWK3RxVnF3OUU1MlhBZElvMUtyM0lpRk50VEdkVkQ5dnlDcUN6?=
 =?utf-8?B?dTFWWUk0WDFyYVVMSXBZYmJwNzZ4NXV6emE2Qlh0ekR1dGxzUFlMS0xaQmxG?=
 =?utf-8?B?RllySXFpOVFhbDd5WnBiSVFFREw0S0ZPR1c0c0R3eCtoUElRTlFmZVpQN21i?=
 =?utf-8?B?NE1Vd1pnZndPVUZPdmVVaElDVFNKMzRSbElZNVF5UWhmMy9lQVVMR01Yb2Jm?=
 =?utf-8?B?N3BnYkJkWGN4WStzWXJrSHFXaDlFdWcvU1hoZ0o1MzFyTDYvVUo2MG5RMnJi?=
 =?utf-8?B?ZHdFbFhmK2FGMGdTMFN4SGh3UXdQNmxNeElsR1haeFBMb0dDbzNxYTJpK1pM?=
 =?utf-8?B?S1dtckpkSS9EdVJHWjN4YUNFNjVvU3B1MmUybmJXajZvRGlFVVVnZzI1bTZG?=
 =?utf-8?B?azlteUp2NzJ4MjUyN05Fc0NHYnIxUzQ4MG9ENGhIazZhVlJoaGRyRHVCWVFj?=
 =?utf-8?B?bGVKSlJNVmVaOTBLTTdMbEU1V2JaQkcyVTFKQjRJLzFJUkQrNGdrQ3F5dVRi?=
 =?utf-8?Q?hb8pJbzFu7I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnR5ZTZiQUQ0aVRqdEhaTlcwZ1NSWmFNa1Jqa1pBYU5RL1VZOGxLNysyMVB3?=
 =?utf-8?B?eDhBRkU3ekgySXhKakYzbXhpVzU1Nk5EV3prMC9sYmdHOEM0aEgvRXg5ZjlX?=
 =?utf-8?B?SHhEVVlGS2hDei9vcjdWWFRjR0xvTXQ1OVhCYjlwRnU2bS9jL2RrQjhERUVD?=
 =?utf-8?B?WWptaVdrSVlhNjk3ayt4a3MrQlRpV2ZIVnlJaXNvckVKN3loSUk1ZFV6SWEv?=
 =?utf-8?B?WHBhY2VsYnJ3UnhMRlcveWQ0ZkpST1Vmb0hBSmh0SjhjajBKZ2ZJNnlIWmVG?=
 =?utf-8?B?aDdvL3l1MmVNeUUrZ0d5N0ZJaEw2QkdkTllVUCs0bGE4Rk1CVXM5SWpTRzNN?=
 =?utf-8?B?QVhWaXlXUVpEUUV0VkJKNVk4MkdoZlVVOENyWGdCa0dGVk9YdXlPSTdHZXhl?=
 =?utf-8?B?clNFRVlJTWxzMmw5RlpqT01HWG9UaEFHVk1KbHFSSVpqZXRNMUx4Q2d6VFND?=
 =?utf-8?B?Y0g0YXpYcmZvd0ZKamVQY3FVMmhOM3U1c3NORStZUnpSMnFDVklHaHE0UWlU?=
 =?utf-8?B?THBPZE5tREpBSGJSZmp5UTByWVdnS2E0N21WRm9QTzZyQkdOY3lndnZPRGxs?=
 =?utf-8?B?UkxjSnlHQ0Z3NWU5SmptdjQzQVdRZHRqRzdTMUdpTjZFOVpBWktEaFh1dnRy?=
 =?utf-8?B?S01aYW9qWG5abjJQU0dhemtMOTN5S25lRkxwS2Z6akdoelVBN2VyVlkzUzVw?=
 =?utf-8?B?Y2thWTNaYkFVNmQ1WFQ5OEZDVGVyeTZWdGFYTjhiZ01FUmZ3TktYTWdZWmhC?=
 =?utf-8?B?VTErdUJvbnVMYkVpOEQ2WThLWUtpbGsxVjRlYjFhNkFKamQ0T2MrVTVDS2Ni?=
 =?utf-8?B?czdGVWRpNThaNXlWZGttUHRwekVBODAySm4zSXAyc29CYlFKeUlpSXJSSGlZ?=
 =?utf-8?B?Nm1SMDFFZElFek5YTGcxTHJuSjl0ZjJYeEoyWFk3VTVRdDRKZ1BQL29qWXFs?=
 =?utf-8?B?TWRjMm5SdmhYTkxrK1pCeHc4VG1iVGZiYVFSbmtNaXNOYnNzWXVqSXVYdlU2?=
 =?utf-8?B?Q1NSN2U4UzhRRXpNTzZnYlE0UHB1RWhxYmxmaW55YkM5WWFmOSttTlZzSllt?=
 =?utf-8?B?dm5CUU4yODBuMlphRFY0SmtOTlZJcVJ5UzI4SVdaVXlQYTZEVVR1d2dBQmNP?=
 =?utf-8?B?YlJYS0dGTGRJazRQeXRDdXczYXVWTzJNbVdGZ0czZ2VhQ3g0RVluZ3N4QkNm?=
 =?utf-8?B?a1QraVNaOTFLVExJdUlocjlTTzJId3JKMnZta0xpTVJORTd6ZFJSaWh1QVBN?=
 =?utf-8?B?WDZUUlFWSjgvN0ZiS3NLMXNyODRCMTd1KzVGamx4ZElUaVNaOTUrMVZVU0lO?=
 =?utf-8?B?Z0l2VE85eVhkZ05KcE9JZUVTN1R1TVY5OVF4RS8rUVdjb00zenBGaGJndExI?=
 =?utf-8?B?bkcrWXIwYUlwb0xaTnVWUkNNSzZwZ1g3NkRLRjJUTnJsV2pwU0NKTlRueDhV?=
 =?utf-8?B?UFUzMW5ZTkZXMjJHWGpTeHlmanFxOWFtR0lpaU5PZ05weGQvWlFZMTZuand1?=
 =?utf-8?B?WUF0Qi9hd3lxejYwSUM0SUpYOW1mMjZkN2pmQzdOSkxnMW56RFJib041KzQ3?=
 =?utf-8?B?QWNZQmFlUFI0V2F5eGZIOHB6Q1I2Y3FFUWVjZDh1Yi9XNzJwSjNaR2NzbzlU?=
 =?utf-8?B?TElVODcyV1pOYXkzOXhDODdLZGNQNXRHZmgxc1lPQmdoalZYbGV3Y1Y5eEd4?=
 =?utf-8?B?TlM2UkU5UCtBdTRycTlhQjhDVmtYaUlvZ1JTaWcyaENJQ1NCKzd6dDJYU3NF?=
 =?utf-8?B?S0pCaXdZWGpLaTZ0dkRTUm9pUCt3eGlnSHFEdDE0ZDNSQXM2MGZwODNrek16?=
 =?utf-8?B?U28yUnIvTGJXbWd1MTV2aWNnS3pNaExnVDRENUNXM0lFUE8yUHlneGZ2aFFp?=
 =?utf-8?B?TDBjWjZQamtuU0g4MnU3RmtqRjFlampnNEFtYVJLQ0hsZ2JEdTQweTVQdEVY?=
 =?utf-8?B?bWVtL0taNzJla291UEwxc2w5SGRMeVk3R3J1eDJCRXpYbXJPYzJzMCtIZkd4?=
 =?utf-8?B?dlp4MkdmTVFGRW53ZFV5aHp2MXNHakpZNHp1ejRFR1pSUlp2a2N4N2hzRFR3?=
 =?utf-8?B?QWFkeTRVbnJZR1RkT1V4bG1tNk9BR0t6c0FvcUhXVCtNbklZVzUrQm9UNEt0?=
 =?utf-8?B?aHkrSXlkazZPUFhNRytPMjNHeXhOeWdTcnhhL1NseU1nK2JGejh6R3lLOGdo?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4E06A2EDC9C3B42936D281590CD0BCB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7903865b-26ac-41b0-44eb-08ddce87505f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 10:04:32.0458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBCJ+8pusL9YpH29OB8o8e68SPxWiC2UFapNQ0v6K5dnSdCcKoUW0Tlsp4HejESTzg8n+Xn1rmQCaRiKeVvQsln3YS95TdcUbzyDvdxqrP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9022

DQoNCk9uIDcvMjkvMjUgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNy4yMDI1
IDAwOjE1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBFQ0xBSVIgcmVwb3J0cyBhIG5v
bi1jb21wbGlhbnQgY2FzdCBkdWUgdG8gdGhlIHByZXNlbmNlDQo+PiBvZiB0aGUgJ25vcmV0dXJu
JyBhdHRyaWJ1dGUgaW4gdGhlIGNhbGxlZSBmdW5jdGlvbi4NCj4NCj4gV2hpY2ggY2FsbGVlIGZ1
bmN0aW9uPyBXaGljaCBjYXN0PyBQbGVhc2UgYmUgY29uY3JldGUuIFlvdSBkb24ndCBuZWVkDQo+
IHRvIGVudW1lcmF0ZSBhbGwgY2FzZSwgYnV0IG9uZSBzcGVjaWZpYyBleGFtcGxlIHdhbnRzIHBv
aW50aW5nIGF0Lg0KPg0KPj4gVGhlIGlzc3VlIG9jY3VycyB3aGVuIGNhc3RpbmcgYSBmdW5jdGlv
biBwb2ludGVyIHdpdGgNCj4+IHRoZSAnbm9yZXR1cm4nIGF0dHJpYnV0ZSAodm9pZCBub3JldHVy
biAoKikodm9pZCAqKSkNCj4+IHRvIGEgZ2VuZXJhbCBmdW5jdGlvbiBwb2ludGVyIHR5cGUgKHZv
aWQgKCopKHZvaWQgKikpLg0KPg0KPiBBbmQgYWdhaW4gLSB3aHkgImNhc3RpbmciPyBBcyBwZXIg
Li4uDQo+DQo+PiBDb25maWd1cmUgRUNMQUlSIHRvIHRyZWF0ICdub3JldHVybicgYXR0cmlidXRl
cyBhcyBzYWZlDQo+PiBpbiB0aGlzIGNvbnZlcnNpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
RG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCj4+IC0tLQ0K
Pj4gUHJldmlvdXMgZGlzY3Vzc2lvbiB0aHJlYWQ6DQo+PiBodHRwczovL3BhdGNoZXcub3JnL1hl
bi8xODFhMDNkNWM3NjI1ZDQyYzA2Y2Y5ZmEwY2Y0OGE5YmM2ODI1MzYxLjE3NTM2NDc4NzUuZ2l0
LmRteXRyby5fNUZwcm9rb3BjaHVrMUBlcGFtLmNvbS8NCj4NCj4gLi4uIHRoZXJlIHdhcyBubyBj
YXN0IGludm9sdmVkLCBpaXJjLiBXZSBzcGVjaWZpY2FsbHkgcmVqZWN0ZWQgeW91cg0KPiBhdHRl
bXB0IHRvIGFkZCBhIGNhc3QgdGhlcmUuIEl0J3MgYSBjb252ZXJzaW9uIHRoZSBjb21waWxlciBk
b2VzLCBhaXVpLg0KPg0KPiBKYW4NClllcywgeW91IGFyZSByaWdodC4NCldvcmQgImNhc3QiIGlz
IG5vdCBhcHByb3ByaWF0ZSB0aGVyZS4NCg0KQmVsb3cgaXMgdXBkYXRlZCB0ZXh0Og0KDQogICAg
IG1pc3JhOiBhbGxvdyAnbm9yZXR1cm4nIGFzIHNhZmUgZm9yIGZ1bmN0aW9uIHBvaW50ZXIgY29u
dmVyc2lvbnMNCg0KICAgICBUaGUgY29udmVyc2lvbiBmcm9tIGEgZnVuY3Rpb24gcG9pbnRlciB3
aXRoIHRoZQ0KICAgICAnbm9yZXR1cm4nIGF0dHJpYnV0ZSAoJ3ZvaWQgbm9yZXR1cm4gKCopKHZv
aWQgKiknKQ0KICAgICB0byBhIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZSAoJ3ZvaWQgKCopKHZvaWQg
KiknDQogICAgIGNhdXNlcyB0eXBlIGluY29tcGF0aWJpbGl0eSBhY2NvcmRpbmcgdG8NCiAgICAg
TUlTUkEgQyBSdWxlIDExLjEsIHdoaWNoIGZvcmJpZHMgY29udmVyc2lvbnMNCiAgICAgYmV0d2Vl
biBpbmNvbXBhdGlibGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlcy4NCg0KICAgICBUaGUgdmlvbGF0
aW9uIG9jY3VycyBhdCB0aGUgY2FsbCBzaXRlDQogICAgICAgICBzbXBfY2FsbF9mdW5jdGlvbiho
YWx0X3RoaXNfY3B1LCBOVUxMLCAwKTsNCiAgICAgd2hlcmUgJ2hhbHRfdGhpc19jcHUnIHdpdGgg
dHlwZSAndm9pZCBub3JldHVybiAoKikodm9pZCAqKScNCiAgICAgaXMgcGFzc2VkIHRvICdzbXBf
Y2FsbF9mdW5jdGlvbicgZXhwZWN0aW5nIGEgZnVuY3Rpb24NCiAgICAgcG9pbnRlciBvZiB0eXBl
ICd2b2lkICgqKSh2b2lkICopJy4NCg0KICAgICBUaGUgJ25vcmV0dXJuJyBhdHRyaWJ1dGUgZG9l
cyBub3QgY2hhbmdlIHRoZSBmdW5jdGlvbg0KICAgICBjYWxsaW5nIGNvbnZlbnRpb24gb3IgcGFy
YW1ldGVyIGhhbmRsaW5nIGF0IHJ1bnRpbWUsDQogICAgIG1ha2luZyB0aGUgY29udmVyc2lvbiBz
YWZlLg0KICAgICBDb25maWd1cmUgRUNMQUlSIHRvIHRyZWF0ICdub3JldHVybicgYXR0cmlidXRl
cyBhcyBzYWZlLg0KDQpEbXl0cm8uDQo=

