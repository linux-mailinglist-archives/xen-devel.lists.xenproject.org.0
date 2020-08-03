Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292C223AAA9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2dXR-0007lN-JI; Mon, 03 Aug 2020 16:42:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFGv=BN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2dXQ-0007lF-Ds
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:42:12 +0000
X-Inumbo-ID: 463e0638-d5a8-11ea-af5f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463e0638-d5a8-11ea-af5f-12813bfff9fa;
 Mon, 03 Aug 2020 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596472931;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+nnw8nebeoN62eFISAOEKZx22BhGHwjWOundpNtgQ3U=;
 b=eKNjw+zNtVpT0mGti0uqYMnpTAGSm0FsLc32DrL2PiOlSEaolvgw8shn
 Cm/5D5g35naH8LEv2KnrhIA7RDXw3VxzFTLpsNbFgzpdfH//utth5iIB+
 sdSSJCfiXZjIoF0AfUT4NWo9CaMDk1eSZ77hJ6oAE/6M0Bbe0hIM9iWIg s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IN6psQeimS3m9tz3vqJiiS6DFePeRHYEaIE0jQS64fO77MWSHpNsNqSxXd6On8LLhRqTYtKy61
 QjchKS/MivzEbrdwXGXsI5L2yNzGv83LcElAUGjAIuqpc3Q9SiLrE84p1gzfsHYw0NzcnLa6ht
 04jOUq/ij6Nv8kA8TlmqUCrDdgz8034QXhO8mNlR7Jv0i/xh20np87SNwq2bClE3w7sBpqarzO
 CklE1I6ETs60O8TllW6JYDvQA9B+LWrd0OULpBq0krFA58+dvh9qrpZilqGp8Ix6rsZlTrGokA
 eKg=
X-SBRS: 3.7
X-MesageID: 24093202
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,430,1589256000"; d="scan'208";a="24093202"
Subject: Re: [PATCH 03/10] x86emul: extend decoding / mem access testing to
 MMX / SSE insns
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
 <197bf5e9-5246-abfb-3870-6ca3dbaee152@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b8411bcf-f678-2e35-467a-6a0753d33461@citrix.com>
Date: Mon, 3 Aug 2020 17:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <197bf5e9-5246-abfb-3870-6ca3dbaee152@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/08/2020 15:50, Jan Beulich wrote:
> IOW just legacy encoded ones. For 3dNow! just one example is used, as
> they're all similar in nature both encoding- and operand-wise.
>
> Adjust a slightly misleading (but not wrong) memcpy() invocation, as
> noticed while further cloning that code.

I don't see any adjustment, in this or later patches.

Is the comment stale?

~Andrew

