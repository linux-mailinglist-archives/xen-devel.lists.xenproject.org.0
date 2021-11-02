Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751B443220
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220387.381662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw7y-0005mH-2j; Tue, 02 Nov 2021 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220387.381662; Tue, 02 Nov 2021 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw7x-0005kV-V4; Tue, 02 Nov 2021 15:55:09 +0000
Received: by outflank-mailman (input) for mailman id 220387;
 Tue, 02 Nov 2021 15:55:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JXc=PV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhw7w-0005bK-ID
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:55:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d62b414-3bf5-11ec-8559-12813bfff9fa;
 Tue, 02 Nov 2021 15:55:03 +0000 (UTC)
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
X-Inumbo-ID: 3d62b414-3bf5-11ec-8559-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635868502;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kqD9D7+LPMzvZtTD206Tv/tD42dAz+jK6x/VQv9lAQM=;
  b=RjyflibEf1/PFPYj1hoiaTCcWhI1aoygikYtV5C5lzfFwvhLO4NTy+5a
   5nnUG/jVdqItFwIpCQlBKxptZfEOttCIPv6y2siwceCSAmAsgkuXnlF5Q
   IC6e8hN1ToPeN5dvmIDlj3xDv/1MGFHTHoVUh/O89VBzGyzXzU3vQdvTV
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6Tapjj80L/6x0e0rU2eN9hznpXAS2VltBU2a9BrYp0QL2zakti7ApBW+L8exLQZiCCsgAlWRMA
 UruaB6+7HyhUv/+T+AorZht87uNr2i8J22k/4IcQXERx3B9EFN3ZaJE3xOG3eE0jaY6W8CFY3E
 8FxKU7NvIuJtz20PI3aKRMElKepn4tdBbj5532m6WIc6YLbvFK/gtUy/2zShhT90lupNCXO87b
 yQG+wJTiYlzpBU4RvBYQ+eCQmo/kvbb4f3LwOOit3towl3c+Yqq0HEDFhJec+T4MBvGzlypWUL
 lBZbh/l8ZBU/5UiIwshgawbQ
X-SBRS: 5.1
X-MesageID: 57288542
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IYZr4a8nAOUPUA8csDd2DrUD3HiTJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYZXWuFbvbcZTDzKdAkOo3l/EoP6JDWm4RkGQtuqiE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdh2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhT0
 4V2k6y5WDsZZKDUl70gDF57HTpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0RR6aOO
 pZDAdZpRAn6SRZyB15OMc8Bst2ipD7SSBFmiGvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/W70HxUbP9y30iee/zSngeqntSHmXIMfEpWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwajvHeOsxoYWtxRO+438geAzuzT+QnxLlYDSjlNedk3rvgcTDYh1
 kKKt97xDDkpu7qQIVqc6bW8vT60ITISL2IJeWkDVwRty9vsuoYolTrUU81uVqWyi7XdFTjuz
 hiQoSM5hrFVitQEv5hX5nie3Wjq/MKQCFdouEOHBQpJ8z+VeqaHfNyTz2jS/MpwdouBQQC84
 z8nldORubVm4Y62qASBR+AEHbeM7vmDMSHBjVMHI6TN5whB6Fb4I9kOvWgWyFNBd59dJGS3O
 BO7VRZ5vccLZBOXgblLj5Vd4ijA5YzpDpzbW//ddbKiibAhJVbcrEmCiaN9tl0BcXTAc4lja
 f93ku72VB727JiLKhLsHo/xNpdwnkgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZDXlEQFCLKkOHCLmWL2EbzsBSJibXwRg5cPHtNv3yI8QD1xYxMv6ep5E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLM9vSsWJEhStjZ0QEZA/ws1B6ONrHxPpPJvMfIOh8nMQ+nKEcc
 hXwU5jZahi5Ym+coGp1gFiUhNEKSSlHcirXZHf4O2djJ8YIqs6g0oaMQzYDPRImV0KfncA/v
 6ehxkXcR58CTB5lF8HYdLSkyFbZgJTXsLkas5LgLoYBdUPy3pJtLiCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXl1w2HHjCY1mxJKlnJ32KgZtGuqFXn+cLsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRyjtiFt/beBXUFDBDW2iXRQfOlvLYco4
 eY9o8pKuQaxvQUnb4SdhSdO+mXScnFZC/c7tosXCZPAgxYwzg0QeoTVDyL77c3da9hINUV2c
 DaYiLCb2uZZz0vGNXEyCWLMzaxWgpFX4EJGy1oLJlKonNvZh6BogE0NoGpvFgkFnA9a1+9TO
 3RwMxwnLKqDyD5kmcxfUj3+AApGHhCYphT8xlZheLc1lKV0urgh9FEABNs=
IronPort-HdrOrdr: A9a23:Xzd3AKlKGjHOjBHieIaiGtOTHHTpDfO8imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IObuEYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Gm+yVNNXh77PECZf
 ihD6R81l+dkDgsH7+G7i5vZZm8mzSHruOqXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6S60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKcQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOifx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Ss1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgv/DWVZAVwIv66eDlGhiTMuAIm2EyRjnFoivD3p01wt67UEPJ/lq
 P52qcBrsAGciZZV9M6OA47e7rDNoX6e2O7DIujGyWUKEg5AQO4l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="57288542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxORpTAh+SXrv82SquiiQZJ2gbKhc5pQaNc0qtRgAoi2uZzetnqkM7SsbpzAjPbmikzvDOGI6lMcIMOHOXrt9NZPliHTRQblHDyAG0j0BursaDGoj80FfegKp28rPPza7XobEJK079ziJUOlpqWF04Ymmblte/VEfD706FSLwAPppadsDrSVPIn3z6T43OcEMXwlTgoYdw81HWljJm66rmqWtj7cS998wYZl09rHnwEDRRFcUHzsAdHccVw2ai4AjdNZyCMVJUJG4x9tJPIE4ZC25+p1V7OYjdjy31ViDmJ7Fv46fiGdh7zfouqnwhz9BT77AaH5za1GXt6h21NhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqD9D7+LPMzvZtTD206Tv/tD42dAz+jK6x/VQv9lAQM=;
 b=R3rHBRXeTZ8XuS/ax9xibb9GjctI0A6FojybgsVuY27u8CY9itYI7VOOt1vNIt5UHMeD94oTkVPHof4Ng3SQKqZV+zQ/kS5y2QlPsma73fL7sPBT9r3gf/EtcR+DPJNEHfywMgt+sd1Uzx+dbLdjzsNhlvkCeMTf3zegyfLA+OoGRBywJA43h1qGTpG5E63aPbuIE3C0YVJgCk9b5ZpUvmpkr7XqU/w+hdrglK2Fqectj/dauM4YmdSGh+CcadMSvPb6MsiPOFlCYj5I7sg8fAQQifqE4BdgmtqDAe6UscCF2WNrkOQRkma1Z9RBOEmFwbHG05sR9cFetYZql2vLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqD9D7+LPMzvZtTD206Tv/tD42dAz+jK6x/VQv9lAQM=;
 b=GKunzs7beCgOyZ7mhcqnJwkAzZDaqABqII91Ajfp0jr//ikhoBmqxj+jjrDxRiXJ0mTHq4ro3gfWk0w0SK0onxu6b/SvBYj+nGjEzlKU/k4OoJryOaI3kFQwsmVp7KGIK0k7pHkPlSkeZCLwLGAe+Ecag2lnqUf4RJit4U0sDEk=
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <YXz579WNpHe7aO91@Air-de-Roger>
 <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
 <4dccbbc9-0235-5cd5-1670-13bd51fc8b6a@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <858f0cf0-be30-f57b-fd8e-cad3f83beca7@citrix.com>
Date: Tue, 2 Nov 2021 15:54:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4dccbbc9-0235-5cd5-1670-13bd51fc8b6a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 919dc686-b832-4420-f9e2-08d99e191eda
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3622B8838B355AD2C9334421BA8B9@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Le/Q2BDdrzXSuQKFML9iDRtZX8ZpaelVcpMFoeeilzBI/kotYuA8Sn30yCffbq8F2g4h1RdkLTRoQ/bnNfcy6jbgonORznx4aiB9ugzx5QpNnvCsnzfU7BQXy0Zopfkm/y3sKjxZq+l8iE3KSi5munnmvBPdjeZZj/kGSfQn7Zb6P/mpY97CEMSg2CjNvu+7SPfIFZm1IYWiLWW8RXQhI5+vtpe8oFy2ppCaeu/055IsP5vImG++i0tafwzvpKLgXpfIhwBDgSR2oHITS3nx2VXrdwd/vcQyai0fJ7AqfVW7Bk9z4YnS9LUy9aZ07vcm5ioKrtss1EHXzZLwDKZlIVARw2dbQNuc/5d2JA5RUlJChH25v4l6TFvm9XFBIjX3SlwWaGqmHbmAV/t1WOmmBx0ju7NOsA6zw3vZ+3yOGdBa0PqZ68hrtB0nu0LESFApaIUYTCIMQYPvYk+67eLv4guUOLYpuOkQVyXnkB+Tx28E5aPbXwykGJQzAOgqKimybO+qdhiCz0/9uYwkr9/SXj4Wt/irfrKAF9AmSXxRbtBttPd1YsXNvgFhZ+V2pkH9q5awzdjZoqaMVtwis8Jw7USgEL4ffOOKEdO+l4Rv8glgInHimWA4+M0ycBSuTJGgv9OAm+OUWAosbTQNkB2mprYeE6DjQG8y6YHc9K35zbuDb6f/KxjHjLE/eBlslKk6WJe1K3+TOnqZjDJfA2SKKrlfoTFdj1lbXC+mtgzTjcIiWpzIaDbcXr/4u2hxthcA1bOKtoA7y4WHLmjKD0MZHuxyJLeumJTj5jgI1X4PXfQ9ufBzWH/72if56CSzYB+J3ICnZQl9vIThTVqpqfI2qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(36756003)(5660300002)(2906002)(38100700002)(6666004)(53546011)(31686004)(4326008)(86362001)(8936002)(508600001)(6636002)(6486002)(966005)(2616005)(66476007)(31696002)(82960400001)(66946007)(316002)(66556008)(110136005)(54906003)(4744005)(8676002)(956004)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRzVGVxcjRjNVpGMzNrVnFIUTcrSzZ3RjFvUXpCWWZFYVlXL3ZZWnp1RjFH?=
 =?utf-8?B?b0hRemFyb0wzTGRSdnFiSFVGUHI3aFFLNmRBVmpBUllZYnFsenFaTXJSWkdh?=
 =?utf-8?B?THhvWnZQMmw3WUQ4bk9wWk16MFRpcnU4RndaejdvUkxHcnhXYk1MNS9YdU5F?=
 =?utf-8?B?SWN0bUNqa3dZbktWSVhzb29rTHovSVFJUnhQUGhSa0ZHL0dwZk50QkVrSFdQ?=
 =?utf-8?B?VzhvdXhjdzliRzVhUkJjZWRYeEQ1UEpNejNaRFU4V2F1dDBEYWJNNld6WDcr?=
 =?utf-8?B?VDNzVGRnQ0FTa2J4V2VzK3hBS3NZZWVPVWpsYkpucUVVZ3pOOUFYZURjMDNi?=
 =?utf-8?B?amM5eStBTlpXL256Qm5kUDl3UWhyVHlidUcyREVGeDJkbVNseU5hZjdEcWUr?=
 =?utf-8?B?RTRCNmRuUTZCNElkVDBYd2cvUlBnYkRPUmFQTkYrZmxBb1oxbEwrSGg3NWVx?=
 =?utf-8?B?dVU2NjZWN0toUmZqVURuc21qMjZCOWQ4QXgxQkEyQkdqK1NsbzNsY0FjWHEz?=
 =?utf-8?B?bDlUVVVrOWRTZVNaUmEzME9PZFYyMUc0NnlueHVXcTIrREhiZGVzQkNUdW5H?=
 =?utf-8?B?TllvSWltd2hRWlNsNnY4V25pTEVzQVBJRFYxQTYzWit2RnF6L2dKNkhWb3d4?=
 =?utf-8?B?UmlyNDZSVHlrSWtNbFMvdEZlclk0NGJ6aWllUUtCYTZZNEdKTmVqWjRCWHdw?=
 =?utf-8?B?VFMySTNmM2J6cmozVXRKMUhxOXptTVdRWXJPdkpCWFZ4TGUzQ2NQYzhnR0pW?=
 =?utf-8?B?dlRDTGN5by8vZ2REb2Z4dEQ3OWZwQUIvVkM4OGNMbGp2RTVEVmdGbmVBNmFU?=
 =?utf-8?B?MjR3ZUkvQzlpTzlFWUx1clNSRTZ4TGxCRUJDWHE3NTR5cWxkZXg0UHdRU0R0?=
 =?utf-8?B?RzdkNGxGYzRneUNRZENVeVpUV0xqUFhvZTFNMmthdkVuVTFFSEMzaThzcmlJ?=
 =?utf-8?B?eUFKZnJNMFEyU215YXFCMkI3K2tDU2dXeFJGbE9Yb28xYUREaGNFREd3MEZT?=
 =?utf-8?B?eHMwZGlRMjFiRGJvaWxBQkpYbU1MZzFCRE9SSVkzbXRFUHplcWR4SnlqNUc1?=
 =?utf-8?B?TWEwUVJRYjRMY1NnWnhzbFBuRW1hcEVHSXlPa0FTMFptbTM5bE9NYjAvSWlK?=
 =?utf-8?B?QU1EekVmNVJvSjFlbUFlbGRlVUJOMDcvRXhyeWtlM1VVRWhOMkZXV1hGK0ZF?=
 =?utf-8?B?Vm8wK0IzVHBCVERRVXI4MitSRkVwaW52TmJJODBtSTFSWW93cGpQMCt2bXFL?=
 =?utf-8?B?U2FxMHlUUzgrRHJIeXpCODZETGtlQWw2TWpJUk5nTk5zZ2cyOFFXdWl6U213?=
 =?utf-8?B?L2JBVlk0RFM0T25kQ0NVRjRobkFnYVpqZXFERVRYMm5ZMlBwbnZyellKY21L?=
 =?utf-8?B?RVBnNDhnUWhkeS91eDhhZVRRMW1VZWc1VWJpL25mRVpmZnJZTEN4VFhCdTBV?=
 =?utf-8?B?SzVteHQzL25kU1lkUXRwN2dvTzVNdXh4bzZpbUpZc3Y2elJvQ2EyR2RXUkdv?=
 =?utf-8?B?Nk4yMERRVDg1R3BDTGRpNkZucGdzTEQvTlFxQlZmRGVoWVlLUE0rU0VTZ1cr?=
 =?utf-8?B?VVFZZ3prODBZSjlZSUVSMElmaFNJa3M0MmVTTjYrclltL0RJY1lJZlZhS3c0?=
 =?utf-8?B?TGxHZnZmR2VqRzhPWHZXTDhmTHRvcGVNM043eWVwZTRKRDUzTVBKQkl6eFI2?=
 =?utf-8?B?T2xZUUp6RHlCQlQ1ZGxHMmpneUdCcUdjZUUxeXdKZHFIdmd2YURyaHY1eGkz?=
 =?utf-8?B?Qy9VZUlnZkZMWnh1eWpqdVQxQ2VWVkc0NStZY3BGSTZkYW5nbkZBdm9rdERS?=
 =?utf-8?B?OW1VTWwyN2FFUlAyZlZBSktIZG1tcjRKdlFYWkJjMlZtM2VuKzk0WElTbllm?=
 =?utf-8?B?QU9Oemc5c0wxRFZ3Q3RYcUxzZHd2YTlxa0F1eU5PM0hKbXNybmN3bGYvYS96?=
 =?utf-8?B?UFJEMWtWQThpbDBaTUxlK1lORVZtbDJZQkdMM2VaU3ZDOGV2ZHVMUXMzUWVK?=
 =?utf-8?B?R1NKUGtpYXJESGVOdk44dUVoaEVvc2dsRXZCUlo4NEhwSTZHTUYvbzRGOEdH?=
 =?utf-8?B?WTN5MlVXSHlKU1Zya2VWYityai82T3lXVW5MRHF3djc0dXpnQVMySEVVV1Vn?=
 =?utf-8?B?dmNRNkEwaWl6S0NwdWh1QnkzMlJDQW5UV3ZHUE5SSUpicGNkZXQ3S3BGa3BY?=
 =?utf-8?B?UlYydW9TZXlkMS90YkpqVnNEcHUweDRXKzZ0bndWOTViOVc4cWtZeWl0d3da?=
 =?utf-8?B?Z3VUQlM5YTJia3QxcGN2dWJpdU53PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 919dc686-b832-4420-f9e2-08d99e191eda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:54:58.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDIYq8yLGCLBApLUnbtYg1q8vtW61Uncwh4fxWsHjT4RsZ9R7rA98G5dcc3sHP7ApKb9e2XQvpQPDuvNN0TOWYSw6gJCepwQ/fBAVirgF5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-OriginatorOrg: citrix.com

On 02/11/2021 15:00, Julien Grall wrote:
> Hi Andree,
>
> On 02/11/2021 14:34, Andrew Cooper wrote:
>> Same too for
>> evtchn, but we've already taken a patch to knobble fifo support.
>
> I know that Amazon submitted a patch to allow disabling FIFO [1]. But
> AFAIK, this is not yet merged because of disagrement (?) on the approach.
>
> Cheers,
>
> [1] https://lore.kernel.org/xen-devel/20201203124159.3688-2-paul@xen.org/
>

:(  I honestly thought we'd fixed that.  It certainly needs fixing.

I'll see about adding suitable evtchn abi indications alongside the
grant abi indications, but that will have to be tomorrow at this point.

~Andrew

