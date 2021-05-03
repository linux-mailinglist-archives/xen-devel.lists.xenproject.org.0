Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A734371499
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 13:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121539.229235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldX97-0005M1-KI; Mon, 03 May 2021 11:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121539.229235; Mon, 03 May 2021 11:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldX97-0005Lc-Gg; Mon, 03 May 2021 11:53:53 +0000
Received: by outflank-mailman (input) for mailman id 121539;
 Mon, 03 May 2021 11:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldX96-0005LX-9m
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 11:53:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 663d979e-6a08-43e1-98b4-c46a35d13160;
 Mon, 03 May 2021 11:53:51 +0000 (UTC)
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
X-Inumbo-ID: 663d979e-6a08-43e1-98b4-c46a35d13160
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620042830;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CN5kqgy5ofU8tAD/6dZSU/2wGyQeJYxSKvPSU6mxuCg=;
  b=IuzPUIkhNLAMUmObNXZp5yeKCEFfjGV/Fup4GmSqXW+TjobnnwI6fPbV
   SUuGU++BVVkK4riej1vweBSOW6iHzInMyiB79+CnZsU6xvVHNbco9iFGR
   Ro6aCR12TSYZzkuJO8iiHCKjWibMDDrHceyJXobNRYEQu36apZan1BaRZ
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KXmcaWjcg6iYKvUf90eo+2RcAtkaI7aNLAU4jsZI2yXRf6tTEstKzdQgUc2joc8po/0CqqWg6p
 A2O5zet3q6SSZpdh2QxyNhNa+VTwSNUH0ZGsXfe5VvpGEPPsHskaOevUB+OlI/KUYSOjN8qHl/
 El8wUwRhJvC0LmcRv+zjlZJ0R7ErwYQZsGxSSGIj1bWPXk6FYb13PvKf535qLFTEtsC6PLMmqZ
 dCdTnkW/kdc43JD83EozsHdnecc3VSPd1Mvjlwc95YoYwkHlXDhL8OB/BTfxtun+LUSPUlvRif
 2SE=
X-SBRS: 5.1
X-MesageID: 43039139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oolmfax1ujxNIQPfWfOLKrPxg+4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf9LmRdQg5aCZ0lUL
 +V4cRarzStEE5nEPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmel9z0ZVC5CxqpnzH
 jdn2XCl9memtyY6juZ7W/c6JxKhMDso+EjOOWggtUYQw+c8TqAS59mX9S5zUkIicGprG0nid
 zd5yonVv4Dlk/5WkGQjV/T1xL70DAogkWSu2OwpXf4u8T2SHYbJqN69PpkWyDU4UYho91wuZ
 gjtwny2us1fHGw6BjV3NTGWwpnkUC5uxMZ4IgupkdSTJcEb/tppZEflXklY6soJj7w64wsDY
 BVfaThzctRGGnqC0zxgnNi25iFUHg1A369MzI/k/3Q+T1XkHdl9lAf1cwSk1wRnahNO6Vs1q
 DqNL9lm6pJSdJTRaVhBP0ZSc/yMWDVRwnQWVjib2jPJeUiATbgupT36LI66KWDf4EJ9oI7nN
 DkXElDvWA/VkryAaS1rdx22yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8ot0Ea/erGc
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5ISR0+OmMTWMYfn39arM8r7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVz/QHXoVkvj/Y9hMaTT8uQJobJ9crFkg0wwsxCU98uLITpNvugdZ0
 1lOo7qlau9uC2X8A/zniJUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+HOGIxR4Xv7HCQ
 I3nSUwxYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeDoZ40/FZRjfKBqDw3EG1hUlG9R2S
 d+QT5BYnWaOiLliK2jgpBRLvrYbcNAjACiJtMRj2neu0WarcQGXWAaQDaqbM6SjW8VNn9pr2
 w015VarKuLmD6pJ2d6qv8/KkdwZGOeB68DMB6If7xOmrfgeBh5SECDgTDysWBrRkPas2Epwk
 DxJyydfv/GRn5QoGpR3KrR/FRoTWmFZE5rZndmsYpyKHTeth9IoJq2T5v291HURkoJw+kbPj
 2AWzcULw907/2c1RKeml+5ZDgb76RrGtaYIKUocrnV1H/oFZaBkrseGeRIuLx/Msr1j+MNWe
 WDWgOcIT/iEdk10wiNqntNAlgtlFAU1dfTnDH15mmx23AyRcfIKFN9XrcBPpWy6XPnS/vg6u
 QwsfsF+c+LdkP/Zd6NxfuJM3ptKhbPrXW3SO9tg5ZOpq42vKZyGZ6ecTag7gAw4DwOaOPP0G
 UZS+BHxZqEHKlFVckbYThY8Vokj87nFjpgjiXGRssFOWgwhHraNe6T67XGqbATElSMzTGATm
 W3wml4xbP5RCON2r4RNrIoLUlXYEY67m5+/OnqTfyYNCyaM8VC9kG9KHmzbft0T7WEA6wZqn
 9Bkp21tt7SUyrzwwbLuzRnZopI7ma8WMu3RCaBA/RB/dD/GVOChMKRkYGOpQaybTuwcEIDg4
 JZMWQWc8RYkzEnyLQN7RLacN29nmsV131E4T9mkVbx2o+ppEfjdHs2QDHxs9FxRjlcMn+BkM
 Lf1/OXvU6NuwR45Q==
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43039139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0+r0RHQUkmpxITkybaQ0ULzD+bQsdAxjLjWggtqay+BqICTmUvsLyjm0eBFm+ZKIrG7z7/x5wzbD/sAEec3NufrKCxxV/j+JpUFimikrM/vqZcPcsN7bX6ZcjeUyxH6/Lkdo26GkMwxptDuHOusLlYa9D0h17zgsaC1TZEcXZdOYU9Henul9hoolPq0Q+1yOgNGpcrebW0u1T3DWLe0uZKN2N8w5D7FURd4hXmcM6Xb+3sg6aExYQzw6u7ppKEzwAV3oMU0XeLiFRuZO4IrrFv/xQMcovyFlHr91eQmWIbjrMxRAUSZgBM3e8ecG/7LnhJND0OrAMWd4icJCTk6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN5kqgy5ofU8tAD/6dZSU/2wGyQeJYxSKvPSU6mxuCg=;
 b=fkbgZ+jVXWpOLEEWsP6Bi0MIe/+EmCin/uZgWzzqPWhlIMlyPEtzKeJN839qxPXkLjp4UDJcX3Hu49qp4Bz3p4MMGp1pzNMUwTnBUHPlR7S5cV2M+gikelEIn+NiiPcn/dYUZunOtEzLwi5HvW+fEZclw76Kz97QBOjAX68ywAro/8nUoHvyORIF1oaO6Jop+f8xFS7zwU8XrkpUl76z9dvilAtMA/qfucgR7OtsloLGz4+PMPSgJb716Vh7XDguj4aZB2RaHJky/0ZrTxSHZUycrm36Bvw3VtRDTv32RqjAwPTIvc4uVp0weBdeCNIRov8xzehq1QTG7mJVvPVYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN5kqgy5ofU8tAD/6dZSU/2wGyQeJYxSKvPSU6mxuCg=;
 b=CGYR+VUHIjf5eoiUgNquin6jt1Tiirqxf3N6x+zsbTLmTH3dAiHDckI12wM50gqkdXuq7SoFB+uIwq+duWWXUUvR98MSb8bpSZZpQCJOKpiw8e1cYJBXkCu3gTYbA/DPPZ024ffuFsQICUyeOgnx0pVb2v6iFCg9OLJLy2ZFCLY=
Subject: Re: [PATCH v3 04/22] x86/xstate: re-use valid_xcr0() for boot-time
 checks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <77b149c5-e7b8-6335-dd86-745c6cc69a06@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <426e6d04-13fb-5ef4-0916-274077d47692@citrix.com>
Date: Mon, 3 May 2021 12:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <77b149c5-e7b8-6335-dd86-745c6cc69a06@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f66e12b-ded8-476b-3a3d-08d90e2a1bad
X-MS-TrafficTypeDiagnostic: BY5PR03MB5220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5220DCA6B665442B7236DECDBA5B9@BY5PR03MB5220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cq2K5wgS8GVPTXYmWRbhldvh0yrnXo+UPZDHAg8j/jNc77pz14pgz/Wyu44uoonQqR+olsiNbjFr+Go39ALcgFH4wkPXf2KMSDhDoe4QuuiEqWaFIJyNnptP1PYfPgBJt1ILg69oqW2MMuPW8ygduP1tnVR/aexs04KP8MuiaIwGrdGFw9e0Erb5kWBUZzKrG/3vX62OH+01D/tzmxincsmIROiVWqIt/FMAi+2oO8wKyhtqNa0j+E/Hucld8IrlughJT2zI/XVi/aHVy5vyicuhbqOpuQGc75wXqPGSQLTzg4zPwCZeExVVsBs9WtB4PHqJGkVWbGylS8QXDmB5m9ODRhf3sJ+dE2D01lL94tCSDJmfqBAny84onW0CEfgpcWKxIbV7D8WuJxwhqYdFSp6+P+jxy5ZKQLxb4J3CRaUyJLa09KAWALSIqZeYpuH/cff6/X4jUOeSea8pblI5a8FX8jIYyPauoR/KC6VC2RguN6r9MB8n92JYFbvw9jkCtNMlgqlpXS7JjgNQ7p4Zy9gklx9O3YuR0hO8HGCPYZDzOXFApRkTjxexm76qSFRl+mAzA/W826a94a0/CaEiBVVhwHH1FLSwJcm0/7pkjnSo8j653KodkcsyQV/hcyUSMNkF6EZu+3R6XyMcDKcQSFXMkCTIxe+/+8QUk5LHag9+JO82Cj+z6iw7bZh7vMzI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(6666004)(316002)(478600001)(8936002)(107886003)(31686004)(4326008)(16576012)(36756003)(6486002)(110136005)(956004)(2616005)(5660300002)(86362001)(186003)(2906002)(558084003)(31696002)(8676002)(54906003)(16526019)(66556008)(66476007)(38100700002)(66946007)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnZPcHNsUEhIQndaRnB6R2cwMys0bWIvNDU3VEpYbE1vVnJjRWVaQWxTNzJL?=
 =?utf-8?B?cWNIRmlTS3F1SEo4TmFqaStVMkc1TVdGc2NwVC81RVVmSkxNQm9EbmM2ZUlI?=
 =?utf-8?B?VVlPR3F5T1R6ZmdqTUxmdXRsbzlQdHU3RHd3djJpQTZmREYxcG5JcXdUaFBI?=
 =?utf-8?B?YVdzZHZLR2FySndSNXJaN2RSOVhnVTcwbzJhSnFsbTAwZ0JUK0lQbG02OU5Q?=
 =?utf-8?B?d01GV3hVRUhuMGxwOWdOUjZzNFlScmVnNDE2Wkl4L3V2SzFCTjRZR0UxUmVN?=
 =?utf-8?B?cXhyL2NZU25PeFp3c0J5aGFNNHAyMnNZSWRDV3FqaHY4SC9mSnNEL2hLWFVW?=
 =?utf-8?B?Rk9lZ25zakQ1R1pEMS9iUmhoekl3M2FJUzE0TkZ0RWsxZWZPME1FVjJRR1JB?=
 =?utf-8?B?eDdaemVtcXZIMzNnNmxUUzgvTW8wUmMvTUJHVzdWeE9OVG1rWnBzWUMrM0xS?=
 =?utf-8?B?SmpXYTJEWEdDN05EUnBaWWZXdmVNOTZlN0lwbDkwcXNMc2U4MEhqcVhCcTcw?=
 =?utf-8?B?eGFNOW9YLzFwTHE2bGlIZzlaeWhxeGlZendEU2dOcXFOVFJwQm9hRndxbnZE?=
 =?utf-8?B?emhEZExOVC9jaUxVdEtPNFhjUUxwZm1wRC9Kank1T25TT0JDYnBhcXdSQVBq?=
 =?utf-8?B?dnMwZXllTUFKRVdNRG5GeHZIcUwxZnVyNWlsL21rcDhYQkY2UER3bStNOE5v?=
 =?utf-8?B?WXk3Z01XNU0zcTRrZHRJVk1ZVkFEb1h3Vy9tdVZjNFJxVnlRblBhcVF2aDVB?=
 =?utf-8?B?eXBabjhibWtvbUt5SEZoV2x4V1pxNHEwR2hFUkNHS1dET2Z0ZkJsVUQwMlpr?=
 =?utf-8?B?WVdMcXVmdG5ySWllbG1LYUhZNW1uMm00UnZ2QkVOT0ZIM1Y4aklIQnBaM0tI?=
 =?utf-8?B?WEo3eEFNQ0dVTnhQWHFsUDhUeEFqSGRkUS96alhUeVNBWExCY3FSbUtvdThX?=
 =?utf-8?B?YnE4QnlGbExhaG5QaWJnK1Nwbmo4cGY2eEhQcnV5RURHMERxZFlOUUgvTjFt?=
 =?utf-8?B?OW1INWNhU2RmTW94bi9Ib2NnLzlKTGlkWlc0clpyNEdWbTBrcjJ6S0lBK3Vs?=
 =?utf-8?B?dkhta2tBbnZXRW4raUpGWnpHMTAvV1hvVlZ5M3N0blJ4N2JDZTBBNFk2SDV3?=
 =?utf-8?B?M091em5vN3gwT2ErQUErTHBKUWtPTlBrZ21RdjFIR1FKN2lSQzIvWVVQY1JN?=
 =?utf-8?B?RjlOMkEzQW96VDF2UnExLzZnNzcxcVc0R2F2VGUyc1JKWXpYL2xBTE0weG5P?=
 =?utf-8?B?aUV2OXJzR3VaVGRseDdUczlmdi92SlFlc1VPbysrR1FzRm5ydEl1ZDFPMDlF?=
 =?utf-8?B?VjVpMjNWMG1lV3Z2T0l4bVFIdmVMKzhBNzZyRkc1UEdWcnVUS0s2NEcwSlQv?=
 =?utf-8?B?YWJhc1dnNTBLQTRxQ2YyY3Blc25iaUlEZ0o3UUdDTjVrVjgzVTI0eDVQYTFx?=
 =?utf-8?B?cmloQmtONmtrRkZJRVRIMm50bjlKNEExL2VCeUxZRk92WmhyWGRkSkJKSWd6?=
 =?utf-8?B?Ky8wOGptcFVPRi9OQ3kyS2VBQml4bm9aTnovUVcrcEs3WDJoUnpqcnNqOVZp?=
 =?utf-8?B?Rk9pdjZoK0pQNktDUkJrUFpHR3pVcGNIWWVCa2drcXVkSjFnbWZrR2NhT3Fk?=
 =?utf-8?B?Q1g4ZVE4Q3dyaEdzTkMvNWgzQkxKczZieXJHM0theFZIVUpnZkIwS2lOenA4?=
 =?utf-8?B?ZmQwelhuR2h1SXlGSGRjbjBycFZUUDBxMFVMSFNxY2NkSWNxWGpjTW1qMHJL?=
 =?utf-8?Q?2+cBVLZ/pDeAp0MLJbVF4Q2baDHOOsf+1Hp4h0L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f66e12b-ded8-476b-3a3d-08d90e2a1bad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:53:46.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WV/BzxKassOipmv21QKeXMZqdhMJbkEg39M0LXQ5tMg7xXBfE0Z215t5EimXfwrHGP7dDAq4aZXcxgX35/9FWDFGeIBxbad+OORe+1UC1PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5220
X-OriginatorOrg: citrix.com

On 22/04/2021 15:45, Jan Beulich wrote:
> Instead of (just partially) open-coding it, re-use the function after
> suitably moving it up.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

