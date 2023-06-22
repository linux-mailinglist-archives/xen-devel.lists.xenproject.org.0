Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E0739A90
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553404.863934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFyh-0003jO-Jn; Thu, 22 Jun 2023 08:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553404.863934; Thu, 22 Jun 2023 08:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFyh-0003hf-Gh; Thu, 22 Jun 2023 08:47:43 +0000
Received: by outflank-mailman (input) for mailman id 553404;
 Thu, 22 Jun 2023 08:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFyf-0003hZ-Uj
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:47:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70299849-10d9-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:47:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 08:47:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:47:09 +0000
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
X-Inumbo-ID: 70299849-10d9-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKGSQIvQvuk7UrhSG7aOibMz2dF1D0spS6KQ7JXFTaEVqEltaShHC2fpTiWNlME5pz6ZeyYcvRwzKOchSO3KraUiWpcqP8ImnZYZ1R3cOX2ZNPNBdiN94FdJkE3WLB87Q96c6iNxoZM6py//rv008DHucHy8B1IBllWL1mpMVVYncfPnUTRycl7uR+OAzjMMS40Z8mF18IERoJ+MrOlTcIk7BXtaRV50uRjOp8bsc0YPGFWJgoF6bP2fJAnJpB+hbaxWOMnJfFIweKqjwGV5tap0N5xvgMT8fDERM18DpsGQ6x829KwRpTcYRC8BrtssePAXpO2+9VDXBvHSfgz+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWxRalE6eMZteR+B+PyDdNmd+8tSSz2Nan47LSH2Vac=;
 b=dOpZzzonjufn/Issnm0/2+ShuUq+z0AghrG5jnpc3rkdHaX2iH9xX9VlK2yv4eL7eGLd7qrD7qigq1wu1FNi0g8syi8BGP6+Z2HHH2Ecyk4kwbwmViwbbbZmPqFZAODNRkSUU3oSyM82Vu/6lKDNXwqnUqzWAt/TiidBvvb85LEGJJm0u7dgwc1MGW63w8YroPZ6JcrEC2etj+Bko2LLYGTz/ooDCeAAbC3C/yifdEn1vR7tMoWrD+IfhDEtZLYLlx8CjerpkSpqBniQBs2Meic56/YL4PaoiyaqLrquIsCUc9Q+kGxl7lmBPApbFH739O9FyVMmizxUsy+2gwbTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWxRalE6eMZteR+B+PyDdNmd+8tSSz2Nan47LSH2Vac=;
 b=NsVa7z/5yGZqDB6+h387xkcF8M+DTFctdt5AjfEFVjUEsiOX5TI1Zwgvw8t8ZPYLr1ZQvtCXem+DbV4Dl+dMAlkIQlLx9/8uPU7tmjicVvL5Pq2LiJu8G1KbKmHwJzvEODZuAQ6OWtKjW7d+K3vLYl7rwSpGbh740oJMvo88nKz4sSyQA/r+XH8y61Xd7s7ey5xu8bLIRXVOg5eRsEB0vis2ucVnBuhF7+N2jVTz5M7AnAUnyq+64ezhum7+8WcvxZG4NOBKx8OI6UsNubTeC3VAbOoqm14WGtMTuL69GFyVYNLgIDqQi49gom91K1IhapiXjAluLLqwWX1/HTh2Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cde4125-9c67-0686-1d82-07921420e904@suse.com>
Date: Thu, 22 Jun 2023 10:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] xen/include: avoid undefined behavior.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9d222cc83013aaa67b45638b27f5975b60aecb37.1687332385.git.nicola.vetrini@bugseng.com>
 <0fcc228c-548f-9051-b8ce-4d79a3d8293f@suse.com>
 <6b0ca17e-d6c7-f7f1-e4b1-26977008b873@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b0ca17e-d6c7-f7f1-e4b1-26977008b873@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aedcca6-3cad-4d66-4872-08db72fd4386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5j2QXWvAZ2+WE3L5zrSUvO2iD4gZqHR2hLiPpAv0xe7z/Tx1VD0cQNEaH7VftEAjHh8CxTfuoUludIM6miSjwZqwIMbCehDWBoRMT+jMWmuGIunz3VOiw2t5J9NzEnDa5LjX4v5mwJ7EegUEK8WRJAg/V86buQd2bIRNixlWsFkNSLRSB7O0qdGgaz8UO14s1QBrWua9jsUPyPgzcbbv6ZzAV57cA7n3M3ha+lMpBQojHxps76NA74PRa0wfb/eXbf6Ooh5oCEeB/JE4RwfIIF3eUJfELnoLkOyTL4MYsE4YjN5s2OSFCv2f1SF+HB+71f2r/waUOX0QIGCV2eFn+UyQAzA1UoRWtCLWef8YjDYkBpYszF43FZWD62hZH5AwQ/2ctTHyN3SkzyxCfiIEx4/t4hYtea47Zk6O2Onxn6ydfXjwi9JGTJS/AXvcShIUcRDUMZBzMbjaRaLmEXdNI12vh+NXPlf/yYU4Pdf6TjWMmt6ToSwF/w6e+YiogUrVPinqx9+5Ct/O6qsVR3wjwhvzLCSuaxFw2C+QkxC3huzwSbHIU8BHnGAQ3J/v9z0Aj5Qu17OcfbKg2NBQAweZgA9u/8l7tiYtmr7gFeitNvMYWWNMYPuDUqqIttK23bt9I375svFNcj2Dupkx/UNxHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(6666004)(2906002)(186003)(4744005)(2616005)(6512007)(66556008)(66476007)(6916009)(66946007)(54906003)(316002)(4326008)(478600001)(26005)(8936002)(53546011)(7416002)(6506007)(5660300002)(41300700001)(8676002)(6486002)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1piZGVCWU9SNnJIY3c0L0dPeWl6OUJUNU00azVkZ2xUbnNNUXBQNjUxSkx2?=
 =?utf-8?B?RDBBczBjZ1lVc2ZqRjg4RTlOU0hpUkRSOVhyd2Y5R0E2a1ZUSHVtWktPQkxh?=
 =?utf-8?B?bXAvS05VWmJGMGJFUUkvdkRDclpvTFd3UFpCK3BWSDBLWDBxMWZuaG8rbUwr?=
 =?utf-8?B?UzZYSUdHZ0IxZ0RVYjRpcmRYVm4yeDRObEpZUGpFKzJqa1h4VFNPbGE3RFBM?=
 =?utf-8?B?NXgrZ3ZFOExQaGIvM3VaaWFpTHZHNmtSWktmckJMdWJOcStNR2pZdUd6dlBp?=
 =?utf-8?B?OVZIRmNxenBuaHNsTnFSK1hQWUlFdGc4UmV6U1Z2c0J5TW5kVGZ1Q01ieU1P?=
 =?utf-8?B?M0tJWDByQ1hINTZjYUpCRDFvaG9CY01oOVlyYmZZMFBvMEx1d245TXdkMUFy?=
 =?utf-8?B?emRscXFoUnZZQ2xrRkovYldNY01uNHAxMkcvUnZZYmFBTi9WZ3NPZnluejdI?=
 =?utf-8?B?Z2o3L2NlNmhSQ0Y5cmg0cURjZ1lzcUE1WDVVYml6NkowVmpTNS92Nm41bFV2?=
 =?utf-8?B?WFdzeC9xazFHQXI4bUQ1elU4M3lPR1ZZNzVyVXFWQVlaUkU1Nkl0b1pQdEdJ?=
 =?utf-8?B?RTJnS3lCU1kzVWxHOGRNYWZTcWNyUEhaVXhXbkxFTWkxa1I4dEZlQWpFVkpz?=
 =?utf-8?B?NlErZUU0czBwclozL0htUWloS25Db05WdlBhb2VKMVZWUnFiS05mMXM4RTdJ?=
 =?utf-8?B?VkRkb1pOazIrdG80SmZKVjVSU3lERXljR29nemxEdS93Z2VUWDVqQkx0MU5Y?=
 =?utf-8?B?cEhYU2lMcHpkTmRFZ1hqNGJGOGdwTGpXTFlLRzlTQXFEdWJFVW9uVmlGNmdt?=
 =?utf-8?B?YVk0UkZFMWc3ZVQxWTI1UTdHYUlkNE95amc4WlRpNy85cjVHREhPSDY2M0Vi?=
 =?utf-8?B?V0ZzNFRteWJzU1BDVE1Raml4UDZLR0JoMlJLRFV0N0JoNmhjMXlwNmp3azdC?=
 =?utf-8?B?WnE0NWxmaGFDT3A5MG5SVDEzNmlubUJCUkxVTnFNallMSXRPRTNRM2RmeHkw?=
 =?utf-8?B?STRlMTNCd1RJRFR6L0NNRUs2WnJ6czI1VkNrTTJQa0ZReG1TK05mS1Y1ZmNS?=
 =?utf-8?B?Z3NYQ1BRQTB1ekZNV0R3R2xsVVdlcmQvKzgwM1FhdW43Y3hJSThFenNMMGxj?=
 =?utf-8?B?V2pXQnE4QzdKMGtRVTEzOFM2a04vYVZEY2xTTkpKdFcxR09mRmhuZlRFSXVC?=
 =?utf-8?B?TzdtUDRCQ3ZmTklwT2RjTzJxcFhETE5zamZNSkZOdnA2RUtzemNhV2hjV01w?=
 =?utf-8?B?VFlCQnZnREtsMjJ3d0xuYzFmZ09ITmFhT21UcmZ6VG5ZNUl1dHVoWjZ4Sko1?=
 =?utf-8?B?TnZrYTU2ZDVCZzlDWXdwMjBaTjQxY2xybEUwQWxmUFFxRElhZE43M3IvZmM4?=
 =?utf-8?B?d3FFRzJ1bXgzeXFseGdXKzEySFZWOE9nc3pjTkhFV0Vxd0sxTGdvY1ZjK2E1?=
 =?utf-8?B?bkQwMi92RnNXNVBRYkhod2cvQWxUejM1elM1WlRyREkrOVZzbjRtY1EySzRF?=
 =?utf-8?B?QThYdmx4dzhVTXRGMGRBS0RBekhaS0J4anhPck55Wjd3cThSbDMwb0trc2hX?=
 =?utf-8?B?THI5bGlYamJFM2Fzd2tZZUpuOXZlQzQ2WlhpZGJEK0FQUzBhRDBZZk43UDB4?=
 =?utf-8?B?ekNtZ2NQMlB4aHNiWEc3L2gyV284ZHZqQmlxTlpzRlVtckczeXU2bXBsM3BL?=
 =?utf-8?B?S1V1bXdMT2ZqSWlMWG14QjF5eFhZbUVaVkYxV2M4cWN3MHdIT1pEeTFDc05Z?=
 =?utf-8?B?elpTSjNKc2dhVzI1dTJaYk1TNS8zYVNNWnZGR0NhYlVLOU1pckM1MlRud2xr?=
 =?utf-8?B?K2JrQkQzcG9meUtkd0Z0cko4dTd6elZvTjVWVnFrTzN3N1JSbjFrR2I1U0hI?=
 =?utf-8?B?a1U2ekttVk81MGNHbXpRd04yVFlqQktQejFyY2dwRUkzanl3dDlwekRDa01k?=
 =?utf-8?B?NUxaUy84MXRQKy9FVExRWDhDT1QwUGVkNHlmYWs3M1R5TFI4OUNENkdYeFlu?=
 =?utf-8?B?LzJONWhVa24yZG1xMm1kZ01LdXM0K0VXSW82VEhvUjlLSGszNW9zdjM2dFJ2?=
 =?utf-8?B?VUtZTCtIQ25wRXdWWXhHVmlGOWhYdXprYnpLdDdaYW1vNEdON2lqWTBaSHhY?=
 =?utf-8?Q?W0g0+G2VaQtJAqdVlICiTMQJ3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aedcca6-3cad-4d66-4872-08db72fd4386
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:47:09.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qN6QrAXiwXgkWJyKDe2Dkpii3DS4hHIl2te85DZBUi/Q+cHC96CVs7+CYQ5XJT9YmyZGuLnxFWBjAsexrMLqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478

On 22.06.2023 10:15, Nicola Vetrini wrote:
> On 21/06/23 10:48, Jan Beulich wrote:
>> On 21.06.2023 09:58, Nicola Vetrini wrote:
>>> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>>> +#define BUILD_BUG_ON_ZERO(cond) \
>>> +    (sizeof(struct { unsigned u : (cond) ? -1 : sizeof(unsigned) * 8; }) - sizeof(unsigned))
>>
>> What's wrong with just giving the bitfield a name:
>>
>> #define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int _:-!!(cond); })
>>
> 
> A named bitfield with zero width is not allowed by the standard, which 
> is why the fix introduces a constant positive width. I'll send a v3 
> shortly addressing your previous remarks, though.

Oh, right, but easy to overcome, I think: int _:1 - !!(cond);

Jan

