Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77EB690505
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492268.761730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4I4-0007Yv-HF; Thu, 09 Feb 2023 10:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492268.761730; Thu, 09 Feb 2023 10:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4I4-0007VY-EJ; Thu, 09 Feb 2023 10:36:32 +0000
Received: by outflank-mailman (input) for mailman id 492268;
 Thu, 09 Feb 2023 10:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4I3-0007VS-65
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:36:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9e6ecf-a865-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 11:36:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 10:36:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:36:25 +0000
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
X-Inumbo-ID: 9a9e6ecf-a865-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR87EaiBvlHqGitK3SET5VcV8cvRGFjbc+Yg3FJ4HkvQXrNfsVf396CBghpdJWgY1wlykuZszLqsAnl2fIZgPuQALzidMjlWxlztzoFGi8d93uxSVDFHtWkBLFEj91RHC9F2jBsOux+v/VdzADAcmbwV1RrtkDy3ifPTPPNk6E2/sOcVHMggy2oAi2yJmgAzO1trxiw7UDP/fjm9MWtGi/sUXkbNgs9WXOk2bXQLZ2Dq8YnOcdi5MoN/GF+A4qmXsGmVHgPxuPXYeOucdm8yqxqJV8WwbIJxm3+nSCc0yZfqe7n5veujt3QXWTfdadNXOYqeJhUZpoYa9nOKEJv2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nE5hHfn8VL/t8o9WHYe9LxU5J0yDdsSMk2IhuzELhU=;
 b=XypKgFJk5heMW+04JiG9b8jYxoUFR0ikkpF3XSbAaGU4PR+21FdCJoOw+c0CuVxrEunA2E8MdeDAAdrDsmq4TYYyizMitIiaCY/gcQqeKN5duySRZt4cjTEijPQXFQqnOE+Wdt9fi5iHSFuOcQ8JU0/w5/Byx2LFkzMpk8LK5zStTuLRvWG7XCDHvctgi+slbkvMh8E6Thy5VMNeQHH3+/iaa+9Oh0J5X35dsYDXpWTAhAefWGSfScfqsrLmVwnTLv/x4eWyuQ0CNVgE+Q4bkbUpE8XwDyywjDKRXq1gfn7eeqVjLbLifhuPIRsjmqT3KQCtKfgs5mSzuLZWQt/+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nE5hHfn8VL/t8o9WHYe9LxU5J0yDdsSMk2IhuzELhU=;
 b=DMC95tBoLzYcnAAgMk09zsDmD1kszgUt/5y8tX04ijD1CvxjOLwwiqKVHk67jTNIEVhrwWDZwNW5QEnp99fAsGii+hn/hsWbADc3/5RXQsRNquyW21bFqXZx5J+cJLkQ5IvOP10zbNjxoJxB9SMF8KgrlMDdTi5Y9Cr/0nBrXxK07HYuAi7QU0JOrBqaV+e5dYKp8X6+dglEql0c2d9DIrl14bhyL/1q6r9vcGbSrpCVyyKwm1N90dv2nErUCx/Is1vUrFnLRuIL/Fh68RjX6+8rO4cGZQI5DKe9tABwUkQSxsfpbux6ciAg7tTJ1Jguas99MpQPXBKIcapGHU/zAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Date: Thu, 9 Feb 2023 11:36:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] fixed width type adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 989bd08f-b0ca-408f-cc97-08db0a897e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FgWNlg86mfigZehyYmRUZ50elWp1xzyyBj2a0msPrhp36J16mp+C5wcRHbYKXXyr3Zv9RnAt5tGM7J4BoYSWYNk9igvCAd3CjkWZy7qPhGFvT4sRFpZQFqnB44j5PUDET194RUP3TqsJKZrmztQM9WSfBx1sr87hGxp4yqTRJ6pj4cwM3I8WIFNYGsPyLvKw9Nbnup5FgcjGMfXwIRj7suy22t1g9+IL0C3vbSNnaiAsOTiiR76daN4sovfYvwh/WukBdQYnKE5WpLJUn+XoQz6OF6FeS5kXuwegNPas/+Mm6oYDerhhiRbi/r0a/gBfZkaz0/XdXrM6oqeK19j9UirByGukRGHGBN2Dm3d7lMLQiXSlPOGdmyHQshXVmUqsrfyTmoE1M66MhY8T7tC2n/48l+bKV4lCCNPvfk4YiTf+Ot2h0Fz7cfVFDFE4pdm9oVBAe97fwNQFKAi21sJeUX3y5ysHAbXLdojUqLeDdDNn4fGSGpmP8qG8jqZ3BX+Z5hfHiY+t8WHB4CPAuV/MGVEa+0Z0OCzl+j2iG9P5xEUk+hIq2NQAveDWSqBNrMRm4VKgjHPweBEyAoE+XIhpW/7lRRXdVUyg3y8sows0yfbv/JFaGQyo+m82rrfzJ+JsbFFfHeoJjY1+lVjeR8nwC/0yKUMx1pjFI9Xa8E6AkcD9OhVUnCdwjRUN97xQo7BtvioRz0TTSUmyQHT9goVq8Q4mZFqR3E3u0KO28qMGCU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(396003)(346002)(366004)(136003)(451199018)(38100700002)(86362001)(2616005)(31696002)(478600001)(316002)(6506007)(26005)(54906003)(6486002)(6512007)(186003)(4744005)(5660300002)(7416002)(2906002)(36756003)(6916009)(8676002)(4326008)(8936002)(66946007)(66476007)(41300700001)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFovSzNxeFkyV0MwRXB6emFDN09XL1YxQzNENm5VTXhtbGdodjkwMlFCV2Np?=
 =?utf-8?B?bWE1bWtCc1lua1hHa0M4WHRJbEpvQkVpbmZUZFFzUEs0NVViSm51SXg5WlpI?=
 =?utf-8?B?N2huRlViRUE1cXpOYUFqbUs5SUFLY2xuQm1HSEtqWUZiR3JQOFVkQ21rc2hE?=
 =?utf-8?B?cGNwbVRLcGVwajAyNHYxSXh1QmRMZ09JNlczeW1iV0xOZUpib3J2VzFCWVhK?=
 =?utf-8?B?Z1ZYWmhCU09EcHo0UHNQZkQ4M0tIdUhheEdjRUVDRmJscUU2V1J0RE9pNFcv?=
 =?utf-8?B?bnh0Z0EzSGYvRzZFSTVZYjJYWHZSNHVtQyt4R1VKVHU3SitPUnpETGw0c2Va?=
 =?utf-8?B?UFd5WmFQZnRFZWxQLzhibHdwVjZmNmNNTFMxZEZKNEZMWW03THM1V3R5RTdK?=
 =?utf-8?B?R0NEbTVCVXNUdWErZVNkd0V2Tm9wNXBBaVIvbDREaU8rcS9KVEpaWk5MYkxB?=
 =?utf-8?B?dGMyd2hvYXpXaS9lV1NNbndtaFZJS0xHbTVZeGs0N01FOHhnc09NWCt0eUgr?=
 =?utf-8?B?V1UzQnBOS3FPcVB4emhzOEpFc3c5ZjVkY2dZUHVaS3hNZ21KRllnQ1hYemdX?=
 =?utf-8?B?VWdEYWdRWlNFei9hODJxZ1BhTnRZbDRIdXdtam9qWG9FMnlOZlRaZDE4Q3hm?=
 =?utf-8?B?TjlxRnlRR1A3dW9nRDVBdExFb0FYd1ZkSmN6dDVOWmYrbWJkNEw5aVZWTTdW?=
 =?utf-8?B?eCtSWmJMbktGV2EwZDNWbTdPRzdBc1hyNFQyUUZET01KdTlZeFlkL2J5S3Nq?=
 =?utf-8?B?TWwzd2FKU2s3d0ZCb3BvZDYvcm14TUZCOUovck9rNkhubVdic1ZpRkZwNEMx?=
 =?utf-8?B?UFhRcFArT2NOWkw1L1RnQ3g3ZENra3B3MnlxN1pkSVcyNFJBS3B6azFiRStp?=
 =?utf-8?B?SUxHQmhFL1R4azAzeDVYSXBWTk9JeG5qM2Z2UDhjNjZaK3lSVk1vM1p2Znpk?=
 =?utf-8?B?d0hzVXgrUFozcnhWUnJvSDJXVEtEUVFqajhzdml1WWg2M0srUktnMjYwVlNu?=
 =?utf-8?B?OHdZUGN4VEJGNDQ4Y2hCMlYzLzVMRGg5MzV2bzlZNGNJcWhFbS9Pam1hUE1O?=
 =?utf-8?B?K3NvSUJmSDlDN2U1MlBVQnhaNVk3TWVHRFFEa3puV1dZQUlmRUE1MHFlQmNh?=
 =?utf-8?B?YVFiQnhiK2NkQ2lpTFl3d0QvNlQyQ3IwT090Vm1jRXI3NlI5ZXpMYVcvTW9E?=
 =?utf-8?B?QUJpRTFGcElOc1Z2NkVLakJVTnQxTzEzMms3TlAwRzlXc1ZLdW1CNUFsSmlk?=
 =?utf-8?B?SkYwRUJvRnJZaG8rOFNNU3BMWTdmZGIvVU96VjlCUzRPdXVvUWVqZ2h6SUdR?=
 =?utf-8?B?Zk1XdUt3akJIZ0FIa1ZoQkpxSjQwWlVoNnlORmdsOGpzUzJwdU9EcXFxN2lI?=
 =?utf-8?B?d1FVMnJhbFpTZXIxRnp2YW9GWlRVbzBMVXM1RDdmODVrY1ZsUW5MOHpIZkY4?=
 =?utf-8?B?UGM4eGFvRTUvZWJjbEtFakZ6T3lnUGR5U3BCRmptQXEwT0RkWGNlamtCZXZN?=
 =?utf-8?B?N2pjUlVnWGdneGhBTU90SXBXL1Zpd1RCNXpyUmpyVVJadVZwWG9hQVJHQWdS?=
 =?utf-8?B?MkFNOFlTMERrRVoxcXlockpST3gvTW5pRW82V0NXTTh2U3cvYjFaUjFmR3Ny?=
 =?utf-8?B?eTBLaDRPMURTczZES053ZEpDMzMyYnJFbFNVb01Qa0U1bjlYKzNDc3BRZmZS?=
 =?utf-8?B?bHhpd05nbFU3TUtybVpvWFpqb1p5NUhhVHpXL0c4MWsyMGZaeDZ0MmNjSU9m?=
 =?utf-8?B?M3JxSko5M3JLa2hyd3JNN2dZUStLaEVUTHNBZEVjaE1nSFlPT3pvL0JqQWNP?=
 =?utf-8?B?bjg4QWduWURRTjdDKysrL1dwdEs4SG9OMXozUndkNU52M3JrZVNIZGdXQXFQ?=
 =?utf-8?B?blBZd24vTlphQWNWWXF4U1ZsbllGeFJEbXhPN3BreTh3NUF0b0h6bGFVdnBh?=
 =?utf-8?B?dDViWmliaUovZzJwZDM2c3BkejgrSmM0VmFaMXRrVzFDcEpkK3ZzS00zdHhj?=
 =?utf-8?B?RjdJczVzY0thelR0TFFxYmRERm1GOW9yd01tSDFmbmtCYTZ6b1IrL3MwaWZS?=
 =?utf-8?B?R0JDRFBjdS9oNGRGa3FmYkcrNXZReGQrdHFkcmNaRDMwKzUyRTJmT2RWMHhT?=
 =?utf-8?Q?TJWMc03a8FL9ACc+xHG75ojto?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989bd08f-b0ca-408f-cc97-08db0a897e91
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:36:25.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOJMHC8XP9i/6I+aRIKBc88VfSwuu+y099yKfGwsjsUuGcWnztJ7nzOAPEJ84EXs8YcKE6PyKB6yjM3+8gkJig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854

Most of this is merely tidying, with patch 2 being the real meat, but partly
RFC (see there).

1: x86/Hyper-V: use standard C types in hyperv-tlfs.h
2: common: move standard C fixed width type declarations to common header
3: ACPI/CPER: use standard C types
4: x86/MSI: use standard C types in structures/unions
5: x86: use standard C types in struct cpuinfo_x86
6: common: __u8 is history

Jan

