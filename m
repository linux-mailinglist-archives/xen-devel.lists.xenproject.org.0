Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9E36EB9D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120046.226999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc75G-0005eq-RM; Thu, 29 Apr 2021 13:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120046.226999; Thu, 29 Apr 2021 13:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc75G-0005eP-NF; Thu, 29 Apr 2021 13:52:02 +0000
Received: by outflank-mailman (input) for mailman id 120046;
 Thu, 29 Apr 2021 13:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KXr=J2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lc75E-0005e6-Tw
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:52:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a82c594-4acc-4912-86c9-2acffd763b54;
 Thu, 29 Apr 2021 13:51:59 +0000 (UTC)
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
X-Inumbo-ID: 2a82c594-4acc-4912-86c9-2acffd763b54
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619704319;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J0rkSehxRnaP5OEe+FeL+nBVXIlDkDepSVoh1kZEQLU=;
  b=SvLZi2uuKOs4BxDCzQFezho5genhWjrToJx367WT2lD726/7/k3M3V68
   QsmUy7j1ZCs1HeCqY8d3iFl09BawKWnDUt7Fip/7km6l5Ol1zo9iZyn5F
   RTjph7QnEkCTrGZ/tN+dFoLQm1VXEO7ab8eMOY8ihI3wTLbh8wviaT9ov
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /RnKoD8LpbVW7jBNZMw1h2g3o9mumYRsDm219nAXpSg+PkgEYL9nR0VeFYwZyNTgRcglOHRwTf
 Uf1JYAeWNRVGFWadVxZsWrHRACNTgEftUYTxB7txAOimpRyKpFiZueJazuavIkBDjZ25hPzL8W
 bICBHvgBw3bVjIs69k/FGGI8vNpySVwAvai6Y8YaEl8EOw1J68s7qBx5DyLQDn6Fxj//nen6mf
 vVaPkr7WSdtQuBZt+qUqG26zFJ+OxOh4FNTQwTJI8Tg+ZgzswzyWqnhCJl9AEn57gHvLHd9Yw0
 z3Y=
X-SBRS: 5.1
X-MesageID: 42822720
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QChOFa4xqpb4QliKKAPXwT2CI+orLtY04lQ7vn1ZYRZeftWE0+
 Wnm/oG3RH54QxhIE0Is9aGJaWGXDf4/Zl6/YEeMd6ZLXLbkUGvK5xv6pan/i34F0TFh5Bg/I
 ppbqQWMqyVMXFUlsD/iTPXL/8Bx529/LmslaPiyR5WPHhXQoVByys8NQqBCE1xQ2B9dOsEPb
 6R/NBOqTblWVl/VLXdOlA/U+LOp8LGmfvdCHZta3EawTKDgj+y5LnxHwLw5GZ5bxp03bwg/W
 LZ+jaY2oyfsuq2whKZ92jf44U+oqqF9vJ/BdeBgsVQFzP0igzAXvUDZ5S+ulkOwd2H2RIDqv
 eJjhsqI8o2y165RAqIiCqo8zPPlBA063Gn80OSghLY0K7EbQN/IMJbnopSbhbQr2Eages56r
 9Cwn6C3qAneS/orWDX78PSXxt3m0Lxi3wkluIYkhVkIPsjQY4UhoQF50teDJoJWA784ps2Cf
 RjAajnlYRrWGLfRHjDpWFk3NGlGlg1ARuCRFEP/uOP1Tw+ph1E5npd78QFhX8L6J80D6NP7+
 OBFr5n0ItPXcN+V9MKOM4xBeC+EXfESw7AOCapOFziUJoKInTXtvfMkf4IzdDvU5QS15M5hJ
 nIFGlAvWp3QUjpEsHm5uwDzjn9BE60Ri/kwN1S79xCo7X5AID3OTCeUjkV4oOdisRaKcXBQP
 64JJ9fR8X/JXDyXbtI2wGWYeggFVAuFOYcoc0yUU6Cqob2EaiCjJ2vTN/jYJ7WVRctQCfWH2
 YKVjmbHrQ70mmbHlvDxCX3d1yoUErl5p50GLXd5IEoufUwH7wJjQgPlU783MuCLjpPv8UNDT
 xDCaKilrn+qXi9/G7O4WksJwFUCVxN5q78F3xQowsHNF71bKYDt92TdXs65gr6GjZvC8XMEA
 BeoFxr+aW4a5yIrBpSdO6aDg==
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42822720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf3TYGEqcf6QQCGuNB7jh67v1z/hF68b5DzJ74RMW7/SESlqwjjKZ6E3DfP0qL82quOXrmbIQ/CvfE0aZ+G16M7uJY00FafAWzN/EkVW/gX8knbDFHM2/Sgl9fCtv7AfLn6N4euAlf9RtLiw6tQKKIVE+3gkuJh3NbTX3qBaUgZqjNH950OSmcY5jeG6KN0vuB8nr/Z2E2eSHtRO3Sa17tb/Un39uKBcB3iYdmb0d6vhPdF/2+nzh+K1tpt/Faw2r107kdTPBw6RR0OSi6gJnt07Zvwhz6mK77BJhvuEuWx3WhFvZ2Q6O99Cqf++nCu+JYIg9MQy73+4aklobMz/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0rkSehxRnaP5OEe+FeL+nBVXIlDkDepSVoh1kZEQLU=;
 b=UL927m5XzQBXzBQ3ZLGw+TgbfbYFtlwQkNwSIKxsDgd/U/NLNOTt8sixTGAnNFIhfD6NwlTplyvzBVoVuJm6az8tgGb0olo0TOdLQApy+w8BsQLyI8T0MCVfnMDqmy7XNUXjGmZVP+wubtrmZuZyJB19x4wKYFsopweM8myTfdLxrO0HtbeQqRqEaOmlgWmldpA+Xym91QT3LlNC9CogLUbU8V2rfoA/NHAhv8db+Sg5id2A/JstrQRmTNBGRvdzwZkuGuVmE5kur/vDVJjjRYRw/CeDCZsJxd1BrUDsUCpedMKmxjijtVmtSuDPHaDZ1jQSbBE4Rx3LEOnDF4siJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0rkSehxRnaP5OEe+FeL+nBVXIlDkDepSVoh1kZEQLU=;
 b=i7p4lF/ykb1y5w/PFMoQXJVH6Rw7RK+y4/keXq+7H00hRzGKCYzCgltq/yMs/MC3H3vmdg0+vDYJawEDnTP9dMTSedyQ334IqSVi0GlDlIGj5iNlRwfXKbwd1yOpC0XdjRCX7xjfVbuDFl7YTGXZDP3W1GtZjuefDApKF/ySfE8=
To: Jan Beulich <jbeulich@suse.com>, Costin Lupu <costin.lupu@cs.pub.ro>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
 <ce98780e-5a32-9faf-832e-04eae6cdfbcb@suse.com>
 <32cb6cda-5522-02fc-f800-9e4c279e45f6@cs.pub.ro>
 <fdcfbbcb-7657-6a48-b0a5-21b02593b36e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ACPI: Fix build error when tboot is disabled
Message-ID: <410b3c74-f718-d4b6-ace3-9c26a6ba06e3@citrix.com>
Date: Thu, 29 Apr 2021 14:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <fdcfbbcb-7657-6a48-b0a5-21b02593b36e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 973730cc-af02-4a9f-b3a8-08d90b15f255
X-MS-TrafficTypeDiagnostic: BYAPR03MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3559EB531CE4C355C6D11FA2BA5F9@BYAPR03MB3559.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /AczAqZR3bOOaG6tJGmQj25A5r12u2rpCSEEkPI9ZiTPmEalAPbw9ll859qkmapo5k9udqQhgjPAPfIHGzGNE9mDQFpE8rT3cR6WcktVDcJAunNk8ZmHP0a6MMniR2huO7/cfpdrj0FOISoaL6Z8JRwTImi+oaLi9lsWhY5uf6oxzmgV6GQQoNQKgGashFJkrunAkkt2epKIy0JSMmppXChCkczJjlr4lY8yaF2mJ1CzhN6I0Iil5q7y9B7kAJqzy9bfmd2iXwF9y1bw352TFq+7Io+Qj7DRtvrnW6KhJ5UIUkI2gJwqUW4KEm7pddVVs+u9ERPx6xMMnYPg2rilLEzdEX7CQj/K3VxDnHa8WD09PRwQL4Wjk08EXFipmRuea+pvPHMjEalsDOhnbvwweQXn5QUJ7YGVB1v/pOMlExtKcXkH2z67nbFWI/bhc3Ma/PrkU7NVRt5TJkiNpSo1utnZZ156t8bCRB4ZiU3N06hfWGR+N3D2BahFw9iAfXys5NTmsitpv9lbpKRC2hMH6NO0gQrF4q8LBbweRpWaxKmoRrdy5KrVc1/C+LDDKKiOtE9dqrlq5IKu3giWnI91oRk1RiKwxBQdkytTc7m/laJCzpqPFAKXRuRPl29KC/tUbicVHIRRelsX1Pv5GARa6ufDX3VtwtDg5YRdK+CUmUvDswjL/Ln/4cO2rINBmXus
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(6666004)(31696002)(478600001)(31686004)(66476007)(16526019)(66556008)(66946007)(956004)(26005)(8676002)(36756003)(8936002)(5660300002)(316002)(6486002)(186003)(2616005)(4326008)(86362001)(53546011)(16576012)(2906002)(110136005)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aU54ZUtaenJ4aEkrMmcyeThQcTdLMkdXU2xDUW8wc2RZaHJFN0grOFhSVzVs?=
 =?utf-8?B?OWVLbzdwYW1wUmpudlRGeldQKzVmL2ZQUzlnNzUxMXd5OFpZWCtHMW1sd0tV?=
 =?utf-8?B?TkM5bUVZc210c0FvVzNLeVFWVXhCSStTZmdjMXJ5VC9IQnIzRkZvRVFEY1E0?=
 =?utf-8?B?ZWVrbVdta2dDZHl0MnFLb1ovakxqNUtaNURyZjFBYjJnYkJodi9Ldy9aSG1a?=
 =?utf-8?B?Z3Z5OUFGMEF3YkdmTTE5VzVzQXVtMG9ETnVBdlBRK1k1TGE2SXA1UW9WZmwv?=
 =?utf-8?B?SkZKVTAvLzJ4eUpDTHR2QUxCNXhUNG55TzZSOWJhOTNnRXowMzR3WTRYaTJO?=
 =?utf-8?B?OFNWNmZibS85bWoyTDA3ejJXaVBReDBRVUFJYXRmRjhsNVpxZ0ZjdUhIUWNW?=
 =?utf-8?B?UzBMVXVyYzNKNmF5bGMrQm1Pd1hhakVNYjVWVEIwM0xmRWZOLzVVT0U2Y1Ax?=
 =?utf-8?B?MTJMaHUzdjI3a3FUVHZkOG91ZE00ZzdhMXhJSkZ1ZEgzY3NFZnBGaHRObDN4?=
 =?utf-8?B?NXJCUUZHVWNlQWNHUXdnVHpaNWdySFo3SER2Y3NtSXdNVWFwSTlDeUs5bVNp?=
 =?utf-8?B?Y2habnhBYzgrMWJXYXlacEplVXlpUjQxdDdXMW5LOUhjMDVmcjFGTTJqa0JY?=
 =?utf-8?B?S1lLdFNOb0pyQytLMXRXNVhxVElNT1huUGM1N1FuaGlaTFpuZW9nZ2Z4Slh4?=
 =?utf-8?B?TXNEWEJYTGx5cjBPREM4SHhybWRFbE5kYTdLalNheTZMeHZxNmYxNWFDNDR0?=
 =?utf-8?B?bzdCenhCWks4YUI5ZXM0SXltWC9WU1ZsRnVESXlSWk1mM1NndmdOZW1NNFk2?=
 =?utf-8?B?RXFRb041TlR1OWVMUUpHdG40SDBhZzJ3YVMrdWw0MHFEbFE5L1VSMjdLV2lC?=
 =?utf-8?B?bVQyNUZGckJ2ZVRLaEVTRkMyTDVlbUpkWTdGdWNjQXRPNm4ydWJPQVFuZVlD?=
 =?utf-8?B?dkxLWkZxU0ZydTUzNTZRWC9vSG16dW9idm9EVER4eW5xclBxZ3JqUllzYVhw?=
 =?utf-8?B?YWpMY1pFV2RId0wvMHg1b2lGZ2xraTRWdHhKQkk4c29XcEh2ekFLQzlZZUVZ?=
 =?utf-8?B?Q0xNK0tHSUkwOXVoQjdNbDJxT0hLaCtRTmpudEFEZHU2MHNUa3RYa01Jd2tF?=
 =?utf-8?B?K3RpNGtuOE5USk1zWnhNTXI4dFc4MVU3cDNIcDhuQ1NyU0k4RDAySlo2NzZ5?=
 =?utf-8?B?V1krNElXeHVHekx4Wk1UQTJNZ2hFRkxwTEM0MUJBanBGcTdJZ1dZdzhhbTU3?=
 =?utf-8?B?RVI3Rm8yRlo0dFFxaWV5RHk4TkhOeFd4ZEx6SmozZ1MzTFZSc3RxdHhhY091?=
 =?utf-8?B?anVCSGd1QWFZRU4vTkxEL1Uxb0ozRFN0bm9ZVXBGclhYUis1TXNBK2lLN2pq?=
 =?utf-8?B?b2xadEZia1dQUFBLYlEwRGxsYm4wK3BZV2hHSHUzNHQ3bjYxVFVSNmVnQWRR?=
 =?utf-8?B?QmNjejN2NS93TWpiaXIwMjJraEdlUm9oMVpSdHZrWCtrbUdKUGJSclQ2RnB2?=
 =?utf-8?B?aCsxMklnSE5YVGlxL1hrdEE3c1d0QkpIYTBCYTZVNXhaaTQ4ZHcxaXgwV21R?=
 =?utf-8?B?MTdKUGgvb2FBMTl0ak1uWERPTHlzSHU1VURuZDFEUFI0cWc4V1E2cFV0Vk1J?=
 =?utf-8?B?WnZ1cnNUSHhXallpOXFQaWRkOVRhSWUwMVpNMXdLc2RYd1lISWY3bUJPM3dY?=
 =?utf-8?B?WTh0V2UxcUk0d2huck4wQUtJT2FORk8veWVRSU1mUEFaQ3h2UjJVcXVEZWZa?=
 =?utf-8?Q?x/8/pPKW9S03yN4m6xxNoXamTQMJtUdVMO9XuAt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 973730cc-af02-4a9f-b3a8-08d90b15f255
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 13:51:53.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJAY1tpBbiHrDtuAgZjrHUcLiutq06+1Zzy82WJ6qjohEKgKhQOchM824iQhBoq3K40Zko4eFpT5JLEaupQxiP/gcFhF+FItWVngp3Qo3lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3559
X-OriginatorOrg: citrix.com

On 29/04/2021 14:42, Jan Beulich wrote:
> On 29.04.2021 15:22, Costin Lupu wrote:
>> On 4/29/21 3:40 PM, Jan Beulich wrote:
>>> If there is a specific case where the compiler fails to DCE the
>>> offending code, then you need to describe this in sufficient
>>> detail.
>> Yes, indeed. My bad, it is for a debug build with -O0, so without DCE.
> Iirc there's a series pending to switch to -Og; I don't think we
> build with -O0 under any circumstances (for this very reason).

-Og is roughly about -O0.9.=C2=A0 There is certainly some trivial DCE
involved, but no optimisations which radically rearrange the code
structure.=C2=A0 The -Og series did survive some randconfig testing, but I
can't guarantee that it was comprehensive.

As for -O0, I think causality is the other way around there.=C2=A0 Wei
elected to rely on DCE for conditional compilation because we didn't
seem to care about compiling at -O0.


Part of me thinks that we ought to cope compiling at any optimisation
level, including -O0, but I doubt I'd like the extra ifdef-ary required
to make that work.

I think we absolutely should have Kconfig to select between -Og/1/2/3,
as well as binutils new microarch levels

~Andrew


