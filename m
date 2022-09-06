Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BB5AEE58
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 17:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399936.641360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVaAq-0001mI-3q; Tue, 06 Sep 2022 15:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399936.641360; Tue, 06 Sep 2022 15:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVaAq-0001jh-0B; Tue, 06 Sep 2022 15:07:36 +0000
Received: by outflank-mailman (input) for mailman id 399936;
 Tue, 06 Sep 2022 15:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVaAo-0001jb-2y
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 15:07:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10044.outbound.protection.outlook.com [40.107.1.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b5326a-2df5-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 17:07:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 15:07:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 15:07:29 +0000
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
X-Inumbo-ID: a1b5326a-2df5-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R82mIS7JIoFCRyzz41wwGmdXhuFixEpqjNeCWV4RPMuJ0raThafLYHBOaZvoeZHIlHgMllFjQFlhtXWYZn3yvtWznN5p7dVDVeHIk/EeB5iHiUkZDjxGuQ2m8SVj9FLnuNXgM8VQS19XNfqqqgsjsl5L2uRo+W6H9H00mg+Uk5A/XhCROwksCQnn8xXA+8N8cRlJnSEPzFNaaIWeqVmya04ZEjRmB0WVEuydFuMP6b8nFyG100WZtWb3OlO8DjixZVaoeZUGcuZyBBcs9bGbBFLJMvXcL5gY3ROt8T/s8sKzt/Hbu/znRc0/+/QcQxdGP+1KjjttKa9XW51fRWx+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umexq5UWJnA97aYzPkpzxzfWCxk71cJvwc4Lp5srJgg=;
 b=Jubbda9TwEZyjIVQ+J32kZ5clNq5AQFOPq2I5otl4PFatF+WvgKOZ74d16/MQXl/VVWJfngSpIJKKWHyCFri69MscyheairB6SQSgZTUmuFsHOs02c2EqHaUjpc6Wtd5F9pPr57A86Hfx2pOiLjl12sllZMShxF+obqxSpZJJQ8Rt/oNTWPQW1LGNjhgCVZqx8vZE8pvfTqvjZFzMGmZwYQlOjVVJb3+jiGtDnmguDe0hd2/RuwH0We8gbvKQArRSht/GS2huf+k0+GvkBnmyhZbNilNdE0UxkcRlx8UdQAFhShFUTQS5oIkFhTOihO2Vhx/egjbddw6WX2wC9uwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Umexq5UWJnA97aYzPkpzxzfWCxk71cJvwc4Lp5srJgg=;
 b=CaRn9BBfpltcSufvop9qraRnFxCy11NPei/GZ86+jsXDTLa3LB3PTuHvZ3jS6eicG0WdM+6iEzB8RYakVn5qnlyVKGGTs2yrJh0jxRFrsvQVyfBeW/liA15cymPJaL5xDTInYgjf4Orx2iKzno0s1EZhqm+p4XwSWp9jrf2icBGWDvcB7iFbJKoqHZ/aQMBN9z9Z9Mx+eV2feDrA0Y4RcvUf8Ch4iLpO+HAdzE140T7qcHugjhFRc18koFdDSnuuZnQIDrbGAJW8EBns01O3nKNtiyp1nj6BXufgfgtGvyCSngDb9foHtWmFcVqUIQpCj9SO+cq0Q51V0oc1g9gp0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08c9df71-0470-c9eb-94f0-776eaacefa5b@suse.com>
Date: Tue, 6 Sep 2022 17:07:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 01/10] drivers/char: allow using both dbgp=xhci and
 dbgp=ehci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <f9c4f0df804ed406dea0e480614a033d5bd434c6.1662124370.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f9c4f0df804ed406dea0e480614a033d5bd434c6.1662124370.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a3969c-a2eb-48ee-093d-08da9019842b
X-MS-TrafficTypeDiagnostic: DB8PR04MB6827:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lK0plYduDxur2+SMijmSleQsJta64BJBbu3xWNSkK5ImdCDX6XszAJk3ODieaB3hhtMS8DXdZrUJg0jHrHLuNHs9iQntwJZtzZjlJ78xN1gqNohV7CO1/zzNH1eBzz3tGmRyO0APWqNWg1EdwbBnDn28Sn2EH2P7Jm+lx2TalIIprL2XtV8nKAWAN7939Sg9338swVwpOfcHof3b1SjNvuntK5SPEo9OyDSAUgIaVC0CbcqqN72oqxcbnTgT6u9o9QNyHhUPI659XgNVch1SvU+80NmyChZPjRxDSzkpw0tQogSWYMEnEynhveEBux3Cra1iK9roLP1w+LlvpUTubsiFZfe5PvlP1M3x8HSlFcTQaaIMmUhC1+w9JoW2zkNkskH8OfW3usS/ywb5G2gtyUMbP7I9m+Auwmpu0hxhRoibBhi3B79ZSLrYd7Bus4QOPXc7zAFgwAanoaLEdDdaKow+xGqeHjcayDr9F28Ya75UHV18ltJSN2aumXV7WM30oEXI2EMDz0ZmPzV6DgrTiyIH2W7xwY2cip+7Tzi7wSboL1e36rmSYFyxc4gZqXFmXwcBBnf94LoEJJFEIFr7UJOiBVjOvfhECcfU84SN1hcCb9RCW4Te4WKwYVpjmPWWa3hlruR/INeEVfbDS1elCQNh4O9ewcZsXEV7mb9VMMqwdZxVS9vFWfrK7nBcOMtdnemC0s5/Z2u/9ZerDDHno5wAEZwwGmJxn+FCY7c3MuHOQTP+C1eriD0C/v+KxpnhhfmZWkOhObhOZ69Kl4VOL+anaxBT4D8JkV3gsKMWKGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(6916009)(53546011)(31696002)(86362001)(31686004)(38100700002)(36756003)(316002)(54906003)(8676002)(66476007)(66556008)(66946007)(4326008)(478600001)(5660300002)(8936002)(6506007)(41300700001)(186003)(26005)(2906002)(6486002)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0I1WC85QjhjRE0waFRNbW5lS1FUN0V6ZGJHOTUwM2NBbGs3OFVqaEpNR1Qz?=
 =?utf-8?B?OVJsZmZRamsxRHdYR1ZxZStkZ3pTWlFGSXlNU0pHVExxbVJxSUpNMExSVmZi?=
 =?utf-8?B?dWFhSE03ZExvUUxUalRHYkwrYTJWZ0dTK0gva2ZsNlc1ZkxydDQrYjJEV2Uz?=
 =?utf-8?B?eXpVYmJZU2RodndKckhseWdLenFQczlNMjFna01mOEVOYktTWEN0TXgzSjBs?=
 =?utf-8?B?Y1ZSRzQ5SjRlMUw2VDZhWmxJcE9QeGo2bUx5NmxBZmxhbmpoU1N4eXB0Z05a?=
 =?utf-8?B?VGROb0owYTQrQUZzMlJ4cU1CdTBMS2lFdXA5Z0h3NXM3YWdGeUFWNHlHcjJK?=
 =?utf-8?B?S3NBaFlKdHZaSWFtR3JzZ2c3dUE3UnZJaHBHU0N3L2YvemdscFVzb2xQSFdK?=
 =?utf-8?B?d3VmTnQzZTMzZHdBdkJGMGFUYnF3RzVJVmVQTkkxNmYvRXhMbEdrNk1uSUlx?=
 =?utf-8?B?Z0dQK0J4YjZTQW1xdnZTdXZFc3U1L3psNVk5V0hmK01oek16RjhiTDg0RHhp?=
 =?utf-8?B?NElaRFk4c0JGRC92dDZjbWJDS2JiNmsxeHo5TzBFNEVXZHdKcEZVZlRPdEZY?=
 =?utf-8?B?Qml4VkN2REFqWWhlMUhTRlRQZUNNSE5tc0JZSm1GUXM1WU1BVHp0TnV2MzJh?=
 =?utf-8?B?dWkwMHhJNXExRnoxaTdCVlBGNVRsNk43WjF1LzhDaWdZRXdHd0s4SHN2Sm5S?=
 =?utf-8?B?VVdSMjNSZ0xiME9sSTR1VEVjMUlRSktYY0tjbXk0U1VQSVNFbjNSNnQzR2Nn?=
 =?utf-8?B?UklvNlVSR2RnSEM2QnhJZHYvcklxV3EvYWJnb09YRU1BaHpyZnh5MTJ3UWhU?=
 =?utf-8?B?OEdxQWdVUHZ4N3hReXVoRnQzNUZPb0M1NTNvMG4ycm5uUi84ZVIycGYyZm52?=
 =?utf-8?B?aHFDOFk5MWpiZlRFTzBzd2dMVDJNV29hU2VXZkMyc3craUJoYzVjOXFQcE1u?=
 =?utf-8?B?QUlSTkk5VTRDUU8wT0RBSEttcWIzOExxQjkvSmJuNFd4eEpBMmdIaW5OTDVP?=
 =?utf-8?B?RjlRc2hpVjhoOTVVOThPdXVBbHJCdVpSVUUyVEd5cHo3eVBGeDhVczRzYjRF?=
 =?utf-8?B?RG1vdDU2TEpBeHJmVDJoV0F6YVBCejFDKzZhL3VLOW9yY0ZIbHZqSFZDa0xZ?=
 =?utf-8?B?UURQeExyL29naU1IL1FmK1h4Z0hlUytjdmR3bG9VSExKV08xQkdqWXdwRDZT?=
 =?utf-8?B?SHRLWHBoMGt4UENucmVuM1pBUXhUYVc2b256VUFnRUlGbnUwbVVEekRzNWs5?=
 =?utf-8?B?RUNubExPOUIvenp6TG5rY0pVR2hVbXhERkYrK2hSd05OR2xJYkMrZmtJMzFw?=
 =?utf-8?B?TGVxNWZLZ1FwTmpkREZGM1V5RHZUbk4wNXhBcUlGRDd4TEpUZC9YdmxPNER6?=
 =?utf-8?B?bWtKWTA2MWFVeWRRLzBwcmhIVTBQZk4zOVI0dFhJY2FubGZObUVZVlAxaUh0?=
 =?utf-8?B?SXhiSWx5azJqaVN2enliZTdYWXJQNzdNYWtQVUJVSnlKcjJRWUsrVmFpRUsx?=
 =?utf-8?B?OHFCNHoxaDlXUWxmNnZCMHRteFdwd0M5eE9jZSsrOGxKUWRpd3hpK3Zwa05v?=
 =?utf-8?B?R2RZNGVLUjBVelZVSFl3dlhldS9WcXowNTE0aTdqaERqL3l6Rk1WdzRZT1ZF?=
 =?utf-8?B?YUxvaTl3aVNpbHorZkFRVFNtMHRReVRsVlpJaVlwMHl6cXhlQzhUQUhIQmhF?=
 =?utf-8?B?YTNTQmdadWFyUDVjU1oremQ4ZFh5V0VhN1BJVm55UlpZRDNRQlE1dFJ6TjVO?=
 =?utf-8?B?bzlZMEoxK1Y0TFdMc0hsSXFOdXZHOWFlMnl6T3U1bkhIbzlKanFaeERheFRm?=
 =?utf-8?B?RzFVNWYxQzRzdU9oMFhiNjZRU0NORTlTWWp6NVgzd3ovU2k3bk1jSmx3dXVR?=
 =?utf-8?B?SjRuTWEvKzBXL0MwWGJpSXVXdTNYMklQL2FzcDM0cFRUVzl3UGpmbFlJcE9K?=
 =?utf-8?B?bWlTcG1YWHU2NnAyTU5iZHpSYW5CalplU3owdzFqOWc1V2FMUlNLaDI1T3hn?=
 =?utf-8?B?b2VvUVRLUEZBc3Z2Vlh1Nk4wQUhQeFNDTHptS3NCelJwTk54QUg2M0VOQ0E2?=
 =?utf-8?B?Z0JBdnFQdy8xVXArSThsMnVRVHdiS0lyckord0dMS01MVHlwVmxKMy9pVFpT?=
 =?utf-8?Q?Srvo569/hWDg8NarcwY35C2jY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a3969c-a2eb-48ee-093d-08da9019842b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 15:07:29.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAWcqb4jKtetOitI/SqrwwcK6j7MdDxdXB7d2Xvt5ZWsm7o0gi24ahvp+J9DXTNBpI79u7izgSBeYl81TUih0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
> This allows configuring EHCI and XHCI consoles separately,
> simultaneously.
> 
> This changes string_param() to custom_param() in both ehci and xhci
> drivers. Both drivers parse only values applicable to them.
> 
> While at it, drop unnecessary memset() of a static variable.

Are you sure of this? What if there are two "dbgp=xhci,..." options
on the command line, the latter intended to override the earlier but
malformed. Then ->enabled would be left set from parsing the first
instance, afaict.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -409,7 +409,7 @@ The following are examples of correct specifications:
>  Specify the size of the console ring buffer.
>  
>  ### console
> -> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | none ]`
> +> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | xhci | none ]`

Personally I consider "dbc" more in line with "dbgp", but I'm okay
with "xhci". We may want to allow for "ehci" then as an alias of
"dbgp", though (in a separate, later patch).

> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -1464,7 +1464,18 @@ static struct uart_driver __read_mostly ehci_dbgp_driver = {
>  static struct ehci_dbgp ehci_dbgp = { .state = dbgp_unsafe, .phys_port = 1 };
>  
>  static char __initdata opt_dbgp[30];
> -string_param("dbgp", opt_dbgp);
> +
> +static int __init parse_ehci_dbgp(const char *opt)
> +{
> +    if ( strncmp(opt, "ehci", 4) )
> +        return 0;
> +
> +    strlcpy(opt_dbgp, opt, sizeof(opt_dbgp));
> +
> +    return 0;
> +}
> +
> +custom_param("dbgp", parse_ehci_dbgp);

We commonly don't put a blank line between the function and this
construct. (Same again further down then.)

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -245,6 +245,7 @@ struct dbc {
>      uint64_t xhc_dbc_offset;
>      void __iomem *xhc_mmio;
>  
> +    bool enable; /* whether dbgp=xhci was set at all */

In dbc_init_xhc() there's an assumption that the "sbdf" field is
always non-zero. Do you really need this separate flag then?

Jan

