Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28C46B981
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240856.417596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY2m-00059t-MB; Tue, 07 Dec 2021 10:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240856.417596; Tue, 07 Dec 2021 10:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY2m-000584-Ix; Tue, 07 Dec 2021 10:49:56 +0000
Received: by outflank-mailman (input) for mailman id 240856;
 Tue, 07 Dec 2021 10:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjJF=QY=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muY2l-00057y-GG
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:49:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 673c087f-574b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:49:52 +0100 (CET)
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
X-Inumbo-ID: 673c087f-574b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638874192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dZOTDnUdLfWKaFUwyJjhCw0mtKJKNGU167iTIcbV1IQ=;
  b=K+eykWGt6O0X8oxa2hxtd3/LMJvG/zo4sU5moPaM7L1x46GxD+4+bfDL
   KMvoxZlFEpTXoNIWNUMEqmC7lVC3nbehtlxvIB+VFdj3vJh+6VhQt91g+
   y15s1PVINkU66ty3j6TnO0TJeFdHx01GF+6uU7472tXAZZ4CI5kWi44dM
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T5iCEImY+o42g468tUjRdtm3LwQkbcQukiAmJgYfm+Zp1E+zKOmLbrnuCr10oedHr8rRh7LY0J
 /lUoGhmkNL5cIHoei0RxdjfpSAisFtfrA72UYqlf/AAacGaJsmghbCjQTxL4kvMDEr71zHEkJj
 a3SHe7PH7GDmKDMbJukiPfDWQSpmNqriTYGVi/Sp8BX/o1huQAD45tfGcWIUmlc3fVLwKpACkA
 caIj69vhTA1cmyYcVTzLzWCS5CGYgQcp6thPpKmEUVBAUtSlR4gvbsjqoJ9UjIvAD8eC3kKy6K
 0kjWvJKsHzbmQes9D1yEvmoJ
X-SBRS: 5.1
X-MesageID: 59827897
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MYJPYKov9veDVqucJ3CCRvX4j2JeBmK+YhIvgKrLsJaIsI4StFCzt
 garIBnTPvzbazTyeNtyao2y/EkOuJfSyoBmGwVspX9nFHtE9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx24DmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaTpeQoELO7gocM2bkV+TghML/RJopaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ptJM2U/PUuojxtnF2k5Aa8ipP6T2Cf9eTlnqUu+qq477D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S3yzCI73atje/nhj7gVcQZE7jQ3uFuqE2ewCoUEhJ+fUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatM8s9QtbSc3z
 VLPlNTsbRRur7+9WX+b7q2Trz65JW4SN2BqTSYCUQsC5ciluIwphwjDZtlmGa+xyNbyHFnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhdlcF6yjFHU6cyShEOKj4Tr66sFeBxKMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDB4xap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voHAGia24hTmFfK0QfUYXY
 8jzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDOGedcbgXWNLhlsstoRTk5F
 P4FaKO3J+h3CrWiMkE7D6ZNRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 aRYIJvZXawUItkFkhxEBaTAQEVZXEzDrWqz0+CNOVDTprZsGF7E/MHKZAzq+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4LvvbXva82OvzJVuSuGNeTyBBmr49L/7P
 bdezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymU+oyLGOH0M9Dsrx26oVY4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbZ4bNElz
 OMmtJJE4gCzkEN3YNOPjyQS/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxl4O
 CKQiYrDm69YlxjLfHcEHHTQ2fZQ2MYVsxdQwV5ef1mEl7IpXBPsMMG9Jdjvcjlo8w==
IronPort-HdrOrdr: A9a23:royln6iaDmF6REHBlAAr5IqEB3BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59827897"
Date: Tue, 7 Dec 2021 10:49:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 18/57] tools: Use config.h from autoconf instead of
 "buildmakevars2header"
Message-ID: <Ya88SjdSbANPGrcF@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-19-anthony.perard@citrix.com>
 <d9819a32-7a45-f753-0b6d-50e01aacb6a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d9819a32-7a45-f753-0b6d-50e01aacb6a1@suse.com>

On Tue, Dec 07, 2021 at 11:08:55AM +0100, Juergen Gross wrote:
> On 06.12.21 18:02, Anthony PERARD wrote:
> > This avoid the need to generate the _paths.h header when the
> > information is from autoconf anyway.
> > 
> > They are no more users of the "buildmakevars2header" macro, so it can
> > be removed from "Config.mk".
> > 
> > Also removed the extra "-f" flag where "$(RM)" is used (xl/Makefile).
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> The changes for configure should be done in the respective configure.ac
> files and then configure can be generated via a call of "autoconf".

This is what this patch does, via changes in "m4/paths.m4" ;-).
All the respective "configure.ac" have "m4_include([m4/paths.m4])", so
nearly any modification to "paths.m4" will change the generated
"configure" script.

Cheers,

-- 
Anthony PERARD

