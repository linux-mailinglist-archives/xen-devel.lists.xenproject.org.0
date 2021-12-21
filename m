Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40047C27B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 16:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250492.431440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzgoo-0004UZ-1Y; Tue, 21 Dec 2021 15:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250492.431440; Tue, 21 Dec 2021 15:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzgon-0004Sn-UV; Tue, 21 Dec 2021 15:12:45 +0000
Received: by outflank-mailman (input) for mailman id 250492;
 Tue, 21 Dec 2021 15:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzgon-0004Sb-0c
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 15:12:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7106035d-6270-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 16:12:43 +0100 (CET)
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
X-Inumbo-ID: 7106035d-6270-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640099563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1i5xVsn91I81IBVWBJ16l2jhGLcS4s2gGTzEYrlBBHs=;
  b=c1nv1A5uUeaYkJIlVijkHaRbjkIXH/fRaC/9KUNU0yLYGo5STQvsUMEb
   ocjdolUQmErzwOn0GfPYndhmNVmu64NC1X7rZPKPGyKNRMXaSM9fqkpA5
   JLwFJrR32XHtbDRjVbYZM1IMfYHRVASVi1RHaIITOqEPdh4djqdp7pKoj
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kCMhGUzK2ESYEVNYFWgAtF9JLDNHxheZU+MKDkL94PHykZXqh/bI+2bhZ+SuL3F+FMpeZCXXZ8
 nlkqmjFZSDiIroR+2KeQ3u8XHS27v8TGGbBwBYx4zlW5vHcu7B1Qy5O5ZBliAaS5o4aH8tWD/n
 4dW4B3HD0GNr3kPRSaPZEWdrqBBJQDHBTihTw6PEoJyTWmMraVZeRr4bzb28AqYYwVKRTIKIPv
 Z6Cax2hsNz7ZOL9f9Ukqm0rPbsF79ygUU4EOt1OvxEpF4O5ZXht+0A9QQG3wJHlGUAvgITw1Wc
 Le8utXvU3+mYAXm9KQsXiYOs
X-SBRS: 5.1
X-MesageID: 60908248
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nUwVdaLoEN7aT8eQFE+RPZIlxSXFcZb7ZxGr2PjKsXjdYENSgjcDz
 GoXD2GFbPncZWP1KIpzYY2w/UtTvZ+An99hQQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2nz+pO2
 dMct6CvSC4ROPOLkfsiAiBhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glo15geR6qOD
 yYfQShOMgXFcyRzAEgwT5Y7rciKgD7CThQN/Tp5ooJoujOOnWSdyoPFO9PPdtuHbc5chEqfq
 yTN+GGRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80iMosag18l3tVtTnVge0iHGBtx8YHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC+
 A+zoMLvVD5Tr7y8cXTDsb6LkmKLAH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsGRFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHLRl8FKBva/t3NjgbbhHRcFJG9OFoSHLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2lfC6SIu5DKmPNLKih6SdkifdpEmCgmbKgAjQfLUEy/lja
 f93j+7xZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeNm+58INI8wPwO/goKl
 1nkMnJlJJPErSWvAW23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:9131iqgXiLcjbx17+8AsT6duP3BQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="60908248"
Date: Tue, 21 Dec 2021 15:12:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@gmail.com>, Doug Goldstein
	<cardoe@cardoe.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 36/47] RFC, no-VPATH: Kconfig: only ready
 auto.conf from objtree
Message-ID: <YcHu1puptNbXyKkT@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-37-anthony.perard@citrix.com>
 <dcaba25d-180f-a1f5-671a-61ea4b2804cb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dcaba25d-180f-a1f5-671a-61ea4b2804cb@suse.com>

On Tue, Dec 21, 2021 at 03:23:48PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@gmail.com>
> > 
> > zconf_fopen() will open file in $srctree if the file isn't in
> > $objtree. This is an issue for "auto.conf" as it could be in the
> > source tree if it is dirty. With "auto.conf" read from the source
> > tree, kconfig will not properly set the file associated with a
> > CONFIG_* properly in "include/config/" and instead only touch the
> > files that correspond to new CONFIG_* option that were not set in the
> > "auto.conf" found in the source tree.
> 
> Do we really mean to support mixing in-tree and out-of-tree builds
> from one source tree? Without such mixing, iiuc there would be no
> such problem.

Could you read and reply to the cover letter instead? The second
paragraph of the v8 changelog speaks about this. I would rather have a
discussion about this on the cover letter thread than in a patch.

Thanks,

-- 
Anthony PERARD

