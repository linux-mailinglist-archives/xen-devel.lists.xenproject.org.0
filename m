Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C05455D52
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 15:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227439.393366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mni1a-0000Es-Pu; Thu, 18 Nov 2021 14:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227439.393366; Thu, 18 Nov 2021 14:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mni1a-0000Bp-M9; Thu, 18 Nov 2021 14:04:26 +0000
Received: by outflank-mailman (input) for mailman id 227439;
 Thu, 18 Nov 2021 14:04:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mni1Z-0000Bj-Od
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 14:04:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d53811c-4878-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 15:04:23 +0100 (CET)
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
X-Inumbo-ID: 6d53811c-4878-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637244263;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rv3HhJphnj7rFB9LGN5pDL0D6FGsaA+pEPMeea76L9E=;
  b=h6w2D3WkPJRjvzrymBosTkhTN9UG4dS0ezVuP4XbAeiKVIhP5W4XzBHs
   O2wDKuFzsD7VRp1Z7e45IZxr5HiZj79cCIT3oxkL0HUoaom/c3s5v9N+k
   YKLNgAOhEf6FQMA33D6bZlt4uyHNABpkJs0E3tWuIT1qyUNUmwbYagXNU
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gLxUiSsALcGkYvWxhjW1a2cFwlA6zGfSu6WPZgUrgxkZulLj5FZBMgIxlj9DT0tbWX/E1C9IHU
 LEtrVtMTulOo/BouJSDHzU8DS2ZBqVjSPpg358HDuax76FPhUYwABbm3KrW0kOcWHu60MyS5Xq
 h85VThE/PuhNkxMiP5m3N2WFUXL0Ohhu5tjKfmK6F8hJUXLVY48otXutDXPo0lSEpE1cf4wXj9
 OxnxOkAHvQrfYX5YtJ7mJLG/ecTlh9kKEhB3iKhZubUaRheUM0j339L/yeIpDK2yjjjBErf6e4
 ffeRr4IE5QxWuxX6+9U8mp+3
X-SBRS: 5.1
X-MesageID: 58088961
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:739hhq9mL+V0g8AfZgZeDrUDrXiTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WROWW6GMq3cZGbxLtB/Otnl8ktVuZ/dnIJnGlBvrHw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg0tYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg2z
 Mptsc3qUj52P/LRiMA+Djx+NnpXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFjG9g1pEQRJ4yY
 eI2ZGpTfR/gZiFuJ3UzVolvhOChvyLWJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wj
 3ja8mHOJwAVPd2S1xKI6nupwOTImEvTUo8ICKex8PIshVSJ33ESEzUfT179qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/cz6ByJjLHV5QmZLmEeS3hKb9lOnPExQTsmx
 1qYheTDDDZksKCWYX+F/7LSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprUSg844C3HU2Tj6Rl2DKaCY4Gr8lHd4ex3EJeCTlKBs
 X4HnOCT9OkLS5qKkUSlW/4RFbuk4/KENjz0glN1GZQlsTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7e3+1TasmOZmIVMV10LjENonAcNWPR48bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvo+kmfvLwsJ+fpyn31lmzuPLXzu503/ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWcCeRy9/LLfrzu9a9IcJUaO5LVQJIdINokitvr2Ul
 kxRo2cBoLYFuVXJKB+RdldoY671UJB0oBoTZHJ3Yg/3hyV/Mdv/ts/zkqfbm5F9qISPKtYuE
 ZE4lzioWKwTGlwrBRxDBXUCkGCSXEvy3l/fV8ZUSDM+Y4RhV2T0FizMJWPSGN01JnPv76MW+
 uT4viuCGMZrb1kyXa7+NaP0p3vs7Cd1pQ6HdxaRSjWlUB63q9YCxu2YpqJfHvzg3j2fnGbHj
 FjPXk9DzQQPyqdsmOT0aWm/h97BO8N1H1ZAHnmd6rCzNCLA+XGkz5MGW+GNFQ0xnkuukEl7T
 ekKnfz6LtMdm1NG79h1H7pxlPps7Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhTAwbKj06Y7nRzvoTgDTTs6g4eR2o+C9t8bObekxOJB3Q2jdFJb54Pdp9k
 +csscIb8SKljR8uPorUhyxY7T3UfHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLN3fjMnbVRwEbGYkEfL3mV0LoPn4kKtTBL0EQGewaDlO3ai6JlxxZW6zk2EFhYl00Vz+JpN
 2F3HERpPqHSrSxwjc1OUm3wSQFMABqVph74x1cTzTCLSkCpUirGLXEnOPbL90ccqjoOcj9e9
 bCe6WDkTTe1I52hgnpsARZo+675UNh81gzeg8T2Tc2KEq4zbSfhnqLzN3EDrAHqAJ9piUDKz
 QWwED2ctUEv2fYsnpAG
IronPort-HdrOrdr: A9a23:0rrSG6Cj5Z7B6VjlHegwsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L5259T5cRzp/ktHNRA7dc6MLmK41P2MGbx2UKpUB/a/fI8SjjwQ6Ce2sRD2AjtQu1Q8KcP
X-IronPort-AV: E=Sophos;i="5.87,245,1631592000"; 
   d="scan'208";a="58088961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGdF7+dPcT9tavaR2XrnQGpZypB6E1fKZtcdRbhOeBO+72pzWguv0L05sCZHkoXt6EQ9S2gUSUZ1b8fJSb5xEI/pfcC4sz1I4/Zy01xUbG1Anm+d0Q3UWRORHxu/gU05v7fYfPoyw7yDnQqvN3QjwcBOSNI5gGvoQobyiyZf2YoJD3OuxZrDnEeIhh4+kWM5c/gF7nxcZYgdZz8Lpl6EC+AkTijRtwkNSjgM4KqOGjVJcp0Mz871+m1uFpzq23VaNMSuHi+XwaGgUn6qc2l+bSQE5VHQ3h42B9L+67RVALAlCed57t5EjJgU5KxDFVLnnMvwUhyiVaiXiE2DZJR2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AropeSepIw3hrBomuaKAfY8kV1MLCtyXtX7n/30PMH8=;
 b=hRs4oGtIQtBNIt4mL0Yr8gawXktRm1SRh+sDBSfy4raQwSMDvOjHgyUwfzSUOApeAUKw8vrE+y1WNOxoPpRF+t2wFDDYOauouZ2FChaaUWibQ4YptLfg8cAUQgDhKud1QsqV23QSPkVptpGQLstFsYpbv8eOvOSVY90EpgWZm4I6kG1PkN7zu8IkztPCKXfc5poFzFEGELyd6kdQ8m42DVPMtmtBdAR2coplffTYZACk1aoBbQ8/A1fu+w1SR/2Aw78213XGgxxfp/YGokr3gjzvA4kpbmRnTx0Tyfi5l8u81FJFYaVycltADb3AeqsttELPrbZM9pLZTxrtRyGdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AropeSepIw3hrBomuaKAfY8kV1MLCtyXtX7n/30PMH8=;
 b=SZzRJRX5tttX6DK9lghg2omadevJA75Rg2TQ90NnTLkKw7HruU1g8PHysqVFbnu5YcS+A0ZFhMaDv9Gl5EgJTjokaLBuW1wuUnhdfIoGcPLCveg6WVZE4ZjNbvsd4pMrMRQ6hzTXHpAtxa7Vf2Z5Y5Tcy45Npy0PjNIXsiW3U+I=
Date: Thu, 18 Nov 2021 15:04:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Message-ID: <YZZdU1oCaMt1HxTj@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74b1f129-52c1-4251-c882-08d9aa9c4f2e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5322CE5465D7FA4371F21F588F9B9@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25SHbcWJfhsGYpflevk43aaI41UQ77iRiXT7b+GeKnPuvLAlCbOmWVYTVqnuTysu6pdBd9MFo7xuY6lI8ITrIfb5Yw3FVPycvRdqZsGaq3OJ7QdVMRnofjC9Wu6WxSwYMqLYi47bj49xjAyu9xpkwiWRsQxwrm9t3bqPSgqiYcsaY4pxA0J35wheliG8/a5lkMLY/FHu5kC4a2AOTIRh6Lkv+6B35+WVR8k+lJB32Vj+OlAy6JhufTxkb37UjSGyQz585lm+GsoL1XimaW7k7lKV06YXwOX4/0zNEenBX0GzvEeIzm7wG7fCYhPqrNB6xMtcK5GvEjwZJEQEdaQaJqrs4CicIO4duzXCpOYUHPE4ptj5KSmwlwzhgDI2mdCKpjyV7aPbnzjs2CDY4UdD08B5eXpsPpKJLTWhuePZd7/8m2pFLMqRpS/sHwKWBSKfKvzS7Ogpavo5fAFAvdzxNMHNZLg1wyDYTEz989B51IropENCdqltNwhbA++O/AwsFjZ5fcZoI3+tUVjVljS82W+2EbSadP92XCp8OUbheXNzGF3qo4BK8ps6WUUih1teuGrLVU1nuBoQCXILA+6r9Sxy0dnJOh4cCPIWSU1x7TeUEl40sbgBHIohGIUOJMH9eBESrI6CHAYkoqc7vgE8mQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(8936002)(54906003)(4326008)(7416002)(33716001)(508600001)(53546011)(6666004)(5660300002)(66476007)(66556008)(66946007)(316002)(8676002)(6496006)(2906002)(38100700002)(6486002)(956004)(83380400001)(9686003)(186003)(6916009)(86362001)(26005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpVcktJUHh6L1JEcG5tT1VraG9KdDRvZGhwVEpkdkpPZVZCcDkrRWhDTFVq?=
 =?utf-8?B?cGU5cFBCSzJ0VS84QTR0cXYzSHJVQUVXd3pGS3FXTDhjZHZmVmV0WnBKNFFW?=
 =?utf-8?B?WmF0MEt3NjFDVnBKZnFUOVpNUW9vdE9DN0dpTkwzSGdyQzQ3RUNaRkI0STd1?=
 =?utf-8?B?b0dpSjhFRDFZM3dyLzRiRFIwQmtSTTNWY0dLWUYrVjVHSUZuZGZaN1NsSGRD?=
 =?utf-8?B?Ym80YjBSa2dMZmhDUkZqL3ZTVlRNLzJzT3Iya0RjWHhOWndqWE5kZDFxSFVT?=
 =?utf-8?B?dnlzRmFOck9jNlMwMzUwVlNKUitxRGkvM1g5OE0yd1B5K1lSa2xxUjlMR2Q3?=
 =?utf-8?B?UEJIVjBkeGl5RllPMCtLNlRqRDJxVnZTR2NxZTVUY04rSk9ONGtrN2NQS003?=
 =?utf-8?B?UDBzc1lUQnZCaEF1MEFBWTRhKzFhMnlhT0dHcmdGYXFURTJ5NDZrWFV5Tjdr?=
 =?utf-8?B?eW1EU0hnN0szbXArT21hVGtEd3YzMm1zK1YydWJxSGE4Um9SNk1BbXBldTN0?=
 =?utf-8?B?SjBEd2hmQ0ljQlNmbmJBQjljenczSXBSK0UzdzFLMk03aDB6T2JGT3JmMEls?=
 =?utf-8?B?TXg0YzBRcWg2WXRzVHhWamtjNi9SR05La2pzN2dJcWJtZVpKb1VmTGZXYUlE?=
 =?utf-8?B?L3dvUU1yai83S2xrMVo3N29iQm1ib241TTQycmQ2U3ZNNXBTK2VoaElzK1hP?=
 =?utf-8?B?RnhMNGt6NERSb3ZWMnJhcFlyZDhrNzlxbTZXakt1dHdqRjVOUGY5b1l5eVR4?=
 =?utf-8?B?ZFB6dXhJR1hPWERjK3ZUMnQzalpWZ0ovby9USjBpa015dHpGM2RLZlltTXFo?=
 =?utf-8?B?elY2UUNOa3JxOVRTSkluNkZudkpWb3h5N0t1YitsMzN6VW81blBJZkJESksr?=
 =?utf-8?B?aytsbFM1VW0yVFlYK1JNaVAxVHoreU9KQkZENEozRFdHdE1tN09ZbUd5b1F1?=
 =?utf-8?B?R2JYakduYkorYlhDWDNadXRyWG1hYTM3WVJKNDhSM3NwTXZhRHU3UjRXZVUr?=
 =?utf-8?B?RGxlOS92OUpZUGpDbWtTQkVvSFVtVFVnbkVlaHhtUnNDMDdYUDdvWVAwN0Ex?=
 =?utf-8?B?OERFd1hqUjVrOGsxb0ZOdW94U2crVWZhc1FRYjZSOFR2TjR2d3RkTnQ4R3No?=
 =?utf-8?B?M3g5OU5jTGtmTVNYT0N4VnRERVNHdC9lQmNQRUt1K2xCM2RwN0g2UThlTDFT?=
 =?utf-8?B?SmdkTER2enRpQXVnL0pYcHJTdEtsYkhFRFN3NzdNNGN1SFlBRk1iY0dONmpi?=
 =?utf-8?B?Tkl1cFU1cE5ydE9FV29MdEtlTE10Y0g3WjlOSFd3SlhZU09LME5jdDdNaVRI?=
 =?utf-8?B?S2JoaXphWTBLTUpqZVJRWTJ5WXZwME80NjZSaDdSZkFhYWlwQk9TcU5TeTNS?=
 =?utf-8?B?cEhEaDlRTjBaYW1tWGlqbWtqT2xqN0VxejZOQ1Z3aDRreXN4aTRTVkd4cWgy?=
 =?utf-8?B?b1EzLzlBWExiTGFvelhTa01GZmhGQ2VSSERkV211bWwrSDdWMktTajRRVjl5?=
 =?utf-8?B?bDdJWmJ6dWtJa0N2bDdKeXBXWWpqdndCcTBwMlE2MU1zREJuQmxOdkNSZWha?=
 =?utf-8?B?SzVaKzNVa2EydEFZanpiazQ4Y3U2eUNyRjgyZ1o0Ynp2cG5YOVVteXp5WW9v?=
 =?utf-8?B?YkJESlJMNWs4RjNjL2plMVVnOS91M2ovOHNEVlQxZ2MwcGw2eGU1M3RNa0Qr?=
 =?utf-8?B?QlAxdjBINWRabXAvT3pEOFN6MUwxRkE2bjRuNWNkZlozTmdUTERTeU81dlcy?=
 =?utf-8?B?d01KcjVmVHgxVi9WUkQrOUpVTThyVFVHVUlvMDVvM0lsemN2L2JYNTdHUVJD?=
 =?utf-8?B?SVNDaS9sTGRPMTFHazJyaERoODJBZlNlS2taMmpJUkw2dkdhMEIycHZRcHlR?=
 =?utf-8?B?VFl0K0pSaXhJeG5yM2dWaWIvS0cyVi94OXFVOTU4K0JUT29GejYxMDBzZWRS?=
 =?utf-8?B?Y1JnekZZYUJpQ0tHMUg2UmZkTlYzdDhtejAxY3Q5WjB1OWQzdW9nZ0REaERQ?=
 =?utf-8?B?cHlKblA3MUVGT1N0TjVZVyt4MVBlc3ZQWWdTcnB1TjJSUXliVTZXVWozT1Qw?=
 =?utf-8?B?ZG5QWUNFNzdsVFRuSnFSdTA0ZnVMbjVxeUxBSU5wQ0IxYzl2MzlSQ1pMaEo2?=
 =?utf-8?B?aSsyampsNENkYkFOR05BNTdhb3ZkbnZudGREUldKRUN1dHdYR2NZK1QzRXMx?=
 =?utf-8?Q?VSL32uDuZHeBNbtZuJ2sHcs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b1f129-52c1-4251-c882-08d9aa9c4f2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 14:04:17.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQfwYnMHdVzL1k7oJyS5l9CXcr12DJaUrY9x470FaI+8DrahsmPyen8vAcTgUiLBCMrBdu57O+3N+0ZNEFKHMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

Sorry, I've been quite busy with other staff.

On Thu, Nov 18, 2021 at 01:48:06PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 18.11.21 15:25, Jan Beulich wrote:
> > On 18.11.2021 10:32, Oleksandr Andrushchenko wrote:
> >>
> >> On 18.11.21 11:15, Jan Beulich wrote:
> >>> On 18.11.2021 09:54, Oleksandr Andrushchenko wrote:
> >>>> On 18.11.21 10:36, Jan Beulich wrote:
> >>>>> On 18.11.2021 08:49, Oleksandr Andrushchenko wrote:
> >>>>>> On 17.11.21 10:28, Jan Beulich wrote:
> >>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> >>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>>>
> >>>>>>>> When a vPCI is removed for a PCI device it is possible that we have
> >>>>>>>> scheduled a delayed work for map/unmap operations for that device.
> >>>>>>>> For example, the following scenario can illustrate the problem:
> >>>>>>>>
> >>>>>>>> pci_physdev_op
> >>>>>>>>        pci_add_device
> >>>>>>>>            init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
> >>>>>>>>        iommu_add_device <- FAILS
> >>>>>>>>        vpci_remove_device -> xfree(pdev->vpci)
> >>>>>>>>
> >>>>>>>> leave_hypervisor_to_guest
> >>>>>>>>        vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> >>>>>>>>
> >>>>>>>> For the hardware domain we continue execution as the worse that
> >>>>>>>> could happen is that MMIO mappings are left in place when the
> >>>>>>>> device has been deassigned
> >>>>>>>>
> >>>>>>>> For unprivileged domains that get a failure in the middle of a vPCI
> >>>>>>>> {un}map operation we need to destroy them, as we don't know in which
> >>>>>>>> state the p2m is. This can only happen in vpci_process_pending for
> >>>>>>>> DomUs as they won't be allowed to call pci_add_device.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>> Thinking about it some more, I'm not convinced any of this is really
> >>>>>>> needed in the presented form.
> >>>>>> The intention of this patch was to handle error conditions which are
> >>>>>> abnormal, e.g. when iommu_add_device fails and we are in the middle
> >>>>>> of initialization. So, I am trying to cancel all pending work which might
> >>>>>> already be there and not to crash.
> >>>>> Only Dom0 may be able to prematurely access the device during "add".
> >>>>> Yet unlike for DomU-s we generally expect Dom0 to be well-behaved.
> >>>>> Hence I'm not sure I see the need for dealing with these.
> >>>> Probably I don't follow you here. The issue I am facing is Dom0
> >>>> related, e.g. Xen was not able to initialize during "add" and thus
> >>>> wanted to clean up the leftovers. As the result the already
> >>>> scheduled work crashes as it was not neither canceled nor interrupted
> >>>> in some safe manner. So, this sounds like something we need to take
> >>>> care of, thus this patch.
> >>> But my point was the question of why there would be any pending work
> >>> in the first place in this case, when we expect Dom0 to be well-behaved.
> >> I am not saying Dom0 misbehaves here. This is my real use-case
> >> (as in the commit message):
> >>
> >> pci_physdev_op
> >>        pci_add_device
> >>            init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
> >>        iommu_add_device <- FAILS
> >>        vpci_remove_device -> xfree(pdev->vpci)
> >>
> >> leave_hypervisor_to_guest
> >>        vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> > First of all I'm sorry for having lost track of that particular case in
> > the course of the discussion.
> No problem, I see on the ML how much you review every day...
> >
> > I wonder though whether that's something we really need to take care of.
> > At boot (on x86) modify_bars() wouldn't call defer_map() anyway, but
> > use apply_map() instead. I wonder whether this wouldn't be appropriate
> > generally in the context of init_bars() when used for Dom0 (not sure
> > whether init_bars() would find some form of use for DomU-s as well).
> > This is even more so as it would better be the exception that devices
> > discovered post-boot start out with memory decoding enabled (which is a
> > prereq for modify_bars() to be called in the first place).
> Well, first of all init_bars is going to be used for DomUs as well:
> that was discussed previously and is reflected in this series.
> 
> But the real use-case for the deferred mapping would be the one
> from PCI_COMMAND register write emulation:
> 
> void vpci_cmd_write(const struct pci_dev *pdev, unsigned int reg,
>                      uint32_t cmd, void *data)
> {
> [snip]
>          modify_bars(pdev, cmd, false);
> 
> which in turn calls defer_map.
> 
> I believe Roger did that for a good reason not to stall Xen while doing
> map/unmap (which may take quite some time) and moved that to
> vpci_process_pending and SOFTIRQ context.

Indeed. In the physdevop failure case this comes from an hypercall
context, so maybe you could do the mapping in place using hypercall
continuations if required. Not sure how complex that would be,
compared to just deferring to guest entry point and then dealing with
the possible cleanup on failure.

Thanks, Roger.

