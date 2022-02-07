Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81114AB949
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 12:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266737.460448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH250-0006AJ-36; Mon, 07 Feb 2022 11:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266737.460448; Mon, 07 Feb 2022 11:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH24z-00067l-Vo; Mon, 07 Feb 2022 11:21:09 +0000
Received: by outflank-mailman (input) for mailman id 266737;
 Mon, 07 Feb 2022 11:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH24y-0005g1-1N
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 11:21:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06083685-8808-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 12:21:00 +0100 (CET)
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
X-Inumbo-ID: 06083685-8808-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644232860;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vcsYA2v40DuaHoLQYHthAJyUBBIGwi3lVmjj7nEksm8=;
  b=SDZo2t2cnmsyL8TuvfsW2JJRSAg491cTGdrsQOUlBQ/u3j2a9JJtaXeM
   nwjc46LhzjKnq8wilxerj4WJwSVeD+4sorSasw2JzbenobWR/8fHbvok7
   938Uc/WU9nJxIy3uzH2agYr6RT5gc4LZnSpZXZhUV07eVb9/BSSvWbFZa
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qVouVBDJbFsDxREK6eTiWWkS5JI4RCLH+r9nZrnizGQWUcyjBgJ41mRhRYg5H/ERT7v/oQHC8u
 eXijRPEaCKCUWblAkuXM6nAYdykM7TgAH+sksChX7b4t0vVsc/3baPpM3BQ3JFAaD5s83CIejL
 WeK4DNdU3s5Sj5vfcGu+z6WSwTLIrPiWwjpicvlbiCVD/FkSbZw6BRUTSBQxfZ/W1D0paP8yPv
 DaUO+NQNdcnfdVpeZaRrZGFeMl3gwTB80gttXbXAfmnAuafOpJH+u3F9II63oP/D2l4tfk2hM5
 yDMyDSLmsX4/0Pj0a+B99q7Z
X-SBRS: 5.1
X-MesageID: 63093442
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ySfLy6+ugzauiatL6T5mDrUDUnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TcaCDqEa63fYmP2edwjYNnkoUNT7MCHmNFjGwNq/ng8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgo+
 vlu5ZWrDj0rYPLXsuZAekQHNDBXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh29h3ZwSR54yY
 eIAaxpAPRL7OCFFBVJJBbJ5uvahmEbWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCe2kj1MUsEXKe9ktxqnyPf9vlm+F0FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q238oif9LNoJu1mSwXuF1e5eKFfUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD7n5lnwv7G8ukpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZfTm04BAbGhPkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVBSe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:aVnRm6wrDVK3qNNYKL4jKrPxwOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8O3WBxB8bYYOCCggWVxe5ZnO3fKlHbak/DH41mpN
 hdmspFeaTN5DFB5K6QimnIcOrIqOP3jJxA7t2uqEuFIzsaDp2JuGxCe3um+wBNNUB7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HiVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW33RozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDAnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZ1B+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MEiFXtuYdk99R/BmcEa+L
 EENrCd2B8WSyLRU5nhhBgh/DT2NU5DXStvQSA5y7moOnZt7TJEJnAjtb0id0E7heAAoql/lp
 r525tT5cFzp7ctHNpA7cc6MLyK4z/2MGTx2Fz7GyWVKEhAAQOJl6LK
X-IronPort-AV: E=Sophos;i="5.88,349,1635220800"; 
   d="scan'208";a="63093442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2NVlwOP9FuScixiZ5Ra+iJbOoPiaCEfJQi4+4Ok+7/bcrqSj9FAzz/pFIJI1vUY9IPubXb36jRZpXgMldWOlINUCMHgJljYOkpMMQzqEJZsq+SfABJF5KvFWnybu1RN1NQbT4shiYicbm3NhWInlryEnDOIrjkiQnzglICeGFPuHF3srTYwdYWLfwLh5yS4AI0wyxe4ilxzEzHgIPRuWoF8Enm/q3Bg+L/tgpHnpa1dLxb8pJAtnuGOMSq7GtWH2joMO15R6xmsOk2Xw6RHMCHL7DuFoxETl8Y+uH5euh+HgrRc0e+oF5hZAD/zpUsoEAWpNyTGaDOGgtJhduX85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEeXKVbnTMbn+YEPq4f+m3PlgmzvcLxxiTX+clLn82I=;
 b=h8fih15CJ8aVLDURuvVCD2m+p2pQl0QjXkKmJE5xHbkiPxfvC0IAz39mqpK1rnl8jgZZeEaRjGcV+g9nD4cxioBu+P+YfkdKIeilGAcelXHNO4n1kZSf8iGHa3YPlX/7xsLihgXmpympTp1Zu6feBFJdSP5QjIdjY8vTaocIiHE64EfkwKx0Tq3cjVMN+LM4oFUANuiZDnE7vgeWyG+Ne9stppCl6Y0EX4xAr9QAsMUQruT+qquG+Faw1oghC4BtAJSYszEz5ly+n0jL1Sdhhm6tto89hvZV1i0WaUayFllGOG5xWx5Xjd7V67ZuG/ZfmxKl0d0RsBYcGu9X2fBQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEeXKVbnTMbn+YEPq4f+m3PlgmzvcLxxiTX+clLn82I=;
 b=QItI8m38KZdHLJ9ppJA5lvbRs0ziQTmU5PLPZScYV8rutFPcVY8r1le+iOfXWPY7Ke5Yq+5jI0tn9+Kln6cfvRqJwi1VYrFp9C7+9DJkCF5yfB2fdLDjdhOWDCQUluvQ6MesX31h7HpwrO8AfgslSvnF3DyZj5Gz9KeGNifd0uQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] dom0/pvh: fix processing softirqs during memory map population
Date: Mon,  7 Feb 2022 12:20:08 +0100
Message-ID: <20220207112008.51085-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 434b424c-43be-4748-b803-08d9ea2bd287
X-MS-TrafficTypeDiagnostic: CY4PR03MB2806:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB28067B911A36A310C567F4898F2C9@CY4PR03MB2806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBfF3EYAA/WAYfHV4de/RBWJWctZPmFpoEbnqErp6tc4SR/jNrBiIJtVzVhsGV/2CdKoE1u9cXie0V6jE6tWhCq3CJB8TzCIy/uYbrE9W1SNSMfUzzHElIJBBzpFanv2/VLwLcu3gRX9IXDHA1jLmFGWO6fI2QeRrkDtKObtbkuyfY3QA5aloupvIpJf21ofamcsE+74PpwtqQlUio/6f/kCFzDO9xbf368Yo+39OWEa+tqJ0lqoL3K2a6FyIkFb+cKrjN6ikz9oBx7dOr5JFB6jKV/NKzgstBWJgWkjY9BVhkZhSyhtfmVWtY6hBF39198cZYMjHVBNJSQkKCpWIb+Z8KmtFacIwcqXeJ9j4/Eq6AG8dr7Yi6VTvpdp6z2ql8whdhxUeAbXIiuxZRXO/C9ktBBlETZ8KjhWBD7GC2JI/WQbasa3o1XxX0+IXVoRhgiYbhjh0b8Jk5jiGenFjjRt2v+eXT5MxmdtcgPfMyXWrAlVEo2nhi4nn9zhC2j6YO355LL3A+iISVAlwWjTmwHk/qPH7yRza8lYCqDC5WmhuHN3NeU7RkDhjz78pV5vwWjMnYK+VUftlXOSp1WoC3cLn9/m8t4P6Z4TSZqh93lc9WSCsNjPLJ7YBcj3JOr9EWIfbm95KZIdHpObQfH5jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(1076003)(5660300002)(508600001)(54906003)(6916009)(6666004)(36756003)(6486002)(83380400001)(2616005)(38100700002)(82960400001)(186003)(6506007)(66476007)(316002)(66556008)(6512007)(26005)(86362001)(66946007)(8936002)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmUzSVJyd1dadG9ReFpxQmt6bnRPRUx5b1BTZW5HVG5JaXNlVzhEeTdpbng0?=
 =?utf-8?B?VW8xRHNYNllmNk9WRzZKYmRucDlQOHBCeit3Nm54TW1GNmh3RGQrcEJLVG8w?=
 =?utf-8?B?UmQ1RFpYeG9BTDdjMjN5eE9UUkxkeWgra1lGak1qZ1AzcHdvUHJhMDE5aVF0?=
 =?utf-8?B?SlVXVzdpQnpLY0VBaEJFdUdGRGFJaWVSYS9kZW5ISWNoRXdzSkhaRmdwWmVB?=
 =?utf-8?B?RTdOWlBCTUtlOVh1RkdsUzlHSU5EaTdOQ1c2RE9VaG93bFY2MU1tQVhjTlpZ?=
 =?utf-8?B?MnZQMjlrUlpMS3VGZDBHUVkxOXFpbmJucmV5T2RodkswSFREazR3RUFJTFdj?=
 =?utf-8?B?TjczN1lMOGlHQXI4MUQxZnd3UjJaQnVYN3hHSVVXL3lzN0RzdnlRa1BtWUUz?=
 =?utf-8?B?L0pWaitQcmgyT2RoMzJPMVJUeGtvZmJOa0k0cEJZejJpL0tFcy9qUEhvaC9n?=
 =?utf-8?B?c20wRXQ3Q09Cb3Z1UmhFWnBqWUxCeW1VMEdsL3Z1amYyeDBFRFNtL1JtL2s2?=
 =?utf-8?B?SXBacnZNVUdzTDBmRDg0OHlzNngvRFRZTHlQZVZzOFlkY1JMUXQ5SFljWnJB?=
 =?utf-8?B?UXBiMDRDZmZqdmVHem02N256aGk5Titoc0xxYzY2czVVTHVxUGJ4RG9ZLytS?=
 =?utf-8?B?ejNOYlgxY2NKNFhTRE9ZK012OTBkVjl4QXV5Z1VwVmFwVjB6OExWUjRkb2I4?=
 =?utf-8?B?ZytybWRyTGZDV0FrMHppaG1xdlpuWDNvVFlzTEZxUkJ0UWxHZnJvWlRrbjJS?=
 =?utf-8?B?S0pSODR0V2RmRitud3RpYkNuVEsydm4xMk03cSs2WXRVN3ErTkJNRGNHK2dS?=
 =?utf-8?B?SHhRNTJ6ZUNhOHNkeDJPMkF5b2RKSU5Dc0RtbXRJaGFaRERUTjl3anVwTHln?=
 =?utf-8?B?dWpPQTZscFVQSTFmT20wL2RnVzM4TlgyTm9RVGorVUhTTzNFMVBoZVVKREVZ?=
 =?utf-8?B?c0xhdFhOM2VWQTdpL3VUVFV4Ny95Q1Z2T2lkcUVUN3Y0QlM4OTBXU1UvQjBJ?=
 =?utf-8?B?SS91K2NvZ1RpanEzQ2xrTm13Sm1IN3l0bW5sSXh4RW1YUk9hM3FBc01lS0cx?=
 =?utf-8?B?UkVrelVpK20yUy8venNRamt4Qk02NmlGTm1lUmF6ODIzYmJsODdKRlZGUktm?=
 =?utf-8?B?Q0pHbGlPeERKVHZGbmFzcmg4U2o4UFdleWhwRVN2QzFsUFBDb1JOczBVeU4v?=
 =?utf-8?B?b1VMcUk0SGVCWGpkamtmN2Uzc2JZQmY2Wkk1Ykl3MjB5czdjWWc2ZnBOV2tQ?=
 =?utf-8?B?WGlOaGE2OWdFVmNvcERRdDFQY0FjZWthZUNFakF3K296L1FIeUdxMEw1WElF?=
 =?utf-8?B?Zkphb3JyU3R6eE5tWVVsY2MvM3BiQmk4cDhpVVJ3UTZ6QmRPcjQ0RkJFN1lC?=
 =?utf-8?B?bkhBNmMzbWw1ZFJpUzAxSHV6TzZiS1MzVnA5cFNyRFBrdHRZd0p0NlJrMWpp?=
 =?utf-8?B?Z3h6UndxYzN2TnM5ZW1sTjBpMDRRK21NaUhoL3BZWGZBYXRrbDFtbCtaZTRa?=
 =?utf-8?B?RVZyNnVSamk5SXhmQi9wOVhMQlNBNXQ2aWRjQmlBZjE1RnV6Yk14Nm5SR3ZT?=
 =?utf-8?B?YVU0R0g2NWdBMTVSNEc3YUJrbmczTXg5OGRzYXdIMkJWc1I0bzQ0Y3NialN3?=
 =?utf-8?B?Wmxrdm1rVVpNWVVieUhhZlh3eTFmYkJxcGVVYmdVd3M2ZGRNaGhDSGlWZ0g3?=
 =?utf-8?B?alMvenJWNFhETHQ2eDBaYkxBbmQwZXp4WVdjS2wrVVg5bFREdm0xQ1RjWFIv?=
 =?utf-8?B?TnVmb0ViTUU5RG1INGNvZURsOHVIWFpVQXJYalk3WTROdmlXa041L3VBbExx?=
 =?utf-8?B?ejJOdkJvZUd6cGIrM29BU01FOFJlSk9UVFV1U042WlZ3QnZPVklsM1VxSDlH?=
 =?utf-8?B?eWJpMmFaRlhRZjNuQm8yU3h3cVNNOHgxdXZTYUVXWjNoMjJvZFcyQVhPQzBS?=
 =?utf-8?B?S3g2TzhRa0pHTktrL0d1OTNraiszM0VOS3lKZnVmRXZ5VVMzeWZRRGlsOGRx?=
 =?utf-8?B?clFUNUZKcEtqcVViUmY0R3h5VFh6b1E0RzNWbFZtdmc3SDBoaEE1ajdjeEh5?=
 =?utf-8?B?Mmo2QzNsZythcElvZldhalhQZGZzbFB0MDlDbUI5YVlqK1VEM1o0NlZZV0Jq?=
 =?utf-8?B?czZBdmdrWUR4ZndENSsrOVd0WHJhbkVCbHJPRXRoZll3ODJZcm1nOS9OUHE3?=
 =?utf-8?Q?Jm5uqLQ5u48Wdi0A8+/r7fU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 434b424c-43be-4748-b803-08d9ea2bd287
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 11:20:19.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ggk1RzVaV0ZfO/rKqYeEqgQS+LEK025rX5sUoBTacST4tkGnwoYW9930Ad2t0ajWwgxPiiHP9WORi/VcTTgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2806
X-OriginatorOrg: citrix.com

Make sure softirqs are processed after every successful call to
guest_physmap_add_page. Even if only a single page is to be added,
it's unknown whether the p2m or the IOMMU will require splitting the
provided page into smaller ones, and thus in case of having to break
a 1G page into 4K entries the amount of time taken by a single of
those additions will be non-trivial. Stay on the safe side an check
for pending softirqs on ever successful loop iteration.

Fixes: 5427134eae ('x86: populate PVHv2 Dom0 physical memory map')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Unconditionally process softirqs after every successful loop
   iteration.
---
 xen/arch/x86/hvm/dom0_build.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 549ff8ec7c..cbc28113cb 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -114,10 +114,9 @@ static int __init pvh_populate_memory_range(struct domain *d,
         { .align = PFN_DOWN(MB(2)), .order = PAGE_ORDER_2M },
         { .align = PFN_DOWN(KB(4)), .order = PAGE_ORDER_4K },
     };
-    unsigned int max_order = MAX_ORDER, i = 0;
+    unsigned int max_order = MAX_ORDER;
     struct page_info *page;
     int rc;
-#define MAP_MAX_ITER 64
 
     while ( nr_pages != 0 )
     {
@@ -186,12 +185,16 @@ static int __init pvh_populate_memory_range(struct domain *d,
         start += 1UL << order;
         nr_pages -= 1UL << order;
         order_stats[order]++;
-        if ( (++i % MAP_MAX_ITER) == 0 )
-            process_pending_softirqs();
+        /*
+         * Process pending softirqs on every successful loop: it's unknown
+         * whether the p2m/IOMMU code will have split the page into multiple
+         * smaller entries, and thus the time consumed would be much higher
+         * than populating a single entry.
+         */
+        process_pending_softirqs();
     }
 
     return 0;
-#undef MAP_MAX_ITER
 }
 
 /* Steal RAM from the end of a memory region. */
-- 
2.34.1


