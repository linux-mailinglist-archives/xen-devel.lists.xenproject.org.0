Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6760CA33
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429750.680955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHIr-0001CK-SQ; Tue, 25 Oct 2022 10:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429750.680955; Tue, 25 Oct 2022 10:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHIr-0001Aa-NA; Tue, 25 Oct 2022 10:37:01 +0000
Received: by outflank-mailman (input) for mailman id 429750;
 Tue, 25 Oct 2022 10:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onHIp-00019j-SS
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:37:00 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f04cf852-5450-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 12:36:53 +0200 (CEST)
Received: from BN8PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:d4::24)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Tue, 25 Oct
 2022 10:36:55 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::6e) by BN8PR04CA0050.outlook.office365.com
 (2603:10b6:408:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 10:36:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 10:36:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 05:36:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 05:36:54 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 05:36:52 -0500
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
X-Inumbo-ID: f04cf852-5450-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfGwHwAnWciat03q37/6kpViCGv3Eg82hcMMo80muUpHe++RkGwuAKLmxzy6QpcxxdwbLYZIDFPyKk7rJIjcxTUvdhKL7HYOMg0dTahMde4eqyRb5duc38T13qU4F6r5Fq66/OvLGpaJV7R+op6q20SEZvEXm3PiPqcpW1hnF6vVlXqbeY4qp685J8Kgk8XShScyA+0BWT4iitO753NHXQ3WqwpfN4caR8Mstil+7QVgqx4rWCgkMKHoOXrSOlUCQUZBVuRHzMwaC7Lkne7FNtZIqVhBEUFnolRffU51QU5TFSz389CZLr5Z/bw0nJqaQByztbNgDbH9mhNTQNf9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGoark6TZWjz1isot1pXlfv0JBfkzgQTYqdynlWpawI=;
 b=f9VJi/V0PqhOJfbgBSNnNGQ7MWehkthtXSbKZP+iigtZ8hsqJEHAO0azqdvDE++MRV89FH9A+2txR5eRHw4nv0PVx1CKNIk+txCDpQdpdMrgu4SPLJ+lO8qM2Xok3ajOufoW16pDAkpn3gr6FLZU/6wF/zXtG/p+xWFaQ9zfhyQp4R0PVsLniijyq0T1dE94zebVaY5uUXdF6BfSoAyhWC3qnjsCZNwexAWyZPMBvs4tVkkHKQTW23Bx/aY39DuMgA+JW0S5soJQfOUMmnGWYy6XEtUnbK7ucApNavnylsPqn/CMC55/tAzpWeY9KINRiuDtVzmtI3FnWqSLArmWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGoark6TZWjz1isot1pXlfv0JBfkzgQTYqdynlWpawI=;
 b=DhYk6MZFwxpk40C7OgLb2ix3aGBqNCjjH1XxNH8hT9b1lnKVQ2pB3dGoLrzwBY5ZX3CeVrZjhGgizqzAIvEDDM+77lvuNHU+LeKn2X1DXPnweetmo5CxbVhLAI0zD1F6AzMo4k6xV98jrZwkdwCHLsg2ZAjrlhSKTKDCrlhOWW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <906f4f04-4c06-8e93-1c4f-90be7d508f44@amd.com>
Date: Tue, 25 Oct 2022 12:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <marco.solieri@minervasys.tech>, <lucmiccio@gmail.com>,
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-2-julien@xen.org>
 <c5767718-bb00-da6b-8623-1bcb6c832f85@amd.com>
 <dffca6a6-3a7c-a8ea-b61e-a37011a7afb8@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <dffca6a6-3a7c-a8ea-b61e-a37011a7afb8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 561d0049-dc0e-4ae2-bcda-08dab674d5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ss++87Ok/hXIEtnsSXze9SQByWhwM1GOGmCTZZF19B+x5+tcltiQcvrwAw3CvcEZAsAKukVyQZJWh1rhEEZ7DSvXHt25pe3avEcuUsZvhfwQdz4ExyZFudGyCSaV2s6UTBjlZ6iIa2BVOqBTyKdAEk8XseWCHI+5esvjQDsJ0hvEtEuKfbKST49d859sMNxFUOMZIZ5obZ0GkkS29NEy/D+eNQqj1bgqH1ys+KM3dQUqP0dJFlTXv0bdp2KwmBLIASmB1QYJv9k5wM8J1/H0xTizcGtLsYtVSDrq52HtvFfDhO6FQXhVImyCk/xlIDLLEhFPcjH4ZEqD3bo5dGHpkz4s21Oq53CN24JjvUC3YltULCCg2ci/UjwBQ0sqj7AHHpDs6IFu7e2bpJRdhV5DxTRvqY+El6+MPAwaxxIYl0Pqh1OsJoe2MW6DzB4/0qHb4LblTZLW/qyrbXKJz3y+iAf3eYG379e77v+FrtCYDp2ZcMpmc1gjX8yhjtvor4IiN9e1OvT0Km93YTe9IYHwJv8MB8fFey8pqfo1yK6dsFgJUpfdGpebgjqMkiNqusZh+ypwi/EtnbQaBfmVCNAF8RrtWFe4hzmAmzKqcKjSim4zdu/aP8W/8S6oykkZ0u4gMZKFRyKG1OW6iRDB7UTuV6k49kRsnPC1L1VuOMVJbRt6uHOmaT7IJeiyBSsQDXYuEnc0h0O/NQaluA/OIAvNYVGBfkQE5BlHKwLmdPTCZktOEcMrwG7KZ7mClSNzVG0cKkt5PZukoxjHPAyeqwvF2HTKfkXjE+OGC3zAMwwyK7/654gmtAnv4Jw5CPFKckH1fFSVCkjAJkyc65SLQVbQJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(31686004)(82740400003)(44832011)(8936002)(5660300002)(186003)(2906002)(426003)(83380400001)(336012)(47076005)(31696002)(86362001)(356005)(81166007)(26005)(110136005)(16576012)(53546011)(478600001)(40460700003)(2616005)(54906003)(4326008)(316002)(40480700001)(36860700001)(70206006)(8676002)(41300700001)(82310400005)(6666004)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:36:54.7794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561d0049-dc0e-4ae2-bcda-08dab674d5f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144

Hi,

On 25/10/2022 12:31, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 25/10/2022 10:21, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
> 
>> On 22/10/2022 17:04, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> In a follow-up patch, the base address for the common mappings will
>>> vary between arm32 and arm64. To avoid any duplication, define
>>> every mapping in the common region from the previous one.
>> Maybe the following title would be better suited if you only want to touch the common mappings?
>> "xen/arm: Clean-up the common memory layout"
> 
> Ok.
> 
>>
>>>
>>> Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
>>> XEN_VIRT_*.
>>>
>>> Take the opportunity to add missing *_SIZE for some mappings.
>> I think this sentence can be removed as the previous one already covers it.
> 
> Yes. I will remove it.
> 
>>
>> Apart from that, wouldn't it be useful to do the cleanup for the arm32 macros
>> as you are here (FRAMETABLE, VMAP, {XEN/DOM}HEAP) ?
> 
> Can you clarify? I looked at the macros and they look clean to me.
> 
As you choose to make use of MB() macro, I think it would be beneficial
just from the consistency perspective to modify other places that use directly hex values.
We already do that for arm64 specific mappings, you are modifying the common ones
to adhere to this way, so as a natural consequence I would see the arm32 ones to be modified as well.

> Cheers,
> 
> --
> Julien Grall

~Michal

