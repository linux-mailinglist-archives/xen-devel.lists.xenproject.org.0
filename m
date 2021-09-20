Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0885410FF3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 09:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190265.340096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSDYb-00037L-Hm; Mon, 20 Sep 2021 07:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190265.340096; Mon, 20 Sep 2021 07:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSDYb-00034U-Dw; Mon, 20 Sep 2021 07:17:41 +0000
Received: by outflank-mailman (input) for mailman id 190265;
 Mon, 20 Sep 2021 07:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSDYZ-00034O-Cc
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 07:17:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d52d99a6-19e2-11ec-b85f-12813bfff9fa;
 Mon, 20 Sep 2021 07:17:37 +0000 (UTC)
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
X-Inumbo-ID: d52d99a6-19e2-11ec-b85f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632122257;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QtqKnSxyfqDkCSVslXETfVc1jFd0cYlLbRSaQcaNm3k=;
  b=iJzXLa/SPm6Npc/2720tui8Fq2ZQAxziGSmcvy5sX+ps/3jXPXKWKjYN
   iZ6c9qQpRI6JwteYOoZp4/mEWbmwOCnY7iuCUMF2h7EQrRO8/ibyjxloj
   vmEy5TNCGUL/gAMfgSmzf3M0YE6zYAPxVw8jAuTC0br7nQn4ag7DlIbzq
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oPNN69iHYSAK2c8QO6B0HPuKrKvLnpdp3HKkwJhvrUiIRh2srOUSdSUolLlcKotmg1YFwmjNUF
 IobPR59vae2KT64RDMbObSa3IGL9Jw0ji4UlS6LLY+mta3nLeTiD7hPSVqsoJcTl/mvdlhBkLh
 2zvP6+8/Ic6Zj0G5WmRADSgrnywCWGtAjVWdxvH8Xu4nOAv06DJghAnEp5ucmJByshc9qjDM1L
 uYpdf44F9d2DsfchPBV1MkxYYYH7Ea46Wf8Rq1zaO9venMWPsk99NXnistMr2Qy6ioNvC8Dexg
 E8BoK2K9gznXyWHCjCyierj2
X-SBRS: 5.1
X-MesageID: 53510126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EMdIwKvn5nmCx0l2oxb+pFsBSOfnVIJZMUV32f8akzHdYApBsoF/q
 tZmKW7QOfyPYGCnLdgia4uw8RlX6MXVyt5jGQRk+StmFXsS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpluYKREQYVAIb3vM8QDCtZAmJQY7cb5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sTRK6HP
 ZRxhTxHNyTGRgYUa3QtBcw1sMG0viTBehlEkQfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9QvkXKoCGbv+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtjiXTWorXicpBkeVtFMVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhk83IXT1TjpaubVmQqYWVvHCcZzJIMjpXDcMbdjfp8+UPsalq0EmWHo0yQfbv5jHmMWqvm
 GHR9UDSk51W1JRShvvhpTgrlhrx/sChc+Ij2unAsotJBCtCbYi5bsSD7VHB5J6sx67IEwHc4
 BDodyWYhd3i7K1hdgTWG43h/5nzvp5p1QEwZnY1RPEcG8yFoSLLQGypyGgWyL1V3iM4ldjBO
 xW7hO+szMULYCvCgVFfOtrsYyjV8UQQPYu8Da2FBja/SrNwaBWG7ElTib24hju2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4wOb5fVk0oPDrKWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:PN1HBavUoR+r5FEcA9hFz3nj7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.85,307,1624334400"; 
   d="scan'208";a="53510126"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqd3DSpvHa1LkMVVAEp4kW8L2haJk1rgi58pdr8W4FOA/c4ksaYVMlCIepb9Gt57V/1D/etJRgQIgABXTABsxeqAcT7D5YpZk7j75b1A0f2EMhztKIxm3u9P7BpMNzdmG7U0+40sCxwSnSnGGDvbO3IYqNZa6op9LxSDYHYEklPARfr9xrJdiVgOrUXwKuQr2M+S7zAQTqS0MWwsPda/gQfM4pdpjSf+UNiIpQhSLj1FwBLn1t0ZQoq3/rheW27xL6kpOY57v/DoV3dH6Hflq5xB7VU31xMCuQdQJ0I+26dp3gyPf3MXYf3sMrJNsLr8V8yT0yFyimNlp6XNPRNMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tqyd/H6DW3LiP/1acj21isINZYh0GarHjLSg8u38J38=;
 b=Q137pt7mtrgaYgJeuZY4nWZi88ljXDHq9hghSZRb5hJuJQtQK0h2X/sMcGVS06oB6lszskOUMI4bg0j5relDdZuE9A54JlGB9QashoBBQ/dtam0LVOnAyqa/SOd/Ir9a/kFXbOokgRQNdkra84GZVFNVKl1b1Bn2pqgyDOHlnqaZ0xcJ+0jgl9SuezTYo2RTgrWxWH3aQgQ36LxAhj1E9hlYexDMkoOvVCsbmxc6izIke0KKUzeD9UmwffZhMfaP5QL8TB1tjQqacJ1gr37QGRf4V9WY9JRQdZP0IkRXSh6x4lebQ/COdW0OPLE0z16QfewsgPv1PKRU3YIvt6Zg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqyd/H6DW3LiP/1acj21isINZYh0GarHjLSg8u38J38=;
 b=v0aGO32z72/ng5Fe+QSQkaRYIP4SApTZtGqVKV5JXGZXyM2tDfjCtSyNi+JLBGf4pNL6ui7570ViIzGBQ+8nkPMqpPJWDSFUDDprLn2zTBygeyTWu1A9iEUm7B/6HPVZt7GjbsVSka8KHrczYvBIfx9e8mEXs8NAoUb/eHbCdCA=
Date: Mon, 20 Sep 2021 09:17:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
Message-ID: <YUg1idb2DBtWSDTE@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917154625.89315-5-roger.pau@citrix.com>
X-ClientProxiedBy: LO2P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d200175-e413-4a6b-6613-08d97c06b76f
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-Microsoft-Antispam-PRVS: <DM4PR03MB59656B97D8112950244A461F8FA09@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dKf2txODrx5LIJT/eMNoe8wXfYG0aLZ5kFr5pCTHFlpBtRUP3WxpH9pf2/KGbVUbCHhIhYI6TYTDzqBhNxliny4vdJQAKg5Nyh4J28vxxE0M5HuCfEMMRxuiuYxNNsF9tJqoqKhNT4kpMrfg4iKq3r7/S4bqSK4r1VmiL/yBEEBVSP96+kXy2nK9/7hhFO3eAf2fi5nMpFOkDupCmiwyGcI/9STb2Mme2ymiDaQoFTEFGBvsbNor9s0DDGKb3NWR+NIy6s5bqfNGQDduCpKili63Kp8R3h2Pbjb3dTxwbPl3ESV5y4IBuhG9774mHf9mkj9adXo7arvmgBm9dKkVgn0+cQSYhbyt5hRf3WWgYpQLPX/9FeIlchiSjG725qzkXg8THtEpccDql4CTWnA3jI62r6JKrjp17/3dQjn0aHsGG2jZHhx7+Kngn24CYhadjfzB6AWNKzVOA/19dpNotemMXFGWpxiu8PQ79OYuwL4Fgi8HplKJZFLN8hz+8xdJdqfMAp+8RiRnTgEoGbpDx81ioubYDrBbANMvF2Q1/gl2t+bvs45Ttx9ZCpsib2hKlgSwsQyFq+vr+q36WKgrsV6YMkQbthifucLmDOgYfmi9/7DRWeiKSTCrr/EJfC4qkTIfyLQ65hvMkHyusJTEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(4326008)(6916009)(316002)(66556008)(54906003)(508600001)(2906002)(6666004)(86362001)(85182001)(83380400001)(9686003)(6496006)(38100700002)(956004)(5660300002)(8936002)(26005)(66946007)(186003)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytEVnpwdFQyRy9lTGIydkIxZXVpNUdQWXRqTjJUNllPNGJuT2VpaE9SaW9F?=
 =?utf-8?B?bVpFRGlWcXlwQlZpZUFPVGtpZGZGeHN0dU8ybWF1UUxhZ0dVSENIREZENWYy?=
 =?utf-8?B?QzBFb1JwbldUcG1vMFBTSXdHQnJVTGNsbDk1amd2Mk10TmQ4bkdFbDdmeDB3?=
 =?utf-8?B?SUZGeGtJdHRkK3M2bU1jdkRaUnV4V1J3QVkvelRtZDltSXhGMjFFdmJTSHJy?=
 =?utf-8?B?SEZpb2c2b3pWM0pxb01uS3JOZ2V6L28waGdJQkJyVXFMbjBJbnZJRjltVE5u?=
 =?utf-8?B?Z0Q0dnZjVWpTc0loTHp3cGhoZyt3blFUR1dLYWRmZ0ZzazlTb2JnVVZvZFpy?=
 =?utf-8?B?NkNrYVlIei93cDduWmpPVjM3S0xxVjJDYk40Q1lQaEpsb1dsYjJUN1FqT2VQ?=
 =?utf-8?B?K21QMmxrQjJYL1JoZTExeWJLWk1BbmU3bzFZWXVWSkhxc3RyTEh2UWxvL3Av?=
 =?utf-8?B?SmJlNk5JQUM5a2ErYkFxMlE5RSt4ZnhOWXBHbUhTUUF6K3BCdmVnVTY0WHB6?=
 =?utf-8?B?UURWQ09NZEVaaVZhMEs5NThjWkR2ZEtzY3BVK3FtL3c4OCtZRjJnaUdiaVEy?=
 =?utf-8?B?QVJoOFQxUHF1ZFR2RTE2S2VhSmQ2ak8yenh4Mi9hamZzNkttL0JhUUs4aVlx?=
 =?utf-8?B?NXBZZmlSRXMxdHJrdzhQSVUyV0FIaEtjNmJORTBLdHRsTDdiT1ZmNzlMRytN?=
 =?utf-8?B?MzU5dWt4QjVaNGdWQXRjc2l3M0ViZlp5dWJyRlBJc3c4R0p2MjY3UkNaZ0lj?=
 =?utf-8?B?YmpBZWRXck5URXlxRlZMb2gyZXZKdjJxQldpODlUZHFpekt5RXgrYjhZZ3gz?=
 =?utf-8?B?cGtyQjM1MytVSkh0WTFLTWJoTXN0a3JrYStHUUVja1pVU1NTR25LTlZmSjNz?=
 =?utf-8?B?LzBobHh5Y042RjhNNHJlcFdTWUlzZ3ppTTN0eUhTaURiRzdqK3ZLT2lta0Z6?=
 =?utf-8?B?TGNsQlJGc2tWa01oOFFLN1d6cG5uUXhYMzhVL0JCUjM5UjRlMi8yZXpOeEh5?=
 =?utf-8?B?UkhhMEZSVGp1dzhnMVhQdE1ib2k5dVU4Rlk3U1JXVHAyT3RXdkdaOGkzR1BD?=
 =?utf-8?B?dzYvY0Z3bGZqUVRhM0pOOERIaTNYYzNnVTF4K29mYnQ4SitRWm1CUXg3UEdF?=
 =?utf-8?B?bW9qZ1l1QnQxd2MxTzVzeDhaeXdSbVd2TURDczRhYkVxWGRERUs5YUlibndS?=
 =?utf-8?B?ZnNWZVB5dVZDQXhBOEw3YjljdXgwNjRQdHR5MEtQZE1sUlZEUDlHQzdWVnFH?=
 =?utf-8?B?Nm5UL2tPOWZQMEZJaythNHB5MnN6MFpEUlg0SDhEN0dDeFNtMERJYUlUWDlU?=
 =?utf-8?B?UG5UdEY0VmszV241Rm44YjlNUzBVQzJRVTc4VUdCK1hTYjNiUHFzSlhwdWRS?=
 =?utf-8?B?RjRsTmhGRnI3dHlEWE80NlZEMmFkek9CQ1hxQ0tJSXhPTkh4R0I5U2hlbGdi?=
 =?utf-8?B?NFdaT1l5OFN5R21oY0Y2MlVwMC93YmxLLzRKZ3R3azk0eEhDWEhxT1UzNTJD?=
 =?utf-8?B?ZmhvU3UxSkh6NFBpYmdSSTRSUlFWN3FOMmZpRXIydFBmT0NnM3lKMWlhbDhq?=
 =?utf-8?B?MEFBVDZwY1hiWnNodFpmbnNoN1BEUEZDdk54VEFEaExVemdxRzVobFdHS2py?=
 =?utf-8?B?aXdhSmhRQXhRMGNlS01PNWZmdUlwTjYwUldZVXIrNnFXWWZPTG83SG5QazVy?=
 =?utf-8?B?ZS9jWjdiSTBoSEl1UkRmdW5uN052L1BsR1JRMVlvaWNMNUxCYVRCSDRGK3dY?=
 =?utf-8?Q?k8eTrxHjnPnsLkwWfECr21Vh4oNJgkKUAppGiHs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d200175-e413-4a6b-6613-08d97c06b76f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 07:17:34.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEIf1aOCsTmU/e41gsk/l7+FjXdm8h5Mdyka3aja8ELdpkQzXynCfTk49Hss5Pk9NsmUr0EEa37h1qLvrB848Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

On Fri, Sep 17, 2021 at 05:46:23PM +0200, Roger Pau Monne wrote:
> Exploiting the talloc clean up routines to close the Xen interfaces
> is cumbersome, specially when atexit can be used to the same effect.
> 
> Convert xc and gnttab to use atexit which allows to drop one
> indirection from the storing variables.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This patch is missing the following chunk:

diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstored_minios.c
index c94493e52a..9b050c7e02 100644
--- a/tools/xenstore/xenstored_minios.c
+++ b/tools/xenstore/xenstored_minios.c
@@ -49,12 +49,12 @@ evtchn_port_t xenbus_evtchn(void)
 
 void *xenbus_map(void)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, xenbus_master_domid(),
+	return xengnttab_map_grant_ref(xgt_handle, xenbus_master_domid(),
 			GNTTAB_RESERVED_XENSTORE, PROT_READ|PROT_WRITE);
 }
 
 void unmap_xenbus(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
+	xengnttab_unmap(xgt_handle, interface, 1);
 }
 

