Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81196765B5
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 11:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482297.747719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJB3R-0003V8-9R; Sat, 21 Jan 2023 10:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482297.747719; Sat, 21 Jan 2023 10:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJB3R-0003Sk-6P; Sat, 21 Jan 2023 10:24:57 +0000
Received: by outflank-mailman (input) for mailman id 482297;
 Sat, 21 Jan 2023 10:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pRw9=5S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pJB3P-0003Se-QL
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 10:24:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6bda7fd-9975-11ed-91b6-6bf2151ebd3b;
 Sat, 21 Jan 2023 11:24:53 +0100 (CET)
Received: from BN8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:ac::35)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Sat, 21 Jan
 2023 10:24:48 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::d8) by BN8PR07CA0022.outlook.office365.com
 (2603:10b6:408:ac::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28 via Frontend
 Transport; Sat, 21 Jan 2023 10:24:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Sat, 21 Jan 2023 10:24:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 21 Jan
 2023 04:24:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 21 Jan
 2023 02:24:47 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 21 Jan 2023 04:24:45 -0600
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
X-Inumbo-ID: d6bda7fd-9975-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkiZwiVOYi15Alhoc5SB+K1RibSs/iUHJxhgOWX2ae+vYay5eqm7VAys8KV6dVWoyncTdaqCCGnmw+bsWy1eoNFtcpOPnwBVtm1GB5dVOXf1KfoVT8G/I4BXEdAXey+EGUt6jJ7YxHihmF0ZD78z5V1UrjMYPylGxTYFHQShXuE9cOuTJFOtZwVbn+2noI8mlmILUafmtWC8t+ki8Xe8adHy1HOZLrhgPu0nqgooxAgnUWIyXewbFzDaQG+ApV64YRa4WJE236Kta74cFnMvw6b6h4VT2baeCQND2rv2TYAytgHwX9efpho1oiHKtoyYA4xNHUoq4JgpJJaKh/WYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99FcWel1iE7u5LptLzQ+Dx6SfzUQ26tAth4X4e9yg58=;
 b=mrlFRsPXB/rG0fQ+8Y7wSzFovqw8+uUu73PHy2m6lwhuY5ahDoq+BRmh5yM5nhogLCYZ59mn2iIdVBi0//Gs2nRzBKu8dejf6bU7DZ2Do0Mc3s9qS1h4GeI46KzhNvtFv7H51Z7Z1dSv3MjjEYD8k9PmPDYayfrOS7/Hgqig5rAANIYk9Xvzs3wPesiUpWD/9p2Ry1U60QWSB5pStirZgxld9jxBm1+AOQhSqLKciOMc9ieukgEnCXA2rk3nE0HNZs3Z0ZvQ+5Fqwz3pvzPCxwQL/BZwZG8QpvxI2F0XpOuqN6WzpKK0LQjNMZufGwjmxczsziNSV9i2CuaBcdIOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99FcWel1iE7u5LptLzQ+Dx6SfzUQ26tAth4X4e9yg58=;
 b=NDdmHQIdXd7mvi/FjspoxAfFw51LUNseiRkvjtolCU93qQLtooy+WPSPUgFatfAYyGdir46FbvaGyS7Vwm6RPUSSlDoqXQHegB1i6gDMJWncbRO3lPsbVLUdtkBsYeyScW5jA1ryEsFVIfV7BCCdga6UB4EBkJu0iIwWRBUrI9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bab01caa-1827-c672-c0e3-35b2b5b67a69@amd.com>
Date: Sat, 21 Jan 2023 11:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>,
	<stefano.stabellini@amd.com>, <Volodymyr_Babchuk@epam.com>,
	<bertrand.marquis@arm.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
 <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
 <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org>
 <2017e0d4-dd02-e81d-99f4-1ef47fc9e774@amd.com>
 <42b138a6-59f5-7614-d96f-30e1784c97a4@xen.org>
 <0a7d3da6-efe7-2cf1-563a-3c5c2ec473b2@amd.com>
 <alpine.DEB.2.22.394.2301201455100.731018@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2301201455100.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 2316f92a-734e-428d-1df7-08dafb99b949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TiOfYTTti7Xrxk8Qvk+0KxiuSDdHUMlx2dOH9JUuKWNVGHwrdFszrKVJLjjbSxfD44X4ZkJtRQzpAZrYaKrBp1v1tZsgBDwSlAfO+qPtjP3vvCpzoapJYQVveKICrO9xN/w/ufhH5P64QGs9lW3c3NAwcjLlzuSQLZZmKHMw1DxCENoEGckcylILp2B8GVbbyWq4RkYkWUO/NaHK+3fDwJ/cHr0HmWzhS7f7Q+mdQFj5dcGXUtdzHmogx10Oq0vesF7LB5gV0BtYFGzNEO+d7BRBV7agyck2eTooObShWjCanjwlkQbSO27XXBY3rSkTjwLyJG0+4Iqtgruy84mdC9GnT00RwIkb9XvXcN3duxgsCQwVonttTh6+NKj+41R5SLulLxlNuc+01jNaNuM6JT9gnHb5L9fE/bADPCiyZVvIF/p/5QMuY7qZnigEluLUzJrp5IadpbJm9Ua7M1J3f2BbRFQKsinl6ktXHC5Yw2rVNmc/1cT++nNSAeZKew2FWdbCIEqpB9XwoOQPZdMjbypXs5KxduQTLxD/IbEPxkREMw4s4itrvBCOX2C/aaCp1w/H0TyRv13gtBoSeFDa2DNL9fRZhpYxQbng4NH4e+Iy0ORi7ama+aQZ0EH9z0vojkSE5X80lNTxzKHitLcTO2x9hok7AX6sj3mlQl1bMpQfRuz8presLR8ekAA/rWu/rIuGOUrkV6dW6tAz4i+hstUM9z/Syod48xmegPIZlkdaT5X3IkO9LfdkKd8jUfem5ZBh1hzZRjciv1808Im8etjHcEP3z6tjhR8N46sNsmU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(26005)(54906003)(2906002)(186003)(316002)(6636002)(2616005)(16576012)(478600001)(966005)(36756003)(36860700001)(110136005)(6666004)(31696002)(53546011)(81166007)(86362001)(82740400003)(356005)(40460700003)(40480700001)(336012)(47076005)(426003)(83380400001)(41300700001)(4326008)(5660300002)(44832011)(31686004)(8936002)(70586007)(70206006)(8676002)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 10:24:48.3022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2316f92a-734e-428d-1df7-08dafb99b949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983

Hi Stefano, Ayan, Julien

On 21/01/2023 00:01, Stefano Stabellini wrote:
> 
> 
> On Fri, 20 Jan 2023, Ayan Kumar Halder wrote:
>> Hi Julien/Michal,
>>
>> On 20/01/2023 17:49, Julien Grall wrote:
>>>
>>>
>>> On 20/01/2023 16:03, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi Michal,
>>>
>>>>
>>>> On 20/01/2023 16:09, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 20/01/2023 14:40, Michal Orzel wrote:
>>>>>> Hello,
>>>>>
>>>>> Hi,
>>>>>
>>>>>>
>>>>>> On 20/01/2023 10:32, Julien Grall wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 19/01/2023 22:54, Stefano Stabellini wrote:
>>>>>>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>>>>>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>>>>>>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The
>>>>>>>>> current
>>>>>>>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a
>>>>>>>>> physical
>>>>>>>>> address.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>>>
>>>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>>>
>>>>>>>
>>>>>>> I have committed the patch.
>>>>>> The CI test jobs (static-mem) failed on this patch:
>>>>>> https://gitlab.com/xen-project/xen/-/pipelines/752911309
>>>>>
>>>>> Thanks for the report.
>>>>>
>>>>>>
>>>>>> I took a look at it and this is because in the test script we
>>>>>> try to find a node whose unit-address does not have leading zeroes.
>>>>>> However, after this patch, we switched to PRIpaddr which is defined as
>>>>>> 016lx/016llx and
>>>>>> we end up creating nodes like:
>>>>>>
>>>>>> memory@0000000050000000
>>>>>>
>>>>>> instead of:
>>>>>>
>>>>>> memory@60000000
>>>>>>
>>>>>> We could modify the script,
>>>>>
>>>>> TBH, I think it was a mistake for the script to rely on how Xen describe
>>>>> the memory banks in the Device-Tree.
>>>>>
>>>>> For instance, from my understanding, it would be valid for Xen to create
>>>>> a single node for all the banks or even omitting the unit-address if
>>>>> there is only one bank.
>>>>>
>>>>>> but do we really want to create nodes
>>>>>> with leading zeroes? The dt spec does not mention it, although [1]
>>>>>> specifies that the Linux convention is not to have leading zeroes.
>>>>>
>>>>> Reading through the spec in [2], it suggested the current naming is
>>>>> fine. That said the example match the Linux convention (I guess that's
>>>>> not surprising...).
>>>>>
>>>>> I am open to remove the leading. However, I think the CI also needs to
>>>>> be updated (see above why).
>>>> Yes, the CI needs to be updated as well.
>>>
>>> Can either you or Ayan look at it?
>>
>> Does this change match the expectation ?
>>
>> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> index 2b59346fdc..9f5e700f0e 100755
>> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
>> @@ -20,7 +20,7 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>>      domu_size="10000000"
>>      passed="${test_variant} test passed"
>>      domU_check="
>> -current=\$(hexdump -e '16/1 \"%02x\"'
>> /proc/device-tree/memory@${domu_base}/reg 2>/dev/null)
>> +current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@$[0-9]*/reg
>> 2>/dev/null)
>>  expected=$(printf \"%016x%016x\" 0x${domu_base} 0x${domu_size})
>>  if [[ \"\${expected}\" == \"\${current}\" ]]; then
>>         echo \"${passed}\"
> 
> We need to check for ${domu_base} with or without leading zeroes:
> 
> current=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/memory@*(0)${domu_base}/reg 2>/dev/null)
This check is still bound to the way Xen exposes a memory node in a device tree which might change
as Julien suggested. We need to have a check not relying on device-tree.
My proposal would be to use /proc/iomem which prints memory ranges in %08x format.
This would look like as follows:

mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
if grep -q \${mem_range} /proc/iomem; then
    echo ${passed}
fi

If you are ok with that, I will push a patch on Monday.

~Michal

