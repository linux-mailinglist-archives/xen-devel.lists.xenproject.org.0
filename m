Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57C5B6C2C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 13:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406315.648695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY3ix-00033y-6A; Tue, 13 Sep 2022 11:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406315.648695; Tue, 13 Sep 2022 11:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY3ix-00031m-3A; Tue, 13 Sep 2022 11:05:03 +0000
Received: by outflank-mailman (input) for mailman id 406315;
 Tue, 13 Sep 2022 11:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY3iw-00031g-BI
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 11:05:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e82d5ddc-3353-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 13:05:00 +0200 (CEST)
Received: from DM6PR06CA0007.namprd06.prod.outlook.com (2603:10b6:5:120::20)
 by CH0PR12MB5105.namprd12.prod.outlook.com (2603:10b6:610:bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 11:04:56 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::37) by DM6PR06CA0007.outlook.office365.com
 (2603:10b6:5:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 13 Sep 2022 11:04:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 11:04:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 06:04:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 04:04:55 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 13 Sep 2022 06:04:54 -0500
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
X-Inumbo-ID: e82d5ddc-3353-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg/J8jaubf7InKCqQqLSvF5TY8pmKM3VIUVlWSvIZOn7bhjdQXnKDtVFYcMJ0E4jO7bl0BVidsY3+tyyGZp7M2QWvT0tl/0ECjoVRF7H++agZ+gaXfYItWOk75btNi7WyA4YNKyA2UpKka7XzQnLcnFbR6xaPdqJrfB+emZTfDvtXDxHFFFSTRXnFUz8v2wk89O3G3Q3JtDtXWcjUc6kwFb/Cc63lVUGYikGqJZ/9NmbA8X5pBiCf+VOxdWg4tmMpNNS9NVk/ggCt5pwV3FUIQi7H/Qo3uH2LLckAkEAMAcoJzTGTdoT59SrCggEafmGXqxqdHU48kw6cS2Dk3E9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN8VBdMWyZWPYpYA5W4LZYJj/Fc+AssyBaluPAEqZS0=;
 b=CPGvXQIE0AJf9x29NVt5Skkqs0ZQGRLUxKHssqUzZyUBcxRENxk2HRn6gbPI/I+0q3aIblo6fE6OXQZsV+kn67Jq4l8yIx6fOkBXiBdmFWFyUofbt5fbaXATWFU/kkWzFiauWykgDGxCBCFOiiR3m4pIpsuc3CXja0Ro3PPD9MaJnS5HcP3w1+34eeJ5A2oYbF6Nt1z9QE539M+aojruDW5CIxIzLfyzR6sVIzlaY+I0bvhrfkZJi3IZEwrRztRzdkpZtw03IwOCQhyRb7lAX6afqGR5ulkBegsQvsmNYa7vyq7CwdnRaYctVrShKyRrRQluAuXQKcW4na9En667aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN8VBdMWyZWPYpYA5W4LZYJj/Fc+AssyBaluPAEqZS0=;
 b=Eqtbt+Og/Y32zm90zVAxuhF3CGVbiXd+qk4NJFVZIUR7OwMhPbsylsnv1AGMQ95CMAQoqK3KpGH+BWrl6168IXxYBM0DeVrj1H6eomPGtPnqpsC7h6tVuu4zlW/EmV8mlZNyl/ZENb9bnKLwlRqhUXj8NyHpP6JoT8IDh/O25Do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <81eee8c0-03e4-fa41-757d-ee749ebcbe07@amd.com>
Date: Tue, 13 Sep 2022 13:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [ImageBuilder 0/2] Use lopper to generate partial dts
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <64aadcab-5f41-6d2f-4dc9-39415016816a@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <64aadcab-5f41-6d2f-4dc9-39415016816a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT024:EE_|CH0PR12MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 5582ec9f-87dd-4594-1d1c-08da9577cac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67ZOE1FmEos5k3a7xG4zkQRMRLNlwwKp1feVmDL3vAhJZntN3LJJYncbc9jPFFXafq1c0VAr2oo+tENMRABx7KEMb+YzTg2MvucWnZ0fvGTFNCCj/qi7hpanbZg2EbFPlagMx5ueW2AA8QqmD3efdTStLWI0tOwqb2T/N8GeilE+loS5g8dlu4q59kPpuhE129j7YeLCHdV3JTJXMyj+kuvPYKRS91tiu0jBgUkJWFwPDmru6adz18pluiW2iJVFVLJb0XGxjKj6Y/HcZHmGJ2zUtUqtFKy7IrIICGJOqLKkKxI/5xA+zESQUw/6QsDlwBpzl14sMrkVR7zfjllIBW26E0xhfKyGWZ8KwZY9Ybnl++fskeJbVOBjYKKNqhC2njYE3Qmv/DR/vApDciOYDeSmbilSwY/WGCtOzrMG12tdpqrbL0CV8wHFzdCMmnQajsVzwy/wEC/KUcR0dqHMINIs7qlIcsayK/2GrjH9ALCD3B79plGELe0iMeTaNIx/VJ78yxtFfEKBbiGi69WzZdygd2C0PO8PLEa023zF/w5nvsp411yWDbEFhtoLVV7QrQPNHc5eYNlkSb7SMG+lu2Jry9jekCiWinlDCp7PzZxUhDTdLOzx9TwwxmkKE7oo21m3HX0l7tlzb1vqPblnmOT2AbUtPdRL7TKtcf96BgVzwkuk3T2kErDSeddmwx8Zil78LFZaE4EDDTI+2+vOTOCEusU5UNTI2VjlcfUKjR3BXtQ6z03LNcX5Zjtv82YxvwnVUxnWMlPseCQhBIJ9AtCmzwsWo3oPxfgyHSMHTSfQr3jgxlfZJkhvOaWvCk8mweB3zJeVvGdh4cVRzI+rzmvj7D6Cg3UZQ/DPLvOpCBc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(426003)(40460700003)(36756003)(356005)(316002)(82740400003)(31696002)(2906002)(8676002)(2616005)(40480700001)(82310400005)(16576012)(70206006)(110136005)(966005)(47076005)(186003)(53546011)(31686004)(26005)(478600001)(83380400001)(41300700001)(86362001)(70586007)(336012)(44832011)(36860700001)(4326008)(5660300002)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:04:56.0815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5582ec9f-87dd-4594-1d1c-08da9577cac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5105

Hi Ayan,

On 12/09/2022 18:27, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 12/09/2022 12:59, Michal Orzel wrote:
>> This patch series introduces support to generate automatically passthrough
>> device trees using lopper. This feature should be used with care as the
>> corresponding lopper changes are still in an early support state. Current
>> integration has been tested with several devices from ZynqMP ZCU102 board
>> e.g. serial, spi, ahci, mmc.
>>
>> When using this feature, make sure to use the latest lopper's master branch
>> status [1].
> 
> I am guessing that this is the first time the imagebuilder is using 
> script from an external repo. There might always be a possibility that 
> future changes to lopper (master branch) might not be backward 
> compatible or might break something in imagebuilder.
> 
> As such, will it make things better if lopper is included as a 
> gitsubmodule for imagebuilder. This way a specific revision of lopper 
> will be in sync with a specific revision of imagebuilder.
> 
> Please let me know your thoughts.
> 
I think it could be beneficial in the future but not in the current state.
The reason why is that the lopper changes are in an early support state
(I try to highlight it on each occasion). This means that in the near
future we will be improving lopper extract assists to cover some corner cases.
Adding lopper as a submodule now, would result in a need of additional commits
for the ImageBuilder fetching new lopper changes each time we improve something
in lopper. I think we do not need such overhead at this stage.

Also lopper's README states that "Internal interfaces are subject to change"
so we can assume that the interface given to the user will not change.

> - Ayan
> 
>>
>> [1] https://github.com/devicetree-org/lopper
>>
>> Michal Orzel (2):
>>    Refactor sanity_check_partial_dts
>>    Add support for lopper to generate partial dts
>>
>>   README.md                | 22 ++++++++++--
>>   scripts/common           | 73 +++++++++++++++++++++++++++++-----------
>>   scripts/uboot-script-gen | 17 ++++++++--
>>   3 files changed, 88 insertions(+), 24 deletions(-)
>>

~Michal

