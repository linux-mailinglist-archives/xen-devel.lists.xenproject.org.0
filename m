Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF479E402
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601132.937037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMQ1-0006SD-Pj; Wed, 13 Sep 2023 09:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601132.937037; Wed, 13 Sep 2023 09:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMQ1-0006Pp-Md; Wed, 13 Sep 2023 09:44:21 +0000
Received: by outflank-mailman (input) for mailman id 601132;
 Wed, 13 Sep 2023 09:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgMPz-0006Ph-Sf
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:44:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c085bf5-521a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 11:44:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 09:44:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 09:44:17 +0000
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
X-Inumbo-ID: 1c085bf5-521a-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOSq9z0lp8E0m7bclYRvtoi1sH56F5mX/PZdgo2a5TRryvXnX21bdsN9lun8JWZX9U1OJRj0++XZ3hWiZP+r6Az/7tOc9TE7NnyKdx27vM+DoSNIS0pEqbI3xC1IwVU5XOs/5naBEioRM4JHcOpCF7pQbfVYj0f8+jv6DxKXpn/kmzhYL79ve/wwnua1fdjYLOzHrc0+6hZP7yrgsN/EfrcplEUGQJLptJa3Hf/HoihUGUyqd8gSooDGtthIFkfedK9MYO/7JbZ49EriQe9HmZpLJoGJuMnt627vZZ138a8IL2DCvuUTgU4r+i9lHwgYVzyJqC57zo8+UpUAqjsydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd8omn2nlGd4LCA94hHWhUvSK6NlXCdNeFEp/RZKfDU=;
 b=XDZMMmL49+UworczhTbzpNanyNOFxqxwZxd4FZZ2fN13PeYtYAS9C6rt21fzaCSXuE0eM/iFsh6f0hK9qbUTZXaKV6CSvV8yijL05WNh4rScePj4TcNSaYSALn3MI1r0LFGquX7gR6pcDxTYnOGKhm66WkqSVZAuOh7enaW8I/COx8DvG7esX4ZVlHuEN4xsOZ02aBQXNjvQOz+iWX31qK4PjS2uo8mpy4YjPcwWiN0+6SsoyZI+yMxOd2E2cNJJn00H6jL64/tu4NuXb7DJoP0b+XN78ISgtgjNPnrMhIwsg+ts0giCq5cHhegI8CVYWYzCqEqIt/jmHBXdJN9zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd8omn2nlGd4LCA94hHWhUvSK6NlXCdNeFEp/RZKfDU=;
 b=iIS+FF99XnbIVxFT2fMDeYi0/y+oYGEVFUCdMUqe49CyqaFccTWnpeEgo9PFwKjYJXZYw/ctgxzVRXuzn6lBwFnH+mGdnlv3hpyYQHfay7XWzioBylIXwCjMbrvLl+/gU2MJyJYGESPm+7cvasehwJCossceKHOA0dF/hismRLkuIiwoOTLJycqU7AxBve/jZWLcoBimlYwfMTuQ8pRUYDHNfYU4BiUk/1oqa8myXAakt5gUWNtPEfK36xEAKjtNUJQZB5e7ReQxIBA+LCEdCT3BkBNO99EyLJouzufM4PEDBCLkFT8wHUBZ+zD9H0kG8wbpWrKxgx98XV1/VjNLKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40606e79-65b4-f344-1d4f-19c8946a67e2@suse.com>
Date: Wed, 13 Sep 2023 11:44:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 2/7] x86/hvm: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe2c9e8-7f14-4e4f-08c5-08dbb43dff45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0wOCnF0VTg/OMhgkKpBOySGrO/sfvEDvrcl/a+jSz5D7KhjhvDIdysK36uNqhfNRSs0G+JpVWX/0Ku5HNeOr1jPnlSJViUoPaJTQiY+1/3RUa15HhuE5tSqFWGj1vnl9DY8KumPGyrYDTB7PxqzpAhetQ/uVeRF4auwPmmPKEYIVU0OAM8Wz2TCgVqVin3WTfMBjYfSzM8TnOdMfMxzu/7qV9ZZzlpNoeXDfx4BR1U+ngo0cO+2PWj+Lr5YeHFF6mTR7IDEH1j/P92xR6kpeiLhg+AtCNohUlAXTwSikFXoWv00YgraSy5MDfYiG5y0Gr/4wXcSbGgHBLg/thHBHHsCwf7UcNVeUL8SBhCutGyV6MJhXyvkIeB8lkFNh6L+zy/bFxpaSQffoTiP4rhXBFFF5GKgSFrG/qtF/nUn1iUoJDU+LUnIYFWz5zntzfPCQ22kWEd6z/kxYUgZibcWu59WAz7VPchAvEiP/MuKHDsuv8BrWTN3p+FoC/uhzISOjZhB3dW31gxQtu6nW6abobT+lzD4/MyF3XNlZw7YnqCs8UHhZlqx6vU9DBu5/6t5D/kwnBXqMEW1xFBgQHlgIX+eTCT2+cTRVfxSTK3F5KLolCR5gUh2qAaSutIGafeKDwpkWQU3iqQJCEYH0zoypzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(186009)(451199024)(1800799009)(478600001)(31686004)(6666004)(6486002)(6512007)(6506007)(53546011)(38100700002)(86362001)(31696002)(26005)(2616005)(83380400001)(36756003)(66556008)(5660300002)(8936002)(4326008)(8676002)(54906003)(6916009)(41300700001)(316002)(2906002)(66476007)(4744005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1paUWtzcUdGeXNaY2hINlRZNFdQbjZkeTZKbE55Uk5kQXltOSs5NmpTUkJ0?=
 =?utf-8?B?YXFjd0VuRExtOU5FRzVaLzNKOHlXd0pPMlVOQk1GM3liUFBEMDVSWDdPRC9j?=
 =?utf-8?B?NFB6Y2o0Yi8xeFhLbktSTEtkbGI4SEk0bHM4TWQ3dks5SkVJZDRsR2xxVXBW?=
 =?utf-8?B?LzJSVWlyTVhkNjVtalJreGtnMjZobENVV3Ivc2s0MVptcHRPUWJNdmRmWThT?=
 =?utf-8?B?OGFUMXFsRXBGbHZ0RkttRmFaOGJHeEN0TXNraGdNV2dTZkV6eFlxQXpHM3hM?=
 =?utf-8?B?SkdtcnVodUpFWmhPUmpsNXpNSFVIL3B4QW5MRUNGdDd3Rk5yWHhBS1dTVFJw?=
 =?utf-8?B?b3Q5YmkrY245VmRMTTBLUGlmUWZWWDZPV01KNmpvVk1aQ2d5VG5uT1poWHA1?=
 =?utf-8?B?QmFHQlJzZzVPZ1lYMzRDdENHZXlvNER5NEdPT29VWGpHQTRLUWVMYlN0WmVU?=
 =?utf-8?B?L054cmIxUWJzbi9iVVhoSi80ZzZocytTZjQra0dia3dSbTlaUHdJS01GSU02?=
 =?utf-8?B?djhNOFlmaGkwNHViZGh6eWRMTFQ3WGdjTUZiamdJZGZXZFJHdWU2WUlDdy82?=
 =?utf-8?B?eVIyalJmMko0QWRYeGlNUmtldUduZkpTdTFoRFQ2Y0FmOXRzM01PUStGSEt6?=
 =?utf-8?B?SU9ML1RWK0xPYzBjN0w2OEZXUlY3QVd6SlBydjErdU5kTmFVMzhSdWo5VCtY?=
 =?utf-8?B?a0lBWkd2a2Y3S3lxam1xUjBuYVpUTGZJaitXU05xVWMxUkdiZ0RLRHVhcjVI?=
 =?utf-8?B?SE1NSnpxd0lhNEY4Z3E4NnZSaTJWdXdkOHVoekdnbHRSSTByR3BuVzhTZ1Vs?=
 =?utf-8?B?aHdBVnVlRWZWQmNVcmdvd09obE9iTXB0dDJzYVh3VHVyT1Q1aURBTlNjT1Rj?=
 =?utf-8?B?UytZVmpxZ1FCWnpzaVY3aVpzTE5odXFhTHpqVXpZcGFWUE03YmFoWXlydndE?=
 =?utf-8?B?VW52ZE9mOXd4WWYxQ3ZkU0xoZ21RZUN1aVFmTG9VYjFSYm1idzZ2NFE5QWVm?=
 =?utf-8?B?ek9na3kvbm5NK3krVHZZOFR0cmFQc0Zkc2dGUTVudHJuUzNpTzFBdTQzR3Zt?=
 =?utf-8?B?NmRtL1k4bHBuWVhoUEFHb0w0WEZmQm5US0N4aWNDVXhVMWxld1B0N3FSYUd0?=
 =?utf-8?B?QUpwbHoyREY2aG5CVU53bmtIYmxwRnN3Zk5PdC84Vnh4U2JvT2pWVG5SeHV1?=
 =?utf-8?B?aitiNytXOFBsUVFNelNzQmptREZEczJ5eWlLOXc3M01TSHBlbmsralhJWWQ0?=
 =?utf-8?B?eDdVNW9Qc2pOL0tUSHd3SURod0lvN0lzeHVsTUF4aExyeVUzTVRhQ0VJZHRq?=
 =?utf-8?B?dVY5bGFUelJ4ZjR3VXc1cno1WklkK2w4cTlIbE9HQUJrbXVOUWVRbmpIWEJp?=
 =?utf-8?B?N2dURnVJSFlsaWwvYldCb3RXUnIzM3NFUHhUWVhCTWcwS0xiT2dQd3FUdG12?=
 =?utf-8?B?ZWxNRnZTVGZPcHRzL2o4bHVsdEFMcjhkbjZtaHJndjA1Rzc2SUxRUnBNWnRQ?=
 =?utf-8?B?b3NFT1I0SVEvdXh1OC9KTmkybndTVjdJcTV1dmlNbnBjY3pTQmR2NmlFTU5B?=
 =?utf-8?B?dXY5YVRoMFloU21PVVFrSEJRVDFXV28wbkF5VUU5RlNCM01JcEZuVmJiRnA4?=
 =?utf-8?B?bWVlYVlxQUZEd3NNZVNtZitwRzFTMUh5UUdhcXhhVkhHcXB0SUY3OXhHemN3?=
 =?utf-8?B?ZGV0YWE0VmxDOE10U1UrckV4YWZaMVc5T1k4RW4vNkl2L2tHdVZrQlZnMGhM?=
 =?utf-8?B?akt5MjRGa1ppa2NJZlg4Mis0TWk0WUxnb3krbmkzeHJ2bk1lTmFtbWptaHFi?=
 =?utf-8?B?b2FxNjlCd2loTUF3dk9sclNSUTdjRWlXZlU5cEpmYjliNzcxTXBJYS91WG9t?=
 =?utf-8?B?clZRODNuUWpjUWtNWHpZMmwxVzJxbi9EVmY2UVFpdGdhT3RuaWxJelJ1UjB6?=
 =?utf-8?B?Wlp3QUgxUUJkNy93bnFYZ3EzbGZlRUtZaFBJUTh2Uk56dzZYV3NUclZBNGxp?=
 =?utf-8?B?V25BQ3NuSnpWUFYzNkVVN0lOdTA3UDNGa1FVaFQvWjZZRk9jbjVacm9kZUVx?=
 =?utf-8?B?SHFONEo3QU9kMDBrbVBEendDT2dwYWd0azRSOUVydVdHOEJFRjUvUENkb2R3?=
 =?utf-8?Q?Wl4WTgHKcyDpmt57uIAeUZXZH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe2c9e8-7f14-4e4f-08c5-08dbb43dff45
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:44:17.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VJQgj7vdrOob8CVKEHMpFWc1w8k0Yqp9NMjKWA4J9KtvXl45Uj5PhE0IDpEihnj2VK7h75skMLGzObF5LaCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839

On 12.09.2023 17:38, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add 'U' suffixes to 'mask16' in 'stdvga.c'
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Comparing with v5 - are the two tags in the correct order? And is there
a From: Gianluca missing now? Apart from that I'm now okay with the
changes presented here.

Jan

