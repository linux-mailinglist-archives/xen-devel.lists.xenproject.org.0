Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465D7D5419
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622038.969167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRm-00071u-MB; Tue, 24 Oct 2023 14:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622038.969167; Tue, 24 Oct 2023 14:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRm-0006uN-IX; Tue, 24 Oct 2023 14:31:54 +0000
Received: by outflank-mailman (input) for mailman id 622038;
 Tue, 24 Oct 2023 14:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FS8+=GG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qvIRj-0006O8-Mv
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:51 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e099e2c-727a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:31:46 +0200 (CEST)
Received: from BYAPR07CA0099.namprd07.prod.outlook.com (2603:10b6:a03:12b::40)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 14:31:41 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::cb) by BYAPR07CA0099.outlook.office365.com
 (2603:10b6:a03:12b::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Tue, 24 Oct 2023 14:31:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 14:31:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 09:31:36 -0500
Received: from [172.30.200.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 24 Oct 2023 09:31:35 -0500
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
X-Inumbo-ID: 0e099e2c-727a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSkh2FgZ4roClWii+QnmXVnu5lg0vqQjUt6r9yIQLjethlSZSvf7Ibmj3FD8xQicuhJxdW/H/hJQAj9+tA4RyRxz0ROk008md8YukyU626ig5pztbs5hPi9Ervfve1X5BTJLIoyxZJTXpkhqGR5oMRwJjgh5/+uDn4oqL7WVcqqQjwF+lmQYuSjgSsKFurk5872Rii0njJ30csm2WhMbTfSPmZfM7cU/shlFPyPZyIKSr9B9zXY/pN0UUaz3HakwJPR1p55sBQPTc9CKVkQQUOLAJ7UvqHGfIgb9hdkQ/ondjSt9LkUdW0E3SujNltYhPbW8DkMLj7lLxq5w34OBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJPd5laNVv99QzkQjeZ6PrmY5/XDvyolhYs9NPQN+LA=;
 b=mwMclXrL2kkDuUiEFk58OUnUBAwJ/p+lHHMZxvT9MkEHlnBRqZcktz+KgUjNZhRyntHcqtGB3IJ8FgdEi/l3lsI998fxEgGpyeoFm5r8u9JqyFrbLo0GwnuTVOqXFIeiVOeznghb9KgRuNYWaUdguM607Xk0Zsz2X3bd9WS0LkRlTXr7pXEg3+9tceK7/KUFKdyGHM3RC5sDdbscKzA2ZgRyLnP1Dqfk7oACbG/48aGUfVmkVDOPS5X42JsLGxIAR8b6lGz/UKtqPkddIESCufiFQOnnqIxAdRUf9FpBee3vELWiCKRAqwMhUyQ6U+6eyxKK989tJrxJG94hX5jc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJPd5laNVv99QzkQjeZ6PrmY5/XDvyolhYs9NPQN+LA=;
 b=Fi4sALCatm4xCU0cUFDiuDH6PJSboXA728IVO7/ZajOzk1RyOzz1I4f9ss0UECo1onVbO0vntWnkIekYT6YaQbVmBUd/YOKwckXddAxbTu12iKbD0Wo46JNKR37D1F6PQXpSYtR7ySk0hTct8z+tonw4OX28zr56rGP6Zqp/Mig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3fd1b2a7-16f2-4836-a2a9-0edfabed3ea3@amd.com>
Date: Tue, 24 Oct 2023 10:31:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: allow BAR write if value is the same
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20231023163615.693462-1-stewart.hildebrand@amd.com>
 <2ef80dad-5ae6-786d-e89f-d0c3af44b485@suse.com> <ZTd0pxpwtEbsCny0@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZTd0pxpwtEbsCny0@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e7e9fe-ff26-4436-3b8c-08dbd49df064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L8i27Xecj8A/Op0KbmkidbVeHfe3y2F4gpwSeBQF820S9uYdJ7EvCTQANQNc1mfwKEEXnCOCAfmDsi/18NvhJHU9PrVEw4+daLhS7Kj2kQSdzUNj8AL5knF3tWQjUvwU9x5rkNhTc48A1DZB8r8gz45ee2rSFoDiaeW51zgPU6qmZgZT6VhUXL/6wW5RmyFmfaF1+C6fplHz1IWlP6kASH7787Ur/bxqr0o2t5rcDx2PbZ9iC1/A/Kc0yKJH6WxN/gdjdZ5cNjdTtNGU1+wE2eaYhNJLRuqPfSpBqU6j72nY0g24ZOrqbkvCjeo9YMHf9k3HOr8+8pwv+EZ9h/sOPhuM+2aES9OrGFDJL5z/eKMQ3YG/m/4Uda0ffXQfB4WJyryLizo4wAS6wliqsbuvYzU34j34nP1h8PKsiKnjJwaE1PljF5pwsV53Lx7fKXmbhiAzKqaWwGkZQaqGjKimRtnGtNb4wTO17/iiHFxi2t5W/kQPm1PHWR2dwWNMSrOVt6IY7jU4kmlQvnO3Na67fTvOg3XBjjD8gpIcYNatCXoFfzkXShH8zHPc8N2Oz2aS9A806+T4hDZoMcOeYvPCQDrvJBKTVYBMOwZoiBfPy0681sYZhKLQlRog8Os9N2/fjUKIROWz7/XHn60/Vw6eI26u6bDkGeWbFd+mylGmO/GTCsLVA23lxTSCQLPsFxR9UB6/+DfJBSbuTEzEyPRaclBQOFOC1Cv0GxCth+tFlCrj5PRMQ99IuQ+mEb+vats6+aa3LO65GfLbQCXiOU62W+7RyJFmNoMBsA5sf5UjxrQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(81166007)(426003)(2616005)(478600001)(47076005)(336012)(82740400003)(36860700001)(26005)(31686004)(356005)(110136005)(966005)(70206006)(316002)(53546011)(16576012)(70586007)(83380400001)(86362001)(40460700003)(4326008)(31696002)(8936002)(8676002)(44832011)(2906002)(41300700001)(40480700001)(5660300002)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:31:40.9549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e7e9fe-ff26-4436-3b8c-08dbd49df064
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

On 10/24/23 03:39, Roger Pau Monné wrote:
> On Tue, Oct 24, 2023 at 09:09:45AM +0200, Jan Beulich wrote:
>> On 23.10.2023 18:36, Stewart Hildebrand wrote:
>>> During xl pci-assignable-add, pciback may reset the device while memory decoding
>>> (PCI_COMMAND_MEMORY) is enabled. After device reset, memory decoding may be
>>> disabled in hardware, and the BARs may be zeroed/reset in hardware. However, Xen
>>> vPCI still thinks memory decoding is enabled, and BARs will remain mapped in
>>> p2m. In other words, memory decoding may become disabled and BARs reset in
>>> hardware, bypassing the respective vPCI command and BAR register handlers.
>>> Subsequently, when pciback attempts to restore state to the device, including
>>> BARs, it happens to write the BARs before writing the command register.
>>> Restoring/writing the BARs silently fails because Xen vPCI mistakenly thinks
>>> memory decoding is enabled.
>>>
>>> Fix the BAR write by allowing it to succeed if the value written is the same as
>>> the Xen vPCI stored value. pciback will subsequently restore the command
>>> register and the state of the BARs and memory decoding bit will then be in sync
>>> between hardware and vPCI again.
>>>
>>> While here, remove a nearby stray newline.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> Do we need similar handling in rom_write()?
>>
>> I think so, if we are to go this route. However, ...
>>
>>> We may consider additionally checking during bar_write() if the memory decoding
>>> state has become out of sync between hardware and vPCI. During bar_write(), we
>>> would check the device's memory decoding bit, compare it to our vPCI state, and
>>> invoke modify_bars() if needed. Please let me know your thoughts.
>>
>> ... iirc we discussed earlier on that doing resets in Dom0 wants
>> communicating to Xen. Any way of resetting by a DomU would likely need
>> intercepting. This way the described situation can be avoided altogether.
>> We may go further and uniformly intercept resets, carrying them out on
>> behalf of Dom0 as well. The main issue is, as with any config-space-
>> based interaction with a device, that there may be device specific ways
>> of resetting.
> 
> I agree with Jan, the plan as I recall was to introduce a new
> hypercall to signal Xen of when a device has been reset, I can't
> however find that conversation right now.  It would be nice to trap
> device reset attempts, but there are some device specific reset
> methods that would be too much special casing to accommodate sadly.
> 
> The fix here is just papering over the issue, as if the device has
> been reset and Xen is not aware of it all the vPCI cached state is out
> of date, so it's not only BARs addresses that are stale, but also
> possibly MSI and MSI-X.
> 
> Thanks, Roger.

Ah, right, this makes sense. Sorry I missed that. I agree vPCI needs to know when the device has been reset and handle the state accordingly.

Found the thread: https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg01687.html

