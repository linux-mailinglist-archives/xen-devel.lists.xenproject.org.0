Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A365DADF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 18:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471352.731172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD77X-0006vI-RG; Wed, 04 Jan 2023 17:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471352.731172; Wed, 04 Jan 2023 17:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD77X-0006tH-Nw; Wed, 04 Jan 2023 17:00:07 +0000
Received: by outflank-mailman (input) for mailman id 471352;
 Wed, 04 Jan 2023 17:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD77V-0006rD-PN
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 17:00:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a646905-8c51-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 18:00:03 +0100 (CET)
Received: from mail-bn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 11:59:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6915.namprd03.prod.outlook.com (2603:10b6:510:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:59:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:59:44 +0000
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
X-Inumbo-ID: 3a646905-8c51-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672851603;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xrAHntuMP5McfeZATKKyDoJutzM7llCarZaRHoOccBo=;
  b=GsCy6fBXA/QWL9tJpZZZOcOxikYpWhWl+NXNWJhXRlVvlYgSVIHx1dNi
   XrvTcEvMvWR4K08OhdEgDBkNcohkpJf8u5BGhWJ1KIylLmNVB8rriiWiL
   kmXHsqC3jLJ3d80J9uRTDg2rcSk8fsqu6JIyhhKyxwyemtX8g09Q9XLT2
   A=;
X-IronPort-RemoteIP: 104.47.51.48
X-IronPort-MID: 90660050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aOg0rq/Wp2unswfPhhRRDrUDon+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zRJXD+Oaa2KY2vyLo0gbY6woRwB6pPSmtAxHlBo+Hw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AdmPKgX5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkli1
 qU8eTlTQSndmu2t5/G3aPRGnvUKeZyD0IM34hmMzBn/JNN+G9XpZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWKilAhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqANxMTOXlrpaGhnWt1FAKAiUrW2HlrMGGo1zuHMpZJ
 kALr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+6pog21kjLVow7TP7zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQOEhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:Jkg7F65PcBHunGa94gPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,300,1665460800"; 
   d="scan'208";a="90660050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jxr6a4sdIJQV44zu1DxtIYp1Uvlu9RS5PQGirXM/MCsBCs5JCLfjvs99ltfklQHA1XQBwnLiG/z0GOnIg6hxaZ3RgRKKIEagaARTv3Zz7BXwfTSxVCu0/EpigYQCAEbGbLsXquokjTj418vJ8jHpifypR6Gb3HOVQESOJWevD0pR5nI3S8DG27I5Bd365hLXMMB9WmEZQ8vvmXC+1UweTRDXKLtkIFkwcbPCYiXPJbV9mwfvr25WE5uOwdNvDa/xONHb/MgO4vSn4Tqt2pPl7YQVDAdt2cpp1ghIUIwO/u+uOckU+RTBdVQjLUZOnhYaGS26OwATDg60puQW7Ssr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrAHntuMP5McfeZATKKyDoJutzM7llCarZaRHoOccBo=;
 b=ToNgNzYGJpYf1P2q9NKt2gq3c1S1+BTAvxLg68hycriFkS3/JL6H6gbyTBFvmRm//BVl0aYqz2C/b2eIUZ6TF89n1DN/klrdaVScN8uXBZ8bdFMsx5Vc2HZw0FPp/pwlXCD4d5OelpP+uXp8LVKLbjd9TTfOP4YrtlwncENq3Qm6NeNl4YPIM9tBbYrcbAl9mEQTKCE3LpQuWA2z9VMyNmB81K1KU10CRJP0J/qNQOxFlDxZYnzStnMn7bxLKbpqSQmIWvp1F5v0rdnCAn753r0sAWLhb4oVqFyBkECxPIDNEhTmU7h07yZmr8kUMJ1PdUXmVrKIm2bxtcZtIcjZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrAHntuMP5McfeZATKKyDoJutzM7llCarZaRHoOccBo=;
 b=miNCeBRt/YYCbyQkuRD6PDVVikFqHO6mDYb2yb2LTtZKBJKGyAsvoJb2vL6M9Hiy1GUXrEzPhWc0UmMk47LQAEM0Au34+ZDIQJd/lXb+7xyAB9xMfro0qJR9R4ENY1UwdCfraFh+5LBGtinIsGRCvINo3vnT/06diirN8UUAl04=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/shskt: Disable CET-SS on parts susceptible to
 fractured updates
Thread-Topic: [PATCH 2/2] x86/shskt: Disable CET-SS on parts susceptible to
 fractured updates
Thread-Index: AQHZIC1dxLDr/Ft5R0KgtQNaFohPLq6OZp8AgAAU6IA=
Date: Wed, 4 Jan 2023 16:59:44 +0000
Message-ID: <c452eb49-15c5-f464-bab9-4ec93b840dcf@citrix.com>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-3-andrew.cooper3@citrix.com>
 <a225c263-dda1-8109-3dcc-ff7111f277fe@suse.com>
In-Reply-To: <a225c263-dda1-8109-3dcc-ff7111f277fe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6915:EE_
x-ms-office365-filtering-correlation-id: b9488f9f-af29-4686-6ca4-08daee751411
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hN32oQmD6AB1vGKL39bquuQ7vYQZaCnslXqufOVKmRpZDSKCHUCg0XTLPYSpFKDwA7tAjlbwr1D5nUxlSpHAbmcrFa03okjrNDlWB4HJdS8+UwPLOXJ36DpHOlgMmRbY1djYP+JxfbekW2t39Z605FApvxjATJ5Z4qneC3GUPdIfZ7t6OD8keanwTko4DxrQAz4eJffqmRx59C18CLcQKe9BhsvixSf9XJLtuH7htx3A3Rr7EgqycmIdh8v8We+P2ITJXPj/EHNzaZlkyiVXgKysuzSZr1VmLvhg6V7MGljyQHhznpJK+P9bUgm1IVoPvF9OzsaYaOFE7dabO3eKcWpSeqnNlldEWiRH1uVz18jGjLEu409lsD2qiyk5dhjrX2AuKmm+kFTWoSHERayW4c7PgXGatTLF0TPcTe9ru3Vf4vqjmHX2WJ2SqPUHXI4PkAeXvXl6u5pK3k0bW+11o+bzT+S77xjokeUX2AxjqsQ954jW6vASzu/e3YwQ4M1qvc+2D1iVweagVOpqPOTZtvgwjL8b1vUmcBMHyHMjaWme+o2ZKGp4OHnI8HKumjWb4mf634+j29ex1ro7cOV/p3lHNTFTZA5wZD8p4RCX4o4H7+kHNaLIt/xxjEzbVwzjw5HdHSwfuksAfUiB+HdaOCfoA1UpptJRg0AfcDdqe3GLqVsG0t5TvO3ywUsFMoKXnW7b8V+IC8xtJ0EQKY5Y0MmHDuqKUOlFtzmUaFo3XtjNX3BtVF+Nvv3+ng1iptDQtQbh9bkUhA3jdWCSWRnLHw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(5660300002)(2906002)(15650500001)(8936002)(41300700001)(4326008)(478600001)(316002)(8676002)(66899015)(54906003)(66476007)(66946007)(76116006)(6916009)(66446008)(91956017)(64756008)(66556008)(71200400001)(6486002)(31686004)(6512007)(26005)(6506007)(83380400001)(122000001)(82960400001)(186003)(38100700002)(53546011)(2616005)(31696002)(86362001)(38070700005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTdlUnlPb1dpYnJ1QUtCOVZtS2l3d0NVcjc3SlJOK0k0U0RCcHVNem1EVkQ5?=
 =?utf-8?B?cjJHQlJ2SXVKeC8waFZueWhGaExFOURmeWlTZ2hFNWZVTFpTTERuSk8vWCs5?=
 =?utf-8?B?bnJQcXVEVCt0RnRKeU15SEpJYnVkYnp1azVPNEdwOWQyWjJ0ak9LVllvd1RN?=
 =?utf-8?B?dHRwdSs3cUdTUzM5WnpjZ2RDZVdaaUJodW1SaE5MMkVhUnNJQjBQWGc3enky?=
 =?utf-8?B?bnd1dE1abW5HMUcrQjFScWpUOVNJVHRwQ29GeUJZT0NGWWpsNzlFL0QxSnBy?=
 =?utf-8?B?TDNHNmhVbkdiTi85WnN3blFzNy84NHh6dXlnbzNZNVlJZTdkWXBhZ2NwTWFu?=
 =?utf-8?B?L1preVA1cGJyMzI4b05QU3RoNTUwdENuRnN5a2VpWDY2NGIyNy8zaXlNZ1dE?=
 =?utf-8?B?Wlk1N1JsL2NOZzA3blRaWEhGVFRRK1Q2R0ticzBuN0lhc0Nkd0MyeGZvcFFa?=
 =?utf-8?B?RlVvV24rb3hXWmdFeGF0cU9HbTFNckpvakx5N1RHeVhhNkRsdVZOWjg2T3Yr?=
 =?utf-8?B?VERwL0ZGSjdaK3Ewc3NRYktkTCtxREtkbVYxMkRnbk1CQWxRcjM1TW9vVUdt?=
 =?utf-8?B?U2ZhMkxjemN0d0tVWi9QYnpBdERNanNPSUp3U0h4blFNM1RSRG90WGVDK0la?=
 =?utf-8?B?Y25PaXN1YXVwYWtqaVdIdTB0dTE5Vmc0c2U2YW1XdTlrR3VvRFNKRHRJcnpa?=
 =?utf-8?B?OWc5TFh2ZHFFQ3h2eEE2K29naHc4SHZ5SGRqODh4M0ZuRFBIR3JQM0dJcXFY?=
 =?utf-8?B?QTNGM1RVSzBLUUVFOUl6UGEvdzVMWGd5aHNBc0NGTFYvc0krNncxWDUxeks5?=
 =?utf-8?B?bEJpY0NNdjBzUlNUL2JKME02UWJ4QWI1cW5EeS9taXJjOEI0UXFJZ0ZlUnhy?=
 =?utf-8?B?Z0dkTXZXWTM1KzNsdTU5UHZaWmxaTkkvM3VIVlFwQVVBd2toYzRyUWtFcXh4?=
 =?utf-8?B?bmM4dFRoVmZpUmM4NE1lci92WVhoOUxqQUQ3SzZ1bTA0d1QwZ2RrUi9EUEt2?=
 =?utf-8?B?V3FFbTRsNWxmRklVRWdZa1ZySEUwTzczU3kyVExLanhWT1cxTUZDR0sxUEp5?=
 =?utf-8?B?YVJ4WGxDRWdQcVoxajlKN2FZb0w3SjFHeE9pOVJNanZqdTR3Tkxpb3RsR1lT?=
 =?utf-8?B?c2FRZ1ZHek1pUDE1QmJpTVlCMS9Ya0lIYm94MzJkK2tRSzhMVnhoaU9VUmFn?=
 =?utf-8?B?c3pmc2l5d3FhU0NXbU1BN1RWWE41dC9iTmwzOFQyTEJFSjNqQWVlSSs1Rjlz?=
 =?utf-8?B?Qnlhbi9oRmZWUDg5NXF3SmJOZ0Jmd3IwdDNaeWd1bkwyaVd1bjgvWk5lSE1r?=
 =?utf-8?B?ZjU5UnBhZEdVWnEyWEFKaXdLckQ5VTVnc05ML3lBVEdOU2owWS84eTU0K3hm?=
 =?utf-8?B?WVVCNnJEVHJ4eTFLVXhlV0FNeU1xdUswUytCNTN6Z3J4SkluUEhRRWJRVWhU?=
 =?utf-8?B?aTFqQmMxWFRPVEx1ckdKWStOVC9uM3NVOStxcUdkZXUvK1pMOUtpUWc0NmdI?=
 =?utf-8?B?MTh3MTBOZVY3OTRtLzBxL3JZK2tJeWlUK0dGT2ZZYW83NWNhaEFwaksveTl3?=
 =?utf-8?B?RTBpb2VhMXpYRGlOeTdTRWVqZ29YdnE3VWdsUEpLWmF3TUtIcUNPcllSTm9w?=
 =?utf-8?B?Y0k2UkhSWDhieXViQTQ3VmJCMlpCc0twUWJvWkJPc011d2RZSEdPRU0rTjdY?=
 =?utf-8?B?aCtIZmdnY0Z6WnFpZTN5VFFoR1F1blVVTzhEdk1FbkMvbVAreTB5QmdMbjdu?=
 =?utf-8?B?SzVmVnpxMVg0TUZ6YzUrTEcwWmR0TUtwK1JmdkNoVkxXR1JqQWdYK2VJdVdw?=
 =?utf-8?B?Zjd6ZHV5a3BCTERiQStyUkc4ZFd6emtzcUJDUnpvbmVMWTJMOTBxR2taVm5Y?=
 =?utf-8?B?KzI1MGxQb0hWL2dFZlc2MUpCcHExaC9nREQ4WHQ5dHlLM2pwbXJteTNqQUJa?=
 =?utf-8?B?dXplcDRrQjkyWVV4MFhDaXgzd3BlS201bjN2L3BzTXArTWVQYk56VWlTTXpC?=
 =?utf-8?B?SkNXbHltZzdXTVhEZjBHakVoTXhlc2JSL3phMnhMOEdwcWU2VVpwQkFSY3hM?=
 =?utf-8?B?cVk4QkdaemdUdjVKNFRRN3dWeUJKUEladVNCaXdTd1hjb0hGOElTWlY5SE05?=
 =?utf-8?Q?p49Szy75yyPJgEyy20G9OzKmL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B52444D3FDE9BF46868662C41391357F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7p8ZOtUCv7y8d/UkurIzYx1RfNhhYdtZQDeDqwVLB7oIgV+COjt9D0AIUXHnnbUSMJUoITrFRksTNpTPljwnXQlYka9YNx8q/H87h+wc5MU4kBfhbdJ5hOfeA8ZjcGEDX451NRGrNV+HlMXeccMKRAT+ogoTI3/XZpio2U6wXuZ/A7cqsK6Hx7PnJ+9VAuGxT2lI3dFDA54b4SQfoJOdojmykQ/r4ZjxmzXjNRj+BNq3SI1MG/uclgPU1yeP+029AyAQJfe4xtT4X/dRanTQi3KuX+IBj79lTq+mT0O9XaSc38w2lufde2YbiKyJRei888V35UQ2W8JCtjqEe5tz6TikkRw3hOgbzzZsBhj5fMgVZh+2yrJmfHMufPdnJRaRKoBpyBU5o/fFj7qhdzSk+pFGzXdugnGLGoR/kqVHDE8P0hn2V6ayjGid+yjR7nB8xCHnl+15naudTCdwPlfYjuXxNG8mf5m2W84CMGyDe3P0cjPvhburlEqndnyJ6I9XNrDD10APdKiMt4AdFtZGKtotHL7qGcgy1w93+NnMiOTWLmLFUkrtRvQ0JZnWSBiexks3LQJ8inYs90IgPlVxcSZT/lKv5majQM+ufz2TVE9QiHHBhp8/qFN09vimTTpwrR0vNUenuvW2DGvpBV3+Jrs5EZIXzti6vD1d14NE7ovQFkcHclk4V/q82eZ6aRm1c2aLcVBwJ9a9+5FfcYx/Njg3ZPknwa+jS9pFNGq6HhHqNzUOZYlnMfM95HugjIUvJSlqQ2h3idjX3xPxMuZu07b3EEp1SUDXx3uLHy9CFDmRznpD1mMftVCoOPVLIjfW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9488f9f-af29-4686-6ca4-08daee751411
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 16:59:44.1148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pjdcl2Jd0jlpdPr+atwBr5QxKS8LShKPlj9cQjsEPygoo+C9x62eMN2oMpnLBepmEt9ltDd44ccO4qlt8+88RFMM+eFo5/s799B+TCSwfDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6915

T24gMDQvMDEvMjAyMyAzOjQ0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDEuMjAy
MyAxMjoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFJlZmVyIHRvIEludGVsIFNETSBSZXYg
NzAgKERlYyAyMDIyKSwgVm9sMyAxNy4yLjMgIlN1cGVydmlzb3IgU2hhZG93IFN0YWNrDQo+PiBU
b2tlbiIuDQo+Pg0KPj4gQXJjaGl0ZWN0dXJhbGx5LCBhbiBldmVudCBkZWxpdmVyeSB3aGljaCBz
dGFydHMgaW4gQ1BMPDMgYW5kIHN3aXRjaGVzIHNoYWRvdw0KPj4gc3RhY2sgd2lsbCBmaXJzdCB2
YWxpZGF0ZSB0aGUgU3VwZXJ2aXNvciBTaGFkb3cgU3RhY2sgVG9rZW4gKHNldHRpbmcgdGhlIGJ1
c3kNCj4+IGJpdCksIHRoZW4gcHVzaGVzIENTL0xJUC9TU1AuICBPbmUgZXhhbXBsZSBvZiB0aGlz
IGlzIGFuIE5NSSBpbnRlcnJ1cHRpbmcgWGVuLg0KPj4NCj4+IFNvbWUgQ1BVcyBzdWZmZXIgZnJv
bSBhbiBpc3N1ZSBjYWxsZWQgZnJhY3R1cmluZywgd2hlcmVieSBhIGZhdWx0L3ZtZXhpdC9ldGMN
Cj4+IGJldHdlZW4gc2V0dGluZyB0aGUgYnVzeSBiaXQgYW5kIGNvbXBsZXRpbmcgdGhlIGV2ZW50
IGluamVjdGlvbiByZW5kZXJzIHRoZQ0KPj4gYWN0aW9uIG5vbi1yZXN0YXJ0YWJsZSwgYmVjYXVz
ZSB3aGVuIGl0IGNvbWVzIHRpbWUgdG8gcmVzdGFydCwgdGhlIGJ1c3kgYml0IGlzDQo+PiBmb3Vu
ZCB0byBiZSBhbHJlYWR5IHNldC4NCj4+DQo+PiBUaGlzIGlzIGZhciBtb3JlIGVhc2lseSBlbmNv
dW50ZXJlZCB1bmRlciB2aXJ0LCB5ZXQgaXQgaXMgbm90IHRoZSBmYXVsdCBvZiB0aGUNCj4+IGh5
cGVydmlzb3IsIG5vciB0aGUgZmF1bHQgb2YgdGhlIGd1ZXN0IGtlcm5lbC4gIFRoZSBmYXVsdCBs
aWVzIHNvbWV3aGVyZQ0KPj4gYmV0d2VlbiB0aGUgYXJjaGl0ZWN0dXJhbCBzcGVjaWZpY2F0aW9u
LCBhbmQgdGhlIHVhcmNoIGJlaGF2aW91ci4NCj4+DQo+PiBJbnRlbCBoYXZlIGFsbG9jYXRlZCBD
UFVJRC43WzFdLmVjeFsxOF0gQ0VUX1NTUyB0byBlbnVtZXJhdGUgdGhhdCBzdXBlcnZpc29yDQo+
PiBzaGFkb3cgc3RhY2tzIGFyZSBzYWZlIHRvIHVzZS4gIEJlY2F1c2Ugb2YgaG93IFhlbiBsYXlz
IG91dCBpdHMgc2hhZG93IHN0YWNrcywNCj4+IGZyYWN0dXJpbmcgaXMgbm90IGV4cGVjdGVkIHRv
IGJlIGEgcHJvYmxlbSBvbiBuYXRpdmUuDQo+IElPVyB0aGF0J3MgdGhlICJjb250YWluZWQgaW4g
YW4gYWxpZ25lZCAzMi1ieXRlIHJlZ2lvbiIgY29uc3RyYWludCB3aGljaCB3ZQ0KPiBtZWV0LCBh
aXVpLg0KDQpGb3IgcHJhY3RpY2FsIHB1cnBvc2VzLCBpdCBpcyAiY29udGFpbmVkIHdpdGhpbiBh
IHNpbmdsZSBjYWNoZSBsaW5lIi4NCg0KQU1EJ3MgcG9zaXRpb24gaXMgImlmIHRoZSBPUyBkb2Vz
bid0IGhhdmUgc3VpdGFibGUgYWxpZ25tZW50LCBvciBkb2Vzbid0DQpwbGFjZSB0aGUgc2hzdGsg
b24gV0IgbWVtb3J5LCBpdCBnZXRzIHRvIGtlZXAgYW55IHJlc3VsdGluZyBwaWVjZXMiLsKgDQpU
aGV5IGhhdmUgY29uZmlybWVkIHRoYXQgaWYgdGhlcmUgaXMgc3VpdGFibGUgYWxpZ25tZW50IGFu
ZCBpdCBpcyBvbiBhDQpXQiBtYXBwaW5nLCB0aGVuIG5vIHZtZXhpdCBjYW4gb2NjdXIgd2hpY2gg
d291bGQgZnJhY3R1cmUgdGhlIHRoZSBzaGFkb3cNCnN0YWNrLg0KDQpJbnRlbCByZXRyb2FjdGl2
ZWx5IHRpZ2h0ZW5lZCB0aGUgY29uc3RyYWludHMgaW4gbWljcm9jb2RlIG9uIFRHTC9BREwgc28N
CnRoYXQgTVNSX1BMP19TU1AgKG9yIElTU1QgcG9pbnRlcnMgZnJvbSBtZW1vcnkpIHdvdWxkIHN1
ZmZlciAjR1AgaWYgdGhleQ0KZGlkbid0IHJlZmVyIHRvIHRoZSB0b3Agd29yZCBpbiBhbiBhbGln
bmVkIDMyLWJ5dGUgcmVnaW9uLg0KDQpCdXQgdGhpcyBwcm92aWRlIHRvIGJlIGluc3VmZmljaWVu
dCB0byBmaXggdGhlIHByb2JsZW0sIGhlbmNlIHRoZSBuZXcNCkNQVUlEIGJpdCwgYW5kIHJlY29t
bWVuZGF0aW9uIHRvIGRpc2FibGUgc3VwZXJ2aXNvciBzaGFkb3cgc3RhY2tzIGJ5DQpkZWZhdWx0
IHVuZGVyIHZpcnQuDQoNCj4+IERldGVjdCB0aGlzIGNhc2Ugb24gYm9vdCBhbmQgZGVmYXVsdCB0
byBub3QgdXNpbmcgc2hzdGsgaWYgdmlydHVhbGlzZWQuDQo+PiBTcGVjaWZ5aW5nIGBjZXQ9c2hz
dGtgIG9uIHRoZSBjb21tYW5kIGxpbmUgd2lsbCBvdmVycmlkZSB0aGlzIGhldXJpc3RpYyBhbmQN
Cj4+IGVuYWJsZSBzaGFkb3cgc3RhY2tzIGlycmVzcGVjdGl2ZS4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiB3aXRoIG9uZSBuaXQgKGJl
bG93KS4NCj4NCj4+IFRoaXMgaWRlYWxseSB3YW50cyBiYWNrcG9ydGluZyB0byBYZW4gNC4xNC4g
IEkgaGF2ZSBubyBpZGVhIGhvdyBsaWtlbHkgaXQgaXMNCj4+IHRvIG5lZWQgdG8gYmFja3BvcnQg
dGhlIHByZXJlcXVpc2l0ZSBwYXRjaCBmb3IgbmV3IGZlYXR1cmUgd29yZHMsIGJ1dCB3ZSd2ZQ0K
Pj4gYWxyZWFkeSBoYWQgdG8gZG8gdGhhdCBvbmNlIGZvciBzZWN1cml0eSBwYXRjaGVzLiAgT1RP
SCwgSSBoYXZlIG5vIGlkZWEgaG93DQo+PiBlYXN5IGl0IGlzIHRvIHRyaWdnZXIgaW4gbm9uLXN5
bnRoZXRpYyBjYXNlcy4NCj4gUGx1czogSG93IGxpa2VseSBpcyBpdCB0aGF0IFhlbiBhY3R1YWxs
eSBpcyB1c2VkIHZpcnR1YWxpemVkIGluIHByb2R1Y3Rpb24/DQoNCkFsbCBvZiBvdXIgZ2l0bGFi
IHNtb2tlIHRlc3RzLCBhIGxhcmdlciBwYXJ0IG9mIFF1YmVzT1MncyBDSSwgYW5kDQpub24tZGVm
YXVsdCBQVi1zaGltIGNvbmZpZ3VyYXRpb25zLg0KDQpBcyBzb29uIGFzIHdlIGdldCBndWVzdCBD
RVQgd29ya2luZywgdGhlbiBwYXJ0IG9mIE9TU3Rlc3QsIGFuZCBhIHBvcnRpb24NCm9mIFhlblNl
cnZlcidzIGdlbmVyYWwgdGVzdGluZyB0b28uDQoNCkl0IGRvZXMgbmVlZCBiYWNrcG9ydGluZyB0
byBhbGwgZ2VuZXJhbCBzdXBwb3J0IHRyZWVzLsKgIChXaGVuIEkgZmlyc3QNCnN0YXJ0ZWQgd29y
a2luZyBvbiB0aGlzIHByb2JsZW0gd2l0aCBJbnRlbCwgdGhhdCB3b3VsZCBoYXZlIGluY2x1ZGVk
DQo0LjE0IHRvby4uLikNCg0KPj4gQEAgLTEwOTksMTEgKzEwOTUsNDUgQEAgdm9pZCBfX2luaXQg
bm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkNCj4+ICAgICAgZWFybHlf
Y3B1X2luaXQoKTsNCj4+ICANCj4+ICAgICAgLyogQ2hvb3NlIHNoYWRvdyBzdGFjayBlYXJseSwg
dG8gc2V0IGluZnJhc3RydWN0dXJlIHVwIGFwcHJvcHJpYXRlbHkuICovDQo+PiAtICAgIGlmICgg
b3B0X3hlbl9zaHN0ayAmJiBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ0VUX1NTKSApDQo+PiAr
ICAgIGlmICggIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9DRVRfU1MpICkNCj4+ICsgICAgICAg
IG9wdF94ZW5fc2hzdGsgPSAwOw0KPj4gKw0KPj4gKyAgICBpZiAoIG9wdF94ZW5fc2hzdGsgKQ0K
Pj4gICAgICB7DQo+PiAtICAgICAgICBwcmludGsoIkVuYWJsaW5nIFN1cGVydmlzb3IgU2hhZG93
IFN0YWNrc1xuIik7DQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogU29tZSBDUFVzIHN1
ZmZlciBmcm9tIFNoYWRvdyBTdGFjayBGcmFjdHVyaW5nLCBhbiBpc3N1ZSB3aGVyZWJ5IGENCj4+
ICsgICAgICAgICAqIGZhdWx0L1ZNRXhpdC9ldGMgYmV0d2VlbiBzZXR0aW5nIGEgU3VwZXJ2aXNv
ciBCdXN5IGJpdCBhbmQgdGhlDQo+PiArICAgICAgICAgKiBldmVudCBkZWxpdmVyeSBjb21wbGV0
aW5nIHJlbmRlcnMgdGhlIG9wZXJhdGlvbiBub24tcmVzdGFydGFibGUuDQo+PiArICAgICAgICAg
KiBPbiByZXN0YXJ0LCBldmVudCBkZWxpdmVyeSB3aWxsIGZpbmQgdGhlIEJ1c3kgYml0IGFscmVh
ZHkgc2V0Lg0KPj4gKyAgICAgICAgICoNCj4+ICsgICAgICAgICAqIFRoaXMgaXMgYSBwcm9ibGVt
IG9uIGJhcmUgbWV0YWwsIGJ1dCBvdXRzaWRlIG9mIHN5bnRoZXRpYyBjYXNlcyBvcg0KPj4gKyAg
ICAgICAgICogYSB2ZXJ5IGJhZGx5IHRpbWVkICNNQywgaXQncyBub3QgYmVsaWV2ZWQgdG8gcHJv
YmxlbS4gIEl0IGlzIGEgbXVjaA0KPiBOaXQ6ICIuLi4gdG8gYmUgYSBwcm9ibGVtLiINCg0KRml4
ZWQsIHRoYW5rcy4NCg0KfkFuZHJldw0K

