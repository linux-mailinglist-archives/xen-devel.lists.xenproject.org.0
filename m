Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7BC69E5E7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 18:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499097.770123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWNp-0007wH-EZ; Tue, 21 Feb 2023 17:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499097.770123; Tue, 21 Feb 2023 17:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWNp-0007tr-Ah; Tue, 21 Feb 2023 17:24:53 +0000
Received: by outflank-mailman (input) for mailman id 499097;
 Tue, 21 Feb 2023 17:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWNn-0007tg-Vr
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 17:24:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a475ecfe-b20c-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 18:24:50 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 12:24:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5428.namprd03.prod.outlook.com (2603:10b6:208:285::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 17:24:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 17:24:43 +0000
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
X-Inumbo-ID: a475ecfe-b20c-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677000290;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Cjw+4q3s9dMqWHqaE/OpaprXq9r1/fGZDGw7AGy2+JY=;
  b=ciAaYURoI1sPdhj3/zQlBjOqTCGcj6JGhu6EwPolIJ0jUoLgqWpu/7oz
   lzNmeaQbxgZrvDu+q1wONKHPRr6/wTAKqzKeIKtNlvlo+JkkAv7D979mm
   En3lFhcsFbl+Ltd+/PVvzXn7yK4LXrDDjTViXmxdx7JEYl+o5R76xu8V2
   I=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 97943639
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:h5XZea0+ir5zfoVYOfbD5ehwkn2cJEfYwER7XKvMYLTBsI5bpzwBm
 GcWW2qEbq2CNmb3ctByPoq/9k5TsZOGzYNrG1Q9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXGRvt
 vMpIQsxfBW8nv/x7ZyJZ85Kv5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1QZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKkCd5JSubpnhJsqEOT3T0OSyVLb0eAn8CUrlGAYfh1F
 3VBr0LCqoB3riRHVOLVVQCisneAuRIbRNN4HOgz6QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseJNZlfXwEDD0h
 jyP8i43guxKidZRjvrju1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:smz3TquNp7r3eajNfbvAcqvr7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97943639"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSRFhh+vwgkLkBtbQzNRyHlHcV6oCqFBXX4rQOk8z20/lbGpHXSgNPWOUaTZI0oDooG+YeyivfopFOPUlxh7WXiZUQuUhxsGe9lxO5NE/k/tqo9dOYVCb5m10gkenpJkmlUZgC7hy19tSJqukg/32N7lftk0V/fw5y0paHrEcgIgCoHAoEVvpi/ASbXRiLJQ1aiiZw9wIdVOcDC8bH5IFdO77WvwUM9iBy2XFPsrpbeO0TN8AoJFTQKRXk7Pf0J5KULUGyQfVmv7aCRap5s6HLtLgLLVWbzIMJp8SqkaDZjewdEZLgwmLqAFFHfjP/Cxt7ZGthGYjnELVkHnL6+0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjw+4q3s9dMqWHqaE/OpaprXq9r1/fGZDGw7AGy2+JY=;
 b=Psz+PfPfJmSGl335fh95mS2+N870R5GYJcep1yQesSwXYBLs5IBJfrBI1Sb6YP1J+ECcGgr2umLg5nO6PZfJzb1phUSPJ/570GN2nelG+on6ZMMJ5dRrWzu2UjrCOIB/Jk0XYlItxHvGXwHyGI/v3WAswWkLHFn3RJI7QLSQQ2v2SuhP6KIqhoYvlr59+AXvsSA4akPCUZ868Bjax4MtfBZrE9qgY2KcTcF3RpC2q5DG0tyXke2UE87Oj5RXAlBTB5OPt9e2nwVEiCZEdo5qZC5Ww0OxCo6CeDUKBbcVT0Kzil0qkW87s37QyXsFaQMJMOrOWf8K2kYiqGXNRqmlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjw+4q3s9dMqWHqaE/OpaprXq9r1/fGZDGw7AGy2+JY=;
 b=oVnbIZc444xtsvPWlg8HYAehmiCQwd1y+YAoKWci8GtIOyEAG4ylz+mLeQTrDMKLbJ52ac/UNkkKqP0Nxd8SVvaroyH2GyoUWqpPTyCJEUAe8IWNG+8SI661zzN31V5g++U1+2GBGori/P2VvJsE8PdaeSnvyXDppDzlPBzu1Lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7d3514ca-f557-3c1f-3a62-3ad8695cf5c9@citrix.com>
Date: Tue, 21 Feb 2023 17:24:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/svm: cleanup svm.h
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-3-burzalodowa@gmail.com>
 <562ae912-e833-ba97-dcd5-4c6b6d8898e0@citrix.com>
 <d90c5512-240f-d2a1-6748-3b56e8f911ea@gmail.com>
In-Reply-To: <d90c5512-240f-d2a1-6748-3b56e8f911ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce688ac-bb6b-4400-e079-08db14308571
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7J7Cm+ZUtp75IRZ02JpbcU0z3jSANKBzT5LIzBju7eg9Lp3mIbIrGWXDVj106HaMtcUd92HpQMuXmFhlu9mOfbFS7zrK+nv9WIbKdmOMJHOkSMcjU8IytJj6KCpoDaJnFQybNHsSKc6RrL2qLCVYiEuIDbuEmlaCzTXT2Td0GvLfQBz9die4sEhg5PDOMomnOSE1Qp/Z1FaVNE6Rrs0EuTmWPwUeNrYUN8wa1WsSaN50GgmWt/P0EESZu65CrOQ06n8o7HKz5oRt0lfaVq3EQXL5AT5MynyWH51LWK/UpaljyEWbz/UtUDGR6F9kF+fFZWHQv3M56gY+o4eoEe9qlRL+JQQUaC+nnZk20ajdWnDePSemLq3uJYcblZFLw/PSYoEDRth13tGjcsYM5UcZBge6J3v355ASlI2Gc0+axJLkQQDhVQ2xmkoOiL7ZrNTDFAQKdAB00V7aZr3QAv9q+TSrJ/vRqxwL5VoksD5CnAKRETNWXJ84VY7oDQzaEN2qkElqw71fepF3F64OXaZ7bdBe3wz2rClTuhMP4XYFjrdm9QaDdkDwPok8ppVN9Fs6FdGXmuce9ou2DgMSQurJKCcEbVglVClBAc1LG87DgQt0kvbXnC0UPeSbulZofrndB/uRuvmIfCEKDBQImdKXKdg4ENZeh/zrgNdMkvxPG9/JkDiWlxv2PagK/PEKt9dVQFEJGSpGqceTItBm72Sed+ISbwf3gCS3etT88yYn02Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(41300700001)(83380400001)(54906003)(186003)(6512007)(26005)(316002)(6506007)(86362001)(6486002)(31696002)(6666004)(53546011)(478600001)(36756003)(2616005)(66476007)(4326008)(8676002)(66946007)(66556008)(2906002)(82960400001)(31686004)(38100700002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJSYnJyUXkyMzFFc3dnelY0UFlmRlNocGdTSVRPMmRqQWdJVWpucysxSWlJ?=
 =?utf-8?B?M2J4QnBsb3h5djd1VlFJc1d5bG5RLzRVSGpIQ0JLTEszZHhpT2RLN3ZhUFpD?=
 =?utf-8?B?NldhaTdHbkUxL2NQOHovMEgzVzRIVklSZXY0QVdUMEw5dEdzYmI5UEFiWFBP?=
 =?utf-8?B?ekt3cHd3azViMEk5ejJZSm43TlBRL25zTWlHY2NIRVVPL3B6eExvaGdJQWtt?=
 =?utf-8?B?c3JYZDE4VGZNTnBlMVJLS2xzOWVmcjJjL0lJd2J0REw0ZEY0SzNEWUZsU0Jo?=
 =?utf-8?B?YkFWZUNPbWVTRHVKQkxOMEo1a3RVd2tGMUZVZzQ4aGdZTWczYk9uUVVDZjJH?=
 =?utf-8?B?emY4Ym9zaWp0NGNDaitmZFduQ2VUUGRWUUtjRVFKd2tWa3N0UmZtN1paRmNN?=
 =?utf-8?B?dXVKYXRJR2RHMjJRTHcveCtOaXBmb1pDczYrcXNGblJVNUNVUzhHaXRpNFYr?=
 =?utf-8?B?WmI4Y1BUeFRMT0hBbnpqY2ZiSHNPY1AzLzViQmtBVjN1K0YvUWFZcTBobjNk?=
 =?utf-8?B?NzFyNG9yVlhLcUNlMkZuWjVBL2ZFSzhWVmtYYXZZRGltdHI1alFna1FpZXpm?=
 =?utf-8?B?Z01YbzlXYVZRV3RBdzdzd1c2RUhrYjMxYUlNTkNMWmduUEZiUDVYYTBtKzNz?=
 =?utf-8?B?TVFEOWl4b1pPekZCZFdzMEFNYzJ0SWpaM0d2aW5lN3IyK3JnL0dUd3pRNTlY?=
 =?utf-8?B?R0YxUUtDTlhSenNPdGUyQlVmS3B6Tk51SjZSU3N2cU4yWlIyNEFCOThZWXoz?=
 =?utf-8?B?RE9TVS9LOFNyWThoLytmUWpXUW1oaDJqcExOK3NTWUF0VHp3SUhFZngwcis5?=
 =?utf-8?B?ZGRrNmVzRWNVYlFOTU9kWGU3Q1AzcUcwaytndG81cGYzSjNzZ1BnNWtNQW1Z?=
 =?utf-8?B?c2hOTkNNT1FoRDhxb3JNejhFNy95NDFXdFliUm1jWmhqMVoyaXk4ZkE2bkRW?=
 =?utf-8?B?SWtWSGxSUmlDckJxakc2TVVxNXU5TlRHN1dpVWhuVmFob0xjYjIzSG9LMmJD?=
 =?utf-8?B?QXVacDFmcVQrVENjN24remFpOXNNYktJa1l6T0szNFdNUU5XTThxdWpNQlRv?=
 =?utf-8?B?REh1cE9LV2U5T2dXNHE3L2h3OXc3NlpXZllTVU9ON1VGaXFTWXNkdFZWcWM3?=
 =?utf-8?B?bUFQT3FGaFQwQWFWaW94NWR3cjN0aVBCOWpTUE1KSUJXa1BPWUxVQXZwZnVn?=
 =?utf-8?B?bHJtN2x6UkxzMWw3VWRLazVHL3R3UnROQjRJVnJrUUFuR1g1T2FERmtGczV6?=
 =?utf-8?B?T2VJK2xSM2JrWU9IbjYyTERhaEg0WTh4MnhqcXZmWWUwRW9HVU1KZktteTJn?=
 =?utf-8?B?VFYrVjdOUzBsZnZPUEswa1Nsc1F5L0twOEM4NXBKOHV3OXJQVUc4eTJtOXVl?=
 =?utf-8?B?V2t3dS8rcDJYYkFhaFNhT1d2eW4wU3VmZ3ozc1NrQVg2N1phY2s3ZWxIbTBO?=
 =?utf-8?B?aTFyODY5S0NXcVRyUzBCWm9GM09iQkJZWXg3T0hFNm9oOGF1KytrbTRVK0dy?=
 =?utf-8?B?MFJPVjlRaFBuZHA1NUVZM2lMNk1McFcwTnQvZ2k3b3d6VUFKeENsbDUyMk9a?=
 =?utf-8?B?YVd6azhKZC8rY1RKSXNFSFduVU4zV1hnNjV5M3NrYUpic04xSDE1Z24yQm9D?=
 =?utf-8?B?akZ0S1lGN3N6WjduWlFoYTdLWGo5ZExBcUZUNGp1bUZTSWxIdU9MdXFTWDds?=
 =?utf-8?B?Yytia0xzZTZMeGdXcUQwekhVVHRScXRNdXF0NE5zS1U1WFd5WjI0K3ZpcHFj?=
 =?utf-8?B?eWhCM09MaFBGcTNzWTh6dXdVeWZtTnd2VU00UUJJU1ZjVVdkWGtTN3htbWdF?=
 =?utf-8?B?SXZwdHdZTXVHWFlXWXc5a3Flc2VGWUtGODhLRTdZNnBDRi9zanVoZG5mQytL?=
 =?utf-8?B?NEFzNUJNK0N2a2Zrc1NhS3BDSEJndENXaUs5alBuRUhDcEJSbmprUElPK1lX?=
 =?utf-8?B?Z1ZFbkIzbm85NUlQbTdhdEs1UUxNa1dFNTN3WkpSbld5dUFzSFdodGo4NThr?=
 =?utf-8?B?cFQ4RmgzaVZ2L2Y5Vm5WNWFxRDZXNHdad2Q0RlBrZXRnU2djTC8zeTFIWVV4?=
 =?utf-8?B?THR1eW9oT2R3RmYxQkZGeGR2NVdRdTNiYy8xKzdPVnZZNWJpTncvU0xDczJs?=
 =?utf-8?B?MSszZXlFL2dFZjJoTXpmZVpzWGhUVC9tOHNOR0ZMdi9icjVjVHhnWFhCSVM0?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tqU7U5zSIWnO8QngFYcmHTu+MSDR4yoafDYE3/DUs2BUsVDqxCBbTdmzAkkgmF19z+SrOWuBjMAkd9yOmsF5oSphYoUsq/JbYqe9ElZGFz7XUc2V/RPWo8Liogak29/E64GXBazyGZCp/fTweNY8v0UhWBEFvQPOixnPm1yLSFNU0u4f+38mG8dzLszdSGNvyJ8ViPExtOhOz4YG7JLeo5+wLitOzcXHgV529Al3Yavj2PpGuSA6M6gWEjuT08+++Dgiu6MNJpVsjJoeKvji0OjIzhBL1ne6C8sHerl93yMQC0QmmAkHgWjKyFpK1+2uzQhG3grPeJJSne2yE5a3oa0GQxzjZXaLD8b1ef0SIUtFvDjBSoFdkRiMj3avJz5mh8TD7h2GF0LhymqbLAQ3B/LcfiSjrRjW/kGBzN5+6q7cnNk2+jtDZi4ZdLDWfRUcUDddDQfN/wMwbGEcnWsNkBKYrwYIe0k9dprhs6o/15pTusmtY3MUySVu9io7jX0l4zq7xgQ8WmiIrnGgEcvfTu3JCB2JxjnySgwVo4Lbl7Xgz3a1QK2CExFoC6PV+QvqYbIeQKwTQulIkg3RxkNjPxkt08x1N2ndo57GNSLWhUwh/CRaRyWsZux/Jao1b6aVREWCNq2pv1HZfWQA5gwdZSOg8WGJSHORbN+jnIGGWmu8jMITSR18SD/0teWRu6/pe6bZhyrw0XyWgv1g1+mLbEITYbvyu3wAU+08l7D63DhRgclBJVEJ2YAi8sOXce6XOqvCSM99ae5uB0xHpxkQdJCDsBpI/IvoIuh6nu+SfmuiZjPPsoQxtA3SD6uGpEmJvCO3TH5qFHk8YHqFh1Vc2H/NAJHDxBvCnfPhycUX0xE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce688ac-bb6b-4400-e079-08db14308571
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 17:24:43.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfT58+8xC+CVwNaYV5QPosn4pEm7Y/B12JBoENm/DUhYP8xA4r0GJwJiND3hZIhWwYVbbc5il+ysSV+IhMkSKTgCgbfblhM4MNxxWaRTOZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5428

On 21/02/2023 7:58 am, Xenia Ragiadakou wrote:
>
> On 2/21/23 01:08, Andrew Cooper wrote:
>> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>>> Remove the forward declaration of struct vcpu because it is not used.
>>
>> Huh, turns out that was my fault in c/s b158e72abe, shortly after I
>> introduced them in the first place.
>>
>> Also, looking into that, there's one legitimate use of svm.h from
>> outside, which is svm_load_segs*() which means we can't make all the
>> headers be local.
>>
>> But still, most of svm.h shouldn't be includable in the rest of Xen.
>> Perhaps we can make a separate dedicated header for just this.
>>
>> [edit]  And svm_{doman,vcpu}.  Perhaps we want a brand new
>> include/asm/hvm/svm.h with only the things needed elsewhere.
>
> This can be done as part of the series aiming to make svm/vmx support
> configurable.

Ok, that's fine.

Honestly, there's a lot of cleanup which can be done.  We probably want
to end up making a number of $foo-types.h headers so we can construct
struct vcpu/domain without xen/sched.h including the majority of Xen in
one fell swoop.

>
>>
>> That said, we do need to stea^W borrow adaptive PLE, and make the
>
> I cannot understand what do you mean by "stea^W borrow adaptive PLE".

Pause Loop Exiting is tricky to get right.

The common expectation is that PLE hits in a spinlock or other mutual
exclusion primitive.

It is generally good to let the vCPU spin for a bit, in the expectation
that the other vCPU holding lock will release it in a timely fashion. 
Spinning for a few iterations (even a few hundred) is far lower overhead
than taking a vmexit.

But if the other vCPU isn't executing, it can never release the lock,
and letting the current vCPU spin does double damage because it consumes
the domain's scheduler credit, which in turn pushes out the reschedule
of the vCPU that's actually holding the lock.  (This is why paravirt
spinlocks are so useful in virt.  If you get them right, you end up with
only the vcpus that can usefully do work to release a lock executing.)


For overall system performance, there is a tradeoff between how long you
let a vCPU spin, and when it's better to force such a vCPU to yield. 
This point depends on the typical spinlock contention inside the guest,
and the overall system busyness, both of which vary over time.

Picking fixed numbers for PLE is better than not having PLE in the first
place, but only just.  There is an algorithm called adaptive-PLE which
tries to balance the PLE settings over time to optimise overall system
performance.

~Andrew

