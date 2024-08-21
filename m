Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FEA95A297
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781362.1190923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo0z-0001mS-Td; Wed, 21 Aug 2024 16:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781362.1190923; Wed, 21 Aug 2024 16:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo0z-0001jE-QJ; Wed, 21 Aug 2024 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 781362;
 Wed, 21 Aug 2024 16:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DO9u=PU=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sgo0y-0001gl-MW
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:16:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2412::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48448b9-5fd8-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:16:50 +0200 (CEST)
Received: from BLAPR03CA0180.namprd03.prod.outlook.com (2603:10b6:208:32f::10)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 16:16:42 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::ef) by BLAPR03CA0180.outlook.office365.com
 (2603:10b6:208:32f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 16:16:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 16:16:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 11:16:41 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 11:16:41 -0500
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
X-Inumbo-ID: c48448b9-5fd8-11ef-a508-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoMkFqnXDFvQSQKCwI31zZkeOeR2b++R7U1kHImQeYQHEZPLzOo2NWPuBT0fqPIM34ebnh68ZwTb8S/Khhp5h8+1T1Ob3nBbPtuD65huG4/dFclRLEy4+77G3+Wl3oe2ZNtGbWp3oZdN3k9UeFIzRDD/LovNdoAuW+9VXb7TfEG9oox2ao07s2sfRWxkein8cRWRjTd2yTYD6QApc33R3TN58xNXP8ywA5YkSWYnm540tSa/OZ0ZLKKXPlAb6ku1I2cQzGXjwtJ0DOJp954LNaA6EfMYg2zoxXjFndvPJAnRZI4CBc2+ump52xrkOFxOAt1daccPlj9PQDwLnqb8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G74wTSTF9yAy9OwKhsdgGFVkDy2MZvABYa7IPrBhaw8=;
 b=jVDUtb7/uKVyl2z51qzxLFFwQV243wXDj12k6NWCFKktqH6kpyRbPHBkitgi4dpLp9OQSghD1tMljXsB3F2a+LGvtoSUQcpOd97w9nVY0pqdkWbX3OIb6ew5sfwCkC87hB8Tq+Vpak1jaB8a2saubQq6KJME82oY5ULpxOX6b8x7OxNCokznKa7QjKYvsTY7GSlry2N+SnykV+buzYgEcLKv5cTTmnEtaK1+iHOQwqxTaUhw5CU+XzbdrhhdoApmVnSHh6tQPhC5nE75sJPcKo9cwFEnoapP+7CzzszKa0O1XYdAz2VwN35W5uj7Su48MSBVs47Sr+9TRBS0mZAHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G74wTSTF9yAy9OwKhsdgGFVkDy2MZvABYa7IPrBhaw8=;
 b=VxkqV++1uYvglHPiGd+RhBf8ZemPls4oGBZHOqDlzcSOZ/PC6ZG0OI13zTojcxdKND1On+HfifhuJrWzrxJSf1zhgifG4adU9giY1kl1+MGmzJzVSY2vViDLa/ymscIRgeFz1lktxiepGnmRrgH26lIH+xEzpVY1dkmc+tqQprQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 21 Aug 2024 09:16:40 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>
CC: "Charles-H. Schulz" <charles.schulz@vates.tech>, xen-devel
	<xen-devel@lists.xenproject.org>, Xen Project Advisory Board
	<advisory-board@lists.xenproject.org>, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Setting up the Xen Communications Team
In-Reply-To: <PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2@PH8PR12MB7326.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2408210916300.3871186@ubuntu-linux-20-04-desktop>
References: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech> <PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2@PH8PR12MB7326.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-859443615-1724256998=:3871186"
Content-ID: <alpine.DEB.2.22.394.2408210916390.3871186@ubuntu-linux-20-04-desktop>
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f4d35e-db6e-4179-ae0e-08dcc1fca500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUF1RGxpdFg4VlZlRW9KeGtIZmF3aDVMM29ab3lWQSs5Smx3d1kxRm5qZVRa?=
 =?utf-8?B?c2hualowYlZLazVuYVpmTVdNNlBvbVlvM0RENkxRblJhMUd4WTBTcFI0SUJw?=
 =?utf-8?B?dUhna1RjM3FjbWJPdEdkK29aTUFwN2N2VmRFa0NTK3JzRmltUU52SDU1TStY?=
 =?utf-8?B?RkdCRUVuTUE3elRhZndpSkhsWEZYMlowQ0FtY3dRYUN1SnJ2T2lNOVRIVzZq?=
 =?utf-8?B?VFlEcHdkQjR2NmFZK21OSVFEQkVlYXo4SE9NczNMVnJHZDZ3eXVvczdpck9Q?=
 =?utf-8?B?SSs1V1BtSGNZUmc2YkdMWGQzN1IvTDZoNDVlRkhNRG9XckJYUnhjcW1oZmoz?=
 =?utf-8?B?MXF1MDVodzdncmIwM2RSdUtPUmVnOStNc2lWTStCaWE1TTQyRmJHbzdtdDZQ?=
 =?utf-8?B?VXhWNm1WKzBKTzNCeTVjWmoyV3lkUjVaRHNpb04zMFV5dDJmZnFHUzhFZm55?=
 =?utf-8?B?NGdOQlNhY0tZMU9hQ1owMWZVOWJwdlJtOXcxTXRRblpOaUlDZnZIdnI0ek9o?=
 =?utf-8?B?Z0cvN0w3RWFhcTY1U2pBT01TTE1mcUcwVFVhRkZMb2Fva1BuZmpBMmF1OXF6?=
 =?utf-8?B?d0xpV1dCN2pMaGRBMitZcmpSNDRYNUhwVlFGR2hwbVhiQ01ia0JVOGNyZWta?=
 =?utf-8?B?cDlGektUd2haOEduQXlZRDZiM1RBWlVyRnNlNy80M1dCS2h3MitXNUdmT2tt?=
 =?utf-8?B?WElQSVArOEpkOVVnblE0UmRna0NCN2NnNEZxRE05b1B3Wkk1UDVCV1lCd3N3?=
 =?utf-8?B?RFo1Q003bWNSejhjdURrMjBwbTJOK3hvbkxpT3M4VUVCUlloL05veG9aT3BG?=
 =?utf-8?B?TnlJWW9IU3BoZ2pQKzlxb2dHRnJEWndFUStsRU5sZVlPMVU0K3R6MVBlNUtN?=
 =?utf-8?B?bmpLS2JSbExqb3Nmbmt0QUJSeEMxNSthOENHMXR0SllRWHFqcXh2a0N0Q3Fh?=
 =?utf-8?B?SXdEckN6T21VSlJvQm53bXBqUDVxUU4wenF1OUtlV1pkZXg5OUIzNHhheVEr?=
 =?utf-8?B?czFKK3pUemMwYWpiU2ZpajJoQkhhTGhyMEI4TnU3VW1wUVJoSWQzRjlRR1E4?=
 =?utf-8?B?VUhWYkdHbDRrN3dwM2tPV1JqR0QvV2hUejNRNWtWS0FsZXJycU45bzQxTzEy?=
 =?utf-8?B?V1Q4R0JXbWZsMkUvOXl5aE1LUUJlNVUxSXYxY0Z1bUdOaS84VWtVbFFhS05S?=
 =?utf-8?B?RmV3bi84TlVyZzlsRG1KUDUwRk81MVlLRFFNUnRuNTN5b2ZxSVZ1NmV0ZGRh?=
 =?utf-8?B?R3hzNmZLQW9MV01MWkZybHhCREk2T1BzNG9Jc1ZqYmtScmR5RW42OUdCTG1B?=
 =?utf-8?B?dFUxTlhMem4rdC8xM000Z1hneHVIL1JDUVQ0Vm5GRGhESlIwYnZxdUFMcHUw?=
 =?utf-8?B?ZGJBZHp4MWhVMGt2VzIrb3FlZUR2ekNEN1ZJSjN4L1BCOXUvcTRJTmVORVJQ?=
 =?utf-8?B?d2lWVmVoQXVXZWJTQWFVbmhxQVNYMDhPVTdjZXBJczRYa2ovdDlFQ0xFdkN3?=
 =?utf-8?B?Y3pvSStUMTdGMmRYVVNNYUp1aDRqRkIzTHM3dGd1MmpSK3BKbkhMQjRPNm9t?=
 =?utf-8?B?Z3k0QXpOZDFoeVBJS3hkcHZoVmw0YlhXUlNhNHFqU3hUc1N2aTVOVloxYXZp?=
 =?utf-8?B?bEFuY25DRVgzcVpNUUZVVWx1U2JYNjJ3UlljL2xNS1VBK2dxdUQ4eUF3UkRl?=
 =?utf-8?B?QTNVdkQ3S21wc2hmQ3pZMHBoMzR2UFVSbUo1Z1VlZndjcXErVi9rbFk2OS9G?=
 =?utf-8?B?NUFwQWx2ZDY4VVVFUXkvejhJWnRJTDRPMkFNNTB2OU5jV1RiLytIMXl2V00y?=
 =?utf-8?B?dXdkMm1Bb2FtakxYQXo0RkFncWRDYUNkT3ZCZlJwYXZmWGU2ekZtZmdoM01U?=
 =?utf-8?B?dDhTRDZxQlF4TWdhL3U4WEN5MllZTk9mdVA4M21oMGI5ejluRnpjSVdJeXhH?=
 =?utf-8?Q?yCF2VSKrn35UaH368n4h3238ZT4s2Akj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:16:42.3347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f4d35e-db6e-4179-ae0e-08dcc1fca500
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147

--8323329-859443615-1724256998=:3871186
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2408210916391.3871186@ubuntu-linux-20-04-desktop>

Me too

Cheers,

Stefano


On Wed, 21 Aug 2024, Halder, Ayan Kumar wrote:
> Hi Charles,
> 
>  
> 
> Thanks for taking the initiative. 😊
> 
> I will be interested to join.
> 
>  
> 
> Kind regards,
> 
> Ayan
> 
>  
> 
> From: Advisory-board <advisory-board-bounces@lists.xenproject.org> on behalf of Charles-H. Schulz <charles.schulz@vates.tech>
> Date: Monday, 19 August 2024 at 10:46
> To: xen-devel <xen-devel@lists.xenproject.org>, Xen Project Advisory Board <advisory-board@lists.xenproject.org>
> Cc: Kelly Choi <kelly.choi@cloud.com>
> Subject: Setting up the Xen Communications Team
> 
> Hello everyone,
> 
> Just like any major FOSS project, Xen needs to take care of its
> messaging and communication. We are usually focused on software
> development, however we'd like to take the opportunity to call on
> whoever is interested here to join the small team in charge of
> Communications. 
> 
> We do not expect this to involve a large additional workload. If you
> are interested in joining, please send a message to Kelly or reply to
> this email.
> 
> Thank you,
> 
> --
> Charles-H. Schulz
> Chief Strategy Officer
> Vates SAS - +33 (0)6 98 65 54 24
> 
> 
> 
--8323329-859443615-1724256998=:3871186--

