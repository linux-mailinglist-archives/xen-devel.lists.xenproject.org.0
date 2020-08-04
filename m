Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6423B979
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:20:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2uzU-0004HO-TG; Tue, 04 Aug 2020 11:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2uzU-0004HJ-7e
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:20:20 +0000
X-Inumbo-ID: eaa90474-3594-47d0-ae55-805b4948fc93
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaa90474-3594-47d0-ae55-805b4948fc93;
 Tue, 04 Aug 2020 11:20:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z18so33464039wrm.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=yC0YPO95gyvGNFiE8UyD0PZaDIuR1LSRi7PV1ffk01M=;
 b=tLvbmiSj1iiaT7waPbV59m+KIcaI24BuqtEVFyu+8sLN7Fd3qi7NuyQ7kH01HodT8Z
 ESzPAuNgsph2a5nTmz8i2vi/pBnxo8RyM1w89a5onfEqU/VgLC034Ri8mTOEQKj9aVd7
 BCGVahHWj3EjzVfgHuxRTcJETou/3/sfVgwmcq9gbXUgsPFZKvwtlxqM+sYO90Wrgo/h
 vwBP0QtHQBhvmBNJ3c7QXhfNayzNeA7+Vs2QiDrFrRNe0E5JSy+kU0nNRFuKfY/kGtmC
 yTJQY2x8Uzh60Y09mkBRpng6ZZBuBdJDEEHK6bkDgaMdEx1YhcDEdQiCb4orqYAdXLhA
 +62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=yC0YPO95gyvGNFiE8UyD0PZaDIuR1LSRi7PV1ffk01M=;
 b=O5uulMOzaDUc/+CXPGhY8/OOkAmmAMU0GUfLxmYcUGhjNvbrDcml14Pg3N4CEbh3N5
 qhd9004hgHY23Khv3yhU2/x1O/TPB1Kvo4U5VT000Y6I4MsDkZIrjKBgR5cEsfbppBoZ
 KJdIH5cj0PiwXihbDva3JoHMrW7+j478A2W85f5s5duykzfKTZXCnBRg1heXi3nz9nPb
 lrys/twGdDAY5SxYoOxAiVdbvCJAgTw5cFI0QBbIr+UuOsdoZcdI0X7rSs+rqYVhoH/+
 pIuwuRHUZB0DKQV+G6u78v0yv5eTKtl1HHgocIKKOxYO72QBDlweV+EWWnVQ0uw5/EAa
 S8Cg==
X-Gm-Message-State: AOAM530j3i7FB0jvqxlWlzVIynP1kbJJZxZx9fSsf8Nmh0Lu7hg2uNS5
 /ANQ36Bc2Y8Zn6VvX3Y0s6I=
X-Google-Smtp-Source: ABdhPJzPRebCvbG2tTzxQL+1XHHturL7PC6cMYb29QUxy1ViahvmvK5hWOnFZEgccpDvdQ3Sr27JwA==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr20527913wra.118.1596540018281; 
 Tue, 04 Aug 2020 04:20:18 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id z63sm4300492wmb.2.2020.08.04.04.20.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 04:20:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200803124931.2678-1-paul@xen.org>	<20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
In-Reply-To: <24361.17132.762055.478992@mariner.uk.xensource.com>
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Date: Tue, 4 Aug 2020 12:20:18 +0100
Message-ID: <002001d66a51$3cd055f0$b67101d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIYGZMBbauEfHj5QMvrSYCboUsizgIdsxRvAjZRG3+ogc3BwA==
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 04 August 2020 12:14
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore
> 
> Paul Durrant writes ("[PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via
> xenstore"):
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > set_mtu() currently sets the backend vif MTU but does not inform the frontend
> > what it is. This patch adds code to write the MTU into a xenstore node. See
> > netif.h for a specification of the node.
> >
> > NOTE: There is also a small modification replacing '$mtu' with '${mtu}'
> >       for style consistency.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 

Thanks.

> > diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
> > index 37e71cfa9c..24fc42d9cf 100644
> > --- a/tools/hotplug/Linux/xen-network-common.sh
> > +++ b/tools/hotplug/Linux/xen-network-common.sh
> > @@ -164,9 +164,21 @@ remove_from_bridge () {
> >  set_mtu () {
> >      local bridge=$1
> >      local dev=$2
> > +    local type_if=$3
> > +
> >      mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
> >      if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
> >      then
> > -            ip link set dev ${dev} mtu $mtu || :
> > +            ip link set dev ${dev} mtu ${mtu} || :
> > +    fi
> > +
> > +    if [ ${type_if} = vif ]
> > +    then
> > +       dev_=${dev#vif}
> > +       domid=${dev_%.*}
> > +       devid=${dev_#*.}
> > +
> > +       XENBUS_PATH="/local/domain/$domid/device/vif/$devid"
> > +       xenstore_write "$XENBUS_PATH/mtu" ${mtu}
> 
> It's surprising to me that this code doesn't have the xenbus path
> already in some variable.  But I guess from the fact that you've added
> this code, that it doesn't.
> 

It is set, but set to the backend path. For safety I guess it's probably best if I use a local in this instance. Can I keep your R-b
with such a change?

  Paul

> Ian.


