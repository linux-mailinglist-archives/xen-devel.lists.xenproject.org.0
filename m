Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8938C1BC201
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRco-00016O-74; Tue, 28 Apr 2020 14:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0V7=6M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTRcn-00016F-3O
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:54:17 +0000
X-Inumbo-ID: 219bc3a4-8960-11ea-9879-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 219bc3a4-8960-11ea-9879-12813bfff9fa;
 Tue, 28 Apr 2020 14:54:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k1so25031667wrx.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 07:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VoPA4W7BZVH2jWUzs+94ypS6QS/QPthapxnGLEr38SQ=;
 b=rWP/gNc07yNm9/tpiyY1muD1fIQLTmFX0KGClE+A+YzXQZ17wppBBumRP3jjc5Bqda
 3eLVJeVjmn3E9/5b/Ljlr76Zh7QdLFAVd33okoA7RmfTm5YiSzqpUGMghG7I27jWeNNO
 9pX4H4lEFP8V07lYUZLZU09hyZx7iTVgjLL4dPXAbBj4rN37/5r+xGetIfZimq7+xAnd
 aGHmvDP20CfHb+veLK8EbdyqZBwpc0td5oh5rHKP+wQO4LbHeTWcnusxcJnAB4Yo7e5t
 MK+XtQa2PxfgDS5cvnjJH2lQME5xiN30AyADAqLvzF4UeKSh2hPrss85vI70enfN+LZu
 JBCw==
X-Gm-Message-State: AGi0PuYZyGQd9gf7tf12nPRtHmmJ2u8AApT12994CKEDOSppl9bZOgcR
 uQvMRcLVf5+psrgnkt3uiDk=
X-Google-Smtp-Source: APiQypKw+9/PVGXtY8GYvMPHL86MIn6z3tjyNarh4OGinN+KhwrRlvfZlZ2zpEwcxsXJ+FXbzh1VxQ==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr35125363wrj.114.1588085655818; 
 Tue, 28 Apr 2020 07:54:15 -0700 (PDT)
Received: from [192.168.1.64] (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id z18sm25264753wrw.41.2020.04.28.07.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 07:54:15 -0700 (PDT)
Subject: Re: [XEN PATCH v5 16/16] build, include: rework compat-build-header.py
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-17-anthony.perard@citrix.com>
From: Wei Liu <wl@xen.org>
Message-ID: <af8752f1-9684-48d5-19ad-800c989cefa0@xen.org>
Date: Tue, 28 Apr 2020 15:54:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-17-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 wl@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 21/04/2020 17:12, Anthony PERARD wrote:
> Replace a mix of shell script and python script by all python script.
> 
> No change to the final generated headers.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

To the best of my knowledge this patch is doing the right transformation.

Acked-by: Wei Liu <wl@xen.org>


