Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162775A962E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396546.636718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTisj-000814-HU; Thu, 01 Sep 2022 12:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396546.636718; Thu, 01 Sep 2022 12:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTisj-0007yR-Ed; Thu, 01 Sep 2022 12:01:13 +0000
Received: by outflank-mailman (input) for mailman id 396546;
 Thu, 01 Sep 2022 12:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LpUB=ZE=citrix.com=prvs=236e65341=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oTish-0007y9-L7
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:01:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c37f19ef-29ed-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 14:01:09 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Sep 2022 08:01:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4921.namprd03.prod.outlook.com (2603:10b6:5:1ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 12:01:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 12:01:04 +0000
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
X-Inumbo-ID: c37f19ef-29ed-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662033669;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2qQyrUN58VB4D7oh6mQvBrz96Uv4XuRbLDDol7BAjOE=;
  b=EwkemrFRpA1fdg1J2A+v3IdaZXapWPIZlJNKrxToZTwCtQebg0GQhE/o
   Mm203UojEw9+lH3BT0xRNC2cA5tI1/W+EK/6ZWhgNmasgOBTKUMdNDsy+
   nz3OIU22GYDSaD/n7EUVXDHdaDjY6EeYzbdaPOR9JmJXruGQBvxBcPP3x
   w=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 79549875
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qPAhfqrILtAaE4U+GW+m6jt7WO1eBmLRZBIvgKrLsJaIsI4StFCzt
 garIBnSb/zcZmLxfI0iPNi280MPvMKEn4BmGQRlrng0ES1GopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WtB5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU++/1bWWhM1
 sA1dgBQfyyqmu+d8O6kH7wEasQLdKEHPas5k1Q5l3TzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NouQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2b6SwXKrB996+LuQpttAiXLIn3UpMhBRUFfi/Kef2xbjcocKQ
 6AT0m90xUQoz2SpQcP6RAaQu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBCTJmv7KUTnac3qyJtj70Mi8QRUcYeC4KQA0Kpdbqp6kyiA7CSpBoF6vdpt//FCz0w
 juKhDMjnLhVhskOv5hX5njCijOo45LPHgg841yNWnr/t1wjIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF4n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:LuQQJKCCkL9vm1PlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,280,1654574400"; 
   d="scan'208";a="79549875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiZ9aPvoQ6+2BR85nE1wfJgPjAUrXDjo14DrUG/zfV4liscqKFo+wG+pW/LsvKDqaO44Zfeb2lkQSOgoCehGmBLV3mEIJqgRDPrD+73ndbcUUnP+jpR3UfNe9WJuLMlkYQ0+2H1dReiXMj88PmEcklwhr+rNhQfESXtGnIRFAEcX2qSnb4Zb/up3hs0p0+sIJ30SeEZgdvUy712bHo+Bh/tL7ufUrZiHrd6mCuxMpPqd58vydxXG/rVy1wtLaMtJOL8P7tfO3tSQ5j12gc6AbB1WAjJYaWOJp9kSI08JV3VIFo1pNC1169AkWPnfOhT3jwxU90lA1cUA5t1RItDZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qQyrUN58VB4D7oh6mQvBrz96Uv4XuRbLDDol7BAjOE=;
 b=RwdWYcx8Dtdt3oHFfFcKRMe2D/HdfQd2CL662a3axKNmiw/oe5U7gNdKc7LH0IUntMQ4u/Fx+cKVIN93JNORSQHpHjfTLga0E+Q9m7hxNxEhgXY+y+epjMx2LblmUapoGZOmbmvngCd4RSPNm1Li5Dw660QlO/NIdP1d3eZa44UNpZRycx+uXuJltx1uhv3gbwz/TE6lzcEiRZp1Fys+8b7pBnbWO7gGoCyfKuz6oDDKVs6beQ4bDYM+aKtZ5uMBghYtAZtQgHka90uOh3bPzJf876wHGSwBtMmbUZBF8Hzf6Wl5nMHx5ydgd1FA7Ih51JSbfS8EY8bIyHx6HE/iWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qQyrUN58VB4D7oh6mQvBrz96Uv4XuRbLDDol7BAjOE=;
 b=uDQeJHBNuxyIo1bDqTBKIm+eV9I5LtsZcrl24lu7FwLe/b1D4wNVjTKW/byXeJ3+kleDHqrap/Nvn4gXxG0eQou5/19SnfD1T3fQ8uWE3JDc3U8EfKIDWGzMuwkLfk2IA2lRwflTacKWNfRCbsaUQ3fd0OhEgiDZF0487LoNtgA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Thread-Topic: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Thread-Index: AQHYsVjUGULgew6mPUO+TQcIZn3wJK3JthgAgAB6fQCAAGG9gA==
Date: Thu, 1 Sep 2022 12:01:04 +0000
Message-ID: <bb4114b7-0376-677b-5176-a4d4d1ef750d@citrix.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
 <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
 <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
In-Reply-To: <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52858ee0-d662-4169-3572-08da8c11a57f
x-ms-traffictypediagnostic: DM6PR03MB4921:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Xs9siveC6n2oQTco/RAbk3n/+D2x53ymd05kTWNkZyRkVRAF/OpcDRNeGb/P6uNEjQM62S1aYQmhH0fOU8pmnwJcf5eolcFLAs7OHVQWUawuV8mj8hxJHXxaF98o/8EfvzYZuaVUMpPn1mJ3KZftPEtzIkriDkuuBt8EjkcjlMqR5YfvXdA7iVkoH9dzGcBfR8w45zNy1tErYqTXI6lQSSi49TU1QovMHIIChJF0xbsRGNA/EzG21tEIGOIA+f+ugZqveDaPKyagI2n5mX8j7j9+3bjn0xgXcuHDqkj5/Zr5Z4S2EhL7MYYRKsy+UJ7ab5aU3agQwZu5mNMxiSuqo7OlQZgLdJ+TGnWU/EwGPSa7/CE8fI41S7sJgIt/796FlefL1tZllMDMt0hlELpCpXFMGkj24Aeev33QnhfHhMSBc8W4MX/Lfn1x+1Bld5BdA6x/sfftbXnHBvwUKcs5ZHpEUjEjMVQNlVxCdUCpL0PGyvQ9Rl7fwA3hSIoRw0lXX3lgs5YwEWaiXA3iPOvaaCj5dDEebMn2p0tIhKjJfRwnrq3gJrBHbJdtZjaJoUn1sLxHhknqHlKFaaBuzZCnGmLaed3qdOiBNV9aYAdJJElm56//Ku3oQmfUAQBdggs/i0qo34TqE8MANib3a8zHPK5nuoxbpBul/xuOKqNP1brsRwGw08iBDK/8ov+FYUo+6uckP7li8Y6n4kZRotWUMpbnTkYAbYp0gW7ors8g2mudztQ6OCAWni+rE6R4eGfELQH6DfxL2IQw9icOvfM05CsYShwx/n6zH6JWR9GYJh59Uccwd15zbeVzBukThT80CUTWzY3GFTXY6XHTGnsRIQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(31696002)(2906002)(316002)(53546011)(86362001)(6506007)(83380400001)(71200400001)(110136005)(54906003)(8936002)(38070700005)(8676002)(82960400001)(76116006)(4326008)(6512007)(122000001)(66556008)(66476007)(91956017)(41300700001)(6486002)(186003)(26005)(38100700002)(31686004)(36756003)(5660300002)(66446008)(66946007)(64756008)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHdFN2RtN2VKdngvMUNsZmtZdDkxa3BYTXVUTjFZd0tsRUw0NEV6TUpkY0Zu?=
 =?utf-8?B?T3pMUnZRVjk3UHMzd2ttdTd6R283L2E4Tkd2UG5qazhtaXk5cXpDajQzVHZJ?=
 =?utf-8?B?ODExY3lzSmlhMEllbUljQXVXNnR0d1FGanNZSEtpczlmSTdaMDlQV3ZLNHY1?=
 =?utf-8?B?TTVuR3ltRUV1NUVRamlVQmNyazNEcWhrWWFoT3dqL240Ni85akEyc0ZsU1Nz?=
 =?utf-8?B?NHFRWG1GZTcySmxlZE50UjlSdGhYKzhObWowemxQZlZHOU5yd2tBU09GbTBU?=
 =?utf-8?B?ZytKOWlIVnRmN2ZTd1RNd1dxSGMvcE41NDEzZTEvbUVhbnBKUW54M2Fjd2ZK?=
 =?utf-8?B?NUFFeWtBeURnZHh6ZTBUU3lLTStPSEsxQlhKaFg0dmNDdHhEbzNMNjg3OFl6?=
 =?utf-8?B?ekw3YnN6a2pQRWY5THpvZGZtWjU0VzQ2R1ViTWFOd3NXSHN0RWNZWnFuNDl6?=
 =?utf-8?B?Y0YxeUVkdXhTakxKNmVrcm1OaXhzeVIra0h6bGRsZm84aXNqTm8rZ2owNm1C?=
 =?utf-8?B?eC9URkhQVFF1QjdnaDJXSU1EYWdTYnZkZGxJQkR6QzR3UnhaZTkwVUJWdEVs?=
 =?utf-8?B?d1JVWmJzNnUxU2dVaEtCMTB3MXhPMVZsdDRWeFdDVy9rRVhoMi9sZ3lTYzRs?=
 =?utf-8?B?RnZEdHFITERsTHdVOXN6SEhUMkdjWXBHK3o0N3NRN2R6K0FpS0grNTNHWW92?=
 =?utf-8?B?WmZMcFlRaW9wN21Nb2xodHFRRkRyQWwybUlUM1NNOSt4QnNKeGNUWFR2d0Zp?=
 =?utf-8?B?MVRiaEpUeXVvbDYrdTkvWDJZTzBQU3dENHFkMlRMaVViTU43Zk9vaGlxeDhO?=
 =?utf-8?B?d0RHQTJLeDJaNWZTMnV0Q0ZsY0tvSDBmSzVJNGhmUGQ4V0c0ZWJhTFcrczFy?=
 =?utf-8?B?VnNxTzRGNzk5NzR0TzhEUGxIVVl6aklFSzlnSnB0NFp2aTU4SGtyQ1RuNzIr?=
 =?utf-8?B?UkNkVXV0MUxiNnZiVEFiTndMSkM4RkVPZGVudmpNOVA2OStzejNONVRCMnRV?=
 =?utf-8?B?NEtmRlVvZjBvc1ZTck5BQjRJMEt5WHY1cndEdExpYzNJUnlydXhjWmdkM2I0?=
 =?utf-8?B?ZEdUSDF0ZWNBU1QwbHRpU2RJL3hOQWNIT204VGVKRUFLZzNKbjdYUjR6QWl3?=
 =?utf-8?B?NW44WnlOK2FxWGFOMGxXTmd1SFQvUnVnUGNSY2dJK2IxdUdYZWREVExGcElH?=
 =?utf-8?B?Z21OZUFzbUdEa2dXQjI2aGRTdU1tOVhnVm9oUCs1U1dMdTMyVGJGdityeTNw?=
 =?utf-8?B?MHhtblNCN2tXQytwVm53amVwenFzQ1BrSTRWZHlhSlFOdTh4S1YxWHZ6eUkr?=
 =?utf-8?B?ZDlWNnNvSlR6NHd0TjBmMVZjVjlPV2R5aWVZd1FaY2V3U0pQOG91M2ZDVi9j?=
 =?utf-8?B?bUNacmt2Q2Q5dG9ka0p6ZUN5a3JTZ1FEaDNXdE9GUWdUczZFdHNMYVNXakk1?=
 =?utf-8?B?Q1VDODYzNXNFRWYyZHJBMXJ2UnNiakU1WmQxakRrMkNlK1RxRzhWa2QxZy9k?=
 =?utf-8?B?Q0JsVmcveXU3NXVSNitrNTJzWVlCOGFZSHorM2tjditSanVEMm1YVms0anFD?=
 =?utf-8?B?NVlxZjRTVFYwcis3QTMvV21sQ3lhc1pFUzQ5MHJOa0tTY25JejN0WDViOEF4?=
 =?utf-8?B?WFdmcDlwbkY1SVg1MG92S3Ira0lBYWJXNktjc0N6QUdkb1hSaXNvK200cEx3?=
 =?utf-8?B?M0FNQnJiTHQvMjhMZTVKYUlSdjZJVlNkZjc3WEMzZ1BKQVpmdzRJaG1yUys2?=
 =?utf-8?B?R09WWVhzZGtYWXFHc0lNdkFkcXhhbUtGNEJHem1QM09VYll1bDI3SGJIdzFu?=
 =?utf-8?B?UUJVRUpCOGVsOUZ2VE5wcFRGRWcyVE9zdVBKYURUd0FzRnVhbFNVaGVjUkZ5?=
 =?utf-8?B?enE4aDJTTXBnTXc5TVgrTzVGQzhTYkZ4Nm9FNjE0UGdkclJHVXJBRGUwZnVI?=
 =?utf-8?B?Y0R2WUtqRCszQkt5NjlVSVhUU2RmbERtaGJhTlZjMTdYK2daSHVMa3Brc3pJ?=
 =?utf-8?B?aTJmZ0psRUgxalk4TlcwdjYyRGhULzI3cENBM0pkZ3VZQmRhTU4vZDBKRUdC?=
 =?utf-8?B?NHZmN0s4RXdTZzc4dUpMaEhnUy9yVU1kNm5kWjY1ZVEvcStTMUh3N1QySGNW?=
 =?utf-8?Q?zHZEodhpaWA6MO412lHr1YLL5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA254FF9D1FD864186B8DC03AED902DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52858ee0-d662-4169-3572-08da8c11a57f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 12:01:04.4631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LVqRIMXNgzPMjsbw0a86NKNLdUBXZLcrGG9Tqe6W5OwzMISe3m1E+g7m0ZXA8ZW/71wEIuJFcFmtHWOWotIDT5b8wTJUvi6EXFxAgkcKJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4921

T24gMDEvMDkvMjAyMiAwNzoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDEuMDkuMjIg
MDA6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNi8wOC8yMDIyIDExOjEzLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOg0KPj4+IENwdSBjcHUgdW5wbHVnZ2luZyBpcyBjYWxsaW5nIHNjaGVk
dWxlX2NwdV9ybSgpIHZpYSBzdG9wX21hY2hpbmVfcnVuKCkNCj4+DQo+PiBDcHUgY3B1Lg0KPj4N
Cj4+PiB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQsIHRodXMgYW55IG1lbW9yeSBhbGxvY2F0aW9u
IG9yIGZyZWVpbmcgbXVzdA0KPj4+IGJlIGF2b2lkZWQuDQo+Pj4NCj4+PiBTaW5jZSBjb21taXQg
NTA0N2NkMWQ1ZGVhICgieGVuL2NvbW1vbjogVXNlIGVuaGFuY2VkDQo+Pj4gQVNTRVJUX0FMTE9D
X0NPTlRFWFQgaW4geG1hbGxvYygpIikgdGhpcyByZXN0cmljdGlvbiBpcyBiZWluZyBlbmZvcmNl
ZA0KPj4+IHZpYSBhbiBhc3NlcnRpb24sIHdoaWNoIHdpbGwgbm93IGZhaWwuDQo+Pj4NCj4+PiBC
ZWZvcmUgdGhhdCBjb21taXQgY3B1IHVucGx1Z2dpbmcgaW4gbm9ybWFsIGNvbmZpZ3VyYXRpb25z
IHdhcyB3b3JraW5nDQo+Pj4ganVzdCBieSBjaGFuY2UgYXMgb25seSB0aGUgY3B1IHBlcmZvcm1p
bmcgc2NoZWR1bGVfY3B1X3JtKCkgd2FzIGRvaW5nDQo+Pj4gYWN0aXZlIHdvcmsuIFdpdGggY29y
ZSBzY2hlZHVsaW5nIGVuYWJsZWQsIGhvd2V2ZXIsIGZhaWx1cmVzIGNvdWxkDQo+Pj4gcmVzdWx0
IGZyb20gbWVtb3J5IGFsbG9jYXRpb25zIG5vdCBiZWluZyBwcm9wZXJseSBwcm9wYWdhdGVkIHRv
IG90aGVyDQo+Pj4gY3B1cycgVExCcy4NCj4+DQo+PiBUaGlzIGlzbid0IGFjY3VyYXRlLCBpcyBp
dD/CoCBUaGUgcHJvYmxlbSB3aXRoIGluaXRpYXRpbmcgYSBUTEIgZmx1c2gNCj4+IHdpdGggSVJR
cyBkaXNhYmxlZCBpcyB0aGF0IHlvdSBjYW4gZGVhZGxvY2sgYWdhaW5zdCBhIHJlbW90ZSBDUFUg
d2hpY2gNCj4+IGlzIHdhaXRpbmcgZm9yIHlvdSB0byBlbmFibGUgSVJRcyBmaXJzdCB0byB0YWtl
IGEgVExCIGZsdXNoIElQSS4NCj4NCj4gQXMgbG9uZyBhcyBvbmx5IG9uZSBjcHUgaXMgdHJ5aW5n
IHRvIGFsbG9jYXRlL2ZyZWUgbWVtb3J5IGR1cmluZyB0aGUNCj4gc3RvcF9tYWNoaW5lX3J1bigp
IGFjdGlvbiB0aGUgZGVhZGxvY2sgd29uJ3QgaGFwcGVuLg0KPg0KPj4gSG93IGRvZXMgYSBtZW1v
cnkgYWxsb2NhdGlvbiBvdXQgb2YgdGhlIHhlbmhlYXAgcmVzdWx0IGluIGEgVExCIGZsdXNoPw0K
Pj4gRXZlbiB3aXRoIHNwbGl0IGhlYXBzLCB5b3UncmUgb25seSBwb3RlbnRpYWxseSBhbGxvY2F0
aW5nIGludG8gYSBuZXcNCj4+IHNsb3Qgd2hpY2ggd2FzIHVudXNlZC4uLg0KPg0KPiBZZWFoLCB5
b3UgYXJlIHJpZ2h0LiBUaGUgbWFpbiBwcm9ibGVtIHdvdWxkIG9jY3VyIG9ubHkgd2hlbiBhIHZp
cnR1YWwNCj4gYWRkcmVzcyBpcyBjaGFuZ2VkIHRvIHBvaW50IGF0IGFub3RoZXIgcGh5c2ljYWwg
YWRkcmVzcywgd2hpY2ggc2hvdWxkIGJlDQo+IHF1aXRlIHVubGlrZWx5Lg0KPg0KPiBJIGNhbiBk
cm9wIHRoYXQgcGFyYWdyYXBoLCBhcyBpdCBkb2Vzbid0IHJlYWxseSBoZWxwLg0KDQpZZWFoLCBJ
IHRoaW5rIHRoYXQgd291bGQgYmUgYmVzdC4NCg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9zY2hlZC9jcHVwb29sLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYw0KPj4+IGlu
ZGV4IDU4ZTA4MmViNGMuLjI1MDY4NjFlNGYgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZC9jcHVwb29sLmMNCj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYw0KPj4+
IEBAIC00MTEsMjIgKzQxMSwyOCBAQCBpbnQgY3B1cG9vbF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9t
YWluICpkLA0KPj4+IHN0cnVjdCBjcHVwb29sICpjKQ0KPj4+IMKgIH0NCj4+PiDCoCDCoCAvKiBV
cGRhdGUgYWZmaW5pdGllcyBvZiBhbGwgZG9tYWlucyBpbiBhIGNwdXBvb2wuICovDQo+Pj4gLXN0
YXRpYyB2b2lkIGNwdXBvb2xfdXBkYXRlX25vZGVfYWZmaW5pdHkoY29uc3Qgc3RydWN0IGNwdXBv
b2wgKmMpDQo+Pj4gK3N0YXRpYyB2b2lkIGNwdXBvb2xfdXBkYXRlX25vZGVfYWZmaW5pdHkoY29u
c3Qgc3RydWN0IGNwdXBvb2wgKmMsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBhZmZpbml0eV9tYXNrcyAqbWFza3MpDQo+Pj4gwqAgew0KPj4+IC3CoMKgwqAgc3RydWN0IGFm
ZmluaXR5X21hc2tzIG1hc2tzOw0KPj4+ICvCoMKgwqAgc3RydWN0IGFmZmluaXR5X21hc2tzIGxv
Y2FsX21hc2tzOw0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGRvbWFpbiAqZDsNCj4+PiDCoCAtwqDC
oMKgIGlmICggIXVwZGF0ZV9ub2RlX2FmZl9hbGxvYygmbWFza3MpICkNCj4+PiAtwqDCoMKgwqDC
oMKgwqAgcmV0dXJuOw0KPj4+ICvCoMKgwqAgaWYgKCAhbWFza3MgKQ0KPj4+ICvCoMKgwqAgew0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoICF1cGRhdGVfbm9kZV9hZmZfYWxsb2MoJmxvY2FsX21h
c2tzKSApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+ICvCoMKgwqDC
oMKgwqDCoCBtYXNrcyA9ICZsb2NhbF9tYXNrczsNCj4+PiArwqDCoMKgIH0NCj4+PiDCoCDCoMKg
wqDCoMKgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsNCj4+PiDCoCDCoMKgwqDC
oMKgIGZvcl9lYWNoX2RvbWFpbl9pbl9jcHVwb29sKGQsIGMpDQo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGRvbWFpbl91cGRhdGVfbm9kZV9hZmYoZCwgJm1hc2tzKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
ZG9tYWluX3VwZGF0ZV9ub2RlX2FmZihkLCBtYXNrcyk7DQo+Pj4gwqAgwqDCoMKgwqDCoCByY3Vf
cmVhZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsNCj4+PiDCoCAtwqDCoMKgIHVwZGF0ZV9u
b2RlX2FmZl9mcmVlKCZtYXNrcyk7DQo+Pj4gK8KgwqDCoCBpZiAoIG1hc2tzID09ICZsb2NhbF9t
YXNrcyApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHVwZGF0ZV9ub2RlX2FmZl9mcmVlKG1hc2tzKTsN
Cj4+PiDCoCB9DQo+Pj4gwqAgwqAgLyoNCj4+DQo+PiBXaHkgZG8gd2UgbmVlZCB0aGlzIGF0IGFs
bD/CoCBkb21haW5fdXBkYXRlX25vZGVfYWZmKCkgYWxyZWFkeSBrbm93cyB3aGF0DQo+PiB0byBk
byB3aGVuIHBhc3NlZCBOVUxMLCBzbyB0aGlzIHNlZW1zIGxpa2UgYW4gYXdmdWxseSBjb21wbGlj
YXRlZCBuby1vcC4NCj4NCj4gWW91IGRvIHJlYWxpemUgdGhhdCB1cGRhdGVfbm9kZV9hZmZfZnJl
ZSgpIHdpbGwgZG8gc29tZXRoaW5nIGluIGNhc2UNCj4gbWFza3MNCj4gd2FzIGluaXRpYWxseSBO
VUxMPw0KDQpCeSAidGhpcyIsIEkgbWVhbnQgdGhlIGVudGlyZSBodW5rLCBub3QganVzdCB0aGUg
ZmluYWwgaWYoKS4NCg0KV2hhdCBpcyB3cm9uZyB3aXRoIHBhc3NpbmcgdGhlIChwb3NzaWJseSBO
VUxMKSBtYXNrcyBwb2ludGVyIHN0cmFpZ2h0DQpkb3duIGludG8gZG9tYWluX3VwZGF0ZV9ub2Rl
X2FmZigpIGFuZCByZW1vdmluZyBhbGwgdGhlIG1lbW9yeQ0KYWxsb2NhdGlvbiBpbiB0aGlzIGZ1
bmN0aW9uPw0KDQpCdXQgSSd2ZSBhbHNvIGFuc3dlcmVkIHRoYXQgYnkgbG9va2luZyBtb3JlIGNs
ZWFybHkuwqAgSXQncyBhYm91dCBub3QNCnJlcGVhdGluZyB0aGUgbWVtb3J5IGFsbG9jYXRpb25z
L2ZyZWVpbmcgZm9yIGVhY2ggZG9tYWluIGluIHRoZSBwb29sLsKgDQpXaGljaCBkb2VzIG1ha2Ug
c2Vuc2UgYXMgdGhpcyBpcyBhIHNsb3cgcGF0aCBhbHJlYWR5LCBidXQgdGhlIGNvbXBsZXhpdHkN
CmhlcmUgb2YgaGF2aW5nIGNvbmRpdGlvbmFsbHkgYWxsb2NhdGVkIG1hc2tzIGlzIGZhciBmcm9t
IHNpbXBsZS4NCg0KPg0KPj4NCj4+PiBAQCAtMTAwOCwxMCArMTAxNiwyMSBAQCBzdGF0aWMgaW50
IGNmX2NoZWNrIGNwdV9jYWxsYmFjaygNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsNCj4+PiDCoMKgwqDCoMKgIGludCByYyA9
IDA7DQo+Pj4gK8KgwqDCoCBzdGF0aWMgc3RydWN0IGNwdV9ybV9kYXRhICptZW07DQo+Pj4gwqAg
wqDCoMKgwqDCoCBzd2l0Y2ggKCBhY3Rpb24gKQ0KPj4+IMKgwqDCoMKgwqAgew0KPj4+IMKgwqDC
oMKgwqAgY2FzZSBDUFVfRE9XTl9GQUlMRUQ6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggc3lz
dGVtX3N0YXRlIDw9IFNZU19TVEFURV9hY3RpdmUgKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBtZW0gKQ0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHsNCj4+DQo+PiBTbywgdGhpcyBkb2VzIGNvbXBpbGUgKGFuZCBpbmRlZWQgSSd2
ZSB0ZXN0ZWQgdGhlIHJlc3VsdCksIGJ1dCBJIGNhbid0DQo+PiBzZWUgaG93IGl0IHNob3VsZC4N
Cj4+DQo+PiBtZW0gaXMgZ3VhcmFudGVlZCB0byBiZSB1bmluaXRpYWxpc2VkIGF0IHRoaXMgcG9p
bnQsIGFuZCAuLi4NCj4NCj4gLi4uIGl0IGlzIGRlZmluZWQgYXMgInN0YXRpYyIsIHNvIGl0IGlz
IGNsZWFybHkgTlVMTCBpbml0aWFsbHkuDQoNCk9oLCBzbyBpdCBpcy7CoCBUaGF0IGlzIGhpZGlu
ZyBwYXJ0aWN1bGFybHkgd2VsbCBpbiBwbGFpbiBzaWdodC4NCg0KQ2FuIGl0IHBsZWFzZSBiZSB0
aGlzOg0KDQpAQCAtMTAxNCw5ICsxMDE0LDEwIEBAIHZvaWQgY2ZfY2hlY2sgZHVtcF9ydW5xKHVu
c2lnbmVkIGNoYXIga2V5KQ0KwqBzdGF0aWMgaW50IGNmX2NoZWNrIGNwdV9jYWxsYmFjaygNCsKg
wqDCoMKgIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmZiLCB1bnNpZ25lZCBsb25nIGFjdGlvbiwg
dm9pZCAqaGNwdSkNCsKgew0KK8KgwqDCoCBzdGF0aWMgc3RydWN0IGNwdV9ybV9kYXRhICptZW07
IC8qIFByb3RlY3RlZCBieSBjcHVfYWRkX3JlbW92ZV9sb2NrICovDQorDQrCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsNCsKgwqDCoMKgIGludCByYyA9IDA7
DQotwqDCoMKgIHN0YXRpYyBzdHJ1Y3QgY3B1X3JtX2RhdGEgKm1lbTsNCsKgDQrCoMKgwqDCoCBz
d2l0Y2ggKCBhY3Rpb24gKQ0KwqDCoMKgwqAgew0KDQpXZSBhbHJlYWR5IHNwbGl0IHN0YXRpYyBh
bmQgbm9uLXN0YXRpYyB2YXJpYWJsZSBsaWtlIHRoaXMgZWxzZXdoZXJlIGZvcg0KY2xhcml0eSwg
YW5kIGlkZW50aWZ5aW5nIHRoZSBsb2NrIHdoaWNoIHByb3RlY3RzIHRoZSBkYXRhIGlzIHVzZWZ1
bCBmb3INCmFueW9uZSBjb21pbmcgdG8gdGhpcyBpbiB0aGUgZnV0dXJlLg0KDQp+QW5kcmV3DQoN
ClAuUy4gYXMgYW4gb2JzZXJ2YXRpb24sIHRoaXMgaXNuJ3Qgc2FmZSBmb3IgcGFyYWxsZWwgQVAg
Ym9vdGluZywgYnV0IEkNCmd1YXJhbnRlZSB0aGF0IHRoaXMgaXNuJ3QgdGhlIG9ubHkgZXhhbXBs
ZSB3aGljaCB3b3VsZCB3YW50IGZpeGluZyBpZiB3ZQ0Kd2FudGVkIHRvIGdldCBwYXJhbGxlbCBi
b290aW5nIHdvcmtpbmcuDQoNCg==

