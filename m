Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D465F877
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 02:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472242.732401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb8H-0005H1-Hs; Fri, 06 Jan 2023 01:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472242.732401; Fri, 06 Jan 2023 01:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDb8H-0005Ei-F5; Fri, 06 Jan 2023 01:02:53 +0000
Received: by outflank-mailman (input) for mailman id 472242;
 Fri, 06 Jan 2023 01:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDb8G-0005Ec-LL
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 01:02:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71c3705-8d5d-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 02:02:51 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 20:02:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6912.namprd03.prod.outlook.com (2603:10b6:8:47::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 01:02:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 01:02:47 +0000
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
X-Inumbo-ID: d71c3705-8d5d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672966971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5Yu4XtuSxJDYHI1Yk6SQYnBFkmruKjaDT1sYhAHD+tw=;
  b=TWdKUaAPVj2hnfxTfO7x6dOzTh8e5K7iX5wAnYNhrKx4l7gn3RnLXUI1
   s6X6nX9D8lEmsDdCxerxJdkX6eSxUxIl5mhqOUSYkl6LSW5xbMT2ZTxBH
   eU988D4YDvk0d6lKTIGhG/O4HKfCobF+yjHjYnqe1QyM9BBEstVtEBYM9
   g=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 90886482
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nGqCOqPWjlD5Y0fvrR2TlsFynXyQoLVcMsEvi/4bfWQNrUoq1jIDz
 jEcX2yPOvqCZ2Smf9l+bYzko0IAucDQxtNnHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gFmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qEsIjse5
 OVGEgs2SzSjv+adzJC7deY506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6XzXOlBNJIfFG+3uFAjEWtzGEpMQAXD2CC/aOhrheuat0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRt3jX4iIQ6jxaKVdA6Fqew1ofxAWuon
 2/MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:e81QRKCRz+yKL5zlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="90886482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQdCJvLwx8V+iSvT6xKYjaGt9hayxUiVII1fyeMf0xzj6i1bC3+6fEbAdXU05dgTBw9zNYrYWi6kQhJyJ2EiH7JKEzaQf5es89Ja6MKC+Z3WXSlJUcrgDCuwllFW1ucHvOCeu/KAokSmSSbp/N/fOakWivKyPvjBGeNO6QaPUp87zwQv7OlDHzusxqfKLz3+tkNCBkyc+rW7qTuAbnApW0QGmb3HQIMW6XEUQSBcBHgf3rx/i8bmhDmqscoAUOrCncSO7XsnySSm1ufh/HRJuBD7/neRNU4VFFbyIfOJfGHIEZM4JUSW4TUzv2c2D6Kq0lw32boKlCJIoxFOwCkOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yu4XtuSxJDYHI1Yk6SQYnBFkmruKjaDT1sYhAHD+tw=;
 b=mTx9e2jxWwsi7stqfON1C/pbusLE5690cs3WSz2PoZH8dowHYw/G4JlyiAKWcvJTYrLcULo+TKi218q5hWxAP4c9k1RciZO6r/lxhY1M8AFox6RUQ+kyO5A4bB02Sr2mEGv+q+EyGzDbO8LTRWWjZ1mzklEMRz7pS4Lp93hIzGxxCwMulqwVfKYQrXBlEtS9wbpMr9iwR89snzw9eN7eN9ecE7Q39vssSVrTZtSbvgqpmRV1OUf4ixHFnAX1f/i1RcXO2tmu9OkclJLotSiNnM6l/9N9R7c+c3TvgdPLkBtbCL0phFQStkw+LdPJiP0+irh+eGgn8uyVmpKOOv28Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yu4XtuSxJDYHI1Yk6SQYnBFkmruKjaDT1sYhAHD+tw=;
 b=OvzRuH5q/Sl6dpvc+CSI43yAb7OLazUIu9YFtmOBP7V488uhYzkCvyobb9Wos9flI0Jb6zBjxBqvxIR6ZOGxAd25glBjcPskC99s8gsFV/Gfiz3NqBdZYfX9dwmy6fLobHbO1RWeRZgxb/dR84I6yMg2plaoF6Qnbglw+32jP0E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 06/11] x86/shadow: drop a few uses of mfn_valid()
Thread-Topic: [PATCH 06/11] x86/shadow: drop a few uses of mfn_valid()
Thread-Index: AQHZIR9umeBFnTREcUub2eAZa8aRda6Qku4A
Date: Fri, 6 Jan 2023 01:02:47 +0000
Message-ID: <11758833-fb7a-f937-a847-fe79ba932679@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <ca3e0c70-ae80-4c21-97f7-36525229074b@suse.com>
In-Reply-To: <ca3e0c70-ae80-4c21-97f7-36525229074b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6912:EE_
x-ms-office365-filtering-correlation-id: 488bded1-b792-4150-d21d-08daef81b9ae
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MGrdWtshkseu4iF4dVNOQq8rwOuFkRYuBaXK3T+YrErwoWX0JJtltjnINMoLGFguJks+P93JHMkV2UuUaZUQAYfY/xVvjDvHYVYu6e6HzcUE8JcJ6z7e6NFEtU/edyPjPjnjFZA8omhahZHSUnKBtXGNFeZcg/fUdiCYZZYemfAfi+rMcKTvY8QpkSneSwoq6drFXdAC/LX2KXPtNqsoTbSkItFRqIpaUXewhjHuVb0Zr0faW68Ci9JBIGDUDuNKlDRUzxmsfq2AfqLdAMkbrQhJ6YGhNfHZpl/U9dRnsu+Ygf3CDe0eDzgc6PBIpW+mIHy3LRniOxo3jlwo9aPeusoI4le3Tn+T9QvST4fzOUQJptMafSm10bgUVbxD07CC3vHBROw/zBlyLpSQ/1Qe11hm/APqbRx4/Hp5oCykAc29n28yP6a/kJ/P7cSvYZ75MeGst3DJa2fAEXVAocX6czp/YJzt9bTpgcykZIJPItyABEK0a/Z8wCGIgm52S1XnGR7lnDy+I/sKubzf1l1xO2re5/STf8lwXprOzKlGJsP8dk0QXsIHV4P+U/0frGByhzWefqyMNgN6g2SYhMokcHyo8RTpjmzBi9/Pk34vTNqpIDV+3VWpPt7xXGUfYyWZjVzkby5YIiRJwkCcTpRBa72ap9MJ9gtuFbtpiufvt9X0cX2n4wem5yrfO4aZI8FfwhgLgc86LVrME86UYH5odwou7MYFUNg79VaQmuDdrn3tTxecVWv+9PFcNH+Y7GYV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(31686004)(8936002)(110136005)(41300700001)(4326008)(76116006)(5660300002)(8676002)(66556008)(66476007)(66946007)(66446008)(6512007)(2906002)(316002)(54906003)(64756008)(91956017)(6506007)(71200400001)(26005)(478600001)(107886003)(53546011)(186003)(6486002)(86362001)(31696002)(2616005)(38100700002)(82960400001)(38070700005)(122000001)(36756003)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1dPdnllOG8yVGFqeUV0ZHZ4YzdzQW4rSkJ6NlZTM3RXUTZSRkdoUXkyYkQx?=
 =?utf-8?B?UFlFU1M3MjdmU29WKzVZaUludUlBd2RSMVBYcmRKYXdVWFErQXNldkM1N2pC?=
 =?utf-8?B?Q3oxTEdmUnA2RUFrWlFERG9VVFpuRGkwbUV4bjYvak9oMmV1eE9aSHNtZmxO?=
 =?utf-8?B?NkNMTmIzdzlLYXdRWGNLYlJwdkcva0VGTmZiUm4xQU5YdHgwQWhHOE4yV0FK?=
 =?utf-8?B?bnNPQmxOMWpFNklzY3ZtQWVTNm0ydmU5cDJZdmVNZFRNZ1dhWkV6MWlxa054?=
 =?utf-8?B?c3NNNysybVdVbEgzQUtNOGZlaU53ejJvS3d6V2dXdi84bGVFR3pkMGlCdGRF?=
 =?utf-8?B?MnM0dENROW5STGw3RFhOSFk1YnMyWFc1SElDVjNWcE1HUGY0REJ6bTVjR21k?=
 =?utf-8?B?Ymo2dkZQV0ZIaHhyNkQrblMyY21meWhYSlM2ekF4emVPSFBvbWQwelB2N3hG?=
 =?utf-8?B?RGc2YjNmVzFtVE1hRG9NYi9RN1FETFVsbU40MElxMEEyMitJRXd0ejVKdDhQ?=
 =?utf-8?B?VGFEbFQ2WEVJdWxHWUpqaThTeUdVWXJKTXFqd0JISEpqUUtnOW5INnhkUzAr?=
 =?utf-8?B?WVd6K2lHRHNQTVdwTW1udTFRL0JqVFpDVGlwWFc2QzNndkRNM3FUS0l2WkdF?=
 =?utf-8?B?Tk43Z0ZCR2VZazh4WWhtVC81V2ozT094cG1qbXNJL3RhNzRuZzBCQzdZRGZG?=
 =?utf-8?B?R1p6NTJvejBYRnp1eTZnTzV3WEYvU1ArWmJlVk9JcVBGa3JCUWQxVWcwVEdM?=
 =?utf-8?B?cUpuU1BWVWNsNEFLd3ZZY080SnlFUEhIN1g0MWFNbk5NdXVESEJtRm9zZlpU?=
 =?utf-8?B?TXNLSnNzNzZjdDJsRmZQRXc1M0M5UC9YNEVhUFZTYktXRWZKVlcvZlgvYVNH?=
 =?utf-8?B?S21JUGw0Z0ozeWR2bmMzbklmQmFDeHlrVkVhY1VLTlhHNE1LcFk5QktQNnBF?=
 =?utf-8?B?eVFlSkxoRFgwY0ZVTDhvTGVVUUdzUUcvQS9pM25CWjJaYk5SdVhZOHhzQytN?=
 =?utf-8?B?MkRNSWhEU0s2dThvYkp3bHBNOGxiT3JUdjRudUYrcEY2S3Z1MVVsNFI5bDNO?=
 =?utf-8?B?bDlXUmtNNE5IamVVS1JuZXQrM1BCaHVFemkyWmpFc3QydmdwclBZTkpHQmx0?=
 =?utf-8?B?Q0tDQ0R0SU5FdERQSWt2UHhFUmN0YnU2YjRtUHBRN1BNTHFHa2cxSHl4U29L?=
 =?utf-8?B?TE15clVTekp3SUordktwR1pDV1hLQjlaWTZ3NmZJUnpad0VOeUZFUzlKajFH?=
 =?utf-8?B?Znp4R1E1VlJXR1RyeTNzVUlmY2c2SkliNldTUjM4bzRITitWS29Td1NwcitF?=
 =?utf-8?B?K0M2VTBzMDFlT2toVEM3Z1R4Wm50Z1l0STBTcnppWWZiYmZoaWd6M2E4NnVU?=
 =?utf-8?B?a29qdFNsdGVXaW1mUmFtV0hGZ09vRG9BdlpJS1VsWmEwSDBGNjE2OVYvZ0ZH?=
 =?utf-8?B?Um9ha1lCK0dRdTE3ZzhpNHJrcXIxZ3hmdnhJTDFvS0k5ODBJYnRlQzl6dnBP?=
 =?utf-8?B?VXFrTFNyOHY3MXB3L0lqREx2Mml4YlRwSmU2YnFWTDhiYlcwak5GanJlam45?=
 =?utf-8?B?a01Qa21VcVlkdFNZZ1dhZGxYSmFnQWZVb2FEdFBWNm9yeGlZc1BDMGpGbHNq?=
 =?utf-8?B?ZDQyVzl0MWI2QkwzK0JqeTh1dVZUZDNkZ29VaUZpWlVBRkZ1NEZFWElreDRZ?=
 =?utf-8?B?a2FreE8rV1hUdnNhb0s0MG8zWnFJbEd2TTEyMDhYVWlHTFk2OWR5Vy9sVHhM?=
 =?utf-8?B?bTNBUXVjaFdLRHVaUnIzM1RVMUJYUEUycVR1ZER5NGZxejJaTXB6aXdRbitu?=
 =?utf-8?B?NnlZcDg4ZDFzTGs1WVJNeVA4UzJ4WjhPVTNyb1c1Z3Y0RUwyZ3BYMmMwVmti?=
 =?utf-8?B?TzVtOXdaSWU5Ry9MRzhPZEtpSFpXQlI5K0ltM1AvMUtGYlB5NHdZeVRmc3hF?=
 =?utf-8?B?RTFqUlhBYkpya1UvaytzMFJqa0phVldrUTEzLzladjlhaTFKdmVzakJqMDZs?=
 =?utf-8?B?U2pUdDBjeldrVk03U0NxWHZBRTY0SVhIUjdCbnFnWDhIMklnWG9aUW80UEF0?=
 =?utf-8?B?UVFiaEJkRHFhMjY1U0FaM1hndGpCRmZUNldVTE9GYXhNU09TSDJDbzZEMVlY?=
 =?utf-8?Q?9gQElr30ilnyVO6IaVXNfWzT+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A95E2BFA5B299246ADBFA743A34DA020@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WXoTPzzy3oThcE5NiNJCz2EntLdsClcM2Gyou7Hi79FMfSvbU5b8DWjN8/J9Qenmrgi0LrLkcHhRSXYAE1N1gV0IyHBodcaKYLb71Ud6pLTX3xooexoVzWC9bZ56P5UOB056Xd1dckJZHKxiA9TPxHyPHCMYUkeqwG/I8BWnMmHdY08UBD1YhQ0GJ+CWVPAGmrnXs8y7HIqlXvLQi+w+lI5xFjyV0O2xi7LVRHYUa/ldrYwpXIEUYIJfw6bBZ/aS6Xr0tnFCOYzHayErQZoX3xb3W68uBs1WmQds5EqKCegDySuudCsCr8fLklo57AvnTcC74nViSPbKUL9G9dFlGikJY0Cx5NHORPLuJdIn2OtmWEeaSyUvpwaRvOaALqgsaBNcSVk2Jh8jg67GfxXj1c0A54jbNg+4BxKKQhU9GAC7TWD/kL64nbp4V30daAV48RdGzP4lYHfItBmbzQvXDRY5IJkGm1aCokpm9b0fMiKAVQOH7PixI4iD3znENwHiRwPZKChZwODDq5047PDu7h0bOJveIHjoV2a80z10RWR3h9m+IJWn5CidUp/HJfP+qAoW3SYaxIzbHZeT221OgM9aLXTfLh8CppagygrJI0VIW66BlYKCP4FiyHibbvfeTFXAOsFaBQAIUttNFx3gfT5aEuuATncs5hT901KoQJ+rfcNhU5lBWTWrGRqsmjHXDpi8wL3tpJS4aah0qGlIIgGQ1pPT9hcRLacghOkjte7GbghTeXu9GDcJeDa5NspW6Nf+m9VXVNSgix9N6jzA4N56GdQXiBTMgLtlLo2Ujgm4jeVE8CNfhpDiME9xFT1tjELliwQfvj3ZFCao1Rsv5w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488bded1-b792-4150-d21d-08daef81b9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 01:02:47.0783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2ZG4slglp0Umqlt4DdYmxVJgBBAEF4wdh8AMd0qWwJMOrIZ+6hR24ufSUk5bbEW+E8ohbWaGF8AzuB8h1s4bHiC6iHdLZeWqLAQSmCpuos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6912

T24gMDUvMDEvMjAyMyA0OjA0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gdi0+YXJjaC5wYWdp
bmcuc2hhZG93LnNoYWRvd190YWJsZVtdLCB2LT5hcmNoLnBhZ2luZy5zaGFkb3cub29zW10sDQo+
IHYtPmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfe3NuYXBzaG90W10sZml4dXBbXS5zbWZuW119IGFz
IHdlbGwgYXMgdGhlDQoNCmZpeHVwW10sc21mbltdID8NCg==

