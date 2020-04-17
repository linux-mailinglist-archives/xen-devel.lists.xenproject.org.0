Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F771AE641
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 21:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPX1A-0003YW-2C; Fri, 17 Apr 2020 19:51:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPX19-0003YR-Fv
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 19:51:15 +0000
X-Inumbo-ID: cad0c6ec-80e4-11ea-8d8e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cad0c6ec-80e4-11ea-8d8e-12813bfff9fa;
 Fri, 17 Apr 2020 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587153074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RgRmr230wnYjNNSUHIhVD8yX7hpvc9Y4Jh7dc4PYD9g=;
 b=PcpCkFisTvGzlnnvRMgTWp9BeS5MUTYvhgbtDWrdnySStFqSZcYfoDXv
 INRrxHdqisV8y4s6ajgJ17zCfbWz4zq4D/Unf2va955xJ361OGBwuvEpi
 76kNXfmgXewbIb59eoZuzYOkCKEFsLZ5LrQWWE531L/el2MP9iMORp9fM M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QVx8Y3eMc885KLcfwZPK1w8jzVY68NmjzHuRnzdjzFDDq+n6r9IWGk/c7r2YbzKJQ/+pwlb6zR
 U0So8Rp0C4DVe9tBEJBjORj8OBwThOjbaN5evMqW7ounUpSKhqsfR7MxuqA4MVXGqvDPw8Q4sW
 DoXo+nHltGF4EcQ1JIjonkfkMnia8TTXb0Rv1TdmiIWsoOxwfywdxvT+h/UE18qqoCmTaDMuaF
 4DLjtqabNIcuthpvBj1DDR3piw5Gt/ggFtISi3/powTUDRCXplTl0zIPlhSnS1g3pkEAGUyIcu
 uvo=
X-SBRS: 2.7
X-MesageID: 16107768
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16107768"
Subject: Re: [PATCH 03/10] x86/shadow: monitor table is HVM-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <7aa11566-289c-41c2-ec90-c15e0a6490cb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a198dd8e-cced-53d8-ed33-393f9a878c67@citrix.com>
Date: Fri, 17 Apr 2020 20:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7aa11566-289c-41c2-ec90-c15e0a6490cb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/04/2020 15:26, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -2376,7 +2376,6 @@ void sh_reset_l3_up_pointers(struct vcpu
>  static void sh_update_paging_modes(struct vcpu *v)
>  {
>      struct domain *d = v->domain;
> -    const struct paging_mode *old_mode = v->arch.paging.mode;
>  
>      ASSERT(paging_locked_by_me(d));
>  
> @@ -2421,11 +2420,14 @@ static void sh_update_paging_modes(struc
>      if ( v->arch.paging.mode )
>          v->arch.paging.mode->shadow.detach_old_tables(v);
>  
> +#ifdef CONFIG_HVM
>      if ( !is_pv_domain(d) )
>      {
>          ///
>          /// HVM guest
>          ///

Can we drop this comment while we're here?  The ifdef and
!is_pv_domain() are crystal clear.

~Andrew

