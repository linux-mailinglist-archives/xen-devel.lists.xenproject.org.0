Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F378707E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 15:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590097.922200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZAYz-0006H4-BT; Thu, 24 Aug 2023 13:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590097.922200; Thu, 24 Aug 2023 13:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZAYz-0006Ec-8Q; Thu, 24 Aug 2023 13:39:53 +0000
Received: by outflank-mailman (input) for mailman id 590097;
 Thu, 24 Aug 2023 13:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGcK=EJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qZAYx-0006DD-3B
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 13:39:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af9469e2-4283-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 15:39:48 +0200 (CEST)
Received: from BYAPR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:74::39)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 24 Aug
 2023 13:39:41 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::60) by BYAPR05CA0062.outlook.office365.com
 (2603:10b6:a03:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.16 via Frontend
 Transport; Thu, 24 Aug 2023 13:39:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 13:39:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 08:39:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 08:39:39 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 24 Aug 2023 08:39:37 -0500
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
X-Inumbo-ID: af9469e2-4283-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilzmrnHhor3fi3LPmlbSPz9mlitlejq5mWUswMw7H3osunvDlx6/Yx+o4omEKxFjMOYHGm8MDmPJOBNu4I2pxHh6s8mL+6C6d2oLjCbqF2pJbjP2jobT6ZUN9g3PDlaUoJaDLGG2izQuiPQx7gGZfQI3frqZReWrN0Dse/n6/VPR5Yl7Z4i0WWm5mAbqdO2ES9Yl0kkj/breOrcmW7mQsn0ZlY6T4dtJut9lcfu/fWdWq53LXRYpp9epPhNX7HkyAvN2M+zqH3oqWRkwcSnjCwk2ROupqIOjL6NiW5bxtbevlUPQAESoc/1duShcf4wqlqt4rcnbL1Gr6Qjw5NnEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzAVq7FBKbalGVxY19Sfh7t9k2onMZOvIBjHHESx7Z4=;
 b=QAf/L54Od+OjpzLXsr0mubm6aOnuGSL3YHWcWDNXpGLdPuxAl8u2sysQPA5t+iaxeuieU+Z31uVyDlmmVq74kcUEiX3ux5nNDYyNImYYb3h8gD49Zisqi/jWjZte2xNYmRkBnZ5vpUFqZkWdnNMJliixktSnr+AOTNPIKz+N3xycXbau2rGdAP0jv9pOqPB4MnAyFSywbkSCBIc0m2kubHZAPIwwgwgmE8dA75rw8sEib+fzYwtxZ+0HL9vqEaIlXwvuEfem0CCTcU0nkGIgJTLCfhYbDiudp412t4wT16xj42Ah3IbEI7vF0pBBIaHSx5lVgmf+Ush4hRcMw/iF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzAVq7FBKbalGVxY19Sfh7t9k2onMZOvIBjHHESx7Z4=;
 b=VAmqVsHRilMTQmTvj412wGulG2or8zvjIGIyXLMZJCGR2amfiRwrsy9AkCQI9NKUyl61vKchMdp0XKhXqvcru5O9w70ukQky/M0OIGgvSV8vJtZ2ys8HEGMJdkso7wfIlksjMLhcpo3IGjRwEmAxq4BW82QDi1ur0hzRsYoR69s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <abcd57c6-1882-297e-ce62-dda79f792bf0@amd.com>
Date: Thu, 24 Aug 2023 09:39:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] xen/vpci: header: status register handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-5-stewart.hildebrand@amd.com>
 <f61146cf-096d-606c-591d-516d659528c5@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f61146cf-096d-606c-591d-516d659528c5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c56d93-d13c-45a2-cdff-08dba4a79148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xmjSTxMg6esahat8mbkqF8Vb7RNv6dkNgz36ZbvsNm7U6OVnqc+vMyLV9BfGxodBcZqsx4k5Nzgb+jhcOPeNo//yyVixnaV2FyuRh8+OSFAh7+gGZIu8Qb8ApRObVUiqhs3eAV+nNfIxAcYpM8KNui4uGAD9ontH/TyaoFMabS60kJtEvK3cjQIynfIM5q1TPIGY43DB3bzx7RuMkl2tig+UTUu+C6ovDyjxJgE43WGsDkWcFO5v+6oqUemcOxTOwZ1rFowF5WlagylytwzqZ9yTFhzjEx2Xm1BchcJnTAKz37uoh5Zj29HM0pAYqlRLjiVhzZcYgGQyjsYeMzJHSr7tvoX3fFJnxfFXc4P5VjwOYnkidbjpMtAtxsEwm9ryZOTy71OWalkwQjpaD6cb7FP0gKZdAApHx9/PKIFFrtnL2CcOnz3q9fwqyJRU5OBccxthWPPIckx3Yr3bf/FJZ2lT+TA4cnwERe+LeIZTk1VDTeHJI9I1eXPGHKUvPMladpxhocgBwaQs06tyUaLq+ZgKd3SH2hJOOsRu/3R+tJi1CZK6t2+KItFRytKXvh9J7vwf9auyh/oADpDVy0K7S8R50pR14fiN4z/4w801PWgk89FPerLKLy502YNZ7NYk/M/TnLaocdAoFxcqm+jIHMxs1eiZhW29jC64N0d2sNY7edOhqgNuReXJHSTL41xAO17stLy61ot6PVHhgi7zfBZ2ZiGHlfApJjJQOLcngIe01rFG2J8aSsJlANpiCGkRHf+IbTtUXxdFG99cGZX90Iz7wMS1CFliceDndrRr1ZepqBZI5Xzs2OVEo4h+xNKH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(8936002)(6666004)(53546011)(966005)(478600001)(2906002)(83380400001)(336012)(26005)(426003)(2616005)(54906003)(316002)(6916009)(16576012)(5660300002)(70206006)(4326008)(44832011)(8676002)(70586007)(41300700001)(40460700003)(36756003)(40480700001)(47076005)(81166007)(36860700001)(31696002)(86362001)(356005)(82740400003)(31686004)(43740500002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 13:39:40.6393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c56d93-d13c-45a2-cdff-08dba4a79148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531

On 8/22/23 09:54, Jan Beulich wrote:
> On 22.08.2023 03:29, Stewart Hildebrand wrote:
>> Introduce a handler for the PCI status register, with ability to mask the
>> capabilities bit. The status register is write-1-to-clear, so introduce handling
>> for this type of register in vPCI.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v2->v3:
>> * new patch
> 
> This being a prereq to the cap list filtering, I think the order of the
> patches wants to be inverted.

Will do

>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -413,6 +413,17 @@ static void cf_check cmd_write(
>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>  }
>>
>> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
>> +                                     unsigned int reg, void *data)
>> +{
>> +    struct vpci_header *header = data;
>> +
>> +    if ( header->mask_cap_list )
>> +        return pci_conf_read16(pdev->sbdf, reg) & ~(PCI_STATUS_CAP_LIST);
> 
> No need for parentheses around a constant.

OK

>> +    return pci_conf_read16(pdev->sbdf, reg);
> 
> I think this function would better issue the read just in a single place,
> and then do any fiddling that may be needed.

OK

>> @@ -556,6 +567,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
>> +                                PCI_STATUS, 2, header);
> 
> Is it really correct to treat the entire register as rw1c, and with write-
> through to hardware for all bits? There are reserved bit there, and -
> however likely that may seem - it's guesswork whether they would also end
> up r/o or rw1c once getting assigned some meaning.

A bit mask would make more sense, so I will change it to a bit mask. As another data point, qemu also uses a bit mask [1].

[1] https://gitlab.com/qemu-project/qemu/-/blob/v8.1.0/hw/xen/xen_pt_config_init.c?ref_type=tags#L645

>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -29,6 +29,7 @@ struct vpci_register {
>>      unsigned int offset;
>>      void *private;
>>      struct list_head node;
>> +    bool rw1c : 1;
>>  };
> 
> I'm not the maintainer of this code, so what I say here may be void, but
> generally we have blanks to the left and/or right of colons in bitfield
> declarations only when we mean to pad for alignment with other nearby
> bitfields.

OK. With the change to bit mask, this will become uint32_t rw1c_mask;

>> @@ -205,6 +213,22 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      return 0;
>>  }
>>
>> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>> +                      vpci_write_t *write_handler, unsigned int offset,
>> +                      unsigned int size, void *data)
>> +{
>> +    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
>> +                              data, false);
>> +}
>> +
>> +int vpci_add_rw1c_register(struct vpci *vpci, vpci_read_t *read_handler,
>> +                           vpci_write_t *write_handler, unsigned int offset,
>> +                           unsigned int size, void *data)
>> +{
>> +    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
>> +                              data, true);
>> +}
> 
> I'm always a little irritated by local functions still retaining the
> subsystem prefix. Just add_register() for the now static helper would
> imo be enough here and overall shorter to read/type.

I will change to add_register()

>> @@ -433,9 +452,11 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>>
>>      if ( size != r->size )
>>      {
>> -        uint32_t val;
>> +        uint32_t val = 0;
>> +
>> +        if ( !r->rw1c )
>> +            val = r->read(pdev, r->offset, r->private);
> 
> Along with the earlier question: Doesn't rw1c need to be a bit mask,
> not a single boolean covering the entire register?

Yes

>> @@ -99,6 +106,8 @@ struct vpci {
>>           * upon to know whether BARs are mapped into the guest p2m.
>>           */
>>          bool bars_mapped      : 1;
>> +        /* Store whether to hide all capabilities from the guest. */
>> +        bool mask_cap_list : 1;
> 
> I think the intention here is for the colons to align.

OK

Stew

