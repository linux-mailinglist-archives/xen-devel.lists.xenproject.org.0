Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44A4F924B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 11:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301283.514135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclJi-00083R-Vp; Fri, 08 Apr 2022 09:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301283.514135; Fri, 08 Apr 2022 09:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclJi-000813-Rq; Fri, 08 Apr 2022 09:54:10 +0000
Received: by outflank-mailman (input) for mailman id 301283;
 Fri, 08 Apr 2022 09:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXVu=US=citrix.com=prvs=090e341e7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nclJg-00080x-QJ
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 09:54:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2eb159f-b721-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 11:54:07 +0200 (CEST)
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
X-Inumbo-ID: d2eb159f-b721-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649411647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dxp93n2HD9AxpqLZ/PlJbBq+qNAF8oUrnFTeJkkwvdI=;
  b=bSbAIesh+0EnzmjeKBGGTELHcpMfFmoyQvGX1R/Asj1Djm0X27m7sPT4
   2SWev91/p+256670IamYCfNlWTK8iW9/V/iacEpr+e1KveBPxoXr3iyS/
   yjzpRRtnHNXEEgrRgCtJ36LVWvn39HC13A2ndZjmHKCfBLUJiZTr4car3
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68366493
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0idMjqLE5sNrj6w8FE+RFJUlxSXFcZb7ZxGr2PjKsXjdYENShmcPm
 mscX2+FP/aIa2b0e4h+Ot/gpEJX75bUyNAxG1ZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I1PmJaITQcqBKKPwMcMekMBLA8uObITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6aFO
 ZRFOGEHgBLoTkdjJnxQKb0HjMCHnGHlSx8CqVi4qv9ii4TU5FMoi+W8WDbPQfSVSMQTlUaVo
 ErP5WG/CRYfXPSAzRKV/3TqgfXA9Qv5V5gVD6aQ7eNxjRuYwWl7IBkLXlL9r/C/gUO6X893I
 lYRvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAOQyRdctUguIkzTCYzy
 16St9rzAHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iNkxoxj3StZgKqH21v7kMGup/
 B7aqDdr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5ZIVcFg
 2eJ4Gu9AaO/2lPwMMebhKrrVqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8vKK5bxUCZFVv0+pNZTewv7+eV2rszZ7TmNLa0XMjz9iebODJJrYelt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydcon9iJkYHZ0ZD5FGRELOO6S0UvWTLNvFZFPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:OUDvBqi6qWC0uKEDUS+sulKLSXBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68366493"
Date: Fri, 8 Apr 2022 10:54:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 1/6] tools/cpupools: Give a name to unnamed cpupools
Message-ID: <YlAGOLvpHMcxp1PG@perard.uk.xensource.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-2-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220408084517.33082-2-luca.fancellu@arm.com>

On Fri, Apr 08, 2022 at 09:45:12AM +0100, Luca Fancellu wrote:
> With the introduction of boot time cpupools, Xen can create many
> different cpupools at boot time other than cpupool with id 0.
> 
> Since these newly created cpupools can't have an
> entry in Xenstore, create the entry using xen-init-dom0
> helper with the usual convention: Pool-<cpupool id>.
> 
> Given the change, remove the check for poolid == 0 from
> libxl_cpupoolid_to_name(...).
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v6:
> - Reworked loop to have only one error path (Anthony)

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

