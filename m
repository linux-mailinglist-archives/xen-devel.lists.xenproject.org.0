Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C934F6405
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300022.511485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc82L-0000bs-Se; Wed, 06 Apr 2022 15:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300022.511485; Wed, 06 Apr 2022 15:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc82L-0000ZX-PL; Wed, 06 Apr 2022 15:57:37 +0000
Received: by outflank-mailman (input) for mailman id 300022;
 Wed, 06 Apr 2022 15:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc82J-0000ZR-Rp
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:57:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 445d259d-b5c2-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:57:33 +0200 (CEST)
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
X-Inumbo-ID: 445d259d-b5c2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649260653;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HeQ1hEP2KxO8OAsiPY8uzcyTo5VzCnVu7zoMccokOrU=;
  b=GjRdlOLy9ka9Sx0NpsvvAjdqVQLe9o71ymqA8KFp2O9VRaNDqaOG1lNl
   7hBaY2MipFSLObG/v02M7BL6dwZ6GxbmvoKMVtTff1DqhWy8FUwnUCCem
   ZI7tuGLdJvzd20xQ1VgPog6GtwQj+23gjGsDHwllkbcQd+aCctDG/q7il
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70573128
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:K+pw2aAIngoTghVW/z7jw5YqxClBgxIJ4kV8jS/XYbTApDImhDQDm
 mNNXz+PafmOY2Pwc9x2adnjoxxSu5+Byt9mQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhAl
 s12srCCSTsQFZfrxPY3eh1VE3tHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcHhGpv3ZkUTZ4yY
 eIbVTVzbCnYRyYXO2lLLpwbjeenoWHGJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiE/apiUbd+hQL9QR0ibR2ID95wuZXFFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94acu51qXHb4
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLyJNAMsGEudBgyWirhRdMPS
 BWN0e+2zMUNVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5DTkU8CD7SiPHK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chQwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:w+P5qauEzLGN8MMJiwGh+egB7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="70573128"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPqi+iomawinjKphj7dcAVADpbS9h4EJbvFE5u1g6HyvJhTBndOawSDfsx73G8UzTlaCDAf4h5RGjQee8cgNsZnh+vaWEREqws6bAgmM7WwXN1UUeNxbZt3xESpi1EWOrEKcFiuD7y9Kp9u7lhRDC7EhsG2wfjPGy43NfyVumbv76C+6UHNjonYjJnQIWJUE77i5JGTAER3LY2Lkc8iKUAklyu9+6OoeMFpGkOMQ5fD0cFeAmMqdNQ6wSicKuk5Qxar2esTKcT4DaLb+YB9YKHShI1Mm2JOufapEPitZpGgUIkhrOz8u/6D5YjiHbQRyPjR8H3MHhJHT1ZiYI44S3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgFRhV2tmkPELg6HtcElbngN1vuU5CP62IRJyCzhhYg=;
 b=QfFCo+OFd9vgEHzvc/m176MeHfdVK+PYRHMN/e/uYzYsfdvxS5Kihu/f4N8C6qrywmRyE71u10g/heU65bjPny3BGXW2jjMv+VsdA9ofQ8D5iiXm3Deq3QZD8X8NrUybMdXcvUUecoXAs/3CJUoUNC2TL3Y/yNzMqFFEwSfDifPqzWgoHNfVmgWBtld/hJegHanQcwvvoItVpOXJg3phfym7x/TX882vtQGGrsRRfaw+EUj8ReD0KSq9F0LMvf8f9xwiD3ZUExZFamEmJZKw4hWlhG2w6CF2f810iPvkzfVwVG36QnmjWwMcL418hVahG6QiaNTSsSmWnEMWPBWXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgFRhV2tmkPELg6HtcElbngN1vuU5CP62IRJyCzhhYg=;
 b=vPIc+ZU7B6ysWBKrNSavaGUuiKfQY/kKtx8z58keiOVkwWBuKmha9aJizpVBe20sUPZyqU+IHYGtFVfGo+mwC6OG0FArIllpzciiV5+PUESE681GjQBT4C7CHXJzRr0PQIrC0sEnHzA9JufDxqEImxMKf9UvskhDjeJaxBfHXZQ=
Date: Wed, 6 Apr 2022 17:57:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: Questions about Cx and Px state uploading from dom0
Message-ID: <Yk24Y/Ky1UPy4WVK@Air-de-Roger>
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
 <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
 <Yk1tvf7oqOf3jySX@Air-de-Roger>
 <333e5dad-5a8d-a8b5-99b5-5d349c784b88@suse.com>
 <Yk2tN5h3nB+ijMoN@Air-de-Roger>
 <373308d5-044f-e7c2-4830-b3fbf5539767@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <373308d5-044f-e7c2-4830-b3fbf5539767@suse.com>
X-ClientProxiedBy: LO2P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49fa5f31-f9ea-4457-dd0d-08da17e62611
X-MS-TrafficTypeDiagnostic: BYAPR03MB4326:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4326EC5E25CD1DBD24F3CC438FE79@BYAPR03MB4326.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+GlLidahmv8HKsv+A3+EwlDZyRXOEVqXFuPu6w6hmIN0Loeti3hC4H9ONhqPDBTIEpNZ/ppmJqeeS0r9ghU2CdhjZ0juGvkKR4LLAMLTp2bdOhoCgVL0Z/WcM9Tlni3PLEw/pz2309kV/5hcBdC/6pp2XdN0xdZ4dSNL96TRrdh5L5IfA8cqyJddJmdMV/ownoVeCAvReXZiQWF+QSmkhHE8+W8Kmutoih6oS/KtZImoLz4XaC3VZTndWbeb8zQB0IvAowrvVaOvMmPZg9TKfX1Soc90E0HRZjJ2+ELH1jhGTfxSxSjOubWGCJJD1i1beanHspJMzzPqE8cctSVEDvNdlL6rzQZzHQkIAlmqLKI7cT1RCjMXtQmjCX5K/fugkboBZav7Hl9kHWNCOwhL/MYMOgEBsjq67ijTCihjfBqwxhuoI7pME3fUkgHKYKGKkXav6kA2tXeFBaK68d/BNRC97EarIDhnq+lSvX9wzjRzW/Fy+PovwI6jsLpAdyzDDNU1Jw0XnzXD6esfEve87peu2NiYp/fgTvgCvyDpUHq7o0qxQIZsWb0scLXGQqPvU1XxpRBfixNMJ/gDrNjdLOe/QjJ2yXcJaqWflXCyaELth1im3UCG2z3ZJF/KoranvqKXGIYIOmSY+hMOI1RHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(82960400001)(6512007)(38100700002)(85182001)(33716001)(26005)(53546011)(316002)(186003)(6506007)(9686003)(6666004)(4326008)(83380400001)(2906002)(6916009)(5660300002)(54906003)(6486002)(8676002)(66556008)(86362001)(508600001)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtyZll1TVhWZEdUR1hrakNzUS9UZUduUDQ4bFQwSWtkMWZOYUlLZlY1bFow?=
 =?utf-8?B?YXM1RUZNd2JMdExUWHd5bTJWc3NvT1ZEODRvcmdnQmtPZndaS0VHTEVSMXZR?=
 =?utf-8?B?SFpuek9oQTNsYUUrUU9MSHhzNTh5cU50czNQcUREb25LZkJoVi9mUXFtcnhi?=
 =?utf-8?B?dUk1MzFYMjVrWFZySFJCTmtWTXZXUjRwVFNyaTJDSG1Sc0RpQ1NxQVY1RHRp?=
 =?utf-8?B?UVVITzZKdHNPSDk4TVhvaE1ET1hSTy80aUtqWCtucXF4UDFVRmZtYUI0MkJs?=
 =?utf-8?B?S2tOVmlaNDN3YmtmOHkvR01RTWRBTzV0RGcxME5ReHZJNklQSjdCQ2ZTVmh3?=
 =?utf-8?B?bDFIdlNNdmF1RlhDVlpiZXp5eHZ2NG9na3A1M3JWa0w0aVErN28wR05lWFE2?=
 =?utf-8?B?b21pUUd5ZFNwak41M2Y5cUZJOHpUaWg2eVFNcytGQ3VXcXdRZExIR0NyejFL?=
 =?utf-8?B?bTZlc2FseGd2UlMxM2dtRlY4VnY5QlBPQVlhMEExV3Q3a3djaTBGem0wcW9N?=
 =?utf-8?B?WVdGTU9wZEl2WVV0dm15T0ZiNTU2a0VkQ3ptdE51UG9tdjRjbHBjd2MzT2RT?=
 =?utf-8?B?K2RhcFRWQko4cWw4cFlWUnN2b1YrSmJFRk9TbnRFTnJkcnBEb081MlN1Mmhl?=
 =?utf-8?B?a1dXSlZRdHl5YnZhNVdCZmw5T0thdzJtZ0Z2WHZ6ZE92ZnBLa1I2SXQvd1hj?=
 =?utf-8?B?MHkzc1krb1JvZTg0aFB3R0RzSG1Cc2hMSnQ3bThINit6UncyR0Q3cGRhM0lk?=
 =?utf-8?B?Mnk1eUo2OVVEeitlVkFLZGF5S1lDL3N5R1dKQy9jdnpoM1diSXplQ2ZOdXpx?=
 =?utf-8?B?ME0rbVRHQzE2andJTE5ZVEhSM0JzQW9JYXdkYmhsNXoydUdzMVBIMEJlKzlh?=
 =?utf-8?B?YlVEcUo4WHdwZlozL2dKVW1JRFF6MnZ4ZWNoUlNLK0UzazUrN2VUN1QrUTBO?=
 =?utf-8?B?YnlRTnBMMDNXVTFOTk9sdkZZemRRbEMxM2lsQ3RSVHJJUld0N0NFN0hKSEMz?=
 =?utf-8?B?aDQ0L3R3TzYrTzh6ZkM0K1dyV1BJTmwzSjFxN1d6VGJHN285RFI3Tzg2WmtJ?=
 =?utf-8?B?TDN5aU5PL0pFSS9oY0RkTisrbjZ3UFU1MC9XbHNZUFFJV0V1SExLVlJzODY2?=
 =?utf-8?B?cDF3c05lMkxld096ZVA5UXpHMmUxZFpwVTNoM1l4eTVIY0F6aVc2ckcrUmFo?=
 =?utf-8?B?RUx0VXAzOXRLKzZaKzI1Y3I5L3NCbndGLzB5dUk3QmFSYXhxRU5qUEdvVmpF?=
 =?utf-8?B?d01zaEF3WFBNU2JTRWVXU0pOeXMzanBtZ2Z6dGJPb054RGdBWmJOZWIzMWtl?=
 =?utf-8?B?VkxXN1FLQzgrRkoxN1pxU1o1UTdVRkZ3bU1BanU0V05FT2c3UmZRYU9Vbk1H?=
 =?utf-8?B?bk1mei8xQkJiQUF3Wng0T3ZzR3h5dVNwYVRLTk1tY1Nvb3phQWovNTE5ek9M?=
 =?utf-8?B?U1g0ZjRYdCtmckJpM0xCUmhOeTF6bEUwVS9Bd3huMFBEUFo3cjBsa1oyTHNZ?=
 =?utf-8?B?elovTWZsN0JpRFRKc0FrN1UvVkZBbmVwY2MyWEg4SnFyVWt4bEpOMnNqS29U?=
 =?utf-8?B?MUF3YytvUkRkMUtPN0ZxUHYzUmI4Nk5aYTVGMzR6MEZDWGk3T2kwZ0h1WTc3?=
 =?utf-8?B?ZmxMVjRkVkcxcGdyWXFxVGlvNlBDNzdzeC9XZTE4NWpqVDAxN1pKcGlWckpK?=
 =?utf-8?B?ODdqVW0zTlVnZ2NCb08xdUxQTVRPTGdBRkFVYUh1aWVqY1FEUlYxbXBiUFJr?=
 =?utf-8?B?OVhIZ2ZiSmh2QUEvRHh1Y3dPcVYxY1UxREduTFU3b1NocG5LUmhLOXExOUpo?=
 =?utf-8?B?OWVvM2x5YWtmMmR0cVRBYjg0MS81T21JSjBHdDJZOHJGYU94QXRNTjY2aTIy?=
 =?utf-8?B?MEZtSVg3QVROamF0YWxMa1BNVW5scDJtaVVPU3Z4SjZvK2EwOHRQZXNiRFB1?=
 =?utf-8?B?L3gwMy9KVllZUDBwaHIvbWxwLzhlTFNqOGkvd3p3ZTNMZVJiWU50WTQzRWtV?=
 =?utf-8?B?eUFtc1dPZjNaVVQxeWp6UkxiNEJkc3dSeGI2NlBJc2lOeG9ZTE85WHp6Zldw?=
 =?utf-8?B?K1BnRnZoQnE2WFpGdWk3WVQxZUQvZG84dTZLUEFKNUVHdEhtR1RyeUgrZW9h?=
 =?utf-8?B?THp5YzdnaXFJaFp3ZHlVam1ma0liclQ1R3NlOGQ1enlSVG4zNlZVSWJVWHkv?=
 =?utf-8?B?UGo3c2tGOVFqOS8veGdkdzU1eGV2S2RsUFVHeGZaaUpuV3hoUXA0VVA4MnhL?=
 =?utf-8?B?M2xmc3dYeU9BZC9zbzVaSGxrWDNQMFFSTW1RemRjTXJTYlBIV2h6Y2d5WnQ0?=
 =?utf-8?B?alRWTEp2dWpSU2M1Yk54bm5CQmhMWFI4MFp3TExZdVdDQktSdFlORGo2OUgr?=
 =?utf-8?Q?Yj2f2EvRnudYp4AU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fa5f31-f9ea-4457-dd0d-08da17e62611
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:57:27.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGovSxcExIsJxHBSy5fBsSVzQPYPAYlDHwJDf0x39wIWuqLhMrwOlHVxtphq8+cL2YcL3olG7pc1oHg4MMlkQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4326
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 05:51:06PM +0200, Jan Beulich wrote:
> On 06.04.2022 17:09, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 02:47:38PM +0200, Jan Beulich wrote:
> >> On 06.04.2022 12:38, Roger Pau Monné wrote:
> >>> On Wed, Apr 06, 2022 at 10:13:41AM +0200, Jan Beulich wrote:
> >>>> On 23.03.2022 09:54, Roger Pau Monné wrote:
> >>>>> Hello,
> >>>>>
> >>>>> I was looking at implementing ACPI Cx and Px state uploading from
> >>>>> FreeBSD dom0, as my main test box is considerably slower without Xen
> >>>>> knowing about the Px states.  That has raised a couple of questions.
> >>>>>
> >>>>> 1. How to figure out what features to report available by OSPM when
> >>>>> calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
> >>>>> this from Linux: it seems to be used to detect mwait support in
> >>>>> xen_check_mwait but not when calling _PDC (ie: in
> >>>>> acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
> >>>>> the caller to provide.  Should buf[2] be set to all the possible
> >>>>> features supported by the OS and Xen will trim those as required?
> >>>>
> >>>> I'm afraid upstream Linux doesn't quite use this as originally
> >>>> intended. Consulting my most recent (but meanwhile quite old) forward
> >>>> port tree of XenoLinux that I still have readily available, I find in
> >>>> drivers/acpi/processor_pdc.c:
> >>>>
> >>>> static acpi_status
> >>>> acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
> >>>> {
> >>>> 	acpi_status status = AE_OK;
> >>>>
> >>>> #ifndef CONFIG_XEN
> >>>> 	if (boot_option_idle_override == IDLE_NOMWAIT) {
> >>>> 		/*
> >>>> 		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
> >>>> 		 * mode will be disabled in the parameter of _PDC object.
> >>>> 		 * Of course C1_FFH access mode will also be disabled.
> >>>> 		 */
> >>>> #else
> >>>> 	{
> >>>> 		struct xen_platform_op op;
> >>>> #endif
> >>>> 		union acpi_object *obj;
> >>>> 		u32 *buffer = NULL;
> >>>>
> >>>> 		obj = pdc_in->pointer;
> >>>> 		buffer = (u32 *)(obj->buffer.pointer);
> >>>> #ifndef CONFIG_XEN
> >>>> 		buffer[2] &= ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
> >>>> #else
> >>>> 		op.cmd = XENPF_set_processor_pminfo;
> >>>> 		op.u.set_pminfo.id = -1;
> >>>> 		op.u.set_pminfo.type = XEN_PM_PDC;
> >>>> 		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
> >>>> 		VOID(HYPERVISOR_platform_op(&op));
> >>>> #endif
> >>>> 	}
> >>>> 	status = acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
> >>>>
> >>>> 	if (ACPI_FAILURE(status))
> >>>> 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> >>>> 		    "Could not evaluate _PDC, using legacy perf. control.\n"));
> >>>>
> >>>> 	return status;
> >>>> }
> >>>>
> >>>> (This is a 4.4-based tree, for reference.)
> >>>>
> >>>> IOW the buffer is passed to Xen for massaging before invoking _PDC.
> >>>
> >>> Indeed.  I'm however confused by what should be pre-filled into the
> >>> buffer by the OS.  _PDC is about the processor driver power management
> >>> support, and none of this power management is done by the OS (I don't
> >>> plan to let FreeBSD do CPU power management when running as hardware
> >>> domain), so IMO passing an empty buffer and letting Xen fill it is the
> >>> correct thing to do, at least for the use-case in FreeBSD.
> >>
> >> I don't think that would work: Xen doesn't "fill in" the buffer, but
> >> merely alters individual bits. The buffer really is IN/OUT here for
> >> Xen.
> > 
> > Hm, but I have no idea what to put here from FreeBSD PoV, as said
> > FreeBSD will only use the processor object to upload the required data
> > to Xen, but won't attach any driver itself.
> > 
> > I've so far been providing an empty buffer to Xen and it does seem to
> > set the right flags so that the Cx and Px states can be fetched
> > afterwards.
> 
> Hmm, an empty buffer should result in -EINVAL from the hypercall.
> The first of the three uint32_t-s should be 1 (ACPI_PDC_REVISION_ID)
> and the 2nd (size) is supposed to be non-zero.

Right, I guess I was too simplistic here. I'm passing a buffer with
{1, 1, 0}, so no features added by the OS (because it won't attach any
driver to the processor object).

Thanks, Roger.

