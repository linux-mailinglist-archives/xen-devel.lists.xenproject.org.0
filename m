Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BC4D0475
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286325.485815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGUv-0002Gd-KU; Mon, 07 Mar 2022 16:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286325.485815; Mon, 07 Mar 2022 16:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGUv-0002DQ-Gq; Mon, 07 Mar 2022 16:46:13 +0000
Received: by outflank-mailman (input) for mailman id 286325;
 Mon, 07 Mar 2022 16:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRGUu-0002CU-Kq
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:46:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1623b512-9e36-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:46:09 +0100 (CET)
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
X-Inumbo-ID: 1623b512-9e36-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646671569;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=tUhqVK/sRlvClYdwwc85nr5730j/G6l0BNTVO7hMWTA=;
  b=AWjEQl43/f98zv2oi1Tcrh6GRr7smDyvzyLwDdkKYakcySrVbeVPcH4E
   7osWi+P1hWKbJgRhPaYcdFVOtZk6ScTZi655vrQsi0nJ7QydoyxYvghyc
   aLkkTbQNjejphcXxjThdPMUUJjYJQZ/og+dD78PZWjCgWG5H7fdnI3Tfn
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65107497
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4VjIeqk/MHDubf2CV55iw5/o5gywJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCDvTb/iNYzT3eNwib461oEgBupTdmoMwQAtr/y5mRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZEQFDqzrtOskWjJ7FzBaP/FM/7zbCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uHP
 5VFOGUHgBLobCAMNH4ZMcwEtdixrXvdVDlAqFnMuv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJW66/prjVu71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ZDGxxrazgTyLMAM2KX4mZ3MOSggZyoy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxl4hPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2zaD/LF7rlxBHkJPmqgKvFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i7C6GKNoUVMsgtHONiwM2JTRTMt10BbWB2yf1vU
 XtlWZzE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39q
 o8PX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJINQ0z/wIzb6Tp
 hlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJtHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:N3t03agE9qTFxCFEGGRe07x+4HBQXyx13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbq6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MH40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIeLH45JlO01GkbKp
 ghMCmFj8wmMG9yLkqp9VWH+ebcEkjaRXy9Mwg/Us/86UkloJk29Tpa+CUlpAZwyHsMceg72w
 36CNUZqFg3dL5vUUtcPpZ0fSLlMB27ffrzWFjiUmgPUpt3eU7wlw==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65107497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM5F9SAbURIfyypv+ukQ5/d3HLYF0NUEjAkMPkFSbu9V5AgdJRobl/5ESvS56kyiCOlu+cd6UctApGQ+vYB3zoD8+QM0th9m2GHaQD3Io+/BghReb80UNSpi1xGZuNvO/vsgQTdH28AYa0XYuTNF98wnhw0PR0CBcvdYRyvZf1fSVYV/sEYajXpM4qkFNXfJmmZDS77H+gQm1Ywhvk1wJaKYfqL1PmcruPxWwgq7aKanL3Ij4WISNhQ8QHKA4ykicD47CF8oIMPAf4wZuRI7WEyK2rMwDHEw/DlAaGNoCl85zfDIwdCa8l9sWmG4V/b5SqwH8mQ/82uzIGmjgjGP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t08aK4lKbx3YUPdgoKlaHSJWBc36sDwBIg64iJAj1/o=;
 b=GsBwzU68MVNGYxej78E9q2MqogT5/R6xv0saq8XOuD1JXRGGGK38ZTREr13NWvdnJP/Y9CtGM0oo2GDW0Fa45etnxYYI7OdTFyGsm3lrteVkMkg0mYkjFngm93+oIF+VoY8ty/lzxZWDBf1hZL+/PkyDsReA/HQHR+8znbCIESl219FWJ/Il3l2DrLPI/zqS9t/SRNV+ls9xzVPbQZemSBw2C/gPYE9cjvINUFrRLhFKo9WVXI0nYfowRy+71ZROUqxUaVlS9Z4PNsMWj/4mkuOYdQ4gAu+23bql+NaOHNU6SD+v98j4Zf9+5eUUjmFuegRH+OWosPiNEr4gTCpGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t08aK4lKbx3YUPdgoKlaHSJWBc36sDwBIg64iJAj1/o=;
 b=fR+qDQlIzsOFXkTaHRwdVbAJbkpry8tLQ0PEf+NnGa89akPRH3kzQWNPit3uBWxM2xIMDA4MEnAfKlWIpoxQnjBzAmYMFn5uzwc6Hi27yBCXahUqqUChjhcw1Jp5yFA07ZKRi7XVlsJYKTZuKNYxpmgKMe54hf8nzlKMLaAldBE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] codeql: add support for analyzing C, Python and Go
Date: Mon,  7 Mar 2022 17:45:52 +0100
Message-ID: <20220307164552.74818-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d07b694a-cd1c-44e9-9c20-08da0059f521
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5805:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58057F55A05AFF5DE980E1668F089@SJ0PR03MB5805.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6TZqXQfnELSwEkc70If5YBxx0oAUGA4ZtWHTlnSFD8vEUUKvona2VjzG0wUNkmwgCSLCrZC6Ya+PtL7l6YylzoIGIIytGg8FILTWDvsBscrVQo44bSHl2sBwVY+DfSsm8LM1/WjT+2i5dSRLFUhWCnhDyEyHrs950a3zJxUuJL+SRZqUWwdZaqyuqcGZUx09c6wRgyuTu32TFMc3Fcby+uSJyNfg6nEU67FDqYLdXMLCB8JrLM6+irbk9vwXWDHOwLpnCtRY//8cp7hMHgc10Vyrb8vJGbtYFG1c1s6lP63H9giR6r5j0Tg+r+paGSFl1dsA2ahEV2mMNOTZ2G+eWoF0AHQs26jRXlO/k5z7ndphOfTxMfgqNk9Kgtf6ov5G7aqgjbVWPmrXeVud8BJ59ZTf5mos8p6PVRLqdw3t2n08kyOMg8yeRNtO+T7ewqG39/BdVKQiLPiNKqOYbE9b8wJA48A0jhgK8IJUkXpN7vg92M3t+wN8oOaMcye68jRVeZL/Dd7WU70fyjvMep0e7VwamqGb7vNKdHnUg5/DbWCPq26Xjh+d5utubNUNhVITcaqo5xko7q0lMBhKbs+BLqhgbQDhkVUAUT9V5DKA37pUJi4zoCuo1Axt/nlg7yA3FLrlI4RI7zlClz36G++QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(2906002)(5660300002)(8936002)(2616005)(1076003)(186003)(26005)(82960400001)(38100700002)(83380400001)(6666004)(6512007)(6506007)(86362001)(66946007)(66556008)(6916009)(36756003)(8676002)(316002)(66476007)(4326008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk1aYUpQbkdjK3hkOXN6TVFkUzBZMmJ6ZS9LK3VXdUtjWklWWHN4a1BjQkhV?=
 =?utf-8?B?RTdHWHorTm83QXdsS1lhaXBoR3VRd3g1Nm93MnZ2Y21pV0JMZ2FyWkZhNEVL?=
 =?utf-8?B?L1lBaG1TWFlVWk5TekJUZ3BheDJjU0VVU2VEZHFzak1jV0hkNWtCRzhXT1Zq?=
 =?utf-8?B?ZXZKcE1iemZSZnBieERFanlYZkovcFI2L3lZSnBxajZSUzB6MUlxZ1BzK21V?=
 =?utf-8?B?M1ZPancvbTVwdGJZSEpaLy8waVJHbFV6dVBtNVViMU00TGhvNk5lN2JQOTZm?=
 =?utf-8?B?clFBMlRScmh6UTcycEZNWjdhMVd2MTlIWGZQRUVuOFZQQ2lOd0ExT0RsZHBV?=
 =?utf-8?B?QlJlTVNUTEVuRm10UVJGN201UG1VUXkwSVU4K21LcldOQU93d0N0Wkd5RmNB?=
 =?utf-8?B?WEd5WklILzN5NzRza1FiT0VlN3gxQ1dNUmlBR05ETVU2QXJ6QjdlT2NBUGRl?=
 =?utf-8?B?K0UvdU9JeExocXJod1RPancyamY5QXFTY3pSM1NRTnYvTUJoN2w3TjFyVVlz?=
 =?utf-8?B?THJhVUxyd3B2bGlsa2prNFlrZUFFRTJBYS9LWGhwRzVzTW85Q3BDWDI1czcw?=
 =?utf-8?B?SklmeEdKVk9sNWVMK2hZbktBVlprbDdzbjNQUmUyaXBvYlpKNjFvNEMrYlFw?=
 =?utf-8?B?UCs3L0xxM2tEcitGTHB6bE5yUTBqUy9kZHo4ZVRiaFRjREQ1SlFTdWljd2Z0?=
 =?utf-8?B?OTQ5Nm9JNmdGcnFibXUxWVJaYWducnUzZ2F2WTlMbE5XbVZRc01Fbk5uRHBB?=
 =?utf-8?B?c0w3cUpZS1ZOakhCQmZFRFUvZ05GdTRrYmNiMkkwOVFIcUtLSEJieG94U2ZD?=
 =?utf-8?B?MHN2NjhUMWJ1Q1NxMVkyMWJMK05kMGFDZWVJOWQxODhNYkt1a3pObWl0SG83?=
 =?utf-8?B?SXRIMjZITVZ0a1M3ckFwRE1NNFJXVWhjNy84WWRVVU1FbjBvZjFia0VwV2Q5?=
 =?utf-8?B?dzZ0S2o4MDJJRHh1c1g0amhoQnJrejFMN0tqbjU5MEttRjM1SlhEN2F4c2JE?=
 =?utf-8?B?R1FheURoQUI1MCsyT1FycExRRklIN2pNZmJQTnhMZVgvUk1xVGp3cmZxZHZv?=
 =?utf-8?B?aHpGUDNRMWdDN1UrRjFCUm5mRndENW9ZWEpLbmt1RTNvTjZFMEtRcDVEa0dq?=
 =?utf-8?B?VEhLeFFjSktjK0xtaE96YmRQVk9FbExkNm1XSjhzTFJWYVlpK1llSU5HRTls?=
 =?utf-8?B?L3ZWTGlTUDUwOWlUWDBBNDFBZjh6cU5iZFJCS3N2cTljVXEyTUhaQ1dtcnRL?=
 =?utf-8?B?OFBrRjNSMVpBejluY0lyRlRtZ3pCbzhhNWpnOFNoSFg1Q0hMVVBKOTdFd3pB?=
 =?utf-8?B?Vjl6eU5leVNLeWVGd3ZVVk5jeWhSaElVN2QyNnpTNGNtbENvdHU1a2ZJY0hz?=
 =?utf-8?B?aEk0SW5ZUGovVmZmQ2lNNmtCWXVkbVhxdE1Dc2YrcHZuNkFaeVJybEFETDZT?=
 =?utf-8?B?MFMvVUFZaFdkLzV4Q0VodDJqM0hvOEJIakMrR3FnUjFwaEE5Z3lnajdFY0lP?=
 =?utf-8?B?N3hSNVVWSHdSeHdGOXltTlhQclQ4ZzZCSjBTSEUvWDQwME1tNGZpZFloNFNU?=
 =?utf-8?B?YWY4MDUrOGFnSWhsWG53OURZRDZoZ0tTZ0JuRTBiNHdNaW0vclZPMkFVNWlL?=
 =?utf-8?B?TFI2SDNqTCttQ01QTzNXRVp5cVUvTnV5VzJ6cXpMdWRoSGhYRHR6cnVuTzZj?=
 =?utf-8?B?U3g3SVJNbW1yWjM5aWVVTnJpUzVVeGQrZjJRZWloem1PRWErd0dWTGpUZllv?=
 =?utf-8?B?VXlFMkxzREkwQ1dBM25VbitvMEM0OFVPNXNDYkt1MzhJT0RlRFkwcGI2a0tZ?=
 =?utf-8?B?WVRYRHVnUzJtczI4dXZSTlRvcldCYXBoekZZRktqUkM3ejZDRXNHc1RNVjFO?=
 =?utf-8?B?RzVOMFBuNWlKQkcwYTNpbGVVK2JCQnhFQkkxZ0Vxd1A0OG5zM244V0lwNkY4?=
 =?utf-8?B?d2VOMXU1QnB2WjdQanpRTDlwUWp3SW5SVDkxbWptUTJnZVVjMFhQdVYwN2JK?=
 =?utf-8?B?cWIwNUE2RmNCc1AyTWNrclJsUWhGSksvdlFxeGJSUTFuVURYQVlnR2MrNmlr?=
 =?utf-8?B?UVh1VUoxcnlYZlUrS3dFL2FlWjRJcUFjQVlUNW9LUUtUanhzTlRKMHdLWUFM?=
 =?utf-8?B?eTZjTGEzYXpPWTU5SjB1dzVremV2MmRvbE5uM0Y5aWpycm5rdFYyc3VYUyti?=
 =?utf-8?Q?b2rwDgeMV9rtxCQu3bCQHw8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d07b694a-cd1c-44e9-9c20-08da0059f521
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:45:59.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWQwEOzKCXkgOSt79NEdrVu2wTZGh3yJOj69rsMo+2Hdd6T0aypw3OJAkuAI1RD7HuBLav6pNBVI9BBoseDtqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5805
X-OriginatorOrg: citrix.com

Introduce CodeQL support for Xen and analyze the C, Python and Go
files.

Note than when analyzing Python or Go we avoid building the hypervisor
and only build the tools.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Rename to note it's x86 specific right now.
 - Merge the ignored path patch.
---
It's my understanding that we need to force the checkout action to
fetch 'staging' branch, or else for the scheduled runs we would end up
picking the current default branch (master).

Maybe we want to remove the scheduled action and just rely on pushes
and manually triggered workflows?
---
 .github/codeql/codeql-config.yml |  3 ++
 .github/workflows/codeql-x86.yml | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 .github/codeql/codeql-config.yml
 create mode 100644 .github/workflows/codeql-x86.yml

diff --git a/.github/codeql/codeql-config.yml b/.github/codeql/codeql-config.yml
new file mode 100644
index 0000000000..721640c2a5
--- /dev/null
+++ b/.github/codeql/codeql-config.yml
@@ -0,0 +1,3 @@
+paths-ignore:
+  - xen/tools/kconfig
+  - tools/firmware/xen-dir/xen-root/xen/tools/kconfig
diff --git a/.github/workflows/codeql-x86.yml b/.github/workflows/codeql-x86.yml
new file mode 100644
index 0000000000..a3ec6236c4
--- /dev/null
+++ b/.github/workflows/codeql-x86.yml
@@ -0,0 +1,60 @@
+name: CodeQL x86
+
+on:
+  workflow_dispatch:
+  push:
+    branches: [staging]
+  schedule:
+    - cron: '18 10 * * WED,SUN' # Bi-weekly at 10:18 UTC
+
+jobs:
+  analyse:
+
+    strategy:
+      matrix:
+        language: [ 'cpp', 'python', 'go' ]
+
+    runs-on: ubuntu-latest
+
+    steps:
+    - name: Install build dependencies
+      run: |
+        sudo apt-get install -y wget git \
+          libbz2-dev build-essential \
+          zlib1g-dev libncurses5-dev iasl \
+          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
+          autoconf libtool liblzma-dev \
+          python3-dev golang python-dev libsystemd-dev
+
+    - uses: actions/checkout@v2
+      with:
+        ref: staging
+
+    - name: Configure Xen
+      run: |
+        ./configure --with-system-qemu=/bin/true \
+                    --with-system-seabios=/bin/true \
+                    --with-system-ovmf=/bin/true
+
+    - name: Pre build stuff
+      run: |
+        make -j`nproc` mini-os-dir
+
+    - uses: github/codeql-action/init@v1
+      with:
+        config-file: ./.github/codeql/codeql-config.yml
+        languages: ${{matrix.language}}
+        queries: security-and-quality
+
+    - if: matrix.language == 'cpp'
+      name: Full Build
+      run: |
+        make -j`nproc` build-xen build-tools
+        make -j`nproc` -C extras/mini-os/
+
+    - if: matrix.language == 'python' || matrix.language == 'go'
+      name: Tools Build
+      run: |
+        make -j`nproc` build-tools
+
+    - uses: github/codeql-action/analyze@v1
-- 
2.34.1


