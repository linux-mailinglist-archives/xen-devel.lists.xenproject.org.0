Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5AC35F1DF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110491.210920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdLN-0004fB-V7; Wed, 14 Apr 2021 11:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110491.210920; Wed, 14 Apr 2021 11:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdLN-0004ei-QB; Wed, 14 Apr 2021 11:06:01 +0000
Received: by outflank-mailman (input) for mailman id 110491;
 Wed, 14 Apr 2021 11:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWdLM-0004dt-KK
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:06:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32345ef8-5b80-48cd-ba1c-4ade80f65af8;
 Wed, 14 Apr 2021 11:05:56 +0000 (UTC)
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
X-Inumbo-ID: 32345ef8-5b80-48cd-ba1c-4ade80f65af8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618398356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=d63wDPoILdpretEejbAnyNXF8PmnALolZwq0ccOsIIo=;
  b=cGI2lpJt2tpRgQA9KgRfPgN9nX8cVMI3u9LhlvpgTYr/4Ts0dXmYtX8G
   NBS99Iyl3WrAgqFUMEj3Li18+Z43LhfKJGWqF5a4TQUl6oMqeVvbu+PVA
   vi/JNFVj9ewvh5qtjUtLAUXe11OvPua7sSlnxB5R1dCgrHbSH/A0d/5to
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Eo9xcQdVdOVk4BsSVBQrm0A1LPBAIze0XBLD92ktVSTjZtn0wgjSvqSIXIlQV1a6P7VVqPmGi0
 9bBEFnqHeAaOWOCiQDSvjtOsiFV9Vv5Hmzn+b0wOxoomA1lq0BfL268bIpGr80N7h2EM6q4502
 zevp1tbwSZPshgE1RdgOXDueDvpRlmjQ0IO/KXrJy5l4bZ1a+EzxLABiXUQTWtN4xDuDd/GUys
 c7oW90EKqHBkYEdfEG3kehgOPvrRkJ76wINOxUGMNWI5W5zHbn86bj+anBIvAJE8yZk+7PIJ5h
 itw=
X-SBRS: 5.2
X-MesageID: 41690053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2GJp/KykilBv2K/4DD3iKrPxB+8kLtp033Aq2lEZdDV8eMaVjt
 3rufwd2wP9hjp5YgBapfmrPq6cTXTAsbt85ocMNbmvNTOWwleABodk8Ifk3nncCzTzn9Qtjp
 tIXopfLJnLDVZ8hdvn+wXQKbwd6fSO7azAv5a4815DVgdvApsB0y5YDUKhHlRyVE16A/MCZe
 Khz+5mgxblRngNdMS8ARA+LrL+jvnGjojvbxJDJzNP0njpsRqS5LT3EweV034lOlslrNtMnw
 n4ujf06am5v/awxgW07R6r071thNDjxtFfbfb86PQ9FzT2hg6kIKRnVrGS1QpFxN2H1VcwnN
 HA5yonJsR4gkmhG12dnB2F4XiC7B8er1vZjX6Rmz/KvNHwTjNSMbs9uatpNj/ir3cGkP45+q
 RRxG6dv4dQFnr77VjAzumNbgptkEWsp3okjKo8s1xzOLFuNIN5nMgn50VSH44HHCXmrKYdMM
 crIv39yZ9tAA6nRkGch3JoxtO0WHQ1A1O9W0AH/uGYzjBXmWoR9TpH+OUv2k4a8pQzUp9F4P
 mBDaRyiKsLccMMd6J6A446MJSKI2TXS1bFLH+SLVP7FKsOJnLKrNrt7K8o4fyxEaZ4g6cakI
 /KFFdVr3Q7dU6rE82B25VX7gvAKV/NEQjFwtpVo4J0sriUfsunDQSKVE0un8y8o/8WH83cXL
 KpNIhLBuL4RFGeZrph0g//X91JKXcYWNAIodpTYSPBnuvbboewr/fcevrIPrbhFy0rM1mPWk
 crTXz9It5N4VusXWK9iB/NW2n1cki65p5oFrPGltJjgLQlJ8lJsgIPj06+6dzOITpesrYudE
 8WGsKQroqr4W23933P9WNnJ15UCVtU+qzpVzdPqRURO035NbYFtNP3QxEa4FKXYht+RdjRCg
 hRuhB+/r+2NYWZwWQ6EM28W1jq/Uc7tTaPVdMRi6eD7cDqdtcxCYsnQrV4EUHOGwZukQhnpW
 9fYGY/NwTiPyKrjb/ggI0fBenZedU5ihysO9RIpXXWsljZrd0zR3MANgTeEPK/kEIrXX5Zl1
 dx+6gQjP6LgjC0M3Yyh+w+LRlFdHmXGrRbFw6IDb8k2ozDaUV1VyOHlDaagxY8di7h7EMJnH
 HsKiWSZLXFGVxYtndE0rv78V99e2mHFngAL0xSoMl4DyDLq3xz2eiEau64yG2KcEYPxekbLX
 XEbFIpU0dT7sHy0ATQlCeJFH0gyJlrNPfaFq4/f7ba3W7oLIWJkKoBDuJF5ZoNDqGojsYbFe
 aEPwOFJjLxDO0knwaPoGw+JSVyoH441fTlxQPi92r92HIkG/LdLBBnStggUpKhxnmhQ+zN3I
 RyjNozs+f1OH72cMSaxabeaCMGLAjSr26wR+QhsotVoqo2qbt2E/DgIHn1/WAC2A97INb/lU
 sYTqg+6qvGIJVzc8sbfD8c4kAkj82VLEwgshX/B+g3eV1FtQ6cA/qZp77T7bY/CEyIowX9fU
 OS9CBQ5P/JVSqO37xyMdNGHU1GLEwnrHhy9uKLcIPdTBiwf+ZY5VygLzu2a7lGUrWIHr0Wsx
 d369yFhPWMaiL9wQzc1AELe55m4iKiW4e/EQiMEelH/5imIlyKmLKt+9P2gzHtSze3An5oz7
 FtZAgVdIBEhTYjhoFsjXT3Razzv04/k1xRpTtgjUXg34C64GHdWUFKWDep8ql+TH1WKDyPi8
 +A7O2TkHL66zJB0YPYFEhRcspVcuJgOrTfPmNrM4wIoLWs/6AzmSxNbxclEn4khFnGrpJb9K
 b83O+XRvbrBnjpM08Q4DJJBoZ7mSowtGFLGvLOnq6Vc0EQEfcSD/867odLmDdnrEPs50YQBi
 8dwzAAx8XKNVzoP3N1CKjok8/3mXEj1da/12E=
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41690053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAAO2zG2lGWnUp6iideDlmOqR/ZjP6ZVsCxCvkdwRf8ExiAOEoM2Q157sMJaocSrUIVWpbLes4/6TR1+IDwxpZskuna+OeZG+ogPX5H28c9nEkwJHTe9wT2mrKWIx0fIdKJ7Xwtvy0skqAMUMseDOMOBTexndYT9RFWmA7np2xdE9P1F48HbpqLJkODibQD1GBbDG6Xh745ftdWfC501YKRLTXYMkF8fC5XNE6BBCEnzpdMtcDtd0RDLiaTOi6aiGbPNs4D2w97amQLSHcnjDTVVKQ2klPeIXmX7udCyItQtVuNHAO9GZzCufxtlAAUrAnRmqToJ2IOS1LKi8/mfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1EnhQpxzdq1GIcElCsvj1rntwwV7ItPVmtb3wEEy3o=;
 b=NQn9zoaxCNJdwXq5daafpH1bW8jCDPpCEAHC4cPLyptJZUNaBODuvT2hggfDsv9BRnWegbCoC6brj/GFTFxsJx0/osrMrutTEhDT7XPl9ptmxAXlqQjxGasZhMW9I3kQCRDuN8hwdzhmYC/bUOhmnvFlL6aILJ4wupnMLhPaJxAjXBxcGyca/69+lQUwXzn88PH1lko19YvkifIllHDHF58oTD9H79g2dFwmOekTo1HfRoqKmv3OH15z4U0Zz7+uMfGdO+eGnn1zYtGdUAEcG3kjSMehBJDSjlE7hWBMTJVMWkDBOkEtHXOEXlqV0772zwdCuVkUs2+aiWvd5JWG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1EnhQpxzdq1GIcElCsvj1rntwwV7ItPVmtb3wEEy3o=;
 b=R3PSfHZ/NI0SrVYpf/UW5v6lJYkBXOgkPcbRulniHmrVayMLV6KUKmRomXsGurDQNO6nmtlLcxqQf7eggq5bvf5javU9bnb6PpnWMJwk5zKM+G1ZXD5GswYJE8P1JYUw9EugvWfvxvE8HFM+02YMtAQ8wFa8e7uqR5sV9sfBUcQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID bit
Date: Wed, 14 Apr 2021 13:04:33 +0200
Message-ID: <20210414110433.83084-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210414110433.83084-1-roger.pau@citrix.com>
References: <20210414110433.83084-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4aa7328-fb6c-4bc9-f492-08d8ff353805
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB28420F50328397AB8021F33F8F4E9@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSMXqTgXK/2y5I1QYAiJfS8Xh0QQZ6omwSzhfhWdb3LXB+sNj0iOuTj8hMIEdPXoBVQb7lVccXMjHTWitypnXczD8bAKVphq7hCfAcqrfWX1LnOXRnGlOCften69mU6D5a6dO/QJc5R26EYAT8HG2LRs9mdzt2yIti3uFXpTsHhxslhAAnLYBO4sMtK1DxP3Wc391nU02p7g5pFs9/eFRrUIOAghocJcKItoZY0D1la8/3p623DtK6VB8p2qkUlUUK7EZ07bey1aBo5oauVDnpJivo7DIqT2KQ0JEfwsXukAYQIgOLtjK8H99wrh2n4cyvHGAd8iL+MouIMjUUfNdKGcSS/Fu3thJD8fFvdQrHRxCg2ZwAs7aM+EVNsG8tp2OoDWED/yK6Mot8ncSfDmODX7AvTM/e18z6aF46uT6vQxhlynCHxv+jRSfiOd45lqvH1TrZbFF0CblpEdTE57lWQf9dE1m2aClI3hxmKDKcwqzcJVykbR5Ak50XZ52jkdLG6SujRTk3gmfYi6NPY/amct2mUa5w9uwSajn4A/qa5e4ZE1OP9vaKHsJbGrevqHLwMswCcp4lXGSvbPlMy5iajm3BNryBd1eatqVvn0VYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(83380400001)(2616005)(6916009)(316002)(6486002)(54906003)(8936002)(4326008)(38100700002)(8676002)(478600001)(6496006)(186003)(16526019)(26005)(36756003)(5660300002)(1076003)(2906002)(66946007)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2RZcXBFQUp1UjM3b2lMN2tGVXZzaXZyekhNVFZoVWc3aHZkempXcnYzUEN4?=
 =?utf-8?B?c2kzUjVFS2lYbytzVTIxUlhoa3J0ZDVIY3V4bWMwRkNiZFliZEFpWUh0djBr?=
 =?utf-8?B?RnNDbFI5RURHc0lFMUdSVzVBdXlnblNZM1BGdGhEWDZSNHN2eVA5VktmMmQ1?=
 =?utf-8?B?QTNwYkFtVFEvZWZ6V2V1WHVocStPUHlBNzFrVVpVdEVkMEtwcFJmYUNjUHNY?=
 =?utf-8?B?cUxVVGVrNFlJWEdDUGMxYnV6aUJCcVdUanV3eHBXa0VBZ21CNzh1OEQzZDIr?=
 =?utf-8?B?VFZBQnJveFF2OGo4bG5hQXdON2QvYWFnZzdLcnM4V2prVGMyVlBydlM3d2V5?=
 =?utf-8?B?RkFuc2lrODhodEVoeUdrcnJmMnhCdFVMSGxGMjYzMCtwUWs1NFB2cFQzQ3lV?=
 =?utf-8?B?OVc0L0dnWmdsdmg3TGZ0ZjU5c3ZoK0VHbVdNcW81QU5yTmxtYnRCSFY5TmJw?=
 =?utf-8?B?ZDlrMW5WK1ZVV1RSWXk2eTJsVkUxRVQxbXFJOFJPU1dqSC9DaUFiK2dGVlkr?=
 =?utf-8?B?bVRya0JjbHlTYWhhYjhRRVZPaWx2R1hrTURWcVFSRkd4RTkrWmZGQ1Q4Vi9z?=
 =?utf-8?B?NkRHOG82Wm4zMDhLcCs5YjFCRTRRWG9US29nWkkyS0JyUTlUeVdFOTFXVDNh?=
 =?utf-8?B?Q1JydDdQZWtaVE1lYk1xbzNNOHV1YTNkMlVrVGo2T0xLYkw5WkZjR0IwemJ0?=
 =?utf-8?B?M2dBMlUzWDFBTC9NMkpFYnJ5a29CY0d3R0pJRHBOdHZWZVZFNkpPM3pVdHIx?=
 =?utf-8?B?b1V6ajU2NUttTERIUVAyQ2orRWk5emo4U2FnOFIxWng3LytXWHpkUHlNYjcw?=
 =?utf-8?B?T2ZtYXRpamFMSDNyajJlbEVxMFl4VklZZWtuaTNpaDJoVGRVS3JSODV6MHdy?=
 =?utf-8?B?RnhMMmtpUnJSSWtxUU82dWFZaVpacDgyL21PRDFzRmtwaXFISnNrU0MzeG55?=
 =?utf-8?B?OU5EaHZCako3RmR3cnQ5MW8raU4rZ2U4RTVkQTdFNWczbDNLYXEzSDR2OU1a?=
 =?utf-8?B?Z3I5OEhyUUxSY1d1eDVVR2htYzFsMndMQXZYSXF2YzVYaG5OZGNPemE0NGFa?=
 =?utf-8?B?eU82eTk3cHJGTHVjMUFBeFlMN3AwTzdyUVo3eGRvQ0FwRElFalRTM3EzaTFi?=
 =?utf-8?B?UVdDNGpMZmxmWE9rdmhBZ0VFL0J1T3REL3VEMTZqRG9kR1F1ZjZiZjlqSzJy?=
 =?utf-8?B?L0xwdmhiMzBLaGdQV0RZWEptelhtbk9xYVVUNTJ5c1RNYm4xWFZCMFBmeTVC?=
 =?utf-8?B?bFJzUjM2VldiWVRGRHVkeWE2U2cxWCtXWGJDUUR4VzhBcXNaSWdlbldRU2pr?=
 =?utf-8?B?RldEWEg0WUdRaVRMUHhPR1JxUk5PTy81VHdCenNqUGREQ0dhYlJ4UFdiTnhm?=
 =?utf-8?B?eDhjam1aNUhSdGd3TTlyZU5JNm4waWNKdW5iWWI1Q0plbFRVZlBvK2taUkhx?=
 =?utf-8?B?WlF3eHFnR2dGQXkxV2MvdU9lSGl4dHNPb2prbURTcXJvQWJpeG9DWlNGUWpz?=
 =?utf-8?B?elJzMDZwLzlsanRQMFB5d3dWcmFwa0xLazFVZEhKTEo3RnIyNDhQVVo1NjQz?=
 =?utf-8?B?a3hyYVd4RFhyL3pqcVl0Q3g4ZlFoREFZV1lNRTUrbUplU2hNRXBJMW9mK0c1?=
 =?utf-8?B?Q2ExK01rcnNuUTh5QXNaUjdLRHVIWGNNbjdGYzltaHVqSW1SYnc3QStkcHkx?=
 =?utf-8?B?S1dzMGhCbWVYbm1NTlY5SWkvYWJkR1F1aXRYaURTWGRiUDluMlBDQUE2bTVt?=
 =?utf-8?B?d3UxYkN2RUZwemhYd2JYNjVYWHpyb1ovemxKMTQzQStlV0EyOE44V21JY3lw?=
 =?utf-8?B?dm9sWGxnQ3MrSFZVQ0hrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aa7328-fb6c-4bc9-f492-08d8ff353805
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 11:05:31.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrzGwf3Zy8E9CPAeQhrU0fDWwzZeh/ekpKJzd4OXOPqDtZu4kr6cEbqxsXMb1GGnj6Kruqntdn5ik0Lel2uWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Milan AMD CPUs have an LFENCE Always Serializing CPUID bit in leaf
80000021.eax. Previous AMD versions used to have a user settable bit
in DE_CFG MSR to select whether LFENCE was dispatch serializing, which
Xen always attempts to set.

In order to support this new CPUID bit move the LFENCE_DISPATCH
synthetic CPUID bit to map the hardware bit (leaving a hole in the
synthetic range) and either rely on the bit already being set by the
native CPUID output, or attempt to fake it in Xen by modifying the
DE_CFG MSR. This requires adding one more entry to the featureset to
support leaf 80000021.eax.

The bit is exposed to guests by default, as a way to signal that
LFENCE is always serializing, either because it's mandated by
hardware, or because Xen has performed the necessary arrangements.
Note that Xen doesn't allow guests to change the DE_CFG value, so once
set by Xen LFENCE will always be serializing.

Note that the access to DE_CFG by guests is left as-is: reads will
unconditionally return LFENCE_SERIALISE bit set, while writes are
silently dropped. The MSR is not present on AMD Milan hardware, but
I'm not sure there's any value in adding logic in Xen to also hide it
from guests when running on such hardware.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/misc/xen-cpuid.c                      |  6 ++++
 xen/arch/x86/cpu/amd.c                      |  7 ++++
 xen/arch/x86/cpu/common.c                   |  3 ++
 xen/include/asm-x86/cpufeatures.h           |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  3 ++
 xen/include/xen/lib/x86/cpuid.h             | 37 ++++++++++++++++++++-
 6 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2d04162d8d8..38406baadad 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -178,6 +178,11 @@ static const char *const str_7a1[32] =
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 };
 
+static const char *const str_e21a[32] =
+{
+    [ 2] = "lfence-always-serializing",
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -195,6 +200,7 @@ static const struct {
     { "0x80000008.ebx",   "e8b", str_e8b },
     { "0x00000007:0.edx", "7d0", str_7d0 },
     { "0x00000007:1.eax", "7a1", str_7a1 },
+    { "0x80000021.eax",  "e21a", str_e21a },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 9c8dcd91eef..35f22c24762 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -646,6 +646,13 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 {
 	uint64_t value;
 
+	/*
+	 * Some hardware has LFENCE dispatch serializing always enabled,
+	 * nothing to do on that case.
+	 */
+	if (test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability))
+		return;
+
 	/*
 	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
 	 * certainly isn't virtualised (and Xen at least will leak the real
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e5c3caf41d5..0eb364f8a65 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -412,6 +412,9 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	if (c->extended_cpuid_level >= 0x80000008)
 		c->x86_capability[cpufeat_word(X86_FEATURE_CLZERO)]
 			= cpuid_ebx(0x80000008);
+	if (c->extended_cpuid_level >= 0x80000021)
+		c->x86_capability[cpufeat_word(X86_FEATURE_LFENCE_DISPATCH)]
+			= cpuid_eax(0x80000021);
 
 	/* Intel-defined flags: level 0x00000007 */
 	if ( c->cpuid_level >= 0x00000007 ) {
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index d7e42d9bb6a..6c8f432aee4 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(LFENCE_DISPATCH,   X86_SYNTH(12)) /* lfence set as Dispatch Serialising */
+/* Bit 12 - unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_BRANCH_HARDEN,  X86_SYNTH(15)) /* Conditional Branch Hardening */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index a5014798209..c67cd07b26b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -277,6 +277,9 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 
+/* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
+XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index f4ef8a9f2f0..a4d254ea96e 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -15,6 +15,7 @@
 #define FEATURESET_e8b    8 /* 0x80000008.ebx      */
 #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
+#define FEATURESET_e21a  11 /* 0x80000021.eax      */
 
 struct cpuid_leaf
 {
@@ -84,7 +85,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
-#define CPUID_GUEST_NR_EXTD_AMD   (0x1cu + 1)
+#define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
                                       CPUID_GUEST_NR_EXTD_AMD)
 
@@ -264,6 +265,38 @@ struct cpuid_policy
             };
             uint32_t nc:8, :4, apic_id_size:4, :16;
             uint32_t /* d */:32;
+
+            uint64_t :64, :64; /* Leaf 0x80000009. */
+            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+            uint64_t :64, :64; /* Leaf 0x8000000b. */
+            uint64_t :64, :64; /* Leaf 0x8000000c. */
+            uint64_t :64, :64; /* Leaf 0x8000000d. */
+            uint64_t :64, :64; /* Leaf 0x8000000e. */
+            uint64_t :64, :64; /* Leaf 0x8000000f. */
+            uint64_t :64, :64; /* Leaf 0x80000010. */
+            uint64_t :64, :64; /* Leaf 0x80000011. */
+            uint64_t :64, :64; /* Leaf 0x80000012. */
+            uint64_t :64, :64; /* Leaf 0x80000013. */
+            uint64_t :64, :64; /* Leaf 0x80000014. */
+            uint64_t :64, :64; /* Leaf 0x80000015. */
+            uint64_t :64, :64; /* Leaf 0x80000016. */
+            uint64_t :64, :64; /* Leaf 0x80000017. */
+            uint64_t :64, :64; /* Leaf 0x80000018. */
+            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
+            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
+            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
+            uint64_t :64, :64; /* Leaf 0x8000001c. */
+            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
+            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
+            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
+            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
+
+            /* Leaf 0x80000021 - Extended Feature 2 */
+            union {
+                uint32_t e21a;
+                struct { DECL_BITFIELD(e21a); };
+            };
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
         };
     } extd;
 
@@ -293,6 +326,7 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_e8b] = p->extd.e8b;
     fs[FEATURESET_7d0] = p->feat._7d0;
     fs[FEATURESET_7a1] = p->feat._7a1;
+    fs[FEATURESET_e21a] = p->extd.e21a;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -310,6 +344,7 @@ static inline void cpuid_featureset_to_policy(
     p->extd.e8b   = fs[FEATURESET_e8b];
     p->feat._7d0  = fs[FEATURESET_7d0];
     p->feat._7a1  = fs[FEATURESET_7a1];
+    p->extd.e21a  = fs[FEATURESET_e21a];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.30.1


