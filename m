Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CC7971A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 13:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597258.931478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCvW-0003QS-Dj; Thu, 07 Sep 2023 11:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597258.931478; Thu, 07 Sep 2023 11:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeCvW-0003NP-A4; Thu, 07 Sep 2023 11:11:58 +0000
Received: by outflank-mailman (input) for mailman id 597258;
 Thu, 07 Sep 2023 11:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wybS=EX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qeCvU-0003Lz-57
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 11:11:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d30e38-4d6f-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 13:11:54 +0200 (CEST)
Received: from DB9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:10:1db::15)
 by PAVPR08MB9649.eurprd08.prod.outlook.com (2603:10a6:102:310::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 11:11:46 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::b) by DB9PR06CA0010.outlook.office365.com
 (2603:10a6:10:1db::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 11:11:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.28 via Frontend Transport; Thu, 7 Sep 2023 11:11:45 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Thu, 07 Sep 2023 11:11:45 +0000
Received: from 8e53678fc7ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7DF6B0D4-8585-4483-8920-5F0E44D46339.1; 
 Thu, 07 Sep 2023 10:58:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e53678fc7ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Sep 2023 10:58:14 +0000
Received: from AS9PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:20b:48b::21)
 by AS8PR08MB9908.eurprd08.prod.outlook.com (2603:10a6:20b:562::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 10:58:12 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::48) by AS9PR04CA0065.outlook.office365.com
 (2603:10a6:20b:48b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 10:58:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.28 via Frontend Transport; Thu, 7 Sep 2023 10:58:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Sep
 2023 10:58:11 +0000
Received: from [10.169.172.124] (10.169.172.124) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 7 Sep 2023 10:58:08 +0000
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
X-Inumbo-ID: 59d30e38-4d6f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quVZIBdY3RnDPt7QOYWkqWL0LxCm33uagpqxmDEDA7M=;
 b=gb+RsD52UdpBZMrgbL4B37chfcL59zZqwB9rfeZcwU7iy+ozedj4+1i5sat3BXMziPhzfxaNbYLDJGN03/elD2WwYFD9qu9tcCjm/DKQ+vTOZk4Jg3aPzFHHqJRR2jw+upWFDVoezpv22rwz5zbJ+PD6MqQNxRzKAU97WX+BQJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78121f80669a019d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjQ8w7Zu/2w/iZmusc7uuBz0zgw3GvmZu9T9IWh62VxxGS3kqfYjfJzuDipQ3C44z1fuKhVlX6NJARGSAUxM3bmry9gkkWd1COuboPyzdsSP7yX6lYs0A0WwWLZY+YvERiAetvPxOBkC+r2E/dSBW22AiNybmB/d9DPCbWyegd9FkEFuUAKaIl5zjJoUKbLXEuKGsK7ZEnjx1P8gkDAANHGcOjw6QlPkkJ5Ib7HJGalVR/f87Xj7LjlimOfEs+yFzWWR5bK1KT0Pj0hdT8DS0i7a9tJ7ZWJH/ZQc6hfxUcRPzGYRE0WO7PRbElmfRtK/uyd8E5PLIIP3s+TKlc2rvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quVZIBdY3RnDPt7QOYWkqWL0LxCm33uagpqxmDEDA7M=;
 b=lGo3UdCLD50194x6taZOjI4Qd259PlQVeWuWXXC+F6Ybrz0JKOtac6ZSOqzr27InVnA2gg24e4K+R/6H9ayXQPZyXkmXIIFikZFjtANMJWRlL31BIBA7hXeGiDIWzXarbt0SRdrVOHJ/akXTaBiBCE7q8ipJW5fwZV8qQXvcVDezMwRN574LyGa+Fa5a0dP8xkJM8WhLSh5HSimwPBF3b5GAol35H4JfAtkLnHANwKJAII9pFFWN2jyMOuHbhY2qx7xrmFWsxk4dLIAcX22YzH7BsTU0+OOO/QGV7Rm72PQN08d9iXPKi0ng67NM66AE29mDeLc/kLHYuGxWvTLiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quVZIBdY3RnDPt7QOYWkqWL0LxCm33uagpqxmDEDA7M=;
 b=gb+RsD52UdpBZMrgbL4B37chfcL59zZqwB9rfeZcwU7iy+ozedj4+1i5sat3BXMziPhzfxaNbYLDJGN03/elD2WwYFD9qu9tcCjm/DKQ+vTOZk4Jg3aPzFHHqJRR2jw+upWFDVoezpv22rwz5zbJ+PD6MqQNxRzKAU97WX+BQJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <5767f02d-1236-dba1-12f4-6194cd0ed7ca@arm.com>
Date: Thu, 7 Sep 2023 18:58:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v6 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
To: Ayan Kumar Halder <ayankuma@amd.com>, Henry Wang <Henry.Wang@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-2-Henry.Wang@arm.com>
 <b86047a6-f394-8dc0-a4ee-87543d6f9204@amd.com>
Content-Language: en-US
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <b86047a6-f394-8dc0-a4ee-87543d6f9204@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT023:EE_|AS8PR08MB9908:EE_|DBAEUR03FT052:EE_|PAVPR08MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 199d1be6-e216-4c12-b119-08dbaf933930
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YGiGjSMJVd71xmTiYZIIFfKEjNgfT1aQxqvFKr+9SwrmDSWJEWgkG8ig/pbrNPAN/73hN9/JTlDorrDGmQaq8Cpz4z/5JnOps+4GsotgBD0TH+SHzPsuqkLldgz3weWPNb5gsUwEvkNhoJOCEByOmEfSoLgMfUZqQvokzJ07WoRAsjKH8BKLHo/Rrnd3tNZIB/7NVRqgtMf6nos3uxjhiZbnFUJ42ALqryUaPO2sjEpSWCp0rqVGfsG3pCV6EB6tLCgkcFqC7IOZa9k/RbfDrVVDorIBopqfKM6aTLsGxRVNhivksqxQNBy896LHqkxbOPLlbTqr0PA0ef9TxcfrMfVX/6h0FGd2MMYVJNpg8dRfhVMezOq9gC6H70RTN0BiJyF7VcOq0DBRpx9wG1cUFUCiaUIv7WHiN/oQIo6LBoRx3lIK3BvpJIuTAAU/vQD6tiqhQm71lnsq8ArlhnNblxh/YKhXhQIIpuGDf/rw+A0AbtXrJYDA927hd4GJX4lqceEXVDyE7HWKipREaF42H5KL/S9oOeX3f/6m4RP5OTrCq9iFoj1llvpe6rdWUewFWjXMzEPCeMHJ8P+Q+onPuLCd8svNebOj4MMzB8l9qlurcgtnY1ZEGfriVdOv2wtHw3WApGd+ZBFZHREwrDNu+qrY4w2+0oKcpX1Dpq2huFU/mfPz/uPrvQSj41TEG6yDPFTKxrhNTB+xNlauQMwKGEmSlvJVQuY4i4jGNAkEXzmRRMUroY4LUlBneWw3SrFzblhCSd/gHEc2LlyKzZpWwuxHEQcptQTJand5Gd99dmBXjMukRbDemyyDOewn9sCTwZliDVziJuymyIhXlyHYsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(31696002)(53546011)(2616005)(426003)(26005)(336012)(6666004)(478600001)(36756003)(36860700001)(86362001)(83380400001)(356005)(82740400003)(47076005)(40480700001)(81166007)(41300700001)(31686004)(5660300002)(8936002)(8676002)(70586007)(110136005)(16576012)(316002)(54906003)(70206006)(4326008)(44832011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9908
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e8a0d1c-91d1-4dee-1f99-08dbaf91541f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2yje4SBOht27fQBCi7LWk+KX0Nj9xFYuf1mG63v8BLeZPDJ47t9cejYbqs/RNaUM/bkCURXbtkqHT/0Y3eOFKkzfExpJntWWcTg7RA05kx4mr2WVnkAgpqdaWCc89ePyalzhUjhTiMw59zkswUl0pRvQF7kJCBI8ADk8Eig7bir6UIxsesKSb+P0kgJ6dUBrU578chLKCgF+rDz846y77IyHTMJJNBSIQvgnMmCu+yVrFrdIKqoidWYIBwlfJazN7al1YEJ9R7xVZ5CBkAc33uADVNePTmiWctJS+F3is5mrCxuAPvAnxN2ez2cCmtJ5jsxt2xtJI1wgPjrWrC0YAQvjKQRbb4mfsAg1m1lCb6ZOYfA23uZhIn8NviFZphnLYLpTzro63gz82dd/Aq3ozSzjDJwl9yrxDoEZld12ZBDqzhiKgKanJ0b+oxTGm7pdDm4pSyWjh2a8H3a7MJaB94yuR5zrA8A3+bedq1LuuL0rw+GzkdxG+Je8KhEjpCD/dKKfttXu7+L80UCTTAHw9rN0O9cdhX81TTUdwhbv2ZWXrj1W3jyDQdBAymhdyL7iUa1kEkZqZ12QIsRx6UpU9GDNF14FslhfBiBxNLGQpuGSPut0g2bMVW0F3e913YFqqSQ44SdtPQRMsX7RmWpHSIfohvYrydKTTsbTY61Ozk7d912snnLsN72lcBsHWnO5ODfnAteXYHnfjoXBH/EDwANZfuoe7wf0lHy2TgvY1mnU7ulJBC5g2VfxphobEpcJ0YasBYTGoztt4hRQKfJD28fLqK7YQrTko9RBesJEg7EeiDl6wVyhksDE0TYMmtG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(81166007)(31686004)(53546011)(6666004)(82740400003)(40460700003)(86362001)(31696002)(36756003)(36860700001)(40480700001)(47076005)(2616005)(26005)(426003)(336012)(83380400001)(478600001)(107886003)(110136005)(70206006)(8676002)(8936002)(5660300002)(4326008)(44832011)(2906002)(16576012)(54906003)(316002)(41300700001)(70586007)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 11:11:45.7602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199d1be6-e216-4c12-b119-08dbaf933930
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9649

Hi Ayan

On 2023/9/7 17:44, Ayan Kumar Halder wrote:
> Hi Henry,
> 
> On 28/08/2023 02:32, Henry Wang wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> From: Wei Chen <wei.chen@arm.com>
>>
>> At the moment, on MMU system, enable_mmu() will return to an
>> address in the 1:1 mapping, then each path is responsible to
>> switch to virtual runtime mapping. Then remove_identity_mapping()
>> is called on the boot CPU to remove all 1:1 mapping.
>>
>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>> and we also avoid creating empty function for Non-MMU system, trying
>> to keep only one codeflow in arm64/head.S, we move path switch and
>> remove_identity_mapping() in enable_mmu() on MMU system.
>>
>> As the remove_identity_mapping should only be called for the boot
>> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
>> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> ---
>> v6:
>> - Add Julien's Reviewed-by tag.
>> v5:
>> - Add missing "()" in title.
>> - Use more generic comment in enable_{boot,secondary}_cpu_mm() to
>>    mention function will return to the vaddr requested by the caller.
>> - Move 'mov lr, x5' closer to 'b remove_identity_mapping'.
>> - Drop the 'b fail' for unreachable code in enable_boot_cpu_mm().
>> v4:
>> - Clarify remove_identity_mapping() is called on boot CPU and keep
>>    the function/proc format consistent in commit msg.
>> - Drop inaccurate (due to the refactor) in-code comment.
>> - Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
>> - Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
>> - Call "fail" for unreachable code.
>> v3:
>> - new patch
>> ---
>>   xen/arch/arm/arm64/head.S | 83 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 64 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 5029013a14..f25a41d36c 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -325,21 +325,11 @@ real_start_efi:
>>
>>           bl    check_cpu_mode
>>           bl    cpu_init
>> -        bl    create_page_tables
>> -        load_paddr x0, boot_pgtable
>> -        bl    enable_mmu
>>
>> -        /* We are still in the 1:1 mapping. Jump to the runtime 
>> Virtual Address. */
>> -        ldr   x0, =primary_switched
>> -        br    x0
>> +        ldr   lr, =primary_switched
>> +        b     enable_boot_cpu_mm
>> +
>>   primary_switched:
>> -        /*
>> -         * The 1:1 map may clash with other parts of the Xen virtual 
>> memory
>> -         * layout. As it is not used anymore, remove it completely to
>> -         * avoid having to worry about replacing existing mapping
>> -         * afterwards.
>> -         */
>> -        bl    remove_identity_mapping
>>           bl    setup_fixmap
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>> @@ -384,13 +374,10 @@ GLOBAL(init_secondary)
>>   #endif
>>           bl    check_cpu_mode
>>           bl    cpu_init
>> -        load_paddr x0, init_ttbr
>> -        ldr   x0, [x0]
>> -        bl    enable_mmu
>>
>> -        /* We are still in the 1:1 mapping. Jump to the runtime 
>> Virtual Address. */
>> -        ldr   x0, =secondary_switched
>> -        br    x0
>> +        ldr   lr, =secondary_switched
>> +        b     enable_secondary_cpu_mm
>> +
>>   secondary_switched:
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>> @@ -748,6 +735,64 @@ enable_mmu:
>>           ret
>>   ENDPROC(enable_mmu)
>>
>> +/*
>> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
>> + * The function will return to the virtual address provided in LR 
>> (e.g. the
>> + * runtime mapping).
>> + *
>> + * Inputs:
>> + *   lr : Virtual address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + */
>> +enable_secondary_cpu_mm:
>> +        mov   x5, lr
>> +
>> +        load_paddr x0, init_ttbr
>> +        ldr   x0, [x0]
>> +
>> +        bl    enable_mmu
>> +        mov   lr, x5
>> +
>> +        /* Return to the virtual address requested by the caller. */
>> +        ret
>> +ENDPROC(enable_secondary_cpu_mm)
>> +
>> +/*
>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>> + * The function will return to the virtual address provided in LR 
>> (e.g. the
>> + * runtime mapping).
>> + *
>> + * Inputs:
>> + *   lr : Virtual address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + */
>> +enable_boot_cpu_mm:
>> +        mov   x5, lr
>> +
>> +        bl    create_page_tables
>> +        load_paddr x0, boot_pgtable
>> +
>> +        bl    enable_mmu
>> +
>> +        /*
>> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
>> +         * to the runtime mapping.
>> +         */
>> +        ldr   x0, =1f
>> +        br    x0
>> +1:
>> +        mov   lr, x5
>> +        /*
>> +         * The 1:1 map may clash with other parts of the Xen virtual 
>> memory
>> +         * layout. As it is not used anymore, remove it completely to 
>> avoid
>> +         * having to worry about replacing existing mapping afterwards.
>> +         * Function will return to the virtual address requested by 
>> the caller.
>> +         */
>> +        b     remove_identity_mapping
> 
>                  ret
> 
> I guess you also need this ^^^ (Similar to enable_secondary_cpu_mm() ). 
> Otherwise PC will not switch to the caller.
> 

We have once talked about whether adding ret here in enable_boot_cpu_mm
in previous serie.

Since the "ret" in remove_identity_mapping will make user jump to the 
"lr" we defined before "b remove_identity_mapping", it is redundant to
add another "ret" here. We will never reach the "ret" here

> It will again invoke remove_identity_mapping() (which is redundant) and 
> then jump to the caller.
> 
> - Ayan
> 
>> +ENDPROC(enable_boot_cpu_mm)
>> +
>>   /*
>>    * Remove the 1:1 map from the page-tables. It is not easy to keep 
>> track
>>    * where the 1:1 map was mapped, so we will look for the top-level 
>> entry
>> -- 
>> 2.25.1
>>
>>

