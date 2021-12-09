Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D246E6FA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242928.420111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGxM-00014y-Eb; Thu, 09 Dec 2021 10:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242928.420111; Thu, 09 Dec 2021 10:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGxM-000129-BX; Thu, 09 Dec 2021 10:47:20 +0000
Received: by outflank-mailman (input) for mailman id 242928;
 Thu, 09 Dec 2021 10:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMhz=Q2=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mvGxK-00011y-Ta
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:47:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f3c4f8f-58dd-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 11:47:16 +0100 (CET)
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
X-Inumbo-ID: 5f3c4f8f-58dd-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639046836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NrQInU9jEGMCs/qImw0f7a7AV8AMHpnZdm00kaXJXPI=;
  b=hQg0t8z3W1utzUEFGAZ2PQWqvMeg7whfaDBpMGr5yWaPcFfO3Jaw7QyH
   dwjhrHKs6CqbZ9Hn95L4HlttbmI8KkML6MdMD0KGvY4sk6nZBCIfNuF2Z
   Rtk25qV1sUjUCJ5S6pqX9gD9+gfx/2zLHvquS5sa9BrNQIIUHgZKXWmgY
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YR3u7vTC5ReZLCjDENB2cJVfzQF/8cttL9lQpXRDs6gvu0TAgbPgIVtSmwaGWJX1Tg+yOcGnsg
 cJcajUKB+lBkAN2ms3jVQIwN1KVUfEKG2E98vR+V/+Lk7sgv9r/WIJtMd5VANhDSAkGBY3gq6C
 7UMhJXKFewEhQbNi1WRMTvLj92kdJnCPMDVm0Z88xDAPFblEZUCpOnkv4fIKbF1tZgImlswoOf
 ryNNsM5s3xRWYjnaPnPR/Bao4wMfUM+v9/zEWLWsUpmoyC1JPt681ECLljk1HVS82oljBUledx
 vj/OJH15lpmup79jrP8Qcby8
X-SBRS: 5.1
X-MesageID: 59623335
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m8SQ7qoAjQxXRTP00Bxjx0ZvYaZeBmLqYhIvgKrLsJaIsI4StFCzt
 garIBmCbq2JNDP0f990Pt/l8RlQucOHzNRkSFZuritgFilE+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24DoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnby3CjcFPaGdpM8ccCJpEA0mBYtG9IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ptHM2E0N0mojxtnJGkRU6MYzfWTv2T7UQ9njW2L9KcF7D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZrn1+71mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM0rQT0n0
 HeZktWvAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHDp8IDohHDH+pIEY2Ov97ZQQnWw
 zyz+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0sxpDGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGptcEdMKS
 BWK0e+02HO0FCH1BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzyxh9wfBlZ
 83DLZ3E4ZMm5UNPlmXeegvg+eVzmnBWKZ37G/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X2SeadF7UMy87M9sCn/9X9BoGAMDlBn7ws1BLXGplxPx3m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:s0qJx6CRVo9We1vlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,192,1635220800"; 
   d="scan'208";a="59623335"
Date: Thu, 9 Dec 2021 10:47:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH] MAINTAINERS: widen Anthony's area
Message-ID: <YbHerh0yByozO6VM@perard>
References: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>

On Wed, Dec 08, 2021 at 08:07:55AM +0100, Jan Beulich wrote:
> As was briefly discussed on the December Community Call, I'd like to
> propose to widen Anthony's maintainership to all of tools/. This then
> means that the special LIBXENLIGHT entry can go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

