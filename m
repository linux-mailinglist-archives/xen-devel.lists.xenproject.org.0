Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD64AD52F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267908.461668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN8b-00032Z-NX; Tue, 08 Feb 2022 09:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267908.461668; Tue, 08 Feb 2022 09:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN8b-00030f-Jv; Tue, 08 Feb 2022 09:50:17 +0000
Received: by outflank-mailman (input) for mailman id 267908;
 Tue, 08 Feb 2022 09:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHN8a-00030Z-60
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:50:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82ced994-88c4-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:50:14 +0100 (CET)
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
X-Inumbo-ID: 82ced994-88c4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644313814;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d/eGhLfKHC6NRNkzk5f4cbrP/3jBsGgycwmRjP+GQYo=;
  b=LYqZD+UhPj82ZW/9dfZjzrKuPzia/JBrHFWI6r3tse9SsjPV8MVVSSJW
   +xSzINXXwJpOqvwgMyLA1XNOJaLu9w2zBgL5WiEhRB2s+rE8t7BIy8poc
   vYvPbG7xregodhX7aI0N7Vu5S4V0XfjQ2UWNcgj4Mtu0f4D+XW6ltpOuq
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oLpms4KMTs7TZaxhpYuAcY1Z/FblO7kuY+2cZtdxtWyrfZ83Mipehif6/pdjBYNitypqEJOggw
 MQFB+z2CsmIOgKthwpeIFcdkeBD5QcVcjITEQn6Da1jE9WhabI9K4OyeS84bZzZY3em0ELrVOd
 U2p9wLhsWK1Ci1TtO82dtq0YBCRa6A7arh78fhP3dExMyc12bLkpCbylKnRb7HgM0nhtihOVLe
 XoVaGMJPsjkddTDWQ/7BEPPY5s/4l8bKupc1TiL9F+DTx43QXrQ+taQvxdwZQFPjEmJzuhf7Lz
 GxwB2doBQ/h0dQi/GbvMsJfD
X-SBRS: 5.1
X-MesageID: 63173378
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xeuo9qugSp19NO16ZyH6s53B3OfnVAlYMUV32f8akzHdYApBsoF/q
 tZmKWjXbqyNZzGgfo0gb9zgoRkH7MDcn9djSAo+pC8zFnhA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrYyqSUQ3B4f3ku0XeCJhEHpiEIBX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsXQq2FO
 JpxhTxHdgjJWzhOC3MuJ705x7+Wt0mkMC9pgQfAzUYwyzeKl1EguFT3C/Lfd8aWX8xTkgCdr
 3jf4mXiKhgAMZqUzj/t2kyrgujDjCbqQrU4Hbez9uNpqFCLz2lVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAXMGsDaCksXQYDpd75r+kbjB3VR9JnOKewh8/yH3f7x
 DXihCU+irBQncMN/6Dm5RbMhDfEm3TSZldrvEONBDvjt14nIt7+D2C11bTFxe5QNobaUGCrh
 3INkeOl1eNVEbyghTPYFY3hA4qVz/qCNTTdh3tmEJ8g6ymh9hafQGxA3N1tDBw3a5hZIFcFd
 GeW4FoMv8ELYBNGeIcqO9rZNig88UT3+T0JvNjwZ8EGXJV+fRTvEMpGNR/JhDCFfKTBfMgC1
 XannSSEUCxy5UdPlmPeqwIhPVgDnHFW+I8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXWl0wOCbSgM3OOqub/yGzmylBhVPjLRzF/LLbfcmKK5kl9YxMu/V/RU9M8xPkE/gs51
 nq8RlVZ2DLCaY7vcm23hoRYQOq3B/5X9CtjVQR1ZArA8yVzMO6HsfZEH7NqLOZP3LI4l5ZcE
 aJaE/hs99wSE1wrDRxGNsKjxGGjHTz27T+z092NOmBgJsU9HFyQobcJvGLHrUEzM8Z+juNny
 5WI3QLHW5sTAQNkCcfdcvW0yF2t+3ManYpPs4Hge7G/oW3gr9pnLTLflPgyL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXiSNwarB7psL2Oox85KsqERlLZVtRHvA
 hCE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6pePVX19TMh+AjD1mAIF0aI51k
 /08vMM26hCkjkZ4ONixkS0JpX+HKWYNUvt7u8hCUpPrkAci1npLfYfYVn3t+JiKZthBbhsqL
 zuTiPaQjrhQ3BOfIX86FHyL1utBn5Ue/htNyQZadViOn9PEgN4x3QFQrmtrHlgEkE0f3rIhI
 HVvOm10Ob6KrmVhi8V0VmyxHx1MWU+C8UvrxlpVzGDUQiFEjIAWwLHR7QpVwH0kzg==
IronPort-HdrOrdr: A9a23:QlZUoK6gFCJyyURtAQPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63173378"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciIZY99JrVWPZLp63BWAxNIG1Ek/cGq3S2vaD4MYo6hqRlVL+yoPzRUlxUFoO0GaYyEiMnrvfAGte3TFjP1MFTChUtXeTKsAcNDntXJauVjRgC+Yt4PH9KVBQEOoyfPciyRxcYK84NIGI6IeUpQlxEFtC/GdndR67Qm4kFfYgx/fz2Y7qYTofO1u8wgPJjsFQK5+iPo+fMRu4/utRAapHNm4JpnpM0MdUSEfOIeeVBD8br/iIwl9hzj3MOllt6JDDBb1BlSNMRGw39bQqsCFlNsmKGAeQmOvlIZ0tO7ZAPktDVG/J8oc2y80TfF7Fq7OBLd3MJDgI8IHbMWFI2VFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXTrqj0cgvFPzxmdLbPheuVvPwcmsAkPxuo+imp13tw=;
 b=gXGBlE6WP9w8ySpw9UsnPll8Ju0Lwk2vkmhZ71PuFdNf+dKkkaKqmLmYBKbGK1kGOWAmG+vvVcQjhPfP9aJkpcDWJFFFqiHMv425+cxrRa7TqbE3N9Dc9DyRKH9AuuoGaqQ9A554BzgwXop05K7VIuQhOOuC2MGkJoVJTgYiKasNfH0KiS9M5QrLMn6l+wGB7SD1DJsPVjvDZdJ7h8FPDNvJ1QFaf7rL0ZvXzzEenkhXdojRQZqEWjQQ5gl2kGr7hSD953zaBFP/Ar92n9Q3i6iun07lq7BjnMETCSKzMjgMY5GyLAJPBCbmH7P+cINH+q1dnfJDZbZMcUKM1wB39g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXTrqj0cgvFPzxmdLbPheuVvPwcmsAkPxuo+imp13tw=;
 b=k1GHvtoMNIeEU+DEXP60488Ma/GAh5BSxHVynpT48KcTq63kGZ6n3M1OK1DKyzsyEJ44JErmQ/xZ++QnKJGIpbYTa8OdSt/MbaU+isRvxDuDLwPwq+5BgsBtZ2DKUNHkrIJy5lTgBluq2ErGkq7hr24IIPSXyljV+U6q5X3rkos=
Date: Tue, 8 Feb 2022 10:50:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, <ehem+xen@m5p.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the
 VGA information
Message-ID: <YgI8zYClaW9Ar3FJ@Air-de-Roger>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-4-julien@xen.org>
 <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
 <YgEJWLF/yp8YkU2M@Air-de-Roger>
 <1bd5cef7-a83b-cd51-2ae1-ae2f6db00385@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bd5cef7-a83b-cd51-2ae1-ae2f6db00385@xen.org>
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24364c45-965c-46a6-6877-08d9eae864f9
X-MS-TrafficTypeDiagnostic: PH0PR03MB5701:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB570185A30D976DCFAB4C38438F2D9@PH0PR03MB5701.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gz2CLW9JrJ1GBBVU76TvRLlUvQ54T7glDalP3DggtHUP2jMVO7OAdToVTdGgV1Lkttxy6k28L1vy8hUgTDvS6asZ69oOuwdQG/wPxUOYiTXUAgEhhDiEA72lDrx2NJO1sGVLGGSK9qUMExd1d/Jm9j/UcqmZnGDducZa04WjewQxVgqUVxZxTd0qBmPkS39kNITf+lJsLcsOUHZajahLmFS0J7kRLF+WtVyeUzfPFeFj4kCGsytJLpn4HBS6O3mDzMF0NkBQa2fhJBEE/xDEWGFpHsB0pd2Oo3Ce7cgj/1FgL2K9jfC+g0XgopQ8yxkVgkRvTdeYbQQk2ka7iOxNXObrUWlqq9ZRcmB7y8c2l+ftHJ3RZo/7nc8uI16qKQHlMjPkFg5QztN83Q68pEvU1O3HNiiQKHw1/2ARUDo4QQw8g/oSbxuMcmrg79ahnwdcAGytK+jmxI+4uugupEk1x3BhBJEAeUaJDtELteyIxWi+9olIxLuO+pqChdHJK2gdBrLDXASkyocbihxE2OnjUTTGgTXKUHlg0cLyc+hiACfXg8DYJqsvN8Lo+c1gO0/KEf5I4G9fvuCR8zftlZypLtL1GNTKzzx97BJNF+spkK+n/MIwpzIgHS2Fd4HVpuOuogO2OxGGTNTybxjQ+xdMZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6486002)(186003)(82960400001)(508600001)(6916009)(5660300002)(8936002)(4326008)(6512007)(6666004)(9686003)(2906002)(86362001)(6506007)(38100700002)(26005)(53546011)(66946007)(66556008)(8676002)(66476007)(83380400001)(33716001)(316002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzZXWXQ1ZGNiVGt6cWZkeHU1RUdXbmVwblY3M25BUGpUT2x2R3htZ2IybHR0?=
 =?utf-8?B?S0c3cnpnejF5QVFLZkcxSFNiakYxekNhV3A2OTVNZHJxZzA1Um4xbUZoRXhR?=
 =?utf-8?B?UEwzRHJoWjg2a24vUnBJcmpEYytkZHRvZDBMZ3VYUk05Uk0xUHp1c1JFNGR6?=
 =?utf-8?B?djRRSGhEWGFuTkJIYkUxb1VEdTQrZjNOZ2tONjBsMkdHN3BvNUMwZDM0c3ht?=
 =?utf-8?B?Nm1XNldjQkFSVExzQ1RQMUVlVXIzUmVqejQ1Yi9OUG5kV053cXMvV3ZLNmZ6?=
 =?utf-8?B?ckdnNWtJekhldGErZTE0bmh1QlZrUnJzT3F6M1BBeUVZTGRmWVBDYk1VRFBQ?=
 =?utf-8?B?c21mRDlxNGJCZFlZMWI4Qi9hR0hWSzAvaGZrRFVGNTE4WkZmTjZnY2k1TXJB?=
 =?utf-8?B?aWt0V1lvS1g1bTlLM1NOVWJnaXBXM3UyTFF0ZDdEaENrQjFMci90Mm43TkJ2?=
 =?utf-8?B?bjZIeVE0ampnWmNMNm13WTZGOXFLMmg3QnAybmdJUnVrcEpMQzlJZEcxa1hn?=
 =?utf-8?B?dGpVZ25lYlAzcXBpQkRDZXpybWtoR09ycStLT0RvSlRZTjVheitxR3JHbGd6?=
 =?utf-8?B?ZkMrazUrSzMyN1pCeXZ1Z1B4WVpwNVZSTUxwMzRGL29aR2k2UEtBZi9tT3Ns?=
 =?utf-8?B?Uk1YcFNETjF5NURmY1dnVHBuaTBrRHZsaE82amltVFFpdytXTmdsTEhkZGpB?=
 =?utf-8?B?Ly93c2RQbFh0SjlIMEdvbzF5R2RPT3JtNU9qS1crTFZvdEhwSFdSZjBrZUJ4?=
 =?utf-8?B?NUpGTjVRdHVaS0ExMzBoRUU4VlhKN0V5dnlJU202aW84cTRXbVh5dy9raDg0?=
 =?utf-8?B?Q2h1ZnpldklvVUJNeU9mTEVWeXU0OFEzQnNlU0pUNG5OVXFIcTBTcVJoOEk4?=
 =?utf-8?B?ZGdKaUZuWjN4UjJjdVAxeU5Yc1NCay9mU2lidm9PaThtSUdTc0pOU1h0bTlO?=
 =?utf-8?B?TjZvWnRQTWdpcHNhWkpPS3lScjNqdkp0bVVXRzRwcDIrd1FLeFloSU1KOFkx?=
 =?utf-8?B?TDZmOXFxcGM3NGlUclVYdWlQODNaUkhiS0tqZHVIZW0yUXB6UEgzMWhaWkh0?=
 =?utf-8?B?WVFOWFZsTWNOaVd1Q0ErY0JOYXE2N1Qyd0RaZ2g4VCtLZHh5cURqbWZlOFR5?=
 =?utf-8?B?OTh3VnZkaCttUFVwRjZ3MFpZOUZ0Qnp5Y3JKZXpCV2VzQWhObzhNTnJxa0Qv?=
 =?utf-8?B?S0hRSmc4ZERSbDFWKzhBR3ZrbVlxZW40OTMxNEJIdHBPTm9HZEovR3A4Z0I2?=
 =?utf-8?B?N2NheFIxRStSTjFPN1VsRFhmQkFKNkNxZDI0Q1NHb2hUK3A0ZDk4aGNuQWZI?=
 =?utf-8?B?UFdKSm5EWHN4SHc2ZFA4Mmt0OGVzNFlTT2pVMmVBZnU3WGlXWDJYRkNwcitC?=
 =?utf-8?B?Q09yc29lWlUvSzN1dlRLMkhYdkR5VTlQblFRTlpDUVlWVnR2d1NtU0ZGNHFG?=
 =?utf-8?B?K2FSZFlLdUtoMGV0b2o3eUlHejVlbGdOTFlldkN4ZEtRTjJLQk1tdHhCcXl2?=
 =?utf-8?B?SFB2WVhVSGVHL2VXQy8xRmFULzB3eGFpMlNTR0MrV3pMT0VUc3EvM1ZtSVVr?=
 =?utf-8?B?K05HbWVDdVJlek1LL3NKd1ZnQmhycElJdGRoaHlkdWgvUGxnZUZhdWc2S1hw?=
 =?utf-8?B?cUN1UzhCVlFiUVpydlRZRk5MYzY1TU9Ed2txUDJTN1lZZ2l0bDMyVFk0NGhw?=
 =?utf-8?B?QVB3eFEvZHJFdnN5ZFJwaHRYZ2gwYmpSa2NLU0dZUFlnVmJQQW12QWEwQVJm?=
 =?utf-8?B?YTlvWmpoMVdYUnc2b09yK2xoRVI1L3ZGb3VVYlZrWXBEcXc5SW5QeWFIK2VZ?=
 =?utf-8?B?eFpmMlZLRVdzZzhySzNtc0VaaEhEaDdKbFFRRHl2SmVmcGs4RUZ4dHFHTjFp?=
 =?utf-8?B?R3EvYndnT1VhaVdwTWkycjFDcHU2WU9ZMllSWHo4UlQ2NHZnUlMrOUdqZy9Q?=
 =?utf-8?B?dUYrdDRaN1U2VDBSZFR1L2NBU3M5Z0xSOGVJME5obWRNajkzU0tVR3E4Q0FT?=
 =?utf-8?B?NjhzVS9rOEVLUFNaY2E2c29UY1ZBaEliaDJGQXV3aUZKUWkxNEc4U1NSZUxY?=
 =?utf-8?B?dTNqRUhBL2lackhkUkdHK2wrbncrMlFkdmFReWt5aElabUpTWThpcDFQY3dx?=
 =?utf-8?B?Y2VkTnhxRlBjNVAyQ0d0TVdvRE9KN2h0NFJIbmpuNTRDWjYyQ0pmZVpRcjAy?=
 =?utf-8?Q?P7G473l68Ad/TlHvU1nrryE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24364c45-965c-46a6-6877-08d9eae864f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:50:09.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdQQ9FIrVI6V5SMTPTQ47ebwz4dLAF2yB9UMQKqrJbSRETuQipKnAUVr3opPTIKl+KjWGWfHrpS90Y0OuZ5UtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5701
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 07:24:12PM +0000, Julien Grall wrote:
> Hi Roger,
> 
> On 07/02/2022 11:58, Roger Pau Monné wrote:
> > On Mon, Feb 07, 2022 at 09:57:55AM +0100, Jan Beulich wrote:
> > > On 06.02.2022 20:28, Julien Grall wrote:
> > > > From: Julien Grall <jgrall@amazon.com>
> > > > 
> > > > When using EFI, the VGA information is fetched using the EFI
> > > > boot services. However, Xen will have exited the boot services.
> > > > Therefore, we need to find a different way to pass the information
> > > > to dom0.
> > > > 
> > > > For PV dom0, they are part of the start_info. But this is not
> > > > something that exists on Arm. So the best way would to be to
> > > > use a hypercall.
> > > > 
> > > > For now the structure layout is based on dom0_vga_console_info
> > > > for convenience. I am open on another proposal.
> > > > 
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > Cc-ing Roger as this may want using for PVH Dom0 also on x86; my
> > > first attempt to propagate this information was rejected.
> > 
> > I think it's easier to use a Xen specific layout in XENPF, as that's
> > already a Xen specific interface.
> > 
> > I wonder however if passing the information here (instead of doing it
> > in the start info or equivalent) could cause a delay in the
> > initialization of the video console.
> 
> My current plan for Arm is to issue the hypercall as part of an earlyinit
> call. But we can do much earlier (i.e. xen_early_init() which is called from
> setup_arch()) if necessary.
> 
> This should be early enough for Arm. How about x86?

Yes, I think that's fine for x86 also.

> > I guess the same happens when
> > using the Xen consoles (either the hypercall one or the shared ring),
> > so it's fine.
> > 
> > > > --- a/xen/include/public/platform.h
> > > > +++ b/xen/include/public/platform.h
> > > > @@ -244,6 +244,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
> > > >   #define  XEN_FW_EFI_PCI_ROM        5
> > > >   #define  XEN_FW_EFI_APPLE_PROPERTIES 6
> > > >   #define XEN_FW_KBD_SHIFT_FLAGS    5
> > > > +#define XEN_FW_VGA_INFO           6
> > > 
> > > Perhaps s/VGA/VIDEO/, despite ...
> > > 
> > > >   struct xenpf_firmware_info {
> > > >       /* IN variables. */
> > > >       uint32_t type;
> > > > @@ -311,6 +312,7 @@ struct xenpf_firmware_info {
> > > >           /* Int16, Fn02: Get keyboard shift flags. */
> > > >           uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
> > > > +        struct dom0_vga_console_info vga;
> > > 
> > > ... the structure name including "vga" (but if the #define is adjusted,
> > > the field name would want to become "video" as well).
> > 
> 
> [...]
> 
> (Re-ordered the quote as it makes more sense for my reply)
> 
> > There's no need to propagate XEN_VGATYPE_TEXT_MODE_3 into this
> > interface.
> 
> So for Arm, we are only caring about XEN_VGATYPE_EFI_LFB. I wasn't sure what
> would be your need on x86. Hence, why I keep it.
> 
> If you don't need then, then I am happy to trim the structure for the new
> hypercall.

Oh, so I was slightly confused. You are adding a top level
XEN_FW_VIDEO_INFO, not a EFI sub-op one. In which case, yes, we would
need to keep the MODE_3 as part of the interface.

> > It's my understanding that this will forcefully be
> > XEN_VGATYPE_EFI_LFB, at which point we could consider giving a type
> > name to the vesa_lfb field of dom0_vga_console_info (video_lfb) and
> > use the same struct here?>
> 
> Just to clarify, are you suggesting to only pass video_lfb? IOW, we will
> always assume it is an EFI framebuffer and not pass the video_type.

That would be the case if we add a XEN_FW_EFI_VIDEO sub option, if
instead we add a top level one (XEN_FW_VIDEO_INFO) we need to keep the
mode 3 support.

It might be best for x86 to introduce a global XEN_FW_VIDEO_INFO, as
we can then convey all the video information regardless of the boot
mode.

FWIW, I'm not a huge fan of the struct name (I would rather prefer
video_info or some such), but that ship sailed long time ago.

Thanks, Roger.

