Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570555775C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 12:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354786.582069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JhR-0006dW-Lu; Thu, 23 Jun 2022 10:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354786.582069; Thu, 23 Jun 2022 10:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JhR-0006ag-IB; Thu, 23 Jun 2022 10:04:33 +0000
Received: by outflank-mailman (input) for mailman id 354786;
 Thu, 23 Jun 2022 10:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4JhP-0006aZ-TI
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 10:04:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea4a1af-f2db-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 12:04:30 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 06:04:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BLAPR03MB5460.namprd03.prod.outlook.com (2603:10b6:208:292::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 10:04:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 10:04:25 +0000
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
X-Inumbo-ID: dea4a1af-f2db-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655978670;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9ZTR3EuZ5cyPZfBX3ahgjowQzgyarign0HQwhQAoySo=;
  b=E65IGgmcqtBqypRVCiGICV6SMpiSpKa6a42Fv3lK1XP3/s+dbO+RIEG3
   NclkXlvgnRmq/0A9kBCgDf0BHnkhLNWxCcYoGz7Zo1fXsYagC+PyEKoEY
   diBr1gu6NF1XI7Ie27RAsC7rooqCqWc0dL6pTJEv5uotqMzezVpg/7fd1
   A=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 74242059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:v/NgrqAnIWL7hBVW/+Liw5YqxClBgxIJ4kV8jS/XYbTApGh21GQFm
 2YZDDyBPP+CN2Gme9klOYuzo0oDvp/Qy4AwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj2NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgq8
 MwT9qGVYzwiHY7FqM0+TR9oFAxHaPguFL/veRBTsOS15mifKT7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mdEs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj03CWlK2AJwL6Tjaom/UPfwUt16qfgLOCNIvLWS8lFpknN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3vx3hFyewEQDBRtQUkG0ydGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzWnpFaUsxhaXMBfe8U25w2AxbDdyxqIDWgDCDhaYZops9FebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsQRMe5tj/oKk6lh/VUst4C6mxk8H0Hjfrh
 TuNqUADa647iMcK0+Cx+wDBijf1/JzRFFdrt0PQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytaVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:s3wLgqhMV04sXpgKLZWvyGoIaHBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74242059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxuriB9+/Uwj2gYwY9bR3G6LBxhRpYG6yrQLtSHWLV4Zn/apdxSaSCxZSUG7L98vICVuiK6BUcjHhDdVt9NEPuaL7KTzo9PAcfaKHBSzvBjeCgpusvUdQFu7mcohy4P1GIw9j3cxu/q1zRschQEk4hpD9FOsONTvsJ1NkKguyKavjkTdAc9My+rX1irvcKeSmiJw9WmvnwKDduvh0wHzwR/f2FPLHRVXkp60drPjLO5FE3viIPO70e6P6550nAKlYmCxBmLwQG7Nnw9ZB+ld/z3NeYELaoMSHwMG/UZTzy5LOpLMDzKENmlT7z6Mtt1vVT711DsrswlxXjA1EfbMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gZi33ta667xHrZ5UVLCTN8JnDNrhI4y5VrLEgyrsF4=;
 b=GNFtW7TfaHt7O5Npq6PFTc3Mhg5y4RXjKTTUC5j/CIdp/5s424Fi1UQvkPiCd8xOAkQ9scSlzTxz8z6F6B85dZmT5L/IT+fkT+4zdXdQJN8tJNj5KawdItt+qVxZ0D3AcEnsmaibOhqkXqACYu+8YWsUqW9NR/ZriOJYfNqhPnJbQOC/caUgJSUWyIE9HEOvr3Xwbc5KhA1XoEueVBhemMOFch2l3BbIk8vi8fWdmQRChJm79NoCYchvuMhERT/u2TI2J3TtxkTAx2sbvSI7wsoLNllcqRJnX0BjrwZDKH+gIYJspbbBzAxGsnEUl1/G3TR+uJfBLUR5okmrjE7AWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gZi33ta667xHrZ5UVLCTN8JnDNrhI4y5VrLEgyrsF4=;
 b=BK6tGXdr3GiMvlt4wO3uIk3IKRZQK7gj8omQSenV8tN3eb/pT0lFDf/ECmjRF6/L/LT/MtaL87RPhLmoHAa5z61K5QeTHk7dobEyFXgSx+6H+bHyNCTiVBkF0Ci7Lts0CK7kbvbH+WBNpoS7cVmzFvY2Oa3KbLv7JqsOeGeswaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Jun 2022 12:04:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Daniel de Graaf <dgdegra@tycho.nsa.gov>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] MAINTAINERS: drop XSM maintainer
Message-ID: <YrQ6pNrr3pbZ2THo@Air-de-Roger>
References: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
 <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
 <DE900420-7474-45AC-B363-519D1D51020A@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DE900420-7474-45AC-B363-519D1D51020A@citrix.com>
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b2a931-14ce-4735-b174-08da54ffc0bd
X-MS-TrafficTypeDiagnostic: BLAPR03MB5460:EE_
X-Microsoft-Antispam-PRVS:
	<BLAPR03MB54606D62894C88BE2D45386E8FB59@BLAPR03MB5460.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zkpJudPuNooIsn1E+UFfAWjyByFCWcjL+NjqdHAMlBZu9V9+dd4QUIuqR4CgDvydVBN8lIERS5Jx2qc1/ruLFgp+Qc7fkwb8Co2gaTgywYT8mK8tEPxTYSpb5P3Qv4P7+pf5o6+6kaKNZ5j3OgQeqopgi0LiMoOab8NQifX7g180E9AOESU7so0CB7mTuO/TpbpQ7X8RBKOIlnC2NU9+8Adg7ebfDuzyTc2E4hRlwA4rNHZR+bLq8CHRj2R8HptEwYfllaGNA+9FK7sfDr6dCehwvLDx5qmKI8CihAw6H6dUORFCyPIHv33aMu1Z1g+QPttLk3Gpy/o3zdUKbq2PkyK21EEGZ+Faxul/6+zTf7Dsz/MHy6xAl+WZCrV5rSWTpjBcm7ewV+gOCybJjz7JyQ3ZvazgMehXJ4n/peNFI5I6PJ73eOEkJMl3NL4sKnTQY1U68pDA84JGWdmL13z2gOjvS08pm+b+rmrJ3pw5gkToimUFaS391fJISUQhH17iwvkjm87ajkYEkfLlN6OSy9xdr9DoulqeRpqZSIHiKS2dOn0XSF693edhFCeixQkvNE3nbklUnk+viHU2aLRNPNl70P/kniwuABTvHE5n4CKWWYqRK5/jZaHp2sBu6Q+ki7XdWnLbplU4Z/PUm9tBwmUjH55bWbfNbXhep/QdpIfwdn62dd3uE5jWIA32WbkJhHybPMeZIIYW/7+J9jlYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(6486002)(2906002)(186003)(86362001)(82960400001)(8936002)(8676002)(66946007)(4326008)(66476007)(38100700002)(66556008)(6862004)(478600001)(33716001)(5660300002)(316002)(6636002)(26005)(54906003)(6666004)(6512007)(85182001)(9686003)(41300700001)(53546011)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkhBVmt5b1RHQU9BaTdrekRSb3J2RjBzWkxRQ3VxN3ExWlBwekhYeUc3YlRw?=
 =?utf-8?B?UkFSMUZRelJuZ1ZZaGlDdzU1SUdFVDJoVTFYNGsvM0hoMW9JSW40VlY2b3B2?=
 =?utf-8?B?YURwWGZDMWJXUDBqUjQxdjVCbElOUmFBNXhBazdvWmVuT01laDNDV2drT1Vw?=
 =?utf-8?B?a255WDVjOTYxMTRxdm1kMCtJanRCUTZkTTB1alkzbGZkYWlMZkJCd1g5NzNC?=
 =?utf-8?B?NUNUcFpXWENXem1HZGdHbWlBSTlLNEk4aHhFWkpqY01WeFMvUnkzdUZTRU5a?=
 =?utf-8?B?N0NKU0RVNWNpS3VZOGJydU5kWTNFbytaR21xYlFLZ1BRMmowZWt6U09qYkR2?=
 =?utf-8?B?ZlVmdG9yOTd4N1pHSGRhRndueWxRMWp5MzJ4dXpXU1RDbHoya09oVUNhZDhW?=
 =?utf-8?B?RW9QQWQydTNtb211VmZCajR1QmRESG8xRUxkUHRNSlZDbjErN3BUZGxvS2JZ?=
 =?utf-8?B?WjFZVW5vV3kyUDJkM2xKRFI0TVFlWE5aSS9mMHdiUStCUGNEUDdpOEZyMDU1?=
 =?utf-8?B?R2dNMmgxTmpHM2xhMnp2SG1Ua1E1S2pGUHZOOWVmdmZiSHJ6OTJac0NaZllX?=
 =?utf-8?B?ZkNzNlp6dVZvTE54MUpsVVZkR2hFVW5ZY2s5QjlpTlQzK0VZL0llUHlxSVgz?=
 =?utf-8?B?UFVNQkVycDdyTWQ4UTFhenltbTJLKzBocjBqRzBhTUUvdUxLNFRnMnV4NXBn?=
 =?utf-8?B?OWdRVkNpRU41dFMyZFVQTnd6MWpJZzRBR1NPWTE1RHJ3RXZBb05ra3plSXY0?=
 =?utf-8?B?Q0RjeGx3d0cxOFhrZ21EY1BDTmNFNTl4VDBJK2xBc1lFcldUczBHaVJvMEF4?=
 =?utf-8?B?TU4ycGMxQm9BVUU5bi9Wc2JXQi83UUZ4WW1HMjQzNmxaNm5LMWJYM2RrWGtt?=
 =?utf-8?B?THJlV0Y4b3ZnOUp1VmNhNTBRRWFSRWQzSGlhQ1lJUFcycEtzOGx5MkhCaEI1?=
 =?utf-8?B?NC8rVVFXbHNpTW8zUUdYWDhSclhTdXNGaU9TaHlOcWpuSE43eW1lSTVOM3Q0?=
 =?utf-8?B?N0xNSU1qSXdzd0lyU2JXRjdjSGdlanRrWDliVzVOanNpY3dFNzYwSC9rQjRT?=
 =?utf-8?B?MUhRM1hJS1duT0hEck50UXFYRFJhdEZ1WEtJMFRMT1BLUDlnS3k4WjEvR1Bn?=
 =?utf-8?B?K1lJMk9rL0pIa2NzZnFwK0xFSGtuMis4NnVYU1o4S0ZGNlNHVmpOVEJkNlU2?=
 =?utf-8?B?SFljbitvNVM3VHpnRitTei9WWmdqNkRRVjBvODczRnhJTjhDeHZtUE9lb0o3?=
 =?utf-8?B?cnVFejR0czJKUmRmZ0FaNlJLWEJvNFZJamZSdXJKR280bEpqZmRudHdvd1du?=
 =?utf-8?B?WXVZcWFLK2Z4bkhrRVZld2ZkZi96UWowWVovZ2NCZHJlY3pzMy84NlF6cTZl?=
 =?utf-8?B?UjFzWWtpQWdWaTYxMkVPVEZuQTd3OGVhN3ZTL3NNL1RDUENVWnVSVGxsdE9h?=
 =?utf-8?B?QUhsMlVVaXZVWU85Ty9YMUNOTXhvcFltaENBd3hvUDZkTkFyYnNhTGlDWFd6?=
 =?utf-8?B?Y3hxaTlZY1hEem5nTjRSQm9vOGdVR2pJWC9rVG90bFc3Z2l3NUVrWXRHMlJQ?=
 =?utf-8?B?TEcxWkhyTFgxYUxvWVpvUnhzQklyZzFuVkRNOHRvU1pGMC9YN0tYVnQzd2Ir?=
 =?utf-8?B?SnFOL0I3Q2VMdHBhakhsQjByZE5YS1U1Q1RIMVg1RTdOY3Bxa1p1UFNTZ0Rz?=
 =?utf-8?B?dmx3VHBob0M3cU9XUE56MVdGUkRwVDl0VGQyaEIybjJiZWlyV0Z4Z0ZkM1U2?=
 =?utf-8?B?NHNvdS9INFVGVGtmUXpmYzJSYmpYTFQxRDZsaGs3S1Q1dzRTNUt3ZEovQzBz?=
 =?utf-8?B?RmJ4Ry9iNUQ3NnVteHozancxUGptazlCVnRFZXQrbEZpellZbTJEMmgzb3Jn?=
 =?utf-8?B?TVFIWWVIc1Z3Wk5QdVVkN1FhOC9aNTh5VEpZTFlSRjFNbVRDeEVreE5vbnZS?=
 =?utf-8?B?dVoya21PbXlDeUsyc3EzeHV3RTJHYW93VmNWOWhtTjhzOGQwWmpHWTd3NUJR?=
 =?utf-8?B?WnNqWHk0ZFg1TVBoNGRJd0ZNMGIrMWhIVTZFb3A1dkhFQ3hzdG1oN052dVY1?=
 =?utf-8?B?UllCOU5QbEVsOG1VVXQ5U3FId2ROa1lhVFFEOGlZcS9peks3MFJFOWhYNjZq?=
 =?utf-8?B?OU9USUFyTTgva3RPdi9LSzVyQ2h2TXkvQkRwNEZPTFBZUmlHK2V0VzdVWWlx?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b2a931-14ce-4735-b174-08da54ffc0bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 10:04:25.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eta5oaTnpH7rGu/XxzO1b4qnYRVW4M/G6xacRjMDK8qwCtPloRjaT2Fpf+EPdwPuRx+FbAKsu5RELjWsXt10LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5460

On Thu, Jun 23, 2022 at 09:56:34AM +0000, George Dunlap wrote:
> 
> 
> > On 23 Jun 2022, at 08:43, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 09.06.2022 17:33, Jan Beulich wrote:
> >> While mail hasn't been bouncing, Daniel has not been responding to patch
> >> submissions or otherwise interacting with the community for several
> >> years. Move maintainership to THE REST in kind of an unusual way, with
> >> the goal to avoid
> >> - orphaning the component,
> >> - repeating all THE REST members here,
> >> - removing the entry altogether.
> >> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> We hope this to be transient, with a new maintainer to be established
> >> rather sooner than later.
> >> 
> >> I realize the way I'm expressing this may upset scripts/*_maintainer*.pl,
> >> so I'd welcome any better alternative suggestion.
> > 
> > Two weeks have passed. May I ask for an ack so this can go in?
> 
> I’m happy to give you my Ack re the maintainership change, but I’m not qualified to comment on whether it will screw up the get_maintainer script.  Perhaps it would be better to send a v2 patch, proposing Daniel Smith as a replacement, to avoid the question of the script entirely.

Maybe we should modify the script so that any sections that don't have
any Maintainer assigned (no M:) fallback into the rest if that's not
the case already?

Thanks, Roger.

