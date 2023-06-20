Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB850736FC2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551926.861700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcv8-0004FT-D8; Tue, 20 Jun 2023 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551926.861700; Tue, 20 Jun 2023 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcv8-0004DR-9M; Tue, 20 Jun 2023 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 551926;
 Tue, 20 Jun 2023 15:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBcv7-0004DL-9W
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:05:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c5d76c-0f7b-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 17:05:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8279.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 15:05:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 15:05:22 +0000
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
X-Inumbo-ID: e1c5d76c-0f7b-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l05JMuIUc2lShQpA1hMqkFwsPt97/1zC9MF49Lu/nKrZkSBd3lJb0HNQzCHn2y0y2LjvPZa1yY2DKXT4SIEdqIAKb2TLLAuN3+8Cg75kpp+EP9b5w/Oou6hjLvXqaY4dEBrMwnHZTv2nCEGfgT4gSKt5d56qOLsvJVHRfxdhcY7TS9iUYQZBdffwAD4S39OC/Cwch58JXL9KdVtCHexPhiPwLPAV1auIPJCmwazkWCjNtfu7F55hARPw3GJKjJWS+4sYibpPjxoJ6SVFT/n8RbWaVlAPX/kG56KNHciuZKs0zqZy9Vhxb+wCz0mSNniB+zkLywCt89efX800gZWWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0x3cZa8AKpBxjsOfbol4jW1yg3KsgFe2cghrzIORQc=;
 b=hSNXA0dLPtl/eNRXczKLuGusX0jM4l/D605Kp3zHQGyMCHfpV2KDSQ+s4eQpOgv+KW04kaqAmB6vGJd20FLwh+nOsv/+AiOCWsfw05o8iwpA20hzCGyHDhzYC9l63LjVwvHyTc56uVBV/8exq1i6HWnh+XtBejrE8BHNshyvIN7B6fe+nbp85bKv6YmFpi2klS38Mzpt3BetpeXxiVxOYcJkd6ypU03gj2UeOLlDx1mvaOi5h7+ML25mv1T2OhOiWs5JNgtlhlfCQD7EB65/MM7RKghIHLpRLKEJQ6VEPYrEx+13tOxqNqMu/NL9FsDbedcfJwfoooOv9g1Bm4Flhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0x3cZa8AKpBxjsOfbol4jW1yg3KsgFe2cghrzIORQc=;
 b=jtaUS4MZnyS5eZMM5oZphNGcX0/l2CLXcfXhWt573yQ+No0DLBZ/l54hBgghJPOrmv6oG+26FrjWzY3eaV/VnmX3tytUmBLvRkotpj/nKe+UHz/nypj6ci5oqRKVwkcf9DHNz0iVh8pW3McdpQky5mRm9wZ1tZLTmjtnDO9kpUmS95YhPfXzthsaNotlrOwgpWmunQZ+/IgJg9D6N90O5Z0i1h6jyRYvy+MfOVmwwfORNv/dcRdD8kn+tUm+dpMfmTenN2cehmedmTSE+UDJamyvFrDPZFvQtVGLvIIXSOi6tVYATTXmqwHBjT1Nu7ptyLxrSulpJhcuEIra/XZKXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a03d5d3-71d5-e3ed-235c-554931fa485a@suse.com>
Date: Tue, 20 Jun 2023 17:05:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 95eceab7-4957-46cd-b1b8-08db719fc513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IIPTKxuwvVQXR4vVq8NMh+kDatFn9UqDaME7yK+Tzswfa48qrJ2UzyGTpDfarYxDt+BrdGwKoxEf8Mu6x2bCaRtWMRHe+lej4SO6H/XSf2PbavKPlyAzYtC+UI/tcm9aZ+mXxglbL3U6kIwdu2DPRZWL4HtN1ZihcIOuAIMVtJe4VXgpoZCs44rTEO5pXl9QGhJrjN2fVfXh4UVQfwFiFkP6F4YM+Fj3cdF9JbmwauW/5d0haSZfeF7sh9tTV0akM/32IYfD+PM4Fz5ysfrF21nxaiy7kwXvOFTLYfuPTGNSUq108R0hf8B9xWNq0jzcCvhPADHxJdID+g/Fpm+0EKIxBn75zw0CwIxsrS7eoaAYJoyN9entria70UJvjccHu0hiXLRv5gpf6zYoUwjINdM7+CfBFF5z1zM1SlozSfR6j3/sp6ub4fe4HGcZbqRYm0WI8lXyMlf4tbmBAV9KRagfmUlCgnXdKQkyqc6nn1reNWEbbuo0Zdd5uXw/t3Qq+bMkQNbAQiBAVpqdhb6d01fIkk/yI1r2Dw7GmY4CyzIJp1RfQpAwyLtXw6Z0ZVKa0l+3PC2EuAl5lGQzEZNcjXFwvxZBfXy7xxiaf4z9/ZeDWt8IqPzCpzeTUSZmDBK4qL/ca5nzMv3msvBF8VBe9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199021)(2906002)(4744005)(6486002)(38100700002)(2616005)(53546011)(6506007)(6512007)(41300700001)(26005)(31696002)(86362001)(54906003)(186003)(5660300002)(478600001)(316002)(66946007)(66556008)(66476007)(36756003)(8676002)(6916009)(8936002)(4326008)(31686004)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzlWNlVhRFpSTjZWRVhaVjdybitKN3FsaFBRU3dwcDBwNkZIVS9VNndGTThV?=
 =?utf-8?B?b1Z4Ylo3M0NZeWFFWTlUWG85QkdKTDB5VTlPZkVtcnhOeGhPdlFjS0NmT1F5?=
 =?utf-8?B?VkwvVGpHcEc1Vnk3bmFXbXpEQzZNaDNzTXUyYzdPSlFYZDcrTCsrMEhzbk5Q?=
 =?utf-8?B?eVB0MHdMSzNtY0lqWmwyb25aZy9GY2dpR2xRLzF2ZWNrUzFDSW0zVkNIT1BE?=
 =?utf-8?B?cFdPMVRGcUVwbzJ0RG94VEhMNUNPNmtkQ0JRMWRyTm12TFdXRXhDd3dhQm92?=
 =?utf-8?B?Q0VpV1Z6RitNdWFqL3NrREExY2FVdlo2Q2s2QXlCVW81NHB0VmZTdFdpT2ZV?=
 =?utf-8?B?THAySVMwM1pxdXFzc3dqUDZnakdmWkV0Y1h3Vjd3MkNhd1ZQOXJIVEpScWo2?=
 =?utf-8?B?WWk3L01QeThoYnh0UVpRd1FCMHdmNW5YZ3Q1NE41NFBoWEFVTG1vMEdaZlQ2?=
 =?utf-8?B?cXNnM3krejRBdytKT2Jkdmlrd0dFWmlZTzBWeDh0Rk0vdHZ2aXFidGcxb1BR?=
 =?utf-8?B?Q3hrWk1yRzgwVnR3QTVYNjJPV2Nqb0VmYVg2c2FZdGt6K1grczdNaStVUk1m?=
 =?utf-8?B?QUVMZjFCS1hUbVQzSk80MDB4TjFTbTgzdGNDSDh3ZDcyUlN4U0ViK3FtSVpC?=
 =?utf-8?B?b3ZMVUFacFRLTWJYY1lMTm1BVUNzSEk5d0pSblFRV2lvMEJHWWQwS2VPc0xO?=
 =?utf-8?B?UXBGVmtDU3RhNDVhMHNtdGV5SEN1M1U4VzRTWWZ3S1RlNEUwbklQekVWN0g1?=
 =?utf-8?B?eEY4S25qbFZJUmRUNXJXUEVwU3hzVHY1SXdwaDhNMDZyZGtVcmVMdjZlQXhw?=
 =?utf-8?B?OURIbTQ3YVhCS2JDSHovVjNTWWNvL0ZSNWpPcWRnbXR6a3ZnYVp2TThrTno4?=
 =?utf-8?B?TXk0L2pxR2RWTHlQeUVrRDFWTzBxc2NyODRkZEhDenpDcVlweWtEQ3pvakpB?=
 =?utf-8?B?cURzZjIxelZ3RE9VTnhra2dERVhSNXhaeE1lbmdVMkY3eDBXSG4rOVlld21x?=
 =?utf-8?B?ZkYvMVBwdTdsTnZna2RLUmxGM2p5VjM5WWo4Z0lWdkhOZ3F6Z0pBTkhycGlJ?=
 =?utf-8?B?blFURWxMb1grSTVrSmlJb1FHcis4R1VIK04zaWZQNHNCcVZJWHdSaE1RaXlp?=
 =?utf-8?B?QU1JNmh3NXIwdjVpcFVOY3RLMHM2UEd1NU5uSm82bmZLWDNjN0ZSdkpoVG1G?=
 =?utf-8?B?Y3FvdzRSNjlMbTJIUFJSWE9aSk4zakFrOUx6QzVVazAveUJ5UlB6dis0d29p?=
 =?utf-8?B?VUJLRXRIREE3bmk1VWI3bTRKNTRaRTlIank2aGI2ZThNalFSakcyV2xRdkN2?=
 =?utf-8?B?VENZKyt0dTV5R21Td2RDOXpST1VoUEIrcmpCOGdmVGxBNGY5cWxMUEc3clZW?=
 =?utf-8?B?L2lvZi9CUElBemtiY0sxS0VpQTRkdFVYRlhZbzk2M0dubWlZZTU2blpPeEJ6?=
 =?utf-8?B?RVdIbDFhajEvYXMwcnEvSkJHVGtNMWc4aVVjMnMzd3FsUnk5UjBVQXVVRG5j?=
 =?utf-8?B?bGNzWWhxS3pkMnZKUzNSYnAwcFJiMzNpd0ZSaThwV2JmeWs2dFBzRmlNSTN5?=
 =?utf-8?B?YlRLaThXazNyRFFOaVRKUFhidU9XNktyc2FyL0h5NXF3TDVDK051WURJMFlY?=
 =?utf-8?B?UXF6L2VUcEg2QmZBZDcrVlBoTGVzQk45MngzUW80eEJMYUhaNUNPNUhvQjRX?=
 =?utf-8?B?U2xuRzNYZGJlbzc4TklDOEswNXhnYkxQcFltZzVOSlRaUlRSMzM0UEdwSzNy?=
 =?utf-8?B?NlpodksvOW02aVlwK2N5TENTemtNaEJhR1dSOWRnT1VmQ2ZWamN5Ymp4c2VO?=
 =?utf-8?B?dnNkcXA3dlRvV0FodHFKTmFWTnZhcE5nVmpZU2lUT01TTThNNldoNUpZdkxo?=
 =?utf-8?B?RFZIai93cXc5TWorc1QvazlUcE9sQ3IxSTA5Q0l4bnQ1eFhuUlJDak83dm9I?=
 =?utf-8?B?RG5hNHVWbnBKME1rWnRTaEhyejBKUk55cFZPcktlNTFhMW96R1FpT21hbEND?=
 =?utf-8?B?a3ZrVVI0Zm9NNG9ldWtPVTIzVnVmU2gyank2NDQ4TmFkM2U1NGswYUN5Wlo3?=
 =?utf-8?B?dy9LSXFrN3hjMFhpeks3amVLUVEwcmFvWXQzaWZzQnVCZTZjV1hVa2VUMlR6?=
 =?utf-8?Q?qJiYNIsmjgrD0DsWO+wejIwit?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95eceab7-4957-46cd-b1b8-08db719fc513
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:05:22.4536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9IQr1q2sURuUkzhxxUQZV1FAZ8YJnB0EbvqlrKHjj7YNfpMhgVzEvt6s27UIGM7ELO1k5qJGKrxSmC7gSBfXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8279

On 20.06.2023 14:10, Roberto Bagnara wrote:
> +   * - Token pasting of ',' and __VA_ARGS__
> +     - ARM64, X86_64
> +     - See Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.
> +
> +   * - No arguments for '...' parameter of variadic macro
> +     - ARM64, X86_64
> +     - See Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.

Seeing these I think you want to also mention our extensive use of
the pre-C99 way of variadic macros, which also includes pasting of
',' with something.

Jan

