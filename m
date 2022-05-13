Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3495260AD
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 13:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328423.551435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npT7e-0007mv-6T; Fri, 13 May 2022 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328423.551435; Fri, 13 May 2022 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npT7e-0007kM-34; Fri, 13 May 2022 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 328423;
 Fri, 13 May 2022 11:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWrS=VV=citrix.com=prvs=1255b942c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1npT7c-0007kG-0P
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 11:06:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afde5245-d2ac-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 13:06:08 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 07:06:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CY4PR03MB3174.namprd03.prod.outlook.com (2603:10b6:910:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 13 May
 2022 11:06:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.016; Fri, 13 May 2022
 11:06:02 +0000
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
X-Inumbo-ID: afde5245-d2ac-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652439968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TPE6nr08wsc/uc0khMah1jE/pV7ZxtFH9MiJM3wv5Hs=;
  b=RYiephJ7IA5MBffFiZv6diPEYCwvPX5a3lGO32a9ZU0j1mm88mlCVadu
   M0wErQKooeoMpmYQh9OK15nkYuDiMe4RvHSEibAotq3jdaWgsAEc4WZif
   JN5V8d1KzTXKKPV8s6Qx7cQ9VRkDI3DRJ7I9ZsBtCw22JL3yoIUNxupTV
   Q=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 71236744
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k2vokqmEDKWzqIkTBJAd8Z7o5gyDJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeX2DVOP7fMGf8eN1xOtvk/UwE7cfcm9Y1TAFtq3phRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWljV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSkQgO/H+pb0ncBBYCzNTHLJCxJrWLi3q2SCT5xWun3rE5dxLVRhzFqpBv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kBg25YasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVuuTONk1AtuFTrGPnOI/WuRNQNp2aRl
 0fU8mLVHA06bdPKnFJp9Vrp3IcjhxjTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QL/gI+oK5081akJvH/UAe/u2WspQMHVpxbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3PLaXhQv3
 16N2tjuXDpmteTMTWrHr+jN6zSvJSISMGkOIzceShcI6MXip4d1iQ/TStFkE+i+idid9SzM/
 g1mZRMW39075fPnHY3ilbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:6SUs+6j41YSFVj7BPhBDFB4n6XBQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71236744"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi06OW1YhEN3eGzKxtr6VeDB3nHAnP37rg8eYZMb27hPsG+mYsYin20vgL56TxtoCRs6bEY1dLqX6JfnlBonc8zvw2skjYM/qk9ffJMpQt4gwvCmGPMKj5NV579O4KIpua8uULTg/MzRdKIkNPbTy/OgNbrMqV8xf/TelB6WXAifcAEidtlZUu8WebCs70xvQrfcKQtcSqV5g6PIGLYjBHZMKkMyHWmPiWOr16R2pp8RwQC5+AtuetIjBlKD5ITlGN/Mf0X8AB0fh09WNcCqRe9Sl8TJi+6rJCYSt/RDu6ryKdqcEY8/j1yBKTCeGzQ6Jxf52eYM3Yx/qWg7tKJk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPE6nr08wsc/uc0khMah1jE/pV7ZxtFH9MiJM3wv5Hs=;
 b=UsdXOuQqQSkCGX5C2hpLsPH73s9JvpvoR1vCT6xK/nzZx4l3get/iKx1SQ50hu9Y70cFGlIzO0aR37L6oxQR/GUVa1HON8BLbokINL0KvaZsJjuEn005JZvChQ4oT8bvD5mOzTopwt+RztZGrQp3Ptka0bOUfMomQIos1/42pfk886UcGqQmkXgmDvfWoenXvZO1xexPwcUheaZMhCn4+K/coAtN+OeN0F1OwWiqwC0NfTjsh8veDFyKXtf8Z1MYgTHhZ1ZFDMjDoLiLXGBi3u2SIduJMyESdaqbWsYdqXMohJV+i9HZnDspysz4S8OPI3zdyI5FiaRDBhGvDTC/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPE6nr08wsc/uc0khMah1jE/pV7ZxtFH9MiJM3wv5Hs=;
 b=UEJES2T+Hq1P6gUCykDe0DtVanTxAjV6OS5rfQ7TGYWnodg8OejliPC7HQ4h56N7xbqVfykU5Whns8KqqTowDpKn4YEggj1Hb3av68ZvdXUihNaBJ2XjUyYcwrkU37Wei8lng+vSgW3miNQ2q2RnHrTudM9flumtf/smKfwXsRc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/cpuid: expose MCDT_NO to guests
Thread-Topic: [PATCH 1/2] x86/cpuid: expose MCDT_NO to guests
Thread-Index: AQHYZrUv4rDZrXUYNE2NF4UBHL3/X60cpXAA
Date: Fri, 13 May 2022 11:06:01 +0000
Message-ID: <15d66a71-33d5-c866-e57b-be0f42d1ce5b@citrix.com>
References: <20220513103500.3671-1-roger.pau@citrix.com>
 <20220513103500.3671-2-roger.pau@citrix.com>
In-Reply-To: <20220513103500.3671-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 175cbe30-7d12-4158-3888-08da34d0912e
x-ms-traffictypediagnostic: CY4PR03MB3174:EE_
x-microsoft-antispam-prvs:
 <CY4PR03MB3174D8F44F11C2FEC72AF4E5BACA9@CY4PR03MB3174.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 se/2KeRulSxuf8HKrSlKX4iHLi5F9QmGiFNuPaoOic2kUCp3M9/KeIcHBzAgpyVcNvW4BsrRpSzR7OUFR8EApyjKi5/cgtI30HW7CgmcfqDM4X3jHdF62ZyDlGjzekwKE1VJV106/p/goE842rYnZfSozy7d2QGUq2iRr67et3+w0BwS6TL3w8CQPNIdkGSx7K3WyjE94kxY7AQq9s2pSz5kogTfsmV2LDjOS1A1CB0lKd33V4fYe8sZYLtkVn9h8p95T6PUis52a0IctXGrmzDeGtbT4RuvSUBZQc+rpMmWln1S71nub/siMXbEvwdfixbC4eVzawn8ZfFRPo2W/FNoACyx4tgviukIluiw0CN7z9hhJmAXkY+BGyj8w8iYO5cUybmITPZxL9BnwOKBtG6iVRL6CpROOtyuzebOQxxNvqs4vuZRxk7mJ3imXlz1uxJawKeBDVXV3nJomUC5gDmTIeJatjusOzsircmnw7a2vN1X9hDTYFP+09+te4CHAWOjPVky6xFmkWfmm8bZbkNWzgVJntd1Lex7ynRlppH0gRmltme6KuK0GovGRWcCoLzdg/dp0+oyKGVOssvtV2YCEJ4178eWC+O+5CVJUkdLGCGECAeKMIThxYuX4X+8lVl2fBHrmIHnlcZhhZqaER8oWcScgmYhdpNSWFr82jdGlLUVeDOiP3ZFB3NbE6VQkLrK3W5yOYk1a+wScmZhJln8ENoS60LVWZGVkOtCuqnTs0RB8OQsLCNoLWVM3MZlJAdZONtCTGgRhAmaWhCxYg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(2616005)(71200400001)(8676002)(4326008)(66556008)(66946007)(76116006)(91956017)(6512007)(64756008)(66446008)(66476007)(26005)(38070700005)(38100700002)(4744005)(53546011)(6506007)(2906002)(5660300002)(6486002)(508600001)(31696002)(122000001)(86362001)(8936002)(82960400001)(36756003)(110136005)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXRlUjRWemJrc3RTMnpwakF0cnBIcEpoc25MbHQwYkdweHJkaFlsZVpsN1ZT?=
 =?utf-8?B?U3Y3dDNUUlVoTm1CZWQ4NXdBRENSTGpzbmg3Y1lLMWlJS0dNU0Z6bjhreWFq?=
 =?utf-8?B?RExTSzNtN044eFcvb2RjNTJtdVk0R0RTRkFWMkVjcURwVHA2QmEyVHQwR0xr?=
 =?utf-8?B?TWgzdjJXSGE3ZG5ZOGN5YTNDcGJYYlRsMkx1c0xLUGh6VnB4UGE2dHNaenB1?=
 =?utf-8?B?LzBpa3V2VjE2R0dkZnd2aFdxYlpsWjMxdXB1ZHVrdDkvbmhteDREakEzL21R?=
 =?utf-8?B?eDBJTm9pZnF5T1BIZXFTcUI0eGd3NkZQL2ZuTnFsbDk2WldlMlNqd2tnbGc5?=
 =?utf-8?B?S293QjZCMjNCcXhWMjduRkVhMGdxV1l4K0NPNDN2RXFkOHN5SVN5bHc0VG9x?=
 =?utf-8?B?ajRDYk8wY2V3bFVsRVc4S255UFBnNkVQeEM3MHJqZEdJVzJ0SlpIZnh4cnp3?=
 =?utf-8?B?elNyWlRkVWh5QzBPWTNGUWlIZC9sZFN6RkZVRnQ2TlpRQWpPNUlrRko2TlNO?=
 =?utf-8?B?T1pJSktDbFF2LzFtMGdPYlMxeHI1VXZKRHhTdHE0dWlrOHRuaHhwYkdqSlNy?=
 =?utf-8?B?Z2IzRWZWaUN3Z1RkZlI4MEFhemdOQkZ2T3F5VUhsZHRDdDBQQ2x5YllUYWhw?=
 =?utf-8?B?eTRybHZBM1BuZU1YU21TeDlHUFJkcHZLaVMwYlN4VWdoWHRIeHd5M05Ndy9L?=
 =?utf-8?B?NlRTN3U3VThlS21xSEpwRHd4czk4OGVIdzdKcTY4WjRVRlpFMkZXczJDU2NP?=
 =?utf-8?B?RGRzYTVOdFByRnJpMjlvTERJU0hBL1Yxb0dJdzJEeWNRUUJGRFpINWJTVnEr?=
 =?utf-8?B?NUlzOE00MFF1WDFXcTdnbG42ZEc3RlRSckhmNVRjdkt0ZGpESDlRbm56QVhD?=
 =?utf-8?B?bCtnSWM5NGZVOVNISktyQmNzZlRvRjZXZTZTTzJYdTNaaTJsYW04cmdNQklq?=
 =?utf-8?B?d3dkUnNXcThmMnNORHJUaXJmUFhGa2tBL2wzK0tBa0k1cUtsOFRkT3dLMC9K?=
 =?utf-8?B?QnF5SytxTm5QeEdEd2xXaGVkQVBsK0toKzJrd1lPWDJEaUxXeENuMm82Qktz?=
 =?utf-8?B?WitwVHZ6VUk0dGd5RlplMEg1MlRNMVZ3ZVVKTytFN2RsSEFiL0N2c1N0S3V2?=
 =?utf-8?B?VTJ4SldmcExLOFVUaTFiSjZxL1JqakZRSWRiVWhlL1FHUkdDMWlFOHI2YU1K?=
 =?utf-8?B?Nld3UnRYSTJWaGZwL0JVWS9xdkJEMkU2OUpTdy9OZHFTVGQrbklYU1M5L3RQ?=
 =?utf-8?B?d29rQmJxYTg0Um9LdGtiL3B2RVErdEtYWmZITUJ2ZVpVZDZCYU1md2xnTWU0?=
 =?utf-8?B?ZGQ5VVFyWW5lNXFrL2tjQUR1ZTY1Y2xFKzRvaFhwZXk0RVlxUXVUY041UW9N?=
 =?utf-8?B?TWZmNVlmS3FTUHU4ZjNSZnUwRWM4UzAxTXZLY0Q1eDQxK2dYM05NbnRKM1Zo?=
 =?utf-8?B?U1JPd1VQOE1rd2xielhNWkE0b2IvbER4dnJaY0x5USs1NE9OWFR5K2VjRU5C?=
 =?utf-8?B?NlI4TmI1b2htMC9EN3NhT28zMzdQR1E5QS9xYU1ET0J5YmN5MWZGd3dVMEZa?=
 =?utf-8?B?NnBsRzlpTjJ1T25LOHdKYmVtM3dlTTJERVVIUDlONXBSVG9pa3UrTGVQRHZG?=
 =?utf-8?B?NXdXRkNWSjZ0THA3OFloVlFRVWZ2L255NTVXTU9KZUxpcVl4WnllUjZRWUIw?=
 =?utf-8?B?YS81TC9qL0JGWTd2bTRFbDlLRUF5ZzhNUzRMUUhneGJ5eHBmRzBOaWNjNTR4?=
 =?utf-8?B?aVNzUVZ4elhjU0hVd2xadWltLzhiVEJQWkRVdU90RjNGUmhMblhCQ081VDFR?=
 =?utf-8?B?Y2t5MXN5aDQ1V2RZODkrOGhWdVA2QkN1dUhoTWlveml4dUNtL21vSjFNbzVl?=
 =?utf-8?B?NXRpdjZ3OE8zdFg0czNiaU5CUUNnVkJpNzBleEkzM3lDTlh0d3N4dzl2cnpR?=
 =?utf-8?B?a0NBWFRnL3pmTDVUTTFidVNsN0xHYTB4QmFrekpoYzlMTXlvWnB4cVpTODND?=
 =?utf-8?B?czdndmdETXdEYkxxNHBaWFNkZ0dKVzV4SFlTUmk2V3BNUHozalZ6RERLQm8z?=
 =?utf-8?B?TExTT1ZLbzVPQkR5T0o1OTBiU0hnT1dSTTdLQnM4ZDAzemRTUWk3K09Qa0hB?=
 =?utf-8?B?d0tMaWQyNTNLaHd5TXVuaDhONGdKTVN4bkk5dDNKVlVnejZ3d1MvOUxpS1gw?=
 =?utf-8?B?RmEzOXYwdDJGNlVzVUlUcldOa2EzYjUrWVRVTnExOGdxUjg3dzdHYUNUOVBG?=
 =?utf-8?B?ZmliNysySXZJaGs2MTRDTmI3ZnplTVFiNTlyUUt2YU94YlgxWU5aeXpKdUN4?=
 =?utf-8?B?RjFCYVM2Q2xFdDB5N1VKODkxK3YzU0pWREJ3WlcwTUlKNlVobUVEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14E2632C58DE6942950DAC4EC53D4DA6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175cbe30-7d12-4158-3888-08da34d0912e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 11:06:01.9757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b928MNUapzw0e02nctTLcVQZ3lpRTyMK30C0uQ2LQAiYf10mM6QX0U6QEGzb3VGb1Bkul4PogbvSInZhePmqqTyBOpG2dyqYkuoTsUHYwpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3174

T24gMTMvMDUvMjAyMiAxMTozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcHVpZC5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4
bF9jcHVpZC5jDQo+IGluZGV4IGQ0NjJmOWU0MjEuLjY5N2VlMzgyNzAgMTAwNjQ0DQo+IC0tLSBh
L3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3B1aWQuYw0KPiArKysgYi90b29scy9saWJzL2xpZ2h0
L2xpYnhsX2NwdWlkLmMNCj4gQEAgLTIzNSw2ICsyMzUsNyBAQCBpbnQgbGlieGxfY3B1aWRfcGFy
c2VfY29uZmlnKGxpYnhsX2NwdWlkX3BvbGljeV9saXN0ICpjcHVpZCwgY29uc3QgY2hhciogc3Ry
KQ0KPiAgICAgICAgICB7ImZzcmNzIiwgICAgICAgIDB4MDAwMDAwMDcsICAxLCBDUFVJRF9SRUdf
RUFYLCAxMiwgIDF9LA0KPiAgDQo+ICAgICAgICAgIHsiaW50ZWwtcHNmZCIsICAgMHgwMDAwMDAw
NywgIDIsIENQVUlEX1JFR19FRFgsICAwLCAgMX0sDQo+ICsgICAgICAgIHsibWNkdF9ubyIsICAg
ICAgMHgwMDAwMDAwNywgIDIsIENQVUlEX1JFR19FRFgsICA1LCAgMX0sDQoNCkkgdGhpbmsgd2Un
cmUgd2FudGluZyB0byBwcmVmZXIgIm1jZHQtbm8iLsKgIENhbiBiZSBmaXhlZCBvbiBjb21taXQu
DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0K

