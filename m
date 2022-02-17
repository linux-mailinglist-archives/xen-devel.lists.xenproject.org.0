Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E374B9D4E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274620.470150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeAo-0000tB-Lc; Thu, 17 Feb 2022 10:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274620.470150; Thu, 17 Feb 2022 10:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeAo-0000qd-I0; Thu, 17 Feb 2022 10:38:06 +0000
Received: by outflank-mailman (input) for mailman id 274620;
 Thu, 17 Feb 2022 10:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKeAn-0000qX-B2
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:38:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aed02d73-8fdd-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 11:38:04 +0100 (CET)
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
X-Inumbo-ID: aed02d73-8fdd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645094284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Y/+Z1xX3H+2mN+DrOZnYIO61TuGO9vbx7FjtDJlyc0A=;
  b=KyXQz5LbzxL+PUOSG4OyR4zxM6gn+YLPOTyK9TPiblA3oIbwVu+iSPeM
   4heOnqBK8r5XQJmy7cY7IqbOV/ELjVeUAjHytCikX2WCC45F5ez/XwTpu
   7AcYJATFTsohxGQYk4sjR2X+eTUMBhJT93AI79D/3Ft79iVwwYLHtpvE/
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ea285KvfEjQFCd4EhISYvkiOkPx1DRsFzH5TaXdfkaajiJSVXxTPcIAcnEKjzr4lTAPdFp+ndY
 t8eyyzC1vfaUL9p8aErYyH20LkOK/ZdVIQqRaUO8gv86K9jrhalusbtX2YEHTiatgabJPnxro8
 G4iQuueyQEPz3Q2b3bfp5SE636j7uYi1W15ftp3KwBc2XzmURxPS/Lv/gP8JJ0hzF3LICVyQCY
 WkPVS4Z4nPYWHbnWJlnbCG2w2iHmTefjpXIMe1CMKCDNsz11slksPbWVdKxi2leitaZYU7smcC
 Vn+984GAOhz4ghWaLovgWTgu
X-SBRS: 5.1
X-MesageID: 64420385
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SIZrG6riquYYSbUvV7unflrc2JZeBmLEYhIvgKrLsJaIsI4StFCzt
 garIBnVPfqPajCneY8jPdmx/UJV65bTnYNqG1Y+ri1kQy9B+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbq0RVkNMvXIor8AFBhfNH4ueqNU37CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SQayGP
 JpEAdZpRAbNIDlkCHMUMbAno82lwVvEchRnsk3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fd5cTck2sAW3kbeT4gG+WThDQCxmZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb4
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0jfBw2bJpZImC0C
 KM2he+3zMUMVJdNRfUqC79d9uxwlfSwfTgbfqu8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLavOHaJr99IfAtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:7f4OuKvip1hHT32fZ0ifOFe07skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="64420385"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVOR1pyhxuDqSn9MilMYO1W41+5QiMSx5FUMTw3F1MX5rQnKwdDBO48vQR1XnI1RRtzflaQT86HQ40o9hrCpnza9UUto1nmirCAxfnkVFxjZoRUR2rFycRWlO44RWVTiBMJHcmznlDPEc/aYnvpSoSY7LPWti047zBTtUfPQESF9O8Omm3qu45U6qGYT6qLDcnyVE/ysDVWMfprLVr2b1K2640uf/xElsNTdrAb0Ammdt3jinuOJyelUuOiVv5rSeJfcmYAeOsm9zIOsr6ggwACvaPb8HAJsNhF/4JzYhp0hmh0H7WLqWGQCw8Op1pypAIXk5lQQwGKxu7xeT6mMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xremFid+HzM26/bOUumPJtVZiyl9Rq49wmaqJF4LgjU=;
 b=G8EoTndAh/O5XKsRNIaKhnDQ25Ht5DOmsJkWZeCwbGaFQI9q4rUXCYev4xVg78gOanab3oQbKNyqogWNM1yQJqPbIkAR8egjJNDVHd/ZsU3npAXGtFHWjEB53csRfgk2ktcQmbenE5T8WP50IffeeHrvnPeAkyt3UQucuYX8XQm3A9fOt7LYu0CCyFWpn3QbCayu0OYaFckgLJb39d9DURgtjHx+fnZ6fr5A2lwRaWzQSaG4bCR4QRaWclukYkIy6InQfuAxj4uIiknoUd3I8RZUH+KZaYIYqHMDgWpxY6QzRGYvSQ653Y9N4woYFs9Y62z5VOdBfSHSa9c1m9fcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xremFid+HzM26/bOUumPJtVZiyl9Rq49wmaqJF4LgjU=;
 b=CChPx4apqe2iPmxGMqOfRWMuw8YRqa4jSk9qwJNSodO5R+52pefpjdBHvXrSs7BgH75/RFO31RNs8nFgV833omPggQ93E7miEdEOUfnqlmtDey6sNLbqGrtCv9Krw1LtWLlXng1Bzxc5TPth86tV6lRx+5PrCVJwUN4rhAJ3YBM=
Date: Thu, 17 Feb 2022 11:37:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] x86/retpoline: rename retpoline Kconfig check to
 include GCC prefix
Message-ID: <Yg4lgQlNBTyTlsLD@Air-de-Roger>
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-2-roger.pau@citrix.com>
 <7e5f721c-9771-bf35-8b94-f7fec7cd6eeb@suse.com>
 <536a357b-b895-7fe6-f99d-e83f5ac44745@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536a357b-b895-7fe6-f99d-e83f5ac44745@suse.com>
X-ClientProxiedBy: LO2P265CA0385.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31189acf-9d34-40d9-474b-08d9f201907c
X-MS-TrafficTypeDiagnostic: SN6PR03MB3856:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3856D41F289B9910CDD3A8D88F369@SN6PR03MB3856.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7LC67b3JIgs5WQ0re6fy2IDp2P8fASwbsr4Le4o6a8sUqXWVOfhSI2NfOs5AvjLRwtUfDpM/elnhA5V6nSbf5dtGm0xmg6n0I+6Mr0SFOELkyk8B+k+f3rlimB2o9JCusSw2c6dnCIj07NxX81F3C87yU5FGkLif1/plvUDBVAaX7jwzZ4cpduFsQhjAETQ/XJyMTb6jJkxEdckYveqQoM/dN1m11LBuqGLl2XrZqW2f4Qz10UAnmytDLfazPLIhM7nYizlypf8LivJYj6jMCfHGxBQCb/1KMhyvdNOmgIioGSZ92wdWoFSRjRvYTIjEkzHXLbdmGFKXAYhfWSLlfzO7rZZTqHXSCqcM0zhwRt/AEsH7/wCHbtJj28n6QO9S6Omd2aWtXJX9nYqPatVI9e+65gzo6QrgoA+nQiEPHg3ESIZ5bYiKmG0EyU8QTzcJ8WQpoxG99mfRokgpsauUiesEGe9+TQigSAfYGyStIe5MwN/jDCXyiVK4JhYNcx1jYcbD1pGakv6edJAyPUv3tboxj+GRvCjslm8hWH6wO8Bn56bGgz3qJFv6cnvgd1gZpKmyAGEEI+lEQGlTfeIHDEeWHb2yJhkGWJuqLMa9v4KSQF0/LOn6n1sx8nbFws/kl/3tRv3gbdxdOQlbwyd5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(2906002)(6916009)(85182001)(54906003)(6506007)(33716001)(186003)(26005)(86362001)(508600001)(9686003)(5660300002)(6486002)(6512007)(66476007)(66946007)(66556008)(6666004)(8936002)(316002)(53546011)(38100700002)(82960400001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGVZa3MvWXcrOHZMdm5heWxJbTlnaldrbm5UdWRQbUs4d3RyL2RyUjU1ekI5?=
 =?utf-8?B?MEtGNGdmYTN1bTRGdUVKUjlEaGVCeGhmWGRKZ2JHRHdtbDIvc1dOaGFKS3VH?=
 =?utf-8?B?S2RxNk5FdkxmZ2p0SlZZaThxYi8zZXpzUHp1M1pvcVh5VDJxY2U5U0pmV0s3?=
 =?utf-8?B?OTZhV2EvTEdRcTM3T3JKNytLYzBQSUdmMkVDUENEOHNiWHdDZExzV2MwMFZ2?=
 =?utf-8?B?anpJVHc2dWRsZVNPQ2tRQkE2bk9xUGZOeTFCY0dad0lZZjc3VDJPZ21VNGtu?=
 =?utf-8?B?SVhuUnhEdmlrblNaMFhrU0dzSFF4aE0zOExZUWI2dnVGMHlidis4cSsrZWVr?=
 =?utf-8?B?UW1ZUEszZ3VsaWZmWVFSRVZmVXBCSUFhd0hjRmt1KzlOK0ppbklFVElzN29V?=
 =?utf-8?B?NTVlaTU1VUZXbTNUYVd4M2RPcENjc0ZYNXpmaVVuZHAxbWlxdFRtaXhKSEZP?=
 =?utf-8?B?dmExbjdweCt2cG5OUURSNUZWYXUvSmNSQS9PVXdMNnN6UWJaODlSczU0UEZ3?=
 =?utf-8?B?MDcwYUVBNnVMRG5Jc0Z5eHJPTkNTMXFDNnJ1VytYL0hud1dXamJ2OEM5amFj?=
 =?utf-8?B?RUxSclN1RTZMMVEwMkVqWm1rZGRkMjlhTURZbnBGdUdYNXF1cmRYYVZKcjB2?=
 =?utf-8?B?eWE2VmJ1aHRzaEtwdzF3SmJ1dkdJMnlOR0c4TUJnOWEzL3FhS0FhYklhVnQ0?=
 =?utf-8?B?YjhIdVNDYXRLSFRBNDkzdXN4TUM2VnEvWld3aGUzamREVU16alI0aUdmbmhM?=
 =?utf-8?B?QVVlMUZwWmJKS3lCZXcwK2V4UHRNRVd6clhUbStFZG1LNWg2RDh3TlhBVi93?=
 =?utf-8?B?aFhEQXMxRUJjNDhyaGVXQ0lobG5IMzNLdE82Z0hvUXVTZWhkZEdaRVgzOU5v?=
 =?utf-8?B?ZE5HUlFvcWJaTzZhcCt5enZhM1FNQmJaZlNla3VGRlNYdUJxZTY2dGJnREgy?=
 =?utf-8?B?emZzd2NrKzBLdFhxQnB4R3dTbW5SaElVSEdhOWFNbzBjc3JHMk9qWUVpNHhM?=
 =?utf-8?B?UzBQVHBWbWdGTlh6cWU4TGxHanNLVXZVaFdseDJnZ3RFMGExb3E4eWxkbjli?=
 =?utf-8?B?emJoUTVTYkNrb2ZPajhMbzBGOFlnOVNmQ3lIVDlrVTBMOW1FTGdKZUo3YXQx?=
 =?utf-8?B?L2ZTaDdqRFl6OXJoNVA2bDV0ZERBQTVnNTk3NG9kSm84L3BadzdOQlZWc2x2?=
 =?utf-8?B?YWpHM3NaanlMU2xVL09sYmxPZngrMU9WUjduZW5qWXV4YUhzV2d5eXdpRWVQ?=
 =?utf-8?B?RGNSVTZaMmZmK2tXUmdKQ2puWUE5TnFXeUkrK01uRnRVY1ZUK0Y0Z3ZWdVU5?=
 =?utf-8?B?bm9oeUhBL2Z1R2ZLMjNMT2YzTmkvbG00YWJNdTk4SVo4ZlIzMWx2S25wdHBR?=
 =?utf-8?B?Y1J6RlV6MkZ6YktQRjl6ZjdVaHB1Wm50NlZIeEtOcUgxT2NhZDlTVEFuUGJ1?=
 =?utf-8?B?ellKRzNFcThnTTAyMUNMSE94REpEN0tmQVNFSTV6OTlQL2lkaUtnNFpTVUJz?=
 =?utf-8?B?QWZlKzlHMnB6MjZpbnd5Q2pVMmpMRkU2THpDTXJ4RmkyZnpvdk9jZUpTT09N?=
 =?utf-8?B?eVloaDF6cjBiSmN1MFpacnkyL0UyRm9xRFVlSDRBREY5NjByWHYzK3RlZHhu?=
 =?utf-8?B?TFl1a1Iyb1VZMGNsaGx1ZmRLdzRmVjI2SFhNTGRobDc0dER0dVBhcEpsVG0y?=
 =?utf-8?B?T1N3b2dPcXJTS2dCVUE3VnBSRFFMSlFXRE1KWG0ySWE0MGM4bVlSNG9qSHdB?=
 =?utf-8?B?VWZRaFRMTWlYUUpHQ2cvUGd4TytiVzNDSzNTU2RDZlVwb0ZQazNYUEppdWli?=
 =?utf-8?B?dCtzU0hoZmpOamF6MkVuU2l4WGRZNDNBbW5Kemo2YmVWYkFOcks4U3pHbEFo?=
 =?utf-8?B?TlBVWjBCb1ZBQ0lpelVxWThxcFdsUk4vSTY4OFM1d1pYMjUyMVUxVEZFbGtx?=
 =?utf-8?B?UkUzNzdKNWFGa3BVclROZHRTNVFnU3lkUllBTnF2cjFjRjN2MEw1WHFZWDlw?=
 =?utf-8?B?MDdUblAyK1lScy9UaDkyOU10Sm9QZ0IyaTlXcllYZXEzV1Z4Qm80NHYwcEU1?=
 =?utf-8?B?RWdmODV3VUVsVjRTVjVCL1ZEZkdQMDNaeEwybFp3WUhLREF3Tkw1ckZMSk91?=
 =?utf-8?B?RDdCSFBSN2tRWmdvQkRyUXlMeWRUdzB5cUh3amNyL0ZRZi9UNTZFdHVXbGxn?=
 =?utf-8?Q?4z3/W1uomCaVeOUtNaCom1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31189acf-9d34-40d9-474b-08d9f201907c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:37:58.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvWEjHQDJTW3GeyosiKLJJ8t7cfgPSY1PW8daPVk8IEX/2JcvvMNI4DoOBYD/j/htGIrnDXuFMpztcW0RWLvIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3856
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 10:04:01AM +0100, Jan Beulich wrote:
> On 17.02.2022 09:59, Jan Beulich wrote:
> > On 16.02.2022 17:21, Roger Pau Monne wrote:
> >> Current retpoline checks apply to GCC only, so make it obvious by
> >> prefixing the Kconfig option with GCC. Keep the previous option as a
> >> way to signal generic retpoline support regardless of the underlying
> >> compiler.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Changes since v1:
> >>  - Put def_bool before depend on.
> > 
> > Just for the record: A slightly shorter alternative would have been ...
> > 
> >> --- a/xen/arch/x86/Kconfig
> >> +++ b/xen/arch/x86/Kconfig
> >> @@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
> >>  	string
> >>  	default "arch/x86/configs/x86_64_defconfig"
> >>  
> >> -config INDIRECT_THUNK
> >> +config GCC_INDIRECT_THUNK
> >>  	def_bool $(cc-option,-mindirect-branch-register)
> >>  
> >> +config INDIRECT_THUNK
> >> +	def_bool y
> >> +	depends on GCC_INDIRECT_THUNK
> > 
> > config INDIRECT_THUNK
> > 	bool
> > 
> > config GCC_INDIRECT_THUNK
> > 	def_bool $(cc-option,-mindirect-branch-register)
> > 	select INDIRECT_THUNK
> 
> Oh, looking at patch 3 again (which I should have still had in mind)
> this would of course not help. Yet ..
> 
> > A more appropriate thing to use for "depends on" might have been
> > CC_IS_GCC. With the next patch in mind this would then avoid
> > potential confusion if e.g. Clang folks decided to (also) support
> > the gcc style command line options.
> 
> ... adding this dependency (and a respective one in patch 2) might
> still be a good thing.

So you would like to make GCC_INDIRECT_THUNK depend on CC_IS_GCC?

That would be fine, but I think it's extremely unlikely for CLANG to
adopt the GCC options - I've already mentioned at implementation time
and they refused.

Thanks, Roger.

