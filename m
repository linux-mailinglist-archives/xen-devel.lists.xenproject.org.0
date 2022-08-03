Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB6588BED
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379895.613768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDOG-0001fZ-KS; Wed, 03 Aug 2022 12:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379895.613768; Wed, 03 Aug 2022 12:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDOG-0001cj-Gx; Wed, 03 Aug 2022 12:22:20 +0000
Received: by outflank-mailman (input) for mailman id 379895;
 Wed, 03 Aug 2022 12:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hZNp=YH=citrix.com=prvs=207fabebc=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oJDOF-0001cW-KQ
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:22:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9a5a849-1326-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 14:22:18 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2022 08:22:12 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by PH0PR03MB6869.namprd03.prod.outlook.com (2603:10b6:510:166::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 12:22:09 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%5]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 12:22:08 +0000
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
X-Inumbo-ID: e9a5a849-1326-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659529338;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=opaIsl+enGw24iHbs5yZ4DG1CnRHgAH5i32IJ6ab5Ws=;
  b=UYbK2IyrT0b7HY6k83YXlMe9H3cQX7c9I7t1SovVbXXRCaF0dY88Mw88
   xwVl8K7Uix3JSmzDfhVHimKzkT0/XCmZJ42XT/1q1WfZf9JkJ0VeraXMR
   4QCbrXHtqvTxtSwDazfBUlERK9cdp9Cqhhhenc16y8tOV17BpOD15NoFG
   s=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 76526562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eqoIWq7MmOm+gvnbWmXeCgxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 mIfCG6EaazYMWqjct1xbI609RhS7MeHn98wG1ZrrXo0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5K+q4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHsoJ6c93Lp8OmFx1
 vE9NRYdRRa8lcvjldpXSsE07igiBO/CGdpF/1Rfl3TeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LWMe9Av9SakfugA/yCR60KLsK8bUc9rMQcRTkkeXj
 mnH4374ElcRM9n3JT+trSzx3LGSw3mTtIQ6EZqlzt1KuGWqm1cIJhopVVq9k9rmsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebTAjy
 FKhhd7iAj1r9rqPRhqgGqy8qDqzPW0QMjUEbCpdFw8duYG/+cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:JiBLB6MGaTQ3BcBcT3f155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMMs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YsT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29IOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6c030Woqqh9jJwPr3OtiEnEESvtu9uXvUlZ1S2hkF0nAho0idvrD
 CDmWZmAy050QKtQoj8m2qQ5+Cn6kdj15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesfMftR9B6NmOQgeisa4XZcm0BS59I7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9VVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJZ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZWXkVwzve4Pcb
 j6ISNlXDQJCjPT4OW1re522wGIRnmhVjLwzcwb74Rlu9THNcjWDRE=
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208,217";a="76526562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR5yZgcD0AJckcyqcCkMsixIjTN0dveV7+HbVkANKN/e2wt2Ue5uXZ1aCDbdASif90ImUaiPm63PYfQqH4MyTJI1witY2vKa6B8dfcN3naP2nvP7krXh0NQXmbZ0bixgdWNxwDphdmlPtYTM2NdHNUSzEyg0ajKT/1JrnxrIvHyG4hHQ4V3p8InbASxClbHkXARjbn7PTYun0qsCzOO08okjc+xAJpMx7cadOCQ07+w5980A1hnTSmXicTMzMm8e5LwhYhFSKJKhSJtDCFZK+Se7HE/nYOrjYt1Yybr+efgsqBYO8RruwTCXOIX1ZZcHWt28E69bcw7das7NVx82Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opaIsl+enGw24iHbs5yZ4DG1CnRHgAH5i32IJ6ab5Ws=;
 b=gVl3NjxOZiyqWq6hFAyofimuulPQ6O6yDf595p4Wbtak0CpoamD4tBfktJtFvJXW7DbCMMpU7SJ/DFJqmtimhjFIhl3l8V6wgVmNyHKAfnl9qZQ/jINEjdxZStqt7SJQKi4MCVs1g95MA64o3rmJmFbKoeeAVxFYdR7Zuzmqx2K8RoYuy1nIvppGV3gHSyD9UOyP/4CWVl8SxdxEX2ze1G1HfQlVKTcs2TN5jftsHsgJ3NjzdX0l1WQRuKjVHZp+1JLzvMSIieg1cArS5k7XWjwKFy9isK2rXynvXsi5bUCfqHR3rD7Nrkjbym1Qv3dnX4wINWlnWS1OmMyo8BHYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opaIsl+enGw24iHbs5yZ4DG1CnRHgAH5i32IJ6ab5Ws=;
 b=PmiNgMzjYpW6+ZaUM3QGsice5mZ5vdk5MlQiM2Ay0KH9laURO5kOSJQijrF25+M6DcnTbREZHfn7TyyofXQe+rxIAJlvj0aOOJFVhj2VlDTdqjP3w43LJc04n4YXpq88QAyz8WJt60dJku5cIaf+Fsuo+u9jQLojhq0KbZcfmOA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, David Scott
	<dave@recoil.org>
Subject: Re: [PATCH v1 3/7] tools/ocaml/*/dune: dune based build system
Thread-Topic: [PATCH v1 3/7] tools/ocaml/*/dune: dune based build system
Thread-Index: AQHYo3Q6xyJAJdfWIEePlnOSZhaf2a2dEJMAgAAP0AA=
Date: Wed, 3 Aug 2022 12:22:08 +0000
Message-ID: <899BEB4B-523B-4382-A1EF-C87BB7FF8CDA@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <0f2c08734668626a618767680493a006827e123b.1659116941.git.edvin.torok@citrix.com>
 <YupbLL8mYTK3427v@perard.uk.xensource.com>
In-Reply-To: <YupbLL8mYTK3427v@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cce3ca5-076d-44ce-3dfb-08da754ac928
x-ms-traffictypediagnostic: PH0PR03MB6869:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nNL3nR26cYmFZbPLch8XmY0P2XUeKHuSOaLkp6bZ5dmgWivClDkAPh49OMIgvdAZN770zmD77xbxjZAUCL5UpUxH0RNogpJuLaje2KHqKX3dhqLxWzI/9zt5NdARGBxylsWTiq2otlTtQEeMkPt4xZNaGVcVqaxzdpqPrL0IQ91daFgSm53fkj6csY2MMVGBNy+dlEXBg9sXv8GqKMAmEq2KyA1yL6aOPEYnHd1wU0hyqpwUf43yc8jYAPeNutVxk5zPVTd2XMfEhXYhzMkopTN7ynsZdqxd9fNd11Dvy4PDAoX5sINzgHGx9baY2+zjLU8Hk6SfPVtKN3I3UAL2FiP1/X/trJs3Ry5YUHAdJ4J/+Tq0PGHKsEMbRl2oPBsWMxuxCNV/67N811/aVXdhfbzGNOlMuU+ymTjlcQUDn3Tw0wRhI6Z3k33Drbzp9NDtSmzDOh2PZO3rWm7LHufVhmFKIpaS2Ha09F/g/V4K3qsgxCVldGFU9zCmbeE1jQP1B4yRUiFNsf88najwYVwhlKwZ4BXlHBSF9T3churnGJF5UFbay7Z7i943Qj6wXOvmIDxND8+yWjy7RrmktXMn0MvF6CSY5i++mQbZTnoEoGjPEqMFqtVmVEjh/rHqGoPvfE6ZJmMqB8JSmtdNmpCx6IXyZEN8nwNEstjbcuR3NGMr0L+BwIgpt/V0v/Cg+KxmqOO+Av37SH9o54GFOUgbJepm4qnzOXD6ynLtvJspLzoDxOz0JCMyM+5gQVIqJ0FrX5ndv8DyOnKwygmFBhvE+l5XLD0K8DP2vA94udT6bvS1BphBsSBseUwMefJQnmTEvNr8sOsYuuM+grzWwu8f5Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(41300700001)(38070700005)(6506007)(36756003)(26005)(6486002)(6512007)(53546011)(54906003)(6636002)(5660300002)(316002)(37006003)(71200400001)(82960400001)(478600001)(38100700002)(86362001)(2616005)(122000001)(91956017)(186003)(66574015)(66446008)(76116006)(66946007)(33656002)(66476007)(66556008)(6862004)(4744005)(8936002)(4326008)(8676002)(2906002)(64756008)(44832011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUJvaFlIQ0tMQ3RuRGgySHhBRm1SQnpIMjFBNHRTWnZadTM4QS9aYUZ4T2xI?=
 =?utf-8?B?SDVDc0o0bWZ3dlViazdpZnpPUmNqSVRuSlhXbm9iTXNRT3lFWHV1MHRPcFRW?=
 =?utf-8?B?S3BxZkhtYkFlbUpnOFNycDlIbndIdmZWVmZHV2VBZ0tPbFZ6T1JVaEF5dXhP?=
 =?utf-8?B?cFp3T3pPVWF3NFVqSjgxTWJZbnUyaXpIZENVcjhsN3oybjQ1UzN6VVRZTDAr?=
 =?utf-8?B?bytla21KZnN0bTVZREJjNDRscXBVc0J1SEtSSVkrVzh5bGhJNGZpVnFLUTRB?=
 =?utf-8?B?WWxtYjN2dVNqekVwc3lSd2N5UDdRSXhUT09oNEVnYXhFKytlVXhMVVJDODE2?=
 =?utf-8?B?dVdyUEI1dk1BRndhclpVbTg3Tk9XcXk5SitwdG1YT25IRHM5WW9ESm5LYTRp?=
 =?utf-8?B?TEkrdlM4VEZUM0IvbHhVb1ZlVUJPMEpjOEYweDlnVnllVjJ5L29VMzd4MWZl?=
 =?utf-8?B?d1RZSmMzaWdIbkRMS2lDZFpvbFBra0hTZXNlZzczbFA3S2JncGxGVW1GU2lU?=
 =?utf-8?B?VW1ncFVEbkFialp3QW5FZVFGaDF1NWpRWVlGWEV6bWszanQ1SzFaNmlNc1lM?=
 =?utf-8?B?ODBHZyt1cC83SUVVMWtXN2ErUndYMFNEV3lBTE5LUzVUQVFJd25RS001cUs0?=
 =?utf-8?B?R01xbVFhb1pmd1gwMHJCb01sdW05OGxhWGUrMW9sbFQyOFZUNUlheFNYZ1VK?=
 =?utf-8?B?TVhOYmhlUDU0TU9CWWRCek1xL3NSYWNyVnhxN1lpUWUwaHhXNVkyQ09qOHVD?=
 =?utf-8?B?RHJJM3RqQTkrS2taNGVNT0YzNy92K2hzd0tLSTFNcjVUYk9WeFltWXFQeUJK?=
 =?utf-8?B?RUhyUm5XbjhMMEIzN1BLQTU3bGRiaTd5NkYzNTd4V3FOV3piS1E4Zy9BMHNl?=
 =?utf-8?B?cWpvMG9pNUNKQXNVdGNZWVFWZlozREtEemdUaVVVRFZNUlNxWm9LUllxd3ls?=
 =?utf-8?B?WklPTEQyMTZxT0EwU1R1QmxMU3ZqMFdSRURvMElXWlp5dHVKTVNPVGUraVR3?=
 =?utf-8?B?anNzNmJ3c25zWFdvcEFBUEdiY1ptRWljODNlbjl0REJuNWR5MjVVOVFqelIr?=
 =?utf-8?B?V2RmR1pFcnZqZlpsWkVWSnd0cGIxcnd5S2xQR041OVFpMG9CM1hUSWtTc09O?=
 =?utf-8?B?ZXlDaTloSGlweG1yMVpJeUV2WmVsRjZ6Y29YYnA3ZG1jWStGUnF4V1BHQ2M0?=
 =?utf-8?B?RmlueVJvb0I2NmdKeFRacnlldjljNS93UmRIamY0SmVtcU1QTmlGMjd3ZDNM?=
 =?utf-8?B?clNPOWxhc3FZdGJ1TkthSUpOS1hTS21mU3g3OTkzZUpPVHdsS0hCVURaRjIw?=
 =?utf-8?B?aUxCcFpaV0xBRkpJOUxPb1F2UE1FWUx0SkpjMjNYSHRweDZ5b1NjSzJDYmgw?=
 =?utf-8?B?eVJvaHdKVnQ0dzAwaUI2TU5zaWRoL2MxN3NsSHVCZ21aZUpTNm9XS0hUTVY1?=
 =?utf-8?B?R21rZXlXOVR0eXVGc0FyWDJ1K2J5Q1Nnb2VEeTBZeklubVVpVEgxNUhMM3pa?=
 =?utf-8?B?TXJoaE9FN3ZkVFdwbUVEZ0I3SmlqTkZmUEhDNmZjU0VIanpwK3BlM21Wem5N?=
 =?utf-8?B?OGpMT2NReFVqaTR3bmJTY1BOeTA2eGwzYm0xVzEvKzZoZ21xbFJ3a1F1Ulpu?=
 =?utf-8?B?amJMdVpSRlV4T0hTOWU2TjJ6RHJPUytoNkVCa1NxUTkrV3FRdVBYZlpTdExh?=
 =?utf-8?B?ZGttbkFDZU9BTS9CN2VYWDFZSFN2UW83QTZJS1U0b0xKZGdIZG1yVGllUmFP?=
 =?utf-8?B?a2JDbDdyc2xWQmR5Zy9CUVNPUlJxdys4bFlyZ3lhSHpTQTJrNkp3UXkwSExa?=
 =?utf-8?B?RlR2VTUwb0JjOVhKLzhaOFpGWm0yT2p1cUxERU5kU3oxeXM0c09ZZ3Jnelg4?=
 =?utf-8?B?cm5LZDhQYlhkZzVPTCtTT1pIV1dCcjd4dkw2dTFuYVBxS1VVZmZXR2JSSEEz?=
 =?utf-8?B?VVhnQS9oTVV6aU1ScWE0aFdIRE5hanJnOFd4QXlxNUErcncvaVE2R0xlMmpk?=
 =?utf-8?B?a0NzL3d2dHo2QWVSRGtGaE51NjRNbWNzb2c1RDF6TkJORVE1MjFVeGl0Ylls?=
 =?utf-8?B?bFFwWFRYdVZJaHhLdTQvRVFHcHhLL1FQRDZLWXRBZnMxNzArdFJ3Z2RDbUps?=
 =?utf-8?B?UXpIQ1RwNmxnYVdJY3RLcUZtYlROWXVaZ2ZSOVVuN2hSTUU1L3YyaTcrVSt6?=
 =?utf-8?Q?O5cfTyCVIb7BgMfknXMz2VM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_899BEB4B523B4382A1EFC87BB7FF8CDAcitrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cce3ca5-076d-44ce-3dfb-08da754ac928
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 12:22:08.8765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esiwvBxKPw0c207FSf0xVqYcGGd3AeDiWen9z9Lr55f7iF493LoOAeZXDlt0W8BR2XhzPHFm3SVIBYyE4m2/1/rtVS9a/qDs5G31O8vo/FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6869

--_000_899BEB4B523B4382A1EFC87BB7FF8CDAcitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDMgQXVnIDIwMjIsIGF0IDEyOjI1LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbTxtYWlsdG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4+IHdyb3RlOg0K
DQpPbiBGcmksIEp1bCAyOSwgMjAyMiBhdCAwNjo1MzoyNlBNICswMTAwLCBFZHdpbiBUw7Zyw7Zr
IHdyb3RlOg0KQmFzZWQgb24gQ2hyaXN0aWFuIExpbmRpZydzIHdvcmsuDQoNClNob3VsZCB3ZSBo
YXZlIGlzICJTaWduZWQtb2ZmLWJ5IiB0YWcgdGhlbj8gQWxzbyBoZSBtaWdodCBiZSB0aGUgYXV0
aG9yDQpvZiB0aGUgcGF0Y2gsIGlzbid0IGl0Pw0KDQpUaGlzIG9ubHkgcmVmZXJzIHRvIG15IGlu
aXRpYWwgZXhwZXJpbWVudHMgdG8gc2V0IHVwIGR1bmUgZm9yIGJ1aWxkaW5nIE9DYW1sIHhlbnN0
b3JlIHRoYXQgSSBoYWQgc2hhcmVkIHdpdGggRWR2aW4uIElmIGF0IGFsbCwgdGhlcmUgYXJlIG9u
bHkgdHJhY2VzIG9mIHRoaXMgbGVmdCBhbmQgc28gSSBzZWUgbm8gbmVlZCB0byBhY2tub3dsZWRn
ZSB0aGlzIGlzIHNvbWUgZm9ybWFsIHdheS4NCg0K4oCUIEMNCg==

--_000_899BEB4B523B4382A1EFC87BB7FF8CDAcitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <6C17DBA659C6C146928339B07A1BBAEC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDMgQXVnIDIwMjIsIGF0IDEyOjI1LCBBbnRob255IFBFUkFSRCAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20iIGNsYXNzPSIiPmFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2Ut
bmV3bGluZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAs
IDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5
bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsg
bGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAw
cHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNp
bmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246
IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIi
Pk9uDQogRnJpLCBKdWwgMjksIDIwMjIgYXQgMDY6NTM6MjZQTSArMDEwMCwgRWR3aW4gVMO2csO2
ayB3cm90ZTo8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsg
Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNp
bmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJh
bnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFz
cz0iIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJmb250LWZhbWlseTogSGVsdmV0
aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNh
cHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3Jw
aGFuczogYXV0bzsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJh
bnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IGF1dG87IHdvcmQtc3Bh
Y2luZzogMHB4OyAtd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IC13ZWJraXQtdGV4dC1z
dHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQpCYXNl
ZCBvbiBDaHJpc3RpYW4gTGluZGlnJ3Mgd29yay48YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+
DQo8YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2
ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQt
Y2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0
ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7
IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ry
b2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4g
c3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7
IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczog
bm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFs
aWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRl
LXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlu
bGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+U2hvdWxkDQogd2UgaGF2ZSBpcyAmcXVvdDtTaWdu
ZWQtb2ZmLWJ5JnF1b3Q7IHRhZyB0aGVuPyBBbHNvIGhlIG1pZ2h0IGJlIHRoZSBhdXRob3I8L3Nw
YW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVs
dmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50
LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsg
dGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25l
OyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFu
IHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNh
OyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6
IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1h
bGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0
ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13
aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBp
bmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPm9mDQogdGhlIHBhdGNoLCBpc24ndCBpdD88L3Nw
YW4+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjxkaXYgY2xh
c3M9IiI+VGhpcyBvbmx5IHJlZmVycyB0byBteSBpbml0aWFsIGV4cGVyaW1lbnRzIHRvIHNldCB1
cCBkdW5lIGZvciBidWlsZGluZyBPQ2FtbCB4ZW5zdG9yZSB0aGF0IEkgaGFkIHNoYXJlZCB3aXRo
IEVkdmluLiBJZiBhdCBhbGwsIHRoZXJlIGFyZSBvbmx5IHRyYWNlcyBvZiB0aGlzIGxlZnQgYW5k
IHNvIEkgc2VlIG5vIG5lZWQgdG8gYWNrbm93bGVkZ2UgdGhpcyBpcyBzb21lIGZvcm1hbCB3YXku
PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij7igJQgQzwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_899BEB4B523B4382A1EFC87BB7FF8CDAcitrixcom_--

