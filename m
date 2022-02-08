Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6B4AD593
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268066.461843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNym-0000Pr-8n; Tue, 08 Feb 2022 10:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268066.461843; Tue, 08 Feb 2022 10:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNym-0000Oe-3P; Tue, 08 Feb 2022 10:44:12 +0000
Received: by outflank-mailman (input) for mailman id 268066;
 Tue, 08 Feb 2022 10:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHNyk-0000OY-Oz
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:44:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae7aff8-88cc-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:44:09 +0100 (CET)
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
X-Inumbo-ID: 0ae7aff8-88cc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMIK6DJc8n/Bh429K4rk45ExdQCkxUbwU40lVok1ZK0=;
  b=X3t35wiNViU2ytIhXMQXkfIhxZKn6GciCMyD6x1noc/CiqG5V0px1z3H
   tGBUG891uWMNlg6xqpm526YB1kLW1NMYaemYx/HUrA/963zAfMqiFqnn4
   /8RPJtUA4HCHvpXudb/WHgoV82+QZbdfr/vW9m3KRXY4Ix48iFxVsOIZZ
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VRZVH62rDn8DawEeJCf0yBaE2wGh6pd77mEhgL+Au8CeV9CfVb5eBsSWs9xAnnjXXYplztuC+z
 2AqUTrzZ1v+hgYdWuS7lSMWl3d09Jo/ajrbD8ABIaXKWmYYjyi0GEe3++GMhaX4wgCTiTCXLdY
 yDMuDZKOv7HthmH9Mw0AE9D4mfpS6oe0BS6SilEBiFn8a9TFiGHmP5qPauCVaJQV6epfPmIOrG
 LRkJ2eVir1Wpswy5HXKUNXWieAity8lT3yN6UTFXH+STaK/3LSNeHKaxJjkKMV+LsIgiWyi2tP
 SHOLK8ysp35sjsmYf5G5eMAS
X-SBRS: 5.1
X-MesageID: 64125210
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TnOEfqK0VHd/zRtkFE+RF5IlxSXFcZb7ZxGr2PjKsXjdYENS12MPx
 zFNXDzQPfnZZTP2L4wjbIvjpEsDupLWm9dkSwNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2nsctfk
 PASmqaUci4nefz3wuBMTUlxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gls35oTR6+GD
 yYfQTdAZTTiaAZ9A0s8GpMYrcz0rSn0XhQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoj0eU3Xc7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFCqpTBEfoV/KckBwQ/Km5GO51eHVkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q238oif9LNoJu1mSwXuF1e5eKFfUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD7n5lnwv7G8ukpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZPVkk4CC72nOUE6M+c7dDg3EJTyPriuw+Q/SwJJClMO9LgJB6CDzLU/VZZimqgJxO7E8
 mvkAh1TyUblhG2BIgKPMygxZLTqVJd5jHQ6IS1zYgr4hyl9Od6ivPUFap86Xbg77+g/n/R6e
 OYIJpebCfNVRzWZpzlENcvhrJZvfQiAjB6VO3b3eyA2epNtHlSb+tLtcgb12jMJCy676Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnWo3PEtIswKJRHS/Reg1
 l6bUUUCuO3Ag44p692V16qKmJikTrllFU1AEmiFsbvvbXvG/nCuyJNrWfqTeWyPT3v9/aiva
 LkHz/z4N/Fbzl9Gv5AlTuRuxKM6odDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FA9DLQUoWe2PyPUIl2SA9v8yOkj7uHd68bfvvZ++5PVQZPix9IdIDb4=
IronPort-HdrOrdr: A9a23:eeONCq+C/5GoMpiyo/Buk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="64125210"
Date: Tue, 8 Feb 2022 10:44:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/5] tools/include: generate a _xen_list.h file
Message-ID: <YgJJdBqUkjTTT6fT@perard.uk.xensource.com>
References: <20220208070638.5909-1-jgross@suse.com>
 <20220208070638.5909-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208070638.5909-2-jgross@suse.com>

On Tue, Feb 08, 2022 at 08:06:34AM +0100, Juergen Gross wrote:
> Today tools/include contains two basically identical header files
> generated from the same source. They just differ by the used name space
> and they are being generated from different Makefiles via a perl
> script.
> 
> Prepare to have only one such header by using a more generic namespace
> "XEN" for _xen_list.h.
> 
> As the original header hasn't been updated in the Xen tree since its
> introduction about 10 years ago, and the updates of FreeBSD side have
> mostly covered BSD internal debugging aids, just don't generate the
> new header during build, especially as using the current FreeBSD
> version of the file would require some updates of the perl script,
> which are potentially more work than just doing the needed editing by
> hand. Additionally this enables to remove the not needed debugging
> extensions of FreeBSD.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

