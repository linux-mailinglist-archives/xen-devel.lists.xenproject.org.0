Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D007567189
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361377.590856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jtM-00038k-La; Tue, 05 Jul 2022 14:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361377.590856; Tue, 05 Jul 2022 14:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jtM-00036U-Hf; Tue, 05 Jul 2022 14:51:08 +0000
Received: by outflank-mailman (input) for mailman id 361377;
 Tue, 05 Jul 2022 14:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jtL-00036O-BB
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:51:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5dd3c8e-fc71-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:51:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4164.eurprd04.prod.outlook.com (2603:10a6:208:66::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 14:51:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:51:03 +0000
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
X-Inumbo-ID: e5dd3c8e-fc71-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsnaaJEG3rmlFStHgX4Sz8bNLpYUwASbSl+8lyD9eWhIFb85oEs+O9xdwC+RZ1qGoFFqyDONi6dkOBr0T4g0JiDAyImqiNRZhd7V+jw0+CJM5ymewscijPLCbuN/R6HSyBYha3iA1Yc8LOMxJr5Q+7bRM7Ek2UeUVf27Sx8PvgoaG2LsulRRUdvPSL+vV/OVIZq5cshUGGZTJANbLsP7mphUJNSpBryPsixOVVtQOp8Tzk/BejusnbU4jGfbCG3zAw2PpV2plfd6akmsS6zBWkzl/+viJnqjUC09lyVTagG/yp53LZrcYTXqQRxZ6MskJB2IdmtkHOcr8joi5AMzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZS310zd5Sxoxe73YQR1oFSKnO/oqUHJOhszMvxk7Pg=;
 b=fuMjxjABFLUmRx4Z0Kb5OKHWMSVnUtnBTlmyEOFwzh6bse6kSJZXgXSciespFAkEhCvTLsTqm4fOuHlRIYJvd6ThPPoUvPFuqePkIbB8L8+QXZbaMHnXnsm1L9/hR9SoDJpwbDjENlZ5UD1Cpfx0TNV167+zFf52UpEbK1My/XOaWHb0CQOdelTwndJYuge2AGtvnzzLu36j6VdW7Bgu+mJcrjdBUA53/42MGskMad9K9fMRRpJUeRJbpDBiG6rz+seFJY7b9zk9ea7TXg3MxB2ClokVb0d8oDigYZfDnill9Oy0FyummrMYHrUAQ2086EGX24fUxRXvv8AxUXg3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZS310zd5Sxoxe73YQR1oFSKnO/oqUHJOhszMvxk7Pg=;
 b=uaDTheQ0xbn0wghELx9TuDtIoNSz+6/QK70iBa8lJkGrAaXJEQi5VAEhqdLLrgKRJlQ2RaGAGggZF0MXgui8d5k/MKe5qTOGx+XxF+2ssEM2iBffmM/pUbwO5+abE2vUeOmAre2zJ4BXmrcWNocs2DGQRKQlRxgp46RQ1pTajcoFyxGZy0eOPykT8W8RprJ25/yBIgBVisC7WMm/0ZPaSELvMT+5fQ2R9r1hrY83hVDWMpJTWDBn0NXcBbgVbq2TDI9FQqveDk49jeSDQQZrRijQChaSPFtmJS+5KtkIGks5GSX96DORyzY0rXeiTjp8F1cm/BF+DhlOSYI6jwGdjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0686490f-db40-2df6-e1a3-2c04918f8d1c@suse.com>
Date: Tue, 5 Jul 2022 16:51:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 6/6] x86/ioapic: mask entry while updating
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421132114.35118-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6850f5f7-7aaf-48bb-a261-08da5e95c860
X-MS-TrafficTypeDiagnostic: AM0PR04MB4164:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+m91HC4PPGes7v2unV/UE6NleIcmJHejVzhjeb7VWLmx9Gv3hIQBWocVtoNuaF6bwH/PmrmFet2T+7JDkNtw0OJ9ufjUukp0fBwqi/KiTK811Q59bjEEyXOsdGnF70KJ6dBXNn4ICi5jsnXeTFRYHmbv8u+82XFiyW9JpJOMtLT/mXGCdov4Oak+9Rf1L2axhmVbNBsCAVe0tBFHiJKVTAlGlNmeydmVW65jTaQzJZTr4cn9qgOGfjtbhFZTWjkYj6iuXfYxgfjWSxVnlS5Gey4Zvpsg0+slCy6Ogagf9Ag/ff631bH0m+uJ+qbKD5pyIzATW4fCYIEu5G5esvKp1XOfwnHsg7MbzfN1CqJQoF7L6dCjj3uaHEvc/HmmgPk+PB6//5fRZnN2yaZr0293c5ycsr+UFFkAKj5L85CsPp7bETM6NG9exhG7pULJUSmMfyztxlu6GUvX9YpXyuIUkPngDQ0wS6ZsyxjVwQI9RmhV/PJKfEtp/L+iUutoV5rPQKE+OBoVBMrEi1vZ0bgAkaNzSQdG2fPaycAAJCaiJtf46tsCXS2lPjiBpNdE4Fz951JoM5X9UiKu6poxwtBz2dCa8uSajTR/E4a/XT5b58lUyjc3azOkLrqQcUmigCc1K9l5/a7eYYyUkMT9mPP6aALxNQ9bP2trLVCkRiTL/bXPCiynC68NaEPKtKBHefuEZU9JNJXBfcy7AWCaGsuUWqvdYeI5NC+TD3fKzzkbxPJTWe+0LHforJrPGfOpK9gAUxaOlMy9CdgKB4I7vKX1MU2VtVU88pjykfK9fcE8Bsx9JZ3X1WrJrwDKiF6ZL92JrRezF5M9vrHxF5U/cfV3V3ps5zb3CDl0se4Ni6QW0xY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(346002)(366004)(26005)(6512007)(6486002)(4326008)(86362001)(2616005)(66476007)(8676002)(66556008)(478600001)(66946007)(2906002)(31696002)(8936002)(83380400001)(41300700001)(316002)(5660300002)(54906003)(6916009)(186003)(6506007)(38100700002)(36756003)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEdMQ2VxZVY1Vkw4eXdpTkVjZjBXakpVYzJPRWw3ZnE0R1RzY0FmenlrczFZ?=
 =?utf-8?B?aERXTlI1UjJqb0ZHWjB5b2hVVVdxYzJKdE1XR1VocWJEVVBzRlI3YWYyZjhF?=
 =?utf-8?B?UGdlKzFBSWh3RHRrd1c5QTMrMmd2U3VpMENJdjh3QTBYa2R5cmtUbTI0ajA1?=
 =?utf-8?B?L2pFd25hMlVHeXRPRGRSOTg2TVpkcE9URWhlaGVSNUxSbGRGbDh5Y05nYVZ1?=
 =?utf-8?B?R3NVZ1ZSZzNIYW1qUVZDZEx4aWRjcHd5c2VndnhCWnF6YjRSV2FOSDg1d3h3?=
 =?utf-8?B?dGZsQUxhbUw4T3dncTdZRi9pQUpCNTlwckxNdmJUUzQ1b21kWnlVWnFmNTdt?=
 =?utf-8?B?YUhwYzNSYlNRdk9TZkxFNFNBT1ZQM1pIaVdwSE1LcnRGS0V2UGE3SnU1eGM1?=
 =?utf-8?B?ZXE0Yk4yMnorcUdYMFBuVlF0ZURoSmlGdU5HQ0dhVkJpRHVrUE96RkVlZHVH?=
 =?utf-8?B?cllkVHU3dENFdjZXMEZ4SkVJVFo1TS8yU2NIMStYbCtGcW1qbjNxSUY2MkVm?=
 =?utf-8?B?cHBzZk9qMFZrUDdwczdJM0U3N2dENkVET1I5UTBSbDJGcUZYQkxCWmh0bmNC?=
 =?utf-8?B?OTg0cnlERWVkcndSa0R1dzVtd2hadDBtR280VGxHSWtaeWFQb2QrU1l5UjhI?=
 =?utf-8?B?bVh6dk8zODFEZ1RTSTdveW1zRU5zL2tMTXU3ZHVFeWUvbFdtL2NhU3FRclFm?=
 =?utf-8?B?VElyZzVYRlJLUGIxTURhZlBMREdpNGZmNmQ3cWFjOUtBeXpnZFlmeDlTTjVh?=
 =?utf-8?B?dHdKOFhscFFzUUkxNWNBUndUOUNxUE02ZmtwWGd6Ly81TTVGVHhlNWpsUEJh?=
 =?utf-8?B?dS9zYStVYVEyMXhkTmUwMDNDRmdLVU80M3orZ2pzWEZZdnhlRDVjVmJqTWhY?=
 =?utf-8?B?OVo2N2JTbGM5OThBQnE5amVCY2FYa0dWZmhmRHRBeWE3ajFjTHBGa1FFMVFt?=
 =?utf-8?B?NUZ2K3VNRmhFL2dmMGtwRHA4ZllmdXYreWR4NXQzV0pxT0NkeEwwakVqb2dn?=
 =?utf-8?B?S29sejBCdDdneDQ1UDgrVlVGNlVodk5aUkJ0a0cvVSsrRmlIQk5veEdEcXll?=
 =?utf-8?B?NHBUZjhwMi9iR3Jsa2VjSEs0TDlUZCtqMURiODIrTWZBclF4akFyWTlBRnhr?=
 =?utf-8?B?bkRBaGROc0Zvc3UzZ2gxbUlyQ1dYRy91YjA3UkFyZXVWdk5vcTcxS2NzdG44?=
 =?utf-8?B?eSt3L1orVlVhZFNVTXFyN1BpbkxONldWRGF5YVZUZXZRTU5HNkZHNmJ2ZUdV?=
 =?utf-8?B?aFpvdVVRWkt3a2tkVElZMWhPT1ZhNU50WitUR3dBUElIWVFTTGJOYzhYRmtH?=
 =?utf-8?B?WEs3YjNTN3NJZmFmWUJnYXNSMUZJSUtBajJaeDB5TjlIN2dKdjUycndmN0s5?=
 =?utf-8?B?ajZ1RUVVRkhGQ1NucWNtb3dEckNXdFg1VUV1WWtZT1RFTm43cFNLK3JGZklz?=
 =?utf-8?B?UVlvNDN3eTlJcTBOVWdGcEdGbDJDbkVYRS9tMjJJMkNmc1dlNitsWWZOM1lm?=
 =?utf-8?B?WlFuOEplc2JUV0hZMHFPY2ZtRWJXbHdwbXFCZzFkQnFRaTh0RWE4V2dMNHQr?=
 =?utf-8?B?K2lxMnlPb2sxeDVwK1JIUkdnQnNCSTUzbm02ZnZBQkFxTmN6SjFWMHEwQ2Vw?=
 =?utf-8?B?cmljT0VlTEdJK3NHb21XNlB4NitlUkxWUzlTT2lPNDdMVTJTamp0ZmNZbU9x?=
 =?utf-8?B?Nkw0OTl0anl0MEx6VTFwdUtEZ1cxUW9WZHQzUVgrM0xHZ2VvMzk3bHpmQVJH?=
 =?utf-8?B?U2VlaGUzRm01R3RkMUxRakY2bzdFQnBRTVR4Z2NRb1VJYVg5T3REVjFibUda?=
 =?utf-8?B?NnQ2bmJWOFpHb29XR1ZNbDhlMnQ4V0kvWmw3alBqMWxDeE5yRTlYVytHVGhi?=
 =?utf-8?B?a1BNbzJSVWFHQkRIZEs3VWFHZGkwVFZqZ0J1ZzJadUttZ2tydTZiMHp3b1lS?=
 =?utf-8?B?TFZIdmZLeEVIL2VaVjROdGk5SS9XbVE1REl4cW16bUI3c3RpYUlqai9QYUdi?=
 =?utf-8?B?cFlGVW9GaGJJT2Q2VytlK3k2dExuTngvUGRSZWlPSjZkenEzNHlodzYzVEkr?=
 =?utf-8?B?ZkY0N2d2SVdVZGJiVm9VcUdXZ1orYk5sSG5YcnBXb040K0JONjlCMWUxQmFG?=
 =?utf-8?Q?MXAGMl8n/ayJYuD5YvOCQsdfj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6850f5f7-7aaf-48bb-a261-08da5e95c860
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:51:03.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZxuHbLlEn1CvkI6hg+PgKd6RzxiJWE0h/BIj0aKjhtuIyLEBTEdf5QZ8KtU6K3vJxMVmIls08u2IUW3pyVrVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4164

On 21.04.2022 15:21, Roger Pau Monne wrote:
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -267,12 +267,47 @@ void __ioapic_write_entry(
>      unsigned int apic, unsigned int pin, bool raw,
>      struct IO_APIC_route_entry e)
>  {
> -    union entry_union eu = { .entry = e };
> -
>      if ( raw || !iommu_intremap )
>      {
> -        __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> -        __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        union entry_union eu = { .entry = e };
> +        union entry_union curr = {
> +            .entry = __ioapic_read_entry(apic, pin, true),
> +        };
> +        bool masked = true;
> +
> +        if ( curr.entry.mask )
> +        {
> +            /*
> +             * If pin is currently masked we can update the high part first
> +             * without worrying about the RTE being in an inconsistent state.
> +             */
> +            if ( curr.w2 != eu.w2 )
> +                __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> +            if ( curr.w1 != eu.w1 )
> +                __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +            return;
> +        }
> +
> +        if ( curr.w1 != eu.w1 && curr.w2 != eu.w2 && !eu.entry.mask )
> +        {
> +            /*
> +             * If updating both halves mask the entry while updating so
> +             * interrupts are not injected with an inconsistent RTE.
> +             */
> +            eu.entry.mask = 1;
> +            masked = false;
> +        }
> +
> +        if ( curr.w1 != eu.w1 )
> +            __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        if ( curr.w2 != eu.w2 )
> +            __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> +
> +        if ( !masked )
> +        {
> +            eu.entry.mask = 0;
> +            __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        }

For the write avoidance don't you want to hide differences in the
r/o delivery_status field, e.g. by setting curr's to eu's after
having read curr?

Jan

