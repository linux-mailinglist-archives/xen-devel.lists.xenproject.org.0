Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED047C51C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 18:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250527.431518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzj63-0006ei-S4; Tue, 21 Dec 2021 17:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250527.431518; Tue, 21 Dec 2021 17:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzj63-0006cv-Mz; Tue, 21 Dec 2021 17:38:43 +0000
Received: by outflank-mailman (input) for mailman id 250527;
 Tue, 21 Dec 2021 17:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzj62-0006cp-Cg
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:38:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50a50a8-6284-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 18:38:40 +0100 (CET)
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
X-Inumbo-ID: d50a50a8-6284-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640108320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bu8rtrljl03Oq+iaUrFj+FfiU5UV7Aw1+cpQYDGTG1w=;
  b=FUlnWYIoYMfjvrktyxuqKbQXu9S11/UOOFGF2gFmgcZ9+MS08rWNHaBb
   hEr8OBRGEkq5Dq8r8ad+jc2i1siVyKuaHpqVKJstLM52YlwLvknQZQn1R
   fGPKzeicfffL/S33Bgq+b1OehwEX9Yt4e/IVhRc/JYA7Betas8XCH2rnf
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hh0lzhWJVLc7f/7+++aq44HP3iQ5+Wf0HEqV2ztm71EgkVbR7ujVstqPg2TeABuGerNhojuktr
 cpDbre+MiNx8HS6XK7751T9TlNo3Bv6NBhMyCkqKJsAJNCUUqab/Pyg0RU66f/ilryW2LYg+qz
 e3FDLL/IxnxaDJ/hSxzPbXqGU3TCB+WZxwjIzXIRS8rVrU4/N+ykULrMjpL+VcmvInMaT/Utvf
 mlwlzhUHzFXppRoyNhkzm78Nlt4PEJaO+rBQNFnEoT7zP2Hj7TvAxInnoYG6w2c80znI4qygYK
 6Mi8HBSDAWbrEEIqPPq+7nJ4
X-SBRS: 5.1
X-MesageID: 60537529
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:edWRjaxGZd2kibPGVyx6t+fBwSrEfRIJ4+MujC+fZmUNrF6WrkUOn
 TMbUW6BbKuDNGv9eYggOdy380hXsMfSzdAwTgVv/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbRg2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/ZJl
 dYSkJeccgk4N5PWgstDdkl4LwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JgTRqmDP
 ZtxhTxHYT3yIBR3HAsuKtFgvuWn21fffjJdtwfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMOb4SqI9DSrnOCntSr9RIIVEqz+7vNwiUef7mMWARwSE1C8pJGRg0u1Cox3M
 FYf9GwooLRa3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9b0rA9eixph+JNzkcE3UYSnEhHSs5yoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlohPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03Q8H83oJrW3FF5ufkWZ4umkWyKBBaJlsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOsArKVDbpng1PyZ8OlwBdmB2ycnT3
 r/BLq6R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSHoOY7cAFRRVBmVM+eliCiXrPaSuaQMDp6UKG5LHJIU9ENopm5Yc+Up
 CzgAREBlwKk7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZD5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:YHqc3q6mROkEgVGtkQPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60537529"
Date: Tue, 21 Dec 2021 17:38:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 25/57] tools/examples: cleanup Makefile
Message-ID: <YcIRFYqncDuHe4vC@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-26-anthony.perard@citrix.com>
 <76b1346c-b42b-46d7-943d-01019e95b60c@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76b1346c-b42b-46d7-943d-01019e95b60c@srcf.net>

On Thu, Dec 16, 2021 at 05:57:43PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > diff --git a/tools/examples/Makefile b/tools/examples/Makefile
> > index 14e24f4cb3..48b520e133 100644
> > --- a/tools/examples/Makefile
> > +++ b/tools/examples/Makefile
> > @@ -26,10 +22,8 @@ uninstall: uninstall-readmes uninstall-configs
> >  
> >  .PHONY: install-readmes
> >  install-readmes:
> > -	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
> > -		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
> > -	set -e; for i in $(XEN_READMES); \
> > -	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
> > +	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
> > +	set -e; for i in $(XEN_READMES); do \
> >  	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
> 
> Hmm.  Do we need a shell loop here at all?  Can't $(INSTALL_DATA) take
> multiple $i's at the same time?

Probably, even if the only time they are multiple filed install by
INSTALL_DATA in our build system is when shell globing is involve.
So, it's probably fine to remove the loop.

Thanks,

-- 
Anthony PERARD

