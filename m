Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGBPM3HRcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:15:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426775769E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209749.1521663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viY35-0002x4-PZ; Wed, 21 Jan 2026 13:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209749.1521663; Wed, 21 Jan 2026 13:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viY35-0002vC-MH; Wed, 21 Jan 2026 13:15:03 +0000
Received: by outflank-mailman (input) for mailman id 1209749;
 Wed, 21 Jan 2026 13:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5jI=72=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1viY34-0002v5-5o
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:15:02 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ec5a011-f6cb-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 14:14:58 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1769001292609701.0291516613988;
 Wed, 21 Jan 2026 05:14:52 -0800 (PST)
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
X-Inumbo-ID: 2ec5a011-f6cb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769001295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M2yZL+1bpzKrs0V2Fz/Y16XnbdlmdquZ4u5jQF3ieN4G3gguEzobiZrG+OOi4es8K3UYPz4QsJZi7WO77B0U5MYAXjeIrhuQ/FxEqslqxlIAuql04UfxmWASCnhBtQGFyc7e4FMkumO5V4uMqDDizzMGlC63xBCn0hNrVFdL6mU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769001295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uns7QSNwfZ2z5ZOIiY2IgtVjluIMmOQ+/lgCVL/SR2s=; 
	b=PHiKR95QYygf4n9MGF4LTShg5fT2SY31QGxkEpfJITFDtJswzjGRxDZVKG0cSVoSEaLIUOPWEJjgiGDeTpocArdV/dqL34RLXSwaut3OIPncsXAPyanY+lPc4DMRSpi64S/10NkMutrHd48/qd42SZev42/DheZnCrl/wNMF0JU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769001295;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=uns7QSNwfZ2z5ZOIiY2IgtVjluIMmOQ+/lgCVL/SR2s=;
	b=f7feDF8b0178TjdrJ9Muxy8OhkGxf+vCon8SaHPSEGh8iVuQH42mFa0E5m1gDSRz
	6kizpSHtxUt/5k/6guj5xVsBOdIAZC4NGEt2N4mMX8si4pnPkH3K6hVIy10NDrq5bi0
	Ly6oJIqzMWxohkDMZfrnyIsHgRLNC8wbjTez/kKU=
Date: Wed, 21 Jan 2026 07:14:50 -0600
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH] flask: fix gcov build with gcc14+
User-Agent: Thunderbird for Android
In-Reply-To: <0e188989-9190-4f3b-9c45-f4e3d460daca@suse.com>
References: <875df90d-1d3a-416b-a958-3d3a31144f85@suse.com> <0e188989-9190-4f3b-9c45-f4e3d460daca@suse.com>
Message-ID: <DD50FA01-2162-4009-8D60-9F6D0DAD3C35@apertussolutions.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----MLLG3S4YYFTXRL55FX0UXOCNVBH9PH
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-1.68 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[apertussolutions.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,gnu.org:url];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 426775769E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

------MLLG3S4YYFTXRL55FX0UXOCNVBH9PH
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jan,=20

Apologies, I've been on travel for the last two weeks and I wasn't comfort=
able acking this with just a read of the diff=2E The thing that bothers me =
that I want to understand better is why only after the else does it worry a=
bout null terminated=2E Additionally, stepping back, a casual reader of the=
 code is going to wonder why only after some reads into the buffer does it =
need a null while others do not=2E I think most people would find that as a=
 red flag that an underlying issue is getting papers papered over=2E I will=
 be back from travel this weekend and I will sit down and review with more =
context=2E=20

V/r,
DPS=20

On January 19, 2026 8:50:02 AM CST, Jan Beulich <jbeulich@suse=2Ecom> wrot=
e:
>Daniel,
>
>On 08=2E01=2E2026 10:18, Jan Beulich wrote:
>> Gcc's "threading" of conditionals can lead to undue warnings, as report=
ed
>> in e=2Eg=2E https://gcc=2Egnu=2Eorg/bugzilla/show_bug=2Ecgi?id=3D116519=
 (no matter
>> that the overall situation is different there)=2E While my gcc15 compla=
ins
>> ("buf[2] may be used uninitialized in this function") about only two of
>> the three instances (not about the one in type_read()), adjust all thre=
e
>> to be on the safe side=2E
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
>
>any chance of an ack (or otherwise)?
>
>Thanks, Jan
>
>> ---
>> While auditing uses of next_entry(), I noticed POLICYDB_VERSION_ROLETRA=
NS
>> dependent ones in policydb_read(): How come the 4th slot isn't used at =
all
>> there (not even checked for being e=2Eg=2E zero, i=2Ee=2E holding no us=
eful data)?
>> Then again other instances can be found where data is read but outright
>> ignored=2E
>>=20
>> --- a/xen/xsm/flask/ss/policydb=2Ec
>> +++ b/xen/xsm/flask/ss/policydb=2Ec
>> @@ -1271,7 +1271,10 @@ static int cf_check role_read(struct pol
>>      if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
>>      else
>> +    {
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 2);
>> +        buf[2] =3D cpu_to_le32(0); /* gcc14 onwards */
>> +    }
>> =20
>>      if ( rc < 0 )
>>          goto bad;
>> @@ -1342,7 +1345,10 @@ static int cf_check type_read(struct pol
>>      if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 4);
>>      else
>> +    {
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
>> +        buf[3] =3D cpu_to_le32(0); /* gcc14 onwards */
>> +    }
>> =20
>>      if ( rc < 0 )
>>          goto bad;
>> @@ -1436,7 +1442,10 @@ static int cf_check user_read(struct pol
>>      if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
>>      else
>> +    {
>>          rc =3D next_entry(buf, fp, sizeof(buf[0]) * 2);
>> +        buf[2] =3D cpu_to_le32(0); /* gcc14 onwards */
>> +    }
>> =20
>>      if ( rc < 0 )
>>          goto bad;
>

------MLLG3S4YYFTXRL55FX0UXOCNVBH9PH
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Jan, <br><br>Apologies, I've bee=
n on travel for the last two weeks and I wasn't comfortable acking this wit=
h just a read of the diff=2E The thing that bothers me that I want to under=
stand better is why only after the else does it worry about null terminated=
=2E Additionally, stepping back, a casual reader of the code is going to wo=
nder why only after some reads into the buffer does it need a null while ot=
hers do not=2E I think most people would find that as a red flag that an un=
derlying issue is getting papers papered over=2E I will be back from travel=
 this weekend and I will sit down and review with more context=2E <br><br>V=
/r,<br>DPS </div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">On Ja=
nuary 19, 2026 8:50:02 AM CST, Jan Beulich &lt;jbeulich@suse=2Ecom&gt; wrot=
e:</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">Daniel,<br><br>On 08=2E01=2E2026 1=
0:18, Jan Beulich wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-le=
ft: 1ex;"><div dir=3D"auto">Gcc's "threading" of conditionals can lead to u=
ndue warnings, as reported<br>in e=2Eg=2E <a href=3D"https://gcc=2Egnu=2Eor=
g/bugzilla/show_bug=2Ecgi?id=3D116519">https://gcc=2Egnu=2Eorg/bugzilla/sho=
w_bug=2Ecgi?id=3D116519</a> (no matter<br>that the overall situation is dif=
ferent there)=2E While my gcc15 complains<br>("buf[2] may be used uninitial=
ized in this function") about only two of<br>the three instances (not about=
 the one in type_read()), adjust all three<br>to be on the safe side=2E<br>=
<br>Signed-off-by: Jan Beulich &lt;jbeulich@suse=2Ecom&gt;<br></div></block=
quote><div dir=3D"auto"><br>any chance of an ack (or otherwise)?<br><br>Tha=
nks, Jan<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0p=
t 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><div=
 dir=3D"auto"><hr>While auditing uses of next_entry(), I noticed POLICYDB_V=
ERSION_ROLETRANS<br>dependent ones in policydb_read(): How come the 4th slo=
t isn't used at all<br>there (not even checked for being e=2Eg=2E zero, i=
=2Ee=2E holding no useful data)?<br>Then again other instances can be found=
 where data is read but outright<br>ignored=2E<br><br>--- a/xen/xsm/flask/s=
s/policydb=2Ec<br>+++ b/xen/xsm/flask/ss/policydb=2Ec<br>@@ -1271,7 +1271,1=
0 @@ static int cf_check role_read(struct pol<br>     if ( ver &gt;=3D POLI=
CYDB_VERSION_BOUNDARY )<br>         rc =3D next_entry(buf, fp, sizeof(buf[0=
]) * 3);<br>     else<br>+    {<br>         rc =3D next_entry(buf, fp, size=
of(buf[0]) * 2);<br>+        buf[2] =3D cpu_to_le32(0); /* gcc14 onwards */=
<br>+    }<br> <br>     if ( rc &lt; 0 )<br>         goto bad;<br>@@ -1342,=
7 +1345,10 @@ static int cf_check type_read(struct pol<br>     if ( ver &gt=
;=3D POLICYDB_VERSION_BOUNDARY )<br>         rc =3D next_entry(buf, fp, siz=
eof(buf[0]) * 4);<br>     else<br>+    {<br>         rc =3D next_entry(buf,=
 fp, sizeof(buf[0]) * 3);<br>+        buf[3] =3D cpu_to_le32(0); /* gcc14 o=
nwards */<br>+    }<br> <br>     if ( rc &lt; 0 )<br>         goto bad;<br>=
@@ -1436,7 +1442,10 @@ static int cf_check user_read(struct pol<br>     if =
( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>         rc =3D next_entry(buf=
, fp, sizeof(buf[0]) * 3);<br>     else<br>+    {<br>         rc =3D next_e=
ntry(buf, fp, sizeof(buf[0]) * 2);<br>+        buf[2] =3D cpu_to_le32(0); /=
* gcc14 onwards */<br>+    }<br> <br>     if ( rc &lt; 0 )<br>         goto=
 bad;<br></div></blockquote><div dir=3D"auto"><br></div></pre></blockquote>=
</div></body></html>
------MLLG3S4YYFTXRL55FX0UXOCNVBH9PH--

