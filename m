Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD082DC1F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667456.1038732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOa7-0003qQ-8r; Mon, 15 Jan 2024 15:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667456.1038732; Mon, 15 Jan 2024 15:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOa7-0003mT-5C; Mon, 15 Jan 2024 15:08:55 +0000
Received: by outflank-mailman (input) for mailman id 667456;
 Mon, 15 Jan 2024 15:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghqi=IZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPOa5-0003Do-Iv
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:08:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc6e8d10-b3b7-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:08:50 +0100 (CET)
Received: from SJ0PR13CA0135.namprd13.prod.outlook.com (2603:10b6:a03:2c6::20)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Mon, 15 Jan
 2024 15:08:44 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::f2) by SJ0PR13CA0135.outlook.office365.com
 (2603:10b6:a03:2c6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.17 via Frontend
 Transport; Mon, 15 Jan 2024 15:08:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 15:08:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 09:08:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 09:08:42 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 15 Jan 2024 09:08:40 -0600
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
X-Inumbo-ID: fc6e8d10-b3b7-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtmOfqgveubEkFKU9zXUYLmd+RkiCSxdT+e9cUigOYkTYfVsKJaMWbvYfT7m2NSYVRFwYQ93c6wlOfIIfk32a9UNRXXWsOwhSuDubhkW564iyC7iyxDH2ErwoSH/BVhH54OISxJLgYdsp9eIrUTWaHfvu1DHqBRrIOx/62RartxYJecZqavQbBBVONdkAH2lA+6+tPWjglpTeWBeHLKutPnhxCwiV5OOBoK9yONn82YHG1jXjVAGX1U1hS9+6SdLKZiFUZZ5ecHFvZX+FfNCOnXAZGE9Z9MwRTvXLkmsGn4vd9UDtaELpMkpGhCWCVTlot2oLN41Jnm1mVqV4Y5CCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoCIHXPvOf+Un7JWgo3DW3wxXw+wXGd2XDSFARUz5lc=;
 b=Vczfm6hygBoZTKVtvFXOLyYVrklrDWhyqgXgHB7K0Kr1u4T5Q9R4GjjOBv1o8Zbd1FAaw+lsvdRtk8Rs1Q9AScMbcopZYygZ9oP9Ufj9zJ8iSBdrQOhCytZIdPX3m+4BC1vHkMkPWkI0e63eEr+1dWgNuzQ9JWfOtOhXeOrcW6orc3K5f+EWmXaeTrjjgH3CA1OVjKDOlHrHpslGPmVWYlAqHztuOZ/nXzzA1w2bwADbFLXSBPv4n2LMDXVXKcf0RKzwQzHSp8qqRJwrCous/VoJasRMpelJGziS8vPb2Dt/Ak9AzA+oDGhwVqi8+Px36bIWrRKflmN3OrFX+s+Cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoCIHXPvOf+Un7JWgo3DW3wxXw+wXGd2XDSFARUz5lc=;
 b=MHPTaAxNsR8nP92iekSKjQz86eiJ5Y5l7CJ7JL3iWuz9amXqcn6cd+JkTjfAxBNq17mAQbe2SNSGNdrdBaAGglMTOLwwVlBIXgWF93kMGTSo1uDGn0oYMXOZPbJPUN1I675va6SqBIW5AuzoxFPovmUW0dERGJvtCXHQrBtz2oE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <26b92079-4358-4fa8-97b3-b2e1ed7277e1@amd.com>
Date: Mon, 15 Jan 2024 10:08:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <ZaFDS7uZgW5l0eHG@macbook> <590a157a-b9d4-4d2d-8aff-6584da3045c3@amd.com>
 <ZaTyehqxp_q9wY3Y@macbook>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZaTyehqxp_q9wY3Y@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa84502-f8fc-40af-1771-08dc15dbdd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bA41UL0w4uLIhEzJkuHSQx9+U6vzQ8V2f8v6WyPKQjqHzgyxSoukMNl2m6fXf4RLPU1/dc0hwPV4p1eUI6yY9pmYJooj6E6bDmbCn9wrrDEPl4PIf5g9eb21AmophcUYERTC86Z1rSAN1pfY2XuZVocH+KKpJPwUFrMhCylim1eJeRMXOu49pgm/1OU/foloaKeVB8/E949/pbfaMqXl75doZWgdWuQEa7jX+xlGdPRC6clZpNo4LMKpioNnjvR7UDIQcNzb0t0pe3gSaw2ULJ0sjyG4FQzbSCL6wIxCHz6AK00iCyfoJXTaQnmkGTZsB6jpUkn1JaX2GkgkuMg4p430K3rVcrbtluHjcp8Wlojxsq1rMeydqq9yxG2BU3+1cPVrBfEUSe33HgvFa8X934ABfzxH7w7I5iwQOxxii8LdADTnH9ok1/lPIAzMjpeeI/Vp+31X1dY1WGIkTpVnzjUzb7p660fiHBNCG5JiYuQgOsK9D0bFKc5B8LoLhlMRzuF04ceynybLicxvyvUxxVL4ZCUwH4fctwCbeZHZdbWCAC8El73UmlmeNPSlW7YXNgwvWAC2+LOpr2D0YJR5q6bjzpk/gqx7RTftg9y+b7q++Fn8E9aB1dvQg5FmF58KWvjHZkDIyKAqvJkHXcuCz3cNIlq6rC5pf1E6sCWIZoZfTwx4Qo6QJzqnmyPQMBlD1fM83jndXfNyDZ+bA+lvE38C9axWg3QfrEKlI031ZibGmos+6Kx3Smxq0bdkesiYKULglKuxx6CDY+sMV13xp4dG4MQF1HKG5PLdu5zi09VgbzuaRD6KlulAWZOoQ9W
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799012)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(83380400001)(6916009)(47076005)(16576012)(70206006)(316002)(54906003)(70586007)(53546011)(31696002)(44832011)(5660300002)(81166007)(426003)(2616005)(336012)(26005)(8676002)(8936002)(40480700001)(40460700003)(4326008)(356005)(82740400003)(86362001)(6666004)(31686004)(36860700001)(36756003)(41300700001)(478600001)(2906002)(7416002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 15:08:42.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa84502-f8fc-40af-1771-08dc15dbdd01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

On 1/15/24 03:53, Roger Pau Monné wrote:
> On Fri, Jan 12, 2024 at 12:54:56PM -0500, Stewart Hildebrand wrote:
>> On 1/12/24 08:48, Roger Pau Monné wrote:
>>> On Tue, Jan 09, 2024 at 04:51:16PM -0500, Stewart Hildebrand wrote:
>>>> @@ -202,8 +204,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>>>>      struct map_data data = { .d = d, .map = true };
>>>>      int rc;
>>>>  
>>>> +    ASSERT(rw_is_write_locked(&d->pci_lock));
>>>> +
>>>>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
>>>> +    {
>>>> +        /*
>>>> +         * It's safe to drop and reacquire the lock in this context
>>>> +         * without risking pdev disappearing because devices cannot be
>>>> +         * removed until the initial domain has been started.
>>>> +         */
>>>> +        write_unlock(&d->pci_lock);
>>>>          process_pending_softirqs();
>>>> +        write_lock(&d->pci_lock);
>>>
>>> Hm, I should have noticed before, but we already call
>>> process_pending_softirqs() with the pdev->vpci->lock held here, so it
>>> would make sense to drop it also.
>>
>> I don't quite understand this, maybe I'm missing something. I don't see where we acquire pdev->vpci->lock before calling process_pending_softirqs()?
>>
>> Also, I tried adding
>>
>>     ASSERT(!spin_is_locked(&pdev->vpci->lock));
>>
>> both here in apply_map() and in vpci_process_pending(), and they haven't triggered in either dom0 or domU test cases, tested on both arm and x86.
> 
> I think I was confused.  Are you sure that pdev->vpci->lock is taken
> in the apply_map() call?

I'm sure that it's NOT taken in apply_map(). See the ! in the test ASSERT above.

> I was mistakenly assuming that
> vpci_add_handlers() called the init function with the vpci->lock
> taken, but that doesn't seem to be case with the current code.  That
> leads to apply_map() also being called without the vpci->lock taken.

Right.

> 
> I was wrongly assuming that apply_map() was called with the vpci->lock
> lock taken, and that would need dropping around the
> process_pending_softirqs() call.
> 
> Thanks, Roger.

