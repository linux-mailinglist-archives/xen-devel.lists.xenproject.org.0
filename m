Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490CC1A0D10
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 13:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLmkq-0004nU-Us; Tue, 07 Apr 2020 11:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4X4i=5X=redhat.com=mreitz@srs-us1.protection.inumbo.net>)
 id 1jLmko-0004nP-UE
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 11:50:54 +0000
X-Inumbo-ID: 08fbd122-78c6-11ea-83d8-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 08fbd122-78c6-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586260253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s+ndHbvTrKbk1V3apW4mI/ReUGW9N1uahO4VqkkPWYE=;
 b=ERV2hMqX8XCAxKHMnXPfe4FRETGJNWx4rPjt5URlbCH79a9kw675dvFjv/NZZZahXmQAtb
 o8E8Mp/li7aFLNlbx1JxXt6UTkaelMcolw52l6LD6ki3qwODuywiLmhQpbNpbVxO9iOXC4
 ZKTokq5mm9EHI6jIgLJbyA0njDeMOUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-QrNCYp35OjCW_eca-8YWTg-1; Tue, 07 Apr 2020 07:50:46 -0400
X-MC-Unique: QrNCYp35OjCW_eca-8YWTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0C388017F4;
 Tue,  7 Apr 2020 11:50:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6823C5E000;
 Tue,  7 Apr 2020 11:50:38 +0000 (UTC)
Subject: Re: [PATCH v2 for-5.0] xen-block: Fix double qlist remove and request
 leak
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20200406105954.GT4088@perard.uk.xensource.com>
 <20200406140217.1441858-1-anthony.perard@citrix.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <49d00051-13fc-e0b0-26e3-b1171ed876d3@redhat.com>
Date: Tue, 7 Apr 2020 13:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406140217.1441858-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qyisY4yAYPrHI5GTSgH4kc3EHGf19lNaU"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qyisY4yAYPrHI5GTSgH4kc3EHGf19lNaU
Content-Type: multipart/mixed; boundary="ENINMToKaB9vrevpYUVwgT5QDWFcdQ7c9"

--ENINMToKaB9vrevpYUVwgT5QDWFcdQ7c9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.04.20 16:02, Anthony PERARD wrote:
> Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
> remove") revealed that a request was removed twice from a list, once
> in xen_block_finish_request() and a second time in
> xen_block_release_request() when both function are called from
> xen_block_complete_aio(). But also, the `requests_inflight' counter is
> decreased twice, and thus became negative.
>=20
> This is a bug that was introduced in bfd0d6366043, where a `finished'
> list was removed.
>=20
> That commit also introduced a leak of request in xen_block_do_aio().
> That function calls xen_block_finish_request() but the request is
> never released after that.
>=20
> To fix both issue, we do two changes:
> - we squash finish_request() and release_request() together as we want
>   to remove a request from 'inflight' list to add it to 'freelist'.
> - before releasing a request, we need to let now the result to the
>   other end, thus we should call xen_block_send_response() before
>   releasing a request.
>=20
> The first change fix the double QLIST_REMOVE() as we remove the extra
> call. The second change makes the leak go away because if we want to
> call finish_request(), we need to call a function that do all of
> finish, send response, and release.
>=20
> Fixes: bfd0d6366043 ("xen-block: improve response latency")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  hw/block/dataplane/xen-block.c | 48 ++++++++++++----------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)

I=E2=80=99m going to send a pull request today anyway, so I hope you won=E2=
=80=99t mind
and let me take this patch to my branch (with Paul=E2=80=99s suggestions
incorporated):

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--ENINMToKaB9vrevpYUVwgT5QDWFcdQ7c9--

--qyisY4yAYPrHI5GTSgH4kc3EHGf19lNaU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6MaQwACgkQ9AfbAGHV
z0BjKwgAnZBIpnb2xRgxK0fvRt9/6YyEOdhcb5vq9CV934FypodV/gEqa0hZIRuB
2owjDzIBxxwkIFhqyeCjhDfRM4hp69j+VAZKXmDv4ch+PItoVSDjri0b7VC6q7FM
KjV7mv++yHhLwkNfSURA/TKs+JgARs0MAfjmsKmq9Kx2QvN/u7SSMujkHVVZ7jLT
ihq7HjTo3g41tcg8fTTEpRpKOPI+XV4DXp90X4hVyu84FKVs/aBm/yVcyPad7rUu
x6adT75hwQ4GDtFcVp6REaHnHGTnqOEGcXBCaH65dWpJrXIYYfUs2ASGVV8C+4+a
2X3nfrbK01OpxSrnCgisATtHzxVIRw==
=FZi0
-----END PGP SIGNATURE-----

--qyisY4yAYPrHI5GTSgH4kc3EHGf19lNaU--


