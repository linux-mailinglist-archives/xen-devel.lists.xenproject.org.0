Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B1B497E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:29:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA8pL-0001oJ-Fx; Tue, 17 Sep 2019 08:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=os7l=XM=amazon.de=prvs=156cae3ca=wipawel@srs-us1.protection.inumbo.net>)
 id 1iA8pK-0001o6-AG
 for xen-devel@lists.xen.org; Tue, 17 Sep 2019 08:27:10 +0000
X-Inumbo-ID: ef329e24-d924-11e9-9604-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef329e24-d924-11e9-9604-12813bfff9fa;
 Tue, 17 Sep 2019 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568708826; x=1600244826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=DUiI/ZIFtKW2M+6vv8dqbcOMSdYkfPxaNDFmuWpEVNI=;
 b=bPXFCTN4yosXSwQFw0DOSSdNu6b75IGJZ6JPjIMbbgshVv9ixS927+jf
 8Xy/tMgJBkUO/Z0NO/tCW96gCJLQvaT8Mt8Zf0wjMN7rSplqoJACvO2Wi
 zSIhJWHnslXeQUSlCN/yIA8bhY2Y+tnYbY8bLvy9Mq1vydHy+y6/t0M2K g=;
X-IronPort-AV: E=Sophos;i="5.64,515,1559520000"; 
 d="scan'208,217";a="415625079"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Sep 2019 08:27:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id C6539A283F; Tue, 17 Sep 2019 08:27:02 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:27:01 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:27:00 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 17 Sep 2019 08:27:00 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [PATCH v3 02/12] livepatch: Allow to override inter-modules
 buildid dependency
Thread-Index: AQHVbH5iod7scPDMWUS0xYtrrp51Bqcuh86AgAECjwA=
Date: Tue, 17 Sep 2019 08:27:00 +0000
Message-ID: <F77F272E-18F8-4BFC-A6B6-6999F8149884@amazon.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-3-wipawel@amazon.de>
 <559ee54f-c962-1f3f-8291-9b5a1a6f9591@citrix.com>
In-Reply-To: <559ee54f-c962-1f3f-8291-9b5a1a6f9591@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.196]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 02/12] livepatch: Allow to override
 inter-modules buildid dependency
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1773182903284956334=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1773182903284956334==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F77F272E18F84BFCA6B66999F8149884amazoncom_"

--_000_F77F272E18F84BFCA6B66999F8149884amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 16. Sep 2019, at 19:01, Ross Lagerwall <ross.lagerwall@citrix.com<mailto=
:ross.lagerwall@citrix.com>> wrote:

On 9/16/19 11:59 AM, Pawel Wieczorkiewicz wrote:
snip
+/*
+ * Parse user provided action flags.
+ * This function expects to only receive an array of input parameters bein=
g flags.
+ * Expected action is specified via idx paramater (index of flag_options[]=
).
+ */
+static int get_flags(int argc, char *argv[], unsigned int idx, uint64_t *f=
lags)
+{
+    int i, j;
+
+    if ( !flags || idx >=3D ARRAY_SIZE(flag_options) )
+        return -1;
+
+    *flags =3D 0;
+    for ( i =3D 0; i < argc; i++ )
+    {
+        for ( j =3D 0; j < ARRAY_SIZE(flag_options[idx]); j++ )
+        {
+            if ( !flag_options[idx][j].name )
+                goto error;
+
+            if ( !strcmp(flag_options[idx][j].name, argv[i]) )
+            {
+                *flags |=3D flag_options[idx][j].flag;
+                break;
+            }
+        }
+
+        if ( j =3D=3D ARRAY_SIZE(flag_options[idx]) )
+            goto error;
+    }
+
+    return 0;
+error:
+    fprintf(stderr, "Unsupported flag: %s.\n", argv[i]);
+    errno =3D EINVAL;
+    return errno;
+}

You return -1 above but +ve errno here. Please make it consistent.

Well, I understood from the code of the file (e.g. action_func()) that the =
-1 value indicates a unexpected runtime error (negative val).
Whereas, positive errno values are expected error to be dealt with.

So:
<0 - fatal errors
0 - ok
>0 - errors to be handled

Could you confirm please that I should make get_flags() return only positiv=
e errors?

Also, you don't need to set errno if returning the actual error.


Honestly, I just copied the code from get_name() and wanted to the get_flag=
s() to follow similar pattern.

(The error handling in this file looks fairly inconsistent anyway but let's=
 not make it worse.)

+
 /* The hypervisor timeout for the live patching operation is 30 msec,
  * but it could take some time for the operation to start, so wait twice
  * that period. */
@@ -291,8 +357,9 @@ int action_func(int argc, char *argv[], unsigned int id=
x)
     char name[XEN_LIVEPATCH_NAME_SIZE];
     int rc;
     xen_livepatch_status_t status;
+    uint64_t flags;
 -    if ( argc !=3D 1 )
+    if ( argc < 1 )
     {
         show_help();
         return -1;
@@ -301,7 +368,10 @@ int action_func(int argc, char *argv[], unsigned int i=
dx)
     if ( idx >=3D ARRAY_SIZE(action_options) )
         return -1;
 -    if ( get_name(argc, argv, name) )
+    if ( get_name(argc--, argv++, name) )
+        return EINVAL;
+
+    if ( get_flags(argc, argv, idx, &flags) )
         return EINVAL;
       /* Check initial status. */
@@ -332,7 +402,7 @@ int action_func(int argc, char *argv[], unsigned int id=
x)
     if ( action_options[idx].allow & status.state )
     {
         printf("%s %s... ", action_options[idx].verb, name);
-        rc =3D action_options[idx].function(xch, name, HYPERVISOR_TIMEOUT_=
NS);
+        rc =3D action_options[idx].function(xch, name, HYPERVISOR_TIMEOUT_=
NS, flags);
         if ( rc )
         {
             int saved_errno =3D errno;
@@ -394,17 +464,23 @@ int action_func(int argc, char *argv[], unsigned int =
idx)
   static int load_func(int argc, char *argv[])
 {
-    int rc;
-    char *new_argv[2];
-    char *path, *name, *lastdot;
+    int i, rc =3D ENOMEM;
+    char *upload_argv[2];
+    char **apply_argv, *path, *name, *lastdot;
 -    if ( argc !=3D 1 )
+    if ( argc < 1 )
     {
         show_help();
         return -1;
     }
+
+    /* apply action has <id> [flags] input requirement, which must be cons=
tructed */
+    apply_argv =3D (char **) malloc(argc * sizeof(*apply_argv));
+    if ( !apply_argv )
+        return rc;
+
     /* <file> */
-    new_argv[1] =3D argv[0];
+    upload_argv[1] =3D argv[0];
       /* Synthesize the <id> */
     path =3D strdup(argv[0]);
@@ -413,16 +489,23 @@ static int load_func(int argc, char *argv[])
     lastdot =3D strrchr(name, '.');
     if ( lastdot !=3D NULL )
         *lastdot =3D '\0';
-    new_argv[0] =3D name;
+    upload_argv[0] =3D name;
+    apply_argv[0] =3D name;
 -    rc =3D upload_func(2 /* <id> <file> */, new_argv);
+    /* Fill in all user provided flags */
+    for ( i =3D 0; i < argc - 1; i++ )
+        apply_argv[i + 1] =3D argv[i + 1];

Wouldn't this make the loop body simpler?  i =3D 1; i < argc;


ACK. It would indeed.

Or alternatively, just a straight memcpy().

--
Ross Lagerwall

Best Regards,
Pawel Wieczorkiewicz



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_F77F272E18F84BFCA6B66999F8149884amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <C4D61DA5182E0B4D8A9A02F16679B31F@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 16. Sep 2019, at 19:01, Ross Lagerwall &lt;<a href=3D"ma=
ilto:ross.lagerwall@citrix.com" class=3D"">ross.lagerwall@citrix.com</a>&gt=
; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">On 9/16/19 11:59 AM, Pawel Wieczorkiewicz wrote:<br class=
=3D"">
snip<br class=3D"">
<blockquote type=3D"cite" class=3D"">&#43;/*<br class=3D"">
&#43; * Parse user provided action flags.<br class=3D"">
&#43; * This function expects to only receive an array of input parameters =
being flags.<br class=3D"">
&#43; * Expected action is specified via idx paramater (index of flag_optio=
ns[]).<br class=3D"">
&#43; */<br class=3D"">
&#43;static int get_flags(int argc, char *argv[], unsigned int idx, uint64_=
t *flags)<br class=3D"">
&#43;{<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;int i, j;<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( !flags || idx &gt;=3D ARRAY_SIZE(flag_options)=
 )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;*flags =3D 0;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;for ( i =3D 0; i &lt; argc; i&#43;&#43; )<br class=
=3D"">
&#43; &nbsp;&nbsp;&nbsp;{<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for ( j =3D 0; j &lt; ARRAY=
_SIZE(flag_options[idx]); j&#43;&#43; )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( !flag_options[idx][j].name )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;goto error;<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( !strcmp(flag_options[idx][j].name, argv[i]) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<b=
r class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;*flags |=3D flag_options[idx][j].flag;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;break;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<b=
r class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( j =3D=3D ARRAY_SIZE(fl=
ag_options[idx]) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;got=
o error;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;}<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;return 0;<br class=3D"">
&#43;error:<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;fprintf(stderr, &quot;Unsupported flag: %s.\n&quot;=
, argv[i]);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;errno =3D EINVAL;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;return errno;<br class=3D"">
&#43;}<br class=3D"">
</blockquote>
<br class=3D"">
You return -1 above but &#43;ve errno here. Please make it consistent.<br c=
lass=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Well, I understood from the code of the file (e.g. action_func()) that=
 the -1 value indicates a unexpected runtime error (negative val).</div>
<div>Whereas, positive errno values are expected error to be dealt with.</d=
iv>
<div><br class=3D"">
</div>
<div>So:</div>
<div>&lt;0 - fatal errors</div>
<div>0 - ok</div>
<div>&gt;0 - errors to be handled</div>
<div><br class=3D"">
</div>
<div>Could you confirm please that I should make get_flags() return only po=
sitive errors?</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">Also, you don't need to set errno if returning the actual e=
rror.<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<br class=3D"">
<div>Honestly, I just copied the code from get_name() and wanted to the get=
_flags() to follow similar pattern.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">(The error handling in this file looks fairly inconsistent =
anyway but let's not make it worse.)<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">
<blockquote type=3D"cite" class=3D"">&#43;<br class=3D"">
&nbsp;/* The hypervisor timeout for the live patching operation is 30 msec,=
<br class=3D"">
&nbsp;&nbsp;* but it could take some time for the operation to start, so wa=
it twice<br class=3D"">
&nbsp;&nbsp;* that period. */<br class=3D"">
@@ -291,8 &#43;357,9 @@ int action_func(int argc, char *argv[], unsigned in=
t idx)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char name[XEN_LIVEPATCH_NAME_SIZE];<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int rc;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xen_livepatch_status_t status;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;uint64_t flags;<br class=3D"">
&nbsp;- &nbsp;&nbsp;&nbsp;if ( argc !=3D 1 )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( argc &lt; 1 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;show_help();<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br class=
=3D"">
@@ -301,7 &#43;368,10 @@ int action_func(int argc, char *argv[], unsigned i=
nt idx)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( idx &gt;=3D ARRAY_SIZE(action_options) )=
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br class=
=3D"">
&nbsp;- &nbsp;&nbsp;&nbsp;if ( get_name(argc, argv, name) )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( get_name(argc--, argv&#43;&#43;, name) )<br cl=
ass=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return EINVAL;<br class=3D"=
">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( get_flags(argc, argv, idx, &amp;flags) )<br cl=
ass=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return EINVAL;<br cla=
ss=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Check initial status. */<br cl=
ass=3D"">
@@ -332,7 &#43;402,7 @@ int action_func(int argc, char *argv[], unsigned in=
t idx)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( action_options[idx].allow &amp; status.s=
tate )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf(&quot;%s %s...=
 &quot;, action_options[idx].verb, name);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =3D action_options[idx].func=
tion(xch, name, HYPERVISOR_TIMEOUT_NS);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =3D action_options[idx].=
function(xch, name, HYPERVISOR_TIMEOUT_NS, flags);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( rc )<br class=3D=
"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;int saved_errno =3D errno;<br class=3D"">
@@ -394,17 &#43;464,23 @@ int action_func(int argc, char *argv[], unsigned =
int idx)<br class=3D"">
&nbsp;&nbsp;&nbsp;static int load_func(int argc, char *argv[])<br class=3D"=
">
&nbsp;{<br class=3D"">
- &nbsp;&nbsp;&nbsp;int rc;<br class=3D"">
- &nbsp;&nbsp;&nbsp;char *new_argv[2];<br class=3D"">
- &nbsp;&nbsp;&nbsp;char *path, *name, *lastdot;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;int i, rc =3D ENOMEM;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;char *upload_argv[2];<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;char **apply_argv, *path, *name, *lastdot;<br class=
=3D"">
&nbsp;- &nbsp;&nbsp;&nbsp;if ( argc !=3D 1 )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( argc &lt; 1 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;show_help();<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -1;<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
&#43;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;/* apply action has &lt;id&gt; [flags] input requir=
ement, which must be constructed */<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;apply_argv =3D (char **) malloc(argc * sizeof(*appl=
y_argv));<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;if ( !apply_argv )<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return rc;<br class=3D"">
&#43;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* &lt;file&gt; */<br class=3D"">
- &nbsp;&nbsp;&nbsp;new_argv[1] =3D argv[0];<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;upload_argv[1] =3D argv[0];<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Synthesize the &lt;id&gt; */<b=
r class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path =3D strdup(argv[0]);<br class=3D"">
@@ -413,16 &#43;489,23 @@ static int load_func(int argc, char *argv[])<br c=
lass=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lastdot =3D strrchr(name, '.');<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( lastdot !=3D NULL )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*lastdot =3D '\0';<br=
 class=3D"">
- &nbsp;&nbsp;&nbsp;new_argv[0] =3D name;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;upload_argv[0] =3D name;<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;apply_argv[0] =3D name;<br class=3D"">
&nbsp;- &nbsp;&nbsp;&nbsp;rc =3D upload_func(2 /* &lt;id&gt; &lt;file&gt; *=
/, new_argv);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;/* Fill in all user provided flags */<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;for ( i =3D 0; i &lt; argc - 1; i&#43;&#43; )<br cl=
ass=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;apply_argv[i &#43; 1] =3D a=
rgv[i &#43; 1];<br class=3D"">
</blockquote>
<br class=3D"">
Wouldn't this make the loop body simpler? &nbsp;i =3D 1; i &lt; argc;<br cl=
ass=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>ACK. It would indeed.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">Or alternatively, just a straight memcpy().<br class=3D"">
<br class=3D"">
-- <br class=3D"">
Ross Lagerwall<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;">
Best Regards,<br class=3D"">
Pawel Wieczorkiewicz</div>
</div>
</div>
<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_F77F272E18F84BFCA6B66999F8149884amazoncom_--



--===============1773182903284956334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1773182903284956334==--


