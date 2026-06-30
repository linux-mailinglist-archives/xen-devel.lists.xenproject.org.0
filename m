Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2pDMDDqhQ2pwdwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:58:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600436E3409
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 12:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Pi4KxPrA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348675.1606406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weW9l-0005KM-KR; Tue, 30 Jun 2026 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348675.1606406; Tue, 30 Jun 2026 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weW9l-0005Hj-HF; Tue, 30 Jun 2026 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1348675;
 Tue, 30 Jun 2026 10:57:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weW9k-0005HA-DO
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weW9j-00H5BC-5s
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:57:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43a109-e002-0a2a0a5209dd-0a2a45069b44-42
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:57:31 +0200
Received: from [40.107.200.36]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43a119-08de-0a2a45060019-286bc82497c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:57:30 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH0PR03MB6018.namprd03.prod.outlook.com (2603:10b6:610:bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:57:28 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:57:28 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC2T2XGrvc01SdUN4fdwSgmpfi0v1xJrMK2aVL1uxRQd77VwvYF225wc9GgP1TzUJqk8+x1V08272Ot/XwcnTMI20gMt23JyErAU6gsDrGDDx0vPsiqF0WZThME281QF2qykPdorev8+9haPVy5ysKJ0a7FeiK7yzdW6V76bnYYWHYaSeBBzhWLtixegVB8XTdkgS3RDRwuFnhCXfc5o4UG4qxATw565hEjGYO1VyCY01m/s5IJgAleZhbDTng1jxHfvNQPgHyDhpw3nfw0TjWMpBfwv4vgb8mI+3KDHf+5njVHqHbLvm7J5AZT6xRa+GFa5q+3oIfVqwfjyjVsefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcx6O+eU8Bi70trAYZMjUNqUPauYGfeDKJjvcHE9xcU=;
 b=rouZwBKdsH6ejBd2RZxeeuVr8+mmL8Ns0L7WWid24/LxJ2G67DJEga1fzCuPy1oBKt3WQUtt36mLHaRvX+8fyXZi4aZ5KBcV/sDNr0WRotGz2H4FXU6pL0kxemVyjbmHFSfNKqZb+Cnh9Io+zg1UPfUXHvlzlVkemBM8njXCnuJbNAQX652KT30TF0cu6PFNvQ7VF8GGzjgrgWEOaPWiuGMJwcVP2f7VmO/QOn/v6qTpkiW07WfOHbdGNjic0OAHb2/K/TRU0FycP12f3y/4UfcGnV8MlWT+GWe3Djh3ZA3dOJh1Rie4iEI3b+Bk2kdJSiErmhmn/VQcXPiFFjSfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcx6O+eU8Bi70trAYZMjUNqUPauYGfeDKJjvcHE9xcU=;
 b=Pi4KxPrAxMaT4xK/kns0i5OJbOoNSASBgXpV6G4Nu92EkxVY52hkQX1FNAXHTMf87kGvNnvKZN+tTTnA1nxAcdpIEN4lFHk5098Qx+DC8VlqpRFfIjjd/BwnHhSBsJYTWnlvp16KhNULKgrjsvol0glHFxfuPyPTF1McCtJ+54k=
Message-ID: <64e7c58b-a12e-4b29-9d5a-f8a66e77a221@citrix.com>
Date: Tue, 30 Jun 2026 11:57:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "anthony.perard@vates.tech" <anthony.perard@vates.tech>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Hirokazu Takahashi <taka@valinux.co.jp>, Koichiro Den <den@valinux.co.jp>
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
To: Ryo Takakura <takakura@valinux.co.jp>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20260629020128.30561-1-takakura@valinux.co.jp>
 <69ae3671-aa66-4717-91e5-3b989e99c8d3@citrix.com>
 <TYYP286MB29465075AE7BF6306000EE968FF72@TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <TYYP286MB29465075AE7BF6306000EE968FF72@TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH0PR03MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: b352de1c-3d6f-41f7-1ac5-08ded6966017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8FBtt2JRq8PGnbUqmzgp2HUf9xenajgJev7OiC1LD08unnyCYY35LB3yXSIX7EfGClba+i0OZPY5oRw2HwemnF5rUsJ+FNXWKW13QXKTCXb7ZK7hNZHOCgqdCHaab6+KtSYJSMcRAEePLqCbLpOEfZ1Bn5MjpeeadasCd254mHhRhi9gfTWxQFbAKgdrP1dFi2YWARt7Z4utz70wBnGelcTPGZ311oSpxMbL9gwBR1mwracjzO/bq140OH7xtxu/YRAGe1Ql3Aynmo5XmzGxAsS3bFcwqUh5iiYTv8/EQ+aXPuKyrYkHhNtjBPauBubC2Hys643nqj5wocyu3v+0y0ljs22qq+gZkorK5Zau2pezBLaXUi6Ct6OBgPKn7MCdvZs3tAY9NLA0GbKwqeWvRsjbzLqbU+N6SIS0Sq/eVQUyCpHA09wsvQ0BspcSlayoFPAWiZRkrNgbCfMC2DRzl0KOjaMV0WIu7IGJgegPU1nuavRxxT6z8vSZZQ2vgAP0lHas89hNE0pBhAPnQhHsDFJAObOvwGBSgxOqsfBB3bMj1lDhD/sbyViMZSzOU2OiNCHpf+v9l24/ePMPY+S5NIP6Oq2/pkXi/WfGoi3X3secMhEAePxlF5/o00M2Er9UerdIB+35ZApSJw45Hx4Xc2dhwGQ/vWiGndRrEe9d6x8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU9XdnRPVC9MU3RJVE51S2ZSZHhYQ2llNlpLbW9xSWE1MzNOT01mbmxoNktx?=
 =?utf-8?B?Nk5HQS85azQ1b3Vzd2Myam1HdFNCcm13citOTEZoTm02ZFVIdUpzYzBrdFNG?=
 =?utf-8?B?TTFJWDZsbTFKUE9wMmhmUzVxa29GWU9CV3RGOWpORzZKd0d4UVFKSUtQdFA3?=
 =?utf-8?B?Y3U2WVpjSC9hNmxWeDdabUhEQ2NMNk5jSnMvTnNKS0diS1puRFVwSUgwZjgz?=
 =?utf-8?B?OUt4Rmx2NTNhZUM0a2s2dUFHYWVnOEtidjMrMk9tZ0xMOWZvQU9Sam54NUNa?=
 =?utf-8?B?ZnZqb2V0RUszUmJtOFZVMkNNZ1AyQzMybEJtRTk5QkhCOU9iL1lpUklOZlBZ?=
 =?utf-8?B?ZVlmWEdiYWs3empWY2pWc1NweGI4LzUrL1R4K0RTV3Bza1lmNzMwSHRzckZP?=
 =?utf-8?B?T1J1VThheDFEZ0o0SWEzM2dRdU0rQ043RnJ0bVR1c2ovMkN5YVQrbzVIb3dW?=
 =?utf-8?B?U2tZTE5aR3p5Qlcrd3B3dzYwajZLUnB5cXhEdE1sN2NKS3ZScjF3S2RjUFRo?=
 =?utf-8?B?Wkg2MVhVU0NXa1J2bUVsZ3QyWkJYRnpYcExCUzZ2TG5meTlhSWRKamtUVGRn?=
 =?utf-8?B?eWdueVNQbVdoZXFncU1WQ21VeWxCZElZYWovdTVuWlBPa0RrVmt5UHZWTkdG?=
 =?utf-8?B?N204bndjcGVQTlBuVHE0blJEeW9hcnR3SnF6LzVzL0d5cTgzRlhLM2JyQ2pn?=
 =?utf-8?B?N2l0SG0yN20yaFNtdDBEMzBuVnVzRi9zU1RZQzFJZ0tubnNHc1dobUdMODB5?=
 =?utf-8?B?UStOVjBuL1h6MFRoY0FMNmJsYktiV2tkd1VFMWptSnJ0aEdwV0VYK1ZyNWJD?=
 =?utf-8?B?Qm1zYlR2TnJuaGJTaDNGNzRJRFlXak9SdTlIdzBmZkMvaUJFV2FUdmxybHRP?=
 =?utf-8?B?RkpPNG85Q3h3VU5JMC9SR3dGNTErQm9BczUvaW1TQXhkRDlwdGJRTGFLREVq?=
 =?utf-8?B?eTFzVlRad3pWZkxENis4K0ZQUmFjRDE0N3VkVDU3SUxIQzYrdUwzVUQ1YXZG?=
 =?utf-8?B?V2k3UFhhSEhyMS8zc04wZ1YralRadFEzTGZQWGNXeHRGa3ZpRzZtYk1jOVR2?=
 =?utf-8?B?VDM2em9zemVsSUpTMDVlK3NYVU5aVlgwZXJXV3Bpanlzek1GUjRqdFBkbm9Z?=
 =?utf-8?B?SGdlcDdrU3VGUS9IWXZRWHJRbjdXbHlKUWxxZmFNNmJkdmlTTXArRG9PdDJD?=
 =?utf-8?B?TmFYblpzU1kweTBmOVZtWmtNaEJiUCtydGVZengrUGNDTUJ5Zy92aTFuUytP?=
 =?utf-8?B?eFdwMll0YVhpNTJwaUp3d2ZuR0hMdDVmYzBJSEdPbFhtZFozQmhyZ0pvKzZm?=
 =?utf-8?B?TVZvTEhsUnhib0F0LzdyaFN1MDhrdnBPNFJrZ0dNY0FXdS9jT3llVmhXcHhG?=
 =?utf-8?B?ZldLMi9IV1doRVd3dndjakh2R1Q0ZUU1ME1IM3o2RHdhbnVWaXNNS09vWU8v?=
 =?utf-8?B?bjJHZkpJM1ZJQm9DVUxnU1QvK3JCUzRCUlRsRHhaSUVleE9ucnJpemp0V2p0?=
 =?utf-8?B?UmVsUFlQcGRlbHlTNVd0VHRMOVhwcTdYYjFGYjVSTUxqc285Vy9IUWp0RTBV?=
 =?utf-8?B?ejhXVjVSYUFxbUF4OFBoREl6SXVjNGl3dHZ1OERrdGRDcFd5T29CWXBsWVc1?=
 =?utf-8?B?ZitpanhmNDdEbVNkQzhBVkVIY1VUWjhLSFZ0MmZsWCtLYURqa3R4L2NkMGlC?=
 =?utf-8?B?WW1CU1V5cHVxMFFFTElQQVhKcGdNS2d3YjdWcUFUb080SWRRdUQ4TGFZOXBv?=
 =?utf-8?B?dXd3eEoyZ3NXWHUveXk1ektzYm5JLzBxZmRCOVlHbCtyWjZmR2p1eVdkZFRH?=
 =?utf-8?B?b2F5MitIRDhuMFRIVGtoR2hYbWhuOXZrWTZ1U1dlUWJoNEtJb3BXaTc5MTlw?=
 =?utf-8?B?YWtwT1JnYWFvVGRnRnZObzlsL2grT21LYVlrSElrb2EzdDgwRTdrZTU2RlF0?=
 =?utf-8?B?bXFhM2trZWVaNmk3RktKV2hoSXZCNTVlaHhpUS92Vyt1RTdLT0NQQlFwTkE5?=
 =?utf-8?B?NVFna29ZTTN2Z1VtNDJjS0tXb24zdGJXMzRvQ0dtcnIxRHpIb3RJZ1JBc29q?=
 =?utf-8?B?d25PeXRINjVrS0dkdjIxL3R5UkZvVkJzQU5KYXJzdWxvcVR5ZnJJanB6TFJT?=
 =?utf-8?B?Tmg4OGhxdlVsa3RwVDJzdStmYjlpMWpSWS9CMUlCLzlxRGwwQWdwN3ZWeFUw?=
 =?utf-8?B?Wm53WWUweUJ0UmZCUVBLY0pqRXEvdW94QnFiYWtCd1hkaWQzbzVRRzVOa1Fk?=
 =?utf-8?B?aStOdXRPaUxjbXp4blc5cVIraGpWRndsaVc1S2NvcnlCZzhoMEF5M3lzZnJ2?=
 =?utf-8?B?M29EYVFzd0NkSHBtYzlDUnhyZGxjUWRmd0U3OVZ2SEZxQm5GbjRZZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b352de1c-3d6f-41f7-1ac5-08ded6966017
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:57:27.9581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s33Lo9mx5TsbNF9/jvIOh5y1oTENf2WmbkiQ4xJf2DbfSMfZBrZTMw+hdB9mI4yoargu/akDLnmXA+pPMjwfXQxr//BSj0NG71BjgdW/21k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6018
X-purgate-ID: tlsNG-16d1c6/1782817050-F91ED68D-38FE9200/0/0
X-purgate-type: clean
X-purgate-size: 2374
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,m:takakura@valinux.co.jp,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 600436E3409

On 30/06/2026 11:43 am, Ryo Takakura wrote:
>>> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
>>> index e135bd5bf9..b7c9aba94e 100644
>>> --- a/xen/arch/arm/arm64/livepatch.c
>>> +++ b/xen/arch/arm/arm64/livepatch.c
>>> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func
>>> *func,
>>>      /* Save old ones. */
>>>      memcpy(state->insn_buffer, func->old_addr, len);
>>>
>>> -    if ( func->new_addr )
>>> +    if ( !func->new_addr )
>>> +    {
>>> +        insn = aarch64_insn_gen_nop();
>>> +    }
>>> +    else if ( func->trampoline_buf )
>>> +    {
>>> +        int rc;
>>> +        uint32_t *trampoline = func->trampoline_buf;
>>> +        uint32_t *tp = trampoline;
>>> +        void *orig_cont_addr = (void *)func->old_addr + len;
>>> +        unsigned int trampoline_code_size = len + 12 * ARCH_PATCH_INSN_SIZE;
>>> +        unsigned long trampoline_start = (unsigned long)trampoline &
>>> PAGE_MASK;
>>> +        unsigned long trampoline_end =
>>> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
>>> +
>>> +        /*
>>> +         * Make the payload text area writeable while generating
>>> +         * the trampoline instructions.
>>> +         */
>>> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
>>> +                                 PAGE_HYPERVISOR);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR LIVEPATCH
>>> +                   "Failed to make trampoline writable: %d\n", rc);
>>> +            return;
>>> +        }
>> This ought not to be necessary.
>>
>> The trampoline is executable code, so should have space reserved for it
>> in .text of the livepatch.
>>
>> Then, you can identify it simply by references in a new section, without
>> having to have a pointer with a sentinel value (void *)1 in (which MISRA
>> will have a fit at).
> I like this idea as well! I'll try this together with the earlier
> suggestion using __attribute__((no_caller_saved_registers)).

If you reserve space in the function preamble, and use
__attribute__((no_caller_saved_registers)), then you don't need
trampolines at all.

The preamble just needs to turn into `call newfunc` when the callback
function is attached, and then it's regular return will do the right thing.

~Andrew

