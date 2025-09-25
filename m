Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DEFBA120D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 21:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130768.1470170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1rN8-0007Qr-H9; Thu, 25 Sep 2025 19:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130768.1470170; Thu, 25 Sep 2025 19:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1rN8-0007PN-EZ; Thu, 25 Sep 2025 19:11:18 +0000
Received: by outflank-mailman (input) for mailman id 1130768;
 Thu, 25 Sep 2025 19:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6d5F=4E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v1rN7-0007PH-AR
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 19:11:17 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6648e24a-9a43-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 21:11:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBAPR03MB6678.eurprd03.prod.outlook.com (2603:10a6:10:191::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 19:11:08 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 19:11:08 +0000
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
X-Inumbo-ID: 6648e24a-9a43-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH46NqBWLchb5Olav/R5+Le4KSBQltCq0SWpO85Mqn4l6WS+ZOoSd53FhlwfxJiFuOMsvVykiwD59td8awBTNc9hSZNWCCgdocVvkKJXQq2Jlg0+9vFgYwbqd3xHXWS0We2GNXpTb/0nP7i2vIs5RT8/MAvYrnUeLvyk1tRw86NbxDpRBKZbeqGK2VkqQDIwd+uRYG5abob5XiXkpIJK/kw/SkeRDj3DXMpzAkNpz6yBtcv+VYgXPneJwoGoGHkT3zr6C4A6vm0rkyCYeMSWBYCz+OK/4GCOPvdGYUl+fbap4WEPSyIlwIaXGlieE2ZCYJoK8v8JVIJDcOuBj45bGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lewHeEG9bcwJLUXMtZ+779xDAXJ2awm1T9kV5kQc5V0=;
 b=e8/yPYwceSLDauwq/dpgquOqddkcdswdusHNyQDy8cFgW1q8DffiRV0Tsql0Mjjyq7dfGH4/SH0jD+xmqfR6oMue6IuqpRsqsQA0YcmiD0r0dM6eG/s7EM/J31AK7KCDruXTY8gAxspUgimla/Ez3uAOSz+cLKTOcyHxH43NPBMM1IDxHlv1mBV4wgJQ+HYNzu6JM1NKPYjQcw4P5X5SCkci3s2XiMmMqt+sLduOtZZEPJzsQz61DcESZH0avDt+/t+x3R7+yZ3Ghkze9EOGYdDFFrvyX8FjUoEC7WhidOMyx4WloIAB7YAVLhOq2v0bbtDamcGV33n75khDEDn5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lewHeEG9bcwJLUXMtZ+779xDAXJ2awm1T9kV5kQc5V0=;
 b=CGmiWKcMJ2ZrdjIl3292OC+8w1nPFpm/pQDEkGZUXDfNLGZEr2OTXFR9kxcyWWF4rs2oegMnEuLnJyhe0VDn1RdwekH2DLfJr6PHLvI8yt4ROakCLsw6Yz4es3nKhzZaoOUIPj0zzBklgzWJRB3DfJHMuQer+SHGOgjX9XKpKB2hiWOfMQSeEJXtFcT3LDqGOug3U+e9OzwZtdrUZv04cTkU2OAyijoY/e2PgWZC52mJr3rXzacKlDRMHW4ncolSfTJmonI2fKEPBpQWu3Dbm8FDCXNCPtEiKhkAzNNSLcCTtxCp0vUus2e8KABoQNapf0cgCQUC5tXb1ns20yDtpQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcFRxkNZTwf+a94EKUOod0hf+3z7RzKlMAgDFLvoA=
Date: Thu, 25 Sep 2025 19:11:08 +0000
Message-ID: <278915c9-0049-4e25-90ab-9bb3da7ecee1@epam.com>
References:
 <859503540c6b7447f13365c2b70b386c2975edd0.1756056144.git.dmytro_prokopchuk1@epam.com>
 <21268b36-ca49-4628-835e-1708ad313946@suse.com>
In-Reply-To: <21268b36-ca49-4628-835e-1708ad313946@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBAPR03MB6678:EE_
x-ms-office365-filtering-correlation-id: 2add8418-72ac-4c5f-3a45-08ddfc67486c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFd6bjJJNzE4UlE3d3FuNVBab3ZueFZHdUVzOWd1bHZVbE9DaVhlS2R0UW9D?=
 =?utf-8?B?L1NVQTVPZERMWG9BQjJjTG9oR2NLUUFoNGJZUi9uWEZXeHZDZFRoMXdPaExn?=
 =?utf-8?B?QWJBN2RGZjgrTzFncGU5Yk9aTm5QUklYNHBuQnBBVkpGYnRNcVlXZGRlTnBh?=
 =?utf-8?B?aENPbG44R2RyNGRzMGtKOGE3MFRVdFNwMWVkc3QyKzhmZkJMZkkxTjZPa0x5?=
 =?utf-8?B?bkdJQkMrR21uYVp1M001S3pTYjgwT1FnVUFPbjdZMkxEK3pCUEdXNVpJMWNI?=
 =?utf-8?B?Y0twYm5wVlVJdXh5Ri9LMzJiaEJWdVZNL1NXV0ozeTNSSjd3RnpGa1dFK0NO?=
 =?utf-8?B?aU1GZmNrSXVTZStQRm9WWXB3d0hUVXZjZG1QdGd3WnZsSXBJUkhJUDk0Wnc4?=
 =?utf-8?B?Ky96ajJqclFOSjlKcmt1Q2hnbGxEYTVqeUU5T29IRVRhMlJiREd1VGZyT09p?=
 =?utf-8?B?VEhKeDZvbkU1Um9DM0gwdU1Cc0FKSlVYV29vQzczMjd3dElBZnJRNXcyMU9w?=
 =?utf-8?B?R1pxWTI4ay9jMWdiN1VMcHA5WE5NckNZT1NXSlFGd3g2WEowcGJCenRXQmts?=
 =?utf-8?B?OHJ3aUtPWGg5Nnd5dlhMaVAyUGQ0eUJCNS9QTHJlNUpXWFp4YVQvL2gvYitR?=
 =?utf-8?B?N05wREF5SUJqL3RsamY5MmVmL01PUU9QeVR5clM0WnUxemg5dk44dFJEWnJI?=
 =?utf-8?B?am9pYnI0aXZlcFZON1RvOHYzYUJ2L1h6aTZrUzJoUzUraXI0NWdWck5vYXRJ?=
 =?utf-8?B?cHg2aWhGUlMyN0x3b2ZyZW5kZ3pZUjlsaXoxcXVOMjBQTmxxby9nMHk5ZFM4?=
 =?utf-8?B?am5hM1hwZnlzdTBGcG0wdE9VUVRrRnBNQmxqSEk4ZW9FSXJEQTUrVjRqNDNw?=
 =?utf-8?B?VjdEK3p2REQxYWFQSWtMVjZLcXhaczR2RExKQ3RQYm9IM2RmYzJDUkphYmxJ?=
 =?utf-8?B?d3pGUENqS1V5Qjh2ZXl0ellpbml2L1VLR0hsUXlMSW5weU9oUENiTkRiYVZR?=
 =?utf-8?B?ZllITmxUVGIycFU1UWpORzJVZm1uMGtrTXFNTlFROVNvM3RHa3dYNk9Ra1Fj?=
 =?utf-8?B?SlkvaWkrNHkrdW9PSWtadVdxb25GdkM5dzNVS1g2emxJZ2NOVHdKMnJ5NXAw?=
 =?utf-8?B?R3h4MXA4WGFKVUtENWkybkZMNE8rZHVtUjBzMUd6RnBzRWVZWUpNcGcxZC9h?=
 =?utf-8?B?K01qOUxETzROWjZiZUxuS1NvRzN6NW5VeXYyZkpxT1BBWEZBUjdReXM3NnF3?=
 =?utf-8?B?N01KWnF3bkFpSDV1a1R3bWhVR1ZGNEc5MXg0SzdhZ0lyV3dab29PWldZM0Jk?=
 =?utf-8?B?bGpiWTA4VUZDNnhNYjVUbEErRlZpOC92RnRLZ2pYWGJ6ZjNCR1N1TXplZGhv?=
 =?utf-8?B?RTVQcGY3WmlleThINWJDTlZjOHZrKzhMTkxFNy95aDhDRlRIL1FKNmJVZmNE?=
 =?utf-8?B?Ni9Lc0hVb3RzVUVjbzhkcnBSbU5DbXcvSkNrMU9uRVpiTmtzVEdlRjZMOEZD?=
 =?utf-8?B?cURLQ29xS21tKzV2ekJ4R2FxTG1OZ09lTU94UFJwd0IzM0R3eTBsYlhxcVQ5?=
 =?utf-8?B?Mzh0SzgyQlQ2azlBYkNyT2JheWpwbFIyMDRBWXZSRXB5YVpYU2VJSHV4WjBT?=
 =?utf-8?B?Z0J3MEpnQUhKUVk4T2pEK2xBUzlMTWppY1ZHVWdVRXdGR0gwdkhjdTZQNWtV?=
 =?utf-8?B?ckdHVWx4Q2lKTmtGcnVURTBJak1WSFhTa2lsb2ZIK3U2eTFtSEFBVFZISFFX?=
 =?utf-8?B?eVpIbkJwYnJHWEtINVF6eVhsc3lWbWMvQUxTZTJtSjExMnltZ1BvL2l4MjJL?=
 =?utf-8?B?ekN6Q2o3SHhrUGZidWdaUlZjOTdNMHNMVmFUV28rZHFGZFdCWGF0T1A0aU44?=
 =?utf-8?B?d0JYQlJocytHNDE4ZW1IKys3Q3BZRVJjays0c0cwQWZyK0F3Z1VsYnBKUUZy?=
 =?utf-8?B?cVVnNGZ2d3pjR3paaUkxRXZBQUt6ZDBtUnhHcVpRcGdzWUZyUnEyRWlSTG1n?=
 =?utf-8?B?a1RKcjJ5NkVRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkRVajBNd3orSkdITmVSR3lPQ3QrL0d2VWRvd0N4a3NpdkkxMDVLdWUyQi9B?=
 =?utf-8?B?MlNXc3JoczNnV0t6Ym1SRzdOSWl5V1VueTJFWGJpd1lKMFNpRGxvODQ1S05D?=
 =?utf-8?B?aU1LQ3kzcmJ2YXZXOEk3N2ZiSDFzZ1lSbGhsNlB5NEROTmdHaHoyN2pQZFA2?=
 =?utf-8?B?eDdlTDVPRkR4a1kxamFiYzZCcWlSclZQcUVsZmduTGV2Z3plNHA4Zk5OK2Yy?=
 =?utf-8?B?a0lFVW9yVVB3YTQ1RWJ1UllhdVJ0SDZWYVROZ2o0dnJaUWpHS2dWZzM2VENy?=
 =?utf-8?B?U01TTVlmem9sUmtjVXYyVFQ4WGs0MTZTVVM5VndCVmpmYytxUjdBenZGaWcx?=
 =?utf-8?B?ak5KUmljYTQxR1JlUmZpMlB3dFc0TGZtSGNtQm5wYWM5aFVOK3lWeHhuZWtN?=
 =?utf-8?B?WXo4cmxRTlE1UUp2Y0t2MDNjbmZCb3I3TVZFV1EwQXBZSm9jR3RTUlhjS0NL?=
 =?utf-8?B?Qm5wSUQ3VFc5cC9lZ0VWL2EzdldqaDJmZUtGYUpnMmVxY1crL0pBZFRlVVhp?=
 =?utf-8?B?c1VGWUpHTUJONnFpZHBOazVnbXE5VWs2cFM3ZnZwTW9Zc0hnUVNic2JkQzRz?=
 =?utf-8?B?bGViclRpRlNkT2pyRkZMYUVQZkowZzlMNkVDOFJwUkdhalJVYVhVWXlyQ2Y3?=
 =?utf-8?B?M3VreG5lZHhIZnU2MlVBdjVGQXZobzliY2xkM2lQdk5nQkc0UzFSQzQ4K2Rh?=
 =?utf-8?B?bGRKc0RHQm4vRE9reHNqSzByNEVGUHBmQzR4aVArL052WEFLTTlwQU9NWlk0?=
 =?utf-8?B?MVRWbnBvTFhvdFRNSC8yMTN6b1kyQlMxak9EVzdQejMrOTVQOVE2dDd4MXBM?=
 =?utf-8?B?bE50K0F5L29LOUFOUUJEQ21mYlBQVnpRa1lMU24wZTZtOXRndnFlQ0dCMlEz?=
 =?utf-8?B?SVkrZHQ4T2J0cDVLTExDS2Q1SWJEL1dxR3pKSmdURWZ3UmZLZHZOU3ZHOEN0?=
 =?utf-8?B?VEtVYytiQmN6TzY5K0FLWkNtcnVPNlVuVkNrZG1MUXcvMW1XU0kvMFVBUFpa?=
 =?utf-8?B?QnJYQnE2cXRFVFRocmlwcldENTlDaEFVK0xGejA0K0dnTmkxb1BFRnZYNjdl?=
 =?utf-8?B?bnNORVlvZC8vNG1YRUtEUGxBdmZZNXpOUlcxTEE4VE5BV0NVVnMxbEMyOGJM?=
 =?utf-8?B?VXBmMHBudDU4ZFg1NTJuSk16UXMzL2VqVlFNd3Q5NHFLOGNKQnBuVzhjTVFm?=
 =?utf-8?B?VVdVZExkVkRUSHN2MC9iZFhQY0hPNDV5Z1dYOFBzbFBwTHUrZmpOSXRKczdr?=
 =?utf-8?B?TjFRNlZOYWMzdE1yN1BGa2VhY2NvcDJIamF3c3c1aWQzV2V0ZWdvNWErTEVx?=
 =?utf-8?B?YWwyWU8xblk2U0dUVzAvb04ybEptaDVwS1MxSytRRlNDSWl5T2xLemtZOWpC?=
 =?utf-8?B?d1NCMUlaNldraTJub3BoOE1NbGFCOUpTSDdGOVF5aURGdHlHVHJObWFGUUkv?=
 =?utf-8?B?YmovaGRLWGVyUGpBeU9LODV1R25SOVhDMFFIczdTY0pmbENZNUhqSWhzTGlE?=
 =?utf-8?B?SXlvSkVGSmJpZ3pKbkY1RkRlc0FKR1ZHVlhCWUc2UGs3alIzS0plb3l1WUVq?=
 =?utf-8?B?M3pzSUxYa3Z5bEFOZHV3N3F6MWJiaEtMcDI4UnVIdkVRV0tCREpnS1hQcHY4?=
 =?utf-8?B?K1lQeTZ5NEgvZVFnN0laK3FtUDRpdmFhWm9pVVRUS2oyYkpaVEo1MUZ2dG9a?=
 =?utf-8?B?ZGdZTVRNVFAzWkhnYnVmU0Y0WU11RFlKaWZHeWhBaXdYcUpoNWdoTEI4bEZB?=
 =?utf-8?B?ckpUSGYvWDZvYXAxckVwTmx1b3oyZUVmaDhKbW9qendQdTJaK2RNU0UrWDA3?=
 =?utf-8?B?VGV6SkhycEVlRkxPS2c0SEFFaEV5VURFa25DSHRKeUF0R1pwOFh4c1lhRmJK?=
 =?utf-8?B?UTYxcnFWc1RKQWRPbXpVWWdwT2RaNFBBN1Z1QitaL241RzZ6bHV3RkViTmVo?=
 =?utf-8?B?cGY3SFNuRUdIWmhURHVLWHVRR2hPR0hDREU0bUE3YldiVi9kZDNuaE1pbkJ0?=
 =?utf-8?B?ZWJQMVpLd1lMSVU4cDlvVjJ2OXp6M3Uyb3JYK1d0TEZuR2g0emN0aDZhMGp6?=
 =?utf-8?B?eFVqZ2U3TkJhYzhielZvTHNHQ05YY2lxR2ZpT2EzRWJNbjRGT3lIcnFlanNI?=
 =?utf-8?B?dGhBUEM5azRWY0V0ZHRUcmZaYW9lRUdQYkxHc2J0QmJJb2g1RVNTcVlPMjd4?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D74CE083A2A054891536B0725962970@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2add8418-72ac-4c5f-3a45-08ddfc67486c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 19:11:08.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxBFqDvniiIgphgbGWx8SLFZWn13+HpnlDigIjCaaIsQfuaBBtl8I4J0fTIfvENVUe/z6YcCvXLmxOn4WR/LGppHzQFCGTVnucBiquCR+O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6678

DQoNCk9uIDgvMjUvMjUgMTM6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDI1
IDE5OjI3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMTEuMyBz
dGF0ZXM6ICJBIGNhc3Qgc2hhbGwgbm90IGJlIHBlcmZvcm1lZCBiZXR3ZWVuIGEgcG9pbnRlcg0K
Pj4gdG8gb2JqZWN0IHR5cGUgYW5kIGEgcG9pbnRlciB0byBhIGRpZmZlcmVudCBvYmplY3QgdHlw
ZS4iDQo+Pg0KPj4gVmlvbGF0aW9ucyBvZiB0aGlzIHJ1bGUgYXJpc2UgZHVlIHRvIHRoZSAnY29u
dGFpbmVyX29mKCknIG1hY3JvLCB3aGljaCBjYXN0cw0KPj4gYSBtZW1iZXIgb2YgYSBzdHJ1Y3R1
cmUgdG8gaXRzIGNvbnRhaW5pbmcgc3RydWN0dXJlOg0KPj4gICAgICBjb250YWluZXJfb2YocHRy
LCB0eXBlLCBtZW1iZXIpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiAgICAg
ICAgICAgICB0eXBlb2ZfZmllbGQodHlwZSwgbWVtYmVyKSAqX19tcHRyID0gKHB0cik7ICAgICAg
ICAgICAgIFwNCj4+ICAgICAgICAgICAgICh0eXBlICopKCAoY2hhciAqKV9fbXB0ciAtIG9mZnNl
dG9mKHR5cGUsbWVtYmVyKSApO30pDQo+Pg0KPj4gVGhlICdjb250YWluZXJfb2YoKScgbWFjcm8g
aXMgc2FmZSBiZWNhdXNlIGl0IHJlbGllcyBvbiB0aGUgc3RhbmRhcmRpemVkIGFuZA0KPj4gd2Vs
bC1kZWZpbmVkICdvZmZzZXRvZigpJyBtYWNybyB0byBjYWxjdWxhdGUgdGhlIG1lbW9yeSBhZGRy
ZXNzIG9mIHRoZQ0KPj4gY29udGFpbmluZyBzdHJ1Y3R1cmUsIHdoaWxlIGFzc3VtaW5nIHByb3Bl
ciBhbGlnbm1lbnQgYW5kIGVuc3VyaW5nIG5vDQo+PiB1bmRlZmluZWQgYmVoYXZpb3IsIHByb3Zp
ZGVkIHRoYXQgdGhlIGlucHV0IHBvaW50ZXIgaXMgdmFsaWQgYW5kIHBvaW50cyB0bw0KPj4gdGhl
IHNwZWNpZmllZCBtZW1iZXIuDQo+IA0KPiBJIG1heSBoYXZlIHNhaWQgc28gYmVmb3JlOiBUaGlz
IGFsbCByZWFkcyBva2F5IHRvIG1lLCBqdXN0IHRoYXQgSSdtIHVuc3VyZQ0KPiBpdCB3b3VsZCBh
Y3R1YWxseSBiZSBjb252aW5jaW5nIHRvIGFuIGFzc2Vzc29yLiBUaGUgInByb3ZpZGVkIHRoYXQg
Li4uIiBpcw0KPiBhIHByZXR0eSBzdHJvbmcgcmVxdWlyZW1lbnQsIHdoaWNoIGlzbid0IG92ZXJs
eSBoYXJkIHRvIGdldCB3cm9uZy4gU3RlZmFubywNCj4gTmljb2xhIC0gd2hhdCdzIHlvdXIgdGFr
ZSBoZXJlPw0KPiANCj4gSmFuDQoNClN0ZWZhbm8sIE5pY29sYSwNCg0KZ2VudGxlIHJlbWluZGVy
Lg0KDQpEbXl0cm8u

