Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAC7F3429
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638050.994295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TtV-0000ss-SA; Tue, 21 Nov 2023 16:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638050.994295; Tue, 21 Nov 2023 16:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TtV-0000qG-Nl; Tue, 21 Nov 2023 16:46:37 +0000
Received: by outflank-mailman (input) for mailman id 638050;
 Tue, 21 Nov 2023 16:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/0D=HC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5TtU-0000pG-1g
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:46:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ad0fbf-888d-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:46:35 +0100 (CET)
Received: from BL0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:91::31)
 by IA0PR12MB8837.namprd12.prod.outlook.com (2603:10b6:208:491::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 16:46:31 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::52) by BL0PR05CA0021.outlook.office365.com
 (2603:10b6:208:91::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16 via Frontend
 Transport; Tue, 21 Nov 2023 16:46:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 16:46:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 10:46:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 21 Nov
 2023 08:46:29 -0800
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 10:46:28 -0600
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
X-Inumbo-ID: 87ad0fbf-888d-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6XTvLhdE0akYRHKVh7afRuej25WWcd4EstRpUKgULRp7ha78gdFc3rWDxzdjaozCvhpm4WR9hG6tbzr3SV4Neqh8toWQ7MkIuxFg6kHnUBomZAJYkbWL0EZqGV6ZaUppab2vHbsxW7QFVFYvjGbmIXCp1ffHyfJo2L0INSleY7NMiGsvbguQbmlaWBI6xchaEW7sCY6GIku4by4KhYm861p6XQKZ+/H0QEQTrUs1o/XEpPBvdijoo2ir6CZICAS5pWaF1qfbr76O+0bv4WX+uNPk2ySqkzZFqSPYZxitJtiQ3xfYiyEZ817RA3Mv5axO5Oh79LSVFaZ2Xz4lg1zxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51h6ikenRbA7/yvAIBigL3HsbnsM7f4fXylpyQ4Whw8=;
 b=a9tavqT1x2fDm6QOdQ+axYdLJ5J4aY9aHHpFULHEYIWWRmi2hHDutLwAPHBy0ongFOdTqA4SZmXwjiAek5GxhoTwaI4q7EyWU22MUZE9lfwOny0L1Wd69thCyOKNKy8PkBiufkO0T9DY5zc8StqlrDL9pJKP6tt96WG6DluVmGpimLYUNg3+sfssBsL9G4uxlhuBtC2cXs+hj3XJgFHDSGI6PZ1kcjUN4J6yYw52Q7ADdNMpjkFWQmVO2jEGr2K29d4piECxogsULq7CfPzsYnJmorysdNMgeTy+UTz37iFVMvzkWopTqz0huAdCyKbqlmLyN1HPrVbCjHHyMGb4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51h6ikenRbA7/yvAIBigL3HsbnsM7f4fXylpyQ4Whw8=;
 b=FQ5tzGZIHoMXo4BY40PazNnBkP8mlbALKZdM8+PepJh1p13rk6t3ziII6nQEocBfzARkZxdXwxMvO0BmYRFaFTMXfKlBAyPENvXr+52n/L5hOXu6pLdlA9yIsw3fjsJSfN63txMU8sr4MaozWadDIVtOFFhJjSsZkBFA7HMvXOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4a65d203-290c-4bd8-99bc-8ae65a166bf3@amd.com>
Date: Tue, 21 Nov 2023 11:46:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVzCn60-qvdRsi3q@macbook.local>
 <081547e8-696b-4741-b9b6-bc92c221f01a@amd.com>
 <ZVzKROAwS25DMGbb@macbook.local>
 <64c7349c-a342-41e2-82ab-db422f5961ce@amd.com>
In-Reply-To: <64c7349c-a342-41e2-82ab-db422f5961ce@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|IA0PR12MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc7de0e-c123-4a12-caca-08dbeab16a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w1jdGGtPPfkxtdaDsu/ftf9cgJM8E8MV5ruyx0+/5g5YXeIBRKmxwowsr0fTSItNyeG+8oCIzjBwb0e6z7TJjVQLelSsyU0r3PQsBy9UmM26U0x3ly9mxsuNBqSasC80eUcKIVJ9jyXzZY6608F0ryN7dnJJkbF0EZkWiKROJ0UJpKH1GeuCswf/EGTyXuum2N5gMiDCmYputJcTm5G15Y/UbkTguBE6iEqhltGGVpMgSnPdCKLpFJWl3H51YGqEjHiWqXPLcf/mIUmvJlqBkG9M86iXgn8w8JQM77fGn+HVPjFP+NEWyOCjEQ0nKEssvrr/DGVM9ebZf077noFPmersp9pE2G+LiaJomacoigOJVwdrw6VZQ0GUOz/Vavv6g4zhHUw3Uq+E8o8D8YzOjp/LZkY0Bfu3LJBdGR072Tz+Id0+l3YeJUvEchQfDQQP/Q6uftXa3itTTr6Q0/JG8+2exDxIQRatkHQTln0C+S8Nt7v6vYqNmha32agaB13gK8t8xoYZnPBQHbCH1Fr5O7YVj6/+8BjL5925NxJczo+bGelGQ2yp7ynVSuq1HwGfiXlncHC0ssnmURYSPFuDPUpf+1d1I5h/KWK5r/BaX7A/J5vXVd2u/UUAfjdyGtRX3TKDwT5iVb6zyaENB39p2VdZBZ6NanyzAEGHZ1HkgSu8EnSSrU0LwdhJi8jSV/RJ1G0qR6J5tBYkE5CVXa+jb3ecgBQN/dPkC+MkzAtNp+iOM9zWY9kNP555oUQqNRDPPIXgnYlBrLl0FUxjXUy8ILNFRJuPmcHVhFe9UcSRCfi8YKuoHJ4N5e2ulc5HrT5mSEHpFuc9ptGji/I7/MwezA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(82310400011)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(5660300002)(44832011)(2906002)(8936002)(8676002)(4326008)(41300700001)(6916009)(16576012)(316002)(54906003)(70206006)(70586007)(40480700001)(478600001)(53546011)(26005)(31686004)(2616005)(83380400001)(336012)(426003)(40460700003)(66899024)(36860700001)(81166007)(356005)(47076005)(36756003)(31696002)(82740400003)(86362001)(36900700001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:46:30.9464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc7de0e-c123-4a12-caca-08dbeab16a6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8837

On 11/21/23 11:27, Stewart Hildebrand wrote:
> On 11/21/23 10:18, Roger Pau Monné wrote:
>> On Tue, Nov 21, 2023 at 10:03:01AM -0500, Stewart Hildebrand wrote:
>>> On 11/21/23 09:45, Roger Pau Monné wrote:
>>>> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>>>>> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>>>  
>>>>>  /*
>>>>>   * Perform a maybe partial write to a register.
>>>>> - *
>>>>> - * Note that this will only work for simple registers, if Xen needs to
>>>>> - * trap accesses to rw1c registers (like the status PCI header register)
>>>>> - * the logic in vpci_write will have to be expanded in order to correctly
>>>>> - * deal with them.
>>>>>   */
>>>>>  static void vpci_write_helper(const struct pci_dev *pdev,
>>>>>                                const struct vpci_register *r, unsigned int size,
>>>>>                                unsigned int offset, uint32_t data)
>>>>>  {
>>>>> +    uint32_t val = 0;
>>>>> +
>>>>>      ASSERT(size <= r->size);
>>>>>  
>>>>> -    if ( size != r->size )
>>>>> +    if ( (size != r->size) || r->ro_mask )
>>>>>      {
>>>>> -        uint32_t val;
>>>>> -
>>>>>          val = r->read(pdev, r->offset, r->private);
>>>>> +        val &= ~r->rw1c_mask;
>>>>>          data = merge_result(val, data, size, offset);
>>>>>      }
>>>>>  
>>>>> +    data &= ~(r->rsvdz_mask | r->ro_mask);
>>>>> +    data |= val & r->ro_mask;
>>>>
>>>> I've been thinking about this, and the way the ro_mask is implemented
>>>> (and the way we want to handle ro bits) is the same behavior as RsvdP.
>>>> I would suggest to rename the ro_mask to rsvdp_mask and note
>>>> that for resilience reasons we will handle RO bits as RsvdP.
>>>
>>> But the reads behave differently. RO should return the value, RsvdP should return 0 when read (according to the PCIe Base Spec 4.0).
>>
>> Hm, right, sorry for the wrong suggestion.  We should force bits to 0
>> for guests reads, but make sure that for writes the value on the
>> hardware is preserved.
>>
>> So we need the separate mask for RsvdP, which will be handled like
>> ro_mask in vpci_write_helper() and like rsvdz_mask in vpci_read().
> 
> Agreed. The only reason I didn't add RsvdP support in this patch was that it wasn't needed for the status register... Since RsvdP will be needed for the command register, I think I may as well implement it as part of this series, perhaps in a separate patch following this one. Stay tuned for v8.

I just remembered that RsvdP would actually be useful for the PCI_STATUS_CAP_LIST bit in the status register. So I'll implement it directly in this patch afterall, not a separate one.

