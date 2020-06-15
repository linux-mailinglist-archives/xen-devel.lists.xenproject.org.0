Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469D1F9983
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpgW-0006Ru-83; Mon, 15 Jun 2020 14:02:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im8M=74=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jkpgU-0006Rp-GZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:01:58 +0000
X-Inumbo-ID: c626c48e-af10-11ea-bb8b-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c626c48e-af10-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43737ITja0zBaHL08O+LOoRG3LylD7T40HDB3k4aQr8=;
 b=3Y2FMRzRrphIgxQPeYodKdutM6Kk6LbhLoiMhEnKc/1vhWdbjN/qhCw/Iqxyf5RtkJXkFv8+fydgKgYSFnjs3TGI0bkPmqhBOt5FMhAIseAlFljzZB77aDiYl09YkbmAmddObAjbKM9o782z7KmAITq2hUVrPntK1enKFMvRjhc=
Received: from AM7PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:20b:110::27)
 by VI1PR08MB5406.eurprd08.prod.outlook.com (2603:10a6:803:133::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 14:01:54 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::fa) by AM7PR04CA0017.outlook.office365.com
 (2603:10a6:20b:110::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Mon, 15 Jun 2020 14:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 14:01:53 +0000
Received: ("Tessian outbound 56dbe829191e:v59");
 Mon, 15 Jun 2020 14:01:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afedc56cebf702d7
X-CR-MTA-TID: 64aa7808
Received: from 804de3e8dd63.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBBB3BC1-CCAB-4834-8F3B-57C7F8D95D87.1; 
 Mon, 15 Jun 2020 14:01:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 804de3e8dd63.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Jun 2020 14:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIbT42Zj9AupHFtwWSprZhDVlnb9ddkj9H+tyvhF9vkRA7OPPqdw4j5nzGRi1gnPAFVaD1iJJbKGAiX1G27O9gU90oRTYGJfbqHAU/O26EIBWfhDY7pyjj77Poabuf+wXlQ2Ye5JoQQ/X+LfxZfvT1bzzfhNk96WbudPC82LB5/1w++JNKH5LB/ZoqY2/u4MFK0D6+XBXRfJ1a6sa26b4TpzN3sls1AMCYaUzDozBaJH7YBNxxnOp3aU9FdoTy8aRYjKEFCR3YMDymMxgxiN3GN3yybqmSRzVRVyiZVk+7vn4mv2kpeL6wfLJ4tqZBuZYJXa1GL3kSfiQ4N6pTBchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43737ITja0zBaHL08O+LOoRG3LylD7T40HDB3k4aQr8=;
 b=eB9/8tT/l/XnxrXY6wmT5lYPqUuRGiAcVYgsBdhKltZOggjv9rK6t3zxD5QLMBs3cYt+kgYoot7as8kHauAf/Nsv8yMFMbLMijG39hkIiVu05v9yU92W/FiwL9G5NCrMI3O0XIjsEVRN1gvBQni0k0gekRyObQMQBZK5eYpgZAffsYxrvsRJ6UChjZ4yKFP9sqS2QABW/nQxoOVHcw5Cyd9a3Rptzgx+ke1BRBYwFbCMnVqVQUxueLU1jE9kFVDU/aeMYxB0/cGE0pfvJr5FT1+b/2y23NpSBUg2IkNVHz+WFe7Zf5SixOQoUhpaCbe5xtT/UikGgG8SMQjB22yAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43737ITja0zBaHL08O+LOoRG3LylD7T40HDB3k4aQr8=;
 b=3Y2FMRzRrphIgxQPeYodKdutM6Kk6LbhLoiMhEnKc/1vhWdbjN/qhCw/Iqxyf5RtkJXkFv8+fydgKgYSFnjs3TGI0bkPmqhBOt5FMhAIseAlFljzZB77aDiYl09YkbmAmddObAjbKM9o782z7KmAITq2hUVrPntK1enKFMvRjhc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3004.eurprd08.prod.outlook.com (2603:10a6:5:1c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Mon, 15 Jun
 2020 14:01:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 14:01:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWP+e0l1aGgjLKI0+XFOOVnv/iZKjUz6iAgABkF4CAAD1XAIAEShyA
Date: Mon, 15 Jun 2020 14:01:45 +0000
Message-ID: <D0B4C19F-33DE-4215-AC42-22198FA5A005@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
 <71F7AE7B-BB12-4D3B-8337-3FA6040CA632@arm.com>
 <2ea01884-a254-47c5-68a7-98ca77afc06b@xen.org>
In-Reply-To: <2ea01884-a254-47c5-68a7-98ca77afc06b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59de04a6-c7ad-43f8-142e-08d81134a8ab
x-ms-traffictypediagnostic: DB7PR08MB3004:|VI1PR08MB5406:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5406FA48D6E96BF99DDAC19F9D9C0@VI1PR08MB5406.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sx85KxS1jbYThNZXTBcQzZ7iAWAJjukAftZaFSBBGznO7PmLmiog33k28rhAmROFNDscOyfbhVkq85bCNBmyBYmLYhkvtelhcMtInZeJgj8f/h5Go+yhyFzDX16nf33gLxEytR5hV77SgOpspOoMz7fRVrQokq/l4oHk/y2TNmfZaf+9Y5r0ZeYinOQyhrYKzPM1BbKmRZIZpa8G3TzEftE5l43XJ4xi0KRTs6SsqvaQJGkr2oO000DfVfCJz+LU2ccmBmOoKBoUyrxweGfxXmy6sHTcQvjYgCa/OHMwbYajJkjtMML0bR1UBcToNBA9qMIKFebUB4MDAdi3lpjrNg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(5660300002)(36756003)(6916009)(66946007)(186003)(64756008)(8936002)(66476007)(6486002)(66556008)(66446008)(76116006)(26005)(8676002)(478600001)(4326008)(54906003)(71200400001)(91956017)(316002)(2906002)(33656002)(4744005)(83380400001)(86362001)(6506007)(53546011)(7416002)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 3Xq+LhgLdaKPLln4Tp1+pHmyxs/lBxMMWF0Km8gHCHI3kMCvCZI+VqIcWccH9twfpVRNEa5M7bHjGhmSObjc7Blcw3FWgQLOeZBXzmRzuA1Th6VR1VPlPw7CFrQp26YPcjvugSadufVTnoWEX2yXaBpFxFjf5uckRT9OWyOx/lSwPNrEtM8k/d+oKh9/f0ePCCaIbEvog1KE6hky+x0o58i+ndRB7lkCmB+k7X/ZY1MRWa7JUPF9D/HqHBFoDPp4AXMIGs2IQP9gbg44ewq9ePr0RhnBpYTzrs4jHk+f4Xlcx/oqyl2duJWzHAMAZu3ww7hirYqGWP/WSX3rSTOeWF6cioV7Hj1fzVH3kE1PqtQ5fVZwoVbxEaldE1YpT1NQyx7p2G1VYk5cjj1Wf4tqizMvA9tFEesuQa4/i4HQ4CIn9u3M1XcMOEk3HVvDzGf3Alj/HlAjrDQKrmeLgYVaLmvySz7AR8jCnsJFghxPGj0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EF44C52581681C4A86EBAA2092974257@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3004
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966005)(82310400002)(70586007)(5660300002)(86362001)(83380400001)(6862004)(70206006)(36906005)(36756003)(336012)(54906003)(8936002)(6506007)(53546011)(316002)(478600001)(2616005)(47076004)(82740400003)(356005)(186003)(33656002)(26005)(81166007)(4326008)(2906002)(107886003)(6486002)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9e6c0cb8-1b6f-44b4-9ddf-08d81134a3f2
X-Forefront-PRVS: 04359FAD81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Scox1VTTytRTgMACe8OA+15R+qw5Wq/j/zX7wgYyRXV1iGq8jmQS37zpzQKLydohO40iZkZGsOX1zLla3dEp2o7A9Z1n+O5C37r0RGq4y1jfXjz7Im6s1y9OqxI6SWwuWsD93ijBd388yCYg66SlLKhFgyVu5sepjlV2rmllq8F6xEaWTIzfLdnEVeyAxT+XnvtTM9ahWAZi6FktKEau/pSIlsRctYdMPul4s2wx0ggDdW2OO86G20t4SjQI8bIyzUtErJJ3EzT6FVKE8M+UlgE9CSCfLcCLyOEKl2Kyb/teRMoSY1H2w5gDQkmn3jMa6xHAQ9/h1PEUytAHmjn2Cn/R0OvBfMNZEFlIA65KY3MWcjHlmlutUnAdUiPpbLWcKMXhsb+b0rnjsF4T2gvXOQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 14:01:53.7261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59de04a6-c7ad-43f8-142e-08d81134a8ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5406
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 12 Jun 2020, at 21:31, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 12/06/2020 17:51, Bertrand Marquis wrote:
>=20
> Hi,
>=20
>>>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain=
.h
>>>> index 4e2f582006..3a7f53e13d 100644
>>>> --- a/xen/include/asm-arm/domain.h
>>>> +++ b/xen/include/asm-arm/domain.h
>>>> @@ -11,6 +11,7 @@
>>>>  #include <asm/vgic.h>
>>>>  #include <asm/vpl011.h>
>>>>  #include <public/hvm/params.h>
>>>> +#include <public/vcpu.h>
>>>=20
>>> Why do you need to add this new include?
>> Sorry I forgot to answer to this one.
>> This is needed to have the definition of vcpu_register_runstate_memory_a=
rea.
>=20
> I might be missing something because nothing you have added this header s=
eem to require vcpu_register_runstate_memory_area. So should the include be=
 done in a different header?

Right.
This was required before when I had the definitions of the interface per ar=
ch to have a static inline for x86.
This is not needed and I will remove that include.

Cheers
Bertrand


