Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229D445122
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221362.383040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ4d-0006cT-Lu; Thu, 04 Nov 2021 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221362.383040; Thu, 04 Nov 2021 09:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miZ4d-0006Z1-IF; Thu, 04 Nov 2021 09:30:19 +0000
Received: by outflank-mailman (input) for mailman id 221362;
 Thu, 04 Nov 2021 09:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miZ4b-0005mf-8Z
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:30:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d040d816-3d51-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 10:30:15 +0100 (CET)
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
X-Inumbo-ID: d040d816-3d51-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636018215;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HX610lG9AAqpIOgB2vsQy/PwoPY/LR0f1cyu7Lq6WFs=;
  b=eeskhh40DhBdW3Z3q3sQt5e8UmLkBRDh989hb+F1vKnUILkqwB05/k3e
   iLnCYsc3hRmF7BrCDAG5j6EGj0bts/gBsY7wER43lXVe/rX46DdnlZYrL
   qWVyaqP0FycOUDjN3WfY4ckhhwZiChWTH0GARnsiSIUFBaVQ+DsqF+IrI
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f0qwi2xV04NLmTOCHM8wIeYUh6b1TqdKxbLLlWY8jxGmcu94e+9y/N7Yl9LcQBcP/lUlwJrnMJ
 RMKyTooGP+os1fHmTB2e5d66qsAZ6LUzzleOGQu1rFeuWyKI7pnCEvTvfhUVPAozI5bqx+A9Ib
 IozvCZcpr0Ci9czdAjou1adMlIlKCUmo++GHvIyXDBohlMydVxFdCR1+TROh/BX8n80KPED5/3
 T0AZBgs5eMXkzCMYMn0dUICog3OH8L0d1PYnUr+BS4JeLZ7EHVS1s4OUMneJxo7Xe9TlP+CnTL
 cVujxG0DgSSbO60j/cBgdDnu
X-SBRS: 5.1
X-MesageID: 58994990
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SbOHGKAaeGjkVhVW/0Xlw5YqxClBgxIJ4kV8jS/XYbTApD4r3z0Dy
 zAeUW7SOviMY2SkKI9zady+px9SvsXSyNJlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540U47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/sxqrx+Fb5
 8p3kI2tRxwTEK3AgvlEekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWbtIMJjW9YasZmQdbDe
 vcSS2RTcy/ufjMTOEwrA80Xg7L97pX4W2IB8w/EzUYt2EDZywZ7wbX2MN7Yf9WMbcpQl0ec4
 GnB+gzRPBYeM9COzCufxViljOTPgCDTVZobEfuz8fsCqFaUwGoUChEfS1qgifa8g0+6HdlYL
 iQ88y4vtrQ79VbtQMP0WRa5u1abshVaUN1Ve8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vX3BDXxz
 jaivCU4wbIJgqYjyKGT7V3BxTW2qfD0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehoFKm7Fmirk
 2c+vtmD4vs0I5GBjjHUabBYdF223MqtPDrZiF9pOpAu8TWx5nKuFbxtDCFCyFRBaZhdJ2KwC
 KPHkUYIvcIIYiP2BUNiS9vpU5xC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyVfsPINmeHb51PVoXKsYWnzO7qXfTlUXP7FZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eMrN9NcAhTfSJjVPgaTvC7kMbZcmKK/0l7WpfsLU4JIdQ5z8y5aM+Rp
 hlRpXO0OHKg3CaaeG1mm1hoaa/1XIYXkJ7IFXdEALpc4FB6OdzHxP5GL/MfJOB7nMQ+na8cZ
 6RUIK2oX6UQIgkrDhxANPERWqQ5L0/17e9PVgL4CAUCk2lIHVOVqoG/I1KwqUHjzEOf7KMDn
 lFp7SuCKbIrTAV+FsfGLvWpylK6p38Gn+xuGUDPJ7FulI/EquCG8gT90a06Jd8iMxLGymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB745eiuG0MBDu7dj3LhcvQfqC
 EuD9sMDYeeCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fZkDehjZcIb15NJIe7
 d0g4MNGuRaijhcKM8qdinwG/Wq7MXFdAb4ssYsXAdG3h1NzmE1Ce5HVFgT//IqLN4dXKkAvL
 zKZ2PjCirBbyhaQenY/DyGQj+9UhJBIsxFW1l4SYV+On4Od1PMw2RRQ9xUxTxhUkUobg74iZ
 DAzOh0nP7iK8hdpmNNHDjKlFAx2DRGE/lD8lgkSn2rDQkj0DmHAIQXR4wpWEJz1J46EQgVmw
 Q==
IronPort-HdrOrdr: A9a23:BgvCB6EVmKCJ72igpLqFdJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLX3OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mLryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idnrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amJazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCc2B9vSyLZU5nlhBgr/DT1NU5DWituA3Jy9PB96gIm30yQlCAjtYsidnRpzuN1d3AL3Z
 WDDk1SrsA6ciYhV9MKOA4we7rENoXze2O5DIuzGyWtKEhVAQOGl3bIiI9Fk91CPqZ4lacPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="58994990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/EC5jxa8K1HlV06YWDlWH1HS2ghWyz41o4FKPNrbLvj5+rVasRpk2HGvjaGpi+EPr3BsrCVlUOaZsJU73jlS/ZJzTDsl539tNQaCk38MFfeaXwsyTxLA6h0f+FnZ0S+m14qvfjJ/Isg7HE9pYTOfjlls/Rmh9/pHDof3a+JyMYHxYBK+L8Xz2EqKoNOktuFZtHbZn+yMwxDwSbX0Lw1ohe9gnYn8eqRp9E/T4BJusx6+Wyno5h+2S2gsyekf8BtcrJZK2vQ9UKS4IMKcRss5iuaABWvsN7sdmmjiKoQT2IqqzYLZw3AO1sBWyljIXnU2VzFm2Ok+LU7UXBkVACV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efBHgVNGpIbGL1nFIdEWwrOtaSf7azmEN6szJRLeU2Y=;
 b=AkfAYMpKq0UDmXoYQRPos1MsFGMEhOZ65e7ngdpPJGNJHFPDK7O0olIlkeQQ+Lm7tbchuMedZbpn6e2rHcquN8X2YTFMk2Y3iY37TYN0xrE1T5EwX/eLV0JzI9J9FgJoLBwBkc0PxoKgsel6hnWIacJY0fmA4gNtMarRQzrKLx8VTPj9fSKzgyJf/uY8gIDY4lzB+zfdn+z8MK08tIUgzlyi8NskYbdIj0xjPTQ9xaM0O7jqrYgvpM+S94hIeO1lg1DqHxP42U/io5TwO6gp+QNBGtXsJpazVxE8wH56HgZnlN2Pv1GvhM1WtWvo/fLx4MR0whSt2fLo+t/aMwHWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efBHgVNGpIbGL1nFIdEWwrOtaSf7azmEN6szJRLeU2Y=;
 b=qHwFOb2f4vsePR2oJ7cD+l3tHt57upfq3MmxMOiTAVB2CKXQK25kK3vwuwpH4tdrM8iCrIWP49jxaCZ2hFjyCoTnmjEMwFhJsjRedkbGP4MI9JQNsxNK+OuxjPV5Hwh6BSWS+XW2gZS3JyqE1Bx63kpbRtp5mOwpCNQJx5/d+gM=
Date: Thu, 4 Nov 2021 10:30:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: Arch-neutral name for hardware interrupt support
Message-ID: <YYOoGEDo/mSmYPR+@Air-de-Roger>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
 <YYD8L6MCrpytCkr7@Air-de-Roger>
 <0230a444-05f0-04e2-c20a-5bb22c0ef63d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0230a444-05f0-04e2-c20a-5bb22c0ef63d@citrix.com>
X-ClientProxiedBy: MR1P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bded55e6-4026-4aac-0992-08d99f75aeeb
X-MS-TrafficTypeDiagnostic: DM4PR03MB6047:
X-Microsoft-Antispam-PRVS: <DM4PR03MB604703EF0BAAE565621DC2BD8F8D9@DM4PR03MB6047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bh5gt9IiMTsfElnng0qGzWqK1hPR3BrrMrPrBVZLfUjHQUMpbvgY0ZgXbyZpZkZvkYWU8M1gj4ShlqERCw3E4z4x3WR8wsKhWjAAiRiut6evXY87wDDg2h6DwvjalxaSjV0TF0gzubN0Ed66EfdHSAGq6yqMLX1Kfq22y2oj6zvnQX+tdCQClEeowwRDO2UWyU83oNBe9PwvRwtbCH+Ws8rIjrjdfHdA8ibhulS4OQ1G6lEr7kSwhuN1AMa/bfUsRbioGqX5jj6rhYcXYPLTBd4s1vgmv5X+0jjzdpUul2awDW2gX14M/8sKl+CCUVhZc9QFJ8o0zYP8kx4w1Kn2jNs72S0iebx1FUZqeYHFkixW4GFCmBFHvdJ6aa6/GMhHUNQRZMQRi4wZj+6jdOoL/XpwVExz56RfDtmRRlxYghiUHBHukCsdOigpiyNWsf8wEfRu7WDjG6zowaAac5YH9HAtJL8tI+GxWZXz56IU3Gq5xCFktoUNkU+TUkmvrPuPPZ8zM1gbm1fn9+DewCaRQpjYW8LknOBvfrxNK8UvwhF3LhfjwocnHh21KTWVzEXAI7fsKbKyM6QMeT+rbvPVoAVc5s9Qi5qk3cxXTHe3y53PmeOTGkY0m/defjZR5uds6xf4hRwIiFmGiDt5gr9Y/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(956004)(508600001)(26005)(6666004)(6486002)(6862004)(54906003)(5660300002)(8676002)(86362001)(316002)(9686003)(186003)(38100700002)(6636002)(66946007)(33716001)(85182001)(83380400001)(53546011)(2906002)(4326008)(66476007)(8936002)(6496006)(82960400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amZmQzJCK3lHK1FuZjQ2bDZVblFaU1MzZWpHUm1LWWxqVVhLNTA1YXBBd2cw?=
 =?utf-8?B?ZUFnZkhxMExTMW55S3NBU21xQ05lSjN5VTNIak1OZ0lHcUJYYitCYUllbXhp?=
 =?utf-8?B?cEdYMDdkSTZTRVlwR0N5VjA4WmRvNjM5MlNxTDk0dldISEVnNi9IakwxTXZh?=
 =?utf-8?B?VjVrRm1rV25uZWpiTzAxYTBNRlVHK3p4d2s5MmFUc0g1STNGWHllYzd5Tlp5?=
 =?utf-8?B?VkIwVDZibzRuZ0pyWGtXaXlydXBTbzdXMktvSjVzSW03WmlRRjdBaWtzejgx?=
 =?utf-8?B?eHZRNnJJaVF5RWpGQ2NiMVZiMjU1WGtkY1ZSdStkRWtqcm9zZGdZejB5Y2p3?=
 =?utf-8?B?QmhaQ2xoOFRvQXpHT1JVcjYybUpySEVPaEpUZnhMVXlac3V1MzFRVlJwQ3M3?=
 =?utf-8?B?U2JOMHNpUTh2YnRFSXlVVnBMcjNVMGtGZ05kNmNybEJMMXo2K3Nkd3dmMHZO?=
 =?utf-8?B?d0RBSXAydWx3a1RwZEJhUW9lYS9QK3E4Y0E5eHVrUUVVL21PdGJWOHRqZ1Jn?=
 =?utf-8?B?SHJPcGxpTzJ4eit3K3RScWJNYkdwTUhFZmc0K0VpblhvcWZ4L0wvZGdsSHFM?=
 =?utf-8?B?ZTd4MnM0ZzBMWFZaRGJqYmRsSUI5NjdaeFRVeWR0V1Z1ckRRWnJHd2lPMmFp?=
 =?utf-8?B?TlFhUjg1a3ZiL2prVmg3QW9XckdadS9leU8rdTUwQS9xdXl0K3pEdHJWWkxF?=
 =?utf-8?B?bU5Md29tcGZ5MWNXWUU1OU5EdDFNcHl4b0psdjRWdXc2b3pRSE5PRGlaelND?=
 =?utf-8?B?aXY0dW9jRG0rU3UrMUdEbkNLbExjeUdrdEtVc2x6L05GWGE5am43bC9mYjl4?=
 =?utf-8?B?ZXV6VEx4Q1FFaWlFQjhlb1huOGtOTElTWDVqNkg4TzRqVGE0bjVzZkkvbGsx?=
 =?utf-8?B?akNXNTZ6aWNiSyt1RllKSVZhOHVVOVloM3ZFQkRaTXhXY2RVYlREbmN1UG9y?=
 =?utf-8?B?K3MwREptazE3K1VnMWpicGpmRktjV1hsODU3TWZBZDZLdDhIQXVXclJLR0xV?=
 =?utf-8?B?NWlabDE5dW13LzR2US90RzVrNVN0c21EY040VW1LNFhEQmprQ2hOeWN2Z1Bs?=
 =?utf-8?B?WFRHRkpUWUtPLzdsdDRIa21iRkY5MHlIU3RJYU5Jd0tFOSsyQVU3TjZ1UnA4?=
 =?utf-8?B?enBQZVFxMWhlbU9qRlM1T0VkT0I0bk9RSzBMZXQ2cFkrVVEzdVJ0bHZVdlk0?=
 =?utf-8?B?MmkrY1ZyVTUwSDUyTUtoSHI4Nko3bmwzUDh2VnpNYlJEMGs0U0lhVjVBY0hK?=
 =?utf-8?B?S2lNUlpFL0FtSDdBZ21OQUNUNWpXRXRQUEF5WGNBS2RXOWhZekZ2NlJZVjdw?=
 =?utf-8?B?c0hkdTlTTWtzT04zdmxqMFFnbFdyY0VuTUV1TWY3WWlXT3plZXh5b2FyNStj?=
 =?utf-8?B?REplQzhUaERQQ0tDdXVIbWh4Qit2bDQvb1BPK0k3MTFDZjN3S3AvQ2p4OTNQ?=
 =?utf-8?B?TGovZ3hNM0Y5SnR5QXcyWHRXUnRyTkFiWERRUml2S215LzVQQXk2Z1hGTFNt?=
 =?utf-8?B?S2FyTE1YY1VyMlFXZit5Mk5OdEdPcXBxT1Z2Y1ZMODZoNEt1NHFyaFVQVGZK?=
 =?utf-8?B?SmxZYzB0ZFl4eGNzamprZ1I1c1lRTGw4cXRxV1FSWGxqUjlnak13U1c2YVkz?=
 =?utf-8?B?MXExL1NqNDF3WXdwR3gvbUU3RjNmSzh5dmVKTE1zcjhhNDlzTzM3WXNQN3dO?=
 =?utf-8?B?Qk9WdGlrdExrTGdHb1MrMVZFWE0yV0gvc0NUTlR6SzhGTXEwQ08vbzVLWXlE?=
 =?utf-8?B?YXVyQVlvd1dWeWd3M2MycVZKelN5c0IxQkExN3ZQaDRQcXJ6RGhOZ3NiN09Q?=
 =?utf-8?B?NU5VaDdsYUN6Z3E3S3dHcm5iZEMvK0orTjRjV2F1bS83SmdDY0t2NWN5R3V4?=
 =?utf-8?B?UlIxeTVGbGFZTTdacXQ2VUk1ek1sQjRkakZHS2laakEyUFJrc3hXL0VXOXEr?=
 =?utf-8?B?dC9sMS9HSlhyTEJxWFB3a1JZclVtdWI2UjdlZUhZTDFvOUg3ZjRUbWl5NjJU?=
 =?utf-8?B?U2NINmJjcTlTOUFkV1JZWlkrODBlQzBIck9ITXAxR3luTE1XRXd3REllVzBn?=
 =?utf-8?B?S09YQkFhc2FlSTducXBuWUhjck1naXNpWmVLclN5aUp0QjZBTDRzQnRmZitx?=
 =?utf-8?B?ZDNhT3Y4NFpZR2s2aWZjUWpKTnd2bUhMc21ycEVpaHlabUFxMGhxN3BraGdC?=
 =?utf-8?Q?HXR23qqvBNsPJWrykQR92Vw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bded55e6-4026-4aac-0992-08d99f75aeeb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:30:04.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8om5Napf9JcwBs/LNZdU0gn9nVqAEUvfdbucjjp2O25YUdSWznkaBiArbiUZDEUfmOZrfVaFw4Uaxz9ucRZSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6047
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 10:16:26AM +0000, Jane Malalane wrote:
> On 02/11/2021 08:51, Roger Pau Monné wrote:
> > On Mon, Nov 01, 2021 at 10:47:26AM +0000, Andrew Cooper wrote:
> > > Hello,
> > > 
> > > On ARM, the GIC is a hard prerequisite for VMs.
> > > 
> > > I can't remember what the state of RISCV is, but IIRC there is still
> > > some debate over how interrupts are expected to work under virt.
> > > 
> > > On x86, the story is very different.  PV have no hardware assistance,
> > > while HVM hardware assistance depends on hardware support.  Therefore we
> > > want to introduce a new CDF flag so we can control the setting per
> > > domain, rather than globally as it is done now.
> > > 
> > > This brings us to the question of what a suitable architecture name
> > > would be.
> > > 
> > > Hardware Virtual Interrupts is a little too close to Hardware Virtual
> > > (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
> > > HAP) doesn't seem great either.
> > > 
> > > Thoughts / ideas / suggestions?
> > Is this going to cover both hardware assisted interrupt
> > controller and assisted interrupt delivery (ie: APIC virtualization
> > and posted interrupts in x86 speak) or just one of them?
> > 
> > Thanks, Roger.
> 
> It's not going to cover IOMMU posted interrupts, only CPU posted interrupts.

IMO it needs to be something like Hardware {assisted,virtual}
interrupt controller, or some such, to differentiate from IOMMU posted
interrupts, which will likely use Hardware {assisted,virtual}
interrupts. So:

 * Hardware {assisted,virtual} interrupt controller: all APIC related
   hardware assisted emulation.
 * Hardware {assisted,virtual} interrupts: IOMMU posted interrupts.

I prefer `assisted` rather than `virtual`, but I'm not a native
speaker so my taste could go against what most prefer.

Regards, Roger.

