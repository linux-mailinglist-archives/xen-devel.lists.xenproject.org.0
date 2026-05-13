Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEQrNZVdBGqiHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:16:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B39532087
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307849.1579421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7Zl-0000Mp-0G; Wed, 13 May 2026 11:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307849.1579421; Wed, 13 May 2026 11:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7Zk-0000K0-Th; Wed, 13 May 2026 11:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1307849;
 Wed, 13 May 2026 11:16:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7Zj-0000Js-Mn
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:16:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7Zj-00Drtp-36
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:16:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045d86-e002-0a2a0a5209dd-0a2a450c8e88-18
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:16:26 +0200
Received: from [40.93.201.54]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045d88-62f1-0a2a450c0019-285dc9360562-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:16:26 +0200
Received: from BY5PR17CA0019.namprd17.prod.outlook.com (2603:10b6:a03:1b8::32)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:16:17 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::a4) by BY5PR17CA0019.outlook.office365.com
 (2603:10b6:a03:1b8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 11:16:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:16:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:16:16 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:16:14 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpMT63Tqzvb7hYg5Ke6V7IJ534Jhtedn9qysaA198c8nAYc+SoidacOfPwTGckPz1gBwV+dVMenhonbREF1mU+dy2yXeyZvtdkFy7V3Xp2c//mvgkDx9hVcAe9POqFTR1U3NcVE1gbr+iY3dyqeknpGCIcEURDsdWiVBpLZb6/+G7BIQWXpVdmoETzDXtHNzhxKwzmG8KRGO9QPcuGnMcAFHvEfyYwzIS8Pv7wdQ/TYnv5nDKA8ROa9KbBTPELX24jWxeYFYHhQqQTg3U5RnnzZe0eEhxtNFk31M+ryo1NtoFgg+qVFMAqaL3FWTNtuS10IYp7uPVxYHR3W+Lyum0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6ctmR95F2abZpp2TiEnYeOb23ZkcIQWevkFBVpF5FA=;
 b=AlOMN+GiiAMTTP61vQ9SLfzUtE4YmtC1h9eDRoWGtUD57eg/9vyYU5UEweqFufCrOOkoDJwaD2zM+zhqX9s77ZrudIJ5Wva8EGH+++5LhE0CQtqTND+qhGMW25gFZqHPgDQPf9ACeZokmiELB6E9PbPMFjSL+ZbBloDT3MULhebeUKQVxgzyOsF1BlhgRcaSL1wjxtoET7fpFdw/kw30UONxlnnkLQZltoJNlYD4zXjRiIKKUMkJnemAR3UeD93zpI3wDxKJf+dhIfy54mZ/Thw3uVKvRjmcQWasgiQFZphTWi451jOpFH39sNWpZWb9aLy0fHLA6YRjlWeiFrt9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6ctmR95F2abZpp2TiEnYeOb23ZkcIQWevkFBVpF5FA=;
 b=Eiwmo0V72vHuVAxWCgFozVrE2jcucFD59DC+HpSYDti/s/Epp9+nC7VuJ4VmYdNuC+Xpcxp8vI6dB3HCkU5A+Ye4mqVG0k1Ym2Okl/vhJ9CJ51anO2ZaClkUL+O+NgvXrMs98aPfxXpjjr1hfAzQAR5111GpbpT8Xj561SA7HKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7c75dce1-f0e9-44f6-bda5-9d18435b882d@amd.com>
Date: Wed, 13 May 2026 13:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] xen/device-tree: use p2m_gpa_bits in common code
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <da9139f28ec72a7a2b9be949e67d57693af8b780.1778140240.git.oleksii.kurochko@gmail.com>
 <46c3f430-77a6-4baf-9597-17873e0782c4@amd.com>
Content-Language: en-US
In-Reply-To: <46c3f430-77a6-4baf-9597-17873e0782c4@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ae9472-ccaf-4091-97dd-08deb0e10d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MmsrU0VVqw3RfCXHpPrMNJibloMlWpg/Aspm2CVGXmnQ275R7J56QWGNx3C8i4GA0miiy/bvuj5ZUEzLGOYpghDTroQVWS9HDCsps5DSZGjmQFCQf5puGrzKejIaBptadaTC722KzwTlzZ7sY2F+QxqG8M0k5ggY4EJMg7uiLLfcjKt0KT/nuWzmE/adSCR/DcV8IplqHtoW582Q/TwohnJ/guFa3DWJ7iQbyD11qyw012DOLoRiyGa0+Arq+zFX+iEgA6zbz92ERAXXNJ7fRAUaeVW7WbjdlhTGLHlf6aahgRtjzMrcOMLIm5qj6fGwbzFRFkMaFy2TibRaQGemNf7F0qQkhJPNJHl9BptjBxjSXmHlM8NENbeFoqgUIyOnHbcf+MvmdDuiMq/u+EZ1YyHBsZ2sTZxva6vBwq97NfRFDDvNrpRc6q4zCCyaDj6b2NetTWkxVXUmWUHUF79f1tYKUGEzuWfrgFakXzTkNbG27Elix7b64C8duicWroiZjCQdZ4AGSVkVV659YKHDQHP163dlwbRw0BaWkqL2nrYklLJ3C1QyV/yEc43QaLYF54s0Q855lBIM28sHAtnS3qhBKF1v+s1g23fL8N+4vgDcU59Kx4qV4t67BnGPSYaJZuc5xCzHJtIhlEEi4QNhuCJ28dS6agK2LHeMS1GRgTrrFYIVies3MuW8IfSKGhvsbAWQk9SLw0ihjQ9IfIEPRAU8srvx3NYtgDG2MUFr/2A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g3ZlNxZBRHiQVOhgwJmywYVA4POVd55c1W5OuANRNzfA+QJ3/7Kle/2PZUEPgFnZmlMKZCVcULHeDSzt5GLBJgwy11RLHqpZ3D57JSerrML527MTqxEiNa68qs4l3Sybu4gfOVLcrMmd2iAWT0N95q2hy/tWg1NmCYrPgJg21gAELbR+zpDk+BqKq7qsgvYGIU4NNc0H8y/09PF3jZgqC9mXjHvNaImWKXZhHujepBoBy9t4JcKY/ps4xxDzbtZYGXKGdU/Uz8/v2hbNSWhN82ZF442OvwsZepRFttdPyMC3iLhHLsCExAQVxQ/jiGh2KQiVUUdi8eGQFmLiQ+bpBELzB7YOd2o6LOmuazKuoBrqoWv3To8mhJMUQDNflyKOoeRzdpGJQua4K/kpccBSnECQZPznx3lNIrtQS7xvyfpnxeEZo3eAcTSM3Ry5tdjJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:16:17.1845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ae9472-ccaf-4091-97dd-08deb0e10d76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843
X-purgate-ID: tlsNG-d25034/1778670986-E0766CF5-9DCFE38A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1761
X-Rspamd-Queue-Id: 48B39532087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email]
X-Rspamd-Action: no action



On 13-May-26 13:14, Orzel, Michal wrote:
> 
> 
> On 07-May-26 10:58, Oleksii Kurochko wrote:
>> The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
>> p2m_gpa_bits to use architecture-neutral naming in
>> xen/common/device-tree/ code.
>>
>> No functional changes.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes in v5:
>>  - Rephraze commit subject.
>>  - Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>.
>> ---
>> Changes in v4:
>>  - Nothing changed only rebase.
>> ---
>> Changes in v3:
>>  - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
>>    renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
>>    changes clearer and keep using Arm-specific terminolgy inside
>>    Arm code.
>> ---
>> Changes in v2:
>>  - New patch.
>> ---
>> ---
>>  xen/arch/arm/include/asm/p2m.h        | 2 ++
>>  xen/common/device-tree/domain-build.c | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>> index 010ce8c9ebbd..7957dbd96e57 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -14,6 +14,8 @@
>>  /* Holds the bit size of IPAs in p2m tables.  */
>>  extern unsigned int p2m_ipa_bits;
>>  
>> +#define p2m_gpa_bits p2m_ipa_bits
> This deserves the comment e.g.:
> /* Common-code alias; ARM keeps the IPA spelling internally */
> 
> With that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
Forgot to mention that I'm ok to do this change on commit (patches 1-5 are ready
from this series).

~Michal


