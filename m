Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73EB54FE90
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 22:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351578.578255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2IzO-00055x-Fz; Fri, 17 Jun 2022 20:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351578.578255; Fri, 17 Jun 2022 20:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2IzO-00052V-Ch; Fri, 17 Jun 2022 20:54:46 +0000
Received: by outflank-mailman (input) for mailman id 351578;
 Fri, 17 Jun 2022 20:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvnF=WY=citrix.com=prvs=160c9be11=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o2IzN-00052P-5O
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 20:54:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b500b304-ee7f-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 22:54:42 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jun 2022 16:54:38 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MW4PR03MB6990.namprd03.prod.outlook.com (2603:10b6:303:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 20:54:35 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5353.014; Fri, 17 Jun 2022
 20:54:35 +0000
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
X-Inumbo-ID: b500b304-ee7f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655499282;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=V5WOvekxRQAqHJS1Vu0vGWoyWrDwEg2PiqFxGBvwZx8=;
  b=VVed0QDOiBq2OYvE0J5tLz1hIaMQeiDBGzhqzpF1EhC36idjx1zzAFRY
   qX/PLHDodN1RkpuZv5Pm0YO8XGwSxfoQTR8rih9piofl0Qyc5DLIxyNYm
   MDa6t/Wh/eIs9bmdxNy8doDhJuUcuEEwkGTjyJSLYm3GkGVA+KEhbtKJg
   U=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 74307023
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:abribamW5cKF1NaFDc2pFcHo5gzKJkRdPkR7XQ2eYbSJt16W5oA//
 9YtKSrfbaHbJie3LscnK96GQXl2uJHXmoVnGQc6+Cg1Hy4U8JDPC9mUJRj5Z3OeIMGTFR854
 Z5PY9fLJ5hrRXPQqkbzaLbv/HR32/yBTeOiUrLJakidKeMcpAIJ0HqPzMZl0t4AbaGFPj6wV
 fPOT+z3YA6r12YlbmsfsPPb9B415aqi6TpF4gJvP/oW4wXXyyNEUJ5HKa+PdHapGYM88sxW5
 grgIBNV2kuDon/B3/v8yu6TnnUiG+KUZU7U4pZvc/DKbiJq/0Te6Y5mcqtGAatro2/RxYopl
 owT7cDYpToBZcUgpsxMC3G0LAkmVUF20Oevza+X6JH7I+XuKhMA8t02ZK0EFdRwFtVfWAmiw
 ccwOjEVBi1vssrtqF6NpkuAsex4RCXjFNt3VniNVlg1B95+KXzIa/2iCdO1QF7cLy2BdBrTT
 5NxVNZhUPjPSxhGFHRIBIB5p8appXbELDp4t1SV5oNitgA/zCQpuFTsGPz8X4XQAOlwwAOfr
 G+A+HnlCBYHMtDZ0SCC7n+nmu7Im2X8RZ4WE7q7sPVthTV/xERKUEFQCQT9/Kj/0xHgMz5cA
 xV8Fi4GgqU17kOmCPXgWRmxuFaPvwIGWsoWGOo/gO2I4vWIuF7GXjJfJtJHQO0NrOF1SDYk7
 Qeutve1ASBogb6STn3Io994qhv3Y0D5N1QqYCYYTAIe7sfquogbgRfGT9IlG6mw5vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFdzgDeQmOs9UVnbZSsT5Kh9VXAq/haRK6bRFScu
 HkPm+CF8fsDS5qKkUSlQvgJHbyvz+aINnvbm1EHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBS
 FDXkRNc4tlUJnTCRaN5ao2+CsMuzID7CM/oEPvTa7JzjoNZcQaG+GRiYBCW1mW0ykw0y/hgZ
 9GcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms+W05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:P0pKwqMRaGXjasBcT23155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMQs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YtT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6T030Woqqg9jJwPr3PtiEnEESotu9uXvUkZ1S2hkF3nAho0idsrD
 CDmWZnAy050QKtQoj8m2qQ5+Cn6kdg15aq8y7nvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjeseMftR9B6NmOQgeisa4HZcm0BS2NL7TkYvI7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFEgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCvefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzvewPcV
 T6ISdlXEIJCjLT4Je1rex2Gzj2MRaAdCWozN1C7J5kvbC5TKb3MES4OSUTr/c=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="asc'?scan'208,217";a="74307023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/izcAVbivA92UdrijL39BYQSN2ZKbZhSxSY5jd/SA+l3T7UArUhtGikTHFUec7rhoL4i6r5/nQHVMjt4apQjLs+snOviulSThsiwPdgiWKT9UV4a6IjHDiEVlE7YAhzOFT7qHNSbcB+0y5vijoNf65zOCIZAYbCL/98wW+A930wsTp/+O+YGY7cly9R+89uP5qWyZNdOanfF1I6uYOGdjD29ClWNdZt9hUhPdADTfGoRzZE3O0qIaAc7bom95+IbjCBlyCEQNFiIkDqVgrHjKl+hWgT3w5XwyTZ1ZzZkL0OClhiGrlZVcV0aU77ZBE+uX55EtLHo4H8xtil/2L9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG96ehoVod90izL5wMNmxzinFhus3gqZDjAuShcvDNg=;
 b=gUbpYQbTtWvocH1s8JZ3GRbfDmbk5ivyZTHCzK6/jOEWBpPpL9MI1Afg39Eo/WIEe+VoUFvmaq+f+pJWYYb6OlUspnkh9JcTOwPy5ou44ntGlBc44rDslGrrL+67Sl7QW/Ffc91Jkr7BTBr19Ge0WU7RgKQdzjOwajf5Z8Wc4nDIlj17VLhTZpILFDuFu35a3DXgpnF/AaXp/5V7kFTecgr9k+soq1cllxM4cKy1/BPUZ0UIiZk7vflaE3qXMkgjxpbuKUJUzNNkp2ImSjIJ3HhiNrg52GNghwQhcKBRPEXH/pBeQn3oYJrk/fZvfqDYFI/z6qjT8+PPdogtVATqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG96ehoVod90izL5wMNmxzinFhus3gqZDjAuShcvDNg=;
 b=F9GhndsTRsD63r6FLIJQ3SNJ0Ulz9SS8wBQajnNuAPUGak6RXEawRk8n8AN6KK/MMlxV1U4jTSUlOB3N7NTywFq5dSAk+kv9bgYZ7mU95R2UobNjIml9xjc60inyhG95j2A+0TQP7BRE9gapmif5tbZ94mgmTBtV/M93JEqA/hs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Matias Ezequiel Vara Larsen
	<matias.vara@vates.fr>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Thread-Topic: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Thread-Index: AQHYafsc/WlHBvFB/kqWUrR4CBI56K1UROwA
Date: Fri, 17 Jun 2022 20:54:34 +0000
Message-ID: <C9B7EF20-595D-4BCB-8545-F35611B718AF@citrix.com>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
In-Reply-To:
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e61f9645-c0fc-40d0-2830-08da50a395db
x-ms-traffictypediagnostic: MW4PR03MB6990:EE_
x-microsoft-antispam-prvs:
 <MW4PR03MB699040B20858E489A2DD88FF99AF9@MW4PR03MB6990.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 q9iM6U+wcT3ZLa45eU0kRKPJGzOlGW1CTv0GNeUogekPqsruKIv9897EII9Pyp/Wn7JMumrexhTeEXZIdC7bKwjsxrHWC4/tUFdQ6T0HR6/rY7yV68gG5djnI2fHNi+zkvXJKBDp5kfA3ITWyBj2iUFU8OQbToE9K3aOZH2r8LTfGV0r6aGTc6XcN5Rav0Fukq5Flb+RaTqTrIKx5SBdBKU6FvIjCgRtodh4nA3mzuOCS4b/wjjP79BtUpGqOdgI2VRYGnw4MxTwKQwiuMXO8uIXq6I9TKvkORpdI5lDxB1R+qVjXALcZfrwkE8O4QtEgj1MLdLPjx/w1PkR02+N7EJXB/wtv/2lUwFrW6pKRJFT5G05a4tEesjMGB3yGikhVN+jK4n48yHjHcDaENkDmk/4aAtG8g4suKNBLuDJ2HWh0e392+PDrgUbsUgGRDvbyBSurEtvYuwCQwowiNjbygIgthzOvypaVDxGDV13rYnPxLOiojL0N+GGlZa/7/2yC/KRAY56z9npPKboKobNAOWCnvHGiib0sNaKu5O1tIIqCkUXmISbgM8EpZN2XKi97OCx2hunkvVRLO4TcAgWTWiszmvUcG8au8k9sp76CpZnbkzD0O9tiiEf66OopD4dPRMgf0oO3zYraV5pyOjUhMubpv2WEe1gykE2Z600J7qU0SIY24DJ9KnnPJaptWW60JMlVZ+Ig7q1i7Fu6dqokfhehzFMwkOKMDDz/sJztRGfnwaG3huv3ZGe3DLvhWUJv8NaYA3YvlMpsHM4hzYVOLakR3u+7/NrYwr2CT8b6iq8jj5ChpH1wGETSuT90D7hCJluYhGs3vZsl99Pw6DoFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(33656002)(4326008)(5660300002)(54906003)(36756003)(66946007)(71200400001)(66476007)(76116006)(8676002)(91956017)(2906002)(64756008)(26005)(2616005)(66556008)(66446008)(316002)(6486002)(6512007)(38070700005)(6916009)(6506007)(53546011)(498600001)(99936003)(82960400001)(186003)(38100700002)(84970400001)(166002)(83380400001)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHVCaFI2Wi85bGVQYjdmRUllK0V1Nitld1ptWksyMG93ZVRkOXNjckdjRjJO?=
 =?utf-8?B?WXNEamF3WDVoendCaVlac3B5WEtqSWZydXNWNlZmaURvVmMvMmJuMTVadFBw?=
 =?utf-8?B?L1BXWWxsWmtHZ29HeVhWTDZGMmNZbTVFOU8yWkJ6aFIvSHJ1clVsQjRzeTFm?=
 =?utf-8?B?em5hYXJVQ21oQWwycjFJcEhaWFBDY2daa01lV1VpOXducXJRSnlaRGVabkJC?=
 =?utf-8?B?TG1VQWxNcVVOcjNPWUFDK3B2TCszcndjVUEzV2J5NWtsbEp2d3RxUmtDZ0J5?=
 =?utf-8?B?MWRsSHlPVTdWWUoxakcydmdTaWE4SkxPbDVyMDNWVEdQdEFnZ1JDRlZBTlY0?=
 =?utf-8?B?SERMK01qSnJXckpIUHhmUUFjNmlqMzV3WWsxR1Z2dTJYWUx2M3hRSEVDOUll?=
 =?utf-8?B?RlFuUHlURFMrSXNqSU5KclZxNUNsM1ljdlFOZExQR0VLdjZyeVZ6M3A4RWY2?=
 =?utf-8?B?WE5kNDkyZFJhVmpBckJSWS8wQ3JVeC9hdXdKeGhUeU9HNm15REttZlp3TjdU?=
 =?utf-8?B?cFNFd015VEtZUkxUYW1Ea0E5Qnc3bFJHMGQ4Zkt2N1cxVExVTkNxYmpOTUt2?=
 =?utf-8?B?Umh1QXRHSUN5NVV6NHBRV0IvaW5rbXZndFgwS0pnY3g5enR5YWd3ZWFTSENB?=
 =?utf-8?B?aHdCRUdoYVo1UG9pSS9EYjFaQnBTT2N1RjZSejdTeG1GZGdyZHhpSC84VWpu?=
 =?utf-8?B?bWx6SytFbEtaK3JWVU1lc25ZNEFpbkxvQys3bnAvazlMbGU3Q1k1YjVSTTFj?=
 =?utf-8?B?NWIxZ2w4bU10SmhrVGpPbXpSZlNYb3o5Sldpei8xSm5tV0RlM1k2aDZRUkMv?=
 =?utf-8?B?MUVVTit2YmVZcXNoL2xmU1YrMjR4TmxCSmI2YkZ3clZ4S09acXZldndzYkFV?=
 =?utf-8?B?MFY0clR3eUtDUUhzcTVHNjN2Y253amJVWTU4OGdFTENjbGRmbGszck5vcjRv?=
 =?utf-8?B?TXhxSzFXeEVkOHg1dnI2RW41dTRPbXNTeFI1di82Wk5iU0c1ZzlCYjVzajhj?=
 =?utf-8?B?djY4SVU0WmV5Tko0Rk9ZZDFCbUFYK3VLSVVHdlhsenlycDJwbWhVM1BEZWVP?=
 =?utf-8?B?eGhUcE56R21jYmFoZGovWHpteS9kc2xZRU5pYWhBZFNVODd6Z2VhZ1IrYkgw?=
 =?utf-8?B?ZXBNNG54dXpMZGIvdU00VVE0RnJlSE9XZmNielFnQTBBbzVONzVTc3FTSlBP?=
 =?utf-8?B?Yjd2VDlBRVZveFpJSXdzd2s1VWJPMEFQNDJxTmdaak1VSFIrNFd6TExEUzcx?=
 =?utf-8?B?ZzJKL2RkQmQ1OExkN0Q3V1M1SERrVkRoQndMSVBnekxLVTNIOGJxaUdFdnlE?=
 =?utf-8?B?cHpTU1hRLzdpVjVNRkh4VHU2S2ZpdkZESzFMZGkzT1dmdmpJSlduM3k2SmhS?=
 =?utf-8?B?b0g4TFpTWDN4RXhqTk8xNnhkTi85WSs2NHhlck9SeW8vWjdZSDBPbmRkV1Nj?=
 =?utf-8?B?NFpTSDFibUFERkpTd1QrSFg2RDRiOFgzT2FmV29CUVk3VVNRNXlCd0l5RHZ1?=
 =?utf-8?B?RzM4dFY1T1hHNUFqVW4wL1pVMWVLRFNkNkJHU1REVmpsT0cvUUkwMkJPVW56?=
 =?utf-8?B?aEI1NGZhYXVPME1YbjlKOE8vcUVTaHkxT2tXZEo4S3oyaVFiQ0RHZWdzcXhv?=
 =?utf-8?B?dVVoeDVLK3FkVXk5WkY4M2dmaytyWjA1QkZtZlh6YmtBRnpOOXIzVUx2NkdP?=
 =?utf-8?B?emZ2QXVmL2hZaitOZ1RlM1c2dktuYVVBR0lBZkhnMUhaTGRzZkx2N1BJenkx?=
 =?utf-8?B?bjdYQWo4UnplTHVjQ1huM3BqdnUzbXkzak0wdzBya2duSk1CRlVoT2ZseERK?=
 =?utf-8?B?d0R1Y285OHZvZEtURWZzUmhwekhyR1FkTFY1SG5OaEdCTlhkSk5UMm1xYzY4?=
 =?utf-8?B?RkUwbURxZm9vVERSQkN5bFdqVnJUNU1IekFsNHQ4VmloTHl6SWpha1VQUzZh?=
 =?utf-8?B?Q1ZlWU5xak1DdENvOTdRc3AxM3RIQnF4VGhvWEpKRjRNM0xnejJvOWN0TG5V?=
 =?utf-8?B?UENYR2E2Vzhxa3Nna25wKzhuR3p1enF6RkdPVGVPWW5zazFqNnBVU2p3anJj?=
 =?utf-8?B?QWdSY2szUkdISXZZVVEwcVkzd21wRW5vOEZaUDV2dGpMenN3SVpzcm15eVVM?=
 =?utf-8?B?cVlNUFpEWjNpczErSXhXS2prbENCTy9sdktFRDdvMFdwTlpiY3liRUlWNU1o?=
 =?utf-8?B?Mm5uR1gzd1hmMTNYdXFyZkJqQUljUThzdStpT0JyQUJtY1NaOVVwYU1qTC9Z?=
 =?utf-8?B?Ni9rM0ZWU0VqWVJ5UnNEcy9zSjNwclkvL3dxK1p5ZVhobk0rSzVRR01FMzRr?=
 =?utf-8?B?eUdsZ21aenEwY3V3TVlha0xZODc2WFVwbytwMUppSHlHbXJXMk85UUZoMjRY?=
 =?utf-8?Q?M20N7GJJUYy18klk=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_75AC0B82-0989-47A8-A553-375D14B97929";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61f9645-c0fc-40d0-2830-08da50a395db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 20:54:34.9780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47CjwblZHUlNZ/WS3gA5UjEtlLPY4z6Om3M8e8Hl6ovYhbZ65va+wx6diNvKh/X1xLQY+HKH4UEYHBM317a58jscm4TLbTOIo67NgXYAoK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6990

--Apple-Mail=_75AC0B82-0989-47A8-A553-375D14B97929
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FA80A71B-A1CF-42BD-9B44-701910E9BB1C"


--Apple-Mail=_FA80A71B-A1CF-42BD-9B44-701910E9BB1C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Preface: It looks like this may be one of your first hypervisor patches. =
 So thank you!  FYI there=E2=80=99s a lot that needs fixing up here; =
please don=E2=80=99t read a tone of annoyance into it, I=E2=80=99m just =
trying to tell you what needs fixing in the most efficient manner. :-)

> On 17 May 2022, at 15:33, Matias Ezequiel Vara Larsen =
<matiasevara@gmail.com> wrote:
>=20
> Allow to map vcpu stats using acquire_resource().

This needs a lot more expansion in terms of what it is that you=E2=80=99re=
 doing in this patch and why.

>=20
> Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> ---
> xen/common/domain.c         | 42 +++++++++++++++++++++++++++++++++++++
> xen/common/memory.c         | 29 +++++++++++++++++++++++++
> xen/common/sched/core.c     |  5 +++++
> xen/include/public/memory.h |  1 +
> xen/include/xen/sched.h     |  5 +++++
> 5 files changed, 82 insertions(+)
>=20
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 17cc32fde3..ddd9f88874 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -132,6 +132,42 @@ static void vcpu_info_reset(struct vcpu *v)
>     v->vcpu_info_mfn =3D INVALID_MFN;
> }
>=20
> +static void stats_free_buffer(struct vcpu * v)
> +{
> +    struct page_info *pg =3D v->stats.pg;
> +
> +    if ( !pg )
> +        return;
> +
> +    v->stats.va =3D NULL;
> +
> +    if ( v->stats.va )
> +        unmap_domain_page_global(v->stats.va);
> +
> +    v->stats.va =3D NULL;

Looks like you meant to delete the first `va->stats.va =3D NULL` but =
forgot?

> +
> +    free_domheap_page(pg);

Pretty sure this will crash.

Unfortunately page allocation and freeing is somewhat complicated and =
requires a bit of boilerplate.  You can look at the =
vmtrace_alloc_buffer() code for a template, but the general sequence you =
want is as follows:

* On the allocate side:

1. Allocate the page

   pg =3D alloc_domheap_page(d, MEMF_no_refcount);

This will allocate a page with the PGC_allocated bit set and a single =
reference count.  (If you pass a page with PGC_allocated set to =
free_domheap_page(), it will crash; which is why I said the above.)

2.  Grab a general reference count for the vcpu struct=E2=80=99s =
reference to it; as well as a writable type count, so that it doesn=E2=80=99=
t get used as a special page

if (get_page_and_type(pg, d, PGT_writable_page)) {
  put_page_alloc_ref(p);
  /* failure path */
}

* On the free side, don=E2=80=99t call free_domheap_pages() directly.  =
Rather, drop the allocation, then drop your own type count, thus:

v->stats.va <http://stats.va/> =3D NULL;

put_page_alloc_ref(pg);
put_page_and_type(pg);

The issue here is that we can=E2=80=99t free the page until all =
references have dropped; and the whole point of this exercise is to =
allow guest userspace in dom0 to gain a reference to the page.  We =
can=E2=80=99t actually free the page until *all* references are gone, =
including the userspace one in dom0.  The put_page() which brings the =
reference count to 0 will automatically free the page.


> +}
> +
> +static int stats_alloc_buffer(struct vcpu *v)
> +{
> +    struct domain *d =3D v->domain;
> +    struct page_info *pg;
> +
> +    pg =3D alloc_domheap_page(d, MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    v->stats.va =3D __map_domain_page_global(pg);
> +    if ( !v->stats.va )
> +        return -ENOMEM;
> +
> +    v->stats.pg =3D pg;
> +    clear_page(v->stats.va);
> +    return 0;
> +}

The other thing to say about this is that the memory is being allocated =
unconditionally, even if nobody is planning to read it.  The vast =
majority of Xen users will not be running xcp-rrd, so it will be =
pointless overheard.

At a basic level, you want to follow suit with the vmtrace buffers, =
which are only allocated if the proper domctl flag is set on domain =
creation.  (We could consider instead, or in addition, having a global =
Xen command-line parameter which would enable this feature for all =
domains.)

> +
> static void vmtrace_free_buffer(struct vcpu *v)
> {
>     const struct domain *d =3D v->domain;
> @@ -203,6 +239,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>  */
> static int vcpu_teardown(struct vcpu *v)
> {
> +
> +    stats_free_buffer(v);
> +
>     vmtrace_free_buffer(v);
>=20
>     return 0;
> @@ -269,6 +308,9 @@ struct vcpu *vcpu_create(struct domain *d, =
unsigned int vcpu_id)
>     if ( vmtrace_alloc_buffer(v) !=3D 0 )
>         goto fail_wq;
>=20
> +    if ( stats_alloc_buffer(v) !=3D 0 )
> +        goto fail_wq;
> +
>     if ( arch_vcpu_create(v) !=3D 0 )
>         goto fail_sched;
>=20
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 297b98a562..39de6d9d05 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1099,6 +1099,10 @@ static unsigned int resource_max_frames(const =
struct domain *d,
>     case XENMEM_resource_vmtrace_buf:
>         return d->vmtrace_size >> PAGE_SHIFT;
>=20
> +    // WIP: to figure out the correct size of the resource
> +    case XENMEM_resource_stats_table:
> +        return 1;
> +
>     default:
>         return -EOPNOTSUPP;
>     }
> @@ -1162,6 +1166,28 @@ static int acquire_vmtrace_buf(
>     return nr_frames;
> }
>=20
> +static int acquire_stats_table(struct domain *d,
> +                                unsigned int id,
> +                                unsigned int frame,
> +                                unsigned int nr_frames,
> +                                xen_pfn_t mfn_list[])
> +{
> +    const struct vcpu *v =3D domain_vcpu(d, id);
> +    mfn_t mfn;
> +

Maybe I=E2=80=99m paranoid, but I might add an =E2=80=9CASSERT(nr_frames =
=3D=3D 1)=E2=80=9D here

> +    if ( !v )
> +        return -ENOENT;
> +
> +    if ( !v->stats.pg )
> +        return -EINVAL;
> +
> +    mfn =3D page_to_mfn(v->stats.pg);
> +    mfn_list[0] =3D mfn_x(mfn);
> +
> +    printk("acquire_perf_table: id: %d, nr_frames: %d, %p, domainid: =
%d\n", id, nr_frames, v->stats.pg, d->domain_id);
> +    return 1;
> +}
> +
> /*
>  * Returns -errno on error, or positive in the range [1, nr_frames] on
>  * success.  Returning less than nr_frames contitutes a request for a
> @@ -1182,6 +1208,9 @@ static int _acquire_resource(
>     case XENMEM_resource_vmtrace_buf:
>         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
>=20
> +    case XENMEM_resource_stats_table:
> +        return acquire_stats_table(d, id, frame, nr_frames, =
mfn_list);
> +
>     default:
>         return -EOPNOTSUPP;
>     }
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f4b1ca10d..2a8b534977 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -264,6 +264,7 @@ static inline void vcpu_runstate_change(
> {
>     s_time_t delta;
>     struct sched_unit *unit =3D v->sched_unit;
> +    uint64_t * runstate;
>=20
>     =
ASSERT(spin_is_locked(get_sched_res(v->processor)->schedule_lock));
>     if ( v->runstate.state =3D=3D new_state )
> @@ -287,6 +288,10 @@ static inline void vcpu_runstate_change(
>     }
>=20
>     v->runstate.state =3D new_state;
> +
> +    // WIP: use a different interface
> +    runstate =3D (uint64_t*)v->stats.va;

I think you should look at =
xen.git/xen/include/public/hvm/ioreq.h:shared_iopage_t for inspiration.  =
Basically, you cast the void pointer to that type, and then just access =
`iopage->vcpu_ioreq[vcpuid]`.   Put it in a public header, and then both =
the userspace consumer and Xen can use the same structure.

As I said in my response to the cover letter, I think =
vcpu_runstate_info_t would be something to look at and gain inspiration =
from.

The other thing to say here is that this is a hot path; we don=E2=80=99t =
want to be copying lots of information around if it=E2=80=99s not going =
to be used.  So you should only allocate the buffers if specifically =
enabled, and you should only copy the information over if v->stats.va =
<http://stats.va/> !=3D NULL.

I think that should be enough to start with; we can nail down more when =
you send v1.

Peace,
 -George


--Apple-Mail=_FA80A71B-A1CF-42BD-9B44-701910E9BB1C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Preface: It looks like this may be one of your first =
hypervisor patches. &nbsp;So thank you! &nbsp;FYI there=E2=80=99s a lot =
that needs fixing up here; please don=E2=80=99t read a tone of annoyance =
into it, I=E2=80=99m just trying to tell you what needs fixing in the =
most efficient manner. :-)<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 17 May 2022, at 15:33, =
Matias Ezequiel Vara Larsen &lt;<a href=3D"mailto:matiasevara@gmail.com" =
class=3D"">matiasevara@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Allow =
to map vcpu stats using acquire_resource().<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>This =
needs a lot more expansion in terms of what it is that you=E2=80=99re =
doing in this patch and why.</div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D""><div class=3D""><br class=3D"">Signed-off-by: =
Matias Ezequiel Vara Larsen &lt;<a href=3D"mailto:matias.vara@vates.fr" =
class=3D"">matias.vara@vates.fr</a>&gt;<br class=3D"">---<br class=3D""> =
xen/common/domain.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 42 =
+++++++++++++++++++++++++++++++++++++<br class=3D""> xen/common/memory.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 29 =
+++++++++++++++++++++++++<br class=3D""> xen/common/sched/core.c =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;5 +++++<br class=3D""> =
xen/include/public/memory.h | &nbsp;1 +<br class=3D""> =
xen/include/xen/sched.h &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;5 +++++<br =
class=3D""> 5 files changed, 82 insertions(+)<br class=3D""><br =
class=3D"">diff --git a/xen/common/domain.c b/xen/common/domain.c<br =
class=3D"">index 17cc32fde3..ddd9f88874 100644<br class=3D"">--- =
a/xen/common/domain.c<br class=3D"">+++ b/xen/common/domain.c<br =
class=3D"">@@ -132,6 +132,42 @@ static void vcpu_info_reset(struct vcpu =
*v)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;v-&gt;vcpu_info_mfn =3D =
INVALID_MFN;<br class=3D""> }<br class=3D""><br class=3D"">+static void =
stats_free_buffer(struct vcpu * v)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;struct page_info *pg =3D v-&gt;stats.pg;<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;if ( !pg )<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;v-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a> =3D NULL;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;if ( v-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a> )<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unmap_domain_page_global(v-&gt;<=
a href=3D"http://stats.va" class=3D"">stats.va</a>);<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;v-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a> =3D NULL;<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Looks =
like you meant to delete the first `va-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a> =3D NULL` but forgot?</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;free_domheap_page(pg);<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Pretty =
sure this will crash.</div><div><br class=3D""></div><div>Unfortunately =
page allocation and freeing is somewhat complicated and requires a bit =
of boilerplate. &nbsp;You can look at the vmtrace_alloc_buffer() code =
for a template, but the general sequence you want is as =
follows:</div><div><br class=3D""></div><div>* On the allocate =
side:</div><div><br class=3D""></div><div>1. Allocate the =
page</div><div><br class=3D""></div><div>&nbsp; &nbsp;pg =3D =
alloc_domheap_page(d, MEMF_no_refcount);</div><div><br =
class=3D""></div><div>This will allocate a page with the PGC_allocated =
bit set and a single reference count. &nbsp;(If you pass a page with =
PGC_allocated set to free_domheap_page(), it will crash; which is why I =
said the above.)</div><div><br class=3D""></div><div>2. &nbsp;Grab a =
general reference count for the vcpu struct=E2=80=99s reference to it; =
as well as a writable type count, so that it doesn=E2=80=99t get used as =
a special page</div><div><br class=3D""></div><div>if =
(get_page_and_type(pg, d, PGT_writable_page)) {</div><div>&nbsp; =
put_page_alloc_ref(p);</div><div>&nbsp; /* failure path =
*/</div><div>}</div><div><br class=3D""></div><div>* On the free side, =
don=E2=80=99t call free_domheap_pages() directly. &nbsp;Rather, drop the =
allocation, then drop your own type count, thus:</div><div><br =
class=3D""></div><div>v-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a>&nbsp;=3D NULL;</div><div><br =
class=3D""></div><div>put_page_alloc_ref(pg);</div><div>put_page_and_type(=
pg);</div><div><br class=3D""></div><div>The issue here is that we =
can=E2=80=99t free the page until all references have dropped; and the =
whole point of this exercise is to allow guest userspace in dom0 to gain =
a reference to the page. &nbsp;We can=E2=80=99t actually free the page =
until *all* references are gone, including the userspace one in dom0. =
&nbsp;The put_page() which brings the reference count to 0 will =
automatically free the page.</div><div><br class=3D""></div><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D""><div=
 class=3D"">+}<br class=3D"">+<br class=3D"">+static int =
stats_alloc_buffer(struct vcpu *v)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;struct domain *d =3D v-&gt;domain;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;struct page_info *pg;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;pg =3D alloc_domheap_page(d, MEMF_no_refcount);<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;if ( !pg )<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -ENOMEM;<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;v-&gt;<a =
href=3D"http://stats.va" class=3D"">stats.va</a> =3D =
__map_domain_page_global(pg);<br class=3D"">+ &nbsp;&nbsp;&nbsp;if ( =
!v-&gt;<a href=3D"http://stats.va" class=3D"">stats.va</a> )<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
-ENOMEM;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;v-&gt;stats.pg =3D pg;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;clear_page(v-&gt;<a href=3D"http://stats.va" =
class=3D"">stats.va</a>);<br class=3D"">+ &nbsp;&nbsp;&nbsp;return 0;<br =
class=3D"">+}<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>The other thing to say about this is that the =
memory is being allocated unconditionally, even if nobody is planning to =
read it. &nbsp;The vast majority of Xen users will not be running =
xcp-rrd, so it will be pointless overheard.</div><div><br =
class=3D""></div><div>At a basic level, you want to follow suit with the =
vmtrace buffers, which are only allocated if the proper domctl flag is =
set on domain creation. &nbsp;(We could consider instead, or in =
addition, having a global Xen command-line parameter which would enable =
this feature for all domains.)</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">+<br class=3D""> =
static void vmtrace_free_buffer(struct vcpu *v)<br class=3D""> {<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;const struct domain *d =3D =
v-&gt;domain;<br class=3D"">@@ -203,6 +239,9 @@ static int =
vmtrace_alloc_buffer(struct vcpu *v)<br class=3D""> &nbsp;*/<br =
class=3D""> static int vcpu_teardown(struct vcpu *v)<br class=3D""> {<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;stats_free_buffer(v);<br =
class=3D"">+<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;vmtrace_free_buffer(v);<br class=3D""><br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;return 0;<br class=3D"">@@ -269,6 =
+308,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int =
vcpu_id)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;if ( =
vmtrace_alloc_buffer(v) !=3D 0 )<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto fail_wq;<br =
class=3D""><br class=3D"">+ &nbsp;&nbsp;&nbsp;if ( stats_alloc_buffer(v) =
!=3D 0 )<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto =
fail_wq;<br class=3D"">+<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;if ( =
arch_vcpu_create(v) !=3D 0 )<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto fail_sched;<br =
class=3D""><br class=3D"">diff --git a/xen/common/memory.c =
b/xen/common/memory.c<br class=3D"">index 297b98a562..39de6d9d05 =
100644<br class=3D"">--- a/xen/common/memory.c<br class=3D"">+++ =
b/xen/common/memory.c<br class=3D"">@@ -1099,6 +1099,10 @@ static =
unsigned int resource_max_frames(const struct domain *d,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;case XENMEM_resource_vmtrace_buf:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
d-&gt;vmtrace_size &gt;&gt; PAGE_SHIFT;<br class=3D""><br class=3D"">+ =
&nbsp;&nbsp;&nbsp;// WIP: to figure out the correct size of the =
resource<br class=3D"">+ &nbsp;&nbsp;&nbsp;case =
XENMEM_resource_stats_table:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br class=3D"">+<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -EOPNOTSUPP;<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">@@ -1162,6 +1166,28 =
@@ static int acquire_vmtrace_buf(<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;return nr_frames;<br class=3D""> }<br =
class=3D""><br class=3D"">+static int acquire_stats_table(struct domain =
*d,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int id,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int frame,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int nr_frames,<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xen_pfn_t mfn_list[])<br =
class=3D"">+{<br class=3D"">+ &nbsp;&nbsp;&nbsp;const struct vcpu *v =3D =
domain_vcpu(d, id);<br class=3D"">+ &nbsp;&nbsp;&nbsp;mfn_t mfn;<br =
class=3D"">+<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Maybe I=E2=80=99m paranoid, but I might add an =
=E2=80=9CASSERT(nr_frames =3D=3D 1)=E2=80=9D here&nbsp;</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">+ &nbsp;&nbsp;&nbsp;if ( !v )<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -ENOENT;<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;if ( !v-&gt;stats.pg )<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
-EINVAL;<br class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;mfn =3D =
page_to_mfn(v-&gt;stats.pg);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;mfn_list[0] =3D mfn_x(mfn);<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;printk("acquire_perf_table: id: %d, =
nr_frames: %d, %p, domainid: %d\n", id, nr_frames, v-&gt;stats.pg, =
d-&gt;domain_id);<br class=3D"">+ &nbsp;&nbsp;&nbsp;return 1;<br =
class=3D"">+}<br class=3D"">+<br class=3D""> /*<br class=3D""> &nbsp;* =
Returns -errno on error, or positive in the range [1, nr_frames] on<br =
class=3D""> &nbsp;* success. &nbsp;Returning less than nr_frames =
contitutes a request for a<br class=3D"">@@ -1182,6 +1208,9 @@ static =
int _acquire_resource(<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;case =
XENMEM_resource_vmtrace_buf:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);<br class=3D""><br =
class=3D"">+ &nbsp;&nbsp;&nbsp;case XENMEM_resource_stats_table:<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return =
acquire_stats_table(d, id, frame, nr_frames, mfn_list);<br class=3D"">+<br=
 class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return -EOPNOTSUPP;<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">diff --git =
a/xen/common/sched/core.c b/xen/common/sched/core.c<br class=3D"">index =
8f4b1ca10d..2a8b534977 100644<br class=3D"">--- =
a/xen/common/sched/core.c<br class=3D"">+++ b/xen/common/sched/core.c<br =
class=3D"">@@ -264,6 +264,7 @@ static inline void =
vcpu_runstate_change(<br class=3D""> {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;s_time_t delta;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;struct sched_unit *unit =3D v-&gt;sched_unit;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;uint64_t * runstate;<br class=3D""><br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;ASSERT(spin_is_locked(get_sched_res(v-&gt;processo=
r)-&gt;schedule_lock));<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;if ( =
v-&gt;runstate.state =3D=3D new_state )<br class=3D"">@@ -287,6 +288,10 =
@@ static inline void vcpu_runstate_change(<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;v-&gt;runstate.state =3D new_state;<br =
class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;// WIP: use a different =
interface<br class=3D"">+ &nbsp;&nbsp;&nbsp;runstate =3D =
(uint64_t*)v-&gt;<a href=3D"http://stats.va" class=3D"">stats.va</a>;<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>I =
think you should look at =
xen.git/xen/include/public/hvm/ioreq.h:shared_iopage_t for inspiration. =
&nbsp;Basically, you cast the void pointer to that type, and then just =
access `iopage-&gt;vcpu_ioreq[vcpuid]`. &nbsp; Put it in a public =
header, and then both the userspace consumer and Xen can use the same =
structure.</div><div><br class=3D""></div><div>As I said in my response =
to the cover letter, I think vcpu_runstate_info_t would be something to =
look at and gain inspiration from.</div><div><br class=3D""></div><div>The=
 other thing to say here is that this is a hot path; we don=E2=80=99t =
want to be copying lots of information around if it=E2=80=99s not going =
to be used. &nbsp;So you should only allocate the buffers if =
specifically enabled, and you should only copy the information over if =
v-&gt;<a href=3D"http://stats.va" class=3D"">stats.va</a>&nbsp;!=3D =
NULL.</div><div><br class=3D""></div><div>I think that should be enough =
to start with; we can nail down more when you send =
v1.&nbsp;</div><div><br =
class=3D""></div><div>Peace,</div><div>&nbsp;-George</div></div><br =
class=3D""></body></html>=

--Apple-Mail=_FA80A71B-A1CF-42BD-9B44-701910E9BB1C--

--Apple-Mail=_75AC0B82-0989-47A8-A553-375D14B97929
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKs6ggACgkQshXHp8eE
G+1E6QgAxFeMf2r7mzEkC/LAmrWY46s/DYX5fEChGxIqDmbZmO8yL+4AwSV6QBra
hUQVJfG6pRKRvGlV/MeAxiDlPgK1D6K2bgES574Ie5DKjjdKpO+sm10zxCeTuebB
ak1MilpSLhY+8b6rtZgXarzQT3i5V30PEvRX+33CuTD4Tc9RboSSP1U2dB18C90x
BBhMlT4ijbaunzMW8CsgV2VspKgVbUOjWEH1USuqXim4F1MyhbXD2GYdUN+NvYRK
spHVX/jcOW0n16SUSbNYXD57F69WI2z5bnIosMeTnYY50qX9b+A+v5IOuRRo/mfF
AXIipWGg76AYh4B5NdkoXzLsErlTlQ==
=MTyZ
-----END PGP SIGNATURE-----

--Apple-Mail=_75AC0B82-0989-47A8-A553-375D14B97929--

