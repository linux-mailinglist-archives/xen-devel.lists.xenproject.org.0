Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364C5824EE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376064.608660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeiu-0007wc-4r; Wed, 27 Jul 2022 10:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376064.608660; Wed, 27 Jul 2022 10:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeiu-0007tj-1A; Wed, 27 Jul 2022 10:57:04 +0000
Received: by outflank-mailman (input) for mailman id 376064;
 Wed, 27 Jul 2022 10:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGeis-0007td-CG
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:57:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d662d130-0d9a-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 12:57:01 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 06:56:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6562.namprd03.prod.outlook.com (2603:10b6:806:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 10:56:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 10:56:47 +0000
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
X-Inumbo-ID: d662d130-0d9a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658919421;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Jo4v3tCyTo7UsiCgD6FlMYvgg1umXOt+HzjEdqsAhXw=;
  b=Mf13GOV4R6NGlvL6WHhT1aoYyIIk9kQgPUpD+QSy5V56Pp+bVmjwjBQe
   T7LgUrzTXgeMZgVEiENLDsp3Mat77MvkVDXbYsXjwI3qU9mGfcFQOceH7
   0HTYZ0hGSbf4T16s1WjOaZsBuwYSlYaIujDFo7CXs/qrsoPigJRgMzQ1K
   0=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 76521717
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9naJwqrZD3KlSPEzFWZ1bQemWABeBmLXZBIvgKrLsJaIsI4StFCzt
 garIBmBb/6KYDSkKo9zb4W0/EkBvMLXyIJrTAJu/i1mQnkVpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lH5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVG0O17B2QVs
 sYTIXMANRuqhMWXwfGCH7wEasQLdKEHPas5k1Q5lXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NvuQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2bGSx3qkAd16+LuQxtFDwwTM91IvCDoLbGun/um3lxKBYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS6hyLjKzd4A+bB20NZj9HdNEi8sQxQFQC1
 VKXntWvGT1mtpWUT26Q8vGfqjbaETcRBX8PY2kDVwRty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqY2O76T+FnGh3epucLPRwtsvgHPBDv9tEV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:3Vsgq6ypLVOgNCN8FOVnKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2x4Uh37D30XklZqvoJhiKobwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76521717"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFsr+NfTVuS2k9nqtL5RE4vg4yaIcJX2aJbYKN054oRKX8/lDMJYARJ1JFTnEqMRW6Umi0aomC5W6yW7pREyWVknyg5ABGezLxFccf5ad8pmiQwf2QHjgy6x8xbxBmqtaN3IBHVK1A3y+MCg5R0Vphf6fayhmcNdG3qtoIBRzm8aaDdPk29EIIcHRUXwKrsbYT9bzCoe4e082SZb8lOi0M1nyjLuz3MAhtjL7VmZh97ZB78pgxeLRk1M1eK5h1bOFkXi3AriMztkJSAWYRlUMkNoyr9rxoO5eu25+yLAAB721Xg5e9ICUzs0S+SZjuZ8hMyIwYvxdyQQV04QC78HCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo4v3tCyTo7UsiCgD6FlMYvgg1umXOt+HzjEdqsAhXw=;
 b=Eyeiilu2TiJJqVKnytSICwx07g9hWP1Q2q0I6B3+/77t+lHrC9CSPSk8wfk/KxV7D+ucYPG1B2aOBr3vEWPe9rtmV5Vk6jrnwSKGT2JdkQ/gK7CFlU/qOONNtaDKxo1jrl6oxymMdTPi4lgakBxvbEGwllkRiUwnbWyZE+iCJfaRpSOHUMOWhDhT6RS9B8J9KN24SnODNSagUavlxDJMaz5vpqqDAibheHvfZ81o0KaJAEcbbMlPqsMFk7jJSgQin0IhlHMC9r6xee/faMa5Edd5IvZMfA1yuiLw67IUd5HaNA1kJrCv6SMdQe+tdeoh4xouOlGyaogA69jI+wbR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo4v3tCyTo7UsiCgD6FlMYvgg1umXOt+HzjEdqsAhXw=;
 b=IOWPkxWnfi+oOaKLbJPpnGXKhreP00Ydky1VYrzqBedyYD8Bnb5rJMMdVHoK95bGNEe4aCcdvwV5sQ9mkF4nJXLRq+TsLCPh3Jczr0PPXyaJxj164b2ZFeRrVkK4iEiVBLIJXC5AP8Ar6MrmkahMG7XhU97YgsdpA0HYeNg9Sf0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Edwin
 Torok <edvin.torok@citrix.com>
Subject: Re: [PATCH v2] x86/msr: fix X2APIC_LAST
Thread-Topic: [PATCH v2] x86/msr: fix X2APIC_LAST
Thread-Index: AQHYoQRqcpYxNv8GZ0++T/cX45qn262Qx/AAgAACuoCAAAFdAIABQRAA
Date: Wed, 27 Jul 2022 10:56:47 +0000
Message-ID: <229f6385-0078-978c-41ac-b321b31fe34e@citrix.com>
References:
 <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
 <3e5ceee7-533b-1cae-262e-b05b5b22692b@suse.com>
 <3b23d5a1-4b49-6c12-2539-dcd1bb2de735@citrix.com>
 <83c1b506-27d5-19e0-89b0-a6a27b4e5535@suse.com>
In-Reply-To: <83c1b506-27d5-19e0-89b0-a6a27b4e5535@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f2b63f9-08bb-48ed-52a7-08da6fbeb378
x-ms-traffictypediagnostic: SA1PR03MB6562:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hrmGaik/4QM+rfnm/OmXpTa+vRZLCtFPbX1uoFkDE2hTger1NxHuinR9GSJJFOQYLuHjAKTsB70eqZuBMG6xlrN2mWghiv0W6F+JNAtBjQowvDIyjpRfyyYZvwr6ARXzrXnDy1yC+YXC2FrW7k18e0bWzRw09p7HLla2q5R2RHJFzuNCHpXfJAZAY4gbjUn6NnrCo128DgxWJ9lqMMxXnezTypzeXFYZZaLIFB8UBSFe9dGBlsFly6W6YTCWfxjWIaTwV4dPQqVUiijIuHIwbM3jz9uGTSxeR6ejYZzTfLS+mlDSzBmQEux7nUFxe1ZzERLRGd2MvFWdoZDSrYHCwq9Okx+dcBM6BsNtrbEDj5w8FX6HvGlshbAgyyBsX0/OrUEHNzvB4/hQLdN6XJwChWvNvIwX/yLN0BGTQwlrfaR9Bd3GxrVOwP8lgMo4aOv1h60137QRxmsUpINedRmWaRMAbq5RPfEBkevUq5tU2Egx8eIHM/dhzK8Fw5ysnCYp3yG201srvpPjSbkeIz64I4KUfscw0jh89x2ZVqlJ+9LrSsquo3r9ys0X3F4sW55psxhx7XsBpe+/e+9GDuD0fz93jrmx59WVLhWWMsmEDdU2BspS9qJ9R5TxxhFbOkBnaQcyLy4NLFrbbzyDd+7PjLgSneh40eik6mhfLTMT83xyV81iKH13hh9Y9ImeusNWuw2ABhvfUbSIrcsUKb048Rxu++B8oEYyleO82T7Vp2jLGdueGP1p7r8vFSdsICQYlRM1s5fZiOxIZeuQiU16na9mzvWDqXmmGfYjrDLChljqWXotfg5L0nElfA9lbA4AMagPg4hFs4EweBUFcOSvMyMxqDcF30+irNhSqy/2AbcFvExSCaz/OMZvZvtoOU0V
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(36756003)(86362001)(2616005)(8936002)(31686004)(478600001)(54906003)(91956017)(5660300002)(76116006)(66556008)(71200400001)(6486002)(8676002)(64756008)(66946007)(66476007)(4326008)(66446008)(6916009)(53546011)(41300700001)(122000001)(83380400001)(6506007)(107886003)(6512007)(186003)(38100700002)(31696002)(26005)(82960400001)(316002)(2906002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YklieEcvdE10Tm9jdlZQby9DRVc0YmtybEhtY2lHSmMva1JWa3hhL3Rrekt3?=
 =?utf-8?B?M2VpeEw2SGphRjNYbGV6L0ZMOUErczBxcFNFT3MyZ0Zwckk1ZE04M3NZRWc4?=
 =?utf-8?B?Sm5JSzRsNU9ZRUd2RFliUHFwMThxQm51UzQ0a3c5RGRHVkNmV24zaWNjKy9R?=
 =?utf-8?B?ZjFqVUMya05uYVU4YVIzT25FY3IySzBvVXBRcmljY1BJOC8rOU9oTGtQU0o0?=
 =?utf-8?B?UjRVa0laV1pLTHkvSmJZWlYzVXFqdk93VmxVNTZSTGtLUU5WemZrSGRBQXJ2?=
 =?utf-8?B?M2JyUzQ3MktrRTRlMWU5aXpJeitacXd5Zm1BeExmM3RwRlZNOVREb2l1NElV?=
 =?utf-8?B?Q3BXMjgzL2draHJGTk9HdHJ3dEhDYzhtWjZkWk84YllTMSt0V2E1SW9zVFNn?=
 =?utf-8?B?VEMrRkN0REMyblpMeE43dUh2OTJPTUtQbE9vTjc2Vmx0eUQ5MWlLTERzNnJL?=
 =?utf-8?B?Rmp2ZWd1eEdKMlpvbklOZURJMTZ3dVF1MnE1TzNwR3RwU2VJNFRVOE1rUjZo?=
 =?utf-8?B?V2hmUWVQM3k5QUsrL0tDSFQwU2hsa0swdGlNVHRqS3V4OE1lRG1paEdqS0p2?=
 =?utf-8?B?Nk9CL1FvV2p5dzI3K3oxb1lMZU81ZG5WNFBsMUZLVEdIMEpGMDl5S0FuY2Zy?=
 =?utf-8?B?L3pqa1BGNlBQZWVUMXd6ZFMzZzZrNGF5RFozVXAzMUViaHowY2xLamZhakp1?=
 =?utf-8?B?cE9CaUdLaEFwS01SU1FvU0h6bHJZR0h1OHFCdDlpODdNZm9WK1pMd2xQYWQw?=
 =?utf-8?B?SHpaM1pJNS9xSXhrR29penJaYmlzOXZTdEJnTFhiYkZ3Rzd0VXJQbHlHL3pE?=
 =?utf-8?B?NHFDZEFqRTBZM3lxRUZ1dXl4SStNZ0NwOTBxejNRakZUTjl2SmFTM0QyUHhZ?=
 =?utf-8?B?SnhoQ3NzdXlHeU5VUnhyVHZNdFZXTDBUeDFmV2I0OXVLMlpYMEFvdmJBQUVZ?=
 =?utf-8?B?R3orTC9rUk9TM3ZLdUFibVY3ajc2aWZKZGp0ZkpmeXgzd1Vna1kya2JvenF5?=
 =?utf-8?B?elJpZiszOXRVWHJ6K0FHdll2QUh3emtSN2xTc2hWTStjWFdoczRhaUtROUhu?=
 =?utf-8?B?M2hZU3FINGhab2FXd0dWdFVFbmNhRTYzMWpDOGdxbkxoTnFhQ2loa05XMi84?=
 =?utf-8?B?eFVhMDhsRVdlMzJGT3l5U0JvUEpPNlFjQlVlSU56VCtqWnQwQWZoRFo2WDdt?=
 =?utf-8?B?WjA3blpKRnFLRE1YMU91dE4vOEpzR1lqVGQySmNnZFdzc3RtdklWNjMvQkVM?=
 =?utf-8?B?d0RlQjUvSFpaUllvZnpSWEQ1WmM2TlZKUk5oRjRNck1HRWc4Vjl2SitFRmxK?=
 =?utf-8?B?RjJuWm5EdGEwekpoTXNzV25yeUpTTk1KZ2JwU20vWERFY2FFS3BzeVZ3Rlla?=
 =?utf-8?B?N2k5ek9XaEM4VGkxZ0YrYThPMjQxY2FkSHArNFZRc0pwL3hmc0h5N2JZYUF5?=
 =?utf-8?B?L1RNdy9NUUZQNGgrNUtPR3FSSENEd1F4Z0lFcFlVTmsrcEc4STRybHhJV0xk?=
 =?utf-8?B?T1NKRS9ISFVXWWk3UG9VZmJnY05rNDlMcFFBU002NTRKZnpaV2wrQXB3NXgw?=
 =?utf-8?B?MzdQc1BLN1MxVTZ5N2FRSG5lU0VMMlpWNG1Jbm56anNXOU5KaldEeTd1Ny9G?=
 =?utf-8?B?d0tpbEVtZlplSkpaeWdOb1RBSkQ1SHZYaFFub0xEYnJ3Q1FFZkp2T3hQU0Zy?=
 =?utf-8?B?cTVZUURQem4yeXZDakxyOUljRUcxZ0FMRDNqT3Jyam5GL1lobDZDT29YN0hh?=
 =?utf-8?B?TzRGM3dFdVRaWHNLWFpyMFd3cE1hWDIxa3J4SDBTWXVSRmhiRFY2S3FHVEZU?=
 =?utf-8?B?eUxsaHdqT2tGZlp4U1drWmszZkR2MmtleXdNREIyaVljY3BVT2V1NTBEZFVC?=
 =?utf-8?B?UUJtR3JmbEtOSlMwbVN4VTVRaUJqSEtpVFlic0d5eVVTRy9abW5NY1dZVE1v?=
 =?utf-8?B?d1NvYmxOKzVvVkRudGxQYnlNdUtHQVVPZTdNQjdZWnJKSS96cW9rSXZ1MXNa?=
 =?utf-8?B?M01IdTBDMW1qQU5OVTlHTVFhM0lLaDNETVpVclZWWDFNeHZ1RGRyb3dQTEo3?=
 =?utf-8?B?QkdzNkw2QVFIa2JxRUVSbE1STDhwSS9IeFAxaHJneXJobytPM2FYMDUyMVRK?=
 =?utf-8?Q?Ny5BK1QVptKMYoeH/xdGt3i7k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB7039F6DCE2D14B84B6A6B391DE75AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2b63f9-08bb-48ed-52a7-08da6fbeb378
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 10:56:47.1510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0RfmkkQRNgcbY0Gm2n1ovbJNAM4aAJpY6C9LyH7JNTqmBoMvuVmKikxj9IcBJvR1T9ohrLD3Qbj8nzpOYb485/npkX9pzhGt0keH3780tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6562

T24gMjYvMDcvMjAyMiAxNjo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA3LjIwMjIg
MTc6NDIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNi8wNy8yMDIyIDE2OjMzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNi4wNy4yMDIyIDE3OjI4LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4+PiBUaGUgbGF0ZXN0IEludGVsIG1hbnVhbCBub3cgc2F5cyB0aGUgWDJBUElDIHJl
c2VydmVkIHJhbmdlIGlzIG9ubHkNCj4+Pj4gMHg4MDAgdG8gMHg4ZmYgKE5PVCAweGJmZikuDQo+
Pj4+IFRoaXMgY2hhbmdlZCBiZXR3ZWVuIFNETSA2OCAoTm92IDIwMTgpIGFuZCBTRE0gNjkgKEph
biAyMDE5KS4NCj4+Pj4gVGhlIEFNRCBtYW51YWwgZG9jdW1lbnRzIDB4ODAwLTB4OGZmIHRvby4N
Cj4+Pj4NCj4+Pj4gVGhlcmUgYXJlIG5vbi1YMkFQSUMgTVNScyBpbiB0aGUgMHg5MDAtMHhiZmYg
cmFuZ2Ugbm93Og0KPj4+PiBlLmcuIDB4OTgxIGlzIElBMzJfVE1FX0NBUEFCSUxJVFksIGFuIGFy
Y2hpdGVjdHVyYWwgTVNSLg0KPj4+Pg0KPj4+PiBUaGUgbmV3IE1TUiBpbiB0aGlzIHJhbmdlIGFw
cGVhcnMgdG8gaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSWNlbGFrZSwNCj4+Pj4gc28gdGhpcyBj
b21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gWGVuIHZlcnNpb25zIHN1cHBvcnRpbmcgSWNl
bGFrZS4NCj4+Pj4NCj4+Pj4gQmFja3BvcnQ6IDQuMTMrDQo+Pj4gRkFPRCBuZXZlcnRoZWxlc3Mg
aXQnbGwgYmUgYXBwbGllZCBvbmx5IGJhY2sgdG8gNC4xNS4NCj4+IEl0IHNob3VsZG4ndCBnbyBi
YWNrIGJlZm9yZSA0LjE2LCBiZWNhdXNlIG90aGVyd2lzZSB3ZSBzdGFydCBleHBvc2luZyBhDQo+
PiBidW5jaCBvZiBNU1JzIChpbmNsdWRpbmcgdW5kb2N1bWVudGVkIG9uZXMgb24gSGFzd2VsbC9C
cm9hZHdlbGwpIHdoaWNoDQo+PiB3ZXJlIHByZXZpb3VzbHkgZGlzYWxsb3dlZC4NCj4gSG1tLCBJ
J20gY29uZnVzZWQgLSBob3cgd291bGQgdGhlIGxpbWl0aW5nIG9mIHRoaXMgcmFuZ2UgY2F1c2Ug
bW9yZQ0KPiBNU1JzIHRvIGJlIGV4cG9zZWQgaW4gNC4xNT8NCg0KTXkgbWlzdGFrZS7CoCBJIGZv
cmdvdCB3aGVuIHdlIGNoYW5nZWQgdGhlIE1TUiBkZWZhdWx0IHJlYWRhYmlsaXR5Lg0KDQpUaGlz
IHNob3VsZCBnbyBiYWNrIHRvIDQuMTUuDQoNCn5BbmRyZXcNCg==

