Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1A445470
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221544.383311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midKB-0001so-6o; Thu, 04 Nov 2021 14:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221544.383311; Thu, 04 Nov 2021 14:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midKB-0001pv-2P; Thu, 04 Nov 2021 14:02:39 +0000
Received: by outflank-mailman (input) for mailman id 221544;
 Thu, 04 Nov 2021 14:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1midK9-0001pp-BO
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:02:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db29b5b0-3d77-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 15:02:35 +0100 (CET)
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
X-Inumbo-ID: db29b5b0-3d77-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636034555;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZtrsNs/CSj51LF1tFa/TNOEhgy7T08adrRfn++QPxuM=;
  b=LmGJSaXc+IMAM0OOZdcDtTNy/9WSq3dpImYX7B/YX1h+7PGweOdTomrp
   rZspswJBsmldYVDmkURezcTTFFmBUMEFgyEW4BBg8ERmrpHkZ+gyLRy7R
   j2xTGHn5LVerGpKGdrlAjftGKOZa30okit9NlywmtHMXSzaO3OPeCXngh
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MF9hJa4ocq3HKYOoI/Qvv8giDfMBbmpEa4aEozyeLBxwmiumwrMZ0NSUAcoiIPgUKPMG3A1ARB
 C19UvDA+/A7zS8lLcCzhvhpI/oW8JgjGX8yId3KUCpEv95hf3zDCgT4jf5+xDqAttSml4jkH/r
 P+eccH2pICED2CJ8WKja3NtU/rRF2DVeCEF7B8TklggFPdfOYvYbK1C3Zf1BzeXi0+oUYUik2z
 5YomspM+LG+EcwixQ/j0EJzC37pl376gNXQ0uUqLaxpbrX3mzEU9BFDsQGAYy7oQybXDQmR1g2
 A9bpHb0aTSeprnwN1W6uEZmB
X-SBRS: 5.1
X-MesageID: 57102438
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zdFXqatXmhimYpmgJW9AWGUUVefnVMtZMUV32f8akzHdYApBsoF/q
 tZmKWCGbvyNZmTxLosgPdjloU5VvpTVyoNkS1Ft/C02FSka+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsqSdEiESMvf1hN9CfkhRAzhYP/F75+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258XRayCP
 JpxhTxHbw7GSBsSM1AtMMwjn/n0oEu8eScHtwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoQCbm5+/hCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaFoRw0S9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcDdSZexeLv+rgvtU3iH99zCYi30uDqTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFwHZ5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8Ahkiey+F0e5eIFcFh
 XM/XysLtPe/21PwPMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhNxwP9iY
 c7LK579ZZr/NUiB5GDmLwv6+eV6rh3SOEuJHcyrp/hZ+ePGDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg5N++/A80i9C1mVcHuVH7xs0UejU+UxP53X7M8fKU99fwlyvhxT
 vIffN6HDOgJQTPCkwnxp7Gk/eSOrTyn2lCDOTSLej86c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBoorwS7l+E0NWEnP197GzMSWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi/uYIwB5lEXPHa0WQJolhenTWj9NSsqBtx6NCvVfkU
 Ey45dQHa66CP9noEQBNKVN9PPiDz/wdhhLb8e8xfBfh/CZy8beKDRdSMh2LhHAPJbd5Ktp4k
 +IoucpQ4A2jkBs6dN2Bi3kMpWiLK3UBVYQht40bX9C32lZ6lAkabMyOEDLy7bGOd85IYxsjL
 TKjjabfg6hRmxjZeH0pGHmRhedQiPziYvyRIIPu87hRpuf4uw==
IronPort-HdrOrdr: A9a23:hRfwdqqQ6wq8Qa6UiJgqSQ8aV5uxL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="57102438"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFjGzfuKjviH5Yj+fBVcvh8USoCNPegpHDE+QX2dvP3A46665C2DFhJxinf1D8I2UrQNvKl9GutovyOr3M2mQiPOJai3Cr8mXPXKUbNkwxVTOUJXUhn68AFnSungrCNP85YpfMQb0wcnxq0+fymv3lPbGyCmnZIlZrFExRn+ZdSwnpBaYInH1RFGIZzpfNcy/3WnmcI65QAUBSfXD4SM/pLz6F5RLI1bswvEDSHjyhYg62WW7sDA4IEZeQjVDIdVc4O5QaqbYNfiwppCFIxGFKdU0bXjeo6BaDtBC888QVCQj5vGdGJgdWm3vM7doZ4mq9bzeghllczShm2IcAQVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhoEmf3Kw3ApVvwIm5kTVVfM8ZKNc0WwCJO+Itvf1r4=;
 b=oHy8et+EW4qJu7jb38gnuiO2Twr+7g8LVsp8L9cj8w44HKXQYfyMvv2KLihxMmA9ZrQR9BnaSJ1OqdyXChGIEs8T8b3+exK0yOdZN8mLGjmuMlWc2k386UzPzzwyb2wBtoQz+8GBfwr7bngLTiEmuGkKFTdcuz/utChU0TUj3sbrpy0ZSv43sGPtt+yx8xcUme8vgOP6ftpQljfUHSwEMI2PmnqtQcV3skImw6T0hzW/JTtHcSq7lomZZ3VccORbVn2k7+IE+zSM50uKwXj7h6cETO9x7lANN0dhjaa4XC1DassKzb7hM7H8ZHU0zfMaIVok93slzs8DjmZlvid/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhoEmf3Kw3ApVvwIm5kTVVfM8ZKNc0WwCJO+Itvf1r4=;
 b=XGKskXAD2yEdHwPvSHS/Wep8cmpQfgFrVm6fHIuF3Ty4VAxNDx1Ywp3345VnjBC/PZ/ufY/yyafNTnaVQmvdJbrNpiW2+FFmjSaAZfSfI3TjX/KecmgHhXiRXBgfiR4WS1kzbCaHn6bg3SbynQRZ/8iLcIiaNR24IKXQbHIQMws=
Date: Thu, 4 Nov 2021 15:02:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, Edwin =?utf-8?B?VMO2csO2aw==?=
	<edvin.torok@citrix.com>
Subject: Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities
 to the toolstack
Message-ID: <YYPn674C9XJhrwhD@Air-de-Roger>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <20211029173813.23002-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211029173813.23002-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d849ed20-1f79-45bb-6b64-08d99f9bba44
X-MS-TrafficTypeDiagnostic: DM6PR03MB4473:
X-Microsoft-Antispam-PRVS: <DM6PR03MB44732382419F71B1A89E9A558F8D9@DM6PR03MB4473.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zocPBwVeiJLxJWYgVP5m6liI1M3ZYl7gHfsfhkwWReJAcZnh4w2l3rDSplIW8D3ro8ExNGbxeYXzNUi+MyG3hLIiPWoW2X4RdNFBa8fWGCEyO6UOvPe2F8xmmUp2p1jYi5rrMsCP3XJnPEAfmNzBNdSKBnhvzHp6bQx0I3RzjkkwZB2IQA0efZeV6e/oIgoB1UgNFfpO/Lp8afCOKRouR9cvA0anP3hf1Yrl6U4BFYObrW6YcwDbz9VSo6n6iW6OYuYzmM1NbtRFCw66Yh7X4C0dTKZIPB98rB7ldQTxr/udm589/s3ljORbo+pHwXwF9FeCfeVAM96Sd1EGXtDLGmLYbw0ya+R+OP+YWOaLV7du9Eisfi0hAJGjTzPR8aI+GuqWSwVDtvPHnHHJbZAa87ezXM4CCNk8L6iXp5ziDIcJNu7xAIzZWrzpyjM6KrmS/Do7/6LTyqQUuZIqAQJbJVATARUHltwupzurLNR/PzKd+BYKvkWvnCREJTW/fLrJEDtuTXgd/lwuFtHSFCL2F2P6BUqeul7uwrFBWgVxM2lBxeGMcffbx0RZjckAG1ko1AP9xfCJNZzaVULa+yIUKVcnucSsZSth4BhrXEQdyGZp5SjwEI6WUg/knLji94M9YAPXWPiwfjizm7+CpoZOlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(5660300002)(82960400001)(66946007)(66476007)(956004)(6496006)(2906002)(6636002)(33716001)(4744005)(85182001)(66556008)(6862004)(186003)(54906003)(316002)(8676002)(38100700002)(86362001)(9686003)(6666004)(508600001)(26005)(4326008)(83380400001)(8936002)(107886003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzUyTjZFeGx0VERFOW5ES0NXUnM2cXd4N3FYNzYvOVhyeXVseGNiN0J4QzlN?=
 =?utf-8?B?K01HRS9scHdtY2F2emxzVFpZd2w2czRmMUNTZHh2SVZpTGNGS2FJUTd3cjNu?=
 =?utf-8?B?RU5kaEZkamxNQmVPZnpVd2Y5VFQrTmF2bEdlWFMydWZ1RklrTFJJQUdzM1J4?=
 =?utf-8?B?Uzl1Ti83cUp3cWJSYXlWL0cyVkJYdXR5aUJ3cjJZTDZaVlJjTk1SVUphRmtM?=
 =?utf-8?B?QlgrNlBOS2ZsOUs3aHp4WFJ5ZEk3NGY0YlpGUVJoOEZ1c0tCY1c2UkdKRS9q?=
 =?utf-8?B?eTVzQjYyRmxWOXF1S3ZOdGpyQmxtU3pYY0QzeG5GdzFSQjlBMk1uSWQ5alhQ?=
 =?utf-8?B?djdBUFlUaXMzWmY0R0NWbDFDWGxzcnBrc1hyYzl3L25rWjVyczRlUHY1OFRa?=
 =?utf-8?B?YUtyL0tGMERYL3p4OEN1YTdpNnlNV2NnNnZTNGdrUThiYWQzR1g0KzQyMG1C?=
 =?utf-8?B?Rmhhd2dqTytRUzBQMXVTWTJZb01GVmZuaEJjZ1hZUVFkUHZObTVLcEZhaVhi?=
 =?utf-8?B?MFRSd1BnbGxlcGtQc2VjR2U0cFVyZDQ5bUZHOGdVK3RLKzhwUkdPVmJDZE9G?=
 =?utf-8?B?WFYwbzRNekYwNlVRSUFMSEtmbnZEU2Vpb05USjJQRzAxK2RQZFJ0M20yZUkx?=
 =?utf-8?B?SWkyVUo5UFhrSnhMd01XalFMRzBJQ1lJeUUxa1d2STNBTjRyK0o4Zkk1akRt?=
 =?utf-8?B?SlpTY1J3WmlFREtJREJhU29nTFlMejNSanlqOFp6ckkvUGM1U0RnUXJOVXBQ?=
 =?utf-8?B?Tm85c1V2dEFVLzRVWUc1MXhJQnQzZ25qREdJNW9uQS9oNHVrczV3am5JRW5j?=
 =?utf-8?B?b1NuSnlyNWdTVHJSNGY5ZUoxQ2JpUEpiSG1BWGJqNVhOcCtvTXE0UytsT0N0?=
 =?utf-8?B?WGVmWUdvWHNGeFhjbXIrdEJ1bEdvcVVHMVZZdVl3bExhTE1hMFhIc3BaMWlD?=
 =?utf-8?B?QXpyU2YwT3YwbjhmMWdPZVdXUTRyTDhSVjhqTmZodUIxelZJQWlGWGYrbGRO?=
 =?utf-8?B?SDhxVlRuRE5DNlozc0FPTEc0cTZxT1djNThqMEdJaVM4bTBYeWtGdlVCL1hh?=
 =?utf-8?B?MVdwUjJoWmwrK0lHcklrRmxTN1V5anhEL05hVFZjSkVwd3lMOHc5L2EwNHEv?=
 =?utf-8?B?Z2pmRG9LRGNqeGlEK3pxLzk5SHlSOU9nbjhBMS8vT0dVODY0RVFMaDFEVEdq?=
 =?utf-8?B?Ymg2anZoOFhiKzMrdERUSGVvWlhUbDBCNkhNNE8yUHlpREFLOVdjbWw4RWhU?=
 =?utf-8?B?Zm1hbytXZHhQaDN1QlZNZG9LbW9tVHVEYnNlbjlhYU9nSU8xNjhtQU9qYUcz?=
 =?utf-8?B?RllKam5wM20vcDBmOG1BaU9tRXgxSlk5VEloeGdsa2Q2dmxRaGR2L2ZEWFFl?=
 =?utf-8?B?MkVGSE12eVhianJsOTFMRzFGNW1GVWgwRnF0ZUhRNUVCd0psRDRuZklraTFH?=
 =?utf-8?B?YUF0NEpUcDFGTGdBb25KYTlrTXVRMm1EdHBVSTZFZHNrZ3BFSlRZMGF4dEhZ?=
 =?utf-8?B?SUNlUkRWaXBZTlZWc3M3bzJFdURZQ3pjU1Z6aG41dXo0Q1FVSlM5REQ4WVF4?=
 =?utf-8?B?N0Y2NHFBUHAvSDhKVU1qRVl0clVtcitQTGM4OFk5Y0svbC9jeGYzdDB0RjRw?=
 =?utf-8?B?Z3lUNWtvMkVaSmlVSWxkRkpFR1lUYzdtWWJNaElYcDBnOEdhRk80cEN1VndJ?=
 =?utf-8?B?a05uT1RXWENEeGIzVG9FWmFteWxzQlJWZkJKS0I0Z0VHMVM4NW1tbnJ2SVFQ?=
 =?utf-8?B?YnQrU1hXNmh6QStDYU94Z2Y2dWE4TVFuQ2g1TzdBNERLY3ZEb05PVHliV0E2?=
 =?utf-8?B?MEw3SXgrd0dVOHNUaTMxWEY1bkwvZmNtcEs5cnE1T0Z4SDk3R1piTjcrZlls?=
 =?utf-8?B?a0JUQktxWGFKVWo5V0F0NVBFRnAvdlE4aGVROGgxeDRMSFRSRGpyNUM2WWg1?=
 =?utf-8?B?TFY3SzkyYXIyRW1xcXNDWHNUdlV6SVlYNTcrM1ArSkNFMU4rYk5BN3drUXVC?=
 =?utf-8?B?MXRzTWIvQ1M3N0FEZVNFK0dtL3lDUkdMYmU0aHZ0NUM2NElKZ3hFVytEL0E3?=
 =?utf-8?B?c1dqUExUOTZ5WkdNRzg5MjNKQWt3WTVqQVU3MzVYOC9VMUQxbmQ5SkoyR2VV?=
 =?utf-8?B?NHo5UGFqczNYdG52TVFtVUdiOFp5NUZiV1VJdzV4ekZyaDc3L21sR2ZxUXlh?=
 =?utf-8?Q?dc2rbVbSB24Mergtl7SxUC0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d849ed20-1f79-45bb-6b64-08d99f9bba44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 14:02:24.5221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb22+GDwc2QxwRX9v06IRe+EnR9dqlRnK6rNZoUVLxMXT48Vc09vM1nCOyElVU/cPGID/i7hEWLvIARwRR89Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4473
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 06:38:13PM +0100, Andrew Cooper wrote:
> In order to let the toolstack be able to set the gnttab version on a
> per-domain basis, it needs to know which ABIs Xen supports.  Introduce
> XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
> userspace.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

