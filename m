Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3DA749B0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 13:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930546.1333175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gL-0006gi-6g; Fri, 28 Mar 2025 12:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930546.1333175; Fri, 28 Mar 2025 12:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gL-0006dy-3V; Fri, 28 Mar 2025 12:19:29 +0000
Received: by outflank-mailman (input) for mailman id 930546;
 Fri, 28 Mar 2025 12:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gne4=WP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ty8gJ-0006CK-Sy
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 12:19:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3eaf481-0bce-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 13:19:26 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7313.eurprd03.prod.outlook.com
 (2603:10a6:20b:273::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 12:19:18 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:19:18 +0000
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
X-Inumbo-ID: e3eaf481-0bce-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz5suee5B+AZFHHD7ZkF+l4tDLBfXhGol/+G1psMkPWkulWWfUyitCu+vpCJIHmFaGH6/dDd0yLLK1TuhrR8JiibvoaI4rkLJMUDCLyB76KFqGmJQdY3vlmRZaY+en3Y8chKIrBAKs14vg3oGwD/+Mm7t5l6DkIDLy6iQW+X9z0wneeZ08ghNFBX2iJJ7voo/KA2JbP/tYpiSy0iMj/LBmBJpTpuexcRjdnoHbfzd/Nsbh+L/jGue9oarWn381OQ5oktjnvfcvdoHXHvV8Xu3uW8po9Becn/C823WWbeLqzNSeLQ7Ni/oC3kjheqtelrw2K+5rajupTLgY+4dqxqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUMGxm33AzvPgMSbFPnRpY/1DSFzSMIFU0d0bQ1ISWA=;
 b=P54w5QpWCivUhNRbHA45GIuPy/EyOndoZZL4LfCqvfn6iV9XFvUVsiIbgJFkLLCVM1mMO2lB4fdFXpvEBhK7cxFNDCWHdl3sX/D/akCWyXnvML6gKQclDyl/QGzwXbADjng+r6UIt3n3v/bsUS7j2n/KV9OcVxS382igDtQStabk23aFwdTZI8dDNOTP6qnkj0wr+nW0iRzEe+FV2Imojls5sFzckZBEO3D0ZQM7Kyfc8758nwiG9JtNAM5uW3yxde0mqO1N6/xhMn/JSaLVjB4KoAIgOtEynrhVzl0LJ36pBjfGm0uWBl3SABKU/4moeTRq2HC+cIKzJ9XXyPoYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUMGxm33AzvPgMSbFPnRpY/1DSFzSMIFU0d0bQ1ISWA=;
 b=Z266YCmDvqY9MyMPAJobw/CrdM61/edoOlTOhA+0YlydCzlZ3UQJ10VkWTQvMO2WX1Lja4PDgN3s8TYcV+ZrqibjC0oYlacAFtAYit+kYdj9SoNn3taVOJ/1oFoT+aNi/kc19CsptJwCdvSM6OqqlGZZL1OrrUVH8RqNbDBNDu0bj3I/uKTCgbtTmOK/+BtBKv3f9mnT8zG4H0GdGnIvVFrTksO/LEoTcI5IWAZ9JJAV+sNtlpq2sXzydwxVwkyvMRyCWLrcnNdZ/SrpqWd0lQpJV2QATZxQuq585c5iiGtEf7DRMVsyq4En12NIkGmu/KFtWch/Xi4000sanLanrw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/3] xen: x86: irq: use do-while loop in create_irq()
Thread-Topic: [PATCH v2 2/3] xen: x86: irq: use do-while loop in create_irq()
Thread-Index: AQHbn9uhrkS1XYNimkOfzt6xc/nvUA==
Date: Fri, 28 Mar 2025 12:19:18 +0000
Message-ID: <20250328121902.2134020-3-volodymyr_babchuk@epam.com>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7313:EE_
x-ms-office365-filtering-correlation-id: d47cdbba-3d14-41a9-4efb-08dd6df2c3a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTFlYTh2Y0dJblhySkt4Y0pva0JjUk9nc0s2L1R2Qkg3QUR6Z0x4WTZWWjhh?=
 =?utf-8?B?K0pta2Z2MmxoWXRMQ3JBVWFzYi95dGNWbjdXSHdRUjBBdllPMGh0dEExTnhX?=
 =?utf-8?B?NGI1a2NubHdhV2JHWWhybmpKc0NKbGlDWjNXMVhtTm1Sd0VrUHFyOWxDTE9i?=
 =?utf-8?B?bWdONUpzTlUwcnpWTi81TDB1TThDL1hFeHNSSnJBbDZzVTRuOUdvNVpzTjlZ?=
 =?utf-8?B?d2dPUm5UUTlsTTR3QmtJcmIzczB0eS8zeXpuZm9JOUJKclpYQkNNZm5idWpB?=
 =?utf-8?B?alVqd0VBbkVwSXpWQmVGTlZDSkZBQXZsblJWQkdndTZXWjVZbStqelYzWUNE?=
 =?utf-8?B?SDlrSzlvZDJqTlY5TGhPYUZCWEJDTG5PL3dYbFpQZmljd0N4eXZWMEJxdDlq?=
 =?utf-8?B?Nk5tMnhkM0E4OUh6cE1mRmJNQUJjQmFjRTdMTzdmbVV3S3JUME9CNUVzL2VP?=
 =?utf-8?B?aGd5Sko2aG1LRnBjV3RGRTdSL3NjYUhUbVNnZWhGWEh6L2NPTi8vQWQwaFp2?=
 =?utf-8?B?VmtNSEZ1WTdkdXd5eHBSQjFiQ2dKYlBYQ2lKa1pCU29MVjE2WnpRREZlRmcy?=
 =?utf-8?B?Z1paaTdWellzZDJCaCt6OWovd2JXV3RqT2JJZS95TEZWQmJXeDJETXZzZVpo?=
 =?utf-8?B?NkJWMW1rU2p3eXprRnZVT0d1TS9YWi9OekxWMlNvOVFuZ3ZxM1hGQUZYc0Qx?=
 =?utf-8?B?Vnoxa0tYWm1SbUsrdkN1YXU4KytjMDBzekNKTzZObEorQ0NPY2hJRnB1QXR3?=
 =?utf-8?B?YjhTSnRsa0NFSWxiMDYwQjFiMWlSS01OUVlyZE56MnpVNnRBUWN5eldZMG04?=
 =?utf-8?B?WVV3dVRFbzNKWG96dnlrSG85aERNR0ZZNk5vQWlWOE96MGMzM0xLZUdVTTR0?=
 =?utf-8?B?NXFJbktueWxpeVBMMnpnVmt4b1dYTUNQdGZIUUxVYkpJUnZOMGF1RTk0YUNG?=
 =?utf-8?B?WWx6ZVR5WUw1RzlMd3hIOXB6dEF5bEhNNE5BTjVzUjZobTd5RFB5bWVEeDJl?=
 =?utf-8?B?Q2szVnhQdlh3RzEzbXdVV096a1F1TWRacTJQd2pNQVdJTG8rdXVraTVGRU5R?=
 =?utf-8?B?U1pRV0diNG1LMlFTWlJva25TeFJIQ2RKZmwrUitxM3l4YnZFQ2Z0SUlPY01x?=
 =?utf-8?B?Rk9uSU5uZjRSSzBka2JjUkRQODgzTkxEZGdqb1JQVk5nOHVlRnhwNVJsRTd2?=
 =?utf-8?B?SzN2TlBzYkJZVmtOTTZVNGMyZCtpQWNNNGJYR1NpeVNUY1NpR0gwVStDb1hS?=
 =?utf-8?B?bGIxMS9xUFRXMVJZbVV2UnZ4OEJZeG9heDlYQU9lZmdaZ0FxalBNelhUQmh5?=
 =?utf-8?B?N3oydm90ZzZFUTdtREl4VWhNUUpRVUtkVmw2TUM4ZjVCa01ReFl4UmFKb0hj?=
 =?utf-8?B?bC9senRFZU1LTWg5ZWJhaTduNWFLS3hmdzdObmt6SER6V05iU0IxbW9pYnpI?=
 =?utf-8?B?V3hGR3BET25lMmVkeVdDb3J6cjMvaW5OZXRNSllPbTVJMlBLNFB6aGNNbEtw?=
 =?utf-8?B?OTBIZjhZU1NKRVpIK241SE9zMjVscTJSV2RFM3M5Rk5QQlB3cXUvN2xCellF?=
 =?utf-8?B?T2NCTVNPbm1HaXl5WUlicTZ2bXZXdVRrU0hOWXdsMzByUXFWSWxNSkhPNjdq?=
 =?utf-8?B?RWJGdkw0ZzNKUVRaTW9vVDZIVHpLVUJnSDlpTG9HZ3kzd0cwZ1UzSUpMRUpp?=
 =?utf-8?B?eGFhLzZRc3AzUGFvTm5ZK0QvbUZJazhTd2pJQTZZdHpDZHV0UGtWY2ZOQXRa?=
 =?utf-8?B?Z1FtZ3RTa0dCU29JUHdxbzU5NTBUNVlLVXZUdHdZSDI4bHRVc3IvdGhUQ096?=
 =?utf-8?B?QXNyR3Z0aGdSVlJoNzVDSnkwVmVZMGhWNEJqL2JsbGxxZCt6cXhBM01xVWlF?=
 =?utf-8?B?WlJYRlpUTzFXTmRRK3RCWXFWZkZvVCsrZkJyTTUzRFBlTVpCVkU1V2JESDJR?=
 =?utf-8?Q?3wuYoZOYz2T6wPY+Avt7JEgbTeHIX72n?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1hVYzRIcGdJMDJwSTVNanFoOFArTmpRMVk3dDZRSUpJZzZFS2lQZ2Z3SmpZ?=
 =?utf-8?B?YVo4NFJDaUp1Sk1QQVlVNUJLT3VQazBGTEFzQS9yUUZQMTFqSXhSZVFEc3Vu?=
 =?utf-8?B?aDJKS1YzVlBrYUJ2NS9aSVBiSGFKcUhpZGpUc2RtKzdkclhIUldhbGlsYy9s?=
 =?utf-8?B?VzRabkErbEowdU5iZThQTXIyZ05nZFJqbVU2UjAyNlh3c0IxOG1EUk9QelFj?=
 =?utf-8?B?TXFRTTl5VUdYWCtwOTBRbko0cVE5ZWlHOUluVnU1T2ZXdS9iWWZFbndoTkpW?=
 =?utf-8?B?ZS9KZCtWZFVSLy9HekNQSkNHN1J4OFpiNFVNY0hkbHV0R045Z1RRZGlyV1pD?=
 =?utf-8?B?TXpkYks4U0V0QzhsTFhVdUs5OW15OE9XSU1HRWp0aU5rUEEwclpESnU0VVJY?=
 =?utf-8?B?ZkUrb0Fhb08zZ1VseWdmWWx5dkdJMGI5WlREeEZsYlNzN0pZa2R4VHFnT3ZY?=
 =?utf-8?B?aW9wM3ZGcGc4Yng4QTZnVEp6TFpBRDB1Szh5QnVwVzBHcUhJRTBhZjYxRHhu?=
 =?utf-8?B?QmVDR3BpaWFwb2c0ekNjTC9PN1F6MS9DdDZtR1kzZmQ4Y2hJekx2NS9VZnJN?=
 =?utf-8?B?OS9udFRRT0tkYUFVQzNnSnVJZW1CQlJMUUJ5QkpNT3R4S3ZselpMWUdKVVZP?=
 =?utf-8?B?WXVlaFgreDhQQUhtSHBxSWdFREhFajRrWW9sQTQwUGtxYlU1dlFFcEFxYnJR?=
 =?utf-8?B?TWRPWmNXSjNaSGQzWG8wdUhMV05wcmVpcjZsT1h3cVFnNmQyS2dLeUd4Z0VD?=
 =?utf-8?B?T204VlRhSzlobVBNcHB5bkdkRks1eWRCR0VmTTA0a2VpMmpYazB0WWJ6MXc3?=
 =?utf-8?B?K2RYaVJHTW16WnB4clRYNTJpVTd4RGx4SEZrbGN4b3gvYlFOclRTSWQ0ajJZ?=
 =?utf-8?B?YndaT1IyeGRja2IvRXVyVlVSVlRrYXdkeDBlSldWWStMYkRRdHgxcVUxMUEx?=
 =?utf-8?B?UFpXeTBFUG9tczRxZ1I5RWVLWEFRRW1KTGZXQmw2WTBqUkNINHVKbEtldk8x?=
 =?utf-8?B?WUoyUkF6cklUS2kramtkNEFEbUdWUGdqTm9jK3dCMk1WOXZjMDJQNk9rT0Y3?=
 =?utf-8?B?ZW1BU0gzTDFGbkpTbDRyT2NtZWx0c1YwVE43dHI2NnVieFlpYm9FYWsvTExQ?=
 =?utf-8?B?VlRmT2hHQXc3NWtrY2NXYkNnbGszRGl5VmFRQXVJRHdLK2g3RXFyZmVaYmlE?=
 =?utf-8?B?ZGhPUmw3OXpiakxNd01ON281T0FXZnhmSzZOVFY1QjdhYzJ5NE1IckJUdGVK?=
 =?utf-8?B?SnVjRXlma3pLZXdRUVdMMXRPMEVzT3VyTUh3VjJ1VHVuMjdJODNHbkdPZmpC?=
 =?utf-8?B?ZVhTV3ZjcjU4aGZhNVB1NFdubzczN21kQU5rbnhJUFJScGtLQnQ5R0txbURZ?=
 =?utf-8?B?Q0E0OHVaRWdydXdoelQ5ekMyV0w3aWl4Rktxd1FwRU5INmpQT2t1V1JvZXdy?=
 =?utf-8?B?a1djeUE5d3R3Mm5mOGNuYUNiLzJzT2hFR0VUWGJlZmdLS1ovaGlsbklFSm5a?=
 =?utf-8?B?Q0E5TlJYSzJQZDB3REdORkNNSjBUTjBPS2p6RkkzamNWVWhUR3JyaFlFOGVG?=
 =?utf-8?B?TWhMbWpVbEQ1eGkvc0o4R1poaXVjR1REYld1WmcvUXR5bmEzRGdPUmVYSGZO?=
 =?utf-8?B?blNJdlY3N2lXQ1VWd3Z2ZUFXdnMxNnZmL3NiSTlVTzBKSVk4TmNieFp1Rkw1?=
 =?utf-8?B?bVdhWXNkeEFaOFI2V25WOHdGeW9jbFJnMVpTUUJPNnNQamk3bjliVytFMFlX?=
 =?utf-8?B?NnJUTVFRN0dHL2w3YTNLeDBUTWtWWUZoTDZJMXNaVjRkWCtVZFpvS2pWUW8z?=
 =?utf-8?B?TmZyeVAweXBkdzYwS1RVc1pVMmNZczNLWGFkWWlZRDJOQ0RSdUMvcmhFMkNI?=
 =?utf-8?B?eVZKVzF4Q3lWUEVza1AxQjVkUWZJcVFHd2hHRFMzT2ZtMkw0SUlseTdWbFBz?=
 =?utf-8?B?Nm12UmVqeEEzR2dvU0pleWkySEg2cExOeHRJSHpKSGlKdFo5Rm5JbjNNWDZV?=
 =?utf-8?B?d1cvRzlDcFo3ZGJSNHYrbDBqQ2RGUVdrUUxmejQ0Z3FEL0VEc3ZZWlVPMkJD?=
 =?utf-8?B?dlFPdDJ5VUFKR1RQV0QySHhqTi95R3poN2E3K0xLR3loaVN4WExsTmtQOXFO?=
 =?utf-8?B?ZVh6eW80ampKazA0N3F0cVNYOGRySTlSNC9nRVdSakZGTWY3ZmhVbk9TZzNO?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34A6328830B2D94DB9416E95A389FAC6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47cdbba-3d14-41a9-4efb-08dd6df2c3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:19:18.6980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjs5udCk1Wb6jQL3NcHXgU8jMQd6pnZ3WI8vdqXfg6PvJR28dffYZsGcYunbxzt3BRmREt4z09/gBuzsojkmHc7tn0h0FC3VtqkAgcRyjmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7313

V2hpbGUgYnVpbGRpbmcgeGVuIHdpdGggR0NDIDE0LjIuMSB3aXRoICItZmNvbmRpdGlvbi1jb3Zl
cmFnZSIgb3B0aW9uLA0KdGhlIGNvbXBpbGVyIHByb2R1Y2VzIGEgZmFsc2UgcG9zaXRpdmUgd2Fy
bmluZzoNCg0KICBhcmNoL3g4Ni9pcnEuYzogSW4gZnVuY3Rpb24g4oCYY3JlYXRlX2lyceKAmToN
CiAgYXJjaC94ODYvaXJxLmM6MjgxOjExOiBlcnJvcjog4oCYZGVzY+KAmSBtYXkgYmUgdXNlZCB1
bmluaXRpYWxpemVkIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdDQogICAgMjgxIHwgICAg
IHJldCA9IGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KICAgICAgICB8ICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fg0KICBhcmNoL3g4Ni9pcnEuYzoyNjk6MjI6IG5vdGU6IOKAmGRl
c2PigJkgd2FzIGRlY2xhcmVkIGhlcmUNCiAgICAyNjkgfCAgICAgc3RydWN0IGlycV9kZXNjICpk
ZXNjOw0KICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn4NCiAgY2MxOiBhbGwgd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCiAgbWFrZVsyXTogKioqIFtSdWxlcy5tazoy
NTI6IGFyY2gveDg2L2lycS5vXSBFcnJvciAxDQoNClRoZSBzYW1lIGJlaGF2aW9yIGNhbiBiZSBv
YnNlcnZlZCB3aGVuIGJ1aWxkaW5nIFhlbiB3aXRoICItT2ciDQpvcHRpbWl6YXRpb24gbGV2ZWwu
IEZpeCB0aGlzIGJ5IHVzaW5nICJkbyB7IH0gd2hpbGUiIGxvb3AgaW5zdGVhZCBvZg0KImZvciIg
bG9vcC4NCg0KU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJj
aHVrQGVwYW0uY29tPg0KDQotLS0NCg0KQ2hhbmdlcyBpbiB2MjoNCg0KIC0gVXNlIGRvIHsgfSB3
aGlsZSBsb29wIGluc3RlYWQgb2YgaW5pdGlhbGl6aW5nIGRlc2Mgd2l0aCBOVUxMDQotLS0NCiB4
ZW4vYXJjaC94ODYvaXJxLmMgfCAxMCArKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9p
cnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KaW5kZXggZGQ4ZDkyMWYxOC4uMzIyNGFkYTg0NiAx
MDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KKysrIGIveGVuL2FyY2gveDg2L2lycS5j
DQpAQCAtMjY0LDE1ICsyNjQsMTkgQEAgdm9pZCBfX2luaXQgY2xlYXJfaXJxX3ZlY3RvcihpbnQg
aXJxKQ0KIA0KIGludCBjcmVhdGVfaXJxKG5vZGVpZF90IG5vZGUsIGJvb2wgZ3JhbnRfYWNjZXNz
KQ0KIHsNCi0gICAgaW50IGlycSwgcmV0Ow0KKyAgICBpbnQgcmV0Ow0KKyAgICBpbnQgaXJxID0g
bnJfaXJxc19nc2k7DQogICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYzsNCiANCi0gICAgZm9yIChp
cnEgPSBucl9pcnFzX2dzaTsgaXJxIDwgbnJfaXJxczsgaXJxKyspDQorICAgIGlmICggaXJxID49
IG5yX2lycXMgKQ0KKyAgICAgICAgcmV0dXJuIC1FTk9TUEM7DQorDQorICAgIGRvDQogICAgIHsN
CiAgICAgICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOw0KICAgICAgICAgaWYgKGNtcHhjaGco
JmRlc2MtPmFyY2gudXNlZCwgSVJRX1VOVVNFRCwgSVJRX1JFU0VSVkVEKSA9PSBJUlFfVU5VU0VE
KQ0KICAgICAgICAgICAgYnJlYWs7DQotICAgIH0NCisgICAgfSB3aGlsZSAoICsraXJxIDwgbnJf
aXJxcyApOw0KIA0KICAgICBpZiAoaXJxID49IG5yX2lycXMpDQogICAgICAgICAgcmV0dXJuIC1F
Tk9TUEM7DQotLSANCjIuNDguMQ0K

