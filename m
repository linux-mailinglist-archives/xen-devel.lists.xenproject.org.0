Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107923F259
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 19:55:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k46am-00011n-9Z; Fri, 07 Aug 2020 17:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k46ak-00011f-S6
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 17:55:42 +0000
X-Inumbo-ID: 1b06ae9d-bddd-429e-85f7-b0430542ab50
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b06ae9d-bddd-429e-85f7-b0430542ab50;
 Fri, 07 Aug 2020 17:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596822941;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=maXFjAVsA9odGgKp4lfxSgc/MADSKx+Y4l1fhazwDV8=;
 b=XywZMHhGZzOvBNOV+ozvnycgkflUzEFpvYZPA8QmZ71fpOV/bCJddqNx
 D8vgc31K/AKp/krr365cVGwXj9XkX1Zqp3fxkVrfjNe8EmT26um0GODZ6
 Lp1Q+nWbj+l5o3p7mLBFtgjTbVVF9aLDAMV8yTderdplCa35w2iPtoAL9 I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qoO1xcrbRBTvjYT3SumY5p2CmGelmu4Uew+Xo+6rU3700qYQv2TMNsFlEh8EHzG71kdlQPdOBi
 yL2cZGkJ8zEJXR4CmdBVUEZ6IJ8E+aFqFdSQcGeTaT3ceg0UYYHyb0VaDmewPIgHWciAnY8d0b
 5C9gNxjs3w97LTpfn/MRr+teuhNEavBopPhugouF88esLudOfVJhrL3m/3J+ut6A2AlaCCX1ms
 rtWuAkvYH0AFIphA1T+ulijg4UH+3GGuidpZw/QVJGqsGlr7SgTz/JSidenNPZCuKSyQ/CPsdx
 tlQ=
X-SBRS: 2.7
X-MesageID: 24257257
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24257257"
Subject: Re: [PATCH v2 6/7] x86: move cpu_{up,down}_helper()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <d9f8c767-f6a1-d0d3-01db-5e5f850997d0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e96f9131-de3b-4f06-50ae-d18af9d895b1@citrix.com>
Date: Fri, 7 Aug 2020 18:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d9f8c767-f6a1-d0d3-01db-5e5f850997d0@suse.com>
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

On 07/08/2020 12:34, Jan Beulich wrote:
> This is in preparation of making the building of sysctl.c conditional.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

