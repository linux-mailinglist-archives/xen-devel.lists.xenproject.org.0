Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A569E114
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498872.769806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSQM-0000U1-TJ; Tue, 21 Feb 2023 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498872.769806; Tue, 21 Feb 2023 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSQM-0000Qy-Ou; Tue, 21 Feb 2023 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 498872;
 Tue, 21 Feb 2023 13:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUSQL-0000Qr-4v
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:11:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 307e1a03-b1e9-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:11:04 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 08:10:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6557.namprd03.prod.outlook.com (2603:10b6:510:bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:10:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 13:10:53 +0000
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
X-Inumbo-ID: 307e1a03-b1e9-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676985063;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bjcQQMHaCLQXFhK7s2aRZ3B0LEiyRdl2C9TII1BItfQ=;
  b=MGXF1ll84fGW6+434XeCc7hT7KbsUuhAxQVK3TRvJ7rhM3JM5aPmpBmw
   SWIx5e7/AcjrMWn79yaZyuNboZqocVWMEajIF1K2O9CYW3eqs1CtXejTn
   /PDAMTuQgHVD/ish6MyIoHgMARwwtMMZtqGauwXSOiVKdS30AMAaXi5pf
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 98299614
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TYPi8KhlY0M+CAX8dPvYQOa0X161QhEKZh0ujC45NGQN5FlHY01je
 htvDzrTP6mMYjT0eIhxPoS/oEID68OAztcxGwdo/nw0EyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRIKR8/fB+cndi2/+KJYMYy29oCNMPSadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Re3ip6802QH7Kmo7ARsQdUOFkNCDk0Ofdc55O
 Wc93hExlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94eRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:YuROX6zCaGcHMB9Xww5mKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="98299614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5HSlNjrn0IENNwu7nNVisWpBVqOsvOKihnL2yIz4Sz51PR0N7fNLsBpP99qeTckcdnk3MVPOYOGPVQRRN44HpFT7qmAICGi/raZgf8k3mM2P2un9nl4sn3lmzGbvUiBkWrrt9HIfJfY1aaGVRRSimtdmBal34jDl8ZJ2H0NNMsLRszyoZaqq2RoW3HUcCkeI4sr3qspyqR0yVjpMaqgsoDvDQozAMpRKo97YcAtBFhmeg0l9U9tq6WBSbI3n263NKWNY3eGqoBzxPmIX8/5nb0bGmClkNVP9IsrrSFKlf3KgyjEM45lvEtUYW31zRT/IvVVWCWEpID+7tLIhEAqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGg+S/YX3ih7sldNRpJcUDqZqWYCbeNPIix+ilwvGVs=;
 b=S4EbC1JkbSSoca2ncMI4q9RqxdfUJD4TCFwq6ksIkFBMTQuGXe40/33GhVL6hM+q6pS9w3bkhHSZBHttTsp/xi50p75R+iEpysuEA4aHWiObMtKE+kuEmsNVWrdAUep2JYC/AmfPRz2964QaFUGDoNGLVeMItXt9ekZGeJUz9uXt2qXin2zEkIsDytqFBI9HDCOpcUF54lrJ3yP7juuB2wsypdFYbupyELNTzXeeomuCmQpwAYxbUwPiZipFUJ/dqFSTS7wXCULdAxiEUYfTxkyYmaOgAZci3TrpGIayQjhYoMVH64bACj6i+Vh6Ksh8lrLdWfuDxOrxBxZYSF8dDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGg+S/YX3ih7sldNRpJcUDqZqWYCbeNPIix+ilwvGVs=;
 b=ArD9lEZDWKwCa1Y2uKgo6G9Qd5nQXPgwutRqniIKWxZrDBLS9Dk6fANAbRSvSbady+v6UFiyUD219ihTGeC5zSMFuQmU6TuP7mB3acMWwDkDL6F3jbAoB4h0hH7PsVyC2lWZ9n3eu/oGAWWTdU+UgmoxzpIYglkCJTPzumKqosE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <56b47562-4305-2150-5131-0c3966f11825@citrix.com>
Date: Tue, 21 Feb 2023 13:10:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] xen: Work around Clang-IAS macro expansion bug
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
 <20230217122203.790737-1-andrew.cooper3@citrix.com>
 <04891259-ffde-a6ff-32a1-e3a84a7278ca@suse.com>
 <e2fdff6c-d21d-d3f1-3e46-36f7a88e5507@citrix.com>
 <b8792cac-3d32-d74a-9f54-b479c58166cd@suse.com>
In-Reply-To: <b8792cac-3d32-d74a-9f54-b479c58166cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0359.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: a25f8978-a6a4-44b2-9217-08db140d0f8c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+vFOFvSb2S/423+8Vo3liPpK8TxPzCOcnp1oJz2/6cVE1dhL569/W5Y45P6chiCwkgq/2Layp2EP1TesyGHKImfPgmtdJWdvVGiAc7idRO/FkgzKF4hZRX14g3vt8w8sn7+JYYQ7sNKASnZ0o0aTQxhy0qumQ1IRPr5dwt+Mw+WJ4T+B/NMyCp/I9AjtFIs7LOHbllPGNeDRfI4ADno2SMXEJ1BmKK/oGwbibtzdab/wksyaNHdh3b1I4gbpUPWKLnlZOUAkBaoA+SiBFPHqHAxbm0kSLejlCHgHEqwCWKd15I68x3LkxBvOrD3I8lyoOgBEvg348QMAq+v2qR+WQSiB1Rxzo868aOPGZcppSUw40Veybd9kf6blV7FVxnFDtMtcydI0VrG6mihC4n3kKMeSihNpZLIT9H6zgayV1O287b/DNU6FY91+yvmwxDH7TRpJNvep5UCEAt5JFQx3Pm/eIkYdKTN4JSktKT+gbkq+VcNInE05xmRity9+5F+6ZkDo6roM2YIYvWN9lHV7WTlDKcXyFTgHHbH3lZCnS0YQ8K8qMh5bd7zoaV9K1DbLR4utukymL6oGOJ8ZEO0u7BWAgPFooke/ppw8qFTgNj2f3yNh2HMMvFhKk4DTsJnrbfri8qWTCPxDtGSb2LVvnf9cU+vvNUP47H1AhlqUmOpuFH/6NUqn09HfyxZg07AelTknSlQHcBA+ZoImxnh/W+5xwaIm/OTUs8XDX3F6JQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(54906003)(83380400001)(316002)(6666004)(6486002)(966005)(2616005)(53546011)(6506007)(41300700001)(186003)(6512007)(26005)(478600001)(8936002)(2906002)(86362001)(31696002)(5660300002)(4326008)(66556008)(66476007)(82960400001)(38100700002)(6916009)(66946007)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzlMYU44QzBOUjcxNEk1aFNvUFh5UThHeFhVWWxuY1YyOTJnWHppcDBpRmpm?=
 =?utf-8?B?V0tFbHJmNzJJcDRqanNhU0pjVk1NcUN4QTRCZTE0K1hpVlZ2bkw0d24xcjg1?=
 =?utf-8?B?OFVnY1EyS0hFWmdRSFF2TUdFNkhqcEFseEZJYVNTRVg2UmZxZTlEUzliNkZv?=
 =?utf-8?B?a1dUazJQaDFtbmlUR1RLYktoMXQyNEl0dG9kWVlKRGFldzdqVC9NQUlRSlUx?=
 =?utf-8?B?SVZHK2pVdjBweVozOEJLekI4NGRpT1pqRFRLTmZtcmxwSlczYjNUbkkvd1A1?=
 =?utf-8?B?dTMzUVhKZUFtQTJ2cCtCcFBWbEJxR0xFcEZWTysxakVxaDJVZ05WUU1mL1RS?=
 =?utf-8?B?Y0JLUWpPNjkvTnJnNEJJVkdpSElpL1d3TVZRT1VtKy9NdHN2eHd6YVdSQ1JK?=
 =?utf-8?B?a2ZrSTlXclExazEvYlU3dndtSWZDYTJMcG1KMjhIWGs5SnVGem00bGQ2U3Jv?=
 =?utf-8?B?Ym5QQXpGQnk1SCtiVHg4akNDTEp3QWdHUENPdXNraHl0V0dyaFJWZ0MwaGNt?=
 =?utf-8?B?U3pjemt3MytIVW5WNlAzWldTbEN6Vk9IVEZCankvNFN5aXQ5NWxNRUViQldV?=
 =?utf-8?B?OHNpZ09QYzE3T3UrQ1JPZmVKQUYrQjRjUTBqZDJSTGZmajVpQURtL0hhTDlL?=
 =?utf-8?B?MnN1M3dydi9RUHEvSndmZXpDb282U2NGM1FjMjRHd3JObm1wVmJFODduMzJY?=
 =?utf-8?B?MWdudURVNng0WUlkMWJQNk1BNlpyblpEMnA4ak9QcXlKME9SN1VjbUdTc2JZ?=
 =?utf-8?B?MkJienJRd1VuUnRIWVIxV3lXdDFlcWFMU1NPMHZkdkVEQmlYWHREZm1XakEw?=
 =?utf-8?B?WlBpYWE2V3NJWHZtN0ZyMFliUTNrcnVKRGlISVV3YUlOdVNGeWN2QllweXNF?=
 =?utf-8?B?c1hxZGIvZ0RURW9KQWhWTTkvajdBV2haTHdwcFl4aThzSEV0bXFrOXFDWHE1?=
 =?utf-8?B?V0RmTlNiZkpVRzBOdEFVTDBkbUtMem40Ly9NWmoyN1ZWWkExb2ZUaVdmSHNU?=
 =?utf-8?B?U3FMa1AzdTU2ZlRvZ0luMTNyVlNyS2VCVUM2UndGWnlveExKeVR2KzBVRm1n?=
 =?utf-8?B?REFSeUNVN2I3dldCWS9ybHRWSVBUWS8zU0IybXVMQUpjRFcwMDFCRDM0SWIy?=
 =?utf-8?B?dXRnNzJrT0c1SWJaUERuN3RLeTZFTmxvZmZ6WG5pMDFGaER3ZURudGNmTHhv?=
 =?utf-8?B?V0VQUWU5OWcrZGp6N1c2YS9WdmRLWUNMQkZyWkNCMWRjdkNhWUlKcU1zaEJX?=
 =?utf-8?B?NkZXSzVqR1JmS2RiUVVON1QwUktHSVdzS1A1S1dCaUdrdWZGMnowWDdKMTlE?=
 =?utf-8?B?VTVCNXh0ZmUwUk1wUDg0NUp3RWtOQXFkbkZjem5ybThubGdWdFc2ZDdueXp0?=
 =?utf-8?B?V2hWWHJuVis3VVVHRmhiZGpJZ3Y2N3ppdHpHTmgwRFcwM2FzWmlSb3Rrdloz?=
 =?utf-8?B?b2R2cVBqWmZBK2g4TGxoZVU1NnkvWk1nTDV5Q29pMmdUL095MExPY0Z6Wk9W?=
 =?utf-8?B?b2EwdlQwREhyZEpPaVNhaUdycGdBdkNlZno4RmhkU1d1cGxjN1NzdDV2RlNF?=
 =?utf-8?B?V09uWmhDY3ZCUktYMVE0L2YyRVlUak9ONFRCZzhEd1c2cVlSeE9BNUhmU3ZR?=
 =?utf-8?B?Mmh5YWtsYTJGN0RacEhzL1F1WDZTRm8vN3owaGhOOFExQW9XVDFPWlQxWkV3?=
 =?utf-8?B?UDdxLzNXM2Ryd2RIV3Z1bW1vU1dhVEJqTWw1T1kvWDhvNGtxclNWbUVLY2xr?=
 =?utf-8?B?bjFIWm1VMk1heVg0VUFLSk51L1d2SC9kWXdLN0s5MW9GNGlEd0ZQczFOM21O?=
 =?utf-8?B?cmc4ckFnQ1ZsYk5zVDZLbHFraEVqOXp0WDVuMFBNMkpSWnZsdnJkUnUyT05x?=
 =?utf-8?B?S2h1ZFljKzZtYkx6LzVJWTdQcUZ5bDJVSlpCSWRUWWdmNC84ZEFrWlFlckps?=
 =?utf-8?B?ZzJBcXh0cGl3OWUvY1M5UnVmWkF2aU03Wi9uQ3lJbnFGa1gxS2NEcGNPZXRm?=
 =?utf-8?B?S0JsZk9EVVRqb1ZIaXNRNjFBNXg4em5YVmtNdDkyK0RreS81SVhhZVowNWFh?=
 =?utf-8?B?S0N2bzk0TlZTZyt0Zk05RURiZU03bjNMaXMyRFowd3FONW1lVnlWYU12OWdn?=
 =?utf-8?B?SXEweDliWkJFaUxxbkttM2tkTFJzbVVoNnpDOEZ6a2VGWmRKVnM1NFdxc3Vp?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EsNtB14i+aKE2XaeCAsN4oQdIZ5BTai9DSEJIqrnXi9Ocy+279e7bmcaxXGM1T7y/H5p3viebwDLusyB+gP53qU/feHKermYtMSybLIr9VkYCVuqFxlmd9wSlPJJX24IgSshr+FygjcihJkH/BV2nOQKBPd1/17q1nRMAzghz1kqFMMOm202yhutNr/NgZ0564R1FsGoRcqN2ye/9Knmh12jjMuoOttjxUpvPgRN2FIrbBn9zM+mndnseiB5jHNGugqFuN4X4l8pH9/FaFBCwAybKWDWYVB1VvfdHXzqAnBsSydHCt3gmG2oleT3aN4+dPOwGcSlkCGrpK9obtAlEoekd1NBvOfRcTTTQ2YPJhA5RtC+GGs3/+htCs57SV+Wl5FOEy9YghA69dU0mFgRk04m9A6ROQmgiHPuSSTzRygcIX3WUxL08X4f7qLB5KiRLnTbZkSk8l5cQpHzPyySJydnTdN2Sm5hd+97IwwLHOH5y/25x9ADSzsQM+CzWoGIC/z5DVAHyDchcrwOJ8coOXsxqsWKkEDqbFPm04w8llCzQNk4a40+EnrEprT88f5Spu7rVihsRIHY0CpPsTlxBa7S5RfL0HUG07sLo90wZ/wusqW+xYRbS7l5+OfDUdgM3zVfDpsdajRfwEmMpvGWXS5gMqwpAqet/4vsmzF/ZoK1FiW+Az9dwGw50/Id8nKcjPlG2+7VPvR95Iq+xTV+ualmvjdQy9pnVHJUO1cMvQnm5085ZpQMgBmw3IKGCuJM+UR6EPwedElapvv/vV/bvvn5jLGcWJ9iLMAyKOLY2QnIDznMT10/urxIpHfRUJ3G
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25f8978-a6a4-44b2-9217-08db140d0f8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:10:53.3558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7JrUerVO9hrI+4Tm/Pe7wRNnP0HwbMK+ytW/Gdt8DDJp++K4wcyvAAQnaQUqhOMxwO0w24aMEVuo+fC6YKEnH429UI3PdxDuiAgn60xHqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6557

On 21/02/2023 12:46 pm, Jan Beulich wrote:
> On 21.02.2023 13:26, Andrew Cooper wrote:
>> On 21/02/2023 10:31 am, Jan Beulich wrote:
>>> On 17.02.2023 13:22, Andrew Cooper wrote:
>>>> https://github.com/llvm/llvm-project/issues/60792
>>>>
>>>> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
>>>> unit, and the XSA-426 change tickles this bug:
>>>>
>>>>   <instantiation>:4:1: error: invalid symbol redefinition
>>>>   .L1_fill_rsb_loop:
>>>>   ^
>>>>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
>>>>
>>>> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mux %= in
>>>> too, which Clang does seem to expand properly.
>>>>
>>>> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>>
>>>> v1 (vs RFC):
>>>>  * Rename \foo to \x, reorder WRT \@ to avoid needing \() too.
>> Sadly, this is not quite correct.  There needs to be a non-numeric
>> character separating \@ and \x or the concatenation of the two can end
>> up non-unique.
> How that if \@ is always 1?

It isn't always 1.

Global (file scope) have \@ expand properly from 0 to N.

Function scope have \@ expand properly from 0 to N in a single asm()
statement.

The 1 here is actually because mknops took the 0 and didn't use it.  If
instead we had something like:

asm ("DO_OVERWRITE_RSB"); // \@ = 0
asm ("mkops 2;"
     "DO_OVERWRITE_RSB"); // \@ = 1

then it would assemble fine, but the way we build alternatives in asm()
statements reliably causes the alternative block to consume \@=1.

>>   So I think we need the \().
> Or put one at the start of the label and the other at the end?

We already played that trick with \n for the .irp, which suffers
similarly with concatenation.

~Andrew

