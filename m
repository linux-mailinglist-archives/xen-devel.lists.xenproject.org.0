Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A501B437A5A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 17:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215149.374161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdwqR-0004R2-Pr; Fri, 22 Oct 2021 15:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215149.374161; Fri, 22 Oct 2021 15:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdwqR-0004PA-MD; Fri, 22 Oct 2021 15:52:35 +0000
Received: by outflank-mailman (input) for mailman id 215149;
 Fri, 22 Oct 2021 15:52:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDp0=PK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdwqP-0004P4-W9
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 15:52:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10c2693e-3350-11ec-83c8-12813bfff9fa;
 Fri, 22 Oct 2021 15:52:32 +0000 (UTC)
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
X-Inumbo-ID: 10c2693e-3350-11ec-83c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634917952;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=we2BhKjzoFXAOlmT/hBXnwuOebK7emDYZXFaU/OTAK4=;
  b=Z29s/fJxsSTUI+QR0gDjVZ4no3c03R0imUYXZp39gEdFhUIu5FhWKLnD
   Oo8Z9tj1AOCnAWyW1cYBm0o/6nXbyOoWScl/7pb2afw8PFx1CK5bO0heW
   eLA9CAPyBfFn45KmbSqN4E6xTYggBLYuxuyf7bTfu0+7y45gJQSlw3lR9
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WG48G83o0OyCUXGE+D7Lw0XObAZ2fDvlxmb2kd6cJA6nELaA61Je77OkvNmKtKiW38kzDAPH2r
 kueWSt6qt5k+VlLqge9ZsLDTbdN8zYNHD6cFwbdrZGhQSdd480gautFWyJSBZDJ9NyBDmLcXAy
 OpCOcFn4lJ+cA8/AfWt/02T+yXozDFPaWbDRwXMxxvUQHTTiULHXVqxjhOmvZbukIFdRtWFEa7
 XCs7EqcfzwP6LJCjKpwZqrM3TMDi1yUPBtHK8EUHrBGBHosZfrL2lj9JyTrSc37weZpBv9MPAy
 zUUQwRCEVbyWaLwLcRAjt+ih
X-SBRS: 5.1
X-MesageID: 57762104
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UlRrs6n+RNzznrELmNyARjzo5gxpIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWWvQa6yIZGr8KIskbonip0gFvZXTx4JlGwJu/is2QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQy2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9hqZ2aRlx4B6D3k+otQUNAHBklFJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpv2Z4URK6CD
 yYfQWNLZQ3HPABMAW8aF7RljvyuoUbvXRQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wv
 mvb+0zpDxdcM8aQoRKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1IKOzxqYLGdfHwdMU9cohN1sXTMSj
 XawyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/9lt1kOnosJLVffv1IWsSG6YL
 yWi9XBm390uYdg3O7JXFLwtqwmnoYTVVUYL7wHTU3PNAuhRNdP9OdLABbQ26599wGelorup4
 Cdsdyu2trlm4XSxeMqlGrll8FaBvK7tDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0KuM8PZST6NfQqMupd7vjGK4C6SbwJsdiPNrJzjmVZLlfbrEmCm2bAt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riv+pUJLLbaf1I6cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1piYETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:Bh2dJa82+uSXKK/Xf4puk+FEdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhUdPj2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfYp1P7orhJRGdZE8qPuMex7wqC33QRavyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.87,173,1631592000"; 
   d="scan'208";a="57762104"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfVGkhvg2UWuRNCfIyLQoz12dlH308ATdsW01HiteQq5ONdE7nWTNfT2wweA66OMg7hip2/UbnSlvgLfVx0FFuQOf3JJ/ho1iazz6Le4OjtK82ytsUdHxhYm/QHasbQno8F8p3PtsGERzFf8R8HPauVW5JYiYCfCjEHpe3Fal6TcsGz/aaI5gIwqioc4aL1GaW1FzE0dpidBpnu8G5LABWDlc0TOiF2jYgOycxOL/h46cnlyglCAyLFZTJ6sHp17WT2aw3CDgu1GtPWLeD8pOMoN2oRxQ9lbPiyGc+qQDOXjCbiEyjatKlwRFx+Q6R+rqY9Y2lsk47W7xW6kh8LLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eynO/FBr2tvmU3OQA65XB5VhrKHqp3got2j/tUP0p+c=;
 b=ZBbmOWKcLqekHUgvXZ8Tclrlx1uUo12FB+Nyi+0SA3aLS2P2bNkKMEHh1pJME5IsUa0rIs+c9IwsTeTJGpnXAv5y9aq/9zHKHgI0ZlcrKM0aIjT94BXsMPZYNGgx1jzHcJX+KDIHHFH9gtBV6V+8TGA1XwsQpKgz0+YZiuB9LuMX3F9cdkQKOa1jFKv9WU/tvE4W4Je5s9YFwZFnKuEAwNT98xlqT5Cy3t5iflHbJZHYwx8j3GHwJzXGIv3ToQBBKGUxkW0ly+Tcy82d+U++R9g/QmGFcRJTnuvQaGYWuolFHc9QRSGwhFGYSxP51y95+69CMYY7aLjSe4NoYiqXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eynO/FBr2tvmU3OQA65XB5VhrKHqp3got2j/tUP0p+c=;
 b=Q0KYxKXjIOiqopZ8Gq+JXtGwcYQNzZfb9EVhd9TirdKgi3JfayWmWIa7LRXp0T4N20R8FMn1EARWqehIEsbwYrcEH5od+QEVVEBOYZmoEOTE4egFlx45726FO21+vwBgzLB3b3RIsIdFXHwcBgh5Ybabn/6c/3jaPgo3ATdDVIE=
Date: Fri, 22 Oct 2021 17:52:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
Message-ID: <YXLeMsuykEhSdfUg@MacBook-Air-de-Roger.local>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
X-ClientProxiedBy: LO2P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2288733-4c7c-41e3-afdc-08d99573f09f
X-MS-TrafficTypeDiagnostic: DM8PR03MB6232:
X-Microsoft-Antispam-PRVS: <DM8PR03MB62324AB79B0B5CEB32A824C98F809@DM8PR03MB6232.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+kSxwa98EtovYCQb7In47J0VI7weVJ034PRUuDT8RzvfLMmk8SfcJSNEdq/UG7FxKBrNBqKd860mtkgVt5gsloCj3CasvF2rT4+e28Z9F7tarX35wTwWtjNCfoZFI3ce+Dr/Uz57NItsCowPwsln8T3E6JBOfHxHgtyiUN79Evm9DoG2VKe2hZjGvzeNpepkhKCxO54gebBXLMx9c2GoymWHLU0j9+B3oxtES9GM2OGQwYk398mtsas/3Ln36nanlFOg7q1+NwLT6Mm/nM+c8hXYUS0InDeOnKZKLgqxmQ6RAP9VJppYSHUgz1a7NCYFtvxHMV6iZmys8ljxl9rI3Rlkc0J0qB9uI/ldxcHSljb3wfRoMrvKGY5jZ0TX8jC/ad5SvuoctWYFzysZRNqHdjavmoFyq64vKMOegfU13ME+i+lYehuTw494GcMQdPnxvQ8Mfuy6yUTR9ZnfIk3niQ6UkfKz+2zaCWrtLLfs+3wt48Zk7m9hh15nTBkar5iHuylPx86OUsGk3Ecdz9LKpOpd6wMGMXOjyDRBQQctxeFVHHkpaRfA7I/iiLJTRCjXeoLMQ+yk2IO5A0q+yTXtOrOkez6YxPWM19LKTziqbtiMJqrP2HH7teOVcjiwFWAaFXJVr6gA3qBwiOrxTWOkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(316002)(5660300002)(956004)(26005)(9686003)(6916009)(85182001)(508600001)(54906003)(4326008)(82960400001)(8936002)(6496006)(6486002)(8676002)(38100700002)(2906002)(6666004)(83380400001)(86362001)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BvV25WbjQ4S3pDN0lzeUhacGhoVER1NjlUSlBJcWNMVFZHNXUrTGVXaE1a?=
 =?utf-8?B?UVVwVGcwcUl5NWpwWm1NMXZiN1N3bkRxWGh2REx6RU9pOTdvTlduc3lOYVg2?=
 =?utf-8?B?RG1lNzBySjZRYVRqRW11dUx2dC8xNXYxL1k0ZVh1VW9ZZ0psbmtLVEQyZ3Bx?=
 =?utf-8?B?cjlIVUNmb1NXNGMrUm91K1FoSk9FelBRR3QvZHRPSUtOMnZXRDFyOTZTV0ow?=
 =?utf-8?B?OGFHOEd4UjI3ajcxbkw0QnZVQkw0dTRMS2JrOHFTV252Y2J0THI3UUEySVVu?=
 =?utf-8?B?emxFZjdETHFvclZlMWJJTW12VzFNZGtBWVMzSlNvd2hTbURrSncweml6cEhC?=
 =?utf-8?B?eGp3WFdkc0I3Um04cHdzTU1ucXE0ZnJneE1sK1Q0TkhFTHNFWkVaMmZmYzEr?=
 =?utf-8?B?VWpQZlVocDFHYXdHdWlsbmhhbkJRK0NMSFovdmJVeWVCNDIyY09ua0t1WG9o?=
 =?utf-8?B?N1p3WXZZT2pMaWpUVzNEaDJ6bmJtSlVCSmVyd3N2aDRMQjhhRFFZd1RNVjVK?=
 =?utf-8?B?a3J0bVJWMnBpTG84Ym5OTC9wVXh4cjVrZUFtWWpZQ2VTUDZlUXhNeVFYS3hh?=
 =?utf-8?B?dnFpUVNhdWZ5UmpEemRRUzZTU0xXWFZEVlIvWWV3a1F1YjliVW0wMG9qeVRy?=
 =?utf-8?B?MXVXaDhESktHVVdhL1FCdGpmbmRoNlRHMWFjNDJBTEJtZ1ZkeW5QeEFXVkxP?=
 =?utf-8?B?bFJZNjdmKzZSWkFCSUppZ2N2SmZIdWFYNDNkc2JPR3lJM0VWNWNaTnlJVE5Q?=
 =?utf-8?B?dGRhelVDaEVibnAwT0NzNENSZWJPSFFmU09VMEQ0S2FWejhmVFV6RXhtSDAw?=
 =?utf-8?B?V1JiL0h3ZGFoaUVlb0lhemtMazRVM3lYZ3UrR0JXbG5aK3NVSmdIMUswMGF5?=
 =?utf-8?B?UDQ0SFduMXc3YzZBcEdWYjR1VjhHaWdTVnZ5aXBWVWMzMGJDQ2I4TzVlb2RU?=
 =?utf-8?B?Z0lTYnpGSWZLS25nenBQMXNsK3B3d3Zqb0FCY1YxbUFCLzRiUjBjVHcvOVUr?=
 =?utf-8?B?K3FmZVhjenNjZHVKNWRtL1gzSm5xWTdDMm9EemJTQTRxaWZ6TmhDclZTWmNt?=
 =?utf-8?B?U3Z3NEl6azB2ZTRSTDlzRldNKzR0eUtzVlkwcVRRMGVXWU9qR2p5bzEwL1dO?=
 =?utf-8?B?d1BtdHozNVhNWDFKbkIxblFFZGJXd25qMkFXbVhBUXpPekFEZ2R0RUpZbmg4?=
 =?utf-8?B?cXdGUnZ0VXdSWEZmdjhuYmc3Wm14VTVOOXFJREozVkU3WTJ1YzJQOGllY09N?=
 =?utf-8?B?TExodFBqOWlGbGdSNXROTXFPZzVVZ3diVWZtODFRUDdaYlc4Y3BVQ3RENUE1?=
 =?utf-8?B?VHY5YXlhMXlmR0Vzbm1kSUsrSUVrTllOaDBuRWU2MDhRU09ES2t3SzRSeU5u?=
 =?utf-8?B?STNJMFFLWGJXSjVSbWxSOUpiY2N5cld1THlmZTB0cnZMRTNJcDF0UUpjR1Vo?=
 =?utf-8?B?MlNuTnNwcUY2SlRDNWFsbjRRa1lsS1g0M1VpbVI1THoyWGtSNnRoc2I4d1Vm?=
 =?utf-8?B?dGFBWTdYZm4ySHVlaHBvQnA3d09wUVB1K2lKdXUyV0lrOVRTdGJjRFJldVlI?=
 =?utf-8?B?ODdBa0IvN3NsZlA4T2ZRMjBlenpPYlozVHVQNEdCVHZGcEhIeHJSQndqMjdU?=
 =?utf-8?B?V3l0aElRcjBEQ1ZXVUw2SHdPTXBxb3NIeno4dVhYb0J1SVpDM3R2NU1CQ3FF?=
 =?utf-8?B?Z3Jyc3FmeUJWYWNYMUhDbDVEcTRJZVZFQlNZT2QwNlZsTmVmTlhnQjNRaEdK?=
 =?utf-8?B?bG5kNzZWanV2emE1alpZbTVCdkhKckVyTkN0bkNPeUZ1RlZrNTdVOURyOXVC?=
 =?utf-8?B?RUg2eUhreGFxZU1IYUlPSkZRQWI1cEpkY21BZlN0Smhwa243VmVTMHl0WWNR?=
 =?utf-8?B?TGlSSVRLMFRlQXdMVlNiNy91TnY3d3JnTnp3dHNQWTNEbDkyY2ROTVdGNmJ0?=
 =?utf-8?Q?oIDHAut66TrpwUWkkOU5LdheuAj1nKnQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2288733-4c7c-41e3-afdc-08d99573f09f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 15:52:24.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6232
X-OriginatorOrg: citrix.com

On Thu, Oct 21, 2021 at 11:58:18AM +0200, Jan Beulich wrote:
> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
> mode (physical vs clustered) depends on iommu_intremap, that variable
> needs to be set to off as soon as we know we can't / won't enable
> interrupt remapping, i.e. in particular when parsing of the respective
> ACPI tables failed. Move the turning off of iommu_intremap from AMD
> specific code into acpi_iommu_init(), accompanying it by clearing of
> iommu_enable.
> 
> Take the opportunity and also fully skip ACPI table parsing logic on
> VT-d when both "iommu=off" and "iommu=no-intremap" are in effect anyway,
> like was already the case for AMD.
> 
> The tag below only references the commit uncovering a pre-existing
> anomaly.
> 
> Fixes: d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> While the change here deals with apic_x2apic_probe() as called from
> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
> similarly affected. That call occurs before acpi_boot_init(), which is
> what calls acpi_iommu_init(). The ordering in setup.c is in part
> relatively fragile, which is why for the moment I'm still hesitant to
> move the generic_apic_probe() call down. Plus I don't have easy access
> to a suitable system to test this case. Thoughts?

Indeed, that seems it could go quite wrong, as apic_x2apic_probe will
see iommu_intremap == iommu_intremap_full (the default value) and thus
could choose cluster mode without real interrupt remapping support.

At first sight it would seem possible to move lower down, but as you
say, this is all quite fragile. It's even made worse because we lack a
strict ordering discipline or any kind of dependency checking, so even
if we mess up the order it's likely to go unnoticed unless someone
tests on an affected system.

While we can try to solve this for the upcoming release, long term we
need a stricter ordering, either as a comment, or even better enforced
somehow in code. The x2APIC vs IOMMU ordering has bitten us multiple
times and we should see about implementing a more robust solution.

Thanks, Roger.

