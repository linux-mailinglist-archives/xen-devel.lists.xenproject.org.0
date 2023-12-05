Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4232804549
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 03:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647378.1010443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALRA-0001uQ-4B; Tue, 05 Dec 2023 02:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647378.1010443; Tue, 05 Dec 2023 02:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALR9-0001sM-W7; Tue, 05 Dec 2023 02:45:27 +0000
Received: by outflank-mailman (input) for mailman id 647378;
 Tue, 05 Dec 2023 02:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rALR8-0001rv-6l
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 02:45:26 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55368475-9318-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 03:45:22 +0100 (CET)
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 02:45:17 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::5e) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 02:45:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 02:45:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 20:45:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 4 Dec
 2023 18:45:14 -0800
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 20:45:14 -0600
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
X-Inumbo-ID: 55368475-9318-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSHbSQkoV+8vTrk0o+3lnuFOQPuqKt1WjgS5IqIxIMW/5ZA5C/oABS/2Q/y2ps1bKDBS65Wm/Xp2DYoPM1LygHJ+jYajPgvhaX/ewoyA4zJSCJS67AEezEv/Xfta2J8hpY7xjrbHSaQHz7zN32eH8MWvyjinjAQihX1ZXZ+9i5g9vQLFBx3XIK3ScPd0CE6p13Azmi+5eWIKcJ1sevoAK68A3nLElTnrJjB6d51SsM5q+DY1QdMuD5bx7e5hSN/Hu0JpwIZ4b/XXQD16oEHEs1f8su7cR5QnhfwbYd4HiyHARFLAsfACLaoBuOJqnFdFQf/HDeGuv4gDWcY3mcZ9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88uRk3jdohLNmjxocnljUSXOZuC9n4eCPuzq0fnjPJ8=;
 b=bZ3lDNDKnxAf6GlFgxl+amXz7IqlwN9q5LzFk5QxuD2PLb5lOJecFPJN/7slC3fL1/1fb8OQsZoq0WhCEGIzqre3kxUfohdaP9wS5R46Vd2nWyqZr6/F19w7EWlSgQlGfnxhDtGB+aS7nBeT/QzbIA/fVBGaY/JckPUw7sOZ+Xi5PzbxrN98g9OA6olbvfbDnOMinzT1wP2XanuAfHo5a31R3/QPijhywBz+EZDrIliECIZMzcMTcIVOi88BKh2DoPoncyEAc8htTuf217FZcka+sVsV4/t7NLm313iBlKJm+Axu3g8+XVRyeCHZQ/Rl+y4UoXomZuym+wn48aAxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88uRk3jdohLNmjxocnljUSXOZuC9n4eCPuzq0fnjPJ8=;
 b=ft4GNSqRJ+3KpyFRSWzpyLJHhTkrMiaZBtIGbMO3TVhWiS/lSuZHkl/P3/Z/t4TzFv+KAMRAFq9u8iFv9GFSPzbHFyrHDtS43iSNWMG1C0qtcWvD35/HVNBCZUfxjUN7/JsboYesRcv63YGZB7zsB4uMG01niPaFVwJRED3WvzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b30812b1-aaa4-41b2-9d82-5ca1478012c0@amd.com>
Date: Mon, 4 Dec 2023 21:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-13-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231202012556.2012281-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d5cc14-a031-4a21-9910-08dbf53c369c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DZ6djxQKBPazqa7Hi0uC8GIpIA3yDPpgQEj4stNByvqxChmXB9JoPwHq39tbRl+S2MnmgmWRVGCvOYPrHZwxggx5QAivkVhoWONBiX3bs0p5FitZLssLZhpfEAUygWwqr4U8oSXpOGWVE6tHv9KuOdVV3XsjGJb1akdKSghkRsy6GdUKJ1s14rjeQYqeQDOkvUop7DvNJlAfs9Rh3l1Q1AZoXjz0UbdlhkKJhy9gJU6o0jNS2Dy32NISKS8H5V9tJsidiL8hFRPk66fUDA+j3YFclKWfZ7Vr4wg+5K4YuWQoGzH5ME++GfQz7qHtNi1t6y5fPIvmf0/dYjw42IrE9FAas0Od/mv7cU55LK0NQHL/BuzG3kWt7VttXD9Gow1F3F3meDyCKVBXcKFif/sAmQt2CV0IkbLGRKqLf9zumxprwYsTevkS1hS/mw5FeQZmxTI7H/R4kisl4mVtokYiZD2ny32WRzI/TWF/etfG8Hry1qlft6j6EJdNJgOm49Wuc1WQEaz5vOleAs8umnTdOmB6CoSysBHMK+9VseEv+cJd2UpuS97lSOmZV53bg0mFLKy5Y0X2hPGLKZlM9s8e7EftU7CKF8D14fzHnrzpnxKABtLT6ejFbrEcNfDw62CifUclfXQ+Fyfb12XHdo0NqNjc6V/YB6saEVX35fLRNR9xE7YfuI0zgqlEYuNx+ULJNJ/hDtyb0Uf7pJg5NSHn9/OCh2HjbRSvx/cMaqlty4h8m/7Pp37Vv5irChnsSfuqntidZ9KWy7vtUeepiuHz5mR5BLJZ/OQPP7R42GQF22l0vJrqVUaa+dthQFtsHVQl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(82310400011)(1800799012)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(4744005)(53546011)(36756003)(26005)(2616005)(36860700001)(41300700001)(81166007)(82740400003)(356005)(336012)(86362001)(31696002)(426003)(83380400001)(47076005)(2906002)(478600001)(40480700001)(44832011)(316002)(70586007)(110136005)(70206006)(54906003)(16576012)(8676002)(4326008)(8936002)(31686004)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 02:45:15.9101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d5cc14-a031-4a21-9910-08dbf53c369c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549

On 12/1/23 20:27, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 21b3fb5579..bc2ebe125b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -167,6 +167,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      if ( !rom_only )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +        /* Show DomU that we updated P2M */
> +        header->guest_cmd &= ~PCI_COMMAND_MEMORY;
> +        header->guest_cmd = (val & PCI_COMMAND_MEMORY);

Was this assignment meant to be a bitwise operation (e.g. |= ) ?

Also, "val" doesn't appear to be declared in this scope? Maybe you meant "cmd"?

