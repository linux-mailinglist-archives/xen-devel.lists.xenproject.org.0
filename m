Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02432E938B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61093.107226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNMb-0002Ys-QB; Mon, 04 Jan 2021 10:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61093.107226; Mon, 04 Jan 2021 10:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNMb-0002YT-MQ; Mon, 04 Jan 2021 10:45:25 +0000
Received: by outflank-mailman (input) for mailman id 61093;
 Mon, 04 Jan 2021 10:45:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwNMZ-0002YO-MD
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:45:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56491977-f50c-449c-bd83-2dfdc76740c0;
 Mon, 04 Jan 2021 10:45:22 +0000 (UTC)
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
X-Inumbo-ID: 56491977-f50c-449c-bd83-2dfdc76740c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609757122;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xfAJ3B5SCRSyTqb7+ggxKp+jpjyiBtIXYpx/jIaBI9E=;
  b=NKgaCZWdZ7ldHAa+UHULcsSGV/DHPsCwyS4eXxbGi1TguQcaFKZrqXcE
   F1VP/JlDt21fOPdoNPdq1Q0c8aEsFj2/xwRvOoFd787rx7fp2lO7Wzswu
   2g7N+/6F4pz9c7K7HcRx4qidJuZ87L8zlOYTNi5VPRaOh1j2EXpGsrsbc
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9fYeqaHGTZraoqaBBdUCpwARpX6MmrxhStVtULBWvlTLO1ievx/1iWvTZxzPf8c4lmtsP1eyXF
 9eVaCPh4vFtw16DjTWVCcxHhdRa1ZIysHwysQVoiEZxBveRZ3RDR5OsVNftaYpUE7Z1LcB7H0X
 VgaaFNh7X7ZEArPpmViXx67HsZPCY49C4yuTYrJc+ZZy0flBhFLSV3iiHVFPdESgDdLmni2uQH
 jdFMq7nY8qLpGGZrnVaPArY5qwza1fZU7+f7B51jKKqxH7/15CyTA1o9fF5+K9qFQnKJghTL+f
 zzI=
X-SBRS: 5.2
X-MesageID: 34368181
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,473,1599537600"; 
   d="scan'208";a="34368181"
Subject: Re: [PATCH] x86/p2m: fix p2m_add_foreign error path
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
References: <20210104090323.67465-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7e025bff-792a-0c68-407a-3248315711d0@citrix.com>
Date: Mon, 4 Jan 2021 10:45:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104090323.67465-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 04/01/2021 09:03, Roger Pau Monne wrote:
> One of the error paths in p2m_add_foreign could call put_page with a
> NULL page, thus triggering a fault.
>
> Split the checks into two different if statements, so the appropriate
> error path can be taken.
>
> Fixes: 173ae325026bd ('x86/p2m: tidy p2m_add_foreign() a little')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked and committed.

~Andrew

