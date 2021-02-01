Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601730A84B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79869.145588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YvO-0006Nr-6j; Mon, 01 Feb 2021 13:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79869.145588; Mon, 01 Feb 2021 13:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YvO-0006NR-3W; Mon, 01 Feb 2021 13:07:26 +0000
Received: by outflank-mailman (input) for mailman id 79869;
 Mon, 01 Feb 2021 13:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6YvM-0006NL-Uy
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:07:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9a56ccb-97b0-45f0-b3fd-bfecb4f1ac0a;
 Mon, 01 Feb 2021 13:07:23 +0000 (UTC)
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
X-Inumbo-ID: b9a56ccb-97b0-45f0-b3fd-bfecb4f1ac0a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612184843;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FMI2Cy8yTr/93ZwxRqgzifnxTLwEw3jggpXvj+TaX8A=;
  b=ZHVNIV5zPcASagg5Dg6F8QCdlydf+CIQgkd78XDEr842ILcB99kTcFm3
   BDLwCjoB8bMuP/q4REaR8kOwfiMEnvkl1/L2Ep/mNZ2KGbJva1in3Emz7
   bpDj5SA0TY2zxGuCMs1hNBCWnwEHh3WUrEKUirbSvAw/SH+jOS3DsAxN5
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lMwtFkoNGmUbZN9rg2tLiIEAVyJSXXObP4HHjA3+LYjHoYaIdaBM/wliyUi+vQg59ThY9IJhwE
 1rjIonmuIKysZs8UUb1FiE2KIYrZtXpRYQuhg8JD2hEBTetpoBBdDX0lMDov5BnLtioAyN4C/x
 /JQPPH/sZx1Plyi9HmvhS6jqCST8R338Kvrz0GQ/KtV4X0C99mNQpN/RkCaTaAXREA5i82pq7X
 YB3rCVRiKyFVTEC0OcFfANLU/UY39e10us3nebPNG4H+shx8EwcmgkpEzvo6B+5umXpPeNKPE9
 S2I=
X-SBRS: 5.2
X-MesageID: 36471127
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36471127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS4AA/PhMz9kK1BO+rDai1Alu/oBuUa/KjH3FKHxNM72G30/uCbzX5Rz1q08FrkKmgcWUiFvTGxInGiqRtzuphuebv7JBJDbyb5QxYNmLQ0Q8eLrvBkulGke2sUn0j4IW1IiFeTCx+w+CwVnYlYDRBYp5R51VhNFahHRkpEHFTcMkN8R3XxuMiDjmiIpYBRhGn1aH8OS2Ut/PnF48lojfm6I/wHqUU+/wv+QuA5ABLYRONumhtkbDhCo9/Ud9qmDPlj6DayCrVKcKW0l3mPUSezSBuhxMliNHWyG8lI9SskBTc+BTvvib/sPvg4b8/ZNDK3BbLH4EyH0T9709kbWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMI2Cy8yTr/93ZwxRqgzifnxTLwEw3jggpXvj+TaX8A=;
 b=K86yXtw5ICke9R1qrHgWO6xzb6FZxI5Hf9r/errSJ5W4k6gFoXOCPkcVqxegfmH70dT6vKfXJsnreiJ3WSV1kDAyAOPyUiN5MaId2fgjV/a1+5bTa4MrJ3co54EHltcYbwqGjqmsRH9G4o9v0drt9u1uyhbDbQS3FgEQnJXMRZBi6LObiCpq5xP+S9jr36prvoR3vMsoxnapiR6wsBL+VBYrLsL99+Gp6nrvezqZUd3WHu2mD151woXX4iy6JkL73njg27o3dvyf6BQV8iXXMjKvUn5uhM+9Z0LbH4XNViVcO7Vfnkx1GmH+CaqCN16XmEFuZedqBGXYqDDhoP7o6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMI2Cy8yTr/93ZwxRqgzifnxTLwEw3jggpXvj+TaX8A=;
 b=Un7W6ooheR8inl7NzKITCr2JCqRTc+kRKvuphFcVtMCRYz3orNi0gIgKM/2mzm9aivbp1MnO5sPIGSHnws9jAbIt/3eATqe6Ij+u1xrbGnySkG2uvrMPii+sru8pVxzxxc/m8KH5B8LazD+Q6QoV7Z3+MPxy4bf0QJ6iEYnfYFw=
Subject: Re: [PATCH v8 00/16] acquire_resource size and external IPT
 monitoring
To: Oleksandr <olekstysh@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Tamas
 K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fceef592-e637-e985-8217-11546e088027@citrix.com>
Date: Mon, 1 Feb 2021 13:07:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::26) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea264dcb-92eb-485e-6665-08d8c6b249c7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5904:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5904F0633459BE7144814DABBAB69@SJ0PR03MB5904.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01X77vhT/lHHzKhC0Abh+d67Nk8wZWOqLUvwebbQPcOh3G1OUaql3pDLS8YhwZdHPciuPHNISj5UvhAKkTlDbi8B0OA9AbYY7mM5l6iXKx+89Ju3nqKgnCe2872+u9aDC+OY/dFPFR9MJZYtM5sdQ4GkIpjtiVfyTJrokCI+CdZBLtClJDm5Nb3gbySeAjBZOb1aGALd1M0bCUOnyMmq2Iluenkc4f6fG2cm2RjHb9S71H97YkdQ2ze6/geNUtK5aRvMWVy9z71LH3SznNmv4T1EXcGIHgND96n3vlfTrPwr5M2Umv5Uht5nE7VkDqRqEeKzXiZeuwRgnTLut6xrtacbkhLfq3WiGXrH6d4C1fo/ClAQqx0haxMM6/9gJurvFvX0CMSRJee9mhlY7M1+g4U57DHEaaZGXSgar6yocY1TElbMfQwtbB6zH6hnrQZNM+UqJBSV82p28j+/1gsiS9hx2/nK8vJhw1YgBWpdHKngnkPAwEuXBy+P34eBL1D5gRuSOfJOp3rsTv2rbFfRyZzgF5yxwMkMZKO/agQWPCcVJDqg7iGwC43HtltPPN7OJMwZJ6HB/fikl5HIpYbMCXVQHcQ1HFXDZKvdy3gpW/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(8676002)(54906003)(83380400001)(53546011)(26005)(6486002)(66476007)(6666004)(16526019)(186003)(66556008)(66946007)(2616005)(5660300002)(956004)(8936002)(316002)(4326008)(2906002)(16576012)(110136005)(31686004)(31696002)(36756003)(86362001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXR5MnNOalFNenc5UE5pSURmWHplUURXU0NBMktPK1Y3Tkt5NzlyR0s5Zkl2?=
 =?utf-8?B?UzdxZkJkT1lva0JLWW9Fd29SNTh3TGI3d0J2R0lhSWE4S0w5QUNVU29RbERO?=
 =?utf-8?B?RHo2dm94ZjA3MUU5RWp4Uko0TllsWU16ZUdDRFZzNWpteUtUWlpWNUN0Y0xO?=
 =?utf-8?B?d01RVFVkYXhtVHorWVJ6TkkwekVZNCtKZ00yKzFEdFRkczJpSGo0RXFmdWVD?=
 =?utf-8?B?MURqQWhzWmIydzRlZk9EazdiQUgvZUE5L0ZILzMraVBHQllIeGYvTXdnelBG?=
 =?utf-8?B?eDBHcWN1N3M4NUkvLzY1WDNQNTltUzhqRDMyUkdDNnZVdUV2MEVMM3F4RTE2?=
 =?utf-8?B?S0FuTEhRQ3JKblRSc1lRSWNnRDhmcEJMbmVzdjJ5UWtBVFlNV3ZFZXVFQ0lV?=
 =?utf-8?B?RGU1L3RPd3dXSEFpb3JKQ3lOVmd2UHgxM0JEZHVVR1lIaEdhalpjcTJFUnJU?=
 =?utf-8?B?OFNRaUptdEUrbVFpT1pwdHhnTXZTdlVtamo3U1dVQVdUQk4vYWFSTHQvZ1BQ?=
 =?utf-8?B?UFhzREFTbUwwMThmWStycklob0RuYUZydDVDN2x2WmpicWNHdW95a1NlZWJZ?=
 =?utf-8?B?Nlg2OTJ4SktOeE9ZeTBSdUErUHdZS1lEc0xqT1lTUFQ0N2podFFYWjB2NXll?=
 =?utf-8?B?SDk2TnRKS1h3d1JYRTRwS1NTVFNGMUtWZjh6SWlUMzNMZnhqTkJzWWgzb2cy?=
 =?utf-8?B?eXlKNXZKOUkrdmgxZlQrSnQ2SW9mdjlxNVpFTUJ5bFFZamk2S1hOS21TTmtB?=
 =?utf-8?B?MXFnWmppYTF2VlhKcXZGMGxmRC9zYmxLa1lzS0V3b0laNU0rdjJLMFNRQTJY?=
 =?utf-8?B?UldLOG9JbnB2Nm9rUmdkdzFCU05qdXFnWE84elc0TlFCbFZmd0pEL0p0OWxz?=
 =?utf-8?B?a21Ub1ZPTlNraWROYklnK0pTeFgvUmt1bnhzWDE1QytKVWRKSU1hem1tTFhY?=
 =?utf-8?B?a3h0aVVLVFBwZGVZTENDaXpJaG1NOEcyei81MXBGd2xuR1NVZnJoUHVZZEt5?=
 =?utf-8?B?RktXZ2ovUlJ4Snc3N0pRTEphUlZMVi9pT0o2dXNtWjFqcWZwVG9BQzBjc3VE?=
 =?utf-8?B?MzVhVDFWK3ZnQWVUaTVjUzlLd0E5bU4vM2ZSZEM0d1VtemRPTzQ4S0NETFl3?=
 =?utf-8?B?eFB4UTVieDdNSFpLWlBOcXBJM05XR0JNaTFiTlhvVVdYNEhCQUE4dTVEUXhR?=
 =?utf-8?B?MUZXMTczM3YxdEYzODNtc2ZvVmxPcWRqSHpPTEtiRTVITkRJbnh6d2dNTUNl?=
 =?utf-8?B?M2VhTDZKRjZ0czdaUDY3ZzdGNDc4ek5OQ0Fqd01xb2dRcGVQRDlYQU1wL3hU?=
 =?utf-8?B?TGtVQk9rZFZ3dHRKUFBIb1JSZ09NNU5QU0pSdlJGa1lIMWZJM1J2dmVZOGJX?=
 =?utf-8?B?L1RXdjZydkNHd3p1UnZOOHdoK1VvRnFSVWM4VVNrdlZqMEcrTEd5Ym4zM0Jz?=
 =?utf-8?B?V0JMeVdGOThtS3ZXRDFKajlQVkFNdEhxL1YxbG1RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea264dcb-92eb-485e-6665-08d8c6b249c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:07:12.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgfPrO5GsgLuohUNN5kg6ch0OGecOvTY15yCG82E6V9B1L8rbSFjStnCZadE4vnIC75NTgztwsWHNy/kbNo1K+Q4rx/W97PQWtsoPz4LEW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5904
X-OriginatorOrg: citrix.com

On 01/02/2021 12:34, Oleksandr wrote:
>
> On 30.01.21 04:58, Andrew Cooper wrote:
>
> Hi Andrew
>
>> Combined series (as they are dependent).  First, the resource size
>> fixes, and
>> then the external IPT monitoring built on top.
>>
>> Posting in full for reference, but several patches are ready to go
>> in.  Those
>> in need of review are patch 6, 8 and 12.
>>
>> See individual patches for changes.  The major work was rebasing over
>> the
>> ARM/IOREQ series which moved a load of code which this series was
>> bugfixing.
>
> Looks like that some of these patches have been already merged. So I
> preliminary tested current staging
> (9dc687f155a57216b83b17f9cde55dd43e06b0cd x86/debug: fix page-overflow
> bug in dbg_rw_guest_mem) on Arm *with* IOREQ enabled.
>
> I didn't notice any regressions with IOREQ on Arm))

Fantastic!

Tamas and I did do extended testing on the subset which got committed,
before it went in, and it is all fixing of corner cases, rather than
fundamentally changing how things worked.


One query I did leave on IRC, and hasn't had an answer.

What is the maximum number of vcpus in an ARM guest?  You moved an
x86-ism "max 128 vcpus" into common code.

~Andrew

