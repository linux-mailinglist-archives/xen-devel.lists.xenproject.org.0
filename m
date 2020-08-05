Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0ED23CE97
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 20:32:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3OC6-0001x2-UZ; Wed, 05 Aug 2020 18:31:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3OC5-0001wx-U7
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 18:31:17 +0000
X-Inumbo-ID: 6a6e6de7-8463-4510-b17b-29cc8cf439c5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6e6de7-8463-4510-b17b-29cc8cf439c5;
 Wed, 05 Aug 2020 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596652275;
 h=subject:to:references:cc:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zblnwylMrCES0o0qd7d9zi2gUxjGxJewipIWMnjX2Eg=;
 b=SvbCb3eU1MHPkTXUNuIfgQ927Os3GAeMKEITbZp+4akHsDnHyfc/myOG
 cP2FxdOyp3MqClAPY0TCcV0W9q29xxAzXKRM/anUMCRxeALb3+nd4H9Az
 2keDzSk88qECf5bddcPrjnVmyj9vMf/nH0zKGRtkJkgD/0LSmxmLwccWy E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0QLZ0NTlHQ9EPDseLviPBGYrz4w1SDXsh8SWacOwYnqIMeeKQINQDT0rCebWJ1QLcQ0arrLulj
 EtIZMQj6wvdjVzxW5KY3euCxt3JlExtpyByPNPtv/+kmklffSbCcQ9jGGS00Ns5jCvxeAfHpca
 HidgBqgpbHFWJmyt38Ts2BMt7W31pS/Fp63v+vFlPoiCW8i3nMa9EDEkdGQXartF4pP+53matN
 5kpaU/N+qJiT7nnUgfbJJesz3tjpV8Zcj2wG1XoX+zORbNnZbnxLtesO5Oy7qx+LBLKsXAWGJg
 ewY=
X-SBRS: 3.7
X-MesageID: 24843534
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,438,1589256000"; d="scan'208";a="24843534"
Subject: Re: EFI executable corruption when live patching is turned off
To: Trammell Hudson <hudson@trmm.net>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ec1b0f4f-c895-db42-7821-31c2ab8e8708@citrix.com>
Date: Wed, 5 Aug 2020 19:30:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/08/2020 19:19, Trammell Hudson wrote:
> When building xen from head with almost any combination of options, the resulting xen.efi seems properly formed. When CONFIG_LIVEPATCH is turned off, however, the resulting xen.efi is corrupted in some way and binutils no longer wants to work with it:
>
> ~/build/xen-clean/xen$ git rev-parse HEAD
> 81fd0d3ca4b2cd309403c6e8da662c325dd35750
> ~/build/xen-clean/xen$ diff .config.orig .config
> 71,72c71
> < CONFIG_LIVEPATCH=y
> < CONFIG_FAST_SYMBOL_LOOKUP=y
> ---
>> # CONFIG_LIVEPATCH is not set
> 105a105
>> # CONFIG_COVERAGE is not set
> ~/build/xen-clean/xen$ objcopy xen-orig.efi test.efi
> ~/build/xen-clean/xen$ objcopy xen.efi test.efi
> objcopy: test.efi: Data Directory size (1c) exceeds space left in section (18)
> objcopy: test.efi: error copying private BFD data: file in wrong format
> ~/build/xen-clean/xen$ objcopy --version | head -1
> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>
>
> I spent most of today unsuccessfully trying to figure out what was different between the builds (on multiple build host OS with different binutils), so I'm hoping that perhaps someone else has seen this problem.

CC'ing appropriate maintainers.

The difference caused by CONFIG_LIVEPATCH will probably be the logic to
embed the GNU BuildID, which for xen.efi takes a trip through .bin/.ihex
immediately prior to the final link.

~Andrew

