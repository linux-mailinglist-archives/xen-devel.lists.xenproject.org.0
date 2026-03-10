Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIEKLP0lsGnYgQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 15:09:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877F25165B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 15:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250146.1547630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxkw-0003Bf-Lt; Tue, 10 Mar 2026 14:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250146.1547630; Tue, 10 Mar 2026 14:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxkw-0003AE-Iy; Tue, 10 Mar 2026 14:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1250146;
 Tue, 10 Mar 2026 13:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=df76=BL=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 1vzxc0-0001jj-N6
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 13:59:04 +0000
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4af57da7-1c89-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 14:59:02 +0100 (CET)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-6003c120943so6639439137.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 06:59:00 -0700 (PDT)
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
X-Inumbo-ID: 4af57da7-1c89-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: In-Reply-To: References: MIME-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1773151141;
 bh=E8wOigURf3csG2yq02yND2Sc/5WalRx/lbNH4MbDwRw=;
 b=AejbEsofOMMyMmMS0yYvZBls1/15GBRvpae7SNq3R7NC/aPZ9vHAJyNEXcG/w4SO2UHVegsTg
 4YhN9N07/k/5SBmyeCeoY2cy5D+O31HDDuZ5qr7IBQVckNAtZGLaXojPQzqV7gQdck4cuIAS/iQ
 1b8bakKlwBk2kPPxSTGwCb35hOYh38Mp+nW4G8a+TIOt4gAIw/a8+Ueby4oaQNZwAEy5z7/dEPd
 2Cs80xEGdMEyg+6EUAO2ACoFfMJ1lcidh/zydZ3nX25eryQlrqy0Vv0BFsK6C3HRFWvUdQiImiW
 smBBjypw88s/pQhEq9I+8+JyrkRvAg2fgtgm2jlwJ+qw==
X-Forward-Email-ID: 69b023a4d3315ad1d148bf1c
X-Forward-Email-Sender: rfc822; enr0n@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.49
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Gm-Message-State: AOJu0YxHwLYLqq+FLoZyMHTcfSPQApZh1eirrwj3uU/WDvLxRBHFnPCn
	9fyTM/xZWoJcpWVqZoWX32xWn8FmlZRrGGgPA+AyzMKnD9p7QX6LR7b83cb/ka6ozFaVMXBczZB
	lzBrmbWcuKiP4YZ9Kj9AptO47cJPSRO1waCSLWOvvVfYG2YKc5uaxZ3sg6khooSoYfIBQWpGTfP
	ZO66oWZ6GJOm6OEBej4ivMYUhqkXg0xY6oe7bQLyO+erk8a1wKHvPPxhlcbDA=
X-Gm-Gg: ATEYQzyp2Kk6teQxfX04cvWd6sQhIIbz24X2nNQkFQJ1B6lStVjBThiMwVm6+qRMOld
	czwLbM1pH2foswcNy/tq8VeBt9R2k6e4Ga+vk9oNQCQg6r1XnueXZFAn7rWbQqToATABCvY4zbE
	L1unlCZf+5cch8M26APqZM6X8QtN5YihP3OUH8iNgghc6vG+VbYpnZmyglJ4AdWA5FjL74Z9uJi
	FVR
X-Received: by 2002:a05:6102:292a:b0:5ef:6550:e9f0 with SMTP id ada2fe7eead31-5ffe635a38fmr6893836137.36.1773151138280;
        Tue, 10 Mar 2026 06:58:58 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:5ef:6550:e9f0 with SMTP id
 ada2fe7eead31-5ffe635a38fmr6893824137.36.1773151137997; Tue, 10 Mar 2026
 06:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-9-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-9-jgross@suse.com>
From: Nick Rosbrook <enr0n@ubuntu.com>
Date: Tue, 10 Mar 2026 09:58:47 -0400
X-Gmail-Original-Message-ID: <CAEN5XSGxrObB-JcWGCUFLf5kBmqkQv_=MyTnKa1A6oCJdm-f_A@mail.gmail.com>
X-Gm-Features: AaiRm53qgMAlPJhzUrnE_Zj7Ytw_vbgbJ_PVVbxIhcKkx9lbTlUItY5sR8f6mRg
Message-ID: <CAEN5XSGxrObB-JcWGCUFLf5kBmqkQv_=MyTnKa1A6oCJdm-f_A@mail.gmail.com>
Subject: Re: [PATCH 08/11] tools/libxl: add functions for retrieving and
 setting xenstore quota
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <gwd@xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0877F25165B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:gwd@xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,x.name:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 8:52=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add some functions allowing to retrieve and set Xenstore quota (either
> global or domain specific).
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  78 ++++++++++++++++++++
>  tools/golang/xenlight/types.gen.go   |   9 +++
>  tools/include/libxl.h                |  20 ++++++
>  tools/libs/light/Makefile            |   1 +
>  tools/libs/light/libxl_types.idl     |   9 +++
>  tools/libs/light/libxl_xsquota.c     | 102 +++++++++++++++++++++++++++
>  6 files changed, 219 insertions(+)
>  create mode 100644 tools/libs/light/libxl_xsquota.c
>
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index 8909fe8a1b..6c9af904c5 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -998,6 +998,84 @@ xc.policy =3D C.libxl_rdm_reserve_policy(x.Policy)
>   return nil
>   }
>
> +// NewXsQuotaItem returns an instance of XsQuotaItem initialized with de=
faults.
> +func NewXsQuotaItem() (*XsQuotaItem, error) {
> +var (
> +x XsQuotaItem
> +xc C.libxl_xs_quota_item)
> +
> +C.libxl_xs_quota_item_init(&xc)
> +defer C.libxl_xs_quota_item_dispose(&xc)
> +
> +if err :=3D x.fromC(&xc); err !=3D nil {
> +return nil, err }
> +
> +return &x, nil}
> +
> +func (x *XsQuotaItem) fromC(xc *C.libxl_xs_quota_item) error {
> + x.Name =3D C.GoString(xc.name)
> +x.Val =3D uint32(xc.val)
> +
> + return nil}
> +
> +func (x *XsQuotaItem) toC(xc *C.libxl_xs_quota_item) (err error){defer f=
unc(){
> +if err !=3D nil{
> +C.libxl_xs_quota_item_dispose(xc)}
> +}()
> +
> +if x.Name !=3D "" {
> +xc.name =3D C.CString(x.Name)}
> +xc.val =3D C.uint32_t(x.Val)
> +
> + return nil
> + }
> +
> +// NewXsQuotaSet returns an instance of XsQuotaSet initialized with defa=
ults.
> +func NewXsQuotaSet() (*XsQuotaSet, error) {
> +var (
> +x XsQuotaSet
> +xc C.libxl_xs_quota_set)
> +
> +C.libxl_xs_quota_set_init(&xc)
> +defer C.libxl_xs_quota_set_dispose(&xc)
> +
> +if err :=3D x.fromC(&xc); err !=3D nil {
> +return nil, err }
> +
> +return &x, nil}
> +
> +func (x *XsQuotaSet) fromC(xc *C.libxl_xs_quota_set) error {
> + x.Quota =3D nil
> +if n :=3D int(xc.num_quota); n > 0 {
> +cQuota :=3D (*[1<<28]C.libxl_xs_quota_item)(unsafe.Pointer(xc.quota))[:n=
:n]
> +x.Quota =3D make([]XsQuotaItem, n)
> +for i, v :=3D range cQuota {
> +if err :=3D x.Quota[i].fromC(&v); err !=3D nil {
> +return fmt.Errorf("converting field Quota: %v", err) }
> +}
> +}
> +
> + return nil}
> +
> +func (x *XsQuotaSet) toC(xc *C.libxl_xs_quota_set) (err error){defer fun=
c(){
> +if err !=3D nil{
> +C.libxl_xs_quota_set_dispose(xc)}
> +}()
> +
> +if numQuota :=3D len(x.Quota); numQuota > 0 {
> +xc.quota =3D (*C.libxl_xs_quota_item)(C.malloc(C.ulong(numQuota)*C.sizeo=
f_libxl_xs_quota_item))
> +xc.num_quota =3D C.int(numQuota)
> +cQuota :=3D (*[1<<28]C.libxl_xs_quota_item)(unsafe.Pointer(xc.quota))[:n=
umQuota:numQuota]
> +for i,v :=3D range x.Quota {
> +if err :=3D v.toC(&cQuota[i]); err !=3D nil {
> +return fmt.Errorf("converting field Quota: %v", err)
> +}
> +}
> +}
> +
> + return nil
> + }
> +
>  // NewDomainBuildInfo returns an instance of DomainBuildInfo initialized=
 with defaults.
>  func NewDomainBuildInfo(dtype DomainType) (*DomainBuildInfo, error) {
>  var (
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index ab9d4ca7b4..5393277190 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -543,6 +543,15 @@ Altp2MModeExternal Altp2MMode =3D 2
>  Altp2MModeLimited Altp2MMode =3D 3
>  )
>
> +type XsQuotaItem struct {
> +Name string
> +Val uint32
> +}
> +
> +type XsQuotaSet struct {
> +Quota []XsQuotaItem
> +}
> +
>  type DomainBuildInfo struct {
>  MaxVcpus int
>  AvailVcpus Bitmap

For the golang stuff:

Acked-by: Nick Rosbrook <enr0n@ubuntu.com

