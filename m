Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD0819FB2E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVMa-0007c0-B9; Mon, 06 Apr 2020 17:16:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=06X9=5W=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLVMY-0007bv-LY
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:16:42 +0000
X-Inumbo-ID: 61a0dbb6-782a-11ea-800b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61a0dbb6-782a-11ea-800b-12813bfff9fa;
 Mon, 06 Apr 2020 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586193401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dw9qolkhXIn6b0T6yhcbrD/aJmWH4v6hLGN3vF3fBK8=;
 b=bAO2VbE3nnYP6pJLUEMrYvo/wDZeC1zAcuuYiewhT3ZoT0iUE7FJwLug
 coDy3OnCGGlLnOGhes1le7TAAxGlnrpZ7yMVgo3Jl5I+JKjNIULoxBydZ
 tWXk3y3DgQEklNhkUnHrtEtYzc9+pvvGzgYU3ydJC9e2e+7jV9Y8k77qH w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 61p/Hxv70zQnfNanLwCuMtI/mdPU1ZSSxLjAFfIgef6sApVUYnSJHMAYfOnW8uANV8AS2N0yIT
 Vf5v+Gaf8ayKF/U65vNby/Q7N4/I0KbK6CJoGwtUDEig5ia3pGgahxl5DxhFbP2iIkmEJTVTRr
 GlWxFF0NpRtXbvUqwyXTeoER8101SH6FWaDPaopeKkipPXDaLfWYySeqtr8JnNpaUepwhNdNxD
 Xty56atu35YBojAZtk94S+7IiroEpM1m7hWd6TBP5Q/no0osAtmn6sfC030hQzwynqpZg1JS85
 9lk=
X-SBRS: 2.7
X-MesageID: 15573591
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15573591"
Date: Mon, 6 Apr 2020 18:16:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for-5.0] xen-block: Fix uninitialized variable
Message-ID: <20200406171637.GU4088@perard.uk.xensource.com>
References: <20200406164207.1446817-1-anthony.perard@citrix.com>
 <325e0ffb-2f1b-cbfd-6b24-0d912a9aabe2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <325e0ffb-2f1b-cbfd-6b24-0d912a9aabe2@redhat.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 06, 2020 at 06:50:41PM +0200, Philippe Mathieu-Daudé wrote:
> On 4/6/20 6:42 PM, Anthony PERARD wrote:
> > Since 7f5d9b206d1e ("object-add: don't create return value if
> > failed"), qmp_object_add() don't write any value in 'ret_data', thus
> > has random data. Then qobject_unref() fails and abort().
> > 
> > Fix by initialising 'ret_data' properly.
> 
> Or move qobject_unref() after the error check?
> 
> -- >8 --
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 07bb32e22b..f3f1cbef65 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -869,7 +869,6 @@ static XenBlockIOThread *xen_block_iothread_create(const
> char *id,
>      qdict_put_str(opts, "id", id);
>      qmp_object_add(opts, &ret_data, &local_err);
>      qobject_unref(opts);
> -    qobject_unref(ret_data);
> 
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -878,6 +877,7 @@ static XenBlockIOThread *xen_block_iothread_create(const
> char *id,
>          g_free(iothread);
>          return NULL;
>      }
> +    qobject_unref(ret_data);

That won't help, qmp_object_add() doesn't change the value of ret_data
at all. The other users of qmp_object_add() passes an initialised
'ret_data', so we should do the same I think.

Thanks,

-- 
Anthony PERARD

