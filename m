Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95265B30E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 15:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470326.729805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLNt-0007DD-3j; Mon, 02 Jan 2023 14:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470326.729805; Mon, 02 Jan 2023 14:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLNt-00079g-0M; Mon, 02 Jan 2023 14:01:49 +0000
Received: by outflank-mailman (input) for mailman id 470326;
 Mon, 02 Jan 2023 14:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7CY=47=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCLNr-00079J-Ol
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 14:01:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd722ad5-8aa5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 15:01:45 +0100 (CET)
Received: from DM6PR06CA0042.namprd06.prod.outlook.com (2603:10b6:5:54::19) by
 MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 14:01:42 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::cb) by DM6PR06CA0042.outlook.office365.com
 (2603:10b6:5:54::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 14:01:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Mon, 2 Jan 2023 14:01:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 08:01:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 06:01:41 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 2 Jan 2023 08:01:40 -0600
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
X-Inumbo-ID: fd722ad5-8aa5-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyniDtl3pJnC1SFpkJ6hJ3gzbM4/GRo3EDrmn4XlQsIO7oWFuO3U5kBfmAoJN1GzOwPsDdM6OEbskWgUWF/9sfekiaWMW//a47gN72ErKyflFJnHy+g0cFeDkMzD1fLsP6Lnofk+Aa0jLiJjza/rIL5kxvAdTVa9QvsbBEC5lg8PPrJf/mD6eK0Lt3nXWOnhdv/MIJsE8WOdfI5krliveaej+UDSXjkvWYm1CIvUkknPqqPZL+dPGDpbeJjyI0zEnGJ6ekzyijXlXzpy8dLZNnYC+q0uuIH5QMrQmgqCmWtpInl4M/ULxRvlQGK15xwdPVNTtH9+z5X5zm0HgHu0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0gEafiirFF0bZlDHW4qHs/6kFKGTcRmz9ZoeGuR6fE=;
 b=HGIxDXOcKmGOTgXbBnKsZl9+5bNaYWwMwZ+++kD3HORvBYc1+zfrGqYIg0zKHInjy2bHyQKLctie5oFWnJHkvxqpyw2yEUVNo1mSDyZ/bnU7ez9BVBNmPuvuBMP4euVS2PTvr2D+hPje80I5Aek/pGoIleqtNSP+8RG510EFr94FuRh1q6guJ33t00INVk15726zxwgszBvqJq8S2SsaC4BnU0YmZUaGZDhc18GVbLGGJSsVkV8U/xp2iCurbOTrUv6gl9vb6h8W6LvUlGj9ssBPAojYNt9dVe2jdiqyJ4w09OG4bbry0D6CtxR09RH9Mr12A2gvhFG4jo6PO/e4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0gEafiirFF0bZlDHW4qHs/6kFKGTcRmz9ZoeGuR6fE=;
 b=04uLRQnN+fyJ9UKHMWMV31P0rG8iZY3ta/83hmFsKwygewmtK0f/cfEt++l9ghfvDdIs3Fz5N+4HDq6z+rs9MCwOwR8HEW+45HpyAooGN7R+rJcI/hVs+Rigdsb5aOmhOqIYYV5QaSgzPz9Dn9ddQ93QktMIKPBEk22vE2cFEro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a355516f-1104-8285-9810-ea5de35e817d@amd.com>
Date: Mon, 2 Jan 2023 15:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/6] CI: Only calculate ./configure args if needed
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-4-andrew.cooper3@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221230003848.3241-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 89031ae5-c623-4ab0-a82b-08daecc9e03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjPdYPpf47sX6xAl/KihMxpYgUo6xgiBzzmT9EJfxKyj0OQGJDDgFfkicoyJa6QKv7ppGijmftUhBTMJn7RGC6WPHrEpIGUUKmXLF50TFkDwKBXTOePdMXcK1QXohfleQSH8V+GmKeYwfglMWCu1GTeKvTYn+jTUiLQSFMK3waJQwLSE+7ishIura/n2iD+FYrzMhkLMbRzWCGjhe1cWzZxM7QauOHOSBMT+4a8i+yrdmCgJ6sBGpeJYcJCvHoEW17D3EOv7x8pO4bUawpK6Z2cvLq0lBftlSnDMRJgNlRv26XjCrp7Ldi29q2pxiH4RbEcLruCjhW3tZsLqtOLfVlKfRhLfzyggXj8BwfDtPBP+JSfjnCvnc+C6YD8FmoQBCpjPv02203oc94algOD3SfGHAj2VvAFgVi7YE2ISIsV7m9DL0M7TnqHGjbIcVB+uUQvzvWUXRUKFL8PpH8xITdDAjwtL+/6qUeOSZcHAVnf9xahMjdKqkspw8VfCEJMQRei2GfCMqHjGqX4xF2WXuCR7FimrUwNHWCKJm3GXGXROleOPPXy3/8rA5RuOeEnEaHL5rtDnC7+85InnsMiLGPJsa5CySJzfKIKJ6tjcC7jdLCkpO/CZIanyFufkH4db8Mxxgdm3eQ3OLKlWvAr5qUNgCyJwkBi/L2kv2kIQ/ZlJyAT8VNRCzGD5xjRYgnQvJDr9/TGNhuytUsRKg2Sj0nZQxPvdelSiZuLYiFB795dozb/OAxlP6GGLrlb7CI5deVgWwb16CrCO100Z0kll0/moH50L74+6L6E0HLErBno=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(81166007)(356005)(82740400003)(40480700001)(558084003)(40460700003)(36756003)(82310400005)(86362001)(31696002)(53546011)(36860700001)(70586007)(70206006)(316002)(2616005)(478600001)(26005)(186003)(16576012)(31686004)(54906003)(110136005)(8676002)(2906002)(47076005)(41300700001)(426003)(336012)(8936002)(4326008)(44832011)(5660300002)(22166006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 14:01:42.0284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89031ae5-c623-4ab0-a82b-08daecc9e03d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

Hi Andrew,

On 30/12/2022 01:38, Andrew Cooper wrote:
> 
> 
> This is purely code motion of the cfgargs construction, into the case where it
> is used.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


