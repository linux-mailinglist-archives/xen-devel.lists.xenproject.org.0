Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zsGiDylTT2oBegIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:52:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE0C72DF5F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=KGW00p6J;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357649.1612025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjY0-0003MK-MM; Thu, 09 Jul 2026 07:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357649.1612025; Thu, 09 Jul 2026 07:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjY0-0003Kd-JT; Thu, 09 Jul 2026 07:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1357649;
 Thu, 09 Jul 2026 07:51:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whjXy-0003KW-R9
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:51:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjXy-00CYOi-7J
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:51:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f530c-bab6-0a2a0a5309dd-0a2a45059828-32
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:51:49 +0200
Received: from [40.93.194.12]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f5314-3cb2-0a2a45050019-285dc20c8b58-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:51:49 +0200
Received: from BN0PR04CA0103.namprd04.prod.outlook.com (2603:10b6:408:ec::18)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 07:51:43 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::9) by BN0PR04CA0103.outlook.office365.com
 (2603:10b6:408:ec::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 07:51:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 07:51:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 02:51:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 02:51:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 02:51:41 -0500
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
 b=O+zIaUAl8ZYgmZfKsY3FWXT6HqRO4yR7b9IG0wI1Pvo5nKZ2s0lMFW2tgTEKSgaHQrcgrsjO2oCry6Ryakqw2Ash/ofT4onFQ9TwPw+puxHGS+qnkULEGIxPESqa8+IwBKZUZDQVbptsJd7eQZYsLpaCeRfGbp/GWgrqDRnwi1Shq6L84hF3LCz/cEmQuex+HVuTTrA2W+Yt9hUdmBsVZHCqpvoZpxUbaRb4e+vSjF8Hkvl8uObxvFAVYTq/3ovy+dcSO2hUJB9YEW2/DjvpFn8jPZ+PcPNYKQWhPFPfNPxRzU5Tj2Qs+MOIipE39eivr/3IU4Ga4+Guj36M2DdomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdlTnJuCuSRZkqPm41++rOHaV2UyzJiUg7bv8itQLEY=;
 b=Nqsul5yVuuD4tN6EPYzfX1KE9G6nrNNWivpV0GeqF1iOMCSJTcb5HI/TQp130b34hagvNpKqzLT4g7fFVWvieVdqO3vMX1xIbdGpC1GOP4igpJKBLSJ37WDSBaCU6xyZkrc6qyMinBtwCnsgFDZkhn5MOg/UL9LNZnqDpGEsWRY87MHRLHu9X36qJgbRiuaOcSffMddu6A4z5W4A9AN4KzoYSulCVfGVBpLzLkgvZKWCFBvKFHG1pPOrMzowtRbg0mu40ZHbxtBLai3RuNmDMtBv89bjf4WfOqVjUV8T6Q3p4vjVC/nnVx4Ivp6NNWPg5fVLYKUntIjQ10I3L48oSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdlTnJuCuSRZkqPm41++rOHaV2UyzJiUg7bv8itQLEY=;
 b=KGW00p6JdduNopdbkwFGIDXNOGYydFBGuhMV//k5C0hTZHFog6aSxIwwaWLtru8fZgut20br4UP90nTPh8WBxpUvc5p+fa8qqPFh43TSOBAZtSWhdx22UNUKyI5nIvC99ODzMUpcg8Sb4J5IeKcWvgodSFYlcl1UKxONNFyL4Mo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1991978f-3d3e-4d23-8583-047ef9797d65@amd.com>
Date: Thu, 9 Jul 2026 09:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Jan Beulich <jbeulich@suse.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
 <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
 <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
 <ec7bc0ef-e267-4240-ad73-13dd17e1575b@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ec7bc0ef-e267-4240-ad73-13dd17e1575b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: d6111341-ed30-4ce1-0534-08dedd8eeb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	zRt3SDdMHHO3FzFoZg7vbYHYah9wjJSoxgx5DBh4A5ImNmzeBKJzOQ6jZ4WZgAXgrzce2+IeM36asGXaFZOYQZQH33onflpoNKPbYPNMYH/qjrcAj4gUkrpJRd/noUzVqgQq6G4eAEhJogjqAbOsPetDg6GJaDTeIMfoZjx9BN4cxMREExeHE+YwfF+KEsrvlnUmlCQus/gomxMqrhhRizEtK1PnFqqTUQ91yOWSTzItzE5a0DTU/e4P5mz7zSYwAG/FUSrtl23AssZmyNYqWFCgYMgmIwJAYXt4f6lVf/zgd/KUj0rG4OvC1urT9Gm8yC53wEQBqh1z2BXjWiPj5p2eNpHMfEXImMpQl4jmZVWou11siXok5sgBKkzN4oCEomD8txOnt0BzKNUaGv4/BaSidTvYpto5qYYjT8b84dGctecQo2CnQPIpuzK2e83SKFZHf9i1n0pYwxXk8S6H0Vf/yYE0WB+16Wln7jZ112JfOwKKSqsi7a4HA8yACtGKomPISbwOXeCUbZOn7r3hUV20Va+lUpC4EkBEm1fzJpLh0iArYSDENGtKbpkVgduQbV4bn9vinH71yTUs1KQ/0+ZnQK1eShhopLchxKhaDFverzYZud+6IWmSxSOrU7pC+6fOhfDQ3AUFKvmtn7BvySGZHl2lwMxkHweV+E183aoSTHw164ZxxtzrhPjmNrAqB7Etco9xrvhWS/puGTFZjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qztB/PPW13TxaGWEHW8hDVIOFnDME1g2XqX76okEtsc82a0pimPHZaeoNXg+nlvm8MUCwlRYaNZeozm/0QzSk6yWjrvnHW7Hp1ACqzmpv8mQhF9sIqMcn+anmEQXrfcXT4A15v9VdkesRU8TOkGJC5lFAz+K7KPogi6XaFpP1fQ8nHQ9+YJ/xNKJqRZqqGzWSPjsy1jvQqgY8ORyOsk1GCARC9PTR+twKaXiX7YjNvbRESq2HH30UGA9XOZAcxQEQ7X70sWDpviSQTaEWs7FiTBQU7F2X7/sOrxuLsX98fnBD4pnPQ0gIsYAqSk9sIW+Qpcv2YxAz41EITGKp6taK4bbWi0D/rms7w6qf6O4w7nm9pCjk8dmVb9sIw/VYRou5a0auo4C2zcuHKGasjduljbLTyMlgDoj0kzah57FS4KCDmT85GiAIP/iCKYL7V4W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:51:43.5492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6111341-ed30-4ce1-0534-08dedd8eeb4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
X-purgate-ID: tlsNG-c201ff/1783583509-1771B2B8-BD2184B3/0/0
X-purgate-type: clean
X-purgate-size: 2895
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE0C72DF5F



On 09-Jul-26 08:57, Jan Beulich wrote:
> On 08.07.2026 19:04, Dmytro Prokopchuk1 wrote:
>> Hello Jan,
>>
>> On 7/8/26 09:15, Jan Beulich wrote:
>>> On 07.07.2026 18:08, Oleksii Kurochko wrote:
>>>> On 7/7/26 5:16 PM, Dmytro Prokopchuk1 wrote:
>>>>> --- a/xen/common/device-tree/dom0less-build.c
>>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>>> @@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>>>>    
>>>>>        /* xen,reg specifies where to map the MMIO region */
>>>>>        cell = (const __be32 *)xen_reg->data;
>>>>> +
>>>>> +    if ( (address_cells * 2 + size_cells) == 0 )
>>>>
>>>> Considering that this calculation happens second time here ...
>>>>
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>>        len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>>>>                                            sizeof(uint32_t));
>>>>
>>>> ... I think it would be nice to calculate that once.
>>>
>>> Hmm, originally I meant to simply stay silent here. But now that you say this,
>>> I'd like to express that I find this 2nd calculation of the same expression
>>> bogus. If the goal is to deal with both values being zero at the same time,
>>> check that (and nothing else). If instead the goal is to truly prevent the
>>> divisor expression from ending up 0, that (and not a shorter surrogate) would
>>> need checking. In particular, the multiplication by sizeof(uint32_t) can
>>> convert non-zero to zero.
>> Yes, you are right. Need to check whole expression.
>>>
>>> At that point the question then would be whether overflow (and hence
>>> truncation) in any of the involved expressions shouldn't also be detected /
>>> rejected.
>> Testing zero is useful, but not enough - the expression (address_cells * 
>> 2 + size_cells) * sizeof(*cell) can overflow and wrap around to a small, 
>> non-zero number. Source code analyze showed that Xen only supports cell 
>> sizes of 1 or 2, and there is a ASSERT_UNREACHABLE() in dt_read_number() 
>> which prevents from using wrong cell values in DEBUG builds.
>>
>> I would propose the next checking:
>>
>>      if ( address_cells < 1 || address_cells > 2 ||
>>           size_cells < 1 || size_cells > 2 )
>>      {
>>          printk(XENLOG_ERR "Invalid address/size cells combination\n");
>>          return -EINVAL;
>>      }
>>
>> This will cover zero check, and overflows.
> 
> It'll need to be the maintainers of this code to judge whether this is
> appropriate here.
It is but I would prefer to put it at the read side, not at the use side. Place
it in scan_pfdt_node() after `size_cells = device_tree_get_u32`.
The first call to scan_pfdt_node() passes defaults, so it is ok.

~Michal


