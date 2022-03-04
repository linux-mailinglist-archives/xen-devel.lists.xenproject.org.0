Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9034CD0FA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 10:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284094.483241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ49Y-0003h5-TB; Fri, 04 Mar 2022 09:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284094.483241; Fri, 04 Mar 2022 09:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ49Y-0003dx-Oz; Fri, 04 Mar 2022 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 284094;
 Fri, 04 Mar 2022 09:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ49W-0003dr-T6
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 09:23:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3cf25d0-9b9c-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 10:23:09 +0100 (CET)
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
X-Inumbo-ID: b3cf25d0-9b9c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646385789;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=utifmjU8b8bW1lzd7Q7rZ7iu62wS1uCpyhuEv93x8Gg=;
  b=AP2XWZHQyFHUUQmG9CO0LBIpDFEmuhjHGnMLzKzN27lvzvUVO5tnN4Xn
   GuPbqAojYMB5mqxvdxcRt2LPkI+LPOmvHJ4Ah5lQ6RMg/PvtT19y8Gccw
   p/9U7OxF+s4lkI7WudfuhIYX7azXolP1oVTUyXYp8rNAIZjoYfMhoDs3i
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65392345
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vMlueqBvZXWBoRVW/z/jw5YqxClBgxIJ4kV8jS/XYbTApGki1zZWz
 2QdCmnSbvyLMGb0KtlzOY+19U9VuJKEn9FjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhsy
 ehSm5rzFD0sGf3Rg7k2bRAfNT1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWxh3JsSQJ4yY
 eIASDZtVjuQSCdzEUwKBagmtqSsn1fwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGOFgwEyXZkNKegduByWl4Hq6kG/GkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtzxor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/I9sLumAlfBk1aa7onAMFh
 meJ42u9A7cJYROXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRk0QPCLClO3KPmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcCoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:RhTLxa6c9puosos6UwPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,154,1643691600"; 
   d="scan'208";a="65392345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJEF9+lJQxdofce0EGFy7mw+Ew+AOgD0i4+KPJNzFyw2VS3fH0CKv7GU5HEp3sYyoUE1dXCgz53ffFrDck2HHikSrFegXYguARpUPOOv69yIiqD1wKjGsnVjr5c4n/xqL+Umca+nknGOwMEj1GdcL/tkpWOpu8J42zG7w1cTkjuHG+enVlW5xqdZIoOAufazta7/lI4NLNIQ1s9gZb+qNArBBi0FYb9x7S2s4wvL5wD9mLtK2LtDbTyYwc/NlRiMX+VFLbEZ2sipGM/BNG85jDA7zSjWfyV0wBHkZMYoc2aH6d7O3fen8xEfmnhglWMn1t/k3Ek1RCua9gX5s4G6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULCRxBn4E4+Y6hs+knTA/7HPwqhGArPhRyYKyp8W8Qc=;
 b=BrJo8EdAdfb72pOnRHf/cqXLQXbv2JZXvqXaNasMw/arBh5LBsoCnWmyeq5mnX1dKXFT1Qu/3wpgV5+pIlhrp2quID4lMb2Z6ofAREfY+a/Bv75VLVyvInw5IsbYa0MmBnhHjRUl9+JqtTB7xp2d+C4KTfZ6P6oort8XQNECQIMURmvvnGBxwW5Rzc0cDMoI6yeMfcvb2IagkAkVTQJ29cUotSTrvcXio1z7V8Y8vqRkjqNqp2w0QwyeDBpvzF3nuagvWVv0CLvrETerRJcTxmF7Ve+JOb/RDJtjQxuc8VwCybLHJxp2RBX7ngj27TLXiItlifn5EImZWoHB+52QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULCRxBn4E4+Y6hs+knTA/7HPwqhGArPhRyYKyp8W8Qc=;
 b=M1zctQgVFG7N5VvDEvTsy+7wwAYREAFIwZTNsxpIdHVpfDaNx9RVI/w1Cy6+FlbOfhD7rAf/BB00mKwsP6NGsVgB47YnJD0mdR7QUu3jojGOvoaifrUdJSYnp/9clCco2xRDPYck3L6U7JihhZfVTSl/NTxcUcYX4TkoiJf4w8M=
Date: Fri, 4 Mar 2022 10:22:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: also discard .fini_array in linker script
Message-ID: <YiHabhxABDN2tyxZ@Air-de-Roger>
References: <2a9061de-3d68-20f7-75b9-b1b9491342f8@suse.com>
 <YiHUgkdkp4NFW4Lz@Air-de-Roger>
 <a4bbfb15-1771-3083-74e2-141c219666ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4bbfb15-1771-3083-74e2-141c219666ba@suse.com>
X-ClientProxiedBy: PR0P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62357b3-bff3-4c62-775b-08d9fdc092b2
X-MS-TrafficTypeDiagnostic: SA0PR03MB5449:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB54496A9AAABBBF729CF86E2F8F059@SA0PR03MB5449.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2QJcdZeIyO/N1opwTmECIIFMbvRpEC6PH9/1+9N89e5HjTgjmLqNbyu7zUretqfo/duStcwfrljAXzcgER/E11rTYwLYBHN3fzeENeyj7q//6SHjWCoast2qC8A2XsLJDbXcgjKcA7KzqGX5iw5UFzM5V6pTuzW9yVzBtOCmNiIaaZeiS8KKFG90blicuTqWzVDVDH6SjIfDyDy9l2LQ+py5J6rsI/M0DM23aHC+7IVCgLUPflMvQmk9qGemoY/58xU6v9UrAaeiW+3nGdkIc/kEys3KtCm98TMUUUvGhQd/5ORy2SCjx4ugN8Wjz02NAxQ2ObQ6gBmQwasFz7qmyKy5WPu2cD94Q9IZEqDW6EqEscNOz2NooXVr5zFzV6GFm/KOG4qFwToQx3Kf+VW27pbpRfY7zrIS4UXdfwOyqQe555cbQJjeUvwI8Bn5CbgWapPESWcxAW5Y+4tA9IFEm8MNBU0suYtlSB7qStgUrpbcHYFYrfPoMa5ULcZ+eZKTDNQYJ8T8mjwcY6aXwzLHV2l4D9+uidQ/kFWchqwQ6YpA36qdGXSDA3kVDSoWZRgwA6Z6Jm+5yLQJ1Lav4v9U1Oa/9kJi5QbBDPsn5wWS4ondrGTRXnncl9CzEeyRvI6PSz60ZKMbkmlxg6LO+agGlqAg4+rEQeLEcRQ1/IVI7Z5EAAFVd0ZPLuXwCD5hGxoTKt0Ee7c/gldNA9uACGY6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(316002)(5660300002)(6916009)(54906003)(82960400001)(6512007)(186003)(9686003)(26005)(53546011)(6666004)(6506007)(85182001)(6486002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(86362001)(508600001)(2906002)(33716001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhqM1piazNyZUlxM2laZFJPK0hET2M4ZTI5a29VSW16aHdwaFZBMkROc3pL?=
 =?utf-8?B?dmMwSGJmSlNCdENXK2grWWRiTk1mUlVzZlA5TUR3NkROOHFnWHVUYm9aK1Ft?=
 =?utf-8?B?cFdQRHhvL2JmQlM5em9iQjhUVWJoczRuWC9Ha1lUdXpnTGVMMC9YUEpRcjR6?=
 =?utf-8?B?Z1NMUnZJbVEzdmMxUTd2dWJZcldIWXJOUzlhcGFYcWlLdEwwWXZNaUdrTjBq?=
 =?utf-8?B?dnE1Z0tXMnFLNG5LRHNRc2xEZ0VBZU4vZzJ3dlJVMG1iTHRIN1FVSFBVcVVx?=
 =?utf-8?B?bUdZbkN0TXM0eUMvU1doWlhTT0ZHeFA2NlVzekVXWTBqMmcwRVlUa0ZDQnFz?=
 =?utf-8?B?SlBldFdOU2tYRlNnaUJ5R0h4TkpNc1ZJVWxudGd2b0MyREkxMzUwcTJMdFkw?=
 =?utf-8?B?aUc4T040UmlKQmpodCtwbk9CQmNnVlA5M3pSVWJsV0xzSndudjlndHVxV0I0?=
 =?utf-8?B?WFI3S21Jd2xBeVFSaVhOa3M2anFpUHVYQmVDNllkQ1Q4TEVpeEk4a0sxUHhP?=
 =?utf-8?B?VjVta0RtQ0NiWlpEMThjYnY0T0NhUCsxczgxL2RXNlUzNUY3UFo5U3BnaUJB?=
 =?utf-8?B?Z28zdGlyb0tXSlNpUnJ0L2k0ckhEZU1vbktrNkxiYTc1WnJwQmw2RUdHeG1a?=
 =?utf-8?B?TmlEdTdxaGxHbyt4a3VnNDJYWXBJOU91cm5neXBnYzVJL3BaWkpSUW5Oek9Q?=
 =?utf-8?B?QkY2RGNWdXdhM3pZaW9XNjRJaUZRRzQ2amp5c0JyenNkOXZLclFtSlpha3Yv?=
 =?utf-8?B?dVpSeUd6Z2xoYmh4YlhDZ3NmZjU3eUszNnlSSW5NYkNNK3ZWUWlZbnIybzkv?=
 =?utf-8?B?cEQxdnBDVWduazBTcWh5ak05b21RMzB6K0R5T0w0VjdxajVtWlZYZjZLa3RW?=
 =?utf-8?B?bDBZWXZIYm5iaDI3dWIyL1R3Smx1blZZV3NqOFFCek1SNzlJKzd1Zk5nNFFw?=
 =?utf-8?B?KzBDMEtyZDd2aXFjSm0xSlNvcHhERHB5UitzL2R0anJFbDdnM3gyS2JYWXFK?=
 =?utf-8?B?b1d2YUQwcytQZVlrN2MzS1VobHhBSFh5M3pOdkQ1RHAvSGF6bEFZamdNNTBv?=
 =?utf-8?B?TGdXTkJaRzY2T1BaVUpFVXU4MHB4YTZNWVF5RDkzbTQrWW5Ob2pNeGV6Q0l1?=
 =?utf-8?B?OUI0OXVabDN0QkZ0bWJJYkZLMUkybDhqdmt3c2RHTHlsdy9sZG1pU3dObDhm?=
 =?utf-8?B?VmJDenJiTEN5OUR5MC8ySVltaDRiQ29VdTVnZDhKUFQwZGVnRW5pN05hTEZR?=
 =?utf-8?B?ZW1NR2dHV0RFN09YODg4YVRaR2QvYjVaM1NmTm5iQi9BdFIxMENxbFVuZEs2?=
 =?utf-8?B?S0gwQzNIeFB6SkVXSHlKWTh2K2NVb29tWGkxSllmWjlQbWY4MVR6eUJkWWwx?=
 =?utf-8?B?eUlGVG5hSkpLYkVQTHpsTHRrZDJoR3doK3dMTXNnUnNaL2dRMDR1alVjZzZX?=
 =?utf-8?B?VHRRVTdBUWwxVlplY1J2SVpzeDhmTDJxVG15ZzdDa0VqdTd1dlppcnhnYktV?=
 =?utf-8?B?ZHZXNHFPcEUrcUgyTVpwc3NvQ1JUeHo1VVFQYndhMlQxK0dRck5TcFhMUjFw?=
 =?utf-8?B?OFVKRGhlcXlPZWY3S2t1M0ROL1hQaWd3YUVtN016QndESmxhR0ZGZWlwTkEx?=
 =?utf-8?B?VjhMVFJnOU1PdHRBMy9nOSthdEhIcExvYU1xajBDSTh4Wk5RdzUrWUNXL3hx?=
 =?utf-8?B?ZmNoanRRa0tTK3BpMDZUOVFMQitIbzdHTk4wRVJFelJ5NkJlVDFOZkM1NkNF?=
 =?utf-8?B?KzMvTXpXMXkzUFdMVUtwTGpPeCtUMXAvb042SUx1UUVCSUJISWljaW9sbTMv?=
 =?utf-8?B?MitpZDAxZmh0dGk0dkJBNHVhbDRjNVlSZFZIcXhUSm02bUptcG4vVWZ6QU9W?=
 =?utf-8?B?K3IrM2duTE85UmhnRHhUUHF1eG9GZVpINXgxRjA5YVltNERjeDBGWTZXdVMv?=
 =?utf-8?B?OW9BbmV6dkcycS9SMDI3VHQ0eHpGdnhaVnFXSVppaUJPTzRxZXpMVDBrYjZB?=
 =?utf-8?B?QmZHQy9neTY4MDNkU0MrQU1Xc0V3WEdxSi9RK2hyVzR2U2ZkSVg3NEE3QkJQ?=
 =?utf-8?B?M3N4eU9GSUZpbjB1dTlHT1Y3cVhGb2l4UHlRZ0taZWNsZm42UW5GcGVnRjNM?=
 =?utf-8?B?YXNrZUJoNUJBSUIwVEpTZ0x2QnJobnhKcDdaemlUNlp5eVo3ck14QnRhT1dz?=
 =?utf-8?Q?NlT1oMMZcUoiQ/J3VaQvDzY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d62357b3-bff3-4c62-775b-08d9fdc092b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 09:22:58.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKFSUFFaf2g/EUi31DGOJT/xEcWbLAdMaL8xzroUKc4V+2qXyne7A+bq8T9O2xVlIqeGnaLTdOFqDWOiwhHxog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 10:17:22AM +0100, Jan Beulich wrote:
> On 04.03.2022 09:57, Roger Pau Monné wrote:
> > On Fri, Mar 04, 2022 at 08:49:39AM +0100, Jan Beulich wrote:
> >> This simply parallels .dtors. Both section types can reference
> >> .text.exit, which requires them to be discarded together with that one.
> >> Compilers, depending on their findings during the configure phase, may
> >> elect to use either model. While .{init,fini}_array look to be
> >> preferred, cross compilers apparently have this guessed, likely
> >> resulting in a fallback to .{c,d}tors. Hence we need to support both
> >> sets.
> > 
> > Do we also need to consider discarding .fini? Or that's guaranteed to
> > not be used by the compiler?
> 
> I'm not aware of it being used anymore; if it was used, we'd also need
> to deal with .init (which - logically, but not technically - would
> conflict with our own section of this same name in xen.efi).

We would realize if having the orphaned check (or like here would get
missing references.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

