Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35B33E061
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 22:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98474.186821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMH73-0006Tn-Nu; Tue, 16 Mar 2021 21:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98474.186821; Tue, 16 Mar 2021 21:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMH73-0006TO-Kg; Tue, 16 Mar 2021 21:20:25 +0000
Received: by outflank-mailman (input) for mailman id 98474;
 Tue, 16 Mar 2021 21:20:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMH71-0006TI-CH
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 21:20:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dced77c6-f5ee-493f-9b23-842f8396504d;
 Tue, 16 Mar 2021 21:20:22 +0000 (UTC)
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
X-Inumbo-ID: dced77c6-f5ee-493f-9b23-842f8396504d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615929622;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Z41Bv9Zh3MJsjEEqeG2uocWQjWkZgiFe1RiAmGy1+A=;
  b=Uf+4NK2UEbsbb20xuO5kAoOOITSchVF8sIqmtzD7aDP/ufofucGClgMP
   BjnRrNceRziHfqd1TVZ/hZHHS6zGlTAtU/OX8gIhR3Nx/5GEpLOvKAH9r
   oJGbfZtQ5tdUGB715gnctNY5rN9AYG1xEhVpy34Pf+QmD8h1BK67S6HGM
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3p3J0/6orKRbLkSiW6GRz6OMmoDeUvoRKQ8VHXLNe7yCvw1poc08Ktod2Xw0oZOBeIg99+ksqI
 3LTC7dDOBKhXe1IXDnzbCyNXIIXZXvm1Xxc9mQQpSmyDLrC8q/XoDaY/ae0L6I260P/FbwqCZW
 t21Vg0dBYkPHLK9SRHDOXwnlZnXQ4vs5u7UDdK4vIODV0/y13XYQi3bijGIRqAa+1cSn3pMS1o
 rM1cJ00L60D57NPl0/RtsYs3ukwbUc+tPFQ1ubsd4GIxVmJKyXMG68LXEpMpFSawkQTtjKnb1F
 Ge0=
X-SBRS: 5.2
X-MesageID: 39434071
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rq0sY68pOgWVTDmei/Juk+F1cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfA7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q+6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXFEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0DfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpL1S6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+eXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn7doXH5mQ/k1Vf5jl7llninqieiV2rY31uAEn+mZVZXT5aL36Sq9
 /KmNLojEjA3A==
X-IronPort-AV: E=Sophos;i="5.81,254,1610427600"; 
   d="scan'208";a="39434071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc6UY3baIfPZI4IklCy0gq4Hw0dIQFQ31m9bn4W1ZXvR2r9TCuTpWGAz5mqBX3Xca0hbgzCTZUuUnS5oHv4Z48LGdrWWZa4lH0hu/80T22g3u9JjnFUDA9LJysW/EAkYESTqAxmXc2EaYAWFfz9/D0+XyKApj91WF/TAEjnAfp4olRF6Ay6eWwsZPupjsLuzMr8beYlB5rsFDbCj0MFpS86JgNqDfStccarbP64Q6896RqAl1OAyPl/LCQm/Nd7iEgNxYzRv0qHXjQuLmK9xQ3ua1fx7zid56ywgW3om8ecUb5W8D5Z8kCcly9UlQHqjvaO6/b+SeYTfnsWhjX+u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEzroIj0gAs/8HZEqRSFg63+ZpN1LwgWVvxr7JUIQAw=;
 b=Naq3TFOBNXBgNm82+jnIX22DFDAHwV9NWPt2z3n3UbbwYoKVPNiBGQM660FthymynMAeyUBwjRycT3XLax6uRJq/PYFyhFxBfYratvAT91PLsYevqMnn7jsYU16yAxcUy74NoSCx8lpb7+4+sTCmIu1THkrBloLoM+dnWCiURXcdzMo6Bnb41sMkCsn+CqKp7KA0cmRzMrTCprsPFrzce2nms5hvSN00iVbKVs5jWSp0XqZdHpzJJKhq5SMJ6Q6OD1GVNCR0zGXv2E4OcSByzx4BQtJmCHGvll/UBtZL/rDgxYrlW14J2xoox4tu1W1W8bgfhQIAJ+NG3NS8vDPN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEzroIj0gAs/8HZEqRSFg63+ZpN1LwgWVvxr7JUIQAw=;
 b=hkTuDrc7AKgk0JGtbe8sHZdPHnfG0EIaMuDHK0+PnCyESQtG3D7wD1PM9KWtRKhh2kjfmgd3mxM/LA1VFxcQ93xe9Z32ETw+IPrEpIwdTSIiBPnfgW2e783fM7YWcd+XP87OyNJrI30iAce8JL3LC7cxZiSwGOOHh/Nan7sn7+M=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-4-andrew.cooper3@citrix.com>
 <YFDjUSz/whe9Jrqp@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
Message-ID: <e7ee5d1d-d793-1ab6-deb0-e2eb13b89a47@citrix.com>
Date: Tue, 16 Mar 2021 21:20:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YFDjUSz/whe9Jrqp@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0402.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::11) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2048d646-1a14-4c83-8b03-08d8e8c14ad8
X-MS-TrafficTypeDiagnostic: BN3PR03MB2372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB237225F2DB3164AEA5FEACB8BA6B9@BN3PR03MB2372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FT+lndZ2f/NvlhjazkZGC3zo0KAcT6oB/9c+88JI4iFRc/NKM3V8VDBBbFU5R8Dyj5z5ng5yHKh5dPC6RXwwjtctkbeOKzd++XWG8U/MAiyUe7OyY7EMTa69hrPlPjI48+VGDGHiBgOEiac5lWIqrpXqrXcWTONCz+oPIgYdOS3WxJnmFFalAW9l19C1shLB5mZ/O0hPpRFkPUEuoYBQuUiGJ8uZawXyz7RBThlZ6tdDJLw9nBPx731AEXpg8uMWWIlDqZCsONaTz+t3T+3f1utjlDoiRLdNRqKD0o8JPkqVbG3rGKYe4udMYe3yIVFWGk3DZ/cbHgMLWumKwwylCNdO9cH6CulT6Y/3cKmUeOzbcvLZRTISuqxwej5PeRSuHG/gy1sHASN1gST1pHduowyOcQx5j7LxQf4lnqfZw+mSE0PEIzRAN8FlwAIe0i4vjMvS9rsT+B4UAFF3ivIo35HdGnXJHro+PiR4pUSQqJg5rqS2wEchl4AJ1shGSqtsXHZGhLSCVwKraX3/G0ZMIhzqWgTsD9v2QviB2VJill0+7VpqM9Ov+Yx0p515jGEQMFODhktwaPAVsff5/O5Bx9mzO1cqsNorc2xV/o6bIs8vrV4O+/KWfoEJIMfY08omQdm3yNMPNLtakdflAIO87g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(5660300002)(956004)(2616005)(6862004)(66946007)(66476007)(66556008)(6636002)(8676002)(53546011)(6486002)(83380400001)(54906003)(16576012)(6666004)(16526019)(26005)(2906002)(37006003)(36756003)(86362001)(186003)(498600001)(31686004)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0xJZldXK0Y1dUpnS2xIeHpOd1YyYkhUVHZKSjZDN2diR2NoZ3cxWmpCbUtx?=
 =?utf-8?B?N2hRZ1BCOXJFWU1GU083OElrVjIyYmNDUENUV3ZSbXB5aXlLY0lMS3g2OEhy?=
 =?utf-8?B?bG5tMVJ1d3FvTjM3anVLWUxFRVpNeWFLWllTMk5hOGxQT1JxVDd4T21ZV3Vr?=
 =?utf-8?B?Ny9yOWlMVGlCOWZ3S3YyRUlvQzZiM05PQmZVSzBvMGdMdFVRd2ZNeEpieXVq?=
 =?utf-8?B?cWE2cWZtTWRJN1MwRXVQd1BzS0h0dlpoeTZUMTF0Z0hDanlSRWRvZ2NzdkZl?=
 =?utf-8?B?VFFNZEF1bVNXc0ZYeklXYXp2QzRLL0ZuelV3dklSQXhxckZUZmQ4ZzZ6L255?=
 =?utf-8?B?c2EyamV6ZUp1OHlVeEhiUlZzazk2OEtDQzU3aTd2clF2Z0FveEdsajJORUYx?=
 =?utf-8?B?eDFGVysxdUJTNXVVT2t6bnlMWHMrUlVnNFpqNUlCdG5ObG1BTEJ4a21VNldu?=
 =?utf-8?B?U2xzN0lORkRqUGdmMG5oQW04d3p3RnlvaVd6OGNyZk1USTNtdkVUYm5PRjFO?=
 =?utf-8?B?UUtrTitrRnFBNStxSVFFOXZPMW0veWtHSUhKODROdWtpRDN1cXJYSEg5U2Ez?=
 =?utf-8?B?Zm8yK2w0V2UvL3N6aHNUQmhpTys5SzlHdGFvRGJ3S01wV3U5VmxIWEpjeEhw?=
 =?utf-8?B?a2xhWEtWZG5RSTZ1NTlLQXY2TURWMzh2RjQ2cG5qeHoxY3VRTXNYSWhLdmZx?=
 =?utf-8?B?RGVqd0pIY0krK2dKT0hmbkFtWEp0UXFQMzNHWHpqUU4rc2h3cXhnTEMrS0lF?=
 =?utf-8?B?V3JGOGxOaWg3TzBpTmFVcWdLMy9lY1VlNk5vT2czNGpPaDBHV004OGtjRVA2?=
 =?utf-8?B?TE5GRmJsSFpoQ1BBQ2tuSFF6Qldnc25DdGpjUTY1UG9aMVhITWJkaCtiT2lF?=
 =?utf-8?B?OUczcG8wYXRNNzMzK3ZGNXJxWGtLOGx4MjQ3bk1rVU0ra3RUaVBlNW1ORis1?=
 =?utf-8?B?TjNBSy9XMTlpbGk3TW45QWp0NGd4bUxMZXFNZk1pcEdXcC81YldtUXdTckph?=
 =?utf-8?B?alVBQVhSWGN6Z3IxZGlUNnFaN0FYNGt6UEU4QUdYZVBvQm80S254QmJXNmVG?=
 =?utf-8?B?SzJsWWhPeVR3SjZMNG5ZYXM3NDkxRmxYcUpoeEVtdE51RVNUMEpjekZDcXZ2?=
 =?utf-8?B?YVZVQytlVm1jbENCKy83QlBPTHFPZkdRaDZES1BRTEcxM294dmRWMzFCS1Ro?=
 =?utf-8?B?d2pNcW1DSHlYQ3oxUEdyd3NPcmxBNTljYTNaK3dGZWFzemtKeCsyZ1Y1MFdC?=
 =?utf-8?B?YzdmcFY4NlI2Q3hwWDA4WUdNLzY2QU1XUTFScDQ4VmRWSG44emVHVjBLczRL?=
 =?utf-8?B?bmpkS3pDRUN6aWZrWDhzVDdWYyt6OU9GZHRXWFRFWVVDK0VGd0xPcWdQNTVv?=
 =?utf-8?B?SStzN2p5V1lxVnNpYnFFZVdVVU1vQ1U0WXJuN0ZrdjZYNUpFMkxyT0FTN0Zk?=
 =?utf-8?B?T2YwdnJjVDh5TVJzU3JsZU91dFExaEZnWFdLMzdIUkFPVEtmZVF0Zm9iamFO?=
 =?utf-8?B?OUJMbzVNMk9kbzNqMXVORFBUcTRENHJYWkxSdHovOVFWbGlSejFXNldHcXZh?=
 =?utf-8?B?MnhvVnVNdnVkMThWUi84NlFhRHFZaFByZmxYemUwenpsR3BLL1FCcDhUcWFm?=
 =?utf-8?B?NmhabzRwV1JHSC82SjdkNW9sUDVkRTY5ZHFmcXlsS2tRTXM1YU4vRGhBVHgr?=
 =?utf-8?B?OXBCQXBSd3B6L3IyNkZqVmpuWkJiaWZJOHVHMnNGaG5QeXRobkJQdzQ0ZzdN?=
 =?utf-8?Q?eZK0zZaFilP+gtD6p8GCSKJhAF49Qx7nO/aVwpD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2048d646-1a14-4c83-8b03-08d8e8c14ad8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 21:20:15.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhG31z7XPnHs16IMfrNGVCxpJuHQ/kwUN5mqXi4aDJebMxN0fpVfKqaEGI9X8klhzZAJr4Idd48vlBpmd76mIQYsNTjn2kT1ZM4kIo4wOvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2372
X-OriginatorOrg: citrix.com

On 16/03/2021 16:56, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 16, 2021 at 04:18:44PM +0000, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks!
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> CC: Ian Jackson <iwj@xenproject.org>
>>
>> For 4.15 This wants backporting to all security trees, as it is a fix to=
 a
>> regression introduced in XSA-351.
>>
>> Also it means that users don't need msr_relaxed=3D1 to unbreak Solaris g=
uests,
>> which is a strict useability improvement.
>> ---
>>  xen/arch/x86/msr.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index 5927b6811b..a83a1d7fba 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -188,7 +188,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64=
_t *val)
>>      case MSR_TSX_CTRL:
>>      case MSR_MCU_OPT_CTRL:
>>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>> -    case MSR_RAPL_POWER_UNIT:
>>      case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
>>      case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
>>      case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
>> @@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint6=
4_t *val)
>>              goto gp_fault;
>>          break;
>> =20
>> +    case MSR_RAPL_POWER_UNIT:
>> +        /*
>> +         * This MSR is non-architectural.  However, some versions of So=
laris
>> +         * blindly reads it without a #GP guard, and some versions of
>> +         * turbostat crash after expecting a read of /proc/cpu/0/msr no=
t to
>> +         * fail.  Read as zero on Intel hardware.
>> +         */
>> +        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
>> +            goto gp_fault;
> AFAICT from Linux usage this is Intel specific (not present in any of
> the clones).

Indeed.

>
>> +        *val =3D 0;
>> +        break;
> Do we also need to care about MSR_AMD_RAPL_POWER_UNIT (0xc0010299) for
> Solaris?

AMD has a CPUID bit for this interface, 0x80000007.EDX[14].

~Andrew


