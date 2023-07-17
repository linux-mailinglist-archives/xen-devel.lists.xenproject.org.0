Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEFD7566BA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564666.882265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPUp-00041p-7B; Mon, 17 Jul 2023 14:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564666.882265; Mon, 17 Jul 2023 14:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPUp-0003zS-4A; Mon, 17 Jul 2023 14:46:43 +0000
Received: by outflank-mailman (input) for mailman id 564666;
 Mon, 17 Jul 2023 14:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLPUo-0003zK-1I
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:46:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba7ae29a-24b0-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:46:37 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 10:46:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6363.namprd03.prod.outlook.com (2603:10b6:303:11e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:46:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:46:32 +0000
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
X-Inumbo-ID: ba7ae29a-24b0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689605197;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AKc1rayZswtsI6jewBKzEIGp5stt7lwKm0+5C4FcIWQ=;
  b=AKxHB/ji6DKbiw61nsVFl84PTRZiicRHCoMocg2t73ctTeBDKNTHeVji
   KdRqmdxcg8fGP7mtBIAxgMt8bYPsodgdxZ+A9YFj/u7CzYzNwsomi+Koj
   HoqnViGHme8vLKo2W5z1WDwn7d0i///51ecjtFIAcngT0+wIjKW0b8ZsY
   M=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 116348375
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CUiE4agBkJQ3ivKnX8Hm7TWuX161RBEKZh0ujC45NGQN5FlHY01je
 htvUGmHOaqIZ2Oge95yaYi0/BxXu8LWn9U1TgporiA2Rngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQAEzkGcy2gjti1/4++VulQ3dQaApHSadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGybrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiBtlORObnq5aGhnW1z2AdJiQRCmCyvKjhq2+fR/AFI
 nQtr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3URX5NkcHbC4ACAcAvd/qpdhqigqVF4k9VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:xMXQca+CKT9BmEQY6lduk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HIoB1/73XJYVkqN03I9ervBEDEewK+yXcX2/h0AV7BZmnbUQKTRekP0WKh+UyDJ8SXzIVgPM
 xbAs1D4bPLbGSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-Talos-CUID: =?us-ascii?q?9a23=3AZAO+sWpf/j38AIrtClpcc4DmUdgee3bA8VTZGUy?=
 =?us-ascii?q?HNGN1SIHOWWa+oJoxxg=3D=3D?=
X-Talos-MUID: 9a23:iTOGYAhlpYTc1bANzDU4I8MpEs5k7YqXDx82mIhX4+ilFDBSYT6ltWHi
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="116348375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTrML7wCtpbGGMtThBoC9kAN7An2olRq7dDXqmwBoRVgnVuxyhhwA4mRtIT+zfxWeaGLI+JP0LKQoRGdUvEypi/IwzA0rL8FQm1a2smgWPBi/ncOb5yObDzBBdk/h6I+uKbjENKyzWE/VsKLVtD3FxWKmTc5gl7fHrLw+Kp6pRY4MNB6SP5n0OiaTgxtHMZ19ooEwl3YWgT5eB8HYDsMARIZi8jQIEifhbwOtbOTUauZbUxrJm26ECSeOC/RK+AJtujAcKGLq9DMM6GADa4IwGKXue6mI9yKrmW+coZAjAqUduJhRqBolalwtUA8+mILUtijfKzVCvJGwxTGQdls4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XE6hngjyvDPrBecSEUxnjPDwhFaAoQ10IEUjLKS+y8=;
 b=oebvgRgMI9wWQEKuhVvIEFJOFE4fUq8w9stlwr4zHuupq/AXU3sP2sArG1tgVJxF5XhyB7ERQLs91gGBG8I/npgAshf0A/BhGVd0jAXLX9hGc5BZAXwlHaVxoln7XX7V2hOGhmv6hrQ2PU+RrzU3GR0eUKl05aEjBbB11kZ7YpJ3vu1G7/oNNnc82O80tgmjwyXtqNRPqiXpUJu7McI1x3qyUCvbaW2FhOhZFrwW3kj3RSvFFscq6oVWFY75oS+qzkQbvwnsOOr15AXEbSgBhNnb8ywNLOdFkXiwSx3Z0AtiyKauGypFlBdvA39FTegIsE8oFuk5S01Z1GRrplYxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XE6hngjyvDPrBecSEUxnjPDwhFaAoQ10IEUjLKS+y8=;
 b=JY4QO+Jems+ChQNr0EDAd81P3tJBN4U6VrWwiOwVccXGdwV43940XCQxBZzpgCpTiCr2DzNCS3u+f24f9XQljrZBoUtxyh3cYsXwXXean+KkB0Mx1C1g3RWL0GWTHelL5W223ZCw9qjJnCHj4MmUIgFZvJ1xX5t3c1J3js2DjzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 16:46:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 6/6] libxl: add support for parsing MSR features
Message-ID: <ZLVUQdM3XtclUw5l@MacBook-Air-de-Roger.local>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-7-roger.pau@citrix.com>
 <48d5ca83-d14b-44e1-9431-5324118eacb7@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48d5ca83-d14b-44e1-9431-5324118eacb7@perard>
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3a6fb8-29ba-4355-0955-08db86d49c31
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBILFz6voRX0x/PTKZmH97rBtQ2JV3fPHSjF0FJ6V550//tA3+dLHgpW2iJiOLkQrzsEvEHk8oZCvT4kv9uDYEzXtF8DZ4kASMZJ957TnPu1vfJQIllqbDyXA9GggaeG+7V+H300IhiDUpgmmmzuUPPkMcvJgHOdIghfDtzj/zjb/RM+FgHE/R3r3MzAaOIT74zhIbR6d43NWztyW3Lw6jtupmIIcy1WaexLcMAZTH5luT7JfrxhFCxxcmzTFEHHFcAm2OUaa1/xAdZKp2qv5Dh2ehHbIBYl6stBzRN239f8MxLkoU4plKSXJG8fKtav1BqZn5Q+lZ4aXlf9I+04EzpC8mwdUMBfmV3uZvRzLoHQzRokqPH2G2slxrQ89zg43pmApaw8aeaHMap27Ww4so1VwxnYD24+pVqtvBsRvfAylJPhFR7t/PvZP0k5HEadPiuB/YCTIwLMj1aZJIcPNhc/BbGhZPUtuScv8jqyzK4Wkc8A9qrI/mujNAKDulDUlu26frj2VLWhtMQU99+cYw/2JACEWfeHzA1nX95xDxL/z2yWHyPtjJ8MHCcFdIf9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(8676002)(41300700001)(66476007)(6862004)(66946007)(2906002)(66556008)(8936002)(9686003)(6666004)(6486002)(54906003)(85182001)(86362001)(6636002)(4326008)(316002)(5660300002)(6512007)(38100700002)(6506007)(83380400001)(186003)(26005)(82960400001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzJMajJ0dTFFOE4rek5FWHd0emY2RzIrQ1h5OElqaFJqczhiNmF3NGljekhr?=
 =?utf-8?B?QVJxL0hXaDhGV1JmY0hpWmlvRlRJRXNwbjZybXRIZDFGdW8wQjY0dXN6QnMr?=
 =?utf-8?B?MDZtREpVcTJmcHBtejdyc01LQXFBcXFYWGNlT2h3WnlFSGV4dERMUm5sdHl5?=
 =?utf-8?B?ZTNQODczdzVjcmY2MFh1QWlROTRobzhLb3VXMlB6ejkzVjcwUkpwa3Z2Vldp?=
 =?utf-8?B?YTdrUkhjOE0zWnRMQngwbmpYL1VJQm41M0hnTTNqWjFNUnFUeitocTczMENk?=
 =?utf-8?B?UDl5cTB4RnZycnE3UHhDOUVocmp1VXVpaWh2SzJFRlhHdWduMVhuNFpBakp2?=
 =?utf-8?B?QXlVaVJ2dys3ZHlBVDlRYnhnWW5Lb21GQVdVM0hGd3k1eVY4NE5aVzJYTlhO?=
 =?utf-8?B?SldPZVFSU3J4aWFtQkFvakRmSDRhZzBJZVJaSDBhK1FCNkJnTlJZWFlpTndH?=
 =?utf-8?B?cjUxR3JhQno2SEJyakdBWkFWbmNkUlpoclloNytTNzhlbjdTM3hiQ3ducFlu?=
 =?utf-8?B?c2dNajdtRkY1dUZqcUlMVWMySGh0cml1NUpIemRXVlVCeVhSNDVMMk1WaUhu?=
 =?utf-8?B?QVEwWVZtcTBMS1gzNXFwZStmcWg0QUlBbTdZVlRhT0Q3czJmMzlGOWtDL0Zu?=
 =?utf-8?B?QWpHbFZIOEdSTU5iQ1BVTkNFd1A4Tyt5VkMyUWxOYitvVUk3Sjgyb2diai9D?=
 =?utf-8?B?TVh6VHVNT1ZoY3NMbjE4SEVUOXdoNElPd04zTkJSdURkbGNNZit2Wnl3YXNl?=
 =?utf-8?B?SzFwQUwwY201bDFhUlRhSThOT3daTm5WMmNCQmdJVUhxd2lTYkJTMklEZnl1?=
 =?utf-8?B?cmhYU0djOXZ2WUZqZlg2QjczenJpZ0JnVHBlbk1jV1dWYlRLZ0o1V0pGODY5?=
 =?utf-8?B?Y0RqV3NqRnhuL2hMbUhGaHZLMUZ5VXFzTjVEeEF6OW5rdFRzczEyM1ZrSTB4?=
 =?utf-8?B?cWMrRXF4UXhBWGZHQy9GRzdQcFdFL0lXcE1scUphV2JBY2phRzc4TEZmd3Ev?=
 =?utf-8?B?WS9taUQ4UllHL3JLNFdTRHNadUl3eG1UWHZ6Zkx0YUNaaWJOU3RvdUJPUXVa?=
 =?utf-8?B?Z3RkQkl3TkFSUy8yV3A3NGVuMjZKSVM4V0N0NWFJc1ZqUWV6UXVNS20rUXRv?=
 =?utf-8?B?Y2NjT1NuOHRNT2JSTUpKRE5KTVVEa21vMDkxUTk4WXl6eWZucEk4Ukd3djBM?=
 =?utf-8?B?L1p6ZDFWRUd5MUVQUlk3SGt1bjRZWkRWNlpOaWNOU2piQzRIWTErU3duTGJz?=
 =?utf-8?B?Y2xlSHpwSHU4NzNpQ2V4V0hvN01Va1NBd2pud0sra0ExRytvb0l5ZDdiaUFN?=
 =?utf-8?B?UTNydGNOMHNKWlgwem83MGZGSjlFTkozeVlpVFFOTXZzYVRuZmlMSGE1TXRr?=
 =?utf-8?B?VXY0R1FxL1JldjkweStlY3V2dG0zSEdUb2RsYVRDeUVTWnNJdnFpVlNtWjVs?=
 =?utf-8?B?NmRSQ3JNUlI1ZzYrYWkyOW1OSkhwaWo3V1Z2QzZoQmIyT2hsbXo0RmxCU2xK?=
 =?utf-8?B?eHAyeUlwU1lwcWJWZE0vNENHRTZybTltaks4ZGVUTHFFKzFIdnppS1V5VXAv?=
 =?utf-8?B?OVdZVzNIVGl1Q1RxMmNoYnZNazdMTURlTWp4S3MvR0E3K0x5MnVHTm9YSzRy?=
 =?utf-8?B?Mlc2Y3ZhaVJxSnZkTzVqYW5QSUVPalpHRXdVM2pTc0ZQZlN1NnBXQ3AyMDRp?=
 =?utf-8?B?RzVzZ3R2YmE0N3lEakordDh2a0NVckMxTXBqRStwYUhxelhlcW5TTm8xU3Jk?=
 =?utf-8?B?R2diOFlsdTY3MDNISnNWWk02ZlZrcGllSDBUNmpLMG5GMVVZOVVJaGM0c3dH?=
 =?utf-8?B?Y1JSbm5sRm54ZG1DYUp4akZEdFVjUVhjUVFvVzRNUlpPOUhtUXV5TllNVHIw?=
 =?utf-8?B?NDB5TVluVjVkV0UwU1FXNkhyckNEMUg1QjVDMVczb1k3d29QUU5sYTUyMElt?=
 =?utf-8?B?UEJ4UnZGdmxyRkdmMzA2UXJYVzhiSWFNbDVLazBERUFrWDFla3g3SEtRK21u?=
 =?utf-8?B?UlBzcnlzOXhYQjBBeldhR1VSVlFHd0Vkay84Y3pWakhoZStmVXpNaG10ajNQ?=
 =?utf-8?B?WEp0V0ZVUVpBWGp1Y21KSFBOU3RXV3hMYzJrZ0ZabTdNVmJQVi9iYWlLaVMx?=
 =?utf-8?B?WERTUXVUSWxPSnkyYlVhUTE3WjhpOE1BZTUrMmtINGJqYUV4ckRieEhUcWx1?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hxrQ6nWVLtaq1G8BPCQFkTLtEq+z/CXzLoxPql+lxIKHT6IS6u4cM/wju0Rb9MtdNSKu/rrTHUxBS3/chq8wmCFcnRtZwPHhhVpHYoaLybwhK9Vj83We/41f8zGmnBKQVAqc9PFIi1U14At+GYv7DbPflTn0D6rTej42CoKkb+ZWWeHtGngKKllkmU0LCO3jGop9vZC87iS+ou/ueSdqEUZnKqJud+qG5C957LtPygixSDReK96M2cYEo7Gy27LsQf2bT3LmMa8O0d39Jvh7h8peHbYE/xUz3igfBkaxDzNR7ugpfC8DnE3aoMSgICjNshGzvUNyEdbZH+ukF6ozEQLleWsTS/ilhfmksYSpbeNiMd+S8NNrbaHxAPAAWBNcwSuqp6mXS7/wP/1k/kdlviQDkACSciWaTjqkAV1BMKx2fTxFl9R1L5Qbpjjd+InhmIFOHtLT5kq2YADkR0EoOMbwGOWZ6VxFZzQ7gmcli/O2T9I30hu/1WtE5SnrhQHBMl4ipC1syn9CR4MUXTpkf24DumFESyoSowfofyu9OHRijWjM3A9INUmcZyn9Om8T2fSaT1YoUGiu5Kd/BtrSrzRfaojQiKnQ7xWCp1Lm6COO721zVGd1SuPp4BrxDrBFbYl8GEpQuJrcflXZMM+3VXgMWcjKospstre9r/Yf/sSWpjSb8FyVlvXg2joVXQ2vfnezeLubHi/QcIKk7GO7bwfp8+JPZLN9mo1yPEsHNzkIX6Ldu78JRhO8wvh2I9cV4iwE4NfUf5GieVA6/Oi/EYOpWuS9XGc2GlGuthsl99cxpKKnGYxqoP7dFvPRJRIZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3a6fb8-29ba-4355-0955-08db86d49c31
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:46:31.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9wNQ/iOnS3GFQeXKh+IwYKkct+kz3dKHLICR5vqGPCzQZBrEI3alQFeZgLLrogzb3aLoTxEyOf2wBcAYtSi5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6363

On Thu, Jul 13, 2023 at 11:39:53AM +0100, Anthony PERARD wrote:
> On Tue, Jul 11, 2023 at 11:22:30AM +0200, Roger Pau Monne wrote:
> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index b1c4f8f2f45b..86a08f29a19c 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -158,6 +158,57 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
> >      return 0;
> >  }
> >  
> > +static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
> > +{
> > +    unsigned int i = 0;
> > +    libxl_cpuid_policy_list policy = *pl;
> > +
> > +    if (policy == NULL)
> > +        policy = *pl = calloc(1, sizeof(*policy));
> > +
> > +    if (policy->msr != NULL)
> > +        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++)
> 
> Could you add { } for this two blocks? One line after a if() without { }
> is ok, but not more.

Sure.

> > +            if (policy->msr[i].index == index)
> > +                return &policy->msr[i];
> > +
> > +    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
> > +    policy->msr[i].index = index;
> > +    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
> 
> Is this "array_size() - 1" correct? The -1 need to go, right?
> 
> > +    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
> 
> Is it for convenience? Maybe for easier debugging (printf)? Also, I
> guess having a NUL at the end mean the -1 on the previous statement kind
> of useful.

Yes, it's also to match the format of the policy string used by
xc_xend_cpuid, which also has a terminating zero.

Are you OK with this?

Thanks, Roger.

