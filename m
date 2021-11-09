Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62A44AFC8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223980.386985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSXI-0007Ou-Tb; Tue, 09 Nov 2021 14:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223980.386985; Tue, 09 Nov 2021 14:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSXI-0007Mh-QX; Tue, 09 Nov 2021 14:55:44 +0000
Received: by outflank-mailman (input) for mailman id 223980;
 Tue, 09 Nov 2021 14:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkSXH-0007Mb-Sh
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:55:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c768e4a-416d-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 15:55:42 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-tljIE_roP1CLgFMIOjAI6w-1;
 Tue, 09 Nov 2021 15:55:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 14:55:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:55:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:310::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 14:55:39 +0000
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
X-Inumbo-ID: 1c768e4a-416d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636469742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Vp92BcD+baQjzrMH2w9/HfV7X8ManIWvTPqGE9K1aM=;
	b=VBO9vxsqOFw9PMhvI1Th75/4jSeZcrmVe5lmpdSHh+mgjjAFgzSCdHx2ZC0RAJ4fQ7SALC
	izQ0bd1durLKZ/wnIO85FRtInTLRGkgeBJyZ4pf6u0m8ZbSpnabz0hAruLGQ2Apix7lixF
	E8JqUEF9ScnwFwHoa+dDZA2ElvlCZbM=
X-MC-Unique: tljIE_roP1CLgFMIOjAI6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICsrGyA7x0mVGSjCo2dcPXAdcrFa/s0CLP79G/+yXwfSkOBjLCk45wLCy0rz+49snihOfYydoESu+jsqr0sjZjjtfwK7nET//Mu1CzBc7nUn+F2YhMnhXcp0T7IPmRTauumpGsOMEa9S/8QQX8cbWPW6ybXZ63KymTaoehxaqoNtae091BcXsz5F3PR96Gaw1W9cKGZLKn0aBC9pfRN/ZQtDR4gvY3LEl9/IPWEIvQJlVOSTbg7AP2AKnDTnpyuPAB0CiYL/WEEHHwhzD1TqwqzD9P6hyAvbonUizrKGpZrAS8eqNAxHPvMDDfAH4W0+0JzsGyEwGEiCXHK3zE6T+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vp92BcD+baQjzrMH2w9/HfV7X8ManIWvTPqGE9K1aM=;
 b=UzlVCnQ5Xeke1ApSMEeAnYZl2a1pXeUQWz/ykxWEFM3GsotXRrO/SJWrdcH7lhiIeHcISZBqgguoCbFgLpLeOXCfA5QpC0kWHD/zNJkbAler0k7r03DcWFgwriCP0HQd8hniwDlAyEGeGd0TWhy+2qf3+JLIdKBTJ76AkY4p5ARjz9ZocqlXYnuQPuajOf0DODhf5x6Hw3rKcq1ntQVYPnydDCOAHaaNQPP6HD9ymBgeNWHFIWEYZH5rhE8YGtrMVkSbRGPjHwb7r6DFHvTFT62W54MEDACR0k+WWU3gdOX7MzLfJB2qmeJvJZX/uJtlBbX3jjCN6h4G3q1Tc0zcEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Date: Tue, 9 Nov 2021 15:55:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3][4.16?] VT-d: misc (regression) fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d10931f-6cf8-436b-c5af-08d9a390ff3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43846019C7E13967A634A643B3929@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kh7W3hKh4NlJaFw+2iqc+118MHjVNOFYCzAIbJvm17nz/pqrveDrUg5pDsWD9rncA+8dikHzF/3In7WbJ1aRihJyZS9FEA32SDyrNDCmDUgOVB/SatKegmj4N8i5rNuAoyhyzC1LBT0Y1ZgVOyuyer6I7O7JGQnhKA84P8TusJ0yjz5XCvUekmtifwApvW1MmgbKkxrP7GFPkVFVNyndvxBCoUKppo7JLaMcMIAFwAZt+Ck70bPo1jjGjH8AalZ2/i2180tsYke3dnX8Tgu/IUdpySPqZ00cXgh9SVk4MbGZFOHHcJ/HAMubEM7NtjqNSLNk1A82ov+DUUXgyeZyo/OYX9xQoaNoT2wjcpFvDjq84yNma6LRwLPUJmK138iObsahxvFqTkIcrvV3zLnvhkm9WWEf9kBrZ+RzEBatZhG5ioe61Or3cBbVN7o2tH0p2q+44S9yYq9Avuay78wRlt+f+lCeYaid/xYFpMwhMNGP103pcU2F9FP+em1teNJF8dnjq3ovECx3V2f2f1xhIOAyqTyjLY/WukqCkoVVzKXe8jAedno3hVwrcaQFnvcBbrAgbZ05eDlMgtcg1H6FcckDHugpytn6eWw/lx7NYsBxHUoZUQ6lPAiXpDhiC3bp7/9jmluEf74hudc8YpbU6hn1qWv+F0+BLRxixXRJ+w8ifHc38iO3AfDjLASwbSyZSBgVtTE3ceTWJrIGzBbLN96an84LLIBz3r7D8GR4UKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66946007)(66476007)(36756003)(2616005)(2906002)(31696002)(316002)(66556008)(4744005)(956004)(86362001)(38100700002)(4326008)(54906003)(16576012)(26005)(6916009)(508600001)(31686004)(8676002)(8936002)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnlqTy9ZYnFPZEdITDZzUGNud1ZpT2ppTklRUU5tZCt2SXZxNWplT0VDVE5G?=
 =?utf-8?B?anpKM0hUcC9ieU02Q2JuNXk5aUw4VXdwb0pXZUhhblc2WmJIRk5pTDd6TWg1?=
 =?utf-8?B?akxQZGsvOUFMamhLTkNTaHVzenA3VjRkY0QySE1PWHkrWEhIOWx0VUtQSExt?=
 =?utf-8?B?b1JJTTY1VTh1cEt3b1k5c0dyejI4VFJSdVRZVmJ3V2RmMXdFWEFSV0xpRDRk?=
 =?utf-8?B?VEkvaDdOS2Ntb1l6L3E5YW1vZ0pUMFVrVUlxNG5LbEhBMUhjUmNQTlp6TW1n?=
 =?utf-8?B?Z0JBOEpaa3NBV3crRGorcW5rTzFWZzZkeW5pZTJ4L0NvNTNvZDdzUW5SMnVN?=
 =?utf-8?B?SVlkTWU5SXVRbGlEa05mZmhWZVc2d0ZYdVhWYWtTMTdkZTl6dWVDVmxHMFVQ?=
 =?utf-8?B?RThqYXpwR2dNOC9WK3ZwYkRqMzJDQUVWRnBxRlRTR3NncFdsVUd6OUptK0hQ?=
 =?utf-8?B?WHFxb3VoSGd1OWt2TGw1VUE0azhlRDl3TW1QOEdMd1ZHWldPdzFtQk9qQXB4?=
 =?utf-8?B?MzRKclVPNCtNNHY4OTBDdnFuV2tRZSs2YnBKMjF1cFJrMGc2YWZZMGNHazJo?=
 =?utf-8?B?S1UwUjl0RjJ5SHE3WFN2YUc2RjRBZiswTENQQkcwdkdJZm5ybVd4QkYxUUdO?=
 =?utf-8?B?TittTXNXUkNNVmM5cHdTVUZXbExLRGxnZ2FTbHlUd0I1UVRxT3lYTU9xM0hN?=
 =?utf-8?B?NW1iMit1dDFJWjkzb1A3WnpUZ2VaSWpFRlR4a00xL2l4V2FWVGlMejlsQXFh?=
 =?utf-8?B?c2RNRkNVZnB4RzcrU1A0WTVvYkhwQ0Fta2RkOWFneWlvOTJuN3VobjBSVTNq?=
 =?utf-8?B?d0djVGVwMk5ueUtXcE5kUW9HQ3BzdEgwc2ZyeDgrcnpqRmRlWXJLK01aa0M2?=
 =?utf-8?B?YU9XOGgrMnYrUVVta1BRTjRIK1QyYUJSRFZyOVRQNm9UUlEvZUtRbXhQdDJY?=
 =?utf-8?B?Ny9hSEd5MlMyWmJkemcxN1BhdWIwK2MwZnZSTEYzZEk0MmNHbi84b1dzMnhC?=
 =?utf-8?B?WUNnUWQ3ZlJqREVmY0p0bjg4aHE1eWtoVFJsS0hLQitYZ1VkcUtBQWk2QjM4?=
 =?utf-8?B?NHJqbnlmSlQ0bktRMVd0cXRQVEpSNXNyRkJjUk1XcmQwYnRIWjdXL1RuSVFx?=
 =?utf-8?B?eG0yNml2K1lEamQwNFdtVjdGYWgxdmo1LzY3Q2pheER0WkU0QlhYMEJieVph?=
 =?utf-8?B?dHVXYWVSd1FYdHBjYnk3VmFwVGdBcStMeUZQS3pLc05hc2JKZUVzbGlkb3B1?=
 =?utf-8?B?RzEvdUFiZTVHbFNyWXlCTlYySFNRUEZGZmdWWkVOSXNIZUdhMVdZd1RlQmtJ?=
 =?utf-8?B?ZE41RWEyMHJFMUdwWHRrZU9lK0VsaXJFWXhKWWl2eHhsZ3dKTDg5MlNhdFJh?=
 =?utf-8?B?SkNzVFBYakVydDVhd2dhU1dVSDlYSzJJeEdQNldKTnhta2tkalNkWk1ZbWtW?=
 =?utf-8?B?T3k0b2s0MzhoMDI1WEZPeFJxWHpYWFdBUUVaUWE2Y2ZqeFF3ZmpNVXpSWHdm?=
 =?utf-8?B?WTMvcytsUVFkY0tQVDVyL3RONEpoWjVCQ2JvVTFaSVdmOGlBM3pNS0tScFVP?=
 =?utf-8?B?RElTcVBiZzVySzFWdHVmV3hRM0pYRzUxRkYva0orcDZUUGdHcGNkOUt6Tjl1?=
 =?utf-8?B?NW1wZHNscHZlTzJPcnFZQTlteVFqbWoxeGVMM0U2OEFoN2pIeFBBb1ZZVThn?=
 =?utf-8?B?aXVaaVhzd2RNUU5nZDJHNE1jYldWTHB0SU9TRXZhVmsyVkJpZmVtZHVXWFND?=
 =?utf-8?B?UkNYSllGYkl3b0RPVGo4MzRtZm9LTTc5am5KSjIxSlpESnhJSzBtZHE0U3VM?=
 =?utf-8?B?Q01SYXFuYjlQV1JmeTZsSGx3bzRMekg5UGZGcHc3UFg5RkRwd1dnYWdteGVw?=
 =?utf-8?B?azZ1bFlVNmU4bkNXM25BWm41QnlmMk1HZmNWKytuN2Z3QlgyTVhYTFkycVRZ?=
 =?utf-8?B?RHlKVCt4cmsyRXgrL1lzbzZ0OWFFZGZmUGg5cWpsbmwrUTVwZmlkRXlGWDlw?=
 =?utf-8?B?aE5DTjEzbW9VVytyY2ZDNVFyYkVDYml4azFZTVRZdEZIWWJ6bWtIa2hEQTYz?=
 =?utf-8?B?WDJFbDFIYU4zcUQ5ZWlXL0xWejFKdnlPc004YTBDWFowK1ZYWWpjUlUyRVFK?=
 =?utf-8?B?YjZsMVpQT092NVV3TnZhK2ZzVGUxUFNSSWJtcWVJR24xeVJDbC82bzR2Wklk?=
 =?utf-8?Q?o6zmyZEDMwIJ55Pr/Zqm9J8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d10931f-6cf8-436b-c5af-08d9a390ff3b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:55:40.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q55ayRWv0n9Z2q7DdUiye6Ng4efAe4tNU6amniPSJUFlHzhv7Mwj9g089EER5d09r+SYuxbc4HbYluwNaftlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

1: per-domain IOMMU bitmap needs to have dynamic size
2: fix reduced page table levels support when sharing tables
3: don't needlessly engage the untrusted-MSI workaround

As to 4.16 considerations: Only patch 1 addresses a regression
introduced after 4.15, the others are older. Patch 3 additionally
only addresses an inefficiency; the code we have is correct from
a functional pov.

Jan


