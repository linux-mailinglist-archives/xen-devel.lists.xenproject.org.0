Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84A72F525
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 08:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548458.856421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KHW-0007Iq-TU; Wed, 14 Jun 2023 06:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548458.856421; Wed, 14 Jun 2023 06:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KHW-0007HB-Q8; Wed, 14 Jun 2023 06:47:02 +0000
Received: by outflank-mailman (input) for mailman id 548458;
 Wed, 14 Jun 2023 06:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9KHV-0007H3-E8
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 06:47:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42d3387b-0a7f-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 08:46:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10070.eurprd04.prod.outlook.com (2603:10a6:150:11d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 06:46:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 06:46:55 +0000
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
X-Inumbo-ID: 42d3387b-0a7f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDeWjC1lHBRRsAgADA7cX+qwdJquASlsWkB0diOKL9Xn5sp4y2FvWSWQObUpvF7addWhqRILB+pj9D+pG90+WFBwty8IKZlOzZtTEa0v8vXH7+vHsYjuzyyL3acFWZuKpbaAjSYPUjaqmNZR6LO41YfV5uYq4KL/rudUMo41BdkW0JnLXrLyqWdxKUKtqzEbF0BxnYxbyh4zLaTt1ZD6RWR4GGrJMa2vu5HgNocpQPPg5iV0jrtmCRIOMmiijfF+cNnZ5y6YocXx/kEtJ3PLLsRkm/dCkUTfYwX4JBdv3s09BrftlOUoUF5eU7Gf9lwl65zvy0GOtR4ZILFSlBWKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igjqGgjmt1+Xt324yQ1LN2tc426yds9pUYkuR9saag8=;
 b=DiZOwIY5WBK2Df/RiQRpFtv2TueRYOFrLduiVwdXUrPhHHodhymktN3OQALGIaxlgCzCFG6x5TdzQor2dEjYww435sYVtxSChGD39Op1CJJZ/exiFBCVZIPfqi6X5UUzjBtf1pTuBCfEWkbDtNYWWvMVMDZAb0xCHP8iWVUOK+iXjMPJKC7LSwucgr89WpzQ3GWtBJ1vMZGcqlOVnTf/hZyFv68lxDrtj5/vE1ITHHO66YyJ/6hUu3uZ36qJJWZmol2cSf7mFGwxvmTDqfKUr7Og4U4woHujvNCY9WGTS+hYgsKRGTZZ366h24w1pvQIDGwMgp7MEvTEVzHVG3Wjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igjqGgjmt1+Xt324yQ1LN2tc426yds9pUYkuR9saag8=;
 b=g6kxLhw2wkOGDHp1293LN9USklKwCWV5Ik1HKCO8zW8Qtag1dTNCcaTrn/7Yg5K8mn6b4ldBCWi8F9TMyUi/67l87SWZPpIGlOPEH88g8Hc1FSluOHPA1/H7aMIQ3pz96UKNHFn000IhUMY3SlhXxDOVj2WCzqz7EGnF3n6kSrFSERUh+Lj9ERKyNEULk3W3iymeRWUtbTrloQYhsXQh/ZPOY44ep2ZP5wZn5SHQ0Sqa5KYrZiYwyIyugmsGlUPinsM1OUaz+J8pyHCGnWILfoFepgi7/5ud7o3lEmz41euMPUFPm+45p5Zv768QXwauh2jz3cWBR1JrJZOoc6r6aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <376041fb-255c-4aeb-855c-c77ec9cf5d4a@suse.com>
Date: Wed, 14 Jun 2023 08:46:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/gnttab: Purge PIN_FAIL()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613165209.3121038-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613165209.3121038-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: 95007fab-c4e5-4953-9c7d-08db6ca32499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j84165dlq62qQZHnr9GWYAr3rGd2iGf5FjBqTZ5UdKvuphoimZ7LZpZBCEWAtZuoWLN9F4eqpSEyvXGjh/p5GyvaNwBrmiPWCB2sYTV4oUFmXLK8/nTKyeOxUqZF6DUEheQT2cTmmk6l+hl2KCCV/xRpLGTsdVaMeMl5vTjO2Xz+bqaoRZaYdAfDsa910UHTTnFHQx0UJmyKmkwK3AqVVuW8//2yKBAiMKIu404WDSITArEIqSRH/FJbHozjKI7dnBzEacXaHv6ajy5adljg7kEo7V9a6BrGEZC/3d/CXQkhRs9f4JMGUWMs+pGglRfB1Zy5rMWogNpEJKXWtAiekneFLWEG/0jcrJjHL20CW5n4K4BFYfsYNb8fZxiIcZLAPK6I2tqBXN1eGarzqxrvyyvjNX3OOyOOdQedanskL2k5QKXPLzn0msVALeRe7FemzHndsOs0kvax5+PRC/frCROGxoc8p3hqO8Ll55Re9CyD9F94f/nxmtLCFMJaPDx7pPvyZcASpz6CEg+Y2kke8KlG8twqOU/eOlyYG6vP/GmQuArPYiAFd+Hh4p7oUx+dOSzPCmCw+T73j/vxB22aaD8tl+/LLYRrDRQ5BRjq3W4lFUfcD6b/PxEcxPw35wvtK2neQ8s2xk+NFByc3jUrXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(6916009)(66476007)(316002)(4326008)(66556008)(41300700001)(31686004)(186003)(54906003)(2906002)(4744005)(66946007)(8936002)(8676002)(5660300002)(478600001)(6486002)(26005)(6512007)(53546011)(6506007)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sy9MT2s4NmoxUDJ6R2J3bFVjbVRydVFGMGRwckEzMURjdjQ2K2RpdHErbnZq?=
 =?utf-8?B?NnJYYU5CcEF6QkZIUG5uYXBVcDJSZ25sam9TTHZMRGxNQXNOM3BBSlFaWEJh?=
 =?utf-8?B?U3Y3WFJuSzFHS1E4M1dmdVc3QU1INlg5Qkp0V2JoT2pxbW5DOEIvdjFQZ0dx?=
 =?utf-8?B?eVRSVHpNZGpKWDY3Rzg3OFJzRkZDT1k5c2xQdEcvaVg5R1lxMlJ6V2YyYlBn?=
 =?utf-8?B?VFRWNWo2UXBHa3VTVWpwWlRIOFhOTEpnYVhVRTdpdndWMmRDeXNDeTFZbVFI?=
 =?utf-8?B?WUMrQTlibEttNnZIWUY3M0ZvQlhuTFJoTVg5R042REVxaVlIZjZ6RkxnQk5v?=
 =?utf-8?B?cVFtQzFaTGRuSlJTZkEvUmhYQmdndjhoa0xnZmV3QTkvZ2JSdkVraXZPdlFM?=
 =?utf-8?B?Mm1NTlRNKzM1Z3QvYkVUWGx4ZFZkOEc0M3FrS3EwbUNKS1Vqc3RUZ1drT0Q2?=
 =?utf-8?B?NnVGTkVCWmdpNFZuNVAwd1kvVWpwYXlqdlZ2QlMwU1BLYVhXWHFRVnhEL3Jm?=
 =?utf-8?B?bHl0Vyt1MEhacmROMEM5cUo5YjlvWWQwYkhZYlJkOUJXZ2ZydDlKd3dTZzh2?=
 =?utf-8?B?K25kN1F3T3dGeVhOUjMwa3pNMGNISTYwQ1pwYkVNdDFNY0pXNWZWRDgxOFQy?=
 =?utf-8?B?WWhhOExxUlRCaEF2Sk5pZ1BPaTVsUkVjUDE0bU5LNWRFUnNhdVZQSFhHb3hx?=
 =?utf-8?B?K3lzS2dzSnoyUmlERHUwRDdvT200TklMQ09YNGhYN3lIeW5kMUNrQzZyWTdt?=
 =?utf-8?B?bW5hT2JMQ0YvVmJicWNTc1J5MTJSaDBYalZnc3hidTkxZGRHZitIdVJNcmlz?=
 =?utf-8?B?RUQ2Sml6bkIvSDJlQkhwWjRicDVYSC9zRlJFeHErYXZORGttdVlkaGhjdjR4?=
 =?utf-8?B?TXBRTEN2aGVLRC9OMGxmRHUrS2REV2xrcXU2VmUvQ0JqZ05Jck1nZFdnQ00y?=
 =?utf-8?B?TkkxdWkyMW04RTQ4aitWNEZHdStpb1Z4RWlTZTJseTJlc1RJcXhaZWNxblZO?=
 =?utf-8?B?Wk00NW5GOTlKMlhHOEY4dmxvYms4TjRROTd4N0owVWdDdVJkeU1adlh6QUhQ?=
 =?utf-8?B?QUJuVndoNGh5OHRIT3B0Q0JIWXRFV2lPN3dWc2xadUYrRFF5b3NTMkxNaDRQ?=
 =?utf-8?B?UmpScU9DV1RFWHlhYzI3NEdYczJlR2s2UWk5Z1piN0hsejF4SC9aNEVEZCtw?=
 =?utf-8?B?bmhxWW9hMlUwUHptRlVFd3ZYZ3pXT3NhVjBTem51TEplV2VLbElOblhzanZS?=
 =?utf-8?B?TTBWKzlIVGYra2tXYVZwT2N2bDJpUHI2a3Z6ZjlWa2NqWlJ0Z1l6WUh0RzhK?=
 =?utf-8?B?V2czc3hBM3cyNHd4NFVNU1owTTdyOUxVaTdnUGJxdmRWZ01Edm9vSmYyQWJJ?=
 =?utf-8?B?VW8rbkZ1TERKSDFqTHY5K2FqSnk0elZ5NWx2M0VEK3ZLY0J5RmdsQUlKOVE5?=
 =?utf-8?B?WDZaazQ2Qkw5b1phTys4UW9MNWJMTnNvcURyVWdLK2FGdTVZd2VkYzNPRU9N?=
 =?utf-8?B?Zmxxa2ViNldJVU03ZHVZWGRBUFVRdGxIcmhSci9ReFBXalc4M2x0ektMdXYx?=
 =?utf-8?B?SDg3YUhmOElMbGZIMUpRNElPZG96T2pMbk50ZUJDNHM1MnRSelBJLzF2YXZJ?=
 =?utf-8?B?UkZnYTg5TkgxeWhDdDhwdUtpaytOZk1ybGE4TzV6N1JzUXAraXM2WDRoMlRX?=
 =?utf-8?B?d0QzU21FZFUxRytHcW1HbGdleTY4cTBCdzNEc1R0bEM1N0IvMEExV0RoUDNv?=
 =?utf-8?B?b0dLcUZjeEVpM1lrYTlSMDZBdXh1OWNFQ3BxM1JWVHFxNU16MG5TWG92bkU0?=
 =?utf-8?B?U2dJcUx3Y1ZlNmFrZXVHV1ZwV1ZWZmw1L1BTOE9Rczhkd1VrbmtvVko0RzEx?=
 =?utf-8?B?WHJtRHJTaEw1Y2YxeldQSnN2cEJJT3BZb0REekEvMXk5S2FvR0tMUzBDNEdQ?=
 =?utf-8?B?MkxoVlgvZnRtT1hoOHFsS0VsWERPU1JRdm16NW0zNzJrRTBReU5KY1hEZ2oy?=
 =?utf-8?B?cEFYM1BsdWNLQmNFRlJwc1FtdDA2MmpzM1MzQVBLeENHZTZlWFJnVjVOajJK?=
 =?utf-8?B?S2l5cmNTdTlrSHlZSDlhK0I3SWZtRUVlMlRoWEdTdlUrN2NBOUlmVHkvcC9N?=
 =?utf-8?Q?9+ygtgas2CtWFiAjwJ5D07U/h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95007fab-c4e5-4953-9c7d-08db6ca32499
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 06:46:55.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8Y4U69q/+nAsqS+Ej8Ekpl8C8c89YVf+3evFFtiXUUoLN3Jp8xN8QtVAruBfhsdQdqizHfZe0iTPMCTgDwAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10070

On 13.06.2023 18:52, Andrew Cooper wrote:
> @@ -1062,9 +1081,13 @@ map_grant_ref(
>           ((act->domid != ld->domain_id) ||
>            (act->pin & GNTPIN_incr2oflow_mask(pin_incr)) ||
>            (act->is_sub_page)) )
> -        PIN_FAIL(act_release_out, GNTST_general_error,
> +    {
> +        gdprintk(XENLOG_WARNING,
>                   "Bad domain (%d != %d), or risk of counter overflow %08x, or subpage %d\n",
>                   act->domid, ld->domain_id, act->pin, act->is_sub_page);
> +         rc = GNTST_general_error;
> +         goto act_release_out;

Nit: One too deep indentation on these last two lines above. With that
adjusted:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

