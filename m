Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9B1CE228
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 20:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYCk3-0004Tn-5j; Mon, 11 May 2020 18:01:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lxCE=6Z=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jYCk1-0004Ti-O1
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 18:01:25 +0000
X-Inumbo-ID: 6d2813da-93b1-11ea-a23d-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d2813da-93b1-11ea-a23d-12813bfff9fa;
 Mon, 11 May 2020 18:01:24 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BHtoZZ165453;
 Mon, 11 May 2020 18:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=corp-2020-01-29;
 bh=3kDmNoqAEMZCIXkcb0qOJul4sO1nAcYTG6P0n3tKFVY=;
 b=J08lgend++x1QqGWYhELUriMEny26k3fyjyCtHH4swF4nr0HlxIWmjm6gN2ExsQJmF8H
 /fyLBmkUUnyvCvbRxnSJiC80XcRPP1JK6TdepnYLyEbAMDOyn3iDl2UYnhx4+WytAj5t
 goJLQvhUFu3rVXh5yQKzSQUp2M/XfxaBHWQJFpafh66wNATudAi0/SMvS6l4AekMYfMT
 vYHpmrhFcBsMuVllX98JKAXFyrWCiMX9vWtV1AqOgtngOkLwEv4Uf90ndO9S1H+Ny+w3
 Lbvt7xEibUHNB/tGl63mq4lCiEiqzaDzHO/+Yz+WH3rDFOY7wXj2Of1xVvuflRzBe/Hy mg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30x3gmenme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 May 2020 18:01:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BHht2K117945;
 Mon, 11 May 2020 18:01:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 30x6ewggc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 18:01:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04BI1Gwt006639;
 Mon, 11 May 2020 18:01:16 GMT
Received: from [10.39.250.101] (/10.39.250.101)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 May 2020 11:01:16 -0700
Subject: Re: [PATCH 1/2] xen/xenbus: avoid large structs and arrays on the
 stack
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20200511073151.19043-1-jgross@suse.com>
 <20200511073151.19043-2-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-Pep-Version: 2.0
Message-ID: <965e1d65-3a0c-3a71-ca58-2b5c04f98bce@oracle.com>
Date: Mon, 11 May 2020 14:01:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511073151.19043-2-jgross@suse.com>
Content-Type: multipart/mixed; boundary="------------444D946E3E378382AC37167D"
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=2
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110139
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------444D946E3E378382AC37167D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/11/20 3:31 AM, Juergen Gross wrote:
> =20
>  static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,


I wonder whether we can drop valloc/vfree from xenbus_ring_ops' names.


> +				      struct map_ring_valloc *info,
>  				      grant_ref_t *gnt_ref,
>  				      unsigned int nr_grefs,
>  				      void **vaddr)
>  {
> -	struct xenbus_map_node *node;
> +	struct xenbus_map_node *node =3D info->node;
>  	int err;
>  	void *addr;
>  	bool leaked =3D false;
> -	struct map_ring_valloc_hvm info =3D {
> -		.idx =3D 0,
> -	};
>  	unsigned int nr_pages =3D XENBUS_PAGES(nr_grefs);
> =20
> -	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
> -		return -EINVAL;
> -
> -	*vaddr =3D NULL;
> -
> -	node =3D kzalloc(sizeof(*node), GFP_KERNEL);
> -	if (!node)
> -		return -ENOMEM;
> -
>  	err =3D alloc_xenballooned_pages(nr_pages, node->hvm.pages);
>  	if (err)
>  		goto out_err;
> =20
>  	gnttab_foreach_grant(node->hvm.pages, nr_grefs,
>  			     xenbus_map_ring_setup_grant_hvm,
> -			     &info);
> +			     info);
> =20
>  	err =3D __xenbus_map_ring(dev, gnt_ref, nr_grefs, node->handles,
> -				info.phys_addrs, GNTMAP_host_map, &leaked);
> +				info, GNTMAP_host_map, &leaked);
>  	node->nr_handles =3D nr_grefs;
> =20
>  	if (err)
> @@ -641,11 +654,13 @@ static int xenbus_map_ring_valloc_hvm(struct xenb=
us_device *dev,
>  	spin_unlock(&xenbus_valloc_lock);
> =20
>  	*vaddr =3D addr;
> +	info->node =3D NULL;


Is this so that xenbus_map_ring_valloc() doesn't free it accidentally?


-boris


> +
>  	return 0;
> =20
> =20


--------------444D946E3E378382AC37167D
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3D3tCZ
-----END PGP PUBLIC KEY BLOCK-----

--------------444D946E3E378382AC37167D--

