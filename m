Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB8299673
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 20:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12559.32687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7tM-0006QM-Of; Mon, 26 Oct 2020 19:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12559.32687; Mon, 26 Oct 2020 19:10:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7tM-0006Px-LA; Mon, 26 Oct 2020 19:10:52 +0000
Received: by outflank-mailman (input) for mailman id 12559;
 Mon, 26 Oct 2020 19:10:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIL/=EB=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kX7tK-0006Ps-Oe
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 19:10:50 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6b10a91-9c34-4d0e-948f-cfcfb83ba409;
 Mon, 26 Oct 2020 19:10:49 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1603739443797662.4635810614253;
 Mon, 26 Oct 2020 12:10:43 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oIL/=EB=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kX7tK-0006Ps-Oe
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 19:10:50 +0000
X-Inumbo-ID: c6b10a91-9c34-4d0e-948f-cfcfb83ba409
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c6b10a91-9c34-4d0e-948f-cfcfb83ba409;
	Mon, 26 Oct 2020 19:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603739448; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GDCeM5L6YvedesYSiQfvGBgHopYSJ6bojLWlnkx/GuDgt3IdUHhXgKnyCSqF3A6bY+Ba6GLUnsxL8rYXkOTfeMdvh2xgHPfsWNSmAwSo58/ckgC+bp5v/tiKxZtwL8pRwItwb7SOLY9KMkqICcKlnjW+T8P/J0oZfjcMLxhTJvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603739448; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GnzzDDnsedpzJAW4j4XsruJLatQ217ifyjkLgNGOKSc=; 
	b=kwoX9itmZs0E54F3xzFiia4dYPqLSmC1X+XpXPo4DoGhahS0wLxafQEjfVYxx1E+4n7KSUpXLJkuN22Fpno/z7cayDlQlC3r6wlVuznzZRoFqLDoIn0iG0siWwkR1I3cGaKDBCv/mm1bvh9SDlDMjLtyKoJU0yKiitg3SyzROd8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603739448;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=GnzzDDnsedpzJAW4j4XsruJLatQ217ifyjkLgNGOKSc=;
	b=Zg+31PWmjvsjkOScQFqkHT7iHpq662yZ6gT41GDhhxaTFLbn09rzbv82IgmcT9mS
	uRUfetq18HkiBQkKxVycGoL2oSExjIeweCC/O4RJQq6CfSkDyeLsMLA+YizjhOwZFjY
	B1486JfWcZQuyEQlBwcXKey4ZmA1Rsbt/F6+f8yA=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1603739443797662.4635810614253; Mon, 26 Oct 2020 12:10:43 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <f6d179ac-eccc-99e1-ee0f-ea0d7f5ed335@qubes-os.org>
 <6da1d0b4b573997ff24a3b5597e764d0dba7597d.camel@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Message-ID: <3137ae40-66a0-2f5f-4cb1-36082e3da982@qubes-os.org>
Date: Mon, 26 Oct 2020 20:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <6da1d0b4b573997ff24a3b5597e764d0dba7597d.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m0Gnag2sETvA4DdpQO6Y2I0A9WC1lGM9Y"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m0Gnag2sETvA4DdpQO6Y2I0A9WC1lGM9Y
Content-Type: multipart/mixed; boundary="eRGi8IqtYCqTIB1h7uMBjrzeOTWj2mlAb";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <3137ae40-66a0-2f5f-4cb1-36082e3da982@qubes-os.org>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <f6d179ac-eccc-99e1-ee0f-ea0d7f5ed335@qubes-os.org>
 <6da1d0b4b573997ff24a3b5597e764d0dba7597d.camel@suse.com>
In-Reply-To: <6da1d0b4b573997ff24a3b5597e764d0dba7597d.camel@suse.com>

--eRGi8IqtYCqTIB1h7uMBjrzeOTWj2mlAb
Content-Type: multipart/mixed;
 boundary="------------AE6B7013617E2D5FE752B446"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AE6B7013617E2D5FE752B446
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Le 10/26/20 =C3=A0 6:54 PM, Dario Faggioli a =C3=A9crit=C2=A0:
> On Mon, 2020-10-26 at 17:11 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
>> Le 10/26/20 =C3=A0 2:54 PM, Andrew Cooper a =C3=A9crit=C2=A0:
>>>> If anyone would have any idea of what's going on, that would be
>>>> very
>>>> appreciated. Thank you.
>>>
>>> Does booting Xen with `sched=3Dcredit` make a difference?
>>>
>>> ~Andrew
>>
>> Thank you Andrew. Since your mail I'm currently testing this on
>> production and it's clearly more stable than this morning. I will not
>> say yet it's solved because yesterday I had some few hours of
>> stability too. but clearly, it's encouraging because this morning it
>> was just hell every 15/30 minutes.
>>
> Ok, yes, let us know if the credit scheduler seems to not suffer from
> the issue.
>=20

Yes unfortunately, I had few hours of stability but it just end up to:

```
[15883.967829] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15883.967868] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D14879
[15883.967884] 	(detected by 0, t=3D60002 jiffies, g=3D460221, q=3D89)
[15883.967901] Sending NMI from CPU 0 to CPUs 12:
[15893.970590] rcu: rcu_sched kthread starved for 9994 jiffies! g460221 f=
0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D9
[15893.970622] rcu: RCU grace-period kthread stack dump:
[15893.970631] rcu_sched       R  running task        0    10      2 0x80=
004008
[15893.970645] Call Trace:
[15893.970658]  ? xen_hypercall_xen_version+0xa/0x20
[15893.970670]  ? xen_force_evtchn_callback+0x9/0x10
[15893.970679]  ? check_events+0x12/0x20
[15893.970687]  ? xen_restore_fl_direct+0x1f/0x20
[15893.970697]  ? _raw_spin_unlock_irqrestore+0x14/0x20
[15893.970708]  ? force_qs_rnp+0x6f/0x170
[15893.970715]  ? rcu_nocb_unlock_irqrestore+0x30/0x30
[15893.970724]  ? rcu_gp_fqs_loop+0x234/0x2a0
[15893.970732]  ? rcu_gp_kthread+0xb5/0x140
[15893.970740]  ? rcu_gp_init+0x470/0x470
[15893.970748]  ? kthread+0x115/0x140
[15893.970756]  ? __kthread_bind_mask+0x60/0x60
[15893.970764]  ? ret_from_fork+0x35/0x40
[16063.972793] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16063.972825] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D57364
[16063.972840] 	(detected by 5, t=3D240007 jiffies, g=3D460221, q=3D6439)=

[16063.972855] Sending NMI from CPU 5 to CPUs 12:
[16243.977769] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16243.977802] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D99504
[16243.977817] 	(detected by 11, t=3D420012 jiffies, g=3D460221, q=3D6710=
)
[16243.977830] Sending NMI from CPU 11 to CPUs 12:
[16253.980496] rcu: rcu_sched kthread starved for 10001 jiffies! g460221 =
f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D9
[16253.980528] rcu: RCU grace-period kthread stack dump:
[16253.980537] rcu_sched       R  running task        0    10      2 0x80=
004008
[16253.980550] Call Trace:
[16253.980563]  ? xen_hypercall_xen_version+0xa/0x20
[16253.980575]  ? xen_force_evtchn_callback+0x9/0x10
[16253.980584]  ? check_events+0x12/0x20
[16253.980592]  ? xen_restore_fl_direct+0x1f/0x20
[16253.980602]  ? _raw_spin_unlock_irqrestore+0x14/0x20
[16253.980613]  ? force_qs_rnp+0x6f/0x170
[16253.980620]  ? rcu_nocb_unlock_irqrestore+0x30/0x30
[16253.980629]  ? rcu_gp_fqs_loop+0x234/0x2a0
[16253.980637]  ? rcu_gp_kthread+0xb5/0x140
[16253.980645]  ? rcu_gp_init+0x470/0x470
[16253.980653]  ? kthread+0x115/0x140
[16253.980661]  ? __kthread_bind_mask+0x60/0x60
[16253.980669]  ? ret_from_fork+0x35/0x40
[16423.982735] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16423.982789] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D139435
[16423.982820] 	(detected by 10, t=3D600017 jiffies, g=3D460221, q=3D7354=
)
[16423.982842] Sending NMI from CPU 10 to CPUs 12:
[16433.984844] rcu: rcu_sched kthread starved for 10001 jiffies! g460221 =
f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D3
[16433.984875] rcu: RCU grace-period kthread stack dump:
[16433.984885] rcu_sched       R  running task        0    10      2 0x80=
004000
[16433.984897] Call Trace:
[16433.984910]  ? xen_hypercall_xen_version+0xa/0x20
[16433.984922]  ? xen_force_evtchn_callback+0x9/0x10
[16433.984931]  ? check_events+0x12/0x20
[16433.984939]  ? xen_restore_fl_direct+0x1f/0x20
[16433.984949]  ? _raw_spin_unlock_irqrestore+0x14/0x20
[16433.984960]  ? force_qs_rnp+0x6f/0x170
[16433.984967]  ? rcu_nocb_unlock_irqrestore+0x30/0x30
[16433.984976]  ? rcu_gp_fqs_loop+0x234/0x2a0
[16433.984984]  ? rcu_gp_kthread+0xb5/0x140
[16433.984992]  ? rcu_gp_init+0x470/0x470
[16433.985000]  ? kthread+0x115/0x140
[16433.985007]  ? __kthread_bind_mask+0x60/0x60
[16433.985015]  ? ret_from_fork+0x35/0x40
[16603.987677] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16603.987710] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D179313
[16603.987725] 	(detected by 0, t=3D780022 jiffies, g=3D460221, q=3D7869)=

[16603.987740] Sending NMI from CPU 0 to CPUs 12:
[16783.992658] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16783.992710] rcu: 	12-...0: (75 ticks this GP) idle=3D5c6/1/0x400000000=
0000000 softirq=3D139356/139357 fqs=3D219106
[16783.992741] 	(detected by 13, t=3D960027 jiffies, g=3D460221, q=3D8300=
)
[16783.992768] Sending NMI from CPU 13 to CPUs 12:
[16793.995873] rcu: rcu_sched kthread starved for 10000 jiffies! g460221 =
f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D4
[16793.995906] rcu: RCU grace-period kthread stack dump:
[16793.995915] rcu_sched       R  running task        0    10      2 0x80=
004000
[16793.995930] Call Trace:
[16793.995948]  ? xen_hypercall_xen_version+0xa/0x20
[16793.995963]  ? xen_force_evtchn_callback+0x9/0x10
[16793.995972]  ? check_events+0x12/0x20
[16793.995979]  ? xen_restore_fl_direct+0x1f/0x20
[16793.995992]  ? _raw_spin_unlock_irqrestore+0x14/0x20
[16793.996004]  ? force_qs_rnp+0x6f/0x170
[16793.996012]  ? rcu_nocb_unlock_irqrestore+0x30/0x30
[16793.996021]  ? rcu_gp_fqs_loop+0x234/0x2a0
[16793.996029]  ? rcu_gp_kthread+0xb5/0x140
[16793.996037]  ? rcu_gp_init+0x470/0x470
[16793.996046]  ? kthread+0x115/0x140
[16793.996054]  ? __kthread_bind_mask+0x60/0x60
[16793.996062]  ? ret_from_fork+0x35/0x40
```

> I'm curious about another thing, though. You mentioned, in your
> previous email (and in the subject :-)) that this is a 4.13 -> 4.14
> issue for you?

This is indeed happening since I've updated xen-4.14 from 4.13 and 4.13 w=
as totally stable for me. Server was running for months without any issue=
=2E
 =20
> Does that mean that the problem was not there on 4.13?
>=20
> I'm asking because Credit2 was already the default scheduler in 4.13.
>=20
> So, unless you were configuring things differently, you were already
> using it there.

Normally, there is a new custom patch for S3 resume from Marek (in CC) an=
d he would be much more able than me to precise some very specific change=
s with respect to 4.13.

> If this is the case, it would hint at the fact that something that
> changed between .13 and .14 could be the cause.
>=20
> Regards
>=20

Thank you again for your help.

--------------AE6B7013617E2D5FE752B446
Content-Type: application/pgp-keys;
 name="OpenPGP_0x484010B5CDC576E2.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x484010B5CDC576E2.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFwkq3EBEADcfyaOkeuf+g96S1ieq05tJ8vTGsQrNXQ5RDE7ffagL0+EpfIP3x73x5Q0D=
y2r
UVQ+oN1DHcueNL70RtNs9BFnoW0KZnskbT4nEJ9wQCQa22lQaIk9kCNVddh2HJKljtd8vtovi=
97s
WIjtzxx5Qwc2md0DY9AHhNC4KqKIW3tSPC17UsI8fASoNAHItYtyn2bO67p8pCIvltoBrYnEl=
D1P
yp5IGWiD2/YD325iPl2+qHVkUSWmb92hRRU19Rg+Uds8bVHqhz4cOqIE7jpXgYzTN/kq8sxBM=
h2O
rQ/bSxLaccaNApIVSZVSAasVJfdscNDL9fjkHERK/AiSTleHrsgLf4PLw5koqPs/6JEIVI+t0=
pyg
+Pa8uwFoeYTPrLSlw0f7bXSmlVfv8g7M7RWmk3T5QIpeHA0j3lEZNbYRXzkI91HCt40X2bTb2=
jTK
gvB9jQjEarpk6euvGs2Ig/U4MlUy3pG5Ehd2Ebn8Rz31JXpaA/GPaJ5DjzV0q9mkYkGDLYI3J=
/J+
s2u0Kr0VswLaIN3WJn7kKEDwfc4s2kaAYfblE/p0zVirEVBum723MFH4DxhTrOoWgta2nyRHO=
oi0
z0EVhYA+D86mFPWKb9roWvtnmFlssggGmqbJEMvtLbYnlSt3v32nfUXh12aQPwU/LCGIzq4oF=
NVr
Np3aWPnSajLPpQARAQABzTxGcsOpZMOpcmljIFBpZXJyZXQgKGZlcGl0cmUpIDxmcmVkZXJpY=
y5w
aWVycmV0QHF1YmVzLW9zLm9yZz7CwXgEEwECACIFAlwkq3ECGwMGCwkIBwMCBhUIAgkKCwQWA=
gMB
Ah4BAheAAAoJEEhAELXNxXbiPLkQAI6kEDyLl0TpvRDOanuD5YkVHLEYVuG62CJNwMjFoFRgZ=
Jnl
+Fb5HBgthU9lBdMqNySg+s8yekM9KRlUHKYjwAsyjPIjRtca4bH3V11/waKpvPBgPsC75CxSZ=
9uI
TprfEqX7V2OLbrYW94qwR8jX+n/wlEGG3pbfXG7FTnjxQWM0E0aSvO0Yb5EkjiJ7cwEiqvL04=
Uek
t5I2Zc8iRDF9kneINiNhzRtvrR1UN6KtiZNSk2NsLOptrUQ/1AU5jwH4mnQQymtYDsWddlRoD=
RC/
bsAow7cBudj+lekM3cNRZOazKZx5UPnN8nqvD7FqeAcZBVyrHZ4hcWqABaJEPv6CCHRiLQnGR=
9ze
2O5Yh+/BunrOJdjdsib1ZECH9GtIcj4mmPAN84NO4r8a6Sn9jsXkd2Wj2N5wNrZMPslhfiaW2=
VHT
fLmAOt+wRwLRsFfqLykF8hMlNXXE4frxotwa6+PTd48Ws9H9aalSs0lebsG0623b4mBjy1cox=
FUw
eclPInXsPEdu/Yu2r7xrgGouXH8KgDhqlqq60UaA5n/0XhIeZ8tBTYs+1B5/C9TjvNAUsBkob=
1Ep
fW3J4Gq14GqwK+eodOTL5t2f2PWN/IQyop/j0FMgVU5/PUS0pciz5ybyIJBLhbsJBvKbxM/Ny=
xHr
mNwGEknpoeq+XT8rEJ+/Ag8Wnjl0zsFNBFwkq3EBEADAPJdyFy4KeYpuGATWwWCNHe8XNVqBp=
lV0
yVlT5pSiCyA3UK34JlGX9YJOj/FlMZGgh61vbiK+piRjm/lyb128wpMjnoOmqpbSLbra8NP8M=
u5F
ZMcv8OxrSIr/RHq2heFg1j11QOMGwe6vPC918qpzmiaYj2qpKY/RYsG8V+9+dpLEU75+mpHU7=
GlE
CfPmHYbnsismL/4+xH+8BG56yg0UFbfrNYonIQFSn5k/w6i7jt7M++ZmWfEV5nCP2qvzeYDGA=
L6B
bWVOjuDhrKsAIKnomCyy+MjcVP955PVdN2+OlPJng07oKtQr5aNCaNpv/i4gLO1IScdfDwm6g=
dfB
2Zg/7jTJrKw0kWPFl9rHfN7dLAR28u3uT8Rhicjdd7hgYlDWdbImhNL/Z7iL3eayH7T9qAVNU=
587
MhWvIREyE1gj22cs0e1m6qMFpbFYG0709N2UwlpAH+Pd35bTi9q2o1pH91xBYH6QvvrwsuVYH=
wuc
3xXLRVRXWXY8xvNFSlY1LB8A46JOtV/ZodYDyhxVGbeWp820cb0s1f689XCXqFYAzTfCit+Ee=
boY
ORN5CGioXzS+z0S9IhPbdUuvqs7xvC248bM7nm84YdgVM7HWybOtpRpWpycwGs73IvbxyLE9a=
Pe/
Zw4PTKWvbJlcFioofLwTQE1XvWomFPD9LLrBl5NUjQARAQABwsFfBBgBAgAJBQJcJKtxAhsMA=
AoJ
EEhAELXNxXbilSkP/2NcazvUDGyQLm7tFp4HNqSQfFJ3+chzxfOOdNtdWE+RFetyx9R8DBGrP=
X8h
jITWD9ZA2bbZZ+J+a39vyY7bNZkCGbWzPGK//O1cInL4Ecmj7Xm8DXjk3E2Xzv1YrZk/GBz9x=
K8m
WXwhn90SHNadEf28ghMXcmUJSqT+KTxQQjUVaEtQDdzQnYQKh/dHxs760QSAnXkWr0YVYxk8q=
8aa
+G8iAkNJcb+Wx5gWEw4ft3HpKMRq74OQvWayy0fXpTlusdnvZs0VVMeRpCW6iCt9UmsbfG6Ny=
f2M
KKbWRJntjy8mjJiFjiJ2j9s4yNIookRv8IfocULuhnx5FWsvIzX2Vwcd7G5objnY1DlCNQrhJ=
Us/
geoCUBjBJp7sfbHakWfTKxZjFsuCXT1dCEN7JXX6ABOshzDTwB0kq7Bq/EkOzPDQGfOPoX2h1=
KjH
uvGWw5cBe8WLnEuhIyf/DWfMS1LbjFB4JlMUEcood5xvE4owpfZog+0a9gpBS6cg9bMgRUex1=
C+w
3fudJdPQwIRAjJgac0jTT6uDY8re9RhBDv83PRSM7AzxqEFvDj8K46dg1XvJcKs7K5PXpm5Pw=
4st
VEAxIks5uR62wxygImkdvgjQRzJe4JWwAniBWsZG+cNYj6xcItqkupIb4PeOWgNQQMhGv8Dnb=
AdO
OOnumAXWq0+wl5uP
=3DRWX1
-----END PGP PUBLIC KEY BLOCK-----

--------------AE6B7013617E2D5FE752B446--

--eRGi8IqtYCqTIB1h7uMBjrzeOTWj2mlAb--

--m0Gnag2sETvA4DdpQO6Y2I0A9WC1lGM9Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+XHzAACgkQSEAQtc3F
duJElA//RffoOh8RaBMCkrsTw7YWCMuL3rO1cXBbV89Gojllfl033Gk1Kbo6dTBU
KYQvM2S3wNJ3TCmUjTD6kBp5o8W7/AXkvhXKItS3fVYx6Yx5WX8iTMDrwTyiBtDa
pKDkObIf+WZlhWYKLPaP+N9sIu82IygNuFb6Xy6vsingz6AS8z4/cjnAPxHF3FQZ
Bp0O8jVCE5kyzQK3NTZJeBs4dB7kgZq8mdls9PWuQBaEHDvyuzfNjJm7ea0wUki+
9LaPKkqnawV9E+LhosSjXMoi2fFsszqC+qu+W2F919GoWFR8lL6WT/ey7Sb/1yHq
g6iBnoRTLCFN0osqsooMItAj/WCeymYSVr27yiHVH4Gp0TwD7zFSodXoi2BXiVWm
HHyV4dccRjCEM3hg89pUpQOWMBs+YRuZ2Zh152P0xpZA2yRuWaYdIzajgZ6UANg3
U/G7Rr6iJS0nNoPG55xwEJ2QPIRp8n0LYIPOZgCVrNlXadIdBuqwcow4rIyjGqmG
y2PMD0slLbq3ZjvPB5Am+ZBiOUnaIJKHHOBM/Mpd8+FuNE/WuYJrq0KjqVAV7D2H
o+YvW1k6HWK1rysVfhcChPF9FC7kvBq/71Q94zaeAUeIbWmYzf3j5bCZPR1Rnuxq
GHvJrKehNN8FIbmdWGONBafD1ZlvhBzPELFKg1Yr7C+cSbrZ7dE=
=DOOh
-----END PGP SIGNATURE-----

--m0Gnag2sETvA4DdpQO6Y2I0A9WC1lGM9Y--

