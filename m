Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3C77B926
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 14:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583641.913897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXAG-0005Du-NU; Mon, 14 Aug 2023 12:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583641.913897; Mon, 14 Aug 2023 12:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXAG-0005Bo-Jv; Mon, 14 Aug 2023 12:59:20 +0000
Received: by outflank-mailman (input) for mailman id 583641;
 Mon, 14 Aug 2023 12:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVXAE-00055k-Qw
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 12:59:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604e14e1-3aa2-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 14:59:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8761.eurprd04.prod.outlook.com (2603:10a6:20b:408::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 12:59:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 12:59:14 +0000
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
X-Inumbo-ID: 604e14e1-3aa2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgWPFEoalhEfdTZpN6iFvYQsX+gbp4rMGa+HXy7KUyfzvXZLzVZ+mgW64SBjqxg57NKtiyG01iWW6Izj6HvIMwwGPF/ddT7IcW3u8M+tvJsoNb7bqyK80io99nO3Ae0gl8G0TH3YwajX54F66ZfJNghYbOpUExJF/T/XT0d+UjQh9Jrd7RizzzXfnvMdpOZPn28jh8dO8DMZkgnAIEEPhH0TiJPSwIU1FvPOLi+j2HfkC3dJHEA1d0YzdaBv94hZIhJDQDjcQS/DiYSwjM6SVjb8Lw/PcfG92lRv+I4o2miIAyvNLnRAA6eZ45w5urD3qy6+U7cjbU3pyhQbqe7Cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL5M+67szkAI50psuf7sHfXI6Vjlas0Sktn2Wb5LWqo=;
 b=UpvLM/KCHRPFtK9t1bY9UJWHYekqphbertpEd5HPTp0hzKm7lVg0vETvTZH3DpHSPpI8tKaLa6gwQcWAx9ycA5KxJONerbPTy8x727F4Nac98xA2hTx9AfBuKDp7SWdfH1/o88fiUhf1N+4GDPfvhNVQlH1zS0V1ONPmAiFECVr6/NctAM514EKB/h8PKEnR4va8OOPea/qVWfnrW+Y6QZ4kV+NyrW4ZGiZMdRNF7FYF/VKDzrkHfGZUNRM3+IcKc0T1QPmgkvLZRmD+OoTQq9f9Z1WtNKJcD1JEf8GIeJCONm1lGMfyS9DaTvmZ5Thmpy2mRebruHOh/W+gHUjzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL5M+67szkAI50psuf7sHfXI6Vjlas0Sktn2Wb5LWqo=;
 b=QQn9xaO3Fgbsk0nGAU0o5JFma0CSDE03sGLhfwY8QMjG13CRHXM2Qb977RLypN+sziNvD2h5Usj9ce15M8nTtVClJn07fxDC6fKmscK3elc5IbTs5j4eNIJn6c0PZFB379mmqO+CPCbj1oZzQJ/eJ/8FhBQOKj7yiB1tYoIUXfgTla39G4VFMXREsF4p2pAfw4AN37tGvO0KPu2QKvERodQR7+w+ZHAjHsel1pVaJqBC29C2I6CY0P4+pYuFwmcmcFE5BFFrSgpAKWAwqMpE5r81EAXl7nThJu39twY2K92D2nfWEkdVcVe+WXeQN9QgR/EMbfjevDSeCzmB4EcLbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3888e6c1-6e8e-59ca-eaa5-13032a2d3644@suse.com>
Date: Mon, 14 Aug 2023 14:59:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 5/6] xen/riscv: implement do_bug_frame()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
 <bb1ebda319fc6f74456306a4051dd6da721bb797.1691763757.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb1ebda319fc6f74456306a4051dd6da721bb797.1691763757.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: f13f2ab8-1749-418c-fd3b-08db9cc642b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qTist/cf+OVUmIvqLKKypyG6xRLK+KlN3Rw7Thd3UdkwA5mPkDz9In+9mxfjAowznf7WspqC7kXJF5heDtSL4HV4ztAuQTKlNVJED7dcYbPjKh2OBx+toUxSbqQSgnbuUR4hS1toSI5di8XSE5t/mtPuertdxyrsXIXzeP1ebQ1V7rO5yAPAph0sjfZdnE2N8LKsS075s/WPNgCoD1zZlVPFNGrkNEQvkp0e1VXKsQ/+blVi+2f2WvdURluJbQOPg0sWn9lQFcnG1fHDmUKtj5dIqw4OibqAq7JAi4/tutKiqIMec5rdu/iMMuAhGzdZ79IiXwIhQA0UYF1remq4r+viDDgSo6ZW32KM7guzs1rW/dCzY/nTXvqOp4cFxKOYT5XS8rCdsQVFiblRG+F8vmRtMtN5esBzi38I6Ugpz3ZmoCBFaxzIb3/trOZZx6JBpT7HwEbOGW0jM0y/0XxIazfuTml0Ul9zeFikQREFiW/EmlTp4cEiNeBdvJ07X7XG4t6BlsD8sIhozsS86UsEfwCGQ3Ehj1wBGXWhPjRsrRSWGcZ4p/VxgHr1EUkfHp/Upd160EgX0FOtLYjDr50+9itVJKEsxjGOWVqiovOzTVT/mTFvCz+VuSoxaeKAQL/qqv8ET6lDx2skyq3uMyydMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(186006)(1800799006)(36756003)(5660300002)(86362001)(2906002)(31696002)(31686004)(83380400001)(66556008)(6916009)(4326008)(316002)(66946007)(66476007)(54906003)(38100700002)(41300700001)(26005)(6512007)(2616005)(53546011)(6486002)(6506007)(8936002)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTk2NFdPbko1VEd1MDBqQTUyUkMxYXhwbEUzN2FOSW12ZFhmeTFQYS9Ca3F0?=
 =?utf-8?B?azcvU1loajBLVTh6Njdjd2F3dkQ5YitNNVM5Umk0a2VZaE5JV0svT1h5cG1s?=
 =?utf-8?B?akZXZGNoNTdTNFBiMjJFSWl6SENtOEZpMCtYa245L3hCSjZxaVdlVU9FVnpF?=
 =?utf-8?B?enhweHVDbW12Zlh4REs0VTAzR3lHbVhaNFg0OG9zNjFtZklsd3h5OWZqcENE?=
 =?utf-8?B?c1VOMlA2em1JNVZRYytwUlJQbjhpRk05TmpkREI5Q1ZsZ3BleHZOMXJuSktK?=
 =?utf-8?B?a1NiRWIwL2lhT20waDU0eVdlaHhnQkQrKyswL0llRlpUbTM4NnFYRjFwQzlh?=
 =?utf-8?B?Z0RabTdsb0hOdU5WRDNCTnpDN0tkN2VZVVdLUlpsdEJOQTdvRlJNQVNiTUhp?=
 =?utf-8?B?dWJNcS9ST3R3T1Z1WkxGUHpxZXZpRStwTlY5cUc4N1ZnZC9iRW5TZVlVWkpU?=
 =?utf-8?B?aUZ6c0dONnh5NnJCaThiVnpDaHhIWVVOcHAwMndqbWhlOThuZ1A0OHprUWZZ?=
 =?utf-8?B?aC9MMGgzbTlWZVRyMVh5WFlkMUlKTUxIMUxjanJ0alIrSzZxOEVFSTVUQ244?=
 =?utf-8?B?ZFUrT3lxMEVSbEtldjV0L0ZPOURzYklObjdRQlY2enZ6Zjd4c1dvY3FteEVH?=
 =?utf-8?B?cy9FNEN0Qks2STlhTTEzZ2dYZlJpMGFpZUh2Y2cxMS82QS9HNU9Pa2E5UUpQ?=
 =?utf-8?B?aTFoVnF2VUlncU4ranU2dEhnSDc0T3F1NWlqVDBZdTFQWlplQndHYzg2c1hC?=
 =?utf-8?B?VWdRNHZZR1F4V3cwS3FnOS9NOEFvdDI1RVdJVVgyYVYxbG01QURheEg2MGE2?=
 =?utf-8?B?QVIxcUpCQ3B3K1hiTjhHYWtQQ2VLa2sxWnBMdWQ5VVNXbjBtakxmd1A2ZlA2?=
 =?utf-8?B?d3N1bjlsb2Rrd0I0RnhZWVI2NS9SVFVYa2VPQ1lHYnQzNFFoZnc3WEZjUmdj?=
 =?utf-8?B?SG9oV2RkOEIxNkdoWGpQZnlCNE1yMURRWU1kMG0wdUVETlJpaWJuME5qUFJl?=
 =?utf-8?B?OTU3TnlyUy9yZnJTQ3UzTGZMTDFjYStkK3NKZnZpS2J6a1RhYzFXdDZXMnR0?=
 =?utf-8?B?d09VWmNWbE1CbDMzL0ZQdURYelp2Y1VMYnp6aFRrT0Fkd0JJYmtsUWxoMjM0?=
 =?utf-8?B?ZzRQU0JXTmxxUVFMZXBHL1Q5ejFwZXdEUW1WOGpkVlMvUXR3UjNsSUJBRnI3?=
 =?utf-8?B?Wm5DTklZVFhpeldwKzdxajh0WHJuaTJJQ2xnMS80bHlVcnhhUG9yQWxBV2Nu?=
 =?utf-8?B?TFIyeFpTN21hTU1sYjg4UEdBclBqd0R0UGVvUjVlVHdqRVVUMmFjdVhOZElU?=
 =?utf-8?B?ZWI5T2U5TXRlOFBCT2x0MFRST0I4NkxRdW02VXpoTXZTb05HeGpSaGhOempV?=
 =?utf-8?B?eEgvdlMzNHFKTGYvSnhnYVBtcWZpTkxOeVp2bzBTemp0UDJIRUVLSWk4OGNv?=
 =?utf-8?B?c0FyOE5hOThpRnVjWGFLT3VQbEZPS1BrRE90QStabUlmNnlEdFRJenU0Z2VW?=
 =?utf-8?B?bHJPZjVKWnlUWlNNMTNTQXNFeGJ0aHY1alhvZ0UvY1hWUmxYY1VrMmVnSElV?=
 =?utf-8?B?M2ZCcWhncmw2RTd1TFRwbXVUSWpTMTc2OWRaZTRENUFNSWNLZVNiVTA2aVR3?=
 =?utf-8?B?ZzJYVjJvYlBIUDljMEl2ZG1PRXZlcWhyaktEZWE4R2kxV3RlL0lKV2xaaHBs?=
 =?utf-8?B?bEl1QUo4MitEZUQrT3ZJNGQ5QUxSNXpxZ0xyYTE2QzgwMzdrTDlNUEZkczZO?=
 =?utf-8?B?ejN0eXFDZmZ2VWpidTcxL3k1dStQc01NOGZMSXl1THZIUG1rNlVGdlZzTWRw?=
 =?utf-8?B?WFBOZTViK083TWFZUHo3VytCbzBuWWtsWDhzUmtndWZrS0kvWFVpZWh6akRx?=
 =?utf-8?B?OGFtUjQ4MlgvZXhNUkxGcVE3TGQxOHNaR1pYZWhuVmkrS2RPTEI4YnlMRENw?=
 =?utf-8?B?d1Zza3ZUMkJDYVNhNXg3UnA4YWRvVVdKM1ArdHZ2MEFMMWZ4em9QaWplY0dK?=
 =?utf-8?B?cXIrRjliWnRGQ2dPd1JTUlh6ZXoxMDBuNUNTNy93UkVzYldMdU5XWlZ1K21K?=
 =?utf-8?B?TmRSU3lpMkFBbHRvZDBxSWpPbXEvREdobmdGMGdVZmIreEN2L01ySXhZWi8w?=
 =?utf-8?Q?XrMJKJ/1icwQOdVdcKtMRgdlF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f2ab8-1749-418c-fd3b-08db9cc642b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:59:14.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxZkrZ3yPA2zP2Sc6LnI5brKoHJAQKXZ2Wvez87LEJm4qrcQgo9SJgLvAoRjFWSU1hW1P7pfKBfxVx94IJHPbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8761

On 11.08.2023 16:32, Oleksii Kurochko wrote:
> The patch introduces the temporary implementation of do_bug_frame().
> When common code is merged, CONFIG_GENERIC_BUG_FRAME should
> be used instead.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V8:
>   - remove Pointless initializer of id.
>   - make bug_frames[] array constant.
>   - remove cast_to_bug_frame(addr).
>   - rename is_valig_bugaddr to is_valid_bug_insn().
>   - add check that read_instr is used only on xen code
>   - update the commit message.

Looks largely okay to me now, yet still a couple of remarks / suggestions:

> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> +{
> +    const struct bug_frame *start, *end;
> +    const struct bug_frame *bug = NULL;
> +    unsigned int id;
> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    static const struct bug_frame * const bug_frames[] = {
> +        &__start_bug_frames[0],
> +        &__stop_bug_frames_0[0],
> +        &__stop_bug_frames_1[0],
> +        &__stop_bug_frames_2[0],
> +        &__stop_bug_frames_3[0],
> +    };
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        start = bug_frames[id];
> +        end   = bug_frames[id + 1];
> +
> +        while ( start != end )
> +        {
> +            if ( (vaddr_t)bug_loc(start) == pc )
> +            {
> +                bug = start;
> +                goto found;
> +            }
> +
> +            start++;
> +        }
> +    }
> +
> + found:
> +    if ( bug == NULL )
> +        return -ENOENT;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +
> +        goto end;

I'd like to suggest that you avoid "goto" when at the label there's just
a single, simple statement (like return in the case here).

> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s:%d\n", filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        goto end;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s:%d\n", filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();

The log message here ...

> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +
> +        printk("Assertion %s failed at %s:%d\n", predicate, filename, lineno);
> +
> +        show_execution_state(regs);
> +
> +        printk("change wait_for_interrupt to panic() when common is available\n");
> +        die();

... and here doesn't really fit with the following code. There's no
wait_for_interrupt() in sight.

> +    }
> +
> +    return -EINVAL;
> +
> + end:
> +    return 0;
> +}
> +
> +static bool is_valid_bug_insn(uint32_t insn)
> +{
> +    return insn == BUG_INSN_32 ||
> +           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
> +}
> +
> +/* There are no guests for now so  the func has to return alwasys false */
> +static inline bool guest_mode(void)
> +{
> +    return false;
> +}

I think this makes little sense to have, and ...

> +/* Should be used only on Xen code */

... just the comment is good enough. First and foremost I don't think
a function with name and purpose of the above can get away without
any parameters. Furthermore, as said before, ...

> +static uint32_t read_instr(unsigned long pc)
> +{
> +    uint16_t instr16 = *(uint16_t *)pc;

... such casting can't be legitimate for guest addresses anyway; you
would need to map guest memory instead. What you might do ...

> +    if ( guest_mode() )
> +    {
> +        printk("%s should be called only on Xen code\n", __func__);
> +        die();
> +    }

... instead of this, as some minimalistic checking, is

    ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1));

> +    if ( GET_INSN_LENGTH(instr16) == 2 )
> +        return instr16;
> +    else
> +        return *(uint32_t *)pc;

and then

    if ( GET_INSN_LENGTH(instr16) == 2 )
        return instr16;

    ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext(pc + 3));

    return *(uint32_t *)pc;

Yet then again asserting in exception handlers is of limited use
only, as then you risk recursive exceptions.

>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = read_instr(pc);
> +
> +    if ( is_valid_bug_insn(instr) )
> +    {
> +        if ( !do_bug_frame(cpu_regs, pc) )

Two if()-s like these typically want folding into one.

Jan

