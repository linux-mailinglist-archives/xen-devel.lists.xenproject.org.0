Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0177BB4A3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613459.953972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohch-0002DX-Kd; Fri, 06 Oct 2023 09:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613459.953972; Fri, 06 Oct 2023 09:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohch-0002Ai-HY; Fri, 06 Oct 2023 09:59:55 +0000
Received: by outflank-mailman (input) for mailman id 613459;
 Fri, 06 Oct 2023 09:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qohcf-0002AY-Jm
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:59:53 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174ce598-642f-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 11:59:52 +0200 (CEST)
Received: from MW4PR03CA0205.namprd03.prod.outlook.com (2603:10b6:303:b8::30)
 by CH0PR12MB5058.namprd12.prod.outlook.com (2603:10b6:610:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 6 Oct
 2023 09:59:46 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:b8:cafe::b6) by MW4PR03CA0205.outlook.office365.com
 (2603:10b6:303:b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 09:59:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 6 Oct 2023 09:59:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 04:59:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 04:59:44 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 6 Oct 2023 04:59:42 -0500
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
X-Inumbo-ID: 174ce598-642f-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5K1Ncxc5Z+K/TxOdC4fD4ij7ENoTJqODBjI+0GESybjmtVzClqUsbnc5V/t9H0nzmSrrUiwRALckS83itLNtBFxn8ytcuViManC8CrqIlFGPxp7arMBvrpoYJ/VpAiD7igcJGJEtn01dmw6P+imcj6KwodDPtgRilbzAwrn8PyQ5ESzKBpID5FiK+XEVznYF1nC05cLqqUHGJb7LKxaQtQSXo8iGetIeRxsoJOBNzLhoQW0AXQGi3O28JXT/PZl/nvB7SCnXiePgX9LaNel6YGgVadJAa5MQMOujgBlEvHS22/X0M4Y+vyyv+T3MGf0KTKSBS0/aIIlgrw13Kbl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjHOJ/S9F0A9Mm0EzlyAOAxHFipEJgZevJ31LLlix+4=;
 b=bTSugFVxiFf+PtnQYprk8qdREdZ932WurlZGf+npGR0xt4mAJ3iFrdSkbkmczq8yMz65ZJ0oIDTqnYHRJGaDCCCpdif15iQMEz1dvhCHoq4FSRddUIAJtV7cw+komUX4T2JyHaCkDgLMVLHIcwlUSgfdXD3uWrrLCGWgQtDFi3MFhhWRjwBkgeghBZvQSeF8zOWMtHfEcZ04MKCw8N+zcEBdoaRLIZkoVFmaqJhEB10mjmX85xSXO7vedNI6bWohnzr3RDV47pMijb3wFtWlNOUoOOS0qPoTO+NWBxsCAabW4b/wEfdDQ8tOwlcxr2f8lMFf4Wg19LNqGsOjic7xZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjHOJ/S9F0A9Mm0EzlyAOAxHFipEJgZevJ31LLlix+4=;
 b=fzhTB6lskMiwLgVlanjfQ0TnLUYFa7b4tNM70D1K0bpjeeBc7WIQovelgpo7Y6mgA/+I7oPIkRQ6vygOV0MWAEqKlmz3czv7EZgGLSJZTYlB8lTE57Xbe3TUbQKJkxeTFo5SjyPkxhOy2IIxLl2c6NC17JyHurtO2U6UEPGNhZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <42a112ac-cfde-48ee-a878-82486251820b@amd.com>
Date: Fri, 6 Oct 2023 11:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Henry.Wang@arm.com>, <dan.driscoll@siemens.com>,
	<arvind.raghuraman@siemens.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231005165454.18143-1-julien@xen.org>
 <edaa4c87-9e7e-485f-aa77-e330dcafa344@amd.com>
 <dbd7a393-eb17-4a17-a5da-29d7b49fffd7@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <dbd7a393-eb17-4a17-a5da-29d7b49fffd7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CH0PR12MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c207052-9e9f-4272-4708-08dbc652f813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNzmmI0aiCUG46rVVQTj8XJvDFT5wGlpqgzW6/jHPPnuxaVL8KQ1yKUO3bBjW2a/9tW/t6g1RcIhz/deXNi0Zzjk8n+aAhEp9tnppbt1PtoqQWTutIHXcGjuojljWqc6zpZq4aJS0G1XpBLkjYTsDJsO4ELsj5Peq9WRI86cecad5zBL3WkQu/wVJ+1Oa1NHNCdjG2Q95FS72hGyl1mZIhYx/bLTTxYnL8xlZdeo/q+YhwhZ1wYXtVbXpwCGNLnjO2+0jPyUtAY+y4XLaHsaqN2+OunstgTa58tqonv3Ofb6MYNrnupbzG6v1SV7OoNEZIEvR2Req8Af6hL5rcGmIrhT1p9YyjNtnv62I3t4DNaRml0GeUHeGZpEls9CyVTHeeGzkovjozg9G9d9B+y2CO3bJC1DdOAMH955nxCEPQMdzu1ISWNohu7QFttIMpQzk1uwvA5D0l+TKTXgUrIkRdNOWI7GEuXiM4fNJYcZknJgUAgR79TNRqg1r/dtpAlkBu7eAC1euuwgS8cNoM+u5qty//Ah5S+a/lVtM1x+QoWd8hFT16ROQIahXuU66/1cjit/XSTX9eaNoFTjMknKj7ft1UlNn5YMWuo3gZNFE347biczYmQ0ulbWHkEG7fFKYFcGwbuEYrxN3y5x6Uu5Msl2ZXsqcMJI8MwoJ8UxnXiTgVXGcvDbooF6SWA6r2AMg2vQCY2lmyB66mfZV1K3eR9pwk8Mx/FDD5Fxckf3uJsU77dx70W5krrYSsSEpUJHqfuVrvUvxFTWUn5h2fsqmi513TdEy8PddfzRcQlxKlft3RNb37kW3zW5BagYNiir
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(64100799003)(1800799009)(186009)(46966006)(40470700004)(36840700001)(82740400003)(86362001)(31696002)(2906002)(54906003)(8676002)(8936002)(4326008)(47076005)(36756003)(70206006)(110136005)(36860700001)(41300700001)(31686004)(16576012)(5660300002)(44832011)(316002)(70586007)(478600001)(6666004)(336012)(426003)(26005)(40460700003)(2616005)(81166007)(53546011)(356005)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:59:45.3125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c207052-9e9f-4272-4708-08dbc652f813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5058

Hi Julien,

On 06/10/2023 11:43, Julien Grall wrote:
> 
> 
> On 05/10/2023 21:15, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 05/10/2023 18:54, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
>>> the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
>>> in non-secure world is meant to ignore the values.
>>>
>>> However, Xen is trying to reserve the value. When booting on Graviton
>>> 2 metal instances, this would result to crash a boot because the
>>> value is 0 which is already reserved (I haven't checked for which device).
>> Per my understanding it is not reserved by any device.
>> 0 means SGI and for SGIs we pre-reserve the bits in allocated_irqs at the very start.
> 
> Ah yes good point. Somehow, I had in mind that PPI was starting at 0
> '^^. How about replacing the paragraph with:
> 
> "However, Xen is trying to reserve the value. The ACPI tables for
> Graviton 2 metal instances will provide the value 0 which is not a
> correct PPI (PPIs start at 16) and would have in fact been already
> reserved by Xen as this is an SGI. Xen will hit the BUG() and panic()".
Yes, this sounds better. With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

