Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF341B2428
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 12:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQqPI-0000LO-7E; Tue, 21 Apr 2020 10:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vwqf=6F=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1jQqPG-0000LI-M1
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 10:45:34 +0000
X-Inumbo-ID: 3a098b86-83bd-11ea-83d8-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a098b86-83bd-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 10:45:34 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LAgWTe122997;
 Tue, 21 Apr 2020 10:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=xjrB8UBkgtQfAZWQWCOIt+Y6oS0Ty5B3R37uMdP+3g8=;
 b=AajEf3fFShsegcoNEW+JOBjqQQJjA0tp/GCYa9eNPSmLaOXf/yM9jOKej/AOhNfme7++
 hLWsdPXhd016jrxVW5SRRY0lkEpt4oDQujFoRYk9rfp5UxJuI7RPAu1YHRUhF6J+5XBe
 rX0FrJBM7p1+aTz0OHCLmjPUOTWcQn++nnuWmix9Md5qq2Vmox2Oi2+EJ6gUcy59T43I
 ONs7z6ViDXSPsts0+kyNj76430QCCB4gzHzAuYBgttFr4/5Uoa9+jsvyOVlB1NZB+LQ1
 UBaUgLjLmxZ3Gp/HJF/6j1p0zVDwkc6tWBIb2xaFC57M459G6blcKHrsP4UtlYF0B19X Dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 30ft6n47kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 10:45:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LAgTjq031125;
 Tue, 21 Apr 2020 10:45:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 30gbbdenj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 10:45:29 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03LAjSdo016137;
 Tue, 21 Apr 2020 10:45:28 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Apr 2020 03:45:28 -0700
Date: Tue, 21 Apr 2020 13:45:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: oleksandr_andrushchenko@epam.com
Subject: [bug report] drm/xen-front: Add support for Xen PV display frontend
Message-ID: <20200421104522.GA86681@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9597
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=3 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9597
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210085
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
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Kernel Janitors,

Here is another idea that someone could work on, fixing the
IS_ERR_OR_NULL() checks in the xen driver.

The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
display frontend" from Apr 3, 2018, leads to the following static
checker warning:

	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
	warn: passing zero to 'ERR_CAST'

drivers/gpu/drm/xen/xen_drm_front_gem.c
   133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
   134                                                  size_t size)
   135  {
   136          struct xen_gem_object *xen_obj;
   137  
   138          xen_obj = gem_create(dev, size);
   139          if (IS_ERR_OR_NULL(xen_obj))
   140                  return ERR_CAST(xen_obj);

This warning is old and it's actually the result of a bug I had in my
devel version of Smatch yesterday.  xen_obj can't really be NULL, but
if it were then the caller would return success which would probably
create some issues.

When a function returns both error pointers and NULL then NULL is a
special case of success.  Like say you have:  "p = start_feature();".
If there is an allocation failure, then the code should return -ENOMEM
and the whole thing should fail.  But if the feature is optional and
the user has disabled it in the config then we return NULL and the
caller has to be able to accept that.  There are a lot of these
IS_ERR_OR_NULL() checks in the xen driver...

The one here is clearly buggy because returning NULL would lead to a
run time failure.  All these IS_ERR_OR_NULL() should be checked and
probably changed to just IS_ERR().

This sort of change is probably change is probably easiest if you build
the Smatch DB and you can check if Smatch thinks the functions return
NULL.

~/smatch/smatch_data/db/smdb.py return_states gem_create | grep INTERNAL
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 58 |  (-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 62 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 66 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 68 | 0,(-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |

Smatch thinks that gem_create() sometimes returns NULL or error pointers
but that's because of a bug in the unreleased version of Smatch and
because gem_create() uses IS_ERR_OR_NULL().

   141  
   142          return &xen_obj->base;
   143  }

regards,
dan carpenter

