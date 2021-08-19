Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7C3F1480
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 09:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168407.307478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGcjd-0000wV-02; Thu, 19 Aug 2021 07:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168407.307478; Thu, 19 Aug 2021 07:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGcjc-0000tF-SD; Thu, 19 Aug 2021 07:45:08 +0000
Received: by outflank-mailman (input) for mailman id 168407;
 Thu, 19 Aug 2021 07:45:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGcjb-0000t9-Dy
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 07:45:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d73e134-00c1-11ec-a5c2-12813bfff9fa;
 Thu, 19 Aug 2021 07:45:04 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DC51200A8;
 Thu, 19 Aug 2021 07:45:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5809D13756;
 Thu, 19 Aug 2021 07:45:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ROCAE/8LHmHfCwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 07:45:03 +0000
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
X-Inumbo-ID: 5d73e134-00c1-11ec-a5c2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629359103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZO7dUe99EUiJ3Qavs68KpY6YoUgmbP8LurbbXQwxPVM=;
	b=PZzL74CgEArWGgsQuKux0Wj6i+qw9UDWe59Zpudz48vD0zUHK+569ss3EWjaockUvQ9tq+
	xeyVPeMm5t99ozeKJ18bg5HV+NoyBOdWkC5zB6yBhwEclYLzhKJ8+ytyBXLOnGvDh/LFNF
	LuAUjVeJ05N49eLGrH5G4u8LBN2XNcE=
Subject: Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
References: <20210702142944.1698-1-jgross@suse.com>
 <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
Message-ID: <e7b0a267-6b9d-7bde-1d8b-75c602d5d74d@suse.com>
Date: Thu, 19 Aug 2021 09:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FQJwR1kyPb3jSlEpI47oXOJwipSV3jqDg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FQJwR1kyPb3jSlEpI47oXOJwipSV3jqDg
Content-Type: multipart/mixed; boundary="e7molK0gAN7XkTo1JSobeubRNXwwDLZwI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7b0a267-6b9d-7bde-1d8b-75c602d5d74d@suse.com>
Subject: Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
References: <20210702142944.1698-1-jgross@suse.com>
 <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
In-Reply-To: <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>

--e7molK0gAN7XkTo1JSobeubRNXwwDLZwI
Content-Type: multipart/mixed;
 boundary="------------C7717B2CA974C6DDC42E65BE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C7717B2CA974C6DDC42E65BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

PING!!!

On 16.07.21 08:47, Juergen Gross wrote:
> Ping?
>=20
> On 02.07.21 16:29, Juergen Gross wrote:
>> The core of a pv linux guest produced via "xl dump-core" is not usable=

>> as since kernel 4.14 only the linear p2m table is kept if Xen indicate=
s
>> it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
>> supporting the 3-level p2m tree only.
>>
>> Fix that by copying the functionality of map_p2m() from libxenguest to=

>> libxenctrl.
>>
>> Additionally the mapped p2m isn't of a fixed length now, so the
>> interface to the mapping functions needs to be adapted. In order not t=
o
>> add even more parameters, expand struct domain_info_context and use a
>> pointer to that as a parameter.
>>
>> This is a backport of upstream commit bd7a29c3d0b937ab542a.
>>
>> As the original patch includes a modification of a data structure
>> passed via pointer to a library function, the related function in the
>> library is renamed in order to be able to spot any external users of
>> that function. Note that it is extremely unlikely any such users
>> outside the Xen git tree are existing, so the risk to break any
>> existing programs is very unlikely. In case such a user is existing,
>> changing the name of xc_map_domain_meminfo() will at least avoid
>> silent breakage.
>>
>> Fixes: dc6d60937121 ("libxc: set flag for support of linear p2m list=20
>> in domain builder")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> =C2=A0 tools/include/xenguest.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
>> =C2=A0 tools/libs/ctrl/xc_core.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 5 +-
>> =C2=A0 tools/libs/ctrl/xc_core.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 8 +-
>> =C2=A0 tools/libs/ctrl/xc_core_arm.c |=C2=A0 23 +--
>> =C2=A0 tools/libs/ctrl/xc_core_x86.c | 256 +++++++++++++++++++++++++++=
+------
>> =C2=A0 tools/libs/ctrl/xc_private.h=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 tools/libs/guest/xg_domain.c=C2=A0 |=C2=A0 17 +--
>> =C2=A0 7 files changed, 234 insertions(+), 78 deletions(-)
>>
>> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
>> index 217022b6e7..36a26deba4 100644
>> --- a/tools/include/xenguest.h
>> +++ b/tools/include/xenguest.h
>> @@ -700,8 +700,10 @@ struct xc_domain_meminfo {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t *pfn_type;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_table;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long p2m_size;
>> +=C2=A0=C2=A0=C2=A0 unsigned int p2m_frames;
>> =C2=A0 };
>> +#define xc_map_domain_meminfo xc_map_domain_meminfo_mod
>> =C2=A0 int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct xc_domain_meminfo *minfo);
>> diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/ctrl/xc_core.c
>> index b47ab2f6d8..9576bec5a3 100644
>> --- a/tools/libs/ctrl/xc_core.c
>> +++ b/tools/libs/ctrl/xc_core.c
>> @@ -574,8 +574,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sts =3D xc_core_arch_map_p=
2m(xch, dinfo->guest_width, &info,=20
>> live_shinfo,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &p2m, &dinfo=
->p2m_size);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sts =3D xc_core_arch_map_p=
2m(xch, dinfo, &info, live_shinfo,=20
>> &p2m);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( sts !=3D 0=
 )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto out;
>> @@ -945,7 +944,7 @@ out:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( memory_map !=3D NULL )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(memory_map=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( p2m !=3D NULL )
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(p2m, PAGE_SIZE * P2=
M_FL_ENTRIES);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(p2m, PAGE_SIZE * di=
nfo->p2m_frames);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( p2m_array !=3D NULL )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(p2m_array)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pfn_array !=3D NULL )
>> diff --git a/tools/libs/ctrl/xc_core.h b/tools/libs/ctrl/xc_core.h
>> index 36fb755da2..8ea1f93a10 100644
>> --- a/tools/libs/ctrl/xc_core.h
>> +++ b/tools/libs/ctrl/xc_core.h
>> @@ -138,14 +138,14 @@ int xc_core_arch_memory_map_get(xc_interface *xc=
h,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xc_dominfo_t *info,=20
>> shared_info_any_t *live_shinfo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xc_core_memory_map_t =
**mapp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *nr_entr=
ies);
>> -int xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width,=

>> +int xc_core_arch_map_p2m(xc_interface *xch, struct=20
>> domain_info_context *dinfo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 xc_dominfo_t *info, shared_info_any_t=20
>> *live_shinfo,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xen_pfn_t **live_p2m, unsigned long *pfnp);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xen_pfn_t **live_p2m);
>> -int xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int=20
>> guest_width,
>> +int xc_core_arch_map_p2m_writable(xc_interface *xch, struct=20
>> domain_info_context *dinfo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xc_dominf=
o_t *info,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_in=
fo_any_t *live_shinfo,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t **live_p=
2m, unsigned long=20
>> *pfnp);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t **live_p=
2m);
>> =C2=A0 int xc_core_arch_get_scratch_gpfn(xc_interface *xch, uint32_t d=
omid,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_pfn_t=
 *gpfn);
>> diff --git a/tools/libs/ctrl/xc_core_arm.c=20
>> b/tools/libs/ctrl/xc_core_arm.c
>> index 7b587b4cc5..93765a565f 100644
>> --- a/tools/libs/ctrl/xc_core_arm.c
>> +++ b/tools/libs/ctrl/xc_core_arm.c
>> @@ -66,33 +66,24 @@ xc_core_arch_memory_map_get(xc_interface *xch,=20
>> struct xc_core_arch_context *unus
>> =C2=A0 static int
>> =C2=A0 xc_core_arch_map_p2m_rw(xc_interface *xch, struct=20
>> domain_info_context *dinfo, xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long *pfnp, int rw)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m, int rw)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D ENOSYS;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> =C2=A0 }
>> =C2=A0 int
>> -xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width,=20
>> xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long *pfnp)
>> +xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context=20
>> *dinfo, xc_dominfo_t *info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context _dinfo =3D { .guest_wid=
th =3D guest_width };
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_dinfo;
>> -=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 live_shinfo,=
 live_p2m, pfnp, 0);
>> +=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info, l=
ive_shinfo,=20
>> live_p2m, 0);
>> =C2=A0 }
>> =C2=A0 int
>> -xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int=20
>> guest_width, xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_info_any_t *live_shinfo,=20
>> xen_pfn_t **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *pfnp)
>> +xc_core_arch_map_p2m_writable(xc_interface *xch, struct=20
>> domain_info_context *dinfo, xc_dominfo_t *info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_info_any_t *live_shinfo,=20
>> xen_pfn_t **live_p2m)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context _dinfo =3D { .guest_wid=
th =3D guest_width };
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_dinfo;
>> -=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 live_shinfo,=
 live_p2m, pfnp, 1);
>> +=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info, l=
ive_shinfo,=20
>> live_p2m, 1);
>> =C2=A0 }
>> =C2=A0 int
>> diff --git a/tools/libs/ctrl/xc_core_x86.c=20
>> b/tools/libs/ctrl/xc_core_x86.c
>> index cb76e6207b..c8f71d4b75 100644
>> --- a/tools/libs/ctrl/xc_core_x86.c
>> +++ b/tools/libs/ctrl/xc_core_x86.c
>> @@ -17,6 +17,7 @@
>> =C2=A0=C2=A0 *
>> =C2=A0=C2=A0 */
>> +#include <inttypes.h>
>> =C2=A0 #include "xc_private.h"
>> =C2=A0 #include "xc_core.h"
>> =C2=A0 #include <xen/hvm/e820.h>
>> @@ -65,34 +66,169 @@ xc_core_arch_memory_map_get(xc_interface *xch,=20
>> struct xc_core_arch_context *unus
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> -static int
>> -xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context=
=20
>> *dinfo, xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long *pfnp, int rw)
>> +static inline bool is_canonical_address(uint64_t vaddr)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 /* Double and single indirect references to the li=
ve P2M table */
>> -=C2=A0=C2=A0=C2=A0 xen_pfn_t *live_p2m_frame_list_list =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 xen_pfn_t *live_p2m_frame_list =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 /* Copies of the above. */
>> -=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_frame_list_list =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_frame_list =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 return ((int64_t)vaddr >> 47) =3D=3D ((int64_t)vad=
dr >> 63);
>> +}
>> -=C2=A0=C2=A0=C2=A0 uint32_t dom =3D info->domid;
>> -=C2=A0=C2=A0=C2=A0 int ret =3D -1;
>> -=C2=A0=C2=A0=C2=A0 int err;
>> -=C2=A0=C2=A0=C2=A0 int i;
>> +/* Virtual address ranges reserved for hypervisor. */
>> +#define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
>> +#define HYPERVISOR_VIRT_END_X86_64=C2=A0=C2=A0 0xFFFF87FFFFFFFFFFULL
>> -=C2=A0=C2=A0=C2=A0 if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->=
p2m_size) < 0 )
>> +#define HYPERVISOR_VIRT_START_X86_32 0x00000000F5800000ULL
>> +#define HYPERVISOR_VIRT_END_X86_32=C2=A0=C2=A0 0x00000000FFFFFFFFULL
>> +
>> +static xen_pfn_t *
>> +xc_core_arch_map_p2m_list_rw(xc_interface *xch, struct=20
>> domain_info_context *dinfo,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t dom, shared_info_any_t=20
>> *live_shinfo,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t p2m_cr3)
>> +{
>> +=C2=A0=C2=A0=C2=A0 uint64_t p2m_vaddr, p2m_end, mask, off;
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t p2m_mfn, mfn, saved_mfn, max_pfn;
>> +=C2=A0=C2=A0=C2=A0 uint64_t *ptes =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *mfns =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 unsigned int fpp, n_pages, level, n_levels, shift,=

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 idx_start, idx_end, idx, saved_idx;
>> +
>> +=C2=A0=C2=A0=C2=A0 p2m_vaddr =3D GET_FIELD(live_shinfo, arch.p2m_vadd=
r,=20
>> dinfo->guest_width);
>> +=C2=A0=C2=A0=C2=A0 fpp =3D PAGE_SIZE / dinfo->guest_width;
>> +=C2=A0=C2=A0=C2=A0 dinfo->p2m_frames =3D (dinfo->p2m_size - 1) / fpp =
+ 1;
>> +=C2=A0=C2=A0=C2=A0 p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_S=
IZE - 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( dinfo->guest_width =3D=3D 8 )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("Could not get maxim=
um GPFN!");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D 0x0000fffffffffff=
fULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_levels =3D 4;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2m_mfn =3D p2m_cr3 >> 12;=

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_canonical_address=
(p2m_vaddr) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 !is_canonical_address(p2m_end) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 p2m_end < p2m_vaddr ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_64 &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 p2m_end > HYPERVISOR_VIRT_START_X86_64) )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ER=
ROR("Bad virtual p2m address range %#" PRIx64 "-%#"=20
>> PRIx64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2m_vaddr, p2m_end);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 er=
rno =3D ERANGE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D 0x00000000fffffff=
fULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_levels =3D 3;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( p2m_cr3 & ~mask )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2=
m_mfn =3D ~0UL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2=
m_mfn =3D (uint32_t)((p2m_cr3 >> 12) | (p2m_cr3 << 20));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( p2m_vaddr > mask || p=
2m_end > mask || p2m_end <=20
>> p2m_vaddr ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_32 &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 p2m_end > HYPERVISOR_VIRT_START_X86_32) )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ER=
ROR("Bad virtual p2m address range %#" PRIx64 "-%#"=20
>> PRIx64,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2m_vaddr, p2m_end);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 er=
rno =3D ERANGE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 if ( dinfo->p2m_size < info->nr_pages=C2=A0 )
>> +=C2=A0=C2=A0=C2=A0 mfns =3D malloc(sizeof(*mfns));
>> +=C2=A0=C2=A0=C2=A0 if ( !mfns )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("p2m_size < nr_pages=
 -1 (%lx < %lx", dinfo->p2m_size,=20
>> info->nr_pages - 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("Cannot allocate mem=
ory for array of %u mfns", 1);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 mfns[0] =3D p2m_mfn;
>> +=C2=A0=C2=A0=C2=A0 off =3D 0;
>> +=C2=A0=C2=A0=C2=A0 saved_mfn =3D 0;
>> +=C2=A0=C2=A0=C2=A0 idx_start =3D idx_end =3D saved_idx =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 for ( level =3D n_levels; level > 0; level-- )
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_pages =3D idx_end - idx_=
start + 1;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptes =3D xc_map_foreign_pa=
ges(xch, dom, PROT_READ, mfns, n_pages);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !ptes )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PE=
RROR("Failed to map %u page table pages for p2m list",=20
>> n_pages);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(mfns);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift =3D level * 9 + 3;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idx_start =3D ((p2m_vaddr =
- off) & mask) >> shift;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idx_end =3D ((p2m_end - of=
f) & mask) >> shift;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idx =3D idx_end - idx_star=
t + 1;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfns =3D malloc(sizeof(*mf=
ns) * idx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfns )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ER=
ROR("Cannot allocate memory for array of %u mfns", idx);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( idx =3D idx_start; i=
dx <=3D idx_end; idx++ )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mf=
n =3D (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ( mfn =3D=3D 0 )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ERROR("Bad mfn %#lx during page table walk for vadd=
r=20
>> %#" PRIx64 " at level %d of p2m list",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn, off + ((ui=
nt64_t)idx << shift), level);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 errno =3D ERANGE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mf=
ns[idx - idx_start] =3D mfn;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Maximum pfn check at level 2. Same reasoning as for=20
>> p2m tree. */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ( level =3D=3D 2 )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( mfn !=3D saved_mfn )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saved_mfn =3D mfn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saved_idx =3D idx - idx_sta=
rt;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( level =3D=3D 2 )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ( saved_idx =3D=3D idx_end )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 saved_idx++;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ma=
x_pfn =3D ((xen_pfn_t)saved_idx << 9) * fpp;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ( max_pfn < dinfo->p2m_size )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dinfo->p2m_size =3D max_pfn;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dinfo->p2m_frames =3D (dinfo->p2m_size + fpp - 1) /=
 fpp;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_SI=
ZE - 1;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 idx_end =3D idx_start + saved_idx;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(ptes, n_pages * PAG=
E_SIZE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptes =3D NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off =3D p2m_vaddr & ((mask=
 >> shift) << shift);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return mfns;
>> +
>> + out:
>> +=C2=A0=C2=A0=C2=A0 free(mfns);
>> +=C2=A0=C2=A0=C2=A0 if ( ptes )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(ptes, n_pages * PAG=
E_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> +static xen_pfn_t *
>> +xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct=20
>> domain_info_context *dinfo,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t dom, shared_info_any_t=20
>> *live_shinfo)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /* Double and single indirect references to the li=
ve P2M table */
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *live_p2m_frame_list_list;
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *live_p2m_frame_list =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 /* Copies of the above. */
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_frame_list_list =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_frame_list;
>> +
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +=C2=A0=C2=A0=C2=A0 int i;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 live_p2m_frame_list_list =3D
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xc_map_foreign_=
range(xch, dom, PAGE_SIZE, PROT_READ,
>> @@ -151,10 +287,60 @@ xc_core_arch_map_p2m_rw(xc_interface *xch,=20
>> struct domain_info_context *dinfo, xc
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D P2M=
_FL_ENTRIES - 1; i >=3D 0; i-- )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 p2m_frame_list[i] =3D ((uint32_t *)p2m_frame_list)[i];
>> +=C2=A0=C2=A0=C2=A0 dinfo->p2m_frames =3D P2M_FL_ENTRIES;
>> +
>> +=C2=A0=C2=A0=C2=A0 return p2m_frame_list;
>> +
>> + out:
>> +=C2=A0=C2=A0=C2=A0 err =3D errno;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( live_p2m_frame_list_list )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_p2m_frame_list=
_list, PAGE_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( live_p2m_frame_list )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_p2m_frame_list=
, P2M_FLL_ENTRIES * PAGE_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 free(p2m_frame_list_list);
>> +
>> +=C2=A0=C2=A0=C2=A0 errno =3D err;
>> +
>> +=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> +static int
>> +xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context=
=20
>> *dinfo, xc_dominfo_t *info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m, int rw)
>> +{
>> +=C2=A0=C2=A0=C2=A0 xen_pfn_t *p2m_frame_list =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 uint64_t p2m_cr3;
>> +=C2=A0=C2=A0=C2=A0 uint32_t dom =3D info->domid;
>> +=C2=A0=C2=A0=C2=A0 int ret =3D -1;
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->=
p2m_size) < 0 )
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("Could not get maxim=
um GPFN!");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( dinfo->p2m_size < info->nr_pages=C2=A0 )
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("p2m_size < nr_pages=
 -1 (%lx < %lx", dinfo->p2m_size,=20
>> info->nr_pages - 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 p2m_cr3 =3D GET_FIELD(live_shinfo, arch.p2m_cr3, d=
info->guest_width);
>> +
>> +=C2=A0=C2=A0=C2=A0 p2m_frame_list =3D p2m_cr3 ? xc_core_arch_map_p2m_=
list_rw(xch,=20
>> dinfo, dom, live_shinfo, p2m_cr3)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : xc_core_arch_map_p2m_tree_rw(xch,=20
>> dinfo, dom, live_shinfo);
>> +
>> +=C2=A0=C2=A0=C2=A0 if ( !p2m_frame_list )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *live_p2m =3D xc_map_foreign_pages(xch,=
 dom,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 rw ? (PROT_READ | PROT_WRITE) :=20
>> PROT_READ,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 p2m_frame_list,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P2M_FL=
_ENTRIES);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dinfo-=
>p2m_frames);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !*live_p2m )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> @@ -162,21 +348,11 @@ xc_core_arch_map_p2m_rw(xc_interface *xch,=20
>> struct domain_info_context *dinfo, xc
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 *pfnp =3D dinfo->p2m_size;
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 0;
>> =C2=A0 out:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D errno;
>> -=C2=A0=C2=A0=C2=A0 if ( live_p2m_frame_list_list )
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_p2m_frame_list=
_list, PAGE_SIZE);
>> -
>> -=C2=A0=C2=A0=C2=A0 if ( live_p2m_frame_list )
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_p2m_frame_list=
, P2M_FLL_ENTRIES * PAGE_SIZE);
>> -
>> -=C2=A0=C2=A0=C2=A0 free(p2m_frame_list_list);
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(p2m_frame_list);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D err;
>> @@ -184,25 +360,17 @@ out:
>> =C2=A0 }
>> =C2=A0 int
>> -xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width,=20
>> xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long *pfnp)
>> +xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context=20
>> *dinfo, xc_dominfo_t *info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sha=
red_info_any_t *live_shinfo, xen_pfn_t=20
>> **live_p2m)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context _dinfo =3D { .guest_wid=
th =3D guest_width };
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_dinfo;
>> -=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 live_shinfo,=
 live_p2m, pfnp, 0);
>> +=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info, l=
ive_shinfo,=20
>> live_p2m, 0);
>> =C2=A0 }
>> =C2=A0 int
>> -xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int=20
>> guest_width, xc_dominfo_t *info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_info_any_t *live_shinfo,=20
>> xen_pfn_t **live_p2m,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *pfnp)
>> +xc_core_arch_map_p2m_writable(xc_interface *xch, struct=20
>> domain_info_context *dinfo, xc_dominfo_t *info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_info_any_t *live_shinfo,=20
>> xen_pfn_t **live_p2m)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context _dinfo =3D { .guest_wid=
th =3D guest_width };
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_dinfo;
>> -=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 live_shinfo,=
 live_p2m, pfnp, 1);
>> +=C2=A0=C2=A0=C2=A0 return xc_core_arch_map_p2m_rw(xch, dinfo, info, l=
ive_shinfo,=20
>> live_p2m, 1);
>> =C2=A0 }
>> =C2=A0 int
>> diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private=
=2Eh
>> index f0b5f83ac8..8ebc0b59da 100644
>> --- a/tools/libs/ctrl/xc_private.h
>> +++ b/tools/libs/ctrl/xc_private.h
>> @@ -79,6 +79,7 @@ struct iovec {
>> =C2=A0 struct domain_info_context {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int guest_width;
>> +=C2=A0=C2=A0=C2=A0 unsigned int p2m_frames;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long p2m_size;
>> =C2=A0 };
>> diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain=
=2Ec
>> index 5019c84e0e..dd7db2cbd8 100644
>> --- a/tools/libs/guest/xg_domain.c
>> +++ b/tools/libs/guest/xg_domain.c
>> @@ -24,13 +24,9 @@
>> =C2=A0 int xc_unmap_domain_meminfo(xc_interface *xch, struct=20
>> xc_domain_meminfo *minfo)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context _di =3D { .guest_width =
=3D=20
>> minfo->guest_width,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .p2m_size =3D minfo->p2m_size};
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_di;
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(minfo->pfn_type);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( minfo->p2m_table )
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(minfo->p2m_table, P=
2M_FL_ENTRIES * PAGE_SIZE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(minfo->p2m_table, m=
info->p2m_frames * PAGE_SIZE);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minfo->p2m_table =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> @@ -40,7 +36,6 @@ int xc_map_domain_meminfo(xc_interface *xch,=20
>> uint32_t domid,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct xc_domain_meminfo *minfo)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct domain_info_context _di;
>> -=C2=A0=C2=A0=C2=A0 struct domain_info_context *dinfo =3D &_di;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xc_dominfo_t info;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shared_info_any_t *live_shinfo;
>> @@ -96,16 +91,16 @@ int xc_map_domain_meminfo(xc_interface *xch,=20
>> uint32_t domid,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 if ( xc_core_arch_map_p2m_writable(xch, minfo->gue=
st_width, &info,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 live_shinfo, &minfo->p2m_table,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &minfo->p2m_size) )
>> +=C2=A0=C2=A0=C2=A0 if ( xc_core_arch_map_p2m_writable(xch, &_di, &inf=
o,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 live_shinfo, &minfo->p2m_table) )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PERROR("Could n=
ot map the P2M table");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_shi=
nfo, PAGE_SIZE);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(live_shinfo, PAGE_SIZE);
>> -=C2=A0=C2=A0=C2=A0 _di.p2m_size =3D minfo->p2m_size;
>> +=C2=A0=C2=A0=C2=A0 minfo->p2m_size =3D _di.p2m_size;
>> +=C2=A0=C2=A0=C2=A0 minfo->p2m_frames =3D _di.p2m_frames;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Make space and prepare for getting t=
he PFN types */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minfo->pfn_type =3D calloc(sizeof(*minf=
o->pfn_type),=20
>> minfo->p2m_size);
>> @@ -141,7 +136,7 @@ failed:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( minfo->p2m_table )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(minfo->p2m_table, P=
2M_FL_ENTRIES * PAGE_SIZE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(minfo->p2m_table, m=
info->p2m_frames * PAGE_SIZE);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minfo->p2m_tabl=
e =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>=20


--------------C7717B2CA974C6DDC42E65BE
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

--------------C7717B2CA974C6DDC42E65BE--

--e7molK0gAN7XkTo1JSobeubRNXwwDLZwI--

--FQJwR1kyPb3jSlEpI47oXOJwipSV3jqDg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEeC/4FAwAAAAAACgkQsN6d1ii/Ey9d
vgf+NLg7i1VwDLVMyFtHvHaXq18Znqnp2oCqDXNeDmr3RyS006FsZQeMK2SWU7klaX3NeKtOTVUP
GHEBaSxu4eFh23l9lLZF/ja/HO/KRVsZbkbtRC2xuEZeComo0e+zbRCfJaGcyvNY38TCZAiBowNv
9nyeilEuYqei0ubR/RHHI2mbqkAqWNFJTXCHo934n3GC2l+gIDrMNnJJy1seE1Djs9TC1xw3SBhV
onNQGqNyb/lAJYU13iUTSMesl0xzX5mn1ILfafAx9NY1hnIGO0EjllBqJ3he4rl9kZSxsxNQSDZZ
FqZdTdfKTE33SaW1H8LIZ0U1vIzQWUEW+B+dssAGrg==
=SQdp
-----END PGP SIGNATURE-----

--FQJwR1kyPb3jSlEpI47oXOJwipSV3jqDg--

