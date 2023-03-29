Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B96CEF66
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 18:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516320.800253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phYfu-0000x6-Mt; Wed, 29 Mar 2023 16:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516320.800253; Wed, 29 Mar 2023 16:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phYfu-0000ub-Jl; Wed, 29 Mar 2023 16:29:26 +0000
Received: by outflank-mailman (input) for mailman id 516320;
 Wed, 29 Mar 2023 16:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phYfs-0000uV-KM
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 16:29:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db5b7cc4-ce4e-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 18:29:22 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 12:29:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW5PR03MB6905.namprd03.prod.outlook.com (2603:10b6:303:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Wed, 29 Mar
 2023 16:29:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 16:29:14 +0000
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
X-Inumbo-ID: db5b7cc4-ce4e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680107362;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zZj6pUi3a9z78vJ4/AuF/tZ4v2vbH5BBqeMphywJy+U=;
  b=PyKz5Y8eDdyyUMyQRzJ9xcFrAOo/rWVRLkEr3GM7SqYNlDqPPX6ibamC
   pqprUW+CF8uVuSpTZ75qQwBzljOHNdnKIoKGpGZdxxxBJYhPGL//3jZUH
   0H6SQwiKpUo1Ze5bNWGcSqx/Dxim06h45xnZ0chBtb/xCbfLzFYn/zofs
   I=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 103466115
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pe8VXa29EQh2asXtdvbD5Qpwkn2cJEfYwER7XKvMYLTBsI5bp2YDy
 msWXzrQaPjZY2rwe9okPdi09kgC7cDcydY1HAs5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHXtt5
 6FDJBs2cDPaoMW7+rChUMRCr5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bORw3qiBer+EpWf5O5Uq2bI2lYhMx4nFkG0rsCrqVWHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U/4RuIw7DZ4C6YAHYFVT9LbNE6tM4wSicu3
 1XPlNTsbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMT35x
 TGHqG49hq0el+YMzayw+V2BiDWpzqUlVSYw7wTTG2e6tAVwYdf/Y5TysQSGq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gJiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:m5myaKjhasqsBV5CfNkmPwkRV3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103466115"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Knc1amvfZU79ofvohnGl9Y8E961Yo0rumjKQJkRPk7YXpHFr3Chb2oZla25QafAIsIyEEatr/IzfXDwQY5zEooMB99iQ4xR6ll4sV12KB6DtgwGv4LHF//l5Z/0hhZJk43C1+mMdTxOtmRa3pogEQX08oVYLuiz4G4jT+yDievtKiCDx20oyWOMf5pJPPQ8Hocs8aA8MRa89QRL+hiIztOFos4XL4LfICUle8amu5ih/Ccq+egMgLm8E6JyV4rdszb/eTy/94Qb6K1WlxoF/2FazLC/jTutc01Z/wy53gzmPqeZJxzKpDo1YWV4CfRyEr6rTd1/h6+bh8k9UowUAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/hf9iMuXvPEwEJIrbkvmsceAV6+KICMdxj4UgfOnBw=;
 b=nNTiwI4XrsJpglIDiXEmJLhNdtT7KfyIPyS+EN2keIjZUTDilNcUuY98E0IsN2sQafDaNvRzhnfZsmW7SKb7jRnBADRw1VxLec+KVC0lukn9HlOU9XIiEFHBfRKn0DKlSDqTZzu11BFv8dWPMCrD57T3gcPcPnXk4SS4OAvV66U8aC9eDxgrJm6wt9JSXFtqD0Asjv1hBeR7P2G6SoY+yue5FGtSsI/L0EtFofeWLh8gT6+4E5Zd5/1WqkhY0xO1SUoQ8O6UVB4uorv5BKp+nbFjdTeHcXCdNa9SRG6GOzavVIlsOYlCu+ByXYEC6ek4vUFI0qnU2v/bhg9YBjsGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/hf9iMuXvPEwEJIrbkvmsceAV6+KICMdxj4UgfOnBw=;
 b=aOo/JdbDRlIX2fYKu1cR48d1DpCQxUPTKLFkuHRyDRt7OXez6tPMANE3TnPb4bQLJAwpYCAHvMNpVIW9rz17hYsWaoK8KsYGpqe8rNqr2tm5KEbD/5SQktWaS7uO0q8PqqJ7w3KkqickFew9UV11XoZT0a4lEHhZwkcpY249/qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 18:29:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: marmarek@invisiblethingslab.com,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Message-ID: <ZCRnU03XDCpqZQ5u@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW5PR03MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b0516c-5b86-4ee0-1f2c-08db3072bb9c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQ9s101XTvAxN4S2FR9R/5iXlvJQ+s/Bg0+FQBXRhSQQngDt/moV4pLDVo7heaIa/YVTy0sinHqN8Aqxd86sAPL+aIad4mxrRQAQHQftm7mG2pUv5h5RIvx8cp6Va9lSMAhWGtoccrFs1XBb5ryJwy4J6ZV0KeNq9hX+cyNIgML5hBwfYssN6BiSe/13X5zAj3CJqEhNgfvkXCedp8WnBCrd4mR/gdJyye5+1hEkyaRDlTzZP5kpYcZPz2I1cfimXDiatc7uS8+147mE2OP7N6xeDLg7wFbUprmTiyB2OoGbm/uCQjSxtoRU2Og9J3TPOBOabz0qt971DgQ22iLEElf2Qrz7vGmHg6xOI7IIa84GiFpG8RoASS+rQ/eK9+qsQ7P7zIfpEVerwYdoHB1zWZvhjQQZHEer0LtDw/+qw01quvzgFTFtsfe//ud+tUzBorn7WS/ybZSt+o3MnrrF1nEjWii5brnFq/v4N7kJGZIWTrYVRnqcGt0SjznBOBGS4YuG82xGkcFffhR1GwfHK/OQ26Asn55rNtN9rxywgW3ia0zDNtYh1aSocBQBkmEo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(2906002)(83380400001)(6512007)(6916009)(8676002)(66946007)(66476007)(4326008)(66556008)(478600001)(54906003)(53546011)(9686003)(316002)(26005)(6506007)(186003)(6666004)(38100700002)(33716001)(86362001)(41300700001)(5660300002)(6486002)(82960400001)(85182001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW1MWEIrSWprT0ZaZUgwK09vRjJTbURnN0hNbjVqYms4aXhCdEJjMTlCK2Vv?=
 =?utf-8?B?SGVKZzZxNnBmckhWdFdxdUNEYXRHTUsrRjRmOUpJQmhuNHB5d3lDYjlpRmJX?=
 =?utf-8?B?c0tWUHZYT0ZiNmZYSHF5RzFXL1QvaWUzdUoyRVkyeFZFbkdBWjQ0emR3eFRy?=
 =?utf-8?B?R2J5U3VFU3hhUlNRWDZQN1BrSHpZYXg2YlJ4Nmw0VDBTYlcvWEl6b0NuQ01F?=
 =?utf-8?B?Mi9DVFI1eWpuRng4NTEwdUE0djlmb1h0RFNXdWlJdjIwNURPcS9ibksyajB6?=
 =?utf-8?B?Zk1oa3FWYi9xYVBCRmxUSUFwazRUbTg3Qm5DTmZIamwwaDBwS2k3S3ppbmwz?=
 =?utf-8?B?bFVBRkFUQ0kyNWhGL2plbTRSZ2I4TEJBTkltajUzOXVxK3hYKytpQnN1am5E?=
 =?utf-8?B?cytwK2pjL2VselliYXdLYlFxNGlwM0QyZk8zTW5PQ0FyampCMTVvYVVmYW5H?=
 =?utf-8?B?T3NiQ3oraXhFb0N3M1FWNVVJcnZ2bStweE85WjlZMjQyK0Q0Qzc3dlFzUTQr?=
 =?utf-8?B?bEVwbE9HZUxHZHIyRmI0aTQ5TTZRTGc2cW4rcDkrOGppL2VzcnBEQjcwUWtY?=
 =?utf-8?B?WDdnS0hma0taT0FtbHNuS3VLek9CSVZZb3hyTXRJMmFmOW1GQ1liY3o2UVVG?=
 =?utf-8?B?VEgvVm9YWDJFNzVtdzJEVjhaOHlZSmsxZlVlRGo2T0FHQmlNYm1BVkl3aTNm?=
 =?utf-8?B?eVVCUVd5OHZlY0p1NUtoRVhObUwxRkQxSnZmcG4wcUpCMWV0QjBpTWpwTDYr?=
 =?utf-8?B?c3p0c3hCK1NjT2wrQXZKdGdwWExxNTJrN2x6Tk9ua3VTcitPZ09CTFJjVmlY?=
 =?utf-8?B?cWxEVklJTVB4S2RQVjNhZVROQXlQRWF5dm12Z21qcjJvbFNJZkpha3VUb2xO?=
 =?utf-8?B?bWRtaFF2cElUUUQ0Y3hOa3pnaFRCb1Z4dUdWb1ZoNjE1L0tnck5DMm1aay92?=
 =?utf-8?B?NjhBVmcyZEpmMk5TTUpzVkFEZm91SFc4Wi9Pc3hmenl1Wlh3ZUFKenVNcFRW?=
 =?utf-8?B?eUYxc29aUDRiWVNnQVVkaE9PNjlHR1RWd3pLNjhiWUEyd2dTYTlYVGIyWTJI?=
 =?utf-8?B?L3M1T0UwT1p6WUZUblJ2K3JZa0FwcHdqNEc2ZzRnZjZVQVNiMzJGdkMxRW1T?=
 =?utf-8?B?QUtwNit0WkpNUmI0YkQrOFg1NzU0dHVaZHBKbnBNSlk0eGdSaldoMStWUk1U?=
 =?utf-8?B?dHoyTTU0R1ZuVkgyRHA1c1d5V1ptSXoxN3RaOFRrUFROVGs5THNNUWt0ZVNv?=
 =?utf-8?B?SldRRHBVTFNUMmRvaFVmdG5MUHdaRG13U2lmOGZSdmVXRXpQTUFMUUV4aVph?=
 =?utf-8?B?QTRNVlBuelhBUW1mdlN5YnFrYWRrK2tweHlmWDlmaXFESVpMOFBUQ2dyd2hu?=
 =?utf-8?B?VHhiWkVEVTFEM1M1dUN4M251alFZeTRsMG1CcDVMc0JQWkJhV1NpTVFoU0xy?=
 =?utf-8?B?aTU0QlFjK2hvNTR0QUUwcUFvZUtsRUdxcHpwc29KQURyYkprSDRaaDNGKzVU?=
 =?utf-8?B?clJXaWhRY0tzbTNSSE8vY1AyS0RncHFGTmJiUldNZ3duMFgya0tibG8zN1R4?=
 =?utf-8?B?RGQ4b3ZqUzloRzk2UStReGxXM0ExU2xJZ2daWFdSN3FMblJDbkFXSjBwTm9Z?=
 =?utf-8?B?dmQzN3MwMDg2MUtqUXRjMUlUVjRjZ0JLSjJNVVk0bTM4VkpPcjZFd3orVWRv?=
 =?utf-8?B?dFM5akNmb211QzVNaGVaT3ZLRHY4WTJkUUhac2U2cUlUNGlWQm1aVjlOVEV4?=
 =?utf-8?B?eGwvdlpVRVJ6WlA3WWhWa3I2N1d6Wk9TNXZGMklJMllyVU5sUkdFMGR3S3VS?=
 =?utf-8?B?OGpRNzJ6Zmp1bVloYW54elNaemVFQ2NVVE16UDB6YnBHc2J1bVlmYU5WSmVH?=
 =?utf-8?B?MC9pUHpSZGw3ZVJGVU1MQi9yT2JoRXhNb3VWc3duUldNOVQ5M0ZQc0xwRlpp?=
 =?utf-8?B?V09MVkI2RGtXaVlQTWRieEE2UjNJSGl0SFlLNjhjbDcyenBuUTYzRmNjVEFO?=
 =?utf-8?B?QTlnaEhaOWZMQVNXWHJiOTFRcUV2SERDMUdSWVRrN0ZRTStqLzNzYlpVL2I4?=
 =?utf-8?B?NE5lcUpNa3YzQmpzazZqVjVMeXFOZmFjdEtBc3hVQU94L2hQV2hXQm5BSG5k?=
 =?utf-8?Q?Z16WV8yKWHSkev1799zCQaLou?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1AoqiY2xrFQlboTeKnWwBEdudq/HUR7TRsxVXugY2X0NRLiSdG12g6R5NqDg8APyYzZZ4Y/c/VkQEohL14wD5Q39m6linPiimCkVFtetLx+a+TgnBVtkf/F6b/a9Ji4fLTOl0a2hXvrzgjEnuLQ9Dmt23bglj9zUEzGGOQelf3NaJzNLhXZ2ZCngTAz0rJzZrpYJRU19IUUn1VLg/mf5RrZoflNpgzRU4LfCqoW9rs0Obb7evfUcZbE0gzppTb8QlR+W70NX1YEQiGnEsUJoLD0j/yveOqqwbHpkftMBAEOtmJez3GyeV+ln+VHAwty0GvYLTe2UudLoSQnHOYQ4sAilBtEBjY2HCrpjWwwi0Z7o45DOIv8OrcnNMQkgHMj5J/TcVglWuaqJnDSuteWgNmtIpHorWck2YH3rva1U1iJDFHc5zMRYLDRA758nhzXUuRu56f82VVcwOmITD8xaRgGEfx1fb7sSy9rZqLPDJ1BrNjKuY6qZkykTgVU/ozyzuTlsRaf0qXH+uXVaOS9ts4TVDQZI+D0YRUpHaZJZGmp6kMK/gyGrkrR30Se3xgCiiiblrnfQCiGHFBdQAwisDqgSmQZdrfctYPb/WxlMNbLzLTjqo5vcwpwB7rVSIbvsmMWmm1xKog2UX8K5nhcdYFG62c8eLjPnWmM5htvz/uuPMGaLqWQVg2cg+N3WO/t/ufxvb/ih/yAsPe8UWabCTLqmWQcbbFqo1A9ypoQDLqaMfPF6BKRi8D6hh8QfEJWVYB+iCeqoygbashBVZyHdZToxKa39jaAFXuZuY01Z3K0Z/+aJzLwyxLg1iLWmCSg2xINYzqg6w70MHPAmc2hdJbKTzPnoX2a+qNGZ/Ddd1QVFFcbeesSxmfexrNrIuyk3XPhrjGmhDmZN8WvcFial+3bGeDKB71HRkczCdcd2hWY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b0516c-5b86-4ee0-1f2c-08db3072bb9c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 16:29:13.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tT6r6RHAwiYmJJHj1q/mimcO+u4XGBsQWhMxudueJ22uawWCmIA41gRzz8oEUT6j2F8wnlDbgBu3aHG39PL9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6905

On Mon, Dec 05, 2022 at 04:10:28PM +0100, Jan Beulich wrote:
> On 23.11.2022 16:45, Roger Pau Monne wrote:
> > @@ -265,6 +266,15 @@ __efi64_mb2_start:
> >          cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
> >          je      .Lrun_bs
> >  
> > +        /*
> > +         * Get command line from Multiboot2 information.
> > +         * Must be last parsed tag.
> 
> Why? And how do you guarantee this?

I think the comment is misleading, must be the last checked for tag in
the loop that does this in assembly, because it's not using cmove.
I've adjusted to:

        /* Get command line from Multiboot2 information. */
        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
        jne     .Lno_cmdline
        lea     MB2_tag_string(%rcx),%rdx
        jmp     .Lefi_mb2_next_tag
.Lno_cmdline:

Maybe there's some instruction I'm missing similar to a conditional
lea?

> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -786,7 +786,22 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >  
> >  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >  
> > -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> > +/* Return the last occurrence of opt in cmd. */
> 
> Is this sufficient in the general case (it may be for "console=", but
> perhaps not for "vga=", which may also need finding as per below)?

I guess for vga= it's possible to have something like:

vga=current vga=keep

And in that case we do care about the non-last option.

> > +static const char __init *get_option(const char *cmd, const char *opt)
> 
> Nit: The first * wants to move earlier.
> 
> > +{
> > +    const char *s = cmd, *o = NULL;
> > +
> > +    while ( (s = strstr(s, opt)) != NULL )
> 
> I'm afraid this is too easy to break without considering separators as
> well. If I'm not mistaken you'd also match e.g. "sync_console=1" for
> the sole present caller.

Right, wasn't taking into account that sync_console can also be a
boolean (and thus assigned).

> > +        }
> 
> Nit: No need for the braces in cases like this one.

I've added the braces here because it will be expended in the next
patch.  Since you asked for both patches to be merged this will go
away.

Thanks, Roger.

