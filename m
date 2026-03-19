Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJmLGHgdvGlEsQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:59:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4382CE2BF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 16:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257338.1551748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FmY-0002cQ-AL; Thu, 19 Mar 2026 15:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257338.1551748; Thu, 19 Mar 2026 15:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FmY-0002ah-7d; Thu, 19 Mar 2026 15:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1257338;
 Thu, 19 Mar 2026 15:59:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jySZ=BT=bounce.vates.tech=bounce-md_30504962.69bc1d62.v1-04f61e5286e74ae6bca9f75abf96e8e3@srs-se1.protection.inumbo.net>)
 id 1w3FmX-0002aT-D7
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 15:59:33 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d9085c8-23ac-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 16:59:31 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fc9PG2n5DzP0Jy4c
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 15:59:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 04f61e5286e74ae6bca9f75abf96e8e3; Thu, 19 Mar 2026 15:59:30 +0000
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
X-Inumbo-ID: 9d9085c8-23ac-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773935970; x=1774205970;
	bh=e5KJgMLs1E0cNlCiz4ZVgR54vTbVJZ75a927JlIYp9Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=S9QoGlOROo7Wnm0DICsrrU4m5wkIKtAS2TfAXQNu8v/jP0lJBQZx3vaFuSDKGtBHm
	 AGFFl5elbvv5SGIXmB7TuATo0c3MS8O2dFJTSgF4Qx/Pif2JWiPfQrbLHxZv2Jaj0I
	 dvFK+6Qk0ctFv9ucSheSBnHrnqt1XQG51LZJzYw8q/xhp4aqcjwNMnyYYvat8bgdc4
	 +gfi+zIE++HK8o9nog2vFxLbIz0ThMROXA9ilwabtLfe/Lxr7BOZ2S+SL47XaNp6ot
	 JLqRwN7DpPaQ4+Ae/o+1WS2fs2c6u8UkPIs0ciIMtQaQHAwsdWpVkn8pT4bMBS53V/
	 U2FkGnNGfpqFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773935970; x=1774196470; i=anthony.perard@vates.tech;
	bh=e5KJgMLs1E0cNlCiz4ZVgR54vTbVJZ75a927JlIYp9Q=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gX1CRX7sejK+X6RCdWz4rhGXxIxzOumNSrLNI6fbXQebAzVp+gn+aFcKkmLr2/u65
	 +mlwNJ+nXqp1F06NhGh4dAi6sDpkB+vIGP2zIcBA1e6ukYnZRMBRcqVN75qHMb0xl/
	 IkuBoBH9JOP5VnK58gKXncWt+yBlnsTXJTfw1GmiORFo8vIkvoXqtKRkZmZB+XkAUU
	 cvXX/GFXzUMBvfwQsry1ol8IBniIEZzLRLI3+ZuQwz6q6uuItTlECEjOVdw62dTGNl
	 I+W9PxxY1XG20Ddtxzk0wHLJgUChv7iML6j4NwdL0VWu0drDxRJSo1CvEBr+IuMBli
	 eKuzCo+gfZfGA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2004/11]=20tools/xenstored:=20add=20GLOBAL=5FQUOTA=5FDATA=20record=20for=20live=20update?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773935969650
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abwdYXd_62UxjjyP@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14> <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
In-Reply-To: <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.04f61e5286e74ae6bca9f75abf96e8e3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 15:59:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_SPAM(0.00)[0.852];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF4382CE2BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 09:15:47AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 13.03.26 18:08, Anthony PERARD wrote:
> > On Thu, Mar 05, 2026 at 02:52:01PM +0100, Juergen Gross wrote:
> > > diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> > > index acdcaa769e..694ae58973 100644
> > > --- a/tools/xenstored/domain.c
> > > +++ b/tools/xenstored/domain.c
> > > @@ -1332,6 +1332,27 @@ int do_set_feature(const void *ctx, struct con=
nection *conn,
> > >   =09return 0;
> > >   }
> > > +static bool parse_quota_name(const char *name, unsigned int *qidx,
> > > +=09=09=09     unsigned int *idx)
> > > +{
> > > +=09unsigned int q;
> > 
> > What do you think of using something like:
> >      const char soft_prefix[] =3D "soft-";
> >      const size_t soft_prefix_len =3D sizeof(soft_prefix) - 1;
> > to explain the `5`, here and in e.g. the function build_quota_data() ?
> > We used this in libxl in one place:
> >      https://elixir.bootlin.com/xen/v4.21.0/source/tools/libs/light/lib=
xl_qmp.c#L1288
> > 
> > But it's fine to leave it like that, as the '5's are close enought to
> > the prefix that we can guess easly enough.
> 
> I can change it, but I'd prefer to use macros for that purpose.

Sounds good.

> > > +static unsigned int get_quota_size(struct quota *quota, unsigned int=
 *len)
> > > +{
> > > +=09unsigned int q;
> > > +=09unsigned int n =3D 0;
> > > +
> > > +=09for (q =3D 0; q < ACC_N; q++) {
> > > +=09=09if (!quota_adm[q].name)
> > > +=09=09=09continue;
> > > +=09=09if (quota[q].val[Q_IDX_HARD] !=3D Q_VAL_DISABLED) {
> > > +=09=09=09n++;
> > > +=09=09=09*len +=3D strlen(quota_adm[q].name) + 1;
> > > +=09=09}
> > > +=09=09if (quota[q].val[Q_IDX_SOFT] !=3D Q_VAL_DISABLED) {
> > > +=09=09=09n++;
> > > +=09=09=09*len +=3D strlen(quota_adm[q].name) + 5 + 1;
> > 
> > The value 5 here isn't explained. A comment would be nice.
> 
> Using the macro mentioned above will make it more descriptive.

Thanks.

> > 
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09return n;
> > > +}
> > > +
> > > +static void build_quota_data(struct quota *quota, uint32_t *val, cha=
r *name)
> > 
> > I guess we will need a leap of faith to trust that `val` is big enough,
> > after finding out that it's actually an output of multiple values, and
> > not an input of a single value.
> 
> That's what get_quota_size() is calculating.

Right. I'm probably just looking at function as been independent of the
rest of the program a bit too much.

> > 
> > And `name` seems to also be an output, and this is actually impossible
> > to guess from the prototype.
> 
> True. What about names?

`names` would be better here, indeed.

> > 
> > > +{
> > > +=09unsigned int q;
> > > +=09unsigned int n =3D 0;
> > > +
> > > +=09for (q =3D 0; q < ACC_N; q++) {
> > > +=09=09if (!quota_adm[q].name)
> > > +=09=09=09continue;
> > > +=09=09if (quota[q].val[Q_IDX_HARD] !=3D Q_VAL_DISABLED) {
> > > +=09=09=09val[n++] =3D quota[q].val[Q_IDX_HARD];
> > > +=09=09=09strcpy(name, quota_adm[q].name);
> > > +=09=09=09name +=3D strlen(name) + 1;
> > > +=09=09}
> > > +=09=09if (quota[q].val[Q_IDX_SOFT] !=3D Q_VAL_DISABLED) {
> > > +=09=09=09val[n++] =3D quota[q].val[Q_IDX_SOFT];
> > > +=09=09=09strcpy(name, "soft-");
> > > +=09=09=09strcpy(name + 5, quota_adm[q].name);
> > > +=09=09=09name +=3D strlen(name) + 1;
> > > +=09=09}
> > > +=09}
> > > +}
> > > +
> > > +static void parse_quota_data(const uint32_t *val, const char *name,
> > > +=09=09=09     unsigned int n, struct quota *quota)
> > > +{
> > > +=09unsigned int i, q, idx;
> > > +
> > > +=09for (i =3D 0; i < n; i++) {
> > > +=09=09if (!parse_quota_name(name, &q, &idx))
> > > +=09=09=09quota[q].val[idx] =3D val[i];
> > > +=09=09name +=3D strlen(name) + 1;
> > 
> > So for `val`, we have a size. But, we don't have a size for `name`, are
> > we sure that it's safe to keep reading past `NUL` characters ? Is the
> > size of name available somewhere?
> 
> Yes. get_quota_size() calculated that as well.
> 
> > 
> > > +=09}
> > > +}
> > > +
> > >   static int dump_state_domain(const void *k, void *v, void *arg)
> > >   {
> > >   =09struct domain *domain =3D v;
> > > @@ -2049,6 +2125,53 @@ void read_state_domain(const void *ctx, const =
void *state, unsigned int version)
> > >   =09=09domain->features =3D sd->features;
> > >   }
> > > +const char *dump_state_glb_quota(FILE *fp)
> > > +{
> > > +=09struct xs_state_record_header *head;
> > > +=09struct xs_state_glb_quota *glb;
> > > +=09void *record;
> > > +=09unsigned int n_quota;
> > > +=09unsigned int len =3D sizeof(*glb);
> > > +=09size_t ret;
> > > +
> > > +=09n_quota =3D get_quota_size(quotas, &len);
> > 
> > So, get_quota_size is actually an "add" the size to this variable, and
> > not "store" the size in this variable. That's not confusing at all.
> 
> Would it be better if len is renamed to names_len (both here and the
> parameter of get_quota_size())?

Do you mean adding a new variable `names_len`? And having get_quota_size
set it to 0 before calculating the size?

I would be ok also with adding `sizeof(*glb)` to len after calling
get_quota_size(), but still need to have get_quota_size() start counting
from 0.

> > 
> > > +=09len +=3D n_quota * sizeof(glb->quota_val[0]);
> > > +=09len =3D ROUNDUP(len, 3);
> > > +
> > > +=09record =3D talloc_size(NULL, len + sizeof(*head));
> > > +=09if (!record)
> > > +=09=09return "Dump global quota allocation error";
> > > +
> > > +=09head =3D record;
> > > +=09head->type =3D XS_STATE_TYPE_GLB_QUOTA;
> > > +=09head->length =3D len;
> > > +
> > > +=09glb =3D (struct xs_state_glb_quota *)(head + 1);
> > > +=09glb->n_dom_quota =3D n_quota;
> > > +=09glb->n_glob_quota =3D 0;
> > 
> > Shouldn't `n_quota` be assigned to `n_glob_quota` instead? We don't hav=
e
> > per-domain quota yet, and only have global quota, right?
> 
> We are applying all global quota values to the domains, so this is fine.
> 
> It isn't about where we store the quota (per domain or globally), but
> how the quota values are used.
> 
> It would be possible to have e.g. "total_memory" or "total_nodes" quota
> which would not apply to single domains, but to all of xenstore. Those
> would need to be counted by n_glob_quota.

Right, I think I figured that out only after seen the patch creating a
different record for per-domain quota. (And seen that these two field
were not changed in later patches). But thank for the explanation, and
the possible way that n_glob_quota could be used.

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



