Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4161248869
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k833m-0007Oh-2s; Tue, 18 Aug 2020 14:57:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k833k-0007Oc-JX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:57:56 +0000
X-Inumbo-ID: 65147df7-b736-4bd2-9141-a19bf2505d03
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65147df7-b736-4bd2-9141-a19bf2505d03;
 Tue, 18 Aug 2020 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597762675;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B4QKo2pGbqDzF0zq+yVWiJl1vowLsFJt++vvFiTLRWc=;
 b=FzHdLoZIva9m0jc2A4ml9MedCAnTV0i2Cw92TSAf4HedvMyaVihOO0IV
 iplaSoDGYzGrb4viLOfLf+P8vpUXaItgVRfeM3bd1/s90UspjS8dU11/s
 WED6fiRX0aNPBuNA8aaKXY/AlhgbN6LmTjkKBZqhTmjG1mF+F1+uhN24x c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Wclxz6J56F+CIBLQES2hZMmv+Zyjbl9cUNAe0IVj0AwD4mLxwHF7t8i3s1gRngs4oum08oIPm9
 G5HpxQXgtWvgIfwU5w0zEVAExj0P45/XGdSSCh7S1ZvgLLwvbZBGkYIe7ySTN81Y4KbCMD68L/
 gouxiUZEQyOvyncHKCuU4smBy308vKzVd5yS6yszWLX6Do9txhuNvPj8IRW64OOSelOJCPopj0
 ccJmesKCDYy3j4ji7n/D+Ujm42MotyHjP4EbZk4+cHpcPuja28l9M7nP/ciWk/67PO41piWSTO
 GIM=
X-SBRS: 2.7
X-MesageID: 24934891
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24934891"
Subject: Re: [PATCH 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bf00b33b-db1c-218a-834f-3aa623f19925@citrix.com>
Date: Tue, 18 Aug 2020 15:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-2-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> Such handling consist in checking that no bits have been changed from
> the read value, if that's the case silently drop the write, otherwise
> inject a fault.
>
> At least Windows guests will expect to write to the MISC_ENABLE MSR
> with the same value that's been read from it.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

