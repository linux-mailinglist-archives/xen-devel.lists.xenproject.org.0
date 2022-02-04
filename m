Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23A4A96BA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265275.458604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFutO-0000hU-DN; Fri, 04 Feb 2022 09:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265275.458604; Fri, 04 Feb 2022 09:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFutO-0000ff-AI; Fri, 04 Feb 2022 09:28:34 +0000
Received: by outflank-mailman (input) for mailman id 265275;
 Fri, 04 Feb 2022 09:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFutM-0000fZ-Nh
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:28:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d013d4c3-859c-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:28:31 +0100 (CET)
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
X-Inumbo-ID: d013d4c3-859c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643966911;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vDdyOYa9Qj225AnF27MFlYtyRvz7zGXvCLnLngp6hsE=;
  b=F3eKJ9vesURB6DYMlhcdJ4Tn7+9woaS0cuJZtqtz69QzMmI/zwYvSZBh
   Q9qpzjtPBroOtv3rNa9Y41O/IT5cc63VL5843MZoyR5zvv2agFU1D3iRE
   i7tQ2cpUVKd6PviJgC5H7Z3FusWbflxSBZFsIOqDrxSBS3qo41H5Qj/i+
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PAhuP5CsnwTIDnGTQTeSxpuNSgEfDDF8w5nQac6yFIQOFAePuVR9MsorENGjePTzDnipnhUQKs
 m063YrXle5Se+ENFjhsSrtKH0NdLIb0bFq4wesVzaNEmuFIzt1m8PpLeYDuqtiVKYkQlR20/8i
 O0hwjU/rM2MutPx0OwCEJQBNNU0tRm960xvfaSv5ZveKOYqOT/BPfW8uBwYvfseRHcpEXrFBEz
 BrXxERUkKP7UNuNw4jm30hpdIa7WNU6cGoe5QBU9h+bnzY7LxH5Ae4mlsFeYTKtelQRwDVnoor
 xFx2tdGkT8WcV4jCfibXXWJs
X-SBRS: 5.2
X-MesageID: 63487644
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Minqja8/jgEqHFrAGSqQDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 jAcXmGOPKyCN2X1ftByPY6wpBgHuZOGzt5lTFFk/ik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPha2
 IUT66GJdj4mfYbtqfoBDyFBCDFXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2tg2Z4SQZ4yY
 eI9cQFlSDjOWycUP2pOArkHnuCFt0vGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFWU7kBCZuNvKuJ5wyC81LaI2x+CFkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodt3xor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtALvW8jdRw2aa7onAMFh
 meJ4mu9A7cIZBOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qt9OdA1acCRgWPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:2YGIB6pX5/tatIy7f9LQZWAaV5oXeYIsimQD101hICG9Ffbo8/
 xG/c5rsCMc5wxhO03I9ergBEDiex3hHPxOkO4s1N6ZNWGN1VdARLsSi7cKqAeQeREWmNQ86U
 5ISdkGNDWuZmIQsS+B2maF+nwbsaG6GduT6dvj8w==
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63487644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0B3UTgynD6bfrH+9ilAUJyEUm5AvAE6qVAsCS7/brcPraIjzIyPb3fnpncI/xjcE5z0M4cabh5DNv76jb7VNCfwW1otntm3kQ6nzwk9Wm1yAKifX+KAFZjbZRuDEP03Eq1m0GtlSBOrDWtuYB3qM1RZk3qCsw3ZN5gY0J1bRXOvkEhKF+65ZCU1iyxeC2lKPwKqv3MEdDqxlekuJZZQFLrI3oEvBhRXye8mmXhdcOcyAS5st/n7DD4aLfwtMfImXtczOzOKgsCeAkIAUvFl7oEiTPNcU5dI5fusj0LSdlyYMjimf9FYz7qsYdZFzrY+CYHjN7zvZ9qr7XvPjun7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt4df4tSvvF/CDg5OmvKefIUNSyCVVQSGpX8Y+Tig94=;
 b=n1mB9eS9Y9LueLGixEk0auu22OnRykVbdNx7c5Hy0zFizCz538H/T7K0FDhozdJdK49LahnkD+2C5s9BprSyRNdA10CJK7HmmbkeNh6ovsTtzXO+vWOrZ5R2m6D0mMHZbEjj9sxeDfwzUDFshz/tBZkqbr7iu3ed9sSsH3+/m1qtLnnerOgNvSaXKjmSSSZ329JqSanSLJepfyNGD80JXFVns+COeWUp8GrjjS7cxoJSTtC2+nQDU+shgL6s5D9ealHTAMHAlckHnBhhYS86tmdeRnwX/O+OZpSmhVxPQPaOJzb4X3mB9Jzh2cuRI9xcWEbWzrydZ4eGMHWZp7GISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt4df4tSvvF/CDg5OmvKefIUNSyCVVQSGpX8Y+Tig94=;
 b=BHqREh1ggXnAkc3hMqJz1xl6Bl9u8YswroW6FjtMnttQ0v00tOnB48RHnAOCfdqfdz4XOo7zPFx44o1yGn2Ei+JSMwgAjHtQKWIOJrFdPUd6Y84mMT8cdeHraVOjf73F5Ni1CoiTdS49r5Yuz0eH2b/6RfKN9hFox+vDW7++f9A=
Date: Fri, 4 Feb 2022 10:28:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
Message-ID: <YfzxsLefGoTD5bvN@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
 <Yfqf5jiO0cHjR6gR@Air-de-Roger>
 <4a325d1e-85e0-09ea-e2ab-f0aae123d4c9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a325d1e-85e0-09ea-e2ab-f0aae123d4c9@suse.com>
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8359d7db-7b11-4b7e-24e0-08d9e7c0af26
X-MS-TrafficTypeDiagnostic: MWHPR03MB2959:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2959C4886F1DDE9E3F3F46488F299@MWHPR03MB2959.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:174;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lw65PfiofQX/DgxKpPFar5Uzfb2SC2ApXrhYQlmJ7Qugf7kDwDMK7fEZQ/hQoNviC4GHHEPGGsHVqPj/BXZ3HcKhe4O5ShN1n2w2MjJ0DqyMUjQeJpHk1tE9vOPACc1T/ALIBk7rkpAdPruflkHuiBWF2ulLM4+o4TKDanEw4duGpk1w2t80LjBAF17U5uRDjdffTi7ymE5GUEn/2JxMrdKhma8+zRDBLdjptJuViijvTBbm7DT3OreAFYe+dK+l3ruYNS6jh1yDNPKXlNHqYAnqtzfB0Gs1yoIYqMgegKQJ5+6o9yrN0Z0PRD/06lAFeNV7nWQVuMBtsJ6y1pmFGk3S+9b15RIj1U/ds/LJtm94qRRy007XPACMkibu4q4Y8srYq5WXTkKH+gtGVkLEOoEw8zwsSggom0X7e25VxLhHGtBNi8Ip24/pVdaiTkack9y7Sju5d7NoCOsmDh9RAQk9Qr3cInS54oD+ASq27nAcBvitxunojICAGM9a9sPvOWYiMW6J+/r+TpA9BjvYeKVCCUvz1G8DspyHP4hVNU8Ruu0tx75IISpfYngrpEW0Iy2HPS/rRhXd34RHXjTznVhIY8OTEAun/X2dhgCVXPC9EPI8tK3TUpw2o1xs4nX/ALgffYRPHosmBdVSp52Fbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(8676002)(8936002)(66476007)(66556008)(4326008)(83380400001)(6512007)(5660300002)(107886003)(4744005)(66946007)(26005)(186003)(9686003)(85182001)(6506007)(53546011)(6666004)(33716001)(86362001)(316002)(6916009)(6486002)(508600001)(38100700002)(82960400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzEyQmFXaG4xWUpxcGJZTDhUWlVPQkFPRkpDSThobjM4Y0R2eFRWd1ZpZ0VZ?=
 =?utf-8?B?MjNQa3dBV2N4NTQwdkd0bUxjODh2VU5XMVBJOHRUVjFKWmJpVlZZbjlTanRD?=
 =?utf-8?B?bWt5L2N4YmNHUFhrOGZjcXFUR1RCNWw1MXlEbFJudHBoaEpIWTUxaXZKK3Jt?=
 =?utf-8?B?eVVndENlUDVmaXBpcWhGek5zTWpNWlgrMUhnczY1VjNSZWVzaEdLMXJ3M3Ro?=
 =?utf-8?B?T2ovVVdyQ1JPRFRyNDJqcE91Q1d2R3JvYndJRUswUnBBS0REcmg0akJEMlF4?=
 =?utf-8?B?ZzI3QlFxVVBFby83alJjcytkc2ZkVFpMbjVSc2U2elk3Zk5kT1hKejJ6Q2NL?=
 =?utf-8?B?N21TS3lpOXFObEtGNHZBQUxkeGFaTFMzT3FyS0RreHdZSUs0K1VJY0t5azcw?=
 =?utf-8?B?cm93YVVzMGpNa09wUlRrUnovalJQbHNKQ3VhQ2hUU2FaN2Q5ZSt6QUFIUXB4?=
 =?utf-8?B?bjBmTWl3bkxFa1NLSzBFU0wxZnFrak9kek5NM2lVTDBqVFA1YzRmcC91RTZJ?=
 =?utf-8?B?TXpoWmYvUWt6b3hBTTF1NUg2VC9FTlFGNUljUjRHc3I1V1F2dllzVHczb3B6?=
 =?utf-8?B?eEZXdjBjVGxxL2JrYkZKMnlvdlFyeFNGYTBYOWFJS3p1emw4R1kySFBla2lU?=
 =?utf-8?B?S3VJSzJ0SVFncVEySWxhdG5ySzNwTlNPZzV0bHg2WE1Qb292V2tsU1ZsNWw3?=
 =?utf-8?B?bEtDeXZCaWdkUXVPUlpzMkthTzVtMU94SW5JUjhzWWZ4aFpsSlEyekxKenVB?=
 =?utf-8?B?R2YvbjBTU201SkdhdXdRQ3BBV3d3V3FvYXpadGpZWE5WZ1A2ZmhNdWVBcmdJ?=
 =?utf-8?B?akdMYlJtUnU0b0luZUlGUXdiMTVSTHFyWkViaHBRUytSbEtDd0hxdko5R2Mx?=
 =?utf-8?B?V1ZGcnUxeTduQjhkNXQzMFRMbE5wQWQyTnR5MDk5YmNQR2RFcHNTZWJTNnpP?=
 =?utf-8?B?T0haKy9KT1pPMGNraUVFZ2xrRUZEQU1OVHZMdm4xdExGOXh5dW9IMFRhUVda?=
 =?utf-8?B?M3Fpak9MT3NDaTlwTmRXMCtyNWF1WHBiSUhMN2hrR2k3ZjRPTjFocmdRL1JG?=
 =?utf-8?B?TFphY0l4WkluK1l4S1FuVXVDVk5sRmxRb1NwQVJIZ1JkRXRqWWY4QnhHN2lp?=
 =?utf-8?B?TGlRWHFPbnRIV0IxT2ZvdjRNdi9mVGIzU2pmRXVFamwxS3BTaGcvZnI1SVFj?=
 =?utf-8?B?ZnFHTzk2N2ZvaTI2WEl3dk1KakREL1lOQ0NLU3c0VTNUNitWaDZDNzhMTTJ6?=
 =?utf-8?B?SXFxVFM3RndTaE05dzJMTmZ0QjNVc1VZWHo1bGQxRnU3UTdWNGhPYVBFdkc4?=
 =?utf-8?B?bVJYR3BKeUUrcHIyWDArTENyS0VMYmV0UnZPRWVaTmszZEZFTkJ6Y1RBcllI?=
 =?utf-8?B?enJsSzBKdTNqTzQ5aDFpU3RLQ1JsQ3lsbjBxd1JtQkJvMEpEMG9yaDVacG9W?=
 =?utf-8?B?cmU2ZjBUNjZrZEFpVmE3ZWZLZGNrdE44Y0pDb212SXI5VUlCV24zeUcxZmNr?=
 =?utf-8?B?UWVCMmdBbTBUSTNRMERKZjhwNFJsa3ZEYXdxazhHS0hxVEtCQjhZRDRydkMy?=
 =?utf-8?B?dnZDQXR6bEc1bXpYY25QUUxJN0hBc1FUQ3ppMXVFWWtLbzVKeHdRQUs0Nzlm?=
 =?utf-8?B?VDBwb2t4NlpJL2RGNStGR2pSaGxseGlBMW9VbUE3a2o5R05wMCsrZkFxZjN1?=
 =?utf-8?B?aUY5Zkg1Z2doV2JUbkhsNTYxSGtzQkNFTEh4a01DcVJydE1TZ0ltNVEvaFFp?=
 =?utf-8?B?U25YYUk3dVkzaUtMKzN4NFFKTnZJc0NvWElkSUpZOXV1M21BZEllaTJQbmFk?=
 =?utf-8?B?bzZTMjQweG1HcGZXQXB0VGZ6TlhyYk1KMEtCUThzS3RLaDJvUUx6dStQTGVx?=
 =?utf-8?B?SnBtT3IrbXBCdU1rcXBTdFRiZVhBNDJEdXp0aTB4RUhMTUp0V2YzRTBmSmwy?=
 =?utf-8?B?R1I4c2lubk4xeXRNbHJMU3YxWWM3czRldVlVRG5OOUwwWXNJNWJxd3Y3dGJQ?=
 =?utf-8?B?U1lHdzBUS0VEREJYR09lbWVKUVRCY1BFV1dpV2JFd1k5TW5RTjQvT2V1OXEv?=
 =?utf-8?B?MjVUTWFGeVV1MDZsZndYZnpxeFB4QTE4ZWJldFlEbWJGallYaUQ2SEZGTWRF?=
 =?utf-8?B?dklLT3FjRUVpb1ZWbWxvSkNnRFJqeld5YU1JQWxvenhycXlnTHNUR2xOa2tn?=
 =?utf-8?Q?lI1NdyREhRT8I9EwYj9//Cg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8359d7db-7b11-4b7e-24e0-08d9e7c0af26
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:28:20.9305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8abru+B1Roskd7ugPrfM3UfE1t86Xy9RCiBHcVhVcKb1qgy1csR2txImy7a49qLnj2+TzinEONnp+OYGrm2PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2959
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 04:29:37PM +0100, Jan Beulich wrote:
> On 02.02.2022 16:14, Roger Pau Monné wrote:
> > On Tue, Jan 04, 2022 at 10:41:53AM +0100, Jan Beulich wrote:
> >> Do away with the "pod_target_out_unlock" label. In particular by folding
> >> if()-s, the logic can be expressed with less code (and no goto-s) this
> >> way.
> >>
> >> Limit scope of "p2m", constifying it at the same time.
> > 
> > Is this stale? I cannot find any reference to a p2m variable in the
> > chunks below.
> 
> Indeed it is, leftover from rebasing over the introduction of
> p2m_pod_get_mem_target() in what is now patch 1. Dropped.

I'm happy with this change with the commit adjusted:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Not sure if you can commit this now regardless of patch 1?

Thanks, Roger.

