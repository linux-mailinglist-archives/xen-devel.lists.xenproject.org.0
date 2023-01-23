Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C63677935
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482723.748384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJu6M-0008Up-Sv; Mon, 23 Jan 2023 10:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482723.748384; Mon, 23 Jan 2023 10:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJu6M-0008Se-OG; Mon, 23 Jan 2023 10:30:58 +0000
Received: by outflank-mailman (input) for mailman id 482723;
 Mon, 23 Jan 2023 10:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oetg=5U=citrix.com=prvs=380ad89a7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pJu6L-0008SY-Bt
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:30:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03a5d671-9b09-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 11:30:55 +0100 (CET)
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
X-Inumbo-ID: 03a5d671-9b09-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674469855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ni+/kyJb9wYCoU/b1nnBkKujdRvalEwt92GEdQZdjb8=;
  b=QgHR7smQBvgjs1JYWE4ASRYlols2HXxHy5Eg3fgbFDN78y2Vwbb0JFhq
   5F/u1bWubZWDzH0uZagxyxX+3twqxuutbjP6T+i6Do163hk2VAHWwxRqK
   /NmfQPhe1eaP7m7OCqdFed3SWbujIyYzgJ/rht3C+D+DcC7JNlrLdlDWJ
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93238071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:eXpABqhUytoG1ZJCDvmdItofX161qBAKZh0ujC45NGQN5FlHY01je
 htvWWzXbPreM2v8cosjao/no0kHuJPWzYdjHQM5q3gzRSwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QWFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRBKA0EPxGT2Nntg4mmZLB+tu0oDe3kadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27J/
 TidrzymW3n2MvTPxCKqolWMttSUthjfRb0WP7Hnp7111Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMa5/HzrYd1iQjAJv5qCKOvh8f5MS3xy
 TuN6iM5gt0uYdUjjvvhuwqd2nT1+8aPF1RujunKYo67xlp5WYf0Zpz30gOY1utudZSpZ1Kgm
 HdRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeJ4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUi3yyDAcollY
 /93lPpA6l5EYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQMbxltfnf/12Fq
 Yc32y62J/J3Cb2WX8Uq2dRLcQBiwYYTW/gaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkACXrSSeeW23hoVLNOuHsWBX8ShqYkTB/D+AhxAeXGpYxP1OKsppIOB4rrALIDwdZ
 6BtRvhsy89nElzvkwnxp7GjxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:BSMJz6Brtsbs1CTlHemK55DYdb4zR+YMi2TDgXoBMyC9Vvbo7v
 xG+85rsyMc6QxhP03I/OrrBEDuewK+yXcY2+ks1NSZLW3bUQmTXeNfBNDZskXd8kTFn4Y36U
 4KSdkaNDSfNzlHpPe/yBWkFc0t2dyWmZrY/ts2DE0AceipUcxdBstCZTpz23cZeDV7
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="93238071"
Date: Mon, 23 Jan 2023 10:30:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v4 3/3] build: compat-xlat-header.py: optimisation to
 search for just '{' instead of [{}]
Message-ID: <Y85hxvyTHa/nXZ9H@perard.uk.xensource.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
 <20230119152256.15832-4-anthony.perard@citrix.com>
 <60df7795-8f0b-e0f2-a790-2e00c0d4db2a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60df7795-8f0b-e0f2-a790-2e00c0d4db2a@citrix.com>

On Fri, Jan 20, 2023 at 06:26:14PM +0000, Andrew Cooper wrote:
> On 19/01/2023 3:22 pm, Anthony PERARD wrote:
> > `fields` and `extrafields` always all the parts of a sub-struct, so
> > when there is '}', there is always a '{' before it. Also, both are
> > lists.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  xen/tools/compat-xlat-header.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
> > index ae5c9f11c9..d0a864b68e 100644
> > --- a/xen/tools/compat-xlat-header.py
> > +++ b/xen/tools/compat-xlat-header.py
> > @@ -105,7 +105,7 @@ def handle_field(prefix, name, id, type, fields):
> >          else:
> >              k = id.replace('.', '_')
> >              print("%sXLAT_%s_HNDL_%s(_d_, _s_);" % (prefix, name, k), end='')
> > -    elif not re_brackets.search(' '.join(fields)):
> > +    elif not '{' in fields:
> >          tag = ' '.join(fields)
> >          tag = re.sub(r'\s*(struct|union)\s+(compat_)?(\w+)\s.*', '\\3', tag)
> >          print(" \\")
> > @@ -290,7 +290,7 @@ def build_body(name, tokens):
> >      print(" \\\n} while (0)")
> >  
> >  def check_field(kind, name, field, extrafields):
> > -    if not re_brackets.search(' '.join(extrafields)):
> > +    if not '{' in extrafields:
> >          print("; \\")
> >          if len(extrafields) != 0:
> >              for token in extrafields:
> 
> These are the only two users of re_brackets aren't they?  In which case
> you should drop the re.compile() too.

Indeed, I miss that, we can drop re_brackets.

Cheers,

-- 
Anthony PERARD

