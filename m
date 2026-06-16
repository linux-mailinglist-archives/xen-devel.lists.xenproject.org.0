Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olLlLSogMWoYcAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:06:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E168DDEA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=0hM5IxFT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339007.1600111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQgX-0008DT-Un; Tue, 16 Jun 2026 10:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339007.1600111; Tue, 16 Jun 2026 10:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQgX-0008Bc-RN; Tue, 16 Jun 2026 10:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1339007;
 Tue, 16 Jun 2026 10:06:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wZQgW-0008BV-2W
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQgU-003EXA-Q8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:06:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a312016-e002-0a2a0a5209dd-0a2a4507bf22-14
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:06:18 +0200
Received: from [52.101.52.66]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a312019-229c-0a2a45070019-346534424ba3-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:06:18 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB5056.namprd03.prod.outlook.com (2603:10b6:208:1b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:06:16 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:06:16 +0000
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
 b=p/THpH4PE77z+/mq7LBXaN+e2BzpvA2gfB4y8O3j2iHKbbemZrrcI+KmPOYXcCueQvfHRUUlvbOChJEJiG5qbm5v7mp5b/8wRKdV6Wsvv+Utef/X9tAGnZkuypwIGA2cKNInVCOzXcODNtsb5HPF/p5JeX87zFh8D4IEifk7eZto+fxwnxYfPTfW4hHCcO2K1CEoV6e3G22cMUfHGkitWz5sx60Ci5gnqRagFBvyIf5FMKP/8ZMZUI6KmQjJ4zJGeH3yHVN0dIbzzm/WQi7Rvl9uzMR2SRn5tnqwXMdC+n+8HHxffb/tuCD2DYx3fbRKXypXmDL+LuK4wFbWYoNdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vr8TvJcFUITctmFn45gBfgr/LiA73o0VUe/EL6hNrI=;
 b=BOk9fuIZv7THtPo5uogUEKAZraK0BgBfq2iH/v6bJnOGjWGkhDkZsv515ydBAaXiZnWH5Hs3GchsogC+4/U3XedIga+4+aqCCoKmBHCq/utK4DhfH2yL8rupYZlbT6ODDqDZgYcpOp3afQ8cR401UIJD4HACgR0UtKfztTslnkLJdI0eMxhrRiM4ED8FLhKwmxw22mE3MKru7jdGRYccij8wlwByMm4GFSwhs3ApJ+uA1jW38Cys0gxtloM/gIZjOgAeu/t816P1UZf8Os/kFp9l2wDufual0bhQ+Pe20evv9c24sZc2tb3unSYwhpoEM4JVzmorRbnTGI/hEr06PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vr8TvJcFUITctmFn45gBfgr/LiA73o0VUe/EL6hNrI=;
 b=0hM5IxFTl1scK61Fnk4y3RkVs14gF5kahkklJEBe+WtM79hEty34UaQw3z33nwuwFRxuW1lnIgsATyDB/A9sa8GD27GmYvcN0Y5/sRUywCB+k+qaIJEZNcPds3gYi+wwiiTmoIYHIN/IUm1JFsBO1QRmj9WJk8g/YR49vANmBvY=
Message-ID: <06e98f96-2f59-4731-b5a5-8e88adda878a@citrix.com>
Date: Tue, 16 Jun 2026 11:06:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
To: Kevin Lampis <kevin.lampis@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
 <1224fa79-d1df-4382-9829-aa2eabe60d5a@citrix.com>
 <BY1PR03MB7996FE744B091E767809F62BF3E62@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <BY1PR03MB7996FE744B091E767809F62BF3E62@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: a50644e0-ad1e-44a9-77ed-08decb8ee774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4143699003|6133799003|56012099006|3023799007|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	cpkbUZmF1TpwFczROQW9XctPY4rnNyWxCiXWai8Q5vnQfyHxN5uqx5d/2+S0KirpvSDrD/wlJCpKfMprTkt/G5b3+CVC/rD94Z+aW1Huue4ZV5vvCpJEdy/bAe9qKHmEG5eENHIul97oEJhmSVnKhiECZyHUi988b9XigifBbfuov0ntrWJ8YAznn90xVZFpO0BC1jU92cRVRAUiLvOv6SP2w6n9RIws9tbmOM7ppS6739pCKKc9ybsWuZO/aVV0ZgQ5RUJKfWbG8Rd7cFkP3dOIAhoqT/42rlSD0ELG+lWcIBGcxYLlzzuYTFIAkpWEdMwZCm4jksjW/B4CIdmjcNTh6jJJjCP5lrTpz/ufrYMJmZztkTBAr1jV2pqm8E6JtI5xSnGp9VwXkEFaoqB65TPWwwqYi4VuomFjZBs51QoqfeeA7N9zaF4bfBS1pqGhErTTNYRbcnFwYMHbMBxmpxJ4YAMyHDR8G01yXGprE4tbAhOhGlUMTrI/vf/+U7QZJir3qAGN5Byzir+4RDHURGShpxjZsnFle4u91rKq3+bFXjjF/vu0rKHal70YGtsqrpqP/JwDJUG6mXuwqYXzfXlHp53UyYdhAOqSSadYbhhsofn2No4Zu09dymbZKofYOwsIiJkANMPFQsLxUdJSYyIH0pmYM1VnO7W6Fqubxp75GVaayQ8C+8mx5krr52WSwePOJv4EOo8dZq0zhLOLQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(3023799007)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm5QME1GUHNOUlhTdEhyN0sxc3c2blpzWjY0RnllL2t5OUdEN2JYdVJudE1j?=
 =?utf-8?B?TTBmejFxUnVOZ1p4U0I2L2xQWFBvT1d3NTU1M3BRY2NRZHVUNkRvVTB3YXlW?=
 =?utf-8?B?b0NRMTBtN3pUTk9RdkxKYytxL2FrZ3haWUlIT2d0aG1xcHV0Y255NTJseUti?=
 =?utf-8?B?cmxtWmlUYytFandXeXVwNExtM0FRSFJmRFJSZGJaNG12SDF6bklRdkEvZS9U?=
 =?utf-8?B?TDNDbmJJYjUvVUJIdnpnOWJ1bWpyb1pCM3JuSWhRMGc5MUVGSkNQSGxIYVVy?=
 =?utf-8?B?Vmx1RzRTSkxhTCs2cVFWeVRTU1NYSjU5YU1TdlJaU0tSSXY3YkN1WW0xbDhX?=
 =?utf-8?B?UGIrODJ4SzR1ZGpKMDRXQUE2MFVKN0lrM2NWRy9WS0c1eFhaUE5pa3pnV1Fo?=
 =?utf-8?B?bVBkdXlrUTM2bE92ejJNR0ZJcmxxd3c4S1BnMVlpWHdveFVyVGZUYURlcnhF?=
 =?utf-8?B?d1MvbUY2dmdGOTAxT0d2VkRMekhZUmpXRWJVUlpTNHVRZnVPN01qMHRacXFX?=
 =?utf-8?B?WVdvT2VFcWRyYU1PbVlUWHVacy9nYk9uVU9MWmd0OGRnZUo4SU1EdE1hRTg0?=
 =?utf-8?B?QllsNDhIRHNEdGpLTGZ6V25tVGlEVnBNZHBhdkF1Y2ErRXMyTzhtMUFsT3Q3?=
 =?utf-8?B?RWxYTDZqcnpZVXhhOGJNUmJyNWRucnZ2L0VWVzNVN21HT1BiZjd5SzNLUlR5?=
 =?utf-8?B?eXdqTjl2WHo3NWxaT2ZRemR0QXhOOXhLK2hiblJJdktZb1BLdjZ5TFFvZnht?=
 =?utf-8?B?TlJXdXVkeWljTEVnOGVROGI0UGFud3hKcktMTmZPUjZFQXFvSXkvbnQzZEVn?=
 =?utf-8?B?ZjFqcjhDRDBQQlFrQ0krMkhyRDFoZm0zanFpelNIeGFnMzZYRkszZy9WK1JS?=
 =?utf-8?B?NVlmMlRaK2JRbUMwZWxvYTNKdkduLy9WU0FpWG12YTlPK0JlUk93MGN1Ujdv?=
 =?utf-8?B?R1JOWjBOZHh3cGRSMXdEc2syTUpONHBHdjNBUHNFMTNZM2ljaUxOb1BkN2Er?=
 =?utf-8?B?d1dDbUNMUGVBbGZkTStSMSs1WDlmU2xUY1FKNjRhWXUvS05GV0NRSmFYVW54?=
 =?utf-8?B?em42c05zMUJjZ3M4T1hOUjh5MkRXelNPMURBTHp5MVNuaDhmckdodWVCNGJH?=
 =?utf-8?B?TlVWK0tzZlJLemROSHc2dkFudkN5M01DOEtqOERjTjIzSWdIUzVwRVJMV1Fv?=
 =?utf-8?B?NnRyeGQ0c2U1cmE3dWcxU0xrbUE5dTUrS0l5MlVvNDFZRVdPc0RFTmFoaEVk?=
 =?utf-8?B?ZmUwT0dTdi9Vc0hVMlBPOUg2Y0xpVFNKNHliSmpTVldLY1dBVkJuQ0Jqc3l3?=
 =?utf-8?B?b2E1QVRHN2FzVkQrNGtoZndpOWl2cjduK1QxRGJtbDVTcEMrWkxkQWZxd0p4?=
 =?utf-8?B?QkZ6NFVkTU53L0ZackhHMC93TVdxTFhvTVVuQXVaTGd0ejdYQTBPVTlZLzFM?=
 =?utf-8?B?bTlhbEJQV0F6ZVlpQVprRmp0NzF3Z0tNNEhxMFd6ZXF3QnNBS0Z2ejgzbW1j?=
 =?utf-8?B?SGRrOXREZkdWS2JnMTZwZVJMamZhWlAvNW5yYjFvUmxjM3J4dEM5UXlWbith?=
 =?utf-8?B?bkowYVJmTUVYa0JQU0dCSUcycUxnM3ZWVlE4MGcxd3Znb2lxN1hKS3dUTUhn?=
 =?utf-8?B?ZzIwQXc2ZzBLb2thT1RqUjNvK2Z1eXdkalY4cFdsQWc5QncxMDRmazRRWVZv?=
 =?utf-8?B?RzRKN0djdy9UemVjWjNvcmpsenh0Q1RtUFpFRjh2Vm1ac2g2SEN2MFhabWdx?=
 =?utf-8?B?Rm9ONHpBbHJpMExKdE5rVkIxLzFWWDM2OTJaK2VwM0YyY1ZiUmZYeXJrWnp5?=
 =?utf-8?B?ZytWNkIxWXV5MVJORHFHbE9YdmxCem54RG8zQ3dvK3RhL1k4RUdZdzZBVk5z?=
 =?utf-8?B?T1kyZlV4MDVhdFVPK00yNzF0TDJqUVRxdERHM2dVVzM0NXl6eVRESEY5STdU?=
 =?utf-8?B?K3Z6WDNWeURuWHl3VnVJY0ZwZytLODNWWk9neFpVN2pwL2hCWXdKTm9tQ1Jw?=
 =?utf-8?B?eHM4TmRmTFNic0tlOEZ1YzJia1ZnSlo0Y3dIYnQ2cDdkWXAvTGxqZDVTUy9r?=
 =?utf-8?B?UjBNbFBqNG56R0hKbzdHY0p2UFdra2RaQzIxMW9XYkRCc1RyclRhcGowVHpB?=
 =?utf-8?B?NVdidUN4cG9uUnFvVUJySytDMkp0SjQvU0NDOEtDQ240aDEydTZsbXZxNHp4?=
 =?utf-8?B?dFNqVWVCazl2R1gzU2hMaCtCM3pNWHBJME8yODMzOTkvZzl4cTdUS3hpTWYv?=
 =?utf-8?B?ejRXQTIyRkk4WVVadnFMKzdUb1BxTXdLNkwvTXZMa09tcnFlSStWZFQvaklW?=
 =?utf-8?B?aXNSdEZVYmtkV2pHd1NMWXFMMmRwV1lKWDY4OE9FQ1ZGbVJvQTh2dHJGY2VI?=
 =?utf-8?Q?6YRTHdxvh/P3lU+0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50644e0-ad1e-44a9-77ed-08decb8ee774
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:06:16.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/GJgAW3cExu20DkywVpGgjDFdOQPpoB1RHV+zhpH/UJSPV1+Pv/U/WPKeHkJigFI8zcgw606X9h1RFA78cv6u3ciabuIlSMTFRCYk11ULo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5056
X-purgate-ID: tlsNG-ef75cf/1781604378-0B374C48-AE091C9D/0/0
X-purgate-type: clean
X-purgate-size: 2418
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:gerald.elder-vass@cloud.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F9E168DDEA

On 6/15/26 8:34 PM, Kevin Lampis wrote:
>  >Ok, so here is startup_64, hidden as a magic constant.
>  >... you're applying the alignment to the pointer and picking
>  >startup_64 out of thin air.
> 
> I'm going to be cheeky and play the Linux-does-it-too card.
> https://github.com/torvalds/linux/blob/master/arch/x86/kernel/kexec-bzimage64.c#L660
> 
>  >Either it was loaded correctly (and the alignment is correct), or it was
>  >loaded incorrectly and this is unsafe to do, is it not?
> 
> This is what the kernel kexec segment looks like in memory
> 
>                                            .- dest_maddr + alignment
>     .-dest_maddr                           |
>     v                                      v
>     +--------------------------------------+--------------------...
>     | padding            | real-mode setup | kernel
>     +--------------------------------------+--------------------...
> 0x000000                               0x200000
> 
> In the old non-EFI kexec the 16-bit real-mode setup portion is
> chopped off by the userspace tools and the segment buffer that Xen
> receives is just the "kernel" part. But we need to pass both the
> real-mode setup + kernel to kexec_load to pass Secure Boot
> verification. And add padding so it straddles a 2M boundary like this.
> 
> What the 0x200000 "alignment" variable is doing is skipping over the
> real-mode setup and padding.
> 
> It won't necessarily be 0x200000 though which is why we need to read
> the value from Linux's setup_header->kernel_alignment.
> 
> If you're hinting that perhaps userspace should take care of all this
> and just tell Xen where startup_64 is then perhaps. That would be a
> bigger change we need to get input from Ross on though.
> 

It was done in Xen because there was a concern that letting userspace
pass in an arbitrary start address would potentially allow a Secure Boot
bypass even if it restricted within the bounds of the kernel image.

The patch should probably make it clear that this load type _only_ works
for Linux bzImages using the x86 64-bit boot protocol documented at
linux/Documentation/arch/x86/boot.rst. I think it needs sanity checks as
well to ensure that it has actually been given an x86 bzImage and that
the boot protocol version number is as expected.

Since it is x86 specific, maybe it wants to move out of common code?

Ross

