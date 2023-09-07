Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCED797DF0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 23:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597627.931863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMZK-00084V-FI; Thu, 07 Sep 2023 21:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597627.931863; Thu, 07 Sep 2023 21:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMZK-00081w-Bw; Thu, 07 Sep 2023 21:29:42 +0000
Received: by outflank-mailman (input) for mailman id 597627;
 Thu, 07 Sep 2023 21:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z0z=EX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qeMZI-00081q-Ju
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 21:29:40 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a558bfcd-4dc5-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 23:29:38 +0200 (CEST)
Received: from MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37) by
 DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Thu, 7 Sep 2023 21:29:34 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::80) by MW2PR16CA0024.outlook.office365.com
 (2603:10b6:907::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 21:29:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 21:29:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Sep
 2023 16:29:33 -0500
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 7 Sep 2023 16:29:31 -0500
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
X-Inumbo-ID: a558bfcd-4dc5-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZummQYP4M3023etmkOZoipwjZNuY8ZTI2BDbf6SDNUzaLsxU6sNtHtRic8y80UODHvgX07NAkIl+XBVvnnFZ13XpDOLmBSXmqwHAeoOo+emjREEi01NvV3I/bJVkR7P0W5WVTcc95cq0PfgZgnFVxIjotWohG1wVcjth/axgaYLZN/hV/YPeRLIazB0nE2/tiFLkOZqFHag5AD1Tv0qt/yTnuaM2T6VEft26KT+EBC82QMeThL8guTG7/5b5f7w0WVHiH5FjeTkzohtvJ6LkNDE8NLJedSoLwcs3trOoqTcBQ3ghfKn3ufcz9Y1ok3uq8gr8Dial9cyQRvHtf74WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7pZLkaL/3fSJFdkzpJCUAbt7g1aaVqlOjGFX6Gd83c=;
 b=cbiVCSaCSOOeNeWmrXRh733nYhzyzZbQm1ghsbvBqHcNIM7rzfWMpo3wTsGB4nUDOPh7hZokzgp+06dnRoQjk4P5UwR79YwZqpulAjZf69/oGwYzaFLqql8mPTxmkoJ4s/yruhe4/RSqUDWZculfXd9KqUMI1RK3T03eqDNsgU+8W2FvElVqlXxJMFJ5A0vgw76u3K7hWjL//UxgpdVmymGeikC1mNwZysXB1WLCeW/xY8CCV9od+Ka7lTlqd1LpbjAepzYAWe4IPfjuDPi5XWAxK3KL5FMJhYrt4kAO/ys0PdDE1qHR1guul9cJqJwMjTfPsFXYf16NxqnnFKfiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7pZLkaL/3fSJFdkzpJCUAbt7g1aaVqlOjGFX6Gd83c=;
 b=H4wGjq0opVc9H3tlCWKCxpzgl646uzx2hzAYeAnZyCH0CyY4fFh/IuejTghKFYk+PWOpZ7NIDRQc9eRgsA3i5oGRvIjLzgs3atiUUWN4Zx+RkbcaK8X2M94pZ+KJHyxG5+Or5GjqDTNN5gunhzsEPZ76suW5WyeBfJQgGW2Tum8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d8de036e-8774-ca96-3fa4-1c9bd087ea7d@amd.com>
Date: Thu, 7 Sep 2023 17:29:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/5] xen/vpci: header: status register handler
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
 <20230901045742.235975-5-stewart.hildebrand@amd.com>
 <3b816ecd-e7a6-c6a9-9b42-b9287deac111@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3b816ecd-e7a6-c6a9-9b42-b9287deac111@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 09469560-629e-413e-389a-08dbafe987be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wyuywkRv4HulabvbzsKgaJpHKKV5jYzDiW4HtOVWEKDARlwf/nXwbwPjFcWvYQT8vphW/ZeXJj0t7vvV+5Z0Vwjzl9F85B6c76h57dTpN923QbH1xwauJZcyRAqc8D61r9XMW/zqW8xSGUlwuZ2MYdgxtk1+BApwvPkRsP/sSWC+JmmO8ZnxTdF0G4DE0WuZAOrQlt7uMTWbSK50rB0ieLARLvp6hbmQZ+qBkmRFXmZZqpmkydoJI+df80IUloQ3lN9LPmorFhdaZpXLYprXpmJ+j31u4TpXOJ717oyeYkzeuZWbI6Ldt206yEXdDaYJLiIMsXvGXB/VGBh4pkXKfhdd5rwy8QGuxHfWZ6P4+lC1xcSzWPaxtbJk6DLa1KntSYGTw60W9T2yVLumX5KkDteBR6bRuLDl7ym/wjgJB8Hp6aKoQmBQOC6CDkxihrtZ+mU3icR6GnPggbgpzz60j08pp0MudywsSXleAh71kIlwQJ07thIeRY4sPoyhA3zMZ93y/SNwt55MBhlhluDjojIbuQPq0CyddKvNCa7TU6hxIYiAC8Ov0HT3CFrQv7zMyqS7kObA2oMvdYhnGEy0p6nnYQjC7VFsW3boq8ERrFIbiYhEY9uoHLMtVKrE+ApxCq9UyLNzUYFSuy+quwqe6itT+RMunLgQmHYhSf3QJ0bxkUSb6zWLOMLG6k8wpvuynfd7sltuqZXnwWlgUkyTBnjeEqLAgx6pF9gKRVyb3IWGME0FJIS2JjqPUKrqx69BnCPgQIEtDZ15LJVHVrNKQz0Ml1lfOTS02difdbzuZRhew9GzB5B/qPyzqlmLh1YD8n6XOzEW+afe7EEddqe0nA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(478600001)(6666004)(16576012)(316002)(31686004)(6916009)(8676002)(2616005)(5660300002)(44832011)(4326008)(41300700001)(26005)(336012)(426003)(83380400001)(2906002)(36860700001)(8936002)(47076005)(356005)(70206006)(82740400003)(81166007)(36756003)(54906003)(53546011)(86362001)(31696002)(70586007)(40460700003)(40480700001)(36900700001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 21:29:34.1125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09469560-629e-413e-389a-08dbafe987be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827

On 9/6/23 04:22, Jan Beulich wrote:
> On 01.09.2023 06:57, Stewart Hildebrand wrote:
>> Introduce a handler for the PCI status register, with ability to mask the
>> capabilities bit. The status register contains reserved bits, read-only bits,
>> and write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a
>> bit in the bitmask is set, then the special meaning applies:
>>
>>   res_mask: read as zero, write ignore
>>   ro_mask: read normal, write ignore
>>   rw1c_mask: read normal, write 1 to clear
> 
> With the last one's name being descriptive of what the behavior is, would
> it make sense to name the first one "raz_mask"? (Also a question to Roger
> as the maintainer of this code.)

Another possible name is rsvdz_mask. See below.

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
> Do you actually need this function? Can't you ...
> 
>> @@ -544,6 +556,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>
>> +    rc = vpci_add_register_mask(pdev->vpci, status_read, vpci_hw_write16,
>> +                                PCI_STATUS, 2, header, PCI_STATUS_RESERVED_MASK,
>> +                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);
> 
> ... conditionally OR in PCI_STATUS_CAP_LIST right here? Without
> capabilities the CAP_LIST bit becomes kind of reserved anyway.

Hm. The PCI_STATUS_CAP_LIST bit is a read-only bit according to spec. Given the rationale below, we would want to preserve the value of r/o bits during writes, so this would essentially want to become a RsvdP bit. I wasn't planning on adding support for RsvdP bits here since there aren't any proper RsvdP bits in the status register. If instead we are okay with treating the PCI_STATUS_CAP_LIST bit as RsvdZ, then we could do as you suggest, but I'll plan to keep it as is for now.

>> @@ -424,9 +450,13 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>>          uint32_t val;
>>
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->res_mask;
>> +        val &= ~r->rw1c_mask;
> 
> Personally I'd fold these two lines into just one (and similarly below).

Will do.

>>          data = merge_result(val, data, size, offset);
>>      }
>>
>> +    data &= ~r->res_mask;
>> +    data &= ~r->ro_mask;
> 
> This seems risky to me. I'd rather see the same value being written back
> for r/o bits, just in case a device doesn't actually implement a bit as
> mandated. 

Regarding writes to read-only bits: okay, I'll assume that Xen should take care of preserving the r/o bits (discarding the guests write value for the r/o bits).

If, on the other hand, we would want to rely on the guest to preserve the r/o bits during a write, then the ro_mask would effectively not be doing anything, so may as well be removed.

In either case, for partial register writes, Xen will take care of preserving the r/o bits for the remaining bytes in the register.

I'll make this change for the next version of the series (assuming Xen will handle preserving the r/o bits).

> For reserved flags it's less clear what's best, because in
> principle they could also become rw1c once defined.

Well, it depends on what version of the spec we read.

PCI Local Bus 3.0 spec section 6.1 says: "On writes, software must ensure that the values of reserved bit positions are preserved." PCI Local Bus 3.0 spec section 6.2.3 also says that we can essentially treat the whole status register as rw1c. Huh, that's odd.

PCI Express Base 4.0 spec defines two reserved bit types:
RsvdP: Reserved and Preserved - Reserved for future RW implementations. Software must preserve the value read for writes to bits.
RsvdZ: Reserved and Zero - Reserved for future RW1C implementations. Software must use 0b for writes to bits.
Both RsvdP and RsvdZ are read as zero.

I'm favoring using the definitions in the newer PCI Express Base 4.0 spec since they are clearer.

Regarding writes to rsvdp bits: there are none of these in the status register according to the PCI Express Base 4.0 spec. The older PCI Local Bus 3.0 spec is in conflict with this definition, but at the same time the PCI Local Bus 3.0 spec also conflicts with itself by saying that the entire status register is essentially a rw1c register with reserved bits that should be preserved, which doesn't make sense. The newer PCI Express Base 4.0 spec is clearer, and appears to have resolved this inconsistency, so I'm favoring adhering to the newer PCI Express Base 4.0 spec.

Regarding writes to rsvdz bits: in this case Xen will write zero to the rsvdz bits (discarding the guests write value). This is how the patch already behaves with the res_mask, but I think renaming it to rsvdz_mask will make it more clear, so I'm inclined to rename it for the next revision of the series.

Regarding reads of rsvdp/rsvdz bits: I'm assuming that Xen should return zero to the guest for reads of reserved bits, regardless of what is actually read from the hardware. I think we already are already on the same page about this, I just wanted to explicitly state it for clarity.

>> --- a/xen/include/xen/pci_regs.h
>> +++ b/xen/include/xen/pci_regs.h
>> @@ -66,6 +66,14 @@
>>  #define  PCI_STATUS_REC_MASTER_ABORT 0x2000 /* Set on master abort */
>>  #define  PCI_STATUS_SIG_SYSTEM_ERROR 0x4000 /* Set when we drive SERR */
>>  #define  PCI_STATUS_DETECTED_PARITY  0x8000 /* Set on parity error */
>> +#define  PCI_STATUS_RESERVED_MASK    0x06
> 
> I'd recommend separating the "derived" constants by a blank line. I'd
> further like to ask that you add two more padding zeros above.

Okay, will do.

>> +#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
>> +    PCI_STATUS_CAP_LIST | PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | \
> 
> CAP_LIST twice?

Good catch, it obviously only needs to be there once. I will fix.

