Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F7675891
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481945.747193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItKs-0001Qy-0Y; Fri, 20 Jan 2023 15:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481945.747193; Fri, 20 Jan 2023 15:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItKr-0001Of-Tv; Fri, 20 Jan 2023 15:29:45 +0000
Received: by outflank-mailman (input) for mailman id 481945;
 Fri, 20 Jan 2023 15:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pItKq-0001OZ-Ej
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:29:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f3ca0b-98d7-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:29:42 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 10:29:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 15:29:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 15:29:37 +0000
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
X-Inumbo-ID: 41f3ca0b-98d7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674228582;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yge2g53HZcQLbddtW2AVNvLUAcxZmkR1/ztfQt9ZuOg=;
  b=A/rUcTBgDZYUOIBwSGuhuIvHXZk5ew7CaHCDWxKJcz0wNuMQFxnlHArp
   ndY9OA5GkGC0MDLjQs49LWgCOW0zd1VOmG+tnjxH0OpM1H6vruSF/ZX2o
   OAROOOilj+FI8pB3M5/bhuBJdWHqPiMMWOsWKJYdQ+rI7v2VEM0zIIsh7
   Y=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 93570715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M064uqm6TAdUMChNa+vaV9fo5gwZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDTiCOKnfamb3edEnOt/l9UtT68PSn95iGQdlqiE1EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5geGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aMqES0kKRCcvOPo6aO4QMhTlP14COC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieezWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDT+DnrqEz3TV/wEQ1OCwTcAe2ocLnyQ2uRP5/J
 2xI1y0X+P1aGEuDC4OVsweDiHmAsx0HWtsWEPAg7wqNya387AOQB2xCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdptL0EDf03
 juDhDI/mbIIjMgAka68+DjviTWmrInEVQ4x6wDeWEqq6wp4YMiuYInAwVHf7O1cJYeDCFebt
 X4PmtO28+wFS5qKkUSlS+ILGrar6/+bMSb0jltmHp1n/DOok0NPZqhV6TB6YU1vYsANfGazZ
 FeJ4FwPophOIHGtcKl7JZqrDNgnxrThEtKjUe3Iat1JYd56cwrvEDxSWHN8FlvFyCAE+ZzT8
 7/CGSpwJR720Zha8Qc=
IronPort-HdrOrdr: A9a23:j+pelKyjrRlsbND/ToWQKrPxS+gkLtp133Aq2lEZdPUMSL3gqy
 ncpoVf6faUskdUZJhEo7u90ca7MBbhHPJOj7X5eI3SOjUO21HYWL2Kj7GSpwEIcheWnoQwup
 uIMZIOb+EYZmIbsS+O2njbLz9W+qjlzEnHv4bjJ9oHd2xXQpAlyz08JheQE0VwSgUDLZ0lFK
 CE7s4Ciyu8dW8RZsGbAGBAe+TYvdXEmL/vfBZDXnccmX+zpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8yrS/v+q9whr80XaWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKsq/lQFwhNvqxEchkd
 HKrRtlFd908Wntcma8pgao8xX80R41gkWSgWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+ZjZxKFhnN9R6NrOQgFisa3HZck0BS3dL7vEYvHrf2r4Uh47D3yXklXavo2hiKqbzPXt
 MeTP00r8wmCW9yJ0qpxVWGR7eXLzYO9sPseDlAhiXS6UkeoFlpi0Qf38ARhXEG6dY0TIRF/f
 3NNuBymKhJVdJ+V9MPOA4te7rHNoX2e2O9DEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiJ8/go
 7IXl9UvXM7PxuGM7z64LRbthTWBGmtVzXkzc9To5B/p73nXbLudSmOUkonncesq+gWRsfbR/
 GwMpRLBOKLFxqdJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObpbns+TKGcyjWoYF0QxUJV8XLk
 FzIAQbfv8wlHxDckWI/STsZw==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93570715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltT6nw5LOUZUwhGYX8VH1BJJjgIz3UKrvVVoL+O3UBHm3per0ITsaaJkE6g5qyScf+nlO+m/xqEfQAzryx5nXHlA+AZa7mYA6Jlux0uGTeLqlPFL3i0XI9iHL13q6kqK1Tkww7QMXMpUnQAZhfqnvSMjg+rmtzfQHh5kyRPZwHdifdTWvvuzioucvdVFdncwfLXisbMppwcM9Uy8VyxQyH134an2m4L0SEFlK1cKVTTIap+flt0eFAFC3wNeEOjS5sY7sFA28b47EaXmySetjRDv1kRq9G51rEDyYTz8GCs9gsroK3D264BHAnyXRrpTk19OGV/fPTSez0N2kS746w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yge2g53HZcQLbddtW2AVNvLUAcxZmkR1/ztfQt9ZuOg=;
 b=eiqwMxEftGFvz5oLpB+gBrW9cT8/k/lVeKaYb67PrBXXJhlyObjXhTsLmqd7Gza3Y6cGpCAiboN7C2liRYd+17aGp1uOcR/5eFnidwAD8QL+bCGPe0GFoX/B7dW2Fjr9qLC+sBlAQbDoSMnfJkS22Hzt0secQr67l+56oUrScmpza04cAyc9P5llUXCpB5JBQVa2Q1ctzPUXuqRwSu8o0o3+RHQBGYGfhbIbUhEpepH+JuwzSaSKff/xEFpoAYMFN/mr8BLcg2gmuFnbcpbmDFkfZs2p7Ikz1KEF6fbNAFb+POoistxk7tD5ITvzxkr7E9w8piV6wd3w3uM61obQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yge2g53HZcQLbddtW2AVNvLUAcxZmkR1/ztfQt9ZuOg=;
 b=LgPD0EZHD2RGklxyNSQjn7/p16IXgJn+2ThAOgnpZDDPCo/GGBJ0BH7e/339QprrYZ5DTc/4ad4AU0loFammx3HQMVT21fWQc203XHbypHCKgjMWrL7J2dTnQedWWrBKhaaZU7kPjULUp56s3h3QcXSQtFpMlgmDzfsxz/xQzAw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
Thread-Topic: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
Thread-Index: AQHZLN/sD4BhGIHIWE+hX+U44mzDDK6nbkKA
Date: Fri, 20 Jan 2023 15:29:37 +0000
Message-ID: <d5d9a305-3501-cbc4-1c8a-1a62bd08d588@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5412:EE_
x-ms-office365-filtering-correlation-id: 8d288807-7b9b-4536-7689-08dafafb2430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eqghUMBDbp+SX98Rys6HXH/2IEfvuZMiX6AvI55E87Gf5FmTRD86NHx9O/buS3QZOoXkHgWQhSKx1VJSzXRVD1hyKPh0vrMV4T9PFF1XhAVtLvlMpVWG+DAxISKe/+Av2S7rT52B1wHcY+mVVsComLtX3JEFCB4l/NBDOCshVwuMQS3yXzK6R5KKqi2F8wTe8dC/juQ2UO9gbjfQt7dJ+AKCYLaljYFOLjWxhpefr/DLmYLwn27lkVadTPp0CHEeEQbsnrWocaEb3pwwHdOMp4S3jqRjRPy64Vy3Hysp/CWPnm5RJxbDOh0ojWt5aGpeO9dW+4i4JZoz7KF0ZSeR6s0X7JTdDaY8pTTm2+uYjankVfUkjYvmjb1Pp5wMmL8UHMdhuhnblK2/yBn1iBfURF7TtSqWDimtZwm1KS6wcNzBl9DUH44YMp3pOBHspLUMi3hFHiJOciZwV2dCrPAdpyu1uWfQLp3fia5XzwdtDcsEPeT0EPARexVXr22in8KnL2sO4uj9YsiYF2/j90E2EdWUiQq4j4GWJDKMrhrICCDEV1PRr5TINrdmlbsUf2IGHu//95JgprylYlNd8XbOjdo5InUg0mtMZxy7qR8kB2gik5QhiGxnVA4vckuyV03pYVlhp8zXZsKENRj/QHMIggEpLMhJFk6/W5noYwmeW09nOtdl2VviHhQbJbggvMWDo1MLns/Oh4FIxs29hZS/6fz6cOLIYI1va9wjkyDvSGuW7ZEpLZ425RLySVfju5jJq2xYY5HFeqQRu75Z0Tui6w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(4744005)(5660300002)(8936002)(31686004)(4326008)(66556008)(64756008)(66446008)(66476007)(8676002)(66946007)(91956017)(76116006)(71200400001)(38100700002)(31696002)(122000001)(53546011)(6506007)(186003)(2906002)(6512007)(110136005)(54906003)(26005)(6486002)(36756003)(478600001)(316002)(2616005)(83380400001)(41300700001)(38070700005)(86362001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjMrYytPcFN1TDdZQ2RtcURlQmxqOXE1cVYxUXdKSFc3YzhYTVhlVXpNZUpF?=
 =?utf-8?B?VE5Sak5LZU1KTVVTdVhXRnZSSHRCcTlmQ2ZwMkJGUWpvcFBjaEFNSEVZa3F1?=
 =?utf-8?B?NkFJeklHYkR3UzE4VUE3Tld3aWFuclJpS0NwdUtmQm83OTh2RXB3aVE1TXov?=
 =?utf-8?B?YmpPMTh1N0RYa0F2NEN6UUZqQ0I0WkRLNHdTamY3NGY5akxnV1FLQ3RBN0xr?=
 =?utf-8?B?NzhmTWFEZDFsdFNSeEFvOWtjZXFZa0VFSXBMVE1xSVNnUGp2NDVicnJkRHRz?=
 =?utf-8?B?aVVCM2hxN1FNeS80YmR1b05rQmRhVHhxUm9RWjJTZEVDRkVMT1cwY2RmV1hL?=
 =?utf-8?B?N05xVFJqYzlNVTZwekoxR09DU1RybUg2MDdTQVIrdEwrWDFBaER4ejZpUEw0?=
 =?utf-8?B?Rk5JUkxBTDRDNS8yV1JZSzE1Q0t6SmpmQkp6Rng2YS90STQvZFZ1ZFhvd2NT?=
 =?utf-8?B?LzN2ZkFCelBCZnV3cElFUk52RUxZUXZWVjd4TE5DYmk0WUIvYU5HQ3d1MlBw?=
 =?utf-8?B?ZVAxR2x5NlpIWUtObysxaHRzUFM5cW1rYVdrenlyMzYzVkhjNFZWYm1ibVcx?=
 =?utf-8?B?NllKaHI2WlljZnE5Q2IvcGl6Ym1BQ1hrK0NVOG9MdHRNMWVQRW4xaU5jNisw?=
 =?utf-8?B?c2dQRkZ3aitUb1RFYm9lekJhNkdHajdYeU9JVUh1N3QrV3NFa3lCM0ppOU5o?=
 =?utf-8?B?Nis0SnBhWi9Lajl1Y3FQN1F6eWR3amdHM2VJcDg0MU5ZZ0dhVzdVUUN0Zysz?=
 =?utf-8?B?TlJna1dSYUkwUW5GN3lraXZOdFY0TnBSQ1RWMFJTYUlYRmQzaUlLckV5VjBZ?=
 =?utf-8?B?Q1pWazk4Tkw1bXVmSWNQRDRlRGFYU0pudXBzZUxKUGZJdERBSm9ha010dVpW?=
 =?utf-8?B?VnZvdmhucUo2QjN5Tks1N09CNERmZUdFYWJPSjFPZ0JONGk2cXFRcTVuZUpt?=
 =?utf-8?B?OXlRdFU2UmRRcW5HdmdXNEtiSXdZTEtBVVZtWDFBTldlSjdZeUllZnlPTWgv?=
 =?utf-8?B?U0tGdnVVd2pkTXZ4WlN3NUtSTnkxWVJINlc4dWRHbnh2Q1pQRVhHSXA5Mllx?=
 =?utf-8?B?QUcvbjQzM3dYYkxlN1M1VHpOdnVYSmdGdW1idXlrTVhZMjV6YXZsMU1PcDZ4?=
 =?utf-8?B?bURVU1ptU0xHcjZ0aFFaNHd0eDcrSTMxbXFTK2ZIdWdlN0FVYmNqMlFFVG1I?=
 =?utf-8?B?R3RXbEV3dTVMdEZqcVY1VjN4emQwM3YvWWpHUHRyaEluVGxJVHhHWVozeG9P?=
 =?utf-8?B?VVFKNHI3S0IrZ1l6Q1VXSnhZZ29zaWZaYmpKTU5FU3FqeHFmRkhEc3kvZ0c2?=
 =?utf-8?B?TTdYbHkzS1lkU1lrVDJMNTNGZ1gvVUNGdGtyRnFkeXVlMlV4TjZRREo5SjRR?=
 =?utf-8?B?d1BlM0FzYWRCWGVRS0xWZVpmazExZzY3amN4RTdOSVNrWGV0bVEydkQ5bUMw?=
 =?utf-8?B?K1RKR1JDbnpFaC9qMC9EbGxFSlZabEVuVERjMk1vc0hsZGJRN0tMYys3MlhN?=
 =?utf-8?B?K2dqdUxxcHdUcFUwMDFhUmpxeVNTK0RsUlRrZnBVdGZIdlBZamgyYlJha3Zi?=
 =?utf-8?B?bWxjSkFKSTZVNnZlZzgrV0UxMjRTQXdGeTJTcFRWT1BGcW03Zm1RVHFaU2FX?=
 =?utf-8?B?eHpJS0xldDJTNDRyTU53dVZuYXY0ZE1KT2t3ZnRHMmV2YWllK3RaWGlRaXNE?=
 =?utf-8?B?Z21Rc0NETUhiVkNQU2FZemR0RXBXN1FyQzMzVHBOUWJIakxZSXEveFpmVUJI?=
 =?utf-8?B?eHNYOWhGOEtlMExyY055WnduYXN2YWhrSjgyV2V4Syt4VHEzSUZ2QnBscjQ3?=
 =?utf-8?B?K0Z2WmZzbVA3VnBWUkNkVWVIVUNYN3JYdzd2WDhkWjVUZEFpaDhEQksxeTdZ?=
 =?utf-8?B?ZG1FRENONHV0b1BNL1JBdkdjcFhwWHNsM3NXRmFDelpCNXlJK25VY2ZESS9Q?=
 =?utf-8?B?eGw5MXg3QTBzYWUwS0k1U3E4NGtOeGhVNVVqYkRVNDVpMW14cHlqZTJKSUVq?=
 =?utf-8?B?YjlMaWN2T3RZZlE4eEQybTBEOHdZYloyZ0l3VXJ1S1YyY0FHcERyYmJ3MEU1?=
 =?utf-8?B?UWdjR0FuYktCS3ZHdmFwTXJ3RDZwWC9qT1c0bGJ4SWVlK3pLL25CaDVESVBV?=
 =?utf-8?Q?BUVWwdXHFgjXoOxF9ZV5pL9CK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8836139EBFC4684BAAF1279C6B10CEB8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Y7vxzuonXZR3ydPDfV1UxlwSzOWrrWuo4R6y+7iHQz3TItPqivE31YKOl5NYPYHItrTGlcil02LazxC7mqNaM2CPcOIlgnyTv2mqQZ8arTq9j0KXzaZtrCWUCfwj+yNHo6iXrWMypVe8H/u5DNM/AEJXviHUaI3ZrsZ2Cu+5OaoY5FSSfwJug4n5836kgZk+1HF7+9rOwNkqdTp/gyjv8knt6qY/9ZYAtiZYCtlaImk3loaNVHki0Hz17ppvaRkFVDv2R4413R/sLbvx7RUitTqrodhqyihhIPWg86OSfDvLxukn7+aaKB2vykpIqNv9fs6j2JlEsPgHtTtvK1B7Ubv2B72u9PcUhbLOWW8IEg242PEYRBER+tILPQQKesED+3+yU/QvzFZpSjzokrxqtlczro2Szp4UE4hfaZJlYFNoUZkXF+5nWj2StcydRdIZji0ypbTAg8m2EhEdYBSYcnVzUHjBS06p0na0Xl4nnHAmcv5AVGkDMXd2y2gbc4Y1ndPHmoBNhMsvCLu09VZ0yMvv13iDE/v35SGpMLlTBXsn+7NJyI1OC6nhYzNG5h5shVYNoRXK4SdTb7YQgFA0Oj0fX67G2nHVdeynSedBdlwLb94IevMggeX5sy8LN6d6eRWe52ea8ju7mpKA7wNEd2FaTWP1LWWHtrUCx0jYb8CfrADAFHF1l1AVEvAAPf8g9y7PITfKs8n/2zbSnqu+gJXBCEPxZtFUYo1zKot1YF2tJvIEDvIAN0bXPvhx3GKEJBSBpdvTr8pruM/8UupkqM0DRiuY4+TMvrx9XncXlrxWuZmaTv643BMuunsEZUgdGbLz4xEgQoP3Sdvqb0xRfO5yxHzzy/UZoUu9AD0CGZnXCsp4aIsABVEyVjply5UGTlSI/+O/S8+Jc6zYfp5ig==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d288807-7b9b-4536-7689-08dafafb2430
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 15:29:37.6768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +H1mM0z36tZ2fqJiFy3f0CRkBepntl76L0fUNFIvJNdT4N7jzHcO4ENmCKnBoFXr/26h8HSBob5ha/GNV9+M8vAyOf/PNadxKmZ16dEldgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBXb3JrIHdp
dGggc29tZSByZWdpc3RlcnMgcmVxdWlyZXMgY3NyIGNvbW1hbmQgd2hpY2ggaXMgcGFydCBvZg0K
PiBaaWNzci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5r
dXJvY2hrb0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gvcmlzY3YvYXJjaC5tayB8IDIg
Ky0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcmlzY3YvYXJjaC5tayBiL3hlbi9hcmNoL3Jpc2N2L2Fy
Y2gubWsNCj4gaW5kZXggMDEyZGM2NzdjMy4uOTViNDFkOWYzZSAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gvcmlzY3YvYXJjaC5taw0KPiArKysgYi94ZW4vYXJjaC9yaXNjdi9hcmNoLm1rDQo+IEBA
IC0xMCw3ICsxMCw3IEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKSAgICAgICA6
PSAkKHJpc2N2LW1hcmNoLXkpYw0KPiAgIyBpbnRvIHRoZSB1cHBlciBoYWxmIF9vcl8gdGhlIGxv
d2VyIGhhbGYgb2YgdGhlIGFkZHJlc3Mgc3BhY2UuDQo+ICAjIC1tY21vZGVsPW1lZGxvdyB3b3Vs
ZCBmb3JjZSBYZW4gaW50byB0aGUgbG93ZXIgaGFsZi4NCj4gIA0KPiAtQ0ZMQUdTICs9IC1tYXJj
aD0kKHJpc2N2LW1hcmNoLXkpIC1tc3RyaWN0LWFsaWduIC1tY21vZGVsPW1lZGFueQ0KPiArQ0ZM
QUdTICs9IC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkpX3ppY3NyIC1tc3RyaWN0LWFsaWduIC1tY21v
ZGVsPW1lZGFueQ0KDQpTaG91bGQgd2UganVzdCBnbyBzdHJhaWdodCBmb3IgRywgcmF0aGVyIHRo
YW4gYnVtcGluZyBpdCBhbG9uZyBldmVyeQ0KdGltZSB3ZSBtYWtlIGEgdHdlYWs/DQoNCn5BbmRy
ZXcNCg==

