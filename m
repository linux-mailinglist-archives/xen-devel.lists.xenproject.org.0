Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C05B3A82
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 16:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404403.646863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeno-0006l6-62; Fri, 09 Sep 2022 14:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404403.646863; Fri, 09 Sep 2022 14:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeno-0006iB-3K; Fri, 09 Sep 2022 14:16:16 +0000
Received: by outflank-mailman (input) for mailman id 404403;
 Fri, 09 Sep 2022 14:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWenm-0006i3-By
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 14:16:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f46b0cfe-3049-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 16:16:12 +0200 (CEST)
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
X-Inumbo-ID: f46b0cfe-3049-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662732972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UF8rHxyZOmT2fyi/Ch6uiR98I18jNBc5mz41L/t6Il8=;
  b=NhV9CqFTxAAR7XCChcOEUkXTX7uQTNQRgHw0ughpr4fQbDCOsrVK0AtL
   KNMSvj2i/G1ahOs1wAOW6f7Wt0U2BQdzU9lAXJ9UGwomKkjMMB9KutOc6
   kmDo6QxJ5EddMMOE8Wkv871DYF6I9bNDLVmugx1XfD8ECnATkEZIRVs3k
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80158400
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A4DHLuqCO8nFb4hVWkefolDw43h7EJoYKCyr0Z?=
 =?us-ascii?q?L5iHsvXIB87LLMz+jq9RysF0KIuFCQ9jkkCHt/CeD6iZW5agGHhqyaHLhRGR?=
 =?us-ascii?q?9peelVxHpIyJc6eOtjwBKd1URbCzPQDRHrx1H6Jld1w4m/vyXYSixIqJvIz1?=
 =?us-ascii?q?65qrO+WzwHGuhvt6CgDh2Qqx5Ovvt7i0MZ0hE0x3O9ZBis87QW4iLpQkKHh0?=
 =?us-ascii?q?o1CSEharG8DdL/Ec9A5tso5FwTPJVFgG7RLZ5TLn6afdlqCo+AF53jWG3tPM?=
 =?us-ascii?q?tUJvNaAklQmPq+3UA5RlA1xg8hceBdaCWHZLX/gkDOQeJyLb5/utzlCObB/j?=
 =?us-ascii?q?hHtkLKBPONxFVcsEn435cPBL/too+94px9OvoQ6NR/r1BhySDdBZkb3eHCS1?=
 =?us-ascii?q?MwOAWFPuAcM8Y+xJqDnKfk5T6Q4VyNTQg6NCJ5UBsWFsAcSPYy2K5jhT232J?=
 =?us-ascii?q?QugJdewhl14HMngtQg9PZAnLJqecAWau7qcWdviUoK6cKHSv9TiRlaxul2zb?=
 =?us-ascii?q?bvbp3Leu8Bb444GiaaEHysrnpTCDihiP2ay6+RHmv0Yz69MitFoZatQEhxOg?=
 =?us-ascii?q?vBIbXiPEnLVaeGPQEkfDkWbvosQTpq8SNk9I4ZLhDxVUdUiku+qX0EqLSX9e?=
 =?us-ascii?q?VXmp2e2+NAJUEryWb9hYn56ejmOFxFZrRH23jxAMkVqoe9ggwxI/3CataZ3I?=
 =?us-ascii?q?mZb2Qg1QDPwXn6slIj0zePtc22izGHX86fqiCSH98DLmzoYtHg8WF6sse0wx?=
 =?us-ascii?q?uMjyZWIvCKNYcittNia3qQEOBmNVHTw67h+76PP5J85zpnFYEHJHGROUJlIj?=
 =?us-ascii?q?V6E1acXqwrrsDrWCnO2H/IBJEWqikev9zd2M2qtIsnS1NG1Iwod/8rOKlczW?=
 =?us-ascii?q?TrKlZxZuxqjyKusyIwczkentzQglcrkdga3HZok7uNOLZqrlC6wrjFVWWf0P?=
 =?us-ascii?q?g4DPZDi/u8q4ouaT5wyEfN61Ob1/Z1u+eonFIj2HI8sS9oeDWL4BiaOpcQrh?=
 =?us-ascii?q?jkOz37IQY9AulXF5qI1QaAJWsV56QK96db6wHggI39UNCQI6sgUsMETG0NDv?=
 =?us-ascii?q?duHxaNJU3T3AB8nI9QfID/ezKJiiKXWifuXqICH0rJ5HSWaa6A5vZ8+bVE3c?=
 =?us-ascii?q?Xf8SyIo/LG6H+PitZU6+AAHvmoO4hxiKo1Le+CNeKqw29GsV09iMF+yw7iRd?=
 =?us-ascii?q?szjbXoyuAP4fWAIvGrhrbNreTIIX9siMLOplh1Iontb+OL5GO8LJuVhHQD+N?=
 =?us-ascii?q?savHaHaWXHJ3OroQLaRPU4aQ19zABKaE9PzHIaYkCkBmLk6hEUHJ5oFDSbky?=
 =?us-ascii?q?oY/v1r8vuGoEkk9SSZe6bnIEtglZghWPL3n2CAnvGBClpSZfLSOCsPBQIyWC?=
 =?us-ascii?q?YYOjy+dl0E0YfQ9v3BX2c283pRVhgC0P5Z1NpV9hk3HSVg6Y1oIU1VjezZk1?=
 =?us-ascii?q?vnp8nmhyKpmOyRxdIEywO9oF949r7bTV21etbyEL/cYDCTGnVH/hryLh464w?=
 =?us-ascii?q?kGgwh0DQVcmKDMjxNBv7qzY/A4+LOyKtHf2e4K4wXEdgUbAJzaGSCSCoiA/1?=
 =?us-ascii?q?G+DJSwCTKyAB+pEuEMKNRIrwjEzs34cyImRUzvmLLcHAMguIUYQY4QrBeJvh?=
 =?us-ascii?q?LqaYQv5m+CYPZDG2Pl1dbALWvHBKO4p6DdLyg5GlcP8A3dPOG3Jrx908GtOH?=
 =?us-ascii?q?m/Mfr3Fz/qzZodO2WF1u0NPYm1bSXKdBYAfd+m57ZnMAvJvRFBlKTO1IDa2W?=
 =?us-ascii?q?jkF9jjvPzC/EPY6FNUkX4q+7JIUZMtCA6YvOdvZwS+NX/y1mtWXLmeRVM/O5?=
 =?us-ascii?q?P7Qdd7v79vSym9cq4MvQfTr2vrnRG8CW4yHZut6I0DAg2O+7n6jWynz88apc?=
 =?us-ascii?q?fqgvHizuVTkEsh1UXAiS1TOBriX6DrdaJutiEitOQl33Zu3sS/WtuNFGi/nG?=
 =?us-ascii?q?OZ05TQV3/4xDPNiJV/Zvk91Lhg23nv1uUvKr0Cuk0eT+KUDdf4VtyyRGYn+G?=
 =?us-ascii?q?7295Yr/Ovs2B7TIBYlfAOQTFF5hhMe6yYNazmaKinBK5vkjZNnQ+vKfTP0vK?=
 =?us-ascii?q?9Whaf44dk6Z+6aee5l4Wdi+mgwSlDB5pgd40zNVWyL2CBCxxSQBoDe22AAVy?=
 =?us-ascii?q?XmYVJB/ehgVj4L/gD2HgBJ1QuJc5TrlvUMujF6dPluXlCGiO4fTYOBEzw5tK?=
 =?us-ascii?q?gTSjINjN9N+14bKI0nJ6QNrR3A4u1rTX3btw0mk9oznKpH4bc3NYmRgI1zu/?=
 =?us-ascii?q?yN5rPY/JjjLM8rVc6hma9r9O52jjUn/0PRQal8MSXErcUUHbzGN0wFbSAP3g?=
 =?us-ascii?q?pDwKR8G+9OqpyRAHYfcG2jX3sKsUT59gkXz00NnS0KNjHU5DHSOqw3X4yh1x?=
 =?us-ascii?q?oQxCQG6dgsIJycrcYGEV8I6iaRXv28hFeP7hLnYp+HoSEOsb/XhTRJn8vqkd?=
 =?us-ascii?q?fNo3WKUXNSIsCJ19zkBnk3pJJLXRZhVNrAN2Fv7y0sy9/LR5hIXkIZOl70ob?=
 =?us-ascii?q?5Xo4OkvFGOLnrQYRMJNr4vYIUwmFjKdFy2E0sE19/EmHTIa6S4b6bmNLYkUy?=
 =?us-ascii?q?TRIOnj5EaBEJbG0VrN3qjRWMMEc3KVDO/OR8EMH3+8WhoZOFXrCi3syyD4Ix?=
 =?us-ascii?q?siGgM2/aV/AnRBlTuJGZuOfQmQkAmtiL4zHmpkkVQo7aKJv0+8qKRPnwOd0O?=
 =?us-ascii?q?AXyuEXO6w46uUL0d9jN3/Y595CXZlg9MMUcNFNlRiQRvSN9NIyuYR0H3id46?=
 =?us-ascii?q?tGsiYxwJg1OuN/oxoM1ehRjWIr/7xwZ7VHlETplr2EvUNEHHrqIet9/O6pMA?=
 =?us-ascii?q?7IMYNsUIqofPJ36FUCpMC8u4sGvM+Dzvk09R65oR9vf+oUqHfCJiz9nme7fS?=
 =?us-ascii?q?6DNbMY3Gg/gvuL3TFoS6UF9jeceL2JF6/Nutc2IcSnAcdgJ?=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80158400"
Date: Fri, 9 Sep 2022 15:16:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: correct cppcheck-misra make rule
Message-ID: <YxtKpj/C7vOEJxjK@perard.uk.xensource.com>
References: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
 <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>

On Fri, Sep 09, 2022 at 01:50:38PM +0000, Bertrand Marquis wrote:
> > On 9 Sep 2022, at 14:41, Jan Beulich <jbeulich@suse.com> wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -746,11 +746,9 @@ cppcheck-version:
> > # documentation file. Also generate a json file with the right arguments for
> > # cppcheck in json format including the list of rules to ignore.
> > #
> > -cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
> > -	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:.txt=.json)
> > -
> > -# convert_misra_doc is generating both files.
> > -cppcheck-misra.json: cppcheck-misra.txt
> > +.PRECIOUS: %-misra.json
> > +%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/convert_misra_doc.py
> > +	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.txt -j $*-misra.json
> 
> As far as I know, this is not saying to make that both files are generated by this rule,
> but that this rule can generate both files so nothing is telling make here that calling
> it once is enough I think.

A comment could be added, the same one as the one used for syncconfig:
    # This exploits the 'multi-target pattern rule' trick.
    # convert_misra_doc.py should be executed only once to make all the targets.

Cheers,

-- 
Anthony PERARD

