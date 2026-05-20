Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEAeNXvbDWpN4QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:04:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C845916AC
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314131.1584128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjOJ-0001dD-I0; Wed, 20 May 2026 16:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314131.1584128; Wed, 20 May 2026 16:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPjOJ-0001bl-FB; Wed, 20 May 2026 16:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1314131;
 Wed, 20 May 2026 16:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46209296000f373@swg.vates.tech>)
 id 1wPjOI-0001bf-T1
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPjOI-004efe-7P
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:03:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46209296000f373@swg.vates.tech>)
 id 6a0ddb37-bab6-0a2a0a5309dd-0a2a4508e5ec-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:03:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e46209296000f373@swg.vates.tech>)
 id 6a0ddb4d-63b5-0a2a45080019-b9ff1c22a221-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:03:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e46209296000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 16:03:20 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8940482F0B;
 Wed, 20 May 2026 18:03:19 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=uGIjoaPJRNiMI3TEsvCd7pchrF6q+islJ76UpPMOkr0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LRcFAUgx5G2+z5jtGSfzRBPJ7NxCGEiSUXPiIMHgvTDd+ieUF5rejbhgc+g4qejMuZpsaAjX4
 9GB7tbH+quFuRDJoP8zU1v6w38ur0vcyIrudZcWNVRysWRIaStwJgvl66MW8dfVbYTONntemS0s
 7UhK1W2HMbuUJAhloqzgAf2RA9L7Q6HmjjlvjES+aW+MuhHghcZ2aHPs3zLicH0oCo11GKsbsOr
 LmxhwQ1hjp52gvXWcwsf4Jv/Ssb3VnbB0CU+K6aNxDNSSTunTO2DKWzI8A26T1Ce48nqNprCpzc
 0k7lj8GCq7rY2DsArCeK4iYdJqvzr7oq5Zv1uBcVTiMQ==
X-Zone-Loop: f5cc6a7259e86d66f72198d6fe7d5415a68d0ac7f0b5
x-campaign-type: default
x-transaction-id: 70fe10aa-b35d-4c6d-b982-91cd7eae5ed6
x-swg-uid: 01-ea4c1311-eb49-41cd-9b00-6fb76243c048
X-Mailer: Sweego
Message-ID:
 <1779293000.8631fc262581453bbf619ec5b2062170.19e46209296000f373@vates.tech>
x-swg-bid: 1779293000.8631fc262581453bbf619ec5b2062170.19e46209296000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 18:03:19 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm: do a 4th linking pass if necessary
References: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1071.99cd8c440335dea4.19e4620903d.4105d4de25590562=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779292999742
X-purgate-ID: tlsNG-c1860d/1779293006-B777EDB1-E646E5FB/0/0
X-purgate-type: clean
X-purgate-size: 2937
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:dkim,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 49C845916AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1071.99cd8c440335dea4.19e4620903d.4105d4de25590562=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 01:53:34PM +0200, Jan Beulich wrote:
> Once we generalize linking, we may want to introduce an equivalent of
> Linux'es KALLSYMS_EXTRA_PASS as well=2E I don't think doing this right h=
ere
> would make overly much sense, though=2E

If you generalise linking, you are going to put it in a shell script,
right? Because this recipe is getting very complicated, for within a
makefile=2E

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -99,9 +99,20 @@ $(TARGET)-syms: $(objtree)/prelink=2Eo $(o
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  		> $(dot-target)=2E2=2ES
>  	$(MAKE) $(build)=3D$(@D) $(dot-target)=2E2=2Eo
> -	$(call compare-symbol-tables, $(dot-target)=2E1=2Eo, $(dot-target)=2E2=
=2Eo)
> +	if ! { $(call compare-symbol-tables, $(dot-target)=2E1=2Eo, $(dot-targ=
et)=2E2=2Eo) >/dev/null; }; \

This `>/dev/null` seems to only suppress the output of the `diff` of the
macro, is it what is intended?

> +	then \
> +		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen=2Elds $< $(build_id_linker) \
> +		    $(dot-target)=2E2=2Eo -o $(dot-target)=2E2; \
> +		$(NM) -pa --format=3Dsysv $(dot-target)=2E2 \
> +			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> +			> $(dot-target)=2E3=2ES; \
> +		$(MAKE) $(build)=3D$(@D) $(dot-target)=2E3=2Eo; \

This new block ignore all errors, from LD, NM and MAKE=2E We want
a `set -e` before the if=2E

> +		$(call compare-symbol-tables, $(dot-target)=2E2=2Eo, $(dot-target)=2E=
3=2Eo); \

At least, an error returned by `diff` in that macro should be taken into
account, for now=2E

> +	else \
> +		ln -sf $(dot-target)=2E2=2Eo $(dot-target)=2E3=2Eo; \
> +	fi
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen=2Elds $< $(build_id_linker) \
> -	    $(dot-target)=2E2=2Eo -o $@
> +	    $(dot-target)=2E3=2Eo -o $@
>  	$(NM) -pa --format=3Dsysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@=2Emap
> --- a/xen/scripts/Kbuild=2Einclude
> +++ b/xen/scripts/Kbuild=2Einclude
> @@ -65,7 +65,7 @@ define compare-symbol-tables
>      $(OBJDUMP) -t $(@D)/=2Ecst=2E$$$$ > $(1)=2Esym; \
>      ln -f $(2) $(@D)/=2Ecst=2E$$$$; \
>      $(OBJDUMP) -t $(@D)/=2Ecst=2E$$$$ > $(2)=2Esym; \
> -    rm -f $(@D)/=2Ecst=2E$$$$
> +    rm -f $(@D)/=2Ecst=2E$$$$; \
>      diff -u $(1)=2Esym $(2)=2Esym

This macro is missing `set -e`, if both OBJDUMP command fails and create
an empty file, `diff` will return success=2E But looks like `set -e` in
this macro isn't going to work in the condition of the `if`=2E


Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1071.99cd8c440335dea4.19e4620903d.4105d4de25590562=---

