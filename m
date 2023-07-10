Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B517274D93E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 16:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561247.877667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIs7M-0004AO-7x; Mon, 10 Jul 2023 14:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561247.877667; Mon, 10 Jul 2023 14:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIs7M-00047l-5H; Mon, 10 Jul 2023 14:44:00 +0000
Received: by outflank-mailman (input) for mailman id 561247;
 Mon, 10 Jul 2023 14:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6vR=C4=citrix.com=prvs=54822c203=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qIs7K-00047f-6T
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 14:43:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30797bcc-1f30-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 16:43:55 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2023 10:43:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5604.namprd03.prod.outlook.com (2603:10b6:208:29a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Mon, 10 Jul
 2023 14:43:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 14:43:23 +0000
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
X-Inumbo-ID: 30797bcc-1f30-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689000235;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tFbvcgh74os31cUrWj0pkXUolfB4HFEMmZRNKupogrc=;
  b=YR3VYM1V/76dA4+lxXRNqhn1XoMPjMnyfvA3PbaLzIsV85pkCFx1xQrS
   QEmLO/oRk2cqwWmOcLJlweSjG6Ohioa/6riRGD90v9Weceaaa+q+k84zc
   gBDoUQPVfBlnmoet4hnnd6fUqR4saIM5T0xLLZcqIXEW4JeeQxPuOihAu
   M=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 116133184
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZRlsDqn9KZbMYdba42fRV5To5gygJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCmqOMqzfNGP9fYtyat+z/UsFvsPWnNc1TgBspHhjEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5QeGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dtbBhMNRDeRu/iVmq6mQcBnjP8Kdsa+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqlAdlJTe3knhJsqH/MxnBOJUI7b0qyuNOzm2vhUOJcM
 WVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88Suiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsgazASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:THWblagHuOv53mDXs/6jor7+TnBQXuAji2hC6mlwRA09TyX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFgrX5TI3DYOCOggLBRuxfBODZsl/d8kPFh4lg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeVvJprY4dvj8w==
X-Talos-CUID: 9a23:SMWduG3j93iNHWujhj+wPrxfPYMLUX3362XsOWziFXtiYbafcnbK9/Yx
X-Talos-MUID: 9a23:KSGTXAt89iWNL075sc2npm5iKJpFvImUGUkUu58XnpaPBS9qEmLI
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="116133184"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI94pnTqwwAo6/PEcJMtNQJ3VJ3ap37k6Y4quwK8LY1F+/nhV8BTpYKxYEiBEixq22AMd1+pYrqtwrx522SlurVzJ+HqCboihNwWdPIT1c+33Uwo3tXozmuy4FZWiRJoTr24vSUaWi2QL0yM6/QXH9KGg9ni1HK8gtRq3p3/QD+79bn/ChOUx3yawqMWYrmC/nsVVjcJZeQNmYeowQ6lkONccu6d/jnNvqUF0kK2XgrMk8Ohq0fNO7NlAfB9JDeJ0HyTYwhBqALj7hSR66dNrBrf3Ntzvt6meeZwtKRQklQ2ys1KOQIQMh77xAX8kPhPMj48DSrrOu6bWFXBmj2fMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Om8Az9LxQaT164FstBhBo5DJ8kmbPInUPpxTaDWlk=;
 b=lLRp98bt7Kno3z6ckzxQs0sleFhyMW3OSIqnHbc5ah3w4ECR/+55CbQPjiaOcCi4PntEIq1wHrbI98Wd1A2YaoGrNod9svPkavfrTxqfLlzoIA7DjsC9+T3tHMZGfHCEAvC2I/5CqA6dAE/jzHRJV4nD7rzbU98Q5VDsMLFMW6RS4eXzR0CBHE7oaknwLSdjeiS+xxdaJs5KgIzg8nJoSt7XTNBLPyoiKX/WR18fTsoe8xpqY6XzWsI6VrXoYsUjsImdMCMdxrwvYHSEMHSSvc1wh8/lAZ/m2ePFilyySZ0tk968EVB/i+lY0HURkJq23GjuuxI9OF83EsWnRIDQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Om8Az9LxQaT164FstBhBo5DJ8kmbPInUPpxTaDWlk=;
 b=t0Lu7/cCjtAWoBIu+frUtjVLkHY2rCOgVfy97znzHU2iW1mAruAvH7UnS6MIbbll3KCtWE90jd8WQX/BalLll0UeryqFrTkgJoEqfmuzYJ5aClaBoi6W0xLdaZQpIMha406n8+0zCEFJeVua3JlzpgRXOJhiV8vrgwCyLix9Hzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 10 Jul 2023 16:43:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eca592f-7f83-4968-de15-08db8154031d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mK+N9GB22pxuss/QvaU7Qt/IL0EX2CGPP9gUrbs9cHkY7Cb1DlStMDqwCHCZ0+xD2xbyrzfxt3B1gg4WWF4W0e80zSJmhnhqnqkpWYW3O1E/l33B3h+n4RPpa0GdB4vCIi3+iX3ZD0EnCBFnjGoyz5IFxbl5lPayYavRKhzgRoRgG3U8TKy+FIBpm1tZMX3g21s+jXfsrtPVYa5Bzm0pV13sZ5eRU0DbYxpQzevWoKe1nI32tdJ3c1m0BoIritUanvkuYUBKi6LjVxNrCAZMhwb5JM6iC0ZqB27xe8s/L/FnHwuUCNxK1kusfLQ+TJUkZ2TVMjdN2QOsMCZw2DJvHoih4QJGDFIxIm1zMO/ceXr5pSR7dLNI32N5vebeqS19tYksAP9HXs6wmsKyjDxTftI6MIBw1M5N388FKL1ZmgYFV4cm9YIxo4gMdiNvm62KWccR4jVd4oiBQQNMXZ68QGkL54t6HUH/81yAYDi60QotdRfxGZD1xGGgydAbbrD5nkbiTqXVPKOVSR/3T96+A0JpayuSN7Jrz3ha+2D1pM+VKS3uj6VqX3u4O3bL7fkg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199021)(6512007)(6486002)(9686003)(6666004)(478600001)(54906003)(53546011)(186003)(6506007)(26005)(2906002)(6916009)(4326008)(66476007)(66556008)(8676002)(41300700001)(66946007)(8936002)(82960400001)(5660300002)(38100700002)(85182001)(316002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdVUWNKMktUQnFoangxdFExcEhnVmoxaEVxMURyUnpUL0orSi84dnBmRmlS?=
 =?utf-8?B?eWlWc3paeXVWT0NySGFLRVJtVXg1eFRRYTBJa3E4Y1JGN0pGcWtkZUJsOU41?=
 =?utf-8?B?djVsY2txTFBjdUpkck5pMzVzbTJvM0NoMkpCNHhqRU5hc2dYaXpsT2tqQXNI?=
 =?utf-8?B?ZU5UK0JQNGFrQVdDSUN3YVhveXl0dEIxRlZHd1A4RkZGN1NITU1XS1diTnZ6?=
 =?utf-8?B?MDgxN3l4dTJwbmZCcjlBYjkrM2hSUE9aanlrblZFUmxlMFBRVVZSZmt0Z0Ry?=
 =?utf-8?B?RTZZTklmZFBzZlZaK1FUeDQ5WlhLK0o4L0E0SS9XQWJIdXFVN1FzUWNGdXVH?=
 =?utf-8?B?anJxMlM5V2h1T3RybHk1T0o4N3pIcGI4a3pxZXB0bXRvSk5QNmttS2E0Z0dQ?=
 =?utf-8?B?eVpDN2tnQXlrUUlCOTQ4cEowcXY3SzhCSUhyU2FyY0x4MUt1SmNpNE00Q0pl?=
 =?utf-8?B?UUpxTzBHSHlnWGtwRENVcWdiRlVRQ205bjVsOTBwcDgweFlvWnkzb3Qycmlw?=
 =?utf-8?B?dHJ5N01pdlVNUUtZYWgyL3JmNTFQUDd1VVRRR3FHbjcyN0NTWi91enJCbTYx?=
 =?utf-8?B?SU5MbzhoSXhNTGFwMXdubk04VSttT01rS1lzZTRoUmptVklSMTUxUFJZSU1G?=
 =?utf-8?B?NElPM3llMmZUMU5KNjE1MTlnMEdKdUV2ckt5eVg1Q3hVTlZUL2dyU3ZjVjMw?=
 =?utf-8?B?R25sMC9wNTNDWmJRb2tyTy9kTnFUb2NPL1hCVHRSajVQQlNZMS9KRERvZnRu?=
 =?utf-8?B?UlA4eGhza011WDdSVjg3U3lvVlZISm1tcEROTkozbmRITHlpSlJVVDdxUyt5?=
 =?utf-8?B?RWU1MVMyU2gyL3AwKzNuMm1yV1hBSUpwM3lLYnJlV01yK2hVMGQvZ0Y5d3p0?=
 =?utf-8?B?RGpvSm85TkNrUFl3bHBGQVR6Yk85SC82VnZuUU11RFM5c1JyZys4RnFRcXdT?=
 =?utf-8?B?SGVndEdVbHRHSTkwNkJkT3VUaXU0Vnp3aGhybEZWeXhOdnpGZDIxbG5LUmVU?=
 =?utf-8?B?Mzd6QkFrcFFkeG9KMXZxeTNQY2tHMFlWZDUwcy9zcVdMQU9PSHVQRlZYNjkr?=
 =?utf-8?B?M3NFUjkvam1PdUF5cGgwZ1kyZ3ppdXViOEdpd1VCYlJicUkyQXpDTHVjTUpV?=
 =?utf-8?B?Y1AxQ2JMR2VyeGkxTE0wemVyRjluem1uU3BDUk0yS2QxYnRlQnhwQmFJU2xC?=
 =?utf-8?B?c3JWM0VOQ0JhTE5kcmtoMnpXdGJsQjRwUnhXdEZlcmswdzNPWEozQWt5aW5t?=
 =?utf-8?B?T2ZCVXVxWVFhNlNwM0xUTkdVaWNkSExmaEdsR2haVDBCTjFyNm5UWXpteXVT?=
 =?utf-8?B?bkdBdC9nVml3NHV0TXZvU0lacWJhczRKcHoyZ0pLd2syY2UzRm1lZ1NaVlNz?=
 =?utf-8?B?RkNBRDRJT2s1RTBPUjVlMkhibzI5TVgyUk1oampxL2xOY1grZDFlSVJFdEZ1?=
 =?utf-8?B?UFBVcmV3MnFQazdpNFZLQWNGNFdkV0FNN3J0a00yTXhPY1hIN0w2Z0dBKzYz?=
 =?utf-8?B?OGU2a1dEWStmeE9BdmdkU0dwMW5hR21Jdm1CeEtRQk9NM0Q2OVZQQllrZG1v?=
 =?utf-8?B?eWtnY3JNR0VwZWhhM2xkNytwa29Ga1daTGZYd0YyNStMK0FJa0E3cDBxRHAr?=
 =?utf-8?B?WUZMYzNTa3k5eE91bWc3TFV4aHFBSFpieStkc0x5VlVCUXI4UlVTRUZmTGI1?=
 =?utf-8?B?OTFlOTVTYmIvdTY0eG9BNTk3T2h1Z2R4bDQ5TEo1WHpwVS9jV2dIamZvRDhq?=
 =?utf-8?B?Zk02UXRTNTdEQ3A1L1U3RnJDQW0yRXpEVm00eFhxL3NWUDk1TjI5cC8zeFZx?=
 =?utf-8?B?WElraTBPUUk5VXRlMzNIem94OXdOdGpaZXB6NkNGTk9ud09xOGFWQ1BBY2Iv?=
 =?utf-8?B?WUdQM24zUDN4K2lhL3FoL3B3WmdQNE5sbzZVVG5VL3pNSGFuZHdWWjMxcVdR?=
 =?utf-8?B?NngvcTh4My8yR0o2S3lYQ2x2aGVFS1B3Z1IxalVzOERTN21IcUxFZ1BRT3A5?=
 =?utf-8?B?R2pLTjA2T1lCa29OMi82STN0bFYySDRCSzdQWkJGL29Xc09xZEFXeCt0ckZF?=
 =?utf-8?B?NGtqcnhRWW9kT3JsdzllWG5wcDBjZlJhSXpoeDhTQ012YnBnbzV2NXVLYml4?=
 =?utf-8?Q?5NS/smrnfECipw3hERDZjDjH2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gprzuaaQxbO1Gbb5XAu/9P0NUGc0EuOU00Tyt7NQQt32YfnnfBnNCmm39rTRji/dIsa3RFpZ8HqhosqgkgB6o5TzNHYqBaDCPP+H9U8kE6tDg4elAKPpxHdpavjwy1kPVAflixvIFPmRCnZ7YOookmAFBqImflwGa5zGiJWdlOqxygfNTrwU4sSMRjOuhWGrDOF9fElQCsn8SjCWy8EMehJ06UWYqL5RouXR+UNIXRSO6DKyKqGLByIA2X/tI6tjrMY3k871/I+cej1dC5jBuLaA6HlchaDocSEGeoZa6AhV2psOEqRKiISExjT9PexCkq28PPEUfanoJOF4vkNnA3ERzfTT281aoTQwGB6X9cgncCBv3OUuFkdear2S9D9ArA7MHqxYIcPC5M1bAfB89EpnjuqIMCqsjX9buO6/SMVnLrWeFPh8VcebuTd/WjEm+IDOR/0b8ugGlq3xuoO1PzgdmKj90u+6SnDgJDqB91ApKz6RMBCiaEyhfBrThiZDzEuwomrHJ4+E8xwD/V+xc4P9BJp6aghofP9JAxxeyDcigwHAifxTmqdQGE91PsPIwXgwkNR4b7Gl9ElFidoWxKMbEgXxiytip1MyG3tAc0Z1rLvhLe80yqxqnksuh8zNiVjYW1mUmb0HPqbw0v3cdKhkl/saDXSwiRh0Zm2Jcy7Pane3+Z53+wsskz86Dig7+x7NHEaGvUg0OuIdXj+ZX/maNFMdHx8tYjuOLlnJm+PaLVzdAfEFWV6WY0SPiG2rvB0bw3Fw5BBDsvtj5SX5xoe4VbgWw22LagSuauTf5sJL2J+29BIXeyyt54JtKQ0C
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eca592f-7f83-4968-de15-08db8154031d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 14:43:23.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHcn6MryDI734cgMtV/P7UYVGEOJo4S/wkhc9mfWdDNBtq0+LluLKinhdyuP5dMDl0kKifGPUXFNUND5AAv5Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5604

On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
> On 07.07.2023 11:53, Roger Pau Monne wrote:
> > The current logic to init the local APIC and the IO-APIC does init the
> > former first before doing any kind of sanitation on the IO-APIC pin
> > configuration.  It's already noted on enable_IO_APIC() that Xen
> > shouldn't trust the IO-APIC being empty at bootup.
> > 
> > At XenServer we have a system where the IO-APIC 0 is handed to Xen
> > with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> > with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> > APIC is enabled periodic injections from such pin cause a storm of
> > errors:
> > 
> > APIC error on CPU0: 00(40), Received illegal vector
> > APIC error on CPU0: 40(40), Received illegal vector
> > APIC error on CPU0: 40(40), Received illegal vector
> > APIC error on CPU0: 40(40), Received illegal vector
> > APIC error on CPU0: 40(40), Received illegal vector
> > APIC error on CPU0: 40(40), Received illegal vector
> > 
> > That prevents Xen from booting.
> 
> And I expect no RTE is in ExtInt mode, so one might conclude that
> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
> of course there's then the question whether to change the RTE
> rather than masking it. What do ACPI tables say?

There's one relevant override:

[668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
[669h 1641   1]                       Length : 0A
[66Ah 1642   1]                          Bus : 00
[66Bh 1643   1]                       Source : 00
[66Ch 1644   4]                    Interrupt : 00000002
[670h 1648   2]        Flags (decoded below) : 0000
                                    Polarity : 0
                                Trigger Mode : 0

So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
connected to.

> > Fix this by moving the masking of IO-APIC pins ahead of the enabling
> > of the local APIC.  Note that before doing such masking Xen attempts
> > to detect the pin where the legacy i8259 is connected, and that logic
> > relies on the pin being unmasked, hence the logic is also moved ahead
> > of enabling the local APIC.
> 
> A comma after "masking" might help readers here.
> 
> > --- a/xen/arch/x86/apic.c
> > +++ b/xen/arch/x86/apic.c
> > @@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
> >          return -1;
> >      }
> >  
> > +    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
> > +        /* Sanitize the IO-APIC pins before enabling the local APIC. */
> > +        sanitize_IO_APIC();
> 
> I'm a little puzzled by the smp_found_config part of the check here,
> but not in smp_prepare_cpus(). What's the reason for (a) the check
> and (b) the difference?

This just mimics what gates the call to setup_IO_APIC() in that same
function.  It makes no sense to call sanitize_IO_APIC() if
setup_IO_APIC() is not called, and I wasn't planning on changing the
logic that gates the call setup_IO_APIC() in this patch.

I did note the difference with smp_prepare_cpus(), and I think we
should look at unifying those paths, but didn't want to do it as part
of this fix.

> Isn't checking nr_ioapics sufficient in this
> regard? (b) probably could be addressed by moving the code to the
> beginning of verify_local_APIC(), immediately ahead of which you
> insert both call sites. (At which point the function may want naming
> verify_IO_APIC() for consistency, but that's surely minor.)

I wanted the call to sanitize_IO_APIC() to be done at the same level
where the call to setup_IO_APIC() is done, because it makes the logic
clearer.

> As to also checking skip_ioapic_setup - wouldn't the unmasked pin be
> similarly troublesome in that case?

skip_ioapic_setup is set when the IO-APIC address in the MADT is
invalid, so in that case attempting to access IO-APIC registers in
that case won't lead to anything good.

> Aiui it would not hurt only if
> the LAPIC also isn't (going to be) set up. Then again the flag,
> among other things, signals a zero base address found in the ACPI or
> MP tables, so I guess this is a (largely) separate issue anyway.

Oh, yes, indeed.  See my reply above.

Thanks, Roger.

