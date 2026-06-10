Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bbUfEvf5KGqMOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:45:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2971665FED
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:45:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="OoQ/KkcK";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333945.1597049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBkZ-0001KU-2A; Wed, 10 Jun 2026 05:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333945.1597049; Wed, 10 Jun 2026 05:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBkY-0001Hi-Vl; Wed, 10 Jun 2026 05:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1333945;
 Wed, 10 Jun 2026 05:45:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wXBkX-0001HT-O0
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 05:45:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXBkX-00FkEo-4V
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:45:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f9c4-bab6-0a2a0a5309dd-0a2a4506de24-44
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:45:12 +0200
Received: from [52.101.52.8]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f9e7-7371-0a2a45060019-34653408db19-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:45:12 +0200
Received: from DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21)
 by SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 05:45:07 +0000
Received: from DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2]) by DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2%6]) with mapi id 15.21.0092.007; Wed, 10 Jun 2026
 05:45:07 +0000
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
 b=kUlzQjiyS6BtfycrHD1/XJw2IzDJA0ClUe1b6z00FLNVUWQO77bKOxPSCnxwDIOBZxDhyFal7ollmUvsYjO00BM8Hcv1zHYCTSnORYC4hZHoJltkxwI7nAZF06XbOtth8OQkU1NlqLUQ4xQngZX8yAPwD16wsTgPBtfAEU+XXsx3RGem5MgWvu3u9pnBSOFR2yUwXN0bZWFjjJwiXE+CQv43yHBXDu0Q5KrYTOq0LMH5Tf+9TCNsWbyXdry+DC+CpIHClyOkg2oNYQs9WBYHyQ5NFFiE+lHONFvC9FAzeBDRGVaLxjVqjxJZ1pasbxjnxNH0XstLnZYPJJklZOb+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/88MLSk8k51BOoLeV7E3T7rLWEmS6HwaqlDk2upVJEM=;
 b=u62FhFkoLarrUrSfZ82bGsLvTSxStjCsFjjTdUryUTzw4V1y+AzQYN/D+5KTsuMAXVfZaPnk8XNO12ZVek/Jbi74dQZzFmnb+CDJ+Ulv+iGyOrleqBZy/Xq9xxgBn9iuYNS0+TxLMrd+LjOQYvZLfWp6KQZVbIy9jTLavz9hhalxj7T8z8g0jIja0bo2vS2F14JKblDtHFLRj5Pd1R+IvdAoRaI/Sh0FinDcvlho4hjW5bzK1crcLnpx7xCJ3AB1IhiipSJ7R8WpCh//CveFcJGIZb7H+1gO1yQKI8XosB9t6cPYcdlJNNXZIDzujgNgkq+Ra491U9i1cgH9r7Q8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/88MLSk8k51BOoLeV7E3T7rLWEmS6HwaqlDk2upVJEM=;
 b=OoQ/KkcKZCedoPudRaEzw4HpHn0hZv8zDnJJySjkJGk9nhppd9kx9JgpatXM03FhkNMhKV+cAXb2/j63ee3er5Bti9exOwC/ZmTJu5MK1HeNy2wg++ZUHr7jMkbpdo6ntRzNpiJrMEIhJLrHTHAneRZ50o6eLrlF107g4/ISE1I=
Message-ID: <8fb0441d-a75e-4457-812b-7f8c61dc4e97@amd.com>
Date: Wed, 10 Jun 2026 13:44:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] ns16550: add support for WCH CH382 and ASIX
 AX99100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
 <ced10c25-2970-4ba3-96fd-3bc5df4c4797@suse.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <ced10c25-2970-4ba3-96fd-3bc5df4c4797@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To DSWPR12MB999151.namprd12.prod.outlook.com
 (2603:10b6:8:36b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSWPR12MB999151:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9160c4-f0f7-4ea3-8cde-08dec6b36d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FVnrp7ehmI9rwNyrZ5k/FCzuZJ5sXiA9Hgui5r6m5PSop0162xhZKOdn0XLnpIkyJUR8Xl+Oo+Jl0reus9oVQwiR5Qq4d1at3sG8DcouBkcFTLqH4FmcwqxvVEx8W9sW894dgkSLJcj/LVJQoL5cxezOCBXJ5Q2l9MHvALpAUp3CUjqimi+Lgi9o7c69iP40quHIPH0OIj9DgZgSAFEsFat6HVVirKYQffeJggxcQae8lcfwpoFbkLHYZDO5PsawoChil7zZJbEgSxkDKCPQm9mQYOaQE62T9A5XUKp+FFOQQr3hxvZ0PEr3rnekKSI44CS6qdHLOE1UNUIOj+ueNRumXeDwp9A5dq1rjnCcA99gqRLXXEP2pAif5Kb2mQBTSH+/CUppiCI/VyJPDegU5XAWtzo0eDNGc56trmNdRs4erVMBEEJmxvYPQU/avWVlkXYWaNT7Jitd9YfQzlsV/RSg+aBMPA5S3zfrzoD6kQdde/KizsTDWNEMv0UbQNzSudRUmaI+aAieS3ASvy+bv53kxtv5znh9AYl86M6BKOx9dmBSp84ZR/6wDjws9o65Lns8EmvMabowF4p0/+CL9nr3IklCK89sSDm7QJCdbJlg6cnJRX5d8OHlY5y+xkXfQfPdbAJbuHkWSEuTVqrDPVvE/FDuz6SIVMviAazfuEB9jPYqm61MU6Nu5M2SE2xg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSWPR12MB999151.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmxudW52U2dhd3l3N1BFV2tQNWVBUzMxNGhPejFwdUFnTGFrTmZEMDdkUWNZ?=
 =?utf-8?B?ZGh6S1FJTmVBQ2JDcTl4dm50a3V3UHUvWjllNVl4WDBMZ0FRYmZVc1k3eXhN?=
 =?utf-8?B?UlFQWnNTM1lieUNtUzNRZStranFGcFp1TnJHUUNCS1l1Qi9HSGxLcDJzUkYy?=
 =?utf-8?B?ajc2MVYrYkhvQ3RuWG9kUWx5dG9RTEo0d2FtYjlOSEJVeTYzM1B3VC8zQzVp?=
 =?utf-8?B?c25PQ1YyNmdUWDEyZk41bTY5UTdwS00zZnNJT0xxbHpvZDkxYTdmeGpqbVRZ?=
 =?utf-8?B?VFQzTDdabWd4L2JuSW9aSDlIazN6ZW1NcEVMdTdkWGwrRnBFQmkwNEVKNjA4?=
 =?utf-8?B?aW02MldYa0l4RmJmTktmWFdPZ0F3UEh4Vng2ZThOWDR5dFE2NDBJOElNQmdz?=
 =?utf-8?B?ZmZQNmJ4OFB4bXMzUEdwUFVEUEVjdUFkdVltOWRxZGFPZFRDdk45M3VqbG80?=
 =?utf-8?B?dmJmRk9PSW9FUGlCWWJ4b1hnRlVNdm5lcDVwZ1pLVHc4emtQYURHYzdlSndD?=
 =?utf-8?B?eW1tVVkxKyt3UG5LcWtJL3pwZUx5V3praklZMWtRK1ZRUXFnMys2ZEJ6ZXAv?=
 =?utf-8?B?RWx6MjZuUW5VZm9lL1lJb2RKSTBZazVGUXBhazNmRTBtWGdOZTFGQnYwcm80?=
 =?utf-8?B?YmZJZkJkOGRMSFFKcDRQZEdtalkvTmxHTmlURXFYNEpOUXp0cHhCa2VmbkRS?=
 =?utf-8?B?WVE5b3huN3hFRFRiZ2sxZXg2WE1Sb01DUittN0ZIVW5aNTJKRTkyZWpjemJi?=
 =?utf-8?B?M3d3MkIvVHd0K1JwV1VRMENmNzZPUTFSSmhYK2IyaEdoSVl5Nm5PV3F2b1hT?=
 =?utf-8?B?a2tkRmdlZmlQSCswK0UvVWpGQ1gzMTNRL0tCakNIMDZ1OEl5aUhscG5tYUZo?=
 =?utf-8?B?R2ZFMkxOYlFKeWNPdWZhd2Z2cTZhOE9hQXhDbW02aVZSdHh3Sk9QVGc0UmRv?=
 =?utf-8?B?YkpyTENxZGdLZWRpelAyWXNZaS9pQ0JGcGVRTExmWVZ6YkhCdVRuU2poZFFZ?=
 =?utf-8?B?c0RBc0QyeXVJZS9JTmxzOE42b0pmU0lLZVI1RlEwOWxyOGR5d2pmVEg3ZXZt?=
 =?utf-8?B?djFMak1iTDRMRW1US1EveWhYRGNBaXc4MWs0T2VlOCtnM2ZCOGgrMUw5WS9n?=
 =?utf-8?B?VDF3MlhOTlZSUlhmbXFQZEJ0NEt6OEgrZWlvOEVaMnd4Vm12ZURIQUltT1ox?=
 =?utf-8?B?SW1MNUNjNVVTcVpoSFRhN1d2RStYT0toMWdZSUxjb3hqWnFrejRoSzk2Z0k5?=
 =?utf-8?B?ZkM5YjV4N0dEUE95c1pNWk9VaUlwTTlyOE1qZllKTmZQNUZwa3VOSUh6Ukth?=
 =?utf-8?B?bU51cWZhU3U2U0dwLzBYOWM0U3g2VnJGYms5N2NPdHRaNHRSaVA1Sk4rQXRi?=
 =?utf-8?B?cnAzUk1MY0ZDOC85bTdVK3ZtQ1RMZUN1ajVBaXlra2dmNmNUeFFBQUhlSTY3?=
 =?utf-8?B?K3Q3MVg3T2xQUFQ4a25xQUJXT1ExdTA3M2pDUk9oTkh6clVFeDhWNTEzelov?=
 =?utf-8?B?N3ZQTU8vTlkzOVdSa1dwS1UycGxVb3ZlSnl6T0d5UjliQXNYWk9yQTdpQTFQ?=
 =?utf-8?B?dlBSUUIvT2hVbkpNQkpCb09nWG1SWmFRYWwvMVgycGZqU0ZVN3UzMktvVlN3?=
 =?utf-8?B?dnRhS0lLNm5BMVBpZDdmMWtKaVNadmxFZXh1UWg4NE14WnVQR1RZR3JxcW50?=
 =?utf-8?B?cjBObE4rNWZXVmpYNXRoRUo5TFVqWXdyOTk4a3owWTZTTVU4a3dhYVVWZkJ2?=
 =?utf-8?B?T0xHaDA1anNrOGJCanhmQmN1UzJaMjc0T0tuOUhwSE12ZTFCa2ZqbUcyNFJM?=
 =?utf-8?B?MHFIeEFZNks5Qzh4dHlsNkU1ZDdDNUZkT3c3VEpJTkliNTJyQ0ZYVXZOVDRR?=
 =?utf-8?B?bllOWlNUeGpSVDJiSm5jd1liTGFBL014aEsvTkExYTJqd1RTS3BqMWpqRE40?=
 =?utf-8?B?QWVHZG9zNEdIVHE2NlNwZ0pST3hmRVlhV1EvT3R4ZG1QTWtrNHNEZCtOQ2lS?=
 =?utf-8?B?ZnQxTUFwdHloQjJWUWJPVERkZnJTb1VPVjVuSHNybnZrcUpJK3c2d2x3Q0Rz?=
 =?utf-8?B?cG11WUtJZVczZ3lxYnBIay9yeWhjbkpiN2dlRjhtdTViQlh1Yi9OcGhsYmxs?=
 =?utf-8?B?bTlmTGpTUEhuQ3pWUFJjNFZhR1F6b1J5RW1UbzlpejNsNVZjTVcvMCtzZHVt?=
 =?utf-8?B?N21WS3BRZWxXTEFQam9ZdVYzRzQ2TmVtWVVWRmdiZExxVjgrN3FoNWVUcEFB?=
 =?utf-8?B?ODJNbEY0bUU5S3hWR1k0NWJ1QjhmZ2FIN1VUZWIwZTIvdDVyY2ttSWlMSkh5?=
 =?utf-8?B?Nm04UGFqNFVsVk1qWlJHbk10anczQ25DK0s4U2o3WGI0Q0lIcEJtdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9160c4-f0f7-4ea3-8cde-08dec6b36d52
X-MS-Exchange-CrossTenant-AuthSource: DSWPR12MB999151.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:45:07.1457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/QQaC5D+oRXdnAEEUUu6Q/wBLLet7bzUWhaFcAMsH1cD4t2dKc+EprijcAUpnX6Y3ub0zw/lr3eJT6k2P5cwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
X-purgate-ID: tlsNG-16d1c6/1781070312-8556ED75-5D2E8F4F/0/0
X-purgate-type: clean
X-purgate-size: 1056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2971665FED

Sorry I missed this mail. Please ignore my latest v6...

On 2026-06-02 18:15, Jan Beulich wrote:
> [You don't often get email from jbeulich@suse.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 02.06.2026 07:34, Jiaqing Zhao wrote:
>> This series adds ns16550 support for two PCIe serial adapters found on
>> market:
>>
>>  - WCH (Nanjing Qinheng Microelectronics) CH382, available as
>>    CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
>>  - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].
>>
>> Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
>> work with the existing ns16550 driver once a matching device table
>> entry and parameter set are added.
>>
>> v4:
>>  - Add Reviewed-by from Stefano.
> 
> There's no need to re-submit just for this. Mail volume is already high
> enough. The fact that this wasn't merged yet doesn't indicate any need
> to re-submit: This series simply needs to wait until the tree re-opens
> for the 4.23 dev cycle.
> 
> Jan


