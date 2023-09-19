Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397507A6B59
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 21:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604983.942572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qigE3-0008Fo-2V; Tue, 19 Sep 2023 19:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604983.942572; Tue, 19 Sep 2023 19:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qigE2-0008DG-V9; Tue, 19 Sep 2023 19:17:34 +0000
Received: by outflank-mailman (input) for mailman id 604983;
 Tue, 19 Sep 2023 19:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iEDo=FD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qigE1-0008DA-Mb
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 19:17:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2df971ee-5721-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 21:17:32 +0200 (CEST)
Received: from MW4PR03CA0208.namprd03.prod.outlook.com (2603:10b6:303:b8::33)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 19 Sep
 2023 19:17:28 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:b8:cafe::42) by MW4PR03CA0208.outlook.office365.com
 (2603:10b6:303:b8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 19:17:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.0 via Frontend Transport; Tue, 19 Sep 2023 19:17:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 14:17:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 12:17:26 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 19 Sep 2023 14:17:25 -0500
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
X-Inumbo-ID: 2df971ee-5721-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdcZHCsg81DbtvqkODlYCVFb8poqQ9LN9WyeFHmPRO+oVqNvf+iTmNY/bmifIA5n2kzzXpgyyFUzqoNRH5u9LEJw2DyI45dzBpTNdN2gN5WWyr01egwdUk4WBhw+3HFzZkvXbeVuHYo26858RlH11PBp9TX34GKHMQFZ8anzEYi6xNhUaBBz+zMEkFnP+/4JXPmVagQwT+/iagqL6vC7+RllKPocZ1USf/elaeWVeMHVsW6NZcIMS48R74ZDEYXDKacWoIO/hmzRO51mQqx7vSHcWqxjPx6mjbJZGz/Afrdlm2JmcHswY7AOtyQowpKFDSsWRzwIIUdbqMcYV9nOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAjYIMDdlwHnbIhGnxSqSYCuhOn90sWgFRJSdr+6UHw=;
 b=P5s7id+SF8r/KtBIkWhgIksESbAk+DnfdQjArakRSeXX3WmCUqvYjiUddFYvLHM/TMqnC6AP9xwQZut5eIBv29a1umd/h5J1N0MpCrzuFlGJxPwrQU3uaCGpZ6rId2BBCyBzYofQnsS7h1suk1CjnpBCIqdD/M2Ax56qk543U+3bK0E+kKCyjS5MEUvk/0IGSZYWDuZJ38YwajR/C7jNH3D8eqkFZpNQSeoHQAAnDBRbQZMaJw39zqQYbYRpIhYDOvfwI07x0gn/l9k+6P3pdOJzbCF3l/dwYsrsCM/Yss6a7QpQsYW1LozEFjC6eYSqyM8e/7BpzO+m/STjhlUSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAjYIMDdlwHnbIhGnxSqSYCuhOn90sWgFRJSdr+6UHw=;
 b=dx5LmdPaNGD1INaOzlGukmImBrxILOuk92CiMSPN0othv4RkpRunRtEvJzBLcJUm5Lm3Dn9cwUoxRd6Pi3MqSvpDiTPpmtZBZAJCQ+2mrjCoNoP0KPDSqEGLi0Y7pgP1M2ecoCZDb2pt1xEA6LBMwcKQ90AGItKBR+X7LVh7knY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8f7bce50-2a30-087a-16c8-fd795131bc49@amd.com>
Date: Tue, 19 Sep 2023 15:17:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 3/3] ARM: GICv3 ITS: flush all buffers, not just
 command queue
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-4-volodymyr_babchuk@epam.com>
 <0cd6a4db-3678-446e-afd8-c99b47945a6a@xen.org>
 <c64d5af5-5d6a-4e97-9b6c-b3f916d32a09@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c64d5af5-5d6a-4e97-9b6c-b3f916d32a09@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0660a0-bd74-4f08-7e58-08dbb945102a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSioJmWaro64iLHL7CwDEh30nhegYXbdFxidwzdv7qtt3VhKNvLImtZaWlseMrTOMrVobYq7sl511dql+uMuOZSPP1lHILFa0HU0Eslujk8RxthFTblyE0kbKQ+XZpf5AI7w1+ONwcwBAggId9xnOMN9jyhnHmiT+t6CxJepH1pHqFgyNy3cAwqwM6+XvmbKYXQqr/YpnSgEaXNgdUD+HiHGRLc8hne9NUkFGPLJWyeXccdVIpoHisucnzRkjZEMh950I2jz9eaoRZtfkcMO8yKryd536lhf3iR+HVOojmACuyR5djFq4O0xea6N8vGPM/M0wc04Ezo6KtPwiMFhuJnqJZinnxf5M2hUcZuZoFHTvCi+gncHaCBZlX3ku5XRf3aQtAvVyaKBvyaKPfo8RLKxXaa5y/eAtVJ0I/01ETLY+Itg7dHMzr9AmnRf8dpMl3inG9RL2LRtKSCXBxU9d53bBHB5aKDe5tlGY2gUnMmuj0YawdDyAVzE9xpIxU90EAM13A0ZPkq7z0ayHEmjKmaY4Xf3VtCvbZZjAzFbPKafXQ0QgUT2vjkFuN+hQ7oeTjlzSNFVJ8O5ETYDoZ1pxTLB6jsn9Ua6pJ7/9SWbo4AAWulwuKLAZqYE8qy7AAhENNySWNxKIomky23JZmnHwqoXoANmxi2zUmgXlNJHkkY3jvmsDFhOO/FOboSWAO6B3oxhZcIv5NZu59goCEpFWAQI6Lk4SIBG2J+8kDkFFQQNHZgLIqtIES8Fx8c5cnmtfArl2wLv4gCysIFEGpuyoWiE81x5WvleCpbU0tdDKXVOafMOFcVwYHzldu8cDRBt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(41300700001)(70586007)(54906003)(16576012)(316002)(40480700001)(70206006)(110136005)(81166007)(40460700003)(2906002)(478600001)(86362001)(31696002)(36756003)(8936002)(4326008)(44832011)(5660300002)(8676002)(336012)(426003)(26005)(83380400001)(2616005)(82740400003)(53546011)(31686004)(356005)(36860700001)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 19:17:27.6596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0660a0-bd74-4f08-7e58-08dbb945102a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784

On 9/19/23 09:14, Julien Grall wrote:
> Hi,
> 
> On 19/09/2023 14:10, Julien Grall wrote:
>> On 19/09/2023 12:28, Volodymyr Babchuk wrote:
>>> ITS manages Device Tables and Interrupt Translation Tables on its own,
>>> so generally we are not interested which shareability and cacheability
>>> attributes it uses. But there is one exception: ITS requires that DT
>>> and ITT must be initialized with zeroes. If ITS belongs to the Inner
>>> Cacheability domain there is no problem at all.
>>>
>>> But in all other cases we need to do clean CPU caches manually, or
>>> otherwise CPU can overwrite DT and ITT entries. From user perspective
>>> this looks like interrupts are not delivered from a device.
>>>
>>> Also, we will rename HOST_ITS_FLUSH_CMD_QUEUE flag to
>>> HOST_ITS_FLUSH_BUFFERS because now this flag controls not only command
>>> queue.
>>
>> Reading the specification, CBASER will indicate the cacheability for the
>> command queue. But I couldn't find any reference saying this will apply
>> to the ITT as well.
>>
>> If such reference doesn't exist then...
>>
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>   xen/arch/arm/gic-v3-its.c             | 7 +++++--
>>>   xen/arch/arm/include/asm/gic_v3_its.h | 2 +-
>>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
>>> index 72cf318810..63e28a7706 100644
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -107,7 +107,7 @@ static int its_send_command(struct host_its
>>> *hw_its, const void *its_cmd)
>>>       }
>>>       memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
>>> -    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
>>> +    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
>>>           clean_dcache_va_range(hw_its->cmd_buf + writep, ITS_CMD_SIZE);
>>>       else
>>>           dsb(ishst);
>>> @@ -335,7 +335,7 @@ static void *its_map_cbaser(struct host_its *its)
>>>        */
>>>       if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
>>>       {
>>> -        its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
>>> +        its->flags |= HOST_ITS_FLUSH_BUFFERS;
>>>           printk(XENLOG_WARNING "using non-cacheable ITS command
>>> queue\n");
>>>       }
>>> @@ -699,6 +699,9 @@ int gicv3_its_map_guest_device(struct domain *d,
>>>       if ( !itt_addr )
>>>           goto out_unlock;
>>> +    if ( hw_its->flags & HOST_ITS_FLUSH_BUFFERS )
>>> +        clean_dcache_va_range(itt_addr, nr_events * hw_its->itte_size);
>>
>> ... I think we need to have this flush unconditional like Linux does.
> 
> I forgot to mention that this likely want to be a
> clean_dcache_and_invalidate_va_range() (see my comment in patch #2).

I turned it into an unconditional clean_and_invalidate_dcache_va_range() and did a quick test, and it still fixes my test case on VCK190. So feel free to add:

Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

