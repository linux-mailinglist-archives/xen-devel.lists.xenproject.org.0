Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE240413A1A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 20:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191864.341992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSkbd-0001b1-Hh; Tue, 21 Sep 2021 18:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191864.341992; Tue, 21 Sep 2021 18:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSkbd-0001ZH-EP; Tue, 21 Sep 2021 18:35:01 +0000
Received: by outflank-mailman (input) for mailman id 191864;
 Tue, 21 Sep 2021 18:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjZ+=OL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSkbb-0001ZB-Ku
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 18:34:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f51ff89-1b0a-11ec-b91d-12813bfff9fa;
 Tue, 21 Sep 2021 18:34:58 +0000 (UTC)
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
X-Inumbo-ID: 9f51ff89-1b0a-11ec-b91d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632249298;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iItkPCfMhnWf4rVQ+PVkFGSFpt4Aw0qHJg4Hn657cy8=;
  b=KmDkQqdtuOtiZ9k4wn1gMRjmlm7h/M1Smnm/y+dzKmKPgRW0qhUiioFX
   xzJxXtbi3xMU7Zwzwatz4pnPgA4Ep+4kJ9TCZvCMlA7polxleuwG2dWBr
   HuaFvmZk+e5t0E1W+XmWkC+6N+n9CLueiGP7IDGupuq3IuF4aGjcvLruO
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yB2/bV/RSp5kNm/+gJ6v/NZEfHk/xHIOAtXikvThKhlqQqjGxAyvUYpBgH0g7qApK9wxVT/XpY
 PQmo9xdFfyOCXL6PpRKs/SaTqiJ19AvEuZ/f6j43pp56LnatbCsZOxkWAjvVW6EH1VmEF+fJVf
 bMf6XQ51uIWxWXMVAF+1IVD/keOOyqPg6IlRInDngW2iTr3iU6L6SgqTVaWM/bChvxQrmJzYuW
 OuKKR3TYlM2VHl/M48QMf5bDCxXQFtOiPs6R6cKKwnz+T748OABcrDhdCtB3+00iSuh1J1fqW1
 FXSSU4qdo6/AluBMCulhS4Zz
X-SBRS: 5.1
X-MesageID: 53670609
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8v7IwK5NPyLw+UbQ5M6nLQxRtB3AchMFZxGqfqrLsTDasY5as4F+v
 jYdCGiAOPuDYGOmeo1xb9++phhVu5ODz4djHFdsriBgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2Ncw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 I5hvLOyEB8QAvecovg8XQRxLSdDBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTRqiBP
 5RBOFKDajzgeExyEwsoFKs8xr3vhCHjVRYBlHOa8P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/YLP+QV6liV85aOszyFJ2YZZwBHVeVz4afaWgcWO
 k+1c8LBXGI06uTFFy7Fr994vhvpZnNEdjZqiTssCFJfuoi9+tlbYgfnE447eJNZmOEZDt0ZL
 9qilyE4m7xbpsoCzazTEbvv0m/0+8ShouLY4GzqsoOZAuFRP9XNi2+AswGzARN8wGGxFALpg
 ZT8s5LChN3i9LnU/MB3fAnoIIxFGt7faGGM6bKQI3XR32v0oCPyFWyhyBp/OF1oIq45RNMdW
 2eK4Vk5zMYKZBOCNPYrC6rsW5VC5fWxTrzNC6GLBueil7AsLWdrCgk1PhXOt40s+WBx+ZwC1
 WCzK5f0USlCVvQ5k1JbhY41iNcW+8z3/kuKLbjTxBW7y7uOInmTTLYOKlyVae4lqqiDpW3oH
 xx3bKNmEj1TD7/zZDf564kWIQxYJHQ3H8mu+cdWavSCMkxtH2R4U63dxrYoeopEmaVJl7iXo
 iHhCxEAkFev12faLQiqa2x4bO+9V5hIsn9mbzcnOkyl2iZ/bN/3vrsfbZY+YZIu6PdnkaxvV
 /AAdsjZWqZPRz3L9i4zd574qIA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOHl0wAtzXZfSjy0KKkUIcwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuZzQhhaEm3c4erkPCXW5DP+k4pJUeLOdjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vW+FpLXSx1MVSsrFAm+1CsgysV
 0PTotRXNN1l4i8+/IL98Ob9Utm+6A==
IronPort-HdrOrdr: A9a23:yEq0waw//2uU24l13qB/KrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53670609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpx/hpUcdiBkMxcB5GulAYLB64sxjBgdvjzO3Uu5FiO30DzYnH66hJHxm1lx72Nt0DLRWl/zQdToK2urNDstCxXdDuxYR0IfgsFuK+Vd797hmDTNqHzE3atY7HL9+2yAlvgapcy7dR0IXI1PFD06waxryhRAqnVEWt3cusYRSaFXVxdZl4we7uS9s7remhgGN77Qirxxpuyi+PhdYp/mZjaXGzRorFQHkhK/SEYS1eqfHHQH1//CADBsH9XzzG0qq1FKGa4OWYTtu4Mmrosf/MDVMIm5K7q2YdXEMSDnLlGKeVqqfACV55QNsGRdxYEz+mH2UXAdE64AMX8jd/sO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ddGu/6OK1sBG/G8q1B+cUaTB/vRhwOjCZyqPZ/DTBSM=;
 b=ckLfnLtWl8QkZqLmp1hSMWCsZIj5pKtkVL/UE8JwQesLiZsaAu0WqVbCsu4R+Rcdp8oY32TZ/NOMufAl+FNnVkvWJFjXdzX4Vlh8L7HraOvVLNOmxcg/Qe2oiI0Pw642tB5Vc9v6SzpCPOpcDEEBOWp9NvNY21OxrccXRuuihY5aWA3uMfZJVMxDHClNj/AsC7q8+WwU9RiR35s9EbW2VaMKSyetD5KW5DhArm0Pd8XC/l/1VG2j0X7dGDLQpp7UXnn9UQAAEBDxHDuVvkV3hU5ca8FHjkO3GJhzl1+XROzpfFnjmZmXLl7YGcrjpGQejW74+1mXnapruhrha4RvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddGu/6OK1sBG/G8q1B+cUaTB/vRhwOjCZyqPZ/DTBSM=;
 b=CL+DIQUKH2TkVERWo76sxMr2KRxAwOHPLxOEkZby80wQebqpGo+ADHY01jnb5qPxRDyAxMgyAHwrw8QvCQt/hLjMfHWmmK4OQPkAMcmaZLD4HjzddD/NPRshP7HFi9CgAy1FNwt5OzMId+0iJdgndWc1/Xcl48cFprraK1FNngM=
Subject: Re: [PATCH v2 12/12] x86/trace: Clean up trace handling
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-13-andrew.cooper3@citrix.com>
 <f953cc44-3da4-6860-6e55-6a5751c4b3c3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <29cd2906-64cc-3eeb-a487-c71e7d1d0df0@citrix.com>
Date: Tue, 21 Sep 2021 19:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f953cc44-3da4-6860-6e55-6a5751c4b3c3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c7ccb2-b29c-4f4b-a946-08d97d2e8208
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57769205354811DF35422F57BAA19@SJ0PR03MB5776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHMn2aUsEeNtDoTn9INlwZL1Y76RUZP3BX8227MA2e3wwUvrn+TC6I4Kzt42CEk9eFSXEnfDYh2qJs7ZzdLhCPYekreMX6auNFbaiQ4P2iVBqW6exUwim4NTahSWAnlH6B+WVUqh/jocjKKvj/VFK2GRQIQTQzRpAbVuLKaR6ys/qKtrHi4Rfi5wWhqax7XXFg1EGohniW3fUbPgoxklqNwS8XmSpeCmbHfTwdVIbjLB946fL3nW7/htDgKTBnHXt68PLzJ5At+eId1DxHrRt7O8+uWs8jDIAP3d6S3StRXy4WcuzQhxNGLS1DQ4b+9oahEE4grhvpX4ld1bfctqo7YTHW6ozf64pqTEpd+90CZG8bRaHzeVeDnKiU90I4pr50MeaPEiijYnJFGkPCnU7VeoLXVztk4E8d/0lWjBQqv4ZW/fosM1zmeu6p3T5p9fqxlSg8/wlYLHSgoJw1o3I7FAxRsCQ2fquN4YxzaRjFyGRDYtH94yt1qECWhOWeXo4H5eTDNyYFgGybG+Knra7qWppQU/wkyEahn14qUANrsCU7pGL3rJYfDqAvNIlqR9jWTwj1m2eG2AEUMhXva+eoF6MRvvGgDr703Qgu2haauNqKiA0s1KxHou23dS8NMesFV+HmD/cURJPZCGrZnz5Zf/HkM7r3um/NQ7mIeD+Zb3w+DF/iyFI90AC1ZzXl1k387peDpBwvdrVt4tsqovXkj80CBKWVfeAtsVbNYFJBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(186003)(38100700002)(6666004)(53546011)(2616005)(66946007)(31686004)(16576012)(8936002)(31696002)(956004)(54906003)(316002)(4326008)(26005)(66476007)(66556008)(6916009)(5660300002)(86362001)(8676002)(55236004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THA1SUdIb3l2UnBudWlweUpoWjROcDI5Y0FoMGhsQ1djWEEwUk9ZcUdRenhG?=
 =?utf-8?B?UTRNUlFiOHFKbmV5ZmRPaDlBdjFHL203dUJpOVdzdzNMWHRjTThRNVYrZU9O?=
 =?utf-8?B?YUZQSk1DbUZtZllyemFrSW0vUWR3R2d5VTVhSkZya3BVZERxaWFQMEFOMTFq?=
 =?utf-8?B?eUpHYVl1SWF2ZzJ2RkRsSUQ1WVJ6dGlqY0FmMDNaZzBSYnZuemhBdU16YW8r?=
 =?utf-8?B?NS9CVGxHUGVSUVVscWJUeGo2QUFXNWhaR29xbEgwcUNuYzRuYndpK2N6NURF?=
 =?utf-8?B?ZmlDbytCcXhFZGhjS1JPcHN6ZlNyVlNEWHB5TFdpZnhyN0pvMTBNTEJ1T1Fo?=
 =?utf-8?B?RG1uN2ZCeUpoTmhqeU0zdjkxcjNCVHhieG80cVBOQ25Ldm5TbDFhQlRBdkVT?=
 =?utf-8?B?Si81MkpJajd0S2ZMczVqRDRtZU1WMXVMckhFb2k5Mk1MekY4Nzlqc0Vvb0pP?=
 =?utf-8?B?dnVjalJkQVpQVUFHTEVFOVRWTVMwaXdXUHVhdDBGdlpjaHJ6dUhOUHVTL01l?=
 =?utf-8?B?MjR3YWpKVitEb2lmeUt5ZXI2Y2VLaEtVVzcvTkVMTjZoSXBLUmdZU2svb3hC?=
 =?utf-8?B?eXR4VVZYRDNoaGt5c1ZPbmlDQm5sODF0a1Qzd1B3Z29ac2tlK3AzdnJmSHd1?=
 =?utf-8?B?NEhFM2QwR2hKMHZtQ2k1eXN0WlQ2Ty9lSENtUnBHV0ZzZjdUV1lrN3BkdWth?=
 =?utf-8?B?NTQ3M0JCODU2U3ZJU01KakxRV2tsTkNNcUhUWTEyMFRUZlBOZUp1YXhhQzNh?=
 =?utf-8?B?MXlJMG1kMElyWUk2eGRPelVyNEZDbTZIVUZmcnJ2WUhkL09saE9GUjlqSHN2?=
 =?utf-8?B?UDREQ2FlOHV0U0VNOWRoUm8vYkZGQ1h6TmlJenMvNGQ1aDFMWWR5VDk1cmFy?=
 =?utf-8?B?UDRZWGtsRitqY251eXYzVm9RaDR0SU9EN2FBT21nV1VTclJwTDB4TU04N3Vj?=
 =?utf-8?B?SW5kYTdYU3NzRFZSb2dweUtDdFgycjN2bHVoL0NjK25oSGJDY3c4aDBxZmhZ?=
 =?utf-8?B?cjJFTG90bTJRaWlCdjIxblQrRWhZQmdRSHNJR2tHaGNhTHNjaSs4UTdGOVZX?=
 =?utf-8?B?RkJNaXZyeCtSMFJ1V2cxZVZUN1N3R0ozaXdydGlsamZodHhabHhIZFdNSTly?=
 =?utf-8?B?czBsaU1meFplODNWOGdkaWhkdDVuaytVNDVkUm0zRUx5b3ZNZUluVnNCOFpk?=
 =?utf-8?B?VDdRK2FUdHRTMk9QZ2ZrbGpLdmdxalQvZzlwbmJCak1TeHRnRWJ5aFFvWHJI?=
 =?utf-8?B?aGdvYVFKbyt1bWw3RmhwWndWUFFGMmdZd3preGphalhtOEp3UStCK0tUYmhm?=
 =?utf-8?B?OXpid3d4OXdlQ3RqZGQ1cm1tWlk0U2FWOG1acnpjTnZQSTJBMW42N3NvSVB1?=
 =?utf-8?B?SURLR0RQZVkxVWYyT2JuSWdNTGZWKzZ5SExLT0lEWlVwdDFOQnc4anJoS3N1?=
 =?utf-8?B?dzJKUkxJc1ArSU5NT05KMGpJZlB4dVRSN0tEc2ZlelZkWHUwbjR2NlNjTi96?=
 =?utf-8?B?dG9RYjRrZk11UTROWVlqM2FhUFhRU1A4eEdKWERSVVdydjQ3VktFbmF4eGI0?=
 =?utf-8?B?aTVaRDdTQTBZczZrNU9MM1RLMWhMc1QwN25XQVRYcXU4K1lNSmN2Qi9MN2lW?=
 =?utf-8?B?Q2VpUDFCOG5kVkZuWUFBbElqWFNSVnplL1lnUXBqYU5nTlNLcytRQ2RlSExv?=
 =?utf-8?B?cFBVNXlSOTY4RDVJZUpGVy83YnlQYU9PM3RtOGhvMWNESDNZSms3enpTZW5F?=
 =?utf-8?Q?ERTpXhcuxiSBugekgMXpD/fqMy0RMcq32Q1JvWU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c7ccb2-b29c-4f4b-a946-08d97d2e8208
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 18:34:55.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRLylGWPTbm0v+e83K2WxQ1XAyAjdJfKXArJLRJ4EMeyUpFDnKzENsvR5Q7LqUQD2r1/g8DR0MuXPGo+HdpWEMwbqivmtXUqgad8E0IZur8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5776
X-OriginatorOrg: citrix.com

On 21/09/2021 17:08, Jan Beulich wrote:
> On 20.09.2021 19:25, Andrew Cooper wrote:
>> Use more appropriate types.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with a suggestion:
>
>> @@ -48,30 +45,28 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
>>  
>>      if ( is_pv_32bit_vcpu(current) )
>>      {
>> -        struct __packed {
>> -            u32 eip, addr, error_code;
>> -        } d;
>> -
>> -        d.eip = eip;
>> -        d.addr = addr;
>> -        d.error_code = error_code;
>> +        struct {
>> +            uint32_t eip, addr, error_code;
>> +        } d = {
>> +            .eip = eip,
>> +            .addr = addr,
>> +            .error_code = error_code,
>> +        };
>>  
>>          __trace_var(TRC_PV_PAGE_FAULT, 1, sizeof(d), &d);
>>      }
>>      else
>>      {
>>          struct __packed {
>> -            unsigned long eip, addr;
>> -            u32 error_code;
>> -        } d;
>> -        unsigned event;
>> -
>> -        d.eip = eip;
>> -        d.addr = addr;
>> -        d.error_code = error_code;
>> -        event = TRC_PV_PAGE_FAULT;
>> -        event |= TRC_64_FLAG;
>> -        __trace_var(event, 1, sizeof(d), &d);
>> +            uint64_t eip, addr;
> Like you've done in __trace_pv_trap() and __trace_ptwr_emulation(),
> perhaps name the field "rip" here as well?

Fixed.  (Honestly - these all start to blur together given how large the
series is.)

~Andrew

