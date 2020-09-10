Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5901264A2F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 18:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGPiT-0001Na-A0; Thu, 10 Sep 2020 16:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBJY=CT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGPiS-0001NV-9r
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 16:46:32 +0000
X-Inumbo-ID: 9f932ca0-56fc-44ea-9d69-79524fffc3c8
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f932ca0-56fc-44ea-9d69-79524fffc3c8;
 Thu, 10 Sep 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfoJdk0aGkzMxmHSz6cxXvqH9Q0rk1u+Gf5Dfze+9Zs=;
 b=I+NvBJu+3fL2OQ2qdtNpzt+dcxSVkRcNKAli8KGBKKrvN5L9r6BC/8xJzG4Jy15DtXkvedZH73fEIZwx6CoU+53P21A15mXOPppPVuv54sSJK58HrNURi17poqON8oWJm25scDji/w9aZmWTmxXtYEil1nC7izybi6MhVExhFVU=
Received: from AM6P192CA0042.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::19)
 by AM0PR08MB5396.eurprd08.prod.outlook.com (2603:10a6:208:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 16:46:29 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::cf) by AM6P192CA0042.outlook.office365.com
 (2603:10a6:209:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 16:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 16:46:28 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Thu, 10 Sep 2020 16:46:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcb61339f88f6082
X-CR-MTA-TID: 64aa7808
Received: from f58789aa8622.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12F60F03-D923-490C-98CE-33777B036116.1; 
 Thu, 10 Sep 2020 16:45:51 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f58789aa8622.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Sep 2020 16:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znvrs8oJSexZCf61bJtzoXT83M25uL3Q6YuYrhvjDm3IbsgG1vePGdpGY8pC0muLYBAWfv+cOYKLVYarY2W2vB9lWhU3LIImq+wLzz/4BJHk/rwsZxnHSyWotZl2z8uec5h5DNOm9gBJBHFMQWc9CuATleOXaLZL1TXIiSxGqxhRA88n1K14YJMTzWlW6P4pC8JZSn4UKWOAThYfuqz8Ar/UDlF7/i1EBLfsdEM07/hOgEMPbqsz05H9YutbTsJmpKu3eQvRHEIaQsdN7ptuN1U6IDQlksJpfAmEVYw+0AXj/+AUVlQQFvIKy0I/PWRAoJQ4RZtDc1b3UWYaWF5hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfoJdk0aGkzMxmHSz6cxXvqH9Q0rk1u+Gf5Dfze+9Zs=;
 b=Aj/8zKFdEJHuEQT29W4ttXhI3AzaVtJ4mfKUgW1t/Iy1nJGktJF/rAM+j2c7T3ZMiaMvMmCXad4RZeWzR0Yrkqn+n2LnQkg1ZoZdWutSV2OeAGiKOA0i2OVRE0AM/pyJ5pjHS7+qDzsmaHbOthGJzA48BLCFm+iRhzDrCAmTZ+KvQmhOjNltWC/NaidcErrJIh80Sf7XCdPHTUa5t4qV5BIhs5LycNa3BZKUglaDtRWPnGcXS65QwFpYop5InuKHq0UF/Z5P8QoCHc3/0DddjJhHEDO1xtiRo2Eh1CIqQWmlwQdeTI3gxwfsVpdF6BBuURkvQc5saI3KxMbM4fPXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfoJdk0aGkzMxmHSz6cxXvqH9Q0rk1u+Gf5Dfze+9Zs=;
 b=I+NvBJu+3fL2OQ2qdtNpzt+dcxSVkRcNKAli8KGBKKrvN5L9r6BC/8xJzG4Jy15DtXkvedZH73fEIZwx6CoU+53P21A15mXOPppPVuv54sSJK58HrNURi17poqON8oWJm25scDji/w9aZmWTmxXtYEil1nC7izybi6MhVExhFVU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 16:45:50 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 16:45:50 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Paul Durrant <paul@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Paul Durrant
 <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
Thread-Topic: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
Thread-Index: AQHWh4IX72/mBoqf+EKYBSK7g6LWxqliEpCAgAACGQA=
Date: Thu, 10 Sep 2020 16:45:50 +0000
Message-ID: <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
References: <20200910145007.14107-1-paul@xen.org>
 <20200910145007.14107-5-paul@xen.org>
 <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
In-Reply-To: <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48c0a037-f342-4b53-ad3a-08d855a9108c
x-ms-traffictypediagnostic: DBAPR08MB5767:|AM0PR08MB5396:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5396A4EE273FC8CBF9BAC99C9D270@AM0PR08MB5396.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lOu9gyaxaOtzeVwSawfLN3n8zGaBbk3rtiu9sRwa1oj9w34sizt3YBy13zw+aJs5p1FdnAh396b32Ec1XSg4lFHLgAPtjGaLrX3y6J9CX5Oxz/OzWbDsIfLs/revtq5aiAejbCCovSS0UkxW9wZboC+NMxli0ZEYNgUdC1iYy0bNaw7c0KIqwSwVP53yj8W2uNS0mrNlEErGMLnYScxAvP20Z2ca5I7X5kaKC1uR+XiHGTP/T4f3046IVMMIoMDX9r2aOaBGtTSpggFsbOKdpRFZxZyop8qMfj3tzIkqoSwR1O61GlJ7GaLSfmSO8vzrUAtIB1w+pRk/iuOEiODhcQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(36756003)(2616005)(91956017)(66476007)(66946007)(66446008)(8936002)(76116006)(64756008)(66556008)(33656002)(316002)(5660300002)(7416002)(83380400001)(71200400001)(6486002)(186003)(26005)(6916009)(2906002)(8676002)(478600001)(86362001)(6512007)(4326008)(54906003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bniDeDbRpfh4XnLLTOKqwo4K2f/yvDcU9Ff+pM1sLI5p9/n5MrJQFDqHMfZtdDahpyQguaqPOttuWF8X0a3urhpG4ZMb/Gdy1XLwegdzbvTIuiWYyvvbYaGiluIAtcRUx+M5ETpgHVnqdoFE89QIXHQO1Zha6zc/EmOIsRiMRnRUb68HUSXT1nr/2xtocPReaeoWPIgsxqsKwqwyeQ7fhnLcvEa4vRLyrch2X/qGTVxBzMBi8Xz2NmYNeQbu+EeTxJZF1QcaZe6VWOGs+NELM3Xj4THx1FrWNffoZ1yeLseAKVJuBDUKwZll2jhOz2NnLNsF8k7hEyAKaoaUF4Ze2Ko23wGU9uM1xLoTLUxLUv9hmaF2RtY1bp7C/94AoFQ64elq0JNH3ajqAnrH+Ov0jEHTgzlYJ3mC2uNFzrwGCuyMK9AsmVDLOW8AWooZ0pJ96eWZNhza7L6PUrSqK0RfKhJbaHNYPufIERJUApZ/DGSY3eZtM/cPhDpMGNHuURty0yK+IhZXA2R0iF44ZjeJo/4UxRHURlPnJUVZ7Z+LRUlKleblOHdDHnuccBoHH9AAjQ/Ygk1itQvSRh23gt7eUqwbmku1OzHWtR6MU1gBh2tPHbOVatq7Qb9N8O+RU1owAyN1AXkpYlrDjymiVA6JaA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <48C9B6A3EC1ED34484D9C5B226A99EEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d3f146f3-6bdf-46be-242b-08d855a8f9df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPTWrvhIKor4HFc2Y15yRqb+5YXwgLEfsOzuPOkcNY0tfNfIRY7edt+QTtZ+0FYiYnlGHMrr6UUgOVTqBZ8zXDRoHy7Epp4Awqax6Rp4lfjgOuO3WVHrLLWk0TBQ53Tek5/TGbSKaRCrx7oWuVcnZlkUaIWgcDU81WaZqnoTzmOGF138PDb77t0JUMEL4nyeiNsTBIbryPHplXuuL/igsBxREJWOwNamvethesqqUBZmkI+grotZZUUrVLhfVZ4Ne37fFiAJhsJSLEaWufkP9j4VoktSUa+4rAKOZcCuezRO6LPjz/H0/02bLVO58baaDY1iUBlzi+2CvqO6no3QVI5lv4+e/CgZQtr5CMH5/wgbNxVtYT5dqZoAlxGbBZJyAkPUecS1WmXcnosDsmpPOg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(36756003)(2906002)(83380400001)(6506007)(70206006)(70586007)(82310400003)(4326008)(33656002)(336012)(6862004)(82740400003)(36906005)(81166007)(47076004)(356005)(5660300002)(8676002)(6486002)(6512007)(478600001)(86362001)(107886003)(316002)(54906003)(26005)(186003)(8936002)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 16:46:28.7274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c0a037-f342-4b53-ad3a-08d855a9108c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5396
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 1831dc66b0..13f68dc93d 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -146,23 +146,23 @@ enum
>> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
>>=20
>> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>> -                           unsigned int page_order, unsigned int flags,
>> +                           unsigned long page_count, unsigned int flags=
,
>>                           unsigned int *flush_flags);
>> int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
>> -                             unsigned int page_order,
>> +                             unsigned long page_count,
>>                             unsigned int *flush_flags);
>>=20
>> int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn=
,
>> -                                  unsigned int page_order,
>> +                                  unsigned long page_count,
>>                                  unsigned int flags);
>> int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
>> -                                    unsigned int page_order);
>> +                                    unsigned long page_count);
>>=20
>> int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *m=
fn,
>>                                   unsigned int *flags);
>>=20
>> int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
>> -                                   unsigned int page_count,
>> +                                   unsigned long page_count,
>>                                   unsigned int flush_flags);
>> int __must_check iommu_iotlb_flush_all(struct domain *d,
>>                                       unsigned int flush_flags);
>> @@ -281,7 +281,7 @@ struct iommu_ops {
>>    void (*share_p2m)(struct domain *d);
>>    void (*crash_shutdown)(void);
>>    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
>> -                                    unsigned int page_count,
>> +                                    unsigned long page_count,
>=20
> This change will require to change the arm smmu code to have the right ty=
pe for page count:
> xen/drivers/passthrough/smmu.c:2536
> static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
>                         unsigned int page_count,
>                         unsigned int flush_flags)
>=20
> Otherwise compilation is failing for arm.
>=20
> With that fixed i could compile and start an arm system with the complete=
 serie (but not one with an arm SMMU).

I should have specified because my test system right now does not have an S=
MMUv1.

Bertrand


