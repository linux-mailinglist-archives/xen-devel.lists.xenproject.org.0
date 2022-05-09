Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3051FE09
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324549.546658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3Mf-0003Cv-O8; Mon, 09 May 2022 13:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324549.546658; Mon, 09 May 2022 13:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3Mf-00039r-KL; Mon, 09 May 2022 13:23:53 +0000
Received: by outflank-mailman (input) for mailman id 324549;
 Mon, 09 May 2022 13:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no3Me-00039Y-7z
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:23:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fff34e-cf9b-11ec-a406-831a346695d4;
 Mon, 09 May 2022 15:23:50 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 09:23:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5282.namprd03.prod.outlook.com (2603:10b6:a03:22a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 13:23:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:23:45 +0000
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
X-Inumbo-ID: 42fff34e-cf9b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652102630;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iL73GEIo0RvvqQPfebHpzrj1wMJsKL8iY3j3lm8kTBo=;
  b=JhoDxMOMcXYcswNjIVxEcCHiHkTY3K4Mz2gcK4y4YlM10FN5JPVal9XZ
   6rnD/jbkkY+imXDe423pb1FUSfjunTJLwhcutQVGMNq8KHr3VLp8GibFL
   6PHSO1DgNv+uByaWYcPk5RAaP67URuKTfGg6nWy7QYfEzaL5b7EVzJ/Di
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 70901613
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kn/Mua8JzvxLZIZkAs/oDrUDUX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WoZDGGEMqmMa2CgKo1+Yd7np0wD65ODxtcxSAVtpXs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IDoW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbWsVQsEI6znotoMbyZ3AS9bPIAewYaSdBBTseTLp6HHW13F5qw3SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIEItNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK/ftvujaKl2Sd1pDfYN/YWoTbb/5ZvUiIr
 2LKwmHJLC4VYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3C
 WYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 l2Um9LkAxR/vbvTTmiSnp+qqje1NTkQPHU1TyYORgsY4PHuuIg2yBnIS75LGqOvksf8Hz22x
 jmQtTU/nJ0al8tN3KK+lW0rmBqpr5nNCwQztgPeWzv86hsjPdD1IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz3k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:JBOHlqDnggfoqEvlHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70901613"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRKdd4Zys4RJ2XK110MrzUEeAP4aHRTcA4hpMVfcQCaCnLS9rZbAUIl/fsR4e7/dmHtbB6OQ9g+/tk+eOX4fLyCK4YhrGfBbxL3jMJ71cpHp+Q8Sn+/hv55DkD05bO69I3LD7MPtsovekUPzqWBbMXeIF2Xe8OFWwd/oOfAoODsiYGVF7zaTKXYc2vnfNY8sipok8+BV3BZ921nrQ53UfDaN/CN8+WtwrpkEf9fmJg7lbzaQoEHpgwUIDQ20cTG/qZtdOzNRsgpLv5ahaWXf3KHnFRsOOPnIqSZlf8q7am3hyzSvO3i+9sB5g48DTJ0pise/jX0OY0shRDez0C884A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL73GEIo0RvvqQPfebHpzrj1wMJsKL8iY3j3lm8kTBo=;
 b=HzMreJDAqMVKCMQzn/y/NAXlpyRXBZr2ciJslU5H/HDeiQBz7pHUbgxdudo3DoldvBeYyIQ8V902o/X1B7jIBDWhB3D4K0c8N/oHr0p3jHjTkWIF6MBCAj+osusX6A0RELAo0PfMx1DCH4t3401Xn6NGKDs3HdJ3gdxiBBctkYwn0Lj1Z6s/sBEJ9crT0FUVmucbs/xoll0fS5cChxl97U+qXtuirsC96OsS+zGS+Su0k0H1ta4l5+7SFh5m5E4ztruSMm1hU0D/WRsajTr61jwDpA4HpZ/X5OB4lfIhZdEj+qtuGk3nJFzrAJElMhfnJSm6HBOAeDxe2xWXC104sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL73GEIo0RvvqQPfebHpzrj1wMJsKL8iY3j3lm8kTBo=;
 b=DlZEWawoQOcZ+zug4DYoiYxqWH2pnDdGS53oGXd6IvAaEkWzTbpEcTu0XDUAWNRO76QXa4cxjJK2cP6E605KxJuWc6sZk6QMsJXhinySx+WfKmk0u51B2VQrv7b9mHzc2ruzJ9xqePahaB76vV4TUgbW9ism9JbMiF5B90dBWz4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Thread-Topic: [PATCH 1/3] x86/p2m.h: Add include guards
Thread-Index: AQHYY5/ES9ABGv/aoE600JAs5fhuma0Why+AgAABlYA=
Date: Mon, 9 May 2022 13:23:45 +0000
Message-ID: <21c74c28-db16-e5d1-e688-992cc84d6893@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
 <YnkUjVuRZa1EVgLY@Air-de-Roger>
In-Reply-To: <YnkUjVuRZa1EVgLY@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97cac84c-e2df-47c2-e449-08da31bf24e4
x-ms-traffictypediagnostic: BY5PR03MB5282:EE_
x-microsoft-antispam-prvs:
 <BY5PR03MB5282D4C6BE94418C10D6C6AFBAC69@BY5PR03MB5282.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 URyhRRNZ/Reqbeha5D0j1n1eg4CmM+YEm8FaReYOYhu0Hitkwgobprt6vcATJquXnVNm4nIqBgiabzx57wJ0yRtz4/T9FlEJD7sYWTXkZg7Fussrv8ALjYc/sYlik3srXmH3s9XQvWFZJ8eER0ocTOmU6bwb2K6aSWG5grWMaEm/phdwvZQZEe/2H2nJP+aXW49+/9oE3gFGX0CI8rIzodsxX1yoEKLHwm1+BIFhU290nKr1CYK7t9vzyeMIexK01F014B20CtiV2UFSdXNmAEnH+CL8pWrrgA0jyzAN3hMccJU4OHl8XrANXCldbEh6Z7IXQvJMSqlEsLd2PlXI6W3eQQSDMRuUzlNQU7PKQdIvyysmu1lSbn4bUQmaH+m9JsxpWdNqRJ3YssxyhtNqSkGNTE4r8HpNlZuHOVF/h6MFVmiRQYKq5YVjSJ/wN+rgpqpXPWnN1jQjdQwF3tJqZ1oVV3f0cI8XiQwZvC2ZEG09UKPWmbxFvhnVD5K54aXhlzey581z/ibac4ukPkLtXH/Q9mu4+Z//EnIuScUsYCv6q52SJLyskLYbqRDGBVvH6ntow8Mj0Nnn1CcoO1IF6oqsl0y9z7J1Sj+zFDbnmkac5F2i1Gl1rvKx/zYdSXUKpQByX6Nvwu9ti5XqeLIoXRyCqhCGAscFXI3ZGtFVT87VD1K829lYW0jq/r+6WKMrlv6FYdjsoCBj6+pSw6YQnf8SlJHeVvtQWPGD8Kg/P33vuz+i8zZYXJxCgzQMneIuZsBDgY4hFVIyr4DMZIkr1X6Dctvp2AGVM0fQZ5Wkk7X3Ptv7koYdspQGmo5g6fBD2BbBT4kzKHDJ6J6Qzn2sJ60cHdH+uN+yiHrzRblUJjw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38070700005)(6486002)(508600001)(37006003)(6636002)(54906003)(122000001)(316002)(82960400001)(186003)(64756008)(4326008)(71200400001)(36756003)(8676002)(91956017)(6506007)(6862004)(76116006)(2906002)(66446008)(6512007)(66476007)(66556008)(53546011)(26005)(66946007)(31686004)(2616005)(31696002)(5660300002)(86362001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGV2MEZ5eVFVcGJ6RmV2UjlKcnZkcnNINEd0bXdwRGN5Q2ZHUlp4VXdqV29N?=
 =?utf-8?B?ZUpVKytseEhhU3JZNFZhRW5qc1VkVWVoMFZoQ3NhcTZvOTg0aVdGTGpMVjRx?=
 =?utf-8?B?MGVFeEhYNnVLMnFGUzZFZEZteVVlenltbE4wZVo3Q0VvbldQVnI3Nk9lTG41?=
 =?utf-8?B?eDZNSjU5anZPc21Fc1FvZXNZeUpWUnlvaDl1eUhNOG85b2l5VHFrcnpwaFBh?=
 =?utf-8?B?Rms3Tko5S211ZStYL096aUVaVmZDQlozcVRqbFBEMVR1dzNQY0pMWG0xVWVl?=
 =?utf-8?B?Q2xtZFVEc2xiVVRnbzdNbFQyenhLU3Y1L0EzalRXK1hSdmFWSGgxb29qZDU4?=
 =?utf-8?B?RGVGdUxwbGV2Yy91RkFLN0c5ZkZPZW5JL3dpTjdqbGtZVGMxY3YxTGlTVjF6?=
 =?utf-8?B?OHVZTGJ0ZzdPWlVMUlRSNW4xVllPYk0rMUZiTk1iVUtXWFhSaEJHVlI3VG15?=
 =?utf-8?B?clhPTVAyRW5nUDQydmx4WnkxZTRnYjdjOEsvcHhOM3hQaTZPaUZINUhEWDFo?=
 =?utf-8?B?bDlkZ2RldVVyMWhmRWJ5VG1NQ2EzbDBLSndaQ2FJQnZCcDBPYTJBQmJIemdZ?=
 =?utf-8?B?a3MrNFM4anREa1RUaXoxN2E5aGx5aEhaVTlEMG5GNUdJdkQ5RGxBbUpMOXZi?=
 =?utf-8?B?dWlvcU55QmpPS1h2UnhwUHN6U3NWZU51R21ZckcwNC9YeGNpbmdKR3pZUFR1?=
 =?utf-8?B?VGg5cDFLSUhDazlEWUtyR3JRcUkwYXB1akNpSkp5ckxqVkNrRlV3bTRyeUt0?=
 =?utf-8?B?b1poSzdaQ2c4d1ExWnV1d0hDaFNpSndFYUFQSnJnVHhOcVlBQU94akphMndq?=
 =?utf-8?B?Q3h3eC94YnBaZittR0tVR1pYOHZtdzJmVk9DWXM3cytYT01mRjhXdUg0Tktr?=
 =?utf-8?B?NE5XRmlLU01GaWhPUXI2bVpXY3RVU3hpaFhmN3NOYmNWV3p1U0ZkcnRrT1JO?=
 =?utf-8?B?cnJ3cTRqdklEMVJPYW9mOFVubWtkNkxKR0xjeG1YSXlaamRDa0Q4Wlo3K1pT?=
 =?utf-8?B?cmNXWE5Ba21vd2dRTXpqZlJMQVNDeW1oeSsrUStNS3dSZUVubGtrZDQxelpN?=
 =?utf-8?B?dS8vMEtva2dESTJUZHpIZmx1SlJaZVdNNXl4Z0p1d0kvOVVxK2hGSE9pSXlU?=
 =?utf-8?B?YlQxaldnTU5QMmF0Zm93NVNFa0RtNUNXZDVqVkdEZ0JFOUlrWFVrWCtXVDJQ?=
 =?utf-8?B?VnZMWGF1eGNYWHB4blZIOElISCtWN1NEU0p5TUdMMU9zUFJPM3RYVVR0S01Q?=
 =?utf-8?B?cXM0ZWRZc0FQOW1MTVlJWFpyc00wU0JXUk85TEl1NVRCTzVmWi85WmJkMGY2?=
 =?utf-8?B?K1FlN2h0bHFYbnhmY0RTTkh4NGgranIzUFRaUjFBZlplZUdSbTlGdWErNnBh?=
 =?utf-8?B?OUg3MXFGYzYzNG5OL1VyelY1OHhyTTlRbVBMR2prVlNqZnN5cWFpZGZiNmN6?=
 =?utf-8?B?bllmcVBWanpOdExOd1cyN29ISXpvd1FTU3BYcllRc0xxT0tqN1VwcHB6NVZq?=
 =?utf-8?B?eWdwWGFBeXlzdTFQZ0VDYytEN0QvOVhPdnpqTGtvbXVweEwvdEdRamZZbVRu?=
 =?utf-8?B?clB6MnA2NzBkektOby9HU3VOais1dWJsYlhKMDZyQ2FoeXoyZzUwZDBtOXZI?=
 =?utf-8?B?TEpxUllxdXpkRTF1UVNkYUJzNmxlSy9ZS0tLOGNjcmpHbkNYZDc0ZFlsM2tt?=
 =?utf-8?B?MEx5NW5OblkyZVpyMjliU1hlQkF0ckx2K3UyVXBLTForbUJHMWRBVS95cUhQ?=
 =?utf-8?B?K0VCRkt3MmoydFFBQUFlQ2JJWU5tQjhDU2ROL2x5YUVvMTBrN1VHb2VNcktL?=
 =?utf-8?B?cFBmRlpTZkJRWFkwbHpOVS9XY0pCWGxsbGltUTJUSWtZV2d0R2VlZng4UVU3?=
 =?utf-8?B?SGs3TjFMRTJUd091VXdoME9hL1NtQWRwa3pGQzJ1RUtoUENsMUFpRG5BVzll?=
 =?utf-8?B?MUROUWRoQzNoUmplZHBhbVppeXByTWh1MjRPemNzY3lFcGRPS2cvcE1YS0dQ?=
 =?utf-8?B?Q0IxRnhuWUNITlk5OGpEa0d5NGduR1c4KzNHNnNmQnMvVndiTDAramxVaExG?=
 =?utf-8?B?S2RxeVQ1QVRkY0hSRWhIM0Q1SThQV3pVSXJDQ0ZhdGx3U1R4MUp5cHJHK1JV?=
 =?utf-8?B?a2hCOERmREpvT1pEbUUzWG1aMVljVTlGcExMNWFqdkZXZFVXUTFyTkpTazlY?=
 =?utf-8?B?dDFLenl2enNuQ0NjUFhNYVFjNHF2OXk2dG5EbDlScDE2K2VwR1A0VWY2a2NR?=
 =?utf-8?B?MVZ3c2N2aGV6bytJckUyUE1uSVdUcUdBZXlhTDFueWoydi9udC84c094MkhD?=
 =?utf-8?B?dmsxUTRDZlc3eFdRNkloN1pOdzhwSXZ5cGxZcDBWQUs3UFpSd1haMmNQWmsv?=
 =?utf-8?Q?QrKR/CCo87Nd3dPk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A02B4C71B6002D4D952327CFF8F7E433@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cac84c-e2df-47c2-e449-08da31bf24e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 13:23:45.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dj5xHpK32J+osgpIa7/oloAawBmBY2lK4PLDCFNJ4zmiUUoJ3MNry/Quaj1ZGciZ4QIPHy4T+fMINedrDkOJ/iI7vZOtU2C3Hr2JydRGOOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5282

T24gMDkvMDUvMjAyMiAxNDoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBN
YXkgMDksIDIwMjIgYXQgMDE6MjQ6MDdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IFNwb3R0ZWQgYnkgRWNsYWlyIE1JU1JBIHNjYW5uZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPg0KPj4gLS0tDQo+PiBD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+
PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBDQzogVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPj4gQ0M6IEJlcnRyYW5kIE1hcnF1aXMgPGJl
cnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0u
aCB8IDUgKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uaCBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
aA0KPj4gaW5kZXggY2MwZjY3NjZlNGRmLi5kYzcwNmI4ZTQ3OTkgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vcDJtLmgNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uaA0KPj4g
QEAgLTE1LDYgKzE1LDkgQEANCj4+ICAgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90
LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPj4gICAqLw0KPj4gIA0KPj4g
KyNpZm5kZWYgX19BUkNIX01NX1AyTV9IX18NCj4+ICsjZGVmaW5lIF9fQVJDSF9NTV9QMk1fSF9f
DQo+IERvIHdlIGhhdmUgYW55IGd1aWRlbGluZXMgcmVnYXJkaW5nIGd1YXJkIG5hbWluZz8gU29t
ZSBmaWxlcyBzZWVtIHRvDQo+IHVzZSBfX0FTTV9YODZfLCBvdGhlcnMganVzdCBfX0FTTSBhbmQg
c29tZSBqdXN0IF9YODYuDQoNCk5vdCByZWFsbHkuwqAgVGhpcyBvbmUgaXMgZXNwZWNpYWxseSBj
b21wbGljYXRlZCBiZWNhdXNlIHg4NiBoYXMgdHdvIG9mIHRoZW0uDQoNCiQgZ2l0IGxzLWZpbGVz
IHwgZ3JlcCAvcDJtXC5oDQphcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0uaA0KYXJjaC94ODYvaW5j
bHVkZS9hc20vcDJtLmgNCmFyY2gveDg2L21tL3AybS5oDQoNCn5BbmRyZXcNCg==

