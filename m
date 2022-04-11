Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364944FB8D6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302836.516638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqrl-0000FC-Co; Mon, 11 Apr 2022 10:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302836.516638; Mon, 11 Apr 2022 10:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqrl-0000AK-9i; Mon, 11 Apr 2022 10:01:49 +0000
Received: by outflank-mailman (input) for mailman id 302836;
 Mon, 11 Apr 2022 10:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GIa=UV=citrix.com=prvs=093d97d34=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ndqrj-0008Mf-Qx
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:01:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648c446b-b97e-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:01:46 +0200 (CEST)
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
X-Inumbo-ID: 648c446b-b97e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649671306;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wzJSTetHpqccLFsLDjNzAZ2vuqpeH4DeQ/6f42uP5x8=;
  b=CkyW5vBLT/iEjRF+VTAxxTuNVB1aaXFvxEJRu0PdeAo/RVTu5+fTc8Pz
   bunMJOK9FUL8R7U62D5s6uKEOW9qap3NLgx2kBjpckWYv0mhlJD+WiRD8
   egvrvRBpzgzytIeOUT8GLio3FPryU3A76oBZXu8zOygBVlE7dqBpDBrdR
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68543525
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:39yw9awOi1f2G37Wc1p6t+cQxirEfRIJ4+MujC+fZmUNrF6WrkVVy
 2sZXmDQaPvfMTPyedknaoSz9kwO7J7Tz4UySFY6+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltqWRaFYwMZT3seU5CAFpTWImI+p09+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 5dFMmc1MXwsZTVoGkYOBbgFhNuKjyT2SG1D73+eobootj27IAtZj+G2bYu9lsaxbcZYgEee4
 H7H9mLRAxcGOdjZwj2Amlq0j/LLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobT8T9
 37YhtzQPhVulOaNeCzerqnTnzznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr2/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nQz0Rho81XRdlFAspp1xWG3DZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYif7M/YpON/oVJVwpUQFKTgCfqqKBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcyu8JwIK7Tbe2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX8hrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:7dyT2KzpsZmstuHp7u+fKrPxiOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMcs1MSZLXXbUQyTXcBfBOrZsnLd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgOVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVN77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdPapzbgpDCcxrXBQ4e2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+Tg7bVbHAa0cYa
 FT5fvnlb1rmJKhHgfkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 j5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdYPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekxhlQ9fsucDcSuciFdryL7mYRtPiTyYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.90,251,1643691600"; 
   d="scan'208";a="68543525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9HtQoHkhDvljKqVbAoZNwD/zOxshwSRVaRally+UjqbmNGxCSuQ9WpfCRgMwqKequudj8tD/rUqK+lMOeSG/jiJdq43FKXuzLmTbcfTV4CJygtavk23KPz+CyS0hNBHRfSFRRuac+r17xUEnUn6FMxDByfiPPVOVDgH785sgi3hwO0ltZaa0ZYpavE2QAXo1uWq6jTRCb8rca+g0BAsmBgAWd75kAW2mLQ4vNu3O1wKDgkTky57llt9wdHSc9EYwoCaqoeT+ex9hHjH6oqk9x84uX36o9yapw9efIaVMjgM3yb0CbOj+mUvNkvSmAm6uGKCNq2EOAnmXueUqoVm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzJSTetHpqccLFsLDjNzAZ2vuqpeH4DeQ/6f42uP5x8=;
 b=P0rwD1XBa48GKiubKU1e9EkyWhl/u63fflEIHk78+347xDU3+MuOc1xUw/lAwmiU7WUt3uKBU+4LT1/QdEoZo25E0o0ZuY075HZJSBY0UPGPZ46GtjGSquzYcN4qEwU8lQmGa/GddgBgoBv+2DrGo358/yzVKJ+8X/Xy73BqSqzO21+bHL/mLd9xJvhlz2XjKMyVartGBXlERnHDXvdgxg5N71lb+XLTiW9ot1X+mrEJ8YfIu1Wl5ez/4hH96vrXzyo5pugDy3yq5G6nnOwUGlh0iYo2/wQLakfIN1hnesOEe217Nm7VnZwRiDrsfaVwYPLgFAN0iSIPLqAPTs7Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzJSTetHpqccLFsLDjNzAZ2vuqpeH4DeQ/6f42uP5x8=;
 b=T2eQivAzW+Szu1Wl5L1D4W5PDlcDzqrwmrl+nHxmJEyokhy4ZugR7FWP1moBBFWWBcm9SknEHUXDkaPL9u8nwofH/MiB6BWu0bgV1s/dlLw4c8bCiPGRVOFT9L5xi6A79SFx1CgH1welEnunmCl2zNcn+9QiFmqaPuLDHK7TkMA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, "Roger Pau
 Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Thread-Topic: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Thread-Index: AQHYTYeuJ+is9Rj/YESzKfVlQCNZoKzqezGA
Date: Mon, 11 Apr 2022 10:01:35 +0000
Message-ID: <7b79d293-80c3-d368-1abf-581f57dd2f82@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
In-Reply-To: <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f1f522c-d8ce-437e-98af-08da1ba2439b
x-ms-traffictypediagnostic: SJ0PR03MB5885:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR03MB5885816A04EF96805047A0ACBAEA9@SJ0PR03MB5885.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F7PSXAVTjjVHMrMltXPt8Mh3wgwKezlq9zYMJJehkRUKzpZEANb9JNUDn9CPtQYzP3q7CVW+5SJ9UyM0iN1l0opd38PuTrViA+KkFqqEecaBUKDQm0f98+XJfnWkZiV7pcN+OBZZ+9Qb5HYshQ4F40g08FXf/1M2XhsoB4XgnI9BXG5YAATyuj0D9plWZPT/dnx8IBD2p2p8enc2DlSpCuekkcbUFVj/L8bAqLgWa5zxBGvs2/hJfcB371i26jI6GzXt8aGkPMmqh6rOJOgVdlY3I2EI40sI71vdmSmoKaSZ/bkn6ehE6lBB5YWu797N4ESMCA2cCWL2xhairEbC8CtE41hRIILHBnVRY4VVP19s95rwq+LD0QFWef7xCAnsfmolWsGEpvxtSZ1fb2WyQr8RoyFWNHy2igwWG6C8aEIiF15rQgm1Nh0BEkwR1753e5Evd27D5cqLn6jrH5/doxJgm3PjWh1OPh6KuOWu1BGkGfkJxRY6I/srE8WoZDlk2JWDmj/OzqudujBmGd5FOk5Ha+u560IqqWJ787hyf5JGzZed7TqXJOZ/QBI1bNUnoyoR/HIALQdW2eLZopTHVjkeisZ7I6Anhg/Q7YAdBibflcCzjUZwJ7b56QTAgKr8mwi7sTdVUemwhkPSCwq+C66sTX0HE2o9m7pk6aduh9HCtaaCOv3My/VX7XPR/WeMCwlNmpqZzeh+U617krqaogkqDNrpiB06wklOxeulkUhNt5Wcr2vBwTacQ5k94ElsX0DZ+XYHSoUilwfnUrUYeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(83380400001)(26005)(107886003)(86362001)(31686004)(31696002)(2906002)(2616005)(8936002)(36756003)(53546011)(6506007)(6512007)(8676002)(5660300002)(71200400001)(6486002)(38070700005)(66446008)(76116006)(91956017)(66946007)(4326008)(316002)(122000001)(38100700002)(64756008)(66476007)(66556008)(110136005)(54906003)(82960400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmhhQktyWXY2amFsaUZZSHQySW9KNDhRREMvMjRPZ1IvTjFLVzh3bjBKc3No?=
 =?utf-8?B?ZUZrMWZNUU1ZUWxEVXdCQnJBSkF1N0FkOWJaUTlTWlZQMUxSTWtMOU1MdjRW?=
 =?utf-8?B?L0x4STVEUXNJeS91cGFNYnJXZVlMeTZhKzNTa2VndlZiaTJVNHIvdnVkRTV2?=
 =?utf-8?B?ekpsVEpiaGs4TG11TENkNDJySmhYeTFrcGV3MXBUNk1La2JpNEcyOUZSVEQ3?=
 =?utf-8?B?bVo1ZWVjYitubklTbWJ4WHdaR0NkZlU2Tmh3WGhZL3JnU3c5Yi9ET1lmeUpJ?=
 =?utf-8?B?bmZ3a0lWcW5GNzhxc0NZWEdvN05IQ04zRFEyc2NxWXMxc1BQU01HT25ZUDdM?=
 =?utf-8?B?b1hpOXYwSm4xT2NXVDVNa3kyTUNkaWZQL3BsR3VkNmVma2sxejZTRjBzdTBM?=
 =?utf-8?B?bm1zeWFTVG1tVzNFczBXVHRzWG5IZ0FLOWlWV0pucjJsMkpoMDdUeXI5dW9M?=
 =?utf-8?B?akdMMHk1RmJORVhrVFlSZlFPTFRaZjM2c3haN1ZYUTNZVW5wanptemtLNzRK?=
 =?utf-8?B?NXM2alR5QmdsUEJlSDFwRFpUQnJOTmJjK0hVbDhHbERuT09VWnQ0ejQwNVlF?=
 =?utf-8?B?M0ZDd29lMTcvd0R0MlNuMUZ6NEtlaXMzVlVBcSs2Zmd6cWtucEdjRFJjT2x2?=
 =?utf-8?B?by9HWER2QWRJYW9FOHlYR2l2UnFGQU1kelI0SlpkOTRCZ2ZiNzJCTFBBZzBs?=
 =?utf-8?B?ZUdyaEUzMzRkWWRNODBsbEVSZDY2bHUwQWNody9xVUdRQzB6RXkzbFJhM2xK?=
 =?utf-8?B?VWNlUHEwZkpCY2ZIMXNhdkFRYWJrbWV2eEMwT1hIeU5Dc3VCL0N4cTE1TDBI?=
 =?utf-8?B?Z2g2c0swb3VFOENqRk9wSXVQUmp2aGNkZDJTbmhLRUJJYVJmT0l0aGRWdXhs?=
 =?utf-8?B?Y0pnakpvV1BwRnVSa0Mrc0pUam0vbC8zQXkxd0VFSC9UNUdTa2diUklITisy?=
 =?utf-8?B?UmwzcnlrSElBMXJyUjdlMXU1Q0dFUk5Ka29pRUtvTTQ5cjBuandSOXdOUFJR?=
 =?utf-8?B?U1pOZU1FQ0VwQ1l0NVI2OG00TTlQOUNReS9KeEx5elRCbDM4VEs5dU5ydEJT?=
 =?utf-8?B?V1JFMmp5eG9wNzUzOXhaU3pLWndUVC8rdFVKblJqeXpyd1g3QUtXdVZNZjNy?=
 =?utf-8?B?YmIzejZmem4renBETTl2U2hEVmZzM3JIYlRZSkpBYkE2ZUZkR1l3UFhyV3BI?=
 =?utf-8?B?bkVhYm1aemtPc2RUZ1NOSkhaL2swMG5vRVh3QVk2bmdLcDdtWFFOYXZjVjBQ?=
 =?utf-8?B?YkZsQ1FubDB4UkwvSFhuRmpwZ3RkdHBJdXdXQktRRlZ5dFFpNHdrSGYwd2U5?=
 =?utf-8?B?YUNDSDArRVNDaU5IWDZPTFJMeUxVZkdlTGIrUFBDWEd1SFhHc0xIM2VhY0xH?=
 =?utf-8?B?SnNPb3ROcHNQdnFUVGE4aEVkbUpLcWV0QXZNOFE5VXk4ZTNLYjhFZWRKdko5?=
 =?utf-8?B?TTdyZ3VXUGxkUzIyaDJ5ZnZqc0lyOStCSHBySlNoUXcyVEpZc0JoN2l6L2c3?=
 =?utf-8?B?NXVURzQ0WHVVekRYUVdpQ2VuYnhZUEtPVDl2VE5XQXlOTEd0ZE81bmZMQVlX?=
 =?utf-8?B?dm1yWngxa2RZdzJmMlppemtSa0lPLzZVSFpFaDN5Z0pCQk1kTS9SeWF1WWdH?=
 =?utf-8?B?Rjd2RXJqVnpreGp4YndwWTFvZjFpRkpDdnJEbHlYakNIWlhIU3FLR3RxUGZ2?=
 =?utf-8?B?eExqcnpJZk9vZm44bDRKanhXM2t6L0pyZ0xDTHpoSXcxMWszbWVFbXZtSFpU?=
 =?utf-8?B?M2RjUlBRYkt3b3pveGRJcE9GNFVIYVVPZWVQS1luZnFBMFpSUmFWcUxTNzVk?=
 =?utf-8?B?M0lFbGlHNy9PNXY4ek5FYUhvS1k5bTBxUnN6QklZelMyWHBDSWVra0Q5ZWVU?=
 =?utf-8?B?NWxoM2tnaWdHMWZzbTBFUWdsZEhDMHFPMDA3VFozVkp2WU56QjRLMlBBR09T?=
 =?utf-8?B?TjJobGErRjZ5RWRTTldXNlUwdlF3dnd3ZHZpWDJvS3JDcERkd3hrSVVJMkFy?=
 =?utf-8?B?bHFhdGlBOVkzYzNRQWhIdG9TTXVnUG0valZMcG5uSk42UGtFVUlKbS91TXhN?=
 =?utf-8?B?RDNxbXIxeHRQOXJpb3gvczlaVC80WnBZcURlUDJNamVWejc4ZXJMb3NnVitq?=
 =?utf-8?B?ZzVrSTgybmRPRzJBVkVxYkVVN2N1ZHRmcGFGTEJ5N2s2elFlRHhOWFF0V3Rv?=
 =?utf-8?B?TzdyeWpPa0hJdE9iTUdVeDJNd3RUdDNlZklTYkZtMkhJT1ZEWE9SV3BDK0JH?=
 =?utf-8?B?a3p3emtOQjZ2Tm4zQkFiN0RiNEtmUDVRa0tIWkZ5WFdNUHVMTVczQjFyUW1H?=
 =?utf-8?B?TVdadVBTUHE4SXhJUlJYZDJLcktBRTBKKzlNNlpxQmVGeTRhby94Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78DDD22459DB4F469768B21333AA93F1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1f522c-d8ce-437e-98af-08da1ba2439b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 10:01:35.8644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+winZnDtivI+nAhIE89LxQwLJHLZ/o8awmruFmFgwqNKLC1qWeD53wdfdvZF7kQi4FOjupXZBVqWuXOuDOEpEdKOfEWUE9heYVRXd4UHj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5885
X-OriginatorOrg: citrix.com

T24gMTEvMDQvMjAyMiAxMDozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFByaW9yIGV4dGVuc2lv
biBvZiB0aGVzZSBmdW5jdGlvbnMgdG8gZW5hYmxlIHBlci1kZXZpY2UgcXVhcmFudGluZSBwYWdl
DQo+IHRhYmxlcyBhbHJlYWR5IGRpZG4ndCBhZGQgbW9yZSBsb2NraW5nIHRoZXJlLCBidXQgbWVy
ZWx5IGxlZnQgaW4gcGxhY2UNCj4gd2hhdCBoYWQgYmVlbiB0aGVyZSBiZWZvcmUuIEJ1dCByZWFs
bHkgbG9ja2luZyBpcyB1bm5lY2Vzc2FyeSBoZXJlOg0KPiBXZSdyZSBydW5uaW5nIHdpdGggcGNp
ZGV2c19sb2NrIGhlbGQgKGkuZS4gbXVsdGlwbGUgaW52b2NhdGlvbnMgb2YgdGhlDQo+IHNhbWUg
ZnVuY3Rpb24gW29yIHRoZWlyIHRlYXJkb3duIGVxdWl2YWxlbnRzXSBhcmUgaW1wb3NzaWJsZSwg
YW5kIGhlbmNlDQo+IHRoZXJlIGFyZSBubyAibG9jYWwiIHJhY2VzKSwgd2hpbGUgYWxsIGNvbnN1
bWluZyBvZiB0aGUgZGF0YSBiZWluZw0KPiBwb3B1bGF0ZWQgaGVyZSBjYW4ndCByYWNlIGFueXdh
eSBkdWUgdG8gaGFwcGVuaW5nIHNlcXVlbnRpYWxseQ0KPiBhZnRlcndhcmRzLiBTZWUgYWxzbyB0
aGUgY29tbWVudCBpbiBzdHJ1Y3QgYXJjaF9wY2lfZGV2Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkl0IGlzIG9ubHkgbGVnaXRpbWF0ZSB0
byBkcm9wIHRoZXNlIGNhbGxzIGlmIHlvdSBkZWxldGUgdGhlIG1hcHBpbmdfbG9jaw0KZW50aXJl
bHkuwqAgT3RoZXJ3aXNlIHlvdSdyZSBicmVha2luZyB0aGUgc2VtYW50aWNzIG9mIG1hcHBpbmdf
bG9jay4NCg0KWW91ciBhcmd1bWVudCBvZiAid2VsbCB0aGlzIGlzIGFscmVhZHkgZ3VhcmRlZCBi
eSB0aGUgcGNpIGxvY2siIG1lYW5zDQp0aGF0IHRoZXNlIGFyZSB1bmNvbnRlbmRlZCBsb2NrL3Vu
bG9jayBvcGVyYXRpb25zLCBhbmQgdGhlcmVmb3JlIG5vdA0KaW50ZXJlc3RpbmcgdG8gZHJvcCBp
biB0aGUgZmlyc3QgcGxhY2UuDQoNClRoaXMgcGF0Y2ggaXMgc3BlY2lmaWNhbGx5IHNldHRpbmcg
dXMgdXAgZm9yIGFuIFhTQSBpbiB0aGUgZnV0dXJlIHdoZW4NCnRoZSBiZWhhdmlvdXIgb2YgdGhl
IHRoZSBQQ0kgbG9jayBjaGFuZ2VzLCB0aGUgZml4IGZvciB3aGljaCB3aWxsIGJlDQpyZXZlcnQg
dGhpcyBwYXRjaC4NCg0KfkFuZHJldw0K

