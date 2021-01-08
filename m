Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B7E2EF4CF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63641.112956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtgF-0004eQ-A4; Fri, 08 Jan 2021 15:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63641.112956; Fri, 08 Jan 2021 15:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtgF-0004e1-6u; Fri, 08 Jan 2021 15:27:59 +0000
Received: by outflank-mailman (input) for mailman id 63641;
 Fri, 08 Jan 2021 15:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxtgD-0004du-IF
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:27:57 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16ad96ed-db81-42a1-8634-d43ae7144447;
 Fri, 08 Jan 2021 15:27:56 +0000 (UTC)
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
X-Inumbo-ID: 16ad96ed-db81-42a1-8634-d43ae7144447
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610119676;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z/ArTtQgUFYVN6m22MH2p7D0Gn7Z2f2huvNXzBVu0hY=;
  b=D2gdHG9QELghjMSVI8n2GonnnUy7WXDUKzu60dJsfgTj++0siKf5SMkr
   cg34yrAvsbRRmDu+9Qyp9y2uT53DpPYrwrrd1dyNuBCXGmn70hMhut2FP
   EjZg0qdHRCDgjnfX+1o9wRpa9KMLnL0wrvpm0kB0Mhswe8D8rPdlvucw1
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cMEsxT8r3RSjIkytOcc2/x+V9jiWPvN9l/P/6KHJDGwHa4Sz5erg7RVGczKZrIcJA0wmxMZPYQ
 YTuuzyROcNaRqC+xHgGZArK4m/q/xHQkbvn6cEfpWRCHwRAijxgZ2MQ1fgUBrIzOiTKkA9mV7O
 R5lLjmuetnJS4nrrKPENkSsf0jyCn/3ngYTogCTS4Cy4uLp1OfBHr+DxlQh1sT3yEwJ39rX2nY
 QQQsU7JPTbuKBZ8DGBVGe8drCvpA9PUsUNiJqRllZbiNCDCxKqWvDktZQA/nggqdWoka8Ic05K
 0xs=
X-SBRS: 5.2
X-MesageID: 35981492
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="35981492"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXeojtxEajFykl5Ss1j6J1Wcz4KHbrKnoF3sWIfZ7eU6B2qDYwGVgbgFsw3VAK1zsZI23XOKL7Semt4oR+g1qVKBdhstNA+JTFZwnVuitwu6/M5Ay61vJ3mpvR9B1fSzBcB36S3HylFj7N//zZhUvK+HjPH1leeMMfu+pFJh48Xt6FAcx2h7tM7C2wwzA1bhY6swE9FVxcgNdnRvLlIAY2NcZ8ZxX2+9BPNGwbCqUK/ylOvvvvSGbEEpsEvPHGFWCVGXtBq+GS8O2kIj8f6j+5fPhL7yns8zWYidhORf5p2PKU/c/YrwCeemBoPhgeRcVPJPX7f+BghNr367XOnAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04DPxEeAK7OgoLFw8g9RfAcnBXKcIXuROiiEpB3c5qA=;
 b=kn7AYGCjyQZNrzEuTlwsICJveyd9FOKLBd8jdYBgexMdR8tzKVNUqNrvqIKyxeQX/OIB3NK5arIVMmrwZqYj9qEPXKFSibwMLxWJZIRPYAqqOcE63bOisgsEvD83CID0ByxqCwN5Y4rFAyDynA5HVd8iHe94owkGszi6usWelK0ipRtuwpFzLQqslJPxYslDKL0mGDa/I9w3Q8m9d1wXCfqkHAqeml0E4Kgbt4hOhKRn4x/mh5Crn3KC0iwFOZJUAqox6xaM/JO6oIdxzZ0+rpx+31BrCyfHSlzsixyyYe3Vr7e2oXwBCvguYAp+s8eIQQyYMdKP5j/vv9oNfH/kvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04DPxEeAK7OgoLFw8g9RfAcnBXKcIXuROiiEpB3c5qA=;
 b=ML0SiHweW0ZKNKtQkhGb5xaYct2aMM+8x3HB8G9l8FBAC6SwZSnU3S3Voe8YSnBXcwy04ZQDSCJsOTvu+y/Ko3xj13rUZBaBRlI8vAcgoS81AiKNW9JPGQiNeLEUvW4bpzsQZgNcmhM1dpPCGJKZiLQYbT10WVhZtxYt9KLNkOs=
Date: Fri, 8 Jan 2021 16:27:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hypercall: fix gnttab hypercall args conditional
 build on pvshim
Message-ID: <20210108152747.eyecaw6opcvaqn7b@Air-de-Roger>
References: <20210108144123.58546-1-roger.pau@citrix.com>
 <26f9456f-6741-1bc0-053c-9cb4733515e5@suse.com>
 <20210108151127.k5esycwouj2k57kx@Air-de-Roger>
 <cadf4328-0421-e9c0-5523-cb107d71457d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cadf4328-0421-e9c0-5523-cb107d71457d@suse.com>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d53344-7d8d-448a-a8a1-08d8b3e9f6ff
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB337045C9CF84FF7743D942608FAE0@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkDAG9Sj2LdkSOKb48Nx2/ANKo2wdXTuz6lv/PrO7fBaCig549A5JYL9AEKXzgMGSq4Lqmr+kCWO6t8MQdq8kqtrxSaEBiF+gXn1C4Tw1J3195ZCyzu7gsXbbLwXcIny9Jn2LHGU8Zq2v7hhO+/flN/mzoLyGW1VBGxjZBvTQRW3EtRx5vGYTUDBBruOqHQ8PpcD/lIcZMGWLmDkE+0yzcFXrX1RpetNj5BvGumSxmYaJdMJxgBme4cE0/KWmirdK1Cnh2+qgKlX6clZF5t/LqcRHhH59t2AHbEdFU5Db1TrGS17rccDDTBLyza5rwRx9OY46x/BkeWNeAKFiXvi4aQq9zrCoa+cbkJpOKZQkO5KMX+r++uDmQmt8Skh9XMgCa/8dJ4JZlE5BZuSXkuTJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(66946007)(8936002)(54906003)(478600001)(66556008)(66476007)(26005)(2906002)(9686003)(1076003)(6666004)(6496006)(316002)(53546011)(956004)(186003)(16526019)(86362001)(5660300002)(6916009)(33716001)(8676002)(85182001)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TU5OdEFjb1o5cHgzYnlES0hqdE1EcGxwQkFBSUsvdFBPNEhqTVYxWkR3OGFh?=
 =?utf-8?B?bXVQUU03ZDBLMWhmdGFGTG5Zd2w1NFpDdE5Taks2VzlRRGc3a3dNWmt2ZUpX?=
 =?utf-8?B?T1h3WWtQYVFzRVhWWnV5bW44ZGpyalh3S0crdUQ2VEVPTWJvbXA3SmF2UEdh?=
 =?utf-8?B?Y09na2oyMCthNW1UTHMrem9HdjVLakNUajRsamlkYWk4NXNodEMvYlUrTlVw?=
 =?utf-8?B?a0p0R1o1ZVpDeCttK0Y3M3N5a093c0hZQnBhZzJIN3ZuRHFwWUV0STFoQnR3?=
 =?utf-8?B?MDhRanQyWTc2dmw4RmpCcTcrSnFqL3QwbmY0cHM0K1BYN1NFMXNtdm1BZ2h1?=
 =?utf-8?B?ZlJ2MFpsYzViYzZETXBSa1lGVzdjcG9uUm1MOGd6S1BQTWRiN21FekcrcWVF?=
 =?utf-8?B?VGtIaVlNdENYSHBhcjcraXNPdFUrSm1UOFVqbFRIeGNjbnVZMVo0Sk03enA4?=
 =?utf-8?B?RHhBYllReFgwb3B2TmN4c1Vhc2xONkRhVDZES3hJR201ZG9yZ0IwY1NON1NE?=
 =?utf-8?B?QkZzbEV3ck8zYXlxNmVZOXk0NFFiTE9ReFUzQzZzeVJwcE1HQ2lmK2VxZEcv?=
 =?utf-8?B?RjJYQ1hlNkFwNHhGWUpuSXozaFFQQ0NlT1RkaTI3YThNcWloZDAxcmdIUTdE?=
 =?utf-8?B?SFJRUXZsNnF4cWVXVGpKdGE5NWdmWW1rSUNQOWZ2TytNbWFvME5QVjFPME1Y?=
 =?utf-8?B?bHRVQU03dXdlWTM5aXJsR3ROY01ldUMwRmt6b3l3aHN4REtrT1k4eU4zMmRZ?=
 =?utf-8?B?WVZTbUNtby9lemFUcVFNcDBZK2VaVnVlK25FMWhRWkdLTXVRS1JHNlVJQUlF?=
 =?utf-8?B?bjJHWnMrbDBZVk9MZVl3V2tWUFJMUTYxdXVGblRkZzgzY0htdWpNNlIyK3ls?=
 =?utf-8?B?b2xBM0NYMThxQlhjU3I4MzI4VE1udUJycG5aaFhId3Q2a25FOVVSWFlZS0Yy?=
 =?utf-8?B?SEhlcFZRb21BQ2xwc3JNQjU5TkdnVWF4QWUvdkFhR0RVWU1weVR3U0dLRHN2?=
 =?utf-8?B?MVZ4VEF1N3VPSnlYWUpYSlIvVFZBRGltb2F2WXVtY2trRFltNGpFSUtEaTRI?=
 =?utf-8?B?cXJGdmI3UVhEeVcvK3JxRlJ6REdoVFNkVUtNc3pBZG9pNU9SQURhWkxFVk0y?=
 =?utf-8?B?L29tSzZhRlU5a3A0eC9pWmJ4VGFhRjdEWUJMQW0zbk50aFdFYTh3MzZmQ2l1?=
 =?utf-8?B?NnlZcno4MGZLcktBdm4wR2xTby9lS3pDQ05vS3FMdVN1bktYRzBoem5YSW9r?=
 =?utf-8?B?Q3JzMDUxMkJBdk9JK0tVTEJXTW05SmtnU3QrRExaMkVRdWZBeFJWci9BOS9N?=
 =?utf-8?Q?R8Gq0DaRIRUyJfQ9vMVVL3aoWgXoLj4/3Q?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 15:27:52.4671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d53344-7d8d-448a-a8a1-08d8b3e9f6ff
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D93RlD7dz1Sgeh1MWSZrGbbPgq+aM53bOXh6T5ky18qH68NDrFrreDQUTCg965IoAF7ray1MsjusoVfRPjFkag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Fri, Jan 08, 2021 at 04:24:01PM +0100, Jan Beulich wrote:
> On 08.01.2021 16:11, Roger Pau Monné wrote:
> > On Fri, Jan 08, 2021 at 04:01:52PM +0100, Jan Beulich wrote:
> >> On 08.01.2021 15:41, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hypercall.c
> >>> +++ b/xen/arch/x86/hypercall.c
> >>> @@ -47,7 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
> >>>      ARGS(xen_version, 2),
> >>>      ARGS(console_io, 3),
> >>>      ARGS(physdev_op_compat, 1),
> >>> -#ifdef CONFIG_GRANT_TABLE
> >>> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
> >>>      ARGS(grant_table_op, 3),
> >>>  #endif
> >>>      ARGS(vm_assist, 2),
> >>
> >> This is correct when a shim-enabled build runs as shim, but
> >> not when it runs as normal hypervisor. Just like the hypercall
> >> handler gets patched into the hypercall table (in
> >> pv_shim_setup_dom()), the argument count will also want
> >> updating there, I think.
> > 
> > Having the argument count set when the hypercall handler is NULL is
> > fine, as Xen won't get into processing hypercall_args_table if the
> > handler is NULL.
> 
> Oh, good point.
> 
> > While it's true that can be fixed at run time in the
> > same way that we patch the handler it seems more cumbersome, that's
> > why I went for this IMO simpler fix.
> 
> Agreed:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

In fact I'm not sure it's helpful to have any build time conditionals
in hypercall_args_table, but let's leave that for another fix.

Roger.

