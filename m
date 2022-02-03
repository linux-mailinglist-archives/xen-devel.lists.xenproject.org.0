Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC14A85E6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264822.458071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcq9-0000md-Nc; Thu, 03 Feb 2022 14:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264822.458071; Thu, 03 Feb 2022 14:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcq9-0000kT-Js; Thu, 03 Feb 2022 14:12:01 +0000
Received: by outflank-mailman (input) for mailman id 264822;
 Thu, 03 Feb 2022 14:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ap74=SS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFcq8-0000kN-JC
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:12:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f1816c8-84fb-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:11:59 +0100 (CET)
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
X-Inumbo-ID: 3f1816c8-84fb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643897519;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jmG3vSUwUwV9cYyaBAFqu3A2a77D0HHSIhiZMswXxvE=;
  b=ZIcMrFIh9UAmeLBxSKpJS0j5DIJBtAOQ91PmUA8cq/QIoJEq89JPdmey
   EV60Cld5+XH4fA0F8lO1TtECbpZzUIAsYMGhF7DGQtP4hBH1XCoXlQZNy
   0mrmtsKYF3r9WZvCGHLRztDtCDHK5EZq1FCxG/yzya5+wAkQW06ej0SbU
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f10cTp67eEl40J5hV1Yu3rFsQwAckBVc8oRChnm3SeeZVyDet9XM4o8R+aNBf/6NIkV1w4HkCP
 xEZJUHMdNNfeMD8nZEcjEZfigZTkj4S7tJ1FAJ5lnYPjYzPzqoa15IE/jKGLwx2HXoy6D7cJJp
 pXYVhWekYdb041+jUcqmnGbPLXhrepKyNo9pNL/MMKdCRUEibWZUNAmhMlP+1cppiO0w3I+O9Y
 h+36vM03808WEA9TwRlA5WmNsSJaE/eZyWVbDECy/vcH/XALzqthuj/trBMixfo+5g20NPTaeC
 DZG4N1YmEhYqAUI3U15VllMQ
X-SBRS: 5.2
X-MesageID: 65617163
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PojeeqkjJeC0zvECSPsbISro5gzDIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWjzSb/veMTOkc4oiOdvg9ksAucXUxoUyHQJoqSBkFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NYz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NRD6ZybERk2B+rRpv4iDSkGISY9DLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6uAP
 pVAN2EHgBLoZzZUAU4cBJEEsMj4uSHFcmJe8kiejP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqSgevIkTL+SZglPrSy/f53g3We3mUWThYRUDOTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzWnpFaUsxhaXMBfe8U49QWMx6z88wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQA3B2IfYS4PTSMe/sLu5oo0i3ryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj1qvn/XufnS2V4YX3VDFr1lvlWSGU8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U032n1oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4Dpg4jfIUO/CdkTNrGgk0PiZ8OEi2yCARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUj8geHDOiPEEuheWLdrUgzfxPnfyOky2
 40HX/ZmNj0FCLGuCsUp2dJ7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt6E7GJa599z7+Sl
 lnkAxcw4AOm2RXvdFvWAlg+NuKHdcsv/BoTYH13VX71iidLXGpaxPpFH3fBVeN5pLULID8dZ
 6RtRvhs9dwUG2mepmRAMcKgxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JYHmyO1e7aN6CiyU2fp38YlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVsT69h8Hr9nwLgQ/dzqo7MGnA1oEG+SNwagC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcfVN3YP6C2PcYnijpwc40eEiqtjVq+LenUFlJO0XegiJqM7YoYpgux
 v0suZBK5lXn2AYqKNuPkgtd63+Ici4bS6wiu5wXXN3rhw4sxg0QaJDQEHarspSGatEKOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKgTbgMfBi982wAZVoGY+QQlixxla1/5+Z
 zpwPEpvKKTSpzpliaCvhYx3992t0PFBxnHM9g==
IronPort-HdrOrdr: A9a23:scwelK5/2yyFp4mrcQPXwW6BI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3Jmbi7Sc29qeu1z+813WBjB8bcYOCAghrpEGgC1/qt/9SEIUzDH4FmpN
 9dmsRFeb/N5B1B/LvHCWqDYpUdKbu8gduVbI7lph8HJ2wLGsJdBkVCe3ym+yVNNVR77PECZf
 2hD7981kOdkAMsH6KG7xc+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10TDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy+Qzd4dvfrGrCou
 O85SvIDP4Dsk85uVvF+ScF7jOQlwrGLUWSkmNwz0GT+/ARDwhKdfapzbgpAycxrXBQ4O2UmZ
 g7rF5w/fBsfGP9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQ5o+bo7bWnHAbocYa
 NT5QDnlYFrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd0AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOla2XUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wk9iif3ekxhlTRfsufDcSzciFZryL7mYRsPiTyYY
 fGBK5r
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="65617163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioR5UmMJoCUbOXLCGpWotVZN2oESWEZ7RvvVI2L/PQki/k/DLjmF1dflYHxnr3fUpweYcwh10XzLd6HPCeWDwpHWu+wPwgWEwpeD/hvsu8FDueAUeUvAT6PEQZayPZV/s9LEnlZl3LL99itKrz6bNMDqjXHPgJpCcccS/oTuX3tgMD9X+Z8nq0OYa6Iv3/KWEsFqMGCO12IIAPwrdiVlnOOy1ugtA0T3mvVLxNSK9ShXYWBZuUZNcNGNsgSQwFKEXeTJdf6c+Hwg6GeDmNZIsemUfyjm5S+yBUyX3bO7Dge9wl/cH68B2UKOzD/6qNyuSn6WQZtQv/X6ELxHIgtu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmG3vSUwUwV9cYyaBAFqu3A2a77D0HHSIhiZMswXxvE=;
 b=KPEM4j9AFANoI/jY5vKwrakibHh5PhPKnNT2+ATXzeH/lT2V/OIp21CtLnpovxTC/N4DitP+EdU+BzGksBy5W1H8couxLBTNA6tWgk2tG8DX62UeXx9EheQMriI/mIIUN5frXwEN0H4j0DKV9DTg2KyWwWXVy0ZtNualEEKEtPDKksjJ7DZJ6M8M2rPqH54D8jbf5wRaUCWFsnNo537s3U5DzcgWlOWas1EEGtpxQDF6Owuh3vT6WMXQmWO2NeQxQsXuCLJlHh4U1MIj4KP5f9xtS3/f0vh/mfQufj0jvmEUF32IC2fUSRuhwEG26KXpjaGyW9eztXPBSrGlZRA4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmG3vSUwUwV9cYyaBAFqu3A2a77D0HHSIhiZMswXxvE=;
 b=CO+ybC3wQPgC6aFgFEZCdOipxL9SSvUe1BbWBcZqgaL9+HXC3G6r2yimMeaxK3sXVehuBaXyvpIjQWiZrQsa7pHe6AsWNpZ7IcZK7g7ovlgeqYR8CjDA89jqaluKJjKVg+2SN8q9L7ZRVeimgQKgjEIHQvSSYF1dw0puRUpH8rY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Thread-Topic: [PATCH] xen: Modify domain_crash() to take a print string
Thread-Index: AQHYGQNtP3H+icKR40C9qFef/QWZtKyB12EAgAAGeoA=
Date: Thu, 3 Feb 2022 14:11:31 +0000
Message-ID: <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
In-Reply-To: <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1f0a0b5-b59c-48a7-d25f-08d9e71f13fe
x-ms-traffictypediagnostic: SN6PR03MB4464:EE_
x-microsoft-antispam-prvs: <SN6PR03MB4464CC9EF82B6C0DEFB69647BA289@SN6PR03MB4464.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LS9CnTEIEkDgCSBfknk5WvqRdbFjo7sHhzywdh2PpM4uNWGgizDNURKg+Kwz/CcdaC53zQc3qdGDmjekYvBmudUh9MPKGL9OI5gx3Y2u1DO2Xq+qJQNJpod8waj2PYl+pxrlmVudyEMVACd6JG/vOAhsxUAET7X+AWdimgRG/xN6ZSadBJc/6ZY4jW2b0bA9v6chQp0KvO9R328CU4BN8duxrs7IHq/tQ1F0Sf1/sJlJPJVLG7KNOgfQOsofYLhuu7m7WlFICKYnS+oMhTmJb+Q+0A+IMDHOqnGblbW+Rc4W5qAIgHJoOQv8tD1cBgoZzd0BU93wbYVyd1mf1Sy7JOwqRVI8+YmB21d+UWzLhuuYJih8xlnAiuAqb080EfQaFR7kE+XwhrcbSBAw7ZrmLHZbv562v+CX5DJmLFm6ouj2rvIxwWe1xXyuUn1I6g1fFgkZO5PWp7POxEPVhnmvY1fwkiZ/5WvaU5WI+UgF5O67I4G2A/mL4i7oZcnUGInqq02XSuWSsIAEsw0nPv1ZcZyAWpzwq18+/ObNHX/K3BiG6S1e2YonzQuUrkSlVuyW5OxvmVaLF+kCSyJ1tbP7hTytuuGoj8L6o0duJbZQWZr+i+vIjWuGSUwJUk8OFmL18GBmuw3Ht1+tjwRjQS5a9SwS/NlsIMSDumnRYKGu1S1Ytw9rUmXuuxdXxQPlrfjRVkEbio9Gxzn8y2j9j9VaOz4rvgooJUsiwdUv6M5MbXaVukMNJ7MeDHDZgXn+6Gy2Ly042Tx6s/oeqxcLDIrOSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8676002)(66476007)(38070700005)(2906002)(4326008)(8936002)(6486002)(66556008)(66946007)(91956017)(76116006)(86362001)(38100700002)(64756008)(66446008)(122000001)(31696002)(82960400001)(186003)(508600001)(36756003)(83380400001)(316002)(26005)(6506007)(6512007)(53546011)(71200400001)(2616005)(110136005)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJTRU5sckdYZm9pckx1aEI3U2R0L2ZJV0RlRWNzdDY1WElGSjQwUndmQjAy?=
 =?utf-8?B?MGEwY1pyYUd2aVQ0ZVhkaFF5ZHJBK3hIKzdST1dZQ3YvOWo2U1d5Rlp6VHdD?=
 =?utf-8?B?U1hKM0k1K1RQeFlnayszclBDYjR4YldpcTVQcm5keVBzMWZLaDgwK244cGlQ?=
 =?utf-8?B?ekF4UlF0Q29iQXRtU0hJSkNXVEdLZDh4ZStWbWVuNUN3dG16MjYwVWltZHll?=
 =?utf-8?B?eU4vdENKeEJNVU1hREVjd3ZuYTh2Y3VtVEl0bzlDZUlhMGtKbStER3Rsa3lH?=
 =?utf-8?B?bHA3SWlBcGoranhsL3FxcFJ2alk5cEErMkJ1dWtVRFYxOGZ6ZVYwY1JsTW5z?=
 =?utf-8?B?VzNzTTJWWjVIZUxoVmNPVlJZYWYzL0c2aHIva2VqbFlGblFtWG1iQXR5L29p?=
 =?utf-8?B?OGRzTDQybTFVNnRESUxCRURGdkZqRE0wdXM1NnEwdmhKbFZ2UDhSZEhxbGIz?=
 =?utf-8?B?TCtKdndnNkpIbjhJb0ltbjdYK2RYVDh3T1BsaTY3YWUzaXV4NlhlMVRMWCtP?=
 =?utf-8?B?YnFkWlpHQkFUY085VUtrSUlram5CVERGbWNDQlhFelFqdFVFN1NSWTdzQk91?=
 =?utf-8?B?T2hDSEw4aExLeXBVZ1QyVW1zdFhyS1FBWWU1UzM1aEl5MFk5c3k1NmpEU1Qx?=
 =?utf-8?B?d3FpR2prTk9zV1dKclBKM2lMTU9GeFR4L0hpLzRLWUNpdERnOGl0b1lWeW5O?=
 =?utf-8?B?Y2dMRDZqcjB5Qlk4QU1IWEtXRTIvNWtqVUJxTE40U3dYcGRxVnBlTENJTUZB?=
 =?utf-8?B?N0VGQ0JUMWNVTURiN2s0T2pkbzA4T2lyYjdkNXNXNVlBci9mU2JZUTVSMW15?=
 =?utf-8?B?MThBNzFxRjVrd0FrVW9HY3ZlRTBWbDhqTXR2ZHlGKzVMQnNHVmx5S3FMc3dC?=
 =?utf-8?B?bkNpM3puRXFhY2I4YUx4UFlhSWwzdTdydTd2ZVBaanBOVFJIWUJWR3NFRzlC?=
 =?utf-8?B?WndOc2hDaXo2SjlucTBxcTVrM3Nkc0s0bjNpd1JFd0dySDU0cTBSRUkyYUNZ?=
 =?utf-8?B?RUwyenEybzhNRVprVUY1TEpOMVcyWWhXOU5BNmhweVVZdHRVOHdpSTc0TlZ2?=
 =?utf-8?B?RnZlWnAzTGh2eks5M0JQODA0RXp4SURyRnB6YVcydC9WM3czSVFjenA3TG1v?=
 =?utf-8?B?UDBkd2JmTFp4Y0RCTC9jWS92UVBJaDRsdlRKY1N6UzFHc0krUzRCUjRTS1la?=
 =?utf-8?B?TTFwRTlQS0N4ZjJ5SUdpL2FFdGcyK29ob1dIUWR2MDJnWXRaVE1qMXV2OS8r?=
 =?utf-8?B?V0FRdkNpQi9kek1wZFpsUnB4ZmsxZCt2M1gya2UxZkVjcElBazNQRjlGMUw5?=
 =?utf-8?B?QUt4bnlRQ3ZNemdzcy85eS83cXFzVEhzY1BSRXN4eTBSVG5mdnZjYlJyTWtp?=
 =?utf-8?B?aDA0YlF4N3NlME50QUh2TTZFOUJsUzZkR3ZjOFV3MnNKSlZkRnlsZDE3b1Uy?=
 =?utf-8?B?aDdZbERtUEFIbU1pYzdkTS9KSzlldE94Ly9ueW9hV1lIMlM2cm5jUUlXd09O?=
 =?utf-8?B?L21EMkF3MTJSMXRIMHBDVXRXMkFDUXppYklZVWhyNmhuOGplR2NHWGlUY0pF?=
 =?utf-8?B?MEppNHlOR2JrdVZuWHBXYXJFL21id3d2b1NUS3RLNEF2WGVaQ01SQ3RkRzRz?=
 =?utf-8?B?RFBsRTV2L3k3NC85WkNBMkg0TW5tVWd4UWZ4REhBWUd2Y3JmNWZFL1p4QTFv?=
 =?utf-8?B?MGpuYkhxWEFTVHNmcGdjU1hjakF2MU1FbDN6MExJSWNZejdlM2pKVmFnM2Mw?=
 =?utf-8?B?b2Fab3BrOWZmMHlYb2dEZTFsRUdJcGxKeGh0VkNZT1NPeWx3V1lDSTh0UGEv?=
 =?utf-8?B?NkQ4V2xLcXpSTjA4ZlQ0SnNMSFVGaVdmeG9wbUV4MC9GTUh1bm5ZakloL3E2?=
 =?utf-8?B?Sit2TFRTR3JRZkQva05ZaHhzTkgvK29TZFExMXRzZEFoTEZZZThOMW1nalBk?=
 =?utf-8?B?ZTNSWjkxb3Y0ZVpsZDg2VzZxeUk1N29Sdnlva0h3RzhFSVQzZ1NNQkh0akhW?=
 =?utf-8?B?M3VaSFByVURmdTBOVGtUZnhsNVp2UU9ROERpcXJpSzI4RnRkU3FOemIzNlVU?=
 =?utf-8?B?clJwaGZtV3EwUGl5Y2Rqa3lTWVFLOWoyZzF0U0hTU0Q2THF4cEtBQnl6Q1VE?=
 =?utf-8?B?RWJBbFBueTRndDFzU2lpdnp0YkIzbE5neEtheURRa2l4QjBDaW15UnZMS3k1?=
 =?utf-8?B?NGVBd1FBQ2xNQmtZazVMcEVtZStWdzNFWFIyZ1c4QUJHazVsRFIrWiswVEFK?=
 =?utf-8?B?NzhmNVU3ZHhCM3Z2bUVORjdCbU5BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <568B592618437248964EC45ED9EA96DF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f0a0b5-b59c-48a7-d25f-08d9e71f13fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:11:31.4011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnC5AmUyUqBPMPQkJ3lQsaqrwd8XL+/082Dnz1Bt9ps1LQqxqwUpeEPNv2SgD/5MjcTTCaNflUkX83+7WEX8QcNr4Pk9HkxqUqB5dMGAQKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4464
X-OriginatorOrg: citrix.com

T24gMDMvMDIvMjAyMiAxMzo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MDMvMDIvMjAyMiAxMzozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+PiBpbmRl
eCAzN2Y3OGNjNGM0YzkuLjM4YjM5MGQyMDM3MSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gQEAgLTcz
NiwxMCArNzM2LDE1IEBAIHZvaWQgdmNwdV9lbmRfc2h1dGRvd25fZGVmZXJyYWwoc3RydWN0IHZj
cHUgKnYpOw0KPj4gwqDCoCAqIGZyb20gYW55IHByb2Nlc3Nvci4NCj4+IMKgwqAgKi8NCj4+IMKg
IHZvaWQgX19kb21haW5fY3Jhc2goc3RydWN0IGRvbWFpbiAqZCk7DQo+PiAtI2RlZmluZSBkb21h
aW5fY3Jhc2goZCkgZG8NCj4+IHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0K
Pj4gLcKgwqDCoCBwcmludGsoImRvbWFpbl9jcmFzaCBjYWxsZWQgZnJvbSAlczolZFxuIiwgX19G
SUxFX18sDQo+PiBfX0xJTkVfXyk7wqDCoMKgwqDCoMKgIFwNCj4+IC3CoMKgwqANCj4+IF9fZG9t
YWluX2NyYXNoKGQpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcDQo+PiAtfSB3aGlsZSAoMCkNCj4+ICsjZGVmaW5lIGRvbWFpbl9jcmFzaChkLCAuLi4pwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+
ICvCoMKgwqAgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4g
K8KgwqDCoMKgwqDCoMKgIGlmICggY291bnRfYXJncyhfX1ZBX0FSR1NfXykgPT0gMCApwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50aygi
ZG9tYWluX2NyYXNoIGNhbGxlZCBmcm9tICVzOiVkXG4iLMKgIFwNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19GSUxFX18sIF9fTElORV9fKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+DQo+IEkgZmluZCBhIGJpdCBvZGQgdGhhdCBoZXJlIHlv
dSBhcmUgdXNpbmcgYSBub3JtYWwgcHJpbnRrDQoNClRoYXQncyB1bm1vZGlmaWVkIGZyb20gYmVm
b3JlLsKgIE9ubHkgcmVmb3JtYXR0ZWQuDQoNCj4gYnV0Li4uDQo+DQo+DQo+PiArwqDCoMKgwqDC
oMKgwqAgZWxzZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHByaW50ayhYRU5MT0dfR19FUlIgX19WQV9BUkdTX18pO8KgwqDCoMKgwqDC
oMKgwqDCoMKgIFwNCj4NCj4gaGVyZSBpdCBpcyBYRU5MT0dfR19FUlIuIEluIGZhY3QsIGlzbid0
IGl0IHJhdGVsaW1pdGVkPyBJZiBzbywNCj4gd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG9ubHkg
dXNlIFhFTkxPR19FUlIgc28gdGhleSBjYW4gYWx3YXlzIGJlDQo+IHNlZW4/IChBIGRvbWFpbiBz
aG91bGRuJ3QgYmUgYWJsZSB0byBhYnVzZSBpdCkuDQoNClBlcmhhcHMuwqAgSSBzdXBwb3NlIGl0
IGlzIG1vcmUgaW1wb3J0YW50IGluZm9ybWF0aW9uIHRoYW4gcHJldHR5IG11Y2gNCmFueXRoaW5n
IGVsc2UgYWJvdXQgdGhlIGd1ZXN0Lg0KDQpJJ3ZlIGNoYW5nZWQgbG9jYWxseSwgYnV0IHdvbid0
IHJlcG9zdCBqdXN0IGZvciB0aGlzLg0KDQp+QW5kcmV3DQo=

