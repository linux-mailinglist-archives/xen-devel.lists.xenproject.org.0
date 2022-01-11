Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2948AD99
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 13:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255721.438286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7GF1-0001N5-9J; Tue, 11 Jan 2022 12:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255721.438286; Tue, 11 Jan 2022 12:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7GF1-0001Jb-5T; Tue, 11 Jan 2022 12:27:07 +0000
Received: by outflank-mailman (input) for mailman id 255721;
 Tue, 11 Jan 2022 12:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7GEz-0001JV-C9
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 12:27:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7017025-72d9-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 13:27:03 +0100 (CET)
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
X-Inumbo-ID: c7017025-72d9-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641904023;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eNYI7UsabAjupoFjASJk0S/FKfhBzUI4MrAu1Q/JR6E=;
  b=J5uzNcfoc1409P5azSEfAiLbxIfczgPJX5bdIZsyu3ybGX6U2dgSuhgj
   70kW18kWoMTyx2lqAIg0c7cYzVm55ZDnygAV5AqW0a+C7j+iJfkiPK72Z
   MUl4LXbrhVK+xEHqhqhPyJzK9E+TXqTiBvjMd6sdALOduUZV4VBrwM/zp
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8VfBJGKwy/edTJfchJ6LKB/ydzmDKUowSGiIfX1dbiWbWwfu8V8HWOhP7fnE4ogGi8KRMwsPCm
 480YFkKND8U0RDuqs6M9+o5N9rQZV9H5E3C8vwo0B/X8c+2BUUahxe2p5Nn4e/pMCDGCklbjmO
 pCZzMIoB3Z/of/neU8FmlL4SCDw9xigBb+biZ5/xbJ6wU8hOIK1Qcm0rtM6uhXrLYEF4e1hfPz
 teSIBi/FP1CiQffjltgN2W49Z6TStEvd/JMoB+Xbodqk9F8XFIiMOdpZTB4y2kNmvD/hA+nT/U
 utlJmn/uruSxgDccr3eAv/1a
X-SBRS: 5.2
X-MesageID: 61728089
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dB0/daLSaDlsOYuoFE+RBpIlxSXFcZb7ZxGr2PjKsXjdYENS12YDm
 zEeUTuBM62JNmWkLtx+Otvk8h8FvZbVyd43T1RlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us6wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2FpdUpx
 IUX5KWgWBxub4vUlcM2UxNxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvIACjG9g16iiG97+Q
 pELQGNvUi3DZh9wag4cAZwnsbeB0yyXnzpw9wvO+PtfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlKt6nuxgsffkCW9X5gdfIBU7dYz3gfVnDZKTkRLCx3r+pFVl3JSRfpTE
 UlM9np0/JEi5VfsH//lUjqToHSt60t0t8VrL8U27wSEy6zx6gmfB3QZQjMpVOHKpPPaVhRxi
 AbXwoqB6ShH9eTMFCnDruv8QSaaZHBNRVLucxPoWufsDzPLhIgoxizCQd94eEJepo2kQGqgq
 9xmQcVXulnysSLp//jjlbwkq2j1znQscuLTzl+MNo5CxlkoDLNJn6TytTDmAQ9ode51tGWps
 nkegNS55+sTF5yLnyHlaLxTQOj5u67cYWWH3AYH83wdG9KFoSXLkWd4umAWGauUGpxcJW+Bj
 LH75Gu9G6O/zFP1NPQqMupd+uwhzLT6FMSNaxwnRoEmX3SFTyfepHsGTRfJhwjFyRFw+YliZ
 8vzWZvyXB4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMqTI+KPi+TOPRZ4iN4tbTOzUwzOxPjV/1WOr
 YcObpviJtc2eLSWXxQ7OLU7dDgiBXM6GYr3u4pQcOuCKRBhA2YvF7naxrZJRmCvt/49ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:xWE15aHmbx5OBqaspLqFcpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="61728089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2nnm2Fws0hrPO5BaJeK8I8EGYwl64seTRut7iRiBpYZzKM9k/HvBWN0vbfaGyeMdMNAJ0eifn6srICe8Ok5P+6CJD2EYSImCjm1eca1MZ29h5c6RdMdaUbphk+kK5XJ4s9mizLGBQaQKyEX8/QzAAB85LZyQA+uXzpnpDrS1afSBOGPiR48wOsCs8Ap6OuWke9NMl7eSjqW0iXqBYo2Riga/7n2f1FFQemD8F2YAjB3lH1/W+TKrnrdm9vWTgyu3rnhsaeTS7nX4swo406TqcEp9CiXL6uN6Ukuc1OoP7syjnlQkmCuwAdtaf1xdtFtYU3z0wC0XuXYBmArXloSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNZgnwuptzBzEGMvcSYkniLYjs09275LUt0a3j2y5AU=;
 b=b27X1bLbu7FpFbQOcogh7Xc9kzSRPWsS7sRUleo2pOz2P+h0xRnxSGKDQ9rGrrtxI3j7eGNKHFkjLLsZbd34QS+1NUr/JUK7BkwEgUCbWYNRFGGRqHzASPBr5ePzkSAvm3ePXtm4yVIYyuy4wunKLqaJ5GXOvz7OuYIcCg1guPnk4l2o8N4ykdgotZusBIARMAQ5vs3dvgAtapuy/JJq2bUdIA6+Qzog5eDT9qgKSaBXsHnT53KZMnw8yI8cBAVtH6/V5yvHMOlzZvDX5GzRATLB1+FmQg565rQhcXoH7UXNHeBvH6RUi13kzxm08GNsIjhL9Z/kpb+wCb9I+RNSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNZgnwuptzBzEGMvcSYkniLYjs09275LUt0a3j2y5AU=;
 b=cSiidyjnpVkj7XlxVdUFkx1aYRrnIIUu627bGM27W2Q9QhemhyR/aEHJ3ucUh/HGHzLs4F4f1hDi3zi+LWz9/YVqza/FZ1Js8sz6+pyCR8Q0QBQIdHNRfjWThhtOszRf0YW+ca6AbBjx9I1mzTm8Ta+pKsgxjJ3SnwTvcOEspkQ=
Date: Tue, 11 Jan 2022 13:26:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen, blkback: fix persistent grants negotiation
Message-ID: <Yd13iklHYgCxrLQw@Air-de-Roger>
References: <20220106091013.126076-1-mheyne@amazon.de>
 <Yd1l01jTPwx5oBuo@Air-de-Roger>
 <74977663-c229-60c7-fae3-d13ff4a8d558@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74977663-c229-60c7-fae3-d13ff4a8d558@gmail.com>
X-ClientProxiedBy: MRXP264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 791c5074-4ce4-49c7-92c6-08d9d4fda777
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB460291CCBF64C9471E37A1168F519@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nd0zh5M4czuYckYp38iz07TYpEoKNr+XxI4Hzr7YdVkb/hPw1zfkR4t6vDgxxRcj7ARjP6xsuOevMGDF8UMuFSXZ8+a+fLlzi9a36LB0FTiQ4DI3eqXsarhL7wfT1FI6BDaGPdaniJ9QVY7LOSvNjTYHPrniSyizZKiyVBTqQ1aDv6nQPeUOx+At5UrEtsLs7dzbS6gcFaGaaBgBQiTaYcWBFTG+pXtIUx/T08PjK4QdJsmdl8smH7QRi3IXX3c15tgk6tzPYilEF02MbyfcQwhkhdEMQWA5rROG8uxVnMP+zJiVNXvhNP1OWnFfXv5zr9aUGxVTPD2TRg2mRksOBDBftNDGD5I9g97U6fwd7j6SVrOc3eJ/jY7C6tiJO/CsU1gmR9qi3MkXUt5Nk5NweWeWC1yDIJcRsczWjVTBvWUyzNnNWkQHHjrJKMmXKJzZ5YlZLVNrWWuPg+SzMCS9w1uOs0E38dcMm7ZMpoHCZ1HMsNfe/52sO1aNe0w75w4T0CrTF+H6UmGWqjwHKyR60pwtu4LUdibrlg5YhDcxrQNQgEL9Xct+SbAe52BHper15oWpkZSqpfEqHk+ELD31wpM4cjAAhNOb7ZSqm6ojZkzh0mM690xXkedKrJykNnHQuVDLATf9w6bLB3j2Di2jJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(4326008)(6916009)(86362001)(85182001)(6666004)(186003)(316002)(83380400001)(26005)(53546011)(5660300002)(82960400001)(6506007)(8676002)(33716001)(8936002)(2906002)(66556008)(6512007)(508600001)(66476007)(38100700002)(6486002)(66946007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHRMSS9TRUdRZjloTndBc1ZONUxnaUtIWDZXOUNtR3dQR0ZyNnZwamVtOW13?=
 =?utf-8?B?dm9tSWdHc1U4bkh3Nm5SVUtlY0hUWHd5dXBnajJ5Qk9MM1doTjlnOEp3V1lF?=
 =?utf-8?B?RGd6TnpnQVhkMXFoZmRlNkNWQWh2UHg0YS9ldzhGeU95QmNZQzZ0R3pGbkZC?=
 =?utf-8?B?UDlZN3J4UEpDRWJCNmF4LzNQREI2NzEyOXhvTVVHejdzbCtXWEhKblVMbkg4?=
 =?utf-8?B?WEJvczA1eGZYL1FBVjRpLzVYT2dMZWFValBFWmo3c0RQSXc3ZjRiaElzdEJ6?=
 =?utf-8?B?U3lHbEkrelo3Vk83M1FkeWo3RThJbTFHeW5rQTJheHVkMkNab2ZGRUFTR3hv?=
 =?utf-8?B?SURFZW9weE05YXJmd2FQK2lSNU40M2VpZTVZOUMvRTFNTXVKWTA2SC9iNFJI?=
 =?utf-8?B?eTVHWW1Eei9oT2tlRTE0SGdMTFprQTQ4L1MzekJOeGplZ3hNWmI4YzdtWFVJ?=
 =?utf-8?B?WDNVbjJFOFpjSTFpS2gySGlmZHZNRUk0Q0xPT2k0SVdjQzRpWXNhNklzcUZ3?=
 =?utf-8?B?RkhYOUFMY0JwcW1QenlXb3Ric04xTENoVm5TY1h1cERxWVZobUFEVnpOYlRq?=
 =?utf-8?B?aDR5RmptcXhSSk04dlZka1lwSVhwc0N2MTFFek40eHdvR01taENVSHpVUHM4?=
 =?utf-8?B?QTRaY01CS0pmVVMzLzE2T0wrdmZTUk8wdjlsOXR6OUFRUGtsd1p4R2lxZFZG?=
 =?utf-8?B?b2JUSWZsOWxPZ2E0YlV3cFAwSVNiRXI2cGR0OWZWRXhoMmhqQWhOMmRmTHAr?=
 =?utf-8?B?M0VtUlJNZUU0bUNrd2djT2FqdEwrUVpIbHBlUzI2K04xVi9VVmxnZzJPSUlS?=
 =?utf-8?B?NFczd285Yi9XUjgzRFQzbEtCTzkzZ01BeDBzdXFlcFBIQXFaaFBrdHVPdXNt?=
 =?utf-8?B?dit2aHF2MTlTYnRGLzNBVzY5dTB3UFBMWFlzdU15L0JISGp5UzRTZWR5SDVF?=
 =?utf-8?B?RWxwcU92VVVCbmI4K1FWUjF1WldQMEc3dHlHN0ZxdUdHS0dmYW1qZVlpKzV6?=
 =?utf-8?B?R09sWnFEb0c5M1l4NzdNclNzSTVweEhYZ1h1LzFtNlg1bngzajhldU4xTVJO?=
 =?utf-8?B?bVl6MXlWeXU0Zm16UVZRcEZNcjJIanRnOTVpM05ObHFmKzZVMTgvMUFwTW1t?=
 =?utf-8?B?aTM5cmk5N3U0Q2lsVy9KYTRNdVJzUG9CNXdXZDU2UkVPM3l5V0dSdFQ2Q2ps?=
 =?utf-8?B?VWZBb3dGYU96RTRwQmZacllJaS9VNWlNeGl1TnorMnVDODlvZ1o5elVSalVE?=
 =?utf-8?B?bnFTd1BQQjVpV3hMVklGZ2RiVVFDNnhXSVlqY3pWQlliRklLWExydFh0enl1?=
 =?utf-8?B?Qk9GSlF5L05VQzRDYVROMUpxM2UvWVpSNzZ2bEZQQ1d5cDlqdkQxenZnOXAx?=
 =?utf-8?B?OUJUTlAvdkFBRlJWcXoyMHNHNElwTjBHcEpWdGhtL2lreHlQTlI2UEFzandN?=
 =?utf-8?B?R2RFcERxSzBhSTZOb3d3M2dDc3FvM1FvV1Z2OEJvK0I3eVRkRmd1am00M3ZV?=
 =?utf-8?B?eTNpMnJGaTdSRk04ejdxVXQvM1B6N0I1bnlLZ1psa1R6M09VeUtzVHhEbmRT?=
 =?utf-8?B?NWh1aTNxSDdjUlVEamdVZmZEWVRjUjd2MnBQenRnaEtjeXluOTNGdGEwdno4?=
 =?utf-8?B?T1NEdUtIMlVSVmNIb3BmNlNENFV5RWl4Z3pJVjFRcmxuVTVrWjJrVndaQWx4?=
 =?utf-8?B?YXVrOVVyajVZdU1tdzIvdVE3YmcySUtzQWw3R2d5Y0NmY2R6eU1oejlVVTQy?=
 =?utf-8?B?U09zZVZLNXgxUnh6UWhTcnpxQ1NsOUJOb3VRdkhkSjJmK3pnTWpLVERScVZV?=
 =?utf-8?B?dFB1Y1ArRDYrd09qbEZsbm5TTWZLUnJJQlZTU0g5L1Q5eWVlZWNpZjBOOFJK?=
 =?utf-8?B?WWNrNWxEVjhQaUEvN1BVWTkrVmhVMStYS0RROU5DaU5QL3B3bDU5TkwyNFlQ?=
 =?utf-8?B?V3creUNqZVNpNXNscVovWE1vWHlodVpjVDE1RlUxcGVEOTNZRlVWVjdidFlD?=
 =?utf-8?B?bFIzVmtIM2NpRzQ2cko0Y0g5SlAyOUNhNlhndmNOTGxwT28ybDhKM05uSHFs?=
 =?utf-8?B?T0ptcDdQV2FoTndPcms5dGpaT1RwY3pESzJxb0M4aExXajl2Sy9JcDRLWGFV?=
 =?utf-8?B?TGRHMVIxcnJzU2Z4Q1hnbXdsaVVvTStyT0JqVFhrUHRpNWpMVGNNRzJXU1hR?=
 =?utf-8?Q?7OBYOhTcIuIzODkK5UP4v+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c5074-4ce4-49c7-92c6-08d9d4fda777
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 12:26:55.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFsr1g7Z+oToIMzJVP66YJ4WO6Qd+w9XVgASW4JZvcCvWBx/I2rPx2E3ygtVVBaELZF3Ov3wggLg1LKfje0TEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

On Tue, Jan 11, 2022 at 11:50:32AM +0000, Durrant, Paul wrote:
> On 11/01/2022 11:11, Roger Pau Monné wrote:
> > On Thu, Jan 06, 2022 at 09:10:13AM +0000, Maximilian Heyne wrote:
> > > Given dom0 supports persistent grants but the guest does not.
> > > Then, when attaching a block device during runtime of the guest, dom0
> > > will enable persistent grants for this newly attached block device:
> > > 
> > >    $ xenstore-ls -f | grep 20674 | grep persistent
> > >    /local/domain/0/backend/vbd/20674/768/feature-persistent = "0"
> > >    /local/domain/0/backend/vbd/20674/51792/feature-persistent = "1"
> > 
> > The mechanism that we use to advertise persistent grants support is
> > wrong. 'feature-persistent' should always be set if the backend
> > supports persistent grant (like it's done for other features in
> > xen_blkbk_probe). The usage of the feature depends on whether both
> > parties support persistent grants, and the xenstore entry printed by
> > blkback shouldn't reflect whether persistent grants are in use, but
> > rather whether blkback supports the feature.
> > 
> > > 
> > > Here disk 768 was attached during guest creation while 51792 was
> > > attached at runtime. If the guest would have advertised the persistent
> > > grant feature, there would be a xenstore entry like:
> > > 
> > >    /local/domain/20674/device/vbd/51792/feature-persistent = "1"
> > > 
> > > Persistent grants are also used when the guest tries to access the disk
> > > which can be seen when enabling log stats:
> > > 
> > >    $ echo 1 > /sys/module/xen_blkback/parameters/log_stats
> > >    $ dmesg
> > >    xen-blkback: (20674.xvdf-0): oo   0  |  rd    0  |  wr    0  |  f    0 |  ds    0 | pg:    1/1056
> > > 
> > > The "pg: 1/1056" shows that one persistent grant is used.
> > > 
> > > Before commit aac8a70db24b ("xen-blkback: add a parameter for disabling
> > > of persistent grants") vbd->feature_gnt_persistent was set in
> > > connect_ring. After the commit it was intended to be initialized in
> > > xen_vbd_create and then set according to the guest feature availability
> > > in connect_ring. However, with a running guest, connect_ring might be
> > > called before xen_vbd_create and vbd->feature_gnt_persistent will be
> > > incorrectly initialized. xen_vbd_create will overwrite it with the value
> > > of feature_persistent regardless whether the guest actually supports
> > > persistent grants.
> > > 
> > > With this commit, vbd->feature_gnt_persistent is set only in
> > > connect_ring and this is the only use of the module parameter
> > > feature_persistent. This avoids races when the module parameter changes
> > > during the block attachment process.
> > > 
> > > Note that vbd->feature_gnt_persistent doesn't need to be initialized in
> > > xen_vbd_create. It's next use is in connect which can only be called
> > > once connect_ring has initialized the rings. xen_update_blkif_status is
> > > checking for this.
> > > 
> > > Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
> > > Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> > > ---
> > >   drivers/block/xen-blkback/xenbus.c | 9 +++------
> > >   1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > > index 914587aabca0c..51b6ec0380ca4 100644
> > > --- a/drivers/block/xen-blkback/xenbus.c
> > > +++ b/drivers/block/xen-blkback/xenbus.c
> > > @@ -522,8 +522,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
> > >   	if (q && blk_queue_secure_erase(q))
> > >   		vbd->discard_secure = true;
> > > -	vbd->feature_gnt_persistent = feature_persistent;
> > > -
> > >   	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
> > >   		handle, blkif->domid);
> > >   	return 0;
> > > @@ -1090,10 +1088,9 @@ static int connect_ring(struct backend_info *be)
> > >   		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
> > >   		return -ENOSYS;
> > >   	}
> > > -	if (blkif->vbd.feature_gnt_persistent)
> > > -		blkif->vbd.feature_gnt_persistent =
> > > -			xenbus_read_unsigned(dev->otherend,
> > > -					"feature-persistent", 0);
> > > +
> > > +	blkif->vbd.feature_gnt_persistent = feature_persistent &&
> > > +		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
> > 
> > I'm not sure it's correct to potentially read feature_persistent
> > multiple times like it's done here.
> > 
> > A device can be disconnected and re-attached multiple times, and that
> > implies multiple calls to connect_ring which could make the state of
> > feature_gnt_persistent change across reconnections if the value of
> > feature_persistent is changed. I think that would be unexpected.
> > 
> 
> Would that not be legitimate though? What happens if blkfront is upgraded
> (or downgraded)? Each connection should be 'groundhog day' for the backend
> IMO.

Previous implementation cached the value of feature_persistent for the
lifetime of the backend, and I assume this was the intended behavior.
Ie: so that an admin could create a set of backends with persistent
grants not enabled and then switch it on afterwards and expect only
newly created backends to use the new value.

If the intention is indeed to read the value of feature_persistent on
each reconnection it should be noted in the commit message, as it's a
behavior change.

Thanks, Roger.

