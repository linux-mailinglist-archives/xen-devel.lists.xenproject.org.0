Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082582F7743
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67957.121507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0N2X-0003vZ-TS; Fri, 15 Jan 2021 11:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67957.121507; Fri, 15 Jan 2021 11:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0N2X-0003vA-QC; Fri, 15 Jan 2021 11:13:13 +0000
Received: by outflank-mailman (input) for mailman id 67957;
 Fri, 15 Jan 2021 11:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0N2W-0003v5-97
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:13:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7c605f5-5ea2-489b-9d62-417eb69926ea;
 Fri, 15 Jan 2021 11:13:11 +0000 (UTC)
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
X-Inumbo-ID: c7c605f5-5ea2-489b-9d62-417eb69926ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610709190;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gwhlAF9/zHzzg97mcb1ohPbdAcBGDPIL3AC5jPWeyVM=;
  b=Cz6/EEBvIW0TJg8VQYdwmzveGh5D6ylM3Jdcpvz2pgafHuVjEyPMYrh7
   sHspWUfbAopctEb3NSdtgNH2vy5NtSvLlOPTCbj/OsgaqvJGQYgbegrT0
   jul5ZKOt4ciimL3c2w8I1QZakOi+R0IPKWRGcsgCrQbKtg5weSKHmCii1
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7rimZWO7FlTU+OQ1JlGWlRJfAaEAa8aFt/Hhf7E1JM8HJYpHoUnhH3ayTb40lnTeU2fEsh2zFn
 tXZrwK4AVN4qFnkyGJyvBEGwrksVZ3B3m6foS7d+lqA7AYVwVSJWBlhJG7IeuQRDKsArZEa/I6
 W2oNIS/u3Ylj9dYSCGx1Ko2vPYyU36bdP5ri98ZZEb4raMzAdrgaBjSMbplot3hVagmujGlCp4
 oeGhD1rZSMQnvIRThSULcbJsjAlPx4L7PX1RaNAQwhw8fznv3YKvYmAxhi74GRKaeBGC5SEUEW
 Xlo=
X-SBRS: 5.2
X-MesageID: 35380802
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35380802"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhSlEzsT5v+bDW82zbPvkfnEbaCs61b3B8gwMdUogmC6XcUgeO7qwE1sw6XwBPGS+ffrtKZZuJZPYQZY0/05wjCryuaWaprtNaBD6Dc7S3zrQTkCFTNZiXZHp6d3sQFUs1ls3yzk+qtgMo0KqLnEaQC8xOOGT2YhaY+4Rls2Qdqf0c3qzg3BWQUH6nWqKHpeKSN8WyAdLWNniAJxUS2DQ4L9x95jMkusHdjrV1LoOoSgZE7G5zOXUjuPQrNAyON71rpC23CT0+RMfv8E2U16z4J72z4XMvcWCsPB03UIZ1shyQzE4bzVLlPRAGFe4aTZhqPQmz6fQfoDhgo5ZrXGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwhlAF9/zHzzg97mcb1ohPbdAcBGDPIL3AC5jPWeyVM=;
 b=FYb51mBkSgbyu9hrT4kcnnw9iJig432ielhB4XMN7v+5jXcv1MQYq1AFt+8Ml1q6pWzNH+9aUI9kF5I23lZKlZfOl85c/heFqVsd4kIS3XqrsQ+BfXxPK2DPhoNA4s+5/E53l5Q/BgBShimIwAN0p/cJyMyKpUCSnS5nE2vLumBMXWnw6iqqHk2DGvCEc2hxcLLUEW2TX5x78Hc4zUnOyFbErM8taHIrTDQky293JSbMRZmq4703Z4pa4qrRJSB6FSIg7OhupE9v+thY7w0qTyMrGuI/9C3HaxGZfBNDod9R/JkC2lY3eS8m9xPN4Pl4w8sOifkh2Ihtv2P1CWsN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwhlAF9/zHzzg97mcb1ohPbdAcBGDPIL3AC5jPWeyVM=;
 b=SG5O8ZsR2kqg1a8sQCOOdFplfAZPTc6FP8UNIdzxfOVhs+Wn++uJGZTdzyAnRjd08AVYpDllthSytj/LP6Ewf+ae+EoK2HHygQG8YNkA57vC8DGdPN/9oWL6yEORADM1cwe1mqDIs6zBSdrclVXoJuD0eahi3DOZ1LdCEIMOFPI=
Subject: Re: [PATCH 1/3] introduce unaligned.h
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, M A Young
	<m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
Date: Fri, 15 Jan 2021 11:13:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 127e8332-810b-4e9d-ac05-08d8b9468914
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56460D23EA5FC41C2BEBB9ABBAA70@SJ0PR03MB5646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7V5qNWqgn4GOk2+v6rWqqeTiYS8Ruwe9EfeWg59W7fq1dhqliQuDsH8lTITK7Q9o9nkvucTeU1SIe+myFQy5b3PqxSA+skaZuPFY531rP1AjK5W+HLSC9gyrWiwF0TF5JLT20oFhOtnQELRJkNMBOyqE58WLtHvEZViUUl+b6wkCi+DpY7iNAHZOKPKW/g+JYk1j0rRpCC5RcD8h2YG8vaebrmYY1FA5uE8W0epdiKKwg3xy6SyF3SIkKmrq1ZR7EwILEjvZ71sRal81PEZ7a6gBg65bJCJhnOgzogvu/NNoeLlkE+JW9MZ3rqBKprxdJoYcBl3xCGDrcZFTo9f4mKWTfmU+0EgLuDi192/NAuAqVNXZYC0yWZZO8G8hEdQh4BDo0KA/StZvRFusIxtzeLAU8S5R5CsKGRMnK00EslRQMEiZLxC9h8++yaHkdPazPmFI+SPe79FzimY4j8+IMUF8nKiFTHov5GBkjQqn98=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(66946007)(16576012)(54906003)(110136005)(16526019)(6486002)(8676002)(478600001)(26005)(66556008)(186003)(6666004)(66476007)(31686004)(31696002)(2906002)(36756003)(5660300002)(4326008)(2616005)(956004)(86362001)(53546011)(296002)(83380400001)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0wxeGZrODB6d2xvNWh2d3crVk9FbS9iSXFVMUhsVzE0RGV1UndQZzRHdytv?=
 =?utf-8?B?MUVwQ2d0SVhlSjlKbkwxdVB1S3N2ZThqMDhtYmFYVG9xamZESkg1L0JvS1Fr?=
 =?utf-8?B?OXdpazgxR0tvZEQrdWtqT2hGSDVCNlExQWx0WDBwSXk1ZnFRbXAwZ2lFOW44?=
 =?utf-8?B?UDRLcDJPQUU1WnV5SC9sQlZ0QXptTjRvVENTSGdraGViTEJ6UGdLT0hvbmhW?=
 =?utf-8?B?K21GaGVjSm91QjdrazBCNUtWbGxIMFNnNFlMTE56M2doc1FwdWp1ckVTalFM?=
 =?utf-8?B?UlRwRGk1RHZKZXQzSVlWRjh0TVBaL1psQWpBOGo2Nmo5U3lDMWx0Vi9kNVNq?=
 =?utf-8?B?cndOZzlVaWxnWHAxdk5SL0Uvend4Rlo0N2hQMXF0NGd0ZkQ3b3ozSVlLZkta?=
 =?utf-8?B?V1VqTnlTTEdqK2gyR3IvUmdOejNJWTBYTTd6Q2g4dG5IazRFb3Exb1JPdEpD?=
 =?utf-8?B?RitkTitBS2Q1TnUyWHRXc2dReEJYWm1kR3JMdktZWVJ4bTZSeDFBa2FDRkVv?=
 =?utf-8?B?NG4wcmZUeFpSVlEzRjU5c2FSZVkxRk5jcFhSaWx3dTBoMDVxOXVCdFF5ZDdj?=
 =?utf-8?B?TU8rWlJGa2VKWnVxQUZQVlpCVHh2bzB3dkpQMkJxR2EvVmpwSms4RlFmbks1?=
 =?utf-8?B?WTFBT2pjQzVuNE43SUpwOUZpWWxsUzZQM21PSkhEVEdEdlBUK29VN0ZOUFZj?=
 =?utf-8?B?VHRSR2pIR3NpSk42MHkyakRTUnRNVkpraUxrY0ZyRDdaaHJPVnppVVVtbDVs?=
 =?utf-8?B?Nzc5S212TUs3K1p2eTdLZmhIWFQ3OU1HRDlhYy96Wk11NGx4WW5oVFI3ZGxL?=
 =?utf-8?B?MVVsY1pUak9CSHV2KzdKTjVTWkxUSTJxdk1QZExyYk5jOXVzTnBCZEtnVFg2?=
 =?utf-8?B?TjBLaXlVL1RzMjF4NFdMaDkzSHZGV2ZLZXZNai9sUjhTTmFFRFhZd3JVM1VK?=
 =?utf-8?B?QzAyc2Q1SDNUWmdOZ0JONW5xa1BnbmxteWtIYjRySHZxYXFMcEQ2a1p6QVBX?=
 =?utf-8?B?NUVXMGZmSVA3Z09VQmtzdXJCMnFvM0o3bzVkVld4dXdETHhtcHhkRGtBUkZI?=
 =?utf-8?B?dGoxSkwwdUdHOUdxZUNndTBmWkJqZlJZcC9seFJ6M3JPYmFJYXA4dCt3eFlS?=
 =?utf-8?B?SHNlSWtFNXY2aEd0MklaRjMrTXFMNmhZeHM0bGszeGhMekswek1KSHR1WGI4?=
 =?utf-8?B?U0FIMjQwYlY2UE56ZmN3Yk1TalFxaHh6SjBxTWVsdTUyMGUwQUpkNzdGSTJq?=
 =?utf-8?B?WW1IL3c4NUMwc2tKaHdZZ3dTVDIvVG5wRXVlZGMrUG5CK1p1eWJKdmtwOCt6?=
 =?utf-8?Q?cWXpYxYsLAUZx8jUug84k2adAjZBBv4h6D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 127e8332-810b-4e9d-ac05-08d8b9468914
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:13:07.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFfmHFkTogp/TThTLBaV9zex6izIojDuCciR8b7/OQ3oMvIUNhgOLBNNY2sf5Xks5jRxaeOvqXqajbLJazElcTQ7l55dyCLLZb0ROBhVB6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646
X-OriginatorOrg: citrix.com

On 15/01/2021 10:05, Jan Beulich wrote:
> Rather than open-coding commonly used constructs in yet more places when
> pulling in zstd decompression support (and its xxhash prereq), pull out
> the custom bits into a commonly used header (for the hypervisor build;
> the tool stack and stubdom builds of libxenguest will still remain in
> need of similarly taking care of). For now this is limited to x86, where
> custom logic isn't needed (considering this is going to be used in init
> code only, even using alternatives patching to use MOVBE doesn't seem
> worthwhile).
>
> No change in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Iirc use of include/asm-generic/ was disliked, hence the generic header
> goes into include/xen/.

Really?  I think its going to be the only sane way of fixing up some of
our header tangle.

This series probably isn't the right place to fix this argument, so
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, presumably we're going to want an ARM side of this imminently?

