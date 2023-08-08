Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3032773A8C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579925.908128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN2d-0003WO-7X; Tue, 08 Aug 2023 13:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579925.908128; Tue, 08 Aug 2023 13:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN2d-0003Tr-3s; Tue, 08 Aug 2023 13:46:31 +0000
Received: by outflank-mailman (input) for mailman id 579925;
 Tue, 08 Aug 2023 13:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTN2b-0003Tl-AS
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:46:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8166ebb-35f1-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:46:28 +0200 (CEST)
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
X-Inumbo-ID: f8166ebb-35f1-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691502387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QhRcYhG/lkFwGKf2f9TvUdQxSdlBQ94FWwsoAVwZKdw=;
  b=SJlHuqRz3yAIwYPG/UVKbSpswD/0otlk24boroQjXPSdqp3yHzyUVv5T
   vyKwn264VTdB84divNCtFbMwlB/mJQdTUtz88Tf4r+KPRpwrvcr7aqjHQ
   c8/xEVdS4G7BOn3wHaWUxJ8OAYrbuqBpVIGsCVEaOqOLtCoiQlIg2PxEM
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117538111
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:IHateKIR7qz5sK8KFE+R95UlxSXFcZb7ZxGr2PjKsXjdYENS0GYEm
 jdLUWqHO6uNZDahKd11Po2z9xwCu57WyoQ3TQBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5KKG5Uq
 +IXCQwBfzS6veXuxbaDdrFV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJoIxRbB/
 zuuE2LRHR85F9KN6T+/9neRtrHlrSrLB6FJLejtnhJtqALKnTFCYPEMbnO5ruO+kVWWQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceTCQnz
 FaTk/v1BDZkt/ueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDryZ9l5TrC6r+H5CBXJ+
 TfSqSwGu+0q2JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BO
 he7VeB5vsU70J6WgUhfPeqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/BmZ
 czAK5fwXS9KYUiC8NZRb71EuYLHOwhknT+DLXwF50vPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ5w/UMybqVr
 yvVt40x4AOXuEAr4D6iMhhLAI4Dl74lxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:wBs8vq6sk+rPYcCQewPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-Talos-CUID: 9a23:u8t7L29F/PmIdP5BfGOVv3M9Fdp7bHL88HvBB3aCDj5sTIWpEWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ai/ljXg5IsYpVCZjD7SNCq9x0xox37YeNBlItlK8?=
 =?us-ascii?q?CvvS0awZAMgfCr2+OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,156,1684814400"; 
   d="scan'208";a="117538111"
Date: Tue, 8 Aug 2023 14:46:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] tools: add configure option for libfsimage
Message-ID: <d1572d4d-c7f7-4ee9-87bf-c5d90617055e@perard>
References: <20230808132219.6422-1-jgross@suse.com>
 <20230808132219.6422-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808132219.6422-3-jgross@suse.com>

On Tue, Aug 08, 2023 at 03:22:18PM +0200, Juergen Gross wrote:
> The only in-tree user of libfsimage is pygrub. Now that it is possible
> to disable the build of pygrub, the same should be possible for
> libfsimage.
> 
> Add an option for controlling the build of libfsimage. The default is
> on if pygrub is being built, and off if it isn't. Without pygrub the
> build of libfsimage can be enabled via --enable-libfsimage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

