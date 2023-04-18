Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966F6E6910
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 18:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522999.812716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponwL-0004Zi-QO; Tue, 18 Apr 2023 16:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522999.812716; Tue, 18 Apr 2023 16:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponwL-0004Xb-NG; Tue, 18 Apr 2023 16:12:21 +0000
Received: by outflank-mailman (input) for mailman id 522999;
 Tue, 18 Apr 2023 16:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ponwK-0004XV-4T
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 16:12:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91e2f5b-de03-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 18:12:17 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 12:12:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5920.namprd03.prod.outlook.com (2603:10b6:a03:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:12:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:12:12 +0000
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
X-Inumbo-ID: c91e2f5b-de03-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681834337;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3iF0pFZWflMoXkz3LeLPPyJL2uX5n7WWH48UEJX9Xg0=;
  b=DwN932RNHF45uAuHK9DeBVHp9Ehw075JGDDUaSUhDoa8zsmqWuti7Rht
   Wz3XEpt/gZXfCxKZWm1bBz+X4bK/Y1sf6Kt0BkiMq094E+sPbSVQtN1y6
   ZCAlAE2gtCveicVNVx3dC9XbCsq22+ddV34nH6TF+vhqLatU0KFGxgal7
   8=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 105327146
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1VT7Wa2mZpquVKlqQPbD5VBwkn2cJEfYwER7XKvMYLTBsI5bpzEDn
 2UYCmiCM//cY2KjLd0ib97lo0gFvZWGz9FgTANrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKF9rr
 +0JCy00LQ2bqsOJxZG4ZPRtr5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBdlIS+TkqJaGhnWrmH0PS14nTWK/oNehhESQYe9VG
 1c9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqW8bKRsDWzJTlTKGYEbCAJVyMV7t/7uoYxgxnTCNF5H8adjNf4BDXxy
 DCitzUlivMYistj/6em+VHKhRq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJnGeu
 FAUls7Y6/oBZaxhjwSISeQJWbquvvCMNWSFhUY1RsZ9sTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiPBjaSSvCdrDO6wRw=
IronPort-HdrOrdr: A9a23:dbL9MqMJF6LsncBcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-Talos-CUID: 9a23:a+M/em7Jt22wqZxUndss3XAxQNE0UWDkj2rIDm6HDEVqZqCUYArF
X-Talos-MUID: 9a23:/WhC6AkJ6WiYEeR75UUodnpaatZ0oOefEHkJkLsetcOqDxF6Cyy02WE=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105327146"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7CzyLhJ5Tdg9na78zKhXBu2r2LnAhwCa2XK7GkmZbe1QbZmRaRZrUP7fLHdUybRr4xqoHp7jAJQG25MDSW+VXRhF+4+smSf3JCNS3K+DdUiSm+HvlpNTe3w3WRT0ncGyCw5pH7wth5MwbJc3VxaatAw639GDhSrKHkf0bltNUzVBQqmILY5YEoJ+FP5xfKjTV7p8ih6jBXIaUzagEjWJOmnh3BfyU77t46PnLWod8qe7T2bv5ZsxNJkP2L58LKw8cw9QJMFm2/3g7ZHalIzgE/7kY/w3qYKRTIsyfdlTM61PFjGoXKJE/squ1e+KVz0RU4nkC2ldmI+6xrqUg0Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR4juPX5MTHn0GLeJm0iu0Ao2luZDAcVEmc+G0mbQek=;
 b=k44TbrN3uywrm+gJNqKc6DvaKL6xRHKvHaohJzWF7M2rx3Vh2qOpkYYHcQ5HiKdllDjEjeDTPLENjRwJ4HnGWy6sfylCIROB45q91u4cuZyfezIRlsqp2nRNzs13gPYicS3ptH9cvXDVoYjbgvU76XGyr0eAI4wvmgdcmmJ8c+9wj+Vp38CzRIz/r90W22iCcO2JvDwUY1uITAwCfd2vyicZsJpXse2ZrV0wnn0Z5T2x4KSiNoOS4vHKCRS2yT+KZsolhWzi8eGKdbBMyXriHpzapr/AI/Sq2pj1KkmDrJRiwoyzdU57SyR+C1QPYzOH7SuLta6jC8gPsdX/gPvgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR4juPX5MTHn0GLeJm0iu0Ao2luZDAcVEmc+G0mbQek=;
 b=IxaxzOsRjVwG6F9tipzWQkxs5dqAZWykhPYHG4UoiH4AG4JNuzmvX7n/kE/xzmJig/x4KHJKzWsbGMtDT8Kwh66ww2TqdnXoidHOQvNWguSGkGN/LEKT4vz3kPI6NPivHVykUAwwGFtfRhDCQw4slOWlMXcAGFhcbe966pTGYV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <acea0109-967b-f3d3-2a60-b71e5a207ea6@citrix.com>
Date: Tue, 18 Apr 2023 17:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <ZD6/Fk6S6D421AgE@Air-de-Roger>
In-Reply-To: <ZD6/Fk6S6D421AgE@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8fa997-b373-46a3-0907-08db4027ab13
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EB8wIlXVpD66ezRqJ9hs3Z3vVwFTx1HURXxy494neQ88oIIHIELfxphHgGBun3Chg7fNuANJPWUheWgRixWLqBrtEOXzvK4LYFtO3rzi2LYzTDcO1joUIpWtVR3XzzvbnO2K6wGsWDT0CBpNKqYIJr0CHcKFf4WRaaBVVM96+i6jgDSj+4b46Kyv/yVuol8ALbkS0pj0Z11qvm+rl98auByfmedbyWVSXzTD93+X7YN3RJklKfFN7AL3w4Ghg6IZM/bI03HAw+IZ0YaQJhRDkkVzlPvJZ9fmK+3ZNCNcBd+j57ILliqSi8jHaBoJ7KCJGN+CyNZhB9wiipUcsqPy9qkNyeQaJz8KWvbAeKu13VdDzoJsDjatQ11LH5jy5w1UPQgcCsH5k7vfkFAW5xAonXme5ex0Mn0xHMDLIqB/cT50YlB78GwIJxqilN/Tv+O8aQ1Gz6otxipZrlD0gSSLGqQPzVDi0P0KN9duR4eCETCzMSZSq6fj+eShK611wR3fQxgVbDE4VEmiRDznnbDLcfa11QutktJkDwk9SDDtZAfOHaV34Wkkb5c2bfvoRKlpu5X4OCkSUBqYcGOdb0spMcBHLjXknskLc+/rltJdxm4Gjdpggk6VZj9njWCklhXAXi/8+ecb79ygRWIZGOaP/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(8936002)(36756003)(38100700002)(6862004)(8676002)(5660300002)(2906002)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(6636002)(37006003)(31686004)(186003)(2616005)(6512007)(53546011)(66946007)(6506007)(66476007)(26005)(41300700001)(82960400001)(316002)(83380400001)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpxOGs5VmpKaEhxVXVnUThndlpPUHpMOHF1cC8wTDJ5Tll6enNFaWhiQVJv?=
 =?utf-8?B?NjBhSE54U2hsb3M4bEs5TVo3cThIV3k3bjVIanZZRStDc2JqVUlxK3QzNFJV?=
 =?utf-8?B?alFRcXNJSldqTVVBYlZsbURPdG5uZFdXV0RQVXBSREhsMmVycEFNMGFqQUMy?=
 =?utf-8?B?S3F1aHQ4eXE4cVIwRDM3WWJSYk9tSFphL0k2OFc0ZWlmRC9ITjM5SXdCdy94?=
 =?utf-8?B?NlRibWdHUVMrakp5VnBHMGRtNU1HUjZqTER1RVV0dTh0UnVGRFZCdkk4WTlm?=
 =?utf-8?B?TVlNeVRLclZQQ3UzQlBwT0Y0aGVmV1VDZEZjZktPYnkxcnAvWEZnTEVOaVk5?=
 =?utf-8?B?Wk9YVmxCZ3FLVytPNTNYS3BHaTdRM3p5ZzcrL3BiMUoyeURaZ2orVm94NWNa?=
 =?utf-8?B?ZWJ1Tm9qOHpYTnFwcGY0T3dueGlGWUNXOXhGQW1EMXZWb2hzMHR1aitsZVgx?=
 =?utf-8?B?eFdqVDNXUUdCZFVUNFVhcGpQVlYzeHI0K1I3cEkyNnpDczA2L21kNmpDT1Yz?=
 =?utf-8?B?SnROb0N5ZDBhL0NsODBFQ2dQbWs4eW9PNjlVUnd0SXRHd2dHenBkZGhZeCty?=
 =?utf-8?B?aGVJR0JVQjlXSU00YWQ5VWt5NTFNTWlNS3l0cExvVGJkNE9vNytWV3hQMDU0?=
 =?utf-8?B?S3Uzb1hxY0hwRDZFNUpNbFpzMmRLQ2VMRXBnSXZaYWI0WXdqTm8rZEM1QWUv?=
 =?utf-8?B?L0RpNVZHR0phc25BMVZwbHJyV2NpUEdTaHhRRTd1aDhIT3N1TzBoTjcwcU9N?=
 =?utf-8?B?NlUrOHVhRGtnRjZLbjM3WGF1Y2tCdExNaU9KblVKWm42bVdaN000bVZ2MmI2?=
 =?utf-8?B?d3Zvc2JGY2RNUmFMakVtbk1vbk5UMzVjWnUvMU5WVDB4cVBRYUtFS2d1VlN0?=
 =?utf-8?B?a1RCdEMyREVEYnZQaVRSbWl6azhQQTJVMm4xOW03Z1VCVzdXM0xsaGdCUk0v?=
 =?utf-8?B?OENTc3pKYnRWTi92SzJVbWRtdkFtaTJNYmc5c0J5RkVKVlB0Qi9ucGdhSWpl?=
 =?utf-8?B?dkNnYnRQVCtMc2ZYcmhleXljeUw5a2pQUnNocTZuMEJNNjVVUWJXZHJrTW0x?=
 =?utf-8?B?dVptcVI0bkpFbTFtcC9PelpWcktMNXFCbTNxT3BuUkpEaTIvSm9JZXJ0a2Nu?=
 =?utf-8?B?M2QzSEZobzluVDU4TXd0N0l2Z3FGL2Y3SWhsQjhad0tCSUhUQXB4NnNQL1NL?=
 =?utf-8?B?Rkx2REhWaHlhelVmTnE0SDl5NDRSNFVhVzAvMjUvamY1SGk1aGtWZWZ5a1VS?=
 =?utf-8?B?dFA1Y3kvN1RNNWI5ZU82dWpxQjhqb295N2VEd3R3bGFtTlk4cWgrUEpEcXNM?=
 =?utf-8?B?MTJzRXk2VFRQQ08yU0JvR3ptQVhLWVFkZ1U5blhFbldoV21xWCtxVFZYQnJz?=
 =?utf-8?B?amZwcWpJODVvQlhzazJhcDFMbWN3ODkxdlFFdnBtbjh6L1p3V2xBU3F1RS9a?=
 =?utf-8?B?ZURQZ3N2QnIzS1ZSam5HQjdWeTUwM0tDWUhuK05tYWJ1R1F1RlFFN0xZVGZi?=
 =?utf-8?B?WVErSGI5anAvWitiOU53Z0dwZE5pdklFZ0hFTXI2bDB6b2pyYXZaYjN3Y296?=
 =?utf-8?B?SWNORDFEd1ZQcEhTZGlqWjZleStnZFhNd0FWQmtaaWNQRm5abmtBYVFBWnJN?=
 =?utf-8?B?Z3NFZEZGUC8wdUhEQVJGTk1EUjQycXVxTHZaM0ZZUjd0WnF4OVdicCtocFFD?=
 =?utf-8?B?VU8yYjJNMXN2OEVmY2U0L3VHUDczOC9lY293YTVJS2JIb0JjSDFELytMQVBW?=
 =?utf-8?B?MXpaUWU1RjZRL3R0Q2JiZGxKQjRWc0VoTDFacHVtY3VWdDNjQ00yZE9qZGNN?=
 =?utf-8?B?VEQzemFsbmt1Y1NLd2Z6ZUhyVzhHRFlrNy9oZ0lMY3kweTV3ZjFjMFRkL0hq?=
 =?utf-8?B?c3lwcnRocFJmNFVxOGFHQzRUTFN5cUZrZWwvc3doa2dOd2tna0hFSEpZN2ls?=
 =?utf-8?B?enpsaEZxSEt0TjNSdndkajFoQVR3REJDZjl0bXBFQnhqNmFhNU1Jd2NRNnU0?=
 =?utf-8?B?R2lJWnJIQzhCb2lnamU3ZHBoRGV3cERudU16M1ZIZTdvZGxJNHJLbUZOWmhX?=
 =?utf-8?B?enVDN2o3TVVTQk9aZGJsZHZNZGV5bS9qamVPQXdXeENxOGxHYjFQUEd0UXVX?=
 =?utf-8?B?ejVBbEZoNUVwaTVWdHZSUXVTaVNnR1Z3VjAwc01sTXVpY005UTNXWmV4ZUtC?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xfmy/1pVOy+tNC1W8zTEgm7O7MXXUBdbDWvS+hC+N3qq0JBqick2CjFOauwdVbeRUpyqUPrBZxiotvDQnxOLS4/GDr6AmwjZL2MdqvSR8+XTtERiMRN0Q+SMRqbpsmMkBzksk3tRWqmhwXt1nMKdzZKtN3lVRValc+9BZJR99Dg980tXXZHOaH5uniTzOPdBvfA2cshRYY4cFv2NCZ+k6bdILz8Lco+tyDJu0pyD+3jnP9FFbg5zYgjcLN3Qh+H5109qLCl2peKNj4RuyVacVnVuhDiX8Pcqhf+cDPqBIRoo60sfsjVKIVWTXL+91jZkfde4ES9+EVYGHC/9vVHQ0noynR3rQebo1vj4t6iWF5oJ6IhPj6XMhQO6tcI/3cgSTo+xqQ6B+TkE6xkKCBYajM0MpSDSGy1TKjRayJpDziExGZB7wyoX0u6dGSnB787jFkZd8nK8nQO+AIpSZxf5Q5nqCC474mg4q3u6eOBRNf8kh5Zfe6UsMXuiY9w8Nb8baIH63Pby/9sgvUFVsjnkEjZ8expthDgOvBFhrfKp/382o3WC9zMHUdyIKXw4WE/XS0QEa6SU8wjnqFLX3xZQP91m0FCWyAKuV1KGN9AILtArMUB/V/SKejuz1F27Orxp0FgOydOBGU6l5857hSqk0bLF0IrQRK4D2YagOhCFKhymsA5tGAdlHno9h7hOMVwrF9amiy9U262f6F38jMJUY6cOe9Ky8CEOhJJROBAn86v0co4GtPzd+LIF9Ro1hJI5L/IQMs/wO3yLdAmXlxa0RvITGqz8UXefaJpUTsjJHoPhlHjNCNj1PqJFcU64BJkxgs2dyLsPIr6JEbHoWFWh/FDz2VbVRfujQsLHHntVGff/dpCUSQV0GSGs2TlaC1pBeCStRW683QwiZuxwrbkS5BT7kcQMI6/ukE6Ml1WliUA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8fa997-b373-46a3-0907-08db4027ab13
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:12:12.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7nWCkjU3ImeGVozdOhmkGsGW2Z66Qjd7h/lG6uhYSIe2gacNbo8+04Jvi5wVnJ5kkPKEuFYyAUhLjVzJ9buOfdK1e/TF1djc5uiXH8AEaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920

On 18/04/2023 5:02 pm, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 04:54:49PM +0100, Andrew Cooper wrote:
>> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
>>> The addition of the flags field in the vcpu_set_singleshot_timer in
>>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
>>> increased.
>>>
>>> Remove such field addition and drop the implementation of the
>>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
>>> value just inject the timer interrupt.
>>>
>>> Bump the Xen interface version, and keep the flags field and
>>> VCPU_SSHOTTMR_future available for guests using the old interface.
>>>
>>> Note the removal of the field from the vcpu_set_singleshot_timer
>>> struct allows removing the compat translation of the struct.
>>>
>>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> While everything said is true, this isn't the reason to to get rid of
>> VCPU_SSHOTTMR_future
>>
>> It 505ef3ea8687 does appear to have been an ABI break, that's
>> incidental.  It dates from 2007 so whatever we have now is the de-facto
>> ABI, whether we like it or not.
>>
>> The reason to delete this is because it is a monumentality and entirely
>> stupid idea which should have been rejected outright at the time, and
>> the only guest we can find which uses it also BUG_ON()'s in response to
>> -ETIME.
> I agree, but didn't think it was necessary to get into debating
> whether it's useful or not, since its introduction was bogus anyway.

Well - the reason to actually make a change is that (older) guests are
really exploding on that BUG_ON() for reasons outside of their own control.

And the reason to fix it by ignoring VCPU_SSHOTTMR_future is because the
entire concept is broken and should never have existed.

The ABI argument just adds to why the patch ought to have been rejected
at the time.  But it was done, and the fact it has been like this for 16
years means that the ABI shouldn't change further, even if it done in
error in the first place.

>
>> It can literally only be used to shoot yourself in the foot with, and
>> more recent Linuxes have dropped their use of it.
>>
>> The structure needs to stay it's current shape, and while it's fine to
>> hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
>> need to say that it is explicitly ignored.
> Oh, I think I've dropped the comment I had added next to
> VCPU_SSHOTTMR_future that contained /* Ignored. */ (just like for the whole
> flags field).
>
> I can elaborate a bit on why VCPU_SSHOTTMR_future is not useful in the
> commit log, and add that Ignored comment to the flag.

The important thing is to not actually change the size of the structure,
and to change the commit message to explain the real reason why we need
to make the change.

~Andrew

