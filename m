Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53A4BBA88
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275500.471406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL451-000686-5J; Fri, 18 Feb 2022 14:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275500.471406; Fri, 18 Feb 2022 14:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL451-000665-1w; Fri, 18 Feb 2022 14:17:51 +0000
Received: by outflank-mailman (input) for mailman id 275500;
 Fri, 18 Feb 2022 14:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL44z-00065z-4l
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:17:49 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b6cd64f-90c5-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:17:47 +0100 (CET)
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
X-Inumbo-ID: 8b6cd64f-90c5-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645193867;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dGRY3nYm5LQJyB2cOwRV6M5AzMjjwfdBEyE/7Jl6Xlw=;
  b=ER6onnktLz8zT8Io+wyFiAsUFgH923x0Q6jOPtD2uj5ErfxWmeXL8Qra
   MMUVZ4v/MmevLPo5pP/uUuyLlBgKfB8CqlnCUBojMs1JONQmqU0PO8U8H
   2TZSZdpH3UzpfzsC9OXb/RszrXjqZEha9FCgfTt+wSGMApiEFSd6WTHGe
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64416751
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SgBY5qsZ2mN8yvbSo6f4PhyO+OfnVGleMUV32f8akzHdYApBsoF/q
 tZmKW3UP/mOMzahftgnb4S+8koHucTRmNRqTQduqS4yRSJB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nU6
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8kO6Dzuco0YiNeGhFmZ7x6oaDaLFig5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 5ZAN2UyNXwsZTVia0gNGKwRv9uG2Emidjh4lHabm6A4tj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWMwkQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qQ87qrjB2bCBITJF8aPz44FBQY7vn89dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQI+d3XC3270k5JGQWy2yGgvTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsUoLlPfrX0wPBT4M4XRfK4EyPBX1
 XCzK5vEMJrnIf4/kGreqxk1itfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 C/lARYAkAKl7ZAFQC3TAk1ehHrUdc8XhVowPDA2PEbu3H4mYI2167wYeYdxdr4inNGPB9YuJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:DyoX0aPXry7ECcBcT1v155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64416751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9gC1hLe9Six56e/TFc0tylQEWGND03py2QBjBe36x5hCQ/5mnbzvrKyK37TAd25u7C6yS1onSXXhoeMTDc88d/ob4KvyYuIh/kSHyqUTEmqFrGUA8ZSmjoR1jU+cPntTfEDUOhUe00Pr1DTJzbWE+C2osisEwlJNcemUV4JFX8Tv1yn5bdCbf8jxYbAvgw+kicGLDfO1RqHs9d6Xkkdvr8GgkiXqEXvpz5py8D++a78KQwHVT/aBIJid5yxo64kZd918c/Y0DIM3jNcVitIM10kCa65xqubFZPxSSzKdxFKWfmPjEb3SPtuUwWqNlYSG3L0LcOWxUTbz2tEiCA7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnMNqMDAPNB8sN0Ba8vr6XnL4/lcdqLqp9Dc7DfcPas=;
 b=K23UPVNyRniCS/MMYOMufifUvEDzd2IG0BAFj27R0zSrQ/iNc9rko1UOvV0TAeJrNM++Qal6f7UrP5MKk6dRDLImEcP5xQOs6IhHAtZNF4m/2uCArIO0zGZaCgppnYQfTqnQR/NZBMQto09CvE/ym79EmyNBbKouFQWnkYPBiQ3iNhmIecGbwE9Sl+jbAcreZk2nJA8nW25xuYjQnBUxiJyemn3OOjfeGDEEr54ZsKsX8SDUS4Q6q8lB0y3Ksd0Y45I80IZNUmgEm6agoR65VO6P3f6F3kwO8tixg5C4rG0hWXKTNfA3a60k20YpEJ74UKyoaFk3/DZuHpSAWaVNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnMNqMDAPNB8sN0Ba8vr6XnL4/lcdqLqp9Dc7DfcPas=;
 b=V6TBEpWsL+h21plnO1BS9n+SUApJlrGj/c+gjlR1HI1VxekyxwgjwBQb2ijLt+ltIU0xWGr8DgimRnGVR1twEpUCaLvCFRxZgY5MpANhC49eLiWCXA9Wt5G8yDzSOahnO9fObnSt+zqVCCk4doNS59wx8eIButbaugYdiS0YzJ0=
Date: Fri, 18 Feb 2022 15:17:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/3] retpoline: add clang support + Kconfig selectable
Message-ID: <Yg+qf6ZlTX67LPCv@Air-de-Roger>
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <cfa55fd4-1990-b1ac-e6f3-94ef364793a3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfa55fd4-1990-b1ac-e6f3-94ef364793a3@citrix.com>
X-ClientProxiedBy: LO2P265CA0435.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6182592-0c2e-4162-8450-08d9f2e96af3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4439:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4439207A9E7326A15DCCA1CE8F379@BYAPR03MB4439.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoq8pt/Qukd4a31CaVu1cJAawUIOW9CyrkmB1VPjN4VSPWW60NDRnPfsHp7sZkPz5C1ZYHvC3zngT4aruhVcR8U733liON4oj8R/6O1U3SqqQcalBhgfcTBWY5NirMpL9lZSnyTwle5QiISfPWR9341fECnX6Y/VUyv+FAlsCNS52ypBtFGXucxYcJOxs70bV4WXsD/WQxjDCA08IFwGYfazX2YdpXD/ptzwrRIHM97kuqaOyUSPFqdyVDsncz2CLeS9BQOQymkf4T05p6jPrxWdANBrLft7WEWFL77ncLge9/TXr30CLhIsYUBqSKNWGXQU/5TB5w8t0HU8LwKup8Heb/0JWTJKipGZv/DPxJZstV3vdPoxMlgdKYt+UzTwjp/H0J2Nh0vXoegCeIEAIyyKJq8roL4OoeRKLvx77Uo+7s+DU0ZG1+HN6r4jMFu3crgsltk2jIBX98a3Rjk4p7hwtNXLfSEM886vck6eWbdQghJUk0aWd1OZ8X1pfnTeI2eem9TYDAaS+h/4SvU23qdkJYBOgz8XRb5favasFS5JKD9N46NwQRzm96RG1ANK55PJ5UnPJZN9Wx33srNuoq+8LGFAet4tj5XOIMJBv/xZ8SX2WW/C2z0vA6OQvKG12UWFR3Hk1v/ztVSEMc1mScnw/A3yaSjhMP8BUA+xCSE+l6lRWyG9CtovMHFnUnob0tT3+RAn0rIQzegNcwCY0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(2906002)(6486002)(66946007)(66476007)(66556008)(8676002)(4326008)(86362001)(5660300002)(38100700002)(6862004)(82960400001)(83380400001)(33716001)(186003)(26005)(508600001)(54906003)(6666004)(6512007)(6506007)(6636002)(316002)(85182001)(53546011)(9686003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkdoUHVJZk1lKzlmb3hsaEx4MHNiOGdobGJMVXlhZHJ1Z3RUdkdVZnZHZ25x?=
 =?utf-8?B?MXZ3MERtdTJxbDBHZ0ZaNWJtNXpRbDQyMy8yaG5aYUg4SUdSQ0hWa0dRMHNa?=
 =?utf-8?B?NVpCQ3BRQ2IwdUZrem9tZ3g3TXIxQ1BsYW40eDRyMDNrbmhPV2JPanpwSnJT?=
 =?utf-8?B?Rk00T1lyYVhINXBOL1VObWpnRGdlUUcyejdrdmFJeXE0ZHpwOHJQRy9PWTZo?=
 =?utf-8?B?OFNSMjVab3Q0Z1NPUU15d0lFanE5QmxKSjhxV29TYVlaMk41Y2s0eGc3dEs1?=
 =?utf-8?B?MWh5L3JKWUc1eXE3STVwazJYYlhTYWFTU211MVJUQjJVNHR1V2RCTGhvVlNr?=
 =?utf-8?B?MFd6akxEay82MkZaNW5sSVI2TXJydHY0eDBteTlyS2NtRnpvRFF5ZG9nOXh0?=
 =?utf-8?B?SlhFSlRiZ2dkZGtzY0xTZS9JSW94Z1hweFRwVTNVSUQrNnl0bVYwWjIyeWw2?=
 =?utf-8?B?RjdFYUNIRzBhcGF3QzU3ZW5lTi9xYXJrTlNJTmliMUpJbEdJcTRQTVdoLzQv?=
 =?utf-8?B?d2tXdTZPMW5qZlUyU1JhTEVvRmRkQ2JIQjlncnN1VTVjc2tMeTZTOENSbndt?=
 =?utf-8?B?VU1Wc1RuMVpKMW04WEp6N3BQelVMVEJYNUw0TENXSVVvYW5WTVZkbWt3MVFi?=
 =?utf-8?B?Q2RqNWNkRy9jVi9XVVdITndudjVrTkVsSnl2cHFObFVqMDdZcVdmR0hURWJE?=
 =?utf-8?B?dXl2NlBRMkM0VFZpN3pKRXVMZnl5TDZNMHIvM1dudWppOTMrYUMyYzZyc1Na?=
 =?utf-8?B?QmhqUERKRlBkZmFZZm1vTFBWZXYvdEVFamRhMjhNZFNkZlNFNFNKMGxrcWJl?=
 =?utf-8?B?K1g2UDlTc3ljQjJNL3dZNWxmd0p3K0pnV1R0S0oxTXhLbUNOK0s4TUJXU1hv?=
 =?utf-8?B?MmUwY21nWHI5RmVzK2RhcHBvR1pkOTVEeElUSlN2MXp5VHAyUmFabnovdGdG?=
 =?utf-8?B?MTBZOVF2bWFLejhMZGpNeERmZ25XbnpBNzhMS25DbGNaRW5SbVFpZjVUd01i?=
 =?utf-8?B?NmhISE5FMjcwMUpQWEFGbWIvc1d4YWM0S0lQaHZqQW1DUStxUlNBcDZHRi9w?=
 =?utf-8?B?em53WENKZkFrSVhWZlhTdm1uenRRY2EwSis4dlZnQi9paHFTUWhORkdHVDAw?=
 =?utf-8?B?bk16N0hRa2paOGtJc09IVEtDMG81VFlqTktLc20vUUYrSVVkU0hydlozaDNW?=
 =?utf-8?B?UWh2aTAyalBNTlBXdUxJdUU3WEwxMUl5a2ZrTGdWdU8rWjBuMFlkSEU2ZExo?=
 =?utf-8?B?ZEFNMno4VUtSS1c0VDFBODlkWWVSL2NnMTBxanpIekZsOThnSVZnTlhxODNk?=
 =?utf-8?B?cVUvL1dCdm14K1lBTGZOajJ4czYwN1EwbmQxMWRTTG1EWWtkYUw3bXBWUWlw?=
 =?utf-8?B?QldwZkF1ajlRUUx3YzVyRWl6aWFIVjJhSndIaVJ2T0xPKytaWFdJL2RyNlow?=
 =?utf-8?B?RU9LYmNYVmM4RUdqeWhXajJOTHg5L2s4ekxaTG40SndNT1pNWUtyUE5vRk5I?=
 =?utf-8?B?WllRZ3NsREJ4aG9BVUpsRVRZMWlQTWV4Q1VPdCtPaFZHU210OEJOaUxLZmIz?=
 =?utf-8?B?dXNHREVtbk01YTlBR2N0TVp6NElidkNqdjk1VnBWUkgyd1d0SVFXV2tpZmpP?=
 =?utf-8?B?RVpvazRtTWVwTlNobCtjRVY2bDM0ZVA3TXZIQk5kTDFrTXVEL1JnYzlEZzlF?=
 =?utf-8?B?VHJEQ1VKaWZmclBCdDF2TnhHVE5jS3krZUtXQVdydFpPT0k3dW51WCtVM3FV?=
 =?utf-8?B?T0xPYi84SDZVRUpPcHY4N3lLWVMvVFR5TlU4WllxSitGRHJrbVhTQzZJblhM?=
 =?utf-8?B?aWdBZ2NSM2F4aDVWMTZ3KzRFejdQcy9UbHRLNEd2dnRtdXdaRFd6YjV0WEc4?=
 =?utf-8?B?YjNRQXlULzZ3V0hSZEo4QnBDSkhzY2k0VFhKaW9zVTVPL2RCQjhaZHgzZklM?=
 =?utf-8?B?blN5STNkb2NOMnFtWnRENUhsSVJybFhiSFR6MksxUVJuOXFZS2F0dHNJaGxo?=
 =?utf-8?B?TG5VME9WUDJrTWVMK2JMT3AyV2l2OFUzaG9nNitJWkJDMnY2M2RNd0VoQlZY?=
 =?utf-8?B?WDJSTDZqNHNrUFBER3VuRlh5elRvQ0d1cnBpVGsxMGpmRmxERExxWTlqNGxh?=
 =?utf-8?B?dDJ3RVRXYU1CR1dVNU5GcTRxalJ0ZUMvaG5rM3h4UDdRWjBDQmJUK0twS3VL?=
 =?utf-8?Q?9oym/6ckpzjvGdKLTfx+Hwg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6182592-0c2e-4162-8450-08d9f2e96af3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:17:38.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nlwi/AfquRiA1SshwxcoVv8lwkdDVbHK1WZeZ5PB+hKtDSYYOcYIm13TVzHk3zpmbIa0l17p33ZwTj/o2LCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4439
X-OriginatorOrg: citrix.com

On Fri, Feb 18, 2022 at 01:58:31PM +0000, Andrew Cooper wrote:
> On 16/02/2022 16:21, Roger Pau Monne wrote:
> > Hello,
> >
> > The following series adds retpoline support for clang builds, and also
> > allows the user to select whether to enable retpoline support at build
> > time via a new Kconfig option.
> >
> > I've tried adding a suitable description to the Kconfig option, but I'm
> > sure there's room for improvement.
> >
> > Thanks, Roger.
> >
> > Roger Pau Monne (3):
> >   x86/retpoline: rename retpoline Kconfig check to include GCC prefix
> >   x86/clang: add retpoline support
> >   x86/Kconfig: introduce option to select retpoline usage
> 
> I don't particularly want to nitpick, but IMO this would be a lot easier
> to follow if we ended up with
> 
> config CC_HAS_RETPOLINE
>     def_bool $(cc-option,-mindirect-branch-register) ||
> $(cc-option,-mretpoline-external-thunk)
> 
> config INDIRECT_THUNK
>     depends on CC_HAS_RETPOLINE
> 
> and
> 
> ifeq ($(CONFIG_INDIRECT_THUNK),y)
> CFLAGS-$(CONFIG_CC_IS_GCC) += ...
> CFLAGS-$(CONFIG_CC_IS_CLANG) += ...
> endif
> 
> because this reduces the number of CONFIG_* options involved.
> 
> Thoughts?

That would reduce one hidden Kconfig option. I don't mind
implementing it that way.

> On substantially more minor points, INDIRECT_THUNK wants to be first in
> the speculative hardening list, seeing as it is by far and away the most
> important one, and I think we should stop writing things like "If
> unsure, ..." in the help because it's just parroting the default which
> is also rendered to people reading this message.  Our audience here are
> developers, and I think we can depend on them to intuit the stated default.

OK, so let me put that one first on the list then, and drop the "If
unsure, "

Thanks, Roger.

