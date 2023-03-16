Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC26BCE54
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510515.788306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclti-0005X1-Kv; Thu, 16 Mar 2023 11:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510515.788306; Thu, 16 Mar 2023 11:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclti-0005UE-I1; Thu, 16 Mar 2023 11:35:54 +0000
Received: by outflank-mailman (input) for mailman id 510515;
 Thu, 16 Mar 2023 11:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umpT=7I=citrix.com=prvs=432886d25=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pclti-0005U8-1N
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:35:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3aeb058-c3ee-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:35:51 +0100 (CET)
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
X-Inumbo-ID: b3aeb058-c3ee-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678966549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2aA8tsM2iQ2Zufmz3L7Neqxr4AWdysStMy4tiG/4m4g=;
  b=WpfbFYBOQZqFJk59UgB71b9xjh5ixskhncpUECfJAehGT3slhkwuI1dF
   Tw6WmOBOnPvPueUSXchroAP8QDyY4/y4vYdyqsGU1pONvL8Guk4SPBimL
   FlrIi1RqIiPHjjQ78nDZ0+s3cCpY9FQDnAliFJu2UPQvRptmbVG4yYtDu
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101511473
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ScINL66zgG985+KZqg6tjgxRtBPHchMFZxGqfqrLsTDasY5as4F+v
 mMWWmyOPfyJMGejcop1Ot6/oB8G75CDyIdjGlBk/iFmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS4geA/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 PM6chRTRTG/mv+0n6uVZNdloN4DI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7B+
 zufozuiav0cHISt1ACL8FOPv8DonhnBc6tODZKk5OE/1TV/wURMUUZLBDNXu8KRj0ekXttFJ
 k88+ywwrLMz/kimUtn8WRKjpHeO+BUbXrJ4GvU38giXxoLI4gySAS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9MmsqdSICCwwf7LHeTJob10yVCIw5Sejs04OzQGurq
 9yXkMQgr4Qcr5QviY6awU3agW21iLb3RygvxgqCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6exwkMAM9vy/DJg4i+aihbAgHDJrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75Dju96nn1jnDKOGM6TI/GbPV22NRaopUotagPSPojVEovdyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3EJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4Aei3yGbcFXRMRiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzwhEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:nhHnaK3zyeEkXwk6NJw7egqjBI0kLtp133Aq2lEZdPWaSL3gqy
 nOpoVi6faQslwssR4b6LW90cW7MBHhHNtOkOos1NSZPTUO2lHYSL2KhLGKq1bd8m/FltK1vp
 0QFJSWZueAa2SSTvyX3OB7KbsdKRW8n5xATN2x80tQ
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101511473"
Date: Thu, 16 Mar 2023 11:35:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 3/7] tools: Delete trailing whitespace in python scripts
Message-ID: <79f8fca5-4468-42d8-9a9f-0ed7145ad0e6@perard>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-4-andrew.cooper3@citrix.com>

On Tue, Mar 14, 2023 at 02:15:16PM +0000, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

