Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA36C2F52
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512314.792240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZTq-0005KZ-V5; Tue, 21 Mar 2023 10:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512314.792240; Tue, 21 Mar 2023 10:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZTq-0005IX-RU; Tue, 21 Mar 2023 10:44:38 +0000
Received: by outflank-mailman (input) for mailman id 512314;
 Tue, 21 Mar 2023 10:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/aZB=7N=citrix.com=prvs=43775ecc5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1peZTp-0005IR-0t
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:44:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a6b5e44-c7d5-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:44:30 +0100 (CET)
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
X-Inumbo-ID: 5a6b5e44-c7d5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679395470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUR2Me9OkY3DT08WKo08mc5oUMlfDofz9Ul/ixMujNY=;
  b=dqR2OgR9ZcpBCy23i/xfUWR4cUXYpa9NN/0ZWuOL3qEBEHoSRgO6E/8Z
   CcOpAXKd/+hbTcuzNbyQ3Vo1Z2dgehMaqnw8cukU0ic1F9heYKhqgZRFx
   eZvDvy/X4hMRdeukMTEtoI8iUTv8xiHYiEDwGuEnh0DaKkoM6sB/7cP6O
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101594441
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jjbuFqI+S4uS99LGFE+R3pUlxSXFcZb7ZxGr2PjKsXjdYENS0DBVz
 WsZW2CBafqNNmKjKox+bIyzphtX7J/Xx4MyTwRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5KAnpPq
 acpdQk2Z0DcoMOmnIq/ENRF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZwIzxrE+
 juuE2LRBCM4JoW8zT6+tWOPgcnehi/FAKlPG+jtnhJtqALKnTFCYPEMbnO5ruO+kVWWQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceTCQnz
 FaTk/v1BDZkt/ueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDryTc1iTPWE0+TOEGGv5
 BGa8BA63Yg62JtjO7qAwbzXv969jsGXEV9uuFiHBznNAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxeEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRM8MqK1fZp3k+PyZ8OlwBdmB2yckC1
 WqzK57wXR729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQPmRrlgvMu5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSFmWMus8JAHKIZu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:nsYtvatUijwdarnYtV1TVQIp7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101594441"
Date: Tue, 21 Mar 2023 10:44:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
Message-ID: <319f2c2a-0166-4311-96a4-77ab54b6b853@perard>
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230317111546.18061-3-jgross@suse.com>

On Fri, Mar 17, 2023 at 12:15:46PM +0100, Juergen Gross wrote:
> Rework the config parsing of a p9 device to use the
> split_string_into_pair() function instead of open coding it.

But that wasn't an open codded version of split_string_into_pair(). Now
if a value contains a '=', everything after it is ignored.

split_string_into_pair() would split the string "foo=bar=void" into just
"foo" and "bar".

As the man page doesn't say that VALUE can't contains '=', this patch
looks like a regression.

I start to think that split_string_into_pair() is broken. I've notice
the same issue when reviewing the "smbios" addition, and did proposed to
"open code" split_string_into_pair(). But maybe that function needs
fixing instead.

Thanks,

-- 
Anthony PERARD

