Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8494B51AC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272189.466986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbS4-0005lb-CT; Mon, 14 Feb 2022 13:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272189.466986; Mon, 14 Feb 2022 13:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbS4-0005j0-9C; Mon, 14 Feb 2022 13:31:36 +0000
Received: by outflank-mailman (input) for mailman id 272189;
 Mon, 14 Feb 2022 13:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJbS2-0005it-IK
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:31:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 693ded89-8d9a-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:31:32 +0100 (CET)
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
X-Inumbo-ID: 693ded89-8d9a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644845492;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z+cB0sqWlgdnGR5o8AFGcjMgr10K4PMs89dkpQ3ajkQ=;
  b=MYexF5d5iiPO9tY1Hu9rIBsjKDVWDHHe4ocDvrCweoEpkI1yYL0lgcO+
   zOFK16QHhIBbTujkPwemHYalTTMP3nBYJd+YUtX+BwHwkr2IUllRCBvey
   /oEtfbyLqgDps21nNpeBu7RSlj9o2HtBxO6MDbPFtNoFflJZH1GHCcT1J
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TE7x6ORfD0MEURW9mKjik0/+tKEU336540cdf0OjtjVsqZckuLMp0vPlq8ABUcrdfRW7jWr8uz
 PjQaGIyx+8eZ+QsTrVLUT8VI6grnSWiyuawBl9tIZo8O/V13GdoaCIRS+A3dx6ogZeFE+Lo51b
 rHqeYJTq6RpHQmAKnE/HNUBEp9egvH/qTJxg3BZ5/dAUDTH+CqP8bnar7xIsChSWpIsgsuR0r5
 lFB6YQsOsL42/7HfJSdAJxIOfrScuNeJKQ58/4twZTJfceejAX+Ii8RsnmVMFjjxN28/PxQfAM
 6sXn48W+mwPpMhDD0k95UiAR
X-SBRS: 5.1
X-MesageID: 64556697
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m0OtxK/afDobQ1pCdAQEDrUDV3mTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jdLWGGHaa6MYzb0eNBzOYiy8UpQsZbWyNRiHVNvqy08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhcx
 4lkp5qwTD0JAZHotcY9agQJTgNHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SQKuAO
 ZtGAdZpRBOeehAIE1wVMZsjzcew2XXyWWUClE3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0dtUMOv886AS36pXoxyu7JlEZH2NjUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb4
 hA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL/ItAAvWwmfRwzWirhRdMOS
 BWN0T69GbcJZCf6BUOJS97Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziFuJo
 ogPb5PQk32ykoTWO0HqzGLaFnhTRVATDpHqsc1HMOmFJwttAmY6DPHNh7gmfuRYc259yrigE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:hL3YSa2XWPgRoHp2eYJFkAqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="64556697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQv6jwnEJ+sNr7lIfHqyqyIwCuR5pgqxWkTeYNolqiXKDGETv6sYOPRhawYlU4s7gGEeBx3mf/vN8K/lEz2jyXffM2jAEkqBQf0uEezQE0urst83LWd9bX5l4xug+YP9N4wsVEcnUH3uTOi+0kJdOzFq1VcDdLmp8ZO87n3JOPL2CvOu93Zs/ifKe7+QSvcG/NdUvy9dfd2MojW69NLg8u/qcXTj86OBe6mpLYa9L9anAyc9/5arVmO1jUmWm1slkg72AnnUYeluFrK8CgrZWKPh/cx5q+0mGcxgdj4y41+V2K52fufGYBbKRazsFurNZOikp80I8Kt+BDPQIlbu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+cB0sqWlgdnGR5o8AFGcjMgr10K4PMs89dkpQ3ajkQ=;
 b=hqG1yb2+V9BwrrmJ37vGn5Qy5DkISGUS7wnavArg376IKqY+f8Ct2CAbbpWm3ui9lOxADk3hlrm+LHKLV/9Za5RVnIKAw6aERiLKyDVpfwTCMG4gliTO3pOklnPUa1ajMsjKb2SW0/UUhyhEz8O1duGg6kFwnJjjiAxkC7/r+L14f4X/eKWPZtTK/GqPJMPJiYcb6wwqEYfwlzxpG5nDyAUCaDxVF28OtRThidmaLkhuCS0ccuxh0aFQhIWge2mVchqgcFtVgpYR51so9KtDDX1NaMoPO9Ic+w4QcK6W2lbPiDXOEL2gQMYb5Pg2FOUdlWaY4VEkaJpmTQGubgEFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+cB0sqWlgdnGR5o8AFGcjMgr10K4PMs89dkpQ3ajkQ=;
 b=kCRZKjt/IBYpWC4iN/uS/4y+HTxgCW+mlEqpNy8m0DkCM5JUZuZ+RNpEWzPT5EmX9sfxFUelFqKpC/IJam4L56nbIzYoZssywXmceSiwBqQ1Fj0Fk+FU/yYN1jK4MrtIWFE1pUjixxlfpU0ZgVUsD8eav4kE0p3Mvv35PvPjzHo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Topic: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Index: AQHYIaJdlBm1laP+30eCBtzXO5xQTKyTA/+AgAAG84A=
Date: Mon, 14 Feb 2022 13:31:02 +0000
Message-ID: <cc4cf340-f02f-a547-08a0-1261bb506bcf@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
In-Reply-To: <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b3644ac-b6d9-42a1-ef54-08d9efbe3eaa
x-ms-traffictypediagnostic: MWHPR03MB2526:EE_
x-microsoft-antispam-prvs: <MWHPR03MB252649187ED703E3D3B3F6A8BA339@MWHPR03MB2526.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EAbty/IN2KNWbrFydTKRlzAFvm3ksjqGIZvgj/wdVUIZZEDdKG+zwXQBw0bpiBfWKsFEmLM+/lSgD/bfvf7oS2D7i+rwHsY6sNyjqF0gRJ4n7rU5kUcuKDpgViSkujgadrlrguMyE9lUxtwci5lQYxmp735XVq5sW2YnQ6AN/iFLRtW7iYwO0F2GX4y4UKSAgdi4fN8MPGP7jjBih/QQRfMHxfZ1HNnYuP6JVlGwd7wUpef0oVU6NAXWJQLn7igeFFk0bG1PAlAHEMb85PNj6sUKlzD23Gm3B1v8lcWWUJasbcEpNxU6qrOlYxTbvvvHylCBCuT2iiEAUjn77y4O3G35Ts/2yfxXqRJ1u0ftGZDaEVAVxSIUs0A6oiVZJ/3UbcdAQIgC2Wn/z2bOCL7e5XKQd8zfZgiT2OKYTzq/dlGFBqNVpmIe1yWl4HUHoIJbIzUkQBDZHE4Bhh40otDuQTWiuqklLpwZabJtDZjaC2df0EhhiBzSPD47ZGn/3eKN0yi/j+MVzpRK82+euhaSwnYC63KeTNKjzu4n4EpwISGc3xsZQBYcfJOkljOBEtVe5P2OL7Y49wOi6PDGMvBq/tf30q4jULwcntlJnWZje6OZvx6LRmI3cFmaezx+l+QeIA9M7HjE+K4QqVK0JsMtmMIVOUHGvlOYTEqimbfsjUUIitgCOh0UV+9aaJtr7k9fupLt9OMT9d/3oLLmXMFTdUmHIu9J8mvZyCW/Qzp3zE+OvtCGoFIGx7nCvv/phcDU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6512007)(2906002)(86362001)(53546011)(31696002)(38070700005)(5660300002)(8936002)(83380400001)(6506007)(8676002)(54906003)(508600001)(31686004)(2616005)(6486002)(6916009)(122000001)(66556008)(66476007)(66446008)(64756008)(82960400001)(4326008)(36756003)(316002)(38100700002)(66946007)(91956017)(76116006)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW1BZUhLdHBHTEVFb2hwcmt5WW9zWXdTWm1WQnFXNGl6TGpaYW9KZmI4eE9P?=
 =?utf-8?B?V0dFa3k1dGxjSGNRTEtGcWVLTENTN05wbGRYa1ZOQTd6SU5GU1B2MlpBeEdH?=
 =?utf-8?B?cG1tbit4RUtCV3VlcVVYMHE1S3dCeHg5TFdBS0JBd1NZcGpDVHFER2V0VmxS?=
 =?utf-8?B?WEtMNVhmSkprYUtjZ3BXbjg3MXdYYWcwb05EOGpjV2xYM0E3YmEyY3M1M0VP?=
 =?utf-8?B?K0s3K1ZyTE92dDUrVW1ZQ01rRTFDdVMyeTk1ckVzbkMwTENJcks4WUJGOS9T?=
 =?utf-8?B?QThQalZ5L1ExSkphaXRYTVFSRzJibjU5V3NydjE3aksrQzA5RUZGaERYRlJx?=
 =?utf-8?B?SFZ4a2NwdnJJLzBqSlBXSHgrRUxyOVcwTm83N3dmWC9DZXowV1NtaWpWU3hk?=
 =?utf-8?B?NGxnNHQ1VVB0M2RGVitra3E3WHY3TDVtWTNkS0MwR3h6SXBTUUN4ZWRXelhV?=
 =?utf-8?B?YTJ6UkZUQVlEQ2Njbzh5Q0NVSHJacEd4VlhoVFkrdzNKOXhOckg4cFFvTFZa?=
 =?utf-8?B?SVRmNVNaVEo2bDlSYVg4TkV2S1BzOFpCV0RxWStHL3dXa0k1MEVTcDZLR3NV?=
 =?utf-8?B?OVYrbEdBUmtUNUhDR3YwMU5YY2NOMXFCTUYvNko3TFNoQXpiZ2tOM3hteFcv?=
 =?utf-8?B?TThBM0JXMHdLdG9JWitpRnZEaW9Mbm5hZTZCUnE5d1ZjM2EwSFdadEx6b21F?=
 =?utf-8?B?MENzeGJWT3MwOFh6Z1c1VFY0V3pzdDl6SEI0NHJxZWwrcUQwZkVsUk92eVJC?=
 =?utf-8?B?dk12bzdFN3JES2JtSENVSStDRGxyUXE5VEdNMVFGWU1DYW8zdG5WZm82S0Rk?=
 =?utf-8?B?aTZCL29oN1ZFR2l4ZnhRdjBPZU5oSEgxN1ZHcDBEQ1U5UHU0T3lrK3h4dHdw?=
 =?utf-8?B?SVpmZEt1b2NIUE1lbHg3TlZtcktSYXJ5Wmx6dVhvWmNHcy9GT1Y4YjUybmlq?=
 =?utf-8?B?a3F1bTF2RWdEbWVwUlVEZTdUVkROODRoN1JqR3BzQ05iMUdNMFVWOWkxSm1U?=
 =?utf-8?B?aDQvWm5lWmZJZ3IvVURSTTFOdDRXbGs1QmxXRmVTQzNMejJETnpqL1FpWGor?=
 =?utf-8?B?NUY4ODJPV0E3ZDZqZ1JBRmt1SHNBVTQzcktBVDhhZVI5eEFSWkU0b1dGU1VM?=
 =?utf-8?B?UW5tdERud3hnS25IRGxGZTBMbEVIaE9nZG83U2oybCtOZWZHNituZnhaNmVF?=
 =?utf-8?B?WWN6WmRmMWpBZzNCR2hRbkFwMzJzR1BtZEJ6Nm9HdTNROEZKSmxraE1STDNk?=
 =?utf-8?B?RHliN016ZnJNVlNDMUc4NWZvT3R5UlRXaHFidTNoNGFzR1RLTmNvUkN1bVBY?=
 =?utf-8?B?N21yZHYzSzZTWGl2anJNUk4weUpwc3VRcmIrbWJUNFZKNDA4MFUyR2EvU3Iv?=
 =?utf-8?B?N1ErNmUwSS9SS2pBSk11Y1R5cW1CczZQOTY3OXlWM1BOT2FiQWxST2VBemdS?=
 =?utf-8?B?WjNUSWNNdnhrZ2xxN1lHV0lEa0JxSXQyNUlvZXlieGNvQWJuOS9EQVBWd2VQ?=
 =?utf-8?B?c0pYc1VwTXBRK2lGekU3OHk3RWFHL3dWQitVR0pyRHUvTjhHUW1vd1NKYS9n?=
 =?utf-8?B?cDV4SHhwemxLdmhHVHF4UVlYdzJzR1VXaDFsYmtRZ20vR0M4dTEwbGp2UjB5?=
 =?utf-8?B?bVVJZXBXczkwUEgzYjdxRERkQmdHc1FobHZpYkJpSWFRYi8rRENjNHhScDF4?=
 =?utf-8?B?aEYzWTJIYUh2VWNqNkpNc2x3M1ZDQmlNNXg0TVZMNTFzRHgvbFd3RUVkV0sv?=
 =?utf-8?B?WU9MamVhNGVFNlZHcjBrRHo2TkFuU25mYWxsZ2RsU0dZRktsd08zdk0xZ29Y?=
 =?utf-8?B?WmluSnI5RjV2Ukh0RUNPRlRKVDd5ODlvMk9ucmRUK1dNWUhDS2wvUDFhZTZn?=
 =?utf-8?B?TjJRZXV6MFB4SmVnQWV0dG16amY2T0ltbmY0ZStXT1J6d1ordGg5b2I2TGRJ?=
 =?utf-8?B?a2dGNkN5OXI0YTNPdm9wTm44bnI2RzN4elZrSHhlN0svY0JYbk1pUGdGSXZk?=
 =?utf-8?B?MXJjTVViamROQll2QXg1Y0lkTXltV1I3ZmtHN0NucHJoMC9rNkFQUzl1SG1r?=
 =?utf-8?B?NjNHN0I0eXVnS2t6Z0RpUkx3UXFmQzhLNEorTGwwd0hKRFJoM0U3bmhFclNl?=
 =?utf-8?B?SjVFbFRzVFF0S29iY3BabEZ6S3VTZ1RHa3MwdERrTUpXQ25EZVNnR2FQaTBM?=
 =?utf-8?B?eXdMdExmYlM2amF2cW9GTHFUMmYzTFJVaWlWeFhac1RyZ3d0SjNmU0FDVEc5?=
 =?utf-8?B?UU9tNWYyWndvVXRGVDVGMFRVZUN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECFB555DA073E5419A70BB5881C01014@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3644ac-b6d9-42a1-ef54-08d9efbe3eaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:31:02.3225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxFPikkd1sf8t6NIzwta6E3rVF1GvDKmUCdFJqv843bHCvPvwBxh72c5Buou8gGPrLz3YEw8nzkMmX0BoJYfRqcMZdNwtXcDAI0Pl0G+ygg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2526
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaXRoIGFsdGNhbGwsIHdlIGNvbnZlcnQg
aW5kaXJlY3QgYnJhbmNoZXMgaW50byBkaXJlY3Qgb25lcy4gIFdpdGggdGhhdA0KPj4gY29tcGxl
dGUsIG5vbmUgb2YgdGhlIHBvdGVudGlhbCB0YXJnZXRzIG5lZWQgYW4gZW5kYnI2NCBpbnN0cnVj
dGlvbi4NCj4+DQo+PiBGdXJ0aGVybW9yZSwgcmVtb3ZpbmcgdGhlIGVuZGJyNjQgaW5zdHJ1Y3Rp
b25zIGlzIGEgc2VjdXJpdHkgZGVmZW5jZS1pbi1kZXB0aA0KPj4gaW1wcm92ZW1lbnQsIGJlY2F1
c2UgaXQgbGltaXRzIHRoZSBvcHRpb25zIGF2YWlsYWJsZSB0byBhbiBhdHRhY2tlciB3aG8gaGFz
DQo+PiBtYW5hZ2VkIHRvIGhpamFjayBhIGZ1bmN0aW9uIHBvaW50ZXIuDQo+Pg0KPj4gSW50cm9k
dWNlIG5ldyAuaW5pdC57cm8sfWRhdGEuY2ZfY2xvYmJlciBzZWN0aW9ucy4gIEhhdmUgX2FwcGx5
X2FsdGVybmF0aXZlcygpDQo+PiB3YWxrIG92ZXIgdGhpcywgbG9va2luZyBmb3IgYW55IHBvaW50
ZXJzIGludG8gLnRleHQsIGFuZCBjbG9iYmVyIGFuIGVuZGJyNjQNCj4+IGluc3RydWN0aW9uIGlm
IGZvdW5kLiAgVGhpcyBpcyBzb21lIG1pbm9yIHN0cnVjdHVyZSAoYWIpdXNlIGJ1dCBpdCB3b3Jr
cw0KPj4gYWxhcm1pbmdseSB3ZWxsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcywNCg0KPiB3aXRoIHR3byByZW1hcmtzLCB3
aGljaCBpZGVhbGx5IHdvdWxkIGJlIGFkZHJlc3NlZCBieSByZXNwZWN0aXZlDQo+IHNtYWxsIGFk
anVzdG1lbnRzOg0KPg0KPj4gQEAgLTMzMCw2ICszMzMsNDEgQEAgc3RhdGljIHZvaWQgaW5pdF9v
cl9saXZlcGF0Y2ggX2FwcGx5X2FsdGVybmF0aXZlcyhzdHJ1Y3QgYWx0X2luc3RyICpzdGFydCwN
Cj4+ICAgICAgICAgIGFkZF9ub3BzKGJ1ZiArIGEtPnJlcGxfbGVuLCB0b3RhbF9sZW4gLSBhLT5y
ZXBsX2xlbik7DQo+PiAgICAgICAgICB0ZXh0X3Bva2Uob3JpZywgYnVmLCB0b3RhbF9sZW4pOw0K
Pj4gICAgICB9DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIENsb2JiZXIgZW5kYnI2NCBp
bnN0cnVjdGlvbnMgbm93IHRoYXQgYWx0Y2FsbCBoYXMgZmluaXNoZWQgb3B0aW1pc2luZw0KPj4g
KyAgICAgKiBhbGwgaW5kaXJlY3QgYnJhbmNoZXMgdG8gZGlyZWN0IG9uZXMuDQo+PiArICAgICAq
Lw0KPj4gKyAgICBpZiAoIGZvcmNlICYmIGNwdV9oYXNfeGVuX2lidCApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHZvaWQgKmNvbnN0ICp2YWw7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgY2xv
YmJlcmVkID0gMDsNCj4+ICsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBUaGlzIGlz
IHNvbWUgbWlub3Igc3RydWN0dXJlIChhYil1c2UuICBXZSB3YWxrIHRoZSBlbnRpcmUgY29udGVu
dHMNCj4+ICsgICAgICAgICAqIG9mIC5pbml0Lntybyx9ZGF0YS5jZl9jbG9iYmVyIGFzIGlmIGl0
IHdlcmUgYW4gYXJyYXkgb2YgcG9pbnRlcnMuDQo+PiArICAgICAgICAgKg0KPj4gKyAgICAgICAg
ICogSWYgdGhlIHBvaW50ZXIgcG9pbnRzIGludG8gLnRleHQsIGFuZCBhdCBhbiBlbmRicjY0IGlu
c3RydWN0aW9uLA0KPj4gKyAgICAgICAgICogbm9wIG91dCB0aGUgZW5kYnI2NC4gIFRoaXMgY2F1
c2VzIHRoZSBwb2ludGVyIHRvIG5vIGxvbmdlciBiZSBhDQo+PiArICAgICAgICAgKiBsZWdhbCBp
bmRpcmVjdCBicmFuY2ggdGFyZ2V0IHVuZGVyIENFVC1JQlQuICBUaGlzIGlzIGENCj4+ICsgICAg
ICAgICAqIGRlZmVuY2UtaW4tZGVwdGggbWVhc3VyZSwgdG8gcmVkdWNlIHRoZSBvcHRpb25zIGF2
YWlsYWJsZSB0byBhbg0KPj4gKyAgICAgICAgICogYWR2ZXJzYXJ5IHdobyBoYXMgbWFuYWdlZCB0
byBoaWphY2sgYSBmdW5jdGlvbiBwb2ludGVyLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAg
ICBmb3IgKCB2YWwgPSBfX2luaXRkYXRhX2NmX2Nsb2JiZXJfc3RhcnQ7DQo+PiArICAgICAgICAg
ICAgICB2YWwgPCBfX2luaXRkYXRhX2NmX2Nsb2JiZXJfZW5kOw0KPj4gKyAgICAgICAgICAgICAg
dmFsKysgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHZvaWQgKnB0ciA9ICp2YWw7
DQo+PiArDQo+PiArICAgICAgICAgICAgaWYgKCAhaXNfa2VybmVsX3RleHQocHRyKSB8fCAhaXNf
ZW5kYnI2NChwdHIpICkNCj4+ICsgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiAr
ICAgICAgICAgICAgYWRkX25vcHMocHRyLCA0KTsNCj4gVGhpcyBsaXRlcmFsIDQgd291bGQgYmUg
bmljZSB0byBoYXZlIGEgI2RlZmluZSBuZXh0IHRvIHdoZXJlIHRoZSBFTkRCUjY0DQo+IGVuY29k
aW5nIGhhcyBpdHMgY2VudHJhbCBwbGFjZS4NCg0KV2UgZG9uJ3QgaGF2ZSBhbiBlbmNvZGluZyBv
ZiBFTkRCUjY0IGluIGEgY2VudHJhbCBwbGFjZS4NCg0KVGhlIGJlc3QgeW91IGNhbiBwcm9iYWJs
eSBoYXZlIGlzDQoNCiNkZWZpbmUgRU5EQlI2NF9MRU4gNA0KDQppbiBlbmRici5oID8NCg0KPg0K
Pj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3hl
bi5sZHMuUw0KPj4gQEAgLTIyMSw2ICsyMjEsMTIgQEAgU0VDVElPTlMNCj4+ICAgICAgICAgKigu
aW5pdGNhbGwxLmluaXQpDQo+PiAgICAgICAgIF9faW5pdGNhbGxfZW5kID0gLjsNCj4+ICANCj4+
ICsgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOw0KPj4gKyAgICAgICBfX2luaXRkYXRh
X2NmX2Nsb2JiZXJfc3RhcnQgPSAuOw0KPj4gKyAgICAgICAqKC5pbml0LmRhdGEuY2ZfY2xvYmJl
cikNCj4+ICsgICAgICAgKiguaW5pdC5yb2RhdGEuY2ZfY2xvYmJlcikNCj4+ICsgICAgICAgX19p
bml0ZGF0YV9jZl9jbG9iYmVyX2VuZCA9IC47DQo+PiArDQo+PiAgICAgICAgICooLmluaXQuZGF0
YSkNCj4+ICAgICAgICAgKiguaW5pdC5kYXRhLnJlbCkNCj4+ICAgICAgICAgKiguaW5pdC5kYXRh
LnJlbC4qKQ0KPiBXaXRoIHIvbyBkYXRhIGFoZWFkIGFuZCByL3cgZGF0YSBmb2xsb3dpbmcsIG1h
eSBJIHN1Z2dlc3QgdG8gZmxpcCB0aGUNCj4gb3JkZXIgb2YgdGhlIHR3byBzZWN0aW9uIHNwZWNp
ZmllcnMgeW91IGFkZD8NCg0KSSBkb24ndCBmb2xsb3cuwqAgVGhpcyBpcyBhbGwgaW5pdGRhdGEg
d2hpY2ggaXMgbWVyZ2VkIHRvZ2V0aGVyIGludG8gYQ0Kc2luZ2xlIHNlY3Rpb24uDQoNClRoZSBv
bmx5IHJlYXNvbiBjb25zdCBkYXRhIGlzIHNwbGl0IG91dCBpbiB0aGUgZmlyc3QgcGxhY2UgaXMg
dG8gYXBwZWFzZQ0KdGhlIHRvb2xjaGFpbnMsIG5vdCBiZWNhdXNlIGl0IG1ha2VzIGEgZGlmZmVy
ZW5jZS4NCg0KfkFuZHJldw0K

