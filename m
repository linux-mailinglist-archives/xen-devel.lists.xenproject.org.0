Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5634412FC9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191494.341550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSacE-0006aK-3J; Tue, 21 Sep 2021 07:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191494.341550; Tue, 21 Sep 2021 07:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSacE-0006Xx-0D; Tue, 21 Sep 2021 07:54:58 +0000
Received: by outflank-mailman (input) for mailman id 191494;
 Tue, 21 Sep 2021 07:54:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/tM=OL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSacC-0006Xj-N3
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:54:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07d1f8a3-fe1f-4d13-aaeb-33f39ab0b3b1;
 Tue, 21 Sep 2021 07:54:55 +0000 (UTC)
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
X-Inumbo-ID: 07d1f8a3-fe1f-4d13-aaeb-33f39ab0b3b1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632210895;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xVOvEtuIVr+SUH+Eu2fBY3f675VT2BQYcpNoh9XwPRU=;
  b=I3r/ZuqWizNBzkW6nzhCNedcDnnyc3eenYLoZlbFn7d8e73ZgB+XB50J
   M1fuaa9TGZEmLtB1ecgtjd2A/JnYPnD/YxXsT4k1MCBPGyKp2jifup8gZ
   sXvX5nL8eEWozr1PMjcneWqG9DI2Fz9aluVw21T5eqDd7q+go4GxIjB/k
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YUz+NhDjEIic84pvVGQ3L/NtPgzrI8euDWZbeANmOq+yv1YQvWdzVYMhiaYgXy83F9nzuBgEX0
 zY27f2azEvna8OlcEtZ39bZoffLlwyv29D+xiyAEQGxXutn8gI5p3loYXaPnqsZo2sJEO9NS0+
 Y3YlxnuZIMCpUC1uowimz4gqas+US/RF3HxGIcvaeeQd0PwXfjuRnC2Hf1MEX3AD86XePbh8Vp
 X+eG02KrVqmwmP4eQzjzvh8/2QI/5vUzZrwAHN8MHWa73tlEUcfC8Fsu4gESSKzbI5Y9xWVsKR
 GdiTsOBR1ygnXQ3UrnkUmleT
X-SBRS: 5.1
X-MesageID: 53210384
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:il47w62mFr2Fn5I2fvbD5fl2kn2cJEfYwER7XKvMYLTBsI5bp2AHy
 zNKWW+Ea67YMzbyco12Po/n9UMA7cfdytBlGwA5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Eoywbdh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhlOAtx
 9VAtYSMZB4KBZySoLwQSB9zDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQChW9r1pwm8fD2b
 csJYxxUdS76W0MRInMHGMIxtseziSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWzkCKLvhMcQ+Z9Cs4B2V+1kqfP5S2GUz1soiF6VDA2iCMnbWV0j
 QbZxIK4XWYHXK69Ei3Gp+zNxd+mEW1MdzZTO3VcJecQy4S7+OkOYgTzosGP+UJfpub8Hy35i
 xuOpTI371n4pZ9Wj/jnlbwrbjTFm3QocuLXzl6MNo5GxlkgDGJAW2BPwQKAhcus1K7DEjG8U
 IEswqByFtzi6K1hcwTWGo0w8EyBva7ZYFUwf3Y2R8RJG8uRF46LItkLvWAWyLZBGccYYz75C
 HI/SisIv8Q7AZdeVocuO9jZI51zlcDITI25PtiJPosmSsUgL2evoXAxDXN8KkiwySDAZ4lkY
 szFGSttZF5HYZlaIM2eHbZFjeBzmXBgmgs+h/nTlnya7FZXX1bMIZ8tO1qSdOEpqqSCpQTe6
 dFEMMWWjR5YVYXDjuP/rOb/9HgGcio2A47YsctSerLRKwZqAjh5WfTQ3akga8pumKEMzrXE+
 XS0W0l5zlvjhCKYdVXWOy47ML6/D4xiqX8bPDA3OQr60XYUfovyvrwUcIE6fOd7+bU7n+J0V
 fQMZ+6JHu9LFmbc4z0YYJSk9N5ieR2niBigJS2gZDRjLZdsSxaQoo3vfxf19TlIBS2y7JNsr
 7ql3wLdYJwCWwU9U5qGNKPxlwu85CFPlvhzUk3EJshoVH/tqIU6eTbsivIXIt0XLUmRzDWty
 AvLUwwTovPAotFp/YCR17yEtYqgD8B3AlFeQzvA9b+zOCTXojijzItHXLradDzRTjqpqqCrZ
 OETxPDgKvwX2l1NttMkQbpsyKs/4frppqNbkVs4TCmaMQzzB+MyOGSC0OlOqrZJl+1QtgaBU
 06S/sVXZOeSM8T/HV9NfAcoY4xvDx3PduU+ORjtHHjH2Q==
IronPort-HdrOrdr: A9a23:GLNRFav67bzJauL7NcBl5BE07skC54Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2n46ctHNZA7dw6MLmK41r2MGTx2VKpUCfa/Z48SgfwQr7Mkf4IDbKRCdY1JKVbou
 W3bLofjx9qR37T
X-IronPort-AV: E=Sophos;i="5.85,310,1624334400"; 
   d="scan'208";a="53210384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8OZN8zqlsdseTvzTm8b0XVADGPqS69uc7xKnr0KckNb+FD6wj/VaaXx12YrY7HmqvguiPiYDtkSNv7wFV0o4rBrKZGtMzpDh2aSOVDluTfsmP9ax76VF8swpsMn8lyxEsJ2A84iOSbQDODOizVh31t5cpROIzLJFr+HijXnaXDReLJZo2+1zwdRw39V5z/4sMD76TB+6hGDWlcX5r/9JYc6pl7v+NoUCxxizGTkUc5I2ORHPROriSe9yZnQe4z7P3XCkwMJ/kJPxMWlEQjQpefFb2nbygvOMIEcqjj9wNOg7XUPWz/iRRUdTcTjSJ8OqJ85bV7WFcLJ/0QA9neQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xVOvEtuIVr+SUH+Eu2fBY3f675VT2BQYcpNoh9XwPRU=;
 b=eOn4YZhkqBAMwRRzsxfOvTDQXJy8Eofqy8yBLX6b3vXHhH8MhgJ5BtFa8NjvThAck7Q4fPMiYNCkP9Te2FZSMQyUEaxvKHRV4YWzSefi8/ZB9YIzCl1wfzfks1fWzZZ6oKgOT9coREpabubgr7E3yXjULbmxUs33/Lz7O63fDqp8SfmZcbZ1qnTCYBBGqbwGI27lnIq6/iq/JfC9eRzlJpj+KoDyAU7WYDYNztMKOVXMIlA0D8yvDskRATOgLZGwxYe1kG2w+J4UgAfRk39Cadrq8WPwWnzE3w6NC/tUXrGcLZix+wpSnuJHF3Mdtg6Z2GTrRMlnMMLLRk9YGI/1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVOvEtuIVr+SUH+Eu2fBY3f675VT2BQYcpNoh9XwPRU=;
 b=folHgzbxKmPH9QEWkGTXD4fFPM5aGZnqZHCWC+0UX0r0wbXXWOSrqu7vgv2zH87AkXfe2CPDrgPnutYiiOp/NDC0T8eZjLLBGizKiqIaVkvmJCj7/5DUIM+iOcga9ZErB55tMEH/IUvb0g6jm0WfzsZZuqkqaWMoPDBmKwGRzVQ=
Date: Tue, 21 Sep 2021 09:54:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: drop a bogus SHARED_M2P() check from Dom0 building
 code
Message-ID: <YUmPxEMvOzrJjWXM@MacBook-Air-de-Roger.local>
References: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7093002-f347-4afa-db94-08d97cd51665
X-MS-TrafficTypeDiagnostic: DM8PR03MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR03MB6216623F2CFCED46BDF9F4458FA19@DM8PR03MB6216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYzHlkQhVD9KbPmdJRxD8MCE/O8t3KSiejnFMLrvzjrc3OYSPxNc2uw7PMIDi5phMK1P2EhX78clbftck7xZ+VOnScVjkxF/wyp11u6IKWmDUdUOF74mrA85dhNkfJtT9dBwf8mVOHGPfKEXNqnOZA+K3wrYE8EpLFLQZyOC+U909DXw+CUBp28A4TQJ5umUc4mAqaAPflpvEw3CsShNBiCi7XAfVyDjM8AV3uMCMGZKAdOLPbdGnOyrKvilp/wu/Zb7CjuAO/KI+Nvb82lc0EayHmZpeJCmUIzM+PhQHppUUaG+DIZri7p0L3lA3qIwe5+32FFBtVL9QvmE6FaCVEghdBnKbBnU+GqzsrzYhv8wiwZ2J22QNdwss84wx2i+vshc+fL68PpJ75dmOBkE8V3m5zgtp/QlobhABwJE5Qf+fVlmaKZ+bTcX+GVThDkJ6gAxbqjvMZ0TY+0HZo/qghsabrEDVjqtCm36xB5ypeaTc0QpzDmtr+FrhgE2LkyVxPVK+D06MUeIFtUMkamG/ST9j2cVgjpwGw20lZUjMVRU6Z2TwEuVtTYH9EwQCj7zOcnYzn/pRjv71OfeHiiXHfI5wQDQdv5ELN4F9N2+TbIXToLA8a8xwgdmKCKheVFyGVgcFpdPPC6wY+g9u1ZKiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(8676002)(5660300002)(186003)(6496006)(54906003)(66476007)(508600001)(316002)(86362001)(2906002)(26005)(66946007)(85182001)(8936002)(66556008)(956004)(9686003)(4326008)(38100700002)(4744005)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEhaNEI2VHNWWDZKaTV5RzR1Z3NJZDdvSzQ0MFNJV3laandudWZXdFQwT1l5?=
 =?utf-8?B?Y2FURG1jdWhVMCtJeURsd2ZLWEdJVHJWT1NqS3AySHRZNTBHekMyRGVPQlND?=
 =?utf-8?B?aXloWmUxUnhyV3g2UkJPQ3ZmUldHMk1NRUJvYi9oQXNkZTd4Mk5pM1YrR05S?=
 =?utf-8?B?bmhBcHdscktXZmpETnVMQmhGUkg2M0ZxbEc1QURLa2hBcWZNdjhtZE9tUlNP?=
 =?utf-8?B?SWZlT1BZY3liaC9Gc1dZaVBDMHZucHMzbHpVZmh3bUlubHYxY0pNZkFNTXdx?=
 =?utf-8?B?TGJUeTVNQzBLQTlOcEJ1blZ0STR2NzZ4bTFnTXZLdEpjeWpnUVdWcnI1cUhi?=
 =?utf-8?B?UGduTjczQkp5V0pRcDN6UW0xTFBRSXVMR0JBaDJVNjQxZUZKeFZxaW1wek9G?=
 =?utf-8?B?TWdHWTl6NVJNd3hIZFR5eHRWTUF3MW5qZkh4QVNudmhLL29sa0RQMFhQRHFB?=
 =?utf-8?B?dHNZK0phRWFZYllhdHFBOU5Sck5vemk2OHROeTdEM0V5YjEwVUtOVU5mVDdp?=
 =?utf-8?B?SEVnR29BM1NKcmEvdkc0dDNScCtkcnNPN1J4OEQ4cVJwQW9lWDA0a3VUOXJ3?=
 =?utf-8?B?d01Ncm9lNmNsZ29HVjRxMVY1MUE1VWx6SGM2N2RHZU95RHlvNi9BaHkxb0JM?=
 =?utf-8?B?dlUzWXJiUjFLN2lkUDU0UkdxeHhvRnB2L1phQWpOUEJMWE5QSHNWZ21Nblk5?=
 =?utf-8?B?ME5VbVRMNGtmS3ZnZEhCclJaTDhWTTM2SVVpVWNNK1Y4NEo0UUltSlMyWDRR?=
 =?utf-8?B?dVVCbi9XQng3Kzluajdpci9WU0JSdlNoN2RKSno4dTBGc2FYZGhPNTBRRnh1?=
 =?utf-8?B?d0VZaG9jZlhMV0xET1hIeFB5dmJkTHpSdFg4Y0d1MG9wNUs4QXovSjZXaWZ6?=
 =?utf-8?B?MmNxY0ZZS3kvd1JTWnpxS0FhQjRWVm9MY1ZDYytYOWxjREVjMVBjWEo3OGF4?=
 =?utf-8?B?THBSM21JWnN3cnFyYndjOEpoMko5UWU1MEJFSExzZnhpNkNqRHZIdFYreDEr?=
 =?utf-8?B?dzNuODl6Um5RUDNOMHczR3c1M1daQ3doV3NrUmlLNmpib0hyeW0rYUNFK0lh?=
 =?utf-8?B?ZlZERUpNWWhBbkRDQ2ZLVTVGZzZwZWltU08vWmtLRStPenlIQnVKQVlhU1J5?=
 =?utf-8?B?cTB2bkMwVndXbDEzb1ArY3hiMmV2czFVd1pQclFYb3NZMXNicm0xQ3ROdGhW?=
 =?utf-8?B?UGJLRk5iNGQzVWRPa2I4SXhHck9NenhDb1JML1BacG93QXFJY3R1YUc5NFpU?=
 =?utf-8?B?VHQxMTM4YnVMaTVzZnhoaDVYckYyTEFTT2pwbEQ3QVNKOXFHcjBHRXRyZlBE?=
 =?utf-8?B?akkrTVdVMlMvUmdNWDhPY3p0V2Q4ejgvejdqaWJoOHZjdzcwemRId3RGeEpN?=
 =?utf-8?B?SlJ1d25sTVdWRVpRdkZiblZwYzhOVlBqR01EbmZXd2I2V3llYTluVHptSHZH?=
 =?utf-8?B?RkZJRnRBeE1ndVNTOEwxUyttSDlsbTh3bmRHVnR5Vm8rbXR4SXZ4UHBRVjZE?=
 =?utf-8?B?UE0zNWdSWDlKejV5N29VRUNiZzJLRFFVMVl0NCtXNEhRU3U3eFlBV2ErRWdq?=
 =?utf-8?B?OFZVQngvbUY3OW1OcjREVndHMWJIZVBvRXRiQ2xuS2o3cldwTVRsUlFGM0F2?=
 =?utf-8?B?N21IdUpPbkRIbU9ER1lIeHhjcytiWDdFbnMvbW5lVDE1bkM2ZmZPSlA3ZDJk?=
 =?utf-8?B?QTZENzVLM0dhM2oxZVQ5cVFBZEVMdHlsaUczRUdSaFV0dGRmUVUvM2NLbVg4?=
 =?utf-8?Q?kQxLq4VUVpULl92x6DrWQ7JBzSEUOG3ReJuFOdQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7093002-f347-4afa-db94-08d97cd51665
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:54:49.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IC0d2BYkSH8Zlsm4mf+s5wFbJi46YuL8ZUbA/yiJssTqaw0NjnwPYlNqBGNer0r5TdZmTpG1aoMjr6JDwm8Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-OriginatorOrg: citrix.com

Could you explicitly mention PV somewhere in the subject?

On Mon, Jun 28, 2021 at 01:52:52PM +0200, Jan Beulich wrote:
> If anything, a check covering a wider range of invalid M2P entries ought
> to be used (e.g. VALID_M2P()). But since everything is fully under Xen's
> control at this stage, simply remove the BUG_ON().

AFAICT adding this BUG_ON was a wholesale change to protect against
shared frames, but I also cannot ssee an scenario where we can get
here with shared frames in the m2p.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

