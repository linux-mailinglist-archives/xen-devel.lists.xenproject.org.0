Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F239F66C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 14:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138446.256273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqakS-0005wR-Es; Tue, 08 Jun 2021 12:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138446.256273; Tue, 08 Jun 2021 12:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqakS-0005uN-BZ; Tue, 08 Jun 2021 12:22:24 +0000
Received: by outflank-mailman (input) for mailman id 138446;
 Tue, 08 Jun 2021 12:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOFJ=LC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqakQ-0005uH-Lu
 for xen-devel@lists.xen.org; Tue, 08 Jun 2021 12:22:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f69a0a0-6008-499d-b79c-e5d282e29cec;
 Tue, 08 Jun 2021 12:22:20 +0000 (UTC)
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
X-Inumbo-ID: 7f69a0a0-6008-499d-b79c-e5d282e29cec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623154940;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Cw23AFEkckS3Dtu5zAnydFSgs2beAzNaetWSreUjhHo=;
  b=JOg6dRkeAyh9v66U1pULUZxqCqb8c71u8RjQC/zmBQORX6ctiDg16mPg
   4WpcDEEeNXv31TJ2ae78TleSrXBj4F/lpW7ztyQ+63kUOgQyarzON/xwx
   IF+s7wmtn4VT6CP7PBkQqKACivOSz3K7V3qMx3wvI+0usBGCEYUHLQn+R
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CjNl8NMlsqcPmz2kqZZM8vJ6e8PVNxGsbHrBc/KiS1gI/J6LM3xHOI7WNCfYbqgFfl3cEqEoT0
 mPW1nKn2n12nrqdHqfPO/L6xGImNiOCMRxuxt9PwIRJ10KJbucbgPZUQYZXzHVOF44dXTQduiF
 RYLAhyP5dIqaLc2gPkCE5QILAF5HiPDyLpUde0IrYsaEbfAweAN0lik3jUZC50sw6rFaBQNL34
 vRfXCTLHLSrCBJasi5y+jBB02A4TyyiS3KzukdK/U73vP8vjSWOHg7WIsmi0Z49Pqu5bDskQ1f
 b1U=
X-SBRS: 5.1
X-MesageID: 45374247
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bsRaO6proWiwDfZWrXexYpkaV5oWeYIsimQD101hICF9WcaT/v
 re+8jzsiWZtN9xYh4dcLW7U5VoLkmzyXcY2+gs1NWZLWrbURqTTL2KhLGKq1eMJ8SUzJ8+6U
 4PSdkbNPTASXR8kMbm8E2ZPr8bsb+6GXmT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.83,258,1616472000"; 
   d="scan'208";a="45374247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+xr5i8XdRf3kldDKJuEDmFlgiP/lgVQzPWar/PbfW+aLxgd7S+F5eCu/Pri5pe9OUgFZJbDhEPn1TAadVxnHkvllQh8acyiLWRCy2H8NM1FmIQ/EPu8SqytQoLqB/6aX0x6/PJtXdQ6TW9GEeTpwruYgvJ0w4Kdefex0xkZJ/52vUGrn+Gsto+YSD0Hrnhf7z6G4d7WftKZy/Ua6HkqVMPWv1Rk20/IBKLfLPPlGCbjUOLsQinXX0jCk2CZzHSRwkE9evpsNA6fVSSQbslADxotVqifAmM/F4AvFo6G2EAIWUzZwcJPEVogX0psAFYOXUhwC+oxP5i5KeD8L/Iziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw23AFEkckS3Dtu5zAnydFSgs2beAzNaetWSreUjhHo=;
 b=lodYkjf/rHDILepvtSXrnKVXZBHMOxT2K08k73P1JH5c/O4nwgOZjieir4xb9wDTdyIglhaInNydLe580XNTxWWFz/ogO7HC9UewkoH6KNiLe9w46iUSf2Y5ygfMeV54i3+QDJtwegzUpcHG5GoU2R6hBF6b5o1o+BuvmUxOE/2jmdpXRXR9ayUBIeOc9jvHPu+g9xMl1ZUSFp+B/g1RLXU+6x4o+Jpq71iQeB7w+jIHulms0ZZo38OUmQi8OllcjVGrNdAmB0zRkLvAj7HcInHf6tFCM6x1XPL6JUY7jX1kJV8VjnuvVp+IGCpJKCisKNnCQ6a1JJ5IBTSgwC4q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw23AFEkckS3Dtu5zAnydFSgs2beAzNaetWSreUjhHo=;
 b=DuWJWfGZqJp15rPogLnN80g19zUAP8O2Pc+2IIW118qKDF+Ve+qAiSPzCdEauE5m1BBfWAgMeiqDU+NiMc9Oydsk6Muh7feyxv0GasKiSVhCLahNIj9wkII33OZW9bgEKdt9jgTHnHT80ZWJHhBsKF8MlPwxN/4snOs4PR951eI=
Subject: =?UTF-8?Q?Re=3a_xen-unstable_build-failure=3a_xg=5fcpuid=5fx86=2ec?=
 =?UTF-8?B?Ojk5OjQyOiBlcnJvcjog4oCYSU5JVF9TUEVDSUFMX0ZFQVRVUkVT4oCZIHVuZGVj?=
 =?UTF-8?Q?lared_=28first_use_in_this_function=29=3b_did_you_mean_=e2=80=98I?=
 =?UTF-8?B?TklUX1BWX01BWF9GRUFUVVJFU+KAmT8=?=
To: Sander Eikelenboom <linux@eikelenboom.it>, Xen-devel
	<xen-devel@lists.xen.org>
References: <39b24aaf-a785-6dae-23fa-c9a787760565@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e296e60a-6199-ab80-5730-6c7e0cc96620@citrix.com>
Date: Tue, 8 Jun 2021 13:22:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <39b24aaf-a785-6dae-23fa-c9a787760565@eikelenboom.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcfbf13e-939f-4272-c8d3-08d92a780e3e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4166A6B90B4F88A99CE5FDC5BA379@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvOyMXLNZQWHMssqDX6vAQPb8LHZO2hkhv9k8BMmh11L+6zzGphx8iUibsRWwIGWRQ7vrfTgKWVUVy0iJPnwSdiUZ/mPw9zlYuY/tP9pgehN/F5JepSa6qiQrBHOTpcxRvX1ifXVN5IHU9xSQg3zY+G6Vq7kiUXhoLf6WQ8OSEzE04++YDT5svly1a5eHhGe6a/kT4CxQWzSJe/cFFgRGG7R+GIfTDkaRSw0fqpyBNOhdAukkOoIg5ixZsOzNLY2UqUM0UTlN/9w5A0DGp6hvZCzd6FU5qwKTgXaFpk6hy3ap3BEgBwHpyAbRVCwly2hN4gFG0PXUY1Aiiw3U57IbLprm+WYsVZKra+mRpEVq4dOTZQ158G0RCC/kRi/9dJPms7NE03coz9yg86myuoITsqzINo71xoCQzrX6sh7XLRHIpk0ulx8xkJTX+NvAPlkuygZkEUDxRG/aiszgGSPVWEl+R37XYVQBi2UK8DVbvY6imc9oPHBheWqFuLacwvhPC9z+BNLhiYiGQpy9l/cnp2pfl4y0Syq/9CmXW273X8YbzFbkjL+TNAUbJVgjqDbc+0EEUletrEN46uTWvlp5AjQ9N7br0UAAmCdqts9QpRgCmZayMoKRnnJmL5waBLdT8mh5vtnYKxq6cGq651IBJwOZzT6R9jtIoPyCiaa+DRB3kt0HHNU/zd0iKwHzx0U2zuVPkkT7FhWtxByNjMXqY1c3k5vU8HqWqtPAj2c+jGz/k8qAMMZQu+yOSsfqQ1iD/Xkl7xhhZGSI6Capq1a1GDbprROWMA/XAOGagf3lIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(2906002)(53546011)(86362001)(110136005)(5660300002)(66476007)(6486002)(38100700002)(83380400001)(4744005)(31686004)(16526019)(966005)(66946007)(6666004)(8936002)(31696002)(316002)(16576012)(26005)(36756003)(478600001)(956004)(186003)(66556008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmwyV25xYkQ2eGtHSGxNTmlDcitpYlRlUkpRc1dha2ZtY1dTWjJvT05jbU5Z?=
 =?utf-8?B?VFRXOWc0bWFGTG1VM00xZ1QzWEJ6QmhpY0FwcmpEMDUvSElRODRHQTlEekRU?=
 =?utf-8?B?U28zMGVUZ3FyckZDOUM4eHFqc29nbWpBUU8zWHQyNHEzR0ZFTEhOdU9DTFJj?=
 =?utf-8?B?eGtYTGcxdlhrM3A1WkV2cW4xdEd3RHFDOUJoMU1XMVlCV0RhTit5SGFlRFpu?=
 =?utf-8?B?bE9tZFByK2NQazk3MDBYTUhxbHQxcDlYTkRDK0xFcDZFR2xQVVJMRW5FYWlR?=
 =?utf-8?B?SFl3SG9HZXhycG1GcW45Q1FtakRoZWxWYVNxOENZZWI0UGhaS3NZYzliaWpQ?=
 =?utf-8?B?eW5NZXhVODRLMVN1Rm5nTVp4bXdLRzhaMTBCQUR0Y1VlRWQ0bjV6UXQ5VmxV?=
 =?utf-8?B?MkcwY1RwNDNsMDZzQXlGZUFPSnBYY2RucDB6NmpaN1phUWhGaDc3bG1QOG9H?=
 =?utf-8?B?a3hPQWNMVExNaVFRSEpmTGlRUzlSYXo2VTU4TytXa2t3eW93SUlCUytiUTQ1?=
 =?utf-8?B?UUlVK2RYK3RoeFJKT2R4eHJWSXRyYlZkajFaVHMrRlNYT1JRYnBlZU44V0dO?=
 =?utf-8?B?TUh3YjhxdWhEWXFWMEdYcGxHaUZmazNIdGtyVytYZWlIVHgvRWFYbGg3c1hY?=
 =?utf-8?B?bStTVVdSUnNGaFdsRjQ0MnlWR1pJSDZmUVMxNWh2YTFoTE9XQkh4amdjVlBX?=
 =?utf-8?B?R3gxNnIvdDhSdHpNcVJjbS9SODJiNjRBbHdUazNSNGlzT2h2aWMrNGZpR1dC?=
 =?utf-8?B?N1JwdXhMMGkxOE03dHdmdzY4aXBnYTFFT0NWT2NwZGFrdEU4ZjA5NHlLR1o4?=
 =?utf-8?B?bG9JUWplSGJMK09zdTA1YXVHdFl0eGZQQzYyTFVDeE1wVXlkbjIzTTg3SElh?=
 =?utf-8?B?NTB4VmIrak9MbXFoOFMvVDBiaDJha01IKzkvYnFnYTV0bTZsSEl3aklMeGRp?=
 =?utf-8?B?QTVKdnJIVVhCZS9GUStZQ0hXbFBoTHNwQ1lwcS81UmdHWTVsS0V0WkVIN01p?=
 =?utf-8?B?VHhPL0ZjY1R5cm1HK0F2TWRWWUVJSXBGbXpnUy9pWlhSbXBRalVaM3YwQWRH?=
 =?utf-8?B?L2E1TUxvSkJHWXEzVU5BNEpUL2gwc2pBWEsrN1VkemptdS9kYzFOMk1JTDB5?=
 =?utf-8?B?b1kycWVXdVdOUTlhOS94UU5XVmdvL21XTW15b3Vla2VENnVPbzBsMmR6QTRN?=
 =?utf-8?B?ODFKaEtCNk1hbHJZS3ZqNkxKM2d6WEtlclFFR1ZmZU9aRTJBV3Q3Nk95aW54?=
 =?utf-8?B?ajdWenNEdzNFQ3AzMmtwSlVYS1YwWHhKTGVDWXpNdXVHaUtldk1hWHpUOE1N?=
 =?utf-8?B?SGxKRDV1dlFjeWI1c1hkZjlIWEVaVGF4WlhPV0c4eGpsQTdybXJ6T09nakFt?=
 =?utf-8?B?eVVPL0UwdHhnNjB0Snh1cFBlRHR4aTN5ZmRTbHQ2RmMxY0t3eE5td3NLLzhZ?=
 =?utf-8?B?elVnTnhFVDc4eUpubFpaNDZUL0doc0ZJUkJHVE1oaGtKVTAxUGFaVWk3clg3?=
 =?utf-8?B?Q1VWSEJLQXp4RmJwQjdFL3VVZmJrcEhWb25zSFVFYmVPUTN5bGxjOTd2NG50?=
 =?utf-8?B?S2QvMURXUVdidC9KVFNEbDNXSnFhc2Uya0hoSU5Ib2xVc2YvR2Z2UG5aanpK?=
 =?utf-8?B?Ly9rKzNLcXlHVE51NDVXTHg0WVpQUmxkOW81dCsvdXEzeHNVUTBOckxjUjl1?=
 =?utf-8?B?cXM4a2pTUE5tTzZOamt2MWtLL1NXQUh6bFE5a3Z4enBmTzI3Lzh6aHY5WVJL?=
 =?utf-8?Q?ylnPeJOAA1YTeY7TpjO4vb39/G+TkYF1Xj9/BNF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfbf13e-939f-4272-c8d3-08d92a780e3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 12:22:17.4103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i8v2NqqpZERH+P1L6WB/2YdkDe6tZJjANGzi0kWLJ9F4MYm/Q1vIq1AsGr+6R2EWh18yvYmtRn0XZEfwWcFXLE+k0oPnGQ7DJ0ExTFT8Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 08/06/2021 12:28, Sander Eikelenboom wrote:
> L.S.,
>
> I seem to be running into a build error with current xen-unstable.

Yeah - that's my fault. 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=69e1472d21cf7e5cf0795ef38b99d00de78a910e
went a little too far, and shouldn't have dropped the changes in
gen-cpuid.py

It went unnoticed because the code below is obfuscated from grep, and
because the gitlab CI is currently blocked on earlier build failures
from the PV32 changes.

I'll do a patch when I've got a moment.

~Andrew

