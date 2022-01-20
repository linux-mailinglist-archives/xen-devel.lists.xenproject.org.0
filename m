Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D387D495029
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259091.446893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYU4-0004v4-NW; Thu, 20 Jan 2022 14:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259091.446893; Thu, 20 Jan 2022 14:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYU4-0004t2-K5; Thu, 20 Jan 2022 14:32:16 +0000
Received: by outflank-mailman (input) for mailman id 259091;
 Thu, 20 Jan 2022 14:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAYU2-0004sw-FM
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:32:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfab19ae-79fd-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:32:12 +0100 (CET)
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
X-Inumbo-ID: bfab19ae-79fd-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642689131;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KW1vkXsgGlxZBEpz3FYa63QvwSEVlxvRKDziZxVGsjI=;
  b=EGh1FpB6+hKV9x+WArdrh2I8xgKYuV1X6LHR1AMr26+9VU/DE/x6u16Z
   ngjnBQtY5nNOuzTRYQJe6k8EA/ILeLvR6N3yi54ABvqdVMzPyVZqWoZ/S
   ff/kbVMjalwg9K3PEKpxfvjabjNpxZCH5CR0vY2qHANk7pAhFoZBw5S6G
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VM1Cwskk+cHXUbJFKQr6G4icqkoH8Y79LJn22NSxnDf+4d3rgv8KgCxL/dAq7t6G33pX8C754m
 /IScoPkXGxsVEg/4pfs2yzBWJsaKVdjlvRL5AwvZ+BnpM3djWVEI7sR/ce5lKG9o+fBrRLoQ+M
 yUArdQ4+Gw6wkYlHEifQEaqrFJ3ZHfY276h6z7s3bmEUG1LtfKxMgsMWsZPjU5cNmaxIklO3Yq
 4eNCIhTrANkkXjfIEWcMuSqN3NSdPXXkH2YHpMRtR99A+0QM8uIpGpK2FwWlvx/a/yR/X5uk/t
 6xK3lAv/z8e4yqPQEcyo0l2+
X-SBRS: 5.2
X-MesageID: 62812233
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B+/TbqzYDt8SXDFqy0R6t+fWwSrEfRIJ4+MujC+fZmUNrF6WrkVTz
 GNJWDyHM/yPazb0fosgaY2woU0O7cDUzNA3TlFlryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8l/l
 vBfjpKXcBwwMq3+heEeUyZBMj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYECjG5q3JsVdRrYT
 +M7NWtpQg/fWEZSNFBMCI5mvvbzhGaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQuXDamwwnVf1pCPQ26DOQz6nU3B+4GT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkuXFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNslIRiG2NPdXABb3nARBodtrxor6p5
 ilspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/J94Jv2EiehswYq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C9fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMRiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:SjIh86Db/Ic1vjrlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62812233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9gFcWQ6oSmNa6/mocjTd83oYsEtZ9PTLp60glHThpc6QrBXNyDWxiji+ISdrNwsXY3R0ImXtchj/Lm23Skbg9S5MtRLGLeFVy9Anh5wKk/jw8a+7wGr/p9JVGKuaQ8T5TN12lToivmuY4XAEtMJ3EaLQyht3w34lcyiWKAmFJv8eZBdAlJN/+Mjo5uiObh7C8U89DNkEThoRH/JfS2M+Kc2kOmTtIwCdcQFGEaOR7Wh+GbUpomTR4Sarfo85du7d0LF7XVuQDIveC1hkFhjuy+nDwiGlYpN5fBC0lX/nD9CrQi3vlOLg/9EcU8iLy5OWXPW8aaRdwLrEqkS1Djllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99GnAml1HbPgLm17okCDNUHxeMAoRnaLFCMcVsQ8Lj8=;
 b=Fdz8V1YS3KnNSgLERY+GcGy0IswLaEZb6UCoDMoAVatpGraNcmGSSrSzFdQ/zxUGbD07OpggEqAjZzuzOglmgDLwsYdaTDTzmxBTSP5kCvpfdQbWrO0SMqKxo+H8rAEUfsAdMRIkoY6ar5jaPosF5bHQPNdMdvE/E6YaiuBWdxHh0TlH+DSs4L2SyDVEk3QSjiN9I5/uCGvsEmGxndw/cwoiqHWfhJ9q6pcgyXXzkUip2M3bkfaRTZeEHuzQR6gxF6TteTv5+V/a1N/27kCRHx1E41P/fhu4HpCAK64xihDdC1NsLfsqw3VBaPUbIa3C02yqG6naTtm1wRyYm5S6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99GnAml1HbPgLm17okCDNUHxeMAoRnaLFCMcVsQ8Lj8=;
 b=caMB3FC8SYaOJtHbVQWUUu9PcOQ2NHn9xMNb6aHyvQiRq5ZYVUV7DPEG8GhRs7ty6xqgmSiys9g6PvGjFsxoM2xjDKPSZtltoltXQFqNCiMp/rY5mrfo4XCybKGjIYlQadt9TZsoIkGXnSJsEzrNLMN7nvcjBw12HzKqTjKtyBc=
Date: Thu, 20 Jan 2022 15:31:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/5] x86/mwait-idle: stop exposing platform acronyms
Message-ID: <YelyX6N/vuPpsNiB@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <39f83895-e01a-bfd8-708b-eedbb145d5fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39f83895-e01a-bfd8-708b-eedbb145d5fb@suse.com>
X-ClientProxiedBy: MR2P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c092a2e-b832-4137-783b-08d9dc21a1da
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB6555183C23A88C75FA30F3908F5A9@MW4PR03MB6555.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MfeYDcMIv3Ei2GXJVK6VncAaeMuf4XgBSWACgI3TFkaurYzxfqhijg3cyy1xXlhrEnBIQ1zTUFNrF9yl0QdjNeOe6PN8emC0qE3Nk3IP6SM2fyEBeBkKt0e8xwE8NU9J+jz8FKYa/wcMN5HnD12AP5HNgHbtdaTIoZ4sFvhvELaItFX2qOKvsCPeTzc+QO4PLHrAhcbmSChUOS11bxqq3bZ1e0ZSMcOlB4EGv3sKu/SaYgvxYi4ef8FBplm3hQApTbhseRV+qnGbhA9zXc9zAhyEVQNutmRJhefDBfZi4lHm2a2zbRwGBX7NhWK37SL/m4OTrh10QzMGqYdwEvLqJYCHbxxTcpDheYwOU1ZJsESZoQVGFSbA/YUqUD96kLwV8+yhATykbnURxu3XW2YVGxYSJfAAOiTqt+mA26dYhxC6gl1ksN7KuP61bpfc0yVj8dxYokpMOejUdProoKu/zsF5AGTrelex3C233MM8TWiqARs6w6m+iP1xLsx2NFwAJ6xOfcUhwrTFrFgpzo+zWNQybJc+nsHfSJnSN9+TJQPpY79MC2U6m5ad9iuHARhWMG4PBKsu7UWaKb6HDX/e7moFOgbQmv6iPEsGEj+awqClt0dkLRLml57yNVXgbwrXJaURJ43qfl7VJu5mV+h7SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8676002)(6916009)(2906002)(6666004)(316002)(54906003)(5660300002)(4744005)(508600001)(186003)(33716001)(26005)(66556008)(66946007)(82960400001)(83380400001)(85182001)(8936002)(6506007)(4326008)(6486002)(6512007)(86362001)(66476007)(38100700002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWcyV1JEcjVZNHFCN2JUSUJ4NkxNVGlibkM5akF6OHJhN3dJMWxQanJrMnVR?=
 =?utf-8?B?Q3o5emtFMlRUSEVQZFpTYWtYZEJjN283YnNrSFI2K1B3Zm45a0tkazRXMnVm?=
 =?utf-8?B?UUh1SnorNWltOVczMXNxQ1NienpSK2lXaFFwb0tram5ISXdyVEcySTFRbEpo?=
 =?utf-8?B?MUFibll6ajlSbHJSNnFvUG1Tb1E3Zlo5djhKMGVvaDAzcTZMY1hhYkh0OWM5?=
 =?utf-8?B?ZG0wUEVwVWVMVG14SDdqYkxmRTBHeVJyZG82YUVWWlhKdjB4dXZsL09SRnVn?=
 =?utf-8?B?dW5tUFZQRlNmNm0zWE9SV3FrTFZMZjRKS1BnbjFKNEVpRVRNeGxsWVJNcjlk?=
 =?utf-8?B?VU5CVmU2VHEwUzdsTmRCWkRoTzkxanlreUM0N2R3bml5ZnNCUVo3N3Y0eGpE?=
 =?utf-8?B?NGJUMUZ6YUs3eW1GREtKRzRJbmR6WFBwWGl2MTRKRW1mYURFRVpOc1lQZmpN?=
 =?utf-8?B?elkwZGRjSnh4YktzWXpzTG8rS0kvdXpBRURXbk9rdi9GVG5ONzZXLzdLVGIv?=
 =?utf-8?B?aU1RajJKVE81UElJV3kvK2VPSkp6SUhuT2FGOFpHQ2YwMWRDSHpaZVdGZHYy?=
 =?utf-8?B?dTlRVmtSUFNkNnI0bHFvbUtPZmk5RFVUZWFsZTBxRldGWFhsNC9nVUlnMmZW?=
 =?utf-8?B?WW9QaytZME9XWEdic0RjeTVDRy9yQmpHbVorbXBwL1MxdWtoaUZyYkRWcEVE?=
 =?utf-8?B?dFkzL1hPcUlLaHIxODBrMnA1Yy9IVnNiUmlqcjZGMm9CSXVIU1F2a05BQ05W?=
 =?utf-8?B?empWdTVWSUtJR056Z1lBTTRNU1JjRysvYWRucWcwOGhsam5BL0NKYTBINHA1?=
 =?utf-8?B?b2NvUHFyRzNNTHpOSVBkcituTFMzZVhIblMybTJib285RkJTS2oyOGpuMWs2?=
 =?utf-8?B?RFdzMWJSemFudHhHcFNJYlp4V2RRalVTeXZlaGlWaVFUOC9KN05kc003cGZI?=
 =?utf-8?B?eGFXdUY5c0VnbXJZSUJvVVBqQlA4ZlVJUFhSdExOSnltTkpGa2hsNm9YdmFh?=
 =?utf-8?B?T01IdVJYVnhEbnh6Zzg2eTBIbjc5MUVYYkNCR1VHY1FvK3ErRDkwMW5KdDJK?=
 =?utf-8?B?WDdERElzYk01QmVLUWhSZVJ0aVJxaWM3M3NJMXdMTWt2ZEFEc2s1V0Z1MXI5?=
 =?utf-8?B?N01od0hoUFJneTQ5eGdKRE9sYVVMUGlKN1g5c0x4WjMrd004UFNJZXFXRTRz?=
 =?utf-8?B?UVJtQ0d5Y0NFVEkzcW1rMGZTNjc3MFhlKy94ekMyNnljYVd2OWI0Ymx6ajFh?=
 =?utf-8?B?ZFdSRDZ3WXh3YmRjRDhTTitXaTdUdmRvVWg0eVpaNGFyUFd1SU9MSGxQVm5v?=
 =?utf-8?B?YTMrM3hXV2V3a0tnVVNCZ0lQNjJCaWpiU1hvT0NKcVNNc1NOUlBQRDZGSExF?=
 =?utf-8?B?d0RhdmtoeW9jdTVxTmtlM1JJWHhxQk1oMVZhRzc5K3hYQjZGT0FybFRjUVFK?=
 =?utf-8?B?UVcwb3d2cS9XRjdFNU5KcUR6cmFJYkI0WmdMRkVuRGJJMG85RmZkeFJHNHJo?=
 =?utf-8?B?YUdaajJiaHY5ZXVSTVdPdkdMNnZIUVRDVnEzVzZNcHg3UmQ3RTljUzN0Nlgx?=
 =?utf-8?B?OHg1eTBrV1dQb21TQW5zUzV2dzhuM2o4aDFQTTROa1ZIV051VDJxekMwV1Vs?=
 =?utf-8?B?dzgxNW5oMXlId25GSmFhRk5YVHZlcWxNMWZuYXhNTkVwQUNBQTRsN1dCVFl0?=
 =?utf-8?B?dDJOZk82VTFJSUdWeXpWL08raldvWVcxT2VvY2hGaUxOeGYrR1N4Vm9HYVgw?=
 =?utf-8?B?Q09yMWRKbENhMzl6QzVQdlBaQzlCa3NHVlNwdUoreXl5RUc2SjMzcmx1alpR?=
 =?utf-8?B?VXVrWnBidWs1bFFDR2Fyc3Uva0VyZ0l2VlpBSk5qL3F0Y3ZUb0RtemVmK09N?=
 =?utf-8?B?cW9xbHREdVRQMWpVODJhZmZjTmJaMVg5Y0oxdlRnYysrUUIvaHB2K05ZWFhT?=
 =?utf-8?B?MzF4M0NhWGo2SzY0VWJLczJGT3lqSHhpRVlRTWJtMjNjNVFKQkhGU0R5a1Y4?=
 =?utf-8?B?ZlhDMEZuZmczWEw5eTZ1a3hheHhsNWFvenc1WThuUDl4MFN0cUIrRDMwcUFr?=
 =?utf-8?B?UnBia3d5eW5oaG5ISlJ3elBHNyt1MzFkM3h2MlV3OFZnK00wdS8rNFJ3M1Qr?=
 =?utf-8?B?cXVZSTRNK1g1T2ZqN3BBZ3RUU2FvYVo3ZUJGRFBXbXRrTmhHTEUxSUFEbmlW?=
 =?utf-8?Q?00u2a3Blt/aQsT1q5ivteas=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c092a2e-b832-4137-783b-08d9dc21a1da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:32:05.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KP18iX3VGjw3KOn2nFe22nxjv4AYk1WKP+JitNdQcH6oj24E5M1BqlFOx8LM92kKOLzU8syg/fsO0YrPiVsb7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6555
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 03:01:45PM +0100, Jan Beulich wrote:
> This follows Linux commit de09cdd09fa1 ("intel_idle: stop exposing
> platform acronyms in sysfs"), but their main justifications (sysfs
> exposure and similarity with acpi-idle) don't apply to us. The field is
> only used in a single printk() right now, but having the platform tags
> there isn't useful either.
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

