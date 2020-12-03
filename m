Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA62CDC41
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 18:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43891.78814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kksG2-0006Z2-AZ; Thu, 03 Dec 2020 17:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43891.78814; Thu, 03 Dec 2020 17:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kksG2-0006Yd-6y; Thu, 03 Dec 2020 17:19:06 +0000
Received: by outflank-mailman (input) for mailman id 43891;
 Thu, 03 Dec 2020 17:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kksG0-0006YY-Og
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 17:19:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68de2640-3324-4317-ba6b-1addd83ad69c;
 Thu, 03 Dec 2020 17:19:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1C42AC2E;
 Thu,  3 Dec 2020 17:19:01 +0000 (UTC)
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
X-Inumbo-ID: 68de2640-3324-4317-ba6b-1addd83ad69c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607015942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvLxnjWl8wJ1H2F26HsBTTSU4FyGjQtfNIv6PlKMQ2Q=;
	b=o3KGe2RV9/uS86SuBhHSEJAuf5hgG3KEuOfjl3lHAzI9O0DYppkDMa9/QLBfv15uu/dwsS
	C4iPymSz1bMaK/63jTzukqRQcad19On1tZNFWP4wZ+442O/VaSnGeSM/3l9iqZEwsJlN1l
	uTLZZ8RkhK+A1q8FiF0S8oBct+kFfpU=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d72cde2c-24ac-e1f5-b1e3-b746faf41406@suse.com>
Date: Thu, 3 Dec 2020 18:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zE5Jb3d3ChYCwnXO9sfA3nSVRjfjCWzsz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zE5Jb3d3ChYCwnXO9sfA3nSVRjfjCWzsz
Content-Type: multipart/mixed; boundary="4fjRtZhUgaxajFxlJUeChy7UzYNRYgTyq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <d72cde2c-24ac-e1f5-b1e3-b746faf41406@suse.com>
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
In-Reply-To: <00f601d6c996$ce3908d0$6aab1a70$@xen.org>

--4fjRtZhUgaxajFxlJUeChy7UzYNRYgTyq
Content-Type: multipart/mixed;
 boundary="------------B8483D927153A65F09AC8FF2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B8483D927153A65F09AC8FF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 18:07, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 03 December 2020 15:57
>> To: paul@xen.org
>> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Eslam Elnikety' <elnikety@a=
mazon.com>; 'Ian Jackson'
>> <iwj@xenproject.org>; 'Wei Liu' <wl@xen.org>; 'Anthony PERARD' <anthon=
y.perard@citrix.com>; 'Andrew
>> Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@ci=
trix.com>; 'Julien Grall'
>> <julien@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Chri=
stian Lindig'
>> <christian.lindig@citrix.com>; 'David Scott' <dave@recoil.org>; 'Volod=
ymyr Babchuk'
>> <Volodymyr_Babchuk@epam.com>; 'Roger Pau Monn=C3=A9' <roger.pau@citrix=
=2Ecom>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag=
, XEN_DOMCTL_CDF_evtchn_fifo,
>> ...
>>
>> On 03.12.2020 16:45, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 03 December 2020 15:23
>>>>
>>>> On 03.12.2020 13:41, Paul Durrant wrote:
>>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>>
>>>>> ...to control the visibility of the FIFO event channel operations
>>>>> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_pri=
ority) to
>>>>> the guest.
>>>>>
>>>>> These operations were added to the public header in commit d2d50c2f=
308f
>>>>> ("evtchn: add FIFO-based event channel ABI") and the first implemen=
tation
>>>>> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: impl=
ement
>>>>> EVTCHNOP_set_priority and add the set_priority hook") and 88910061e=
c61
>>>>> ("evtchn: add FIFO-based event channel hypercalls and port ops"). P=
rior to
>>>>> that, a guest issuing those operations would receive a return value=
 of
>>>>> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO operat=
ions but
>>>>> running on an older (pre-4.4) Xen would fall back to using the 2-le=
vel event
>>>>> channel interface upon seeing this return value.
>>>>>
>>>>> Unfortunately the uncontrolable appearance of these new operations =
in Xen 4.4
>>>>> onwards has implications for hibernation of some Linux guests. Duri=
ng resume
>>>>> from hibernation, there are two kernels involved: the "boot" kernel=
 and the
>>>>> "resume" kernel. The guest boot kernel may default to use FIFO oper=
ations and
>>>>> instruct Xen via EVTCHNOP_init_control to switch from 2-level to FI=
FO. On the
>>>>> other hand, the resume kernel keeps assuming 2-level, because it wa=
s hibernated
>>>>> on a version of Xen that did not support the FIFO operations.
>>>>>
>>>>> To maintain compatibility it is necessary to make Xen behave as it =
did
>>>>> before the new operations were added and hence the code in this pat=
ch ensures
>>>>> that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event chan=
nel
>>>>> operations will again result in -ENOSYS being returned to the guest=
=2E
>>>>
>>>> I have to admit I'm now even more concerned of the control for such
>>>> going into Xen, the more with the now 2nd use in the subsequent patc=
h.
>>>> The implication of this would seem to be that whenever we add new
>>>> hypercalls or sub-ops, a domain creation control would also need
>>>> adding determining whether that new sub-op is actually okay to use b=
y
>>>> a guest. Or else I'd be keen to up front see criteria at least rough=
ly
>>>> outlined by which it could be established whether such an override
>>>> control is needed.
>>>>
>>>
>>> Ultimately I think any new hypercall (or related set of hypercalls) a=
dded to the ABI needs to be
>> opt-in on a per-domain basis, so that we know that from when a domain =
is first created it will not see
>> a change in its environment unless the VM administrator wants that to =
happen.
>>
>> A new hypercall appearing is a change to the guest's environment, yes,=

>> but a backwards compatible one. I don't see how this would harm a gues=
t.
>=20
> Say we have a guest which is aware of the newer Xen and is coded to use=
 the new hypercall *but* we start it on an older Xen where the new hyperc=
all is not implemented. *Then* we migrate it to the newer Xen... the new =
hypercall suddenly becomes available and changes the guest behaviour. In =
the worst case, the guest is sufficiently confused that it crashes.
>=20
>> This and ...
>>
>>>> I'm also not convinced such controls really want to be opt-in rather=

>>>> than opt-out.
>>>
>>> They really need to be opt-in I think. From a cloud provider PoV it i=
s important that nothing in a
>> customer's environment changes unless we want it to. Otherwise we have=
 no way to deploy an updated
>> hypervisor version without risking crashing their VMs.
>>
>> ... this sound to me more like workarounds for buggy guests than
>> functionality the hypervisor _needs_ to have. (I can appreciate
>> the specific case here for the specific scenario you provide as
>> an exception.)
>=20
> If we want to have a hypervisor that can be used in a cloud environment=
 then Xen absolutely needs this capability.
>=20
>>
>>>>> --- a/xen/arch/arm/domain.c
>>>>> +++ b/xen/arch/arm/domain.c
>>>>> @@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct xen_domc=
tl_createdomain *config)
>>>>>       unsigned int max_vcpus;
>>>>>
>>>>>       /* HVM and HAP must be set. IOMMU may or may not be */
>>>>> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
>>>>> +    if ( (config->flags &
>>>>> +          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) !=3D=

>>>>>            (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>>>>>       {
>>>>>           dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -2478,7 +2478,8 @@ void __init create_domUs(void)
>>>>>           struct domain *d;
>>>>>           struct xen_domctl_createdomain d_cfg =3D {
>>>>>               .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>> -            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>> +            .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>> +                     XEN_DOMCTL_CDF_evtchn_fifo,
>>>>>               .max_evtchn_port =3D -1,
>>>>>               .max_grant_frames =3D 64,
>>>>>               .max_maptrack_frames =3D 1024,
>>>>> --- a/xen/arch/arm/setup.c
>>>>> +++ b/xen/arch/arm/setup.c
>>>>> @@ -805,7 +805,8 @@ void __init start_xen(unsigned long boot_phys_o=
ffset,
>>>>>       struct bootmodule *xen_bootmodule;
>>>>>       struct domain *dom0;
>>>>>       struct xen_domctl_createdomain dom0_cfg =3D {
>>>>> -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>> +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>> +                 XEN_DOMCTL_CDF_evtchn_fifo,
>>>>>           .max_evtchn_port =3D -1,
>>>>>           .max_grant_frames =3D gnttab_dom0_frames(),
>>>>>           .max_maptrack_frames =3D -1,
>>>>> --- a/xen/arch/x86/setup.c
>>>>> +++ b/xen/arch/x86/setup.c
>>>>> @@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const =
module_t *image,
>>>>>                                            const char *loader)
>>>>>   {
>>>>>       struct xen_domctl_createdomain dom0_cfg =3D {
>>>>> -        .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_in=
tegrity : 0,
>>>>> +        .flags =3D XEN_DOMCTL_CDF_evtchn_fifo |
>>>>> +                 (IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_int=
egrity : 0),
>>>>>           .max_evtchn_port =3D -1,
>>>>>           .max_grant_frames =3D -1,
>>>>>           .max_maptrack_frames =3D -1,
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -307,7 +307,7 @@ static int sanitise_domain_config(struct xen_do=
mctl_createdomain *config)
>>>>>            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>>>>              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |=

>>>>>              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>>>>> -           XEN_DOMCTL_CDF_nested_virt) )
>>>>> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo=
) )
>>>>>       {
>>>>>           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->f=
lags);
>>>>>           return -EINVAL;
>>>>
>>>> All of the hunks above point out a scalability issue if we were to
>>>> follow this route for even just a fair part of new sub-ops, and I
>>>> suppose you've noticed this with the next patch presumably touching
>>>> all the same places again.
>>>
>>> Indeed. This solution works for now but is probably not what we want =
in the long run. Same goes for
>> the current way we control viridian features via an HVM param. It is g=
ood enough for now IMO since
>> domctl is not a stable interface. Any ideas about how we might impleme=
nt a better interface in the
>> longer term?
>>
>> While it has other downsides, J=C3=BCrgen's proposal doesn't have any
>> similar scalability issue afaics. Another possible model would
>> seem to be to key new hypercalls to hypervisor CPUID leaf bits,
>> and derive their availability from a guest's CPUID policy. Of
>> course this won't work when needing to retrofit guarding like
>> you want to do here.
>>
>=20
> Ok, I'll take a look hypfs as an immediate solution, if that's preferre=
d.

Paul, if you'd like me to add a few patches to my series doing the basic
framework (per-domain nodes, interfaces for setting struct domain fields
via hypfs), I can do that. You could then concentrate on the tools side.


Juergen

--------------B8483D927153A65F09AC8FF2
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------B8483D927153A65F09AC8FF2--

--4fjRtZhUgaxajFxlJUeChy7UzYNRYgTyq--

--zE5Jb3d3ChYCwnXO9sfA3nSVRjfjCWzsz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/JHgQFAwAAAAAACgkQsN6d1ii/Ey//
egf/Vvc+vb5qf8td5ppHy5qVajun3rzQ+tD79/H9p7k6HQCY1runcSKhmUSyxvm5W+EZJFg3GXap
3udrelnxdLgJidUm1JnCihWSXp6nkZCclqnv3JT+G6s0zQkXAHFkccsgNLVWqR7clLJq8df1pi5V
pD6QVLzcgH83bbfBfKdj0C0BimquXOx2GLCn/AvvKvRdkywPY6qNj6k7gYr1QKNdN7Hs1WqkJiSW
TvdLZbRLMWA8Pv2Xqs/nEn+DGf6tAfbb4x4IBNYnR6k8mJAlEjkNoVzeldtdC80QpeYqJu4yDBbK
Gu0+SCdOVPzWmsxBiindUzwU+++pIYcqRoEYaVItmw==
=4JFj
-----END PGP SIGNATURE-----

--zE5Jb3d3ChYCwnXO9sfA3nSVRjfjCWzsz--

