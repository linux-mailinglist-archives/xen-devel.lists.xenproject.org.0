Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242D78F48E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 23:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594131.927347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbpAv-0006iU-PG; Thu, 31 Aug 2023 21:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594131.927347; Thu, 31 Aug 2023 21:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbpAv-0006gG-MB; Thu, 31 Aug 2023 21:26:01 +0000
Received: by outflank-mailman (input) for mailman id 594131;
 Thu, 31 Aug 2023 21:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUvY=EQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbpAu-0006gA-Ft
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 21:26:00 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c8fb2c-4844-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 23:25:57 +0200 (CEST)
Received: from PH8PR05CA0013.namprd05.prod.outlook.com (2603:10b6:510:2cc::13)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 21:25:53 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::16) by PH8PR05CA0013.outlook.office365.com
 (2603:10b6:510:2cc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.15 via Frontend
 Transport; Thu, 31 Aug 2023 21:25:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Thu, 31 Aug 2023 21:25:52 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 16:25:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 14:25:49 -0700
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 16:25:48 -0500
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
X-Inumbo-ID: f8c8fb2c-4844-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZXgp1CGWv546XmMZyt3danyIQpe91MQ2E1vY/e16YI2kx9vM6b7kIYBoDLjHzEK3QGohzyVB5g3mEN8+EedGACcwYzwPZoW1Trw1Y21yisKJfiwOx+kqUT1WSPqHrFkLeYU3pXj2092l3bBf/tt9EhTSnaDNEt2MkJAsmWSKjC/pM4kTVQAstm7jhECgxy8DAC745Xy5X3p7xptEpQ+hQnWZ72ztHcGYgo6Zx+NWPuIb3cLhxOKMhdkaLYhZeh6U82u2e9ZGvtGBkiNcvAUHtilKVtm00xnEgw+YXA+eaqcU2SWk9jE13iflRMQ0sJXQ/PR8gZGgkI2/2a7Lw8jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaBWwXpf658zMtoukGSiLI8p7aWcUQD9GY28Ew0Ng+0=;
 b=hRXnjKqCudAY2eS+E1Lq9x74x5MZFaT8YKyDz/cN1eNV4mIdSljgia3tZbbVhFDZlHwfDtw8bKs51G16xSJkB42g30kjspaSXj8eeBcKz3H+2tnmISgVyvFJpUoT2RRHRj/5VytI7hEpfx4EmUhPdoEoKTFPUwU+vwj3nsVWMluxqchGTMTSJKXfNUJWC80jv51rpxKyf1ih7SNtUFPJ9i9nxcnyqRT/62sYLtwcGuWtn03YhW12jaLl91h4qBBUiHv7EQTN61rPGBcw9ozJ3AlQfgxMijJvHqXH0es2//DPM0gf4i7Y3N+sn7FMGvC1DLPs99zMonjEhs4LSBQIvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaBWwXpf658zMtoukGSiLI8p7aWcUQD9GY28Ew0Ng+0=;
 b=BVwQASuNwbPj+zi5yr8tm9s4GbD5k4CfxfWtHhnXFYcNMwunH7MnuJC4phRh39skW7aMfoQgZG65CTu7CfsH9S0fJRNY7Cbl34HT6eV248KmXVziKc2Ze7Rh29afXFaSW/wcY1IjaDxy+HVyuTMtEKFrUcsMizJwDHZHfR97PKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f7457387-e8df-ae80-327b-2a7ba7428266@amd.com>
Date: Thu, 31 Aug 2023 17:25:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/6] xen/vpci: header: status register handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-5-stewart.hildebrand@amd.com>
 <4a082785-7da1-caf9-3193-eb0a9a77a7bc@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4a082785-7da1-caf9-3193-eb0a9a77a7bc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9646f3e0-5ffa-4a09-c479-08dbaa68da83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qkk7ljRqWmlDbL9FuVtDnqMByFhP6FVMpRH8lIuLf0jTjn8LQMizdqmNhWJoowXrz2q61EW8M19lrSncMeCJ+wQ44E3EtWwAA1ViITp762e2h0AZ3bLyntmEYp9ElwdDUMtby3ZSZiUbl+FFeoAeAjiOQ30UOv350Ktq52JyVqACAUJTDGhiIBvEHzfOg7cRSeZuQMM8IqyF7dwkgC056hgUKRLX8FUT22LYehS7bnStbPoVY9EvriwLP/ZN68Tk1QO8HqH5Uy10ayX44FYAvZDY9qnj3Rz08fLVMDm2YhmPHgYiLISkkqUMLzTn14dQlf/jPri+QCsdHZ03QZbQUQ8z6esdosRAAlW21OIpmmNS1eGufF9qJkKdjo7h2fPa4xGvkV0D/7vbBfFooSvQhwVTaA+DvaGTkuGtugHvqdo3MpRC0QBxDi0LCA23Z437hhroU6fVXruc0BXl3ueQlDak4RKt1Gq2hfJKjGwHG4kg3vUaaRA7E9OLY6WNBOCijSDKW1qrlVIiGujMLl8oecyanQeFdqdDzcU6naz6/PRTHpXLptpNsC5ubIFKzZakFyBBjHntlCRz1wFL6dOOGTlKsOpHFv5IAb9cxYlXRP0lJG69ZpugVw24+QK7FMXGh2q2xyEea0XEz5as95V8iio5DUgim2ISgDSpVZjMO+wARhmbAv3R8b8lmu/G90HnHYKgGrVSbEopY8YiKZ2A9e3zJObXtBfmm6ElOi8n1tR3L/fBe+xltIlhY02HP0grR9S8494H8Lkc/Zy2LeVgnz/TCLFpzgSiKwUOws1L2ufN9lRqdfsUyw7kgci2ezGy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(82740400003)(31686004)(356005)(6666004)(40460700003)(36756003)(86362001)(36860700001)(81166007)(40480700001)(47076005)(31696002)(2616005)(2906002)(426003)(336012)(26005)(53546011)(83380400001)(478600001)(70586007)(70206006)(8936002)(54906003)(8676002)(4326008)(5660300002)(44832011)(41300700001)(16576012)(6916009)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 21:25:52.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9646f3e0-5ffa-4a09-c479-08dbaa68da83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651

On 8/30/23 10:05, Jan Beulich wrote:
> On 28.08.2023 19:56, Stewart Hildebrand wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -413,6 +413,18 @@ static void cf_check cmd_write(
>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>  }
>>
>> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
>> +                                     unsigned int reg, void *data)
>> +{
>> +    struct vpci_header *header = data;
>> +    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
>> +
>> +    if ( header->mask_cap_list )
>> +        status &= ~PCI_STATUS_CAP_LIST;
>> +
>> +    return status;
>> +}
> 
> Imo we also cannot validly pass through any of the reserved bits. Doing so
> is an option only once we know what purpose they might gain.

OK. I think in the long term, having a res_mask in struct vpci_register for the reserved bits will be more flexible.

> (In this
> context I notice our set of PCI_STATUS_* constants isn't quite up-to-date.)

I'll add these 2 new constants in the next version of the series (in a separate patch):
#define  PCI_STATUS_IMM_READY  0x01    /* Immediate Readiness */

#define  PCI_STATUS_INTERRUPT  0x08    /* Interrupt status */

>> @@ -544,6 +556,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
>> +                                PCI_STATUS, 2, header, 0xF900);
> 
> Rather than a literal number, imo this wants to be an OR of the respective
> PCI_STATUS_* constants (which, if you like, could of course be consolidated
> into a new PCI_STATUS_RW1C_MASK, to help readability).

OK.

>> @@ -167,6 +174,7 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      r->size = size;
>>      r->offset = offset;
>>      r->private = data;
>> +    r->rw1c_mask = rw1c_mask;
> 
> To avoid surprises with ...
> 
>> @@ -424,6 +443,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>>          uint32_t val;
>>
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->rw1c_mask;
>>          data = merge_result(val, data, size, offset);
> 
> ... the user of this field, should you either assert that no bits beyond
> the field size are set, or simply mask to the respective number of bits?

Good point, I'll mask it (in add_register()).

Stew

