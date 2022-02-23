Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6594C10B8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277313.473765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpIW-0004UG-Nr; Wed, 23 Feb 2022 10:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277313.473765; Wed, 23 Feb 2022 10:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpIW-0004RA-K6; Wed, 23 Feb 2022 10:55:04 +0000
Received: by outflank-mailman (input) for mailman id 277313;
 Wed, 23 Feb 2022 10:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMpIU-0004Qq-Tn
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:55:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b699167-9497-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:55:01 +0100 (CET)
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
X-Inumbo-ID: 0b699167-9497-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645613701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kpPF6xDDLuQWj+BKNENicyzQmEuv9NVwrzNrMbausI8=;
  b=MEDFgEtYIlzHezFkcqoH3aczbci1wjhySNclgi5eMaQmXX4ueXrFL+6f
   AyhUo3O/0bdDqL2xqerADlTZa7YAwrlzAYZi7hLt1/qysOjSVVKX6xWLe
   4YM5HPyeS+REfyE0/KYLWF7EuMypoE4nn6ZJtFMq6xNJDRiHUpEfcex+O
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64237353
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UMMul69RWzf9px/Iee11DrUDkn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2dLUWzQMqqDNmanKYpzPo/l8UpS7JGAxtAwGVQ5+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24LiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbzqcDkxAoDFo7UQUCdgNzheEY5d4YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZDMmU0MU+ojxtnJXkNBYMat7eUokbAIzZZtwPPoa9p2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUasjiz0pb56j3IC2s6dhpYSPAFr9YPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LChAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bptZJGGxM
 BWP5lM5CHpv0J2CN/Mfj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/q9BLdglSdSBhbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:rofde6oD51j/JgTTw9JsXr8aV5uFL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhcotKLzOWxFdAS7sSo7cKogeQVxEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjHzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2XqbRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX242oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAjv0idprD
 D/mWZlAy1B0QKXQohzm2qq5+DU6kdq15Yl8y7AvZKsm72geNtwMbs/uWsQSGqm16NnhqAn7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklW6voMRiKobzPKt
 MeRP00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQF++oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,390,1635220800"; 
   d="scan'208";a="64237353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcfcm9KgYTfAOAJT4sTJaVIA+tkjgHYt7ChEj/P2jzAxUyIDUzaPDX+2xEptJCbGTC8gRuOT086Xqjph+kDrnd5RLZf3dDCAJbL0Wr08juW0+Q4jPmdKHJYQ1DB/16390oo5STcuqYHrDbBviO/2wdYEl58a0uUrhE0tftehY+44fGD6aURGWc/uhX+vr2jbZ23VCEgl6zvn95Fp5ZPpgbzO+SZHtswOOQ2+HZyg40AolPTq90x7L3G8Jw2yJ5j84wurJdpOoiRBuXPtGT8meMs58shu5NwSBlA3/vxtv8bjspv8vTWfksJTHpOfqp5sqI0FmQKw82j2R79b5BqXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpPF6xDDLuQWj+BKNENicyzQmEuv9NVwrzNrMbausI8=;
 b=cAwK5apd/m0EXHLUUp7TNGCocHNMlIQd+r8MsIlqCs+Yy1o3VCh6shId523jJIBAVFhmwmpQicq6DDGiQ8HJyUqaSNnsAOQErZ7nyJIvo3a7EkvRmE7Xe0N9n85dfXfOIeKGTL+Bqma+24iiGqMBDTmdrSenPZGgQrWy0MJBLdLZ6vpHJBl5hqK+cJlW0woimF7C1P6RykVdr/sMNgSpBYIO44P+AsEEbR/d/8eXy5AsVEhPCYD/s/OH4pAfwgPNBMwaBA7F8vN1wHei1i5dHiKdcFZ4WH87LV0647Ik+tQZ062l+lRyC1qPd2tjO91KCOjCJeF4MrjUYSdTpshAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpPF6xDDLuQWj+BKNENicyzQmEuv9NVwrzNrMbausI8=;
 b=wxY+dcGZsq8Tr2Wz5GUsDm4wDVlGu39tJA1k82/p4oxQmrj61jU8wvp6SFI3k1X1fuiLtCN7TerWeFjoCQp998Qd0y9PBEohmahVw8dq5YlLCgEJjtl5YQcNht0jAxyMESCHeQDh8PaBZJ/StTa+ug+sPiM6PMTQRmKsiP1dLdY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] x86: drop NOP_DS_PREFIX
Thread-Topic: [PATCH 1/3] x86: drop NOP_DS_PREFIX
Thread-Index: AQHYKJ3kfYMYavVLu0efzdcMu0mAtKyg9laA
Date: Wed, 23 Feb 2022 10:54:53 +0000
Message-ID: <f0214b33-09c0-f15b-e2ca-51cba5fd9ac5@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
 <96f493ee-a360-ce46-7a61-5f55ca436295@suse.com>
In-Reply-To: <96f493ee-a360-ce46-7a61-5f55ca436295@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3702c04-7be9-4992-f55b-08d9f6baec62
x-ms-traffictypediagnostic: SJ0PR03MB5918:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB59189154943B471287231C74BA3C9@SJ0PR03MB5918.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v74dT8aQfuDNta+NXlRkIQ1O/7ZtfVkbRz/eK9PZOcuB1X3KruMA8aOFJ/lOF247XaIQbc9pJLfyXIILvyGQMBTeEOtHN/kKKj2pfJGQdIW/+ObD7mD91TPZE8qiS7alMa1QFXQ7sV0Y0BJBuu/aIl4ArR6Tux5+g+Zr3hVd5wq+OoGnTIGqANMcMOF7dSUKtBUNZemIegScPQEYcyCAtpLibHzrIV3ltHLk2+APP/lZ1T80e6FuiesippLntqewZTzAMXUiP0QSkCOvmCqFFNbwgP9+IlTQ2C4l9xWiUODFXzPeIqywxoXKSLwn39lCpMS7M0QnsHegHQ7+CixRx3Ame1fwwPa46dqFO6+dYF7pUzVHW1eOBbsrfU+uL1hu2L4tlU5LVmYLSOfNUg+q1oP6103EbjZ/zBpGjGaEddyg1cB/ATCpyV8NceGATJOHfc9rMLYqpSuFXjyQi5E6Y3Gtmiw382XjdtdZRPFFNDLAoSfHgBU9qLhtBQ4mA8QFG/+NqWVF1rDWDCf4pT1j61xiqxKbhLGjCCbloF0EF5meS39kADKrCC37yCcJcql4215g5bMmVMZU1BjUteREBaqsyCTy8xAUxESznHTFNdjo90f7vn9h7q4nwsDo9GhhDFw3G7jwKJruq0ByxBlaQE6gHZpG+uTGiQbUwp5MOpte8/8cGP6tPa+oqKRXCMkLVZgucsigru4hHJL7ZeV/ZGGSBYI3Ae5Jv8edcUKoeeCeTmBTZNR2B4cu+aWYpu7cZ1iSorPco+5i1DUbsS8rBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(66446008)(66946007)(64756008)(2616005)(53546011)(6506007)(122000001)(2906002)(54906003)(110136005)(31686004)(76116006)(91956017)(66556008)(66476007)(6486002)(316002)(86362001)(4326008)(5660300002)(36756003)(8676002)(508600001)(71200400001)(26005)(31696002)(107886003)(186003)(38100700002)(6512007)(38070700005)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVZPTHRTSWhtRW5YQzJDYW5vKzgzOStGeEhpRm9VbUxtQlBzUy8vNkRxZUxv?=
 =?utf-8?B?WE0reW1KVWNoUS9ZazdVejV3b29uam9NUnZuZUtHWjJILzhJcWtNcDBNRlVw?=
 =?utf-8?B?bzJ1MkxIc2dpcEZtVnlBTXNndi84MHkrdWVoQVBCSk5iVmd2NlhUcHFKNTVi?=
 =?utf-8?B?dENyRzNzUU45Njd2WmJZNEh1Zi8yZ1Z5M1dNYUMrYlA0RDRzOGY4Z0V0MlZN?=
 =?utf-8?B?MUN0T0tKZWZkNzJ1MWxTY0ZDMVczQ1dSOFNGY3BTZVYvWGVYdlpoZkJ5K21I?=
 =?utf-8?B?RElWdGNVcmk1TU11S0xTOStRNmg4ZFp6V202NVA3ekZIWkxlQjBWNnFJT2hY?=
 =?utf-8?B?bnhJM2FEQ0dEU3hLRElLWXZiTjlIYnRQam1PK0dxcmN4ZVNXamZvaVJHY0Rv?=
 =?utf-8?B?cDRRbk1raENieUllS283emFvdDkrQWVOWElEcTc5a09XUFFWVW5Wd2RRaXVw?=
 =?utf-8?B?Y3ZQTVVkQm9ZNk1ld2d2S25pN3RaanhkWUs1UjQvNUo4b0VSNVNJUVF4VGhW?=
 =?utf-8?B?NjZhM3N1MjVpcVAvY3pXZ3E1RXdpUThOOHRPejBQU1Buc25JS1lGS2U4NGli?=
 =?utf-8?B?TTdMQ3o4Uk82Z1UzbmdTalphczVIYllTdXV1YXhRYUhqNXAycUNITDNBeldq?=
 =?utf-8?B?bDV3SEdvL2ZnNDdlRERub3NxSDhlVVIxQ0pLSFFHeUt2QjIrK2FoLzRsdGdh?=
 =?utf-8?B?Qyt3UVI0N1piandtRjM1TjFHcFRLcmhTVnBTeDYxZ3JrNm41eTJaVTh1bkZ6?=
 =?utf-8?B?Umd2a0NXS25aV0NQRjNjRnhVSUpxVzdGbFZ3VCt4SVhlbzZtOWFGWUhuZEZu?=
 =?utf-8?B?MkxoOWhpZXRkRUdkQjhJY0R3MXB1VnYrSGZncmZxb05sb0E3MkNvOWZKQjl2?=
 =?utf-8?B?NGt3eUxsZnlJYUgvc2tQdlo0Tml5Z3VnRVJBSWVxbGd6ekp4SHl5MVZ0WDVI?=
 =?utf-8?B?UGQ5QjBDd0M5ZmZxQ2RTU1pZbG9pMWh6TUVHNHNQUmluM01wM21wSmdoT3RI?=
 =?utf-8?B?aXZzazJJNk1abXBzZlR6MTQ5RUtueDJYNlIxdSthNGdoRy9zMmF4bjNWb1kx?=
 =?utf-8?B?UmcvT3ByVTMxZVliUE5LcS9uMWdaMmxkWm5HaCtpaUthN2orK0JyaVJEUlYy?=
 =?utf-8?B?TDZSakw0ajlHTHIzbkU2RkFWRmdldHpjckY2OG00TCtjdUdQM0dsaUdvL21O?=
 =?utf-8?B?UXdyajlJSVN5bE0rWWUzWjNlbllwV3dqYlBYZ29Cblk1ZE5zWGZmWTBVcmcz?=
 =?utf-8?B?UW1jbU40ZUNaVUh2N0lvOVg1aE14MFZTdm5LaXVsekxKM2RHbkdYSUpBb2ph?=
 =?utf-8?B?RVhZZ0JUWEFZMkpOUjZ1WGJ5QkxNOGo3ZWl4ODdMbjc4enJkWS8yTWFHNktD?=
 =?utf-8?B?NTF1eXFBUHRhc1gzVzhvOTBaYXZ3VjdQMGsyelZhRmFSL2tKaUdaVm9CNTVz?=
 =?utf-8?B?Rk5hVFdYMHBmeEYxVm5xRzhhb3NqdTkzSE1ZcFE5bk52Y2xYb1BibEVoZWhF?=
 =?utf-8?B?TGJQcDF2TG4rWVBWK0FZempKZVZFVStFbHBRWjY2WkVST2p0YU82SHd6Y3FJ?=
 =?utf-8?B?eWdrSzg2ZjZxOUlVTENYcko5dUIvbUpUWWZWS1lPKzZVWjVmREN5alhTRlVP?=
 =?utf-8?B?ZkZSOUVScU9qcmJPQUsxN0xCYU9KVEY1RVMzQWdjTG1uNzVKZHJXN0lIU1pM?=
 =?utf-8?B?dTc5aHRHVnFPMlFTYUtZL0U3Q0hkV3pLOVd4Y3QrR2dZdlpyZ3hMOTBva0pD?=
 =?utf-8?B?ZzgwV3BxZ2ZRbUFPaUZSZDBybWIxUThMUDNVVmNGVVI1cm9SMDhRVzVSN0c0?=
 =?utf-8?B?R29UNEJCcEVYTUlEQW9hcnN5MGZFd1JYd0NrRVpIekcwaFFxbTFTbWx1ZE0x?=
 =?utf-8?B?RElBRlRscDNMYUZzY0RrTkV2UE1PQWpxdTlpUlhVdmNXRlFWMUk1aFV0Rjdn?=
 =?utf-8?B?bTIwazhGTlhVRlBzem1SZko3aDl1eCs1NUkrQkY4TWlsbmdSZ012VnZVUmo1?=
 =?utf-8?B?Wk1MckhFM3FaZzJjTXROTkZXczVFVlJuQy92NGpDOW5Pb1g2azM0clFiVWp1?=
 =?utf-8?B?Vlp5SHU5b2xWOXh6N3NCN1JWVEJqZ091Zi9kVmNqdXkyMWxpMHZkaVlHTW9O?=
 =?utf-8?B?RXYrL2l6YzRYNTEwZkJTNnJQeDZxUjJNRWFyVFFZckxCYng0eEF2Ri8xWFhH?=
 =?utf-8?B?WWhoQ1ExSkYycSt5c3ZxQ2R1QWRvcEl3eTRjVExiQnFEQWEvL1padGhBdTlD?=
 =?utf-8?B?eUY4SWZybW9vRFh2QnRXQkdldWVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39FFF82D74EC2047AD69E7FCE3A2A63E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3702c04-7be9-4992-f55b-08d9f6baec62
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 10:54:53.9112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QEMJXDxloeqxbv1QxO7Zh9yT1cmhtxBW0BPpw6l7eHE1v4x9z0xQbvRFeontP8cN+TihiIKMQuGslkhl98it186K6Mr8mMoQ9P5b6d1mik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5918
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxMDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgd2Fzbid0IHJl
YWxseSBuZWNlc3NhcnkgdG8gaW50cm9kdWNlOiBUaGUgYmludXRpbHMgY2hhbmdlDQo+IHBlcm1p
dHRpbmcgdXNlIG9mIHN0YW5kYWxvbmUgImRzIiAoYW5kICJjcyIpIGluIDY0LWJpdCBjb2RlIHBy
ZWRhdGVzDQo+IHRoZSBtaW5pbXVtIGJpbnV0aWxzIHZlcnNpb24gd2Ugc3VwcG9ydC4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KSSB3YXMgbmV2
ZXIgYSBmYW4gb2YgTk9QX0RTX1BSRUZJWC7CoCBGYXIgdG9vIHZlcmJvc2UgZm9yIHdoYXQgaXQn
cyBkb2luZy4NCg0KPiAtLS0NCj4gSW4gZmFjdCB3ZSBjb3VsZCBwYXRjaCBfanVzdF8gdGhlIG9w
Y29kZSBwcmVmaXggaW4gZmx1c2hfYXJlYV9sb2NhbCgpLg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYw0KPiBAQCAtMjQ3
LDggKzI0Nyw3IEBAIHVuc2lnbmVkIGludCBmbHVzaF9hcmVhX2xvY2FsKGNvbnN0IHZvaWQNCj4g
ICAgICAgICAgew0KPiAgICAgICAgICAgICAgYWx0ZXJuYXRpdmUoIiIsICJzZmVuY2UiLCBYODZf
RkVBVFVSRV9DTEZMVVNIT1BUKTsNCj4gICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgc3o7
IGkgKz0gYy0+eDg2X2NsZmx1c2hfc2l6ZSApDQo+IC0gICAgICAgICAgICAgICAgYWx0ZXJuYXRp
dmVfaW5wdXQoIi5ieXRlICIgX19zdHJpbmdpZnkoTk9QX0RTX1BSRUZJWCkgIjsiDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiBjbGZsdXNoICUwIiwNCj4gKyAgICAgICAg
ICAgICAgICBhbHRlcm5hdGl2ZV9pbnB1dCgiZHM7IGNsZmx1c2ggJTAiLA0KDQpCaW51dGlscyBh
cHBlYXJzIHRvIGJlIGhhcHB5IHdpdGggImRzIGNsZmx1c2giLCBpLmUuIHRyZWF0aW5nIGl0IGxp
a2UgYQ0KcHJvcGVyIHByZWZpeCBvbiB0aGUgaW5zdHJ1Y3Rpb24uwqAgRHJvcCB0aGUgc2VtaWNv
bG9uIGF0IHRoZSBzYW1lIHRpbWU/DQoNCn5BbmRyZXcNCg==

