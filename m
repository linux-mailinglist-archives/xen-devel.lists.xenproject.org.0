Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879554330D1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 10:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212849.370876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckCE-0006tY-Bx; Tue, 19 Oct 2021 08:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212849.370876; Tue, 19 Oct 2021 08:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mckCE-0006py-72; Tue, 19 Oct 2021 08:10:06 +0000
Received: by outflank-mailman (input) for mailman id 212849;
 Tue, 19 Oct 2021 08:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mckCC-0006Yr-Bc
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 08:10:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5e13378-30b3-11ec-8305-12813bfff9fa;
 Tue, 19 Oct 2021 08:10:03 +0000 (UTC)
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
X-Inumbo-ID: f5e13378-30b3-11ec-8305-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634631003;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GLt4Szb22oU6HIgNJbAD50OTivns6+Vhi+hrbxF8MwQ=;
  b=Ch1TABxVskIs7BEdrxK1phy6Z6lDiqlTt9zkxPvqCKzOKnwQeB+ZaD/V
   CmH5Oxkr9L/zFctWtaUbQBWdmWZgK+B7HerltyQXQx4rPOIMzN90LnEbP
   NkKwXorqvqAgUxOq1/GLKormMBQZqozCYMGDe4IiPoyEJmKOxCkmB7j+a
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x3jiimF6kf2hFUnrYlWnrVJAXPdteawT8PzR/RTSpfFyYC2PFlliS3Uq3ZIaa6wrBUfqP3wbcU
 Rjs6Sk7WZsHliWauxf6kA/GxV4ykjO2fLKkG+LSWWgbRBcysmUKDu2tVz9w7jG9qRc4xCOmDmJ
 d17xqCWoDwSqQOGqAf4Hf38+Vcj+k9QYKwhcW3hX0MRdoA25pxN2kpt35C/XDq3U6r60qB5mPW
 T8dubCBFysa+8FC/KcwhvkQBRN8BW6EpYIML+seo9lRpFLJrZAe8q8co6SG1QvDqwkuNVuCDo+
 bIL8iIPLfZtYDVK4vIHOV/RK
X-SBRS: 5.1
X-MesageID: 55072486
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nCUV6KzS+4NA7b0+F6t6t+fjwSrEfRIJ4+MujC+fZmUNrF6WrkUFn
 TcXXWqGMv+OZGene90iYIiy9klU75/Rm9VlTVdl+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7do2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9JAj
 5ZSr5HpcAZ3DPfRiv1FXD1+TQgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFhGhq2pAQdRrYT
 8sSdytGSznnWj1KKFEeWb5umba3pUCqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlqujOLSmSLwWKoJCaa1sPVthTWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGr5l1t1OxQ4DEXkOK+mOWp0YTf/wOOrhvgO2S8Zb87wGcD2kCazdObt06qcM7LQAXO
 k+1c8DBXmM37uXEIZ6J3vLN92nqYHlKRYMXTXZcFVNt3jX1nG0kYvsjpP5YG6mpksa9Jzj0x
 z2bxMTVr+RO1ZBVv0lXEFauvt5NmnQrZlJqjuk0djj8hu+cWGJDT9b4gbQ8xa0YRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxRMV8p27zoyT9JNA4DNRCyKFBaJZsldjBO
 xe7hO+szMULYCvCgVFfMupd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs8FyEr
 YcPaZHUo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwP/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:b7WRvKw298TAAfFlVygZKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,383,1624334400"; 
   d="scan'208";a="55072486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImN1mTlpbholNxKP/OJ6WW0a6Sh+0vM7bJ3jC2q4ICoG2q8LoxLi5DqnXO8hMzie06F9Y4I4CHL7dL49pVIKBeomUnUit/6T35PNNXwZhA1vYoX/xx2XbzLY4QucEnDX+FsHGlvTZJYJeKG3lKReAFMvffQ/LHgDBHs1RMNyvT3nnMwjpwheoMv7aNyDNCkauTLDWinFEnyycpYzO1h5lKH1u+b1qm9UUSEra/xdPu6eB0uXxIPlmrpsenHRKyfZaXgJK/Cio4A12p69lhFb9uhlS6LtyojN6MzL1YOSLgyO56WyMdf3MLzVerMF9CcSTfacW2k1+WYfOC6UlH13vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew51ff4cjuK6i/x94JRSduNg2YkJI3cjcbfYpMfKBwA=;
 b=LmJoVGBrTIGxvIlVeBKkLN2s39XO4PJFIjxoG2vsyhwqBP3xCdJNnc+/xW22clylm8AS41EfVlZXrLbX7EUjBX+I8ON6hXpiTGGeNTqdMlEi0E0X5CNmsYny8UtHaQRuzZEg78lARDeknByhE3fgWzbwp/p8R8jxuJ115xItsHBdk5eDtM4Bir6i2nm7ILn/Y3Lg5UDWH55LKdM3zl0YIRuBlflppKpEzHW0nFiISX+LBaAq/hR47tj5Q/8YHQ9l2D9gtu1WY6Ql0WInc6OWa0fioPdM5EWZPw8miDr6b1uutfAImofpCv3ihSlHkqSfpQGf/Q5llN1F0DvAT+RnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ew51ff4cjuK6i/x94JRSduNg2YkJI3cjcbfYpMfKBwA=;
 b=bcSIRc0yTE4BFBMHrySMJaWW6JBBWv28IO7PjzQnx04TJGjTvrz5BlAs+arG5rSk8BGa25/4BUSx4Rb3By1mTFssmNWa2eR77MY4uJDX5iwbTf6fYWUSa5gU7t8M5i7IyvX4ogFLGRY0t+ToTdu0tKSWFcuw19aUwvyOtXfpK2w=
Date: Tue, 19 Oct 2021 10:09:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <YW59OUi9tpnGccl7@MacBook-Air-de-Roger.local>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b50e20-4b6b-4b5d-9f00-08d992d7c8f8
X-MS-TrafficTypeDiagnostic: DM6PR03MB3914:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3914FF6D70B4FAACABEC68778FBD9@DM6PR03MB3914.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WChPp0basAOu2LQ/OsHjDZoEEPW8YgJSQBgLCwOI6s6TUtXtUatGjJsLPpwcG0GMEb56vhusHvKcE9dg5Ci2qskEN2uQcawFEaAluCjHg4HluHtgmMZ1hxcqH6PM+9AAqef+Aa2BlYioeP0m3eB/Bt4Johw9anaM1kd6EOoEdv9vTNdkd1iBRzCUDRBY6AKNm2mahbdJMjSsY7PuZ+DAQvZfc7io8LWCsYzOHrX9KVRJ7OkM9Pc8tCM/BteEYlpi0HkvJWdseNctwEnNB0mGcF9S3AxC1OL678i+UxwJskRhbKGFr4Wsaq7EqzThkUD+unBXpLLXghWhtx4sBUeHLGUyuejYiASP0OcaOo+phqz1bflB0gGl20cbystxPUnHYkQv1qX69gu5AmSUyen83bZFS9YcfTrKgW7MfQeZAvbtGoDspV5sHGwlO4XljZrML8wB7Z1ZU7l391R4v6Z0NFKoUdOUOYiHSKHUh/a7YDAQQ9yhQuTTDpk4aWaonuXZkcP6gv08U6TSxM2XEWBcMxKXN/22HOFcxTljDeKZAYQexzA7zQRJuQp0AiIu0ZZ0/Hx1h5O22cr4JefdMBSzKtUWYxkq6So/hJkwSha9z5BCfSE2no6gFhfyC2YmyuiRZR7HN16suy+FUMQQFYFFWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(8936002)(107886003)(85182001)(316002)(6666004)(6916009)(83380400001)(2906002)(6486002)(956004)(86362001)(66946007)(66476007)(66556008)(6496006)(54906003)(38100700002)(8676002)(5660300002)(508600001)(186003)(82960400001)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a252LzVhajh2T3V3ZG1sbTF3akdrNVc4MlRuRFI5ZEZ6dGt6Ykxlb09zZ0xY?=
 =?utf-8?B?QzF3bWVTVWdXVWVuRFM4UTBTaHFZd2RXOTZxakRnNWNVSWRRVWpmMzJNOHFa?=
 =?utf-8?B?ZzJ2cVJGYzc4TUR3OTU4Zk82TGFUbTVURkIxZ1NUUXVkRGhxT3VzekZaanVN?=
 =?utf-8?B?alRjNVAxYURhcDlHTXg3WDdpb0x6ckRnd3pia0JucTR5ek9FMFZkV3NKTElV?=
 =?utf-8?B?TVdCRTFjMDl1ZWFsNWs5dUhnTFNrYzBJN0xPcllZaFhkUjZTNnZzaEdsSmtY?=
 =?utf-8?B?TWttbGZ5eE96R3VTajFFQkRJTFlTZU9CS0tsbjc0dHJNemhDanh5YzdKVlpk?=
 =?utf-8?B?TXFCSFUybmRxR3JpcFMyTVRWNldZTVppbFY2a1pFNXU3dmxzdVZ2NEhiem5R?=
 =?utf-8?B?RUs4QjRRbFRYc0Z5M3ZxK0g3RFBLM3Z3WFZpcmdLREtLUDJNZlhmNzZPSnBw?=
 =?utf-8?B?YVpQcy9SUURqcFMvWEM2ZlBrUUtrL2tBVnVUVy84QkNTditDS01ZMEpETzZo?=
 =?utf-8?B?c0tZdE5xSGVONGk2bTZ0c0VzU3BlbkJxR2Rscjl5NjhDNW9RU09rZms3WnYx?=
 =?utf-8?B?TEdpTVJ2aVgrRkxYampUNG1ZeXF6WjRqR3QvcDd0RlQ5M3F3Y0VtQWZYbFRN?=
 =?utf-8?B?WDRIVThjYklmOEdYZ01meVlPTXYxamNZSXFsbWRacDFaei9zSG5ySnpyMUlH?=
 =?utf-8?B?MStBaSt3dkNuZ2RRZXhkbGVHS0tvRXFGdEFjZUFIQi9OVFl0djM5MVY1V2h0?=
 =?utf-8?B?SmpJS3RQRmJRYjZJbElUUEx2Qml1YTVKeXVrT3NIRWVxR1BoeitLbE9qcjJw?=
 =?utf-8?B?TUNZWmZ6dTc3Sm8wOXoyVWl2U2hCODNON3BpdTYxcFdOeEFKZU9jZVVkQ0ZJ?=
 =?utf-8?B?Sy82QnFUajhWNWdJeW1ucGhGYmdmM1pEc3Q5TUFJd25VWENhVzNQSmdyc0Iz?=
 =?utf-8?B?M0J6L0dwZ2IvZjFIdEZTTEs5OHN4K0thSWJOcjdRR1VUdytzQW9FdE4yWW90?=
 =?utf-8?B?VG96TWJXSmNCdXorUlFBMlRTdWpmYVhvb1JIMkY1NHpZQ2l6Q0grY2ZtWlRz?=
 =?utf-8?B?WHNwZExTQXhzeGVHdEoyeG1sVjNUa01HcWpJemluR3ZIV1orK2hpaHlGMUJ3?=
 =?utf-8?B?NDlmVVMxYzRlVzh1VlBEMXEvKzFyWFVrUmV1L0o2YldzeHNBVGlXYTlIdlhF?=
 =?utf-8?B?ZjJvVlpFeFFEbmx4aVRtYjZaVVVBSWRSNjJTSVJzQ0lzdnNta1FpVkYzMko2?=
 =?utf-8?B?cWUwRHdOZjVvdzFqK3RXZk82aDd6azBuV3dkb1d5Z2RQVnVjNmZBaHRSZHY4?=
 =?utf-8?B?QTlJbFVYUVVxaUttYndYLzZHa0tBUXRaL0NodHF6dEp0L0dtRTZvS21HeGxz?=
 =?utf-8?B?a2RuZUJXbDNPZmMwcHVQNndkbXRraFBldmVoMndEVzE0M09TeGY4bEtWMGdS?=
 =?utf-8?B?Q0lyb3ZHZWJtVUpSN3lRUXU1WUtYY1V6WjFFanNZRVQwNHkxa2NQYjdndlZs?=
 =?utf-8?B?ZnU5cDQrVmFtYjZucXFQN0wveVBVT2xGV1RqRjhudGpocy8xT21HZ2ppd01O?=
 =?utf-8?B?OFdEOTh1UU1ZSnhwRkJXVm5lUTV2SW1XTHBFcjJ4NllEZm96dU8wdjhlREV3?=
 =?utf-8?B?czEvcGlvbnlaM0lBWGJsTDBEZVpKdkUzQlNUNldMM0NDN0NLdXpBSTN4ckdO?=
 =?utf-8?B?NTVHUXBnRzlqR24zM0VjQy9kUmhhOVlVbUhHb1BVT1JlaElYREd1SXM0OGFQ?=
 =?utf-8?Q?+EFtfAYWPFI/isk/knM8r15EZ01/23pwObsQQ6f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b50e20-4b6b-4b5d-9f00-08d992d7c8f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 08:09:33.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atZWFm6wUNewYRn07oAgrw841/0fiAX6r0YimQhIW5IJnP611YX8t4EHMR9FeXzeNBNT1ku3LtlRa6afUjhGcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3914
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> order violation when the PoD lock is held around it. Hence such flushing
> needs to be deferred. Steal the approach from p2m_change_type_range().
> 
> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
> 
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -24,6 +24,7 @@
>  #include <xen/mm.h>
>  #include <xen/sched.h>
>  #include <xen/trace.h>
> +#include <asm/hvm/nestedhvm.h>
>  #include <asm/page.h>
>  #include <asm/paging.h>
>  #include <asm/p2m.h>
> @@ -494,6 +495,13 @@ p2m_pod_offline_or_broken_replace(struct
>  static int
>  p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn);
>  
> +static void pod_unlock_and_flush(struct p2m_domain *p2m)
> +{
> +    pod_unlock(p2m);
> +    p2m->defer_nested_flush = false;
> +    if ( nestedhvm_enabled(p2m->domain) )
> +        p2m_flush_nestedp2m(p2m->domain);
> +}
>  
>  /*
>   * This function is needed for two reasons:
> @@ -514,6 +522,7 @@ p2m_pod_decrease_reservation(struct doma
>  
>      gfn_lock(p2m, gfn, order);
>      pod_lock(p2m);
> +    p2m->defer_nested_flush = true;
>  
>      /*
>       * If we don't have any outstanding PoD entries, let things take their
> @@ -665,7 +674,7 @@ out_entry_check:
>      }
>  
>  out_unlock:
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>      gfn_unlock(p2m, gfn, order);
>      return ret;
>  }
> @@ -1144,8 +1153,10 @@ p2m_pod_demand_populate(struct p2m_domai
>       * won't start until we're done.
>       */
>      if ( unlikely(d->is_dying) )
> -        goto out_fail;
> -
> +    {
> +        pod_unlock(p2m);
> +        return false;
> +    }
>  
>      /*
>       * Because PoD does not have cache list for 1GB pages, it has to remap
> @@ -1167,6 +1178,8 @@ p2m_pod_demand_populate(struct p2m_domai
>                                p2m_populate_on_demand, p2m->default_access);
>      }
>  
> +    p2m->defer_nested_flush = true;
> +
>      /* Only reclaim if we're in actual need of more cache. */
>      if ( p2m->pod.entry_count > p2m->pod.count )
>          pod_eager_reclaim(p2m);
> @@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
>          __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
>      }
>  
> -    pod_unlock(p2m);
> +    pod_unlock_and_flush(p2m);
>      return true;
> +
>  out_of_memory:
>      pod_unlock(p2m);

Don't you need to set defer_nested_flush = false in the out_of_memory
label? (as you don't call pod_unlock_and_flush that would do it)

Thanks, Roger.

