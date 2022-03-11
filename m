Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF74D5F24
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:07:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288888.490018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScAv-0007HK-Aq; Fri, 11 Mar 2022 10:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288888.490018; Fri, 11 Mar 2022 10:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScAv-0007FE-6k; Fri, 11 Mar 2022 10:07:09 +0000
Received: by outflank-mailman (input) for mailman id 288888;
 Fri, 11 Mar 2022 10:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nScAt-0007F8-SI
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:07:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff65e316-a122-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 11:07:05 +0100 (CET)
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
X-Inumbo-ID: ff65e316-a122-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646993224;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C85UofXtcVTHDWQKUx88Sumon96vfBF6RpczIPlvto0=;
  b=bjaxFXQWwmJNPiAEj0BH80mJB/DRO2XgqZogMxZ0TJpUvT2WEyTMKOFk
   w9tPgI/n3S4rIdWK7ZrA9I/EDtCkLKJ34mHRYqE35QP2pEImo+kU/AyoZ
   Azo5M6/EwJmCcLGvUgTPPuNGlTc7tnLHnO01Fx24/S0dutmKPd9xJqyDA
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65927382
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:upOi/KxuQY71E4QPtzV6t+dwwSrEfRIJ4+MujC+fZmUNrF6WrkUEm
 DEfCj3QOamOYjTyfN5wYNjn/UgGv8XQzIBiHAdt+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6cG9EVd4BZD2wroRfhpxGSpBYfdm5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0fR6mFN
 5BxhTxHbB6aSEMfKgwuFrU5uPyh3UDYWgcFpwfAzUYwyzeKl1EguFT3C/LWfdqQTMkTgUecp
 UrB5W3yBhxcP9uaoRKC9n+vnebJkTnMRJMJFLa4+/hph3We3mUWThYRUDOTrf60gEO6c9taI
 l4T/GwioMAa8VSsTt30VB6QqXuNrBkaHdZde8U/6xylw6/d8QGfQGQJJhZrZcY6rsYwSXoP3
 0WQgtLyLTV1tfueTnf13rWeoC62OCMVBXQffiJCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/7q/1UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBISESliMu
 lAUls7Y6/oBZaxhjwTUHr9LRuvwoa/YbnuM2jaDAqXN6RzxpnP7LdFr3QskektEMe8OcgC1O
 m/M7FY5CIBoAFOmaqp+YoSUAssszLT9GdmNas04fuaicbAqKlbZoXgGiVq4mjm0zRNyyf1X1
 YKzLJ70ZUv2H5iL29Zfqw019bYwjh4zymrILXwQ50T2iOHODJJ5pFpsDbdvUgzbxP/VyOk22
 4wGXydv9/m5eLSvCsUw2dRPRW3m1VBhWfjLRzV/L4Zv2DZOFmA7EOP2yrg8YYFjlKk9vr6Wo
 i/sARAHmAKn3COvxeC2hpZLMeKHsXFX9y9TAMDRFQzwhyhLjXiHsM/ziKfbjZF4rbc+nJaYv
 tEOetmaA+Qnd9g00291UHUJl6Q7LE7DrVvXZ0KNOWFjF7Y9F12h0oK1JWPHqXhRZhdbQONj+
 tVMICuAGsFdL+mjZe6LAM+SI6SZ5iFMxrgtAxOWfrG+uizEqeBXFsA4tdduS+kkIhTf3DqKk
 QGQBBYTv+7WpIEpttLOgMi5Q02BT7cW8pZyd4UD0YuLCA==
IronPort-HdrOrdr: A9a23:0iqFBKit/JpZPQ9rWAauiEayZHBQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqP+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+iemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNNN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 P52+pT5fVzp/QtHNBA7dc6MLiK41P2MGfx2UKpUB3a/fI8SjrwQ6Ce2sRA2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.90,173,1643691600"; 
   d="scan'208";a="65927382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mraqsD1Vh0NyYtPFAXHMg6VR2j2lhNUSDjxuizOSoUs60+kC+GHUmKDq2EIctz0nFgMrxXuE5f7g6Oibac3XYf1MrUw4rG1N9Qt/Fhk2m9hxKDN/UBZsGXOdWhF5jDOURRYut5ph+/7fRrTj5QqW1Pjq+s9CwFcEqkTpy2Advst90wweL1yfjeEXF2mI29LZwX9OnUISjMFHkA8vNrTLiREem54NQ32SDP/w6sgvMTL8TD4qV3ie9hZPGHnXqOW5jKPNK5Yjer//04aRvyEb8b4HG+FJp8fLfAFyqN4NqQHZJ3PljLQZTI2F/ZKAgVupKtDy7fWe1veT8hdrQm1lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcs3QXxJEyoE62nLZdflDbySx1KIU6vlO7YUiYFr4uo=;
 b=LC7Zsqz866IQNSWJD7AGkj0HullPH//aXW9KTJO+6uXIpY4ubQ2X3BK6zW0ymNVdubRWatnnONJBSMcCzYYFP3Bz9wHEDQcQJ36AUE8tJbNFHq2Jje0pliyUxkNLKmsbFYY52MXsNoBcyG09RyYql4WaX3lS0MHuT7VulzTmOtiBHrzu88PpXUr0eJv2ic8LJmxIauoG+zzR2f1vduUJzAfV7HXSEJyxwE+T0S8QQnjWjoz4ZzyCSsBfhoOCQX4h/WJRWAewJVLmDDrC6teWaf3Skm48d0QFNr3EsFdwN4RJSgQLubQjQ+w0nvtIdNBtDVj3OLKY7pTlN7KUcUnxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcs3QXxJEyoE62nLZdflDbySx1KIU6vlO7YUiYFr4uo=;
 b=Eq4St5vIyPpCMnxXrJozyNpn4VtD3bOHHNeUegVQP81ftkq0fy6XrhTcs7BvxL59irNbLmiMWazfoxFPjtE/q3BhAXWo9TCJt5HA0xjCUUUrRK+RYtef5sBBZnMMPDktExIt6ms3NIBJJg9Io9r4uSP67TdNCuy5VFqHzuE2gX4=
Date: Fri, 11 Mar 2022 11:05:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, "Pohlack, Martin"
	<mpohlack@amazon.de>
Subject: Re: alternatives+livepatch testing
Message-ID: <Yise/YYT/Q8l9Yx3@Air-de-Roger>
References: <09e936c8-1110-a67b-cc67-9cf5ed5a3615@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09e936c8-1110-a67b-cc67-9cf5ed5a3615@citrix.com>
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3948bc77-4988-438d-6d37-08da0346ba33
X-MS-TrafficTypeDiagnostic: BN6PR03MB2930:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2930113DAF1FCA579D745D978F0C9@BN6PR03MB2930.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GigA/d6PLreWe8CC9atBLvgbRTTucOjxO9LqkzaOKfp3bKvkst64AntMeuMnpaH8yWMyFedNMUa8LK6XrZkJR9wieUKBgT+X9ck31B/g/RVaRjktCUfl0EZbDisi0sUzcF2sHe3qO+OV3XJmfEnLzLTyvrwhFQ6HHVvZcpGTlmCWLobXqmV4g12xnnKuP3nL5xH5VByifoUmctvhaDmMJYRPheihdexvGG2TCm+7JUBvM/KURZI6irdHlUfcNs07eowx8e5VkmMICAmKjZ84cZ7h0AtQA4qFm6ueItPP5WonO0x0RuiT5hM6d5kMvumVAMT2M6lMZXIGMUj9ZqGqjrthsv9ha6FIVXMz29fKQdo8E/TIWTgif/ISlxIIRei2o9vASJ2XqLAZ9VkGZCWVVA6iC7+CQTTEQrbo+QknMpVRJQsMZFOwjx1SI1uBHX0TMEtNQNACt33F09cl+QMxCRt5CcRQtV87rxvh3mZlVaMvo51tmez8bIE8HsVMlCu+6QiT2lKpi3S5cNZRgRN3frPAy4yg3Mw/5b5QbcYN2dLwlmxQ6J9t+fp8rrdeCSx2azphxt1k0SRWO2xGg9SFOU6nMTdajraAAuVU6yZKIi24TWKvvRQlMFzcwjyN9oxmKsZ6AmtInbr3a5Lchhf9Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(38100700002)(2906002)(4326008)(508600001)(8676002)(9686003)(6512007)(6506007)(6486002)(316002)(6862004)(33716001)(186003)(8936002)(66556008)(66946007)(66476007)(5660300002)(86362001)(7416002)(54906003)(6666004)(85182001)(83380400001)(3480700007)(26005)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3QrQXpvWmJWeks4cXNjVHJ0OXladWQ5U3lQV28wYVhmcWFnbmwrUDVPeXZ1?=
 =?utf-8?B?NTk3NmNUWUJxWUpmWUZWN2dGTk1HZ1c3Y3cvSkZsVGFKMFBsRUl2NlYzcklM?=
 =?utf-8?B?SGVoK1dkbDNYWkkrZXhGakM2cVNoTGxmNUdUZlUvNHd0UkVwNGpCell1NVJ0?=
 =?utf-8?B?bVhKMVc2Z2JBd3ZPK1dKZjIvY0V5bVU2K2JReUp2UjlnaEVnWUhINW44eGRG?=
 =?utf-8?B?Wk1ycFpiTXlMcnV6eUdjU3R2VUZlbjE2SGJ0akxpRVhveGhzZ1NzUTlHOHpW?=
 =?utf-8?B?WDIzSiswRkdUejNKWUZsVDkzRXljeCt2U0FCMHF5QitwWWxBaWMvL2xNWkFS?=
 =?utf-8?B?aTVweElTU3puWktUU3g2VjBkTkxNa0YrVHVLM1RUalp2eHhkR1RwR3daRXVF?=
 =?utf-8?B?NVhwMy9UaUNXenV4T0ZVR3JvaUcrWmxzbHFQV0RYaERvZElLT1Q0RDNtKzRu?=
 =?utf-8?B?N1hWbnNUbGszTERXdVp0UTBCZ2VQS1BKNnR6enl3Vy9TL0d4ck41REZ5WDFs?=
 =?utf-8?B?Vkx5bEdrNCtOTWgwZ2JoaDUzV3NJemQxSHYrR0hyS2wvbCtjNjFuV2JjV3hS?=
 =?utf-8?B?ZFZ2UFJ4K0tqY0wzSVNYc1FWbWtzSEEvOGYzenZrc0pNT2h0QUdzUDl6RUl6?=
 =?utf-8?B?NE50M2VkZXk2Uk9XMis5aEl1SXZUenBWK29jNXRrNy9mdFgwQ3dpVWl6dnRa?=
 =?utf-8?B?ZkpZVGE0NWJuUHFZRUh5YUtwZG4ybEx2SjVPWk5PdWk0dk5XWlhtNTNNQW5h?=
 =?utf-8?B?a1RGTi9hZjk3MDNMK2E2Zi9ScjZrVDQweFUzbHJIQmZVY3JlSjlBSUZpZTh1?=
 =?utf-8?B?NzNUYjEwSFF1dEtqSVA3RmlKcWhNR3RJUjRpY1hYTlFmeVVkWDU3UTN3Kzh3?=
 =?utf-8?B?akJscmk3Y1Z4U3I0TTRnbVVJeTlFQlYvS1cyK0xrd3F2VFNlMzdPTXRqMWNG?=
 =?utf-8?B?ZHJXaHkyNnlWem1DQ0VLdkQ2VDJpbk10eHh1VnVZMGF4eVB6QTBFUTJQeGtF?=
 =?utf-8?B?NE9RcnE3dzJRMTdibmVmOWsxcncyWE1jWHJ5RXlXQzVyelhkdUFsaUJ3NXRj?=
 =?utf-8?B?WVFSc2V6NnV3VmVxMTBRMFFGMmN1UWZkRWVHQk5jS0M5TjJ2NkZrL0Jmanl4?=
 =?utf-8?B?amlKNXpFRUhnL1p2RG1FRlBWZFAxTGlmck5kQzY4SmxHSEFnRDR1REVVRS9p?=
 =?utf-8?B?SXFZejZrRStaeTRPaTlYVHRMeExydUNJYzJGNFVnb2VBRXdoSkVLTy9CVkdx?=
 =?utf-8?B?cXFZUUx4T3d2ZlpKQUdYVkNjMnl0NVE1RnlNUnRyN3RaOWNnSDJOWkhqcUhh?=
 =?utf-8?B?UXBGcHBxSHBwTUdFcFpCWVRTOHhBQytVZXpmR2wxYUFTc0dmcWZySzR5b1JD?=
 =?utf-8?B?WTRpOHM5MlNZSFQxV241Rjc5aVR1WDBqcnJWRVlFcTljRCttVEFITzZWc3Rv?=
 =?utf-8?B?bE9RV3Z0VGdUVTMxMTAyRmc5TTJBM2t6WGJpTDU1amxXbVQrQlpxWUJKcU5l?=
 =?utf-8?B?WExub21pMzZoRkR1MHpEZVJYOHZ6SVBaeGlVNFU4NVorQnR3clpicWJEOE45?=
 =?utf-8?B?aXd6L0NtRTBTUlBCclJIMkUrbFRZT3ZCRmRXYThOMkFsMTJycEdIQmVHODla?=
 =?utf-8?B?ZEY3ZVVsY0s2T1pqbjZ1ek12eVNtSFlWUG1nTVRXNDVNb1g2VDJZVU10MnJp?=
 =?utf-8?B?ZlgzeEp4dGZTU0lyTGxuRVlpR1A4aFllZEwwaEZMK1B4NVJEQnZMRGJDRm9o?=
 =?utf-8?B?UzFMSUNQQmNoZ2RNSmRIVTc2RHMzVTBEVTJIM1Zyc1k3cGFPMVZDTkdPQmh3?=
 =?utf-8?B?cSt1c2ROR2xKVHBqUFYrOU1CWXlCdUJ4RGt1TDlVTnQ1ZENRc3d3aUp6V2Zr?=
 =?utf-8?B?UjJrcWMzajNrQzcrYWxCSWl1d0I5TmhLYUpLSFRjSkdhRDUvVUJ2ZzE1Z1Bl?=
 =?utf-8?B?Vnc1NWMyR20rTVNxNktBUXh3TVpDd0FNSXc4WUI1b2U0bExBZXB6aHUzWjlL?=
 =?utf-8?B?SmlHRW1hVEhJZFRXdnRpSDViZzI2enBTM3RnSmhuY2VhZEtvRFRaeVhHa0s5?=
 =?utf-8?B?RGUvdDlNS25abzRWYVdMZnVXcGNjdHpHMjdvdHh3UmNUZkRWakVUKzhlYXZ4?=
 =?utf-8?B?WmxZSXBWL2x4emEvK1paNVNYQTg3aEwvK3FQdWZmNHBxcmtKUFpkVk1JazJ2?=
 =?utf-8?Q?m5xsygF24AajjG1bn56MnkY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3948bc77-4988-438d-6d37-08da0346ba33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 10:05:53.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojAUikyWmvg8F0+JACuGtphQT9dXR/KP7ielfkW16FM7rbLA6Ki7Zudkab9atgAqBvkWX+auqrdx95hm6KYMdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2930
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 12:27:34PM +0000, Andrew Cooper wrote:
> Hello,
> 
> The recent hiccup with CET-IBT, and discovery that livepatch-build-tools
> have been broken for several releases, demonstrates that we do not have
> remotely adequate testing in place.  We need to address, and ensure we
> don't end up in the same position again.
> 
> Alternatives and Livepatching have a number of overlapping test
> requirements, so how about the following plan:
> 
> 1) Introduce a new $arch/scm-tests.c, with something akin to the
> existing stub_selftest().  I'm tempted to move stub_selftest() out of
> initcall and call it from init_done() (before we clobber .init.text)
> because that gets shstk testing included.

Having a specific file we can patch would be good. We could even try
to apply/revert the patch as part of normal build processes, but that
might be too much.

> Even without livepatching, we've got various requirements such as
> endbr's only existing where expected, and getting clobbered when
> suitably annotated, and altcalls turning into UD for a still-NULL pointer.
> 
> Items not yet upstream but on the radar include inlining of retpoline
> thunks and SLS workarounds, which would also fit into this.
> 
> 2) Provide (in xen.git) a patch to scm-tests.c which OSSTest/other can
> use livepatch-build-tools on to generate a real livepatch, and a new
> livepatching subop which can be invoked from xen-livepatch in userspace
> that will run the same kind of consistency checks as 1) on the patched
> content.
> 
> This lets us create specific constructs and confirm that they get
> patched correctly, without having to specifically execute the result.  I
> (think) we can do everything needed without reference to the livepatch
> metadata, which simplifies things.

We could start with just patching the livepatch subop hypercall to
return a specific value and expand from there. We need something
simple in Xen so that we can start and integrate into osstest. We can
then build extra coverage easily from there.

> Providing a patch isn't totally ideal from a "maintaining xen" point of
> view, but I think we can have a build-time test which confirms the patch
> is still good, and it is definitely the right primitive to use for the
> end-to-end testing.

Oh, right, so you would be fine with applying/revertign the patch
during a normal build process.

Roger.

