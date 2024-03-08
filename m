Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA187607E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690162.1075938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riW4T-000361-7l; Fri, 08 Mar 2024 08:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690162.1075938; Fri, 08 Mar 2024 08:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riW4T-000341-4A; Fri, 08 Mar 2024 08:59:17 +0000
Received: by outflank-mailman (input) for mailman id 690162;
 Fri, 08 Mar 2024 08:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+fI=KO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1riW4S-00032N-7d
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:59:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d5da16-dd2a-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 09:59:14 +0100 (CET)
Received: from MN2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:208:e8::42)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 08:59:11 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::b7) by MN2PR20CA0029.outlook.office365.com
 (2603:10b6:208:e8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 08:59:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 08:59:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 02:59:10 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 02:59:07 -0600
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
X-Inumbo-ID: 22d5da16-dd2a-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0swNRpX5GHKcgROXa2VVmIEwWWtiHi2oQ6Z8HSbusrqFXhLwV9BjPwJKE0NyetyOsvGDLz01Li7OA5pqScpQOq4wdYG5W7vvfUN81rxku77uqLQhdWe8udkP/tgGZHQfra+XCuLutp6DOKaZPrlWmmmiXch68b+BANiZSIUeetNi86L0NDrMaQ1IIeRwHArw5QHK66uOvxZnJjNtTgDXg7HacW0A4NsrCSbcKhFPgsSGkOx2T2669+mXiMqq08IW4vNZx8PkRsjnMl0rofHMmcEixPyB+UalWYumcvUeFtiZrSzI0e3JITio0PA6yWjv01XaPd5fXaroM1ab0pbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9sNdPLlbtFRpgOPK0KF+208UXe6iwnzIMtL9DNuzFw=;
 b=DKj+9N+sNc/Z7e6RRXWuOd6ys8Xl0Cf3osPQJQBFgvsU+VYmKUJPmKh2+2kUPsa2EiOSzn3qpqqQvqh3xJEkdc4KtMc2LHeMw7x6Oaw1rDUqNPJEiaNy1tLgvDdOEf5LH4zcXbJUwB93K96/o5sxqr3qfdytY5yKL6m+gLh8YKl/e5J7AxUt73DlngSjdGzqFozIx+3GZ7JGMPwD+64P2AGD+NGAf/w1Mu3XfKZqfdIBJpmhyab4ulmmdDfTY+1tnVnZo8KsfRuq53r53igIBE96yH8LQ7Llmv+ncgVgpBEv44p5Btzr8cqbdqj2wxsD7Gc2AnsQFV+gG+Usf8GpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9sNdPLlbtFRpgOPK0KF+208UXe6iwnzIMtL9DNuzFw=;
 b=jSP3YBJpKn8//KzVvYkNG+UoIcjyp8Tu0aFVmoJP0ZesWy+4sjkKnk+0La9MqE6McAbGVJHHaK+Gx9eNGaAdNcHizU9JeRbHPaybQf5h9mV24uFtN0/srsBudJ3eYHEx+4oDSAUUQiH49kXO32UGiwWXbDTzkUJ7YSUkTPKzoks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9b55829a-3248-4bd4-b36b-a709debf46f3@amd.com>
Date: Fri, 8 Mar 2024 09:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/domain.h: Centrialize
 is_domain_direct_mapped()
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-3-xin.wang2@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240308015435.4044339-3-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ad3974-c55b-43b4-d435-08dc3f4e055a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mxXnTICps9zkc3S11/KB+NFdvzEuFlWDa1sVQa0Wu9n/u917EZ8/p4yqgjV/wab8urtPQfKF1ETbImUyJTYEKw5yEUNqQ5BjYbcHbQLwXkOvT7wv2Yy6sN/EbwOJnmLEX9ICbgKs0yr3TDEH7InuT5Gq7MIkKX4cTNrwNeYG5d8YhPZ8CQ/BnT5yS1FJLPhT8Cs5DIN785Nu1r/k+f/Cn96zxNZPlIJ3T4rhM+GckR8MJeIJwzLAT5Iu4140bd94gDwQC1ap0VK63/an7RONcW/yr8gmUo5Qegl6FAVI3LxHjTh38r+txe+oq+FU0ujGkG5mCFSpCTqsqbp6iO3lEd8UnUAAUL6DIiIIDBS2r4pdxCLoOugHcewQ/z1qWpb49dBZgySKqnG4ll0jqqmKh/Ji/Q0hplvDqLmV74u0zCn3a0WAJbkXgE7ubn9+q1YqQWMuIj5ceYdkPiHQ1PlF2W6UEm0zg0oubvgooys+5UTSX9KTTp79cn67jHSaBlBpMeC/EexFoJEJ0YRM100psEaoJ7a54ujnrXcHdDwQ6epDP4fW93Zps/I9m2FASuOBh8G2Au0YIB4+JSnOPxoWVFINDtoTydPBGTl8nm0sWx0lNYhUsbadUQCBKHnzD2PVghVNku0Udd9/HtClrEkVj5qwa2UpVgrqHqTMxlt+HBFZzaU8A0vPpZMOpfAzhpbn3AERSUjyIZDgPE3srdu26kaogyNnZ8G0IuY0r69DIB94Bh6RQo3OGcqmzPJMTpv4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 08:59:10.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ad3974-c55b-43b4-d435-08dc3f4e055a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740

Hi Henry,

On 08/03/2024 02:54, Henry Wang wrote:
> Currently direct mapped domain is only supported by the Arm
> architecture at the domain creation time by setting the CDF_directmap
> flag. There is not a need for every non-Arm architecture, i.e. x86,
> RISC-V and PPC, to define a stub is_domain_direct_mapped() in arch
> header.
> 
> Move is_domain_direct_mapped() to a centralized place at xen/domain.h
> and evaluate CDF_directmap for non-Arm architecture to 0.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
Shouldn't you add Suggested-by: Jan?

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Another alternative would be to let the arch header define it if needed and use a centralized stub in xen/domain.h:

#ifndef is_domain_direct_mapped
#define is_domain_direct_mapped(d) ((void)(d), 0)
#endif

I'm not sure which solution is better.

~Michal

