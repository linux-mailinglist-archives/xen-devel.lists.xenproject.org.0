Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD76597287
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389037.625840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKex-0005WA-EN; Wed, 17 Aug 2022 15:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389037.625840; Wed, 17 Aug 2022 15:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKex-0005Tf-BT; Wed, 17 Aug 2022 15:08:43 +0000
Received: by outflank-mailman (input) for mailman id 389037;
 Wed, 17 Aug 2022 15:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOKev-0005TZ-IF
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:08:41 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79b5023a-1e3e-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 17:08:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6204.eurprd04.prod.outlook.com (2603:10a6:10:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:08:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 15:08:37 +0000
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
X-Inumbo-ID: 79b5023a-1e3e-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2lqirZCcMMQFnWVliuGzMG4YuRc+fw9X9dAjvf87lFNTjPnvMkuuSv9zBS/qwkgMlMaWcLJydAFKSNA8BMKvLaT84ESDKX84CXu87GO3KFOSGb8jPAUwAG6qZGkFg/fWixm+3gZbII/r1XiNR3/ogDMeky4xecq5H6rYZ8f22PRBzC4ss+RapYpJwluYGoeP9L3QNOrjW/i/qyIU5r3ypbgLNnbaBy10WyG+JezURuthkNb0UbzmyUSf2l1VZLP3DXdV3st4ql6D5unNUD5iYrqMJoJDGGxwDvWERJim3dJIFA61r2+kquoIzttxYSA3upqDbX2ZpnHar8MlZXlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bvxG+tTpNNLqNSdMqwytj+w7iqM4mTj8JFrvjjxSRk=;
 b=UtTfB8ViYhYpDbsDuyYgmtayNY0z2wcJcX22uSDikEoOuPEhewAStwQZyE8WiAj8XHTrpkjyUIqjssN01UmQfb6B1nNB8COipGSY67Tq67bsUlN+J1K17v+gl++YwvVbcnLpj7VpdJP4Hwnb9/Qecl+AjckCd5wNs32vyZbafjr4hilrinqe1PDKvGBMwtlcT/4mCWutPtPaJ9SR93gxSt62566C1Sss01AnQbhEt1TI0jAiGf6bb+LwsIvlKO+s21PqDFiRrPaPQL/+VQYKi730OZPYDxbb98bzeIe6BGHilHH/KRksRgcQ8s7WRV5wA9BvK97NsqULci9Rl18k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bvxG+tTpNNLqNSdMqwytj+w7iqM4mTj8JFrvjjxSRk=;
 b=VXLG+X+LZSALNeiKEEPN0cJanA02xBracRTwH91Yw0y84+2xeIo21OcghJezt2H4Pj6CfcD8/IxzYkyy+2jFIjqMiJi++on7SLaqvGhiZZqBKiMwObJiuf7uuJOOcfuBdf+HlWU0fLb1UfIVK5BHefF2E+n6Pnrc9Gnpjzl3hHPnelJd0VzecTjbQ7OwjuFnzJ9rPWFUluKEUwnkg0mzjcnTPnxjvFtdWqtBy0d8phtWjm98zdPV8jspPD/wR9AuZlR72flNdBjMWHVsbqCOMwo6+9WF5FRMJUiZOsnzJKYaSpbFFmiLS57XR9UIb434Z1uVa1hJDJJw0WFuB5wikw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <141cb0d0-3563-1376-a6b0-a977142c1873@suse.com>
Date: Wed, 17 Aug 2022 17:08:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 11/11] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <403daba6911a3d40e4774b46ba555f6d76b3c249.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <403daba6911a3d40e4774b46ba555f6d76b3c249.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de431df-0c15-4f95-1cce-08da80625cc0
X-MS-TrafficTypeDiagnostic: DBBPR04MB6204:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ovGfoakysZ92BL9TfK/Nd/Wfb7zYbmiYoj3a9IsUgJjlQtZ2Ixatn/HYgZtVMWoQb050IlvVK72mjqCM05NbCTUo4bkMmgs+ImEr/a/h24IiSxX9ZvOB/YqH/5DCDFjXrzEHfJVTdADsKf6gqhVM/dFNwHzhLR5CwXNzeZanpgLWwrZQxSBGx4crvHDkD7xoHiySspbgGZ+2seSPWt0yfLI/6kN2QfZlUzs0i9+LfbhAWdjPW6e+6UTQPEmu6sqqRpVDIh50rBB3rYL9ncs2805iOoeG49FR/3B8J1dHrJibdJRyr2/QIsmAu993/lGhdJlMjCdl78VtHaWvl8MRXIQPnJMdz/f7uVzlvzmVo6LJvihBqlFd7KlabNuqdCwZ+DowXNKg/Os5btfKQAf03JaTpdOljC56kqy6g9N1paOZrmGIfiLXq0LdYJxcOZ3abgGq8Krmwu+zOSBERU3UQMVGnqnxGhwWsoWvWfotG36oNmURDsf9fDgVx1kRAg6zE+fet3fEFqbhcWp0A/YyWRPim8RAevVQjECHf7tiUiFkSSwTW3JFtIiz0lmp87AAOMwUoZjOfVInGJsfrHyOFY6C9q9M8WA9PVZIWYFU6MA+WOicCbeBbhNXib1+XnzuCFGXw3V8O1udFgJvs2cfFCZiurDs/ozW9LshYDY6nIGubvj7wPL5mLItRmN+kVE/NTAyPEWRJdBD5lP/28wrabGr+vVkpybUKbc93BCsMper7/sqFaMKg8PNR7CLbDtt9yh6e/2xHYYcbwXtieXv5aZ0v/62LpP1U87qho0lcNyvExKyV0Lt/1bpWxSvHA4hN19mjFf52tPsYtAhF/Cbtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(376002)(136003)(66476007)(8676002)(54906003)(8936002)(66556008)(4326008)(66946007)(316002)(38100700002)(5660300002)(6916009)(2906002)(66574015)(26005)(31696002)(86362001)(478600001)(2616005)(41300700001)(6506007)(53546011)(36756003)(6512007)(186003)(83380400001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amNXM2E0MHZnWmpjMTJ6RXcwa2dTbHkxL1BPUU8xVmRjUEZnQWlITGRyWDR3?=
 =?utf-8?B?OURoWDNTRndjU0xLNkV3RGFWV1piZXNPL1B4RUJ2SUR4blhsQUxvdG5Mdm5W?=
 =?utf-8?B?VkZqSE5WekJFc1NmeWl6V0dhMThDbXRFK1FwK1RmOTNPdU0zeDBrREQ1TWRa?=
 =?utf-8?B?N2tpN1paS2kyS3JzckhWdHdFUEQveFcvaEIzR20xZDN2SVBRalFvQnpUUXR0?=
 =?utf-8?B?UmxUMjJLODZFWjVseUdDblVPdFNYMzF4NTZRS1gyK2d3YlBsaDZaWkhDb0Jw?=
 =?utf-8?B?MFFPSGd3VG1samhtbzYyVlBUejJWWmcyZnJCWDZzSGZCTk4ya2JoNSt1L3pC?=
 =?utf-8?B?VDlVVVRHYTRBenVlc2Rpdlh4NVRuTUtmQXhkMklodVExdWl2My8yTEN3ZFpO?=
 =?utf-8?B?eUNXaytETmdkR3AydXpEYVBUdnZUWUo4SGZ1OVg0eWw1dGl4azlESTJBWXAx?=
 =?utf-8?B?VDBxWC9KK3lneTg1aEtLNDNEb29NSUJZZ0F1by9FZkI4Y1JSYWtmaFVZNS9K?=
 =?utf-8?B?WjFxWjh1YTRORHIzZzVRUmp3VFBLRVg2YTFSdDhiNXFSdnlUTGg5Z2pQR2Uz?=
 =?utf-8?B?cG9MU0xMLzFPVVpwRVZYVjIwbnBJTEpPaXUxV2RwNERKb3JWWjBDdGNBUTBh?=
 =?utf-8?B?WHpVQjFnZnJiL3ZKMUVaSzd3OGRtUkt4VWZ1ZnlEcytmczZvdUlhdGxLb2tL?=
 =?utf-8?B?N0t4RU9LeEk2alZqOHBOdVJOQ2hReGFXSXhJaHJ1aWQ5dXoxRnJkSzg0ZEFY?=
 =?utf-8?B?b2dSUlQxTnNJOEVKdlQrNnFjM0VhTVJCRDd4OGhqLzVIcXI5UkVwVm9ZTVpU?=
 =?utf-8?B?eVkydlNFaGFxdUxBZVhQa1ljNzA4dm40ODlIdWQ3anpxOXhjd054dmJWcFZh?=
 =?utf-8?B?TUVKdC82WXFnamg5UTVjcWo4d1RCMDhBeHFJZURkK09hRkFVWFlmcTNScTNo?=
 =?utf-8?B?dnVNVmpiUHJ1WmczQkU4ZnZuU3BWcUR3aEpWMkhHUlVGLzBya0hkN2hsNzF4?=
 =?utf-8?B?dmJGOGxiaDZWTzhxaHpvUEltaXB1cEd5RnFscS94R01sQlowY2NWcHBXcWdr?=
 =?utf-8?B?ekc1KzUzM3ZhQUtSUkVDQU5Dc1ZhZUl4Zm52L2Vvc3BGdmZzMlRHcHNQcU5z?=
 =?utf-8?B?V3NxNHZYeWhDTUR3aDdhcHB3bGtMZC8xSTJWK3RqZ0RZNHZDbmJ2MnlWN01k?=
 =?utf-8?B?ajVSSTcxWS84TktvaVpMRzRPcFl2WjQybjg5S3YxdWtjUE1zekp3djY3ZGFu?=
 =?utf-8?B?NVZsc2QvUTQwWkZpMUNCZjJOTzE0WEVpS0g0ZUJoTEdSVEJNNXdoRzJTSzNW?=
 =?utf-8?B?UnBGUndKQTk5RUlLZDVzOUlML3IxblNwTDRiYitsTG9UOG5USVZRL0xQK3A2?=
 =?utf-8?B?TXhCWHNsQk9FOU1FWi81RWd2TSthbm5oYW5zYzdCQ1FFREYwRng2cDBmeVZX?=
 =?utf-8?B?aFRoUnhBYmxHV2xWcFd6cHphQmkxZ1VQSHR3M2phOXZxdmE3YktKRDN5cFJC?=
 =?utf-8?B?bGNDenFqdDVaZFRCQmdsczRpdmRVUmhMNlZHK1hBeHV5OWVmRGo3ZlMzT2o5?=
 =?utf-8?B?RW1CMUJneGEybG9rZ1NGSkd2eGUzeW0vREFQSThBRkZDVHp1WDNrVkdDRmhx?=
 =?utf-8?B?dUxEa2hsbGpqcU1FLzRzRlhlbTI5YU5EWkJvaFJoTWNXNlVNZXJTRnJWUlpE?=
 =?utf-8?B?Q0dNaitzbFNPVVc2T2FrVCsxZHpGRUVOYnR0cXFQejNaODlzWERIek1xY0Fu?=
 =?utf-8?B?SFBsNUh2V1E1S2V3cUQyaGxxRUFsQ0VmMFN5VkliaTVrSTBkaW5xZStDRjln?=
 =?utf-8?B?S1MxR2piNnlHY0lxaC9udHZKUldRb3BKUGdMcVB4NnVaQWV0Um5lVGU4V2dm?=
 =?utf-8?B?S0hSOWVjQmZ1OG15UmtIYkJ4cUdaZFExUlY4cExrU21ab3NtNnNOSFZBQkx0?=
 =?utf-8?B?TVNIWXFEVUZKM2VoU1JhRm1hZlFtdGtZd2l0YzYzRUgyc2VFTnZqL2xhOGdn?=
 =?utf-8?B?T1hFVzhOcEtONzZhSFljUzNFN1l2UnVlR0pOc0JMRngwQ1ZRNFNlUE5namFW?=
 =?utf-8?B?QnkvbGFVY0JLV05xVlp1SUR2V3ZObjF3ZFY0YUtkTytIbkR2cFBZeGhyQ003?=
 =?utf-8?Q?SHCGu8yRvJ0lHbyVpHZO05Xax?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de431df-0c15-4f95-1cce-08da80625cc0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:08:37.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfYuP9T+33qC95AY8BqlegpKf8uxwzaIyLK8yGEbFT2iFcjjDOfim9QHzAaCCWoU/VY8GIRW2ODdlr1eHdiu1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6204

On 13.08.2022 03:39, Marek Marczykowski-Górecki wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
>  
>  ### dbgp
>  > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> -> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
> +> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
>  
>  Specify the USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
> @@ -732,6 +732,19 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
>  Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability.
>  XHCI driver will wait indefinitely for the debug host to connect - make
>  sure the cable is connected.
> +The `share` option for xhci controls who else can use the controller:
> +* `no`: use the controller exclusively for console, even hardware domain
> +  (dom0) cannot use it
> +* `hwdom`: hardware domain may use the controller too, ports not used for debug
> +  console will be available for normal devices; this is the default
> +* `yes`: the controller can be assigned to any domain; it is not safe to assign
> +  the controller to untrusted domain
> +
> +Choosing `share=hwdom` (the default) or `share=no` allows a domain to reset the

DYM "... or `share=yes` ..." here?

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -23,6 +23,7 @@
>  #include <xen/iommu.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
> +#include <xen/rangeset.h>
>  #include <xen/serial.h>
>  #include <xen/timer.h>
>  #include <xen/types.h>
> @@ -232,6 +233,14 @@ struct dbc_work_ring {
>      uint64_t dma;
>  };
>  
> +enum xhci_share {
> +    XHCI_SHARE_NONE = 0,
> +#ifdef CONFIG_XHCI_SHARE
> +    XHCI_SHARE_HWDOM,
> +    XHCI_SHARE_ANY
> +#endif
> +};

Hmm, this suggests that Dom0 cannot use the controller without the Kconfig
enabled, which I hope is not the case. But I notice that patch 1, which
was committed already, still uses pci_ro_device() rather than
pci_hide_device() (like ehci-dbgp.c does).

> @@ -1128,10 +1181,34 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>      init_timer(&uart->timer, dbc_uart_poll, port, 0);
>      set_timer(&uart->timer, NOW() + MILLISECS(1));
>  
> -    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> -        printk(XENLOG_WARNING
> -               "Failed to mark read-only %pp used for XHCI console\n",
> -               &uart->dbc.sbdf);
> +    switch ( uart->dbc.share )
> +    {
> +    case XHCI_SHARE_NONE:
> +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> +            printk(XENLOG_WARNING
> +                   "Failed to mark read-only %pp used for XHCI console\n",
> +                   &uart->dbc.sbdf);
> +        break;
> +#ifdef CONFIG_XHCI_SHARE
> +    case XHCI_SHARE_HWDOM:
> +        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> +            printk(XENLOG_WARNING
> +                   "Failed to hide %pp used for XHCI console\n",
> +                   &uart->dbc.sbdf);
> +        break;
> +    case XHCI_SHARE_ANY:
> +        /* Do not hide. */
> +        break;
> +#endif
> +    }
> +#ifdef CONFIG_X86
> +    if ( rangeset_add_range(mmio_ro_ranges,
> +                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
> +                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
> +                       sizeof(*uart->dbc.dbc_reg)) - 1) )
> +        printk(XENLOG_INFO
> +               "Error while adding MMIO range of device to mmio_ro_ranges\n");
> +#endif

I did comment on this last part before. There very minimum that I'd expect
to appear here is a comment as to the issue with other elements living on
the same page which a domain's driver may actually find a need to write to.
As said before - as soon as such a report would surface, we'd likely need
to add write emulation support for the leading/traling parts of the page(s)
that Xen doesn't use itself.

> @@ -1202,13 +1279,18 @@ void __init xhci_dbc_uart_init(void)
>  {
>      struct dbc_uart *uart = &dbc_uart;
>      struct dbc *dbc = &uart->dbc;
> -    const char *e;
> +    const char *e, *opt;
>  
>      if ( strncmp(opt_dbgp, "xhci", 4) )
>          return;
>  
>      memset(dbc, 0, sizeof(*dbc));
>  
> +#ifdef CONFIG_XHCI_SHARE
> +    dbc->share = XHCI_SHARE_HWDOM;
> +#endif

I think it would be best if the default value was "0"; I can see though
that "NONE" being zero also makse sense, if the enum was to be used in
boolean context (which afaics it currently isn't).

> +    e = &opt_dbgp[4];
>      if ( isdigit(opt_dbgp[4]) )
>      {
>          dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
> @@ -1218,7 +1300,7 @@ void __init xhci_dbc_uart_init(void)
>          unsigned int bus, slot, func;
>  
>          e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> -        if ( !e || *e )
> +        if ( !e || (*e && *e != ',') )
>          {
>              printk(XENLOG_ERR
>                     "Invalid dbgp= PCI device spec: '%s'\n",
> @@ -1228,6 +1310,41 @@ void __init xhci_dbc_uart_init(void)
>  
>          dbc->sbdf = PCI_SBDF(0, bus, slot, func);
>      }
> +    opt = e;
> +
> +#ifdef CONFIG_XHCI_SHARE
> +    /* other options */
> +    while ( *opt == ',' )
> +    {
> +        opt++;
> +        e = strchr(opt, ',');
> +        if ( !e )
> +            e = strchr(opt, '\0');
> +
> +        if ( !strncmp(opt, "share=", 6) )
> +        {
> +            int val = parse_bool(opt + 6, e);
> +            if ( val == -1 && !cmdline_strcmp(opt + 6, "hwdom") )

Nit: Blank line please between declaration(s) and statement(s).

Any reason you're using parse_bool() and not parse_boolean() here?
That would save you the open-coded strncmp() afaict.

Finally a remark seeing the opt_dbgp use here and the identically
named option in ehci-dbgp.c, taken together with your multiple-
serial-consoles patch: Since the two option consumers are now
different, they can't sensibly coexist anymore. There were issues
already before - it doesn't seem to be possible this way to run
EHCI and XHCI based consoles in parallel. (An exceptional case
would be if <integer> for both was intended to be same number.)
IOW I think one of the options needs renaming; it was a mistake of
mine to not have pointed this out before committing patch 1.
Following the name of the source file as well as e.g. the title
here - maybe "dbc="?

Jan

