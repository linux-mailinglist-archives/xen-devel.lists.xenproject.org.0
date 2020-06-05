Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1D1EFF2C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 19:38:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhGHn-00041s-4l; Fri, 05 Jun 2020 17:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVi9=7S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jhGHm-00041n-3c
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 17:37:42 +0000
X-Inumbo-ID: 410e82ec-a753-11ea-ba62-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 410e82ec-a753-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 17:37:40 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: i2/lbkd5i1GHpoqr0NvG+CJo8t9BYurPS+k7x2p2CC1OC90WyPavfY8MRJFJze5HMYQZz/2UQA
 6glpEBx9Add8iwZGcZls8j0MEDE7KiKWT+jPyWAwhSpUlCiaIO9tRM9GEJzi8PjbdzvHHzmEkG
 rf9w8YdKeU/sgt+5VE8hO89GNGwyHyLlrissls9v0WXex3FoK88loNFlU7QqAOQt8NKTpZKEbl
 MIAgHzniNyS2Cz2JqueDOGUD9JL6AlEdh0wYx8Og+1yp0ibek119fEYl0lzV8BOIiReLxdDThD
 u/o=
X-SBRS: 2.7
X-MesageID: 19348260
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,477,1583211600"; d="scan'208";a="19348260"
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d28d54d1-3548-3eca-b672-2f9ea1b5ceb9@citrix.com>
Date: Fri, 5 Jun 2020 18:37:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/06/2020 08:51, Jan Beulich wrote:
> Both match prior generation processors as far as LBR and C-state MSRs
> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
> (recent spec updates).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Such changes having been subject to backporting in the past, this
> change may want considering for 4.14.
> ---
> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
> apparently addressed by ucode update, so we may not need to deal with
> it in software.

I've enquired about this.  At a guess, there was another hole found, so
MDS_NO has been cleared and VERW flushing reinstated.

Either way, changes there can wait until we've got confirmation.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

