Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31F5826F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376169.608761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgRU-0007pw-CO; Wed, 27 Jul 2022 12:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376169.608761; Wed, 27 Jul 2022 12:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgRU-0007n9-8c; Wed, 27 Jul 2022 12:47:12 +0000
Received: by outflank-mailman (input) for mailman id 376169;
 Wed, 27 Jul 2022 12:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGgRR-00072V-IZ
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:47:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38fa3d0f-0daa-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 14:47:08 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 08:46:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5515.namprd03.prod.outlook.com (2603:10b6:806:b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 12:46:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:46:50 +0000
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
X-Inumbo-ID: 38fa3d0f-0daa-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658926028;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0qISryQ9rNGSgvE/QLjbWx0uIyXwCUUkFfqeYJOve8s=;
  b=dAXdCGZfTSApCkTLJrMAIBAYzd6XEQdR0pkltpoonDwJGzdlIOyLb7Sj
   f8LsMB9YMZrgJvS0B8cisCeOU4K6dw29dNfaPK4i5wfRNV5i2l97bNdyb
   mTMaZTTiHz3P4XkLbPSP1zgD0IQ/Newhz62Ox6/dXhLmpxct2Ufgf/v4N
   s=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 76529251
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:THmPkKMfi7HOF/PvrR2JlsFynXyQoLVcMsEvi/4bfWQNrUpxhD1Tx
 zQXXWnXOP7cM2PwfY93bI609kgGusDcnd5jGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMtPjc8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPH2edlNEQ3FLYA3cgrK2J8x
 fMVeAo0O0Xra+KemNpXS8FKr+F6dIzBGtxavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rjwwCCnK1W0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4LCk2vfryvEaunnuQWjaYZRFLGD+fc13H6t7FQ9CDARbA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2JWJSHe15rqS6zSoNkAowXQqYCYFSU4P5YblqYRq1hbXFI87SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:o01+OK2rMsa1XBGmbhziaAqjBK8kLtp133Aq2lEZdPUzSL37qy
 nOpoV56faaslsssR0b9exoW5PhfZq/z/BICOAqVN/INjUO0FHYSb2KhrGC/9SPIULDytI=
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76529251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUPIPub54G4MY8Aj2uIN+9Iw92XbOvPzkKeMqnGW3pRzYqoT8g3HNnrsBAa7eYj2uaAjHNOoGYa4+jKJqD9SFc1MFNvgUYupzs20NMT9rL1XCwrA2qug74Sy+uMNe0hIvlA5c2Hn0EMYOS6LCW6reetY7RUjPYKeCj8vqr9LtF6BOFv4WthDnk3i0gbRBEBvlwdK7gJr/4Pxncawig9Ael9/PCICq76l38a51oQOge/MN1H1lvorJQvY3Jf7ZFS8xuKucVtRtFTgzk7eSG+OpzvbBlrhJcavqu/L55skhN1AiJttvIFmgEfYNT5ZkQO1ulPRtODeaaxf2VJGoQYZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qISryQ9rNGSgvE/QLjbWx0uIyXwCUUkFfqeYJOve8s=;
 b=REadaCjUO+0cxMeVaOPmyPKmY+ZF8mSMZgQsDb6WN5NzQSiX/RuLDMt1fPJzvYpJci/AGqcVmD4H7wCBstsXCowL4KccvaBQFURxyuMkT3F3q3Hh+VoU4FceWvqzo78e8GSVjGegpXnU2NOLQLwyNEuu5l/Fj26l8In0Q+0FLtJdSMqRsgKd3RB7MLjKB3EPzwb6mg4paOvot7jsqh6PEeztZbCRDXjG7v68DMhuor5H+45j1R+2Fudf2wTOxjO5JMHWNt2UcWOGe8WajA5EnYkhCpfJBaP2HuuQ/TfReWWqgRf4OhppXlfzw0Vsi0p7UujfzMbXSc3PbJbzj5a2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qISryQ9rNGSgvE/QLjbWx0uIyXwCUUkFfqeYJOve8s=;
 b=T9CZTZukcnhZm+4WeQLPvNmHAxjSnhh0ru64znGJvenlXNbzbg5TQ+GhmmqZfnexz43EUcUR/8Wgvd8B/hUsipFsZRvh1U6ZwDg/CvGaEdKN+ZJULzYuFAwcrnwqAwVEbtnlViuU0ifoU0qehzwbyo/1qzDce6AOy9m06qNwiiU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Thread-Topic: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Thread-Index: AQHYoQlhV37xX0Hh2kWLBKJVPAkGN62SK82A
Date: Wed, 27 Jul 2022 12:46:50 +0000
Message-ID: <6c5b5339-f645-4214-bc53-2b7ead004367@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
In-Reply-To: <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 343dd74d-99d4-4ef0-94e7-08da6fce1348
x-ms-traffictypediagnostic: SA0PR03MB5515:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MNUOLW31BDt0r9SmOx2gausWerZ7rE3tnlTqFPikKldfCXZWCjguCUH5RVMau2cAUIrx60fMg6dAkUe58lgE5EvKGuCiMlIur441Qrqm8qwYJBGwSBsI/8/fb7wv1pCjPNr6lQpMTsNB/7goCgqyGyu3r3lRGf5eaJMp3Kds/hIbco8phWWpl02/ITwHtlzDJ/mJaW1NEVCVSPxhNyk0b9tiJl46PVZzmT/YUqugUeEdnxQ7W9Fau2NK5UC3ApVixO/N2w776D0vIBgF/hxL2UFzPlUP2OvqeE3R4bhMEom26Ux98F1UL7XFUxHeM3Uc5B+nUTPD7n1BziLeVx7OSZ3BVto8xAq3AqTnmeUeydmx32DegdKzz6cdoFBKIS4/4d/Ym3x8OW3qd08GGEX9y09X9fl0RCEafNUTtg+tipfGaLtdE8BCgeQnZZx+gR8HldEZaoMWJa4lOeLAPJkZzUFBF9Gl8Joj9jNiIeklAYCRSg5mo5qpodiIBHMhrAbYgfLOU5/2G4l6K2VOWamQwi0Vc+7nagO5cR0bqED3WFAk+9IV6VFYrg6Ds4rmJaMES7VEiVhb/X0Ehb7ih81c/W1OKAN891kgCi4/ZHYULjZkGA04tho8jYFaymlpNyyA6H5rp0gfcxzyLi3+DjTGyy4+iwBqYgKlwgRQXlc3iYP4kDDiI4reRVdpujggoKXKWySOSSUHTeV8nSAP1meZmpYc22IU264T/InfdxXtyNvSUh2aqI7yIXsUkCMMhJlBdFhi+cI7QT9EJTfkrpf5b+8Wa5jC4x/FskzsI7SNEKdBzO1DrGrUBLmH52X++M2zlcM9q0oMmXk2jQU3KVS/FjoihJMnx4tLT97vrp3YMgYirerT0R5AXTBGnY2K/0aN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(110136005)(54906003)(36756003)(38070700005)(6486002)(2616005)(316002)(31696002)(186003)(8936002)(122000001)(2906002)(31686004)(38100700002)(5660300002)(8676002)(91956017)(76116006)(82960400001)(64756008)(83380400001)(6506007)(66476007)(66446008)(4326008)(53546011)(6512007)(41300700001)(66946007)(478600001)(71200400001)(66556008)(86362001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHRaYVRDQXQzbWpXT1dLaklBYTNyRHVjYUhlWHQ2d3FIbHZDcWh1RGNReGtI?=
 =?utf-8?B?aWc4djZpL2xoUkNjWVlqb2NpZmhrVWZGYks4TFBRL2thQWd5MTlybituQXF6?=
 =?utf-8?B?ZVJBclhYUWdoZFMyakdENFhNZlpvc2xpeWdORlVqSW44NGpaMlJhTG5CbGJW?=
 =?utf-8?B?SmE4RFZydjZxZWFKbkMySlVPVU1PYUlFQkpmN0REMFpKSTU2aDB6NFRYRlI2?=
 =?utf-8?B?ZHBCeDlpb214eE0vb2QzdkV1d2w3ay9XWWUzOU56TFhaR25zd1dMbFVmM0Rr?=
 =?utf-8?B?emxpWHdKZjM3QWk1Tk9LeEpkNXhoZnhmRmRCY2tqWGo4UGUyNytDeDU0Wml1?=
 =?utf-8?B?SGFoemxDNWlvZVNBZTlPVFlCUDd0L1JMRzVGb2ZFZm9mQ0wyNGZIb1hNQ2Zj?=
 =?utf-8?B?U3VEZkM0Q0p3WWFpTFplQ1RuV0xiakpaT2Zyei8vQ3ZyRkpvbXpFMGtFV1N3?=
 =?utf-8?B?dVh5UVBsbDRrYmhqZUtlNCtwYXBFbFZKT3ZsREhWL0hNbVZiMG94NWNhZkdS?=
 =?utf-8?B?UUdlZy90VmFYWnNzcEVvaUVmUEt2OGJCOUdoT0hvMDJuUlpLcklEQ0ZDR2lp?=
 =?utf-8?B?TXBPR0lrOHVyVS9pazNiZzJCYlBUSjllREpJWm5DNC9EeGUzNGxtbFFkN0Z1?=
 =?utf-8?B?UVlpb2dWLzBkd2c3WWNUeFRIRGI2QTFTanZKLy9kRXRpSnpMMmM5WHBEZldn?=
 =?utf-8?B?Y0pUdUIxOXM2d3JqbGJKcHEwcWc3a3ZMdnJGRzR4dVU4VTlienVHZklCeC9X?=
 =?utf-8?B?aFY0S2lBc01tUkFGQXdxSEM1ZDV3TXdiSEZBd2NoTWVRcVk4eE5kazRZV0g0?=
 =?utf-8?B?Vk1rZzc5WDF1VVlDNUJRbGtDSVR1Zi9FVXV4SEFURWIvZ3dQVW96eStCL3Zl?=
 =?utf-8?B?U3hzbXB4QTBXUkxBSk9Kd3UxNnN0VUNLZmJ0eUtEOFFtVFhQQzZXanJnNWZW?=
 =?utf-8?B?Tm5RZDNQNGJ3QUJ3SnoxVjFOdktqZCtrUGppTS9ra05YajZtK1htQ01FL2JZ?=
 =?utf-8?B?YnNCcnR1M0Jsdmd4QWxpYmRFTnhSTGhvS1ZFd2VxeThYQUNwT1BLQ2ZBanNy?=
 =?utf-8?B?cDVWZUNDeFVtUjhMUFVIbTNWUDd6MEQ4bXlUYm5rK0pJbFlIRVg0aTh6clBP?=
 =?utf-8?B?QXppU0dPRGgrSWtHSDE3a3VhRWd3MUJQSkkrUFdyVk81S2RRWEluY09wLyt4?=
 =?utf-8?B?SWdMWEwzRC9YOXEvRDN2TWhZSERRMG9QS28rK3lzMjRMYldZQ3R6UC9nMDla?=
 =?utf-8?B?bHdnSTdKYnM4VVhXNjVKb3ZWN3ZoTmU1eHhMWi9RZDZjdUpmZ2NtTk5zZWlo?=
 =?utf-8?B?R1RNbnBsOWdoODRqR2ZldkZZYVh3VENiMk1ZaHUwMkkyenZhY3NCRisxejlt?=
 =?utf-8?B?M0trVEp4VDkvT3ViNXRNZHJBWWc5M09kbk03eE5CWGZDSVlDL2Fzai9MSmZD?=
 =?utf-8?B?RDdOMmgyYjIzY21aZ2ZKUTlPOGlXVTV4WFRXek1aSjBHeGlURnRwYkRIQlh1?=
 =?utf-8?B?Q3p0ZWJzOW1oL3ZOdDFQN0hKbEs5R0g4UFpJS1lqcldiQUkyM2lhWVQ0Slow?=
 =?utf-8?B?M2RwWmxEMXFmZ2I3MU82cEVLc0YrQVJyY0Fkb3A0anlmUjlKS3JGK0dCdDF4?=
 =?utf-8?B?MWN5TWNvYlNLTXFmdHpSUnpCb3FzTmVoOUxpalIzMSt4Y250M3NWc0ZrbXdi?=
 =?utf-8?B?TnJJSjFldTJPR1dzNldRR0FLci81Q1BoTWhKOHJZMGZWc2xRdlI0RzBCUTcr?=
 =?utf-8?B?OEl2QTU2Ni8wcFE1bEtSVXZGcnRxQWJtV1c5ZGtDUUZ1OHRGdW5ZR25wVVox?=
 =?utf-8?B?UXRPOTBxSEQ1WVNpSUNnWFBGSlhzWTI1MTcyK1NHM0RmR2FqaGd4NXNpMm9a?=
 =?utf-8?B?VDBjYzdzMmo2OWlLVk1vMDBoWDBDNS9IV2laOGJuTVEvT0NwN2ltOGdTcHN3?=
 =?utf-8?B?S3BUczhCcVBGanlKdFg3WUpWZzBrTXpWdFRFSnRyR28wZDRYbU56d1BCVUlq?=
 =?utf-8?B?dStIand0bzl6eTJ2Q0JkZFJZSGFQNDR2STJBUTJ3b0s2QTAxdjErWC9oeDNP?=
 =?utf-8?B?Rjc3SjVodUpNZzIyb1hJOHVNVGo0MUNWRjRROTdZa09SOUI3RHFiYk9sMGln?=
 =?utf-8?Q?4ZDYT4i9LPm5bNPnJbJKeccW9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68EEB6B7299488448897B4D4B5A743F0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343dd74d-99d4-4ef0-94e7-08da6fce1348
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:46:50.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JITR6PxupmZYOIFsQY/nMlcByEK7gr8mgxr3BRTnim95k15UndWulGpTfF2afga/dFXgSOq6rLeRpIP+wpEztznxnDQpTs7DgryVWrD4jTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5515

T24gMjYvMDcvMjAyMiAxNzowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdlIHNob3VsZCBub3Qg
YmxpbmRseSAoaW4gYSByZWxlYXNlIGJ1aWxkKSBpbnNlcnQgdGhlIG5ldyBlbnRyeSBpbiB0aGUN
Cj4gaGFzaCBpZiBhIHJlZmVyZW5jZSB0byB0aGUgZ3Vlc3QgcGFnZSBjYW5ub3QgYmUgb2J0YWlu
ZWQsIG9yIGVsc2UgYW4NCj4gZXhjZXNzIHJlZmVyZW5jZSB3b3VsZCBiZSBwdXQgd2hlbiByZW1v
dmluZyB0aGUgaGFzaCBlbnRyeSBhZ2Fpbi4gQ3Jhc2gNCj4gdGhlIGRvbWFpbiBpbiB0aGF0IGNh
c2UgaW5zdGVhZC4gVGhlIHNvbGUgY2FsbGVyIGRvZXNuJ3QgZnVydGhlciBjYXJlDQo+IGFib3V0
IHRoZSBzdGF0ZSBvZiB0aGUgZ3Vlc3QgcGFnZTogQWxsIGl0IGRvZXMgaXMgcmV0dXJuIHRoZQ0K
PiBjb3JyZXNwb25kaW5nIHNoYWRvdyBwYWdlICh3aGljaCB3YXMgb2J0YWluZWQgc3VjY2Vzc2Z1
bGx5IGJlZm9yZSkgdG8NCj4gaXRzIGNhbGxlci4NCj4NCj4gVG8gY29tcGVuc2F0ZSB3ZSBmdXJ0
aGVyIG5lZWQgdG8gYWRqdXN0IGhhc2ggcmVtb3ZhbDogU2luY2UgdGhlIHNoYWRvdw0KPiBwYWdl
IGFscmVhZHkgaGFzIGhhZCBpdHMgYmFja2xpbmsgc2V0LCBkb21haW4gY2xlYW51cCBjb2RlIHdv
dWxkIHRyeSB0bw0KPiBkZXN0cm95IHRoZSBzaGFkb3csIGFuZCBoZW5jZSBzdGlsbCBjYXVzZSBh
IHB1dF9wYWdlKCkgd2l0aG91dA0KPiBjb3JyZXNwb25kaW5nIGdldF9wYWdlKCkuIExldmVyYWdl
IHRoYXQgdGhlIGZhaWxlZCBnZXRfcGFnZSgpIGxlYWRzIHRvDQo+IG5vIGhhc2ggaW5zZXJ0aW9u
LCBtYWtpbmcgc2hhZG93X2hhc2hfZGVsZXRlKCkgbm8gbG9uZ2VyIGFzc3VtZSBpdCB3aWxsDQo+
IGZpbmQgdGhlIHJlcXVlc3RlZCBlbnRyeS4gSW5zdGVhZCByZXR1cm4gYmFjayB3aGV0aGVyIHRo
ZSBlbnRyeSB3YXMNCj4gZm91bmQuIFRoaXMgd2F5IGRlbGV0ZV9zaGFkb3dfc3RhdHVzKCkgY2Fu
IGF2b2lkIGNhbGxpbmcgcHV0X3BhZ2UoKSBpbg0KPiB0aGUgcHJvYmxlbSBzY2VuYXJpby4NCj4N
Cj4gRm9yIHRoZSBvdGhlciBjYWxsZXIgb2Ygc2hhZG93X2hhc2hfZGVsZXRlKCkgc2ltcGx5IHJl
aW5zdGF0ZSB0aGUNCj4gb3RoZXJ3aXNlIGRyb3BwZWQgYXNzZXJ0aW9uIGF0IHRoZSBjYWxsIHNp
dGUuDQo+DQo+IFdoaWxlIHRvdWNoaW5nIHRoZSBjb25kaXRpb25hbHMgaW4ge3NldCxkZWxldGV9
X3NoYWRvd19zdGF0dXMoKSBhbnl3YXksDQo+IGFsc28gc3dpdGNoIGFyb3VuZCB0aGVpciB0d28g
cHJlLWV4aXN0aW5nIHBhcnRzLCB0byBoYXZlIHRoZSBjaGVhcCBvbmUNCj4gZmlyc3QgKGZyZXF1
ZW50bHkgYWxsb3dpbmcgdG8gYXZvaWQgZXZhbHVhdGlvbiBvZiB0aGUgZXhwZW5zaXZlIC0gZHVl
IHRvDQo+IGV2YWx1YXRlX25vc3BlYygpIC0gb25lIGFsdG9nZXRoZXIpLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgYWx0aG91Z2ggd2l0aA0K
c29tZSBvYnNlcnZhdGlvbnMgYW5kIGEgc3VnZ2VzdGlvbi4NCg0KPg0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vc2hhZG93L2NvbW1vbi5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMNCj4gQEAgLTE1ODEsNyArMTU4MSw3IEBAIHZvaWQgc2hhZG93X2hhc2hfaW5zZXJ0
KHN0cnVjdCBkb21haW4gKmQNCj4gICAgICBzaF9oYXNoX2F1ZGl0X2J1Y2tldChkLCBrZXkpOw0K
PiAgfQ0KPiAgDQo+IC12b2lkIHNoYWRvd19oYXNoX2RlbGV0ZShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBsb25nIG4sIHVuc2lnbmVkIGludCB0LA0KPiArYm9vbCBzaGFkb3dfaGFzaF9kZWxl
dGUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBuLCB1bnNpZ25lZCBpbnQgdCwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IHNtZm4pDQo+ICAvKiBFeGNpc2UgdGhlIG1h
cHBpbmcgKG4sdCktPnNtZm4gZnJvbSB0aGUgaGFzaCB0YWJsZSAqLw0KPiAgew0KPiBAQCAtMTYw
NiwxMCArMTYwNiw4IEBAIHZvaWQgc2hhZG93X2hhc2hfZGVsZXRlKHN0cnVjdCBkb21haW4gKmQN
Cj4gICAgICB7DQo+ICAgICAgICAgIC8qIE5lZWQgdG8gc2VhcmNoIGZvciB0aGUgb25lIHdlIHdh
bnQgKi8NCj4gICAgICAgICAgeCA9IGQtPmFyY2gucGFnaW5nLnNoYWRvdy5oYXNoX3RhYmxlW2tl
eV07DQo+IC0gICAgICAgIHdoaWxlICggMSApDQo+ICsgICAgICAgIHdoaWxlICggeCApDQo+ICAg
ICAgICAgIHsNCj4gLSAgICAgICAgICAgIEFTU0VSVCh4KTsgLyogV2UgY2FuJ3QgaGF2ZSBoaXQg
dGhlIGVuZCwgc2luY2Ugb3VyIHRhcmdldCBpcw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
KiBzdGlsbCBpbiB0aGUgY2hhaW4gc29tZWh3ZXJlLi4uICovDQo+ICAgICAgICAgICAgICBpZiAo
IG5leHRfc2hhZG93KHgpID09IHNwICkNCj4gICAgICAgICAgICAgIHsNCj4gICAgICAgICAgICAg
ICAgICB4LT5uZXh0X3NoYWRvdyA9IHNwLT5uZXh0X3NoYWRvdzsNCj4gQEAgLTE2MTcsMTAgKzE2
MTUsMTQgQEAgdm9pZCBzaGFkb3dfaGFzaF9kZWxldGUoc3RydWN0IGRvbWFpbiAqZA0KPiAgICAg
ICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgeCA9IG5leHRfc2hhZG93KHgpOw0KPiAgICAgICAg
ICB9DQo+ICsgICAgICAgIGlmICggIXggKQ0KPiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0K
PiAgICAgIH0NCg0KVGhpcyBlbnRpcmUgaWYvZWxzZSBibG9jayBpcyAiZGVsZXRlIG1hdGNoaW5n
IGVsZW1lbnQgZnJvbSBzaW5nbGUgbGlua2VkDQpsaXN0Iiwgb3BlbmNvZGVkIGluIGEgdmVyeSBj
b25mdXNpbmcgd2F5IHRvIGZvbGxvdy7CoCBJIGNhbid0IGhlbHAgYnV0DQpmZWVsIHRoZXJlJ3Mg
YSB3YXkgdG8gc2ltcGxpZnkgaXQuwqAgKE5vdCBpbiB0aGlzIHBhdGNoLCBidXQgZm9yIGZ1dHVy
ZQ0KY2xlYW4tdXAuKQ0KDQo+ICAgICAgc2V0X25leHRfc2hhZG93KHNwLCBOVUxMKTsNCj4gIA0K
PiAgICAgIHNoX2hhc2hfYXVkaXRfYnVja2V0KGQsIGtleSk7DQo+ICsNCj4gKyAgICByZXR1cm4g
dHJ1ZTsNCj4gIH0NCj4gIA0KPiAgdHlwZWRlZiBpbnQgKCpoYXNoX3ZjcHVfY2FsbGJhY2tfdCko
c3RydWN0IHZjcHUgKnYsIG1mbl90IHNtZm4sIG1mbl90IG90aGVyX21mbik7DQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L211bHRpLmMNCj4gQEAgLTEzMiw3ICsxMzIsOCBAQCBkZWxldGVfZmwxX3NoYWRvd19zdGF0
dXMoc3RydWN0IGRvbWFpbiAqDQo+ICAgICAgU0hBRE9XX1BSSU5USygiZ2ZuPSUiU0hfUFJJX2dm
biIsIHR5cGU9JTA4eCwgc21mbj0lIlBSSV9tZm4iXG4iLA0KPiAgICAgICAgICAgICAgICAgICAg
IGdmbl94KGdmbiksIFNIX3R5cGVfZmwxX3NoYWRvdywgbWZuX3goc21mbikpOw0KPiAgICAgIEFT
U0VSVChtZm5fdG9fcGFnZShzbWZuKS0+dS5zaC5oZWFkKTsNCj4gLSAgICBzaGFkb3dfaGFzaF9k
ZWxldGUoZCwgZ2ZuX3goZ2ZuKSwgU0hfdHlwZV9mbDFfc2hhZG93LCBzbWZuKTsNCj4gKyAgICBp
ZiAoICFzaGFkb3dfaGFzaF9kZWxldGUoZCwgZ2ZuX3goZ2ZuKSwgU0hfdHlwZV9mbDFfc2hhZG93
LCBzbWZuKSApDQo+ICsgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KDQpJJ2QgcmVjb21t
ZW5kIGNyYXNoaW5nIHRoZSBkb21haW4gaGVyZSB0b28uwqAgSSBrbm93IHRoZSB3ZSd2ZSBhbHJl
YWR5DQpnb3QgdGhlIHJldHVybiB2YWx1ZSB3ZSB3YW50LCBidXQgdGhpcyByZXByZXNlbnRzIGNv
cnJ1cHRpb24gaW4gdGhlDQpzaGFkb3cgcGFnZXRhYmxlIG1ldGFkYXRhLCBhbmQgSSBoaWdobHkg
ZG91YnQgaXQgaXMgc2FmZSB0byBsZXQgdGhlDQpndWVzdCBjb250aW51ZSB0byBleGVjdXRlIGlu
IHN1Y2ggY2lyY3Vtc3RhbmNlcy4NCg0KPiAgfQ0KPiAgDQo+ICANCj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9wcml2YXRlLmgNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9w
cml2YXRlLmgNCj4gQEAgLTM3NSw3ICszNzUsNyBAQCBzaGFkb3dfc2l6ZSh1bnNpZ25lZCBpbnQg
c2hhZG93X3R5cGUpDQo+ICBtZm5fdCBzaGFkb3dfaGFzaF9sb29rdXAoc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgbG9uZyBuLCB1bnNpZ25lZCBpbnQgdCk7DQo+ICB2b2lkICBzaGFkb3dfaGFz
aF9pbnNlcnQoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIG4sIHVuc2lnbmVkIGludCB0LCBtZm5fdCBzbWZuKTsNCj4gLXZvaWQgIHNo
YWRvd19oYXNoX2RlbGV0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiArYm9vbCAgc2hhZG93X2hhc2hf
ZGVsZXRlKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBuLCB1bnNpZ25lZCBpbnQgdCwgbWZuX3Qgc21mbik7DQo+ICANCj4gIC8qIHNo
YWRvdyBwcm9tb3Rpb24gKi8NCj4gQEAgLTc3MywxOCArNzczLDE5IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZA0KPiAgc2V0X3NoYWRvd19zdGF0dXMoc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgZ21mbiwg
dTMyIHNoYWRvd190eXBlLCBtZm5fdCBzbWZuKQ0KPiAgLyogUHV0IGEgc2hhZG93IGludG8gdGhl
IGhhc2ggdGFibGUgKi8NCj4gIHsNCj4gLSAgICBpbnQgcmVzOw0KPiAtDQo+ICAgICAgU0hBRE9X
X1BSSU5USygiZCVkIGdtZm49JWx4LCB0eXBlPSUwOHgsIHNtZm49JWx4XG4iLA0KPiAgICAgICAg
ICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBtZm5feChnbWZuKSwgc2hhZG93X3R5cGUsIG1mbl94
KHNtZm4pKTsNCj4gIA0KPiAgICAgIEFTU0VSVChtZm5fdG9fcGFnZShzbWZuKS0+dS5zaC5oZWFk
KTsNCj4gIA0KPiAgICAgIC8qIDMyLWJpdCBQViBndWVzdHMgZG9uJ3Qgb3duIHRoZWlyIGw0IHBh
Z2VzIHNvIGNhbid0IGdldF9wYWdlIHRoZW0gKi8NCj4gLSAgICBpZiAoICFpc19wdl8zMmJpdF9k
b21haW4oZCkgfHwgc2hhZG93X3R5cGUgIT0gU0hfdHlwZV9sNF82NF9zaGFkb3cgKQ0KPiArICAg
IGlmICggKHNoYWRvd190eXBlICE9IFNIX3R5cGVfbDRfNjRfc2hhZG93IHx8ICFpc19wdl8zMmJp
dF9kb21haW4oZCkpICYmDQoNClRoaXMgaXMgdGhlIHNlbnNpYmxlIHdheSBhcm91bmQgYW55d2F5
LCBidXQgdGhpcyBpcyBhbHNvIGEgZ3JlYXQgZXhhbXBsZQ0Kb2YgYSBwcmVkaWNhdGUgd2hpY2gg
cmVhbGx5IGRvZXNuJ3Qgd2FudCB0byBiZSBldmFsX25vc3BlYygpLg0KDQpXZSd2ZSBnb3QgYSBn
cm93aW5nIHBpbGUgb2Ygc3VjaCB1c2VjYXNlcywgc28gcmVhbGx5IGRvIG5lZWQgdG8gZmluZCBh
DQpwcmVkaWNhdGUgd2UgY2FuIHVzZSB3aGljaCBpbmRpY2F0ZXMgInNhZmVseSBub3Qgc3BlY3Vs
YXRpb24gcmVsZXZhbnQiLg0KDQp+QW5kcmV3DQo=

