Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16B4F66F1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 19:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300076.511650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9Qd-0005BM-Gp; Wed, 06 Apr 2022 17:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300076.511650; Wed, 06 Apr 2022 17:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc9Qd-00058f-CO; Wed, 06 Apr 2022 17:26:47 +0000
Received: by outflank-mailman (input) for mailman id 300076;
 Wed, 06 Apr 2022 17:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ELh=UQ=citrix.com=prvs=088becc42=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nc9Qb-00058V-Lh
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 17:26:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9dd0043-b5ce-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 19:26:44 +0200 (CEST)
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
X-Inumbo-ID: b9dd0043-b5ce-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649266004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6h5mm5ru4URX4F7cJjAauc2rtb1g8wTivre+Nbf3HDc=;
  b=JWiIBSx3MbD1mQEFssbZPerAMDJEQmR2BhamtBWTZuYbDbE+T0Hf1lbI
   uDCYnVJ3j4QsRl+iz/pWTvMVsGlBmmFiL0ze+1m078JJBY1R/ZW3M/NN9
   lNbkNVFUC2MIfL1Zj8t5GwSqpPDR0+o/lANmZfdbO6GMoUYPXPAQMUgAL
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68589586
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:apXQQ6oeVKSp2G+7Yu597iDcUZdeBmL7ZRIvgKrLsJaIsI4StFCzt
 garIBnVaayPMGPyfNt3YdznoxhV7ZLdzYJjTwVp+S1nQ3saoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y2q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBBb+LoM43fB9jSjBjNPR8+uLpBnelmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPEmQMkAfZD/7Drpin/iotlm4SwQbpW/Ou7Fn+TmQ3S5Ihe2F3N39JYXRGJQ9clyjj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcIAPELy18NZ6jVvVwXYcYDUoUl+8rei8m1SJcdtVI
 EwJ+QIjtaE3skesS7HVUxSmrVaesxUbWt4WFPc1gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrNQcxkC7WdlcDuFHf7x
 DXikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzj7FGVqPxCx/X9e0eoXx01qGw9FPNq/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgkzPSZ8PEi3ySDAdJ3T3
 7/BL65A6l5AVMxaIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXMLxotfPY8FWFo
 4kEXydv9/m5eLegCsUw2dRNRW3m0FBhXcymwyCpXrDrzvVa9JEJVKaKnOJJl31NlKVJjObYl
 kxRqWcDoGcTcUbvcF3QAlg6MeuHdc8m8RoTYHx9VX71iiNLSdv+s88im24fIOBPGBpLlqUvE
 ZHouqyoX5xyd9gw029EN8Og89U+Kk/DaMDnF3PNXQXTtqVIH2ThkuIItCOznMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:nfdMKaHVQ4FSTEeMpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68589586"
Date: Wed, 6 Apr 2022 18:26:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yk3NTuVKK6sPfBZm@perard.uk.xensource.com>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-3-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220401104713.22291-3-jane.malalane@citrix.com>

On Fri, Apr 01, 2022 at 11:47:13AM +0100, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note:
> 
> - vmx_install_vlapic_mapping doesn't require modifications regardless
> of whether the guest has "Virtualize APIC accesses" enabled or not,
> i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long as
> virtualize_apic_accesses is supported by the CPU.
> 
> - Both per-domain and global assisted_x{2}apic options are not part of
> the migration stream, unless explicitly set in the configuration file,
> so it is safe to migrate a guest that doesn't have assisted_x{2}apic
> set in its config file between hosts that have different support for
> hardware assisted x{2}APIC virtualization.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com> # tools

Thanks,

-- 
Anthony PERARD

