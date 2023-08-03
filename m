Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798B76E508
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576158.901987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRV1Z-0007Ef-V2; Thu, 03 Aug 2023 09:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576158.901987; Thu, 03 Aug 2023 09:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRV1Z-0007Co-Ry; Thu, 03 Aug 2023 09:53:41 +0000
Received: by outflank-mailman (input) for mailman id 576158;
 Thu, 03 Aug 2023 09:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRV1Z-0007Cg-2U
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:53:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8d1b21-31e3-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 11:53:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:53:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:53:35 +0000
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
X-Inumbo-ID: 9e8d1b21-31e3-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSd1e+66fk1F1OlY4/VSUquaXhxZlLxsF7WoPt7mL92evXOej89xpfJMZFd2EV0BEhAeKj9TwdgpXo4UmpEdkJeCsBET/x7Kn3MPNuCnS8cj9I257/WFOFW6ZJzjiN3Z9qX9L++YGoYIMc8w8c1HXSptPhHPKAEXtk1taKzSQnVEpZlipJD/ILAGdrqhQvlcCHxbpCcOf8WZORnlTHv1Cb23XrsOOmTwZBxHaD/F6qVf25EivTKcteOkrfIWV1kjlEtlTHcynCHDqWp+EViBI9WcPNsOjoCCRXeucK7Jy1jJYfTJvO9FVrj9wUiZiYghRjSsTgi1Mhp6ioDEZArxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+/SplQubp7bsJRDx2BCsiBz6B8hWfpy15gr46xSccY=;
 b=Q8I/NAWWqhuPDDaWkjwJootpzgwSUyiNUHKkKLndjePsdqHqzLf4HOG3yMNE6maySWKroqIi9D45dfMh4VwrARW1GikmiTIYJrjPtHf/Y67r1hOyWWiC3Kxn3R5rEqvVFa6405Yn8WIuQD2zQn5kuhjYIe7Un7FUM4i9HVW5nUD+LeMsoFQBTyJYSkRMB/fN/a9ygUHec/py2TrsFz0Xj6SQ6Nz9Ycr7+LrN0Ruia498Hmw4Sz29T0s99KppPFhnYytEA9azTiBUch7dmz60ktvrKr6kbogAxAnunWDdJ6SqFSE6c8VNbYjBYr54kOyLDFUNi2Nv0ButOuajH8iv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+/SplQubp7bsJRDx2BCsiBz6B8hWfpy15gr46xSccY=;
 b=WTQ2KZ4MlLpmRkeK6CqzdA3dN/o1I6sDzLfb/bLcCcUtVyb78C1aS1IE1cC6Su3OTxmKS855PNk+wCNJjtHCPpHpn0jOAvs9/makgUgnUkxcA0QG126qbDYXKOug9rHgDDxh40x6ZQFieK3gQVqfh4WuKz9YyK8NyBEpfLFcaCrKSGJxe1Gq2wC1TLMT21LlkYclkzLatGAKkbVx2EM/wtiod6WqDm6EoAdq52NhwULSMHPh66RmMJexChWlX/fk+sGezg1tIeFvJX0uOuho+J35A7ec+buRUe720siyD+icN17xaB9iqhSj9l3QFzDd/7dRsUwf9GTVS/IXmPwJ4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b82f46ab-d91c-c4cf-faa1-8a78d120fb73@suse.com>
Date: Thu, 3 Aug 2023 11:53:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 2/2] tools/xenstore: fix get_spec_node()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230724103324.4207-1-jgross@suse.com>
 <20230724103324.4207-3-jgross@suse.com>
 <5aaf37aa-cb7d-59e5-5e0b-40fa73177d35@suse.com>
 <a937b261-d42d-888f-7460-ed431b725c45@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a937b261-d42d-888f-7460-ed431b725c45@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dbda1e-38b0-47e7-66e6-08db94078112
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ToyvH2mByXmhCr1MpkrTPGYTPRjdip2m7IHbEmz9joovJA05hNymGcDRVVrCujJN1H2kbk7oT23JnsQ4oY3Jvy0M9oRedvR5ow29RTYl+5O9/yN9G5mbk8SbMqUCClZ9L/LslJ3+E6/Nq+24OUyWy8+UmZzUn6XKnm9bl0ADWEzhyMDqaeMtYTx00Mq94Qc3AZuq+rOep1Bh6gMjB1U1PLV6KMtYRiYGZybE+ZyISkhT2FvWh+Av8f+Ni1BurxKLdJrhIzEV0bF8VG+mIcNmbxEMqO7+yDfe2RGo10NqMoUylvzjn+fpgvl533bRC8Qa4+ljkIWBWD8HEmfOzpZKqwyIhwVIAj3kRjN8WMheIExCuO3BwiO70Xwxurzdw/gtqk06/UuTxr7q1ZYz/+oTlOi29MQONYRb42JH2dFncTXPWEn8SZ6cGVnc0ltauAmGVEWzAUNvdakd5oOhGfTpMQstFi7gl/rgtvvbfPGCmOgyMlpLLfn4Tc5Ryv3i7tfetyXAV339l9JNn9ZPY+B//paBGqZyXCTE1F0Bhjquz3qXCAszZyVJKEynT8DxBV0IlTV+kgC7H+l4pxIDPrt9p7mlXaDbIjgXL/artarUEASSoyCphy1oEbRpdRGN+b1HiNgEaasg3ZpMm4ZMXZdujA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(41300700001)(66556008)(316002)(2906002)(4326008)(66946007)(6636002)(66476007)(6862004)(8936002)(8676002)(5660300002)(38100700002)(26005)(36756003)(53546011)(186003)(6506007)(86362001)(83380400001)(2616005)(31696002)(6512007)(478600001)(54906003)(6486002)(37006003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBYZmZjTTQ4clBUdjg3RjdFNFNUWVNiNlNpaEh6YUxrakVWNkQxNzRjbm83?=
 =?utf-8?B?ZDdBTVg5eG5NSldYcTVlOUtZTG95K3ZpT1ZsM2E4Y1ZUUWVNVWI0L2FwTXhG?=
 =?utf-8?B?RXkvTjlZemNFcXRRVThHak1MeDVaWmM2VG96ZnMyZGV2cHM1RTFaTWVQY2py?=
 =?utf-8?B?VkxjakdkNHVPL095NUkya0sxQXR6d2dPMDVDVThwd3JPTmVHSDdGcmRjNW5H?=
 =?utf-8?B?eHNSczJpYiszMWVkb0NQSWl0UFNnajNrZmJ5UDI1eXFuckRvbW5LeDNwY0Mz?=
 =?utf-8?B?dE1hME1iaGM2dUVEbnJZcXI4OUx0MWpyL1BCWGhSNGhPNUY2Q3kxNHQ1TUdX?=
 =?utf-8?B?YkZMaVF3OS83WWVYS3pFRXdsZUJkRlBCMW9pdnNXNjVhcW9BL3V1b0VCcTI1?=
 =?utf-8?B?dGM1TnIveDQ2amwvTW1uNTA5VWNFbDJXWkFsdmFZM1lzU0J1b1lRVms5QzlC?=
 =?utf-8?B?MVlKN0plYmJqTUo1N1JweDBsRGxZbXh6VmcxZmpBSkxVanY5WkdocFgrUjdQ?=
 =?utf-8?B?T2xnbTdvSHFFNTdUeCtOajQyZDBkaFZlZzZua3RkaFBTd0VsaHJoZ0ZlRGVz?=
 =?utf-8?B?QW5IOE5DVGcybkNlOGNLVldOb0xaY2RXUHIvYTdrTG9pcTB0T0pvUFhTL0kx?=
 =?utf-8?B?UWdhR0lSdW9HMzc1a3dRSkxQOXQvaXhPSUg2UzlWMXJkalgvb0hUUGVxVW9U?=
 =?utf-8?B?VCtubGdPY2tteHpCOVM0ZlNOQ3NzWExuQkg0Ry9GNjNhMEZkWG80eWZXelhr?=
 =?utf-8?B?NkxFYzBuOHhLYWNuK0w4NURyTmFuRWlUQmtXaGJjTnZ5SXNaWDQzdzRuNkdR?=
 =?utf-8?B?SWZhLytXWS9GaE9XZFF2ckdQemJWZE8vRFRsanE1UW5HMHJGQTM2R1oyVXZO?=
 =?utf-8?B?aTNrMkpVVVFWVytJcjdrUjcrc3NGT01FZWE3NlZONloxQUpYWlRqdktRVWN6?=
 =?utf-8?B?eUFtZDc3RUxHc21pTHFFMDc1L1ozYTBUYm5UaEUzQ0Myd2JIVi8rSVNEVnVt?=
 =?utf-8?B?ekt5QUl1MXlFQ01qNW9kQTdVbmlyR0hJS3V1d1k3K1hacGlodmJNZkU2RWJN?=
 =?utf-8?B?VFdTRXd1VHR2d0VaV1hzMEErYU9MT3FNaDdCSFc5K2ZDbXIzbzV2WjNDbG1P?=
 =?utf-8?B?TE5yVDkydGUrU0NERnBTM0hRWUJoSlZlT0I3M0lUWk5wUnJSS3Z5Z3dQNjZo?=
 =?utf-8?B?dkJBTlpNZ3VLMUo4UGlnZGdtREY3c2hteGw1MzRoN3VCM2FucVIyaVhJV0lG?=
 =?utf-8?B?V1JjRDUvVXN0NC9XR0N6RkQrSy8ySk4veXIwNkVQRGg1dFp3ejNUY3kyaWpl?=
 =?utf-8?B?ZXZIaTI3QXpoMWhNUXZIU1c5NzBXeHRDTWJLWnZ4ZHMwL2w0VERUTW5YUzlM?=
 =?utf-8?B?NlJBSVZjMXRRaGRwOVRQNEFXbTI1b2tGUGJ6M0FUR1NXbGhMVmkvZktHSEVl?=
 =?utf-8?B?czYzdG1lS3hUUExwcno5V0JqR2FBQ0pySEtsMlo4T1FRSXl1UlVGKzFMOGcw?=
 =?utf-8?B?YVZDb25IUkNpcmQxdDRvdjJ2NWV4emVGY3JGMndoSXVGQzJraEJwckdnODZO?=
 =?utf-8?B?MzFRK0lLd2xTLzJMYkpIOUZOZTJIOHFaV3k5WjE5SERtUG02N1Q0WisrbStT?=
 =?utf-8?B?TU5hS3Q4dmVSVStualByczAvRlgvZnZRNnJCL0c4RmY2OHBEZDV5L2YwSGdO?=
 =?utf-8?B?UWhsVEJEcU4xVjMxdVNtNUIzVUo1amgvdW80QS82djFrcmFMKzNTcGhTWjl3?=
 =?utf-8?B?bXJucU95YU1HMmR5STJDQ0tjdVhQYlVSRXVxZC9qMWdibDFPaDdlWTlGNzJp?=
 =?utf-8?B?WUxEc1hkVjVUUzNrNDVGUHhlT2FBTHdOb2hOOXIwS09sK2J2OGhWR2lqZytX?=
 =?utf-8?B?QVVwbkhsRysyWjVrK2RFdDZySjBwVFNiTlcxMkJEbmZaTjJlSVZQM2I0OVl0?=
 =?utf-8?B?eHRydzIvSVp1QndVcm45SC9pZXVWSldjVE5yNlZBeExrNVNyNGliQ1FUVkJh?=
 =?utf-8?B?bGV5cWo5ZWJjOExvOTF5eUFGaXdHbVFLVnYxMUhnYWNURmZCNktmOXdSOEJv?=
 =?utf-8?B?NTBaZlBoT1NtMFhqWGthY1FEMm94WkMrUloyMW84NHlxaHZ4RGgyUm1zcy9v?=
 =?utf-8?Q?qI0dtS7DNgiE/Dxe4mOn4whIa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbda1e-38b0-47e7-66e6-08db94078112
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:53:35.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VraN7nLlohslcpP9n7hbAA2AFnMG75gplVpZItuQlxk9mhNQIdAYNCTy/R+GEW5nIov+6Qc22ukYPxXnwF5Atw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186

On 27.07.2023 09:55, Juergen Gross wrote:
> On 27.07.23 09:53, Jan Beulich wrote:
>> On 24.07.2023 12:33, Juergen Gross wrote:
>>> In case get_spec_node() is being called for a special node starting
>>> with '@' it won't set *canonical_name. This can result in a crash of
>>> xenstored due to dereferencing the uninitialized name in
>>> fire_watches().
>>>
>>> This is no security issue as it requires either a privileged caller or
>>> ownership of the special node in question by an unprivileged caller
>>> (which is questionable, as this would make the owner privileged in some
>>> way).
>>>
>>> Fixes: d6bb63924fc2 ("tools/xenstore: introduce dummy nodes for special watch paths")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> I've committed the two patches, and I've queued this one for backporting.
> 
> Thanks.
> 
>> Can at least one of you please confirm that the earlier patch is not
>> intended to be backported, and that instead a cast will need adding in
>> the backport of the one here?
> 
> Yes, that was the plan.

Hmm, looks like the offending patch exists only on the master branch.

Jan

