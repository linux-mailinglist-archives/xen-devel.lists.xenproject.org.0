Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417CCAD982D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 00:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015001.1392978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQCpG-0000Wf-Mj; Fri, 13 Jun 2025 22:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015001.1392978; Fri, 13 Jun 2025 22:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQCpG-0000UW-Ju; Fri, 13 Jun 2025 22:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1015001;
 Fri, 13 Jun 2025 22:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZty=Y4=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uQCpE-0000UN-PK
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 22:24:40 +0000
Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net
 [178.32.127.22]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 313ef355-48a5-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 00:24:38 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.139.201])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bJv8Q49gsz1YLg
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 22:24:38 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6jjqj (unknown [10.108.42.231])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9E5BF802E3;
 Fri, 13 Jun 2025 22:24:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-6jjqj with ESMTPSA
 id nFo/ESWlTGhd0AgALAQsQw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 13 Jun 2025 22:24:37 +0000
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
X-Inumbo-ID: 313ef355-48a5-11f0-a309-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-105G006f1ff3a90-cd89-4239-a7a0-de23ff67a778,
                    FF81FBFBD66CD586AFAA25B56E63FC5C08F599B2) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sat, 14 Jun 2025 01:24:08 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 10/22] x86/tpm.c: code for early hashing and extending
 PCRs (for TPM1.2)
Message-ID: <aEylCBakGdg1Jv21@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
 <e56617d6-a144-4191-8027-a173f4b07752@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e56617d6-a144-4191-8027-a173f4b07752@oracle.com>
X-Ovh-Tracer-Id: 11900199069111596188
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduledugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=HSF48yJbymb3K12BUt7XLwXdb3ZWzPjRxTfidSxircw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749853478; v=1;
 b=TCBmiCcQSftaz2PrVRp0JaQyvpz6UOj6p191w13sMg0TC8nFTExcxSS6HYwzQ5DVXuCV4AZ6
 7jXMUpYXv5/Q4kNj5BXCdIca3MpsF1Z31h0lmWav6nuTes7yZLkH9MfGBFZxdcKL3r6wdAtPvt1
 MGR4M230wGYEBplx/mIGLeePe/RaITpbx3itu2uklBwA/pvW2jeIXSSQ9yOuAHHBtP/dt8JLOCR
 /ZOmnNOX58S9O7clmf85I9AsO+po9ZlqHfGE4TOF1ytTo2hcI1jQtlanNsM1SNhuTSpJK1djetT
 kn0haUiolyuvuWGTJIcUJfH4DfL4Tyg1OcEK8gWPK5BMg==

On Thu, Jun 05, 2025 at 10:43:10AM -0700, ross.philipson@oracle.com wrote:
> > +static void send_cmd(unsigned loc, uint8_t *buf, unsigned i_size,
> > +                     unsigned *o_size)
> > +{
> > +    /*
> > +     * Value of "data available" bit counts only when "valid" field is set as
> > +     * well.
> > +     */
> > +    const unsigned data_avail = STS_VALID | STS_DATA_AVAIL;
> > +
> > +    unsigned i;
> > +
> > +    /* Make sure TPM can accept a command. */
> > +    if ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 )
> > +    {
> > +        /* Abort current command. */
> > +        tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> > +        /* Wait until TPM is ready for a new one. */
> > +        while ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 );
> > +    }
> > +
> > +    for ( i = 0; i < i_size; i++ )
> > +        tis_write8(TPM_DATA_FIFO_(loc), buf[i]);
> > +
> > +    tis_write8(TPM_STS_(loc), STS_TPM_GO);
> > +
> > +    /* Wait for the first byte of response. */
> > +    while ( (tis_read8(TPM_STS_(loc)) & data_avail) != data_avail);
> > +
> > +    for ( i = 0; i < *o_size && tis_read8(TPM_STS_(loc)) & data_avail; i++ )
> > +        buf[i] = tis_read8(TPM_DATA_FIFO_(loc));
> > +
> > +    if ( i < *o_size )
> > +        *o_size = i;
> > +
> > +    tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> > +}

> Is this all that is needed to do the send? I would have thought you would at
> least also need that burst count logic to know when the TPM is ready for
> more data. There are also a number of timeouts that are supposed to be used.
> Maybe Daniel has some thoughts too.

The code in this form works without any issues.  Don't know why
burst count isn't taken into account here or why nothing breaks without
it, but this does seem wrong.  I think we needed something to work
before Daniel's version was ready and this implementation possibly
wasn't meant to stay.

> > +static inline bool is_tpm12(void)
> > +{
> > +    /*
> > +     * If one of these conditions is true:
> > +     *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
> > +     *  - INTF_CAPABILITY_x.interfaceVersion is 2 (TIS == 1.3)
> > +     *  - STS_x.tpmFamily is 0
> > +     * we're dealing with TPM1.2.
> > +     */
> > +    uint32_t intf_version = tis_read32(TPM_INTF_CAPABILITY_(0))
> > +                          & INTF_VERSION_MASK;
> > +    return (intf_version == 0x00000000 || intf_version == 0x20000000 ||
> > +            (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
> > +}
> > +
> > +/****************************** TPM1.2 specific *******************************/
> > +#define TPM_ORD_Extend              0x00000014
> > +#define TPM_ORD_SHA1Start           0x000000A0
> > +#define TPM_ORD_SHA1Update          0x000000A1
> > +#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> > +
> > +#define TPM_TAG_RQU_COMMAND         0x00C1
> > +#define TPM_TAG_RSP_COMMAND         0x00C4
>
> I am not sure what the long term goal for a TPM driver in Xen might be but
> my suggestion is to lay out the driver more cleanly up front. Split the
> specification defined things (e.g. these things and other from TCG etc) from
> the driver implementation specific definitions and put them in separate
> headers. There is little enough core code now that just putting it all in
> tpm.c seems fine. Just my $0.02...
>
> Thanks,
> Ross

It could help readability to not have it all in one file.  Don't know
about plans for evolving the code for future use cases.

Regards

