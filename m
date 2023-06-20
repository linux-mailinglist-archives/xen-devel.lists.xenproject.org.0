Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41D7375E7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552277.862260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhnN-0007nj-3x; Tue, 20 Jun 2023 20:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552277.862260; Tue, 20 Jun 2023 20:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhnN-0007l9-0p; Tue, 20 Jun 2023 20:17:45 +0000
Received: by outflank-mailman (input) for mailman id 552277;
 Tue, 20 Jun 2023 20:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkNP=CI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qBhnK-0007l3-OW
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:17:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811a7110-0fa7-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 22:17:40 +0200 (CEST)
Received: from SA9PR10CA0009.namprd10.prod.outlook.com (2603:10b6:806:a7::14)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 20:17:37 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::49) by SA9PR10CA0009.outlook.office365.com
 (2603:10b6:806:a7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 20:17:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Tue, 20 Jun 2023 20:17:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 15:17:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 15:17:35 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 15:17:34 -0500
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
X-Inumbo-ID: 811a7110-0fa7-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY2suoiTEWEfS4+3IwEU0Au1axJMhxwOjotXBsrwnXdJlmtQOtCC6Q+IFdgqhLwjOE0yrDVADgyp2hJV/5Ifu9Eu2XVZrbaHt6/LCxj1nCvBLojR5SUNbZiX2nYui1WVokKb9zg8cpjK4+oqMzJPOe6vwrlgyWJSWkFpSt8am5IFfaqQCW02mYIDP42ZoQFyBCq5WpRmGBFQcBjQLw5c9Afmkaw3IH5ElY28gPybq2hNoN9i7sOf3PSYVn3su3YhrgFmbV/6QSXA9On3POJz0wmbUwDgQ+jjLshI3ytmscKj7FHnqu1GjmQwy1nFFbaIhVPjL4NSgJfyj5rDKYEeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx181DDKOS+YXOh++MInpvRp7CSA8JPETz6niB+9IjU=;
 b=XgPPwF6VAFE646d8FBV3O/V0uyUzF+ROowyPu//kjVojhRp/gv6UuQNaxTzKwpudVq+iSy1k2IhZNA0pOnhm4HtX8WLkgyYygq0imJCJH5JISYUUaw9k2Gij5EUdtuxnTY7glMPkb2A6eBBEAEXVILVkNF0B6aLDUAGj0YNC6et/d52T1US0Kq7dp/9fBdsdrsYuGCWxwkaTGIb56czCo31ESQe+6a5jh4JjBKoJFYeofFdHRhUowIAL7+S4gKu+YnZBdtFn3/2YdnyUCzYEAZLmdst+F0DwlVy+lBPUkO89hrqEAtgR8EzIJBGuiPrTUwrm9pIN+7OmvwApRwzFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx181DDKOS+YXOh++MInpvRp7CSA8JPETz6niB+9IjU=;
 b=4CuraYkzsU1ZL47pyHBOgDSM6NVu8464jPgPoGSdzC19U97BBNwO36o+GM8I4Y/EiQPFLdQHIuaxXVuJUXSZ5HhcOKy/Jb0fAYRUW5RAe7ancA9zPZiSX3Te60bbjfPiAYQsoesiAWTMc6UYj4HOsGTQPX0SPyXPEkskc3QO7NI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6418b3bf-5b7e-3c12-52d6-534bf791617a@amd.com>
Date: Tue, 20 Jun 2023 16:17:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
In-Reply-To: <20230613103159.524763-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a3a1a5-98e1-4ce6-7fb8-08db71cb635f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eP6mnERuWTDmUOOZq3grwOXB3hfc1Spg+lHXClIEDBCbqt/c7hxtflfzUuSaUxjfNGAYVaNIvLy+84Jt7N7mnY/4av2n7jM+TcZAB/CExhrAo3D6gWmL22loKZfKEdVsGXN9s29lXy9A/7hIrdlFe051RywzYcNqDbITfS2UfXBdsYtI2WQGYff5RI9Pg8R0TzuoL6CqVMt4jmviz/hjuydy78h3cEZQK7p75RSOrRkTm5WdbiOT/8RBHPMM99PMTHm2a2CkCuE3RgKEanxcY/YI8fyXxngIxxutiqsbykUU025aUoVI4JhoQG/hFZDZ0/Zmc9TmM6DK3Eyizkb1Na9lKcKMDT3VzaB8J/DGhMFZdKU911XLPlWPIlfKkNtWCiJRia1Ib54+u73qMJh6KYICzcq9A4j6GaOjiXOexq8luoEjK/O5yIOPBrsneK1/o6SpnfRFk4WKOisfweG4RUX1AIK1NPICcihcLimT8qTGeNebHySyGf2lTLEgGYFmsE51pS0Ba16/vMwzrUmZoYNwXeuylnRgkpxj0HaZdjc8HfD5KK+Fr/CR4AMtEDF5aCsUjcyhqVDF1whEFPac4F08bEUNjj9YbjUyUVVQ7lUmU10WOh6kSXa8i+ZP3XVxRN3iElQikr8zzQElk1jNE6mqxXzcoZUblpVIeCXuYr6jccB0ls5WZhASa2wxIJWqS/TfC4LikGpJGG3rSDXA4Wb3B4NiAdX0lY2fwNQJYD37gEHv1jz2R7IKrFYtIXQRkzhI01jseqLQEOv1xitk2PZaSgDPWXgLfc8khVPFm3a1x9VMueqdXS+zHSeJYix6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(44832011)(36756003)(2906002)(40460700003)(2616005)(186003)(53546011)(26005)(4326008)(70206006)(70586007)(8676002)(8936002)(41300700001)(82310400005)(6666004)(316002)(5660300002)(7416002)(478600001)(110136005)(54906003)(31696002)(16576012)(47076005)(82740400003)(356005)(36860700001)(86362001)(83380400001)(426003)(336012)(31686004)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 20:17:36.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a3a1a5-98e1-4ce6-7fb8-08db71cb635f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952

On 6/13/23 06:32, Volodymyr Babchuk wrote:

...

> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 652807a4a4..1270174e78 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -38,20 +38,32 @@ extern vpci_register_init_t *const __end_vpci_array[];
> 
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> -    if ( !has_vpci(pdev->domain) || !pdev->vpci )
> +    struct vpci *vpci;
> +
> +    if ( !has_vpci(pdev->domain) )
>          return;
> 
> -    spin_lock(&pdev->vpci->lock);
> +    write_lock(&pdev->domain->vpci_rwlock);
> +    if ( !pdev->vpci )
> +    {
> +        write_unlock(&pdev->domain->vpci_rwlock);
> +        return;
> +    }
> +
> +    vpci = pdev->vpci;
> +    pdev->vpci = NULL;

Here we set pdev->vpci to NULL, yet there are still a few uses remaining after this in vpci_remove_device. I suspect they were missed during a s/pdev->vpci/vpci/ search and replace.

> +    write_unlock(&pdev->domain->vpci_rwlock);
> +
>      while ( !list_empty(&pdev->vpci->handlers) )

pdev->vpci dereferenced here

>      {
> -        struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> +        struct vpci_register *r = list_first_entry(&vpci->handlers,
>                                                     struct vpci_register,
>                                                     node);
> 
>          list_del(&r->node);
>          xfree(r);
>      }
> -    spin_unlock(&pdev->vpci->lock);
> +
>      if ( pdev->vpci->msix )

pdev->vpci dereferenced here

>      {
>          unsigned int i;
> @@ -61,29 +73,33 @@ void vpci_remove_device(struct pci_dev *pdev)
>              if ( pdev->vpci->msix->table[i] )

pdev->vpci dereferenced here, and two more above not shown in the diff context

>                  iounmap(pdev->vpci->msix->table[i]);

pdev->vpci dereferenced here

>      }
> -    xfree(pdev->vpci->msix);
> -    xfree(pdev->vpci->msi);
> -    xfree(pdev->vpci);
> -    pdev->vpci = NULL;
> +    xfree(vpci->msix);
> +    xfree(vpci->msi);
> +    xfree(vpci);
>  }

