Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE683583F2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107318.205161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUEN-0000Lj-NG; Thu, 08 Apr 2021 12:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107318.205161; Thu, 08 Apr 2021 12:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUEN-0000LI-I9; Thu, 08 Apr 2021 12:57:55 +0000
Received: by outflank-mailman (input) for mailman id 107318;
 Thu, 08 Apr 2021 12:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7yC=JF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lUUEM-0000LD-J9
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:57:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cbe31c9-bde3-4ee0-8e01-3ab0569b5cfa;
 Thu, 08 Apr 2021 12:57:52 +0000 (UTC)
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
X-Inumbo-ID: 8cbe31c9-bde3-4ee0-8e01-3ab0569b5cfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617886672;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R4xVG+9MFsOKftN253u73h97zGAl4zaT+SLmdHOHDR4=;
  b=E0t3XrgOuaxJcxtqUNQlOoqnXXKlWNgHL7hOOCrofKAn1vByzxddtkpv
   96bL8vWIkcC3nXkXcANV6sLrkGn2mNbPoOrPImjeNHR1kJyQrrMbqaThd
   73iHD0Olo4aYnkLKLkn7G5q/mnyfWRuIX8K3PXpwL+F08FP7nMhRh+3V3
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BA2Ilrn0VCn/uUt+AqwKRhylBaQDtJ9m74pwSlrXFoBMdUo3LjyCcCt3hNI0ez14AKBsfPz04w
 0RniCZccdj1ZyzCu2BRTEJNG3cPzvD93kuQFqIMMoJ5V5lpFCC4fZT/dKdxD9nvrv5L3tbJKeL
 jMJtMRUSU8OPHYazppyHigwQ/UgChVgbuLi1J7oEgwbEUIFftXBfbOTPhPc/iBIO0+lL1DHwdB
 fvVqfv35+7g2Tc0pYIu/Vgb6N4uKsn89j7ag7CiN+3LXPXaknZJNsBeu/aYu7EZM1Fb6YUrj/s
 gu4=
X-SBRS: 5.2
X-MesageID: 41289025
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:unuoaK0ce2DUpEw6WAMLygqjBR13eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdnFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFSnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq591s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrCk2N9qdzqhHhXkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBraPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwLzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbXuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hv56fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsQun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDI1bCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob657/WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRq+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8EUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8Jxe4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qikWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+DDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 6i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregQTmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/9sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6X4Noh95+jFollnkx4ig7iP6JCh9QHzkq6QTeyJSPHiOhd
 nC6s6C2h3GkWN45aU=
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41289025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK/XWxJGqbq+djVv6o/4VI46Xq7rVKDVOrvxqUDaT1hsKnknPyhOM1WO1/roQwdLebCeAs19TKjvgmxxQ9OMcopdrCIv/OwTI6nmMYl8408qvdAJk90ry2sphN3Wb+grCSGaRv1ilPmhjg8qNnG3y+CGs/CtlNc8LEv3tQOV8HiEFBl5Z3NL65t7hr5frMhG6WRvHjuNfH/nnyOj4wA/ULkKfw8YimE5UL92yCQHl3XcPoi1BvRdYJVMiBSN/jFfCfGtF+mL/5QkGlSNtYjmROZU/jMVAMzN2pFGC21Q0OQFJVgl61pxHNYDdNZ5Z5suFBCSdNZWzIe6v2BbGfVaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4xVG+9MFsOKftN253u73h97zGAl4zaT+SLmdHOHDR4=;
 b=mLo19NM1EpwG5Jsz21ZCqBxvofEHGq5fXGkzc74ofUskcARfRU+RwTeCr8Z467MJ4WmdAKxFpSlBXcz8DT/3SeU8Z/VdAyP35OOTPG5BjQNQ+5oBUrQtvkksIOHIIINS9Ffw4EpzP2ysuk2EDz0Aj9abZRT0h2J7Atd/PSJvcF28U2Cy91XH9BMTlEpXRlo+ZZid2FimfjgTWzCLFWgUKfbkrsE724xHvpgiGnYS7Jq4VtZcIJXjd9eA8M8qxhxBjQrWZtmPcc+08hgmLq9wAAPxWQ3apNHaXUmugMhuCKE6DmUPxkvCr5RjOr/CTj6+NO5xqSQDzd4lxpY6dmYj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4xVG+9MFsOKftN253u73h97zGAl4zaT+SLmdHOHDR4=;
 b=DYzM5jdZZXwu4hrIRQ8FaTcxeF6qQizJWJLlmb1DRu+Zn9ybEIQ0S6+21B6Kiio125HCeqGxnjIJnrdrsJgqudfsW2reIL0XSnkzFFfxcR/04aCJZWvWuUq9oPZw7NmruJjRn5dPG+W33P+GXMl/YQmRbZjXMaG1HdyexXoZxis=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/11] assorted replacement of x[mz]alloc_bytes()
Message-ID: <bdb17131-2184-d8b8-a1a2-37525af02807@citrix.com>
Date: Thu, 8 Apr 2021 13:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::28) To DM6PR03MB3627.namprd03.prod.outlook.com
 (2603:10b6:5:ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a2042e4-b4c9-4a80-657f-08d8fa8de985
X-MS-TrafficTypeDiagnostic: DM4PR03MB6032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60320A84AC3FCEBAB5F8FB4ABA749@DM4PR03MB6032.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BG+4I0OR7GQCwHQ4uIIGM3JWMBeWx51xh8csFkgs3H/UBkxThog5UMUF0WOIdq0DcPnmu2ZiJPKVz3B/WWIQGjtXGzE3N5QHZWetk+LbxVzfkx00ItWiBD1w7sLyvZn41wFPzL56Cm0MIln1Haf2gCiW8+vmuK/OJ31F1NWXSG27I3x0Hz21QuijCSjEvxDRsNnrtvNmykQG8cnXCJJJl0ARdhKVr6w1kw3oD0Q+xi8syp2mL0agxe6ukEW+dOm+vi7AWGJce9mUGQbk9cfrOJ/NZAaUetfuWzdDIOMssESntUvN9rz/YtUDhTX2Yn2XeY7ls3uW1zIBH90K6eVA8MLOFVr34fQ4ZbC9KcbOVcC0aTV2y30MP55yHEByboxjJnwKJq6vvqp4S7wmkRvp8M1Ipsy5JWe6Ys+cIu1Ct2zA+8olcf7DvI2Mc9Ny90x2RC3oYwMM5Jqp7cHSEWsQ0zE638ATTuFKDqou+27tofHgtwxc2opQmULC28yh63qYfPEcGO1BBAWqsSvSblHMNXN5ZM5ZHRrcz0KO8FvAf7mzOGXSAui1R6Xrk/CXWczogw/e/RA4MGRXWkjnoF24TzwKsfVEu6hIUE+TvODdz/DamBcSxyH3SEpG8qmmJN/z/GvAVCbD/Uwp/w0AS2bwrdnpp1YQYPTKMmiw/QDmtU2A1vcn9WLw3aOVcE4TuTRT+gM2jSSkNGToHku8ZciPlHvpZitmFmC4hAuU1+bHI1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3627.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(8936002)(6666004)(66556008)(83380400001)(107886003)(54906003)(4326008)(956004)(110136005)(5660300002)(2616005)(16576012)(316002)(53546011)(26005)(8676002)(31686004)(16526019)(66946007)(86362001)(478600001)(186003)(38100700001)(6486002)(2906002)(36756003)(31696002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmtrOC96b2liMTl1RnVsZWhVdGw1NFYyUlNZcnBjN0lyUVN3QnhLaHljdjd2?=
 =?utf-8?B?bnZ1QlFWM25LQ0M2MUZIU3B2ZWxmZk9MUExOVEIrVEJGbTlrQ1FNVmpqU0d1?=
 =?utf-8?B?aEdkS050VDlZUGtpZitnYkZER3p2VW01VTJFclQxdU83Y1VON1dtT0QrUVMy?=
 =?utf-8?B?dmZRSis4MUFLVGwrWWNYdG13RkdMY0JGVmR3b2lOeVZQWFg3emlMQ1dqVmhQ?=
 =?utf-8?B?c2NJU1V1YzNpV1lhUkdFWUhkUmhXRWJOMGg2Mjc0UVczSWVyMHpaUldHYlE0?=
 =?utf-8?B?VDAwRE03QzY2dzd6cWdxU3lrdHdGVnpWMExiYkdXdkc1b0ExWkZ0QnBuaDdr?=
 =?utf-8?B?RHhlTzRmMVlwUnpGWVFtY3oyMU52T3pKeHRLNS9laXA5VkpYSUdqN3ZYWkQ0?=
 =?utf-8?B?RFdzaTJsamlqbkNZM0tGSE1KbnpIcGxZNVJKckdaNE5QOExzUjIyVGltc29S?=
 =?utf-8?B?NE9oR1R0L1VWTnZqdFZXK09ucnVLMm50MUtkSEdvQXFVaW5qWFM1Y2Z6SDJh?=
 =?utf-8?B?TUY0OWR1ZkRrdTVDWlE4YzZSVEUzeUJ0YXdvM0hWeDZTM3NScFl1UG9ZbTBO?=
 =?utf-8?B?aDdrRFl5MWw5SWZSNVNBUDA3OENZdXpVNEVEYUJoYmpMS2FJSG9uRW02YjR3?=
 =?utf-8?B?ZWxTY21WcDdIekcycjJlaEZhUGRISXJ5UkN1emgwUnM4ZjI3NHNOeHgzc3Ba?=
 =?utf-8?B?RjBqNGxaMkRFSk02M0lROTA1aGRxbE51MU0vYWFCTlVKUVRCUnJpd0FkVm5z?=
 =?utf-8?B?ckFDMUttZXI2SHlvT2JQc0ZuNHN0TldXRzhQM1QvMWo2WDVlVFlmQzl0cGEy?=
 =?utf-8?B?Vy9VNzRkdFlLeEZpZmlKZFRxRU9JOGJlQWt4RUhSTktzaC9RUUpwTGNDcnlm?=
 =?utf-8?B?RGlBbVpPSjhudmxsZU5yK2ZEcmtSQlVEc3NuTDJ0QUhaSEt4aHdJTWk1U21P?=
 =?utf-8?B?b3IrWEhhZTBld2t5QnVQeFpuZVVseG9GSC9lMkx0dFVVVzI3VjFtMC9XMm9j?=
 =?utf-8?B?WDJUM3dnZXEzTlpqY1ZtbHVXRkl2cktKSXFUcEJhQmIrcXdZMFVUYlFIWThH?=
 =?utf-8?B?MlE5dWxIcTdBUmpob3VSVjZhU2x5MmtXZVMwVTlMUC9zbDluRnNiRHBaVzNl?=
 =?utf-8?B?QjNqV2lBd0w3U0RaVWdlUG45NEZWcVR4MllxY0dFdEhSWHEwUWZKa1FkWHNh?=
 =?utf-8?B?VVZGK1hVb2NiZzdyUWxkZTlVQUxER1Y0cDExQnJFV1QzaDRKUFJMQkhKQTY4?=
 =?utf-8?B?clhDVWc2TDRnRTlHemFVQUE1eHJFNEQxY25Yai8zVGdSZHBwM285ZWJGWXdk?=
 =?utf-8?B?OEpSdkdhaG9hOG9Scm9IWHdzNkFXWUNnNEVOU016eXlsYjNhTkxNdGl5bDF5?=
 =?utf-8?B?NEllQ05CVWpDYnRjV2tzcjV5ZEVoY0hTZDZHaC9qUEdCWVFJWWNIdWd5RVE0?=
 =?utf-8?B?dzJFTGFzSTBzWFdRd3FKZ21VRTVSVW05WmtnMHNkS2kwZWdBQUUvUXRhZmJV?=
 =?utf-8?B?a3pvRElRV0hodWZkRENBSmhzWkx4dUhmdGxjTUdMSm9JVnBhTHFxT09oNFcy?=
 =?utf-8?B?RWFhSzhQMTZ6YXRTYmJHOVFmUTdmVzVkM0RsNzV0SWhIWkM0clY4blFPbkxB?=
 =?utf-8?B?Sm5yTGtGL3g3Z0VUWVBnblBGQnRCQTljTWF1a3B4MWw0Y25XT2EycGNPU0pL?=
 =?utf-8?B?czdmb0pyczQxemRnTlBnRHNPU1FvQng5UmFic3c5V2hLQVg0QU51dXFpM0Z5?=
 =?utf-8?Q?+phmgz4S859HHZpEbJvlcLbrKK/KUfke8CSFTRu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2042e4-b4c9-4a80-657f-08d8fa8de985
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3627.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:57:48.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY8UWG66W0BKGG4jtZSL2hZI0X5qnsxekc07fDR3lsWajd96L0hpXff/TqxGFeqf7Rvx569aLoJX7FpuSi/wTLCLeWkQEgxVSNB2T30ScbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032
X-OriginatorOrg: citrix.com

On 08/04/2021 13:13, Jan Beulich wrote:
> In the long run I think we want to do away with these type-unsafe
> interfaces, the more that they also request (typically) excess
> alignment. This series of entirely independent patches is
> eliminating the instances where it's relatively clear that they're
> not just "blob" allocations.
>
>
> 03: x86/MCE: avoid effectively open-coding xmalloc_array()
> 04: x86/HVM: avoid effectively open-coding xmalloc_array()
> 05: x86/oprofile: avoid effectively open-coding xmalloc_array()
> 06: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
> 07: EFI/runtime: avoid effectively open-coding xmalloc_array()
> 08: hypfs: avoid effectively open-coding xzalloc_array()
> 10: video/lfb: avoid effectively open-coding xzalloc_array()

The flex conversions are fine, but I am unconvinced by argument for
interchanging array() and bytes().

The cacheline size is 64 bytes, and the minimum allocation size is 16,
plus a bhdr overhead of 32 bytes, so you're already at most of a
cacheline for a nominally-zero sized allocation.

There can however be a severe penalty from cacheline sharing, which is
why the bytes() form does have a minimum alignment.=C2=A0 There is one
xmalloc heap shared across the entire system, so you've got no idea what
might be sharing the same cache line for sub-line allocations.

We should not support sub-line allocations IMO.=C2=A0 The savings is a
handful of bytes at best, and some horrible performance cliffs to
avoid.=C2=A0 People running virtualisation are not going to be ram
constrained to the order of a few bytes.

For small allocations which don't require specific alignment, then
putting bhdr and the allocation in the same line is fine (if we don't do
this already), but we shouldn't be in the position of having two bhdr's
in the same cache line, even if there are plenty of single-byte
allocations in the theoretical worst case.

~Andrew


