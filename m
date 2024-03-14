Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934D87C456
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693484.1081603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkroa-00017F-0x; Thu, 14 Mar 2024 20:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693484.1081603; Thu, 14 Mar 2024 20:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkroZ-000145-UG; Thu, 14 Mar 2024 20:36:35 +0000
Received: by outflank-mailman (input) for mailman id 693484;
 Thu, 14 Mar 2024 20:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCks=KU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkroY-00013z-HZ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 20:36:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89eebc2b-e242-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 21:36:32 +0100 (CET)
Received: from SA9PR13CA0113.namprd13.prod.outlook.com (2603:10b6:806:24::28)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 20:36:26 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::17) by SA9PR13CA0113.outlook.office365.com
 (2603:10b6:806:24::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.7 via Frontend
 Transport; Thu, 14 Mar 2024 20:36:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 20:36:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 15:36:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 15:36:25 -0500
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 15:36:25 -0500
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
X-Inumbo-ID: 89eebc2b-e242-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iriAO/cXkp52RhhXjvoa82enwqTn+a7epl+vUDfhGtnhFJI6z75pM5/s3KaJ5th6w9HdA1nOOEqE5trgyBlfN/t7AumjhUJu8ACfXVeKB8kr0IVO3VPZ8LN35ZzHI3wG3mQ+/BEltUF252d24UtZsmlcczFdOIpl7H7g2Y+g7XPGeHEAN3cfNva4B4++5Dc5nTi8/E4kjzU+bbW5lObQE0YDaKn/2yfApCE93rQbrniuLxKzq+Zqx/HhGqgLAnHnc5Kx83ieitwJ+4MNAUyvsJvj/rQKE4gS3wt/RLAQ5t92d2elMdiVDzRRtdQEWGwTrj53ub09AGeO7OoPdQftYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piwOf8ANvZ+qozANPPSOGx1ygTDKAE5UUxoJUqgz4Mk=;
 b=nNCsvxAiFTuEfCb0+xuInShM4qP37pkz9iqWqwCPfACqi4NFezQgOcOsB96H1EIoWjK98pLGctcuwnyKZlDl3BDxJOWLirvG8Va1I0OW9o1JhZ2oQktsQxXUm9L1O2BC99z1HXA+oPgbmI/B0lprWru22h8XiIlN4D6bh6vNmGC0XYeo25NewRB9wWfdJlas0Kh6epLFkjBjF9xzoursc7o7+grIzZDPgWhKkRXGKkRU+sKLJD+jCP0736P5UmVAPnlqtRTb7NVgUM3W27jPB90zg5O/ZsQF4IPGA1cee1zdGZAy3jaZHoUTTt+BarF8FlTDNUIzF+O+XkhBCG9PgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piwOf8ANvZ+qozANPPSOGx1ygTDKAE5UUxoJUqgz4Mk=;
 b=uhJg6J16Fz/9VU9PoiMFHTbMBbnrphr1p3GEwXiz/i2V1pU2Bwax1SmDqpEpU028MPF99i/VUdAqY+fGQ4OMERe+ZiuKci7bS4Bhzpv73jklEuWsgpQZvWqyL20UKRcR4v8ChleEpLuPT7Q4Cy5yPQGaNFh/6VLilk7L2a+vkEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7777da94-4c47-4034-9306-bd8161d6af25@amd.com>
Date: Thu, 14 Mar 2024 16:36:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] libelf: Expand ELF note printing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-3-jason.andryuk@amd.com>
 <ab06fce5-eeba-4ab7-97ca-99d876406693@suse.com>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ab06fce5-eeba-4ab7-97ca-99d876406693@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6746fe-5513-4e38-3ebd-08dc44666bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z6EgR2Ol5Ocm1n9FbF4c6yYVNQN5Ob0P+wjXCEhhEB6oYu39zNia7sZZwoZWJDWFis5c9jvx55ydCkDu0ewVD+DBRnIiuaNdj0zpbiCN7nLqBvDBSUQgXqt+C0sb9YgROk3pXcFtClmIAMtIb00pCpma831QIz83BrAfT3rzkzirNH2wXW5elBV9T+IVdEeSLs6axIFuGhKSJiekbPQ4qVtus9QsDVhLy42VXoMnsu9/SaHTDHLlBXCU62Hx0xWEzBLS8aiOOT4Y02ieA0cUZh2oQftWBFLPq/BnJUMfyepra2WDJs6VQRVNbR6Cl9o7ZTVqE6E3Tjxi3bP34TDlX6ULMdH6epSIhBQv4awKQgJY3GjoqsLrGyESIlGEktyjdx460J+ZXu2kLMqJ3N9AcCvXhFxDeo3I3J9Db9vA2xQuraol6D1/eIedbRQnOMRUYscaxyCCkPDACxuR6/5Jy+FvTz38vnjzT0bnS9mb36RrwYoxC8iR8I6h4C2ujYK+bgWG8pRlIFBQKXr85v0N+7QXqXgtp6TbLu4h7gYG0xbhrWl91QoSmzmRQsRAdpr0UwAEeRcTuuWf1wUwOhQmOSdnzruYguuYs2jvH4U7IDQlcgrP6s8aEdv0CZk3vUQ1VtfFVXY32950122iqz3KtYiv7jbGw9Jo2o2/fzBWj3hC3yrovBHheS8AxgOTodfzyMTo+Ntdm+Cbi1IOW5IyfhIglRWoje8006GqtwEFrjmOmdY/SF2FS18Qd9jVg0oj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:36:26.3208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6746fe-5513-4e38-3ebd-08dc44666bb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

On 2024-03-14 09:16, Jan Beulich wrote:
> On 13.03.2024 20:30, Jason Andryuk wrote:
>> @@ -217,6 +225,15 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>       case XEN_ELFNOTE_PHYS32_ENTRY:
>>           parms->phys_entry = val;
>>           break;
>> +
>> +    case XEN_ELFNOTE_L1_MFN_VALID:
>> +        if ( elf_uval(elf, note, descsz) != 2 * sizeof(uint64_t) )
>> +            return -1;
> 
> elf_note_numeric() use sites don't have such a check. Why would we need
> one here, and even more so causing a error to be raised when in reality
> the supplied values (still) aren't consumed? Furthermore the documentation
> says "pairs" (plural) for a reason. Finally maddr_t-sized only happens to
> mean uint64_t on all architectures we presently support.

I failed to pay attention to the definition stating plural pairs.  I saw 
Linux stored two 64bit values and printed them.

I added the size check to avoid going out of bounds.  elf_note_numeric() 
handles 1, 2, 4 or 8 bytes and returns 0 otherwise, so it won't overrun 
boundaries.  That's why it was getting printed as "ELF: note: 
L1_MFN_VALID = 0"

What motivated this was seeing "PVH_RELOCATION = 0".  That confusingly 
looks like relocation is disabled.

I'm fine dropping this attempt at printing the L1_MFN_VALID note. 
maddr_t is not defined, and it looks the note values were 32bit in 
non-PAE kernels.  It could just be printed as "ELF: note: L1_MFN_VALID" 
with no details.

Regards,
Jason

>> +        elf_msg(elf, "mask: %#"PRIx64" val: %#"PRIx64"\n",
>> +                elf_note_numeric_array(elf, note, 8, 0),
>> +                elf_note_numeric_array(elf, note, 8, 1));
>> +        break;
>>       }
>>       return 0;
>>   }
> 

