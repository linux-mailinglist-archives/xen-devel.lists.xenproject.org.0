Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3F4EECCC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297352.506500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naFzg-0006AU-Q6; Fri, 01 Apr 2022 12:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297352.506500; Fri, 01 Apr 2022 12:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naFzg-00067u-N5; Fri, 01 Apr 2022 12:03:08 +0000
Received: by outflank-mailman (input) for mailman id 297352;
 Fri, 01 Apr 2022 12:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEhg=UL=citrix.com=prvs=083735472=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1naFze-00067n-Q3
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 12:03:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed4fe86-b1b3-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 14:03:05 +0200 (CEST)
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
X-Inumbo-ID: aed4fe86-b1b3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648814585;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=63QKaJFZHg2pZ4dx781z7svpQ1/2jmy9pQOGosdeSsw=;
  b=UppHvgUF9fPsEORYflQdtnC5MjeUsdC9+Eo5GLR4zJM6Re0g0ztRrH6W
   gdhIzNZPXeTN1MLl74wOl6RmK915QeUVE61wjageFgpdM/1aJg1Vng8YA
   0M/T9cZ4Qq6Th9dF3DcycU9xM0vCCH2i1HPWIQkJJ0Ii5jVrlakMUfzpK
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67659007
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bphlkKBvOxf9dhVW/6rjw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKkiOom3908H68XdyINiHFdv+ylkFyJE8pKdXt+SfxuvZHqccsOaFktp5
 ZlPN9fKd5poFnbS9xrwYrO+8iAi26rTLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIivQ6
 I2p/caHZQCrhjV6a2xP4PLe9h8z4Pn4tW8R5gA3PKEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93RaPpoTbqJGMx8L02zRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxWAddaDrARh1zMHQxJbMdxqSDiHD5bGgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wAd
 RFFonJxxUQ03HaoUNTRRCykmT2/7jEyZfZ5VOYquTjYn8I45C7GXzNZH1atcucOq8seVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkRpB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B02nESoX1ohAd1zjlWkylywNFbq2DSq2Lsxvw4/9GM9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1Hw2DaJz9zq0+KTJrU3ZE
 c3EGSpLJSxGYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQMrBmsfne+FSEr
 os32y62J/N3CrKWjs7/q9N7ELz3BSJjWcCeRzJ/KIZv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchQw9bYLvlWecV/iQik6MNvHBM8jxVpmbX1EFQv5gBALPNfwhJrzgrNqJNHLAsQ4lqUqJ
 xTEEu3daslypsPvoGpFN8Cn/N0/LHxGR2umZkKYXdT2RLY9LyTh8d74ZAr/si4ICyu8r8wlp
 LO8kAjcRPI+q85KVa46tNrHI4uNgEUg
IronPort-HdrOrdr: A9a23:deD4YqwZoaYwZVHj6qluKrPxn+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTiBUJPwJU80hqQFnrX5XI3SEzUO3VHIEGgM1/qb/9SNIVydygcZ79
 YcT0EcMqy/MbEZt7eA3ODQKb9Jq7PrkNHKuQ6d9QYWcegDUdA50+4TMHf9LqQCfng+OXNPLu
 v72iMonUvERV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCGlaDPY0L3ErXQBepF8bMtiA2jkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DAfeX56tQ0ubWIyUs4YkWUkxjIfLH7AJlOM1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgE082IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBLB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+laGjMiq9NllVcQ6dv/22vaIJyIEUbICbRRG+dA==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="asc'?scan'208";a="67659007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH8WAvpnQqAindGz+LTE9plfcKI669qMkDe7Qv9pGZTjaVWVHF46XvGe1EyBmuAUUtkrRZSPIUtwtbqEA3hQRmo7etxR7Q1KYpOriotxZWh0v6CERL8lfwdCtQQnYcLbs1KzLwl6jTtfMNuqibYR6TUPqNZYB4NGBmtLu0OIPZfKivtiXXJ/h+wKdqR4/VGBOkqjU0icpieTNG9Aynf+yqz7Il+sALDJg/ew6tmQtasVKZbXbQrqhS8dnKeV0EMzKPlh1sXV8EbSZVboF6+hUt82DiZ3iH0y8QiOwc2vD9Q4qcO7DklizcWED4WHMeDug0aoJGA3O7ZDb8IwLhpDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGL7PQ5uEv/hO+1X+bG0wIFKuVWr6PHkDoNabo1ZKV0=;
 b=GWYczA6VOMrdKAyCktbAt9Ff9DbJzC67fAWcJYzwKpd0rojKvL976JWpPBsk95ei0NcyRi3McIWXW7NG3JLHtV9uzN990rfBe5bwLOl8gfEen1uo0Kxa1YYOtVqgui9h666GnB8oknw0DoCsJdIdjpfZVE67PY7yavzwY3zmq1hz+pE6mEkyVinSayzLQIG41uaKieNYCgGN4z3CTvYzz7J+PfU1FsFowKnzKohN8/9sqs2g6wQ0DtO3x5EAKrgtxtqX3/mH2XhiIl1hvkAhA39+BBOQQJYocHnCcS28iNsptug/TUiqv9cBh1D2lLJFbeT6zJYJEpXs10Pg4NQ74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGL7PQ5uEv/hO+1X+bG0wIFKuVWr6PHkDoNabo1ZKV0=;
 b=DGiUuH13fRD4pr+NBf8BLEkoHElDJSsW9Y4ehPpZ0Ugx6qzhDjkCIH8bgQPi+waIci9AzIEWZvZgIHlSZCspamRaFZQm6I6h59Kpks8y17IKwoIozAK1ACn/g0jS+qDGm9BAT4vpDp0SmSxv4p8udvWN1CUV4zXufTpG7LmWCt8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 02/14] x86/P2M: introduce p2m_{add,remove}_page()
Thread-Topic: [PATCH v2 02/14] x86/P2M: introduce p2m_{add,remove}_page()
Thread-Index: AQHYKM5GC/VzGwcY0kWHMmttuUzSl6zbLyqA
Date: Fri, 1 Apr 2022 12:02:48 +0000
Message-ID: <AE149C77-2D93-4DEE-8D03-925CD6744519@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
 <c8ad290d-65ba-8437-276b-5d5f1d4d225b@suse.com>
In-Reply-To: <c8ad290d-65ba-8437-276b-5d5f1d4d225b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 779a07ee-c92e-4edd-05ff-08da13d78a31
x-ms-traffictypediagnostic: BL0PR03MB4161:EE_
x-microsoft-antispam-prvs: <BL0PR03MB4161680207DA87824F9280E499E09@BL0PR03MB4161.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4exTTh1ioCKvHxvwHVVqAmFO1ouOhk8eaqBM3TR/dqI5gyTQwTmWOHA4MmQtnJUOuoK/orkKkh4yxbkEhj/ecfaRr/5PJhH52yJEeTt1DQ/Xzm6ERv5AQPWsMWeEKpUVL/kg2lqT+8U+St92kpVO4iLEs9otiYxrBl1+Df8Pl7pEA4jr2KgsUt0T63hyP8sLo62PENjgglioK9Puw3x8IasMkS7ivEmCj1G1nKhZ8MMrVxPSpeOq5it+/gKkg6YUtBepr2CkC4B+OMjARSjEl+iQp5vB+Q7fbLJMnr/sGN2ZwMl9Wr9/HOURX8FicDSMIY0kHUBFpA/P+GfTSE34zrWDrb4pB8JfITCgqaZHe4QCxK1C7NAOIe1qtnVdd+eSoifnyEjzlc5s2JTqF6ZfUWDsI1zdbQtVeODkDTlkr4kHQNM3QsDHRN5+Rd1CDBKG60mcHQvUOAflC96qOajpCSN0F3j3aH9i0g1Yc7FNbK9w/VbD0OoCZguS1W+hcQDv7v9eoRUKIhjJCOqhCFk1CWBr2Rik9fDzYfwQsl/jrQuBwUeZtKogMKr4Vc0XaSy7ynltAwAXmb/2+oQgbBeivpUQaLZDXU+acQH7fMwQdIuUvcAmGiHebDyuNCJdeXO+t8D8adNhSqD08LhWZYLwIbtiMMxKhUReVqdzANGFQQeguMk9sEAbNgz5Y+mn6BXOfFLMgs7LLGDR6J/ex69Pe5ZekxFTGcSR8afnWRJSW40r+TudnRc79FcWUDydPWjQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(38070700005)(66556008)(66446008)(66946007)(66476007)(64756008)(8936002)(107886003)(91956017)(2906002)(76116006)(6512007)(2616005)(6506007)(5660300002)(4744005)(33656002)(26005)(86362001)(71200400001)(186003)(53546011)(36756003)(54906003)(6916009)(38100700002)(316002)(508600001)(82960400001)(6486002)(122000001)(99936003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEpQc3dpQXhKdmw1Nzlla2ZvUXJTTU04eHpYdXB3UGdYRkVmRHhMVWtWeEFQ?=
 =?utf-8?B?cWlqRVU4aVp3R2h0VU9WLzZ2TkR3TXhFdzZGdm5WZmNJSnRiMmljeTBjOU9P?=
 =?utf-8?B?KzdwRVVOUmMxWm1sdDd2ZHRCd2xrK2R6dFJZZVNOT2dxVUxCSUN5ajVrSnJh?=
 =?utf-8?B?eXlqK3drYks2eS9OQTUwR09tdkRGL29leFUvRi9DTjY0S2JTU3Zwckdmd3pB?=
 =?utf-8?B?Zml3VHpRcVA5V0s2eHAvUFd3dUo5K3BabGpvVDMydFIza0UyQVpXUUo0ZU9N?=
 =?utf-8?B?YUk2QWlYb2QvK3ljckxxSmlnOU45dDdJNkwwZ2p4bnQ0ZVhVZzByWnlHWlhX?=
 =?utf-8?B?ZmowNUdzZGlXTkxNSSsxK1AvbWNQTmxhRGpncU4ydVBnNTFsZlhiUVNjYWtE?=
 =?utf-8?B?M0hocHdUOGRtbkpzaFBpaml3RGFmdHI3Ync0ZTY0VEJMZDIwekh6dWIxbVlk?=
 =?utf-8?B?cUptc3o5MlhndEs3VlgvRjJFWm5XTHloNHlJdzdBUTh6Yk1DSDVQbjBlMFUr?=
 =?utf-8?B?ZHNpdHV6akZPWnZKNjhGbkdaVkhzbWpDYVlBQWJWYUtnTk52WHlZUk93YXFi?=
 =?utf-8?B?Tm9LWmlGUTMrK1p3R0daZEcvT040Q1lXWGxqMWZvbDhRUC9GYTEwbG82RjJV?=
 =?utf-8?B?V05GYUNzUlBMQTFRY1plSjczNW5tclVRV2dSM2pHdVEvSVplcHd2WjI1aGRw?=
 =?utf-8?B?L29tNnpKS3JCWlFFNS9jWXhGaTdBVUZJWUw5MHFERXhoNnJjWGg1ejJuSFlC?=
 =?utf-8?B?K1J2N2NvWSs2L1VLQTRIKzJVVlR1dSt5c3QvZlFWdFZuUFpaSjBSRm4yb0g0?=
 =?utf-8?B?UFdzWnB1WHBaNlNWdGlQcEFZcGF3WUtMdVZ2K2ROYXh6cXd5d2czYjM0Vjh2?=
 =?utf-8?B?cHg0OE4yVlFhK1Z0R1BhNlhPQlZCbkMvR3R6clV4UnJIVVRPcTErakx3bnFH?=
 =?utf-8?B?K29QWktSWFhEZThMZlkrK2I0dlpKMUIyakN4TU9lN281eGZ3OUQ2WTRJRkJM?=
 =?utf-8?B?WW9EbzdZRU0zbEdpMVdNQjMxVGdvMGNzZDlrR3BmUmJ6VUtEbjJPTUVzZ1Yr?=
 =?utf-8?B?UnhzT0liYmE1bW5od1prQXhqcGJOaytwSkFYTEN1bGVJclRrWUZPOVZnUmtu?=
 =?utf-8?B?d2g2MVpjZFA1bXVvaXlTVll6OHV0YVNtUmYvWVp6elkvUDQ3LzRmZGV1RDkz?=
 =?utf-8?B?VXIveE1IdlJkVmw4NGFrVnZTM3IreFVIcDBBMi9lSDZiZFpZU0QyKzF0OEhD?=
 =?utf-8?B?SE5JeW12NlNRN21EbGtuenh0VGdrWkNlaGw1eVAycGVObUduNFBSREdCbUEy?=
 =?utf-8?B?ei83OGtUU1R0NEY3cjBaa296bWxLUDJRZ3dFRldBL1FKQ2lTOHhkTUg2VmJS?=
 =?utf-8?B?ZnI4Q1R1Y0lYMjZtZzM5N2EyMHZjT2lTVGN5V0xtR0gxYThqYWUrZHJheEg5?=
 =?utf-8?B?Uy8reG5vZUdPdUFodC9vYXNlZmc2ZXpPbC90bEs0ZW94Q3JGeHRMUlpBcFI0?=
 =?utf-8?B?c0Yva0phcXNuQzUwWmNnMkREL0tlUDZLTE1pblZNMmlOWTZibUMvSnJ1dWVQ?=
 =?utf-8?B?NU84K3l6b3FvNHg5ZGEyN3ZiOU5IRWg3NU9TdmlVd0pCbnpFcnJiYnB0cTF1?=
 =?utf-8?B?L2xTeU1KaWJTT2xBWW5rQmE3RVFYcnQwMHVzUWh3ZXc5K3UxbTREdXVMSDYw?=
 =?utf-8?B?VmtQM0tmNEMwQjh6enZXSmxDc2dwaEU2Vlh6T1E4SVY1ellEOGpwcEdhUk85?=
 =?utf-8?B?NnZXWjRXTmdRU2FnNnZ0Z0RLSUJLY2cxay90QTZJZlU5U3BSejFFZFd6Z210?=
 =?utf-8?B?bGpTUm1MN3phazlDZGx0b25oak5YSWZVZ25ZL25yWi9pV1hmelYwODNxcDda?=
 =?utf-8?B?R1ptbnJpZVV0MlRWQlE4MGZXenpkZ0NVS0FLQXpTZ3BhYi9kTjNKZHh2SHNo?=
 =?utf-8?B?U2lsYjZJdTBQbVhiYlQxOE85R3ptMG1QUHprTDlQWVdERkp0bFZzZEhRZkw4?=
 =?utf-8?B?bWF2M0E0Z1QrZHNpcmV6VjZnYVFRdHlST0JsL0RlOWQyRktDd0U5ZXVoWURP?=
 =?utf-8?B?Z1pIODA1bUl6MTlSMnlmMDZNeWxnQlJ0RTZad0VwM1hlZE80VGNnTWgvN2l5?=
 =?utf-8?B?Rm5tT0lSTU8xWk1RdWRzTUR4cFNsTDdVN0lRVEpjU0lSZUdaS1RwdUQxakJ5?=
 =?utf-8?B?N2VjN2RGdmYyYXdTclpmMWQwcDBHT2o1RlB1Znc1ZmtreVdvbUlaY0tOcmlP?=
 =?utf-8?B?ZGdCUXBUOHp6S0MxeU9VN2gyWUZlNGwrVUZuR2pDdlZNVWRnOEFtYnA5Zm5O?=
 =?utf-8?B?MXpRL3JHRjRTdzdaZmJuK0Q4QUY3MlhFemh2QnlGVTRTMGZBNmY2UVQzekRZ?=
 =?utf-8?Q?+Y2x36qUeXp+HKrU=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_53EAF4DD-C193-42DE-B4A5-75744F4AB645";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779a07ee-c92e-4edd-05ff-08da13d78a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:02:48.2461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GurZSr1Lws0orKgvLR9+AI2FJXUGS+SLg7w6a8Fbk3rAnlFeaFCW+0goS6M4JrKWEUjaR3jc2Ww7w/QNjlb+alCmf3bQ0fTTwkYF5m6E//w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4161
X-OriginatorOrg: citrix.com

--Apple-Mail=_53EAF4DD-C193-42DE-B4A5-75744F4AB645
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 23, 2022, at 3:58 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> Rename guest_physmap_add_entry() to p2m_add_page(); make
> guest_physmap_remove_page() a trivial wrapper around =
p2m_remove_page().
> This way callers can use suitable pairs of functions (previously
> violated by hvm/grant_table.c).
>=20
> In HVM-specific code further avoid going through the guest_physmap_*()
> layer, and instead use the two new/renamed functions directly.
>=20
> Ultimately the goal is to have guest_physmap_...() functions cover all
> types of guests, but p2m_...() dealing only with translated ones.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Description reads much better to me =E2=80=94 thanks!

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_53EAF4DD-C193-42DE-B4A5-75744F4AB645
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJG6eEACgkQshXHp8eE
G+2ZswgAzg4CzyX5RU+j80xayxGPj3DHurXWdxjVFqoULd6K73pg9MVb1UDy7Axt
aM5tYkx32SOX8+2Wgrs03qflh7RTXuGcNjWYtTmBngP+73MDUkZ/M8obVqFnnPVi
q8dHN6Mxd75DTaFysu1HuyGzNROL1fDXfpqlVkBFrymSSvjO+cZLRPRepg1qXo2V
jVzr0Je4PkPEztcX+2CzWyUorzYxrXunCLusAM3sFvjf9ti6MqsAlkp6P5z8Qdfe
3u83lsQc9uaMKbJHqBJc4TgO1WW00ylAjUFbYk27c4q5SD2RsHCgdE5pYwrB87qF
w9s0dZUeWHOd/tfg7TLU4zf3o0LExg==
=BCCh
-----END PGP SIGNATURE-----

--Apple-Mail=_53EAF4DD-C193-42DE-B4A5-75744F4AB645--

