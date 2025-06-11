Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6606AD6268
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 00:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012221.1390749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPU4J-00044r-OU; Wed, 11 Jun 2025 22:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012221.1390749; Wed, 11 Jun 2025 22:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPU4J-00043C-KY; Wed, 11 Jun 2025 22:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1012221;
 Wed, 11 Jun 2025 22:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0ch=Y2=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uPU4I-000436-W3
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 22:37:14 +0000
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net
 [46.105.41.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e551084-4714-11f0-a307-13f23c93f187;
 Thu, 12 Jun 2025 00:37:13 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.140.75])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4bHgWr51RNz1fsH
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 22:37:12 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fmjvw (unknown [10.110.118.5])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BE370C01C6;
 Wed, 11 Jun 2025 22:37:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-fmjvw with ESMTPSA
 id U/H1IhcFSmiJBgUA2bOk2Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 11 Jun 2025 22:37:11 +0000
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
X-Inumbo-ID: 9e551084-4714-11f0-a307-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-97G002b78441d9-2dcf-4999-814f-59a31c23654c,
                    CF5C07F8BFC6FE4C0252D8DD6CF7CA7F095CBCB3) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Thu, 12 Jun 2025 01:36:44 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and
 boot data retrieval
Message-ID: <aEoE_FjSL0gU2z39@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
 <4ff41a13-1af9-4c87-ad6b-cd616b4d1840@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff41a13-1af9-4c87-ad6b-cd616b4d1840@oracle.com>
X-Ovh-Tracer-Id: 367043369900553372
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=DKe/D5YYsQYWAntL4tHuj+vmsZ7qez3okCa6WA9eJE8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749681432; v=1;
 b=Ux3HnNp2snZUneMJikNUoQMosJhQhGyReZJK/uT5Gp2uO8Z90yYuZbjCIHkFG4P3DRSwPN9i
 0EPhJE8Faj4BmbawdPSl1tmXkzHOupiMW3WiorL8Fa5niVixaLmXsWMRix0HeTa59AgviOvg8Py
 He/p/xUR1YWF4xEGNr7tNljpg3M17mXinNdVs9UVX87QlyHM0VQDf+Fp7s4Co/KwTHhpZTrlzMo
 BQ1KuHPa86P+mhT3NfTB2Q12kujL763+34HQn/NkjNL7rhUbg6/oibDGY6mKDotrRoLynekSRvS
 1tj45ExoM50LF21PWCeFV135/6eQ0TLOFoFHQD9bt4kFw==

On Tue, Jun 03, 2025 at 10:03:31AM -0700, ross.philipson@oracle.com wrote:
> > From: Krystian Hebel <krystian.hebel@3mdeb.com>
> > 
> > The tests validate that important parts of memory are protected against
> > DMA attacks, including Xen and MBI. Modules can be tested later, when it
> > is possible to report issues to a user before invoking TXT reset.
> > 
> > TPM event log validation is temporarily disabled due to an issue with
> > its allocation by bootloader (GRUB) which will need to be modified to
> > address this. Ultimately event log will also have to be validated early
> > as it is used immediately after these tests to hold MBI measurements.
> > See larger comment in txt_verify_pmr_ranges().
> > 
> > Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> > Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> > ---

> > +static inline int is_in_pmr(const struct txt_os_sinit_data *os_sinit,
> > +                            uint64_t base, uint32_t size, int check_high)
>
> bool return val?

Will change.

> > +    /*
> > +     * ACM checks that TXT heap and MLE memory is protected against DMA. We have
> > +     * to check if MBI and whole Xen memory is protected. The latter is done in
> > +     * case bootloader failed to set whole image as MLE and to make sure that
> > +     * both pre- and post-relocation code is protected.
> > +     */
> > +
>
> Is this the full list of entities that should be covered by PMRs? I am
> thinking of entries in the SLR policy that should be covered. E.g. with
> Linux we ensure setup_data entry blobs are covered before measuring.

Xen's equivalent of setup_data is MBI which is checked below. Command-lines
of Xen and modules are part of MBI as well.

> > +    /* Check if all of Xen before relocation is covered by PMR. */
> > +    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
> > +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> > +
> > +    /* Check if all of Xen after relocation is covered by PMR. */
> > +    if ( load_base_addr != tgt_base_addr &&
> > +         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
> > +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> > +
> > +    /*
> > +     * If present, check that MBI is covered by PMR. MBI starts with 'uint32_t
> > +     * total_size'.
> > +     */
> > +    if ( info->boot_params_base != 0 &&
> > +         !is_in_pmr(os_sinit, info->boot_params_base,
> > +                    *(uint32_t *)(uintptr_t)info->boot_params_base,
> > +                    check_high_pmr) )
> > +        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);

> > +    /* Check if TPM event log (if present) is covered by PMR. */
> > +    /*
> > +     * FIXME: currently commented out as GRUB allocates it in a hole between
> > +     * PMR and reserved RAM, due to 2MB resolution of PMR. There are no other
> > +     * easy-to-use DMA protection mechanisms that would allow to protect that
> > +     * part of memory. TPR (TXT DMA Protection Range) gives 1MB resolution, but
> > +     * it still wouldn't be enough.
> > +     *
> > +     * One possible solution would be for GRUB to allocate log at lower address,
> > +     * but this would further increase memory space fragmentation. Another
> > +     * option is to align PMR up instead of down, making PMR cover part of
> > +     * reserved region, but it is unclear what the consequences may be.
>
> The consequences depend on the firmware. The failure mode we used to see was
> on some systems if the PMR covered certain areas marked as reserved, the
> system will hang at boot. In this particular case, firmware was trying to
> use an xHCI controller to get to the kb attached to use it at boot time.
> When DMA to the host controller was blocked, the firmware was unhappy. We
> have not seen this issue in a while and the current logic in the prologue
> code just sets the upper bound to the highest RAM area below 4Gb which is
> optimal.
>
> The most correct solution for PMRs is to read the VTd RMRR structures. These
> can tell you what reserved regions should not be blocked like this (if any).
> This will give more control over the best configuration for the PMRs and
> what to avoid. This needs to be done in the prologue code and validated in
> the DLME.
>
> And yea, TPR support too where available.
>
> Thanks
> Ross

I guess this needs checking whether it's still an issue.

Regards

