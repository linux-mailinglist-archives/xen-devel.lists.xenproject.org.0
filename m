Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0276E814
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576334.902341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXIf-0007ri-Sg; Thu, 03 Aug 2023 12:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576334.902341; Thu, 03 Aug 2023 12:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXIf-0007pU-OO; Thu, 03 Aug 2023 12:19:29 +0000
Received: by outflank-mailman (input) for mailman id 576334;
 Thu, 03 Aug 2023 12:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRXId-0007pO-Nh
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:19:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcdaaee8-31f7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:19:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9957.eurprd04.prod.outlook.com (2603:10a6:102:385::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 12:19:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 12:19:24 +0000
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
X-Inumbo-ID: fcdaaee8-31f7-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaYwzBPEX9lr2OJVd1/Arq/DJhrPKi1q/bc/j7ya3lWX9fi6b8ob4z/887Vl8s4Ohv/75OaPIF2dz5pX5G+DtLZulkp8Sav4CANd6O5Cno2Ff7aCT1VvFdlap0cHin7JGLx5uu6msAmhg43iF+pD1xaTlwETDppPrKNDHvA5Tz+uBylZtsurtNOXlMBvpk0GVFlV5MUTo8lc2QZ6NbOCeUXkRwXzwgM+XXRcZaA+cuk8KaehSrBaJldKx4PLGdMoYtEYJbmEFfkvZtBnCsF3xKZq08/Tegk0vIjuf+O9w+77AtqPQB5E0+7WQW+leAxF7jDyZApK7bCg21565pU9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dhR017bDjrmKAEZTxdhb12weLlVVl90mgs3HHFP1mQ=;
 b=cb/K/GwQYZAQo4+8aY9amQ1ASgkqMyMLk9deFJJxlCEplSdqg5h2CfIm1O6uHCchVXuLPJJT7HiDjH6ugzmglCZIK1/USsNGsVOFC1+ITlZ77TEWT2kXVHtUFIoXxwTlVqP22cT7L6QCeIFdww7FIormHBxp1YkUhP3JvB8GGD8WwH1RNEcnk6rTY6OqYHZYPLDyUOZ1D857m3mCWMG5SsGYgZcVkxlELEaEZn6YBM12uSxqhYuSKlP8jFgrLFHJbbkf5VBksTgtjljxmzhH+jD0uoTQ9FYZaac9GsL8kjBuYbNMY9E6U7nA+XNd+eitXbFihhUvdL9CwXIAqSYyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dhR017bDjrmKAEZTxdhb12weLlVVl90mgs3HHFP1mQ=;
 b=AtqngBJpoGB6ggEiJvgtgd7+czBIwgUZCdsnMoRueCzDIzxjexqPelMMz4bsnAywvN909sZ2i5HEPioc8WqW+2bpyxLTgLwTygwhmso7oDWdWUa4T/X+ufjfqUhQ2StkVk6iuusvEJ/bduxpfUJ4k127IP+pti6gMNPxCCF7mbR2C7pUxO6GHfBIbk21xf7aRGuYgbOxtbnJgJjNRf6Y/Lwh1Fvjt+sZnq+vOdBCJG5fN/PtJdby7q5c7drtee/OqNbQFI7NOki3MkCKtmp0dsal9XIaJLOtDCylwp0Ypu6N4QfUheNGhHU67SE79gPksxIYoeHr8RpUL9K/XjxjUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52a02ef3-80a7-9000-4644-38adbb5a2573@suse.com>
Date: Thu, 3 Aug 2023 14:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230803104438.24720-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0773aea1-301c-4a54-e1cb-08db941bdf96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pp7oYPnCZVLhTJfM1bQg6MG0CRlLIrCVH7gf258mfLT/wYXwHpcfhmY+Z4M21r+9gfaVeX2pgChZZff98IsyLCkdRsKYGmpHh7/VSHU4I3GrZMek4J0QkgdWwXrvsgoDHEzz2Az4c7G1avaSfZqSrwR390DbPmexhEsevf43eF4YWyagbtXs8SLbTBcUEWyLnfOUxNhMNqwUxHhIwANaYn3QUAwYz5cburzuVZ8ew29I0TG7btQkTuZy0GbxoqM5//pIpq//r0oiRB+heVZEWLs7B34LOnFtSgTN3UImKutv0BSBRbEZS2OuEsW7xSNf8+HPtbYxc1XXqZbJJDLCeXdtMa2oONJsaHzgGUWnCM33NTMsGHZXZh6stzpPVeSqGz0PB+g89G3QpwdHKQUhFsPRipVDH0DDqXb8FvA/TAVuUX/x6KJkF3yhkIZwxqp8iO6gdqLgReSaVKfvPMrdv4Mih6F01bFsmlAhPtC+8Ea2CahW/VHzE+47XqaBuHdw0D0zUnTNThQs0wsi2ixk/MEJjCl6UxEvoY477YPYNl9wKeGHbkT1uy61ZQZ8hppupIaec4Uj6hIp3Thwh4jig+q6cJoFK2XPT35kcZg8FS77ZIyOeC6f3OmzjwY7hAae
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(6666004)(966005)(6512007)(54906003)(478600001)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk95WWljb3U0YzdkWVBkMFZmd3loS2VaM3d3b3BlZVZYMDVwK2FIQkpMUkZG?=
 =?utf-8?B?QmdmeVNYSGpxV1pyalVPbTdFSW5pTnFGWjJjczU5alI4NG5rYnBPaVlkcTMy?=
 =?utf-8?B?QUZaYUtaZTc2WnlRU0NLQXdTSFhxMy9TRHdmOCtZOHZkSnlYN0RtcGd5WFVu?=
 =?utf-8?B?TjRDeE9uMXF6K0RuWmpGeldJMHdaVC9uVWFEaStiQnR3KzVOZDZKNUJJVE9W?=
 =?utf-8?B?b1pmVW4xTW0wSWRQNDlHaUhwTG9CK1RWOTQ0bHJ2c29DN05sOHF1cytJZ2RR?=
 =?utf-8?B?RFB5cjVkcnR1dlZROXBjZk55TmNCVXB6K0pRcXJGRW9GOWJ0WG1wNUExcUFV?=
 =?utf-8?B?T1JjbFoyd0ZNMm43RGMrTFVyWlNlemZmSjc0aUpzalZzZDlnV0hselhpNU43?=
 =?utf-8?B?ZVBDZEtpQkc0M1FEeTN3Z0R6dmFRdkhoL2pFclZFVDdQcEtHMUw1dEZBNlRS?=
 =?utf-8?B?aW9UMU9jVWlZUCtTK2xBSExOaGRsWS9GWGhNU0pydFhvaTArb294dld4dFpn?=
 =?utf-8?B?UVJLRHZKU0s1ajV4dXlJOE5FeWZ0SWxCMnkrR1ZGdGxpU0N0SVhhTjFKc3Vh?=
 =?utf-8?B?NmFMdkFvMlV6U2VydTRsZjRkVUJ2R1ZCNjh5Uk5jZEUzMnRSNGdCcUFBMHA3?=
 =?utf-8?B?dm55U0VSYmd5c015MzVnR1N1MFdGZDIrQ25VMHRweENFeVhvNVFITUZGZGZS?=
 =?utf-8?B?ZTFaSkl6cE9URVh2ZVV1eXJLMXNmcmx6QUNHRzh1aUlXV1hFRWtwVEt0dmVQ?=
 =?utf-8?B?N3dkSEt3dzhIRGJFTkErYmNHa2VLOC9pMHlqaWNHaWpMbEdROGFNbDhySHFt?=
 =?utf-8?B?czdFaDNjQTlpUENKZTBRQ3JrT1BFNVlWaUxXRnFXOUtHcUFQYVlvWTBrTkdr?=
 =?utf-8?B?aXpzZjc0emJNY0Zva2JTOTJ5U1lBZXo0K2ZHMUpJNWJBK2pZNUJ1QjhTS2dE?=
 =?utf-8?B?MGhMaHpMdGlOcWRST016V2R3N2llUktQR2dtU2piU0VnSG04cmZaejhlbm9i?=
 =?utf-8?B?NkwvL3I3aTFtLzFDUGYxTlA0WXczb0tOZ1FRUFBPRXF0K1pnc0ZzT3FseEx4?=
 =?utf-8?B?d0hWb24yRHY1NUdpbHFWMmp1L3dJeWpFWmp5UER3Y2xtcXc3TGR3Mk1Rcks2?=
 =?utf-8?B?bWZQN1JLZ05RNVRsNVFSRTRYSHZMQTVZSGNFaWhTRWJobWphVHIydXBJT2gz?=
 =?utf-8?B?K05YdC92MFNFTnhTT1daak5XT2thQk1KYUxjcVpac2w1V2p0blBPNzFLSEEr?=
 =?utf-8?B?UCtuU1daWllkcjloNUZXVmJVTmNaNUhUM0xRSDh4VWRUVXBHMkI0UmFIY0Vo?=
 =?utf-8?B?T2pKUnUyTVBBdzRZYVZ3YWdWU3JzSmZIeUVLVXY5Y1hkaUhudEdLZWdndW0x?=
 =?utf-8?B?bDRaMldJeEg1UXZvc09qR1IxNUdORm9VcCtpVW5yMmhJUkZtUnNVRi8yTCs3?=
 =?utf-8?B?UTB6Y3VBUG4xUjJjblN6SXJuVm10Q1Z4M0gxcGJFcVo2cXFwdWhGblpjcjhH?=
 =?utf-8?B?TWJQKzJkOTd3bWRncFRPNkIya3gremlhU3NkdTA2dHFMbENrY0VGaTB4N0xL?=
 =?utf-8?B?V0UvdTEvOFFYMWRNMFRuWTkwaVovcHVNT1hZSnJGOXhzMWt6WjhxOGNGQ1g5?=
 =?utf-8?B?OW9ITmNLTGpUTDdZc092WmRuNmxlRUNLMy8zTVJmWGM3d1RicDZVa05iZ3JQ?=
 =?utf-8?B?VGJaR0szL0lVYzVrSEY2aHpwRSttL0txQXM4RUVPVkNXSjdFRUo0d0U2amZh?=
 =?utf-8?B?YU5JaUhqNlIyOTd1eDNIdVNTVjhWMHNKdjF1RkVhM1duS1c0TmcwQzViLzhr?=
 =?utf-8?B?YzhqYVZwYXBpa1M1WUo0WHAxT1RIZzdrMHFGa2hmNFNtUm9Qb1M4cGY2QlVV?=
 =?utf-8?B?Q0pJd0czcDFNcmJaOWM0aGh3TEN6ZkFlNnIrZUZsNEFMQ1lxYllIYlkrVzlU?=
 =?utf-8?B?emFBdXdlTlcyaTMvbE9Cb1pBSG90a1d2RVgwUU1zV2tjMk5NWU4vUTJzZzND?=
 =?utf-8?B?ZVhneFBteW9rd0dLTG95QVpvYlVFL1lKeUZmTk1uanJnckx1bENPSXl6L1hq?=
 =?utf-8?B?QVpMTkxEem1PbWFxUHQ5ODZMNnZGM05RcDVwM3NpTzZhVVNHMWZDVW9QMnlQ?=
 =?utf-8?Q?GZx12GroIqw7z6Se4Apy6Qmhb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0773aea1-301c-4a54-e1cb-08db941bdf96
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 12:19:24.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/m4lXhNOKVXyD2Ewa7kkAeThlrPIi2LAhCIqz94EEWa+WocF7GO7ATL+kln/hDWZjVbYFcRy+QZkQFaHfaiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9957

On 03.08.2023 12:44, Daniel P. Smith wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -332,6 +332,15 @@ M:	Nick Rosbrook <rosbrookn@gmail.com>
>  S:	Maintained
>  F:	tools/golang
>  
> +HYPERLAUNCH
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:	Christopher Clark <christopher.w.clark@gmail.com>
> +W:	https://wiki.xenproject.org/wiki/Hyperlaunch
> +S:	Supported
> +F:	docs/design/launch/hyperlaunch.rst
> +F:	docs/design/launch/hyperlaunch-devicetree.rst
> +F:	xen/common/domain-builder/

I would generally suggest that maintainership changes come in a separate
patch. Furthermore aiui lots of stuff is going to be moved from elsewhere,
and such code may better stay under its original maintainership (unless
it was agreed that it would shift). So initially maybe best to name the
original maintainers here under M: and add the two of you with R: ?

I also don't think it makes sense to include a not-yet-populated path
here; who knows what this is going to change to by the time things get
committed.

Jan

