Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11E4906F4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258115.444143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Px4-00079T-8D; Mon, 17 Jan 2022 11:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258115.444143; Mon, 17 Jan 2022 11:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Px4-00077a-57; Mon, 17 Jan 2022 11:13:30 +0000
Received: by outflank-mailman (input) for mailman id 258115;
 Mon, 17 Jan 2022 11:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaPS=SB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9Px2-00077G-PU
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:13:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e739e35-7786-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:13:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0197921122;
 Mon, 17 Jan 2022 11:13:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B32CE13AE2;
 Mon, 17 Jan 2022 11:13:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Me1iKlZP5WGncQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 17 Jan 2022 11:13:26 +0000
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
X-Inumbo-ID: 7e739e35-7786-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642418007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MHQU4SguvEvAxPxcRApfueFwZ+ZGVAMXWXUu2pVpxD8=;
	b=FAcz/wejdF8X0HqvtXeQfbXdjYYa1aP/iVnL4ZpB++vK5inOqbV7S74HAyXVvFWKAc2fEK
	1D75CGLZQHtlYryC3fMySHobIUhSEh0ZJ53dtD86fGcod/hYvWTAFtmo0YOsPK0Zui62Jb
	s5GhRh4Jq8BkmX03xx8WjKnHQt7ssDk=
Subject: Re: sched=null vwfi=native and call_rcu()
To: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, "julien@xen.org" <julien@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
 <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
 <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
Date: Mon, 17 Jan 2022 12:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XGlj6sSaJbXukYxxtj91O8FWWiYEGRUCD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XGlj6sSaJbXukYxxtj91O8FWWiYEGRUCD
Content-Type: multipart/mixed; boundary="TUxQdIlz1eOkHPxUbbTMvg3sR7jAcbPB7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, "julien@xen.org" <julien@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Message-ID: <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
Subject: Re: sched=null vwfi=native and call_rcu()
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
 <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
 <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
In-Reply-To: <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>

--TUxQdIlz1eOkHPxUbbTMvg3sR7jAcbPB7
Content-Type: multipart/mixed;
 boundary="------------3AA6DD06B22624A73E490CD9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3AA6DD06B22624A73E490CD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.01.22 12:05, George Dunlap wrote:
>=20
>=20
>> On Jan 14, 2022, at 9:01 PM, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
>>
>> On Fri, 14 Jan 2022, Dario Faggioli wrote:
>>> On Thu, 2022-01-06 at 17:52 -0800, Stefano Stabellini wrote:
>>>> On Thu, 6 Jan 2022, Julien Grall wrote:
>>>>>
>>>>> This issue and solution were discussed numerous time on the ML. In
>>>>> short, we
>>>>> want to tell the RCU that CPU running in guest context are always
>>>>> quiesced.
>>>>> For more details, you can read the previous thread (which also
>>>>> contains a link
>>>>> to the one before):
>>>>>
>>>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fxen-devel%2Ffe3dd9f0-b035-01fe-3e01-ddf065f182ab%40cod=
iax.se%2F&amp;data=3D04%7C01%7CGeorge.Dunlap%40citrix.com%7Cb6795e0be3af4=
16841a408d9d7a12030%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C63777790=
9305566330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D9%2BoiFfdK3rGAeWFSNCRu5aS=
uYgql1XZcaGJgT3aRsOA%3D&amp;reserved=3D0
>>>>
>>>> Thanks Julien for the pointer!
>>>>
>>>> Dario, I forward-ported your three patches to staging:
>>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Ftree%2Frcu-qu=
iet&amp;data=3D04%7C01%7CGeorge.Dunlap%40citrix.com%7Cb6795e0be3af416841a=
408d9d7a12030%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C63777790930556=
6330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DvrNN5KgwXj93ZThreIDNB7UgKJdPNz%=
2BoL98b%2FoopN8w%3D&amp;reserved=3D0
>>>>
>>> Hi Stefano!
>>>
>>> I definitely would like to see the end of this issue, so thanks a lot=

>>> for your interest and your help with the patches.
>>>
>>>> I can confirm that they fix the bug. Note that I had to add a small
>>>> change on top to remove the ASSERT at the beginning of
>>>> rcu_quiet_enter:
>>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fcommit%2F6fc0=
2b90814d3fe630715e353d16f397a5b280f9&amp;data=3D04%7C01%7CGeorge.Dunlap%4=
0citrix.com%7Cb6795e0be3af416841a408d9d7a12030%7C335836de42ef43a2b145348c=
2ee9ca5b%7C0%7C0%7C637777909305566330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
vjxT35b%2FglqzzA4DCLqTjbo0bAfOjtLcvN90OFs8U9Q%3D&amp;reserved=3D0
>>>>
>>> Yeah, that should be fine.
>>>
>>>> Would you be up for submitting them for upstreaming? I would prefer
>>>> if
>>>> you send out the patches because I cannot claim to understand them
>>>> completely (except for the one doing renaming :-P )
>>>>
>>> Haha! So, I am up for properly submitting, but there's one problem. A=
s
>>> you've probably got, the idea here is to use transitions toward the
>>> guest and inside the hypervisor as RCU quiescence and "activation"
>>> points.
>>>
>>> Now, on ARM, that just meant calling rcu_quiet_exit() in
>>> enter_hypervisor_from_guest() and calling rcu_quiet_enter() in
>>> leave_hypervisor_to_guest(). Nice and easy, and even myself --and I'm=

>>> definitely not an ARM person-- cloud understand it (although with som=
e
>>> help from Julien) and put the patches together.
>>>
>>> However, the problem is really arch independent and, despite not
>>> surfacing equally frequently, it affects x86 as well. And for x86 the=

>>> situation is by far not equally nice, when it comes to identifying al=
l
>>> the places from where to call rcu_quiet_{enter,exit}().
>>>
>>> And finding out where to put them, among the various functions that w=
e
>>> have in the various entry.S variants is where I stopped. The plan was=

>>> to get back to it, but as shamefully as it sounds, I could not do tha=
t
>>> yet.
>>>
>>> So, if anyone wants to help with this, handing over suggestions for
>>> potential good spots, that would help a lot.
>>
>> Unfortunately I cannot volunteer due to time and also because I wouldn=
't
>> know where to look and I don't have a reproducer or a test environment=

>> on x86. I would be flying blind.
>>
>>
>>> Alternatively, we can submit the series as ARM-only... But I fear tha=
t
>>> the x86 side of things would then be easily forgotten. :-(
>>
>> I agree with you on this, but at the same time we are having problems
>> with customers in the field -- it is not like we can wait to solve the=

>> problem on ARM any longer. And the issue is certainly far less likely =
to
>> happen on x86 (there is no vwfi=3Dnative, right?) In other words, I th=
ink
>> it is better to have half of the solution now to solve the worst part =
of
>> the problem than to wait more months for a full solution.
>=20
> An x86 equivalent of vwfi=3Dnative could be implemented easily, but AFA=
IK nobody has asked for it yet.  I agree that we need to fix if for ARM, =
and so in the absence of someone with the time to fix up the x86 side, I =
think fixing ARM-only is the way to go.
>=20
> It would be good if we could add appropriate comments warning anyone wh=
o implements `hlt=3Dnative` on x86 the problems they=E2=80=99ll face and =
how to fix them.  Not sure the best place to do that; in the VMX / SVM co=
de that sets the exit for HLT &c?

But wouldn't a guest in a busy loop on x86 with NULL scheduler suffer
from the same problem?

And wouldn't that be a problem for PV guests, too?


Juergen

--------------3AA6DD06B22624A73E490CD9
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------3AA6DD06B22624A73E490CD9--

--TUxQdIlz1eOkHPxUbbTMvg3sR7jAcbPB7--

--XGlj6sSaJbXukYxxtj91O8FWWiYEGRUCD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHlT1YFAwAAAAAACgkQsN6d1ii/Ey9Y
Hwf+Ikk+WDVayiMbfrv13iI2bD7SE597j6OcBLMX1biP72dmxymvArDn1h2H2XmjvIPtkV6SUfJ1
bZAKYsT05BXVIfeBP3APhzL4Rr6N6AzH5q8BBi1Jm4eIUlWNw+D3A5F2v+A5S607WF8yo5nTkuwv
lTIJcazJRO909GcHMIYV/osxeg8yZRyG8Js6bd7ewquCyHE382X3BKFVdpn3fdoUg80yGyKGuCFH
3uBAlvTba1MFZ0UXrj+yN9rPdzM2vebtkSt4dxUSL1j+Xpcp8/fLzwTYnMeCW3m5GkXMUiign0XO
aWaNQDxIzcDfgiXRjiElKvcuzbuO6/02hKXti9MfJQ==
=D2HQ
-----END PGP SIGNATURE-----

--XGlj6sSaJbXukYxxtj91O8FWWiYEGRUCD--

