Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tqv9E3dtT2ozggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:44:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B665572F152
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WrtpBSvr;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357764.1612115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlIl-000539-7G; Thu, 09 Jul 2026 09:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357764.1612115; Thu, 09 Jul 2026 09:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlIl-00050s-47; Thu, 09 Jul 2026 09:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1357764;
 Thu, 09 Jul 2026 09:44:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whlIj-000507-BU
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlIi-002Gah-OJ
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:44:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f6d67-5cb7-0a2a0a5109dd-0a2a450bb26a-10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:44:12 +0200
Received: from [52.101.201.27]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f6d69-ac48-0a2a450b0019-3465c91ba7b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:44:11 +0200
Received: from BN0PR04CA0208.namprd04.prod.outlook.com (2603:10b6:408:e9::33)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:44:01 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::97) by BN0PR04CA0208.outlook.office365.com
 (2603:10b6:408:e9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Thu, 9
 Jul 2026 09:44:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 09:44:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 04:44:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 02:44:00 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 04:43:59 -0500
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
 b=u60MiRfufEN7TZStImgy84qqwTb6XX9oigTH0TMWYQ1Wt0Tvwqc4JSbAJTUZZifHr1284dkPD4Bntw9FVGIH4z2XlI9RqcJ0T8w5XLaS8GX6N0CkRPhc2/LEhdWYP24l8GeaHeIOcHgC3H2UDBoPRVwSkPW3EBgY+wkDaJ6ED67KWGnM7xX5LVkUoCJLJjEteGWPD859nbrZrcxdpZPVuLIb/mBCqmOGq5Sj/idVC2o7y4jq1bnUJElB+JIx3cKKn6bou8CkcBnpvy0PdQd8lJM0J4/0vtbi3SqwBySVk1muF0HpFib4X8tXQFsn9m2eD33io6YW/R0wW24PFCu9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76a5sYqenz7eXKb6nlRklAPVHPeXXn+8yt038HKBkeQ=;
 b=wWJRmxwNlWc5/kiuzVO3Vy3KiURKoQbH7/AIMVBRgiI0bRiQtharTZqqvU5DieWIFxJDW6YOiHgZ3mbBceOlE8gBfpzKcbkClRj0EL0JV4DMAfFPe4tJpLRy65Fw+RikX4oP74tmw9D+2kXGxmX/c9QLOOnvl5E3NIcDWxY+ng2/Uxfjiz21Pqo9U7qaIrt0QXfkvGd4stv1r+4Gr/SFAL7JJRX9QCSQqrNFL9YxXPrYQ7rSorGPCHD9MR+kVa60hKqrwWnaDXtdPi0qGkhcoH+A4cN8YXAse6KBEk+s8XP789Vl8MyV1e1xR0c08FOXGqis40xYbuyurgdE/wOgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76a5sYqenz7eXKb6nlRklAPVHPeXXn+8yt038HKBkeQ=;
 b=WrtpBSvrfjMbG1TBPBMHciZE0U3fboHEISGUHPbYiAQh8AJoIKeVpQ1WEdQQ9uLMEVojwommzoyGHrpkKA8UAQrUA5LmqLdAdWl8qn7P/tyt4S/CdBJgl22N+G9e4mVSTFmSeNXY+r80SR4tv7ug634X4r1skxAF/42KBq3mXe0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <461e8308-1c4f-464b-9e7e-1899746195c6@amd.com>
Date: Thu, 9 Jul 2026 11:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
 <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
 <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
 <ec7bc0ef-e267-4240-ad73-13dd17e1575b@suse.com>
 <1991978f-3d3e-4d23-8583-047ef9797d65@amd.com>
 <2dce4d90-4a3c-41f9-96a9-d8aec9f95409@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2dce4d90-4a3c-41f9-96a9-d8aec9f95409@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb2ba5d-2018-4d12-ad1a-08dedd9e9b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	uN0QMwLO4euJq0fNyuV+WKtdYDNOMtxaNxh4AQ9WS/Fvv0p+zEX+qspCi8GV/Qg0GTYuqpEFwF2h1yxzyQuhrQWstWwJT1ZOMY5S31z6aX/x3BHVJs/fm3hl4mkLeoX3WjYL7P68ifr1HxoYJVmd+JI/+db5tsVZdV0A83e3V5JiTO92IlmNcaK6SD5ahlXTiDYt3M30O9SmAUAkevFWDNW787InIrcIS+Vuo5BsOFVBnVQC+0HxsU0VsstTT8d6DmbZdiD7Ed6QlDsrdIsg4TnnjgX2ArwgMpXjI83nMBO7LSTXT82h3Pk9fzCMA7YkuGpV6zWpwnfLLepIf6c6e/w2l+9GjPrnj9fvTwnUx/OAXs2WnCj6J6hGrCUdBDQDmmJjbdGQ3BdSCMCPPdEhldlR7ER8bOwPpJT+qBETtVpR528px/hhxUG3RIHWx9IWI5zerS2R6CHwCUIQHRWtS8lWt0o3qAKBvqm5rfcvpE0ntA/xhFWmxj0WcUkeGe+cS5zrMV4wVnlc70ltMyTG9c0gGU1i/IHmeRWzLSPzvtUCqacz1Zmc/yuUHxz8qQh9sDCzVBHR0K9cAytOrTwMaF47LZ1ylAfOsuBOSCDH2j+BoySi69flxY2CdBLnjS4o8sBsJvgMgGpKTLr2fl8+cAD4J0MjNabmncGRN1r6+QHSROkK4OUwe0QUv3kffsfVJtk5kSfOGuuAhnM6+gvK3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rW3TFIHotK/YrNAx0D5fSCO/ff0RUUu0m4GdrhhngV+xZg4MTuK0vAA97OfgMGLgpIS+MQWWuYVAiWh+A+oDQHhDHnFKxzwRcbKp9MBh5/RJzjSfVoP4HKdx6QhvGRIq9mNnDc5//oyCw6O5EFbRgxWBZiSLjOIPYqESHSh524PHHy77QowJDUavZ/V6lzci+o5CSZXvX/h8b3QdsLtP9oxnLl/UINwfu5bLDGTwLd9qzL3wKv9WV1kpnYh+oZrxj4b/UY/W85j9kL1ZuRHsgQCHPm2ujRFesstwfuFCO8iOeI1dih/6xZ8xsy2IyOtHrpf0ZX/u0priqkjR1u4e9xTvLZwjYBKIj9fExeuDZUhODIidf6No20x0qUsjgfP1E8dNhPmg1C2GH00lzE+irgH6Mu3zU+AmsIhfF/DRL18Q8l4aY00WizSTwNdVV28g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:44:01.1971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb2ba5d-2018-4d12-ad1a-08dedd9e9b3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
X-purgate-ID: tlsNG-42698a/1783590251-A5F26220-31B96DC9/0/0
X-purgate-type: clean
X-purgate-size: 3279
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,lists.xenproject.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B665572F152



On 09-Jul-26 11:39, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/9/26 10:51, Orzel, Michal wrote:
>>
>>
>> On 09-Jul-26 08:57, Jan Beulich wrote:
>>> On 08.07.2026 19:04, Dmytro Prokopchuk1 wrote:
>>>> Hello Jan,
>>>>
>>>> On 7/8/26 09:15, Jan Beulich wrote:
>>>>> On 07.07.2026 18:08, Oleksii Kurochko wrote:
>>>>>> On 7/7/26 5:16 PM, Dmytro Prokopchuk1 wrote:
>>>>>>> --- a/xen/common/device-tree/dom0less-build.c
>>>>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>>>>> @@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>>>>>>     
>>>>>>>         /* xen,reg specifies where to map the MMIO region */
>>>>>>>         cell = (const __be32 *)xen_reg->data;
>>>>>>> +
>>>>>>> +    if ( (address_cells * 2 + size_cells) == 0 )
>>>>>>
>>>>>> Considering that this calculation happens second time here ...
>>>>>>
>>>>>>> +    {
>>>>>>> +        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)\n");
>>>>>>> +        return -EINVAL;
>>>>>>> +    }
>>>>>>> +
>>>>>>>         len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>>>>>>                                             sizeof(uint32_t));
>>>>>>
>>>>>> ... I think it would be nice to calculate that once.
>>>>>
>>>>> Hmm, originally I meant to simply stay silent here. But now that you say this,
>>>>> I'd like to express that I find this 2nd calculation of the same expression
>>>>> bogus. If the goal is to deal with both values being zero at the same time,
>>>>> check that (and nothing else). If instead the goal is to truly prevent the
>>>>> divisor expression from ending up 0, that (and not a shorter surrogate) would
>>>>> need checking. In particular, the multiplication by sizeof(uint32_t) can
>>>>> convert non-zero to zero.
>>>> Yes, you are right. Need to check whole expression.
>>>>>
>>>>> At that point the question then would be whether overflow (and hence
>>>>> truncation) in any of the involved expressions shouldn't also be detected /
>>>>> rejected.
>>>> Testing zero is useful, but not enough - the expression (address_cells *
>>>> 2 + size_cells) * sizeof(*cell) can overflow and wrap around to a small,
>>>> non-zero number. Source code analyze showed that Xen only supports cell
>>>> sizes of 1 or 2, and there is a ASSERT_UNREACHABLE() in dt_read_number()
>>>> which prevents from using wrong cell values in DEBUG builds.
>>>>
>>>> I would propose the next checking:
>>>>
>>>>       if ( address_cells < 1 || address_cells > 2 ||
>>>>            size_cells < 1 || size_cells > 2 )
>>>>       {
>>>>           printk(XENLOG_ERR "Invalid address/size cells combination\n");
>>>>           return -EINVAL;
>>>>       }
>>>>
>>>> This will cover zero check, and overflows.
>>>
>>> It'll need to be the maintainers of this code to judge whether this is
>>> appropriate here.
>> It is but I would prefer to put it at the read side, not at the use side. Place
>> it in scan_pfdt_node() after `size_cells = device_tree_get_u32`.
>> The first call to scan_pfdt_node() passes defaults, so it is ok.
>>
>> ~Michal
>>
> 
> Hi Michal,
> 
> Nice idea! I'll create v3 for this.
Also, to avoid respins, please put the expressions in brackets.

~Michal


