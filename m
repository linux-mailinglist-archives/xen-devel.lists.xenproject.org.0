Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED324A5C46
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263561.456297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsGi-0003Jv-RY; Tue, 01 Feb 2022 12:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263561.456297; Tue, 01 Feb 2022 12:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsGi-0003Hj-OG; Tue, 01 Feb 2022 12:28:20 +0000
Received: by outflank-mailman (input) for mailman id 263561;
 Tue, 01 Feb 2022 12:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F7S=SQ=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEsGg-0003Hd-Ej
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:28:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cda2280-835a-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 13:28:16 +0100 (CET)
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
X-Inumbo-ID: 6cda2280-835a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643718495;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0UJeKWARNCUtcyjUqQaNonTHuDI9HbUzQ6UuBPM+AfE=;
  b=AZYo4dhOIdsdbFkrGuXIasoYFRhdi42FQ1/m+GS2XLWc7PCaJq9/0CqS
   tobtXsXkKVn2brrB4kdTD6obDJeee72vyprNfflXPo9eU5OKkN4k7uG6k
   Y6oJNaOAUQpS28mjRmAp2ndelg5CvwUhw8newGnjDUGulu02Yro7HXGe2
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tTRB0ZNaEt3bSneN/l7m2N+qOFT187TSGiF/u8Y91jtSYoj/3yNaswPajDu1dBxxT8YljR2D6X
 /02iPtjCyqikR1++H4tWsBwyKag+h48lwMnku4l0GqCdJZUs803IROQFevIg3BXEdqXj6JE3zp
 c8G6uziTEwlShYjeQVWXENz34UP3mNB0CFhp85HFEznswEt3LqoUIMkF5KQGxcrydMAemQ2Gbx
 BarMJjonAl5v1Ur71SAuVuv6MSJ6SKr/Ka6U4+ZGb/F61F0HKlRWoaPiUE0Dt+II07YFtlxKp0
 RArmX31KHp+XeT1nIcWqAqjz
X-SBRS: 5.2
X-MesageID: 63125858
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wIfhna3W/549BQgZhPbD5T52kn2cJEfYwER7XKvMYLTBsI5bpz1Vy
 DYXDD+AO6yMMWTxcox1aNm3o0NV7JTcnINkGQZtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7dh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqh2OJf5
 Y5juayJd1knAfPMnfYmaEJpHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3ZkUQKaDN
 6L1bxJ2SSbCfxhAEGxPBZQmmfeS22n7dAVx/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfngifTSI8UUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKallkudfcLPeEK0T/TxJWK4wOLPVNffzEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdTNi2+AswGzARN8wGCxFAPpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2wuex85bJdYKFcFh
 XM/XysLvve/21PxNcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dA5SdSZjWcGp+qS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:9qqwY62eYOB+97YwUH5I0wqjBRRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHQYc2/hRAV7QZniYhILOFvAj0WKC+UyvJ8SazI9gPM
 hbAtBD4bHLfDpHZIPBkXSF+rUbsZq6GcKT9JzjJh5WJGkAAcwBnmRE40SgYzdLrWF9dMcE/f
 Gnl616Tk+bCA0qh7OAdx84tob41rj2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpJmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF5d1HqWxa1O
 UkkS1Qefib2EmhJ11dZiGdgzUI5QxerEMKD2Xo2kcL7/aJHg7SQPAx+76xOiGpmnbI+usMjJ
 6jlljpxKa+R3n77VTAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdo99Q/Bmcsa+d
 NVfYvhDTdtACSnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtZ5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdA15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAX23G4gMy0eFPGC1z3dLkeqbrXnxxEOLyoZx
 +aAuMjP8Pe
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63125858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5nQDeQ+u1/zxew9evAu9eJoWVHw/V+uCrAEPobDJwCFx4uPZbUF7cDMGU0v1n9usksic5oSRQfLmXjHU2dmmUc79i1KSzIiIEPTukVOsVmS4bLjPIvycVj11kkmkLVyhFWLeHiPwHq70+rAC7Lo97UGG20OHPAC23CsysRWI3IXfhn/RG6sRjba+ncnbRauwM3zyTzLEWprpsN1a1klMJMKqsBhOCjNLXj8UCEtjaaFZEOXXfzg4C/Kt7sMFXQZqfP473s5WwdEUEZRdkzOqkL3MEEgGq36Q2t9qArJrQLqdOM8/soioyRf7figzth1nyEgN3fT5aH7aRjpExBi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UJeKWARNCUtcyjUqQaNonTHuDI9HbUzQ6UuBPM+AfE=;
 b=mki7C1rsB0TL51LORBn8WggM9aeeVrfaq7wUJHk2c9AnKBOGARNfqZ/iyU0lD4p3s5Cmoe9mukj3mz5bG0Q9IOTgmiy9K8TPFU/mzBr7Aqf6WdEfXxt3v41RfjKyjJA9iCGDxzVd1WmUIED11UqV/NjBakAPoCc9vse3fjyVXha7dDeh7qrkUcxvPS9e4a8y0JgmsKqy5oTkk0Mj7UIULPY1rjZCYjiEjCRX2MycM8cyFeCt57gT2+IAsFcmME7ABqmoirKvAs9FVcp3+3ajvLbl2X/AdJMoegFqUSGQEfPRwdoyoipS/DHX0Cp5XyARpkDy4BWBkeqs3a4Yv9dEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UJeKWARNCUtcyjUqQaNonTHuDI9HbUzQ6UuBPM+AfE=;
 b=kT8sdXGWBtbewRzEGaZb8HIjyQ9YlZxRSaCUjgk5Z+wRtIdDZutIAw31fxfijTtXMcONPssFs+X+8Ml3Oss24piGI9lCZ8U5xzf6r1sC7pmBvJTk8Fe62+DmIJ3DZJtJ/pp+CgaZBhLpi6VxO19d6tylRrcdYOZxxOr6YwBHcGY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Topic: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Index: AQHYFrhnGKPHuYBRW0udTNFT0Cg4lKx+lY8AgAALVgA=
Date: Tue, 1 Feb 2022 12:28:08 +0000
Message-ID: <e48536c0-14c1-1d41-0a9e-4fc0f0aa9c36@citrix.com>
References: <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <20220131153621.8863-1-andrew.cooper3@citrix.com>
 <00aa1f8a-9f2a-96f1-b088-e34c9ec76f3c@suse.com>
In-Reply-To: <00aa1f8a-9f2a-96f1-b088-e34c9ec76f3c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b74e8b2-a28c-45dd-eb4d-08d9e57e4e2e
x-ms-traffictypediagnostic: CH2PR03MB5351:EE_
x-microsoft-antispam-prvs: <CH2PR03MB53513D5CA8F4EE49122FD405BA269@CH2PR03MB5351.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GxX+4MeOuCIgDXLFFS8vd+XMH2PCMIUoXCDVjmtlq5leK3E2qAb+02YCmh2I3A0aRFtL0cH5FO+hsvyH2fWaNk9jhH/84MvdmvDW2eh7fVSGSrvUQ+oDuuP9tapesBvB1BEj4AM8VcjSyS1e6RSXcAOVCFTZKV6psiZqzPhOpqyXc78V8ska6uq52gIi1KiTL2c1AgQ6UgsEsmv0xf+XBeHORl0IrQwehi/lB3h65vVkkSRQjjxN93GH639ZeP9Wk1IgVeXFKUWNuXKqSaBuoV9kYmr9ScoFL+JZIB+kXOdqEqn9/rrv+M4dPgWbgIxF6t4e8FkKss1M2JgM4/lSpsrblBZs2/+IsY4R042vkdAlj0db7FwJwL1cfWeXzQJ5pgRJYTcab6++hvFJW9Z06KlTT6xxUJZs8XYBQQ9MQ5T+Jih9BBaG6NnNgf4BgTJo5FT8aqs1VcoHbzSf1fkrISLvPqX6zAMN9+lb+nnmSnME1c7AA9b4NBZsgarvkBkP7cJSkv6tzR8PD7W1NO4feRBXL2lokejLU+FYnbZbJ32V43CL9w9kB/vbHqp1833ZDoj7Eh1ZJDByVrKwLo8SmWclWkLFVYxg5bqe47ca8AH9N//+k+2a28nj1v++Fp5AznS68kTR2hA3pKVH3rfeOjfwsNHIjZK9sKcvUt5YDmZ65O57OOwto/wiz8w8t5JSPbxe0+B2H2DtAS+ciAp4LHni6KIBBqvWpvL1xkytwBZfDT2EDXA1JKD7UD5Yu1v+/otMpKkWpa3+Bo8u9Ww6mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(2906002)(5660300002)(122000001)(6916009)(316002)(6486002)(508600001)(36756003)(4326008)(26005)(66946007)(91956017)(53546011)(8936002)(76116006)(71200400001)(82960400001)(86362001)(6512007)(2616005)(8676002)(38070700005)(66446008)(64756008)(66556008)(66476007)(31696002)(38100700002)(6506007)(83380400001)(31686004)(186003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUYrQy9MWEdtaVVGNzFMR2gwbVRBTy9vSEFRUU55MHpZMjJpWU82RVFSelB0?=
 =?utf-8?B?Ly9xZjRuYUVMOXpZdURUOXJNRTVyMFA5b1dPM3JTM2kyQzJjOVpUZWhkRUxI?=
 =?utf-8?B?ZGo4RmltbFNlU29oOEQ2ekhSWlpnSytFVFZPbDZRQ1h4QXN5RS9MQnpWOFI5?=
 =?utf-8?B?bU1xaUIrT25aSXpMQlpwdk0vd0xwb1JjeHEvQ1U4d0ZMa2ljQnNsUVZFb0wx?=
 =?utf-8?B?ZUZlNXpOR2F3ZWRVVzRLay9oWCtPMDJDVDIvUUVJTzc3TFp2cUtnQTRJcTZU?=
 =?utf-8?B?dllDRklhTUgzYXNvRFRZMTBJM0VzMHBjUGVnMVl5STZIUU83YWRGcGRtVHlB?=
 =?utf-8?B?dzVzdHRDRkYzaDN0U2g2QTBuVTczRUJTcWhhMXBYbVNyckhWdE1kZEI2RVQy?=
 =?utf-8?B?UEJBdFdqdlBySktJaWdvSTZ0UkQvd1JRc1ZBUVVqbTQ0SDlnK1Y1YmhROFpl?=
 =?utf-8?B?ajRwNEtHMnRwemhkUkFOTzVsQ3o3MW1qdnIyeGNZV1poV3Rlb2ZsZEE5SWVX?=
 =?utf-8?B?VWdJdUI5czdpbVFiVmxPM0xnMVpPUmdmT0JnOWVTbDJIUjJwbFQ0ZXYyOVRm?=
 =?utf-8?B?aWJzNk5LcXBKTG00U0xYVVR0WlpHV2M5M0pNc2hSYWpvWk5QSjl3cW1ITjZq?=
 =?utf-8?B?QUJtWmZHUW5sbHhPZGswQ0xwNlZDOUNEdlFlaWRzc0N6QWZBNm5nenFFcUZi?=
 =?utf-8?B?QTA0eG1ydExtNWNKdkhTeFdhTmZnb0hPSEQ5VWVOcndXTTNOc1NkNmpuVEUy?=
 =?utf-8?B?S0Y4YUY4OUx6eCtBYjlUOTlWNmMyL0phZnovYVNuMjl4U0dXZEY0RFdENEdu?=
 =?utf-8?B?TDkwajd1cy9wQ3VOQ0M5TENkeE9CSm5SU0NsVkovbnNiQjhHeFQ5OG5CVHJw?=
 =?utf-8?B?a1hmRXVaR3Nld3ZVUzk1RkR3ZEttbjVNdlhXTXZBRm95bkZIbkNrUEZmWkxB?=
 =?utf-8?B?ZWlZWnJJNW1mVFEwZkc0OEdGUHFtaXR3c1BKNkhMU2lTemVkbGRkb1VwNTYy?=
 =?utf-8?B?MUp2RXRhL21CT2U4OG5WZk8vUjJiQU1ldkl3d0V2LzFaejI5a0laVVk2Y1FC?=
 =?utf-8?B?UFFRNGIxSWJwZWVVTCtjSk5vTnpVa044Sy9zeXVoQVpGK3pFWUJhZDJtQWhK?=
 =?utf-8?B?ek0rUDllelJOSEwwaGpaZFpZL0tPaGNTTXNUOWZqenVzVTBBVnRNeWZYdkhD?=
 =?utf-8?B?cnB2Y3pxdERNdzBpZzY5aFY4aUdIWCtFdU4wVVhjOVFyejhuRnM3eTdNbWk3?=
 =?utf-8?B?ckpSY0M1UnJFMnNQQ2trcXVIRDJBNENJNUw5WTgrcGtJNnkyL0hFU0N6NU82?=
 =?utf-8?B?QWJSaEQydGlmZ2VWdlNwdTBYVkM1M2d3Z3BlajZhNnBGTjJZVnRqRW1NZis4?=
 =?utf-8?B?Tk5sbCtjZHhXUEIzMjV1RW5BVWM0N1FlMWxtM0JkUUZDWWJWVDZDQ1RWcm1s?=
 =?utf-8?B?ZGIzS0NWbHkzN2hwTDZuMW1lZVNDY0lyUlgxZHJ5UktMUExTcTVYVU5TQm4r?=
 =?utf-8?B?RGJ2OE55eFRPUXdwTy8yQmR0TVNYUWh1TnlheUw2K21ia2lmeDVxYmFnbjdN?=
 =?utf-8?B?NlJidko4cHlwMjlDZ2dERlU2TjVINC9QNGUrOERWWDlvODBLT0lvOEVkREh4?=
 =?utf-8?B?VXpuOG9ZOHlPSTBWeFJRSWVpN1BSQUNFQi8wM0FXTXJWUWxPVXZCNndqdlRr?=
 =?utf-8?B?UGVQdWRPZkdKZXpjdVd2MnNyOWkrRCsvVGp5K2FnY0ZoUnJva1dFaVVDVjJj?=
 =?utf-8?B?TzM5a2hOb1EwaHJUeFNmVEg1RGxXcFBjbURQKzZNZUs1R2tMMkhmdmYwMGF3?=
 =?utf-8?B?RHhaZzVpNDJvSnhzZjRuT0s3UzhyVEtBTmduZ3d2RHhrNnA4T05uUmgwemZn?=
 =?utf-8?B?S3hyV21IdGV5cThoYk9iakUwSDU3c1BTcHlacnI3R3c5clo5WU4wcUpMMTlo?=
 =?utf-8?B?N21qdDJ2Q2VxaFFPaW9PZkJBaklTbGUxMFJvb1lQcVU1V0VSVEttd2t1TEZq?=
 =?utf-8?B?ek1md2NMMkVVdWhDZElXMi8xT1hwcStxZmZ2OU1DZ0psU2RCc2cwd2REWDZ6?=
 =?utf-8?B?S1JxUXhDNkhtYVJZNTJOa1grd04yUDgyR0JFSGN3cXJyakxFbjROenQyMjV5?=
 =?utf-8?B?VGgvclE1R0JxVHZaR0p5M2Z4Q05EdGZDMEwvTEJpUjNRWTUvQjBzdTJRdm5C?=
 =?utf-8?B?VlU0cTViNGpPZmRoQURZMXlzampaOWh0eWNveC9ZT0FmNGJMN092V1VKQksw?=
 =?utf-8?B?YXNncjdmTmlCbmJVdnBMK016TlRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4F3A745680B5F4FACEF90C99B0722C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b74e8b2-a28c-45dd-eb4d-08d9e57e4e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 12:28:08.8254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJIeEse0LBeO0uCGbqlCmGmwvoJwBf+tFpoW3+WgTRFMZmyVyBfFiBSj8pssshwH9R+vpxElHy5ut9BEXaPSFaOOqy17qR/O5kZDTmtAJWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5351
X-OriginatorOrg: citrix.com

T24gMDEvMDIvMjAyMiAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDMxLjAxLjIwMjIg
MTY6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBIYXJkd2FyZSBtYWludGFpbnMgYm90aCBo
b3N0IGFuZCBndWVzdCB2ZXJzaW9ucyBvZiBNU1JfU1BFQ19DVFJMLCBidXQgZ3Vlc3RzDQo+PiBy
dW4gd2l0aCB0aGUgbG9naWNhbCBPUiBvZiBib3RoIHZhbHVlcy4gIFRoZXJlZm9yZSwgaW4gcHJp
bmNpcGxlIHdlIHdhbnQgdG8NCj4+IGNsZWFyIFhlbidzIHZhbHVlIGJlZm9yZSBlbnRlcmluZyB0
aGUgZ3Vlc3QuICBIb3dldmVyLCBmb3IgbWlncmF0aW9uDQo+PiBjb21wYXRpYmlsaXR5LA0KPiBJ
IHRoaW5rIHlvdSd2ZSBleHBsYWluZWQgdGhpcyB0byBtZSBiZWZvcmUsIGJ1dCBJIGNhbid0IHNl
ZW0gdG8gcHV0DQo+IGFsbCBvZiBpdCB0b2dldGhlciBhbHJlYWR5IG5vdy4gQ291bGQgZXhwYW5k
IG9uIGhvdyBhIG5vbi16ZXJvIHZhbHVlDQo+IGJlaGluZCBhIGd1ZXN0J3MgYmFjayBjYW4gaGVs
cCB3aXRoIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5PyBBdCB0aGUNCj4gZmlyc3QgZ2xhbmNlIEkg
d291bGQgYmUgaW5jbGluZWQgdG8gc2F5IG9ubHkgd2hhdCB0aGUgZ3Vlc3QgYWN0dWFsbHkNCj4g
Z2V0cyB0byBzZWUgYW5kIHVzZSBjYW4gYWZmZWN0IGl0cyBtaWdyYXRpb24uDQoNCkZvciBWTXMg
d2hpY2ggc2VlIFZJUlRfU1BFQ19DVFJMIChjb21wYXRpYmlsaXR5IHdpdGggRmFtMTUgdGhydSBa
ZW4xKSwNCndyaXRlcyBvZiBWSVJUX1NQRUNfQ1RSTC5TU0JEIChwcm9iYWJseSkgbmVlZCB0byB1
c2UNClNTQkQtYmVoaW5kLXRoZS1ndWVzdCdzIGJhY2suwqAgSSBzYXkgcHJvYmFibHksIGJlY2F1
c2UgSSB0aGluayB0aGlzIGlzDQp0aGUgbGVhc3QgYmFkIGltcGxlbWVudGF0aW9uIG9wdGlvbiwg
YnV0IHVudGlsIHdlIGhhdmUgd29ya2luZyBzdXBwb3J0LA0KaXQncyBzdGlsbCBhIGd1ZXNzLg0K
DQpGb3IgdGhlIHVsdHJhIHBhcmFub2lkLCBhIFZNIG1pZ3JhdGluZyBpbiB3aGljaCBjYW4ndCBz
ZWUgUFNGRCAoZS5nLiBmb3INCmNvbXBhdGliaWxpdHkgd2l0aCBaZW4yKSBzaG91bGQgaGF2ZSBQ
U0ZEIHNldCBiZWhpbmQgaXQncyBiYWNrLsKgIEV4Y2VwdA0KdGhhdCBTU0JEIGFsc28gaGFzIGFu
IGFwcHJvcHJpYXRlIHNpZGUgZWZmZWN0IHNvIHRoYXQgZXhpc3RpbmcgIkknbSBhDQpwaWVjZSBv
ZiBjcml0aWNhbCBjb2RlIiBzaWduYWxzIHRoYXQgaGF2ZSBncm93biBpbiB2YXJpb3VzIE9TZXMg
Y29udGludWUNCnRvIGRvIHRoZSBzYWZlIHRoaW5nIG9uIFBTRkQtY2FwYWJsZSBoYXJkd2FyZS7C
oCBHaXZlbiB0aGF0IHdlIGRvbid0DQphY3RpdmF0ZSBTU0JEIGJ5IGRlZmF1bHQsIHdlIHNob3Vs
ZG4ndCBkZWZhdWx0IGRpc2FibGUgUEZTRCBiZWhpbmQgYW4NCnVuYXdhcmUgZ3Vlc3QgZWl0aGVy
Lg0KDQpUaGF0IHRoZW4gbGVhdmVzIHRoZSBtZWFuaW5nIG9mIHNwZWMtY3RybD1zc2JkLHBzZmQg
YmVjYXVzZSBzc2JkIGlzDQpjdXJyZW50bHkgc3lzdGVtIHdpZGUgKGlmIGVuYWJsZWQpIG9uIEFN
RC7CoCBUaGlzIHNlcmllcyBjaGFuZ2VzIHRoYXQgZm9yDQpIVk0gZ3Vlc3RzLCBhbmQgaXQgd2ls
bCBjaGFuZ2UgYWdhaW4gc2hvcnRseSBmb3IgUFYgZ3Vlc3RzLCBhbmQgdGhpcyBpcw0Kb2J2aW91
c2x5IHRoZSBiZXR0ZXIgZGVmYXVsdCBiZWhhdmlvdXIuwqAgQnV0IHdlIGNvdWxkIGhhdmUgYSBz
eXN0ZW0gd2lkZQ0Kb3B0aW9uIG9uIHRvcCBvZiBndWVzdCBzdXBwb3J0IGluIG1vc3QgY2FzZXMg
aWYgc29tZW9uZSBzZWVzIGEgbmVlZC4NCg0KPj4gYW5kIGZvciBwZXJmb3JtYW5jZSByZWFzb25z
IHdpdGggU0VWLVNOUCBndWVzdHMsIHdlIHdhbnQgdGhlDQo+PiBhYmlsaXR5IHRvIHVzZSBhIG5v
bnplcm8gdmFsdWUgYmVoaW5kIHRoZSBndWVzdCdzIGJhY2suDQoNCkZvciBjb21wbGV0ZW5lc3Ms
IGZvciBTRVYtU05QLCBJQlJTIG5lZWRzIHNldHRpbmcgdG8gYXZvaWQgdm1lbnRyeQ0KaXNzdWlu
ZyBJQlBCLsKgIE1vcmUgc3BlY2lmaWNhbGx5LCB0aGUgVk1leGl0PT5FbnRyeSBwYXRoIG11c3Qg
bm90IGNsZWFyDQpJQlJTLCBhdCB3aGljaCBwb2ludCBoYXJkd2FyZSBrbm93cyB0aGF0IG5vdGhp
bmcgY2FuIGhhdmUgZ290IGludG8gdGhlDQppbmRpcmVjdCBwcmVkaWN0b3IuDQoNCg0KPj4gICBV
c2UgdmNwdV9tc3JzIHRvIGhvbGQNCj4+IHRoaXMgdmFsdWUsIHdpdGggdGhlIGd1ZXN0IHZhbHVl
IGluIHRoZSBWTUNCLg0KPj4NCj4+IE9uIHRoZSBWTUVudHJ5IHBhdGgsIGFkanVzdGluZyBNU1Jf
U1BFQ19DVFJMIG11c3QgYmUgZG9uZSBhZnRlciBDTEdJIHNvIGFzIHRvDQo+PiBiZSBhdG9taWMg
d2l0aCByZXNwZWN0IHRvIE5NSXMvZXRjLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFByZWZlcmFibHkgd2l0aCB0aGUg
YWJvdmUgZXhwYW5zaW9uIGFuZCB3aXRoIG9uZSBmdXJ0aGVyIHN0eWxlDQo+IGlzc3VlIChzZWUg
YmVsb3cpIHRha2VuIGNhcmUgb2YNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KVGhhbmtzDQoNCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L2VudHJ5LlMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5LlMNCj4+IEBAIC01
NSwxMSArNTUsMjMgQEAgX19VTkxJS0VMWV9FTkQobnN2bV9oYXApDQo+PiAgICAgICAgICBtb3Yg
ICVyc3AsICVyZGkNCj4+ICAgICAgICAgIGNhbGwgc3ZtX3ZtZW50ZXJfaGVscGVyDQo+PiAgDQo+
PiAtICAgICAgICBtb3YgVkNQVV9hcmNoX21zcnMoJXJieCksICVyYXgNCj4+IC0gICAgICAgIG1v
diBWQ1BVTVNSX3NwZWNfY3RybF9yYXcoJXJheCksICVlYXgNCj4+ICsgICAgICAgIGNsZ2kNCj4+
ICANCj4+ICAgICAgICAgIC8qIFdBUk5JTkchIGByZXRgLCBgY2FsbCAqYCwgYGptcCAqYCBub3Qg
c2FmZSBiZXlvbmQgdGhpcyBwb2ludC4gKi8NCj4+IC0gICAgICAgIC8qIFNQRUNfQ1RSTF9FWElU
X1RPX1NWTSAgIChub3RoaW5nIGN1cnJlbnRseSkgKi8NCj4+ICsgICAgICAgIC8qIFNQRUNfQ1RS
TF9FWElUX1RPX1NWTSAgICAgICBSZXE6IGI9Y3VyciAlcnNwPXJlZ3MvY3B1aW5mbywgQ2xvYjog
YWNkICovDQo+PiArICAgICAgICAubWFjcm8gc3ZtX3ZtZW50cnlfc3BlY19jdHJsDQo+PiArICAg
ICAgICAgICAgbW92ICAgIFZDUFVfYXJjaF9tc3JzKCVyYngpLCAlcmF4DQo+PiArICAgICAgICAg
ICAgbW92emJsIENQVUlORk9fbGFzdF9zcGVjX2N0cmwoJXJzcCksICVlZHgNCj4+ICsgICAgICAg
ICAgICBtb3YgICAgVkNQVU1TUl9zcGVjX2N0cmxfcmF3KCVyYXgpLCAlZWF4DQo+PiArICAgICAg
ICAgICAgY21wICAgICVlZHgsICVlYXgNCj4+ICsgICAgICAgICAgICBqZSAxZiAgLyogU2tpcCB3
cml0ZSBpZiB2YWx1ZSBpcyBjb3JyZWN0LiAqLw0KPiBXb2xkIHlvdSBtaW5kIHBhZGRpbmcgdGhl
IGluc24gb3BlcmFuZCBwcm9wZXJseSwgaW4gbGluZSB3aXRoIGFsbA0KPiBvdGhlcnMgbmVhcmJ5
Pw0KDQpPb3BzIHllcy7CoCBGaXhlZC4NCg0KfkFuZHJldw0K

