Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A514BF6E3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276674.472916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSvp-0003lm-Ef; Tue, 22 Feb 2022 11:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276674.472916; Tue, 22 Feb 2022 11:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSvp-0003ij-Ay; Tue, 22 Feb 2022 11:02:09 +0000
Received: by outflank-mailman (input) for mailman id 276674;
 Tue, 22 Feb 2022 11:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMSvo-0003id-KI
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:02:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de63a4ce-93ce-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 12:02:06 +0100 (CET)
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
X-Inumbo-ID: de63a4ce-93ce-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645527726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kniru7UUq5sbp91+M9o0hzmiMH/8Lnx9Ms8q/C2jHjI=;
  b=PCdh7I0ebkIoQPme5baoCZW1E4Ozze6FJrykGnsQpA72RSEmf2GmP5kp
   JmP8yFo1gwcH6NNRf+HXHqXgP4Q97YEiwYrViI7cnxZti6aIzTXKV9RdA
   sOt7EAo9Zpp8dN/j6tPqc9pjU2q/G2Orho+n5fYUVhek+Ty1bkMozGvQ1
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66960173
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3XDAaqrNupuwWC0cUSQXmLroRlZeBmIKZRIvgKrLsJaIsI4StFCzt
 garIBmGbKyOZWX9e9xzaoqw8B9XvceEy9VjTldp+3swRHgVpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBO7DXw9ZaCh5jSjB8Hv1l/4XfHWiYmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMkWeO0QQYT/7DroArLyGiXjZIwRKi27Oh6kTw2Hhwzxuhe2F3N39JYXRGJQ9clyjj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCn1m71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1ayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4q/J+F2rQTEDdWdQav92l8gMXQA68
 XbcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAYmV8rleMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 RON6F4MvsMKZBNGiJObharrUKzGKoC6SLzYug38NIISMvCdiifdlM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhQcyBgXMiu85Y/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOiHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:A1PX16/MnZ7Eu+i/2SBuk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66960173"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSI3nZYTiQeYs9Rifchpm5/IC8B3fG6bp1zkKEyd/3CJ+uOvoC8J27Ftkze7kvjXufIipmbuqL9IoxoB6NIWZ/OvyuiulOepjCtQLzGiRA3ey5Pm82pV9kCSS1gDZhCdtsWiNKhkCNX02oyGOSqGQ0zDxi9tyOXJoc1+50nDAAmz3nt+HRZpwz+5euPO/f46ntZCZvzXP/PnzGNexoaUy5ha/k51JQxuHvXOPGnHpoaqQbWU+TQsoDp+c/Gs36DL2qKo5YR5466q+00F0qLrXKa+TruEknCZQb0fLVrEGa7BQ2abPGf9bnFQXjukY4/OpFcLnc+okPNJ9K604AFyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kniru7UUq5sbp91+M9o0hzmiMH/8Lnx9Ms8q/C2jHjI=;
 b=PZ+sa4LFKQb2z3nXeofuZ/vcnK0g/KtQWUQ6Qt5Bmk8lqUNOj5bK/k3QhN2Z5wcg8rzbaiKQmaCm722nrbtInRa0oLvZ1ZE7bIbiDYvwn+MiS5XCXGegZUsdIns15Drecu4V95HxnFpp+CnC/chP0uPsutK5wjBseBNCvLsP4wEAqzYXDgY+y57H7baW5ltrcnZSO07GMQwxIjDuQtRKsnQvAXrNQ2KybL2+KyOE6g6UlmzAWwrlvKWSheOjHkKMGq76mBY/4NzOop5Su308chofixt9kQs191cfa3alGzHbjsJdxfbi6oWVlR0DC/mo8y2qBRsWO373GI9WMOLOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kniru7UUq5sbp91+M9o0hzmiMH/8Lnx9Ms8q/C2jHjI=;
 b=k7K1TivZFxTFFTja2p3P8AibUP8FNp72c8i2wx9h5yGrQExQj7e+yOXHO/fKu5CMBfDEBagJ3oWqBKONxRLoRKnCxs1eJUEKar/BLx5/tP+aCE5iWDIHjutfNVZt/E0U7VnH/DJaATUZk7WMQIFUKG6sF1f3cdJI1CnXda/PKts=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ011tWngdwKc2UG3RuxDqKou56yfTukAgAAXlACAAAIiAA==
Date: Tue, 22 Feb 2022 11:02:01 +0000
Message-ID: <61efbf17-b07e-d513-7430-d0549e1384d7@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
 <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
 <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
In-Reply-To: <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c02972-56b4-4b11-e6f4-08d9f5f2c092
x-ms-traffictypediagnostic: DM5PR03MB2988:EE_
x-microsoft-antispam-prvs: <DM5PR03MB2988C58341602FBB62539AD5BA3B9@DM5PR03MB2988.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Drw52C8CGp9B2uJGXdOKZsZvkkhGEx5fgNxmtneUcXiy28o6teuGsd6sPjLBYkCPUBQ2JdSt7yQ8cKNSDnazI5Xj+qx/suFs82Uaz9rNTU4E9C2nlydabGBJtMLCWy3H7dCUanNOvjetgH1QZfKzyL4dJ+9ep5TVbZmKrGxh8rZ/ENceIuO+fGsAaOI4JVEGfSWyaJ+CXj860auzvsiRuTRlI2jUmm3gsLIN7QYbscoSd4jh7ekoF7YREQAos876KzuEAm+Iu8tHFgrp0voVnWNaq2Jv8RqBxOzRm1kjmmBxWSiUy5x2yr/LVa8XETtGEKFBzTr3/MyLkwQtXWVpGTyJzgPE9TTBN13Po7iZlIFSDOSSqEPmCpKSMLYHXcsoNYbLW01NZRQILphfFvHiNmG2DY8JTZfRT0f4uf+MGHQqEhBHg9Rbd2ino3zNO2OZ4Mi4D1sRZK1rJY3SrKuvGbScgSZugkaaRlPP4rkHkixAEIWDuaooPCjxyM9aIkE8jnesmZc11lfnmbhHFK819d0eg36CrFF4byTFlyQ2JODwkjHLWHQmJRQLDz/beCRfWe5LbydK5XvAP3Q/jueG+bdHNAXEIlmPk8n5EmeW7zAZRbcHAW/px3jwQvKWOGuTwWVlgcu5AF9ivPgC7hxXlNU0hBHVhE0DbmMGjVcRnt3db444L1YPdo+jIFmIKXO7T8/OU1/2ZH4AjySUWam6cKcddn8gYED5Xycgmo6dUIciXZmCisJN5TUR9e/tLWmac9g7CPFLyzZCXSCH+SamFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(36756003)(6506007)(508600001)(5660300002)(8936002)(38070700005)(38100700002)(82960400001)(2906002)(31686004)(66556008)(54906003)(66446008)(6486002)(4326008)(8676002)(71200400001)(2616005)(64756008)(91956017)(86362001)(122000001)(316002)(6916009)(31696002)(76116006)(66946007)(26005)(186003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUhvWXA1a0JDU0lUeVRYOXBCNUdaSjd0cE9hejBkMUVkNU1wbUVGeXVkUVoy?=
 =?utf-8?B?RzBKeHcrQUpIeThJSTlaZlRSeFJhL0IxRUFld3Q1NS9SOC9sWldHa1lkUU1h?=
 =?utf-8?B?QlQ1MHN3a2d1aUtGN0RXZko2Wk1IZ21ocUtrVHJkclU0WXlOdHUwdDZDVUh5?=
 =?utf-8?B?SFYxdXVYT2cxV1gyczhIN2dFaCs1L0JYSW5lZHdoQnQzcnB6dkpFTDRzb1hp?=
 =?utf-8?B?Sk5aMFRFclJ1aXg3RVRSMjN4c2k1VUE0WUJMWlRJNzAycC9DWDFaZlpBNDYw?=
 =?utf-8?B?S2hsTEZjUmM5OGhyZVhJd2p2Qm9CTjgwVi9YUHgxYm52Ukd0TmRrbFA2VnNl?=
 =?utf-8?B?dTFuNHg1MTlsNW1CRUtTdnNuZGVUZnRCZy81amtqNWJ2eVNLeXJqc2liUits?=
 =?utf-8?B?a1llUmt2MFVwTVR4bGVYK3lKdHZwK1hveGg3UW5FODhyQjdFTExrRE9VRDRo?=
 =?utf-8?B?TTNONGxucnR5NDM5T2dybnA1TE5VNE04bmlkZUIyckFFMlJ4M0o0aWlsU3BJ?=
 =?utf-8?B?YWYzdXROTHRweHh3U3VuQUJDK29mdEJ6dEJHbFhYa09ObjZIWXpPbWFzRlA5?=
 =?utf-8?B?djRDVnY5TXYybW9JV3NYdm8rS1JyWnFhUlE5cWZrT0tuYzFWa2pHMGFIMkhh?=
 =?utf-8?B?b2lubGEyTk13R3BQZUZrMXZGVGN5NjJ4eWZWd2EvY1hEQ1ozRGlma2pBQkVr?=
 =?utf-8?B?T1htc3RrbWlsaHhaK05wb2pCb3hSRW1vbGRKUE5BaU1pWWFvVFFvQ1QzZEpr?=
 =?utf-8?B?Zk1PWm9FQVA1MGIzeUFpRkg4dGUyOVlNRW0rRkovem82bVBOczJ0TllWOXJT?=
 =?utf-8?B?OVNraVQ0TCtCdlNzWmRBVTNKbCtabHhFNmN5N0h2UndTUFZCbjhUc1kzeGdB?=
 =?utf-8?B?ekd2OTIvZ0xoaG1XV3diN0VyUW9RMUxXY2FZQWw5aTFNbktvdUhKQWMrTlpu?=
 =?utf-8?B?SFgyU0ozTWRkaVNqYklXTnBKT1pyc1RuVTdHRGUzUExwSnc2OXpnUjRXbC82?=
 =?utf-8?B?UEVSSGcyaHFCMDBUMFNhYk01V0pscUVBdUNKWHgybGhYdVhoOTl3dCsxbHFz?=
 =?utf-8?B?eURqWjg4UkNoUCtwdG8vemdhWEE3NXpsM3dHVnRLd1lER0JBUUNESTlmcHo1?=
 =?utf-8?B?aTcwN2hrZWFlVXhUOStjK0xGZy9XcGFuSGlSK0FSREtLbGt2bWF6ektraTBO?=
 =?utf-8?B?WnU2cm1UeThKSUh5TzE1Z1NWNlFuTnNiZlZ5MTMzRHZ6bGtIOGpQK1hvZm9u?=
 =?utf-8?B?QjBiNXVvdXRMM1lvQ0ZKZ0Q2em4zQ2xPdkJPaU02cVFxUExiemhmYndLS0dN?=
 =?utf-8?B?dmhtbmMyTWVVWG1YZU5Fa2NranJNMHJiSWloUW9vejlpOFpuVXBEQXRoSDV3?=
 =?utf-8?B?OE5HMHBpZldsNFMvNzl1UW80NlUxWVBRcDRKTHAxZVQ3eWxNZHNPL0tsVVpK?=
 =?utf-8?B?YVk4d3ZydHo2bUZGUFU1cHhYOXRkdVNhc0pwdTR5OFJzc3F6Vlc5T1BvZTdU?=
 =?utf-8?B?czFCUDhRdXdVU1k3YklBSjZKV05tS0p2eG5VTFBTc0lPdTZOczkyQWZNOVh0?=
 =?utf-8?B?aTJMUS9adWlUTUZsK3crN3R5LzA4N256M0xOcEZzWGs5N0lRb0YvZ2VydWdx?=
 =?utf-8?B?UUxOdkxzdldXSXBNTGdKSGNSY25SK0JoekVIYkFaTXRCUkpZeWovOVBydFNm?=
 =?utf-8?B?TE9UMTFPcWZxa2lUMGtFVzkyWEJCcVRtZGMwZ0dlenpYTlZ0NXVweUJaVWNB?=
 =?utf-8?B?cUcyODFVaWd6UHpGSWlYR0VNdW1VbEs0aGxxNlR3bk1CenhaT2NiVUZUQUdR?=
 =?utf-8?B?OUZmRzl2clQ2V201NHZhTVIyNWVFampnejFxZGF3ei81Rnd6cEZJWmtBSnZ5?=
 =?utf-8?B?c01zOHd0dDE0SjJrL0ZyQmJ2SHR2WnJ5Z25Mc3pwNzA1WndGcnF1alBxNzVX?=
 =?utf-8?B?VXB2aFlib3JodGhyNU5tZDZjV2F2aUwyS1JzSlNnMzlxU3crQklNaWZhcm8z?=
 =?utf-8?B?QWJqS1V1YmVjSTBYOUFRWEJvM3UzV0lCWFU4dkUxRk1XZjZHbDJiY3RCaGp2?=
 =?utf-8?B?YSs3dkJLMHRtRTl6MnR5ZTBBOE8zZjNhNGNpRjhPeEZsRmZIS3pFUUxjNHUy?=
 =?utf-8?B?UWtONmxieGVUck5YeW1sTW5BelduQWxlRFVGNkhtWGd1cUl3c1JNL1RtdXFU?=
 =?utf-8?B?enBESWZTMXRlU015TDBZcWhZZGJheEpqZVFaVDN3UG85Sng4SFRNcEUxdTlU?=
 =?utf-8?B?UjV3SkRrSERwZ1BUODVCOW54UGFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC9B7A6FD9C9FE459596A47EF90C3E54@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c02972-56b4-4b11-e6f4-08d9f5f2c092
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 11:02:01.0598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln/ASGgmzr98VXhBsEJwQmHkR3/tyzUBsFSPa2J/vO2n7byZML6TO6pBCClpTmoIw18KFDOLIZU+WPCQpNtchsj6nSx+/rTNiopR9K1R5xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2988
X-OriginatorOrg: citrix.com

T24gMjIvMDIvMjAyMiAxMDo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjIvMDIvMjAy
MiAwOToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMS4wMi4yMDIyIDE5OjAzLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE1vc3QgSU9NTVUgaG9va3MgYXJlIGFscmVhZHkgYWx0Y2Fs
bCBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucy4gIENvbnZlcnQgdGhlDQo+Pj4gcmVzdCBvZiB0aGVt
IHNvIHdlIGNhbiBoYXJkZW4gYWxsIHRoZSBob29rcyBpbiBDb250cm9sIEZsb3cgSW50ZWdyaXR5
DQo+Pj4gY29uZmlndXJhdGlvbnMuICBUaGlzIG5lY2Vzc2l0YXRlcyB0aGUgdXNlIG9mIGlvbW11
X3t2LH1jYWxsKCkgaW4gZGVidWcgYnVpbGRzDQo+Pj4gdG9vLg0KPj4+DQo+Pj4gTW92ZSB0aGUg
cm9vdCBpb21tdV9vcHMgZnJvbSBfX3JlYWRfbW9zdGx5IHRvIF9fcm9fYWZ0ZXJfaW5pdCBub3cg
dGhhdCB0aGUNCj4+PiBsYXR0ZXIgZXhpc3RzLiAgVGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBmb3J3
YXJkIGRlY2xhcmF0aW9uIG9mIHZ0ZF9vcHMgYW55DQo+Pj4gbW9yZSwgbWVhbmluZyB0aGF0IF9f
aW5pdGNvbnN0X2NmX2Nsb2JiZXIgY2FuIGJlIHVzZWQgZm9yIFZURCBhbmQgQU1ELg0KPj4gVGhl
IGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgZm9yd2FyZCBkZWNsYXJhdGlvbiBhbmQgdGhlIGFubm90
YXRpb24gYWRkaXRpb24NCj4+IGlzbid0IHJlYWxseSBjbGVhciB0byBtZS4NCj4+DQo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lvbW11LmgNCj4+PiArKysgYi94ZW4vYXJjaC94
ODYvaW5jbHVkZS9hc20vaW9tbXUuaA0KPj4+IEBAIC03Miw3ICs3Miw2IEBAIHN0cnVjdCBhcmNo
X2lvbW11DQo+Pj4gIA0KPj4+ICBleHRlcm4gc3RydWN0IGlvbW11X29wcyBpb21tdV9vcHM7DQo+
Pj4gIA0KPj4+IC0jaWZkZWYgTkRFQlVHDQo+Pj4gICMgaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZl
Lmg+DQo+Pj4gICMgZGVmaW5lIGlvbW11X2NhbGwob3BzLCBmbiwgYXJncy4uLikgKHsgICAgICBc
DQo+Pj4gICAgICAodm9pZCkob3BzKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
Pj4gQEAgLTgzLDcgKzgyLDYgQEAgZXh0ZXJuIHN0cnVjdCBpb21tdV9vcHMgaW9tbXVfb3BzOw0K
Pj4+ICAgICAgKHZvaWQpKG9wcyk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+
ICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoaW9tbXVfb3BzLmZuLCAjIyBhcmdzKTsgXA0KPj4+ICB9
KQ0KPj4+IC0jZW5kaWYNCj4+PiAgDQo+Pj4gIHN0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGlv
bW11X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKQ0KPj4+ICB7DQo+Pj4gQEAgLTEwNiw3ICsxMDQs
NyBAQCBpbnQgaW9tbXVfc2V0dXBfaHBldF9tc2koc3RydWN0IG1zaV9kZXNjICopOw0KPj4+ICBz
dGF0aWMgaW5saW5lIGludCBpb21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCkNCj4+PiAg
ew0KPj4+ICAgICAgcmV0dXJuIGlvbW11X29wcy5hZGp1c3RfaXJxX2FmZmluaXRpZXMNCj4+PiAt
ICAgICAgICAgICA/IGlvbW11X29wcy5hZGp1c3RfaXJxX2FmZmluaXRpZXMoKQ0KPj4+ICsgICAg
ICAgICAgID8gaW9tbXVfY2FsbChpb21tdV9vcHMsIGFkanVzdF9pcnFfYWZmaW5pdGllcykNCj4+
IFdoaWxlIHRoaXMgKGFuZCBvdGhlciBpbnN0YW5jZXMgYmVsb3cpIGlzIHg4Ni1vbmx5IGNvZGUs
IHdoZXJlIC0gd2l0aA0KPj4gdGhlIHJlbW92YWwgb2YgdGhlICNpZmRlZiBhYm92ZSAtIHdlIG5v
dyBrbm93IHRoZSBmaXJzdCBhcmd1bWVudCBpcw0KPj4gYWx3YXlzIGlnbm9yZWQsIEkgdGhpbmsg
aXQgd291bGQgc3RpbGwgYmV0dGVyIGJlIG9mIHRoZSBjb3JyZWN0IHR5cGUNCj4+ICgmaW9tbXVf
b3BzKS4gUGVyaGFwcyB0aGUgIih2b2lkKShvcHMpIiBpbiB0aGUgbWFjcm8gZGVmaW5pdGlvbnMg
d291bGQNCj4+IGJldHRlciBiZWNvbWUgIkFTU0VSVCgob3BzKSA9PSAmaW9tbXVfb3BzKSIsIHdo
aWNoIHdvdWxkIGNoZWNrIGJvdGgNCj4+IHR5cGUgKGNvbXBpbGUgdGltZSkgYW5kIHZhbHVlIChy
dW50aW1lKS4NCj4gSSdtIGhhcHB5IHRvIGZvbGQgdGhhdCBjaGFuZ2UgaWYgeW91IHdhbnQuwqAg
SXQgb3VnaHQgdG8gb3B0aW1pc2Ugb3V0DQo+IGNvbXBsZXRlbHkgZm9yIGJlaW5nDQoNCkJhaCAt
IHNlbnQgdG9vIGVhcmx5LsKgICJmb3IgYmVpbmcgdGF1dG9sb2dpY2FsLiINCg0KfkFuZHJldw0K

