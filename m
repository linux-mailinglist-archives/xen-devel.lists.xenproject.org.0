Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7F4B4920
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271385.465798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYgd-00089e-B8; Mon, 14 Feb 2022 10:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271385.465798; Mon, 14 Feb 2022 10:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYgd-00086k-86; Mon, 14 Feb 2022 10:34:27 +0000
Received: by outflank-mailman (input) for mailman id 271385;
 Mon, 14 Feb 2022 10:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJYgb-00086c-Cs
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:34:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac30901d-8d81-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 11:34:23 +0100 (CET)
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
X-Inumbo-ID: ac30901d-8d81-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644834863;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1K7QpBsf61UgIbizoELgKqH/McdEYZCIUsYc92CX0Ws=;
  b=HPYOY0RVwZl5y86ejJ1BHVhPa46lXQKZM3L6qohGe7zy6uNj9QA+gGR4
   HUc4BU4JpxOkR58XeB6iJdKOERsVKNXq7ElyB47ut5dTV34QEoZ2Y1ZOh
   KpZqebbr4PwAS9DOwpBjhsUcj8EnwXGrqXRI0Dlo/2oNf5tozzaZolXY7
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 76OQfkmBvS5FJB+kS8cd7h1xjaWZH2B5lLKGydugqQMieh+tJNjpU6gKw9sdvr7FEakNP2kOp8
 G9+rE8p5kf2++H/6+40M0ipWRUzj+xSdMulF+x+Ox5+Z6eJGT5kte7wtazeG/e72FMMNxhgQRD
 phqdpz92aG053z9uTPIVAVzvWxSiwyCo60V4q28BqQ/sG4WEaUTc3giL6rkqHH9rHk6NvEPEvW
 k899bwDERwA19oGsV/5IQwI3Hvsk1rrjUlY1oL8cQEsI+y3iplPtMULxL1cvL9oDxYQZq28GSH
 bog4CRUssZZgzpAxM6UMaC1T
X-SBRS: 5.1
X-MesageID: 64546006
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OmcUwKrHHoT5M46tCfCIG+BsUcNeBmIRYxIvgKrLsJaIsI4StFCzt
 garIBmFP67camr8ctEgYYiz90kPvsTQmN5rTVBv+SwzFC9D8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZqRTgwmFLLPpN0+TUMBGB97HqFA2paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SQKqAP
 5JHAdZpRCvqbRhiNFc5M7sVgd2OiV/ZI2RCkl3A8MLb5ECMlVcsgdABKuH9RNuOQslEm1eCk
 UjP9W/5HxIyOcSWzHyO9XfErsjLkCDgUYQeDoqE5+Vqi12ewG8UIBAOXF79qv684maXQc5SL
 nsx6yUnrKUs3EGzR9y7VBq9yFaetx4BX5xLEus16CmE0K+S6AGcbkAOQyRdctUguIkzTCYzy
 16St9rzAHpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LN6q4jcb8Hz3q9
 BmMoDIjnLUYjcMN1KKT8EjOhnSnoZ2hZgw/6xjTX2mlxhhkf4PjbIutgXDA9upJJoudSliHv
 VAHltKY4eRICouC/ASPXeEMEbeB9/uDdjrGjjZS84IJrmr3vST5JMYJvW84dBwB3ts4lSHBZ
 m7Usgx7+5xvBVi0N/Z8XYeSB8II5P21fTj6bcz8Yt1La5l3UQaI+iByeEKdt1zQfFgQfbIXY
 snCL5v1ZZoOIeE+lWftGb9BuVM+7n1mnQvuqYbHIwNLOFZ0TFqcUv87PVSHdYjVB4vU8VyOo
 76z2yZnoiizsdESgAGKq+b/znhQdBDX4KwaTOQNKIa+zvJOQj1JNhMo6epJl3ZZt6pUjPzU2
 Xq2R1VVzlHy7VWed1nWNSAzNe63BM0lxZ7eAcDLFQz2s0XPnK71tPtPH3fJVeVPGBNfIQ5cE
 KBeJpTo7gVnQTXb4TUNBaQRX6Q5HClHcTmmZnL/CBBmJsYIb1WQprfMI1u+nAFTX3HfnZZv/
 NWdOvbzHMNrq/JKV52NNppCDjqZ4BAgpQ6FdxWUc4cDIB22qOCH6UXZ15cKHi3FEj2arhOy3
 AeKGxYI4+7Lpo4+6t7Sgq6Y6YyuFoND8oByRgE3NJ66anvX+HSN24hFXLradDzRTjqsqq6je
 f9U37f3N/hexARGtI91ErBKy6Mi5oSw++8Gn1o8RHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4PlseBf66SZ78aCpS0JXOxXQ2iVRIKEsaNEuw
 Ps7ud5Q4Au600J4PtGDhyFS1mKNMn1fDPl36sBEWNfm01N5xEtDbJrQDj7NzKuOM9gcYFM3J
 jK0hbbZg+gOzET1bHduR2PG2vBQhMpStUkSnkMCPVmAhvHMmuQzgE9K6T0yQwlYkkdH3uZ0N
 jQ5PkF5P/zTrTJhhcwFVGGwAQBRQhae/xWpmVcOkWTYSWiuV3DMczJhabrcohhB/jIOZCVf8
 ZGZ1H3hAGTjc8zG1ycvXVJo9q74Rttr+wyewM2qEqxpxXXhjeYJVkN2WVc1lg==
IronPort-HdrOrdr: A9a23:wCjSlqt8Fh3CFSHPHxzhSYfs7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64546006"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwRWFQ8rsekNSXwm1it7e54XqbMRVwNemwAvMLiG7sl4isGtQ48zUZ+E2QN7Op104m+eujYdOpct7xfRczcaMA9n5N23qxZzW16RGLpyus/paKo8r85sB4ixNTvyCuflJJIssllM7kg30mhp6rdEfshVZKQ9H9w+L8sKxGyQMMb0CijaxbXFWFzzZmi8OV431ofoIuOwGMBDPREmdsonQcnDwZaLysR6eEIxHpHDUiBjA6vnCZjVHwW/f5zwaLpLZ36JqaafWC4USKI86ijX1KZc0ErZEOb/m4A09FMT6GVSSzi+F01FwIl7yLtZk0SYxdb4Jp1N7OSGXCkk2yBNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqJWdz4JBMkBkzUw2CFYm6S3JoAdOb5DfgABmNHPOfY=;
 b=jnyZkzeHEHlZCzKqbTVhVewpzH6l5m7elPMX8gzCj8Ilwq24rKSdMKNVliZGa8SUPKx5FkvRvR6G4JXRmhpVl0zAZiKoLNvt9825mksNL/1HX2s9wb21ShruCnxEu4DH12ZhmUwg4oCnbASu8XDXOw5N87JlGGXAQSvkHxF3woIAHPU+r42IGmh5TFjxg2OpwiCKVhM/EpQr8E0VjOXS/Hyo1cY5ikc3OTGRfE9mgmBkIGQJDI0PQCxC8aFz9PUMCp4KIucP65SnrQnRKPcp9Q050GbiDqfe1ZMnHUmeHnJGdqoodUHS1stAQXEg1EznonSXaMK9IG6Yr5Qbq5HxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqJWdz4JBMkBkzUw2CFYm6S3JoAdOb5DfgABmNHPOfY=;
 b=i4euMjxZr5awSlggfgQ83fo49UNtuUA4IN3CzFC+38ear9mrBcWGz3+MpBNd3ykGEiVQh9Yq8rsRiMyu/c4TO/+Pfjzme/2oeyXx4vnCxoJSxaTSD+w1L0HlrRueCOyNPCxkD7byGnbxUkLMMroL8ON3bUFujXa/wAQ7LVbLIoA=
Date: Mon, 14 Feb 2022 11:34:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgowIg5MvTaf2zsR@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
X-ClientProxiedBy: LO2P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::25) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f134c820-b2c9-446a-9d41-08d9efa58d18
X-MS-TrafficTypeDiagnostic: MWHPR03MB2431:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2431FCC3709382278D9160DD8F339@MWHPR03MB2431.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VA+A3LxK4jVOcRoy8D1WggObdAcsvPKPSZAmWEjPL9vCSwg2K2XOrPHMAk/iiAo6+eUNRTFHPILt7FJ9LCfisO7pzFxfn7zRXb/AvLQVljQrVeUiGByCiJPzsUU3dXNSbAueCTYiNL7yq2ifq+q8sUa7ChPBgS6hCjfq02SIwSC1O9dKIMKIVDnxta+2R0PKPPTSu4eQh8E9YK4GGZG+vGvnyuAeEP9xFGYS3UM9pxa3NlOLcLq3AZlb+Kn8J8iPAW6IQ8dr6NnW6ubuJ3XhSWoeBRVRypWCmAT8cgqLeSIfqFY7Vhv/y5OL5WFRsIV7eSki8jnHhcnhOajD4xLYJO+/TIuGDs/KlQhWcOWj7vujziyovFIaA/mDzSwlBCS5G43PJ/LRs9zMGmVPS3ikFpgkJSEMihPkl6ua9c+nE7+kVznHxYlcoW1kcl0xwwXt5+FBH1XqXA9lUOSqt9FTM87bi9GsdPusqfbrAvRX+OxbAxAl9+BcyZpOggUoycGgVViAPYx/e9Ul48HyOEqsl4s58aRj5NIaMv0l0+E/L0R2KgNNgAUJ8QhFS7fHbj4VbrljqOyju7XsC33jzso8vyvNbezetvDmxMSdZATzBnbpk2UIZP1UfnT0eap0Mdcj0TaOAh8Ck6TKzM4JPoY7ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(7416002)(6506007)(8936002)(5660300002)(53546011)(186003)(26005)(6512007)(9686003)(83380400001)(2906002)(38100700002)(316002)(82960400001)(85182001)(8676002)(33716001)(508600001)(86362001)(66476007)(6486002)(66946007)(66556008)(54906003)(6916009)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3FDRlFVMVIyczZtMUtYbzkwOHZMQ2lMRHRZYnlNbmpsWVlZenk0NG1DVFBU?=
 =?utf-8?B?cmZNZ3QwQlRURHF6QmlBdkZjdnlHR0dSSUV4SVhaMWxycGg3SmFwVkJBMnVx?=
 =?utf-8?B?dGx5WG5hNm1uZlhmUWc3d3B3UGNPZVoyV0VjLzhZK2o2K1M5Yk1oemlmd0ZF?=
 =?utf-8?B?MWh4clZLT3JRV243KzQ0QkUyTFNLMVRDRDhEeEkzRnZJdllNcE83WDlUZ0Nl?=
 =?utf-8?B?bTFPVVlqQXFCdEZtd0RHMmxJdU9LakM3VDBVNUZnUEl2NkQ1clFGSVdlMGhR?=
 =?utf-8?B?SytvTWM1RCtHZXVtbWhhNFRyWG5NMXl5RENPM3JMWnA0aktMdjlneWV0d3Vi?=
 =?utf-8?B?V3k2YVlJSXM5Q0ZYaUw1aXh6MUd1eU1FZ3NuaHNaZmV6Sk8rK0NJRWpiMTh0?=
 =?utf-8?B?SWJMWDlSa2lRUGoxNkIxN0JLbVJLQmN1aU9id1B4RVJHYjhQZVpHNkEvdFht?=
 =?utf-8?B?RkVNYjJneXZxVVNqTnlxc2V3UzhtYnp0K2hvbnNrNm5kS0F5d09hdWcvUUV4?=
 =?utf-8?B?bzF2NU44Ry82ckxHQnY0MU03aTQwbVVKMXRmbTdkZVRTZk8yNzJYdGhZelBP?=
 =?utf-8?B?LzZoODVSZlphK25WdmhNN0pydmdPQ1ZwRTRwV1hnaDJ5TWVvTXllV1NCSjBp?=
 =?utf-8?B?UHlxT0s3Q2Jzck1US1A1Rml6dERKcWZRZkFnUWhVMHFydWpPUnF2NnZDVVk0?=
 =?utf-8?B?bnArNFNxL2dxUUhSaGJWSjY1ZzV0Ymw1SnBYMUNURHhoT0EvVkdBTk5NQUhk?=
 =?utf-8?B?dWs0ekkwMEdVaWtBcXYvY3ZNa2RMVnAzNjhoWUVVNU1Edm0yVVI3bFozZ0Fm?=
 =?utf-8?B?Vzg0OHJEQXFHVmxrUHhSNGpKc1FxK3kzUG5CUnBqdHRrQjJjcXZ1WjNMbFNr?=
 =?utf-8?B?dm1pd2o0Y3QrWU1HM0VXdVB6Zk0yNG1PdG1kOElJbDBYSFNleVJlQWwrcFlw?=
 =?utf-8?B?SEp2U0VIekdXNmRaR25PVlA1eFhwY3k4eXVwQ2ZCQzV2R2ZibXVqcC9WNnJi?=
 =?utf-8?B?ek15c3I1bTgzL1I1WGppYmxSWnd6U3RIWHdRNmdWV1djbzFtYnd0UUV3WjhL?=
 =?utf-8?B?azdDWkFzNVdpcUxrOTAwYkZ3M1o5MWpBeGhSMndIRWJJYnZ5ZG83MjY2dGNj?=
 =?utf-8?B?YVoxVnRENGtWbG9kbGxlRlQ0enVMWW9haWQvRGRBLzNiMzNFeEhLNlA1UjYz?=
 =?utf-8?B?c1pRbHBSdlprMHNUNElqRFMrMXlqVGtid3JVTmg4bXg4ZUU1TGdaSjhwZFd2?=
 =?utf-8?B?em9WMlVGeVBncE9Xbm1QR0thaENhbExLVWdJaDRKb3NKaFJuUmhkTkxSNXRm?=
 =?utf-8?B?WkdzQUUyZXRLNDV6YlpRcGFYaTVNbERGMDJrYTdnMkF1RHA2S1hQZVFINC9F?=
 =?utf-8?B?YkhmZlkwL1JTWFZPdUxPaDJLSVExMnlxejJqZUNya0JjRkhFbVBLL3k2Y0NQ?=
 =?utf-8?B?ZlBrZCsvM2NvWmF1aC9Lc2JJZmE0N2hnTTcrT0Fidm05UmdnZnk2Y1JaMG9i?=
 =?utf-8?B?RDVZbFRtR3ZEa2daeXl6MUsxc0FmUWlpSmdPbWFMS0tsU0o0cTJSSG04OW1Y?=
 =?utf-8?B?TG5ONFVZaXIrR1RwTFliTWhiODd1SDF3MFJkNDd1ZlJJa3pDWjRXbE1OSTVk?=
 =?utf-8?B?c0FCbVhQZm5GS0RVdmtHdHVDVU9mOVFwUG5GM1BoVFJuVXk2MWlyL2RBNmdQ?=
 =?utf-8?B?QWREa2hJeXFLUFpNUHRPSm1NNEN1TFlCUFRvOVFqWTdLTGs1STdGeUo2Tk9l?=
 =?utf-8?B?dlQ0YmZUb0FCT3VqQ3MxS1JYRlQ3T2tZT2xxYm8yVnprL3NsUitaY1ByT1V6?=
 =?utf-8?B?ZklRM1c1TVQrNXNPWDhLY2h2VFk2Q25ING5tZmJCaVVKbFJwRjBablMxbVZO?=
 =?utf-8?B?WlBHTTBzc0lmNnJQYXhtbHYva0t5T1YxMm1VeUlSbHN5Q0NYeWx6RXV0VHhj?=
 =?utf-8?B?MG93TExIZnBYM2hDVlVjaExiRUdMU2VtYURuWnZHTW91WnozRXRRL0hYRUFP?=
 =?utf-8?B?VUE2aHFxdGs5N2h2SVFjaTJ1enkzWXVEYTl5Yms3MlJkK1ZnYnJOaG5qUWFp?=
 =?utf-8?B?c3M3eGRmNzRTd0pJNWdGUFRseDVzVjBUajEraXliQnFvRUROVmFUNnFaWXdX?=
 =?utf-8?B?UFpRWlNjOFJWTEUvT0EvOHBYQjlNVXV1UEJHeXVOWWp0dWtjUnFyRlR5OTVQ?=
 =?utf-8?Q?bW+p/eHSe7UGGv8qYy9uzJQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f134c820-b2c9-446a-9d41-08d9efa58d18
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:34:17.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAxjXeVOjyyQoPkoWiKyOPCRh6do3YzCyl8dsmqS1X5SOM6w6fI2RJdqavlmUUUqFxNwkuNXHHAkBUxRXh8PRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2431
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 11.02.22 13:40, Roger Pau Monné wrote:
> > +
> >>>>        for ( i = 0; i < msix->max_entries; i++ )
> >>>>        {
> >>>>            const struct vpci_msix_entry *entry = &msix->entries[i];
> >>> Since this function is now called with the per-domain rwlock read
> >>> locked it's likely not appropriate to call process_pending_softirqs
> >>> while holding such lock (check below).
> >> You are right, as it is possible that:
> >>
> >> process_pending_softirqs -> vpci_process_pending -> read_lock
> >>
> >> Even more, vpci_process_pending may also
> >>
> >> read_unlock -> vpci_remove_device -> write_lock
> >>
> >> in its error path. So, any invocation of process_pending_softirqs
> >> must not hold d->vpci_rwlock at least.
> >>
> >> And also we need to check that pdev->vpci was not removed
> >> in between or *re-created*
> >>> We will likely need to re-iterate over the list of pdevs assigned to
> >>> the domain and assert that the pdev is still assigned to the same
> >>> domain.
> >> So, do you mean a pattern like the below should be used at all
> >> places where we need to call process_pending_softirqs?
> >>
> >> read_unlock
> >> process_pending_softirqs
> >> read_lock
> >> pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> >> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
> >> <continue processing>
> > Something along those lines. You likely need to continue iterate using
> > for_each_pdev.
> How do we tell if pdev->vpci is the same? Jan has already brought
> this question before [1] and I was about to use some ID for that purpose:
> pdev->vpci->id = d->vpci_id++ and then we use pdev->vpci->id  for checks

Given this is a debug message I would be OK with just doing the
minimal checks to prevent Xen from crashing (ie: pdev->vpci exists)
and that the resume MSI entry is not past the current limit. Otherwise
just print a message and move on to the next device.

The recreating of pdev->vpci only occurs as a result of some admin
operations, and doing it while also trying to print the current MSI
status is not a reliable approach. So dumping an incomplete or
incoherent state as a result of ongoing admin operations would be
fine.

Thanks, Roger.

