Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172257E30F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373295.605417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtgp-0001y1-2K; Fri, 22 Jul 2022 14:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373295.605417; Fri, 22 Jul 2022 14:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtgo-0001vb-VX; Fri, 22 Jul 2022 14:31:38 +0000
Received: by outflank-mailman (input) for mailman id 373295;
 Fri, 22 Jul 2022 14:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAbQ=X3=citrix.com=prvs=1958f3fd3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEtgm-0001vT-Ku
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:31:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8cee34-09ca-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 16:31:34 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jul 2022 10:31:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5826.namprd03.prod.outlook.com (2603:10b6:303:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 14:31:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.028; Fri, 22 Jul 2022
 14:31:29 +0000
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
X-Inumbo-ID: fb8cee34-09ca-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658500294;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=0yx9l+JCziqpt4/8vgwPPTFtZRpxE7WZ6ZYYHa1Jmxg=;
  b=hMGoutCj2hSsB3r9BO8xAOQrRhKQnX7xWH4dMf+7gebQKRij4sq4wOrK
   uoHs3DIDB8Yymy50X1F+gZ5MaN+G50W6c2ZfJXb72uz8WT3kGjyilbpQw
   jCxyOsMzIXttudxj2WgcnIZmichX2G8KdZCJe5gCYqzwnIDqcfjgsAAP0
   k=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 76421545
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:j4tbI69GXT+qjrOEpg2bDrUDIX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jFOCGCGO/mLMzChfItzYd60pBkG6MODm9FiHQA4qCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8Ew15qyo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGEkAEE505p9ROJj929
 /YlDiJONU2NvrfjqF67YrEEasULCuDOZdpallQ+iDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+iLHsB9wr9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXbrij127OS9c/9cKEcEZOSyKFlu1GSxXIoDgdGBEOLuNDs3yZSXPoac
 ST44BEGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZslnOL64iJvyAz6Y6
 zKFti8lnJ0IkNUGka68+DjvqT+2uoLASAJzwwzNR3+k9StwfovjbIutgXD74PBaPcCmR1+Ol
 HEeno6V6+VmJZSEjimEWugONLCv+feeMTfYjEJvHp8u7DCk8TioeoU43d1lDEJgM8JBdTq3Z
 kbW4FpV/MUKYyPsarJraYWsDchs1bLnCdnuSvHTaJxJf4R1cwiEuippYCZ8wlzQraTlqolnU
 b/zTCpmJS9y5XhPpNZue9og7A==
IronPort-HdrOrdr: A9a23:6tZIea8Vh2em/1ULxoJuk+Fvdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQgdcdDpAtjifZtFnaQFqrX5To3SJDUO31HYZr2KjLGSiwEIfheTygcz79
 YGT0ETMrzN5DtB/IvHCWuDYrAdKbC8mcjG69s2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GDQMkHboUwTAjnZuBOlaDLY0LDErHhRMbs9uatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAcqqOYmwtWrQcotQ0qbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3kYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZ2feKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4vqfaWK
 6xI2+wmVRCBX4GU/f+o6Gj2iq9MVmVTHDq1txU4YR/t/n1WKfrWBfzOGwTrw==
X-IronPort-AV: E=Sophos;i="5.93,186,1654574400"; 
   d="scan'208";a="76421545"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgJfpdWkLXesJwvEy87BSbzvusZ5/A9rKRqPNeiwgJ03dv1zT0cpSubdKfH5bCoFYnRaYFIdhiUppkgDkE/+kEXjEDNtjze9bR+GldqxnlmU+/lz34RfFEjAn6un/jUlOEXXRR7oi1mTAOyijmSz9aoEUrN2ct8q1ebFxDIGabwdeEahqjoHxprSZ3TBwZxEK66hvAFOIiLDdRMo97d0ixicqrJ7TjpK2FY6XOhX9ay1AfAXpEHgC/+Jm5Bi7jiPwh7yFYgdjfySLQrtU/4lywym02E6KBTbhX3CyGYzg0mPqFuLTOn7bCGZGm3bcdQa5gR68nYb65ase4VG3elUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yx9l+JCziqpt4/8vgwPPTFtZRpxE7WZ6ZYYHa1Jmxg=;
 b=ELahwZitsamR3Lt8F70lDi/to8/l/TIfFC3lOj/3SeeJGdu1Pz39lS8aW1URAdJPIpBrh4hs8YD4LJzS8jQCmURiUoCU/gppahGc0LOyCfQwXn0rsGtczMqZ2phvpUbVhfLyG0nQ9UsGulmBciDehK/16LWDYP40AUimprkIOfgL8yD+jpV670WZPYY1mP9f1nLMOS7Lh32k5cDgShLeEqU2IN/cbxvel5x4ok0LN3zBumqedSTrSKc4+JaorsKfgkjLKM2H8GnhNb6HUMdxzvDgFka5IM5Gmx3rQE1ckYz48qoIsSJaRpkA9ip/45A/OF1KWlrcWiuzLyDnwOUysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yx9l+JCziqpt4/8vgwPPTFtZRpxE7WZ6ZYYHa1Jmxg=;
 b=i3u3BeOPKJoefcwhQnmUEIWEIQNd1x+7naxo/s/bmCWcIeuhvyL9NYl7MQLY0ALBq+0Y52zKzqOxtO66LmBFYOxNz00LZBQkEuS8lW1SfOYZs8a2XfE5scovDVfFm3Ct2vo+fZBxrYpNNvDgb0GNiCKySCkg28zRV4GOk7VFhfg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Henry
 Wang <Henry.Wang@arm.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Licensing issues
Thread-Topic: Licensing issues
Thread-Index: AQHYnde78ZWweQEF5EuUvPBrJgjmBQ==
Date: Fri, 22 Jul 2022 14:31:28 +0000
Message-ID: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27ff810f-18b1-4504-4f4d-08da6beedd9a
x-ms-traffictypediagnostic: CO1PR03MB5826:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 W5INVu7LFLzbcAc3xQwzrYhmrgM24qyQttw/++fl1ugf0eNDvXiTuyngC+D7XiXWdpztstqzBbrWjZGt2qHFjWaXHAZuyOPv07ptU0a7Y9WdrymKEBYnt8e2TVKJUEzh0COJrpGTh58SAHJzotjcw7LMbxeZ3kTOYjYoM9LGJnXiOWHJVamwBd/5l6q3ksOCqzEZkgUKNlB/c1BmWOA1eHvn1Rnta6GlfbqChmUjCjYBRsapRY+SacQPjMKk7jiHP47PrzxtAcI8qeKOgH/6rQMYbcuKyIS8R6jUXm6qpebBpHoofo9nNfIDtMt4E41UOAmEqYJW1ESp/k6v8swWbcZsdlekpu6BaQSQU+wCucZxW/a55X9jI05MFLH0Boye4SEulWWtkIGXSUJ5Tpzo6WXxrfyC8Ned8yrTnzstFWs0VxkCO0CSUbdfIqW9RJyY8X1CkCAWtff581dxTDrHkpgnVcUQc0LsAkwJfcq5Sre/fGpba0wdLP0UVgGVS4ZBLHZk28GvptlfiiJ9wZZdP89UQRWazsQJiAuXIWQ03572w/6eNM5qJS1EXxsmrTNgFjUkVdXjF+l9gBYTmQKsCFUksrAYGfzasvDLlz7P3qlJVkuddSVLOX1f5T+L6s3xruWQqInH1Qa3445UbyWxB4Q2MvsjxCXBRSGAnOdGG2iRy7I7jHskO191x1mwn+UhrE4CKrf+I2NC/+kgZ6v29Eq9BiRFfFaC2RyZcHVNKjyIRP42ducGHx4eam5IqUl7vXm1ncTr8lMaQOH/Eidk4WsruhqPdboRlObQZ817KikPZ5CiD/DzCew6NQzWWWSzpiLGIgyUnQ1lxOidPWJEWWUcQ/gsSgZXOwaE29BtzDTqBQ9LK4/uTVmpsJr3hOJ1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(91956017)(122000001)(76116006)(6506007)(186003)(36756003)(4326008)(54906003)(6916009)(8676002)(82960400001)(66446008)(66476007)(66556008)(64756008)(66946007)(316002)(31686004)(38100700002)(7116003)(38070700005)(86362001)(2616005)(8936002)(6486002)(31696002)(478600001)(5660300002)(3480700007)(71200400001)(6512007)(26005)(83380400001)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnBpR0VtMXhoMTZabEF5WHVDcEpmYjQ0eHlnQXYzYkRFVE1nYUVaZ1hPM2Y0?=
 =?utf-8?B?cWdtamE2M2lCM2NNS1M1c3F5dEE2L2ZtUnBMemxYZ1d6NG1wZmJvMTVTUFpO?=
 =?utf-8?B?UklaR204MDNiTTM1SVNKNDNXUmNiOWVVRUttcHliR2ZYN0g1VDVmWmNVYUEz?=
 =?utf-8?B?WFdtd2Q5cFhKSzQ5WnE1MjdTcXJDY3dCSExsMmtDWXF1OStnVHoxNnVYOW5E?=
 =?utf-8?B?NUFYVnBZTWxXSndEUlZmQjYrRXJSRzJQQUtuclJwYytmS0p6RndXMDVGdWtC?=
 =?utf-8?B?SnlrdFBGRmxPaWVwMkM5bEY3ZVdZSHU4MnVPS2NNK0ZkRjdtdGt4WnMzNlJr?=
 =?utf-8?B?dXNmZlJKR3QydjhxRFBuSDBvN2ZJOHk2WUc2L3h0VFp5WmRSYWhmTExoTDI5?=
 =?utf-8?B?Vjh2a1BuRjBTdzRZYzN1U01NQk92Uk1TZmlhdFBtc04yNEZQKzJyMkUzb2Y3?=
 =?utf-8?B?OEQvT2x5LzFzU2dpelJRcFZLUExYbWRIQkZrTjlrYW1xSUJ3Y3RvQlVBbTBM?=
 =?utf-8?B?b2xURXlJV3hneDFMWWExdFNMM2taNzhiQnp1bHlnQXkvU09Pc3hMM1VieUZD?=
 =?utf-8?B?MkNlOFF4UWVUSkc4Qmg2b1dlM210WHU2WDJpaFdDSTRIa2h1OG5Kdi9ZVERJ?=
 =?utf-8?B?ekhqOEl3ZzR2UUJOR2xzbkw0bHhFOWlFTks5U3pYQ1RUdnN3TzB4K3MzMFRE?=
 =?utf-8?B?bjdjZ3pIdWxOQThTRHhZTm0zb2J3ZmlFRnZlUE1nMW9QZEppSXJ2N1lxWVBi?=
 =?utf-8?B?cEt1WUg4cVRUOG5hSXBNOEo0c2NGeFY5VDFxRCtFeU9qeTRabWxjV1lmUkZY?=
 =?utf-8?B?QklHS0V3QldlZy9tMnkvajJ5eldpa3p2dTJic01ET09vS0JoYitHemVISjZQ?=
 =?utf-8?B?Tmc0cDVla2docnZhay9kMktETm9lYmZRL3U4bis5Q0xQODNzWjBzcU9QZUtP?=
 =?utf-8?B?RzJtQTJsVUlDcWpDY3BxalZBQVZTZ1VLM3c2bm45RlpaZkQyQ1dDanFOR3Jm?=
 =?utf-8?B?QWxXUDgydktQVlNmRXEzdE56RUtOdloxU0FDaW1qMHl1eGdYMEZEcXk5Q0Fh?=
 =?utf-8?B?U1BUT3hQaXFuUVJZYmFiUHIwWWtPWlBJVFBiaU5RcFV3NXVRQURQNk1Nc3Iv?=
 =?utf-8?B?YlpNcFlkdkJBdHRxeU5taGhmQW5WTmRzd01ZUkRyUm5POWlYekp3MmNTRHFW?=
 =?utf-8?B?MUFmOGM4akNqMFlzL29NcVZzTzdYN0grTVRPeWkzNHdOQzg2SGhIQmQ4Vm5V?=
 =?utf-8?B?SGF5Uk9kZkdVTVJweHBhSGZ1ellOTnpqQUwzemN1SkRXOEdvQlE4YkFGQmRN?=
 =?utf-8?B?UGFSMlhWTEMvZmdJVDVXM0pGcUNzeXJpVkEwWU53ZmNTV2RRWlJKeFUxbHo5?=
 =?utf-8?B?dXI2cnBGOUxyNmI5UmJaSVBxRGxxS0V1Nm16dXA4V2RaTmtKTWkyUDI0ZE5R?=
 =?utf-8?B?Q05XYlFXWExldlZnRzJBM3ZMUHBUTmY2aGhEbXJ6bVkyeHg1M3pZUFpNWWpY?=
 =?utf-8?B?YkNaK0xNZ1l0eEdJNjlMeGJCS2lLRmpOZWh5a3lhZ3dJbU9SS3ZOSzVvV1Z5?=
 =?utf-8?B?VjNxdEN6L0FlbGF5NkRMeUdZTDVpUlNHQ0hIK3d2d0NTT1ovWklESVpWVVN1?=
 =?utf-8?B?UWVwS1c5Z2JOV0w5SktydmxHSk1LNHB0Q0dybFVjTU5pcWdPeGhzWEgvWTl1?=
 =?utf-8?B?M1R5ZmxqMlZCUmxlSGNJcW5jQlI5NXlFd2VBbFlqN3ljNFdMaWJSQ1ZkRDZY?=
 =?utf-8?B?R3FJTTNBUjV5Z2dZZy9OWWd1VEtoZTU3ZzFiUTBXeWErdU1sQS9wbDJ4UDZn?=
 =?utf-8?B?RzJSeTVRQ3pyYW9BQjByT2RabkpwM3hnN21sNWhzdVBvakpHR1pxMDJ4UWMw?=
 =?utf-8?B?UjJwZ1EwQW0vMVVQSXUzQlhlK0E2Qk1jb2FoQU1LRnhDUTkvbWI5ZWhiY2JF?=
 =?utf-8?B?RzhiUng2cGY3VWliaVFiejhBOGF3cG94KzZCK2JPR1A0Z09JNXRlZ2pBOEpC?=
 =?utf-8?B?MWVrTkVKaTVLQ1lZL0ZTQktaKzBQbmk2NDhGaTZubnRNbEpqRzBTMmVPbWtH?=
 =?utf-8?B?UHFJUmREeWxuK3RDZEJKY1puOFpOSlFzYmxCZm5QSGhtTThhRmtGQjZwTytn?=
 =?utf-8?Q?oQ7+GGchxYHlCkNdk4h8WvwKF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E39FBED587E962459006EA5BD783D688@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ff810f-18b1-4504-4f4d-08da6beedd9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 14:31:29.0143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7AV1njCxpPR1452iHCRzPlg2mJBms7l8QaZoswrLPeE9VLHUy1asoaBg3nRY610Va14O+tZVcfQ+xXKG+tDY1GzAJgcBbVC/rmwHSYbHH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5826

SSd2ZSBiZWVuIGNyb3NzLWNoZWNraW5nIGxpY2Vuc2luZyBkZXRhaWxzLCBhbmQgd2UgaGF2ZSBz
b21lIHByb2JsZW1zLg0KDQoxKSBXZSBpbnN0YWxsIHhlbi9pbmNsdWRlL3B1YmxpYy9DT1BZSU5H
IGludG8gL3Vzci9pbmNsdWRlL3hlbi9DT1BZSU5HLA0Kd2hpY2ggaXMgbm90IGNvbW1vbiBwcmFj
dGljZS7CoCBUaGUgaW5zdGFsbGVkIGZpbGUgaXMgbW9zdGx5IHVzZWxlc3MNCmJlY2F1c2UgaXQg
ZGlzY3Vzc2VzIGZpbGVzIGJhc2VkIG9uIHRoZWlyIHhlbi5naXQgcGF0aHMuDQoNCjIpIFdlIGFj
dHVhbGx5IHVzZSB0aGUgTUlUIGhlYWRlciBmb3IgdGhlIHB1YmxpYyBpbnRlcmZhY2UsIGJ1dCB3
ZSBkb24ndA0KYWN0dWFsbHkgY2FsbCBpdCBieSBpdCdzIGNvbW1vbiBuYW1lIGFueXdoZXJlLg0K
DQozKSBUaGUgZm9sbG93aW5nIGZpbGVzIGFyZSBtaXNzaW5nIHRoZSBNSVQgaGVhZGVyOg0KDQov
dXNyL2luY2x1ZGUveGVuL2ZvcmVpZ24veDg2XzMyLmgNCi91c3IvaW5jbHVkZS94ZW4vZm9yZWln
bi94ODZfNjQuaA0KL3Vzci9pbmNsdWRlL3hlbi9mb3JlaWduL2FybTMyLmgNCi91c3IvaW5jbHVk
ZS94ZW4vZm9yZWlnbi9hcm02NC5oDQovdXNyL2luY2x1ZGUveGVuL3N5cy9nbnRhbGxvYy5oDQov
dXNyL2luY2x1ZGUveGVuL2RldmljZV90cmVlX2RlZnMuaA0KL3Vzci9pbmNsdWRlL3hlbi9lcnJu
by5oDQoNCkZvcmVpZ24gYXJlIGF1dG9nZW5lcmF0ZWQgZnJvbSBoZWFkZXJzIHdpdGggTUlUIGxp
Y2VuY2VzLCBzbyB0aGF0J3MgYW4NCmVhc3kgZml4Lg0KDQplcnJuby5oIHdhcyBhbiBvdmVyc2ln
aHQgd2hlbiB3ZSBhZGRlZCBpdC7CoCBUaGVyZSdzIG5vIHByb2JsZW0gZml4aW5nDQppdCwgYXMg
aXQgaXMgY292ZXJlZCBieSBtdWx0aXBsZSBzdGF0ZW1lbnRzIGVsc2V3aGVyZSBpbiB0aGUgdHJl
ZS4NCg0KZGV2aWNlX3RyZWVfZGVmcy5oIGlzIHByb2JsZW1hdGljLsKgIEl0IGNhbWUgaW50byBl
eGlzdGVuY2UgaW4gYy9zDQoxYzg5OGE5ZmVjN2U0IHdoZW4gc29tZSBMR1BMIGNvZGUgd2FzIG1v
dmVkIG91dCBvZiBsaWJ4bCwgYW5kIHNvbWUgR1BMDQpjb2RlIHdhcyBjb3BpZWQgb3V0IG9mIFhl
bi7CoCBTbyB0aGVyZSdzIGN1cnJlbnRseSBhbiBHUEwrTEdQTCB2cyBNSVQNCmxpY2Vuc2luZyB2
aW9sYXRpb24uDQoNCkkgaGF2ZSBub3QgbG9va2VkIHRocm91Z2ggaGlzdG9yeSwgYnV0IGl0J3Mg
bGlrZWx5IHRoYXQgdGhlIGNvcHlyaWdodCBpcw0KY292ZXJlZCBieSBpbmRpdmlkdWFscy9jb21w
YW5pZXMgd2hvIGFyZSBzdGlsbCBhY3RpdmUgbWVtYmVycyBvZiBYZW4sDQphbmQgSSBkb24ndCBh
bnRpY2lwYXRlIGFueSBwcm9ibGVtIGdldHRpbmcgaXQgZm9ybWFsbHkgcmVsaWNlbnNlZCAoaXQn
cw0KanVzdCBhIGZldyBjb25zdGFudHMpLCBidXQgdGhpcyBkb2VzIG5lZWQgZml4aW5nLg0KDQpz
eXMvZ250YWxsb2MuaCBpcyBtb3JlIGNvbXBsaWNhdGVkLsKgIEl0J3Mgc3RhdGVkIGFzIHB1Ymxp
YyBkb21haW4gd2hpY2gNCmlzIGZpbmUgZm9yIG91ciBwdXJwb3NlcywgYnV0IGluY29uc2lzdGVu
dCB3aXRoIGV2ZXJ5dGhpbmcgZWxzZSwgYW5kIHdlDQpuZWVkIHRvIGFkanVzdCB0aGUgdmFyaW91
cyBmaWxlcyB3ZSd2ZSBnb3Qgd2hpY2ggc3RhdGUgdGhhdCB0aGUgZnVsbA0KcHVibGljIEFQSSBp
cyBNSVQuDQoNCkJ1dCBpdCBkb2VzIHJhaXNlIGEgZGlmZmVyZW50IGJ1Zy7CoCBXaHkgZG8gd2Ug
aGF2ZSByYW5kb20gbGludXggaGVhZGVycw0KY29tbWl0dGVkIGluIHRoZSB0cmVlLCB1c2VkIGJ5
IHNvbWUgdXNlcnNwYWNlIGxpYnJhcmllcz8NCg0KQW5vdGhlciBlcnJvciBJIGZvdW5kIHdoaWxl
IHBva2luZyBhcm91bmQgaXMgaW8vbGlieGVudmNoYW4uaC7CoCBUaGlzIGlzDQp0aGUgaW50ZXJm
YWNlIGZvciB0aGUgZG9tLT5kb20gdmNoYW4gc2hhcmVkIGhlYWRlciBzbyBvdWdodCB0byBsaXZl
IGluDQp0aGUgWGVuIHB1YmxpYyBoZWFkZXJzLCBidXQgaXQgaW5jbHVkZXMgPHN5cy90eXBlcy5o
PiBmb3Igbm8gbmVlZCwNCmV4Y2x1ZGluZyBpdHMgdXNlIGluIG5vbi1wb3NpeCB1c2VjYXNlcy7C
oCBBbHNvIGFsc28gb3VnaHQgdG8gYmUgZml4ZWQNCmZyb20gaGF2aW5nIGEgemVybyBsZW5ndGgg
YXJyYXkgdG8gYSBmbGV4aWJsZSBtZW1iZXIuDQoNCg0KNCkgSSdtIGdvaW5nIHRvIHN0YXJ0IHB1
dHRpbmcgdG9nZXRoZXIgc29tZSBmaXhlcyBzb21lIG9mIHRoaXMuwqAgSGVucnk6DQpSZWxpY2Vu
c2luZyBkZXZpY2VfdHJlZV9kZWZzLmggaXMgYSByZWxlYXNlIGJsb2NrZXIuDQoNCkknbSBhbHNv
IGludGVuZGluZyB0byBzdGFydCB1c2luZyBTRFBYIGlkZW50aWZpZXJzIHRvIHNhdmUgb24gYWxs
IHRoZQ0KYm9pbGVycGxhdGUuwqAgVGhleSdyZSBhbHJlYWR5IHVzZWQgZWxzZXdoZXJlLg0KDQpJ
J20gdGVtcHRlZCB0byBwdXQgdG9nZXRoZXIgYSBjaGVjayB3aGljaCBjYW4gcnVuIGluIENJIHRv
IHRyeSBhbmQNCnByZXZlbnQgbWlzdGFrZXMgbGlrZSB0aGlzIHNsaXBwaW5nIGluIGFnYWluLCBi
dXQgaXQncyBnb2luZyB0byBiZSBvZg0KbGl0dGxlIHVzZSB1bnRpbCBpdCBpcyB1c2VkIGluIHBy
ZS1wdXNoIHRlc3RpbmcuDQoNCn5BbmRyZXcNCg==

