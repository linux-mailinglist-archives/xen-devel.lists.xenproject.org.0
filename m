Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3A8220B1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 18:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660816.1030437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKj2G-00076W-1N; Tue, 02 Jan 2024 17:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660816.1030437; Tue, 02 Jan 2024 17:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKj2F-00073o-U3; Tue, 02 Jan 2024 17:58:39 +0000
Received: by outflank-mailman (input) for mailman id 660816;
 Tue, 02 Jan 2024 17:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNM8=IM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rKj2E-00073Y-2l
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 17:58:38 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be686e8-a998-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 18:58:35 +0100 (CET)
Received: from BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Tue, 2 Jan
 2024 17:58:31 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::b3) by BLAPR03CA0022.outlook.office365.com
 (2603:10b6:208:32b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21 via Frontend
 Transport; Tue, 2 Jan 2024 17:58:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Tue, 2 Jan 2024 17:58:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 11:58:31 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 2 Jan 2024 11:58:30 -0600
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
X-Inumbo-ID: 8be686e8-a998-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fkh9oD5H99+VapfSFPn61xitZ9A+ChQ5SiXqieTnLcUwUK3eCEYbIKxpF287Ps1JOwme/qxDfJJfS8v3lfG6p3cbRmYAknA/toqmmrDnfPB+5AY3XTthkG0STOd0oHBG9we6ihYZfCJbHidJ/vCyM0XIH3FsIAu7lEo506K5BfcGF9LCCgQNoM8AmKcBORph8dY60SqPj3b/pqg7VYOk8vKZjUMy7wTmPoOD6HoXW1DxqsIf0dHdKl6eQq/yyiOmIC+p+gym8EpYtYvQ2ALG43lYuGo8fcZRKomDKchumFNOXn4GIN2d5tF95qYI6/QhkLxBzxewCqFD5UK/Q55z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmlAGsq62p60bgTa2od48s76HuFm7BEBMLogG5n7PUE=;
 b=fq+kE1C5dTs47kLrf4bJQaikLra5j3NrF0RLXXLx4qxc2wbApZ3fdjVmkV4TQm8lSI6hoHCN+Te66He3slWCa86owGFmmLDIE2s1ffSiJYk5vf/J/l1tf0tFaE85+jZ6iJOdVzgcICno3m25WfY4uLzMjjI3I5Gpm8QR7y9yxmN2lEO6FbnCdpqoLma0tE/oCnXJEzCRYLoo7AJ3SAD+mDNaetiXJNB22AUh1aRWF1jsIYW2fEQS1VM5AOPk4wH29MM3oxYlsM70DVGIxCqOD0SdPdW+yOdsdvZ1191k21jat1AYacXL+uEvQQcND6e+0zs0G3/9z6KvlHngD1whVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmlAGsq62p60bgTa2od48s76HuFm7BEBMLogG5n7PUE=;
 b=pMWRPBdEOhJcwwSu4+XLghHcg3ZbBd6TgThmxhs2nYa23JyTH/wNCsTPrybQdPmOK3OKjf+fUXtgI0So+XoYRRz9pzGKdKE07IklctZzVci3rvargKjT3l4QMWdBuI8G9V1JLTY02e2d4dKv0ozGZcLGYLsJGNKHCBWxVCsE90Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f6592a39-539f-4a4f-ad3f-9d84393fdc53@amd.com>
Date: Tue, 2 Jan 2024 12:58:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/17] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
 <c8e09053-53ae-47e0-a3a5-c9c6b58762d7@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c8e09053-53ae-47e0-a3a5-c9c6b58762d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: ec382809-c645-4433-e30b-08dc0bbc6e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6bz8uUDkO8fKVe3hQODXIM7j+tNkD9jqUYLsCZmx16IUBK0bS6vpj2BsTcq34pORwRbY3DmXNgsiFlvW1A0NqEh78E31mt0Lw9y0rl0bbo4vlfF3jH8MjiWcaXxn2I3qmLYlJVfXtJ9Y1L7SXBQcc54Bm7QfPnySJQHMeeHZ/JBYAYxsOYZPdwHJsXah8D1lmKAtdxrcaiHr7h0zXUXG0h/Hw3hhUfJ6O/nXH7sdJ4y2NIBooryAKlKhn7ceG2/kI8gosCqoE5O1VXYI0CBQSbxxqzgKHKqd9K+bMoB4bTcG6wmi7fggaqtTgrbNTZ9XVoB5Se5pR/kpABQTZnpXcSCMnIW6mpZXQtqhAX2vxP25FQ7QEYoZpvjbVEERoO36QkrEBwS+R+qd7bE5ONCuyE6xd9+JL/MKBxdGvwvJgbaxnHQIxLsbBgaVxgxMEAr9oC+gynB/ut7aYGwP/p5gv3IWmJxjwSFhppPa1VykliwQh/8TfFnboV2WT8oWhXBvhmAMWaecS/Mk7DP/oxeoEK3yDVObfuWGeeEpVlHInL9goto9hVJTH9wMw/PwKqrBCgYIRgo5gUqoIPI2dqAwITNWhbveds8efXFcV0BUzo5Mj0tmzhTRt5vRvvLKDjqESbwLq8ji0FWiEFUZZ5ptecCXKQqyJDk9A+3Q1nsUOu7q5DJT/r/0FxEv6TcPQWmh/xMkTCVDXZIxM3Qml2JCWFoFK/lGCzX1X/neytN3JegSTLZYrdGpHqZvODlU9cEXaDu5/oy5+j5jk7nNpuxBzo2Lj6tCAKIcpeQGrms79FoBOhAM35+5+liC1FK2y8HP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(40470700004)(31686004)(40480700001)(40460700003)(2616005)(336012)(426003)(26005)(83380400001)(31696002)(86362001)(36756003)(356005)(81166007)(82740400003)(47076005)(44832011)(4326008)(4744005)(53546011)(16576012)(36860700001)(8676002)(5660300002)(8936002)(478600001)(70206006)(54906003)(70586007)(316002)(110136005)(41300700001)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 17:58:31.5979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec382809-c645-4433-e30b-08dc0bbc6e8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

On 12/22/23 03:52, Jan Beulich wrote:
> On 02.12.2023 02:27, Volodymyr Babchuk wrote:
>> @@ -886,6 +890,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>>  
>>      pdev->fault.count = 0;
>>  
>> +    write_lock(&target->pci_lock);
>> +    ret = vpci_assign_device(pdev);
>> +    write_unlock(&target->pci_lock);
>> +
>>   out:
>>      if ( ret )
>>          printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
> 
> Considering the function we're in, I think this "assign" deserves a comment.

OK, we will add a comment along the lines of:

    /* Re-assign back to hardware_domain */

> It's necessary for hwdom only aiui, i.e. particularly not for the more
> typical case of putting the device in quarantine?

Right, since dom_io doesn't have vPCI

> 
> Jan

