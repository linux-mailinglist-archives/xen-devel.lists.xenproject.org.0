Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D064E030
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 19:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463694.721930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5sbr-0001Pk-4P; Thu, 15 Dec 2022 18:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463694.721930; Thu, 15 Dec 2022 18:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5sbr-0001NE-0o; Thu, 15 Dec 2022 18:05:31 +0000
Received: by outflank-mailman (input) for mailman id 463694;
 Thu, 15 Dec 2022 18:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cY1j=4N=citrix.com=prvs=3418b2cde=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p5sbp-0001N8-1N
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 18:05:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0afb07b8-7ca3-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 19:05:26 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2022 13:03:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6227.namprd03.prod.outlook.com (2603:10b6:5:358::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 18:03:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 18:03:49 +0000
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
X-Inumbo-ID: 0afb07b8-7ca3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671127526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4XNR+alXATVWQn8J4BXyivnxo0hcURVZHImvzjEVV2M=;
  b=b7Xc33Vr+KOsIRnFynPshBTLFxCqSI1oZmLoREIrhiM2Evb86vshwWq+
   vcCYG6OGmkYsjALCUXYccl5J2If1n7OS62Nh39CrTel3jtuNuINLgVu5p
   j7tLD4GgdbzMDBpsyMTINkJAFB7q2OKdBpPjbbwJagx+gySo2SERWbV8c
   s=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 91089344
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S3Foaa+1bZyQO3fSbG5rDrUDvX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DBKXW6PPfrYMWTzLdF0Pd/lpk8F7cTUnNBqTQtsry48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kW5AK2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQ9
 tVBMhMyKSmTju2RwYm/RcMyuIc8eZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdtKROzjqqICbFu740EcNSwyUmqHnOCYoXeeZ4lFM
 0A3w397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/QeDC3MECD1cbdU8nMs3QzUw0
 RmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYMzL6n8Evbxjugo5nPZh444B3NWWCo5R8/Y5SqD6S26F7Q4PBcaomET0Wdu
 2Qsn8mY5foJS5aXm0SlW/kXFa2u/LOJPSP0hkYqG5g66y/r/3+ldJpXpjZkKy9BO8IJaXnjb
 UnVtA554J5VNWGtK6htbOqZENgnw6HmEpL+SvneY95KY55wXB+G+CBodQib2GWFuE0ljaE+N
 IrdacGtF3cXE4xjzTy/XeBb2rgurgg7xGDeA5D8yxGqypKaZXicU7BDN0GBBsg+6K6HuxnE6
 NZ3OM6DyhEZW+r7CgHI9aYDIFZMKmI0ba0asORSf++HZwBgSGcoDqaLxat7ItI12aNIiu3P4
 3exHFdCz0byjmHGLgPMbW1/bLToXtB0qndT0TEQAGtEEkMLOe6HhJrzvbNuJ+V2nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:LjHtTq85cdd9ZgvpNCduk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="91089344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7fQt9ukCMdW8BSqg1QUhyUTlUBzRF43dTGINGW4VLt0Cr8XkyFwtpNJvBV7PnsdQOhQ88PW7WlAwb7zH8cfw4Vb/P9h/90ysQAiXkbLi6wVzSPWZez1blYggKVRNHLZAlWw3K109uhRJaq081QnnRiVy+yhLUYJC6NavT+GI5694ks3vo5rVPDKrYh3ejhK318e4u+5PM9cO4FOdZzPTpFSIuR7Tw4QsldHuf8ASeyA01SPl9OZj8kdn/ADB3YXeufkPcrLVXfBhPpaLpMDdgycYsCSM89bSZYkTUWYrYuSXmYroCe30OBcOTR/dgPg15hp2Q0BGzbIhcNnAbC4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XNR+alXATVWQn8J4BXyivnxo0hcURVZHImvzjEVV2M=;
 b=bT9v3pF+6BFRNhAYg0VZ+ZDBUnoj7BjWeLqzHBOf4/YQnPe60AXpbqa+rxQCUJ1pcUjaRSyF4y5zRJNlaIqEhKfaFDOg6gz/1M/PlsYzoL+SwQHjb85lkpcY/81ugAwUYhXwvfemCQBNPnFhmYEIovd9x6RkzqrUP8vY6wBKntIWIxzv9/VYqQKqxXTjXII711C5JlA9GlsfhG8odtVcMj2Wtm9ZFYKjTOwBgioH+7+U+gdM1QGlV1Cz7c0g5AZBs1AilyvjKYSdHd1HxVwyFHa3EBUcTu328YM7R/TrwdqdzHP0Nw1wzjn9RZs5xnBKVWkb8q1e68IL88N2xJCGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XNR+alXATVWQn8J4BXyivnxo0hcURVZHImvzjEVV2M=;
 b=vLZ/yvEYfvK9cZxUgsQUxTZ235MATPbrIMFLJ4c1Zw7SHiL2/bEXp4AaAffbXxGKRKSla7pZ7AuintAE5o0u3FPbRHEbY2r5Kcq678ZzV+ep8jmtDRpAQSrPHa2BVuRP5+8OZamAcknk16V7gFYKHxYqZmWeDmaTHUsrchnN2ws=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>,
	"osstest-admin@xenproject.org" <osstest-admin@xenproject.org>, Vincent
 Guittot <vincent.guittot@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Topic: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Index: AQHZEIm2pBLpcrFxWUiesl94gtQKma5u9s6AgAAXKACAAB2/AIAACe4AgAAIcgA=
Date: Thu, 15 Dec 2022 18:03:49 +0000
Message-ID: <55a83500-558d-0134-c63d-aa37bf44168b@citrix.com>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
 <Y5slue6ujqmCscJd@perard.uk.xensource.com>
 <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
 <e8988370-f838-dd23-729f-892561f54b58@citrix.com>
 <Y5tabu1WUgS6sTNq@perard.uk.xensource.com>
In-Reply-To: <Y5tabu1WUgS6sTNq@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO6PR03MB6227:EE_
x-ms-office365-filtering-correlation-id: e2bb6e15-848b-4f86-885e-08dadec6b79e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 idQ9tcdOYFPCdjsV0znLDMfJmsYtEuE0XD/QKcq6OOSOHh+vjogiK7Bmj5gEq/qv0Bu/jXrnaroJV7SC0d6fAhiho4tsZ/UrQzDTOlC+rVwkiL4/jIxFjeoizTp8o9c1RcCN17T3E4VGWVn0QvvEhesj4FDzWeNYGBctx4RlsX9FJgu1HMa2dgyMud/wJbSTc0JLx2kYQXYJMDSnw9eC6DBfurzmTjz2Xf3s8lNEXDcMFv/4f8QbOskBu49ESzpk78kSJXhsM8rrM9MIt8DiERG5nVVJaw+zXA/6zz2twf/PoKO6EmBTCwI176HIKtvBwpntjf4vC5uD+UiZ8oX6KBWswKd+IThYHLFi62AoNJgBLKajxniNo5zSF/9OIf+DUXGLtqFovLXoi/c6DJJmrTdHc4V3J+I5UXyKFff82TXjwSzEB4TLSuGhAj2tn0G2YFJ3GXCwS6DEA5Yv3TMFC4rqiLPG59ChO27IBzUM7XfoZ3EA0y7Y+Dh5eEgm52JSgGtrJTgYDXJD1b6j2faZIIJVhgZo+7fyvfeZovmmEOhLCgORMY9BbVk4pKNxEhfxj1DclCcH6yI5AJlvIp5kbryZVbpbsuhC6fm0ukTiL8IexvIYIYK1relVaheMvKunm7XL6J6ggIuMJ2iwdzDnVaedczYTk2umyKppgHlAH7Bilssk99RLd5SZU7hb2mAqUk51arF+cPs3yN3GCG3Xomn/2cU0zccdn7V1gqsWvMVkABxeyzZYpzJjaCLMYOqaRU13Hdu2GPFFxDZxhDCYPg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(54906003)(6636002)(37006003)(6862004)(8936002)(41300700001)(4326008)(2616005)(8676002)(66446008)(64756008)(76116006)(66556008)(66476007)(5660300002)(66946007)(316002)(83380400001)(4744005)(91956017)(7416002)(36756003)(2906002)(38070700005)(31686004)(31696002)(86362001)(478600001)(122000001)(186003)(6512007)(26005)(82960400001)(38100700002)(6506007)(6486002)(71200400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elByYWFYRFVyVDNvRGxWQjZZWlJ1bi9aTStiYkZDdGg3bzhjWmtGYjVjYVRU?=
 =?utf-8?B?UWgvYUxtQ09sUEtMQUJOZ2ptR0lSTm0vd0pQdU1mREFjRmlMUDFZd1Exc05X?=
 =?utf-8?B?OGRVbXk3UGNYZFh0NEJpUGdLYUtCUllPOFNLSjRkNFE5WElxbG9zRyszRWEw?=
 =?utf-8?B?ZGNBZGR1cU5jdTB3QjM1bWxLY2ppbm1RaFBkSTV1TVluY2NIMDMwK3l5YjFk?=
 =?utf-8?B?Mlh1Z1ZxeUlBR1ZBMjVQN0tobzVlYzZaN0VoUjlYNzJUUmQrWk1kWmcvRnQv?=
 =?utf-8?B?aFgvVFI4d1VpaGxDNU5ySHNWMm92WW03Mnlid1A3aU0wcDlYUEYyMkxaY0pF?=
 =?utf-8?B?Z1ErNEdXUXN5aTlwNTduV1dmRzAvSCsyK25SdXNPYW5VZjZKdG5oMS9pTlJr?=
 =?utf-8?B?S1JvcExZbzE1TTYwc0RodGFFTjlIUWtGRUFvNW0wWFFKSks3dXIwNGQrT05t?=
 =?utf-8?B?T1QxTUVuOGloYVh0eFFza29mc01GdVovUDRubktIbHNPRDFvQy9JRkNCMHFT?=
 =?utf-8?B?N0d4L2FCQWtiTm9aU3J0YzZ4U2t2NnpETTY0VDk3a0FCOFZscTdIM0dPN1RD?=
 =?utf-8?B?eTloWklRRmJySTR6NUVmNlJhWWE4MUV0Uy8xSEc1T2RXMFowd1ZxZFhJSmZx?=
 =?utf-8?B?aVRLRTZ2ZDJ0RTlNRDNPVVFhS29QODcyWXNPQTl3R0gyOW9zZ3dxNmh3cG8r?=
 =?utf-8?B?SENhbHFWSGVoeERmZXMzc1NBd0ZkZW5IcjRjbUR3R0dGb1RPT1l6LzRxalZI?=
 =?utf-8?B?WmJZd3hibkwrQ3UzVW0zS3FYd2NvVEZVRkUydVN2dVhld0U0S1VSVG1IdXpU?=
 =?utf-8?B?YzNCTHV2czd3TkFmcVVxdVFMREMxdHJ0cTBxZVpmZEVRQ3RXSFBFdk1TT05R?=
 =?utf-8?B?Rzd5N0kvc3hzOE1RVDlZNi84cUV0OFFhQTVGSWZ2dE1lK0F5VXVkODZqd3V6?=
 =?utf-8?B?Nm1VaWRRbWNOSm5TZjFCTFRyRXlYc1NUaGtXVm0rTWo3NFgxaFpDUG1tWkdz?=
 =?utf-8?B?M0JIcXYyV0VlTHB3QmpmaVNMTWVMMzI0Z2pLb0NJUkQvcitVclJFaTlVOXpH?=
 =?utf-8?B?am9HOExRb3hEOXIwbmc3czh1bzRXRmZ2WkpHWmo5TUVtMFZrUXpYNThManNK?=
 =?utf-8?B?YUhWMmVYbGJacG9NZUVJcHpWT1g5SWhBN3BGRTBMVXVzQ2dQbWVFVGJzWUNH?=
 =?utf-8?B?ZXByQ0dzTFF5aWZVRHc0R1E3czlSTlBBK1BJYlVkSTBxSlIyb1hTWjlid1NZ?=
 =?utf-8?B?TDg4ekFLT0dlZkJoRnBSNE5ZWG1JQk1LTFdwc05CV3R0VDY2UFZGVHdOVUtI?=
 =?utf-8?B?SlV1cUpXczJFSUdaWWdDOXUxSHp4MHhMN29TNkRZNUxPeW9PZ3o4ZWZYU0Fu?=
 =?utf-8?B?Tm8rRVIxa2s3ZHdrS0U1bkM3OFgvVGNSdW5wTEVwKzVvY2s4dVJMZUp3ODJI?=
 =?utf-8?B?S05rN2xOTnYzclh4Yy9aV0FDTEswbDU0eFArdEN2NDBKa0JHSmdGT1dmcnFy?=
 =?utf-8?B?ZU1oOGpmWG1jNVZReEwvdWRwUjBieFljUXZtWEl6eUZCdVVrWTlMTXI0RTJZ?=
 =?utf-8?B?QjQ3d1k3OGE1WFBQOFpXYjJCRTBtY0JrRThZaWQyZWltQk1TSkJPeHB0dG9X?=
 =?utf-8?B?dlZ3TitIdE9ocTlZWEF4SzI0UC9zM0pxSE16MXFoYUpPeWRRaXFzREF0eU92?=
 =?utf-8?B?RWI5VXNWTzUxYk96V1RWbExKT1I3dVZWRzFkb0FTckVCYUVnYTVvVlZveTNH?=
 =?utf-8?B?RnRMa1c5aGtONnl2Rk5TcU9VTitnQXpWUk51bWk0VG5aT0ZpYWxLL1ZzWGQ1?=
 =?utf-8?B?d2hwTTU3ZjNXaHZQczBDc0pPS3BqY1F5d090Uk9NUU5JZGpOU1RNL0M4Tkd6?=
 =?utf-8?B?L2gvdnloaWp6bVNzNno1WHYyZ2ZTcEVLM25iaURsVWZLVVZWZlhKejJNZlND?=
 =?utf-8?B?eVJ4aUlhVzdMakFPSHgwQ2ViWnRZOXBsQnNtSERraVEySlk0WFluNTc0Mkxl?=
 =?utf-8?B?aFBId1NjM01XbTJLREU5dDA3S1Byd0RoNDF0aWFhM01WeEJrdXFTV2hLbjha?=
 =?utf-8?B?aHg3alFQRXR6cC9ucWl5T3pLdzNURWNyeXlvTCtpNFlnc2FzQjI5YWo5b21t?=
 =?utf-8?Q?r1yLUXQBTjnFpxo1xsEnDLwyp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67F69570B5F5E54385393C93718438D8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bb6e15-848b-4f86-885e-08dadec6b79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 18:03:49.1701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSD2WGYBYh0Hf4iEjNBd8pdqKS/Zg4mZnJR3GIuNMZ0pZVJfRj57oI3OoW8IdmPWc2zZR3DOKmZCJTmmGta3H26Ek30X7HGCXK0zR5fKxgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6227

T24gMTUvMTIvMjAyMiA1OjMzIHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gT24gVGh1LCBE
ZWMgMTUsIDIwMjIgYXQgMDQ6NTg6MDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IEEgY29uc3VtZXIgb2YgeGVuc3RvcmUgaGFzIHRvIGNvcGUgd2l0aCBhbGwgYmFzZXMgYW55d2F5
LsKgIEFueXRoaW5nIHRoYXQNCj4+IGRvZXNuJ3QgaXMgYnJva2VuLg0KPiBTbyBsaWJ4bCBpcyBi
cm9rZW4sIHRoYXQgZ29vZCB0byBrbm93IDotKS4NCg0KWWVzLsKgIFJlYWxseSwgeWVzLg0KDQpU
aGlzIGlzIHN1ZmZpY2llbnRseSBiYXNpYyBzdHVmZiBmb3IgdGV4dCBiYXNlZCBBUElzL0FCSXMg
dGhhdCBpdCBvdWdodA0KdG8gZ28gd2l0aG91dCBzYXlpbmcuDQoNCj4gIE1vc3Qga2V5cyByZWFk
IGJ5IGxpYnhsIGFyZQ0KPiBleHBlY3RlZCB0byBiZSBiYXNlIDEwLCB3aXRoIHNvbWUgYWxsb3dl
ZCB0byBiZSBpbiBkaWZmZXJlbnQgYmFzZSAoYXMNCj4gdGhleSdyZSBhIGZldyB0aGF0IHVzZXMg
c3RydG91bCgsLDApOykNCg0KVGhpcyBpcyBhdCBsZWFzdCByZWNvdmVyYWJsZSBieSBzd2l0Y2hp
bmcgdG8gLCwwIHVuaWZvcm1seS4NCg0KVGhhdCBzYWlkLCB4ZW5zdG9yZS1wYXRocy5wYW5kb2Mn
cyBhdHRlbXB0IHRvIGRlc2NyaWJlIHRoZSBncmFtbWFyDQphcHBlYXJzIHRvIGJlIGFtYmlndW91
cy4NCg0KVGhhdCdzIHRoZSBmaXJzdCBwbGFjZSB0byBmaXguwqAgSSdsbCBwdXQgYSB0aWNrZXQg
b24gZ2l0bGFiIGJlY2F1c2UgSQ0KZG9uJ3QgaGF2ZSBlbm91Z2ggY3ljbGVzIHRvIGRvIHRoaXMg
bm93Lg0KDQp+QW5kcmV3DQo=

