Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82863A91F70
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957805.1350843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q8B-0002MT-Qq; Thu, 17 Apr 2025 14:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957805.1350843; Thu, 17 Apr 2025 14:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q8B-0002Jn-Nn; Thu, 17 Apr 2025 14:22:19 +0000
Received: by outflank-mailman (input) for mailman id 957805;
 Thu, 17 Apr 2025 14:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8tB=XD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u5Q8A-0002J1-FW
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:22:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c800108-1b97-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:22:16 +0200 (CEST)
Received: from BN9PR03CA0804.namprd03.prod.outlook.com (2603:10b6:408:13f::29)
 by MN6PR12MB8589.namprd12.prod.outlook.com (2603:10b6:208:47d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 14:22:12 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::22) by BN9PR03CA0804.outlook.office365.com
 (2603:10b6:408:13f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 14:22:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Thu, 17 Apr 2025 14:22:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 09:22:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 09:22:09 -0500
Received: from [172.23.161.73] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Apr 2025 09:22:07 -0500
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
X-Inumbo-ID: 5c800108-1b97-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsXc6mBh6sMW8zKUJTeNqcdE9RzdflN5OffvCXvokJlcTpCmiKNEtW+mtUv5ZIKBCqOzu8GZqjzy3Xkgjd2iO1SUgKKtyV3VbbCEvKaIQsE/JRsfmowoAn89iWkorUytSkfLYF0uxLyS4fNJGwxWvL2G5wFQ1rcXaiQLgGBgum3xYOyiknMgjW8/lmZl0DaMCejKX3awwwCh+3s3sW7jpx7PC/MvDiu8evsiECu4z5Diyrqgdw5FQdPfQ3t7ZWYla7y5YX//MHwhGfDhKmw53NWR7HhTnI1KmHUkZOFvMyjttP78EndcHVH2ZmuI8ooSPWLUk54xELneS1Sy33D46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qCHWFQ0DFfzt5um3E1dhf8yXRt+EDDNxTb26bpKz2I=;
 b=wEnfbKhAWes/dIbIOHyxT1g8fsh2Nf7hssGuuP9Yq00XNfbihPzyNkRcFhalCrsyzQ/yhI5oXCNzZ2n/nPrK8mOmpcmvKWuj0wNi0Spum2wpYizLLXGOyLN/KiDdpGofMW1V5b2eQqkKjPg8OV9318827XwAjJ5ckr4+3Xs+kVQIdVvtYAhXo3P785Vx6PLOZdeIcTaHPdKbwcyXX37MP1qKq3TNIT58c0pFEDA0iLaSBWGnFcxrzA3N/PjMQoeSM7IgXWsQZJ8VsW+F+TcY/eWn0JPaFRs5bToiRWpAwhELoN0Nka4+m3oF+l9evks1f6mhZsuKMT1e8ki7HFnJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qCHWFQ0DFfzt5um3E1dhf8yXRt+EDDNxTb26bpKz2I=;
 b=Qtq4rgTX5jQX6rMJO9aPzZ2gCWCdNZrioSsc/leCkp/6ls+KcNZVlUVK6KRCQvQO+Xrc8qFg1Y2MThmKhGFlRcBh89F1ITcBPzHspiAM1e8/OVVHZLrGUHHK0PUcso5F0rdHuKE+Gh0N4irJIKjFNZ2+5SOnGI7CwxkkmzMuioU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64116bdc-9762-4b06-85c7-d269ef4c9ecd@amd.com>
Date: Thu, 17 Apr 2025 10:22:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/3] vpci: acquire d->pci_lock in I/O handlers
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250415165404.435506-1-stewart.hildebrand@amd.com>
 <20250415165404.435506-3-stewart.hildebrand@amd.com>
 <ab982710-0172-472b-b3eb-07914d6579cf@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ab982710-0172-472b-b3eb-07914d6579cf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|MN6PR12MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: 97928897-4d4c-49d1-b734-08dd7dbb3e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjZLeDh5c3hnSXg0bzdMT3lPbUVMZTBPY3c4VXpNakNNU21vYS9ZMTdxTXJC?=
 =?utf-8?B?bERWNHhuZXVHUEp0azNobFd2NUFDYXpaM01wUGdNNE1qYVJUclJZVG9XcWx1?=
 =?utf-8?B?VEtuc003YXlNVDcvSUlmcGJhTm84L1E4Yzgwd2kzcjVJZll0KzBRUHdqTWdI?=
 =?utf-8?B?Uk52blhjZ1dDa0pMOStWYnhtWHl4alBqMzFSa2VReFlGb3RIRTFoYmlHZWFV?=
 =?utf-8?B?bDdiWFRwakEydlFaTHpKK3VVWEZxT0M0d2I2dCt1eGhkaWs4cmdZQk15WXZC?=
 =?utf-8?B?dDNXUzIyeXJIdVZ4dVJhQ3hRSWg2aXo1MTZMSm53OVFSZTFGVXJCdGVhWXFx?=
 =?utf-8?B?RldBU1BmYy9XbldlL0lzSUdrNkNXeGt6dzBOYXZicTAwVDY0eVA5Z1B2RFJz?=
 =?utf-8?B?aTJ6ZjdOai9kdFltczJUaUNmRnBsMFdtODh1c1h6b3pSNmg1Qkk1QVBsZExP?=
 =?utf-8?B?dkZsRGZONTByRWhrNi9zN1ZNZDdnVkRBQlVuaW9Ec3F5ZTJKTVdGYVRUOEYy?=
 =?utf-8?B?QkllYlhRUVJHOU1wMHJKdUt2KytjczYvKys5YVppcHppTUZ5RGhCY1QzQThy?=
 =?utf-8?B?d3p2Q0w3L2gwSUtVZkxSVDViN2NjVFV3eGJoK090N3gwcWFCYzFGQ2oxTFcx?=
 =?utf-8?B?enk5K09OSEhWV1ZEODV0Z0tFNE0wdW04L3h2Y2VFT0hCUy9oMUdXVkhNOTI2?=
 =?utf-8?B?TzluSWhRbWxQekVwZDlLSmdnRDVwNG9EZGZvZXJSTzYwdjI1SjNkSWdOa0NK?=
 =?utf-8?B?M2JPa3R3d2FjWHlwNDIrUUV5eTBkZ253aEhyWFpEZURGc2pNbkQ3TnBvL0Zi?=
 =?utf-8?B?NUhlSmlJb2R5bCtid3d3b1JPaDlFeWxGYk5DNUNMd0xCTGJzWXVHR09Vak10?=
 =?utf-8?B?cnNHOFNnVS9LTmQ3Z08zU3F5L0dybDYxS2FKUUh1d3Y5anBVeG5maVByZjZw?=
 =?utf-8?B?aEtmUkJzdVNwRnRXd1NGRFhVMy94V2tHRVpHZzBrR0N3L0Y3MGg4R3ZIYWtm?=
 =?utf-8?B?OWVCQUh3RTBwTDVSR2hpSmtZU2c1NVZ3UGdqRzJ0cmRpcnEwTFRqY05nMHVM?=
 =?utf-8?B?N3ZoWUZVdU9vcCtRekRLbWFjbzlrdExaZFlYYzVYaEF0TTdLMHpXNDBhUjBi?=
 =?utf-8?B?c1RNdFdRbEl0UzJhUGZjc2Roem5Kd2lteWlLR0I0cWFETTB4QU45bUV4VWlM?=
 =?utf-8?B?dDNObWZrQlQrWlhQUkhnaEdnTGM1ZmJsZDBQNDVZNWVnY2xoM2FVeE9RZnZt?=
 =?utf-8?B?cTRLSVFFVTJCb1FzcEJjeWxXUFMrenQrTzY1d1Z2aENTemIvNm9vVDZRVG1q?=
 =?utf-8?B?a2NzWVNTRnc4c2ZCaC9LUnpUd2RMbWMwYmlhbWx4TWNMYVJxV3ZGUWdvOS95?=
 =?utf-8?B?MnZqem43dm5GMWo1L2diWStZa0JJSTcyaWU4MXNtVGI1NXdMSTRYWEE2Y3d3?=
 =?utf-8?B?TW96U3FRQ3U4V2cvZlVQWU5UU2ZXd2Y4b0N5eER4akEyUEtoZzA0SUJ6clZN?=
 =?utf-8?B?MTYyUVc1VldoQ1c2QTZIem56RFFSRWg2ajJxcXpCaU1pQ2NGdVhiUThDaHNR?=
 =?utf-8?B?T2hxbEoyMk8zVHJUdllYdkZwTzZLM3Y1TW1kV0tDd2xYM05nKzFHaXhLMzhK?=
 =?utf-8?B?ZWNvUW5Gakt2SmxDbTRuN3E3K3UrWGNtdkRsVFRBRVlQbnJKUnhQeEFTNDJV?=
 =?utf-8?B?R1hCZVdQSERqQkt6MzdVUXRUK2trQytnZ3BZdlp6bkNzVjFXTWYrY1pwY0Q5?=
 =?utf-8?B?anovWUlGOWxqdzcxaXZha2sxZWZPZ0xKOE5uMTlVTEkrQjArY0NCKy9jSVZr?=
 =?utf-8?B?clNyM21oL2hYS1JnWmlSN1VqT2YzN0VrWE1xZnBtTU9waWNFTjB5ekpPd2o4?=
 =?utf-8?B?NjNQZkJJMEJEai9wZjZBaWJPK3BzbTRTWS9DUzdYdWFORlRPSG9EUFZhc0xj?=
 =?utf-8?B?L0dnWWVhMjE2M0hQYUc2VnljZlVqU29qYVhKSXZ4ZW5VS0lWclN4UUZhTFpQ?=
 =?utf-8?B?VHZNYkU5ZytnS3k3a2J6OFpOMTdFSzlVZDJTbjl2b0JZR2o0ZWNNUWtUUEtD?=
 =?utf-8?Q?KLJNnO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:22:11.2564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97928897-4d4c-49d1-b734-08dd7dbb3e3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8589

On 4/16/25 11:27, Jan Beulich wrote:
> On 15.04.2025 18:54, Stewart Hildebrand wrote:
>> In preparation for translating virtual PCI bus topology (where a pdev
>> lookup will be needed in the vPCI I/O handlers), acquire d->pci_lock in
>> the vPCI I/O handlers.
> 
> I find it concerning that the locked regions (it's a domain-wide lock
> after all) are further grown.

Hm. Right. Another approach may be to call
vpci_translate_virtual_device from within locked context of
vpci_{read,write}.

