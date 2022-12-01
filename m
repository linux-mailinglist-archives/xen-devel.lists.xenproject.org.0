Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4163F01B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 13:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450655.708030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iHO-0007l1-IU; Thu, 01 Dec 2022 12:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450655.708030; Thu, 01 Dec 2022 12:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iHO-0007i0-Ez; Thu, 01 Dec 2022 12:03:02 +0000
Received: by outflank-mailman (input) for mailman id 450655;
 Thu, 01 Dec 2022 12:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0iHN-0007hn-2P
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 12:03:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 188590ec-7170-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 13:02:59 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 07:02:56 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5202.namprd03.prod.outlook.com (2603:10b6:a03:220::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 12:02:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 12:02:54 +0000
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
X-Inumbo-ID: 188590ec-7170-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669896179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b0bhH8jl6yRmRAkmpyOM0wAuHlYgJIsSpWJDPAjDcCI=;
  b=YzVegFqvoUiMHlFVxYK8eyz8B1fSpakLmuyd/110ZVTA0uECzo8geKkw
   rNxqHxo+TsKcTeHmws3JkjY/bBmVtOkcVNJ8z5ezklB8QEONC2wcc7aVK
   GNpZCe1M9cXyD152PoBbstRKCsvN10GxeHxGLVdnl2Wx5ag3otoKkX3mq
   M=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 85599252
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ltkpSqLmjHHaqEBvFE+RzZQlxSXFcZb7ZxGr2PjKsXjdYENS02QHn
 GIfDWvTOPeKa2P2L9snPNjg/E5QsMXTy9ZrT1ZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4sOkVF5
 KwWGAs3NBm5g92qxaKKF9ZV05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX6mCdNISefQGvhCx0XC3kMPGiItfwGgir6lmH+wfM9CJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNAvqsIeXzEh0
 V6N2dTzClRSXKa9THuc8vKeq2O0MC1MdGsaP3ZaHU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvG07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:vw/HfapBYUxs0IalbANRjuUaV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85599252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EghFfmZ4pcCR2TeZOC+IB+qnIr8aSfBStco3fl1VaJYD5EBtP9Maw4ttmdBNrEUpXrknrTbg5g6ii/K7/aNSK7hJRsoMALbxnHW2uncJhqdFEmAnAGqvt8mtH4u2kCkJckR875KejwvbnVKsMdE4UiNafUj8g3eYIZbsYZzhzaDG5V7IsEsXQBPvtWDt65KARuNmtHwU/h2vOayaiRwnSUE0E0PNqJ/2szdQQhyv11iOIOsECRPiLxlK3aqhmv/iKtu+F4lJ5nwh4pFaxl5gv08aieKU8TYpBMV+nii9R2tfxf/slL/+4O6THZj2gT8E8m1JSDW+BRCuO78ULmvsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0bhH8jl6yRmRAkmpyOM0wAuHlYgJIsSpWJDPAjDcCI=;
 b=cHeWEUyh+ymp8e+dcE/pVwNrsKN/8UsfElMJevZrp+hDVHn76xtQWQePsyjTrOfDvymGDzZAn6/PXIcNrUqaNmI/qYUXG+3+Y+YLbX8nVB1DPynPs+gTroL2JSY5jsr6zQ5Xs0uomyMoOzY61W3oM3l+GOzlwm9DOI8czVxaKmhQU5yE/GgYdIfdjb4MGzFKg7U4vIpY5y3pmGLT1byeLd5GhzgCPXczrdIKgx9ZDWtdohA40omlm8dR8TKPqo18C0/Uqc5EYSv+TyYn0JI60l6651JLxLB0MF5O2M5LI1mFyjeezzsVi7+DHN3V8cdVmqGO3ySB4POmT3KfNYUlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0bhH8jl6yRmRAkmpyOM0wAuHlYgJIsSpWJDPAjDcCI=;
 b=avoEkfMCR/3jjAK0BpsA3whoEK5wAyTg2Db42YkTOBEeabLiRW4JLFBfwS5jiWBxz7shMs/SkX4ChlyUN2kieiuwwgwv+Q35N8AkQ51wPMDvr+LZE2Q9mRK2wcyK3x6At3CD7YE9vo5qG1rRlvwhECuT695CGGFCrt7SqXw668Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Topic: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to
 'remote_port'
Thread-Index: AQHZBNyFNvaM1t+D4EiUJIDtYLxqxq5Y5boAgAAKPAA=
Date: Thu, 1 Dec 2022 12:02:54 +0000
Message-ID: <240e9bf1-3f10-7c65-8e8d-cb192359919d@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-4-andrew.cooper3@citrix.com>
 <775FA3EA-6F85-4706-8159-EB8CFFD983E2@citrix.com>
In-Reply-To: <775FA3EA-6F85-4706-8159-EB8CFFD983E2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5202:EE_
x-ms-office365-filtering-correlation-id: 5fb3cd79-23ea-45f9-65cf-08dad393fad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mFEyRPjAgVmfGJ0RuXT6UKULUVJl5x54wtiRLkP9Xg0Divk4jWb8G1tsAfXysWiE1dAOeMOfuJQfmeMdNfoyj7XuJobuHDZOJGXik4uJ1PWuWJ54MXTf6Im+CWZfuchkdlNMD1yFGRrKy7MIndHUZYzoKjMR4mJkOPtFTLUIQbbWV2Rnfr1/2yEiCFjY+jn8TbKC53IVoEBGapOzgV372txKHeQOektOv/Y/KihpOh7JNzJC2Z71+rlsElaK9e0wn9BitsS1pHZRAIzSt+xe2fhVRtP7b0K2t+0y3GsBIr8DbmUHtLbSCRbL1nxDb9Ez0fwfF6YzfAa4vJG20yIl3VcJeDcGnqD/fekajpWxAlSWcfzalpyyxsu++PArLTJfJIwq2nGakMMX0V9IOFcAozIBJBF4aII/ghkXPBKCgTX2LvJFn/WE0Ty1ru92yKfAV+WAhgx/aMDy03xEzVFxuyHIer6fl7JGDx4nf4j0lurU41DqZ21QJ1ECH3nanVtUgsKQkag/WBGPdC/qDDr9WpzUgQsK/GDTsCmDNBzHyxnILCihz2mr2tnu7y4ksLiZ2UaScFBbxX4th9eSKe149zg29VC3HGkM4AdQYz+vHyZwT6s0igYWA/xAECG7uM/VxTFV4V67YMm4W1eEO1GexAix+2c57tjN0Qk0v/ftW63CfRVvq2NJItY8T1YxkxjY7PUgbxtKmFfwzRbokINcPX2daB6a3h4Zy6r0nBRibmhCsxL2BCiEJje1HQRVZlL6q7aFRV0MInp5oCqLN0xnRA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(53546011)(36756003)(86362001)(37006003)(6636002)(31696002)(38070700005)(6486002)(54906003)(316002)(478600001)(71200400001)(2906002)(91956017)(4326008)(8676002)(66946007)(66446008)(66476007)(41300700001)(5660300002)(76116006)(8936002)(6862004)(66556008)(64756008)(83380400001)(82960400001)(38100700002)(122000001)(107886003)(6512007)(186003)(6506007)(26005)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGF0TTBZRXAvQUw1V0x5STdpZ2M4SWM1WVk3RUlSNDVrSGhMZ0tzenplN3p0?=
 =?utf-8?B?MDFVMUVHNUVYdG5BbkMvTW54T2prZmtvSVZCSmlZclZpMDRRdXFUVEo1K0Fm?=
 =?utf-8?B?L0pSWmV6UU1mNkR0Z05GcURqd2ZBcGt3UTBoUDNJV1pXYUFmMVdqbFpLRngx?=
 =?utf-8?B?WTlBeHo1Mk40MHJKUW9INlFHcVBqREgzMEpsa3V6azBXNmJ3OUpxMHFUcXlv?=
 =?utf-8?B?K0dHODl1OWJyL3JZWmVVOGFxTnBESkVnUkMrMXIrZmxueEw5YjNpVzdrYjly?=
 =?utf-8?B?VjJ5SWZQb1psWUxsKzEzTjhHVk1TZDlWTXg4RjJkMW5tQVFNbmRCOVc5NHdD?=
 =?utf-8?B?eEJBWTQ3bW1DaUdhc1l2clB3RGUzY2VUcll6azhzSkhLTGI1eUJTRk8xeDhI?=
 =?utf-8?B?QTBIRHlxQ1J2UHFKbEM3NmxpTEtaVEtpd2hzN0VDZFRUVjV5TEgvaDc2bUpI?=
 =?utf-8?B?Y3QvN2JHRGMzVkM3d3g2ZGMxN2NxU28vUURXWG1SZXFHUCtRUHVBNlhvbWpx?=
 =?utf-8?B?Qyt6cVg5L2Z4ajZ6N1E2SWpxMXFISmcxOW5rWlk4VzJYSWZBNkZmOHhQNEIz?=
 =?utf-8?B?RkRkd054Ym4yYzZwdkg4blN6N29kM0o4YlM1WFlTZHBNVm8wcitUUGlyMGph?=
 =?utf-8?B?bTJreEp2YnBxY245ZUhFYmN5TlA0TnBLS045bm9UTlJtTmNqTTNvRm1qeFo3?=
 =?utf-8?B?Um5rMmFKNDF1ZGtQa1pzUnZ0THZ2WVNTNEdHMW5QVUJrQ3NGSnFZZGtMKzVn?=
 =?utf-8?B?TEFxcHhBNkRzWWpMbW5IVWRLUjhrRENZNXdTZGJaMUpEWmZKUmQ4RDVvUU5W?=
 =?utf-8?B?cGlwaThtOFV3Wm1oNFNUMnNTbjRlRjVpWUZXMUF3NWh4QVROTGQrMndlWVl5?=
 =?utf-8?B?WHVLK3kvUDNTVkd2MmVheXA2RjcxZ3N6MEc5YmNQRFhBUHc3cW5HeEo1bE1V?=
 =?utf-8?B?SUgwL2xpOTVEbEMyR1Y4bkM5UXJsWWIya2l6R29rd1JZS0NoNVF1V0wwWG1D?=
 =?utf-8?B?TXp3blpnRkJ0LzYySGhUUkhobWt2VkE0TndLU2htS3cxMkFMdTFEYktLR0dW?=
 =?utf-8?B?WHVXVDJuRDJGbDM4aTFnb3pOaSszVWRqaStpVlJoTEZudGg4UEMxSExUQkZL?=
 =?utf-8?B?YkpKejZ4RWlkUWZkY1NnVkNhSmtZWnZqSWEwd0k2Z1ArZ1dXbFYyTkFEcytO?=
 =?utf-8?B?QmxhTXBkQkpwOGlhQzJHSE1yZmNLRUlyZjk0TE1zVXJjR3hNSGZRaFhNeFFN?=
 =?utf-8?B?SHhhVm95WExoSFlweGszbG9EaU0yeUZOMHFvdGtDMjBXUy9hNmMwL0h1R2dR?=
 =?utf-8?B?akFGdlFTNXJUQ2JDUWhLdnYzTWxOQ1NtdUNpTDdlRndHMTFZQlRMUUI3SWF2?=
 =?utf-8?B?UFE3QjczbDVLSi92NG55VzNjQklSeE02ZWhYbWRMa3NMOGdmTHFQaVN2d0kz?=
 =?utf-8?B?ZEhiajVMd0k2c09iUDBhR0tDQ29MaSszZ0gwdXFoNXJ4NmRCU3RqMzJtK0JR?=
 =?utf-8?B?MGhoMzdDWFRyUUNETmU1bSszcTVTcVF4VkZtcStUWGx5dk9DckJLM2tyVkRy?=
 =?utf-8?B?bFI0TStuQ3pTRWt6MWFxM1hmejdBa3VlK3o4OHZjYnMrYXFMY2dtcGJjNVJD?=
 =?utf-8?B?THRQeFdrQ0tQR0YxckNFZ3p0bEE2K1ZIY0lOcnFGeEhQamhzZW9MWng0ajJF?=
 =?utf-8?B?eVBwQjR1UUdGYXpGSzROSVA3VmJLYVVHU2FSdmxOK1VWVWVnTGtPS1lpdFpy?=
 =?utf-8?B?Slh0MXFDM0ZKRytRZDBoUjZ0V2w5L3lKTGx0YTFXdWhpM2M5ZTMyczRIdzBF?=
 =?utf-8?B?UkMxbnpYYXZNaTV4RXRPd1cwdmFoK25mTUdyY2J1V2lTTXZBVUNGUzQ0bDdC?=
 =?utf-8?B?MVVaNTJ4WlpXdGpZQXBjVk1KckdBbkRXbDVnazBpZWpBaCs0d0Uxc0hTNTJ1?=
 =?utf-8?B?cXJjMlRxZ0E2eHFWQ0lCTmlONmdrZEFQZlJkU3A4U05HV25hMzVOQlo5cDl1?=
 =?utf-8?B?YllFS2xsNGZEOWVnRlN4NWtGNndhekNmamRSdVI4MnNRYjdRVjNkaXkxYUpj?=
 =?utf-8?B?dDIyRnl2YnZrbEZOVmJBTHkvVU9UUGQ5VGNXaVY0Q1RqY05lcWZUSk1yWXR3?=
 =?utf-8?Q?7pcBkxVL1RxqvaP7nY0tvOpQW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E19AA9DFCFAF8478A47B030530E135B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kNxhEPMN2qJvy5jmpgAMo2oom59XWDr2GVHfjq3cwWhOgdOJRMcYH+a8DDYhUA4RWlxDif4UptuvpdqwcXtR6xUkM7PfUpczHj/AzNbOdXzw9NOp7uQSyNgJGXWs90NSaV+dtiFPOEY08oxBKCjwWWZB6jaCr/Nfj3L3qUD65nn4A8A62ubTH8yRoUiN4soBaEWIrFAoWOgUsynhD4kdjZ28QZzCe6s+PNd0aoLXea9164rjhhCD3bqlNCLVhT5UAX6pGNektL8TlNLfJU7X41G1jp74ppvIIx6uMxuxCT9K89eZHkB9DCGGqPhR9OtXPvWSM2//Ca+8uNOgUBr4ipKra+Y22AZ04cffjdk09J8r5eY+CGxlmTCGFYDc2OWN1CUXrj1osNPEke+YaT7+CyjnNYX8gIXIDRwOVDyepoqL7M9M8N8TqCYp0V0q+6f8Dw03GViedDv1/OqdqSvZlIM5fT+Httuw5Ua0fsGPYfE6J/oh6+ykqQ24IQ6VH7gRZ56apjvr8X4YKlcH7Jg6cHeNaxiTqXEjPCj0f0Wso4FjjJ98Csb7bSi61Eu8f7mJjeQVQxR7t4r4fq7wSDYJw1Io61o0qmLN+JcsSYbhkw/tEIZiHihsI9gEyZdK5PRjWndT38Ax59M3NOt1N0bbvfgZGDCsHwRBFIhUcDv+yHAWg5xISkFgL8qHdsLN7kURlzRzWoxJvtbiPSX8pZYxnxCcZk8ZDoj3cKv/g2CCQo9PbKB1YfMGW0/tOZwH99fUt1DjVUWXURpE5prm0B4Y8+swLj5eKn58f3yZMIoz34owG0ZlWVUkD4UTRkEuf4Bd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb3cd79-23ea-45f9-65cf-08dad393fad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 12:02:54.8329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkuoJnD3tBkp5zAXND29FYWGXEU8IrdtLfAdGKuLd0L55TRBdmtbStUzXUSwRsVsznrzRzYEsNjY8BVTW3W40IaAyoDEPHLzf7bbn7EGqAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5202

T24gMDEvMTIvMjAyMiAxMToyNiwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4+IE9uIDMwIE5v
diAyMDIyLCBhdCAxNjo1NCwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pg0KPj4gVGhpcyB3aWxsIG1ha2UgdGhlIGxvZ2ljIGNsZWFyZXIgd2hlbiB3
ZSBwbHVtYiBsb2NhbF9wb3J0IHRocm91Z2ggdGhlc2UNCj4+IGZ1bmN0aW9ucy4NCj4+DQo+PiBX
aGlsZSBjaGFuZ2luZyB0aGlzLCBzaW1wbGlmeSB0aGUgY29uc3RydWN0IGluIERvbWFpbnMuY3Jl
YXRlMCB0byBzZXBhcmF0ZSB0aGUNCj4+IHJlbW90ZSBwb3J0IGhhbmRsaW5nIGZyb20gdGhlIGlu
dGVyZmFjZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPj4gQ0M6IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5v
cmc+DQo+PiBDQzogRWR3aW4gVG9yb2sgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+PiBDQzog
Um9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGlu
ZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQoNClRoYW5rcy4NCg0KPj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW5zLm1sIGIvdG9vbHMvb2NhbWwveGVu
c3RvcmVkL2RvbWFpbnMubWwNCj4+IGluZGV4IDE3ZmUyZmEyNTc3Mi4uMjYwMThhYzBkZDNkIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbnMubWwNCj4+ICsrKyBi
L3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW5zLm1sDQo+PiBAQCAtMTMzLDE4ICsxMzMsMTYg
QEAgbGV0IHhlbnN0b3JlZF9rdmEgPSByZWYgIiINCj4+IGxldCB4ZW5zdG9yZWRfcG9ydCA9IHJl
ZiAiIg0KPj4NCj4+IGxldCBjcmVhdGUwIGRvbXMgPQ0KPj4gLQlsZXQgcG9ydCwgaW50ZXJmYWNl
ID0NCj4+IC0JCSgNCj4+IC0JCQlsZXQgcG9ydCA9IFV0aWxzLnJlYWRfZmlsZV9zaW5nbGVfaW50
ZWdlciAheGVuc3RvcmVkX3BvcnQNCj4+IC0JCQlhbmQgZmQgPSBVbml4Lm9wZW5maWxlICF4ZW5z
dG9yZWRfa3ZhDQo+PiAtCQkJCQkgICAgICAgWyBVbml4Lk9fUkRXUiBdIDBvNjAwIGluDQo+PiAt
CQkJbGV0IGludGVyZmFjZSA9IFhlbm1tYXAubW1hcCBmZCBYZW5tbWFwLlJEV1IgWGVubW1hcC5T
SEFSRUQNCj4+IC0JCQkJCQkgIChYZW5tbWFwLmdldHBhZ2VzaXplKCkpIDAgaW4NCj4+IC0JCQlV
bml4LmNsb3NlIGZkOw0KPj4gLQkJCXBvcnQsIGludGVyZmFjZQ0KPj4gLQkJKQ0KPj4gLQkJaW4N
Cj4+IC0JbGV0IGRvbSA9IERvbWFpbi5tYWtlIDAgTmF0aXZlaW50Lnplcm8gcG9ydCBpbnRlcmZh
Y2UgZG9tcy5ldmVudGNobiBpbg0KPj4gKwlsZXQgcmVtb3RlX3BvcnQgPSBVdGlscy5yZWFkX2Zp
bGVfc2luZ2xlX2ludGVnZXIgIXhlbnN0b3JlZF9wb3J0IGluDQo+PiArDQo+PiArCWxldCBpbnRl
cmZhY2UgPQ0KPj4gKwkJbGV0IGZkID0gVW5peC5vcGVuZmlsZSAheGVuc3RvcmVkX2t2YSBbIFVu
aXguT19SRFdSIF0gMG82MDAgaW4NCj4+ICsJCWxldCBpbnRlcmZhY2UgPSBYZW5tbWFwLm1tYXAg
ZmQgWGVubW1hcC5SRFdSIFhlbm1tYXAuU0hBUkVEIChYZW5tbWFwLmdldHBhZ2VzaXplKCkpIDAg
aW4NCj4gQ2FuIHdlIGJlIHN1cmUgdGhhdCB0aGlzIG5ldmVyIHRocm93cyBhbiBleGNlcHRpb24g
c3VjaCB0aGF0IHRoZSBjbG9zZSBjYW4ndCBiZSBtaXNzZWQ/IE90aGVyd2lzZSBhIEZ1bi5wcm90
ZWN0IChvciBlcXVpdmFsZW50KSBzaG91bGQgYmUgdXNlZC4NCg0KVGhpcyBtZXNzIGFsc28gZGVw
ZW5kcyBvbiAheGVuc3RvcmVkX3BvcnQgYW5kICF4ZW5zdG9yZWRfa3ZhIG1vcnBoaW5nDQppbnRv
IHNvbWV0aGluZyBvdGhlciB0aGFuICIiwqAgYmVmb3JlIERvbWFpbi5jcmVhdGUwIGlzIGNhbGxl
ZC4NCg0KQnV0IHRoaXMgbG9naWMgaXMgYWxzbyB0aGUgcGVudWx0aW1hdGUgdW5zdGFibGUgQUJJ
IGluIG94ZW5zdG9yZWQsIGFuZA0Kd2lsbCBiZSByZW1vdmVkIGZ1bGx5IHdoZW4gd2UgY2FuIGJp
bmQgL2Rldi94ZW4vZ250ZGV2IGZvciBPY2FtbCBhbmQNCnJlcGxhY2UgdGhlIGZvcmVpZ24gbWFw
cGluZyB3aXRoICJtYXAgZ3JhbnQgMSIgKGFsc28gcmVtb3ZpbmcgdGhpcyBhcyBhDQpzcGVjaWFs
IGNhc2UgZGlmZmVyZW5jZSBiZXR3ZWVuIGRvbTAgYW5kIGFsbCBvdGhlciBkb21haW5zLikNCg0K
DQpTbyBJJ20gdGVtcHRlZCB0byBhcmd1ZSB0aGF0IEknbSBub3QgYWN0dWFsbHkgY2hhbmdpbmcg
dGhlIGJlaGF2aW91cg0KaGVyZSwgYW5kIGl0J3Mgbm90IHdvcnRoIGZpeGluZyB1cCBsb2dpYyB0
aGlzIGZyYWdpbGUgd2hlbiB3ZSdyZQ0KaW50ZW5kaW5nIHRvIHJlcGxhY2UgaXQgYW55d2F5LsKg
IEVkdmluIGhhcyBwYXRjaGVzIElJUkMsIGJ1dCB0aGV5IG5lZWQNCnJlYmFzaW5nLg0KDQp+QW5k
cmV3DQo=

