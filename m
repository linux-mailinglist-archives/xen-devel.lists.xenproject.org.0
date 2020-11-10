Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5479F2ADECA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 19:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23805.50788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcYk3-0003kG-Hf; Tue, 10 Nov 2020 18:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23805.50788; Tue, 10 Nov 2020 18:51:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcYk3-0003jr-EJ; Tue, 10 Nov 2020 18:51:43 +0000
Received: by outflank-mailman (input) for mailman id 23805;
 Tue, 10 Nov 2020 18:51:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcYk1-0003jl-PL
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:51:41 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a889c701-fdee-4cf5-8140-dd9cb0268063;
 Tue, 10 Nov 2020 18:51:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hJ2u=EQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcYk1-0003jl-PL
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:51:41 +0000
X-Inumbo-ID: a889c701-fdee-4cf5-8140-dd9cb0268063
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a889c701-fdee-4cf5-8140-dd9cb0268063;
	Tue, 10 Nov 2020 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605034300;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0P6BlN8n/8fhTncKKRPXaKVHd+tjYWSua7+ozKfPa80=;
  b=QetTIpN3BSW4tRPa9qogqRS4wNsS0lTUBDWyHCASK/JSmqClIBiZwv++
   4nGecsPPHqnLD/bMdMAGhyHCmYNmO7mb4KZBpWu4AQwD4efRJ08YzotID
   OPzpHARHk4Px6TyskIP/l8m87ssPDHeTt2GVh0HRgTeSuL+4SJRX1MvsO
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o17djuEm1RRlhW49kXB4Avl8jukOcbz0XEhvBFu6/qsTfYnb34wTy1KSM3OaH95Rk667b84q74
 l81XlFX0utWJ6kpseFje0VdOpZp7kPTVUflePAg2v9Ri7S1PT/bvCXhYDAFP3qfDMLzsduu1Sb
 xvnt4GmBx1K6z20fLJRlf8PzDU5yd/MAuyBKzQHHrNwlP3io/BXL5gXlIH3ams7BTTa0ofH/1m
 ieiAQ67imvTb2BHigUh9ASiGo8HWUKSeGYeAdvI7pdNp18+MJVBvRPXk7gh+P32Sk32mz3YDdR
 Udw=
X-SBRS: None
X-MesageID: 30888593
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,467,1596513600"; 
   d="scan'208";a="30888593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTbNWarrxeOz001mIWs5lLmekFL+sUz+CsRW0Eb+opNsV/n/P+u/xDKz5dk0umn+6nhYERW1oUb++ZGVNciFBOD+0beOYLMLuTXTGavvCsDmOqpcuFIfoaTHmN0ypmAdz279lu70rI5VYg7qFY109teyJ5b/y5WYzJLFjQo2ZiVAeibLMT4wW1ABC1cXISlTFRg7lOKth+VnogduGuWtL5k2KwB4SEEsezowhH4vG1IpIrXg5JG/MA9Kqn4LgqHzusK1ALPQsv0+LXgiK0UJ+X1rfONSUjmHszCnjss1g0clsdvqNl5PzoNDtzRPS8zPXV5yqwsExzgDhZUtCXXHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YHXVbQzTETfPdfk2vrhXNMgP+PXS8KsCn+gPtsESqI=;
 b=PeMLWKFsVFl3+mVuyumBrZ+r+R2YlzDKIXLoRAPBJjCoCp2KpDA7PTq5spYiMtAgZu9R2YPpd9PWs1RMODGH3Ht8IUskOr2I4MbRN9jXGBkZ93NBldjQY1K/zrLRcowYGqgTQSNsaDG89sUyBliwuWfYfZy3B8oqzt4Ko3WjB3b4X4WJqUy5P7uxkI7kozEOfPn8bIJNAtZgi3PBuDmBM4zHZHRN3r0WYpf6M2q3rEbzGbIYSC0C6aapoGF+cFBGmYDaHr1y/Ek5CRrw0AY756Du2NsKz5KeTdM0UnVKg1ty2mejYvNLHa9YBhHBTTTSyU6lkMRnf286I2pNZH4Q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YHXVbQzTETfPdfk2vrhXNMgP+PXS8KsCn+gPtsESqI=;
 b=t9xhyWI7JP3tGcHXH2NifljWsfjoQsDpeTQIAMey2UgdeyuAlZq9EzpjovQPy9pyu8XnXci4YgYBFyf0dhwd696SILyV1S1zCMZNc5lRWqveUcQJk3WnIv2RaYeH0XKPERsS564tJVruczJHd3EF+6ukkN6iotk+lbpE7JjHvJk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] docs: fix documentation about default scheduler
Date: Tue, 10 Nov 2020 19:51:29 +0100
Message-ID: <20201110185129.5951-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 324a52ff-fe34-452a-cb82-08d885a9a614
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35791762AE47DABE5E5D03878FE90@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWPZa/JkDcc+DdTdqgv/WEal2jsJcofeY4SBfkep00AhXQSWuvnSS+vFwEG4j35bljllY91vJwghRyuGTqX0FxFn1aqZEdFupAxdSQO5/FQEhMMDIzvh+H+/DmIkuUR4/Z18fMQz0mGGr82N7N8NbHZuJmGL0qUfi9y96wgLnuQx0CVgg78vBjdpNhmF7NXmEuroGOpc3TPvv6jMZL/0XUVBLxRij2gTm6XFtpmd4vpnRyPpZ/Wupaer5fbA93jFEAEVuiLzAy1aD6tDX1HJK1A5fRpYUqbO4Zt3xiEFIzHALTO3yQHZQVEKu5KQvju7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(83380400001)(6496006)(186003)(2906002)(956004)(8936002)(2616005)(66476007)(66556008)(316002)(6666004)(1076003)(86362001)(6486002)(4326008)(66946007)(5660300002)(6916009)(36756003)(26005)(8676002)(478600001)(54906003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dl/LrfQEFZxLik3NabR8y8UtpI5X3yYZEYR1QiUEJ110JLHbEZsZwAD17mvZRwAZkgVXVUio7aj+uCMhJg1kcLOufmb7OB4jwcLDdmHMMpBfEJinw22g5e4MGwrMuRV1r2+lfz+KqUK63zsoxE/ghFbcKOjTcr3k6BfjK/6s4QI6jZ5AL+RWuzE2knt1DsexzU2DmNFVgv4BYwjJz9jw4mkErOV7sVkYhnMzu5QF2tIMYkia9HjOWtnPSiJhFghWqlka9AB2+o3hA+DMwhuDLsVOLf3aNmvk3vvJk9NJ+z03OzVh+o/p/cweWGkuNEiqBKx91IEU67E2BgoMffES5HSWUSBvvTwDGZOHFYraFG34iOJrZVM53tqyi/YcXTR1AvHKBUWu3zO9Ee8ojeTnRIMCkplB2RajZfLnuAzxUywN02Pvr+Oqitxlu1iTyymxDNfc3Agvn8NEpc4s9Mh1ZTPzeah0V0XdWLUVQRrysMeXTJM0lt38/4UsUeE0NKvspB2BqqcLpULFSZTLVdr/B9J3gBtDCI6pateDO+eVF8RcQhV5+7SN04kpHGmFv+7G4PtbuvjFPcBvWS0gxpf5Lp6W0UdpYTxyw5i+TfSoqjD2ymnJyNbU/HndZXFo+N/RDeXd6qKamGF9XMFMon9L8NPaRB2O06mjKg3Kx6KTLe3YsF+uEf1kuh0OwIBJ+07Cv7xHYw8Z28WFumdT5HKyN4HP+F4lOMqUheVojakQl0S5noY7Tn8lQzWn9iF6RojIkGn9IgVnw9CHEme4nnUAWloOYWhzh09GMwBOJPoTN3V7sFb4UpRuHr10oq5v1c6LsGQPu7Fek35VTKWdKv7w6ksHV0GZc1fOQE9PKAlLZi0+kltHUhf7Tcs7PDZH8aTeECVWhGrxUqXmYtqIEhbWQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 324a52ff-fe34-452a-cb82-08d885a9a614
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 18:51:35.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EQlvZ0C15LTNEXTAoRZWslypuLCRUzuLPwHf5mCDsYm2IhzwYpTkaRrmeBxguvFj3wP0yGBSvU63l5ejpbILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

Fix the command line document to account for the default scheduler not
being credit anymore likely, and the fact that it's selectable from
Kconfig and thus different builds could end up with different default
schedulers.

Fixes: dafd936dddbd ('Make credit2 the default scheduler')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Point that the default scheduler is being selected by Kconfig,
   don't mention the default Kconfig selection.
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4ae9391fcd..eb1db25f92 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1876,7 +1876,7 @@ with read and write permissions.
 ### sched
 > `= credit | credit2 | arinc653 | rtds | null`
 
-> Default: `sched=credit`
+> Default: selectable via Kconfig.  Depends on enabled schedulers.
 
 Choose the default scheduler.
 
-- 
2.29.0


