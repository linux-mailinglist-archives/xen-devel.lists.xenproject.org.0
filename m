Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F391B2EA0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 19:52:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQx4Z-00086O-F3; Tue, 21 Apr 2020 17:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vwqf=6F=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1jQx4Y-00086J-8V
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 17:52:38 +0000
X-Inumbo-ID: e22df816-83f8-11ea-83d8-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e22df816-83f8-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 17:52:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LHmYJX096737;
 Tue, 21 Apr 2020 17:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Gb8/bLuXjV1Ljp3couvoG3LVw9WMnRQZdKtizYgqvV0=;
 b=s0T1NKhXBkHfhF4J/h9RNAJlV2m/vMNEQAuA5pQdN+egk4GtuDJA6qZhBtfVkSlCyezV
 bAHSv7qngCX470G0LaK9ZT+JsV9ndJUMfIRfe8Ul7FhCjfDMS6qYFq+xSHIkj9zUCNOk
 y+948CrOTthzKc3sALfJhvAzabjT7TOuHP+x2iRw3jKs8O/zp5+/DSGQSa+drkyPpcUF
 /4Q8h4cMqfCzmIamZ/7paLiWutTm4SPNw0kZWuB1/rQLLeBFArhoyCFdDLhJUftyvSkA
 3NY9gSo3CZOkN4cP0j9r6UlZBdEe48LMFRC74/DcvOoLxtmm0uZlx7ygOfRd+Oa909WP Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30fsgkxg3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:52:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LHlZIq138730;
 Tue, 21 Apr 2020 17:52:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 30gb3skhse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:52:28 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03LHqR90031728;
 Tue, 21 Apr 2020 17:52:27 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Apr 2020 10:52:26 -0700
Date: Tue, 21 Apr 2020 20:52:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Message-ID: <20200421175220.GE2659@kadam>
References: <20200421104522.GA86681@mwanda>
 <alpine.DEB.2.21.2004211728360.3118@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2004211728360.3118@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=2 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004210137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=2 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210137
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
 dri-devel@lists.freedesktop.org, oleksandr_andrushchenko@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 05:29:02PM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 21 Apr 2020, Dan Carpenter wrote:
> 
> > Hi Kernel Janitors,
> >
> > Here is another idea that someone could work on, fixing the
> > IS_ERR_OR_NULL() checks in the xen driver.
> >
> > The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> > display frontend" from Apr 3, 2018, leads to the following static
> > checker warning:
> >
> > 	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> > 	warn: passing zero to 'ERR_CAST'
> >
> > drivers/gpu/drm/xen/xen_drm_front_gem.c
> >    133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
> >    134                                                  size_t size)
> >    135  {
> >    136          struct xen_gem_object *xen_obj;
> >    137
> >    138          xen_obj = gem_create(dev, size);
> >    139          if (IS_ERR_OR_NULL(xen_obj))
> >    140                  return ERR_CAST(xen_obj);
> 
> Are the other occurrences of this also a possible problem?  There are a
> few others outside of xen.

We sometimes check a parameter for IS_ERR_OR_NULL().

void free_function(struct something *p)
{
	if (IS_ERR_OR_NULL(p))
		return;
}

That's fine, absolutely harmless and not a bug.  But if we are checking
a return value like this then probably most of the time it's invalid
code.  Normally it's again like this code where we're dealing with an
impossible thing because the return is never NULL.  The common bugs are
that it returns NULL to a caller which only expects error pointers or it
returns success instead of failure.  But sometimes returning success can
be valid:

	obj = get_feature(dev);
	if (IS_ERR_OR_NULL(obj))
		return PTR_ERR(obj);

It deliberately returns success because the rest of the function is
useless when we don't have the feature.

regards,
dan carpenter


