Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7C1CE2DD
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 20:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYDDs-00070n-Lq; Mon, 11 May 2020 18:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lxCE=6Z=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jYDDr-00070i-BH
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 18:32:15 +0000
X-Inumbo-ID: b954dea6-93b5-11ea-a241-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b954dea6-93b5-11ea-a241-12813bfff9fa;
 Mon, 11 May 2020 18:32:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BISS5A024294;
 Mon, 11 May 2020 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=corp-2020-01-29;
 bh=0Ey/kzTRW0zR9w4JP8XW1qIbWybWgGoabtUmZPgIkpo=;
 b=zYc4mFUVMSlX3AVF0YDffObZ2Kkywl4qWE/KVYywaao9U7a+qhA/Zb9hgjQcRpuXRieY
 2PJ3ioU3PpCT3nZk8M50yLPG9S5F8xi/PWGaoABCZOIePiAJWLFpeZqdAOjqj9lNFR00
 BWtow/7DZsM5tv7VYZFma4co2T9hp6j+5WrOrF6fpAWlD2lWOcC5GimNdw8ZxilDrLgV
 Auy+tEBJPFdBLGnWpNFoBf6zVJL9VZUYO59tRVYoQGidFWgG/px8G8nErzTZ+U0FpjKZ
 7JplPk5CSj0JsY3bE32wcnmbyKYuPp528Ay06e10UvwsKE3VRfYAsg4GMmNvjEN3R7RL 7A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30x3gmetps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 May 2020 18:32:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BIS8KM068892;
 Mon, 11 May 2020 18:32:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 30x6ewhy8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 18:32:07 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04BIW6NB006674;
 Mon, 11 May 2020 18:32:06 GMT
Received: from [10.39.250.101] (/10.39.250.101)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 May 2020 11:32:06 -0700
Subject: Re: [PATCH 2/2] xen/xenbus: let xenbus_map_ring_valloc() return errno
 values only
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200511073151.19043-1-jgross@suse.com>
 <20200511073151.19043-3-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-Pep-Version: 2.0
Message-ID: <692e23f8-1eb7-4fb2-7375-e85cb27dfab0@oracle.com>
Date: Mon, 11 May 2020 14:32:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511073151.19043-3-jgross@suse.com>
Content-Type: multipart/mixed; boundary="------------AE3EE8FF91A004904F775E68"
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9618
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110141
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------AE3EE8FF91A004904F775E68
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/11/20 3:31 AM, Juergen Gross wrote:
> Today xenbus_map_ring_valloc() can return either a negative errno
> value (-ENOMEM or -EINVAL) or a grant status value. This is a mess as
> e.g -ENOMEM and GNTST_eagain have the same numeric value.
>
> Fix that by turning all grant mapping errors into -ENOENT. This is
> no problem as all callers of xenbus_map_ring_valloc() only use the
> return value to print an error message, and in case of mapping errors
> the grant status value has already been printed by __xenbus_map_ring()
> before.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>




--------------AE3EE8FF91A004904F775E68
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3D3tCZ
-----END PGP PUBLIC KEY BLOCK-----

--------------AE3EE8FF91A004904F775E68--

