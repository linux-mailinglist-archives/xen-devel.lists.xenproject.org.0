Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B7886D6E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 14:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696883.1088088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnf7S-0004R2-VT; Fri, 22 Mar 2024 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696883.1088088; Fri, 22 Mar 2024 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnf7S-0004PV-S8; Fri, 22 Mar 2024 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 696883;
 Fri, 22 Mar 2024 13:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqXT=K4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rnf7R-0004PP-Qz
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 13:39:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ed0fc9a-e851-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 14:39:36 +0100 (CET)
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Fri, 22 Mar
 2024 13:39:31 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::25) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Fri, 22 Mar 2024 13:39:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 13:39:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 08:39:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 06:39:28 -0700
Received: from [172.22.164.0] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 08:39:27 -0500
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
X-Inumbo-ID: 9ed0fc9a-e851-11ee-afe0-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD4dzQOFCViWizcL+DsaS8o+PnbQ9XvFB1grJQbrPBYEP4EX23+6K6AgnTvqEI/Z4L5QDPQ9Sg7V46WG5i598YuvFJxbrIYbPCmt+WBvaNQv5cxbQXfjSIb67FAI9ld9PBRRwCpT5XzMnvDFZ1rgwYcZhl2bbAZO4rbB1wdBDcX0oh770Ojy1MtDP1NuQFFEXgsQS9rgE2mNg3UBWebtEpUkPDzSEsV/Xav3M77wzp3Yy/Mil7ofj8MBFofyxW4RCOx43DXdwD21yEZYuj9dMacmGRbJ/RV6FUurWzx47Z5IXcObqD6MygKbGytoUInDVYKxAIm8D9Ww5kZzRkVvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eoeqtHK5q+bZJQf+Nm+h9g5s48iuQ5hpi1d5iFOztc=;
 b=I8QzYgMZ7Yx0a7o5KUy7GbbvoVvd9u60/QsrMrTVQtN4d2aiFd57eMx5m0C8+bQ3o/qmTFN+27CQ8h8NPAZvYqM1Q5pVU017VLQK1rw96sN3cqYi/+lpCHPNadtwT7dGBcFc1tPQCR/nRWKz1Mjay8ulz0s4zlJ11X7nsFu5U+sLYF6PVPZbe4CiZhMUHIma1ucpY8qSnQvxEeI+vY5xbRQeLdwUKcQCK0BlMHmT6Ru+3nbs80D/XT09+pjSwacVcfBYrFQLVBV4MxVQoJKjbXnUtqKMlVJYNmPbOkWVSX/xpQiRwtrb/UPWAKPKtI0EkIGGgc8Zm6GsD7lr0/9V+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eoeqtHK5q+bZJQf+Nm+h9g5s48iuQ5hpi1d5iFOztc=;
 b=QVVn8fFnh/s7Jt5EyfD2DnvKyJfnfPaShyBHDtYQ9FQYqj75LbSDvg8wFog13VzgafaJmsbzQfAPZhzyQXZn9g7ThWanTvGW7L6Hv/OTFQYIH5idztoS9q8/2yLb6PV3zJUWMwd8In7ne8b149gsbMJV4KLS0UasJw/Hi4Zb6dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9060e4b9-93d1-45c2-9785-ccb4b3c3e4e2@amd.com>
Date: Fri, 22 Mar 2024 09:39:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] avoid UB in guest handle arithmetic
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebfb507-c53e-49bc-3242-08dc4a758015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DbUj4GPmZE6fCjCQHN72GXze8MQMaGpkW+KIA+pV+7Ena6dhSfRnFESs4LSscaofLl0r/Ir03S745E18jrtfdyDj9P9yB9fENwhMAyq4UPsZO/cS+tMRg9XIZUEPkaf4ob+sRqHd1ZJdljcPpYVSC5Aq6nfT0jsoLYADtwyH40ryiCAqP8AUn5n1XVvf09W4k1+koJ++tiJbMBLOpKVzQfOYgoHavXWvezEIUNHabROnkhqosd4wZfRuycANHEcSdZbqZkysdcp74gj0z1/TurNZtKPm7gi0gwFJjdF6WLzzOxdPGu4to1ZPane6hTyAdVfUX/HP8opb94x6hAkyIM1Vhj9OMxxhw9nLtspMtM35N+21d7+Pvnx/A4n6K54ZJZyNVNMk6PMTiauDyA3xZAI/rNT9MhQ7lvd7snLdBw3R/X3A1hlX9GZmnz1onUhh2Bme+RVRYcV39HjoMPzbjyNDH4UaqQemc7LDXQGpd4xPGN5P7bK33SRgNMHdzNusWaIW1+y5RpU4ne3G0DU/MAVmQU8mGI2tFkT4ZJp7m0qSmaBNtQXBS2rsaqXiJ4lZWiLAGNqHyljPB++nNQwBVaDYqfLZpgFOvm99l+OGixP0yX1Qx4XOubNwaooJ1TWSNolKWBk7bRq8JezmWv51PXnVj19DVA+78ZlH7cY7+LAQci7FyvQnssLloVZzJ+zz6tZm1mTuhiZGhF4nLE0lCmPW8DwALAfTRoxeU1VxkbtXybOiGWwT3YSEfGrMplF+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 13:39:29.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebfb507-c53e-49bc-3242-08dc4a758015
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716

On 3/19/24 09:26, Jan Beulich wrote:
> At least XENMEM_memory_exchange can have huge values passed in the
> nr_extents and nr_exchanged fields. Adding such values to pointers can
> overflow, resulting in UB. Cast respective pointers to "unsigned long"

Why not uintptr_t?


