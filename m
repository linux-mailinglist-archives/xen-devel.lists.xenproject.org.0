Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA14039C1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181847.329226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwh8-0002Nv-SC; Wed, 08 Sep 2021 12:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181847.329226; Wed, 08 Sep 2021 12:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwh8-0002Ig-OT; Wed, 08 Sep 2021 12:28:50 +0000
Received: by outflank-mailman (input) for mailman id 181847;
 Wed, 08 Sep 2021 12:28:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNwh6-0002Ek-Pq
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:28:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fbf02bf-10a0-11ec-b150-12813bfff9fa;
 Wed, 08 Sep 2021 12:28:46 +0000 (UTC)
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
X-Inumbo-ID: 4fbf02bf-10a0-11ec-b150-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631104126;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wodbCM6Hlgl8wSUIOmYxcU89STUKdXw0inBRJN0XIaY=;
  b=GixLMEgHqc7pR3jicxjBh4hhMzEDJ9Bx/3QMDyglYuDZKxCpc0tkiGZS
   ivy4/M8wPwNuQF1qjIpaK1Ua4x34RB+TlpYyU029Sb+T6zIyu5WGNx2Rf
   K+EQ2T8NkV0U6BsLTy80i0eLG2Xf8Y9iSYQXV4cSgIDCmoRo1/00MU6NF
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +2yKxdrHQOgrG/B7HtjD4CdK4uJgisO4g59s9MzKG6PQ2IhseGISKbmcw/id7eeHyg9U6m324T
 usqTFc+zvpEYXG+cmxAHdSyaDBGXMZk/FD1EYRAtD7Y59ca42oHiqj8laRl1DHT2RUSiJDO/nx
 YQgPx9nUMHsD/6LBmRfAcmf/QL4sobbgewF2dU3CnLvdcFySWhulvThbD5DaQfPYCacVD0Swb7
 BlxWXA3pCRDLZ/OKn3JFUkAiOfwEJG9uZaeJ9f/WXSi63oFS76Ib4Hb+07AMnJR4AS3A0Ya4gD
 m46zqp3+9txWT0JWYbpIY1jv
X-SBRS: 5.1
X-MesageID: 52242045
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Iv4csa16fFa1ejDCseQl4QqjBSVyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQizuRYjzrY3GeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="52242045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkGp3tN2R5FU6E1FVv6PBAFe2ZYf7BZfC5u+O7xJyglCuSj55LYrzHuhgaJsZMeiz6Futly4xW5kYU7DI1Et8B1g8O9/3lVuxiG7AhYcm2bp9n7/hukfrk81Q4t2iIhM6WumBFA4ICnBDZsVTPF9EaYIxjE/HdJ46+0dAum4aUpK9Nj/HHw6iEZ1dfkCsF6gcYB5Bgot/ueFmzpqk6rIAKK11Mhh7bIpjjEpylbVWNU2XdRsV2/OQITaVZMvs6CZ2VumdOzA+XJysVlRj9e1NJSbeCIL1YrcnQxmSEnUWxS5GO7HaK0uA5HqSExHRl0hD3GEdW41J36FxjjPFPP9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wodbCM6Hlgl8wSUIOmYxcU89STUKdXw0inBRJN0XIaY=;
 b=XvFVhAKr0lz4XOZfE0Gac6kBBV3AE3Feu3LK4fopXIoL1N0ku9OAGDQyOq5Jv5mXnwLn0vQk242RXxn7r2q2+haSKhW030iDxkuO+X6UNHqqEPYXzy3fMtvurcF5GbiWUZ/bAgER+Z/1LPzZtbwzD42yFeU8STCjLaC/Q8lG6Cxdx+MXPqC/wTp+OF+PC+3UbboIB+c3huLDhHbhw2u2tEjH4g19SBCsuEJJgZdD36WoaQBW7aKoOf/T5v38F+eiwsHEkiuUuBKRB1krSkotEnQSMQbgef3NNMmRUcE4r5+QXgPFUfHqEPtxV5fITV4wEmvXkrKQjbLISn+fLaxhzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wodbCM6Hlgl8wSUIOmYxcU89STUKdXw0inBRJN0XIaY=;
 b=JppvLS4ZroM083ToHrDLK/8z+kegAPmZ7AAiq60Eax/CxVvakg1ltc4al2bD3MckVTQ93yuigukKF/bjiwUS4syb85xc4Pwr551ZFMUSqXRAXrtXVEu468069kN7EcGS7ubWGGpFwfex2NHqxHlKw7E2IaOxrxF4j53t3y7Ex14=
To: Jan Beulich <jbeulich@suse.com>, Jane Malalane <jane.malalane@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Pu Wen <puwen@hygon.cn>, Andy Lutomirski
	<luto@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <20210908081945.11047-1-jane.malalane@citrix.com>
 <a27d3631-86a3-cacc-efd6-97b02e3f8b94@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
Message-ID: <e89a7269-351c-6bdc-60e7-5b58399f1e31@citrix.com>
Date: Wed, 8 Sep 2021 13:28:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a27d3631-86a3-cacc-efd6-97b02e3f8b94@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f51b033-aa7f-4f6d-1680-08d972c43151
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5664E42D2EB201EEB95FB72CBAD49@SJ0PR03MB5664.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +817jgOoCCpbp073jZUvq2dU3zNpMjEa8ghp7BUq6lX58mfC5QZePbeYTZGN6NqTAPKvTXL3478rLWyKdA6OnIJsw2ihbcSCtCji0q8Yb+zNTQgvbtK7Ip+fXkPDRQolQWNOZi7DI27Bv15oABmBqR3j5hgClgScJ5g8UrQR00AlJLjlOI8F4sBDOhoPVQl9/EmB+X0lKjxrNMFvnqB2CRBGdwz1+yYWz62mnbFgC6b1dnfl9UFsQouDMwQOKJyBJUhQW5Ntb/1gxWCwgpn0Ba82aRmVXWDe6ZCBqiyk8U5y/n6pg8AY7piEbQ6ACOQI9hzkEuyzN9nnc/IamDSS+6fPIQu13aGfWuCDJzbyUYO5jTPbbyyFHTks1OpqA9Uq2UwnDjNM192Ij7x99PYiIkqY87eeYFgSvYZ9rDXFgOaM5maCwks2ejPthhO+V5avajXbnwUK1wA0+vpvyMyWJyriK7zOZz8BlqO0n2GSIG2ngTyvgc8arj9HG9X0K5OiJc8VN/f+6fzwgEjMvewU+6k7VRNvYZxZ89QLd270ybvw1rmA/85prJcXyt45qNK+5arNFfGc2tZyxt1zhzjpqvaBs0WSRC2WOHWWroukwamnIb1PfC1/1oJNz0n+nmXBOAyUCAItM2X/3AyuW4ho6Vl8u7gUxw5oC9DcxmwyEMNDAhpni7mS09x/hp7K/YC0w8zyQkNpV9PM/R+q0wSA5Wuef5KlSSMADOk1T0eOUM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6636002)(38100700002)(956004)(6666004)(2616005)(5660300002)(66476007)(66556008)(8676002)(186003)(26005)(66946007)(8936002)(53546011)(55236004)(31696002)(31686004)(316002)(16576012)(6486002)(86362001)(110136005)(4744005)(54906003)(36756003)(508600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBya1VhSy9rZkhkakxSeFdodHhtTWt6elFNMXgzQ2ZETEZGdHhLcHdQdkk1?=
 =?utf-8?B?ZVd5Z3pxeWZjc1IwdFJ4eUVhWVMybTBvUlJ1bTZHM0oyMElvajNaYkZpcUhO?=
 =?utf-8?B?MTgrWng5YjVySnlsUEsxUHBjb2syWTlVME52b0dJWWxkMksxMzRiRlNPUURT?=
 =?utf-8?B?RGlPaWpVUEJ2dlpBTURZOTdYZjNhVXFuQVZ6ZHBZZnk5aGhKQmFBWWtIc0lN?=
 =?utf-8?B?UVMyZW9ETHhuMWNEb1lTWnQ3dEVrUXlpUnBuUUZBYmpDZWtlMVRPTkM4SFIz?=
 =?utf-8?B?TmNOMmljdDhnNHMrNXZheWxjOE1pUC9qckk3Tk1pTzhUK3VaVEN1V3RRYTV6?=
 =?utf-8?B?ZVROK1piY1RZNmoyTkJoejlHZ0xTQ3BmWXFtM2ZIU0ZiRzhiMFF6WS8ralhC?=
 =?utf-8?B?VEM1RUdURTRyNXRZeUI0Rk1sakhoYUQ5OGhxNnFNNVBxRUxEMFMzd0lhMW1S?=
 =?utf-8?B?cjZOVzFObkcyWjZ6R01Fc2prS2p1MkRwZ0J4TDB3TEoyUVlSS2c1YitWOElj?=
 =?utf-8?B?Y1dlREVzTHh5UUhMWHMyTUEwOU50RElFT2l3VFozOTk2eVlBZGMxTjlKWStQ?=
 =?utf-8?B?TnlkWjNnMTcwNmxYazdGOElNajZyQ3locDZ5SWRyVzdaWUNQcVAwQlRadWlE?=
 =?utf-8?B?VVhGV0t2cW9YNk1Sc2VyZThuby9NZVd5L0g3MkZCQ0pkNDl5SFlxcVB5ZTVq?=
 =?utf-8?B?MFJoYWxqcnYvMXFtMTNzcStwb3dtY25IRnordkNDYVJ4VDNEZFI2Q2VlWnl2?=
 =?utf-8?B?TVlnTHRLSEdxYWNTcWNOQXhlUytCWlZNQ3RLc0VEaXNPQk41RjRxVTFzRjg2?=
 =?utf-8?B?YnNLQVAxV1dZRVUwSm0vamZzd3MydGdrMGZvSTV1VnowVnkwL3ZzOUU4VCth?=
 =?utf-8?B?WThCc21sRk5Mak4vY2FWdlBxaXZMZXVGRnQrRW1uakwyeXhIWjh0ZEEzd1Rl?=
 =?utf-8?B?Z2ZKNkE0QmZ4aHBYY3JvVUlCdTFmdUJLN3M3MlRVelhsVGF3dmhyNldJZEpH?=
 =?utf-8?B?ZmdnYSt6NHhsSHh6WVhYclJOaUpYc3VYWW93T0VBVnZTcjcyMVpiU3dWb1hi?=
 =?utf-8?B?QkRyZmlXekZ1Wnd3SWh6YkJGUzVUaGtiV3lHRW5CQ2Zkd1JzQ2hNUlA5V3Q4?=
 =?utf-8?B?ZmJaNEp1UzM4czEyWTV2Tm1aM0FpeEtlQXdneTFoRWUxb2xxb2V0M1RFUlVo?=
 =?utf-8?B?RU9OcjVPVmx2b0hBZndoWHA5ZGV5ZTlOMkQzZVU0NGtqZ3c1L2hhL2pQUC9z?=
 =?utf-8?B?R3BRZys2YVM4QW5OcjV5ZGxpRFJXNnhrVjRZbTc0UXM2bGgxK2syTmhBS3FQ?=
 =?utf-8?B?MXVUR3BmNTEvWFlDUDJuQjFWK3hUb2hFTWpCajZaNGRZVzhSQ3B5WG45UFIr?=
 =?utf-8?B?VTNoZmtoZWI1VEhoZldIRFM0UVpvTys2aDdTSHpGTFNXY0lCeFl4anNJdnM5?=
 =?utf-8?B?SjBwTDJPREhhUW16NUcvNWNhc0FrTTBiUHZHcnJCYlpSdUFGREtyeWZUMUN6?=
 =?utf-8?B?c0RUd2NjVjRWVGo0dVI0d2EzWGFnQTBrTCtPTVJ6enRicjRTL1NuNzB6L0xk?=
 =?utf-8?B?R2xydVNkTkZxRGlsVysvOFZ6V1BBUHFIbEZlTTBhOGJzNEFYbktiOHZGRnBB?=
 =?utf-8?B?TFF4Z1hISDFlQU1MaFErV25TNjgrMjBIU3NSMTdYN3AwK2x2UXAyVVVUMzBD?=
 =?utf-8?B?dHFJR3B3b2F4eG5QOWFkcnIwcXRNY2lwTUZQOUNObEFTeXdVZFhGYS9Hb3Aw?=
 =?utf-8?Q?0TuJVi9cD+oUcoXw4V6cq6cWEK7UrK/IwK7jWV0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f51b033-aa7f-4f6d-1680-08d972c43151
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:28:41.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8/24zCFPSWIVAbV3t9vihkvpUnksG9Gwis4sXUsKZHg7AqNl8MRLe//i0a7dFKgQ5al3hza8CzCThcL85l6rG3vJM1wFoyncPedCQEThO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664
X-OriginatorOrg: citrix.com

On 08/09/2021 13:08, Jan Beulich wrote:
> On 08.09.2021 10:19, Jane Malalane wrote:
>> Zen2 CPUs actually have this behaviour, but the CPUID bit couldn't be
>> introduced into Zen2 due to a lack of leaves. So, it was added in a
>> new leaf in Zen3. Nonetheless, hypervisors can synthesize the CPUID
>> bit in software.
> Considering the prior model checks, I understand this isn't all Zen2s?
> No matter what the answer, I'd like to ask that the first sentence
> start with either "All" or "Some" (or something along these lines).
> Which is of course fine to insert while committing, so not need to
> send a v3.

All Zen2's have this behaviour.

The model checks were trying to avoid running the probe on Zen1, but
"model >=3D 0x30 && mode !=3D 0x50" is error prone.

There are no faults in the probe, and its fast, so running on all Zen1/2
is better than hoping that we got the model list correct.

~Andrew


