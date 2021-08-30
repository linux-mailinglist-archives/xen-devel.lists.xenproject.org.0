Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FDB3FB6A8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175041.318981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgwD-00086c-75; Mon, 30 Aug 2021 13:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175041.318981; Mon, 30 Aug 2021 13:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgwD-00083h-3z; Mon, 30 Aug 2021 13:02:57 +0000
Received: by outflank-mailman (input) for mailman id 175041;
 Mon, 30 Aug 2021 13:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgwB-00083R-UT
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:02:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13c095dc-b4e6-418a-850c-718d30b9093c;
 Mon, 30 Aug 2021 13:02:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-EAV57Xv5N5uwHMgfrTCrCQ-1; Mon, 30 Aug 2021 15:02:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 13:02:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:02:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0130.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Mon, 30 Aug 2021 13:02:51 +0000
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
X-Inumbo-ID: 13c095dc-b4e6-418a-850c-718d30b9093c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A0SFd/SWBGb/mVP/UiCsyrSrRP8U1K0mXERHcQ8qcR4=;
	b=cpKiX8w95q2/KoJBXHtl0HeWBhjdZ8ue5f74Iwj4AZLedSMRSCC9TmQu6b4eEB250jx1zb
	Hdl7BfW9RcrQKxD/MxHA5zZTyFkF84II8MBWJZtIpxoMiAtT30PKr3QRlddtflbrcwqf9k
	+E7CKe9RxrYam01AqeK0l5UTzaBGobU=
X-MC-Unique: EAV57Xv5N5uwHMgfrTCrCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxzgXWeIbNEKjFTjHGWUnMJg/sdLTyVGWeCBGsPfxqCXLtIC0DbNACY5t4mI4uSt4ZNk8tmwv01ewYVX6dIONFPgU4TnUqrk3raTdBBftUq4ofr8DJ3NjXwZiyOeTTq2rk3GkRf4RTXL5WAMHUWgSrMr9NrKeQpolq9qaeavim5Inwc4NwFjdrVBSwkXFud5DhaJix9tS6qQfphJd4v3IImED8ERLCwGd7rE4CSeIyv0QoAJuFAeyswE/sNxeHt+Ne0ZZ7hfWWI78bCiGdl+XCAql3ljBMDHfLvvnXBt7QMBHiI8dMOSx1Oo/qorUFfBNXJEILdHKDpb76tpGN/ASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0SFd/SWBGb/mVP/UiCsyrSrRP8U1K0mXERHcQ8qcR4=;
 b=oQVVkSQtUJkmhkZh0x8s7dH3LaYui/RRpvJ3jNPDCeE8Iw2BQ9VdVTtF0SunKbeKK9Ej3bcvMHB+e/ntdZWfdx8far0cX1PdZrqs3TexXgAZXI7ubQJEinXW7B0eqnAJKBAFWmaMvRnLOuPk7/SAC3r2B2suGr5V0uxwLGZEx29j32i2XNAJH3ZpKwfG70CPLPoLXBcrIdhRYF6wKbclsyJqylYNZpGxcdEfj2k4qOYlpFe0utXa7YOoG/7IJn4IAeeIMXdT1BjSUcpWLiFqNeWOKMeDZXB3JRBYPTCMQNnuQNlcq7Nd1Sw8pZCf8xe1R748VRw1NbsER3JmlsGIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Message-ID: <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
Date: Mon, 30 Aug 2021 15:02:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f0f8953-fe59-43bd-3eac-08d96bb679ad
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59018927AE8965E21F8F062FB3CB9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ilsvB/XQInk/cJ8+Y19OTwDhIxgbpjvUOkOuSq/nL14Ka7k+G2mUrCW/wOdPMu9knK/+4TUsNm1WmNgeEOjZ/crLnbQ9hCHx6C+iJpwiXnvryWlJKLBbInjEkcBfhg7XkTGC7SPNiMMBByoFzFtelIn3ClDW++17g/6kZz3j0Ugdw2Q/NqlN+iBgotSamOvG+4CO6BlfQGzCGkHL84H+tyNSawyhhX+4tYJD6prUjgy0clkObU5ojDpYTTAl4W4gOVJQg6Z3YaUkNgXoSqYTkSIdM92Qb0+uZbA3Y0cLuuZ7GGOiH0MHRSMehhrHf93XNH9HhjdU7kda+KCqnRfmk3mCqRUYPgBE4CR4TfwFqd8I8tkEEqgsrjSBT04GHmFd9MDyagRFvJZo+ZAf3aRuZQeQbTaivw8PQzGB01pLB2yQKQsEIx+P9rGMPOuZaLsrOT/2l9xVgXs3DUWcD9kI0VLCnq8WWLziolK9YHIMegUDnrPlBM9RaDjH9gx85yzei7TFKDo0BYgHyIOCML/gxiZSR0gyGkin3diDTFfAvI+qcDPTqFOha+xCDIKUyoUnfPEbfIsWM/0HtvmjdpGJA8/5W/Osn+UxiYURN7+OZ1Y0BwVSsHDjUfiGunpH/sp1Zh7FAOwZVr0i1fE4bY5OgtxYF5WXne/QgAWU7/aEvRX1JnhErfma63AKVTH3+n4VV8bTIGPjo2yrIcHKzKPBwSvB74KljLFPpj6T3D5SQiauiHhngEP6n2pNjLIlrQrT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(316002)(66476007)(6486002)(66556008)(16576012)(6916009)(5660300002)(8936002)(83380400001)(54906003)(8676002)(36756003)(66946007)(38100700002)(186003)(2906002)(4326008)(26005)(86362001)(2616005)(956004)(478600001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09KSWRtbndrN0dpVUNnZm5uSmRQb01zSmp0ajJ0QjVwTEczOFFPM0xZWDZx?=
 =?utf-8?B?bkVUdWpiZCtBbmNZeUhqYzErQlQ4Q0RhSVhqUkR2SEhZclJVNkt3N0tLcFNk?=
 =?utf-8?B?eVVxNnhGQlV4dmZiY3lyUWlsTXRteWFSK3FLcnBXMk9GVGYxRDIzVC9tWTNw?=
 =?utf-8?B?a2JGOTg3aWswaUJGL1c4OGJSRVhKUm56RXUxY0p6L0RubklpTG03b1NKRjl1?=
 =?utf-8?B?OGxqZFVlSTdjVmpyR1VqOUNpa1ZONXFkWFE1V0hCcURUOU42OHUrNnlzT05Q?=
 =?utf-8?B?cjh0U2pDVmtUZ01rS3drOHRpUkdhTXl5ejhXRDM1VVE2UVg4S0U2TUpNY3Vh?=
 =?utf-8?B?UFZqazVwcjBneXk2QU5YM2VRc2VlaGhhM0M0Q3hBc0tlb2hTWHYyOUJvYU0w?=
 =?utf-8?B?Z2xTRGlkeHAybXFSeE5KeHdFcVNOdks4M2VoWHhnTC9Eb1NXSG13UUluamtv?=
 =?utf-8?B?cm1tV0tydlBzTjdzYVUrWVV4YTZRQlJJaUhGeHVrNlhJd2k1SCtLenU0SXNL?=
 =?utf-8?B?ek40cTlUR3ZsdzZQM21pdVJRTUp0SU1IV0sraXBTdmRaeUdvYlpPQmVZN0hU?=
 =?utf-8?B?eFY3K3VPdjdtcC9zZ2Q3UWllMnBqZjUzKy8rdVdyZ2ZmWHpPVXpHUXdFVTM2?=
 =?utf-8?B?ZWVUTjZ2T0hXem0xVVVveWJlUDRqZHg0b1hKT25HVldFWmJlZWlrY1cwWWwx?=
 =?utf-8?B?YnF3K0FGdUpHaFVydXF2ZDVFM2FaczRFdUtaOXBvS0hjZVFlU0JnQmtVNmpT?=
 =?utf-8?B?WDRseVNmb3Vvblp3VENOek4rTzlhem9ZRFV2Y1RYNlZkZk0zSTIvSisxR2tP?=
 =?utf-8?B?TGhmRlV6VW5HZ1J4L2ZmajZXWWF2RTh5Y1JzWHRPaFhPalVodFhSVGo2eTZC?=
 =?utf-8?B?UlRNaXBXQkdhNmNyTHozNE56YWs3enpYcmhTUmtudTJ1Q2x4ZDdQbEhpYm1M?=
 =?utf-8?B?NmlGQUt5OGl4aDk2dDRMNXU4ZEVsa0Vob1NQN2tpS0tGQWFWNERqVFFVbTJD?=
 =?utf-8?B?OFZBU3ovSDRBY0pwRjNhdDByb3l3ZjNkMFREUC9iVCtzQnREOC9FK3ZPcGs3?=
 =?utf-8?B?bk1aUGZJVjFHbUxUUUJlc3Y0OW9SQnJXNlc3YlhIQ3hydVZTaGJkMzlPYTh2?=
 =?utf-8?B?OTZWemtubUMrSVBZMEk2RWF6c3Nqa2pJbzFjbCtYSFVDdGVMT2J2bFpaLzRM?=
 =?utf-8?B?Mjk4MmtSUTJ4SHJCNGk5YnJnSGttb04xaU5Rb3RwVjRrdUIrUFR2NjdxNVZ0?=
 =?utf-8?B?TktDT1pZdzR1dFlhb2VhL0pGWE54RjBacGprRmU3eWFmdG1EWm1naDNreStw?=
 =?utf-8?B?OWJNdXlGT2xYVjhiYjhRa2VJZHVMTERKdW1JVThITTB1ejJBdHMyd05NS2d2?=
 =?utf-8?B?MmI0aFo4UUJwcFZ0dWcvK0tjOFI5UGczN2gzRDljN3k3OWU2c3VGYVBDdjNL?=
 =?utf-8?B?WmlJYzNQMEowMzh4WlJPc3pIemtDd21RTllwbFg0dEJpeEVqbzh2OW9KTElR?=
 =?utf-8?B?eGdJQUtoMVFKV21vRWlpYU44OVlmLy84NVlHOXBrSDFUczU4K09VQUtxRitt?=
 =?utf-8?B?UjZmbUVaaDM4UkFLRDRjdXdRTUFldG9HcytWaUlGZG4ybldMeUdrOTVzZis4?=
 =?utf-8?B?Yjg3Lyt4STVxRjdCM1FIdWJOM1h2VmN4aWhUVUlDS3hoYXovYU9nZmZBaS85?=
 =?utf-8?B?VE5nbWc0SGViWWJiK080STNwRG9DOFBjWkNVbEc0QXNqSjFvTWpsMDErQ3Ez?=
 =?utf-8?Q?tjjoomSBfrcn2x22NbImHXumtvp1k6i+FEVLayZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0f8953-fe59-43bd-3eac-08d96bb679ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:02:52.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbktZPSYs919MR5R/IbXr3w9nYYVSGnXqP8uhg342yY3k6tOOS6FdViqINtwfkaYPhJBlTc6m3dZOjmaxztMjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

One of the changes comprising the fixes for XSA-378 disallows replacing
MMIO mappings by unintended (for this purpose) code paths. At least in
the case of PVH Dom0 hitting an RMRR covered by an E820 ACPI region,
this is too strict. Generally short-circuit requests establishing the
same kind of mapping that's already in place.

Further permit "access" to differ in the "executable" attribute. While
ideally only ROM regions would get mapped with X set, getting there is
quite a bit of work. Therefore, as a temporary measure, permit X to
vary. For Dom0 the more permissive of the types will be used, while for
DomU it'll be the more restrictive one.

While there, also add a log message to the other domain_crash()
invocation that did prevent PVH Dom0 from coming up after the XSA-378
changes.

Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping entries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -958,9 +958,13 @@ guest_physmap_add_entry(struct domain *d
         if ( p2m_is_special(ot) )
         {
             /* Don't permit unmapping grant/foreign/direct-MMIO this way. */
-            domain_crash(d);
             p2m_unlock(p2m);
-            
+            printk(XENLOG_G_ERR
+                   "%pd: GFN %lx (%lx:%u:%u) -> (%lx:%u:%u) not permitted\n",
+                   d, gfn_x(gfn) + i,
+                   mfn_x(omfn), ot, a,
+                   mfn_x(mfn) + i, t, p2m->default_access);
+            domain_crash(d);
             return -EPERM;
         }
         else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
@@ -1302,9 +1306,50 @@ static int set_typed_p2m_entry(struct do
     }
     if ( p2m_is_special(ot) )
     {
-        gfn_unlock(p2m, gfn, order);
-        domain_crash(d);
-        return -EPERM;
+        bool done = false, bad = true;
+
+        /* Special-case (almost) identical mappings. */
+        if ( mfn_eq(mfn, omfn) && gfn_p2mt == ot )
+        {
+            /*
+             * For MMIO allow X to differ in the requests (to cover for
+             * set_identity_p2m_entry() and set_mmio_p2m_entry() differing in
+             * the way they specify "access"). For the hardware domain put (or
+             * leave) in place the more permissive of the two possibilities,
+             * while for DomU-s go with the more restrictive variant.
+             */
+            if ( gfn_p2mt == p2m_mmio_direct &&
+                 access <= p2m_access_rwx &&
+                 (access ^ a) == p2m_access_x )
+            {
+                if ( is_hardware_domain(d) )
+                    access |= p2m_access_x;
+                else
+                    access &= ~p2m_access_x;
+                bad = access == p2m_access_n;
+            }
+
+            if ( access == a )
+                done = true;
+        }
+
+        if ( done )
+        {
+            gfn_unlock(p2m, gfn, order);
+            return 0;
+        }
+
+        if ( bad )
+        {
+            gfn_unlock(p2m, gfn, order);
+            printk(XENLOG_G_ERR
+                   "%pd: GFN %lx (%lx:%u:%u:%u) -> (%lx:%u:%u:%u) not permitted\n",
+                   d, gfn_l,
+                   mfn_x(omfn), cur_order, ot, a,
+                   mfn_x(mfn), order, gfn_p2mt, access);
+            domain_crash(d);
+            return -EPERM;
+        }
     }
     else if ( p2m_is_ram(ot) )
     {


