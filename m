Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5D7F31DB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637890.993953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SHS-0007GD-5y; Tue, 21 Nov 2023 15:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637890.993953; Tue, 21 Nov 2023 15:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SHS-0007DN-2w; Tue, 21 Nov 2023 15:03:14 +0000
Received: by outflank-mailman (input) for mailman id 637890;
 Tue, 21 Nov 2023 15:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/0D=HC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5SHQ-0007DH-V3
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:03:13 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15e199e8-887f-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:03:10 +0100 (CET)
Received: from PH8PR21CA0010.namprd21.prod.outlook.com (2603:10b6:510:2ce::10)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 15:03:06 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::b1) by PH8PR21CA0010.outlook.office365.com
 (2603:10b6:510:2ce::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.3 via Frontend
 Transport; Tue, 21 Nov 2023 15:03:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 15:03:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 09:03:03 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 09:03:02 -0600
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
X-Inumbo-ID: 15e199e8-887f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3F5HVEJmdOE6S/Iwc7o/T1H5p7eu1e1diTD1gQsf24i0SEt0TRcjKhrMtSagm7wX1b1UUFcZ3b4Pjrt+vweCFqEQw96wO6vHCmyt4L4mS3LWhzFC4ONkhm8iofq41+0ZkinA6433LwE10TRPEG9l+03UNsl0bVawl34GWh+UzKiXl2Ya/91f9gUio1tT2trIHGro+jM8AEz0PeIhCOExjiSGeOj3Z/uMk70U2SINB1DrG5u/3ESGIzxwNigtRG2yyGD9MCfoEvUs7X3AFgF5O+vx6iszeScz9URCoAMw86GTiZIEzzyMcbY2q3FdDZt3ix8dg0LhrPHwHmbGLMd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZjCeIViNFPBeWOfwkFNr1a8tUg1r3zE/BcwzWJzM4U=;
 b=bV/wzm/db4TAyfm/pFMUTawLpZbSGIGeKqks4J/Azk7eIZvJdOW16bxlGoIxuXYVAAJfuNaJXRGfXxNBnf8DowOJbi8kHgWVaTReOxMtFmMb6PMP8kctjxl3P7Az/9UW+hjsKHETRJs3NmK8sXbv9uibFbPXQom/5vBpuxMnQ1YxxSSsTaoYf1rAytI2CPRbQyvZASkp4lCVQKHtvPILW8dnvMVM6ibUC+60/YPY46TbB2x6s9xQ0Rkisy5wHat7otDfVsEYLF/idKIxj36iaQNUWJvptvKc0ObxyM+/4ftVIdxOngb72J0IQt3UWiho0ALq/Y/Jia5KzAaHj1tRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZjCeIViNFPBeWOfwkFNr1a8tUg1r3zE/BcwzWJzM4U=;
 b=X1aLYRzD8OxqHabk1D71AoIylZlOIOcDhqoz6viBSPWfeOLrmPJK2JitZlPZhPa99HmCxZxRpvEhbm6cszyWmBTybAVpFtWzpvwHWDC/OiTIxxDxOV/FsYvpBFpQ/vuJ1A05+0L7zGeOBgMwylNLFRNu8hAmM+HTnbs9Iy2szlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <081547e8-696b-4741-b9b6-bc92c221f01a@amd.com>
Date: Tue, 21 Nov 2023 10:03:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVzCn60-qvdRsi3q@macbook.local>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZVzCn60-qvdRsi3q@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b82333-b551-4bfa-f414-08dbeaa2f782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zFl7VGUm1bFE/nMOn9YBs3q9Ix/fPluDkcaCLpaVZnHi2iuwbPCWaLPC/X3gA+lJM/Ob1dA7y26Vy5pWxLoveLTpiIzgZlr4LAetuVUlq5RT6rpKD4rdqbLNr2LluCVZz4pskzT3+soaGGEsnk71zwyOhkAjS6Z1VOhfZvmCqEMk9q9cXpDb9d1Q3mzlxod/xKVpZpGaSweBbDxByfg47c5arrRz1qUx2l3NSmEdBvSk5AUzujiw5sFnkQokGH/lDDEWFeYgDWlgRZ37EQc4cTr/IfCPashjH6Jk55vqwZg9xf3pzsKd7Sx4dYq3sqqlrPLNkXfJ5YTiX0tzqNust866A/8+DcurM4ntBkHJWgUKX+xr3XZoJAyP6AW5nFn/m4kfaDQ1mz0+qW8ciGgpLAcQK0gp6xRFkZvLPyhhBCHHc+OSR+WXFlqNLqTRIs2Z6jHLj15tHtzcmMiARORbIBkVzyUWlGXdOGk4yjxbqk659o1Db6UvLnBfBXhNjtwoSuKit2/csl5vxUIPwnOaPGoIONuKOh7M84yK8AJOJEs7m10nWjE4kLK1u67N8Nm5LOyuI8Ejgi0EoZYFmdb07XUFJtP+Ls4w6v1B7lg7b+hoUqJKWTVF+ns80xNL4DfGHHa7TTwW4kmV9APZlmJrnwz84Aescj/A62Ev7ZBE2A4j1s5NQETUkMFsaCJsoMIqxQ//LaDoKgZ82TfbxN8o8J0ljJZ1e12bAcjevyl65gTPBofg38MA6Eft2fahqbFuE03bd3CeP1xAnCqZXCxrIZuaC6DKwcbiDULRzb/uViK6EL4ldh3njsOBIuUukwzGOcy0g1CyolTDHLr4qS91cQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(41300700001)(66899024)(36756003)(86362001)(5660300002)(31696002)(44832011)(40460700003)(2906002)(47076005)(356005)(31686004)(40480700001)(81166007)(26005)(82740400003)(336012)(426003)(2616005)(478600001)(83380400001)(53546011)(4326008)(70586007)(8676002)(36860700001)(8936002)(16576012)(316002)(6916009)(70206006)(54906003)(43740500002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:03:06.0588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b82333-b551-4bfa-f414-08dbeaa2f782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390

On 11/21/23 09:45, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>  
>>  /*
>>   * Perform a maybe partial write to a register.
>> - *
>> - * Note that this will only work for simple registers, if Xen needs to
>> - * trap accesses to rw1c registers (like the status PCI header register)
>> - * the logic in vpci_write will have to be expanded in order to correctly
>> - * deal with them.
>>   */
>>  static void vpci_write_helper(const struct pci_dev *pdev,
>>                                const struct vpci_register *r, unsigned int size,
>>                                unsigned int offset, uint32_t data)
>>  {
>> +    uint32_t val = 0;
>> +
>>      ASSERT(size <= r->size);
>>  
>> -    if ( size != r->size )
>> +    if ( (size != r->size) || r->ro_mask )
>>      {
>> -        uint32_t val;
>> -
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->rw1c_mask;
>>          data = merge_result(val, data, size, offset);
>>      }
>>  
>> +    data &= ~(r->rsvdz_mask | r->ro_mask);
>> +    data |= val & r->ro_mask;
> 
> I've been thinking about this, and the way the ro_mask is implemented
> (and the way we want to handle ro bits) is the same behavior as RsvdP.
> I would suggest to rename the ro_mask to rsvdp_mask and note
> that for resilience reasons we will handle RO bits as RsvdP.

But the reads behave differently. RO should return the value, RsvdP should return 0 when read (according to the PCIe Base Spec 4.0).

