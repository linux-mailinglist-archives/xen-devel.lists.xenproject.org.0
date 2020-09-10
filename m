Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711C26504E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:10:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGSt5-0002g1-CN; Thu, 10 Sep 2020 20:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP7I=CT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGSt4-0002fw-A7
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:09:42 +0000
X-Inumbo-ID: 2335e501-59ad-48cf-80ce-67073800fe66
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2335e501-59ad-48cf-80ce-67073800fe66;
 Thu, 10 Sep 2020 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599768581;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rRoBQ3YTtW3j0voSlymyJSvbs8RCxxHyuNXWyHKX170=;
 b=H+ILzdSlWN9ZcaiQUMpzofqp2aFkThUfPfkGreE2OBwbd1NYoQ0u0bPU
 KxKUodEZWRAe9onwJv4DK+S4qTmPm7QCJVd7DVt5C+rLglcSpoC0SG+Ov
 d2n72qlwrJMzVQyh4DK5SDruJcDROD5zRZt6TKP49K13sb+n5X+WHvKR2 g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kiACMK6Oq5qccr5JKwLDLmZ6BCmCtbnBEYgRYIKH+FQFKwiUHiIazLoGW4w3+hfn3DjNqaSXdo
 E1ER9ZjMycthqyoK5EA2x+wLb8YsNzBZcrLlb+VIlwCa2YRPSmZ0SuwJG832ciLjFKe23rn4Rn
 BU/2onblswMO1Oy9WF87/sRo+9H3TCRbisr4I3xKa+ajWj/Gwjh9Qw4JXBeKmWx9WEZi7a1C+Y
 JGZcFUaLA+saxaZLC49B1+n2RRAvC0sEzeh6MpBrIHH7zelpkch2PQ1lgQLMT0hzip0VMGDy2Y
 ibE=
X-SBRS: 2.7
X-MesageID: 26423757
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="26423757"
Subject: Regression: [PATCH v10 10/12] tools/libxl: use libxenhypfs for
 setting xen runtime parameters
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-11-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b4f66026-67c1-5284-84d7-9d9af1775904@citrix.com>
Date: Thu, 10 Sep 2020 21:09:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-11-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 19/05/2020 08:21, Juergen Gross wrote:
> Instead of xc_set_parameters() use xenhypfs_write() for setting
> parameters of the hypervisor.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Something here isn't right.  XenServer's testing for XSA-304 has shown
the following bizarre behaviour.

# xl set-parameters ept=
libxl: error: libxl.c:701:libxl_set_parameters: setting parameters:
Invalid argument
cannot set parameters: ept=
# xl set-parameters ept=exec-sp
# xl set-parameters ept=no-exec-sp
libxl: error: libxl.c:701:libxl_set_parameters: setting parameters: No
space left on device
cannot set parameters: ept=no-exec-sp

Instrumentation shows that the first two examples here enter
parse_ept_param_runtime() with the provided string, while the third
example doesn't.

Given the -ENOSPC, I'm guessing there is some overly small internal
buffer somewhere in the hyperfs infrastructure ?

~Andrew

