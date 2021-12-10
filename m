Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CE46FEC7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 11:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243757.421772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvdAY-0007ol-GN; Fri, 10 Dec 2021 10:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243757.421772; Fri, 10 Dec 2021 10:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvdAY-0007lY-DI; Fri, 10 Dec 2021 10:30:26 +0000
Received: by outflank-mailman (input) for mailman id 243757;
 Fri, 10 Dec 2021 10:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvdAX-0007lC-HX
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 10:30:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c5adf4-59a4-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 11:30:02 +0100 (CET)
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
X-Inumbo-ID: 20c5adf4-59a4-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639132223;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4evvILQQxNHk5hljZN6n744fATeohvUVR1S0Ov0RlZo=;
  b=gZWI362Th9aWrI93xxxe7aOn+VBLEdDH4J0/6vdnWtxLE/LQi/gGB/tp
   qQ20GbLvKjYu7C8F2A6oLJ6i26qvz7WNZt5eiBvLFyUV5zfqWQORX4AJ+
   XvyuQqlZoxdtxy/ZPL7iNqjXFAmDCqP2mTgq22jx6yxDT9edaWt//vMYD
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PVvDpYKFDm1kKgR9gGdApqbXRld1Z2KZVvHDbTRKu0NJegLud5AnxevKqtXLbwT/DX+cs8WbLY
 5dyEtsSYb3OdZnmJbX10nyVAlgpW3Fw5SPZBjL0UR/zji4Xts2BWwwqNJR62s1peJSdwngjoeL
 oHyIt44QZNTZP7kIBlBCT7jld5qC5AMmoGde5v+OtO9ejIwrm99qiJ5T1BHDKQe5XC3Vz+lNjx
 X49jAN4l4xcMeVIecQH/SJkdUBZjDdeJKfjwwfTTNuSmcYA8pNUd01ZCiswdT8xj86HZbVL/UY
 T1V3J95vnelSR4/y6krx/g9l
X-SBRS: 5.1
X-MesageID: 60118488
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jktfr68LMxP8flJwalBkDrUDfnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2cXWT+GOKyJYWTwf951a46w9B9UvZfdndVrTAI/rnw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgrl
 PZyure+bj4yZI+UsuFDSUNkPgxxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhG5p1pweTZ4yY
 eIHUyNoYCznbSFjHWoVFZI8xOqrtFTgJmgwRFW9+vNsvjm7IBZK+LrwNpzTc9+DR8RQl26Zo
 H7L+yLyBRRyHN+S1zuDtG6tj+nnnCXnVYZUH7q9ntZoilCOwm0YCDUNSEC25/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxRwi
 ny2kPjnIgV06p/NY3fD7O2ogB69bH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE+8CRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHDdKAnuNOvwjxpgDNE6qQQ3d3XG327yk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJVykvW8S4y0Cqi8gj9yjn5ZLlfvEMZGPxH44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Km7VXvIgSWcHFzLrTpWJd0t3UgOiIwe12v3hAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:HRcG3al1KSQ2y70O/ttLXyRFuTLpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="60118488"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny6rwN5fDpS/zG0cpCpkANHGqiIuuo08BwhSfF3TfbxrPqIWmsVHVfwVkGHmMxmQBVuf2WUHeFP5lOuFUUajEAgMgxUOLNHV8o7ah+PoipTligP1/OKPvh0cZ0c1no8ijA022Tw+I/HW+BnoXQsnEikC7d1FIq2T6EmuQsOXrxh4ScI7VhKXZys74U9zJ7iDDokoQMwZlrRy7Y9GRld9KgmgHhvC11q0+lGV4WNGXEeJqtw/dQA/duOH4vWqnihqb6fP1vC+EMwFkZ8CQtiEgOuzan9de1srRl0ziF+IRvbwguCuJpeqB1m+gZ/16ft0KM8iez/7OQsMr1I+Y3NpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efO7i9HM4hQZtTbeIveCTeoOkUZvKrPMC/1No5eKVAY=;
 b=UMyCiLMZYT0HnfJnT4QAG9LXxSyZPWevvBxAomEvFCUuo7n6DwMHfK/USnz05jYs4/l5wT8hCG9BuKIBhujVULQ2fNTM5QfD0yWllcdJSSxLSvTYTax6QwQCxNq77FXVvH2sGHKoIHVVguW2gfRMPbDj+mNMvVQW6y4uZutJk/fjFvtw0n+lM5yeTuG5klWgmFHZ42/b7cKMbFX2llnKmaqJjIo7l3ZGLgFUcsy9k7cfugSuM3OTtHUQDpCjOOb/w4eV8KtgYv3OlchsSpBQ0LoEFZ9GApk7Jnvp9nEAPTPy4GKasiuARUaV6LbSWVTtueQQI1/nBG8RFUTUUJnc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efO7i9HM4hQZtTbeIveCTeoOkUZvKrPMC/1No5eKVAY=;
 b=VQYqC+oYtfa9w1ApiPA7yKBaVGKVwoTp7OVuDb5to8qsKUejR6lol6L5TXY/CMteAsBrz5iO8k/aKC+58wuUamCufltsuTqqfXh2nKPuNOi4NKe5Gst3LGvJ6EeJFYH2gmmw9FyWvnFiJWv+zg2PcxoJ8c4xYLmcPFbcq/RQPTo=
Date: Fri, 10 Dec 2021 11:30:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/EPT: squash meaningless TLB flush
Message-ID: <YbMsMWC8Y767XnmV@Air-de-Roger>
References: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d69913e0-0bd1-4407-acc0-08d9bbc80e39
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB37402D6DD8D46D8EEDB2D6308F719@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdL5P2fMCGTTwtXlcJNj7AHHTNVL8NZ/LVuK29OQbDYXjr/dpWO99eiKTZpd1Q45R5aEAXu9UzBy8nBIrw3vDjNZKqyUX0yjg15FjboHMKWGSbo2dEV5mUY8Ad1DYU+giU5MhXamlgm1e2x5TQwDxFBL8/lPPGPPma8Gan55jrjajPJeNWA2I5zWtDz3KcEPteSEqvGwA58M37lYLgSqdSK/TlU7q8dIiCrEo16GCJhl8vCBA/WKOdTqMWvHYrmOSw2LYEZjOHgIJhC1pzJ8gQ8AfkCxBis2RrEHHv2W1Bapn60AQAwaAtO/mhrVOEiTGojtXeeRvjR1Pz8LwhRH83j5Ohu4zqPLGLuf1aPN1AfFjMTKdvOq2/WjZRDVBOe7VA43WA/bmcsdaSIgpcG/oG5ENMWzFNoQo3z7ACyfm3D3S0Oqu/QwzbqEALfo4xSbEuDrxUmBYLIQfznSBO80BYXGOAu51rPwXshTE6fw/eNl6KAFKO5eb4VSJQ122DcwIFQQJlMrVpGg8D7C/MX9z0CStWCIua85tuwevtlACQJlumgI5HjnIOGc8KWnpjst8A6/zHrVAV5aIZY/AAf2MRi3qj5KzSurVIclCym9iUq8DwRg2Wp33+88zeTVHGzr4KepC7x/ZPAeNmF4qGFxow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(38100700002)(26005)(5660300002)(956004)(316002)(8676002)(82960400001)(4744005)(186003)(9686003)(4326008)(6916009)(66556008)(85182001)(86362001)(54906003)(6486002)(6666004)(6496006)(66476007)(8936002)(2906002)(33716001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxUWFRHQnNtRmNuZjVULzVhb0ljT1YrU3p5MW8xRFJSN29uS1F1QUcrcjQw?=
 =?utf-8?B?dGE1Sit5MjY2OWdqU2JIbjJnWlJhUUN0YmFzQmkrdnYyb3pPRzNrdkEyTVJO?=
 =?utf-8?B?TG91ZkZhUDJMcXZEYVlaV2JQekh1RHRCZmMxN2EyR0t4b3NvbC9TeE5vczU5?=
 =?utf-8?B?SmRCYXZVWnE2V3Npbks3T0crVnVJejVlNjk1eFVkeVU2endyYk91OGFUZGhU?=
 =?utf-8?B?cmFFZmVycGwrOE5kYlhvN2liRnZGWURKcnFTaUVjNVJjWS9WanJmVzRCRldq?=
 =?utf-8?B?UExma3RLMDBINjAwQ2Q3Y3NTd3EzRXJINlFabG5uNlNxQ0hWT05iK2V2WmxC?=
 =?utf-8?B?c1BDc2IweWpadWpQZ3ZhdWNyQi95QzVEOUpNNEI3dWZKeFI1MnVFeWNLMVNs?=
 =?utf-8?B?TDNFSHlZbS8zMDNSTTRZM3ZtbzBNellTZlFveGhXTy9WeEp5Ry9LUzRTeWNM?=
 =?utf-8?B?K0NnQWFsUDJaZlZudTh2QjVodWpMQlRMNW4rQzRkNnQzczZWdkZId0ZtQmY4?=
 =?utf-8?B?cHZ0cTkwZGFSSytJWW5LMjRCZi9EblhhdjI1ZVRCaDNaYjNRTTc3cS9uOU9T?=
 =?utf-8?B?V1VMellKSFJaU2dUYnNTNGpKb3BWK0ZRZWxVdktrVlhUU0FPWHdJdkVPYk5q?=
 =?utf-8?B?UnpFRm5mbTFIdXQvcFZkTW9YZkU1bnFTUHVCZkpaN29aWGpEeEE1dmtPT0tr?=
 =?utf-8?B?cXA3ZlRjUDF2WklWcjNJVGg3T09wTEZUbnppU28zb1BZMGVBbzNoVk16TUZJ?=
 =?utf-8?B?Vkl0TGVxdHlyWVNVRm1SK3BRejFtRDJyVHpiYWwyYVFFQWROaXRPSCsvRVBw?=
 =?utf-8?B?dzRJQk1ENERtemZOclliUndselRzN01RUnk5TUh4UmZrQmFkZ2YvZGZXVGF5?=
 =?utf-8?B?bTlhektMUWpiQ1R2M0ZxbjN1MWt0OTN6YU13dEdpYmRKK3RXZ0lVYXBJOUE4?=
 =?utf-8?B?YkNzNEdsOCtjdFlvUjZHTzFzTXRKUnZUcGtuZ1NLMW1hYXI1L1RQb1BDRUNZ?=
 =?utf-8?B?SkdNYmUvemo4YVV0THppUUkrbGtvRUV2SDRQc1pjOWk5QWQvOWVtV28rbDRl?=
 =?utf-8?B?eUVWTlJMQ2lGRjNvTENlN25mYUM5Q0sweURNd2xnVFJPdVR3VE94dkRaS0tN?=
 =?utf-8?B?N0lrTk9DU3VUUmtmT0RzaC9qdGdqSFprT3M5TVpNRWVxS1I1Q2ZTbzhTVXNK?=
 =?utf-8?B?VHhIUGFYUTM5Q2p2Vzd4aFkrTzl0YWFicm1OdkVtTi9qSVlxUitNcUZzamJJ?=
 =?utf-8?B?bnhycXBPVUNhenNtdVRHd052TCtwb2xieFRkUGk0b3BGejhBd29QTlVxckJU?=
 =?utf-8?B?SW5yd2Rzc2JHQ3JMVmVkU3hRR1pGSUJSUWNPWEhURlFDcFErY2JlOVNuaGpL?=
 =?utf-8?B?M1pRUTdHZTR4RldvcmFaQ21NMGJXNm1hZ1Uzemluc2ZUN3kxakdHeThGcUVx?=
 =?utf-8?B?eVNGOFlVdmFFQ2l0ekVLYXQvVnNrT0tyRWJRQ0piWE9nRU8xcG40V3JLT3pm?=
 =?utf-8?B?bGltZC8xcDdGZDhFMXhrQXd1cFVCWGxYTWNEQzhyamdCZFI0QytOVWo4aHYy?=
 =?utf-8?B?bHpWU2dvZktOTkRKNERTYnVGYzZyVG1EWW52eldVZDRiU0VWNUQzWjU1dWxj?=
 =?utf-8?B?WnJ6MzZJSDROZ2dRbXd1UmxhZGRRRjBtNFhTVFBESDNzY3FqRVAzMXhUWmRI?=
 =?utf-8?B?b3paOUhNZzRZTUdiVTk5R0JDSnppN0hzNlVqb21MWktoOFVNVGdDaHRwSm1P?=
 =?utf-8?B?SlB5VjZ3MWEzVG9CZExWQWlaSi9IVnN2RkdFVkEwbWFubHNtZ1FOZExpRXBZ?=
 =?utf-8?B?c2RTd1NVc3pxd2ozZTNsUmJMeG5iMHE5c1BPb1pvQ3FlWnFlTk9WQi9pR2w0?=
 =?utf-8?B?YVZud08vc1d4NTl2ZlBhTlpIVUFZZDIrOGlpVWp3WUVHQTBDVi9uR3h1WWFh?=
 =?utf-8?B?QXpYR2U2SXMxUXQyM1VMUXliMkM0aEgzRFF0ZVcrM0tIYzdzT3FjUU9mVFp1?=
 =?utf-8?B?SVRuak1jUXZNeGJpKzV3SUo3UjduVzlibGtabDlab0swTENwOXhUWHFmaFNM?=
 =?utf-8?B?UGVkQzNsdUl5ejhCaTZkT1RHenlJeGhJYnhVTk85cnRXS3RnSnNhWHVVbFhi?=
 =?utf-8?B?Z1R5NE5ORTFsVmlRbDVIRk5zQmlHYTV2VThoNHM5Uks5d0xNbXRmaXRsMERk?=
 =?utf-8?Q?tsMCwn+vQWdp1jiqdOHIVtI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d69913e0-0bd1-4407-acc0-08d9bbc80e39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 10:30:15.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv71xcQWlzYUYtHWqmEqpUsQtd6XVQdVxMGvrdCUVa7UiAbciCnuE5OhBNSad+Ag6NRAiijj1tYdkUu9RkOEew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Tue, Nov 30, 2021 at 05:10:53PM +0100, Jan Beulich wrote:
> ept_free_entry() gets called after a flush - if one is necessary in the
> first place - was already issued. That behavior is similar to NPT, which
> also doesn't have any further flush in p2m_free_entry(). (Furthermore,
> the function being recursive, in case of recursiveness way too many
> flushes would have been issued.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

It's also worth noting that ept_free_entry doesn't modify the p2m
itself - it gets handed an EPT entry to free, which should have been
unhooked from the p2m previously by the caller, so it should be the
responsibility of the caller to perform any flushes.

Thanks, Roger.

