Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04301E281D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 19:14:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdd8t-0007uU-AD; Tue, 26 May 2020 17:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mv6+=7I=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1jdd8r-0007uP-Ol
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 17:13:29 +0000
X-Inumbo-ID: 36e8ca98-9f74-11ea-81bc-bc764e2007e4
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36e8ca98-9f74-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 17:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1590513205; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ccXqLQcH5jzsedUplzrBXFOK4mUKY54J4IyDkw1wKYOr40qP1AntXrIOit/sv3J92No1B07P9TX9b+f4k6Ar8Cx2rkuum3PBAmSoq4DmNX5vq4ZEZC3nukGtHJUd3RumnZeFCBx+nomW85TfegXYMoZlEjqvORRzZFnVyVC1vtc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1590513205; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=FVTrQ7tdhD4ExqOEnrw+beAro04cuJgyxbyvs+1v9Tw=; 
 b=bh6vbVXbaFSGjqt3Z+vuj7xjsU4n3zVGSCTfX8MD7FplpwHAAWnrX+04BVUK8D8/Mvvz5o/X/l/Ow73gdUspCgUWxjVjDRKQvhDeplUUpvvIrDxnLVaIXjhZ+76WLVQP5LcS6tZY7SqB6P0gFFxUZnhyDR68EoArhdRb4EFX06g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=apertussolutions.com;
 spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
 dmarc=pass header.from=<dpsmith@apertussolutions.com>
 header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590513205; 
 s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 bh=FVTrQ7tdhD4ExqOEnrw+beAro04cuJgyxbyvs+1v9Tw=;
 b=r/Y1yyZlEwXm38ScnyWe0tg6j9s2mLTbzFRk3KCQElpbG4KldnjjrGxIZ2RCVhGP
 shg1Db4ZlAcpNdiOL9Qn31QYske67cqrM+nADOW9nNA0unKAwSx04Zb6PAIjt8vB+Bx
 wJQFoU7+/qs3TOYrxnIOo50JDQbCvLskjfogjih4=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1590513199327898.1113379833491;
 Tue, 26 May 2020 10:13:19 -0700 (PDT)
Date: Tue, 26 May 2020 13:13:19 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Message-Id: <17251f968dd.b28c8ebe731955.2247348003729398828@apertussolutions.com>
In-Reply-To: 
Subject: [BUG] PVH ACPI XSDT table construction
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2340908_1359952992.1590513199325"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

------=_Part_2340908_1359952992.1590513199325
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings,



I was reviewing the ACPI construction for PVH and discovered what I believe=
 is a flaw in the logic for selecting the XSDT tables. The current logic is=
,



static bool __init pvh_acpi_xsdt_table_allowed(const char *sig,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long address,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size)

{

=C2=A0=C2=A0=C2=A0 /*

=C2=A0=C2=A0=C2=A0=C2=A0 * DSDT and FACS are pointed to from FADT and thus =
don't belong

=C2=A0=C2=A0=C2=A0=C2=A0 * in XSDT.

=C2=A0=C2=A0=C2=A0=C2=A0 */

=C2=A0=C2=A0=C2=A0 return (pvh_acpi_table_allowed(sig, address, size) &&

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncmp(=
sig, ACPI_SIG_DSDT, ACPI_NAME_SIZE) &&

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncmp(=
sig, ACPI_SIG_FACS, ACPI_NAME_SIZE));

}



Unless I am mistaken, the boolean logic in the return statement will always=
 return false resulting in an empty XSDT table. I believe based on the comm=
ent what was intended here was,



=C2=A0=C2=A0=C2=A0 return (pvh_acpi_table_allowed(sig, address, size) &&

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(strncmp(sig, ACPI_SIG_DSDT, ACP=
I_NAME_SIZE) ||

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strncmp(sig, ACPI_SIG_FACS=
, ACPI_NAME_SIZE)));



Thanks!


V/r,

Daniel P. Smith

Apertus Solutions, LLC
------=_Part_2340908_1359952992.1590513199325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Greetings,<br></div><div><br></div><div>I was revi=
ewing the ACPI construction for PVH and discovered what I believe is a flaw=
 in the logic for selecting the XSDT tables. The current logic is,<br></div=
><div><br></div><div>static bool __init pvh_acpi_xsdt_table_allowed(const c=
har *sig,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 unsigned long address,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; unsigned long size)<br></div><div>{<br></div><div>&nbsp;&nbs=
p;&nbsp; /*<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp; * DSDT and FACS are poin=
ted to from FADT and thus don't belong<br></div><div>&nbsp;&nbsp;&nbsp;&nbs=
p; * in XSDT.<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp; */<br></div><div>&nbsp=
;&nbsp;&nbsp; return (pvh_acpi_table_allowed(sig, address, size) &amp;&amp;=
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; strncmp(sig, ACPI_SIG_DSDT, ACPI_NAME_SIZE) &amp;&amp;<br></div><div=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strncmp=
(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE));<br></div><div>}<br></div><div><br></=
div><div>Unless I am mistaken, the boolean logic in the return statement wi=
ll always return false resulting in an empty XSDT table. I believe based on=
 the comment what was intended here was,<br></div><div><br></div><div>&nbsp=
;&nbsp;&nbsp; return (pvh_acpi_table_allowed(sig, address, size) &amp;&amp;=
<br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; !(strncmp(sig, ACP=
I_SIG_DSDT, ACPI_NAME_SIZE) ||<br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; strncmp(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE)));<br></div>=
<div><br></div><div>Thanks!</div><div><br></div><div id=3D"" data-zbluepenc=
il-ignore=3D"true"><div>V/r,<br></div><div>Daniel P. Smith<br></div><div>Ap=
ertus Solutions, LLC<br></div></div><div><br></div><div><br></div></div><br=
></body></html>
------=_Part_2340908_1359952992.1590513199325--


