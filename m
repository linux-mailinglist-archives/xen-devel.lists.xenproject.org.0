Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982766C38C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478799.742195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRIr-0003BO-44; Mon, 16 Jan 2023 15:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478799.742195; Mon, 16 Jan 2023 15:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRIr-00039X-1A; Mon, 16 Jan 2023 15:21:41 +0000
Received: by outflank-mailman (input) for mailman id 478799;
 Mon, 16 Jan 2023 15:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHRIq-00039R-82
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:21:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c0ee68-95b1-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 16:21:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8091.eurprd04.prod.outlook.com (2603:10a6:10:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:21:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 15:21:33 +0000
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
X-Inumbo-ID: 77c0ee68-95b1-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgdYxScOm/IVRxxwqB9ddNzeE7jMkWe2UdxBw0k769iX1Hde3SDuIY2jd5MI//8OqE6rIa34di89SuwDfPT372kkoBe6Gv+uMYnyRTQ4PMis2bzy6qD2ERmyAK4Vc7bjZ+Z+wQdj308ismBBzTYOEt0sRwKgKNTYHew9T/88n7/DOk22HtwPDFciBvsAi2XjD1GBZPinDmJLSkEAB2LQZ05YNwnrMHnHm/qDXVIochCZqQIVfS3NTEC6/ZxVkK7nf0v7uXwzSUlN6oBnvPLuHVu6hUxzHrrvonaCOkbxtEvR8+WNk6OPiEqC0pWPsRgyfu8mFvYnLl3Gnl7WT2lYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxkvyELeO30gwo1hNMwGZ9VENPcTdBnlwf4A6MgvRns=;
 b=hWHPauMVJohbd9Jl+o77o4/3lLGTv3hbHDqTMv7+rnJspOq1fP22Dx2bS3KAB5iyMWcrO9eI2nnsfsfM6JwZ9hKgZFHMHwIS93sgc2vIJfGLSL/x3Qo9swLHc8RjUAwqZctM77CGPRsrPJZD8EIaw5wq3TEi3OTD4jFZ9eKhhI14fgZLuhZr31aM1jKFhErKHVgaFWNxRfTxJcq4udFqs3xRxm8nAPhSzuMISshdSR12LDMHJJpQDGPGV80X2o+7gZjCthS1l5fentmvtu0Vru6Fe/oqwO9v5N4hx5JL49UvPtBYC4wk1AkZocQFA9LxHJrFKXWlyVMg8jVUhOkmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxkvyELeO30gwo1hNMwGZ9VENPcTdBnlwf4A6MgvRns=;
 b=trgQfJ8eTMOjcc+V81d6M/JF4W/bWTAmDgak50K6NdJgoQzS1Z/+6jaMg+0htETC8jxn2JhaY+FPoHvpNSsPQ0YuP8oDDm4r+VNLPKcgjccAospmwZMdN2TzocojjTIjCCLihc5vUZBcAxU4TQ/Oj7gVwnYh4IsOvYsiKS0wjXjt0kHGwPiC7stbzg+zE63hoHeHPK4x8ww1KzcnGoyd56xnEMLrfaqL4uffGxGzcuAx10ve9VZdWsefkGkPNPHZfCYgbWcEybpwJGPB+CREQWa92ULpKbAHGkh4i0S/nVs0OMuOtmT5Bc0yjvAVl4L98Pc+x47uTxSOBka8LXwYPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <677cbd89-cbd5-87ef-8e3f-466242fc6012@suse.com>
Date: Mon, 16 Jan 2023 16:21:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/xen-ucode: print information about currently loaded
 ucode
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230113115630.22264-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113115630.22264-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 7589c9f6-4171-4cb7-29d6-08daf7d54e3f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pTa+MZUa/jiAkTysBQiJjamYpjNIUmtaXHYI/mq70Ykqw7VF5U8L7CalTkrVVNq6YJV2wY5n+QgjonllgqKTo1y9tVfYZoSfsBjGf3k+p/DGUYVfUHb05f0hqw/9XqDBscXHQDssI1S1CpRpISyQEV525zAlc8vYCm55wwj3Vww9/a8y08Fb4+2ifb/YDcA+2fD4YWuspnm3lyAbl7fvYwepB4Bi8I+i7T+F8D4gjn5T54xp+6rauJroitLTSTdOANgH6Ql+nPzYnfqwB7qJNZBmmOn1YTr9rcpfYJgtcEFUEZzeLgBTJ97C7P4a+9odkHvO8CaeeY9aLTCO7bmbS2vc7e2kRYUCs2cijWkBcMIV1xrnry5q8gyXJoeK3CAMItfyP9mV9Xu6yAQxudJl7Kj9mnSkdsyOoaaPOuwAwvEKq1jj6MrWxx6ClQ+b538AvTuzFSiD5ut0hXiPUUCv2S+udpjWrjzS9LinCqgGOZyFN5DhvM1njvy6mj4mvccEYvyBrMCkFA6WQUrFfRUS+wO2dufiM9TqEMim6bUzNAbhkZqzJsdpiUisCdbDkmVLolYva1XCIP00HhrnVkMaFrG9ih92JLvxWDl+XcxmN0EXUwQtVfLvB4wnIjWFTcm9l7nVMityL1mx8I/4mgNMKgKDc3l5hu/juVLFwEIj2IMeUThT0EImELboWLvx/i/nKK0s5qq+rf5ss4QSnk+jtUt8/mXYrM8V3tWYp27XOuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(83380400001)(86362001)(38100700002)(5660300002)(31696002)(6916009)(2906002)(66556008)(8676002)(8936002)(66946007)(66476007)(4326008)(41300700001)(6512007)(6506007)(186003)(26005)(53546011)(2616005)(316002)(54906003)(6486002)(478600001)(6666004)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FNbkNsbmRSWnRRZ1c2MTQ0QU1EVTlJVTFTZVZ2alhLZmM4S1ArMkxVNm1B?=
 =?utf-8?B?QlUwdVpJUkU2UXk3SFRMMmdmb1VUaXB6V2R4QW8rY0I0TWtMMDdldTQxMnRB?=
 =?utf-8?B?YmtHdW84S3B3TXY3RFZGNnBHVisyS2E0RzVMM0tXWmV6REd0dFhXVzcxRm9y?=
 =?utf-8?B?YXBwYnFhZ3E0aDFJdlVZc25QTWRNUDQzMkV4d2g0bVd3VGI3MkpsU1pRWVpp?=
 =?utf-8?B?WGJuczNSNWlWbjhQaTBmYUs1RHZGYjVWV1V0Q0d5RytKY1ZwOEtnQmVQT2hr?=
 =?utf-8?B?RXl3a3A4eW1HNjJDRU96SHRtUWNqSlRPcUdNU1FaSW9qck5KQldQTlM5WTJ4?=
 =?utf-8?B?MkVMUjVtMFY1bUVoY25OWUlsemxsNllML1gxbVd6Y1dzMXRIZXdxRjFqMmky?=
 =?utf-8?B?Q0VWYkppV05LOERNQXVtVFJucUF1R3N3RE1mdWhPVkorL0ZCWTcvUW9TZXVl?=
 =?utf-8?B?NEs3SDJTQkVlbE5ZWHJqYkh0QjlPRlV0QjErb2wzKy84TTQ4UG1zRGh6enY3?=
 =?utf-8?B?R1hpWU93ZmlyMTc4RGs4OGpxMThyZUkrZ2Y4L0dkTnNFbUd6ZnlkaHl4a2RW?=
 =?utf-8?B?bzlsVDExdkVjZlJZSitZTHRzaVpZOHgzNnFQWTdSbGZQWk5TeERYM0Y0ZnFp?=
 =?utf-8?B?bHFUeEdNNEpHREJaT241eWFMSnlheWFhZk5qWUV3MkZOUHZWeXBZQnhuMDd5?=
 =?utf-8?B?a2o3NWRha1VVZk9uMVVmazBpdUJWQW1OQjdQWlh6N2dLcGEzZ3NabHJralNY?=
 =?utf-8?B?UWU5ZzhtYnlZN1ZKVXgra3JiNE5MOGFGaTBCc3V0enFBVGthRlFCNWg1OFRM?=
 =?utf-8?B?QldHQXJyVXdGNTdoaXdsMW5KYjJ3WEt6Uy9aWXhacERwMzh0dC95Yk1nZGZo?=
 =?utf-8?B?R1F6V1AyQW5JeHh0R1dHK0IxalVWSWNROUpqZWpPckwyYnJrL1p5RkJGRXNC?=
 =?utf-8?B?eVUxZnB0OWdDTnZBdGVRWkJCN1VtQlU1MUhKNi9FSCtxR2lSb0R2UE1NbHVW?=
 =?utf-8?B?WlNrQjFIK1lkRWMvSTRWTnhIMWdJeFFTT084eE83bmNPVXIwMVUzME5QaTds?=
 =?utf-8?B?d011c1h1Skx6QnZhNXBJL0t3MWF3WmlVTGlsSG1HZ2VqSTdOb2sweFZrU3lw?=
 =?utf-8?B?WDVHQ3Q1aGt3ZENVQXdkTEJQSWhUbFRzZ09QOW54THdJZldYMm51NGt3NFIz?=
 =?utf-8?B?Y1NnNit0M3hCSC9DNE93SS9maThjQnpLbGFTQmRSWHh0REtGOFppZEtnNGpj?=
 =?utf-8?B?UUN5UlNkTFZWU2tpdmRtQkxPMWJabVRHb1RKQWdHM0xyNldUR0d6OHhob1dC?=
 =?utf-8?B?cDN6N2t1SHlEL2ZaNkQ3L01rS3BZV2s3a0FqUHM5emdZKzBOdHpCRmE0bCsz?=
 =?utf-8?B?eCsrMUtHcDVlbjNXa3NwUFRoUzUrWkgzUk9JK0I2cDdWcE05czQ1NjFYanJ1?=
 =?utf-8?B?a0hBa2Q1VkRjaTUrRitQSklsNVVseHFVR3hsdnZnWEpSeVJpL2pjYUdvbnBa?=
 =?utf-8?B?VVFoUGxhT0Y0UGVZUlFSVXB0NXBlaEFYQ1VCYnpNMVFrR2t3UlRRa2lPZW55?=
 =?utf-8?B?dUwzcnY4ckZwQ2RzODE1NXNYenFnaytCWFJmYnN1U2Z3TXBHam9nSmdhQzNH?=
 =?utf-8?B?azdaaU5VaTFKMndSakpudm5EZnpNbVVCNWdEbjJSUFpRMDRjTUZFcE9wVFZX?=
 =?utf-8?B?eEVyWTgzMFR1cFVlZERwSWFnbUpKblI3WXp5bEo3dnVIeXljSXBObWplZXZN?=
 =?utf-8?B?OWFUM1U1MVltOThxT014d1J5TVVKaWJHS0RjdVEyRmRNblc5a09YdHplL1Rz?=
 =?utf-8?B?UWJxbWhqRFhTcGI2OWpSY2xuWlR3SjVnVGptbS9XL01RRzdjRlhYLytRdFlk?=
 =?utf-8?B?OXdJNldaKytmZUNxMlluOFNrcGRXT2d3UHBlc0l2WTVlNGEvakpiejQ3ekl6?=
 =?utf-8?B?VUN0eW0vcDFtR29NVmZjRzNEQnVBRzEyQlFqMjlMQS9wRFJoTHB5K2dVUjNq?=
 =?utf-8?B?ak1MdXBaZFdrL0xqdldSTFpqSDJlUEhBL2J4RDArZ1QxQzhXVjA1NHJDd1M1?=
 =?utf-8?B?eVJ5eThVOFpHanNWRlVWV3AwTUxuSWVkUWdYSEQ4ZW8zRVpQV2JHRUxDeERm?=
 =?utf-8?Q?nzvBv3mv4szMB0jSIpcjseCY/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7589c9f6-4171-4cb7-29d6-08daf7d54e3f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:21:14.0922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTfmEdgiGOMLJvg/IXW6ZLOJqGHatymIlPCPA/34RuJl1KTyP1njMUXGfyymqlxDQvg16AAcSZfv1ohMlVIG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8091

On 13.01.2023 12:56, Sergey Dyasli wrote:
> Currently it's impossible to get CPU's microcode revision after late
> loading without looking into Xen logs which is not always convenient.
> Add an option to xen-ucode tool to print the currently loaded ucode
> version and also print it during usage info.
> 
> Add a new platform op in order to get the required data from Xen.
> Print CPU signature and processor flags as well.
> 
> Example output:
>     Intel:
>     Current CPU signature is: 06-55-04 (raw 0x50654)
>     Current CPU microcode revision is: 0x2006e05
>     Current CPU processor flags are: 0x1
> 
>     AMD:
>     Current CPU signature is: fam19h (raw 0xa00f11)

So quite a bit less precise information than on Intel in the non-raw
part. Is there a reason for this?

> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -226,6 +226,11 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
>      return ret;
>  }
>  
> +int xc_platform_op(xc_interface *xch, struct xen_platform_op *op)
> +{
> +    return do_platform_op(xch, op);
> +}

Wouldn't it make sense to simply rename do_platform_op()?

> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -12,6 +12,67 @@
>  #include <fcntl.h>
>  #include <xenctrl.h>
>  
> +static const char *intel_id = "GenuineIntel";
> +static const char *amd_id   = "AuthenticAMD";

Do these need to be (non-const) pointers, rather than const char[]?

> +void show_curr_cpu(FILE *f)
> +{
> +    int ret;
> +    xc_interface *xch;
> +    struct xen_platform_op op_cpu = {0}, op_ucode = {0};

Instead of the dummy initializers, can't you make ...

> +    struct xenpf_pcpu_version *cpu_ver = &op_cpu.u.pcpu_version;
> +    struct xenpf_ucode_version *ucode_ver = &op_ucode.u.ucode_version;
> +    bool intel = false, amd = false;
> +
> +    xch = xc_interface_open(0, 0, 0);
> +    if ( xch == NULL )
> +        return;
> +
> +    op_cpu.cmd = XENPF_get_cpu_version;
> +    op_cpu.interface_version = XENPF_INTERFACE_VERSION;
> +    op_cpu.u.pcpu_version.xen_cpuid = 0;

... this and ...

> +    ret = xc_platform_op(xch, &op_cpu);
> +    if ( ret )
> +        return;
> +
> +    op_ucode.cmd = XENPF_get_ucode_version;
> +    op_ucode.interface_version = XENPF_INTERFACE_VERSION;
> +    op_ucode.u.pcpu_version.xen_cpuid = 0;

... this the initializers?

> @@ -20,11 +81,18 @@ int main(int argc, char *argv[])
>      struct stat st;
>      xc_interface *xch;
>  
> +    if ( argc >= 2 && !strcmp(argv[1], "show-cpu-info") )
> +    {
> +        show_curr_cpu(stdout);
> +        return 0;
> +    }
> +
>      if ( argc < 2 )
>      {
>          fprintf(stderr,
>                  "xen-ucode: Xen microcode updating tool\n"
>                  "Usage: %s <microcode blob>\n", argv[0]);
> +        show_curr_cpu(stderr);
>          exit(2);
>      }

Personally I'd find it mode logical if this remained first and you
inserted your new fragment right afterwards. That way you also don't
need to check argc twice.

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -640,6 +640,38 @@ ret_t do_platform_op(
>      }
>      break;
>  
> +    case XENPF_get_ucode_version:
> +    {
> +        struct xenpf_ucode_version *ver = &op->u.ucode_version;
> +
> +        if ( !get_cpu_maps() )
> +        {
> +            ret = -EBUSY;
> +            break;
> +        }
> +
> +        if ( (ver->xen_cpuid >= nr_cpu_ids) || !cpu_online(ver->xen_cpuid) )
> +        {
> +            ver->cpu_signature = 0;
> +            ver->pf = 0;
> +            ver->ucode_revision = 0;

Better return -ENOENT in this case?

> +        }
> +        else
> +        {
> +            const struct cpu_signature *sig = &per_cpu(cpu_sig, ver->xen_cpuid);
> +
> +            ver->cpu_signature = sig->sig;
> +            ver->pf = sig->pf;
> +            ver->ucode_revision = sig->rev;

Here you read what is actually present, which ...

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -610,6 +610,19 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
>  typedef struct dom0_vga_console_info xenpf_dom0_console_t;
>  DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);
>  
> +#define XENPF_get_ucode_version 65
> +struct xenpf_ucode_version {
> +    uint32_t xen_cpuid;       /* IN:  CPU number to get the revision from.  */
> +                              /*      Return data should be equal among all */
> +                              /*      the CPUs.                             */

... doesn't necessarily match the promise here. Perhaps weaken the
"should", or clarify what the conditionsare for this to be the case?
Also your addition to xen-ucode builds on this, which can easily
end up misleading when it's not really the case.

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -157,6 +157,7 @@
>  ?	xenpf_pcpuinfo			platform.h
>  ?	xenpf_pcpu_version		platform.h
>  ?	xenpf_resource_entry		platform.h
> +?	xenpf_ucode_version		platform.h

You also want to invoke the resulting macro, so that the intended checking
actually occurs.

Jan

