Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C825EBED0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412356.655630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od74J-0004YS-Eu; Tue, 27 Sep 2022 09:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412356.655630; Tue, 27 Sep 2022 09:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od74J-0004V2-Br; Tue, 27 Sep 2022 09:39:59 +0000
Received: by outflank-mailman (input) for mailman id 412356;
 Tue, 27 Sep 2022 09:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1od74H-0004Uw-Ro
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:39:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a0be4a-3e48-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:39:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8111.eurprd04.prod.outlook.com (2603:10a6:102:1c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:39:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 09:39:54 +0000
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
X-Inumbo-ID: 58a0be4a-3e48-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if0Bnx5+f/efCn+a1maG3bCPzDFPFCpXlNRAP7e27Hzy+Isbz1yvbIL95iHOdrDLUmXHDGdCs2LWrl4QOoPnUGXVmw1pKAM3XdMcwSkQ3OgHiYGlLFQBgjpQGr5kF6TpnpaFHTdDcNtz46vk+9tST5VuxgIRak6sLQU4dJw2Q+H+foNXYdu7Zut8RgOJviPp3Z6qA19jpYffqVaB8fNCCxa14OBlfpz14yn4qkIVFdFPJZrQHot0vk+tGl2S6FNBozr+MWw4qohokjT0KetERxIxbnYPO0Uya00FWm2vk6myjOkjEnDiFoSPDenkAQTuoUFhibfoQCEJfCLvSpkq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9kFhuTcFtVZ1SWWyJmIBrW3Qdox9i1MyNKA5SDvbRw=;
 b=Yk3Ty4wIUx04YQXLGAKhTaHpROsH9+xomBDj4nfo/HWcv5Rhnz3bykJIkNY8Eqbiqh4rNM09RiL6wzH3b//CpU7StpZ7typxi1eneMtBCz98V+0W2RElEPSjE1x27+TS1naAHhXBo54KYN7+H6GsS6cxdHQSC5v8rdF2QEEyOYxBvL0TgGf0CI/XO2hplcnKL9HhYkT1VLFkC6nkkM5VDNJW6S9NicyIOFacAm82RjuJbjfB/H8mtv3Lti2MPu2pvlp0O7HiWXsyJeX0B3X7s5/kBcuUk1fWzcgpVREqJbYShU7vPxLAKaYXICU0HT6bi410LjYimCmdO+HX9PERaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9kFhuTcFtVZ1SWWyJmIBrW3Qdox9i1MyNKA5SDvbRw=;
 b=i0SumFZLDA/ZWwg2fSOg8Wd3yHuHMi4XdIZxWtHPfpz5fw/XpKRaNV7gs9n7iY6W7A9NpCuJ+mEI/vbcH/0VnbBAX8tPTTkPsRMJX9YVbRncq8t/88d67KQRWCD3EqW3s4isFgE/+M2uppXU/eGFieEGkdbr+t+E1DIuPm36LDolLV63PQoerREAiDyCR9LgD27K7IxkbnrqJLnxyaj2hfyqTI8q8kKy/0EeAA2yfg/wQTb1m761DcQJFjXuTsjLc217Es9l592WFSPxfYSz99tV44tHZlr9Z4sNTi9W8qtPaOad8gB4FzWOJ8ZD8azJdaKPDz9mgKDR8LJFbpgsEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <504534ec-32bf-0bab-7a61-86d75b6e1f71@suse.com>
Date: Tue, 27 Sep 2022 11:39:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
 <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
In-Reply-To: <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9e242b-3a5a-43a8-a92a-08daa06c3b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ceXxCP6j674oXpv92qKB/RHVvQRXiFT35cPiSfE/k4F8C0cThU3ZZTZw355WN3gDqDLKI2kbbN4tNYZv56Lghd1svnW12YqaF9eueeQjAagmCGRLg7a1F1QGnXUP0gV3NaZgD0cIJyVHBQ78/v4BKa6JFwvzmP/BRMpkcDQiudFSg3pxmfXfdHlj7E4sp/sK90qeOBC06mddclo+pIZFlRhE4DmqeWjuv4wFTV8KwxpXQs3HEuB0TLBo/MxvRf9cHXPQYpKROKEwqqQT/gJ5VkTIaAxNjUiqBPeJpHrk+NamtH/OWnE6xvvFYN6aZPtRdmwuzDfOj6hp6mxpEVry9YBXfjs5w0qmN0WTiPo+TB9liCYmjFFbS76Dg7RZMYnkRHVa+gBRFVt4WM60DhJ4Qah+wyxQyyhJMMZLa/cMd+ji9GNNG7yG+4qMuA5fYLtEm29JIQLQIhjv8CMLfPk/k91dDEG0/LWYB6Z3APXuxZNcw/7L8aSMRvhlDoFhbf6xoFBZNTLeVDPidb+hJP6rpxGOzUh2jrrn+ojtg0e5YY46BdKrEVlmzwYQzM2xW0cbx/NmQVlFTGCkyYnsZrmbPRdjYpSwKqYiR8yojclqBZnZIxzHqpRygSgtKSeg4E9hpoJdcoN8hmsTZUEXDicf94Z7uIBwDSSCcJzQz/engkbnOxVRLvzFOWSqv72sEGxHIq6MndIXBPgRX8wzW+IMOHVN2N/CJ3XlRQceNLmmkzdcbVvmnanmZOOwNwmrZ40+g6N4FocsqEVMMBPG0KAnaZImVvmW6Y2wPHoI0+7q2Lc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(316002)(478600001)(6486002)(4326008)(66476007)(66556008)(66946007)(31686004)(8676002)(26005)(5660300002)(6512007)(6506007)(8936002)(53546011)(186003)(36756003)(2616005)(2906002)(41300700001)(38100700002)(31696002)(54906003)(83380400001)(6916009)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2ZUNXVDMmsrb2tVZFpxNUY5cnVObjNMYmZwSDcrU2I0ZkcrVW1QalJaZWJ1?=
 =?utf-8?B?MkJEWmtzTUxEVmFjSzlNZXlEb0NTYTNVZUhiTmhqMzg2WGd4T2pNR1lSanVG?=
 =?utf-8?B?aytPeG9NdXB0TkVPWU1QWEt0MmFiKzMreUJQK2ZOL0c1R2pyNE4weTN4OGZC?=
 =?utf-8?B?MjBpSVB5RlNNaUZlVmd2dDNGT3FzYjBlWEZML0lLbmVsTXNHTXk3am95YnBa?=
 =?utf-8?B?c0c5RXQ5cWo1RTkzS2tXbGNzRFNxU21ZK0JtUWZsTXdJdlZ3N0ZSRzZhVGNI?=
 =?utf-8?B?SE5BQnlBWkxaQm5sUVNxVmtWa3I5eUJiYWxtb1hyYWpJbUVuY2E5N3JhRXNh?=
 =?utf-8?B?Sm1DZU1Tb2pWZ3JRaCsxczQxQmloVG9lQklUNldralBRbnhNR2ZUS2NqRkFI?=
 =?utf-8?B?dVZNUVlndG1oclJhbGUySStHTDBVcWNHQnRneUYxSTFnMjIxOUZ3WXIwaU5u?=
 =?utf-8?B?V1czOFNBK04zQksxRnRkbDZwT1ZvbjNhZ3RZRGpwVDJ6RnBJLzBJMTNsMWxt?=
 =?utf-8?B?aXU5RUg5Si8yQ2RDcE1kWHBHcTkzWm5EaXJLdGxuZHRxdGZnWXRpWXliLzVl?=
 =?utf-8?B?bW9oalNGUEEzdlNRNHNVRllrWXV0ZGROSVdZempFaDh1NmNUL2p6RUdBNDVz?=
 =?utf-8?B?S3dGNS9oWXFKN2dEMUxXOHZGZ0UvZDZEWllPeHRtalhBUVA3U1l0MnNqUG9D?=
 =?utf-8?B?NXd4bE1xRGhxQUs0VkpYQW1ST3FkZG5penhIbWJmN3lVWm5UKzJ0aEJLVE5P?=
 =?utf-8?B?YW03ZGtLN1M2RTdVTEh1SXMzN0lMS2I4dGR2NDRKekVhUVBabUlYTGUwdEhX?=
 =?utf-8?B?cXhzcnBCVmZIMW5KNWZ3dnZEa2xjbi9MVXVyd3lycGIzWlVCeXpxZjRlZEw4?=
 =?utf-8?B?WUxkbXc2SVBKQ3haajdhUFFCZ2d3L2Jnck43VFBIajZHcG91R1NtMk9uUUoz?=
 =?utf-8?B?RWhVakdXR0Qxc3A5TWhOemRHOHp6T0FidVRqOStKbDB1ZjBtU1NXWjhrL2ZV?=
 =?utf-8?B?UXNXMUlldmpBVHpyY092R0RPaUZZcWx0TS8wWTYvcjNMWnp2R3J0MTFqd3pZ?=
 =?utf-8?B?YVJDTWFRcFQxWmRnbnBEbFdHeXc1R2ljdlYydEV0OVBsUHpDT2Q0SzB1R21j?=
 =?utf-8?B?bDZnK0F1aFIxeVRGNnRkZTdhNkFKRTlPUTVUZFJPdWZDYm82b3VnTVo4MWtQ?=
 =?utf-8?B?OUl6ZEVKRm5XQ0xYc1UvbWRjcFllcmRQNGlyRXpKUjJlV0JpZ2p6SWJ1c0tC?=
 =?utf-8?B?d3BBWGpFMVZWVW1idjJsVjdxWmlXYjJKTVlIemEyc0QwVlpHejc2cUNXcWR0?=
 =?utf-8?B?Vit1ZmljY0lTaTdCbWZqN0hTNkFBKzlvWVhlM0gvcHhpZUQrRENxck5vRExj?=
 =?utf-8?B?TWFrcTRyUExCbnVzdGNYZVROeDlnbXd2QXBBMERQTFNxLzI1TlFVampaVnhJ?=
 =?utf-8?B?bnk2Z1BTeUNIWEZEcXBBS1NURlZTdURWOGpOcjdlU01NMTVzYXV3ZzVPUXI2?=
 =?utf-8?B?d3Y3OVZhYm1EeDJ5MDhMb1hFM1NZbVcweDYwVldGL0c1cCszd1RNRmd4M05Z?=
 =?utf-8?B?WGlnMVpuQTd5UGhiRElsUG1VaU84dFJUVGtNQUhpYnQwM2YvQUFXaVNFbGtz?=
 =?utf-8?B?U05WdDR6VlBzdWpmUTlmcmtKSUxXOWdjcmp1Tjg0NWlYejA5d2xCSmJrQytK?=
 =?utf-8?B?SFlGWjBOSFIxOFp2RFA5RVVOcVhGZ0JseUVUTFZuMTFCbDNsNkw4dzdCMzdu?=
 =?utf-8?B?VUF1L3BqZGtGbzh1SmlnSkFMdkVXOWNjRGVSeC9DYjE2Qks2OTdqT3p5VnBF?=
 =?utf-8?B?ZXV1WUd6SVpFdDlQYXR3N3dleUdjN0hXbGdnM2d0QnB1eFVzVWVoR0R3Q2Z6?=
 =?utf-8?B?M1F5NEVNYi9UNXlETlpYUjBibHB0dHh1UFo3UXhidEZyK0tsVGRuMCtwK3hV?=
 =?utf-8?B?WnRPckllMUlYM1Y4U1VnMitGR1ozSjNjQ2JCYTFXRUlJWVdDN0VkVktXY1dF?=
 =?utf-8?B?cDdtM0RHeENVMzhtd0RmK0F3MnB3eWxqOUJ0UHQ2S1A1ZjVsMlBBTHhISmx5?=
 =?utf-8?B?Z0FTUWlEWEVONXpmdGJQM2dtZGZzU1N2cnhoNFlsRzZzMXh0VEtObmU3RlRp?=
 =?utf-8?Q?c4q1PGL8vS4+NY87McwOVUo1V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9e242b-3a5a-43a8-a92a-08daa06c3b73
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:39:54.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfqH92CXBKKvoNXivtAY9ANUbOzwhpEtOQdarTF8/hzBIKgHh6GCatIm4Cszko/7V6kgW32xT7cENS66NeNkKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8111

On 27.09.2022 10:19, Jan Beulich wrote:
> On 20.09.2022 11:12, Wei Chen wrote:
>> +static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
>> +                                                  nodeid_t numnodes)
>> +{
>> +    unsigned int i, nodes_used = 0;
>> +    unsigned long spdx, epdx;
>> +    unsigned long bitfield = 0, memtop = 0;
>> +
>> +    for ( i = 0; i < numnodes; i++ )
>> +    {
>> +        spdx = paddr_to_pdx(nodes[i].start);
>> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>> +
>> +        if ( spdx >= epdx )
>> +            continue;
>> +
>> +        bitfield |= spdx;
> 
> Perhaps to be taken care of in a separate patch: We accumulate only
> the bits from the start addresses here, contrary to what the comment
> ahead of the function says (and I think it is the comment which is
> putting things correctly).

It's the comment which is wrong - it wasn't updated in Linux commit
54413927f022 ("x86-64: x86_64-make-the-numa-hash-function-nodemap-allocation
fix fix"). Our code was cloned from Linux'es. In fact when memory is not
contiguous, too small a shift value might be determined. This in particular
also may matter for the lowest range covered by any node: On x86 this will
always start at zero (and hence won't influence the final calculation), but
iirc on Arm memory may (and typically will) start at non-zero addresses. In
such a case the first node's start address should be ignored, as it's fine
to (kind of) associate all lower addresses (where no memory is) with this
same node. But that's now indeed something which will want taking care of
while making the code usable for other architectures.

Jan

