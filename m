Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712277DEECA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626798.977379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTxR-0007tR-U5; Thu, 02 Nov 2023 09:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626798.977379; Thu, 02 Nov 2023 09:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTxR-0007qD-R1; Thu, 02 Nov 2023 09:25:45 +0000
Received: by outflank-mailman (input) for mailman id 626798;
 Thu, 02 Nov 2023 09:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTxQ-0007q3-NG
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:25:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe44047-7961-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 10:25:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9743.eurprd04.prod.outlook.com (2603:10a6:102:384::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.18; Thu, 2 Nov
 2023 09:25:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 09:25:40 +0000
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
X-Inumbo-ID: cbe44047-7961-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB5u89L6ySFYnMVkFbPSW4SNfTjgp78qRsV3qlyPXe5ioXB7T1HEUb6GAWjHhBwhc4QJD2gXGxfYpOvNHjw/rbfgo44vhSHiPK3GjcpiWmWk4Nn37fLNAEKYQJWOX2opt/zPz6ew5g/LRWuZCVh8Mj68sI6SR6wufxON62q28X6E1Iavlp67euSyhim2sWAkTLKbgz8YYLTMCqD/jULCBrZL0y19muKTnz894NcBKGDo/wLIVhk29i4upQQs/NtquqlYJDiyppYaZMY1FSkxmNs7HPuKxMsxkx0ULgTC+r0Kv7UQePy644QfG6ABbuYD04bX6auYoSiMfrChyvlNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpKVAJ0upb/h0b0UPw4xd9V6S+MqK9+HvGxKqgSlViA=;
 b=I50DOWqLpSUGDsZNwY/piLvMzT5AO07pVfprvpIKxB1XRAMgQK6dhwndNyJOWt7jHrGYUFkxOG1wFYV3zB3U0GxpB4W3GLmPnd0Lf0L1S8fg1+AomGwqqnG3Zv5lPNV/iTp5KSqRv7bljCV9AaFCV4pAWQH0EKcRDUdAHuoUP7ZMo3LqQKzK8IcZyTaWYTY0k3RaYXg1F9rKIhZpPfThxreGm2G9YPPjnoFC3SHQeJ0SdGszMmknZPCre2fOA/Pjy2OnNZLy0SqroMKRRjr7uLzDI9hnYGAXGWCFaDiODK/k+7yuhau/Dor6BcMGnYPTKNFf+MqVPq6pK2fjM+Ywcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpKVAJ0upb/h0b0UPw4xd9V6S+MqK9+HvGxKqgSlViA=;
 b=Kk3XGuIE8R6/B3+asZBQ+FfT/ksJ1JrixonE8HNGrSf1P3o84eo6w74tWmlPJMoNOtMPuIFPcsVt1ZWUn9ukmw6GFMXtLW+TdLJKfWU5YKt2THMnGIH1YaWvxCG2rXMM3zJyI51mEcKGgYvgjsx89mixHabCg+6vH1qwZycVVok8AUhsDOBgvDpDWoFijCP0N8lAp8qr04YYLW9gxkgiRHEMKHi7C/Ge6mz0XJiFcasejpbCZOnIlUhL6HszfDMJESTFe6QtZydud6x9/0T2W7JWrcUJuHzgScpImFITUOHiJpihIX3Lr0XEI88UPeUNRs/bqxPskjuJldI5OWqQDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f16a725-0082-c43f-bab4-b6f647b103f6@suse.com>
Date: Thu, 2 Nov 2023 10:25:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] build: simplify clean handling of extras directory
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230823083940.20020-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230823083940.20020-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ead45d7-3908-46b0-d785-08dbdb85add3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KiTz6moQLuz+KC72LLTczdXpQKvV8CWb3Z5eNwQjbJGh6Ak4dZ5wK9j7jU/QBd4Hua9TbnzNHV7ZzUFOS8OGUYNO1xV5Pu5EZc0dErtymGyBgDKCt6B6pp5HLZgPdOGCOzF5DHepzLGeftqFTXj39d1/sjkeed4pTcN4te7WxQU3wJ+eHIiPdWwFXzobbzVXA5WsBIUvcH3uz4ctC6SpcgOlu+05OKXyYoEYw6KTCpxaUWOnMH1UlF2PZwqzlUgHtaZ0c/bHEkB1LrgoauDVfCuL3YLaMr9i6oCJTrqETiKR9bJzkH+ScF6mqDPfmArR+bb2CP1dShbwAQb8/vmGBZM0WMvH2Lk+69ciot2o0rEZ5EkRx19RBGkKsI4S0zMH2pxGIDIZ5OJRIH1Gu1by+xLbCCX0rx+9Qx8e4aJA42K/5hjUAZI+I3MS37J0JmPh/eOPb4yptCw9fAHKkPXGd7F+71h38Tl4h1nfsf43xqFuCEP8PYEg7s5rpThLsLaHs5Ns/Na/5F23qjPLT+khfNYv0Q1uizZd8bYMebwRYC1vnCfzv9yPVpA9Aza0UAI+jaF/TgR0101Fg6ubvfUP5eM7qCg/Av2kpRoCTCBwZh36MgMoBY+rn1/mNszs62TtPJQRx7TuKMJLfOCFZ7b+EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66556008)(86362001)(316002)(2616005)(31696002)(4744005)(83380400001)(66476007)(2906002)(37006003)(6636002)(26005)(54906003)(66946007)(53546011)(6506007)(478600001)(41300700001)(36756003)(38100700002)(6512007)(6666004)(8676002)(4326008)(6862004)(31686004)(8936002)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9HVjQ5eGVkVHg4bHdza3BCRmw1MFZucUhTdkxFeHI5NWh1clNNNlAxMGVN?=
 =?utf-8?B?Z1VyUklxaTJsSVZDOWk4S2pPamtGamJUa3FzOEZsYy9QQ0dhWEw5OFBQMTNz?=
 =?utf-8?B?RVVEUjRGalhaTkdyVkhxY3NIckU1Mlh5a1o0QTJvQVlNSkpBOXU5TjYrQ2lv?=
 =?utf-8?B?R24zd1RqWGo2ZXUrM3drWHBQbG8xK1VqWWRzdk5ReDR4Q2Q1ZHpDVndDL3NH?=
 =?utf-8?B?SjAwNEJvRXZVZ09tVjRXaGsxdURpWTRkMjBYYjRGSDAwOEpNcjN6bFFhaEsx?=
 =?utf-8?B?cmgrT00zUGt2dUNKR3A3ZjMvS0huaC9sWWlFWXdac1M0NHhPZ1BmSGdwZGZG?=
 =?utf-8?B?cXVUUldhUkJjKzc3dElHTTZLanl0QXNUSXI2MVBXejl2SCtPZXpHZXpoZnVa?=
 =?utf-8?B?ZWNjVGRuNDQyckJWdU1IVDhDZVJOMkQyZTZZWFI3NlFjRTBxNlBSWGJEa3hm?=
 =?utf-8?B?cXZ0QjBTdU5aMDh3YkJlc0hTQU13a2d6M3lTcjAvMkE3SFhSREI3L2lwb1c4?=
 =?utf-8?B?Zk5vUFpxVTF5dm84N1Q0SVV1dlptRXJZamZ3TEc5NlBZaml3Uk90b2U2Zktu?=
 =?utf-8?B?SGVyTy82T1E1MGNxRzVJUmZ1dmZZck0vcC9ZYzFQMjNOdHdJeHdLL3R2b2xX?=
 =?utf-8?B?MndjV2tTeEF0WHlLd09JZ2JMOXlMKzQ0a1NjY0h0TUNSUVFWWmFsK0xSVWRx?=
 =?utf-8?B?K3ZacWhvOFovREFmeDF1SkpYNUhEaEJUb3RlSVlNZ0tDeWttV3hSWGs2MmJE?=
 =?utf-8?B?L2d1d3lNQUFOVlp0dVRvbGhmY0U3MGl1QlB3ejdvcUtWQTlrYUpac3Q1aGlu?=
 =?utf-8?B?RGNIdHJ6Z2o1UjdTTjNkcG5DWEJES2hsMGZFU2hqbjFyYmNZYTNXM0dDbVVj?=
 =?utf-8?B?OHlIOXBCU0xIZHUzK2podTd1aCtYWWVFbHBQaVZpdXlTSW9vdVhFb096YzVJ?=
 =?utf-8?B?S3lLK3NxenNUMC9HRzAwcHplRllQa1hWalU4ajFoanlWR0RSUG4yV3hraTl4?=
 =?utf-8?B?Rnp6Y3dzL25jU0k3YUZPUHVSbDNkV2V0UnpEUGYrdThrdEJTN1dpSlppUWJU?=
 =?utf-8?B?eDFKeEgySHNHdU1WbGZCQWEyNHFHMWF2d2VFY1dzVHVtY25OUVJFRkFpUDdo?=
 =?utf-8?B?VkZTa09SeTl2MnoyL0VFTXlSbjl2ZVc5blh1U2owYi8yd2NST3lLYmFGSnI1?=
 =?utf-8?B?WDJwaEc3NHdVQXNtc2xvblJUUUg0L2o3UTNTOE1QOCtoUUtsSEYxVTlJVzU4?=
 =?utf-8?B?SVQ2VGtLTS93dTZxWWpVdThOREQ4MWVPblRrdXhYVEtBVDQ2ajBlZkhPMUZU?=
 =?utf-8?B?THEwQ2hIT1kxdEZWaE95bTRSVFAzSnkyOGhWL0JkN0dsWTVEWHZvb253bDFM?=
 =?utf-8?B?aFpXNHhzMUpZWnU5cVZ6Z3hUNTRyNkVSMWN6aCtxUFBxeUJWYlRKeVZqaDlx?=
 =?utf-8?B?c0xpTXlaZ3lHUjVCbnZWQmhKdkdTRWxqRW9kM1FIL3Q5dm5RN3BHb1JySk93?=
 =?utf-8?B?TnFrOEkwWXJnbWozWFh0OG5BMVgramoxUFdsdy96YnExYUx4cTVWRHpvWjhK?=
 =?utf-8?B?enFjWTdUZXM3REY5SXVQamFlRnl4eTVvcVI5ajZLeXUwdy95ODlwSkN6R2Qz?=
 =?utf-8?B?VE5xR1NTYXZNcGpKNThwSG1oYU9FMkhmRzVvL2ZvbGpjN0hLc1pLL0djVi84?=
 =?utf-8?B?WXJxTSt3K1hSN3pDOFp0ZGs1MjdLSzB3NytjK1BJNnY4MmFtZFd0ZG9uMlpz?=
 =?utf-8?B?clpRblpEVjliTzFLbkRnc1hBUStmcFZ4aFJta0lxRVduMFZrOWVIOXhaeUwv?=
 =?utf-8?B?MzBmV1FyQ3hxLzRDbXFTaDBuU0kzZGc0cE91Qzd4NmNyWUJYQkM1Q29QUGl0?=
 =?utf-8?B?SG5IME9rZVlsbnlMOTM3eVZwbkhpazEwV2s4LzNNc1FrWHFTbE9sREd5a200?=
 =?utf-8?B?VE5Zd0J5WFM5aVhTa2oxTDF0cmhrbUFtQlBBYitpcUtxL1p1YUl4d3RVbVB5?=
 =?utf-8?B?VTJtNVZUeVRteDdIUWNQTkQ1a2ZOV011NWtQRVkrbkxua1lLUTV4b053M0o0?=
 =?utf-8?B?ZER5SG10RlhMd25jY0ZTZlF4NHZGOHlMVXpmWkU4N2tvYVBJYWJYSm52a3BS?=
 =?utf-8?Q?F2x4QFczgnRI61ihXMGM576mA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead45d7-3908-46b0-d785-08dbdb85add3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:25:39.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ls9kXkTjWGpG3ZVIGKCwQX3yVTZPmUTo5hRlMT3zQ6s4GTq7EFnST9kjuBq4hwpRW3jBbBvqP25Ieh+ET1yOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9743

On 23.08.2023 10:39, Juergen Gross wrote:
> The extras directory is used only as a download target for Mini-OS
> sources. Instead of special handling extras/mini-os* in .gitignore and
> the clean targets, just use extras for that purpose.
> 
> So add "extras" to .gitignore and remove it when doing a
> "make distclean".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
of course with ...

> ---
>  .gitignore | 2 +-
>  .hgignore  | 6 +-----
>  Makefile   | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)

... the no longer applicable .hgignore hunk dropped.

> --- a/Makefile
> +++ b/Makefile
> @@ -246,6 +246,7 @@ clean-docs:
>  # clean, but blow away tarballs
>  .PHONY: distclean
>  distclean: $(TARGS_DISTCLEAN)
> +	rm -rf extras

I'd also be inclined to add a trailing / here, but I guess I'll better
leave the change untouched while committing.

Jan

