Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJgbLGqewmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:23:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092ED30A170
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260893.1554058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52f6-0005gD-Vn; Tue, 24 Mar 2026 14:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260893.1554058; Tue, 24 Mar 2026 14:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52f6-0005dp-Sx; Tue, 24 Mar 2026 14:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1260893;
 Tue, 24 Mar 2026 14:23:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w52f5-0005dj-9f
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:23:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52f4-001QNI-GF
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:23:14 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c29e49-5cb7-0a2a0a5109dd-0a2a450ae81e-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:23:14 +0100
Received: from [52.101.193.35]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c29e51-1772-0a2a450a0019-3465c12371ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:23:14 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5208.namprd03.prod.outlook.com (2603:10b6:610:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:23:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:22:55 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwGurM1bFw/AccH9DUsyT+0hm59Uc+PdObfu3jtlewJJKs+XeWqsxjVO5xLbjDIMTtUGpu2J5qotMmDuF2h0Vz17pRkxJo3r/cxXAgFWaf94HOnBdKD8w0DgkEB5+esuWKOOPradW3w61Ngtaz7EF6MO1BklDwH2lN1FfKZj5upmjiHk5EH30ooST/UQ5zuqwJXBcK+awghJjiL+ZcrMt4vHcn3ayRw394jW6GjQTszKCw+m7ZJrrZnlgzrbFwA7EaNUyLW0MqZc2X62pTcDudz7N5QHxBm1eXKv6xWwQGj9Gly09ZDBtgT18Rh1gXZi6tdSUqwUYAuz+H1ngGeLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+6i7d12LI8bR5JPJllpH66zDpn2KJ72YxFZ7HFVtWQ=;
 b=v3+6rkyVCZvZxoPQWSGcdgxYujTfhKPHdoBeyBJSWWeJSIWy4SpazIkIfF9Q1kyfxh4z+nv05+W3AC9gONTy4wloCplhMiN2sXCx6OR3dxSWVXde7HwjXjMFVMxt0sLrVSXQ0eTzBCHEb5R5KeXd6XW5X3jP6LyXgtz0isNabctbqlW6VKGdE6lNSNTN3S6MxkRKZGabKnNWFPUbHPleVFhgsuieuS4dLYy2LHgsrofauSVAdyyj/P/5p8q9VIvpkehHPjjZyEX+/CVniIN7HkuNivSxBvpySvKkbUL9n07CGn6yHrRygu+qpx17GUeTg+zKXKSy0pQTaW68mPiPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+6i7d12LI8bR5JPJllpH66zDpn2KJ72YxFZ7HFVtWQ=;
 b=bgsHGdVpHF1fe5SV6BhcyCXlWRuo1SawJDSOmlNgAW74vUh6mLwMgTJBkhOT6KQJJYziaFG1eXEHJuzJZp62vPWAN7a4bB2Cz1rPLq5WkgyQuP7l3lE8Mkpvy1R97YcTiDe1dnCmok8+YklrbsypWAQLqxtwrMZXdTV+HBBhvL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <34e5c260-140c-49da-9e96-31fc7c51245e@citrix.com>
Date: Tue, 24 Mar 2026 14:23:00 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/4] xen/riscv: add csr_allowed_read() helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <2ea34e564533accb33ccee66b4a8c7a750733ae0.1773419622.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2ea34e564533accb33ccee66b4a8c7a750733ae0.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0269.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc37147-fc44-4ff4-be91-08de89b0d73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	B0OxgXXZbj+EzZ5NjvwWIv4o5DKI7qG0EzUcvqZCGKNkmHZEUUXPglz/s0+F2kiqlRA3CwdEtP7LOARVFyuS9Y796WLhJG3RzurKwoPihIjvIuK5pK4ck+cd4ant/tQ1HK2DWgCSod7DGwMWEUNdM1dJmhDkvgoExwL61/299RQ6R0JnzdYBR1XOwPQai5H2nHHx/pIJxfQkQhw4ULs7M88WuixxggUkzw76W9HsyVN83qNpeorPRZNaAGYnaSK8aQXAgGcrkkGCh9sCNvXk6YJjxSvBqNZHwTiUcXvSN6uw3cutnsFL8z38cGwSLISO9tQm0a8R3ns13zluZ6jif4aweIff/lKHI1juUtbInCdue3fcRic2yUXYZpD8cUZ4Wh0B9cXEDwS8tVNzDP5MQcT9aGA+Q/i88Du9vldKw3/+KlblnRlYuyzswSOd0HRNTqOKdxyVXgoMPusLiX5OnPtjFNQ0eOAMhO9bCBS6gIq6mn35Fs6KST5Hv/bvWzcc6bLQw52SzIi6EMRMxSA3D3GGhs4k4PILLWBmuS4EMNQo+us6TFWzuw+JcQnwpemEFFWRchGP08j5YVw6rGq3s5N48wenqklvhtjiCEsHBa00N8fpdyWYWmUk0n7YR2qWjrzcLT3jKYU5dH9x04SuQTSKgfjyK7XXRRlZ9y1ahz9GdevBHkHNIg8kbYfpXlrOpzaZvxNPLSNa56Y3i7kLNFgFLp224xKRDWfE3sYJPLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0FmdkFnUGYvMVh0TXZzZ1NmTnpsakNaY0FkYjJjWU43aVAzQS9TLzl2SzE3?=
 =?utf-8?B?VU9oT2xhUnVIWG45U2FMQmRsWGgwVk1QdHNrQ2dQNWF1d0oxYWdCVUFmSU1R?=
 =?utf-8?B?ejFia2NIRzVRVXRja1VvTXNxRXpmWGR4WnhVRFRPd0J2eXp5QmM3N2V2Y0VQ?=
 =?utf-8?B?dUlvcDZBdm0zZUowdk41TzlIR2JNSmZNcWhwcjZJVU03T1lFS1ljTi83R0ps?=
 =?utf-8?B?aXRGczhQQW1VTFpnZm9oQWV0N002U2sweEpVdXBFUkJ2bWhhVXV3UW9lSzZl?=
 =?utf-8?B?RHBpSHBKczUxWnZhVDEzN2h2TzNLZ3owV2RtNzYza3U4eElHUkRWMmJ4QTAw?=
 =?utf-8?B?dVAwR2dVL014N0VtL0g1c3J3cm10YmpqSDlUaDRML3dNR3RaS3FMQUtzTS9P?=
 =?utf-8?B?bkhkZGxPUTcwWC8za1FsbThYM1FxRS9QMmpLZHcyQUpmYlJsMlVnY2h5c29V?=
 =?utf-8?B?dFE3MGphWWxKREtOSWdTTzd5eFk1bVhjdVdCczU3b1BCVGZwd3M0NEJyeGsw?=
 =?utf-8?B?OVkrQW1uVDJnckVoRlZYSTVueG1sUzJTRDg2YUs2NktxUVlCbU9BMkxzd1pN?=
 =?utf-8?B?eFhvNkJkTXlXS21HQVRuRFlOTEwzVDBhUC80cktoVkhpV2dyV1NvQzZyK21L?=
 =?utf-8?B?VWUyTFFnMU9IZW5vbWtnNzZrU0tXNjFzbGFLTTRxRXM3OTh2WTg4SXJwdWM0?=
 =?utf-8?B?ZUV2TU96eXFNaDdBVVh6emJseHB5NmlmR2FBZ3NKVzRESmg2UGxUNXRkeXRt?=
 =?utf-8?B?WjlhRDI0NXJNeXM1MFVLWE5sUVUzRUFOMEFFYWdqLzlrSitGejFRTmtFd3RY?=
 =?utf-8?B?NitmQ3laMFhJUUZONWxjZ2tCRjFhTC9IMk8yQzliUS9uNFhmbHdTUnYvZGta?=
 =?utf-8?B?SkhucHBGUWhDdmQ3ZTRNRkZWZERxOHZLajA0VUdPYVdOZTZUbXFHYUs0RmFE?=
 =?utf-8?B?b1JrV0lkT2I0YlZjYnpCdjJ4Q0xXSGRtK3U5WExCUG82cGExbXI3QmpjcUZY?=
 =?utf-8?B?b1ZjZ3kxRGtka3FpWnZiRE9vTnErdWhKVEl2KzMxVzRSV3VRRklZRGdxYTdW?=
 =?utf-8?B?TkZMcURRWTd6K0w5R2VvODlrSndEWGwzNVJDU1pmcjFlQVVxSlR6RWFhU1dm?=
 =?utf-8?B?RE5MZjhjRnMzSlVENUdod05iSkcyOFBrbWw0QWxtTTVJRnRISlVaa1I3Uzg4?=
 =?utf-8?B?bkU0WjNVR002M01jTnVBUjVTSllSb09idVBmRjZKQkRhOHlUNVhRc3VSdnEx?=
 =?utf-8?B?Ym5nMlNHeW5FclE1ejJLVHdOUjJRTWJ3SzAxN0pFaEV6MVcybXlGU2toMytY?=
 =?utf-8?B?cHp1dEVybzhNRmFOVTZ6MEsveWQ0QVJmUHBJTUR3QXJyV3F0YU9ZSHkyMUdV?=
 =?utf-8?B?ZndTTlRLc253WU1zMGd6dXNnbWp4VlJLWUtWWVVjS1pUT2xGdW9waklrUTQx?=
 =?utf-8?B?TDUrZWhEOVlRcUhKOExvRHBwTVlVOXJ3OUxCLzlzaG9JdlZSTDlIcmVuL0Uy?=
 =?utf-8?B?am5ZU3k2UkliYU11TE5EY2VsK05JYVYwaEZGQm9HVGhZcFFQVHpZQ1V2YTBQ?=
 =?utf-8?B?d1JDV1JGc2o5NkdpTndBSjIxaGoxbTlnOUtFOXNhOUJGLzhjK0hWWW1QSjVK?=
 =?utf-8?B?bTR6VUljTGtvTDRpZ1ZOMDNka2cvNkk0ZjA5bmxTZ1kzOTdSSVZ3RHhpaDJY?=
 =?utf-8?B?NHlWNXpNMXVEVXZ1OGs5cURiWHZuRDFZRkczTGJ6OG1WdllaYzI0KzBYa3ox?=
 =?utf-8?B?UUcvemJvcHM3VkJxMkkyUjFSVkF0Y1pxcm5ZUWNVc2NrUFpCa0lzNDlpTzRF?=
 =?utf-8?B?YjYvSGhCd1FmSXUyOU5zNGdUTnFLVFBVbmdNTlV4UHpZalVIN1R2R2l1ZkJv?=
 =?utf-8?B?UGtscC9iRDRodzFTbGc2UDdoTFpLd1hWaG9oSVZyZWhXV0FORElOZ0pDWElK?=
 =?utf-8?B?bzdVVGNOa1hac3J4a0QyVjhTZ1JvcUw3aDlkTTc5d0hvWDNHWUwvTi9QbDBv?=
 =?utf-8?B?S2F3b0JENDUvRmFPWHRmSm5yWW1FclZrc0dBc29ma2hjL2dDS24rWElDVUo0?=
 =?utf-8?B?OGp5UDFlRndYUlRVd29HSVdsQjhvS3hIbHNyRUFZeXRMb2cwUmJMRXpCMENR?=
 =?utf-8?B?Sm5UeWliSTVzd29aeU04d3lDNlBCMmVIQndCM0NMeFdQR2dJQ1VvOXVBNUYx?=
 =?utf-8?B?aVFTb05YNFRCOHU1UUZvbG5ST3lWS1kwL2V0SWxuZEtuZldmQ3R3QjA3V0xF?=
 =?utf-8?B?RVhWWkUyQUk2endGV2xjdWluMUFIQzR2VldYZFIyNGVQeTR6RjdxQ1BOTkJH?=
 =?utf-8?B?bnJOZU5zWkM5N3NXRWh4RVNTL3ZBdmlTbmpQby9xS3JISUtRbkprUVVKTFN2?=
 =?utf-8?Q?4aeAgbzQmRA+yPtc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc37147-fc44-4ff4-be91-08de89b0d73a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:22:55.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9+ABbGkac+IyyUTdSEnR1B5f1ZvqTtr4qR9z4OO3S6zTLaI1R4IDlzyZeRH/2y5J7bNWel/z5/FahBU20jMwz/6SNFhZsLtgruhUNkkoPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5208
X-purgate-ID: tlsNG-4011c0/1774362194-BFE9D900-C55319DA/0/0
X-purgate-type: clean
X-purgate-size: 2169
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,microchip.com,wdc.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 092ED30A170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 4:44 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> index 01876f828981..b9bee3d25d21 100644
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -78,6 +80,36 @@
>                             : "memory" );                        \
>  })
>  
> +static always_inline bool csr_allowed_read(unsigned long csr,
> +                                           unsigned long *val)

$FOO_safe() is the common nomenclature.  So csr_read_safe() in this case.

csr_allowed_read() reads as if it's a predicate, which this is not.

> +{
> +    bool error = false;
> +
> +    /*
> +     * Use "+" as a constraint instead of "=" to ensure the compiler passes the
> +     * initial value into the asm volatile block. Otherwise, if the instruction
> +     * (at label 1) faults, the variable 'error' may contain an undefined value
> +     * instead of 0.
> +     * If reading of CSR register was failed, we don't care about val, so "="
> +     * constraint could be used in asm volatile block to not force always init.
> +     * val argument before being passed to csr_allowed_read() functions.
> +     *
> +     * This avoids the need for an additional instruction inside the asm block
> +     * to explicitly initialize 'error' to 0 before executing the potentially
> +     * faulting instruction.

Honestly, this is mostly tutorial level "how to asm", and isn't really
appropriate.

> +     */
> +    asm volatile (

asm_inline.  Especially important for inlining decisions when using
ASM_EXTABLE().

> +        "1: csrr %[val], %[csr]\n"
> +        "   li %[err], 1\n"
> +        "2:\n"
> +        ASM_EXTABLE(1b, 2b)
> +        : [val] "=&r" (*val), [err] "+&r" (error)

err needs & dropping.

> +        : [csr] "i" (csr)
> +        : "memory" );
> +
> +    return error;

You should write a second form with CONFIG_CC_HAS_ASM_GOTO_OUTPUT right
away.  See x86's rdmsr_safe() for the equivalent of this function.

Code generation with ASM_EXTABLE() is far better when the fixup label
can be used.

~Andrew

