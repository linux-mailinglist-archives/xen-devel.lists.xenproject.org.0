Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0374356D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 08:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557280.870488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF85Q-0005l5-Jt; Fri, 30 Jun 2023 06:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557280.870488; Fri, 30 Jun 2023 06:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF85Q-0005iQ-Gi; Fri, 30 Jun 2023 06:58:32 +0000
Received: by outflank-mailman (input) for mailman id 557280;
 Fri, 30 Jun 2023 06:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+UV=CS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qF85P-0005iK-BM
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 06:58:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 847b59e4-1713-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 08:58:30 +0200 (CEST)
Received: from DS7PR07CA0007.namprd07.prod.outlook.com (2603:10b6:5:3af::25)
 by DS0PR12MB7533.namprd12.prod.outlook.com (2603:10b6:8:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 06:58:25 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::1) by DS7PR07CA0007.outlook.office365.com
 (2603:10b6:5:3af::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 06:58:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 06:58:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 01:58:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 01:58:24 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 30 Jun 2023 01:58:23 -0500
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
X-Inumbo-ID: 847b59e4-1713-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrMVDzUuwDe64R6EPbLA2qVjv3p+KkGSLSxgCrBS/FcDf6ZpfySMVo31p9kAybVwtatgOmAixS8rbQra2cBZS8AhCJwzaeTE4O4sY3vjfCepuqP44Cpejk1UXIzkeU+/n1X86Fmn0YwOkKTv+so7oCUF6m02k+TLYXEzglqYKjIY6PSfqpIHApcrXXzS1bJr7n0dAMT4s+FIjbRRK/9+pRcl5qtxAoAv0rKPzf6z+Airakh7k0hMDs4Y/sl6HBjCU6mTEFyQcB+VSVk4QblLTCCjoVlQhl7rydmyv/udm573hclsy28SOoBINwSWdwdqXLNOaht+srpuHNgK2lw9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dSf91cpV2ZlfMYs0xZvmcR8oOgsfgItiRHBCj0n0RQ=;
 b=BFCqPfELOaTjb9tdTAr3OAHVWmEHm5cZXZu8dtpfP2FKeRbaE3CnMzIO5LaXoPlJVHKXVm6HeSVh7OvK3WnZYz3RFI/eaU1XB9r5BWMLLhgsMY3SgxH/68IwcWMIPJI+1s+5GFsbir4NdAJfsX6dhKZrj3zWsYgTxgysKqhvvM7OXzkWPvlY6uNMZm5O9D65F40PQ6e1yRXJXMcT0HtYyEvLEH/oeIbfScV1aeS8c8k4bm7vqm5phM/eH/3CZFIbXGYzChb77tfPoXoRvqd63c9MuDgNLsRqkdJKNE8aTbyPa1v37XSr8TViqOezSKbdMfF3XD5ZgUbWA4YVnZ3gzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dSf91cpV2ZlfMYs0xZvmcR8oOgsfgItiRHBCj0n0RQ=;
 b=DLPppAWklsPTjsxaCnPf810E1AnM3RxFfoPHvZ3IV07xVgJJ4o2YeYpnaL71KkEO4HwMTYBNd3nqLJsAsaLeBFrVY4d8nfvDxOjlkalpZtwDl+mjOzoD6rUlSHytpmC9sQ8ws/BzEFg8LlxSs7tMAMpgxn/a9tYBYDI5LXVxBN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1bbde5ea-9cb2-4aac-fe36-66b7cfddd00a@amd.com>
Date: Fri, 30 Jun 2023 08:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-5-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230629201129.12934-5-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|DS0PR12MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 886da3f4-27b2-4efc-a17f-08db793766b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PE+9HYRbBTcu4v+ivZpSMmpMqO+UR5t/sGwleIpTAFebc0f5EYdQEA4lvscTQLQ8haJcUeICpAFw0aHJpvBw1UkA7mBGWsoIvRaXnRCJSwwRm6NJ7daDx7SNJlamTjWRc53FjEQHtRvPklXvld34sk6+qEJqw9cRYpvutlmDo1WkVOBbEAfZWEAeAuLv2gjreH9q3D244zuPIvfcaF8Hh6v/PGXsgImDDi/TTwDCuSqA45He8yJHytL9t12lWZ/WP2xSHAqeXZg8Vfm+BiaguVRrVh/cgExfZV9fyD5r/z/EzXVuGJkHWmt+XOQ4fp/CssBsfsXK5QQt8Dk4huyLLebhlrkHRAO2lMaMyGo+Cd2V5cRc62dxsdZEwdNwSgF4xfj5YvXSJlW9LesLxg/QU00NCdZhmcVJSsc1BVhzzqz+79LX06AEFf2qFOmG3uMEqcxexAeniu3rPVqBxXliWD44ceRYrUabJJIH8vmZP8Ma2WLsMGL2MjBYioUgXof4Zgqz81gc1LELPRjF8wf7+MxZC/X7Se8bXyvlV00TBWs+oYzooArz1sxfZAO9PL6SZp83DoQxtyO/jAfrjgn8VH0GhM4fLsT8XlAw1ZGQHZuMe5bfRUHmxjcZb8ggM9MA7imIhPzvvgS7Wqyd0C/G24lerX0QUYM/By2lOYKymk+i0/SAqqKf4b8KUlyPyldk5BwxSAYISKheA8A0993MfVS0v5bkRJt0UptJLmFyNWYaUYUip+VfjOL0w4Ys1XY2GeS52QK8o+FRIjS/wJNWW/WwCoNNuXhxkwmCnwMPxrbFDFs7lKCC5PuxBjXbCa6f
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(53546011)(186003)(26005)(426003)(83380400001)(336012)(47076005)(40480700001)(40460700003)(2616005)(36860700001)(5660300002)(110136005)(16576012)(54906003)(44832011)(478600001)(316002)(4326008)(70586007)(70206006)(8676002)(82310400005)(41300700001)(8936002)(31686004)(31696002)(86362001)(82740400003)(36756003)(2906002)(356005)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:58:25.5355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 886da3f4-27b2-4efc-a17f-08db793766b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7533



On 29/06/2023 22:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> UBSAN has been enabled a few years ago on x86 but was never
> enabled on Arm because the final binary is bigger than 2MB (
> the maximum we can currently handled).
> 
> With the recent rework, it is now possible to grow Xen over 2MB.
> So there is no more roadblock to enable Xen other than increasing
> the reserved area.
> 
> On my setup, for arm32, the final binaray was very close to 4MB.
> Furthermore, one may want to enable UBSAN and GCOV which would put
> the binary well-over 4MB (both features require for some space).
> Therefore, increase the size to 8MB which should us some margin.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> The drawback with this approach is that we are adding 6 new
> page-table (3 for boot and 3 for runtime) that are statically
> allocated. So the final Xen binary will be 24KB bigger when
> neither UBSAN nor GCOV.
> 
> If this is not considered acceptable, then we could make the
> size of configurable in the Kconfig and decide it based on the
> features enabled.
> 
>     Changes in v2:
>         - Fix typoes
>         - Add Michal's reviewed-by tag
I cannot see one, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


