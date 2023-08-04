Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67676FAA6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576916.903602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRots-0003r5-1a; Fri, 04 Aug 2023 07:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576916.903602; Fri, 04 Aug 2023 07:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRotr-0003o5-Ta; Fri, 04 Aug 2023 07:07:03 +0000
Received: by outflank-mailman (input) for mailman id 576916;
 Fri, 04 Aug 2023 07:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Igz=DV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRotp-0003nz-MQ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:07:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819bb245-3295-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 09:07:00 +0200 (CEST)
Received: from SN7P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::15)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 07:06:56 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::65) by SN7P220CA0010.outlook.office365.com
 (2603:10b6:806:123::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Fri, 4 Aug 2023 07:06:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 4 Aug 2023 07:06:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 02:06:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 00:06:55 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 02:06:54 -0500
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
X-Inumbo-ID: 819bb245-3295-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eqh+4qcNyMAVPeMXeLDSjZ0djKRQipYX55/KGwb0Hc60t8vdCvjAlL1LLxKGmPj4r4BeMGgLYA7SdQQOperYqRoUUajcdMbH2Hj7PC2vp9np6GHcPY/9i2jQeKnuKBmxfqwPpF0DQnQVPIDBer9e5Wd08A+GHzmYp/rZKoV89YcNaMM3PRhNfWGnqI59mmGawslh03B9qKUJDzsz+Wp7uaNgJGgxw2q1qQxb7cT5hiv8EDr0vC0rWzrviWaFoUnABZQ5YFaH37hdyIrHPMpNU5F6sZ+cZKhTiOv3j+myndMO0ieEcBCvC39BfLOUYoN8plHjElhL+Bo6Nd8ylmOmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rkze//lRjPx1EWbTulYsy736B+B6W8ahIeAajZdiYxA=;
 b=jDha9KlckQ1ob2ZXcSKGxMxRTyosrYWFIa66B+Wy3xVNr1QusycATJy+FBvwOEIp6qUMbKXYLTGAKNkHDKq4zef3gN9fG7HOfvvwnMQ/fWaLybRPRuG+pYO00Vi7zKQqRXjsCG/cQdbAPN6O1ljthfmzIGbC1dhbp/xWpi3ydFPOXC1aXYaUZ3+BG9HkLjmW0Tc/T6tnDHhmTwMGVDgDoSZiXl1tEvnFSmvvodoCMLHRaF1HljlknpwyvLEADPkBGMQDixfcBjlM06GYuj6XA5jpR+4sZ8YqwbUtm3nXXvDS5sJAeci5mJJvShX/YoKXuJzFnnK7Ut6wcN3b2ScK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkze//lRjPx1EWbTulYsy736B+B6W8ahIeAajZdiYxA=;
 b=fO2bPtIUYzu2AZgcSRY5gQA0nR1HEaB0Hjx7bgy+wxzKlBU0nH6KSYbZz/HHipa/F8NKYarIlcC53jGWiKzVfqunPWEY6LywB5MLE+iLEnqSM2PFoiMh09aF4R0l7mmv4nDjmvcvRVhYUq6xgBuqrEU1GWl8/cwKK7nr382mgGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2a72cbf1-a9d7-6edf-37f6-5197c9d40452@amd.com>
Date: Fri, 4 Aug 2023 09:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
 <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2943bf56-6807-4896-e705-08db94b963d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L3Zl/lnuL7F9pZRQK7G/896U3nUuBXcxHIXSBbgrIdCyW+QM+0zmYluZPmCU23IjCG4ipKi91CnquDNuEEKI4E7KbCAxgZcjWZBlzF6ZD8Hf2K0aVMiX7sMqLVCGcH9XXB5j6L92jCgZyAyvSxmSmlbeq2K7yqYK1PM6DoZDoQOnhjjN9zZ86qtWpmFM9hZ6T/1az3moEe8Mgy7JhBWfrieYAJOPwFMaaA3GMAn7AnoHoz4eX1kPYilzaItdNU8e36qqokRHBfrbngm+YOawf6PX2Vpn2Uqc/HiUn2gG/S4ytXKI0ZUg9UYrTSTTVL6T+EEB9J7TRiP9eKwimgn6a0/1XikC75XZ17guYEA834xSYAtkrd1a7s0Rj1Ja/AEphgIsDToW5F8k5mIXe6c2t8mtLH8XlsNhDBb3UYE7pwAvq3kCxc7AnrOZxP2otsGOx+ov3JH7jdfx6B2VWdFLbl9OYNAMSdfx4GpG9we93A2+Zgm89tmbkE2k/DZxtFkEw33noQUz1qoH/W3GjfPxStsUHyd6MwiFwGj607rPpmSEqR91WYzZtEj9YAgjf2ACmxf5mQrN0tYBfpeCK2jEzRmbCizSfBGmr+9U4jmE6QIm7dURJInL97c9SuFwJXtiWeW6ZwG3sOB1FCh9Vh4OAMSIxUJdlL3gwAZ+FFjjp1WC8+lbXObUYYVCgvbBuAg4tPY9OZqaYy/Ae73yV4xHGVREnHkB2hOXqNcOq10+hY99huZi2Qv/Ursuteo7glAqXG+h+20s53PsGOF+yXFB9jLOKnfCN4zdrtUj0GXJZV9LKHos+8gwPBUQJcm14EAn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(82310400008)(451199021)(1800799003)(186006)(40470700004)(46966006)(36840700001)(82740400003)(40460700003)(2616005)(53546011)(8676002)(26005)(83380400001)(336012)(47076005)(2906002)(36860700001)(316002)(4326008)(70586007)(5660300002)(426003)(70206006)(44832011)(8936002)(41300700001)(16576012)(15650500001)(110136005)(478600001)(40480700001)(54906003)(356005)(81166007)(31696002)(36756003)(86362001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:06:56.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2943bf56-6807-4896-e705-08db94b963d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

Hi Daniel,

On 03/08/2023 18:57, Daniel P. Smith wrote:
> 
> 
> On 8/3/23 07:45, Michal Orzel wrote:
>> Hi Daniel,
>>
>> On 03/08/2023 12:44, Daniel P. Smith wrote:
>>>
>>>
>>> With on going development of hyperlaunch, changes to the device tree definitions
>>> has been necessary. This commit updates the specification for all current changes
>>> along with changes expected to be made in finalizing the capability.
>>>
>>> This commit also adds a HYPERLAUNCH section to the MAINTAINERS file and places
>>> this documentation under its purview. It also reserves the path
>>> `xen/common/domain-builder` for the hyperlaunch domain builder code base.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

[...]
>>> +
>>>   memory
>>> -  The amount of memory to assign to the domain, in KBs.
>>> +  The amount of memory to assign to the domain, in KBs. This field uses a DTB
>>> +  Reg which contains a start and size. For memory allocation start may or may
>>> +  not have significance but size will always be used for the amount of memory
>>>     Required.
>>>
>>> +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
>> There is a mismatch between the description and above format:
>> - KB vs MB
>> - string vs reg format
>> - the x86 example uses string and Arm uses reg format
> 
> Hmmm. I missed this in the hyperlaunch v1 update. In the original design
> that came from the working group it was going to use a reg as suggest by
> dom0less. During development of v1, we found it was not rich enough to
> express how Dom0 could be allocated memory and switched to a string to
> mirror the dom0 memory hypervisor command line parameter.
On Arm, dom0_mem cmdline parameter is used to specify only size (no min,max)

> 
> A question for those involved with dom0less, is what are the opinions
> about using this form for memory allocation. Is it required/possible to
> be able to instruct the hypervisor what physical address to use as the
> start of a domain's memory?
"memory" dt property is used to specify just amount of memory for domain in KBs using reg format.
It is not used to specify the static memory region (with start and size). For that, we have another property called "xen,static-mem".
Therefore, it would be possible to switch memory to string but it would not be compatible with the current use anymore.

~Michal

