Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345A4F37BF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 16:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299113.509627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk6a-00027W-5U; Tue, 05 Apr 2022 14:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299113.509627; Tue, 05 Apr 2022 14:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk6a-000252-20; Tue, 05 Apr 2022 14:24:24 +0000
Received: by outflank-mailman (input) for mailman id 299113;
 Tue, 05 Apr 2022 14:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLbn=UP=citrix.com=prvs=0878235d2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbk6X-00021u-PD
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 14:24:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c41992-b4ec-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 16:24:20 +0200 (CEST)
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
X-Inumbo-ID: 13c41992-b4ec-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649168660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZI+unHahHiJhTMT+graTuIHpLZ2cRUWGttaIkS9G8g=;
  b=cohQS7MHcjSVS+v2axs/ZC08+7nNQODAK5co3PF8JO2W0ZNiV/Sa5M6J
   nOkCsjWL5ZtOLbBxuJOre6G7SqKWIJhxjILLd1rL7vD9eAex6KEnDUxKn
   N2fASpuCH/o0HvcHrQmtiMNUGjkrpIgzCoXXlDKtLz6aLrjbladwiwLVl
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 68068257
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kGda9KreGPa4VtqjvROAuIgSFJVeBmJiZBIvgKrLsJaIsI4StFCzt
 garIBmPPayCazCjc9BwPY3j8EgAvcWHyoM2GwZpqi9jQylH9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y6q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPInts8cWWUdjDjx3GrxtyYb9Oki1mJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPEyeM0cSZT/7DrowoMKSp1fkWQderU+7goYp4TLK9ixYhe2F3N39P4biqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTvyRYY6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHmXxC+vHOVlhEZUttUVeY97Wml06fR/kOVC3YJShZHb9opstJwQiYlv
 neQktb0QCB1saOUQHa18LCSojWvfy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJs+AZ0ArYm
 1iixBXSTZ1J0qbnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:PcYl2638jRxgM4wUCzfa/AqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68068257"
Date: Tue, 5 Apr 2022 15:24:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] hw/xen/xen_pt: Resolve
 igd_passthrough_isa_bridge_create() indirection
Message-ID: <YkxRCYmMYYmU3lsW@perard.uk.xensource.com>
References: <20220326165825.30794-1-shentey@gmail.com>
 <20220326165825.30794-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220326165825.30794-3-shentey@gmail.com>

On Sat, Mar 26, 2022 at 05:58:24PM +0100, Bernhard Beschow wrote:
> Now that igd_passthrough_isa_bridge_create() is implemented within the
> xen context it may use Xen* data types directly and become
> xen_igd_passthrough_isa_bridge_create(). This resolves an indirection.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

