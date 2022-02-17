Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226804B9BF3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274557.470061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKd1g-0006YA-41; Thu, 17 Feb 2022 09:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274557.470061; Thu, 17 Feb 2022 09:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKd1g-0006Vd-12; Thu, 17 Feb 2022 09:24:36 +0000
Received: by outflank-mailman (input) for mailman id 274557;
 Thu, 17 Feb 2022 09:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKd1f-0006VX-41
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:24:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69a210d4-8fd3-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 10:24:33 +0100 (CET)
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
X-Inumbo-ID: 69a210d4-8fd3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645089873;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5ZqwbG/uKxvFoi9E+cTOEe3zBec1/oYOl00/WlHlBRs=;
  b=PsZ9G3nCzKcHDpJqEWANYmYLurOxFCv8/gaumN546TuNgCxgYutCztOY
   TUd30l8G6XtVzI1uxrqD0cWlHvrNbaW56KHAgmE8/bdS+RdLfoTK4wQIz
   4u/Bhd1zZDsbZQWLoeckgzZZT12YIcI2SJm5c97LR0WnMiHD0Z3dANqdd
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zk2iAw4KOQ3yfOBqBCopQdhixhb2qjFL1HED2mkgIZUUzyColS8LuWtJAZH4AcIaLxpcuZAhK7
 WIZKEacwa9g9tYHPrKSzYTTVel8vHLY72PmgA6DSPzde9hNsdxQm/jO5LImCSysIhugnCp0OKX
 1jeGos/ylriM3aLjaLkHwkXGCPl/njG/fkbL8A9kstpFQlGE99S/9jljQfc31VhG3oM8RycIbr
 0UTS5kj4RGwF0XxsS0GNHYYOl8CI0jopzFeQR4RJ9h/VlcHOceL9JuTKynkL4jlB+G+BIhdBu4
 1PvO2fPBDrkapYR3yIB/02sB
X-SBRS: 5.1
X-MesageID: 64820656
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vdYaVaJb99DGLFcbFE+ROpIlxSXFcZb7ZxGr2PjKsXjdYENS0TdTm
 jBMXG3SOq2OZTT8f95wO4/kpBsPvcTSzNRqSFRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2pgs5t1
 sRpp6eialxwN5Dwlb0TYjNXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UuY8ChGlt2KiiG97FW
 5YCTiB1SS3mbjBtM04NV6A8xu6B0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TifWmj1Hkc9NZJ
 VYd9icnoe417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyaEGHQaXxpTU84F75Y/eAAnj
 1G4tdy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgjpU
 JsswZH2AAUy4XelznPlrAIlRuzB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP5FsKu8EPYSD1MMebhr5d7exwksAM8vy/C5jpgidmOMAtJGdrAgk1DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBgVMqp9ZIGLb/YSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:riGffar16ko49mgYV0BQefUaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QpiAoos+O/P+XZgNddvpfvHHeVAlYSi8Rl56cm6XXZ3uBRr22uzKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="64820656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAQ5VSUFL/tdm9O/jaz3UtD/lVQWi84YRq2iQ61QZYMvzjSJRKbr4OQWwwNkxuY8gDHr1lwKgcUlpCmX2BRleIaTXokEQuZ8HkzoPbD6aQR0meb7UFapEYRQQql61VcDcsGa+lGZgfVoAMj8Zu+umzyC1oClDna9JkgA6eCrig7erdF8ApcqTVsbVnjFDl+BAtW2PGrbJ1pPVfekJ1N93Bqqfwn13A6s1LuVc2hVr3J2b52Ym325WHG3zsBJPKqsNb7WfFUFuFZ1+WZZbV3rRlEKJ4kSZboinvNG1RGhds0DavHXaDjb31umYzd0rCFCq8OxKw7GD0c+A66wanRdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeZVID7WEt1NNuALJjPNEUhUpiWtrNlfafwbYA/JAuI=;
 b=NKPwKK2fWzpRp3C1rhnMcYh1cO0BwzmtHqkmNIZ0xno+Ujz9car5gjOdnr+QLxd7BZihSnCcW6HNTCeZ3eBzON2AuVmJu/uKrZVl8JARuAY7XPTqX6ttFckQ/APRBHEg7IdTPofxot2UndJSjDgsd07MSP88+3JOFR66ln7AMSWQV3385nnOZMvEInAIdnzCcBMaUAl/dITmH82TosTunSKuSA+LkebKaROYC7GsFMHBsL0eZ2SCux7IpNOJPz8GhD/2I2x/FajGPfryKvvKhasuYoCKh6mxi4yoJ6Ej/1uGRDFrb9Bq+1vO9qc039HBovNpGz2Y9stM1D+b8oDhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeZVID7WEt1NNuALJjPNEUhUpiWtrNlfafwbYA/JAuI=;
 b=GB1uIHjowzMvBU+TYJ1K+AxAIWedK/rpv3mciKomPHQYnCEDhfZ+IlFS4I8S1h4PkI3Dt9+sR0BxAxCsB73q7D2P0f8LA3g5RifTbHod6BG8JQW9/TAONis/2jrXYfj/uj9bJXQk2BzQgAUR6WPxhgQfp7VhwuXWKzUWUz8UZlw=
Date: Thu, 17 Feb 2022 10:24:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: David Woodhouse <dwmw2@infradead.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended
 Destination ID support
Message-ID: <Yg4UPzFk15tJGo0B@Air-de-Roger>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-2-roger.pau@citrix.com>
 <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
 <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
 <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9012f5e2-a9e5-40a1-f38f-08d9f1f746ed
X-MS-TrafficTypeDiagnostic: BN7PR03MB3970:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB39708107FB869785C6CBC5A38F369@BN7PR03MB3970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8hjyzp2qwO6AoptAyJvS7Om0h2+tzWIr8MT/d7ga2Wvko+pKj6tdgDaDhdj3jCJJ699icpT0A+et9OEmVm8ovEkmysPoDArF3wgW/R4rw9EY6HUW6tl24iw4hElkuA+PDAgAXGQ4TtY5RKHoVCMSsh4Kr+FSOYuP70dhqcHSu/6MWMytT4DvZ3a2natSDjLdmQxraY3XvRkx3uMwqTWfCjnw/g5us6EICcbq+WUm6KpKgtJbUlFK4CIVOw1nCZiL29ISFOfsNAwAOBj6ywoGZgpWHOE5HNYuQ/Vq0CbkZAewTB0FBBA8FVcgmzIr5mIVzhKbvwCIxD34rxcCuhEY4Ep5wCjfboo7Ox05KsR7shbXPWMF51Ek/bzPxJ4Jk1sq6aKHlDlH7KXUFPviQUfoznOpBntSj+jonHJ2gsmR+hw65/98O2posH6YTKlB5hhw3z+Pa5X/wPgw9S9N2m+376ShD7sokFWmaadrTQoRDoTFN0f+RwqzMeCarrGZeqVHCJrM9qwPfljqDkhGa4DVuxvf8ZmNev//V2HNPxMD1Dvrn4pN2FN1QLTzMXMpqMhcRY3ixBUsIUSyjj+2tngZQ88xfXx6CnDLiPSYRDRe4gSOsMobvRccuFp0IKQda4s4S48XSnrSfjncnCheog6YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(6512007)(8676002)(66946007)(4326008)(6506007)(66476007)(8936002)(86362001)(66556008)(9686003)(2906002)(53546011)(83380400001)(186003)(26005)(6666004)(5660300002)(82960400001)(38100700002)(54906003)(316002)(6486002)(6916009)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFnMEtLL2NMdURZWTZsdHVYL3VNT1Y5ZTV2M256QnlGUVAwcjZIRmcveCtF?=
 =?utf-8?B?OWY2bGl1a0hRbWtXRUdYbWZzUlNHV3hBcTRxNUY4Y3Qzb0w4QlpQSzZqSmRQ?=
 =?utf-8?B?NElLZlVYdjFkdXVQMDkzWi9MRXpoVnVwcGNmT05WUGV4Yi9VS3QyTDBDL2pW?=
 =?utf-8?B?eDhPSXpCY2Nsb3E5QndXRjlQSE9DRFEwdVVUN0JkUGJtNHlYNXVCZFdjYjJW?=
 =?utf-8?B?c2VqUUkyc2tGTXhhTEJRNWtNVUcvbytUWHpadWh5K2dGL2RzaklvbkhOTTUz?=
 =?utf-8?B?eFRsM01USVhoQTZDRVl0Z1YwYjZyaUNxN2hadlBUNUcybE9mNU5MbWNML2t2?=
 =?utf-8?B?UlYxZUpWTnFmMjNlaVdpVTcwTDNyRHNKMmtCem5BWUgzWUhYbmxpcGR0YmpZ?=
 =?utf-8?B?ZUN3NUlPcDduVDNDZVlET2NIZGQxdTBJNnAwaWJqSzJJOUd1Tm5EbVdKTGdK?=
 =?utf-8?B?MDZ1S0RzNVdBZEVydk1NNkZSV1dEVVE5TGdRS1ZzYWI0eWZoeGtBWTN2bUJE?=
 =?utf-8?B?aUVIK0xzelE3RzE0K25TV09nekM3NGZPWGxjbmlEVDBLZnBIYUVRSUQzNUh0?=
 =?utf-8?B?ZEV5eFdHQ3NPWVNid2dvYlhTZUxnNVJ2WmUyZTJhR3dNM1VkVzF0WldRdUVB?=
 =?utf-8?B?RVd0V3JJUkpBQktQM3RYSjVYTHNvSWFoZmdxZmg2WWJ0eWFQKzBNU1REMlh0?=
 =?utf-8?B?RlUrN0YxYld3cjQxcTg4UkE4LzQycUxqaVpqVmEvL21RL0hMQjJDeGZBTjVv?=
 =?utf-8?B?MGZvdmN6WmdyOU9aVjJOWjl5UlB1aGRTRlFWSmFDdWZ5OGxSUndQMjZ5RWVQ?=
 =?utf-8?B?TENSSGVSQ2oxUUI2MFcwTjBLNW12aUZNU1hEam1XQTlMSUdVaTA4cnRyUUx0?=
 =?utf-8?B?c2NOTmZ0eEdPRDR1KytlVXM2OEZhUWlDZlZURHZaNnNqMnJkRnZHdm1JaDJl?=
 =?utf-8?B?UFJJdHpJalAwV2xIb1c1MWZCaG9ZN1lSeGV5SHA0ajl5dVRHdm1JQjNZaFhD?=
 =?utf-8?B?WVdwRS9ldXhXRmcwNWp6alJnMzF3a1RFMGtlK0E2Rnl3dWE3eVp3a2FIakFZ?=
 =?utf-8?B?emhkZFB1c1VnNW5NbnI0S0xJWE9QdytTR1pmZTFGL3E2Y1dwblRoN1ZvU3ps?=
 =?utf-8?B?b2l6bnl6U2w4UHB0Q2ZNWlkxOXRwWkJzSG9TemZsYUFVOHRsQjFRNWppV0Fl?=
 =?utf-8?B?V01Sb2xUeWdtR1lqS2lpZ1YwRXo0ZXc4anV0STQxcmdnVFk4c3lvSm5NWGkr?=
 =?utf-8?B?RWVkc2RYcTZLR3NRVUZ5aUFjaS9kclAvWDh4eUJYK2RQWW1MeHRMemUyaHM1?=
 =?utf-8?B?NFVuOEFMWE5GaEU5cDNRYlNYVzBheDNGTExmejM1U0hPUUxLblVMVjhRUUc3?=
 =?utf-8?B?Qm1mbnRpTmFXdGxUMjdTOEcyNnJqVHdQVVEzTnJyTTQycnlpOVAyVXJQRmlq?=
 =?utf-8?B?cGg0cWtWZktKNFpCQUJuUlBkZlVDeitOcEpUa3d3aGF0QVpCbnZTQ1JDWmZU?=
 =?utf-8?B?SGQvcUNiM2hzMXJZRlU2TWdBWlp5Q2dZcGNCaStPK1RUMlNZMHJGR2Zna09l?=
 =?utf-8?B?bi8wY2Y4YUhqUGgrYUw3ZkVjaDlac21MYXFvUm5VQ2V2OGZVMVRnK05VeDNv?=
 =?utf-8?B?bXEySy9oeVhuVng2TkJSazB2NGpwVUJvMEd4QjdkOVloaU5JYVRPbmxkTWhN?=
 =?utf-8?B?NWwrSkNHaFlqb1RTMjBHeDkyR3NkV014WXRHV1JSRDE2aC8wcjFaZGtiVWFD?=
 =?utf-8?B?U1ZHRnJJUEtQZzlXQXVCckN5L3RRTlRPL1B3VDFKWjlJaFZrZmlRU1hOS3Vl?=
 =?utf-8?B?NUF5OEYwOVRrQ1ZZcGxtalJ0d3hFS2hmcUh6cko4VlZxaGVsZlpyUEVuL1dz?=
 =?utf-8?B?ZFBDNS9oS2pneVhGL091QkUxaFVYS1FnS0g2S2YyOHBHclVnamlzMVVaenFU?=
 =?utf-8?B?bkJwTnp5LytlNEVyL1owQWJwWGVYdS9KM2FZMUxzdzNUZTZDVzh3ZVJJNGJu?=
 =?utf-8?B?WXl4azA2VkRxOWhFQzFVbGVaVkptS2x2Z29WbWJRL05zZTZHdTUzSGg5a2du?=
 =?utf-8?B?b0NuYTVleFR1WVdmUTZhT0JxbU5QbFE1SlN3U0syZ2ZWNys4dHpIL0xabDBk?=
 =?utf-8?B?RzUxSFA2aktkYXcrQUhHVThCWjFJWm1HRDdzcGNxVDRCZmk3S2Y4d2JKazNa?=
 =?utf-8?Q?uR9YLk629dawke34EThizRU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9012f5e2-a9e5-40a1-f38f-08d9f1f746ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:24:20.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFcjqktg9DyucVRUUNO5BgpkEF6OOiT2PHP7+QQ4xrOaBm2fwi6zHd6+aZXCDEHovayZOwlqJft9vxYt5niF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3970
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 09:52:51AM +0100, Jan Beulich wrote:
> On 16.02.2022 17:08, David Woodhouse wrote:
> > On Wed, 2022-02-16 at 16:43 +0100, Jan Beulich wrote:
> >> On 16.02.2022 11:30, Roger Pau Monne wrote:
> >>> --- a/xen/include/public/arch-x86/cpuid.h
> >>> +++ b/xen/include/public/arch-x86/cpuid.h
> >>> @@ -102,6 +102,12 @@
> >>>  #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
> >>>  #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
> >>>  #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
> >>> +/*
> >>> + * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
> >>> + * used to store high bits for the Destination ID. This expands the Destination
> >>> + * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
> >>> + */
> >>> +#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
> >>
> >> Would the comment perhaps better include "in the absence of (guest
> >> visible) interrupt remapping", since otherwise the layout / meaning
> >> changes anyway? Apart from this I'd be fine with this going in
> >> ahead of the rest of this series.
> > 
> > No, this still works even if the guest has a vIOMMU with interrupt
> > remapping. The Compatibility Format and Remappable Format MSI messages
> > are distinct because the low bit of the Ext Dest ID is used to indicate
> > Remappable Format.
> 
> Well, yes, that was my point: With that bit set bits 55:49 / 11:5 change
> meaning.

Bits 55:49/11:5 become reserved again with the interrupt format bit
set to remappable.

> As an alternative to my initial proposal the comment could also
> state that bit 48 / 4 needs to be clear for this feature to take effect.

I've always assumed that setting the IF to remappable invalidates
extended destination ID, as the format of the interrupt is different
then and there's no destination ID anymore, just a handle field. Maybe
I could make it more explicit:

/*
 * With interrupt format set to 0 (non-remappable) bits 55:49 from the
 * IO-APIC RTE and bits 11:5 from the MSI address can be used to store
 * high bits for the Destination ID. This expands the Destination ID
 * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
 */

Thanks, Roger.

