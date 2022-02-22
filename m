Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14194BFA85
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 15:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276797.473093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVuQ-0004BK-H9; Tue, 22 Feb 2022 14:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276797.473093; Tue, 22 Feb 2022 14:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVuQ-00048Y-E5; Tue, 22 Feb 2022 14:12:54 +0000
Received: by outflank-mailman (input) for mailman id 276797;
 Tue, 22 Feb 2022 14:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CiU=TF=citrix.com=prvs=045c9559e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMVuO-00048S-SW
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 14:12:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84233f2d-93e9-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 15:12:51 +0100 (CET)
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
X-Inumbo-ID: 84233f2d-93e9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645539171;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fFdVUZrEbRDXIWLIOsqjij4vtYjqFbDVQi8Ml+pSSNc=;
  b=USQCBwngDblf7bLBkVj18FP9Q/nVjhbZLzbCugslT+VV3MaYWWt/PijT
   DNBMyzzLowMM8vaW8OT9wP3YZpalKm+PM9c6J/kA7Sjjsx4oPJAatyYrD
   PG1YMIFCfFAaauDLQccylOjyiAx3S8eF8ynev4Umqmq0wjjz/wfEtDiWa
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65130497
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AoFO2K2iedZUtbttR/bD5Rxxkn2cJEfYwER7XKvMYLTBsI5bp2YDy
 2cdXmmGOqneZjP1L9l2a9y1pxsEv5KBztZlQFBupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1nsMyhcwg4HZT+s+VMeCd9DyxXAal/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25kVRaqPO
 KL1bxJefkyYWw0UIG4MN9Efp7ej3mL8diRX/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUfUFDq/9GikEWwHdRSN
 yQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9B2pSdBULXCg80fLi8aoNqw7CZ+pnKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb+Jei8AxkkfS+F1/ronxezO
 yc/XisLufdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxLNgz68zRV2zfhnU
 Xt+TSpKJSxBYUiA5GDrL9rxLJdxnnxurY8tbcqTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWMCnw+QKJ7XrClc3Rwkc5wr5nOpJl3pNxP8OyI8lP
 xiVBydl9bYIrSeZcV7TMig7MtsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nE1wrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:QMJCTKG63yrk/yropLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65130497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXUj1Ew1GlFMdOhDBafxBcosOh2LPTFlY8bBpMt7sCEAFPXbhunqXFzkfEZE2HQtFLgZ2n1hFWHx9W/08J4JfAEChgdN7CKK08C0fiYf5CQBgrWOtZHdjb2SWpe4bkWs1mwtbKozkLCXgy1TVmYPOJGj6jkX2vP5V7izHToD59fEdpVDhCer+SRusWZHCtvMlUDHpEf8Q2qIClSBAEGx1m//aLy0cXNL7Xbvzef81sVThvjyNSZVWyEBqLRzyzW6owaEZ37gbB82DuDdOFqb8xa2/gdqEBZNHHynUbEPYE18ZX55CfWirI90Dp1Hk6t+x6zLT/k9Jzmj1osjH2Vq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDPe1jc3rzmEkrCyag7k4Ch3lKpvC3CtDvDjV5QbB2g=;
 b=D6ihuqQFXxbDiYREWsYVpsmhNaPwR3KML39IBqxZOEn/vwcFQpVkj6E17AUNxvtzNO8PNB/drRNhDnnNHRtM/1w35be9cjOnoYZjkrtKikFePmhNZm2Ur8ydrUMjGqCDRoXN0xqXv5UkpHOfaRhDBKUIVLKITDkNXPE4VsFmy4Rj0Ni1gdwG1PiGcGWC0SHx3eArbRE1IsDavXAc6mbpEEHnY944Ngd0tNWp9qc0hUq8RTC4hz71MYvKLagPg47X0MHD2eiFqEwTxroazigGXfoFAw+YxrKRuzJHl2N3EUb0VBJYR4FfQOdyJLP6LXE/ZchnaNt7wQVH0rYU+dfamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDPe1jc3rzmEkrCyag7k4Ch3lKpvC3CtDvDjV5QbB2g=;
 b=ZiAGPOXyK7TLgtnTfcspeS92RrEw+268AfJ4pm0QtjPjGzSxW7Nw3X1Y3HJ1FHnrAm1Wv2pQBjyFvN2zwEQmpJh5OUohtfGfOMNOSgrVKu06aghVnZ6I93Vd19iNLkvBoOBugtJpu3mt6h3OHUuEw23zMvMUpHw2VpdxcDWFHDg=
Date: Tue, 22 Feb 2022 15:12:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] cirrus: update FreeBSD to 12.3
Message-ID: <YhTvU7bQiBNl9AeX@Air-de-Roger>
References: <20220222135629.68769-1-roger.pau@citrix.com>
 <405b80b3-2f9f-f6a1-1776-ca198f9fdc98@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <405b80b3-2f9f-f6a1-1776-ca198f9fdc98@srcf.net>
X-ClientProxiedBy: LO2P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e15bfbc-8534-4f54-3500-08d9f60d62e9
X-MS-TrafficTypeDiagnostic: PH0PR03MB6365:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6365381176CC6A6C0EF003FA8F3B9@PH0PR03MB6365.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfpCVt8qpdLYR/FSbo5NGgjpLRM8H2r8V6RrS5XOtbUx/lkBkwPY4h6BwF+vsSgLZHpmCFSBChEOkPUtQaN4t4q842vJtWIO5fDKS0NnN8yzpaJ5qj+MUzgH7GVECKd75m+6CIZTbQAa/kEIXNPASdg6qgoMLqdHIH3WYHzCKV/oKloEWUUpb9B1scpLh/V3eMEXN8uwnPvJJhSeCF/PuAeosnDBUgXd5Nb3v3HmXnmELYbejqxTl6yb/sPayu2SvwHeO/dScJrHQphdJH2srOTzB2lMaf27YO9lqEmz6QYHid5YVIUAVvgu91tU+l+BKj7wA3/X7TKdJFHR9xGriG3pn43rPPveR7gaTJRggMHHfRZ5CiBx2J2tzU7q9I+cZxOcikF7EVN1YqYKVCilFibxCpl3anPkFvNj4owdKmlJjO7aHb1rCgdVuO+A/ERjwG7ppCnMIACz4wLedQGsSKuEPo5ItPFqhU3TATwTjBD/2bTILiecVK3df55AA4JpsHJVNRrTvkHHxjBo0aMBD2AOd5ebfYK71ydOHBUYNJr899EFD1ERtsn3NS9irJSXVbMTahaLA04k6edmGWFZcLkb8jRxSG5z0ekNZ4fUqA8U375/05mtmK2DGv5Kh4slHz2VfxHgnc3uPB8YjkT6AAkBnREC4licMEs9ybFNB+SUxRWHEevGHBZxGBsT8cYQKXG5m+uLcuEI1UDANegIBODKIQvjVtsqsmwjpOf9WrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(966005)(5660300002)(6506007)(6486002)(2906002)(4744005)(6666004)(508600001)(86362001)(53546011)(6512007)(66556008)(66476007)(9686003)(8676002)(4326008)(66946007)(54906003)(82960400001)(186003)(38100700002)(6916009)(26005)(85182001)(33716001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0xDaTNTaTVYUkNydGNPOTlSYXdraDRIeVZPc0NiOXlUM0d6ZzVEczllSlE4?=
 =?utf-8?B?UXpKYVh5bUd3WUdId1JjQnVVQmpVNU9RMHdQb0w3QlZXTWdDQWFOZXZSNGl0?=
 =?utf-8?B?QWEyQ29Yd3JIRU9ZZTZHN1hXN0FITVpTa21RdXV1d2RzeUp1QVk5Z2tYRXUy?=
 =?utf-8?B?QzJTQmtoZG1sWjdnVFdSSkxBMGFtVHNNakorZEFXTmdTRm82N3RiOThoUzRq?=
 =?utf-8?B?YklRTkRSZHpzZktXWm9pWllQTHBxWTU0cTlibDRBN3ZPT3FSY3lvd1ZyaVB6?=
 =?utf-8?B?RG9wbVMvQUh0ekxrTDRvc1VIRGRKZGZtTDQ3Qk5kbGNRSmRGelQrMDlaemQr?=
 =?utf-8?B?QlFDNXV5V2ZETXNmVUFlMEFmRGRKQm5TQVoydHRSYTZVMXU2UVdxWEgraHZh?=
 =?utf-8?B?alFHRHVFNjExS2xGODRUd2dpUFZMMjBuVGlQaTdDdTZWTkJQcWRubVFCYnhD?=
 =?utf-8?B?SHpZbGFuZEhWZUpjZkg3ZHRuTDhGaTJkMjkrMVpJK2FWYVg2aE9JdVAvNU5I?=
 =?utf-8?B?WXRwTTM2SzhUZnFhTC95TlhVak5TdWhkdUMvdjR2cjVjSzMwSjNzSmptQ0tE?=
 =?utf-8?B?UXB2Z2JCTUJ5MktlYlJOb3cvM09lMjE3Mzh0RzB1cG0wUmhDSVlyaEI3SjRu?=
 =?utf-8?B?ZkZVUFVCM2hFNTQvSExERTMwcGVwZzV2bXMwQTU5QUx0RkdjQkpROCttVFl3?=
 =?utf-8?B?Yi9HYkpJRytERENUVDlkamFWdFREZnNjeGREOUM5ejNnNlZha2srRTU4U1Vm?=
 =?utf-8?B?MHlmLzRIcURoY0UrcHZZTUgyd3E0cTdxYmJOSXhyM3N0Zk1WbjdFRVZ1OTVN?=
 =?utf-8?B?VW1OeDNoY0xuWmVnQTc2b29URXo1ckF4dVFnOUZvRkxVb1JXUmJldWpxVTlz?=
 =?utf-8?B?OUt6YjlQa0g3cE1COW1kTVVnbUpKZWZsZUhvYlp2QXFSYU50aC93R3FMeUpx?=
 =?utf-8?B?OFdOUjQydm9TcVRBTzd0TVNqZExBSDJJb0l1a0pCWTZLNVdmNE83eWRPRjUx?=
 =?utf-8?B?cnlRMUxZdCt6elMwbExldEJDbTl5cHExQ0w1S3Nlb0RxRnZMZUVQM2t6RzIw?=
 =?utf-8?B?T2hXSVBLM0psWlNxL1lPbGh3SEJSN1dmdmNtL1luVkloT1ZrbnAvOXhBdGE2?=
 =?utf-8?B?REJrUGw3czJvcFAzTVZRZHJleThIbkYwWXJjd3hRYTV6SkhjMllnMjgrWnhq?=
 =?utf-8?B?dFk4MnRsSW1QVFVRYk1qTUZEeDJFMlBlM0ZjWnVFZ0VJbDhVODFZUzB4MEhr?=
 =?utf-8?B?Sk1jYkxISWFJQVRoOGxCdncyb3BTckJQeTR6aFhuVnMyYkk4aUViUG83VEpV?=
 =?utf-8?B?RStoOUFCeXllOHFYOURKTFczTlRuQSt2V3JpOFJzR1VRcnR6bG83cUtaSmxx?=
 =?utf-8?B?K20yK3VXM29UM3BpNHZ6bVFLeENteFR6NjVFRE9HSkQvbWFFSnpwUUd6TURp?=
 =?utf-8?B?TG1EcjNNM1NUUUFHQy9tb2tIN1JIMlZRREplNmZ3SDV4Zk9pUDFtUmg4WDdx?=
 =?utf-8?B?ZkVjcHZUbDlMMld5eGVvUFoyYVgrMHIxSFpIRlZDSUkzbVVtL1NIL25hZ2cv?=
 =?utf-8?B?RW52R0pmcmlrRlpnN2NoU3lrcjljSE1HalZYL2ljbTdGemU1ZGpYOW1Hb3ly?=
 =?utf-8?B?NlVDZTZGOWJISVZhYnNnTVY5czZReFgwcFdYQzBoOTUvN21LZWYzYW05cVln?=
 =?utf-8?B?TWRNa1Z2S1VCRU84Zk5KSDFQdjhYd05tTnBzc0RxRFFHTW52NGFKZXU1MWZ0?=
 =?utf-8?B?KzZ6RjFmUCtqeVVrZWpKQkdLNW9pZngwSUVBSWNLZ2VVL0ZZK3ZiTWwwd09B?=
 =?utf-8?B?V2JmU0lFRDNkOFR0cy9ibHVFV3BQdFVCOVFmdWpYL3RTZ0JTTVhPdFNDNFI5?=
 =?utf-8?B?eGlpdGRCSTVPcWxDNzVvVWloMGJGcFpJTzFKZG8wc2txdDlvZXlCYmFzRUJ5?=
 =?utf-8?B?ZlN2UWE3RjIwKy9FTzdTaXhHdjB5VWtlUW5jUGRqSzF1MDlXS29XNXFVNFVs?=
 =?utf-8?B?RjhzVDVvcHNJQW5lUVJxOFROZHVyRHBHUEtyZ28vUmpmczBienpjNmt4ZFJM?=
 =?utf-8?B?K2UrYjZFMWR5SmViakJHb0VxY2FQWUxqKzdQOTEwbTBsTVFOS3RGa09lZ1hy?=
 =?utf-8?B?dTltQTNtN1krSTFtTTArZFF0MXBkd1BTVmxIVWwrM2ZYYWhHOEFyUzRiTWda?=
 =?utf-8?Q?x6NGJPx3MDkm7LvoD6z7j3Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e15bfbc-8534-4f54-3500-08d9f60d62e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:12:40.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTi//nnT+/irAfNE79FTAxClRiGNI9m4ANXvOkmH1nGq93XgKkg2ORtN8YQAgxlYr4qIDtzYdGl3UxS/OSZFWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365
X-OriginatorOrg: citrix.com

On Tue, Feb 22, 2022 at 01:58:48PM +0000, Andrew Cooper wrote:
> On 22/02/2022 13:56, Roger Pau Monne wrote:
> > Switch from using a FreeBSD 12.2 to a 12.3 image.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I presume you've got a private run showing that this is fine?

Indeed, it's at:

https://github.com/royger/xen/runs/5288917938

Roger.

