Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D085A6BD222
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510636.788676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoNt-00027F-QC; Thu, 16 Mar 2023 14:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510636.788676; Thu, 16 Mar 2023 14:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoNt-00025J-NC; Thu, 16 Mar 2023 14:15:13 +0000
Received: by outflank-mailman (input) for mailman id 510636;
 Thu, 16 Mar 2023 14:15:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zev1=7I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pcoNs-00024R-VQ
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:15:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f55ffe9f-c404-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:15:10 +0100 (CET)
Received: from MW4PR04CA0118.namprd04.prod.outlook.com (2603:10b6:303:83::33)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 14:15:07 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::68) by MW4PR04CA0118.outlook.office365.com
 (2603:10b6:303:83::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Thu, 16 Mar 2023 14:15:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.18 via Frontend Transport; Thu, 16 Mar 2023 14:15:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 09:15:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 07:15:03 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 16 Mar 2023 09:15:02 -0500
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
X-Inumbo-ID: f55ffe9f-c404-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQddhhMWANwWneBOdVj3tP32duTUyyvfMS+BLNzb/mxu1tq5CerG/4YOx/pH9dZuyVfI2DjWDKF0C+0gClX6UqioPHsaT7xCA0QapTZOTO3eof2PH4CnQAtpzeebgEyNNGOHJpVcQ3ZjjRLW1nfkueyYh7cSOR2J1g61IVMhS9gnWS5InFrxdsyuyZlsvyqrcQaHQavGigABGfSmpJ0G/vsApYtQqmSYLiJGD3ASodJFhnNHeS7vMK+YlF9uwgQNHbJhj+KAwUyAnomWFykb4Th8aEljFcjQy9lSAWxcaCvyFgjh+zSQq6CwbPLN1EC25rGJw4RqZei4l/9ugoHdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9LYNhky0ZalROPfhA/Bob2ZCWbNaeuhw3jQBlclqL8=;
 b=LJhhXzxrf1TK7unkMB/YGMRIDBRl1aaNKkeXszAd0lIz5qWjLRyYe1gYIakDvWx7+HoAMUyRp3aRyVz9HDSujYDkVF7P6/Wbe1MprqGvpAQ5X2oHYx88pwLiv7yWQVoGGbLL1c9Xpz0JzKJCwkZiUdyAsQyUqljWzjejtDRwLO5XMYWwzRkwD4Dbw7VfgnU4fqRTYx18TXfQ4e7pTABNcOlWN72qRZZAQ07WUSEDS6SlH20TcrU1h3tnD5r1crElG+IbzTipPxGazSIEdYoT1ZHWd0zE9iIdGP5B1VTnspykyygZYtGFvTh6jPKWc40gweCnzSg4xdImiludLlXPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9LYNhky0ZalROPfhA/Bob2ZCWbNaeuhw3jQBlclqL8=;
 b=zv61kRB4y3GPlqjBEh1kLAw5jKywBYoJrvlu5jjYIVukSCbFPAfdv6p98LWDqASHe6tSjzjMbt6MhhSnYNI0qB63WW2lA92QuKfqcrF+Rc+SlUknVjopBuPCs5bJUZOd5jJwcrsghE1E/xB5yTK2p8+rGOt5vPKbTOdbVJkQLxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2cfc0751-4360-5899-c93a-56ef952a6b2b@amd.com>
Date: Thu, 16 Mar 2023 15:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230316102635.6497-1-michal.orzel@amd.com>
 <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT067:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b086b14-5d9f-4bbe-f912-08db2628d7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZfCvreO9ZJbXM3De0S2LIvy7WohFt4cmyq9MGypgDwPEqNWS6dKc26EEJoYpEFYq2gLXifBs7FxWycYNoJlN70JcupAdkAazFWZx3BVKe242oI2JiVCLZhLZbZQxRic+gsy63prEl867zL/c+nR37f7iuSI6Z910kNuq3mIQ1pKTH3mToX9gLFan0iPBD2qStKJDT81tWop9SQIEV3lfcwqAzV/yNIOI4FXoOcDMddbiPcgssexKmVoHGv0GIU1J+92wvePY2HGlvkv5xwoGZgxxrJKQuH/MAePgsTA3FmP6Ps328opAbkyJnXakkhIzZyjnxDsP+PTtQX/J68ZaTDUUxngcd6GuCkCtlFdOZCrAbN5J53RuKXr0KbkVJIzOyA6YPa2TTuKgDHp/YXeXPFxYuxYQYpNV5fjn4JDGuaHK/SaCbh+eNLJf+FB2lHG3Tq9UdlszoPX5SPwjKZ445czVMw3I82/sfpQaT2J9LLA/HTjlRfHHKXstRea3nMqQrGjFSWFzm7/6OYa+QE7pN1ULXdGzeZSY+S4WtLjXCs11j+2bEK/z+hSk1zwk2OmMMlg7+SQIjve5niZaAbWFnHhjbkczcDW/2nOjijMfOSNqnJk3QYGb8qLQ7bEoqU+DPpxAePaiV1gaeTW8jZ901bCEwZ2hJr7Y5tDMY8UucV8FVpaAAoGLwH/aTm9UHT14jCJfmpcX91XyR7NL2W3TUEAxQ1cuFa9wQZ22aWQdQWCXLFPymas5MeNQc0+fKLBLmTyI42vF7W3H4YCeMcIV6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(356005)(86362001)(36860700001)(31696002)(81166007)(36756003)(44832011)(82740400003)(2906002)(41300700001)(8936002)(5660300002)(40480700001)(82310400005)(4326008)(2616005)(26005)(186003)(53546011)(83380400001)(47076005)(54906003)(16576012)(316002)(336012)(426003)(8676002)(6916009)(70586007)(478600001)(70206006)(40460700003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:15:06.3660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b086b14-5d9f-4bbe-f912-08db2628d7f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906



On 16/03/2023 12:11, Jan Beulich wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 16.03.2023 11:26, Michal Orzel wrote:
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>>      }
>>      else
>>      {
>> -        console_rx++;
>> +        unsigned int next_rx = console_rx + 1;
>> +
>> +        /* Skip switching serial input to non existing domains */
>> +        while ( next_rx < max_init_domid + 1 )
>> +        {
>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>> +
>> +            if ( d )
>> +            {
>> +                rcu_unlock_domain(d);
>> +                break;
>> +            }
>> +
>> +            next_rx++;
>> +        }
>> +
>> +        console_rx = next_rx;
>> +
>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>      }
> 
> While at the first glance (when you sent it in reply to v1) it looked okay,
> I'm afraid it really isn't: Please consider what happens when the last of
> the DomU-s doesn't exist anymore. (You don't really check whether it still
> exists, because the range check comes ahead of the existence one.) In that
> case you want to move from second-to-last to Xen. I expect the entire
> if/else construct wants to be inside the loop.
I did this deliberately because I do not think the situation you describe is possible
(i.e. no domains at all - Xen still usable). With hardware domain in place, we can e.g. destroy the domain
which would invoke domain_kill() -> domain_destroy() that would free domain struct.
Without hwdom, the domain cannot kill/destroy itself. It can do the shutdown but it will not
destroy it (at least this is what I tested). So I do not think there can be a scenario where
there is not a single domain while Xen running and be usable.

~Michal

