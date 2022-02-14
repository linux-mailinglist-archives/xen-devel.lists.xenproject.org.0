Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7D4B44CB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 09:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271222.465573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX1j-0004P3-Lg; Mon, 14 Feb 2022 08:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271222.465573; Mon, 14 Feb 2022 08:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX1j-0004NE-IW; Mon, 14 Feb 2022 08:48:07 +0000
Received: by outflank-mailman (input) for mailman id 271222;
 Mon, 14 Feb 2022 08:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJX1i-0004N8-7g
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 08:48:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb177e7-8d72-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 09:48:00 +0100 (CET)
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
X-Inumbo-ID: ceb177e7-8d72-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644828484;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hXfZbY8I+9B/2jlQsMG7c9Q3i7+a9tTwWGvZ6NQJqLA=;
  b=Zin8Ld2BDTAOt6Zy6sq/t772/tLfoyUk/Ty+QH6yzLPYp9LUOqM1nmMZ
   GCjzhmuZBqhrjuOWeTXawnRLFXgg9dTOUlxyUt/oR9qhmyq1wcL3q/+Sl
   NcCY1/tQzpqnkKZWCNsB2p2wFgWOGEh91M3xeeLHdUiA/5VxvkVE4/KFH
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uoQxWw9EjeA9nFy8qmfA7bCWdddjnc9lvol8SNVTOsB1pTmByHhVj85fcIKXj5iUYYnzZ3bPMT
 jCJ7kQKmOVE/mcBYc5ZrfYYMIWN1Qeldf7lewyUmxNu647Zxu5P6RCppGhXY4AkyfuiTKIYJHj
 F3cP+s6Dlk849jVdzwXjEzfm97pdK2VtxXW0pyioaVQ4y68qTxkEjjPeHsFso4+3ReVjYXXew1
 A1LZZr+qoSL2t+OsiuO28+XM9ybSJX3QzGRn7CUmhpk70wn4HY5FTxe5ouY8yO2nlpUJRv/pQa
 Gb1eZvqPOln8AktZ4JxDZip7
X-SBRS: 5.1
X-MesageID: 64134855
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Qa268q+4i6/NNqvXpKY8DrUDjniTJUtcMsCJ2f8bNWPcYEJGY0x3z
 DcaWjvQP6mLN2LweN93YNvk/E8FvZ7Tz9FrHlE/+3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhel
 ohvtqSLSDx2N/CRu/tHXUliMC9XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgG5r2pATQJ4yY
 eIicCZEbjHAeCddJ2pHKZ5ixNW5oFLgJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKi9n+vnebJkTnMZJMJFLa4+/hph3We3mUWThYRUDOTiOOlh0uJfsNQI
 k0Z5AIjtaE3skesS7HVRRS4vXrCpR8aVNp4Gvc/rgqKz8L86QuDGnINSDIHbdU8rdI3XhQjz
 FrPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bpjXLQ9V4Gai5lOrcHz3q3
 iuKpygzgbYUpcMT3qD99lfC6xqurJXUSg8+5i3MQ3moqAh+YeaNfJe04FLW6fJBKoexTVSbu
 nUA3c+E44gmD4yJlSGLaPUAGveu/fntDdHHqQcxRd97rW3roiP9O9ALiN1jGKt3GulaJB3qW
 HTSglxYucJwIyGkPZVUbavkXqzG0pPcPdjiU/nVaP9HbZ5waBKL8UlSWKKA44z+uBNyyP9iY
 P93Ze7pVC9HUvo/kFJaUs9AiedD+8wo+Y/EqXkXJTyD2KHWWnOaQKxt3LCmPrFgt/PsTOk4H
 r9i2yq2J/d3DbeWjsr/q9d7wbU2wZ8TX86eliCvXrTfSjeK4Ul4YxMr/ZsvepZ+g4NenfrS8
 3e2VydwkQSj2SKXeVjXMik4MtsDuKqTSlphY0QR0auAgSB/Me5DEo9DH3fIQVXX3LM6lqMlJ
 xX0U86BHu5OWlz6F8c1NvHAQHhZXE3z32qmZnP9CBBmJsIIb1GZq7fMI1q0nAFTX3XfiCfLi
 +D5vu8tacFYHFoK4Qe/QK/H8m5dSlBDxLwsDxGVfrG+uizEqeBXFsA4tdduS+kkIhTf3DqKk
 QGQBBYTv+7WpIEpttLOgMi5Q02BSoOSx2JWQDvW66iYLy7f8jbxyINMSr/QLzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PxNwmvS4P05LV/U/ihy+LbbA0xeMwPV0H5WLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q78hIDpXqhwwnzkB5TabdUiKmsouSb9hsM1UxJ
 mPGjqT1mLkBlFHJdGA+FCaR0LMF14gOoh1D0HQLO0+NxojenvYy0RBcrWY3QwBSwkkV2u5/I
 DE2ZUh8JKHI9DZ0nslTGWurHlgZVhGe/0XwzXoPlXHYEBb0BjCccjVlNLbf5l0d/kJdYiNfr
 eORx2vSWDr3eN38g3kpUkl/pv2/FdF8+2UuQix88xhpy3XiXQfYvw==
IronPort-HdrOrdr: A9a23:/WjFbK7EebF6bjzPpAPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64134855"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGfiT0hy+C4I3lvv2oEJbyKSNquHRnG9t735RMAfMnHU3mEqwf5q7O3On3S0b+cqmlDChkhmLknWdJo1OVeMOMX6mL673Q3FnscNGMtveW+tE8PjxogCacW14z13H5cSigbcDv4xFwUKI1zb5AXwpca8PuXCIB/6EBwlEkMa/J1nD/h0wM/N6UAL2CKnUPVvqwrSc58iAbkAoKzh4x/vTXA2A+WfQ1ng6vR4jzw2PW+AbHuoynB7Huhwc8OlLm8jfsA20qE4weO6Bqwh0v35yTuO2tKbkWyW3vkBoeQg5Aq9TFK9oSmZ9VsGIvLxk+1Kzqrvn7ckp8KKcFrY5ptDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGCVuJ1wF5D/hUbD2805DTVSD6WhajzxFCZ9JVtj7pY=;
 b=EIj2foSZPOP6CmAUCtp9U3e3rAsQjLjLq74xPeONQJ0XMz6I49k78xl2XE4PNFTV7WwjRH6ilaiGHpApDODF479jgNYC8w1iPDB+Y81jQ+fHjzCVBu7D4g9hN0zLH8rVSC60UXf+mbLp6KVGzl/BJMpIOyP0I8z0vyTbjxeMDjypEMGrdRsV5YBge3WJY3Su7CANUgPmLeBEn/MbO67V/tPcWVhMmNTE1jbA1MjIVD2RctB/wixeIj+QwT88+ZfRnuBBk2uuRrJ71OH4Oj8r557JYyq6jBg6N2Qdc9hg3Ys1ryVHwzy3OnqM2HOBT0YoZkPe0PQrBmGkLV3Biz1S3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGCVuJ1wF5D/hUbD2805DTVSD6WhajzxFCZ9JVtj7pY=;
 b=BRXtPVN/8sHXbkUxF1MU9OW147GvLdmxWic7NXcA0xu72SH6Kjk0XSnP0BHT3R7kqc3yb0Jadv69vFedhnMwB8szkcB9zECCFeeG+QYV7JTdcbrN3b2dQkxzEW1c61deQ+tuqmc+Z5vN30wnBGtpIqv55R4SFMwAs870LuBfqrc=
Date: Mon, 14 Feb 2022 09:47:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgoXC8vJvsz4lwBM@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <1dbd0f54-affb-1e67-215c-6e6c8fb8535b@epam.com>
 <YgaEQrqIEPc258Fy@Air-de-Roger>
 <6905d6ab-e435-fb65-2e93-446644b69b82@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6905d6ab-e435-fb65-2e93-446644b69b82@epam.com>
X-ClientProxiedBy: MR2P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 858ff025-3c55-4768-61c5-08d9ef96983b
X-MS-TrafficTypeDiagnostic: DM4PR03MB6064:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB60643B5D587EFCEBCC3523408F339@DM4PR03MB6064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4xfKptPectNI5vZpHmBHLl/sY7XNZCqqOD+wLtsr/C1dg+kcVWqqzxAkR/c7rJA5iu8C7eCHkdGOP5P8zKPC8SjS1GgpGyHkWC+TTttxTmF8KaWOBo2fyEEiRMY38ihmqdcbLpnBmf/vdsqY/V5i6IZvU+p8mZZy7KciIc+3kbnw7gnZQqEOGKbqAU5zpS4DliWCfxUne3Pi2VmNYnRurjXs2ipyOoS+sRXdB1a4wzpe8yECzY5pQY3s354bxoYrBL4wBeWfKoRHDsBXJeR7TEdyLfV0jjyOSVUc+YyqmDAKmdZvW6cG8JJwDLhdxnV8zTfIUYwW7ZUwNMLELvPadEw+8Pdv77JtgvP+Gzcin8od4TvbqP1mCp+XGGH8QHqpmDT+YidwSRt3FEdlK2Y/48jqUw0hSPxaYmGhLz/4rVyJtG4DWHUTmBzyjTrMi16z9lG2Mb10Gq/vq6Dr98CVH/7H73oXTVZXxqNHFgsvTd3nghouqtOOw2tVEMyJeC5C3IogpgEeVhsza9t0yt7PqGO9owKXJ27UrAo8Ja1C/uPcI2eFnWjQoFbcIqjPX0G2DgbpZVCsS3JNFCCK9yXy1DdXoZETAaijdGMYA7L6TSjAtprZpNzo7agKkGaKHeQVradP7DnBxGehvj81ijdYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(66946007)(316002)(6916009)(54906003)(85182001)(4326008)(8676002)(66476007)(66556008)(2906002)(83380400001)(33716001)(7416002)(5660300002)(186003)(86362001)(26005)(8936002)(6506007)(53546011)(38100700002)(6666004)(6512007)(508600001)(9686003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2hVOXZoZm9ON0pESm1UTVB1ZFNJQTZzamoxdWRlZ1M0Q3VodGxKVXpSVUdG?=
 =?utf-8?B?WW9TYWl4R2FhTlY2bXNkY2VkbmxReEpCeXZ4ZVRqOG9KZ1YycGJsVkZFOUx3?=
 =?utf-8?B?Y0ZkVHkxSE5rVEltdHpjV3l2cllMRDV5NmNXMHRpUEs3L3FLdFRXNjg2VFNK?=
 =?utf-8?B?YmZrQWNsRGNmbW40OHR2cHF6a0tBbjVaa2ZQaHo5dDRZR2dwdFk3WUR6Yzc2?=
 =?utf-8?B?U2hBUjg3N1ZFT0tPT2NvT21YTkJ3aTdHYnZKdnFmSnN6ekttRFJPcWZXYmQ5?=
 =?utf-8?B?MGJZalVNRGxYQ0dlR1UrN1ZpNVkxVzZEVFU5bFEwdHJ3SUI3QmlSMVA5SGI2?=
 =?utf-8?B?L2pSZXVjRzFLWjBxQ2FnakQ1WWVBSllxdktleEN1OE0wY2NubXpOS3ZiZ0hX?=
 =?utf-8?B?NlJQQ1ZjWkM2eUdqcm8wQldxb1pDTCt1WGdISHdJTHJjLzRUWjZBU2EvRFZC?=
 =?utf-8?B?R3VFdDk1R2xUbzhySHE4Yi85WjlnNDkzUmI4RkN3WUphcURTVTRTUklCc2kv?=
 =?utf-8?B?bk1FY3JodUVQMHZYV0tyeUFQZnJoMkIzdDNqaldPOXJtNUZVNTVOVjROYU9y?=
 =?utf-8?B?UHVaR2F1SG5jYXJJeHhod2p6SDBSV3RvQkJJdm9pNDZWZlhnNmpZZkF4MnJo?=
 =?utf-8?B?OGwyYTR4b2NXeitGbGtIVVprUCt6Q1NnRW1NR1lqb2E5U0piRkdSVE41dHJ0?=
 =?utf-8?B?VnlkRndQd1BrWDM4aTgydk0rT3B1b0FXSi9WUVFLWkNEQTI4RWlsaUowcHBS?=
 =?utf-8?B?YXZwZ2xncUFocEJYbGZrcmkvMVFxRzlSbGZhQTdUQ05RSE1ObXBDYnVJUU9W?=
 =?utf-8?B?TEVLU3EyTUhBMmdXZ3ViajUzcUhGck1acGVZOUpoWVlVZVM2b2FaQUwvVGNr?=
 =?utf-8?B?dWRQK21UV0RubWFYRk0vcVdFWXRYY0FNSDB1N1h2ZG9HMDhxOUlISHFpVWVV?=
 =?utf-8?B?bmI4MkNZR0x5dzJVVlR4SVYraXBCRXhmYUFyc2M4elloSGsyQzZ5VkN2ZXhN?=
 =?utf-8?B?cmJmK1dGQzVkYWJKdUlQR2FGMlR4OXJibmZFZkNhTDVQQ2NCMnVDbk1iSmdR?=
 =?utf-8?B?OHlzeWFnN1J3VUg1SFR5SzE1UHJ6SkpLNGNrbU1uRmpYdE55ZVh3MkRueTFr?=
 =?utf-8?B?Y3U2S0NWZjFDMUc5Um5RaTlCb3NwQnJ4d25PY0d5aEJ3SW91VVN0VTc3eUo5?=
 =?utf-8?B?dmJOZ1lWN1FRby9PYnQvK0paSzZmMkduSGpyaWU5TFcrMEFjZDY3S3c4L3Fp?=
 =?utf-8?B?TTJ1MGkza3prdnQ0dHNGME9wK2EvY01rbGlsWloxY3ZCNWtQTlJQMjVPbE1L?=
 =?utf-8?B?Wk5jVGpNY3VIWVlXcUhnSGI4b3RNRjJ6T3NUSXBsVE4vZG1nTnpDdEx6R3Nk?=
 =?utf-8?B?Q3RjUjFUeU04bHRydEQ0dkl2OUd4RFlqMzg1dDdMZ1FaaXBYUTZMQjlFelZU?=
 =?utf-8?B?d0hRZjBXNjFydElnTDdZWDZzQVpKTitvcHYzbEJsd2J2VkhhaDBIc0NzS3FZ?=
 =?utf-8?B?bFJsdnBkMUZpR0NSbVN3OXBoUWhDQ1RmSFZSVThWZzhTbHIvRlVyeFIwUlZY?=
 =?utf-8?B?VVVZVnFTZGorUHJsaFhVMG9kaDN4S212ZlhhbzlyU0RaVE9sU3VsM0lZTWZr?=
 =?utf-8?B?Mi8yWFJKTHh5ZENJM2FVOTJOSWR3dkh0RVMyRm5WSWJtNUkzWUZYSlN3Sk9N?=
 =?utf-8?B?dXMrdGdOYVhrL2tnUzdoRkhQekozVmpTaDY3azdoWEwreU5oeEkyQlJPSzIw?=
 =?utf-8?B?ZGsvbGljby8rQzVkWW42K0pmL1BsdWF5VVdhbExXT1RGczNCUzlVZDQ1N3Nv?=
 =?utf-8?B?NG94VVNEMEYzWUdJR3ZtTnl2YjNvWjRqNmlCWlgxaWxhMSsyQ2VWRE9RU3FS?=
 =?utf-8?B?WHozdDcwK2FCcmNENTlrVFJkWUZMcmdhbVdqdzc2Y3NOYjgxVjluMG9qbEdC?=
 =?utf-8?B?T1dORldOTlVJRktyRW1EVmowOE0rR3UybkZSTEVBQkpnVy9ScFNHOTBTTWJF?=
 =?utf-8?B?d0Y4bnF2cWRDQ1hzajQ3c3VMaEo1SWlKb3NBQW9KYjVudU9ReUNQV09hdTZ1?=
 =?utf-8?B?RWk5UEdZbU14THkydWlRS0g1dlNnSjFpVnRYN0hRMTYxa040MDZlU1hObFBR?=
 =?utf-8?B?d0JPZXRDcTB5SFNtWlhPS2hycGxpMitBVGpaWDVJTjNHUm1qMjFNenhKdmp6?=
 =?utf-8?Q?PbnO1TjTCdYKy+TjCFDcFMs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 858ff025-3c55-4768-61c5-08d9ef96983b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 08:47:13.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wcBf8DmydeNrd1tKPyo5zXM7ilViCwE5715XyGeAi5oV0tzzIbeO7pLKU9uCmJjikfSCMnTBSlXRlMXWYkNNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 06:33:07AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 11.02.22 17:44, Roger Pau Monné wrote:
> > On Fri, Feb 11, 2022 at 12:13:38PM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 11.02.22 13:40, Roger Pau Monné wrote:
> >>> On Fri, Feb 11, 2022 at 07:27:39AM +0000, Oleksandr Andrushchenko wrote:
> >>>> Hi, Roger!
> >>>>
> >>>> On 10.02.22 18:16, Roger Pau Monné wrote:
> >>>>> On Wed, Feb 09, 2022 at 03:36:27PM +0200, Oleksandr Andrushchenko wrote:
> >>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>
> >>>>>> Introduce a per-domain read/write lock to check whether vpci is present,
> >>>>>> so we are sure there are no accesses to the contents of the vpci struct
> >>>>>> if not. This lock can be used (and in a few cases is used right away)
> >>>>>> so that vpci removal can be performed while holding the lock in write
> >>>>>> mode. Previously such removal could race with vpci_read for example.
> >>>>> Sadly there's still a race in the usage of pci_get_pdev_by_domain wrt
> >>>>> pci_remove_device, and likely when vPCI gets also used in
> >>>>> {de}assign_device I think.
> >>>> Yes, this is indeed an issue, but I was not trying to solve it in
> >>>> context of vPCI locking yet. I think we should discuss how do
> >>>> we approach pdev locking, so I can create a patch for that.
> >>>> that being said, I would like not to solve pdev in  this patch yet
> >>>>
> >>>> ...I do understand we do want to avoid that, but at the moment
> >>>> a single reliable way for making sure pdev is alive seems to
> >>>> be pcidevs_lock....
> >>> I think we will need to make pcidevs_lock a rwlock and take it in read
> >>> mode for pci_get_pdev_by_domain.
> >>>
> >>> We didn't have this scenario before where PCI emulation is done in the
> >>> hypervisor, and hence the locking around those data structures has not
> >>> been designed for those use-cases.
> >> Yes, I do understand that.
> >> I hope pcidevs lock move to rwlock can be done as a separate
> >> patch. While this is not done, do you think we can proceed with
> >> vPCI series and pcidevs locking re-work being done after?
> > Ideally we would like to sort out the locking once and for all. I
> > would like to be sure that what we introduce now doesn't turn out to
> > interact badly when we decide to look at the pcidevs locking issue.
> Ok, so I'll start converting pcidevs into rwlock then

Sorry, maybe I didn't express myself correctly, since the current
series doesn't lead to a functional implementation of vPCI for domUs I
would be fine with postponing the locking work, as long as the
currently introduced code doesn't make it any worse or extend the
locking scheme into new paths, but maybe that's not very helpful.

Thanks, Roger.

