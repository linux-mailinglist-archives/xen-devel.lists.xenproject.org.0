Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1149C973
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260853.451016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChFW-0001dq-4y; Wed, 26 Jan 2022 12:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260853.451016; Wed, 26 Jan 2022 12:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChFV-0001aC-Vi; Wed, 26 Jan 2022 12:18:05 +0000
Received: by outflank-mailman (input) for mailman id 260853;
 Wed, 26 Jan 2022 12:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nChFU-0001AY-LB
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:18:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01de8784-7ea2-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:18:03 +0100 (CET)
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
X-Inumbo-ID: 01de8784-7ea2-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643199483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=p0k3zJb9kf+iQGr0vjYjFn/7z/q6j2NDS4cvBP7PuYI=;
  b=dS+efInn4ggvezrVPFy9zstvHaCYxfP1tNFYRtsK0pnMjWWnRYUF4/+N
   cHyzAvZc/nPz16BMFq1Oic0ZoHv5OxANOwpKW2g79mS2ns8+o/ndXCdPY
   AVttDt8n/nWhN6mjSJM81awKWDe6/TmM9TdKDE5asm0d6TS9VXHZcH+aM
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SGxvciOdOfEE01dw79eGWu/cDoMRfHbjC2qcNMpIxZ8gqt6XGwtrjbLLqUh9M9liIFecYoUqWH
 bW34TAVG8o8DWBfMwBQwX2MaSPSDrH8yU7g1wmWZrnKJ9UtXCUBa9GLaBLL+5oKiElGmkZRItx
 V2b3c+hesqMKyKCMZbjAdKcRCRa6rzPykDDfuhch1DTMRF8npmALHc9jQPEy3NV/t/YGNxOENY
 YKBVMa6Dkm7sV32BHq3TSaaHkPGqrP8SPkTL6Th6/WUHnFbE8VSxgMG3tqSsen0N/rFJbv+PPu
 tmcH+XKnzJ7hwZ67X8O86E+P
X-SBRS: 5.2
X-MesageID: 63200838
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W5MjOKoQ+m1wKVb3T8U0INdes5ReBmL1YhIvgKrLsJaIsI4StFCzt
 garIBmFPf3bNmX2ct11PYW/800AscPUy9UyGQJr/yhgEikV85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYKTVFcYOY3zovZDAyN/HC1+LbNE5bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZFDMWI/N0SojxtnZkpKJLgMn/WRg1bmayVYs1u0gatnyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUkyxzd+6303DyLWDg+aTFNaMw4ttI5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSKhRqjBNzAJrVkg
 JTis5LPhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bp1dImK3P
 BOO6Vw5CHpv0J2CN/4fj2WZUJxC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hSlT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:9Hyuz63gIth76Qft4sg8TAqjBQByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ4uxpOMG7MBbhHO1OkPMs1NaZLUTbUQ6TQr2KgrGSugEIdxeOldK1tp
 0QP5SWaueAdWSS5PySiGLTcrYdKbG8geaVbIzlvhNQpHRRGsddBnBCe2Gm+yNNNWt7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWSkGNxxRDY0JTErXsBerR8bY41SGqn12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtrrQc/tQ0obWIlUs4ZkWXfxjImLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3e7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPYHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCDH4Gyff+qKGj3iq9MFlVbA6dv/22vaIJy4EUbICbQhG+dA==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="63200838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VicoJWHXosYoimT074cU6S8DWXJeWhU7jg+mk9M0ubEjTxbHNANa7f8lrNMjClAmMh37EiCyqcj1qHCi2yqJwdZtQ+lwOYaayWQ5Zz9bZdpmDUhlHA1O3yx3YzPl38oM8hDfcZK8TSOUeQBqI8VG8MFsUmNLWiGJ6TpBIN4D9i6utP0vtURdqA9KPQzcy95mqEsm8EoodXcQCL8iIPxasP/GUkSUgtnIjBWAD/F5kmtjJfTWongtm7uCesV+KtsOJKk/W0qlCoGU/JbMFiGFu+sb8dnjBo6h7TskzkV6K9lI3Tcvm4wRqxvoxBj/KtjUw4xdXBuQo8jZ7WZ5lF8fXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0k3zJb9kf+iQGr0vjYjFn/7z/q6j2NDS4cvBP7PuYI=;
 b=n2wohcjKgOBmhU0TdswekvLAVEPENYYWjS7UrImpUkUNHFCbm2tjh3jUPYMTmFEcFOlhUIzI7eTulYipQT5l34eg1IOjYw9bd7bLwkhwI2NlX/rsKkAV89ryj0u6TbSr3RRl/J0Rtk8/Kv6A4SbfNZ1aqrzEMJe/7MpITSBVwCMClJI1zxTaYLexuJu04spLynnTWQs7psK9rliWG6Ki1WDywVlEIDUpKKMMlHEZmzQg0W31UnLzDX785MhccTvyIdx6UlZxfO7jkfFdHFjtTnH87/l7dSXt77hnbWHkSk1vP2wX+CN8ItAWeJaj4LFcWMA29+aUcgYbZMf6nXUzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0k3zJb9kf+iQGr0vjYjFn/7z/q6j2NDS4cvBP7PuYI=;
 b=vubiz71kXQcx/wbgtDkLEQgsQEpMBTD5Y1mBXhwS+9INkniecIi7Shvkt0MW/edIkloFm8JsISWTAK4d8eDF2j0nlxKIKKPALAi/rmNuQ78vqGi+2cGAV3/y1Uq4jN0rdrrdijHdQZYjSFspDNlbIgm32kAwTufq021lHv8EVFQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Topic: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Index: AQHYEpESkkbYY5JPR0iMlxtcJtQdZax1OFyA
Date: Wed, 26 Jan 2022 12:17:55 +0000
Message-ID: <e5a79023-edc9-b5fe-b7d7-f23da32a01b5@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-9-andrew.cooper3@citrix.com>
In-Reply-To: <20220126084452.28975-9-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21a0ae4c-109c-439a-36cc-08d9e0c5e1f5
x-ms-traffictypediagnostic: CY4PR03MB2967:EE_
x-microsoft-antispam-prvs: <CY4PR03MB29679F9486771472DB954E40BA209@CY4PR03MB2967.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dyREN6agdPZ1rKrV/m6kWCHV9cBP9JTywBnika+Xewatgjf/+l8qAo5shFzhS2CqewJZ3z2JGq9FXjZ3E4Jdl9bW/RroJPcp+SzJoj4QTNER9Ewb9+BycHAIABgdgN3QSADuEgUCIDWpRbQhvIku/HTJkFMpbHP49r9/Pv7SjiVCrOplkoRtB7OsqtQUqXOObTih0iyHe2aFcXd/4gk0hbauc4DMwQcR9AOYx/peQ8lm/yeGrYSeWx86uit2IXNE0HuOWXh+oHUbCCqP7ZNVo66tLpi90t1vkJzBDI3HZ1mjx04sxulFzQJWxLIHTEhW2wJEZX2mvnhT+T6iJ48L6Biit8+j/zCcvKFENcoFllOBM9LWSBzkCKxciMUbSKx14vX96XdQ8EtXukHsT57FO+WduDa7eG+yPfeuO/CpEJpQvTz6J0LYNpAo7RWWdf36s6q3npiL/qAo3F6XOXXzYpTxsu7rNPluYiWHmq5mVddTK5vlS3ZkcexkwsPYjRCLSQXr8CulkP8sLJiwkXMDttYIhBo8PlHARcRmTmPCmAVHXtp6/POHUL3lG8lDprSkixcu1bZr4DGS4Sm7ARv9z5EeCtYDWvUYIkKSC+lljWvpB1EFxpLYTRPitbDje+StbpbpB8vjLaxf1QHdA5k+fOFSpiG8q3zHEm32f1R7x66w5Qs59gf9UelluTp+Hq/FYqp8VlVnQuJ5VSQENOF13B330CrKvcDcjg/YOO2OyFRyuqUSUbRcsWo36qsfeBaopxCDw52DnOO966nPc8YRYg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(82960400001)(83380400001)(122000001)(76116006)(66556008)(66946007)(91956017)(66476007)(64756008)(66446008)(8936002)(54906003)(8676002)(316002)(86362001)(2906002)(31696002)(31686004)(5660300002)(4326008)(508600001)(36756003)(6916009)(53546011)(6506007)(6512007)(71200400001)(38070700005)(186003)(26005)(6486002)(2616005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3czNzdFOE02cVh2Q1VIUVZjM1k1Rlc1bkRuL3ZSYWM3eDE0VFRhYTlsZTVL?=
 =?utf-8?B?dXNydEEvRkZRcnBCT3hKNVliTnhYUXdvYnplL2YvUXhuVGVua21qd1Z3V0pB?=
 =?utf-8?B?TnZBU05FeWtIc2I3bTgxUUFwbmhLcy9UN2wrV1JMRHhhZ3BhZHA1amNFczNF?=
 =?utf-8?B?MjNORTEwMW5PdVR2MW9BOFlTMlkyMXJteW5UdnNJY2szdFovaVd4WFM1MTFs?=
 =?utf-8?B?OERSNW10emp0SHYxbXVzcG1OVkhOSEhJWVdKbnVlbWtoUmdnekc2ZFZraFUz?=
 =?utf-8?B?SEJoSVBkNktHQ2pSTGYvclVuOU5UampKR0IwZXNibTI5NFpPWWNiZzJjZENE?=
 =?utf-8?B?Mk8zTXJseGsyMkhHdEVJdlMzTE9CbW14VG9jL050RWhGVklvbUo5dytCMWVR?=
 =?utf-8?B?Q3lNemtMcENMYW0vZHcrTU1WMU1HZS80YWtXTTFhY0NCZ053WGM3a1cwVVdW?=
 =?utf-8?B?MEVEUysxWHZSaGtFQS9Vd3AwZ28zbUpiT0MySm1xTXB4WlNKbXJUbER6RnBI?=
 =?utf-8?B?S3RGMklzNmQ3QXpUQkhJQzlZUHFGYW84a1FDL3Fvd1pxWTgrbkFEZzJIa0U2?=
 =?utf-8?B?elZ6Y20wQThIU2FyYjJIUy9ja3I3eitZbEtNYWFrYWN5QTdpSDRIdlYvaDlB?=
 =?utf-8?B?N292YnExbTBVUlpESVZYMWpIWGM0a2xiOHNRVGNsZ2RhakYzeDVDUHdxUS80?=
 =?utf-8?B?NnZDK3F5YzZmSHdiaG5ZUkJQZEJBb0NST2dNNlNnSklMN3hlMmJyWFowejE1?=
 =?utf-8?B?aWV2NlZVY3ZGcms4YjVlckZ4VlUxeXp6OGtkQU1ndFlQSE5YWTV1MlVFYXln?=
 =?utf-8?B?RUg2WHJFcmdlUm56bld0QzZ2TFpvS01FUE1hL2JLWGIvY3NMNkN6eEZKUXBD?=
 =?utf-8?B?Ui9xY2dNZVc3QVNJZS9ZRENIVWpiUmNVSGNOOHNKSkJwVDVETTJQSHc4bWFL?=
 =?utf-8?B?YS9IZnV6VkFPQ3Q5eStYSjRHTHh0dWNINWRZYXFQdFBOa3o1SHpIUjVpcStl?=
 =?utf-8?B?QVhnNk9yWUovMkNESkl0MHRFYVdiWm8yaitQU2dhM04rYUFQUTlxejdCb1dM?=
 =?utf-8?B?QWNCL3ZpZzlPNnJCb29pclo0dGx6R0Q4azZzdG13eDlpQlVpaHVmYTJiNWN0?=
 =?utf-8?B?YTVtK2xFVnVWWlRkYWZ6M01JaDc3Y1hRYnZXOHRPZXJxWW5pY3J6YVNObUFT?=
 =?utf-8?B?N0lWcFhZOXdTWlRXcmVXNDdFKys1L0lQNERWVXRFVFFYS1hPSytOdDVUQUhy?=
 =?utf-8?B?cjBZQ0hxT0NwNkVZYWRLK25ZZmdJempJQ3M5Vk1Md2tjZGFKQVZ0d09ralcw?=
 =?utf-8?B?Kzc3aGJZS2hwdUkxMkk2K0JiUjhUdGppWTJ6SmlhK3hDVzdqa2tuemdUcHIx?=
 =?utf-8?B?a2xvQ0d0VDcwUldUejE2TnN1UHhjRFFsUUtnd1lUcjBoUUx0eDZXVDRuemFk?=
 =?utf-8?B?cFl6UnplWUlQUEdBTGdMcXdGY0habHZXeE1ZME0yZlhtaXVGdTN4citOeHlr?=
 =?utf-8?B?SHIrL2c5MEJIQlc4WjFzSlJHZ0R0dE1CVnVLbkdKN0RoV1oxRVF6T2p0RkNX?=
 =?utf-8?B?NzhrMHdqMjFWS05NY0dqSEVYQnV3bW41MnJiUE9hYXpkRUtZRkM1N3JtNmV6?=
 =?utf-8?B?Sjhlb2RYbE1tSjZRUDM2RlAwZVlqbG51WnVEaTNSdldIQUFFeHFFTDJaS25x?=
 =?utf-8?B?NDh4LzlBVnQ1WnFNR0dmTEhyMHBKOGZyVSt5TEVJM09TVWtxWVBXL003L3Bm?=
 =?utf-8?B?b3gwY2s4bmNKNlVUL1orSm9zSHRJR2dmRVcvMGV3Y1djeG5LTEd2NVpLenRx?=
 =?utf-8?B?YVJPKzk3cmJ2ZDR2d2FaMG5Fdm8yb2ZsS29ldG92MzJ6YTRobUJ3MEgzU3Zh?=
 =?utf-8?B?VUZJMWE4T0dUYVpSOTVPK0E0THJBMFBMZnZzNk9USVNIMlo4Q2FXQmY0VVUx?=
 =?utf-8?B?KzFyWlk4cDZYN1RwUFV1S2xqb3ovdGJwZEFIeHArR1ZBalJEL0lPQlpiT280?=
 =?utf-8?B?dGUrYmFyOUhnNWFZdTlyOHlEc29UUUdRd2xDL1NCU2M2QmtuakF0VU9QRXRV?=
 =?utf-8?B?R1hiNzVKTEh5UFkrMjl1NGwvMG5vR3g3MGt1YlVkNE1xUExPckR6MWVxZjBC?=
 =?utf-8?B?dkgvdENNR0JJVmhOcVg4WU96L1FXSDRiaTIyRDN1Rm9XNHpFTExOQTZ2N3Jp?=
 =?utf-8?B?aW54YTdzWktJU21CZjFuc1NMZ2E3RGswOElvSWZlWHN5RDNJeXg4VndqRzNs?=
 =?utf-8?B?OUxNU0I5eEdHQTcwOG5aUDJ4UFlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <562F38E15DF6664C995608358776DBA3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a0ae4c-109c-439a-36cc-08d9e0c5e1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 12:17:55.3133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdRrymRCY5PZs9G3ShNBxInjZ15PMlWymOIZJtiUjfMUiR8JA5QirywJbTfEU4W2PZyVitHet08cD2+k+jRifPOpt6bJMQQ6NEtsyk/CxDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2967
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAwODo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gV2l0aCBhbGwgb3Ro
ZXIgcGllY2VzIGluIHBsYWNlLCBNU1JfU1BFQ19DVFJMIGlzIGZ1bGx5IHdvcmtpbmcgZm9yIEhW
TSBndWVzdHMuDQo+DQo+IFVwZGF0ZSB0aGUgQ1BVSUQgZGVyaXZhdGlvbiBsb2dpYyAoYm90aCBQ
ViBhbmQgSFZNIHRvIGF2b2lkIGxvc2luZyBzdWJ0bGUNCj4gY2hhbmdlcyksIGFuZCBleHBsaWNp
dGx5IGVuYWJsZSB0aGUgQ1BVSUQgYml0cyBmb3IgSFZNIGd1ZXN0cy4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KU1ZNIGd1
ZXN0cyBnZXQgcmF0aGVyIG1vcmUgc3BlZWR5IHdpdGggdGhpcyBodW5rLCB3aGljaCBJIG1pc3Nl
ZDoNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtLmMNCmluZGV4IGJjODM0NTU2YzVmNy4uZjExNjIyZWQ0ZmY4IDEwMDY0
NA0KLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vc3ZtL3N2bS5jDQpAQCAtNjA2LDYgKzYwNiwxMCBAQCBzdGF0aWMgdm9pZCBzdm1fY3B1aWRf
cG9saWN5X2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpDQrCoA0KwqDCoMKgwqAgdm1jYl9zZXRfZXhj
ZXB0aW9uX2ludGVyY2VwdHModm1jYiwgYml0bWFwKTsNCsKgDQorwqDCoMKgIC8qIEdpdmUgYWNj
ZXNzIHRvIE1TUl9TUEVDX0NUUkwgaWYgdGhlIGd1ZXN0IGhhcyBiZWVuIHRvbGQgYWJvdXQgaXQu
ICovDQorwqDCoMKgIHN2bV9pbnRlcmNlcHRfbXNyKHYsIE1TUl9TUEVDX0NUUkwsDQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwLT5leHRkLmlicnMgPyBNU1Jf
SU5URVJDRVBUX05PTkUgOg0KTVNSX0lOVEVSQ0VQVF9SVyk7DQorDQrCoMKgwqDCoCAvKiBHaXZl
IGFjY2VzcyB0byBNU1JfUFJFRF9DTUQgaWYgdGhlIGd1ZXN0IGhhcyBiZWVuIHRvbGQgYWJvdXQg
aXQuICovDQrCoMKgwqDCoCBzdm1faW50ZXJjZXB0X21zcih2LCBNU1JfUFJFRF9DTUQsDQrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcC0+ZXh0ZC5pYnBiID8g
TVNSX0lOVEVSQ0VQVF9OT05FIDoNCk1TUl9JTlRFUkNFUFRfUlcpOw0KDQoNCkkndmUgZm9sZGVk
IGl0IGludG8gdjIsIGJ1dCB3b24ndCByZXBvc3QgZm9yIGp1c3QgdGhpcy4NCg0KfkFuZHJldw0K

