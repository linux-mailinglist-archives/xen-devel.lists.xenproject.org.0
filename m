Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8F761C4C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569755.890808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJRV-00032Y-H5; Tue, 25 Jul 2023 14:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569755.890808; Tue, 25 Jul 2023 14:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJRV-00030s-EA; Tue, 25 Jul 2023 14:55:17 +0000
Received: by outflank-mailman (input) for mailman id 569755;
 Tue, 25 Jul 2023 14:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJRT-00030R-RZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:55:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2057.outbound.protection.outlook.com [40.107.13.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 430ed76a-2afb-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 16:55:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:54:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:54:45 +0000
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
X-Inumbo-ID: 430ed76a-2afb-11ee-b23f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+N4uUizyVKy/AyJ44iX7BjfRDvnmAvbwCCh9l9PIFwz3xIvSyYZKUOClOOPUJIMxDqLxRgZ/XqHacrYSu0/Djoy2c5cLm4qkBuhpZ3AF70IfUU21AfqekRTbh2Aoz3Lx6Ek2Q8uyqKHBEZv5M/ocv6bymbyHannEMNC0WRsfF2oIW5zRgRN1KAe2tpCjJyuVYnyxKtxU8h42ESDHIvZ9bTz6ltFpkCpjCw5S4/UgTJxrmgU09CWOOLlalp/joDOBpiouydIvCMGget0fSjko1LF/qJ/K+SNckh6eQANOm5vOA575A7Zn4b6i1zyAWy5wZBULEW9HxorEyDAkstomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFjE/0XmVuJbmKxK+1O3d8vmuyqjKCrcDoeceA9/uBY=;
 b=dtNUxpDcIj2dbjXa1GkdkyxzIRTNQDhy+w7tUwuaBWtWAK+vhvE7rEk8IJBL9hTOKqAH2qRBWYgYYfnAPy5tCkFFPwXj8BaOndKQ1Fzd5ZPHY31yfcV4MoPWDsiKrFhagMrOHXCeQl/qhTK/GOU8kO68bc+QNIFnZl48tnoK29ll7jZzEUj4Tk37wSGxsFARSa6To94b8S/njsWCCyV2dVGhIaTlp+SCFfxcnCRpnum50KIZ2e7GXo7c0ZdreA1Kq5q/cSWL4tAot+7r41c2vxCwj2HeU0jrOtSWU+wxaAQe6u2v7RI+m3ZvbhAs6ng3tuO7p4BDQ3cZyg5eiRTY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFjE/0XmVuJbmKxK+1O3d8vmuyqjKCrcDoeceA9/uBY=;
 b=hrjQcBp3VuYr0X9+6LXNNpEAnxrzVm7qo7Euq2lAmbvZ/fKun9/rDnzqABJkPCGmQCFMgF/iuPCrKOuA7uoEqBnqPPIxv8qF3jf8KRhGhrgklmEHHLMs/nc+yRBPT3juxmXBRkHeVzkCSaPmgakmzgkbP1v1Cq5zc8BMvgRVdbw3TUTUWferJUApxMpRdVx1vZCWk8B85yqaGLqy7NHAoM1U/LaCCvRCTydY3A4ggokxgauZwJCHMnLp9qzYM8xm2gOILpRpbYn05mTzLelkHuNB4snhgGO+bw9ZYFjp4rrFDUwnBuFTRqQakUIR0UPxiqP/UHWXAPc4630VFvjAbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com>
Date: Tue, 25 Jul 2023 16:54:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: a46b1e35-abfe-4b1d-c5ea-08db8d1f1618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7bVquTkkn8bgakuNvwjgDYJMJaC/jNBUHuV5Va1aj8nkCIlyKj8qk+UoQ7WEhdj4JE32UjRVCOWiyCjTZ+SwjOUQhlPMXPkWJTH3FonkXQeEnYCrXfCPgNlhjIZC/5N3yZZPsWFQzqG5adg9kQQeeorEo2q6sTC1UyUYNXjOap5DA0pac6tb/3ZOpwQjTCWRGrlanFC4rxVTbm3EZL2ssJMdeGs5SHlGXNvoqGY4u1gFY3yNJ/FKkkSUwD9CoZONIor5SuSjA06yCkq8qLM0p885n6e0kSGpGFz20BSXgPrroj3V+80/7gRcR9lkWHMFY7Nnkid5M0abVxHb+hCwgOi/XWiN/JtD04iXsu1I0ae05O8++aamsM8nX4+cu4dOLvo04j6N3jSuaseVKfyRFJKvO1hhPhxVsbs5Qr7EqfVf34KF/NHtM1J08Dpd7eC7PaE+sDqW+dgZ2gaDnq1jp3abu6b7HDsOiul82bsoW4NK2CPhuqcy/egEAQWBDemQTld0qYlyOMhGrDi8v9l8XQRcY/apTuypG/Ey8GpbZ+gPsanSVSEzEgkYryHaE8yJFILGvPGvoD4q4lhD5KNx57yGtJ2oP9qImwFngMSRja0gi30/gi0XRcICGIlgeV9ohZ2nNKLgYzRGM21NTDdZfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(54906003)(66946007)(66476007)(66556008)(6486002)(2616005)(36756003)(83380400001)(31696002)(86362001)(38100700002)(478600001)(6512007)(53546011)(26005)(186003)(4744005)(6506007)(31686004)(41300700001)(316002)(5660300002)(2906002)(6916009)(4326008)(8676002)(7416002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUQ2cHl6MGhXRlRhV1ZBcE44T01aNWEvaFZzYnZ6VHdVOGZKcjZiMXlNamNp?=
 =?utf-8?B?SHZSc2NmazNDckxXUnlOc2pXbE5pbkVJeG82T2pDeUJkOXBUNWpmQlVaQ2dW?=
 =?utf-8?B?bmN3VmU5TnFIUXVSUDdRQjBQcWxZNkdpOW5GTUZyUHVGZERWejlYemE5ZUxw?=
 =?utf-8?B?bUdaSXZkdUFsR1FJQlNtajRrcmZ1MzRLdjdnQ25qU05nREtWSkVtc3k3Q05O?=
 =?utf-8?B?ZjA2M2RRdG1Yajc5NW5PUFVhZFZCblVoME9jZ2pMcnA3YjQ1TUZzaldYb0RJ?=
 =?utf-8?B?NUIrWERSbDF1NkVibFBTYkkyeCt1UE9GNU0waURZVDJrVElBdnJaSGIyem5t?=
 =?utf-8?B?ZUhQbFJjUFgza0k5NnhGZVBBR0lYNHlnU2Q1NkthTUdmZU5BYnM3WDFHRHhi?=
 =?utf-8?B?a3dMeXlEQ1ljRC9YRU5RTWVyVWhlcTcxNHBtaThyOGpaWTJDd2RkQlFBVUUz?=
 =?utf-8?B?TUozbkZkQU8wbWxSNjMzNk5aczFyaHgyNW4vK0liLzlRZWpjNlVuVW8wZmZB?=
 =?utf-8?B?eUVLYys4b1QvRTFLME41WFZnUXVid056a29HNFVua1BOMGlZY1h3dXprWnk1?=
 =?utf-8?B?SUNuS1lmeHpiN0tJcFVEZXlVNE5kOUkyQnZpVGp2bnNQQXpPbTdPZm04K2Ey?=
 =?utf-8?B?SzRhb1lKbzljQ245VThJZGZsM3pwdnJVM1ZhTm51bEhQNUE2cVlXLzNtOUJ1?=
 =?utf-8?B?b3JzQjV2MGd4MTUvZWtEWHVMenc1a0NYMStvRDRHbCt2TTJRMUl4bzV4anI4?=
 =?utf-8?B?Q0l3OGhYSXlGcG91L2ZUNmo1UGdqaEZOSHZiQ3U2RWc0VGpLQktVM1JYRFF6?=
 =?utf-8?B?Rkk2Y0phUFZ4WGs0WnpheXNiMEFWQlZJcW81eHNSd0dQTEpWR0NpbDRRY0lj?=
 =?utf-8?B?NFA0N0Uwc28ySFZETkNXQnpTSjBWUFpnWllzL1hvcnJhRjVmUGVuaFFKZW54?=
 =?utf-8?B?ZFJoc3ljRkRQSVFLd21CZGloc2w5dURKV0s2d3E5VEpVdTNUVHFOYmVSZ1JJ?=
 =?utf-8?B?c0lqUVo2bkJCRkNEQ0RTSHN1N0RwTWdVOVVxbmdvNUxydUo4YjNsYVFCZDJO?=
 =?utf-8?B?QUNKSEVHaXlMZHRqWGFEMXVKbGRpbTZZTzFlNkM2NlRkanpDUEJKZWpKbHY1?=
 =?utf-8?B?bWIxMmcxVG52cmRtQTB5SFNpQ3U4OTkxZi9KTVlQM2VOUWFjUXU2TkNTVWdn?=
 =?utf-8?B?cXNFME43Wll6cGYzSTlnWWg5dXR5cWJFT20yd2htV1Rmb1BHUkovV0RJN0tw?=
 =?utf-8?B?V0N2S0toZjh0OXRXdllhanVJTXNtMjJmZTA0cU5ZSzFoMzJaSkZleFVBb0du?=
 =?utf-8?B?Ny84a2Fqd0l3dEhmenk3dTlTMzZ5cFI0ZitQZCtUU20va2d4UUNBOUhQQ2dq?=
 =?utf-8?B?bnBhVm50VTB4NkI0YUNuVXhwVWVCYy9IRDRNS0FUUVRYL1dxKzdvVDQ5bjMr?=
 =?utf-8?B?MWZpT05qY05LY0xnRTB6N3NPcmNxb2tENE9lWXd0S0d2WjNXK2dWNHhBWDVF?=
 =?utf-8?B?SEEvcEs3dmZ2WU1VaUFHT2xVQkcvMzVaY2pOWnc2TWkwWi9ZR2czSk9kODRZ?=
 =?utf-8?B?NVhudGlTamtlb0RMWDBOdkhXTGdOdWxSdUNKVVNYeU1lTHljbTdxYmlOMGdX?=
 =?utf-8?B?by9ma1pCTzVzTDFmL3lKd3R6Zk9yVjdYMFJESUJ2UmJIdmgxZzhVdW5ETjBB?=
 =?utf-8?B?RGUyYUR1NExRM1I3YjIwQUFSOFhwTWh5cS83WGFaSlNGbGJpeDM1SDN0ZFJM?=
 =?utf-8?B?aFdrbGorVGRkaUhQK0R1K2M1TnZJMTRWdy9kVXEza2Y5UlBGMVBUazJza05t?=
 =?utf-8?B?SG1iT08xL2dRaWttQ2FKcFhLb2FTdUt5QS9HekVqSlR3bGFBQys3aGJYRjFK?=
 =?utf-8?B?cHdkNDJEaDcyNEx3VzZidnZSL2lWQ0k2WWIrV1cvOFNKVjN1NUxxdXRoRU1p?=
 =?utf-8?B?M2twZWxPcm42L0JDK1VOb0JpeDFXNytEQ2htSG1NY01IcWZYM2NxSFhWZUpk?=
 =?utf-8?B?ZUNOem55dlZxLzZHS3JHeU1wWGo2c2lDYXFLdzdqai9DM0hJOVNHT1pia0U0?=
 =?utf-8?B?TFNWSXg0cFBYa2UvYXdaeWxHRlg3S28rWUQwOE4yb3Irejc3K2s3N1loNnB2?=
 =?utf-8?Q?i1ArLwWzviG07Z2I2Fb/bzoXY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46b1e35-abfe-4b1d-c5ea-08db8d1f1618
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:54:45.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+tsUYR+34H9zaqqSNuwExxItBVJQBoXIc5NXFL+OknZWXDdbHhQVcdhSiKT8uJZb3UjR0AO65k1YCBVnEzRdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

On 25.07.2023 11:17, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> To avoid any confusion resulting from the parameter 'debug'
> hiding the homonymous function declared at
> 'xen/arch/x86/include/asm/processor.h:428'
> the rename of parameters s/debug/lkdbg/ is performed.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - s/dbg/lkdbg/

But only in some of the cases. E.g. ...

> -static void check_barrier(union lock_debug *debug)
> +static void check_barrier(union lock_debug *dbg)

... not here (there are a few more).

Jan

