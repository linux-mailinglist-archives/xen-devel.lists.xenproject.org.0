Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877079A624
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599158.934441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcVd-0002WL-S4; Mon, 11 Sep 2023 08:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599158.934441; Mon, 11 Sep 2023 08:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcVd-0002U0-PH; Mon, 11 Sep 2023 08:43:05 +0000
Received: by outflank-mailman (input) for mailman id 599158;
 Mon, 11 Sep 2023 08:43:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfcVc-0002Tu-AH
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:43:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 379f18df-507f-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:43:02 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 08:42:58 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:42:58 +0000
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
X-Inumbo-ID: 379f18df-507f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWFvE7ZFOpvIpSwQLeBbvQ5cnZUcW/RKAjbDf8U2/cXbCUQeF9wmRwmptWzd6XOkBVySVbOcV9+9arcZDb580rEjG65r/cSA1Zdb70EePwsJj8wwf0KqWmADxYsNZ/aCA1jFC78iApxO8DnDhVnn45jWtf2iF19v8CE8roLoQdjw0VcL78eoK+s4+jOq00TWDAQxVpjXStCpOF2XMOpYX2/vmGcvD+12TJcCRBM8UDRCUY6wEbkYVh9gFUiWbdPpSQj/Qrj4YMlKB7FaUv7gheTlJy/CFsFKknd9TuiJi7gjfyeuFWEr2XKUtd/gfXdjKgMhTfJV7Q2lNAy6tYfZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQn4fUH3mAVzi0iGnDX44c+aMziGaB7QTno6XBJ60h0=;
 b=mD404E554wEGEPETXoFssxZrP8Z9mXxVSOkUKGTP1jtT9COPeD5GcSBj1ciypFyIxGF3voT2lm9Zo3JswqHgPm+K+dN0Nu8TWc1WiKPBqxd13Dy5fvlH+9uC8PHhwM4mAT2PhJF8eUVsGdFr1koBgmOZKnDTnN5lx8KVd/bN6OU9S1KCoeDO9cBYj2rNJsG1hGtkne5UJS2FlgEPc0CYgsg2sekZQJQrLSMZfGtCoJr2JZqWc8lAD7XyQUO7BcxRc1n1T5BGSc/BwmlqdQD+V0yjENlFIE55mOj2CcRPFUUsMZAtTQ0IA25xLuo+NKLLVC4BHepXyFyFpv3LK03maQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQn4fUH3mAVzi0iGnDX44c+aMziGaB7QTno6XBJ60h0=;
 b=LgoWI7bAWb3Qm8r2SL3VQj8ymAjXHnLzgaChLRjXNCSTdmNDuXrd3dmOpENCAClexw7GSWkyXBKHqIqfLNCKRU7oin3sfPTFOW3xOjWodW59d+iPVP5Hn+/uMArZWcQnrAQW8eD4ZjQ2h5ch0f/OiQyQPCyN1L+XqZ9WppwGZW7wGTkPDHRytfyRdehdURsi8DjWm4m4agzJY1b8iCe1MDUFhzvrER5+yfpSta9hZ6aW1Ydcd3Fvo4U8oRoHOQ5nTAEsxc+hSQhz9EtGqBkWo4QwDLFbuUZOgrzV39XsYWjUiYdezxSiJjsDxvoQ1RmK3pqTBaTGucK+brrEmt1yhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16edda00-662a-1b37-327e-3ee3ab87fd3a@suse.com>
Date: Mon, 11 Sep 2023 10:42:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/PCI: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f6884bbff0a4117874618bfbece5066d98131aff.1694419992.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6884bbff0a4117874618bfbece5066d98131aff.1694419992.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: e429fcf3-cc08-40da-97ec-08dbb2a319cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PrBt9BEilOMCOSN/htQC5QhCrsybYup+i4/C5O+N2JcIsxWryB/SZDSrUoeHGYHSBk4Le57ZsEsCECKbuGnR9xMi5ymJusMoANZF6pu9hH0IWc2u4kpTQe2zbRRtXaqYyny/Guqj+OZSbQm9F9K/vF+St2JcJMvtVqJagkumPL0lluunk8yvQc/WteVI92fyLLV2uXpOAMCZQ1iGGAZR/li9DDmeuOWy34NuSSt00FpTcYNuS1CuM8uK9tiYC2bZ1m4OIi/pi8RTslTKq06IAErx8oCkQJOoCPXdUNsyqGppIpNtpTW1aYW6D44YqP+c9W6mWBJehruUpFf8Wg7czMGed7EB/14/yDaEk82ngK5b6EZapzIsfvmXiiyc09tZz90sR0CNqR8o1Aj8WlKSlIpQ0q5WL+w5lp4OrPADdSdKtdwHGVnF1wcbiFMLCyJoVSTLiAugBVxQf9v6Xandx6kXt8mHPh402uhlel+mtHGEyfrxRm5Ule14BWl6vO9mX5u0vfn60UgMRd+9X+pLnK8VDY5CiGQSnnpjaBqz9RfNDThc/yBjlOZXRkyZuTpLtoKn8hpV7qMjKvgdfozwuRBibQNmN5krLTDgOJLKxVeUT3L5Jgs5VtGeV8XIsXjAi0zmz+L7NMwMQ1/9z/C7hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199024)(186009)(1800799009)(41300700001)(31686004)(53546011)(6506007)(6486002)(36756003)(31696002)(86362001)(38100700002)(26005)(2616005)(2906002)(6512007)(478600001)(110136005)(316002)(8936002)(8676002)(4326008)(5660300002)(66946007)(66556008)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVlCOTlNQ2xpcnZIZGVZWTZDS2ZRMlR5YUM2dUt5cUIweUlVb1AwQmtIS2hB?=
 =?utf-8?B?SjJHUE5zNlNQamRVRzJHUjZQTjFoVElzQ1B0NDRwbDRLNFlsaVFvZzZwLzg3?=
 =?utf-8?B?RlprNnAwSnlTMjhHUFZlNnU3YW8yNmIyYkkrTTMzSTFIQ1FuOVQzbEtWY25R?=
 =?utf-8?B?VUh2OG8zcll4cWpyNFNpZ3RMcFo0bVpDbmJkSlFYK2gxcnhiTkZYRWJpWmlr?=
 =?utf-8?B?UGxLNUtobzluQzV5WmwzVEY3TjRaV25mdEM1NndPTyswdjdVZ1dPTjVhdnN6?=
 =?utf-8?B?QUsvY3FzdGlETzgvZ202MGE2SGdIUUtUWlZjT1Q1azB4VEdiUklOWUR0UFd0?=
 =?utf-8?B?czVLaTZUNzgvYXNOQjE4OVVKZ1BpM2ZOaTVHOGZMcnQ1eEhCdnNZZnEwWEdZ?=
 =?utf-8?B?Sm5XaisxR1ZWdHZaTS9DM05Hb3djb3JsZkh0eTlNSklEVDdBVElUWEdIUEdU?=
 =?utf-8?B?MjdBUjRoeFpZcUN6WXpLUVlHTmp1YTNhS1V1d1dBMzh6MWI2bFZNbFkyb2tl?=
 =?utf-8?B?MU1wN1FYYUtJY1l1QWxlbHFnOEZWcGdXWWZmRTN1MWJZejlRdUpYRjc4UEFh?=
 =?utf-8?B?enpYTjBDeXh2NjZoUTR1L3FGOW9WdHN4bG1lWlZqMGRxMnhJVXFockZObml0?=
 =?utf-8?B?M3NvalZTelJESU1MR2hJdVpUdjdXNS9QcVJ5MEhmSkJxZ05ZSHQzeGVSZXYz?=
 =?utf-8?B?TTlzT3ZXZ2hleUdISDFsd2UxekJUaUszNnVuWnFxcEpMaUJEWG55aGZGTDIy?=
 =?utf-8?B?TzFwcElLblhUeFRQRmlvL29td1lhd2VGb0paSGhwSUo3THdnS3ZFaW4xUGdK?=
 =?utf-8?B?K0tXV2MwUSsrN2RnN3A4eVNRZHRuUStVYitDYkFvWmNVRjhDNk1pMTNlSFd5?=
 =?utf-8?B?a3hleXU3UmNTbjlDazZZeWdxRi9wOWY1QjUwS2hpdlRrUkpZWkl6bXh3WDND?=
 =?utf-8?B?cEYzeUtYSk91dWNOUyszL2VTd3BMcnhhekZUSGxCd25kUUNLZGNNTUJRRVlQ?=
 =?utf-8?B?aktZN3NESWdVY3cyU2IvRStFV3AyaUprZVNoSTNCSWo1VlgzdVNEWnZXckw2?=
 =?utf-8?B?dmNXQzFYdlNyd1pQblBsbXpFR3VOQU04eTZKWmtGU3BET1JCUVRqeHFGMkhH?=
 =?utf-8?B?cHBiQ2VMMklwSjJXV1pJSjA3dGs2bTVUWW5pckF5Um4wcGpzRU9oRVppeURE?=
 =?utf-8?B?MHBCZFVtWkVNa2c1TFZBZGREYWN3UmgxSzNLc1d4YmhpTlJ3dEV5enJqZ1ZL?=
 =?utf-8?B?ejR6TmNwVlhrMUx1aStyU0lIckNhZ3VrZFJLY2tPYkw0SG04eGhDc1daejVy?=
 =?utf-8?B?WWdmMXYraW5lZmI3d3V6djE0Mm16OWxPUHJ4NnQrUXFZalJybEV4TUFXQ3dx?=
 =?utf-8?B?UlJzaDE1S1MzRzE1VUducGZYWTVydEdsUjUrd2p4bTF3SlpHenBBZURSaWhY?=
 =?utf-8?B?d2dSOUdQUk0wQzFZSTVlN0tvQzYyeVZ6WjY3TmlsQTZaZFZmR2pMTCtiNm1z?=
 =?utf-8?B?UW85T1d3azQyQSttUXluL296UFMzOW45WE1kcVYzTTlqZVJHVWIzZGg2Qy9C?=
 =?utf-8?B?a3IxUy84ZFo5dVJFUGNyOHJyRlFBMkZFK25BNmJ0TWFHdUNCdHk4dWFoRXZk?=
 =?utf-8?B?Z1V5K0R2cGgxb3Vmd04vTklJZWVFMDNlNnVPdi90ZGROTGp6UXBwcktXT2pG?=
 =?utf-8?B?a3ovbVBKTDM3dEx5TjZ1Wnowb1dOelhkRzVtbU9CVnJ1VFd1MG91MTZKVzBS?=
 =?utf-8?B?Y0R3QkRpZEM3MWNRWGM3L0JlSUZZUmE4K1pRTFMwZEpvaVVRSUN3b2lka29P?=
 =?utf-8?B?bFJjZFl5NCt3dDNNaEVBWUY4dWt5SWRwOUVlZHhsZGN4bmVyTFY1L3FudjJp?=
 =?utf-8?B?V3pUbTJMcVVwaFJ5Zi93WDRocWd6a3JQQUErWXZXNjJJSFpsZUFrZ2ZScXZZ?=
 =?utf-8?B?RUU4aXZ4TkZBOGZBK0FTUXRFZ0thb3NXK0pjNUhxQ2VTZmx3UVAxV3dpN2Rz?=
 =?utf-8?B?bEdRNndqaFFoKzRZeW42TGdhdTR6cFBsbkVSeXVrNXdwNlhVVGg1MG55VEUr?=
 =?utf-8?B?QkJBWVd4Y0loVGtpMitZVlhmV0tLTUQ3TzBpZU9Bd0ZDbENpdDkvWlBSY3Fz?=
 =?utf-8?Q?MKgku0o5N/JuNjD1fCY2tfRhR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e429fcf3-cc08-40da-97ec-08dbb2a319cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:42:58.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXqnr0azX52llMlc+1FDjuli3iUStGGq5zg3ueeiUvpDUZ5+OgYe5SyrqGE/36NxpYNlh67LlzxE8vVfNGWo9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065

On 11.09.2023 10:15, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Since formally correct:
Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless, it is probably about time to mention that ...

> @@ -198,10 +198,11 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
>  int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
>  int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
>                                   int cap);
> -const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
> -                      unsigned int *dev, unsigned int *func);
> -const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
> -                          unsigned int *dev, unsigned int *func, bool *def_seg);
> +const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
> +                      unsigned int *dev_p, unsigned int *func_p);
> +const char *parse_pci_seg(const char *s, unsigned int *seg_p,
> +                          unsigned int *bus_p, unsigned int *dev_p,
> +                          unsigned int *func_p, bool *def_seg);

... parameter renaming like this, while fulfilling the word of Misra, is
actually hampering readability. To someone wanting to use the function
and hence looking at the declaration it is entirely uninteresting
whether the _p suffixes are there; there were similar changes earlier on.
The longer names merely make reading harder and - as is the case here -
also may require a single declaration to wrap across more lines. I view
such as going against the spirit of Misra (aiming to improve code
clarity).

Jan

