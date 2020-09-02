Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9D25B58F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 23:03:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDZtx-0005Bt-Et; Wed, 02 Sep 2020 21:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9C4+=CL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kDZtv-0005Bo-Vm
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 21:02:40 +0000
X-Inumbo-ID: da53a81a-adc5-4f3d-98da-18a59f8d1468
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da53a81a-adc5-4f3d-98da-18a59f8d1468;
 Wed, 02 Sep 2020 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599080558;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YL3nzZHYykoPI/9coefS3689l1jia1l5twU5Kl9EbyU=;
 b=CN96h520NhjdMSYRCe18BrPVAviIal8GsZlj+cPwNVG2wjOapnxELibM
 culh4cfKSlwDJ6jpRyF/R3K0KVZ33fJVt2zTLQ3LnW/UtFZYCAHIQ87Gz
 4NAORggtKPufGc+fyKMqXjV0pLECs8UC4DvSvpyHnQdXU4SJtgvBuYPsG A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EuGVWi2Su6Jrw9IAHjizIBK/PX9ACBw/kivhlwbxv7AbT/GLTa6HmCySCk/rRQ3GvBGnudSvDZ
 FWjo4HWvrG+CdnCOIrBlPn1rjYWZ0zO1FCDTggNNnAFBZEO+abhRpaYq7atZOj57fjo8R8JumI
 pZ/Q2oH4kjlL6bwbM1xZAH1vciKyhlV+RZVbGCbx9jeLA4XjWh7vUK/z4PBNUVCeCw1z3pmgGf
 IxzilK9mGyrb8B/tTuz8RIJvvLOQIGXuzP18xlllbU1oL38QCr+5QA39lGVMyN16yJR9ZfiSwG
 GHY=
X-SBRS: 2.7
X-MesageID: 26828692
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,384,1592884800"; d="scan'208";a="26828692"
Subject: Re: [PATCH v3 4/8] x86/svm: handle BU_CFG and BU_CFG2 with cases
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-5-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
Date: Wed, 2 Sep 2020 22:02:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-5-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01/09/2020 11:54, Roger Pau Monne wrote:
> @@ -1942,19 +1966,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>      default:
>          if ( rdmsr_safe(msr, *msr_content) == 0 )
>              break;
> -
> -        if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
> -        {
> -            /* Win2k8 x64 reads this MSR on revF chips, where it
> -             * wasn't publically available; it uses a magic constant
> -             * in %rdi as a password, which we don't have in
> -             * rdmsr_safe().  Since we'll ignore the later writes,
> -             * just use a plausible value here (the reset value from
> -             * rev10h chips) if the real CPU didn't provide one. */
> -            *msr_content = 0x0000000010200020ull;
> -            break;
> -        }
> -
>          goto gpf;
>      }
>  
> @@ -2110,6 +2121,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>          nsvm->ns_msr_hsavepa = msr_content;
>          break;
>  
> +    case MSR_F10_BU_CFG:
> +    case MSR_F10_BU_CFG2:
> +        if ( rdmsr_safe(msr, msr_content) )
> +            goto gpf;

The comment you've moved depends on this not having this behaviour, as
you'll now hand #GP back to Win2k8 on its write.

Honestly, given that how obsolete both Win2k8 and K10's are, I'm
seriously tempted to suggest dropping this workaround entirely.

~Andrew

> +        break;
> +
>      case MSR_AMD64_TSC_RATIO:
>          if ( msr_content & TSC_RATIO_RSVD_BITS )
>              goto gpf;


