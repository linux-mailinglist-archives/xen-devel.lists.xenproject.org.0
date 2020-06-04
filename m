Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF01EECB2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 22:58:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgwwX-0004HY-Jx; Thu, 04 Jun 2020 20:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgwwW-0004HO-2h
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 20:58:28 +0000
X-Inumbo-ID: 22d85db4-a6a6-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d85db4-a6a6-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 20:58:27 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NTr8wPCtadSgKrmYquzmaqZQe+gEChFrGnrWsg7LpnJPJBDJnMvF9mwXNUfohEZGdSoUOm7UMM
 4E2UV2Ab6p+jca8C1gzoI2tDS30Nh3QWiBfYij+GpZjSAilVT05QGcUNM2YiPOM6Q2TY6yTA/k
 jQqfTNS2QIC1d8Gcqa5QNbP1QVuePJn6W/N543oThOLfSiIZel+DDf2oFPyFM8QvTKBPZ4hTW8
 7CoScj2ED75gKDXp8yrSlEMR67+ascYe20qrS5I3jhvyigvErQMB1oBqA/WVEM84biIxnBjb/m
 Wqw=
X-SBRS: 2.7
X-MesageID: 19567633
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19567633"
Subject: Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak
 docs rendering
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200604205226.14518-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
Date: Thu, 4 Jun 2020 21:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604205226.14518-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/2020 21:52, Andrew Cooper wrote:
> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
> while.  commitish_version() pulls an old version of xen/Makefile out of
> history, and uses the xenversion rule.
>
> Currently, this fails with:
>
>   tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory
>
> which is because the Makefile legitimately references Kbuild.include with a
> relative rather than absolute path.
>
> Rearrange $CWD of the make rune to be in xen/
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
>
> This is obviously not a proper fix.  It will break in an unfixable way if we
> ever delete a file from the xen/ build system.
>
> I don't think pulling a makefile out of history and expecting it to work in
> the current working tree is a reasonable expectation.

Actually - it occurs to me that we only want the major and minor number.

I think it is reasonable to expect that those will always be plain
numbers, and we can grep them directly out of the file, rather than
feeding the thing to make.

Thoughts?

~Andrew

> ---
>  docs/support-matrix-generate | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/support-matrix-generate b/docs/support-matrix-generate
> index a3d93321f1..2a1c3fad57 100755
> --- a/docs/support-matrix-generate
> +++ b/docs/support-matrix-generate
> @@ -102,8 +102,8 @@ commitish_version () {
>      esac
>  
>      git cat-file blob "$commitish:$versionfile" >"$tmp_versionfile"
> -    version=$(make --no-print-directory -C docs \
> -                   -f "${tmp_versionfile#docs/}" xenversion)
> +    version=$(make --no-print-directory -C xen \
> +                   -f "../${tmp_versionfile}" xenversion)
>      case "$version" in
>          *.*.*) version="${version%.*}" ;;
>      esac


