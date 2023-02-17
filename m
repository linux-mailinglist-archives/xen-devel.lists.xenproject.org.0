Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0D69AADF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 12:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497042.767985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSzMe-0001uu-Ng; Fri, 17 Feb 2023 11:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497042.767985; Fri, 17 Feb 2023 11:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSzMe-0001sq-Kd; Fri, 17 Feb 2023 11:57:20 +0000
Received: by outflank-mailman (input) for mailman id 497042;
 Fri, 17 Feb 2023 11:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLKc=6N=citrix.com=prvs=405e6d4a1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSzMd-0001sk-NS
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 11:57:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e46ecf-aeba-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 12:57:16 +0100 (CET)
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
X-Inumbo-ID: 37e46ecf-aeba-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676635036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9lDf4mNfOvzmTcMYT5rjiRPCYosLbX5qyH+2hE2iVg=;
  b=YUuF23PvSIUGpK7/1AUg9Kgit8on5ZKqv80JPFYFrKiExTCXm4FIExVH
   xpGDCvOg2VqyggYUtvJsJWzocB55us5lNzyOgrApSee1/j3qnl1vKUzXL
   eOLvov2AeehB6vXh2C/dhLISO/oIqjQ5g3PQDvFtQVUOjvDL62fWE3ByM
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99881645
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ppCMN6kC95mlRHhEHXnUgB7o5gyyJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWDuCMvqNYWajKYtzbtuw8hkFv5fQmoBiSwc4qSg8FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eMHJyERSzKxu8aVwaijQ+hLrMAnHNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfJ9
 jKfoTikav0cHOem6hif/n+JuvDOzT64SqlREqTo0PE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OczRDcq3
 1vPmMn7CDhHubiZD3ma89+8pCu/IyEPIUceZCUPSk0O5NyLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0MksEay4CZz2zjoDO2vpHIaSQx4jXICzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/SI+TfNDKq8gj9yjn9ZLVbvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF0mH1hnz+LFcugn3xLNIZyg1bPFN843KamNLhlvMtoXi2Lm
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMyk9MeO+BcYk9BrW/0UEZD6V5pTqWq73hI93Snf9VeN4nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:3aDTkK4PvLIuIavD2gPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="99881645"
Date: Fri, 17 Feb 2023 11:56:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] cirrus: Update FreeBSD to 13.1
Message-ID: <Y+9rgedk/jHR9aZe@l14>
References: <20230217113647.776733-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217113647.776733-1-andrew.cooper3@citrix.com>

On Fri, Feb 17, 2023 at 11:36:47AM +0000, Andrew Cooper wrote:
> Also print the compiler version before starting.  It's not easy to find
> otherwise, and does change from time to time.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

