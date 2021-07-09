Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88143C1F91
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 08:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153428.283483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1kPY-0005GF-Qy; Fri, 09 Jul 2021 06:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153428.283483; Fri, 09 Jul 2021 06:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1kPY-0005DH-ND; Fri, 09 Jul 2021 06:54:56 +0000
Received: by outflank-mailman (input) for mailman id 153428;
 Fri, 09 Jul 2021 06:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lQXj=MB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1kPX-0005DB-PV
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 06:54:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edd21a23-6c0a-48e1-8160-5314c5c172d9;
 Fri, 09 Jul 2021 06:54:54 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7--DkjzUFpNGefCoysl8usPA-1;
 Fri, 09 Jul 2021 08:54:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 9 Jul
 2021 06:54:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Fri, 9 Jul 2021
 06:54:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0195.eurprd02.prod.outlook.com (2603:10a6:20b:28e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23 via Frontend
 Transport; Fri, 9 Jul 2021 06:54:49 +0000
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
X-Inumbo-ID: edd21a23-6c0a-48e1-8160-5314c5c172d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625813693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIVQKKSJaH8pLHfH4nQaEpWHQQMqchVtwdLoMY9bxA=;
	b=RfRpaerhqahqWmC1Vh38ZD+B8iLty2Ls+kziGlTXyUl4e14jNHM3qx2et7KU9GmdJrGi52
	u4ilnKMm1RxnF7YOVdNt/GOjKBps87nn2Wl+7k6/6jqnDhBkjg4rWDBs+yZLRKD8AlnY6S
	PJzadX60DPe8FvF5Lfwzhvxf36Fuxtw=
X-MC-Unique: -DkjzUFpNGefCoysl8usPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt+vsjdkV96nWDlqu2/1g7cyf5FaLnDACTdZY+cxfigHttHQRG5qDRqbr9R2f4pvXmZbNdKwi8XBDwXXPZubtniSt3vlGBVVIwyI+CxwPsBmsfow+87+nxfNKLlASolKsAGlFrmsHGgyLe5l1tkuOvmuOJ+xXmUkM+qqDqUMkpoXqTK5qgWVWJSjYDHucVn7YshTKLZrDMluO0r52lu76F/lK99VfbUJqnH2/6kvSAgWkYucjEPEg74xB/haitJbuZljseVOk5jXf3YvuVVh9wlE2bA78oczfdcIitbTv3mkr24fP97ZeV0Ks5jQjE+qBGa6OAWvSBCudARqkpt7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VIVQKKSJaH8pLHfH4nQaEpWHQQMqchVtwdLoMY9bxA=;
 b=AXCaxeVZUExbbC9xJywoIXTGytlinWZ9q2xxcKZfLny4dc/MGA1uwhArUztCHFQJ/XXpD4lpeWZVMfQpifln7lYYLqqKeHW0qlLjj3BuhBbBZs01Yxq3Iebtf1JdElJWjyVcRJSYuTvKMFKCa7yIWf50275WG8JiM1PsPhgdQWFeAsm6zeIbpPzIEwNKqhM5LThOHshn0XzrydH7bQ9T44REwNywv0ocsdQRJtEuqhhwkVsHVRaX/JOyNH4dU7v9wDbkhBtnNXLfp4El6UbrsyKG6/D8gswEeq8CL5/yv8m9ca9J7JKlMhxwtu4jzYjziWX2JADmnuQlG48fSPO8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1] compiler.h: define CONFIG_GCC_VERSION
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210618164207.5111-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3731c0b8-0e84-9fd4-80d5-416cd2c59818@suse.com>
Date: Fri, 9 Jul 2021 08:54:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618164207.5111-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0195.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcffc0a9-4cbe-42e2-944e-08d942a6728e
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73750697830EF30B348C9567B3189@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NIQpBVgu12BbW4Xuz/YoAkKDapI+MdkkR3dScqNKnJT64PxFNRTxPB+lt6p+NZ81R1YF5PBNRgtlISEbCU6TwsVjszjcoXCpvgBYw3hcQv6XUVQseNbo09EgETtT0LCxgUBrIjeqy7F3o2K6b3bTnyXTX9f+DrGYQipsfHvemZ2GaeoHbyK3Gs+lXqbxrP0cxZwOXrCsIhf4T/PnuPUyS9Q2rd5AgfxjOKU/EKcZ/dd+z5mAHSEtLBd+1afN4Axru9Kk/kf4GAWQrMMDlxgBg+50fcLDN+RhkoqZ8VSqZ9O0SEL79sIMrnsY90hSuoieiZsZU95V5Z2IaFzyHDVOgxiPmGWaqpqLNfHIez+aW1ZJLkpfKBSwlDcoUCe11XzgZq9ET8T3STxiMSwSzdlLbUmA8+sXAgF1tj+BVAqzekEYV69mafMCj1NJ8otjxoD3xhcov7BvAVp/ncQFHBBB3GWoMEmNY+voFOahZctD0rpLwFaJzEVM2da6GnN1boLJHSXZNkCef6Bw/p88fwhjVN7jyg32MiwAjwtowLWrO9tEN+lueJK4xA34Llh4nLVuSwvBXRq7UYLX9S1e0a0JkcUWLQzNVPM647sYoCDFgZS7OyKWdRZr9OOyptbzKJvtIXR//jboPn553WngaQRRwobdNUrSYgRgLf56iebyzBVCvpphk7sNw+no1q61MGfo4HBq9T978Rk/Kk0HqGOpzExrK4OMDceMauyeu+X8ot4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39850400004)(366004)(53546011)(36756003)(8936002)(26005)(31696002)(186003)(54906003)(316002)(86362001)(2906002)(478600001)(8676002)(31686004)(16576012)(66476007)(66946007)(6916009)(4326008)(5660300002)(6486002)(66556008)(38100700002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRsTFdrOEIxRnFmQ3A0SWRqWm9UOVgxSW4zVURBTWVvYkFUeTJKNTR0d3hm?=
 =?utf-8?B?M25QdTM4UW5iYTZmMVh5TUVVRk83WVV5QzBZL1RwUTM0cEJDek9WdE10TXcz?=
 =?utf-8?B?SHRkbk90aXpzb3RmaDdLNHAxaC9TUFdJaFNaVHozaERha05IdnZ2R1laRkN1?=
 =?utf-8?B?U1daS284clFtM2hudEhNb3Rta3ZWZ1N0ZGF0dWFzcnlQdlRsQlNhQlBVMG9L?=
 =?utf-8?B?N1VYaEJkbmxXRTViOUMrWkU4TklkRnkvSHBLSkpzV01KRG5BOVlCQWNWVUlY?=
 =?utf-8?B?dHB2V2tMb20wNjcwY1FhZFc4aENhT2Y1WCtLTFFKa1ZTSjB5VDBsQXk3TEg2?=
 =?utf-8?B?eGlsaC92YXMzS0RPeXZFNDZta3FCWDV6TWVmSU1xRzFPb3FheG9yeHd6WjdX?=
 =?utf-8?B?N2gxK3lvNkx2UnFzMGFmNEhjc1BDMVhncWJ5NWdmc095RVFDMDdrNjM0Nk5l?=
 =?utf-8?B?OGVEQVhMZXFLRWVGNHVBbzVqT1BMbVRGZi9YdUIrWk5iazFpOGVkNFhOcjNn?=
 =?utf-8?B?YlY3L3dkNE1iZ2o2VGthc3RwUktjRG9qNmF4ekNRKzhZb2h4d3JOc2VrSHhm?=
 =?utf-8?B?Y0c3YTlLSlFCTlUrTU05L2k1bXFFamQ3ZUMwTzJvTEJta3ZCNG94bUxSZ0cv?=
 =?utf-8?B?SExZVVQ1K24zdTRPbEJTUEZ6NUpmcUFzY0RnWkZUTVpDb2xGb3k1L3hmbDZG?=
 =?utf-8?B?elZwVEl0WklsaGkxRi96QnBRUnlQVnZwRTUvcGRyYTNjcEtvZzY4Z3FMMldj?=
 =?utf-8?B?TGdIcmxEK2phVnJrNXhueDlLMkNtdWg0RE1CbUEweFRyQ2g3cTliTXM3cWli?=
 =?utf-8?B?T1NVMXVFYnRGdkFwRlVXRUM0SldtaG44OFgyanZqVG1VUTNnYW8xK2hrVC9B?=
 =?utf-8?B?cVMxY291Q0gxSFRPa0lQVGh2OFZES1BSb1BVbWZYaW9xbnN4N3R3YUdJZFA5?=
 =?utf-8?B?d1ZvYzcvSytuUFlzdW9SdEc1Ui9idTAwMWt5ZlFmdGJKUkI4RnJQM1pxcW01?=
 =?utf-8?B?SjJHTngwU0pwUlEzSkt1L2prOEhBdzhYV0dLMitIRngyNjE1RlEvWW9OTUU2?=
 =?utf-8?B?SnpUcktGdmk5d0dxd2U1NzBLYlVJWnd6bE1mTk5rY1RvSnZwVG5qME84TkZP?=
 =?utf-8?B?TEQvQWNOUlFiNFc2UjNXVTR4dzJpZmxlQkdKNjhzYVcxcHcvZ2F4Zk5rYUNB?=
 =?utf-8?B?K0dlUFE0MUR4OWZZVVg1TWErRHo4M1g0ak1mZ2hPRTkvZGJNMHNjeFA0NXdO?=
 =?utf-8?B?OXcwTWFHWmQzc280b0dFMW1KWW16TzU5WjFqOXdrSmZvVmE2R0FhMytZZkFZ?=
 =?utf-8?B?SDJTcVZwK240YnJFRzZ4Z2hrQ25FZVFKOVhmMml6SnZlSnJQVHdMUk8rbGZ3?=
 =?utf-8?B?Q0hXdTNGZVplMnFmVFNEV2hDYVhCUFExZ0h1VmdJRzNqaVl0TDJtbUNaanJH?=
 =?utf-8?B?cko1U2NMNjhVWmFDNWJCYkxxOWRWcHRCaWdVK2FmTzRxQXF2NExKeE5KSmxi?=
 =?utf-8?B?Ry9ObDJvcHlkNDV2ZjRlU1JWY1hzYndqbXJGWkFNeWRadFZqVzFMdWl2blhk?=
 =?utf-8?B?VjREazlFL05Jbm1DQUlINUtCcnRvZFg3QjRrME5nOXY5M1Z1a1RhdG1qZmdN?=
 =?utf-8?B?MzlLNHhkS0tzM0Z5L1pEUTdUS2c1VmJ3enB6cTQvZW0vbE93RU1BVjJ5NTY5?=
 =?utf-8?B?SDNFTUovSitEbXdNUk1kZnJVWVFyNW0rZTkzbFFvQjBKU25MUGVFOHR1ZmhG?=
 =?utf-8?Q?xevHnbrV3iF+SHFox4bK6lSqLYdb6X1FG9nagNZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcffc0a9-4cbe-42e2-944e-08d942a6728e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:54:50.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaLL+QDxOcKyXDelsf7SZO9njPtYyyoJR7PEABw1VLtcLHC3aEKnuz6CT6ejh7bAZw/Ef2NnV5AOo0CUefM8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 18.06.2021 18:42, Olaf Hering wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -99,6 +99,13 @@
>      __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>      (typeof(ptr)) (__ptr + (off)); })
>  
> +#ifndef CONFIG_GCC_VERSION
> +# ifdef __GNUC__
> +#  define CONFIG_GCC_VERSION (__GNUC__ * 10000           \
> +                              + __GNUC_MINOR__ * 100     \
> +                              + __GNUC_PATCHLEVEL__)
> +# endif
> +#endif
>  #if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
>  # define gcc11_wrap(x) RELOC_HIDE(x, 0)
>  #else

Having thought about it, this feels like the wrong solution to
me: I'd rather not see us introduce further CONFIG_* which don't
really come from Kconfig. The more when we have an even simpler
alternative:

there's no CONFIG_GCC_VERSION

This was introduced in 4.14 only.

Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -99,7 +99,7 @@
     __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
     (typeof(ptr)) (__ptr + (off)); })
 
-#if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
+#if __GNUC__ >= 11 /* See gcc bug 100680. */
 # define gcc11_wrap(x) RELOC_HIDE(x, 0)
 #else
 # define gcc11_wrap(x) (x)

I'll also adjust the original backport itself before putting it
on the 4.12 branch (where I think we want both this and the other
gcc 11 fixes).

Jan


