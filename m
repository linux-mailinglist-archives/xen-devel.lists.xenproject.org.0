Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742627F33AA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638026.994233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TbR-0000oY-TG; Tue, 21 Nov 2023 16:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638026.994233; Tue, 21 Nov 2023 16:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TbR-0000lu-QR; Tue, 21 Nov 2023 16:27:57 +0000
Received: by outflank-mailman (input) for mailman id 638026;
 Tue, 21 Nov 2023 16:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/0D=HC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5TbQ-0000bD-8g
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:27:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf754d3-888a-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:27:55 +0100 (CET)
Received: from DS7PR06CA0024.namprd06.prod.outlook.com (2603:10b6:8:2a::8) by
 PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 16:27:49 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::4b) by DS7PR06CA0024.outlook.office365.com
 (2603:10b6:8:2a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 16:27:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 16:27:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 10:27:48 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 10:27:47 -0600
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
X-Inumbo-ID: ebf754d3-888a-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNc+T+AqjmaACL+aqRWnOWxls+m8RMsLvTunysHpjlpYnFvOvhAQzavAJKMgR4UjuMialZpsNnvoGT0AUsiipx5DTgecUuSOrkt6vcNVAbRSfm37nIebRO+b7rn8pVBdjS5JNAY/IXWpXOTkfUXlRvgWaQEmQSbdMz3mbMv9f9A0A7JDM35IjDvpKfE8CeciHOqsfKleT3r1Mv6jTDYbn8WtgC4eNMcoELMxcA90KcTnX/hawE9e1mdqXrc65/krLK0dDRUa3LssN0j8TyuziuTQadN4uj89ZDefRvyU+Ddlyy+vEE0q+FkyX23EFkh2Kv/ixAgy4VTgezARYgKTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mr0FnRwhvmvSk2fjhAMzO7oWemcZMVK1AwugUkrPzA=;
 b=K4GO/ybtxdaHGkV59k9I+Ot1ARUvV9BUKxODeruHFKYx0a0rt1UefmGPxZf2paHuT1B/eiwW2xvu5S/EpMLBxwH5o5WqWvEDjYrCZSsYkjqxrVoW/ZOBJCwf4511cznG6So46rCHL/AXbhVCvK0DnmrNleGvijQFM2z8UW9UJkEGYJ8jp9uqW79QM91CFA+T2OVmX6ceQbBW0vKOpQO/rP3t2BWX+UzOFZbWv9RvJma/b7+WqX+aQv+OTAoX9Icx7mmKrHK2AU8hXcGW0mXVyJDOPt5DJOtS1DSabVnqpGRA8WvoOareMmjEQLIIEInXSKXliNdO49SNRJROJRJLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mr0FnRwhvmvSk2fjhAMzO7oWemcZMVK1AwugUkrPzA=;
 b=xr6EHll3IsLgO4Pj/SBmKD/asKh8giPpP8KUT/aY7a3Vf3KktJTcrEe8OSuJDyhLDWzsjrd8+dR1KDBPvxLPKg4Joh1HaNbnFdKnlccBmiAP7V25q8T1xkOxz/iJzMulcPcWaCrsnQ5Ufwh4W0D+sxMh0qK5n4NTLwOBACNeZ4s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64c7349c-a342-41e2-82ab-db422f5961ce@amd.com>
Date: Tue, 21 Nov 2023 11:27:46 -0500
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
 <081547e8-696b-4741-b9b6-bc92c221f01a@amd.com>
 <ZVzKROAwS25DMGbb@macbook.local>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZVzKROAwS25DMGbb@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b336a1b-1e19-439b-277a-08dbeaaecd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vKYV+lN75A/C6bStZrvJxrxv5wLFAd9RABKpOKFPLuF1DCiD2u6bq0p1cVYqkWzyc8VS/6zVM8/PiAhn6Z13HsSkdOxaZs5T6mPXsCk3FppwHkaZDXa8ylhXg3w9pSx/FSImRoRCgW8+pN/JoEz1lhCusU/arddSsyLcwcyCKgJQoSHwD4XTJD0nD3TMSwy9Oo0/fy5L6xi/2HnjyO1Xa1dPEBQXFV69Xe7i6z/n2BTfpJVoAD4vwyvZHfP8anB49XwObCidyDchoIOb0N/SGmGWWTS0wjcIBZNkKEgJ4hBpeihhatD7vfLOpACX3iBQSpGlP5tzBQJNbxWe9CYRs/GEkthBAz4KIj/zkJYgn0BQW0HptpWq4ldtEoTPqUucofTRvp2LftNEkKB74FvAdHZTGcSh/xRXaDpPsUWNnAAfJGYsnhrvjHJ8ozOdq1Vm7U9kR48vC6Wb+8ltJ+5i5ZKK2fHuCj2SX1l/ZZdEFgkBSet/NBLEMcTUDtLWmvyMQxQv5HQshP9S8/h6inSLiakyAff7Ho0PkYNLyoES1RXpXNy9OVtr65oFhHGbxYIrcqZXYwJ0Fctz/cMMzP70WiDi8G8jvMXctR/yVM02gcbv4gb6DNOoG4X6MlB01iIiB46Z0xY2T+E1GggN8mL4M6370uNFADCLsWEDN7ruCV5YaziQfk7YwjYe9I69j0hshLAjvRB270Z6IK7TaFwUU8OM548B2YhJV6NNmNYtGHna/lu3fAg+BizB49sArTZTbMwjKgb4iKgAD9N8/V30dIrfnr5bk0tNdp/8MPDV68bbxXILp5jntRTH67wCgKZl56ptL0SOWvRCuzVEIRfR/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(40460700003)(5660300002)(41300700001)(47076005)(44832011)(66899024)(2906002)(356005)(81166007)(82740400003)(26005)(36756003)(31696002)(86362001)(426003)(83380400001)(336012)(53546011)(8676002)(70586007)(2616005)(36860700001)(478600001)(8936002)(4326008)(70206006)(54906003)(16576012)(6916009)(31686004)(316002)(40480700001)(36900700001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:27:48.7520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b336a1b-1e19-439b-277a-08dbeaaecd0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901

On 11/21/23 10:18, Roger Pau Monné wrote:
> On Tue, Nov 21, 2023 at 10:03:01AM -0500, Stewart Hildebrand wrote:
>> On 11/21/23 09:45, Roger Pau Monné wrote:
>>> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>>>> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>>  
>>>>  /*
>>>>   * Perform a maybe partial write to a register.
>>>> - *
>>>> - * Note that this will only work for simple registers, if Xen needs to
>>>> - * trap accesses to rw1c registers (like the status PCI header register)
>>>> - * the logic in vpci_write will have to be expanded in order to correctly
>>>> - * deal with them.
>>>>   */
>>>>  static void vpci_write_helper(const struct pci_dev *pdev,
>>>>                                const struct vpci_register *r, unsigned int size,
>>>>                                unsigned int offset, uint32_t data)
>>>>  {
>>>> +    uint32_t val = 0;
>>>> +
>>>>      ASSERT(size <= r->size);
>>>>  
>>>> -    if ( size != r->size )
>>>> +    if ( (size != r->size) || r->ro_mask )
>>>>      {
>>>> -        uint32_t val;
>>>> -
>>>>          val = r->read(pdev, r->offset, r->private);
>>>> +        val &= ~r->rw1c_mask;
>>>>          data = merge_result(val, data, size, offset);
>>>>      }
>>>>  
>>>> +    data &= ~(r->rsvdz_mask | r->ro_mask);
>>>> +    data |= val & r->ro_mask;
>>>
>>> I've been thinking about this, and the way the ro_mask is implemented
>>> (and the way we want to handle ro bits) is the same behavior as RsvdP.
>>> I would suggest to rename the ro_mask to rsvdp_mask and note
>>> that for resilience reasons we will handle RO bits as RsvdP.
>>
>> But the reads behave differently. RO should return the value, RsvdP should return 0 when read (according to the PCIe Base Spec 4.0).
> 
> Hm, right, sorry for the wrong suggestion.  We should force bits to 0
> for guests reads, but make sure that for writes the value on the
> hardware is preserved.
> 
> So we need the separate mask for RsvdP, which will be handled like
> ro_mask in vpci_write_helper() and like rsvdz_mask in vpci_read().

Agreed. The only reason I didn't add RsvdP support in this patch was that it wasn't needed for the status register... Since RsvdP will be needed for the command register, I think I may as well implement it as part of this series, perhaps in a separate patch following this one. Stay tuned for v8.

