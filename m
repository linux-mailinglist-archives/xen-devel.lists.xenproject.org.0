Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D67F52F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639206.996226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vKf-0004lz-VC; Wed, 22 Nov 2023 22:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639206.996226; Wed, 22 Nov 2023 22:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vKf-0004jD-S8; Wed, 22 Nov 2023 22:04:29 +0000
Received: by outflank-mailman (input) for mailman id 639206;
 Wed, 22 Nov 2023 22:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF1Q=HD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5vKe-0004j7-80
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:04:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e89::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195625ba-8983-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 23:04:26 +0100 (CET)
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 22:04:22 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::d4) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 22:04:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 22:04:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 16:04:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 16:04:21 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 16:04:20 -0600
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
X-Inumbo-ID: 195625ba-8983-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUwMIIDa1D+j0dLRMAGx030s79N16aqn1cBdXzIt3J5lqJLz0kd2a2dCg/1kifalWofRKlAkp6cslkBxFwtKU9Ow3SnEni8lzg/oz8C3QXVhqfiICF+aabVH8fauPRTHv9yQXYRCg6u7e840lNjU9vsWjM8eq5m5nY1F/8Up0vIXb0x+SGb3lMPOfztCgxBwNPyx4nCfyLW/W8W575iHz6/ZHey5EZwDz7C9Ad0UwtgTtra1VcWQWwcrWaIvRiurtnSuowTebKKQWruxRxbSpW8NBB/k5PIO/oBG/Re51jc3ESdRGjHEXDNhTPZ/mWthoEsZ7r4xe1dsZefQAdEG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bFTDEX9ni1HvXW1C3ekUleWSyiRUl0tug/LRkLOJAY=;
 b=ZKdvsGfaGDzcW27GhW6Cd9TosHptq2h4sWKkcb/WRRI+hQHkBa9KhSFKCT2+PhvPLNC2KNvVS18d6p/BKY9NOfCOnkbhj/wcq0kYp48gHfmnW6LVvMT5nucGckQ7Fl2J8n0sNlYPkFHjDgd09ZHfOpqicDR0TJyW2Guy84Q0BSjA8y3MFJSvww5pAAJC1cJxcgtvKKbEmjzVnpo8xfxlLGlB2e0VXk1TrfqMB2IuxSxUnXNzePcl2utZU8OwlHwz568TITbpXTprOz0LvLkxBeK84VaiDI9o1et6/iChkuoIHi3f3MIZpuGiPbJKUc6KX4ciaMOct/g6NNqSvuiufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bFTDEX9ni1HvXW1C3ekUleWSyiRUl0tug/LRkLOJAY=;
 b=KY9iVT3xhfkfPeA1z46z5GiOOfmj8PlZBBro3sMWA4sbTOueWJNMbQNyiayduYW1Bv4ZnughVpIcIzuSUV3CExHpuQkBzVKeOM0IPCfk/aAxsX5J8GteMyaA2FykPAJ1yJVSdJHvQpJtVFCZvg1cSeBH2KMUZXDJR41mxXCAG1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3218335a-45fd-4a8a-9b6b-f902018a941f@amd.com>
Date: Wed, 22 Nov 2023 17:04:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdrqg4rc_B4sxfu@macbook.local>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZVdrqg4rc_B4sxfu@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2ae2dc-5498-4a5b-c6d9-08dbeba6fc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xm0Wkd/VOKL2IoNxkvqdr4I94tiNV6yauvjtuUGmDNXqG+MCfNQEj5GXYWxH0EQwwUscf7SOybzEpVAduiDDKqRBBPzoHPjZglhF/0sbPf+VY0/vEtmCMKd7q4t6mGEp6J6/0sfQMbX4hZeTxWUaf9ovW3u0vPpgRzQwaK6EnR1gFCapxZgtLE66yiVX8ZlV+P0snHdtFnWXoE6RqQ+eJt4yzy+TJnJbXDigBEdpBMcubweKTIcgeIwyVaNU2hSplnHKJrb9DQVe4zu5NnWwQzBwNNSUyoyxgXcFxUAJbkCSdG3gLsIzhX9zUkR91j4sRrRAdmA/oILTIAfKK3SYjih4opNU7w3gnYybajhTRGJ0VOQiw6A8a2Obizt1Hj7JSbsdz36QkAiqInhaOZvyZCPJ31wJycoWDfqazdGPovCfAlRMrQvjPhQSBIZV/x35eKQNEZfCkrb6PSI28glsyCgkZ2OJKnYKTLEogJ165kg3rz3s9qZRlBjkb+dnlfUXyYhzRn5CP/I6JvAzHq1CrV9QOS6OHgSm3p0qjjbkCrM7TK1dEGINevdadGumC/Vgr9C7aE/6r8vO/v6CMSKz1dN1GazoG/Jkh5gr/7j9vJjjFN5lOQfZ9AGAkWeK74LMOoPwh/RFvaLDu3wm/vkIPi1dJt8N8G+liZmchkP0XZUGO65wt/Tyeaej3T44VjScP5b6+CaVDRiEJJJYaCYWa1ZGV3sygWFTRi0HqaPyFAzHLo4t/nw/uLCqObz0v/SKa3eNlLtD4pXetSxmNFUEZz0lXhydRtNK123W606NHu7l6fI6s3mA1MJtuFKGoGE5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(6916009)(41300700001)(4744005)(31686004)(2906002)(5660300002)(44832011)(8936002)(316002)(54906003)(16576012)(4326008)(70586007)(70206006)(8676002)(478600001)(53546011)(40480700001)(426003)(36860700001)(336012)(26005)(2616005)(40460700003)(47076005)(81166007)(36756003)(31696002)(86362001)(356005)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 22:04:22.6658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2ae2dc-5498-4a5b-c6d9-08dbeba6fc00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

On 11/17/23 08:33, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
>> +                           vpci_write_t *write_handler, unsigned int offset,
>> +                           unsigned int size, void *data, uint32_t rsvdz_mask,
>> +                           uint32_t ro_mask, uint32_t rw1c_mask)
> 
> Forgot to mention, it would be good if you can add some tests in
> tools/tests/vpci that ensure the masks work as expected.

Will do

> 
> Thanks, Roger.

