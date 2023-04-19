Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F66E7B10
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523485.813574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp829-0004sR-OV; Wed, 19 Apr 2023 13:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523485.813574; Wed, 19 Apr 2023 13:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp829-0004qC-Kp; Wed, 19 Apr 2023 13:39:41 +0000
Received: by outflank-mailman (input) for mailman id 523485;
 Wed, 19 Apr 2023 13:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp828-0004iP-Hf
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:39:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a01b7343-deb7-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 15:39:37 +0200 (CEST)
Received: from DS7PR03CA0223.namprd03.prod.outlook.com (2603:10b6:5:3ba::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 13:39:33 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::3c) by DS7PR03CA0223.outlook.office365.com
 (2603:10b6:5:3ba::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 13:39:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 13:39:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 08:39:31 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 08:39:29 -0500
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
X-Inumbo-ID: a01b7343-deb7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ivwj+/fLHsAAMYalgfNCWwDE0p8dNlTfbmaqNLTXqPS8Ect4tvXfRvrYzOhHjHpJJ6X7rE9Wvz2cF2wVObCIV3g9fpw+VVqoadAGOI2NYN8pGyW06c1Yb8mTekHRdEUjFtn8THgZZzI1JMotj9/DPCix3ptjbWOCK5jVlXmXonnIoUgk9XaJKSkxnRgNydRbX7d10ZWlEaArZNLWzWCLof4xfYxWQXvHebtwlWEhpiG707EqffSConQTO84LDMzMCnNmdhaiy4DblRmNfcwcutfTHl7Xv4wzXVQKXbWDmx9rdTKG7xkkiOSMoZ7P80g6yGlKGzbZ8DDks3JniuXV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI+HV4k8xOmnaLaaH27Lz93CeUO7TuvqADEcZE2eBPU=;
 b=EwiccXcPrF6Vhp8G7JdGQ+LRUa6m0NV+dY60JqzB+uOTaS+eOrLs9f1E1E8FPHkIRCHxiGf1Rg8OaAmZ8m75tbZqoLvZ2vITClplv8KLDfKfauTnb3eiP96G6ZTf85fHoV7K7kbeggrD4Tv6NPf7ESd90vAg+PoIKxF7BqeiNWL0sT8XlE4HdHpE5RIyZBPaVmFjtXkDVI8yBwzPES1CA/YKlElZGQ5u4TedVxKE59MB8SVN/BLg8gAG2Ao7ayf8bNTS/UO2f8/qUx+4C1zCVrIqsiJESsfEEAioRi5WZTCFqKOVfXo/ajhG1DGqxtUSPwdQGBE/6PlYx+RLTGizJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI+HV4k8xOmnaLaaH27Lz93CeUO7TuvqADEcZE2eBPU=;
 b=dapKqsEdCZ9mT1ArbFZ0WCmnJbtPT/lEK+ujakGNocRYqUOw9y+0R1TtINWoXEtyppT+aZl7FyVIC+ngG47z3C1gZnnqQ1Xy+gpO71D3bz2OdEEurhF3W34fGIiVdsaWum4jYHB4Oh8FlKHfkHDAZ7lBPOtQwpoALslKIB2qiwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5915f963-97d9-19f3-e797-3fd02b6fb406@amd.com>
Date: Wed, 19 Apr 2023 15:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 1876b437-0673-4bcc-94a0-08db40db824a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yj63Ju6mZSj+B5wbooop8R79GWdEu5CXF1ecgUepO0J2aOqOXYD3MzTIj55SP7CYwAWPMoyo5cF+UWqxWsUtVF9n0VnD7ZV0Q/IdGMflA63bnjazES3iX4dpOMyxQgxOfjnP5fwW7EcMcAnXvw/HihZOv67MRIQ481UecGt3oiwxdxwtdC3rfk1Q7DKz8bpUB33B0ulmyyCDGUmVoIlPyHX/5+SB4JNuxg2I/tydv3mhA2vw6/mEzeCP5rWIWq0S9fObkxpPlBVsFm8NWLgZEzGWffp7Qe3VNvlH908w3v2LdwE+NfcGAMsZ4LAIO5kQ1OtQ+N5aGYnxxAD7RKeZl5TbM3Ndexm53eR2XjRgSEUOcz7jZl582FAwUaAZDgJDMBELrr7VZNnzZ1q4sHb1I5rL+Gew3i7syz1A1bHFtbkUoxam5Jyw6rCufA1lJDeORgCdHtfLGtNZaZqHD3odhf1ejL/9EJZhVDP9L/9V1HMB3LJ+xMh+IswybP/I4hpG4WYx+9U9jaFqef4WsApCBQGn+wu7FmXxPmSgOlOocVb+iYiqVsdpeQyXTG/dOtn71rvkDkMGjopMLy8mpJm30qwSJJoMtBt+Bl1b86+wWVSzQv/+IudzU0dR3mbGPCs+eqaFbrHyOkPTfD/r5eHi0/QJ1uPPf4Dzp1r962PhCyheBZrK5Dj1835CQkPLhi0JFMtfF7sIgjXbjzbj3gXcf9uet85yD7m8zjx4s4Loo1tBltzL6TUpoF76A3NMmpNx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(8936002)(8676002)(7416002)(44832011)(5660300002)(36756003)(82310400005)(86362001)(31696002)(40480700001)(26005)(966005)(110136005)(54906003)(478600001)(2616005)(36860700001)(31686004)(47076005)(336012)(426003)(53546011)(186003)(316002)(82740400003)(4326008)(70586007)(70206006)(356005)(16576012)(81166007)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:39:33.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1876b437-0673-4bcc-94a0-08db40db824a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Hi Julien,

On 19/04/2023 15:26, Julien Grall wrote:
> 
> 
> Hi,
> 
>>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
>>> new file mode 100644
>>> index 0000000000..3296a368a6
>>> --- /dev/null
>>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>>> @@ -0,0 +1,55 @@
>>> +/*
>>> + * SPDX-License-Identifier: GPL-2.0-only
>> Our CODING_STYLE says:
>> New files should start with a single-line SPDX comment, ..., e.g.
>> /* SPDX-License-Identifier: GPL-2.0 */
>>
>> For me it would be perfectly fine to do as you did but it is not what our docs state
>> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.
> 
>  From my reading of https://spdx.dev/ids/#how, what you suggest would
> not be a valid SPDX-License-Idenfier as everything in needs to be in
> *one* (including the begin/end comment).
I said what is written in our CODING_STYLE and what we did already for lots of files, i.e. having 2 comments:
/* SPDX-License-Identifier: GPL-2.0 */
/*
 * ...
 */

In the link you provided, the "*one line*" requirement refers only to SPDX short form identifier
which does not contain any other information like author, description, etc..

~Michal

