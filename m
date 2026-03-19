Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDpXFJkovGkxtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:47:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCC2CF0EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257418.1551821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GWX-000508-A9; Thu, 19 Mar 2026 16:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257418.1551821; Thu, 19 Mar 2026 16:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GWX-0004xh-74; Thu, 19 Mar 2026 16:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1257418;
 Thu, 19 Mar 2026 16:47:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVNG=BT=bounce.vates.tech=bounce-md_30504962.69bc2884.v1-7779c9b467c24a85942dffc31b546d68@srs-se1.protection.inumbo.net>)
 id 1w3GWV-0004xZ-96
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:47:03 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 405ced89-23b3-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 17:47:01 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fcBS40njbzP0KMXW
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 16:47:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7779c9b467c24a85942dffc31b546d68; Thu, 19 Mar 2026 16:47:00 +0000
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
X-Inumbo-ID: 405ced89-23b3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773938820; x=1774208820;
	bh=zlCQ0TUP4D4w+ZI9S+9xk7k7Wbs8Mv+rTcCR7o/dRE4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fKzqMA2SHSwgm731Yk3+pmzJJzoWOMkBA1oF0UJ6Leac6musQhnlti1CCLGPjJdTt
	 xjCOtZwBIFIIV38jD1/ggWnAzeTdiqFAJ1IpyMhg0Ll9zwDM0cywqg8umrjoNFgECV
	 4lWKUEUqFPTWZhcPBXPNmoVOVAeKAe0Afa4+HLlsqsmWInp+ku+2hKIDD4aySF8hp7
	 Gc5wqXyc40oaBSJdflr4DQ6MjJ3LF2ynULDBTXx1bzKGH9UD6EBhUzMnxHX7nJF4g2
	 LG/8q8hdH2ip66Wem6pvU2TabXXs+6kSJIOQinIImL9VwmKC9Xsf5OaZqwn6yZcJm7
	 mPjD7K2Q7Lcng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773938820; x=1774199320; i=anthony.perard@vates.tech;
	bh=zlCQ0TUP4D4w+ZI9S+9xk7k7Wbs8Mv+rTcCR7o/dRE4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HdXwQgC6zRZ269IQ+gNzwoYb+sgCGq/NTaW717w4EWVXmD265SgeZjd2i1eO8UW4x
	 W0nq4/Ooz5G1yZrvnYFqkvvZVYv1aO64dmB9gUHBTiENGSs1F0U0TA+MVIRi/cYtKA
	 6D5VFShU9Ka/dT+B8UYUBfCSSqpoue8CrQG6uViRME82uwVcFUsiWzQSyqwaYFZVXb
	 p7BDeLWDFoue/hTfHrmlMmp1xaipbrsHqa5s6gADpMmCW4pXYFHAjNALq9GZolFuqA
	 QRsfWSCZakOsMmjsru3Lg1j6squMVTJmqjaNoCR6AJKhq3FPtYZ7+v6aOWq+hIsaVP
	 NedL8EvhXazLw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2007/11]=20tools/xenstored:=20implement=20the=20GET/SET=5FQUOTA=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773938819464
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abwog6TisFL9ZfeC@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-8-jgross@suse.com> <abgc1Azehzw_m9Ff@l14> <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com>
In-Reply-To: <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7779c9b467c24a85942dffc31b546d68?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 16:47:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.865];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F0DCC2CF0EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:27:43PM +0100, Juergen Gross wrote:
> On 16.03.26 16:08, Anthony PERARD wrote:
> > On Thu, Mar 05, 2026 at 02:52:04PM +0100, Juergen Gross wrote:
> > > +		if (n_pars == 1) {
> > > +			quota = quotas;
> > > +			name = vec[0];
> > > +		} else {
> > > +			domid = atoi(vec[0]);
> > 
> > Shall we check that vec[0] actually contain a plausible domid? (An
> > integer between 0..65535). Right now, this accept everything, and would
> > return 0 if there's not a single digit.
> 
> I have followed the pattern used in other places where a domid is expected.
> 
> In the end nothing will really break.

On the daemon, no, not really.

> Any integer not being a domid will result in ENOENT, while the case of not
> a digit is a bug in privileged software (domids can be specified by dom0
> only).

It would be a bug, indeed, but xenstored can help telling exactly where
there's a bug, instead of ignoring it and carry-on. Well, just return
EINVAL when something other than a number is found. You do that for
quota, why not for domid as well?

That can also help when the daemon is replace by a different
implementation that actually do the checks. (well it would help finding
bug in the client earlier)


> > > +	} else {
> > > +		domid = atoi(vec[0]);
> > > +		domain = find_or_alloc_existing_domain(domid);
> > > +		if (!domain)
> > > +			return ENOENT;
> > > +		quota = domain->acc;
> > > +		name = vec[1];
> > > +		val = atoi(vec[2]);
> > > +	}
> > > +
> > > +	if (parse_quota_name(name, &q, &idx))
> > > +		return EINVAL;
> > > +
> > > +	quota[q].val[idx] = val;
> > > +
> > > +	send_ack(conn, XS_SET_QUOTA);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int close_xgt_handle(void *_handle)
> > >   {
> > >   	xengnttab_close(*(xengnttab_handle **)_handle);
> > > diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
> > > index 62ce3b3166..6a06b0d1af 100644
> > > --- a/tools/xenstored/domain.h
> > > +++ b/tools/xenstored/domain.h
> > > @@ -93,6 +93,14 @@ int do_get_feature(const void *ctx, struct connection *conn,
> > >   int do_set_feature(const void *ctx, struct connection *conn,
> > >   		   struct buffered_data *in);
> > > +/* Get quota names or value */
> > 
> > This could say "implement GET_QUOTA" or something instead. But a
> > comment here isn't going to give much value for internal functions.
> 
> If nobody objects I'll drop the comment.

Sounds good.

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


