Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB5OC8rM2GktiQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:11:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3B3D575E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278656.1563421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8pS-0000Hs-GH; Fri, 10 Apr 2026 10:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278656.1563421; Fri, 10 Apr 2026 10:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8pS-0000Fn-Db; Fri, 10 Apr 2026 10:11:10 +0000
Received: by outflank-mailman (input) for mailman id 1278656;
 Fri, 10 Apr 2026 10:11:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wB8pQ-0000FZ-Ne
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8pQ-004CNP-3Q
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:11:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8ccaa-2eae-0a2a0a5409dd-0a2a4508e45a-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:11:07 +0200
Received: from [52.101.46.0]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8ccba-fab6-0a2a45080019-34652e00ea1a-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:11:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7867.namprd03.prod.outlook.com (2603:10b6:303:26d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 10:11:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 10:11:04 +0000
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
 b=yu5qYVQV8G2lMQbinL7tuNAwp8w+DwnYJCMXqkfKz9uDirJk8++RNl2x9ITRAgg/KLSvs0t6CdyCSFkqZps8Dnul7AUUpr3MUo80ps/XhxNcj604tGlnk7hAJLYmnIu92OhcQ9gE8d28ZiQo93DYvXgm+kom6pfueCCxmLWWXeBmxPl2hO+C1Wx3tme1WBOKZ6eSGeLNM64UVWTueuwSOFVTbWodchmYlp/Z4FtU72ztvW41hWQ9EEyQmIiZZnRIy0g39aCsJLSom1XSVAkhdWLHcylDsmDiK4cCXrNpQUhoal9F5R+cu2QJ+N/s4XetCcFUZ9ZoafWydhEs48mrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80cr0fbEyf+3LSpJr7OWb7Mu6O2vhzsw5TXapkzEWb0=;
 b=HZ7xBDGYTUUTmrU6LE1ILHEjryDJz0cgzHTMB65MzYF/p2xtJfowcG943mceGJzJ8prlnIiU+tHyXwmfq2toFHGOIQ3cbZiq+x2JjsIVQyugFTbdGz8mg2ZWyQgTvGRq3B0CS08cxtkVS9+NOs3G4dGWFMaYf5YAH4tfmqumgdA9q9izwVW/LRzqIkPDLxKyas1DoUyBLf/K6u5+Z+PD+sttHtAZdhQ1TaQmjRaGZfRsS+4bDBq/3NU1ODIDP0u0OBwYMFZ/xj45Tni+YPMj9IqhZ7ICfTbw20nHy6XS2TrvGuF3pC+DrEXONPZDGyFM8yRPW7ozqciEdlp3Cd6qtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80cr0fbEyf+3LSpJr7OWb7Mu6O2vhzsw5TXapkzEWb0=;
 b=Ye82CaL9nThEQcoEBpPGK2F+7zrCFuaZiO2L8REDSVNcuF5FtirAxd/YgE3scECenrjns7+FgqtoudeawgFxXFRqStpj8biTPo8PCO2h0KvI59epLWlmfnkZpZcjLOAySQWTH7VtaQDkMUzYHwefov/ET9GZTD7gdA3D8HcL2T4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <973890d8-aabb-4abe-ac8e-f1e77f4e13dd@citrix.com>
Date: Fri, 10 Apr 2026 11:11:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Gyujeong Jin <wlsrbwjd7232@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [BUG] Potential double-free in Xen dt-overlay attach/remove error
 path
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
References: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
 <c4961231-7882-49d8-8c68-c014ca0a5e4f@suse.com>
 <aaeff4b4915c28a6ac5a7abfa4ab7679@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aaeff4b4915c28a6ac5a7abfa4ab7679@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5d11e7-ba96-47ee-38c5-08de96e9797b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A0yl/vyouYf1Y5kwFJXJiH6p0m8CfhhMM6PdkfooEkvg5m7QzxB/GIxJ/gvn+2mKICzOKU7nRAqDqyV5dXxTPn9BAYRnKsdBjZ9wMK4HCFM0vBHouFDK4VimSZk6aTjRkZiLXjMvkTmdg6JC6FfdVfUiZj+apCsVaAxI/ER3CxNPoK7Lg1DVou0eE7HlBZc2bW+u/UEPtEJ/eorAXybMb5FhhNcSzvQX/j8tPFrBYvPS112nNiq0tEnr8ZaPLXx7ENcEMasmZ1tp9Kcot2nPuHXDqjhXs26Lcm7oap2ARq4Yjn+oA9u2mjksgDzaSmwGurEBOMEgBPULmjHl6O8bkZ0KLHl+kdgP9o6NPo6Kv+0Agf1Wi4XqbKYTr9tdn2e30ibDjpsF1RzZbjnZ0M1S28r/TYJPXpex9HCQptaZCXPwtZdP+5FeBfd6yx3M5zNTkXVz63RjhtVMx1q5ghpgcpys20RGeilHqr0kRjRr9YixKtX5ZGNzd7Xuf4kJO6b2CTXkaFgSSyW1SfJltP73Rla4lIu8X7mMOdes57AEs8ygb/IGLzIZz+kd4UQmrcB6kSr+ODzOjiXH5FTRzTUKpjBoxP5yjUHVfP40uG5bcMlft7RO8GmcubiblXRnfjjuhoAvUooyc9/TlnwYDmis1zQhzvYxB2BKzRFql+ql5AuN6+7C5U6mqwKhCEq+Yf0ueni+7goWG1IE25puW0Q+GY/jmxtiaK6KQx3L03dKbAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm9xNkl3eXJwTjc3VlVVcTlrS09TblhZSXBXUlR5VWhnNXR0SXB4NjZSUU9F?=
 =?utf-8?B?cUNCdVNKRkdxajNuRzQvUFBOSmJXL2tkTGpabVhWY0JDYmZhOVhXYUtXTnNs?=
 =?utf-8?B?VytvRnRBZGJvK3VUdW80UUJnaWJyY1pCdHVHOHV4Yzl0R0NSSWoxc2VOdWNV?=
 =?utf-8?B?QW43STFCMGROa1FaUXp3QnI1YWlWaGxyOWtQUDl5bllhMCtaZjZyRytMejl6?=
 =?utf-8?B?OHpuMXJTaUJxcDNZUkIyTXhYb2U5VlFsS1RuWUMxYVRkK2NwRmpzdVpHZml2?=
 =?utf-8?B?bjBDVXBHUVBiWGJ6UGJtbmU3R0hkS0pkZkxwQmxTRXc0cXg1Rm5Ib0FoejUz?=
 =?utf-8?B?U2NPMVZieUlmb3RZZVRpVmRTU05DVFZ0OS9ZTEJmemp2K0ZPOGdVaDVVdzZr?=
 =?utf-8?B?RDRnN2FxdjNsbWFwMnc4a0M1VitDcGloYzZYQmU5L25aY2djaUxWeTk5MHlS?=
 =?utf-8?B?MTAzeDRweWE1cmM4OEZnb0FSTUpDNVVSek1oSkptWEZjSGxCNDgybVRWTVJk?=
 =?utf-8?B?YTRXQ2pKNCtQUURTaTR5NzRMWFoxY0djbmZnTUJ1SHZDckJnTzlRbE1CZmlj?=
 =?utf-8?B?QTFBdWQ3bnpHZUMzeHdXVHlzRzJxY3ZmaXRnOWl0cm5xRUY0RGFhQ0Z3cXNt?=
 =?utf-8?B?VzNNSElqamMvN0o5d003cnc4aldZcTdBenIxLzhmOWRhM3M2cXcyM1Bpb001?=
 =?utf-8?B?OTRCMjFMVEFuNGVVcVY1Lzl0WnhRVU92SlYxRUR6TmxOOWlvRnNLcVYrZWYr?=
 =?utf-8?B?cG9uSGhaeThUN2lvZ0F1L0RqVmszNXVGS0doV2hzemVLVXM3bjRCYW5Jc0Z1?=
 =?utf-8?B?aWJBdkFNYlRRRXBLNlNTdVBrVitVMEltNUFyVUNNa21vbjgzclJ2ZUk0VnRI?=
 =?utf-8?B?T2VsYmkveUFZN0gwTk4zcTJIWFJqN1ZheXZZVjdFVGxmTGZiZUhLNTZ0ZzMv?=
 =?utf-8?B?TzhxZk1CSEp2cWdyeWpTRVg3b2ppc2ZzZk9LaXVjclZTY0N0NkNxU3h6RW9m?=
 =?utf-8?B?WnJoa1lqL0dObCtXNzdneTg0L2hNYnNsQjRuMXNxVlVQS3djL0E1WU56c1Zk?=
 =?utf-8?B?YUd3R0oyR0JKWllGT0NObGl6RTlLRmZLTndDcysxMUE2YUlaM0lKRW9HSkZL?=
 =?utf-8?B?aGpOdTE1MVNKSlFUNVlpRmNaLzhmVVlCS2J2VWpjMkxCZmJEMVZTVnljTFow?=
 =?utf-8?B?WW01RVB1Qjd6VnROVTRJL081ZkpINHNoeHpaWUlJM20vZ1VxVzdYWG53V2tn?=
 =?utf-8?B?M2ZKNUJqZVVLTmNERUZBZ2dSN3ZHRGxBNWhWTUZ5Uzk5N0JMdnhhdVVFN3lR?=
 =?utf-8?B?b3FmaVZQeVI1ZTA1N3AxeTRNS0pjTEhVVmFvMExwZXIya3g4WEdWT2NLeXVW?=
 =?utf-8?B?d2VzRHhLVnBYN2JwQnBheE1HdzY3UnBHTXNMbENTeE85QzlBNHAvVWdQbW9C?=
 =?utf-8?B?OTlpN1JsOC9VZHZCSmlXTHh2NTc1VkdyZGl0S1ZYd1RCbjB6MXFvVit5d2FM?=
 =?utf-8?B?ZEFCNXkwTHNkQ3RXeFVORHg2ZTRJQmtxWXBzU3I2NEozN2drZ0M3QVRrNjdy?=
 =?utf-8?B?a05UZXBqNFY5YStXR0REVlZoWkovUE9GbUpJZFN1anNRNURXVzBRakhMd1pN?=
 =?utf-8?B?KzhqdnNzQ0dNRlpoVXdGMG9ZM0JzSzlvWEU3a1kwVWhSVGJwdXBHL3dZbUh1?=
 =?utf-8?B?QVpBalVvN0YrdWxsZ0J6bUQzVHBGUVpkSG51VFVsRUlhWW1SZjJrdGlQTEhB?=
 =?utf-8?B?SGVoNS9WbWtzR2xYRTJaMnhwK211aU9VcmxZZkJqdmZhZ2E0MCt0blVON01N?=
 =?utf-8?B?cmdhQnRPSytPcjdLTDY1NlhnTW9MclNXVUhEYTFhWWdZMHVmTkZ0aTZQMDIy?=
 =?utf-8?B?ZEI2T1EwTDl3eGlSWXlPRFdXREdKRk43UXdOcTBock44ZzU4UmE1QzlKWTZx?=
 =?utf-8?B?T2k2RGNYZ21qZ3UzNmNPNk9XZ2Jpb0JBNFRFYTBSQVovQUIycWxVcTB3aC9N?=
 =?utf-8?B?R215MGJXM2pVMVVRYllzQzhnT0JhQ0xrVWJ5L0xvWW95eVoxbnpSWndIK2tN?=
 =?utf-8?B?U2o3bmdFd24zYjJvYzhyY256d2hxRmdxRUZtbG8zaGlWbTJac2g4eVIvc1R5?=
 =?utf-8?B?SHFDOVBqRlZqcjVLQjRXZW1HaU5pOG1kNkJwYXVIY0p0OW1sTU5YbXY1Q3Zq?=
 =?utf-8?B?K0tjZmg5M2NiUkh4NFhudjcvZkFnemplUUxlS0FlVlA2cTljUkluOHBwaVpj?=
 =?utf-8?B?Q1lwSnlUSkxLME4wVmxjYjk5VkhsL0VCeFIybGlSbDVWbGFKWHhZUVRCQy80?=
 =?utf-8?B?N0F6dlRYQ0ZaWlpCendyQ2JLdWNQZDVsUFM0UmxVMnh2eTJ6NVFyK3pkZ2Z6?=
 =?utf-8?Q?6aTmRSUtTN34WVpA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5d11e7-ba96-47ee-38c5-08de96e9797b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 10:11:04.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2ptd4Gg020yvEzusBqYm1GK7isHljjuc5gRvsl5mEWzi2qFoTRIYw3Jj9Yr2nvjNL7tImtnxzLOzgVN8apuWcgFa1yiHse+hSfcuyMuPRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7867
X-purgate-ID: tlsNG-c1860d/1775815867-74360497-9C00439F/0/0
X-purgate-type: clean
X-purgate-size: 3208
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:wlsrbwjd7232@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:nicola.vetrini@bugseng.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6CE3B3D575E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 11:06 am, Nicola Vetrini wrote:
> On 2026-04-10 08:31, Jan Beulich wrote:
>> On 09.04.2026 23:28, Gyujeong Jin wrote:
>>> Hello Team, I was advised to report this issue in this way because
>>> dt-overlay is currently experimental and not security supported.
>>>
>>> I would like to report a potential memory safety issue in Xen
>>> related to
>>> the Device Tree overlay handling logic.
>>> ------------------------------
>>> Problem Description
>>>
>>> A double-free / use-after-free condition may occur in the dt-overlay
>>> handling path when an overlay attachment fails and the same overlay is
>>> later removed.
>>>
>>> The issue arises because rangeset objects are freed on the failure
>>> path of
>>> handle_attach_overlay_nodes(), but the corresponding pointers are not
>>> cleared. Subsequently, handle_remove_overlay_nodes() may operate on
>>> these
>>> stale pointers, leading to a second free.
>>> Affected Component
>>>
>>>    - Xen ARM
>>>    - Device Tree overlay subsystem
>>>    - File: xen/common/device-tree/dt-overlay.c
>>>
>>> Relevant functions:
>>>
>>>    - handle_attach_overlay_nodes()
>>>    - handle_remove_overlay_nodes()
>>>
>>> Impact
>>>
>>> This issue may lead to:
>>>
>>>    - Double-free of rangeset structures
>>>    - Use-after-free when accessing stale pointers
>>>    - Potential hypervisor crash (DoS)
>>>    - Possible memory corruption depending on allocator behavior
>>>
>>> Given that this occurs in the hypervisor context, the impact could
>>> extend
>>> beyond a simple crash under certain conditions.
>>> Root Cause
>>>
>>> The issue originates from inconsistent memory management between the
>>> attach
>>> failure path and the remove path.
>>>
>>> In handle_attach_overlay_nodes(), the failure path frees rangeset
>>> objects:
>>>
>>> static long handle_attach_overlay_nodes(...)
>>> {
>>>     ...
>>>
>>>     if ( entry )
>>>     {
>>>         rangeset_destroy(entry->irq_ranges);
>>>         rangeset_destroy(entry->iomem_ranges);
>>>     }
>>>
>>>     return rc;
>>> }
>>>
>>> However, the corresponding pointers (entry->irq_ranges and
>>> entry->iomem_ranges) are not set to NULL afterward, leaving dangling
>>> pointers in the entry structure.
>>
>> Further to this, am I overlooking any check preventing an already
>> created
>> pair of rangesets to be replaced by new ones, leaking the original pair?
>>
>> And then there's a Misra issue as well: dt_overlay_domctl() has
>> unreachable
>> code. Anything other than XEN_DOMCTL_DT_OVERLAY_ATTACH is excluded at
>> the
>> top, so the "else" body near the bottom is unreachable. (This in turn
>> makes
>> me wonder: How come there's no "detach"?) Yet then, that's probably
>> pretty
>> meaningless, as there look to be other issues (Misra and general
>> robustness
>> ones) as well.
>>
>> Jan
>
> Is it by any chance enabled in *-allcode analyses? I don't see such
> reports for unreachable code on ARM64.
>

eclair-ARM64-allcode:
    ...
    EXTRA_XEN_CONFIG: |
        ...
        CONFIG_OVERLAY_DTB=y

Seems to be, yes.

~Andrew

