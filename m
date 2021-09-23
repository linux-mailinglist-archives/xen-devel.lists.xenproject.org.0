Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC90416707
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 22:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194591.346680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVoi-0006fM-Vr; Thu, 23 Sep 2021 20:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194591.346680; Thu, 23 Sep 2021 20:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVoi-0006bs-SG; Thu, 23 Sep 2021 20:59:40 +0000
Received: by outflank-mailman (input) for mailman id 194591;
 Thu, 23 Sep 2021 20:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVYu=ON=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mTVoh-0006bm-29
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 20:59:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d683472e-d474-4231-aeb0-6911f734e160;
 Thu, 23 Sep 2021 20:59:37 +0000 (UTC)
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
X-Inumbo-ID: d683472e-d474-4231-aeb0-6911f734e160
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632430777;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=16Ef2jl80sOM5zhrzx/z6n+coMQrh2Uz54KD8xBEkPY=;
  b=eDOUFxyF/0sNTSnpkgxI+vhjd0deYf5doGwiDE1NMQABoavNSk0QSWoa
   R1Gt7ndGyQKitIWkcy2NqQQog6BiS5OJeOONOZmpXx/2NwF71ZJstqIuN
   w/qCWZqgcNCscShhxI6FmsuD/KRvlhSVyeP2H3pkE7DkwnwdinQP0ZhVL
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kfEWHmL5/7mwAxt12gGwBwI3BWL3ne4EBCOHBmVHObFZ5poTg+MdfrY6Y+uSbThsPVcLXJxGAd
 6gJezyA5+3rwlvg590IXI6JiDUdw5hBLX78x9hvcu8cgYg8cjU4uuGHzlKxDLMmuP+pEn/mAl7
 AZiQ0P2/hq41913btySXFwvcGHFoUMUcSBM2wrRrKuomSDx5q40PlFg2JnMQ303aZ0lw0wPlv4
 Pi9smCM4UWeFOfoAPUEPSDDUJbOFooY91TUNAkjX9w5iKqtlQoSHXyG4z43BryPea6DjW6fEra
 08vKLa7QyaUbMSr41wKbLHsY
X-SBRS: 5.1
X-MesageID: 53083837
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SnN8k64KSKgLovPOyZyUPgxRtFHBchMFZxGqfqrLsTDasY5as4F+v
 jQaX27UOKzea2fwedskO42/80gE6sOGmIVqSwNorCo2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NUw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 8hDtp2CRw0TYYLJhelFWh10A3xZBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTRq6OP
 JpCNlKDajzpRSEIFAwxBKsau8z4qV/1LQZY+FG88P9fD2/7k1UqjemF3MDuUtuOSMZOl0CUv
 FXa7n/5CREXMt+Y4Ted+3fqjejK9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydG+jkO9QM5OM
 Ew89S8nrKx0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN47sM47QxQ62
 1nPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqeissXQYDpd75r+kbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6Sk/3jXjjS0vJ/LQwUpoALNUQqYAhhRPdD/IdbysB6CsKgGfN3xokS9U
 GYstNWQ7+E8A5u3ywOIXehVFbWF96uiCWiJ6bJwJKUJ+zOo8n+lWIlf5jBiOUtkWvo5lS/Vj
 Fz74lwKucUNVJe+ReouOdvgVphzpUT1PYm9Dpjpgsxyjo+dneNt1BpnY1KZl0vpmVIl+U3UE
 cbGKZv0ZZr25KIO8dZXewv/+eNwrszd7TmKLXwe8/hB+eDFDJJyYe1ZWGZilshjsMu5TPz9q
 r6zzfeixRRFS/HZaSLK64MVJl1iBSFlXsqt8JQPLbDZc1sO9IQd5xn5m+hJl2tNxfg9qws11
 ivlBh8wJKTX3xUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSdzH0UvrTLNuJeNP3LU6lZZcF
 qBZE+3dUqUnYmmWoFw1MMiixLGOgTz23GpiyQL+O2NhF3OhLiSUkuLZkvzHrnJTUXbn6ZVk8
 9VNFGrzGPI+euirN+6PANqHxFKtp3kN3uV0WkrDON5If0vwtoNtLkTMYjUfeqng8D3PmWmX0
 Ri4GxAdqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6AUnu1ZtAK6V
 1ih4N5fPbnVasrpHERIfFgub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4adp3z
 /0gtcga7x2EpiAratvW3DpJ82msL2AbV/l1vJ8tH4K22BEgzUtPYMKAB3auso2PcdhFLmIjP
 iSQ2PjZn71Zy0fPLygzGHzK0bYPjJgCokkXnloLJlDPkdvZnP4nmhZW9G1vHAhSyxxG1cN1O
 3RqaBIpdfnfoW8wiZgRRX2oFiFAGAadqx74xFY+nWHES1WlCz7WJ2onNOfRpE0U/gqwpNSAE
 G10HIo9bQvXQQ==
IronPort-HdrOrdr: A9a23:BMWM6KwUqstIo8Q4VABeKrPxu+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYfcegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6+HjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoF8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4kYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqL0wxhlMfheBEY05DWitvGiM5y4uoOnlt7TFEJnIjtY4idixqzuN6d3FGj9
 60epiA2os+F/P/wMpGdZA8qPCMexnwqCT3QSuvyGTcZdM60k322urKCZUOlauXkc8zvdYPcK
 qoaiIviYd1QTO3NfGz
X-IronPort-AV: E=Sophos;i="5.85,317,1624334400"; 
   d="scan'208";a="53083837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxQinuiTKGoB4ZGWEWVzXfuQ5XrtakgHAWZiJvox3JZ9/PCRj4tcV5haall2nheFhkqxFS8oyEDCOMAer5pPH7Qp4jrXHqwZ/QwP5z+miE61mmXC7axzViTCm1Es52lBX+KUoDpjuKFKt9V865tmu4TMz6jlQ5BDNkbhHE7oJwN23kDYqUMATxwRyCq4unIqmM0bjt+mc6YVAR0DgnlnH+iUTzSlWeg/d3YuXNifCvJP5GaCyQ94nZfr/BA5hQzmHCemIhqzDD+FOsDiZuotxzLYh//olThRTw2tJUziqEmWnqovu1bUNfaeUvTQWxBnfpSMXf7paByN9OGcJf37SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=16Ef2jl80sOM5zhrzx/z6n+coMQrh2Uz54KD8xBEkPY=;
 b=eLuzP/VefyjfW4p0g1AG8pCtBZOJxkqLLxgCQKKKNvDtLcv15qR9w5fr9zV5PaWyh/oAwS3+NSi9RcMWhSNnj0E+pFEy8RSLsj8BrrXKmpIVg3de6nEXXUI+UrdXdV0FBLrnUQ7hAgdi77HyNjv3a2sETOnVnkfURcQfJngfNqh1Hcyyb1ztdhGKRq81G7Yo9081+qt9z5M9FFGhteI0lOHvbDga+32dBOCwNgkiGTmrZVxRBQ0sZdO9zFiIqWpBiuHi1Pgl2exs1Wg7uyKU7ksasRBWPH2LHFVCPa2j+WONf/3uou5OlPpHnnzvJ0PMfLkd0OE7SIqFSKuRkZmzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16Ef2jl80sOM5zhrzx/z6n+coMQrh2Uz54KD8xBEkPY=;
 b=cGTe1l1O3IyG9BsMsaajuQTeIE6rnMLicYROQQqLKRlXarISXjhCRYj+EVf+TDPUrX5LuwYTdNl4k+mvNE4KY5t3JNaPwh4LTl1Am0XSBtbHCLwjCn9j6vWnTaki9cevuLV+4gH3+lDEXKLmUX4qOcx4urrjIeVZlRroLXxa5m8=
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in struct
 page_info on Arm
Message-ID: <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
Date: Thu, 23 Sep 2021 21:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f4b9f1f-b6ed-4884-020c-08d97ed50bd8
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5567D2BD200959963F1FE1B6BAA39@SJ0PR03MB5567.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5I1Bky2EQmnvG8ke4V7pTPMTEkxCW6DYQhnmBJV9BM9lGoNDGMPeWjKGKgPc22JADwqybJa2xSY4O3sLXs+diyF+Y17EZAAvG3/xC7gZPFYa059PYdYlSVTn0ZZhmPnaOyXDehyFKRBb+SwkcdbEOhdA/0bqr+UluW8y8qT+TXm/h0cisH+iqunu158QVe6fO7VCZlFU3Blc5AlwQrijLcIXq45/UpOFATPtwrLEiP0s7pwC/PPvRt8e0aA7xAT4vwJtF+t9cxu1cWTBN8EK0ix2Mrkf7A6uFlZz9f2t8pZP4GnVGZ3jDwG8Q3pOlYd08E0fRd9qBsHWo9rGKU8bPovuvYZ+4DuYtV4Lm5fCVFrA//UOJQ4Y9eBSO3OtQ+xEKye8lPDpZRHXpXKP2Y2j4LH81AWRKXnuv27NpuQwlaZcSnKy9dX2L3S9TJwchHHflsQZ6lHIbsiCLarM+jy4wjQMtqmrkzMchV1KBTy0jpPRub4Q8bVuEIEyNgvM5bHRNYvcBQ6SuyQIST8ifFEUyI3ckedo8HJRsyMfxoxdHjXE+uAsiwnvJMyYU9QmFihPxUYFhS2x0R9mC3S66h8zZOeQx1s1kFdRT4H+S+jV9EwBqs7Ot70wfZEfLVl9Kbtgg3orODEmHwpXTtEKMbyejYNDFIZGpUpKZtyIZEtGwMHKpGZXO7C2r8PqDFk3XRTvsfv1uy82he+11plUZ14MklvNirD/9jyKKPuW8R+JdsEFRMYGX8uKqUk45p55D/L7oAz+Fl7antyt/A+uX1R9Wb+hw59hGBLzjcEjU1erH4Gexu3LU0/ncZSxv9+LvGHh6cYODM0rmECHPE36+PrM85xzHI6NtdOutIANkc2bGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(16576012)(54906003)(38100700002)(956004)(31686004)(508600001)(316002)(2616005)(26005)(966005)(2906002)(8936002)(5660300002)(83380400001)(55236004)(186003)(86362001)(66556008)(6486002)(4326008)(107886003)(36756003)(53546011)(8676002)(66476007)(6666004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1dOd0NsR0FUYzFVVmhtU2MyU0gzY0ZWMURFL1h6cVU4cUdLUG5BcEVhaS92?=
 =?utf-8?B?SUI4WVozcllIL0NZMGorS1lMN2dkYjJwNWdRL2FYd2R4cHJWVnNGdUNCeC9L?=
 =?utf-8?B?Wk9SLzZwS1RhaWVZNEtoR0NwM2VLdGt2SDlVTmpCU1NrN2loSjkvMWswQTBR?=
 =?utf-8?B?M3ZpWXE1Y2lZUUxyclRVUzBQdElzU2FRRjRiQXFJK1JiVExGSDhHOFlabHE1?=
 =?utf-8?B?WFR5SVBjcENmcEtPVWY0UTJYbDVMcWFZcFQyM2pudkF2a0IyWHJhRUc3cTQ5?=
 =?utf-8?B?YSs1bVNmclRsWk5odmdEVUZXQ3NyR3RKRHFpSmMxVFRtUFRvNUUxaTMySDds?=
 =?utf-8?B?bU03Y2VEM0VwQytSalRXbUtkTFBtYVhPWVVIRkdCQmRoUGZIelNxOUhZU0JX?=
 =?utf-8?B?M2NyNVZuYWp1cFAzNkVZNlFLQWoxRlE1Q0pOOGF6eUFUTllnK1NnM2FvRHBw?=
 =?utf-8?B?ZFduMEJYZXBFbHA0TnVNYXNQbFI2UHAyOFpZRkYvc2t3amw4YW1NQm4xZFRq?=
 =?utf-8?B?RDNsS09Qcm5xU3ZJbjhhQitHb2FzdTNQbFpyazkwa1FGRkJvMnhHQjNEaXhE?=
 =?utf-8?B?cTUveDBYREJHbmllUUUwOWxEeEV4Nm0xMTRPOWh0K3BwQU1EL1ZTSnNCdndx?=
 =?utf-8?B?cEV1V2x2enNMalpQT2NMVmM4d0RGcE50VzJRRUhickhkTmc4dWZvc3RaVnVw?=
 =?utf-8?B?L3IzdkhqNGZRNnVSdEdhN1h2U0xKZTNIQ1pYZzBoR3ZvUmFSMmt0aGlwNVdZ?=
 =?utf-8?B?cTBuNUxoNk5xOUFzSk9SWFJXdTlQOHhZRCtYWW1ZcWo1cG5hbm9VZnkzZEl6?=
 =?utf-8?B?d2E0TzI5STl6UUhCZnp1WHA2YzV0eEkvTjVMbjIwMmsxYU1HWmEwR2FSdStO?=
 =?utf-8?B?Y25seTZ4WVVRanAxc3NmczI5MUpBbm1XVGRTLzhDUlVDS2ZmTHJZU2pTeDFz?=
 =?utf-8?B?R3VZTitONzFHN3IrZWZkeXk4UWt6N2I1aXVJd0hmcWVENmEyNjRLTGxSQjgv?=
 =?utf-8?B?MmE1cGhyd3R6U21qSmRwMU9vRUhSbjYzUUoyL0Jtd0xhUkY2SHliWVpoV0p1?=
 =?utf-8?B?M0t3VWRzTGgrSHdJakxZaXRFMTcvaVk4RDZWZXR6cWFZY2Z1akU1RW1uMjJK?=
 =?utf-8?B?ejRBU1h0M0hiR3dvWlIvQ0RsOVN2UFNHMVRuRkExR3RhTlhHdlhoNEplWUdY?=
 =?utf-8?B?NFl6QnR5Y0RIeUN5WlR6UWN4Q0ZvM3lOUFFJSkw4Y1JmV01CWkxXdnViditW?=
 =?utf-8?B?LzdkTUwzeU1ld29WL3lkTXRtd1pDZmpPNVRCYWZyR0k1dEpmZVpGeFkwdzh6?=
 =?utf-8?B?Zndnd0hidEgySjZkUUhpMTBUQm12TUQxdHBMWjNtaktUZjQzRFM3bGpDcTQ2?=
 =?utf-8?B?VFdpSmowOVFWbjBqbXhtYUFmN3MwbU9PdFV3Qkpkc2hWVlpNMFhteVA1NWtU?=
 =?utf-8?B?OUZZU3VXc2dKSE8yZ2g0U0VVL2Z3RDhoYUUvUytJdzcwbFpUbm1PbiszbGlx?=
 =?utf-8?B?NFJlR1Z2Mk55Qm1YVENjdE1YNHFxWEhxeko4amozM3VhQUNTek1XN0RDaWY0?=
 =?utf-8?B?bFFqRkVWcVBQbU1ObmRaZmE0U1VBQUpBUjV3cHZMc2lncmNlYTkvWFVoaktj?=
 =?utf-8?B?MXhDY0libUZzSHk0eGhvWHZ2UVNyOTdLbGxjV09YNEJ2ZGlraVJUOUZ5K2lz?=
 =?utf-8?B?VUh6RjFzZy9WWnpoTUdiaXRpdFpHZDhPcStPa0I4VjA4TnJUUXR6dlVETFJU?=
 =?utf-8?Q?GphddSmDYU8MmJKfHNYMXYYxzOwBetOJ5cDYe7S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4b9f1f-b6ed-4884-020c-08d97ed50bd8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 20:59:34.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45yjeUFkk8nTPP1WCQSnhO3jFCr6sF/9IfDUt0rXAanO8vASTcCKu8GVaIjoEzsM129CypUQQHPntzj0w7yxDxYSdDr/jsyGngp6VAz9v7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567
X-OriginatorOrg: citrix.com

On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> You can find the related discussions at:
> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xe=
n.org/
> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-oleks=
tysh@gmail.com/
> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-oleks=
tysh@gmail.com/
>
> ! Please note, there is still unresolved locking question here for which
> I failed to find a suitable solution. So, it is still an RFC !

Just FYI, I thought I'd share some of the plans for ABI v2.=C2=A0 Obviously
these plans are future work and don't solve the current problem.

Guests mapping Xen pages is backwards.=C2=A0 There are reasons why it was
used for x86 PV guests, but the entire interface should have been design
differently for x86 HVM.

In particular, Xen should be mapping guest RAM, rather than the guest
manipulating the 2nd stage tables to map Xen RAM.=C2=A0 Amongst other thing=
s,
its far far lower overhead.


A much better design is one where the grant table looks like an MMIO
device.=C2=A0 The domain builder decides the ABI (v1 vs v2 - none of this
dynamic switch at runtime nonsense), and picks a block of guest physical
addresses, which are registered with Xen.=C2=A0 This forms the grant table,
status table (v2 only), and holes to map into.=C2=A0 Details can be conveye=
d
via ACPI table or DT, as applicable

Xen maps the RAM (which is now accounted to the guest, an improvement
over today) forming the grant and status tables, and grant map/unmap
hypercalls simplify massively to just {src domid, gref, flags} =3D> slot,
which also solves the "is the same grant mapped elsewhere?" problem.

There is never a need for HVM guests to map the same grant twice (as it
controls the first stage tables and can create whatever alias it
desires), but there's also no need to allow the guest to pick where the
mapping occurs.=C2=A0 This vastly simplifies both the Xen and guest kernel
implementations.

~Andrew


