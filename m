Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133216C21E0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512112.791793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLT0-00015H-0l; Mon, 20 Mar 2023 19:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512112.791793; Mon, 20 Mar 2023 19:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLSz-00012R-Tw; Mon, 20 Mar 2023 19:46:49 +0000
Received: by outflank-mailman (input) for mailman id 512112;
 Mon, 20 Mar 2023 19:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peLSy-00012L-5a
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:46:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d698d7-c757-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 20:46:46 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 15:46:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5528.namprd03.prod.outlook.com (2603:10b6:5:2c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 19:46:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 19:46:30 +0000
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
X-Inumbo-ID: f0d698d7-c757-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679341606;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rRdq8SeMNqBhRW5k0lO2KCQHkrOHIO8uhBcHaFzTd8o=;
  b=OIqHJ6Pgcp4uwVDHmBZ4UoJCkvvmfea9MlYhGi6BcCUZn/CVQ1G9NqC5
   xF5uBdP5sFRxzJ+auShW5n0DcVXvibsNPi98VgrxEQ49SMiQ/5QCPmstn
   HrTR3jr+/uCFIOAtgPsgNXObyr/+vXb5TwuO+fDvWrViOoUJbSs6ZeXL9
   Q=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 101601411
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6eMK6q4Tywywv8VjWYaRzgxRtLPGchMFZxGqfqrLsTDasY5as4F+v
 mYaDWiDbP+NM2Tyct52advi8EtSvZfdmNJgSAZrqnpmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 8UzdikRaCm/q6H1+qDkQ+tvv8M6M5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUoojuiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTePgr6Iz2TV/wEQxJToUUlyis8W5i1+gRdFbL
 FIe9QAX+P1aGEuDC4OVsweDiGCNuhkGc95RCPF88hzl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZRQBy8nupsc0lB2nZtR+FK+4iPXlFDe2x
 CqFxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3LV2es9StlZ4qoYYO55Fyd5vFFRK6YVVCAv
 3kC3sSb7fwUHLmcnSqBTfVLBqzB2hqeGDjVgFoqFZ9x8T2ooiSnZdoJvmE4I1p1OMEZfzOve
 FXUpQ5a+J5UOj2tcLNzZIWyTc8tyMAMCOjYaxwdVfIWCrAZSeNN1H0GiZK4t4w1rHURrA==
IronPort-HdrOrdr: A9a23:6ptGEKC2r0V1kgXlHelw55DYdb4zR+YMi2TDtnoBMiC9F/byqy
 nAppomPHPP5Qr5G0tQ/exoQZPgfZqEz/5ICOoqTNWftWvdyROVxehZhOOJ/9SHIVyaygc378
 hdmsZFZOEYQmIK6voSTTPIdeoI0Z2syojtr+Hb1nJsRQZhZ+Vb6RtjAArzKDwUeOADP+tBKK
 ah
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="101601411"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3JV3hRHJUXeJbfM+yFy2REeMHNaSJewK6H9vxnR/dgP49wOm2AfD0T91udN5x2RVniG6UHFy0fz9Gft9nHhNvARzbn4mnX/nhcsxScbP0nmZVyFrG8QSIRxfJY933AcJbRoBT20ROIpL1gFpi/JsKBB0qL/SLsH3y6FFcVTLtMOuFJr3TX6N+cI+OKYfPr4ks+50kBVBLy3ZePtrYmAs6xLTfH8wOVGSzdKDBd0ntob+1WRYjV0mK62L8iJC0uYf5/DVy3lDzzEqu5FgP1JOoXsEo9av7QtEYpZweVp/pda5uNyyJpYNSM49AaNOmTF3DHoqQ8/W/JuUzXxMs8I1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRdq8SeMNqBhRW5k0lO2KCQHkrOHIO8uhBcHaFzTd8o=;
 b=LReuzUNYXIK6qtIn7hANwpq9FGwsIIWXPxVBmgYcVX21ZH42U12luJh9XTbJD+Z6wvs60sv1aIBxVxGfPyRgD7D+i7ElK0WxXzzEsxMP6+s7v/m8QKMvLBbUJ4YSO+soiR6dZDnnIxNvKf1j6JTNjwJVXrFlUCnSIoQd3trcoXCsJCHT3Jr/hGk0dBAMoRYg66vX8YMNu2crsacbUsulc6sYcS0GRjSf9Bem6yy4oiRriyn+jC2ZO1ljK0KcL+2s5IZ9Q4qkexlBejm+2mEXknjry3FSO5F5vugvxO0/TSB3imsqumDAszDG7WbvXY6M4i5gonKfhutpr3GtHCaWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRdq8SeMNqBhRW5k0lO2KCQHkrOHIO8uhBcHaFzTd8o=;
 b=vU+nGkh5QpZ9NliyZpPRRoGs+oYdzO9wX5L8X3he0E+89XtNIU3B6ZyKMdj3nWYhI5CFmUS0TEtWy0u3o/vpOagogqbSOskVeFifPJuXyszj1Ql5pE7qd02ABsBgblp+qhbksdl2W60mCfpBfgcYXspeC+RzyJo4cmmrBcbP99k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <22919956-a35f-1710-3fb7-6a8b37233a04@citrix.com>
Date: Mon, 20 Mar 2023 19:46:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-GB
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
 <3db374f7-4c87-f39f-dbad-a1a242d4914f@list.ru>
In-Reply-To: <3db374f7-4c87-f39f-dbad-a1a242d4914f@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0acf11-fe92-43c9-6772-08db297bcd34
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mFlbnNYtUpqpAaL44pTVyEDv5etxIabLFEBqUaG/M26iqOBvt8yTupK2tVye5FtYA11hU6Sd1YtaFU9CkUIDfGw6ERt/oUG3/eVIB9EsAxhgORnIYonNtGdur2rtiUd4t2UU8CY66k94YAMAq6R1GwCoo3nJCfQgHXZpCX/ODeL+NbQL7PG8Q2TtTp/TKMGofUVCxWtVVXCDAFf97nMTiN+Qko5ZJwgHMfkeAKKQaXx7uWU+98KynHw1kz2UzIZfNTKRJQW0C8m2t24rXeSQ9XnknKV797I/dQW8a+dWzBIfN0LX79OWwKugcNWKSwqSFPlvYNFLssHjsEUBZUhUIAChBQIh4oQ2I6cmKV8nLhIHM/+v31S5q1fmnQF2eBo8SN5qlPbqZcXo2Len3dgApNXvlg2Xp6FcxH5CLNfSHxy2Kh4t4//xKtGdNhdIv4c9y5Lz8bqy3ACrW0cNZ7CgWnQ06bOlfnIDyuiyJTTXjSgwz2+DjxwwL+SPafI0dLzOj7akAR+s9JIIOD7s18aFmMzRmvmVmp2bJJOHyIO9Ct9W5RTfadETYKuUYdj0LnBzpifRHKtAXoEjVQOqJnCa9+3jAC3zR3VkYUP5G7o08br+zLtWPmKrvRdMt9YvOHBqdTX4ud608janJlI11HSll6QhtB4nvXbqs0JhBIdIF+lSRWAJqQrcSgyxVyE5VvdYrvzi9NOYRuVtX3Tk7BpOq0+LObD1+hy/tivj5Gq7ssorofJrHxDfAil65+OvdgDdzb+tXd8rgMYPDGvca0APTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199018)(82960400001)(2906002)(83380400001)(6506007)(31696002)(6512007)(8936002)(7416002)(36756003)(53546011)(5660300002)(6486002)(966005)(41300700001)(2616005)(86362001)(26005)(6666004)(186003)(316002)(54906003)(478600001)(31686004)(66556008)(66476007)(66899018)(66946007)(38100700002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZZb09zbVFNaS9qYXk5ZjVmSnhnZm0rSkFhVi9zckZRdEg5RWdDbGNaTnN0?=
 =?utf-8?B?aXQ4U0VDYWYzK3BLYWlaMnhRMmRYbXRreUN4UUFtOThQZURPLzBGRkRnM0xC?=
 =?utf-8?B?TjNVZ1NySTlLZHB1dFkwTFBDRXl3Rnlqc01pRWhNSWpWSVhjdTkzeUhCK0Zn?=
 =?utf-8?B?S0tEVmZ6SmJIeWZ2ajdCNlVPRDlVLzZlK1gwUzJ1S1F2OTJQRXREemREeEdx?=
 =?utf-8?B?VW5NTEtybU9BRVFIUlgvNFJpMjMxb0NsQXQ1cHJMMUxSaUNCWWxqMVZiSXpk?=
 =?utf-8?B?eFc2dys0V1Z5ekQ2UUFXNEpUc0srMzZQQjliaXFXYlhSR2NOdUlPS25YTkMv?=
 =?utf-8?B?YkRmckV1enlQSnpubmU4S1JFQSt5bThDK0dNVnM1YTFRMXQ5ejZDN2gxN1Q4?=
 =?utf-8?B?bVN1ZXF5SFJMcUgrU2xVOGt4aUJRSGZjV0wrZTBqYTZ1Nm9EWEVhaHdCMmVj?=
 =?utf-8?B?VU51K0gwdkt5cEE1UkI0bWRvWjZjMUJPT0UvWEs0UGg4NXg1c2Z4dlNwdGUr?=
 =?utf-8?B?S1NUL1hES0JkNm95TmpvV2ZkY29FZ0NMb1YvdDMreDJEUWRFRjN0RkcxZ1k3?=
 =?utf-8?B?cjJHM0VrSUFJUDV0UE50Q21qQmR2YjVaemdTY2dnejF4NCtrWlRoWGFOdWJZ?=
 =?utf-8?B?OSthcnBBM1pqUVlpbnZ6dWJGZlNrd1NiMkdhbVMwcjR4OGVzMUFPN21vMFha?=
 =?utf-8?B?azNCcDVDUWp3ZUY2TW1TWG45NFJ2UUkrczFLRUlxdng4aEN6aDE1eHk2aDNS?=
 =?utf-8?B?SENqV3hyZFlKaWtpU1NRYjI1ekRvNTgvSC9lam0wZC9vZXJIT3BJd0dQS0dq?=
 =?utf-8?B?dDk5MmlCWTlxQTZGTVo0TG1hNU95eFM2REoreGZlSmh4MmxwN1BvU1lxTnZk?=
 =?utf-8?B?cDVFWFphZlV6cFhIUWR2dmc5NnJkVXA3SGd0eXhqaWh6cFhBaWcrckozZEdG?=
 =?utf-8?B?NjBiVENKUlk4bnFMRlF3UFBvdjNDeVVXQ2Radmp2ZVQvZzViYnZKQ3JPM1lt?=
 =?utf-8?B?NEVUa3V5MkVKZ0JKU1o0Vk0rSmdHN296MVg3R056b3ZZeTh2bGd1MUFqcGxI?=
 =?utf-8?B?U0M2eTA0Zm13Zmdva1ByMlVJZmtqdXZOaG5ibVhNWHg5SVYyOHNHaWV2UGov?=
 =?utf-8?B?TUwvYVFta25QdXZWWnlRWGNjREdaMkFJcm5ISnp5Z2RaTzVKaXJaR2E0UmEv?=
 =?utf-8?B?bjhZcnBDdVp4alNRYkxFTGYrdDJDMjVlZ0JrNmlTcXI2TlF0MStuYXVZMGdy?=
 =?utf-8?B?b2hDaWtKR2JESFBNay90bHJYN1hDY2FkQ3JnYUVpVkJxWWx2bW1LMDBBRGJ6?=
 =?utf-8?B?UWFCMHdBR0hNeExnanFmWDNCbGhnK1Y5R0FhYktOYzFtU0dMRUxtbFpLamV4?=
 =?utf-8?B?TnVOek1xaFEzOWF1VE91Mk1RS2g2Q0t3eUtTZXdydlRXRGlYd1kvL1ppbWJI?=
 =?utf-8?B?VlpPc2tzSFhjWW9hVVdmdWJNdm1wZldNdlVUTHpabW5uUk1xbWxzQzkySzhT?=
 =?utf-8?B?OTg5M1gvT0laWXZEWEFUTlRuUWUzcVFVMnBIWWdtSExQNUI3QTN0V0kwWHhZ?=
 =?utf-8?B?UVNPdFdwQktuNUFRMFcvT3I2ditTYnJ0SjhPYTZkQWNRa2pOMENReTJjT2da?=
 =?utf-8?B?OFVPdUdXZ2RiK1hOVXpXMnNRdFpyeGhra2dWeFJPZm9IUU9oUjJqbUNrNmRq?=
 =?utf-8?B?UEp5MlMyTWNmeUY4elhTZmVON1dMWkIrRml6YTQ4WUM5WHhzRjd3eDhyZ0ly?=
 =?utf-8?B?RjVkRmlYZUZzQWJISkpGRU45SXp4Z3pSQkxWRDFRSXZPWTg5amE5d1U1MUJx?=
 =?utf-8?B?d1VBVzlnQ3VwZnlPTFhlUDF1OWFRTDV1dDZQQmtiU2lOU3AvdXowbkV2OXEv?=
 =?utf-8?B?T3o2MjZBK0FRVlhneVZ5SHl1Q2RwQ1A5d2hRWm0xVExRM1Z2bml1RW1pT01x?=
 =?utf-8?B?ZjFvZGhtYTBYSlhpYW8ySXNJMEJWaTNoMStORCtRUm5YQ0hRS3dFWFRrQnV3?=
 =?utf-8?B?emhMekJDNWdTNm8wS3pIZWQxWUtIWElueW93ZG8rdzI0YnovaWpLNUVUcFBF?=
 =?utf-8?B?V01hamxUeEJhSTNMcnhnUUhMWCtuMm1pSWVtSlBuRElNQTlrRW9GeU00ZVRF?=
 =?utf-8?B?RlRPeGZpOXhNQjd0WWoxUHpKdkczc0VaSEJ1NmNVN1dNamN5MTRoQVVwamU3?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?QUp1MDcrMUZaZUVFRUhSUVZCSGpCOEdwUFNBWVJKZm5RTGxCYm9OejZrQWMr?=
 =?utf-8?B?cUxOSTN2RElQYUdpWTZHdU42OVd1d0lrc29GYUE5ZjFOUzBqbm5PcDVjZmhF?=
 =?utf-8?B?Wmx0cElkWHVvOE5PazNkd052Qnd0cEdRV1k2Szh4b3paVXJrWDViR3g1Z0hP?=
 =?utf-8?B?OVpqWDRKdHV0ZnA0SGtTbGU0Z1pvcFlWMlZ2UVpYR3JBR2htRmdDM1VNaHV3?=
 =?utf-8?B?VTNrYk9jVVVYdUNkWm95WmRiNExQSGF2MmpEM0ZVazRteXczTGcrYVFSc0Vu?=
 =?utf-8?B?aUtaQ1dXaXlCb1JXS3FuRzBDSzVUSDl6SFFBbG9aQ3hWZ1A0NDdxVmNRQ0Nx?=
 =?utf-8?B?K1hvU1lQMW1RUDBCWTlxN1FtTTBoRzBLMmZUS295YTl5RFR3TXcyNk9DNkFI?=
 =?utf-8?B?RXE5Y0dlM3ZUV2JTSXVGZGVvOHp0UnZRT3IwZnBQc0lWK1kvUUl5UkZXQWlS?=
 =?utf-8?B?bHMwVUo3TUN0WE8yNUNLejJlczdhaytUK1Nad3VvSXF6RHVmVmUvTER4STc5?=
 =?utf-8?B?MlUxbUVSQWhQeEZPNXVKakJmSFN6dGgvTWFqNFg3aEZNakx3VDR2SkJCeFpl?=
 =?utf-8?B?cmhSemxQdnNNdEF5aFgxMlV3bHAwQTRoWDNWZ2h5cUJQYWE3bUxRcWhjOXBY?=
 =?utf-8?B?Qm16SG9ZSHgyZW0vYVFkdlE5S0h5a1U5QnY5RVdCQ2hpdW8yV1NuQk1sVjc5?=
 =?utf-8?B?M2c2T252U0Q3eFZIV0Zoc0VZVEZpRUZzWnRyQncxWXBWSHZ3QURuLzdZdE9Q?=
 =?utf-8?B?L2dEWjhEMHFGWm1PSFU5VVcrRU05eitpU2wxaUp2Ni8yRi83MTJpbldHZXly?=
 =?utf-8?B?WVNzdHhoQUNYUlIwbUJGekpFTXpVd1U0SHNxR2hFbDVXck1BbWZJbmV4eXk4?=
 =?utf-8?B?OVdDOFB6Um9JMU5VZUR3aDF1RzQrUTNsYVlsenNkamVVaVJReGs0SnFJaHB2?=
 =?utf-8?B?R3pYVzIra0pDNGVNRXhUbFNJZmgvbUVXcVkraENTR29UTFYyaks4em5BVlFz?=
 =?utf-8?B?eDFiZTUrUDg2YitjS2phQVk1eTBZdWJDRVdlU2ladUhyVGVub3BWcXF0RW9u?=
 =?utf-8?B?K2RaeFFEVW9taW5GMVdlUlNHOTlQNzhGUG8wd2g4WHlwQnVxblJ2SVdIeFdI?=
 =?utf-8?B?ZnNJOTNpengwMmwwOXFpOEZZV2FUc2RpSFdoeXpMTXE4bGRYQU1UbWlISGRW?=
 =?utf-8?B?Ykt6L3FNTEdQZS9zQWlpOFRsS3NydFg1R2lFbUZuUzZyN01hcTMzckwwY3NF?=
 =?utf-8?Q?vwl5B6rcSDnbL1Z?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0acf11-fe92-43c9-6772-08db297bcd34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 19:46:30.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTyi280uGTzkA+HcYu2Aw5qj/cx4H7jDMatyWOY/SGAluKW8obfAQFsXQW289Hjqi/SzPe40ebJknJobd7sOY3kBnh1sQBkhkMlzOt+HQWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5528

On 20/03/2023 7:35 pm, Ковалёв Сергей wrote:
> 20.03.2023 22:07, Andrew Cooper пишет:
>>
>> More generally, issuing the hypercall under vcpu0 isn't necessarily
>> correct.  It is common for all vCPUs to have equivalent paging settings,
>> but e.g. Xen transiently disables CR4.CET and CR0.WP in order to make
>> self-modifying code changes.
>>
>> Furthermore, the setting of CR4.{PAE,PSE} determines reserved bits, so
>> you can't even ignore the access rights and hope that the translation
>> works out correctly.
>
> Thanks! I didn't think about such things earlier. I should to think
> this know carefully.

If you haven't already, read

https://github.com/xen-project/xen/blob/master/xen/arch/x86/mm/guest_walk.c

and

https://github.com/andyhhp/xtf/blob/pagetable-emulation/tests/pagetable-emulation/main.c

These are various notes and tests I made last time I had to rewrite
Xen's pagewalk from scratch.

>
>>
>> Ideally we'd have a pagewalk algorithm which didn't require taking a
>> vcpu, and instead just took a set of paging configuration, but it is all
>> chronically entangled right now.
>>
>
> Do You mean to add new implementation of "paging_ga_to_gfn_cr3"?

Yes, but I didn't mean for this to be taken as a suggestion.  It's far
more work than it sounds...

>
>> I think, at a minimum, you need to take a vcpu_id as an input, but I
>> suspect to make this a usable API you want an altp2m view id too.
>>
>
> Why we should consider altp2m while translating guest virtual address to
> guest physical one?

Because altp2m can change the gfn mappings, and therefore the contents
of the pagetables.

A pagewalk from cr3 in one view can end up being totally different to a
walk from the same cr3 in a different view.

>
>> Also, I'm pretty sure this is only safe for a paused vCPU.  If the vCPU
>> isn't paused, then there's a TOCTOU race in the pagewalk code when
>> inspecting control registers.
>>
>
> Thanks! Should we pause the domain?

Certainly the vCPU.  Chances are that if you're making this hypercall
from a libvmi callback, the vCPU in question is already paused, at which
point taking one extra pause ref on it is very quick.

>
>>> +        uint32_t pfec = PFEC_page_present;
>>> +        unsigned int page_order;
>>> +
>>> +        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec,
>>> &page_order);
>>> +        domctl->u.gva_to_gfn.addr = gfn;
>>> +        domctl->u.gva_to_gfn.page_order = page_order;
>>
>> page_order is only not stack rubble if gfn is different to INVALID_GFN.
>>
>
> Sorry but I don't understand "is only not stack rubble". Do you mean
> that I should initialize "page_order" while defining it?

page_order is only initialised when gfn returns != INVALID_GFN.

See the function description.

~Andrew

