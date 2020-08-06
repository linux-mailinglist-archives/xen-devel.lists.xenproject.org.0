Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3E23D87C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3c4b-0001uu-AS; Thu, 06 Aug 2020 09:20:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zvyT=BQ=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1k3c4Z-0001un-HE
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:20:27 +0000
X-Inumbo-ID: b54d2ec2-fc36-4caf-9fc3-9f162f6ac9ab
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54d2ec2-fc36-4caf-9fc3-9f162f6ac9ab;
 Thu, 06 Aug 2020 09:20:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0769DP4M134775;
 Thu, 6 Aug 2020 09:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=K6nnIq7KbMdGmwq3DRCgXsdqJJG+nAKIN0b+IcOgc+k=;
 b=VBCNZ0B6tMfR1rKyX72Att5NUO6if4UBo9dHYDl+0D3q1NcsaDvCWtVjbHrVRnGpz+Ud
 x+ihOlgeDyR0x8PKISxsN7Wi0fs5rpqTqv77K4/3mB4xa8FbFlAx9iXJJ4ZMJO6qom7y
 umDcAh0fQbfMZh7yUC7s9oHI3OQ4H1pkGd/yCX4uFpcF8WusdLnV5nfVpNiqj4xyY49D
 AqxiVxYwMXOT1eEQP9aq1XCh5vWufjALgF8rY86Br7SxI+DUP7f1hNi71z1q7WUMAvyk
 daIl/wf/W3yD2yONtZ7Sym3V7oP4TmG+WPmyJSLme8ucD0jSm14WEvh5Vaas/7mgW53G tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32r6gwssvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 06 Aug 2020 09:20:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0769Dnvf019978;
 Thu, 6 Aug 2020 09:20:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 32r6cv0q8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Aug 2020 09:20:14 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0769KB5b024041;
 Thu, 6 Aug 2020 09:20:11 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 06 Aug 2020 02:20:10 -0700
Date: Thu, 6 Aug 2020 12:20:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Message-ID: <20200806092001.GV5493@kadam>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-3-andr2000@gmail.com>
 <6d719ab2-d9f6-2c3c-8979-b12a4d10b96d@suse.com>
 <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9704
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008060065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9704
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008060065
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 04, 2020 at 06:35:20AM +0000, Oleksandr Andrushchenko wrote:
> 
> On 8/4/20 9:12 AM, Jürgen Groß wrote:
> > On 31.07.20 14:51, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> >> display frontend" from Apr 3, 2018, leads to the following static
> >> checker warning:
> >>
> >>     drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> >>     warn: passing zero to 'ERR_CAST'
> >>
> >> drivers/gpu/drm/xen/xen_drm_front_gem.c
> >>     133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
> >>     134                                                  size_t size)
> >>     135  {
> >>     136          struct xen_gem_object *xen_obj;
> >>     137
> >>     138          xen_obj = gem_create(dev, size);
> >>     139          if (IS_ERR_OR_NULL(xen_obj))
> >>     140                  return ERR_CAST(xen_obj);
> >>
> >> Fix this and the rest of misused places with IS_ERR_OR_NULL in the
> >> driver.
> >>
> >> Fixes:  c575b7eeb89f: "drm/xen-front: Add support for Xen PV display frontend"
> >
> > Again forgot to Cc stable?
> 
> I was just not sure if these minor fixes need to go the stable, but I will add

Correct.  It's still a bug because it's setting the error code
incorrectly on the impossible path.  But fortunately impossible things
don't affect runtime.

regards,
dan carpenter


