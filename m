Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD7jAkCWnGluJgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:02:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0217B390
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239292.1540729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuaFv-0004NA-LD; Mon, 23 Feb 2026 18:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239292.1540729; Mon, 23 Feb 2026 18:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuaFv-0004LK-GH; Mon, 23 Feb 2026 18:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1239292;
 Mon, 23 Feb 2026 18:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cc93=A3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vuaFu-0004LE-5b
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 18:02:02 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0252265-10e1-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 19:02:00 +0100 (CET)
Received: from BYAPR06CA0007.namprd06.prod.outlook.com (2603:10b6:a03:d4::20)
 by IA0PR12MB8747.namprd12.prod.outlook.com (2603:10b6:208:48b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:01:53 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::fa) by BYAPR06CA0007.outlook.office365.com
 (2603:10b6:a03:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 18:01:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 18:01:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 12:01:51 -0600
Received: from [172.29.61.144] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 12:01:50 -0600
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
X-Inumbo-ID: c0252265-10e1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfWJ02KCOje2+q5J0HakVqiwOXO2ZQwgIq08ttJvLajebxKMBk8LuYtQ9bHoVx71HFCIahGJhJN6hy9Fq7Hy137u1KykJ/leAlaaRLFCgJQ6n/ljxGx0ZtIecLzT2iavwDEoSzgRTPsR5IXZ2wmB1Qwqn5ZJ4N8RRh+6klCy5djfFrLvxtHQn+wj3F0cKLr9SGdfHt2IiF+FusN9WUhjCoacp6HB8o7XbK1XRAWgNjnpsbipv0Q1NBTN2P5IgijHw/Ei9WL7krzdg+NXYGY+EceQWb79L4bbYY3zakdr8wKmRkCg4QghovAWmFIKFV0LXIGwRqMtXGRP1KoX195bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7prGWXpcud7zodgdqdXLoIDodLrd6uyeQ52pqsTLsA=;
 b=n/cJdREWtoBXyn5yu93JuWnpE0eVWnUSzF8atqM40cS6+WsQjOeoe+oOg0KnoYb5q4sp9XsPP7RDttyRDm1EJsc18F5qgqEMcJyqw5nRuh8sICSSNdNHE0bGtgL0WzOnexuPpxSSQuRXXzqY48QHxSMYy76n0Ye4urKAe0Ll8Ll7y5JZ0V0RMGBstymBHhZRVcfLPQzR/p23lcBjaGfy4dmJsq9itrUvpu4DUtoIKYbA7JBMh29dxcdcR172Zd9ywwqICF6NAi+kHBOz4yZTtqDt2IMKvSEedXMac99WcyNBapE7aOGcAeGa9MZRUiW7OpFkCUct6Lo+QP/Irjzwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7prGWXpcud7zodgdqdXLoIDodLrd6uyeQ52pqsTLsA=;
 b=K3ZH1+78R+z/8pF9iJrV/10kuSTb2rCI9SNoWfxk+H0iI7KGwbLcqIc8jx/HbY3mTPedWAVRjMaBj1+xsJwyEP8s/+RZ34fKqDPgfftQtQBV7lSXHxiHXw9uRXH6YGCq2eAKcD2U9LMV2rxwA6igwREzUJldpsNLhHbvoUShcwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <082425f5-2d05-4db5-b2a5-d8a621302f9b@amd.com>
Date: Mon, 23 Feb 2026 13:01:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Chris Rogers <rogersc@ainfosec.com>, Dmytro Firsov
	<dmytro_firsov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <e402ca27-75ca-4046-8e30-305c1c8d3db8@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e402ca27-75ca-4046-8e30-305c1c8d3db8@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|IA0PR12MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: c2852001-5f59-458a-c740-08de73059f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVhHQkYyblZCVmFYT2xHSkpRR1VHdkhNb0g4ZURFdk9qVjlYUFRzWTgrSlNJ?=
 =?utf-8?B?YVRER1FmTEVhUGVFM1JNcEMxczQweW1pT1VkSEJyUGZrQy82L0VnM0Q1Q0Va?=
 =?utf-8?B?R01IampDbkpvdjVmWVJaODBjczQzeklmeUgvOVZoV2J1aUh0QWNxSjVTcytW?=
 =?utf-8?B?K0dWc3VZeGVENG5OUmdRclNSWVR2dmtUbzlKWXRJUHpBUnFGM1I4WFVzelov?=
 =?utf-8?B?SWVscFFJS3R1bzBFaUpJSlgxVnJqdC92MXJ0dWlGNDNDTERDQUJkQzdBMVly?=
 =?utf-8?B?UVdUcllqUmtCRG9CTmNwT2R4cSttM210Z3VxMmJKbzJzUURXMGRTMnF1TEFv?=
 =?utf-8?B?N2FNaEpaOVNnbFdGSmVPZCt5RFdhSE1kcE1xcTlhUkxMNUpxMkVYSm5ZMlN1?=
 =?utf-8?B?OEZ5MXdablJTaithbUw4UlRSdXJCRzgvOFJNR1lnN3FCTUtVajFNN1Y2RUty?=
 =?utf-8?B?cWp1RDVrVWMzZ2hSV0dnTGU5eWpoamlXeWhKM1owaDl3clhPQ2ZxRGxtQ25V?=
 =?utf-8?B?Zll4dlphRDJXWHhmQkE5ZDhhOHMrMjVTTkMyLzF5WXVhVVM1aDkzK2RoQ2E3?=
 =?utf-8?B?SFV5QVhyZ0FYbXVMMkJpdGlpdmgwckV0NTFYdmZTQ01QVHpFUlRkZU1xSmM3?=
 =?utf-8?B?NitMN05sSy8xUWFKRnkxcjM5THpBaEp2N2VLY2RYdXFWVy9OdjZOZTQyeWxx?=
 =?utf-8?B?VWF0QWdsamtiMVZyVWdqTkZtVzFkbjNJcWJqYlVUTGlmTm9ObGpaNGdMK3Rh?=
 =?utf-8?B?WlE4YUxoN1UycXUvaWRSSWFuT1ZQNVJwSTJwWEVGOXlXcktVSGp5TlFnamk2?=
 =?utf-8?B?T3dkN09KVGF2am5JdkRzMFNlbnBqTmRONzlTcmhtSTR3OFFCYmUzSGFVQ3l2?=
 =?utf-8?B?UzA1SmhLYVlyU1ZSaStrd2lyYkZFTDA0Z05kRHFKYytZQ3JzV3lwS3F5Qlpr?=
 =?utf-8?B?NUVIdExBMXJjdlMxczdZRGF4cldTRitmYWdJc01udEh5ejhrTzZST1BvT1Q2?=
 =?utf-8?B?M1dZMlFpVHZwaHEwUi9iUVl0ZFlBYlRjNnowdWhQeHJHc1pSTGNqL3hmMU8x?=
 =?utf-8?B?b1pVdER6VWs5UGUyWmppaThnT0diUG9iM1JaelVZVVhVK2o1NFZCUmJpdElR?=
 =?utf-8?B?M3BHMzh4cklvVS9meHo0b2E2M2x0eXA3S1JlbUwzU1RMTEVncWc5Z3Z5VE1O?=
 =?utf-8?B?eCtUMnVXNnVHWnFTVWpwTmNINlBjMmE2WXJTd2VibGJZT3p0UmhYVGVrY2VM?=
 =?utf-8?B?bUx4M292elhHNm45WDhCMXc1dnBWWURGRE5RNFJVVEMvNFZSNll4K0xoQ1Ix?=
 =?utf-8?B?cUNSNndsSWU1UUhuTnN6aEZSTnlYMlRvSmhtenUrUWg0UjRYYkx1dW9FZTdp?=
 =?utf-8?B?M0lUbW01Q2RTdWtSdFY5NENNRVRqeUNKMGJpd2pnMWpraEFlQWxYQnJqQXJj?=
 =?utf-8?B?M0pPV1NNSDV6UDBGVzVFWEVNdWtJcFMrRUlOTXNwbWpuN3UzMHZET1dWK25V?=
 =?utf-8?B?emsxcGJPcHF0TXFsZFlveVlvUXIzcW9TS2o3N1hpSVR5YmoxY2tMeHk5U3RE?=
 =?utf-8?B?TkgyQWVmQ1VCd3QrL2NTTlhGYXpJRzMraVN5aTRXU04yZzZrK2ExYlhPVG9P?=
 =?utf-8?B?elFUdWdKMHJyK0RMMDErWkRLR0oyM08xMnlTazVBZ082SWRiL0sxNjIva0U3?=
 =?utf-8?B?ZUZScTJWRVpUZWRWYmlvQkNPK0tIVk1iTTFsSGU4RDlacHRBN3MzaUZsTHBu?=
 =?utf-8?B?bHpVNnBzZkxHUSt6Ry9Ib01BNGJNZVVXNmhqd0pVVWlZVlZFamVxckUrS0lS?=
 =?utf-8?B?NnZmdDNSZ01LWVZkWDA0SlNGSWRQVEZqQkM1ajV6eHNzNFVTMkFIMHIxUFFL?=
 =?utf-8?B?U1VWOTFWa2tUZXVOSUFSckRHZ0lzTzFCYUtMUml1WVM5V2g2czBpY1puM2V3?=
 =?utf-8?B?MWdQS3hKSlcrRlp1NGlZSks0YlRoYjI1bHB5NXdYKzNOdmhRRzdWMlgzTVVN?=
 =?utf-8?B?KzVZM2ZhUHdob1pzbDNRaFJFN1AvUnlNc0w3TUVrWjFsUHU3N1pWbEllU25l?=
 =?utf-8?B?QWJGUGpGRm80TUx1VHo1Rks2UncyS3VESnJwQU53ZkNVbm5OcHNnNXc1N2dC?=
 =?utf-8?B?MWFBdzQwYUZHRHdMUWR2TWMwUDBJZVJpaDJ6dkdLeFRCZ09XaEVmY3pJUHll?=
 =?utf-8?B?NWZCUjlha3YxNkN2UytDb2FsRWZabGNGQlRxWExXVGVSVERVVE5mazZLd2lj?=
 =?utf-8?B?V2tqVHY1Kzkvb21SL3FDb0w4SXJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P3VRqilRBesdkW6h8F2pz0GVOe529CZbIonra0gFf7CwMhT92Uj9K0ZXr5xW4Bqr48T8LmdChKGMxVKDQWm03efV/udOsNXqVz7NRwoBh+eZWt+KmMqJjUaEjRWC0kMH8sl+Gwt+pIVbLE0I5BBjgy10QzVeRvd/BmQj9HhNfiuIhkdto81bglZMsQl1jQHVXl49bAUj904HH+DIy8l+acKzR7UPUyYxQTSDrzUa9u5XAOC1xjDPoiUbK9p5se7XANo6D5LcuKNeFGVHWmfp/0EEIRHYmO4KBYXc5n+mPIgrdXufR6q++UBrpf1gjiRYA7vLaAAgU86B/l0HG+dP9nuJXj2qzoPjlrsjfUCXDnKusoACcfwc+UzmjRKrzXQMRrA1QjIfVFG1lAulTkU6tCzN29MsObaLz3mBMUNigbZfQFwb3rMnqJgj2XCgl0mo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:01:51.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2852001-5f59-458a-c740-08de73059f69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8747
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: C2C0217B390
X-Rspamd-Action: no action

On 2026-02-19 07:15, Daniel P. Smith wrote:
> On 2/18/26 18:04, Jason Andryuk wrote:

>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>> index 29a7726d32d0..2eedc639c72a 100644
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -860,12 +860,9 @@ long 
>>> do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>           break;
>>>       case XEN_DOMCTL_get_domain_state:
>>> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
>>
>> With the initial NULL deref issue, I wondered if this wouldn't be 
>> better off modified to drop the d param - 
>> xsm_get_domain_state(XSM_XS_PRIV) - and changing flask permissions like:
>> allow dom0_t xen_t:xen get_domain_state;
>>
>> That would gate the external call, and individual domain permissions 
>> could be checked with xsm_getdomaininfo(), or a new hook if you don't 
>> want to re-use.
>>
>> But as your approach avoids passing NULL, it seems okay to me.  It 
>> also doesn't change the flask policy, which is nice.
> 
> That's a plain nack from me. Whether it is viewed as a pipe dream or 
> not, my goal continues to be to work towards enabling the ability to 
> have a truly disaggregated platform. In the original architecture, it 
> was envisioned to have multiple toolstack domains, each responsible for 
> a distinct set of domains. In terms of implementation, that would mean 
> multiple xenstored instances, each with a purview over a subset of domains.

I don't think what I wrote is at odds with your pipe dream.

My main concern is passing NULL as a domain.  I think that is wrong, 
beyond the fault seen on ARM.  In domain_target_sid(), I think the NULL 
dst was mistakenly matched to dom0's NULL src->target.  src->target_sid 
is 0 from zalloc, which is not otherwise initialized and invalid.  That 
is returned.  Later when sidtab_search() can't find it, it is remapped 
to SECINITSID_UNLABELED and returned.  That silent remapping is dubious, 
and it points toward unlabled_t should never be allowed in any rule. 
Maybe it should remap unknown sids to a dedicated invalid_t, but maybe 
invalid_t is already supposed to be that?

Regards,
Jason

