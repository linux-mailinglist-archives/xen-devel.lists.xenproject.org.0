Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A791F744C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 09:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjdjD-0000ug-JZ; Fri, 12 Jun 2020 07:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjdjC-0000ub-Ga
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 07:03:50 +0000
X-Inumbo-ID: dcb3ac3c-ac7a-11ea-b5a8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb3ac3c-ac7a-11ea-b5a8-12813bfff9fa;
 Fri, 12 Jun 2020 07:03:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD914AB76;
 Fri, 12 Jun 2020 07:03:50 +0000 (UTC)
Subject: Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4a5edcf7-06b3-55d9-3ae1-5165ca63faa9@suse.com>
Date: Fri, 12 Jun 2020 09:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610114004.30023-1-andrew.cooper3@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.06.20 13:40, Andrew Cooper wrote:
> c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
> layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
> but failed to fix up the error path.
> 
> c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
> _open()" fixed up the xencall_open() aspect of the error path (missing the
> osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
> incorrectly, creating the same pattern proved to be problematic by c/s
> 30a72f02870 "tools: fix error path of xenhypfs_open()".
> 
> Reposition xtl_logger_destroy(), and introduce the missing
> osdep_xendevicemodel_close().
> 
> Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
> Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
> Backport: 4.9+
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

