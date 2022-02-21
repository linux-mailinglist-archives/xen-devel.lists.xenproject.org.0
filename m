Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E44BDA2C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 15:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276288.472411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9YH-0006MP-2A; Mon, 21 Feb 2022 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276288.472411; Mon, 21 Feb 2022 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9YG-0006KW-Ue; Mon, 21 Feb 2022 14:20:32 +0000
Received: by outflank-mailman (input) for mailman id 276288;
 Mon, 21 Feb 2022 14:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM9YF-0006KO-48
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 14:20:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a58419b-9321-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 15:20:28 +0100 (CET)
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
X-Inumbo-ID: 6a58419b-9321-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645453228;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i1QC6A25OxxBe9hEOgbrdZsifJgbnoH/2o0b3shjwtA=;
  b=F8nTj5Vqrtyr913UDDzJd0fxveNac7ZaiXo9X445ulqd2BJsdT5PQEoc
   v1dI9DnxVauZCl4HCvo19ZXyphI/V731tl1rhJ7+2EFEuv9fAA/9vdGAn
   hqG5TdMrCefclj6sJYPXm1fT6ZCBVSrfLBh8s8Pq0ETzpWpiDuKMQqbcj
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64652013
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:C2lKo6DDDn1LChVW//njw5YqxClBgxIJ4kV8jS/XYbTApGsghWQAx
 zcdWjuFOvnfZmOgeI0naY209EkDsJaAn9dmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgq0
 8hq69u+YzwqEYeTodw4WQZ7PHpXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SQ6uEP
 5NCAdZpRDb+Zgd/OFYvM54nl76GmCnkfxEAjmvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3ErvfGgCfTSI8UUrqi+ZZCm0aPz2YeDBkXU1qTovSjjEO6HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLV/ASxFmUCViRGatEtqIkxXzNC/
 n2jks7tBDdvmKaIUn/b/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP44C7OS0Jr7Mwrz7
 BrVlRAbjaowopUigvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlyXTVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkV4LjHOwFCHzBUOSX25WI553pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLZv3XSpLVPU6lmveqwIhPVgDnH1W+I8ubcqjk0TPPUS2PxZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLMu23Bs8n9SphVcHuVH7xs0UejU+UxP53X7M8fKU99fwlyvhxT
 vIffN6HDOgJQTPCkwnxp7GmxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:CnN2+K09zul8CFstclIcjQqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64652013"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5bHhga9rzY/beaHejJa3cg9AwmXMKw7GjXUVBBet5Hu44xUoz/sP2T8q5GtnEQU2ART5oeV/U/COoBHfYSpZpSPCK9L9fqnE0beVm0kKn9wB6ZjtNt25Q+uyEP/LIlCMlbKX+AasZED/THhMa8KEfzooig+KIWSavgzt74Sfn7/tDEkqsiLLq2r32SNDwJTWmOaysn0wD+32AwTaW1c1MEUAVF6u9yRexLpItUrIae86iRX3DSwTS4Ktcv9mUEY391Xlsc40/x/HlQ8qOOWPh3NtYVcX2Is92uc7kUp51dp4Gu5xZUscbPg70bPyDbU+dOBmxyoo9HsxHeoF9p+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1QC6A25OxxBe9hEOgbrdZsifJgbnoH/2o0b3shjwtA=;
 b=ZdeAZlCa9VcrSnBgMcpV7zElQVPTfXu5M0tfx7JU+7fslWmd8SqnS4bul97ToNEOu/eB5gxZJIwiHBIeRIzJfoPz9ckbd9VrXG4BDXE7sBjlYtcTwY79uogw9MX+jMkqiQWAqXJaiZOx2Q28BTNXjVXY9g2u3onMVAugAnY7/V3ql4IKnYmf2tAx4xXAYaj776G4a2Gw1UDoE7cncJqkFW3n0hDV48FRGGdoWR2YbE2Z/u9Pw1LISqMzKHleqQyFh222GC/mtag6G3+tyNhcVdRWJr2QLO09Fq3bSZU+u/9B9RmL9EeHIPE3SU2Q7y57b/06rSHwSl6xrUqnaDf26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1QC6A25OxxBe9hEOgbrdZsifJgbnoH/2o0b3shjwtA=;
 b=vQKEUJZnMTvSVJ0UqKBDMq6h+J/WY0bN2T28r5emjq61Gb2JbF6U3aXox/2MffYQkBQIXF+aYucOP9/dgNe5l/RTO9w/fNZ0kCkXJjsXdzpJianhnh3kMXzJVtn9leHsd027kNi/j+d3n7VcwOEAiZRtm89LEmUhk5ylGxiJo2o=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Thread-Topic: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Thread-Index: AQHYJwpOs0szyq0MVUKA4rk1u5+GKayd3CkAgAACGQCAAA9EAIAAILUA
Date: Mon, 21 Feb 2022 14:20:21 +0000
Message-ID: <f1b8cacb-54a4-0402-1302-7fece7e13292@citrix.com>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-3-andrew.cooper3@citrix.com>
 <YhN1pJIDIiJscvjF@Air-de-Roger>
 <ada67c6c-bcd5-9732-c3e0-76032692ad23@citrix.com>
 <YhOENAz/08oSD7WK@Air-de-Roger>
In-Reply-To: <YhOENAz/08oSD7WK@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdd5bdfe-027e-43ec-220d-08d9f5454b68
x-ms-traffictypediagnostic: DM5PR03MB3241:EE_
x-microsoft-antispam-prvs: <DM5PR03MB3241E59465B029B81824D42DBA3A9@DM5PR03MB3241.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K44Cs85S7H6zMl1F57h+YbrF0HXGIxuiTpYPe10RpTIGQf30QLrZ+O5hp5uQa2x7VwDtFSQDonMX4yNusSuCQHWFy3a1W0n9X8cWkKmkLsdnpuGv9MsIiXar+Go7YGOBg2/HHF0s8zotUixsc4mA9BAK6CaSPEpGPyclAdYL0z275Lwplfokv3fnglGjdyoMNALDU2WHoBOp0xvYXfmvHaDDO/UAxT/17RxZuZB3gcMt3j84ZT+ItRc92g6sNoo7voGLFV3U5jf0ygm1HBSgZqUXwaYOa9tSUIleqWznhdfIumPO1B/KkxmYst7LwuxFUxc7W0QH8qS+MpsUMF6k3MrUjvg049tPuENAva7LEyNwdGG9T4He+VqCvdHC9xGMWcZaWync0BJeJcuCo3C99b6vTlMth2rtZY5EhJoC+mIpzFpuvVF36bf2KAQms35qWIl5ZxHO2kjbxnVG/QsRy9OCMr7ZOEhPeXY3cZ0P833fRYpTb3eHTktYzuimRnxjW0uHx+1eNQDvYtzcCaDfsxDLtljpAQvC5/D/5GO6paGn8tT/cnPTHTXyD9nPfO/CGeinNV7ys47odLNUqniSTNb3AkuvKrRQ9MTOiAdHZsEkzjQrPkXj6qe0HntsVRsN5UetJFRKtxXTlg9XHDmphBDgF1KYjiMtoTRCtAZUcDcOJ0rzltq7Kv33/P7kceNcL4V2pr77WE7vXW0e4JGlHUI8ie+DFRey6BtZr8XOBnsJOQP8qXOTrQziXo4wI6ZY9waVxsz7PkKddnwfzEPgpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6636002)(37006003)(54906003)(26005)(8676002)(5660300002)(4326008)(66946007)(8936002)(186003)(91956017)(6862004)(66476007)(66556008)(66446008)(64756008)(76116006)(31696002)(316002)(122000001)(86362001)(82960400001)(6506007)(2616005)(31686004)(508600001)(38070700005)(6486002)(36756003)(71200400001)(2906002)(38100700002)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d08yS05zbE9lWEJHbXdueVhHYlpnRW02aC9tUXRWeml3US9hc2RsOVpieUFK?=
 =?utf-8?B?ak5BLzErRmJaL3FKL3FYc1NFREVoaDNmak9VNmRta3lIU0Q1RzBuQjdMRC9K?=
 =?utf-8?B?RFRVbkorb0EwNzJYblBKT2ZWKytXTmVVNTVrUjJQU1g5SGh0bEZWMUhmQVdG?=
 =?utf-8?B?aEM5bm9jOUFsRTJaVGZqNGwrbnNqR1pKQlRhRHg3bFY5VjFweUVpa1N1K3oy?=
 =?utf-8?B?ZHdhMGt1Mzh2Rzk0QnJXUkVjN0EydmovQTZOVk5yQldiLzlrSWlmYWxHY29y?=
 =?utf-8?B?K0pCb2hwSG5ZOXptR2kyZ1lrNzVrODBYWUV5TEhWdW1EbG5vY09ac0ZDSzZq?=
 =?utf-8?B?RW4zY2E3cnJncjFWWENNUlF1ajR3VFhuRTdTdFlaN24zV0E2RUFwdEN3MGYy?=
 =?utf-8?B?ejdmTDZjU3pERGlZeU01OFZOeHQ3TGVpVFdZbitIRTFZS1d2a2daT0ozYzAy?=
 =?utf-8?B?Zkp1MnJZL2xJdjBkb2xtYWt3dU9CL1R3bjFoc280c1ptbjB2VTQvTkJ1M0Vw?=
 =?utf-8?B?K3ZWdDVabjdOTk05dUIvU0NoQ2hDTFB3c0R3cW5oT2JpQ0l3RmdWM25qOCtt?=
 =?utf-8?B?OE9NcXk2QmhBU0hFUHJ3cTQ4a3QyZUJmdmdObmlmcWVOZ2FiVFN2aHRDYzVD?=
 =?utf-8?B?UmR3U0xLdk5nNnpsWFlnRkZOWkdrellJWWgyc0ZqYUphbk9QQjg0YTQ4WUZO?=
 =?utf-8?B?S2kwWVJkdk83NEZNL1p6eVlMbEVHRkp1Mi8raDFQTmRaNjR5QWsxSWVnSmlx?=
 =?utf-8?B?RFAvZkdkTXhaLzY5SFFhNDVia3YyeTU3MjBwU1dvTGZGV1c0QW1GR3NSaUdD?=
 =?utf-8?B?K3JMc0o4emQzUzJiMkJOU2ZRRXpSWCt2WXJ3aDBHM2ZzUG1RRjZpOWxxNGsr?=
 =?utf-8?B?c25DVnhsOHRiY0lnTXZLbnphd2dHOFVVTnp3SGRrK2xVNTJhdDVCVmhvTWJ1?=
 =?utf-8?B?WTZHUWUxeTFwUUllN04vTE41MXVldFFjMjBYR3pRK3AxbWhBN3VsY1dDZ2tp?=
 =?utf-8?B?Ulh2WUFFQm5zSzlYM1FsNXd3R3FyeDVlVkNNUDh6WGdnMGw4dFJLY3JCeW5W?=
 =?utf-8?B?YmMwRmpPM2dXMzAzK0FNS2w0K1J4cTV2bDNhSEZLUFZKQU5KWmxsOFowNnRP?=
 =?utf-8?B?S2s4L0V0OGdoTXJDc1o3TjZXRVY3T0ZMT0lqbWZxbkU3aXg3b0h4eW92eEVo?=
 =?utf-8?B?MTBuRjdsY015M0ZkdVRpNlo4SHZJUTA3NVQ2Q1dCcWVwK2hpbDB3dnUzVyt5?=
 =?utf-8?B?ZmxSam9KNzRTTVcwVzQzbWFvb0JqRXU4UGVLa3lhWWlqWVcvSVl1VGhuMjRP?=
 =?utf-8?B?WVh0TXRUQmRuY0txNlRZbkNSa2trYVJoM1VxaGRJd3JmdGk1Z2Y0a2xIcHZ3?=
 =?utf-8?B?eCtMT3ZSbUQ3c2xGWW03ZzF5VFJQeHQ4Q0huTTlTK0RBMVU3ZWtMWHhMRFlp?=
 =?utf-8?B?NG1TaWVkRWtUUkNPRERnNzZoNEN4L1NpVDBsNVBqRHcweTZpRWdzQWRZZXhH?=
 =?utf-8?B?V0FsMUxLc1BuUFV1MzhJaGxEUkVnUnp4MDBhckRTekw1djgyVE9OUHMwbU12?=
 =?utf-8?B?WUF3N3Z2cVk4YmFXMmdrOFdhVXhwVDFWdThGSXIvYzM3QXlmQW9ER0laeERj?=
 =?utf-8?B?TW1WaUJxVTBEY1FIVXNQZ09LYnZseU8wZmRjTnBURE5XNFl2dzJSaE1rMHhB?=
 =?utf-8?B?KzM1RERJWkVLSklFT1VLdy95US80ZTBaaGNSRndZUHpodW4rUW1FbmRscEJV?=
 =?utf-8?B?aHRXUDFTY0dOQnFLUnJvMXc0T3I2TVpLVnhuYlo2a09nUG9qRWRybE5KZlk4?=
 =?utf-8?B?K0dZWFhBZVJYNlEzaHBJcnBlR2xORHBSNlEzbHdwRkw5UUQvSUd6Uk10QWMw?=
 =?utf-8?B?eTJmYzlnb1RBa0N1SWo3R1dzb01yZmN6NHJwNzhtY3pMY09HODMrZVNDQTV1?=
 =?utf-8?B?RzZDN3JVMGxFY3hGbk1EYXdBRnJvZGh2TkZ3bHV1dXlpS2E2clBtU3hJUm43?=
 =?utf-8?B?U1JqNnRFamxxSVZxN3hWRE1WVUEvRnlGZi9jN21vazNpL1E2emlBMWdGamdj?=
 =?utf-8?B?Vm82ckhyYzFkeXZaT2N6RzQzQ2NUV2lUNjFtMFVWN09BMXE2b2tUbjBJb3lj?=
 =?utf-8?B?YVpyRmJIZ2JyR2NERnVxb3h3UDJQeS9PbzJEeFFoMmNlWmljbkZDRVRLVU44?=
 =?utf-8?B?QjJ1dmFMN0Q2Nk8reE1iQ3NxMHF5K1Y2UlVjdjk2VzdFaTBHT0ZUWkNORTZT?=
 =?utf-8?B?QUdYalJXY2drQ05QQ24wa2NvbExnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE8663EEDAD2794B8BF0522A127CA4CC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd5bdfe-027e-43ec-220d-08d9f5454b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 14:20:21.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jPP66eBiIVxIJPNJfoTNXPEvmPvTKn5suVbbKJ+J+CgxW6Qo+7E9hu6n3laoh4BfpeWYSXTd9fE9u93X+tV7n0gYTABStejDE8n+841zeHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3241
X-OriginatorOrg: citrix.com

T24gMjEvMDIvMjAyMiAxMjoyMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBNb24sIEZl
YiAyMSwgMjAyMiBhdCAxMToyODozOUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
T24gMjEvMDIvMjAyMiAxMToyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBNb24s
IEZlYiAyMSwgMjAyMiBhdCAxMDowMjo1M0FNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
Pj4+PiBDb3Zlcml0eSByZXBvcnRzIHRoYXQgdGhlcmUgaXMgYSBtZW1vcnkgbGVhayBpbg0KPj4+
PiBpb3JlcV9zZXJ2ZXJfYWxsb2NfcmFuZ2VzZXRzKCkuICBUaGlzIHdvdWxkIGJlIHRydWUgaWYg
WGVuJ3MgaW1wbGVtZW50YXRpb24gb2YNCj4+Pj4gYXNwcmludGYoKSBoYWQgZ2xpYmMncyByZXR1
cm4gc2VtYW50aWNzLCBidXQgaXQgZG9lc24ndC4NCj4+Pj4NCj4+Pj4gUmVuYW1lIHRvIHhhc3By
aW50ZigpIHRvIHJlZHVjZSBjb25mdXNpb24gZm9yIENvdmVyaXR5IGFuZCBvdGhlciBkZXZlbG9w
ZXJzLg0KPj4+IEl0IHdvdWxkIHNlZW0gbW9yZSBuYXR1cmFsIHRvIG1lIHRvIHJlbmFtZSB0byBh
c3ByaW50ay4NCj4+IFdoeT/CoCBUaGlzIGluZnJhc3RydWN0dXJlIGRvZXNuJ3QgZW1pdCB0aGUg
c3RyaW5nIHRvIGFueSBjb25zb2xlLg0KPiBSaWdodCwgYnV0IHRoZSBmIGluIHByaW50ZiBpcyBm
b3IgcHJpbnQgZm9ybWF0dGVkLCBub3QgZm9yIHdoZXJlIHRoZQ0KPiBvdXRwdXQgaXMgc3VwcG9z
ZWQgdG8gZ28uIFNvIHByaW50ayBpcyB0aGUgb3V0bGllciBhbmQgc2hvdWxkIGluc3RlYWQNCj4g
YmUga3ByaW50Zj8NCj4NCj4gSSBjYW4gYnV5IGludG8gdXNpbmcgeGFzcHJpbnRmIChhbHNvIGJl
Y2F1c2UgdGhhdCdzIHdoYXQgTGludXggZG9lcw0KPiB3aXRoIGthc3ByaW50ZiksIGJ1dCBJIGRv
bid0IHRoaW5rIGl0J3Mgc28gb2J2aW91cyBnaXZlbiB0aGUgcHJlY2VkZW50DQo+IG9mIGhhdmlu
ZyBwcmludGsgaW5zdGVhZCBvZiBwcmludGYuDQoNClRoZSBuYW1pbmcgaXNuJ3QgaWRlYWwsIGJ1
dCB0aGlzIGlzIFhlbidzIGxvY2FsIHZlcnNpb24gb2YgdGhlIHRoaW5nDQpjYWxsZWQgYXNwcmlu
dGYoKSBpbiB1c2Vyc3BhY2UuDQoNCk5hbWluZyBpdCBhbnl0aGluZyBvdGhlciB0aGFuIHhhc3By
aW50ZigpIGlzIGdvaW5nIHRvIGJlIGV2ZW4gbW9yZQ0KY29uZnVzaW5nIGZvciBwZW9wbGUgdGhh
biB0aGlzIG1lc3MgYWxyZWFkeSBpcy4uLg0KDQo+Pj4gIEkgYXNzdW1lDQo+Pj4gdGhlcmUncyBu
byB3YXkgZm9yIENvdmVyaXR5IHRvIHByZXZlbnQgb3ZlcnJpZGVzIHdpdGggYnVpbHRpbiBtb2Rl
bHM/DQo+Pj4NCj4+PiBJJ3ZlIGJlZW4gc2VhcmNoaW5nLCBidXQgdGhlcmUgZG9lc24ndCBzZWVt
IHRvIGJlIGFueSBvcHRpb24gdG8NCj4+PiBwcmV2ZW50IG92ZXJyaWRlcyBieSBidWlsdGluIG1v
ZGVscz8NCj4+IE5vLCBhbmQgd2UgYWJzb2x1dGVseSB3b3VsZG4ndCB3YW50IHRvIHNraXAgdGhl
IG1vZGVsIGV2ZW4gaWYgd2UgY291bGQsDQo+PiBiZWNhdXNlIHRoYXQgd291bGQgYnJlYWsgYXNw
cmludGYoKSBhbmFseXNpcyBmb3IgdXNlcnNwYWNlLg0KPiBXZWxsLCB3ZSBjb3VsZCBtYXliZSBm
aW5kIGEgd2F5IHRvIG9ubHkgZW5hYmxlIHRoZSBmbGFnIGZvciBoeXBlcnZpc29yDQo+IGNvZGUg
YnVpbGQsIGJ1dCBhbnl3YXksIGl0J3MgcG9pbnRsZXNzIHRvIGRpc2N1cyBpZiB0aGVyZSdzIG5v
IGZsYWcgaW4NCj4gdGhlIGZpcnN0IHBsYWNlLg0KPg0KPiBDb3Zlcml0eSBjb3VsZCBiZSBjbGV2
ZXIgZW5vdWdoIHRvIGNoZWNrIGlmIHRoZXJlJ3MgYW4gaW1wbGVtZW50YXRpb24NCj4gcHJvdmlk
ZWQgZm9yIHRob3NlLCBpbnN0ZWFkIG9mIHVuY29uZGl0aW9uYWxseSBvdmVycmlkZSB3aXRoIGEN
Cj4gbW9kZWwuDQoNClRoZXJlIGlzIG5vIHdheSB0byBkaXNhYmxlIHRoZSBtb2RlbCBmb3IgYXNw
cmludGYoKS4NCg0KfkFuZHJldw0K

