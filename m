Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607CC405D5D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 21:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183519.331740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPmR-0008JV-BW; Thu, 09 Sep 2021 19:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183519.331740; Thu, 09 Sep 2021 19:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPmR-0008H0-8M; Thu, 09 Sep 2021 19:32:15 +0000
Received: by outflank-mailman (input) for mailman id 183519;
 Thu, 09 Sep 2021 19:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYjb=N7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mOPmQ-0008Gu-2l
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 19:32:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9144ba9a-28b3-46ff-a8b2-e04c6ce47ad1;
 Thu, 09 Sep 2021 19:32:12 +0000 (UTC)
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
X-Inumbo-ID: 9144ba9a-28b3-46ff-a8b2-e04c6ce47ad1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631215932;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nJpzC1u+7lEXyVswVkCY5sFmtKIznFVFfphKGPf9a+k=;
  b=YKeEaL2eMjl0CUCia9+Vd1wKi5BRF9/Dwq9VEAK97hyin/lyEuk6hadc
   /kq29JW/2i2Qru7z7X6nlaJHy26UY3XKfvUyjHLtwVpaaFu3gQm2pqacR
   5MrTp55Dg0PSV2eTOWokgGdbSXx0IDzYwFO5ClUmDlUnhnaGmVZsF4tgk
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dw5OZMrsD+9zO8ImFGDaUpaAFDEzTI9boI3fr5inGP9zyGfrKUemh9ER7euQFr8iaJZW1Wb2bW
 YtRVDrc8Xw+txYOvkxSQl35ncscM4IOAW6siC8Uyg22CzrIoFZ2YfeUe96uSm85FZi2vtH2/eY
 EYKffUd8vilGKt+clWYJniuX/FyZDSMA38DSpOyUK83Kgv98SNdBTduC0VNGwATfjt4TPSsqXK
 PeU9X49TyI2DltAB8Pt3Blvy1UrRt+c6dsXGaxPGt+vxMaWIXFXmKihleh1bPJQ5iPmir7DpnP
 FNZ9WZ7arsXNrEc59wwBgR79
X-SBRS: 5.1
X-MesageID: 51992268
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2o7wsqBbs5RZhtzlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.85,281,1624334400"; 
   d="scan'208";a="51992268"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fum0S/y0/m1tjEpBrZ5sth4We3h6/yBuMOFVJhHtKw7LB4NqDnfXwRrdus+CcClxXVGLUkpb1Kf51t3ajsUBqryO4IUHlfIpxJ7lWMcK+TALB+Jaf8cEWjDy3WnrKNcFTQ0wvSzJ50yZW05L9J7bIPUEEHqVbxT9dnPviIoRNAmbVJbO4W13z/L0EeA3lvXSkSd83Od/fFK3Sj+1MApyrM6auR5tdCLUw3fqBOjzBHzEq1rnW8kLgqh+vS/4RpjUZqJMUbuNWXi/hCHlF9qiQOQ/srkx0CykJZ7qN6WNhFp+rYllu6/HD+s7psQta0fQKcFzGvw5Elm+y4nBLnwiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xw5biZfDNnOryD4SC+n2AwZEmSv15Wy4mSqEMZivfxg=;
 b=g3hm5uDy8y7l849Ieo5c5kJqlHxO2uJRr3EibQKlwYF0hzKCzCVIwEZzNB/eVJ1lEpUg1wKovdW+Pv9Ev57kydN5+uymd0NLMhC7LQ4RpX10kgHha+PiSx8LT41oeSxLZhYSJy71FhBFov8DIkZuE399ZoWxNaZ8GQoa0J1e6Q1D+0Jk274RzW6nWO246QWSFb8PfXlJM7MAAkVzkHdljGJeyEO2wCFD0PGLeQB+Rtr1J/xEGb9PAMfpQgKRpNRw1tPKpv6fP334oL/OOHJL70F/yZYU2mEPsZpAo5hzbY333hUe9oeUG7sj/qR19E9MyUlMEWvOhwBYFlOoGWPlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw5biZfDNnOryD4SC+n2AwZEmSv15Wy4mSqEMZivfxg=;
 b=gVuft3rhPesPhh8oCskIVX1PcReuDkdBI4L8YJ5HBPMexBI6+e5rA0d+BKn7gKy5/MXRi5XIKQa1eCMMMnRgzDMDHsCRsSiGuwR/Zls7athzRVf0B80Pu7UuT9u3DzdQQzPmY+na15RvDVNbO7xjYIACgeO3mO2kJrVSK7UpBkg=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <87278164-2395-1fb4-7569-9151d0151e8a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct asm() constraints when dealing with
 immediate selector values
Message-ID: <0800289d-7744-2c77-b369-707f4947595b@citrix.com>
Date: Thu, 9 Sep 2021 20:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87278164-2395-1fb4-7569-9151d0151e8a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 349e153f-e01b-467c-4bb5-08d973c8836f
X-MS-TrafficTypeDiagnostic: BN8PR03MB4706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4706DACE87FFC9D4DE394547BAD59@BN8PR03MB4706.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFXucYwrA97Tq6rB0CkNsupt0DOllft+sgFoq3BeeaITcMp0gZINMNY6Q4CT31ZEliIc4MF5CAhiD1TBKY21+3cj6/CIZh5peo1WNvpT5c/ANkB5LyHS3Gd0cSamkFECDyKed2GhkYLT8WfuIwKj5rBEHg2kWOKbz6wo8QhLHsPumzUaRaUYm5pqmS/9IfswzcFAILV2zP6G0/SuTJg+SNBLa+NYSy2VDthd+O7dsha6cijeuBTiFsAme9VoGoh886OPTIL2w8J/eKt5igflLqj4taOa2fEabiiXwWZZlCzfeX/37LM2cvC5ler+9JA6gacqW1lE04ksy4Q+KeKZD4YR80xlEqQpeDD9r8AyDzTxcPHQ10x5ZrQvf+el0HKD5R+qPZT4Ces9QMfG9QrlAqTKrravuiy/4ey6BEXgDrrNx3qtc7XZxqnfqZ6oZ8Gp8h64Pp6ohM1LzHAETwVdDqeNsVwCixcbzF+ED+Bpf553c7KYsLd6vHQ5QNAZoH2cFoTGD3JxsKNHHyVo0SUGVmavOmlhA0BmbSAbE8pOi74wn5xJBCeuo3nS/HT5zgRP9f0MetDzhdGDfa8U1kWVFnG38axnQiiDUjC6Bp4u2KisImo5iBuOAzCP7OwFkxmM2wpyr22q8R4ODAeBK1BlX59TPZbdkWers0iOPt0ES1oIm4HntgSFP5BShWQ//XZftYRIFVKKNcmbT5tl3IX5qay1h/msIyqMDFFRXDvKoMVpT3l4HAqueg3zjbzYrixjMdCtWrmgMohk12vbI/jx6xTBJm//q8ZQ5ef1brb58EFRFk8JICMnKc1CujXoLvHeq70vUTwAiwlZLeR5nbaRIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(2906002)(26005)(38100700002)(53546011)(55236004)(8936002)(8676002)(66476007)(478600001)(31686004)(6486002)(66946007)(4326008)(186003)(5660300002)(66556008)(83380400001)(107886003)(54906003)(110136005)(316002)(16576012)(86362001)(31696002)(956004)(2616005)(36756003)(6666004)(966005)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnU0MDR4dkRHM3lTZ05UU0J0ZlN4ZldwemRwMnJXVUducmNvQ0k0ZHBnZjRp?=
 =?utf-8?B?eUhhNlZrMUI4cHNVYTFaNjFjcEVWY1U0TlVKZVl1NEc4UHJ3cTgyTHp3dW84?=
 =?utf-8?B?WEZMeDRFb0xUTWhwSkYzS2Q4alA3eEQrdVdpN0FIb1hiU1dQUzBvQ0JoSklU?=
 =?utf-8?B?S2dPS3VMVmtUaFNOYjZKK0dVWjdhUzVIQStTNDF3VkF6Nk5iTEQxK01aMWE3?=
 =?utf-8?B?OEdlWjk2WnpBbk5iZDkvMWVQSmFCcXNVSWt5OXhBbGRYUFlZZGJFSUJ5TEl1?=
 =?utf-8?B?TjdpM1FqQmRrYmszaGMrYlppUjI3Q0hVQlNVbmd1Vy9NS0lVTXRtSHFtR0Ru?=
 =?utf-8?B?RGNQWThrdFRieVdEc0pwUmVpUnVIbU96K1RsZlRJbDBFcDA2ZzVhNk5UcERO?=
 =?utf-8?B?cXBWdk1FQ29BbzkxMUdpcmx6eS9MK2ZSam9OTmdvQXJld3Vqam1iS01PMTV0?=
 =?utf-8?B?SDR5dFphLys4QTR0a0tLd0RLQTVyajhldGc4OWVCRjJhc2RjdnhKR2IyZks3?=
 =?utf-8?B?bEF0VTQwNms5K29yV01pYmtCTVAyZU40NDF2V2VFdnZwME1YdkVqTStJRWZM?=
 =?utf-8?B?RkgzRzV6VFlHM2I1QWhNbkVZUlRleUVrd0N1MkYwVm92NENNWUd1OHhxUG5Q?=
 =?utf-8?B?NkdFRzRFUCt4R2xaZUZaSGJNdHJXMjNENXNWYWVqRFpGbkNrN052Qk1jRlJa?=
 =?utf-8?B?T3hpQUhxRUF0MTk4Myt2R2F6K3E5TC9QUi85UnhxUFY2MFd1Z2ljUjdwM1pU?=
 =?utf-8?B?cE9iQXFhUXVJKzZDUUFmMWZhejk1NUUvcHdCQS91Q1F2azgzMXNkNzJ4eWNp?=
 =?utf-8?B?T3dWVlV0WGxJdjVlbXk0VkNTeUlTRGRDd3YvbzNEREV3Qjc2dyt5OXlJMzdx?=
 =?utf-8?B?dk5GK2pENjBxNXJabFFOZzNna2Q2UVFMRkJ0WUZEQ3AzZmxiMXpqeDM3QS9K?=
 =?utf-8?B?bnB4U0dTUW5mbitNQkJ1VDFxakpPSTdLb21qUzc3WllFM1Y5U0hMZ0tkVFlh?=
 =?utf-8?B?MzRxZ2xKMFBBd0ZVelB5Q2xnT080eHhhaVFYYWN1ejNNM09OekI3TElOdTZi?=
 =?utf-8?B?Y3ZPOTdNazJaVFZ4QUsxVnBvQlJ5VmhMOG4yR2JnQzJRekUwcFEzL0xEOTBx?=
 =?utf-8?B?RFk5cFhZVHZZV3FiOXFHek90eFhBSGdTNEVqUlFmamZNeDE1V3ZERXpqd3hR?=
 =?utf-8?B?L3F2eC8ydUg1ZEFKZnRJUmxMMDdwTkFJaEczTERaVnFMRDZQdk9LOTFNWEg1?=
 =?utf-8?B?NmI1Mll2a2YzNjkwKzRwR2FoM2wzUTdPYTJOU0h4QVVHb1Z2UW9iV05HZEgw?=
 =?utf-8?B?eFRnTGJXZk9BZmhQS2ZMVm9uck5PR0RTQTBYRzAyb1NiMjg1TmdlbmpueGp1?=
 =?utf-8?B?ZllVZTZlVlQxQVFqNHhtMFRHaStWMzNPWG5JK2k1WFFMZklkNmF5OERhYnll?=
 =?utf-8?B?QVVuNEs3RGRwSlhiZjBvUDBuWWwxOGpzSVhIZlFIK29xYi9ZcUlaVzEyL2Vy?=
 =?utf-8?B?ZnZBVldmRjlzcER5MVlMN1JSZnN2a2tuSVQyRXB0Y0luWE9yZmdvNlBWbEtG?=
 =?utf-8?B?aG91TXhuMmdGaFZKbmNsSjdDLzNBbkxNald6eGJhN3BxcEFnQmxDTkdmZFB6?=
 =?utf-8?B?N0txMjdZSnJrQWNiOEsvWnc1eGtpc3NmQU9ua2dkZ1dMM0hpcVRjZmF0VUto?=
 =?utf-8?B?OVZJYTB3ZGloTERrTTlINUVQVUo5aGQ0UTN6aEpyaHh5ckVTa05iR1FXK0E5?=
 =?utf-8?Q?5dYQeQS/6Y8FjJ8bfI59wfVwU8Ggc1rwfJ/5ND1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 349e153f-e01b-467c-4bb5-08d973c8836f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:32:08.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYYZvwXba3lUWzi9aobGKzoEpbFQi+Yh3b4T7A3A7OOBIkzmZbOq2lU03qjk9Fu7dRl6+IUIWxatWmnaXI27+K7nwcSykPJ+HIKSZESft+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4706
X-OriginatorOrg: citrix.com

On 09/09/2021 15:56, Jan Beulich wrote:
> asm() constraints need to fit both the intended insn(s) which the
> respective operands are going to be used with as well as the actual kind
> of value specified. "m" (alone) together with a constant, however, leads
> to gcc saying
>
> error: memory input <N> is not directly addressable
>
> while clang complains
>
> error: invalid lvalue in asm input for constraint 'm'
>
> And rightly so - in order to access a memory operand, an address needs
> to be specified to the insn. In some cases it might be possible for a
> compiler to synthesize a memory operand holding the requested constant,
> but I think any solution there would have sharp edges.

It's precisely what happens in the other uses of constants which you
haven't adjusted below.=C2=A0 Constants are fine if being propagated into a
static inline which has properly typed parameters.

Or are you saying automatic spilling when a width isn't necessarily known?

> If "m" alone doesn't work with constants, it is at best pointless (and
> perhaps misleading or even risky - the compiler might decide to actually
> pick "m" and not try very hard to find a suitable register) to specify
> it alongside "r".
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm slightly surprised you didn't spot and comment about what Clang does
with this.

https://godbolt.org/z/M4nrerrWM

For "rm" (0), clang really does spill the constant into a global and
generate a rip-relative mov to fs, which is especially funny considering
the rejection of "m" as a constraint.

Clang even spills "rm" (local) into a global, while "m" (local) does
come from the stack.


I think there is a reasonable argument to say "m" (const) doesn't have
enough type (width) information for a compiler to do anything sensible
with, and therefore it is fair to be dropped.

But for "rm" (var), where there is enough width information, I don't
think it is reasonable to drop the "m" and restrict the flexibility.

Furthermore, I'm going to argue that we shouldn't work around this
behaviour by removing "m" elsewhere.=C2=A0 This code generation
bug/misfeature affects every use of "rm", even when the referenced
operand is on the stack and can be used without unspilling first.

>
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -736,7 +736,7 @@ void __init detect_zen2_null_seg_behavio
>  	uint64_t base;
> =20
>  	wrmsrl(MSR_FS_BASE, 1);
> -	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
> +	asm volatile ( "mov %0, %%fs" :: "r" (0) );
>  	rdmsrl(MSR_FS_BASE, base);
> =20
>  	if (base =3D=3D 0)
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -248,7 +248,7 @@ void do_double_fault(struct cpu_user_reg
> =20
>      console_force_unlock();
> =20
> -    asm ( "lsll %1, %0" : "=3Dr" (cpu) : "rm" (PER_CPU_SELECTOR) );
> +    asm ( "lsll %1, %0" : "=3Dr" (cpu) : "r" (PER_CPU_SELECTOR) );

Any chance we can clean this up to: lsl %[lim], %[sel] seeing as the
line is being edited?

~Andrew


