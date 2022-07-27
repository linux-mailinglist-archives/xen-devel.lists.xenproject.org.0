Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C097582734
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376193.608804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgbw-0002oN-4P; Wed, 27 Jul 2022 12:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376193.608804; Wed, 27 Jul 2022 12:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgbw-0002mA-1H; Wed, 27 Jul 2022 12:58:00 +0000
Received: by outflank-mailman (input) for mailman id 376193;
 Wed, 27 Jul 2022 12:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGgbu-0002ly-BM
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:57:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb367685-0dab-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 14:57:56 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 08:57:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6987.namprd03.prod.outlook.com (2603:10b6:a03:43b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 12:57:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:57:52 +0000
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
X-Inumbo-ID: bb367685-0dab-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658926676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YXBIJbRcPcNK1frr5weoB4MVBG20k3YcTGS5TKPeX5E=;
  b=PFGYyHOp7RsTLGmx3zHN6Wdy0TiDvQeYi8kvM9AnovyV/4XmhfMxgUdS
   wMFpVR1ISz3091A2Wrrj0CUoPxTVo8PH3U/kjwKhyFLHZJYg3cIoOgg4n
   Kgl/IFBzs2vtX4+45AZGCIk5EOaIt64JVmo66mUpDW7M6J57vIr5ceS34
   w=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 76737663
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:x3DKK6omahBKojELLazVPTcKZ2teBmI0ZBIvgKrLsJaIsI4StFCzt
 garIBmEbvbZZGejKtskaIm/oR4DuJWDyoRlSAFkrSkwEHtDoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lH5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUkw/4tXmBHy
 cA8KSAXUBycvPin+eqSH7wEasQLdKEHPas5k1Q5lXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NvsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2bGQxnylBtl6+LuQzNp2gwKcl2MoJAw2TgD8jPzklG2GRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuuOC09PWIEIygeQmM4D8LLpYgyilfKUYxlGavs1tntQ2iok
 naNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:L4VFx6r1tpOjYpDsyRG7icoaV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFb/l/1swKp5KuZ3IMvB0vFvLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsul6SR4IeMNYYDGRfzO2wGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76737663"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mayc0HgpNh8zWoi3VJ3P3+045yBkybS6MZG/E+qW+L+tv1k3RcvVA2rqPN35LdXQBJY5npYvIJ7noWUKLx3XcgpMM5yj4Q78tKu8YDXP+Y9frD/yQHT8ueb7raLirnqMiNwHwKvmKjqIND+lNBpAZfjznI5kejsLwJjH17V3/gTn11y3drEyjSMRbFaVxqT+IXYAQX+w1HUOI7LGoc//zTTNsMwVY6ufKMoATQh8Piz2bpbu5ttfPBE/mM56z/q/7na8EJu7mIIQHV5lRsIOsCobqAhoYuQ1rhzz4EENSTAcj/IwRvUDgE0UymI8jqJ10gxixyBujky8WqBnp5sP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXBIJbRcPcNK1frr5weoB4MVBG20k3YcTGS5TKPeX5E=;
 b=Uq84Kb04DLaKkJczqvf1XGkbJIzmEPoe4cYIEm4bVmYjX+0yvkBq+ovZm7C7Cn2bp5W2vGGBrfAtUqKAh8MHCfI6qstqpxhdI+HVPRv1I7WA3MPY5jU25wBzsOQVwS6JPD6ec9eTdFruvGbXdaOXKVU1QitmqOkpgd5F33kTiZxIDGfa/panvTVRjPzVd9V1fCRuSOtA8c7e5JD4j5EZ2tai5s5APfMxFn6qxcPYFqEK94jL2RBlFkB3Dso84ESznp/ri/35HgH6U6uODQywF20/Vt0fVNiljWHDoxUlvudNk68xGrDbUiWLys/Jnvb969G2ree9NDzJc+nnfXHN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXBIJbRcPcNK1frr5weoB4MVBG20k3YcTGS5TKPeX5E=;
 b=PiMYcvyHBPg1YdtbBPaJ2YV9mhSRtnm0ecuiuMMLpK4FfdK+aJzCsBS5EciirbKuV+u3V4XdSytK6BmzrVDAFzYi0KraTqJ2brkiiAmOC1Zd8oxv9zwTDtNb22CyzyhF/a6IL5A7//vNcUwL/W4RRO6pJlJ9Xl99URH9/WPTsO8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86/shadow: drop CONFIG_HVM conditionals from
 sh_update_cr3()
Thread-Topic: [PATCH 6/8] x86/shadow: drop CONFIG_HVM conditionals from
 sh_update_cr3()
Thread-Index: AQHYoQmtxh8Uz5Bps02ppMm24Q1Niq2SLuIA
Date: Wed, 27 Jul 2022 12:57:52 +0000
Message-ID: <a2969f9f-d537-2876-63c8-e6c5674f9e4d@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <03ef104f-91a5-596b-235d-1a0fa47963e4@suse.com>
In-Reply-To: <03ef104f-91a5-596b-235d-1a0fa47963e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88709425-e2d6-43e4-897d-08da6fcf9e11
x-ms-traffictypediagnostic: SJ0PR03MB6987:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0ofX9+gSnqdLWOeUKDMpOcWsdga66pmF11ngxBfiI4H7yBVEoTQmEeLefUFVT0rCTjLyfVGI+sFMQEfZz1rETj+0rWNcaXJkmP/mVgBqcbAJpIicZpZD7jIaA25JoBZDAebGVAxUOeZgRR5Qyuxp2SBbLGWM9D8bR0k4iiY1IZ0HNtzuCUQg/q+0G314KKATyp5lGzjPCnK9hd1EUpu5OujitbLaM3mNM7fNovfIsAklK3TgVZJ2y8p5iVCMvXjYKejfIoDXgsZmPAL8YaYQuMOo+L7bsutqcNnajnRhFczNteizEbUWjZUYKuardey3gSHvpM3QiHo0xSx19yfsMTvFMHyw+TNG33r3rPGw8yKySiGzF59AGvFikrkbmv9gW6+eyeskVUhPQ14Ld3CLQ1QXDyKquN5YKJm9oqnMTd4eiRuaVXSuWmvV5dDty+0SbojHoN0/SCGi4QM01pSIhfwdP6ECYyD4rUggOPDjhs2EyaRVzIp4Nn0WGydZ4YQEqyLPR7UjsOz/X7okQGUFlH/qsXQ/eQRMEzhaUVQTYZ6wUUEo6ncprtWzX42pupkYdI3g/UpN+0zqR9XewFxcoK9n2akeFLgX7RRdd/WCvC4Md545/gwxgOfXADCs1lU+AKFgVUSYg9DcS19roVFwISI9ZM9/V1N0Mdr3IV1Y7zFXY6YsP8K+V1LdWiY1YcNOuwX08MESYnJpg+g+BgX0KcitJ6Xd/rX8loyY9Lz09CPgac3t4t2/n65YnyioUM0EgF5txkthpVju8hw4ZdZqjkVWzzqlRKHMULyEVDgLWZbinUfVAbURfpKxROaGnY3wrddq3xFZ4AFO5x8tzaACn83Ot18jtSLZDgYOtmNfM62+hFuWPhveBmtJ0C8btZdV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(4744005)(8936002)(5660300002)(71200400001)(110136005)(2616005)(38070700005)(31696002)(6486002)(86362001)(36756003)(54906003)(2906002)(478600001)(31686004)(64756008)(66476007)(66946007)(91956017)(66556008)(76116006)(316002)(186003)(53546011)(4326008)(41300700001)(6512007)(26005)(8676002)(66446008)(82960400001)(6506007)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qzh0eXFSSVluaHZvcUNpSkJRb0ZzM0ZCZzlTc0pQbElnRXM3ZC9QTE8rNVNI?=
 =?utf-8?B?YnNENERsenluMktOWFpMU05UL200bEMzZnlEL3A2cW5UQTJIS2lRdklyZS9X?=
 =?utf-8?B?SEtnNi9tcEdzaS9sZ3g3RTBLYkdBYmJ5SEM2NmlNanZMaC9ONW9kY3RXWXVG?=
 =?utf-8?B?bEhpbFZzRUpNQkZrNnpORUpVY1lZUHpmOThBZnFwWVJ1NTNqMDRkc0wrWEd5?=
 =?utf-8?B?S3prdVp1bWdFMS9SMW5XMTFZMHFjN2hqK2Jyd2s0RFBxcjcwNWZjRGRIYjJE?=
 =?utf-8?B?cmVwRDl2ZnRaa1ZzaWV0Vm5RZFRDd05pdzE0RmtOSGtGZVFLODl2SVBPd0ZI?=
 =?utf-8?B?Sy94Z3hSYzFvaHlHWVRqSTNtN2RhWWExS21RMzY2NXRpUElkdnRlSFlnWDlR?=
 =?utf-8?B?ZzVWZkRDOFFCTHRHRXNVQXhYZzFOdGtvTnZ5WU42K2FPeEcrZWRkeHE1b1JT?=
 =?utf-8?B?OUJXZkgwZDl2TnhVY0tJQnd3Z095WThScitWQU9hanphcVR6SXRyVE03UHF3?=
 =?utf-8?B?YXk3MUhxck4wT2F6NkhuaGcyU0RDdXJSVm9BNUdWd2VXK2JtWmZ3c3VyWExn?=
 =?utf-8?B?QmhsVFUwY2dpUFd4NmZNdUtUaUFtN0RCRmVVMWZqWmpycVBNZGJyenFhN3E4?=
 =?utf-8?B?d3IxWmh4ZnRQQkl4ZENRM2p4TUxWL01EMFpxd21DVkNwaHY1S2VNNDFNM0Nz?=
 =?utf-8?B?QUVJSzEvV1BIZURnOTBLNytPMk1UUWpxRmxvZFNYVHB6a3pJSHh4RGhyM1BN?=
 =?utf-8?B?VmxQZE5jbGJmU2lVRW1GUDFlei9LMDJUTE9nL3Y2TnVSZktZcUpZdzhSTFZ0?=
 =?utf-8?B?T2IzQW93d1BPbVk2MmlHQTEvZE43WmNvTFlXYkdqbVFLVVFGV00vVDBBYm5T?=
 =?utf-8?B?VUxMN2FJb0lUd3lnUVBZWFJGL0FVK3h2elNQUU5YZU5ObkR1WStBdDJSY1hz?=
 =?utf-8?B?TGNwMy8vb21JTVoyV0tsUzVkU093MnUxSmNab1QwUnNpQmo5R3dmaWJ5a3RJ?=
 =?utf-8?B?dUI3TmFKRTZVdTZMeWNFNU9NVTEveCtKQkE1WkxqNUk4b2IyUFhsUCtjWnpj?=
 =?utf-8?B?ZFFNWmRoeHpLNmVCVkZPR1VQMmxHVkdsVVNxQWI4SUVxeVJSVXF3Y2ZuWjBm?=
 =?utf-8?B?UG01MlM3QytSaS9LaHB4SzdOd3NvaGlzQmZabTlKaFVwK0k0WU5URloyc1R1?=
 =?utf-8?B?N21ya3dxU20rR3BsK1F1MXd2WkdWSW9qRXBBN1ZrdmR2K1BqSFQxbnZ5QnJV?=
 =?utf-8?B?UWFBWU8wa1lXaTJXM1hHVERKeTMyRHY5N0sveXF6WFcrVEQ0aEFJNjhybHNx?=
 =?utf-8?B?RGNGS2t3QXZvdWNhV3ZoVERkVkJpckNrWUtmb2lUWW84Q3pVZzBWYVZIdDFI?=
 =?utf-8?B?TStwTXhyWW1kaTdKMURWUnVWL2JEN0tNRjhsa0U1R2tUUEZMYmxwbjhxQjZQ?=
 =?utf-8?B?dmhKcGJMNzN1VUJLcjV6WWhUeUxjWHJYdlhRV0d0aENJeTIreGx5MUNUOFk0?=
 =?utf-8?B?T1E0MENFcEdyME5XVVNKRjU0UExUYXVQTHZ2bVFWUUd5YldsQWZRTVoxeStH?=
 =?utf-8?B?OHhCcW9DTFladWZ4LytPazNyWXFybjdTaUZGNVVzUTkraXVjdFJpYk11R212?=
 =?utf-8?B?TzcvR056YUJ3ditOVDZ4QzNub2kwdjlFa0dCMllURGdOa3R6TFl6eHFUL1VT?=
 =?utf-8?B?czJna2RoeGF1dmJOUk5GNTdyQjNzSkJhSXhuSEN5QVRFUHdTT3VlNFBKcWRP?=
 =?utf-8?B?UXdXZVdOVENwRUc2R2JEK3g0Z3hnblJtS2NUTUwxZ01jOUoyQVBlY2RaZlhU?=
 =?utf-8?B?S2ZGK3NZazFmZXhZMDVENzhVdDRnRDZWb0VWaWNEc1BlcmRJYW05cFBjeEpQ?=
 =?utf-8?B?NXRRSE55MHhBM056aGNtdFdkNzRXSXZtdUI2YVlIdWg3TlViWUkrL29KbC9j?=
 =?utf-8?B?WGZSbXh2UHAwV3Y5THA1cEVuSmUxa2V1WnAxT1pndE1jMGJlR3VNcGVNcFhD?=
 =?utf-8?B?dHJTVU5JcVhlTHBSUS9XWitadjZXdFR2MTIwem1FbW80R01rNFhlaFhUVGNR?=
 =?utf-8?B?T243NDhGb01sai8yTURDTHFxTkZjMG5KUEIyZllLQVNsekNMWlZoUmFzUFUr?=
 =?utf-8?B?QzFSRi80R1k3Z1Fwd0MvNFByWU5jRlQ5WkthMFhIYUNqc2cxVHRKdWt0T1Jp?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68A426244D9CDF49B5058D53391DCD51@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88709425-e2d6-43e4-897d-08da6fcf9e11
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:57:52.6740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/cRuxqCwVKwvSJKwbcznhEnlVWEi/7zlIekydsim8SwQai88gcmQbNhHng6kVRFaal0dOKn6grX9gCHwbrhz/H6rG9Qx/SkgjRxg0MtCrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6987

T24gMjYvMDcvMjAyMiAxNzowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE5vdyB0aGF0IHdlJ3Jl
IG5vdCBidWlsZGluZyBtdWx0aS5jIGFueW1vcmUgZm9yIDIgYW5kIDMgZ3Vlc3QgbGV2ZWxzDQo+
IHdoZW4gIUhWTSwgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdGhlc2UgY29uZGl0aW9uYWxz
IGFueW1vcmUuIChBcw0KPiBzb21ld2hhdCBhIHNwZWNpYWwgY2FzZSwgdGhlIGxhc3Qgb2YgdGhl
IHJlbW92ZWQgY29uZGl0aW9uYWxzIHJlYWxseQ0KPiBidWlsZHMgb24gc2hhZG93X21vZGVfZXh0
ZXJuYWwoKSBhbHdheXMgcmV0dXJuaW5nIGZhbHNlIHdoZW4gIUhWTS4pIFRoaXMNCj4gd2F5IHRo
ZSBjb2RlIGJlY29tZXMgYSB0aW55IGJpdCBtb3JlIHJlYWRhYmxlLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

