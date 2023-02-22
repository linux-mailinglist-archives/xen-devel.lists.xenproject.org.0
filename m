Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD06769F500
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499497.770655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUoiM-0005Rn-9t; Wed, 22 Feb 2023 12:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499497.770655; Wed, 22 Feb 2023 12:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUoiM-0005PI-6z; Wed, 22 Feb 2023 12:59:18 +0000
Received: by outflank-mailman (input) for mailman id 499497;
 Wed, 22 Feb 2023 12:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUoiK-0005PC-PA
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:59:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e339c5-b2b0-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:59:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Wed, 22 Feb
 2023 12:59:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:59:13 +0000
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
X-Inumbo-ID: b5e339c5-b2b0-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5JsBXHElQlS+32LI3jTx78LMzaEYQx5/4VsV1owO5M0RPqzKDO7POVw4FdEKH5RHByYY3vkaJQ4/6oVNiW1V1frmQlXadZeCdz35COKbVoagb3S+JsRbutrSjVJIqtK3S9RerR54Ni/cyaP+bkIlJMp1YM83YvVFd079x+rFLiqpIeg3T5a6IC2P5nE9lommeakMm6lZ6D16ZPq4ScJFd2WwYZlvjtfztl0khZDZJlqXOJdsCrj+yKcFmUEndtdySBiMzRhxhISLaiYkee8y4xZe3SXT/928oD3Q63RuXulD1pQnXZ+dBd6xmO20ZUqofkw3axH9RlX0I18cO6OsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDi6Bfcv8Lu2yK3u1S8qbcPR/undBb+oSdjV0dUaHUw=;
 b=L3NTa959cSzifJxBBRGrkhqv1VPu5Ss3yGI2IeleK+YVvlUWSljN3Ote1BuLlwQQzlWRXJNm6P6EoCBp5p6affuYPlXPmZerzcL6Dpp+Xlrqni6QHVam+4ez60kOkhGDkXG5icPizjdgIkzxMzJr6tIf87mODkPkTN7AJxh7dNk+/6GomHlTSIv0rDK2/LAcwnPEuhOM4bHTnOmr85KsrmXTovOONJcCcGCmTzrR+D1bOYasOR5jx5UEAgCxLKY6sxe7fcMhaavOks2iKW65WVEhTfXV60pF8tfnN8E43c6M/Rz8HRE5YkYHIl+Nq+MPBOBqtudO6Z/Vgz9s8BgsFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDi6Bfcv8Lu2yK3u1S8qbcPR/undBb+oSdjV0dUaHUw=;
 b=uwShq5CfaDNYfYTr24ZlspGg3MxX++F0puLxR7r5OxAnM6Hqd3ZCzOIVSk/Elqs/OrWN6Ir+FFqYGSdPGZ02YfB4n+tE/KZ09dALdrfsAlfsx5ehE1WrAZLH0y9gxzD55v2Xs7pFejo93qoBO8cEEbwdqr81Fh6wJOQ6jSmgDD+KRf8ygOC08NG2QAPNdrR8HsZIsNqjM/HK74iT1epIvW6g2fsUvG4TDMFTU99Jhc0DuWohdGHm7J+0k8g44Uv4ZIc2V5+Mr70C/kuNO2mSGI1eHa0TCDWprurhDp0cDAkQNCBqHh7MhuHQ44eFuTX83AGzuies8Rjflf0LeEGx0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3d892a5-c641-c945-0f07-9bf0e8cf5e80@suse.com>
Date: Wed, 22 Feb 2023 13:59:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/9] x86/svm: remove unused forward declaration of
 struct vcpu from svm.h
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: e1290341-4748-4a6c-8e40-08db14d498db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E8+12TbASNxtIcQADlZ94ys7LPJsMDl0Q3ffpdJ34GhUvysB9zLk9DtlQKF8sct/U9rxWJiKjBApyfu3HoKJpsVRDDz0NV2opcbK2swJ6XBmux/thzeeG4xIN5TmlINjh6nmdbqFc949jclWEZCdhJS8C4ToKaEvbAODMDaY7JT4TCOMYT4twR6k6lf5W6fciZlTEeQGtU9hxKdnjhHqDwMR8+P6sQQAfQgrpVblujj+/PwKCURgtsiYSnM0/yqWxGxbNAmUpUTRlnGyAS755HKfeoKU9nz5Ibtrue++6vbXLFg+ywCvkr5UxCjNW4TXvg3wTE/1eS+nYud5RKMNrTGXW8DgCB+L4J20BNkg2JQUGu53DPlwoIlD8M0MVJthft6phQkMa4NZ44aDKxu6mp1Uwon1yJPbFTWDhL6fDi2WGH5KuQJbLeNMLSE1yRqxnq2P4/F7BGoGBWDFHC93dH0rv2WZp63MXEilveOKc6hnxLsf/is2Rfm6pB+8fzJsQIcxobQdq6B2D5CkJT+2bycGdBNiLsaBgPmg2Nuxd/AZ9YegeTEUt/FX4n8bkigiB2OF4CKGuVADc9Sm4LR1DAHpm5DCNreL5PnZ2pK9/K37v76/KkRMMaP0KlmPemPJlof87FsQsl6lL2e/rOSnDzHM4eQut9WEIBU5tHjo3dB23N1EJoyQQ7B6OtQ+C215ZXL5cnA+Z07QGLD1Ci4Rdt591KVWDJm4zoo5a34aAgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(5660300002)(4744005)(41300700001)(2906002)(53546011)(2616005)(54906003)(8936002)(6486002)(6512007)(316002)(186003)(478600001)(4326008)(6916009)(66556008)(26005)(66946007)(6506007)(8676002)(66476007)(31696002)(86362001)(36756003)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkJGTE9YRk1wRUpjYjNCNlJFN3VFWHlaUGw1OVFFdXVOOWNwM21KSGp1MU56?=
 =?utf-8?B?dDdJQjVBOWh1ZTZXU25xTGdqc05ZK1BhRmFnSThyajlpV0RPWnRQVzZ3T3ZT?=
 =?utf-8?B?ajBlWjcweDB4d3FrODVPM1h5cTZLMksvdndIc01sT2RrNFhUc1Y2ZFNpVXdT?=
 =?utf-8?B?dmI5Z08wckxpTHNIZVF2VFR1eWpzZU41ZXFmTHNEcFJCVCtBTWdBQWlLd3FK?=
 =?utf-8?B?MnVwdkxuYU1KWXJvemNNdHBhR05HWTkyKzkvR3dKQkxyRzhEWElGbnVMeG9o?=
 =?utf-8?B?QUc2YnNicUxsdkFiSTFYRFBJL0h0eE9NUCtMOEJFVkNLK29UZERSK3Yxdy8x?=
 =?utf-8?B?M1U5ZC9mR0NiamhiT0dBd0NkMzJMdGlWQ0pINzh6d2RZVWF0R1FkOXNFUE8r?=
 =?utf-8?B?UUlhcmZyZDVOTmJ4d2w5SHB2TjFZRDJpcWxEVG8rVC93akxCbnhrOW9yVE5o?=
 =?utf-8?B?RW8yWFlKeERDclRwSDVoVkFwdE94VHEyQStRZzgzOUJiSldnUzlyWkh1Si9v?=
 =?utf-8?B?UEhZR0l4RmhMdW9YaWhITGo0eVd6OFlUR2JnbExWVFl3bjZ4dHJKWTNmdGFY?=
 =?utf-8?B?bzRHOE9hc241UVIvQlkzUWJSVUlLN0o4UEJSbXY0cW1qZFBNaG9mdTlRc3pr?=
 =?utf-8?B?TjM4MTB3ZmkwQ2k2MnpwRlBqQ1FzaVJCOXZOK0dXYXdVRjlaM0xDQXNtLzFo?=
 =?utf-8?B?MEJMU1BsZE41aFlwbWpkYlZvbjBQMWgvTEp5S0Q2akFVb1Vub0hwVm5uRjlq?=
 =?utf-8?B?RUY5Ni8vb0FESHdESW01bm1EMEJhdXBoQUdYNlZhL01FdkdLTnp3OEUreGxj?=
 =?utf-8?B?dEYvK00vZ1YySzV6T2Nkb01BUVc2MHpVSUtCNUg5L3Q3emZseUNHUlB4NGVM?=
 =?utf-8?B?cDF0RTVQZm1nd3NVZDBTaDlwMmYvVEFzZFBaQ2hDS01sWkM1SjFhREtDUUxG?=
 =?utf-8?B?V2RFUWZKdmNEejdPRDZncnlIVTdpQ1Vtb2VPZFJxZ2lNaGd6Tm42NTUyMmxZ?=
 =?utf-8?B?Z1dWK09zcXNUdXUxd1Rnb3JRbC9nejB3SUdycE54TVpUNFdPYVRFNzR0cUZi?=
 =?utf-8?B?MjdhdWpzckVsQndHTnkrWHI4YlFrdE1wblVUcEpmem9oM2hxTU9UcjEzTmdN?=
 =?utf-8?B?ZU5RaVVyT2kyaXAzbVYycDJCcXE3Rkg0NTA3YlNiRHlIV0Uzc1ZZMG5Uenlk?=
 =?utf-8?B?eHQydWFJYUUzL0tVUXgrNmY0Q2FSMXF2aHlYOXc4RVBKSDRBU2hOelIxZTNW?=
 =?utf-8?B?Ykx6Qlh5Q2VNdVJiSFFoMjdZYmk3Y2d6cUxxVG01WmU1ckc1STVrKzJyQlRU?=
 =?utf-8?B?RCtJQnl0U1ZwUWZlVVBDamF2VXkrNHozOEpua1o1ejdtNDREZFUwZ24vVTgw?=
 =?utf-8?B?WWhWSWw2V0hJTktxaFJibzVSWDFsZ0s3YnRUTUtpdzkzNHN3WHBiSlVwTlk0?=
 =?utf-8?B?WDRQUU04OWZETWE3cDgwMklITnk1K3VnMXNRZi9ZMGhBZ1NialArNTdPVUpK?=
 =?utf-8?B?Y2t6c2hBeXBUMlUrclRueWRkU0RLTFpCODd5OWxEQ2o2NW56dXNvV2NYM1d5?=
 =?utf-8?B?VUxNQTJHWHJnVS9qVzl5MFVHaEtXOTMxZTRGaG5SWko0d3ZLQUZvTTA3dW80?=
 =?utf-8?B?SE1Od2F3K2tFRE9BSng3U1BrZjNRSTlzMjdPZlFEQW1qbWJ5VEtNZmN4ek84?=
 =?utf-8?B?blc3Y0RtWTNPcHpEblRlbnZMT3pEK1lzSWoyNnpnWHNGQ2lZZHdaYWtwVHF4?=
 =?utf-8?B?TVFpekJsR2xmY2ZRUW54V2dkdklmT0E3OG5mRmE4MWNHN1RRVFNXRHZuMzh1?=
 =?utf-8?B?aGFYa3h2U2VNZy85RkV2ZlRIM21vVWNwUXFxc3JkQUV6eGtXYTBod2UvT09s?=
 =?utf-8?B?dTAxK3lYU1pDOGhxeVdodWYrV3ZzMUVGeDhNMVVUWHdkaXgzNEJEUXl3c2l3?=
 =?utf-8?B?NERWcWl6Uit3bVZnUUpoWUpJNWlYWUM3dWVPaXEzZmZsamJKa3ZvQmFtMEh2?=
 =?utf-8?B?RVJ4RzRBbHUzekZJMGZXL2h0d2EvQjBpbWdneVkyT0NnZDE0RzhXb3IyUlRK?=
 =?utf-8?B?blhOeS8xSUx2UnltNnUrYlZIVVpyZG1IZkxZNkgrSEZRWVk1WXVvSUN5aDFQ?=
 =?utf-8?Q?nITwyu3pviSVz5BeeVxD7zuiH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1290341-4748-4a6c-8e40-08db14d498db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:59:13.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmkoLe6vfWm+LL4l8yH/vmjNMyj+C81Djmlz9QJGWQ0umjO0TQvI5LN5TwBqR6zDpBsORFnpfYE1jiQVoyGqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9416

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Remove forward declaration of struct vcpu, that is a leftover since
> the removal of svm_update_guest_cr()'s declaration from svm.h.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Fixes: b158e72abe30 ("x86/hvm: CFI hardening for hvm_funcs")

I'm a little puzzled by this (a stray forward decl of a struct isn't
really a bug imo), but ...
> ---
> 
> Changes in v2:
>   - leave the forward declaration of struct cpu_user_regs in place,
>     suggested by Andrew
>   - add a fixes tag based on Andrew's comment

... I realize you were asked to add it. (As a minor remark, more
commonly the Fixes: tag would come ahead of the S-o-b: one, I think.)

Jan

