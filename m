Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1E310C2D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81730.151125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81VR-00057o-MR; Fri, 05 Feb 2021 13:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81730.151125; Fri, 05 Feb 2021 13:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81VR-00057Q-IQ; Fri, 05 Feb 2021 13:50:41 +0000
Received: by outflank-mailman (input) for mailman id 81730;
 Fri, 05 Feb 2021 13:50:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l81VP-000573-DR
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:50:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63611457-242b-4474-aace-9b61d91e55d8;
 Fri, 05 Feb 2021 13:50:38 +0000 (UTC)
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
X-Inumbo-ID: 63611457-242b-4474-aace-9b61d91e55d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612533038;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z2UDGZRnpcoDmRxQ7SFncx43i0q3V6ykywWkgxPmIMc=;
  b=OS50f3WfFq6xDEVsTtSsCIJWKz7VftLgzRzRqmhNDa85etV7QS5tA35r
   oEQ2skCZnyqEyj7VgVEF1LZjQ4VTLVNNwZgrQjSAtSDKwSGkZNVxMCFFc
   uhyUVggmOOMbuSOOs930fN0lEp8J4HRIRyqLFemEMBVkiNSEd9CMGAvEj
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Bo0BH94Zb51Hc7PNx3YhCiVHF/sQRlrD0lPX4ork/NYFPzd1GOIxPakuFElumDti33cZpsMDay
 a8bHUewKjyRTUj5rPv1n6LMucNKgR4u2ctPVrV+PGGZD5TUj58GVMJe3t7yK7e4XYiNnB4Qr7W
 SbSf5i1B5XhaKKijWazsVpke+bsoGW1SVJWeEQYtEdEm4VCkjF7lvAHo+2WavX2gzPtb0gDDXN
 CH6mx2bYrqEdAWqzIxTAJ5ACrBSIgX0Z/CLvbhUXfe1l4Lr1EpZl8Gw0M1UKSujlRrbU/+Eiy8
 JsY=
X-SBRS: 5.2
X-MesageID: 37017814
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="37017814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tbwd4ruA+nnitmJZrVlI3kvVtGenGNxwmtCN/GsJOb4ZiT1FF/Ak2L3MQCpeF13uLHwOXohgJAZzmQSe5hDzGxzecnxaCYqZeqxTZPXl2G/tvmR9XmcBEQVqtMo/AMQES6/oDO4XXvjMHxwwQ3Jt70C1naGae4Vg40OzR1pra+fw8itVAsNX8MDEgWEexD3b/JnQT3GcIQbpZUHJ6ZW13WIqUPaLlGU7CahoOgCF+RRy1+ZkXZq8OuppYlkUDNXIbFIp02pKaaqk0MA+8IvUOk172vi9Pkl1J67qeu8NbGYBrWMtqro0uAWBLMkATrg+bqEEQxA5LdgQ/a1kEts8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2UDGZRnpcoDmRxQ7SFncx43i0q3V6ykywWkgxPmIMc=;
 b=oZdLp+wbAbBKLbvPhf2LKavh1juv507DZa+cek0I93vn29ZJb8UoqN0MLbrRXVdAjMgekA2e6eJP7XIc5Sznd/UvcWmXOE2ZujqKi2RCHZZAXS7SIU/U9zGEWyYoiKU/wIWFrLrh7HUP/cD/zVQoqvUvKfUJ3MFbFyW9f4au0/dL2gm2DvBmQs7KA/xNDh4scDKSIRv9mb3hw/X99sKjsc+jVnlpf2U4AQo8BupxO59DOv/r5+q96kkAyr/uA4BCMvLPubKrENDKHTytjEIlIzCL72LIJQNfHu3vsg0ioeb0MN/An6GRiHH7s+AX3ArYKMU+CUuC8Vcr7raQT7J6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2UDGZRnpcoDmRxQ7SFncx43i0q3V6ykywWkgxPmIMc=;
 b=dxl7egaBW9Z8T7GzC9GnOX+kUbCsBujFwCa3cXZkXcjGi0VDJWZ26DaNVxIw/s1sLLS0zSIlgh185VMq9tOZc94v6VmsYlv3dZn0hvb4xPCKV1gdbMZP5jcXY4eB3RbUJ4Ax8wNh5u03d5AX+ypIZJd/1rhhqmY9Sadzm5ozj0k=
Subject: Re: [PATCH for-4.15] tools/configure: add bison as mandatory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <20210205115327.4086-1-roger.pau@citrix.com>
 <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
 <YB1Kqez4mjzog2YM@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1185550-8e73-5985-de70-a68a0b1e31ab@citrix.com>
Date: Fri, 5 Feb 2021 13:50:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YB1Kqez4mjzog2YM@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aaae21c-ffb5-4f40-3389-08d8c9dd023b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4037A36E12CEFC7EAE1F75BFBAB29@BYAPR03MB4037.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3E30vNEBi5FmONSJflVOsXdLOCAjLTAjbruyHebYb9IAaBkbACcvv+mITHPaI1JYXqPPebQ5MM7I771xnZzNcCZETo/lqIPNi0q9rGc7FmBLw8j0xfA0hzT4qDL2/4Xxc61ZDurQvrsqVd8UkR4MN1/adAGryn4LrvydL4L0Z4yZie9q0ibBIHRKeoRYOkJ5UDjaLMyppo2w64QgkVgdD8bCeOSDMhiJyLhgF27h+XRFjctnkWBAS995vw0xbU5K0lLmNFWHY+lPie7LJ+56QwXrDQTJ9Mao3yXUMrtuUSOUN1oOVRoD8+ZDC6JouL9J2xiMiZLZO56tkvsp8WqVxbAY7G1Nc3V2SfeW6bVDDBP87Ty7VnIqRU2IEriKa/ZAQVCUXGdO7WNVsfkc0WA/DpndIGHHIGg7JSAs4jlZKc684+1rQYS6ekKY/TbT32HRk83GXQfIUJRn/9/gpwDT3zFa1gujP6tFxoaQy509o6oml+deidOkgvr84wgoYdifV+6jM3cQMBGfhSbnTvj5pOZR4xZ1M5B33cj2Jjck4s6HKFpzp1squ24rcCOInYvEDBKOOt4tZ293bQ/P1QgGCmXRChOH5b+Al8w8RNm1tX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(316002)(26005)(8676002)(6486002)(6636002)(36756003)(37006003)(16576012)(53546011)(186003)(16526019)(956004)(2616005)(8936002)(31686004)(478600001)(2906002)(66476007)(4744005)(66946007)(86362001)(6666004)(83380400001)(6862004)(5660300002)(31696002)(54906003)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2pRVjdjbFQ4OFp2VjRVd0tnOGxwcVVDL1NxWC9xd1lXUEUwMDVxY1BOQVgv?=
 =?utf-8?B?WW9tQkdqZjdxaWZFMzMyQVNPQ3dUOGlZUEpWMzFvWE12dG5HUTJxNDBVcjFL?=
 =?utf-8?B?RFQ3c1dBUi96Y3BtRGRGZkQ5dTZEQ3lVVmpPdWFxbWpoMUJVR0VRWXlyeHd5?=
 =?utf-8?B?L1RwU2s4aWJpMzR0QktGaURHM2hZbjB0dGFadUJ6bmxoazRFVzBwMitacWlH?=
 =?utf-8?B?bWVYaUhCakY5bExMQ3p6Ylk4NDNPVEw4WFpDY2ZYeXNibFhyTFkxUm9SbjRF?=
 =?utf-8?B?d1N2K2pidTJJc082Zlh3Q2l3TDh6aGYxZ0RPVTlYczY0bXM5QjdVejZPN2l4?=
 =?utf-8?B?VS83cmhGYnJMSmpnYXhIbVdrRFgyVy9wYW9iYXZyYnlaMmc1WTU4d1g2eWFS?=
 =?utf-8?B?Yk5IcVpPZE5xREozcHQ2UUY2Wk9HNGVCWUw5UmVSdWhDNlNmR2Q2dVhKZnc4?=
 =?utf-8?B?bW5wZ2s2cE1ZRE5UalF2UFBsOC9XVmpSNUdYMW9SdHJWVzIzcFZudkpsS0ph?=
 =?utf-8?B?SnZwdnl0c01vdmVDWEZUcStnajdXQ0xTYm94U2FCZWRmd0I0WHYzcTlCem1L?=
 =?utf-8?B?UEVxUWtCTHRaaE1TenhlaVZMUlYzSVQ0L1NIUDhsMkpoNVRMRXVtUjJvL2Q2?=
 =?utf-8?B?M2UrT0dIcTMwcDBUZ3hiUmlMRklibWE3WlZoZlVzQ00ybHpmM2lmTnlVQXRN?=
 =?utf-8?B?UHNSTWlKRUYvc0dMejlKb1FoMkR3V01DSHB3UGZ4QUloRUtCekVnR3hTM0R1?=
 =?utf-8?B?dTdkOGhKWHgxVG5jSDlrTlB4dk5XQ0wybVJnL2lQUU5ZcFJhY2pJbGtGSGM1?=
 =?utf-8?B?ZkdXVE9TSityUjhTZkVOZ2Q4MDZkV0p0QndMaGI5eWg4ZGxpVU1DUnZXbVdR?=
 =?utf-8?B?NVYzUVhQYTV1enpneVFkYmxLSkwyMFFtV3B0M293OWJzbTZBdUdhUEZnSHlr?=
 =?utf-8?B?OHRZSzRuNDFpWks3QW1LekdVOGUxSFhHWm1yQ0d0VGpqVlE4UEFRL1JqNzF5?=
 =?utf-8?B?aGxPeU1iZHhKNVd6WTdhR0xwSjdKR2VocThhald5RkhPS0xtOXBPUHo1U2dX?=
 =?utf-8?B?bzJhVis5Z0hXSkQyUS9GT0tmMUNrTW0xUkhJYVZmVXlNejNCUDBuNXdGSFE2?=
 =?utf-8?B?dng1RVpYNkhPMFI4ZGdxdTNMVjk0eUR0dkZ2NWNldlN0MTNoNVV4S2RLNExE?=
 =?utf-8?B?RktVN28vQjBySEx2b0pzOTROK2pkU3BNTjBsTk12djVjbUVKeWNZeUJxRC91?=
 =?utf-8?B?RTNFcU1IMEtkbmo0VzR5cFJKbWcrd05hZm1XTnhuU2lmemtvYkhsTHRQTElj?=
 =?utf-8?B?L3RYSXJTV2pwTHN6Z3J3M0lzL0xhcW5xanUyRkZQZ1ovMXk0RXpLa0h1YjA0?=
 =?utf-8?B?SkZrRm1ocks3NC9RYzZEZ0oybkRia1JEYkpTU2xLSVAyc0cwLzlkMG9JNkg0?=
 =?utf-8?B?ems2MFAzd3dYZFRnMDgvODRQVUw5Z1hYRHBsb2FzT1lmaEZNa0NGWGxndWVX?=
 =?utf-8?B?YkFhU1VuRnhseHlVWXFLN3FQUytHRUFrbFA3SE1FTzgxazB5RXR4MEtZUXl3?=
 =?utf-8?B?VmgyOFdYUURKOVVnUlNGOHNUQktIbXRPMmxHZFNISTJ4ZXo2cEx0bmZuNEJE?=
 =?utf-8?B?WjJlOHdHbG5RRTFIbWNJMkI2N1k4OTh6QVJHVm4vOUJiRFIwMURtaSswakwz?=
 =?utf-8?B?NXNPQnRKemdvQ1BES0Y2NC9xdFNLakxhdWpLRjBvZ0tQTCt1YzFHTlV3VjJ1?=
 =?utf-8?Q?mpzWndNVvcquPD9imTAXOTH8Lt4n/euHJ9bKQJH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aaae21c-ffb5-4f40-3389-08d8c9dd023b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:50:33.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSQjWVrS/h1i88YoKf76dA+aI1O6SoAjswTprKmVenvQBfC+amLskbYk07+IkpLR1eW6TVMxeo9rw+mZuA28RiZpBUO/uetMAQFcf7ejEhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4037
X-OriginatorOrg: citrix.com

On 05/02/2021 13:39, Roger Pau Monné wrote:
> On Fri, Feb 05, 2021 at 01:34:20PM +0000, Andrew Cooper wrote:
>> On 05/02/2021 11:53, Roger Pau Monne wrote:
>>> Bison is now mandatory when the pvshim build is enabled in order to
>>> generate the Kconfig.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Please re-run autogen.sh after applying.
>>>
>>> Fallout from this patch can lead to broken configure script being
>>> generated or bison not detected correctly, but those will be cached
>>> quite quickly by the automated testing.
>> I think this can be simpler.  Both flex and bison are mandatory libxlutil.
> No, we ship the output .c and .h files so that the user only needs to
> have bison/flex if it wants to modify the .l or .y files AFAICT?

I know that theory, but it is broken in practice because of `git
checkout` timestamps.

Also, the Makefile explicitly enforces the checks, so they are mandatory
in despite an attempt to ship the preprocessed form.

~Andrew

