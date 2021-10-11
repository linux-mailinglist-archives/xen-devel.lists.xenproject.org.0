Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB76142954D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206375.361932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZym5-0003mO-Bh; Mon, 11 Oct 2021 17:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206375.361932; Mon, 11 Oct 2021 17:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZym5-0003jF-6w; Mon, 11 Oct 2021 17:07:41 +0000
Received: by outflank-mailman (input) for mailman id 206375;
 Mon, 11 Oct 2021 17:07:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZym3-0003j9-Kk
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:07:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc27bd68-2ab5-11ec-80ec-12813bfff9fa;
 Mon, 11 Oct 2021 17:07:38 +0000 (UTC)
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
X-Inumbo-ID: bc27bd68-2ab5-11ec-80ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633972057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3lAhJqR1yIwfdL2XvZ3KDYkeBWLCbMSCMnkof54KL68=;
  b=g+95RYCfuRp6z42rEvairY/NE/SI95DDD25gkRYG3TFzcfej17RR1VjX
   9fnMAgHYIkgaE0q4FlUWO30V/3JjMeevy5C1wCYjoqAs1WKLhSGZU6/Ob
   5f1w4byGVzGqGYdie3U3CwylxD9gkXcLeXk9ZRSHlIhw8vYLM+GopLmWN
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vuYowbn4SKJ/EzlYOZblaQwdvIzobTs9XGsOPmMognUvPkWkIlha/b9/5rCzHvA4wufHBIQcml
 HP4UHRY4LHb/j2eskCleynPvDwJ+UhxEF7s/zrOO14ZubhsNfN1RvkjH1x79mPL4gPUtsjTJtn
 TMG7SBjsLB9/gpoyl8vI3tFGCn/LC33k4srgDylDvhKxIsVHEW8dw5kg6h7sBuy5xG5cGoWgIM
 EMgbjFwahk7iSpVWhHm0GP7LgqhygZdOS+yL+AbveTY/zyklndyhoq8LxNHfXnV48ng8Kyqn8u
 LRgJ3vnXX9zlj4JrEiXXqxGY
X-SBRS: 5.1
X-MesageID: 54477913
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EZDDK6qCOEcD4eqVOVbzTWGYToheBmKVYhIvgKrLsJaIsI4StFCzt
 garIBnXPqmPZGb1Ktt2bI3loBxV7JaBn9NjG1ZurytjFC8WoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncztZUA1M7HqorQ6biUBUHluJqxWwbCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 pZFNmU+NU+ojxtnA2YnOsIiu+GSvUbQLzRkqgiL5pAl/D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8U79wOl2qfS+xyeBGUPUnhGctNOnM0rQT0n0
 HeZktWvAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fGz/a10kh/TaOwzN5OJ156tCSrx0
 wmF+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiO9b7P93ABUzzqK8adt7AHwbpU
 G0swpDGtIgz4YexeDthqQnnNIqi4OqZK3XiiFprEohJG9+FqiP7I944DN2TIi5U3ic4ld3BP
 B+7VeB5vsY70J6WgUlfOd/Z5yMCl/mIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj3ViZLUfs+lWboHI/xNIPHIAhlnws/orihnnyaPUe2PibJGd/pznPfBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KBkNsJJt0+94wIx7igw
 51IchIBoLYJrSacclvih7EKQO6HYKuTWlpiZXZyYg3yhyR6CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtJ61s29xDFWbK/Sozd574oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdTFR5/CMv2ae60yw/jt3Yqh+8vDVDDJcNeeRuw/dEyeTDxlPI+P+oFNQ7HmmmBz
 w+TDBpB/bvNroY5/cPnn6eBq4v1QeJyElADRzvQ7KqsNDmc9W2mmNcSXOGNdDHbdWX15KT9O
 rkFk6CiaKUKxQ8YvZB9HrBnybMFy+Hu/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PwZxmvS4PAyLBmo7SN75uPaA0BbPh3Kgy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvV1rIweDa/qlhEvmwNLbpHrAyPr5I2CNodXOU4wL
 z7I3KfPitywHKYZn6bfwZQV4ddguA==
IronPort-HdrOrdr: A9a23:9ihxTq/v9VnXaLTg9khuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,365,1624334400"; 
   d="scan'208";a="54477913"
Date: Mon, 11 Oct 2021 18:07:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile
 by introducing build.mk
Message-ID: <YWRvRlh5MlX1eMz+@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-21-anthony.perard@citrix.com>
 <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com>
 <YWRRFxlvmDMu8nRZ@perard>
 <b30bff47-226c-6f82-5f59-81d17b191ab4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b30bff47-226c-6f82-5f59-81d17b191ab4@suse.com>

On Mon, Oct 11, 2021 at 05:31:08PM +0200, Jan Beulich wrote:
> On 11.10.2021 16:58, Anthony PERARD wrote:
> > On Mon, Oct 11, 2021 at 12:56:54PM +0200, Jan Beulich wrote:
> >> On 24.08.2021 12:50, Anthony PERARD wrote:
> >>> With nearly everything needed to move to "build.mk" moved, there is a
> >>> single dependency left from "Rules.mk": $(TARGET), which is moved to
> >>> the main Makefile.
> >>
> >> I'm having trouble identifying what this describes. Searching for
> >> $(TARGET) in the patch doesn't yield any obvious match. Thinking
> >> about it, do you perhaps mean the setting of that variable? Is
> >> moving that guaranteed to not leave the variable undefined? Or in
> >> other words is there no scenario at all where xen/Makefile might
> >> get bypassed? (Aiui building an individual .o, .i, or .s would
> >> continue to be fine, but it feels like something along these lines
> >> might get broken.)
> > 
> > I mean that "xen/Rules.mk" will never "include" "xen/Makefile" after
> > this patch, but the variable "TARGET" is only set in "xen/Rules.mk". But
> > "xen/Makefile" still needs "TARGET" to be set so I moved the assignment
> > of the variable from "xen/Rules.mk" into "xen/Makefile".
> 
> Okay, thanks, this confirms the understanding I had developed; maybe
> you try to reword this some. What your reply doesn't address is my
> question, though.

Which question, there seems to be 3 of them :-). Is it about
xen/Makefile been bypassed?

Building anything in xen/ requires to first execute xen/Makefile as this
is where variables like CFLAGS or XEN_ROOT are defined, and this
includes single builds or building an individual .o.

-- 
Anthony PERARD

