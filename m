Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94F6264CE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 23:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442735.697197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otcwX-0007OQ-AY; Fri, 11 Nov 2022 22:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442735.697197; Fri, 11 Nov 2022 22:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otcwX-0007MJ-7P; Fri, 11 Nov 2022 22:56:13 +0000
Received: by outflank-mailman (input) for mailman id 442735;
 Fri, 11 Nov 2022 22:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S3a7=3L=suse.com=jfehlig@srs-se1.protection.inumbo.net>)
 id 1otcwV-0007MD-J8
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 22:56:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0368395d-6214-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 23:56:02 +0100 (CET)
Received: from AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32)
 by AM8PR04MB7796.eurprd04.prod.outlook.com (2603:10a6:20b:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 22:56:00 +0000
Received: from AM6PR04MB4901.eurprd04.prod.outlook.com
 ([fe80::78b2:ed7e:4e32:df8a]) by AM6PR04MB4901.eurprd04.prod.outlook.com
 ([fe80::78b2:ed7e:4e32:df8a%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 22:55:59 +0000
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
X-Inumbo-ID: 0368395d-6214-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5muzCD4evWv2hmvCy3XB3gp1SLxFy9/xq6VV6B+8wrnlpM8nrIsZyyg/h+PjGB9q4SKS92k02uoaCp9dKRzml4KRO7XflazAAF9YJ+NKO254igrr9vuLg+o/jVjxiri8SKEvTliTt1j3FzcVwYzVix4NhKPCOaebfZKPQDqoZPABjwQn5QBJhs6WyyKv02Zn0V3aMY+Va01WtlSKoj2/lWta8QWP/ZIPK+nQ4Fwkoegs5mUTga2/hIwDKRI+5V3qRstV33D/QNpbpLMNOB8IiguSxG4CdalWgMnYF2JSwvH/QgRV9DGV6HmodVZsh4Y7EB16tb5+B0iHfencPrXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1c1p5kOom6v9Hgu60KfRA/hvXIyiH2M0ufyRW+1hEQ=;
 b=D8P2l13suWC/Cffa39NZr9YYbfr+EMvHjgccV0oddMf7Kfn3InSc+dNcdWGAK2J3hQ65MqWIxm7W7+tL4yojlCb3FlALJdoeUYwba7qMSyNt9WNQ0XDTdN5i0p+OMMe4CTzbRBI3AJ6/kYX8SdacSpzYEA4a54CAr5yW4nz2O5qc9XGeCpV6VXTHxhfQhept6V3pEHWBOI9y4g1OayzGa5pVRgfLW86jXxNGO2dP3HxoGbZqPfemEDBRSWpXVvT+JczrPrfwAn+18R4YiHLFq9SZ7XDYE9WnffxjB7+tJo6rdFK4KjxKCVPNkcsAN1ShCd6bId7vHJDmkeIxVdDB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1c1p5kOom6v9Hgu60KfRA/hvXIyiH2M0ufyRW+1hEQ=;
 b=O8EdPPxV8pveqVbvkG8C816qa8gMvq2qGvYEO6wb0OdAZOf1eU66gRK8OSqXyQANBuswgAUvvgyDQaWA5ddQDgQRtykT6ihnFGDX7zeQXJfQNbs0Okqd1eQALXCErbfByi+rNIdWrwUPyKYljiELgl0naGkH44tBjTKpWGQD8ZuCEy/w0lno5gG2PIT9tSi9ZiHc+mm3IU/ZPjiyysuNrAVOmp9HO716CFKRGhho6nIclyeQeEjxKtlrmRp2DpWTzOfs+hJiwzIpZKdtXjXF7icK1+rWPfOk4rSu54QwqGgx1uwbgIDRAm80pr8tFp8ee08305ZjQGkxPvgNb9tYBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
Date: Fri, 11 Nov 2022 15:55:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: xen-devel <xen-devel@lists.xenproject.org>
From: Jim Fehlig <jfehlig@suse.com>
Subject: vnuma_nodes missing pnode 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To AM6PR04MB4901.eurprd04.prod.outlook.com
 (2603:10a6:20b:1::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:EE_|AM8PR04MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c727b0-edbe-46b2-629f-08dac437e67e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MoTj+5suuUfH/PbAS7Ii7anP2D8Z6fA+JZJI5EbcjPUUihzexGYdLP/Pu2Kv7+lB72HBo57/bz/6DPnXYnt4T+ZnJVKnJ+yYccdq2IDaYUR/OV9qozTqCPaPmr1FbPPiiVCxzF+YDdKxqoqBkxQyqX7VQkYgDi4dtVtqkHVgNxHlalYARlNlpsjeNGn/V4yUDR6CAtpPYBCNwL41yhcJ8xmiSA0Im8/YEeA4zQEzsTxhDxTOkJu1i6PqaBLZ1/uopSJa4ojSWCPs2Xo3ftClSyI26zT14IwJqsvwBV8eNqTnKGX+V9JhPk/plGOqGQu28PlpT6RW+JqdRJBmpY5Bz2U4hMKKRZAV8kyW41LKQhhlw6WbBoPXPyxkz0s5QTs5qedVamVRfrYdaLB0Q4n93jTTeBW34+7Kn16ZZkuF3N0YYuSNYfBSw555lg8j8J+/C5xWCerYHtEPB82G/OFTwi88A8hSXrpKTWUoycLJIyO0YzVxQF8+KsssXhMAFSkXyGBx83Tehk0EqSRwSFRDwfFGYk6RQk/6bozW81bbf4yWrRRZVt4a0r3eW8H+XnEN6u29aexSX0DJq2z9LAnrZnzU7+/FyGxE9Ca+4uWmbHMDg1xnxtlVEu4CK5ZVX6/f/MRpCI7497fDA4jBir0Mep3TaFyhFv7AsRxqrHFRDBScrBnRcK95trCgJSkdyTafRo7QFazbZvzUJaGbPQe1gjc2Z90zKOsiJnzWsqo0D7WJ1b7vU/ULthEjdoc56FEsJMWXO1zbZ10ZoGprgrhyfeCNSfDrLKKky590u+oEmP8Bo4TDwHq1eO9c8Vy+/z+rg4k4fgGMvaZxPKcQu7kKfaipGHhlriDL1bwWHC0rVqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4901.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(86362001)(83380400001)(186003)(31696002)(38100700002)(41300700001)(966005)(2906002)(5660300002)(478600001)(2616005)(8936002)(6666004)(4744005)(6512007)(66556008)(26005)(8676002)(66476007)(66946007)(6486002)(7116003)(316002)(6916009)(6506007)(36756003)(31686004)(533714002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVyNWMvQTZOZ0hyMnhtRFRCTUF3Z2VkWUJMNjFxNm1PTy84QmVhR2pNZWNW?=
 =?utf-8?B?TTVMZmxhaStDZWlpOGt2bE9XWkdoRmYwdnNiTGV1d25haGFVaFdZN0NSbFow?=
 =?utf-8?B?cDNId3k3OFE0YXBuejZuWWl0dzJwQUlOMjM1cUs2ZzZZcDRsMEgrQ0hpR1hT?=
 =?utf-8?B?aTV1RTNjWkJYNmdoL1gxMEYwMm9jVWk0L1V3Vit1MUcwaUMydDd1a1lkdTEv?=
 =?utf-8?B?ZVlRZXhoK1kwaGxma1dHYmovS1Y0TFpkZmI4OHBiYVNvRUtYandKT1JhWThU?=
 =?utf-8?B?cjBteEthV0dHbmpTb0NZY3lsbzIxMGFBT0M2UHFCcysvSllPbU1yNmZMUHR4?=
 =?utf-8?B?cnFZNG93WFNDSC9sNmowQVAzUzNLbkxQeStjME03UU5udjYyTjN6OW9JRHhl?=
 =?utf-8?B?S0RaK0lERm44RVlxd1E0aGhzeWFUc0JWUW1BZ2NBN1ViQTFPSjUzZzh2Zi8r?=
 =?utf-8?B?RnFhSmZXdENXdjZzWnVLZVRsQW5TZEVkalI5RDY1SXppSTFuYS9wYUhISWVZ?=
 =?utf-8?B?QS9xNFp5NldQS1NkYm1yN2FFSDNGYW1nQjgvaDJQZ2lSUE9XN2ZMVno5WEE4?=
 =?utf-8?B?NGlvMVdxUEptQ1hRbEt6R0RNcU9LYXZCc3gwblJhbUpqL3ZLdFVxL05DdTdC?=
 =?utf-8?B?bnc3Mk1iSlBxYXFyV2J3dzBBWDkvZzdKSU8wRC9TOGpqRXZPSzZ2VkpHcjRo?=
 =?utf-8?B?QWE0NFRCYjhtRFV3bXRwSy9scVMxbStNMkZtbTRqRFJzM3ROQVU0aE9GZyt0?=
 =?utf-8?B?SG0yajN2b1RhNWJCV1F5WWIrRjRHMnNZaFNIN1BQdHJHNDZsdHN5K1Z0V1Z3?=
 =?utf-8?B?TXdEWEZtZTdZcDJvVVhBQVZyZFQ4Z3ZmSjN3aXVlamEzTEFZMnJTYy9HajJL?=
 =?utf-8?B?WHB1ZWJtdENQNGhiZ1VtRDBCVWpHOGI1cmRkYlM5UDZyZ3c1YWtBWStZOTgz?=
 =?utf-8?B?WkJuRDY3Qkl2OWRMTzM5ZncyOC9HZ2J4QXhwRGJHMG5SOFh3Ris1ZlNUVDhD?=
 =?utf-8?B?WGU3dlFSd0laRGk1UWt6MGllcEVzc3NYamlKTUl0TWxxbmhMbmtzWTZ2SHBx?=
 =?utf-8?B?Qk53MHZIdUF2OFFUM3YwN3IrUUMrVlpVT21GNzIyYzl5WTFxTjlGelhMd1Bv?=
 =?utf-8?B?SytqTTZmZEFZM3ZHdHpLK0FXRkcxeDVPcmVucUxWOU0vZWlzeERranhzOFQ5?=
 =?utf-8?B?MEkvK2VGN1lpeXl3N2ZHNjFtdmp4ZitiWUF2c2dzTm1xTHBLZHVxODFxNG9y?=
 =?utf-8?B?dTd6ZEJ5VVphUXp1OU1zZkVGMlNVeXhCU0pCTHN1eWV2TDliOFRLTmpyTFVr?=
 =?utf-8?B?NWRUSVd4bW02Y2lGWWhBME13WDA0djFueUl4Q3BGdERqM3htYmJLRDhqMjNu?=
 =?utf-8?B?aEpSSExad3UvZEJPZkk1bzF4Mk1mTWJ5WHAxeDBBbXdia3lWT0FQODJ1cW9q?=
 =?utf-8?B?ZUlRNVltaUdlbTBSUThvbENKTXFra0lYSkdmYjViTTkxV0ZHbS9WZERxNnFx?=
 =?utf-8?B?QnM2b3ZrTkFrRUhDcDkwa2JJTkxLQUYyM0ZHRll4aVZhVnc2b0tNUS9wRWlS?=
 =?utf-8?B?ZjN3aFRyNGFtMUZ3blRnRkFuVWhqWXpYanZxRzJkQnNKTnJncEQrOWZBaFJp?=
 =?utf-8?B?NWxYQVFnTENmOVBCdGkxbVhlWjBJVjdlZE10MWNOOXR6M3pjcER3aWRseERI?=
 =?utf-8?B?bkRibDdxQmpMUERVT2MrTVZlZnBEMTlhaHhnZDZLMGZhOW5QTWVLL251SWhy?=
 =?utf-8?B?TFJYYVJ2MWs1Y2VVSzFIaEIvN1RNaEczL3MvVDB5cnNtRmlOOCtHMU02bVAw?=
 =?utf-8?B?MHdHQnRVdE15UllWaGt0SUVNQzhPM3psR09Rd3BZeUE3MmV5aWJpdHVzbkQ0?=
 =?utf-8?B?ZlpqS01RY2xnM3Y0aFNqSzJEYlFpWmdIb2ZEayt4NEg5eGlHalVPV2daL3l6?=
 =?utf-8?B?alh0NnAxTCs1ekovbjE4TUZnUnhBbGR5U09Ta1pPa0hEbmp3WlZxZ1lXSUpR?=
 =?utf-8?B?aUZQU1E5WVpBUzk3NVFZK20xcm1qNE84VDB4UDRCOUNxc25XUm1LWmd1a2NN?=
 =?utf-8?B?czd4eGF1Wmp3NUhPVzBRclNWVjlJdFpGVU4yTTcxSWpLVHp1YkdaeVluWjVk?=
 =?utf-8?Q?sY9cBVQjQnTowhCKJ1iEsdfAV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c727b0-edbe-46b2-629f-08dac437e67e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4901.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 22:55:59.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYEQQ8rEIdxag+6UTzH9yrPCJ2ZKJL6p/4xeDEMs4qW3UOXNRrWRtN0B7bLh9yN5/7PClWzmc92VcbQoNpeSkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7796

Hi All,

While fixing [1] a recent downstream libvirt build failure against 4.17 rc3, I 
noticed the json representation of libxl_vnode_info omits pnode when value is 0. 
The problem can be seen by starting a VM containing the following vnuma config

vnuma = [ [ "pnode=0", "size=2048", "vcpus=0", "vdistances=10,20" ], [ 
"pnode=1", "size=2048", "vcpus=1", "vdistances=20,10" ] ]

The json representation for this config does not contain pnode 0

                "vnuma_nodes": [
                     {
                         "memkb": 2097152,
                         "distances": [
                             10,
                             20
                         ],
                         "vcpus": [
                             0
                         ]
                     },
                     {
                         "memkb": 2097152,
                         "distances": [
                             20,
                             10
                         ],
                         "pnode": 1,
                         "vcpus": [
                             1
                         ]
                     }
                 ],

I'm not familiar with the code generator for the *_to_json functions, but with a 
hint I can probably cook up a patch :-).

Regards,
Jim

[1] https://listman.redhat.com/archives/libvir-list/2022-November/235745.html

