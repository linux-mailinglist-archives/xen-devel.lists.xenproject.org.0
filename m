Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9871AD623B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 00:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012208.1390739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPTjE-0001Jv-0f; Wed, 11 Jun 2025 22:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012208.1390739; Wed, 11 Jun 2025 22:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPTjD-0001Ht-T4; Wed, 11 Jun 2025 22:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1012208;
 Wed, 11 Jun 2025 22:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0ch=Y2=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uPTjB-0001Hn-Fz
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 22:15:26 +0000
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net
 [178.32.119.250]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 915b16e1-4711-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 00:15:23 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.148.164])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bHg2f29XQz1SWB
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 22:15:22 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fmjvw (unknown [10.110.168.167])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 33AAE841F3;
 Wed, 11 Jun 2025 22:15:21 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-fmjvw with ESMTPSA
 id YYnCN/j/SWgc+wQA2bOk2Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 11 Jun 2025 22:15:21 +0000
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
X-Inumbo-ID: 915b16e1-4711-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-114S008e51bf213-26b3-4121-af28-2028cbb1de8f,
                    CF5C07F8BFC6FE4C0252D8DD6CF7CA7F095CBCB3) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Thu, 12 Jun 2025 01:14:53 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
Message-ID: <aEn_3U3YxdeUXC6p@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com>
X-Ovh-Tracer-Id: 18445055224532677788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=PF45JHkS6yxBtHKhK/5xeoDWZAtphBhKMQ4IkDbNJbw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749680122; v=1;
 b=JN9zRCvOdlXYI0SwwSnbP4MBm7Am2Q5QYi+VXwPOppiupGHNuN43y/pm/UO4rK1IYmxepgi4
 5UnTNDVOUEWJAOb8E0H02fP92WXIGm42F13lNNJTvIuMxaO7BpHHRR+GaVSywplzENyDRuect3I
 TFZRgH//S+s1ycDhagz6WJVLypnpsn/CPLK00dxRPPjG+ktEpgwxsA1GXu1xeLc1bqQy/Y15qCL
 G7OB4su+INggzfhCMRe7KEz2k6bXYEjcUkSFBMMk1mDQLPmQo+PGH7h3XqnIboAZIHJd1PlRe/G
 PebFYSuWK78ENuzx4nsY2X6KWnFT9tpgcbGFox8o/jOxQ==

On Tue, Jun 03, 2025 at 09:17:29AM -0700, ross.philipson@oracle.com wrote:
> > +void asmlinkage slaunch_early_init(uint32_t load_base_addr,
> > +                                   uint32_t tgt_base_addr,
> > +                                   uint32_t tgt_end_addr,
> > +                                   struct early_init_results *result)
> > +{
> > +    void *txt_heap;
> > +    const struct txt_os_mle_data *os_mle;
> > +    const struct slr_table *slrt;
> > +    const struct slr_entry_intel_info *intel_info;
> > +
> > +    txt_heap = txt_init();
> > +    os_mle = txt_os_mle_data_start(txt_heap);
> > +
> > +    result->slrt_pa = os_mle->slrt;
> > +    result->mbi_pa = 0;
> > +
> > +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
> > +
> > +    intel_info = (const struct slr_entry_intel_info *)
> > +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> > +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
> > +        return;
>
> Since these are the x86/TXT bits, it seems at this point, not finding the
> TXT info structure would be fatal, no?

It is fatal, but early code doesn't have means for reporting errors
nicely, so it just continues.  You think it's better to reboot right
away?

> > +static inline void *txt_init(void)
> > +{
> > +    void *txt_heap;
> > +
> > +    /* Clear the TXT error register for a clean start of the day. */
> > +    txt_write(TXTCR_ERRORCODE, 0);
> > +
> > +    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
> > +
> > +    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
> > +         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
> > +        txt_reset(SLAUNCH_ERROR_GENERIC);
>
> I know the list of error codes pulled in are from the patches for Linux
> Secure Launch which seems right. The Xen work is free to add more specific
> error codes e.g. somewhere like here. We could even consider using regions
> in the vendor error code space for different things like generic errors vs
> architecture specific ones vs etc.
>
> Thanks
> Ross

I think some codes were already added and this is the only place where
SLAUNCH_ERROR_GENERIC is used, not really sure why, will add a couple
more.  By the way, the new errors were inserted in the middle making
about half of the errors out of sync with Linux, should Xen and Linux be
in sync?

Not sure about usefulness of error regions, the errors codes are only
for TXT and major/minor errors in TXT.ERRORCODE weren't helpful in
debugging.

Regards

