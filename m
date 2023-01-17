Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A33366E6A9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 20:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479770.743823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrOq-0001nG-8I; Tue, 17 Jan 2023 19:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479770.743823; Tue, 17 Jan 2023 19:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrOq-0001ks-4f; Tue, 17 Jan 2023 19:13:36 +0000
Received: by outflank-mailman (input) for mailman id 479770;
 Tue, 17 Jan 2023 19:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHrOo-0001km-Rh
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 19:13:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07ca0171-969b-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 20:13:32 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 14:13:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6713.namprd03.prod.outlook.com (2603:10b6:a03:404::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 19:13:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 19:13:27 +0000
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
X-Inumbo-ID: 07ca0171-969b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673982812;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5hggP8gB8E6F2vLgwEBeqHK894LH8iRqTLFBk5fBDXI=;
  b=EMQ9YzxzMomm39zBHXqpP2oEw2vvu6ZceCaDeDUilOeiV3rej6k8L0b7
   +aCWzHwYFn3BFFCoLO0VnkpsYWEBTde7lNzFjzjRLKYI/k26HD5MRLRim
   Mevg5oUCBgJNetaZ5P//qTgZT+7r3DjW8ff6bm94IHVZXjfjfCtmmzAlw
   o=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 92502008
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p3FgR68Ysznzu7c7NwAFDrUDsX+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mseCj+Obv/YYTPwLYglPNy09hxQusSGmNBhTgM9pHs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklR5
 N0TLjUcZyqEqN204rSjcc49pp0seZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdhPTOfgrq4CbFu7gWkNKD40eWuBs+S9gBK7RON8K
 3M/0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOqM4zbSwn0
 BmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnS99iFOu/iILzEDSpm
 zSS9nFm3/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIsx6ByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:4QS1UalomQ14wKYY+AwSMBcl2I/pDfIR3DAbv31ZSRFFG/GwvM
 ql9c5rsiMc7wx8ZJhAo7+90cy7Kk80mqQa3WB8B9aftWvdyQiVxfBZjbcKqgeIc0eSygc379
 YDT0ERMqyVMXFKyer8/QmkA5IB7bC8gcaVbD7lvhJQcT0=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92502008"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNpK3qAv2yQ9sZ7w8VMQtGAL6J2czKMTwWmIzuH3+JHeFqmU1fO3926VGlo7RlSVxBoBlIgF5e8t+mQGzKoSu9lrMPEMf/F+3uasuvg/asQAD9woqh4azRwdwfa4aNxr2MLWHmOJUknSVJvrzYr+yUmLz9EK5fMP2awB74ZcYvUpybhl+Fka2Z4seWlf7CDIwT2cSN/SH/lkBGrvphpueK+JG5sh+PPppA2CqOfEO77dPKkikZdRIN7Cbt5Aann/5sjSn3qcHMOIOD1iEAcLCH6Yz1ekByz6JVrelqrUOp5hRKrIlygPRHYHwriKhqWMDEfKY7HWuIt8ixkMJoIzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hggP8gB8E6F2vLgwEBeqHK894LH8iRqTLFBk5fBDXI=;
 b=d05Dt4A0HhYj5uDfM3mziipqfeqZT5gDCPciXIdQ76Q6l+lU41d/xfI5weObIFqkuXZ66WpqAK3C4qFOJOw9Tmg/Fk3MMWu75bcixpNNxgiVu4eVjLD6Hhag1pOvAG0AcnQL9nDCbPxjmVVd2CnZF4mbyayd+2S1euWdV9td1E0KcsCFqUvoi04z+WriSUQeIBGFXijbDqrfgxeYDzE8oxEvQ4wu8rHX9A9KPVEB7tOnxriMFlrT46mjScl56NgljVgXKA0Y5PRs9QcSub3MHpKMxnMZpqRUrzwEvGPEKpvM0EsxpvRPT1dJwpYTexFUExAzLFsqh4Ruzvpr90QJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hggP8gB8E6F2vLgwEBeqHK894LH8iRqTLFBk5fBDXI=;
 b=JMjSltSsUNYYYqqAKGvGziw6feu/4XrhnwzpIOAmqme6tfmqApWPGWRx1SaTRSdNvXbvVW6PTdIker0UrhcItzVuWfeMx0Nl7m3HzahHc3gBQpO+u3XaKThkf7i13rjQ4vDcfFlIU8hLlRABGvWsODyn526stdeSiG6AQ8J4cpo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Topic: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Thread-Index: AQHZJcS6xQlTtpJxX0O79yAhgOZJ+66Z2cOAgACwbwCAAAw+gIAAA0qAgAhqSQA=
Date: Tue, 17 Jan 2023 19:13:27 +0000
Message-ID: <733edba4-6913-97a4-f949-4f8899a3bba9@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
 <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
 <71e7ba34-f1ea-16fd-ec01-bb2aa454270c@citrix.com>
 <b49793f8-55be-0746-815d-ab7b627d3baa@suse.com>
In-Reply-To: <b49793f8-55be-0746-815d-ab7b627d3baa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6713:EE_
x-ms-office365-filtering-correlation-id: f7c4cf78-e3e6-4a3a-6cda-08daf8bee992
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qA62Nx2zWdxEXARLPoiw2lOinVgNlHiDAoVxP1Puvw0V5g0dppFd3X+wgSHRP+CDOroh7uX6StUE9Zhfmja1Qgi/xXu8zIjyFsLCTWpjhYTMXPqQJrWKfJqNOhAQTyfdU+Q0+IOzIleVPyYMkJ3nC7bbXhrY57DTTJZSFVMzEDfdL2RUc37ieMHcjobTz757+nmlTKqzhItPszVFwykR6PG92BhOkACV3YP4ItmylFitCd/gm57isJljsdQ6S5lb8vB6YA/+6rVoyLauQ29kHTqhNpPq3uaqRDcFr3PKwmE0XfM3PquHHwSk92Gx2+gLR2chx+yM06oD/7sNpWqoepU/V+Nbn5K8lvy0n+IlGGDSm+fS4PNnMLlBOybMJJCYnIBakSQWsEgDBnTA5y5r/PsJ+LGy3ZmtURecKYv5DphSQFZMc8DWYsvT75kf8fGgYulkRpFqAlEpO1LadEwJh8qPJSKnsY1GGArLr1/sVtLf1kaIvVK6GAWejopBLZQWoXDwngOuLMHu5duROEqNQL5Ty1IeFmVFPZVqlVh3eYrU3btyAlHN2EDqZVG9z3ctkjjKp+9yPPPqtY2qDKnE+cYoms+YQFyUHwS1w7G2V+nX+4jB6H0IASTFeIySzUACh9lyT++ecQjNhZaREnNcQYYVe4wHBC5hU/qgdOkmiJyA/IEmiB4+v6LLvWHO4Tcr3PgQ1EDlWSeHfkayhYiPZWQG1ivy5UJqgay/Bg+spUBX4Vyq0oM0U00qDx9ty1BPD2jnyFvg9LzXhnY0E0HAwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199015)(38100700002)(82960400001)(316002)(122000001)(86362001)(31696002)(91956017)(8936002)(5660300002)(76116006)(66946007)(64756008)(66476007)(66556008)(4326008)(66446008)(186003)(41300700001)(31686004)(2616005)(26005)(83380400001)(2906002)(6512007)(8676002)(6916009)(71200400001)(53546011)(38070700005)(36756003)(6486002)(54906003)(6506007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RStUNU5uZnkxR041aXA4MHE3ZythRVA5OVdyeEJrViszNk9Ka0pvTlZpNFo0?=
 =?utf-8?B?UUFlRWxxeHdjWVVHQnhhRmpmY3ZSRXd0cVNaaUY4THJFalBobktIWHNPZnlY?=
 =?utf-8?B?M3pEQ2JCZ3JRbEd3aTVJbDFCV1NGa05reC9RSzlJdEFyQlZjdFh4bjh2ZXJG?=
 =?utf-8?B?ZERoU3pKWC9KRG5USUliaE4xaHRNU2xOSExncG1jNEtqdDhtL2JZR0Y3T3dW?=
 =?utf-8?B?blY0Y3gydHQ1N2k4Umg3a25kemRKV011dUpJeVVWZkZ6V0U4Y1plWE9wRGF3?=
 =?utf-8?B?R1A0VVplcDZ4bGZtbW01VFQyS1RKdFhkTE4wWms2UUNnVkJwbmRQbVY3c3Jt?=
 =?utf-8?B?bHltbVhJVTl6S0Zham5vTklRaE8xQ3RKa0tldFcwTU9naHJBZUpmWUsrbEU3?=
 =?utf-8?B?MTkxV1hiTGZ2V2hwR0dXS0EvdUgwOWpJaERTMUczRWxMbXVvUVdZVnkwQXZ0?=
 =?utf-8?B?VDkvOW9FOFQybW83STV1bkk2bEhmN0IySldrL2lzb2Zudk4zNGU4dVJTbUZk?=
 =?utf-8?B?Z1hxT0lvOHJtUEZJS3MzeE9aRlBTaEtQYml0SXZnWTFReXR2THgyclNmWWR0?=
 =?utf-8?B?WHYyb0tJS2NkQzBkL05sL0JVNzhXeE9uL0h5TlgrWmR6dDhJVGlEbm5TbkVF?=
 =?utf-8?B?TTlpS1IrcEwxekI1cEYzempaTWtibEp3a0RuNW1QVVorQTRIdWg3OC9sb2xS?=
 =?utf-8?B?WDhNZ2tyTEFlYVdkaHFzVkFwWXpXWHpEWXVjaG9pc3hRbU1IekxCYVJDbExZ?=
 =?utf-8?B?aXB4bE1lZ1BqdFMyVURlRytwNnpYQ2lTTUhPSnExeUpOQ2IzdFhHa2lKUTdD?=
 =?utf-8?B?ZlFVVGZHUU9qVEFGQmVFREZWT3ZtVlJqdkVoeHRsVU9OYzhoRFlZbEJGRUJS?=
 =?utf-8?B?QitGYzZ3S0E3ZmZHR1BtbE1XNTE1UVl1UlA0bCsvb1NvV0l6NGlaZkpxNitY?=
 =?utf-8?B?WEVyWE1PWTZrWlppUG16OXowQzZsVkhwZVhSUGhFaVhPalBnTnA3REhzL1pV?=
 =?utf-8?B?cDh1MEYwTWZ2bnZOeHkrc3dPd3RvMU43MFJRYTQ5aWh4ck4ya3BzREtxcmR3?=
 =?utf-8?B?T2kvM0g0ME80RzlRNUNDeEhTSVNsaTNtTU9rVC9CNGsvR0RJV0ZxejZodWti?=
 =?utf-8?B?TmRlbHp3TThpZHJaUGVmZldwMFhUcTVUdVpvd2JacEtFNVVtc1RxbDgrY0pW?=
 =?utf-8?B?MHQ2Sm1yU0luS2VrcWZZc3hDUFhVUWlIQmorKzZsUlRXTTFYaDVhY0pyamlZ?=
 =?utf-8?B?cGp6WW8vWkhPYjBwQUJCTUp4OVdVZ1FRMGM4RUROR2hMekZrUkRFMTdKdStN?=
 =?utf-8?B?MTFrTERGeVRHc3NOOUp2TkwrRVNxRXBML20zNndGcytQOEF2RXExN1M2SC9n?=
 =?utf-8?B?UlRjUDJFVnJ1dmwwYU1obi9zOXFKN1ZDRUdmakNLaUppRFI5cVViR0M2RU5l?=
 =?utf-8?B?STVjTDA4OWI4TVpEb3lqSzNvcS81UmcxdmhGMkg2Q29lYXMyZU9VMytlUG5Y?=
 =?utf-8?B?OGtwczlaV1NSMysrRExENE02U0Q4SXZaV25hRkthOFMrNG5ydTZueTd2cmgv?=
 =?utf-8?B?Y0Y2dzdOcnVhd21lWDlzUnNZUGYyR2hSOFQ5Z1duWE9KV3hMNjE2NTdWN2NL?=
 =?utf-8?B?RzVjbW1iZmUveTUxK1NiUmFLMGRnMU94Q1B0Y2Nla01zdkFNV0dBM2lCV082?=
 =?utf-8?B?c3dZWi8vS05ZcnpFMTIrZnhDdkRCbW5QYXdYZmtnNmVyZFBUNkpUWjBBSTZh?=
 =?utf-8?B?c2c3ZlAwakMxVm5HQ3FidDB5TC9GQ0NabGg1MjVuaTlhQXJ6Ni8yTUV4UFor?=
 =?utf-8?B?SjJzanA2TGtRTFhQc1hZS042NFlseElpdGcwdjBmWjFDODVWZjgyN1B0eG1O?=
 =?utf-8?B?V2YwUG1pcGVlYXRlMFg4Y0IwdVpmZnRHZ1k0SFE5dWJaR1hzUmlVMTl0MTJi?=
 =?utf-8?B?R21nR1N0emMvdHg0ZndKNU91dy9wYzZNWmdnWm44YmFNdUw5dWVkV1dqZE5U?=
 =?utf-8?B?V0ZRbktBQVF0L0U4enh3Zjl3UlFvN21wOE84Y1REZDNiY3NSZDROUmNXckJU?=
 =?utf-8?B?aHFEY1p4ZTB5V0JrVnJHMUJ0elF2eFZEcm1lTVdaZkphQmxJZ1YwSTc3SnU0?=
 =?utf-8?Q?idRPen7YXpSEmtxD3uUh+4uUH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88359E1B1E90F64F91BDAAFB049A9A05@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rr+ttq2F5qXnHGGVnWN1NsplV782tEjIfnt0h5Nkrz8wnm/NGi+Q7C6HZlDSekCOZy4KbuK1/uQBAkBGnrTw5p+k6/2ZpGfaZXYaM3hTAETbHHhYilUqvnABOc21eN3MORw9Z9Rj+pHAtkIv3/GoYhuuDr/UdazR+TINufCCaD2jB4LRZzxuXNW5C5O/YgRtbRjSfMpOjg3KkBRq9mZL6Clzine4t/z2pqXc1/Rp1n88rEgP8MUL2uGJm+5NJje7AbboCK5+Zc6CHpLQCus1++OgjGfkDVXB5+gDm/JVS/MOKlGttpDyqECdVPKY9eTqa6M3PmSn2Zzv7Ldtot4wyIASy0j2Ds6NDtWq+qwYYYtGXrHTZNQwdVVeRB6u9s38D+aSXLko+6yOZ0BUyGsD9/5NfgYgHpOff0jfrQRpO1k0mRnEgeBxSb2o1XpO9jbOKxxYXJCyKOee7JwmnFP5t9MKHjpGpKDiKNNY/Zl1Fy2VJWy2RaQi93q+RCoiPi65H37IxHVRebqqlrD9EyMmBDO1+nVKNjBa24YIB/eiePWtRfPn+XqKGHiDmAtjkLHlQKMZCK6p+EB75Wmr3jf/PVEoJeApi6dmTVjdqouxlFsnk8vLLJADUm8cig+rGHNYWxmEEce82DIBZtK9V7Ns956uOsULLD8QvtYKxt4qZFGdgV+5/bd2xnymKnKvaU8yXqnQHQWw8YKa6/Td+OJo7hOzY3RJ9UVoRz9NZUD2N2iit9RCaGZ5+LQ0um+VK+ueZTublVxDAVkasrwCBO/jiptVNdXrcZRPZTXSEcnWOrfwXZHS2NOSVPSJo51HtD0O
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c4cf78-e3e6-4a3a-6cda-08daf8bee992
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 19:13:27.2508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cl00POIznAMqOrbGTqLstH0j+cEKSXgKuUe24Q2JR+QQfkdopZy8g3gVLErhZCPpjtqWb4Pz5m7FKGdNh8UHchA3cWlt6bI+x62FSmG5eZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6713

T24gMTIvMDEvMjAyMyAxMDo0MiBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEyLjAxLjIw
MjMgMTE6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMi8wMS8yMDIzIDk6NDcgYW0s
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEyLjAxLjIwMjMgMDA6MTUsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4+IE9uIDExLzAxLzIwMjMgMTo1NyBwbSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+PiBNYWtlIEhWTT15IHJlbGVhc2UgYnVpbGQgYmVoYXZpb3IgcHJvbmUgYWdhaW5zdCBh
cnJheSBvdmVycnVuLCBieQ0KPj4+Pj4gKGFiKXVzaW5nIGFycmF5X2FjY2Vzc19ub3NwZWMoKS4g
VGhpcyBpcyBpbiBwYXJ0aWN1bGFyIHRvIGd1YXJkIGFnYWluc3QNCj4+Pj4+IGUuZy4gU0hfdHlw
ZV91bnVzZWQgbWFraW5nIGl0IGhlcmUgdW5pbnRlbnRpb25hbGx5Lg0KPj4+Pj4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gdjI6IE5ldy4NCj4+Pj4+DQo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L3ByaXZhdGUuaA0KPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9wcml2YXRlLmgN
Cj4+Pj4+IEBAIC0yNyw2ICsyNyw3IEBADQo+Pj4+PiAgLy8gYmVlbiBpbmNsdWRlZC4uLg0KPj4+
Pj4gICNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPj4+Pj4gICNpbmNsdWRlIDx4ZW4vZG9tYWluX3Bh
Z2UuaD4NCj4+Pj4+ICsjaW5jbHVkZSA8eGVuL25vc3BlYy5oPg0KPj4+Pj4gICNpbmNsdWRlIDxh
c20veDg2X2VtdWxhdGUuaD4NCj4+Pj4+ICAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+DQo+
Pj4+PiAgI2luY2x1ZGUgPGFzbS9hdG9taWMuaD4NCj4+Pj4+IEBAIC0zNjgsNyArMzY5LDcgQEAg
c2hhZG93X3NpemUodW5zaWduZWQgaW50IHNoYWRvd190eXBlKQ0KPj4+Pj4gIHsNCj4+Pj4+ICAj
aWZkZWYgQ09ORklHX0hWTQ0KPj4+Pj4gICAgICBBU1NFUlQoc2hhZG93X3R5cGUgPCBBUlJBWV9T
SVpFKHNoX3R5cGVfdG9fc2l6ZSkpOw0KPj4+Pj4gLSAgICByZXR1cm4gc2hfdHlwZV90b19zaXpl
W3NoYWRvd190eXBlXTsNCj4+Pj4+ICsgICAgcmV0dXJuIGFycmF5X2FjY2Vzc19ub3NwZWMoc2hf
dHlwZV90b19zaXplLCBzaGFkb3dfdHlwZSk7DQo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB3
YXJyYW50ZWQuDQo+Pj4+DQo+Pj4+IEZpcnN0LCBpZiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2VyZSBh
Y2N1cmF0ZSwgdGhlbiBpdCdzIGEgcHJvYmxlbSBmb3IgYWxsDQo+Pj4+IGFycmF5cyBvZiBzaXpl
IFNIX3R5cGVfdW51c2VkLCB5ZXQgeW91J3ZlIG9ubHkgYWRqdXN0ZWQgYSBzaW5nbGUgaW5zdGFu
Y2UuDQo+Pj4gQmVjYXVzZSBJIHRoaW5rIHRoZSByaXNrIGlzIGhpZ2hlciBoZXJlIHRoYW4gZm9y
IG90aGVyIGFycmF5cy4gSW4NCj4+PiBvdGhlciBjYXNlcyB3ZSBoYXZlIHN1aXRhYmxlIGJ1aWxk
LXRpbWUgY2hlY2tzIChIQVNIX0NBTExCQUNLU19DSEVDSygpDQo+Pj4gaW4gcGFydGljdWxhcikg
d2hpY2ggd291bGQgdHJpcCB1cG9uIGluYXBwcm9wcmlhdGUgdXNlIG9mIG9uZSBvZiB0aGUNCj4+
PiB0eXBlcyB3aGljaCBhcmUgYWxpYXNlZCB0byBTSF90eXBlX3VudXNlZCB3aGVuICFIVk0uDQo+
Pj4NCj4+Pj4gU2Vjb25kbHksIGlmIGl0IHdlcmUgcmVsaWFibHkgMTYgdGhlbiB3ZSBjb3VsZCBk
byB0aGUgYmFzaWNhbGx5LWZyZWUNCj4+Pj4gInR5cGUgJj0gMTU7IiBtb2RpZmljYXRpb24uwqAg
KEl0IGFwcGVhcnMgbXkgY2hhbmdlIHRvIGRvIHRoaXMNCj4+Pj4gYXV0b21hdGljYWxseSBoYXNu
J3QgYmVlbiB0YWtlbiB5ZXQuKSwgYnV0IHdlJ2xsIGVuZCB1cCB3aXRoIGxmZW5jZQ0KPj4+PiB2
YXJpYXRpb24gaGVyZS4NCj4+PiBIb3cgY291bGQgYW55dGhpbmcgYmUgInJlbGlhYmx5IDE2Ij8g
U3VjaCBlbnVtcyBjYW4gY2hhbmdlIGF0IGFueSB0aW1lOg0KPj4+IFRoZXkgZGlkIHdoZW4gbWFr
aW5nIEhWTSB0eXBlcyBjb25kaXRpb25hbCwgYW5kIHRoZXkgd2lsbCBhZ2FpbiB3aGVuDQo+Pj4g
YWRkaW5nIHR5cGVzIG5lZWRlZCBmb3IgNS1sZXZlbCBwYWdpbmcuDQo+Pj4NCj4+Pj4gQnV0IHRo
ZSB2YWx1ZSBpc24ndCBhdHRhY2tlciBjb250cm9sbGVkLsKgIHNoYWRvd190eXBlIGFsd2F5cyBj
b21lcyBmcm9tDQo+Pj4+IFhlbidzIG1ldGFkYXRhIGFib3V0IHRoZSBndWVzdCwgbm90IHRoZSBn
dWVzdCBpdHNlbGYuwqAgU28gSSBkb24ndCBzZWUNCj4+Pj4gaG93IHRoaXMgY2FuIGNvbmNlaXZh
Ymx5IGJlIGEgc3BlY3VsYXRpdmUgaXNzdWUgZXZlbiBpbiBwcmluY2lwbGUuDQo+Pj4gSSBkaWRu
J3Qgc2F5IGFueXRoaW5nIGFib3V0IHRoZXJlIGJlaW5nIGEgc3BlY3VsYXRpdmUgaXNzdWUgaGVy
ZS4gSXQNCj4+PiBpcyBmb3IgdGhpcyB2ZXJ5IHJlYXNvbiB0aGF0IEkgd3JvdGUgIihhYil1c2lu
ZyIuDQo+PiBUaGVuIGl0IGlzIGVudGlyZWx5IHdyb25nIHRvIGJlIHVzaW5nIGEgbm9zcGVjIGFj
Y2Vzc29yLg0KPj4NCj4+IFNwZWN1bGF0aW9uIHByb2JsZW1zIGFyZSBzdWJ0bGUgZW5vdWdoLCB3
aXRob3V0IGZhbHNlIHVzZXMgb2YgdGhlIHNhZmV0eQ0KPj4gaGVscGVycy4NCj4+DQo+PiBJZiB5
b3Ugd2FudCB0byAiaGFyZGVuIiBhZ2FpbnN0IHJ1bnRpbWUgYXJjaGl0ZWN0dXJhbCBlcnJvcnMs
IHlvdSB3YW50DQo+PiB0byB1cCB0aGUgQVNTRVJUKCkgdG8gYSBCVUcoKSwgd2hpY2ggd2lsbCBl
eGVjdXRlIGZhc3RlciB0aGFuIHN0aWNraW5nDQo+PiBhbiBoaWRpbmcgYW4gbGZlbmNlIGluIGhl
cmUsIGFuZCBub3QgaGlkZSB3aGF0IGlzIG9idmlvdXNseSBhIG1ham9yDQo+PiBtYWxmdW5jdGlv
biBpbiB0aGUgc2hhZG93IHBhZ2V0YWJsZSBsb2dpYy4NCj4gSSBzaG91bGQgaGF2ZSBjb21tZW50
ZWQgb24gdGhpcyBlYXJsaWVyIGFscmVhZHk6IFdoYXQgbGZlbmNlIGFyZSB5b3UNCj4gdGFsa2lu
ZyBhYm91dD8NCg0KVGhlIG9uZSBJIHRob3VnaHQgd2FzIGhpZGluZyB1bmRlciBhcnJheV9hY2Nl
c3Nfbm9zcGVjKCksIGJ1dCBJIGZvcmdvdA0Kd2UnZCBkb25lIHRoZSBzYmIgdHJpY2suDQoNCj4g
QXMgdG8gQlVHKCkgLSB0aGUgZ29hbCBoZXJlIHNwZWNpZmljYWxseSBpcyB0byBhdm9pZCBhDQo+
IGNyYXNoIGluIHJlbGVhc2UgYnVpbGRzLCBieSBmb3JjaW5nIHRoZSBmdW5jdGlvbiB0byByZXR1
cm4gemVybyAodmlhDQo+IGhhdmluZyBpdCB1c2UgYXJyYXkgc2xvdCB6ZXJvIGZvciBvdXQgb2Yg
cmFuZ2UgaW5kZXhlcykuDQoNCkknbSB2ZXJ5IHVuZWFzeSBhYm91dCBoYXZpbmcgc29tZXRoaW5n
IHRoaXMgZGVlcCBpbnNpZGUgYSBjb21wb25lbnQsDQp3aGljaCBBU1NFUlQoKXMgY29ycmVjdG5l
c3MgZG9pbmcgc29tZXRoaW5nIGN1c3RvbSBsaWtlIHRoaXMgImp1c3QgdG8NCmF2b2lkIGNyYXNo
aW5nIi4NCg0KVGhlcmUgaXMgZWl0aGVyIHNvbWV0aGluZyBpbXBvcnRhbnQgd2hpY2ggbWFrZXMg
dGhpcyBtb3JlIGxpa2VseSB0aGFuDQptb3N0IHRvIGdvIHdyb25nIGF0IHJ1bnRpbWUsIG9yIHRo
ZXJlIGlzIG5vdC7CoCBBbmQgaG9uZXN0bHksIEkgY2FuJ3Qgc2VlDQp3aHkgaXQgaXMgbW9yZSBy
aXNreSBhdCBydW50aW1lLg0KDQpJZiB3ZSByZWFsbHkgZG8gbmVlZCB0byBjbGFtcCBpdCwgdGhl
biB3ZSBuZWVkIGEgYnJhbmQgbmV3IGhlbHBlciB3aXRoIGENCm5hbWUgdGhhdCBkb2Vzbid0IHJl
ZmVyZW5jZSBzcGVjdWxhdGlvbiBhdCBhbGwuwqAgSXQncyBmaW5lIGZvciAqX25vc3BlYw0KdG8g
cmV1c2UgdGhpcyBoZWxwZXIsIHN0YXRpbmcgdGhlIHNhZmV0eSBvZiBkb2luZyBzbywgYnV0IGF0
IGEgY29kZQ0KbGV2ZWwgdGhlcmUgbmVlZCB0byBiZSB0d28gYXBwcm9wcmlhdGVseSBuYW1lZCBo
ZWxwZXJzIGZvciB0aGVpciB0d28NCmxvZ2ljYWxseS11bnJlbGF0ZWQgcHVycG9zZXMuDQoNCn5B
bmRyZXcNCg==

