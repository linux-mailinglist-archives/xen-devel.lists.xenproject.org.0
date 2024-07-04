Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD4927B6C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 18:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753922.1162191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPPZq-0001ik-CA; Thu, 04 Jul 2024 16:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753922.1162191; Thu, 04 Jul 2024 16:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPPZq-0001go-9e; Thu, 04 Jul 2024 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 753922;
 Thu, 04 Jul 2024 16:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvF=OE=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1sPPZp-0001gi-4K
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 16:44:57 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be198506-3a24-11ef-bbfa-fd08da9f4363;
 Thu, 04 Jul 2024 18:44:55 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso1066046a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 09:44:55 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c3edb9f0sm23954366b.121.2024.07.04.09.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 09:44:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DB6495F839;
 Thu,  4 Jul 2024 17:44:52 +0100 (BST)
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
X-Inumbo-ID: be198506-3a24-11ef-bbfa-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720111495; x=1720716295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e+9jaG3i6h3581y6bfnNWzVuXNbsmJ9Fdj9t0MGtE0=;
        b=ELBNPugmRSYt9J6MF6wKWSEnHotSfTlmtV7IZBc6lq+AIPgy87k9zsg13cURI/v7Yz
         K2BuL+t7kv1k8LA8ljPmnF6AtXK7UQhj/c6ohSbNbaSgZkz+AdYXDMiUdLmlq2F0mMXK
         aTO5NHsGYevkQC46M0bmD7KbgUA2CHMv7PyPOx1lUNnCk4oGPJMs/ns4tONVX2LkW9dB
         4lfM/9L2/P60n1ycngv4MBshxDAfif0e5CfmOmnRhYddBjZLSWd7WFtNeLq8VmuzmSMQ
         to73xZeoL6DjSTd5ik3iLDLQIr7u5lTI5LAbw/8qszoCHuIgdfIOBpzxz8E9zpJLCkjp
         DuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720111495; x=1720716295;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7e+9jaG3i6h3581y6bfnNWzVuXNbsmJ9Fdj9t0MGtE0=;
        b=M+qrB6DhJCYAZ7qv2v2sW6hjH330OF8pnQPuszqV2AEW5VhkOGro3IRqk0//Iz5xpj
         x8Ek4h5KniqL8a1L2QoVg+T8c9kKVhGYV4zTY12mcaf/m5/ZMulz1Jgj0rtHLdGeo988
         bjXYxbunZmNe2lqj3it/tQPYFC6ZdKWIt5oZKQQh9WActsQd0qXUfXJDKvY+NCnXIqdK
         zxV4JjF2TxS8OJayowKa3J146f77dTYLB9t0diXY15ZrpL8oMBDmXqg0iSVLEn2wid8I
         9QFYhT0Vab6mdXp1rNOj5YjDXMAh15InglxxiX24y/za+XOMroQXwvOCwae9ExeeWaU2
         NE9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdhML9fpoBFdK1T8USSIn5QAnA+4T074frHEApVSMXIDU9Zsk2a7+2H+rirDjkMB2JQKbKxvaVtaihIoeRdieHSxv9i6DkxS6SK3ygQxk=
X-Gm-Message-State: AOJu0YwpMOFvhKTYtRDuS/yiwXwlqIUy7dzJaSjxTPy0M+KDUzYniQyr
	YGvc5kIXfmWsK6o6XlD7OwGCX1j8jJZnt5YZcwBf3O9+cnR5zrxgJneo+oDmCUI=
X-Google-Smtp-Source: AGHT+IGTp3ymlZkKAcuX3mwvsyprJa2baN85p7ojMJg+tCz5V1oNIF9d7xmATIYbzE9cGXc8GE/tow==
X-Received: by 2002:a17:907:9620:b0:a72:4281:bc72 with SMTP id a640c23a62f3a-a77ba72781fmr186692266b.63.1720111494577;
        Thu, 04 Jul 2024 09:44:54 -0700 (PDT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  qemu-devel@nongnu.org,
  sstabellini@kernel.org,  paul@xen.org,  edgar.iglesias@amd.com,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in
 buckets
In-Reply-To: <ZoawbAnukIBkYWCw@l14> (Anthony PERARD's message of "Thu, 04 Jul
	2024 14:23:41 +0000")
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
	<20240701224421.1432654-3-edgar.iglesias@gmail.com>
	<ZoawbAnukIBkYWCw@l14>
Date: Thu, 04 Jul 2024 17:44:52 +0100
Message-ID: <87wmm1m7i3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Anthony PERARD <anthony.perard@vates.tech> writes:

> On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>=20
>> This fixes the clobbering of the entry->next pointer when
>> unmapping the first entry in a bucket of a mapcache.
>>=20
>> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
>> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>> ---
>>  hw/xen/xen-mapcache.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
>> index 5f23b0adbe..18ba7b1d8f 100644
>> --- a/hw/xen/xen-mapcache.c
>> +++ b/hw/xen/xen-mapcache.c
>> @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked=
(MapCache *mc,
>>          pentry->next =3D entry->next;
>>          g_free(entry);
>>      } else {
>> -        memset(entry, 0, sizeof *entry);
>> +        /*
>> +         * Invalidate mapping but keep entry->next pointing to the rest
>> +         * of the list.
>> +         *
>> +         * Note that lock is already zero here, otherwise we don't unma=
p.
>> +         */
>> +        entry->paddr_index =3D 0;
>> +        entry->vaddr_base =3D NULL;
>> +        entry->valid_mapping =3D NULL;
>> +        entry->flags =3D 0;
>> +        entry->size =3D 0;
>
> This kind of feels like mc->entry should be an array of pointer rather
> than an array of MapCacheEntry but that seems to work well enough and
> not the first time entries are been cleared like that.

The use of a hand rolled list is a bit of a concern considering QEMU and
Glib both provide various abstractions used around the rest of the code
base. The original patch that introduces the mapcache doesn't tell me
much about access patterns for the cache, just that it is trying to
solve memory exhaustion issues with lots of dynamic small mappings.

Maybe a simpler structure is desirable?

We also have an interval tree implementation ("qemu/interval-tree.h") if
what we really want is a sorted tree of memory that can be iterated
locklessly.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

