Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F574AD4CC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267825.461580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMlA-0003xq-JM; Tue, 08 Feb 2022 09:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267825.461580; Tue, 08 Feb 2022 09:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMlA-0003vL-FH; Tue, 08 Feb 2022 09:26:04 +0000
Received: by outflank-mailman (input) for mailman id 267825;
 Tue, 08 Feb 2022 09:26:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHMl8-0003vF-Re
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:26:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2038df5f-88c1-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:26:00 +0100 (CET)
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
X-Inumbo-ID: 2038df5f-88c1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644312360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+RiC2VHxm8WcM56jmXQhnODmrRPs4MeJjM/Pa0YftA8=;
  b=dqZWFT0dcbWhyylafQf6TuiL3479oK+6fO+5f87elLsJtyqPtvgzIbXe
   LYmkFGlFvmbxRjA3qSgSU4muBnVrLKCSK+gA+fdTdU6jvWQhELpl2zwbz
   1f9SxC1eF3FpGxMaETn136SLddt4KsJJkIqAZlqN0edBf0VGj5GdMxJGP
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: duqTkEAWY6JC39m+fQ2zp6vkPdZA/0V78He+7wYhiHchIX5vbuh7ptFjeq/d+hx15D+opqqphI
 2Fa5J/H4wwpywvUDrMV0q+7WhZgEb6A9CeAeNqKACbZsDKvJ2oD5lgzsMEKU4QC4GfXGzoQZ93
 lCm/B4ILgHGoOsLlobVEMySUaByBilCOsn0+UmtywLo1I+TvrlcFu6WKECMsK5bejThQ3ccGdk
 Qgzp2LZNsfQb9iDFhmgWSEEZf9NvQ00QjbvdP0SBNCGW97/vE3opDIL/pLKqNvZC/esP5r3yLr
 f4oM2y1LR62V3A0qmOrBAYPD
X-SBRS: 5.1
X-MesageID: 63716404
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5RQB460y969YI9WTOvbD5e93kn2cJEfYwER7XKvMYLTBsI5bpzEEz
 mtLCj/XOfncNjShfdAkPoSyp0MPvJTSz9A1SwNkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w75h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhoo53l
 e1PtpqMWV1zEfPhltoRQxdjDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QHhWls3pwm8fD2W
 NsiWzY1QBP6chxma10cAaAVs+avvyyqG9FfgA3M/vdmi4TJ9yRp2aXpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2AmlqlnPPCmBT+SY0bFbCm3vNyiVjVzWsWYDURUVa4uvC/hlSJUtRTM
 VEP+iEuoK4x82SmVtD4GRa/pRaspBccRt4WCOw85wGlw7DRpQ2eAwAsRDNbdMYvssNwQDUwz
 0KIhPvgHzkpu7qQIVqf67OVoDWaKSUTa2gYakcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx750ai8IRjf3jpXjIhjutot7CSQtdzhvQWmWp/wZofrmvboaj6UXYxftYJYPfRV6E1
 FADn8Wd9+kIAYu6iD2WQO4NEbeq4N6IKDTZx1VoGvEJ7C+x8nSueYRR5jBWJ0pzNMsAPzjzb
 yfuVRh5vcEJeiHwNOkuPtz3W59CIbXc+crNa67SM+JMYZ5NZFXd039Da3Ccz27Wjx15+U0gA
 quzfcGpBHccLK1oyjuqWusQuYMWKjACKXD7Hs6ikUn+uVaKTDvMEOpebgPSBgwsxP7c+G3oH
 8Bj29xmIvm1eMn3eWHp/IEaNjjmxlBrVMmt+6S7mgNuSzeK+V3N6deMm9vNmKQ/xsy5c9skG
 VnnCydlJKLX3yGvFOlzQikLhEnTdZh+t2knGicnIEyl3XMuCa72svtDLspuJOd2rrU4pRKRc
 xXiU5/Rasmjtxydo2hNBXUDhNAKmOuXafKmYHP+PWlXk29ITA3V4N70FjYDBwFVZhdbQfAW+
 uX6viuCGMJrb107UK7+NaL+p3vs7CN1sL8jACPgfIIJEG2yq9cCFsAEpqJuSy36AU6YnWXyO
 sf/KUpwmNQhVKdvqIaQ3v3f/97yewa8d2IDd1TmAX+NHXCy1kKowJNaUfbOejbYVWju/76la
 /kTxPb5WMDrVn4T22alO7o0n684+fX1oLpWklZtEHnRNgz5AbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWsaY/LnLl6XIl57GAS0hTYUWB0XQPMLtvPYo56
 u49o8pKuRengx8nP4/e3CBZ/miBNFIaVKAjus1ICYPnkFNzmFpDfYbdGmn955TWM4dANUwjI
 zm1gqvehusDmhqeIiRrTXWUhLhTn5UDvhxO3WQuHVXRl4qXnOIz0T1Q7S8zElZfwCJY3r8hI
 WNsLUB0e/mDpm86mMhZUmmwMAhdHxnFqFfpwl4EmWCFHUmlUmvBcD80NeqXpR1L9mtden5Q/
 a2CyXajWjHvJZmj0iw3UE9jivriUd0uqVGSxJH5R5yIT8sgfD7ooq6yfm5Z+RLoDPQ4iFDDu
 eQ3rv17brf2NHJIrqA2Y2VAOW/8lPxQyLR+fMxc
IronPort-HdrOrdr: A9a23:ueDOzKOF7aEm2MBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63716404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtwGoMKlLchC9swiGRV48AfCvSbSKvxFrW7kxONUYeMzKdyRoYoJgdsJVMCOYhM7tDkKOk65GA8DXyBTzrTLGKW75dHU0kdBaAD4j0rXP3HkdM7lWGLZAXMIHx/NMivjHiF7EScXVkBNlbRX+sx5DStdDdgDHQx+aXB6a4KOWg+0TlAmIS4RdEwsVzLlH8UTXto58KfiLDbFSjkKLv8Z8nCAkTT4pu67Pd1aVEnhT42CyjV7L70WGkbbIxM2+KflsuTPuSM1jPkpXJPcctXGsv3KB9x9mcmv1WCOgMDSyp3ArvV4yUHq4JmcfQz2Gkyh0HZ7kCVanQ7L8h1/zwZJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1uydbG08brsvWdTFBdPcdk9rw5bGcVGZh9iSwCT3n8=;
 b=LxhUBEMEBxivQHRqJXvaiYrmCNTQMX0g6cJGolxu/QqVr2/RXsqm6ve1WCelZwufm5WUYQdib/nypHD+KvCXji/48AOpHxhpRqr129kv65qNhGhHJxEurFDOwRFYws/CjmlOw1igNYUwaUwS32yZaInyYY9oSVrsOVpcWotBW3UHTU5thMmptX/82uplhlm/3p8uyUet+thoZlNUTtZnJ7TPGdGubvz4VVs+eMILvPLjSIC6VxIHMt33o/t73iHQRtokb1OiMz8l1Ga7qzID35hNiNn4VbKMHvWX1vTGFiCwZa6VDMv2U3U47YSIINzC95NwBjNDgBcwbD3lKjHtZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1uydbG08brsvWdTFBdPcdk9rw5bGcVGZh9iSwCT3n8=;
 b=Qu/mbtflgsGGjdkLC0FAfaSe4yQB3eSEvQSKv7OtUvSVcUO6b3/K9tLJz82EfrgiqTq8iiIMtXM5db8T3O0avUgNqStlGlsp7YVVEs54tpuAlCt8dw/u0baJsval0m5bX9FKPZhjuU9YPpgSYNgQ5+JAq42p8QsCInHxqIjLqU0=
Date: Tue, 8 Feb 2022 10:25:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <artem_mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Message-ID: <YgI3HpFffudiEmNN@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220204063459.680961-7-andr2000@gmail.com>
X-ClientProxiedBy: MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d4b2a58-e0cd-43dd-7f6a-08d9eae50240
X-MS-TrafficTypeDiagnostic: CH0PR03MB5954:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB595482E98239AA5FB6CA9B2B8F2D9@CH0PR03MB5954.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0voH+QvbH4CQYRnBMPx7PP2HJ3Sdx4IzrZKuymcHkDGWyU0/+WoUMk5DoOk+D0UvG4pw6yuTCqA8thLofwJNjsGFw5FYNK5OU13gHhzAX7X1AghNeVcmFVHuubJSEPkdZx+Zdlb5eIgMd/pn8GrYB2skMvlH8Ghl2VjSgOYn8vdf+z8AQdRjMI8/CbUjYW3MWaezEEHyb+DmdVgWiHbSsH2/Y5fd0SoSWyXopAzw1lGBA4p4s4eZHa8walUnoT9Owl45xu+7loc0oWJ8eUT9jelG/iMQxVD5i/B+7f8jJPU07qJsX/wTqchV+1/Wp3sUoaJn0Q+tz4TZWMu1c5sb3w67IJVUKkpJIZnS29aAFlRkbEkOP7IgVA0PiejFXEaTnUbr88qb56gxQtyIQXv5HlhN1plXjmSJgiQogcCUsOvIxlkg2uRWIOW4cb67sAhJ0NuXRjkhajB1UZxzN0GvRfZB8CO7MA4rdhC/bYnC/Dzz6ElRxXqBFG3wjMEk8vZ0inMKy9+aEo9m0necxbxPYhxKCu7UJJHfgFBDfoT5848m+1WcOFWrpViZxgpBeoby5zd/nifpGViVLZ973uQgzJL3gkJPF8ZK57UcbSbDBPWbyyAqZN61AcStArOq9dbDv8XkEnGEOekP7+MD3JBF0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(66556008)(66946007)(66476007)(6506007)(6512007)(6666004)(186003)(26005)(6486002)(33716001)(86362001)(4326008)(9686003)(38100700002)(82960400001)(8936002)(6916009)(316002)(85182001)(508600001)(7416002)(2906002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TisweExFQjUyWnFtQ0t2Qk5JQmREalRnSTlrdldtZWUyMllZQWpYUXFDUXNz?=
 =?utf-8?B?K1FvRUxXZHdObmtIWHc3d0pjbTFNc2JPQmxWUS9SUnFVNi9CRWVmK3ZUTWMx?=
 =?utf-8?B?OFlvODRjTTBwN0phZ29MRHVQS2JPdit4Z3p6SWlWYXp6eUJsT000SHlBc0hK?=
 =?utf-8?B?QStNRzc3c0dqZWxlTmZ5MndnZURyVGdzSFJWdyt1RVBuVkNOZUdWMWpwczVt?=
 =?utf-8?B?Q21BZE9pNWtBMnVFdmU1amxRdnNrRktaM2hsVG90Uk8xV0I3amYxTTk3dkdv?=
 =?utf-8?B?bkVmMGtzV1VPeWNZZjF1RlZvV0kxUHJCdFVHbk9VQjZDODZCUXZjQThVdUFT?=
 =?utf-8?B?Rm9GVVZNZnBSand6dmxheUk5VUFNY0c2dnNUZSt6N2g2d3J2NnR2dWlmRzZx?=
 =?utf-8?B?Z0RJaXFlQ09VandvZER2S1diWjdkb3RhZ09YRng2TnJuZmNmSDlEd2p5L3FX?=
 =?utf-8?B?MWpUb1lobmp1NUhYZVNCUXk4SzdSMVJzeGYyZkJuZmZZenpFQmxYRVJha0Jq?=
 =?utf-8?B?V1YrUWt3bThwWkZmQkNOKy9CdkhHbmZSV3llbFBZNGRYK1JDWnQ1T2RVUGU5?=
 =?utf-8?B?RmFBNFI5WTBhQm9veWpSTGNNaEx1VFI4dG9HeFd4b0c0L3pvSko4VHJVUnBm?=
 =?utf-8?B?bC9nbFJheG5wWm9lKzVXRVVQYVpISEtBSDdBUmx4c2E2ZkxFZDVGWWpqZzBq?=
 =?utf-8?B?SG5yaXJxNlFUdDZhNGRGWm5VRFBRNmxlU29lemJWUy9KOUZ6eFlNZkhvNG5w?=
 =?utf-8?B?aU43STUxMGJoeHkzWmJ0bTByeXpMdXdRbEl1SnNmQTBZZkF5K0t2QkdPVWF6?=
 =?utf-8?B?NXdPWTFDQS9GTkhNOXdtU0wzZVgvZVhxd1VrL2plcDRwcUJyL2tDN3A0aE9N?=
 =?utf-8?B?Q1pURnY2T3pEWU1KSnV4c0tncEVJOXQrNGNoN3M4eDFNS0g4NDhPTkk2Zm5U?=
 =?utf-8?B?R2JSeFl6UjZOUUlwY1JqZWNuUEZvR1ZOS0RrU3QxMHREMlBRcFVQbEF5cHVI?=
 =?utf-8?B?UkZIOSs1YmlFSjRqWVN4WjExQ3NueEJRd3lESkkwWVl5aVpkcy9tcWtidGRr?=
 =?utf-8?B?Z1Rqcmc1dEJtbllsdThkNkkvUDFESVFGUjJDNFpQQmN5Q3RzOGJub29XVmxK?=
 =?utf-8?B?MHZTMmFWR3BsaHlGRE1GNHJaUXJqQzdGaDZqQlp6c2xmQjhtRXF1WUQ1Vlg1?=
 =?utf-8?B?bnpoZHg0RkFHb3VFNzY1UjVuSHZ4QVNsbElEcC84RkpmQUJuaGR3TUI4WEhj?=
 =?utf-8?B?RFhKS0pMa20wWTk1Y0tSdHh2NFkrYWxRZ1pKcmE0V1AyQThMNURYVDZ4R25p?=
 =?utf-8?B?dmlISEdQNlpETnBjWEFQMGFYVzVpSzEwQ2dhY3hkYXhzRE9ZUjVtVTRXcXNL?=
 =?utf-8?B?bVRSZ1dZbVNWbzZwMUwxZ2IxbEpJdlE1TytLTG5aWmlGVGI2MlBrWFdjKzlT?=
 =?utf-8?B?c29ZeXBEdU5kWENma1hjczcyWWpjem0zbElEaUpTdHBQUU9CcjhEV1liRlpy?=
 =?utf-8?B?Y21hY3Ivd3l1TUx3TklkdFB1TnVrSVFvTDZsTElIbjAybTRxYkpKd1UvTzF2?=
 =?utf-8?B?TUQwVGdrandwR1ZZOUxnd1dzVTVzMmJDRHUzK0tvZzlPZUFZVnFka1NPWTVX?=
 =?utf-8?B?Y2tZaTN4SlliYWlkMjFUMUR4WUlOK0lvZXpRY1l6dzhJR2ZHVnFKR2IyYXBn?=
 =?utf-8?B?Q3NHbk1WRFY3RThadW81Z2wrNTRveVJ3MDAvZFV3Z0F4NWhIRkpzWWV5WkRo?=
 =?utf-8?B?Sm51SE9pVzNwaWpaNWVDV3hKS0p6enJWY05UT0d5MVMyUklmRmFHVUdGbWtk?=
 =?utf-8?B?OFU5WVN5dGdUc0ZsWlZMejN6TlFsT0pWbTI5YkNRRzkrYXpYQzFGTHF5bEc4?=
 =?utf-8?B?MUR5RGxvTWMrYTEvQks0OEdBQVhVWUtxR2V5blhUZWxLTVpyVGdUWHhiTTdG?=
 =?utf-8?B?Z1FFSDRib1dCU2JnVUg1WXlqaC96RDYwdmdNcllIbWV3MEY2aGxkMWZrYUhH?=
 =?utf-8?B?T2o3VUFhbHRLYURrUC9FblJsWld6VTFLcU1BYVZ4VEcvektVWks4dE1FYXdH?=
 =?utf-8?B?MWNRdFNRK0x5djVwdDVrUmFzTDh4QkN5NVJDd0tRL25XTW1aOVdjSlpDbmps?=
 =?utf-8?B?VDVreEl3VTNRdEdjZDdXVzBZeVArWUQwS2xEcGR1WFpmSWp3dnlxUG1ncjky?=
 =?utf-8?Q?HK/mEL5/cBoi3tn59fLZjcY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4b2a58-e0cd-43dd-7f6a-08d9eae50240
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:25:55.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LIey/VCTZL2iekks3UgphwG4EWmvMhY2GCASZXq8nXqKCi5pgHvrZ+X7rIMBO6V7RxF0HHKmPII33I7lC7HZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5954
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 08:34:52AM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> All empty, IO and ROM BARs for guests are emulated by returning 0 on
> reads and ignoring writes: this BARs are special with this respect as
> their lower bits have special meaning, so returning default ~0 on read
> may confuse guest OS.
> 
> Memory decoding is initially disabled when used by guests in order to
> prevent the BAR being placed on top of a RAM region.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v5:
> - make sure that the guest set address has the same page offset
>   as the physical address on the host
> - remove guest_rom_{read|write} as those just implement the default
>   behaviour of the registers not being handled
> - adjusted comment for struct vpci.addr field
> - add guest handlers for BARs which are not handled and will otherwise
>   return ~0 on read and ignore writes. The BARs are special with this
>   respect as their lower bits have special meaning, so returning ~0
>   doesn't seem to be right
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 131 +++++++++++++++++++++++++++++++++-----
>  xen/include/xen/vpci.h    |   3 +
>  2 files changed, 118 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index bd23c0274d48..2620a95ff35b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -406,6 +406,81 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_reg = bar->guest_reg;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
> +    guest_reg |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> +
> +    /*
> +     * Make sure that the guest set address has the same page offset
> +     * as the physical address on the host or otherwise things won't work as
> +     * expected.
> +     */
> +    if ( (guest_reg & (~PAGE_MASK & PCI_BASE_ADDRESS_MEM_MASK)) !=
> +         (bar->addr & ~PAGE_MASK) )

This is only required when !hi, but I'm fine with doing it
unconditionally as it's clearer.

> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: ignored BAR %zu write with wrong page offset\n",

"%pp: ignored BAR %zu write attempting to change page offset\n"

> +                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;
> +    }
> +
> +    bar->guest_reg = guest_reg;
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +
> +    return bar->guest_reg >> (hi ? 32 : 0);
> +}
> +
> +static uint32_t guest_bar_ignore_read(const struct pci_dev *pdev,
> +                                      unsigned int reg, void *data)
> +{
> +    return 0;
> +}
> +
> +static int bar_ignore_access(const struct pci_dev *pdev, unsigned int reg,
> +                             struct vpci_bar *bar)
> +{
> +    if ( is_hardware_domain(pdev->domain) )
> +        return 0;
> +
> +    return vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
> +                             reg, 4, bar);
> +}
> +
>  static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>                        uint32_t val, void *data)
>  {
> @@ -462,6 +537,7 @@ static int init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
> @@ -501,8 +577,10 @@ static int init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>              {
>                  pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> @@ -516,6 +594,11 @@ static int init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +
> +            rc = bar_ignore_access(pdev, reg, &bars[i]);

This is wrong: you only want to ignore access to IO BARs for Arm, for
x86 we should keep the previous behavior. Even more if you go with
Jan's suggestions to make bar_ignore_access also applicable to dom0.

> +            if ( rc )
> +                return rc;
> +
>              continue;
>          }
>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> @@ -535,6 +618,11 @@ static int init_bars(struct pci_dev *pdev)
>          if ( size == 0 )
>          {
>              bars[i].type = VPCI_BAR_EMPTY;
> +
> +            rc = bar_ignore_access(pdev, reg, &bars[i]);
> +            if ( rc )
> +                return rc;

I would be fine to just call vpci_add_register here, ie;

if ( !is_hwdom )
{
    rc = vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
                           reg, 4, &bars[i]);
     if ( rc )
     {
         ...
     }
}

Feel free to unify the writing of the PCI_COMMAND register on the
error path into a label, as then the error case would simply be a
`goto error;`

Thanks, Roger.

