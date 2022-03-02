Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E564CA9B7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282412.481112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRKc-00049d-MQ; Wed, 02 Mar 2022 15:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282412.481112; Wed, 02 Mar 2022 15:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRKc-00046x-JE; Wed, 02 Mar 2022 15:56:02 +0000
Received: by outflank-mailman (input) for mailman id 282412;
 Wed, 02 Mar 2022 15:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPRKb-00046r-8k
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:56:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4008e297-9a41-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 16:55:59 +0100 (CET)
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
X-Inumbo-ID: 4008e297-9a41-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646236559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Gm3wwbiISZCoda9GpT6wD0gAiqyct7+qGSdyQx3eVUg=;
  b=RQFEJFVofQRFlVYVF2xB7lwGQ4l9ZcSE7TwZzZRJiDsjCQYN6yYi0AvK
   GnsC7vfowaQnnKPp/bgBb35GJE5NUUNwvKp3ZdjYw8fBbM/siKqwqt5gE
   oYubYZgpdunFCxO1OCjyq0O0Pjtmx5+aUdG9OTBNxMqkwuVVbJLRBqcbQ
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65722028
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J49Ftak+o6RZWqQ31iZ468Do5gy3JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeW2jSOayPYjHzfIhzb4Sw8R9Qu8PXnYRhTFQ4qCozESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1nV4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaCYyJerT3+4nWUcHCgtdDKRL/4bpCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGU1NkyaM3WjPH9GF5sVgLulj0Cvah17qVW1lfRovTTqmVkZPL/Fb4OOJ43iqd9utkWfo
 HjP8yLmAxUZHNuFwDGB/zSngeqntSHmXIMfEpWo+/gsh0ecrkQfDxAcWF+TqPywmEm4Hd5SQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/LIHicor/qfc3jDqa6+jgK7NC8sA0ZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrW7FF5mLJ9043d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8S427DqiFMIMfOPCdkTNrGgk0PyZ8OEi3zSARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt6I901x/kOz7yQl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:VtZ3SahU3BvWWBsbYOZL4QAmcHBQXt4ji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VJVoLUmyyXcX2+ks1NWZMjUO0VHAROsO0WKI+VzdMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzVQxexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65722028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzxeH899AWirUGWS7X1tM+Krki4chAzLD9DGKACu/jkgU19aMeIQyt8qixU4yzd2wVEFmvACAY/fhYz9SSqX4a9jJZyVHjaibn52O3iz8iseW09H5A5tEg4mtnA2eD5RxBA1Jc0pGbyWAX2VK6sQqfNYEN1GWQbIk9aGzbaPr/sx5M5H3Y1wOaiU59rps9zaAekXkb7efQ3RDmIgV6+mEtm2oIgwnqH7hER5Kp3T7dG/J68lKkl7ZyvYyxrac74UpiTmWtsa9Mx3F7bojWsNGJryDnhtUks7rhsDk+7R3tqhzjz8h1hA6iq2SzBYdgZ/RxBVWgMH6Gek7/XMuMezLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm3wwbiISZCoda9GpT6wD0gAiqyct7+qGSdyQx3eVUg=;
 b=P/YTuCX8I5CvBJt1fV1lNs/eT9Z8e7FU03+TPMdVlcgfYSezFnNrh/ixOI58qSmqS0j4Jn/r7Vk+Vbx81ycdcWyP+PHrsGM1wYKG8muSY/qYg3ZkRvob4aDLdiHQvxcKpO8hqMvUPPtkhwL3eGsMHzqVfm8vLfTgu9kqRxlVSv8IUXVpw/8GGZg1Yp9WaJ3c1zXCs6Ww2EA47lSOvp1d/3lOl5PnYu6hrmne81Wx3ClXRjTJ0On5JY+ALmJgFbCbxJaSi2ySES0h6sq8PdNoXnym3WR5iC+N1wzlK/dCBNGTLQ+3sjMqUTGLTV+mpBeeAb3RQONRUR12lSdS5q1sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm3wwbiISZCoda9GpT6wD0gAiqyct7+qGSdyQx3eVUg=;
 b=aEqI+IypFQW77w7rpdHJKq+Nmk/CclTT+YQBu91oD6NF3n3y4bktzUYx6x4O5M1wm44s2YRIQn8ArruheGivdV3SgYAR2k4oBtdHOhdXZiK5IUVaz3NSYL0VJ07uHwgtJn4i6qW9Cp9WoFbyZHxUMx0iEO0Y/Ua6j2r9irX7agE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "Doebel, Bjoern" <doebel@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Topic: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Thread-Index: AQHYLkHgSrb/iAL0mEi291/GjB3zE6ysO3wAgAAD/YA=
Date: Wed, 2 Mar 2022 15:55:54 +0000
Message-ID: <437bce05-a3c4-8177-0a58-fb9ead961231@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <459241b5-d412-d2e3-0f23-6094db87535a@amazon.de>
In-Reply-To: <459241b5-d412-d2e3-0f23-6094db87535a@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b408463-e6a1-4d49-3a9f-08d9fc652214
x-ms-traffictypediagnostic: CY1PR03MB2250:EE_
x-microsoft-antispam-prvs: <CY1PR03MB22500EF3610A9754E7F4CD3EBA039@CY1PR03MB2250.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gnAe6goX86AGnZgZrAvTNeSzAhGT7dyozkJBmWsJS3Z1G6QaGErYoGSyOPkjE8wZieJTNgdRXPOGeeawZ6AMK0UQOQd/BjEK87t0nOl20+TEUI6YP+LSQ5yJSrKBDGerDCYCgQ+h2GWYgX7g1GOyJt89qR2J4DewrimsVEdB2ItRfcDjPqUQpfbQ2+WaQLU0TmbO0fqwixNLfU4eC7nUFV7NgMTZb3KNuPdnvmNWEcIuZ0jrcTBGZCKsI/jS465qhwUH4UQS69yIho8m50u5oR4irtJvAE2lqfIqV4vy3ke0M0SEZpFB1bN0tWGy5ohu53GGcjTl8WEqLgkUWY45Jb3ZEAnGt6Hh2hzzuhMiFoFQjegiD3dAkzLPd5G19l7EfgY2sGr5tQIIlDR+2CACIfCPBpKCWPM4OnH37+ToIaTIsPHAUZ/OMRcDa7T1j8EJ4r713jb7I4VwdfXgClugO1xLCZIZJ4it/OCThbNXuZkw+1lAjAOfrsFDW+nAIn0QCr3E6kquRwHBgAc6KGAcSyegdAHGa22zWBMkzKQLRg0vIanpjJWBcCZpDuXShjoNqg6WzBjpZDfdew1H62qjmGTN+xHuwYAryZXS/IoVsBYC7GyZj7nfOuiSNNqFC6k9RFsTkzcX/JtaLNIt/izVpRmgy8sCrpfC96afZVxRzrzOumg9bJSY4wYp0Nnbo77QuMBq/Qs2ILT9v4S9gIYryYZ++QOj9sA4bT3Na5H74SCKND0CgnlI2CH6fhzZDKUDfgYKKp7bxKAE5xwDRTlehg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(36756003)(2616005)(71200400001)(6512007)(31696002)(4326008)(31686004)(2906002)(6486002)(508600001)(5660300002)(83380400001)(26005)(8936002)(186003)(316002)(54906003)(122000001)(6506007)(8676002)(38100700002)(110136005)(91956017)(82960400001)(66476007)(64756008)(38070700005)(66946007)(66556008)(66446008)(53546011)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzR0c1lVZUtBRTl0bEhNVkF2MTUwWWttZ1BiRHRvSGVzSGRsT1Z2N0lrWitp?=
 =?utf-8?B?Q01vem1ZR2Z3cE1CUUkzMXdCdTdvS0tVc0VmWTZwYTBEQmd4Q0lmMmF6Wk9C?=
 =?utf-8?B?YTlKbEhpbzc1SDNUSEw5ZmJsbmdndEZoSGdyOWY0cXJybXBrM25Cc09EbTVC?=
 =?utf-8?B?NlpNcFJkSWpITXlzUkZKTUJSUnNiTmFNOGprQ2pFaWtpeEE1Y0l4V1J6dnJG?=
 =?utf-8?B?QlE0MENOVVBReDErTjA2UmVZaVhaVUw4NGIyWHR6a2M3aHhwUjYvMnVqZERm?=
 =?utf-8?B?OGJ3bllaS2N4Z0t2V29JYmpRaXB2bWU1KzhtMEw0WjdLVjBmZk5wdUZjbWpI?=
 =?utf-8?B?dWdtbFMwQ1E1YkJSOVg2N0NPY282RW0wbXVOd3phQlZhOVVqVTlJY1MxQlVJ?=
 =?utf-8?B?NHpIUkJtYnF1RHJXQWh2a3drYzFuS3ZLYm5WRkU5UmVYYTFsMkU4VnY3N24z?=
 =?utf-8?B?RVBjODRRaGpoU3YrYzVJOE1BQ3VEV1VweC9UWHpNNTJHNCtVc2NLUVdTVi9I?=
 =?utf-8?B?R092Ylo5V0ZHbHpiUTdMemRlaE9FeG82RVdVTURNM2pzYXA3aFNiNFY1L0hx?=
 =?utf-8?B?djVFVzlvWmg3VXB3OWFaazhINkRtQ2hEcEVjU2o5ZE1zNmorNU1aYTk1K2Rz?=
 =?utf-8?B?cFIrZThzOFg0SnU2c0J5akU1RWk1M01LeGZHK25jZm1lUmd4TXc2OG1NNC84?=
 =?utf-8?B?bG5TVVA1ekRtWSsvVU1JcXl1dzdLRXhGcytFQkpBVFg3RFE0TGlROWVoVDJW?=
 =?utf-8?B?NGVacmllUDN1OVBzTHpIZW51am1WNXBzSXkwK2tnVTJrazlsQzU0N2pHRzdE?=
 =?utf-8?B?eGpoam4rQkJHTlVkZi9BN21VclhRZFJpQWxMOFdtcFR5NWhGbFpIdUtuQmRO?=
 =?utf-8?B?aE5WS3g3c0tNbkV1M09CVlZMUmFQZGRRRlVVMlRNY292Uk9lZ1BzWGNvYlJO?=
 =?utf-8?B?Y2lOcjkvN3lYUlVPckFtT2lpb3Q4RDUzc3BMaGFjRnBIVStHMmc3cEFwQUJw?=
 =?utf-8?B?RHZ5UWR0WmxMM3VXSjA5dkl6SzdnOXFmUGNoYWRocERDd2hTNjBFcFhBT1Mz?=
 =?utf-8?B?ZERSQm94UjdlbWcxTWUxVENKTVZwR3I5VGdnWjBVZTZQRW4vdXNhdHRyRlRo?=
 =?utf-8?B?Vm5vRjFyaU1ZMGxiMlR3azErY2V5a0J1aFRYMmdkUVlmTHJKcEZGUjhrcjJC?=
 =?utf-8?B?ZE9pMFhOK2E1T0hMOUczRkttZHFCVzllVnY5Q1dXZUxOK05Jc3A4OTR2bStm?=
 =?utf-8?B?TUxqNlJZdWNCRXZHaEJORWU0a25FR1BoL0NSSHBwNUY5QWxkUk1HcjlXcHF3?=
 =?utf-8?B?NW1hZEZ2RS9HK092SHo0YlhOdTFXUmkxZTNNMUs5R2RRcXZZMnhYaUJYWEQx?=
 =?utf-8?B?N0FBcWpBdzI1Nnc1dGtTOTBlV3IzOU9HblZZUWJ0VDlTWU8xcjBBWmg0ME9D?=
 =?utf-8?B?ZFpKU2txZy9tRWxmYnlSUDZ6VmZTUld6TGJnWnFuMml3MGxRRHhwT0xqMGJX?=
 =?utf-8?B?eFVvUEhYVW1abUp1Z0hCdmZmWEVyOEUrZUNxNkFDcFp6Z0FkM04yL3Q2SXRE?=
 =?utf-8?B?MlU0Mkx1MGNudkswUnA2SjJUcm92ZEhVeVRZN0RxcmRaQ3ltT0Z1WStXYkFF?=
 =?utf-8?B?Yjk0OTd3SkNVOHAyZmsxODJwdWFrZzVPazBlVzgrdElDRHQxamxTVWtNVW10?=
 =?utf-8?B?eGRwQlNwKysyUXUvUWFCSEk5OGtWb0pYdmtDclJObVl5Mi95NmdRT1AxVDhw?=
 =?utf-8?B?dmdXRHBxREhYR2NYTlNEWEpEMzNLRnp6aysxWnBnbDExbWR4S1lRMmtJMEhv?=
 =?utf-8?B?Mk1ZcXJ6amZyTU03anJpcGlwKzA0UTBTcWEwN1dVZUpVM0plY1ZoZVVXLzVx?=
 =?utf-8?B?V0pXWld0VmF1MTBvY0RIWkFKYzBvR0dGbHNlSzE5dHNPbitaZk96dGxJT1Ax?=
 =?utf-8?B?cHpYMVAwZFRMbUtlMmhXUFJaQTA1V2xqWVVhNUtaUWVGOW9LQWErdlhjVGJV?=
 =?utf-8?B?VnZDRmo4MFpSVGw1eDdJSHorZ2czRHRJMFE2L282QzJ6M1NvMERCUjdNY0NH?=
 =?utf-8?B?S2RmMk8yZ0J2b0s1VGprZHJmN1A5NnNkWE5pcWpjSmoySExCWENSejVrR25S?=
 =?utf-8?B?SmQ0TDRMZCt0ZTg5UG9QaHRMS1gyU0kzYlBjM0VKVXROREs4WmJjRDROS1Nv?=
 =?utf-8?B?L3Izb0FUR0ZTU2hLNFU2aTV3eFZFdHB0QndOMHZFYkFZckN5Nk82Mi9VdEd3?=
 =?utf-8?B?ZS9VQTc0SlpaOVMydmVvbDdnWXZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FA05D7961391E40BE4D827D9A6940E7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b408463-e6a1-4d49-3a9f-08d9fc652214
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 15:55:54.2033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNJXyqCR5Q7gRET4OW8nDmfiz6/eSP7drB2DTj367GPnTGdMYVsKc3KdxfMgulP2RtePwp2k0P1dQPOoEpxGI+rUlfg2X2KDyg2BfEhLJjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2250
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxNTo0MSwgRG9lYmVsLCBCam9lcm4gd3JvdGU6DQo+IE9uIDAyLjAzLjIy
IDE1OjI3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9y
aWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvDQo+PiBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBz
ZW5kZXINCj4+IGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pg0KPj4NCj4+DQo+PiBE
byBub3QgYXR0ZW1wdCB0byBtb2RpZnkgdGhlIGJ1aWxkIHN5c3RlbSBpZiBDRkxBR1MgYXJlIG5v
dCBzZXQgaW4NCj4+IFJ1bGVzLm1rLCBhbmQgaW5zdGVhZCByZWx5IG9uIENPTkZJR19MSVZFUEFU
Q0ggYWxyZWFkeSBzZXR0aW5nDQo+PiAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucy4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4N
Cj4+IC0tLQ0KPj4gVGhpcyBkZXBlbmRzIG9uIGdldHRpbmcgdGhlIHBhdGNoIHRvIGFkZCAtZntm
dW5jdGlvbixkYXRhfS1zZWN0aW9ucw0KPj4gd2hlbiB1c2luZyBDT05GSUdfTElWRVBBVENIIGFj
Y2VwdGVkLg0KPj4gLS0tDQo+PiDCoCBsaXZlcGF0Y2gtYnVpbGQgfCAyMiArKysrKysrKysrKysr
Ky0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbGl2ZXBhdGNoLWJ1aWxkIGIvbGl2ZXBhdGNo
LWJ1aWxkDQo+PiBpbmRleCAzOGE5MmJlLi42NTZjZGFjIDEwMDc1NQ0KPj4gLS0tIGEvbGl2ZXBh
dGNoLWJ1aWxkDQo+PiArKysgYi9saXZlcGF0Y2gtYnVpbGQNCj4+IEBAIC05OCwxNCArOTgsMjAg
QEAgZnVuY3Rpb24gYnVpbGRfc3BlY2lhbCgpDQo+Pg0KPj4gwqDCoMKgwqDCoCAjIEJ1aWxkIHdp
dGggc3BlY2lhbCBHQ0MgZmxhZ3MNCj4+IMKgwqDCoMKgwqAgY2QgIiR7U1JDRElSfS94ZW4iIHx8
IGRpZQ0KPj4gLcKgwqDCoCBzZWQgLWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYy9DRkxBR1MgKz0g
LW5vc3RkaW5jDQo+PiAtZmZ1bmN0aW9uLXNlY3Rpb25zIC1mZGF0YS1zZWN0aW9ucy8nIFJ1bGVz
Lm1rDQo+PiAtwqDCoMKgIGNwIC1wIGFyY2gveDg2L01ha2VmaWxlIGFyY2gveDg2L01ha2VmaWxl
LmJhaw0KPj4gLcKgwqDCoCBzZWQgLWkNCj4+ICdzLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgyMDAw
MDAvLS1zZWN0aW9uLWFsaWdubWVudD0weDEwMDAvJw0KPj4gYXJjaC94ODYvTWFrZWZpbGUNCj4+
IC3CoMKgwqAgIyBSZXN0b3JlIHRpbWVzdGFtcHMgdG8gcHJldmVudCBzcHVyaW91cyByZWJ1aWxk
aW5nDQo+PiAtwqDCoMKgIHRvdWNoIC0tcmVmZXJlbmNlPWFyY2gveDg2L01ha2VmaWxlLmJhayBh
cmNoL3g4Ni9NYWtlZmlsZQ0KPj4gLcKgwqDCoCBtYWtlICItaiRDUFVTIiAkWEVOX0RFQlVHICY+
DQo+PiAiJHtPVVRQVVR9L2J1aWxkXyR7bmFtZX1fY29tcGlsZS5sb2ciIHx8IGRpZQ0KPj4gLcKg
wqDCoCBzZWQgLWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYyAtZmZ1bmN0aW9uLXNlY3Rpb25zDQo+
PiAtZmRhdGEtc2VjdGlvbnMvQ0ZMQUdTICs9IC1ub3N0ZGluYy8nIFJ1bGVzLm1rDQo+PiAtwqDC
oMKgIG12IC1mIGFyY2gveDg2L01ha2VmaWxlLmJhayBhcmNoL3g4Ni9NYWtlZmlsZQ0KPj4gK8Kg
wqDCoCBpZiBncmVwIC1xICdub3N0ZGluYycgUnVsZXMubWs7IHRoZW4NCj4NCj4gVGhpcyBtZWFu
cyB3ZSBhcmUgc3RpbGwgYnJlYWtpbmcgbGl2ZXBhdGNoIGJ1aWxkcyBmb3IgYWxsIFhlbiB2ZXJz
aW9ucw0KPiBiZXR3ZWVuIHlvdXIgcmVjZW50IHBhdGNoIGFuZCB0aGUgb3JpZ2luYWwgcGF0Y2gg
dGhhdCBtb3ZlZCBDRkxBR1MgdG8NCj4geGVuL01ha2VmaWxlIChjb21taXQgMjc0MGQ5NmVmZGQz
MDA5ZjhhZGI0MGFhY2RiY2YwNWNmZThkMWJiYiwgRnJpIEFwcg0KPiAyNCAxNDo1NzoxMCAyMDIw
ICswMjAwKS4NCj4NCj4gSXMgdGhpcyBhY2NlcHRhYmxlPyAoSSBtZWFuLCBubyBvbmUgc2VlbXMg
dG8gaGF2ZSBub3RpY2VkLi4uKQ0KDQpTbyB5ZWFoIC0gbm90IHB1dHRpbmcgdGhpcyBpbnRvIE9T
U1Rlc3QgaGFzIGhhZCBleGFjdGx5IHRoZSBmb3JzZWVuIG91dGNvbWUuDQoNClRoZSBzdGVwcyBu
b3cgYXJlIHRvIHVuYnJlYWsgaXQgYnkgd2hhdGV2ZXIgbWVhbnMgYXJlIG5lY2Vzc2FyeSwgdGhl
bg0KZ2V0IENJIGluIHBsYWNlIHNvIHdlIGNhbid0IHJlZ3Jlc3MgaXQgYWdhaW4uDQoNClRoZSB0
aXAgb2YgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzIHNob3VsZCB3b3JrIHdpdGggYWxsIHZlcnNpb25z
IG9mIFhlbi7CoA0KSWYgdGhpcyBtZWFucyB3ZSBuZWVkIHRvIGJhY2twb3J0IGZpeGVzIGludG8g
dGhlIHN0YWdpbmctKiBicmFuY2hlcywNCnRoZW4gc28gYmUgaXQuDQoNClRoZSBkb3duc3RyZWFt
IHVzZXJzIG9mIGxpdmVwYXRjaGluZyBoYXZlIHBhdGNocXVldWVzIGFueXdheSwgYW5kIHRoZXNl
DQpicmVha2FnZXMgYXJlIG5vdCB0aGUga2luZCBvZiB0aGluZyB3aGljaCBjb3VsZCBzbGlwIHRo
b3VnaCBldmVuIGEgdG9rZW4NCnRlc3RpbmcgYXR0ZW1wdC4NCg0KQXMgZmFyIGFzIHRoaXMgaXNz
dWUgZ29lcywgSSBzdWdnZXN0IHRoYXQgd2UgZG8gd2hhdCB3ZSBjYW4gdG8gYXZvaWQNCmxpdmVw
YXRjaC1idWlsZC10b29scyBuZWVkaW5nIHRvIGRvIHN1cmdlcnkgbGlrZSB0aGF0IG9uIHRoZSBi
dWlsZA0Kc3lzdGVtLCB0aGVuIGJhY2twb3J0IGl0IGV2ZXJ5d2hlcmUuwqAgVGhlIGFib3ZlIGlz
IHRoZSBraW5kIG9mIGZyYWdpbGl0eQ0Kd2hpY2ggcmVhbGx5IHNob3VsZG4ndCBleGlzdCA6LS8N
Cg0KfkFuZHJldw0K

