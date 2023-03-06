Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF796ABD13
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506887.780097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8HS-00066r-5Q; Mon, 06 Mar 2023 10:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506887.780097; Mon, 06 Mar 2023 10:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ8HS-000645-2H; Mon, 06 Mar 2023 10:41:22 +0000
Received: by outflank-mailman (input) for mailman id 506887;
 Mon, 06 Mar 2023 10:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ8HQ-00063z-3R
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:41:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d03328c-bc0b-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 11:41:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 10:41:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 10:41:16 +0000
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
X-Inumbo-ID: 6d03328c-bc0b-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSMEdchod4W5ULfStavJoguauOS9mjV0CYX46WHIFOzQB8gqBlVLEOvdyiyO67+KRl8tWZ+BlNeSR6heMR2Gvn0ffzG7AZIi1oF/TCyt2dVDnxrauuweX1CPiXDsiBMCsoV2x6BeJWJo2/KM0rcqhQPy5V9v1pSMhSWUOUjlke1RSRiCMFXX6aE2051u8E0Jfbn+ElCOReE49NUPjGy5YOegYPOBrJkN8/auk525U3zjF6pETzoq5RpevMq54wVPdRHbOF5hWpJ5W+H+vN022kKEJphbsJ5fwzQ4RgKZOLO8JTez5rJZ51rOzVTuTDOddHw5TW/6UjDecGXKga/fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSHBS/m3inQc9WssuHBnydIzn+s7J9z7x1h0dFH4KjY=;
 b=ENMtnLLSt5pzDtjEyO9PUoFUEfY+HrzuFiNyoZgFZtHyACPCaoIHydo74URZyo5hCReZXXsRETQTNBlOBjdT0QXlMy24cCdWxBWEeOwaZms9sx04B7b+dzYK+p3BC9vSgA68mZY2UfQU8kWL/gbrqD1mALWLa20xewedFga+bk7POgukc4TRxxBlzzDnBvW1fUs1CO2D4hUScLHCbWH/G2cUp880k30qmHm3bC5Dxy/SqZYrBYRRPHpCSsbTHFDl7pdgMDOhEcwRdbAf+0K6/qPVm5Sl2qhYX5n9QkOiry61bx0PoKVqkw/aF88KXDkSdq66zxdaf8L+tUKgl45jTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSHBS/m3inQc9WssuHBnydIzn+s7J9z7x1h0dFH4KjY=;
 b=fTt8/1Ok2v5q6eZS9lHhaCQmKJl6LwE9yA9CgoDh65zQIv4aC8gakCqALcTcfA8K5BDJz7DlalcU67uEEnWOBOBO3dC8/S2RH3dACuIXthPSP2GDmrzesTncCfynkJfn6vc+2t8Vyn4y4NXcccdhqLuiRPWp14RkWeqm5liBtl8qCEpS3gh1eEJlE1kMWHTmUv+3bjufV5+C1ybXlUPgteu0xVXN+kTDQFpG34o4ehixzkR8diOgV/uZjs4Fx7rmQb6GB5QVVXeA0+yX7ksGXks2QMiMS5Ltb17jgwf9mq1Us0JplrSciDs0sL2j3+SLnNqiq0XHJc1Qm+dzass2Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c5bcb62-e8fd-1073-155e-da4f05772ad7@suse.com>
Date: Mon, 6 Mar 2023 11:41:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: f1eabcbe-10e8-4a20-cfc7-08db1e2f5066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4z+Ntp4GMM6j3756dPSTJgIkLhI0mPt4vbDqlDe7ZqGtPN5kX2hZA/wsvjcGp0JpXsEmdDWp14d4IuCcUycGkGTKCh9S50klLYuiirhwJ6wWQ4MJ9Hq//SibQuehFn23qqQS4N53d+ostxkD/uZURzbf6Ximom3airAo3CqsVmS/05QRcb9DJtTDwjM+tGq0DrGft3WNMEl/qVczwRw/+EJp7btTvrduN16wLf5gquU1YlqQgzQ5rn0WnCRow7tSBuij05IghNVpDi3WJPUbheyIYUsMfvTqVTQtiKYFdDNTC4+oNlt4+BarJIDDZd7HawmVJ626cJYUUjhqzBf6cSKafAxgOkrQHPV0AIfM9huL3p6zJecEr4t1icVfldDTvNpVsD5RneD6k7nvNtZGovNPeQ7VLZLCP/JUMHkNLLI2oZA+GF0F8d5ZLgcN6zUnse78NBSUvjk7JTeHIgncCHiI8EK+uzVl9YU8HJFJT4UFb3ZCRz849RmvfhztQYI7nriISKgQHRXzShbU2Q6xtu9ktWBQfHKYoqojJJkYpcEoqqxrbX7KzOOA5G0t/ZIL5+I+WIk4gZ5xcVKcc4H+g3sCdUv8rd88NfOo4S+X7xDcuUhvaJGnxoTA0YL3ZpO+2sCBBVmI7seBvA/t7MX0EzjfJ5pIut9rnALqsugEmrYw73bZhhplS5fG1o1ZnpF8AZZcHljDP91GH5CwaBvjp1JtumtXgNKTryGdzQ7wY13NBCQhb4FAKcPMUvoSaUbP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199018)(31686004)(54906003)(36756003)(6486002)(316002)(83380400001)(86362001)(31696002)(186003)(2906002)(5660300002)(66556008)(8936002)(6916009)(66946007)(41300700001)(66476007)(4326008)(8676002)(478600001)(53546011)(6512007)(6506007)(26005)(2616005)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHF5WTR0SVNzeU5jR1FqZ2hncGRIZE4xNmhRbVBqWVN2RXQ1QlUvRzYzejZt?=
 =?utf-8?B?eGVjRlRqZXZsVkFiQ2xnRTdMbTQwT0ZjYlA5WDR4azFpTnJBeG9ZYnBFTDYx?=
 =?utf-8?B?Wm9XZTByOXgzMGZGaXlBT1o4OFFhOElyUmxjWWJnellYSm5qSzl5T0JKY0Ny?=
 =?utf-8?B?VTBEUnQ5VVduSDlQT1ptdUxWbEZ5TndFM0pHYzdSRmlVNW9OL1FyZnVLUUpu?=
 =?utf-8?B?dkN2UXZTNCtYSVFHbnNGN2ZCSi9URFBvYzdmNkFNalRiWkFicjRpSUZyelBw?=
 =?utf-8?B?UVduQXo5Q0k1RmloNk1BTGlFeTNzdVNhcjNjOTQ3aHFyMVJnMk9CSVlNeFBw?=
 =?utf-8?B?RHcwVWZWSStTb1hQQXBhbFVvV0RMN2M5R0d1cHlFdlo3T3podThmTmx2ZzVn?=
 =?utf-8?B?aGg0TzYycUpLYzBnZlFoUzJpazBna0syWkJNcjI4OUltWC9PMm5ab3hqYmZR?=
 =?utf-8?B?NWhvRE13RFluY1kram5xZVBvU21xWGFlVnZPeFdvQVFOSUtWdXdtSjNFQnl2?=
 =?utf-8?B?RVFRQmdXOFhOVU1uSjNIWCsvQldVUVdwTzhjUERrdEx6YWRzdWR6US9USDZ1?=
 =?utf-8?B?S3BkWjNGdzhRNDRtSmh4Um5pUlBaSHAxWS8rVnlHbW1XazlIQy9BVU9JaEVL?=
 =?utf-8?B?cm9EOG9xVFY2YytSNkQrTWlXa2tmL0hBUTdhL2VjamV1UTFOT29GZUUxSk42?=
 =?utf-8?B?WEJSdWxZanJ4MmtuVFZWQmgrWUZUVXFsUjBmeFFXaThkYWRRNldZZVFCUk5o?=
 =?utf-8?B?cWRtNFRFaFJOYVRYbnhtK2p1WURxMVRBYnF0MUVpb0lBNTNhQS9lVTN1Z2Vl?=
 =?utf-8?B?VG1OYys3ZnpQR0RmOG9iT1o4S0RhTTFIRGlqOStDM05OV1BUSE5LbFl1VkV1?=
 =?utf-8?B?UmJ6UnhCbmZ3UlFud1JqZWxhYjZyM3liOENzN2JBVHd5OGlTbVVZN2N6aHl6?=
 =?utf-8?B?SU56NjBuNUNlbkFsWEZBQXFwN2daR1Zxc2xKSThYQzR5UUxPM0JNdTRKNFFF?=
 =?utf-8?B?V3phb2tJVzFDZ1liZ3E5UTZpV2svcmVhZ3NKa24yalI2eHFxWUJQWkd4UGRH?=
 =?utf-8?B?RTBGSlBtdVl0YXNzMDlWTkFWS3RYYjJvUFFRODZKQ0pwN1VBWUwrZExZdGV5?=
 =?utf-8?B?enJQVUpndzIyYVFCcDdqcktiaVB4UFNPSmplcEhEOTdoYmJIdGhRd3lXWGM0?=
 =?utf-8?B?TEFUTC9FRG9xSlVHOEV2cnN4LzlUSy9ybFlVS3BZUFR3WDVDU2F0aklPSkFj?=
 =?utf-8?B?U1FaSmxsWXZRNWRVU05YR0VkRjBiM2RHRFRpU2Erc2dxTnRudWoxNlVkNnNw?=
 =?utf-8?B?YXAvajFoRmxhbnh4NFJmaG1YUkhrZjY2Z3JGZlhSbzZ1cVhqUlVialVKYVBl?=
 =?utf-8?B?MmlMb2NUaGJLNHhybm5WM3Q5TWtFbVNKWmtROEpvYjRUTGJvRitBMmNVUkF1?=
 =?utf-8?B?WDFLbkFwaXlBT0JNR2dQTFBjMTdianNJVHdmSiszR3NBQ3lZQ3JvdjJTaGM3?=
 =?utf-8?B?SURjNnJFblhoM2pqVTdzbXUzSk0yR1VIN1FLYXlCdS9vOW5NUCtaVGZaRWpX?=
 =?utf-8?B?SjMzY296RDZWSHdwb05iYWZIMmdPMmtIeE1zbzNobUE0SThkRVVRVXl1UlJJ?=
 =?utf-8?B?c0QrMmRVVHNIbHZzVlBhcStjUjFqMDl6alF2YmtxUkNNVFByZ1JrUjBhWDVt?=
 =?utf-8?B?SDdXWXFYVm5vWDJ2ODAvQUxMa1FBR1YzZCtFZDdneHB4dWcrSkVBdWxkVmpL?=
 =?utf-8?B?OUpUTjR2M2pjY2s0aS82SGhtbm9Yb09HN3pGcmFSaTNMOU52ZytGZU1kdSs3?=
 =?utf-8?B?OWRrVHVLYUU4cS92VnFHY0VGNkpkenU4aHJEbFJ6TmF0ZXF2K2JBUkNaQnUy?=
 =?utf-8?B?RDRqam1PdmlrK01aVGhrUGovTmtjY0JUS2ZxcWFLYS9YSFZtMXdCbDB0V1pK?=
 =?utf-8?B?V0lUVW0wL1FDVU9pclMvMGJkRkFVVEw2ZjlrM3RMTGRrZGdHd0JqM1RTNFdr?=
 =?utf-8?B?OHhwdEtjSzV0Y2dWQ3pBQ1FKU05WaEV3OUo4bitoc0EwN296Nm52M2lBSkRi?=
 =?utf-8?B?T2ptMEgvcnB2ZmJIT1FCZ0JyNmRHMkRJNlhkMXI5OUdnZFF3cWJrbG1wWWlq?=
 =?utf-8?Q?EAATp+6oJjCoIG07HHbca5F7O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1eabcbe-10e8-4a20-cfc7-08db1e2f5066
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 10:41:16.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2KtwCTvTtXLsC2GgKH8h28ZZeEkitEfvcoAOodpIB6fQ29UQw+EQBZxUtadiAyS1VOv5DTNoA0AQv4y6BdDkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445

On 03.03.2023 11:38, Oleksii Kurochko wrote:
> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id = BUGFRAME_NR, lineno;
> +
> +    region = find_text_region(pc);
> +    if ( !region )
> +        return -EINVAL;
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        const struct bug_frame *b;
> +        size_t i;
> +
> +        for ( i = 0, b = region->frame[id].bugs;
> +                i < region->frame[id].n_bugs; b++, i++ )
> +        {
> +            if ( bug_loc(b) == pc )
> +            {
> +                bug = b;
> +                goto found;
> +            }
> +        }
> +    }
> +
> + found:
> +    if ( !bug )
> +        return -EINVAL;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +
> +        return id;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    if ( !is_kernel(filename) && !is_patch(filename) )
> +        return -EINVAL;
> +    fixup = strlen(filename);
> +    if ( fixup > 50 )
> +    {
> +        filename += fixup - 47;
> +        prefix = "...";
> +    }
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
> +        show_execution_state(regs);
> +
> +        return id;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
> +            return id;
> +
> +        show_execution_state(regs);
> +        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +        if ( !is_kernel(predicate) && !is_patch(predicate) )
> +            predicate = "<unknown>";
> +
> +        printk("Assertion '%s' failed at %s%s:%d\n",
> +               predicate, prefix, filename, lineno);
> +
> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
> +            return id;
> +
> +        show_execution_state(regs);
> +        panic("Assertion '%s' failed at %s%s:%d\n",
> +              predicate, prefix, filename, lineno);
> +    }
> +
> +    return id;
> +}

This final "return" looks like almost dead code (it isn't when an
unrecognized id is found). May I suggest to switch all "return id"
inside the switch() block to just "break", to make this final
"return" be (a) the central one and (b) more obviously a used path?

Jan

