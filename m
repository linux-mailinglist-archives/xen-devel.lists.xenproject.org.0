Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562EF009
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 07:38:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLLPA-0002T5-Sr; Tue, 30 Apr 2019 05:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xnvC=TA=sina.com=hdanton@srs-us1.protection.inumbo.net>)
 id 1hLLMz-0002Pi-8e
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 05:31:57 +0000
X-Inumbo-ID: 424304b2-6b09-11e9-a134-33d201d1d3c3
Received: from mail3-167.sinamail.sina.com.cn (unknown [202.108.3.167])
 by us1-amaz-eas2.inumbo.com (Halon) with SMTP
 id 424304b2-6b09-11e9-a134-33d201d1d3c3;
 Tue, 30 Apr 2019 05:31:53 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([222.131.69.26])
 by sina.com with ESMTP
 id 5CC7DDC400007A6F; Tue, 30 Apr 2019 13:31:50 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 170313394052
MIME-Version: 1.0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Hillf Danton <hdanton@sina.com>
Date: Tue, 30 Apr 2019 13:31:46 +0800
Importance: normal
X-Priority: 3
X-Mailman-Approved-At: Tue, 30 Apr 2019 05:34:11 +0000
Subject: [Xen-devel] [patch 1/2] xen/arm: Free p2m entry if fail to add it
 to RB tree
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Stefano Stabellini <sstabellini@kernel.org>" <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="===============2639545842258205581=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-Id: <E1hLLPA-0002T5-Sr@lists.xenproject.org>


--===============2639545842258205581==
Content-Type: multipart/alternative;
	boundary="_253F6C7A-9E51-4DD6-A5AD-72DE243D1479_"


--_253F6C7A-9E51-4DD6-A5AD-72DE243D1479_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Release the newly allocated p2m entry if we detect a duplicate in the RB tr=
ee.

Cc: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Hillf Danton <hdanton@sina.com>
---

--- a/arch/arm/xen/p2m.c	2019-04-30 12:32:05.363768200 +0800
+++ b/arch/arm/xen/p2m.c	2019-04-30 12:41:29.774041800 +0800
@@ -156,6 +156,7 @@ bool __set_phys_to_machine_multi(unsigne
	rc =3D xen_add_phys_to_mach_entry(p2m_entry);
	if (rc < 0) {
		write_unlock_irqrestore(&p2m_lock, irqflags);
+		kfree(p2m_entry);
		return false;
	}
	write_unlock_irqrestore(&p2m_lock, irqflags);
--


--_253F6C7A-9E51-4DD6-A5AD-72DE243D1479_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN><div class=3DWordSection1><p class=3DM=
soNormal><span lang=3DEN-US>Release the newly allocated p2m entry if we det=
ect a duplicate in the RB tree.</span></p><p class=3DMsoNormal><span lang=
=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-U=
S>Cc: Stefano Stabellini &lt;sstabellini@kernel.org&gt;</span></p><p class=
=3DMsoNormal><span lang=3DEN-US>Signed-off-by: Hillf Danton &lt;hdanton@sin=
a.com&gt;</span></p><p class=3DMsoNormal><span lang=3DEN-US>---</span></p><=
p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>--- a/arch/arm/xen/p2m.c 2019-04-30 12:32:0=
5.363768200 +0800</span></p><p class=3DMsoNormal><span lang=3DEN-US>+++ b/a=
rch/arm/xen/p2m.c=C2=A0=C2=A0=C2=A0 2019-04-30 12:41:29.774041800 +0800</sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US>@@ -156,6 +156,7 @@ bool __s=
et_phys_to_machine_multi(unsigne</span></p><p class=3DMsoNormal><span lang=
=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D xen_add_phys_to_mach_e=
ntry(p2m_entry);</span></p><p class=3DMsoNormal><span lang=3DEN-US>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rc &lt; 0) {</span></p><p class=3DMsoNor=
mal><span lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 write_unlock_irqrestore(&amp;p2m_lock, irqflags);</sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(p2m_entry);</span></p><p class=3DMs=
oNormal><span lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return false;</span></p><p class=3DMsoNormal><span=
 lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span></p><p class=3DM=
soNormal><span lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlo=
ck_irqrestore(&amp;p2m_lock, irqflags);</span></p><p class=3DMsoNormal><spa=
n lang=3DEN-US>--</span><span lang=3DEN-US style=3D'font-size:12.0pt'><o:p>=
</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p><=
/span></p></div></body></html>=

--_253F6C7A-9E51-4DD6-A5AD-72DE243D1479_--




--===============2639545842258205581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2639545842258205581==--



