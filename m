Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98B7E79D3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 08:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629944.982526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1MC0-0008H2-J8; Fri, 10 Nov 2023 07:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629944.982526; Fri, 10 Nov 2023 07:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1MC0-0008Ej-FU; Fri, 10 Nov 2023 07:44:40 +0000
Received: by outflank-mailman (input) for mailman id 629944;
 Fri, 10 Nov 2023 07:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCxK=GX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r1MBy-0008Eb-GM
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 07:44:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e89::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff96005b-7f9c-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 08:44:37 +0100 (CET)
Received: from DM6PR01CA0013.prod.exchangelabs.com (2603:10b6:5:296::18) by
 MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Fri, 10 Nov
 2023 07:44:33 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::62) by DM6PR01CA0013.outlook.office365.com
 (2603:10b6:5:296::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Fri, 10 Nov 2023 07:44:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 07:44:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:44:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 01:44:16 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 10 Nov 2023 01:44:15 -0600
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
X-Inumbo-ID: ff96005b-7f9c-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecLarY16vIkcLv7WrNb3h+c0WrckQtaI0qxBrFoDTdWJewm+9ktNfwVemN2dtIVSOTZjUBZOIbqZtg5svI/YsKMyHHID2xwUzNbdd/G0kWWyGEAH5T6tBHP5oHU3qpYsvdG+6vPJs6vkhkINEEzcqIpinUsH6/lZ5uyaQlorWM7Ae+Q67PIEHVA08qrjFx88kW0pRQy8u5EF2Rgh88LwjVgdDQSQ/Sk27HikqHhz004MzxECffwee3/jZu2S0X7PzIj+6Xrkz9/lUrcG3+qL6xgJZDunyITpfXbldvngbUB52j+cF+I0fgtuA8yC8l5ZfK5n6fD3he+ZZPe++5HXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sln09qK6Olxkfos5s1QABGW7uEnK0dojKOTOgp5iVrk=;
 b=hoh50dNww38nQn3OGw6Po8IXCxOE87KpK+vh5Gzp8q8G0V8PDJl5iylsPu1oswLNZo2bK2Lu3qn6+W50/FL0ECH0o3Vcc8ymxFQ36Cd+1Df3SP5gkaCMkMS7wd2ixN6uJK57Bw5dg+ALAMcIR2VI+TbE1VbBKqF2AwPMUlFabj2hNtpHoJHeGXD7C+MVW3ZYOzsLRFHW8a9D+87JysxEkW0Imov9zODa2Z1QPsLFEhr76UzHj5cNfPa7y3svNzziKFo31qdUKw5Fk7fC/Ny/4X5uP1YSB/lUgKU1M8na3dMo7a83nU7laCl74FEiWBhWg/EtBrD/nVhbC0epMK5MCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sln09qK6Olxkfos5s1QABGW7uEnK0dojKOTOgp5iVrk=;
 b=f6t4d/087xc5QqsbYKz78jlag8Ja+Q6NaCP/QSKW4Ocs2RO40sVvHkk09HVyXSVv6BWsayB12B0+/43NyvwGGets11isCOZP/D/Gmn8ubzK1/LpD5V3Qjbtzw+4q/wCcfqTCx6gUjVYnG2wsgU4Lgsw5H9uoePfd+IhfTlS+u70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7ccda3bf-0d6b-49d0-a360-2974d921a0ad@amd.com>
Date: Fri, 10 Nov 2023 08:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
To: Stefano Stabellini <sstabellini@kernel.org>,
	<viryaos-discuss@lists.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>, <brian@woods.art>
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: a960eb79-39cc-43ac-84d6-08dbe1c0e147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cQYZgRDL55pUV6KiB83i/ucbh98QG6tGNzU1cWadY/WE82VFs88czw9luKK1PhqZEeV3Xje1VJyBnJD2RRblY/umSTwCiLP6lUqjXm71JZgRMZ4pbrfc9GdqNGhPHoUQTxbYjb/JA6rZipKCaRCQ9ZBoa7ZHvkKdDiY8RBvz62fOalM8DmIcvoqTg0dR7CtokHhDTdziCLHiA8J0dOpHJ315O7fcvN9dGzDyMcCrq9AfEZsjSf2a/pOv0qEYUiDWdJgN/XdZDyCZ1b8AbkDh60nDyOqsJLN30bJdJErOL41Ey6XhEf5RtbLLqFJ4yQd/PhANYZAhfg8D1URFT53y3LHVcWO47WCNUC/tJabt1OCiNnp6wj0EXxwA5ed+NnGa59RvAFd7+ZG1dmySQJoNIKWl9OgNs22lwk/HNbwJGW7s9eyXWS4zv4f2Hz0hweEUAeQEh2e85PKjLFUmrskhutZ/QVBCxsOFagegTm0c+Hh5BW0xOYFlmiW/EvbyCiagk5nqu9Rzfl3NfqY04Iov+BZ7DIuYIk/8K4pKHzZhefVWQjqxRKc4h9US/L0O76esIqYyxImh1IJ2z3hIODPg1jZTjHEBgLqKnRexPs8wjxw+ogLa08jA+1hfALpSpi6+BwNJceUXYSY9+sT+1Z0nhPnzKm78Bm6zwpoIuseJsHCoqzOKufAWE8Hw/O5ZYyf2eeIfg+xw9+TS6MzrJKY27AkUW1hmJ4KFQyESZylkNnnpkDI0sY8ncDX6jh7SkFI+UAmZcJU69D1nRa1oosyZjOa2IMWlSYByVNOiS0ya+yuCCm56HmcEaM1s4mD9RjB1
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(36756003)(558084003)(16576012)(8936002)(316002)(8676002)(336012)(4326008)(36860700001)(110136005)(5660300002)(70586007)(54906003)(70206006)(44832011)(478600001)(41300700001)(47076005)(40480700001)(2906002)(53546011)(2616005)(31686004)(426003)(82740400003)(81166007)(31696002)(356005)(86362001)(26005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 07:44:33.1807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a960eb79-39cc-43ac-84d6-08dbe1c0e147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437

Hi Stefano,

On 10/11/2023 02:44, Stefano Stabellini wrote:
> 
> 
> Reported-by: Brian Woods <brian@woods.art>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


