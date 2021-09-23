Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D1415F8F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194251.346043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOgp-0007vi-Ax; Thu, 23 Sep 2021 13:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194251.346043; Thu, 23 Sep 2021 13:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOgp-0007tv-7q; Thu, 23 Sep 2021 13:23:03 +0000
Received: by outflank-mailman (input) for mailman id 194251;
 Thu, 23 Sep 2021 13:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTOgn-0007tp-01
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 13:23:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22dd4093-1830-4084-82df-04402fb89cff;
 Thu, 23 Sep 2021 13:22:59 +0000 (UTC)
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
X-Inumbo-ID: 22dd4093-1830-4084-82df-04402fb89cff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632403379;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2Ja6wiy9vmJC0clJluFPedYUYuglRJmxbJ233MRb8XY=;
  b=OFit1Fr7pfFTDIqP8PDLNwHuZ1dnljhcEjk2zY+Fem9xbAoY6jlf98JG
   3b6f0ooG2DUcSzNR5MvyPz0YRqOUOd43hhbDUZ/qxxV+iBPppLH5u1uqu
   3oX1mkaGVoLhfN4NnpmyWVubJj8IcvMrtlc3DI6ki5jrGlu8TzhBFtaMk
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 70kYRKc/smLy3vXyZ/IOBPrcLt+tjNzLVTFOQ86dj6MgPOgQRAd0cy0PN6J26l5431DaCh4LXI
 mxhkRXyva3nxiEMjSFb85ZLbpJjkHBixUjyoy2fSlpJvKuUgC+va6PbPwbTrGEmsYFfzRian2B
 c56mm+jgRC7k6Plmw/uEfLhWIkCyYEbQtebDq1XvZ7+WeUEKLCT9uW0OziHPoK1CcU8UfQOOt3
 gh9QvN014dD+IppNpRPBi4GygAHwah/EVNriDzxq0OkAI5bDfXNgsMyReea45FiLO63HpwmNyb
 fzJdwB+lM9zEJ1VAD+Zx8wtW
X-SBRS: 5.1
X-MesageID: 53034015
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bkYDZ6AVrXNzLRVW//fkw5YqxClBgxIJ4kV8jS/XYbTApDp012YGy
 zQWWz3VO66Ka2L0fIoiPoW38UNQvZHWz9FqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00k7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pGqMwM570
 uV0hb+qQjoSBIjDmuQMekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHv6SvoMAhWpYasZmQfrBN
 s8ITBhUNi+DTh91EWU2DLYEpbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHSABjnvnSejicseMBbLtYAzQ6Pyrv9tlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqezJ923a1Tw9aDZYPH5ZEVJtD8zL/dlr5i8jWOqPB0JcYjfdIjj23
 znChyw3nbx7YSUjhvjjoAivb95BoPH0ou8JCuf/AjnNAuBRPtfNi2mUBb7zt60owGGxFAXpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2oSX4JdgLvmsvdS+F1/ronxezO
 yc/XisLuPdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyiARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4FbJbVl0UDDreuCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:hn75waoPv2k0riZtpAM81ksaV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53034015"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLDK+QxI29Pbk35K+/+aKBR7QnZaQ6kLMI3Tv/lIlwL8DJZP954VRqfURMciK40ZKPsCHTDVzHtzpRhSHSXhhiRqpi3kmgSCu0y7QG1PXRwH7yzfv6rlQVzCYbGgUYjEzJ8wn3GyJ+Xu1FWvM10lQytNLtVU1yO40Qpy6eLwyO5pdwoGsF5P4mxJYkN6HntSEtow4aDhZ+VWdySvutC+kU7bqfbw8SFZNkgatRMictiFMWp4Gf8U1bo7Rjv2/Z3cnOLA5lqi7uLUBBMi+ucZ+R4Er5EiJSRO0EbI0E0uFSvXPz7jTrEEoRdyuyQX19tggWvNdtT61QFS7bXq5aTYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LgSDTGtxKVdLSomQ6SlUTGGVV+6O9JYMKbeZi8zhrW0=;
 b=RfcTW63cbWeS9sWqH7r3SoU+c+9MZrKnEaoSONWIXazoShWmAJHPzBmiA81e7v7xkAeFiQrefMnOu9yan2Ry3nfLc6cwsafIWftIX4LsO4ZmGfXIYdtuKn7M8D1HNJhZHoytN6+OWVxnqItPoC0CoNU4kI4wKWHijaVrHWntmh/eO4P41Xo4hR5WOtqgXQJIdKf79RC5QK9qYcpKTv5xHVojTWkYcZEtR/59ZLxSpyKAw0DCib16BEZQqy8PVDjl1mzM0otXf8lH5q1LSdUrAPIRNHL+LyL5LqDrO9k2blmZfBiANz4sYD/D6Th/O+b4jdEhQvseSzs7GaDdZjDpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgSDTGtxKVdLSomQ6SlUTGGVV+6O9JYMKbeZi8zhrW0=;
 b=MnJv2njMQfLi+zLJKw8G3uvB5sOkpZfiWShhShuUXJFjax+BofirBNl0SG1Zrdz2Z4m2XImNQrK9A+WFuMK74p+zgi6KqalJL+NkR9p+eXZGpvGWbHtMHJREkBT3Oryh6pQy9UslcWlgbkjRXmn1QzFVHCB87jab7g8++i7QpBk=
Date: Thu, 23 Sep 2021 15:22:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
Message-ID: <YUx/qrZRKCsz7WdR@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
 <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
 <86c22215-923f-e8ce-e0a9-c76d90da4d77@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86c22215-923f-e8ce-e0a9-c76d90da4d77@suse.com>
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96dc406-27d3-42b1-10e9-08d97e95410e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29721FCE1281D1AB5758037B8FA39@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkgJu+J/4mSdlOqHeQzQ8P2urdREIh58uSTXvYuQVCXIBeKuBEFCa5nvllHqhnZWUaFouVP8k25FLLix7LIgG5d5WnCQE4obncWcL1i+KIQMVMTfh55tpXwLc8A7fMQkc15jvYBy2bEeW6WGT3ub1rYEHd1f0irTpMh9TGdUT/GwRcJOCSOqb9y4o2p0EtumaFLRWR3uj2urCz+fvumH3D4dOs/jsAfGt+QbEpRrvQIuVkktlWq2fHvzXhmI1gO4qw/5idnlJTweUzlTFTYBFkVIhhp07+jjmsRiIIhpVu5pLoDTQ3QT/lijRIR2BSzdGkW85r2Etqh9jNrWpGbEXFOrpIfAwqezGcx5ZnGeH6kxQvIVvAFzqR1an164MbxfOngSya1cwYAbiLwAwqylrzm3eBqkeh5jRGr84+P+1eg2gKpj2O+X027+LjAWnsqvs7Gn/ut+UJIOiaZupIis2vKliv1j46+h+qiu+EoR2KTqS04oPhZ+THnfskFaAxq5rkQaLMpCmpUFXnjDedqzJ3FI8F1bNfgKCDrLlxD/vb1/EbnbN7lIM0Fyq1KIzw6UZ/rxUCnyGVfOlv24+QZZnhPzXjPvRY2qM5oRYsIBzbWu+T4DXPDQeTk1aUp/H+r7cECXqvxDvX1Z877DqD75JiQ2Q4+s0Sz9FpC5NsUp3o0MvmiwxfV50UGpLZDztxTuB1hYOlnXbgIiUL/v+T68Vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(2906002)(83380400001)(956004)(6486002)(8676002)(85182001)(5660300002)(8936002)(6496006)(38100700002)(6666004)(26005)(316002)(54906003)(4326008)(53546011)(66946007)(508600001)(86362001)(186003)(6916009)(66556008)(66476007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdrN0ZqTjBtY01uM2NNekNPV2RZdVNqV0RIYnNoZUg2KzR0REl5Sy9EaGlz?=
 =?utf-8?B?SmhLbmtWUlNSc05FWGtMRHlVTitYNHBycitGU1BvdzZ4MTR5eGRjNUZXaEhv?=
 =?utf-8?B?cFllWEN6VzhYSnlsRjM5ZEI5Y3BGVEcyOEtQYmUyL1RKWEQvc1EzVDdkMS9z?=
 =?utf-8?B?Z3hKY1UxRkFUQkE5dWd6enhncEZ6S2V1N1ZZand1MnMxOUE5ZWsxZ1BuUUJF?=
 =?utf-8?B?Wk1WZHNFRUx4eGdPc0VCOStid0hMTmlkcmxiYjdYeERkWE51RkttT3VGK0kv?=
 =?utf-8?B?YU9qbmluVytZbWIzbVB4blBtczhXVXJDVlBOdjY5ZVNueHFFeHBVN1Q5T1Jz?=
 =?utf-8?B?RXJhMWN4SUczTU1VRXRnVHh1Q1Y1cWpIOXp4OFZtbThVUDRRdDdEWmlCV2VP?=
 =?utf-8?B?Umc3V21PaGMxM3NnNUN5UXZ4YnBCVEZ3RWV2VGw4SmxSSkhvaFpXVjBEOGZn?=
 =?utf-8?B?Rjl6YTlKV05MMVBYckhneVVscTJRbmQ2VmJmNjV0TkloTE9hYmlaMHpLK2FC?=
 =?utf-8?B?SEU2Sm5FVmJlcUlsUUFmTllUa09sdU9yb3p6RDhxWDkxRmhhcXhqMnZTYzhW?=
 =?utf-8?B?NllxU3NzZzM3OUlibGVzVi9SRnhXeXJPV0RKSm9JNjZtVndmcGdlYlVEditV?=
 =?utf-8?B?TnZRTG1aNjhyQnR4QUwySm9DQVUzRVdQbVl0K00vTW9GVExWbEZycURjTW9i?=
 =?utf-8?B?Skg1NjRDQ3VjU3NIb0N3T3ZnQlo0eEd6K05WbXlWYUlUR0lwcHlxTXJnUTdN?=
 =?utf-8?B?VGJjdDJOcm1PQUR0R2RjSHFDYzRUSUJPQTlrRkZJSXZzZUxnUk5IUEdHSytG?=
 =?utf-8?B?WTg0UUZSUUNxTHlXZGtpOTVnanJGWHJPa1YwRGE3RExqUlRIM05NeFVxVHpV?=
 =?utf-8?B?c3BadXFZdDluTjRQeEZoUEdCNHdFSzdlNEJuV0dsWG5OZzh3NHV4VUFEVE5k?=
 =?utf-8?B?MG96NUJsZ0g4b2x3ZVRnbStQWEJZVTJHNnBwN1NTYXkra1V4c09vcTVDanho?=
 =?utf-8?B?MG1UMGErU2pHUnhnSHNRNnZWSzBOTXdnNjVieTdaK001Ly9yZmoxcEFpR3Vq?=
 =?utf-8?B?UXZrbW5neEVKWUlsM1BGeVBmaFY5ZW4rZ0EydS9XQktkVDUyaW43WmprejBp?=
 =?utf-8?B?Q2VUYTRyWk1QNnkzWWhNWDZDOWQ1bWlwdUpTK0JVQUlqbDNBTzNkbTRUNVRO?=
 =?utf-8?B?M0trTkFocmgxTEpaM1pqdHNCM1ZsV25yYnRhUXh3RXBkSGFjSksrK1ZlWEh6?=
 =?utf-8?B?RHJMQXVvZEhNZUFhclZUZUEwV3M3c3hwdTV5QzlXNWtQWllVTjdQaWpFYWEy?=
 =?utf-8?B?enlkajNHU0hwR3VjbHpMR0NuQlNKeFNoem1UQ1RhczNUcGZBZi9YMlh4b3lt?=
 =?utf-8?B?b1dTd1duQTFCTkJvRENWUUhPTTdKQS9GSnV5T0dueTIrd3lEblMwamxuUEsr?=
 =?utf-8?B?S0oyQ1BDMERFVC83RThqdW1SbUN0OTZvQklUL2w3bG5BU2JVV1JVdFNKSzd5?=
 =?utf-8?B?UkpqS05mSFBBRUt5N1E3VHJhbnA5aFl6cml0SHliUFVVUlVPNXIvWXBEVGlU?=
 =?utf-8?B?ejkwSFhHSzhNdVorVUlDZW1oTlM4Qk1NdGJCV1FkMmJUOENLb0NpeCtVN05Q?=
 =?utf-8?B?NFBSSGtISHRMZWg4ci9WRkNpUEtRcUVoSytPWDlEd0VzdmhjQ1hIMmJ5V3Mr?=
 =?utf-8?B?TVJSTXBpaUxFcXFPbi9wMnBsZldhYXB1aE9kTkQ4VFVHQVlCZ1RUK1BjN0Vl?=
 =?utf-8?Q?K1FZs3xBLg+6KY64l/VzCdNjNpEsj0rsQYhTVQn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a96dc406-27d3-42b1-10e9-08d97e95410e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 13:22:55.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYOA8IlcZ9gARhvW4SNTJo0omqSEmacaHc5WrlHd5pFnpwS/Addyw08h0sJ4a95sLiOtjUu35A/DHC5L7veGoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 11:46:48AM +0200, Jan Beulich wrote:
> On 22.09.2021 17:01, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:18:05AM +0200, Jan Beulich wrote:
> >> --- a/xen/include/public/arch-x86/hvm/start_info.h
> >> +++ b/xen/include/public/arch-x86/hvm/start_info.h
> >> @@ -33,7 +33,7 @@
> >>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
> >>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
> >>   *  4 +----------------+
> >> - *    | version        | Version of this structure. Current version is 1. New
> >> + *    | version        | Version of this structure. Current version is 2. New
> >>   *    |                | versions are guaranteed to be backwards-compatible.
> >>   *  8 +----------------+
> >>   *    | flags          | SIF_xxx flags.
> >> @@ -55,7 +55,15 @@
> >>   *    |                | if there is no memory map being provided. Only
> >>   *    |                | present in version 1 and newer of the structure.
> >>   * 52 +----------------+
> >> - *    | reserved       | Version 1 and newer only.
> >> + *    | vga_info.offset| Offset of struct dom0_vga_console_info from base of
> > 
> > I'm not sure we are supposed to reference external structures like
> > that. We took a lot of care to not depend on other headers, and to
> > make this as agnostic as possible (IIRC KVM is also capable of using
> > the PVH entry point natively, and hence depends on this header).
> 
> But KVM wouldn't be using a Dom0-only part of the interface, would
> it? (I'm aware of the possible re-using of the entry point.)

I think naming it as dom0-only is part of the problem. In principle I
don't see why you couldn't use such structure to report VGA console
information when inside of a VM that has such device.

> > IF we want to add support for dom0_vga_console_info I think we need to
> > at least provide a binary layout for it, like all the other pieces
> > that are part of the HVM start info.
> 
> Which then means we can't sensibly re-use the existing structure,
> as that doesn't have as strict rules as the hvm_start_info one.
> Which in turn means Linux can't re-use the code converting
> dom0_vga_console_info, resulting in two places needing updating
> whenever information gets add to (then) both structures (what
> information they carry will, after all, want to remain in sync).

Indeed. I don't think there's a way for us to cut corners here. As
said above, I don't think we should explicitly limit the usage of this
information to Xen dom0, and hence should be a first class addition to
the start info contents.

> >> + *    |                | struct hvm_start_info. Optional and only present in
> >> + *    |                | version 2 and newer of the structure when
> >> + *    |                | SIF_INITDOMAIN is set; zero if absent.
> > 
> > We have usually used an absolute physical address to reference other
> > data, and I think we should likely keep in that way for coherency.
> 
> Hmm. (See below.)
> 
> >> + * 54 +----------------+
> >> + *    | vga_info.size  | Size of present parts of struct dom0_vga_console_info.
> >> + *    |                | Optional and only present in version 2 and newer of
> >> + *    |                | the structure when SIF_INITDOMAIN is set; zero if
> >> + *    |                | absent.
> >>   * 56 +----------------+
> >>   *
> >>   * The layout of each entry in the module structure is the following:
> >> @@ -139,7 +147,15 @@ struct hvm_start_info {
> >>      uint32_t memmap_entries;    /* Number of entries in the memmap table.    */
> >>                                  /* Value will be zero if there is no memory  */
> >>                                  /* map being provided.                       */
> >> -    uint32_t reserved;          /* Must be zero.                             */
> > 
> > This 'Must be zero' comment troubles me a bit, I'm not convinced we
> > can just place data here (ie: it would no longer be 0). It's even
> > worse because the must be zero comment is only present in the C
> > representation of the struct, the layout above just denotes the field
> > is reserved (which would imply it's fine to use for other means in
> > v2).
> 
> I thought the textual description was meant to be the ABI spec. The C
> comment should therefore be viewed as if missing "in version 1" or
> "presently".
> 
> Taking into account also Andrew's reply, I have to admit that I'm
> inclined to request that one of the two of you fix this obvious
> shortcoming in both Xen and Linux. I'm not really willing to be the one
> to introduce a 2nd layout for the same set of data just for the purpose
> of "playing nice" in an area where that, affecting Dom0 only, doesn't
> seem to matter all this much. My goal was rather to keep the impact on
> hvm_start_info as low as possible (and in particular avoid changing its
> size, as strictly speaking Linux'es consumer implementation is buggy:
> It would always copy as much data as it knows _may_ be present, not as
> little data as may have been _actually_ provided; whoever implemented
> this did only consider one half of the compatibility requirements,
> quite likely simply because in the design this aspect was also missed,
> or else the structure would have had a length field right from its
> introduction).

The isn't a strict need to have several different layouts on the
consumer, as you could easily use offsetof to copy up to the boundary
you know it's populated given a version number. But yes, a size field
would be useful to prevent the consumer from having to know the
version boundaries.

I can try to take a stab at implementing this at a later point, I
certainly don't want to force you into implementing something you
believe it's not the correct solution.

Thanks, Roger.

