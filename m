Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F094A6B0CE2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:34:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508087.782362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvnN-0002it-3p; Wed, 08 Mar 2023 15:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508087.782362; Wed, 08 Mar 2023 15:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvnN-0002gA-0R; Wed, 08 Mar 2023 15:33:37 +0000
Received: by outflank-mailman (input) for mailman id 508087;
 Wed, 08 Mar 2023 15:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZvnL-0002g2-Qz
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:33:35 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95b0e5c4-bdc6-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 16:33:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 15:33:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 15:33:31 +0000
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
X-Inumbo-ID: 95b0e5c4-bdc6-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkVlGKdiG+iomTuSe/I0CaEdkk3ngOSLeoy+1nCXLchLnYrEfDo9k59rG77oTHS+hWNsik9n/HNxJjcRlVz2JomrdwuS3MgDZ2etDkrVyhjLk7IaR5Ct2mOt2CU4PKGFSaxImRN23zH9utJ5zqAQV5AEQfcEyQcqHPboM8j1PBs+2EF/2I2DMwZCwHv6F0aNs5ZYqFDD346Kb3sXEfgQbtKDexCAC3dzlqSX9b2Itcvw/DX1a5LPf6s8iopLxFozpWmbpgI7LW9ECc02NnJv8NsVEy91+1ga6bNosgjrWL7U9JE7JqKkVUHAgAEdBilPy1KkeX5ZxFTaLPyMHER0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbTH5ihj9fE82nYPxXaOPTdgIc408R/VMWPSRt+vudY=;
 b=e+Sh5RNmHST95GZo0o4XqdG+TPag1lwr2boj3T3p3m4aGNp22KzqcOX9FAGe3VLgEnzVX52o78bX9y6VOqnF53VHSjPadXu26XH8qw9H3XYEH19lUVwI41EN+BtPA+Eui96+JDV7SJkgcm6My647Hc1qmWbjAMwMG3AHzocPqKporIhZb7mHNrI+mrqix8GKpawun64XkfDPslulobzDvdkcaozWzRORYPy/aDZ9duDZsrFpqdwQpPMOLO8MaUrErypxzwNzxq9RAe1xLvoQrXBXe0hr60mpct+ty/n0d752W55AkbXnjbxCmmI3/0AseNpSCbkRPvlNcQ3/gp5aGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbTH5ihj9fE82nYPxXaOPTdgIc408R/VMWPSRt+vudY=;
 b=HHdRskstv0qe69UJQJAb60Ok3YXvCp+f5YgRo5D0TnmZmgxgEFFgo7TTqHB/kZiao57CA3Ic26VNsJ1Sq0qLbB/Av/WIC0leJNrEF9CCQQIuWuuxvn1nFKt0KfuINlsTY3n5Kcc5hGW+CXKuy2EcjYqxigiroKBfLlTRnneCXZxPBTGVRx6TdGr35r14k820M6JdzqEClG0OWeNqMOe7skszZdsH2vLBOkV+k9ZHbWgqyRPayhm6SZN8rztsrayyHmyt1bwlJ2sR/7632k+PO3SXtYLEb7OrpednkYLmn3rAvUoue9tJVALPw8YsxaD/VRmEQpzbrm2HsJUveT3lrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa8cf64e-e5b1-6c13-7b30-e409a0460e3c@suse.com>
Date: Wed, 8 Mar 2023 16:33:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
 <abf50a37913608c3403c6e7e56c9fdba6f3ef643.1678202233.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <abf50a37913608c3403c6e7e56c9fdba6f3ef643.1678202233.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 96963738-e4d5-47ce-427a-08db1fea7905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSKxGTolIJMzkyruJ8/QbLmdpFsGDc6HPEvBkQBN+YP44LkGuqAmhmvYFgGPSlbMVyu08zzJZ17AEMp8VBqtOSqqC/umDJZ/FiOhc1W7vsnT2HrbrkmtYa9hIkM9C9TRGKrW8Iu2LTdtuh1yBJl/4uLYnH+Vd31C+FJ7Or4W9/No91452K2Dq/nujlYtDEQXZjU9uvchC+Ap5uhW+RwVFMVKFxLiZR9q8Ceohx0iOY7GVdXzxWIKI4xwlX3YIUUrqe2Yu81w/B9jf5e2IIyLwRnBvSEzWVSHX1j5l29+2ViRscc5Ccw9DsdMAuMmgwUJZewW0DvM7rHdHurVkuPJf2PAV4usDbRwoL/68xmu9mmfTfJdEpF9wfWmyqWH6FKzv3HQKRCMGC4Q5k9EAPIg8/BeTpoY2WrABZqK6+5wnbwjjWtzKFsBeEomT+7CrivZITJVYrFzqV9BjRmRyfwEZO3Jkg+mYuQylIcy/NzHW2gIShogFw1eJajPfn1l1q1Pm5NLw3rw4kJvZv7C3Z/F1QRCMi+sxHTK5vj3okMd5crQNPudUfR8MXQdFoGJE0PZB3eIlPFKf0YNuDA9WctLvetoMeF9CPQgT1R/AB+gS2bajOkglThWo6avz3RbYt7X9YyOOHKieUKhqyWPvIrGtBtcwMWzxrPcst3lQPelgWKuEzhi0tmf7jVHzvsWuEsUqc8KgExTo0XoRPHmnmRrDsXl4S1+cFBQZzp7KsHR/PnotbXvVAX1iTaS8PcCXBeR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199018)(31696002)(6916009)(8676002)(66556008)(4326008)(66476007)(66946007)(83380400001)(186003)(86362001)(36756003)(38100700002)(316002)(478600001)(53546011)(6506007)(2616005)(26005)(6512007)(54906003)(6486002)(2906002)(8936002)(5660300002)(31686004)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZYRnZUL3ljUGo4RThZRHFoNDArWTdRM0J4R2dzQTduYk1Rdk9LYVBNZEE4?=
 =?utf-8?B?TkFLa3JlOExvTDI3b29heituYS9xVEpCS1ZzMVZaQTZneG14djZaSHhndGNM?=
 =?utf-8?B?VUZqU2pHRFZ4ZFNRbUR6S3EzZ3RCTjVzMFNPNFBvZXpmZWxkaW5yWW9VQ3NI?=
 =?utf-8?B?QmQyREFYZkszWEZ1Ym1HOGVKM0lUb055WXNTQ2MrSXdmTVpGRlJYZzN4SWRq?=
 =?utf-8?B?cnhFemNMdDNzSHdpeDZMTnlsVzI0Nmx2MnhOakg5SE1oZmVQYjUyU21PY2sr?=
 =?utf-8?B?VlhocXNPU3lLWnN1VXlFcHB0MGtEd1JpU3d1WkJiM05xOVFaL09BcEJSaG9s?=
 =?utf-8?B?dTByQ0E4Q0pZVTFkQ2gwemhpaS9nVFlRNEQycDc0RzQwV1hBRlF6eFNYd2l0?=
 =?utf-8?B?TmJlUngvQTdiTmMrSG5YaVFOZEtYUytodURmWVJZWFEyL0ZyQnNQV05ZRlJM?=
 =?utf-8?B?ZGtsRXREblNJb1dGekdyOTFtcXk1b0J3aW1sU1dXSm05SHorVVJjOTZqdUIx?=
 =?utf-8?B?anpGT2VpOC85UzljWER4Mm1oSTlPMjdIVjljQ0J4RiswTUF0czY4NG9FNG5r?=
 =?utf-8?B?TkN2VTcrNmhUVXhiSGl6ZTRGVGdFdlM5WEVIQWgxOXpMWVpKazE1NWZRdDJs?=
 =?utf-8?B?K3A5VHhSYVNnN2FoU0g4cUJ4bHh4NkEvYmhtTXd6dkprSm9jYU1jcTg0allj?=
 =?utf-8?B?QXgva0doZmUvV1o4TXEyL2I3aGxZRWMzNm5xb3dNSCtaNVJwTFl5bkFSQVEx?=
 =?utf-8?B?REFWNXdiRElYWW1VRkNib3U5Z1BzUjZtd1E3K21MMWJqRVZBTXBYdlhrK1I4?=
 =?utf-8?B?M0VGSzMvV2tRYXpTcWozdUNyakl6c0tyS3FRQS9LUHpONHA4SmoyTERuNnoy?=
 =?utf-8?B?TmZ4Sm1HRmhhZ0ZWSG9pM25ESkt0OUtUazBxbEF4VXJQSklZRkFPZFdrcWRm?=
 =?utf-8?B?NUJVM3lsSWJGV1JRMlRuNFFyREFIT0grSkNSL1JmQ1VES0RXVk9jVXgzMjkx?=
 =?utf-8?B?Um10c1kzRmtyc29QT2ZZVHdsNE5hTHVYZi9TMWJkb3llWG5PUXdodGh2WTBJ?=
 =?utf-8?B?b0p1WUVJR0lvOTk2ZHdHZ01udCtvemZYVWJrY2FnUHM2aTRSRHROQytTVzFi?=
 =?utf-8?B?aDkrWldEY3Fva085VDlyMDJrL3hYT1drM3lROEJSQU1jK2ZGV3c2R3kvclhS?=
 =?utf-8?B?U3dlQlQ1dE9BajM3UDI3Q1B0WjdIeG1oUlBpNWVIWTZJMlNsbUZna0FqNko3?=
 =?utf-8?B?Q1hyd3dJcjNoTkllc1VRa1FrSERUZ0NldThRQk1YS1NvK0N3aW9LTmZwaUE1?=
 =?utf-8?B?MjRCTG1vRGJNYUJGUHRCTFlyYWlYeXpheEtaRTc3K25JVE1FcCtNZzJzbVps?=
 =?utf-8?B?MTJRRE90SXZEY25SZHVlc2EwMkFKcno5QVV6ZHpzNklpclhWYWVoRWNNQ0tX?=
 =?utf-8?B?aTl5NlJwK3VWT2lCRXFGOEJ4aEFmRERUSVVOOTFzdXkvQnl2Vm9LK1pZRVZn?=
 =?utf-8?B?MG5oWVo3T3FIOXVmZ1RXMXEzeVBmUERYYURYeVNkbFRxWXYvWVVRU2NpMTE0?=
 =?utf-8?B?TTBaVHV4c2pNd28vMzVRN0dFekZmYld5OFpEdXcwU1I3M0ZTN0ROVU9YcFds?=
 =?utf-8?B?dTJMNmJHdWYrR3VGMEJ3RmFPYmkxU1p3eThhNmdWWXE5QmUvVjloMzhwYWcv?=
 =?utf-8?B?TnJNZnRTVlhRQ2V6WUl2dy8zbFdFYVBwb0Q1b2QxSnJncUZ0M1d4eDRFeldu?=
 =?utf-8?B?TXJEb0dlN2gvbDRHNzNFVFlKdy9GWGhEZzVacmIzaFBnZlZKV0l4Ykp3bzV4?=
 =?utf-8?B?NDJvY2ViQ3owUnpoNVZIS0pWdkZaOGtQWGhIZGhBOU4wSUt5Z0xFSnN1d0Rx?=
 =?utf-8?B?RWM4UGg0eWZ3SHFQWm8xYndCWmRNUkZMLy9oMU1rSHFYZHM3NEdVMHpNSFRt?=
 =?utf-8?B?aFZ1dXdKakwyOHhVSkNLZDc3SU1FRnRQMmJvTEZ6cDFEQTllL1dDakJFa2tz?=
 =?utf-8?B?ZW8vTENUb2xTVm9icnptS20wOFd1SExiWGMxb1JtN3lJRXkvTUR3aERqck5l?=
 =?utf-8?B?ZmVBeVlzQjRtek1sTmQ2WG5hWFZ2T0N5L3JnQlF3ZXhCOG1kU2h5cGFMbDRj?=
 =?utf-8?Q?P0dHrDRD05A6uCd9PyWnt8C12?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96963738-e4d5-47ce-427a-08db1fea7905
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:33:31.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksWOj7dP3Mt9DpAglTWee41QxTxMiGK/J0Ag/SjRsWVb9pLURuSD1Kf3E3p6ijfpJMY0Y4cuH4bW+E8Qi4lxow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811

On 07.03.2023 16:50, Oleksii Kurochko wrote:
> @@ -1166,12 +1167,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>  
>  void do_invalid_op(struct cpu_user_regs *regs)
>  {
> -    const struct bug_frame *bug = NULL;
>      u8 bug_insn[2];
> -    const char *prefix = "", *filename, *predicate, *eip = (char *)regs->rip;
> -    unsigned long fixup;
> -    int id = -1, lineno;
> -    const struct virtual_region *region;
> +    void *eip = (void *)regs->rip;

As said elsewhere already: "const" please whenever possible. The more that
the variable was pointer-to-const before.

> @@ -1185,83 +1183,20 @@ void do_invalid_op(struct cpu_user_regs *regs)
>           memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
>          goto die;
>  
> -    region = find_text_region(regs->rip);
> -    if ( region )
> -    {
> -        for ( id = 0; id < BUGFRAME_NR; id++ )
> -        {
> -            const struct bug_frame *b;
> -            unsigned int i;
> -
> -            for ( i = 0, b = region->frame[id].bugs;
> -                  i < region->frame[id].n_bugs; b++, i++ )
> -            {
> -                if ( bug_loc(b) == eip )
> -                {
> -                    bug = b;
> -                    goto found;
> -                }
> -            }
> -        }
> -    }
> -
> - found:
> -    if ( !bug )
> +    id = do_bug_frame(regs, regs->rip);
> +    if ( id < 0 )
>          goto die;
> -    eip += sizeof(bug_insn);
> -    if ( id == BUGFRAME_run_fn )
> -    {
> -        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
> -
> -        fn(regs);
> -        fixup_exception_return(regs, (unsigned long)eip);
> -        return;
> -    }
>  
> -    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> -    filename = bug_ptr(bug);
> -    if ( !is_kernel(filename) && !is_patch(filename) )
> -        goto die;
> -    fixup = strlen(filename);
> -    if ( fixup > 50 )
> -    {
> -        filename += fixup - 47;
> -        prefix = "...";
> -    }
> -    lineno = bug_line(bug);
> +    eip = (unsigned char *)eip + sizeof(bug_insn);

Why don't you keep the original

    eip += sizeof(bug_insn);

? As also said before we use the GNU extension of arithmetic on pointers
to void pretty extensively elsewhere; there's no reason at all to
introduce an unnecessary and questionable cast here.

With these adjustments and with the re-basing over the changes requested
to patch 2
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

