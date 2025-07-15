Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ADDB0577A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043962.1414016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcZM-00073m-Bf; Tue, 15 Jul 2025 10:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043962.1414016; Tue, 15 Jul 2025 10:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcZM-000716-8H; Tue, 15 Jul 2025 10:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1043962;
 Tue, 15 Jul 2025 10:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXV7=Z4=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubcZL-000710-EE
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:07:27 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8207b9c4-6163-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 12:07:26 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9167.eurprd03.prod.outlook.com (2603:10a6:20b:5c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 10:07:23 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Tue, 15 Jul 2025
 10:07:23 +0000
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
X-Inumbo-ID: 8207b9c4-6163-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAm1ozSXNaaZCyQ9LygNsUCZRzy1WW6t6Rtltdfe3lxKnNSXEbWIYsowrKlBIpf2WWAJMMwfLEwNdm/4PxMMtVBbM8vyN5STFMxdgiRueBZXhtnfN4lyuG+2YmlWyhGISJndlv7OgJAzWBGbdD5JSuFuNZtmQgEAOaEKfLGvJRbuUe63HCLVZeFmxUpr1O247NMEEkJoaPyvqGRjg6sVGPpL7eA1lA8ao6Z4k3ZLmv7QH1U7y+IEd5Cyg3HnjA4GN49XQ9QEHMA094S5h/hKngDfoig2G/xk9Kp9MBJVVwdPlVTyMCI0Jnw3nyiKrEL5dilDFZcyIrP2ZQ2/ZbVmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di9lblRq/TwhZNamXKxhsQghAK2qJd2XP5PvhRbUONs=;
 b=l7vinTiR3wUjE3rijbiQ1iD5ogwVwwenK2df/eq5BS4QCLq5n86QDFMb0CK3tVI4i0ntE5FFx1ct4WHbiiuxE8ctUC8K/VIfgAPoPr7seAyGMuydz8SoQXH1TThKb3iiLdsRT0Jl/BLZsZzjyROKSY9kQCYBr0MqgTxUuLjt3OuqW9Itr23vlv9un70JD+Ovcb5uOevhBHtCp5mVIe1pFWY1F1edLCy8Ow7a9Hlyasco+J3fkQNrDXZQiMnQn81JNh9ZZjgy9zq2BcYJ/1WreKMPuW6LHQ4x/nr7jfgexBcDTejBGWuyi1gylx+Dw7+14kDfuP07zE4YGwqV/bRejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di9lblRq/TwhZNamXKxhsQghAK2qJd2XP5PvhRbUONs=;
 b=rlivW38Fu6nPqFGbBpmZW9cgT9/G7O5Sj5p5W31PNddh7oOx41a3gJvSOEGM+1cs81T2cbkbNhVJ1qfsKH/sNs5TcrMW/G6ccYpKB92PivNyoMCFuzZr+9xaEjOiKj9TS0PmuATuOCFuUJ6l7AqF9wOlSJRC7TXdlTtjv99UZchfcYEcduTeZWEGLB1cvq2s444SeYARoHGo0TR1J6958ueIjPWsn8tHqqghBf4jrTB/iUIm4Q+B9N+hxQ1IvVJ7yUfzumGrZtf+r3ScONqNGdCbTruCCBLia96ayqv/7ppwk+/cFQbKpVtTE3+99SNf9SYRVIxOFn+iU2DfvScywg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index:
 AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQ7QsmXCAgAEYpgCAA5T3AIABsXIAgAAERYCAAAGLAA==
Date: Tue, 15 Jul 2025 10:07:23 +0000
Message-ID: <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
In-Reply-To: <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9167:EE_
x-ms-office365-filtering-correlation-id: 0ddcec20-6ac9-496c-2b10-08ddc38764b3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXJtekNoUmRybkI4RER0NTlXbXpFNjdHWldtNDRhdDNWUzhqTkhON2Z3SmE3?=
 =?utf-8?B?S2tOaUtQUEcyUjZPMC9aUkRZeEgzRVhEN29mTFpoR0pMUDhxTEhvWDJYTlFh?=
 =?utf-8?B?T3ZTMjl6ZlRQSnNUenVoMHUwMmpwZGo1RmpBM3VMbWtJeDhiY2ZUOTM2aE1v?=
 =?utf-8?B?M3BGTnB3Q0NibTFpeHd5Vm9pOTM5WFlwM0w3MUMzK3BEcGEvTXVQc0RYeVMy?=
 =?utf-8?B?OWdpRExZSm4xTXQvcmJ3V1VvVkZXYk5VN2ExdGNORXNKMkZGb21xZHJ1aFJw?=
 =?utf-8?B?QVhQK2NJbkJIeWFNRlNqUkhJaytXQzhuM3pDQWlER2IwbkQwR2JNRkZwQ2Fn?=
 =?utf-8?B?dGdjK3cwTDJiVHF3T3lhNi93R0twY2tHeGJMWEY3aVFQa2ZzRGptQ0NaemE1?=
 =?utf-8?B?N1hFWEdnYXYyazJEckp3K3c3UWcxZXJuQXJyamEyVDNLTlVsd0psbnpQZHk5?=
 =?utf-8?B?VGhQR2tHbFFmTU91Q2xaSGk1Q3dVQlhuR2xXdUxBRDVpVmZVTkxnM2src1o3?=
 =?utf-8?B?Y2gvR2dCUWZ5c2FNTkg0Sm9Xd3YvRTVkSzNrVVhNbm1aaHdIVUdVSDk5aURJ?=
 =?utf-8?B?aHE5VWhNdXgreldhRUZmWkNWbUJyWXZMZlBMWVBQa2xwR0xHUCtYamFBOFN6?=
 =?utf-8?B?azJ2RC9hcHkrQXhwd1ArRmZ6SGdxMEFLM040b3ovY2tyVklSUXgxa0hRU0FC?=
 =?utf-8?B?Mzh1cFhYa0k1N2FYUGlUekdIb1hWbDBXaXE4Q0V2bkVOMjJMZHl2WWZrQ3ZQ?=
 =?utf-8?B?QjBaT3JVZFVsYnRZTWVmR2k4bFpPcHZ1S2JOREdzKzByRTVESk9XZW9zUzIv?=
 =?utf-8?B?dFRiQ1VSdjJqMWE4bllhWjErbzZDSTE3dC9Fem96WUhTaUxpNFFqZkJqUFBS?=
 =?utf-8?B?RTAxc29DdHRmV21GOEd5ZFlDY2pBUXRwaW9mYjdNWDFwZnJOS0xoUi9EMjJT?=
 =?utf-8?B?cjUzSDMzbUIvV2YxTVh0RGlKWElLeXI4LzNaNzZOY1UzRS8vTmIrVWhjVGNN?=
 =?utf-8?B?VjhaU0loMDJLeXA1ZlhGcHQ5dmd6eGtjNDJyd0psOUh6YWpVd1NRVkpPMFVQ?=
 =?utf-8?B?cGxFWk0rV1lPVXpadmlaVXVXUXJER3h6KzkrOHkvTHArUVJVdkorMWtlaEor?=
 =?utf-8?B?T2xEaWxLMm5tVUpDYWlnSVNIUENQS3lKbGMxbHlOYVBQcHludEg4dHJSMFBn?=
 =?utf-8?B?VGVPNXdOaTFFQnlCK0VraXNwQy82a1FNNjdmVW9lTkpqei90eFFGQm0vUC9Z?=
 =?utf-8?B?TjIxaytwbTZYcWdZWlRGSjNSM2wzaVFkMyt6SkY3UDBLYW1UTjdVSDhsRC9S?=
 =?utf-8?B?RUdIK2lLdytnUFJBOEhoSDlITDhnMVJhVXQvMHEwcDh0QUpQM09mRGpLYjJQ?=
 =?utf-8?B?QlBCVEpMMisraFI3eTVoUW83VXF0VVdmemowTlBsWElCTEwyYVRRSnNEZkxl?=
 =?utf-8?B?clZyQjVHbllRcjZ2SzYrLzdmQzVjUE9zSW13YW9LNkJoYTJuRzhSTDc3M1NR?=
 =?utf-8?B?ZVlvbjNiR0ZnRUlIVjJHNnlOdTNKMUY3VWVhSm8rSFdpQjJhcU5qbzBuVnd5?=
 =?utf-8?B?VmgwZlNCQVdZSlE4L2hYc00wamgzYW9mVnF5TzVWSm1LOHdtWmN0Sk1VVThG?=
 =?utf-8?B?YzdzSHoxT0owdlRRVWFEVzhiSzdEeFlSbmJLcEcwRGpDUWpFUk9IQm0zcVNC?=
 =?utf-8?B?M0dvSnQ1OG1EeDJJeDVpR2xPYVFaQit3NXNHaGN3RSt4dHlRQ3o2M2lIZHNC?=
 =?utf-8?B?NHhJLyt1ZWxYQk0xb0x2cDJyOVNQMzFrTHJ3RlV3N2F4YjA5ZnpwZndwVXVB?=
 =?utf-8?B?NWF2TzJEZzlhSHlHTUlUQW1xbk1yS0tiQVVoZTYweGxhQUwzcFpLZXhKbExo?=
 =?utf-8?B?cEdIenFuRWo3Znl5VUNPUEpwMVBkL3lFMXVCSS9JdGU2OFFRMERBUjRWT25q?=
 =?utf-8?B?UTRISHVadUVKYzJEQWlXZnp5OWwvaFdLdDhUN2E1ZWNTTmJpdU5vN1kyb0p0?=
 =?utf-8?B?aCszYUdqUXFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE05K3JGTGZGN2JMMnVUdXkvanpBbFpJN1p6cUZUYndSY05QckhrRFdvNFEw?=
 =?utf-8?B?UUQ5WW8ySDlkNlFsekRUUHl3M3dVSWlON0xGTDZVTVhSdk4xMjlIRHJkK2Jz?=
 =?utf-8?B?WGJNN29Wa0VkL1ZxZFRDckpSL0xKc1R6YmVLUlRkZTFERm9sRXFYUVJTMlUy?=
 =?utf-8?B?eW43YXk1R29YbUJQUWJyV1lJa05hWmJ5NC90bkd4NEJoN3R2NXl3LytMd21L?=
 =?utf-8?B?allUdGEraFR5YUVQZEMxVnNIb3RTcGloSTdpTCtsODE3WC9kYUg4cFdmTWtU?=
 =?utf-8?B?MkRFZ1JJSlZ1b2tJUUZFZ1R2M3JCYTRDRFpSbGVRWDJqa2FFUnNIQWdBYjZ0?=
 =?utf-8?B?V09WOTJUZm44SmJvaGh0WHREOHVqZ054QlpPM1ZqTG1lWWw1djhzQWVoRGpR?=
 =?utf-8?B?cFozbDVQWUxuanhSaDljZk5JazZJazFObGZ0b05PaDdGRlByVjQzb1BvdHZm?=
 =?utf-8?B?a01YN3JFM2lPNnZoQWxNajZOQUxPQkZXbHJINmlGTUV6ZHduMWJ6Q1FKK2Rz?=
 =?utf-8?B?b1BEbkdZVHgvbmsvcFUxci96d2RTYzVneUFhRmRCSUdwZDNEWGpxTUxlYlg0?=
 =?utf-8?B?Q1JaOWw1VmI4WDNqNzdwM3FUSitRZ3ZDSTdiTktETkl4OUM2alhCNGkyZXBx?=
 =?utf-8?B?S2RqY0F4WG41Q256b3JTRVVRK083MHVuQmlSbW40VDdMSUtYVklPSHlWRGVw?=
 =?utf-8?B?ZmRIbGdjRjJydm5IWUJWUVR1YUs1cjRQa0l5QWhuNjM1QUFwaU1SU0ZyTkZR?=
 =?utf-8?B?VGNid2VHZzlxYTZHMXlrV0d1WXNmbDl3UDVPZFJUaHB3bUc1c3JYNTRjM25G?=
 =?utf-8?B?b3RIM1M2ei9JeUgwd2R3b1lJSG53MTEyVHgwZExlTGk3WXByQjIwTndzY0pl?=
 =?utf-8?B?WW5TanYwRkNaVW9WZG9wUG5YTmhoQWQybXVJaVR3dWpmQTQzTVJHSyswTjRQ?=
 =?utf-8?B?VDc0V3lsU2hzVGwxY2lob3Rpc2h6bE1CUE94cStEaUlwa0JCZEFzRHJHSUxS?=
 =?utf-8?B?SFJyS0YrS2hTRUtOa2xtcFBGN3dOUWNjbVRJd2FBOU44aDRpS1AzZlhVQ0Nt?=
 =?utf-8?B?VFhCMnBsTTAwQzRaQ290TWhrb2NRdTRNY2w0VE5hVmxvemRXTU53bU5sWWFW?=
 =?utf-8?B?ZXZJMkxaZG5mUEF5QXhBVWJOTEV3eGVnTy9oWXExWTVGMVplTkJ5QUg2K0ZW?=
 =?utf-8?B?dEZyaFJOb3RiZG51YWsySlNpalBmRTFOekJJQWxXTklkWU5zR0hxc2ZDV09j?=
 =?utf-8?B?M2k5dG0xSEtUYXN6a1VmMjdPRXhNYUtrajYya0ZjV3c1YnFJaXdERyticUZv?=
 =?utf-8?B?UElDWnA4cEt4bFZLY3lHTFk1b04rQnFXOElHd2Yyc3ZmYWdVWFZQc2dVK1NL?=
 =?utf-8?B?cTJ4TWdLNjc0UzhqNWN6T1A2aUJnZlcvS1RaT05HTVVKL2lMU2ExdXVpVFMr?=
 =?utf-8?B?VWRUQ2FKVGhEMXFHR21sSkFvYnVqR2Rac1A1eWlrN2lBUnozYytIQWcvMlpq?=
 =?utf-8?B?ZkFjTlNqR1V3UjNSU3dueVVhSEZ5OC9jc29pMDNPdDZLOE1KQVJCVjEzaWxV?=
 =?utf-8?B?RlM1bzUrR3l4V3ZkRFlxNEFPS3M4WHpOeXJzR3NyOFdmQXlKSEYwcTg1ZGpR?=
 =?utf-8?B?TWt2SnNabmxDeS82ZEg5S0wwYXRnYi9rblpVY2FudUFxL3JzT0k1Yit6b2hY?=
 =?utf-8?B?cDh0Z21PL01uTWN6dXczcHdWaUhFQlFCTDhvaDllZHpLVm44UTNuVmxDZW1Q?=
 =?utf-8?B?L0RoZkhzUDZUY2ZpZE1iSDA4ZW5VSWYxWE1Jc0xXc2lqZENBSEIwR2FRMW45?=
 =?utf-8?B?TDk3YUI3bkQrWHNSNnV0UnNUalR1NGUvbkFZMkt4bTlDa2Zhb3E4V3laclZQ?=
 =?utf-8?B?Q3BrYjZPbWJDSnFZNkxUVFJrSHlqTHFvYWQ4Q1BFVWJUSkxUQ0NCQnpKWHMv?=
 =?utf-8?B?QkhxS2tibGtRMDQ4aEZWSDZHRVJ6NXVENDJXekRTUTltdlc2RUNWdzdlSkF3?=
 =?utf-8?B?ZHpNeTNJL3Z6YXR2bUxoVWd6cjBqRkRFWlhtd0xHQ2dRa084M216M0FWRUxl?=
 =?utf-8?B?MUkycENXSXJ4eUZvRVUwbWNNUlpyd2MvenFXdnFYWjFYRlAyRG8vcm55SHAy?=
 =?utf-8?B?K1RDeFJFZ3VJTnljK2RrQm96aXFsNEVuWEJBZFVPOHlLcDFoWUgvWXJ5USs2?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E11E239FF10F04BACE8DAEB980AF85F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddcec20-6ac9-496c-2b10-08ddc38764b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 10:07:23.3903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJn8/ff1h4kxarOwUY2yz4olxI/2iYcSLzdLZmiiyQoAAoGnTdA4RMYECZ5L343YZZ2ijTuMJLK8jLFSCTcqFxp0+Uz3ICnot6GDopsP95s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9167

QVJNIG9ubHkgYXJlOg0KLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAN
CiJhbnlfYXJlYShhbGxfbG9jKGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9iaXRvcHNcXC5oJCkpKSJ9
DQotY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsIA0KImFsbF9hcmVhKGRl
Y2wobmFtZShwYXJzZV9nbnR0YWJfbGltaXQpKXx8bWFjcm8obmFtZShwYXJzZV9nbnR0YWJfbGlt
aXQpKSkifQ0KLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCANCiJhbGxf
YXJlYShkZWNsKG5hbWUodXBkYXRlX2dudHRhYl9wYXIpKXx8bWFjcm8obmFtZSh1cGRhdGVfZ250
dGFiX3BhcikpKSJ9DQotY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsIA0K
ImFsbF9hcmVhKGRlY2wobmFtZShwaXJxX2NsZWFudXBfY2hlY2spKXx8bWFjcm8obmFtZShwaXJx
X2NsZWFudXBfY2hlY2spKSkifQ0KDQpEbXl0cm8uDQoNCk9uIDcvMTUvMjUgMTM6MDEsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wNy4yMDI1IDExOjQ2LCBEbXl0cm8gUHJva29wY2h1azEg
d3JvdGU6DQo+PiBDb3VsZCB3ZSBwcm9jZWVkIHdpdGggQVJNIGRldmlhdGlvbnMgb25seSBzbyBm
YXI/DQo+PiBJIHVuZGVyc3RhbmQgU3RlZmFubydzIHByZWZlcmVuY2VzLCBidXQgaXQgY2FuIHVu
YmxvY2sgbWUgdG8gYWRkcmVzcw0KPj4gbmV4dCBBUk0gdmlvbGF0aW9ucy4NCj4gDQo+IEhtbSwg
Li4uDQo+IA0KPj4gT24gNy8xNC8yNSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24g
MTIuMDcuMjAyNSAwMzoxMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBGcmks
IDExIEp1bCAyMDI1LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+Pj4+IE9uIDIwMjUtMDctMDkg
MjM6MzgsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4+PiBNSVNSQSBDIFJ1bGUgNS41
IHN0YXRlcyB0aGF0OiAiSWRlbnRpZmllcnMgc2hhbGwNCj4+Pj4+PiBiZSBkaXN0aW5jdCBmcm9t
IG1hY3JvIG5hbWVzIi4NCj4+Pj4+Pg0KPj4+Pj4+IFVwZGF0ZSBFQ0xBSVIgY29uZmlndXJhdGlv
biB0byBkZXZpYXRlOg0KPj4+Pj4+IC0gY2xhc2hlcyBpbiAneGVuL2luY2x1ZGUveGVuL2JpdG9w
cy5oJzsNCj4+Pj4+PiAtIGNsYXNoZXMgaW4gJ3hlbi9pbmNsdWRlL3hlbi9pcnEuaCc7DQo+Pj4+
Pj4gLSBjbGFzaGVzIGluICd4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMnLg0KPj4+Pj4+DQo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBl
cGFtLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgfCA4ICsrKysrKysrDQo+Pj4+Pj4gICAgZG9jcy9taXNy
YS9kZXZpYXRpb25zLnJzdCAgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrKysrKw0KPj4+
Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+DQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25z
LmVjbA0KPj4+Pj4+IGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlv
bnMuZWNsDQo+Pj4+Pj4gaW5kZXggZThmNTEzZmJjNS4uYTVkN2IwMDA5NCAxMDA2NDQNCj4+Pj4+
PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wN
Cj4+Pj4+PiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wNCj4+Pj4+PiBAQCAtMTE3LDYgKzExNywxNCBAQCBpdCBkZWZpbmVzIHdvdWxkIChpbiB0
aGUgY29tbW9uIGNhc2UpIGJlIGFscmVhZHkNCj4+Pj4+PiBkZWZpbmVkLiBQZWVyIHJldmlld2Vk
IGJ5IHRoZSBjDQo+Pj4+Pj4gICAgLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVy
YXRlLA0KPj4+Pj4+ICJhbnlfYXJlYShkZWNsKGtpbmQoZnVuY3Rpb24pKXx8YW55X2xvYyhtYWNy
byhuYW1lKG1lbWNweXx8bWVtc2V0fHxtZW1tb3ZlKSkpKSYmYW55X2FyZWEoYW55X2xvYyhmaWxl
KF54ZW4vY29tbW9uL2xpYmVsZi9saWJlbGYtcHJpdmF0ZVxcLmgkKSkpIn0NCj4+Pj4+PiAgICAt
ZG9jX2VuZA0KPj4+Pj4+DQo+Pj4+Pj4gKy1kb2NfYmVnaW49IkNsYXNoZXMgYmV0d2VlbiBmdW5j
dGlvbiBuYW1lcyBhbmQgbWFjcm9zIGFyZSBkZWxpYmVyYXRlIGZvcg0KPj4+Pj4+IGJpdG9wcyBm
dW5jdGlvbnMsIHBpcnFfY2xlYW51cF9jaGVjaywgdXBkYXRlX2dudHRhYl9wYXIgYW5kDQo+Pj4+
Pj4gcGFyc2VfZ250dGFiX2xpbWl0IGZ1bmN0aW9ucw0KPj4+Pj4+ICthbmQgbmVlZGVkIHRvIGhh
dmUgYSBmdW5jdGlvbi1saWtlIG1hY3JvIHRoYXQgYWN0cyBhcyBhIHdyYXBwZXIgZm9yIHRoZQ0K
Pj4+Pj4+IGZ1bmN0aW9uIHRvIGJlIGNhbGxlZC4gQmVmb3JlIGNhbGxpbmcgdGhlIGZ1bmN0aW9u
LA0KPj4+Pj4+ICt0aGUgbWFjcm8gYWRkcyBhZGRpdGlvbmFsIGNoZWNrcyBvciBhZGp1c3RzIHRo
ZSBudW1iZXIgb2YgcGFyYW1ldGVycw0KPj4+Pj4+IGRlcGVuZGluZyBvbiB0aGUgY29uZmlndXJh
dGlvbi4iDQo+Pj4+Pj4gKy1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwN
Cj4+Pj4+PiAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwu
aCQpKSkifQ0KPj4+Pj4NCj4+Pj4+IEJpdG9wcyB2aW9sYXRpb25zIGFyZSBub3QgaW5zaWRlICJ4
ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgiLCBidXQgcmF0aGVyDQo+Pj4+PiAieGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2JpdG9wcy5oIg0KPj4+Pj4NCj4+Pj4+PiArLWNvbmZpZz1NQzNBMi5SNS41
LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4+Pj4+ICJhbnlfYXJlYShhbGxfbG9jKGZpbGUoXnhl
bi9pbmNsdWRlL3hlbi9pcnFcXC5oJCkpJiZjb250ZXh0KG5hbWUocGlycV9jbGVhbnVwX2NoZWNr
KSYma2luZChmdW5jdGlvbikpKSJ9DQo+Pj4+Pg0KPj4+Pj4gSSB3b3VsZCByYXRoZXIgZG8gKHVu
dGVzdGVkKQ0KPj4+Pj4NCj4+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJl
cmF0ZSwNCj4+Pj4+ICJhbGxfYXJlYShkZWNsKG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSl8fG1h
Y3JvKG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSkpIn0NCj4+Pj4+DQo+Pj4+Pj4gKy1jb25maWc9
TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+Pj4+PiAiYW55X2FyZWEoYWxsX2xv
YyhmaWxlKF54ZW4vY29tbW9uL2dyYW50X3RhYmxlXFwuYyQpKSYmY29udGV4dChuYW1lKHVwZGF0
ZV9nbnR0YWJfcGFyfHxwYXJzZV9nbnR0YWJfbGltaXQpJiZraW5kKGZ1bmN0aW9uKSkpIn0NCj4+
Pj4+PiArLWRvY19lbmQNCj4+Pj4+PiArDQo+Pj4+Pg0KPj4+Pj4gc2FtZSBhcyBhYm92ZQ0KPj4+
Pj4NCj4+Pj4NCj4+Pj4gVGhhbmtzIE5pY29sYSEgVGhlIGZvbGxvd2luZyBkZXZpYXRpb25zIGFy
ZSBlbm91Z2ggYW5kIHN1ZmZpY2llbnQgdG8NCj4+Pj4gemVybyB2aW9sYXRpb25zIG9uIGJvdGgg
QVJNIGFuZCB4ODY6DQo+Pj4+DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVs
aWJlcmF0ZSwgImFueV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUveGVuL2JpdG9wc1xc
LmgkKSkpIn0NCj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAi
YW55X2FyZWEoYWxsX2xvYyhmaWxlKF54ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzXFwu
aCQpKSkifQ0KPj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJh
bnlfYXJlYShhbGxfbG9jKGZpbGUoXi4qL2NvbXBhdFxcLmMkKSkpIn0NCj4+Pj4gLWNvbmZpZz1N
QzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF4u
Ki9jb21wYXQvLiokKSkpIn0NCj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxp
YmVyYXRlLCAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF54ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUv
LiokKSkpIn0NCj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAi
YW55X2FyZWEoYWxsX2xvYyhmaWxlKF54ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZ2VuYXBpY1xc
LmgkKSkpIn0NCj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAi
YWxsX2FyZWEoZGVjbChuYW1lKHBhcnNlX2dudHRhYl9saW1pdCkpfHxtYWNybyhuYW1lKHBhcnNl
X2dudHRhYl9saW1pdCkpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVs
aWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZSh1cGRhdGVfZ250dGFiX3BhcikpfHxtYWNybyhu
YW1lKHVwZGF0ZV9nbnR0YWJfcGFyKSkpIn0NCj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9y
dHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKHBpcnFfY2xlYW51cF9jaGVjaykp
fHxtYWNybyhuYW1lKHBpcnFfY2xlYW51cF9jaGVjaykpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIu
UjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZSh2aXJ0X3RvX21h
ZGRyKSl8fG1hY3JvKG5hbWUodmlydF90b19tYWRkcikpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIu
UjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZShzZXRfcHhfcG1p
bmZvKSl8fG1hY3JvKG5hbWUoc2V0X3B4X3BtaW5mbykpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIu
UjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZShzZXRfY3hfcG1p
bmZvKSl8fG1hY3JvKG5hbWUoc2V0X2N4X3BtaW5mbykpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIu
UjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZShjcHVfaGFzX2Ft
ZF9lcnJhdHVtKSl8fG1hY3JvKG5hbWUoY3B1X2hhc19hbWRfZXJyYXR1bSkpKSJ9DQo+Pj4+IC1j
b25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFt
ZShjb3B5X3RvX2d1ZXN0X2xsKSl8fG1hY3JvKG5hbWUoY29weV90b19ndWVzdF9sbCkpKSJ9DQo+
Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRl
Y2wobmFtZShjb3B5X2Zyb21fZ3Vlc3RfbGwpKXx8bWFjcm8obmFtZShjb3B5X2Zyb21fZ3Vlc3Rf
bGwpKSkifQ0KPj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJh
bGxfYXJlYShkZWNsKG5hbWUoZWRkX3B1dF9zdHJpbmcpKXx8bWFjcm8obmFtZShlZGRfcHV0X3N0
cmluZykpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwg
ImFsbF9hcmVhKGRlY2wobmFtZShjcHVfaGFzX2FtZF9lcnJhdHVtKSl8fG1hY3JvKG5hbWUoY3B1
X2hhc19hbWRfZXJyYXR1bSkpKSJ9DQo+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17
ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZShwYWdlX2xpc3RfZW50cnkpKXx8bWFjcm8o
bmFtZShwYWdlX2xpc3RfZW50cnkpKSkifQ0KPj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0
cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoZG9fcGh5c2Rldl9vcCkpfHxtYWNy
byhuYW1lKGRvX3BoeXNkZXZfb3ApKSkifQ0KPj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0
cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoZG9fcGxhdGZvcm1fb3ApKXx8bWFj
cm8obmFtZShkb19wbGF0Zm9ybV9vcCkpKSJ9DQo+IA0KPiAuLi4gaW4gaGVyZSwgd2hpY2ggb2Yg
dGhlbSBhcmUgQXJtLW9ubHk/DQo+IA0KPiBKYW4NCg==

