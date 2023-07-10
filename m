Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3974D2EC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 12:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561166.877538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInpU-0003Vg-6Z; Mon, 10 Jul 2023 10:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561166.877538; Mon, 10 Jul 2023 10:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInpU-0003Ss-3D; Mon, 10 Jul 2023 10:09:16 +0000
Received: by outflank-mailman (input) for mailman id 561166;
 Mon, 10 Jul 2023 10:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qInpS-0003Sm-DN
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 10:09:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1a11f2e-1f09-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 12:09:13 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:08:43 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 10:08:43 +0000
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
X-Inumbo-ID: d1a11f2e-1f09-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDghcSdhjCp5ZGDqf+7cwlSNmYaV3D7imRYKeoNS2WWKEtIp+6ItRuCn5ni4d2H40pI2k8cn6yEwigq/CcpEyJQFGM/yAcuLM5NG4dOrnDFLBDEuGl3q/P8pw8G5d2n6fnXlZOkv6xY/95YnkhWa8YzwLJegjySpy78u0CyIKu22BaYrrTFkHpcdvlEHyl5gsquXB36wtGYoBnhmNLtWB+9PDh7tpN9wuSGs3oEqmF1IRbQCcsyj04QiQBqadt/JZu/D3cQad906G601k0fUV/Px6zAZvRaFAeqaajH17eHqxXxKJclp5fzq33SkRq5sPu7N/JFqAWyj+9ChEE/4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB3pa+0hjhdpuk0rRtwyUkBWJUSgGFGf7Ox7cm0ARUE=;
 b=huQao8OM0EFYa0OhgwrRkz+f8T4mkKk400nLtoRZjlQ+GavyY4mGYdv9CQ/kKJMfB0iaFVQ8YF6fpKR8tq+bKIA4A5R5QHz3I6E6kBPxce3JpXvXRF5ocdU5G0GhAJwFX9CAjUE7c1ogSIUkdS9GzQNZoM0mK+2NrHRDVXy6e34F/diEaBfg5FTgZN2XWlUgD08i1/jnj8B6Y78X+bY/oVMIZZqeoU5/uOonmFzDZ4z8z9jONyWEhgIGmkTdFdheyYw+lSiueClAgCZJc92qeh4wJMoMYnylrcF6XDmBBKVv+q92WryRUaPKkAcsg00PoPdFxC1hW2UwcCAxT44W3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB3pa+0hjhdpuk0rRtwyUkBWJUSgGFGf7Ox7cm0ARUE=;
 b=xQ/EtMuck08NrWcd1IrJl6mqIQ71dMahby55QWbTuXSNo7US3JLxvJas1HLfsLNCdHIWqI2E6Qppg1SsgDtHkQQziCtD12f93kVW3jY4qOvuYXgbQRgyQS7ueC+kcyDaXee3pBkhjWJ3M759CAebnnmRF6RsytAA7s/D8qUYy4VkDNEwNBNnDOjtE9RBSH9sFX6TDJ6jIeWHiikUgsuqx6585sdOmicMM4ie4KEs/zab4l9VOLfpsx6HbUetqQ6PnwVKH+wzUN0QcPekGIxWn7xCl/7Hwqhlbxm3tdXfb2dAbMyYtq747AJhcbH7HeIMmPFR0WDlDclume4ydgcUdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6717701f-76c3-94f6-241b-743b4828ad6e@suse.com>
Date: Mon, 10 Jul 2023 12:08:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] xen/drivers: ns16550: Fix the return logic for
 pci_uart_config()
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 wl@xen.org, xen-devel@lists.xenproject.org
References: <20230707113518.141489-1-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707113518.141489-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: a41b07d0-f6d8-4bd1-a123-08db812da425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dvsFp6d3/VDZ0MMXNyhXIGmmNWtuRx2furbf0EQlYnIUEnmZw1vENxOM89TlXipt5b7sNcfDeG9vj7SHrqTQq+9hzSB8VIdcaLzGq5SAkeKE5mmuald9rJqpazQXfreoLk67WMSPW++ppmSnWTCzep4gGeKx3Al9TkQLVdli/AArW9xmN+AoL9ru6hwYuJbQ3u1AS+P4PNo4ePvjJlLwEdtu5eEd0LbavRoqa0J776FRqyxZwb0q+DxGbnviQZPebrfcuUDDojLM3X52EUSFMZwAbyhsZRN8xweG7PO9Axq9zBqHIAQAMv1l11Jvn09c2ClhlCsUhdusOt0WVm7wFt8W33PiJ2OIvZ+vM56TuwLR9pzFHbQ17dbu5kBepHq6gxpqf7Ui3vghFKxBUwUQe3LYTxfgFakDTKKLl5GxALfV8O/1ZBrIdhJq4lkxC0tw/vyY7ZSFYgnwOU8T3d5AIkHByWBnHm8HmOVs7HEcTSKSoFvpvt6J7+clMq04cq/46ACLFE2x4OCS4OrhDc+d76PnHRCQmPIA2E+HvULGj7eJdKZ0CiQJ6KqPDKpq2khkHkqy9PpFny5XjcJ7NIsHX5LZbVDArLq9EGX9IvoD+rCQTqJ5zkFNB9adw0pw7EQwE7tJg7z3ou/nlvE5KQBOdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(39850400004)(136003)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(4326008)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUNPM2c2SDRHeEtCaHdCZW1vNlVLR2JMQnN0ODVJelA4blc5V0p6TFduc0cy?=
 =?utf-8?B?YmxzcE94N1o0N1NpTnJiM2VRTW5SYSsxaStyRElBS2k5dTVjUnBEeTY0Rng3?=
 =?utf-8?B?czJvNktpN3ROaW9MVDkxeEN5NURaMW9oUVJmRkZzTUNqeVJ6cDgzN2ZCTUgy?=
 =?utf-8?B?cGpRMjJhMFdvczVYVzFacHJlMDl0SGR3WnN2WGVYaVpHVDMrUWF4UEFnZXFV?=
 =?utf-8?B?aStXeEcycDR0TDdLQS9QK3hCNXVORlJiOWY3czB2RnBrTm10NjRCRmlUUzBs?=
 =?utf-8?B?ZGtXcHFuTlhKc0NkRlQwVERHRUtoVEtGZG1PRC9ZUUgrMmFqcS9QMmdEalFG?=
 =?utf-8?B?ZTgwV1ZkaUFKaXo5VFBIM3FrRmhWVjk5NmJzRGRJd1ZHcWgwaUxabElENDFa?=
 =?utf-8?B?dTdyRWt2cW9NVGJ2cDM1dWNSMzVaOGFEWGRwMmlyZllYOXBQbTV0L3lNUXhN?=
 =?utf-8?B?elk0TE9DKy9HUDJ5alRLSFdoMklOS21hT3BaaXpJckRBY0dZVlpLSzN6OUFu?=
 =?utf-8?B?YzNlWGFMQmYzbzhjQzJuUTlFZDdDa1dzbTUzNHQ0NzJsVGRqTkNMM0d1cGlX?=
 =?utf-8?B?UmhqMko3d3VCVVgzaVNsMGsreHJvSjc4d2RQOFZHd0NWdkF4a0VOZmM1SDlp?=
 =?utf-8?B?VVNSaXgxNDAyMU1rQ1ZQVE1zU1pkZWlhbTU4L3ZiaHhoOEdjN0xmdzM5ZkEr?=
 =?utf-8?B?ZmlIMDhiSjFBclJaL3Y3Z2UydUxLVUVzbm13eWdzc21ud2pRN3B4WWRYVVo4?=
 =?utf-8?B?KzlEcFUxbHlaV1krQmVSUnIxZktIVU1WTXZseDhFeU9BQVBCV2x1NUNMdmhO?=
 =?utf-8?B?YVRJU1R5Z0FRM05PQWNENlVSTThESlEvVmlnSEYrM3pRdlQ5NEZjZWVPRWxT?=
 =?utf-8?B?disyYURENnc5YU9zaUMxNU1CS0hNNkNpN242Y2Ztb0JkYURYcDZYTENFMi9S?=
 =?utf-8?B?WWVKaVNWdzZKYjlyZ1lCMFkrYnFJMlFObU4xZjRFNW80eFA3Tk56T1dRNHFM?=
 =?utf-8?B?WXlFdXUxMmJMZkF3ZGo2T25VZ3M5UmxVZCtiMVBpdTYxTzRLWHlUOGU3bEts?=
 =?utf-8?B?WTJwdkZPVUgxVWFZWTVZZnVaazBZOWU5WEkwaWtxcWp5aGIzMWVMREh4UXh0?=
 =?utf-8?B?V3l0OWIybUJtY2x0dG9qYXBKbGVoMVZ4YlFPZHpXN0FaZjRPbEJqMS96MjdF?=
 =?utf-8?B?d3dWMFU0NDVCdjJmMmNoUWJtMnM5Q2VCeGJqaVIreFVKTDJvR2dMZmhlRXA5?=
 =?utf-8?B?OHRGOERXRWZUR2ZsaTBpR1B3YmFmcU5xYWpQU3RhUkoxNXlwYm5YNDNveHdT?=
 =?utf-8?B?b2gyYVp0QzQvcXVaSENPZWV1SnJiOUc5ZGtBVmkydFFjVXVGaTVGWkR4Y2g2?=
 =?utf-8?B?UHl1eHlBblkzU2d1QUNUNUZ4OTJORlE2MGxndG5yV09ZdGdQQVB1WTgrK1I2?=
 =?utf-8?B?dDUraHM1R0xidGVhRGp0ckpBMU9mQmVxZEhubWdxTDZRdzM1NlZoTS9qQnN6?=
 =?utf-8?B?TGtOSnk4WHFjVWFaVzFqMENsdFRoNTQvNVM1d2R0N1VBcjA1d2g0WjRndFBR?=
 =?utf-8?B?dkdtQm9JU2NEV2M3OXg2ZklxMWR1cmJyWFNGMzhpMEs0eGlKOGxRYStJRGFW?=
 =?utf-8?B?My92b3FUZTdjMTdaeTZFVmZvZTZLN3FTZ2FDRGduVFA1UTlCOHUzOUdqdVJa?=
 =?utf-8?B?dkhkRmdoMjVNN0JDT1RsRWVwalJXS29XQnBQZk9YSExYQnFZUmdFNWlwTjNl?=
 =?utf-8?B?ZUp5SzBwVU5oWE5NaldFcFF2dUZQYVMrMkNxMnVwcG1kTVRVMS9ialVHbERB?=
 =?utf-8?B?amlML09YMzB2VDZWM1JleUUvSzNPNHQ0aFp4SnZhMTNzbmpmL0p2ckgvY2RU?=
 =?utf-8?B?VmRLSmdiV0xYcHBYOEJ0ZU1sallxU2hjdVhyaWhPUzNMcE1TQjZIVjJCb0t1?=
 =?utf-8?B?TUk1dnArRVE1eWtsM2wxU3kxVFZVd0hiWjlxeEFLVFA0bVNZcVpEek9Da2pa?=
 =?utf-8?B?ZHkwL0htZHpvYmxTbzErT1pSU2w3SnFaakluc2NCWlZJM0MzNEhoS29xSnlW?=
 =?utf-8?B?WExEMGI4enRFV2wvTHdyVmo0M2RLdzRmZUpBOVYzUHZQWnR3bFZHcUxFOHVv?=
 =?utf-8?Q?UsY/yuEw/pFUt2q5ZBuur4enJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41b07d0-f6d8-4bd1-a123-08db812da425
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:08:43.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmiuXUeui0OPlcLMBfcQOwHqeQ7l3a7KBLF0ZvobellQ6lD2tZYx0aEVq0lT3CdpWqBMTQulelS3pHdo+3RQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872

On 07.07.2023 13:35, Ayan Kumar Halder wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1342,13 +1342,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>          }
>      }
>  
> -    if ( !skip_amt )
> -        return -1;

This special case probably needs retaining in the new model (with an
altered return value), such that ...

> -    /* No AMT found, fallback to the defaults. */
>      uart->io_base = orig_base;
>  
> -    return 0;
> +    return -ENODEV;
>  }
>  
>  static void enable_exar_enhanced_bits(const struct ns16550 *uart)
> @@ -1527,13 +1523,13 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>  #ifdef CONFIG_HAS_PCI
>          if ( strncmp(conf, "pci", 3) == 0 )
>          {
> -            if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
> +            if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>                  return true;
>              conf += 3;
>          }
>          else if ( strncmp(conf, "amt", 3) == 0 )
>          {
> -            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
> +            if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
>                  return true;
>              conf += 3;
>          }

... e.g. here you don't suddenly change behavior in unintended ways.
Prior to your change the earlier of the return paths was impossible
to be taken. That's likely wrong, but you now returning in the success
case can't be correct either: Further items may need parsing, first
and foremost the IRQ to use.

Jan

> @@ -1642,13 +1638,17 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>          case device:
>              if ( strncmp(param_value, "pci", 3) == 0 )
>              {
> -                pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
> -                dev_set = true;
> +                if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
> +                    dev_set = true;
> +                else
> +                    return false;
>              }
>              else if ( strncmp(param_value, "amt", 3) == 0 )
>              {
> -                pci_uart_config(uart, 0, uart - ns16550_com);
> -                dev_set = true;
> +                if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
> +                    dev_set = true;
> +                else
> +                    return false;
>              }
>              break;
>  


