Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534FB48C076
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256391.439932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZPh-0007NM-RM; Wed, 12 Jan 2022 08:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256391.439932; Wed, 12 Jan 2022 08:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZPh-0007KE-Nk; Wed, 12 Jan 2022 08:55:25 +0000
Received: by outflank-mailman (input) for mailman id 256391;
 Wed, 12 Jan 2022 08:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZPg-0007Jn-6e
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:55:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff1c5e2-7385-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 09:55:22 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32--BBvSMtZOzSgAIix_KULFA-1; Wed, 12 Jan 2022 09:55:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 08:55:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:55:19 +0000
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
X-Inumbo-ID: 5ff1c5e2-7385-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641977721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2Vuior8PYuOVJP0shUnoF3HfrsoCqa7CjfiATJmeS8=;
	b=Duk2CCeN7omw8ZHPl53KkyRZp0A8t9Haah1NxCC42lBpY+Ep3tG3YqtW3gg5IaJL7bp+8I
	2U4pFIRPgAwlw/T7QWgzsgZsgmeGg06CIWgGYi/PsKVnUH2NZJLMCu0UFf5bJLsYa+8ijU
	oVzUMKdR5JUxQLa4C2SODILKhWpoa4o=
X-MC-Unique: -BBvSMtZOzSgAIix_KULFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMsmSVviw7eC0ArQ1pfS5UaY7FtzzUCD3PM4HCIojZ8oc85dllixiF1WKvRsHIxeKJK9ghZPIOMxMAxA1i3pmAO6+aNIljhqzLgxI5hzyMbGp5jaMfZpZ4Ln8fn8qM+2NzhYgbe4fQvO0roxWtJaqqZepWNeeF56LCBLe9U2GAv7cO18lKEE8K5HIfAdVmIPKV5ve1A7YDKuXOK7Z5WHM72W11BjAuIgmg0RrQOyycgZQDYvZsdJcDyPjJECs52T4CUdwSpyTjOGPIX2FFf4nu9TWOWW6WHHMUqkmNQov2HaKaFNbb61yWGIDxLEY3nf0ROyBNhdQ4PvqMUWyS+fqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxh9IDBUC18qTBjUbBaFY6EpgeSBeQZi1rjPikAJ6H0=;
 b=NVi5BzrFbF0CenDYt7fvIi7aYfWkMLe52X826PC0kMYcRxEA0ZQ1upDUzRhJkcu8n8XFp586xmF2y9UGMQ2X0iauvQipwIotlf8BmkgKa5Mpi5i9sq6dxjvYItqBXB4D5m59bdaND8WYerbktO/txhqt+Bt4LcrX8T0oq6cycqsCuGE9N6fX4hapzRb+q+8uQIFm/W3NIx10UiK7NItSmHtBeYZ5MbTZegICC/16o3HU3nb7I6iztIznjbk4xC1WZw7/Jb1ThWYyJgNHOjL/LtWYzXa6vXhGBPxMouv12OP8FmBSrRX3cWHgZ/X/gQyECJXxWF/O2ONXnheMcMIqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
Date: Wed, 12 Jan 2022 09:55:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH 1/2] x86/time: use relative counts in calibration loops
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
In-Reply-To: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64af267b-de62-4aa0-ccca-08d9d5a942b5
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C16161F725F9D98F8EC0B3529@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4KWMo+4j7GCf3VEvcLfQt+0vpqeAIhte+Q3aThnj60TzMW9wiyjU1HYZHPRnVfGASObEpZ69c3rRekvJf7H7YNQ9TSIsoJ0L75HtvvcfhabOLUuP2pWALwEHjrS7GTiMBdSkr1Uut5ml6mqY+3njCcp2J3tlfbIzviYYsI+lj+ea5mPiBxvElF6uN9yeHSnBmlNABLbVoAHRfMeK+0yBo1CK8lXxx3a2VsSsNUjqwIAPbS6+L3lG/dEYnvvFmoAEplf5AzgP8zvBT1HlALOs8b4A+0codCljns4MUDJ2RBiS/YgLQN05/d3v/oOGj1yAsYM36AhfvPx872eSPri+7qHKS6/ys97bMoSojK6K9MUwXPrmGN6Pyg/D7EvF2aQyTCSG5VuzURcPa5G45q2BX7h1cAJMvqvjFvxkV6Zjtyes3k+jJ9bkShQwO/3o7f1ZHszoVjj80IhnuOrRUxOD7eF3xiJ4s1hge+4EM0imzDjptU3ZRVRJaZvorfl6OVSpdoT+F+FAP22jhquU5jwHR36d9CyIewSF2ppQs4kP6ZDeWkQkb3HlHkavQYxi+1qqsO92X1VjBLlGnurb2JkaMV/BWAuOGFWdw3F4Zhji5O+2dtPKpRNddk59ncB67z2imgc/i3GHYi/KwUR2Oi48iIZ5120AKmwuPdJjHpzH2x0PBunuoFGTdNRDANnX3i1xSD8PPfkkJqJAyh4xAVsWL0BTQpEls9676kzlerKsyPy1a66bNjhL2rQnkJF0yV83
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(2616005)(31696002)(6916009)(8936002)(36756003)(54906003)(186003)(26005)(6506007)(31686004)(86362001)(38100700002)(4326008)(5660300002)(8676002)(6486002)(6512007)(508600001)(66946007)(66476007)(83380400001)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?crhOxdcn/P4SEMiZ257hkHGLLke1hTDn8EuoXVRURyPzqTVMS4028ErFqUKW?=
 =?us-ascii?Q?GqLkJpg7/m8wHdRYJ7nhS/EVWHaIpmwQwQ7Gupw+t+gFY5htOxyyj7hcL0Dc?=
 =?us-ascii?Q?2raGwwyAi2UVKC+cg+4ggTqzBuPNqS8iM04FgAhtztIJXDMP860XTh4cE2Oo?=
 =?us-ascii?Q?3Tc2xCtx/4IcsOSs2xxr1MUYV4ZEjgu33oT+qerhE6rHrZFtv4+seiIK2r0v?=
 =?us-ascii?Q?rODihZuA7oE9f+kzK31Sa2rluWI9FzJhCJ1DUt8VDjgMuMSx5DW9626D8w4I?=
 =?us-ascii?Q?4qWjU8fFtz0Nns+kM8BulQBE6EvUM/VA3OK4IvKrhBeCkIhzi/pzPaOdnlRU?=
 =?us-ascii?Q?BktwObE4APslwp0iePsbGJPeYgJECDKpOF22X5zHRK+6O8xwpar8kGbWVok3?=
 =?us-ascii?Q?TMN7wMe57NE38Rxmz4t6jT2/RFjR/fZb0GWU1tod53AnswYggmFLaVt76F1E?=
 =?us-ascii?Q?8IXG6rkxEf4EleFw6jIErqigQXJ9D2z2cyMRO34p421pZ8Akhfn+hcHX6PU1?=
 =?us-ascii?Q?FU/7w37zHb0JO/lQ/UGzrUn7Zaybx2IkIydTHXgL5NyYYAme1EGwdvmEm5+m?=
 =?us-ascii?Q?tugIDOWj5DiF1ngLbGqLWPl0nUgTSwxSlF2ol6DDnbIRtJpfTaiiqKQpC6/m?=
 =?us-ascii?Q?BGO61gTuSfGmEhIvSnwDVJcQtGVVI9daEoViMqWJuCQodMlqN6g77nc1Ubhy?=
 =?us-ascii?Q?XOwDw3thX67w64ADxuhUZlnO6lM2bLTOk6IdzC86WVzFTy2aIdhHwHW+Woho?=
 =?us-ascii?Q?C1wKtxnnebOOz2CqCarlGd+/9Hx1VGMDlkJ/f7pPEPZPMqfyQ+HNfbtx5TKV?=
 =?us-ascii?Q?rOaWkQW1k9e+W9vOvPxSoiZJH7EJr1o+cn+gE3PgIZWwWX5r/pYfkzGInJIv?=
 =?us-ascii?Q?iJoN3d6dCUUCrA/eBi/BBNUB0mGIhktXDhjGny3V7X5T0jXCpxRRGeE5J5KA?=
 =?us-ascii?Q?oQBuI9YIV12w4GvLpm0Olzc942yvo9I7lES5ObgcntuoED4Rw22xmUWxQOSi?=
 =?us-ascii?Q?jsK3Hi0J5B1OPQOcExiM5zavQy+sTrdRnIBK+NxhzMYngvSrDwuPx84Pay6x?=
 =?us-ascii?Q?EnHmSlTOKpJNHAYzRJa6KRUCgdnmn2xgTCwIiH3klO7uyvcRMmGOegRyTGvE?=
 =?us-ascii?Q?mroLgWKEKZGmZ8hxQZmxkcAv1fyiWGVeBIyshiSDyOBkaElo9jbINGd1MhhC?=
 =?us-ascii?Q?lSzZ/3FSA/HWVwAtEImUlRR+9jdn5WdBsOP6K+ce6pwHQFPfYg9tCODvjNrQ?=
 =?us-ascii?Q?wm5tz2KDH4mg+gjcBmcH5X4eah6p6Ww5wEsQ5DFdpl3L8eYDtpt6wwpl6c0z?=
 =?us-ascii?Q?/XsFjgoak8LPGBszsnAwRA4mRBaC5aArLM5zo2LegZexu1geH7AHq2Fc9HMt?=
 =?us-ascii?Q?y/A4qZcwVwFG2DToNwBCZsfrWIRGoRqVdpgAQCy1GkZrPPoV96OsGMAQKWns?=
 =?us-ascii?Q?+nagjpJq5jO9TozTo2p90OKIOKAubLl8i4FPRdGadUaGYz3XPp0d2PG9gWP3?=
 =?us-ascii?Q?ua7J/Pb93zMXYIQM++V2Cwmv5ispaMpcVClAnZHiLjmBvASCeM75OVBrwMeC?=
 =?us-ascii?Q?0OE+jOBfzAR+kDCrlxmUuUF04dnEvUhWjEG3cCzK8/L6s6EvvuVEG8yFEoIA?=
 =?us-ascii?Q?h/4ObserZhlmFz5N9bQ0UJo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64af267b-de62-4aa0-ccca-08d9d5a942b5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:55:19.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbFkoUFW46h17xWlUjCTub7vZR+KdZZ1nNx1jou9NnlkyTeN+WutT9xeWP3PwXq9v4uV6oVaIGg8GrfL8xKigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

Looping until reaching/exceeding a certain value is error prone: If the
target value is close enough to the wrapping point, the loop may not
terminate at all. Switch to using delta values, which then allows to
fold the two loops each into just one.

Fixes: 93340297802b ("x86/time: calibrate TSC against platform timer")
Reported-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -378,7 +378,7 @@ static u64 read_hpet_count(void)
 static int64_t __init init_hpet(struct platform_timesource *pts)
 {
     uint64_t hpet_rate, start;
-    uint32_t count, target;
+    uint32_t count, target, elapsed;
     /*
      * Allow HPET to be setup, but report a frequency of 0 so it's not sel=
ected
      * as a timer source. This is required so it can be used in legacy
@@ -451,11 +451,8 @@ static int64_t __init init_hpet(struct p
=20
     count =3D hpet_read32(HPET_COUNTER);
     start =3D rdtsc_ordered();
-    target =3D count + CALIBRATE_VALUE(hpet_rate);
-    if ( target < count )
-        while ( hpet_read32(HPET_COUNTER) >=3D count )
-            continue;
-    while ( hpet_read32(HPET_COUNTER) < target )
+    target =3D CALIBRATE_VALUE(hpet_rate);
+    while ( (elapsed =3D hpet_read32(HPET_COUNTER) - count) < target )
         continue;
=20
     return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
@@ -493,8 +490,8 @@ static u64 read_pmtimer_count(void)
=20
 static s64 __init init_pmtimer(struct platform_timesource *pts)
 {
-    u64 start;
-    u32 count, target, mask;
+    uint64_t start;
+    uint32_t count, target, mask, elapsed;
=20
     if ( !pmtmr_ioport || (pmtmr_width !=3D 24 && pmtmr_width !=3D 32) )
         return 0;
@@ -504,11 +501,8 @@ static s64 __init init_pmtimer(struct pl
=20
     count =3D inl(pmtmr_ioport) & mask;
     start =3D rdtsc_ordered();
-    target =3D count + CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
-    if ( target < count )
-        while ( (inl(pmtmr_ioport) & mask) >=3D count )
-            continue;
-    while ( (inl(pmtmr_ioport) & mask) < target )
+    target =3D CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
+    while ( (elapsed =3D (inl(pmtmr_ioport) & mask) - count) < target )
         continue;
=20
     return (rdtsc_ordered() - start) * CALIBRATE_FRAC;


