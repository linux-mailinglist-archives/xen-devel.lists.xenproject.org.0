Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3179211F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595468.929040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRgo-0002mi-5J; Tue, 05 Sep 2023 08:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595468.929040; Tue, 05 Sep 2023 08:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRgo-0002kY-0t; Tue, 05 Sep 2023 08:45:38 +0000
Received: by outflank-mailman (input) for mailman id 595468;
 Tue, 05 Sep 2023 08:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA/O=EV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdRgm-0002kM-5E
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:45:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9345cb22-4bc8-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 10:45:34 +0200 (CEST)
Received: from CY5PR15CA0254.namprd15.prod.outlook.com (2603:10b6:930:66::28)
 by DS0PR12MB8368.namprd12.prod.outlook.com (2603:10b6:8:fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 08:45:30 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::72) by CY5PR15CA0254.outlook.office365.com
 (2603:10b6:930:66::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 08:45:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 08:45:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 03:45:30 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 03:45:29 -0500
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
X-Inumbo-ID: 9345cb22-4bc8-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKXqGSEWq9NQu9hH2JafKP5jTlpMC+NxvBLl385oHieLsnQvIVeL8ODMokpvxfb6O7WzHsKWgMwg99a/o89PL6KI9SyQqEhCZRXAXNgL10J/zTUoVa1e+FUjKu+xF//bxnOnxkf4bZqhP2N9tdG+LXHSulT3JTA6i2lKOJcGb/o1bv4YIL/FkKO4qNbQKqpJrN/IIxuOFjSGqbXQ6zrWoQKAeObf1d6z4R6MwbNbOqYGPrxLN96INNF05vFKXKeO6iuGte7dhusMSD3pCcexJ47DRk2+W54Kn1BKLubsGRdcxU2FPYWN2igmk6NVsqgP0Bg9hv+bgFF9XZUJEzwd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PreXsEIG4HOkpoUqakLoN3jEpVjtoYHOPv+R9L58IB8=;
 b=lWCRrbtJCE3vfSxVTzDFTV8AtADKY5xiSAvl8S+dndNpPxIGcjONCnxdZe134UFnHcPBE66laV8XAnJvdhUJbILnrArQ4a28AbuJizAYIiFCjKCOCbI3hoPCe8Q5bPbCiMqp51qpb3/O8NFlSzTOeKkSiF9uE2KDbNGebUVLlwxes7M6fJMqydulnYJeNeJL4Li76z+CB1oJMUu8rNrX/DztVvTk5mEWXUOkGuSpCd0myxr6MICWjJqKbRLpjjBKEzk/EJJDbALapACzcOq9HLT5NbCxX+Zv8qpYjc1HcIfRTRHieClYp8RNVocYPuqM/oj1LXtWpSLWdEL2v/Ar1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PreXsEIG4HOkpoUqakLoN3jEpVjtoYHOPv+R9L58IB8=;
 b=1MbCKoqjOgTatrOYdCEctdJNGCI76+WdUcgZ1Pl0+vTpS2vpXe0bz68PD8X+5+2Fn8F30pWpw1B8X0T+MtqCU7oBv/CIanHbQj1G826Oa2PUWVWursuRfI5JdwG9ZPEeeBnY05lxIOGzx+krBllB+lBIQEY91JeczIpymeqTQZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f73b36fd-71c5-6e97-995a-70b8270aafd6@amd.com>
Date: Tue, 5 Sep 2023 10:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: xen | Failed pipeline for staging-4.17 | 699de512
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <64f6e593e9f77_28aa2c885476f@gitlab-sidekiq-catchall-v2-5dbc7c84dc-8wms7.mail>
 <0ae5cc93-6de1-8c37-f6da-086ba1287e98@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0ae5cc93-6de1-8c37-f6da-086ba1287e98@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS0PR12MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f03a9e-7ef1-4850-048b-08dbadec761e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tz4gsNi/k/Qe3q70Fmxj9hjPXdrILU98JURFBGlby27QnPnd7OyoaSgj0GtVryIRhqbU1C1d03sNHEhdnYpv8tvs3yARQzQ/ubOeizA/cnEZsKWhNe72WoSe3silXn7fvDwE5PN84B42YfZvhQejHi0j6qQtFzfxUo8MRAj+JkewSbx9XRICPL4d27zJy4qqVfYe4z/Z6M2jbHmDwJd69hRlABqO8vEItcIlpG0jTipFRdK9wtLPxqS96jqv0BgTQDcGrLSnBy9vW6qrRB05bix9lWyKRqT6lydrViOB3f0/rL96452eABGflTbgwukfPiPHlGfOsJcT7FFUHj0sTwCbQc8orsJ2GWSdjoLc7ff7E+IAAtBzc8kjTH9K2yyEq+d0xO0J5ciF/2+XpY+vJfEd0Fz8y/z8o0I0mvqOc8K7N2Kh0581Re5++flkdZI+6LYazRTSHrXNX7LfCJT7cmn2v8doBDVtQZGBrCtl4jiOYgF2w+4sQBZ3hl9+BSHfUqHWOAID71Gmv13sMWimG2TMdaUJXefIvhPXiPzRl4wo5L/q8qbqIIcqWdanGJmMj/+1pUVthbkYzNLX623jcBEeGJb+7ZW0mn/0HzRGfEEFx8sgh04KBwgKCBbXIHuorwY3Ado0e6b4xvfDkIQt+eVg93yzLUQR4/bnclc4R+MdZqiQR+G/CXg3BShlTz3KENnw18bt/jkxK/nCJa0IBEOiaGBOSTdf3nIZgpdhMBK3nwnakEwpWUmi3PYv9YAkLi59XSdWZZC7keDoZYgnUeVYCcYkUvcIYBqWnf2VNyHwvkxkyU3FH17ZVyPPJep/OFoLxCX08C3THC8sE1WQQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(966005)(41300700001)(83380400001)(40480700001)(44832011)(8936002)(478600001)(2906002)(5660300002)(31686004)(8676002)(110136005)(16576012)(316002)(70586007)(70206006)(53546011)(2616005)(40460700003)(26005)(36860700001)(336012)(426003)(82740400003)(81166007)(31696002)(86362001)(36756003)(356005)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:45:30.7529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f03a9e-7ef1-4850-048b-08dbadec761e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8368



On 05/09/2023 10:36, Jan Beulich wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 05.09.2023 10:23, GitLab wrote:
>>
>>
>> Pipeline #992747061 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging-4.17 ( https://gitlab.com/xen-project/xen/-/commits/staging-4.17 )
>>
>> Commit: 699de512 ( https://gitlab.com/xen-project/xen/-/commit/699de512748d8e3bdcb3225b3b2a77c10cfd2408 )
>> Commit Message: x86/irq: fix reporting of spurious i8259 interr...
>> Commit Author: Roger Pau Monné
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #992747061 ( https://gitlab.com/xen-project/xen/-/pipelines/992747061 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 5 failed jobs.
>>
>> Job #5017577664 ( https://gitlab.com/xen-project/xen/-/jobs/5017577664/raw )
>>
>> Stage: test
>> Name: qemu-smoke-arm64-gcc-staticmem
>> Job #5017577671 ( https://gitlab.com/xen-project/xen/-/jobs/5017577671/raw )
>>
>> Stage: test
>> Name: qemu-smoke-arm64-gcc-boot-cpupools
>> Job #5017577635 ( https://gitlab.com/xen-project/xen/-/jobs/5017577635/raw )
>>
>> Stage: test
>> Name: qemu-alpine-arm64-gcc
>> Job #5017577678 ( https://gitlab.com/xen-project/xen/-/jobs/5017577678/raw )
>>
>> Stage: test
>> Name: qemu-smoke-arm32-gcc
>> Job #5017577654 ( https://gitlab.com/xen-project/xen/-/jobs/5017577654/raw )
>>
>> Stage: test
>> Name: qemu-smoke-arm64-gcc
>>
> 
> Hmm, none of what I pushed looks to stand a fair chance of affecting Arm.
> IOW I'm afraid I don't see what's going on here.
In all the cases:
+ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
curl: (22) The requested URL returned error: 503

The address is the same as in staging, so maybe some intermittent issue.

~Michal

