Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41B70F88D
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539073.839598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pNm-0001lJ-Cd; Wed, 24 May 2023 14:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539073.839598; Wed, 24 May 2023 14:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pNm-0001id-9Z; Wed, 24 May 2023 14:22:30 +0000
Received: by outflank-mailman (input) for mailman id 539073;
 Wed, 24 May 2023 14:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8ut=BN=citrix.com=prvs=5011a8a4f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1pNl-0001KD-MO
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:22:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6895247c-fa3e-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 16:22:28 +0200 (CEST)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 10:22:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5666.namprd03.prod.outlook.com (2603:10b6:303:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 14:22:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:22:22 +0000
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
X-Inumbo-ID: 6895247c-fa3e-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684938148;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FzkJ1hDv25QnRJTEZ8GbIwCNr4VWqj7XJ/9txhKdoCw=;
  b=OeErEvT9zb8/0bb2Jjbp+P34u5+gwH0EIpu7cp4Ek7vSLUZwGSU21H1G
   xj7rt7aJqlBw3vbFECUB1qQKi51EHXWvGv2MdAaT3i1iiwGQgGH6pyvkd
   iMh/LoXcoDWz0T4IekzkxZuyNw01QFCI6E9gbRpYXuv8UU7vqt2PTczh6
   w=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 108994698
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1gWgJKgPZ75eC5DIkAYqkNtJX161SxEKZh0ujC45NGQN5FlHY01je
 htvUWyGa/2INzfzc4txbty18hkCvZPVndI3TFFlrSlmFH8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWCzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfAx4xfiyDgdu156uxQ+J9vtktHo7CadZ3VnFIlVk1DN4AaLWbH+Dgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMtluS9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHurCdNOSuzonhJsqGap4Vc5FQUqaV+2j8fo2m2RRvBuE
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJobixvOSpNpFv6zh9itRTXom
 WjW/G45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:1aLDfaDCzONfF/vlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: 9a23:fxrHDWwOZcigy/i5DbzIBgUTMe4ZYkHdyk7TBFayAG14cKCbexi5rfY=
X-Talos-MUID: 9a23:o06WqwlLQoPxDbcKZvZjdnpZDuBTybm2NHwJnLs46pmnGjFSCg+C2WE=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="108994698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFFKlGNgIkfSj0LBTZWwejn2B0DXdYZLqDVADoumeFYhOdfHCI1TCCp8mSqGF0aRqx45Y84Ewac0F/ftYzg9ShjrBxvdC1SPxTWKohgxMJpc512cqDDv84z8o9TDGaLSlVPbBMIUUcLHk+O65wU2EtIVRuKdaF9frK+9Yq+pe/T+yoGQPti6Pk70KMCMB05zh4QXBK+DsN+cGzPxq3ZvUjx5KSFFcCWnVvvC3pt1jsWBygA6rdPiCP0rUJPCcJABe0WDdfoej9dyw80poVpAHtt9hITBPMcoHPISWZzZfSLqWF6oAbk64cEK1c5JLtv1GlT2Rhb7xmJS/ptZJpu7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npxPhcN9pONCtO8Yp8EXA1Q01+mBUV2Kawsye0P5PaE=;
 b=oXEq26fGhg2a0RLpc6t5GKplCGSvyA0XHjETdRLlv3CFFlQqHCtfVH3v1GtPcHyY4wN+F2PSBq9FmC9Ly9sab/lG/NMA3+cvg6fxCpNkmSv1EfiaA5pMqxM6R8mBPcIpIjFC4I8X/tuaMXnznGU/k1cg/pNh4z3HlJVAC8wmcNjwiFcBEf3m7nTB2bWiWWRy0F83DvbVY7ZAhJn0SWegI8owYbhlGk8l4cOJQqVR+0CoQiYecGeeD+t3O0DTMRc0BezVDJ5MfYSh6W86aVV8RDohcCjhtIDJ7iOlssrhuYyoG2mUR9mHyFgeoK7sWexiz2amy+Koz6QC8QWxL74+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npxPhcN9pONCtO8Yp8EXA1Q01+mBUV2Kawsye0P5PaE=;
 b=FXS+tQAAakzCZN23HJkhf26s8g0Yv9TulqAc8AO/gWHeUuyjaEDGHjV8px7M2RakpbPoIvV4A9O0jnVu/YPFCZidZOhSmsu7WOg5UnsgB1Od4P/B0Nxo+V6x7GW7/BLJbFHxRwfexpm88YAS4+/OnZGcAZcb3YS6Sr+QTRTWxHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 24 May 2023 16:22:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZG4dmJuzNVUE5UIY@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecaa73c-6fcc-4f60-6a0c-08db5c624a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZhxOCBvAtgrKe3vfi3jHHii/Wtr6nZAZvbpXJk1iUDmBP9TMdLn4IXNXy8EiAjJV8Ww95VMclQNdfzx03vsOCH6x13B82xH86sjUxCmRJDgdd+fQcilYR+lRVH4Jv92rLAWhwsPp1+muAnDcELvQ9ocsvhzvWni8xO4PZ69mJOSmSyNGE9FYONxQsAN0XJH8/T2VTlDO3WDW8o5pssFwi+dDHx7ffeoUcdBX7E2iGgm7DFL2Y026Vt+HYpWDTVW32j/ydRX54eiNEpTWno2siq59tBHGeRQb606af1qgPxPWnhJN/qiOh2gpPglfs1nw83j4KuGb7C9jBx7R6A6/zAQhRq4rI2PSOba0iVkfhmsanKOr9eIh9FzC16vBHzD9+fasUoNrAIXkz98Rz1VZh0C8QZJL+EiksVY/9b8suCyb3LanfuWLOpQjvSqdo3ACFYGqXG1mnyx/qou5UVUFCX038ba2Czt2BPP5tJVgB+lCr8j7LKw4+WAXJb9RRFIZ6wQPdQMWX57H+TMscIj6Ew9VgqrlZjcnw61aEG7Ag4iD8XXBooZzstT4WXN+SIM5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(33716001)(66476007)(66556008)(66946007)(478600001)(6916009)(41300700001)(6486002)(6666004)(54906003)(316002)(4326008)(86362001)(5660300002)(8676002)(8936002)(66899021)(15650500001)(82960400001)(26005)(6512007)(186003)(38100700002)(9686003)(6506007)(83380400001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUdBNmlydnZrcGZhcDdwb3ZBbVk1MDV6cTNjSTZTT2VBSU9FeXdveURaVFdj?=
 =?utf-8?B?alhhc0NBQ0h4MzlnNmh2SlpScXZEbnVLdDREVzdNWS9pdXJMeUE1VFZ6VG9R?=
 =?utf-8?B?bkhDUTBMbm1hb294N3hvWU9TRXM5TXcwNlB5NWZjNFR0RkdyTHpvTjQxT2tq?=
 =?utf-8?B?T0ZBZ0I3dnB2UFBqeldaT1E5VnIzZ2l1T3dpdDVaVzVabUI4cjZYMU9icFRC?=
 =?utf-8?B?UTg5N2MydmxteDIvaVVlM0doME1QSWVYdWdJNkhnOUxYL3BqWFE0cEw1aS92?=
 =?utf-8?B?NUxrQUJjT3p4eFZEbkxER0JvZUFQczBqblFXL2VzQnhDbVBxNVVqZnoxbHNn?=
 =?utf-8?B?VllxWHZTNFNNV09tSXRGZ2tqQ3Nob3dIOXdTZG03UUdBSWxRcGxTdXlweU5v?=
 =?utf-8?B?VjV1OUllTTU5MzhZb2laamw3RzdFemlxbDk3bGlwYkhtQmFFd0pVWlVZQ2Zs?=
 =?utf-8?B?TUsrejN0ZkJHQmh6YTdYZncyVStpUVZRUExRNHRKUGtieWYzdW9LblF1N0pz?=
 =?utf-8?B?V0RhWUxyY2NYNVBjbUdnTndmVk5ZTXc2YkZNNGhyaHpVM2NpTVBVMVJ5M3JO?=
 =?utf-8?B?WWJVWDdLYlU3TDE1cUxwL2lUZisxbUI4ZlA4WXV3TjQrSEJiblJ0Vytqak5Y?=
 =?utf-8?B?LzhCL3E4YUpLK2pSbnFRN2NwWUNvZjh5UDJ2LzBqWm9OUkpGSWozWW8yWDYw?=
 =?utf-8?B?ei9kYXJYVkhVb0FhaEk3RE1DaVdIdjhHamhKaC9PSVI5UHJIY3pLZnFQUldQ?=
 =?utf-8?B?TlhkbGVNUUdrY2VZbzFyWU5EWEtrYUFKQXdkbFJENjNwa0V0ZnVZRlkxaWln?=
 =?utf-8?B?QzVPdW15Ynl4S0ZjaFVDcmNJSVZDU21tb0F3SWZBMzZEc3lvMHBNZDUxby9t?=
 =?utf-8?B?eUFmbUd2Wk1iSlBSQnF0YzJHRVRRb3k5M3pPT0N1UDFUdnpCY2RsTHZGZkFV?=
 =?utf-8?B?L2R5OXRRZnQvZG1pd3ZndEQ2T3dGa3R1bUVyczFldTNObmVtQWlFSnRXWTh6?=
 =?utf-8?B?TFVaYTZ0MjRrQmhGT0N2bEZWcnNPNStnSHB1WGRFOCtqSktJYkhmVXZTTkRq?=
 =?utf-8?B?WjRjYVJDTldYd2YzVXVpWnYrZCszbXh4bStXelpMZFVqOFpZamZZVjBoV2FE?=
 =?utf-8?B?ay9GV1pJeEd3TUZXYVZXUzdXSTBNei9UdWtjcjBVV25QVFdRa29Ea3FiK3Ew?=
 =?utf-8?B?VUpJa0NLRTB0Y01XMFJFc1owZEoxU2h0N2JpSjYvaCs3L0hubHB4U3MwYUhS?=
 =?utf-8?B?LytMQU9ldS9qN0w3WmRBdTVuSlZFZ3VVS0hkYWl6UlZFQnNnTmVvNlV1RHBL?=
 =?utf-8?B?Ym0rTkpRd2hIbTR0RlNTdEpxa3NldDVYMnA4M0F3eXRxT255c3hjMzdQYkRx?=
 =?utf-8?B?SE5KUWZwWS96d3oyanNEdzNZd25kN3dObkxiWlZwcWcrUEJOT2poenI1cUgx?=
 =?utf-8?B?VXJoZEJjd1lGbGEwbHljM3U1WmlWNWFrQnF1TFNyM3QvOUIzNHVlalZGQWNI?=
 =?utf-8?B?NTJjeVlqL2tJalkrRFVjVkE2ZWdMY3hJVHdSa25HMjB4dS9YZ0E3ZkxaMjk3?=
 =?utf-8?B?TE9TeldNOURRczlKSTFTWThmUnVGclBDaDdDY2p1OUMxQm9qZENHejJwSytU?=
 =?utf-8?B?RFFGeG92QjdwdzhKQWw0Zit6b3pXWkhTNTE1eTBjcnFtdGo3M0hIZFVNRkJW?=
 =?utf-8?B?WDVZUHhjOUxNYVUvREt0c3FkdTJJN0tGa3ZrZCtkZ1hQQkJSYlhRR3RrNzBD?=
 =?utf-8?B?cGk4TjlXUHJRMVlkOEVjSnErOFRqcXFZWVJTb0EzeDFMdkFnWHRGSWxmTXli?=
 =?utf-8?B?aGFmTDMzeFFuMC9heFdWa0pBUmd1M0xSeGpoZVdLaHBXYXFaSnVHVnl5Rytq?=
 =?utf-8?B?eS9nZVEyRVlEdGRIN0lETTVOaXBVS1hRTjVpN2laSC90d3N4Z0pibE5mZ3JR?=
 =?utf-8?B?MW9TSWdoQzkzMWxxbzlTdkVXT2I3dml3dFRLV0pvYXltUnRzR2psakFxN3RL?=
 =?utf-8?B?WXV1eVZIQWJqNWJ5c25EWEVFeWtYWnYxR1NCSy9HNTZ2RXRlcC9FUU9naWE3?=
 =?utf-8?B?TDZpQ1Z6QWhBMWNnVCtvRjU0YzRwSlI3SUNKcWpnVURFMXV6YkZwRUNyYXkx?=
 =?utf-8?Q?KzXrCW5FY+pjycH9Os9aCgApV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G6wbguR+vO1/eSLBHV/BqegRJt4hYVioq1Cx/kGOvEDyGrkeWTU8bBjpbAJEduT0kIYcrOz7n9/25FN31YD6MXy11Sw3p7CPMptbi3CzumRqin47VboBEHOgc1l9dXPc+QDIb9Bfm7lX+GaEiv5bIbi7xQNP0BjvTJojw+znshi2ChmcPmbBcMX19BZ2RmhbKNnitE+r9nUqvWewqydTNhQcse41s9K2CjzQSeX4D8LVw/tsNT9Zb4zo2QT6iwqrWu7MDt9n55XSQaoPKIXiKV8XvyOFIlCl+/xdwVcL+CmQZqBmVNxuRdcM23W1Cp535TC58JEROoFLwdKgQiQyrf3fYfXKd2qRhRleV2X+Foi5Y+a4Xg0AKlaHH3RMaChvjZormO9iBZO/uXWeWCE3nk1YDryqsXtuOB6VSNZlsbz60R1wVsAk47wel3jF+ydiggfRlR/GHJwfGO1wLaTl3gL72NWhvS4A2XGZdnFU4jUx+v77rry1QikZvYyKvxD8xlG2/wwhPr+1+v8ki/wYR5TYFHUEue2xPD7agagbk3xkKEO3nMapEI9bs/OwjUlBWPZj/lf7mCJ9+ijWgcM+NFoa1LiBacW9ZdYi+506xQMK7oA/991NsuFA4HGwthvuGCGNQxq/PvGnhQJ9CwGKZxpylGSUjUY6hUxjCrdw1onkyYEbL6OHOfT8w+lZ+rdHowTo/Z7F9JgdPDR/NEq0BI0BPrazuYm/EHYO211H8Bf3nlguZk5mP3PqM6N3gITsI0WgJqiUM5UvcdGsQpTMexXbWoxa8YK7aQl3EXAeK21382UVHcC1SaEDeUm8tN/CHuBnukI0fmgT/59Ycj482w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecaa73c-6fcc-4f60-6a0c-08db5c624a38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:22:22.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFzJ6DebO3DGSyd2tXHsKLkkwh9KB6HD9lEsCDZ3RSNwsTi/6yLd4RW5jFay75cQDAzqM05G8sg6DTUqhgJ+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5666

On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's list
> of devices; DomXEN's list also needs to be scanned.
> 
> Suppress vPCI init altogether for r/o devices (which constitute a subset
> of hidden ones).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: The modify_bars() change is intentionally mis-formatted, as the
>      necessary re-indentation would make the diff difficult to read. At
>      this point I'd merely like to gather input towards possible better
>      approaches to solve the issue (not the least because quite possibly
>      there are further places needing changing).

I think we should also handle the case of !pdev->vpci for the hardware
doamin, as it's allowed for the vpci_add_handlers() call in
setup_one_hwdom_device() to fail and the device wold still be assigned
to the hardware domain.

I can submit that as a separate bugfix, as it's already an issue
without taking r/o or hidden devices into account.

> 
> RFC: Whether to actually suppress vPCI init is up for debate; adding the
>      extra logic is following Roger's suggestion (I'm not convinced it is
>      useful to have). If we want to keep that, a 2nd question would be
>      whether to keep it in vpci_add_handlers(): Both of its callers (can)
>      have a struct pci_seg readily available, so checking ->ro_map at the
>      call sites would be easier.

But that would duplicate the logic into the callers, which doesn't
seem very nice to me, and makes it easier to make mistakes if further
callers are added and r/o is not checked there.

> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>      modify_bars() to consistently respect BARs of hidden devices while
>      setting up "normal" ones (i.e. to avoid as much as possible the
>      "continue" path introduced here), setting up of the former may want
>      doing first.

But BARs of hidden devices should be mapped into dom0 physmap?  And
hence doing those before or after normal devices will lead to the same
result.  The loop in modify_bars() is there to avoid attempting to map
the same range twice, or to unmap a range while there are devices
still using it, but the unmap is never done during initial device
setup.

> 
> RFC: vpci_write()'s check of the r/o map may want moving out of mainline
>      code, into the case dealing with !pdev->vpci.

Indeed.

> ---
> v2: Extend existing comment. Relax assertion. Don't initialize vPCI for
>     r/o devices.
> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>  
>      /*
>       * Check for overlaps with other BARs. Note that only BARs that are
> -     * currently mapped (enabled) are checked for overlaps.
> +     * currently mapped (enabled) are checked for overlaps. Note also that
> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>       */
> -    for_each_pdev ( pdev->domain, tmp )
> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> +    for_each_pdev ( d, tmp )
>      {
>          if ( tmp == pdev )
>          {
> @@ -304,6 +307,7 @@ static int modify_bars(const struct pci_
>                   */
>                  continue;
>          }
> +if ( !tmp->vpci ) { ASSERT(d == dom_xen); continue; }//todo
>  
>          for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>          {
> @@ -330,6 +334,7 @@ static int modify_bars(const struct pci_
>              }
>          }
>      }
> +if ( !is_hardware_domain(d) ) break; }//todo

AFAICT in order to support hidden devices there's one bit missing in
vpci_{write,read}(): the call to pci_get_pdev() should be also done
against dom_xen when handling accesses originated from the hardware
domain.

One further question is whether we want to map BARs of r/o devices
into the hardware domain physmap.  Not sure that's very helpful, as
dom0 won't be allowed to modify any of the config space bits of those
devices, so even attempts to size the BARs will fail.  I wonder what
kind of issues this can cause to dom0 OSes.

Thanks, Roger.

