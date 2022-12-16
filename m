Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A166264E609
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 03:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464097.722435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p60nB-0000bp-H0; Fri, 16 Dec 2022 02:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464097.722435; Fri, 16 Dec 2022 02:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p60nB-0000Zg-Du; Fri, 16 Dec 2022 02:49:45 +0000
Received: by outflank-mailman (input) for mailman id 464097;
 Fri, 16 Dec 2022 02:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p60n9-0000Za-J3
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 02:49:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48e5f33f-7cec-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 03:49:41 +0100 (CET)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2022 21:49:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6170.namprd03.prod.outlook.com (2603:10b6:408:11f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 02:49:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 02:49:33 +0000
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
X-Inumbo-ID: 48e5f33f-7cec-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671158981;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=p2ge+GkOC7El9ntlN/PBjK4WkVoHAT/EfTL6RKH2eV0=;
  b=RlrtW/PFd7c0xPQCvsnF35dlxpE90hFuhNgAIWvBxX/AC5bhCI15R2MN
   8+rTSgFo1GiQZJT2GBeXcZb4l9SgsqWfG05DmE7MKibHpbEwp4TVXsntO
   RgOuIHnWjEAooDANvj6+YANUZOuCE5PhzEua5E4F+B/tS1YIPj3qNwA/M
   w=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 87638031
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wKK6KaqDvtSImHZ8uK319UE3S5BeBmK9ZBIvgKrLsJaIsI4StFCzt
 garIBmCO/aDZzD9f9t+YNng/UoPusCByNBgSABkrn80Fi1B9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEziRNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC8/UE/Zh+av+bKUUMh+hZsiJsX7BapK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqaAx0AXInwT/DjU/f33nsNjm1XevBZFZA
 hYduXJ1v7ctoRnDot7VGkfQTGS/lhIRXtt4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcBRBEA6sPuo6kyiAzOVddpFKOpjtzzFir0y
 jrMpy87750Rh8MW06Sw/Xjcnimh4JPOS2Yd+QH/Tm+jqARja+aNZZGur17S7v9CLYOQZliHo
 HUA3cOZ6YgmDpyTlSrLXOQEGpmo4eqINHvXhlsHN4Ug8hy99njleppfiAySP29sO8cAPDTuO
 UnavFoI4IcJZST2K6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15DYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:FRPRPqlAV7XArHWV2Fm9FvG5oYbpDfO5imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdG9qXO1z+8X3WBjB8bYYOCGghrgEGgG1+ffKlLbakrDHmA279
 YHT0ETMrzN5DtB/I7HCWuDYq8dKbC8mcjG69s2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUOzpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZbcI5p4dYCxY/ouW3vRYzWTFcVcsnq5zXAISdSUmRkXeR
 /30lQd1opImjHslyqO0GHQMkHboUsTAjnZuBSlaDLY0LDEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77VDADvXzJmNXf3CP0A8fuP9Wi2YaXZoVabdXo4Ba9ERJEI0YFCa/7Iw8Cu
 FhAMzV+f4TKDqhHgbkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4QZhZ4O
 bPNLhuidh1P7grRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCIH7Jo46f2sRH2AhrQu158HIfou
 WxbLoDjx9MR6vHM7zx4KF2
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="87638031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzxoTaZRsNoH9qwvocVqQM2PGPGN7j81kuqWL1m8HUuOH+VKEPW7xdRgcAup9lVT5N5QA2bsSeJOOHSRksc0IJsbPpx8dkEdTz8Zy+6F7Qin+DOG2ZjvTJwth4wBfY0lMoNtiuGqojZZ2D5o7s/S4IadxBTTJIn3dqe8+fRJ+h88HngFwn1jYqT2Xi5lAP+euCUw6HHFdHIzQhgKOk3gR2wQCUrIwXyR2fduaQoumXfC21mw8pAbuVzbKI2gr4mtBy8BEs/BU6VwYhr0fdqcAjNyOvxxHj2DXvl3JtchR+LBAJ5pdRDMW1Rbiqh2JqwIXO7YNyi6IIquIegYzKP6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2ge+GkOC7El9ntlN/PBjK4WkVoHAT/EfTL6RKH2eV0=;
 b=ESKAh5YbZeAxkdaphkp+iX2w+P95+IkeumCwyEmIhWIpxc4ntgsLzs7hQ+D0HSfhvnp9RwAFXAJi5SXjzDw7ImKH7QaydyAzsMaqM21a1jegJ92yLvG1hFnjk7XrgQVHvGDwxu30bVNk3SbWzyNMGUzMOmPavg6samxoOzpHK+z5o96u84iRng61VREDE5DqGRETw/cGamRRZqydsXfm4K9QYVUvw1RA7MNIE8b+RxMSWM+titwRkRf13Iib2ALcwxyBuWYHATOvD7z3dKsJrMLcRKDJucmG6i1hsQOYyFm4jyKPP0sZ/8qnBHaWp4XtkTXxozhBsTI8onI45vt7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2ge+GkOC7El9ntlN/PBjK4WkVoHAT/EfTL6RKH2eV0=;
 b=U14kDS83gseV4p6/y+Op0aDinPWZbZgOGPW1RTDjGLseXjN7txjBdRgxBQ2Lv2t22q/64OVw+sQa+Vi7QoF6owdy/9ohYVM1ChhIRJI1p1+c4EyiVIhZGCSn9B1eJBsM/eQu524ol0B8H4br5sLbpnc1OkDCh7iHcu6h1BLCdPA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Thread-Topic: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Thread-Index: AQHZEOEYwMi/YxVbW0ewrekF3Th9Oq5v0EuA
Date: Fri, 16 Dec 2022 02:49:33 +0000
Message-ID: <41b74605-bf88-2f56-53f5-033b8934d757@citrix.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
In-Reply-To:
 <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6170:EE_
x-ms-office365-filtering-correlation-id: 783eec88-293b-4b2b-73a7-08dadf1029a9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4Q+UTAGw/yj1skSRhKF52mWloHjSlpgbA/4OK/xlxelr4BqynJj6+O3inPlq9y43hThxZBD1+Yy/X+UB7zz+pN15FzBLCeTGZQttnJ7aIwb7w5U7MCviriC4cvJOqNj0S1NdGOLQeiWtsIVJGjuxnhP11J1SOpeaW4WktfEWIu8DOxG1PoNbOPsqc66LQqmGQ0gqTAXahRNFEvt91dbRiYWTHq15kYSytOCWCTVzLORQtrI3mwT9G28l3A9SBZ/iGzT4R4cuiW1hPwbMGH7dDQVfxJ8ykk+1YVUrkZbv2saaTbXO489kXpxf3XzFayWetaALV7JqxoZDFd9sJLcSrblXEbJspQM3DVSfDJqnYIyUUKQBr4m0q3L9wMzdhRIRPQDaWNKKv0Q04ZNgXhdDjVX9bZAjXuI0kFCmDFCiLXjWuwvA/THMdZWpwtN8mYW1hAaNJQGhPmzftqxTscQLQq+oBf74mX0jxJYl+9o48aQeu44I/09otFBxjxeVufgzuaM39IFhN+90XlGjZhbCOx0nKWIJej6fc4liVks/idNNWnU0vba70/sYo9w+Xsy3NrjhupjP10vxCkGxIRUPNFupeAu1hPNrT6mrPsDffHPHp83x9CexWk0pBROs0iXMjrMH+4IGetezyTlR0tdOGsams0Wd2TkQGs9HkORXEhYZaOJAa0tVpV5gveixmoaejDx6f9hiaIEzSQGknV0GVU8pidcDsZtkuQ9krt346B+qazCV0QurAsGSH3inC08dH42Eg/0BA4hm7YbXKNqolw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(66946007)(66556008)(66446008)(76116006)(7416002)(66476007)(8676002)(4326008)(64756008)(5660300002)(41300700001)(2906002)(316002)(8936002)(110136005)(71200400001)(53546011)(186003)(26005)(6506007)(6512007)(6486002)(54906003)(478600001)(86362001)(2616005)(38100700002)(82960400001)(38070700005)(31686004)(91956017)(31696002)(122000001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MllraE81SEkrcVgrR0JzTG14RU1mQ2RRSHlrYzR1N1BMUUlpQ285Q2xLK2Fw?=
 =?utf-8?B?SGIyTjhsMlNyRmRIS0xRU2ZQRXdpNm5NaHNTVGs4STlKVHNuQ1NKb3Y2Um5E?=
 =?utf-8?B?ckhzTGdTTW8zQmNWLzFnbTdFWTVLeVordWRKTXc5ZW9yeUowWWI3NjB1V0V5?=
 =?utf-8?B?UEcweElxRFh4OHpna3RwaEkvZ3R6ZUFWbGVsNlVTMzJWY0RTVXkrWktkQlVr?=
 =?utf-8?B?a1R2bXY2dHU1N3hJSUtUSGRhMjdJM3pBTjRza21RREdJb25KbGJ2bWRMc0RY?=
 =?utf-8?B?MnNDb2pyR1ZzYVdNTFYxVS9lcldMSXZyRDhjMlJFbytaVDM3MkZIQU1vYVlk?=
 =?utf-8?B?YXhXZGphYnVNOFd3bC9uNVR4bW8vQTNoNTVpOHg1TzRiZ2p5MFdjNll2b1ZK?=
 =?utf-8?B?QkZaZ3A2dlBSY0c3bHZqc3p6YnRvSDFFeUZWdHlLZEM0OUxGQytqdzVPRm5B?=
 =?utf-8?B?UjI0UFdkekxTZWZCR1BlZ3Yvd3c3ck44YXRtOHh1VGQrMFVKajFFdldRRnRn?=
 =?utf-8?B?RjNzTTZLVVVRL2JuaWlpZTZuWmFRZWhuSFFzMWlTZTU0RDRvT0twMU5pKzNX?=
 =?utf-8?B?S0Vpc1QzT002ZlR2UzhQeC8wOVFSODFhcTZIRVRvdVZLRWVuZmJsV2VFSmtF?=
 =?utf-8?B?RU9JSi9uWHpHUGxYazBTb2tNN2RNdWt2eW8wOVdvOUc5c3lzbk56d1l1cEt1?=
 =?utf-8?B?bGUrUHYwWkRYOVY1WmlIQ3BPRy84UVNneVIyVnIzMFIyWFdVZVNZY3JPaStR?=
 =?utf-8?B?SE0yamlVWWRWaHBnU2NWLzd2MFhqSkhMSms0K1BRN3JjZ0dUTWtUL3VCcy9Y?=
 =?utf-8?B?UVBqWjNoQnpDeEZhV3JaMlROVnJ6T2FwSFdJYzhLdk9jaWxCRnVST1ZtSjBi?=
 =?utf-8?B?YkI1OWxVaWY5T3p5RzBxRHJKNldzVHlVZzdrekI0K3NhWHVHejBrZGhwVDRx?=
 =?utf-8?B?eXVEU2NkaTVUSXdLaGtWSG1nOHIrUUhoOXFVYXZYWGZIYWY0RU1mWlpWMXhp?=
 =?utf-8?B?Mk10NlJJL0tIMXprS3FnZkhqWExlR0RodDR0bzVPNTk5cnJlOUJsWVgvMUgw?=
 =?utf-8?B?MGpBSkd2YVBXcmt1M2p0QlVmck9yOTU5Tk1RVXFhWDJYOWlJMzlUcWp0QXlM?=
 =?utf-8?B?MWtHRi81bE1SbXZydWpCWkZSbW9GeXRhLzdvaG05N2lhUG05R1FKR0w4V3NL?=
 =?utf-8?B?aXA4T0czY2lxdzhEcHh6U25EOUY0SG14U3NOVXh3TVJUcFRYU3M3TExDZUV3?=
 =?utf-8?B?QkczVk50aXRFLzJ4ZHlwM0pOeDVjUzF4aGlPTEpuTlVyZlVrRnVGTWpSZ0hF?=
 =?utf-8?B?NDZSeXczREprMmJ6UFA4eE41V2hGbEI1ZzNBaExmbVlEaVNpNzlHSC9mOGNK?=
 =?utf-8?B?bm1ZL0NRSjltNzlHY0FHVVRvcWNOTURPTng1UDNaelVKdkVFaGVrL1UzVEkx?=
 =?utf-8?B?dWVlQTNGbzVZclNqWDg0Q0w5UkY2djJ0QzFtdzBFdlFpNHY4Q3BoWFZvM294?=
 =?utf-8?B?TjROcDcwNmQ0Z1J2WUVOMXMvcy8xTzlvd3c5MGpYd2gzdUpJTS8zNGF2a1d6?=
 =?utf-8?B?SGhIelRMUjJ0TWRBbHNHWFNnWVpqMjh2eWpDOEZhNVZhVWlsNktsZkpZWllE?=
 =?utf-8?B?bFlHekdpUXgybWdoYmNBUm1qTkx0V3hXS29mc280OVY3VFZqTW5LU0F6RFZB?=
 =?utf-8?B?SGVjTklaR29ZZk9PRG0rbUhYRHN6a3ZUUUdkNFI1RlB5L08ydmRHNTVzMnl0?=
 =?utf-8?B?N21xYnUyTnpwRmdRdlh4WHpMbUV4dG94U0VYRzJ1UWhPOU02OXNJZkNQd2tZ?=
 =?utf-8?B?bVRyQ0lUdkpCbG5SRmZHTlM5VTlXaDNUcTgwcmNQcFVaeCtDdk5QRi9IZkly?=
 =?utf-8?B?QzRTTnVPN0ZyK2FUUnI4dkFneFNEK2lRU25ldTQ4VU9OZTQwMUpwVzlXODRw?=
 =?utf-8?B?elhHNVJCdUFqSi9MNllKclh2RkpmTWJpb2w3QmNTS3BZWDlWcFpIWElzZXRk?=
 =?utf-8?B?c1VwUEJvaVlQc2c2T1RQejZVZGt4U0FqVFlxZzV1Ui9MZWZYOUE2cFJCWDZw?=
 =?utf-8?B?cFRYTzlYMVpDQ2xGQXRsdzBRRStkRG1wdHErbm5icUlQYk5wOWIySjkweHdE?=
 =?utf-8?Q?3ZOp5KAVNTMtKSARAclcAwk6q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD872BA8F6B8C34494B8D9765F762A9C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783eec88-293b-4b2b-73a7-08dadf1029a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 02:49:33.7475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tYf3ElFb3BSk2iZadWSkYtozqE8Y6B/plK+qInphcdDCLEeAL9XYvzy/SbhBXSmniTfBqh+qqyrC1P3503uT8VBuaa/lHDWIsw4XaT7g/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6170

T24gMTUvMTIvMjAyMiAxMTo1NyBwbSwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiBpbmRleCA3
OGIxOTcyZTQxNzBjYWNjY2M5YzM3YzZlNjRlNzZlNjZhN2RhODdmLi44MDIwNzNhMDFjNWNmNGRj
M2NmMWQ1OGQyOGVhNGQ0ZTllODE0OWM3IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0u
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiBAQCAtOTU5LDE1ICs5NTksMjIgQEAgZ2V0
X3BhZ2VfZnJvbV9sMWUoDQo+ICAgICAgICAgICAgICBmbGlwID0gX1BBR0VfUlc7DQo+ICAgICAg
ICAgIH0NCj4gIA0KPiAtICAgICAgICBzd2l0Y2ggKCBsMWYgJiBQQUdFX0NBQ0hFX0FUVFJTICkN
Cj4gKyAgICAgICAgLyogRm9yY2UgY2FjaGVhYmxlIG1lbXR5cGVzIHRvIFVDICovDQo+ICsgICAg
ICAgIHN3aXRjaCAoIHB0ZV9mbGFnc190b19jYWNoZWFiaWxpdHkobDFmKSApDQo+ICAgICAgICAg
IHsNCj4gLSAgICAgICAgY2FzZSAwOiAvKiBXQiAqLw0KPiAtICAgICAgICAgICAgZmxpcCB8PSBf
UEFHRV9QV1QgfCBfUEFHRV9QQ0Q7DQo+ICsgICAgICAgIGNhc2UgWDg2X01UX1VDOg0KPiArICAg
ICAgICBjYXNlIFg4Nl9NVF9VQ006DQo+ICsgICAgICAgIGNhc2UgWDg2X01UX1dDOg0KPiArICAg
ICAgICAgICAgLyogbm90IGNhY2hlZCAqLw0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+IC0gICAg
ICAgIGNhc2UgX1BBR0VfUFdUOiAvKiBXVCAqLw0KPiAtICAgICAgICBjYXNlIF9QQUdFX1BXVCB8
IF9QQUdFX1BBVDogLyogV1AgKi8NCj4gLSAgICAgICAgICAgIGZsaXAgfD0gX1BBR0VfUENEIHwg
KGwxZiAmIF9QQUdFX1BBVCk7DQo+ICsgICAgICAgIGNhc2UgWDg2X01UX1dCOg0KPiArICAgICAg
ICBjYXNlIFg4Nl9NVF9XVDoNCj4gKyAgICAgICAgY2FzZSBYODZfTVRfV1A6DQo+ICsgICAgICAg
ICAgICAvKiBjYWNoZWFibGUsIGZvcmNlIHRvIFVDICovDQo+ICsgICAgICAgICAgICBmbGlwIHw9
IChsMWYgJiBQQUdFX0NBQ0hFX0FUVFJTKSBeIF9QQUdFX1VDOw0KPiAgICAgICAgICAgICAgYnJl
YWs7DQo+ICsgICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgICAgICBCVUcoKTsNCg0KVGhpcyBp
cyBndWVzdCByZWFjaGFibGUuDQoNCkJ1dCB0aGUgbW9yZSBJIHRoaW5rIGFib3V0IGl0LCB0aGUg
bW9yZSBJJ20gbm90IHN1cmUgdGhpcyBsb2dpYyBpcw0KYXBwcm9wcmlhdGUgdG8gYmVnaW4gd2l0
aC7CoCBJIHRoaW5rIGl0IG5lZWRzIGRlbGV0aW5nIGZvciB0aGUgc2FtZQ0KcmVhc29ucyBhcyB0
aGUgZGlyZWN0bWFwIGNhY2hlYWJpbGl0eSBsb2dpYyBuZWVkZWQgZGVsZXRpbmcgaW4gWFNBLTQw
Mi4NCg0KfkFuZHJldw0K

