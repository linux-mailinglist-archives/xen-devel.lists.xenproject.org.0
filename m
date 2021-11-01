Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246F441F63
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 18:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219376.380151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhbCf-00067O-6x; Mon, 01 Nov 2021 17:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219376.380151; Mon, 01 Nov 2021 17:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhbCf-00064s-3D; Mon, 01 Nov 2021 17:34:37 +0000
Received: by outflank-mailman (input) for mailman id 219376;
 Mon, 01 Nov 2021 17:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYDq=PU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mhbCd-00064h-FX
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 17:34:35 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc10ddab-78be-4e71-9619-87b2d3ddc4c5;
 Mon, 01 Nov 2021 17:34:32 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1GItpd026193; 
 Mon, 1 Nov 2021 17:34:16 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c26e8bb6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 17:34:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1HVYjj040422;
 Mon, 1 Nov 2021 17:34:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by aserp3030.oracle.com with ESMTP id 3c0v3cgjwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 17:34:14 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2819.namprd10.prod.outlook.com (2603:10b6:208:74::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 17:34:12 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 17:34:12 +0000
Received: from [10.74.105.65] (138.3.200.1) by
 SA0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:806:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.5 via Frontend
 Transport; Mon, 1 Nov 2021 17:34:09 +0000
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
X-Inumbo-ID: bc10ddab-78be-4e71-9619-87b2d3ddc4c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0OR+bU3BY5aWZwZxbbc9vQd3Y31c9pbGp03dLAaITo8=;
 b=tYIngpu5fiqKXI9JOknibncWr3RlG5x8jO8NYTkN2OHvXt9uLmZjkh5lnz39xGzvvRXE
 gnt86tchJLHS0fKYt62U0M/LpY+ymKS6sZlLm4BbzqyEMOXh2T5dc0Ny/V+z7+28JnTV
 FWUVEsYVJ9XNm2o9+/bHOs/WygN8A1OIRFPW4pECbeaC5A5YHJr6dR2PSLgtQHYPyWQI
 7QnYKYoQrDSjebpVp+FS2BTL9p+noGPeNty0RCQbQC2Qgu0QdHgIfHgMC7ChjTbj3Qcd
 +e75i5bp+uQx4UITI7EMLDGCg0a/L9o2QQwU9Tf+9MXNAUJ+IzxppQORO49aiXjx5Z0D YQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh2si2MOSizqwEuIk6yH0fL37ZO/Es6/eBDlG8d4qN1AjAIuSliXstiNQF1v3y9sfrZht8U0VpdW/6RL9G0niim/PzR6eXBFZSkKm3Xv2lN+74c6CFIXLVXQNZTN/lO6e71Pyv4Glet/cWFaWSwHiphCKerLMqkMWtltRXiPuE1tAwjeL8r/Eo62pI7DSIfkLhSSUiQfKPee3W0LGXAT50PWNHTu1y1hKaO5kQ7XTBjv7/PL4MfSfr/dWfCUvDNonycVYpv9ZFM07H4V4QcDKo1r0ZLRF1DCOjIfAh/g3UouKjxhv5yeKVBk+jgsDoomwNVt0rUYPONdRl9Y4bTKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OR+bU3BY5aWZwZxbbc9vQd3Y31c9pbGp03dLAaITo8=;
 b=TzAFovZ7x7JLvpYhM+YdP7eS0JYrptPCkDYyiFiMVCg572oA3oWlFxQbdkbN/F1Dd3AecwXTtKpJkqXfkA3c+LkxAPVMf3lE5oczylI8J8/IrzqGbGkbN9PmDcP+eVRHvuIYjIRZGgcSvROeUa09cNiu6oIp2e6RtmQ68GfqejdgYfXV9MpxFGQA/Rro6oXgw7RlPE0lIhqgTKmS+VW1aixweJXFg6dIeyJ15w4FMMgoEi8hOgKn4gioDelEti9TOaLVkLndFU8w1AALlKWAhoYuHCstb9ihTJ/DDViqs+cU4TZyKKGscbuOL1oghh5j4n8h9tbdHBD5YPytB94kJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OR+bU3BY5aWZwZxbbc9vQd3Y31c9pbGp03dLAaITo8=;
 b=XXreq6HQKqeaEkJLbfeq79Ef84Pl4tAYYgzaEOZLz7oD+MU46+hPfF40jJx7wop+P1VbkHRBrwsqB75dN8fd+Gzwqm+zYuYnqIR49LjjjhCtWn3beQHZXMi5Py/kPuv9wx/CI2rujWfwvCOYuhCt4isn+UvVlHdqfxz4grpzSuY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <1f19674f-e608-1faa-5656-fec853297198@oracle.com>
Date: Mon, 1 Nov 2021 13:34:03 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/1] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org
Cc: jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org
References: <20211028012543.8776-1-dongli.zhang@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211028012543.8776-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:806:130::24) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097a457c-ab52-48c2-70df-08d99d5dd1b0
X-MS-TrafficTypeDiagnostic: BL0PR10MB2819:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2819A600C18EDEAC1C741DF78A8A9@BL0PR10MB2819.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BXQhkbQLFs+268q97KZWne92T3TnTZZpq9YxK5ZI5Xbwu0TGjor6OxM+pHbK1f07xUMwMYJC+8bqhAqdFbEIWwL5YX4vVQhs8kb0FAVujA0iktkvfbT3QyZFmGOjRmerU1AwtirXN84+e0GhmVbqXrRER21n4yD5ZKwt+QcUl08oXQ4M6xXyxJYkU0dHTQZs8z1m+Dm4wTOIejp/sB7jCbTr6Zzzk8uqEAP1C43X2SBGL62sqyAK0PAT8r1dypxX4qW7ckhk/aIlVNdEZLl6JxTK82MOg2ge6aCr1s0YNJI/RB/cRTIoIhdYTLWmHu3LGrTxngv92+X+kNx6C+h5pShNn61/cw1MPZ6AXXB/zUw+ggugIe4ddMr54t0ihHBpHDxqCxxIBKTtPVrAndFw4377zf8oscVZPVeilmBXGRmI5IuzsS2PwA0w/o25Uw2ONhCqHngdu0OO1W7Tt67CA604JLcS28QLt8KRMfYlP3VUuYIpVsW+daos0Gq+a8BYGgsa0aUjhPTN8Bzm3lJ9X3wpAsUC05I3oWSLF1PgAod+GA9zRNcftOLxC0V4WzrRMAnQlexJH4qpKGioJZ3UTc+VY9wIKjKrNpKU+ATVNYWOCdHc7H67gCkCy3nK9ynJVxS6cHMP+6fr81kgQiS7HVdfIN8U26A9VwIQN4LgyWqUI0wLp3qEg9iv/MHjWY30/H+06yGqKdcwPyhv15cEnuqTVGKg5czhcqNQHlPL+uZ9A4UtP05KqMalPsoPNXNL6wUJPl+M5zON7svXxPx+u8AyD7zBCmDlWwf7zep2vjrdITOaSwdew97qf+8i2Qji7jtoDkY2Ddut7kaOddxT4b3p3BMJgnrowumGQxGD4ZAQFz+DvZklT8Wz5NRRxLKy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(83380400001)(31686004)(86362001)(6666004)(186003)(5660300002)(38100700002)(316002)(53546011)(508600001)(2906002)(16576012)(26005)(966005)(7416002)(31696002)(36756003)(2616005)(6486002)(66946007)(8936002)(66476007)(8676002)(956004)(66556008)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2lpREVqWUZPTHpwYXFtN01wY3VqOTN4ZGU5eGNtTUNXVGxwSncwNm5LYnln?=
 =?utf-8?B?T1RtYU5vRk9YUk5LTnZvMWVaYjVyWGtXNHMyOHd1LytQWmlTMmFQaTRHWkZi?=
 =?utf-8?B?OHhRZkdTMmFCZGdxOGljazRFUFBlNnd1K1crenhoZ1FsbGlIVGR6S0V4U3hh?=
 =?utf-8?B?WGF5Y3U5cHJOOHQ3Vld1eVVMMVNXMFRUM0I4TGFCaCtRa21BV3JyeUsyTkpp?=
 =?utf-8?B?NDhQMDBrUGN4NUlTZmpZdGpES1pHejkwSDZ3Um1Nakc2MFBIZlhiRmdnQ2Rn?=
 =?utf-8?B?T0xHd2VQSlBUYXcyaHNpR3gwRjlab3NGdTU5aGx2OCtPMHd4ZTZnb3pDOURn?=
 =?utf-8?B?NHNFWEYvR3ovMFppRDhVekoyODVFVVlLMWFwYjNZWTllTGJRdUM2M0J1UUJw?=
 =?utf-8?B?U2J5SjcyNWxKQUlsMURYYTBwQTYxMi9SLzZaOGFlQ0ZKZjlUNFlnN1UxWE16?=
 =?utf-8?B?ZFNsZGlKeXBlUVdKSVFISGdzbStYRUZiRWpZTCsxMlN4dXg2R0RRbjRHY1NO?=
 =?utf-8?B?WThmN1JSaUVubFkrdGVjTm1xQyt6clI3OTYrV0tRd2JWZDVseDFlektTZDBz?=
 =?utf-8?B?WUxXVjF1QXpWb21VQ01VNzlhekIyTExRZ0hOYW85dmQ1Z1ArN3BCak0zRldh?=
 =?utf-8?B?Wk01S3Q2dHE2NU9SazB5ejNUaVFzcjUyUGE4UWNmRFlXN1ZnQmIzRW5ocVV4?=
 =?utf-8?B?QTNCTDZ1c2lLRHZtTS9ZaDlpbHF5ekY0MFV5WUtJdUFJQUFmdVhJdjh5NitX?=
 =?utf-8?B?R1NmMVVScVJlZlJ1RHJPYVB1OHF4QTVpcm16b293R21RNkw1eENPL0dRcW5C?=
 =?utf-8?B?UzVndkU2KzlaeEJLbTl1b0NOUDFvS2dNRE1jNUN5Z0QyaHRYT2tJUFVLaHBl?=
 =?utf-8?B?VXlMTUdWZzhvdE9UaUdDeXlrZ052V3lsQkplUGVaNUg0dUxwSm0vOTVMNTFm?=
 =?utf-8?B?Tk9Nc1BuczY2cG9pUmZZSUg0aVJITXRKR0pOV1pzS2hNQk5hcDN5MUdRT0Jt?=
 =?utf-8?B?emozeCtYVmNhd3VSVjJONUJES2lLRkRDZ1BWK2dWcmFVQi9DUG8vL0tBMEI3?=
 =?utf-8?B?UWpLTXNMRnFQeU9LWnYxR3JjckJnRDFkc1BQVFBKVmIxV0dMeFZuNEMvQStH?=
 =?utf-8?B?OXc1S0w4Q2tMRDkyTk9SelZtd1JSRGZtMmh1TDIybWFTR1Y2UVFDdVhFdW56?=
 =?utf-8?B?VldCNjRGOWVrdERueWp2ODMrbVBQbmZoSGVMOHlhWXFxTTd2SExucVFQMDll?=
 =?utf-8?B?N01LR3FIcks0a2pFcmxhTUFvN0lYTUVxZUF5ZFh6OUdKMVY2UjFndzNHTFli?=
 =?utf-8?B?eUFkTHpkWVdXQjNWa1VDWVplY2YzR2lwemlOLzhIekpWMXg2bTRFVVF2VDRo?=
 =?utf-8?B?eUVzUWM4bnpEK1RXZlNEbUovZDczMVBOK1Q1bkMxYWNHWXMrUG1IM3B6YWNt?=
 =?utf-8?B?VVp0VWV5eXE4ZDhSdmRscDNhTncvVmJZdElzeGJoeFZoeGlqWThLb3pWTHNZ?=
 =?utf-8?B?NkJRc2dYaHIwU2tHc1JxVUg4NEVUTTY5OHQrODRWb1pHVlNBUGJ1WDRPNjla?=
 =?utf-8?B?dVEyYm84dVZkd1ZmZHo3RWZQZDk3cnlIUFhGY3FqdksyQy96alpGZUNoREdt?=
 =?utf-8?B?YXB3SmNOby92enRFMlQvcWJXNUMzZU5sQ3F0RUp6M0F6YVNuOUxwWE41eFZH?=
 =?utf-8?B?cFJ6ME53cDk2bENGVlN4ZDVTKzJDVEU2U1locjdNU0J1bW9jK0lZSUFJMXJ0?=
 =?utf-8?B?dThEend3QWxjS2l2TEgxZmFIOGYvUjB1ek9MMC9URXpjV3hoaU1ja29qdE90?=
 =?utf-8?B?TnhtMUJKRFJMRW5CcDkrM09VejBlNGgvVmR6OWFHemZaUjZJdUc0TDdudHl6?=
 =?utf-8?B?dWdraXkyTURINm9RL21mWVVtY1VOTFdHYkFaSjNtSHNSc3hxRlBDcHl2TE9z?=
 =?utf-8?B?ZXhNOHFIdUoyMGQzYTlscXNMU1JaWHFsR3N0bU9lV0JXWGJLUGh4RHc3ZHQ1?=
 =?utf-8?B?cjIwMFM0VjkycFQ1QnRwNUlsVFJ4RjFKNTVmZ3BHUmtFUndsN1FPek1YV0hi?=
 =?utf-8?B?U2RCTlBtbnM0OTRsa2d4a3lienFOWGFzSzNqM005a1lIclhkL2ZtYVZNbXho?=
 =?utf-8?B?ZUxmb1VGcXJCYXcxbVE0cnRyUTdyTHpabGhSRnV4bFRLeUYwZnM4UXpMZ3Fz?=
 =?utf-8?B?aEhFU0p4RnRhcjJ6T1VDVWFIWUVzSlR6UWFZMDJVcGdvMFB0V1luUk5ML1U5?=
 =?utf-8?B?U0RUcXAxbUxPOHdqMWM5czhFY3RRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097a457c-ab52-48c2-70df-08d99d5dd1b0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 17:34:12.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q65rk/smEUZm9HcTWVLTm+hx8dkN084AdIEFFfJe1cJyHU1UhO6WabnWvO0Ahv+cdZ8PUJI1/wJWtP75c2/v8UrO9lDUqsJ7zddL9T+jdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2819
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10154 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010095
X-Proofpoint-GUID: miRE5hBJKyEdv-mxga4-RgFSlmz1WQnb
X-Proofpoint-ORIG-GUID: miRE5hBJKyEdv-mxga4-RgFSlmz1WQnb


On 10/27/21 9:25 PM, Dongli Zhang wrote:
> The sched_clock() can be used very early since
> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
> with commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock time from
> 0"), kdump kernel in Xen HVM guest may panic at very early stage when
> accessing &__this_cpu_read(xen_vcpu)->time as in below:
>
> setup_arch()
>   -> init_hypervisor_platform()
>       -> x86_init.hyper.init_platform = xen_hvm_guest_init()
>           -> xen_hvm_init_time_ops()
>               -> xen_clocksource_read()
>                   -> src = &__this_cpu_read(xen_vcpu)->time;
>
> This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
> embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.
>
> However, when Xen HVM guest panic on vcpu >= 32, since
> xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) = NULL when
> vcpu >= 32, xen_clocksource_read() on vcpu >= 32 would panic.
>
> This patch delays xen_hvm_init_time_ops() to later in
> xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
> registered when the boot vcpu is >= 32.
>
> Another option is to always delay xen_hvm_init_time_ops() for any vcpus
> (including vcpu=0). Since to delay xen_hvm_init_time_ops() may lead to
> clock backward issue,


This is referring to https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg01516.html I assume?


>   it is preferred to avoid that for regular boot (The
> pv_sched_clock=native_sched_clock() is used at the very beginning until
> xen_sched_clock() is registered). That requires to adjust
> xen_sched_clock_offset. That's why we only delay xen_hvm_init_time_ops()
> for vcpu>=32.


We delay only on VCPU>=32 because we want to avoid the clock going backwards due to hypervisor problem pointed to be the link above, not because we need to adjust xen_sched_clock_offset (which we could if we wanted).


>
> This issue can be reproduced on purpose via below command at the guest
> side when kdump/kexec is enabled:
>
> "taskset -c 33 echo c > /proc/sysrq-trigger"
>
> Reference:
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
>    - Add commit message to explain why xen_hvm_init_time_ops() is delayed
>      for any vcpus. (Suggested by Boris Ostrovsky)
>    - Add a comment in xen_hvm_smp_prepare_boot_cpu() referencing the related
>      code in xen_hvm_guest_init(). (suggested by Juergen Gross)
>
>   arch/x86/xen/enlighten_hvm.c | 20 +++++++++++++++++++-
>   arch/x86/xen/smp_hvm.c       |  8 ++++++++
>   2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index e68ea5f4ad1c..7734dec52794 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -216,7 +216,25 @@ static void __init xen_hvm_guest_init(void)
>   	WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
>   	xen_unplug_emulated_devices();
>   	x86_init.irqs.intr_init = xen_init_IRQ;
> -	xen_hvm_init_time_ops();
> +
> +	/*
> +	 * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
> +	 * and the VM would use them until xen_vcpu_setup() is used to
> +	 * allocate/relocate them at arbitrary address.
> +	 *
> +	 * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
> +	 * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
> +	 * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
> +	 *
> +	 * Therefore we delay xen_hvm_init_time_ops() to
> +	 * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
> +	 */
> +	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
> +		pr_info("Delay xen_hvm_init_time_ops() as kernel is running on vcpu=%d\n",
> +			xen_vcpu_nr(0));
> +	else
> +		xen_hvm_init_time_ops();
> +
>   	xen_hvm_init_mmu_ops();
>   
>   #ifdef CONFIG_KEXEC_CORE
> diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
> index 6ff3c887e0b9..f99043df8bb5 100644
> --- a/arch/x86/xen/smp_hvm.c
> +++ b/arch/x86/xen/smp_hvm.c
> @@ -19,6 +19,14 @@ static void __init xen_hvm_smp_prepare_boot_cpu(void)
>   	 */
>   	xen_vcpu_setup(0);
>   
> +	/*
> +	 * The xen_hvm_init_time_ops() is delayed from
> +	 * xen_hvm_guest_init() to here to avoid panic when the kernel
> +	 * boots from vcpu>=MAX_VIRT_CPUS (32).
> +	 */


How about

   /* Deferred call to xen_hvm_init_time_ops(). See comment in xen_hvm_guest_init() */


-boris



> +	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
> +		xen_hvm_init_time_ops();
> +
>   	/*
>   	 * The alternative logic (which patches the unlock/lock) runs before
>   	 * the smp bootup up code is activated. Hence we need to set this up

