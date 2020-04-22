Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC381B461B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 15:18:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFG9-0002oQ-6f; Wed, 22 Apr 2020 13:17:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRFG8-0002oL-FK
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:17:48 +0000
X-Inumbo-ID: a86c96f2-849b-11ea-927e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a86c96f2-849b-11ea-927e-12813bfff9fa;
 Wed, 22 Apr 2020 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587561468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PGuUnY4JbJkTyuU6N67wb5IjbfVS7qgCj1NE4/JpsXY=;
 b=O/34rtX23qoEtxRP9zjq0PFqdB28I1VUehUBBzh1ojIM8jS/uGtQJRga
 kIiaHjm+CW/d31TBnAZPJ6NfXweXkUufM6ddun3RBQXQiSos2sO4Fr2mp
 LsZb7fIFYVmg3e7T15PMKjGPGKTrbsjEAf7DFu9m5dsMXSp8l04w7TwO0 g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XbmrQOrqPQdcPw2ZgxT0hgJ4QIMSz0TW1yGmvkcpTGs3BxQ6rFYiSJ8RqwKEksm19P/5jv4+r8
 Syr4cWnpNlt0zuODUbIPwErZRACkCWEAnJmgKo6EXNrjS48O6cCIzBZ5vCDJe3rmt9eDxNzuX9
 2m8WaojNiR7+cBsk5hN5U+ea6WOIVYUPsRwboNREtXiLysOdjU+YPCswtEnslrR91/gHQw5CUW
 sf8i9vxwbsLAAukvE411sYlntPj9RPnACqe/sOjUEQpye+3UKSuzxC6htz7dpeyV4PARghECW1
 tD4=
X-SBRS: 2.7
X-MesageID: 16314181
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,414,1580792400"; d="scan'208";a="16314181"
Date: Wed, 22 Apr 2020 15:17:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] Introduce a description of the Backport and Fixes tags
Message-ID: <20200422131736.GD28601@Air-de-Roger>
References: <20200421182946.27337-1-sstabellini@kernel.org>
 <24223.16427.427446.817623@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24223.16427.427446.817623@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 07:49:15PM +0100, Ian Jackson wrote:
> Stefano Stabellini writes ("[PATCH] Introduce a description of the Backport and Fixes tags"):
> > Create a new document under docs/process to describe our special tags.
> > Add a description of the Fixes tag and the new Backport tag. Also
> > clarify that lines with tags should not be split.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Acked-by: Wei Liu <wl@xen.org>
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> > +When possible, please use the Fixes tag instead (or in addition).
> 
> Do we have any code to turn Fixes: into a list of commits to
> backport to a particular stable branch ?

I think we should have one of those, I've attempted something like:

#!/bin/sh -e

branch=$1
remote=$2

for fix in `git log ${remote}/master --grep='^Fixes:\s.*' --format="%H"`; do
    # Check if the fix is already part of the branch, in which case we have
    # gone backwards enough
    if git branch --contains $fix -r | \
       grep -q ${remote}/staging-${branch}; then
        break;
    fi
    bug=`git show $fix | grep -E '^\s*Fixes:\s.*' | awk '{ print $2 }'`
    # Append possible backports of the bug
    bugs="$bug `git log --grep="^master commit: $bug" --format="%H" --all` \
               `git log --grep="^(cherry picked from commit $bug" --format="%H" --all`"
    for bug in $bugs; do
        if ! git branch --contains $bug -r | \
             grep -q ${remote}/staging-${branch}; then
            continue
        fi
        # Check if fix has been backported
        fixes="`git log --grep="^master commit: $fix" --format="%H" --all` \
               `git log --grep="^(cherry picked from commit $fix" --format="%H" --all`"
        fixed=0
        for f in $fixes; do
            if git branch --contains $f -r | \
               grep -q ${remote}/staging-${branch}; then
                fixed=1
                break
            fi
        done
        if [ $fixed == 0 ]; then
            echo "$fix"
            break
        fi
    done
done

But it's hard to actually test whether it's correct. Seems to produce
some output, but I'm not sure whether it's missing commits, use as:

# ./check-branch.sh 4.12 origin

The script could also likely be cleaned up and improved, it's quite
ugly...

> If not it might be easier to ask people to add both Backport: and
> Fixes:.

I would like to avoid that, a Fixes tag should be enough for us to
figure out where the patch should be applied.

Thanks, Roger.

