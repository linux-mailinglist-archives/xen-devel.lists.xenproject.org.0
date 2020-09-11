Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAC265EDD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 13:36:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGhL5-0008RS-Nm; Fri, 11 Sep 2020 11:35:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGhL3-0008RN-JK
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 11:35:33 +0000
X-Inumbo-ID: 50974a8b-722d-4c19-8c62-5adc881c24e3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50974a8b-722d-4c19-8c62-5adc881c24e3;
 Fri, 11 Sep 2020 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599824132;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LmXBP6vgAxGau0UtQxFjw2IIuy0VgQ+8iTczHo+bFuc=;
 b=NQvoqrENaSFdHN3TwTDIJbqPLO+pZ77a4WYdD76NqHL0CM5nEBBRhVnR
 L+y4KFgB+7H2H2eFjrln9vHnn4I1GP4x0lG5JGxGdYQ1dRotBAD3xz195
 q0S8DaihB4w6+PpjVc1cQ2+M7IaEqQeW2bJifXmC3A3cLgra6TZPvKGTA o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ctCVdZuX24O+5q5XP/E0HfAsueIMv7AGAZ4wddJ4x3xcQZN5jlwJ0rYmJcJYnZfXuVJsvFlx6D
 Om3hhLUUsLSn3FLO9waIIfRjzjU0jtj1KupV8FP7xGiiumjUTLbfq9oyIyaSwVkurq+Lsfv+Hi
 P3T34FspnRCsczDm71dCBa+BJV3PLHCntcyW8DA0ILygPRhkROP/GMReFXZ608DQwmuDDPFmIX
 uee/YoZ3d9GQTkcnX1YFAJ8UwOYUsjfqj24yzGW7MFdzEtcmn4xlQlNqG3pJjvMC7oeEEoBSAs
 Dhc=
X-SBRS: 2.7
X-MesageID: 26493329
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26493329"
Subject: Re: [PATCH] x86/PV: fold exit paths of ptwr_do_page_fault()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <839f005e-e36a-14be-c2bb-83cb999e783b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8c812b6c-9ef0-ab7f-dba0-87b9316b537e@citrix.com>
Date: Fri, 11 Sep 2020 12:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <839f005e-e36a-14be-c2bb-83cb999e783b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 11/09/2020 11:35, Jan Beulich wrote:
> One less aspect to keep an eye on for things to stay in sync.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

