Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81B35A196
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 16:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107876.206157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUsaG-0004X5-5d; Fri, 09 Apr 2021 14:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107876.206157; Fri, 09 Apr 2021 14:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUsaG-0004Wj-2V; Fri, 09 Apr 2021 14:58:08 +0000
Received: by outflank-mailman (input) for mailman id 107876;
 Fri, 09 Apr 2021 14:58:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3s/Q=JG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUsaE-0004We-L2
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 14:58:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1916a24c-5bbf-4e1e-a7c1-73422f234fad;
 Fri, 09 Apr 2021 14:58:05 +0000 (UTC)
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
X-Inumbo-ID: 1916a24c-5bbf-4e1e-a7c1-73422f234fad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617980284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5TesPVEfyIMY20n/Ccl//SjMUzzd1SZrTSSZmE2LA1o=;
  b=PXKSxwnNyvFqIj7WbCetttRNUnXU++VouLf8SFzdk4B+ASuktPQEl9ME
   ZnW6HF6J2wQ7ZZYfBHLmeoOOelJdbV7JI3bl2Pg2uywsWbQuWCOoRzA3e
   i0Z/CK8N3jlO8DMzs1wXdGgYSvgs36wJlLFq5H7JXLhPiexHlfufVbTKB
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EgmpTbOy8VoD3vEIFTorMw4RqEpo8EPLEWqGPMrZeYQvwXphwFD66zPmm6/pt1VgE32+cZdvDc
 mJdaxp3tGEjlPTqdFHx3C7Kst707n6zpnrpo2o2D4A03mwucaWG1dJW2tkg+BDNN0KSaJNCIqE
 3BclUXEN0Wr15JpQP6tacegSD5aKJPOZYrslKEDl9mjf6A2/BknIh3VKMORo5wJFUR7sI1YDpl
 TsZqUJ1gGoc/W0I4aEqLB4hINEJDFEPlD73l3L6d9AZOXeGbrBRmb8EhOwMCJxs/Uedd30X0Af
 2i8=
X-SBRS: 5.2
X-MesageID: 42742123
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qf5+tqlZ3Obe/R3hKSp/xmT1tmbpDfOej2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW97LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm/m/TgkpX6bRkaQyM94A6Vgj+yrJL8GR6U3hAROgk/vYsK22
 7DjgD/++Gfo+i2oyWsrVP7wrZ3vJ/aytVFDNGRkcR9EFTRoyuheYgJYczmgBkbu+eqgWxa9O
 XkgxBlBMhr7mOUQ2fdm2qT5yDF8BIDr0Dv0kWZh3yLm72LeBsfB9BajYxUNjv1gnBQxO1U66
 5A02KHu5c/N3qp906Rlru4NWAeqmOOrXUviuIVhXBEOLFuE4N5loAD4FhTVK4JASOS0vFWLM
 BVEMre6PxKGGnqFkzxg28H+q3KYl0DWj2CQkQEp/WP1SlXkH1T3yIjtb0it0ZF25QnR5Ze4e
 PYdoxuibFVV8cTKZlwHeEbXKKMeyPwaCOJFFjXDUXsFakBNX6Ig5nr4I8t7OXvXJAT1pM9lL
 nITVswjx99R2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCyqUjkV4oidisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXAWUCUfcSps0wVzu104L2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gFwVusXlP+nRjNS1LgckHy5vtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7AL6PqNL+mUCGuULzq0l5MBtUCUhYpJ/6VWlRmAMMO0ToNZIKu9CVf3FuzGKKTyUPCP/+IU
 p6nRBa6Ki3J5ufyWQJENS8KF+XiHMVuTasQ4oDnLaAoePoYIkxAJpjeKEZL3SLKzVF3SJR7E
 tTYg4NQUHSUhn0j7++sZASDObDM/9mgAmqJsZQgWnFtVqVoPwuQndzZU/tbeenxSIVAxZEjF
 x49KESxJCanyy0FGc5iOMkdGFXZH+vG7JABgSdbIBykrTmETsAC1uitHi/sVUea2Dq/0Idii
 jEITePcf/GOFZbp0tVy73n6l9ya2WbcX9hc3wSi/wOKU32/lJIlcObbKu61GWcLmEPxewQKx
 npSzofKAEG/aH86Del3BK5UVk2zJQnOeLQSIk5e7bIw3W3NcmjjqcdBcJZ+55jKfHjuuIGSv
 ikZgeQNT/0YtlZgjC9lzIAAm1ZuXMkmfTn1FnZ92C+xmc4GueXD1J8Rb0XSuvsplTMdrKt6t
 Fegt00t+frbTm0Rd6C1K3NbzlMbjnUunW7Suk0qZZS+YI+3YEDaKXzYH/t7jVg2h57EeLf0G
 U5a45/6KraOoBuc9cJEhgptWYBpZCqFg8TrgfyAuUCZlkjgH/QAsOR79Pz2M4SK3zEgDG1BE
 KW/CJc9crURiev1bYVDKQrPGRdAXJMnkhKzaend4fKDh+tePwG1F2mMmWleLs1ctnJJZwg6j
 J76cqPhemZam7R3x3RpyJyJuZr/3y8Sc2/RCKKFuggya33BX28xo+r6tW0ljH5VH+SbFkZn5
 RMcQgoVft44wNSxLEf42yVUaz4okUsjltY73VGrzfWq/abyVaeO1pHPw3fiohRRh9JPBGz/J
 z4zdQ=
X-IronPort-AV: E=Sophos;i="5.82,209,1613451600"; 
   d="scan'208";a="42742123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcC0aiq/Afy8sa+5A9ZQVSh9tVPe6B3H0EC6SkEptix8lrmZ9QkpHjhAWxc79uJMUoZn3n0r1pp7bX+dhFzWaOECR5eEHLBWeL87vEIDQdOvcAzx6CnoO+n1zefe2KZveRCC7ZEaz3Kbt7y2SQOffU9zLY2KDbFiXQoiVrY4I5EsKk1vGArKacNJ5617oVGHIGBx1lKOg/Eaa751NQXmtVN+eu3ZZxr5CjnlJwijocuPMBOaNEe9kNudXYmnmU1o0HKsK63aBPLgiumKcuUf5MXZfLqM058n0ymaztKN33f5JYTqxAKOUPKR9ReTtdFSGEi5vRP2JBhfdzbXu+yaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9WRBmYTvksjqNonn09d22qOKyvhqKGeCO6Lvj4/rbs=;
 b=nUuaAncFY8FMELWsncAEzMeHZ641owjH0iIWfdFumnNPAW/6ssGVxOs8KLpBv+lQCA2Rlw9YnHKuUpdn0V8oDohxye2qyB6opa3+QoKGBdEZeSPKZ9EDMmSvHFtWQ2657ZR0nenvgDlxiHLks2IX6ESxIxb2iHbnPpHjnrNrFwnf5f9BNRqFOS49xPmWQhYwL7AZQ+EcaGr1499n/Z/6H4Q+XH/291b2fhMP5CYUctNUd4OdW3UdsfJNyW1D8ilTbA7Qwp/Q2BaYdNi35vr0RqVpVtNJl+R5mkaVCQrKiBVFEhZ37muAHzPjjBftll/mU+A4P1ZnddDzy3RO0GXK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9WRBmYTvksjqNonn09d22qOKyvhqKGeCO6Lvj4/rbs=;
 b=O2mLFQPeqC1gtmW6JkQhCU1f7rUi2adh0ddEoQfcnPrkegQEwWRj7/72EZDsfUDdRZpOX3+cXNF1iDWofXno1iaVWZXgLQGB+vL86lb1O+F77iO3b/Gjm6KStDw9W0zEaGiTImbAnJ7mIpE8kygA9vOh4KDKJjHh+xuWmxN3HLo=
Date: Fri, 9 Apr 2021 16:57:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 20/21] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
Message-ID: <YHBrc02NGO6VmOnZ@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-21-roger.pau@citrix.com>
 <f344e7aa-90c5-45ce-56be-9fae24f1e83e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f344e7aa-90c5-45ce-56be-9fae24f1e83e@citrix.com>
X-ClientProxiedBy: MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30)
 To SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a8a871-952b-4dc8-334d-08d8fb67debc
X-MS-TrafficTypeDiagnostic: SA0PR03MB5643:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5643DC3803121FE461CBBE378F739@SA0PR03MB5643.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWpTtBQnINIR8ORGa93HHXMSkbHHiTxsegXVmBWoB2TG+kxe/vfA5VFQbev2TZqImrOQYnMvvw82rUPB0GWKwCPUAwWbiZif90BNut3qL9O0JvbfK7Dz0KH5wJ+xJM/Kc1/0cPJ8KWTRq+BmLQD3BHnulraZfs9OZaqeq/MZuQUMbgY8o00TH460Q/3iwngo1WZxE6IVdtojm1sAWhS4CmkrLwgsKAvowpRtbkvgSrT514GLyO3aZRCcXSu/fntrF5lFLwmQrMSpLEDDvNm1QMYF2GZ8KcRzernXP+FmEFLV9I+sfbha3V8BKWTygoj9ZbR5r/g/RU5qtmJGEuCftbVdYoiQ4SZcGnj/wB3YvctEZpdw4UQoKnwzCPkPtoXw0uZKrc1l+pQ/3x6C29lwU7hh8JLXFzr6H1CGPohATGKbpqiFHLXtKyCnHQA2jAOvjCG3RWK8GKiy6dIqoHiitNUble1UgBzG29KP48gS+Qu+tNrzTFv5NwDXeVn0FjYjal/0Z2WnBeRsbhwmrJ++rXO95SItjKd9vtcoqAC3gtuzn25zN1w4rsOIwnOf/FkmCmSfWlfSpMe/OUJanPXNWy6ecWe9etGW90fwG5PXN6amZbJYeO+aWKLDYXD0fKsvEIqlBc6MIhsCVX7ISGrNU7XyepydlOosBc0YoQx4r8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(5660300002)(107886003)(53546011)(38100700001)(66946007)(4326008)(33716001)(6862004)(8676002)(85182001)(8936002)(16526019)(186003)(9686003)(66556008)(66476007)(6666004)(6486002)(478600001)(6636002)(956004)(6496006)(26005)(2906002)(54906003)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUo5eU1MbDJMUC9JZTR3MDNMcXREZU5xUDI2Z0xtdUVnNXlqcGsvOXF4NWF2?=
 =?utf-8?B?bkxEZUFzd0pXV0VyVW9PelVsY0ZPdmZZamN1TGhwWlRLWXBVNG52ZWRNVWM0?=
 =?utf-8?B?ekRiSjBTOTVnaTRRT29yWEtUY2xVVVNDOGwvaEIxcGtxaHFiYndHeWdHQ1lp?=
 =?utf-8?B?RmpmSnpsaitCNkVpWlRvQm9rZTlMckRvVHZwczRoNnFIOFBsdTcvdVJPU25S?=
 =?utf-8?B?aml0Z0ZJd3haalFHdWZJRnI1NHlJSmlSZGJJaGtpZ3JOS1dvK0ltUGdRRlhk?=
 =?utf-8?B?cGFNS0JhMUl1d3RzZlkzbXdBVWV3ei8xY3Y2dC9qdm9TS2MzNE5rVzZvTkpu?=
 =?utf-8?B?VmhRSlUwNGd2UE5SZUVySHdEdkRRR1hzdzFIS1pVclNhb3ozSTIxdUFuQjJJ?=
 =?utf-8?B?ZTFLb01OSlp3aS94cUI0dzliTlVJUWZja3RVV2VpanVFUkNjZVM1Z3k4Ym9D?=
 =?utf-8?B?THZSZTMrS1doQkN6d1ZKazBOWnVGTmJuR0hoaXV3Z1RWQ3U0ZlhqR2RERkla?=
 =?utf-8?B?S2lZYXhabmxkWGxta3EyRHZCclpiRTlrWFBaUk4vb0xZS3hpUUtVTUh3R1g0?=
 =?utf-8?B?SVhiM0o0VHFtTEN1QmtiMUo1SnhMc3c0djNXVW9tS1FBNE4wNHZKb25HcEdT?=
 =?utf-8?B?c2VpUFhwakNBTGZ6dUViZTRxQjhFVUJkOEJsVW4zOURRNkVtclIrMDVoOEMz?=
 =?utf-8?B?UHF1K25sL2NxbHQrSzNKYXEyZmJ1SnB2aGNseENCWmZ0RXl2b05tNmh5d0o0?=
 =?utf-8?B?dXJVSEtjMHdqNS9ybndhbTNUVG5neDd2WkZEcXhMTlZtb1VsaCtKNUVjR21P?=
 =?utf-8?B?cVZhejBMeUVVMTFOQXFSSm5UMHpCUkdDZFU5bk1naGZpM3U2YmN0d1ByVkVL?=
 =?utf-8?B?STJWRzhvNnlkN0ZwSFZ0c0pBMmRCazV3Y0ZDK1o1d1FienVXSU85clROZHNR?=
 =?utf-8?B?NWhnaXNLYVF6cHhBbTIrbllUbWtmb1Z2QnAyRHRwd0Myc3hYT1R4TXkzK0xY?=
 =?utf-8?B?eW9ERGVuVXozQUwyRStvN1pHdG43QWVXL2JKTWN1ZUM2dnNMK1p5NGZJaVpz?=
 =?utf-8?B?Y3BNNTFpS1VOa0IraWxiMVlRWFB3Um5NRHFPYzdGK0djenNhM2ovd3VaQmI2?=
 =?utf-8?B?NGN5T083RVRqZ2FzcElJWWVxRU9oVHFSMkFrZmxndHJFcWpaeFZUMTM3bXRW?=
 =?utf-8?B?WTdwWkhLTkhWbys3YWtjRGZjT3lBQWRjZEhEajFjb3J0WTFiVkVaSXJwY1By?=
 =?utf-8?B?UE5RT1FSaUZWU1VlNnlMYzdKUE5wbmlRaHRyZ3NIZEVVY1pqU2dyUnR5eGxj?=
 =?utf-8?B?bEp2ekVFMEtyQnBJVFJMTjExbi9sSlFORVhEeVVXalFIeENGMGl2YTlSTlkx?=
 =?utf-8?B?ZExIc1BFNTE5aHMwdlFHdHNrUGJCaDhpWDh4YitCL0tNRVZYLzZzUHFxZE9J?=
 =?utf-8?B?ZStmRzdtSzlZWUJpTGY5MCt4RmJWYlQzTGNQVVFHUkN6TUVpUmhhdTRZcXlG?=
 =?utf-8?B?eHprZThwcXloUHdlSXpuekRGd1h0N003WldTTFRuaTRHaTlLakc2Z1hZL0ZP?=
 =?utf-8?B?eUdpQmJtbnJlaWJPWnBabmd2YjNrVE5oakh2cGJhNVZJMkEyc3Qzb0pINmxI?=
 =?utf-8?B?a1ptZUdXY3BoWW10cld4RVo4cUZNVUF2SHhmWWg4dDMwSTlUWEhwb2VZUyt5?=
 =?utf-8?B?SUQ2YU9uVWV2MlF2NCt1ZFlTcXhHZ2lxcW5nUkJjckxiS1pSWVN4UlRBZFI4?=
 =?utf-8?Q?GKGPLHxvnccZ5EqlHr0Xofcbw2KOe1I4/i9znv9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a8a871-952b-4dc8-334d-08d8fb67debc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 14:58:01.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9MTP5Lz4cEOji0H0ywUbUa6OLITx8oUGwc9+TkKITtIqW/TI3Il1sLj8uzwRPMCUbyziGODRWIEeb3rEF3+WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5643
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 06:44:02PM +0100, Andrew Cooper wrote:
> On 23/03/2021 09:58, Roger Pau Monne wrote:
> > With the addition of the xc_cpu_policy_* now libxl can have better
> > control over the cpu policy, this allows removing the
> > xc_cpuid_apply_policy function and instead coding the required bits by
> > libxl in libxl__cpuid_legacy directly.
> >
> > Remove xc_cpuid_apply_policy.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm unsure why this is called libxl__cpuid_legacy, mostly because I
> > don't seem to be able to spot a libxl__cpuid (ie: non-legacy version).
> > Should this be renamed to libxl__cpuid?
> >
> > 1b3cec69bf300e012a mentions the process of switching to a new cpuid
> > interface, but I'm not sure we need to keep libxl__cpuid_legacy, since
> > that's an internal interface that's not exposed to libxl clients
> > anyway.
> 
> "legacy" was referring to the pre-4.14 migrate-in problem.  It was the
> best I could come up with without having a firm plan of how this series
> was going to look like.
> 
> That said, the resulting function is still very definitely doing thing's
> I'd consider "legacy", so perhaps it wants to stay named like this until
> we've got a better plan for how to enable non-trivial features.

I don't have a strong opinion either way, but as said this is an
internal libxl function, so naming it libxl__cpuid or some such and go
expanding it as required would be perfectly fine IMO, even if the
current parameters are going to change as part of expanding it.

In any case we would not have a libxl__cpuid_legacy and a libxl__cpuid
at the same time in libxl, as those are internal helpers so at some
point when we are happy with the logic in there the _legacy suffix
would just be dropped.

Thanks, Roger.

