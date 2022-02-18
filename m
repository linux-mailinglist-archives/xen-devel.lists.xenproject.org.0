Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7924BBAB9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275509.471417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LA-0008Vy-MP; Fri, 18 Feb 2022 14:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275509.471417; Fri, 18 Feb 2022 14:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LA-0008Sv-Ht; Fri, 18 Feb 2022 14:34:32 +0000
Received: by outflank-mailman (input) for mailman id 275509;
 Fri, 18 Feb 2022 14:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL4L8-0008Sp-3t
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:34:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dee5d1c3-90c7-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:34:26 +0100 (CET)
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
X-Inumbo-ID: dee5d1c3-90c7-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645194866;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=rCaw4YlAdsLa1oDS6xBVJ/i1Wan12JGK7S2VvZt37aE=;
  b=BDbfFX7nYK/+5mm6YquIH+tsGDjxQLv0hAkU8+U54A09oYhCvsosu9q2
   jEhXlnTrzZC6IEMRbE4eVtaS0WCziYUVUiHAZ1nDFe6bZItXMsvkl6QKv
   jjXv5jyzgKJLKa7JYlPI/xdwMpWoRbrF1BFJX6qpsJoBpFiXUDEvvwsbR
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66766300
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2KOZqaC6ZY4f0BVW/xbjw5YqxClBgxIJ4kV8jS/XYbTApDhzhmYFm
 mFOUG6Cb/aDZDGhfosgbI6y8RtTscTdzNA3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgow
 vUXipWWZz4lJ5Ln2+AQTRtiNX9HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgmhu2JsWRZ4yY
 eIGVCVNawucTCdQJ2YODbxmsNj3vUjGJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfuwDxw1j7SzZ0uR74i/7je/JyovCzE7MHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdu12PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNO34jxpmGGeF6bKKI3XH3238k5JEVdoNiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SYm8DKyMP4YQO8IZmOq7EMdGPB/4M4fFyhVErE3CE
 c3DLZbE4YgyUsyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJIdI9xP0Nzr+Sl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNuFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:lr7cu6+R4JHpeDkkK6Buk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="66766300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVma+ykpGVbM3/7CYYu3HwG2rk5MxEV72z4pTsyHvdfz9azh+VrtZpiwU5/hAdXWopC96Jh3Gz9ln2nCyU0+imNiCJh4pi2wkSJ76n1rq3itnwsDt4d5QHmwn5zBtlNLygTuWQB+MruJAz5xiPsUCDJ0fEBtqHb9V7RJf8gquMhmF7Kk5W1JLkdGRyJAQEvMtl8FyxP2P60NZseoMFog2B31e0TrprAZdiCSKP11KBE+s/PnrabE0Vc/KYJhuta+NSEKShLFpLZPErbz9tXbX8XCF8QP9NrrhZ3ees2a9+3JSpYBvN1LrYhLnen+ibOXgtPuB9OZEzJ9jaxkDZEpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V69HkAqfmLCDxeKC5CYpv9zauxv4VeWcFtmi3X1p5is=;
 b=gkoqpGgUQxM5JIPQWYZQo4cs2T3Q61KobCt/ennoCiV9yFe9aO2XT8o7BSrHRFxXzi9BtOxKOql1krZka8DS7Mb952HNCwyoEYlA0mUV2FG2NkxU7Adu7qD4BZLoIc1VK1fgYu9Pin8uvgwRsgVr7ruJvT2iA6zOXgZcEtKXFEdoRyPx006F5+cHtOWJveGjeVacjoXo6vgNrFceliSyamK0Bu2/xS0vo42TNvhAe2LVkRVMMNoErSrNVLOT0Lj9vf1Hwre4vQuZJZusQZ4eRSoul6EtJQKtO1SDBSnLaleCMCZ23VcQktHSqXVVBuhrs1G0m6/inMqCThWMlqcpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V69HkAqfmLCDxeKC5CYpv9zauxv4VeWcFtmi3X1p5is=;
 b=JEZtaXQrJvs5Nre0nUrPdoI9aCfwDcOA8SmPApqT/vcRkZnfATcZOGGOg5bt5tWy21L1OgE3/8zcKDLNxnYmlC8i2RCXVDh1GkGs3S5qLZZxrMLVoHja+MpZHdBSCDy9bUKH41IP3oiwHSI9MiKwyeXrhkiuJOifT3bsgkY8KrU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] retpoline: add clang support + Kconfig selectable
Date: Fri, 18 Feb 2022 15:34:13 +0100
Message-ID: <20220218143416.34475-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0315.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f27da68b-e03e-4d9e-10bc-08d9f2ebc124
X-MS-TrafficTypeDiagnostic: DS7PR03MB5543:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5543A007C79D7EEFBE30ABA98F379@DS7PR03MB5543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUhF5yiT3j3FZylfYK0WplX8ntoGCPg5TnKnnlQMDsPk4d5Ab3Pb6vuBJg4FgJ/GM/onaI61spN4RWaV9EwvsjKlIsKjWY/rMUTUQyi+9Qx1EoPZ9MxRTZ0GFTykh4b69Z/ky7h7gFyFlixPhsaGxCtcvNzbpTALJTBcw/akA2q3TER2WqSjQ7u/19gqI6PcXVgeBB1ntafWOEx7Hz/gXRT+tvlf6uatnxUElub64dmnIp/MQQ7i4BDwML8E1iBu9Utusv6YtUHSZsQmPTiQvY+p+0R+g5OXw81y0GBAFbYi/FU8j8IwdfKH2HAn/+QbrAjViiu6/4ttxGwWqqsiytxQY+P8YCYrKUTffy8W3PkqkSSiUR8WsJ1I4L6fwXwTStv2SqYMuI9YHZLxKCQlTyW7Fio5+lqD2Ma+YIeEE49lqVLE1xBI7I0P477KPC88kwKCYJpYj7D/v3TP1Edg/UB2eJlde1/AYtpjkuT7SuHF2I+CQX8UZo9BEcWucecZ7jAaRGXfshq7H9T0zSYsnyJNcsVnd3+oR27TZ0/hYVWItALWNBPBAqcPFIzEMZTHLqI3389Hmb7ysVtVQBXAcRslshSBW3USuYScJEpuT9uUW6IaCt3zqz8JeMKjPzirvSQwCz1maCgpd9pNc1cRqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6512007)(36756003)(82960400001)(8936002)(26005)(1076003)(6486002)(8676002)(6666004)(6916009)(2616005)(66946007)(5660300002)(2906002)(54906003)(66476007)(316002)(66556008)(83380400001)(4326008)(4744005)(508600001)(6506007)(186003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzF6NVNKbng2TWZLT3hoNkh4TzY2bHd6OEVXNTYyUnBFRk1NN0lpN3N1VUti?=
 =?utf-8?B?Wmxva2pHOEcvVEV2SkVwMy82NEltUDhxQXJjK3lFWWdEcGtFcURsOHUxQy9l?=
 =?utf-8?B?TVNMUmtkRVh0L3A3YThYaUFldklocXJQUnhmM3lFVzJ4S3NTV0hRWTJIWEtH?=
 =?utf-8?B?UkFUckxXVWhXOEl4d1N5THZPeVNBNkJvS1haeTI3bTBaLy9xTkFrZjJwZ01u?=
 =?utf-8?B?UW5SUFVnUU5rVzU4NGQ5VFprMlJCRndvKzdoV1VGTmVFVVNaRTMzTWNOQnI5?=
 =?utf-8?B?Z0VRZmpZSHBvVVNHZnhERGRTWHhMSk5vNmtnWkZvb1RiVWVGWU5QMzVNVHBD?=
 =?utf-8?B?T0VoeHRrZXJRcStJMVV3VitCQXk1dlN2bkhkcklBeTJJOHgyMTRlWjUyWmN5?=
 =?utf-8?B?dEZ0Mng2cm1sc1BtR1lYMmppeVhhV2orY3VLeUNWYnMvVVFlZDRSS2x1TERZ?=
 =?utf-8?B?bmZ4cE96RTBYdXNOZit6cnFSWHdSZkxSd1FKenZnUkU4NEZDckl3bWM0VElv?=
 =?utf-8?B?Q3lad0w0cnc2WjNMVjZqamg5bjMvUkRBTW5WTW1sanM1YWtIbzdjRVAyOGVI?=
 =?utf-8?B?cVlFbzB6ZWVHNXpQYmNUUm1XdStXSUh6ZW5ZQUhaNTlIUHpDdkNQeXM0Z1dr?=
 =?utf-8?B?Ykx2aU9xdys2V21oWUM4clZsOVVybjhuNkw5bkJ0aUt0MDRDTFd5ajhnVWV6?=
 =?utf-8?B?UnpRZ0FIcW5RWU9yNW54UEpwa0NnclRZVGxLZEpidVRHdVdKOVZ1aHR4SnBU?=
 =?utf-8?B?YTNFVXRYOU54OVZXRUNoZmFObWp6SmVTcFRqYVkycjY3bmNaNm8xQUVHSzRi?=
 =?utf-8?B?ajZXWXFHdjZnNjBrZDhQQU1ScHI0cEE4WDZGc0VXSWRIeHl2WW5HbEI1VEc0?=
 =?utf-8?B?alFwZVU0WUJrOVl3VVpIM2VKTTdrUHdyNDMydm9CMmdIY3h4dUhtcFZJQTZI?=
 =?utf-8?B?N2RtVjF0WHZBSzBleThCUE1zMERuQlVqaDhhN29aZkxlSWl4MDJRbDJ6V3Z3?=
 =?utf-8?B?TUZpYUN0clN5VWFFKzlITi9NQWJ4M3hERjJkN0JYVkFPM3BnTXpPNnlxM002?=
 =?utf-8?B?ZHhWTE4rYUgxN2w0REZSb2RWenZtT1Z1QWIwVHZrR1JZL0ZCWXF5c1dVcDMz?=
 =?utf-8?B?eXZWcjdwaC9zdVp3MzRXSXRQKy94M3Fyc1ZNZW50OGd5b2cxSFNDZk9ENVRk?=
 =?utf-8?B?RFRJS3I0UTZLaFBLOHdmNERPcmVsUWpVWEZ0QjFnZlpZTlgvWGJZVkZUYXRB?=
 =?utf-8?B?YnhDSnNXUVVITmhBcXZFbFFnNmQ4aTJ5TDJrS0xzSUN3bFMzUHIydlZ3VnBh?=
 =?utf-8?B?T3NCSFRVaFV5MVhMejVlblNwNzJ0NHVqSytMTVowYzNEaytjM2FRVW11aDlT?=
 =?utf-8?B?WlhYeHB3Y2ZQV0s0MXFhcUVWSWtydEU3R09kMThlb3VTYnJ0Y05sRkM3aGJJ?=
 =?utf-8?B?SEYyNXFSMklCWElnRW94YmNrek9VYm1zcE1ldGdZbzV1YjJCczR3bkVtcmsy?=
 =?utf-8?B?QTRIR29yU2NKUkdTMGp3cWVNQ21xYmhPS0lSR3d1VGJhaDRYZ1h2MmVrUVBu?=
 =?utf-8?B?R3BJWFdXeDBRc0hiMkZwaXd0by9KK0IzdnU3bE4wRm4xSUZTRXpnM202WVNX?=
 =?utf-8?B?cW9SbE43VVNGUmpXd1draUl1S1ZScnpoWUd0UjZzYzhNUnA3UlJrYWhDdmFv?=
 =?utf-8?B?NExjTkI2TmJZNHU3NFZmTnhyS2N3RXlNb2VJVEYwQnVDUWFKZG1Ld0RTUEdE?=
 =?utf-8?B?VUVtZE53eTh4MmkvQUtlZUtyUkFUOXJsYWxZOFB2MlByK016VFQ1eTA3Q243?=
 =?utf-8?B?ekVrMDBVb1NiZHhISXJma2tzcGxwV245a3FLem95aENPdmhQMEM0dUVSV3gw?=
 =?utf-8?B?aG9rOVRCR0FJNVlISW1GYkRZbjRPMExKNGtwbS9tRXo1RVBLeHAxTHAxY3lZ?=
 =?utf-8?B?SnppL0JZNytGUFNVeGtvMk1KaVJNUzZSZnRneHdmbHJKSHpSUmtKcGZ4NlZj?=
 =?utf-8?B?OVQrQzlET3pCbTJUejFkY1loZXhVb1JFWjhKUi9QY1N2dkhQMzhkRkROSnRH?=
 =?utf-8?B?UzIzcXFsM1FzVEtrNXdFSW1DWG1ROEhrZ2hWcS9Sb0dFUVBYelV6TXpadlFw?=
 =?utf-8?B?b1JYS0p1S0ZEbGc1SnpvZ0lsRVMyYXJOU2NrVEM1YVE5LzhGbWhZUUMzRGZC?=
 =?utf-8?Q?f4lqGW29018ggsgHhPJDdpM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f27da68b-e03e-4d9e-10bc-08d9f2ebc124
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:34:22.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MusYxJBadxZuovV+tf4glQiUUUhQxA4XwaNqsBf886B56cF70juO6yQ7SaKxximZ6Vi1tdShXvnZJG/zuz37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5543
X-OriginatorOrg: citrix.com

Hello,

The following series adds retpoline support for clang builds, and also
allows the user to select whether to enable retpoline support at build
time via a new Kconfig option.

I've tried adding a suitable description to the Kconfig option, but I'm
sure there's room for improvement.

Thanks, Roger.

Roger Pau Monne (3):
  x86/retpoline: split retpoline compiler support into separate option
  x86/clang: add retpoline support
  x86/Kconfig: introduce option to select retpoline usage

 xen/arch/x86/Kconfig |  5 +++--
 xen/arch/x86/arch.mk | 13 +++++++++----
 xen/common/Kconfig   | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.34.1


