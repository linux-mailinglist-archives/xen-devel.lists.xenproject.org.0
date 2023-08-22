Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A897783B5D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588208.919690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMLT-00028F-9I; Tue, 22 Aug 2023 08:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588208.919690; Tue, 22 Aug 2023 08:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMLT-00026G-5V; Tue, 22 Aug 2023 08:02:35 +0000
Received: by outflank-mailman (input) for mailman id 588208;
 Tue, 22 Aug 2023 08:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z6jt=EH=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qYMLS-000267-5X
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:02:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f514b81-40c2-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 10:02:32 +0200 (CEST)
Received: from DB7PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:52::28)
 by DU0PR08MB10368.eurprd08.prod.outlook.com (2603:10a6:10:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:02:24 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::3a) by DB7PR02CA0015.outlook.office365.com
 (2603:10a6:10:52::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:02:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 08:02:24 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Tue, 22 Aug 2023 08:02:24 +0000
Received: from 9e832e56ebb2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62993AA9-62AD-4E1F-9B23-0D7804273A15.1; 
 Tue, 22 Aug 2023 05:32:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e832e56ebb2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 05:32:14 +0000
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by GV1PR08MB7362.eurprd08.prod.outlook.com (2603:10a6:150:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:32:12 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::74) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 05:32:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 05:32:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 05:32:11 +0000
Received: from [10.169.172.116] (10.169.172.116) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 22 Aug 2023 05:32:08 +0000
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
X-Inumbo-ID: 3f514b81-40c2-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsS4oWBA9/vtIEFbwcGqI3MGXfMc95jve6vSxzHI7NQ=;
 b=bzdXKcYtK93D72iwQ0nMPdIW+Khz0LHV15roCXFQGCxikbxDMj+Qv88b0VS+0yQHwm19E1BXQPo5h+Z74vduSQ1f2C93qA0/n5oGPqSKCfQiXGExFVCp81OhIJbwRYDliephvmncrm0A2Qt6G5DgtSEl9I29wEhwIi1838S7Tzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 756c036c4ccdaba3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3wUPdqNB9mE61T1Pc3GxBSsjI+94o4kWxKPF1FJI3RhbsRjOHlYJwqdBu06ZW0Fa0qhrPN1Hkl5417WvMyCecAAd8Pzufbu8pVD+Yxz7y0ceX3w9CqaCyOip8gcbPcg8Bf7A1WQ3sVTsuCn718Oln5+UW7iVGYBVQY/kyd9xWx8cQjzuGj54+YSJqwhsUVdmpTv2u/TbD/Sg/iRhGvy49w2VXpHEss/Ef6ZHC/IIlkBGGfxfCpjM/IMulkz6t6lZDVIxU8iTCvHrKXI/XR6azucHwCIAjjM+9WPuWzhFxAzk3fIyTGVPRgYM96MxsdxlxIncHV4Vldbzr67efqRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsS4oWBA9/vtIEFbwcGqI3MGXfMc95jve6vSxzHI7NQ=;
 b=YurdAJ264dQ5HryUKK4JyA/X0njn0H6lzQoZ5M1IfbTEuTiY0T4Pdh1fRZxoTLwYeoGaWUxGQ8TnDUL7EXej0UiU31o1SS3PuY2/WdwYbinBpp+ulU1+MilBcc/YhHkTa8bs6vdmJ8kS8Sv1nLqLKtcCWzEafvPevZfYEemEDfs7bFZij9I7xbA4g0bOJb3emOxxfR0/0Dm+tZlRVud8OT+VmrL/WN3LRlq84DeMv4XDH9K94vX+TO+O5v6Kq39hrrSZ4clVCfgJueuRhZHMZ+KzropzL/KqpmNgqmcn0q+uFGjhhXe5YmFXBz4SxlQykFq/yYO9pe6ASNL8I6glzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsS4oWBA9/vtIEFbwcGqI3MGXfMc95jve6vSxzHI7NQ=;
 b=bzdXKcYtK93D72iwQ0nMPdIW+Khz0LHV15roCXFQGCxikbxDMj+Qv88b0VS+0yQHwm19E1BXQPo5h+Z74vduSQ1f2C93qA0/n5oGPqSKCfQiXGExFVCp81OhIJbwRYDliephvmncrm0A2Qt6G5DgtSEl9I29wEhwIi1838S7Tzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <1fae4dde-f1b5-fa13-d021-3bdde7184fbe@arm.com>
Date: Tue, 22 Aug 2023 13:32:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/8] Follow-up static shared memory PART I
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
 <6fcbab6a-7126-21ee-e1bc-aa7ba2b07fc0@amd.com>
Content-Language: en-US
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <6fcbab6a-7126-21ee-e1bc-aa7ba2b07fc0@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT020:EE_|GV1PR08MB7362:EE_|DBAEUR03FT051:EE_|DU0PR08MB10368:EE_
X-MS-Office365-Filtering-Correlation-Id: c33fb604-d59f-4d30-787b-08dba2e61ec2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tw2dDOqpMPzH7Id2EildTfhZ9eoNLfvxC1PwQ16bRYWRfY9gOLJiJkHcYRqzh12jEY/oDjIS+jf/pKuK/nnRibHS38ffUJFUR6OY23WITPoWDYOofLwSfVfKLIxoTgQ4pVQryBGcHtaOBlLfFG44pnAIz0PLF3Gk8m2+piYI0q/aIyKb0r+0qm7PCQDZzCkzEZ7PcAUk7hGUbXiCIdqYZW+zbrWwCQrAeeSFTAjnv1nYkgIMPgBP3Vfx6Xo4hLa367mlqogFUKaPxCTW85Cy34CnHAmLGPYPJcKzyAH3B7Gol5Wh3GzIRa5UGbLCSm1Jyi5pAAjWZNsQGmV3Bw9P8Jhk1vHZ5wgUjxb1jeO3bg3d5snfJfTL9cddYNbrHCtE1rIyqyeUSWO6EAE/Z1BLZdjMWA+xxB7PW0GdL0LZdYPSmODdT9nTcQGBTKR8gGa9JwRBMOSwAjFgiTCDywCm/rWkZ50nSpqPsLyfkFVibmuAzPEGw8PSK7dIHYuyHSDlTZSYRkF/ZOYDX5vEFyGEZI54XrgOEqgdWGxZB/qYDPLC3JEHdOlm3IzfD3uuoVfYabk9Ssx1uI2JWzucp53VGGDSUdwCTHLETbtfYB4Y98GuBGqJptOW7gibPKYzL3abXU3IGiEnYviOCPNVSUQEAo+riPkyC7L4+zvqKfe28Yh/TmdeekNC4YLo2r6kS3eQGnWweYaqfSjuTbxyjBOdb9jfJzU8GCc2XhlmFmcoc21lmRyaOC4Q/rcoFtK7ZpSyOTUrfTz5H1aN0xZlVI5zCDr2SKqdblQq8jA+W7XwGu6cJz/Rg6wCzC+GTGBFx0d32rShO0n8NSxIdKtLljUZVw0b0Dgw0AqCT+/ldSb5sJo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(70206006)(16576012)(316002)(70586007)(110136005)(8676002)(8936002)(2616005)(4326008)(40460700003)(36756003)(41300700001)(356005)(82740400003)(81166007)(966005)(478600001)(6666004)(53546011)(40480700001)(83380400001)(2906002)(86362001)(31686004)(47076005)(36860700001)(31696002)(336012)(44832011)(426003)(5660300002)(26005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7362
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6853238c-6a18-4af0-acb8-08dba2d122c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXkLQAARRhFtX83TBlGsefrC3Drk88Fj9OPfvklYmc9BprDDBTUbZTju5a+cAvi8fzk4Z+hdCqZZfg10PlAxnCR1rcaK4TW3P7xcsg2qvy7AgQeSYOfDlj6+KufWdkh4b+SR/MICsaaVF9YCx5myLAUHJrw4Nw42cF8fGcO7ZHQW6aK3C2vT/Si1EjE7QKmkfwihBtwdhLciklNN2QIWhan1d29UX9VQNR1G7GQnalmsHM41Zk3heRulYMfVczPilvKwEERjtWA6N6awvwouEy55mhdQ7KGyXX9Nj7X5x/WUdkNUo9CE1bYF7eGAYZUvdPJe6NlNSK5R3RAlZXAlv89x5TRyxoaZ/fvRA+geYGBs/uVFX7lWRL9Ra5gHO5+u+xtJP0hERhTb2/qZXvl3zpzQJ3kBtesF+FDdRAhjik3oDyvOYy+cYs92tZ12ztguwkTUcN2Hb9AiLq1A70xgEC2yCDelTmuftEp7cUVAESMp9UWqEPX1OflQOO+IeoxEMz5OaJZjdoOxZnOCh6EHoPZ+kgyqmRc9aiXmADCdlt0gqLCYYVJoB2fqNe6pyIadZLFG+SOxE2QnjOumfRpinlxiBRP5qW4v8OVuaYKihsEZzTDlXA3L7GOD75ZQR977ptWK/EKhlwEPVVTcCyxEQIZQ/9hbDVA2Pc/ZVHOd7rppuory4o9qgvupUpJLz4NpJYAYxZaHNNwBK6I/8FqZ3pIqWAgMAtJKdRW1VgqIAEteIp8cBYQN3CdGWmTcOICX2MbcROMgCkeZCZsmg9DxIzx5vZw9eL35mjD8dersMgpVCK7C+BzqGUR/Yzq32QdgnIxWhyQFrrwlEBcnQaAx7A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6666004)(53546011)(40460700003)(31696002)(426003)(36860700001)(336012)(40480700001)(107886003)(83380400001)(36756003)(26005)(82740400003)(47076005)(81166007)(41300700001)(2616005)(2906002)(316002)(16576012)(54906003)(70206006)(110136005)(86362001)(5660300002)(70586007)(44832011)(478600001)(8676002)(8936002)(4326008)(31686004)(966005)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:02:24.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33fb604-d59f-4d30-787b-08dba2e61ec2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10368

Hi, michal

On 2023/8/21 18:49, Michal Orzel wrote:
> Hi Penny,
> 
> On 21/08/2023 06:00, Penny Zheng wrote:
>>
>>
>> There are some unsolving issues on current 4.17 static shared memory
>> feature[1], including:
>> - In order to avoid keeping growing 'membank', having the shared memory
>> info in separate structures is preferred.
>> - Missing implementation on having the host address optional in
>> "xen,shared-mem" property
>> - Removing static shared memory from extended regions
>> - Missing reference release on foreign superpage
>> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
>>
>> All above objects have been divided into two parts to complete. And this
>> patch serie is PART I.
>>
>> [1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
>> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt
> 
> It looks like there is a problem with the changes introduced in this series.
> The gitlab static shared memory tests failed:
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/973985190
> No Xen logs meaning the failure occurred before serial console initialization.
> 
> Now, I would like to share some observations after playing around with the current static shared mem code today.
> 1) Static shared memory region is advertised to a domain by creating a child node under reserved-memory.
> /reserved-memory is nothing but a way to carve out a region from the normal memory specified in /memory node.
> For me, such regions should be described in domain's /memory node as well. This is not the case at the moment
> for static shm unlike to other sub-nodes of /reserved-memory (present in host dtb) for which Xen creates separate
> /memory nodes.
> 

Hmm, correct me if I'm wrong,
If we describe twice in domain's /memory node too, it will be treated as 
normal memory, then any application could use it. The reason why we put 
static shm under /reserved-memory is that we only hope special driver, 
like static shm linux driver, could access it.

If you track down in make_memory_node(), only memory range that is 
reserved for device (or firmware) will be described twice as normal 
memory in Dom0. Memory like static shm, will get passed.

> 2) Domain dtb parsing issue with two /reserved-memory nodes present.
> In case there is a /reserved-memory node already present in the host dtb, Xen would create yet another /reserved-memory
> node for the static shm (to be observed in case of dom0). This is a bug as there can be only one /reserved-memory node.
> This leads to an error when dumping with dtc and leads to a shm node not being visible to a domain (guest OS relies on
> a presence of a single /reserved-memory node). The issue is because in make_resv_memory_node(), you are not checking if
> such node already exists.

Yes, you're true.
In Dom0, we could see two /reserved-memory nodes. I think, if there is a 
/reserved-memory node already present in the host dtb, we shall reserve 
it in kinfo for make_resv_memory_node().

> 
> I haven't looked closely at this series yet. It might be that these issues are fixed. If not, I would definitely
> suggest to fix them in the first place.
> 
> ~Michal

