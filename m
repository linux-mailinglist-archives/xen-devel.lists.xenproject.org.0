Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83509C0195D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 15:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149133.1480858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBvob-0006Es-4b; Thu, 23 Oct 2025 13:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149133.1480858; Thu, 23 Oct 2025 13:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBvob-0006Cp-1U; Thu, 23 Oct 2025 13:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1149133;
 Thu, 23 Oct 2025 13:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBmZ=5A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vBvoZ-0006Cj-J7
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 13:57:15 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b14d19e-b018-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 15:57:09 +0200 (CEST)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 VI1PR03MB6238.eurprd03.prod.outlook.com (2603:10a6:800:13f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:57:05 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:57:05 +0000
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
X-Inumbo-ID: 2b14d19e-b018-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COnYn1MliNsk2W+hbpPKYXBgOTGKPoOEpgStV8SE0SPxoM6T/zs5YLr7tCzMT0GxgIbRMi07EfZx740EiEBS8sHBd8BltaCzwqZW8c9InOlPvkBLg6rMZkghZN1YuoxGBD9fkk4v2Drtaue3y1Se+jJrvKVVVxP0Ihqzhlf0o9Y1DIyKHW7Ri9vmcmVL3aeXJaE0SJ1w0A2knezjpKWGae2OWRsvSSHkR8ZxM1fQWJjRO5SVBOF3YVJVWzUyPT//TNvwmuNQubGLyEXhaghEnbeq4YoZfo7HN65k6TaL1VRIUxt8ojC1X7OUf6rsBxnvoUsFtDqH7A15T/d7OFDSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38o4BdJnOjDL7sfByaKkxBcCiR1+x8+EfHxbSYRpMzk=;
 b=mPFitM+cFXIXos4kkEb49cN5GbQUwuhsebZKJyWdroz6+SGP+QHON+zabyG8loEANF6UNvvm2rteRfgjc4WjFXSRLnyVSDywSsRHKF9GshDHGrPUT2qvum6Pk1bRTPiocIFkz6PAau9jJ8Cm9vaao6TGYUWbjnc/kWzvSsnH5jOlypomZc3gMYXxsuiGFrIPEOLgFQqYUyiZPernpSomXSy0JRRhNxVxUlx9mps6rqItIPy2k35D4dezNSZgnLVFI4i+Ns8A3al47mBeYGFfdh3Cjfp70iS6vQYJrwChY9VQVl+ARgqtPxbqiGv2rdXD+3p/Se0C6VejQZutYPawtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38o4BdJnOjDL7sfByaKkxBcCiR1+x8+EfHxbSYRpMzk=;
 b=N/sJwQwjQm4z5HYzght29LCDFqjCtUnmaziqhH+6ttGir7aTBwBtPuXG6q0jQjxZnI4y1RiXB/zekNj/tdrzk2s8DpZluM2kp6uS8Q4dbLXSF2y5N6eDqfjHuacMnpY40JXcMw95a9MNqPjJyWbBsSeL7DOJVVu3HwLai8BS+jl11oxLbt6L2dU3Q8OPadRDCWVIYUS3Im1n68nlvocj0J/td5cKRStkILFXuVIsSgNFjKoTLttKf0qcsLZssCe8QY80vM95p6fYXv0bxu74k2RExKvEM4hTkPB7lzMgvIEN52iNfVtsjiYSL8850TMm8RDSq8j7dXbGZ3hp01t57Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Topic: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcPSX2fWa1eZv9x0mRzqs7fz2kjrTCvSwAgAMyXQCACZ3PAIAABnOAgAA7uwA=
Date: Thu, 23 Oct 2025 13:57:04 +0000
Message-ID: <9a09cbab-851c-46f1-8026-603a7cb9d79b@epam.com>
References:
 <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
 <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
 <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
In-Reply-To: <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|VI1PR03MB6238:EE_
x-ms-office365-filtering-correlation-id: 73f011cc-357b-4bb2-5c82-08de123c0c8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RkR1cTJheXZjRkxNeGlmYjd6bFptbThSS1Zydm1OVVlxa0pRL3BvZUxIUjVO?=
 =?utf-8?B?bi9aZ201V29LQll5akZCNFBGTjVFRnQzUXArZTRlU21LcjdiNm9yOGRMYm5Y?=
 =?utf-8?B?WXoyMnlkM0E0NndBUEJaOVR6MHJmR0VCZlFuTWJQTTF1V2xNeXo4UURKNk9t?=
 =?utf-8?B?Vks0OHlaUG1pdzJFMlB1eXRia1dnQzZZMU1uVWJ1aWxnZFduVGxwSDF0NXlP?=
 =?utf-8?B?YWpvNHRBTmM5ZE9xRlQ3YkJBQzZyMXc1dVU1SHV4VXdvQ2tqaGdMM3JYdzBU?=
 =?utf-8?B?VWpXUzNMcUhjaTlqbk1oak56YTJHVkxPeERUY0FDcWVoY2pLTSs3Mll2ZWRt?=
 =?utf-8?B?WERmeHNyWFVFU2NtR3NOZ3MzZ25IeHBDc0E1OUVjaGN5M0dUcnVmYWorWE4x?=
 =?utf-8?B?YTFUWUl3MkVDeVkrMllzQmpaVCsxNE9IOEpGb2ZOeXc2TTJQM2tSRENzbnM0?=
 =?utf-8?B?N2pzZklQV3RvYlFIcnV3YnFBUTIvLzltL2tRRWhKd1hVZThwTE5uNDRNRUx1?=
 =?utf-8?B?UWRFdDlwYnB1ZiswNThmc3E5VUM1MTBUVG9ueWxUNEhsQjNhMzV5YmJxQ1BC?=
 =?utf-8?B?ZVhHalpEdzlsZDlLNGtncU5rUUp0bUxsbkpFTWNVRHJLU2Zma09ENk55eERB?=
 =?utf-8?B?Z2J0dGl6R1F6a3crQWFtS0psMzB5NnFXTHNmTW1weSt0dkpjMVF3emVZbm9r?=
 =?utf-8?B?Ylc3UDY1U2lJSjBvTGtET25Qak9BalB4dFBBNFNIQ0NSc3BRSGo1dERhWWxP?=
 =?utf-8?B?VnpDbW1UdFlic1JVMnBYRVJqTXpKL1gwNDRxM2E3dURoTG1va3FmV295R011?=
 =?utf-8?B?NWMxZEFXakZvdFdwMlMweTdVTThHbFhaampQUkFScWpjbEh2S3hEM0lrdXJZ?=
 =?utf-8?B?ekUwZlJ3VEVCZzM0aWM3L25kOUNEeEowQmQ4TUg0ZzU4bTBIRlh5MHNXM0d2?=
 =?utf-8?B?dXBTSEhUbTZMS0lwSFlUcnIvTVNuMXRySGRIODB0Vnd0MCszRWpWNlMyNGxl?=
 =?utf-8?B?RUVqUFVKaUMzNFVJWHdVVDZLaEFyQUovM2hGYnU3ODNXREFMYWQ3QTgrV2hp?=
 =?utf-8?B?OWhhbGpEbXBPZjVEUzRhY0w0NzBzMitCaks0aS96TGVwM0hrSkFIUmdZTk4x?=
 =?utf-8?B?TVdYeEU0V2U3bC9uc1dGZUtiN2pGQTJQZ1I2VTZVbkltR3FlWGVzODFobG1n?=
 =?utf-8?B?SEJkVncvajg1Zk5SbzE4T1luRmk3eEgvYUhtSjdFOHlhWnlBQ2dlZEdOdm1N?=
 =?utf-8?B?bU5MemdPeUdxQnh2Nzllc2gycUlyV0JGeWgrUVo0cUpJRHJNa2F3VUlOMFU3?=
 =?utf-8?B?cE9YTTZPN0FQckdCZkt5SlM4M2hLTWN2eTdheXdFOXU3cWorYUxRbzJqdDBz?=
 =?utf-8?B?aHQ2dkYyQ1pzNEIvTldzRlhoRWtLSUlERzJKQ3NKRnVBZUhka3VEVk5sUWth?=
 =?utf-8?B?d214a2NjMVl5K3o3OXFLaTJ2YWFVZE9ZK3JBT2t0VGEzU3ZzVFZsVEp3K0Fm?=
 =?utf-8?B?M3ZDTWMreEl2NWNSRWZwN2cwaGpDYjhZaGlZSi82MHlTRlR6b3grbUF3UjB5?=
 =?utf-8?B?N0Q3VFZpeThjSHVtMUduQ1hRd0V3dU5PY0N5Sm83SUE3czh0M3RwMDlUWk9u?=
 =?utf-8?B?STFKUzU3Lzk3Q0xXRFI0Z2NNRndJTVcxQ25WR09lQ0pGZUgxVlVVb0RXVGhi?=
 =?utf-8?B?by9YdmdhTTJOYzRqQit4aWJNYTR1RnpYL05mZEhTenpWS0p6TEZLV3BCUk1u?=
 =?utf-8?B?bGxBcHpzb29GWk9nUDFiQnFPaVdsdWdEWUlEaHk0MjMyVzFTWmdIa1V2Zk1n?=
 =?utf-8?B?QzN1VkVVV3k3YWpqNkh3SnU3WjkveU53aEJ3dVZPTjIyeDVyby9hUE4zZ09y?=
 =?utf-8?B?U3VuSzUyN05sRjdzYWN1dEdvbzhOdUNyRU83djNwS1FjS0ZMMWZubTNkWTdJ?=
 =?utf-8?B?UWQyTHNseXUzNTFHNXlvbmJHM3dqUkd0R1lTLzNGTm9PTDkrbFQyN1NGZXYr?=
 =?utf-8?B?alVSQkUzOFZzcVp2UHZHK3E0UGxvT1JEcnNodXdQekVwU1ZlZy9ZV2Jja01x?=
 =?utf-8?Q?FvuIZr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0xxeUlqaU5mMWRJbnRsU2dUNW5hYzlmM2pZakZtL0xIM004aTA4Q0J3cU5l?=
 =?utf-8?B?RTNiTTlOSGN6RHBvMHV0anFEb1dLeHYrNG5VY2FGUVZTWDdMazFZdEVLUjIx?=
 =?utf-8?B?SVpiZ3VlSUlybFZVK1BrWWZyODZYUEgxeUhrdEthZ0pjY0VLZ1RiY2h3Qk9u?=
 =?utf-8?B?czRnUnpFVDQzOUdiM0J6SUQ0NmpTbnNvdE4yaXQ0WS9DMHFiamNQeW5hWnJu?=
 =?utf-8?B?Tk1qWkNBZzdkWmlFZ0JOalJibFplaVhDU01qcjc3SzgvY0xHMXNUdDhLd2M4?=
 =?utf-8?B?UDFWaFBQOFh4dXlnSGpQVE1Gd3lsbm0zemViNkZxcXc3dGdmMEM4OHRCc2pY?=
 =?utf-8?B?Wk81a0pWcWNybFpyeGZKZ1lqTHdHZzhxUDdSUlRNcC9KZE03M0RVZDlPZTc4?=
 =?utf-8?B?b2RuQmY0cTd1aE9sZ2dJdS9OelRUTzdUUEs4L25vS3F4akRPUVFaOU5pNmFF?=
 =?utf-8?B?akJnOVlqUWs3Ym9aOEdYUlJ2UXBTWmQ4MG5zVWcxRjk5aElyak10NWRCWnF2?=
 =?utf-8?B?MytrOEsrWmdueTVidVZ6dXYxY1c0MHhTYlpCRTRuOFROS05rWlBCczhsZWdi?=
 =?utf-8?B?MGxwZ1Z2bGZCcmRjOUF6cThwWG14QnRIMUt4d1l5Y1lheWZvb2RKMDl4WGY0?=
 =?utf-8?B?cTQweHNNbjNGWXB2ZFlMSzhUVVlicHBpMmI3cUJXSk94M3J4QmFobFdpUU5v?=
 =?utf-8?B?MllmaGZobXRUVVNwekljbVBXalJIMUZ4Z0cvVUdZYTVUNU5zVlMwMnFkbThG?=
 =?utf-8?B?cFhsbFRQYlpMUEN5ZHNkZ1k2Si9XSk8vNGwvT2ZlOTRNeHpDdlFvUDZkRG5y?=
 =?utf-8?B?Q2FsUjdFRm9tRkw2Ykxtb2tMK29EZlhZMnFHWVpibWUzS3l1ZE5lYnRxWGVX?=
 =?utf-8?B?dnNURnBiUUFPaUtuRWxZanR4cFFXYTNrOUdMSXJYSGVFWkJ6QzBzTk8zS0xK?=
 =?utf-8?B?YTYyZy8xTVdLekFNRGRRYTM0Z3hPSS9lRk1lS0s2MFEzT2RLU1N2ZVhUbURv?=
 =?utf-8?B?a0JvVzhoOHVyNGQrenkvQmgyNTZaK0RSQmF2QVBSRVJraXF5S1V1WnpHdHNk?=
 =?utf-8?B?ZU1HelNUcWN4WFphcU1ERlJJK2tMam54TnFXNkwvVE41QVhGQi9VTG5lK2JF?=
 =?utf-8?B?K2pESG9Qb3VWbS9wUTNKT3N2M0QxL2tVYzZRNkZ6U1V4cStRbVNoaTRYdCt1?=
 =?utf-8?B?VnZRVU5teDZkdGlpWklSYjNFTTVtV3EreFhxZ3cyQ2Exd1h6Z2tYdWZoajdv?=
 =?utf-8?B?bnZvWEFuUmZYcDdMNkpHd3o0RlZsaGYvQXJiVFdvb3BlLzU3YUo0SU5jZnhk?=
 =?utf-8?B?TmxORnFLeDFuLzBaVDFDWVh1Qm9CTWV3N3I1RXhvcHpMMjIwUVo0UHZXdHVI?=
 =?utf-8?B?SUpRRUVjalJQZGdYSU1ld09ITHdNK1ZVWUxEYURyLzM5SUtCUVltN2QzV3Vq?=
 =?utf-8?B?ZGZwUlJnNThacUg5YXRlTEQ5azRpOUwwcUg2RDVha1Nuc0hLN3JNL1pwT1pm?=
 =?utf-8?B?SHkrcFU1OFduZDZkcW1YMkxEdjEzMnUxbjFLZDdOUjQzTzJGb0xFMy81TjlJ?=
 =?utf-8?B?K2RTODFOVzI4RHFwSUgzTDd3OWVObk9zM3VvOWl2dHVPUTNVUEthMER6OFRQ?=
 =?utf-8?B?bURsOGZnR000ekVNdENndXJtTE1XdnhHcWFpaVlUREpPRWVKZ3NvdFNzUlYr?=
 =?utf-8?B?SjNBRGRuUnBCQXFnYUNWSHZZU2lnTmovbm1IeFBTdVcwVmhPeFZCUGpKYWxV?=
 =?utf-8?B?bUJuckZNVUJCL3UrNlE3d1RqUTYxMUVieUNrWCszSmUzVEZFaWFFNU9zNFNy?=
 =?utf-8?B?M3N1a1U5RmkyV0lKd09IMXkzQVJKSGVsWjgxZVJ0QU5hd0lEbGpwUDVoWm5X?=
 =?utf-8?B?dEdyc0d6am5ja0ZiOGkvaG1mMmRuVzhRTERMUzQvWnNxRVEyejA0cXhPdmJN?=
 =?utf-8?B?Z0kxMjRjeU10V0x0Rm5zZkZzRXRxQklzQXY2WTNsdXh6Zm9OZlg0bFphM0kv?=
 =?utf-8?B?MW00VldmdWhoMjJQUkZZTWt0SnMxT0dmS2I3TzY2cTY5ekx1blU2a1VUdnN0?=
 =?utf-8?B?MU9rN1JSa2ErVHBSekh1M3hHNENVOXlMNnZCRFhGd0FpWGgwYm9JYnI4NHlU?=
 =?utf-8?B?WVduVTJlVW1tOHFDNzVJMEhoZmR1ZzFKVGVQa0E4dW9lSk1FQWQxUEVRTTRU?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <874A5298B21DD1448B8248BCDB232401@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f011cc-357b-4bb2-5c82-08de123c0c8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 13:57:05.0296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kj+KfU8nQF2j1Zs8Q4J5EefMFnNUSNeEh780hcEXLc4PJSsWuqxOaB9W5GGiiia6ArRUABbZxwTNY7sNNpN7YN0pUxymL9CWRxFNjLzx72I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6238

DQoNCk9uIDEwLzIzLzI1IDEzOjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjMuMTAuMjAy
NSAxMjowMCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gT24gMTAvMTcvMjUgMTA6MDks
IE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4+IE9uIDIwMjUtMTAtMTUgMDg6MjAsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+PiBPbiAxNC4xMC4yMDI1IDE4OjE2LCBEbXl0cm8gUHJva29wY2h1azEg
d3JvdGU6DQo+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL3ZlcnNpb24uYw0KPj4+Pj4gKysrIGIveGVu
L2NvbW1vbi92ZXJzaW9uLmMNCj4+Pj4+IEBAIC0yMTcsNiArMjE3LDIwIEBAIHZvaWQgX19pbml0
IHhlbl9idWlsZF9pbml0KHZvaWQpDQo+Pj4+PiAgwqAjZW5kaWYgLyogQ09ORklHX1g4NiAqLw0K
Pj4+Pj4gIMKgfQ0KPj4+Pj4gIMKgI2VuZGlmIC8qIEJVSUxEX0lEICovDQo+Pj4+PiArDQo+Pj4+
PiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5l
ZChfX2FybV9fKSB8fA0KPj4+Pj4gZGVmaW5lZChfX2FhcmNoNjRfXykNCj4+Pj4NCj4+Pj4gV2h5
IF9faTM4Nl9fPyBBbHNvIChuaXQpOiBMaW5lIHRvbyBsb25nLg0KPj4NCj4+IFdlbGwsIEkgY29w
aWVkIHRoaXMgbGluZSBmcm9tIFhlbiBjb2RlYmFzZSwNCj4+IGJ1dCB5ZWFoLCBfX2kzODZfXyBp
cyBvdXRkYXRlZCBub3cuDQo+PiBJJ2xsIHJlbW92ZSBpdC4NCj4+DQo+Pj4+DQo+Pj4+IEFuZCB3
aHkgdGhpcyByZXN0cmljdGlvbiB3aXRob3V0IGFueSBjb21tZW50IGhlcmUgb3IgLi4uDQo+Pj4+
DQo+Pj4+PiArc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlv
bnModm9pZCkNCj4+Pj4+ICt7DQo+Pj4+PiArwqDCoMKgIC8qDQo+Pj4+PiArwqDCoMKgwqAgKiBU
byBjb25maXJtIGNvbnZlcnNpb24gY29tcGF0aWJpbGl0eSBiZXR3ZWVuIHVuc2lnbmVkIGxvbmcs
DQo+Pj4+PiAodm9pZCAqKQ0KPj4+Pj4gK8KgwqDCoMKgICogYW5kIGZ1bmN0aW9uIHBvaW50ZXJz
IGZvciBYODYgYW5kIEFSTSBhcmNoaXRlY3R1cmVzIG9ubHkuDQo+Pj4+DQo+Pj4+IC4uLiBleHBs
YW5hdGlvbiBoZXJlPyBNb3JlIGdlbmVyYWxseSAtIGhvdyB3b3VsZCBwZW9wbGUga25vdyB0byB1
cGRhdGUNCj4+Pj4gdGhlIGNvbmRpdGlvbiBpZiBhbm90aGVyIHBvcnQgd2FzIHRvIGJlIGNlcnRp
ZmllZD8NCj4+Pj4NCj4+Pj4gRmluYWxseSwgd2l0aCB0aGUgdjMgYWRkaXRpb24gaGVyZSwgaXMg
Tmljb2xhJ3MgUi1iIHJlYWxseSBzdGlsbA0KPj4+PiBhcHBsaWNhYmxlPw0KPj4+Pg0KPj4+DQo+
Pj4gSSBhZ3JlZSB3aXRoIHRoZSBwb2ludCB5b3UgbWFrZSBhYm91dCBpMzg2IChlLmcuLCBDLWxh
bmd1YWdlLQ0KPj4+IHRvb2xjaGFpbi5yc3QgbWF5IGJlIG1lbnRpb25lZCB0byBwcm92aWRlIHNv
bWUgY29udGV4dCBhYm91dCB0aGUNCj4+PiBwcmVwcm9jZXNzb3IgZ3VhcmQpOyB0aGF0IHNhaWQs
IG15IFItYnkgY2FuIGJlIHJldGFpbmVkDQo+Pj4NCj4+Pj4gSmFuDQo+Pj4+DQo+Pj4+PiArwqDC
oMKgwqAgKi8NCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZih1bnNp
Z25lZCBsb25nKSAhPSBzaXplb2Yodm9pZCAoKikodm9pZCkpKTsNCj4+Pj4+ICvCoMKgwqAgQlVJ
TERfQlVHX09OKHNpemVvZih2b2lkICopICE9IHNpemVvZih2b2lkICgqKSh2b2lkKSkpOw0KPj4+
Pj4gK30NCj4+Pj4+ICsjZW5kaWYNCj4+Pj4+ICsNCj4+Pj4+ICDCoC8qDQo+Pj4+PiAgwqAgKiBM
b2NhbCB2YXJpYWJsZXM6DQo+Pj4+PiAgwqAgKiBtb2RlOiBDDQo+Pj4NCj4+DQo+PiBBbmQgcHJv
YmFibHkgdjQgY2FuIGhhdmUgdGhlIGZvbGxvd2luZyB3b3JkaW5nOg0KPj4NCj4+IC8qDQo+PiAg
ICAqIFRoaXMgYXNzZXJ0aW9uIGNoZWNrcyBjb21wYXRpYmlsaXR5IGJldHdlZW4gJ3Vuc2lnbmVk
IGxvbmcnLCAndm9pZCAqJywNCj4+ICAgICogYW5kIGZ1bmN0aW9uIHBvaW50ZXJzLiBUaGlzIGlz
IHRydWUgZm9yIFg4NiAoeDg2XzY0KSBhbmQgQVJNIChhcm0sDQo+PiBhYXJjaDY0KQ0KPj4gICAg
KiBhcmNoaXRlY3R1cmVzLCB3aGljaCBpcyB3aHkgdGhlIGNoZWNrIGlzIHJlc3RyaWN0ZWQgdG8g
dGhlc2UuDQo+PiAgICAqDQo+PiAgICAqIEZvciBtb3JlIGNvbnRleHQgb24gYXJjaGl0ZWN0dXJl
LXNwZWNpZmljIHByZXByb2Nlc3NvciBndWFyZHMsIHNlZQ0KPj4gICAgKiBkb2NzL21pc2MvQy1s
YW5ndWFnZS10b29sY2hhaW4ucnN0Lg0KPj4gICAgKg0KPj4gICAgKiBJZiBYZW4gaXMgcG9ydGVk
IHRvIGEgbmV3IGFyY2hpdGVjdHVyZSwgdmVyaWZ5IHRoYXQgdGhpcw0KPj4gY29tcGF0aWJpbGl0
eSBob2xkcw0KPj4gICAgKiBiZWZvcmUgYWRkaW5nIGl0cyBtYWNybyB0byB0aGUgY29uZGl0aW9u
IGJlbG93LiBJZiB0aGUgY29tcGF0aWJpbGl0eQ0KPj4gZG9lcyBub3QNCj4+ICAgICogaG9sZCwg
dGhpcyBhc3NlcnRpb24gbWF5IG5lZWQgdG8gYmUgcmV2aXNlZCBvciByZW1vdmVkIGZvciB0aGF0
DQo+PiBhcmNoaXRlY3R1cmUuDQo+PiAgICAqLw0KPiANCj4gRXhjZXB0IHRoYXQgdGhpcyBkb2Vz
bid0IGFkZHJlc3MgbXkgY29uY2Vybi4gSW1vIHRoZSBjaGVja3Mgd2FudCB0byBiZSB0aGVyZQ0K
PiB1bmNvbmRpdGlvbmFsbHksIGFuZCBwb3J0cyB3aGVyZSB0aGV5J3JlIF9ub3RfIGFwcGxpY2Fi
bGUgd291bGQgdGhlbiBuZWVkDQo+IGV4Y2x1ZGluZyAod2l0aCBzdWl0YWJsZSBjb21tZW50YXJ5
IGFuZC9vciBhbHRlcm5hdGl2ZSBjaGVja3MpLg0KPiANCj4gSmFuDQoNCk9rLCBiZWxvdyBpcyB0
aGUgdXBkYXRlZCBsb2dpYzoNCg0KLyoNCiAgKiBUaGlzIGFzc2VydGlvbiBjaGVja3MgY29tcGF0
aWJpbGl0eSBiZXR3ZWVuICd1bnNpZ25lZCBsb25nJywgJ3ZvaWQgKicsDQogICogYW5kIGZ1bmN0
aW9uIHBvaW50ZXJzLiBUaGlzIGlzIHRydWUgZm9yIG1vc3Qgc3VwcG9ydGVkIGFyY2hpdGVjdHVy
ZXMsDQogICogaW5jbHVkaW5nIFg4NiAoeDg2XzY0KSBhbmQgQVJNIChhcm0sIGFhcmNoNjQpLg0K
ICAqDQogICogRm9yIG1vcmUgY29udGV4dCBvbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgcHJlcHJv
Y2Vzc29yIGd1YXJkcywgc2VlDQogICogZG9jcy9taXNjL0MtbGFuZ3VhZ2UtdG9vbGNoYWluLnJz
dC4NCiAgKg0KICAqIElmIHBvcnRpbmcgWGVuIHRvIGEgbmV3IGFyY2hpdGVjdHVyZSB3aGVyZSB0
aGlzIGNvbXBhdGliaWxpdHkgZG9lcyANCm5vdCBob2xkLA0KICAqIGV4Y2x1ZGUgdGhhdCBhcmNo
aXRlY3R1cmUgZnJvbSB0aGVzZSBjaGVja3MgYW5kIHByb3ZpZGUgc3VpdGFibGUgDQpjb21tZW50
YXJ5DQogICogYW5kL29yIGFsdGVybmF0aXZlIGNoZWNrcyBhcyBhcHByb3ByaWF0ZS4NCiAgKi8N
CnN0YXRpYyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQp
DQp7DQogICAgIC8qDQogICAgICAqIEV4Y2x1ZGUgYXJjaGl0ZWN0dXJlcyB3aGVyZSBmdW5jdGlv
biBwb2ludGVycyBhcmUgbGFyZ2VyIHRoYW4gDQpkYXRhIHBvaW50ZXJzOg0KICAgICAgKiAtIElB
LTY0OiB1c2VzICdmYXQnIGZ1bmN0aW9uIHBvaW50ZXJzIChjb2RlIGFkZHJlc3MgKyBnbG9iYWwg
DQpwb2ludGVyKQ0KICAgICAgKi8NCiNpZiAhZGVmaW5lZChfX2lhNjRfXykNCiAgICAgQlVJTERf
QlVHX09OKHNpemVvZih1bnNpZ25lZCBsb25nKSAhPSBzaXplb2Yodm9pZCAoKikodm9pZCkpKTsN
CiAgICAgQlVJTERfQlVHX09OKHNpemVvZih2b2lkICopICE9IHNpemVvZih2b2lkICgqKSh2b2lk
KSkpOw0KI2VuZGlmDQp9DQoNCkRteXRyby4=

