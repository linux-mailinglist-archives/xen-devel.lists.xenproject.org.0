Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5AD3684B1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 18:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115713.220828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZc5A-0001Zq-UQ; Thu, 22 Apr 2021 16:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115713.220828; Thu, 22 Apr 2021 16:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZc5A-0001ZR-Qi; Thu, 22 Apr 2021 16:21:36 +0000
Received: by outflank-mailman (input) for mailman id 115713;
 Thu, 22 Apr 2021 16:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00C0=JT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZc59-0001ZL-Oh
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 16:21:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c65d1871-1f5e-40ff-b970-17fc49beb387;
 Thu, 22 Apr 2021 16:21:34 +0000 (UTC)
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
X-Inumbo-ID: c65d1871-1f5e-40ff-b970-17fc49beb387
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619108494;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EBLkNQ/Mosc9Vp5zjHIoqhocTr3Ge/o7+GMRTPa7PWg=;
  b=GCbz8peMg+CuIIIbQl+qYsfif4kWlme8blIK076T4Huvd0yOtRbI0RHH
   YKiIPKqcNToQKMbJv8nThbcfLgwbbTFKhY65iuBkw6939r08/TCaFzJoy
   in+xKiyDoOGXkE5nHwM1EUYEeGjNtojprWwXIXpW66p6BP1Y9pas5wT2g
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B3ZNVIScZQnbAQj4xhFWAl1kByXcHg3agDBefjsVoHW4qeOT+v6Ujzv+OH2EfKY8hxth1JN8xT
 fM4XTPNpcUcq5U5ncK5HWVWOtYzm42e/quaBjXrvUVuIMThqXaKU8o5U3BWVYz7vghUBYE1u7s
 ij00Z3hPa4jhcwr9H+tfDbWwSm9K8FPWzRhvXBV+6yUX1WaLlC/DI+5IWgv4c9FJ+wESkeL2XU
 g+06T1oCvi+0yGCG2+Z0Flzvf5lJ3MJ1T6y5KuhF0i+e07+PKEYxGrjHhaAaYDytDWXinsW8R4
 nJU=
X-SBRS: 5.2
X-MesageID: 42200197
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mHbxvavzoaptiYxu2RzvZ6+e7skC24Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeUUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwoyG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYHLhJdKaFuFkO0YeSwXYs1O
 LBuhIxe/l0gkmhBF2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VHAzuPFWB1wmk2/rWBKq591s1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrC/2N9qdzqhHhXkl1V0zMfpdno+GQrueDl4huWllxJSnHx/0nICwt0eknoq5PsGOuh5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBvaPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwEzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbbuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8hxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hvp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YDVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsXun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDPFbCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob6574WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRt+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8UUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8JxO4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qykWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+TDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 2i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregfjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDEo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/+sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6n4Noh95+jFollnkx4ig7iP6JCh9QHPkq6QTeyJSPHiOhd
 nC6s6C2h3GkWB45aU=
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42200197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKf9+6lebe+ENZx9irhHG1iJKqCWAGeuAsIH6sP0zyHl46WmCTqU2XB3dBDEp5EPcwdwiWxmmfRUFw3IrlEFhY+FtaORhYYGvjy3lizd51ep4XtneNw7lODp9aC/fYSYniYcqb31K/sVdyMjINzbIyVD9i4ewC2ApnzcOLcU41t0uJJ7HJdLE0jHYgqWsPty5SIXCXXx3rwouT4gKNyUTR1KljTnVglQ1ZTqg4Z/zFFXFEh4nbP5Y3gnFuf5QxalF6CK1JfZY+2Xl1DMwKo1wzP0y+8PsCuFh6xYxy1Lue3y7Vl/n4mdPrt6bwFKTC4kKKP2dsRJjYlikoFOuBSM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBLkNQ/Mosc9Vp5zjHIoqhocTr3Ge/o7+GMRTPa7PWg=;
 b=D27i48+qg106kaofcukenYVMA1nci8zPgkXW7+rCovwQJev8oh8FpoknfMmbCI0vY0sBhbMBbeGmCiI+Wv/eLjkiP4ZIyvIjmC17NSwMaa+rsAzb4DcOb+0DudmUoZXU4dtahDDMVns0Pno74O2fee4jKnfed0qDHt2C5tc+6TfhdE5Z8RARFZnK9deP999Dpu/+iaQB2y2d81fgkPLuUPj+tpTAVjszqP+lizP20Bvm0z16QxW3SO3YLRM0uCGvHu7noBQ0yUGY61CZMNsW1qRN54RhzEvkyCBICUSfjxOwt90gq41WTrWgWWp43aSA6777rGTbHUSNBHMwis4BSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBLkNQ/Mosc9Vp5zjHIoqhocTr3Ge/o7+GMRTPa7PWg=;
 b=gJaxf31+llRAStgvRama0lf69sTSmAgPWx2d8pk2xoLYY4i0gmRThNToJACeFARTuzm//gDwCvhJOnPoygXtuMQxwBfbGWgfrZei300VfTQH+uRnwMo7u8M0I+F13z6z2K+kd6LueXWvXR6KYDNc5st3mDk+bMrATOz4ZMWMb10=
Subject: Re: [PATCH v10 00/13] switch to domheap for Xen page tables
To: Hongyan Xia <hx242@xen.org>, <xen-devel@lists.xenproject.org>
CC: <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1619014052.git.hongyxia@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ff54b35e-bcf7-3343-4704-417aeb53865a@citrix.com>
Date: Thu, 22 Apr 2021 17:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b16dc62c-13c9-4440-c991-08d905aaa85e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4872BABA6277A956A1844BEEBA469@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pnsoYW6sDQzRgW9ozxBhY+j1ED3Yx1BcRQKxthAjb7tg/wuFhyiVyF9EX34GlBs/BhWuhZfI7U/HXqFfF40VBb+3aziODz2TZSSQ6PVWUTa/u9oRGxXK9nzMQQCh9IeHvTXNh808GibZtB1ac0d1amV1/DE9tPDvrG7qIe4C5hStZANJOhVhCIVYiHrMGqmILsF2k0CG5nQjmHDGioXeBJmVCYYUN2gaKhXvRdkVINTUPAg1AWkYA/IhRUxBNCM9PvIfKsq3GEqD3PPp+0CjCW1vzbB3RtN4cAe9QB93MJmE2I0yEgDSzWZ3rY98amt1oaG1xNGCK7kmZm14Ccmvw01RJzSQKDs7tT/m355wg5+DrvuGZglR7aa+ZX1lvwLKWfS5s+gulVF5PMltmtJQeDppsdk4bzOuGOs6+iWaQG+0YXQ2l9wts8NH3WGyEaaGaOgGAnGgIqVq0GfPcI/wCo1Gb9ITZ26PH5gsQaD/bzfNVQggh+p3/Jvtq7vfpe2EIFP1YXl8GZKT2PSq405sRaxrTF600sEEeVO6Z9e4mgMAbtPotj1R67cbK5seBPNKjsDX2y/RDPw+w+Pq7+X709RZmx1nvwVgmdmQkxOS/0PfGcAZKz+HyziExQYv9mSaQao+la518YUW8jEsanw8qMztt84tFdKFxrSbU0J2JMfyPXrRwaG2hPMxfIncipj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(66556008)(186003)(16576012)(38100700002)(316002)(956004)(16526019)(66946007)(86362001)(6486002)(2906002)(2616005)(83380400001)(53546011)(6666004)(31686004)(54906003)(5660300002)(31696002)(8676002)(36756003)(26005)(66476007)(4326008)(8936002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjBtNCtvZjZkMDRyaHh4Wjd0MUdaM2ZkQjJDbzBYbjBtZE5YOWYzM0tjd1Y1?=
 =?utf-8?B?RDhKZXBYTkVXcGdFb2NYYjl5eVp6T3RoTTBMTUZFZWNwV2NZYnkvbWxoN3g3?=
 =?utf-8?B?VkRxL2c0RjUrbmlTYytiVnp2VU1LblpUSzhzWm5YblZITFdFbDFGY2RFS2li?=
 =?utf-8?B?bUFuQm5PY2JJdzFLdlFldDkxcHZ2UU1FVWpJMncyTDd0Mkk1YTBEUHNha0dS?=
 =?utf-8?B?cXpqbTBzdjQ2R3dUeThGNjJ1UFpIMzhDN01MWUszYU9CL0loSU56UU5sNUh2?=
 =?utf-8?B?cWUvLzB2UU5DSmVMaGlRdGh6c2FidXkrbitVcWR2Vkx6RnVTT0RjSGh4Y2dw?=
 =?utf-8?B?OGM1UG9xOWVqczBZbkgxUmp3bHMvMmdvR2U5VzV0NFZGbTFjUkQzUUJObTN0?=
 =?utf-8?B?ODAxMm9YUGYwQnNwSkdXTjh4VitSZ2JNVmNvbndGU3R2NHBkSkN3bjdpRUpD?=
 =?utf-8?B?T1Fma1VqL1luWVc1TnUzL2xtclY4bXhzMVJBSjAyL0hwZU43a09rMWtYZjVv?=
 =?utf-8?B?aUdZbWYvZ3l5ZUNGM1NSY1VDbENtek1acTRwbUN5aXNiemJZTnQ3TmNtdDY2?=
 =?utf-8?B?T2JBL05odng5TTd4b3drN3FqdHcydHhHMDBnemx4VWRCR1I5RDRxM3BCaFVq?=
 =?utf-8?B?U0VHWXdVTStCMEFmdjdQMmQ2Ykt2Y21IaGE0V1Rub1BkZU5sa08rRU1pT0Ix?=
 =?utf-8?B?eFlxRjIwT0tIL09UWnNOOVJhKy9GSzdROSt0dXByckpxWnBsdE1kUE1nZTZi?=
 =?utf-8?B?a3JLdERuem1uREdZY1c2YW1NZURGQ1FUcDJkbUJ1Sit1TytmNENXdzI1VWRu?=
 =?utf-8?B?ZTd0V3BHN3ZJVjVIcnJzZk5udXNPbWpydzFPTUkwTFVzUm13R0ZVTTFnWVpw?=
 =?utf-8?B?TmdRZDAzcmlLSjVTdW1tKzdFN2hZSFlmQ09EZFhxdWtpb2NVaTlRNEJ6aW1y?=
 =?utf-8?B?VXpreDAzZTlEWldncmFXYnB5U0FHQW95dlgvdnV5T3gvSUx2VFNKckVWb2xm?=
 =?utf-8?B?Y3RzYzN3TWpsMnZ0YU0wRDNHRm05cTZLQ1k1TU5QTnBjNzBQdUtQSmRWTDlO?=
 =?utf-8?B?bEcveXl6K3FtbTMxdkNlSFFScDdpK1kxUFdrY1FzRGxLVS93NXlRaUJNU2Ex?=
 =?utf-8?B?ajJSamtqRjdxYy9qODlEdnBMRTFjekRETW9BbEdEMUlzOUlYSEJJVFpjVXFo?=
 =?utf-8?B?czh5ZDlYYzVLRmp5dEtPRlBRZ3FGczI0eGdNL1lDQW1EeEJCUmxRSndscFl3?=
 =?utf-8?B?Y3Znc0hUOVRHTGk0MkxLNTI0OUdlbTR6YVlkTUp1L3dyUGEzOTJtU2VScTYx?=
 =?utf-8?B?NmpyMmY0UVM2NkVSbDRiRnRUUm4vQyt6RHVnSkpLYTErS2lTZjZTNUdSZHp3?=
 =?utf-8?B?SUFQRW8vQkRxRkoyYzJ5Z3c2a1BTalNHajJ4bWFaaGpJS3FWbmswcFVPU1M1?=
 =?utf-8?B?THluL2s4Q0tyUHdadUhmMHpBRWZvaVJ6LzNsNkUvT2FXeDZLY0JJQWd6ZFJT?=
 =?utf-8?B?RFI1S080V081TnByRkMxYlZxRmFweXhGLy9UZHZOZ3FGdWN6bVEwbHNmZ1RK?=
 =?utf-8?B?RXNGWC82SmdldzhjY0w2QllUTWFBQm1QMXNiUDFHZEVxTjNXQXFneE92LzZH?=
 =?utf-8?B?Vk1zMUIwR28raEFSN0M2TlRZc3lpemtuUk1KWW1jVUIrVDNZL0IrMzRCNFZP?=
 =?utf-8?B?OGpzY282aEI3WXVKSXBxOXlwdlA2S3kyeEtCcGpQbUJHMWpwSCtCbFkwNVZO?=
 =?utf-8?Q?wPgzUdDfl/GqHZjdYzSDacjYykoTqJU18H79clO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16dc62c-13c9-4440-c991-08d905aaa85e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:21:17.8148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZ6T8zyEufQdDOA4aUTHo/Vozj4rxawGk93Z/3gz79GIATAsatrYzGS/oqqVO2TRkQ5bwT3gf6ppUaUXGIz6/O1TbxIdOUulRz26aad93TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 21/04/2021 15:15, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
>
> This series rewrites all the remaining functions and finally makes the
> switch from xenheap to domheap for Xen page tables, so that they no
> longer need to rely on the direct map, which is a big step towards
> removing the direct map.

Staging is broken.  Xen hits an assertion just after dom0 starts.

(XEN) Freed 616kB init memory
mapping kernel into physical memory
about to get started...
(XEN) Assertion 'hashent->refcnt' failed at domain_page.c:204
(XEN) ----[ Xen-4.16-unstable  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040316f80>] unmap_domain_page+0x2af/0x2e0
(XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d0v0)
(XEN) rax: 0000000000000000   rbx: ffff831c47bf9040   rcx: ffff831c47c1a000
(XEN) rdx: 0000000000000092   rsi: 0000000000000092   rdi: 0000000000000206
(XEN) rbp: ffff8300a5ca7c88   rsp: ffff8300a5ca7c78   r8:  0000000001c4f2fc
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000092018   r13: 0000000000800163   r14: fff0000000000000
(XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4: 00000000003406e0
(XEN) cr3: 0000001c42008000   cr2: ffffc9000133d000
(XEN) fsb: 0000000000000000   gsb: ffff888266a00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040316f80> (unmap_domain_page+0x2af/0x2e0):
(XEN)  14 04 00 00 eb 19 0f 0b <0f> 0b 0f 0b ba 00 00 00 00 48 89 10 48
8b 81 d0
(XEN) Xen stack trace from rsp=ffff8300a5ca7c78:
(XEN)    ffff820040092018 0000000000000000 ffff8300a5ca7d58 ffff82d040327e20
(XEN)    a000000000000000 0000000000000000 ffff82d0405dbd40 008001e300000000
(XEN)    8000000000000000 8000000000000000 00000000000001e3 00000000000001e3
(XEN)    8000000000000000 0000000000000000 8000000000000163 0000000001440000
(XEN)    ffff82e0014b92e0 0000000301c1a000 0000000000000000 ffff820040090800
(XEN)    00000000026c10d8 0000000001c4f2fc 8010001c4240f067 ffff8300a5ca7df0
(XEN)    ffff82c00071c000 0000000000000001 0000000000001000 ffff8300a5ca7df8
(XEN)    ffff8300a5ca7dc8 ffff82d040232c08 ffff8300a5ca7db8 0000000140088078
(XEN)    ffff8300a5ca7df0 0080016300000001 ffffffff00000000 ffff82c00071c000
(XEN)    ffff82d0405b1300 ffff831c47bf9000 ffff82e04d821ae0 00000000026c10d7
(XEN)    ffff831c47c1a000 0000000000000100 ffff8300a5ca7dd8 ffff82d040232cdb
(XEN)    ffff8300a5ca7df8 ffff82d04031718b ffff8300a5ca7df8 00000000026c10d7
(XEN)    ffff8300a5ca7e38 ffff82d040209cb6 ffff831c47c1a018 0000000000000000
(XEN)    ffffffff82003e90 ffff831c47c1a018 ffff831c47bf9000 fffffffffffffff2
(XEN)    ffff8300a5ca7eb8 ffff82d04020a69a ffff82d04038a228 ffff82d04038a21c
(XEN)    00000000026c10d7 0000000000000100 ffff82d04038a228 ffff82d04038a21c
(XEN)    ffff82d04038a228 ffff82d04038a21c ffff82d04038a228 ffff8300a5ca7ef8
(XEN)    ffff831c47bf9000 0000000000000003 0000000000000000 0000000000000000
(XEN)    ffff8300a5ca7ee8 ffff82d040306e14 ffff82d04038a228 ffff831c47bf9000
(XEN)    0000000000000000 0000000000000000 00007cff5a3580e7 ffff82d04038a29d
(XEN) Xen call trace:
(XEN)    [<ffff82d040316f80>] R unmap_domain_page+0x2af/0x2e0
(XEN)    [<ffff82d040327e20>] F map_pages_to_xen+0x101a/0x1166
(XEN)    [<ffff82d040232c08>] F __vmap+0x332/0x3cd
(XEN)    [<ffff82d040232cdb>] F vmap+0x38/0x3a
(XEN)    [<ffff82d04031718b>] F map_domain_page_global+0x46/0x51
(XEN)    [<ffff82d040209cb6>] F map_vcpu_info+0x129/0x2c5
(XEN)    [<ffff82d04020a69a>] F do_vcpu_op+0x1eb/0x681
(XEN)    [<ffff82d040306e14>] F pv_hypercall+0x4e6/0x53d
(XEN)    [<ffff82d04038a29d>] F lstar_enter+0x12d/0x140
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'hashent->refcnt' failed at domain_page.c:204
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

I don't see an obvious candidate for the breakage.  Unless someone can
point one out quickly, I'll revert the lot to unblock staging.

~Andrew

