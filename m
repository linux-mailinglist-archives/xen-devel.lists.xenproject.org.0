Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED2303B1F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74840.134562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCi-00019c-VI; Tue, 26 Jan 2021 11:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74840.134562; Tue, 26 Jan 2021 11:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCi-00018z-R5; Tue, 26 Jan 2021 11:08:12 +0000
Received: by outflank-mailman (input) for mailman id 74840;
 Tue, 26 Jan 2021 11:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4MCh-00016Q-AW
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:08:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07184b16-528b-4e64-bb34-f9e1db1eda90;
 Tue, 26 Jan 2021 11:08:08 +0000 (UTC)
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
X-Inumbo-ID: 07184b16-528b-4e64-bb34-f9e1db1eda90
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611659288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lBBA+ILCJKSjccE75J4kusj07qdI9NeWRBlGxlrbzN8=;
  b=cRkY6+1PiPfjJ24ZTUDDKsDQANyyXgS+X6A8HsYzzjCTWeGihIcqR2mr
   z/A0a28n0v4ABVBwZFw8rWLZyOTd+rmvY6kl+itsxYiYa56q0DPAyYcRM
   E6KHB0w6jASasv1DBad2yUndyIZbvYCO8Kosu++N6cDzDfrn+N+RxqGVX
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LEkt/X8pwcb8RL5WYSVmkgThUhlvnObBn1YfV7yX3tnijZa4FUjor8P3R60XyZjtw09ea05iZ4
 QEad4+LjOWkCWt6AVaCJZndTKpHRmuz6Wl1vsvxc+Dwe5Ws+UsR/Z0gG3WZ26xsxFaQdzjDGCM
 aTFFgbA/XXTA2WlO1Uvg2mXyG5V0XSE7AcMzb6DREOxrxV/rJxxIsopOI3Fxkgqg9f/KuteCmG
 GUL8NOoc7PRh5hOCk96Om0j2nv7BUmI20Kv9I1lGrf9cXtWqCMuRoz0/DrVZX0TjFBUcFUtyQ6
 YKA=
X-SBRS: 5.2
X-MesageID: 35823562
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35823562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8dIJmvb0+H6nZpww90fGOav2D+MPpfPFT82oKGWiLSPTKjL0162Ys53S4MS3ACYnmNF37ePlmnGszj9zdQJI88Gs1KrO+x8HE/nyFo0f5kdWuHwjYXvOgb29CFG/CrQUShaevOBCfWmbunBmlZ28ce3Eyk3s4aOPfMCMX4T7Su4DKYIbKbRew4XziMRa/0Nq86Bd5PneAXOoD4CXhVZuIaEAuS7XDWKV1K/eZvoTfybQ3pl+roobvS17OsUgcdSmRuIW11JODA8arhjF1HbDNCMGuyZTVb2n4ne31+Kqt8ylLPZIX64fuhj1JgNotlebXVPJTucb06iPdf/hxbTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj9G+ZPOM5GhSqTrORF1JHjlXTqOQed8RxWo2oyGvwA=;
 b=jIkvadiPbaDV/X0OrScfch1VFAgaoL+kk0YxS0ZtNHC6uk/gJwbReb4XnEqetH3ids5Y/qucDaoCgyXvoR/Rg1AI/ydwQqv/e1snU1gDhh3PQsPaFwyUitnV/Xu2gnH9t5HITYFsbzUfdwhoD4kfM6QMjikvDpcnhBp9LzfHg3e2liL4QDFyvAGsYUBLGI6a/5Q01/2ud6sGlrXswE+/AuUP9yPxoLxKJtS5cIMF3HLm6cg9URp+RReonotrSe5jzW7qom0JgQEJezfB0CIEilnhh7nTX52N4TlTsjyoQovvnElRZ7y2O/S6QSAP7AHCXtOkoe9aPKRavG8wQYwY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj9G+ZPOM5GhSqTrORF1JHjlXTqOQed8RxWo2oyGvwA=;
 b=vjy/aO+NV2spn01ZfJBQVEQt4AK+r0imH5VM7mu2tE+PeebvquRNqOgVXboCMdqW+8ythRPvKCSLglz37AHSRr+T4WAa/rRoQnFLrQ8Ys/q+nKmnR6s6igvJVDBaMLCZwZzTkfxrYtFZxS4GmQKF08wgJtByTzb3nUIOZlJn1Zw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/irq: remove duplicated clear_domain_irq_pirq calls
Date: Tue, 26 Jan 2021 12:06:04 +0100
Message-ID: <20210126110606.21741-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126110606.21741-1-roger.pau@citrix.com>
References: <20210126110606.21741-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88a467b8-44b8-41a7-9ab8-08d8c1eaa746
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059E165329958668D3F81068FBC9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Wstvij75keXt5pcOIOEK7hoYh/qLl0hN63PmBKPGMUOT9cx6+97xVnk72iKb1eNZVzaK8vfc/pIQvhr4RgeGtTsSq2gZr4ibgk1F/vN5BiECDk1TeWWg7VNw6+l+xpw9XEluA2ZSqTkl1CUINxPoC5I1xbF3yZhTWPD3G/njeaNZ4eO4g3Q69bJ5AO7vcRK2cRzLXf5Dxqr6MKeWUF9bneDE3A9s1/Cx4O+OaFUkcTtxvevxfGziq84jGmyEjLKN1QoiDgjN1DHczQt0zNXtssWUAuwthQORhCzNoHREttzh41V3WFM2sjENeJM2UHsieiY2936+u+VNWzBn34oZTu4a7fCv0bRR0ywc/Iq8ItQTCGuZlFe2MbjZ8NULUl72XwyawZQQmb28ZdkxnwdHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(186003)(83380400001)(478600001)(26005)(5660300002)(2906002)(66476007)(54906003)(16526019)(6496006)(6486002)(956004)(8676002)(2616005)(86362001)(8936002)(36756003)(66946007)(6916009)(66556008)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnJuV3VnTW1HcG40V0tBaFMvVlNxS2tnSWNwT3FxMXJwbDR0dHFpTkVEOGhm?=
 =?utf-8?B?Ulcvcm5MS1NNWlM5d3c4N1ZiSUFRYmVvczMvRDFYS0J5dG1XWHJrN002QVkx?=
 =?utf-8?B?TUN6d3JNcVVEWDVoNjNVQ2lkNlZ4Vlc2SHZXNUFtZ3dIanRXcGY0SEtGMzlL?=
 =?utf-8?B?Sjk2Z294dWdZRTJyMzhEU0c1NUp3djRxQXpyVWpNS3RUcUdYU3o2KzV4NHBB?=
 =?utf-8?B?cGJ3NFkvL3EwOHU2VGhOdmdlU0pwS1dEazkxYXZ3M1VoRlg3czB2c0dIc1pi?=
 =?utf-8?B?Qy9kdTVaWURKUDhnOEhnZnlnU0Z6S01BZEtub0RNdmtjb2FlcmRYdnhlQVhP?=
 =?utf-8?B?dTgxVW9QeDZ4WXN0aC9ENFpzN2RiUXJmelV1S0VSMXJnN1dIVG5ac3lmanlT?=
 =?utf-8?B?M0k5WWRxVXJ1SHkzNUIwaWxRbWhhaXlCSkdkbzJHOUx3MFRxek5JY1daVWR3?=
 =?utf-8?B?VjVnVE1hc01vYUdiaWxDaU5aN2MwblAxclkvaUF5bzYxdTlIMHRkQklFQlJE?=
 =?utf-8?B?ZTU3Y2E0U2NwOWJwaTA0TEwrR2ZJOWJUdHRhUytaZlN1RmFlVnphNHo5ZHRM?=
 =?utf-8?B?TzZHZ0RNSTFPbzNxbzdSZ0JQeXdDZ2FCbm4zcnVUamRieDVqem9UOWpUUzBi?=
 =?utf-8?B?MFpCNll2OVlTWTB2ZDlxOWJIY095VCtoQkdyNGhlQWt6Z1FwQVB4cFJSczJD?=
 =?utf-8?B?VVQ5eFcrcUpjSnRXWWtKZGREeXpZUFpEckt2Q2VBVmxEQkloS20rSFArN251?=
 =?utf-8?B?N2pycGdqUmttYVo3UzIwNjF5NkVOWG1MRmg4M2Zoa29raFZwaktLS1puY0My?=
 =?utf-8?B?bEJRdkpKRDI2VkRUSEhuWWx2bC8wNXJWbUthcUZMMGRycnFtd29LUW9CYXZE?=
 =?utf-8?B?dVluNzh6N0R0bjBoOW4yWUNtMktnU0FBR0VWMVczaThIODdUV214WmtmbGkx?=
 =?utf-8?B?UGRTdG9RK0VNMjA1NFV1Zit5ZWdkUm92djNnMUhFRlAxbHJ6V3UxK2ZGKy9B?=
 =?utf-8?B?dXlFYTExMWt2dVhFcTdtWHZ0TVY1VnhsVGpGdFlCbGxpSHpYQW4yYnBtTjB4?=
 =?utf-8?B?N0x2VFFRdXQvaXFlRzJVbDJCVS80VHZTZTZ6NUZycXdFZEZmMEJCQ1hxWEdw?=
 =?utf-8?B?bW5COE4vdzJDREZvNFV5bHFqOTZTMGppRmVtK3dON0xKMjF2OW1UZCtZVWRH?=
 =?utf-8?B?K3lnV0hzQ0RMVkgwRzZUdUxxVFhsNFk4MVBOcFRkaEhJbHNJalRINGxBMHZl?=
 =?utf-8?B?Sk1mZnRUd2k0czhYcFdhd01EZktMREJBYm9ncStUVnN5TTU5WnBPaCt0ZGh0?=
 =?utf-8?B?TXdsR2NFNVRITElJSDNxd2Z5cVZ1RUp5THBvL2JyVWZJL0g3V0ViY2RGcEFJ?=
 =?utf-8?B?ZXRRWmpaNjVhQWxPREdSejN0Wm9mTmhxcm4ybjdqOFNPTU5MSHhSRVZoK1hz?=
 =?utf-8?B?M3JyeGtxVVJKbHY0V2ZDNE9FeVVLMWtJSmExSkNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a467b8-44b8-41a7-9ab8-08d8c1eaa746
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:08:04.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQ7uiG3bHJnbiRh5s+DHJxqt3pqLaX36lTY/0ED9qoCuqyU7F4MSdWsuxuxSXxouosm9b0RNHF0cCqlZNir58A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

There are two duplicated calls to cleanup_domain_irq_pirq in
unmap_domain_pirq.

The first one in the for loop will be called with exactly the same
arguments as the call placed closer to the loop start.

The second one will only be executed when desc != NULL, and that's
already covered by the first call in the for loop above, as any
attempt to unmap a multi vector MSI range will have nr != 1 and thus
always exit the loop with desc == NULL.

Note that those calls are harmless, but make the code harder to read.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The logic used in the loop seems extremely complex to follow IMO,
there are several breaks for exiting the loop, and the index (i) is
also updated in different places.
---
 xen/arch/x86/irq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 032fe82167..49849bd7d3 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2383,9 +2383,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
 
         spin_unlock_irqrestore(&desc->lock, flags);
 
-        if ( !forced_unbind )
-           cleanup_domain_irq_pirq(d, irq, info);
-
         rc = irq_deny_access(d, irq);
         if ( rc )
         {
@@ -2419,9 +2416,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     {
         spin_unlock_irqrestore(&desc->lock, flags);
 
-        if ( !forced_unbind )
-            cleanup_domain_irq_pirq(d, irq, info);
-
         rc = irq_deny_access(d, irq);
         if ( rc )
         {
-- 
2.29.2


