Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8D1DB10F
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:11:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMcZ-0007U3-Nh; Wed, 20 May 2020 11:10:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbMcY-0007Ty-7I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:10:46 +0000
X-Inumbo-ID: 8c7dbc15-9a8a-11ea-a9e9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c7dbc15-9a8a-11ea-a9e9-12813bfff9fa;
 Wed, 20 May 2020 11:10:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A945AADC9;
 Wed, 20 May 2020 11:10:46 +0000 (UTC)
Subject: Re: iommu=no-igfx
To: buy computer <buycomputer40@gmail.com>
References: <CANSXg2FGtiDT05sQUpSAshAsdP4wSjPgQbfw_+aKJuAzSwvJuQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da7e41b5-88a1-13ab-d52b-0652c16608af@suse.com>
Date: Wed, 20 May 2020 13:10:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CANSXg2FGtiDT05sQUpSAshAsdP4wSjPgQbfw_+aKJuAzSwvJuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 19:43, buy computer wrote:
> I've been working on a Windows 10 HVM on a Debian 10 dom0. When I was first
> trying to make the VM, I was getting IOMMU errors. I had a hard time
> figuring out what to do about this, and finally discovered that putting
> iommu=no-igfx in the grub stopped the errors.
> 
> Unfortunately, without the graphics support the VM is understandably slow,
> and can crash. I was also only now pointed to the page
> <https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#iommu>
> which says to report any errors that get fixed by using iommu=no-igfx.

Thanks for the report. For context I'll quote the commit message of
the commit introducing the option as well as the request to report
issues fixed with it:

"As we still cannot find a proper fix for this problem, this patch adds
 iommu=igfx option to control whether Intel graphics IOMMU is enabled.
 Running Xen with iommu=no-igfx is similar to running Linux with
 intel_iommu=igfx_off, which disables IOMMU for Intel GPU. This can be
 used by users to manually workaround the problem before a fix is
 available for i915 driver."

This was in 2015, referencing Linux >= 3.19. I have no idea whether
the underlying driver issue(s) has/have been fixed. The addresses
referenced are variable enough and all within RAM, so I'd conclude
this is not a "missing RMRR" issue.

Cc-ing the VT-d maintainer for possible insights or thoughts.

Jan

