Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD875F54D0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 14:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416155.660798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3yy-0006F9-Ia; Wed, 05 Oct 2022 12:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416155.660798; Wed, 05 Oct 2022 12:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3yy-0006CK-FS; Wed, 05 Oct 2022 12:58:40 +0000
Received: by outflank-mailman (input) for mailman id 416155;
 Wed, 05 Oct 2022 12:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iqu=2G=citrix.com=prvs=270658c04=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1og3yx-0006CE-FU
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 12:58:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd332fd-44ad-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 14:58:36 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 08:58:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6583.namprd03.prod.outlook.com (2603:10b6:a03:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 12:58:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Wed, 5 Oct 2022
 12:58:26 +0000
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
X-Inumbo-ID: 6bd332fd-44ad-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664974716;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nqX9Li74g/uSXMzsbhfgGPlCUOXaCz498NvQNGl/plI=;
  b=BfQ8gH9y3LGHnee5MAijIOeklYhxon8O/wglXH1jMXUYItaps7YPjAEu
   7a9plzAIbZdJPaMrauPRw5eRvCEE0P/jP239I5ZXBX8Aq4azafJ8/dgV1
   8paWaZoieDvk/4otKYutTBze7/Q60UzbW5Zx3pIM2cCqawVGbIT39rL0C
   w=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 81142661
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GJ9N4qtYgePDxUBD3UlJp2A/f+fnVKZfMUV32f8akzHdYApBsoF/q
 tZmKWjTM6vZNGCjf95xaI2y80MCuZfcyoBgTVNlpCBkHi4b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPagW5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklAz
 OEcFg8HcSykhvzn0YjlFLJlq+gaeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNtLSOfmqKcCbFu7x0hIJAwxD0KC8aOSqkyGUZEFM
 nUSw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqY/62RpCm/OgAUK3EDfi4OSQYZ49jlr5o3hxiJRdFmeIa5g9j0MTD23
 TGRrSI6iqkTjMgEzKGy9xbMhDfEjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTG8U
 GMsnsGf6KUCCM+LnSnUGuEVRuj2v7CCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUqzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:h8MEKanKKJLF1FPfnNoWAGTRcwHpDfMEiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtlqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWDHAcEcYa
 xT5fPnlbFrmGChHjbkV65UsYWRt0EIb1O7q445y5SoOnZt7StEJgAjtbEidz87he4Aot9/lq
 T52+1T5c9zpoV9V9MDOM4RBcSwEWDDWhTKLSabJknmDrgOPzbXp4fw+6hd3pDiRHUk9upEpH
 36aiIviUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeaGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPia6Y0JKqitT75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4nVlUBg==
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="81142661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmGdpDr/1Yd+p/AH8YS4nriBEaEmSAM12kZrv1DeDcmlybiS4uPWfsObpocu0VZf9eJJxVKN8QR7af3h8fPQ2JLBc4+FFT2fW3bwcwNoJbWeeznqwFX7EW9wCTf1WOgYSfap0LCKy5dxIocOx5+EszNPtltmrBerPpDgYXPhFz6j3NzbiesMR12668siGxwQiFueo0pElTrsBIG34irwNaiaKl5lEqjcjXQkEFMNLJe/CTVqZT66EyH733hGObxpnXNTcY126bf9XesKc59n0/vS0lQZiOJYyAgP7WN6Ns4nI4HMV1dzs2pyBGNAoC5Ao8GgQ213b8d8kQKjtYoPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqX9Li74g/uSXMzsbhfgGPlCUOXaCz498NvQNGl/plI=;
 b=eIrUOzQLu/es6+wC9VoB58zJ3OP547UmPt5wL+RJTaQYA2OikKsTwCHmmAsltXI8p38l5OB6YmkeoDSUEOP4+KKh+/3AdGBqLBtQI60GALPTgmEKWB1lhYfh+/WVmG3z28Iq/uYPB3cS9/lxuszZzwEMqs10aGrovEJuNamOtl+z0AzjQy3Oqmqo0+WUJZqZ0OinOfX24+sYn+5B68l6bgij1VJ0J2XOvamZlE4LdVtTlD1Ak4LKE8fOzUVPc3pEjvPDELafCds9YCtf1GJtrucBI1conlXA21Y8KYh05Fw0gTtoJziXtIyngOnDv14uNpWj1qdolsPcjQXs45m9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqX9Li74g/uSXMzsbhfgGPlCUOXaCz498NvQNGl/plI=;
 b=aFJgZvOWpauSxSaWM4hCmXaX5667frzGszPg2NpRTT4mmumDFW4OIx6+fQdysT43onEBsSSAwTLbnhNWRY5jNhO0/C/HiRFJeA3lSykvGmONJV0uhFQ8Bjui6UmW5tBSf1HXC6wg1kzTEUwb3GeAZtph1LVebAFH+Zq5gwGQxbA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Topic: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Index: AQHY2AuYxJImxml8GUGenwgOwsThN63/X+4AgABkSoA=
Date: Wed, 5 Oct 2022 12:58:26 +0000
Message-ID: <ccd05cfe-1f77-5bd3-996b-bfcaf2ae30f8@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
 <50324b35-5b75-18b6-6ee7-fbe9b5f5d662@suse.com>
In-Reply-To: <50324b35-5b75-18b6-6ee7-fbe9b5f5d662@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6583:EE_
x-ms-office365-filtering-correlation-id: be78607e-76fc-4ae6-982d-08daa6d14ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5Vk4kp3EIFtOFEXtzm3twdAJY9UkfJJtPHqiI0H6OJbNfDm6f+/Wy7t0mJNEmjxTOtzafd9JeEkQ7LKWLIwWI48XVfctlT1ODCyVTpE6vfs06v4zJjzvwZxYOLk7zDHG5T5If/DDHvJg3/7m53Okdsu/9ZDSej8zARmG9bIRRQWHkrVswWC+90eTGpzViL917fR7C2Eyh3UzpCSQaLO/aiU6bgp6MwElrs8wprMltWBbNA37jY38TjJcG6PqrFmHMLzewdZHJoobttmOXtK1v+AJ1PpIirmc7ovNgEZzH9eq8p3SElAe9xyGO5DIeklamfQjJZIoQHjhgUV/xLp71ErCUyR6qSJA3PSPmWVCv3tjArIFZP9J8apGTaFEbFcU+5IvGZV1QPsyztD3ovNvTHYWhEne87/K0p+6jBIR32hAhhdt9B4QtRCEuIKeWKT2rOUdUuGr+z/TBbnQYlzstjbheYqjE8fZFs9JR6Je2N0f7wEpkMbXLbGOQOgInvaceJiTu1HyQg4kPwCk4aLQijC7ZIB8CuhkBV/KAMf+DrhZvnZ1BRv4oZCWTDSMzM4jHVwy5WLV7ilSJSh2c8jHqe23OocYFHPLcaRd0syld278Um/SoC4MFj0Nj98VZD+toxEKkh2jQfVquJ2ucKxGlJx7tu2rxvBxvvgEayLBl88f+t7fKFu912rwqVZ8j2PHT5sbXua996QqD/Pqljhp5yipzdp91in7sfn4/VYiMDYwXCN40F6vxqviS6ggSEqraMGLH07HhAGEhWiMFGST1rBRHBZP3vV/elm7kerliBNuoN/Pb4S7shI6DfB4LCtEJFKVRErNhcHwCKW1/xfLnw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(76116006)(54906003)(6916009)(478600001)(316002)(31686004)(6486002)(71200400001)(91956017)(66446008)(66946007)(8676002)(4326008)(66556008)(66476007)(64756008)(8936002)(6512007)(26005)(41300700001)(5660300002)(82960400001)(53546011)(2616005)(186003)(2906002)(6506007)(36756003)(38070700005)(31696002)(122000001)(38100700002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTFvMXdpYUVTQmt2ZzU0b1lpckZlYzZsTWVWcFdVYnRuN0tJeTNhclU2dmxQ?=
 =?utf-8?B?L3FqNTF0OW9tdnRKUHdXdVRNdHdCTjh4OWY3YWtqWUhpSzdFd2phSkp1a0Jv?=
 =?utf-8?B?ODVmZVlndk9mbEVuR1lkQ1NhN1A0bEszbHdjMm1tZlAyTGlMOFpoNUJlY3kz?=
 =?utf-8?B?OXFHckVpVGZnQ1NvQlR5K04zNWt2bFp0RnNabWdEcFEwRGV0dmhCUjE5MWNB?=
 =?utf-8?B?bW1zSG5wYUR5ZHUrazEwazBSOWZLc2N6RkZkdjZMMWQ1NG1KcGw0MmdCNnpF?=
 =?utf-8?B?L3JiWWpPUXV6TkNqVER4L3FmSFJVRE1RN0tDQXVndE9hc2N3QTU0WFQxcWtC?=
 =?utf-8?B?OHIxcmphSXZyb3AyUzhrSTlSbkdFVzVVbklXb2kwRk90VkVJV3h5cXU5Tmlj?=
 =?utf-8?B?clpZcUpjU0xOMXlDaFRHV2hsOU5pMEhSMEZkSFBTbjMrcjlOa2xhV2VDSmFO?=
 =?utf-8?B?cURrQzJpYzFwMituK2NsRlFna3JiWndBSXhTOUJ6dG1nZnRjLzBGa1ZTNnhu?=
 =?utf-8?B?SEsxR25DelNOUkluNWs0ejlPMFkzd0RhU1JRN056Y3lVSDJLZlh3L1cySHZM?=
 =?utf-8?B?dW9DVUR2bHBVaVBGMVhjTnhnOUtiaDdSMU42TThHWDZabytjVW5WeXM1WGt6?=
 =?utf-8?B?U3I4cUVUSmNMR1FtNVZ4SWRhVmg4Y3RET0lucjFpYmdRekNCNzdsZW9qY2tS?=
 =?utf-8?B?a0k3ZHdJR0F3aDdpSktUMzBRZUpMSURyN2NNUkVwQmFNVUFkSlJiaVRkdVhF?=
 =?utf-8?B?NE80NmpVSmZDVHNGWE9ka2tGelhObEcyVThHMjZZMjdjVU9JMVUzOFlqZkN1?=
 =?utf-8?B?bVpmVklpNEw4a3dKWExraUdkbjAzV09nclcvU1haSjUrSTZQdm9PREQxN1Jq?=
 =?utf-8?B?NlA1UmZpYzBjNG5iMGhQS2g5Nm8xcnMwaXdReXdkVHJNaHNnR05uVHhSTWly?=
 =?utf-8?B?dUx2eFBKME45YUM2c1puUy9hWW5IclhJZTExUXNTYXpTcE53Y2tNTkNjOWNF?=
 =?utf-8?B?bWxmU0RPbTZnd1Fpb0Z4VXdKZTdOeEk4M0dVTjd3QjNscERubEgyb1BNdTlp?=
 =?utf-8?B?cEVPcnpUYjlvMlV0MFk4ZlBlR3YwNElkN0REcTZtMWg4Qms5Q3hoRmhvejlj?=
 =?utf-8?B?aVl5dTN5cEhUVnRXTG81d1dXZnl0S2lkUHNaTXZ1SmVxZTdmakhKWlAzNGFw?=
 =?utf-8?B?RDZyNWI1NHpGbDJhQit2N0llRWJscnhwaEo1YU1wT3FJeTZBN1VWNVdxVUlQ?=
 =?utf-8?B?S0FseVZ4R3dialhlRnNqL1ZpeWJVSEZqakFXeU0xdEpJOVQzdzdmZ0NCMUpt?=
 =?utf-8?B?cjhYZjlMR3llTWhmT0t2d0lwVjRTR09GdUlEMkdDVlFWV215aGlwblkvNjF2?=
 =?utf-8?B?TlhITTZUeGxDRWM0dm5OekI5RFlBQmZjc2JkaE1xYnhHQUFhVE4wWHFMS1dr?=
 =?utf-8?B?ek93TlhZL2FCdUVPY21Za0hMNUx5dndsOXpWbnlWakQ3aGhPbmM4bGVxTEU4?=
 =?utf-8?B?T3BHZ2JtUTAySER2S09VKzhYREd6SWhBQmZnYVVmc0xFREVNRWtuWE5WNzJn?=
 =?utf-8?B?bFBzWDErM3RyczZrT1FoOWlVT3VOMlczUnpnTlB2OWlUOU1HZ3g2Uk1qRGpN?=
 =?utf-8?B?L1hUUGJxRE1yVElUQUdXTFRRcHNXY0V0UUVuYzVEd3d1ajdHZjQwTVNNSWVM?=
 =?utf-8?B?dzFuNlB5bEczT3FjMyt0eFBtVlF0NDZxZnladTlQTFZ0UVE3cDFaNzVQUTRL?=
 =?utf-8?B?bTcreTdxenA2NGZ0UWpxOHVHc2RleHNiNUUvazlXZWcrdGNER1VPRzhnS3VX?=
 =?utf-8?B?RjNKVUJET3NIUWlSOXYycWlsTE91MUhVWGp5cEI2QkFQYUtoa281SW85dUFu?=
 =?utf-8?B?VDFqajh3WUc5REtqd1NQc05JaUtRNzF2bmZWUUhKWHVnNERDVE9LeGJyNUNl?=
 =?utf-8?B?S3NOK3A0cTl2NzRIRnl5NHQ5Qk5WbW5XNFN3cjRnNjYxRHVYS3NZdWVwR1Zp?=
 =?utf-8?B?N21VV0NFREJkcEZ2ZFNMNFV5Vy9WbVBCRVdoRXNlVk5NNkxuQTdueWcrM2dp?=
 =?utf-8?B?UkFUQllTQWtiY2pvRUtYeUdya0RvZUJmeGMyWXFNUm1BOGswand4ajZDQ2NG?=
 =?utf-8?B?QmZNZCtWeTBOOGxFTU1lbWpHZHd2Y1lFVFdpVld1L2FTWlFMYjZCVHE0NTVv?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D22DCD350F98F419783473F16500B6A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?L3VlTGJTK21JcUZqQytyZG8yVDNSWXc3djl1cmVZSFNRYXAwZjdRaWt0dzVU?=
 =?utf-8?B?Qk45dEhTUmI2Nmo0S1AyOFNnNTFXMDdXS2g4RjRkQ2tVUGY1WmlsMGVpOEJ0?=
 =?utf-8?B?TE5FSm5VWGpzaENKdEtqVzBUSTdQRG9EazVjSFdHb3hKcHFjM2NrcnU0MGQx?=
 =?utf-8?B?WURZa05Rd0w4WEU5U0xPVlJDUld5cmtCdzBZUEZ6bEZNdE9Tdnkyb2t6UVhE?=
 =?utf-8?B?bkExNDUwMlExdGtyQzBwVVdmQS84NURYcEtoZEpmRUthYnhiM2pQTWhVSC9H?=
 =?utf-8?B?SnNQaC9Ic1Q2OHpaRS9JME15MnRSNG0wWlIwWEVzUXNoRmZXQlhXOEhsM1Qr?=
 =?utf-8?B?enZFQ3ZGdmJkQkJnRU4weFZENzdsWjl6UlduS0hqT2MxTnloMUJRY0k1NDVS?=
 =?utf-8?B?UDQzM05LSGh3MEpSdkdrdldwZmRWc04vVnUrNzU4dEZINlFQeXd6aE82cTJB?=
 =?utf-8?B?eEVVSCtIU0h5SjVoazdWWDVTUzNyNHRheEF1NjFQN1Z3WDh3NlE1TkQrekJU?=
 =?utf-8?B?Szk0Uld5a2VXcW9QWk43NlZTa015NUNtblBld0hrSE5MWE5PN0tvalZLb0d4?=
 =?utf-8?B?NDVoNEc3NGRFaHcwUytGSzNUd3hZUFljbU9ZMy9mbWZ5OHQyTDZJOXRDcWp2?=
 =?utf-8?B?MHFhWWFIVnVFM244SnFzdFJFT2dTZkY3M25NaFRlK1VEUGE3OWJrTTlYSGdP?=
 =?utf-8?B?clJ1bFl0UnBGWHl1VURIRFB0U2J3eTg0bWs2dTBkTTJwYjVJRzF6TmhuMmZC?=
 =?utf-8?B?Ti9aK3FNaU43eXRTSElxNCt3YU41SEVYT2FQUGhCbHMxVjcycytUTUc2b1ln?=
 =?utf-8?B?Y0FkdVUvNE5KYjN2b3BlMFhxcW1WM3NIcUVmUG1QSEVtQWtxSG51bTFZRzNK?=
 =?utf-8?B?RFhwQzBqUHJrb0U2ci9TZ21sRm11czYwTis3NkxVWk01VFNyT09PbkE3cjBS?=
 =?utf-8?B?L3Y0Y1BQNThWRVkvMjRVMG9BQ2ZoZUhkN2d6SWM4MDgrOW5WQ3dPMU5LZUJS?=
 =?utf-8?B?elZIaEdmN1N2MHdCckZWbnIvSGhXZ1ppM1dwclJwYmNGMFBGYVl3ZWtXeGxQ?=
 =?utf-8?B?QlBMTTZHY0laRDJveEE1TzJRUWlsS1gybXZGS3JOdEVjYUV0bU9WT1dpbUly?=
 =?utf-8?B?b0UycG8za0YvV2lSMUhoaXo3RXVnWUpLSDZNVDJ1ZXY4ZFhFZUZSdjdXcG9W?=
 =?utf-8?B?cFNkSmU1VHNTZWF6NStiU3BHUkNNbDdFOUZCOGpRd2NlZFlacFFCU3hPOFhW?=
 =?utf-8?B?L0Q4MW5zYThMSlRCS0t6aXo5ZE1FYWUzR0FjMHBXaWRLdit0dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be78607e-76fc-4ae6-982d-08daa6d14ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 12:58:26.0617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWIj55borJYhp/zdmnOAOHA1kc7QF4KW8W78ZrMYwNMOf4kFv0wCZhFA9L0vYERllA7ffJAyAG2auNvPv3KTZRzZhZPMPNi2LasMVdv2pgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6583

T24gMDUvMTAvMjAyMiAwNzo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA0LjEwLjIwMjIg
MTg6MDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBBIGZ1dHVyZSBjaGFuZ2Ugd2lsbCB3YW50
IGEgY3B1aWQtbGlrZSBpZGVudGlmaWVyIHdoaWNoIGRvZXNuJ3QgaGF2ZSBhIG1hcHBpbmcNCj4+
IHRvIGEgZmVhdHVyZSBiaXQuDQo+Pg0KPj4gICogUGFzcyB0aGUgZmVhdHVyZSBuYW1lIGludG8g
dGhlIHBhcnNlIGNhbGxiYWNrLg0KPj4gICogRXhjbHVkZSBhIGZlYXR1cmUgdmFsdWUgb2YgfjB1
IGZyb20gZmFsbGluZyBpbnRvIHRoZSBnZW5lcmFsIHNldC9jbGVhciBiaXQNCj4+ICAgIHBhdGhz
Lg0KPj4gICogSW4gZ2VuLWNwdWlkLnB5LCBpbnNlcnQgYSBwbGFjZWhvbGRlciB0byBjb2xsZWN0
IGFsbCB0aGUgcHNldWRvIGZlYXR1cmUNCj4+ICAgIG5hbWVzLg0KPiBIbW0sIEkgd2FzIGVudmlz
aW9uaW5nIHRoaXMgdG8gYmUgZml0dGVkIGludG8gdGhlIGV4aXN0aW5nIG1vZGVsIGluIGENCj4g
bGVzcyBhZGhvYyB3YXk6IChwYXJ0cyBvZikgTVNScyBob2xkaW5nIGZlYXR1cmUgYml0cyBhcmVu
J3QgdmVyeSBkaWZmZXJlbnQNCj4gZnJvbSBpbmRpdmlkdWFsIChwYWlycyBvZikgcmVnaXN0ZXJz
IG9mIENQVUlEIG91dHB1dCAoaW4gdGhlIGNhc2Ugb2YNCj4gQVJDSF9DQVBTIHRoZXJlIHdvdWxk
IGJlIGEgcGVyaGFwcyBqdXN0IGFic3RyYWN0IG1hc2sgbGltaXRpbmcgdGhpbmdzIHRvDQo+IHRo
ZSBzdWJzZXQgb2YgYml0cyB3aGljaCBhY3R1YWxseSBhY3QgYXMgZmVhdHVyZSBpbmRpY2F0b3Jz
KS4gSGVuY2UgSSdkDQo+IGhhdmUgZXhwZWN0ZWQgdGhlbSB0byBnYWluIHByb3BlciBlbnRyaWVz
IGluIHRoZSBwdWJsaWMgaW50ZXJmYWNlDQo+IChjcHVmZWF0dXJlc2V0LmgpIGFuZCB0aGVuIGJl
IHJlcHJlc2VudGVkIC8gcHJvY2Vzc2VkIHRoZSBzYW1lIHdheSBpbg0KPiBmZWF0dXJlc2V0cyBh
bmQgcG9saWNpZXMuIEFsbCB0aGF0IHdvdWxkIGJlIGxlZnQgb3V0IGF0IHRoaXMgcG9pbnQgd291
bGQNCj4gYmUgdGhlIGV4cG9zaW5nIG9mIHRoZSBiaXQgdG8gZ3Vlc3RzIChpbiBwYXRjaCAyLCBh
c3N1bWluZyB0aGUgc3BsaXQgaW50bw0KPiB0d28gcGF0Y2hlcyBpcyB0aGVuIGFjdHVhbGx5IHN0
aWxsIHdhcnJhbnRlZCksIGludGVncmF0aW9uIGludG8NCj4gZ3Vlc3RfcmRtc3IoKSwgYW5kIGF0
IGxlYXN0IHNvbWUgb2YgdGhlIHRvb2wgc3RhY2sgc2lkZSAoeGVuLWNwdWlkLCBmb3INCj4gZXhh
bXBsZSwgY291bGQgZWFzaWx5IGxlYXJuIG9mIHN1Y2ggcmlnaHQgYXdheSkuDQo+DQo+IEhvd2V2
ZXIsIHNpbmNlIEknbSBwcmV0dHkgc3VyZSB5b3UndmUgY29uc2lkZXJlZCBzdWNoIGFuIGFwcHJv
YWNoLCBJIGd1ZXNzDQo+IEkgbWlnaHQgYmUgb3Zlcmxvb2tpbmcgc29tZSBjYXZlYXQ/DQoNCkkg
aGF2ZSBvbiBtdWx0aXBsZSBvY2Nhc2lvbnMgY29uc2lkZXJlZCBwdXR0aW5nIE1TUl9BUkNIX0NB
UFMgaW50byB0aGUNCmV4aXN0aW5nIFg4Nl9GRUFUVVJFXyogaW5mcmFzdHJ1Y3R1cmUuwqAgSW4g
dGhlIGZ1dHVyZSwgaXQncyBsaWtlbHkgdGhlDQpyaWdodCBjb3Vyc2Ugb2YgYWN0aW9uIHRvIHRh
a2UuDQoNCkhvd2V2ZXIsIGRvaW5nIHNvIG5vdyB3aWxsIGJyZWFrIHNwZWN1bGF0aW9uIHNhZmV0
eSBmb3IgZ3Vlc3RzIGluIHNvbWUNCmNhc2VzLsKgIFRoZSBmZWF0dXJlc2V0IEFQSSBpbnRlbmRl
ZCB0byBiZSBzYWZlIHRvIHRyZWF0IGFzIGEgcmVndWxhcg0KYml0bWFwLCBhbmQgdGhpcyBpcyBo
b3cgaXQgaXMgdXNlZCBpbiBwcmFjdGljZS4NCg0KSG9uZXN0bHksIEkgZGlkbid0IGltYWdpbmUg
dGhhdCB3ZSdkIGdldCBiaXRzIGxpa2UgUlNCQSBhbmQgUlJTQkEgdGhhdA0KbmVlZCB0byBiZSB0
cmVhdGVkIHdpdGggb3Bwb3NpdGUgcG9sYXJpdHkgdG8gYmUgbGV2ZWxsZWQgc2FmZWx5Lg0KDQpF
dmVuIGlmIHdlIGRvIGVuZCB1cCBwdXR0aW5nIE1TUl9BUkNIX0NBUFMgaW4gWDg2X0ZFQVRVUkVf
Kiwgd2Ugc3RpbGwNCm5lZWQgdG8gcmVtb3ZlIHRoZSBmZWF0dXJlc2V0IGFwaSAocmVwbGFjZWQg
YnkgdGhlIGNwdSBwb2xpY3kNCmluZnJhc3RydWN0dXJlIGFuZCBsaWJ4ODYpIHRvIHJldGFpbiBt
aWdyYXRpb24gc2FmZXR5Lg0KDQo+DQo+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5DQo+
PiArKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5DQo+PiBAQCAtMjk3LDYgKzI5NywxOSBAQCBk
ZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOg0KPj4gICAgICAgICAgUlRNOiBbVFNYTERUUktdLA0K
Pj4gICAgICB9DQo+PiAgDQo+PiArICAgICMNCj4+ICsgICAgIyBQc2V1ZG8gZmVhdHVyZSBuYW1l
cy4gIFRoZXNlIGRvbid0IG1hcCB0byBhIGZlYXR1cmUgYml0LCBidXQgYXJlDQo+PiArICAgICMg
aW5zZXJ0ZWQgaW50byB0aGUgdmFsdWVzIGRpY3Rpb25hcnkgc28gdGhleSBjYW4gYmUgcGFyc2Vk
IGFuZCBoYW5kbGVkDQo+PiArICAgICMgc3BlY2lhbGx5DQo+PiArICAgICMNCj4+ICsgICAgcHNl
ZHVvX25hbWVzID0gKA0KPj4gKyAgICApDQo+PiArDQo+PiArICAgIGZvciBuIGluIHBzZWR1b19u
YW1lczoNCj4+ICsgICAgICAgIGlmIG4gaW4gc3RhdGUudmFsdWVzOg0KPj4gKyAgICAgICAgICAg
IHJhaXNlIEZhaWwoIlBzZWR1byBmZWF0dXJlIG5hbWUgJXMgYWxpYXNlcyByZWFsIGZlYXR1cmUi
ICUgKG4sICkpDQo+PiArICAgICAgICBzdGF0ZS52YWx1ZXNbbl0gPSAweGZmZmZmZmZmDQo+IFRo
cm91Z2hvdXQgdGhpcyBodW5rOiBzL3BzZWR1by9wc2V1ZG8vZy4NCg0KT29wcywgeWVzLsKgIFdp
bGwgZml4Lg0KDQp+QW5kcmV3DQo=

