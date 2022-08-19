Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F014599C93
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 14:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390318.627679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1ay-0008Lb-5y; Fri, 19 Aug 2022 12:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390318.627679; Fri, 19 Aug 2022 12:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1ay-0008IS-2t; Fri, 19 Aug 2022 12:59:28 +0000
Received: by outflank-mailman (input) for mailman id 390318;
 Fri, 19 Aug 2022 12:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP1aw-0007gp-Cw
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 12:59:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf756f06-1fbe-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 14:59:25 +0200 (CEST)
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
X-Inumbo-ID: bf756f06-1fbe-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660913965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sV77MNmlM02OxV5ypHSgbXQjvdrRRvl7JlOH5wB0rII=;
  b=SjwCtaXx927FsCq3Yp33l0GJ6UB+w5rbznTsf81n9PXGAixJNtW5tOHt
   UI5oBmSeRCHay833GZIUQm/uLEBiklP/tFSEO/eH2eSyQAXyADLed4uTE
   xc9uAyd3v9V4QMiRkD6vSKy36uKrOvOxLO86KU10hvoKJZIck+e38ZREx
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78479101
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A2xdxMqD0rw9Y6hVWkefolL37Oh/EJm4LOzaM4?=
 =?us-ascii?q?rliHsu38QUQhB6dWDjdXBeEg+ibQb4tzvsOXrgHfXJaGvlauT7q4ejnJharV?=
 =?us-ascii?q?a14HAXiWlYXGPeuTmzeIvhslogd8srimjQx6h9uwaQkBSNdNOqEYnMqnrULV?=
 =?us-ascii?q?O7nfLS7jgdKQtmR2ZQQ+xaO7MroKVGxzrL+Hta153e+R0oTgdpdK9rJ05uTw?=
 =?us-ascii?q?diMeovg530IcxK12H1zgfma7C0OsSFa2tFLXxNqCE/Z9cuvQiQvnxkFi4WuI?=
 =?us-ascii?q?kGEiIE8LKeK2mu5fewsnpBQL3Z0C9ajC4GSH9q52NLed/o/Bl+PrWSJT8+Lb?=
 =?us-ascii?q?z/bEA5pxSjunSIFm5eBSKhjjaB92kRi7GnrFzTGoV/VVlzkAK83NYJYDX68q?=
 =?us-ascii?q?qtySapgtboSwpuKjc1ZYSMiv6mtmfj5zNr7zNBjlH/D6BJj1jsD6DLo9T84B?=
 =?us-ascii?q?MvtDbqQCcWZbR1drHh8ZbjPUtRdvc3jTwRF8+GMtbj4TIvdKeJk0o1W1azSc?=
 =?us-ascii?q?i3ygbqffa++ZaRVn2m62MQLGDtY1T4AvQTj0EVk2bRl0cDWH6dbeFfNAqLSU?=
 =?us-ascii?q?WM2v+6JQoh6PtOkFRCXgyqRZPHBapXwuaHoTUWBJsoIa5cawdVaFJD+52XuC?=
 =?us-ascii?q?8fWD9IQNSjPeP6gV6CEHTAOm7dTuSoNPx+wUTc/KiK4tk/g6By9cpucjVwHU?=
 =?us-ascii?q?N9a4XGM3BjqY89I8RyG6Mecdk1ODqEgFrSYEs6l4lxT2poXckVm05G8dF0V6?=
 =?us-ascii?q?MqOegRuhLaNPpragxWO2wtjJrmsL2VnieNtmqjpjbQAuzkl3tWUTC6Kk0OdX?=
 =?us-ascii?q?D/mOfnGakvlWiakeY71FAaLvtHKtD2TDUk6j6OvgIXUYUMhCW3ERiDGb8Heu?=
 =?us-ascii?q?s5TRvN0gGI2JuYTIDl5+RtXVz+3ItzFBI3yDtuegTaGBgy87Otm+0NsyB4ss?=
 =?us-ascii?q?R/1GRB+LuMKRzv8yzsYyaXpfuMU9RdR6zGYNymv0vf1jb57PMa6AgN5xtc6F?=
 =?us-ascii?q?23Fwlk9UOUQsJOAQh4aNhCLaGIGD1dmTVFkLXZJQeip3Le/PXMek0ZOWgQbd?=
 =?us-ascii?q?+s2AQRLv8i8UEdJm/ByWPbPK0yr7D+bYzIndPVKTu+BIq6ROYVOBvEzxm/09?=
 =?us-ascii?q?Qos87TRuhE1DNJVfNzWn60R1Tma0Y+CTp31dbt21Y4zu6OtY50/TJGQ3hQqY?=
 =?us-ascii?q?Y5mgpl5qiW7RJq3ExkCeoZEQL3kBGFSo5gYRp/qTD4ovtOLhUSRenqkS1iwD?=
 =?us-ascii?q?l24lN2KFbA4pZOp9uJ3/l63UZwsrvxn8fqwLAS9g3D+YcGSme3ZCh6jbk4dh?=
 =?us-ascii?q?MxzYkRS2q+N32pl0OgCDs/zLxdix53ebGhHuy1xH9936C6Xw6C9FMzHmz4bc?=
 =?us-ascii?q?yVFzB930u98lV+5m0i0325LiuKzXbJJhyeNpaKxbq0yr95SaQ0TpEbZ8ZAN7?=
 =?us-ascii?q?zreYrDPxCh62SqLnzter+IqbCZJG3Pldtk9QUw+3vVHYUBYj3PEeeSjpdHhb?=
 =?us-ascii?q?HJSD8QKTPbKHKbl0F8vxdZNosAM8eiwdvZiwJS7ONf0SZAzwYth/z8LPOQPv?=
 =?us-ascii?q?bjS0VtTqTZNJn+aAtab0bjmMS8a6jHwk9m7O3NAu6dDRWM9A+9DKaibtm8/x?=
 =?us-ascii?q?OrwZkbFlsrcKmW/Z9bCHjNCaa0bc1OBaHl/2E7VSrh5CRUbEl1OMtD709+Nf?=
 =?us-ascii?q?u1EcDTKMK3Yidm8I1GGUKd+heWP0eyB0xaHeTuGZqqV4AKjSQLqPD/VsMMfP?=
 =?us-ascii?q?6kXeQ+faiIUjVERpW6ZE6+uCxjHjbGJJBJb0RviV3GN9s6mVLMMeoPidfDWm?=
 =?us-ascii?q?7Ee9EJM33sO168vT2vWQbuoksGbZC5Hehr6ecJSHlI5nfw1aboP1u0ixZOQ8?=
 =?us-ascii?q?BqI/J0UkEbWedYVRFXhe/3j/uhms5KbeLaTeBI/yB+LnlMA/5sb0reW0QkBo?=
 =?us-ascii?q?5LUBntNUxEcud0k89bQMUoPR9VODopWuQlIg1HzzxsRfq4EBDP2tIsOcfn9L?=
 =?us-ascii?q?FwhjI0CPn3dsXsc7ShYPgIelbRXnFjWKnN8c4kLuooiKgJKSln2Ty3fkSBxs?=
 =?us-ascii?q?4RhNSRAuNLQbTPYRCS/FmG0CBLH6KcCu+/BIOeBLMIjJDBsnutxSS236Fj9w?=
 =?us-ascii?q?H31xiIomyRgb8LpM4WX7OD1BLrqI/Zn7yBT54xh5kYWiiNPWQgErvgSMyXUZ?=
 =?us-ascii?q?JywFmU9uD/tqMJgHBKZHeg2uZIShyLFgWJkA/FD1gg5UYiG/kFMjhcfjBG1e?=
 =?us-ascii?q?GvJueiRAwFeiZazVj0QTWVM8TBdj9jT86T1mkE7I/tPxeKqEGjNjfdQypSpR?=
 =?us-ascii?q?Q7ANslxJcOtqkoIGOr/5Ogl5CL7Gzzz5qwKqtcTkjfhHDMGlQ3Ftv/4ya7Zi?=
 =?us-ascii?q?5BPjwAXq3dyLWgnytOVVKzplK+CVy0c0L2DfUyOcGJjybHiqowckVJ3x1stm?=
 =?us-ascii?q?8+Xh955FD4WiAKNa1+uz/TFiT1FYREV66yG+gO0bBDbS4CcxzZMikTk/+D17?=
 =?us-ascii?q?lyu3wuAq4ZjsAamaLvLhBHet/WDrFyokFidNGo2l4VMvlF5eflg/WoaXboik?=
 =?us-ascii?q?Fp2ftfvVXhwiAb6yHgERlW5Z5e4C2zxhCYbHWqo/cLYFiJirPN5av+kLuZbI?=
 =?us-ascii?q?quMlvQSQwiofEBhLbMU0+JpB8WxFjtOn+GAXZ7IIs0tsvudKaNNgx340ca70?=
 =?us-ascii?q?+0=3D?=
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="78479101"
Date: Fri, 19 Aug 2022 13:59:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Ping: [XEN PATCH v4 08/32] tools/xentrace: rework Makefile
Message-ID: <Yv+JJ2FNoSaotgwZ@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-9-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220811164845.38083-9-anthony.perard@citrix.com>

Hi George

Could you give a ack or review this patch?

Thanks,

On Thu, Aug 11, 2022 at 05:48:21PM +0100, Anthony PERARD wrote:
> Remove "build" targets.
> 
> Use "$(TARGETS)" to list binary to be built.
> 
> Cleanup "clean" rule.
> 
> Also drop conditional install of $(BIN) and $(LIBBIN) as those two
> variables are now always populated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

