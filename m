Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CDAFEBAD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038274.1410771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVfk-0003x8-0G; Wed, 09 Jul 2025 14:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038274.1410771; Wed, 09 Jul 2025 14:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVfj-0003u7-Sl; Wed, 09 Jul 2025 14:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1038274;
 Wed, 09 Jul 2025 14:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3n3b=ZW=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1uZVfi-0003tz-5v
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:21:18 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on060a.outbound.protection.office365.us
 [2001:489a:2202:d::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5126971-5ccf-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 16:21:11 +0200 (CEST)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by BN0P110MB1291.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:182::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 14:21:04 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%5]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 14:21:04 +0000
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
X-Inumbo-ID: f5126971-5ccf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=0OVeN1MT621sl5k+u71wr/vKgnIZnvh6MbnivbWUUimjl/pvfIyI2xA+q0XgCvNeyVZP76CuixCRFkmnSaGX/+qrxyJ2QfgB4cyBZKyryDyfUxWMbGnTVbzyko08qlC9JWhowhLqPEYLag3+A7LPp/KzjUiCqxuYWRy2dU6MxALm01hifPRxjyTx19otFWomZ3Ad0y+5VagSbSU+/emz+PApbVRAVEgeL+J3+LvRBy9LDBdklZkbnWLzNE0aKiJYoQAayMJa2zQoaS3UblDCEE7JaOl+WbStrQoZAtFgovBD+7k0GP/lUIrBLwtnDUvofsgNQzwWxh/80bHMuZ48aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKLWcxx8tlOhU5WEzntn9cWtqMId0tgkg5G4CI3do38=;
 b=jMulVHSnAkt+ZN4UdARXNiTlh5iy+d/FNTmg4Fw9ntMFeFyKW3RVeyXrvfNFMOFf9cqmVhbveOTzq9kdVvORx9w/rpDN6T3bBZMiiaVRTlXQhFLaSSo3wL2HxLP8tgasU2ve3nRrHcOwSs4zpbFY5lp2EmgqCSwER6mvGOtI2jyE8AFIkKFqBg+fAuny0ftH8ikYGaovP7KCL8ffa4Cpyc9eJ/ISqg+6vsUUQnRDLwujflA3vxIMoSE7DAxpmEluhSKFcqVOMXjp4qmTVt8fio71Qxj1/4DTGcXm8ZmANQWw5+ETE8bj2E9TeS7jd0iHLm3VdU41aHMSdQwRbLd5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKLWcxx8tlOhU5WEzntn9cWtqMId0tgkg5G4CI3do38=;
 b=TkGYWlJFMFTtVu1xkYiZS+lr3qYD/qsBv9FpucQwCHzUEvDs3Rkb0vLE6sgacTSCdcvd8ezqBYlXpn7Q1/TpOCufUeSCRbrexVjXVMML3wOpheqiB+OnBCVxOleYKBWS1LTl7SMPwt2RPU5auygabWTBRs+dZ8TYyVw1gxFC2LgVJa+n+jQ6ap7hz7NT8cc+Kt+eWOSoCNv5RJYMu4z+NMtBv8EesNSu0d89lmbHpydpx3s588KwLmrwiR/fN1X47DMIkKZZIdrI7A2dWqHC8tqEXIO5umedfAPvbXvSN/ooq/OWbluGPGW8tXK97QiWRnYoh/5sAMSCiySKTZxRFA==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>, "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>, "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>, Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9A
Date: Wed, 9 Jul 2025 14:21:03 +0000
Message-ID:
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|BN0P110MB1291:EE_
x-ms-office365-filtering-correlation-id: 61d4d6a2-36f1-48c5-f5bd-08ddbef3d672
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?q5YGHtWPtqGBuaIXQDsepEHXugNjWrhs5Mgd8ZD+HLTtaIssR/8JqaFRwCaB?=
 =?us-ascii?Q?PDkG2HHunCiBB6mqRuWmkCLuplpHAxGoz5N92HieeGmPbk+lnYdvGJ2lw8qC?=
 =?us-ascii?Q?iaO3jr/idCgqpypiYmJyCVp+BO0UtsS6jWXEmCxqq7UhJXhMHkTjZp+3WuRC?=
 =?us-ascii?Q?63atkv7gRMh/v97XrkeudPXQsJAzlrToEz1r7c8tgUPCUJSS5ZhsQXeRAGcJ?=
 =?us-ascii?Q?ieijqtNvpGhNIvjc/8LiIK++7B0SgokdnzGBisUW9neWYSHYjLbXNYx2qbsx?=
 =?us-ascii?Q?gfSbffanC2ImT+1H/sBvusD4yYDWxpQbA8ijYvYno1mYnXUhcXArHLrNrjoM?=
 =?us-ascii?Q?e1thTiTtHXJv1DTONtU9wv9ruHHhs6wtBSHnCeCU0pyGiAceWY+6XJ0TQ1w2?=
 =?us-ascii?Q?4RNiRqlVf7yryOp1Guahdo3lvDlNK9treBDivpTy0A9FhNg4/2ni0rw5zGMA?=
 =?us-ascii?Q?z9QZoOi2wdnhjheNpAMNxOXDxG8KXc9ykuoAA/NkmnZgSCokZE53St5hwadL?=
 =?us-ascii?Q?a2KtoAB/p7fFMNzgRJodJX3VTYvrFO8Y71Qcmsv+A4uml2WKp5jhD6+kh1Pd?=
 =?us-ascii?Q?28NLJcOS0RGMOYCzrpj5H4KQ4kJ5e0N4qIyT5CdXpejjx5if5Z3CtfkclmvJ?=
 =?us-ascii?Q?w4TTwwBhyx42uMPPDvZq8z18eywzAD5fKYLCbtNWrQE6kybOP+cHN/xrwo6i?=
 =?us-ascii?Q?eFt2775xxk8TPxKtc1p8a6ewPQR0a99CDdDf59kcyv+W/5PHupzOukFFkw9o?=
 =?us-ascii?Q?CeZta4S+16JM82GH8dSNYBTLUcFHDWG4UxX7LO+kFbDFOYCGAOi9daybh43u?=
 =?us-ascii?Q?r/DNutQavYwf+xSFTqzljWXNyePfbHG+XCgGAEDu4qJhuz0wZ4JSCHsT9z9l?=
 =?us-ascii?Q?be3GK28JSQ4ZR1GXqW4h5Q8qBJydHKXfQWyNv5KORhcSp5AOyBPdiQY1CoUt?=
 =?us-ascii?Q?u8pSEjzSM7sIRpzSA9f0Qd3pQ2LeOrqVzGuHwv1geU7gy04MDE77OihR9IPZ?=
 =?us-ascii?Q?HkzI3QNOCeQBcHnt9q2m1V3MTvbnucyVCBrrAnk0PkjrGrlUFTSuBQ1cLfhw?=
 =?us-ascii?Q?yJuKDg1BBtASwLpp78QRoilVyGE82eitLA3J00j296OYl0CcH0z3Thy9+D+H?=
 =?us-ascii?Q?xJfP8EnBq9PhA2n4OCyVKxkzttF6s6zm7otjJgZSd9xfmGe+Bp1RuLHmi9O2?=
 =?us-ascii?Q?F8aLDaqKKfEGiDgb6ljLshPD7ORgMF2sMZzyIhmsHLhiYfkKEpvdTNvqw/F6?=
 =?us-ascii?Q?23oNETnnYG+J/5Ua6ZMpT1OvIvi4wSjZ8Ib0+bVF1CwIvitfV4daaVCkrilg?=
 =?us-ascii?Q?pyLJ/9swEpdKVFvHkqEb4zgFhxr0rPifqy3YDcClGy3lzvxmf/n/duVvK89/?=
 =?us-ascii?Q?Ohc/PLplSfBo1ihWxc9wmK3K6MZrR3DnIR/EPXLLyMfPmazrTvqnKe1m1Ja4?=
 =?us-ascii?Q?HnPDaac6MBGV1jn1PoQP6tdY0KyCJLsogdSxHI4T8MfxUF635zA98w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z70hpCANYbGJbzwJ/cMtD/R8piuGTZnA/1AiwRiYpr6h/SiR1jLjPFctHslZ?=
 =?us-ascii?Q?/g9g3oo+r8RqaZafdnuVc6A1oXAL0NYRyunf162QFdJPSg7jjL2SiuIgXB73?=
 =?us-ascii?Q?Ww2HGTISvTZI6hY0vignfAxDpx7L8F55vZwWwV/dHTdeTGxpt3eeUQ3tF/G6?=
 =?us-ascii?Q?n66ife7qJE0G1Tp69rhWiy+lTHaRICFcS56hDp8nwUK6aho/FUQslthoW6kR?=
 =?us-ascii?Q?NULLkEsFcZSumuq2itklLp/UYG1zTffwue0lq7feWEMYxrQeGe22fIyFWvZv?=
 =?us-ascii?Q?NkmsVJXfIZKsiJjbTB5JozllqZEQQwcjp0jIO2/czPglXxGlPWp89G3uTd6M?=
 =?us-ascii?Q?XQHleONwPD1m/A9dI63WrE32MM0qvD+zRCuyFKZ6zwdYZC+pTfwrahdnBepf?=
 =?us-ascii?Q?tj7RCs6/8nfdrpILe/y8EIJBAyBOqAHBtbgSmRiOwRiQ+2H06etLluUddUSR?=
 =?us-ascii?Q?rB81VIUitE16/+kh4Nnn7ySDLlbbpPIsDmSub1edxcTF4Uht8d5nff8mnROi?=
 =?us-ascii?Q?wN1eV4J60bse1SKbQr00bbbpcJNnoWTUUp372z4h7yCflxTPwO1LfANVhtWh?=
 =?us-ascii?Q?SqevCmevagAJf/DXn8ErC1ERfuBZ95/ax7BaRC+u6Bjh3kywDltbKMBuv3u7?=
 =?us-ascii?Q?nomB1vdSFFsTW90SVrW/mq9QxOkPGVg810cWD5sFTOX1QYv8TUXM7PXZ+9+r?=
 =?us-ascii?Q?BUDuuwlPCJbrJetEltzoOs7LLPT7DdJnlrB/qmT2DSZ658jo6MsM/faOjM2w?=
 =?us-ascii?Q?81MWazdoyF7F51CfHNMP/nN2IAleWNakGafquJe9w07o/9xNwNUnPNqZpWMA?=
 =?us-ascii?Q?AjgJk0BJKfTgqmWrsKVjjyOdm4ZE8axiLvp/SwmzLN5ZE3bcF3VlEW7Ts7ap?=
 =?us-ascii?Q?DwyaYpWT1KNda8oFEsC856aTdCp0LAkUDk9c871G4lmi6o3cEQcX+FmpHYWJ?=
 =?us-ascii?Q?eCqZzqpRZao62lFibWkex1lDrukUXDIXF1ZUMkTF9TCcIzz5AbLMfSaoDXRv?=
 =?us-ascii?Q?uXisbpmgSA/ovn9BfidVcW4OYhUaZmIxmjuyHy7A3YfqsfThda4ybNOww/VF?=
 =?us-ascii?Q?HkNVSYFbPmqMJA4JeHFRfkJ0yuh9Ma+tgXYPDZve3Eu0ZXEbQJiuTvzJHbKW?=
 =?us-ascii?Q?EWOxkJSTD33vZynJzJmdZzq7cSFn0VeBjWX0Wzgr4HiqlI1smgqOcVm2qZ3/?=
 =?us-ascii?Q?CGmOiVgZx1mx8cE0YLiSqNJxBzqNysR1VWaRpX0dZRkDhnFednNp04YK1JC8?=
 =?us-ascii?Q?ZqZlh0agGUfFo6CCXgxXnJ6+TFEwmqKE6fzUrB5cirZJZXYa/oCSYI6BPIj2?=
 =?us-ascii?Q?9dcp2Q/4blqcLrcAV9U+tQvR4sGAkD7kSM33hiODH5km11l0MjLwmmQmGV3C?=
 =?us-ascii?Q?zFvqSpNCO7jgj0cACKBwbezSSUALkKlgAggATdfWNwRjtoDEnCdYwzrB9lj8?=
 =?us-ascii?Q?zhi5rH8PFS+jHh8+eYzJGVtJG7QJfgy3N1DT1S9vbNfwlmd1iERGkmcDp+9f?=
 =?us-ascii?Q?56p3l6EwvmOhsbJr3j1PziEHqvYqbt5EGnBx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d4d6a2-36f1-48c5-f5bd-08ddbef3d672
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 14:21:04.0083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1291

+Jeff

On 6/25/25 23:51, Choi, Anderson wrote:
> We are observing a slight delay in the start of major frame with the curr=
ent
> implementation of ARINC653 scheduler, which breaks the determinism in the
> periodic execution of domains.
>=20
> This seems to result from the logic where the variable "next_major_frame"=
 is
> calculated based on the current timestamp "now" at a653sched_do_schedule(=
).
>=20

This is a known issue with the upstream version of the scheduler, so apprec=
iate you providing an upstream compatible patch.

> static void cf_check
> a653sched_do_schedule(
> <snip>
>     else if ( now >=3D sched_priv->next_major_frame )
>     {
>         /* time to enter a new major frame
>          * the first time this function is called, this will be true */
>         /* start with the first domain in the schedule */
>         sched_priv->sched_index =3D 0;
>         sched_priv->next_major_frame =3D now + sched_priv->major_frame;
>         sched_priv->next_switch_time =3D now + sched_priv->schedule[0].ru=
ntime;
>     }
>=20
> Therefore, the inherent delta between "now" and the previous
> "next_major_frame" is added to the next start of major frame represented =
by the
> variable "next_major_frame".
>=20
> And I think the issue can be fixed with the following change to use
> "next_major_frame" as the base of calculation.
>=20
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 930361fa5c..15affad3a3 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -534,8 +534,11 @@ a653sched_do_schedule(
>           * the first time this function is called, this will be true */
>          /* start with the first domain in the schedule */
>          sched_priv->sched_index =3D 0;
> -        sched_priv->next_major_frame =3D now + sched_priv->major_frame;
> -        sched_priv->next_switch_time =3D now + sched_priv->schedule[0].r=
untime;
> +
> +        do {
> +            sched_priv->next_switch_time =3D sched_priv->next_major_fram=
e +
> sched_priv->schedule[0].runtime;
> +            sched_priv->next_major_frame +=3D sched_priv->major_frame;
> +        } while ((now >=3D sched_priv->next_major_frame) || (now >=3D sc=
hed_priv-
> >next_switch_time));
>      }
>      Else

I'm not sure this will work if the first minor frame is also missed (which =
can happen in some odd cases).  In that scenario, you need to iterate throu=
gh the schedule after resyncing the expected next major frame.

Building off your changes, this should work:

-    if ( sched_priv->num_schedule_entries < 1 )
-        sched_priv->next_major_frame =3D now + DEFAULT_TIMESLICE;
-    else if ( now >=3D sched_priv->next_major_frame )
+    /* Switch to next major frame while handling potentially missed frames=
 */
+    while ( now >=3D sched_priv->next_major_frame )
     {
-        /* time to enter a new major frame
-         * the first time this function is called, this will be true */
-        /* start with the first domain in the schedule */
         sched_priv->sched_index =3D 0;
-        sched_priv->next_major_frame =3D now + sched_priv->major_frame;
-        sched_priv->next_switch_time =3D now + sched_priv->schedule[0].run=
time;
-    }
-    else
-    {
-        while ( (now >=3D sched_priv->next_switch_time) &&
-                (sched_priv->sched_index < sched_priv->num_schedule_entrie=
s) )
+
+        if ( sched_priv->num_schedule_entries < 1 )
+        {
+            sched_priv->next_major_frame +=3D DEFAULT_TIMESLICE;
+            sched_priv->next_switch_time =3D sched_priv->next_major_frame;
+        }
+        else
         {
-            /* time to switch to the next domain in this major frame */
-            sched_priv->sched_index++;
-            sched_priv->next_switch_time +=3D
-                sched_priv->schedule[sched_priv->sched_index].runtime;
+            sched_priv->next_switch_time =3D sched_priv->next_major_frame =
+
+                sched_priv->schedule[0].runtime;
+            sched_priv->next_major_frame +=3D sched_priv->major_frame;
         }
     }
=20
+    /* Switch minor frame or find correct minor frame after a miss */
+    while ( (now >=3D sched_priv->next_switch_time) &&
+            (sched_priv->sched_index < sched_priv->num_schedule_entries) )
+    {
+        sched_priv->sched_index++;
+        sched_priv->next_switch_time +=3D
+            sched_priv->schedule[sched_priv->sched_index].runtime;
+    }
+

Any chance you could give that a test and see if it fixes your issue?

>=20
> Can I get your advice on this subject?
>=20
> Should you have any questions about the description, please let me know.
>=20
> Here are the details to reproduce the issue on QEMUARM64.

I assume you are also running on hardware, but just a warning that testing =
real time scheduling on qemu can be a frustrating experience.

     Nate

>=20
> [Xen version]
> - 4.19 (43aeacff8695850ee26ee038159b1f885e69fdf)
>=20
> [ARINC653 pool configuration]
> - name=3D"Pool-arinc"
> - sched=3D"arinc653"
> - cpus=3D["3"]
>=20
> [Dom1 configuration]
> - name =3D "dom1"
> - kernel =3D "/etc/xen/dom1/Image"
> - ramdisk =3D "/etc/xen/dom1/guest.cpio.gz"
> - extra =3D "root=3D/dev/loop0 rw nohlt"
> - memory =3D 256
> - vcpus =3D 1
> - pool =3D "Pool-arinc"
>=20
> [Major frame configuration]
> $ a653_sched -p Pool-arinc dom1:10 :10 //20 msec (Dom1 10 msec : Idle 10
> msec)
>=20
> [Collecting xentrace dump]
> $ xentrace -D -T 5 -e 0x2f000 /tmp/xentrace.bin
>=20
> Parsed xentrace shows that its runstate change from 'runnable' to 'runnin=
g',
> which means the start of major frame, is slightly shifted every period.
> Below are the first 21 traces since dom1 has started running. With the gi=
ven
> major frame of 20 msec, the 21st major frame should have started at
> 0.414553536 sec (0.01455336 + 20 msec * 20).
> However, it started running at 0.418066096 sec which results in 3.5 msec =
of shift,
> which will be eventually long enough to wrap around the whole major frame
> (roughly after 120 periods).
>=20
> 0.014553536 ---x d?v? runstate_change d1v0 runnable->running
> 0.034629712 ---x d?v? runstate_change d1v0 runnable->running
> 0.054771216 ---x d?v? runstate_change d1v0 runnable->running
> 0.075080608 -|-x d?v? runstate_change d1v0 runnable->running
> 0.095236544 ---x d?v? runstate_change d1v0 runnable->running
> 0.115390144 ---x d?v? runstate_change d1v0 runnable->running
> 0.135499040 ---x d?v? runstate_change d1v0 runnable->running
> 0.155614784 ---x d?v? runstate_change d1v0 runnable->running
> 0.175833744 ---x d?v? runstate_change d1v0 runnable->running
> 0.195887488 ---x d?v? runstate_change d1v0 runnable->running
> 0.216028656 ---x d?v? runstate_change d1v0 runnable->running
> 0.236182032 ---x d?v? runstate_change d1v0 runnable->running
> 0.256302368 ---x d?v? runstate_change d1v0 runnable->running
> 0.276457472 ---x d?v? runstate_change d1v0 runnable->running
> 0.296649296 ---x d?v? runstate_change d1v0 runnable->running
> 0.316753856 ---x d?v? runstate_change d1v0 runnable->running
> 0.336909120 ---x d?v? runstate_change d1v0 runnable->running
> 0.357329936 ---x d?v? runstate_change d1v0 runnable->running
> 0.377691744 |||x d?v? runstate_change d1v0 runnable->running
> 0.397747008 |||x d?v? runstate_change d1v0 runnable->running
> 0.418066096 -||x d?v? runstate_change d1v0 runnable->running
>=20
> However, with the suggested change applied, we can obtain the determinist=
ic
> behavior of arinc653 scheduler, where every major frame starts 20 msec ap=
art.
>=20
> 0.022110320 ---x d?v? runstate_change d1v0 runnable->running
> 0.041985952 ---x d?v? runstate_change d1v0 runnable->running
> 0.062345824 ---x d?v? runstate_change d1v0 runnable->running
> 0.082145808 ---x d?v? runstate_change d1v0 runnable->running
> 0.101957360 ---x d?v? runstate_change d1v0 runnable->running
> 0.122223776 ---x d?v? runstate_change d1v0 runnable->running
> 0.142334352 ---x d?v? runstate_change d1v0 runnable->running
> 0.162126256 ---x d?v? runstate_change d1v0 runnable->running
> 0.182261984 ---x d?v? runstate_change d1v0 runnable->running
> 0.202001840 |--x d?v? runstate_change d1v0 runnable->running
> 0.222070800 ---x d?v? runstate_change d1v0 runnable->running
> 0.242137680 ---x d?v? runstate_change d1v0 runnable->running
> 0.262313040 ---x d?v? runstate_change d1v0 runnable->running
> 0.282178128 ---x d?v? runstate_change d1v0 runnable->running
> 0.302071328 ---x d?v? runstate_change d1v0 runnable->running
> 0.321969216 ---x d?v? runstate_change d1v0 runnable->running
> 0.341958464 ---x d?v? runstate_change d1v0 runnable->running
> 0.362147136 ---x d?v? runstate_change d1v0 runnable->running
> 0.382085296 ---x d?v? runstate_change d1v0 runnable->running
> 0.402076560 ---x d?v? runstate_change d1v0 runnable->running
> 0.421985456 ---x d?v? runstate_change d1v0 runnable->running
>=20
> Thanks,
> Anderson

