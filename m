Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBB3DB6DE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 12:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162455.297920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PRh-0005DU-Cv; Fri, 30 Jul 2021 10:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162455.297920; Fri, 30 Jul 2021 10:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PRh-0005AG-9g; Fri, 30 Jul 2021 10:08:49 +0000
Received: by outflank-mailman (input) for mailman id 162455;
 Fri, 30 Jul 2021 10:08:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9PRf-0005AA-Eq
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:08:47 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fe367ca-f11e-11eb-9895-12813bfff9fa;
 Fri, 30 Jul 2021 10:08:45 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4CAA2232B;
 Fri, 30 Jul 2021 10:08:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 87A91137C2;
 Fri, 30 Jul 2021 10:08:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ffXGH6zPA2H2LwAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 10:08:44 +0000
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
X-Inumbo-ID: 1fe367ca-f11e-11eb-9895-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627639724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9eoYKwUaNwyJ1kH2wmng6DVC36hmogi2+P+PPhIWXo=;
	b=G1t1qvYRJSqfzxBam0/V7gTVLiXchUexMhlrkC0wiSurNLNhwTcjTB61Ia46xsJ62Pq9GX
	z6gwz2Hbal+e+bp8jjlVWwhAnniR6ZSmP/KtYebtnmRJam/4fc1dNdRYj/iyTKt3mjLkwY
	BFXv51+ADhIodw2JDa5DrkzbDc4xViY=
Subject: Re: [PATCH v2 3/3] xen/blkfront: don't trust the backend response
 data blindly
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-4-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9ef58781-bd7d-48bc-2b59-bb71d2ba83b8@suse.com>
Date: Fri, 30 Jul 2021 12:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708124345.10173-4-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fwf22lPzo4Qvu6QvspcrGFkuoLTLZpHAg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fwf22lPzo4Qvu6QvspcrGFkuoLTLZpHAg
Content-Type: multipart/mixed; boundary="R9dG4AJRst60ODdYDy8EfrA61v1dVekG9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <9ef58781-bd7d-48bc-2b59-bb71d2ba83b8@suse.com>
Subject: Re: [PATCH v2 3/3] xen/blkfront: don't trust the backend response
 data blindly
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-4-jgross@suse.com>
In-Reply-To: <20210708124345.10173-4-jgross@suse.com>

--R9dG4AJRst60ODdYDy8EfrA61v1dVekG9
Content-Type: multipart/mixed;
 boundary="------------C23AF8705A3C312E05994730"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C23AF8705A3C312E05994730
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.07.21 14:43, Juergen Gross wrote:
> Today blkfront will trust the backend to send only sane response data.
> In order to avoid privilege escalations or crashes in case of malicious=

> backends verify the data to be within expected limits. Especially make
> sure that the response always references an outstanding request.
>=20
> Introduce a new state of the ring BLKIF_STATE_ERROR which will be
> switched to in case an inconsistency is being detected. Recovering from=

> this state is possible only via removing and adding the virtual device
> again (e.g. via a suspend/resume cycle).
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Any comments for this patch?


Juergen

> ---
> V2:
> - use READ_ONCE() for reading the producer index
> - check validity of producer index only after memory barrier (Jan Beuli=
ch)
> - use virt_rmb() as barrier (Jan Beulich)
> ---
>   drivers/block/xen-blkfront.c | 66 ++++++++++++++++++++++++++---------=
-
>   1 file changed, 49 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.=
c
> index 80701860870a..ecdbb0381b4c 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -80,6 +80,7 @@ enum blkif_state {
>   	BLKIF_STATE_DISCONNECTED,
>   	BLKIF_STATE_CONNECTED,
>   	BLKIF_STATE_SUSPENDED,
> +	BLKIF_STATE_ERROR,
>   };
>  =20
>   struct grant {
> @@ -89,6 +90,7 @@ struct grant {
>   };
>  =20
>   enum blk_req_status {
> +	REQ_PROCESSING,
>   	REQ_WAITING,
>   	REQ_DONE,
>   	REQ_ERROR,
> @@ -543,7 +545,7 @@ static unsigned long blkif_ring_get_request(struct =
blkfront_ring_info *rinfo,
>  =20
>   	id =3D get_id_from_freelist(rinfo);
>   	rinfo->shadow[id].request =3D req;
> -	rinfo->shadow[id].status =3D REQ_WAITING;
> +	rinfo->shadow[id].status =3D REQ_PROCESSING;
>   	rinfo->shadow[id].associated_id =3D NO_ASSOCIATED_ID;
>  =20
>   	rinfo->shadow[id].req.u.rw.id =3D id;
> @@ -572,6 +574,7 @@ static int blkif_queue_discard_req(struct request *=
req, struct blkfront_ring_inf
>  =20
>   	/* Copy the request to the ring page. */
>   	*final_ring_req =3D *ring_req;
> +	rinfo->shadow[id].status =3D REQ_WAITING;
>  =20
>   	return 0;
>   }
> @@ -847,8 +850,11 @@ static int blkif_queue_rw_req(struct request *req,=
 struct blkfront_ring_info *ri
>  =20
>   	/* Copy request(s) to the ring page. */
>   	*final_ring_req =3D *ring_req;
> -	if (unlikely(require_extra_req))
> +	rinfo->shadow[id].status =3D REQ_WAITING;
> +	if (unlikely(require_extra_req)) {
>   		*final_extra_ring_req =3D *extra_ring_req;
> +		rinfo->shadow[extra_id].status =3D REQ_WAITING;
> +	}
>  =20
>   	if (new_persistent_gnts)
>   		gnttab_free_grant_references(setup.gref_head);
> @@ -1402,8 +1408,8 @@ static enum blk_req_status blkif_rsp_to_req_statu=
s(int rsp)
>   static int blkif_get_final_status(enum blk_req_status s1,
>   				  enum blk_req_status s2)
>   {
> -	BUG_ON(s1 =3D=3D REQ_WAITING);
> -	BUG_ON(s2 =3D=3D REQ_WAITING);
> +	BUG_ON(s1 < REQ_DONE);
> +	BUG_ON(s2 < REQ_DONE);
>  =20
>   	if (s1 =3D=3D REQ_ERROR || s2 =3D=3D REQ_ERROR)
>   		return BLKIF_RSP_ERROR;
> @@ -1436,7 +1442,7 @@ static bool blkif_completion(unsigned long *id,
>   		s->status =3D blkif_rsp_to_req_status(bret->status);
>  =20
>   		/* Wait the second response if not yet here. */
> -		if (s2->status =3D=3D REQ_WAITING)
> +		if (s2->status < REQ_DONE)
>   			return false;
>  =20
>   		bret->status =3D blkif_get_final_status(s->status,
> @@ -1555,11 +1561,17 @@ static irqreturn_t blkif_interrupt(int irq, voi=
d *dev_id)
>  =20
>   	spin_lock_irqsave(&rinfo->ring_lock, flags);
>    again:
> -	rp =3D rinfo->ring.sring->rsp_prod;
> -	rmb(); /* Ensure we see queued responses up to 'rp'. */
> +	rp =3D READ_ONCE(rinfo->ring.sring->rsp_prod);
> +	virt_rmb(); /* Ensure we see queued responses up to 'rp'. */
> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
> +		pr_alert("%s: illegal number of responses %u\n",
> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
> +		goto err;
> +	}
>  =20
>   	for (i =3D rinfo->ring.rsp_cons; i !=3D rp; i++) {
>   		unsigned long id;
> +		unsigned int op;
>  =20
>   		RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
>   		id =3D bret.id;
> @@ -1570,14 +1582,28 @@ static irqreturn_t blkif_interrupt(int irq, voi=
d *dev_id)
>   		 * look in get_id_from_freelist.
>   		 */
>   		if (id >=3D BLK_RING_SIZE(info)) {
> -			WARN(1, "%s: response to %s has incorrect id (%ld)\n",
> -			     info->gd->disk_name, op_name(bret.operation), id);
> -			/* We can't safely get the 'struct request' as
> -			 * the id is busted. */
> -			continue;
> +			pr_alert("%s: response has incorrect id (%ld)\n",
> +				 info->gd->disk_name, id);
> +			goto err;
>   		}
> +		if (rinfo->shadow[id].status !=3D REQ_WAITING) {
> +			pr_alert("%s: response references no pending request\n",
> +				 info->gd->disk_name);
> +			goto err;
> +		}
> +
> +		rinfo->shadow[id].status =3D REQ_PROCESSING;
>   		req  =3D rinfo->shadow[id].request;
>  =20
> +		op =3D rinfo->shadow[id].req.operation;
> +		if (op =3D=3D BLKIF_OP_INDIRECT)
> +			op =3D rinfo->shadow[id].req.u.indirect.indirect_op;
> +		if (bret.operation !=3D op) {
> +			pr_alert("%s: response has wrong operation (%u instead of %u)\n",
> +				 info->gd->disk_name, bret.operation, op);
> +			goto err;
> +		}
> +
>   		if (bret.operation !=3D BLKIF_OP_DISCARD) {
>   			/*
>   			 * We may need to wait for an extra response if the
> @@ -1602,7 +1628,8 @@ static irqreturn_t blkif_interrupt(int irq, void =
*dev_id)
>   		case BLKIF_OP_DISCARD:
>   			if (unlikely(bret.status =3D=3D BLKIF_RSP_EOPNOTSUPP)) {
>   				struct request_queue *rq =3D info->rq;
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>   					   info->gd->disk_name, op_name(bret.operation));
>   				blkif_req(req)->error =3D BLK_STS_NOTSUPP;
>   				info->feature_discard =3D 0;
> @@ -1614,13 +1641,13 @@ static irqreturn_t blkif_interrupt(int irq, voi=
d *dev_id)
>   		case BLKIF_OP_FLUSH_DISKCACHE:
>   		case BLKIF_OP_WRITE_BARRIER:
>   			if (unlikely(bret.status =3D=3D BLKIF_RSP_EOPNOTSUPP)) {
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>   				       info->gd->disk_name, op_name(bret.operation));
>   				blkif_req(req)->error =3D BLK_STS_NOTSUPP;
>   			}
>   			if (unlikely(bret.status =3D=3D BLKIF_RSP_ERROR &&
>   				     rinfo->shadow[id].req.u.rw.nr_segments =3D=3D 0)) {
> -				printk(KERN_WARNING "blkfront: %s: empty %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: empty %s op failed\n",
>   				       info->gd->disk_name, op_name(bret.operation));
>   				blkif_req(req)->error =3D BLK_STS_NOTSUPP;
>   			}
> @@ -1635,8 +1662,8 @@ static irqreturn_t blkif_interrupt(int irq, void =
*dev_id)
>   		case BLKIF_OP_READ:
>   		case BLKIF_OP_WRITE:
>   			if (unlikely(bret.status !=3D BLKIF_RSP_OKAY))
> -				dev_dbg(&info->xbdev->dev, "Bad return from blkdev data "
> -					"request: %x\n", bret.status);
> +				dev_dbg_ratelimited(&info->xbdev->dev,
> +					"Bad return from blkdev data request: %x\n", bret.status);
>  =20
>   			break;
>   		default:
> @@ -1662,6 +1689,11 @@ static irqreturn_t blkif_interrupt(int irq, void=
 *dev_id)
>   	spin_unlock_irqrestore(&rinfo->ring_lock, flags);
>  =20
>   	return IRQ_HANDLED;
> +
> + err:
> +	info->connected =3D BLKIF_STATE_ERROR;
> +	pr_alert("%s disabled for further use\n", info->gd->disk_name);
> +	return IRQ_HANDLED;
>   }
>  =20
>  =20
>=20


--------------C23AF8705A3C312E05994730
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

--------------C23AF8705A3C312E05994730--

--R9dG4AJRst60ODdYDy8EfrA61v1dVekG9--

--fwf22lPzo4Qvu6QvspcrGFkuoLTLZpHAg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEDz6sFAwAAAAAACgkQsN6d1ii/Ey+v
nwf8DSy7o0QgcyQEDIb8rZ4dRodp/bKyqqtC+iLsog5Ep9v+blpOTGXyeN+FnkYsWbugSbqorg87
kAl/Y3LMte7ui2P7F2Nwj6ACy1hLYBMujx0v/JRxjjxjiU7wx2Se1UExoOx0X2mLhp2V6ZVtjnnb
JGd1csOsimBZacftbYzRKlDNS3veBki82V50ucH3WRmg6y61tPx7i0GcqW687tNaSKlNFSOCYcKQ
rJdsRS5hjsbgsjz5M9Sc25fHVDhVC20Xkf8xbe3BKHN0L+j5ns7a5FqVx2nlT2wx4kCEm912oyeo
yxPZFGRHptOn9OQst/tus8G50WYVrayZvMvXwedn0Q==
=T4Y/
-----END PGP SIGNATURE-----

--fwf22lPzo4Qvu6QvspcrGFkuoLTLZpHAg--

