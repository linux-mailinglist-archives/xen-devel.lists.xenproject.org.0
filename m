Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66744007B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 18:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218594.379109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgUvH-0001hN-EQ; Fri, 29 Oct 2021 16:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218594.379109; Fri, 29 Oct 2021 16:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgUvH-0001fU-9P; Fri, 29 Oct 2021 16:40:07 +0000
Received: by outflank-mailman (input) for mailman id 218594;
 Fri, 29 Oct 2021 16:40:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3mb=PR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mgUvF-0001Wf-Hl
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 16:40:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ba01d79-056f-4dac-96a1-1bd66e903c6a;
 Fri, 29 Oct 2021 16:40:04 +0000 (UTC)
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
X-Inumbo-ID: 1ba01d79-056f-4dac-96a1-1bd66e903c6a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635525604;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zxlbXlXgb/Qd7sR7QQpfFPW0ttoH254puqvJCySCSi0=;
  b=O0a/VPvxUOG7EF2hu+P0B/2hYC/Se+0hX/qpD1EBCYYzksk4E03+7y57
   oY1+Oim+gq6uppxmsbBd38DGWfbUqEq5LUWwugu4nj0K3UgLFItMxuo8X
   0Trd+NbJlOupidR231LzJz1fqmNaeqk5fWA9FS1RCi/bU2da/s+sq2xpE
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 44hmHNUUMxEnEFr/lEFBYX4Iohi0LQXsyunxuP/SB75N8pVPkS3rIH+Q2GF2vHgcDFRRAT/Dv8
 ykFIY+rRN4T04pRz0puhmttdxDj9BFBsYUpGPA8ngqon17jMGaiKXM8HXatr2euG/eqTJTH23N
 v8C8oIesIACa9z65PIByXq195Bmmm2+f/ffiQWCWjxRXQljhfbgdqiisCxkWnT0oxbM06vKxda
 ezNBPoEFxio7UIqrMPDbhZTCqKlBwJFTnwQDZzwS1i7EpWgaws3bmjMTvy33GPcUJn0lVvjVgt
 nRJWGSr7LklirRuwDQtVLgm6
X-SBRS: 5.1
X-MesageID: 56690498
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IG4hlKKtv4Lah16BFE+RipMlxSXFcZb7ZxGr2PjKsXjdYENS1jRWn
 GYZUDrUPKzeYDf1KdByb9/j8U8Av8DUytFgSQVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5yrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2bs8lAw
 dNni6exWBdqHpDzqdoha0BxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpu2JEWQaeOD
 yYfQSUzPFORUQxfBk0WCM5jtaSmnlP1LzIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKhMHMN2SzxKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 1MQ0jojq+417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yzieAm8IXztQcusMvcU9RSEp/
 lKRltavDjtq2JWUVnC15rqStSm1OyUeMSkFfyBsZQkK+d74u6kokwnCCN1kFcadgtTrFBnqz
 juNrSx4gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtrSJeUboqC12Pa/OYDDLumf2e9h
 CEtzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pCb9JdE4DCVWYR4zaJ5dKGCBj
 Fr74FsJvPdu0G2Wgbibim5bI/8hyrT8DpzbX/TQY8smjnNZJVLfon8GiaJ92QnQfKkQfUMXZ
 cjznSWEVy9y5UFbINyeHbp1PVgDnXlW+I8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXRlkkDDrCjMnCPq+b/yGzmy1BhWPgaTOQML4a+zvdOQjl9W5c9P5t4I+SJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOiHYHqLllpiZXZEFQ/xgxALON/zhI9CJ8pfVeR2r4RLkK8rJ
 8Tpju3dW5yjvBycoG9DBXQ8xaQ/HCmWafWmZHv7MWdmJc4wG2QkOLbMJ2PSycXHNQLu3eMWq
 Ly8zALLB50FQgVpFsHNb/yziVi2uBAgdChaBiMk+/FfJxfh9pZEMSv0gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7Zfwwk9RCfLYl2nB6lOOH6D2cUT5KRByqUA4Vm9W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33vXYl8qCGXENeOwi3pBZcdLYlYpk4x
 eoBudIN71DtgBQdLdvb3Dtf8H6BLyJcXvx/5I0aGoLiliEi1kpGPc7HEibz7ZyCN4dMP00tL
 mPGjabOne0BlE/Lcn51HnnRx+tNw58JvUkSnlMFIl2InPvDh+M2g0INoWhmEFwNw0UVyf93N
 0hqK1ZxdPeH8DpfjcReW3yhRlNaDxqD902tk1YEmQU1laVzurAh+IHlBduwwQ==
IronPort-HdrOrdr: A9a23:E5dfjqvSN9me4YucuBFRKV6r7skC5oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK4yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs9D4ZjLfCJHZKXBkXmF+rQbsaC6GcmT7I+0pRcdLnAYV0gj1XYcNu/yKDwGeOAsP+teKH
 Pz3Lskm9PtQwVtUiztbUN1IdQr6ue72a7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhSP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dp0/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MpkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0dI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/1WH+ObcHEjbIy32B3Tr4qeuonxrdTFCvgUlLfUk7zQ9HMlXcegC2w
 zGWp4Y3Y2mAPVmK56VP91xNPdfPFa9Ny4kAFjiU2gPK5t3T04li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.87,193,1631592000"; 
   d="scan'208";a="56690498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISosBwDDbg9W2Ptu7oBucqKfxD3gjOc59OW5ra0WdpG4DCPKO9B60DI78wh5HTG57PmHwd6ukbvsH4YZiCgExBgcnxvacbfHW/yEK0hyXVIqQ5AKzJiYy8gF2HBvp6p1eN2X+RbwgwpQoyS8HCCg1vZYMfVIx/H7wiBwdyLFu0VEriCQYW19AmnNQKneuVzua4Goj+Ige2epvA8x5yEEx/fsYuOmVAZ1ifccg1pZmb/JeVdAwRTBgJyz6gnKRU4uw9XQgmhD/6vPW6ujmFOc6h8yG76bav83zMVIO3xjoK1Triw+BCNVPdNGgQY+81/2/vMeTXQ4DsKogBXarqgQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=df0oU8hNu0PcbliEm4rCoT+n11xcH77I9QpMr5SaEJM=;
 b=jjn73YpG93yu5uonumHJtkQJMPGeER/8ERzO0rxrFZseAzufqYIpfF1dKqVaVjP5CHlgUOAol2KsQsA27uQoebHFCZjW2riwv3n9EqIX3X5ufi/q30epwglCo0v3qXW4shE/tZQ9xNcOU8EdE430Rgv7xmN+6JEYGP0BvtrgwMjth/eRjKfNOzgsmfcS7B9BqHDOoI2o/TxXS80cNKAPrHqsbZXmcTNjOkKN6QgnWXkc/TJ4tn7OMfqgaEEizhLPk+f2nuozHmwFeEShq6OzvLRJNxXwnnz44l6AgrKq9/AL9Edz7j2l5AF8LNnc+xTk/dlROrnehsE58OxHm/lmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=df0oU8hNu0PcbliEm4rCoT+n11xcH77I9QpMr5SaEJM=;
 b=aNLwYXdPWzG1lDEfaD4VUeurEjcpugnEYw7pAw4KKd9aVhA/71E3Bljh0UEjpmouEmqAuWuvhVTcLOwUD2OPdcvaZEvEJiw8iZfBeYPRPrmWB5uBLKeBdCY9K4Eibiw9fWKD96qL11LGNfKVPoJSr6OJdmCU4mDXC/IPLGZAa8w=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
References: <20211029075956.1260-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
Date: Fri, 29 Oct 2021 17:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211029075956.1260-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31043b98-4e02-4c6f-f1a2-08d99afabfb4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3559:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3559A73C8E0EC6CF0D16A119BA879@BYAPR03MB3559.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQtI3/N5fL2LAJST2VJw5iv+/vkRKlUXyQGajJZktVURDboAT3DTMOCoDtWwiHFfm7E+apHLMY1siMlYBIgL20b1Orll8mnnE1+9IQBRr9RTnroCes+w3X9k+q/ukg1ZqS6acJBSJZmXFTjcRX1HG2gUTtR869HnrOoyFO5Rj2nalA07grdlpulTdiSfGpwjEI3u0s+ErotNBNUIdssi10AYAZE77uMZqcGyfNWQMc+U5YB+glRMqyPQDTqRkmEGfJtzNMNaptiCVvGAzupaGrcP4LHbOcv/J8Ntg9supi+X3WV9oPK1weT9bxPiL+sWimHUrkufCWP6JlYTmQA9qUAQ8F9oJtHW+smm75ktehIEBNFpU65kT8RWFV4D4REU6YpFji2w1Tqu0KprBMXIHKKP9sa+h9Bv2wtKrH+o/9B0TS4+N+cjcHBDdU7a1Xs8gZY/SYDtpQRuUEw6Kj4RYu7gIQVg/BncxFwiwj+boPeWBlQGe2rPY7vz+mkXAohbx9jFqMXch1bE87LKAdbNVb1pzeEbSbF1WjWg3mIHMxYOKIDOQu3r04lsk3G/tL0HLVV2Wm6M869XIYP0TOFcDgGTUZAQKJl1kNiQKAr3KDkDYEwQPs/SF/Crwl4M02EnwN3RwVRaaMEhif09LlNSYmkYDfcbjX2bjIWqPK5Pab9KptC7xqym+dU36vuHeHJFYrjNmZZ6pBwIEbeUm3TaZfQJSd25BffWuJCrr38yY9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66476007)(26005)(4326008)(66946007)(54906003)(6486002)(53546011)(2906002)(66556008)(508600001)(31696002)(6666004)(83380400001)(82960400001)(186003)(31686004)(956004)(16576012)(5660300002)(86362001)(8936002)(316002)(8676002)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFBdkpZbWJLTTJiTVJEMlhHaGl1SnhHQ3N5eXQvVzBhV1R1S2JBV0JQYk1p?=
 =?utf-8?B?R1Z6ZDVxRmJ4QUdhZXFNRExMd3Y1aTc0ODdoTm0wU3AyOUFabFp3VGs1d2xi?=
 =?utf-8?B?UkpxUml5bTh6LytyQ3llR3R3WDJtcUV1aEpkNHdRQ2xwVUVuUmtEQ2t6UnZh?=
 =?utf-8?B?dG13SUg1Mzl5c3NKdG9KNDZSakcwUVI5ODcwZ0tHeUQxV3RnLzJPS1d1eWFv?=
 =?utf-8?B?ZUVyZDluSWdqTlAzbWZCV0c3cDFWNjMvQm5FNWtlVU5HUFY3L3dPTjFVaERn?=
 =?utf-8?B?WnYrQzI4UTBuVmVoUkZ4d3h6cXVmT056TVorNVIvUTFrZFE5Unlic01nbnpj?=
 =?utf-8?B?ekZyUDduM3lqaHB5WTg3WVhyRXhoRERRTFF5aW9ZZmV1VHl2V0VuSlA3Mmdu?=
 =?utf-8?B?UVpqeWxxSU0xUnE5ZGpiK2c0eHJIZXh0VkQ3MjBRTmltdVBYS3NNL0xWbU56?=
 =?utf-8?B?SXBFVWp3QU1UeUkyUW5DRmdyQmd4Q2hvUkV1dTY5ZS82YThNeXlNK2tSclNT?=
 =?utf-8?B?Z0Qyb044bGFOOUdTcTFCSmtIbFZnWTM4TUVnM1RjQlBqL3BCYVA4Q08vUEFX?=
 =?utf-8?B?SFVlT2RVc3BCdUl6UUxNOWxRU2VLZnd0RnVLTDRlTmsrcVNmcWdnOVcvK1Zm?=
 =?utf-8?B?bllSVzhSek1GWUd5czR5MmwxSURYNWFaeHRSM3JaNFl3TTBpam1yNTZoYXdG?=
 =?utf-8?B?Q285aW13VkZwZmpBK0kyZmVYSGllaHdpRG1PNnlJeElnS0FDMVl2L1pxYTBM?=
 =?utf-8?B?akkwK2tTakpidkQrdS9NSjY2R1BMZGh4VlpoSEV1dXNoUmY4SU56LytBNndz?=
 =?utf-8?B?a3ZXaTBsYTVpeElBNkpZOTFqNWNZdXpQS05HNGxIUEZRNkhiU3htTWh2dHA0?=
 =?utf-8?B?VWRBeC9WS2pJMlh1dEMwd203YWVOcUd1cHJtT003cGpKa3dnQnpKeU1GMDVK?=
 =?utf-8?B?L1Y2ZFpXRkl1cVVyai83c3dYRU1RTVFDeWhtQVVlK2xDVXd4UUkwTlBjL0Fo?=
 =?utf-8?B?QlE2bXdwbFNtR2dkY2Vsd2Z2UWp4c3A4QjRYYnlGZi90OCsvcGNvUTdZS2Vj?=
 =?utf-8?B?K05qQXA0ZFJNNTJGYVJEN2lCSkU0aW40STNuYjBTS2pEZURqTmQ2cHgrNGRV?=
 =?utf-8?B?NFZYcmVkcDdZcVhFbG5POU5nYVpLNUtyVnEvZGdFcEppc3Btek90clpZbHd4?=
 =?utf-8?B?bm04em9MRUx0YnBqVCtsTThPTXVFOFpBQmtqZjdrMk5vMng1K3JpLzdWOUJ5?=
 =?utf-8?B?V1hkWkdkb3Q5dWdUZ2NLZ3EzNUNmamJCSGY2ZjZzWENiWS9TMnYrNDFFRzY2?=
 =?utf-8?B?UmQ3eDUxTm1yVEFxN3ZMamo1QWJKYnYvK2lhZVphWEJ5SjVqNkdHcWJrVWpM?=
 =?utf-8?B?K1pYaGV4MjRIczhtOHcrSW5SRVFGZm1wWDN2d2JuSDBIRUhvNGN6M0VBS2JS?=
 =?utf-8?B?cmJudFZOV1YrQjVRMU1GZzAxMWdMZy96aXN4SXFaZExqVDkxS3pHV0RDNjR3?=
 =?utf-8?B?c3cvUjNsN3MyVmFGWDBkbnROWUh6d0pTaXA3YzVvQVlsT0xzSDhoYTRVSjZC?=
 =?utf-8?B?ZDB5dEs2TmhieDBSQk9xcHlFem9iWEZBVnNmL0tMeU41NXZaaXJkQUpCRTA4?=
 =?utf-8?B?SkJ3WGF6MzJNbnZiV3ZrOTNjWDhRTXNpNGVpYW9QZE5qR1dXREpUTCtSWnFE?=
 =?utf-8?B?UGRrQTI1VWtrWXBmS0xxZXpYeUErdWgyYTc5aGIzSytMUFFVdXFMVHYwcXYw?=
 =?utf-8?B?WnBqRGFWbkZRQ0tYMUJkVWRJbC84V1ZwRFZBUlJrdXkya0JLdGpld3I1OEhh?=
 =?utf-8?B?bG9WQUtncWNBYzFGRWt4cjhDbE5SdnZDK3VRR3ZVTWMvakErVFBrdXFac0pp?=
 =?utf-8?B?ZkdadWRubVNyMHd5cm5EejR5VXUrNkgrOTZoZFc3MXVaUGlLdEJrMEkza25h?=
 =?utf-8?B?bWw3RUVvT04wcFplbm1LRDIxRkpycmM5bUorT2hiODREbS93dUJRUFhsN090?=
 =?utf-8?B?VEJMWGZ4aDJsSktXeTJ5NGVHdzBMTk94aVh1a2haNHIwSDRHaWx6QU5XSTU1?=
 =?utf-8?B?dWg5TlEzN3BNc2ZkOVZLanVTeWI2MFREUmRGU1JTM2hyWUhWZmI4YytHSW43?=
 =?utf-8?B?ck12dzdaK0I4ZXhJWHI1ZklXUEZtTUVuUnlscGRzRFJJOHdmRUZQWkJaTklX?=
 =?utf-8?B?S0JpeGtwc01TZUkvNTV6SHRQYkE1SFdVRi8wTVNqMG83dyt5SjhVdEh6M1Z6?=
 =?utf-8?B?QW5xeFlmMENzZXd1alY4RXYyVjd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31043b98-4e02-4c6f-f1a2-08d99afabfb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 16:40:00.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXwBgI+A0LC4zuEct25SnVzCJeJqWwh8iZ80NwBATSglb4MnUwfOsqE7yPcxTQnLULqhOB4/0NaRY8Hhzue1XVGb0ubCFnsRAmQSyMdsr0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3559
X-OriginatorOrg: citrix.com

On 29/10/2021 08:59, Roger Pau Monne wrote:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 0167731ab0..faeb3eba76 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2967,6 +2967,7 @@ void __init create_domUs(void)
>              .max_evtchn_port =3D -1,
>              .max_grant_frames =3D -1,
>              .max_maptrack_frames =3D -1,
> +            .grant_opts =3D XEN_DOMCTL_GRANT_version_default,

These three will need to be opt_gnttab_max_version which will need
exporting.

See final comment for why "default" mustn't exist.

> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index e510395d08..f94f0f272c 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1917,11 +1918,33 @@ active_alloc_failed:
>  }
> =20
>  int grant_table_init(struct domain *d, int max_grant_frames,
> -                     int max_maptrack_frames)
> +                     int max_maptrack_frames, unsigned int options)
>  {
>      struct grant_table *gt;
> +    unsigned int max_grant_version =3D options & XEN_DOMCTL_GRANT_versio=
n_mask;
>      int ret =3D -ENOMEM;
> =20
> +    if ( max_grant_version =3D=3D XEN_DOMCTL_GRANT_version_default )
> +        max_grant_version =3D opt_gnttab_max_version;
> +    if ( !max_grant_version )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 request=
ed\n",
> +                d);
> +        return -EINVAL;
> +    }
> +    if ( max_grant_version > opt_gnttab_max_version )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "%pd: requested grant version (%u) greater than supporte=
d (%u)\n",
> +                d, max_grant_version, opt_gnttab_max_version);
> +        return -EINVAL;
> +    }

I think this wants to live in sanitise_domain_config() along with all
the other auditing of flags and settings.=C2=A0 Also, it can be simplified:

if ( max_grant_version < 1 ||
=C2=A0=C2=A0=C2=A0 max_grant_version > opt_gnttab_max_version )
{
=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_INFO, "Requested gnttab max version %u ou=
tside of
supported range [%u, %u]\n", ...);
}



> +    if ( unlikely(max_page >=3D PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> +         max_grant_version < 2 )
> +        dprintk(XENLOG_INFO,
> +                "%pd: host memory above 16Tb and grant table v2 disabled=
\n",
> +                d);

This is rather more complicated.

For PV, this going wrong in the first place is conditional on CONFIG_BIGMEM=
.
For HVM, it the guest address size, not the host.
For ARM, I don't even know, because I've lost track of which bits of the
ABI are directmap in an otherwise translated domain.

I think it is probably useful to do something about it, but probably not
in this patch.

Perhaps modify domain_set_alloc_bitsize() to impose an upper limit for
the "host memory size matters" cases?

For the guest address size cases, this possibly wants to feed in to the
max policy calculations in the same way that shadow kinda does.

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 51017b47bc..0ec57614bd 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
>      /*
>       * Various domain limits, which impact the quantity of resources
>       * (global mapping space, xenheap, etc) a guest may consume.  For
> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> -     * default maximum value in the hypervisor".
> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> +     * means "use the default maximum value in the hypervisor".
>       */
>      uint32_t max_vcpus;
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> =20
> +/* Grant version, use low 4 bits. */
> +#define XEN_DOMCTL_GRANT_version_mask    0xf
> +#define XEN_DOMCTL_GRANT_version_default 0xf

This needs to be a toolstack decision, not something in Xen.=C2=A0 This
doesn't fix the case where VMs can't cope with change underfoot.

It is fine for the user say "use the default", but this must be turned
into an explicit 1 or 2 by the toolstack, so that the version(s) visible
to the guest remains invariant while it is booted.

Given the timescales, I'll put together a prereq patch exposing
gnttab-v1/2 in virt_caps for the toolstack to reason over.

~Andrew


