Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0D2760B35
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 09:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569474.890269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCAp-0002Kf-2a; Tue, 25 Jul 2023 07:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569474.890269; Tue, 25 Jul 2023 07:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOCAo-0002Ix-Vx; Tue, 25 Jul 2023 07:09:34 +0000
Received: by outflank-mailman (input) for mailman id 569474;
 Tue, 25 Jul 2023 07:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOCAn-0002HV-WE
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 07:09:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346ab995-2aba-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 09:09:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 07:09:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:09:30 +0000
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
X-Inumbo-ID: 346ab995-2aba-11ee-b23d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e74A7WlMK4qafJbbXTzAe2iWm/C3yo3RS647JdM4+1mGMYyRlWsgCdw1jcxLX9v4Dt/8H+Y0TKL7nynXzRNOMOlN8BiICCDp9oxt3bVhQnHWcdCD62ZgiccjCjL4sboEjvZ9K2O5RQpqRxsAPB1raz7COaNKP4D5SeXnsfHErcg0Z2dwskckn2zfa3r8fF+LmaT+sOw9rY8XvQsj6HBsSpmrx94JaG07JFYve3J1qVZ7YxHDDQ52zl5UXAGuedSpNRN7Lwtf31aqQ586QGlSOuymxtf+FQbPLBPQ7JLGISMqN35BAZmigRJuD/CWO8/DlA5/14SXFFdeeo6UGUj7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LcsK9H3U5j/Fcjth15gu3w+D5a5BgpjUtmjawQXrog=;
 b=oAyL6IKAutQxtI8eIs0SYl4qwlP5oTMUPHfVT3Bke+LINJT8Zlfk2llGriYF+XPvDEWw6iLZrAipBzVWSwzIrO0g70dbTuDEk5tl+LeU7DeFRfBkSgfqPiUtHA4h79wtpvGMtLYU6h5LGTzcF1iz88Wjq3kk0ZNxHSj2ks7Mfv95uzYnl2Ub2V9VOrWCdC4A7uREVk3+TavJwm9tmHmrZGJa19bsJpMvlXD11BEjw7H5N+xrt6HXAQYmTCaBUoHsa1n957FnGsSjwBv3EHumPfVH8o24ixS+iUGb+XJQyjoPjQWzd5U9VzI0k/TV3PTPuStuaUHyvyHAqGUvoXBA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LcsK9H3U5j/Fcjth15gu3w+D5a5BgpjUtmjawQXrog=;
 b=fxCXfyVflfQZ/aFp6SFppbe5nHwDQ398jqpT9MnA4lNmice9eFrxZaM2aXfD5kye9uwuzuKsTsHRVaCClRF62GlMA8lhQgU+NQHpS/Q/lwRRJr4tYJiuZchH0XLH1f8JlpgwcV2rDUTL631fKbFvjZQrkhEDbaxgFIVvsvn/0z4c5sMHF34RZtqEVteEizOwZ6cmnFryYL7Qw5ZKHK9zFYTBvmaWBrFlOCgGfm4gWcUDout1NkuU1HUpNjXZA08PaVxkj7tntKf4svsxgS6pjmrXygHjyAPC3emInRfYmMOUWuo4gMXx54mti4TIfaPVmpDH4bWRoOjnvH2r9eYLUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
Date: Tue, 25 Jul 2023 09:09:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: ba60886a-3926-4856-61a5-08db8cde1738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sfrKJuQuH2HVnoY5JO+lGywLlvapANQ8q0rg7fzC8bpMLpd5dn6jQSLYDlL2qDhvLsthpOPc38fHek8Upi1IepmsJpo8oUGC5k1f7xxsEeQ3a9gjjYYTuDHvUNhgCaaDJgoM+ibelial4n3gjcWCnLwPAedm+AwrJdRO/wzZlK3zKk5mRTB0dFAhDXBLe/uBbLyXNA41I/RGb4vnT3C/PH0iIZ7Xrk76VaXNUg5MXc0Cjgd93cmtJMl98vQf4oZzcuZRTNPXcpsf3guFmsyP511ar0qg96TYa0EpXevjrTqzg9SYARKQZP6yiSKeWqUDNxzBR3aLIw1ueu1rAJhWrsJ+lnPAAQ2HILHHZe7Azk2ixWRmlbi2wjBoLwbmk6mH2uXdMwIAd9iriRpGYxbSOndLaO8sQgzu8EL3OkJuQEhvQg7+TxnFA8Lwzp8LflRhtATlNviszcCnh5qewMXN8HpDbr7SLj86ov2Btq0OzO3Wuof0kah2EtO61wRMdwCL5S5HPpSDJ2UBnL/MombZXDwqC+lzi1chnB/NkjJgTRMCpGV52oRyRwr6dzTAw+dIaxwPo6FSH90/cny+1cgYkxa0GhGz+gsaXLWfpUr1gBjc2MjLT1iDxEbezQrWCsPqw4488HI3EPjsCmueFrh+bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(54906003)(66946007)(66556008)(66476007)(2616005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(478600001)(110136005)(6486002)(6512007)(53546011)(26005)(186003)(6506007)(31686004)(41300700001)(5660300002)(316002)(2906002)(4744005)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sisva0JNU0JQR0ZXN20vM0Z4TGx0QXdIbXd2L1VDcWxDQWUxdG1QaXd3emtI?=
 =?utf-8?B?bkU1WmNjSFM4Tm84M1YvVlNTL2x2QTE5ZHJqRVVTMnlJN2EweG9TaDJQNUJO?=
 =?utf-8?B?YlFwMzZ5K0Z3ZVVUMlJGSU9uYy9jUmlJSC9od3gwRDlBcS9lSlRIc1JpRVAw?=
 =?utf-8?B?K3NKdEs3M3YyMElsSUNTOSt6QU1mQUQwREVyaVJRUVczdm1IODVoL2ZUdW1l?=
 =?utf-8?B?cGZNM1hlWE54dmVvMk1KZmtaR2E3SWtQZGNSdU0zdktuYXpDM1N6bGNYUGdH?=
 =?utf-8?B?WURpSnFUWXprYVQ1czhxSE92YVVMMXU0N2pLaXVMRmdnWGZ4bnhob2diR3FY?=
 =?utf-8?B?RHlONnJWSEFWTjBuSFdSaXlaMjRIbUVVdnc2OFFyWWtrS0RudHBFZW1GS1Zm?=
 =?utf-8?B?b2FuenVZaTZoY2lMOVQ2SDFSVk9KUXE5Nk42Vy94ZmRta2NwSWsvaEhBak9V?=
 =?utf-8?B?UjkzTktsR2tXWmhzRmwra3BLS2N3UVJITlRlZ2NaK2cyZ3NhbGxuVjVLT2dQ?=
 =?utf-8?B?YzAzcVRIc3M1Y3FMcS9LMmVadWduWkQwRkdzMlkydmNNTWFUNUtsZzQxT05h?=
 =?utf-8?B?ay9ubUZ3WllqYlVNdy94U2k4NEk4L1pOVFhOVlBRaStPVlpDUDRxOXFNMW1R?=
 =?utf-8?B?UDFNYlIxbUIzR3Z5RFVIdjNTZzVhNzh5NVVOb2krTllkSVBKWGVvYkZJcFlx?=
 =?utf-8?B?TDMyci9oTXg0L0QvVHYvazJ0VTB4allzKzhPOTVJeHkrcWhNdVROTGh0NXZj?=
 =?utf-8?B?MzBCYXBLa3FpdEtKU2hWbW5LRTVhQ05kMGVzbCtDSFVRL1F1eUZqdlhrdGVJ?=
 =?utf-8?B?OC9DNDJvQ0djY3pKOTlNbFVQSmt4VHJ4SC9jRGNnb2JHZzlBUWNXZlZDTWxv?=
 =?utf-8?B?MU14L1gxYW42bzRHTllockx3bWNhcm00L1pFVjEwRlJQMlBVQklWbHZhayti?=
 =?utf-8?B?eUlMYUd3ZkVscUk1dGFxRllnOVhSK210bkE5cU1YdjNYWXh0emI0T0Fla1ZF?=
 =?utf-8?B?UW5KdTlVRDV1cFZ0WFd6MTlWMi9vWHEwVkhDMXpCYnJJYWpnREpOL1M0bGtG?=
 =?utf-8?B?Q2RtTG9OMExWL1pKV1VSeHJqd1JSOGM2aXlPaGpBYnd3V25mdExVMklCS1VV?=
 =?utf-8?B?azArOTR6RXg3YTJKVXNyNG42WVpQV1NHd0thclczQUdDZmJqVlRlTng4aVJD?=
 =?utf-8?B?UnJFT2ZMYXZ3SDl6RUhqRGM2WHYzMW1tU0c0U3FZanhKVzFhTFVYVE90V0Y5?=
 =?utf-8?B?S25aNGxWbW8yemV4T1BkaERDQ2phSmpqN08yM08xYm5sMFF0ak5HQ3dBaHZV?=
 =?utf-8?B?RG95T1hsZ0hjQ0Y3NW5ibmlpSnN5QmwxL3Y5WHVQcTQrYkpDeGl4NCt1d2wx?=
 =?utf-8?B?SzJUblNrczJyZDIvYy9pTWlTYzc0aXZtSEhidC9rR1VMVnhSaG1rS09XK3V2?=
 =?utf-8?B?Ri84Y0RrbmdUcUJNb1p0WkVBT3YybHlsMDh6K290SXpDZnYyTTZJTlB6Q01t?=
 =?utf-8?B?RjdiMVdjM1VxUkY4cnNESXcvaGFrSWxpV0c0ZkdzZURDbWRpQ0I1emFpd2Q4?=
 =?utf-8?B?bmMwTGxOTzFIbkc3RjU3UVYzQ1Q4elhCUXllak5CbERuaGEwUWh3SnllYTla?=
 =?utf-8?B?b2VjSlM0c0NKajY5eFRWdXZ2eWRHSkpFME5DWUtGV29td1VaZGViK1MrUTYz?=
 =?utf-8?B?eDlna1Z5QmZweERZb1hKSXd4bWsrYmIyVk1hc0hlNjNyaE00aUxqSFVRNE4z?=
 =?utf-8?B?K0FkUW9OT3ZJVGt1YVNmQTU2QzJ1alZyQUR4dzMxVjJIVS8wNHF0MnVqUEhK?=
 =?utf-8?B?N0x3ekxkMG9qQ1U3bEZqRW5mNWxOdGVDOWVELzFROUFwUUxBa2kxbzVoS1pa?=
 =?utf-8?B?REdLeCtvNXhVVDJrSGo3ZHVrSG9adU9HM3M5b1FiUWdubTNVU2dheTNLc1M5?=
 =?utf-8?B?WURYWk5BL2tKaHV5TEZ5UEtaSzAwNTl5QkZYVndiNGIxTGRoK0NVblQ1Nm1a?=
 =?utf-8?B?NytTeTRrRUFOcXowL0JaMlduSHNGVnFFQktLdXVrK2IzNkVGQ1ZhMVVlVSs1?=
 =?utf-8?B?eHdCc0I1WEk5aFhMNmU3N0tVSUFSZGxtc3ltMk5jb2VSak41Z2hqWkoxUEFS?=
 =?utf-8?Q?vH3HlD9KXGWdm724JoCfwzUao?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba60886a-3926-4856-61a5-08db8cde1738
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 07:09:30.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSpOHcxFlbGsjvVE4w/775wp92wXkiMRWas3L1vbYnyTWkGnkVE+jcS+fs/r/h/exMxaicQsiK/OR5gOhV+KYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978

On 24.07.2023 19:50, Federico Serafini wrote:
> @@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
>  }
>  
>  int request_irq(unsigned int irq, unsigned int irqflags,
> -                void (*handler)(int, void *, struct cpu_user_regs *),
> +                void (*handler)(int irq, void *dev_id,
> +                                struct cpu_user_regs *regs),
>                  const char *devname, void *dev_id)
>  {

Before we accept patches, don't we need to first settle on whether to
apply the rule(s) also to function type declarations (and not just
ordinary prototypes)?

Jan

