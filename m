Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9185FB6B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 15:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684448.1064303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdACr-0006hM-AT; Thu, 22 Feb 2024 14:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684448.1064303; Thu, 22 Feb 2024 14:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdACr-0006eT-7Q; Thu, 22 Feb 2024 14:37:49 +0000
Received: by outflank-mailman (input) for mailman id 684448;
 Thu, 22 Feb 2024 14:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiTz=J7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rdACq-0006eN-1u
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 14:37:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f3068c-d18f-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 15:37:46 +0100 (CET)
Received: from SJ0PR03CA0079.namprd03.prod.outlook.com (2603:10b6:a03:331::24)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 14:37:41 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::82) by SJ0PR03CA0079.outlook.office365.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 14:37:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 14:37:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 08:37:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 08:37:38 -0600
Received: from [172.30.63.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 22 Feb 2024 08:37:37 -0600
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
X-Inumbo-ID: f0f3068c-d18f-11ee-8a55-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0PXmEDdcmKPjQ8np0+yfFpqyDkZ0J5garsEBqTk9xXn/g30UfRaE4VWqv98+tjORO35oQ/N8UPpsL1cYbUPN9xFDZBVbuiYdiHDyt0F2IO/7yplOxFi4B2pyEzYp+25jduZ6avVtnpNGDTbAoptD3OPj3rf9n38TGoQYEQgsYv/DxWhozT8GKr8V9K3ywG63Sw8rjCTu6m44w0RStnbhWYHqluen1Wf3SsGDDB/i/iaT18vEkzQeN2OeUTOdUUG6pATZMPiHkhpd7hcPJ3rqMz5KMAeWCnjBUwrxdGt/YY8/eRTWdsbF+5sb8CO9JD8iUZeQ1fklQj1jeErd1C0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL/sZFRb6nwZUYNapXnnprE+amw5XNd3uGcjchCdbqo=;
 b=IioYlcoRCLeMni+/InoQdXWfrecvdDCyv8DR22H/eSau+ILHDCHqg89taE42SJYuX9AyEVbL4+4+RyzUwNscPnQOJkMfVshoydQK+KNEHDXz2BuBQwR4x0sAEnQ9RmHcCGnTOnOC5fHBqWsyfaPZX19VlOgUMhNqDAiriD9/PTosWsPwylYyehHUed4c0erGkVYe71KF3AuMErq21YGF+BIKlozXPLYqn4c+e/e4HC4mHvV2v3+qrV96b1xVIeXBgn/Md61IgwDQZNjzYaLRRQRgN4aHZYJkC4TQnYRoBX2OB1glWTNt1BUEHehrwatWSn6h8Wv5QHPYDcFhaem1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL/sZFRb6nwZUYNapXnnprE+amw5XNd3uGcjchCdbqo=;
 b=AqNgnSCBJ23yWuIwwgraVqW+OkrVeWKQR6qWdPbkCTRJW+91FNmjiPBaMcWohAAeSBu45zS62AB2zVAX4+QEC06D4oMMGaeqiHIU/Yb9J1nnS2APJNed7d4ETrf2JfoVwHokc/eNEVzRxZ+ZhW8ozLUN8xU/F9TlI4qv1sLv3eg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a159e7ec-18b7-4898-8274-e02dc4810d54@amd.com>
Date: Thu, 22 Feb 2024 09:37:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of device
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-2-Jiqian.Chen@amd.com>
 <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
 <BL1PR12MB58493E40588F4A7BF351B596E7562@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BL1PR12MB58493E40588F4A7BF351B596E7562@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|MN2PR12MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: 18eca679-62dc-49f8-bbe5-08dc33b3d261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CsNu8k/ybg0UvVhj9PEU0rhTKXvOiK/l9MK0LWOxa2NZ0xC6/M72vPXBJy9XBpbOyjsY8xzZpiBKRipoRio+DlGBzTIcNd7dl5btSo2mijZofF810C+hMmsoCMWihWjvqmXLBVMK/5llXa6/k+DF2/+fbiKxXlM62DfBfj6EKUPNLsagidQz1tKD6shUOoyce1oDH+rsfjSmHoglKQvWbKxPL5sZsr2u/IhnGDlz3/mczUXO3Mwhu4dgMTkd83ixuZrl13fTMgJDWxfDX7IDtJlgkSQLrD2N+fZzcaJ0wDSonLDi+FH5ya9nQf5/IP9zL5U/LUBLgfEr6dch9tpg+xyPkbQectjZLh2rTmdruikw5qdLXxuMCCxi2fIB7GtiWrlpTStS95OjwYUgznygyk1OUq9X7bvrbLLtJxrZsUVsp3J/R+hESEGCb8KkD8SKCYM8n62Vo+APkqErfG5Kazk30RZiBVOj9FGLkTnIwwZhUFubUK7cC+bMVqC+P3z9UY6kIMlF40Nsmk6EocKpAz4/MjJyg3nZnVcu1EMHi+cCSu5erXZm1ggdNAnHlQUB3XjfYpT8XTMNHjjpbpkMMJIBfA6szdC3YEWKCxycHD+J8mtGAA9IkvAoCwEC9VL9S5Sn6k9FV7wx9WbmEkjARw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 14:37:39.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eca679-62dc-49f8-bbe5-08dc33b3d261
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502

On 2/22/24 01:22, Chen, Jiqian wrote:
> Hi Stewart,
> 
> On 2024/2/10 02:02, Stewart Hildebrand wrote:
>> On 1/12/24 01:13, Jiqian Chen wrote:
>>> When a device has been reset on dom0 side, the vpci on Xen
>>> side won't get notification, so the cached state in vpci is
>>> all out of date compare with the real device state.
>>> To solve that problem, add a new hypercall to clear all vpci
>>> device state. When the state of device is reset on dom0 side,
>>> dom0 can call this hypercall to notify vpci.
>>>
>>> Co-developed-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>
>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Thanks, I will add in next version.
> 
>>
>> If you send another version, the RFC tag may be dropped.
> Does only this one patch, or all patches of this series, need to drop RFC tag?

In my opinion at least patches 1, 2, and 3. If you decide to retain the
RFC tag on e.g. patches 4 and/or 5, you may want to include after the
commit description a scissors line --- followed by a brief explanation
for the RFC tag. For example:

---
RFC: discussions ongoing on the Linux side where/how to expose the gsi

>>
>> One thing to keep an eye out for below (not requesting any changes).
> Thanks for reminding me, I will always keep rebasing my code from latest staging branch before sending new version.
> 
>>
>>> ---
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index 72ef277c4f8e..c6df2c6a9561 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -107,6 +107,16 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int vpci_reset_device_state(struct pci_dev *pdev)
>>> +{
>>> +    ASSERT(pcidevs_locked());
>>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>> +
>>> +    vpci_remove_device(pdev);
>>> +    return vpci_add_handlers(pdev);
>>
>> Note that these two functions may be renamed soon by the patch at [1].
>> Whichever patch goes in later will need to be rebased to account for the
>> rename.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2024-02/msg00134.html
>>
>>> +}
>>> +
>>>  #endif /* __XEN__ */
>>>  
>>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>
> 


