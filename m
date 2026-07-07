Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id horpIwkFTWpgtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:54:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5271C296
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:54:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="frfoMS/f";
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356253.1610894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6FV-0001DF-GP; Tue, 07 Jul 2026 13:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356253.1610894; Tue, 07 Jul 2026 13:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6FV-0001AV-DN; Tue, 07 Jul 2026 13:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1356253;
 Tue, 07 Jul 2026 13:54:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wh6FU-00018t-4k
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 13:54:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh6FT-00DeOf-Hu
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:54:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4d04f1-5cb7-0a2a0a5109dd-0a2a450393c8-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:54:07 +0200
Received: from [40.107.209.48]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4d04fd-ec1a-0a2a45030019-286bd130d5e2-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:54:07 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by DS0PR03MB7728.namprd03.prod.outlook.com (2603:10b6:8:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 13:54:01 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 13:54:01 +0000
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
 b=REAaQS/aLw+U9MN8NIIAxGP5qVlgxeeDyvdfq1B9GfZ7Ogj1v4nnXL0Jw8sTIRCEJc3yi3zw7g59/EiZkbjmE3QwE5KuovScgjOYkM+9xGyZmiU+/Em+VjtF7n4GMHVAMN7f47AZ8mFVLYF2pIDoHlKfofI7blsJ21qDs2lCI7Tq4Pn8pp7oeVHXpsTOtbnUL7q7trvjHihn+UlhlwlX/FO++60nGPJGQGRDrFX7gzyY47JHGQ+H2M+XfqeN+WxQsZPGAVKtdMEYw0/KzP9hvBJj9BxTbldlH7YyamIst2DJJAwbgVMgQLZILm7oVQs7S2xx7cugyZhT1GzG1TSaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGONrJS5hsFqmZoox5vsld4O+CfCWiJ33ciRSZTGjX4=;
 b=Tz4xYmk2rGOlciaohsIbH1VaXlU0/Dfey5FQ4+WwtDBtgRPFVqZxCrMdkDtB8tsJQvJmYU/R7FSv+hhhIbMmxJwsqXM1CNmiiGx61Xs8Fc9fNCzLBJrdWFCFNmoEADj3UwSsD/j1giFcMeURSCNMSy7bzaVgJmvoPwOrKgYnjFAWEetaJYF0fl7L2eKOg84gBux2q33H8IFJsSiVg8zk7jJPEoekfpqCzT0A1tot8+HQgsQlvOMDqSWhoDUCjBQsRcS0KBYCSBZIoa2IHdAYKfqGdFoWLrO0sS5Nk18ZxleqrrOTletL1Fv2emNzhaBVlsiFMVBEWFFcGsC6Xus1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGONrJS5hsFqmZoox5vsld4O+CfCWiJ33ciRSZTGjX4=;
 b=frfoMS/ftQH5x2hi5ZkqQJoRANE++Nzi3VQAwMbUw1KaAI3C8QIlSAgdLmB/IMuv3uHkD3EjZZo/2sAjLIb84Dd1BtNlQoy67VJZaf+ny9Xy0pdc2x0NZOJbPBOiDaN9SfkGUfvWWBieRqdemLZaeT8Wtm7Gs95ECeqU9uQ8wmM=
Message-ID: <52991ae0-690d-4e47-92f5-1e81ad5979d1@citrix.com>
Date: Tue, 7 Jul 2026 14:53:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/entry: Use POP_GPRS and remove RESTORE_ALL
To: Jan Beulich <jbeulich@suse.com>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-3-andrew.cooper3@citrix.com>
 <25cdcaa0-64cf-4014-ae52-3114f39abea7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <25cdcaa0-64cf-4014-ae52-3114f39abea7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|DS0PR03MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 5905a34d-a72b-410c-bb27-08dedc2f3278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	d8dTsgshjcsJ5vXweTDGxTq4iDHAmJGzMKnZv3pNYfDXnpUTkqmF/+vHI9G9d+SSN+6q60viz6nNDSuAcKr60J5EUD7HHiYUxS/oPEzikqDSlowRFs/29oVpnJ5pPsf4D7cEDMDkoKsylF2bliiNbQ8CtDCFU/Vfz25dNHyA2CF1eMFgaQShDD1lBt5A9/L+GbpybaAw3SZoPY79Fyv3izZhBlUfuQU7/WFMq0B2hGrQNjbZlMWQhhW73n/Xh2RsGc9klvD4AKiEaSvW/gAtC20ir72J3imF05jA0ddhyS0WtTBW9Tyw2pX537nvuICdsbFEhWkHhHAQS+08ErPPpOQ+SwqINbhmIj3vxoPijGMAyDVthJBnjWFWw+bLKWBx5y7DEzbjhdodxTKcG8OF66s9uTZDP+nSmYRuHC0iumLD7lZsaHfH0uKTCWlUtavtVXfNcX2OA5Fqth2CA9sEDwKvNJJ2eLNXXo0LRZ6K5Wbu8XnAQ+PbePPUanzmeufXjvT91VhtJ5dwjkfob3YLEWE2aAakSR/wO4HS60YwJUSPfMFiDW4x4uYYhHsq08qtudnHM6z/JluSc7/QOONtE3uVJ3RPZP3xxoWmZGAhGryeotOA4L6GXxpfeKvfaRh0khUqONlLLbq7cLAZ20Vq4GplxhjgQrCzySzNMxEjVsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFKd09HMG8wcUhKVE1rS1dpVmkyYnJjbDFoRTViZERFK0JXTk9EM0t4VGFV?=
 =?utf-8?B?RkxoWGdkQ2xyMWxSU3U4WnBoeVN0a1pRZkVhenlwc0htSXR0ajBxWmF3ajhK?=
 =?utf-8?B?eUlUR2F1MGlPMDFwVkNqTXlPMEhXRTZQQU1jNlF3bFlYWWEyaEpXbUhWZ0JT?=
 =?utf-8?B?TW5rdndmdzdoM1o5WEwxZW5QKzhkZ1JldnZRRElqZUh4L2lPR0V6bG82MlZs?=
 =?utf-8?B?ODFmbVF1aThLQzNTWTI2b01aOHEzSGRyMHl0U1RmOXB6VDZwSEgxbGFKbGV0?=
 =?utf-8?B?a3hFZVZFQUtaL0JWaWNwZkZuVWVtdjh5cm5FVUJnZ1JPM29RNHgzY202Q0pk?=
 =?utf-8?B?MDlZbE9IQkpSS2taOEVvWFRVY0JEUko5UTdtajdzZWFvamRXUURnOXErUGIz?=
 =?utf-8?B?ZU9uOTV5OG5YdTZKV3FYVTB3S1VxbnV2UlE0MzZnOHZUT0pZRnNvaHhzL051?=
 =?utf-8?B?VlN3cVhWMXhhVmVlaGhzSXJ3NjBra2tOS0U1emVNQmxiT0QvS2RBNmNEZHhC?=
 =?utf-8?B?QU04ZHY0bW41WW56eTBXSEJ1VTl4OGR3S1BQR2JtZGhsTHJGNUxodlhlcklh?=
 =?utf-8?B?ck0vS1V5bmUwVGdNc21saXdxdm53U1YvK01SK2NzemVlcWtXZExMQUFobFRa?=
 =?utf-8?B?RmRiSkVQTG41RkVuVXZOWGdVT0JJc3B4UC9UMWlqdnZDSU9CQ0RCUm1JY0FU?=
 =?utf-8?B?cWx3RDU5T29MOEFsMkN1UUw5bXl2WVRtNHhRT2ozaUVFWTBURGVCVUdoS2VY?=
 =?utf-8?B?aTYzSHY4SWw5RHFOSnkweUhERGp0NkRCL01RazdnS3FwNHhqamsyVDJvcnhx?=
 =?utf-8?B?MHdtc3dMZ25SU0QvakFjbFlKWnJZOUZWdFNETWJjZ1FFZUJ0L2g2dUJSWmZZ?=
 =?utf-8?B?T2RWQ3g1d1lpUVMwWVAyTThjZ2wrRWRGRUNyeGdLajFzVk43RkdQWlF1Z2Q5?=
 =?utf-8?B?QmNBL3RKN1luMXk4TVFxalJhZ0I1T2FNa3NRTzRsK0RWNHEyNVd5OEQ3Sytm?=
 =?utf-8?B?YzBDcEEyOVpsRGhvZ2h0SWJ0SXpFbFB6RjFlZm83cEtydkdPd2kyME1sV3pw?=
 =?utf-8?B?YU9SZzhiL1pqTGY4VXJUUWFjWVV2UVo1Y2g3dkF3MnQrVlFkT1F0bTBXTmRM?=
 =?utf-8?B?Z2kzZ3hzYWN2RjUySDdQY1pYay9YUmVhREkwcTdqTUZOMzdxaHZTNTRkTXQ1?=
 =?utf-8?B?SmF0OE01K1NUS1NnMDVIanBZUVl2NGVZa3pWU3RtVnoyU0VNTEVueXdDSmkx?=
 =?utf-8?B?K1NOWUtkR1MwYldPTjhObEd0SldxalJkeUVrTmIxTTdIOVZLcEcxN3RucjVu?=
 =?utf-8?B?ODFYa2tjNlVrakJTWWtwWHNjVmtPVG9tT0FCNGtMTzZGNHFqbmF6a04vMzVZ?=
 =?utf-8?B?bEVhVkNVR0k4K011U2hWQjdNelM5TWpxRGQ5NkRyanhObUlVKzRqcWNVQ2VR?=
 =?utf-8?B?MnhJdHF6bUpGQzFOdDJOdTdwcVdlc3J1bUJ3dEZjTzlFMERHRVo4Yk5VOUMw?=
 =?utf-8?B?MEdsK0ZCR2ZocEhOL2xqemp4bU9oOExXekJoYjBrRXBNUncwelFFNS9ZNU45?=
 =?utf-8?B?UFE4V0tXU2pHNmQ5WXovRWc3T3N1aTJJNWs4WkhIV01vOHJ3YlVhcElFbFJv?=
 =?utf-8?B?UFlxTHRRWGJTeHBuSDlBRDVDWTUva2NzMGZnOFAwK0tlK1VpenhLNVYvVXdZ?=
 =?utf-8?B?MHN4Wm14dGQwMUVOVDAycktPSXkrRnFCTHlxTy9iS3lzbmlpYzhnREVNTzRS?=
 =?utf-8?B?c2JnUjRjZ1BaQjBxRkNQMHZFeFg5SkkyMHlhUDE1REk3RCs2Z3A0eTlaWHFs?=
 =?utf-8?B?UTJZQkRjSUcwWDZhUGxDRUVnVjdla2RlSTJlZ2tXZ3RHOVVOa1lZZE1aVFM1?=
 =?utf-8?B?V0lxUUI5NmNoUytIajV0L01yMDhLb1pKSzZnSjdGV2NMQi9MR2NvSVU5UFJW?=
 =?utf-8?B?U3N2MEFUQ0YzNko2Z1U0ekNRR2hBQnJXc25lRnpFbGRRMExTRjFLMUY2aXVp?=
 =?utf-8?B?emhMYjJ6SGIvb3VxWktkamVmblJBazRwaTBrR2ZBN0RKUEg2c3VqbUFwdTJO?=
 =?utf-8?B?TytWZHhXaitJUGw3TDdQM0JadU5ZZXExV2UwUWlrc1RlcHZaQUNGcDdWMzVF?=
 =?utf-8?B?R2EwM1hmMTNmcWxGVEprdGdQTm9MYXBXZFRzR3MxVWFSbE9KQnp1TGlZWmFN?=
 =?utf-8?B?N0VOblVJYXhDU1hkcy9QMlBlZ3d0MWtsaUZtVTlEVklaNTg0Q0N5NW5hTVRU?=
 =?utf-8?B?TmtTcmw0ejAzUXpPS3VTRFZBUVArVW0wZGV5enlZWTd3b0g0aGZJMllWN0pr?=
 =?utf-8?B?YTR0Wm1hNStuNWFIeGlVZFI5UmRJckxLVzg3dGlhajFDNldKTHZCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5905a34d-a72b-410c-bb27-08dedc2f3278
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:54:00.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8U70NtvPuvOt4gB4C/fNmq3MReo99XGY/OgFPI6xf8NRBP0J0uKl5VReOM4el1nzRgsG5O6onS5/OBsXcaCHwO+xvSdcPaRFn2cV6itavA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7728
X-purgate-ID: tlsNG-33051d/1783432447-BD5BC5D1-0F56EBF6/0/0
X-purgate-type: clean
X-purgate-size: 3240
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: D6C5271C296

On 07/07/2026 8:03 am, Jan Beulich wrote:
> On 06.07.2026 17:34, Andrew Cooper wrote:
>> POP_GPRS is shorter than RESTORE_ALL in terms of emitted code.
>>
>> By separating the popping of entry_vector/error_code off the stack,
>> SPEC_CTRL_COND_VERW doesn't need custom displacements.
>>
>> Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
>> PV32 is getting increasingly rare these days.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> as-is, however ...
>
>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -160,12 +160,11 @@ FUNC(compat_restore_all_guest)
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>          SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>>  
>> -        RESTORE_ALL adj=8, compat=1
>> +        POP_GPRS
>>  
>> -        /* Account for ev/ec having already been popped off the stack. */
>> -        SPEC_CTRL_COND_VERW \
>> -            scf=STK_REL(CPUINFO_scf,      CPUINFO_rip), \
>> -            sel=STK_REL(CPUINFO_verw_sel, CPUINFO_rip)
>> +        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
>> +
>> +        add     $8, %rsp        /* Pop ev/ec off the stack */
>>  
>>          jmp     iret_to_guest
>>  END(compat_restore_all_guest)
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -226,7 +226,8 @@ FUNC_LOCAL(restore_all_guest)
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>          SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>>  
>> -        RESTORE_ALL
>> +        POP_GPRS
>> +
>>          BUILD_BUG_ON(TRAP_syscall & 0xff)
>>          testb $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
>>          jz    iret_exit_to_guest
>> @@ -753,20 +754,17 @@ UNLIKELY_END(exit_cr3)
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>          SPEC_CTRL_EXIT_TO_XEN /* Req: %r12=ist_exit %r14=end %rsp=regs, Clob: abcd */
>>  
>> -        RESTORE_ALL adj=8
>> +        POP_GPRS
>>  
>>          /*
>>           * When the CPU pushed this exception frame, it zero-extended eflags.
>>           * For an IST exit, SPEC_CTRL_EXIT_TO_XEN stashed shadow copies of
>>           * scf and ver_sel above eflags, as we can't use any GPRs,
>>           * and we're at a random place on the stack, not in a CPUFINFO block.
>> -         *
>> -         * Account for ev/ec having already been popped off the stack.
>>           */
>> -        SPEC_CTRL_COND_VERW \
>> -            scf=STK_REL(EFRAME_shadow_scf, EFRAME_rip), \
>> -            sel=STK_REL(EFRAME_shadow_sel, EFRAME_rip)
>> +        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
>>  
>> +        add     $8, %rsp        /* Pop ev/ec off the stack */
>>          iretq
>>  END(restore_all_xen)
> ... both uses of SPEC_CTRL_COND_VERW's with arguments go away. Shouldn't
> the macro thus also be pruned of its parameters?

Not in this patch.

~Andrew

