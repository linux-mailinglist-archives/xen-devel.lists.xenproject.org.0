Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7E517792
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 21:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319042.539097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlc0g-0001aG-It; Mon, 02 May 2022 19:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319042.539097; Mon, 02 May 2022 19:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlc0g-0001YR-Eo; Mon, 02 May 2022 19:47:06 +0000
Received: by outflank-mailman (input) for mailman id 319042;
 Mon, 02 May 2022 19:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqVR=VK=citrix.com=prvs=1145c1786=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nlc0e-0001YL-FP
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 19:47:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c8c4a6-ca50-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 21:47:02 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 15:46:55 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BYAPR03MB3670.namprd03.prod.outlook.com (2603:10b6:a02:ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Mon, 2 May
 2022 19:46:50 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 19:46:50 +0000
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
X-Inumbo-ID: a1c8c4a6-ca50-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651520822;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=HB4Y8wJWBDAzylDxMDwxvwIlOKRQhdHJuvY1tOk96Xw=;
  b=JFhjFwgmh022LDHQLm1vZfe2/zrkkCAK5bnfZnTfQ2CCXqjj5ac3fvdi
   YuM+7q2IrX7ESXibhghTR8VltRGcWEqACTHPckogN3MDOhsKIjTLAIr6L
   rzYkYiCNk/dvCmylwY0S6Qr6EVXNjbffnCa+lCEW2i3X86yk24UnJkTP7
   4=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 70288830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 tq5m+6qeoBIuUZppg==
IronPort-HdrOrdr: A9a23:Quj+0aHy6nCjv0SwpLqFRZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJm58erwcpVoMkmsjKKdhrNhcItKPTOW81dASbsP0WKM+UyFJ8STzI9gPM
 RbAuRD4b/LfD9HZK/BiWHWferIq+P3k5xA8N2uqkuFOjsaCZ2IgT0YNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dzbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu17hPi7ontRrcenau5l+7f+3+40ow/LX+0KVjbFaKv6/VfYO0aaSARgR4Z
 /xSlwbTrxOAjvqDxqISF3WqkbdOX8VmgLf4E7djn35rcPjQjUmT8JHmIJCaxPcr1Etpddmzc
 twrhSkXwo+N2K7oM3R3am9a/hRrDvCnZPiq59is1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgm/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M1OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDaDhgPAJ6e
 X8uZNjxBwPkm7VeLKzNcdwg2zwqU2GLErQ49Ab4YRlsbvhQ7euOTGfSTkV4ridn8k=
X-IronPort-AV: E=Sophos;i="5.91,193,1647316800"; 
   d="scan'208";a="70288830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeGEtBK13Kr2uoq4U2hxP13PV69QjYAseZFn3P5vt9lli7q1Kf2Bj0lBtzhZQ0YzSU2nZnde9nvCsIQpCsag8b3X9+KB5APmo7s5SpP2JFjp1iU4maU1CNUlwlDDVqjsW56pAmGb3dxECF5oKWlRjvARk9dZ5PdFx9QZ8nu3PTIU6KwkmldxTE63Pl1AWNPl5cnB6MLAZ4FVVn21R5TD+3O+MZTOT4lchKypJB0qnD3iHJ3Qj0TUjaU+T3x3Ptig6It8YHgnx/VjM5WF6yM2TGjbGSfTJsEFqcQdyfSCCNw3ZS/nVdSjlKkM2RCEirHY/zikbVzktK9BIa7lj9hbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB4Y8wJWBDAzylDxMDwxvwIlOKRQhdHJuvY1tOk96Xw=;
 b=b55twerj+FKZm+HqTTI9+9t31iisPoX2s7oHa0vrSAM5H0RoNJwi+TxB+XL8HLNbxnkO93fygJh8PCSNmTbOy/q8UXPtSl65+Iruvil092ZYibokeWC2/9b4MZoNaqU5ulU1Gr2g8PTR94vm3ZPo04F1liqE9dPSnYRwUtl3+CGhfpXYbjdByyhaFmVN03HTC9kLcvbIdOlVtxu+j3M2fX+W9ANJY7k+K3bAcpG/QIixcpnNBQTBjIkILrhJe/Otqkd4btoO4TO6p2PC1MReg+w8HAw0fQ2+78RzF7g23O5QHhfaqDVL1BPg6tl05o5HeRA4V0eCxGG36yQxMdsckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB4Y8wJWBDAzylDxMDwxvwIlOKRQhdHJuvY1tOk96Xw=;
 b=iG9dxqb5K+DQDFz6TGeIqzZraNFI0QSjeD6FJGHMVoHxX60/4kCJiX60U2rgLm7Yd9GV81eLNQSnkQ7psfE+m4ie56WalgEiph/KEpWIO48flz73D5mT8nlErNEY3nMr4JSIIz4f+6NCODvJvWIAYBnD1tswfIzcxPuIIKGZwmo=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>
Subject: [ANNOUNCE] Call for agenda items for May Community Call @ 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for May Community Call @ 1500
 UTC
Thread-Index: AQHYXl1doA7M8Ltyq0S/JPt3Y86FNg==
Date: Mon, 2 May 2022 19:46:49 +0000
Message-ID: <28B256D8-2359-474C-8AF3-0A2BC4CE1719@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11c4cd2c-6239-4871-b6f5-08da2c747fd4
x-ms-traffictypediagnostic: BYAPR03MB3670:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <BYAPR03MB36703DE6F662C3E353431C1A99C19@BYAPR03MB3670.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pBeYcKzQ5foSfcweWi5wKnh8j/aAqs9Ta5RcCTT5ytSHosJlWmG6/BZZyy4MQAfVSXFOl/E+fb6RXHJHHgO57qOpEhOSUP73Ds4V+qeipIffWRabHryjwjN65m4StK0bOa4T3JDzXiISWnKU+YhFGrnyYMhNpJ5pSz2bZeU7kdOqZd+GT2noyc0lSSGWOao7EQAnT+mPGMW8VCGLC952XreI/zGgdQLZMBaHS7ocfClLXXrxo3GqJnIH1f9vTqwg7TfLQ9lmLWV88rtps8zHVlfRogJPbLDFvXRxBomUNAFqdtDri6c9tvbGtmc6wDfRoLX9s0VLc1elYDL6UnqgWexJ4Jr2dKvVdFtF1tErTgAwqUGLfexy8RYViocSblYP9z/i1OtN10zwqImDTm1yx/1vfj2qJm3le1idArlEFJKz3bvw97N+VO0DReTCl0Tr3bZkRK0kTefAmhpEBrAmM+3K1+1LxvqrHxKktRp4APuGNhmHoivBZ3cUyXr6/3HgTWJZIsKdR4vj+rVRlwvB9+3qtvRHNxgJy1MkpAkGGoEIKhEctHzyFwiMnS7iK6lO2zHItkYLbzkjLpvFlu09Kn7JrSf/ExIRoYSZwVHE/9I/XpBlPaC5efxYx2oO0Expbirva9EwiVlh8taSb854efxfDXrT8tZZREs8/YtsRLu2Ozxy55qhTMGwKsueUDj08kWqgibYIIsBdHbJ4s1gMHthH5RoAptdCEw255u9rdDvKvdeWM+Dx1uQPbFp4dtIZS7SAC1WUPAMVpU76YWsSwF7MCFy96gRXQwGI3dkd16jD/ZPfaZQKv6ePKD7nBP/hFxUnC/1YZ2xY/lgugjrParT63ujFgBDFIjPphcCiapProOZrraOwn5eAj3NjLqgt1h6KpbGUbdQ9ApimhOw8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(82960400001)(26005)(966005)(38070700005)(8936002)(122000001)(508600001)(6486002)(71200400001)(33656002)(7406005)(5660300002)(7416002)(38100700002)(86362001)(2906002)(6512007)(110136005)(83380400001)(6506007)(36756003)(76116006)(64756008)(66476007)(66946007)(66446008)(66556008)(91956017)(8676002)(2616005)(186003)(921005)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW9ta1lxc3RFL09EMjBWSmh5cjNLVWtzT1g0S1VjNzFodTFEcFZVSEZlM05W?=
 =?utf-8?B?d0ovRDM1aG41SloxT1grc3owUy9zV3JoWlVYa0FDU0FqOVhQd1Fwb0F2ZTND?=
 =?utf-8?B?UGgzanpHanZLak1BQ2MzZHBlUHFUb1IrWWVwSHc0bWFTai9PRnY1L0g1ZTFY?=
 =?utf-8?B?aGJJa0JBSkZHcnRGdlFrT01RVVRieHJZUEVFN2FuRmppMUh3Q1llNGU2UXZt?=
 =?utf-8?B?S2pvbjZjWmc3NGdxRDYzRkRYdmN1b0xxWDFCM0NwS1ZFYXNnYkxRSkNzWFQ2?=
 =?utf-8?B?aVpPcEJXSlB2bmR1emE2RkNKa0dNWHpBVVlFdndaWGxUVHN3bjFGOWZlY0ZS?=
 =?utf-8?B?RWM5eVZuMFArSTJDbzV6aWNzdVFQRk5PK1haRHdVVk9odmJRVDllZUY5dlJR?=
 =?utf-8?B?TVRkN1N3ZmZpODdxTzNTZkNvNCtCVTRiMlpISCtvODBoaTJRbWRCYlZFaGFy?=
 =?utf-8?B?eHF4Y09FamNFbWgzMlByWHBxVC9vaS84TGpuL3lZMFFvVWF1cFhmNElPWFRL?=
 =?utf-8?B?N01zMFNnbUswMjVocXFCQzJ4WlgxYVFRa0hjTkYyVlYrSVJJT2hMbFRsQWpV?=
 =?utf-8?B?WXU4OWZ4SUlFZFg5MjkzaUZQRVRTUUxXb1B1cnFRU1pWY1BEN0R3UTVMRDdq?=
 =?utf-8?B?NHpLZEt5eXR6SFhDY0NCUmp2ejhXR3ZHOFNLNWlpRHpYeU9ZM1lmVnZuWHJQ?=
 =?utf-8?B?RUhzMDhyTXNPVlZXRDhyQTh1NVM0bXF1R3NSc0l4NWxlcGNSTUw4dE95eXly?=
 =?utf-8?B?a2l0YlliMDQzNUpOVDcyRUUzeHRlTTh2QjJoSzFnZldxV3htQ3dkSWpTR2lB?=
 =?utf-8?B?Uy9vMmYvVTNYcy9pc2R0dW5kSjd6WkY0anV6TVI4SHJWdzNGMTZjblhVL0py?=
 =?utf-8?B?MmZNNFU0MzJrdnh2SXhSY05vVGFTVFcyZmdKQWpKVkZqbFkyL3JjS3hHZmhQ?=
 =?utf-8?B?SWdIaDc2MXF6YkpTWEw2ckhSeEVXVzd4NFBMNE9lZW0yeldwcEllbzN4dlRM?=
 =?utf-8?B?MUFoTmVKZncxSndieVBJYWt4TGIyaWp3RW1nVkR0ZWtCdGtlWlFOVXFVNDJi?=
 =?utf-8?B?Z1NQSFVpTEk2K1hWVVFJSWovK0dCZXJZb1o5UGVjZzR2OWo4UU1LNEsrQzBC?=
 =?utf-8?B?c1R0VWEwc0VPOG5vS2xjRkFZU2t3WklBMllUU2NOeGlXWDE3TTV0NGpLekpj?=
 =?utf-8?B?bTBFRXlVS2xJZU0wQUt3UTVzS3I3MExJeS96KzdzUTlOdlJMbGtIRnZENW1P?=
 =?utf-8?B?SS9xTm9PTHdRdW9BMmc5cC9hMXZhOURZM1FINExCZ1R3ZEUwblFEd21ZMENO?=
 =?utf-8?B?V05BcTBtaWtKSHhMek5xUFBJUUpUSWs0ZTBtU0FiNGZkQlB5aHc1dlNpTFk2?=
 =?utf-8?B?bnBlaHVCYXFGK2JIdUxIdnFoK2dnWjJZV0ZidVJZU3I3NjRiZXE3WW9OUG52?=
 =?utf-8?B?b3M2SlQyeWNGdWR0V3lWR1VabkM2WXQ4ZFN6OXU5eFJBSTdQcGxtQk5Bd0dL?=
 =?utf-8?B?alZtUHYxeUlUVDNwNGhEcWtXcGM0eTdqVkt5aGhvakZ1bTFSYVhOVkRPa0Ur?=
 =?utf-8?B?NjhyczE1anYrY2o5SHR4Y2VQdFRGSGhDK3NuUFlpQXZ2UmljcDk2amZOOGZp?=
 =?utf-8?B?M2xQSlNxWnlxMkhVeWlybEU3aTFJdFZMd2lsQzRkL25IbDBiNjVoMlBYYVdx?=
 =?utf-8?B?dlRyVzdObnBBS2pLcXVNS0VIajVIVFppbW9OYzdMQmJ6SUVzWW8zZHc1bFN6?=
 =?utf-8?B?RGZRNTRNU1BZU2pjUEgxL0Vub0ZYVTE3dFNhSkYxLzNiKytLLzBhZWc3UGRI?=
 =?utf-8?B?ZGpNS05ZQTFEbmoyNmpwRlZDREsybElFelZxT3pQaDN2Qk41REJ4VVhCV1Vk?=
 =?utf-8?B?VG9NcXpoakJ0Zklyc3FGREorUlhCL001RmNYdnRpSWd6d1JJUkx1YUcraUNi?=
 =?utf-8?B?eXlGOUxKVzArQWttMTJOUG8vejA0d2JtVGYvZDhtaGc4WEZkM0J0eGh5WU8y?=
 =?utf-8?B?Q1I0a1RMR3Fia1hLWGRYZUtheFRQMVpQQURiVzlaWFlwUmRDWkFKc3kzR05S?=
 =?utf-8?B?Y0tCQUl1Rjd2bUkxOFJ4KzhDUGl1QUtuWGRqeXlaMEtyOEQ0QVVFVnhxZFN6?=
 =?utf-8?B?Qlg3aU9FVUtmcG8rZ2R3QnB6aU5yQzJocmVnVVZCMUZ2eHFwanJySGJsU0w1?=
 =?utf-8?B?WVF1RmNpZHc5VmhwZEkxdCtqUGwxMUIwd29uWVVsb3dBUUEzTzNJc2h0aXBO?=
 =?utf-8?B?OGlUczgzWmx2cEhtc1k1aThLUjQ3aFpOaWNYeW02d3loNVhGYXNGbXQ2MWI5?=
 =?utf-8?B?SlhMQTd0TkVQd0pNRnlEa0pUVXRxTkhuYjNqU0tDWVprdXFZMng3OWJReGZ4?=
 =?utf-8?Q?Ne1xR0w3sn1Y4itY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19BAFDCA01EDEE499B96D364E62C2103@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c4cd2c-6239-4871-b6f5-08da2c747fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 19:46:49.8196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxAtXYFj24EvURbgV4MMd7PTz4mcJcU9fXw/jdun6AEVKQlvdqgz8YF+rt8uW4qNpJschdzeOVJbLeHdtOAddSvugUAE+ACAaVTnQL5Uz4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3670

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9VTmE2eFZKZ1p0RHNtc2N1OHIzUG1zVUkvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBvZiBlYWNo
IG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiogSSB1c3Vh
bGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3aXRoIGEg
cHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogVG8gYWxsb3cgdGltZSB0byBzd2l0Y2ggYmV0d2VlbiBt
ZWV0aW5ncywgd2UnbGwgcGxhbiBvbiBzdGFydGluZyB0aGUgYWdlbmRhIGF0IDE2OjA1IHNoYXJw
LiAgQWltIHRvIGpvaW4gYnkgMTY6MDMgaWYgcG9zc2libGUgdG8gYWxsb2NhdGUgdGltZSB0byBz
b3J0IG91dCB0ZWNobmljYWwgZGlmZmljdWx0aWVzICZjDQoNCiogSWYgeW91IHdhbnQgdG8gYmUg
Q0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVl
dCBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZS
RlB6MHNSQ2YrLw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQoNCg0KPT0gRGlhbC1pbiBJbmZv
cm1hdGlvbiA9PQ0KIyMgTWVldGluZyB0aW1lDQoxNTowMCAtIDE2OjAwIFVUQw0KRnVydGhlciBJ
bnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93
b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDIyJm1vbnRoPTA1JmRheT01Jmhv
dXI9MTUmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMgRGlh
bCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vbWVldC5qaXQuc2kvWGVuUHJvamVjdENvbW11bml0
eUNhbGwNCg0KRGlhbC1pbiBpbmZvIGFuZCBwaW4gY2FuIGJlIGZvdW5kIGhlcmU6DQoNCmh0dHBz
Oi8vbWVldC5qaXQuc2kvc3RhdGljL2RpYWxJbkluZm8uaHRtbD9yb29tPVhlblByb2plY3RDb21t
dW5pdHlDYWxsDQoNCg==

