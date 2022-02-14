Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8A4B59E9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 19:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272592.467493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJg73-0002QB-8k; Mon, 14 Feb 2022 18:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272592.467493; Mon, 14 Feb 2022 18:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJg73-0002Nx-46; Mon, 14 Feb 2022 18:30:13 +0000
Received: by outflank-mailman (input) for mailman id 272592;
 Mon, 14 Feb 2022 18:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJg71-0002No-Or
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 18:30:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22b9b7ee-8dc4-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 19:30:09 +0100 (CET)
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
X-Inumbo-ID: 22b9b7ee-8dc4-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644863409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YPnGa282D4mKyNWlBkK6JjxN5uCYIvCYfYALP0WFong=;
  b=BvBcB0KVbwTxRYoQINFuT6Y1cO5hOq/e98L0CoGWq68FFfl8hygoD9uB
   Wnlu+VsxrQ5QdGzdSArptpglHWZ6IOWVPSUt2r/OdZw6VmB2B1hoSzMsy
   GTxqbkcGM2ihvzNMDj9R+1DcpRIhJb7/wNAO2LHMSNd/5lnWb10hXIz2Z
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cR/SG5TTGVBnjhNKlyM0VJjOAuOYiU7RVN+sDRV7EfpHY8XyUihdy1jaLtYbjeEplDWDCfI2/N
 bYsoe8e6zhIOYo7LYpJI6PVaMiWkbIaUHtsG3ZVcN3kynpNX2Df6uHcKaUEHilt2/zMbiXss41
 rsH247g5Q+7KMx9LqEE5nFF4kgSho1laGfSPW9jXUUUGGx7QVcMGgQTqK94TqjSas781Po2ycl
 68uNSusYsI+hSHHoalBAHiXYW7P2UAHvIa+ZWLF7KNRsSamx991kmec6+6QGwaxNiXv9bHFks7
 TaKs3AXtCEVBh+OOIJ9hk4ZX
X-SBRS: 5.1
X-MesageID: 64586811
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5TIALqzPp4scsGmIoud6t+edwSrEfRIJ4+MujC+fZmUNrF6WrkUEy
 jYbCGGFPq3fYDSkctsiOdm3pk5Uv8eBzYdiSwZu+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt49P+
 PNWt4LpcwMGDpfBssIGah1xQz4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwTTaiOP
 pNxhTxHd0vtYkB9I1QrCswmn8yupUbBdzFcgQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKH73ati+nnjS79HoUIG9WQyPluh1GCw30JPzcfX1C7vPqRh1a3XpRUL
 El80jUqhbg/8gqsVNaVdze1umKetxgQHf9ZCfQn6Rqlw7DRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuQEyUIKW4JZQcfUBAIpdLkpekOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s70vA78b654wn9hx2cnJXjaBUM4iyHQTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9T7wJtdiON7Kih6SdkyfdoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHximjODGM2jlk/9uVZ7WJJyYe1bWGZik8hjtP/UyOkr2
 4o32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQMHtNv1jFOQTl7Y9eImOtJU9U8w8x9y7eZl
 lngCxQw4Aeu2hX6xfCiNykLhEXHBs0k8xrW/EUEYD6V5pTUSdjzvflPL8NtJdHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHmQlI/foIVni8jcgFC2yuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82f6md1AXe+EcCrzTmTx/Kn+N
 +xZw+ulaK8MnUpQspo6GLFulPps69zqrr5c7wJlAHSUMAj7VuI+eiGLhJAduLdMy7lVvRqNd
 niOotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Oos5JwW5gi4hkZ4O9qKlHkJpWGFL3hGWKQ7rJAKRoTsj1NzmF1FZJXdDA7w4Y2ONIoQYhV7f
 GfMifqQnalYy2rDb2E3RCrE0udqjJgTvAxHkQ0ZLFOTl9uZ3vI60XW9K9jsoti5Gvmf799OB
 w==
IronPort-HdrOrdr: A9a23:d+Rna6veOFlrW6K9CJoHLktv7skC0IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPaftXrdyRSVxeZZnMvfKlzbamPDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3s5xA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJSa
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTgj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDr1L9qqq
 iJn/4TBbU015rjRBDtnfIr4Xi57N8a0Q6k9bZfuwq5nSW2fkNhNyMLv/MmTvKQ0TtQgDg76t
 MW44vRjeslMfuL9h6Nl+TgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wUR4SxbpXW9
 WGNvusrsq+sGnqGEzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0qN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gKcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltBEU33HNfPW2AG4OSUTevqb0oMi65fgKo
 SO0bptcoveEVc=
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="64586811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxZMmZro3wZedzWnztg9gGwMD6Wmy3/rdEJF50aXb6tv6EujOWUxKLznHzmeVyMetl1ZrTCVfEBUIPYdPLbcEm+dUxontgHtsG9fFlUdlvY5oREq/7VaGKnsk8HYXClbAv5RVW40V+miWU0s0oAzLdfKOzkMnlVdP5cHeEuI1oqEWQcj2ZQWzZ35evraJjK2D+++3FFEZcp8YYXbbC2Th2EjB/RBYaObN5MZ+L1uYo0/xvEkCHJ+9eA6lQL5tAjcX3gH9/DHW8Iok6nKnb9mboEkJAdYuDjNMJ3TJ8Iub6J1v5djo04F4PpICD1f65zHYMURLyGXIooqni4F7SJiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPnGa282D4mKyNWlBkK6JjxN5uCYIvCYfYALP0WFong=;
 b=gU8a5se3XB1WEqag94fnug7GoR3oq/jROSPuL1FpTuyfV40I17n3hP1Xm32PrXbFBG2rKV4JxkTVZgMkQaNhHllaQB6NFfEqPR4tmVOQdDVjYdAPtNR+Q/wJKDydoCVIcFnAgy7+BH1gh0hkAPdIXl2R3jVKoFLeSEE0bGD3kcYj3IG8z+FipwEpaa+1ToKjY2PpARsQ6JMw8FIM8aYyOvT/P74aARDOLNxGVE75BDFekq4MjFrKksenGswnEndJy+ZXiWk8agr0VgfL8/WG3KZy6xTdvQbWF+WcCfHX/WfZmUxbddMgFOgOBZvfkdJcDdKaL0YJoabAeUCAkd/v5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPnGa282D4mKyNWlBkK6JjxN5uCYIvCYfYALP0WFong=;
 b=xeJJi4jladeBn1Qjif6pInXqD6P1w+baMzpaWJRiYjUhEBwIljgiCY5lMoHODAxqMUKsNKYjYNrK+Ofwk+atRUv3EYHwOpuLak/57tYHqbpJZTsWQI6Ad0KHfeFnTmVY0OsE/fNC9zosk/snE3O0JFydHRdfgfoojN/E+RRJ1l4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Topic: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Index: AQHYIaGjy/wpq8SdQkKdLl3UHHKbD6yTBisAgABYUoA=
Date: Mon, 14 Feb 2022 18:30:01 +0000
Message-ID: <364d47c4-4436-8111-0019-aa3ab37ffcb2@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
 <71997BED-096C-4168-AF40-D74C616D6A20@arm.com>
In-Reply-To: <71997BED-096C-4168-AF40-D74C616D6A20@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0608f4c-8df8-4a76-af84-08d9efe8038f
x-ms-traffictypediagnostic: BN7PR03MB4561:EE_
x-microsoft-antispam-prvs: <BN7PR03MB4561A21CE0B3D5022030C1DFBA339@BN7PR03MB4561.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +VgJkqnlgPcaotD3/u1huSfEU3rFJuiWdAqL7I8YTXwMrm2or1W9OuzkL4+xrEKga3sjtTvrOGmCV14yAuTY2UGHhro+RR/n+v+7J14sCDe4g4lyDdhC9vBuM7cJ6rtLtVJLBh5E+CVUnzF82Heapp0Kl8a3hshhr2iknG2z0u8Q16LTnYIQz/Kjd4Gr0EBNAX6gfomTHEa93lq4I6ARHeoOlT0yBWcLwsFeaZ9iTzWjnboAQfdajIcoTOuU6KTBnhBR78886STzUyCdSJo7gKVvMpfG8sR+ZWfjn2wAPQuaThnuSCcpMzbUPM/HG9cpGOWBocsLnHL/PLBzyxvqf5yJABq1G4IQwjT1NGrmKI9onMvbuo69UI3NUTWPcUjWM8YSedjX74xjG0K+O0VfPhq+ncMZFrR1I05m03Bu00waxxnYvKUY1HbbMzX61jxZkz7XwWK9RlTddhr1WnRhcF6If31r+yAx4ntRoFsKsRFWdmioJmsyptoo0HdAB8lO23hl9bd7+yuF6dqWNnxcuchkVuzD6yEx1nC5BOjrLSOxxyNbowgVLfeAQQwUzLcOOybVJEY0I0VtTHCwEJ/KbO714TDkRwnGPdYvNBZYVlzaQI6YKp1ImRreqwIuH7Bg4/uoVaKWCaFfyTO4hGKCbsT3gRXqNDXn7RkJFVKlVlqXjggohEyMWisTIiMIZvV3PM/RJPfvZQ/zgNu89HReVU6QA+LHUQMtCbRgKGSsmdLDkAnJxE9pKZgz/xKjOBf+iEWHvFhgfWRaK5wIYdUnFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(53546011)(91956017)(86362001)(31696002)(54906003)(6486002)(2616005)(31686004)(316002)(36756003)(6512007)(508600001)(122000001)(82960400001)(66476007)(2906002)(66446008)(38070700005)(66946007)(6506007)(76116006)(66556008)(71200400001)(64756008)(8936002)(8676002)(4326008)(5660300002)(186003)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWEzeGNBVUwvWjVuQWU2VFd5a3JvNmJFWmYwdFBzNmxWUFljVkk0ektyZUVM?=
 =?utf-8?B?YWdPbUFiQXV1N1c0NCtzek1XOEpDL0NQL2t5bGU1LzRTeXhQUWVVMUNmWUlV?=
 =?utf-8?B?bG0waytyUFRQQWxuNHIxUGFYdGR4ZTVXYlNKSXhVZmUwVFlBTy9veVRXWXJl?=
 =?utf-8?B?aDFpSXN1ak1XaGVZZzVOQ3ZrbHF3b0dJbFVUVXBHNm5KaENjdHJlWWJFcFND?=
 =?utf-8?B?b0RqM0ZWVFBEUDlad291Ym4rVVFnWnd3Z1RWK2tPek9yekJKTERoKy95Y040?=
 =?utf-8?B?b2xaMjNBeTNxNitHcVcxRHdPRHM4dnpzbm0raXBqdmtIRjFHQ2NHcGM0b3Ay?=
 =?utf-8?B?SmVPSGplVmJPbjZxMW5hcWxqNmtkOVZiTVVyUEpOSzdjKzBnOXdwTHRRa2Rt?=
 =?utf-8?B?NnhzMThjMzBmWGQ3Skd2OFNFYVYrREVDWkJ1SnREUm1CWlIvMmVkVDlDZEtW?=
 =?utf-8?B?RHY2OTVHVFcvVERtZDRZS0lmUWF5aVBhekJWdTdnRlFCK05FNWFsbkhseW1U?=
 =?utf-8?B?WDVXWXZjYzMwRnpsNG9oK3UxL1BEeC9CN0ZvUExsTmhpMEx5TlhkaXpwUnJu?=
 =?utf-8?B?RFUyblUzRU9xWFkrT0RvOFVTdFRHYzQweCsyRkRLTHQ2MFZjSkVUTm9HKzZt?=
 =?utf-8?B?UGtpNGJmMGpNSVhZRFBDTEp0b3QrblQyeGdraFVQelZXbjJKMTRPQWJUeWtV?=
 =?utf-8?B?bHlpMW9lRW1WN3JYQXhNeUI5b2xBODJhdkh4R2tIVmFpVVNDOVUxU2psd0xn?=
 =?utf-8?B?QytLTUE2Tm1hWjZqN0NTYjRSb013bUZnT1N6Y0lIMGpPaXIxbkY2ZlhaSkVk?=
 =?utf-8?B?ekhLaGFpNFA0cnRwYTN3VnIyQnBXTlBwWkE4RTJXcjFJcVhXS3lXaXF1c3Y0?=
 =?utf-8?B?U1JhZW9IaGlHMVFkTDlnbGVVMFN1TkxhcmYzVzJnN2E1OWdLTzhWeE85R3E2?=
 =?utf-8?B?ZzhZQUdhZzVwYncrdTV4S1ErMktzZGtmYWV5TmIxWFpidUtwYnRLWFBjMW5Q?=
 =?utf-8?B?NEtSRE04bnpINktjeC9KNHNBdHRKTjhWcTRrdmRNYUlRbXFjb1Z3NjF5bmRl?=
 =?utf-8?B?R1RJZUNWdllSQmw1Y0JjK3d6QlVhU3ZqRUpKOTFkd25HOVB3MndBWFIxOXJU?=
 =?utf-8?B?ZkkzdlV4QmZ3cGg1d0I1L2prSXROaTNQR3lGa29lZlhhVVlhRHZKT2ZaaTkv?=
 =?utf-8?B?VEszYjVDSXhLbjhGUWpSeTVMd0VybEFaV2U4Q2tlN1Y2V2s2ZndoazBlS1BJ?=
 =?utf-8?B?bnZIM25GSzNDeEl6YVJKUERjbmRuYzRtc2w4WUt2U1pSNmora1J5bE4xWi80?=
 =?utf-8?B?U0IzWHNjMDFNNk84QlA4K3c5YThQWWpvNEo4M0dBcm5MbC9hVHNRUHoxSXh5?=
 =?utf-8?B?a2NLakgyQlBEbzNaUnVCcHZCbmRGaGhLSUF6LzFTaGZsdjE2SHIwOStJRW5o?=
 =?utf-8?B?YXFHSFJFVG1FNmhwMmRZVmNFRkFjUzdYQncyTmpmcVF0VjlnSHl4aVZPQk1x?=
 =?utf-8?B?T3lydGpHUVBJaVR6NTl5ZlZXV3FYd0kvaFR1dWIxRW12a1VDR2ZvZDlTVGNn?=
 =?utf-8?B?ZHBrOGwvcFF2TUJrd213dDhhUFJDQnFYakR5Q1gxdkVSdHI4N0pQeHdQOGkx?=
 =?utf-8?B?Sm1oK2hoY1d1b09Uc1Uva21ranp6VXVBZ3FRQ0IyN1k2bHJZOXg3MnRwcTBQ?=
 =?utf-8?B?blhFWncxODRpdVdlNkhqeldtTXB3UUFrYkwvWWtlNUxoU1AvUTRraGNTQ21p?=
 =?utf-8?B?QUJqWXlIU1VGYmcwTk11ejVCOFhqUmtnR0R6dGJqMnZIcUpiOG9yd3BhcGFE?=
 =?utf-8?B?Q2RpZ3VsSlc0cWJ3ckhOMk1aeG0vajU2MXVvRVkzZTZLbzB3T0VGaG5NdEFx?=
 =?utf-8?B?bTZkZXRYSFNQdkd3QUg0V2UwZ0xCLzRpcVp4b2N1VWcxL3FwM1luU3VHWU5C?=
 =?utf-8?B?RlhXRm9CUGRUNzhkNC9RRnJvS1lPUzdSV1F1M0VXR01PQUp3NnI1SW9NUDJy?=
 =?utf-8?B?RWRWam4vU1ZQVHEvbW9vbFRubUpJT0pObmp3N3N4VERyUE8yWkdsdHNNbkM1?=
 =?utf-8?B?Vm56MXJJZ1lqN2VxUVhBZTVJVUE5UDdsZnl6VXUxaFRDZ0NJeXcrN1pDdXh6?=
 =?utf-8?B?RDIwdEZlZ0ZTTnRXeFlla0YvaDFsVGh1elZ3ZVEyMFJ5akd6RXhRS0RxeHBn?=
 =?utf-8?B?SlY1TWpYcFAxUGJsQkdPQWxwZklEbGZtSlZKc1hpUW1lNnVtckNvUHdnell6?=
 =?utf-8?B?VU5vUGg1N0NmZjFrbCtvemx1R1dRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC5E2CD6EF8FD146B6F40F77BF103DB3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0608f4c-8df8-4a76-af84-08d9efe8038f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 18:30:02.0054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMN1EH+7WnmS8qlBcUVSoyX0xkpoCiYxI0XRRILVrWAcVfIP+c1R91IRhliqQGm3xSr1pyJ24bq8pOXQI7HcDyWBjigmu7CPd0R1cJDMhTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4561
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzoxMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gSGkgQW5kcmV3
LA0KPg0KPj4gT24gMTQgRmViIDIwMjIsIGF0IDEyOjUwLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+DQo+PiBUaGVyZSBhcmUgZXhhY3RseSAzIGNh
bGxlcnMgb2Ygc29ydCgpIGluIHRoZSBoeXBlcnZpc29yLiAgQ2FsbGJhY2tzIGluIGEgdGlnaHQN
Cj4+IGxvb3AgbGlrZSB0aGlzIGFyZSBwcm9ibGVtYXRpYyBmb3IgcGVyZm9ybWFuY2UsIGVzcGVj
aWFsbHkgd2l0aCBTcGVjdHJlIHYyDQo+PiBwcm90ZWN0aW9ucywgd2hpY2ggaXMgd2h5IGV4dGVy
biBpbmxpbmUgaXMgdXNlZCBjb21tb25seSBieSBsaWJyYXJpZXMuDQo+Pg0KPj4gQm90aCBBUk0g
Y2FsbGVycyBwYXNzIGluIE5VTEwgZm9yIHRoZSBzd2FwIGZ1bmN0aW9uLCBhbmQgd2hpbGUgdGhp
cyBtaWdodCBzZWVtDQo+PiBsaWtlIGFuIGF0dHJhY3RpdmUgb3B0aW9uIGF0IGZpcnN0LCBpdCBj
YXVzZXMgZ2VuZXJpY19zd2FwKCkgdG8gYmUgdXNlZCwgd2hpY2gNCj4+IGZvcmNlZCBhIGJ5dGUt
d2lzZSBjb3B5LiAgUHJvdmlkZSByZWFsIHN3YXAgZnVuY3Rpb25zIHNvIHRoZSBjb21waWxlciBj
YW4NCj4+IG9wdGltaXNlIHByb3Blcmx5LCB3aGljaCBpcyB2ZXJ5IGltcG9ydGFudCBmb3IgQVJN
IGRvd25zdHJlYW1zIHdoZXJlDQo+PiBtaWxsaXNlY29uZHMgdW50aWwgdGhlIHN5c3RlbSBpcyB1
cCBtYXR0ZXJzLg0KPj4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBKdXN0IG9uZSBjb21t
ZW50IGZpeCBhZnRlciwgd2l0aCBpdCBmaXhlZCBmb3IgdGhlIGFybSBwYXJ0Og0KPg0KPiBSZXZp
ZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpU
aGFua3MuDQoNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc29ydC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NvcnQuaA0KPj4gaW5kZXggYTQwMzY1Mjk0OGU3Li4wMTQ3OWVhNDQ2MDYgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc29ydC5oDQo+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc29ydC5oDQo+PiBAQCAtMyw4ICszLDYxIEBADQo+Pg0KPj4gI2luY2x1ZGUgPHhlbi90
eXBlcy5oPg0KPj4NCj4+ICsvKg0KPj4gKyAqIHNvcnQgLSBzb3J0IGFuIGFycmF5IG9mIGVsZW1l
bnRzDQo+PiArICogQGJhc2U6IHBvaW50ZXIgdG8gZGF0YSB0byBzb3J0DQo+PiArICogQG51bTog
bnVtYmVyIG9mIGVsZW1lbnRzDQo+PiArICogQHNpemU6IHNpemUgb2YgZWFjaCBlbGVtZW50DQo+
PiArICogQGNtcDogcG9pbnRlciB0byBjb21wYXJpc29uIGZ1bmN0aW9uDQo+PiArICogQHN3YXA6
IHBvaW50ZXIgdG8gc3dhcCBmdW5jdGlvbiBvciBOVUxMDQo+IFRoZSBmdW5jdGlvbiBpcyBub3Qg
YWNjZXB0aW5nIGFueW1vcmUgdG8gaGF2ZSBOVUxMIGFzIHBhcmFtZXRlci4NCj4gVGhlIGNvbW1l
bnQgc2hvdWxkIGJlIGZpeGVkIGhlcmUuDQoNCldpbGwgZml4Lg0KDQp+QW5kcmV3DQo=

