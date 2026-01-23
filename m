Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLRBJdeXc2lgxQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 16:46:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95777EF0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 16:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212359.1523547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjJMT-00036U-QA; Fri, 23 Jan 2026 15:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212359.1523547; Fri, 23 Jan 2026 15:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjJMT-00034Z-NW; Fri, 23 Jan 2026 15:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1212359;
 Fri, 23 Jan 2026 15:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjJMS-00034R-Lb
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 15:46:12 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc0d134-f872-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 16:46:01 +0100 (CET)
Received: from MN2PR20CA0022.namprd20.prod.outlook.com (2603:10b6:208:e8::35)
 by CY8PR12MB7732.namprd12.prod.outlook.com (2603:10b6:930:87::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:45:50 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::43) by MN2PR20CA0022.outlook.office365.com
 (2603:10b6:208:e8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 15:45:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 15:45:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 09:45:47 -0600
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
X-Inumbo-ID: 9dc0d134-f872-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr5YHswiZpGDA5xBQzDN8ufrOpLLhqwLjQrZJCgFi+mMhCjWt+zmN5TEre3S4a936jYe1wPQ84nLZ/KLgZNIue5tpT70XmRkbQQ9hoYLLVFOnIJVsVPpwzIeUAgGCXnwhcQUTxKqcWefYi1I0SO0xGy5MDSswoDdm7mklqkDVBNE3HK8eS812ra0eeWnebIOHOtILN/xNfdBUQiefcoJoVG/9vvzPJ+AV47MRxwIyEjeqRMS10gDMciY8OTnOasTTl0C5j0rwQfQymlfbFmqSfT0UVRVCZtdU7tI2sMk2px9w/Q9zddgYKRghfht2IYiUdkxMPGJQ1nXOtbQfY8Viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2LZgz7RViTFQaAZafDex9Ohmlv4WcCjsBoF8X5oCxc=;
 b=uCiUQye0QHdiPUGZT5PzS3ad2jwyzULm2++HBzgi8+x5y3L5l99EtVIewfTS6R8lc5UINZnIhTIz1dF53W8IIVzQsu+IJgwJ7kLqamhwx0FXOzeSyU6Whzsd1pWZLqwtYABJvLHb/Z2TzY1bh7vX+pwTPl/LACJGiIAtQgMyXZMpNW+Pbu4G2XQ3rQX4P7Uvx4cPxQ8/kZ9MAw2JS8B777RgrgpuEvD/qM1AKZUVjbpMMgotpHcAJGdX6IWTzCwwnoP/TWzTFTwOiJd1oeYC5dAc9VHyo/8Incs7HKpP54bYW6ZEbnTLj1RKHcdgQ3WB0qqLCjOCFwpPOewl7KDWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2LZgz7RViTFQaAZafDex9Ohmlv4WcCjsBoF8X5oCxc=;
 b=s/IlRmSxivbU/i1jlCidWu3M0LCBxThtgpSEppB1jnuik2RxcpqeUe3AmvpRqKZDOOd/BFHe15sIS90K0zrdS5DwdYoU/EN0xN9uciVktZPzzVG6o/HYyPFKLTsTsOpWlblkPhZZg4zUagTpjU1IvaXvUy4v6WBXMCaF/j75Vtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 16:45:45 +0100
Message-ID: <DFW330TRCH3U.3K3D0V9R25IK8@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
 <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
 <DFVYHZSG5YAX.3U4HA3MGMT19C@amd.com>
 <c7b98309-849f-4a8f-8898-7e7c0dfd04a5@suse.com>
In-Reply-To: <c7b98309-849f-4a8f-8898-7e7c0dfd04a5@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CY8PR12MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 565a83ff-46f3-46bc-68bf-08de5a967b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dy9hck12TmdxemVGbGE2TjA4N052eEM4OUtoblc5K0dXRFpGbjZiQWFXNWxj?=
 =?utf-8?B?OUJIL2l2TDRKTkVOdjNySnYzNnJMTDEvTFNMc1hwVDJkSmd5QnBFRzZsR3U5?=
 =?utf-8?B?QTJ6cXVvUWFlYlhzY3RXeWJCbGdLY09zUXFRSWdRTHdlWGVIOE5wTVNSZHZD?=
 =?utf-8?B?cnAxbm81UGZEZmZDaUtaL2tHdjZIRjZUVkVWZEpBSElaV2V2Ukp4Nm51NXgr?=
 =?utf-8?B?QTNaMFFFVXJCNU1rNk91UWM5RzFBcWM2R0trdlBKbVVjcGc0cmhFZVZJdksv?=
 =?utf-8?B?bkYzUDA2a1hxWDlNL2VTNU1pSFBGVlh3a0FpNmNzSUkvMXBudTRmQVVCUGds?=
 =?utf-8?B?RENQZVJYSVgvL3U0VFpKcjlhMWlDZzNQa0g3RVRSRTN4NkZhZjJick5tUGhC?=
 =?utf-8?B?eG55S3BCV3Q3dlRPT0dvK1dhenJIUmlpbzVFZ3FiOVJJclVaMUNCM3NVUzJq?=
 =?utf-8?B?YUtCa1FzUEtGeDlxa0tLNUg3aE5kRlBZQ0JGMUZpQitoWWxPUXFRVkRIU2ZE?=
 =?utf-8?B?NjZCSCtmcWNQMytTYW14MkFUSFB2d3FJNlpGUjBYLzRGVHhwemZhM0NmRnpT?=
 =?utf-8?B?NEZMOTh3RlBlVDUrTGZzZ1h0MU9FeU5qeFlROEhoVEwrVyttR2hvVzk1b1Q1?=
 =?utf-8?B?bVhXd2dlRi92Ny9TRStoNkYvRXpTT1RuUWRNdVgwN3Y2bmRodWRhL3dBNFlK?=
 =?utf-8?B?NlpVeEZHRG8vcktxKzVpL211V3V0ZHI0Wno1QnZxTUY3R0wzZjVjd2p1WGxW?=
 =?utf-8?B?YUxJcHlOWUFUdmI5SG1Yd0REZ1BCU3Z1clZHSUdsY3huczRnQkdVdHoyZmsy?=
 =?utf-8?B?aFJ0R0FnZjFXdXlJYmRrRnBoOFR6RlB1bmxzLy8xbkJOUnlkQVNiZ1hEZk4y?=
 =?utf-8?B?S3VCbWFDRnlPdDhXaE1BYUlqSHdVNWFwRTBZdzlaUkRzMnlUZ09kaGVMQTFq?=
 =?utf-8?B?NHJPWGRodUxpOGVBRXIzOWQzUXdZbVJoV1dJaEpTU215dkdaRHZSKzIvYTZz?=
 =?utf-8?B?NDF0UmZsbzZKclZNYVd6S0tCM0hBbDE1akYxUkRZREdWMmduZTJFdWdsNXZK?=
 =?utf-8?B?eWdUajJ6N0tlcmp3Y3Jvazc2U29scmJoaXpnVzgxbWdETi9LUjhKbzRVKzMz?=
 =?utf-8?B?eDhUV0o0c1k4WS9NbXMzK3lIOThHUTFyMzExRExLTFBleUlPVVdvNWtRbk9u?=
 =?utf-8?B?b2QrZ3M3azNidVBoYjhOa3BWNjZvenJJVVNxNDVpZy94ZWM3a0wvRlFidElK?=
 =?utf-8?B?MnRhVTd0RGdOQUQ3MUJsekxuRWQ5aWlZeDNDWlEyK2lGMUx4NVdZQWJQaTZZ?=
 =?utf-8?B?bytqakhLazV4RlZxeGpHSnlWSmNuSDI5YjV1ZUI3eVI0V1hKSHh1OW9sRUFX?=
 =?utf-8?B?SlRKNzJFNmlITmRXazZMVHpPK0RNcWtadzhraE9rcmhDRloyMFU1TURTR1Yz?=
 =?utf-8?B?b0R3WGJWYlpRbGR1aWNPWHUzVGRqcWRmZHUxckdVbmNtK1g3cDY4QnZDWHFa?=
 =?utf-8?B?ckViYkRobmc0V3d0YUdBMDM2S0pMYW1vS0RwdzNSdFB2VFl2ckNXNC9OQkJW?=
 =?utf-8?B?ektNZ0RmWDc0Y2lpc0N4V0ZOUDZXQ2tVVWRtdWVQTHdxRzd5aU4yQmh2aVF3?=
 =?utf-8?B?U1pOVklrVkgvTGZNQksvYndheThWQUlqaW1ZUXduSVlsdXRBNHN5QnpRZDJh?=
 =?utf-8?B?TVpTWDhKMFNLRU1EN1QxVUZrZGFDZlZTTkJBOTBRZlkxeWFhK1J3Vmw5NkUx?=
 =?utf-8?B?ZFBuOGw1WU9BVkNqWndDTE9FbSs4SDNIbzdJdTJ3U3B0akl1Y1Bhb1ZvTk83?=
 =?utf-8?B?bVhpQzBYVlZZNGNEemhnWTUwM2pmQUp1WHY3ZFRUamVYYVRzTi9iNnZPOHdS?=
 =?utf-8?B?cGM0eS9STXROMVlaVC9idDlEa0hUQVVrcERIeTJ4VXBKTVlPR0MrZVU1Smt3?=
 =?utf-8?B?clJVNnp5KzFKek9qRlQ2YjZwenZtQSticGpWRDRtK3FnTWpHb0EvcUZiRDBu?=
 =?utf-8?B?TlU4cTRiQ1hud0xaMUs3b2NDbnN1TWtZaGdxeVFPVHFVNkNVdnBMS05iUmk4?=
 =?utf-8?B?bWcvRXNCNTNzSlBxLzhuZU5ucFpBbS9QdHJmaDFJOW5NbzhFTVk3SFpaaWlr?=
 =?utf-8?B?VkdaeThGdERtQS9VRHlLblBXSU40aG00Mmt1U0tCZmozbTY4eW9xaExnSTdB?=
 =?utf-8?B?Rms3K2diTzg1enY0Nm5UdzA1bTkrWmZ1MW92by9PQ0VxYitiWFRtUXhZR21E?=
 =?utf-8?B?WXBLeFVrcVZmSFBMeHVxS1ZmUEJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:45:49.6487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 565a83ff-46f3-46bc-68bf-08de5a967b82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7732
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,amd.com,vates.tech,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.967];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EB95777EF0
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 3:05 PM CET, Jan Beulich wrote:
> On 23.01.2026 13:10, Alejandro Vallejo wrote:
>> On Thu Jan 22, 2026 at 7:16 PM CET, Teddy Astie wrote:
>>> Le 22/01/2026 =C3=A0 18:44, Alejandro Vallejo a =C3=A9crit=C2=A0:
>>>> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>>>>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>>>>> Open question unrelated to the series: Does it make sense to conditi=
onalise the
>>>>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>>>>
>>>>> I'm not quite sure what you're asking here.
>>>>>
>>>>> ~Andrew
>>>>
>>>> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP=
 as far
>>>> as I can tell. The question I'm asking is whether there is another cod=
e path
>>>> that might invoke MSR handlers for non-intercepted MSRs. I can't see i=
t, but
>>>> I'm not sure.
>>>>
>>>> If there isn't I'm considering (conditionally) getting rid of them.
>>>>
>>>
>>> I think you can enter this path by making the guest execute directly or=
=20
>>> indirectly a rdmsr in a emulated path (there are some cases like certai=
n=20
>>> cases of real mode or maybe vm introspection). I don't think that FEP i=
s=20
>>> the only way to do that.
>>=20
>> For the emulation path, I think HVM_FEP is the only means to trigger it,=
 as
>> neither {rd,wr}msr access memory. VMI (as you mention) and nSVM (as Andr=
ew did)
>> do make sense, but I don't see any others. I don't see how real mode cou=
ld cause
>> anything (I'm fuzzy on VMX, but I _think_ instructions do execute, just =
in
>> a weird paging-on mode akin to v8086).
>
> Iirc there's still the situation where for PAE shadow code tries to emula=
te up
> to 4 insns in a row, in the hope to find the other half of a full PTE upd=
ate.
>
> Jan

That's a rather obscure optimisation, thanks for bringing it up.
multi.c:sh_page_fault() is rather... opaque to just look at it and expect t=
o
find anything.

Cheers,
Alejandro

