Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6AF84FB78
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678798.1056377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVD2-0002sy-Lt; Fri, 09 Feb 2024 18:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678798.1056377; Fri, 09 Feb 2024 18:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVD2-0002rL-IU; Fri, 09 Feb 2024 18:02:44 +0000
Received: by outflank-mailman (input) for mailman id 678798;
 Fri, 09 Feb 2024 18:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H7xO=JS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rYVD1-0002r1-4N
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:02:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3399a9-c775-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 19:02:41 +0100 (CET)
Received: from BYAPR11CA0056.namprd11.prod.outlook.com (2603:10b6:a03:80::33)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.14; Fri, 9 Feb
 2024 18:02:36 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::c8) by BYAPR11CA0056.outlook.office365.com
 (2603:10b6:a03:80::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24 via Frontend
 Transport; Fri, 9 Feb 2024 18:02:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 18:02:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 9 Feb
 2024 12:02:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 9 Feb
 2024 10:02:33 -0800
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 9 Feb 2024 12:02:31 -0600
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
X-Inumbo-ID: 6a3399a9-c775-11ee-8a4b-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzMZ1Ca2IYHlvrWIujB0hs9yCQj67lf3gOjhj6Fv7BaLnA0vQ7DNP/pNjk9IsfqpzlF8qFxKAeEkqA0Lt96kOr5auQaT91x2+6E0R2SOxCPk0NumWIAVmjNOlLmjhc8UjdEaNNXvU5D77zG0SLBTj6Tr3dleoreRy7eMRiqqwZUS1xYYhdJo83qm34nHiGil6YrsX6M8wxWrL1YqoggiXFVlkh8eUGdq32MX0Val0N8qy6PUTv3xGZMcGsGLu6ucEc4G/KJnWVKCYzSJv0qWv0EkpXNiTRJlLzs7iXHC1twDBG66v1lCQu7ItMzabXUM/dEs0+mdDB0x2ykFQhUM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEBTveNL/p7e41ml1pnFpKoFY8Pak/QF4WgXpYUVY7k=;
 b=eleNqGrAGim1zv+bxHNA7Zv1XQ5WtktW8AmBlT2wzNowt0v1f5rxw9j5ZilqOTVHHQVgUFg9RgIzInWFevcSnQj8wC1UMDFLOvDKyX+EIesVRsAHTcYzmD9544Lj7IxRZrzzJ1cENGqZkBQ8a7LuaQuiXdyQMiRkms1VDqJAkIV090+U6MA5rLBhlX17oY7GOdGjvmM+E9VkmqAyjjOZEXOhhlIJM1KlbAdsjYzykIJ2tKxSKQ1/D2KWZck2W0ypC5NdDIBYUFf91KSvUIY4w44BH3L4hQNKBGTiVLjMYxV0kPOwbftkXnlI2AmV5qxxIco9UR1EPZWYcnMG5lb+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEBTveNL/p7e41ml1pnFpKoFY8Pak/QF4WgXpYUVY7k=;
 b=bx0f06QzMAziKc14xcQbeAWhVJ+97KYNQVFPomMLrqXzArxZVlhhT5iXzsxNX8bWKdCYWmRvhmOXn40Fn4zFL68w/EdQZPGXfaQakTk8aNx/hUF6Vs3swjyjBDto+HPTpNnnESWv8uSO/PpXxBess7RtEeWhDVidYgaOwu3D6sE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
Date: Fri, 9 Feb 2024 13:02:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of device
To: Jiqian Chen <Jiqian.Chen@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Huang Rui <Ray.Huang@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-2-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240112061317.418658-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 3062045a-09ac-4e2d-ffcc-08dc29994afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pNfbM3qkI3JWWAFuJWPt00zmQYV3JHci1VH/0Ad67oEAPivQfw91RLA+Pkrxjemvu3GC/Pcl38I0EKneaGfWYePSTLmHq6Es0gzfxcNdODpF63Ah3butC1i+nMa6BdeqmxagNxnaeHDGRM+8E28lO6/1EY35JAwsIWHpe7K4O8wvTgDwePPG/nBy6gkggGVPsp6gTiAZujx+PVViSRdQAHWmseQFT0vn/6RG95z68aVLXcEdS/RxCY559lNYdYDC1ds8qI8wc9Pbve9G9s9C2gSgtf37LHkoUxrHU1NVWWzdP7lhygA6F64jbV1LRthjyemVad9/VQJQ7K4+pxgPQ0srT7S7uHzSiKQJLYISWi2NkiyKep45hOo2Mn+limfKVikRERrc5VLYLWg7++IYxEWnoumGZsj5aQUUm2UzM8IS3kUfVtusNLDJIi9mGzDn7FItOaOV6O94nGXC+vrj5QrylxhBFFivAADGbeN9yJcZ8znECHMUGcIbGnTX1T2xqsnh2OeBOQKVk7VAbc3neqcXOyQPdzYYqotuf0nQUflKxGLzSo1DFOoBAZuXjXupMOj5T+TnaLbudUTp6ewrdw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(4326008)(478600001)(53546011)(966005)(31686004)(41300700001)(5660300002)(7416002)(44832011)(2906002)(54906003)(110136005)(70586007)(70206006)(16576012)(316002)(8936002)(8676002)(336012)(426003)(83380400001)(26005)(31696002)(81166007)(82740400003)(356005)(86362001)(2616005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 18:02:34.2747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3062045a-09ac-4e2d-ffcc-08dc29994afa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713

On 1/12/24 01:13, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the vpci on Xen
> side won't get notification, so the cached state in vpci is
> all out of date compare with the real device state.
> To solve that problem, add a new hypercall to clear all vpci
> device state. When the state of device is reset on dom0 side,
> dom0 can call this hypercall to notify vpci.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

If you send another version, the RFC tag may be dropped.

One thing to keep an eye out for below (not requesting any changes).

> ---
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 72ef277c4f8e..c6df2c6a9561 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -107,6 +107,16 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_locked());
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    vpci_remove_device(pdev);
> +    return vpci_add_handlers(pdev);

Note that these two functions may be renamed soon by the patch at [1].
Whichever patch goes in later will need to be rebased to account for the
rename.

[1] https://lists.xenproject.org/archives/html/xen-devel/2024-02/msg00134.html

> +}
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,


