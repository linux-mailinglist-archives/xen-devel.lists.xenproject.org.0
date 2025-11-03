Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB9C2C6C8
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 15:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155394.1484890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvdY-0005T3-86; Mon, 03 Nov 2025 14:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155394.1484890; Mon, 03 Nov 2025 14:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvdY-0005Rb-3G; Mon, 03 Nov 2025 14:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1155394;
 Mon, 03 Nov 2025 14:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wccd=5L=bounce.vates.tech=bounce-md_30504962.6908bd6c.v1-2dddcedda25845c19a088b0e55533f9c@srs-se1.protection.inumbo.net>)
 id 1vFvdX-0005RV-1K
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 14:34:23 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb211a9-b8c2-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 15:34:21 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4d0Yxm3JrxzDRHx6V
 for <xen-devel@lists.xenproject.org>; Mon,  3 Nov 2025 14:34:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2dddcedda25845c19a088b0e55533f9c; Mon, 03 Nov 2025 14:34:20 +0000
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
X-Inumbo-ID: 2fb211a9-b8c2-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762180460; x=1762450460;
	bh=cmJyhQrOy7ylbHCxHCwskA5DUv5Thn1gMw+4kX72MLQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gntrV8VtG2dwuLlZAGsEfI6s2oseeb/oozheiNpr9pH/g3ivCgxj7c3WqXeQpEq6T
	 eQbvZH00nNZNMNgRuMJ/FvagBm54qO6OLY7+Vf7WhtUWkMzgACK4J0GLpC5TrKyokF
	 uqrToJtv0jR42sYlXCt3+VZQd2LoM/WFHkFOOHoSwKnt0qmMhSWybLHtWiSqm0npm4
	 myydRtgdI+u5A+LPjIK4qqT+OhH4E98Cbba/zH0pLtSfolxaNOhta6qx14SlBYeXb0
	 vd7Yv4z0h9CvNkha51gqL35bBroOyb1GmtokLe0VgKVxLWV694YkgwFePaqhpRP3hr
	 RlG5jN7moBUIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762180460; x=1762440960; i=teddy.astie@vates.tech;
	bh=cmJyhQrOy7ylbHCxHCwskA5DUv5Thn1gMw+4kX72MLQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NidbyOx94QQEU9uaCdnbXjihf/V+dQXVwzoVWiWs51USDQXj3oyOsZ1QPkeyzmMZ+
	 W72EddJ/3rA+GYOaTcbADzgHcMfqp2VsU+U1tYkGfkG0e5x92KL4G5AGJa4a3tWkB0
	 bS2xN1cSmOlku/nZNsW4k1oKQsjbPpdSLHLp+HPFIYbtX7mXm82HROnYPaq359qC9A
	 h+ooz/cUWGRpAXs9+uykTTl+faO8yvIZqnKMRNKfI8QtdOwv8bwTfOEjB9wR3XMIp3
	 pHcGsyWfqO5VcDZpPhh051D6vZaWS2bstzI/yiQqc2Lz0mF9YhxUkYa7Ba1SW2Sx6H
	 e1z79B9ANP3YQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20for-4.22=20v2=203/3]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762180459922
Message-Id: <63a05970-f3b9-4c9c-851e-fea8352d2a43@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech> <6ed4d320ca4a69ca8b05b0af45d32ff4b330a779.1761752801.git.teddy.astie@vates.tech> <453a06cc-f1ba-4ac0-af61-43c24640fd2e@suse.com>
In-Reply-To: <453a06cc-f1ba-4ac0-af61-43c24640fd2e@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2dddcedda25845c19a088b0e55533f9c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251103:md
Date: Mon, 03 Nov 2025 14:34:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/10/2025 =C3=A0 15:05, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.10.2025 16:59, Teddy Astie wrote:
>> @@ -1354,6 +1356,95 @@ void enable_turbo_mode(int argc, char *argv[])
>>                   errno, strerror(errno));
>>   }
>>   
>> +#define MSR_DTS_THERM_STATUS         0x0000019c
>> +#define MSR_DTS_TEMPERATURE_TARGET   0x000001a2
>> +#define MSR_DTS_PACKAGE_THERM_STATUS 0x000001b1
> 
> DTS infix question again. Actually, can't we use the hypervisor's msr-ind=
ex.h here?
> We already use it from the emulator test harness.
> 

I wasn't sure whether tools could use msr-index.h or not. If we can, we 
also likely want to make some of the existing tools to rely on it 
instead of having them defining it in their files.

>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package=
, int *temp)
>> +{
>> +    xc_resource_entry_t entries[2] =3D {
>> +        (xc_resource_entry_t){
>> +            .idx =3D package ? MSR_DTS_PACKAGE_THERM_STATUS : MSR_DTS_T=
HERM_STATUS
>> +        },
>> +        (xc_resource_entry_t){ .idx =3D MSR_DTS_TEMPERATURE_TARGET },
>> +    };
>> +    struct xc_resource_op ops =3D {
>> +        .cpu =3D cpu,
>> +        .entries =3D entries,
>> +        .nr_entries =3D 2,
>> +    };
>> +    int tjmax;
> 
> Plain int? (Same for the last function parameter.)
> 
>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>> +
>> +    if ( ret <=3D 0 )
>> +        /* This CPU isn't online or can't query this MSR */
>> +        return ret ?: -EOPNOTSUPP;
>> +
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
>> +        fprintf(stderr, "[CPU%d] MSR_IA32_TEMPERATURE_TARGET is not sup=
ported, assume "
>> +                "tjmax=3D100=C2=B0C, readings may be incorrect\n", cpu)=
;
> 
> As per remarks elsewhere, I don't see why there is an IA32 infix here.
> 
>> +        tjmax =3D 100;
>> +    }
>> +
>> +    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
>> +    return 0;
>> +}
>> +
>> +
>> +void get_intel_temp(int argc, char *argv[])
>> +{
>> +    int temp, cpu =3D -1, socket;
> 
> Plain int question again, for temp and socket.
> 

socket should be unsigned. But temp (as being CPU temperature) can 
actually be negative (even though it is going to be quite specific).
The use of int here is consistent with what Linux coretemp uses to store 
temperatures.

>> +    bool has_data =3D false;
>> +
>> +    if (argc > 0)
> 
> This and ...
> 
>> +        parse_cpuid(argv[0], &cpu);
>> +
>> +    if (cpu !=3D -1)
> 
> ... this if() don't fit the (hypervisor) style used elsewhere.
> 

ok

> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



