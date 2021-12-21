Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515E47C5AA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 19:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250549.431561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjUA-0003lz-Pk; Tue, 21 Dec 2021 18:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250549.431561; Tue, 21 Dec 2021 18:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjUA-0003jv-Mo; Tue, 21 Dec 2021 18:03:38 +0000
Received: by outflank-mailman (input) for mailman id 250549;
 Tue, 21 Dec 2021 18:03:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzjU9-0003jp-70
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 18:03:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50300fdb-6288-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 19:03:35 +0100 (CET)
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
X-Inumbo-ID: 50300fdb-6288-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640109815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MQX2LlmddlrhD3qhTHN+iApvoQmjpliLZsH1M6xt0QY=;
  b=FhysBzoX2cSCTpBov/aBom7UwN5yL+nzQlu8zBqJBKz7p/1WdfuA2wTn
   Gr+SHdGH4NBHudPwLciDGxxQVQHXdJmYP671pEM961sHS6yEUPk0HUpEI
   EIolrsx1k8/9grQZ4B4P44ya6Rv11D5k1VKL7p+CY1Sw1waLkTfVt35CT
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o6wGqAPjT4pAwDBjR51MdeKoAdAbtXAe1T6yYxdU0Btn7dxA0Dlnc/05RIa8rPp56yrxlzwsWr
 0gRd8s1MZJ4f+lg+Ho/KUPBFuAoUwuSgo2ivjIEecsLQ0eaw0Ye+ze60HAF02XlMHJyKjp/zxz
 7qF9k+t8Ec7vArFD7kzohP4e5Dpad0guBG9Wrr3rmnokCZoZtKyzohQt6JRO7df1u9UmFw0II0
 IFxbRiwb1LGe3x9UYw9T4JmXY05DI2hRISEh4xw/XHEkNNbcIsyPmnRpu9iHLQM5VoHPUjVt1W
 CEbqL4OOgYQ4F7V4XRy4WJ+a
X-SBRS: 5.1
X-MesageID: 62621915
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PPsgB67h4ZnRsyVXxNcxPwxRtLnAchMFZxGqfqrLsTDasY5as4F+v
 mMbWD/TMvzeMzGhLo90bduz/RkBupKByYIyQQJtrHsyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj2Ncw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 Y9tlb6JYi4QNaD8ku0NFEgCFj5/MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQR6iEP
 ptANFKDajz9bxhBeUwXDKsy37auqkLuXDR0sm2K8P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTWo0IE6aj3uV3m1DVzWsWYDUfUFDq/9GikEWwHdRSN
 yQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLd5RqZAW4VCCZMctU8uOc5QDUr0
 hmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZVpfw/nBmaoatxnCftxqAOnk1NjqGD6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3HY5
 CBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBs4WirnUWWwC
 KM2he+3zMULVJdNRfUoC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzflnY
 8rELZz1Vixy5UFbINyeHb91PVgDnH9W+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLNOmyAM0h9C1jZkTB/z+AghAeXGpm149HH7NfQFXt3LcLISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:+4jflKnFLcmI0cjYR/z5bYNKbxTpDfIq3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5P0tQ/uxoWZPwJE80mqQZ3WB8B9uftUzdyQ2VxeJZnOnfKl/bexEWn9Q1vc
 wLT0E9MqySMbETt7eC3ODSKbcdKbe8n5yVuQ==
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="62621915"
Date: Tue, 21 Dec 2021 18:03:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 47/57] libs/stat: Fix and rework python-bindings build
Message-ID: <YcIW4E5d+EHGV+sB@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-48-anthony.perard@citrix.com>
 <edc0491b-a778-0ca1-88c6-c7076db3a14b@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edc0491b-a778-0ca1-88c6-c7076db3a14b@srcf.net>

On Thu, Dec 16, 2021 at 06:47:17PM +0000, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
> > Fix the dependency on the library, $(SHLIB) variable doesn't exist
> > anymore.
> >
> > Rework dependency on the include file, we can let `swig` generate the
> > dependency for us with the use of "-M*" flags.
> 
> Hmm.  At no point is swig mentioned in README/etc, and it's not in any
> of the CI logic.  I wasn't even aware that we had python bindings here.
> 
> Unless someone tries and confirms them not to be broken, I'd be tempted
> to drop it all.  I bet this has been dead since we dropped Xend.

How about the perl binding? Nothing to do with xend for them.

The only way to build the binding is to set a variable. It's not
possible to enable the binding via ./configure at the moment. So, yes,
maybe no one uses them.

Cheers,

-- 
Anthony PERARD

