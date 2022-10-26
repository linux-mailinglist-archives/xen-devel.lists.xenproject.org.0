Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4860E0D2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430527.682305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfdP-0003dF-Jf; Wed, 26 Oct 2022 12:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430527.682305; Wed, 26 Oct 2022 12:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfdP-0003au-Gr; Wed, 26 Oct 2022 12:35:51 +0000
Received: by outflank-mailman (input) for mailman id 430527;
 Wed, 26 Oct 2022 12:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onfdO-0003am-I2
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:35:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20054.outbound.protection.outlook.com [40.107.2.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7ff64f8-552a-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 14:35:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8130.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 12:35:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 12:35:46 +0000
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
X-Inumbo-ID: b7ff64f8-552a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUTS0clZ+C0WCbhjkylh+bosqPCaX48bf+Yg68Lh01luC//nN1MdP+0R9NDvgUVdB5m0EFCMnRaOQw1Ms/syP5mbeS/OgzUjEzIYoyASiGrIuOqtubsL5BeK9/5BZMQc8Tpnpy430qQJD+J3TNqczcbuC6j112GMbUkzf9KBe6jeRNqcBeNjxOx0PKZjupGYIgVBHlm0Fgsv/oc3ajefpCjkLZ+EAHIGUFIkRX602PPCNCbKj9436AN40DsmQtKbBqETBBmEd1xvMBjaEcL8GDnPqcZ0JmDHbaawdp3piF/Ij+GPUYVOj5ce/x0G5HWzS0mvISrBkGVOt292RlWJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD8Ce0/dRHbCANyucPc8SVsJyQwfDzrQc1UcfGfRc3k=;
 b=WsgPVDnDRglO1AjRlHXdPZfq3fRM+Skzs/yDZH0UunEN4FN4n9IpX6txtKklK72np+ldXklrRJjl3EyJP6QCij1NBDC0Vl5qvRd4dlJ2Za70O4kFk7O867+IwbJidBg8lPLuplnhSr2tCT5UrYCkorJXEfW5wXYJQoD/TtOzpe/OSTrMch1YzUHJaY6eKnFcIbd7aJSUoTfgFE58SCniCvVKuLHNneD5RP3dP8yRuGeuAlx4tUAz80T/lvYSUVVwqpI4vYD8BQKbCBFw03aDtI2R7dBdm6Nrk+pjYdZuF83yGi2gxnpC1O2zhXZ1a2EkOXKzdZxmZU5RZ/japMAFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD8Ce0/dRHbCANyucPc8SVsJyQwfDzrQc1UcfGfRc3k=;
 b=EBwdofMA9t5kxSnFYo4nZx7xcGtU5sM/BjyQ0xw1Tk4b29wMLIlJYPcID1vYKLzc8PL7KAgHoI8ogUzDBeMwd9gtAdv0FXe8BtbzH6LaIh60IisFkxBWX80LWCYM4rLDsCluIzc83Fp5WgUlJ15vNnPVUadsJCPaMg4UYGBBFg++vjbMOmWRm+rLrok4YfW+tjrkt0VC3/cE4iJZhgRU0FH9xVI/ElF2/JAfHejL22wRpcRj40yUTXz6sE0DqwcOVDC0y6Kl6nnChKaSzbkdQBtZqunN/psEQny3khgD/oexF5pY0jpXa7/zLt+bj5ZiHcux8CV7YV0RepK6VYeIPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a03bae18-9a38-854f-0634-f11c42e65fcb@suse.com>
Date: Wed, 26 Oct 2022 14:35:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025144418.66800-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 62841d0b-7898-4a80-3aa7-08dab74e9aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f+7ccl4ngmGokHiBEmAJIH569oGq4psIbQtX216Z8scgUXGsTBn3dazCuHI6/miESGhONu/cAODpQATZn91zH2M53ag//gmtlRaeNwA60pj2C3wABrXScTgBpCQ55t4uP+gorQyZsTuHAI2EoY/+twSVUnFD+PIeseTBIKi0Lko85cvSzdFU9BffKXmEweNBggC3VpdWg+XkshgS2qQllwaTosjNEV+Rnip25JFWdV/YhSAmBO15Wg+bvwOPyFiQceJSM7aH+SwdG1yf5U+dKc8DPnBEUwc30Tb9hfoqoaLmhigljrHkZt6yVi5u+NeBTOFBZi0m7ErI1gteeHmoTXB19DLZ6g9NgtQCSNMbcvH51RaziT5te2Y1RS2CGSAZyHeKubJZj2H8hkXwN8ZAUtUvML3esD/J6fyCoMa6fU8zlQpxnRWtU5ARW0Mp1iJhAEj364ybyGr6f4vJAXnDcaLMpIBq2pYbCMw8RcKt1UcaKSNUlLgSkV745GWqdtwPFZp/f4zTnpm7h4fRVOIR2bz3w+gOI+jGlA4ZxiVJ/L/It6V8FwVMqM2oN4IP/KWcudtT9havv/dqNkOKQth5AxkusQXD6x5VuappyY1uhZRfBFY88EmTEQ+PA1EZ6b/QYmZJMXzs8d5KgXN1GWF44rsT+yZFN4KAwHUNvf45FkpHqGsAb4PcH4OAa+OHtwpvnqJmvaljxkBdQxjLhVqniIcI3JulsMfC8MgUUlRKemrDQQ3ZU1Z9s74buapd/I/0KPCEGXx+7WXYqMJGgqqHHUfkHJEUT9cXB/qG3PtrGMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199015)(6486002)(478600001)(86362001)(31696002)(83380400001)(31686004)(66946007)(53546011)(66476007)(66556008)(8676002)(4326008)(36756003)(6512007)(5660300002)(26005)(41300700001)(8936002)(6916009)(2616005)(6506007)(186003)(2906002)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFoxMlBjSEpYbloyWnJ0eGZEckxBKy9TYjBRTHlFTlhhTVJncTh5cVQzVUJT?=
 =?utf-8?B?bGdwdUd2NDcvNWQvY0MwV2hkS1NaSThqSnRBdjFaYVE0MkRTekduSGxNQTAz?=
 =?utf-8?B?bG45VVJ3WnpZc1VyeVl2aHJJc1c3eE1EczVOVWpuQllRY1lOMXR0NTZ5N3hw?=
 =?utf-8?B?RXpQdUIyaU1NL1NXK1ArN2c4bkZ0WHJydjlWZUYrV3UzSllDTnErYXhFak9o?=
 =?utf-8?B?V1ZJcE9SRHBCR25MenFYdmZqb2dKU1VwWUFJZTZnbExCbTlRamMwN1RrZFV3?=
 =?utf-8?B?Y2plM1VYa1dmTHordnJ0V3h5dWFkNG1VaHNDejh1L1JoVEcvb3NMR2piMURH?=
 =?utf-8?B?WE5XWW9GVXRTaEU0akRQL28ycE5WWGdFMEFTSk82SzdvV0wvL3J5ZURkdGpS?=
 =?utf-8?B?cjQyOU9GSXZTb1d4NkNiR2JEU0paTzg2TTlmaFd4MHJ5VW9iVTNodnJ0WE9F?=
 =?utf-8?B?bkVVU09rNkhmZlAzMGZ6aGRDTDdsSnFTWHFjMEE4SGZWT2s0U0dtSWxUWFVn?=
 =?utf-8?B?aUJtNnNEd0NvQjRVUmM0YWR2YmZkSlpHVm5XMEd5Nk9jMzJKNGZWWG9ZdDI4?=
 =?utf-8?B?S00xZkM2TFRiVThpUlUyYXI1UFpJR3ZqZFAwbnFqOGtqT1JkcUpXN2NjSlZO?=
 =?utf-8?B?NWlKZ0F4R0xmaUlOMVdlcm9RV1hlWk9sOUJMeWNtY1plWk02UDgvYUZKWlp4?=
 =?utf-8?B?M1FHbTFwKzZaMkJPR3A3WnJkYXVBaVZUZ3VDYzdEN1dsRUtmcW14MHAyOC9Q?=
 =?utf-8?B?VkVScmlIOUZuN1l6T0VjSUtMSkJ4cU8weHREdFNhdTdhMFNLRjBhTGYyV3pI?=
 =?utf-8?B?Q0FxNWk4cFg5N2JZb2FJMnZiV2ZtOUlqNlZVRGVGQWlXNjdEeE5xeVBRWXMw?=
 =?utf-8?B?YWdLakt0a3V0OENpTDl6dFNYd2xvMHNmNk9qcTlXa0hOMk9KRWwvVVJmK2Y1?=
 =?utf-8?B?M0lCbUczZ0ZxWG1vS200SEhVYXFBQmVUMm9sQ1hNOG5UQklxYWVYaEtqU3Fv?=
 =?utf-8?B?SzNRQThUZWZhbFc4MUZWR2hGM3AxM0pIMDlVelc4R2VqT2wvK0dnUFRVdDAw?=
 =?utf-8?B?UWVpTENXWkt6ZERsMmZrQURpV2o0ZDVBa0FOczNwMjY3MGp2VjhqNjhQcUR5?=
 =?utf-8?B?bmZGMnBxZzlxaUpqQ1ExVERJTHY5TzAvbkp5ak51bkRoamd1dEtMaW1sWjQv?=
 =?utf-8?B?aU12L1hXWStycVpFaTZHWmQyam5VaEVXd0JIRXFwRm9BUkZudU5aT3o2Nml0?=
 =?utf-8?B?eDJTQ0hGLzBDVnBFcjAxTmJ4dnNUWk9FZzM5enNGeUpVckFWbnpsTEJJTG91?=
 =?utf-8?B?ejFJYTJNb0QvcnBZRW9EREdPL1pYVHFJdmJ6MmxEcFBNR1JDcnBOWG04OE05?=
 =?utf-8?B?TXZpMzNvSG9jVVdlR1JjL29vM0ltTk04RXVvTEFlc3NnUitwTHdRUkhSVXhF?=
 =?utf-8?B?NG5rTUhwdlB2ci9hbTFHMHBockw0TGI5SDlHajFBY0hCNE1vS3hubXVHcDFB?=
 =?utf-8?B?RFZmVnQzSG5Jc3IzVnh3Mk5zS2JMNnFYU3dCWnlPOXdqV1BUaWxVM2dzRXho?=
 =?utf-8?B?N1lONU01WmcwdHpvQ2JyUnBYWVNUZ2RMWk84VlZ4M0pLMVF3K2tkQVN5dUJC?=
 =?utf-8?B?N0VvekQwQmc4aUhmVy84MUNxRUhzRnNLRXBwQXJaSnpMc1NuSUlmRXdTT1lZ?=
 =?utf-8?B?ZVUzNlFFRDlZa29GWE02aXgrUHJzcS9rNmJqYlVRSEwxSkNvS2FSNTd6NlZn?=
 =?utf-8?B?dExsNkxVTmFIRWlwNVNIcDZKMzVwbFlwMjFrbHhqclZUTWxsaVBmeVdqMmFn?=
 =?utf-8?B?SUVSUXNWc2pCM1J0VTRyRm1wOS85OHM1S01IcU9mcGY1L0tnc3pDcSsxNWt4?=
 =?utf-8?B?aWNaSUxrVWxPWXhzL3BORmtWL2FBWnNYcDlZRkV1S1RpWGs3WnVrT0NzMy9Z?=
 =?utf-8?B?a3BOYUt1R2ZJcFV2QUFEaTZsY0xicEhhd1BaTkIyVEw0SE1DR2tUY0pUY2JW?=
 =?utf-8?B?RkJBZGVNRVNjRWptMVVXcTVLZDFTZ0kxVERTNklnSVhlbnQwNEx0b1J6NzU3?=
 =?utf-8?B?RTJ2MXR2dVZrUFhiTU9mTWppYWFEeTFaNm5ocSswQThzOTh6MVpaa1JpOEFH?=
 =?utf-8?Q?11T/pl1uFpAibHhV7uK0fOChU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62841d0b-7898-4a80-3aa7-08dab74e9aeb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:35:46.2035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+En24XO4+U7KbjMh9iWqrNuN3xQXRmHr2ZZwsW6S+2lql44IHYWG4vLvUhAR/iCmNBJYZdkFm6J0hTNvx6mzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8130

On 25.10.2022 16:44, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -121,7 +121,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>          }
>  
>          if ( !rom_only &&
> -             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
> +             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
> +             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
> +                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
>              bar->enabled = map;
>      }

What about the ROM handling immediately above from here?

> @@ -234,9 +236,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
> -                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
> +                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> +             /* Skip BARs already in the requested state. */
> +             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>              continue;
>  
> +        /*
> +         * Only do BAR position checks for the hardware domain, for guests it's
> +         * assumed that the hardware domain has changed the position of any
> +         * problematic BARs.
> +         */
> +        if ( is_hardware_domain(pdev->domain) &&
> +             !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
> +        {
> +            printk(XENLOG_G_WARNING
> +                   "%pp: not mapping BAR [%lx, %lx] invalid position\n",
> +                   &pdev->sbdf, start, end);
> +            continue;
> +        }

I'm not convinced of it being appropriate to skip the check for DomU.
I'd rather consider this a "fixme", as (perhaps somewhere else) we
should return an error if a misconfigured device was passed. We cannot
blindly leave the security of the system to tool stack + Dom0 kernel
imo.

And then, if this is Dom0-only, I think it wants to be XENLOG_WARNING,
i.e. without the G infix.

Jan

