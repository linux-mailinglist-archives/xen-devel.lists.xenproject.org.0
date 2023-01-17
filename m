Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4F670B25
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479861.743955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHu4e-0008N5-GL; Tue, 17 Jan 2023 22:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479861.743955; Tue, 17 Jan 2023 22:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHu4e-0008KZ-D6; Tue, 17 Jan 2023 22:04:56 +0000
Received: by outflank-mailman (input) for mailman id 479861;
 Tue, 17 Jan 2023 22:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHu4b-0008KH-Pi
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:04:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67a5a6c-96b2-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 23:04:51 +0100 (CET)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 17:04:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5971.namprd03.prod.outlook.com (2603:10b6:610:e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 22:04:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 22:04:44 +0000
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
X-Inumbo-ID: f67a5a6c-96b2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673993091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3p+t6ZVOvxjY1Cuwg5qSQGK2CeTqrNXupNUGp+51XLw=;
  b=BivX2ErP7KVJXxZVPSTi5EEbSRRRQ2TWsJRAZ842+GGgV65Jz6Aa6cwk
   GI0zx10oWD3iLACaabzsuOcAZBhoVg9RR6x64jmOGKXoAZ6kFyFMStV7e
   qiInBzw0mMz674p+AQJ/6JV+3zHplsUeZC4vPbtALuBXmk5D+KM5Av53B
   g=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 93106593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q4Zvaq/b782dj3ZZ10I9DrUDS3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mZOX2CAPqyONjPxLt8lbdm3ox8O6pSBnYI1TANtqSk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklK5
 cIFOSJcNSypqMap/Oqwdvg1mf0KeZyD0IM34hmMzBn/JNN+G9XpZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWKilAuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqA9tKSuDprZaGhnXM1kFLJzwaXGKx/+aHjWDuW/ZzD
 RUbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5fPnzI2+9FHDxjiq/57AS1Zv4h2NBj76qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y2d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:E7MTQqu+kjbpxwSsnNi6L4va7skDjtV00zEX/kB9WHVpm62j5q
 aTdZEgvyMc5wxxZJhNo7C90cq7MBThHPxOkOws1N6ZNWGM1QfGQr2Ki7GSoAEIcBeOktK1u5
 0QEZRWOZnfNxxTqfeS2njCLz/l+qj8gd2VrPabwW0oSRkvYadm8gt/F0KQE0VwQwVCH/MCZe
 Khz9sCqSDlfWxSZMK9G3UDQqzPodfWkJ7gfFoHCnccmXCzsQ8=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93106593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzUf52PjcxkZTwlSMGgHiPdE4O7IlO366Do0fSlcLUllXQv9N/veRFcTMYC7pNZoibpg0xYYhhy2v3tkpM6hTSEFxbfxTKYT6i9uYoILpJPbr8EzPNxIMY4iBmWr3OfUoJbwmLndEII71DFIwpGLt6uxoacsU9MQun1H3zVOAS0nJLisOGT3yXYoY9ryWMJrSJ5TpHOhU6z91t+JBFU0ygnR1Hx9d5e2cLQu5VbCWLY4pvW5cJXxi4htZP5sIVrBhlS6wA4tuTpb2LhTKsaxK8E+ktLgmvS2uNf1jsaD+btH/bZlfQMjWVxZtdHxFw/UTOf5tBOlUqL+Mn7t7lTuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p+t6ZVOvxjY1Cuwg5qSQGK2CeTqrNXupNUGp+51XLw=;
 b=aZ1xAwbVXQQSPhbtypZe/KwsvjpBav8rC9RI9fNiyJYKskw0OsyYU4yMI92aHQaeqZ9E+jBehf+JuEP5I+o+STmFqUYLx6GkAyvIsP9Py4clpIbuiaxVTOs80WQK1OQtFpt4zM4OdmWgOtQPG03byvMYR/lFWF1Yomv4T2sw5fpAtFAWJbtXiUJZgoqFzs74jrqmgIao6/E+hZNPrwZLo70dIx5oQY462CAx3Z/2OXQGwTqNhATVlmvOS1Wh2b8qz62AWct9NasyvkG18OKsp3dwrh+N+C61bSg/HSghP+OF/Z9xafPMILrk1isjnmBznnx8onAQTdhgkT5m1teQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p+t6ZVOvxjY1Cuwg5qSQGK2CeTqrNXupNUGp+51XLw=;
 b=a9U2u1ZwTBS2/3nbJ4giGRc/oGp0o39GVCwV2ALYWY8GVuNA3Jzkg8wKLL8nQyRAPow03jDFdph2BsHOMEaMp5vCPnSNouosz/LXcNN3TvMZaJdrDMEjOII6+bOel5ZTazwPSpFdbHwafHwN9PVc+DL6ThSUHgTubI0zVQtn4yc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Topic: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Index: AQHY4457jyaOcvAnhkOdTNwMDM8hXq6juEqA
Date: Tue, 17 Jan 2023 22:04:44 +0000
Message-ID: <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
In-Reply-To: <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB5971:EE_
x-ms-office365-filtering-correlation-id: 43ab8f15-4129-4c62-4888-08daf8d6d74a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 L1fCdnw06mre5bUmnjvT5iLWMhkTSJI8cqFgC4GnYXnrT7BrzB8UcWN7fhQssE0e6GUjd+VWJN11ujDm9D06Ccct8YmInRo1EZS7lq5h+9adVdwWozXXTzsedDImjO5c2mzwvQasajrjsmRTlA26v7DtnmKBDQYvhm8fuzQ1/z+MHp5XWxmy5xxW93bQlEfdHVKkYr5t1MsSs4qmcrzotVQU4LQ/4TrikKFd689H4Amj8cWw9mGNNxWs58vk3GQDxbebA3OvObwV0vAUlhkrNbxwsuOdUpVIDep8O0dhnToahSDrc514Gc2tNHHUZQUFD6AyIVtRYF2pl33X2fKmcK7/5E53NcPHXkYp9ymdLih5ygypPPpunVDPu3L34EMyGT+heGJSmoWAN7AyMxsOU9ZozKcy1iMF7IE7jV+tAcTv59hvot04njWvu4aNsbo41V3Nv678sKWmr812DW7tfVA/jpVYhaKRlWRLc7ZYCd6YFaQqkC6mpsMCE6G6uVx8H+Eg/MJ9TBS9YnUhahbcrEwAvp21uJRTEc8opDXUybrWOdDV6O4w4aW9oPirolBFqzJFlMRh2n6OVsC0ZfjE1Ao1vJrRDfiFN8QTBf0m03/Jefb6oaH7Emkq2z3T2fPL901X6U8ozeFWnIzcNuwmBKtghvN8+nfpp3HqT7lEQEz9UjX6YT5gYMX49c4z8eJDwgUFI8gaPLSiSSEF4Hehv2+P0H51fa2bpTCbU21QAKZOBbDzQHomZUU7YAyeQaI//Fk893NeXOOCostmd5Ot/A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199015)(110136005)(71200400001)(91956017)(2616005)(8676002)(64756008)(186003)(66476007)(4326008)(26005)(54906003)(66556008)(66446008)(316002)(66946007)(76116006)(31686004)(478600001)(41300700001)(8936002)(2906002)(107886003)(5660300002)(83380400001)(53546011)(6512007)(6506007)(122000001)(82960400001)(38070700005)(31696002)(38100700002)(6486002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkJGVHNkR1c0cXJrRi85akprK3hLYU9PcXMyT1laVGVPdjBRMmZ1WVljUThR?=
 =?utf-8?B?dGhxU0xEM2czcjl5SUx5cXk2amdwZlJQbkl2ajBqSGhKeEQyekRNQWlBSVEw?=
 =?utf-8?B?cEo4ZThsVXBueGpEcmlkaU9VcHF1NjhIL0RoK3MzL3JFbU12bkJ3K3RlWjQy?=
 =?utf-8?B?cDFMMjQ1WFBidkpPRmU1WFhZQldOeWNNV3EyR3hob2UvTWZBbGtHMWNLSzJR?=
 =?utf-8?B?N0lhamwyNnRWSGhyWldiMWdnRWE2MlVrd3lISm9iSlg3akNmc1lvZzRydDVw?=
 =?utf-8?B?ZEVnbG9UNE1nbVpMZE1tenE1RHkzZ3NtUS9JcUVyZ3JKdDZ5MmIvYUh6aC8x?=
 =?utf-8?B?a0xNYU55dW55cStSNzFUSU0yWFNwMmV1dGFxMHVxTDlNalZSVmpjTzV0dlFy?=
 =?utf-8?B?aklTTDgrei9ZRjZNc3U0Uzk1Snh3cEFIMGY4bzAvV2d0Q0REcmJDR2NjVUgx?=
 =?utf-8?B?bTRIUEFQSm1tWHNYRmdIQmw4eWFCM1pTMktmU2hjc0loRUF5akVyUmtWR2Zr?=
 =?utf-8?B?cmlCUjA3amlhdEwvdGtQYk1IVVpjVk55OFc2Umh6NVkwVzlaeHVhNG5iT1dD?=
 =?utf-8?B?TFJiYW16Wm83QnZISVdPeE9PQ0hwZGhmSFhaQWx5bVdRMzA3S3I5M3ZSWXVZ?=
 =?utf-8?B?UzFaQWZGVjdQc295azZRMkRwdGtVMnF3bFJvU0txS2xtbVh0N1g3clNGNmpH?=
 =?utf-8?B?YWxvS1lEN01RQ2NmRjBMK0FNUm9TQzB3aExRMHBTenAyU285cE12cVlMZWpI?=
 =?utf-8?B?REh0OGhhU3ZBUUhjR2lRYVU5T2VZTVF1YUo3TlhqbTNGejZmZ0NQUHFNZnky?=
 =?utf-8?B?VmtvdUlxUGVWU1JHQ09wOGgvdm81SHNRUDNpbCtwSWNmMkkzN3N1bUtuRy9X?=
 =?utf-8?B?OVc4NjB3cElPTUJnZXpWQmhlejJzSndwYVFNblR1TTI4Y1dhdFRVZm40VEJw?=
 =?utf-8?B?cGdLVzFNMU93WkVEOXpBWXY0UkVPQzkxWSt0Wm1IQ2ZWRSt3MjR0UHVleGV4?=
 =?utf-8?B?cE9TVmxhbHoxWnhQSG43TmQzQlhUT2JLdklrU3pKbFVLV0VXdlNnTk9Ub2c2?=
 =?utf-8?B?ZE9SRXhMRnp6aCtIM1NyNzUvL3FJb3dDd3JnN2ZoRGdkTFNmOEpCMlMvQXUv?=
 =?utf-8?B?ZVZwZmFGY2tBLzMvc0dRdy9QdHB4eGtjbWtIM0RBK3FRMWZFMDM5Znd6amhv?=
 =?utf-8?B?RmhDYUNQMlJWQ1RMdEdNWW9JNnJMSy9zWkJadStia3JMRVhTbWY0Sjd6R0FM?=
 =?utf-8?B?NG5MSkhhbkl6bmZPMEdyZ3RHamFuaHVxS1RMenNPM0Y3Q2xlNlN6NGxzbW1j?=
 =?utf-8?B?SFFIWjRWbEFaOVBsZzNBK3RGZUhKOTFwdnZJdUhZVHg5RWd6QllmcUpKNEZy?=
 =?utf-8?B?THdPQUlyUm5SUndscHFzWFRmVGtkZWpzVHR3bnZpTytWZUk4M1VFc1JuQUdM?=
 =?utf-8?B?S2ZOdWpLMzZHb3BBUldpOXJES2hHQzdsNmpINGRCWWZQTGxMQmVIT3BTWW1U?=
 =?utf-8?B?TXJTSTNxelpJQ3NMUVRnWHFuMG9MQzdZS3ZpTThReWJwRDBBTC9scis5UlVn?=
 =?utf-8?B?RWtiM0paY0FRWmlxZVc3N0FsOExFdFlPcnJkWDhxM1JZY2V4eVEyTERaQXdX?=
 =?utf-8?B?MDZUSXFxUEozZnlESDB0Y1RVR0t2NkYwQVE1c290UExZaS9CZGJlbVkzMHha?=
 =?utf-8?B?M3IvK0JKQWxEeERUSWY2ODlXODN1L0xWc0x3ZmhHUDNMQm9mbXQxVjJYRTR5?=
 =?utf-8?B?ays3WHZTTVBOWkV3eXJ5b3NDeThnSEp1NVFFelVTZFV3NXdOTHRadmtZTFFT?=
 =?utf-8?B?bTlyQTVGUnNQT1JqSitVR2oxM3d5TzBld3BTUldJVlVkL2ZmaUxIVkZwT1R6?=
 =?utf-8?B?OW9DaUErSDd2cFBBdDJUUHhDemxFeUNPalQwaDl4UWEzeS8wWUpwU2RUNGxO?=
 =?utf-8?B?QzRMQmhKQUNGZ3BZVGdxN1FlVkV6UG9jZWdsODhHdVc2OVMvdW9GNGd0RDVE?=
 =?utf-8?B?REppU2dxbkVucFFoNlNhWFUrSDFsQWtyT0xOYmlZa1FCbFZBRE5acWszR3Nr?=
 =?utf-8?B?aU9GNTExYlA3c01xK0IyZUUzeDFPUmFldFg5QnVudmxIdDBMZ0NLRFpwa2RL?=
 =?utf-8?Q?IvzWjJCgCbGFYJQixCZ7tlXyN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90E7C600987F2048BC7261D6EDD00925@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FtCdguUEqTJlki3Eu82jFDA9A/q2uughNe1DHpcxwBjS86X82LJ9kI+csgVcbw//hniafYsieAaZ/uGnHA9Vwb4yakXXW0P0YlTCzMIQZf9dRCVys5Oj0RDstNvF8DyVNxP8l/89+HcrC7EzD+IiVhwzdB/KxWwBhSU2GcQNYxIXj4rmcsPC5zb66OUNjmjAinJ11lr28GN4PzkwQwlFIWu061WdZSf5F2/DRc0Vsg7vj5efQy+2dPmgncVWUvMRWDa6yp5+9uQFXuw9/Un1GK5/7HKjW0d8ZCjzkcL1em6KpN+INph6hgFcB+U8HaAgsMPgdKlxoA4vib39YbiFDCGwoWsKMBI7YUBRfBbD15bFuWEEVxwSawh8afvwRvil8JZCD5EcT0cgdF+x6VofXs8TzoJxQHuUCVOcVjRqFulkoGl15dPvJryPn9fNrBoe1aJWvExRglFJLXA0cCXJ/u7djqkQ7D0HfMLYEPqfXdzaByDI9m5RtoArC3XKvkkz0pnD4DFMG8vdHe40UT1Xajp+nDQuW6SfKt/AkKnp6MY2MfZuG5r8NOEnIbygO3Ou48GCgJrsIjDA6ahF3OzIgpMkNOIoJFsujdT7CwBcZedfQWItCjw+knA0mh5t9AMiwvbXOVuau0bGOjVFzmfbkjxMYWlzhq95+soEpUTLPVt41AjpSLHQ3Hqdvk8ZeXIbO3jHku4knSACbygwVqHCRKISWKU0trX2b874BxPDOVkl6BxgcO2l2OZTQVavjhBSV5DLrw18KUQMgU8iSkQ8zuTHTJauE25ok0N2CX4Ut0LMQ+MrKmDjdyM5WFb62QDfInaCiPWaj2Z0FAMF8BhppW0l58e1yJzUqkB32WzoLYg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ab8f15-4129-4c62-4888-08daf8d6d74a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 22:04:44.4381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Xsf5+sNqkfVD7JyzJaKvcytp8HD955eaDIam9jN2MUK7Pm1A5fDX1IIifH383cojns0v+YXho5bW6ymQaUzhFeCUb+5hPW0za6HfX85oMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5971

T24gMTkvMTAvMjAyMiA4OjQzIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlIHJlZ2lzdHJh
dGlvbiBieSB2aXJ0dWFsL2xpbmVhciBhZGRyZXNzIGhhcyBkb3duc2lkZXM6IEF0IGxlYXN0IG9u
DQo+IHg4NiB0aGUgYWNjZXNzIGlzIGV4cGVuc2l2ZSBmb3IgSFZNL1BWSCBkb21haW5zLiBGdXJ0
aGVybW9yZSBmb3IgNjQtYml0DQo+IFBWIGRvbWFpbnMgdGhlIGFyZWFzIGFyZSBpbmFjY2Vzc2li
bGUgKGFuZCBoZW5jZSBjYW5ub3QgYmUgdXBkYXRlZCBieQ0KPiBYZW4pIHdoZW4gaW4gZ3Vlc3Qt
dXNlciBtb2RlLg0KDQpUaGV5J3JlIGFsc28gaW5hY2Nlc3NpYmxlIGluIEhWTSBndWVzdHMgKHg4
NiBhbmQgQVJNKSB3aGVuIE1lbHRkb3duDQptaXRpZ2F0aW9ucyBhcmUgaW4gcGxhY2UuDQoNCkFu
ZCBsZXRzIG5vdCBnZXQgc3RhcnRlZCBvbiB0aGUgbXVsdGl0dWRlIG9mIGxheWVyaW5nIHZpb2xh
dGlvbnMgdGhhdCBpcw0KZ3Vlc3RfbWVtb3J5X3BvbGljeSgpIGZvciBuZXN0ZWQgdmlydC7CoCBJ
biBmYWN0LCBwcm9oaWJpdGluZyBhbnkgZm9ybSBvZg0KbWFwLWJ5LXZhIGlzIGEgcGVycXVpc2l0
ZSB0byBhbnkgcmF0aW9uYWwgYXR0ZW1wdCB0byBtYWtlIG5lc3RlZCB2aXJ0IHdvcmsuDQoNCihJ
biBmYWN0LCB0aGF0IGluZnJhc3RydWN0dXJlIG5lZWRzIHB1cmdpbmcgYmVmb3JlIGFueSBvdGhl
cg0KYXJjaGl0ZWN0dXJlIHBpY2sgdXAgc3R1YnMgdG9vLikNCg0KVGhleSdyZSBhbHNvIGluYWNj
ZXNzaWJsZSBpbiBnZW5lcmFsIGJlY2F1c2Ugbm8gYXJjaGl0ZWN0dXJlIGhhcw0KaHlwZXJ2aXNv
ciBwcml2aWxlZ2UgaW4gYSBub3JtYWwgdXNlci9zdXBlcnZpc29yIHNwbGl0LCBhbmQgeW91IGRv
bid0DQprbm93IHdoZXRoZXIgdGhlIG1hcHBpbmcgaXMgb3ZlciBzdXBlcnZpc29yIG9yIHVzZXIg
bWFwcGluZywgYW5kDQpzZXR0aW5ncyBsaWtlIFNNQVAvUEFOIGNhbiBjYXVzZSB0aGUgcGFnZXdh
bGsgdG8gZmFpbCBldmVuIHdoZW4gdGhlDQptYXBwaW5nIGlzIGluIHBsYWNlLg0KDQoNClRoZXJl
IGFyZSBhIGxvdCBvZiBnb29kIHJlYXNvbnMgd2h5IG1hcC1ieS12YSBzaG91bGQgbmV2ZXIgaGF2
ZSBoYXBwZW5lZC4NCg0KRXZlbiBmb3IgUFYgZ3Vlc3RzLCBtYXAtYnktZ2ZuIChhbmQgbGV0IHRo
ZSBndWVzdCBtYW5hZ2Ugd2hhdGV2ZXINCnZpcnR1YWwgbWFwcGluZ3MgaXQgd2FudHMgb24gaXRz
IG93bikgd291bGQgaGF2ZSBiZWVuIGNsb3NlciB0byB0aGUNCnN0YXR1cyBxdW8gZm9yIGhvdyBy
ZWFsIGhhcmR3YXJlIHdvcmtlZCwgYW5kIGNyaXRpY2FsbHkgd291bGQgaGF2ZQ0KYXZvaWRlZCB0
aGUgcmVzdHJpY3Rpb24gdGhhdCB0aGUgYXJlYXMgaGFkIHRvIGxpdmUgYXQgYSBnbG9iYWxseSBm
aXhlZA0KcG9zaXRpb24gdG8gYmUgdXNlZnVsLg0KDQoNCg0KDQoNCj4NCj4gSW4gcHJlcGFyYXRp
b24gb2YgdGhlIGludHJvZHVjdGlvbiBvZiBuZXcgdkNQVSBvcGVyYXRpb25zIGFsbG93aW5nIHRv
DQo+IHJlZ2lzdGVyIHRoZSByZXNwZWN0aXZlIGFyZWFzIChvbmUgb2YgdGhlIHR3byBpcyB4ODYt
c3BlY2lmaWMpIGJ5DQo+IGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3MsIGZsZXNoIG91dCB0aGUgbWFw
L3VubWFwIGZ1bmN0aW9ucy4NCj4NCj4gTm90ZXdvcnRoeSBkaWZmZXJlbmNlcyBmcm9tIG1hcF92
Y3B1X2luZm8oKToNCj4gLSBhcmVhcyBjYW4gYmUgcmVnaXN0ZXJlZCBtb3JlIHRoYW4gb25jZSAo
YW5kIGRlLXJlZ2lzdGVyZWQpLA0KDQpXaGVuIHJlZ2lzdGVyIGJ5IEdGTiBpcyBhdmFpbGFibGUs
IHRoZXJlIGlzIG5ldmVyIGEgZ29vZCByZWFzb24gdG8gdGhlDQpzYW1lIGFyZWEgdHdpY2UuDQoN
ClRoZSBndWVzdCBtYXBzIG9uZSBNTUlPLWxpa2UgcmVnaW9uLCBhbmQgdGhlbiBjb25zdHJ1Y3Rz
IGFsbCB0aGUgcmVndWxhcg0KdmlydHVhbCBhZGRyZXNzZXMgbWFwcGluZyBpdCAob3Igbm90KSB0
aGF0IGl0IHdhbnRzLg0KDQpUaGlzIEFQSSBpcyBuZXcsIHNvIHdlIGNhbiBlbmZvcmNlIHNhbmUg
YmVoYXZpb3VyIGZyb20gdGhlIG91dHNldC7CoCBJbg0KcGFydGljdWxhciwgaXQgd2lsbCBoZWxw
IHdpdGggLi4uDQoNCj4gLSByZW1vdGUgdkNQVS1zIGFyZSBwYXVzZWQgcmF0aGVyIHRoYW4gY2hl
Y2tlZCBmb3IgYmVpbmcgZG93biAod2hpY2ggaW4NCj4gICBwcmluY2lwbGUgY2FuIGNoYW5nZSBy
aWdodCBhZnRlciB0aGUgY2hlY2spLA0KPiAtIHRoZSBkb21haW4gbG9jayBpcyB0YWtlbiBmb3Ig
YSBtdWNoIHNtYWxsZXIgcmVnaW9uLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBSRkM6IEJ5IHVzaW5nIGdsb2JhbCBkb21haW4g
cGFnZSBtYXBwaW5ncyB0aGUgZGVtYW5kIG9uIHRoZSB1bmRlcmx5aW5nDQo+ICAgICAgVkEgcmFu
Z2UgbWF5IGluY3JlYXNlIHNpZ25pZmljYW50bHkuIEkgZGlkIGNvbnNpZGVyIHRvIHVzZSBwZXIt
DQo+ICAgICAgZG9tYWluIG1hcHBpbmdzIGluc3RlYWQsIGJ1dCB0aGV5IGV4aXN0IGZvciB4ODYg
b25seS4gT2YgY291cnNlIHdlDQo+ICAgICAgY291bGQgaGF2ZSBhcmNoX3ssdW59bWFwX2d1ZXN0
X2FyZWEoKSBhbGlhc2luZyBnbG9iYWwgZG9tYWluIHBhZ2UNCj4gICAgICBtYXBwaW5nIGZ1bmN0
aW9ucyBvbiBBcm0gYW5kIHVzaW5nIHBlci1kb21haW4gbWFwcGluZ3Mgb24geDg2LiBZZXQNCj4g
ICAgICB0aGVuIGFnYWluIG1hcF92Y3B1X2luZm8oKSBkb2Vzbid0IGRvIHNvIGVpdGhlciAoYWxi
ZWl0IHRoYXQncw0KPiAgICAgIGxpa2VseSB0byBiZSBjb252ZXJ0ZWQgc3Vic2VxdWVudGx5IHRv
IHVzZSBtYXBfdmNwdV9hcmVhKCkgYW55d2F5KS4NCg0KLi4uIHRoaXMgYnkgcHJvdmlkaW5nIGEg
Ym91bmQgb24gdGhlIGFtb3VudCBvZiB2bWFwKCkgc3BhY2UgY2FuIGJlIGNvbnN1bWVkLg0KDQo+
DQo+IFJGQzogSW4gbWFwX2d1ZXN0X2FyZWEoKSBJJ20gbm90IGNoZWNraW5nIHRoZSBQMk0gdHlw
ZSwgaW5zdGVhZCAtIGp1c3QNCj4gICAgICBsaWtlIG1hcF92Y3B1X2luZm8oKSAtIHNvbGVseSBy
ZWx5aW5nIG9uIHRoZSB0eXBlIHJlZiBhY3F1aXNpdGlvbi4NCj4gICAgICBDaGVja2luZyBmb3Ig
cDJtX3JhbV9ydyBhbG9uZSB3b3VsZCBiZSB3cm9uZywgYXMgYXQgbGVhc3QNCj4gICAgICBwMm1f
cmFtX2xvZ2RpcnR5IG91Z2h0IHRvIGFsc28gYmUgb2theSB0byB1c2UgaGVyZSAoYW5kIGluIHNp
bWlsYXINCj4gICAgICBjYXNlcywgZS5nLiBpbiBBcmdvJ3MgZmluZF9yaW5nX21mbigpKS4gcDJt
X2lzX3BhZ2VhYmxlKCkgY291bGQgYmUNCj4gICAgICB1c2VkIGhlcmUgKGxpa2UgYWx0cDJtX3Zj
cHVfZW5hYmxlX3ZlKCkgZG9lcykgYXMgd2VsbCBhcyBpbg0KPiAgICAgIG1hcF92Y3B1X2luZm8o
KSwgeWV0IHRoZW4gYWdhaW4gdGhlIFAyTSB0eXBlIGlzIHN0YWxlIGJ5IHRoZSB0aW1lDQo+ICAg
ICAgaXQgaXMgYmVpbmcgbG9va2VkIGF0IGFueXdheSB3aXRob3V0IHRoZSBQMk0gbG9jayBoZWxk
Lg0KDQpBZ2FpbiwgYW5vdGhlciBlcnJvciBjYXVzZWQgYnkgWGVuIG5vdCBrbm93aW5nIHRoZSBn
dWVzdCBwaHlzaWNhbA0KYWRkcmVzcyBsYXlvdXQuwqAgVGhlc2UgbWFwcGluZ3Mgc2hvdWxkIGJl
IHJlc3RyaWN0ZWQgdG8ganVzdCBSQU0gcmVnaW9ucw0KYW5kIEkgdGhpbmsgd2Ugd2FudCB0byBl
bmZvcmNlIHRoYXQgcmlnaHQgZnJvbSB0aGUgb3V0c2V0Lg0KDQp+QW5kcmV3DQo=

