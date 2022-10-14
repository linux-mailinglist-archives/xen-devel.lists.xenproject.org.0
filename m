Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2D5FED40
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422823.669117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJ0Q-00059y-G3; Fri, 14 Oct 2022 11:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422823.669117; Fri, 14 Oct 2022 11:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJ0Q-00056V-Cs; Fri, 14 Oct 2022 11:37:34 +0000
Received: by outflank-mailman (input) for mailman id 422823;
 Fri, 14 Oct 2022 11:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojJ0O-00056P-KL
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:37:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95934cdb-4bb4-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 13:37:31 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 07:37:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Fri, 14 Oct
 2022 11:37:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 11:37:18 +0000
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
X-Inumbo-ID: 95934cdb-4bb4-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665747450;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xexaGvKf7M9a2R/drz2m64q0kubX8NKk+tLk12Wzn2M=;
  b=Bd9DBQZ4W1TKgYpEgACq+9UEmJ0avQgxFTXhaYcxI42JVLtyaVPtRs8X
   DnJgAeu2xlv8cUxA5yHXBcw7XJcUQhHPWf7raFU7SctzZlI2se1uvWi8X
   aFPJ628XNvPUp/sROygetnh2ArCgek6HNVr5sIkumPENFdOzl+50Mdsid
   A=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 82369435
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nBcILq28+QCIzqJhyfbD5e5wkn2cJEfYwER7XKvMYLTBsI5bp2RSy
 DYWCjrVbq3eZGahLtx3at6w9EIHvZ7QzYdiTQtkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpE5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUW6OgtGiZSz
 8dAOWsyYD2suuab0py0H7wEasQLdKEHPas5k1Q5l3T8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7gzL4/Zri4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r83LSRzH+gBer+EpWy295AgHat4FAsBUc5aFylgMuFoUyHDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRR1t6afU3Wa9bG8oja7OCxTJmgHDQcbSSMV7t+lp5s85i8jVf5mGa+xy9jqQzf5x
 mnQqDBk3+lPy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:/YCAWK6AKwlWr76nKgPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82369435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmRreud4cKgfseT+BdayHcVAiOo80o8JH9l03bwU8WKZHLHZI/AKZHcRqLaJGTwU8RZg1DYnEKRH2t4aGmNtS5SPThATT7Q73agwAJkxjV0AKVRRjJ/cOSOe7CMjSujH4sbuW7oTINqYTjdqRYXEV2cZVxsNIajLfrD6uB04b3/eQsG8HP8dGQ/gXDEr26XBMfh3/XaFT2jsVEmrEU+OBNKyNjh/zridVuPN3LJijAjo2+wkk26o7vQySGw/rieazSJie5ERiE+lNwM/57moUHdOfSvcBvnyxe+ELqy2a+TyoLr+FORHsnYRx1PCQ36dTMKv/YQjMsCmRx37nINg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xexaGvKf7M9a2R/drz2m64q0kubX8NKk+tLk12Wzn2M=;
 b=Ydrsc8OX1U/4CaFCXnxoRj47tK19L6GKN4RjZpZf9z0AfmPryjkPvgqXSird7OtpveCvTrUJa8utLrTCbnnTY1iAbO+pAXfBuu55DJXgLTibnnZZRjkDR2S9704UTbnEW4njtSdHiQZEY4h4iDclN+QjTOx9EJi/Kt0mfh9bq2R1I9aU4+DDg6I7hLrubWk3cAChnyX1t3NDrEzJJXxfeYBUgfsKeHBn+reHaGp3OYr6HAP7rEP40W5oxtRiRWkYZLgMPraXNZp0ZaMFf7bqPG8Az3T/zZ2jkz01lV5zYG237LzCEpkAOgBH5HysDzuJTuMiT3KhVvb58hwvEPrmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xexaGvKf7M9a2R/drz2m64q0kubX8NKk+tLk12Wzn2M=;
 b=buT+yutr0Xj5F/4lw9/6XHnB3Z5ObtqCD3SOcgFj0uwqcKFpuK7nEH4SHtx72wuz7CSsLwWvj3TKoYlyl+Mso8ULRiIAl/FUqAso1JfdJq8Qj6SdFCxLGxDq0tCQX6jGcCRcCZptnHEb4Rn7ddUiVRUoYc0vQ62bRTH1rJrXk1Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Topic: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Index: AQHY3wYExc++jpfrd0yvyakMPv5Mw64MavoAgAFV9YCAAAOmAA==
Date: Fri, 14 Oct 2022 11:37:18 +0000
Message-ID: <532f15c0-8615-5196-e555-86a2d1094335@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-17-anthony.perard@citrix.com>
 <3d5e662c-91b5-a390-c21e-90391961bd45@citrix.com>
 <C3A38BD5-E338-43BD-9EA1-3600378EE3B4@citrix.com>
In-Reply-To: <C3A38BD5-E338-43BD-9EA1-3600378EE3B4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5592:EE_
x-ms-office365-filtering-correlation-id: 5e0523af-0a2e-4fab-35d8-08daadd87379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bkHdFPbt9YC/D0N8Z4ikhSHt+6SWVo8yhvuV+qzYP/dQ3C7uc+mzcSiytXOi1m74EC8068q/LjtZUXmn3W5G3qEe9dCLTeEP9CFnu2Z+HjRe957kFjQJv2AnZvOWhIWVUNioktynpLIvcmUI4o648B02/AHFXGEdLBSFMGbHcBbHeaFkmmD2sQz438FMya36Qe2d0gV/KDG4IeBrFVaCmx3OdsLyorb1k1zSdt6ZMgIuMJNdkFZzTsi7T7d4yOnI7UzF4PmJA5xwxXRp/cmJlge0ortfCMWmHu8nLCLrrlj7INyf4ofYsCphJ3Ho+fDjVPe9rHo1sD8ll1E8xB88koUWmzNmUTvpmQbyRro13iShPunWpvqeZBq897EW3ozWPfJvN/YrjKrIZmEn3zk6Uxppyxq7sfMv/gDifdSQQqVj7LsNeZU5KQwfgG+agj0rFHq2ikldo4m1IcCMp7wXIsfdZT5KP1IJGV8S45988+vupzOSknnMIwm3UTsjrDfp5WVPcylCLEfbacufKsKCLuiuYpGc2hyDfu16W5zotBZLT8ZKdENDF38t3Aj1lXJJAL858mnVQxYUNydQ1nyM/zyH4pF0YVrfwtuOxx3PpTMibagLnoFsFcvBsAvvZBUgcH2Jd1YwEB3ryaF5E/HH7NcBIXC1R34sd7jHbSDzH3ZjJDi6stO7Dv+UM199Gh6DSGnoGSF9aUB6XPIBvf1tMP+q4TDnEmNk8XB2eTcLSw3BuvdtnL8vk2krHEfiS4KhwAkXT5AwqLGTlFUAc6Ob669WErzBLosd7O1aM1rWrwzO3rC1cSZe1o48N+Dd3/y7G6eAXvO97+Dz+8DysbqTtg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199015)(36756003)(86362001)(38070700005)(31696002)(8936002)(6862004)(6506007)(5660300002)(2906002)(478600001)(2616005)(186003)(83380400001)(37006003)(54906003)(6636002)(4326008)(6486002)(26005)(122000001)(71200400001)(53546011)(66556008)(66946007)(66446008)(66476007)(76116006)(8676002)(82960400001)(41300700001)(64756008)(38100700002)(316002)(6512007)(91956017)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzVkaTN6NFd6blFHTE5vdTJ3a3IyTkxxeTc2OHFodGZ1WnlGbnNJeUI4TnpS?=
 =?utf-8?B?UGRQRU9pUjRPSzh4YUZRaEdaQWkydG01N3JKcEVNb3VFMmhEYkNpNndkTUx6?=
 =?utf-8?B?TjRJS1JpeHE1SCtKRTZoQ2Z4NnkvWitRYWN3M1RNR0NYRVZISXI4Qlc0SDlR?=
 =?utf-8?B?U3I4QUJEanRUT3VPU21ocFpNejh0RFFoSG9uZnFtY3ZDdlI1S3BtK0RjMlBL?=
 =?utf-8?B?VC83empwS0F6cWV0S0V3WG03QWZJYWhvWW5TOEVsOXV4N0lHa1BwVUQxSlll?=
 =?utf-8?B?MG5pWXFTd3hyTlVFRWtSZ1M1UG0yT1hYVklGT2lzWkwzRW9aUm9uTGVwR3Iy?=
 =?utf-8?B?Q0h6VnhncjVBMkJrV0QrdkZ4UFNCU2lWTzRkWk1PSUs1ZFk5UEJxeUN0TUxm?=
 =?utf-8?B?S0I3ZjJtTW10Vm4wTWdJTk44dmxiUHJzb0xKb2h0NERxTDBscHhLY2VPK2xP?=
 =?utf-8?B?bmxHWnlhbTdQSTRORXdoTkFVMFJ6bHFDcEhTOHk4MGo3MWkzV1ZUM0ZMcEZw?=
 =?utf-8?B?MjVONUlhVXNVZWhhWkhEak5JMDlDR1ZtSlF3SC8vRTVMVk9BbmRvajFWNU5k?=
 =?utf-8?B?UnZvTjFRa2x4aWdEVHd0Ykc4Y0JYcnBrZFdzY1M3MncrMmZKYlcvUFcvNkFN?=
 =?utf-8?B?ZVA3TXNKbU5CbVFkRy80bWdHNDJGOE9pK3Z4dThzTDdMMmlhc0t2VEo5akd0?=
 =?utf-8?B?cmJCRDJoOWNUa0doNDIzT0tJdDlRbHB0eVRZa01TYnVZZlBoRmtjSk41TGZH?=
 =?utf-8?B?Sjh1Nlc1RjlocjBZRHNCNXhkUXJ2VWhPVSszOXl4Y3gzRTAyRTZPTGVEOXlD?=
 =?utf-8?B?QU9VaktOeFBpSWJxa1lyb1lJeE1OMGFxUU1LVlRvY1V4SzhVRitCejdvQ3R4?=
 =?utf-8?B?WDYraktrM3dyOEgyTjF5OHYxQTYxMUtYdmhod2lXZXBMMjVYZlZCZ0ZuU0FY?=
 =?utf-8?B?Z3pVZzhUTlZEMEhPOSsvOUIyKzhQY1VvS3JSYVhEK3Z6ZHBqRXRCR1Noa3pQ?=
 =?utf-8?B?dHQyUVd4RHJKVFIyYlpPamhPbVZtMDdlVUJRQkxUeTJacW9EL0F3RTZTbXNr?=
 =?utf-8?B?VzU5dUR1MFduZ1BTRnVpRHNEbW1oSzVOYWhEOTBsNm9OYnlSb05VbHBOc29Q?=
 =?utf-8?B?cUpoNi8wYlFMenFIb3VaSzFDWlgvdFZraGRkcGRrTzNta21NT0c0NWFwSHh2?=
 =?utf-8?B?Y1V5cUdpV3p4aXRGM01qS3dKamhJYk9uY0ptRWpNekJaSUxPRzZ5Ykh3aVVn?=
 =?utf-8?B?T2VJL1RCeEI3NWdlY1N6ak1kU2lDZzZVd3BXSDcrMm5DNkJTWm1ZSUdzV21E?=
 =?utf-8?B?SGdCZUxKbk14UTI1amlmVGxqa3hCZW92Sk5CUEt5b1pic2pXSGZNcGhPYjRC?=
 =?utf-8?B?ZGhxRld0S3RZbmFJUEc5c0ZiVDNjbEtGVnJNKzVPN0NuR2EvRVFYZnVPTnlQ?=
 =?utf-8?B?SFlIcnpXUGFKTStXQkE0VFZpWGthUDdnMWtJS1Z6YjFoOHpianhObEFTNmZa?=
 =?utf-8?B?b0o0TXFKMDV3Vnk1OURQUElMeWh3eXdHc2djVXdDUFZlL2s2ZGhENEhHTTRN?=
 =?utf-8?B?ZlFacFdzV1RpdlBmOWNESEhIdmxvSEY4YTE2dXY2RFVGYjQvUUkvSnlNTGo1?=
 =?utf-8?B?UU9PNkl0ZSs0K3EwMWE4bDhvSnArVTNoa2Z4L2k5aGZ5R2RZS1dsSHBCU2lN?=
 =?utf-8?B?ZVJnd0lwdm5CYnU3dDZVY3Y1MlpBcTdSb2h6L0JkbXZvS3Zqa2hIQVpoTVhx?=
 =?utf-8?B?RFlIM0J0UzdBeUIyRXpsY1dXd2ZHREpETEdxRG54VmlTRnIyajRkdGpsVlhh?=
 =?utf-8?B?U2JuU3h4QXlSUjJZREJzUk4rVTJYS2FqdkJtTUMwN1dGd3pidmZqMFE5YU5P?=
 =?utf-8?B?VVdJUUtybjJockdPMHE4SFRFNzh1MkRneFRWM0JRRU14NjJJZDlxUTdjMUdp?=
 =?utf-8?B?dDNLRWV0TzdPa0U0dG9rc2ZCeFlva1MxTTZhQTltLy9vdEFEODc2YnFNMjRt?=
 =?utf-8?B?dUgzOWNRSUNDSTAvZzFRV1A4Q0xqaUVWcEhYQytCWXZ5bmsrSyt6Q01ZQXVQ?=
 =?utf-8?B?TFpQOEwwV1hCT1EwVEpnTDNEWUF4MG5nckxNbVZTNE9OanM2alNUT2pJVG5E?=
 =?utf-8?Q?7IoCSP6XOqHfe/tcVwGO13tWJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D0233C191724944977C2791FC064A08@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0523af-0a2e-4fab-35d8-08daadd87379
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 11:37:18.7898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhuu2w6evgjqfdS7c4VTcVcSYp9u+RywBS2xXoJXA4JMgL6TRJCZ2poVJS7pS57rW5GRsMS3vJG4DVTa5wzuAN89lcIsVc+nrxeWCtCzeBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592

T24gMTQvMTAvMjAyMiAxMjoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+IE9uIDEzIE9jdCAy
MDIyLCBhdCAxNjowMCwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6
DQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5IGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkNCj4+PiBpbmRleCBhYzFjZjA2MGRk
Li5mZjRjMmFkMjE2IDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5n
b3R5cGVzLnB5DQo+Pj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkN
Cj4+PiBAQCAtNzIzLDcgKzcyMywxMyBAQCBkZWYgeGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKG5h
bWUsIGV4cG9ydGVkID0gVHJ1ZSk6DQo+Pj4gICAgIHJldHVybiB3b3Jkc1swXSArICcnLmpvaW4o
eC50aXRsZSgpIGZvciB4IGluIHdvcmRzWzE6XSkNCj4+Pg0KPj4+IGlmIF9fbmFtZV9fID09ICdf
X21haW5fXyc6DQo+Pj4gKyAgICBpZiBsZW4oc3lzLmFyZ3YpICE9IDQ6DQo+Pj4gKyAgICAgICAg
cHJpbnQoIlVzYWdlOiBnZW5nb3R5cGVzLnB5IDxpZGw+IDx0eXBlcy5nZW4uZ28+IDxoZWxwZXJz
Lmdlbi5nbz4iLCBmaWxlPXN5cy5zdGRlcnIpDQo+PiBUaGlzIGJyZWFrcyB3aXRoIFB5Mi43LiAg
TmVlZHMgYQ0KPj4NCj4+IGZyb20gX19mdXR1cmVfXyBpbXBvcnQgcHJpbnRfZnVuY3Rpb24NCj4+
DQo+PiBpbnNlcnRpbmcgYXQgdGhlIHRvcC4NCj4gT3V0IG9mIGN1cmlvc2l0eSwgZGlkIHlvdSBu
b3RpY2UgdGhpcyBieSBpbnNwZWN0aW9uLCBvciAgYmVjYXVzZSB5b3Ugc3BlY2lmaWNhbGx5IHRl
c3RlZCBQeXRob24gMi43LCBvciBiZWNhdXNlIGEgc3lzdGVtIHlvdSB3ZXJlIHVzaW5nIGlzIHN0
aWxsIGFjdHVhbGx5IHVzaW5nIFB5dGhvbiAyLjc/DQoNClhlbidzIGJ1aWxkIHN5c3RlbSBjYW4n
dCBhY3R1YWxseSBjcmVhdGUgYSBidWlsZCB3aGljaCBzdXBwb3J0cyBQeTIgYW5kDQpQeTMsIGJl
Y2F1c2UgeGVuLmxvd2xldmVsLnt4Yyx4c30gb25seSBnZXQgYnVpbHQgb25jZS7CoCBJdCB3b3Vs
ZCBiZSBuaWNlDQp0byBmaXggdGhpcywgYnV0IC1FVFVJVFMsIHNvIHdlIHN0YXRlIGEgc3BlY2lm
aWMgdmVyc2lvbiBpbiB0aGUgc3BlY2ZpbGUNCmFuZCBtb2NrIGVuc3VyZXMgdGhlcmUgaXMgbm8g
dHJhY2Ugb2YgdGhlIG90aGVyIG9uZS4NCg0KWGVuU2VydmVyIGlzIGluIHRoZSBwcm9jZXNzIG9m
IHRyeWluZyB0byByZXRpcmUgUHkyLCBidXQgaXQgdHVybnMgb3V0DQp0aGF0IFhlbiBpc24ndCBh
Y3R1YWxseSBmdWxseSBQeTMgY2xlYW4geWV0LCBzbyB3ZSB1c2UgUHkyIGZvciBYZW4uDQoNClRo
ZSBidWlsZCBicmVha3MgYmVjYXVzZSB0aGUgbGlieGwgYnVpbGQgd3JpdGVzIHRoZSAuZ28gZmls
ZXMgZXZlbiB3aGVuDQp3ZSBkb24ndCBhY3R1YWxseSB3YW50IGdvIGJpbmRpbmdzIGluIHRoZSBl
bmQuDQoNCn5BbmRyZXcNCg==

