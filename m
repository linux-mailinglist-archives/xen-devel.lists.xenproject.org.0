Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5D8C871B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724130.1129296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xR9-00006A-RW; Fri, 17 May 2024 13:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724130.1129296; Fri, 17 May 2024 13:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xR9-0008VU-OI; Fri, 17 May 2024 13:15:51 +0000
Received: by outflank-mailman (input) for mailman id 724130;
 Fri, 17 May 2024 13:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIA2=MU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s7xR8-0008VO-2D
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:15:50 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 925907ee-144f-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:15:48 +0200 (CEST)
Received: from CH2PR07CA0045.namprd07.prod.outlook.com (2603:10b6:610:5b::19)
 by IA0PR12MB8895.namprd12.prod.outlook.com (2603:10b6:208:491::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 13:15:43 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::7f) by CH2PR07CA0045.outlook.office365.com
 (2603:10b6:610:5b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Fri, 17 May 2024 13:15:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 13:15:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 08:15:42 -0500
Received: from [172.18.62.51] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 08:15:41 -0500
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
X-Inumbo-ID: 925907ee-144f-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJK8/fj8iiF7XhBBX/FwaN4cyGcVwWO6DzH0kPWX6qdHPvfsmPX1xIITsLyAczrdJLci4JrKwfeG5J2yGL4OLXNPp1vCgc6gjTlnBRYVo4mDsMJHZ6FwzwVBI+nUhRQrJywrIg1NJBWo82LNoZ/bFQUpSZHQZy0++jYCmOXATsUviUVv/gO8B4grJN/jfEhjSC8yhFGoJSu+rG3a2WhHdR55qW7LmYNGC+YFD9NgN8txxj/xoHm89KrXb0uYpOpOgjrzdGUNTEJUFQIMLgraCBIt/+K82+4KIABYZ00A8myQPzyaWNUkFjdDku7rrPdkuXS8q5YjAAgydrRkG0WKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TcHqf/2wKc5G2hwPJnRH1JFlS15hzlrRu4ufDXl3Gs=;
 b=HdQmliV1e/BF6uG23JYhW/cnkg61YeLkPf8ye/l365ddC+dRTx0ZawEKWdsIKJyRqoHyVha0+Nf5vQTPmFoxWCaaVrawneSc6oenHiEvtPx57PeaYGrDoakJyp/cpLqW9v/3mT+NntjdODrioJCEIkhg4VFNrSfi6ziyBiSm8Pw9b79eBtYwbp5X/mayBJzQ7oXHmN8E3fB3TiznsYm8mpHlVI83uodosipFwvTIUoE/XlhlTuJ+ztv2I/LAzsHE1jrUM6v0cp4BKiLSP5xi+aizxq6AXl11tSjXySdZf47UjpE0csQl24ZuHhAE4wpZ1pxk4KK1SThoJEVx/3Y5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TcHqf/2wKc5G2hwPJnRH1JFlS15hzlrRu4ufDXl3Gs=;
 b=bzGlLU11ifJbIVkQMGBd5pmfA7EMolHh4lTm1To0nE2yzJ6iGtCClD/wW63eem4ppy7yUSqFYBVjO+7+Eoq/AcdBRNpjjTnZ2EWfbSZSoOwdjnnnn/p70esxK9U+UMnVNiezLL0F/S7j1Gng1XRmx46MwR0ljRo5GFVqkfPznyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <48901bbd-40ed-4783-992d-9f9ec6a81a24@amd.com>
Date: Fri, 17 May 2024 09:15:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA0PR12MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 498efe6c-6220-49f4-047a-08dc767374a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|7416005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azVabXIxSm1XaVUzWGpCckptY0k3aVVNQURtdEZXQ3lXYlVpMG5pQTJIVkxW?=
 =?utf-8?B?eXBEUWV3LzNFY1hxWldZWEhGQ2dNODNyRGRHMGNYVDRnQjkxbzV4U1BiVThL?=
 =?utf-8?B?ZHJLTGhIYkgvVXBMR2RZRXBjZ1B3WlJnb1llbGNIcEZ5VVJzMlZBVk5rMUd2?=
 =?utf-8?B?S1crVStJTGJ2aGg1TWdBRjBvbzRxM0V3ZzJxem1RdDVlYVpRWi9uOXd2MUxC?=
 =?utf-8?B?bWlKRGkwSkNLVlJwZ0c2VHdvODNGQ3lGM1diUkVGUFF3bHJhUnpwYUNZb29x?=
 =?utf-8?B?b0VUM25kN0dBd0tSTUgyZE9YS3Q5OU0rc3JZa3J4aEpHdU9QOUhDSlc4NXJN?=
 =?utf-8?B?U3lrYzY1YWtJbnkrYVBTMVBZM0lsZmZaSFJBTCtCNmZseXdWcll6aVVyTWdo?=
 =?utf-8?B?MDNDdEhId2djZ2FKNUYyUHgzeGM1RTdPSWtSMUx5RDAzVFNleU5nS21mWDM4?=
 =?utf-8?B?UG5rcXhGMGIwdUYwU251QlEyWkdERFR0SXYxY25FM2VxQ0FjRUpvMWdhbUh0?=
 =?utf-8?B?enNUdW0xYmtqWFBSMDJ3NTlkN2gzVmxodU5wZ2tGaHZhMlFOS3pqaEI1elZK?=
 =?utf-8?B?d291WExmWGNNQy9sUE9iTDR1R0syVWtzTWJMMWZNRVVkb09JNEpLNlhmVmpm?=
 =?utf-8?B?dFNjQlFER0pXNE12UG5hV01DcGt4U1BRMEFsL3FUY1pEZUNRNkJlaFB4T2Jo?=
 =?utf-8?B?VXRsNFpQcExDeGhYVVkvYjlPVUNTUFdvaHE0dXB5MTM4OUFnMkt2TklCcDh2?=
 =?utf-8?B?eld0UEZCbW9CK0NqQlMrRHJCR1YyTVJuc3dCRmxqUUFaaDZ3STRMdXNwWis4?=
 =?utf-8?B?eEhpZEJ6a3dhTGdpZzNpTWtlc2ZkL01XUDNsVkZUWGdIby9xNWxVdTZtZWRz?=
 =?utf-8?B?V1Y0NVcrYllqamFGQ3V1YzVUQ1k5RGxkQ1F0SHdXdnEvcVRDWmw4cDRzcVgx?=
 =?utf-8?B?Sm9maW9pZktTRTU1Tlo3NmYzSFpYU2YwSTBERWVPc21UOWtwQ01uUVljTTNR?=
 =?utf-8?B?TWtMV2RRNVdiU1g0MzQwdlBza2lmUFZVOGg5TGIvNndlT0pWMkt6M2I3SG81?=
 =?utf-8?B?RnhSTitTWGNORkVNNHJjU1gxTUFUcStZSUR1K1lVZE1qTXZncHh1N2t1TVlG?=
 =?utf-8?B?cGZEZ2d3UENYOUVFU1JISDF1cFpHcmJSNzJYcDFDWXd5bDhPSDBEN1IyenhD?=
 =?utf-8?B?azV4K2lEaE5CM1lRZG1GZHBBTVZwRzF6VldxREhHMUhua1c0Smp5RUNYRCtW?=
 =?utf-8?B?aUk0Q1hBRTZaUFNlZS9aNnFWamxJWTJCSmhFOWplb3l2U0c2SG0vM3ZFeGtw?=
 =?utf-8?B?S3ZQK1Rhb2NmZkhqa3RsOFpBTzFkRU92bkdCcVVvbkk0SDEwTmFKd0VUeWRY?=
 =?utf-8?B?dkMzYlA3b0N5UkxDK0FwSW43V3pVd0E2NW9OSXR6RUtnOVBXMmt5UDJGQzgy?=
 =?utf-8?B?ZUhkQnAxOGQ1bzlDSnNPVWoxOEFSU1ZZdVBjSHhHMnFsNXNTWnZLU3hEZ3dJ?=
 =?utf-8?B?ZGFKM3JwRFRHOTVXaytHYjR4cWpzRlROMWxKKzRJT0pWTkJPd09CakxHTlZt?=
 =?utf-8?B?bDdTUXdDcXpxdncwQndlQzJCS25jTlFZdEtOQkVOOVliVlh3TXY3dUlOUmRr?=
 =?utf-8?B?cE1PbFBuRUdybnZVQ0k3aGlOdFV1bTEzNEJLTDBpWkdTb2k2bW05NUlRaVJ1?=
 =?utf-8?B?NXYrSGhGd1hZQ1BUb2poVnhGRkY4bERWd3JKbkEvR21oSzZhejlJR2dLcWxK?=
 =?utf-8?B?Q01QNy9FdVAxUnUvTGZRVXJ1THYvc1M4T2NqeGdYS3pRQ2VabUlnbU5oZFBH?=
 =?utf-8?B?dDQ3YStEdW1OMmtuYWVQTS9XK3JKWEc1T1NTYm5TTXJGa2pVckRqdmgyZkFK?=
 =?utf-8?Q?EyfAKHB5qVIjs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(7416005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 13:15:42.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498efe6c-6220-49f4-047a-08dc767374a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8895

On 5/17/24 04:08, Chen, Jiqian wrote:
> On 2024/5/16 21:08, Jan Beulich wrote:
>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>> @@ -67,6 +68,41 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>> +        pcidevs_lock();
>>> +        pdev = pci_get_pdev(NULL, sbdf);
>>> +        if ( !pdev )
>>> +        {
>>> +            pcidevs_unlock();
>>> +            ret = -ENODEV;
>>> +            break;
>>> +        }
>>> +
>>> +        write_lock(&pdev->domain->pci_lock);
>>> +        ret = vpci_reset_device_state(pdev);
>>> +        write_unlock(&pdev->domain->pci_lock);
>>> +        pcidevs_unlock();
>>
>> Can't this be done right after the write_lock()?
> You are right, I will move it in next version.

So that we are clear on the proposed order of calls here:

+        write_lock(&pdev->domain->pci_lock);
+        pcidevs_unlock();
+        ret = vpci_reset_device_state(pdev);
+        write_unlock(&pdev->domain->pci_lock);

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -115,6 +115,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int vpci_reset_device_state(struct pci_dev *pdev)
>>> +{
>>> +    ASSERT(pcidevs_locked());
>>
>> Is this necessary for ...
>>
>>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>> +
>>> +    vpci_deassign_device(pdev);
>>> +    return vpci_assign_device(pdev);
>>
>> ... either of these calls? Both functions do themselves only have the
>> 2nd of the asserts you add.
> I checked codes again; I will remove the two asserts here in next version.

Nit: I think it's okay to keep the
ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));


