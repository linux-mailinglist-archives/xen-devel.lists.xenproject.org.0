Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5A79AAC7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 20:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599715.935254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflSR-0004gM-MN; Mon, 11 Sep 2023 18:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599715.935254; Mon, 11 Sep 2023 18:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflSR-0004dQ-JI; Mon, 11 Sep 2023 18:16:23 +0000
Received: by outflank-mailman (input) for mailman id 599715;
 Mon, 11 Sep 2023 18:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gqz1=E3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qflSP-0004c5-TO
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 18:16:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e001f69-50cf-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 20:16:20 +0200 (CEST)
Received: from CY5PR17CA0029.namprd17.prod.outlook.com (2603:10b6:930:17::31)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Mon, 11 Sep
 2023 18:16:16 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::25) by CY5PR17CA0029.outlook.office365.com
 (2603:10b6:930:17::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 18:16:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 18:16:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 13:16:14 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 13:16:13 -0500
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
X-Inumbo-ID: 4e001f69-50cf-11ee-8785-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5TVnxbq20FeYxQVLPVvgZO9UnRkr9/EQcVOh99n626p8QOdhF0XYEjfGgHVi4S4jwbSGOR0gBuD/d/8UfwQherq5KVncY7W2Oz6PaBhE17YcyU5+UbXC+bATomQKx7DQIxQnzdm31eY+86t6GnvCkClpKPm/wIee6G2nlcT4Xpe0rSLKwsY61FNBJGe6A12oGAMUbtYu0PBGD4VQZ+6giSQFbTma3EjfU5Vmphc3aLoLLeb6qZj3PrWPpVO6BW9vyE/Ghqfc7apIY2bRG5HcvvUt3itqnpGylMWcdalHU0tN/fdwrVJbVLCWz8iRslK5VwwBkXt9YCWocZ+01waMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7QQsQC8PI4iYV5qcLG2boDW5rT4GlLbXvyRbJx528U=;
 b=Grnk6oCzJpD1a3MrQy+YvOOOk6JKFUxbjydAsRUd+FakAq5nD9RG+AgbCSxU080INnKqGXxyO44KVFC43f5UvgdfhlI31AHK0vxqxXzqEBYTso9WMq7pmX/KjgWDyFBFQKN8kABdGNBtC/Rj6j473o4QeJo9sprsu/yMiZmsLp/2RfyIibwB0QA6+fSaf6SQ3TFffco4M/VGvoQpf/mifS1GWtjPErrEb6q4Tro67aiWLv+l0R5tLD7Zv7RkN8FRRQ1+9EZsWNR06m55vhv6ZvZLQrrHr5KOZqd1Ex0FLvoaiL50uyK+MmQ8x1eGz8/l++SxnfLkARTSrvXY2fNHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7QQsQC8PI4iYV5qcLG2boDW5rT4GlLbXvyRbJx528U=;
 b=m6Va8fSmgu0UV5QoB5IpGSZJLw0kfc/x+xjewC4rzd+oVOhBos1kEv0oxP0/9VstAJ8dY4Kffe3BOxmHfFDQqlIsX9hKmSbcWt19akC1P5BFw3yQsYbYtxsKInmS++U/vrOhatUAILlNz2T5Y5K3X8iEjgN21XNuIoQs5XKPHqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <92f59b7d-cdbb-762c-daf6-ab781ec3c453@amd.com>
Date: Mon, 11 Sep 2023 14:16:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 3/4] xen/vpci: header: status register handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
 <20230909021647.558115-4-stewart.hildebrand@amd.com>
 <3831c923-0344-7823-8373-ce4c1b48efde@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3831c923-0344-7823-8373-ce4c1b48efde@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f36a97-da11-4932-6744-08dbb2f33046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B5V96QB1dHmzxJCw8ITMtWL2UKVeYq5FoSmK+LbwIG4Il/CVe5p5CwnHQIBnAcMwcxZPOoSoO/8pigcYadOgadXZpPu25lQFrpMGp3uUeLgM7KJlpMYUfx01gwBcyHPMjM6p/4bHAgFao4YOCMVeqVZIvkm9TvBJ7YFG+kcH+kVE3ZTVRaZoxnvTmQehiTR+HSMmhI2+tRc4dJ2BHxHahJksgMH8kJyE0Pq6KcVWfLyt8Lf8ZSKgp4eXfSDBUeGEae5DOoBFLh3vfAWtosQjLq5xnBy1pVZp6+nrNTSHLrhjCjVi6yOo+Qimu9v6vX74wm4hquZvHcvGXtk+xm5Go/GQ07mIpTflS4hxpGWk1kTvCguAufLT9ieypQmOEMoVnpZvqQ5Tr1Oi17+cq9ZcQ0ONdglTTrU416hCPtA+7IsSkgzJx0CfMtJrVjfrfYttSPGZFHZrIB6uvSqNA/Mj6KGK9InUZGRzEKn2hhfdvjW1wxafM5HunxuGqv7U6WqDqtYyGSo2w09p4dSk1IlemS3LDJ6bzVZLHtmVYhXGXGzKQgCWhLhuF8ED5IQIjYlCwv052PQP39QXuf72yFeh3yg8LV885aHGVxyc70uaBvb5ZRqwidOXBNIgInyEFeAM3tyibOu60lK/LLDrN+63hChAXXXkOVWop21m2IevO7qTSp0SuRKL/WB4vsDw//d6/Qrhr3YPlBUgPCATlmtJb2OidE6HBBxE8ThMBrEIA/vU8S1zEsNSBmO/Aj7cWEv8Oi8CL09fr5K5bereHY9dCJvXuEcD8WXvX5btbgDOFwtrIgXI8jgXf73kuxFHGELm0+3jTHjQzHHV1juQdzbw3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(82740400003)(53546011)(5660300002)(70206006)(426003)(2906002)(26005)(336012)(83380400001)(44832011)(41300700001)(6916009)(4326008)(16576012)(316002)(70586007)(2616005)(8676002)(8936002)(478600001)(54906003)(36756003)(40460700003)(40480700001)(86362001)(47076005)(31696002)(36860700001)(31686004)(81166007)(66899024)(356005)(43740500002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 18:16:15.8055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f36a97-da11-4932-6744-08dbb2f33046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753

On 9/11/23 07:10, Jan Beulich wrote:
> On 09.09.2023 04:16, Stewart Hildebrand wrote:
>> @@ -544,6 +545,18 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    /*
>> +     * If mask_cap_list is true, PCI_STATUS_CAP_LIST will be set in both
>> +     * rsvdz_mask and ro_mask, and thus will effectively behave as rsvdp
>> +     * (reserved/RAZ and preserved on write).
>> +     */
>> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
>> +                                PCI_STATUS, 2, header, PCI_STATUS_RSVDZ_MASK |
>> +                                (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
>> +                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);
> 
> While not formally disallowed by ./CODING_STYLE, I think this kind of argument
> wrapping is bad practice. If an argument is too long for the current line, it
> should start on a fresh one. Otherwise at the very least I think we'd want the
> continuation to stand out, by parenthesizing the entire argument, thus leading
> to one deeper indentation on the continuing line(s). (This may even be useful
> to do when starting on a fresh line.)

I will change it to this:
    /*
     * Utilize rsvdz_mask to hide PCI_STATUS_CAP_LIST from the guest for now. If
     * support for rsvdp (reserved & preserved) is added in the future, the
     * rsvdp mask should be used instead.
     */
    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
                                PCI_STATUS, 2, NULL,
                                PCI_STATUS_RSVDZ_MASK |
                                    (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
                                PCI_STATUS_RO_MASK &
                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
                                PCI_STATUS_RW1C_MASK);

>> @@ -155,7 +165,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      /* Some sanity checks. */
>>      if ( (size != 1 && size != 2 && size != 4) ||
>>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
>> -         (!read_handler && !write_handler) )
>> +         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
>> +         (rsvdz_mask & rw1c_mask) )
>>          return -EINVAL;
> 
> What about rsvdz_mask and ro_mask? They better wouldn't overlap either
> (requiring an adjustment to the code you add to init_bars()).

I will add a case for (rsvdz_mask & ro_mask). See above for adjustment in init_bars().

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
>> +    data &= ~r->rsvdz_mask & ~r->ro_mask;
> 
> ~(r->rsvdz_mask | r->ro_mask) ? But maybe that's indeed just me ...

I will make this change.

