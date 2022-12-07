Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F476459B3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 13:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456261.714014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2tKO-0003G0-Rd; Wed, 07 Dec 2022 12:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456261.714014; Wed, 07 Dec 2022 12:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2tKO-0003EC-O7; Wed, 07 Dec 2022 12:15:08 +0000
Received: by outflank-mailman (input) for mailman id 456261;
 Wed, 07 Dec 2022 12:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eywS=4F=citrix.com=prvs=333a73d03=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2tKM-00038K-KI
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 12:15:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6b32f16-7628-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 13:15:04 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Dec 2022 07:15:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6634.namprd03.prod.outlook.com (2603:10b6:303:129::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 12:14:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 12:14:58 +0000
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
X-Inumbo-ID: c6b32f16-7628-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670415304;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kfjaaFPr9qgIK24GxosCHUID4h8ezX3uAoK8NINR+es=;
  b=HOBPnEKAknM0gj9FcOsNGTHVXfDcg0koeJypj1IhalH+3Pm4HN6Oxqon
   pcO4pD8IQ6siJUYKtoAZlyfkeNNIsaRgW3yzdhby7xav71kbGZep0/IB7
   VXsIz4Pf11Jxh3mjzlGl0zYKh/ZlfEnjORHL7D934jXSHVqeD8T7k+zMO
   Y=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 87045634
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:COKRFqofxrqROcTsWekjyYTryGpeBmLvZBIvgKrLsJaIsI4StFCzt
 garIBnTOamDa2r0eo10PNi0ph4O6JXWzt5lTVdv+Cs9EHgQ9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzyZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABM3Y0i52O+S+Ymqd+8vg/k6NebJLZxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqaY23QPImgT/DjUnegec+eu0mHeYeMJxO
 VMV2zItq5Y9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAIQztAQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13rKdtza7IyUWBW4Eey4fTAEB7sXjoYc8lRbGRJBoF6vdpsLxMSH9x
 XaNtidWr6kSiOYb2qP9+krI6xq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxc7Wal
 H0Nmszb6f9UC5iIzXSJWL9UROHv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S97Z5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:iDmVOqxBAXXo2ZExnmYaKrPwKr1zdoMgy1knxilNoH1uA6qlfq
 WV98jzuiWatN98Yh8dcLO7Scq9qBHnlKKdiLN5Vd3OMDUO3lHYTr2KhrGD/9SPIVybysdtkY
 tmbqhiGJnRIDFB/KHHCdCDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.96,225,1665460800"; 
   d="scan'208";a="87045634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY7jcwyZRDe4L/FUzyc8CtQUYeBq256OkgTokosvr94hnnobbx9SLh4M3WgyaJIXfv0yrdE1Xt+FEeL/GWXL2avndpvbFrsCYQ91W5ZwnufrhF9jPJ4mSurkt6yjNcXF6A7/4VgilMJtaRLL2JY1nx50L5ukE3vXit2e8TELGeO485Zzv1IeSniRvhcwlwogkdjIY7BdphuTBkMPFSL4MiC9URb8v+boFSktze6tPdj9yudMmVZmJUVjA6VrVTMFeNafSKLFXxG/6i/6W//nmVosiyLqzpdyH4KnigFo+Gl2/rPMbVM6ekwyEqFjG2R6rqvXynhSRqwpbJwjC4qD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfjaaFPr9qgIK24GxosCHUID4h8ezX3uAoK8NINR+es=;
 b=U7viJugYOCv5uj0ctwogq4WuPlNQptwYmwa+3LtFMs6/ko1e5Cvjumv43xBIdrHYcrOUfmVZ9VnFgem7XacasjmJBt9QZ1OTdOFGMw4NxuuEYwHPyJ/D8LLbT1M6+XLMnE9sOtVUvUa5uaraLu6qSSwWLGEQvy8Yp+h57EOAZ/eYMCmSbTE7dwJrFljaetX5qVRmAOZ2U202h0JOzSnhVwR8+FsifOPwSIWJyQ06nPN0kZZXmJL1yJxPX3lCj328C+7R2cKIU3FSwXWQPds7g/pqno09o/qVfCYNWrrOzxgKiZ9zFbigYgIK/iymFZAWEJPGW+9TAMLGu+VqmVwHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfjaaFPr9qgIK24GxosCHUID4h8ezX3uAoK8NINR+es=;
 b=oxG9lVEs7+es2HttJDJYzkdMR9Lnz2Mtw7nCpjkp6/IKXAURfWdB8V5aFuLXo2YhOXWnTujscG2WfldZPUp0f0fizfwYqHT2DE7MIvoz8HwOh9lFre2gBB260HqI9s/rAwDcxlXpRi4rXIWyKy8//cnLcEUlPDIKIRLLGfGFfOA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Thread-Topic: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Thread-Index: AQHZCSwNNVwbw+XjekWbbMfdFBpGtK5gw/oAgABhoICAAQgcAIAAKvyA
Date: Wed, 7 Dec 2022 12:14:58 +0000
Message-ID: <52b63509-8549-4bc5-be10-6ebb54b739d7@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
 <9bb20bca-34af-bff6-b9f0-0c2ce38d2a46@citrix.com>
 <Y4+CKb0slxo9hJW3@itl-email> <775a5d15-b3f1-ff82-0970-9ecfe7986f90@suse.com>
In-Reply-To: <775a5d15-b3f1-ff82-0970-9ecfe7986f90@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6634:EE_
x-ms-office365-filtering-correlation-id: 8e418e45-66a1-40f1-5e6a-08dad84ca88b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fIFVxrE2/5qWIrzHlAgeqRbc2zHpK/fZrpiXj0l3qKM0xnHz+zDSoajSHyA+SlDyPDUXnIOE+zLU0Cqz9Qs2y1JRDx2LtPvvNQYXJt0TThHcxZ8tny/N5SVAF4YCZ9035YZq37ztzpjvn5Vtd46MNiX2JtveyR/1gPMfvkDAsymTAmRA49kF1sYvzvVy6r4D9jacHaNcbmrxf3154IP4x6Yyz6r5bUXeI3MXI3gXwPmBjbZqYxJL8rwO2ESVpHV+vz9ooqtu8QrfbPgXmI9mNWDOxAQsAjjrX+dIs2Ak0/K5Y7YFsopJTCKTNaEuO5I3Y4nQvJF7JVuwG9jBKTezxmiP2lrhTKIhe+Rpgtmcwo9/0ari6wTSOUuX3GV15EOZBwyxgxKmDfjvDRs7FCfZkgYXlR5GZ7v2NYKsfNA2wGtUG1AovBKb2XJBa7d5p8Y7ZobnIGVdSDr+OTh8F0FbyfMH+fNf0BiLMSy0Sjk7G1GDw901b3IugOmkU6fEaoRg8DVdTpf5cH94fb+/tf/ncSpagua90wXCmawAp6MFkuoHxGfDIqLHhemnyg9RsM4VDjvpbs1c7ib5Nj3IGI0UD0OhHwyRxkOeRqHna+8cyOi6XR+yN9Isp5Vg5j39uJeuSNWR9ih/8xaodbiDsAlAkIr+WaypJOZ5Tn7+3mw3zjrzFE5pNHD4HRhqji4vMFUBC+md7OlNB21Zd2i3wdWziAGRrjhGBPD0N+iLPEKmUttBag0AuczQ//zJ8A/Wy9GsqdH3EHsY+p2Vy+2CmLJi3A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(2906002)(76116006)(91956017)(82960400001)(64756008)(8676002)(66556008)(66476007)(316002)(66946007)(66446008)(8936002)(6512007)(5660300002)(2616005)(186003)(83380400001)(26005)(36756003)(54906003)(41300700001)(38100700002)(110136005)(4326008)(31686004)(53546011)(6506007)(38070700005)(6486002)(31696002)(478600001)(122000001)(71200400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTE3ZVFJT2hVQ1ZNWkp5TndFMFFEcncwL0F0SWtyZkZvS2xhakZVZWgwU0lE?=
 =?utf-8?B?YjV1SWZZaWJjbTEwNE5FVDdSdUVlN3hUNUNKb2Y4YWZRNWpHblUxaW5JbXdw?=
 =?utf-8?B?MkFEQmZPYTdOdlFha3QwNXY5dzRiWWVlWElPMVUwODRvNjZvSmN5RGJvWjRG?=
 =?utf-8?B?U0N0STJndS9TZ0h2R3k0TCswbEMzSkE4TGNPV1hoZk1qSTZYcFlsbDRJMXR4?=
 =?utf-8?B?cUNyYTIwdzNnR2pkUWRHNTlqL21NU3UwU3Fya3h5SGhhZmF0UThTb002UFN3?=
 =?utf-8?B?eG1saWwrUGJBQkYrWGc1SWd3Z2NCZGhoUHZheFhuT1puZmpFOW1zSFZNM0t5?=
 =?utf-8?B?YkVDWGtUT1Z0a1FhSDkzUEpjOTZhYXhrSHRpZUpjK1RzZzcvSmI3RVNoeGha?=
 =?utf-8?B?RSszSXJERmhjVFowTy90ZDFJbDhweFk4V3hGS1lJUU9OUDU5SmFQL3dlUGhu?=
 =?utf-8?B?em5qVHUvYkVuVVdOc2o0dks0VjhWSFFFaWRtSndsdHRTUzlkckJoTjNUV1NZ?=
 =?utf-8?B?aU9SZkxvZGN3QUN6OTJ0ODJLQmdIQk1qMTFYck9vbjZ1TEVCSVJGUXdvUGZ2?=
 =?utf-8?B?VGIyR1pLUEV0WDB3RGFIc3ZkaDMvN0NRckhtank3Mk9SNmNlQW9CYVloR2Nv?=
 =?utf-8?B?c0RISDFJdE1CWE1jRFMyR1RNWTdHWVVSdFA3MS9odGRXWFNvVWdvcmJWZGFY?=
 =?utf-8?B?Y080UVg1V0FlMmJObnNTMHhBUWkvVVlNM1E4KzFXcU11NFk4dGtIM1d1Y2dK?=
 =?utf-8?B?U05LUm5XNURkaEI1VmpCWTNTVEVyZzV4L2RxRENpTWRmbC9SaXRWa3pheEZz?=
 =?utf-8?B?azBrK1VpZlkwbnBFVWc4ZkFaL2MxS2p6ODFGaG9UQzFtUEwzanRRcVVtTW9X?=
 =?utf-8?B?OGRTYkxYeFhSQmxVdHRXQVZpeHJPaGNBNy95d20zYk5UVHJKZUoyeDYwMUd2?=
 =?utf-8?B?TW5maUx6T0JJNmNTY0o2NGdtYkZ4Z2JqYjhvelN0Sk9vNUhRK1IreFVUR29H?=
 =?utf-8?B?WVhEQklCYXU3UzBKODBSTFJxQ25VaUFIK0lVMnMrUXU0NGgrTlp1K3JGSHJu?=
 =?utf-8?B?amFUckNMZTlTZkcvZHhQSGVDM09TMkdvcUVHMEM5Wk0yMzl4ay9jcGpkVkxx?=
 =?utf-8?B?ejRwTDNpcjJyak91UHF1SmtkcTg1T0JOcCtUV2Z3WXNldUsrWFRQQjV2dDlS?=
 =?utf-8?B?VU9ZdFBqY3dCaWwzNnk3b0ZrRnNTMU1uWjBja3M0QUMrNkY4TjhXMkhCSzFn?=
 =?utf-8?B?TmJUUkczcW5MMGw0eEljQVI4TDBJNy8yclF0SGROQnlxakloc2VTWUVFUEY4?=
 =?utf-8?B?ZGYrVDV4QVhzYk5BRks0MldvSEd3OTNyVEZsbDlSaiswS2gyaUFoVDVEaE5W?=
 =?utf-8?B?bG4yeFBxdUh4YWplWUQ3MjIvY2xLQllvNjY3SEhoRHF0UytwTUZpM04yU2JW?=
 =?utf-8?B?VGN0MlBBQlZVZU5DZDZBeDlLbkwvUG1GMGMvekd1a1BRMFVKc0JoMUZVWHNv?=
 =?utf-8?B?dGxDTWhFNk52UGV2UjgvL1JjR1RlNHZQTEFGa2dnWUVLSHpDeGYvN1B4ZGhI?=
 =?utf-8?B?Z1dxdFBqQ2t3VmhJNTVmc2JJbzBrQmw5eFU4NmZ2T3hiNWZxaUZmNXlNUmdy?=
 =?utf-8?B?VHQ5WlQ1dFpxVVZrRk5ROGFrcVBPdEZNVXZyZFdKOUtsRkpnQzNIek1sOGxT?=
 =?utf-8?B?NUZnQW5FUURORVJzdExQVDEvYktzTXJCbFNaZTBzNFBVS3BwblVvdDJ5eVh1?=
 =?utf-8?B?SU1VQ0p2dTlqN1kwVFhxaER3aXBsNFg5YzlNaU9FNW56UG8yZ2lEN2haME95?=
 =?utf-8?B?SzRCRlJYTG1LRUtvSldORkhpYVhVUXpQNjZWYmpHZDNlSzFTR3czRXVnQnl3?=
 =?utf-8?B?UHMvbndiVldmTnMzUnpSRGpZaEpxaUdtNGgwMU05Wk5WVTZSN3FCRUVoREJr?=
 =?utf-8?B?eUpWMnlzWlZ2b09MTEU1S2NGMjI4eXN3bi9oaVEwbFIzc1d6VFI3b3J0Q1B2?=
 =?utf-8?B?cTFEZ0pmanFPWkhieURISm9ETFRldkhkd3d2TCtVN1BWYjdWLzhLaGF6KzVj?=
 =?utf-8?B?TkdmUmpmaUNRWFh3UUtmR1c0VW54bXlhN1dQQm9nbFByeS9peEVyck5CS3lt?=
 =?utf-8?Q?JdGirctrGszlfqjnONEG9OBdC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A1E4DE1B45B44791D5192BC932C991@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?azVUTHZDRkt0TENpb3NYS2w1QVJMT3I0UnFYbnlWU2ZJd1FGL3NoZ29XMnZH?=
 =?utf-8?B?WDdmV3F6cFVzbm5KYXpEenJkU2E5ejhhMFhGYnYxVVoycXdrT1pCdGFEOG13?=
 =?utf-8?B?M1hQMytBbG5ZMUMxYmdMQytlemFGNENOb3RsUnFoRlo1SUYzN2JneVpFY0RT?=
 =?utf-8?B?dThmeXJPQWJsdEVKdFlsb21CUXNid1Z2UEo3SHR6RkFtWjRuZ3pEcXZzOTYz?=
 =?utf-8?B?VzFTMFVZT1dLY21SajVIcFhnbG1uMmZRREF4QnU4Yms4Vng4bkhtaHFwU2Mw?=
 =?utf-8?B?SmY3ZENUMm1mTVVmb25yYzJ4cHJFZWQrWGdHcHBKVE52ZUpqQllHUnE4VkpU?=
 =?utf-8?B?Wm1rckExUUFxcUxJa0lSelI4S3ZoY0xzdTRSeGFEOWpYSDR6TjJ5OTNIR3ZG?=
 =?utf-8?B?bGRYZTlsZGpKazJuT2R3RmhDd1pwMWFlY2VYMk1MUGlJVGdIQkQ3OUJTbWRE?=
 =?utf-8?B?Q1E1L3QwMGJPTkVmY21RdUxlTHMrWHdZcU9MS2RuSDNiZUxzdVE1aUJ4a0hI?=
 =?utf-8?B?SHgrS21CRTRIcXd2NXlvbTdubURvbU9Jc2UrRWtvZjAwN3hZQm1OQzNLZVRQ?=
 =?utf-8?B?OWlRMkhOQmtSODMzWmpmSDdWYjBYUkU0VjJDVkxVYXBNT0t0ZEVOcm1QVWs2?=
 =?utf-8?B?dUt1cjR4OUttOUJQK2g5OURJOW0rdTNEeTlpM0E0cWFqbjF3dEdNN0tRbUJZ?=
 =?utf-8?B?ZFVTb1ArOVBDL01henJNNjVWaytGL24zNlFrcS9GNHV2WElKZ1pQdyswY1Fw?=
 =?utf-8?B?Slp0aCtXWm5YQnNqdkR5OURVQ1o5VVBBeGxhSFMxejkvTmNmWEt6NXBoZGZO?=
 =?utf-8?B?TVFEK3J3ejJDa3h4SVRqZG5BNG9oZWovcVV0V3JJVENXK1EzQzgxeXQ5Ly9t?=
 =?utf-8?B?ZFBsOE1hQ2xmM2x0YkFqNTFJRENKclErYURLRy9vWTBLZGlDOHhFR1U0SWU0?=
 =?utf-8?B?eXdTZDF4TXpGSzcvWmNLOTA5QkZRR09aU1hzMkJJOWFOWllnMGdEMXB5VXBU?=
 =?utf-8?B?SGxtS1VlYkxOOGtXWnRYMS9vTmhKcU5CNFNWbzB4VHNaaU03d2QwU3RsVmV3?=
 =?utf-8?B?KzBoeEt3QTBrVDhjN251VlZzREN1YVNZRWc5cDB1OXRaYXFPakV5UHFRSEl3?=
 =?utf-8?B?ZjY3aW9UYWw4YkN1WjhIaTJEK0NRTjFsK3pSQXdZV3RVeldMZ3FJNFprZkdv?=
 =?utf-8?B?TmlFbi9wbnR1R2dqMHdLQmZ2ZjMzV3IyTk1COEppU2NYWE82cFNES3dlNUpl?=
 =?utf-8?B?MCt0ZEN6ck01Ylc0ODZvSDBsWmNkekZFeEdpd1dqVjVBb1JGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e418e45-66a1-40f1-5e6a-08dad84ca88b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 12:14:58.2854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oyQd3Zp4CpPHC/MYZmMDAC0/yNbp0Voo4mV0vKYgaxV7PC+eAiMfonJuNqbs6a8BJf5LeWO1l/gcFVlMQH2v40P1FzGdNWog7u/gaSaTFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6634

T24gMDcvMTIvMjAyMiAwOTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA2LjEyLjIwMjIg
MTg6NTUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4+IE9uIFR1ZSwgRGVjIDA2LCAyMDIy
IGF0IDEyOjA2OjI0UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMDYvMTIv
MjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPj4+PiBAQCAtOTYxLDEzICsx
MDAwLDI0IEBAIGdldF9wYWdlX2Zyb21fbDFlKA0KPj4+PiAgDQo+Pj4+ICAgICAgICAgIHN3aXRj
aCAoIGwxZiAmIFBBR0VfQ0FDSEVfQVRUUlMgKQ0KPj4+PiAgICAgICAgICB7DQo+Pj4+IC0gICAg
ICAgIGNhc2UgX1BBR0VfV0I6DQo+Pj4+ICsgICAgICAgIGRlZmF1bHQ6DQo+Pj4+ICsjaWZuZGVm
IE5ERUJVRw0KPj4+PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcNCj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAiZCVkOiBHdWVzdCB0cmllZCB0byB1c2UgYmFkIGNhY2hhYmls
aXR5IGF0dHJpYnV0ZSAldSBmb3IgTUZOICVseFxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICBsMWVfb3duZXItPmRvbWFpbl9pZCwgbDFmICYgUEFHRV9DQUNIRV9BVFRSUywgbWZuKTsNCj4+
PiAlcGQuwqAgWW91IGFic29sdXRlbHkgd2FudCB0byBjb252ZXJ0IHRoZSBQVEUgYml0cyB0byBh
IFBBVCB2YWx1ZSBiZWZvcmUNCj4+PiBwcmluaXRpbmcgKGRlY2ltYWwgb24gYSBQVEUgdmFsdWUg
aXMgdXNlbGVzcyksIGFuZCAlUFJJX21mbi4NCj4+IEnigJlsbCBoYXZlIHRvIGxvb2sgYXQgdGhl
IHJlc3Qgb2YgdGhlIFhlbiB0cmVlIHRvIHNlZSBob3cgdG8gdXNlIHRoaXMuDQo+Pg0KPj4+PiAr
ICAgICAgICAgICAgcHZfaW5qZWN0X2h3X2V4Y2VwdGlvbihUUkFQX2dwX2ZhdWx0LCAwKTsNCj4+
PiBBcyBJIHNhaWQgb24gSVJDLCB3ZSBkbyB3YW50IHRoaXMsIGJ1dCBJJ20gbm90IGNlcnRhaW4g
aWYgd2UgY2FuIGdldA0KPj4+IGF3YXkgd2l0aCBqdXN0IGVuYWJsaW5nIGl0IGluIGRlYnVnIGJ1
aWxkcy7CoCBfUEFHRV9HTlRUQUIgd2FzIG9rIGJlY2F1c2UNCj4+PiBpdCBoYXMgYWx3YXlzIGJl
ZW4gbGlrZSB0aGF0LCBidXQgdGhlcmUncyBhIG5vbi10cml2aWFsIGNoYW5jZSB0aGF0DQo+Pj4g
dGhlcmUgYXJlIGV4aXN0aW5nIGRvbTAga2VybmVscyB3aGljaCB2aW9sYXRlIHRoaXMgY29uc3Ry
YWludC4NCj4+IEkgY2hvc2UgdGhpcyBhcHByb2FjaCBiZWNhdXNlIGl0IGlzIHZlcnkgc2ltcGxl
IHRvIGltcGxlbWVudC4gIEFueXRoaW5nDQo+PiBtb3JlIGNvbXBsZXggb3VnaHQgdG8gYmUgaW4g
YSBzZXBhcmF0ZSBwYXRjaCwgSU1PLg0KPj4NCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+PiArI2VuZGlmDQo+IEFzIHRvICJjb21wbGV4IjogSnVzdCB0aGUgInJldHVybiAt
RUlOVkFMIiB3b3VsZCBiZSB5ZXQgbGVzcyBjb21wbGV4Lg0KPiBJcnJlc3BlY3RpdmUgb2YgdGhl
IHJlbWFyayBteSB1bmRlcnN0YW5kaW5nIG9mIEFuZHJldydzIHJlc3BvbnNlIGlzIHRoYXQNCj4g
dGhlIGNvbmNlcm4gZXh0ZW5kcyB0byB0aGUgZXJyb3IgcmV0dXJuIGFzIHdlbGwuDQoNCkl0J3Mg
YSB0cmFkZW9mZi4NCg0KRnJvbSBhIGRlYnVnZ2luZyBwb2ludCBvZiB2aWV3LCAjR1AgaXMgYWJz
b2x1dGVseSB0aGUgd2F5IHRvIGdvLCBiZWNhdXNlDQp5b3UgZ2V0IGEgZnVsbCBiYWNrdHJhY2Ug
b3V0IGluIExpbnV4LsKgIEl0IGRvZXNuJ3QgbWF0dGVyIGluIHRoZQ0Kc2xpZ2h0ZXN0IHdoaWNo
IHNpZGUgb2YgdGhlIFNZU0NBTEwgaW5zdHJ1Y3Rpb24gaXQgcG9pbnRzIGF0LCBiZWNhdXNlDQp0
aGF0J3Mgbm90IHRoZSBpbnRlcmVzdGluZyBpbmZvcm1hdGlvbiB0byBsb29rIGF0Lg0KDQpSZXR1
cm5pbmcgLUVJTlZBTCBzdG9wcyB0aGUgcHJvYmxlbWF0aWMgY2FjaGUgYXR0cmlidXRlcyBmcm9t
IGJlaW5nDQp1c2VkLCBidXQgaXMgZmFyIG1vcmUgdmFyaWFibGUgaW4gdGVybXMgb2Ygbm90aWNl
YWJsZSBjaGFuZ2UgaW5zaWRlDQpMaW51eC7CoCBJdCByYW5nZXMgZnJvbSBoaXR0aW5nIGEgQlVH
KCksIHRvIGhhdmluZyB0aGUgcmV0dXJuIGNvZGUgbG9zdC4NCg0KDQpJbiB0aGlzIGNhc2UsIEkn
ZCBlcnIgb24gdGhlIHNpZGUgb2YgYSAjR1AgZmF1bHQgYmVjYXVzZSBpdCBpcyBhDQpkZWZpbml0
ZSBlcnJvciBpbiB0aGUgZ3Vlc3QgbmVlZGluZyBkZWJ1Z2dpbmcgYW5kIGZpeGluZy7CoCBCdXQg
YXMgSSBzYWlkDQpvcmlnaW5hbGx5LCBpdCBwcm9iYWJseSBuZWVkcyB0byBiZSBvbi1ieS1kZWZh
dWx0IHdpdGggYSBrbm9iIHRvIGRpc2FibGUuDQoNCn5BbmRyZXcNCg==

