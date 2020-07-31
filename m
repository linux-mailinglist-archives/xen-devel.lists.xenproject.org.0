Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2C2348C9
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 17:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1XR4-0005Fq-Qe; Fri, 31 Jul 2020 15:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1XR3-0005Fl-BT
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:59:05 +0000
X-Inumbo-ID: c1d34971-d346-11ea-8e65-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d34971-d346-11ea-8e65-bc764e2007e4;
 Fri, 31 Jul 2020 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596211144;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Rj+yjfDtynwRGMOHPflgAH/QmhH8AaC6v2zvrjV9jC4=;
 b=bHfMGwGaPBg67AlLgwqL2dIRgGW6G+xyrNFIZOZCufPzz+t50Qt65qhG
 +yE8raeKBKr8T6MUeViXZEQkeCG3volPr4w69S0cD17lt2hshEpWzlW35
 p2NAe+mAbzl6mJ5zgegwwoo/zs6jYnMaebFclFjQQgP7GyklwMpjD9NaM o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lB2fu8k/XhNyde5cP8VBfCws3qdrOrigCS6I7rjMSRU5/MJg5cb9rheJTikGicG0tVE0NKrEbp
 hJm2qu5I6WLMMWzRU1OJILI//ixFAmNFdlfhYhmZgEjewWIJq+FgeVnEnJAa2kQSKWbo0R/2JY
 q4GjH1Yynx6O3vJho8bvubYbzPKaHYmrUsOT6xXaHv4my+gHWRyB1E54Sv57TD98QEvsOhVcOa
 PCVYUU2zIP5Lt/8RD+CqTqDrAnajIzYBVdHspHQdxQhH1bN1OUGDfagSRu+Pl/81qcDB/DeVhJ
 1Ms=
X-SBRS: 3.7
X-MesageID: 23963620
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23963620"
Subject: Re: Ping: [PATCH v2] x86emul: avoid assembler warning about .type not
 taking effect in test harness
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <42875d48-10e4-cc88-70ac-8979fea2493c@suse.com>
 <bf92faf4-b323-d4be-ca31-5e065c576b9a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6178d558-1826-120d-51fd-4daee8712fa8@citrix.com>
Date: Fri, 31 Jul 2020 16:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf92faf4-b323-d4be-ca31-5e065c576b9a@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 15:54, Jan Beulich wrote:
> On 14.07.2020 10:06, Jan Beulich wrote:
>> gcc re-orders top level blocks by default when optimizing. This
>> re-ordering results in all our .type directives to get emitted to the
>> assembly file first, followed by gcc's. The assembler warns about
>> attempts to change the type of a symbol when it was already set (and
>> when there's no intervening setting to "notype").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

