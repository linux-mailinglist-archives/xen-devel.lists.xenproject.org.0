Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E25708A0B
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536533.834940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkoL-0002aw-0b; Thu, 18 May 2023 21:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536533.834940; Thu, 18 May 2023 21:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkoK-0002YE-T3; Thu, 18 May 2023 21:05:20 +0000
Received: by outflank-mailman (input) for mailman id 536533;
 Thu, 18 May 2023 21:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkoJ-0002Wp-9h
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:05:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b168079e-f5bf-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:05:18 +0200 (CEST)
Received: from BN0PR04CA0079.namprd04.prod.outlook.com (2603:10b6:408:ea::24)
 by DS0PR12MB8217.namprd12.prod.outlook.com (2603:10b6:8:f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 21:05:12 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::73) by BN0PR04CA0079.outlook.office365.com
 (2603:10b6:408:ea::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:05:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 21:05:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:05:11 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:05:09 -0500
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
X-Inumbo-ID: b168079e-f5bf-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq/eoa7MsJgIR48I+cvuARLPY59iuq/bbLsVeeknsYXk/8GjZxlxCUBufnzKcChZv583EAKTi094jKOuSs7LWxWVKND2MMCLuK57HLPws+ZheciBaT/gCTF3fvhu41t4yMWPd5FDLRqU3MdP609zD+Amv0SFoldesENhgqP4A65UBMafR5zpK3J9jNjqOezV1QGAh5Ze7BpCPmxQSiNFmJG+ZSFIX5za3FcSGfIMfm4lFxeeG+KbUw/h4GsbvDj6k2RqIMXksmY8+wHD5UU+ZBVchJDKFOBOA66j9Hd+ITxu1+IRhgMSnSrFsmUyYx5NOZfsf9uZwKVfrfXMYEfr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gI3C+9aSno4SDqtQbilkfQ8C+dQxysKiAvmQPjqz+uc=;
 b=lk1M/dLFp0S9W82kBj2fzru6eSulFc+ZGtfp8+uvylEpp0xTAPYIbOlQFFrSqFu/qiApwN0bdY+3U+hSRNduT+PwQxEcIz19pXtdf4UPklO51ARZg7UK4+aFn/CXs7fmzCbV20/GxpSI4jTuCrmi6UsVXDsYNIa12Og9qeC8QDfPwm8hMAYeNnQjtMbzaXD7Wec9vNptKrG8ifwCfSBRwqsj2lbdwJV3R5qmxKH2lvu2tzzKekmAE5BLDjei85WM11A1g0QYp0elOIc5Zu8jX2A77Z2ws8SXE+LPObY2MSakVWwpTFCOB9dw3SPG8t87DDewtCfts7mT7qDfaDzu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gI3C+9aSno4SDqtQbilkfQ8C+dQxysKiAvmQPjqz+uc=;
 b=aP38xa4Zgf+nmogtaQXlwhWsIRBaZ12byb1gKeaVhlFvNWmdTfRNZX8YqueHTOBJqAfjesX/KsmvEj80E0scUP2sJiTwllB965gKVJxUclxf2h81us0OnFaqkpfCsX5JTaUMr20ml4HAuaC4NJqXUEXJ0eMIL0LealKplnOoSww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c47c6f34-b887-b768-b460-69c7076e9c67@amd.com>
Date: Thu, 18 May 2023 17:05:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-6-stewart.hildebrand@amd.com>
 <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
 <f7d78b4e-3a16-d342-59d2-caa4d2b75b9c@amd.com>
 <cdb08ae5-1cbb-ac43-67bb-0c73bde7f479@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <cdb08ae5-1cbb-ac43-67bb-0c73bde7f479@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|DS0PR12MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: b336dfa7-7308-46a6-50c3-08db57e39200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3SrBZwdpO5I+79S2J3692SOEIGV6rH6EJ+C7hlvzS00zZ68RH3hcn/5fSERfqX2F7UDFh3tcXS8eqk6D5tXdlsBIxjqelacNRRy8qu9rlD5rqDas1rXV0237oFwylqNXzbeKPnEtDkbAMi3syWLPl1L/EtijRO9Cv6bFMePk0C7neMFXdkD0/LT9/yOlkpooJUCEBgixsAJECHuaaYOJtsUertYBP3VV00x1I7ebEvWW5nQaQr4bcNXOioLvyKz475n1ExYpDj5UiudxC8wRYXg/4uoAhtezPyJsQEHbsZIWxadJ5RVee20jgSH+G+hK6YmZGkDqFmwuksPAu06qu3UEgE+kAStBch0utRptI+A7xmKlsBnQFFZEfuHDCSsskZ+PtxawsxSLpKeU0JRa5NHtBn+g/qPa+smqUR7x3ofGZ5KWF7cbv+K8mv4XdJBg1cjRk6kpTSIdfHkPrWXIeDpkCKQ6gV7CxVGx28GGXeqoC6/MloWN6kTa3CY8vfrgI41u1WsmcUMUTNPu7nlv2RKv8IH/EbjLE55xoMUB4pAQze5Jj5VqDhEiN+/VVXZxUSPnTq9V7WBTDoLUsFurU48/lPDzBufqTe/n30en+HmFSgj81hYfFitORFvY6ECQGzeCTq8kDDSp3eCx5yz5fquYAolLDgsqk+46rb1XdMvD+L81ufyi26tFa/gXKc6tbp6s1DghfvuY4bZNRLFa9DDcSqS/aXfEoMT/iryTTkv/2q+StrhS7uYIh2ih+2yf3LddsOnzGZjhm3ICdZ12lemxRyZcdwMkq8V6Qvqlphcp+pWs5iVx8Ed4zDWGWFP4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(26005)(40460700003)(53546011)(36860700001)(36756003)(426003)(47076005)(40480700001)(336012)(86362001)(31696002)(82310400005)(2616005)(356005)(81166007)(186003)(82740400003)(16576012)(54906003)(7416002)(44832011)(5660300002)(478600001)(2906002)(316002)(31686004)(6916009)(4326008)(8676002)(8936002)(41300700001)(70206006)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:05:12.1275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b336dfa7-7308-46a6-50c3-08db57e39200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8217

On 5/15/23 03:30, Jan Beulich wrote:
> On 12.05.2023 23:03, Stewart Hildebrand wrote:
>> On 5/12/23 03:25, Jan Beulich wrote:
>>> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>>>> @@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>              pdev->domain = NULL;
>>>>              goto out;
>>>>          }
>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>> +        ret = iommu_add_dt_pci_device(pdev);
>>>> +        if ( ret < 0 )
>>>> +        {
>>>> +            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
>>>> +            goto out;
>>>> +        }
>>>> +#endif
>>>>          ret = iommu_add_device(pdev);
>>>
>>> Hmm, am I misremembering that in the earlier patch you had #else to
>>> invoke the alternative behavior?
>>
>> You are remembering correctly. v1 had an #else, v2 does not.
>>
>>> Now you end up calling both functions;
>>> if that's indeed intended,
>>
>> Yes, this is intentional.
>>
>>> this may still want doing differently.
>>> Looking at the earlier patch introducing the function, I can't infer
>>> though whether that's intended: iommu_add_dt_pci_device() checks that
>>> the add_device hook is present, but then I didn't find any use of this
>>> hook. The revlog there suggests the check might be stale.
>>
>> Ah, right, the ops->add_device check is stale in the other patch. Good catch, I'll remove it there.
>>
>>> If indeed the function does only preparatory work, I don't see why it
>>> would need naming "iommu_..."; I'd rather consider pci_add_dt_device()
>>> then.
>>
>> The function has now been reduced to reading SMMU configuration data from DT and mapping RID/BDF -> AXI stream ID. However, it is still SMMU related, and it is still invoking another iommu_ops hook function, dt_xlate (which is yet another AXI stream ID translation, separate from what is being discussed here). Does this justify keeping "iommu_..." in the name? I'm not convinced pci_add_dt_device() is a good name for it either (more on this below).
> 
> The function being SMMU-related pretty strongly suggests it wants to be
> invoked via a hook. If the add_device() one isn't suitable, perhaps we
> need a new (optional) prepare_device() one? With pci_add_device() then
> calling iommu_prepare_device(), wrapping the hook invocation?
> 
> But just to be clear: A new hook would need enough justification as to
> the existing one being unsuitable.

I'll move it to the add_device hook in v3

