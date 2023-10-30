Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F737DBCD4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625219.974283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUNz-0006Lr-GE; Mon, 30 Oct 2023 15:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625219.974283; Mon, 30 Oct 2023 15:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUNz-0006IY-Cc; Mon, 30 Oct 2023 15:41:03 +0000
Received: by outflank-mailman (input) for mailman id 625219;
 Mon, 30 Oct 2023 15:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUNy-0006Gn-1D
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:41:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba290a66-773a-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:41:01 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 30 Oct
 2023 15:40:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:40:58 +0000
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
X-Inumbo-ID: ba290a66-773a-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0nNTU9PbIjtIfc4ZSPhN/TcZ6YbRPXvTH4CnCuwiXKkq+9GPW7yFTzPe2E0aK3oOiJf4An5a85yiQwH644cg9zEKPqvP9v8YANln1cwNPqb7kIjNzMt9AjZVL6+Ittw37C8HqCTHpnM+rf2nkgevZ92mDxRgWwMSCw9p0kKL1ymKAMdAbSzlGKevKXp8FJ+v/8gUJgH+wZ6Rc2GIf4YI+ttnJVqsZbobvRpZEyW9BPURMtFKhTU1f7t+bkU9IYZv7kMBpR94jGjQEBdDpWxBHVFamyFbj6lTcEWtjy7FA4WOn61F4Jwwy5Vo/2yaqNFLqfmYN8d9WfTehQRQ1rq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/kTTMUA2mt3NDEF9ck1clRnQLEoedrAA3H4nH1t4rw=;
 b=oFdV9LqcFjlju/7YY0/10CzvRYH0WlE9GSTYjaljmqLMTHrEG7/cfSNv3Fzr2W15xqZCsxzGhv0BCdY8LYrFYxuwJ0z9QABBkS4y+XdczSCmiwZ/t6FjwbaAGb8zx7k+krKLzaHhu9JOlIlURZgBfcf0RuMXLend/hMuhp+nbmeUTWLwxLOVOkoapAQZqwUxTrYF4PnaHXFSKPoZMuP0kcp68OceRBr+RbJ3gBTOKYCZFQbBS2PRtH9Iv1tsIMrwNmzFw824xSfJyx8S7J5dnkjhzvBVy8Wc0CcgoP2/qqBFVO93DXS/u8KVw+wlo1js2MzNG4mb4LYpxSJnyPSrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/kTTMUA2mt3NDEF9ck1clRnQLEoedrAA3H4nH1t4rw=;
 b=aCV/N653F1eK4tOY9lK1ai3zYCghMYZ17JiIAWNzVULjAPlR//fFMyUh6aqXWL2jUGNuqsBz8RGqcTRSqIoC9E6UHp9eqcuO4fjHkG1HSCKQ5WUhbMcm08bU+Yw4ASVlHrQ/IC9II+SV9rHvoLmwku9A9wnsvr1tD/OlatThafWsrrljuq5vhjJ5AY+zh4vAvtfDkLfKdPBOPURmkVnZo+jnXGMHI9yqwMh0u7N/JWJB13OmcdJOoy9b6dCwcjypmTvC1JvewUYujNcW1SK2+x6uzwKTy1lCB/xjcvgPh6uKQLZiJbR0f46zlaNga8ooQHQ6L526pcZ2UXOFghZSXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
Date: Mon, 30 Oct 2023 16:40:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ef4a19-5d51-49f3-4954-08dbd95e9cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHxmFMCWJAAya935tuXksX7ZRc7+CHXTvp6bPOqa3Dvwe+O2UQaJ/n9YgcuxP+1ZH+pVyYkhj81lA7QdwtzHhjIaYunCbzARlojqUq7GSDmLFCh89TTLmjAQRBqRIBHNwsZlU/v/77m5gTKCAURlQEdMrwog02JO7a1NSmGF1x/AfcEMuA3B/T7DTa98aP5JeKjjFi9s1SJlz0I+vOd340is0zMl+vCxcK7HTj48PwgpsqS4cBDaFCRdhZrae8EGoGfDmTIrLRXMyhjw/JOVMNfV/olgcZsKSqqVu+ca/txbhuO5O+2jxwsSIRtAmFsvc8Nfw30UPgqLs7UPbJnKnjUq8z5i0dn4eul4Ey7Ul4GeykOgRYtPgVbmliqUvot2/WFndMqO4ZmxWR8kqpgP1eLW9oFNN3R5EkgGRhPp9cggYypY5wKvtvnKv5mY0Ui/vpuxsVZ3hFs5KSRU45ENZQ463srbvKg+10D/LS7hNnXLT+HJ5l5oFOh68gzqg1+8WwosA7WqRaVRJrGt9lq94uR128z5ahaNmMY6B5huokerhu52Y5JlRc8PZggd/M2yAFnMZETObZ+NE+oW7tPcJZBYlpSsezXrDxr2HSn8C9uLzGN5fwM5oZ+E3U5G9kuZG7d3Vu8kFxxlJiTUmrIR6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(4744005)(38100700002)(41300700001)(86362001)(2906002)(6506007)(54906003)(6512007)(316002)(6916009)(66476007)(66556008)(478600001)(6486002)(53546011)(36756003)(31696002)(5660300002)(4326008)(2616005)(7416002)(8676002)(66946007)(8936002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q214SW9vNFlZTVUrUnF0MklFZUw0dEx5YWQ5b2N4cGhrS1NVYVlDSXorM2tk?=
 =?utf-8?B?cjJyZFVwQndwU3hlUjgwRlYyK3dDNGNOSG0xNGROS3BjZFZSSGJZdjl0TnlB?=
 =?utf-8?B?SklObysySlVSbCtPUHk1dS92OHRaUmorc3VURlFXVkpZa1MxaWdDRDdWekNu?=
 =?utf-8?B?SUJFUUMvOVNDOWhOVmNDZ3B2VmRXOXJsZVdBMlRZQ1U1TEdLSU03SE9aQXNk?=
 =?utf-8?B?NHFweFlOMy9qS2Z0Z2ZIR0psc2NERXVOZjdPMHFNZmFJNWI5aWN3UXkveVNC?=
 =?utf-8?B?TTBKRWpnWTlYOVcyN0xlaXF1Yy9Id3QwNURPRW5NbmtsdHExcndNS1d6Lzhv?=
 =?utf-8?B?RkxSb3R2NmR1d0xTdGgrL2NFZ2xaSTdVOTFRL3JvM2R2SUtqdCtBRnYzU1Fm?=
 =?utf-8?B?MzNsNUQyQ0Nqa0RSNU14VnRYV3orcmczcmt0dU5Nb2NrZzBIbXdNM0Q3VlNQ?=
 =?utf-8?B?WmcvSlNEalBOM0NSRE01ajR3bFBDbGJ3UDBWU1h0UW42N0J4am9laWk0U2xN?=
 =?utf-8?B?YUJUSkkwM2J6Zkc5dmRuNTVCL2piaG91N1lLeG82K3dlRFJyZXVTbmI5Ymcw?=
 =?utf-8?B?VEZqVGwrTFJyR3VCQ2ZoYjBRQVlwZ213VEhKY0xQT1k3ejlrRnRhN2dhVTZY?=
 =?utf-8?B?VVJOWWxQSXlDbVBCK3RlSmVvWUdkSkVPVUVXR2E4L1VadGY4blBuRnpXT1Yy?=
 =?utf-8?B?R0c0RFYvMVErU0lsZE40ZkhjQ1ZMajhhVXhUOE1zT0pGODBLZGZoNit4WmIr?=
 =?utf-8?B?MUZBUnpkNXZRTCthMVhMbThsM0wwNys1cFR6TldWUHZJdkJVUEhYbVFYMjRL?=
 =?utf-8?B?QmtrbEtFaUtEdnBMYmQwWGFJc2d0NnJjUGFwbWVoVEkwK2poaklidFprcERh?=
 =?utf-8?B?MzFBVUhTbE95bk5UclAySm5kRFpFa3hjbFNkU0tzL3Vwd1hqOGNiakQzM1hu?=
 =?utf-8?B?QUFOQy84ZXN2QzBXK1VMMitmTXNiYW1uNU0xSVozYUc4WHlHVnhwMjN0ZzEx?=
 =?utf-8?B?VmZPenZXQ3JtUEZOMEpYOE9KalZhcThLZXh4T3VLZFRzOVRjWHlFdVRHcERw?=
 =?utf-8?B?cHVGUUthajhFUStYaGc2MzRIMmpscWhRMFRiTVVBTXBXMFhzUk9ZV1l6RmhI?=
 =?utf-8?B?U3owbWFVNlRVK0V0VXE0SWhmVGVFUkJXeWt0YjZnbjFNSkhUdFZWMzUrbWUv?=
 =?utf-8?B?eUlCRVcvNmlIL0FUL3daem1zdWloanJmQ2ZOUGl1OTllTzRVQjV6OWVnNGNB?=
 =?utf-8?B?d0p0c2ptYUs5MWY0TnpBeTBwaC9lSDlGSWVlUXBBSWFKZkd0b3N6NDhNcHo1?=
 =?utf-8?B?Ni8wNWRZRkY1THltcFhjMDVwUk9VNjJYNUIrZm5GMnJCZ0dnVkM5MitKWGlR?=
 =?utf-8?B?azhTZERLd3RGOFRMMmRtR09JS3ZhOVV0dVhEdnd4TGJBcTZWTlBIVCtJVWwr?=
 =?utf-8?B?MGd0MVdNTjBINkk4RXUrcDFWcEh3bnJmRVF1QnVXZS8yNnJXZ2pBZmFxTGZQ?=
 =?utf-8?B?S3FNOFdOQkRnRlBuQ2QySnkzbkRhKys5M3ZCdml0V2hCWExWVENtME1Mb3N4?=
 =?utf-8?B?ald4WlBHb0NKTnMzYzMwbkhKVTJYUXN0R2k1NWpBREtsSUt0M0Q2M3JqVzA4?=
 =?utf-8?B?L1lobVdTWXJGOFhlTjQ5SjliS2NGSDBpUm1qVUFGTUV5Nm10OUpsbWlMS3BN?=
 =?utf-8?B?ZkRodEhqNmtUajBuaGsrN09zSG5nekhJMEdjRWtQeWh5SGxESnpDWVluYlBK?=
 =?utf-8?B?S3Q1ei9kSE1BZTZYMlhtUG1ZaG1MQjN6aFJXQ3Z0TzFRWnc2NEJXQ1kyWW9K?=
 =?utf-8?B?UW5QcjEzeElFWWFEUkU4MmlYY2Y4OGZ3S0t1TlhYbktZZlZjRnljSGE1a2dr?=
 =?utf-8?B?UE1ScEJjcUpRS1BRU3g4Tk9HY2QvaEFmQUZBSHNIcVBFZVZoSVhCZm00TXdR?=
 =?utf-8?B?YitrTmZ2RXE1cXY3VUFkeHg4bzkzeGVMUGlsZUdKaENpMTVsUXZ2K21TNEFY?=
 =?utf-8?B?SjBqSkpZejliMTcxUDBrUFkxNGFwUmxxTDIrNHdSWWJXV2F0WjI5aE9SNWVG?=
 =?utf-8?B?WkY3cmpIUnZLUzlSdWs1TEJpZEoxbDljYzFQVzB5bTlmbHNIZUtCVkNZaTJC?=
 =?utf-8?Q?/hCl8XHfLYqgQZh66IIlg5Bi0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef4a19-5d51-49f3-4954-08dbd95e9cdd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:40:58.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTArSqYoHZ+eQGPRmCEBzlZZcmqwG8qkkR5SOSXGC82HsbaQYklpNXjTPyf6qMWUnosA555L9mrsUm7SipTXaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603

On 27.10.2023 15:34, Nicola Vetrini wrote:
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,14 @@
>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +/*
> + * Given an unsigned integer argument, expands to a mask where just the least
> + * significant nonzero bit of the argument is set, or 0 if no bits are set.
> + */
> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))

Not even considering future Misra changes (which aiui may require that
anyway), this generalization of the macro imo demands that its argument
now be evaluated only once.

Also another thought regarding the name: Would ISOLATE_LSB() be acceptable
to everyone having voiced a view on the set of proposed names? It would be
at least a little shorter ...

Jan

