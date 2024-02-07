Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524784C5B8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 08:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677276.1053782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXccj-0007iM-1Q; Wed, 07 Feb 2024 07:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677276.1053782; Wed, 07 Feb 2024 07:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXcci-0007fY-UP; Wed, 07 Feb 2024 07:45:36 +0000
Received: by outflank-mailman (input) for mailman id 677276;
 Wed, 07 Feb 2024 07:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=beHI=JQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rXcch-0007fS-Vz
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 07:45:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df54ee6c-c58c-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 08:45:33 +0100 (CET)
Received: from BYAPR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:74::14)
 by SJ0PR12MB5469.namprd12.prod.outlook.com (2603:10b6:a03:37f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Wed, 7 Feb
 2024 07:45:27 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::eb) by BYAPR05CA0037.outlook.office365.com
 (2603:10b6:a03:74::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Wed, 7 Feb 2024 07:45:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 07:45:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 01:45:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 01:45:21 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 7 Feb 2024 01:45:20 -0600
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
X-Inumbo-ID: df54ee6c-c58c-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJFIgdrdPxi/QE7uGYChnwcI+AnhQXy1XIGgmIsAauHe0gkLMhubGVgTapmXTKXSd9wJZhEIjiX4Cdd6GkLFzv8EBKJfS/We62llfV6VfOwN+9z6tDpCv/glgfdKVBnbcjPZ+E3Ab9JpHIwltLlvfnjMrCbvibzMhXPX7TZp67yVzyMhZYP2xFqjrhnLQBjaKATnZfJsYsxxo9KTIDkQSvtaIPs5FVm0kRyazFGk8MRLqEYoTkGiX6L7elfIYmpXpXo2x4etq86T3TZudhZ1SVa4X+PEXP7TnfK5AR+Fu9YjMObubkJX28fiM2pPtC5mdUPa561mXvqdSo2wvLu0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0Au5QSoHwuPeCLBh/jovbIb0s+fFUJga4OVHXVkhzY=;
 b=jMLKnV9egpqCJCtie9D/+8leIQEYGfFvihFux5iGc2bsBMCCpGFl4zw0z3+OLnilIYYvC6VB8cGHPZZSodONGY5Eu+anATpk3vdtOSjnhQiy0nK0p3tGrbaK1NPUVmtgjFEUmhJbtnAJyLtMD2rMZjLx1fPSs6PZPqXBBomw3kZ6R6vUdaRi4L1tW60LyI1cfwFE/T7Lhy3aC4vRkIPpxD9RvzAaq2J24hhLla9gkGCFMfWLwuEgF0nkCHtQ/KAjZnv74XZvgmY2rIfX7KX3dmCTv3XEVC8J4iUlkMZFiiEBsAIhoII5BYIi/S1qF+zQNxIRGYETe5rv30cCBmRi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Au5QSoHwuPeCLBh/jovbIb0s+fFUJga4OVHXVkhzY=;
 b=ErSgyILYn57nHG/79Uxn+ZnfVd3DlEpza2DVNaWDjIQ+bXDmQLu7RypCTZLxGq0QxIS/gGHAHG9B3/4gNdJ0gxzWH9PNTP2gqDl9MenGCvzLb+FBvUQbCJ2WqGC5Yxh3jejOAiL43zkoN+QNe1JmjJNf26VFZ95hnoYwZJ8L79w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8daa2461-092f-48ad-8556-3bba398ae544@amd.com>
Date: Wed, 7 Feb 2024 08:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-2-ayan.kumar.halder@amd.com>
 <c7841d11-d072-4787-9d76-ee94123605bb@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c7841d11-d072-4787-9d76-ee94123605bb@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SJ0PR12MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: b2342e35-f5ad-4d29-d682-08dc27b0c027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6SYzoZOzT/Jd4ODuWnH/j1OWCz1PK6juT/DwZFk2hFTPuzgSt4o1iSRPLVh59Gk8hfl+thos/a5kZs4CbjCLaWUbl9OFwJECWFgB/KsH5VYUNoITfClKAAeeWwx3vY77YP10zvVsnEfnThb92o6yYFz1viLQTPSg/K0DLrWdrxRHWPQGPGr4dkDAvKNhbMzF+Ng0J4IsH70cF65HFe3ejE0eOxsvqv3EpetElJukAz+O7o9sl8MLzg8cB5QU78TNv4pLrZhWZ0xZa/v2DMD/qDxfOkv19Jx7EuBYIqPXTQJ4icrUZeHTHwYASUO9Ou2SX2P1/Cr6zhoig7+AJpcxY05vC14+9odVGgLBR9j2Rs6rRXuzP8Y5bZgOvfeq6tUnR1RdnIZvtkmt+jQZQV0bvFOuxMb8166OKQOj26GK57Ry+JUOMpItfsTnE7ExGQRDl7QEDYIVQ2YIugVlFrHYHCz8lyRud81VSaYs1f/F7CYvaTLbEJepvAq/h9l8KPKh1AySQA1pVak9O8f1HslrhNyvMIzuTMQEWmthFZlf4eYemODaxOelRzpSJnbCTquBYJcX72uhFOO3TmU4ybd28aUpMSroLEdo/4Grk9uiuolZcLkfwiNu4Iibw+uxgGoIk2PhFmRIdEoR9qWexzyvYQdnidk1hyqRP5hqToobCzTt6RWJCtgSQkcpBFbLPOfTQvY1H0t4WNtDPduW2sOU5pSGehPmTnMyt7h9xPkhdbVrFiwgm7H/6mEaZ7fHeh8MsCKST9gPeDv9Y3UgHGrtFcZ8HsmpCeCEpNXu5GN77JQS875TjN7gOn7dyEP2ZdB295T/Lp27C+Fu8gYtjg8fw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(36860700001)(426003)(336012)(2616005)(26005)(83380400001)(47076005)(478600001)(40460700003)(53546011)(31696002)(40480700001)(966005)(86362001)(70586007)(316002)(70206006)(4326008)(8676002)(54906003)(8936002)(16576012)(110136005)(31686004)(356005)(81166007)(82740400003)(44832011)(36756003)(41300700001)(2906002)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:45:27.0081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2342e35-f5ad-4d29-d682-08dc27b0c027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469

Hi Julien,

On 06/02/2024 19:49, Julien Grall wrote:
> 
> 
> Hi Ayan,
> 
> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>> There can be situations when the registers cannot be emulated to their full
>> functionality. This can be due to the complexity involved. In such cases, one
>> can emulate those registers as RAZ/WI for example. We call them as partial
>> emulation.
>>
>> Some registers are non-optional and as such there is nothing preventing an OS
>> from accessing them.
>> Instead of injecting undefined exception (thus crashing a guest), one may want
>> to prefer a partial emulation to let the guest running (in some cases accepting
>> the fact that it might result in unwanted behavior).
>>
>> A suitable example of this (as seen in subsequent patches) is emulation of
>> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
>> registers can be emulated as RAZ/WI and they can be enclosed within
>> CONFIG_PARTIAL_EMULATION.
>>
>> Further, "partial-emulation" command line option allows us to
>> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
>> enables support for partial emulation at compile time (i.e. adds code for
>> partial emulation), this option may be enabled or disabled by Yocto or other
>> build systems. However if the build system turns this option on, users
>> can use scripts like Imagebuilder to generate uboot-script which will append
>> "partial-emulation=false" to xen command line to turn off the partial
>> emulation. Thus, it helps to avoid rebuilding xen.
>>
>> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
>> This is done so that Xen supports partial emulation. However, customers are
>> fully aware when they enable partial emulation. It's important to note that
>> enabling such support might result in unwanted/non-spec compliant behavior.
> 
> Can you remind me why this is built by default? In particular...
This is the result of RFC discussion we had, where both Bertrand and Stefano agreed on having
the Kconfig enabled by default to improve user experience:
Bertrand:
https://lore.kernel.org/xen-devel/C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com/
Stefano:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2312081514450.1703076@ubuntu-linux-20-04-desktop/

~Michal

