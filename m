Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE854337D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213290.371471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpYy-0007TG-El; Tue, 19 Oct 2021 13:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213290.371471; Tue, 19 Oct 2021 13:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpYy-0007Qo-AN; Tue, 19 Oct 2021 13:53:56 +0000
Received: by outflank-mailman (input) for mailman id 213290;
 Tue, 19 Oct 2021 13:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcpYw-0007QP-Mx
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:53:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c08b8240-3058-4a32-b9cc-412dc7e6e00f;
 Tue, 19 Oct 2021 13:53:53 +0000 (UTC)
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
X-Inumbo-ID: c08b8240-3058-4a32-b9cc-412dc7e6e00f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634651633;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tFSmAqZ7txEzNR+0bjfziqd/IwIpKVFMRSA+CmCqak0=;
  b=TC6q6LUNHdPGSRfU8yBUBQZ75zERw3phm1jee7yilevCSURiKK+my13t
   HEiLXQEd+UuzV5ufDOP0nbFmjQ1vpZOYWb8uT5ObdhJ+9fkBRdDnYcCU7
   tSo7C0sCjuaxdmcQIlGo3B7u7Ujoljpt2vDkaQ76rU7gqCaLrrZsucawx
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oLQ3OfsH3woR6xV/hjKVkg+e/ex1bS3CGb7DbBrYVp3Fav1SBSTEqNyEheuggghbPtTdRudjxR
 2lKLVaW/T5BNaWDBAHAtssqq8zP++wcEwI93cwY0BLTdM7bEu11Av5gwiuoQkwgkk9nfEAMZas
 nauVVcZ6hnyWMtHQ+SrLUAENjQwzi6MHDe6Fhc2ntErk3+zZjHQMVh7gR3WNLaQjHrRaSUTPrg
 sjYfzRIj5PS7L4ZLF4ekfd6ByR3/rZFuLcqWTPPpaVGNJSoFhikBypI6uAum+j0Dldqb1so4dV
 k3gW1UZdXI46ido3PZxsfzfY
X-SBRS: 5.1
X-MesageID: 55525773
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lRcuj6suLWomR4fQ8eVqy2GILefnVLRZMUV32f8akzHdYApBsoF/q
 tZmKWnXP/bcZ2DyKdkiOY608k8EsZaDzt8xSAFtrS5jEnlB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw2InhX2thh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqLicZyotBYr1o6dNcBteESN6I5R+9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY250TR6uBO
 JFxhTxHQBrbbCYfJFMtVakRjPb0i3XjWDRRkQfAzUYwyzeKl1EguFT3C/LWd8KLQ4NJn0+ej
 mPA42n9RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l1474zSudPU89dX0RS94gts0yWwUS2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIa7/tli5v7bZpM6SvTt14yqcd3l6
 2nS9HBWulkFsSIcO0xXF3j8iDWwuoOBcAcx4gjGNo5OxlIkPND7D2BEBF6y0BqhEGp7ZgXe1
 JTns5LHhAzrMX1rvHbdKAnqNOrxj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN4l8MtMUNZCH0NP8fj2eN5yICl/iI+TPNDai8UzazSsIpKF/vEN9GNCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TVcmn9Z0HKLTdSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74gxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:cnqHzauQg9VpD5EHx/tB2KiY7skC/oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1E9Qq4Lbw5ebbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Hh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1ImjzsV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MTTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K0upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizylSKeSXLzEO9yq9Mww/UpT/6UkQoJk59TpY+CUnpAZDyHpnIKM0od
 gtMcxT5flzp4EtHPtA7Epoe7rBNoX3e2O/DIulGyWvKEg2AQO/l3fJ2sRB2AiLQu1D8HJgou
 WNbLtn3VRCDX4GT/f+hKF2zg==
X-IronPort-AV: E=Sophos;i="5.87,164,1631592000"; 
   d="scan'208";a="55525773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGMBgv3oBp/WEWRjupC6weubtCr7wpfPFLCGck1OZTn9GxzXc6GJMbEYLKa4glgVujDlEyIey2a4mjW8aPPP/tekshMQKwI5k9KjScwpcK5Xyrls8KitCPZbeEztwk8MtUbbv3g3PXdMp7EJHU3RzpwGeiEik5yEqUOh8ozPyUkpzY6xKEFUUIDlfjhFCPGi53ariCIWbN8GPCspdqTmNMmC8hnc675+uJ3wHLnlHAH3t9YhrROPogCkY6Aa0NyeEt6jBld/FVjdpaiK56n8/gN5I5sNAXKebepsJX5nOmj1rQX322FOT8N1pWkqySK+Q2groU6fiAEqx2vmXRHosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFKrmk1ZxEyJHA+8j5lD6LJLD+20vaarteCLEUr83X4=;
 b=gfo4k9jYsg5SEZMiQPAptdir9lKrElXoulr5wSwvVuevC/jw0OWr5gPOCvo1UUkKmWr9d0b1UM6fLyoACKZpOSVDSQ6439+i10nwK8Ic3t3LCYMCy9lndFMLzWegxYoJH7yS5CXiRi0qdeCGpVTpmjkgo1IWSUrXxh1/ekueA8loRSicb7Ay1ZZEYW/yrJpZRRKcccGZ7bQjRHgBPs7PXOyWtukAlrHGSDzUNgKyFvaTshx2gbpT3n9DdvRTwqwM3RbxuYzPGHe3Ky5wMpbO/Ah27rjsYooDRD7ByQoh4hWCH2K08iCUpYmR6f0Fi9GoRIAEdVzmiSiBIpz4QnUfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFKrmk1ZxEyJHA+8j5lD6LJLD+20vaarteCLEUr83X4=;
 b=JnNs0E012ThvfifLAo5MmTNcxfjDmc3vsbOpGqEEIuM/kP+8wdU7jTtI3zEAIyONgv/ms2DQ0LkvQENu5z7+KRkMk7QtJT7phJ1Q5353UhTAMWfYVw1v3CohfVGAsSpH9c8KjPUOCKub36PHDv2ZQZcluVZdNO0RSMjXumGUvBA=
Date: Tue, 19 Oct 2021 15:53:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/PoD: defer nested P2M flushes
Message-ID: <YW7N13JsVfwwcqAl@MacBook-Air-de-Roger.local>
References: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6bcac40-ab4a-4d12-f938-08d99307d6a0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29717B16E0F27B103D5221F38FBD9@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7egTzac/4oLneUaJ31RibBFGfPhuSXoI8BS/r/UTq2BuAEL6gVFUr1YFBjDvwbyCY/v0iHHl+RPgBnlrAVSlZ29RmSuJ/spJsibjH7r22+TWqhhSJwwh5E0eLAPaVLuDmVJXDD/VQkrR7dvUIO93c0wBGpxf0CQZJmLRVo2PMYUZZB3aZ0Y+ESztOA1zEThiGq5rJ2PViqNYAxBkII/oSsmJGFGPO2n/D1OceQVjmb3/XIh7QPayzTG66sIf3ZO68eXB/StodqMfDjeC1XDGjPgj9IW2UqMU09YFYfaOb4IeuIjJ6bLc5WvBd03T6m+/nK4KEfr6b34U/bwJd4QgKaCVJY15ujzCxc+EsH0OnWzVrrBSZvTToaZY0gj1PTcj0I7l47HQR/t4SeMO0Hm+oVeflA+l+j/gLGlWLFW8mEWp53SA2OYksVGfP8bpMjbTT3Yi88dk7/ZhMrexKFDe4xrQyn8sOHD+hhHn1ORsOCXE0HZCMjSfA3QNCN/4R9EGatEjG81bIVceZmmgHbsLcYSCkTSqk9Xv2G1BqSpmafI/Vq8QRv4bZ1Tuj0y3xwy9ISTFyM+qJgymwfgQc4r9swawrciUQIo6zgVwxzd2DyY8B0Zy1wMrdpImBPGms2d2IoLElXxKQLLcOtgWHw/IEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66476007)(8676002)(85182001)(66556008)(86362001)(5660300002)(508600001)(316002)(2906002)(66946007)(8936002)(6496006)(4326008)(9686003)(6916009)(6486002)(26005)(82960400001)(54906003)(83380400001)(186003)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hURFlUQmw0ZEJ2MmdnTGJhYzJZYnczMWlJM29kUWZOUy9JRitGa044aUNJ?=
 =?utf-8?B?T2xVSlpkZUMrUmZQR1Q0M0E4OEdjSDJyY0ZmY0dmVS83M0d6ZkpKK1Z5MjFw?=
 =?utf-8?B?N0xpdDFOOEExZ1BxaDM2TjBWemR1M21tbC9QVmVKOURNeHdQYjYweWdwSlZZ?=
 =?utf-8?B?ZERHM2FlMFBtWWpxRXF2L2sxb0doVlp5TlFDNDlmbDVjYjhZNlJRQzZ2UkhZ?=
 =?utf-8?B?YkRmTG9EM3pKZDlFK092c3ptcEsxclJCQ0VYVWJDa0oyUGZaNVI3LzVtOE8v?=
 =?utf-8?B?UWxQVXArZmFoVWJKZCttVWRKTTZ4WHRrL0U1N0tkUGg4dDdQbGdYYmtEdWdW?=
 =?utf-8?B?WkdGUGxUVHl2Qjk1STI0SnVFak1uaUcremVJcGFXRUx3UWFneGhOSVM0d0N5?=
 =?utf-8?B?d3NSKzNmaUJUd0w4RGdrS3Q4MW1MbzZGS0ZxTG40bjQ4b0xVY01sdlBiOFdT?=
 =?utf-8?B?THVSSkdzWVhxeU13RU5aQkE2b0NzWUVtT0RUbld2S0dkMHJIM1A5TlA4blJB?=
 =?utf-8?B?N2dhbjRHWDJ6VldKMGJldmN4cFZDb0s2Y2Vuam5wd1lzMHdFUkhQc1ZNbnBN?=
 =?utf-8?B?TnQ4MHo5VUpNN2pTTVVscW5NdjVpOUw0bFZUc091c1d3RTNLclZrbjdXK1RH?=
 =?utf-8?B?WW9hQjdVK3R5NFhPamx4OFZIaVZVNDd6Nkp5ZjExbnhXL3d4VktjYlIwQldS?=
 =?utf-8?B?ZzloWTFNZ1V5MVI1ZjczckxLbkFacHpqMERJenZwc3UyU3p6YnJFZVRPN3B0?=
 =?utf-8?B?UEM1TWE3ZG1qTUJrdVFjZ002QlBtTnRmUlZsK0I4eVpHUGQ2OUNuL09TV09E?=
 =?utf-8?B?NFk3YWdybll0UWdWM01jRVA3c21pY3F4NThhWmo4cjZDbXJMZ0VNTWFXcFJa?=
 =?utf-8?B?d2J5UTVnQ0M5OE8yRmpqWnMrMG8wRHBLV00zd2NEdW03QmdlMzdUZG45NDFK?=
 =?utf-8?B?NkRwQzExb00xSUlzNVZWR2tOQ2FLUDNkMm9uNEI0MXZTRjU3b1JCM1NKc2hF?=
 =?utf-8?B?Y2t1QkhRSXo5NzdQYjRmMk4xN0dYU3JNemxPRnB1Tk11UlJiaUNEZTcxYWFT?=
 =?utf-8?B?RWsxdzVlUFpPc0lzK0pWN1ZiUFNyRHJRcmlxQTJlNVJWTldKYzIybUtuSEEx?=
 =?utf-8?B?WFhpWUR2Y2tqSWViYUVqbGRNVUNMdHNFRzJDcHBEWU03d2dKSjJkU2VpLzBX?=
 =?utf-8?B?OWJKRG04TEdiWE5lSDdOYjE3OFNZb1l5VmZwRWF2eXk2Sk80SHc1cWhBeWJU?=
 =?utf-8?B?QkNlVEJnWGo2ZnFueElwUjBSdDlOeU5tMVlLcWtJcnpZZjhYUWR5MFlRQVZH?=
 =?utf-8?B?ZWJtYW10eVNOYWtoSTZuVU9HWitXcnU1akNUeG5Sc3E2ZTM3MWVVMzB4cGQ2?=
 =?utf-8?B?NWJiRi8veG9ETzVYaDRmV2FBaFBCR2lncFhWYklXOTZJNjBlanNUSmJES0hh?=
 =?utf-8?B?eHpyRllPR0hHQlo3aDVvTWxqWTVqc3NiZ3hrR2gydnROcXdBbTl4SzFJTWZV?=
 =?utf-8?B?c2Z0UktCSkZxRVVrTlZOUVNLT3QvVVhraDV2RTJPZjduNGwzdTVzTTIrVkZl?=
 =?utf-8?B?TEd3em12NEVzSjRlZS9ZUHdFYmF5UmM4UHRtU253NEdyckxYNHpQK3dML1hx?=
 =?utf-8?B?T0t1Sk5LVDJxVFlFbGJIMHdSRFVrcXJRNEhMc1JIdE84YzZ4UmkyMDZ2U0Vv?=
 =?utf-8?B?MXpNUWpyTFo3RGFRcE1zd1p2UE50SVBQaW9nVkVHSnltM25tN3FVRkNvS3lh?=
 =?utf-8?Q?L1JD3OlSXCljtBW279eI0RsOj5E6IKJFT8+ldeh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bcac40-ab4a-4d12-f938-08d99307d6a0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:53:32.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEgXHRVU0fatwEPNTWxYXyoBPJsoRkeiGXjyVQM3xZLJ5kfzxcLq0q6PgdvtSJgyHPp+sk1ffk7FAAQ49YWzMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 02:52:27PM +0200, Jan Beulich wrote:
> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> order violation when the PoD lock is held around it. Hence such flushing
> needs to be deferred. Steal the approach from p2m_change_type_range().
> (Note that strictly speaking the change at the out_of_memory label is
> not needed, as the domain gets crashed there anyway. The change is being
> made nevertheless to avoid setting up a trap from someone meaning to
> deal with that case better than by domain_crash().)
> 
> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected. Make its
> p2m_flush_nestedp2m() invocation conditional. Note that this then also
> alters behavior of p2m_change_type_range() on EPT, deferring the nested
> flushes there as well. I think this should have been that way from the
> introduction of the flag.
> 
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Also adjust ept_sync_domain_prepare(). Also convert the flush at the
>     out_of_memory label. Extend description to cover these.
> 
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1253,7 +1253,7 @@ static void ept_sync_domain_prepare(stru
>      {
>          if ( p2m_is_nestedp2m(p2m) )
>              ept = &p2m_get_hostp2m(d)->ept;
> -        else
> +        else if ( !p2m->defer_nested_flush )
>              p2m_flush_nestedp2m(d);

I find this model slightly concerning, as we don't actually notify the
caller that a nested flush as been deferred, so we must make sure that
whoever sets defer_nested_flush also performs a flush unconditionally
when clearing the flag.

Thanks, Roger.

