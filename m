Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74A4313E5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 11:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211906.369593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPOP-0000vT-Eb; Mon, 18 Oct 2021 09:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211906.369593; Mon, 18 Oct 2021 09:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPOP-0000tg-B9; Mon, 18 Oct 2021 09:57:17 +0000
Received: by outflank-mailman (input) for mailman id 211906;
 Mon, 18 Oct 2021 09:57:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcPON-0000ta-MG
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 09:57:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c35e8eca-78a6-49b5-84bb-42b4871dc8bf;
 Mon, 18 Oct 2021 09:57:14 +0000 (UTC)
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
X-Inumbo-ID: c35e8eca-78a6-49b5-84bb-42b4871dc8bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634551034;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RyGWxTBKD6WbOF06ONlYDNVyQKN75oBvoq99yMcM8ic=;
  b=VaTp7G7CAj/9FiEOHU8jcHviUIBJjCJS0qJlDtvG7RVrXDUP7GMkcv1N
   UiTiWFikV+IMxd1IrPEuAhI445Uu2ifM1r4kvASy9RcA86TEwlcdVtwLY
   qGPQ8v7phvUiXoTVMlZSnV+gAI0xEhlrMUnai2dJ7F8pm9S9OjElnqEJo
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QadjKeR8QctnvhYlTxOQ48Pt4S3gbcT32FHgAf3RQxU9ehK0y+OLiCC5bzXHySOSp9ufVmqskB
 SO0mTIKffEkt/igYuru5dqjv+ULzFJl/Vqtrb3PMy96Tb64BFXVbKOZMd434/Kziu1kVgeq4Pd
 peHK3iTdkpNj3mjhjCFYlN0XRV1rCKwcAxleQ+cmkpcYHCTK86liRrBxcekumAwLsMfk0Sob3L
 E2oYT5BHGO8Yxm8YTfaIgAaF2hRWy0G/VFp0u9UTIjb6mfpwSxPtiwVYfy1cMENyDFSxZm2zCd
 nd1mfOU+i9wS1QR47ndRaP8a
X-SBRS: 5.1
X-MesageID: 57309191
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6BndV642AffdRgya3BaCrQxRtMzAchMFZxGqfqrLsTDasY5as4F+v
 mUaDz2PO6uOZWbwfNh1bYjlp0MA68LXmoIyHgVrrC5nHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 /JN9pqoF18VYpLOnKM2U156KRwjFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWhr3pEXTK+2i
 8wxaGQ/SimfXjx0HwlJNIAXnra3o0ijbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m7C/
 DKaoTWnW0tHHMWGjzGC9xqEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixCU8EDThZNoQa6PA0QXsB1
 hirpe60LGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1U2XEI4yeEKhppisQ2uom
 mHVxMQrr+xL1ZZj6kmtwbzQb9tATLDyRQkp+h6fYGuh6g5oDGJOT931sQaFhRqswYDwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOv4jxpiGGaE6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyf2PPImOd7tUZVCIU3c+TLNDKG8gj1mOcAZSeN61Hs2OR74M57FwSDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/LbLafVc6RTh8Upc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEYT5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:U0pN7a/blHLCAkI20N1uk+FJdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLX3OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mLryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idnrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amJazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCc2B9vSyLZU5nlhBgr/DT1NU5DWituA3Jy9PB96gIm30yQlCAjtYsidnRpzuN1d3AL3Z
 WDDkzE/Is+OvP+VpgNdtvpd/HHfFAlcSi8Q156Hm6XYZ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="57309191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJXYYPkjoP0H6xz8ECCxl6nCCMwrdSc4lVa8hQckTIFdETS87o9KHsYDBWxjV3jAccCvcRacZ4NR3qI99KhfC0yT3M9oGe1naxIFAOjtxfUnGokjV8ilP6GCLN/P7eYDSqZipcMVLvitVoOTq/T6q/8no8ODZgyc2uvy2SAgHHDrRNMZJfe0QWoLkRRLwFKM7EF8szyq0MPB6cu0Q3iXoJSZkyg35jKC2Mmu38OqNTcBWxhpc3YhjIZ6GE4E99oO3jHdZPHXDjd3yimQl/lalrPwkIs6NL0taQdYbKQasWSybGTOm1Wo117h6hZsjEEZ5qrozqit+2UzQnAT0P7okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUVuanLCYp2tf5S/pIWOPGQfpt/h7oPdd3wxBKvEsBY=;
 b=FUN08g16UwD+LHi4Zf2B23LHOcuJPb8hNT45UdWps1ianfdwa29FPFCCw/B0ToAbZ+97U4njIIurBodC8nVpCsJpHSP1kPrwiBXi8dtjna1g56mSO5PtQqHRbmTgIpWCaE7Lx217JtpJozSNK+vih+pCBLLOVw1C9JRwarmuOi6eUW2qL3WcQV2jJf6CihsC+2T2+xJDz1PEKHYyricfpbmGI8xwPwfxB8mYdYqqwgtrFo0cdF09uSDpR9BD4r04l9IWpwbcozPr4jHGkh+JrFTYJ9IPLcx8CiKZXhMbfa3JSBec7cxb/IKUk4HttX5kmVuEsl4JGC02P5zwlJq/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUVuanLCYp2tf5S/pIWOPGQfpt/h7oPdd3wxBKvEsBY=;
 b=FY4pp4cpou2t7zNPBILvq+xDDsV6G6uToz0YcixM/auh8CXnTymZSleiaOe4v66a0IQFbqwmTCCPcV7Yp6fZOiXiui0l99ITunn0ggymQuKMXzwqfVsNKCdAUN2ImiIrM2jsOMo1WFnl4I+e9zJJAyaY+O0dtVNVmkFS5pAAuWc=
Date: Mon, 18 Oct 2021 11:56:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Rroach
	<2284696125@qq.com>
Subject: Re: [PATCH] x86/PV: address odd UB in I/O emulation
Message-ID: <YW1E36QjW3YllTwz@MacBook-Air-de-Roger.local>
References: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625670ab-ba9a-428b-1fbe-08d9921d9bc2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB33692CFE6DFF67E2752E79168FBC9@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Da8rqofTuOFXlZXiQpsEXO4qWpjbCVj8F3JSEOnwWPHmnUbypbKaAafzsUg81KxjAgussKxj0qejiAWC9H74qBRJVYf4ukte6efFNedLBqenVOUGZ9LT7mzZI/flfX5POh/oUvSvRvatxV5SVIfqxdKAnzALAeoO0vKWbYaDbflp4ZYzusEcszYZOl2k3xuNAjtfNosrPgGQthw6cLyl0kyNorYWDGJAgrSS+vRf+CAfWFkx7MRy2T1MNjDhvsClsqJLLV1uN60qwSd2nv+FI5kEuPunxdCYsmplbHghPAsxa+V1zgcpHbLzCcT4X9dkq2QVkkRINKFAJCCvvlMv1/Bx4isBapZ/X1YeUPa/X4N3Em4lXbVFGk7dXNyCv7zMwzJJNrRKz3WL530sX/F+xr+PUrRQc8N8X9w/DT4KyqRMk/h9SM7IGGHI0cRZMWF4UUZ1X6QA1X54USr5zCleZNNYQLrIxbnDDvcCOlXt6pMNNj7s1jiPJ4Vek3voSb/lYANFzYV72QufsGDEqfe7DFqrQ73HTjYTyJsekvYnrTWVg1KHDZvXjn/jGDoDQhg5r5ah0UG/8UgkMJpmI7gGQ1S641cnMv+hISF94wd7IiC9oS5yWZEoK6RnvASb8z+BETjSKDTxfLp1Q1wmCK6nKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(316002)(2906002)(38100700002)(66556008)(186003)(956004)(6486002)(6666004)(4326008)(508600001)(86362001)(26005)(66946007)(5660300002)(6916009)(6496006)(82960400001)(83380400001)(9686003)(8936002)(8676002)(66476007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dKQnFvZDRVaGtHZENGMTR5SnR4ZVBpeFZ6cUNZcEVZdG44NVR3S1lUNmNQ?=
 =?utf-8?B?U09IbkJXcXNKSEVqRjIzVURFRUYwZG90UC94NzM2SXJQTDQ0dkdiVEZ2N2Fs?=
 =?utf-8?B?amdQNGVMTVFkSWY2eHZ0aDJOQllwRE9WWW94THFKcmk2S1dZaTJ5WmNBQmQr?=
 =?utf-8?B?b3FpeHZSYkFVTnBLWUtsUzFNanVJenpnNFM4WFkxeHVpbG9XdS9Ha2pua1BM?=
 =?utf-8?B?TWcrcnBiRUdTQ2hHZ0owVHJqaEhsSTF2bUsybXpZRm11ZW9ObDI4UDkwSFds?=
 =?utf-8?B?aUsrVWlON2F2WU10TkFFWTRTUFhVQUhRdUplTW1aQ0Z4d1UweU5mTW4vQWlI?=
 =?utf-8?B?Q1JQaXpsci82N3BEb25MUUFJazNDUE1qbmVKa3E4L2JhaGh4R2hJOWtOUWlE?=
 =?utf-8?B?REs4L1FDV0d5YnFSWkkwRHBIMHZTaTBIcTlaRDk1dHhlRTFUK1dXRGQ0Y1Jo?=
 =?utf-8?B?V25qNzBUbTBROHpHa1RKSSszTkhlZCtreTFqTUtpRkhIaHptK2pOTDBQRzFZ?=
 =?utf-8?B?QXg4d3J0Tys2LzhyYS8zTXlvajg1c0hBOExSamJXUEN0N3hpazlGWWtGb3pI?=
 =?utf-8?B?QU8vckVpTkx4Q1JCYmxwNDQ5KzBHdEhBSGJBbkpGdVFRVVY2aklCaTJrMG5h?=
 =?utf-8?B?cWJkK1dzSXYzSUVDdHlRWCtsYlNROWFNaHdGR0RZK2R2d1pQWGFIRjhScGVm?=
 =?utf-8?B?NHpMYmM5VGtkcjh1Q25iZ0RjSk84RnByc2M3OUpDSnhMOS9FdWNnNnVkQm9H?=
 =?utf-8?B?N3podXQvL3c2cm9IcXNNOHgvRGNLWUIwdzlndWNXa3dLZzMySVlmRWYxTUdC?=
 =?utf-8?B?S1V2SkJqR2liTEc3OXdUb040UFFrWVpMYTJKSG5jcXFsTEo0eEMzUkw4cC9u?=
 =?utf-8?B?bXRCMzFIZCsvazlnMmF3dklrTnJ5MEEzUlFGc0hxVW9zd0pKSk9TbTZrNmxz?=
 =?utf-8?B?ek1vakF0L1BVVU45VHpiVzViZE96LzZZTTJMaG9nUk12aFBpN2p3ZE5naStx?=
 =?utf-8?B?QjMyRXBNQUZuSWE4MXVoK3JhbWFjUWtNeWdKSWF4NDExSHkzUDM0U2p1S2dt?=
 =?utf-8?B?bjdVQjlqNElzMVRScUV1Z1QwckNQT0x2Y0dXYjlBelo2SnMyY3NLMTdPc3pn?=
 =?utf-8?B?V2ljZTVzL3VzSU1pZmxXSFJ1MG9yb0w2WXdLTVVNdnlLNGdpYUFTbEl5QzRR?=
 =?utf-8?B?Rk1ZQnhwVVlUWjdTaUlOTUlhVXc3d29QTkF3bjUwSnlieGZoWUUvVHlPakpz?=
 =?utf-8?B?WEM1ZXNiUStBK3pRcDBvVjBkb3ptZDlQU2tINWlPdFNaT3BVUXg0TXY1ekVM?=
 =?utf-8?B?WHBTOThhSm1ISEZ6bkJxRjhUQVZ3d3kxS3BkU055UkxHMXNKYkxqU0tSUHR2?=
 =?utf-8?B?SmdzRWhOb0tiSklJaTRsVHNnZGdRVU5rWFd3THp5aEtkcDNGWDRsNi8xeTVE?=
 =?utf-8?B?MXNLVFN4Ukg2MFo5bXVDVkFlWnNkalBvdGQ5WThWMCtZa1lvaHRvRG5TV2Vk?=
 =?utf-8?B?ZWlkZWxDTXpyckVYTjN4Y3NjL0QrUnVMcjhKRmQwdzUxOCt5NkR2aGF4b1NS?=
 =?utf-8?B?eTZzam1GdDdZZVp1V3F1THZ3NEI0Q24rQml3RWRyc25mOURna29zWjFGTklu?=
 =?utf-8?B?Z1Y5eXk5VXJzZW9sVDZvTU16ZUh2alNJM1hHbFZsU1Y3Skh3c1dHd2ZHNlRk?=
 =?utf-8?B?M2tBQ3pFc1hENldRZTdHVG9aaU16b2l2dWhVZDF5ZS9oVU11UEo1VTJuSUpi?=
 =?utf-8?Q?04TUx7qiQrTCW1tXAADZNnuHP1jD1kLFWHUkY+9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 625670ab-ba9a-428b-1fbe-08d9921d9bc2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 09:56:51.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TadtwWPmSkyboh9n++WW31beRlxPDCZA8Nk9Y5W6qtH4BSYk+J5coV6S77f9Qe03rGqXZhGBcAy/WiuhIEGx0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Thu, Jul 08, 2021 at 09:21:26AM +0200, Jan Beulich wrote:
> Compilers are certainly right in detecting UB here, given that fully
> parenthesized (to express precedence) the original offending expression
> was (((stub_va + p) - ctxt->io_emul_stub) + 5), which in fact exhibits
> two overflows in pointer calculations. We really want to calculate
> (p - ctxt->io_emul_stub) first, which is guaranteed to not overflow.
> 
> The issue was observed with clang 9 on 4.13.
> 
> The oddities are
> - the issue was detected on APPEND_CALL(save_guest_gprs), despite the
>   earlier similar APPEND_CALL(load_guest_gprs),
> - merely casting the original offending expression to long was reported
>   to also help.
> 
> While at it also avoid converting guaranteed (with our current address
> space layout) negative values to unsigned long (which has implementation
> defined behavior): Have stub_va be of pointer type. And since it's on an
> immediately adjacent line, also constify this_stubs.
> 
> Fixes: d89e5e65f305 ("x86/ioemul: Rewrite stub generation to be shadow stack compatible")
> Reported-by: Franklin Shen <2284696125@qq.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

