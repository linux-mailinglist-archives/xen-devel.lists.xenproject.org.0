Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7869DD8F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498714.769596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPZ3-0008Dw-8f; Tue, 21 Feb 2023 10:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498714.769596; Tue, 21 Feb 2023 10:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPZ3-0008Bi-5S; Tue, 21 Feb 2023 10:08:01 +0000
Received: by outflank-mailman (input) for mailman id 498714;
 Tue, 21 Feb 2023 10:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUPZ2-0008Bc-2K
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:08:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d86395f-b1cf-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 11:07:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 10:07:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:07:57 +0000
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
X-Inumbo-ID: 9d86395f-b1cf-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8RIi7JfA1peri8p93Vyez55b18PtZQO9J4P32gz0JZDiuuo8BLi32TMv93hXk13xvnvG9KfgimIXEvolp3ltIq4hUSz0YhYY3G7vp9Z2wd/Ww1er67O6oZfopgnCj0vjDKR4753TSv5vy2nuN/R1Zg39DzRvqqE9Rnl2WrYv7YsiMOs0LtoBimJRjA6eHFTnyXkVvDFKqaXMCQVr/dm9sAu0xgcJwzg3a9A3T5j+cBAh5OYL5QtNhf2McSvhWY6hWuXFjozRgQXfh8RbStiTjjHEVjjgzwB3Z7wRVgeJoOf/BCKJSbedWdAkVGHE4pLsgga7ZO/tiTG+f6mYjQQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nwxMrqXsXkvIK31EmztkiosJrZKAmAtMMBg0ncVPNw=;
 b=a279ZVspaAr4sQ/qoIpbd/1NB5BuLOoLdpPBfRcSz2Y+0oc6RW2qg1aPdG+brNmcGl3HOWZHOPBEacNXqJmoDlZ9qOsaiNtSPVWh8ViNEMiKCwxmlX4LZ+TSSTHcQM59xfdGkmhr00+GusASWp9kk4rjPlBiTFmTs+sKtW+n5pzK93pmyR0aUSZodFRrsOK110Fy8auhoCj3KIi5vb87xqhOuFB9Ca/8Xi8xIF64YW1RCf1H5ZGNJ3Zko5idtJd0GJp9rIsrnpf0vgJKoimV6xIjEkkP+cY2LXJjmOt9Danrb5FPo7HxRWNLvGJR1DefhBTLXCp6UPTeHYP2wPHakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nwxMrqXsXkvIK31EmztkiosJrZKAmAtMMBg0ncVPNw=;
 b=aeiaeJaexOylhghFV/PWI4mUwM2t5Yh3MVvsJE07zn3kmF+cYX6vinCxXPwj2gPK/cQP0GIrhu7zl1mbUVysbJ9cb/oHoca7DC7beRAUEyEVcMugXnj+4Rk6/a4Cy8TmwK0qmyKvh0/NTxpUaF4C6cy49GXuUO26lwHjbf3iR8uLKs/1OoFYJVylcC5FMp6HkGfUcsqnPriJ64CJvFr9PMOX+coxtzfp0ykYaZC6vU8ikGJVvZwpQ9VaFpGn7lW+iRBtM47BSQ0LGCPS9lxjzStHMQldhkkbUl2if/KmyH1ayCGX1qXqSpgfQu5naFQvTFbEzB/T4MxqrF3otH16vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c4aa332-07ee-e91a-50f1-ced9e36db2a1@suse.com>
Date: Tue, 21 Feb 2023 11:07:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: b1584505-8765-4d86-e4e6-08db13f38121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LhAX3haEdkyGf3s9OSMor4lw0vZoN2ylwkqQu73uCmtzShy39jJlsFtTmfbx5KmUxtMU8pZ3v0nuduxDJAjjkWqkEidLi/XoTPGu05CXZlMWo7fqNgch7MdScqofnMkGq8Vjd8xVKVkVbCux92RQI4UpzhdjTeWOkuKohATxYw3P9KbmChUHHlgCmpyR7rVwLEcv5gMp65MQDYrAD091ZHhUSpGtUK60rkWKnOL90VBxFVr+71+7s2MVhSOU8SKEtZdi1Nj2ackS4nVz0ZpdVLtloKA6To/Y7JOnBQKN4zWl9+0K7auS6sE/6V8MpidJFQAO7cCX92fWfnowBtr4tCcFwdOXO0nQClQ5h8qMRC0SS1qsHn6YsZEuAm7u4W3l96KxRVTR07I4g3dbtePWWofuz7J06BOY+iP5aPu1FdvFZhxR5jqC9NQ0gcYuoQQ0xBRILhZPk3SG817S4TX0agZMMi25HIcAqrCoKjira6aC9lkR5KSejWKimlp/lObM2cae+aJAVbWORMfAuYRVwnb3FSH3pxTtgkRfOVnPlX9LQCUhKkTjRGzJAw9LvZZwc6IOrSXh2OtCJY7QYOoV2ub5OdDa0447Kh4H95cLRpXYPMoNLdBZYjTakcMbhrpcUhkkfD0PZegw4OIPF42QoNdPWl2fg0/36CkTtCadwfdKdE76Bup9QwStDQWbrV9ykWEQBU+OzTXBLiPd7OUAArZ8lVPsY7KxLSDclXspIUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(38100700002)(83380400001)(31696002)(86362001)(36756003)(2906002)(8936002)(41300700001)(5660300002)(7416002)(4744005)(6512007)(316002)(53546011)(26005)(186003)(6506007)(2616005)(4326008)(6916009)(66476007)(66556008)(66946007)(6486002)(54906003)(8676002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNqNkJhZnN5ZWpTQ1NsU29TVVFjSkR3K2ppbTVwVXk5UlZjSFI1cWYxVFhh?=
 =?utf-8?B?WkJlanhWUHR1T0pPdHVUaTE2dkhZcEdjUUhVb1V6cHhlQnhrYXFVVzNxS2RP?=
 =?utf-8?B?Y01FV0l6TUZzc1FrZ2kwQVRkL2hoVEhLazBOR01iclU0d1dFNk1sazV5YWtv?=
 =?utf-8?B?UHJsK24vcGdGRmlUZFJ6Sk9hTllMbmRveVRBRU1kdWRBQis0cWpZVmdOYWFK?=
 =?utf-8?B?OUJWVWdkemt0QTJ6TnJWaENkN2l3UDFPK1VkYjg0YmwrUnl2eGZ2MkdROGZ5?=
 =?utf-8?B?VWNFN1ZrclhmamNXSkphc1R5bXZpZnpPUm5qV1lnSVUrNFdwd3RFRFNYTzlV?=
 =?utf-8?B?SU1YQnVmbGJyU3E4QXoxRUs4MVo3NkFqb2p1WTh5eFlzS2FnODdLWFpmVU5O?=
 =?utf-8?B?dktDcGEySWdwejl2K1NUV0JSazMxdkpxYU1tY3RzWTJsa1JodUxzTVdUcE1E?=
 =?utf-8?B?cXZZYVZkczQ2YmZXenVaNDlsUEdzdFdmdGg0SzI3ajVIT3d3V3A1Y0F2WUtG?=
 =?utf-8?B?NlNOaENqd2tCVHlvWmFMdkErbHFmSkpuUm1YcU51dnlwWnlUdDJBQlQ0ay9y?=
 =?utf-8?B?SXZEZDFhYS9aeXZRa0V3Y1g0aWRKL3A0VnM5SUkwcWJQNHo1QVBEZ3JZaEtl?=
 =?utf-8?B?YnZVRFFDTmdhNG5QSmpmY3dUQWNuK21Ba0h1NDI3SHROK0xZNFNMR2djdUtr?=
 =?utf-8?B?QmZDVHk5UmVWN3MvdEZUbVJHTHZ1cURzbHpIdzBJN3hpOC9wYU1BTVdNV2g0?=
 =?utf-8?B?bkxXb3BiQXhiWmZuZzh6ZUg3Sk5jSStMU0V3SkxxZEY0M3plNnFQRGVQTSs5?=
 =?utf-8?B?WHFmL0ZFNE8wM1k4MWxsT3JScjNSRUt5Z05LZWRXVnNBSlZORVcyWnNjUnhj?=
 =?utf-8?B?NXg0WDUvdlJSbFFKV2ZsUStCOGpiM25EWWFUOWhWaks5RnRTVVhVZjdWYW9i?=
 =?utf-8?B?dFFqeWdkUEY1UjJkU2NRSkh3K3ZhbjVaTjZrRFQzVDBDSEgxOUpEeG82WTRz?=
 =?utf-8?B?VVNqbDVnM1luS3FtNlVPTkJZYm1hNXVzcWtTNFRYS3owb0lhdXZVd0FzSzdj?=
 =?utf-8?B?dmxOamxwaWNlcmtIczJsMS9kL1h6RWsrNldIajV6eFNxYUlpNEJVczFNRC9q?=
 =?utf-8?B?SlVTclpWdGJTd0laVHVSUEthdEtRSkNockRMYXJpNHBNNUdtc3JwUC9LRlRs?=
 =?utf-8?B?VXdYOTNQd1FIVGcraUJDVXFRN3lucVdVaFBqOERLc1JPZ3ByQzFoTzFOampU?=
 =?utf-8?B?ZG45QzZTdDFGMGxvTG5vWkxGQW1QN0RjR25RSFdWS0RQclQ2dm5NUElpRW9X?=
 =?utf-8?B?cUxFTE5uMDFNVlI0K3VmSDJCTXNZaDRqalRtZURkb2ZlT2QweEMyQ0JmT0Y1?=
 =?utf-8?B?K2ZjMFRxRmxVMlZBZVd5M1o4bHY5SEsrRkZBMk1OZkV2amhwRWJiZjBVSDhn?=
 =?utf-8?B?Zk5rNWQyOENaelB6OWMrR2dKcWxQNVFObHkwbk0wbldWcXM4S3JTT1YwWStq?=
 =?utf-8?B?WW1VQUpaM01ZZSs2dDg2eVVJN1puVmMreCthVkJSY2xRQW0rYVdIWlJsUk82?=
 =?utf-8?B?T05DeW5nNGpaRDdhRjhJNGFGUWEybkN5MDdYNGtlc2tpZ2YzTHNPNzJpK3lt?=
 =?utf-8?B?UFdIa0s2S0ZGMUxUK2YxWGQzdjNpaGgzOSsvcGUxS1U0SThWN0dMUjc5S21N?=
 =?utf-8?B?MHpOVWJGeXo5cnlqMmVZaktkL2hGOC81M1V0ZVduUEFIaWR3KzZBZ2ZjcERa?=
 =?utf-8?B?YVpwNGMvWFBxZEl6cG1CZVlCZTZPZFRpMHNRaEFNY212K01rMThwWDlRb2V2?=
 =?utf-8?B?bmdKVkVUb1hvZWFZc09qKzNJM3ZvRThTTlp5UzJsTnBpZGZkL3NRZWZsZkVa?=
 =?utf-8?B?UUxjR1dFelhBSFVrbGxCd3d0QVViTVp0UzlESlhtSGg1Yk1yT0ljVy83aGM1?=
 =?utf-8?B?a1RsZmZsZnZRanFadkFMVG1ITUNpdDl4T0lUNTV1SkRsb0lNWDZ4QU1xV0JM?=
 =?utf-8?B?UXplRWZOR0YwaVhoRFJscWFEZnpyVXRxaXo2Rk9BV1hjdkFFR28yUThrc1U2?=
 =?utf-8?B?bjdJZHRmNkZxWE5jMGk5WVZMUGczVkx6cEsrbmEvUnVtbG5OK2RGMmw2MDl1?=
 =?utf-8?Q?LTyu7j6GANKKW70zkIjwNlNtZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1584505-8765-4d86-e4e6-08db13f38121
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:07:56.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3JgCAzIn3SwfkMOS4ej8MBKFksUwxAQ6cfRRkcjgK4KMy+6jn0+jeCJzFo6wwA8bcwOGMqdvOzG9yRiS1+9KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878

On 19.02.2023 03:46, Demi Marie Obenour wrote:
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" = "x"; then :
>  	if test "x$extfiles" = "xy"; then :
>    ZLIB_URL=\$\(XEN_EXTFILES_URL\)
>  else
> -  ZLIB_URL="http://www.zlib.net"
> +  ZLIB_URL="https://www.zlib.net"
>  fi

In v3 you said that this URL can't be used anymore for the version we're
trying to fetch (which I can confirm). Leaving aside the question of why
stubdom was never updated in that regard, what use is it to update URL
(without even mentioning the aspect in the description) in such a case?
(I haven't gone through any of the other URLs again, so there may well
be more similar cases.)

Jan

