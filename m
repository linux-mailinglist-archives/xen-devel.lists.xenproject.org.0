Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BDCB2AEF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182806.1505642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHP4-0007d6-Bn; Wed, 10 Dec 2025 10:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182806.1505642; Wed, 10 Dec 2025 10:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHP4-0007aC-7l; Wed, 10 Dec 2025 10:26:38 +0000
Received: by outflank-mailman (input) for mailman id 1182806;
 Wed, 10 Dec 2025 10:26:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGxX=6Q=bounce.vates.tech=bounce-md_30504962.69394ad5.v1-4748ff37b2854f23a25ac995d5b442ce@srs-se1.protection.inumbo.net>)
 id 1vTHP2-0007a6-TG
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:26:37 +0000
Received: from mail187-28.suw11.mandrillapp.com
 (mail187-28.suw11.mandrillapp.com [198.2.187.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11cbeb2-d5b2-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 11:26:30 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-28.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dRBhj2MFHzMQxhrS
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:26:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4748ff37b2854f23a25ac995d5b442ce; Wed, 10 Dec 2025 10:26:29 +0000
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
X-Inumbo-ID: b11cbeb2-d5b2-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765362389; x=1765632389;
	bh=4QMlusKsww3frArFid78o3mtyVxZfkWUdnDjwXr27cY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zpbmp//HJ1qG0KZB/zru3pO33viGSCF/eFXoUcCzYXZfp+ZWAJ5SYIuwjhcE2mtni
	 D3K4v2wKlmnsqGTox5tVQGa8HrxQ/TEg6dUqvGBQZ1ww19/b0r49nS7Dg7CUVPPubG
	 kHrONnLtBrTPY2shJup2sVkJSwQqQMTfdGG3xcPks62VPmhwKr7lAXdYqBiFLGgOCG
	 ui0bkcZGcdv4+F3GPpL+BNTdlncmA3DchxFem0vtCBIGU7Vn9GwaSLHRdFTc1F1Qhb
	 sqXj+moNEYCk46dbh7kBOM6v52+hSI3EV9bUvkDZTshc0kdeQeX7Fk1C3KuVQjKDcp
	 0443tGAztMAlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765362389; x=1765622889; i=teddy.astie@vates.tech;
	bh=4QMlusKsww3frArFid78o3mtyVxZfkWUdnDjwXr27cY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gTiofoVHLmi/k+mgdJrY5yAS+sX3NcXkuWfdvuA8wi1BjiULF1zMgezb7rBKPeGeZ
	 UCcBKkq3tJL6Pznz1YB+2d5YbzFBSqO/sNf7WXXkoaMzPnNN/o8dlBcWun8rCfib2U
	 T4KR3bhgh9vWssQv98DwTrmuHVzqhQIzNphbDcZzH5nBB48eP4UMQUm+zo8DZX0sE5
	 u+OHc0C9Hwvb7gRysDuOirhq49h3UppN14fGPm5AA54KRzAv5NSbElSGWf9elwzKZ4
	 Ra3k4S9DRBmpiB/GFx2pFl8s7ZKZtUAukujXIt7MbrOGV7OdGBLwli/4tqIE6uGuKH
	 zkrAVv45Q+yqA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/3]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765362388494
Message-Id: <f7803da9-951e-427f-9f1b-c8bcc1ab76e7@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech> <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech> <29100824-303a-46b2-b394-d15d617131bc@suse.com>
In-Reply-To: <29100824-303a-46b2-b394-d15d617131bc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4748ff37b2854f23a25ac995d5b442ce?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251210:md
Date: Wed, 10 Dec 2025 10:26:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 10/12/2025 =C3=A0 09:50, Jan Beulich a =C3=A9crit=C2=A0:
> On 09.12.2025 18:19, Teddy Astie wrote:
>> --- a/tools/misc/xenpm.c
>> +++ b/tools/misc/xenpm.c
>> @@ -30,6 +30,7 @@
>>   #include <inttypes.h>
>>   #include <sys/time.h>
>>   
>> +#include <xen/asm/msr-index.h>
> 
> For this to not break non-x86 builds, don't you need to constrain the bui=
lding
> of the tool to CONFIG_X86? (I have no clue why it is being built for Arm =
as
> well right now, as I don't see how it could provide any value there.)
> 

I don't know what are the plans on that area for ARM, the only thing 
that seems supported right now is "get-cpu-topology".

>> @@ -37,6 +38,7 @@
>>   
>>   static xc_interface *xc_handle;
>>   static unsigned int max_cpu_nr;
>> +static xc_physinfo_t physinfo;
>>   
>>   /* help message */
>>   void show_help(void)
>> @@ -93,6 +95,7 @@ void show_help(void)
>>               "                                           units default =
to \"us\" if unspecified.\n"
>>               "                                           truncates un-r=
epresentable values.\n"
>>               "                                           0 lets the har=
dware decide.\n"
>> +            " get-intel-temp        [cpuid]       get Intel CPU tempera=
ture of <cpuid> or all\n"
>>               " start [seconds]                     start collect Cx/Px =
statistics,\n"
>>               "                                     output after CTRL-C =
or SIGINT or several seconds.\n"
>>               " enable-turbo-mode     [cpuid]       enable Turbo Mode fo=
r processors that support it.\n"
>> @@ -1354,6 +1357,92 @@ void enable_turbo_mode(int argc, char *argv[])
>>                   errno, strerror(errno));
>>   }
>>   
>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package=
, int *temp)
>> +{
>> +    xc_resource_entry_t entries[2] =3D {
> 
> Is the 2 actually useful to have here?
> 
>> +        (xc_resource_entry_t){
> 
> Why these type specifiers? They shouldn't be needed in initializers (whil=
e they
> would be needed in assignments)?
> 

I wasn't aware that omitting this (xc_resource_entry_t) was accepted in 
this case.

>> +            .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THER=
M_STATUS
>> +        },
>> +        (xc_resource_entry_t){ .idx =3D MSR_TEMPERATURE_TARGET },
>> +    };
>> +    struct xc_resource_op ops =3D {
>> +        .cpu =3D cpu,
>> +        .entries =3D entries,
>> +        .nr_entries =3D 2,
> 
> ARRAY_SIZE() please.
> 
>> +    };
>> +    int tjmax;
>> +
>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>> +
>> +    if ( ret <=3D 0 )
>> +        /* This CPU isn't online or can't query this MSR */
>> +        return ret ?: -EOPNOTSUPP;
> 
> xc_resource_op() doesn't return errno values, so by using -EOPNOTSUPP her=
e you
> put the caller into a difficult position when actually looking at the ret=
urn
> value: Does -1 mean -1 or -EPERM?
> 
>> +    if ( ret =3D=3D 2 )
>> +        tjmax =3D (entries[1].val >> 16) & 0xff;
>> +    else
>> +    {
>> +        /*
>> +         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assu=
me it's 100 which
>> +         * is correct aside a few selected Atom CPUs. Check coretemp so=
urce code for more
>> +         * information.
>> +         */
> 
> What is "coretemp source code" in xen.git context? (I understand you mean=
 the
> Linux driver, but that also needs saying then.)
> 

Is "Linux kernel's coretemp.c" better ?

> Further please respect line length limits, also ...
> 
>> +        fprintf(stderr, "[CPU%d] MSR_IA32_TEMPERATURE_TARGET is not sup=
ported, assume "
> 
> ... e.g. here.
> 
> Additionally there are still IA32 infixes here.
> 
> Finally, if this message triggers once on a system, it'll likely trigger =
once
> per get_intel_temp()'s loop iteration. Feels like a lot of (potential) no=
ise.
> 

In principle, different CPUs can have different results here. But we can 
still try to only display the message once (by using a static bool ?) as 
affected hardware will probably be quite uniform in that regard.

>> +                "tjmax=3D100=C2=B0C, readings may be incorrect\n", cpu)=
;
>> +        tjmax =3D 100;
>> +    }
>> +
>> +    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
>> +    return 0;
>> +}
>> +
>> +
>> +void get_intel_temp(int argc, char *argv[])
> 
> static?
> 
>> +{
>> +    int temp, cpu =3D -1;
>> +    unsigned int socket;
>> +    bool has_data =3D false;
>> +
>> +    if ( argc > 0 )
>> +        parse_cpuid(argv[0], &cpu);
>> +
>> +    if ( cpu !=3D -1 )
>> +    {
>> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
>> +            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
>> +        else
>> +            printf("No data\n");
>> +        return;
>> +    }
>> +
>> +    /* Per socket measurement */
>> +    for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
>> +          socket++, cpu +=3D physinfo.cores_per_socket * physinfo.threa=
ds_per_core )
>> +    {
>> +        if ( !fetch_dts_temp(xc_handle, cpu, true, &temp) )
>> +        {
>> +            has_data =3D true;
>> +            printf("Package%d: %d=C2=B0C\n", socket, temp);
> 
> %u please for socket.
> 

Ok for this (and the other adjustments).

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



