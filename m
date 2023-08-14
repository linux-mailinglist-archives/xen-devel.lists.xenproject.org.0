Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D677B96E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 15:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583655.913917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXKe-00081S-TW; Mon, 14 Aug 2023 13:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583655.913917; Mon, 14 Aug 2023 13:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXKe-0007xl-Pj; Mon, 14 Aug 2023 13:10:04 +0000
Received: by outflank-mailman (input) for mailman id 583655;
 Mon, 14 Aug 2023 13:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVXKd-0007g2-7F
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 13:10:03 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e077086b-3aa3-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 15:10:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9935.eurprd04.prod.outlook.com (2603:10a6:102:387::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 13:09:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 13:09:59 +0000
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
X-Inumbo-ID: e077086b-3aa3-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbKQoP7wWMKIcmPcex34DwquSY5pprVW8CWjQjqFBMrTQ8xD6UOX+7JY9y8WjvRaSXHHsMrTP3FWAg5BtRFJ/VMstvvU7cAlDQXW1Hvwd8YAdaIgzGk6q2bL8z79Uso3r2qHI6mlOIFb5h9UvQ1AqeUKAm0n4WS0wFe8DKFc/7jYqKWQtJkqUgd7cDCVD2qwJSdoEVW+5makPc7WTTO9dddqvhZUKRoSLS+5Gpgpw6sJGFB6K5RcPHX89KFd3SkIQNWqe8NJ1oCDx0uN1y+BlvdJAiYG5b7G2Ph7D60NW9iJ4cWOwzoKXc6YIj/nwjzj60AfO0MuVzNDnhHdwF8C9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhUGqhbsvQurwhVSpHDXzEe2AfP4y+OtWovnAEhmgEs=;
 b=TSBivBJUh7GcVXRP7Draw4ZJkxfKDrZ01Kq0VeFzxayfrcZ6HGy6W1COkz6sFZ6tQgf9cwvC0rrCLu/fFT+C00aIs0b338WmQ5CQty2KyFa7oBN2nY3v7mMf2t3qTorrrzRapemQdIHFfUdeCjLXc5NMs17rgqxEcN67SfqjWayfsS5GjxkOq9cQY2oT7uLxFmwrfC5Y0p7ZBFAMj/kkhMCsIHoKDPhvH/mGF2OGwIfl5m3nqWg08FfPUcCZ/X+VdQrK0BXQlfbUuaJXwu5L2aB/cqK3/xLnwbL5uBBQDR0TUo9qIJxQsQq4hIT/Y7qc11zOsTBKAJVXhtmOCFZ2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhUGqhbsvQurwhVSpHDXzEe2AfP4y+OtWovnAEhmgEs=;
 b=ama5yTMwUqmZaVMwJO4XRwmtnyT1UjrGHG75ykWFIRBX6JJVWiWnkeNhIXHpm86dQPVD4WRzwTlOe4a6TnUy5KlbyEB25uZrjs2obOh/wV1+QNirMs80u+GrxSO8zEcaZ739ltPyoyL7YD+3lOTovgQ+xo3Gng2HaOwthpzhkl0oEpYP+1wR5n3kuFmdo7pUxON0ztIOwvBkON5cxCw/pI09UiJBlqxwHoBjHEU6E0tGfYhkSN99izjFLvtpfZYqLqosuiHz8/ymTBgJ60AZUS6Wmr/yGq0cGNYuUTl9ttUz9QMc5Txxb/0ZWH6eoHcXS/6ZJ9WfqXIcdLNVfpufSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c59ef4ea-f6a9-fee5-282b-76a4533e04fc@suse.com>
Date: Mon, 14 Aug 2023 15:09:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691620546.git.sanastasio@raptorengineering.com>
 <6b965917ffb2185c541f04ff18a624282ca6e211.1691620546.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b965917ffb2185c541f04ff18a624282ca6e211.1691620546.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9935:EE_
X-MS-Office365-Filtering-Correlation-Id: 996b1a7e-38fc-49f3-d82e-08db9cc7c33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3y2Tsv/NqyTjctDMtff0Nv+nUOF5MZLMyxLiFJ38p4T+qNBLdXuWWjn+5aLtrqqFN2BUUs5Zg/AdhS87FArBIL89Getmivn/ED/mpoEJuZhtB8pLYCQH9EGp8BeaSq8hKGEPsN4UHyDZ3DgSNSz0l8IqJ131ku3YxmmTRjcTD4GtwOuVmWhIMTqEZ1d+nz8KRFS5gYdrDdFNWVDFZEcp2L/TpDWd6SxvG3ClDVzhNb85fe2Q7sIrwjudFtKStq+DkB/IY1J4wl2GY2xS1Un6cVgxMU9UW2Tgxm/6cHo0f9IuA11R1Jc14zSL3kcndhFNA97XX4WCS7sUykyPQALOHBe2xJxc4cMdzDFOI59Zm1ruSQncC12vw9Tw0tQC5YF0sH1ffdriWvR50MjLcV58RDcYkCOH6nBMFNkQV9Ql4rWnaP8wQfEEtjSpnqEEUqQDgE8IkH2mUY2Nkxd/Oz52kB4wncmXXuB5oUSXciYOkfxSBc47fDFnNMedVnk6TVMuY+gOy/epnUipHgBos7CFJpSLPZ//tU1Rx7eoYXZBpx8cOrMw1LXbsnervXKI8pgh71gnxqL27HycSdGu8ZPvTAWNw+F7l9YCjwqDDzlGE4ZDhk0NK8m2xRRdr9VD16UdnTb+GUp8PcDVr+WB9erY3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(186006)(451199021)(1800799006)(4326008)(8936002)(6512007)(86362001)(478600001)(6506007)(6486002)(316002)(8676002)(66946007)(54906003)(41300700001)(66556008)(66476007)(53546011)(6916009)(5660300002)(26005)(2616005)(31686004)(31696002)(36756003)(83380400001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHczN0kzV3ViMzhqZE9ZN3FZdjRKaENpZUg5Qm01QWkvRmw5N3RLTDdkeXEv?=
 =?utf-8?B?NHFqNXRSRC9taUllZlA5Uk1TWS9HRUtZL09xZkhnZUZadnhkRmhyMkNvRWRh?=
 =?utf-8?B?d2sveDF0ZU9IZG9qTFRIT3UrcUJ6enYvSjNqL0dsSVVWTnhDZjVvUCtNUnVB?=
 =?utf-8?B?QSs4ZkZ0YzlHMjBqUG9lMG5qUkZrcFRLUUNpRTZiVEpUY1lvMXM0endpbnBC?=
 =?utf-8?B?Z1N5aVNDV2djMnlGT1Vvd3NIak8vVVlSOHBiNE1pWkZNazhuZFQwQVZQdWJ4?=
 =?utf-8?B?eWNOMW5IQnhkblExbmRnMHNiQzRYVUpmVjFLcmxTUmcxU2JMNmQrNDJNd09j?=
 =?utf-8?B?M2RYQkt5akltb1Y1a1VwOThSc2xCSzhHVEpMTlJXQm90cE1aVTg4ZlIyN21E?=
 =?utf-8?B?VGJtWWF4aTEwTkxrWDRLZ00wVHdZTnBKREdRNUJ2b05PRHBMdDJLOFFaSHV6?=
 =?utf-8?B?OXlVd2JGQXpkNTZLT0cxWHozVlRQMEU1VmlEbm94WmlpWXZmNktVK05qV2xp?=
 =?utf-8?B?T1FacExaOGplQ2ZZOFROaWNhZ0RyMHZZOG9EdnVsS1Y4RTlyTk1VRytLT2VY?=
 =?utf-8?B?Z3JLNlFlYzZSY2ExTExTVGtWVDNhYWFZNVNaMWRBWmR5QnFUVi9GZ0hXdHlF?=
 =?utf-8?B?SlJDem5zQVhibVpuRXFVM08yWWhpQ0pSNmoyNDZFbHFpcWZTcFgwK2pDcStV?=
 =?utf-8?B?SGhoZXJONk1wK0l4N3RUdk5GMzQrRkxmcGc4YmRnSHMwTWhXNzlUb2VzMjll?=
 =?utf-8?B?RC9RcHpQb1JGSng1NkxtQW5jazBmbFhjemJ2UktVcHpGTDZIVFJuUlljWW4z?=
 =?utf-8?B?TVA1T2UwQUdqVEtXMzlZSThzVDBUNHMwR29YM2lVR0xHeGdEOGE3YnJEMnUy?=
 =?utf-8?B?T3IwOS9NeXpYNDNadWM4R0RKaFZOWTcrNHZmclJFamZ3MndsRlIxYnhHUTJF?=
 =?utf-8?B?MW16Wk9wR05qOWhyWXgrOGRKMzlyUGdEZHlKdlRObDFMUjRZdFFzNnBHTmNJ?=
 =?utf-8?B?QzE0RXN2SVVrUVpBZ3RtMDdhUGlpa2ZxdUk2MTlqN1MrRlhMUndKVVlRZ1pB?=
 =?utf-8?B?VXlHdUhtMzZkdkc1TmMzNHNWVFpTZ2srMFFDVW91eEFpTW9Jd3FuLzNMb2Ns?=
 =?utf-8?B?czdFZUhCYXhmY1kxTmJLRXZHdkllenkxTTlFaDF0bnZ1UGN0VHoybG9vd25P?=
 =?utf-8?B?QzRqdWRWMGJyNnVlR0M3YU4zaCtuQkQ1dEF2UGsyelQyRnk2NXp0Zk9teHJL?=
 =?utf-8?B?K1A3aUxKNUNpVkxWdzZ6Zk5wMFRodDE3MzlFNmM3cXFncEtNYXFvOXEzbHN1?=
 =?utf-8?B?cDJGYzZBTGg4RlJxNXJoLzlPYkJFblY0RS84QVpsd0RSK201dXMvc01LbDlu?=
 =?utf-8?B?U3A2UXZjTE1WQkd4K0JFSm5GRkt2TVAwcy9VQlJ0SzVxanprSzlzN01HREcx?=
 =?utf-8?B?MnVueFY1aGJTbnZwMDJJS0xNRTMzUHRqTzIwc2tPZjdzQjJvVWR6bzgzd2Rx?=
 =?utf-8?B?T3E3MDZjWG5Jdi9HdThlL0FWdkltQm9jd2xMdkY0UTlQUUFETVZla0tkZ1Jp?=
 =?utf-8?B?ZFNvVEExa0JqaXN0elFjcFo1VnBWZ21rb0thd0txTFRqVmcvZlpJaUtBSm9U?=
 =?utf-8?B?U1pkTjZ3czhpckF3V2VFOEkzTmNlWG8weHFiVVFwMExTclR1QWM4bXhnK1Bw?=
 =?utf-8?B?OFNMMnoxZHN0T21qVURLVXdpNE05UER1c0IrY2dITnozcCtsZ1c1ZXV6WHcv?=
 =?utf-8?B?TnIvWncrMkVDTkkxd3ovT2dRNmlVNjd6YzRZRVpwTUk5UGxxSWFiSGw3Y2hB?=
 =?utf-8?B?bGYxT2doL2pqTy8zWTZzWEFXVHNRcDNObi95MElMK0l6djFtL2U1Si82dnRj?=
 =?utf-8?B?eTQzMkhVSUo3RHdHRi9xQkpMODJtZWgyd0o4TnRDZ29IR0M3KzJFUVlMY1ZT?=
 =?utf-8?B?VFVRQ2U4bW56UHRISHJSME9NRmtCL0xSeGhObmUyT21PMnNLZ3ZKdmJkZ1VV?=
 =?utf-8?B?cDlWckJwK3FTendvNytBRVhacmhQZVEvWDVQT3BzaWg5MWNjNDd6NndveEUz?=
 =?utf-8?B?aDQ5WXlNQjZuYlB3NC9ueFJqcFpPOVFEd1ZidzlydlYzczl5emdHVjdFbHZl?=
 =?utf-8?Q?FLlgYdfGZ9ZllULVAR6t6MwST?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996b1a7e-38fc-49f3-d82e-08db9cc7c33c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:09:59.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpykPQOt8rinqyNALPsF3yh2AXVRl9hebITN+k3pMkRWAp3aKyuMtwM1WywIB7ziaGHxcZSq3YlpPEVMOd6X/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9935

On 10.08.2023 00:48, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -17,6 +17,33 @@ ENTRY(start)
>      addis   %r2, %r12, .TOC.-1b@ha
>      addi    %r2, %r2, .TOC.-1b@l
> 
> +    /*
> +     * Copy Xen to physical address zero and jump to XEN_VIRT_START
> +     * (0xc000000000000000). This works because the hardware will ignore the top
> +     * four address bits when the MMU is off.
> +     */
> +    LOAD_REG_ADDR(%r1, _start)
> +    LOAD_IMM64(%r12, XEN_VIRT_START)
> +
> +    /* If we're at the correct address, skip copy */
> +    cmpld   %r1, %r12
> +    beq     .L_correct_address
> +
> +    /* Copy bytes until _end */
> +    LOAD_REG_ADDR(%r11, _end)
> +    addi    %r1, %r1, -8
> +    li      %r13, -8
> +.L_copy_xen:
> +    ldu     %r10, 8(%r1)
> +    stdu    %r10, 8(%r13)
> +    cmpld   %r1, %r11
> +    blt     .L_copy_xen
> +
> +    /* Jump to XEN_VIRT_START */
> +    mtctr   %r12
> +    bctr
> +.L_correct_address:

Somewhat related to my earlier remark towards using %sp instead of
%r1: Are you intentionally fiddling with the stack pointer here,
corrupting any earlier stack that the boot loader might have set?
This ...

>      /* set up the initial stack */
>      LOAD_REG_ADDR(%r1, cpu0_boot_stack)
>      li      %r11, 0

... is where you actually switch stacks. Using the stack pointer
here is likely okay, albeit a bit unusual, the more that you have
ample registers available for use.

Jan

