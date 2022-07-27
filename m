Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082E581FB9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 08:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375888.608350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaAK-0005OH-7z; Wed, 27 Jul 2022 06:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375888.608350; Wed, 27 Jul 2022 06:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaAK-0005Li-4e; Wed, 27 Jul 2022 06:05:04 +0000
Received: by outflank-mailman (input) for mailman id 375888;
 Wed, 27 Jul 2022 06:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGaAI-0005Lc-9I
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 06:05:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c933607-0d72-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 08:05:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5900.eurprd04.prod.outlook.com (2603:10a6:10:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 06:04:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 06:04:57 +0000
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
X-Inumbo-ID: 0c933607-0d72-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUkWNWTpeY9Kzg/7oKJ7zCg9Hc9t53IRp546a29xw4pWzMKf5rwxYGWbRMWaQ9dILmpiFQJOfciAN9asuMKXMmhYpIoju16bF8iz4wsU3X4PEmCfMy6wNuy2bU9KLEfzHLFG4tzFZoET+fBmvnZdfGkKJRhme8mPbNAfY2dzbmNcU4TjfJHEGVe6bV9lvZTA1DC+vLrvUDq6FKkPxFKvCZEq9+c6PBCs16d7/bvmCY8TDcb88TyzgxOapewd3Q6LG6Pr+RjGuBxRo6qM3Itfa1D6xBOzKLf8FSwnvx0ck/gN8KVDRwG3PzG0IdHuO3zLhbmar6vZezE+/O3FJCcPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUVtUkz17XygCM73T+G+5WAHtTDh/scwptkqbJYoMJk=;
 b=fRwxi+yQYmGHTByqngUM8/9a4aCpbzVddWXNcniU1PYJUk6iITskSb6dUeDmbfugMVn+Ik3EXLl3LIsvKx42lwKnz1MG5fYXh3odDv+pm+pNbqDCe2/MIrGa6PqIwCRAUGaJokjIdiTDFXLw02D4saBZihZIu2HY5GKHSPDd6i7jZgFnQMyPrfIlzowobFW1ht8roGLnAlyLxHcTmYL7w4p37wUJ66TB6vh4eY52xe/VNjfjptuqw7bQHkzWAA/cQDdeAfSDpvP7VXf65ksNPPrKWi6ccCeRPqtguBYaRquXc5kb/uvgLxKOFi7jHcxSB8+yxdiZ1ACWuxO+CZEERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUVtUkz17XygCM73T+G+5WAHtTDh/scwptkqbJYoMJk=;
 b=rxqCXU63awtLJrMMeBzdpnjky9fj4pcoDvF52J+BkbK6EzuwbAdwnm80rzZsfo87i9jaf8aOwWgEbAKSze8GYBhkX1OyW6w0l6YiHyFmIOk4xeDuxovjZJ444gfNBEWRoAXtN5gpuMwwM7RF/63OX5VlK5vnwszBJW/rw9EFVkn87SsouDWtMQg5tEjaG6iOVr0MrccS58FwUGd26e0C6UUXrn6mEX9ymtzN9Uv1OW1ARERDAEvN49ltM1pKrRwUlOCSfY0zK1v0ILI8/YUveIyHYz5KeBcVsAMCTTl6kcf6YiziZ+gShWUBYgjtMaGJfJXr1wL+va54hkvRzvA8JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7208eec8-05f1-cced-5396-1fa1f87965d3@suse.com>
Date: Wed, 27 Jul 2022 08:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
 <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
 <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
 <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
 <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop>
 <981e2fb9-6f99-2113-86ab-f3da860b74b9@suse.com>
 <alpine.DEB.2.22.394.2207261704400.4648@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2207261704400.4648@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7721ebd-15ad-43df-0f43-08da6f95eee5
X-MS-TrafficTypeDiagnostic: DB8PR04MB5900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FlscTX6G1oI/dFks1h5vLuEN/nF7TO8OcHQb9hOMM7gNLps2XdmmARDgmYVwrjfW1LLuZQX/UzsNn3SVR/kyfMbYfUNBPKTuuwVQCUBKxPe7S0aIPNSIuCrmfIprbBsldFrtLbFbelwGWKgpppflgyKcTpStN9M3ajNrW2W41BToEy1YcVuaJnKJ2yt4GycV+DIEYk/bajjQUpsYgAsTSCg8yC7JU3q7wQeMtejnvuOy8ZGFlDQhw+6VSDVYUut/NMsn/swgOyvaXw/NPNanoOkRpyLeELPAACpLbsqzyZVUthWZ7nFM56B1nC2oCaoNo25eB+xP33kkFJxIf1jvXyWmcwgbNCv5dLNKW0+dLH0t3pVDstw4BtGcVYna63JEOST0VQIVKNir0VN7X+VWY7go/oyruD3JSal8D8+Kqps59pnJ95lDVzwkdgFnfHJxqBYoNUBOx71En0UG1vT4NjDJFQ4qiWC9HW+yQYZ3ZBRN6T/CiJHdyMGtfDPFefMk9q+eHwztkLqV05tsz27DyXaLg+UxmW/BlGHJKK5EzF7ktIhK4EOG85Vg9rz4WqSiMpD3kus44d92PuYkOlWh4HHn+APGbfn8QNA/P9GAm8v12BXIQ2TBzk3kLZGboHCJM6sUKPbKpUaGooOKLaNlCc9NJnDPrnKTZ1PKkoax1OBdr0Ekv7Nw6Tj7nWylH3tfCT6LxJSdA6AsF/q/J7f+OyYwGA8NBiDQu5Y3al2TYSqnwo30LfdfmW1BZOYf5I3GMwKHNUOYgdpcLjWBH60Kb7ChhenXm1XYK2ZJiU51+G0w2QrcEQuDoalXuS+6vsFvsmajb/MoJIl4iPl5xZyIyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(366004)(376002)(136003)(6486002)(66476007)(31686004)(316002)(36756003)(478600001)(31696002)(6916009)(4326008)(66556008)(8936002)(5660300002)(8676002)(66946007)(86362001)(2616005)(54906003)(41300700001)(4744005)(2906002)(38100700002)(53546011)(6506007)(6512007)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REE3WUJVZTU5VFRvdEMveWI0eCtNL0NrQS9yOUtjNXpBdUlqMFJQbHNYT1lJ?=
 =?utf-8?B?WHlCVWF1dEFMQm4xSHVmTDZndVUxTnhwMVNJQ21LcEJwbStpOWYzblRjRS9U?=
 =?utf-8?B?bEkycnBQMnFXOWhGU0N1K2xUMWlqVmxvdS85RHdQWVhJTm95V05hdElKUm0y?=
 =?utf-8?B?cThRa2ZRdTJCdjhxTXlKbHczd01XUmQwMTBnUzVCUFhrMXE5amUvYlFJd1hl?=
 =?utf-8?B?SzBGYkpJa0pYd2ZBOFd2cWtJa0ZpY1YzcXg0Q3hRYllMK0Y3UzJFalZqeWRF?=
 =?utf-8?B?dEd5Yi94aGlUS3pCY0cyUzJ0cm5TVWNYUjd3RWFXNTlKTlprSkxzS3FPNjBX?=
 =?utf-8?B?QlVXdXp4R09YYjlKNC8vRm5JWkx0dEM2dXBlbGc5Q3pic0JuSFZuWkJGaXBF?=
 =?utf-8?B?b2hPOWVZNVBBTXdVRkw0dmIzWmlYUVJWVEhHUmpXZzVNOHBpV1Fvalk4c0pl?=
 =?utf-8?B?Y2YyWFo3aVNKNmRCMHJVVGJPT3RRc1ZUT3ljMkJ4Vmc0MlpITjRGelZwZWJR?=
 =?utf-8?B?UXR2bFBXOEhYUEJXNFhwaTZ3cTJsdjZuUnFibEVGdUN2TkRlMk1qOVdSdWRY?=
 =?utf-8?B?Zk1ITExsWTdpSVJzc25scDZ4U1EzUG4wcXoyMTFnWXE2ZjdISDZYUjA5eG55?=
 =?utf-8?B?NVF0WGRsdmtKVWljN0VOUDloV2hLQlJ0UGFpVUFOQXJrMGVtWkJUbDI2bE11?=
 =?utf-8?B?UTFQTDJhYUZwcDVRVXk2R3FrK2dHUEZOaFRtL0d2U3NtSWxXcFNGQWR1L3Qx?=
 =?utf-8?B?UTNHWm5acE9NcXVUMnpFS1lLT2wvNjRhWnZ1bkJhMTdVRWE1a2hqY0IvVENj?=
 =?utf-8?B?THBrQSsxTjAwRWxrUS9qbmhhRHVQa0t2MTZpVjZVa2xsbkRXU0ZHdFltWjdu?=
 =?utf-8?B?a3UydVVXZXBpc1ZhZUlnaDh2ektFQUVpbkJUNlpsQ1FMN2o5WE45dVQ0d0Vo?=
 =?utf-8?B?YU1meVN4VVZ0alNaYmFod0M3d1pkV2Q1enBhajFkSENTMU01cGJ3cHRHaVpm?=
 =?utf-8?B?aTFkbE9jaHA2bkJuVkJtL2llUkFqM2JkVjVBMG9xRGtEMWQyazJKdkpseTRx?=
 =?utf-8?B?T1dwSU5aK3hGZjRXUzFZY3RSMThCeVJybUFBeStRUFhKVDN1MFhKc0crOFZk?=
 =?utf-8?B?eU56clV6T2N0ZXdtd3gzUytoa3FJOTE3UnM0aTZpOEFxbWJjNVQvT3RUby9j?=
 =?utf-8?B?Qkl6NjhHWDBURk5FSEV5OVlLN1lRdFUxU09WcXdDcm14WDFpS0xXUUJraVpJ?=
 =?utf-8?B?M0s1bTdHeTg4ZHZqMFEyUWRMVU1vdE1xOGlSNGVCT1plaUVpckp6d3ZtR0pP?=
 =?utf-8?B?T0dWbW80UkQ5WVpRK2VMbUp3MG5ubEpmQnRYYkl5ZURJYUdpTmZRZ1JsMUhT?=
 =?utf-8?B?WEZuOVU1b0xGOUw0N0tuZ05UNmFscUxFVmNqTHVhL1o5Q05SREtLK2xlM1pq?=
 =?utf-8?B?ajJCNFgyY29VQmdmVjRnbzJzbU9XYUdqeWVaWUYzSlZoUFJjT0RrekNQK1cr?=
 =?utf-8?B?VDg4RUg4c00rbXlsNjBMdFNPd3FPcW1XSzB4eTJmdHl2MkJvRzBBR1c0NWt1?=
 =?utf-8?B?WmltTXlwSDVCVlpma0tnOGJFeHl4Yk40QzMzdk1zbkp4S25SRGw1dXZya3Fi?=
 =?utf-8?B?QXd0b3VBdVNGejNUU2JhRkxTdW1KcWZSRWVFSFBvTkZ6aXBjSlBQMFNjZjFB?=
 =?utf-8?B?Z2tBUFc1RC9WU2xXRVkySDBOd2pPWXQ2YTlEeDYrbEJiYTFObjFoVFlPaXNh?=
 =?utf-8?B?a1RkZDkvbm1oNDV0cFgwN3NCMnJLcXVXQ2hwTFp4SGx0aEZBenRLV0trZEEw?=
 =?utf-8?B?TjRUMm8yamJSZjVnV2MwakZRR2VnSEt4TzkxWGhZbmMyd2xnMlNkekVaMk1o?=
 =?utf-8?B?QUJCMVcvM3E1YWFQYXdlc2E5cUx5d0hxRE9XTFdjTjB5M1lSbExXYWErUk54?=
 =?utf-8?B?amcybnQrNmgyRXNkbmRuU2FwR2RMWWVPdkVtTUZqMzJHZXZJYzNPT3AvMUk3?=
 =?utf-8?B?WSs4cUtRaFp0dDFDSml4RHprR0VRdjc1L3FDVm9DYk93aTJ6VlJpZjVIenov?=
 =?utf-8?B?ZGtoTlhZWFhnam9RTXJPaHYrUWVXTFpvYzJoTnE1SUpSeWxhTjlKbzVCTUlW?=
 =?utf-8?Q?vvDoQ/60VsrleAIL6QRLo5MrS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7721ebd-15ad-43df-0f43-08da6f95eee5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 06:04:57.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o9RUYaFCr7KRnQ5UrM57KZGwS3Jn9Jc6KGPYtAUTA8tIIDMxbDWGxNLN0CFrZVONyds6HUyBQ7oI4Y9er7+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5900

On 27.07.2022 02:10, Stefano Stabellini wrote:
> On Tue, 26 Jul 2022, Jan Beulich wrote:
>> You forgot the imo better intermediate option of using the "X" constraint.
> 
> I couldn't get "X" to compile in any way (not even for arm64). Do you
> have a concrete example that you think should work using "X" as
> constraint?

Perhaps you tried to use the respective input then as an operand to
the insn? That won't work afaik - as Xenia says, it can be used only
as a "fake" operand (i.e. one that tells the compiler something, but
having no direct meaning for the insn).

Actually I thought we had uses of "X" already somewhere in Xen and/or
XTF, but now that I looked I can't find any. (Anymore?)

Jan

