Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C2348C27
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101319.193693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLvM-00067Y-4D; Thu, 25 Mar 2021 09:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101319.193693; Thu, 25 Mar 2021 09:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLvM-000679-0l; Thu, 25 Mar 2021 09:05:04 +0000
Received: by outflank-mailman (input) for mailman id 101319;
 Thu, 25 Mar 2021 09:05:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXFl=IX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lPLvK-000674-U7
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:05:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab5551d2-da80-4b4c-a539-c0009867a0db;
 Thu, 25 Mar 2021 09:05:01 +0000 (UTC)
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
X-Inumbo-ID: ab5551d2-da80-4b4c-a539-c0009867a0db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616663101;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BxILtFVAFYqFLUO+ZUtbAacCYZULn4s7jJwSLI0/ogE=;
  b=RgOi99IEQS7Y0RIFjw7HDaDTzWOJ079CNyenm3L5CVGwIV0qW9y3yCF+
   nMcA6nOG3TRV9LycESzP8KNMwZNhM7qQv5AT7hBg/GVazzvfHEm70H3pW
   7gp+VTK5jdZfP8O1KY7Kz+W4YPNLvezpumZ14E4zHcyabr4do/A7tOho7
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o1KAk7uCs/AqqLdqZNUONwRp8MYvm7L09n/fY87w5TZ7q2X6bIJvGs5OUudU5zfRjVEMWncu7f
 y9piKaQK3F9dIIZtFD2Hq9dn7WVf4pRynUdMfFTEMoHtdycI23rAHkGyyLswPcekBRTW42sEW7
 NHblFRRUTTZNVkTa1dDgoN5Wnq2fxcmuyqevRHuXw2eV6sEXbk47fSqx/wfvKAa1L5o3AqOepI
 C3uDyee8+WLj7YrnDP1nzI99HQrw14OZ7TH3YVMmkc4u+Oo78xjBDb8C2lP7+JSc27Avx6zw/a
 Zjo=
X-SBRS: 5.2
X-MesageID: 41540844
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Eb0XH6B5oFN3IQ7lHejRtceALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZB1J3lNu/xQG+HcopztXvytHVuc715R5WPGVXQotn6Bp0DRveMmAefngGObMSEp
 2A6s1b4x+pfnoKZsq2b0N1INTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lInNy6J0l9n
 XIlBG827W7v5iAu1Hh/kLwz7ATotvuzdNfGNeB4/J1FhzAghulDb4RI4GqkysypIiUmTQXuf
 nK5ywtJsFir07WF1vF3CfF/ynF/HIQ52T5yVme6EGT4vDRYD4hEcJOicZ4X3LimjEdlepx2q
 5KwG6V3qA/ZXir8USNhOTgbB1kmlG5pnAvi4co/gZieLATdaNLqsgn9F5Vea1wQR7S0pwtE+
 VlEajnlZFrWG6adHzQsy1Ox9GhTx0Ib267a3UCocCc3nxqmml4xSIjtaoit0oHnahNLqVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBEB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT5YR3djuVlo7RpsLz1Q7TmdQeZTko1rsemq/IDRurWRu
 i0I5ATJ/P4N2PhFcJo0mTFKt1vAEhbdPdQlscwWlqIrM6OAJbtrPbnfPHaI6eoHi0jXm/5H3
 sfTDn+LMhN9SmQKznFqSmUf0moVl30/Jp2HqSf1fMU0pIxOopFtRVQiVnR3LDTFRRy9ogNOG
 duKrLula224UOs+3zT0mlvMh1BSkJc4LDqVWJWtRYHWnmEKYoripG6QyR/zXGHLhhwQ4f9Cw
 hEvWl6/qqxMtiX3iAtC9WuN2qAlHsNrHeWT5MR85fzovvNS9cdNNILSaZxHQLEG1heggBxsl
 pObwcCWwvCDD/0kL6ki5YVHenbcNF5jG6QUJVpgEOakX/ZidAkR3MdUTLrbNWehhw2QSFIwn
 dr9bUEvbaGkTGzCGc2jegiKmdQYGCPDL8uNnXeWKxk3pTQPCB5VyOjmCGTgRBbQBuVy2wiwk
 jaaRCyVd6OKFxHoXxc2rvt6zpPBxSgVnM1TGt7v417HXnBoVBp34awF/aO+mOMd1oPxfwcOj
 nZYT0UZhhj3cyzyQT9okfwKVw2gpopJeDTF7IlbvXa3W6sMpSBkeUcE+ZT54sNDqGjjsYbFe
 aWewqYN1rDepMU8h3QonYuIy9vrnY41fvuxR3+9WC9tURPS8b6MRBjR7sBJcub4HWhT/GU0I
 9hhdZwueerKG3+ZpqHzq7QBgQzZy/7sCqzT+syr4pTsr93vLxvH4PDWT+NzWpZxnwFXY7JvV
 JbRL4+7KHKO4dpccBXcyVF/kAxnNDKKEcwqAT5DuI3YFlFtQ6VA/qZp77T7bY/CEyIowX9fU
 OS9CBQ5P/JVSqO37xyMdN6HU1GLEwnrHhy9uKLcIPdTBiwf+ZY5VygLzuzdqReRKXtI8Rnkj
 9qp9WT2+mZeCrz1FqO4X91IqdS/32mRs33CgSWAuJM+8G7P1PJgqbC2r/GsB7nDT+gL0Ifjs
 lZcEZVaMJJgDwrlpc23Si/UbafmDNsr3JOpTV80kfw0Y2n6nrBFU5IMQfFkoxbNAMjR0SgnI
 DA66yEz3zz7zhOxInbGEpRdt9IHcIMToKfFVYYFeEA+Liy/6QuhSxfYBAhS24k4QqNrd9b4Q
 ==
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="41540844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0TdoZaFhwf3qAVBSch5O/1IacmNFUqcwKU4t6FMYNXlWmtOiuK6ICqsT+7iTH5ZhNy9lJm9OKCskCfH8GcMSoEw682c1wFDZV9pglpWiS8As8ftYZurvlVYJv99FCGRwcUDlHY0dNWhSrLK4ECS2VMiemEUuTPdhM7xU8gtM1RwLWVWWjS0J2sINOltrjlEioRSZY8QE+SDA1SvXtf6K+wMzyb9GwHWadl6AXKE24WMRpKP2Fj2G0JNiUrTpPSDkp5uOLlOOJB/NB9elS6U7p8T35Civ5KRi9Izgc4vG7VM+JkmFGJ92YhhPmzrOchdh7NBsBRo7cc0ncGXEfKA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxILtFVAFYqFLUO+ZUtbAacCYZULn4s7jJwSLI0/ogE=;
 b=BTZNBQefvXOZqzYIBXE2kOxEWczoK5bND1lRrHjUfxlcAOgNETFfO4UGNgT/KzEoKBR1i1+T1agin8CiYm6SrjnzyAzQnG5ZxLbpvRUrJ4kZxjwXjV2BQCe4nEZ9iE2UuGGyYrHsCtOaYCi32ztxj6UiF2tP3gS63f79uzq4zUPudwIR1Oeq0McGpUlFp5kjS0l9etmlAzFI+9g8OIzhu7gxGi2nwTQKksVK3p8jPEGmgYLUmjncynHOnCUUeaO5mqYeXtc5jlenxvh7t6SpBdvqBt+Ux93FCTrjLcYlNOLOV2hpFPXLSdpz+Uc9G3OggnqnJAlDn+GzrfbAL9kRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxILtFVAFYqFLUO+ZUtbAacCYZULn4s7jJwSLI0/ogE=;
 b=wugTdDnFe3RNrF2IuQqLer9orKpzk2HCcR36MkaKlzjpgB9KPPbzxYqq9PhKaJ+vZq7AeRuq8TWFFlh3nfa7Qtv6O+drd/slYHTps/Il384+C+Yav3FH+sHPvShXZv57ag3rQS3wv/eLfS7YmKnMnVfu0pIYvj+mdhaBb8C3grs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
Thread-Topic: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
Thread-Index: AQHXIMzvj/osZBndl0iN655u2tDs9qqUV1aAgAAS04A=
Date: Thu, 25 Mar 2021 09:04:37 +0000
Message-ID: <0A187740-DB6E-486C-8B10-5207CE6A5D72@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
 <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
In-Reply-To: <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c27f9fa1-2d52-4b35-bc74-08d8ef6d0476
x-ms-traffictypediagnostic: PH0PR03MB5879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB58798DD19566E7BA0614F99A99629@PH0PR03MB5879.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +3S5loMCf0yyJIEkGN+jwKx3H6vtRqPtJZERT/nVudYOQ3cKVMO1RUlYo6RdIQsnNA7hYJbQ0R1/+ojQG8FG4LuOjTvjZwA8HDCbLCu5RXv44jLdyIdx0iSh9tv9AGsOxRQY+P7Cguf6KDMG+T2R9uYnapGstrA0CZZzj1IgfXA2cKChFYYccaQ0OOD+7zFIF8KZXtv5V5ndTUiQNgEoKBHePuyUpVBlcGBZ/4nSBN+WNSzk3U+pfqPpgE812Ui9UZb1ZRjQe8/0JTFOAQX/5iuvY+PuCdZtpt+83aZiHLcsTb3xmRdBZuu4/n7mpy+4Af/8PAunFqFigrHAZZx80TMz9URfOFvtPl+Oolf3nZOzydhPHd1Khi8vRuGwfadKqfSfpAsTpYiKXYy3ixkEBhWRi1ZifbPIOtsySt1zdw5DMZBAU8JGfyxKHU/5mYwGepZ2sOEC+jSYXTStvi6AUcU6B/bu5f/l+vB8vJGmZJRxYCZst90RFx0KjKVpMQtOuONEtaQPoQl/oxdfMkD+rbSHgFX3U1ror5jXP0ZXD0PJfyDjT2iC9Gur0uh+EX1EMXTAheVz0wZBH5ojkawkkI1Z0YhZoaFLVFCH5YQvTg8lHhzEfJAgvlR4JuEHc3ShVKZkghduGcPjzcBYAIFFDLsEuHK4M3tn0yC1FWk9pywwgr7xLF61Jg1eXDaQdtqZ1qkGODIZK5WIbtI9ulWek/a+EMjt2dwhE4inrkR6+ym2v+vxhpTTjy+OZpY1lmN44tJ2UHtAHQQOcPzDndzgd3HDGvtSJ6nvYyt3CYvU6DmRwbmmPmoIPicrzky4IxaT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(4326008)(91956017)(6916009)(6506007)(6512007)(66446008)(5660300002)(33656002)(53546011)(86362001)(38100700001)(478600001)(76116006)(66476007)(66556008)(64756008)(66946007)(8936002)(8676002)(71200400001)(26005)(2616005)(2906002)(316002)(186003)(54906003)(36756003)(6486002)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?b1Ayc3ZhR3hVTTVab3JjcEZXL3k2djdXZGt6REo4UzhkRXE4eG1zVXV4QWpZ?=
 =?utf-8?B?UTFFOVNuVnlHWXY2VzM5WDlmbDgvSFpkRVFteE83ejl0ajZ5QnF1Q1dEZzly?=
 =?utf-8?B?c25EVGFhYVhzTGdnRkRRLyt0anF4ekNTUWFoVXBYNWo0dS85L0FzTmwwQytW?=
 =?utf-8?B?TUMySHRYZVB2aUZhL0JnK2g2YzMzb2xaellEaVRQd1l0Y1VueGlCVW9wYjVw?=
 =?utf-8?B?M0ZIamtOTmZxemwrbjFNQjBTZURLRVRzVzRVSitCQjNNTHo4RGx5NE5CZnkz?=
 =?utf-8?B?TkM1VmRnYXpMV00yU1RUdnhBNGw4eGNJYldVWEdaSndBNUs3M2dFSXhSWUdZ?=
 =?utf-8?B?NDhBUTVZZm9TS3kvUVFNVzJ4VUdCQUxHMHY1NHFzbktYVWV0dDJEcUdRK0M1?=
 =?utf-8?B?ZmNWcmhaWndLeHJuYVdBOWxNeEJEdFpQamgyaDdmM29zL3lwVU5yV29GWFZH?=
 =?utf-8?B?NkxlcStEYzlybDk5WHNmRkIyZGtYSDU4SjF5c2RjSGpiRmpVRGdHdlpBMmhG?=
 =?utf-8?B?WHkrOHBlUGpvL2E5emR2YmhaaUtueEVBcURUZ3pJWGVUS3RGL0QxUjRQZHYz?=
 =?utf-8?B?S21vOVBkQmZjTXdicXlEcWE4TnBsSW95aytBYnVzRkg2RUZ0TVNsL2MwUXhF?=
 =?utf-8?B?VHVoc1YzZ2RNd3FmczRlK2lHYTNkMFptcUtjZzd5eFFueDBublBOMWVvRUxX?=
 =?utf-8?B?UWZrQUx2QlhvMlpMZDZZakNyVkROS3JpbUpQN2pDaFBGZWF4TFRlMW5VUkhE?=
 =?utf-8?B?R0NWTTc5a2d0MmExSnhiRXdlOXBvR2hzdVVXM0lxMTVZWUw1SzB3UkdrK052?=
 =?utf-8?B?ajUwaTFpc0pYTWdhd25qQlplcEpMQmZxUlhqZC80UGV1V2RweHZtNitQWjF2?=
 =?utf-8?B?RU1qc05QK1NJa0Vac2c2SjArWTJ6OVZ2UTByUWJ0RnZ3RkJ3ZXpRL285Q0cy?=
 =?utf-8?B?c1E3R0RmRVVoa0R2c2xxV1N6QmFyblJNelVXRndWN2dxTWtPWEFBck1VRlFj?=
 =?utf-8?B?Y2FsYVV6Sm1Ma1EyMkhabkx4M25vaWppSEM1TUZkNldXN2RoRFFhZW1QSytD?=
 =?utf-8?B?elhicWxwdkNHajVGMFU5Ymx5VlNKTVlhNEpaRko3V1BzdVVOcWN3NDcyQzZ0?=
 =?utf-8?B?d0ljU20rWWJPeWdSM3hvMTRLZ1NhSGkxczRJREJyc2FJRXZDY0dIRXRCNE0x?=
 =?utf-8?B?VnlMUFJLbFJpNzNpcmJIQ3RJKyszcjMvai9DODg2V3IyYkdTNmYxaFlic0Jh?=
 =?utf-8?B?V1hpL21oV2dPazN0bW16cFcxeWp4N24zY0thQkN4QnI1T21aUVU1SElCTCtu?=
 =?utf-8?B?WVZlVGlqeVRMOHhYdlpKVm1la2JYZUtKS2dJVGVPR1VjVWFrdW9hTm1yMUtk?=
 =?utf-8?B?MHBBYVFOS2xIZmxOU05hQzNUVzFMb2NRWENycFpydGFPSkQvUW1UNDdYVm9s?=
 =?utf-8?B?YXJkVWZRZm52dWFYc2pFbUJwSFVoWVNUYzRhZWFrWk9wOFl4NThtbEZjbGF2?=
 =?utf-8?B?ajRabE93cTkxKzJpeXR3YWk4amoyc1pSd1YrT3hZYUc2bUtRS3pKb2RTVDFD?=
 =?utf-8?B?SFI2RWpBMUhjMEI2VEliL3lRTHh4djlCUWhscXhMZWRXNjZpUStrK0Jacmhs?=
 =?utf-8?B?Zlg3RDQ3UnhjN2hrWklVM1pCWUkwOW90U1dOa21jdG5lQmd5YWVGTWx2Rk5O?=
 =?utf-8?B?aU9vTkJJcmNBQUhwd2s1T3ArVCtyeDRYNFEwZjExejF6L09MMWRQazRQdE9B?=
 =?utf-8?B?UmxjL2pNeU5qZnkrbkRyNDhyREY0QnIvSjBtSUgvbzZJckxLVFRXT1RDb0Yw?=
 =?utf-8?B?RzVPcFowaUhhd0hmZkxZUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63652B1B5CA08D40BC387F0A52B438BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27f9fa1-2d52-4b35-bc74-08d8ef6d0476
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:04:37.7333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tV5HSbTzL6qCP2nDpN1Iecln9mZ4RKJj+Viyl+D20eqBjJ6Xol72A9ZxKpW05einaDGAFGZX/MNkLDwTqKfZDGuRd9GKvBAwhsh2KaR5cs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5879
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDI1LCAyMDIxLCBhdCA3OjU3IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDMuMjAyMSAxNzo0NCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IC0tLSBhL0NIQU5HRUxPRy5tZA0KPj4gKysrIGIvQ0hBTkdFTE9HLm1kDQo+
PiBAQCAtMTQsNiArMTQsOCBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdl
bG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8pDQo+PiAgLSBOYW1lZCBQ
Q0kgZGV2aWNlcyBmb3IgeGwvbGlieGwNCj4+ICAtIFN1cHBvcnQgZm9yIHpzdGQtY29tcHJlc3Nl
ZCBkb20wIGtlcm5lbHMNCj4+ICAtIExpYnJhcnkgaW1wcm92ZW1lbnRzIGZyb20gTmV0QlNEIHBv
cnRzIHVwc3RyZWFtZWQNCj4+ICsgLSB4ODZfZW11bGF0ZTogU3VwcG9ydCBBVlgtVk5OSSBpbnN0
cnVjdGlvbnMNCj4+ICsgLSB4ODZfZW11bGF0ZTogRXhwYW5kZWQgdGVzdGluZyBmb3Igc2V2ZXJh
bCBpbnN0cnVjdGlvbiBjbGFzc2VzDQo+IA0KPiBUQkggYm90aCBzZWVtIHRvbyBtaW5vciB0byBt
ZSB0byBiZSBtZW50aW9uZWQgaGVyZS4gSWYgSSB3YXMgdG8gcGljaw0KPiBqdXN0IG9uZSwgSSdk
IGtlZXAgdGhlIGZvcm1lciBhbmQgZHJvcCB0aGUgbGF0dGVyLg0KDQpJdOKAmXMgYWx3YXlzIHF1
aXRlIGRpZmZpY3VsdCBpbiB0aGVzZSByZWxlYXNlcyB0byBoZWxwIGV4cHJlc3MgdG8gcGVvcGxl
IGV4YWN0bHkgd2hhdOKAmXMgaGFwcGVuZWQuICBXZeKAmXZlIGdvdCBvdmVyIDEwMDAgY2hhbmdl
c2V0cyDigJQgd2hhdCBoYXZlIHdlIGJlZW4gZG9pbmc/ICBJZiBteSBzdGFyIGNoYXJ0IGlzIGNv
cnJlY3QsIHRoZSBsYXR0ZXIgcmVwcmVzZW50cyBuZWFybHkgMTcwMCBleHRyYSBsaW5lcyBvZiBj
b2RlcyBpbiB0b29scy90ZXN0cy94ODZfZW11bGF0b3IvcHJlZGljYXRlcy5jLiAgSXTigJlzIGFj
dHVhbGx5IGEgcmVhc29uYWJsZSBjaHVuayBvZiBjb2RlIGNodXJuLCB3aGljaCBJIHRoaW5rIGlz
IHdvcnRoIGhpZ2hsaWdodGluZy4NCg0KUmUgdGhlIGZvcm1lciwgSSB0aGluayBsZXR0aW5nIHNv
bWVvbmUga25vdyB0aGF0IGEgbmV3IGluc3RydWN0aW9uIGlzIGVtdWxhdGVkIGlzIHdvcnRod2hp
bGUuDQoNCklhbiBpcyB0aGUgbWFpbnRhaW5lciwgc28gdWx0aW1hdGVseSBJIHRoaW5rIGl04oCZ
cyBoaXMgY2FsbD8NCg0KIC1HZW9yZ2U=

