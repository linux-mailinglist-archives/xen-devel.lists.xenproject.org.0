Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1C254EA3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 21:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBNdT-0000bN-5v; Thu, 27 Aug 2020 19:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QM1O=CF=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1kBNdR-0000bG-OM
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 19:32:33 +0000
X-Inumbo-ID: a7a2f6eb-018c-4a70-8eb2-a00ff4830011
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7a2f6eb-018c-4a70-8eb2-a00ff4830011;
 Thu, 27 Aug 2020 19:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id A7E33B560090;
 Thu, 27 Aug 2020 22:32:30 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rPdf2OsYSPPJ; Thu, 27 Aug 2020 22:32:28 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id B53E3B561EB6;
 Thu, 27 Aug 2020 22:32:28 +0300 (EEST)
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id funEeYJ-_G27; Thu, 27 Aug 2020 22:32:28 +0300 (EEST)
Received: from [192.168.1.35] (5-12-253-103.residential.rdsnet.ro
 [5.12.253.103]) by mx.upb.ro (Postfix) with ESMTPSA id 4ECCCB560090;
 Thu, 27 Aug 2020 22:32:28 +0300 (EEST)
Subject: Re: [PATCH] stubdom/grub: Update init_netfront() call for mini-os
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com
References: <20200827191257.30100-1-costin.lupu@cs.pub.ro>
 <20200827191624.kuxpbiauoqfkwa2q@function>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <f388c653-f157-705c-4e16-d49faa4d0535@cs.pub.ro>
Date: Thu, 27 Aug 2020 22:32:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827191624.kuxpbiauoqfkwa2q@function>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Samuel,

Sorry for spamming. I resent the patch because I wasn't subscribed to
xen-devel when I sent the first one and I know there might be some
issues with the patches arriving on the list for authors who aren't
subscribed.

Cheers,
Costin

On 8/27/20 10:16 PM, Samuel Thibault wrote:
> Costin Lupu, le jeu. 27 ao=C3=BBt 2020 22:12:57 +0300, a ecrit:
>> This patch updates the call of init_netfront() function according to i=
ts
>> recently updated declaration which can also include parameters for gat=
eway
>> and netmask addresses. While we are here, the patch also removes passi=
ng
>> the ip parameter because (a) it is not used anywhere and (b) it wastes
>> memory since it would reference a dynamically allocated string.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>=20
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>=20
>> ---
>>  stubdom/grub/mini-os.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c
>> index 4fc052a255..b33dbf02fb 100644
>> --- a/stubdom/grub/mini-os.c
>> +++ b/stubdom/grub/mini-os.c
>> @@ -291,8 +291,6 @@ struct netfront_dev *net_dev;
>>  int
>>  minios_probe (struct nic *nic)
>>  {
>> -    char *ip;
>> -
>>      if (net_dev)
>>          return 1;
>> =20
>> @@ -300,7 +298,7 @@ minios_probe (struct nic *nic)
>>      grub_memset ((char *) arptable, 0,
>>                   MAX_ARP * sizeof (struct arptable_t));
>> =20
>> -    net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, &ip);
>> +    net_dev =3D init_netfront(NULL, (void*) -1, nic->node_addr, NULL,=
 NULL, NULL);
>>      if (!net_dev)
>>          return 0;
>> =20
>> --=20
>> 2.20.1
>>

