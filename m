Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29789538C54
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339201.564027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvwk4-0001qM-AF; Tue, 31 May 2022 07:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339201.564027; Tue, 31 May 2022 07:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvwk4-0001o6-69; Tue, 31 May 2022 07:56:40 +0000
Received: by outflank-mailman (input) for mailman id 339201;
 Tue, 31 May 2022 07:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nvwk2-0001o0-Fh
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 07:56:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e359ffa-e0b7-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 09:56:31 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 03:56:32 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3794.namprd03.prod.outlook.com (2603:10b6:408:2f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Tue, 31 May
 2022 07:56:30 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 07:56:30 +0000
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
X-Inumbo-ID: 2e359ffa-e0b7-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653983796;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UzFNEjrzoo7jc/jJK3Y7ejN2sx/ofgJmthypCHh7BOQ=;
  b=iIVDt5+brXGKNSBH47OYZqblMNyjjowgqAD3F+0gYfhC+IWop+WTxdeA
   3KRVJ/wVsPvxH5xZQbCZD7j4WSipW7QT+gMSh5A7m6JNgxzUE8ZQmgUE6
   n42bcFQ0BBOoQ+n/eva/ys5U5yDE4FwstwNB4MPD157uc91L4+nrR3zcy
   c=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 72506169
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RJh+3q4+LzZ+GMWXNWuXqAxRtDHHchMFZxGqfqrLsTDasY5as4F+v
 jBNUD3VPvbZajP3co13Pdyw/UgP7J7XzdA2HVFu+C82Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXiWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSgdRcMNIyQst0lCRRUKQFhFKNnoO/udC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHhV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IC9QrL/PRmi4TV5CEqir+xG+XPRoPJGNVRhXqHi
 3uZ8U2sV3n2M/Tak1Jp6EmEivfUmCLnWKobDLCi6uNxm1qX23ASDxsNE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JuFOk95BCI27DjyQ+TDWgZTRZMcNUj8sQxQFQCy
 Vuhj97vQzt1v9W9Unma6qvSoTqsODM9NnMLfysNR00E5LHLoog1ggjeU9VLH6u8j9mzEjb1q
 xiBrDI/nKkUlc4GzeOw+VndgBq3upHTSgc/oATQNkqh8whwIoCsYYel7VzGxf9aKcCSSVzpl
 HoLgcGa6MgHCJifkyrLS+IIdJmy/OqMOjDYhV9pHrEi+i6r9nrleppfiBl8OUNoP8AsaTLvJ
 kjJtmt57pJJIGGja6MxZourEtkr1oDpD9GjXffRBvJMaJVscA6M/Al1eFWdmWvqlSAEna82N
 piadsKtJW0HEqkhxz2zL88R3rMmyTo37X/CTpD8iRK82PyRY2D9dFseGF6Hb+R85qXUpgzQq
 oxbL5HTlEwZV/DiaC7K94JVNUoNMXUwGZHxrYpQa/KHJQ1lXmomDpc93I8cRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:7/faSKk1m6umNS2Gto5NtTdLwcvpDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,264,1647316800"; 
   d="scan'208";a="72506169"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjWOPOlPJ/IeIubNn39vaQl2GZUtjdbo4nqPFUd22ak6AZ4rHLDnsGUt0C7zCixjSu7mecQvSBtcZH5RFlL4v4DEq/WjiZTXx11PxznaZRXcbLJ/OazVAZbzPaPNaI2CuVXG0ywrTo3jstY5yuqHlbdI9FuuLKUzxvYBLAL56197JYUHZnUr2HtC85mJst8FJvgFzI0KXwU6Bg31x1P5ZfUpVYfIke55OyHyZoxs3b+FEma8YeTHmC6LA0os7XLZkqTC+oxcCEfb0ZqCcfw2mQSUx3Slcnt3yd1mbAHuVhGylTwzqRfHqxbYM2rKP82YVAO/GMpU2KhpB2R6KRTWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlToD4p0rQc138ujI6eF7wOsecnpiZoWIk8SOWgxohQ=;
 b=QJINiHumhw9MSZ2Bx17+Ci01k4jI8PC8xCTDMaPu1DSc7azjc0wttr4OjT/5YvtNPR6SWI2jTaNlPAzAsIEM16AippvX+GwPAW3vuUiLngZ6JDzWArV2EPlvnhLBkEigYOAb7jS41jy51Vyt9XFgVhvVT9/NtccBJDCkY5nwBGXVXyzxUf67VyzKsmmUzqNJxgK9V0mBVq+OIZBlzO/QWgQ0kL7GgcoxSKlYufNpSd+Pd2hX21JiMj0ap0GL6oGidtwC3XWT0Ac1TOa86FnR7D3VpNWqSehoubw9kvsvR4xw6cUScryJEzxiK+PMvmH5DTHGrQbX21Dk8UaFngAz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlToD4p0rQc138ujI6eF7wOsecnpiZoWIk8SOWgxohQ=;
 b=ZqPyh3GxvFG5NxPhRgLCoZOlqgxrWCsv0feuRkrwHIIxVFsRb7tfBZZM7prZmyniwDViKBJbKbTPF5zpB0w/grqg1tlTtCtjGHPUR/q9XNuks2fqDAuAfea3Psb88T0d1hTL2XbA8qfn0vB3zjJVm6ElL428RiwFAVD1roCZCTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 09:56:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	christopher.clark@starlab.io, Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v7 1/2] xsm: create idle domain privileged and demote
 after setup
Message-ID: <YpXKKQHuEKeXZbEj@Air-de-Roger>
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
 <20220511113035.27070-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511113035.27070-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e977387d-9128-400a-9518-08da42db128c
X-MS-TrafficTypeDiagnostic: BN7PR03MB3794:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3794BB75BE745801B55978F48FDC9@BN7PR03MB3794.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KjrZ49pzLPQn3OCXLzIClE/DjMJF6wteEXiTQcY5v7+ErWb+jB/A80ln5HDY9xVpUjJvAOiL5Qv4nndSh3NpF0spTAAEeGfcfkEkc6GOknbclkcajT5JMEIxGfwyi9ChGGbdHu6gRDotwhIkbuP6Jq5DcC6IlvwshlMf/vuLWUjupUc6rs2rAQAPs5z/qDjc/8skspXDhMTZGRy3h88yCSD9vTgtO1EfkEWBM/Ugjzr6iK5VR4YvjQeGTbsv4JGN3ZvysUeVhDO2hqBhgIWhCxrj9Ys5LoW5ND2BJAZ+yto2BvTbDnRpp+fPJIV5VNgD/KpnRnX9HwfCilFwqAiL7ktMtdl3GVRYZACiR6fsfsR3tnje2t0qWgFjK0SjT5LXTWDjCeioY7PeQICIGB3JIumDtOoYcqjtXKgXNITST60GKnYz38b/Kby78TBk/5kMaEz/MCApnFHThoeLL6bp3yIqMtL7BtdiMYOS6N7GHT7WZxsll++VS8jnAtrmOeUgI6hV+R8e5Pt+JlO1FqZNodH4XxED5FDdVr7iiLDvIV7HRPTbR5aUcRRVGK9+5XPLj1GEwPtzXneWKOcVg0yIXP5GwlPUIrs6dJoKD4dCLm+bu4/6TgQcCsb3YPcZaugjsk7G855XfhSGwlFfBHruHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(8936002)(66946007)(6486002)(33716001)(5660300002)(54906003)(6916009)(7416002)(316002)(8676002)(4326008)(66476007)(66556008)(85182001)(9686003)(6512007)(6506007)(186003)(82960400001)(86362001)(38100700002)(6666004)(508600001)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHpIVmxSWVo3TzBBUldDcXF4UG5NVVo1ODRzazVmYytacGtheENKODJhcEFv?=
 =?utf-8?B?VVpGM1V3Q0VORCs1bHI5Ynp6YXhVVk9OTEE2V0QxSUwzekI2UVUrTDJ1SUdS?=
 =?utf-8?B?NjlYeGt0RzdOTUEvczA2Q1ljWDM4WEkxV1lUd1BRZG5lSERtMlkyVVFjcHht?=
 =?utf-8?B?bE9ZMDBGOXE5TUdhcGJoblFiWmF0ODZQTkhxUG9weEVUclpXeUVmZG9PZnJs?=
 =?utf-8?B?c1pMYU9YMW9NSGF3dkR5SkhEbFpvOWVhSDBGZ2lhZHZ1ZXA4SmkrQSsxdFhT?=
 =?utf-8?B?L3pQODRZbW1aYXM3b3EyVkVUWC9MQWR6blhoSVNpL055SVloUEE5cUg4OTMr?=
 =?utf-8?B?TXhHSHZGUDFNM2RIV3hDUU9hQXRTR09DZGFURm1vWFI0UWc4QmNsbUhXREd2?=
 =?utf-8?B?VSt0aDJ6eTNnOFNnL2RWVitmQVN6bGhGVytvVjZGbU1uRWF2ZmxScUdSelR2?=
 =?utf-8?B?VkU5dGMvenBOeVd5RHhCZ0wxKzFOa3I2VVJ4VDg1UmNJaklGNDl5aCtNL3JF?=
 =?utf-8?B?V3VJUEJOMjRPTDA5bisvaDdKRVZMQ0RjdS9xQXdIeVA5V2hPWFBFdW56TGtR?=
 =?utf-8?B?T3Z4cHp0eVlRS0JvYWdFNEN4blpTQnRnL0p0d3UydnNoNm1Zd2s4UzNwSlpO?=
 =?utf-8?B?TzJ0a0V5RytIWXd3TWVRSFZtdkZGNXM4NWRtNDB3bktGNEd4SmpzalBQMjB6?=
 =?utf-8?B?S1FXNmV0SUJkWmdsTExGMU8wancxWlNuOHJzSTFJdjBIZDZrQUtXN3dTbkRl?=
 =?utf-8?B?a2hqczBoOEJXWnhITk10Qk8zUnF2bkxCRXJvMm1lQlZVN2ZXZkJjTkZFYnM1?=
 =?utf-8?B?SXZ6cTY1VTA4YUI2cUNOTVd4blErZ0RZRXlmV3lJR1h1c0JGOWZtVDVQYjIx?=
 =?utf-8?B?cXNnL0UvZkpCdGhVRSsvRCswQWVBOFNvMlIvNHNENkVrUFBreWltUC9iUkp1?=
 =?utf-8?B?dTBNWEo0WEpDQXlsOUYyMGdPYktQM281S0Vwd2t5YkxNWHpJeDhnMW8vdEVC?=
 =?utf-8?B?cmRrNlVwb0ptMGhoOTZNTE9mcDdWT1l3N3FxL283azR1KzBvWVJncmdKMzhr?=
 =?utf-8?B?NUY5MVI4cVZiQ1phemhyRGd2NzROTEI4aE5tSGZuZkR2eXNSOWNnSHNuWFVr?=
 =?utf-8?B?TnFFS2x4dzVrUk5wVFQvVG5DWmdnOWU2OVlJUE01Z2U4UUJ2dTBBOGpyNkdL?=
 =?utf-8?B?cVl1UlI5VWZWdVA0ZXVzbU5FL3diQlhJd2hocm1tT2lsWW95MEoyU0NSb29J?=
 =?utf-8?B?UUZCWnhWU3kyTm4yNXFBK082TS9ydllWMGdmcVpZemliVnloV0haV2VCVnZw?=
 =?utf-8?B?Rm1yaFBZTmtBZy93TCtBZExnbVVmLytiMU1ReUVyT1pCR2NScEtqbUduNjhW?=
 =?utf-8?B?SEJyMiszZmFOMDM5SGRlNVVNaFFwRm9XaGFFclg5cW5PQUNhK1k4d2xiUkx3?=
 =?utf-8?B?cmhmYUdwbU1qMEdkSUREYTV1cGhKeHU0K3NnUFJNQXlQQ1QwWStmclZQOGJB?=
 =?utf-8?B?ekRTYkJZb3hON0JRamZBK2R2bTBkOEl3YlJ5ZEhvUWRyVlBWQU1jSGNHYkZP?=
 =?utf-8?B?bnRNeGNObXV3Zml0QzQvdmVGaVZxajY2YTQyclZxSHdOR1ltdTJ3REpVeEVo?=
 =?utf-8?B?MThVd2pzYzJ1cGlXRTB4NWtyMk9JT051Ym0xMGcvemppbTlSSk1LQ0tQTmRj?=
 =?utf-8?B?RDU0eWhCODNXQ3lEekx2VU9tN0Q3TkJEblJYZVpnOUkxU1FyaVljdHc2NVFh?=
 =?utf-8?B?dCswcE5PYkNDTTdaZHB1anJSNldSd0VtWXdxTDV5ZTY2azcxT1grVC9Fb1Iz?=
 =?utf-8?B?NE5yZGtBaGFoUUdPL1JCV2QzN2QyR2FxZ2pwUTBMZFdveGxwQnhVeW5QVnNO?=
 =?utf-8?B?d3IyV3U5cmgvdE0rWXpoRExwRzV3bVhQTTVwUjlJZ3R4dzlSUG1ZaUVOeFdu?=
 =?utf-8?B?c1BHNWFWT3h3M05EUnNRWnY3ZldyOG1LQzBUbEx5aHBJWEJjdXFUR09TczZv?=
 =?utf-8?B?UWlvZzBRa0RReGJUQ3NTT3VBTmMrNlJhcE91dXhOeHNSa3RXZllFZzM0eVd6?=
 =?utf-8?B?TVZaMEgveVJGU2x1T2FPVUpoZ1lYU2dWMVRnRTFUWTFlZHZtYnlLMXFzZ0NL?=
 =?utf-8?B?Y3NnNmFTSENOS3Zkc0RRUDFvbzdUTXFXeDgvZ01ZR094am13UkhZcFRzaHpJ?=
 =?utf-8?B?NGlIMGprdzBRT1JHenNLRnh1Y0NYZlNVd2hrMWxyWUJJTEZPTm9KWmcxcEds?=
 =?utf-8?B?N2dmeTNvc0hHYTFuVlI1WDkveXkrK1Y4WFk4cVczR09oMmlONkFXdXRMS1pN?=
 =?utf-8?B?V2lSNUllU3NLMzNEbnNXNnZBbklrWEU1ejE2eERtZ1IxTTFiejhyY3RYT3c2?=
 =?utf-8?Q?RZZvDeAxgUdGNyy4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e977387d-9128-400a-9518-08da42db128c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 07:56:30.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqtFIODcYNwDpNujy92f1XqXBqNtGyc/CiQIkbNScbWBeuyuufchiWSUqTT+svQWLobjz9ceGF3OQTXT1ORRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3794

On Wed, May 11, 2022 at 07:30:34AM -0400, Daniel P. Smith wrote:
> There are new capabilities, dom0less and hyperlaunch, that introduce internal
> hypervisor logic which needs to make resource allocation calls that are
> protected by XSM access checks. This creates an issue as a subset of the
> hypervisor code is executed under a system domain, the idle domain, that is
> represented by a per-CPU non-privileged struct domain.

Should you mention that this subset of hypervisor code that requires
extended privileges but executed in the idle vCPU context strictly
only happens during initial domain(s) creation?

> To enable these new
> capabilities to function correctly but in a controlled manner, this commit
> changes the idle system domain to be created as a privileged domain under the
> default policy and demoted before transitioning to running. A new XSM hook,
> xsm_set_system_active(), is introduced to allow each XSM policy type to demote
> the idle domain appropriately for that policy type. In the case of SILO, it
> inherits the default policy's hook for xsm_set_system_active().
> 
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> ---
>  xen/arch/arm/setup.c    |  3 +++
>  xen/arch/x86/setup.c    |  4 ++++
>  xen/common/sched/core.c |  7 ++++++-
>  xen/include/xsm/dummy.h | 17 +++++++++++++++++
>  xen/include/xsm/xsm.h   |  6 ++++++
>  xen/xsm/dummy.c         |  1 +
>  xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
>  7 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..7f3f00aa6a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Hide UART from DOM0 if we're using it */
>      serial_endboot();
>  
> +    if ( (rc = xsm_set_system_active()) != 0 )
> +        panic("xsm(err=%d): unable to set hypervisor to SYSTEM_ACTIVE privilege\n", rc);
> +
>      system_state = SYS_STATE_active;
>  
>      for_each_domain( d )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..57ee6cc407 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -620,6 +620,10 @@ static void noreturn init_done(void)
>  {
>      void *va;
>      unsigned long start, end;
> +    int err;
> +
> +    if ( (err = xsm_set_system_active()) != 0 )
> +        panic("xsm(err=%d): unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);

Can you place err on a new line to make the line length no longer than
strictly necessary.

I think you could also reduce the printed message to:

"unable to switch to SYSTEM_ACTIVE privilege: %d\n"

Which could likely fit in a line (seeing as others are fine with the
longer message I'm not going to insist).

> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 0bf63ffa84..54745e6c6a 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>      return 0;
>  }
>  
> +static int cf_check flask_set_system_active(void)
> +{
> +    struct domain *d = current->domain;
> +
> +    ASSERT(d->is_privileged);
> +
> +    if ( d->domain_id != DOMID_IDLE )
> +    {
> +        printk("%s: should only be called by idle domain\n", __func__);
> +        return -EPERM;
> +    }
> +
> +    /*
> +     * While is_privileged has no significant meaning under flask, set to false
> +     * as is_privileged is not only used for a privilege check but also as a type

Nit: I think this line is over 80 cols.

Thanks, Roger.

