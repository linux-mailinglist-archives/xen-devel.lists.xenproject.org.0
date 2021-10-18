Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD44313BC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 11:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211886.369571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcP9Q-0007AQ-Pw; Mon, 18 Oct 2021 09:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211886.369571; Mon, 18 Oct 2021 09:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcP9Q-00078K-La; Mon, 18 Oct 2021 09:41:48 +0000
Received: by outflank-mailman (input) for mailman id 211886;
 Mon, 18 Oct 2021 09:41:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcP9O-00078E-Iv
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 09:41:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74501b88-ab30-46a9-b652-b0e9b601f1f1;
 Mon, 18 Oct 2021 09:41:44 +0000 (UTC)
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
X-Inumbo-ID: 74501b88-ab30-46a9-b652-b0e9b601f1f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634550104;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5dIdjntD35/oVvQOVr3TJRz7ZySMHMgxMmKLhHOS8Cc=;
  b=MPjeS5fIS1dfHDncITtc3EJ0l1Zffp68f/fef+c97PMo+ksJsXMmWD18
   KkCNbdV/M121BPqR4TpLdr3bGL4cvgpfSUgaRygZYB5vX+ReiMrpyjsH5
   f8OBVVcHxzVGs2VxxPvSuqOw/anVyL5BST/4YcODOJFP+OIrrdO6L4lkl
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kHVfKkEb1ZUi+73+VjPLVcCHXGTsasS4CdjncJfOaHjniNyH7wVM1ar7kN2fb8+FVclzQUoRug
 nuS1TaZcgg3xW0dW2dL/b/1SUoposGwXgi8lZyu/kU1+9x6PKiahGe/UzhuK26eMVUNEIJJjMX
 8HN4S6SwXXqBSTsJRHwjAMgQE9s8WIWlcHXcyxhdtLY4IiDOmH6ayEn5NLY/p6mNNgGYKWKfHY
 71tP5bkH4N6WikmsFdqf6lE2S2c4XH4STWXC6x3yo6NClutA3pe86kTNtJRhjW8Qh/zuUmDnJd
 fb9jIuegPqk2q1E/oBbAov6K
X-SBRS: 5.1
X-MesageID: 55816928
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0t+KSa/RpMPoEX/YGvraDrUDW3mTJUtcMsCJ2f8bNWPcYEJGY0x3m
 jMZXmrSafiIMTPyL4txb4mw90JUvseBndc1SgplqXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhvx
 oxM9oWRVDwqM5DOiv4TAyJ5Ln5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgWdp2JEUTZ4yY
 eIGRRFQYU6afyRRN3snIYBkw/WG2CHwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGCK5x9fQvtNKO431QOf0KSE2CekWVFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjtYXZNfAfucQdBFFFfu4Cy/+nfmzqWFo47eJNZmOEZDt0ZL
 9qilyM5m6kIxfAC06G27DgraBr9+8CXEGbZCujRN19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmoieBY0Y5xYJWW4C
 KM2he+3zMUCVJdNRfQvC79d9uxwlfSwfTgbfqG8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLaiO3aKrdNKcAliwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSOvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:MqvsMq0yvtjlGXC55CGlkAqjBSFyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdL3AYV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6ML6K41r2MFvx2VKpUCba/Z48SgbwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55816928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsLyKfc5uZHc2pcLt28c7G8iUufiyjhWYO17Din8xdRR6lIN9/vr0BV0hwdywL+5MSLVNnNuk4eIyc7+HGxwiH9dL69lQ2uf3GhMcenM7TiSYoQbcNNYK/BzA7m6kFBHnfSUzT6UHKnPvXG2pjB/Mwg1mn5hCv6oTeQCPiHrhpLIRhFC+I+ojHArMTzfdyCTvxxRzYGBPnHDTgM8H2XsxEIZ1P1EQKY39xnsEtrrZUiaaVtfSLw0fxBFFxq8fNflEtf8OhS3D0dJA60UFrLkbJlQFZKN8c2WA48bwAS/4tvqQt+SMpNRVxgl6SfKuJZWl+bsL9Q0gsWDU0OglkL2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EZ7TR51H6tjasY3n2u1K6w9xsMVySw6o5E290iSYYA=;
 b=TLEqjaSpWyNOOaQCQrt731dzWHX8Qk+TGLKdIOe2gSRYnfSJQ0Jw4CYsr0zLZWDHhUIOOxBYETms+s80+1YEmCGz5RRHtrdSPf6YNtQhKQoUw0tvNo80mj53tdfSqoXCwPQBiojeDwLBGpo7Ixku6ohaHakM606/Y7tmmKkyVFNV8F9skkz1mZhSWm2lA0BuYW28JWt2daiLIwibG4drxeN0nkKgi58bE+zTqHwN5d2A4KNz9k5sUTNKAS9hysFahwy9elFQknxSvDTQNWtnYdIO93SrG1T1dNuqGei7eWVuh4Zw6cYV/Y4Dde3ZA3/IvWdLDXghM8amtmIBzrNBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EZ7TR51H6tjasY3n2u1K6w9xsMVySw6o5E290iSYYA=;
 b=Xt1uErB+qMoVKjnnaV/D1XF5UoF0lco711dIkKeARJpBDeEsFS3HooqLs4uD9CM5Fet6+vfNhykwtiSeQPY0wVeGxCjV1J/pN0vLWq8h8krmF+m7KyjZO4rPMskCRXlMGUn/HRRc4S2WQhKg0LfywMrQk7dy4bqRzJIST+3Jo3w=
Date: Mon, 18 Oct 2021 11:41:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
Message-ID: <YW1BPPVNAVm6EPQp@MacBook-Air-de-Roger.local>
References: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287888d7-e1c8-4b3b-0c21-08d9921b71d7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4220EF3B7AEDD0C1678099AA8FBC9@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mmk3WRFkBkmqxDBVyGToq7nP0TxIKkDTmagW4hYDNprq+48KxoL9EwfDTXuIMyBjdIjuaBEssRqTUN0p94gsSSCEbESxE9CXtIvQW/aloJGWEuCustp6GW01CJ7O0PLnKgdd0gJl0zsqKUwBqgWEeV8lFNWGwNOkfuygIXQfIhcImRwnXarTjVdPSgJay9jTJsvF4zgnO6UWq44MV+5QQwLlcilQloTfcE/kfhBRRp8iLjonqCVrEdSixMi8mpPITO1XOwHrW4V7B4bIDv6/eGgc069wpv1qT1S0KuI1+HXLoud/vpDOj4tmopBjAvBonI3Iq8PRoTmi007Uo0Tz9weaHmvVvZyVSCjux1Y4SoftDhNzFwcKXYeHn5wcBfG7mAj0R+GdSkW97GzQIpeyzo458S9hFpQ1PGagTZct7KssddWgJMcYpEtWPkFUWKYV0Kx2k6kdBqsNWCUXkXXIgGYc2OtEubjPDJ9HfYbrmEyyzt4F7FBCjpvd7HATm8yXxJhjTMO/EOW+XgMyDNMyyCFaz0L2dfIUlow3rBKOOwB6uyJlpWqw1822rl+cp2Of+Opjqyf6lvL/KdaEHAbLT3C/0cjjF6vMrg6dwVXBlD+W5XCLw2BgdUc5AQU2ziPvocxRz6W4UvhPI3sWpL6iwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(86362001)(66946007)(6496006)(66476007)(6666004)(85182001)(186003)(83380400001)(66556008)(508600001)(6486002)(6916009)(956004)(316002)(8936002)(9686003)(82960400001)(26005)(5660300002)(4326008)(8676002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUlUT3h6UUhza2lYdmNlUEQxcUV3c1kwc0d3WXNpQlpvblM0TWdGNFlnS3M1?=
 =?utf-8?B?M2JrMW9mMkdDYVkzY01BcFRteHE4YjQxMFg4MWFTc3V4NXZaRWhFR2FjTExm?=
 =?utf-8?B?NlJMOWtrak8ycXIvZDBDYjdRMG5HOHc5YWZxREY1bHBvTVNFa3VNOHBlTHB5?=
 =?utf-8?B?NUdFUUF4R3FLMTNUUVg4WWVBZlpFc2JkYzBrUG1HYWdoOW9vR3huaDNVUlhU?=
 =?utf-8?B?biszNU1qYlhYVUZBZ2tmNzZqSTh5Qk5uQ3JLM25pMFlSdFlhYWhUK0QwYytn?=
 =?utf-8?B?Mnl4bVNUL3Roem5UdnVoVDJ3QndOd3NaWHExbFZJNGUrclZoRjVsNVpjdlRv?=
 =?utf-8?B?aEtEanZST3BYZW8ySWJPSUJOUmtrUUhPNDA4L2Jxa0ZwdVpLTkxlZGROQ004?=
 =?utf-8?B?WkNvOWtnakp1OEVlenk2V3B1cE5WZGN4S2F0NncyeXgrV2JrS0tJWHkwcVVu?=
 =?utf-8?B?aEJrb2taMGN5RVF6bGI2cXZ1OHpaeDFsOFIyN0ZVMFpId0tJaVg0NkZVRUhM?=
 =?utf-8?B?bElCeTB1UE4zZHpWVXE0MnZoRGVaQmt4OUo3dXNXWUVPVGk5dkJTM0Z1bFRh?=
 =?utf-8?B?ZkkycGZzUEpZSXZKWXRQVnIzc1AzZlQ3VEFXaWV0QjljS2RhWDFUcDdUL0JI?=
 =?utf-8?B?ek40NVp4N1RDNmtwdE10WG9CUmk3c0dRQlNkOWMvSzNDUFU5TUVReW1SR2pX?=
 =?utf-8?B?S3JPOVR5Y1Fqc3BSWFk5L0x4YlpnazhGMlF3YlQwalZzVVNhTE84TllKbEFw?=
 =?utf-8?B?YXhycmRCL0M3K3FmTTRjWEIwKzcrZVhCQlVtMXBMK1oySzNUWkFIZy94N01w?=
 =?utf-8?B?U2FNajJxWVQvS1EvcmQ4aUwwNytBYzhJNlZMbktwaGJUQ29aOUVtaytqUjAr?=
 =?utf-8?B?VFNqUmxWNEFidnB2dTJnbzJWb3ZVWlBYQ2JKaS9VY21tcncxRndGVWFKbjNY?=
 =?utf-8?B?Z1F6QnJSeWlKNk1PNjVYQWI2dW1CUURwaisxQndCM3RMVFIvZTdJdVFLK0xx?=
 =?utf-8?B?MjRybGlzMEU0L3UzQk81bmNHS3pYZ2ZsZVhnSVNtUWxxdWROZGlWaDJuU3dJ?=
 =?utf-8?B?N0hNWDI4cm0xSlhBUDdLNVlwY0hXU01uZW9HdWgrZ01XTEwyWVVob1ExWVI5?=
 =?utf-8?B?WTlyRHRudmhBV2RpVnlXQzhxQUlhcW1RSUcvcmRNMnRmRkJpT1BrZHVoN0xN?=
 =?utf-8?B?R1BVbkpvNVhsKzhIblRtNWpHVHB2NFRvdHRncmpxVkVtMi85QXhWbzFHT1RJ?=
 =?utf-8?B?cnZBZ2Nid1E2eGxpcE8xTXJNUFpBM0VuakNoa1M1eW9BR1BQSmF0U2VKRjhq?=
 =?utf-8?B?TXkrOWQ2ZTA5Z0g1c2laT3NjSjBBUFMxbVR4ZnllV2lDMDA1cEtrbSsvWjFj?=
 =?utf-8?B?cHJIYUN2SWhSUDA3VFRsaFBjSDhyY0tGZ3FQODJjNUt0U2d3anVPemFOYVFr?=
 =?utf-8?B?eGw1ZXE3dzJmVEUvUWNSdmpzVmFXWDY1ZlQ0REFYSmxRV1A5RnkwSTBPR0sx?=
 =?utf-8?B?UTE2TzNCSTk2NWRvZ1NOL1NtK3VqMlhJS3VKc0ZnS2s1cUZDVXgwcGVFcE1t?=
 =?utf-8?B?VGtnQ256UEZtdlQ5d3RLZVN1VmtKOGJMNXlJN05PN084TDJhOUlWdUZCMlhI?=
 =?utf-8?B?b2xJdDRKeWZ3U0dRNisrdU5oalNWZzlhNFNJNGJ3a1Erd2Qvc1pBRHc0cEkz?=
 =?utf-8?B?bnl3OEI3bHM5WlpINUNSWmF6Tm9ZUFhOOVRsRExPbUptUHR5ZnNrTlpJMmJN?=
 =?utf-8?Q?unwl1tnToNddB90XlNSPp44c9Fdqr7URN6buoOW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 287888d7-e1c8-4b3b-0c21-08d9921b71d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 09:41:22.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7NKBsut0EvfOIvNN8jpq8XgPsaf7bcNZCgUh3FHPKx+4WVpqNPUDyqh29Tgs37hw9sJLJS8Onzk6Xx3w7KIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

On Mon, Jun 28, 2021 at 01:48:53PM +0200, Jan Beulich wrote:
> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
> address range") documentation correctly stated that the range was
> completely fixed. For Fam17 and newer, it lives at the top of physical
> address space, though.
> 
> To correctly determine the top of physical address space, we need to
> account for their physical address reduction, hence the calculation of
> paddr_bits also gets adjusted.
> 
> While for paddr_bits < 40 the HT range is completely hidden, there's no
> need to suppress the range insertion in that case: It'll just have no
> real meaning.
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Move adjustment last, to leave hap_paddr_bits unaffected. Add
>     comment.
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -349,16 +349,23 @@ void __init early_cpu_init(void)
>  
>  	eax = cpuid_eax(0x80000000);
>  	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
> +		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>  		eax = cpuid_eax(0x80000008);
> +
>  		paddr_bits = eax & 0xff;
>  		if (paddr_bits > PADDR_BITS)
>  			paddr_bits = PADDR_BITS;
> +
>  		vaddr_bits = (eax >> 8) & 0xff;
>  		if (vaddr_bits > VADDR_BITS)
>  			vaddr_bits = VADDR_BITS;
> +
>  		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
>  		if (hap_paddr_bits > PADDR_BITS)
>  			hap_paddr_bits = PADDR_BITS;
> +
> +		/* Account for SME's physical address space reduction. */
> +		paddr_bits -= (ebx >> 6) & 0x3f;

Does it make sense to check for 0x8000001f[eax] bit 0 in order to
assert that there's support for SME, or assuming that the reduction is
!= 0 in the other cpuid leaf is enough.

It's possible for firmware vendors to disable advertising the SME
support bit and leave the physical address space reduction one in
place?

Thanks, Roger.

