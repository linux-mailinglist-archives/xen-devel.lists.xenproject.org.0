Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8D8220B3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 19:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660820.1030446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKj3d-0000Zd-C6; Tue, 02 Jan 2024 18:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660820.1030446; Tue, 02 Jan 2024 18:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKj3d-0000WK-8t; Tue, 02 Jan 2024 18:00:05 +0000
Received: by outflank-mailman (input) for mailman id 660820;
 Tue, 02 Jan 2024 18:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNM8=IM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rKj3b-00089d-Pk
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 18:00:03 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be40f6ae-a998-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 18:59:59 +0100 (CET)
Received: from BYAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:c0::24)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 17:59:56 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::e) by BYAPR05CA0011.outlook.office365.com
 (2603:10b6:a03:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.7 via Frontend
 Transport; Tue, 2 Jan 2024 17:59:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Tue, 2 Jan 2024 17:59:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 11:59:54 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 2 Jan 2024 11:59:53 -0600
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
X-Inumbo-ID: be40f6ae-a998-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg/ShcVHaU3auk6Py5D5evMVc3RKDdZ1Ud8TYzLzJIDOzWjz0MYilLbWHYmuQ+v1Zrin058jUapwHZWqpLEAJmTrsPBDCBdQakzkH7sg897DngeEo4ukSdOCF3silLjD8gAn1CVsktTicQ1Zsxa9jy+CjpaOaGvIdrvKG1NGtSkgGkmYICNBFA1SZFLN1BrHDbajXmPCfRYgY29LqZF4g/qk1sLP5xPnubIbmjj/qwMZWe/ho+BdMelx2Aw0oKgOGJh2CB4w+Fe5CcBM2DcVtlGi4mwRD2Z24g9Aui+xQWdkGZqDSH5n5xgVgzoebeihGJj7DKBTaCN9kgsLLjkdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNv9SfU0t1uskTV7tV/6zk668SUCL/wWCzQAB04Vwo0=;
 b=NEAn2HGv0897OisgeNLBEM7yj/wl62XEGGDEidHMBSlmH0Uuv5lrED4hOIuEtmil+UnD9cd5vGbPP2b/lDs1Pc5bi7/jK3McvcmW+pgLXKaNxYH6CaFjsC+9491Z5Bx8ZiuDZMR6cb6pH1jjABB8rdo94wOr8RDtxZAfOQ2YGlghZplqSl6qForAcgiWPXvtfIjawKSPUGIt+knUISk8vz0vbo8N7p15iCAy0wL07NsdOKPPzXoBZwb4qJ8/S/0VuOQS2pC++iHSZRjh17pGLevN2vBSGBZ7mpoaGxIWgh6gK4IYPN+lAeLQ3Om2/AqxTcIag5SVDWk2Y47KAwVjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNv9SfU0t1uskTV7tV/6zk668SUCL/wWCzQAB04Vwo0=;
 b=Ey1bgFrvQfxrNWfWBkl72nufpr5l9iZqHvzwqnocNfRAh8nB+NtUDX1Dikl7uKM9KT8u8UKdyKmajkGtpeAkgHVV4umPbMTLSeM9u8Gk2sgLzoTOKSuSWuTLg+a8ZsCuhWUdBFmFcz6NZbeQSIPZ7/G0G40m4+jHJ/FuzVDcTGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2c085876-fc9c-428e-b064-5be0d19c78e3@amd.com>
Date: Tue, 2 Jan 2024 12:59:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/17] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
 <ZYRYDO2MPOIfx64b@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZYRYDO2MPOIfx64b@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee0ce15-37f4-4b7b-116a-08dc0bbca055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8y74gQeAG8eI6h2vQ2qO2Ug92GI+e2gipzdmf167IwPJaF8LeZ4UxBvgBeGyg1/fRMMACCqL/sq5qXUI7RzBDXsWILWqfRFZBUgQn0t/N9QQr8IDBh/KQQnCq2Nd6j6dNa5djVAi7uh9sJG1mDrQx+598ymZ21haxTGmJ70fehtK4Sp4n41mIHgv3oO9k1OPAFUX3EukOp5jij50uV+ybzVXcFm6RgFSob6voCdRyfrR09D/3/F5zfLAjl/XE9/eHQcZf2lw4C8uPnnYjZk+p/NibqqjmI5W7rDeRAneEVAgnpgLosmkyAjT+AywUAhKC3VOEM/IR6pbgS6XWAYePi/n8TYbl8LfA/Sd7gfmWqolfl3jpbbWhesNs9OQw9SuEekEeUupqZGAQOLghYfyMqX1E64Rnz8DlNPICS5gWmBX6sJAGE/L4q3QRuWjHmgvhHoVpvumgHYFz5LklG6cIgWchvWweg5zH830HSCQn93uOnOYzFjtsOGk0jykzcQlQCuq4xY1+wR8HWVx5FSA5DGPpPm/7QYLWf34tZbGH/oA7q2ZEQpgEOYv9AndIg4ulQF38SKGfH2vDe4vQhsKr+23VhML094plN7C4ATS7lHCXeWEBkT0Nnr0qRc2TwmViYh8lLtxzxp0hyJGjxMGKFBPpxQGETAgvkFnCAqy4S9n79pQUPra0eetoHmQWAsw+EdNZVg2+iTdq1rVM81LbwwVyDv5zxToI61/33/TSLj9LLHlze0SKn0vGgzW+ox16eb00BvMcHO9Ck97Bo72cu3YkmDZ7bjIVemumIK2S4gIEWJz68RAC3lq4Fusq5yJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(356005)(82740400003)(81166007)(36756003)(31686004)(31696002)(40480700001)(40460700003)(86362001)(2616005)(426003)(336012)(26005)(53546011)(47076005)(54906003)(4326008)(16576012)(316002)(478600001)(8936002)(8676002)(36860700001)(110136005)(70206006)(70586007)(41300700001)(5660300002)(44832011)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 17:59:55.0048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee0ce15-37f4-4b7b-116a-08dc0bbca055
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338

On 12/21/23 10:21, Roger Pau Monné wrote:
> On Sat, Dec 02, 2023 at 01:27:03AM +0000, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> When a PCI device gets assigned/de-assigned we need to
>> initialize/de-initialize vPCI state for the device.
>>
>> Also, rename vpci_add_handlers() to vpci_assign_device() and
>> vpci_remove_device() to vpci_deassign_device() to better reflect role
>> of the functions.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> 
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index d743d96a10..75cfb532ee 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -25,11 +25,11 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>    static vpci_register_init_t *const x##_entry  \
>>                 __used_section(".data.vpci." p) = x
>>  
>> -/* Add vPCI handlers to device. */
>> -int __must_check vpci_add_handlers(struct pci_dev *pdev);
>> +/* Assign vPCI to device by adding handlers to device. */
> 
> Nit: the comment would likely benefit from removing the last device
> before the full stop.

Will fix

> 
>> +int __must_check vpci_assign_device(struct pci_dev *pdev);
> 
> Thanks, Roger.

