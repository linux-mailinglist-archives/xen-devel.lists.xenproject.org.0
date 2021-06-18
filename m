Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753A3ACBF7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144629.266185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luENE-0008Fi-Qd; Fri, 18 Jun 2021 13:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144629.266185; Fri, 18 Jun 2021 13:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luENE-0008Cb-MG; Fri, 18 Jun 2021 13:17:28 +0000
Received: by outflank-mailman (input) for mailman id 144629;
 Fri, 18 Jun 2021 13:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luEND-00088m-RE
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:17:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ddfd478-9cc5-4fb6-a6ab-d05a34cabf36;
 Fri, 18 Jun 2021 13:17:22 +0000 (UTC)
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
X-Inumbo-ID: 6ddfd478-9cc5-4fb6-a6ab-d05a34cabf36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624022241;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1fnVB9OmlOEYBx41D1wGL13OYZu+H0R7LN143SZik0Y=;
  b=dy8LJD5daA9Kj1feinTDzCxrnAmvFm0JEhXTRbe6dTWQyzE2D9SGFmrz
   wHSDUL6CW5EPdJxqoTWJpThchjgldGxJy3UJ7Xb5K3SE7FbN9BUBk/ukb
   5iUIKOZsfjwG8wH3WBUaE0RnCVlkMlb9Ll+dOY3ufPmvr34WWU8BOG476
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: P1x3jPSbjH34GO9UvPIjlTfDqkv6kTbh36vrNwG9Ec55er2oxOTzZQ7d9ACD89hfuvlF9tAmQO
 +kTQghakBYIjRQmlNk5GAjkg0JKFINRfU00ElJhBVs8Px9a1x4/tTqULNHVZdO+0psLrlz8n9L
 QnATpjk+DKV69a06cig/KgmVvvnnGuqYq4uo+hE27B8toE0TxS8A5mq00TM/9RiJGXhKgohz7H
 6qjjlZ61cWboGYp1Bw5u6a2dyscVs0GpbCAPGBwUgXmk0J9qsPGXvzoJSSu5WlLPoCwCwdkYHr
 Izk=
X-SBRS: 5.1
X-MesageID: 46458779
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZBDRrqAnr8Sxj5jlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfmSS7/yKmTVQeuxIqLLskNHK9JLjJjVWPGZXgslbnndE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVnUi33PAhLY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iDnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoh8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K0uZkRkIM8jgYJq3MsiFBs/KuZHIMu60vFmLA
 BWNrCY2B4MGmnqNkww1wJUsa6RtndaJGbNfqFNgL3M79D69EoJhnfw//Zv6UvowqhNAKWs19
 60RpiAq4s+OPP+TZgNSdvpEvHHRlAkf3r3QSqvyAPcZd860jT22sXK3Ik=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46458779"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR3K6KArAKq1IatGyKoG/ywxe33lZ4YZhBmA8KHk3CuW9th92Mjtlm/ayjO257s0haWDku6ZD62LGg/9e0itJ5RNpHFXaXgO25DQzxNLnhKfOIUI68abh6EqSwz/UJROR7tUe4OJOyXmwBrtT2AbTv6iwl9w6QXxGAmARRJJpy/XFnMBj6LM+DJVwxfXG608px7c1/Qg6mFbpuaLHDEnCgc6uLoLAPbnQCqAG8NHgV76y2M6KojWxMI5+xGf5KxfaXs4e7eHVjCZ4ac8rcra0B+XLAhXmVCcVpnFxPoskE25AWekw0oM7oVTOyd/is8yxFu4KYlb973o8cNdWK9asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg/jbZ8J1nK+vnOc0wVqtFWyFy4INKNXEvhwpVRBqOE=;
 b=C/Eq5MpL8smcc1i7zqFTggC5j2Ow/u/Kw2uc/r901UwLnSoCzaYRlyH8J01ev42f4ljeZcLcunLiaFZ360ubjdann1BdP1l57W7jOeLg8w5XBGK4vOFJIfgQuNjQCeLpB5GE2VzaSWvqt0ExWWVJcj8yzLQF9SIfgVUOKI3F31fkcrckat5x04sVg/bT58E854ykvhaOlc1hp1JHkVmnN8NXxgDDMo0xYYGYcjjLzCP8VTRfjghCExfzBluhVfol31OLLzVb9DrNDgJ5nyQgFSOz0DLVo5lw6eMsGf0MBx1Qj1jpzZ+k3sZhlXt7Z94eTvKi+a9EyQSEHhq5Gs4DNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg/jbZ8J1nK+vnOc0wVqtFWyFy4INKNXEvhwpVRBqOE=;
 b=SINb94AVO/hKchW6w6xX3lANSfRelxoGKXr6gmJOirDQjz8Ht8nyk5RS3FAd0WdZE/URhecOF8QyI1AlwiTTpFtymX1pTVw0aQaERxmOmIfuMoX148N1ZKXUC6g7GbW9Wr0QkwPNdQyHo1R+nFFRuQJIqLzFsuxu3klp0yafEu4=
Subject: Re: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4eb5d3fb-db71-5981-e6f5-0503ff896fd9@citrix.com>
Date: Fri, 18 Jun 2021 14:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c4dbbe-76d9-48f9-5e96-08d9325b6592
X-MS-TrafficTypeDiagnostic: BYAPR03MB3990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3990C0326A16B8328D5567F0BA0D9@BYAPR03MB3990.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArCEi2vY/TL2UabBV30rv1B/RYiH30z7haHDS//guVU/dA0OXsi6vKO+ZX7DSZO/zNI9YEwdF8Ua/lUrvpCBoyyLNfV9dEKIgkLT3ydfkfXrfe8MxoTRHbfu+GwEm/Dhgp/AXXTkDP6L4OCj+X9tbnbQF2GKjT5G1TrUnVYxZq8++QbX1ISkcQq2UHxQqTKpOMderVZODenZLXe263ZQB9fuK3qNf6Ds3qUuLySA5MuwxJYRKkh6ru2gxpj0098eqPUu4KdErmXXm4muvoIOJ73NW05qPapnLGT3QyMVYTXNKDi8iqOvtTa9mGknjYD5yMekLmT04gzThhsFKXUhbQMVIVR3LTm7BQLNGsLlMd65Dv3UNgiEpNJI4QnKvzBKYzYGn4m5e0SvDTxkVxlvlz8mmbXj6y1TWkjvhVYU5moR7rULHRQYHfvN3srPRpVGeUbM361nMQiXjOFNpew5dOjFZgEynf9GVwYqceXYj2ig+NIwdNoxSG+hrkQjJAuqU2tsmi87yp2XXmzgJ4N0CzuLQuKWmAvk5nsYOuf/5BO82terJsG2tt+YNtHnN0BsmMaWui8Av6AZrrWw5DTtVbJA6j33WThjHlTVd9cx/kYNiUy1WBwTHJjZNuc+iXPFChcQE+t0YEi81JjVs334SXa1S8HzrmSksEFUIds1re4cULVwBslDNy5iQBm1jFghcdzarH5NTSugkbtjRBkkPq1V0hEu95T0oIIQIbfohOTpGt9Fxy1DwcpGipgqFPH/wVE8gtBVrdBnZ96isSbB8qSnG/Pcr8WxPScxBCRQPtpbX3e0BjTLufA687TJxggC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(16576012)(2616005)(31696002)(956004)(54906003)(316002)(26005)(478600001)(966005)(8676002)(31686004)(2906002)(36756003)(186003)(4744005)(16526019)(66556008)(66476007)(86362001)(4326008)(5660300002)(38100700002)(6486002)(8936002)(53546011)(6666004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxZeExMdmc2a1drQnk0MUQ1UHEwbytMN2Q3WEZwbWtGMlkrN0Z6d1lQY2VY?=
 =?utf-8?B?cUJ4Mmk2UmpPWGkyc0ZwK096eExUWE4wWUNRYTJmeHBqWnpOaU1RNjJtOEhu?=
 =?utf-8?B?UnFFZVhIVk0yQTN2Zy9OMGFOL2IvSW9EM1JHWnpiNmZMTWNhS1VydXlmWHZx?=
 =?utf-8?B?cTFyakRFd3dPSEIzU05LM3p0K2IrczROL2krY1hPYWVBNTZaUVJzS3dxZ1RK?=
 =?utf-8?B?Q2cwU2JlTWdYR0FoZVdSUEZTbllKMGY3TGR0RE01dmVOOTRGWGNXYk5IMVpI?=
 =?utf-8?B?UERBMGZBdkwxRmt2TEd0b1VXWTF6bjFZNWVDTHdZUElBT0hqQ3JBaS8zYm01?=
 =?utf-8?B?eWRsaG95R3ZMMTZ3Ny8xNSsxWndxTkZQWWZkS2RFc3JzL1ZlcTF2TWlnSkNk?=
 =?utf-8?B?SnJtc3ZZeGR1cVlDY2luNUZnQ2MvNFg4REpONTZ4WktBak5WSDhrcmFscnY3?=
 =?utf-8?B?VnN2Sm50cWVNU1p2dmkxNkZGOUZ4UTVCVStnZndMa1R6WmNoc2NsZ29iaVZF?=
 =?utf-8?B?cWlUTFpTdE5jd3lqM2UvK2l6Y0xUQUZpdmtCUTBUUk0wSVkyeEFzMlZpcVJZ?=
 =?utf-8?B?dTNvRzh4Q0p5Rk9maEtTVjhreFdEQkJLbWFhbXdvdGNDT2RyTUtjSURETlNS?=
 =?utf-8?B?VXRKSDZRR2Y3THNON1dwRmIyWU1CQWZCL1p1QnltRHBtaVR6S1dFbVNtUFFv?=
 =?utf-8?B?c1pOK3RUSzdTUEFST0psRXFqYzdzZmEyRHNqY29BNnVDR1hrTTFUZDVQZzR3?=
 =?utf-8?B?aVRRc1ZPMTZFVkoyWmVrWWlEckpDaTVnQUxzdHFvbkM3Z0tlOFZVZ0tmTGJ3?=
 =?utf-8?B?WnNiK2M1MmhVRlU3c1ZYOHAvYUhDRTVWRmluckFDOG9GTHg3aDl2MlJId21s?=
 =?utf-8?B?SlU5TkVSNWpwSFk3cElyNzFWcVVLVDl4bDJjbjRXWC9SSnA1dmpQdGp3ZDhV?=
 =?utf-8?B?YjVqTytrL0hyZ1d2QTdNTkFkODY4M1VhdjJsTThaUkJ5T1FEMmt4MjFZT3Ns?=
 =?utf-8?B?T09QblFSRnZrU2tNOVJZUDF5TnZaeFFENE9jeXliQUNVbmNyY2t5QUwvSXhK?=
 =?utf-8?B?d1lWcktCTDk1U2pQV1JzMHhQRjBMOUpRNGIwSjRpUitNU0xzSmxuUW9NZjh1?=
 =?utf-8?B?cmpxa2Y0bmdJOWZOUGhVRWxqMzZpTjNrb0VCUzFGamRWd2tMZExKb0hRdkVu?=
 =?utf-8?B?WjZIbW1FaEJGc1Vhb0Uxb3c4bVI0L1FHUmhKVCszM1pwZU1PSFpBNU1kYjJZ?=
 =?utf-8?B?ZGpsQ0VPbFpINTJTNTN5SHM4MG9WeFRQaUYrMEpsaGJJanZnSkNRUEJjcFI2?=
 =?utf-8?B?cUlWc2orZkcwU0pQenRDc1lxbGRWMkZvRnNMR0tMSm85Qm9WcmVBRWFtcHZC?=
 =?utf-8?B?NWNMWkV6d2x3UTBXSFEzZ0N4RnZHWnBIRExsRnUxLytHWm95cmNDaXprcDJ5?=
 =?utf-8?B?alRMbHdWTzkvcHpCbDUwcEZPM1N3U2VTeDhmL3ZEb2JvWHB1UUQ2eFRpT0RB?=
 =?utf-8?B?UXAzYnI2LzBTbnA3aGFoMC9qOHY0MGJHdTdGN2NEWDJOR3U0cWJJdTMxMytG?=
 =?utf-8?B?NjA4S09mbm5YSHNwaWw3ZjJkQ2RXK2FnaDFmbnFyRTZBTWhWSlkzWDdWNFI1?=
 =?utf-8?B?UGJpM203SndUeTJLeEM2bkpyL2crMW9IVkxHQUNWOFduWlFpcTZkVUhyOGln?=
 =?utf-8?B?NFBCRXZCMTIrbnFFQkdpSlNCM1JYOWJ4SzRUSms2VUVIL2tlRlM2UnZQTVJp?=
 =?utf-8?Q?fUh3+5bBp4HvqZc6q8S0qPcahnKIcj04aRXSkY1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c4dbbe-76d9-48f9-5e96-08d9325b6592
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:17:17.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MqBRSXA6g5TfQxpI6Ka1RzM8AWHy/sjoff+iA1IJrMIAeJ1IkRQb2klNM8ZiNhPYK3psZ1AjOT4PNKgExhz1JNMqaWCT4G8KG+zd1q8Dj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3990
X-OriginatorOrg: citrix.com

On 18/06/2021 11:45, Edwin Török wrote:
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index d05d7bb30e..4a230de8b7 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -34,6 +34,9 @@
>  #include <xenctrl.h>
>  #include <xen-tools/libs.h>
>  
> +#include <xen/lib/x86/cpuid.h>
> +#include <xen/lib/x86/msr.h>

https://gitlab.com/xen-project/patchew/xen/-/jobs/1358403495

CI says no.  This needs to be behind a suitable ifdef, for non-x86 builds.

(I've not looked at the rest of the patch yet.  I'll get around to it at
some point.)

~Andrew

