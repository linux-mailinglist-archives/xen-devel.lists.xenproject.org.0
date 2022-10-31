Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610D613C69
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 18:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433123.686018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opYpP-0001UJ-Rr; Mon, 31 Oct 2022 17:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433123.686018; Mon, 31 Oct 2022 17:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opYpP-0001Qu-Oi; Mon, 31 Oct 2022 17:44:03 +0000
Received: by outflank-mailman (input) for mailman id 433123;
 Mon, 31 Oct 2022 17:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXMc=3A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1opYpO-0001Qo-BX
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 17:44:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99e0b59a-5943-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 18:44:00 +0100 (CET)
Received: from MW4PR03CA0305.namprd03.prod.outlook.com (2603:10b6:303:dd::10)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Mon, 31 Oct
 2022 17:43:57 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::c) by MW4PR03CA0305.outlook.office365.com
 (2603:10b6:303:dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 17:43:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 17:43:55 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 12:43:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:43:54 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 31 Oct 2022 12:43:52 -0500
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
X-Inumbo-ID: 99e0b59a-5943-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjh+I5o8RhbtTJtdo0EtR5/FTmasSLgLSTtCfAlLrczMg3e9opMSxlNBz/6HdIQ/BWBuhcr9rK91+cJ6n9dIFVWud8yb7/+wHjjGxIjKn8A/1tWWexpUIrLLsrrZirpTb9Q1+YI+AQGxMuZy00/See+1KtX9Ein7SrMnRUSuxxR48fP3S14EhqfoP2B3waYhWVzYu3zjeOAIm/RLULWeBZssv6SnbtQb9L7s+BGTitH/7aST3M2Tl+TId6UjneySQpK1Zau23efuWFhTnMhDjopMmctiz4+QgxejrodNQtlttgp9fZf+PsyTowWxxaQsK5H9JR+cpjXvtWE4DcPKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvy+G2kZybtD5104OadHck5HK/nEkBIFHuU9n9YksSI=;
 b=Hfn8CS3P7aus9hmqsMaIIAaWKZ/7Y6SHI1GgO9spWg9XD35bdy3/AWEPH14ed9N4KSKqEgkLUCzbnpqFk05Pa1eGTx7CRCtnGEjzcWFfxmr68GSqRCcA93B2xq3tCaJdzHIJ0T+fvsPg3IzuhRXujhoUMKhvw9dyD18tS67qZbbI3BHv9sba3CX2IcNx6ojNUaMQmuaIBrpyE1jz8x/FnfMFuTPn38CvIVYymWPkM1ricOMR8MaJyCNjUup52DDc82W4wz9XA5qO1ZG1O5XwWrWzURjv1TPuUJ3LThT2IC5clxLLWCO9RKMaTL61lyKwoX9BFcYDmGtINMPakJPeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvy+G2kZybtD5104OadHck5HK/nEkBIFHuU9n9YksSI=;
 b=wAv4YbSJR03fvo5S8TPVCCS24JNNmmyXiGOG2dKT/8fEn0QKIjT1SP5cOgqzXkoOV1KBMMX17IptrDcPABk3fgN6TB8VWOhFP+GzopPWHmsD1fSUK2HGALh/If0GJskeFWfzN5uf8uCwDtvZYWAzTlT5hvIm8JDlXrUpBlB3o0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b6504f3b-00c1-db31-2c40-94796f8cf161@amd.com>
Date: Mon, 31 Oct 2022 18:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [XEN v2 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable
 for Aarch64 only
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-2-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-2-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|BL0PR12MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a575089-a847-4780-2358-08dabb677b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6C6Lzw+EgxZVK/KYMzEWUZEqzEkH2+8k9jXwYV7JfYfcAzRDt05Go028+IGo6nG2jxWA3ju2j8+UAqOxt+YNWju+tQX9SXEZ7wlUV+MAaMckbDUSy1Q/T1v6qU+sNqc5uEw3BN0e0Mb62VnJtQ4GlwhEAHivsPIjcvMXlv8oDNEa/7Twu9/4+ZwQvN5nNoGFW9/QgRHlLBZRqsOy+/VYWU32UbO1AyqrSt29ZgO8GkQx9W6pA+HnTBDPZhYr/m0GN9904R7P5AHYQ3fq7vv01L3xb7UW1iyaHKc8/V8vjVs49i2bqISAT1MUoJqhwFVEzo4aaXN1P4w5OgG9J2DaWeYF278BWjya/jBgYNwWYWKe2nCHiH6s+iLcmgaGuTqiIOevnlNJ4LNfe699nH4Id+IZeCud27kX9zBaRK8+6hWRgMrkKimUt4j9ZUrMy6+joBwIAY6BQpgyS/NVZMHUhH9Sd2VK9rkEbLKe8zWtNcdKuWbJbJ2iskW2e0ilKmZxCxx0wWZcjIVASIy+s9cwREZudW3EmdIfDAF4iID4sm1Ys/tDu2w16K/BgdRiz7oFjXb7F9PhaSrnZC5r6hu6sGxkpypz0AyEL/1K0S17Qcq/Da7FKK/ZcufQ3+WJs6ZIflxkTHbqNrj2z28NCwjIOFcMwm1K5eGtRYRSo8HIFf2wVX+wlLIyvgKULN46H+M3da2LlV9qBBBKZY2sQZuAMmrjOkXDxSrbiMY66zL+NUzPgl/MKB+efPme8R2ncY2yxtYWFKZPbJrBEkwAcmOBvq7WoDZQND6QjlGjZT2nymbmFNP/QvRg/T8n7A4HmDsWaG1FQ5pIUro8A5pRRA1vfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(336012)(47076005)(2906002)(81166007)(26005)(426003)(44832011)(2616005)(186003)(5660300002)(8936002)(82310400005)(4744005)(356005)(40480700001)(31696002)(86362001)(36860700001)(36756003)(82740400003)(40460700003)(6666004)(478600001)(316002)(16576012)(8676002)(110136005)(54906003)(4326008)(53546011)(70586007)(31686004)(41300700001)(70206006)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 17:43:55.4246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a575089-a847-4780-2358-08dabb677b96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state

I think when adding new code we should be taking the latest spec (which is I.a) as a base +
you are lacking the information \wrt page number, table, whatever contains this information
within ARM ARM.

Apart from that, wouldn't it be easier for those reading the commit to just write e.g.:
"Sysreg emulation is 64-bit specific, so guard the calls to vgic_v3_emulate_sysreg
as well as the function itself with #ifdef CONFIG_ARM_64."

Placing EC code in such statement is not very helpful.

~Michal

