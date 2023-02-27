Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F76A3F8A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502342.774095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWasH-0006UC-Fb; Mon, 27 Feb 2023 10:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502342.774095; Mon, 27 Feb 2023 10:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWasH-0006SU-Cc; Mon, 27 Feb 2023 10:36:53 +0000
Received: by outflank-mailman (input) for mailman id 502342;
 Mon, 27 Feb 2023 10:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XlDa=6X=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1pWasG-0006SO-5C
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:36:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4887a17-b68a-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 11:36:50 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so3502648wmc.5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 02:36:50 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b003e0238d9101sm9525650wmb.31.2023.02.27.02.36.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Feb 2023 02:36:49 -0800 (PST)
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
X-Inumbo-ID: a4887a17-b68a-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8pB/BCHGRqVaLWNW4zGNZH93WiFNX3eE2S7y7D/bYY=;
        b=VOo/rP1ba4GwSb6W954ILkbAMxmWKcJZM25yr5NX29v3ujDNfh60QWCyUJrBbLti0P
         boZXsL55hEJ/VWXE70R+7cAB6ASAJ9wm+uaL6djM1KhLYN2Uxmo9PNN4JE9ghvRdRFdp
         7usQExGCWon/aOrafPMxOpvMXO5nWu0ywDxSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8pB/BCHGRqVaLWNW4zGNZH93WiFNX3eE2S7y7D/bYY=;
        b=Bz7+5IF8dtDvuSRLQ0q80lubuslBBqfNysBA4BBBSlHogEjzZC8S8Lmy6rQ64amyRW
         saLA3PFiVrtuGn7zAqhqbEoiZgYx+07LA9kOzbVQWPJQBaYrKAXkhWc/j2pJ/S4lJ9O3
         xXfAnP2QWK0snU7eLzfG1V4pdSUAfNHngcKRpKk61hqSzY1n0wxtOB3ARvCPfWDH3aoA
         1H2MOO6qqJw8tAUYDfAaQ3N/s8oKUn4WVEw8gTl00UDuM18lAxjY/yiIQiQe/ylnSKsC
         36uMX6YGG+XoqEPwsnHNngbJxt9RMofytJvlJuiyiaVLQfXPrLaVnaMWrsUehR+rRf/k
         bbzA==
X-Gm-Message-State: AO0yUKXcZBYAIDDK0NlX7pccgJGsteW44pfc2Zu8hz1bhprnN9KfpdAg
	k1kMagMxKqEBZEIDwKCa/aJgQx7cGukiWSf1
X-Google-Smtp-Source: AK7set8sDMia5Y+6XWxLJDMwaWjcTomucsdmg5mcO+u0zHPzcWMganhS2iKrfeQ/16OZBhG36BFUGg==
X-Received: by 2002:a05:600c:34cb:b0:3eb:a4e:a2b2 with SMTP id d11-20020a05600c34cb00b003eb0a4ea2b2mr8913567wmq.4.1677494209629;
        Mon, 27 Feb 2023 02:36:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v1 1/2] xc_core_arch_map_p2m_tree_rw: fix memory leak
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <12b656b2-76d5-2ce6-9548-5ee8e57451ae@citrix.com>
Date: Mon, 27 Feb 2023 10:36:38 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <050C988E-3E83-4F1C-87AE-9B221B04EB81@cloud.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
 <c721e627bc74047c0c5e55c0aeae7d72bbc3ce0e.1677245356.git.edwin.torok@cloud.com>
 <12b656b2-76d5-2ce6-9548-5ee8e57451ae@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)



> On 24 Feb 2023, at 14:56, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 24/02/2023 1:36 pm, Edwin T=C3=B6r=C3=B6k wrote:
>> From: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>>=20
>> Prior to bd7a29c3d0 'out' would've always been executed and memory
>> freed, but that commit changed it such that it returns early and =
leaks.
>>=20
>> Found using gcc 12.2.1 `-fanalyzer`:
>> ```
>> xg_core_x86.c: In function =E2=80=98xc_core_arch_map_p2m_tree_rw=E2=80=99=
:
>> xg_core_x86.c:300:5: error: leak of =E2=80=98p2m_frame_list_list=E2=80=99=
 [CWE-401] [-Werror=3Danalyzer-malloc-leak]
>>  300 |     return p2m_frame_list;
>>      |     ^~~~~~
>>  =E2=80=98xc_core_arch_map_p2m_writable=E2=80=99: events 1-2
>>    |
>>    |  378 | xc_core_arch_map_p2m_writable(xc_interface *xch, struct =
domain_info_context *dinfo, xc_dominfo_t *info,
>>    |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    |      | |
>>    |      | (1) entry to =E2=80=98xc_core_arch_map_p2m_writable=E2=80=99=

>>    |......
>>    |  381 |     return xc_core_arch_map_p2m_rw(xch, dinfo, info, =
live_shinfo, live_p2m, 1);
>>    |      |            =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    |      |            |
>>    |      |            (2) calling =E2=80=98xc_core_arch_map_p2m_rw=E2=80=
=99 from =E2=80=98xc_core_arch_map_p2m_writable=E2=80=99
>>    |
>>    +--> =E2=80=98xc_core_arch_map_p2m_rw=E2=80=99: events 3-10
>>           |
>>           |  319 | xc_core_arch_map_p2m_rw(xc_interface *xch, struct =
domain_info_context *dinfo, xc_dominfo_t *info,
>>           |      | ^~~~~~~~~~~~~~~~~~~~~~~
>>           |      | |
>>           |      | (3) entry to =E2=80=98xc_core_arch_map_p2m_rw=E2=80=99=

>>           |......
>>           |  328 |     if ( xc_domain_nr_gpfns(xch, info->domid, =
&dinfo->p2m_size) < 0 )
>>           |      |        ~
>>           |      |        |
>>           |      |        (4) following =E2=80=98false=E2=80=99 =
branch...
>>           |......
>>           |  334 |     if ( dinfo->p2m_size < info->nr_pages  )
>>           |      |     ~~ ~
>>           |      |     |  |
>>           |      |     |  (6) following =E2=80=98false=E2=80=99 =
branch...
>>           |      |     (5) ...to here
>>           |......
>>           |  340 |     p2m_cr3 =3D GET_FIELD(live_shinfo, =
arch.p2m_cr3, dinfo->guest_width);
>>           |      |     ~~~~~~~
>>           |      |     |
>>           |      |     (7) ...to here
>>           |  341 |
>>           |  342 |     p2m_frame_list =3D p2m_cr3 ? =
xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
>>           |      |                      =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>>           |  343 |                              : =
xc_core_arch_map_p2m_tree_rw(xch, dinfo, dom, live_shinfo);
>>           |      |                              =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>           |      |                              | |
>>           |      |                              | (9) ...to here
>>           |      |                              | (10) calling =
=E2=80=98xc_core_arch_map_p2m_tree_rw=E2=80=99 from =
=E2=80=98xc_core_arch_map_p2m_rw=E2=80=99
>>           |      |                              (8) following =
=E2=80=98false=E2=80=99 branch...
>>           |
>>           +--> =E2=80=98xc_core_arch_map_p2m_tree_rw=E2=80=99: events =
11-24
>>                  |
>>                  |  228 | xc_core_arch_map_p2m_tree_rw(xc_interface =
*xch, struct domain_info_context *dinfo,
>>                  |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>                  |      | |
>>                  |      | (11) entry to =
=E2=80=98xc_core_arch_map_p2m_tree_rw=E2=80=99
>>                  |......
>>                  |  245 |     if ( !live_p2m_frame_list_list )
>>                  |      |        ~
>>                  |      |        |
>>                  |      |        (12) following =E2=80=98false=E2=80=99=
 branch (when =E2=80=98live_p2m_frame_list_list=E2=80=99 is non-NULL)...
>>                  |......
>>                  |  252 |     if ( !(p2m_frame_list_list =3D =
malloc(PAGE_SIZE)) )
>>                  |      |     ~~ ~                         =
~~~~~~~~~~~~~~~~~
>>                  |      |     |  |                         |
>>                  |      |     |  |                         (14) =
allocated here
>>                  |      |     |  (15) assuming =
=E2=80=98p2m_frame_list_list=E2=80=99 is non-NULL
>>                  |      |     |  (16) following =E2=80=98false=E2=80=99=
 branch (when =E2=80=98p2m_frame_list_list=E2=80=99 is non-NULL)...
>>                  |      |     (13) ...to here
>>                  |......
>>                  |  257 |     memcpy(p2m_frame_list_list, =
live_p2m_frame_list_list, PAGE_SIZE);
>>                  |      |     ~~~~~~
>>                  |      |     |
>>                  |      |     (17) ...to here
>>                  |......
>>                  |  266 |     else if ( dinfo->guest_width < =
sizeof(unsigned long) )
>>                  |      |             ~
>>                  |      |             |
>>                  |      |             (18) following =E2=80=98false=E2=80=
=99 branch...
>>                  |......
>>                  |  270 |     live_p2m_frame_list =3D
>>                  |      |     ~~~~~~~~~~~~~~~~~~~
>>                  |      |     |
>>                  |      |     (19) ...to here
>>                  |......
>>                  |  275 |     if ( !live_p2m_frame_list )
>>                  |      |        ~
>>                  |      |        |
>>                  |      |        (20) following =E2=80=98false=E2=80=99=
 branch (when =E2=80=98live_p2m_frame_list=E2=80=99 is non-NULL)...
>>                  |......
>>                  |  282 |     if ( !(p2m_frame_list =3D =
malloc(P2M_TOOLS_FL_SIZE)) )
>>                  |      |     ~~ ~
>>                  |      |     |  |
>>                  |      |     |  (22) following =E2=80=98false=E2=80=99=
 branch (when =E2=80=98p2m_frame_list=E2=80=99 is non-NULL)...
>>                  |      |     (21) ...to here
>>                  |......
>>                  |  287 |     memset(p2m_frame_list, 0, =
P2M_TOOLS_FL_SIZE);
>>                  |      |     ~~~~~~
>>                  |      |     |
>>                  |      |     (23) ...to here
>>                  |......
>>                  |  300 |     return p2m_frame_list;
>>                  |      |     ~~~~~~
>>                  |      |     |
>>                  |      |     (24) =E2=80=98p2m_frame_list_list=E2=80=99=
 leaks here; was allocated at (14)
>>                  |
>> ```
>> Fixes: bd7a29c3d0 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to =
support linear p2m table")
>>=20
>> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>> ---
>> tools/libs/guest/xg_core_x86.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/tools/libs/guest/xg_core_x86.c =
b/tools/libs/guest/xg_core_x86.c
>> index 61106b98b8..69929879d7 100644
>> --- a/tools/libs/guest/xg_core_x86.c
>> +++ b/tools/libs/guest/xg_core_x86.c
>> @@ -297,6 +297,8 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, =
struct domain_info_context *dinf
>>=20
>>     dinfo->p2m_frames =3D P2M_FL_ENTRIES;
>>=20
>> +    free(p2m_frame_list_list);
>> +
>>     return p2m_frame_list;
>>=20
>>  out:
>=20
> I agree there are problems here, but I think they're larger still.  =
The
> live_p2m_frame_list_list and live_p2m_frame_list foreign mappings are
> leaked too on the success path.


I thought the goal of that function was to create the mapping (judging =
by its name), but looking at its caller there is another =
map_foreign_pages there,
so there is indeed a leak (-fanalyzer won't be able to spot these unless =
we figure out a way to put some attributs on these map and unmap to =
teach it that they are alloc/free pairs).

Pushed updated commits here (top 2): leak-fixes =
<https://github.com/edwintorok/xen/commits/leak-fixes>
Before posting a V2 I'll try it out on an actual machine though, just to =
check that we don't have a double-free instead now.

Thanks,
--Edwin

>=20
> I think this is the necessary fix:
>=20
> ~Andrew
>=20
> ----8<----
>=20
> diff --git a/tools/libs/guest/xg_core_x86.c =
b/tools/libs/guest/xg_core_x86.c
> index 61106b98b877..c5e4542ccccc 100644
> --- a/tools/libs/guest/xg_core_x86.c
> +++ b/tools/libs/guest/xg_core_x86.c
> @@ -229,11 +229,11 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
> struct domain_info_context *dinf
>                               uint32_t dom, shared_info_any_t =
*live_shinfo)
>  {
>      /* Double and single indirect references to the live P2M table */
> -    xen_pfn_t *live_p2m_frame_list_list;
> +    xen_pfn_t *live_p2m_frame_list_list =3D NULL;
>      xen_pfn_t *live_p2m_frame_list =3D NULL;
>      /* Copies of the above. */
>      xen_pfn_t *p2m_frame_list_list =3D NULL;
> -    xen_pfn_t *p2m_frame_list;
> +    xen_pfn_t *p2m_frame_list =3D NULL;
> =20
>      int err;
>      int i;
> @@ -297,8 +297,6 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
> struct domain_info_context *dinf
> =20
>      dinfo->p2m_frames =3D P2M_FL_ENTRIES;
> =20
> -    return p2m_frame_list;
> -
>   out:
>      err =3D errno;
> =20
> @@ -312,7 +310,7 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch,
> struct domain_info_context *dinf
> =20
>      errno =3D err;
> =20
> -    return NULL;
> +    return p2m_frame_list;
>  }
> =20
>  static int
>=20


