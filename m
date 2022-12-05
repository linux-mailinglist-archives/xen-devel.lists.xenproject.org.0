Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FA642A32
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453715.711314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CJU-0001Lx-NV; Mon, 05 Dec 2022 14:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453715.711314; Mon, 05 Dec 2022 14:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CJU-0001Ir-J1; Mon, 05 Dec 2022 14:19:20 +0000
Received: by outflank-mailman (input) for mailman id 453715;
 Mon, 05 Dec 2022 14:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2CJS-0001Ih-UB
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:19:19 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4dca3f-74a7-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:19:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 5 Dec
 2022 14:19:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 14:19:15 +0000
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
X-Inumbo-ID: cd4dca3f-74a7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1MbNssL6oEeXNQ/3d1ZvSbylySabC/Q5yKxdrt2xpJYyQAHbSf+OPl7K1epbfOi1hIRqemWVZaaIe7JrH3CE6M8/+iykgpsjQ/ZpVkavV2d2lFJXNCdIVW3PYK8KdOPLp83S4aGxL3dbLsIlA4/MIl7IDPjA/jlF1r6bYDlRGb656+8cM3TQOrVEBGJHR1Ct5OS8FdIgHT9nvSqNqEgdq12vPz2jO3zfZnkUuz/JRbEcrKtaI9yGreEn7c3KpeXVD9gJ5DR/XjrQNtFhj4D8s+Hb6w5k0bqsoQB0ds13UEcLdp09oeh6XduPwaTcP6ScMlJti8ENp1Kn8GyaWTIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNijArCjRy+hc+Byk9CgVk4CZNDWhH5rtucEvEiZuBg=;
 b=Gl9dLfco0qOyX1A8fqoGVZuClnqkzo/WDcfrM29d9mqJE9wCsCixyYDZdPUvbXNvtJu+RWYDhE2m0+nvXs/f8Fogc/vKl024uapDWzmUKH4VtkJC6+t0P/3tikfJvcp5A/NM0E5r7IIPpJnqq8WBV3sk883VnehM4G0RzyXXqidh0gRRl9I84dReXBmEmJZFQ5v89K9ZMs6G009p+/GODnFt3EhnVSmfU6o2R7imaQ9k69Vf/ptcWVCcrPojxuVwWLJL3k51c3TcnwaKY3+i+sqlQkgq7BZtzGyWvPnWyZvPo1OuunL3l/Tgh0Mb7cxzAiHhwxGtFlG2WBEtbi7emg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNijArCjRy+hc+Byk9CgVk4CZNDWhH5rtucEvEiZuBg=;
 b=C052teTIXEkq3lon2vdiy0iiQ5dmFQgfrKF+dgSgKC9D0WhnPlkNxZRC7lEUkJihnQ2zzHT6VuZWj7Y3u+MD+jpD6e7aYtYaLwM3GBhT1iFVebcsJMHNJR+IZKZsdY49zQpsNDs7ZFSnkllKWLw4TN+gHgws8PU/uayCTVndG0rxhAbc62BmiQAJu5UpV41aIijW01OiOunQUhLtCUfpSRd8E/C+jorKGUYTdZSgXvSyjGlzYfqvW5zg7sC/bd3u+5xcrGF2Bbt/bozgUbvqpLb3+UE1OBP8bqGlOFITaPiWhihPSMzFKyUlY209OWxrwz8L/GK4aDpcDErrAZP+VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
Date: Mon, 5 Dec 2022 15:19:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221123154525.63068-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7c2b7f-c6dc-427a-ad8d-08dad6cbb06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRa8qiawG9g6WSHTVXPx/kLFzIp2oZX7tdwSf4JDwIMh5A5sXgDdisJJ4uVs9CaP8xmnMnmB0NYBjlyh9jGTfzOpE3WodrukTaP1xnXrw+SJpLi1GSENhuSAH7tgxnqHbvKXqeTYZueU6vQom6iFUoqt8nQXgQtei3z3ILaMfkxY97N+lgjZOB1isJ3ve4T4qtSob655ojS2NTdZls2dUl0c16YHyHDIQOUbGuAWM2lbckw0Fg8EHbkJWv3aef/0HX6PJYLu+bG/fmeHmyKihj4Gxghw3SkuylgJSAHTSzs17fxhooCLfsoMKJBnjhMzqOG7G75mzpZxm7fChLR7A6ga8TsJUaZJ+zZ80wsa6imuqc8IsVdbIdABBdLwWTV+lyrdGMsRflQ6N063hNpIqjk4c1d1Pr/+VZyQLALrBU3sXb3LuNVC4vX/tOgbfbQkVkjEeSpSAosC9JaVYwmVLdy5hVbMou6uIllCRdNR2tZfzEJiqXBW+XfhXi+HKj5yXAo/vxj5EEqJYlCbaZaHwPxltkCD+06eRlnVq/VKHulNLevAWnK+Ff/sKpi1erjmsbAy7chtnpfmAauAtDMBdJfX0kPqfv2D9ohb02NFmNTM9thzWEKyL9FRkCKImBZG2L95Qlz587A4lsD/G4g9h8A+Q/FvDOzE26chjMk13tHxuqjUI1O34uIu9Z5M/76Zu1GziEO1blxzukACrr2iqjfIOcNIa2meoQ4Qydu0LNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(36756003)(38100700002)(31696002)(86362001)(41300700001)(2906002)(8936002)(4326008)(5660300002)(66556008)(66946007)(66476007)(6486002)(478600001)(316002)(6916009)(2616005)(31686004)(8676002)(186003)(53546011)(6506007)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTYrc0V3SnR1U3JEZTZ0cWQ5allTTzVRNWk2QkdnMGVmNm5RbjJBblY0bGt6?=
 =?utf-8?B?alRhY0ZVbi82bDRLc0JEeUorNmYzNThuRUp2K0NSdzVTNko5Z3VoTTllYmIw?=
 =?utf-8?B?UkRXRnhXSGZhTjRxWC91WXZKRitwQVNSZHA1YUlqUGNPdTRBUXpCNmx3cWQ1?=
 =?utf-8?B?bE9obmQ1aXNtZFVPMUZxbTRPUEVYeFRTNHBuQTZBN3VuNFNNUURNU2RSNjQ0?=
 =?utf-8?B?dGxhV1d1SVFoRGZTc1IzR0VwMTkxbFZkQnFvc0lXWE5YcHFOeTVBRmZQMWlC?=
 =?utf-8?B?SUZKY042OWNsQm5VclpROXlnK0VIYzkzS25ScDNEeG5hVnJOVTFSamdCTGdt?=
 =?utf-8?B?YUtRZnlsMzZaSUNzc0Zubm5rOGVJNVZWakRGMHBvejVSZGZpVXJmNk9VTnhM?=
 =?utf-8?B?dmtDYkxBUFQwZ3RqN09heHFNL2tvN3VzdUh4N3p2RmN0a3VhNmp6dGR4QllX?=
 =?utf-8?B?K0UyR1h0cHRNeExBa0pvRFJRSDgvZkNZYmZYQ3FrRTBFOGlIVmdrc1ZiUU1S?=
 =?utf-8?B?NGJiR1htOWtYZjh5bFlGRGpUMEtOYWJBRXU1TlMxdmNEQ0IvOGJIVjRjbDds?=
 =?utf-8?B?eURKdWlCYVpKSlI2SEpMNlBMRGpRQzk3eFJhSTNTL2k2SE56RGNVVytZSGRM?=
 =?utf-8?B?dS9nMnBzRVNwblQ4ZzFjcnVNbW5tNm9KckR5UFFrSU9NUlA4Q0FLb1ZlNEJm?=
 =?utf-8?B?aktaUUtFQkk2OGVWY0JYTWpnbXNvdExlMFZIcktHS3paRE1ob3c3NHpNN2pM?=
 =?utf-8?B?Wk1WV3dSUTNDYWsrUUR5d3JZbnJvZ3B2K1pJKzQyZzh6c1NhaUxSZ1RxQURp?=
 =?utf-8?B?TFVvNTBrMHlaOEpnc2NZcXlpNkMvRHdzbTdTYmhiTlBNNmJHNXBaaG1xNGFU?=
 =?utf-8?B?b1RUV0VGOFNhTUJUb3cwWDRhYTJpdk1nNXhzQWI5VUp6T2ZMVHVKU1J6V09L?=
 =?utf-8?B?UExCR2RrSU5hcnZlVUVWUnFRNm1tcjJNOFd6VVdiYnkyVjRFWTZYQ0NBazY0?=
 =?utf-8?B?OG40azZhTzdrRDlCMzMveFVsY3NFMnYwNkp1bnpzQUNaUHE4eWlnaDdlVlJs?=
 =?utf-8?B?SjlsQjN1WXJsaVU4aDhFSUwvcnZSNlc5Tm93dC91aGFHQUlyMjdGRGU1MEZ1?=
 =?utf-8?B?VTF6N2hOZWtpeXRqZVJueGtJOElIM1pqcVJRaWdIeWQyNnVoMlNvcEJoMDBO?=
 =?utf-8?B?ZnBMazBsZFp2YmlHbHk2ZzBIc1FpK0RJem1XbHJNL1haWktTSEYrM2pqbFp0?=
 =?utf-8?B?c1pvbzEwYWx1dExGcWZkTGlWbHhJUGx6dGZ2L1NvOU1LQnZPdzVFRHJSemFu?=
 =?utf-8?B?MWZVYmxndUpQUjRxQzRaeUcwV1pENjlqQmtRQjd4M3cvZDNWenVXWG5WWm9D?=
 =?utf-8?B?UzZmZWpIRVBjUFp5amVML201YVNsdkU0MGkxUjVuV003WWlCUVMzU3F5Mmpl?=
 =?utf-8?B?Q0UyNXBnWlpJN3Bjd0l1R25pSlNpSGpNVVlhandLYjRqV2dDZkFkdTcySUpX?=
 =?utf-8?B?R3Y1ZytBZzVHQlZ0N2NDemxoZWV3eWJEbVJLVVAzZWcyMi9RWjU5NFE0TUFy?=
 =?utf-8?B?aCttVzllaVF6NnhoQ0JYbjExMUhpTjVzYWxoVGowblY4MzhFdlRFYXh3Zndq?=
 =?utf-8?B?dW1hNjkrSGwxM0J4WExTSXlZbnB0bmdVR2VQb2NDVWtXNFpxY0lQYVlsRSsz?=
 =?utf-8?B?N1ZMQUE5YisweVVPL3A2SGJ4d2RVeDgxalZwWW1BTER1OHFHVUNTa0NsRmts?=
 =?utf-8?B?c2VZbktrR0RQSloyd1hjWTFtb1YwSFZSTnUvam1ubitQNWlMdjY1ZUo3Mmww?=
 =?utf-8?B?UWNpWkpkT1dVaWxUSEw5ZWgxd3B1RmNBTDE3S1AwcW9WN3hQV25wRDNuZGk5?=
 =?utf-8?B?SmRVUlVHVnNudmplMms2eU9IcHovOVl3RjkydHNMWTZJdFgwVlk4RWdZcVlG?=
 =?utf-8?B?V25EY29ZNnlqVjl3S25hTkt5eExmeHVtWlkrZ3pDOVZ0NG5uYmtORHI2WUFj?=
 =?utf-8?B?d0tESFdHd3lxOUN1TWRuNzMyUU05YjVVT3hmclBsMldXV3J6cVhWZkpuZ3F0?=
 =?utf-8?B?Q3J0WHVabmxIcWlvYm9uMjlPMzBQenZvc0VKUm5KcThEMnphNnJTbFg1SXpi?=
 =?utf-8?Q?h9tJIL808sZF8MCzSSnBzlDKD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7c2b7f-c6dc-427a-ad8d-08dad6cbb06d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:19:15.5216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4cuPTdrfsMHMN6nbYHHm/66aHKFf3N9tZZylDy5MHMe6oFtaZhAy9RXfsh3GJ8qq2IzSPvgTxA56z1dTRo+6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On 23.11.2022 16:45, Roger Pau Monne wrote:
> Do not unconditionally set a mode in efi_console_set_mode(), do so
> only if the currently set mode is not valid.

You don't say why you want to do so. Furthermore ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -799,6 +799,11 @@ static void __init efi_console_set_mode(void)
>      UINTN cols, rows, size;
>      unsigned int best, i;
>  
> +    /* Only set a mode if the current one is not valid. */
> +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode, &cols, &rows) ==
> +         EFI_SUCCESS )
> +        return;

... it might be okay if you put such a check in efi_multiboot2(), but
the call here from efi_start() is specifically guarded by a check of
whether "-basevideo" was passed to xen.efi. This _may_ not be as
relevant anymore today, but it certainly was 20 years ago (recall
that we've inherited this code from a much older project of ours) -
at that time EFI usually started in 80x25 text mode. And I think that
even today when you end up launching xen.efi from the EFI shell,
you'd be stuck with 80x25 text mode on at least some implementations.

Overall, looking at (for now) just the titles of subsequent patches,
I'm not convinced the change here is needed at all. Or if anything it
may want to go at the end, taking action only when "vga=current" was
specified.

Jan

