Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8DB139E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061355.1426914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM6W-0008Un-3d; Mon, 28 Jul 2025 11:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061355.1426914; Mon, 28 Jul 2025 11:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM6V-0008TE-Vv; Mon, 28 Jul 2025 11:33:15 +0000
Received: by outflank-mailman (input) for mailman id 1061355;
 Mon, 28 Jul 2025 11:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugM6T-0008T8-Ve
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:33:14 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5079af8-6ba6-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 13:33:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7460.eurprd03.prod.outlook.com (2603:10a6:20b:26a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 11:33:10 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 11:33:10 +0000
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
X-Inumbo-ID: a5079af8-6ba6-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+dNV2K38Ak62fsEZWN1tIRTe0pqJnl8/aZZP3AJ6mcqTPHlp7oQMNNauX3HnuF6310s38Jq45RtK2sObQtSMp+KrIEDYp3Yt+bNEs1jm6wmWeUwG3IiRp7f4RudX9BQHwy/DsATXjOqm1Nq4npU1i+0CQyoHGzfI1FN7gln88s1M05nUwpDpRShQZCjNQbyZlYg8Z+YJdx6LHsqwPEnsXYjinQ1k9i0uKJGuG98DbkTjThRhBsc2d8CT80aH2V1VKmeGIfaP3z6bSQo2XxMMrNEsIslTVD2SrYmTXtN6JRVCFnAhIg9cY9G8hNSETyL8DFR0cv5aWNDeCOnZAOmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBzefJDLim7rzwv9YOALB2S9BsGrqypj4SzKHzXJn7Q=;
 b=cJCT44oEgOqjzXRuOza7lxFwbNFpokWODwzWSpdZmYEshyNCOVt9HaD/IIEx8yR0DAieCPNq6lae/FaxbjoyqWgxM2wQYz3YsbYy5tiHqKv7V/Qm+VW5BrDZ96TiyD9Eijz5TMAD8xucd4oxQWZ3pXHxVzTj5tTujYPFunRyCmCiPoa8UXaMhjO+X0fkU6cYQmvZ4govzowspqNtSV5VFtA8xbEPaCBC+Jw2GnUEBDVoTfJjTXzRVMZPDTgMx2Y6ztNMJsbJ+RPAy1q0jg4qFbYT6DlP4GXls/ho+b/4EeiYC9m444bI/E0KXSpGQuPy8U79WPDA1mVxDsssVIbKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBzefJDLim7rzwv9YOALB2S9BsGrqypj4SzKHzXJn7Q=;
 b=CP3jhMWtmM6TUKMS3IMPN+U8+0Vv/WQOUPxT1aOtIXUCyUf79Mp+ppibhpZyz5LQaZWnWkkS9QYgbEzYfriZXAIFpMnIWW+eg+jiTGrFrRdS7CCUI818v6cuf0R2V4TpBQgUO+SHwY2hNNVKyDo+EnxPw3wSprsBYJ/luwQcD+dagafOPnVmDkQBrGNcSjsOZmDOG/mon/9QNVM94BSqQtnx2zTXoyeA9n9eJHRmq2iaxG2Ng5uXijx7iGQBygi2w4sRw56AkPgxtSwg2zy/pn+X0lZvlvnYNDBYulAp00S5Jo6hPpgWaJ4bsdVFNFiGitvK7Vzpl4LBBEgAdItDOQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb/YCHt9uHUQWtj0esBUS8Oj/ZKbRHS1IAgAAgdoA=
Date: Mon, 28 Jul 2025 11:33:10 +0000
Message-ID: <4e5c6b8b-8db6-4de6-817e-34666292913b@epam.com>
References:
 <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
In-Reply-To: <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7460:EE_
x-ms-office365-filtering-correlation-id: 59bb2f81-7b2a-4bae-dfa1-08ddcdca8806
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ynd2N2p5TGpTVnJxdkpTOEpnZ3FRWHhWRXdseGZITjZmOUYxSzVXOFQzSmw4?=
 =?utf-8?B?anlYY3A3eGo0S3FoU2p3SFFYMC94blg1VFNNNy9rSGJDOXgvLzFremFCZi8r?=
 =?utf-8?B?dVlzSkw3czFWZE8xa2N4UDQ5eFJIQXN2V3c2aDd4azZ1Mi9LV3ZFRWRIeVpZ?=
 =?utf-8?B?b2tWZDJnbVhudXArZEZjN1hxL3JnMjBvS2pMb0tCYjZsWWF1cjVXaUwxVjA3?=
 =?utf-8?B?Nk1sUlZ3TE9YUlFPbDNHY3JNakcrZUdJQ3pYS2pDSGpBemFkSW9yMU9qUzZE?=
 =?utf-8?B?eWEzSG5jV0svbDRWVUNjcHlacWtnK1N4U05XZkRJK3JHUGhXZHNwcW43UnRU?=
 =?utf-8?B?M3pINUZoQWlUbzQyN2tIajNUQXlJdmhhNGFVeTBHSHNkZFdJTGs4QU9ha2h0?=
 =?utf-8?B?UVl5cmRDWjBHZlAvRVhUM3U3UThmNjViaEhwbDZUZnZzcDBSNktuc2FJTzFD?=
 =?utf-8?B?RldHQitPbzJMekN1SVNkSkxBMkJyY0MySk1JTTIrSk5nL2F3cDl2Y20xeTM5?=
 =?utf-8?B?dEZ1U25vZm83SVNMU2lRa3dzakZHRWNBR0ZPdkdWWjluQXBiS3BTQ2pUdlQ4?=
 =?utf-8?B?cnRvaEh6RHlpQktKV3ZqYUJWL2JQMW1xOTZpRytxMXRTUE9wNlNKYnIzbEFI?=
 =?utf-8?B?cXl3aXVmcGtHeDdtbTlDTmpXelJXbk1aekpWWlB1T3RKSkx1YTVQZ2JQM2Vk?=
 =?utf-8?B?SUdqSkVWdEdFd0ZnVlZJOWxiVVJNNXBkSW9tVU53TkFiTTMvTmFQQUMzZjk0?=
 =?utf-8?B?RkVJUUFHaGpxYTc4cGJNdDQ0eTZRWjEwRGw2OUZyZ1VhVjRaR09WNjNTT1JI?=
 =?utf-8?B?YUFhQmFIUHNqcTdoeDB6aG9lR3VIai8vOEVZQ1g0VmNNN295VER2bnIyTE5o?=
 =?utf-8?B?NVlwcWRUc3l1T2ZYNmdSSDFrcWpZaEF1UGF3VDlSLzBaaFlCaDhqL3RBa1o5?=
 =?utf-8?B?WnNJYXpNWlJYYU8wcjFnYmVYUWhMcmY1MkJCQ1ZOZUNtVkxNczNvTjJ3Zm00?=
 =?utf-8?B?VWpXbUQrc2xjL09XeUZRK3BMU1ZxN1VOSzJ1NlFFUU9lOUtCK2tQcVNVa1V6?=
 =?utf-8?B?TUFzcFp1S1Jhdk56bEZPaFBtQnh6MjArMzgxODU2K0pGbEp6TTVDMXlyVnpH?=
 =?utf-8?B?dENGUml2MWZ4R3dXdlN2ZmJuREpYa2F4TmRla25SQmZXSm9Ed3U2K0FPeUhT?=
 =?utf-8?B?OUJvM1hDT3hlL2syTGFBZStRL1FxQWlLb05GdGFXZ0trTFhUWW5xd3h5T1F4?=
 =?utf-8?B?V3hsYm1tMkVhUFgydTZ3UHN1TDZaTTNXNG9EUkkvQ25DSHI1TFhQY1dnZTVW?=
 =?utf-8?B?Y09hLzdBd2w4aWVWOG8xRDJuSTVTWXh0anhSR2dTc0s0SjdkbHlCM0FSYTkv?=
 =?utf-8?B?WVdHMDlDRGhLTGhsWXFFMGNjb0lRWVliRTQra3Q2SllLditkWUtoSmxvcThK?=
 =?utf-8?B?M3FMVHJTcmFVaXdsT3p2bEJOWHhRZ3dZdFl5YVFtNUdYdmdVSkUyT0hqZGJM?=
 =?utf-8?B?RktLSzJHeWh6SXo4dEs1SnVzUEloYlpoWXZsZFAvL05GdjVDTHFJbXhOSFFu?=
 =?utf-8?B?MmZZVXFjTkZZZE9XWG42WGFPTUZ1Q0J5cnExalJERnFWbnduTk4zZ2x3ZEUy?=
 =?utf-8?B?OW8rSEdYWFRDM1lDK3NYWk1QUlF1dW81d0lleW1QMis0TkR1NTBPcEEzdnEx?=
 =?utf-8?B?Z2QxZHNWMldjUTI2UEZWUXNRZTBnVHpwaFBXYzdrNkR0UjRuSTl4LzIyTHpP?=
 =?utf-8?B?LzZmeEdnN2xHZEF6RmY0NEYzUHgxdWxKQXIwTWhBaVU3U2loUXVzQi9MWVpH?=
 =?utf-8?B?UnlkNWcxUU5WR1Zjekl3WGRML1J4OGxobDJDbmkrU3pyTTJvZUpFTmN2Z0ZW?=
 =?utf-8?B?WGpJQkppQ2IveVBJSjJmM1luUlJrV2ErYzIwbEZ0M2IrR3puczBzMGQ4dThv?=
 =?utf-8?B?S1dyYVl4TG8yZkRqYkJsRWxLbVdzZmZVUDZ5WU04UUFFdm9pZzFJcDdWN3JE?=
 =?utf-8?B?RXkzWngyNEJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFBYdTJaS09ZcndURW5wQVJuU2xXeDBIOFlvMU5abEdCZWE2bFJtMWc4VzFa?=
 =?utf-8?B?MllXNGI3UUJmeXFVMEJMdXdBZkpvN0ljUDZ4N2JJOFpyckhHTGJBKzZLemJ3?=
 =?utf-8?B?dG51UmRMdkgvT2g2WUg2ZnRBNXFRem5NVmlqeUtVTDhzU1JEMkhvL2dnOTdt?=
 =?utf-8?B?eVBSMS9aZ250dTBSb2E5bEliVTk0YWx6WTNJU3hxNEJzcUphNU5RVG8velhO?=
 =?utf-8?B?VzhLcks4dDIrVlp2Tk9JaWxjdnI4ZU1YTXR4dU1qSmpvbFIxbDUvcU9HLzdN?=
 =?utf-8?B?K09PSzl5OUcrL1ArMmJzVjYxLzk2aVR5cUNvZUtMSXBHS1ByaXZBUTlvQTRB?=
 =?utf-8?B?bkRoUzFlNWIySHdKcFVGQy8zb3hGY2FHNW5TcjNxODBTZWRRYm5kb3hSdXFp?=
 =?utf-8?B?U3VCK1gvNWx1UWFzT3dLbS9JZ2ZKMm9KellFSkR1U1Q5TVJPakZYS1YvTTlK?=
 =?utf-8?B?L0kzcENjZERFTi9zYUFFeks5YUYrWVVWU2w0NWFvcUNUeUI5bUVNYkRNZ1JT?=
 =?utf-8?B?Rnh6NDgyRHZlSUdCMDhJK1UrQXFMSkpaQzV5N1dVbG1tbDdPSkVwV25IYnN2?=
 =?utf-8?B?c21DUVFOMWdzcFJhdGVubE56MEZkZzM1OFEzSVhUa3BuV3RiNmpwUEdZY2tC?=
 =?utf-8?B?TExKNE4vc250a0ZWaXhxeGw0NVBKd2t1ZStrQkk1VTJZOStqWThkUFNXLzN4?=
 =?utf-8?B?WGxZbE9oVFE2amZGUEdGbmpyUUYzTmRiQlVmeGpKWGNBcGxDWU9UaFRwNmpV?=
 =?utf-8?B?ZHo0TnBBdzQ3RDNBdm9oZ25hSm1SNEw0dXVDdUJoaE52ZzVjc3lqQzRVQzRZ?=
 =?utf-8?B?U0VqZFU0TU1uWFBzYUk4cGFnekNGWFFmQ0x3MFZJdEUyZGpjRmtsZUNPM3Nw?=
 =?utf-8?B?N0x4T1VxVGtaY1o4aEwzS1FVKy9ETEJZbzBMMTFQaDU4aXNkME15VVFFVlJa?=
 =?utf-8?B?Y2w1d1NRWi9ic2lCL1dwSUk4RnZSRWtuNDZHVENVRStIbnlXaTRlS3F1ZjlU?=
 =?utf-8?B?d3YzbG5Qc3c3dmRnQVVuckR1K2E5S2ZRajBPb1M1dE95Mnc3b1NkZDQxSUl6?=
 =?utf-8?B?cDhxSHo3aEhTaHoyeUgyNnM5MXRNd0xTeEVQR2VUeE9qdkR3dlBaK2xGSGN6?=
 =?utf-8?B?UWV5ODhVTzdYKzJ2SmNEQllsa0cvKzJqbDlHOHZ4UGxWTktDYU5EckNIK0VG?=
 =?utf-8?B?Ulp3WEJuZUJSU0FzMy91d2VLSml6Sm9peXMwVlFQWUdhYmRYQkRBWW8wejNH?=
 =?utf-8?B?cE1mSCtmMzI4dWhyeWNwd0dzdys5eUE2LzJHdlQyWkdIdW03ZnpsRXJ5Mm1Q?=
 =?utf-8?B?alZ1V3BYSU83VlpXelVmejdVRGx1TVdGUEhRKzRvZ3BTcnJCaHRoK2xHamJn?=
 =?utf-8?B?aVdGdkRjSis0aHROb2FGNGhBYVdQZVdYQkhTbWN1cVZjV3k1dk42SzBodGxr?=
 =?utf-8?B?dm1XYmNQU0crRTRlWWVlMzJrWVdSTXRBalg1L0xTUGFlbVZBOGt2ZWRPTlZj?=
 =?utf-8?B?bmc5MC9LZ3BQeW85TGhHaCtwYnVkMkc2aytKWU9GK0Job0F6TTdvMkIwb0xM?=
 =?utf-8?B?aUtFMXc2NDVnamZuQlNGa291b2JlV2pYaGN0S0tHRjRLL0FzUURpM3pUSVNS?=
 =?utf-8?B?MXVQcGo1WTgyVDFYVWxoQ1JOdmRBUFNpRnhjaGJheVdGUWdOMnowODM0NXky?=
 =?utf-8?B?Q2dqbVZHMVJ5eGNHcFpRb0pHNnhSaUYzaG0zV3ZXTDVHeUMwaGk2My8zR3Qx?=
 =?utf-8?B?LzErZjFUL2NBc1ZyR2k3UGI5K0cvUGZDY0k3MCsxY2trRmVPRlc1ZHRvam1m?=
 =?utf-8?B?ZFBKNnNtWjQxUWFFM0c5NTNwTUxwN2JkWklWZjM2V0NMVVQ2c1hTdVJRbEo4?=
 =?utf-8?B?eEN1Ukw2WGl5UnRoMVFSMmN4YVh0a2RxNzN6U1huaGlXQm1LckxnUU4ySHFn?=
 =?utf-8?B?RWNDM2E3MTlFWE9GeWcwQVgvczU4QklUNE8wSE5pelZYbXJuazdkNnJpeC9m?=
 =?utf-8?B?Y3VsaFZRUmZ3Szgva0hpOC9ncUY0Q05YWkZ4cFA0c2NSUzBHVnAzNmJQV29v?=
 =?utf-8?B?WE9DT05aajQyY3hBMFhXazVBK05CeElLUXdEeHFoVzFIWWRkcnNJWHA1K2No?=
 =?utf-8?B?QW1oc0JOTk5nVUllazZUNFhpOWV1SFEwNjY3ZlhPZjRzRysvVXpjbWRxYmho?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E857E5181DF7024891E523CAA4D0F996@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bb2f81-7b2a-4bae-dfa1-08ddcdca8806
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 11:33:10.5106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcQBG1r/aDbETTECKtRcqki4D3vOV5K9LEK55ZeeGTrUEeilogHwaZfv+rExs16FJc0p5PxPo3FABsQJZuKIycAnYPxhL+gB/mgDAUwNDVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7460

DQoNCk9uIDcvMjgvMjUgMTI6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wNy4yMDI1
IDE4OjI0LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
MTQyLDYgKzE0MiwzMSBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVz
Og0KPj4gICAgICAgICAgbWVtbW92ZS4NCj4+ICAgICAgICAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0
ZWAgZm9yIEVDTEFJUi4NCj4+ICAgDQo+PiArICAgKiAtIFI1LjUNCj4+ICsgICAgIC0gQ2xhc2hl
cyBiZXR3ZWVuIGJpdG9wcyBmdW5jdGlvbnMgYW5kIG1hY3JvcyBuYW1lcyBhcmUgZGVsaWJlcmF0
ZSBhbmQgYXJlDQo+PiArICAgICAgIG5lZWRlZCBmb3IgaW5wdXQgdmFsaWRhdGlvbiBhbmQgZXJy
b3IgaGFuZGxpbmcsIGVuc3VyZXMgdGhhdCB0aGUgc2l6ZSBvZg0KPj4gKyAgICAgICB0aGUgb2Jq
ZWN0IGJlaW5nIHBvaW50ZWQgdG8gYnkgJ2FkZHInIG1lZXRzIHRoZSBtaW5pbXVtIHJlcXVpcmVt
ZW50cyBmb3INCj4+ICsgICAgICAgdGhlIGJpdCBvcGVyYXRpb24sIHByZXZlbnRpbmcgdW5zYWZl
IG9wZXJhdGlvbnMgb24gaW1wcm9wZXJseSBzaXplZCBkYXRhDQo+PiArICAgICAgIHR5cGVzIHRo
YXQgY291bGQgbGVhZCB0byB1bmRlZmluZWQgYmVoYXZpb3Igb3IgbWVtb3J5IGNvcnJ1cHRpb24u
DQo+PiArICAgICAgIFRoZSBtYWNyb3MgZW5jYXBzdWxhdGUgdGhpcyBjb25kaXRpb25hbCBsb2dp
YyBpbnRvIGEgc2luZ2xlLCByZXVzYWJsZSBmb3JtOw0KPj4gKyAgICAgICB3aGljaCBzaW1wbGlm
aWVzIHRoZSBjb2RlLCBhdm9pZHMgcmVkdW5kYW50IGZ1bmN0aW9uIGNhbGwuDQo+PiArICAgICAt
IFNwZWNpZmllZCBtYWNyb3Mgc2hvdWxkIGJlIGlnbm9yZWQuDQo+IA0KPiBBdCB0aGUgcmlzayBv
ZiBnb2luZyB0b28gZmFyIHdpdGggbml0cGlja2luZzogV2hvIGFyZSAic3BlY2lmaWVkIG1hY3Jv
cyIgaGVyZT8gVGhlDQo+IHRleHQgZG9lc24ndCBtZW50aW9uIGFueSBuYW1lcy4gSW4gZmFjdCwg
dGhlIHdheSBpdCdzIHdyaXR0ZW4gaXQgY291bGQgYmUgdGFrZW4gdG8NCj4gbWVhbiBhbGwgbWFj
cm9zIHRoZXJlLCBpbmNsdWRpbmcgYW55IHRoYXQgYXJlIHlldCB0byBiZSBhZGRlZC4gSSBkb24n
dCB0aGluayBzdWNoDQo+IGlzIGFwcHJvcHJpYXRlIGZvciBhIGRldmlhdGlvbi4NCj4gDQo+PiAr
ICAgKiAtIFI1LjUNCj4+ICsgICAgIC0gQ2xhc2hlcyBiZXR3ZWVuICdwaXJxX2NsZWFudXBfY2hl
Y2snIGZ1bmN0aW9uIGFuZCBtYWNybyBuYW1lcyBhcmUgZGVsaWJlcmF0ZS4NCj4+ICsgICAgICAg
VGhlIHB1cnBvc2UgaXMgdG8gZW5zdXJlIHRoYXQgdGhlIHNwZWNpZmljIGNsZWFudXAgYWN0aW9u
ICgncGlycV9jbGVhbnVwX2NoZWNrJykNCj4+ICsgICAgICAgaXMgcGVyZm9ybWVkIGNvbmRpdGlv
bmFsbHkgd2hlbiB0aGUgcGFyYW1ldGVyICdldmVudCBjaGFubmVsIG51bWJlcicgZXF1YWxzDQo+
PiArICAgICAgIHplcm8sIG90aGVyd2lzZSBpdCBkb2VzIG5vdGhpbmcuDQo+PiArICAgICAgIFRo
aXMgYXBwcm9hY2ggc2ltcGxpZmllcyB0aGUgY29kZSwgYXZvaWRzIHJlZHVuZGFudCBmdW5jdGlv
biBjYWxsLg0KPj4gKyAgICAgLSBTcGVjaWZpZWQgbWFjcm8gc2hvdWxkIGJlIGlnbm9yZWQuDQo+
IA0KPiBIZXJlIGl0J3MgY2xlYXIgd2hpY2ggbWFjcm8gaXMgbWVhbnQsIGJ1dCAuLi4NCj4gDQo+
PiArICAgKiAtIFI1LjUNCj4+ICsgICAgIC0gQ2xhc2hlcyBiZXR3ZWVuIGdyYW50IHRhYmxlIGZ1
bmN0aW9ucyBhbmQgbWFjcm9zIG5hbWVzIGFyZSBkZWxpYmVyYXRlLg0KPj4gKyAgICAgICBUaGVz
ZSBtYWNyb3MgYWRkcmVzcyBkaWZmZXJlbmNlcyBpbiBhcmd1bWVudCBjb3VudCBkdXJpbmcgY29t
cGlsZS10aW1lLA0KPj4gKyAgICAgICBlZmZlY3RpdmVseSBkaXNjYXJkaW5nIHVudXNlZCBwYXJh
bWV0ZXJzIHRvIGF2b2lkIHdhcm5pbmdzIG9yIGVycm9ycw0KPj4gKyAgICAgICByZWxhdGVkIHRv
IHVudXNlZCBhcmd1bWVudHMuDQo+PiArICAgICAtIFNwZWNpZmllZCBtYWNybyBzaG91bGQgYmUg
aWdub3JlZC4NCj4gDQo+IC4uLiBoZXJlIGl0IGFnYWluIGlzbid0Lg0KPiANCj4gSmFuDQoNClRo
YW5rcyENCkknbGwgYWRkIG1hY3JvcyBuYW1lcy4NCg0KRG15dHJv

