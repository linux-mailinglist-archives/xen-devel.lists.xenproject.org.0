Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A08604310
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 13:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425746.673776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol79Q-0006pQ-BP; Wed, 19 Oct 2022 11:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425746.673776; Wed, 19 Oct 2022 11:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol79Q-0006nc-7i; Wed, 19 Oct 2022 11:22:20 +0000
Received: by outflank-mailman (input) for mailman id 425746;
 Wed, 19 Oct 2022 11:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQ2t=2U=citrix.com=prvs=28491fd06=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ol79P-0006nW-1r
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 11:22:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47dd838e-4fa0-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 13:22:17 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2022 07:21:45 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by CO1PR03MB5859.namprd03.prod.outlook.com (2603:10b6:303:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 11:21:40 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%6]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 11:21:40 +0000
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
X-Inumbo-ID: 47dd838e-4fa0-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666178536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=6WBXppwj+sXpeKK0SJMJ07eAjAzaRK+57WPAOXAjyXo=;
  b=gJpzaxBGJFsTHoXwl5V6VRui+zl2nTNYLioMl/7h9qHeH/8BaOdws58m
   zI4SRoymS/Fz/6kNv2jhnqpWR2/RrTz/5xd7MJ5YteYczCvuj2SMbmxkn
   d+WPN3EZjryHJrWpV+89R3oU4iHxdWMPXK/Nj4jVo3MfNSU6drsp8Aytd
   E=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 85587839
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JofiV6N7TBg7dY3vrR3ol8FynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGOo2190sEv8fQz941SAo+ri88EykSp5fMVIvFIBetMynMfsHIFxJt5
 p9CY4nKc8xuFyDXrx73YuC58iV3i63ZHtIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl5
 Yiv+JeBZwSsi24vPGlLsa/e+B03sPit4GMR5AIzPfsa4FOGm3crV59OfqvZw1kU4GV3NrXjG
 7ucluHREkfxpUpF5gaNy+6jGqEyaueOe1LI0hK6YoD66jBavCs+z60nA/QVbEZTml2hkst4j
 d5ArvRccy9wVkH3sLlbAkQw/x1WZ/UcouafeCnn66R/8mWdG5fS66Q2ZK0JFdVwFtZfWQlm6
 fEeITYRWRGP78reLGWTE7QEamwLdaEHDatH0p1S5Wix4cUOGPgvd57i995AtArcs+gVdRroi
 2j1XhI0BPjIS0Un1l76k/vSls/w7pX0W2UwRF54OcPbSoUcpeB8+OGFDTbbRjCFbZ58rB+3q
 174xUHkBlYjG/6R0DuK8m3504cjnQujMG4TPJuR06cyxXisnCkUAhBQUkanq/6kjEL4Q8hYN
 0Ef5ispq+416VCvSd7+GRa/pRZovDZFA4YWT7J8tVzLk/KIi+qaLjFsojppR9EhrsA7AxA30
 FuAh/viBCB1sa3TQnWYnluRhWPvZHhKfTRTDcMCZRZcyeegjcYLtRXSEu5SC7WapYLeKy6ll
 lhmqwB73d3/l/Uj1a+24FTGiDKEvYXSQ0g+4QC/dkKo6BloIrGsYYOA4ELeq/1HKe6xUV2pr
 HUC3c+E44gmBpaIkTGLQfkcWrSg4f+KPSf0kVNpB4Mm9Tmm5zikZ484yCFzIgJlP9gJfRftY
 VTPokVB6ZlLJnyoYKRrJYWrBKwXIbPIEN3kUrXRcYBIa50oLAufpng2OQiXwnznl1UqnecnI
 5CHfM2wDHEcT6N60D6xQORb2rgurswj+V7uqVnA50zP+dKjiLS9EN/p7HPmgjgF0Z65
IronPort-HdrOrdr: A9a23:eGF6tK9arWyZAcHkFNpuk+Fudb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8bpYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOReEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWShWNwyEGT3/DRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw1RgUd7DzJm5Xf2eP0A0feNQo/gpieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZeRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu198HLzou
 W1bLp1jx9AR6u1M7z+4HRiyGG8fEytGTLw18pZ+591/rXhWbuDC1zwdGwT
X-IronPort-AV: E=Sophos;i="5.95,196,1661832000"; 
   d="asc'?scan'208,217";a="85587839"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilXuer1s2hilPR2EvCTGTre73twTC2Tt3N4JvQcQrS5EK6nrJucE9y3Ruz8ikk5WasaiL4Wdd4FwloNpoRnL2OTv9DIJKUrvgDKQ9mJH0zAFUn0uH1MnxtsaA0DTAWHO9lXm7XDUOm0XJSOPGG/bHo06hnsREqyWDgATQ2SZqQ/4yFDSGx9xcmLaMMU7Eh9LftLrbsiV9WXxduuzjDYSvOFYn+is/6b/BsSeKJuRh8z/LniESKHR8+SKgWtV3x6QcHfenF+A9ep5FjVlpMqLHjM+z1tRe402ICNRtJzyPeOF4MSvl7nwlJtwVxrp4j4mnt+9g9PBT7KMcco/QM52OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSkTZjb1eo2iV4Ni3JTl84m6pfrasfAIVln131ZTn38=;
 b=KJnKZhGPQf8F2wqUnCvgsR4YwBn6xU9csdMAQU+WZ8v7YzjBMtR5W0WfFuKmqBPHjWPc/vDg6opGEjdUZ/F7zl4tVX3lb63xTLiaSjBxZ3vzshKkpE+tsSTyTBUfgsX/Yh/wzPAaYZjwLQcq6d6V528DhNfwos46DnzOXhfoUh5EBg85z399lq6OjOJ+0GlRgo5wBCkjMYsCiM7tm35rFwGfGjvunmjISbUFyE89Kx4sh0O27X2/Ub7FKBJvWonMuR2lug9GxF+8GjF6oVVA9LHSsO6bz+FqBlu1JTKuMBlBVyLyn3AmvOmKz6ohyWcBbLsWl+IiQdphsWlM8wMjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSkTZjb1eo2iV4Ni3JTl84m6pfrasfAIVln131ZTn38=;
 b=QhC7iTVJ9JcRs0C0hArVYpP24y8Orp/IgCtE1lugmgkDt6QV7AwI8x3TtiENC+D2DwSz419pSfSwd4X4THsmGNSYmRDQxagNr8I/SpaKgy/oHjVvJQrAVrGK0u/hiyXPPEqzoqdzqB0AGGrq4q1Df4OdhJ/wuGLPg0DzjHzAKfo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index:
 AQHYagNDrZ0UxO/94kuHn0c4ykfZPq2wJomAgAADuACAABCxAIAAoG4AgADJ4gCAZOCcgA==
Date: Wed, 19 Oct 2022 11:21:39 +0000
Message-ID: <A28D01E5-F7D1-4AC5-8A41-C03C77BF882E@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
 <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
 <3a975638-9675-9a95-fead-91120edefee1@suse.com>
 <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
 <bd319ac0-0f17-5461-5508-d383dfe07308@suse.com>
In-Reply-To: <bd319ac0-0f17-5461-5508-d383dfe07308@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|CO1PR03MB5859:EE_
x-ms-office365-filtering-correlation-id: bfb303be-7498-4014-4f7a-08dab1c417f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OJ6RmIsWZ9kTtUu89iOwatD+fEmAmMysYgIyfsONZS52GdQPuGrCrCg4bOyXMq3ZNjthZQWFfsfiAMoEePVlX0qmbzuSGMvWMDqJbRP0p7DM3GOW7rv6DS6w45nuzHrGq7jLGUqcAf7D8NqdQgePtzfUpv8man06DJT5AE0WE7vlQSVKBKXD/y0SNEh2rBTV9XWc0fZ1rDP7rEhyEZ5H1+wRFu/K6On5nrd6G0FLmtT2p2F7x/QFcBRYKMvKPK/caBj3U7Lcn597crKtqhLd00NYp4DEqMc8mDPnP47EnGREhQzU9/PD+qEzeoe+7N+9bi/tpUZElBiV44eNjg4cNHm6Sbdl/fA+TnAWWsef96Q/Di6WC14IBbbcWHX57QOBFOWbxky/PXQURtzikxVN7od8SL9LgsvR3LJwJq80/FuvDqG786CEeE3XGhMHTHpaNcOYQ0cwreB/ueYlRu01idOCQjnxeDJZWC1YixNUAxZ6OKz60bR7iV4X8hiLw//Fp12ZdA44meTI0xOOS3L9kVLmdsRlM/AXUHmHdLN5FuHvK95FbER6QJGcvlfUBfzbuCL7oRkDFLAKqVkQx7V/cLPSxrl9quizC0vw7T3wwIeAvFJYom4IX+z8552RhK+JmnckHDFpXyP3/0nenCvE1wIiDXorzDKJ/k5oH7V87s/z8qtalYwmVTR8Fc2r4zX/f+LwXO8Tsa9YTK0qkZBOyoNdkpO3542VJPEo6CFXr4z4nsq0owyZa84xFKRe+C6KNCyMLmUhmhNwtHoBtCKcV8AgG14rcZCQXWvO2vKGV5j19b+klJy3eUwok4mHX+Ai
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199015)(6916009)(54906003)(82960400001)(2616005)(316002)(38100700002)(2906002)(186003)(71200400001)(33656002)(122000001)(99936003)(6486002)(478600001)(38070700005)(36756003)(5660300002)(6506007)(6512007)(8936002)(41300700001)(86362001)(26005)(76116006)(66556008)(107886003)(8676002)(4326008)(66476007)(91956017)(66446008)(64756008)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjZYTW5EQXhGZmgxZjFGNjh3aXcrR3BaWTRqUEtDQTZJYXVrejNKWVNnUWlD?=
 =?utf-8?B?Mmt3WklGMTlpV0ZtZTE1MkRPVkdRcEJWMXpQd2VPQlVNcDFHSURSMXhNUnhC?=
 =?utf-8?B?VjVubmpHeFAzVit6TW5PYjM5ZHdtbENER0lCVTFCZ1V1ampRRkE0MHYrTS9M?=
 =?utf-8?B?cXVvNGtWWUJXdGpidENZeDlOQVZ3Z3BaM2hNZkVIR1lHaUdMbmU1blRwMjV5?=
 =?utf-8?B?dnJDOHhpeUI5UE8yUGZTUjBXNkpqZDgzczNJVG8xVjZLeWh1ME0vRGxLcFBP?=
 =?utf-8?B?UHlubzZlRTFiNGh1cGNLNnlwRVlxSzhGVVltMmIwSlhQQS9VR3V4TUQ3OVYy?=
 =?utf-8?B?S0plc1RzckJjdUhOYTJGOWl6cHRLTW14RXozY0I5K0pZakpDdmRaUmMvbDNF?=
 =?utf-8?B?ZlAxb2QxUjlDd2NKUnlETVVuSUNuMjllcm41N0lYVXAvSktLamp0TWpDcUNP?=
 =?utf-8?B?Q2xnRG52L2NIZjNZbzdQc0w5MktlZ3Q1RDFtN2lOWjhySStiTnJGRlZianQy?=
 =?utf-8?B?V1Rhb1N0dG14cTBLSVI4L1BGTVgzMG4xTURXT0FDOWRVZERMalM2UDNVTERH?=
 =?utf-8?B?eWVoYmVhSHM2WjA3M3IvcmFVRDZwZW91akR3cnh3SkdPTU1URkM3NzRUelpu?=
 =?utf-8?B?S1lHaEh3L0pxcEhjUHI4T2I2bjFTUVZiYU9BQ1ZwNytIQlh5bmQ4RVdRSTVB?=
 =?utf-8?B?TFVFcG5UeE1mWUx2UFpXWTlNc2liTkRBbUpRVW85bHZBaDJzRFZnN2VibGNL?=
 =?utf-8?B?aXdPWmtKWjRlUitqWm94NU1JejFlbkxBQW5ha05UcXN1dWRLWmJ3L0VLQkpq?=
 =?utf-8?B?U0QyR2d0WFJvNEROQ2NCWWU1RDN2VHJGMmpkVzhFdXRsNDloNzZnNnA0RWJE?=
 =?utf-8?B?L25DeDNHdHpFZkNoSFIzYmR3aUdoOWxqTXliWlladllvOE5HYWMyVllXYm43?=
 =?utf-8?B?RXlianNNTFRpUWx3c2ZBK2lZK2Q2QlZEZER0TzBnSEd4a2ttSnowNm5yejhp?=
 =?utf-8?B?c3pSSVVRS0xlMmMrWFVLWDRQNEU4L0RaeHNacjZIVGhYR3RYRGM0eUFJU3NN?=
 =?utf-8?B?dVFXSEl3d3ZuaWdtVzNTK3V2OEgwd0lwdW40ZHA0OFYxVVUvKzZKdWtnMFFy?=
 =?utf-8?B?NUF4aWg2WnZtV0MvS1JhQUZiSndKNWF6NHhSdEladVlvTWp4QjErWEZtTy8r?=
 =?utf-8?B?cHltWTNFQXdVMnZZNVZpWFRHcDBGdThPOEFDSzd2QVlac05ZdkY0TzBFQjNn?=
 =?utf-8?B?aHE0bTA1UW1wdEhuYm5XS0tBanMrem0zNVdLd1B0RFIyMU95d01NUTArOWZx?=
 =?utf-8?B?NzR6aFh3ZkdlRWxOYXFUeXlDRHZOUHpnbHV1dTFoRFE5M3JnWGN5Wk10RjdI?=
 =?utf-8?B?Z0ZxTFNIcTB5dmpOcytocW0vWVdRYXlTVEcvUlVGeVZSUXQvOVBYQ1IwWlRh?=
 =?utf-8?B?OTBKaFc0YXlPQnpOUFdPOXNhMUhBVVU5NzBoNWRIZ0N4MTVDK1hMd1ZxaFV2?=
 =?utf-8?B?RFgxMmZmTU5WNERjcTB3eVVXSU4reG5kTXlRcGdXN0gycXF6VmRuZFFLZkVa?=
 =?utf-8?B?YjJuMVoveHNNN0kyM1pJdkhLTEx6UVk1cnlnNXR5Ykk2QWdJT2VwWVpISG9G?=
 =?utf-8?B?elNheS9zcnJaOVFTZlQ5MUQ2eEYxL00wRU5iT1BTQ29veWZUZE10WDdHS1pY?=
 =?utf-8?B?NG54M0Q0YnMvQjY2RTR4T0c0bTFETHlMdERyak1HNTZobkdjZFh5QlNwZXJP?=
 =?utf-8?B?SHA3NC9hejNpZjVvYktmSVk2RkNaM3ZicWpzVFA0MTZ1b0l6M0ovQXpFU2Mz?=
 =?utf-8?B?UFdtbVVYY0lQWklIMnVaeUlnTDlrL1lXK0tHSm5QK2VKVUozNHNpcFBXRmJm?=
 =?utf-8?B?N3I1dWtyMVI2WW41R2tvUWEySW83UzgwNTJ2RkxySWpOT1V2NUxVZzRwMEJw?=
 =?utf-8?B?ZTFybVZaUmJvRTV4SGU1K1FDbHpBQVg2YUR3YzNwNHhUZ3BFQWYzbnpiTzdR?=
 =?utf-8?B?ZlFtcFVmOUZaY2FIdXdRVHNBOUNDaUk1Z29PK2VNUHVEUkxhVlpJQ0RHd1BE?=
 =?utf-8?B?cE9SaVNxcXcrclZOUnc5NTkxZ25xaUQ3UlBYb2FZYmhoUEtaL2ozaWVRV3NK?=
 =?utf-8?B?bzVlS2RPMUxWTlZQZkpoWVJYY21Xdjlkdm1jODRENE5sblJtNjl6RkFHb240?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A97D27F9-52DA-4212-8F2D-A650CCD30534";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb303be-7498-4014-4f7a-08dab1c417f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 11:21:39.9446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMAneFqisW+bOg2Qk+Q10Yf/I6of1O9Rm2a+vPFNSLpsdcdMIqs5/m+wY3h7JfLTxCT0rVLUVhm5LAuWJNesn1N75Gn1VHKXL+zA03gzWQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5859

--Apple-Mail=_A97D27F9-52DA-4212-8F2D-A650CCD30534
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AE78D5F4-4F3C-482D-B31E-5B1E51AF6CD7"


--Apple-Mail=_AE78D5F4-4F3C-482D-B31E-5B1E51AF6CD7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

This thread was brought to the attention of the Code of Conduct team =
because it contains some fairly serious accusations. Having looked into =
the matter, and given the people involved a chance to respond, we=E2=80=99=
d like to set the record straight (to the best of our current =
knowledge).

First of all, we=E2=80=99d like to acknowledge that the issue addressed =
in this series has been a long-term source of frustration: Andrew first =
mentioned the need for this functionality in 2018, and from then until =
January 2022 repeatedly mentioned it as something critical to get in but =
which he simply didn=E2=80=99t have time to personally address.

That said, while his frustration is understandable, there were a number =
of accusations made which, as far as we can tell, were unfounded; so we =
want to set the record straight. In particular, having looked into the =
history of this series and had discussions with all the parties, we have =
concluded the following:

* Roger attempted to address all of the feedback Andrew gave; and not =
only was the minimum check-in process followed, but Jan and Roger made =
every effort to get Andrew's feedback before checking in the patch.

* The "Suggested-by" tags were reasonable for Roger to have put in, and =
reasonable for Jan to have retained.

This is not the kind of community we strive to be. In particular, we=E2=80=
=99d like to exhort people to avoid charged language and attempt to lay =
out the facts =E2=80=94 with references =E2=80=94 such that they speak =
for themselves.

We are also attempting to improve communication and shared =
understanding, to hopefully keep frustration levels low in the future.

Thanks,

 -The Xen Project Conduct Team

--Apple-Mail=_AE78D5F4-4F3C-482D-B31E-5B1E51AF6CD7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D""><p =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">Hello=
 all,<br class=3D""><br class=3D"">This thread was brought to the =
attention of the Code of Conduct team because it contains some fairly =
serious accusations. Having looked into the matter, and given the people =
involved a chance to respond, we=E2=80=99d like to set the record =
straight (to the best of our current knowledge).<br class=3D""><br =
class=3D"">First of all, we=E2=80=99d like to acknowledge that the issue =
addressed in this series has been a long-term source of frustration: =
Andrew first mentioned the need for this functionality in 2018, and from =
then until January 2022 repeatedly mentioned it as something critical to =
get in but which he simply didn=E2=80=99t have time to personally =
address.<br class=3D""><br class=3D"">That said, while his frustration =
is understandable, there were a number of accusations made which, as far =
as we can tell, were unfounded; so we want to set the record straight. =
In particular, having looked into the history of this series and had =
discussions with all the parties, we have concluded the following:<br =
class=3D""></p><p style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">* Roger attempted to address all of the feedback Andrew =
gave; and not only was the minimum check-in process followed, but Jan =
and Roger made every effort to get Andrew's feedback before checking in =
the patch.<br class=3D""></p><p style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">* The "Suggested-by" tags were =
reasonable for Roger to have put in, and reasonable for Jan to have =
retained.<br class=3D""></p><p style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">This is not the kind of community we =
strive to be. In particular, we=E2=80=99d like to exhort people to avoid =
charged language and attempt to lay out the facts =E2=80=94 with =
references =E2=80=94 such that they speak for themselves.<br =
class=3D""></p><p style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D"">We are also attempting to improve communication and =
shared understanding, to hopefully keep frustration levels low in the =
future.</p><p style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Thanks,</p><p style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">&nbsp;-The Xen Project Conduct =
Team</p></body></html>=

--Apple-Mail=_AE78D5F4-4F3C-482D-B31E-5B1E51AF6CD7--

--Apple-Mail=_A97D27F9-52DA-4212-8F2D-A650CCD30534
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNP3b8ACgkQshXHp8eE
G+1D7Af+JqVw89ekgZQHN3IB40lAwUH8+U5Nkz0DCpimXY7ju96dftZEvUCPT2c1
eXN3Cbo95K5ADpFJDIt9Up5kxitquPT97En916EfkCLbFMjOkmQ8aRUv47KnyLur
kifNn7EnqnGOAx/XhWBWOeBY+exSS0S1HpGwfO1DZ6V/HwRR1iZrF+cV/+RdmTyl
BwlbyLlz294cdzX9ecML3GzWJ1J6hqH8oAKNkLv3v9TlGIaHvU/gCzDSEG/1Q64/
uxn1xr8SRQjok0GPVEXUku70Y3cjYKbPNpR+w4zlGa6DokELxW+iH/3Rz+TVzl1O
y9H6wXzRPrD6dFckr8RDPucP8UD2dw==
=8jZb
-----END PGP SIGNATURE-----

--Apple-Mail=_A97D27F9-52DA-4212-8F2D-A650CCD30534--

