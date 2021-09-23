Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851214158FA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 09:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193431.344530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJ4s-00018p-B0; Thu, 23 Sep 2021 07:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193431.344530; Thu, 23 Sep 2021 07:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJ4s-000172-7g; Thu, 23 Sep 2021 07:23:30 +0000
Received: by outflank-mailman (input) for mailman id 193431;
 Thu, 23 Sep 2021 07:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTJ4q-00016w-1n
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 07:23:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24126841-1c3f-11ec-ba1a-12813bfff9fa;
 Thu, 23 Sep 2021 07:23:26 +0000 (UTC)
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
X-Inumbo-ID: 24126841-1c3f-11ec-ba1a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632381805;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jivZlARPbfDHiXmS1tCj5pdBOxyHVp0XI8yxs7i89dA=;
  b=SePGp5D1TYYX18taFYc61gWFml9WyMvffkXnBJsxMTs2uQSsZNepdESp
   8vJ62Tki4k4t3I4hdzxXBnLlPdr5EhkSHsVPf85tPaCvJBfc102rnQ56C
   Pp4N6tXiSKvjZFMm/smJntuspLLwW4tBQuSZp3oIqRqDZpGBynhIvQCD1
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CW5gxOjWoC9Oi5dL8MxWCPd1ZWAvIZ+FmMuvfwqn4L++19JXCFa4JUFrkKyoUYAZ47NmVg73N5
 KXFb9cMc6dvtu9HUPZAHHUMxxcl1R3r7cCFszIPEWtKw7eRapzMywJnrrR4yD2/UcN+8u0jAuw
 XGPf1tvwNGmGCUfBEMdgjHQ8SuzTLgQW05QbRc7pmyblsWbreUiuTtdi8fI8j5hrqwdF+9HaGw
 1pQMzQMNywAVV3v8W3Z4eeBuy7KlN41/CG+mHuby8za33SpBSJPfLXHkWoSGQ66klz3nKSUkS3
 FIFpSHB1dcqOUQOYh3O2DCF8
X-SBRS: 5.1
X-MesageID: 53403100
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uDKYSqyM5Sov9Cj2kbN6t+eUwSrEfRIJ4+MujC+fZmUNrF6WrkVUy
 2IYUWuFOPiOZ2ryf9p+O9u39EsPuceGmtE2HlBtpSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRi2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt80ty
 dBdr66LcAtqE7/0ptkldRtDUAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIDgG9r35gWdRrYT
 /cJSytWfT76WEJSK10ZB9UO29uJpXaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19hE+Ap
 mTH+WvRCxQTJtuZjzGCtG+v7sfDmi7xVYY6Hbix5PlsxlGerkQSFx8+RVa9ueO+iEO1R5RYM
 UN80igzqak/8mS7Q9+7WAe3yFaGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bk07OS8Z5IpWMgp7YCwnO/
 gisrjN9ruBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNPztAKFhRpUBMPAFADQ4
 SRd8ySLxL1WVfmweDqxrPLh9V1Dz82MNiHVyXVrFoMon9hG0y/+Jd0IiN2SyUEADyrlRdMLS
 BOI0e+yzMUKVJdPUUORS9jqYyjN5fK8fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yVixBUvw/l2TsFrZ1PVoXKsYWnzi7qXfTlUjP7FZjTCTNFedt3KWmNIjVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQpiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTZ3dxYgr4hyZ5Me5CLs43LvMKQFXuz8Q6pdZcR
 PgZYcSQRPNJTzXM4TMGapfh6odlcXyWacimZkJJuRAzIMxtQRLn4Njhcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQDKl/x9IVKKjDqiqNlKc87NhielCCR0
 BybAElEqLCV8ZM16tTAmYuNs5ytT7llBkNfEmSCteS2OCDW83CN24hFVOrULznRWHmtoPepZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GNg35BKlhL3+K2dh0mpdMnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSFQcOl1PYciz
 btzscIa8VXi2B8jM9LAhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZoUeKFQuL
 x+VmLHG1uZVyUf1enYuEWTAgLhGjpMUtREWlFIPKjxlQDYeaiPbCPGJzQkKcw==
IronPort-HdrOrdr: A9a23:vBDNSKESjsZn6t88pLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53403100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls6zfH39QrhwpjVy7aoO1/2kPyPVbWkjfzjY9Eoeeay0EVTLtylONrkQ1nVkleDSCpoWyjJ2RTC51DDF+B4pzZuUFsggCL9k60OlUEErH2Ew56T7a8PQerW+nG3mP/Qov82wKK7mNpdeHsmAJTZOEPWMxjT+F4jVlVo8nR3R/xKPs9858zxBKpuPbkjjJc+WkFseGBZTDRGxO/ogkKFN7LupnOGCxl86rU/RlkUehSgju3bbsco+q1BmywaFzm/5CXd/Zs2zxOM7VJ++2vTqMVy15ExOgpWhlWjhDVl0MJAsgs54XDDKJNMNXsVJYA8IwBuvAX5vpfFlft2OXuFzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z3sBADxbHmgf+gWA0mJP8l4iNdX4Q4e+8btyNSbBulU=;
 b=HY4BiAQ8OAcI+VwLb5wMgdmKdIJZvndB+YNqpgy8rc/Zm6tVLcWKOYqlXjSHgW+wTTQp4iBJXa4rLQjQH9oDcwjDqDHCGY8LoLKYz3u5hXLizPiR90K3fdfXilVEubDan2pAReF0RIKQFy8iIPNxKylsxmm1Gh9RgQRYtlMLE/TJXfDVSlftfBIYTAmgWFL35f1zpx5iYFaW/ig4etrCwyrgA2OzGHAHbWuW11YHcJ4u43PFVtuGGXj3m3u3ArrJPtpVJdQ0CDtVVe0oXPBx3jqmLoXek/OYnzE3BPXCK4T2RMRxHFqt73K+1EZc9Y9SZHu1zG1A5b6jm7q3dpFijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3sBADxbHmgf+gWA0mJP8l4iNdX4Q4e+8btyNSbBulU=;
 b=XcVwn2LvO6zusvq+cczayePhnVHfTL5eCHN20/z0qyH7J505cELuRemz1vF2l55GX1RmZmJpCuAztSSDWfnZoc+5sBpK5R5mv0czbiRlky68ArlMJ3gH36Ge5UJQZ5Cs3Wr3yOhLWSSFAkJD+2GZRohTKK5aGT95x9BxWcJeXVo=
Date: Thu, 23 Sep 2021 09:23:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, <raphning@amazon.co.uk>,
	"Doebel, Bjoern" <doebel@amazon.de>
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
Message-ID: <YUwrZS3FOh+hCQle@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
 <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
 <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
 <56bb55e3-ca7a-12e6-5848-84756b431846@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56bb55e3-ca7a-12e6-5848-84756b431846@xen.org>
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3a7603-7f8e-406f-5655-08d97e63063b
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:
X-Microsoft-Antispam-PRVS: <DM4PR03MB61920586447420DE701BC2398FA39@DM4PR03MB6192.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yLB7tOsOrxRPC02NQAJ6tpKaUwAtZ8h/s1U0RbEFSxLnWEERwTEJ3djl9mV5uiK99Ltj+21doPo9fhxjDWyUZ49R/RSYxGZQc9r1uFGekHWbsHPvSiU4Cpc655B86shcZshwATkd4zT6GQ4vM7XYDmsnqfA7ic+wcmqLgp6bg1iB8pEsei8Z/0VSCqpo/XhJ5b/SNgU+6wlO7EOUlVlFrMJat7gKcz8SvbSWSvHuJIl8SGZvzj7FVS3cEMUPCatrfYYHBX5iTwjJLiPfvv7TjKQEvFLydA1+J/C+vORZcChh93K6OpaxXNnCi6aFXhiG4NH3IP6Eqcx46bJWSICrNwLJcF6QvZkRadnRrPs5za37aMaa+405h0nN1TgTe9WPcnWfS6wBSlUeWvf2xSfkJGT+dbW0Jewfy5gdXMRo6KjLaghV7HyX0WsuObNSkaArGux76sRFaxk91RqvOv7F7CFd57VLYv1NuDfuCn8MbnyLqlTO+h947JEq/a6sb7mHGajErdl0Q9h7mBvPpVZO6k9YIENZoM9npfp1kgGnJVg8nwedW1SgGzUT/G8qgm85iHtRKzJQy3jYaNm22kD8gp/MoKM5FZeKcBCbDdYuI/gEngIhluXt2AILoigPxIokfUME7Dr4vxLau2Ac5kPigCVNlJuLeTjtGz4gYneEAqOglrd5RB+NgAERkO3Exd7ILBmiJidokwEbv2MkXJhdFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(316002)(6496006)(83380400001)(66556008)(6486002)(6666004)(66476007)(8676002)(9686003)(2906002)(66946007)(508600001)(6916009)(956004)(8936002)(186003)(53546011)(54906003)(38100700002)(5660300002)(26005)(86362001)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJQb2NCa25UYTh0QmJnREs5UmNaQjY2aVBjYmJJbCsrSGZZYldseHRPSkxF?=
 =?utf-8?B?b05ONDVqVFVia3gvZGNKMk1YMmNPZ0dGS25TMEFqL0w3dUNlQ2FGWEZ3bGxG?=
 =?utf-8?B?UWg1bVY0UmdWUFJaeDFMT0VaUGNTc1JWQmpRQjFCRnRDSmpGYXN0RTBJVVhz?=
 =?utf-8?B?eGt1MFAvWXFuUDJGMFVtZmFIVng3YndRWkpia29WWElNRm5wNUdXdzE0dXQ3?=
 =?utf-8?B?NFBoVGdVNHcrcmllOURpVU5tWm56U01CeThUbW5kNDB5WWJ2NGFJS284cmwr?=
 =?utf-8?B?dmxTRU1STzlhb0xFVEhoMkNIRWhoaGViVEFsOGI0QmpWby9UYkVUQlUrVy90?=
 =?utf-8?B?ZUpibDc4bndQRTBIcjRYVzlmcmhFQXZjcnQzQUFqaDlyaXpId1FhYVRBQkdM?=
 =?utf-8?B?ZU9venluMmhzanJUMWMySDVKZzdvdEtsRmR5b09LaHRsS1MyRmxvbnAwRGZL?=
 =?utf-8?B?ZngvT1U1eG9YN2FSTDJDbjRDc3lVQ2x6dUYzL29yVGVncUNhSVdJNlNmNkEx?=
 =?utf-8?B?MnFHdXQ4VjllZ2lTa1V5Z3BtMGNzR2M2NDU4eUF4UnBoVlNUd3lJbWU1SUFO?=
 =?utf-8?B?SjdrR1h5eE0wOVIzbG9DTGRzRU5YM0RWZjIxd0JDazdkT0d1UEpEUnY5Y1RT?=
 =?utf-8?B?M29hWUhCOFpKR1UyZHlBdTFOVGxWT2FZN2J4ZlF1bUlXNVA2U20xRGp1ellN?=
 =?utf-8?B?b3ZicDhtNC9pSEZ6UmZBc2FiYzBNOXBpMEIxRmltVCtrSHo5M05GczFxRDBz?=
 =?utf-8?B?SUVVa0VGYW5ZUFFQMTI2bVp0bDRGTURocVhiVngxQzZFVlFxNjRBYm5BZlZm?=
 =?utf-8?B?dDRiak1WZmtMdVhCWDVKaVpidmRtTVA3K0NWL01HYUpGOFZ4SUw5aDA2NUh5?=
 =?utf-8?B?ODgvZGJkK0E2NGZNWnFqOXhCMDFLY2Z4cHdISEUyc0xQSnJwcEtSVk82WUxL?=
 =?utf-8?B?SlFWN0RHSXJPZ3hRbDRLMzNHM2dJUHVDQW1FczNlOWdvQ2FpOUI2KzVDVkVh?=
 =?utf-8?B?eDcrTzVoYzAxbkNjMFNzYkk3eUt1bUZBbUVlSWoyTkRJQzJHZm5lQUxTTkNq?=
 =?utf-8?B?M1QrUS8wZytOaVd0c2RXZ3g1U1ppZXhJeEdjS0o1cVdZNTZjSndyYlM5REh0?=
 =?utf-8?B?Q3dMS3djY0RoekQ5TXFPVHlkUElJSVgzNEZMUUkrNGFEZ1gwNzRHU1kwQ0dv?=
 =?utf-8?B?bjlpODI5bnhhZmdYTTJueUZwcFppcG0zS05DZzZBRnpuQS9ySHJEMXZybDRY?=
 =?utf-8?B?dnpxdjkzek52blNORzgyRzVyRWt4Qk1zMkhKTVZHRHVLbkZSQTM4dTRWcExt?=
 =?utf-8?B?SXVIcVl1U0FpSDJsZUFZNUZpUjFEZzNmQThwb1RHb2ZJRW5BUCtjcTg4WWpw?=
 =?utf-8?B?cGsrQldSc2lqQW9VQ1E4c0FQODRDV2tKWDFKcXZpd2NoYWJ2dXZ0MWtGbjBV?=
 =?utf-8?B?ZDUrVzNsV0o0ZVBObmg5bTNqNW5wbkZMU29FaEhUVHFLZmJRZ2RYM1hBM04w?=
 =?utf-8?B?enFQQktlNXg1cHErQXdVSGFBdDR1THd5aW5ub1RwSGI5NWxzdjRxdzZrWnRF?=
 =?utf-8?B?MzFVWWtLNzVMN2l0OEhiYURvOC9VZUZ4b3dxb0NFWkl2dHFVeWtmQThIbFUz?=
 =?utf-8?B?cFMrbzR3ckdIQ3QwZ3VwS1VrQ01ObXZIbnY3WEo1emJENUQ2VlN2blYwaFhl?=
 =?utf-8?B?Qy82SGtPTlpFQktTRkptZGd5aGo0MUUwRHl2dWNJVG05LzFCWm4zdU5sOEhH?=
 =?utf-8?Q?foQrrf71XTBroU3vd9XubMmXuYZdYanSAvQvRZA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a7603-7f8e-406f-5655-08d97e63063b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 07:23:22.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpFOtccEpdECaymzyuYC9YsZvKg96xyw6KXufWTzCKjxEKnfDmAJ0pd03l0j3JqCtg58vSJuANRn7hiAWwsfzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6192
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 06:46:25PM +0500, Julien Grall wrote:
> (+ Some AWS folks)
> 
> Hi Juergen,
> 
> On 22/09/2021 17:34, Juergen Gross wrote:
> > On 22.09.21 12:23, Julien Grall wrote:
> > > Hi Roger,
> > > 
> > > On 22/09/2021 14:58, Roger Pau Monné wrote:
> > > > On Wed, Sep 22, 2021 at 02:07:44PM +0500, Julien Grall wrote:
> > > > > Hi Roger,
> > > > > 
> > > > > On 22/09/2021 13:21, Roger Pau Monne wrote:
> > > > > > Failure to map the shared ring and thus establish a xenstore
> > > > > > connection with a domain shouldn't prevent the "@introduceDomain"
> > > > > > watch from firing, likewise with "@releaseDomain".
> > > > > > 
> > > > > > In order to handle such events properly xenstored should keep track of
> > > > > > the domains even if the shared communication ring cannot be mapped.
> > > > > > This was partially the case due to the restore mode, which needs to
> > > > > > handle domains that have been destroyed between the save and restore
> > > > > > period. This patch extends on the previous limited support of
> > > > > > temporary adding a domain without a valid interface ring, and modifies
> > > > > > check_domains to keep domains without an interface on the list.
> > > > > > 
> > > > > > Handling domains without a valid shared ring is required in order to
> > > > > > support domain without a grant table, since the lack of grant table
> > > > > > will prevent the mapping of the xenstore ring grant reference.
> > > > > > 
> > > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > > > ---
> > > > > > oxenstored will need a similar treatment once grant mapping is used
> > > > > > there. For the time being it still works correctly because it uses
> > > > > > foreign memory to map the shared ring, and that will work in the
> > > > > > absence of grant tables on the domain.
> > > > > > ---
> > > > > > Changes since v1:
> > > > > >    - New in this version.
> > > > > > ---
> > > > > >    tools/xenstore/xenstored_domain.c | 30
> > > > > > ++++++++++++++++++------------
> > > > > >    1 file changed, 18 insertions(+), 12 deletions(-)
> > > > > > 
> > > > > > diff --git a/tools/xenstore/xenstored_domain.c
> > > > > > b/tools/xenstore/xenstored_domain.c
> > > > > > index 9fb78d5772..150c6f082e 100644
> > > > > > --- a/tools/xenstore/xenstored_domain.c
> > > > > > +++ b/tools/xenstore/xenstored_domain.c
> > > > > > @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
> > > > > >        struct xenstore_domain_interface *intf =
> > > > > > conn->domain->interface;
> > > > > >        XENSTORE_RING_IDX cons, prod;
> > > > > > +    if (!intf) {
> > > > > > +        errno = ENODEV;
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > >        /* Must read indexes once, and before anything
> > > > > > else, and verified. */
> > > > > >        cons = intf->rsp_cons;
> > > > > >        prod = intf->rsp_prod;
> > > > > > @@ -149,6 +154,11 @@ static int readchn(struct
> > > > > > connection *conn, void *data, unsigned int len)
> > > > > >        struct xenstore_domain_interface *intf =
> > > > > > conn->domain->interface;
> > > > > >        XENSTORE_RING_IDX cons, prod;
> > > > > > +    if (!intf) {
> > > > > > +        errno = ENODEV;
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > >        /* Must read indexes once, and before anything
> > > > > > else, and verified. */
> > > > > >        cons = intf->req_cons;
> > > > > >        prod = intf->req_prod;
> > > > > > @@ -176,6 +186,9 @@ static bool domain_can_write(struct
> > > > > > connection *conn)
> > > > > >    {
> > > > > >        struct xenstore_domain_interface *intf =
> > > > > > conn->domain->interface;
> > > > > > +    if (!intf)
> > > > > > +        return false;
> > > > > > +
> > > > > 
> > > > > Rather than adding an extra check, how about taking
> > > > > advantage of is_ignore?
> > > > 
> > > > Right, I just need to change the order in conn_can_read and
> > > > conn_can_write so that the is_ignored check is performed before the
> > > > can_{read,write} handler is called.
> > > > 
> > > > > >        return ((intf->rsp_prod - intf->rsp_cons) !=
> > > > > > XENSTORE_RING_SIZE);
> > > > > >    }
> > > > > > @@ -183,7 +196,8 @@ static bool domain_can_read(struct
> > > > > > connection *conn)
> > > > > >    {
> > > > > >        struct xenstore_domain_interface *intf =
> > > > > > conn->domain->interface;
> > > > > > -    if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
> > > > > > +    if ((domain_is_unprivileged(conn) &&
> > > > > > conn->domain->wrl_credit < 0) ||
> > > > > > +        !intf)
> > > > > >            return false;
> > > > > >        return (intf->req_cons != intf->req_prod);
> > > > > > @@ -268,14 +282,7 @@ void check_domains(void)
> > > > > >                    domain->shutdown = true;
> > > > > >                    notify = 1;
> > > > > >                }
> > > > > > -            /*
> > > > > > -             * On Restore, we may have been unable to remap the
> > > > > > -             * interface and the port. As we don't know whether
> > > > > > -             * this was because of a dying domain, we need to
> > > > > > -             * check if the interface and port are still valid.
> > > > > > -             */
> > > > > > -            if (!dominfo.dying && domain->port &&
> > > > > > -                domain->interface)
> > > > > > +            if (!dominfo.dying)
> > > > > >                    continue;
> > > > > 
> > > > > This is mostly a revert on "tools/xenstore: handle dying
> > > > > domains in live
> > > > > update". However, IIRC, this check was necessary to release
> > > > > the connection
> > > > > if the domain has died in the middle of Live-Update.
> > > > 
> > > > But if the domain has died in the middle of live update
> > > > get_domain_info will return false, and thus the code won't get here.
> > > 
> > > Hmmm... I think I am mixing up a few things... I went through the
> > > original discussion (it was on the security ML) to find out why I
> > > wrote the patch like that. When going through the archives, I
> > > noticed that I provided a different version of this patch (see [1])
> > > because there was some issue with the check here (I wrote that it
> > > would lead to zombie domain, but don't have the rationale :().
> > > 
> > > Juergen, I don't seem to find the reason why the patch was not
> > > replaced as we discussed on the security ML. Do you remember why?
> > 
> > Sorry, no, I don't.
> > 
> > You did send the new version for V6 of the LU series, but it seems at
> > least in V9 you commented on the patch requesting that a comment just
> > in the section being different between the two variants to be removed.
> > 
> > So either we both overlooked the new variant not having gone in, or we
> > agreed to use the old version (e.g. in a security meeting). In my IRC
> > logs I couldn't find anything either (the only mentioning of that patch
> > was before V6 of the series was sent, and that was before you sending
> > the new one as a reply to V6).
> > 
> > > Assuming this was a mistake, could someone take care of sending an
> > > update? If not, I could do it when I am back in October.
> > > 
> > > For the archives, the issues would appear when shutting down a
> > > domain during Live-Update.
> > 
> > Hmm, IIRC you did quite some extensive testing of LU and didn't find
> > any problem in the final version.
> 
> I did extensive testing with early series but I can't remember whether I
> tested the shutdown reproducer with the latest series.
> 
> > 
> > Are you sure there really is a problem?
> 
> I thought a bit more and looked at the code (I don't have access to a test
> machine at the moment). I think there is indeed a problem.
> 
> Some watchers of @releaseDomain (such as xenconsoled) will only remove a
> domain from their internal state when the domain is actually dead.
> 
> This is based on dominfo.dying which is only set when all the resources are
> relinquished and waiting for the other domains to release any resources for
> that domain.
> 
> The problem is Xenstore may fail to map the interface or the event channel
> long before the domain is actually dead. With the current check, we would
> free the allocated structure and therefore send @releaseDomain too early. So
> daemon like xenconsoled, would never cleanup for the domain and leave a
> zombie domain. Well... until the next @releaseDomain (or @introduceDomain
> for Xenconsoled) AFAICT.
> 
> The revised patch is meant to solve it by just ignoring the connection. With
> that approach, we would correctly notify watches when the domain is dead.

I think the patch provided by Julien is indeed better than the current
code, or else you will miss @releaseDomain events in corner cases for
dominfo.dying.

I think however the patch is missing a change in the order of the
checks in conn_can_{read,write}, so that the is_ignored check is
performed before calling can_{read,write} which will try to poke at
the interface and trigger a fault if not mapped.

Thanks, Roger.

