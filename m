Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F841B8B8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198461.351969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVK6K-0002Ly-GR; Tue, 28 Sep 2021 20:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198461.351969; Tue, 28 Sep 2021 20:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVK6K-0002J5-CN; Tue, 28 Sep 2021 20:53:20 +0000
Received: by outflank-mailman (input) for mailman id 198461;
 Tue, 28 Sep 2021 20:53:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVK6J-0002Iz-65
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:53:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6efac599-38b6-44ab-a6a3-fbaf65b5f0e2;
 Tue, 28 Sep 2021 20:53:18 +0000 (UTC)
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
X-Inumbo-ID: 6efac599-38b6-44ab-a6a3-fbaf65b5f0e2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632862397;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o/gQsaBCDL+vcmmpLo9NMplWGRLceVYuOJOdZyPcfrU=;
  b=Sere78e1mvIYszIU/nmckDghz1ZT9KA/ANSZrIG14qhhtg6CELDAV2QD
   vIQoKc9xBwrLD7gtBfkU4k2aKq6wuX+8pb6TVcOp2KoZQfTBSa8GKYqDW
   rdtU3kNrvWQV7PFeEKSGbL+vEhIS41CGjIEm/sWb8O4tfu4ckjFTKqiIu
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PnVj/hs2/wCpLn3pVSkJUBkVqrRR2+CxQYukDWP/aWkuRHBzGyUBKjmoYB7FKzJSynrt2G0caU
 CpkZ8veUi34LP8iRYGam2jba0rczK5U4CLLZci1zU7zZN+zpu4fWNaqPBYE9VfkW2EvxnJW1kP
 ShXtQCuAlIVflInYy+po2aagO6ePpTPWDiKLw6ZElIXC1AWkN58d6hnD+ob6yDzSXkbg0YjtKe
 DLE1j0KagEuzDZlxWa7XgxkkhaO9wk4bZUaPup4vT8CM0/k6RFWg4yc7lg142d7KJFP5qaCD/4
 NREx+Hdgv8E/ZQ0aWLdPiNJo
X-SBRS: 5.1
X-MesageID: 55685815
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KsWEWaC70XfVjhVW/13lw5YqxClBgxIJ4kV8jS/XYbTApGsigWYAn
 TdMCz+CPvncNmrze9gjPojjpx5T7ceAm9JnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00I7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ljiwuYB1i
 8Rxtt+1U1Y2HKfQwNslakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgWlg25AXQJ4yY
 eIoax1rRRn/SiFAO1ENJYhjk/+53VvGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoYE7ey57hnm12Xy2kaDjUZUFK6pb+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS1gaJzabF5heDMUINRDVBdd8Oudc/QHoh0
 Vrht97tCDpm9qCbSHeB7bqKpBu1IyEeKWJEbigBJSME/NvLsIw1lgjITNtoDOiylNKdMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6jjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHGcs
 UEiy8zd/dwNTpSXxTOvSvlVI4mQsqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroahezP
 haM6Fo5CIt7eSvyNPArM+pdHuxwlcDd+cLZuuc4hzakSrZ2bhPP2ChzaUOK02npnSDAeolkY
 szDIK5A4ZsAYJmLLQZapc9BjdfHJQhknAs/oKwXKTz8itJyg1bPFd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNhWs6m8ZUNKrfYSuaDJI3HI6SKqV/GU9Y595m5a8+Sp
 i3tMqOm4ACXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB5CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVlG0qXZSXnbp75tWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqZmSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:iJUiEqxLz+fhe383aqGLKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="55685815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6OsxfCaspSy50YuOaIS66Vt4WurlNCR0ynH234Ww9GkPlczb7PNpib29qcuE8VCkFFw19Sl/p1bMuzTJ9c2bgClu/HlZykmThQzSqnrllctT3B4tBb6rQSBJmjlx9fRxuqgeFdNAgt83kI+f9pDHiP18E6w3X3U50RLeQ4b/qV4oUs6xpwFCx2IL4vDPaRrav6RRTzyZUACI1XIuQj8hfsesGOmQSvZ36dV52oGF8L5xnQQGdFHeMOhhHistNOpNZ6Pq3lXtFmKB/SwsG4iWRywZdlRBhz0ckNHJBjip58eRVSPJlCgjXI2Q9pG/J+8KBBShZTOUFuCYIj4RT+04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eJvj6b8iMf2UBiRV3R4j4nZib8IPWx0Hcuyv/lqleVE=;
 b=Jx61mVOqyWl/JrCh+tA9oiThG5b14IuZGzk9aFzqSfwLJ6Y6pITGfdAkFd6bnYfnMUIdXaZGhabDXmrX8w2gqo0cCOsD5yBcQvcknDag/cEb5eiaA3TLK9mLSeiqEX8f+UiTxIeEc5oUAVyS1hyuPG8K7L01h1RSe50IJmQzDlbuGgSPeRe2VsNoZmTcew0hLr/P9CB1jUdAYkYg6bI2uI/L2BbD6GCZGbTFaZNwjKwTBpn1FMQvaJdd6kRPRYJkSqOkhntWmujdas6XCgaPJDOFY/cmxlBgQu4EhVx846VEhhbYmjHMkbqu177BCFomJjzrBYhXci6ffsKYZXUfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJvj6b8iMf2UBiRV3R4j4nZib8IPWx0Hcuyv/lqleVE=;
 b=jl4Ik3IQwu/G7gmkks5sjL1/AIRsn9xg/Y6qq1To7oody5iPzaN4yWcDkbGUrawczwY4dPBhXZ2uXMx8Y3CO6w7A5rQ5GM6weZYOwXgggQEdiVnlWabmCy1WKBENUS0oH3tBPLQUWwhk4EVFZsy9gpfDvSjZL6ERcDJC1YXEziI=
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <47e32bf1eb0cd18210df4273d564fa17d389f3ae.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/6] x86/debugger: separate Xen and guest debugging
 debugger_trap_* functions
Message-ID: <8a3e66c5-e724-7018-da4e-47b61951915f@citrix.com>
Date: Tue, 28 Sep 2021 21:52:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <47e32bf1eb0cd18210df4273d564fa17d389f3ae.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb45135-6802-4870-a0b7-08d982c1f332
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB496695FFE7A2DAF59AEEACA6BAA89@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpVdjAE4ZuID9AhvzI6O2uLqnRSbXmfT3QPT1GW2eaQXfvfu+LJt2oq5hFoubyuVTgSk2ahuDxWRVG830SeRHtOummZJRog0kHpI8h6hxZ3d3bkXUB+9BYXIbWkLJdusUom6rPyDdfJgxUDH+axYlA83mzmTg+3NKKY8VCPZDws3T9AyiQ5W/BTyXA2gXCCt9SWxDpJ4YlOb92FmEd59lFSIc+WSmU0zZHj1ayTAodZ5BmRB9qFWgLl/jjvBxubQ23bchcoGPWwHH8uyMKf2KxR5Z4gIOPZ3vV4RZab2X4ezyDRWrpYDDk09fLasV+AKSdnxSIuZbYHjEDSwtK806gXaTiM8vC83BZyqaJN3TnBDjbNIO18SjbZIvj7u+JJrLC6fjqQ6Qc8moWVgKkiRuBblNC+/OK53F0kEa8HTdOtqEaA8Zlt64xdYsxfHcYNfb6VumpiSmN3xhJ3nqmtwtuV2DOyM+AiTQHyGF1mr3ZSCEihpBG7kwQZP+8E6ljHXSI3XinAclob+g3ppS7FIuYRQhDMTk/9A3WopeLp+veIgOjpPPY3R0DgQ+axZPwsCA6MJiHkbCvEhgcB4tJjLtKIbOH0mA+SaaNq2rXEY4h5K2FeRpThkjgPmB72RMQ85AxLpF8PGjI6k96x/Go7umazTaPZQB0LI1iJHty6nA1QfyZwwyVn11XGQdBb+viEG2Ew26o4kAzXeKCa9NNqklvZLABN2r4UmK/086s4xCDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(31696002)(2616005)(8936002)(36756003)(5660300002)(508600001)(55236004)(31686004)(38100700002)(956004)(54906003)(66946007)(6666004)(4326008)(2906002)(186003)(53546011)(66556008)(8676002)(316002)(6486002)(16576012)(86362001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzQrNE5ncndEM05pRDhJZDVqeWc1NzkyWmRnTXZvR0puTWJxSzJKN2tFZjBU?=
 =?utf-8?B?M2NZS2txNGJleE43UFU5T1ZMZjBzbVVsOTdNNzN4Y3NLWlBkVE5BZmdjM1V5?=
 =?utf-8?B?a0I5TFV5VGUyNE55bjUzV3JYZTFvclZmWXNUcWV3U0hoNi8zaHVrK2ZRSElr?=
 =?utf-8?B?dm1XekNQb3pudGtsWTBLRFExaXJkZ3N2eUNXWk9GbUVxb3pBZlByRG5wQXJu?=
 =?utf-8?B?M3NUUlhSUmlVZ0dOTFpOVkdEYUpkajdwSUVXMmZMK1l4VW1jV0k5bHpQUDEr?=
 =?utf-8?B?ZzBSQUpFSVBlc1Y3YlFxbUYvdU9tQ0MxK1NpRzRVeEd0RDhyNEQzbmJDQzd2?=
 =?utf-8?B?L04vRHBJYW5tWDd6eGk2ekJwOERybzdtSGVWL1VnaDl6TEpwb3RlbHJFUTJo?=
 =?utf-8?B?aDByN25YZWZKenVQMHQ4blZ2czlOQXJIdFU1Zzd1alI3YWtQV2l2VVBxZVFv?=
 =?utf-8?B?Z0VIdHQzMFgrV3M1SjRsTU10c25RR2hjN3k4YVZ0aktSdUdCZkhlQVJjZzll?=
 =?utf-8?B?SFlaRG1RMXhBUjkwcVFlRFY4VVVhODF1STU1WGczbmhvbk1BY21TMUtZSDJR?=
 =?utf-8?B?dUdmdXV3Zi9UWHB6b08rZTBLaHZQQTFKUXNucFJqcVVxbHpPNjU0VHRCTjZI?=
 =?utf-8?B?cVNQWlorREk1RCtFV3ZheXRFV2Z1UTZHMUNoVWZ1NlUyaVhPSE5saFNKdERm?=
 =?utf-8?B?a3czTVNHcTR4Z3Y0Q0cyclBnWWt0UGxjaHA3NFRMU2J0UUI1WHBGbFI4aWI5?=
 =?utf-8?B?MjFmeXNIdXl5WE9zVmVYSk0wZW1oUDFqYSt2OWJhNVdwV0ZsOGluMWtBeC9V?=
 =?utf-8?B?NkIwV2w2QnBRRDA1Z2w5VkxwV0xDdHFGbTRZSXdDZm5XSkgyY1V3SUlXUWNn?=
 =?utf-8?B?WUhrOXlYY1BUUW5BQ29HdHZINDVtNENDd1FYZFk1bjBTWXZLODFjVUdxTUth?=
 =?utf-8?B?VXg0T1Y3dGdnM1ZPS1o5RCt1MC93M3JBMjBEdERDOEVhd1U3ZVRPT2IzWFhU?=
 =?utf-8?B?UjU1eU1MY1FvVFpIeTRmdXVKb2svQ2IzbWdxTHQrMGEzQWNxNG5RbFJBZzJX?=
 =?utf-8?B?OXNKZ3hrY0Z5RVMzZ3Avc1BYNkVXVEkrOUtFaVpVMjl3VmRjdVhLUE9scjFw?=
 =?utf-8?B?UjV4UjdVRDhEekJTb3FwU1lZZjdtYXFWczFRbXBYdlduVFBJWlVsWnNabGVY?=
 =?utf-8?B?Z0xCSnQwY1d2VFVOVHdXaUxiaEE3RHZNZjFrVUd3SWR6M0I2Y0MwRklCb0Nl?=
 =?utf-8?B?cW96dGMzRmVGa1hGaWtsclBQd0lkcWJtTVp5K2NMY3BTd2V0N0Q2MG4yaFE2?=
 =?utf-8?B?TzhpMUJnUjRaRGluSmFHMzExcldsaHEza2FQb1Q5OEVwa0FPajduZCtaQm5P?=
 =?utf-8?B?Yk8wd1pnUXNSczA4dHBrc1NoTzR1cVRxVDlnMVJHSzUzNjIyQ0FaUHk3NVZF?=
 =?utf-8?B?VkRxNzBwSTZ1TU15c1Y0Q0F4RDhwVjhONHYrWkJiYTZic0ttU3NONDBXMnRZ?=
 =?utf-8?B?Sllvck14M2JWSHlrUkhGRU9NM3NYVEhMUGJmcC9ja293Z05HUnB6ZFcrZVVn?=
 =?utf-8?B?UW9xKzVTYk0zUTJMZDAwcmFuQUV6SEpWUkpham5walA2V01aWFRmT0dTRWNT?=
 =?utf-8?B?TEZXYXB5aEtaTFpuZFNoLy96MVFZU250eHhBQXVMUG92SkNXVm85dXBVNG1V?=
 =?utf-8?B?T1IwdGdNOUFLNkVNVnpZSHJyTDVRbVE5ZHRUcWZMUVdIbDBncGRzbVZWbjMy?=
 =?utf-8?Q?DuWpWNru99j5qEVvEYC4iym/witJSD4lfoP0cij?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb45135-6802-4870-a0b7-08d982c1f332
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 20:52:57.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V4kPL1ed8dN8uIZa9yvyjW2p9kSid5dVgiMQjVDNJ4zKi3Ye+302j23F3njs1aMH5W0ZR2pmn9DlsoIcEtMBo1A8Qvo7rCQG0yoqMH7E6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index e60af16ddd..772e2a5bfc 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -858,13 +858,20 @@ static void do_trap(struct cpu_user_regs *regs)
>      if ( regs->error_code & X86_XEC_EXT )
>          goto hardware_trap;
> =20
> -    if ( debugger_trap_entry(trapnr, regs) )
> -        return;
> -
>      ASSERT(trapnr < 32);
> =20
>      if ( guest_mode(regs) )
>      {
> +        struct vcpu *curr =3D current;
> +        if ( (trapnr =3D=3D TRAP_debug || trapnr =3D=3D TRAP_int3) &&
> +              guest_kernel_mode(curr, regs) &&
> +              curr->domain->debugger_attached )
> +        {
> +            if ( trapnr !=3D TRAP_debug )
> +                curr->arch.gdbsx_vcpu_event =3D trapnr;
> +            domain_pause_for_debugger();
> +            return;
> +        }

This is unreachable.=C2=A0 do_trap() isn't used for TRAP_debug or TRAP_int3=
.

> @@ -2014,9 +2021,6 @@ void do_entry_CP(struct cpu_user_regs *regs)
>      const char *err =3D "??";
>      unsigned int ec =3D regs->error_code;
> =20
> -    if ( debugger_trap_entry(TRAP_debug, regs) )
> -        return;
> -
>      /* Decode ec if possible */
>      if ( ec < ARRAY_SIZE(errors) && errors[ec][0] )
>          err =3D errors[ec];
> @@ -2028,6 +2032,12 @@ void do_entry_CP(struct cpu_user_regs *regs)
>       */
>      if ( guest_mode(regs) )
>      {
> +        struct vcpu *curr =3D current;
> +        if ( guest_kernel_mode(curr, regs) && curr->domain->debugger_att=
ached )
> +        {
> +            domain_pause_for_debugger();
> +            return;
> +        }

Urgh.=C2=A0 The TRAP_debug above was a copy/paste error.

I'll submit a patch, as it wants backporting for a couple of releases,
after which there should be no additions in do_entry_CP().

Everything else looks good.

~Andrew


