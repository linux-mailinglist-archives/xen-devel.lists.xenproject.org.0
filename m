Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476F23B515
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 08:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2qby-0002Xl-7T; Tue, 04 Aug 2020 06:39:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2qbw-0002Xg-8I
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 06:39:44 +0000
X-Inumbo-ID: 4722aedb-d61d-11ea-b00d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4722aedb-d61d-11ea-b00d-12813bfff9fa;
 Tue, 04 Aug 2020 06:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CA57AC20;
 Tue,  4 Aug 2020 06:39:58 +0000 (UTC)
Subject: Re: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-3-andr2000@gmail.com>
 <6d719ab2-d9f6-2c3c-8979-b12a4d10b96d@suse.com>
 <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1ae2e8b4-eea3-e68b-2897-5e376a688881@suse.com>
Date: Tue, 4 Aug 2020 08:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.20 08:35, Oleksandr Andrushchenko wrote:
> 
> On 8/4/20 9:12 AM, Jürgen Groß wrote:
>> On 31.07.20 14:51, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
>>> display frontend" from Apr 3, 2018, leads to the following static
>>> checker warning:
>>>
>>>      drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
>>>      warn: passing zero to 'ERR_CAST'
>>>
>>> drivers/gpu/drm/xen/xen_drm_front_gem.c
>>>      133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
>>>      134                                                  size_t size)
>>>      135  {
>>>      136          struct xen_gem_object *xen_obj;
>>>      137
>>>      138          xen_obj = gem_create(dev, size);
>>>      139          if (IS_ERR_OR_NULL(xen_obj))
>>>      140                  return ERR_CAST(xen_obj);
>>>
>>> Fix this and the rest of misused places with IS_ERR_OR_NULL in the
>>> driver.
>>>
>>> Fixes:  c575b7eeb89f: "drm/xen-front: Add support for Xen PV display frontend"
>>
>> Again forgot to Cc stable?
> 
> I was just not sure if these minor fixes need to go the stable, but I will add

I'm fine both ways.

Its just a reflex when I'm seeing a Fixes: tag but no Cc: stable. :-)


Juergen

