Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E346BCCC2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510484.788197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckqR-0008OT-0O; Thu, 16 Mar 2023 10:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510484.788197; Thu, 16 Mar 2023 10:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckqQ-0008Mm-TW; Thu, 16 Mar 2023 10:28:26 +0000
Received: by outflank-mailman (input) for mailman id 510484;
 Thu, 16 Mar 2023 10:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pckqO-0008Me-Q7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:28:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4404c276-c3e5-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 11:28:20 +0100 (CET)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 06:27:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 10:27:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 10:27:47 +0000
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
X-Inumbo-ID: 4404c276-c3e5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678962500;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mghS4xM0aRnS3eSIW7z8/ejHHf1deCEAhl4hsfdi7do=;
  b=F9UQfOQW4LAF/ieJZQJYNzhI11hoXVk4jZdzWAZ88K+kjhZQZE/WAr+N
   pPsYfw5C0Gy2i1jfqnk6SVtaDkKBMCwNXwktMNGAzCflEajjqY5nxvldw
   /CoY1ka/rHv7d8uOT73RjW4EqfGduWSeQSZATPqhCWwHSkQOdxReVzfsc
   U=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 101001994
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:46h1R6vu2UbNoCZNNCm4y0kqfufnVHtfMUV32f8akzHdYApBsoF/q
 tZmKT+BbvyDMTTxfopwao+2oxlQupGEzdZkHAc5ryo0QngW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASHySFLZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweClcQDOoq8WMmquxa8gvr5UIAMLqI9ZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60boq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgr6Yy2QzCmgT/DjU3RHmh5uadmHSgcNhxB
 kckowEl/Y0boRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2gheRSN9mSfSxloesR2G2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:nVaOHq4m/uw+4X2ffQPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6H4BEDyewK6yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh4tgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5an854Ed3AUV0gK1XYcNu/0KDwReOALP+taKH
 LKjfA32wZINE5nJvhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbonthrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBKlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpL1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjvkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ2yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBTaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg1HwqV2GLHbQI/xllt1EUuWWfsuuDcTDciFhryKYmYRdPiWBMM
 zDf66/AJfYXB/T8MhyrkvDsqJpWAojuf0uy6cGsm2107L2w63Rx5rmmaXoVfPQOAdhfF/DKV
 0+exW2DPl8zymQKwrFaV7qKjzQRnA=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101001994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4I7juWh3UGPjmeghMwJqWVTqXN3KdenKp2z0nJkHg0RQhqYA4+pwxooEoBvHPyRN1V5EMcxpHzOosw7xXDNXZmMDWDdwiE5K7zosJtHW8F+RBkGftmirNV3Z5OTomZj+BYJesepDLgM5aVrpgexhlxCBtkPxEJVVrIwNGwqXHsUiLNrXd2z34i77OFnrM3gkspGut5vP7snWTEshiXo3zu/gHhEJKWZHHnpyjqJgjTYZp6x+KWPM4Mc/bK9LrAeh6lWV5DysqIGAjDblVHgU6Yoh7qyx35DfAtkFUN8DxPB2sPO3BYbyx9Eg6Dls8uUeJs3JareMan+/i9m+w9Ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7113glDWdr6sAOnYyC70GQuWWDmvSeVudgsaC0z5U+4=;
 b=lxlG7P0Gwiwwp5mi3no4tHRc7poYeIS2MfT6t3evoKm0XF2XsDaZKl2IyTmwIZsfE6Y1rqBjGPa9teNPiefjdu8Dnt4jz1x+dwp6LsJxY7oZxuc52tX41PvfO+B/m0Y+/oRPRajLLrk2ZaVcgctoAgqayZuRg4R3f7YM9VhWf4VygmTuyJxCMHiE3bzxtLGg7Jlzo72pFvXb0l4yTLx8ZpJ7IcimEdEVS9vrSSWrU2fMiq/aNi+Kna050E+IDflN0Q5/hCgUanZ0tWvVjBSCis8Z6BfcNQ+MCY5fPFKENY3mt4jTEqo+KHbbYAvunqEf7yZqA0u8ALKLy3PLa4B9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7113glDWdr6sAOnYyC70GQuWWDmvSeVudgsaC0z5U+4=;
 b=AL7YXAzbOHfhLTy+eHxozxigQpUN2b3PMb/omrTQhgEPzkWxUpNzmVeYN201sHYc/Rc6vvmLHkZNm3xvfCWm4RJpobB+TSVnaJl3C+t3mYRk3gyxwuhkdFs6VG62BvAneLA8hke8NOSb/4MI+Ak/Md6KZ5MkNaia1z3u3wd1C0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d6c4b2ee-2215-a741-a293-36ece4c3dc78@citrix.com>
Date: Thu, 16 Mar 2023 10:27:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for IO intercetps
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230315221003.733913-1-andrew.cooper3@citrix.com>
 <fd55257e-3604-e09b-fba7-bc95d39ce723@suse.com>
In-Reply-To: <fd55257e-3604-e09b-fba7-bc95d39ce723@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4287e32b-3cdc-4591-a93b-08db2609164e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VYH0L8e2SP/qCGbOB6Bv8b23eYMH5kIkU9+5G8ajNAvP7CJmLRTjAVXRKHrgjtbp9L99mRN7mFIVFaXZw+KAVIPDWM6aotUCohYyMj2u7DEkb2i0ZTy9d+27fY76KYsNHYKnOq1JSpi2lbY1Sh1lYWJ5uXzxy+oq8q5WmZZreECyjOBLfFDphrqGiQkcsVoVTbKsxkAoqLRfppuoRl33lHwYE6OFPQM9BkPVauWhTBnmlmspmMhU6ZJpmuEMVCWRK/0b3SF3Dq8hadbJQ+TOggleNYYj05mtF4wKcSdMdLHdHa44L6a32IuCTeRCxITIs1JcXPDPBZNVv3rNqAYb6cpe3xeyPN2ZaMOD3PRnLQnyy98S/JYtSrBQbDEtYWAQiW8e1K+YTSqurRMaNCWDh+DlCYbVmz3PO+hIblqw4F02R+VPhHASXGDDe1pLr0d6iaJ6uVXrUbiAE4vEPSKUpllK0hpsrMrmTepFbg2YxZ/HYitu5Eg7dB0bT5OVQm4EB1/5GjL4ojrz8b9sLA9eFE+zv8vFqNjkhmBmCTukplip/DGFF4q0ysnrNGxXMngkXQNZj4oTEBtW5AExT5eZsDgSgsKTl57JVcMo5+vXwEHmoUkVuPtKWI6uqYZnfW4pTyOPnHYEv8FVIieqoZc7Iwsp6v6LfvadWPayKd3v7TUsxvw/WS5O2ZTFXx2xp7kkeBeNVBuHoLwBLhf69TUrGu0beIuyFo8Z/QRNsWxAGwR+DGG9CsnokZVJRr+dHtk2M1RnMIP86m1sLaWHBLd/XmFoYlWkbNh1c0vwczTzbG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199018)(83380400001)(31686004)(2616005)(66899018)(186003)(5660300002)(8676002)(66946007)(66556008)(66476007)(41300700001)(6666004)(2906002)(82960400001)(38100700002)(36756003)(53546011)(6506007)(6512007)(26005)(8936002)(6916009)(478600001)(31696002)(54906003)(4326008)(6486002)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlZBb0tHK3BOVTRTMkZKNHJOd0szSUt4SGw0WDZkK0VRWjE1NnlxR1JhZml4?=
 =?utf-8?B?ZFp0Zjk0UnNhVWV2SlRnaGFPMXk5RmF0a1krbXpBUU92VXNudGFhSDhoTWto?=
 =?utf-8?B?cFFVRzJnNTh5QitQK240UnhjNXF4TGpkQTZ6aEhtRmtydXdCam1vMFpFbHhT?=
 =?utf-8?B?WTc2S1R1eVhUL2ZMaTRvSWNhSXQwSjNNcHY0RzVFUzZROC9senZCdW02OE4w?=
 =?utf-8?B?MjZJRnBCS2F5S3FGZjJRcE9xUnlITncyUDNDMnI2YzJKc2Ztc2tvZmt4VjV1?=
 =?utf-8?B?a3JpbzBpbHBlNTloR3IraUxmcGxFeklObTRpNnlUazg1bkRxY0RGdERSRFp0?=
 =?utf-8?B?SG12ZzVkMGx3SnFXdWhpY3BpY1dFc3YvakdwTkYxTGRYRUNmQWd1VmJWOWl4?=
 =?utf-8?B?YXQ1Zlh5NzE1eXhaeEF3dmhjbzhKV3pacW1WZjZYdkxGTW1aeFJNQk9YV2Nt?=
 =?utf-8?B?dXRMVE5GNThJRXZiM1E4NGJBSm50TW9ybjZEQWdjcS9xZFo0VklwQ0VwZ3Zy?=
 =?utf-8?B?UTZWN29YN1A3MVlxaXVRTDkxN1luN2dXRE4rdmFEckRqWXlCNTZKZ01RWDU3?=
 =?utf-8?B?NzhYbjMxOU1WRWFkR0c2cXMzbk5MVXp4T1diRUUraU95dVpKYUNxZTFRWWRy?=
 =?utf-8?B?Y3hUeFpFcUFpWjZOeGE0UWc5dHA5WEZzUmx5YjhoMzZuR2JoVkhvbzlUSmVV?=
 =?utf-8?B?NTlZL3U2ODAzakhmYkVnQzdnOEhoMTkvbkRBc0laYVpNU0NOR0tYSlhMUGhV?=
 =?utf-8?B?Zkx4UndSL3pXc3JsQlJ1SE9KTnBNUnhFR1paZ3VxdEhtdTNTRFhab01mVEU0?=
 =?utf-8?B?UjJEWlBsRFZvQXBLUWZTOElFeXNmelN6VEF4YlRJT3VaSk8vMW51b2djN0RJ?=
 =?utf-8?B?U1JWMmprV1p1Q3Vjay9RUmxpbzRVMnAxU2hxQ1hKNEpUSnllbFRQQ05TRWh2?=
 =?utf-8?B?aWIrM2NhUDgwM2o2bng4TGhlazlsTWFkZ3ZpdzlicytxT1FFd3oxOUdGbzR0?=
 =?utf-8?B?NzFKWEp0VkJEeENHcDhnY2gxR0RTTnZhd09RRUY2NjRJQllmQzJGWURKTGsv?=
 =?utf-8?B?SGFHWURrTXhiQ3d6STZiNGU0Y1FtczJXL05YYjgzSWQrNVpNbTFFZ0Njc0xT?=
 =?utf-8?B?U1UrU2YvS3NFbElMaG0wU0FJTVZWK2RqSCtiOHNtNkdCMEZBTDUxYWRqT1Z6?=
 =?utf-8?B?QWZ6SmRwdStZeXFEcGJqVUNhcDREV3RIdTdMaE9ZTFdUbk1oc1lTckRpWnB5?=
 =?utf-8?B?Z25KUDFmVnVCMWJzRFBxRkJ1dHQxWnFOWUVxeFNCelMvYkFjcHhQdC9tZFpS?=
 =?utf-8?B?WVFxQjl3aHV2RW1TQStVc3pDZ1ZvaTdsUzErZWxLRUFFdkV5RkFCSnVrV1Jv?=
 =?utf-8?B?b2wxNnplTGhnRUhlQzJleXcrZG9lLzRxZmZMWnM0QXJvT3lJUmlDNlJEZXZW?=
 =?utf-8?B?SWxxYTJjcHAyYjVEYklvVytGbmx5NmlwaGdNUENIUWt1Q0E0ZnJoUVZjTDJo?=
 =?utf-8?B?UXY4WkNubGg0QkxkNytwNXhqSExhWjFrUFF6SWUvWUEycXB2Z0p3SXE3YUwz?=
 =?utf-8?B?dGpWV0oxMXdrSXVaelZXTVZrT216RlYvVFZHSVR4ZTRsTkJjRC9zMlRoaU42?=
 =?utf-8?B?RTRtMW9xSjBPdlZoNFFSUkRqcTdEOVhPVXQ2c0xXMlRkUllWY0hVYUhXU3c2?=
 =?utf-8?B?RGZhZGxMa0JTZEpYM0ZpZjlvT2E2aDJoaVlsTTdFSUJTRGd1NWNhZW5ZV09V?=
 =?utf-8?B?TVFZSlEyeFRoUDVXU1pmYnZyRHpIUTlLNWpnWE9TY1diQ0FiSEpYM1BGSkxJ?=
 =?utf-8?B?akozTnRmQ2FxRm5MR0hUOUxsTGx0M1pUMEd3MjZic2JISEVoVmpkeUtrd2pI?=
 =?utf-8?B?RHZvOTkrTHpKc0xvTlRtNmxIS01JSzhRb2VHQndZUCtIK0tDbXdodTVmQm9j?=
 =?utf-8?B?Nng0MEVwbW1sRnFLcU80aDNRSnhsSDUwcXFCWU0wTVR5K3E0cVFUZ0NjZzlW?=
 =?utf-8?B?VnhkdUlHYmxxZlNqNlBGb0s0Wjc2VDdWTHEzZ0xkaUdHaHBIZEV3emRUQkZy?=
 =?utf-8?B?Z1dGWGIydDBIL0FhbWxrSi9Cd3Q1V1hzQkVaMWJjK2t0VVFRYTNhQlZScGl2?=
 =?utf-8?B?T2QxWThpa3BEN0cxUGdFUVVpL0VBWjhaVlhhbTk1NnJoTEFLVGhScTFDTHNO?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PpLroF5gkdGNeaw0rq7j0tEoEpa3M1FUhH7lDeq+Hw/0eXKo36hfHY51Te8FsifInB6+uVcSXuzy1Jm6laJmq8KvrB6OqOKdF2EtWws9VeCQNxwmjrvrd9cw5sP3nd9L9LjPat3mDzLrl3R8lm0EhvF6mc5pt1Rei9wOXjkH7hwOsZQ+oIKwNLwuRt4d884o3BNFDDOiYOL462iU4ZOhcSGzZd3+TCSNDvbWzpWH+hjZBK+nCFu3gP55xIYGWUIhEnYoLCSGpahhrgBSrI7gRfRVICO902hpVjn57urxd73XAWXUtFPdfdUefOmrje5DVxEytLFLBwIu5WHRLaYGdpu9OqhGu6eCeUCGTWdMiS6PFPFJAZT9VpcAqhM9q0g8qSAqMQGe1WIYhmtELLy888JmaQ1Hxs7iPTH8q3guCAo3FW63tpkter/1WSR30S3zKrUzC3svTf4HBCSdRE+tEU4H5Gui562x1t9tBGILBMrIxshxLo54ckEqgT1C8D3tCEF9guUI8sDCsZFlwzdz2Do3ch/zJpCX/7/IaNPagR3pK7Yo5I/YVRxnViM3tokuJ12v9GMwx19NN0i6XVvIfK1FI2mab0QTuZ2N5CnH5HrWWVTAzNpmCLWfOPDdufo7VT+1WCCnEuanP7wEJs7xH8Y79FNUVLTd1TNWUxuQaXcgPhLqcinpSXzNSjBERrYMmY6QD4KRZ6xBEPdKyA03ZeSRBLYzm4ConXcu4+bTHpdV1eXDfClkT17xUiQuDfMJnYGoIjzJzvn1nWLIbUWqDaJTFm7g3T/s3q3qYwxDZVhEVkCYb1f3n/i9lGm7EOhj+EW183q+D0XGiW/XCWx1cQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4287e32b-3cdc-4591-a93b-08db2609164e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:27:47.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smvTKJqDJMCQfPcxQ9iuJ7uQb4Cs5/8Um9dLTev24sTFCiFoyF4ilpdRI8DH93aJgIlezgi9gWl0Jr1DoAd3pt8UKmJmHeSCuGMKfZe98O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944

On 16/03/2023 10:19 am, Jan Beulich wrote:
> On 15.03.2023 23:10, Andrew Cooper wrote:
>> This removes raw number manipulation, and makes the logic easier to follow.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Although looking through the emails on list, apparently the vmx side of
this got missed.

They're both to simplify the current monitor patch.

>
> But I have a question:
>
>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> @@ -436,6 +436,20 @@ struct vmcb_struct {
>>              uint64_t exitinfo2; /* offset 0x80 */
>>          };
>>          union {
>> +            struct {
>> +                bool     in:1;
>> +                bool     :1;
>> +                bool     str:1;
>> +                bool     /* rep */:1;
>> +                uint16_t bytes:3;
>> +                uint16_t /* asz */:3;
>> +                uint16_t /* seg */:3;
> Is there a particular reason you comment out some of the field names? I
> can see that "asz" might be a little odd to use, but both "rep" and "seg"
> are imo fine to have a name even if currently there's nothing accessing
> these fields.

There's not currently used, and in particular asz looks hard to use as
it doesn't appear to translate nicely.  Also, I don't that seg matches
Xen's x86_segment_* encoding.

I can uncomment them if you'd prefer, but I thought this was marginally
safer.  I suppose it doesn't really matter.

As for asz, I previously had osz to match before renaming to bytes. 
Suggestions welcome.

~Andrew

