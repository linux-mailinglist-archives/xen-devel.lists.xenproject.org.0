Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275429C5F4C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 18:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834875.1250674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAutE-0007tQ-Bm; Tue, 12 Nov 2024 17:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834875.1250674; Tue, 12 Nov 2024 17:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAutE-0007rR-9A; Tue, 12 Nov 2024 17:41:20 +0000
Received: by outflank-mailman (input) for mailman id 834875;
 Tue, 12 Nov 2024 17:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0y=SH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAutC-0007rL-OS
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 17:41:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4edb7c7c-a11d-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 18:41:15 +0100 (CET)
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 17:41:08 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::b4) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 17:41:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 17:41:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 11:41:06 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 11:41:05 -0600
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
X-Inumbo-ID: 4edb7c7c-a11d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjFkIiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjRlZGI3YzdjLWExMWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDMzMjc1LjE2MTQxNSwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NddPkhpq3xAIcLREO44zdM46nHoKzQdAleidL7jTO/AORscc+2F5iw92YQwZKjJq3tE6WLFi492mGxpMdU6WdkD9137xGDyhR8wdfRQOhrCCDhVIH7yYZvfgYIIJWwkE0fS1IxAKaXTqYOIlVWQ36wtTdXUNFobwrneXz4b8T/J0AF0v/Z10liQ3r+dpU6oj9bs/8X6UbefdgHkF55CKuvEt7bhFh7ClqPStObCFzdlif+btETUi8ofsC3J7oYgScrLqxZOd7HwFnaoB2hoestGLHe7DaA70WHDqSbnAL01RwGBJhqKqfDcbwgdS09cVZxh1/EX9ieH5gN8cZ5GJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJQvci0kCIKXPwYB4n0Chs115xklp9BM0XmPSlGqaZE=;
 b=FMJjSQ900OnjvdXbk5EdkZ9T2e0qaUM1qP0uKP4jNnmPOjqEWtBA2fj2mit/OYjgMezCi4DHjArAa7VhfOetAjmXr6fhSJFjdtjtbp/XnlLn/sa2DH0ddhqY9mSTHj/YsOKLfsoZdYi8zgxncuJVAxl9zb5d4P41/LKg/dtqF8zmnOipck09maYNKUwz9ivXISgCAgmrSwl9TRslq6+5MX0U+OTjJ+njLiWyUas7fD2CJBQf2Qc7EgGpgGyIU0Boh0uweIsBEVoLjCxz4fn0KxTLqUNU8FjzHCMSwlXzYXxKF+huxd5C3rwnybpfmw1y7eMzKlcel5AEMZSzYO0t6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJQvci0kCIKXPwYB4n0Chs115xklp9BM0XmPSlGqaZE=;
 b=tqOgTY1k3+pryUuNqVCm7lermyE4be63pWfjRBtbPRRHaYIkWvN2UeAIC9X5C464NY6NnRSmE9FPy41c+t6Kb/RN8626E+HJ2Zpb1FewiIiD5DF7ViX5ab0kuqVOgsbK1Ebk0aptPsvQZhTjMN8ywm79wfpmH80NdaoHV1muRr8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <94b6224c-c285-4d4b-9b66-117125211438@amd.com>
Date: Tue, 12 Nov 2024 12:41:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <Zx_a57npsdRhLgYr@macbook> <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
 <ZzMZpg3FCyc4SW4z@macbook> <f8bedb2a-1d32-4e99-885a-79a56c1bdd36@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f8bedb2a-1d32-4e99-885a-79a56c1bdd36@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|MW6PR12MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: f570544f-184a-40b1-80a1-08dd034130c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFJndkl3UCtGbnZEcjNlajdXd3dIM0dXYkw4TU50cTRHamNHSk5DS0FTUmlj?=
 =?utf-8?B?dnRicktSZmJPZm1jRmM2aTduUFBZb2xkR2FMeGcwekU5UWdSRFZuMEh4VHp4?=
 =?utf-8?B?RmVRaXQxU0lpSWNJVXNQMUM4QzB3TXFYNWZpdXJ6SGw1c3dWVU1qK1B1MG5n?=
 =?utf-8?B?QjIvelNaKzdaQUJKN3YzVkRiYUh5aFkwMXFHYWFYVy9JaDdROWcwQS9QSURv?=
 =?utf-8?B?WFFGSjltVTNJaStJQ3ROaVNYS1pqRVNjZG05dFkzQ0pqVDRhOG95ZDZvckgx?=
 =?utf-8?B?S3plcXBHSFlQbzZJeUduQjVESU94cFl5dmZEVm5MYjJXSDhES0FDcWpOT1dS?=
 =?utf-8?B?bnJGMDNhK3IvL3ZSN05iKzhtdDBQQlBWQm1uSi9PY1VTa0dnbGlMWVU3NTg3?=
 =?utf-8?B?VnhLdGZWYzZKbWpyNytiQU9PN1BWbi9wK0tTN2ptTXVkbXpOVjU5YTRuVDh0?=
 =?utf-8?B?VTZicVBJOFMwVVBQaU5SY2lIaFk3a1FVNktoZEhaTEVFTURobnNidXp5c2Np?=
 =?utf-8?B?VlV5Y2lyWTBMK3RYSVNkbzJlVGc1MnNUeDZSbVhuemxyYzRWTXpNc3lNbUpO?=
 =?utf-8?B?Yi8yblAzUlFIYmxvc2I3Q0ljdlJaV0pvN2dxZ0FPSENOajRsOTArUkcyaEli?=
 =?utf-8?B?Uy8raUZEZTQyNlpaVlJDL05TT2FSRmJPNmR2RXk2RkJWNTNVdkVZQzFERk9U?=
 =?utf-8?B?TzVQVEFoakk5SjNuRkVlaFMrZFk0bXpNbk4wcHByUDRVZzVNSVk3T3FJb0tR?=
 =?utf-8?B?UHZmUWltVUN4NUhrZndOTXhMcCt3UUtlTGpYcVhCNGVacnhER1Q4YXVvZE5U?=
 =?utf-8?B?YTQxWkF4TU5WTGd6bnRGR0IyTmY4U3BBdGxCcWZDU2lBOUVoTFBESWZKVnNN?=
 =?utf-8?B?Yk90ZkxhakRlYUowV04xTC9TR1prZjB4Umc5Q2hYWHJoSkpCNVVlOE1ocVpY?=
 =?utf-8?B?MHlBNU5pd2tqTVJjdFplUlcrU1lKeGtBeVU2TlgzL014TStYSzAxb0hBSStJ?=
 =?utf-8?B?ZUJxM2lRU0FxbFRlMjFxSzVoem5lNFV2SUdlVy9PeVFLTTlWdUtidnFhUnNp?=
 =?utf-8?B?UVRmT1FQSDR1eXZpMHZ4Q1MvenZKcG1pcks5L2xVSmh0djY0UlFNSHJySXFS?=
 =?utf-8?B?OW90cml2T1VEZXp2azR3MDZJUHM5UFVRNjdkTXZkdXZYL3J2MHYySUgrdEVE?=
 =?utf-8?B?Zi80MkowLzMxRDhsYTIwalp4ci9ucEkrYnhkWEpTQ3pQR3NkRHpXNUJkRmhj?=
 =?utf-8?B?VlgwTWZVZ0dRemNqME1oV2xoY1R0aDZRNnA2cUtyYkdQZ01ncjJGSUNIUXNU?=
 =?utf-8?B?TVlHUDIrNkhBV0Jrb2VxUUdxNTJUR294dkVSZU5KTGhQUHNLK3AwV21Gcnl2?=
 =?utf-8?B?VkgyQVdWTHd4bmhQSmVET1ZZbld2YmJ0TzY5cmdZdnA1YitMWGVMT2ptcWk4?=
 =?utf-8?B?SEFTYlUzaTJrTXIzRExTMkdpcGgyaGpJbmMzQkxzOGhtRGRIRVlkQ3VnTldG?=
 =?utf-8?B?eHdaSVBGYVBLeU9FQmVOMW1wSWllTWRCQTIyVHRNMHB6cnVVL05nejVlc0pF?=
 =?utf-8?B?MHk2UWdTaUw0Q08zNVNWSFArb0JCa3d2dVpCcjMwdjRxK2g4QlR0NDFJejYw?=
 =?utf-8?B?V2czQXpBMnhEQ1RPUjdLejA1M0RwNGtVUnRwMGF6TkcybUFmem9ObE5WRXZD?=
 =?utf-8?B?Q1RHRmtFM2JVWnZ5SDFCQm94bGlZUjBMbVJWSU83STFjWUJLeTM5bjQ0YnFz?=
 =?utf-8?B?dEZLVWhDcHBQUFNrR3A1ajNtOFpjNzlCalJpYmV2VVFrNHdMcEVxdFdtdzdi?=
 =?utf-8?B?ZWUyMHVRakpVdmp4aG54dGR3eXhEQUpyVyttU2l1ZERUb1lqSXlPMTdUYWNv?=
 =?utf-8?B?R3N3NmQ4eVZRUFZyUElrOGVBd3NWVjBlSHR2dmV2SE8zcUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:41:07.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f570544f-184a-40b1-80a1-08dd034130c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708

On 11/12/24 04:39, Jan Beulich wrote:
> On 12.11.2024 10:02, Roger Pau Monné wrote:
>> On Mon, Nov 11, 2024 at 03:07:28PM -0500, Stewart Hildebrand wrote:
>>> On 10/28/24 14:41, Roger Pau Monné wrote:
>>>> if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
>>>> {
>>>>     struct pci_dev *vf_pdev;
>>>>
>>>>     while ( (vf_pdev = list_first_entry_or_null(&pdev->vf_list,
>>>>                                                 struct pci_dev,
>>>> 						vf_list)) != NULL )
>>>>     {
>>>>         list_del(&vf_pdev->vf_list);
>>>>         vf_pdev->virtfn.pf_pdev = NULL;
>>>>         vf_pdev->broken = true;
>>>>     }
>>>>
>>>>     printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
>>>>            &pdev->sbdf);
>>>> }
>>>
>>> Yeah. Given that the consensus is leaning toward keeping the PF and
>>> returning an error, here's my suggestion:
>>>
>>>     if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
>>>     {
>>>         struct pci_dev *vf_pdev;
>>>
>>>         list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
>>>             vf_pdev->broken = true;
>>>
>>>         pdev->broken = true;
>>
>> Do you need to mark the devices as broken?  My expectation would be
>> that returning -EBUSY here should prevent the device from being
>> removed, and hence there would be no breakage, just failure to fulfill
>> the (possible) hot-unplug request.
> 
> That very much depends on Dom0 kernels then actually respecting the error,
> and not considering the underlying hypercall a mere notification.

All dom0 Linux does is print a warning:

# echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
# echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
[   56.738750]  0000:01:00.0: driver left SR-IOV enabled after remove
(XEN) Attempted to remove PCI SR-IOV PF 0000:01:00.0 with VFs still present
[   56.749904] pci 0000:01:00.0: Failed to delete - passthrough or MSI/MSI-X might fail!
# echo $?
0

Subsequently, lspci reveals no entry for 0000:01:00.0. I think it's
appropriate to mark them broken.

