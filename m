Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC115B9F09
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 17:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407555.650096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqx0-0007qV-37; Thu, 15 Sep 2022 15:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407555.650096; Thu, 15 Sep 2022 15:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYqx0-0007oC-0A; Thu, 15 Sep 2022 15:38:50 +0000
Received: by outflank-mailman (input) for mailman id 407555;
 Thu, 15 Sep 2022 15:38:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiOX=ZS=citrix.com=prvs=2502044d7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oYqwy-0007o6-OM
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 15:38:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bdb0609-350c-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 17:38:47 +0200 (CEST)
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
X-Inumbo-ID: 7bdb0609-350c-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663256327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Iadj4JYfo230c1tOxQcP3tY1NRj8KoURbKAfkgTiKhg=;
  b=VZczGXR+EIlM6eKmTax8gvyC58oPR/4SDoPVFct2XwPGrrO3NycDkVSW
   uQw7ADZj6CgF5k7sNQmRkcXKCxFMnNy+X1z1uzre0kSA+z7JxWw2x9dqO
   Kn/eHHMh3VqhF93vzfcv/B9aae1EvRG8qw1yNMxlvgygmo1mN3Um5/5aU
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80606110
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AVqkKra6hh0hS4szd+fdleQxR2vbMJRcaRSYv2?=
 =?us-ascii?q?9bJ6EIq2BhvcrjodFUmCkIcWPpLnpZLPAsPED+bGMIyG+dUvupRQ9a1IjqZS?=
 =?us-ascii?q?3xd7v7rPxcKMrAeaYl13J+4oG6z6tQglgPC6T7PDiRhkJqnSNkcjsqaehiYA?=
 =?us-ascii?q?XU9X5efba1KtHU1tbQdm9MbbbmgLKc4/y4JTNXpLC9gWg8OjUa854Aop8QaP?=
 =?us-ascii?q?xCyNV0SJVopsGHhQqgbR2aZ/5IDw4YaZxDyHtuJroBYt5zerPNfmTXxksYnH?=
 =?us-ascii?q?A0jkfwQCP8yZTlX6QEwAaUEbqogyEFzEfLUO+E9iCH94SszdUr4opUOQZY7K?=
 =?us-ascii?q?iaO6kr2la6msCbKjZOQy9WEbzqR88p7GJg2G2rzHOIUKJzx4YThmZzXZvC9N?=
 =?us-ascii?q?+v7FnRhm7I14B7/BwPL7Mi8R4F5F22rxXa599Cu/vyjPW714n0uOdmNNDT8M?=
 =?us-ascii?q?17v4449vHj0hVr5hDXZRdpHyRZ6LQbO0pQbvgZ/oSe9/GpbEAPtd8kW1Z8bk?=
 =?us-ascii?q?tHVEda8QBpWn0DIfFJpT25Y7bT78wTaLoiTyEDZkTlzLmg8nNpFCX8eEc9ag?=
 =?us-ascii?q?NOUgd9bunFMTX481Kgv4BGeBwEJLQOEHfi6Z/eCelgJsx6v7IQC6bF/X6jZf?=
 =?us-ascii?q?q2L1Pp9ZUSrV8k/tmzOtZEdJS/qfegLq3a5UvhGeYu6NdYzGHy9abG1TZKHL?=
 =?us-ascii?q?ADc2g0NiQlufbfKcMnOhwhFZ4MRNxXTa85pX0GEUiMwaPm+qt9C9XL2qe0wj?=
 =?us-ascii?q?gVbGmF3KiG9YcetRNma2FUE9D+BvU8yGReVKLbPqKu6bpjFZCHJHHy2EKlUi?=
 =?us-ascii?q?V2E0WcX25BVmbjBUujTQvlzLuy5TLpzEoUWCXCcjDVqtmEx5BYdZ5udktR2J?=
 =?us-ascii?q?1W6F1i6IWtmbsfPd+d+PXLTa2ep8LNF/Ge9TT3L9Aenj3kSt5YVXtrHv5mcp?=
 =?us-ascii?q?QccYBa3h35zCy1JulrnVOw50jPlnQoMqqSpQ5H31OdzA4H/BLfCjthE1NM26?=
 =?us-ascii?q?cEnn3hTuQt3AvRBQGrksafrNEZPB7E4kgVhb/2vpQOGlSYQIW5BjRjZa+1Tt?=
 =?us-ascii?q?daHZlTQSgBAtGZmsa/vaxTzgMvH6RQur3Pu4fHFB5mc18fHFFdV3jXlXibgw?=
 =?us-ascii?q?moFWVIFykqG1wIRyIwaTPWDEtrEtw1PcBETCGdCOwMQWDe9QaheLolSJPs8C?=
 =?us-ascii?q?3TffJKWOEY6Tpahz7HgWz7FjWaIphdSEVLVtZzoAGjTCiQJdAeSaOPq96Slo?=
 =?us-ascii?q?Fh868rH9iyxFomVAm5iJRtunaO8Zx55tGe1VFhYtG9By4FBBJlp1FJRRDkMA?=
 =?us-ascii?q?KSB//LD6SsJCK8PHObPsoZZwUcy5S99UltdgFc4dVsp9g43aX3tqL1aXU+wg?=
 =?us-ascii?q?B+MiBq9/aiaIUBf4caM0S/SjxB0+ovQ38jrAu+86jtsqnl6oCKi+bXP9Excz?=
 =?us-ascii?q?ysghNeNImlaqTtaLzrspJtK1E6s4zayS9qG8YDCu1RzQjbA99UVAHMf7d2K/?=
 =?us-ascii?q?kF6+PD+asPW1jLvZTUfHbhOOWO8TXOL5FvrQpdmtYYVKrKYoOUSEtVqadXYk?=
 =?us-ascii?q?Pi4+FpgZbvJdIPFID9FWFMSsxlWRUCxYCgFMnQ3JavtMFJP8DkZg7PvNHaIJ?=
 =?us-ascii?q?DhPICHChft+dbZBWosrFu9OM8ehVIoa271701+4iSit4j/hZmfbXlQEZW6rk?=
 =?us-ascii?q?igsdHWM0zA5caemTyiumLJuU021Ox9Idyrhm7N2VRSr1QrBxm7YZQzbtBKrn?=
 =?us-ascii?q?CWz9o3KcQ93ybd19VTZ86L/Ee4PjW0djvhQ14U+Yofqg0rCPB5af/9UoPmxa?=
 =?us-ascii?q?Bs0qDJR318SI+v26UV3ub6cGsB3F+d+Ud/OrR01b3r4hTy/1sJnti1T1CJJl?=
 =?us-ascii?q?rIreDDxjhVI2MzQm3JAqENHUToNMrWWUkO+vqpJdZaEHyVXFhn5wwk2aYN/m?=
 =?us-ascii?q?5phn8I1HhXsbfgWE0XP4yhMQKiv3MuheX1M0AXNV/Uh7a+P77i3PNjC3ygUG?=
 =?us-ascii?q?yYsRYbY9ff/qiSKedqkXZwIf2TUYxD0AY3Jlhk6qVwSaad4DXjD6oxbLM9MB?=
 =?us-ascii?q?AhCvTTR1yLL8HqfFnlwsJUctSlZLOeSctlP0iUxR76SU5dEaMnAUFNA1zpbA?=
 =?us-ascii?q?oioh0clM9O3riTOhMZw4fTFDOumYEy4r93FR3MEjfATbcZgP5pOd1ha0LyNn?=
 =?us-ascii?q?dKEAuqmtLPOF0GaCdqQBI9pEQ4mz4j1gegKFg5NMxSGlxkZVRN27N4ujhyOs?=
 =?us-ascii?q?OxULFVz7CJ58o5vcVOhs+B7ldta16mXYOapPGGle7RX63genDZrKclFxx7Wo?=
 =?us-ascii?q?hjeov2GY4Nvv7PSN4HKzduJQ6ZWjM0qOvcyeoizX2BPuYENmwrV1NIiryHus?=
 =?us-ascii?q?Xckpkv//ZWWR/CnxBuciCohRBmEkJq7OGbB9/LibkU/w7mim+ewv1nBAv0iK?=
 =?us-ascii?q?C4Tm08jiEy0Z4L4TUR6GTg7ow70Wtx2a734PpMKXDmDjyFHFz8ms+sJbyeob?=
 =?us-ascii?q?bi1BnMkUUVnDn0WYSwVbMQt0W48NYABhozPgec0pnASc2USPdLyKw/QgB9EX?=
 =?us-ascii?q?7YTlcZuqqMSFPj4RHk7NRBF6GJjVmmqvW8xuGrg0FJJkt253wwsqXRM0GHkJ?=
 =?us-ascii?q?DQivQqyGucjXmtKdi2+RDgE/pph288Dds9YEnHmsKZce8g0sVuUJbuAy4G7T?=
 =?us-ascii?q?zcPR0OvoQSUzms7cAgQQ+1rNUdtLX79jpGTNDMnE+Z4xbeq9P5ua5OJ7Mr6v?=
 =?us-ascii?q?KyVO8b2dcCRM8XYgg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80606110"
Date: Thu, 15 Sep 2022 16:38:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: Sorting out osstest
Message-ID: <YyNHAUomrUHyyi+n@perard.uk.xensource.com>
References: <YyNDpi9vGiNE60v7@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyNDpi9vGiNE60v7@MacBook-Air-de-Roger.local>

On Thu, Sep 15, 2022 at 05:24:22PM +0200, Roger Pau Monné wrote:
> Hello,
> 
> There was a bit of a mess with osstest, changes have been pushed
> directly into xenbits osstest.git#master.  The same changes have also
> been pushed to testing.git#pretest (but it seems that with different
> hashes).  Prestest however is not passing because of libvirt build
> issues.
> 
> osstest.git#master:
> 
> 8510c7df (origin/master, origin/HEAD) ts-libvirt-build: Rework to build with meson
> f9d084ab TestSupport: Add support for installing from backport repo
> b21b6e80 (testing/pretest) ts-xen-build-prep: Install newer NASM version, to build OVMF
> 2cffc6ec (testing/production, testing/master, refs/patches/fix_efi/debian-hvm-cd-update) osstest: update Debian Buster install CD media to 10.12
> dc762d67 osstest: install irqbalance
> 
> testing.git#pretest:
> 
> 12c254e (HEAD -> pretest) ts-libvirt-build: Rework to build with meson
> c2c2f5a TestSupport: Add support for installing from backport repo
> b21b6e8 (production, master) ts-xen-build-prep: Install newer NASM version, to build OVMF
> 2cffc6e osstest: update Debian Buster install CD media to 10.12
> dc762d6 osstest: install irqbalance
> 
> My plan would be to pick osstest.git#master, add my libvirt fix on
> top of it:
> 
> https://lore.kernel.org/xen-devel/20220913100328.27771-1-roger.pau@citrix.com/
> 
> And then force push the result into testing.git#pretest in order to
> overwrite the current pretest branch and have it based on
> osstest.git#master.
> 
> I would then expect the pretest flight to succeed and do a fast
> forward push into xenbits osstest.git#master.
> 
> Let me know if that sounds like a suitable plan.

Yes, that plan sound good to me. Just one thing, `git checkout master`
in testing.git as at the moment "pretest" is the current branch.

Cheers,

-- 
Anthony PERARD

