Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56A79FC74
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 09:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602070.938430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggKa-0004Rh-DH; Thu, 14 Sep 2023 07:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602070.938430; Thu, 14 Sep 2023 07:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qggKa-0004NC-9m; Thu, 14 Sep 2023 07:00:04 +0000
Received: by outflank-mailman (input) for mailman id 602070;
 Thu, 14 Sep 2023 07:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qggKY-00044k-M0
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 07:00:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52652423-52cc-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 09:00:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7243.eurprd04.prod.outlook.com (2603:10a6:102:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 06:59:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 06:59:58 +0000
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
X-Inumbo-ID: 52652423-52cc-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPoULP+AkmseVC7KI+h5t7NvP1Af4PUd2gLUG1zw5rB0v+jXzx2EAmE3CoJYkpZ/vEi/zBMIw4jJc33sqQqBrKy5g8HwMJjXZ8P3ywtm517uWgqrrz142ljNR8SckbjzbqPGu0Q8U/bGYTpbEHfqEynyCLUmeF49GaleaMTNmRr5ZHnc0EHsdDwbECUq8Ul9WP7azwsDGwCQJWi+mAFzuNwrMaTe4Hs3cgbRXXOrDHH283qQJhrluYngpWeYCEI5KmlPY5kKAlWDPysuI31auslvjv9eoSytRozde3k4JGo3bCwekyT9ZxYqZ3sV6dTwohWkS7haUvTxgKH7k71GWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNVqWRlKJW671PoAO6GBReVSW3xVxxJql09ynBOPzRo=;
 b=S0WBiMQctNTbo2wEKIXHP/k7gJOtWFrdzDZFVAQ0Vnn/RZR+4bRov+IJ1uNhXuZtU7oFDKyPKHQt4MR6lMfxFQJvn/n+heamWPQcNCQvWfnsKVH+wUGe1W7d414i5HVoFyM0Xc/dvW+CjfZRMJAd1njhYUfQ9GbToJOTYQxZr9v7eyXwo6/wLaLaSvMZiLJQev6GmsmRyOh/tTRuD2mEyEKBZdRJsNOtKDqzJxf3dVU69e+mpPmaUlLUSaJvM934KNVW1mGhXx00BNPUshTZJK/yDQZjwk6wCe2PJEv+ACTi5Dm4SyaCbGOY1TVqwyOyJFFyOmkafSa0jNFcMh9ayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNVqWRlKJW671PoAO6GBReVSW3xVxxJql09ynBOPzRo=;
 b=cZRsR0TZQDJTrlr4esSKVTxsSi5nzFnxtvNa3HZtMp6oZiRqAgoAs4OQAsHWkAF6RJKDUBV16L8Wzns7bwa/lXkBKuYp3327vdP7tB9TdQ7WBwUfYOXhumLB+nlaSig21wQFIp6Bu/GU7yUC+19/XBg6LUYP7miLI6B/BoAl4Qb4qkOUwp7LKy/GeApZ7Deg+4Poxzu7n8QIh6lStrlhgetOIv7zzfoGb7Y9G8Yur/+mDxKstoorb99YH+Y5LpC2uEOiBbaExVjw57EvIwQIiJtMGjIAGKUqAJWCUFLVNmR88vcyso8q99YFAZKrtNNtFNSEvdDt9vuv4w8jExqC/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <346a4392-aa04-47ce-a6fb-af1e0bce1596@suse.com>
Date: Thu, 14 Sep 2023 08:59:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/8] x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into
 it's single user
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 35600f74-84b8-420c-cf13-08dbb4f03572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CyDZ4ZtHc3Tj8LKrYsiLhku27rG/xE1cpBJ+GipvLL3yrUHz7/nyNiztpHWa2iDLS5F9vOTHC92Za70kmr+By4rf7Th+CLwHsjbNpK43Zvzn7jkUlrmAJ/FcXSjI8y2kOy5b8W/SJItrNGRu/6Vnfmv8xDmq54rZs6XsnUDGitHFZg08bBte+vTEVPQmGzUf1DMTTc3J/NB81Yb0g9/noaZGgf+I+xz3gnu+uAXbxL9bouqbPJTR5TjxKJFHGqZ/F/DFU/+5fiA8ZMfvEiaqcqR92KKpTlGhsXLP5+U1OIhVM7vzlR8KRG0wGOQS3cOIe8lbgPEH8IcqnQBii9rMbJfaj1uSVjdu37UuoaM4OxexXUlNhmdr3jf1iwRoFqWZd7tg1J+3CYRC6crMVdri3RHzsBKSWV0+ZutPqtgykEYsFvQHReRkP1Lp+s9+7X8r0HlPwceCS52CJJiToL0qKoCowHKrLEZ30kAtrbAzzsQOlfHkYbgqtQpEt78M4/s9y1gGAnEmhPdTYMOlLqFnqs96GNZb0McsANtkwly+0moUz+9eWNhXCKrOhKuwIoJEiB3FEOy3XGEMBS3y2HHk0TJR1xqz2GA0ZK04HdamwlRXPaR/HIAgB5cpr+etezn7MPLezfGy33THHFLRH/ukmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199024)(1800799009)(186009)(2616005)(8676002)(4326008)(8936002)(4744005)(26005)(5660300002)(53546011)(6512007)(6666004)(6486002)(6506007)(41300700001)(31686004)(86362001)(2906002)(6916009)(316002)(66556008)(66946007)(31696002)(54906003)(66476007)(36756003)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2VibWZRZDRFdHJzUVlrS05PbjN2b1hsZ1lhVit1TmZ4eXNUdlprdUlabjhk?=
 =?utf-8?B?K3dyMjBBbWNZaUdmaHoybjFid2JVaXNDZEdYTEhzbThNcUtEYjhDd0Zjei9B?=
 =?utf-8?B?M2tkWDBYQUhqelM2dm9yb1pTcnhHdDhQQWJ2aFUyTmdRYXVSWi9MTmNBV2ZX?=
 =?utf-8?B?ZTJNcFEvcUswcDNCQ01CS1BHOExVQjJhWWl4dHNNeFNiWW12bGhOdzB2WStR?=
 =?utf-8?B?YzBjVkhPZTh5eWozUmludzFxaWJ4UmRZcVhDMEIvWUJWb0hiNGg4d1ZZL2Iv?=
 =?utf-8?B?eGpQc3BMRDVEYXlVd1lGR1FMWkdNWkh3TzFHSklxN0gvR0Y3S1Z2b1NqR0hE?=
 =?utf-8?B?RUdDTzJWc2ZCWm54NFZkTUhGS0FnMUFRSkhqTWNOeFVuTXZycGxoVkdaazkz?=
 =?utf-8?B?d2dZWCtlSzlYUTZKNkZvbHBSbkVSbEVya20rWVRhTzN1c3dzMUVVc3pLc0J6?=
 =?utf-8?B?ekQ1UDUydzhHcFBaeWhackJvZUViVHFMVnJVek10OUFlTHVGN3hJUW1YMENV?=
 =?utf-8?B?UUU3N2hMclJjd3NaNUpTUFdOWnBMRmcvWndBTU9ZQzRueStBMkVqVnhEYzZy?=
 =?utf-8?B?RWdpcjVzZ0lxOWYySUZlRUtLTXpiUU0wSDRmRFpjdExXK211SmtaSVZFUDZB?=
 =?utf-8?B?Q1ZjYjFCRUJaS1JjQk00azNRMGs0bjhLRnBZb01VcWxBSUtCMldGSE9sYlhO?=
 =?utf-8?B?WTFiYXFvNU5wdUZZUDVDTVJXcXpLRm5zZGxyT2tsSTNkOFpLWHBhSFV6Tnk1?=
 =?utf-8?B?YWNVU3JMQ1JsWDQ1cksyNXBOc0lTaXBqY0hScjU4MnlPYWcwNDdaaVBHam9p?=
 =?utf-8?B?R20xM2lsVXIzUm56M29PSWwyRjIwZW5sRVJabEl5dHZ1NWdpWjVTa25hZlln?=
 =?utf-8?B?QjhlKzUybGs3L0pXWUJLMnB0aWt0NitUVTRUaEtvRlJycmVYR2hFNXU1Mmp2?=
 =?utf-8?B?Ujh1NVZFd1lVNEJPTy9IRXd1MmdzTUY4YTdnZGZsVWlmeHM1TnI3dGJHTEZq?=
 =?utf-8?B?c1p3YlhqMVo0YVlwVFU3b2Z4ZnVCZ1Jua0sxalJrejJjTm5MdFdWUzF6KzVX?=
 =?utf-8?B?TExFRC9BSFc0eTFJYXdGVzlBQzZCVWkzZnlLUEtIVWtXbDdQbjVxb1liSVY4?=
 =?utf-8?B?cVBXbXo1TTFlTW9iNkxvU2tjOXJiZW15SmxGb3doK0U3OTFOandZRnRCVnh4?=
 =?utf-8?B?dlhhcXV0cmtNZ2ZOeXJ3Uk9DZU0zS3dUZk82TTRhNGhlZUoyZ1M4UDlrcDVu?=
 =?utf-8?B?ZWM2akVNNWQ5NlE1R29rMk0xK3BmdXdBaG90TmIrcDBHMjYyQ0lXcVl0aWc2?=
 =?utf-8?B?d29BTzhWcWRMMjFoOEd2VTFEYXA3YnJIeFJoWmduajNhNHVEYUllNEdmcnh1?=
 =?utf-8?B?TG44aTdPRm1pUHJMTHJiaG4xemk1eC8zZ2dVOXVQZll4b3l3VlJuYWVMSHRw?=
 =?utf-8?B?RVhuMzFkdXlIUWFkUDhQYTI5ZVROU2NCcVZpS3BiVE5ldEVHdUx4QlRQRmR1?=
 =?utf-8?B?ZXZBOC83bE85em12Q0wxUUM5aFB0cjlMd1FIUlk1dWdxN2JSZ3ZYR2ViVDhj?=
 =?utf-8?B?SmVkaEx3bFBxSlNXVGdaT1ZDOU4rcmYwSW1ncjV0YUlSNXFXSGJvUDlRRzRk?=
 =?utf-8?B?RGZ0bzVGSTJWOGRCRTdqY0tyblhwL3hGVW5qWURFU1ZZcS9kOFZ3dEJic2tX?=
 =?utf-8?B?SnVVY3B3VUJWNTIxeVNHNzJkNkNzcVhRZURLazY5NHIybytOd1gxSnoyZ05q?=
 =?utf-8?B?SElpWjZoMndQZi82bDJoSHZ5V25NcFFadEg0S3BoalVPTlYvQS9LZXcxMEdJ?=
 =?utf-8?B?cDVnR2w2c0NGYktrK2VMRHg2b0hpUUdvNFFxZ2lTUzEvbkltWDloeVpra1Vy?=
 =?utf-8?B?eFpEakF2My95QXliMTJ3YzlOR3I3dFV6SHB2NjJYZ0hkcjZpR2t0a0V4TW1l?=
 =?utf-8?B?aW0wK1ZTSU1VODFuUU1ycHpmeGNCelhUN0xGUVlaVGV5RWZ6cEFmcUVXRzFM?=
 =?utf-8?B?ODNLRHdpVnZVQ0xiZEpTbUUvM2VPaWpHUEZZUWV0OWl4R0MwMXVUbzhsREha?=
 =?utf-8?B?ZE1od3JROUt5ZGh5dWg1RE1XcDY4Y2ZSZ2pGQldmdGxJZlk4OGJFeTFzbWxL?=
 =?utf-8?Q?5UlZSzTaMGeC7X+qForAdyZQY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35600f74-84b8-420c-cf13-08dbb4f03572
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 06:59:58.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNbf1zsSP6deggvffFSzNm3zWD6gu/zG31U83QR/Iu1iZiMBsIyETCUXPb8+lLrLud8WmL+vyWPOEUWhv2+TbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7243

On 13.09.2023 22:27, Andrew Cooper wrote:
> With the SPEC_CTRL_EXIT_TO_XEN{,_IST} confusion fixed, it's now obvious that
> there's only a single EXIT_TO_XEN path.  Fold DO_SPEC_CTRL_EXIT_TO_XEN into
> SPEC_CTRL_EXIT_TO_XEN to simplify further fixes.
> 
> When merging labels, switch the name to .L\@_skip_sc_msr as "skip" on its own
> is going to be too generic shortly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



